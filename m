Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF89C47258
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 16:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE4010E326;
	Mon, 15 Jan 2024 16:09:36 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E56D10E31E;
 Mon, 15 Jan 2024 16:09:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Remove_obsolete?=
 =?utf-8?q?_async=5Fops_from_struct_xe=5Fvm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Mon, 15 Jan 2024 16:09:36 -0000
Message-ID: <170533497605.479824.12660789139747898630@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240115160113.2286972-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240115160113.2286972-1-mika.kuoppala@linux.intel.com>
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

Series: drm/xe: Remove obsolete async_ops from struct xe_vm
URL   : https://patchwork.freedesktop.org/series/128782/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 070d3d73a7ec57aa008a73455bd3dba6fe793eeb
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Mon Jan 15 18:01:13 2024 +0200

    drm/xe: Remove obsolete async_ops from struct xe_vm
    
    Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
    made async_ops in struct xe_vm obsolete but forgot to remove it.
    
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 3a1d727c0061b96ddf8e653130f94ab331e2f065 drm-intel
070d3d73a drm/xe: Remove obsolete async_ops from struct xe_vm
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f3e9b1f43458', maybe rebased or not pulled?
#6: 
Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")

total: 0 errors, 1 warnings, 0 checks, 30 lines checked


