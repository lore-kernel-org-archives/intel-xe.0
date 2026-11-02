Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C06606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 13:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F9B10E5FD;
	Mon,  2 Nov 2026 13:33:24 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD86A10E5FD;
 Mon,  2 Nov 2026 13:33:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dp=5Ftunnel=3A_Allow_?=
 =?utf-8?q?BWA_when_the_DP_IN_adapter_does_not_advertise_it?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Diego_Nogu=C3=AAs_via_B4_Relay?=
 <devnull+diego.sure.gmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 13:33:22 -0000
Message-ID: <179362640283.103049.2736353923651197323@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
In-Reply-To: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
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

Series: drm/dp_tunnel: Allow BWA when the DP IN adapter does not advertise it
URL   : https://patchwork.freedesktop.org/series/177449/
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
commit 34147b2135b733552e07683f10dabbef58ca3d40
Author: Diego Noguês <diego.sure@gmail.com>
Date:   Sat Oct 31 01:18:18 2026 +0100

    drm/dp_tunnel: Allow BWA when the DP IN adapter does not advertise it
    
    On an Alder Lake host (i7-1265U) with a Thunderbolt 4 dock (Dell WD22TB4,
    Goshen Ridge) driving two 4K@60 monitors through two DP tunnels, the
    monitor whose tunnel is created second is limited to 4K@30. Which monitor
    is affected depends only on the order in which they are powered on.
    
    The thunderbolt driver enables the BW allocation mode (BWA) on both DP IN
    adapters: it sets the CM BWA support (DP_USB4_DRIVER_BW_CAPABILITY), a
    group ID and the estimated BW. The DP IN adapter, however, never sets
    DP_IN_BW_ALLOCATION_MODE_SUPPORT in DP_TUNNELING_CAPABILITIES (0xe000d
    reads 0x01), so tunnel_regs_are_valid() rejects the tunnel with:
    
      DPTUN: A non-zero group ID is only allowed with BWA support
    
    i915 then falls back to the static allocation. The first tunnel reserves
    the full DPRX bandwidth (HBR3 x4, 25920 Mb/s), although its stream needs
    about 8.4 Gb/s, and the thunderbolt driver reduces the second tunnel to
    HBR x4 (8640 Mb/s), which is not enough for 4K@60.
    
    The DP IN adapter does handle the BWA registers. Setting
    DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE in
    DP_DPTX_BW_ALLOCATION_MODE_CONTROL by hand sets DPME in the adapter's
    ADP_DP_CS_8, and a following write to DP_REQUEST_BW reaches the
    thunderbolt driver as a DP_BW notification, gets allocated and is
    acknowledged with DP_BW_REQUEST_SUCCEEDED. Reading back
    DP_DPTX_BW_ALLOCATION_MODE_CONTROL returns 0, which the helpers already
    tolerate. The adapter identifies itself as OUI 98-4f-ee, DevID "TR",
    HW rev 13.0, SW rev 2.1.
    
    The connection manager programs a non-zero group ID only right after
    enabling BWA on a DP IN adapter that supports it (see
    tb_dp_bandwidth_alloc_mode_enable()). So when the USB4 driver advertises
    BWA support and a group ID is assigned, treat the tunnel as BWA capable
    even if the DP IN adapter does not set DP_IN_BW_ALLOCATION_MODE_SUPPORT.
    Nothing changes for adapters that set the flag or for tunnels without a
    group ID; the only affected case is the one rejected today.
    
    With this change, and an unmodified thunderbolt driver, i915 enables BWA
    on both tunnels and allocates 8500 Mb/s for the stream behind the dock's
    MST hub (using DSC) and 13000 Mb/s for the other one, so both monitors
    run at 4K@60 in either power-on order.
    
    Fixes: 295654f7e554 ("drm/dp: Add support for DP tunneling")
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17742
    Cc: Imre Deak <imre.deak@intel.com>
    Cc: Mika Westerberg <westeri@kernel.org>
    Assisted-by: Claude:claude-opus-5-5
    Signed-off-by: Diego Noguês <diego.sure@gmail.com>
+ /mt/dim checkpatch 72dae9d330f09a757d9d6a087d6256d2bd69626e drm-intel
34147b2135b7 drm/dp_tunnel: Allow BWA when the DP IN adapter does not advertise it
-:55: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#55: 
Assisted-by: Claude:claude-opus-5-5

-:55: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-5-5'
#55: 
Assisted-by: Claude:claude-opus-5-5

total: 1 errors, 1 warnings, 0 checks, 31 lines checked


