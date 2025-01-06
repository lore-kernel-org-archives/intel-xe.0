Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73583E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 21:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1180810EA1C;
	Mon,  6 Jan 2025 21:34:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCA010E0F7;
 Mon,  6 Jan 2025 21:34:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_PXP_HWDRM_suppor?=
 =?utf-8?q?t_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 21:34:41 -0000
Message-ID: <173619928151.445834.2385635414144161909@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
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

Series: Add PXP HWDRM support (rev4)
URL   : https://patchwork.freedesktop.org/series/136052/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: bfe4c6426814 drm-tip: 2025y-01m-06d-19h-18m-49s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/pxp: Initialize PXP structure and KCR reg
Applying: drm/xe/pxp: Allocate PXP execution resources
Applying: drm/xe/pxp: Add VCS inline termination support
Applying: drm/xe/pxp: Add GSC session invalidation support
Applying: drm/xe/pxp: Handle the PXP termination interrupt
Applying: drm/xe/pxp: Add GSC session initialization support
Applying: drm/xe/pxp: Add PXP queue tracking and session start
Applying: drm/xe/pxp: Add userspace and LRC support for PXP-using queues
Applying: drm/xe/pxp: Add a query for PXP status
Applying: drm/xe/pxp: Add API to mark a BO as using PXP
Applying: drm/xe/pxp: add PXP PM support
Applying: drm/xe/pxp: Add PXP debugfs support
Applying: drm/xe/pxp: Enable PXP for MTL and LNL


