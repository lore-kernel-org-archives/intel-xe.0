Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA89606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 14:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E5C10E112;
	Thu, 29 Oct 2026 14:55:18 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E118F10E112;
 Thu, 29 Oct 2026 14:55:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dp=3A_Always_use_enha?=
 =?utf-8?q?nced_framing_for_DPCD_r1=2E2+_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmytro Malovanyi" <dmitrymalovanyy@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 14:55:17 -0000
Message-ID: <179328571791.89343.188248147870719472@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
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

Series: drm/dp: Always use enhanced framing for DPCD r1.2+ (rev2)
URL   : https://patchwork.freedesktop.org/series/177157/
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
commit 75a7136a1b4c28c14df71606f96fee2e69e72651
Author: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Date:   Thu Oct 29 11:18:26 2026 +0100

    drm/nouveau: Use enhanced framing for DPCD r1.2+
    
    nv50_sor_dp_watermark_sst() checks DP_ENHANCED_FRAME_CAP for the
    watermark calculation, but the actual enhanced framing enable is
    decided in nvkm, in nvkm_dp_train(), nvkm_uoutp_mthd_dp_sst() and
    r535_dp_train_target(), with its own copy of the check. Convert all of
    them so they keep agreeing with each other.
    
    dispnv50 uses drm_dp_enhanced_frame_cap(). nvkm does not include the
    drm helpers, so add nvkm_dp_enhanced_frame_cap() with the same rule.
    
    Compile tested only, I don't have nvidia hardware.
    
    Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
+ /mt/dim checkpatch e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 drm-intel
86bb95a575d8 drm/dp: Always use enhanced framing for DPCD r1.2+
e54c27cdbdfa drm/bridge: cdns-mhdp8546: Use drm_dp_enhanced_frame_cap()
cf5919439245 drm/bridge: it6505: Use drm_dp_enhanced_frame_cap()
d1dade26f557 drm/gma500: Use drm_dp_enhanced_frame_cap()
-:26: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#26: FILE: drivers/gpu/drm/gma500/cdv_intel_dp.c:265:
+	uint8_t dpcd[DP_RECEIVER_CAP_SIZE];

total: 0 errors, 0 warnings, 1 checks, 20 lines checked
75a7136a1b4c drm/nouveau: Use enhanced framing for DPCD r1.2+
-:28: CHECK:CAMELCASE: Avoid CamelCase: <enhancedFraming>
#28: FILE: drivers/gpu/drm/nouveau/dispnv50/disp.c:1610:
+	bool enhancedFraming = drm_dp_enhanced_frame_cap(outp->dp.dpcd);

total: 0 errors, 0 warnings, 1 checks, 49 lines checked


