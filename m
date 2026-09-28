Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE94CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 16:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E0B10E103;
	Mon, 28 Sep 2026 16:51:47 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE23C10E103;
 Mon, 28 Sep 2026 16:51:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/gmbus=3A_Add_bit?=
 =?utf-8?q?-banging_debugfs_control_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Sep 2026 16:51:46 -0000
Message-ID: <179061430697.215488.7895036104818983147@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260928121940.728102-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260928121940.728102-1-ramanaidu.naladala@intel.com>
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

Series: drm/i915/gmbus: Add bit-banging debugfs control (rev2)
URL   : https://patchwork.freedesktop.org/series/174932/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a633bb5a436be19978b391c1533c71989aae3559
Author: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Date:   Mon Sep 28 17:49:40 2026 +0530

    drm/i915/gmbus: Add bit-banging debugfs control
    
    Add a connector debugfs interface to enable or disable I2C
    bit-banging for Intel GMBUS adapters.
    
    v1: Address below review comments: (Jani Nikula)
        - Remove HDMI-specific EDID read path changes.
        - Control bit-banging directly from debugfs via intel_gmbus_force_bit()
    
    v2: Address below review comments: (Jani Nikula)
        - Remove superfluous newline.
        - Move debugfs bit-banging state from struct intel_connector to struct
          intel_gmbus as debugfs_force_bit.
        - Make intel_gmbus_is_adapter() static.
        - Fold NULL adapter check into intel_gmbus_is_adapter().
        - Remove unused intel_gmbus_is_adapter() declaration from header.
    
    Assisted-by: OpenAI Codex:GPT-5
    Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
+ /mt/dim checkpatch 972eeb850a4ca07aba05ccb805db28a33eab2c9a drm-intel
a633bb5a436b drm/i915/gmbus: Add bit-banging debugfs control
-:99: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#99: FILE: drivers/gpu/drm/i915/display/intel_gmbus.c:895:
+static ssize_t intel_force_bit_banging_write(struct file *file,
+						     const char __user *ubuf,

total: 0 errors, 0 warnings, 1 checks, 120 lines checked


