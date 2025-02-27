Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066B5C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 22:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69BC10E0D5;
	Thu, 27 Feb 2025 22:35:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B16D10E0D5;
 Thu, 27 Feb 2025 22:35:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Implement_?=
 =?utf-8?q?POST=5FLT=5FADJ=5FREQ_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 22:35:50 -0000
Message-ID: <174069575017.2902425.9103513473329907820@b555e5b46a47>
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

Series: drm/i915/dp: Implement POST_LT_ADJ_REQ (rev2)
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
commit 9adbb2f7c916b5276858b59ac4f610630b2c6a79
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Feb 24 19:26:45 2025 +0200

    hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage
    
    Disable TPS4 in favor of POST_LT_ADJ_REQ for testing purposes.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4 drm-intel
6b5ef353ed7b drm/dp: Add definitions for POST_LT_ADJ training sequence
5e4cce43bcea drm/dp: Add POST_LT_ADJ_REQ helpers
8171e76e74a9 drm/i915/dp: Clear DPCD training pattern before transmitting the idle pattern
621b7e1e099c drm/i915/dp: Have intel_dp_get_adjust_train() tell us if anything changed
96a6fc725e80 drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
-:58: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:765:
+		intel_dp_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX) != DP_TRAINING_PATTERN_4;

-:118: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#118: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1134:
+			       "POST_LT_ADJ_REQ done (%d changes). DP Training successful\n", changes);

-:126: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#126: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1142:
+			       "POST_LT_ADJ_REQ limit reached (%d changes). DP Training successful\n", changes);

-:134: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#134: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1150:
+			       "POST_LT_ADJ_REQ timeout reached (%d changes). DP Training successful\n", changes);

total: 0 errors, 4 warnings, 0 checks, 177 lines checked
760e86db6695 drm/i915/dp: Move intel_dp_training_pattern()
27372bc326f6 drm/i915/dp: Implement .set_idle_link_train() for everyone
2c42a8088236 drm/i915/dp: Make .set_idle_link_train() mandatory
9adbb2f7c916 hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage


