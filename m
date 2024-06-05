Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5434C27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 08:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F352610E570;
	Wed,  5 Jun 2024 08:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFxGm8AQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F94E10E72E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717577942; x=1749113942;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=pQMblktriYWyNVdnQ66icG2eJgaHtcX/lijZiKGPWYo=;
 b=fFxGm8AQchXVPeF+4510gT4L2fWWFSRZgl6NCViFX7t8GUw92V2uojH0
 KGHN9OnMKDaUkz7wUeyHY2hWrB330fqmxyU730CmQlQASzTEwykUb3A2d
 goUolVKEWjNimZUbfBIKBL6Q7hwTH3pbvGx+c50hhvpdk6J7KtShaS1JD
 uAsydsZtInOPxLPN/S34jaXZ9n/S07Uj58TcvkgPV58i826KtCZ03A1mU
 PdthdaYujo5PtbligmJPPT6ruPZ6x6RjgohXgqHZngnSU5Pw4s/tpfrFK
 h7A7pyyQ0s07eIL8I+DGMQA5gIrfVQ1t0wyfjGwr/hMT9elGCPOX6S5KE g==;
X-CSE-ConnectionGUID: 6HpA+YrQTT6FuZ52qm9JRg==
X-CSE-MsgGUID: 2gTOwMIRTc+27otDuPthew==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14389608"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208,217";a="14389608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 01:59:01 -0700
X-CSE-ConnectionGUID: F5H/wBLETQKq6iv5IiMdUA==
X-CSE-MsgGUID: tNbJnm2AQvWZpUJMigpY+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208,217";a="42481408"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.33.194])
 ([10.246.33.194])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 01:58:59 -0700
Content-Type: multipart/alternative;
 boundary="------------5tm0wrtoZgkQaN3uR2wF7gmN"
Message-ID: <cc0a44ad-e7c0-4b00-94ee-6892197d843e@linux.intel.com>
Date: Wed, 5 Jun 2024 10:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Use_mi?=
 =?UTF-8?Q?ssing_lock_in_relay=5Fneeds=5Fworker?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240603081723.18775-1-nirmoy.das@intel.com>
 <171741522900.2261707.9708813650709312308@8e613ede5ea5>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <171741522900.2261707.9708813650709312308@8e613ede5ea5>
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

This is a multi-part message in MIME format.
--------------5tm0wrtoZgkQaN3uR2wF7gmN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/3/2024 1:47 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Use missing lock in relay_needs_worker
> *URL:* 	https://patchwork.freedesktop.org/series/134355/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315_full ->
>   xe-pw-134355v1_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-134355v1_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-134355v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-134355v1_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@core_getversion@basic:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@core_getversion@basic.html>
>  *
>
>     igt@xe_module_load@many-reload:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_module_load@many-reload.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_module_load@many-reload.html>
>         +1 other test dmesg-fail
>
<4> [84.811367] xe 0000:00:02.0: Direct firmware load for 
i915/adlp_guc_70.bin failed with error -2
<5> [84.811381] xe 0000:00:02.0: [drm] GuC firmware 
i915/adlp_guc_70.bin: fetch failed with error -2
<6> [84.811383] xe 0000:00:02.0: [drm] GuC firmware(s) can be downloaded 
from 
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
<3> [84.811384] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC init failed with 
-ENOENT

<3> [84.811403] xe 0000:00:02.0: [drm] *ERROR* GT0: Failed to initialize 
uC (-ENOENT)


Unrelated.

