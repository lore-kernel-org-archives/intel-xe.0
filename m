Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60D6C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 02:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B81410EA65;
	Sat, 10 Aug 2024 02:01:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663E610EA5C;
 Sat, 10 Aug 2024 02:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Fix_error_paths_in_d?=
 =?utf-8?q?river_load?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 10 Aug 2024 02:01:07 -0000
Message-ID: <172325526741.558587.18187541331380022712@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240810015544.3443258-1-matthew.brost@intel.com>
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
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

Series: Fix error paths in driver load
URL   : https://patchwork.freedesktop.org/series/137114/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 99ad64bdf35c drm-tip: 2024y-08m-09d-23h-41m-10s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: use devm instead of drmm for managed bo
Applying: drm/xe/uc: Use managed bo for HuC and GSC objects
Applying: drm/xe/uc: Use devm to register cleanup that includes exec_queues
Applying: drm/xe: Fix tile fini sequence
Applying: drm/xe: Add driver load error injection
Applying: drm/xe: Move ggtt_fini to devm managed
Applying: drm/xe: Set firmware state to loadable before registering guc_fini_hw
Applying: drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc fini
Applying: drm/xe: Move hw_engine_fini to devm managed
Applying: drm/xe: Move HuC init before GuC init
Applying: drm/xe: Update xe_sa to use xe_managed_bo_create_pin_map


