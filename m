Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C96CCA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 11:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C6610E67E;
	Tue,  2 Sep 2025 11:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apDoZuAj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B149710E67E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756813536; x=1788349536;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VJR6ejNydKtend2W9OJCQCt4N74aEA5gY7zIWN6Im5c=;
 b=apDoZuAjKQpWFbBjFi4toNQdnK0qousA1K3j56hulYyHvf/CeTCgcO8A
 BvHy31dFusj7zKRlW5/ebRBPT1juh+E0kAZuAxAc13ccCpQIfQRmVn5VD
 1uMs2ANaWXSz2ER8p6AmeElA1L9VxxrpoBwUHZcbSSAfnfp03509vquxk
 VfoSOax08HZ9KW+MeMb2FAsWKXP2suqF57Z09oi0cUaLJvxxyEpT0xxRx
 zy6bbSOgexbmSzR+Pq2ENOtFnvlweKyniv3ZRF5uiARzXkTT/i5mL5o/F
 Ek5BwAOvNW2L1OiRqUTeizuyavIVpm+rLVeMOQTvIp74IdkjepBy4uwKW w==;
X-CSE-ConnectionGUID: 9g+TfKukTEOl6BrEEMf6iw==
X-CSE-MsgGUID: vylpbULhSjeZSjr0usrtXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61723670"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="61723670"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 04:45:36 -0700
X-CSE-ConnectionGUID: HY6MteJpR9CiMJs6geDZCQ==
X-CSE-MsgGUID: dEDbT+FeSr+pCdOtcecmgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171696062"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.71])
 ([10.245.245.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 04:45:35 -0700
Message-ID: <6cc837f4-ed1d-4c42-b8c9-46514e5084f7@intel.com>
Date: Tue, 2 Sep 2025 12:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Attempt to bring bos back to VRAM after
 eviction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250901083829.27341-1-thomas.hellstrom@linux.intel.com>
 <20250901083829.27341-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250901083829.27341-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 01/09/2025 09:38, Thomas Hellström wrote:
> VRAM+TT bos that are evicted from VRAM to TT may remain in
> TT also after a revalidation following eviction or suspend.
> 
> This manifests itself as applications becoming sluggish
> after buffer objects get evicted or after a resume from
> suspend or hibernation.
> 
> If the bo supports placement in both VRAM and TT, and
> we are on DGFX, mark the TT placement as fallback. This means
> that it is tried only after VRAM + eviction.
> 
> This flaw has probably been present since the xe module was
> upstreamed but use a Fixes: commit below where backporting is
> likely to be simple. For earlier versions we need to open-
> code the fallback algorithm in the driver.
> 
> v2:
> - Remove check for dgfx. (Matthew Auld)
> - Update the xe_dma_buf kunit test for the new strategy (CI)
> - Allow dma-buf to pin in current placement (CI)
> - Make xe_bo_validate() for pinned bos a NOP.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5995
> Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.9+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
