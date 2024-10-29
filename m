Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A416D5B16F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 08:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A3510E5DA;
	Tue, 29 Oct 2024 08:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ren3Y7sq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF87810E5D6;
 Tue, 29 Oct 2024 08:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730191901; x=1761727901;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=n6onV6/BiaADTLrX3KrmbJOVfC9S+rusBTg8OfpUYJo=;
 b=Ren3Y7sqkB2xAk/jbyHPC4lsvowtnZjgiRWmaFIWAvoejdzDdq2w7g+u
 0T6miNLzC9H4ddx6WNMD9FzhrbRFidhTLFW6VemB1R7CF5ppzkjP1HCem
 fRnWnAMi6vpOeRt7rX1kH4FqBh6eg4SXBWPlvjb1fNPLbbbcO7WUBgj6V
 LSZpszaPfQkreG3DLwxRzP8sSZvxnxXyeHrnYaVkJKAd0QhSsthTC0yUL
 4nHZAKuQLHqoFdbZ514bfZNYFm4+yzYlYtUC4MJjX6neXwIsft8Ygm4nt
 YIOay99P3JRioQo2ot5BKaf63fhZKuOC3KwXMsNyJegG1Lr5EmRHIJ1dB Q==;
X-CSE-ConnectionGUID: lLNfvBUrQdSsqQPFNCZeGg==
X-CSE-MsgGUID: FiDtEcNSR72mJFOZBDuNQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29937077"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="29937077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 01:51:41 -0700
X-CSE-ConnectionGUID: pjFrxPunTvyRwoqGtsPVtA==
X-CSE-MsgGUID: puwKoQmuQQKKIF8AVZT9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="112699566"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 01:51:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v2 0/3] drm/i915 & drm/xe: shared PCI ID macros
In-Reply-To: <Zxe_BOBoy8H_ub09@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1729590029.git.jani.nikula@intel.com>
 <Zxe_BOBoy8H_ub09@ashyti-mobl2.lan>
Date: Tue, 29 Oct 2024 10:51:35 +0200
Message-ID: <87sesfnvfs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 22 Oct 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Jani,
>
>> Jani Nikula (3):
>>   drm/i915/pciids: add PVC PCI ID macros
>>   drm/intel/pciids: rename i915_pciids.h to just pciids.h
>>   drm/xe: switch to common PCI ID macros
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks. Rodrigo, Lucas, ack for merging via drm-intel?

BR,
Jani.

>
> Andi

-- 
Jani Nikula, Intel
