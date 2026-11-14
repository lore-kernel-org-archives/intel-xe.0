Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623E606A32E
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 00:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4DB10ECD3;
	Sat, 14 Nov 2026 00:33:11 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB76D112844;
 Sat, 14 Nov 2026 00:33:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3779274262324907181=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_fix_UAF_race_bet?=
 =?utf-8?q?ween_exec-queue_teardown_and_GuC_CT_pause-abort?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Nov 2026 00:33:09 -0000
Message-ID: <179461638994.23060.6721074573399701399@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
In-Reply-To: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
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

--===============3779274262324907181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fix UAF race between exec-queue teardown and GuC CT pause-abort
URL   : https://patchwork.freedesktop.org/series/178483/
State : success

== Summary ==

CI Bug Log - changes from xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d_FULL -> xe-pw-178483v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d_FULL and xe-pw-178483v1_FULL:

### New IGT tests (129) ###

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.63] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.60] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.95] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [3.60] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-y210:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  

Known issues
------------

  Here are the changes found in xe-pw-178483v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][1] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][2] ([Intel XE#6078])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#6925]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#3658] / [Intel XE#7360])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#7085])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#7059] / [Intel XE#7085])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#607] / [Intel XE#7361])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5851])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1477] / [Intel XE#7361])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5808]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#3432])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5822]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2325] / [Intel XE#7358])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#8391]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7358]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#9671])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-7/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6969]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#7642])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#6974])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6974])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#3304])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5846]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-6/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2320])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5962]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#309] / [Intel XE#7343])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#6035])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#323] / [Intel XE#6035])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2286] / [Intel XE#6035])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#9532])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#9528])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8265]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5907]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#8265]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#702] / [Intel XE#7344])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_feature_discovery@display-2x.html
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7344])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1421]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#2316])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#7178]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#5800] / [Intel XE#6312]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2311]) +30 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#6312]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#7061]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4141]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#5865] / [Intel XE#7399])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1469] / [Intel XE#7399])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#6312]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#5812]) +39 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7905]) +16 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#7061]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#7061]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#656] / [Intel XE#7905]) +17 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2313]) +30 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2352] / [Intel XE#7399])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#7865]) +12 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#7061] / [Intel XE#7356])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#7865]) +8 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-ptl:          [PASS][80] -> [SKIP][81] ([Intel XE#7308])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-ptl-7/igt@kms_hdmi_inject@inject-audio.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.html
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#7308])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6901])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#6901])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2486])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#6912])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#7283])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#7283]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7283]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2393]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#5946])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#4596] / [Intel XE#5854])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#5020] / [Intel XE#7348])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#9779]) +10 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#9779]) +11 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010:
    - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#9780]) +14 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#9779]) +14 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#8396]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#8396]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#7304]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#5858])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4608])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#4608] / [Intel XE#7304])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1489]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2387] / [Intel XE#7429])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1406]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#1406]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2234])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#5821])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#3904] / [Intel XE#7342])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#3904] / [Intel XE#7342])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#5910])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1435] / [Intel XE#9142])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#6503])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#5857])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2450] / [Intel XE#5857])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#8608])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#8608])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][128] ([Intel XE#5764]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@xe_evict@evict-beng-threads-large-multi-vm.html
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#8370]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#7482]) +7 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#7482]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1392]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#8374]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#8374]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#8374]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#8364]) +8 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#8364]) +16 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html

  * igt@xe_exec_multi_queue@max-queues-dyn-priority:
    - shard-ptl:          NOTRUN -> [SKIP][141] ([Intel XE#8364]) +12 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@xe_exec_multi_queue@max-queues-dyn-priority.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#8369]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-ptl:          NOTRUN -> [SKIP][143] ([Intel XE#8369]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-7/igt@xe_exec_reset@multi-queue-gt-reset.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#8369]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-6/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#6196])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#6196])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#8378]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][148] ([Intel XE#8378]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#8378]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#7954])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-ptl:          NOTRUN -> [SKIP][151] ([Intel XE#5100] / [Intel XE#7408])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#6964]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
    - shard-ptl:          NOTRUN -> [SKIP][154] ([Intel XE#6964]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#6964]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-ptl:          NOTRUN -> [SKIP][156] ([Intel XE#6259] / [Intel XE#7406])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#7793])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#584] / [Intel XE#7369])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-1/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][159] ([Intel XE#6867]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          [PASS][160] -> [DMESG-WARN][161] ([Intel XE#7727])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-ptl-7/igt@xe_pm@s4-exec-after.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          [PASS][162] -> [ABORT][163] ([Intel XE#9362])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][164] -> [FAIL][165] ([Intel XE#9254])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#4733] / [Intel XE#7417])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#944])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
    - shard-ptl:          NOTRUN -> [SKIP][168] ([Intel XE#6019])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@xe_query@multigpu-query-mem-usage.html
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#944])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][170] ([Intel XE#9762])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
    - shard-ptl:          NOTRUN -> [SKIP][171] ([Intel XE#8415] / [Intel XE#8432])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@xe_survivability@runtime-survivability.html
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#8415])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@xe_survivability@runtime-survivability.html

  * igt@xe_vm@out-of-memory:
    - shard-ptl:          NOTRUN -> [SKIP][173] ([Intel XE#5745] / [Intel XE#7892])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@xe_vm@out-of-memory.html
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#5745] / [Intel XE#7892])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-1/igt@xe_vm@out-of-memory.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][175] ([Intel XE#8963])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][176] ([Intel XE#301]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-ptl:          [FAIL][178] ([Intel XE#3321]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][180] ([Intel XE#8399]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [ABORT][182] ([Intel XE#1727] / [Intel XE#6652]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [ABORT][184] ([Intel XE#9362]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-ptl-3/igt@xe_pm@s4-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@xe_pm@s4-basic.html
    - shard-lnl:          [ABORT][186] ([Intel XE#9476]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-1/igt@xe_pm@s4-basic.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][188] ([Intel XE#9254]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [FAIL][190] ([Intel XE#9319] / [Intel XE#9346]) -> [FAIL][191] ([Intel XE#9346])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          [SKIP][192] ([Intel XE#3307]) -> [SKIP][193] ([Intel XE#3307] / [Intel XE#9779])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][194] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][195] ([Intel XE#2426] / [Intel XE#5848])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9476]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476
  [Intel XE#9528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528
  [Intel XE#9532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9532
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671
  [Intel XE#9762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780


Build changes
-------------

  * IGT: IGT_9190 -> IGT_9191
  * Linux: xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d -> xe-pw-178483v1

  IGT_9190: 9190
  IGT_9191: 9191
  xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d: d41695c479e8bb24eb941e5ba916e42784af6f4d
  xe-pw-178483v1: 178483v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/index.html

--===============3779274262324907181==
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
<tr><td><b>Series:</b></td><td>drm/xe: fix UAF race between exec-queue teardown and GuC CT pause-abort</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178483/">https://patchwork.freedesktop.org/series/178483/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d_FULL -&gt; xe-pw-178483v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d_FULL and xe-pw-178483v1_FULL:</p>
<h3>New IGT tests (129)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-b-dp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-c-dp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-d-dp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178483v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-7/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9532">Intel XE#9532</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528">Intel XE#9528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865">Intel XE#5865</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +39 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-ptl-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946">Intel XE#5946</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_plane_scaling@plane-upscale-max-crc-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-dyn-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@xe_exec_multi_queue@max-queues-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-7/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-6/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-3/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@xe_noexec_ping_pong@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259">Intel XE#6259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406">Intel XE#7406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-9/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-1/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-ptl-7/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-5/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762">Intel XE#9762</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-5/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-8/igt@xe_vm@out-of-memory.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">Intel XE#5745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-1/igt@xe_vm@out-of-memory.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">Intel XE#5745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-4/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-ptl-3/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-ptl-4/igt@xe_pm@s4-basic.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-1/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476">Intel XE#9476</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-2/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319">Intel XE#9319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-lnl-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178483v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9190 -&gt; IGT_9191</li>
<li>Linux: xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d -&gt; xe-pw-178483v1</li>
</ul>
<p>IGT_9190: 9190<br />
  IGT_9191: 9191<br />
  xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d: d41695c479e8bb24eb941e5ba916e42784af6f4d<br />
  xe-pw-178483v1: 178483v1</p>

</body>
</html>

--===============3779274262324907181==--
