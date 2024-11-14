Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48317D637D2
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 00:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C1C10E787;
	Thu, 14 Nov 2024 00:47:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C293E10E787;
 Thu, 14 Nov 2024 00:47:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Devcoredump_Improvem?=
 =?utf-8?q?ents_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 00:47:42 -0000
Message-ID: <173154526279.3878926.14151943057997235253@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112220127.1369527-1-matthew.brost@intel.com>
In-Reply-To: <20241112220127.1369527-1-matthew.brost@intel.com>
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

Series: Devcoredump Improvements (rev6)
URL   : https://patchwork.freedesktop.org/series/141110/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d8d960b20b0d drm-tip: 2024y-11m-13d-19h-53m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add xe_ring_lrc_is_idle() helper
Applying: drm/xe: Add ring address to LRC snapshot
Applying: drm/xe: Add ring start to LRC snapshot
Applying: drm/xe: Improve schedule disable response failure
Applying: drm/xe: Add exec queue param to devcoredump
Applying: drm/xe: Change xe_engine_snapshot_capture_for_job to be for queue
Applying: drm/xe: Wire devcoredump to LR TDR


