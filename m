Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D762D5E147
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 08:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5508F10E1A0;
	Fri,  8 Nov 2024 08:15:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B8410E1A0;
 Fri,  8 Nov 2024 08:15:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_tests/intel/xe=5Fdrm?=
 =?utf-8?q?=5Ffdinfo=3A_Increase_sampling_period?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 08:15:05 -0000
Message-ID: <173105370547.1426048.785478367561268489@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108054236.3484396-1-lucas.demarchi@intel.com>
In-Reply-To: <20241108054236.3484396-1-lucas.demarchi@intel.com>
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

Series: tests/intel/xe_drm_fdinfo: Increase sampling period
URL   : https://patchwork.freedesktop.org/series/141082/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5f445c6723de drm-tip: 2024y-11m-08d-03h-48m-35s UTC integration manifest
=== git am output follows ===
error: tests/intel/xe_drm_fdinfo.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: tests/intel/xe_drm_fdinfo: Increase sampling period
Patch failed at 0001 tests/intel/xe_drm_fdinfo: Increase sampling period
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


