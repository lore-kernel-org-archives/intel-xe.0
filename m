Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBEBCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 11:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12D910E0B1;
	Tue, 21 Oct 2025 11:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bv5BnaFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D528110E0B1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 11:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761047478; x=1792583478;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5j/YB3SmiS2PVyl6pntuIgSnR10JMy0NbKmDP9VCHHk=;
 b=Bv5BnaFPzbVV1gj9cVQiAsMtm6BzK27pBOKiSIDWwoQmZSkwpNKjEfQq
 2mG9GqMFLfi8lHSX3pRTWJ6szUbATsYI5p7LoG4Ztl0KQWH2mkzY14Slv
 b6aL27PwP0jEDl/FYi4NG7SMTB7XUK1Uui9qdpWF8ZERn/DCWegTUXDGE
 9lq9Nxm8qJctTbXOgabdaNNrhR3P0rhbjm0/VZQXr5wmUaA48JLxmHTno
 BpdrEn3VKdxk/6rp5bEuW5Wp+G8D5vfnCczHtED3vPAzg7Og25dBlYzDZ
 9tISP8IwmJao/8TCpm2xB5Vsi/2HnkEun1rub3ylThr9I1pp7AfMc5csN A==;
X-CSE-ConnectionGUID: zWd0bhWRT6uKVM6ZtQBd0A==
X-CSE-MsgGUID: E2D+sg/PRfahAiLlVm5IGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80795501"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="80795501"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 04:51:18 -0700
X-CSE-ConnectionGUID: 0ErYwJAiRWGoOpYd3DtJAg==
X-CSE-MsgGUID: eApjLwGBTC+FQH9r9IeOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="183279038"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.183])
 ([10.245.245.183])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 04:51:16 -0700
Message-ID: <d9e25945-ca04-49fe-bd9f-96995817f76b@linux.intel.com>
Date: Tue, 21 Oct 2025 13:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/display: Make panic support work on vram.
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Jani Nikula <jani.nikula@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20251016075701.379023-1-jfalempe@redhat.com>
 <20251016075701.379023-3-jfalempe@redhat.com>
 <5e285430-fd5e-4cd1-82b1-2b84b4eb3808@lankhorst.se>
 <ade5c380-2f43-4c3e-b63e-75d6f384ba6a@redhat.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ade5c380-2f43-4c3e-b63e-75d6f384ba6a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thanks, pushed!

Den 2025-10-18 kl. 00:18, skrev Jocelyn Falempe:
> On 17/10/2025 17:35, Maarten Lankhorst wrote:
>> Hey,
>>
>> Thanks for resubmitting, wnat me to push it?
> 
> Yes, please.
> 

