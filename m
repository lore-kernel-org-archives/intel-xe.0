Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED464CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 18:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A522610E9B9;
	Wed, 10 Sep 2025 18:38:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290D810E9B9;
 Wed, 10 Sep 2025 18:38:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fdevice=5Fsysf?=
 =?utf-8?q?s=3A_add_cleanup_action_in_xe=5Fdevice=5Fsysfs=5Finit_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Sep 2025 18:38:05 -0000
Message-ID: <175752948516.322800.840940948935943519@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
In-Reply-To: <20250910183233.3971054-1-zongyao.bai@intel.com>
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

Series: drm/xe/xe_device_sysfs: add cleanup action in xe_device_sysfs_init (rev2)
URL   : https://patchwork.freedesktop.org/series/154116/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a93fa4eca4f144c5661b760d8e1ccb7cc07f0a2
Author: Zongyao Bai <zongyao.bai@intel.com>
Date:   Thu Sep 11 02:32:33 2025 +0800

    drm/xe/xe_device_sysfs: add cleanup action in xe_device_sysfs_init
    
    xe_device_sysfs_fini(): switch the order of late_bind_remove_files
    and sysfs_remove_files to follow the rule that files create latest
    deleted first.(LIFO)
    
    xe_device_sysfs_init(): on partial failure, any sysfs files created
    before the failure will be cleaned up via xe_device_sysfs_fini,
    ensuring no leaked sysfs entries
    Add function description comments for xe_device_sysfs_init().
    
    v2:
    - Refine code using "goto cleanup" to reduced code duplication and
      improve clarity and scalability. (Stuart)
    
    - Change remove order in late_bind_remove_files(). (Stuart)
    
    - In xe_device_sysfs_fini() and late_bind_remove_files(), cancle the
      capable, platform and pcode/runtime check. And just remove in reverse
      order of creation(LIFO). sysfs_remove_file is safe even the attribute
      doesn't exist, so it avoids extra overhead or error paths during cleanup.
    
    Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
    Fixes: cdc36b66cd41 (drm/xe: Expose fan control and voltage regulator version)
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
+ /mt/dim checkpatch f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac drm-intel
9a93fa4eca4f drm/xe/xe_device_sysfs: add cleanup action in xe_device_sysfs_init
-:22: WARNING:TYPO_SPELLING: 'cancle' may be misspelled - perhaps 'cancel'?
#22: 
- In xe_device_sysfs_fini() and late_bind_remove_files(), cancle the
                                                          ^^^^^^

-:28: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")'
#28: 
Fixes: cdc36b66cd41 (drm/xe: Expose fan control and voltage regulator version)

-:62: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#62: FILE: drivers/gpu/drm/xe/xe_device_sysfs.c:188:
+	/* Remove in reverse order of creation (LIFO).
+	* Avoid querying pcode/runtime pm here — sysfs_remove_file is safe

total: 0 errors, 3 warnings, 0 checks, 86 lines checked


