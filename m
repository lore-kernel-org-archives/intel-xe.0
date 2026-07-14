Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7BAC44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C267010E054;
	Tue, 14 Jul 2026 10:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/s0dNuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E2310E052
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784025619; x=1815561619;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=F/z60vj5fld/hPhv69d5TT+PkGW/dAdHGrp0F1SvqOg=;
 b=M/s0dNuVbvkMjFpDFwwQBHdDuktuLMTMePm4+MlMBWBEuREjIc87ohtU
 rhIbkKSljjiXxcJeYpUDs6XlITbLXZ+SHyJDaD8GDioP6caUzaXfo1LkN
 nrD21XIm78tPQA24zAR4q3ECmEzJuSRRIUK7/+B9bBnbdhR7Xv2gw7VQ0
 giOzRxp5++hUbToecCpdts05GInX2dYHvqaYVPg2NWicrqX9pyUnTPQMW
 F8BX3VXVgPWLaBTRBm/j+X/xLF8MZBeiv0vEsigPU8+4oVcht20Lr/+Yd
 L2DWQcPxwFHj0vWxP62RzaVnL4KyjfAcSBSFM6VVIZCxqVzmo6KuAko38 A==;
X-CSE-ConnectionGUID: wZvpymiYT62zlFhUn4Hpeg==
X-CSE-MsgGUID: XcgTV4PcRXm3yP0yY9yx5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84424233"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="84424233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:40:19 -0700
X-CSE-ConnectionGUID: N7l+lyzYRHC3MRgyIHvzaQ==
X-CSE-MsgGUID: q2ZxIzQMTRqbVZcGGKqDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="253198916"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.251])
 ([10.245.245.251])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:40:17 -0700
Message-ID: <bd276e22-10b7-4bdb-9703-5f3047dd0ae6@intel.com>
Date: Tue, 14 Jul 2026 11:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/migrate: Revamp PAT index selection for migrate
 PTEs
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
References: <20260710083004.1546599-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260710083004.1546599-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 10/07/2026 09:30, Sanjay Yadav wrote:
> Improve PAT index selection logic in xe_migrate.c to avoid unnecessary
> coherency overhead when host-side memory is uncached. Previously,
> we defaulted to XE_CACHE_WB, which enforces 2-way coherency and may
> trigger cacheline pulls from CPU even when host-side memory is never
> dirty.
> 
> This change introduces xe_migrate_pat_index() to choose the appropriate
> PAT index based on the actual TTM caching mode of the buffer object
> being mapped. For iGPUs with WC host mappings, we now prefer
> XE_CACHE_NONE to skip coherency snoops. For compressed PTEs on newer
> platforms, we select XE_CACHE_NONE_COMPRESSION.
> 
> This avoids unnecessary cache traffic for uncached host mappings.
> 
> v6: (sashiko)
> - Only apply the BO's host-side caching for system-memory PTEs.
> 
> v5: (Matt A)
> - Simplify emit_pte() to derive caching from res->bo directly, removing
>    the separate bo parameter
> - Leave changes in __xe_migrate_update_pgtables() and
>    build_pt_update_batch_sram()
> - Fix comment about page-walker coherency in xe_migrate_pat_index()
> 
> v4:
> - Keep xe_migrate_prepare_vm() on XE_CACHE_WB since page tables require
>    page-walker coherency.
> - Pass BO into emit_pte() and select PAT attributes from the BO's TTM
>    caching mode.
> 
> Assisted-by: GitHub Copilot:claude-opus-4.8
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
