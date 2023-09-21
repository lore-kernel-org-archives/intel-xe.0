Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2059FE7D0AB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 21:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B4510E61C;
	Thu, 21 Sep 2023 21:08:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C3DC810E61A;
 Thu, 21 Sep 2023 21:08:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BE18BAADDC;
 Thu, 21 Sep 2023 21:08:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Date: Thu, 21 Sep 2023 21:08:23 -0000
Message-ID: <169533050377.7235.9086715868353091134@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920213259.3458968-1-pallavi.mishra@intel.com>
In-Reply-To: <20230920213259.3458968-1-pallavi.mishra@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Align_size_to_PAGE=5FSIZE_=28rev3=29?=
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

Series: drm/xe: Align size to PAGE_SIZE (rev3)
URL   : https://patchwork.freedesktop.org/series/123997/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 32334e33cb9f8a12a866fd1ebeedf0bfa4a44879
Author: Pallavi Mishra <pallavi.mishra@intel.com>
Date:   Thu Sep 21 03:02:59 2023 +0530

    drm/xe: Align size to PAGE_SIZE
    
    Ensure alignment with PAGE_SIZE for the size parameter
    passed to __xe_bo_create_locked()
    
    v2: move size alignment under else condition (Lucas)
    
    Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
+ /mt/dim checkpatch 7e0d40e7aa56f19a9b3e9bc492003085f9be01c3 drm-intel
32334e33c drm/xe: Align size to PAGE_SIZE


