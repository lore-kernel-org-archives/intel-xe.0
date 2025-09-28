Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C67CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 09:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD3789870;
	Sun, 28 Sep 2025 09:31:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF13989870;
 Sun, 28 Sep 2025 09:31:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7811637621599246001=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Optimize_vrr=2Eguardband_a?=
 =?utf-8?q?nd_fix_LRR_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 28 Sep 2025 09:31:18 -0000
Message-ID: <175905187882.373715.5557182036113414138@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250928070541.3892890-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250928070541.3892890-1-ankit.k.nautiyal@intel.com>
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

--===============7811637621599246001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Optimize vrr.guardband and fix LRR (rev13)
URL   : https://patchwork.freedesktop.org/series/151244/
State : failure

== Summary ==

CI Bug Log - changes from xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412_FULL -> xe-pw-151244v13_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151244v13_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151244v13_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151244v13_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-435/igt@kms_cursor_legacy@single-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-433/igt@kms_cursor_legacy@single-move.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  
#### Warnings ####

  * igt@xe_exec_threads@threads-mixed-userptr-rebind:
    - shard-bmg:          [DMESG-FAIL][6] ([Intel XE#3876]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_exec_threads@threads-mixed-userptr-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@xe_exec_threads@threads-mixed-userptr-rebind.html

  
New tests
---------

  New tests have been introduced between xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412_FULL and xe-pw-151244v13_FULL:

### New IGT tests (292) ###

  * igt@kms_content_protection@content-type-change:
    - Statuses : 3 skip(s)
    - Exec time: [0.29, 2.35] s

  * igt@kms_content_protection@mei-interface:
    - Statuses : 3 skip(s)
    - Exec time: [0.00, 1.12] s

  * igt@kms_flip_event_leak@basic@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.44] s

  * igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_flip_event_leak@basic@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.26] s

  * igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_event_leak@basic@pipe-c-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.29] s

  * igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_lease@atomic-implicit-crtc:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-c-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@cursor-implicit-plane:
    - Statuses : 4 pass(s)
    - Exec time: [0.66, 2.90] s

  * igt@kms_lease@cursor-implicit-plane@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_lease@cursor-implicit-plane@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_lease@cursor-implicit-plane@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_lease@cursor-implicit-plane@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_lease@cursor-implicit-plane@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_lease@cursor-implicit-plane@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_lease@cursor-implicit-plane@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_lease@cursor-implicit-plane@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_lease@cursor-implicit-plane@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_lease@cursor-implicit-plane@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_lease@cursor-implicit-plane@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_lease@cursor-implicit-plane@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_lease@cursor-implicit-plane@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_lease@cursor-implicit-plane@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_lease@cursor-implicit-plane@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_lease@empty-lease:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_lease@empty-lease@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@empty-lease@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again:
    - Statuses : 4 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-again@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-again@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-again@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-again@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-again@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-again@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_lease@lease-get@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-get@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_lease@lease-invalid-connector@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-connector@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_lease@lease-invalid-crtc@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_lease@lease-invalid-plane@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-plane@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-revoke:
    - Statuses : 4 pass(s)
    - Exec time: [0.03, 0.40] s

  * igt@kms_lease@lease-revoke@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@kms_lease@lease-revoke@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-revoke@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-revoke@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-revoke@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-revoke@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-revoke@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-revoke@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-revoke@pipe-c-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-revoke@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-revoke@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-revoke@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-revoke@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-revoke@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-revoke@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-connector:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.23] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-unleased-connector@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-unleased-connector@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-unleased-crtc:
    - Statuses : 4 pass(s)
    - Exec time: [0.16, 1.10] s

  * igt@kms_lease@lease-unleased-crtc@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.12] s

  * igt@kms_lease@lease-unleased-crtc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-crtc@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@kms_lease@lease-unleased-crtc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-crtc@pipe-c-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-crtc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-crtc@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lessee-list:
    - Statuses : 4 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lessee-list@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lessee-list@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lessee-list@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lessee-list@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lessee-list@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@page-flip-implicit-plane:
    - Statuses : 3 pass(s)
    - Exec time: [0.82, 3.01] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_lease@setcrtc-implicit-plane:
    - Statuses : 3 pass(s)
    - Exec time: [0.78, 2.34] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_lease@simple-lease:
    - Statuses : 3 pass(s)
    - Exec time: [0.86, 3.38] s

  * igt@kms_lease@simple-lease@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_lease@simple-lease@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_lease@simple-lease@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_lease@simple-lease@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_lease@simple-lease@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_lease@simple-lease@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_lease@simple-lease@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_lease@simple-lease@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_lease@simple-lease@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_lease@simple-lease@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_lease@simple-lease@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - Statuses : 4 pass(s)
    - Exec time: [1.02, 2.38] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_alpha_blend@alpha-basic:
    - Statuses : 4 pass(s)
    - Exec time: [5.10, 6.38] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.77] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - Statuses : 4 pass(s)
    - Exec time: [0.98, 2.54] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - Statuses : 4 pass(s)
    - Exec time: [1.00, 2.41] s

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - Statuses : 3 pass(s)
    - Exec time: [1.79, 2.01] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - Statuses : 4 pass(s)
    - Exec time: [1.39, 3.02] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - Statuses : 3 pass(s)
    - Exec time: [1.34, 2.73] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - Statuses : 4 pass(s)
    - Exec time: [0.91, 2.20] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - Statuses : 4 pass(s)
    - Exec time: [0.82, 2.31] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.04, 2.47] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.03, 4.05] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.03, 1.77] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - Statuses : 4 pass(s)
    - Exec time: [2.19, 4.10] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - Statuses : 4 pass(s)
    - Exec time: [3.66, 6.70] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - Statuses : 4 pass(s)
    - Exec time: [1.51, 3.42] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - Statuses : 4 pass(s)
    - Exec time: [2.16, 3.86] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - Statuses : 4 pass(s)
    - Exec time: [3.65, 6.12] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - Statuses : 4 pass(s)
    - Exec time: [1.52, 3.48] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - Statuses : 4 pass(s)
    - Exec time: [2.20, 3.89] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - Statuses : 4 pass(s)
    - Exec time: [3.63, 5.47] s

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - Statuses : 4 pass(s)
    - Exec time: [1.51, 3.24] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - Statuses : 4 pass(s)
    - Exec time: [2.19, 3.83] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - Statuses : 4 pass(s)
    - Exec time: [3.64, 5.60] s

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - Statuses : 3 pass(s)
    - Exec time: [1.51, 1.81] s

  

