Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA45DC369CB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 01:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9951810E1F2;
	Fri, 18 Apr 2025 01:26:43 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EF610E1F2;
 Fri, 18 Apr 2025 01:26:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22drm/xe=3A_enabl?=
 =?utf-8?q?e_lite_restore=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Apr 2025 01:26:42 -0000
Message-ID: <174493960241.16766.16297780750828983427@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417235756.456283-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250417235756.456283-1-umesh.nerlige.ramappa@intel.com>
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

Series: Revert "drm/xe: enable lite restore" (rev2)
URL   : https://patchwork.freedesktop.org/series/147946/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eb8cd1421f67c377c7da748c603e627ed90331c6
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Thu Apr 17 16:57:56 2025 -0700

    Revert "drm/xe: enable lite restore"
    
    Lite restore is breaking some functionality in MangoHud. While lite
    restore is certainly preferable, it is throwing off per context
    utilization calculations that rely on the context switching out. The
    utilization counters are used by MangoHud to overlay GPU utilization on
    screen.
    
    Hold off on enabling lite restore until we find a better way to
    accommodate lite restore with per context utilization counters.
    
    v2: checkpatch issues fixed
    
    This reverts commit 6ef3bb60557d5e7f5af442c8c9ef0a9190bf3d23.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 1e5b5f168ee053192ea7ec05bfe826f848be7d68 drm-intel
eb8cd1421f67 Revert "drm/xe: enable lite restore"


