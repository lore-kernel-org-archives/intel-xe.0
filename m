Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9873FC2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 15:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5354510E427;
	Fri,  7 Aug 2026 15:02:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E87310E427;
 Fri,  7 Aug 2026 15:02:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_Sys?=
 =?utf-8?q?tem_Controller_debugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Aug 2026 15:02:25 -0000
Message-ID: <178611494531.29678.9923719712208069242@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
In-Reply-To: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add System Controller debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/161655/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cb44d410f96f4bfb2bae35dcbf54566cd80a64f8
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Fri Aug 7 07:56:25 2026 -0700

    drm/xe/sysctrl: Add RAS error injection debugfs interface
    
    Add debugfs interface for exercising System Controller's RAS error
    injection command, used to validate RAS error detection and recovery
    paths.
    
    Command details:
    - Group ID: 0x02 (diag group)
    - Command ID: 0x7E (XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT)
    - Usage: echo "<ras_block_id> <ras_sub_block_id> <err_type> [params]" \
                 > /sys/kernel/debug/dri/0/sc/ras_error_inject
             cat /sys/kernel/debug/dri/0/sc/ras_error_inject
    
    This command requires the diag application to have completed firmware
    boot and initialization (late-bind loaded); writes are rejected with
    -ENODEV until xe_sysctrl_is_diag_fw_ready() reports the diag firmware
    as ready.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch 01d30c194951b8794c33f0d7f559bc4a1c9b7630 drm-intel
ceb6566b21b3 drm/xe/sysctrl: Add System Controller get application status
2bc4aa43d021 drm/xe/sysctrl: Add sysctrl debugfs infrastructure
-:55: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#55: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 84 lines checked
e83b5479b7c8 drm/xe/sysctrl: Add loopback test debugfs interface
cb44d410f96f drm/xe/sysctrl: Add RAS error injection debugfs interface


