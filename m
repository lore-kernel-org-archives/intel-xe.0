Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37940CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 20:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFFA112F09;
	Wed,  3 Apr 2024 20:51:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDB1112EF6;
 Wed,  3 Apr 2024 20:51:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Protect_devcore?=
 =?utf-8?q?dump_access_after_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 20:51:32 -0000
Message-ID: <171217749225.1171321.9695321801768599764@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403195044.239766-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240403195044.239766-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Protect devcoredump access after unbind
URL   : https://patchwork.freedesktop.org/series/132005/
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
commit 7ecf971db740db305962a6983c1cec8a501ebb59
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Apr 3 15:50:44 2024 -0400

    drm/xe: Protect devcoredump access after unbind
    
    While we don't have the full flow protection when devcoredump
    is accessed after device unbind. Let's at least for now
    protect against null dereference:
    
    [  422.766508] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
    [  423.119584] RIP: 0010:xe_vm_snapshot_free+0x30/0x180 [xe]
    
    While at it, I also fixed a non-standard code-declaration block
    on the similar function of xe_guc_submit.
    
    v2: - Use IS_ERR_OR_NULL (Nirmoy)
        - Expand to other functions
    
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 406e10d886a22211d2866bfa9322aec1727171f8 drm-intel
7ecf971db740 drm/xe: Protect devcoredump access after unbind


