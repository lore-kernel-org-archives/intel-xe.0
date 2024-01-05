Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5ECC47074
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 00:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189B10E559;
	Fri,  5 Jan 2024 00:37:06 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6258610E55F;
 Fri,  5 Jan 2024 00:37:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Check_skip=5Fgu?=
 =?utf-8?q?c=5Fpc_before_setting_SLPC_flag_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Date: Fri, 05 Jan 2024 00:37:05 -0000
Message-ID: <170441502540.22406.16134743879611151854@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240105003341.124422-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240105003341.124422-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Check skip_guc_pc before setting SLPC flag (rev3)
URL   : https://patchwork.freedesktop.org/series/128001/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 54ae10a2a4d04eb53bf47ade1c1daa1a78deb9d4
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Jan 4 16:33:41 2024 -0800

    drm/xe: Check skip_guc_pc before setting SLPC flag
    
    Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
    
    v2: Skip the freq related sysfs creation as well (Badal)
    
    Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
    Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
54ae10a2a drm/xe: Check skip_guc_pc before setting SLPC flag
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '975e4a3795d4', maybe rebased or not pulled?
#10: 
Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")

-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'bef52b5c7a19', maybe rebased or not pulled?
#11: 
Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")

total: 0 errors, 2 warnings, 0 checks, 22 lines checked


