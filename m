Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB8FCD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 21:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DBD10EB7F;
	Thu, 28 Mar 2024 21:57:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C2410EB7F;
 Thu, 28 Mar 2024 21:57:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_GT_debugfs_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 21:57:52 -0000
Message-ID: <171166307227.1064930.7058622243872528676@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328162808.451-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240328162808.451-1-michal.wajdeczko@intel.com>
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

Series: Refactor GT debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/129890/
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
commit 16da9e75ccc1a908350cc801bb4f4446a44dd82b
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Mar 28 17:28:08 2024 +0100

    drm/xe: Refactor GT debugfs
    
    We are abusing struct drm_info_list.data by storing there pointer
    to the xe_gt, while it shouldn't be used for any device specific
    data.  Use recently introduced xe_gt_debugfs_simple_show() that
    hides all details how to obtain the xe_gt pointer.  This will also
    remove the need for making copies of the struct drm_info_list
    to get GT specific definitions.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Link: https://lore.kernel.org/r/20240214115756.1525-4-michal.wajdeczko@intel.com
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch d80d79a49622684f7d0c29e26354fa55c718b48a drm-intel
73bf93a2116d drm/xe: Store pointer to struct xe_gt in gt/ debugfs directory
7f0270ed153d drm/xe: Define helper for GT specific debugfs files
16da9e75ccc1 drm/xe: Refactor GT debugfs


