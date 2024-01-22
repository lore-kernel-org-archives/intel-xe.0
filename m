Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B3FC47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 14:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C088810F227;
	Mon, 22 Jan 2024 14:52:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787DE10F21B;
 Mon, 22 Jan 2024 14:52:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vm=3A_bugfix_in_xe?=
 =?utf-8?q?=5Fvm=5Fcreate=5Fioctl_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Moti Haimovski" <mhaimovski@habana.ai>
Date: Mon, 22 Jan 2024 14:52:34 -0000
Message-ID: <170593515449.646838.6978352586692494924@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240121121946.3969513-1-mhaimovski@habana.ai>
In-Reply-To: <20240121121946.3969513-1-mhaimovski@habana.ai>
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

Series: drm/xe/vm: bugfix in xe_vm_create_ioctl (rev3)
URL   : https://patchwork.freedesktop.org/series/128984/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4e24dc973b0879355a56f9e24b43f4fa62935ca1
Author: Moti Haimovski <mhaimovski@habana.ai>
Date:   Sun Jan 21 14:19:46 2024 +0200

    drm/xe/vm: bugfix in xe_vm_create_ioctl
    
    Fix xe_vm_create_ioctl routine not freeing the vm-id allocated to it
    when the function fails.
    
    Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
+ /mt/dim checkpatch cd467a333188d8bb953854236f1ee441e6cede61 drm-intel
4e24dc973 drm/xe/vm: bugfix in xe_vm_create_ioctl


