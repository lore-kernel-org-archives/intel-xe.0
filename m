Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19306C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 12:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA4410E2DE;
	Tue,  1 Apr 2025 12:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="El6ifnZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749E010E324
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743511039; x=1775047039;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=effOxjw5z4eiHrJm/V7VDJoAiVtFXx402JCsY4D507I=;
 b=El6ifnZjLhiY+OZAbmSzcJ+xHio9sOMB07PqVMuV6JmJtGzi6SIpRFX4
 zrXg/WPNJUXG/4yforMDzR/dBvFwZXK8xeDN/J6nkTwvyuhCJfrYEQDhF
 pw6CPh7DSGxmuyGA65sgy/VmzUzniYThJ9T1Yq5/qW/fik5+6jsxVBN5I
 g+m9A784tCF+4y+l26v2kMC6KtfBQCMzZbm/CjNFx1pJfOBuTjiks6Bza
 NytNmQ6jqq1Jl64CEYmAX1ARLFsE3zwauyWsPicQhQzOYlYHxWyi9fcq+
 jyVICm7mfz/S5ueapzMOggmAyEEGFPb/vbTWMdN/0PEMK7x5N0zPXbnCo w==;
X-CSE-ConnectionGUID: Bn2y+FFbRO6uzLO2Vf816w==
X-CSE-MsgGUID: YtY1qTR5Rt+BySIDZjB94g==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44741579"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44741579"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:37:19 -0700
X-CSE-ConnectionGUID: xPMm0FPZRpC9lYXJRj9oWg==
X-CSE-MsgGUID: YWIXA/KLTfSYn3lSSrgTCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="127273448"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:37:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.Patch_applied: failure for hdrtest:
 hide the disgusting turds
In-Reply-To: <174351034177.22413.14605498657948012385@e6b6f09ec485>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250401121830.21696-1-jani.nikula@intel.com>
 <174351034177.22413.14605498657948012385@e6b6f09ec485>
Date: Tue, 01 Apr 2025 15:37:14 +0300
Message-ID: <87o6xg2h39.fsf@intel.com>
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

On Tue, 01 Apr 2025, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: hdrtest: hide the disgusting turds
> URL   : https://patchwork.freedesktop.org/series/147057/
> State : failure

The series is based on Linus' tree.

>
> == Summary ==
>
> === Applying kernel patches on branch 'drm-tip' with base: ===
> Base commit: 9368766ece6c drm-tip: 2025y-04m-01d-08h-58m-05s UTC integration manifest
> === git am output follows ===
> error: patch failed: drivers/gpu/drm/Kconfig:489
> error: drivers/gpu/drm/Kconfig: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> Applying: drm: place header test files in .hdrtest subdirectories
> Applying: drm/xe: place header test files in .hdrtest subdirectories
> Applying: drm/i915: place header test files in .hdrtest subdirectories
> Applying: kbuild: hdrtest: place header test files in .hdrtest subdirectories
> Applying: drm: add config option for extra build-time checks
> Patch failed at 0005 drm: add config option for extra build-time checks
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
>

-- 
Jani Nikula, Intel
