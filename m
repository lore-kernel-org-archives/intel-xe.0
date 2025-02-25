Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42DCC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 15:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F06010E0FF;
	Tue, 25 Feb 2025 15:29:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87C010E0FF;
 Tue, 25 Feb 2025 15:29:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_fault_mode_?=
 =?utf-8?q?invalidation_with_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 15:29:21 -0000
Message-ID: <174049736194.2004622.10095441403033600918@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225134426.315876-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250225134426.315876-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Fix fault mode invalidation with unbind
URL   : https://patchwork.freedesktop.org/series/145409/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d5855f236a08803a83e0c06a5c3f7d1ba81472b1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Feb 25 14:44:26 2025 +0100

    drm/xe: Fix fault mode invalidation with unbind
    
    Fix fault mode invalidation racing with unbind leading to the
    PTE zapping potentially traversing an invalid page-table tree.
    Do this by holding the notifier lock across PTE zapping. This
    might transfer any contention waiting on the notifier seqlock
    read side to the notifier lock read side, but that shouldn't be
    a major problem.
    
    At the same time get rid of the open-coded invalidation in the bind
    code by relying on the notifier even when the vma bind is not
    yet committed.
    
    Finally let userptr invalidation injections during binding
    unconditionally return -EAGAIN.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch c7988865b658d56bcfaac76b7d72cc59435565eb drm-intel
d5855f236a08 drm/xe: Fix fault mode invalidation with unbind


