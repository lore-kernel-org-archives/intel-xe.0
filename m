Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7F5C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 05:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBF110E38C;
	Thu,  4 Jan 2024 05:40:03 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1039710E38C;
 Thu,  4 Jan 2024 05:40:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_First_attempt_to_kil?=
 =?utf-8?q?l_mem=5Faccess?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 04 Jan 2024 05:40:03 -0000
Message-ID: <170434680306.1840.1265367630696800214@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
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

Series: First attempt to kill mem_access
URL   : https://patchwork.freedesktop.org/series/128044/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7b3b98d03 drm/xe/xe2: Add workaround 16020183090
=== git am output follows ===
Applying: drm/xe: Document Xe PM component
Applying: drm/xe: Fix display runtime_pm handling
Applying: drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
Applying: drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion
Applying: drm/xe: Prepare display for D3Cold
Applying: drm/xe: Convert mem_access assertion towards the runtime_pm state
Applying: drm/xe: Runtime PM wake on every IOCTL
Applying: drm/xe: Runtime PM wake on every exec
Applying: drm/xe: Runtime PM wake on every sysfs call
Applying: drm/xe: Sort some xe_pm_runtime related functions
Applying: drm/xe: Ensure device is awake before removing it
Applying: drm/xe: Remove mem_access from guc_pc calls
Applying: drm/xe: Runtime PM wake on every debugfs call
Applying: drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
Applying: drm/xe: Allow GuC CT fast path and worker regardless of runtime_pm
Applying: drm/xe: Remove mem_access calls from migration
Applying: drm/xe: Removing extra mem_access protection from runtime pm
Applying: drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
Applying: drm/xe: Remove unused runtime pm helper
Applying: drm/xe: Mega Kill of mem_access


