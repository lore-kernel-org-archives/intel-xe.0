Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E80CA5FCF
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 17:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A9710E233;
	Thu,  1 Oct 2026 17:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xxac1UvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAEC10E233
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790876666; x=1822412666;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zHqd7QjbJisb1OxTDd16xV189s2QN2BXGOp3wOvu2i0=;
 b=Xxac1UvIl3/PmP6TzfPq7GAKf2BslX+/CVY3+r4HpcgojQRChIqmjQj+
 QXyyJv/OHi8lggAdYHrCMEj6GEwJDzZNwOZLg/uOD8Vp+Z7Q82Wr8Hjea
 3gYVRVShi/UIOLPFOul5cgOm3ne6MR3dm2zGnBFRtgvEEC2NgrukHPC3+
 18CI4DA3nJ5y+jIjkQfDK5Nw4MjxgUQGlrF5G0zLH1rB44Wrc+DBDjDih
 4pzkDwmL+uBtAuM8gAi+/Sp5jf2D+tnOI+LXvUViVoWItamT+rb3mv5xV
 r9uG4ObUbRzZpe9AUiuI0QLL7R5ASN1QPTyTUGchQs8tzMlqTUSVDDddf g==;
X-CSE-ConnectionGUID: arNyQEyOTLO5iWi3b2aReg==
X-CSE-MsgGUID: JdGZtURtRLK2X4CkUYwEcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102165682"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="102165682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 10:44:25 -0700
X-CSE-ConnectionGUID: W+j+l9WbTPmM+YFaCXKPBg==
X-CSE-MsgGUID: gmfdfWXRS7C2OQrao0T8MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="274686395"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.244.54])
 ([10.245.244.54])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 10:44:24 -0700
Message-ID: <85663499-b6bd-40b6-9fbc-062393e809df@intel.com>
Date: Thu, 1 Oct 2026 18:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Fix stale pinned_link entry when fb-pin
 performs the final unpin
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
References: <20261001134018.111553-1-thomas.hellstrom@linux.intel.com>
 <20261001134018.111553-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261001134018.111553-3-thomas.hellstrom@linux.intel.com>
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
> xe_bo_pin_external() and xe_bo_unpin_external() maintain the bo's
> pinned_link list membership in xe->pinned.late.external, based on
> whether the current call is the outermost pin or the final unpin.
> However, the same external bo's pin_count can also be raised and
> lowered directly by __xe_pin_fb_vma()/__xe_unpin_fb_vma(), which pin
> the bo as a display scanout buffer without going through
> xe_bo_pin_external()/xe_bo_unpin_external() at all, and have no
> notion of, or ownership over, pinned_link.
> 
> If a bo is pinned both externally (e.g. dma-buf export) and as an fb,
> and the external unpin happens first, xe_bo_unpin_external() correctly
> observes pin_count > 1 and leaves the bo on pinned_link. When the fb
> unpin later performs the true last unpin (pin_count 1 -> 0), it never
> touches pinned_link, leaving the bo linked on xe->pinned.late.external
> indefinitely. Once the bo is subsequently freed, this stale list entry
> points into freed memory, corrupting the list and risking a
> use-after-free the next time the list is walked or spliced.
> 
> The backup object pin/unpin sites in xe_bo_notifier_prepare_pinned()/
> xe_bo_notifier_unprepare_pinned() have the same bypass characteristic,
> though they never add their bo to a pinned list, so are not affected
> by this particular list-corruption issue.
> 
> Move the pinned_link removal into xe_bo_account_unpin(), which already
> runs on every unpin path (kernel, external, framebuffer, backup
> object) right before the true 1 -> 0 pin_count transition. Since
> list_del_init() only operates on the node itself, this removal is
> list-agnostic and safe to perform regardless of which list (external
> or kernel_bo_present) the bo happens to be linked on, or which code
> path is performing the final unpin. Drop the now-redundant explicit
> list_del_init() calls in xe_bo_unpin_external() and xe_bo_unpin().
> 
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.8+
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
