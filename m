Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D8F606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3181710E1C7;
	Wed, 25 Nov 2026 14:44:43 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ECC10E1C7;
 Wed, 25 Nov 2026 14:44:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Move_DRM_helpers_out_of_i?=
 =?utf-8?q?915_driver_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kory Maincent" <kory.maincent@bootlin.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Nov 2026 14:44:41 -0000
Message-ID: <179561788128.86091.6791572218893901682@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261125-feat_move_i915_helper-v2-0-aa04d39bc415@bootlin.com>
In-Reply-To: <20261125-feat_move_i915_helper-v2-0-aa04d39bc415@bootlin.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Move DRM helpers out of i915 driver (rev2)
URL   : https://patchwork.freedesktop.org/series/178881/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7ee4b8b916001215d813d40b6c7cf36095737afa
Author: Kory Maincent <kory.maincent@bootlin.com>
Date:   Wed Nov 25 15:01:14 2026 +0100

    drm: Move DSC capability reading helper out of i915
    
    Move the DSC capability reading helper out of the i915 driver into the
    generic DRM helpers.
    
    No functional change intended.
    
    Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+ /mt/dim checkpatch c27e5cf8c058b97459980fbe86daa8e3bf5f87e1 drm-intel
28cce2604cc2 drm/dp: Move max DPRX link rate helper out of i915
2c856abfe50c drm/dp: Move DPRX 128b/132b link rates helper out of i915
-:28: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#28: FILE: drivers/gpu/drm/display/drm_dp_helper.c:4935:
+	static_assert(DP_TUNNELING_10GBPS_PER_LANE_SUPPORT == DP_UHBR10 &&

-:29: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#29: FILE: drivers/gpu/drm/display/drm_dp_helper.c:4936:
+		      DP_TUNNELING_13_5GBPS_PER_LANE_SUPPORT == DP_UHBR13_5 &&

total: 0 errors, 2 warnings, 0 checks, 54 lines checked
773d4e38eebb drm/dp: Move DPRX 128b/132b support helper out of i915
e0d11808736d drm/dp: Move supported 128b/132b link rates helper out of i915
dd4b542ce955 drm/dp: Move DP sink link rates reading helper out of i915
86a79fea4aa4 drm/dp: Make the DPRX link rates helpers static
44a1c8986aa8 drm/dp: Add drm_dp_read_dpcd_supported_link_rates() helper
8803b8abab49 drm/dp: Move eDP sink link rates reading helper out of i915
243bc637ea50 drm/dp: Make the eDP supported link rates helper static
7ee4b8b91600 drm: Move DSC capability reading helper out of i915


