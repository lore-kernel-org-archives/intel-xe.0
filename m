Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B68CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 17:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F8E10E61F;
	Fri, 13 Oct 2023 17:23:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E6A1810E624;
 Fri, 13 Oct 2023 17:23:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C9F24AA915;
 Fri, 13 Oct 2023 17:23:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten.lankhorst@linux.intel.com
Date: Fri, 13 Oct 2023 17:23:08 -0000
Message-ID: <169721778879.31157.15952247891071459108@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_RFC_for_discussion_of_devcoredump_uapi=2E?=
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

Series: RFC for discussion of devcoredump uapi.
URL   : https://patchwork.freedesktop.org/series/125124/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 037b6c8b2 fixup! drm/xe/display: Implement display support
=== git am output follows ===
.git/rebase-apply/patch:52: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Add uapi for dumpable bos
Applying: drm/xe: Annotate each dumpable vma as such
Applying: drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
Applying: drm/xe: Almost implement snapshot support


