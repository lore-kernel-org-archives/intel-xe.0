Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F301061B1E
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4707A10E7ED;
	Mon, 30 Mar 2026 20:32:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC58C10E7ED;
 Mon, 30 Mar 2026 20:32:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Implement_?=
 =?utf-8?q?POST=5FLT=5FADJ=5FREQ_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Mar 2026 20:32:12 -0000
Message-ID: <177490273274.414230.7729413859127243530@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260330202629.28616-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260330202629.28616-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dp: Implement POST_LT_ADJ_REQ (rev4)
URL   : https://patchwork.freedesktop.org/series/145346/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3584e0d87f06c0ed9113c227a42afb9098d2f146
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Mar 30 23:26:29 2026 +0300

    hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage
    
    Disable TPS4 in favor of POST_LT_ADJ_REQ for testing purposes.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 169e5b6f809026c4a0cb3a736b48378ca8e8fecb drm-intel
7066506270c1 drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
-:56: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#56: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:836:
+		intel_dp_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX) != DP_TRAINING_PATTERN_4;

-:116: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#116: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1148:
+			       "POST_LT_ADJ_REQ done (%d changes). DP Training successful\n", changes);

-:124: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#124: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1156:
+			       "POST_LT_ADJ_REQ limit reached (%d changes). DP Training successful\n", changes);

-:132: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#132: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1164:
+			       "POST_LT_ADJ_REQ timeout reached (%d changes). DP Training successful\n", changes);

total: 0 errors, 4 warnings, 0 checks, 173 lines checked
3584e0d87f06 hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage


