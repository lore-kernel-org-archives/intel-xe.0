Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26959C0218F
	for <intel-xe@archiver.kernel.org>; Sun,  2 Feb 2025 14:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2E510E1B4;
	Sun,  2 Feb 2025 14:21:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B403D10E0E5;
 Sun,  2 Feb 2025 14:21:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/gpuvm=3A_Add_sup?=
 =?utf-8?q?port_for_single-page-filled_mappings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Asahi Lina" <lina@asahilina.net>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 02 Feb 2025 14:21:23 -0000
Message-ID: <173850608373.4012540.10684407720085093052@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
In-Reply-To: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
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

Series: drm/gpuvm: Add support for single-page-filled mappings
URL   : https://patchwork.freedesktop.org/series/144229/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 01f54d1da1ff drm-tip: 2025y-01m-31d-19h-58m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/gpuvm: Add a flags argument to drm_gpuvm_sm_map[_*]
Applying: drm/gpuvm: Plumb through flags into drm_gpuva_op_map
Applying: drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
Applying: drm/gpuvm: Plumb through flags into drm_gpuva_init


