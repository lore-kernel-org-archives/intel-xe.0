Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B659C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 15:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D4210E3C3;
	Tue, 27 Feb 2024 15:15:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF2110E166;
 Tue, 27 Feb 2024 15:15:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Display_experiment_+?=
 =?utf-8?q?_GuC_Display_Metrics?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 15:15:18 -0000
Message-ID: <170904691837.337360.6815508669460464865@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227145833.490328-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240227145833.490328-1-rodrigo.vivi@intel.com>
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

Series: Display experiment + GuC Display Metrics
URL   : https://patchwork.freedesktop.org/series/130436/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ed7aa4acb76b drm-tip: 2024y-02m-27d-12h-51m-14s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_gt_debugfs.c:103
error: drivers/gpu/drm/xe/xe_gt_debugfs.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_pc.c:973
error: drivers/gpu/drm/xe/xe_guc_pc.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_pc.h:8
error: drivers/gpu/drm/xe/xe_guc_pc.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/display: Introduce intel_display_guc_metrics
Applying: drm/i915: Add experimental GuC SLPC display metrics
Applying: drm/xe: Add GuC SLPC Display Metrics
Patch failed at 0003 drm/xe: Add GuC SLPC Display Metrics
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


