Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583EFC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 19:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E3110E86E;
	Wed, 29 Jan 2025 19:09:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFB810E86E;
 Wed, 29 Jan 2025 19:09:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_PXP_HWDRM_suppor?=
 =?utf-8?q?t_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 19:09:46 -0000
Message-ID: <173817778649.2510226.9924394619028067290@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129174140.948829-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250129174140.948829-1-daniele.ceraolospurio@intel.com>
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

Series: Add PXP HWDRM support (rev7)
URL   : https://patchwork.freedesktop.org/series/136052/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b4ad7016f85d drm-tip: 2025y-01m-29d-18h-53m-20s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/pxp: Initialize PXP structure and KCR reg
Applying: drm/xe/pxp: Allocate PXP execution resources
Applying: drm/xe/pxp: Add VCS inline termination support
Applying: drm/xe/pxp: Add GSC session invalidation support
Applying: drm/xe/pxp: Handle the PXP termination interrupt
Applying: drm/xe/pxp: Add GSC session initialization support
Applying: drm/xe/pxp: Add PXP queue tracking and session start
Applying: drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues
Applying: drm/xe/pxp/uapi: Add a query for PXP status
Applying: drm/xe/pxp/uapi: Add API to mark a BO as using PXP
Applying: drm/xe/pxp: add PXP PM support
Applying: drm/xe/pxp: Add PXP debugfs support
Applying: drm/xe/pxp: Enable PXP for MTL and LNL


