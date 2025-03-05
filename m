Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E94C19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 22:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1344010E83E;
	Wed,  5 Mar 2025 22:51:08 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702AA10E844;
 Wed,  5 Mar 2025 22:51:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe3lpd=3A_Map_PO?=
 =?utf-8?q?WER=5FDOMAIN=5FAUDIO=5FPLAYBACK_to_DC=5Foff_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 22:51:06 -0000
Message-ID: <174121506645.63795.6723300858387110169@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250227-xe3lpd-power-domain-audio-playback-v1-1-5765f21da977@intel.com>
In-Reply-To: <20250227-xe3lpd-power-domain-audio-playback-v1-1-5765f21da977@intel.com>
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

Series: drm/i915/xe3lpd: Map POWER_DOMAIN_AUDIO_PLAYBACK to DC_off (rev2)
URL   : https://patchwork.freedesktop.org/series/145594/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a154118913e51b158b889e53e8216ef5a94beee1
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Thu Feb 27 16:14:25 2025 -0300

    drm/i915/xe3lpd: Map POWER_DOMAIN_AUDIO_PLAYBACK to DC_off
    
    In Xe3_LPD, display audio has the core audio logic located in PG0 and
    per-transcoder logic in the same power well that provides power for the
    transcoder [1].
    
    For stuff like audio device enumeration, we need to ensure that PG0 is
    turned on. For playback, we additionally need the transcoder's power
    well to be enabled.
    
    That essentially means that, for audio playback, there isn't a special
    power well that needs to be enabled, because modeset sequences will
    ensure that the required power wells are enabled.
    
    That said, there might be cases where PG0 could be disabled due to
    display entering DC6 while the audio driver tries to interact with the
    graphics driver for stuff like audio device enumeration.
    
    We recently hit that kind of scenario, where "aplay -l" was being used
    to enumerate audio devices on a PTL machine with PSR enabled and no
    external displays attached.
    
    Since intel_audio_component_get_power() uses
    POWER_DOMAIN_AUDIO_PLAYBACK, make sure to map that power domain to
    DC_off power well, so that we disable dynamic DC states (which includes
    DC6) while the audio driver needs display audio power.
    
    [1] The core-audio vs per-transcoder logic split is not really new in
        Xe3_LPD. This is also true for previous display generations. We need
        to figure out the correct version where this split happened so that
        we can apply fixes in the current power domain mapping.
    
    Bspec: 72519
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
+ /mt/dim checkpatch 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c drm-intel
a154118913e5 drm/i915/xe3lpd: Map POWER_DOMAIN_AUDIO_PLAYBACK to DC_off


