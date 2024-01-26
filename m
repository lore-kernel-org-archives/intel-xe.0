Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBFAC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 22:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57A810FF1C;
	Fri, 26 Jan 2024 22:09:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9F610FF1D;
 Fri, 26 Jan 2024 22:09:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Grab_mem=5Facce?=
 =?utf-8?q?ss_when_disabling_C6_on_skip=5Fguc=5Fpc_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 26 Jan 2024 22:09:34 -0000
Message-ID: <170630697431.764817.2055868185656502305@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126220613.865939-2-matthew.d.roper@intel.com>
In-Reply-To: <20240126220613.865939-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms
URL   : https://patchwork.freedesktop.org/series/129221/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ef2158f8ff0a27be499af36c3ead551e40df32eb
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Jan 26 14:06:14 2024 -0800

    drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms
    
    If skip_guc_pc is set for a platform, C6 is disabled directly without
    acquiring a mem_access reference, triggering an assertion inside
    xe_gt_idle_disable_c6.
    
    Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch eeedb1b4360b100e4fa15a9c5c968a8f5a8de7ed drm-intel
ef2158f8f drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '975e4a3795d4', maybe rebased or not pulled?
#11: 
Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


