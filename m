Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6777FC7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 14:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0CB10E0A3;
	Fri,  9 Jun 2023 14:41:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1943710E6B6;
 Fri,  9 Jun 2023 14:40:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0D687A66C9;
 Fri,  9 Jun 2023 14:40:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Fri, 09 Jun 2023 14:40:58 -0000
Message-ID: <168632165805.15973.17235506740692934308@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230609143815.302540-1-gustavo.sousa@intel.com>
In-Reply-To: <20230609143815.302540-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/reg=5Fsr=3A_Apply_limit_to_register_whitelisting_=28rev2?=
 =?utf-8?q?=29?=
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

Series: drm/xe/reg_sr: Apply limit to register whitelisting (rev2)
URL   : https://patchwork.freedesktop.org/series/118400/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fcb735e7ad4c42b7ac8ff3787c8e0b511760f1c6
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Jun 9 11:38:15 2023 -0300

    drm/xe/reg_sr: Apply limit to register whitelisting
    
    If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
    slots, then it makes sense to refuse going above it.
    
    v2:
      - Use xe_gt_err() instead of drm_err() for more detailed info in the
        error message. (Matt)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch c075cadc4c6d0238556545baab98a63368908404 drm-intel
a30416d4e drm/xe/reg_sr: Use a single parameter for xe_reg_sr_apply_whitelist()
fcb735e7a drm/xe/reg_sr: Apply limit to register whitelisting


