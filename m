Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2576EC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 22:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A6A10EB16;
	Mon, 25 Mar 2024 22:21:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5C10EB16;
 Mon, 25 Mar 2024 22:21:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Send_flat=5Fccs_value_in_?=
 =?utf-8?q?struct_drm=5Fxe=5Fquery=5Fconfig?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 22:21:23 -0000
Message-ID: <171140528384.1038645.6778253685625210167@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1711447408.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1711447408.git.akshata.jahagirdar@intel.com>
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

Series: Send flat_ccs value in struct drm_xe_query_config
URL   : https://patchwork.freedesktop.org/series/131609/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 10dc48edfc8cf69bd60644dfafb92c8c595a31d1
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Tue Mar 26 03:10:31 2024 -0700

    drm/xe/xe2: Send flat_ccs value in struct drm_xe_query_config
    
    Currently, we don't have any check in IGT testcases if platform supports
    compression or not. Send this flat_ccs value as part of the struct
    drm_xe_query_config so that we can read this value in the igt testcases
    and proceed accordingly.
    Fixes: VLK-56136
    
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
+ /mt/dim checkpatch 3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8 drm-intel
10dc48edfc8c drm/xe/xe2: Send flat_ccs value in struct drm_xe_query_config


