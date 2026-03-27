Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A535610F2846
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 16:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605A410EECF;
	Fri, 27 Mar 2026 16:04:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2873D10EEFF;
 Fri, 27 Mar 2026 16:04:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Document_GT_sta?=
 =?utf-8?q?tistics?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 16:04:00 -0000
Message-ID: <177462744013.407613.4694836823097516517@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327155817.201865-1-francois.dugast@intel.com>
In-Reply-To: <20260327155817.201865-1-francois.dugast@intel.com>
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

Series: drm/xe: Document GT statistics
URL   : https://patchwork.freedesktop.org/series/164005/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1e04f5c220dc1523a594d5385c7bd2c7ca291e9b
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Mar 27 16:58:17 2026 +0100

    drm/xe: Document GT statistics
    
    In the context of porting applications to SVM, the Xe GT statistics are
    used by application developers to validate expected behavior such as
    proper alignment, page fault count and migrations. As those statistics
    are made for kernel developers, they assume good understanding of driver
    internals, which is not always the case on the application side.
    Therefore, this commit documents the usage of GT statistics and clarifies
    the meaning of identifiers which correspond to the values exposed via
    debugfs. Documentation is close to identifiers declaration to make it
    easier to maintain when adding new entries in the future.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 5df2c727c885d0f1132911a88aadf584b5306f00 drm-intel
1e04f5c220dc drm/xe: Document GT statistics
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 1 errors, 2 warnings, 0 checks, 186 lines checked


