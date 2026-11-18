Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCEE606A338
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AEhw4hZ8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F5010FBA2;
	Wed, 18 Nov 2026 12:28:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1366C10FBD1
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795004901; x=1826540901;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Mc20LcFaf3kWRIkiRacLar+8BHTsGWeYePLFWeyR5Vg=;
 b=AEhw4hZ8glOYpIEVafD+cvb8sgLUeEu286Z8EEuvdBKzwzLrocm9ELBC
 cTAqdp/S5ajMWOj5UMm8iabQlVVdo6ol+t2vUECt7nvP9XPBKbXrL5u1V
 I59H6RTDRMtBKDM22hPyTaTgXS3rGuja1hUxn/N4TiJ95fvI1wQx9Lc2x
 3GHf9zLWPv7WPfT4kM/lQhfojVYaKKMfZ1qfxakpa0xbgYNEhwu0Lrjwf
 sK87RMdaPtbp/yitVdRbzx1jCQW05Dj1+WBsNq48P3tsTnxCrBREjxzPG
 UeZP95Lsytv9f4B850hFR7pk76z4HZ9kJAv7lCV4x2LMV1M6LP7w7erjm Q==;
X-CSE-ConnectionGUID: ar6i1YYWTBCB+uyFuNox6w==
X-CSE-MsgGUID: UkhDb+hqTL6eGUxkiMAwnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3825894"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3825894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:28:21 -0800
X-CSE-ConnectionGUID: Ya8p6MlwTiuDQQA2IOFYmw==
X-CSE-MsgGUID: n6Ted8hGS8OT5ixoW5Mz4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10218657"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.206])
 ([10.245.244.206])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:28:19 -0800
Message-ID: <9b3b3b18-27f4-4099-b495-1a44a77c00d9@intel.com>
Date: Wed, 18 Nov 2026 12:28:16 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't zap imported bo page-tables on L2 flush
 optimized hw
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20261118122011.487537-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261118122011.487537-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 12:20, Thomas Hellström wrote:
> Invalidations of imported buffer objects originating from the dma-buf
> invalidate_mappings() callback may run without a runtime pm reference,
> and obtaining one from that context may not be possible. However, on
> L2 flush optimized hardware, xe_bo_trigger_rebind() would, also for
> non-fault-mode VMs, wait for idle and zap the page-tables and flush
> the TLB using xe_vm_invalidate_vma() in order to ensure the L2 cache
> is flushed.
> 
> For imported buffer objects this is not needed, since the vm_bind
> ioctl already restricts them to PAT indices that either ensure no
> data for their pages is kept cached in L2, or that are 2-way
> coherent, making a flush unnecessary. So, for non-fault-mode VMs,
> skip the invalidation for imported bos and rely on rebind on next
> exec, as is done on hardware that isn't L2 flush optimized.
> 
> The patch and changelog were prepared with the help of an LLM.
> 
> Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v7.1+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

