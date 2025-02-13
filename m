Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48841C021A7
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 20:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EFC10EB8B;
	Thu, 13 Feb 2025 20:21:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222A410EB8B;
 Thu, 13 Feb 2025 20:21:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Maintenence_of_devco?=
 =?utf-8?q?redump_=3C-=3E_GuC-Err-Capture_plumbing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 20:21:15 -0000
Message-ID: <173947807512.1756964.7884170536468400087@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
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

Series: Maintenence of devcoredump <-> GuC-Err-Capture plumbing
URL   : https://patchwork.freedesktop.org/series/144822/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4570ecc1f49b drm-tip: 2025y-02m-13d-17h-15m-56s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Rename __guc_capture_parsed_output
Applying: drm/xe/guc: Don't store capture nodes in xe_devcoredump_snapshot
Applying: drm/xe/guc: Split engine state print between xe_hw_engine vs xe_guc_capture
Applying: drm/xe/guc: Move xe_hw_engine_snapshot creation back to xe_hw_engine.c
Applying: drm/xe/xe_hw_engine: Update xe_hw_engine capture for debugfs/gt_reset
Applying: drm/xe/guc: Update comments on GuC-Err-Capture flows


