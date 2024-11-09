Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9225FD6409C
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 02:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5906610E326;
	Sat,  9 Nov 2024 02:05:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F0010E326;
 Sat,  9 Nov 2024 02:05:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Support_ca?=
 =?utf-8?q?pture_and_dump_of_devcoredump_for_general_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Nov 2024 02:05:26 -0000
Message-ID: <173111792633.1545706.4097486782136167957@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Support capture and dump of devcoredump for general debug
URL   : https://patchwork.freedesktop.org/series/141122/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 00976833a8b1 drm-tip: 2024y-11m-08d-23h-22m-50s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/devcoredump: Support coredumps without jobs
Applying: drm/xe: Trigger a devcoredump capture on a GT reset
Applying: drm/xe: Disconnect coredump structure from xe_device structure
Applying: drm/xe: Make coredump printing to in-memory cache optional
Applying: drm/xe: Support devcoredump capture from dead CT handler


