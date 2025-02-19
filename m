Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A450C021B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 22:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E270710E08B;
	Wed, 19 Feb 2025 22:48:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0739D10E08B;
 Wed, 19 Feb 2025 22:48:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/devcoredump=3A_Fix?=
 =?utf-8?q?_print_typo_of_offset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Feb 2025 22:48:46 -0000
Message-ID: <174000532602.4177349.3973536337193598322@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
In-Reply-To: <20250219212631.1788586-1-shuicheng.lin@intel.com>
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

Series: drm/xe/devcoredump: Fix print typo of offset (rev2)
URL   : https://patchwork.freedesktop.org/series/145119/
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
commit 43cc3490aa702cdc36398520cd905083f9545237
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Feb 19 21:26:31 2025 +0000

    drm/xe/devcoredump: Fix print typo of offset
    
    The log should print with "offset" instead of "size".
    Correct the typo in the comment.
    
    v2: split kzalloc change and add typo fix in commit message (Lucas)
    
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e19eb43c82480789a93ce0c452e22bbd851b93c6 drm-intel
43cc3490aa70 drm/xe/devcoredump: Fix print typo of offset


