Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90051C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 13:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4A910EB22;
	Fri, 12 Jan 2024 13:22:50 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6790910EB1E;
 Fri, 12 Jan 2024 13:22:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/4=5D_drm/xe=3A_Add_uapi_for_dumpable_bos?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Fri, 12 Jan 2024 13:22:48 -0000
Message-ID: <170506576842.332901.5557450020379561379@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/4] drm/xe: Add uapi for dumpable bos
URL   : https://patchwork.freedesktop.org/series/128717/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7a2018706 drm/xe: Fix potential deadlock in __fini_dbm
=== git am output follows ===
.git/rebase-apply/patch:119: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Add uapi for dumpable bos
Applying: drm/xe: Annotate each dumpable vma as such
Applying: drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
Applying: drm/xe: Implement VM snapshot support for BO's and userptr


