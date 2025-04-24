Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDABCC369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 12:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFA310E0EE;
	Thu, 24 Apr 2025 12:49:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030FC10E03F;
 Thu, 24 Apr 2025 12:49:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe/eustall=3A_Do_not_support_EU_stall_on_SRIOV_VF_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 12:49:48 -0000
Message-ID: <174549898801.6235.7882872049309152325@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <10db5d1c7e17aadca7078ff74575b7ffc0d5d6b8.1745215022.git.harish.chegondi@intel.com>
In-Reply-To: <10db5d1c7e17aadca7078ff74575b7ffc0d5d6b8.1745215022.git.harish.chegondi@intel.com>
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

Series: series starting with [1/1] drm/xe/eustall: Do not support EU stall on SRIOV VF (rev2)
URL   : https://patchwork.freedesktop.org/series/148004/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d0d44f7bd1c8f375a937f32b419695c17a956acd
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Sun Apr 20 22:59:01 2025 -0700

    drm/xe/eustall: Do not support EU stall on SRIOV VF
    
    EU stall sampling is not supported on SRIOV VF. Do not
    initialize or open EU stall stream on SRIOV VF.
    
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 6176f71822602f52bc4327965090275c5570ed0d drm-intel
d0d44f7bd1c8 drm/xe/eustall: Do not support EU stall on SRIOV VF


