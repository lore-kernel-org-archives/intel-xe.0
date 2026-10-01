Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37818CA5FCF
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 17:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C864410E3C1;
	Thu,  1 Oct 2026 17:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HABZoNh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BF010E3C1
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790876080; x=1822412080;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xo6UHjWsVLM0Nkkoj8sdGO+2Ka0wElQfBV+oBSFOuyw=;
 b=HABZoNh082cMlEMx9X8yC1YVG6e+ax3Vc2+KItr/QbA9rGZMSO56ydZo
 etbDZNAaOktyYwtwoR0q9/JVu/SqNMBDwznHdSmKs+vBPBdklfMi3hzWe
 oXE64PkNJONrDSToUSDBOWy0gVc4KJ0VL2yrYuFtT4jVPbp/GVxSSpPbD
 W9aJDau6Hqkd+lIRGy7AMyioNwmSpTeIQYi2SJDApFi+fDmQmDrNwISZp
 IflOqsfv2OICFJRn0oolGyvZYRaZah5pQC7ZHzA5rWcs80Wq5vNW5vvIF
 MagV1Y4FBsjwD0IfXdEJtWJWjUYp0NRgOrQ39msc1iRb7By/z2Plqs2Sy g==;
X-CSE-ConnectionGUID: dBCaBoLhTgmCVFbP8AlRHA==
X-CSE-MsgGUID: Q2DxkQe+RLaE348EEvJa+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101803985"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="101803985"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 10:34:40 -0700
X-CSE-ConnectionGUID: Ui4ED4q/Q0+0LuwR/ccflA==
X-CSE-MsgGUID: tFu3J6Z3SmKu56z9537ZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="276107560"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.244.54])
 ([10.245.244.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 10:34:33 -0700
Message-ID: <6aed4ffa-bfa4-44d0-a4a2-5181e9208016@intel.com>
Date: Thu, 1 Oct 2026 18:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Fix shrinker accounting double-subtraction
 on nested external pins
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
References: <20261001134018.111553-1-thomas.hellstrom@linux.intel.com>
 <20261001134018.111553-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261001134018.111553-2-thomas.hellstrom@linux.intel.com>
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

On 01/10/2026 14:40, Thomas Hellström wrote:
> xe_bo_pin_external() and xe_bo_unpin_external() support nested pins,
> since the underlying ttm_bo_pin()/ttm_bo_unpin() maintain a pin_count
> refcount rather than a boolean. However, the shrinker accounting calls
> xe_ttm_tt_account_subtract() and xe_ttm_tt_account_add() are invoked
> unconditionally on every pin_external()/unpin_external() call, instead
> of only on the transition into and out of the pinned state.
> 
> An external BO (dma-buf) can be pinned more than once while already
> pinned, for example when it has multiple attachments/importers, each
> independently calling xe_bo_pin_external(). Each such nested pin
> subtracts the BO's pages from the shrinker's accounting again, even
> though the BO's pages were already removed from consideration by the
> first pin. Symmetrically, each nested unpin adds them back again
> before the BO is actually unpinned. This desynchronizes the
> shrinker's page and object counts from reality, and since they are
> declared as signed long but interpreted as unsigned long in
> xe_shrinker_count(), the underflow can turn into an enormous
> shrinkable/purgeable page count, causing the shrinker to be invoked
> excessively under memory pressure.
> 
> Guard the accounting calls with the same pin-count transition checks
> already used to guard the pinned_link list maintenance, so accounting
> is only updated on the outermost pin and the final unpin.
> 
> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.15+
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v1
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

