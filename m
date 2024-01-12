Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA251C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 10:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F85D10EAAC;
	Fri, 12 Jan 2024 10:08:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2304E10EAAC;
 Fri, 12 Jan 2024 10:08:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_ensure_fbc_cfb_?=
 =?utf-8?q?size_to_be_page_size_aligned?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Fri, 12 Jan 2024 10:08:34 -0000
Message-ID: <170505411414.332503.3600019432880879092@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112092803.61664-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240112092803.61664-1-vinod.govindapillai@intel.com>
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

Series: drm/xe: ensure fbc cfb size to be page size aligned
URL   : https://patchwork.freedesktop.org/series/128709/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 185333d1a86163d3753f0d9c445c069d20ae2cce
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Fri Jan 12 11:28:03 2024 +0200

    drm/xe: Modify the cfb size to be page size aligned for FBC
    
    drm_gem_private_object_init expect the object size be page size
    aligned. The xe_bo create functions do not update the size for
    any alignment requirements. So align cfb size to be page size
    aligned in xe stolen memory handling.
    
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 10923212b018be3edb1c21b75f432c6cf3f50c6b drm-intel
185333d1a drm/xe: Modify the cfb size to be page size aligned for FBC


