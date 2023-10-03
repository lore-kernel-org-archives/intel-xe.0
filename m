Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E22E7544F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659FD10E2CC;
	Tue,  3 Oct 2023 12:18:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D079110E284;
 Tue,  3 Oct 2023 12:18:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CB345A03D2;
 Tue,  3 Oct 2023 12:18:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten.lankhorst@linux.intel.com
Date: Tue, 03 Oct 2023 12:18:30 -0000
Message-ID: <169633551079.4382.14203495209575152695@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Update_sound_patches_to_upstreamable_versions=2E?=
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
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 02ab43e36 drm/xe: Fix exec queue usage for unbinds
=== git am output follows ===
Applying: Revert "sound/soc/sof: Remove deferred probe for SOF"
Applying: Revert "sound/hda: Allow XE as i915 replacement for sound"
Applying: ASoC/SOF/core: Ensure sof_ops_free() is still called when probe never ran.
Applying: ASoC: SOF: core: Add probe_early and remove_late callbacks
Applying: ASoC: SOF: Intel: hda: start splitting the probe
Applying: ALSA: hda/intel: Fix error handling in azx_probe()
Applying: ALSA: hda/i915: Allow override of gpu binding.
Applying: ALSA: hda/i915: Add an allow_modprobe argument to snd_hdac_i915_init
Applying: ALSA: hda/i915: Allow xe as match for i915_component_master_match
Applying: ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
Applying: ALSA: hda/intel: Move snd_hdac_i915_init to before probe_work.
Applying: ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
Applying: ASoC: SOF: Intel: Move binding to display driver outside of deferred probe
Applying: ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init


