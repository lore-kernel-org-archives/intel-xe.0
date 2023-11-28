Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7113C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5615610E166;
	Tue, 28 Nov 2023 16:30:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60F2510E166;
 Tue, 28 Nov 2023 16:30:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 55E86A882E;
 Tue, 28 Nov 2023 16:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 28 Nov 2023 16:30:28 -0000
Message-ID: <170118902832.8219.17145310399484972037@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231128151507.1015-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Introduce_Local_Memory_Translation_Table?=
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

Series: Introduce Local Memory Translation Table
URL   : https://patchwork.freedesktop.org/series/126993/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: b06c9f366 fixup! drm/xe/uapi: Remove MMIO ioctl
=== git am output follows ===
Applying: drm/xe: Define DRM_XE_DEBUG_SRIOV config
Applying: drm/xe: Introduce SR-IOV logging macros
Applying: drm/xe/pf: Introduce Local Memory Translation Table
Applying: drm/xe/kunit: Enable CONFIG_PCI_IOV in .kunitconfig
Applying: drm/xe/kunit: Add test for LMTT operations


