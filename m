Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D8606A321
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 03:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71BC10E049;
	Mon, 16 Nov 2026 03:20:27 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECB410E025;
 Mon, 16 Nov 2026 03:20:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7613952448584160019=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/display=3A_Free_the?=
 =?utf-8?q?_KMS_objects_on_DRM_device_release=2C_not_on_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Baoli Zhang" <baoli.zhang@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 03:20:26 -0000
Message-ID: <179479922685.27497.10377101569767480620@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116011504.3910139-1-baoli.zhang@linux.intel.com>
In-Reply-To: <20261116011504.3910139-1-baoli.zhang@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7613952448584160019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Free the KMS objects on DRM device release, not on unbind
URL   : https://patchwork.freedesktop.org/series/178623/
State : failure

== Summary ==

CI Bug Log - changes from xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea_FULL -> xe-pw-178623v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-178623v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-178623v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-178623v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-7} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-7.html

  * {igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2} (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-with-formats:
    - shard-ptl:          [SKIP][5] ([Intel XE#5907]) -> [SKIP][6] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-8/igt@kms_dsc@dsc-with-formats.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-5/igt@kms_dsc@dsc-with-formats.html

  
New tests
---------

  New tests have been introduced between xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea_FULL and xe-pw-178623v1_FULL:

### New IGT tests (380) ###

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.79, 2.92] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.85, 2.88] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.85, 2.88] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.87] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_async_flips@async-flip-dpms@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_async_flips@async-flip-dpms@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.89, 3.00] s

  * igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_async_flips@async-flip-dpms@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_async_flips@async-flip-dpms@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.90, 2.94] s

  * igt@kms_async_flips@async-flip-dpms@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_async_flips@async-flip-dpms@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_async_flips@async-flip-dpms@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.91, 2.95] s

  * igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_async_flips@async-flip-dpms@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_async_flips@async-flip-dpms@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.97] s

  * igt@kms_async_flips@async-flip-dpms@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.81, 0.84] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.85, 0.91] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@test-cursor@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@test-cursor@pipe-a-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-cursor@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-cursor@pipe-b-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-cursor@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@test-cursor@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-cursor@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.56] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [6.27] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [6.88, 6.92] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [13.25, 13.38] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [12.80, 12.92] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.95, 0.96] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.56, 1.59] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.51, 1.56] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-negative@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-negative@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.92, 0.97] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-negative@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.56, 1.58] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-negative@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.51, 1.53] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-negative@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-b-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_content_protection@atomic@pipe-a-dp-5:
    - Statuses : 1 fail(s)
    - Exec time: [111.86] s

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-5:
    - Statuses : 1 fail(s)
    - Exec time: [34.17] s

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.97] s

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.39] s

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.14] s

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.90] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [7.55, 8.65] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.63] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.96] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.39] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-7:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_flip@2x-blocking-wf_vblank@ab-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.86] s

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.72] s

  * igt@kms_flip@2x-blocking-wf_vblank@ad-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.72] s

  * igt@kms_flip@2x-blocking-wf_vblank@bc-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.73] s

  * igt@kms_flip@2x-blocking-wf_vblank@bd-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.88] s

  * igt@kms_flip@2x-blocking-wf_vblank@cd-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.84] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.40] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.36] s

  * igt@kms_flip@2x-plain-flip-interruptible@ab-dp4-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@2x-plain-flip-interruptible@ac-dp4-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_flip@2x-plain-flip-interruptible@ad-dp4-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_flip@2x-plain-flip-interruptible@bc-dp4-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_flip@2x-plain-flip-interruptible@bd-dp4-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_flip@2x-plain-flip-interruptible@cd-dp4-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bc-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bd-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@cd-dp5-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp2:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp2:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp2:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@flip-vs-rmfb@a-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_flip@flip-vs-rmfb@a-edp2:
    - Statuses : 2 pass(s)
    - Exec time: [8.80, 11.23] s

  * igt@kms_flip@flip-vs-rmfb@a-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@flip-vs-rmfb@b-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@flip-vs-rmfb@b-edp2:
    - Statuses : 2 pass(s)
    - Exec time: [8.80, 11.30] s

  * igt@kms_flip@flip-vs-rmfb@b-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_flip@flip-vs-rmfb@c-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@flip-vs-rmfb@c-edp2:
    - Statuses : 2 pass(s)
    - Exec time: [8.82, 11.37] s

  * igt@kms_flip@flip-vs-rmfb@c-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@flip-vs-rmfb@d-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@flip-vs-rmfb@d-edp2:
    - Statuses : 1 pass(s)
    - Exec time: [8.80] s

  * igt@kms_flip@flip-vs-rmfb@d-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@wf_vblank-ts-check@a-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@wf_vblank-ts-check@a-edp2:
    - Statuses : 1 pass(s)
    - Exec time: [11.71] s

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [4.37] s

  * igt@kms_flip@wf_vblank-ts-check@b-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@wf_vblank-ts-check@b-edp2:
    - Statuses : 1 pass(s)
    - Exec time: [11.72] s

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@wf_vblank-ts-check@c-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@wf_vblank-ts-check@c-edp2:
    - Statuses : 1 pass(s)
    - Exec time: [11.72] s

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [4.36] s

  * igt@kms_flip@wf_vblank-ts-check@d-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a7:
    - Statuses : 1 pass(s)
    - Exec time: [4.37] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.33] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@bad-vsync-start@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-clock@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_invalid_mode@zero-clock@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.34] s

  * igt@kms_invalid_mode@zero-clock@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@zero-clock@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-clock@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_invalid_mode@zero-clock@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-clock@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-clock@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@zero-clock@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-clock@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-clock@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@zero-clock@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-get@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease-get@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_lease@lease-get@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease-get@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-get@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_lease@lease-get@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease-get@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease-get@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_lease@lease-get@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease-get@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease-get@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_lease@lease-get@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@simple-lease@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_lease@simple-lease@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.69] s

  * igt@kms_lease@simple-lease@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_lease@simple-lease@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_lease@simple-lease@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.57] s

  * igt@kms_lease@simple-lease@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_lease@simple-lease@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_lease@simple-lease@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.52, 1.61] s

  * igt@kms_lease@simple-lease@pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_lease@simple-lease@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_lease@simple-lease@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_lease@simple-lease@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_mmap_write_crc@main@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [3.58] s

  * igt@kms_mmap_write_crc@main@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [4.87, 5.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-5-pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-5-pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-5-pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-7-pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-7-pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-7-pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-5-pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-5-pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-5-pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-7-pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-7-pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-7-pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-5-pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-5-pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-5-pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-7-pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-7-pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-7-pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-5-pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-5-pipe-b-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-5-pipe-c-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-7-pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-7-pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-7-pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-2-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-7-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-edp-2-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-7-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-2-invalid-num-scalers:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-7-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-2-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-7-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_properties@crtc-properties-atomic@pipe-a-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_properties@crtc-properties-atomic@pipe-b-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_properties@crtc-properties-atomic@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-2:
    - Statuses : 2 skip(s)
    - Exec time: [1.23, 1.24] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-2:
    - Statuses : 2 skip(s)
    - Exec time: [1.19, 1.24] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [24.44, 24.56] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [25.04, 25.23] s

  * igt@kms_psr@fbc-psr-suspend@edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [4.94, 6.38] s

  * igt@kms_psr@fbc-psr2-sprite-render@edp-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_psr@psr-sprite-render@edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.98, 2.01] s

  * igt@kms_scaling_modes@scaling-mode-full-aspect@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.17] s

  * igt@kms_scaling_modes@scaling-mode-full-aspect@pipe-b-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.20] s

  * igt@kms_scaling_modes@scaling-mode-full-aspect@pipe-c-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.24, 1.29] s

  * igt@kms_scaling_modes@scaling-mode-full-aspect@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_sharpness_filter@filter-basic@pipe-a-edp-2-basic:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.37] s

  * igt@kms_sharpness_filter@filter-basic@pipe-b-edp-2-basic:
    - Statuses : 2 pass(s)
    - Exec time: [1.42, 1.46] s

  * igt@kms_sharpness_filter@filter-basic@pipe-c-edp-2-basic:
    - Statuses : 2 pass(s)
    - Exec time: [1.44, 1.48] s

  * igt@kms_sharpness_filter@filter-basic@pipe-d-edp-2-basic:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_vblank@ts-continuation-modeset@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.58, 1.70] s

  * igt@kms_vblank@ts-continuation-modeset@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_vblank@ts-continuation-modeset@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_vblank@ts-continuation-modeset@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_vblank@ts-continuation-modeset@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_vblank@ts-continuation-modeset@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [4.14] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [3.23, 4.92] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [3.44] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.82] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.31] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [3.70] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.70] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-edp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.74] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.36] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-d-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_vblank@wait-idle-hang@pipe-c-edp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.12] s

  * igt@kms_vblank@wait-idle-hang@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 1.24] s

  

