Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3FCC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 20:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1954B10E15C;
	Thu, 15 Feb 2024 20:05:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E35B10E15C;
 Thu, 15 Feb 2024 20:05:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B0?=
 =?utf-8?q?1/14=5D_drm/xe=3A_Document_Xe_PM_component?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 20:05:03 -0000
Message-ID: <170802750331.925.2612118867394356770@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/129970/
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
commit aaee5ca327b76110bf1c46a053177c4287f368cb
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Feb 15 14:34:30 2024 -0500

    drm/xe: Remove useless mem_access on PAT dumps
    
    PAT dumps are already protected by the xe_pm_runtime_{get,put}
    around the debugfs call. So, these can be removed.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 6d3abf8f7f55420cf53e9ed344872c459ecfd0ed drm-intel
b58c30d39 drm/xe: Document Xe PM component
85900407f drm/xe: Convert mem_access assertion towards the runtime_pm state
a65d23c1a drm/xe: Runtime PM wake on every IOCTL
bb2209c14 drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
8adfa4bf2 drm/xe: Runtime PM wake on every sysfs call
58747853e drm/xe: Remove mem_access from guc_pc calls
c9fb1a10c drm/xe: Runtime PM wake on every debugfs call
e5ae8b381 drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
526c07039 drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
6e1ee37ec drm/xe: Remove useless mem_access protection for query ioctls
285e7835b drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
ca6090351 drm/xe: Remove mem_access from suspend and resume functions
8b7624f0a drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
aaee5ca32 drm/xe: Remove useless mem_access on PAT dumps


