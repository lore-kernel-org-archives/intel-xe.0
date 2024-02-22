Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9377C54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E31D10E9B4;
	Thu, 22 Feb 2024 16:46:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA4310E9B4;
 Thu, 22 Feb 2024 16:46:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B0?=
 =?utf-8?q?1/14=5D_drm/xe=3A_Document_Xe_PM_component?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 16:46:19 -0000
Message-ID: <170862037977.217031.4030170100851766663@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
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

Series: series starting with [01/14] drm/xe: Document Xe PM component
URL   : https://patchwork.freedesktop.org/series/130270/
State : success

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
commit 583a6fd6b31f02cd49f25dcd095c04b49535d10a
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Feb 22 11:39:37 2024 -0500

    drm/xe: Remove useless mem_access on PAT dumps
    
    PAT dumps are already protected by the xe_pm_runtime_{get,put}
    around the debugfs call. So, these can be removed.
    
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch ae1e283133b83b0de46f00b0ac0bca913e159216 drm-intel
607b41daa5da drm/xe: Document Xe PM component
266fc8cb934c drm/xe: Convert mem_access assertion towards the runtime_pm state
4012c9f62633 drm/xe: Runtime PM wake on every IOCTL
e860c4ec7103 drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
c786f93031be drm/xe: Runtime PM wake on every sysfs call
5fa04afe2111 drm/xe: Remove mem_access from guc_pc calls
ee8c1a8197cf drm/xe: Runtime PM wake on every debugfs call
71a72abf0d6e drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
2d481ed59f74 drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
1a0bf638412a drm/xe: Remove useless mem_access protection for query ioctls
553660f81f46 drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
8564e2b24e87 drm/xe: Remove mem_access from suspend and resume functions
8185cfee4ad2 drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
583a6fd6b31f drm/xe: Remove useless mem_access on PAT dumps


