Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E70E7544B
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 10:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2118D10E0AA;
	Tue,  3 Oct 2023 10:50:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA5D410E0AA;
 Tue,  3 Oct 2023 10:50:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D3C54A03D2;
 Tue,  3 Oct 2023 10:50:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten.lankhorst@linux.intel.com
Date: Tue, 03 Oct 2023 10:50:01 -0000
Message-ID: <169633020183.4382.2677276799592733260@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B01/14=5D_Revert_=22sound/soc/sof=3A_?=
 =?utf-8?q?Remove_deferred_probe_for_SOF=22?=
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


