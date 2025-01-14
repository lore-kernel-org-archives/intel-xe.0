Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5085AC02183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 22:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F3310E386;
	Tue, 14 Jan 2025 22:50:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E902510E386;
 Tue, 14 Jan 2025 22:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Drop_error_?=
 =?utf-8?q?messages_about_missing_GuC_logs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jan 2025 22:50:20 -0000
Message-ID: <173689502094.3744129.17181677693513375818@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250113194405.2033085-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250113194405.2033085-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Drop error messages about missing GuC logs (rev2)
URL   : https://patchwork.freedesktop.org/series/143477/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c161abbb900ec1f08cd6bea6e84facbefb240f9c
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Mon Jan 13 11:44:04 2025 -0800

    drm/xe/guc: Drop error messages about missing GuC logs
    
    The GuC log snapshot code would complain loudly if there was no GuC
    log to take a snapshot of or if the snapshot alloc failed. Originally,
    this code was only called on demand when a user (or developer)
    explicitly requested a dump of the log. Hence an error message was
    useful.
    
    However, it is now part of the general devcoredump file and is called
    for any GPU hang. Most people don't care about GuC logs and GPU hangs
    do not generally mean a kernel/GuC bug. More importantly, there are
    valid situations where there is no GuC log, e.g. SRIOV VFs.
    
    So drop the error message.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3958
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch a45139b1e7578c7a4f1cbe8fae0943416a174136 drm-intel
c161abbb900e drm/xe/guc: Drop error messages about missing GuC logs


