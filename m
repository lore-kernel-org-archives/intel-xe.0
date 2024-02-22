Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442C1C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97B710E30B;
	Thu, 22 Feb 2024 16:45:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C37110E30B;
 Thu, 22 Feb 2024 16:45:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B01/14=5D_drm/xe=3A_Document_Xe_PM_component?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 16:45:51 -0000
Message-ID: <170862035131.217031.10113325365829079824@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
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

Series: series starting with [01/14] drm/xe: Document Xe PM component
URL   : https://patchwork.freedesktop.org/series/130270/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ae1e283133b8 drm-tip: 2024y-02m-22d-13h-48m-03s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Document Xe PM component
Applying: drm/xe: Convert mem_access assertion towards the runtime_pm state
Applying: drm/xe: Runtime PM wake on every IOCTL
Applying: drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
Applying: drm/xe: Runtime PM wake on every sysfs call
Applying: drm/xe: Remove mem_access from guc_pc calls
Applying: drm/xe: Runtime PM wake on every debugfs call
Applying: drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
Applying: drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
Applying: drm/xe: Remove useless mem_access protection for query ioctls
Applying: drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
Applying: drm/xe: Remove mem_access from suspend and resume functions
Applying: drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
Applying: drm/xe: Remove useless mem_access on PAT dumps


