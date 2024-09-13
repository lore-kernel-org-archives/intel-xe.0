Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7C4EEEC1E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 06:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1112310E1E6;
	Fri, 13 Sep 2024 06:14:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A4D10E160;
 Fri, 13 Sep 2024 06:14:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/irq=3A_remove_unne?=
 =?utf-8?q?eded_semicolon_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jiapeng Chong" <jiapeng.chong@linux.alibaba.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 06:14:47 -0000
Message-ID: <172620808772.994933.3767891098596285193@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913060254.26678-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240913060254.26678-1-jiapeng.chong@linux.alibaba.com>
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

Series: drm/xe/irq: remove unneeded semicolon (rev2)
URL   : https://patchwork.freedesktop.org/series/132423/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d3fc5c125b0ae633678bf03a50cbda39717dc8b6
Author: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Date:   Fri Sep 13 14:02:54 2024 +0800

    drm/xe/irq: Remove unneeded semicolon
    
    Remove unnecessary semicolon in pick_engine_gt().
    
    Reported-by: Abaci Robot <abaci@linux.alibaba.com>
    Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
    Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
+ /mt/dim checkpatch e55e4cc47de4150012eec3e54b6d710967d66510 drm-intel
d3fc5c125b0a drm/xe/irq: Remove unneeded semicolon


