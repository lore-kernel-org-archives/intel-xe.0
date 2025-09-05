Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5A6CA1010
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 07:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9CC10EB2A;
	Fri,  5 Sep 2025 07:07:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1165810EB34;
 Fri,  5 Sep 2025 07:07:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/alpm=3A_Compute_?=
 =?utf-8?q?ALPM_parameters_into_crtc=5Fstate-=3Ealpm=5Fparameters?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Sep 2025 07:07:09 -0000
Message-ID: <175705602906.306187.1527024697298837281@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250905070114.2635531-1-jouni.hogander@intel.com>
In-Reply-To: <20250905070114.2635531-1-jouni.hogander@intel.com>
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

Series: drm/i915/alpm: Compute ALPM parameters into crtc_state->alpm_parameters
URL   : https://patchwork.freedesktop.org/series/154074/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6563e0a40fcee465b9078301e01a752848b6572c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 225d8f19c7ee9dbc6689bc5622d89e163d686425
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Sep 5 10:01:14 2025 +0300

    drm/i915/alpm: Compute ALPM parameters into crtc_state->alpm_parameters
    
    Currently ALPM parameters are computed directly into
    intel_dp->alpm_parameters. This is a problem when compute config ends up to
    not using the computed state.
    
    Fix this by adding ALPM parameters into intel_crtc_state and compute into
    there. Copy needed parts of crtc_state->alpm_parameters into
    intel_dp->alpm.alpm_parameters (io_wake_lines and fast_wake_lines) when
    they are configured into HW.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch c47df0ca6d5cec0775af9ca03b79237f54265808 drm-intel
225d8f19c7ee drm/i915/alpm: Compute ALPM parameters into crtc_state->alpm_parameters
-:100: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#100: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:337:
+			ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_parameters.aux_less_wake_lines);

-:109: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#109: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:355:
+			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(crtc_state->alpm_parameters.fast_wake_lines);

total: 0 errors, 2 warnings, 0 checks, 201 lines checked


