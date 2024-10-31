Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5184E68974
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 10:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD46410E860;
	Thu, 31 Oct 2024 10:57:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88DF10E85F;
 Thu, 31 Oct 2024 10:57:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_i915=3A_do_not_NUL?=
 =?utf-8?q?L_deref_hdmi_attached=5Fconnector?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sergey Senozhatsky" <senozhatsky@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 10:57:56 -0000
Message-ID: <173037227668.1365305.12023337852034923815@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031105145.2140590-1-senozhatsky@chromium.org>
In-Reply-To: <20241031105145.2140590-1-senozhatsky@chromium.org>
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

Series: drm: i915: do not NULL deref hdmi attached_connector
URL   : https://patchwork.freedesktop.org/series/140760/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 30255c530998d9530cdf252c7b0653ace91593dd
Author: Sergey Senozhatsky <senozhatsky@chromium.org>
Date:   Thu Oct 31 19:51:35 2024 +0900

    drm: i915: do not NULL deref hdmi attached_connector
    
    *** RFC ***
    
    intel_ddi_init() may skip connector initialization, for instance,
    both intel_ddi_init_dp_connector() and intel_ddi_init_hdmi_connector()
    are optional.  This leads to situation that ->attached_connector may
    be NULL for some connectors.  For instance, on my setup 'DDI A/PHY A'
    and 'DDI TC1/PHY TC1' are not initialized.
    
    However, functions like intel_dp_dual_mode_set_tmds_output() and
    friends don't take this into consideration.  This leads to NULL
    ptr-derefs:
    
    KASAN: null-ptr-deref in range [0x0000000000000848-0x000000000000084f]
    RIP: 0010:intel_hdmi_encoder_shutdown+0x105/0x230
    Call Trace:
    <TASK>
    i915_driver_shutdown+0x2d8/0x490
    pci_device_shutdown+0x83/0x150
    device_shutdown+0x4ad/0x660
    __se_sys_reboot+0x29c/0x4d0
    do_syscall_64+0x60/0x90
    
    Add a new helper to avoid NULL ->attached_connector derefs and
    switch some intel_hdmi function to it.  I'm not sure if we need
    to switch all or just intel_dp_dual_mode_set_tmds_output() (I
    have only seen this one doing NULL derefs so far).
    
    Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
+ /mt/dim checkpatch d9e9e1b912c1ade4d9a46403c691ff3a13d8caaf drm-intel
30255c530998 drm: i915: do not NULL deref hdmi attached_connector
-:110: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 67 lines checked


