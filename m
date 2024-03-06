Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65976C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 11:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20A810EC83;
	Wed,  6 Mar 2024 11:05:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D51311222C;
 Wed,  6 Mar 2024 11:05:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_um=3A_Minor_fixes_an?=
 =?utf-8?q?d_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tiwei Bie" <tiwei.btw@antgroup.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 11:05:55 -0000
Message-ID: <170972315564.524258.11174153147584902475@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
In-Reply-To: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
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

Series: um: Minor fixes and cleanups
URL   : https://patchwork.freedesktop.org/series/130801/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6e50187af603 drm-tip: 2024y-03m-06d-08h-35m-10s UTC integration manifest
=== git am output follows ===
Applying: um: Make local functions and variables static
Applying: um: Fix the declaration of vfree
Applying: um: Remove unused functions
Applying: um: Fix the return type of __switch_to
Applying: um: Add missing headers
Applying: um: Stop tracking host PID in cpu_tasks
Applying: um: Move declarations to proper headers
Applying: um: Fix -Wmissing-prototypes warnings for text_poke*
Applying: um: Fix -Wmissing-prototypes warnings for __warp_* and foo


