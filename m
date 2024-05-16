Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72989C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 17:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DA110ED7E;
	Thu, 16 May 2024 17:40:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772BB10E4E0;
 Thu, 16 May 2024 17:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_tracing/treewide=3A_?=
 =?utf-8?q?Remove_second_parameter_of_=5F=5Fassign=5Fstr=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Steven Rostedt" <rostedt@goodmis.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 May 2024 17:40:21 -0000
Message-ID: <171588122148.2122196.5164809021130176119@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240516133454.681ba6a0@rorschach.local.home>
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
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

Series: tracing/treewide: Remove second parameter of __assign_str() (rev3)
URL   : https://patchwork.freedesktop.org/series/130321/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 01e8fd3a8450 drm-tip: 2024y-05m-16d-16h-23m-10s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_trace.h:101
error: drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_trace.h: patch does not apply
error: patch failed: drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_trace.h:101
error: drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_trace.h: patch does not apply
error: patch failed: include/trace/events/sched.h:445
error: include/trace/events/sched.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: tracing/treewide: Remove second parameter of __assign_str()
Patch failed at 0001 tracing/treewide: Remove second parameter of __assign_str()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


