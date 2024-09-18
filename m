Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13654CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 14:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83AC10E5D2;
	Wed, 18 Sep 2024 14:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qi7DAauB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6D210E5D2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726671007; x=1758207007;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=k55iCcXDUt8sQCf8udWx7zzS2BJBPU9P2hl5owLal2E=;
 b=Qi7DAauB+OuR1x86T7snf5z4bgwMcmytdgEhFH98PXxNUM+uKZi0aPKN
 O0Jl+qNzfHGnWUhSRQdYHuHRmwPey27gd83xpTdGJYxZemzUMqSdnsPkk
 uEKiXvAEW49mRfBMC7YogvDHRr2Us/CT6pAONUzoVxCpN+m+VKouV08La
 v+fhlFsPoRuTRh/w+kZSXSAAcYkovYJ3DUaVgh2T+kqVelFlNX0RrtZUF
 6jacMpAWOsmFKyrm2Z9ITs0VNCdfPh3mJuMZz51e//hkZ4GtoPsvU6ZCL
 rTuGVc4axWHTj0l1msI1xSvoa/BD/YpodyMJmGEPYTyKYrZHF8RXdhlNc w==;
X-CSE-ConnectionGUID: WBlU9mVyR2iRVBrCnzMfBg==
X-CSE-MsgGUID: Tfp0EpgSSFODeSnkAyB93g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36964096"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="36964096"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:50:06 -0700
X-CSE-ConnectionGUID: B0BeAJgtReqWYYb0h3BY/g==
X-CSE-MsgGUID: f7ATSJGYTiiTVJZgeLazoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69711672"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:50:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Matthew
 Brost <matthew.brost@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
In-Reply-To: <87v7ytbf9y.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
 <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
 <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
 <271c25c3-401c-43b3-8d9c-dc13027a6ea7@intel.com>
 <87v7ytbf9y.fsf@intel.com>
Date: Wed, 18 Sep 2024 17:50:00 +0300
Message-ID: <87ed5hauef.fsf@intel.com>
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

On Wed, 18 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> If you end up replicating intel_wakeref_t from i915, and go as deep as
> the rabbit hole goes, you'll realize intel_wakeref_t is a pointer
> disguised as an unsigned long. It's a struct ref_tracker * when you have
> certain configs enabled.
>
> You could just use struct ref_tracker * everywhere. It's an opaque type
> to start with.

Inspired by this discussion, I converted i915

 -typedef unsigned long intel_wakeref_t;
 +typedef struct ref_tracker *intel_wakeref_t;

and it promptly found a number of issues [1]. Maybe the typedef around
an integral type isn't the hottest idea. Though I'm not suggesting to
use a typedef for the pointer either, it's just that i915 has
intel_wakeref_t littered absolutely everywhere.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1726658138.git.jani.nikula@intel.com

-- 
Jani Nikula, Intel
