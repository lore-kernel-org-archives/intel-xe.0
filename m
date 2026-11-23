Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108DB606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 14:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B608F10E14F;
	Mon, 23 Nov 2026 14:36:23 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4F210E14F;
 Mon, 23 Nov 2026 14:36:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Fix_source?=
 =?utf-8?q?_PHY_updates_for_UHBR_links_with_LTTPRs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Nov 2026 14:36:21 -0000
Message-ID: <179544458195.70423.16940581876666067307@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <aveDNRBLx1a-9hRQ@mail.tty42.de>
In-Reply-To: <aveDNRBLx1a-9hRQ@mail.tty42.de>
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

Series: drm/i915/dp: Fix source PHY updates for UHBR links with LTTPRs
URL   : https://patchwork.freedesktop.org/series/179370/
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
commit a1705d8187ecb8231616425e13c9d66378bff21b
Author: Frederik Schwan <freswa@archlinux.org>
Date:   Mon Nov 23 14:09:54 2026 +0200

    drm/i915/dp: Fix source PHY updates for UHBR links with LTTPRs
    
    128b/132b links use LTTPR-transparent training even when LTTPRs are
    present. The DPRX is trained directly in a single phase, without first
    training each LTTPR PHY separately. The source must therefore program
    its FFE parameters during this DPRX training phase.
    
    The source signal-level update is currently guarded by
    intel_dp_phy_is_downstream_of_source(). With LTTPRs present, this only
    accepts the source-adjacent LTTPR PHY and rejects DP_PHY_DPRX. That is
    appropriate for non-transparent 8b/10b training, but skips the source
    FFE update during 128b/132b training. This affects legacy and DP-alt
    port modes; in TBT-alt mode the Thunderbolt subsystem owns and programs
    the source PHY.
    
    Program the source signal levels for UHBR regardless of the detected
    LTTPRs. Also make the per-lane capability check used by
    intel_dp_get_lane_adjust_tx_ffe_preset() use the source PHY's capability
    for UHBR, rather than treating the DPRX as a separately trained
    receiver behind an LTTPR. Preserve the existing 8b/10b behavior.
    
    Enabling UHBR tunneling exposed this older bug on a ThinkPad P1 Gen 8
    with a ThinkPad Thunderbolt 5 Smart Dock 7500. Updating the source FFE
    presets restores four-lane UHBR20 training and both DP displays.
    
    Fixes: a421d8a99216 ("drm/i915/dp: rewrite DP 2.0 128b/132b link training based on errata")
    Cc: stable@vger.kernel.org # v5.18+
    Link: https://lore.kernel.org/regressions/40e2af4139b94eaeecd41fcdccb4ec1ef3dc098a@intel.com/
    Assisted-by: Codex:gpt-6
    Signed-off-by: Frederik Schwan <freswa@archlinux.org>
    Acked-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch b8e68d05659b6fae1eb6b4883565786fbb15ef45 drm-intel
a1705d8187ec drm/i915/dp: Fix source PHY updates for UHBR links with LTTPRs
-:33: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#33: 
Assisted-by: Codex:gpt-6

-:33: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Codex:gpt-6'
#33: 
Assisted-by: Codex:gpt-6

total: 1 errors, 1 warnings, 0 checks, 44 lines checked


