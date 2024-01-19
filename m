Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99836C47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 13:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D1110E9F9;
	Fri, 19 Jan 2024 13:01:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA2610E9F9;
 Fri, 19 Jan 2024 13:01:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fdebugfs=3A_Pr?=
 =?utf-8?q?int_skip=5Fguc=5Fpc_in_xe_info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Fri, 19 Jan 2024 13:01:29 -0000
Message-ID: <170566928932.592636.16363491924170157188@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119131025.1872947-1-badal.nilawar@intel.com>
In-Reply-To: <20240119131025.1872947-1-badal.nilawar@intel.com>
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

Series: drm/xe/xe_debugfs: Print skip_guc_pc in xe info
URL   : https://patchwork.freedesktop.org/series/128980/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 26dccd5a3b1a84f39c0770f70aff45b2d1ac0d60
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Fri Jan 19 18:40:25 2024 +0530

    drm/xe/xe_debugfs: Print skip_guc_pc in xe info
    
    Print xe->info.skip_guc_pc in xe info
    
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 873aee20af09054189670092b2d6fe03824777b5 drm-intel
26dccd5a3 drm/xe/xe_debugfs: Print skip_guc_pc in xe info


