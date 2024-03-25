Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5642C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 14:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FED10E959;
	Mon, 25 Mar 2024 14:56:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6741310E969;
 Mon, 25 Mar 2024 14:56:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_Wa_KLVs_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 14:56:25 -0000
Message-ID: <171137858542.1035674.5860269351450685179@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
In-Reply-To: <20240325150435.2967536-1-badal.nilawar@intel.com>
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

Series: Add support for Wa KLVs (rev3)
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
commit 40da6d9388c5c69e76711630a3a8a265aa0ae37d
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Mon Mar 25 20:34:35 2024 +0530

    drm/xe/lnl: Enable GuC Wa_14019882105
    
    Enable GuC Wa_14019882105 to block interrupts during C6 flow
    when the memory path has been blocked
    
    v2: Make helper function generic and name it as
        guc_waklv_enable_simple (John Harrison)
    v3: Make warning descriptive (John Harrison)
    
    Cc: John Harrison <john.harrison@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch fc736bbab7abcae683f52604591fe16cf2a85b3e drm-intel
a5d80e6b686d drm/xe/guc: Add support for w/a KLVs
40da6d9388c5 drm/xe/lnl: Enable GuC Wa_14019882105


