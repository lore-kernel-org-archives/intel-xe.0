Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E0D606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 11:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B704010FB59;
	Wed, 18 Nov 2026 11:49:53 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7FA10E6CB;
 Wed, 18 Nov 2026 11:49:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Move_DRM_helpers_out_of_i?=
 =?utf-8?q?915_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kory Maincent" <kory.maincent@bootlin.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 11:49:52 -0000
Message-ID: <179500259243.42570.15097350088015038930@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118-feat_move_i915_helper-v1-0-652177f3107a@bootlin.com>
In-Reply-To: <20261118-feat_move_i915_helper-v1-0-652177f3107a@bootlin.com>
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

Series: Move DRM helpers out of i915 driver
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
commit 4f1a22a8c2ed3f69a0271ac3eb47fd70a8dfb577
Author: Kory Maincent <kory.maincent@bootlin.com>
Date:   Wed Nov 18 11:36:35 2026 +0100

    drm: Move DSC capability reading helper out of i915
    
    Move the DSC capability reading helper out of the i915 driver into the
    generic DRM helpers.
    
    No functional change intended.
    
    Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+ /mt/dim checkpatch b06015536eeea9b106eccd274e6f8b7bbc180e9f drm-intel
ea133915145c drm/dp: Move max DPRX link rate helper out of i915
d4559767b2ab drm/dp: Move DPRX 128b/132b link rates helper out of i915
-:28: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#28: FILE: drivers/gpu/drm/display/drm_dp_helper.c:4935:
+	static_assert(DP_TUNNELING_10GBPS_PER_LANE_SUPPORT == DP_UHBR10 &&

-:29: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#29: FILE: drivers/gpu/drm/display/drm_dp_helper.c:4936:
+		      DP_TUNNELING_13_5GBPS_PER_LANE_SUPPORT == DP_UHBR13_5 &&

total: 0 errors, 2 warnings, 0 checks, 54 lines checked
b8334c8fa3d2 drm/dp: Move DPRX 128b/132b support helper out of i915
fa250e4e463a drm/dp: Move supported 128b/132b link rates helper out of i915
927957994481 drm/dp: Move DP sink link rates reading helper out of i915
e29117314bcf drm/dp: Make the DPRX link rates helpers static
722c278e8976 drm/dp: Move eDP sink link rates reading helper out of i915
4f1a22a8c2ed drm: Move DSC capability reading helper out of i915


