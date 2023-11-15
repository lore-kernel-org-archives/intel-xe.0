Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8166C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 16:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8F610E0A5;
	Wed, 15 Nov 2023 16:11:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3E8E10E0A5;
 Wed, 15 Nov 2023 16:11:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E2543A3ECB;
 Wed, 15 Nov 2023 16:11:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Wed, 15 Nov 2023 16:11:05 -0000
Message-ID: <170006466592.646.14259391832617611475@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115123625.74286-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231115123625.74286-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AL?=
 =?utf-8?q?SA=3A_hda=3A_i915=3A_Alays_handle_-EPROBE=5FDEFER?=
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

Series: ALSA: hda: i915: Alays handle -EPROBE_DEFER
URL   : https://patchwork.freedesktop.org/series/126463/
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
commit e2a7eba53cd33a2466326d23a60415eb7777d585
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Wed Nov 15 13:36:25 2023 +0100

    ALSA: hda: i915: Alays handle -EPROBE_DEFER
    
    It turns out that even if the comment says that the driver can load
    fine, it's not really the case and no codecs are detected.
    Specifically for -EPROBE_DEFER, always fail the probe.
    
    This fixes a regression when HDA-intel is loaded before i915.
    
    Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
    Fixes: e6d0c13e9f46 ("ALSA: hda: i915: Remove extra argument from snd_hdac_i915_init")
    Cc: Takashi Iwai <tiwai@suse.de>
+ /mt/dim checkpatch eba8bfb1dc87535362e28de282addc8752204df4 drm-intel
e2a7eba53 ALSA: hda: i915: Alays handle -EPROBE_DEFER
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#15: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


