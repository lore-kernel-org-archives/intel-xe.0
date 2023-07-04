Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476FFEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 10:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2CF10E099;
	Tue,  4 Jul 2023 10:08:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29D2310E099;
 Tue,  4 Jul 2023 10:08:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 21BECA0078;
 Tue,  4 Jul 2023 10:08:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Date: Tue, 04 Jul 2023 10:08:55 -0000
Message-ID: <168846533510.28591.11672451927541276462@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_DEPT_2=2E4_test_run_for_drm-xe?=
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

Series: DEPT 2.4 test run for drm-xe
URL   : https://patchwork.freedesktop.org/series/120168/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 103e5d7aa fixup! drm/xe/display: Implement display support
=== git am output follows ===
Applying: llist: Move llist_{head, node} definition to types.h
Applying: dept: Implement Dept(Dependency Tracker)
Applying: dept: Add single event dependency tracker APIs
Applying: dept: Add lock dependency tracker APIs
Applying: dept: Tie to Lockdep and IRQ tracing
Applying: dept: Add proc knobs to show stats and dependency graph
Applying: dept: Apply sdt_might_sleep_{start, end}() to wait_for_completion()/complete()
Applying: dept: Apply sdt_might_sleep_{start, end}() to PG_{locked, writeback} wait
Applying: dept: Apply sdt_might_sleep_{start, end}() to swait
Applying: dept: Apply sdt_might_sleep_{start, end}() to waitqueue wait
Applying: dept: Apply sdt_might_sleep_{start, end}() to hashed-waitqueue wait
Applying: dept: Distinguish each syscall context from another
Applying: dept: Distinguish each work from another
Applying: dept: Add a mechanism to refill the internal memory pools on running out
Applying: locking/lockdep, cpu/hotplus: Use a weaker annotation in AP thread
Applying: dept: Apply sdt_might_sleep_{start, end}() to dma fence wait
Applying: dept: Track timeout waits separately with a new Kconfig
Applying: dept: Apply timeout consideration to wait_for_completion()/complete()
Applying: dept: Apply timeout consideration to swait
Applying: dept: Apply timeout consideration to waitqueue wait
Applying: dept: Apply timeout consideration to hashed-waitqueue wait
Applying: dept: Apply timeout consideration to dma fence wait
Applying: dept: Record the latest one out of consecutive waits of the same class
Applying: dept: Make Dept able to work with an external wgen
Applying: dept: Track the potential waits of PG_{locked, writeback}
Applying: HAX: dept: Enable Dept by default
Applying: HAX: dept: Increase DEPT_MAX_WAIT_HIST / DEPT_MAX_ECXT_HELD to track more


