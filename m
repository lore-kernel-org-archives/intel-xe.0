Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2A4CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A1C112BC4;
	Wed,  3 Apr 2024 15:14:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10299112BC3;
 Wed,  3 Apr 2024 15:14:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Protect_devcore?=
 =?utf-8?q?dump=5Ffree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 15:14:31 -0000
Message-ID: <171215727106.1172471.15521535287604381970@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403145054.97414-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240403145054.97414-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Protect devcoredump_free
URL   : https://patchwork.freedesktop.org/series/131996/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7a09553c7189887ab0fb764c932fdf61b747400d
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Apr 3 10:50:54 2024 -0400

    drm/xe: Protect devcoredump_free
    
    While we don't have the full flow protection when devcoredump
    is accessed after device unbind. Let's at least for now
    protect against null dereference:
    
    [  422.766508] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
    [  423.119584] RIP: 0010:xe_vm_snapshot_free+0x30/0x180 [xe]
    
    While at it, I also fixed a non-standard code-declaration block
    on the similar function of xe_guc_submit.
    
    Fixes: e5f661bb56d4 ("drm/xe/devcoredump: Print errno if VM snapshot was not captured")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch c8dc2a19ae7157e065d5f0c78bc4d3f83165fdef drm-intel
7a09553c7189 drm/xe: Protect devcoredump_free


