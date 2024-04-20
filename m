Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9654EC4345F
	for <intel-xe@archiver.kernel.org>; Sat, 20 Apr 2024 04:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB8910F45B;
	Sat, 20 Apr 2024 04:35:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF3710F45B;
 Sat, 20 Apr 2024 04:35:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Apply_LNL_workaround?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Apr 2024 04:35:09 -0000
Message-ID: <171358770944.1537358.838152414472148169@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
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

Series: Apply LNL workaround
URL   : https://patchwork.freedesktop.org/series/132662/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7abf678f98a55b31d057f1b072c4d31b8f7c409f
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Fri Apr 19 13:13:44 2024 -0700

    drm/xe/bmg: Apply Wa_22019338487 for BMG
    
    Extend this WA to BMG GT as well. In this case media GT is
    not affected.
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 5b8f5c906246fb3ddf35b775a3b6ac9ea5fdcdd5 drm-intel
e8c0d2663808 drm/xe/lnl: Apply Wa_22019338487
-:142: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around '!ret'
#142: FILE: drivers/gpu/drm/xe/xe_guc_pc.c:743:
+	if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {

total: 0 errors, 0 warnings, 1 checks, 127 lines checked
7abf678f98a5 drm/xe/bmg: Apply Wa_22019338487 for BMG


