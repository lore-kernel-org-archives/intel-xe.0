Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227FDC47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 15:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF66010E9FF;
	Fri, 19 Jan 2024 15:41:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0638610E193;
 Fri, 19 Jan 2024 15:41:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vm=3A_bugfix_in_xe?=
 =?utf-8?q?=5Fvm=5Fcreate=5Fioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Moti Haimovski" <mhaimovski@habana.ai>
Date: Fri, 19 Jan 2024 15:41:47 -0000
Message-ID: <170567890702.593058.5684925820094508326@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240118173155.3851635-1-mhaimovski@habana.ai>
In-Reply-To: <20240118173155.3851635-1-mhaimovski@habana.ai>
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

Series: drm/xe/vm: bugfix in xe_vm_create_ioctl
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
commit b73fcfb53291dcaca0134dcf26085edd14e02712
Author: Moti Haimovski <mhaimovski@habana.ai>
Date:   Thu Jan 18 19:31:55 2024 +0200

    drm/xe/vm: bugfix in xe_vm_create_ioctl
    
    Fix xe_vm_create_ioctl routine not freeing the vm-id allocated to it
    when the function fails.
    
    Relates to: FSW-1360 xe_vm_create_ioctl does not free vm id on error.
    
    Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
+ /mt/dim checkpatch dd32e83fbea77dc8973a3aa8a6c8d460b8d103dd drm-intel
b73fcfb53 drm/xe/vm: bugfix in xe_vm_create_ioctl


