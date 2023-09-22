Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6974CD4846
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 16:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D6D10E6AA;
	Fri, 22 Sep 2023 16:56:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCA6C10E6A2;
 Fri, 22 Sep 2023 16:56:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AF519A02F0;
 Fri, 22 Sep 2023 16:56:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommithi Sakeena" <bommithi.sakeena@intel.com>
Date: Fri, 22 Sep 2023 16:56:28 -0000
Message-ID: <169540178869.5197.15450446443544464223@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230922165404.17649-1-bommithi.sakeena@intel.com>
In-Reply-To: <20230922165404.17649-1-bommithi.sakeena@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_series_starting_with_=5B1/2=5D_lib/xe=3A_on_xe_driver_use_bl?=
 =?utf-8?q?itter_with_all_tiling?=
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

Series: series starting with [1/2] lib/xe: on xe driver use blitter with all tiling
URL   : https://patchwork.freedesktop.org/series/124126/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 6149acb94 drm/xe: Implement fdinfo memory stats printing
=== git am output follows ===
error: lib/igt_fb.c: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: lib/xe: on xe driver use blitter with all tiling
Patch failed at 0001 lib/xe: on xe driver use blitter with all tiling
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


