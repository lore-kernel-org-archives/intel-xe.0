Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F86C27C55
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 18:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB4F10E00E;
	Sun,  9 Jun 2024 18:24:44 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE78E10E00E;
 Sun,  9 Jun 2024 18:24:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Few_GuC_PC_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 09 Jun 2024 18:24:41 -0000
Message-ID: <171795748178.29849.12888272485893202072@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240609181931.1724-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240609181931.1724-1-michal.wajdeczko@intel.com>
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

Series: Few GuC PC improvements
URL   : https://patchwork.freedesktop.org/series/134654/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4e2a7e4dc792ffd6fbbf5a7d52738d6fe1c17997
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sun Jun 9 20:19:31 2024 +0200

    drm/xe/guc: Prefer GT oriented messages in xe_guc_pc
    
    If possible, we should prefer xe_gt_err() over drm_err().
    While at it, improve and fix some of the error messages.
    Also drop unnecessary "xe_gt_sysfs.h" include.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 2bea08bd31298d60d416b2a6ed346bb53dd28037 drm-intel
7dc35ac0e17c drm/xe/guc: Move H2G SETUP_PC_GUCRC definition to SLPC ABI
5a046aee703d drm/xe/guc: Add pc_to_ct() helper
4e2a7e4dc792 drm/xe/guc: Prefer GT oriented messages in xe_guc_pc


