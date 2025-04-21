Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D86C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B4610E487;
	Mon, 21 Apr 2025 16:44:06 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A0C10E487;
 Mon, 21 Apr 2025 16:44:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Apr 2025 16:44:06 -0000
Message-ID: <174525384649.22838.4257367825698275600@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250421154900.2095202-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250421154900.2095202-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB
URL   : https://patchwork.freedesktop.org/series/148025/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e57e95ac148482d751c1e7b3be86d55ff82eba2a
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Mon Apr 21 21:19:00 2025 +0530

    drm/i915/vrr: enable dc balance bit
    
    enable dc balance from vrr compute config when vrr is
    enabled in adaptive vtotal mode
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch dc7f23c4cada96925696c13525cad17bdbc3d33e drm-intel
1be25229524c drm/i915/vrr: Refactor vmin/vmax stuff
c0b6889b41e0 drm/i915/vrr: Add functions to read out vmin/vmax stuff
ee03e3bc2ba7 drm/i915/display: Add source param for dc balance
f08b6e9f027e drm/i915/vrr: Add enable/disable calls for DC Balance
f201df54941b drm/i915/vrr: Add compute config for DC balance params
b683f385ad2a drm/i915/vrr: Add state dump for dc balance params
c4f150f4d038 drm/i915: Extract vrr_vblank_start()
270d435b369c drm/i915/vrr: Implement vblank evasion with DC balancing
bec7d9439da5 drm/i915/dsb: Add pipedmc dc balance enable/disable
5f74a9c275ad drm/i915/vrr: Pause DC balancing for DSB commits
1eb90ec7f478 drm/i915/vrr: Add state checker for dc balance params
bbda04894c33 drm/i915/display: Prepare state checker for dc balance enable
e57e95ac1484 drm/i915/vrr: enable dc balance bit


