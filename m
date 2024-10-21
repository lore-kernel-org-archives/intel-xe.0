Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428CED17123
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 18:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC32D10E576;
	Mon, 21 Oct 2024 18:21:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028B410E576;
 Mon, 21 Oct 2024 18:21:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Mark_work_queues_wit?=
 =?utf-8?q?h_WQ=5FMEM=5FRECLAIM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 18:21:26 -0000
Message-ID: <172953488600.1306161.16456539133383274227@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021175705.1584521-1-matthew.brost@intel.com>
In-Reply-To: <20241021175705.1584521-1-matthew.brost@intel.com>
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

Series: Mark work queues with WQ_MEM_RECLAIM
URL   : https://patchwork.freedesktop.org/series/140267/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: aa0898115bcf drm-tip: 2024y-10m-21d-17h-57m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM
Applying: drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
Applying: drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
Applying: drm/xe: Mark GT work queue with WQ_MEM_RECLAIM


