Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC02E743EE
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 07:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFC210E6C0;
	Fri, 29 Sep 2023 07:01:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D826810E6BF;
 Fri, 29 Sep 2023 07:01:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D3EC0AADF2;
 Fri, 29 Sep 2023 07:01:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 29 Sep 2023 07:01:28 -0000
Message-ID: <169597088886.19499.1111991543839771939@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
In-Reply-To: <20230929050253.3153804-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_xe2=3A_Add_PAT_programming?=
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

Series: xe2: Add PAT programming
URL   : https://patchwork.freedesktop.org/series/124430/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 9a795b4f0 drm/xe: timeout needs to be a signed value
=== git am output follows ===
Applying: drm/xe/xe2: Program PAT tables
Applying: drm/xe/vm: Prefer xe_assert() over XE_WARN_ON()
Applying: drm/xe/xe2: Follow XeHPC for TLB invalidation
Applying: drm/xe/xe2: Add one more bit to encode PAT to ppgtt entries
Applying: fixup! drm/xe/pat: Prefer the arch/IP names
Applying: drm/xe/pat: Add debugfs node to dump PAT
Applying: drm/xe/gt: Dump PAT table when failing to initialize


