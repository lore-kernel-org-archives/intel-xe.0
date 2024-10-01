Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D88ACEB2D2
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 00:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F9610E167;
	Tue,  1 Oct 2024 00:49:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02DD10E167;
 Tue,  1 Oct 2024 00:49:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/guc=3A_Improv?=
 =?utf-8?q?e_GuC_log_dumping_and_add_to_devcoredump_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 00:49:01 -0000
Message-ID: <172774374197.1139830.1807857544220980277@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240920032108.629796-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev4)
URL   : https://patchwork.freedesktop.org/series/137985/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4e4d7873ac76 drm-tip: 2024y-09m-30d-16h-43m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Remove spurious line feed in debug print
Applying: drm/xe/devcoredump: Use drm_puts and already cached local variables
Applying: drm/xe/devcoredump: Improve section headings and add tile info
Applying: drm/xe/devcoredump: Add ASCII85 dump helper function
Applying: drm/xe/guc: Copy GuC log prior to dumping
Applying: drm/xe/guc: Use a two stage dump for GuC logs and add more info
Applying: drm/print: Introduce drm_line_printer
Applying: drm/xe/guc: Dead CT helper
Applying: drm/xe/guc: Dump entire CTB on errors
Applying: drm/xe/guc: Add GuC log to devcoredump captures
Applying: drm/xe/guc: Add a helper function for dumping GuC log to dmesg


