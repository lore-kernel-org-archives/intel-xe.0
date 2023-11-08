Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D663C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 11:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2AD10E722;
	Wed,  8 Nov 2023 11:30:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C20310E722
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699443023; x=1730979023;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=mGl2i/8+S3hVOqHYBWOcs/IPk8M5YuXGU2EjsrniiW4=;
 b=gTXPxduMqx7TXlk/rZXNtTreV1Jue/IK5zh25I5wYsZwNzmvaJ9grjBe
 TD8kTnHf11W5pfhaQMLhMeqytqnDq6q5lYhF4kEkrRULb/UdJqM5GDzf/
 rL6FGalDkgVD0GcYuplvvlejZcBhwUuo92LO8RJYQZC/r60JCbqJeGnpT
 lSuOIKktJMz+2A2VQeOSdDVYKEIaxIT08j9Ck/ebnYZoAWVWvEp5wGHXb
 6XFeRrSEA4uFxjrLoQ2x7hFxCsOdzTgespBNZlBnWmN8NQ8Wlee/OEJ6i
 rZ02KtkhYeRSwy6j7u641SoBn5BvE7cpMLPMLGgR8iiiIYnRpZlqcz/lj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="386915804"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="386915804"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 03:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="886645516"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="886645516"
Received: from tmistat-desk.igk.intel.com (HELO localhost) ([10.102.138.166])
 by orsmga004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 03:30:19 -0800
Date: Wed, 8 Nov 2023 12:30:16 +0100
From: Tomasz Mistat <tomasz.mistat@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZUtv1eH5uiHl3j9N@tmistat-desk>
Mail-Followup-To: Tomasz Mistat <tomasz.mistat@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 intel-xe@lists.freedesktop.org,
 compute-umd_uapi_review_team@intel.com, bartosz.dunajski@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Subject: [Intel-xe] FW:  [PATCH v9 0/3] PAT and cache coherency support
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
Cc: compute-umd_uapi_review_team@intel.com, bartosz.dunajski@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

compute-umd_uapi_review_team@intel.com,bartosz.dunajski@intel.com,saurabhg.gupta@intel.com,ulisses.furquim@intel.com,michal.mrozek@intel.com,tomasz.mistat@intel.com,piotr.rozenfeld@intel.com,ayaz.siddiqui@intel.com,luis.strano@intel.com,filip.hazubski@intel.com,filip.hazubski@intel.com,mateusz.naklicki@intel.com,kamil.kopryk@intel.com
Bcc: 
Subject: Re: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency support
Reply-To: 
In-Reply-To: <20231103154309.402159-5-matthew.auld@intel.com>

On 2023-11-03 at 15:43:10 +0000, Matthew Auld wrote:
> Branch available here:
> https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads
> 
> IGT changes:
> https://patchwork.freedesktop.org/series/124667/
> 
> Mesa:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25462
> 
> Goal here is to allow userspace to directly control the pat_index when mapping
> memory via the ppGTT, in addtion to the CPU caching mode. This is very much
> needed on newer igpu platforms which allow incoherent GT access, where the
> choice over the cache level and expected coherency is best left to userspace
> depending on their usecase.  In the future there may also be other stuff encoded
> in the pat_index, so giving userspace direct control will also be needed there.
> 
> To support this we added new gem_create uAPI for selecting the CPU cache
> mode to use for system memory, including the expected GPU coherency mode. There
> are various restrictions here for the selected coherency mode and compatible CPU
> cache modes.  With that in place the actual pat_index can now be provided as
> part of vm_bind. The only restriction is that the coherency mode of the
> pat_index must be at least as coherent as the gem_create coherency mode. There
> are also some special cases like with userptr and dma-buf.
> 
> v2:
>   - Loads of improvements/tweaks. Main changes are to now allow
>     gem_create.coh_mode <= coh_mode(pat_index), rather than it needing to match
>     exactly. This simplifies the dma-buf policy from userspace pov. Also we now
>     only consider COH_NONE and COH_AT_LEAST_1WAY.
> v3:
>   - Rebase. Split the pte_encode() refactoring, plus various smaller tweaks and
>     fixes.
> v4:
>   - Rebase on Lucas' new series.
>   - Drop UC cache mode.
>   - s/smem_cpu_caching/cpu_caching/. Idea is to make VRAM WC explicit in the
>     uapi, plus make it more future proof.
> v5:
>   - Rebase, plus some small tweaks and fixes.
> v6:
>   - CI hooks fixes + checkpatch.
> v7:
>   - Some small tweaks
> v8:
>   - Rebase on Xe2 PAT table additions.
> v9:
>   - Drop coh_mode.
> 
> -- 
> 2.41.0
> 

I'm sharing down here questions passed by bartosz.dunajski@intel.com
lets continue review here at respective ML

Sent: Wednesday, November 8, 2023 09:05
Subject: RE: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency support

Just to confirm my understanding. We will have 2 separate APIs?
1.	For gem_create to explicitly set coherency/caching according to API enums
2.	For vm_bind to set PAT index that is aligned with Bspec and controls more than #1. It can also override coherency/caching that was previously set?


