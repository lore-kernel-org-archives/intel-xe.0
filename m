Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A412FC00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 11:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5828C10E351;
	Tue, 24 Oct 2023 11:15:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5568610E352;
 Tue, 24 Oct 2023 11:14:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 53AE7AA915;
 Tue, 24 Oct 2023 11:14:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Tue, 24 Oct 2023 11:14:59 -0000
Message-ID: <169814609934.18361.8393658738120924183@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231024105433.715843-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231024105433.715843-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B01/15=5D_Revert_=22sound/soc/sof=3A_Remov?=
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

Series: series starting with [01/15] Revert "sound/soc/sof: Remove deferred probe for SOF"
URL   : https://patchwork.freedesktop.org/series/125501/
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
commit 67fef806dffaca81567d5fbd89ce7f839d68f4fa
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Oct 24 12:54:33 2023 +0200

    ALSA: hda: i915: Remove extra argument from snd_hdac_i915_init
    
    Now that all drivers have moved from modprobe loading to
    handling -EPROBE_DEFER, we can remove the argument again.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
    Link: https://lore.kernel.org/r/20231009115437.99976-14-maarten.lankhorst@linux.intel.com
    Signed-off-by: Takashi Iwai <tiwai@suse.de>
    (cherry picked from commit e6d0c13e9f46f9cf83f2f4946b0a2954599552a7)
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
dc49fed2a Revert "sound/soc/sof: Remove deferred probe for SOF"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '53bccb72d202d8fa8575e81d1c78adc4e6a6ea1f', maybe rebased or not pulled?
#6: 
This reverts commit 53bccb72d202d8fa8575e81d1c78adc4e6a6ea1f.

total: 0 errors, 1 warnings, 0 checks, 194 lines checked
a14f9155b Revert "sound/hda: Allow XE as i915 replacement for sound"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '3cfcbd459fdcb8387b29869f96540654acc833ab', maybe rebased or not pulled?
#6: 
This reverts commit 3cfcbd459fdcb8387b29869f96540654acc833ab.

total: 0 errors, 1 warnings, 0 checks, 150 lines checked
45e78b9e5 ASoC: SOF: core: Ensure sof_ops_free() is still called when probe never ran.
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '31bb7bd9ffee', maybe rebased or not pulled?
#12: 
Fixes: 31bb7bd9ffee ("ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful")

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
259631518 ASoC: SOF: core: Add probe_early and remove_late callbacks
f02c926f6 ASoC: SOF: Intel: hda: start splitting the probe
2456c1b0b ASoC: SOF: Intel: Fix error handling in hda_init()
5eea251f1 ALSA: hda: Intel: Fix error handling in azx_probe()
3b0bc9ba8 ALSA: hda: i915: Allow override of gpu binding.
729df3530 ALSA: hda: i915: Add an allow_modprobe argument to snd_hdac_i915_init
-:39: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#39: FILE: include/sound/hda_i915.h:17:
 }
+static inline int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)

total: 0 errors, 0 warnings, 1 checks, 73 lines checked
9ca73f390 ALSA: hda: i915: Allow xe as match for i915_component_master_match
-:33: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#33: FILE: sound/hda/hdac_i915.c:119:
+	if ((!strcmp(dev->driver->name, "i915") ||
+		 !strcmp(dev->driver->name, "xe")) &&

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
a751521f5 ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
9f73046d4 ALSA: hda: Intel: Move snd_hdac_i915_init to before probe_work.
c3fbe92c0 ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
05be6f95a ASoC: SOF: Intel: Move binding to display driver outside of deferred probe
67fef806d ALSA: hda: i915: Remove extra argument from snd_hdac_i915_init
-:31: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#31: FILE: include/sound/hda_i915.h:17:
 }
+static inline int snd_hdac_i915_init(struct hdac_bus *bus)

total: 0 errors, 0 warnings, 1 checks, 74 lines checked


