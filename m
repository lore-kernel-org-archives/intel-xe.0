Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38BCC88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 14:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607DF10EF21;
	Mon, 14 Sep 2026 14:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxE0794R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D890510EF21
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789396816; x=1820932816;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D2l8PAgI94DSZ+VUCwal/hbYJBcp1fKGhzfhgGmzocM=;
 b=OxE0794RtzxnydkTCDp18uyabHphTNwwUTzT0lhBTfJ3wfFqK/SpBfGL
 3+klzCxB6FhMVZWso3LP5ewG9+ddRLeP5MNPreT0wdRpbul4QFVVFjz3T
 L6ugF912z/kmLpwcR+tqPp06hx2ggprwmP1Bm3usKdWnsprZJqfOwKD/A
 ryAdoXcgp7taooGIzonlBC/QtcmLVOd7plPaoIJHu5vJmvZypFEuhAjTv
 wV78Ehz+66hBzmVdXwpmM82OXuqEun39zyiHf/A9mxMUrnac6eDZo7Ybi
 esge6Bw338ghQZDWywIaNPQmyajcdsbzUP23fThKrdg85jBogovASwMY8 w==;
X-CSE-ConnectionGUID: N5lcXyK3STKgRScKJk6fXg==
X-CSE-MsgGUID: qyz+ieInS+OibP6AMRBAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88690712"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88690712"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 07:40:16 -0700
X-CSE-ConnectionGUID: gm5pGuJvTDuunFslT7R7Eg==
X-CSE-MsgGUID: oD2WaTGgRaeUTlwWkPAvnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277925831"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.118])
 ([10.245.245.118])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 07:40:14 -0700
Message-ID: <4d5b3732-948b-4260-b40c-41461d40bda3@intel.com>
Date: Mon, 14 Sep 2026 15:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix shrinker accounting double-subtraction on
 nested external pins
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
References: <20260914134540.385186-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260914134540.385186-1-thomas.hellstrom@linux.intel.com>
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

On 14/09/2026 14:45, Thomas Hellström wrote:
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
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.15+
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
