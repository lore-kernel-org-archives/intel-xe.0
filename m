Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AE5CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 08:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B844113A79;
	Fri,  5 Apr 2024 08:35:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B0D113A79;
 Fri,  5 Apr 2024 08:35:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_Wa_KLVs_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 08:35:36 -0000
Message-ID: <171230613601.1227990.10171232513348377690@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405084231.3620848-1-badal.nilawar@intel.com>
In-Reply-To: <20240405084231.3620848-1-badal.nilawar@intel.com>
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

Series: Add support for Wa KLVs (rev4)
URL   : https://patchwork.freedesktop.org/series/131179/
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
commit 9e1c6cf5c47ee058cfe0195e1563e4e973f0ca12
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Fri Apr 5 14:12:31 2024 +0530

    drm/xe/lnl: Enable GuC Wa_14019882105
    
    Enable GuC Wa_14019882105 to block interrupts during C6 flow
    when the memory path has been blocked
    
    v2: Make helper function generic and name it as
        guc_waklv_enable_simple (John Harrison)
    v3: Make warning descriptive (John Harrison)
    v4: s/drm_WARN/xe_gt_WARN/ (Michal)
    
    Cc: John Harrison <john.harrison@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 5f66b4d72c631a3bc5e5ef7e62dbcbf221d28fa3 drm-intel
02ff908dd1e3 drm/xe/guc: Add support for workaround KLVs
9e1c6cf5c47e drm/xe/lnl: Enable GuC Wa_14019882105


