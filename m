Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8CDC624B4
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 19:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83B510E339;
	Thu, 23 Nov 2023 19:07:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E01BD10E339;
 Thu, 23 Nov 2023 19:07:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DCD46A02F0;
 Thu, 23 Nov 2023 19:07:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 23 Nov 2023 19:07:06 -0000
Message-ID: <170076642690.8136.5102851190230288381@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231123180605.112597-1-jose.souza@intel.com>
In-Reply-To: <20231123180605.112597-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_devcoredump=3A_Add_dev=5Fcoredump?=
 =?utf-8?b?X3B1dCgp?=
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

Series: series starting with [1/2] devcoredump: Add dev_coredump_put()
URL   : https://patchwork.freedesktop.org/series/126837/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e8a146af55aa9f0321a9b09b0c42104af3026b42
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Nov 23 10:06:05 2023 -0800

    drm/xe: Remove devcoredump during driver release
    
    This will remove devcoredump and its resources during driver release.
    This fix the driver unload after a engine happend, without this
    it would report that xe.ko is still in use.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 1832821c7e4c5bd24353183f060f1435b2eb7992 drm-intel
1aa28757a devcoredump: Add dev_coredump_put()
-:66: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#66: FILE: include/linux/devcoredump.h:90:
 }
+static inline void dev_coredump_put(struct device *dev)

total: 0 errors, 0 warnings, 1 checks, 44 lines checked
e8a146af5 drm/xe: Remove devcoredump during driver release
-:10: WARNING:TYPO_SPELLING: 'happend' may be misspelled - perhaps 'happened'?
#10: 
This fix the driver unload after a engine happend, without this
                                          ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 54 lines checked


