Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D02C021A4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 01:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA4310E50B;
	Tue, 25 Feb 2025 01:06:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B6410E50B;
 Tue, 25 Feb 2025 01:06:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Implement_?=
 =?utf-8?q?POST=5FLT=5FADJ=5FREQ?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 01:06:38 -0000
Message-ID: <174044559816.1784079.13409891978679070642@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dp: Implement POST_LT_ADJ_REQ
URL   : https://patchwork.freedesktop.org/series/145346/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ddcb5d0a964df214e4487b64f091b22ebecb9e7
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Feb 24 19:26:45 2025 +0200

    hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage
    
    Disable TPS4 in favor of POST_LT_ADJ_REQ for testing purposes.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 9f112b86fd27ff7de2ce09718596cfefd71ee41f drm-intel
2a8955190ea8 drm/dp: Add definitions for POST_LT_ADJ training sequence
0e595eb278bd drm/dp: Add POST_LT_ADJ_REQ helpers
492babf2ca67 drm/i915/dp: Clear DPCD training pattern before transmitting the idle pattern
152402701783 drm/i915/dp: Have intel_dp_get_adjust_train() tell us if anything changed
f5ef89dd094d drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
-:58: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:779:
+		intel_dp_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX) != DP_TRAINING_PATTERN_4;

-:118: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#118: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1148:
+			       "POST_LT_ADJ_REQ done (%d changes). DP Training successful\n", changes);

-:126: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#126: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1156:
+			       "POST_LT_ADJ_REQ limit reached (%d changes). DP Training successful\n", changes);

-:134: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#134: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1164:
+			       "POST_LT_ADJ_REQ timeout reached (%d changes). DP Training successful\n", changes);

total: 0 errors, 4 warnings, 0 checks, 177 lines checked
653155f13344 drm/i915/dp: Move intel_dp_training_pattern()
b6ed6723fccb drm/i915/dp: Implement .set_idle_link_train() for everyone
578979c97035 drm/i915/dp: Make .set_idle_link_train() mandatory
0ddcb5d0a964 hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage


