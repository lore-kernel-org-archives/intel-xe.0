Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C654C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 07:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02D810E684;
	Wed, 25 Jun 2025 07:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMNi3brl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF6C10E684
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 07:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750837914; x=1782373914;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rFdkeOxwvuXkTdgNl4trhfDN6vvt4f0HPT4stRCF1y4=;
 b=QMNi3brlMUQNgrzB4I3DwOVCedeaSuFXpRJ7i3PPN3dOg2u8mQv5fu0n
 kc/UaybbKgNK53DH/5+tlJ0lzuFOKywRXZQposcdLTAtzeWjrpaVWMyPt
 Cs8PXoYRg+FSE8B3wmTJhPf4rKyZe9mQl697LoZ8XFcE3Tt3Iv5lqOAjI
 CEaBNPzH2yRy4W0XWILxatLqz0fGckD2u2rlicfWmIjgVYppq9uE+wkgQ
 MS0fHy7fkL5ELBJZed0IpF8ibzfn/Sul/0OZF0j6u2BpZSt+y1FpTl4TB
 O9gRBq/1Mn/DLE7cVGJVnusbrdZUFklonjXS/48SmnPtXTQWJma6wBfWb w==;
X-CSE-ConnectionGUID: iZhXIM1RTE2AG6i1XqDmZw==
X-CSE-MsgGUID: RnjtPoqwT4e67wM8AUZG3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64154923"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="64154923"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:51:53 -0700
X-CSE-ConnectionGUID: eHBQ+8edR4edmiauCKzlwg==
X-CSE-MsgGUID: f/AkimGBQAq5itNF/Zs4IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="156546071"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 25 Jun 2025 00:51:53 -0700
Received: from [10.245.114.147] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.147])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9AA2832CA4;
 Wed, 25 Jun 2025 08:51:51 +0100 (IST)
Message-ID: <00cb4682-ce84-4914-b487-c52a6352f6ba@intel.com>
Date: Wed, 25 Jun 2025 09:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Explicitly exit CT safe mode on unwind
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
 <20250612220937.857-3-michal.wajdeczko@intel.com>
 <aFnHMVSx8FRrT110@intel.com> <aFrFDV6ghPUHfWLI@lstrano-desk.jf.intel.com>
 <aFsY65GdKwZA1HZU@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aFsY65GdKwZA1HZU@intel.com>
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



On 24.06.2025 23:30, Rodrigo Vivi wrote:
>> The code looks correct to me.
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> I was going to push this right now, but it looks it needs a rebase now...

thanks, but there is no need to rebase, it's already merged ;)

