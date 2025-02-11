Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B44C02198
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 00:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A31710E226;
	Tue, 11 Feb 2025 00:38:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6683E10E226;
 Tue, 11 Feb 2025 00:38:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Maintenence_of_devco?=
 =?utf-8?q?redump_=3C-=3E_GuC-Err-Capture_plumbing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Feb 2025 00:38:09 -0000
Message-ID: <173923428941.552223.7182899641358011030@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/144634/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2fc58ab10139 drm-tip: 2025y-02m-10d-21h-24m-23s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Rename __guc_capture_parsed_output
Applying: drm/xe/guc: Don't store capture nodes in xe_devcoredump_snapshot
Applying: drm/xe/guc: Split engine state print between xe_hw_engine vs xe_guc_capture
Applying: drm/xe/guc: Move xe_hw_engine_snapshot creation back to xe_hw_engine.c
Applying: drm/xe/xe_hw_engine: Update xe_hw_engine capture for debugfs/gt_reset
Applying: drm/xe/guc: Update comments on GuC-Err-Capture flows