>  *
>
>
>         Warnings
>
>   * igt@core_setmaster@master-drop-set-user:
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     {igt@core_getversion@all-cards}:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@core_getversion@all-cards.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@core_getversion@all-cards.html>
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
>       o {shard-lnl}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-0:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html>
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o {shard-lnl}: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html>
>         +2 other tests dmesg-fail
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-edp1:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-3/igt@kms_flip@flip-vs-suspend@c-edp1.html>
>         (Intel XE#1901
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-2/igt@kms_flip@flip-vs-suspend@c-edp1.html>
>         +1 other test dmesg-fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html>
>         +6 other tests dmesg-fail
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-1/igt@kms_pm_dc@dc9-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-7/igt@kms_pm_dc@dc9-dpms.html>
>         +5 other tests skip
>  *
>
>     igt@kms_pm_rpm@legacy-planes-dpms:
>
>       o {shard-lnl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html>
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o {shard-lnl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         +2 other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o {shard-lnl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         +1 other test skip
>  *
>
>     igt@xe_pm@s2idle-mocs:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-7/igt@xe_pm@s2idle-mocs.html>
>         (Intel XE#1924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-5/igt@xe_pm@s2idle-mocs.html>
>         +2 other tests dmesg-fail
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-134355v1_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@hotreplug:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@core_hotunplug@hotreplug.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@core_hotunplug@hotreplug.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +225 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_content_protection@legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-legacy:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_flip@busy-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_flip@busy-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +10 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +122 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +17 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +547 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>)
>  *
>
>     igt@kms_plane_lowres@tiling-x:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-436/igt@kms_plane_lowres@tiling-x.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr@fbc-psr2-primary-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@xe_evict@evict-small-external-cm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_evict@evict-small-external-cm.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +38 other tests skip
>  *
>
>     igt@xe_exec_balancer@once-parallel-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +429 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +430 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1
>         other test skip
>  *
>
>     igt@xe_exec_threads@threads-shared-vm-userptr:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_exec_threads@threads-shared-vm-userptr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_exec_threads@threads-shared-vm-userptr.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +85 other tests skip
>  *
>
>     igt@xe_live_ktest@xe_dma_buf:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_module_load@load.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_pm@s4-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_pm@s4-basic-exec.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_vm@large-binds-8388608:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_vm@large-binds-8388608.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +12 other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6.html>
>         (Intel XE#827
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6.html>
>         +1 other test pass
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@torture-bo@pipe-a:
>
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-5/igt@kms_cursor_legacy@torture-bo@pipe-a.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-panning-interruptible:
>
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-4/igt@kms_flip@flip-vs-panning-interruptible.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-8/igt@kms_flip@flip-vs-panning-interruptible.html>
>  *
>
>     igt@kms_rotation_crc@primary-rotation-180:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-180.html>
>         (Intel XE#1491
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-180.html>
>  *
>
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>         (Intel XE#1600
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html>
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html>
>  *
>
>     igt@xe_module_load@unload:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_module_load@unload.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_module_load@unload.html>
>  *
>
>     igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-6/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html>
>         (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-1/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html>
>
>
>         Warnings
>
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@intel_hwmon@hwmon-read.html>
>         (Intel XE#1125
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@intel_hwmon@hwmon-read.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#660
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/660>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +33 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +9
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-addfb:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +11 other tests skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +26 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_big_joiner@basic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_big_joiner@basic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_big_joiner@basic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +5 other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +48 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +29 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>)
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html>
>         (Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +20
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +34
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#1152
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html>
>         (Intel XE#1152
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html>
>         (Intel XE#1152
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-green-to-red:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +3 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +30 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +4 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +25 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_content_protection@srm.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_content_protection@srm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_content_protection@uevent.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-dpms:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_cursor_crc@cursor-dpms.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html>
>         (Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +3 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +5
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-dg2-set2: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-bottom:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html>
>         (Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-top-bottom.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +10 other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +11 other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_legacy@single-bo:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_legacy@single-bo.html>
>         (Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_cursor_legacy@single-bo.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +19 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +21 other tests skip
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +12 other tests skip
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +44 other tests skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +120 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +73 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +72 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +39 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (Intel XE#1151
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +13
>         other tests skip
>  *
>
>     igt@kms_getfb@getfb-reject-ccs:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_hdr@static-toggle-suspend.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_hdr@static-toggle-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-1/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +57 other tests skip
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html>
>         (Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_pm_backlight@bad-brightness.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_pm_backlight@bad-brightness.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#734
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/734>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_pm_rpm@system-suspend-modeset:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_pm_rpm@system-suspend-modeset.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_pm_rpm@system-suspend-modeset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr@fbc-pr-sprite-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>)
>  *
>
>     igt@kms_psr@fbc-psr-suspend:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_psr@fbc-psr-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_psr@fbc-psr-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +45 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +8
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +7
>         other tests skip
>  *
>
>     igt@kms_psr@psr-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_psr@psr-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_psr@psr-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +48 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-move.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_psr@psr2-cursor-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955>)
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +7 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +5
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_setmode@basic-clone-single-crtc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_setmode@basic-clone-single-crtc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_vrr@flipline.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_vrr@flipline.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +21 other tests skip
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_writeback@writeback-check-output.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1932
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@xe_ccs@block-copy-compressed-inc-dimension:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_ccs@block-copy-compressed-inc-dimension.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed-inc-dimension.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#1050
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@xe_create@create-big-vram:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_create@create-big-vram.html>
>         (Intel XE#1062
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@xe_create@create-big-vram.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-large:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-large:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_evict@evict-beng-large.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_evict@evict-beng-large.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-1/igt@xe_evict@evict-large-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +16 other tests skip
>  *
>
>     igt@xe_evict@evict-small-multi-vm-cm:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_evict@evict-small-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6
>         other tests skip
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_evict@evict-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-simple:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +26 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +58 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +16 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-rebind-prefetch:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +10 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +68 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-prefetch:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +10
>         other tests skip
>  *
>
>     igt@xe_exec_reset@cat-error:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_exec_reset@cat-error.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1638
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638> /
>         Intel XE#358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_exec_reset@cat-error.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_exec_reset@cm-cat-error:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html>
>         (Intel XE#1962
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_exec_reset@cm-gt-reset:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset.html>
>         (Intel XE#1068
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_exec_reset@gt-reset-stress:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html>
>         (Intel XE#1638
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-basic:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-basic.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_media_fill@media-fill:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_media_fill@media-fill.html>
>         (Intel XE#560
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_media_fill@media-fill.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#560
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_mmap@small-bar.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_mmap@small-bar.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_mmap@small-bar.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@xe_mmap@small-bar.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pat@display-vs-wb-transient:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_peer2peer@read.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_peer2peer@read.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@d3hot-basic-exec:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_pm@d3hot-basic-exec.html>
>         (Intel XE#355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/355>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_pm@d3hot-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@d3hot-mmap-vram:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1948
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@s2idle-basic-exec:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html>
>         (Intel XE#1924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@xe_pm@s3-basic-exec:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@xe_pm@s3-basic-exec.html>
>         (Intel XE#1044
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-1/igt@xe_pm@s3-basic-exec.html>
>         (Intel XE#1044
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pm@s3-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s3-multiple-execs:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html>
>         (Intel XE#1924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s3-vm-bind-userptr:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@s4-d3cold-basic-exec:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_pm@s4-d3cold-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pm@s4-d3cold-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +5
>         other tests skip
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_pm@s4-mocs.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_pm@s4-mocs.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_query@multigpu-query-cs-cycles:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +8
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-extension:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6
>         other tests skip
>  *
>
>     igt@xe_spin_batch@spin-fixed-duration:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration.html>
>         (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315 ->
>     xe-pw-134355v1
>
> IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315: 
> dbdf6d2379c9a06795be8de282afeaa3b2a06315
> xe-pw-134355v1: 134355v1
>
--------------5tm0wrtoZgkQaN3uR2wF7gmN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/3/2024 1:47 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:171741522900.2261707.9708813650709312308@8e613ede5ea5">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Use missing lock in relay_needs_worker</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/134355/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/134355/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315_full -&gt;
        xe-pw-134355v1_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-134355v1_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-134355v1_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-134355v1_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@core_getversion@basic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@core_getversion@basic.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@many-reload:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">DMESG-FAIL</a> +1 other test
              dmesg-fail</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    &lt;4&gt; [84.811367] xe 0000:00:02.0: Direct firmware load for
    i915/adlp_guc_70.bin failed with error -2<br>
    &lt;5&gt; [84.811381] xe 0000:00:02.0: [drm] GuC firmware
    i915/adlp_guc_70.bin: fetch failed with error -2<br>
    &lt;6&gt; [84.811383] xe 0000:00:02.0: [drm] GuC firmware(s) can be
    downloaded from
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git">https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git</a><br>
    &lt;3&gt; [84.811384] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC init
    failed with -ENOENT<br>
    <p>&lt;3&gt; [84.811403] xe 0000:00:02.0: [drm] *ERROR* GT0: Failed
      to initialize uC (-ENOENT)</p>
    <p><br>
    </p>
    <p>Unrelated.<br>
    </p>
    <blockquote type="cite"
      cite="mid:171741522900.2261707.9708813650709312308@8e613ede5ea5">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@core_setmaster@master-drop-set-user:
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>{igt@core_getversion@all-cards}:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@core_getversion@all-cards.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@core_getversion@all-cards.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>{shard-lnl}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>{shard-lnl}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html"
                moz-do-not-send="true">DMESG-FAIL</a> +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-3/igt@kms_flip@flip-vs-suspend@c-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901"
                moz-do-not-send="true">Intel XE#1901</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-2/igt@kms_flip@flip-vs-suspend@c-edp1.html"
                moz-do-not-send="true">DMESG-FAIL</a> +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html"
                moz-do-not-send="true">DMESG-FAIL</a> +6 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-1/igt@kms_pm_dc@dc9-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-7/igt@kms_pm_dc@dc9-dpms.html"
                moz-do-not-send="true">SKIP</a> +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
          <ul>
            <li>{shard-lnl}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html"
                moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439"
                moz-do-not-send="true">Intel XE#1439</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211"
                moz-do-not-send="true">Intel XE#1211</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-mocs:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-7/igt@xe_pm@s2idle-mocs.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924"
                moz-do-not-send="true">Intel XE#1924</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-5/igt@xe_pm@s2idle-mocs.html"
                moz-do-not-send="true">DMESG-FAIL</a> +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-userptr:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-134355v1_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@core_hotunplug@hotreplug.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@core_hotunplug@hotreplug.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885"
                moz-do-not-send="true">Intel XE#1885</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +225 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_chamelium_color@gamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_content_protection@legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@busy-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_flip@busy-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +122 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +547 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-436/igt@kms_plane_lowres@tiling-x.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_psr2_su@page_flip-p010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-external-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_evict@evict-small-external-cm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +38 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@once-parallel-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +429 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +430 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-shared-vm-userptr:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_exec_threads@threads-shared-vm-userptr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_exec_threads@threads-shared-vm-userptr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +85 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_dma_buf:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_module_load@load.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378"
                moz-do-not-send="true">Intel XE#378</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@large-binds-8388608:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_vm@large-binds-8388608.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +12 other
              tests skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827"
                moz-do-not-send="true">Intel XE#827</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659"
                moz-do-not-send="true">Intel XE#1659</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910"
                moz-do-not-send="true">Intel XE#910</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-5/igt@kms_cursor_legacy@torture-bo@pipe-a.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-panning-interruptible:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-4/igt@kms_flip@flip-vs-panning-interruptible.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-8/igt@kms_flip@flip-vs-panning-interruptible.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-180:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-180.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491"
                moz-do-not-send="true">Intel XE#1491</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-180.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600"
                moz-do-not-send="true">Intel XE#1600</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392"
                moz-do-not-send="true">Intel XE#392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@unload:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_module_load@unload.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_module_load@unload.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-lnl-6/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081"
                moz-do-not-send="true">Intel XE#1081</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-lnl-1/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@intel_hwmon@hwmon-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125"
                moz-do-not-send="true">Intel XE#1125</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@intel_hwmon@hwmon-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660"
                moz-do-not-send="true">Intel XE#660</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873"
                moz-do-not-send="true">Intel XE#873</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +33 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619"
                moz-do-not-send="true">Intel XE#619</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +11 other
              tests skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607"
                moz-do-not-send="true">Intel XE#607</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"
                moz-do-not-send="true">Intel XE#610</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +26 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619"
                moz-do-not-send="true">Intel XE#619</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"
                moz-do-not-send="true">Intel XE#610</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_big_joiner@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_big_joiner@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_big_joiner@invalid-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_big_joiner@invalid-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +48 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +29 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"
                moz-do-not-send="true">Intel XE#1252</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"
                moz-do-not-send="true">Intel XE#1252</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"
                moz-do-not-send="true">Intel XE#1252</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"
                moz-do-not-send="true">Intel XE#1252</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_cdclk@plane-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152"
                moz-do-not-send="true">Intel XE#1152</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_cdclk@plane-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152"
                moz-do-not-send="true">Intel XE#1152</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152"
                moz-do-not-send="true">Intel XE#1152</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-green-to-red:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +30 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_content_protection@lic-type-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_content_protection@uevent.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188"
                moz-do-not-send="true">Intel XE#1188</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_content_protection@uevent.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_cursor_crc@cursor-dpms.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-top-bottom.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910"
                moz-do-not-send="true">Intel XE#910</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@single-bo:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_cursor_legacy@single-bo.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"
                moz-do-not-send="true">Intel XE#282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_cursor_legacy@single-bo.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@kms_fbcon_fbt@psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776"
                moz-do-not-send="true">Intel XE#776</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_fbcon_fbt@psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_feature_discovery@chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701"
                moz-do-not-send="true">Intel XE#701</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_feature_discovery@chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701"
                moz-do-not-send="true">Intel XE#701</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703"
                moz-do-not-send="true">Intel XE#703</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138"
                moz-do-not-send="true">Intel XE#1138</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137"
                moz-do-not-send="true">Intel XE#1137</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137"
                moz-do-not-send="true">Intel XE#1137</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137"
                moz-do-not-send="true">Intel XE#1137</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135"
                moz-do-not-send="true">Intel XE#1135</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135"
                moz-do-not-send="true">Intel XE#1135</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"
                moz-do-not-send="true">Intel XE#310</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274"
                moz-do-not-send="true">i915#5274</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +44 other
              tests skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +120 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +73 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"
                moz-do-not-send="true">Intel XE#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +72 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +39 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151"
                moz-do-not-send="true">Intel XE#1151</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158"
                moz-do-not-send="true">Intel XE#1158</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158"
                moz-do-not-send="true">Intel XE#1158</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb-reject-ccs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_getfb@getfb-reject-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341"
                moz-do-not-send="true">Intel XE#1341</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_getfb@getfb-reject-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417"
                moz-do-not-send="true">Intel XE#417</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356"
                moz-do-not-send="true">Intel XE#356</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-1/igt@kms_panel_fitting@legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_panel_fitting@legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +57 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">DMESG-FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305"
                moz-do-not-send="true">Intel XE#305</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305"
                moz-do-not-send="true">Intel XE#305</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305"
                moz-do-not-send="true">Intel XE#305</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305"
                moz-do-not-send="true">Intel XE#305</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305"
                moz-do-not-send="true">Intel XE#305</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305"
                moz-do-not-send="true">Intel XE#305</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305"
                moz-do-not-send="true">Intel XE#305</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@bad-brightness:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_pm_backlight@bad-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_pm_backlight@bad-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"
                moz-do-not-send="true">Intel XE#908</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718"
                moz-do-not-send="true">Intel XE#718</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734"
                moz-do-not-send="true">Intel XE#734</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"
                moz-do-not-send="true">Intel XE#908</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"
                moz-do-not-send="true">Intel XE#908</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_pm_rpm@dpms-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"
                moz-do-not-send="true">Intel XE#836</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211"
                moz-do-not-send="true">Intel XE#1211</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-modeset:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@kms_pm_rpm@system-suspend-modeset.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_pm_rpm@system-suspend-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-suspend:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_psr@fbc-psr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_psr@fbc-psr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +45 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_psr@psr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_psr@psr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +48 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_psr@psr2-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1955"
                moz-do-not-send="true">Intel XE#1955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149"
                moz-do-not-send="true">Intel XE#1149</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149"
                moz-do-not-send="true">Intel XE#1149</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149"
                moz-do-not-send="true">Intel XE#1149</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_setmode@basic-clone-single-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_setmode@basic-clone-single-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362"
                moz-do-not-send="true">Intel XE#362</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330"
                moz-do-not-send="true">Intel XE#330</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330"
                moz-do-not-send="true">Intel XE#330</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@kms_vrr@flipline.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@kms_vrr@flipline.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@kms_writeback@writeback-check-output.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@kms_writeback@writeback-fb-id-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091"
                moz-do-not-send="true">Intel XE#1091</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-on.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091"
                moz-do-not-send="true">Intel XE#1091</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-on.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932"
                moz-do-not-send="true">Intel XE#1932</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-on.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091"
                moz-do-not-send="true">Intel XE#1091</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_ccs@block-copy-compressed-inc-dimension.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488"
                moz-do-not-send="true">Intel XE#488</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed-inc-dimension.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447"
                moz-do-not-send="true">Intel XE#1447</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_compute@ccs-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050"
                moz-do-not-send="true">Intel XE#1050</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280"
                moz-do-not-send="true">Intel XE#1280</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280"
                moz-do-not-send="true">Intel XE#1280</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280"
                moz-do-not-send="true">Intel XE#1280</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@create-big-vram:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_create@create-big-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062"
                moz-do-not-send="true">Intel XE#1062</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@xe_create@create-big-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392"
                moz-do-not-send="true">Intel XE#392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_evict@evict-beng-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261"
                moz-do-not-send="true">Intel XE#261</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_evict@evict-beng-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041"
                moz-do-not-send="true">Intel XE#1041</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392"
                moz-do-not-send="true">Intel XE#392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-1/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261"
                moz-do-not-send="true">Intel XE#261</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-multi-vm-cm:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261"
                moz-do-not-send="true">Intel XE#261</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_evict@evict-small-multi-vm-cm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_evict@evict-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392"
                moz-do-not-send="true">Intel XE#392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +26 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +58 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +68 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cat-error:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_exec_reset@cat-error.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638"
                moz-do-not-send="true">Intel XE#1638</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"
                moz-do-not-send="true">Intel XE#358</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_exec_reset@cat-error.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-cat-error:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962"
                moz-do-not-send="true">Intel XE#1962</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-gt-reset:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068"
                moz-do-not-send="true">Intel XE#1068</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@gt-reset-stress:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638"
                moz-do-not-send="true">Intel XE#1638</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-basic.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"
                moz-do-not-send="true">Intel XE#358</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_huc_copy@huc_copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255"
                moz-do-not-send="true">Intel XE#255</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_huc_copy@huc_copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_media_fill@media-fill:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_media_fill@media-fill.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560"
                moz-do-not-send="true">Intel XE#560</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_media_fill@media-fill.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560"
                moz-do-not-send="true">Intel XE#560</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_mmap@small-bar.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512"
                moz-do-not-send="true">Intel XE#512</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_mmap@small-bar.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_mmap@small-bar.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512"
                moz-do-not-send="true">Intel XE#512</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@xe_mmap@small-bar.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@display-vs-wb-transient:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337"
                moz-do-not-send="true">Intel XE#1337</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_pat@display-vs-wb-transient.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337"
                moz-do-not-send="true">Intel XE#1337</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_pat@display-vs-wb-transient.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xe2:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_pat@pat-index-xe2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977"
                moz-do-not-send="true">Intel XE#977</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@xe_pat@pat-index-xe2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979"
                moz-do-not-send="true">Intel XE#979</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979"
                moz-do-not-send="true">Intel XE#979</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_peer2peer@read.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173"
                moz-do-not-send="true">Intel XE#1173</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_peer2peer@read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"
                moz-do-not-send="true">Intel XE#1061</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_pm@d3hot-basic-exec.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355"
                moz-do-not-send="true">Intel XE#355</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-9/igt@xe_pm@d3hot-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-mmap-vram:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948"
                moz-do-not-send="true">Intel XE#1948</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924"
                moz-do-not-send="true">Intel XE#1924</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@xe_pm@s3-basic-exec.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044"
                moz-do-not-send="true">Intel XE#1044</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-1/igt@xe_pm@s3-basic-exec.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044"
                moz-do-not-send="true">Intel XE#1044</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pm@s3-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-multiple-execs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924"
                moz-do-not-send="true">Intel XE#1924</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-userptr:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-9/igt@xe_pm@s3-vm-bind-userptr.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_pm@s3-vm-bind-userptr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3cold-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_pm@s4-d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pm@s4-d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-463/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-cs-cycles:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-dg2-434/igt@xe_query@multigpu-query-engines.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-extension:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-fixed-duration:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081"
                moz-do-not-send="true">Intel XE#1081</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134355v1/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315
          -&gt; xe-pw-134355v1</li>
      </ul>
      <p>IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-1394-dbdf6d2379c9a06795be8de282afeaa3b2a06315:
        dbdf6d2379c9a06795be8de282afeaa3b2a06315<br>
        xe-pw-134355v1: 134355v1</p>
    </blockquote>
  </body>
</html>

--------------5tm0wrtoZgkQaN3uR2wF7gmN--
