Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D9C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 21:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC7510E048;
	Mon, 12 May 2025 21:58:51 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C358610E048;
 Mon, 12 May 2025 21:58:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Track_FAST=5FREQ_H2G?=
 =?utf-8?q?s_to_report_where_errors_came_from?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 21:58:49 -0000
Message-ID: <174708712979.71133.11657762753770176633@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
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

Series: Track FAST_REQ H2Gs to report where errors came from
URL   : https://patchwork.freedesktop.org/series/148912/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f28b1630b0e2 drm-tip: 2025y-05m-12d-20h-49m-26s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Remove double blank line
Applying: drm/xe/guc: Add missing H2G error code definitions
Applying: drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
Applying: drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from


