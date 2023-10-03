Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E881AE7544F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2F10E04E;
	Tue,  3 Oct 2023 12:18:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDC7B10E04E;
 Tue,  3 Oct 2023 12:18:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DB88DA03D2;
 Tue,  3 Oct 2023 12:18:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten.lankhorst@linux.intel.com
Date: Tue, 03 Oct 2023 12:18:55 -0000
Message-ID: <169633553589.4380.3474185882344982043@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Up?=
 =?utf-8?q?date_sound_patches_to_upstreamable_versions=2E?=
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

Series: Update sound patches to upstreamable versions.
URL   : https://patchwork.freedesktop.org/series/124557/
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
commit ce1f5f74f4057d80df69e741b426477fc852bc9c
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Oct 3 14:00:33 2023 +0200

    ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init
    
    Now that all drivers have moved from modprobe loading to
    handling -EPROBE_DEFER, we can remove the argument again.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 02ab43e36623665d8644d46162bd4ec5eeb68489 drm-intel
6eb55128a Revert "sound/soc/sof: Remove deferred probe for SOF"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '53bccb72d202d8fa8575e81d1c78adc4e6a6ea1f', maybe rebased or not pulled?
#6: 
This reverts commit 53bccb72d202d8fa8575e81d1c78adc4e6a6ea1f.

-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:240: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 194 lines checked
26834a3b2 Revert "sound/hda: Allow XE as i915 replacement for sound"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '3cfcbd459fdcb8387b29869f96540654acc833ab', maybe rebased or not pulled?
#6: 
This reverts commit 3cfcbd459fdcb8387b29869f96540654acc833ab.

-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:182: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 150 lines checked
21859e0be ASoC/SOF/core: Ensure sof_ops_free() is still called when probe never ran.
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '31bb7bd9ffee', maybe rebased or not pulled?
#12: 
Fixes: 31bb7bd9ffee ("ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful")

-:41: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 20 lines checked
e83316036 ASoC: SOF: core: Add probe_early and remove_late callbacks
c6ede8f27 ASoC: SOF: Intel: hda: start splitting the probe
33c3489fd ALSA: hda/intel: Fix error handling in azx_probe()
a581fd0a5 ALSA: hda/i915: Allow override of gpu binding.
d6f3b131d ALSA: hda/i915: Add an allow_modprobe argument to snd_hdac_i915_init
-:36: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#36: FILE: include/sound/hda_i915.h:17:
 }
+static inline int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)

total: 0 errors, 0 warnings, 1 checks, 73 lines checked
39e849b81 ALSA: hda/i915: Allow xe as match for i915_component_master_match
-:30: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#30: FILE: sound/hda/hdac_i915.c:119:
+	if ((!strcmp(dev->driver->name, "i915") ||
+		 !strcmp(dev->driver->name, "xe")) &&

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
c96430b23 ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
894ee14ae ALSA: hda/intel: Move snd_hdac_i915_init to before probe_work.
d2a10bd60 ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
7a4e58d97 ASoC: SOF: Intel: Move binding to display driver outside of deferred probe
ce1f5f74f ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init
-:28: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#28: FILE: include/sound/hda_i915.h:17:
 }
+static inline int snd_hdac_i915_init(struct hdac_bus *bus)

total: 0 errors, 0 warnings, 1 checks, 74 lines checked


