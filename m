Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE7FC02181
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 00:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6510E26F;
	Thu, 23 Jan 2025 00:03:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39AA10E247;
 Thu, 23 Jan 2025 00:02:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Re-instate_GuC_logs_?=
 =?utf-8?q?in_debugfs_=26_devcoredump_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 00:02:27 -0000
Message-ID: <173759054779.3263273.13567328706795840332@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122233305.3667730-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250122233305.3667730-1-John.C.Harrison@Intel.com>
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

Series: Re-instate GuC logs in debugfs & devcoredump (rev2)
URL   : https://patchwork.freedesktop.org/series/143864/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: db7cf8d52a41 drm-tip: 2025y-01m-22d-22h-24m-50s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Explicitly name each chunk of GuC log data in a dump
Applying: drm/xe/devcoredump: Temporarily disable the line wrapping of ASCII85 output
Applying: Partially revert "drm/xe: Revert some changes that break a mesa debug tool"


