Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25150C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 18:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24AB11275E;
	Mon, 15 Apr 2024 18:04:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40CC112761;
 Mon, 15 Apr 2024 18:04:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/irq=3A_remove_unne?=
 =?utf-8?q?eded_semicolon?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jiapeng Chong" <jiapeng.chong@linux.alibaba.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 18:04:45 -0000
Message-ID: <171320428500.1406028.14723680649560630424@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415032733.39584-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240415032733.39584-1-jiapeng.chong@linux.alibaba.com>
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

Series: drm/xe/irq: remove unneeded semicolon
URL   : https://patchwork.freedesktop.org/series/132423/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 80db03f3a1f2e793c673a1100e0ca510e6139da7
Author: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Date:   Mon Apr 15 11:27:33 2024 +0800

    drm/xe/irq: remove unneeded semicolon
    
    No functional modification involved.
    
    ./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon.
    
    Reported-by: Abaci Robot <abaci@linux.alibaba.com>
    Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
    Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
    Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch cbb4da5d13fb7004349f73eddd9ebad6d2e65975 drm-intel
80db03f3a1f2 drm/xe/irq: remove unneeded semicolon