Known issues
------------

  Here are the changes found in xe-pw-178623v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7059] / [Intel XE#7085])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +7 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7358]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#9671])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-5 (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#3304]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-5.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * {igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-5} (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#6707])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-5.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2320])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#9529])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#301] / [Intel XE#3149])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7178] / [Intel XE#7351])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4141]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7061] / [Intel XE#7356])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2313]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7283])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#5021] / [Intel XE#7377])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#9779])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled.html

  * {igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#4608]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2.html

  * {igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-2} (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#7304]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-2.html

  * {igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-2} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-2.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1489])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * {igt@kms_psr@fbc-psr2-sprite-render@edp-2} (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#1406])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-4/igt@kms_psr@fbc-psr2-sprite-render@edp-2.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#7345])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-render@edp-2.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1435] / [Intel XE#8695])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * {igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-2} (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#9277])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-6/igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-2.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#9271])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-8/igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-2.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [PASS][42] -> [FAIL][43] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#8374]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#8364]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#8378])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [PASS][47] -> [ABORT][48] ([Intel XE#9463])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6964])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [PASS][50] -> [ABORT][51] ([Intel XE#9362]) +3 other tests abort
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#9461]) +3 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-1/igt@xe_pmu@engine-activity-accuracy-50.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7599])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4733] / [Intel XE#7417])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#944])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][57] ([Intel XE#367]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][59] ([Intel XE#301]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][61] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [FAIL][63] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][64] +2 other tests pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-5/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-bmg:          [ABORT][65] ([Intel XE#9463]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][67] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][68] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][69] ([Intel XE#301]) -> [FAIL][70] ([Intel XE#301] / [Intel XE#3149])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][71] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][72] ([Intel XE#3544])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][73] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][74] ([Intel XE#2426] / [Intel XE#5848])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779


Build changes
-------------

  * Linux: xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea -> xe-pw-178623v1

  IGT_9192: 9192
  xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea: ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea
  xe-pw-178623v1: 178623v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/index.html

--===============7613952448584160019==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Free the KMS objects on DRM device release, not on unbind</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178623/">https://patchwork.freedesktop.org/series/178623/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea_FULL -&gt; xe-pw-178623v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-178623v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-178623v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-178623v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-7} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-7.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2} (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-with-formats:<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea_FULL and xe-pw-178623v1_FULL:</p>
<h3>New IGT tests (380)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.79, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.85, 2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.85, 2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.89, 3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.90, 2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.91, 2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.81, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.85, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.88, 6.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.25, 13.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.80, 12.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.95, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.56, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.51, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.92, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.56, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.51, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [111.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [34.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.55, 8.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ad-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bc-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bd-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@cd-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@ab-dp4-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@ac-dp4-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@ad-dp4-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@bc-dp4-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@bd-dp4-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@cd-dp4-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bc-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bd-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@cd-dp5-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-edp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.80, 11.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-edp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.80, 11.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-edp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.82, 11.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@d-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@d-edp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-edp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@d-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.52, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.87, 5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-5-pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-5-pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-5-pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-7-pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-7-pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-7-pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-5-pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-5-pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-5-pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-7-pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-7-pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-7-pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-5-pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-5-pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-5-pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-7-pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-7-pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-7-pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-5-pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-5-pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-5-pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-7-pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-7-pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-7-pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-edp-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-7-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-edp-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-b-hdmi-a-7-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-edp-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-c-hdmi-a-7-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-2-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-7-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-5-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-edp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-5-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-edp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-5-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-edp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-5-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.23, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.19, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [24.44, 24.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [25.04, 25.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend@edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.94, 6.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render@edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.98, 2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-a-edp-2-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-b-edp-2-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.42, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-c-edp-2-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.44, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-d-edp-2-basic:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.58, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.23, 4.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-d-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 1.24] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178623v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-5 (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-5} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529">Intel XE#9529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-2} (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-2} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@fbc-psr2-sprite-render@edp-2} (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-4/igt@kms_psr@fbc-psr2-sprite-render@edp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-render@edp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-2} (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-6/igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-8/igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-1/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461">Intel XE#9461</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-ptl-5/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178623v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea -&gt; xe-pw-178623v1</li>
</ul>
<p>IGT_9192: 9192<br />
  xe-6145-ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea: ed6757dc4bf3b7c5df2d68e996820dc30ffc5eea<br />
  xe-pw-178623v1: 178623v1</p>

</body>
</html>

--===============7613952448584160019==--
