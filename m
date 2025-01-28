Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA0BC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 21:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0D10E335;
	Tue, 28 Jan 2025 21:19:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D3810E02E;
 Tue, 28 Jan 2025 21:19:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Maintenence_of_devco?=
 =?utf-8?q?redump_=3C-=3E_GuC-Err-Capture_plumbing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 21:19:28 -0000
Message-ID: <173809916833.2098624.2099616189033007443@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/144050/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 20759526c04a drm-tip: 2025y-01m-28d-16h-51m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Rename __guc_capture_parsed_output
Applying: drm/xe/guc: Don't store capture nodes in xe_devcoredump_snapshot
Applying: drm/xe/guc: Split engine state print between xe_hw_engine vs xe_guc_capture
Applying: drm/xe/guc: Move xe_hw_engine_snapshot creation back to xe_hw_engine.c
Applying: drm/xe/xe_hw_engine: Update hw_engine_snapshot_capture for debugfs
Applying: drm/xe/guc: Update comments on GuC-Err-Capture flows


