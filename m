Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A86C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 12:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD92D892F6;
	Thu,  6 Aug 2026 12:09:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C4F892F6;
 Thu,  6 Aug 2026 12:09:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_fwc?=
 =?utf-8?q?tl_support_for_System_Controller?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 12:09:36 -0000
Message-ID: <178601817692.25208.11645796402446871291@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806120310.2054212-4-anoop.c.vijay@intel.com>
In-Reply-To: <20260806120310.2054212-4-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add fwctl support for System Controller
URL   : https://patchwork.freedesktop.org/series/171728/
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
commit 2fd72f0df0d57872501470d25ac4019f3c401397
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Thu Aug 6 05:03:12 2026 -0700

    drm/xe/sysctrl: Add fwctl support for System Controller
    
    Add fwctl support for Xe System Controller (sysctrl), a
    firmware-managed entity that provides platform-level control and
    coordination on Intel Xe3p discrete GPUs.
    
    Register a XE_SYSCTRL device to allow userspace to query sysctrl
    capabilities and issue RPCs through /dev/fwctl/fwctlN. Initial
    RPCs support ECC status queries and RAS error injection.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch 0c5c2db8c2dc01242496cc2ad63ca8ff787d6a40 drm-intel
0d55485a08bb drm/xe/sysctrl: Add System Controller get application status
2fd72f0df0d5 drm/xe/sysctrl: Add fwctl support for System Controller
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:228: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (0, 0)
#228: FILE: drivers/gpu/drm/xe/xe_sysctrl_fwctl.c:25:
+DEFINE_FREE(xe_sysctrl_fwctl, struct xe_sysctrl_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
[...]
+struct xe_sysctrl_fwctl_uctx {

total: 0 errors, 2 warnings, 0 checks, 645 lines checked


