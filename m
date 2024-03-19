Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3632C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 15:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2A710ED1C;
	Tue, 19 Mar 2024 15:59:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2F810FAF4;
 Tue, 19 Mar 2024 15:59:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_Wa_KLVs_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 15:59:49 -0000
Message-ID: <171086398965.903241.16330489122540940991@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319160859.2672825-1-badal.nilawar@intel.com>
In-Reply-To: <20240319160859.2672825-1-badal.nilawar@intel.com>
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

Series: Add support for Wa KLVs (rev2)
URL   : https://patchwork.freedesktop.org/series/131179/
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
commit 64e2964ffe7e64f7dd5da5dd0bc9df711b1b0f3c
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Tue Mar 19 21:38:59 2024 +0530

    drm/xe/lnl: Enable GuC Wa_14019882105
    
    Enable GuC Wa_14019882105 to block interrupts during C6 flow
    when the memory path has been blocked
    
    v2: Make helper function generic and name it as
        guc_waklv_enable_simple (John Harrison)
    
    Cc: John Harrison <john.harrison@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 56cad40cf059b2210ef2c7489dc2d69da3864450 drm-intel
8b2a82e7593d drm/xe/guc: Add support for w/a KLVs
64e2964ffe7e drm/xe/lnl: Enable GuC Wa_14019882105


