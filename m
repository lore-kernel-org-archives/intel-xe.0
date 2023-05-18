Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB515C77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB3110E559;
	Thu, 18 May 2023 21:15:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DEDD910E558;
 Thu, 18 May 2023 21:14:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D68B9AADE8;
 Thu, 18 May 2023 21:14:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 18 May 2023 21:14:59 -0000
Message-ID: <168444449987.2372.16911992285712016077@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_series_starting_with_drm/xe=3A_Introduce_the_dev=5Fcoredump_?=
 =?utf-8?q?infrastructure=2E_65=3B_7002=3B_1c_The_goal_is_to_use_devcoredu?=
 =?utf-8?q?mp_infrastructure_to_report_error_states_captured_at_the_crash_?=
 =?utf-8?b?dGltZS4gKHJldjIp?=
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

Series: series starting with drm/xe: Introduce the dev_coredump infrastructure. 65; 7002; 1c The goal is to use devcoredump infrastructure to report error states captured at the crash time. (rev2)
URL   : https://patchwork.freedesktop.org/series/117821/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 1658a5be6 drm/xe: Allow scanout of bos that can be migrated to lmem
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_devcoredump.c:80
error: drivers/gpu/drm/xe/xe_devcoredump.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Introduce the dev_coredump infrastructure. 65; 7002; 1c The goal is to use devcoredump infrastructure to report error states captured at the crash time.
Applying: drm/xe: Do not take any action if our device was removed.
Applying: drm/xe: Extract non mapped regions out of GuC CTB into its own struct.
Applying: drm/xe: Convert GuC CT print to snapshot capture and print.
Applying: drm/xe: Add GuC CT snapshot to xe_devcoredump.
Patch failed at 0005 drm/xe: Add GuC CT snapshot to xe_devcoredump.
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


