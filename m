Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7D4C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 19:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C34B10E151;
	Tue, 20 Aug 2024 19:07:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65A010E151;
 Tue, 20 Aug 2024 19:07:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Driver_load_failure_?=
 =?utf-8?q?fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 19:07:40 -0000
Message-ID: <172418086093.716037.10781337111258230841@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820172958.1095143-1-matthew.brost@intel.com>
In-Reply-To: <20240820172958.1095143-1-matthew.brost@intel.com>
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

Series: Driver load failure fixes
URL   : https://patchwork.freedesktop.org/series/137531/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: aadc820a10ab drm-tip: 2024y-08m-20d-16h-47m-57s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Move ggtt_fini to devm managed
Applying: drm/xe: Set firmware state to loadable before registering guc_fini_hw
Applying: drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc fini
Applying: drm/xe: Move hw_engine_fini to devm managed
Applying: drm/xe: Move HuC init before GuC init
Applying: drm/xe: Update xe_sa to use xe_managed_bo_create_pin_map


