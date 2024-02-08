Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B5C48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 08:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2750A10E376;
	Thu,  8 Feb 2024 08:37:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A9A10E46D;
 Thu,  8 Feb 2024 08:37:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fgt=5Fidle=3A_?=
 =?utf-8?q?Drop_redundant_newline_in_name_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 08:37:34 -0000
Message-ID: <170738145410.1104223.3997802013338287065@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206192731.3533608-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240206192731.3533608-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/xe_gt_idle: Drop redundant newline in name (rev4)
URL   : https://patchwork.freedesktop.org/series/129495/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 35c85dbb4cccf00ccb02d9ffef7a4e9a982fad9e
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Feb 6 11:27:31 2024 -0800

    drm/xe/xe_gt_idle: Drop redundant newline in name
    
    Newline in name is redunant and produces an unnecessary empty line during
    'cat name'. Newline is added during sysfs_emit. See '27a1a1e2e47d ("drm/xe:
    stringify the argument to avoid potential vulnerability")'.
    
    v2: Add Fixes tag (Riana)
    
    Fixes: 7b076d14f21a ("drm/xe/mtl: Add support to get C6 residency/status of MTL")
    Reviewed-by: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch a942be9b4f39a05326a5fc3fd774fb143b4d9507 drm-intel
35c85dbb4 drm/xe/xe_gt_idle: Drop redundant newline in name
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '7b076d14f21a', maybe rebased or not pulled?
#12: 
Fixes: 7b076d14f21a ("drm/xe/mtl: Add support to get C6 residency/status of MTL")

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


