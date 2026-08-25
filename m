Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE3C61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 08:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5459510E96D;
	Tue, 25 Aug 2026 08:39:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8311410E96D;
 Tue, 25 Aug 2026 08:39:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/alpm=3A_Fix_swap?=
 =?utf-8?q?ped_wake_lines_in_LOBF_late_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Aug 2026 08:39:03 -0000
Message-ID: <178764714353.82315.9467325977413178972@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260825055239.3455987-1-animesh.manna@intel.com>
In-Reply-To: <20260825055239.3455987-1-animesh.manna@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/alpm: Fix swapped wake lines in LOBF late config
URL   : https://patchwork.freedesktop.org/series/172707/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e73614f2671721d1ba4d8a66cb5ee170b9580bb8
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Tue Aug 25 11:22:39 2026 +0530

    drm/i915/alpm: Fix swapped wake lines in LOBF late config
    
    intel_alpm_lobf_compute_config_late() selected the main-link wake time
    with the two cases inverted: when aux-less wake was supported it used the
    aux-wake io_wake_lines, and otherwise the aux_less_wake_lines. This is the
    opposite of the mapping used in intel_psr_compute_config_late() and of the
    underlying meaning of the two values.
    
    As a result the LOBF enable decision (scl + guardband > first_sdp_position
    + waketime_in_lines) was computed against the wrong wake time, so LOBF
    could be enabled or rejected incorrectly.
    
    Use aux_less_wake_lines when aux-less wake is supported and io_wake_lines
    otherwise, matching the PSR path.
    
    Cc: Jouni Högander <jouni.hogander@intel.com>
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com
    Cc: stable@vger.kernel.org
    Fixes: 9090fa44a6d45 ("drm/i915/alpm: Compute LOBF late after guardband is already determined")
    Assisted-by: Claude:claude-opus-4-8
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad drm-intel
e73614f26717 drm/i915/alpm: Fix swapped wake lines in LOBF late config
-:23: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Ankit Nautiyal <ankit.k.nautiyal@intel.com'
#23: 
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com

-:25: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '9090fa44a6d45', maybe rebased or not pulled?
#25: 
Fixes: 9090fa44a6d45 ("drm/i915/alpm: Compute LOBF late after guardband is already determined")

total: 1 errors, 1 warnings, 0 checks, 11 lines checked


