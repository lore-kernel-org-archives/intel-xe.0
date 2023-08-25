Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671C6C71133
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 12:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAA210E65C;
	Fri, 25 Aug 2023 12:08:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9384910E65C;
 Fri, 25 Aug 2023 12:08:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9017EAADDA;
 Fri, 25 Aug 2023 12:08:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Date: Fri, 25 Aug 2023 12:08:29 -0000
Message-ID: <169296530958.10953.9155998904909586613@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_A_tool_to_demonstrate_use_of_netlink_sockets_to_read_RAS_err?=
 =?utf-8?q?or_counters_=28rev2=29?=
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

Series: A tool to demonstrate use of netlink sockets to read RAS error counters (rev2)
URL   : https://patchwork.freedesktop.org/series/118437/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: b9c9020fc drm/xe/pvc: Use fast copy engines as migrate engine on PVC
=== git am output follows ===
error: meson.build: does not exist in index
.git/rebase-apply/patch:505: new blank line at EOF.
+
error: tools/meson.build: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: tools/RAS: A tool to read error counters
Patch failed at 0001 tools/RAS: A tool to read error counters
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