Known issues
------------

  Here are the changes found in xe-pw-151244v13_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#316])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#610])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][11] ([Intel XE#4543]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2191]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +174 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#787]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#4417] / [Intel XE#455])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#4417]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#306])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#306]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#373]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#373]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][29] ([Intel XE#1178])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_content_protection@legacy@pipe-a-dp-2.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][30] ([Intel XE#1178])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1188])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#309])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2291]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#4354])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#4354])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4422])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2316]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#4543] / [Intel XE#5208])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#4543]) +12 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          [PASS][46] -> [INCOMPLETE][47] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#455]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#651]) +16 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#651]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#653]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2313])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#653]) +16 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#656]) +9 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][55] -> [SKIP][56] ([Intel XE#455])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#3012])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#356])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [PASS][59] -> [DMESG-WARN][60] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2938])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#2939] / [Intel XE#5585])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#2939])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#1435])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#362])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1500])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#330])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#455] / [Intel XE#5632]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#5890]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1126])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4837]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#4837] / [Intel XE#5565])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#4518])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_evict@evict-beng-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#1392]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1392] / [Intel XE#5575])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2322])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#288]) +12 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#288] / [Intel XE#5561]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4943])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-new-bo-map:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#4915]) +52 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@xe_exec_system_allocator@many-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:
    - shard-bmg:          [PASS][89] -> [ABORT][90] ([Intel XE#3970])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-new-bo-map.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#4915]) +115 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         NOTRUN -> [ABORT][92] ([Intel XE#5530])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#560])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#5100])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119]) -> ([PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [SKIP][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145]) ([Intel XE#2457])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-5/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-5/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-4/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-4/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-5/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-5/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-1/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-4/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-1/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#3573]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2838] / [Intel XE#979])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2284] / [Intel XE#366])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#4733])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#944]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#4130]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][153] ([Intel XE#3862]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][155] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][157] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][159] ([Intel XE#2291]) -> [PASS][160] +5 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][161] ([Intel XE#3009]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_dp_aux_dev.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][163] ([Intel XE#2316]) -> [PASS][164] +3 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#4543]) -> [PASS][166] +13 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][167] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][168] +3 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][169] ([Intel XE#1874]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][171] ([Intel XE#4543]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][173] -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][175] ([Intel XE#4596]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@basic@pipe-a-dp-2:
    - shard-bmg:          [FAIL][177] ([Intel XE#2883]) -> [PASS][178] +6 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@kms_setmode@basic@pipe-a-dp-2.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@kms_setmode@basic@pipe-a-dp-2.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][179] ([Intel XE#2883]) -> [PASS][180] +3 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][181] ([Intel XE#1435]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [FAIL][183] ([Intel XE#4227]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][185] ([Intel XE#1499]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1392]) -> [PASS][188] +4 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#3876]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@fault-benchmark:
    - shard-bmg:          [TIMEOUT][191] -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_exec_system_allocator@fault-benchmark.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-5/igt@xe_exec_system_allocator@fault-benchmark.html

  * {igt@xe_exec_system_allocator@many-64k-new-prefetch}:
    - shard-lnl:          [CRASH][193] ([Intel XE#6192]) -> [PASS][194] +9 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-8/igt@xe_exec_system_allocator@many-64k-new-prefetch.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html

  * {igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise}:
    - shard-bmg:          [CRASH][195] ([Intel XE#6192]) -> [PASS][196] +11 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-4/igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise.html

  * igt@xe_exec_threads@threads-mixed-userptr-rebind:
    - shard-adlp:         [FAIL][197] -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@xe_exec_threads@threads-mixed-userptr-rebind.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_exec_threads@threads-mixed-userptr-rebind.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [ABORT][199] ([Intel XE#4917] / [Intel XE#5545]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][201] ([Intel XE#2341]) -> [FAIL][202] ([Intel XE#1178])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_content_protection@legacy.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][203] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][204] ([Intel XE#4543])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [DMESG-WARN][205] ([Intel XE#4543]) -> [DMESG-WARN][206] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_flip@plain-flip-ts-check.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][207] ([Intel XE#2311]) -> [SKIP][208] ([Intel XE#2312]) +13 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#2311]) +12 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][211] ([Intel XE#2312]) -> [SKIP][212] ([Intel XE#5390]) +6 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][213] ([Intel XE#5390]) -> [SKIP][214] ([Intel XE#2312]) +6 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][215] ([Intel XE#2313]) -> [SKIP][216] ([Intel XE#2312]) +11 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][217] ([Intel XE#2312]) -> [SKIP][218] ([Intel XE#2313]) +13 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][219] ([Intel XE#3544]) -> [SKIP][220] ([Intel XE#3374] / [Intel XE#3544])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#362]) -> [FAIL][222] ([Intel XE#1729])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_fault_mode@many-rebind:
    - shard-adlp:         [INCOMPLETE][223] ([Intel XE#2594]) -> [SKIP][224] ([Intel XE#288] / [Intel XE#5561])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-9/igt@xe_exec_fault_mode@many-rebind.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@xe_exec_fault_mode@many-rebind.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][225] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][226] ([Intel XE#5466] / [Intel XE#5530])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5632
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412 -> xe-pw-151244v13

  IGT_8555: 8555
  xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412: 3008c5c8e2fade05918e6d8c456572c91f30d412
  xe-pw-151244v13: 151244v13

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/index.html

--===============7811637621599246001==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Optimize vrr.guardband and fix LRR (rev13)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151244/">https://patchwork.freedesktop.org/series/151244/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151244v13/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151244v13/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3835-3008c5c8e2fade05918e6d8c456572c91=
f30d412_FULL -&gt; xe-pw-151244v13_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151244v13_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151244v13_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1512=
44v13_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-435/igt@kms_cu=
rsor_legacy@single-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-433/igt@kms_cursor_legacy@=
single-move.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-7/igt@kms_vrr@=
flip-basic-fastset@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-lnl-7/igt@kms_vrr@flip=
-basic-fastset@pipe-a-edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.h=
tml">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-userptr-rebind:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_exec_=
threads@threads-mixed-userptr-rebind.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/sha=
rd-bmg-7/igt@xe_exec_threads@threads-mixed-userptr-rebind.html">FAIL</a></l=
i>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3835-3008c5c8e2fade05918e6d8c4=
56572c91f30d412_FULL and xe-pw-151244v13_FULL:</p>
<h3>New IGT tests (292)</h3>
<ul>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.29, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.66, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.03, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.16, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.82, 3.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.78, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.86, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.02, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [5.10, 6.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.98, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.00, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.79, 2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.39, 3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.34, 2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.91, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.82, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.19, 4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [3.66, 6.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.51, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.16, 3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [3.65, 6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.52, 3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.20, 3.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [3.63, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.51, 3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.19, 3.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [3.64, 5.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.51, 1.81] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151244v13_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 oth=
er test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_bw@connected-linear-ti=
ling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_bw@linear-tiling-1-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_bw@linear-tiling-2-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_bw@linear-tiling-4-dis=
plays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-432/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +174 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer=
-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_cdclk@mode-transition.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_cdclk@mode-transition@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_chamelium_color@ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_chamelium_color@ctm-re=
d-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_chamelium_frames@hdmi-a=
spect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_chamelium_hpd@dp-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_content_protection@legac=
y@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-432/igt@kms_content_protection@leg=
acy@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-432/igt@kms_content_protection@uev=
ent@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_cursor_legacy@2x-cursor=
-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_curso=
r_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_dp_link_traini=
ng@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dir=
ty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_flip@2x-flip-vs-=
dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_flip@flip-=
vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_=
flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>=
) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend@d-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_flip@flip-vs-=
suspend@d-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_frontbuffer_tracking@d=
rrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_frontbuffer_tracking@dr=
rs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_frontbuffer_tracking@fb=
cpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151244v13/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_joiner@invalid-modeset-=
force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-2/igt@kms_pip=
e_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_pipe_crc_b=
asic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +6 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_pm_backlight@brightnes=
s-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overl=
ay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@kms_psr@fbc-psr-primary-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_psr@pr-sprite-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_psr_stress_test@invalid=
ate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#558=
5</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_psr_stress_test@invali=
date-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_s=
etmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@kms_tv_load_detect@load-de=
tect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@xe_compute_preempt@compute-=
preempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5632">Intel XE#5632</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_compute_preempt@compute=
-preempt-many.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5890">Intel XE#5890</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_copy_basic@mem-set-line=
ar-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_eudebug@basic-vm-bind.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_eudebug_online@interrupt=
-other.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5565">Intel XE#5565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_eudebug_sriov@deny-srio=
v.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_evict@evict-beng-large.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5564">Intel XE#5564</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/sh=
ard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_exec_basic@multigpu-no-ex=
ec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_exec_fault_mode@many-bi=
ndexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_exec_system_allocator@man=
y-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt@xe_exec_system_allocator@ma=
ny-new-bo-map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4915">Intel XE#4915</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-stride-new-bo-map.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-1/=
igt@xe_exec_system_allocator@threads-many-stride-new-bo-map.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Inte=
l XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nome=
mset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_exec_system_allocator@t=
hreads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)=
 +115 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_media_fill@media-fill.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_mmap@pci-membarrier-bad-=
object.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30=
d412/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c9=
1f30d412/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c4565=
72c91f30d412/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c=
456572c91f30d412/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e=
6d8c456572c91f30d412/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05=
918e6d8c456572c91f30d412/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fa=
de05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8=
e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008=
c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-=
3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-=
bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151244v13/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-5/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151244v13/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244=
v13/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151244v13/shard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bm=
g-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51244v13/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151244v13/shard-bmg-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151244v13/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244=
v13/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_oa@invalid-oa-metric-se=
t-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_pat@pat-index-xehpc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-adlp-3/igt@xe_pxp@pxp-src-to-pxp-dest-=
rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +1 other test skip</l=
i>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-435/igt@xe_pxp@pxp-src-to-pxp-dest=
-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_query@multigpu-query-en=
gines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151244v13/shard-dg2-464/igt@xe_sriov_auto_provisioning=
@resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other =
test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shar=
d-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg=
2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-=
435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151244v13/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_dp_aux_dev.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@kms=
_flip@2x-flip-vs-expired-vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@kms_fli=
p@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@km=
s_flip@basic-flip-vs-dpms.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v1=
3/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
44v13/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x=
-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151244v13/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-=
a-1-y-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-464/igt@kms_pl=
ane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6.html">INCOMPLETE</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/sha=
rd-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-6.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_pla=
ne_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@kms_setm=
ode@basic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-7/igt@kms_setm=
ode@basic@pipe-a-dp-2.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-466/igt@kms_se=
tmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-466/igt@=
kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_s=
etmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-1/igt@kms_vrr@=
max-min@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-lnl-4/igt@kms_vrr@m=
ax-min@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_vrr@negativ=
e-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-46=
4/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> +4 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@xe_exec=
_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/=
igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-benchmark:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-4/igt@xe_exec_=
system_allocator@fault-benchmark.html">TIMEOUT</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-5/igt@xe_exec_=
system_allocator@fault-benchmark.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-new-prefetch}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-lnl-8/igt@xe_exec_=
system_allocator@many-64k-new-prefetch.html">CRASH</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-=
lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html">PASS</a> +9 =
other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@xe_exec_=
system_allocator@twice-malloc-prefetch-madvise.html">CRASH</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v1=
3/shard-bmg-4/igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise.ht=
ml">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-4/igt@xe_exec=
_threads@threads-mixed-userptr-rebind.html">FAIL</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_ex=
ec_threads@threads-mixed-userptr-rebind.html">PASS</a> +1 other test pass</=
li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-8/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#491=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545=
">Intel XE#5545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151244v13/shard-adlp-4/igt@xe_sriov_scheduling@nonpreempt-engine=
-resets@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-8/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-ad=
lp-1/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-3/igt@kms_fli=
p@plain-flip-ts-check.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-1/igt@k=
ms_flip@plain-flip-ts-check.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/s=
hard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
2">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
44v13/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
44v13/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151244v13/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
44v13/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151244v13/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-bmg-6/igt@kms_hdr@br=
ightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-dg2-433/igt=
@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-adlp-9/igt@xe_exec=
_fault_mode@many-rebind.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v13/shard-adlp-2/igt=
@xe_exec_fault_mode@many-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-bmg-3/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151244v13/shard-bmg-3/igt@xe_fault_injection@probe-fail-=
guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412 -&gt; xe-pw-151=
244v13</li>
</ul>
<p>IGT_8555: 8555<br />
  xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412: 3008c5c8e2fade05918e6d8=
c456572c91f30d412<br />
  xe-pw-151244v13: 151244v13</p>

</body>
</html>

--===============7811637621599246001==--
