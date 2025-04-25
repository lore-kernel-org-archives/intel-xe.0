Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559F0C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 20:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A1510E9CF;
	Fri, 25 Apr 2025 20:29:21 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E23510E9CD;
 Fri, 25 Apr 2025 20:29:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_check_for_a?=
 =?utf-8?q?lloc=5Fordered=5Fworkqueue=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Haoxiang Li" <haoxiang_li2024@163.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 20:29:20 -0000
Message-ID: <174561296045.13050.4250743349058784739@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424023335.3497842-1-haoxiang_li2024@163.com>
In-Reply-To: <20250424023335.3497842-1-haoxiang_li2024@163.com>
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

Series: drm/xe: Add check for alloc_ordered_workqueue() (rev2)
URL   : https://patchwork.freedesktop.org/series/145244/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e60588613fb3535d536c4a2ad0733239b0fb3450
Author: Haoxiang Li <haoxiang_li2024@163.com>
Date:   Thu Apr 24 10:33:35 2025 +0800

    drm/xe: Add check for alloc_ordered_workqueue()
    
    Add check for the return value of alloc_ordered_workqueue()
    in xe_gt_alloc() to catch potential exception.
    
    Fixes: e2d84e5b2205 ("drm/xe: Mark GT work queue with WQ_MEM_RECLAIM")
    Cc: stable@vger.kernel.org
    Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 6e67a7af43567bb9f23fe156fde7efa3d214fd20 drm-intel
e60588613fb3 drm/xe: Add check for alloc_ordered_workqueue()


