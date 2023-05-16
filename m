Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E823C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515D310E37D;
	Tue, 16 May 2023 22:23:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0AE810E37D;
 Tue, 16 May 2023 22:23:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9AE61ACC22;
 Tue, 16 May 2023 22:23:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 16 May 2023 22:23:04 -0000
Message-ID: <168427578463.14224.2161220282248796384@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Dump_+_OOB_workarounds?=
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

Series: Dump + OOB workarounds
URL   : https://patchwork.freedesktop.org/series/117840/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 68b73294f drm/xe: Call exit functions when xe_register_pci_driver() fails
=== git am output follows ===
.git/rebase-apply/patch:64: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Fix Wa_22011802037 annotation
Applying: drm/xe/rtp: Split rtp process initialization
Applying: drm/xe/rtp: Add "_sr" to entry/function names
Applying: drm/xe/rtp: Allow to track active workarounds
Applying: drm/xe/wa: Track gt/engine/lrc active workarounds
Applying: drm/xe/debugfs: Dump active workarounds
Applying: drm/xe/rtp: Add support for entries with no action
Applying: drm/xe: Add support for OOB workarounds
Applying: drm/xe/guc: Port workarounds to OOB infra


