Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90249CAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 20:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503A610E094;
	Tue, 23 Sep 2025 20:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNNncGeU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EC910E32F
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 20:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758658381; x=1790194381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aW/cnjGvu9LlM+Hk8h+RUQuBu1VWqnILdQWBY+VKxNw=;
 b=PNNncGeUjJSiuOTqWnon063m48BntinILSoLnNAM3W1QW+zCsOqODk3I
 0rUYlNzMsrV+XmwoHJuz+7XmuVeecKbCjZ/GW77QGsQ3D3c4DCcy3TEra
 uBEwMCYl5uht7OXqYr7W9v7wmSXe7U0tryb8dXf66bRpItun8rAgesjFv
 GVJniBlCSagjzR6NokyOma8VBAHip/hG6+GCnAKu9D9+0wbJKMWjWuF1h
 VSloskH6HoJ6+2nh9SihtDeQelMzhC3dRsvNMaijdTCtW8pU6PxZdEfWf
 gCK8WhhT6McdXOjB+zub8G1b2s7pLkE3OMFsntzaNL/EnlbTF+4CvD7hK w==;
X-CSE-ConnectionGUID: k5cqXFl3S3Soh05ApWOg/w==
X-CSE-MsgGUID: Iu1mYFrMTbK7Pg/Dw3nrNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64780614"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="64780614"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 13:13:00 -0700
X-CSE-ConnectionGUID: IfLMUEPmTgSi/OiMLc9Cfw==
X-CSE-MsgGUID: 5E2NE2MpS266Ff8SThYymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="181164552"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 13:12:58 -0700
Date: Tue, 23 Sep 2025 23:12:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v12 00/13] AuxCCS handling and render compression modifiers
Message-ID: <aNL_RgLy13fXJbYx@intel.com>
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 23, 2025 at 11:07:53AM +0100, Tvrtko Ursulin wrote:
> A series to fix and add xe support for AuxCSS framebuffers via DPT.
> 
> Currently the auxiliary buffer data isn't mapped into the page tables at all so
> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
> had to disable the support.
> 
> On top of that there are missing flushes, invalidations and similar.
> 
> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
> 
>   [PLANE:32:plane 1A]: type=PRI
>           uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>           hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
> 
> Display working fine - no artefacts, no DMAR/PIPE faults.
> 
> All IGTs pass for me locally.
> 
> v2:
>  * More patches added to fix kms_flip_tiling.
> 
> v3:
>  * Rebased after some cleanup patches from v2 were merged.
>  * Added people to Cc as suggested by Rodrigo.
>  * Adjusted last patch title. (Rodrigo)
>  * Apply GGTT flushing only to iomapped system memory buffers.
> 
> v4:
>  * Added patch for potentially misplaced Wa_14016712196.
>  * Fixed (hopefully) MAX_JOB_SIZE_DW on Meteorlake.
> 
> v5:
>  * Split out ring emission changes to smaller patches.
>  * Fixed MAX_JOB_SIZE_DW even more.
>  * Don't emit MI_FLUSH_DW_CCS on !BCS. This should fix Meteorlake.
> 
>  v6:
>  * Added AuxCCS invalidation to indirect context workarounds.
>  * Also added the indirect context handling and some other workarounds. They are
>    unrelated but the series depends on it.
>  * Dropped DPT pin alignment reduction since BMG appears not to be liking it for
>    some reason.

I was wondering where that went. Someone should actually debug
that instead of leaving the bogus alignemnt in place.

We do have some unknown alignment issues on i915 as well,
with async flips specifically. On ADL we've papered over it
for now. But at least MTL is suffering from somewhat similar
issues that I failed to immediately understand. We really
should find someone who has a bit of time to dig into these...

BTW intel_fb_pin_to_ggtt() also passes the wrong alignment to
__xe_pin_fb_vma(). I suppose it won't help with DPT alignment
woes, but it's yet another xe issue that needs fixing.

-- 
Ville Syrjälä
Intel
