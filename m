Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50302C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 20:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0168310E62A;
	Wed, 26 Aug 2026 20:29:25 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5485E10E33D;
 Wed, 26 Aug 2026 20:29:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8511754063194783157=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/hdmi=3A_Add_debug?=
 =?utf-8?q?fs_knob_to_force_EDID_reads_over_GPIO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 20:29:23 -0000
Message-ID: <178777616333.88179.8277866158845452210@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826152335.2822798-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260826152335.2822798-1-ramanaidu.naladala@intel.com>
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

--===============8511754063194783157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdmi: Add debugfs knob to force EDID reads over GPIO
URL   : https://patchwork.freedesktop.org/series/172803/
State : success

== Summary ==

CI Bug Log - changes from xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6_FULL -> xe-pw-172803v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6_FULL and xe-pw-172803v1_FULL:

### New IGT tests (116) ###

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.11] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.11] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.11] s

  * igt@kms_flip@absolute-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_flip@absolute-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_flip@absolute-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.14] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.40] s

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@bo-too-big-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_flip@bo-too-big-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_flip@bo-too-big-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_flip@bo-too-big@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip@bo-too-big@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_flip@bo-too-big@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_flip@busy-flip@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@busy-flip@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@busy-flip@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@dpms-off-confusion@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@dpms-off-confusion@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@dpms-off-confusion@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.37] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_flip@flip-vs-panning-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_flip@flip-vs-rmfb@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@flip-vs-rmfb@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@flip-vs-rmfb@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.84] s

  * igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip@nonexisting-fb@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_flip@nonexisting-fb@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_flip@nonexisting-fb@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.31] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.35] s

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  * igt@kms_flip@plain-flip-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@plain-flip-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.31] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.31] s

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.36] s

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.35] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.37] s

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  

Known issues
------------

  Here are the changes found in xe-pw-172803v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#367]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#8265])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#301])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#4141]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7061] / [Intel XE#7356])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2311]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2313]) +9 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7061])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7283])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1489]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2234] / [Intel XE#2850])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2330] / [Intel XE#5813])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6503])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_sharpness_filter@filter-tap.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][22] -> [INCOMPLETE][23] ([Intel XE#6321] / [Intel XE#8355]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8374])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#8364]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8378])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [PASS][27] -> [ABORT][28] ([Intel XE#8007]) +1 other test abort
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#8555]) +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-4/igt@xe_pmu@engine-activity-accuracy-50.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-6/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4733] / [Intel XE#7417])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][32] ([Intel XE#8963])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][33] ([Intel XE#3321]) -> [PASS][34] +1 other test pass
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][35] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][36] +1 other test pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][37] ([Intel XE#1503]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][39] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][40] ([Intel XE#301]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][41] ([Intel XE#3544]) -> [SKIP][42] ([Intel XE#3374] / [Intel XE#3544])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963


Build changes
-------------

  * Linux: xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 -> xe-pw-172803v1

  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6: 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6
  xe-pw-172803v1: 172803v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/index.html

--===============8511754063194783157==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/i915/hdmi: Add debugfs knob to force EDID reads over GPIO</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172803/">https://patchwork.freedesktop.org/series/172803/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6_FULL -&gt; xe-pw-172803v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6_FULL and xe-pw-172803v1_FULL:</p>
<h3>New IGT tests (116)</h3>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172803v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-4/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-6/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555">Intel XE#8555</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172803v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 -&gt; xe-pw-172803v1</li>
</ul>
<p>IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6: 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6<br />
  xe-pw-172803v1: 172803v1</p>

</body>
</html>

--===============8511754063194783157==--
