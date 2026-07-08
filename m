Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241C1C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 11:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CBA10E5B8;
	Wed,  8 Jul 2026 11:52:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C0C10E5D8;
 Wed,  8 Jul 2026 11:52:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/audio=3A_treat_U?=
 =?utf-8?q?HBR_SST_like_MST_for_cpu=5Ftranscoder_signalling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jul 2026 11:52:11 -0000
Message-ID: <178351153180.164302.8954190341450149569@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260708113558.1863316-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260708113558.1863316-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/audio: treat UHBR SST like MST for cpu_transcoder signalling (rev3)
URL   : https://patchwork.freedesktop.org/series/169869/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3e95200bad4342a9b59bb6e43667674cc7c68542
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Wed Jul 8 17:05:58 2026 +0530

    drm/i915/audio: treat UHBR SST like MST for cpu_transcoder signalling
    
    Both DP MST and UHBR SST require the audio component to use a real
    cpu_transcoder (>= 0) value to identify the audio stream on a port.
    For DP MST this was already handled; for UHBR SST it was not, causing
    pin_eld_notify() to signal cpu_transcoder = -1 (the legacy SST sentinel)
    and find_audio_state() to skip the per-transcoder entry for the UHBR
    stream.
    
    After suspend/resume or replug, the ELD lookup fails and audio goes
    silent. Fix by detecting UHBR SST alongside DP MST when deciding
    whether a real cpu_transcoder value must be used for audio state
    addressing, in both the pin_eld_notify() signalling and the
    find_audio_state() lookup paths.
    
    --v2:
    - Commit message and comment update. (Suraj)
    - Change function name has_mst_transcoder. (Suraj)
    - Avoid Live crtc access in find_audio_state. (Suraj)
    
    --v3:
    - Minor comment changes to avoid MST over 128b/132b confusion. (Suraj)
    
    Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 9b694cd27abefa4db093de904cfe97a885bbc3f6 drm-intel
3e95200bad43 drm/i915/audio: treat UHBR SST like MST for cpu_transcoder signalling
-:126: WARNING:PREFER_FALLTHROUGH: Prefer 'fallthrough;' over fallthrough comment
#126: FILE: drivers/gpu/drm/i915/display/intel_audio.c:1151:
+ * cpu_transcoder =  0 & !needs_cpu_transcoder_id: falls through to the port-only

total: 0 errors, 1 warnings, 0 checks, 123 lines checked


