Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA547C021B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 19:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9578810E4A2;
	Wed, 19 Feb 2025 19:42:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390F810E4A2;
 Wed, 19 Feb 2025 19:42:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/devcoredump=3A_Fix?=
 =?utf-8?q?_print_typo_of_offset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Feb 2025 19:42:30 -0000
Message-ID: <173999415022.4112024.1862758559858587339@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219190739.1775077-1-shuicheng.lin@intel.com>
In-Reply-To: <20250219190739.1775077-1-shuicheng.lin@intel.com>
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

Series: drm/xe/devcoredump: Fix print typo of offset
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
commit 9eb1e9724b4ad60a2bd4d179556ad59caeef4300
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Feb 19 19:07:39 2025 +0000

    drm/xe/devcoredump: Fix print typo of offset
    
    The log should print with "offset" instead of "size".
    
    kzalloc returns a valid pointer or NULL if the allocation fails.
    It never returns an error pointer. It is better to check for NULL directly.
    
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 33a6da6c3db44e77db284adb81ae49d34781ec1e drm-intel
9eb1e9724b4a drm/xe/devcoredump: Fix print typo of offset


