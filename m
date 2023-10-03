Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559C2E7544B
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 10:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E70410E0A3;
	Tue,  3 Oct 2023 10:50:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5406610E0A3;
 Tue,  3 Oct 2023 10:50:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 52CEEA03D2;
 Tue,  3 Oct 2023 10:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten.lankhorst@linux.intel.com
Date: Tue, 03 Oct 2023 10:50:26 -0000
Message-ID: <169633022633.4380.2698312709234808234@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B01/14=5D_Revert_=22sound/soc/sof=3A_Remov?=
 =?utf-8?q?e_deferred_probe_for_SOF=22?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [01/14] Revert "sound/soc/sof: Remove deferred probe for SOF"
URL   : https://patchwork.freedesktop.org/series/124538/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3f51b5e1a60b4015d2e7cf3b0ffa3deb7295e2cf
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon Oct 2 21:38:47 2023 +0200

    ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init
    
    Now that all drivers have moved from modprobe loading to
    handling -EPROBE_DEFER, we can remove the argument again.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 02ab43e36623665d8644d46162bd4ec5eeb68489 drm-intel
f34c59ff2 Revert "sound/soc/sof: Remove deferred probe for SOF"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '53bccb72d202d8fa8575e81d1c78adc4e6a6ea1f', maybe rebased or not pulled?
#6: 
This reverts commit 53bccb72d202d8fa8575e81d1c78adc4e6a6ea1f.

-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:240: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 194 lines checked
d424201ef Revert "sound/hda: Allow XE as i915 replacement for sound"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '3cfcbd459fdcb8387b29869f96540654acc833ab', maybe rebased or not pulled?
#6: 
This reverts commit 3cfcbd459fdcb8387b29869f96540654acc833ab.

-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:182: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 150 lines checked
d5ff76582 ASoC/SOF/core: Ensure sof_ops_free() is still called when probe never ran.
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '31bb7bd9ffee', maybe rebased or not pulled?
#12: 
Fixes: 31bb7bd9ffee ("ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful")

-:41: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 20 lines checked
43e06023f ASoC: SOF: core: Add probe_early and remove_late callbacks
3c1d39d5e ASoC: SOF: Intel: hda: start splitting the probe
7d1d68249 ALSA: hda/intel: Fix error handling in azx_probe()
d51cfd49e ALSA: hda/i915: Allow override of gpu binding.
0f186c231 ALSA: hda/i915: Add an allow_modprobe argument to snd_hdac_i915_init
-:36: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#36: FILE: include/sound/hda_i915.h:17:
 }
+static inline int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)

total: 0 errors, 0 warnings, 1 checks, 73 lines checked
ff1f7ee5a ALSA: hda/i915: Allow xe as match for i915_component_master_match
-:30: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#30: FILE: sound/hda/hdac_i915.c:119:
+	if ((!strcmp(dev->driver->name, "i915") ||
+		 !strcmp(dev->driver->name, "xe")) &&

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
80775807e ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
3e5770d8f ALSA: hda/intel: Move snd_hdac_i915_init to before probe_work.
54c2b776e ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
15ec4b46c ASoC: SOF: Intel: Move binding to display driver outside of deferred probe
3f51b5e1a ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init
-:28: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#28: FILE: include/sound/hda_i915.h:17:
 }
+static inline int snd_hdac_i915_init(struct hdac_bus *bus)

total: 0 errors, 0 warnings, 1 checks, 74 lines checked


