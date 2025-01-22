Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F7C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962C110E066;
	Wed, 22 Jan 2025 21:54:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456AA10E066;
 Wed, 22 Jan 2025 21:54:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re-instate_GuC_logs_in_de?=
 =?utf-8?q?bugfs_=26_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 21:54:47 -0000
Message-ID: <173758288727.3227875.8349400665712495197@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122214601.3560156-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250122214601.3560156-1-John.C.Harrison@Intel.com>
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

Series: Re-instate GuC logs in debugfs & devcoredump
URL   : https://patchwork.freedesktop.org/series/143864/
State : warning

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
commit 55b915b580d11ee3631fc956d8cfe4122aef6b45
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed Jan 22 13:46:01 2025 -0800

    Partially revert "drm/xe: Revert some changes that break a mesa debug tool"
    
    This reverts part of commit a53da2fb25a31f4fb8eaeb93c7b1134fc14fd209.
    
    The KMD has been updated to avoid the line wrapping issue of the mesa
    tool. The section heading issue has not been fixed yet, however. So
    that part of the original revert remains.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch d577d9e67e5ac149fcd4442327210b831cddb308 drm-intel
33f5ee1348b0 drm/xe/guc: Explicitly name each chunk of GuC log data in a dump
0c695f48abfa drm/xe/devcoredump: Temporarily disable the line wrapping of ASCII85 output
55b915b580d1 Partially revert "drm/xe: Revert some changes that break a mesa debug tool"
-:7: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit a53da2fb25a3 ("drm/xe: Revert some changes that break a mesa debug tool")'
#7: 
This reverts part of commit a53da2fb25a31f4fb8eaeb93c7b1134fc14fd209.

total: 1 errors, 0 warnings, 0 checks, 15 lines checked


