Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2691BCD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D366410E3B7;
	Mon, 25 May 2026 16:57:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BE310E3B6;
 Mon, 25 May 2026 16:57:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1368235839658319099=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/configfs=3A_Constif?=
 =?utf-8?q?y_struct_configfs=5Fitem=5Foperations_and_configfs=5Fgroup=5Foper?=
 =?utf-8?q?ations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 16:57:49 -0000
Message-ID: <177972826958.5829.14249522418775224201@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <ee83bb3bc0518db4a0a73c3e8df814a45549a064.1779712504.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <ee83bb3bc0518db4a0a73c3e8df814a45549a064.1779712504.git.christophe.jaillet@wanadoo.fr>
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

--===============1368235839658319099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/configfs: Constify struct configfs_item_operations and configfs_group_operations
URL   : https://patchwork.freedesktop.org/series/167212/
State : success

== Summary ==

CI Bug Log - changes from xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4_FULL -> xe-pw-167212v1_FULL
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

  New tests have been introduced between xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4_FULL and xe-pw-167212v1_FULL:

### New IGT tests (119) ###

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.40] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.40] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.42] s

  * igt@kms_flip@absolute-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.44] s

  * igt@kms_flip@absolute-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.43] s

  * igt@kms_flip@absolute-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.42] s

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_flip@basic-flip-vs-modeset@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.40] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.42] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.41] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.42] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.43] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.41] s

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.50] s

  * igt@kms_flip@blocking-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.69] s

  * igt@kms_flip@blocking-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@busy-flip@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_flip@busy-flip@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_flip@busy-flip@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.28] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.22] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@dpms-off-confusion@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.29] s

  * igt@kms_flip@dpms-off-confusion@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@dpms-off-confusion@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.28] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.96] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_flip@dpms-vs-vblank-race@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.34] s

  * igt@kms_flip@dpms-vs-vblank-race@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_flip@dpms-vs-vblank-race@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.64] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.63] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.62] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.70] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.77] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.51] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - Statuses : 1 fail(s)
    - Exec time: [6.38] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.27] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.23] s

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - Statuses : 1 fail(s)
    - Exec time: [1.29] s

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - Statuses : 1 fail(s)
    - Exec time: [3.20] s

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - Statuses : 1 fail(s)
    - Exec time: [4.78] s

  * igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.80] s

  * igt@kms_flip@flip-vs-panning-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.35] s

  * igt@kms_flip@flip-vs-panning-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.30] s

  * igt@kms_flip@flip-vs-panning-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.32] s

  * igt@kms_flip@flip-vs-panning-vs-hang@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_flip@flip-vs-panning@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.30] s

  * igt@kms_flip@flip-vs-panning@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.31] s

  * igt@kms_flip@flip-vs-panning@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.31] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.23] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.22] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.27] s

  * igt@kms_flip@flip-vs-rmfb@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.28] s

  * igt@kms_flip@flip-vs-rmfb@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@flip-vs-rmfb@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.20] s

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [12.55] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.07] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_flip@modeset-vs-vblank-race@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_flip@modeset-vs-vblank-race@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.06] s

  * igt@kms_flip@modeset-vs-vblank-race@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.07] s

  * igt@kms_flip@nonexisting-fb-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_flip@nonexisting-fb-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_flip@nonexisting-fb-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_flip@nonexisting-fb@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_flip@nonexisting-fb@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_flip@nonexisting-fb@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.50] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.52] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.50] s

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@plain-flip-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_flip@plain-flip-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_flip@plain-flip-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.49] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.52] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.51] s

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.49] s

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.52] s

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.54] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.78] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.49] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.55] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.51] s

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.72] s

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.72] s

  

Known issues
------------

  Here are the changes found in xe-pw-167212v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1125] / [Intel XE#7312])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][2] -> [FAIL][3] ([Intel XE#3718] / [Intel XE#6078])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#6078])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2390] / [Intel XE#6974])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2244])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#3321]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1 (NEW):
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1 (NEW):
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301] / [Intel XE#3149])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1397] / [Intel XE#7385])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#6312]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4141]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6312] / [Intel XE#651])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7061])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7905]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2313]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1489])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr@pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2234] / [Intel XE#2850])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#2142]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7644])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6540] / [Intel XE#688])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7482])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2322] / [Intel XE#7372])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7136]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7136]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6874]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6874])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-basic:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7138])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7138])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6964])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7793])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7892])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [FAIL][46] ([Intel XE#7950]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@fbdev@unaligned-write.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@fbdev@unaligned-write.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][48] ([Intel XE#7915]) -> [PASS][49] +3 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][50] ([Intel XE#6321]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][52] ([Intel XE#6703]) -> [PASS][53] +49 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html

  * igt@xe_vm@large-userptr-misaligned-binds-16777216:
    - shard-bmg:          [DMESG-FAIL][54] ([Intel XE#5545]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-16777216.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@xe_vm@large-userptr-misaligned-binds-16777216.html

  
#### Warnings ####

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-bmg:          [SKIP][56] ([Intel XE#6703]) -> [SKIP][57] ([Intel XE#2252])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][58] ([Intel XE#301]) -> [FAIL][59] ([Intel XE#301] / [Intel XE#3149])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][60] ([Intel XE#6703]) -> [SKIP][61] ([Intel XE#2311]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][62] ([Intel XE#6703]) -> [SKIP][63] ([Intel XE#2313]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][64] ([Intel XE#6703]) -> [SKIP][65] ([Intel XE#7061] / [Intel XE#7356])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [SKIP][67] ([Intel XE#1489]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          [SKIP][68] ([Intel XE#6703]) -> [SKIP][69] ([Intel XE#7636]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_eudebug@connect-user.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@xe_eudebug@connect-user.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][70] ([Intel XE#6703]) -> [SKIP][71] ([Intel XE#6874]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7950


Build changes
-------------

  * Linux: xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4 -> xe-pw-167212v1

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4: cd7e65a9c3a38736427bbd62baf2aaa1240902a4
  xe-pw-167212v1: 167212v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/index.html

--===============1368235839658319099==
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
<tr><td><b>Series:</b></td><td>drm/xe/configfs: Constify struct configfs_item_operations and configfs_group_operations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167212/">https://patchwork.freedesktop.org/series/167212/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4_FULL -&gt; xe-pw-167212v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4_FULL and xe-pw-167212v1_FULL:</p>
<h3>New IGT tests (119)</h3>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.72] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167212v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312">Intel XE#7312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1 (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1 (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_ccs@vm-bind-fault-mode-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318">Intel XE#7318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_evict@evict-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coherency-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-5/igt@xe_page_reclaim@binds-large-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@fbdev@unaligned-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7950">Intel XE#7950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-16777216:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-16777216.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@xe_vm@large-userptr-misaligned-binds-16777216.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167212v1/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4 -&gt; xe-pw-167212v1</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4: cd7e65a9c3a38736427bbd62baf2aaa1240902a4<br />
  xe-pw-167212v1: 167212v1</p>

</body>
</html>

--===============1368235839658319099==--
