Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B131FCD0A6
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 10:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097B910E792;
	Wed, 18 Mar 2026 10:08:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0061B10E032;
 Wed, 18 Mar 2026 10:08:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_=3A_v1=3A_Squash_of_Acces?=
 =?utf-8?q?s_Counter?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Mar 2026 10:08:23 -0000
Message-ID: <177382850398.371170.15798382984716836556@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260318101916.2865689-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260318101916.2865689-1-himal.prasad.ghimiray@intel.com>
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

Series: : v1: Squash of Access Counter
URL   : https://patchwork.freedesktop.org/series/163451/
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
commit 63a8be52bd268825bb1823f9d029787ae6c40a81
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Mar 18 15:49:16 2026 +0530

    v1: Squash of Access Counter
    
    DO NOT REVIEW
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 146a21986f74225d0343edeb925095825fa5474f drm-intel
63a8be52bd26 v1: Squash of Access Counter
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

-:1403: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1403: FILE: drivers/gpu/drm/xe/xe_svm.h:300:
+
+

-:1438: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1438: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:133:
+	    TP_STRUCT__entry(

-:1448: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1448: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:143:
+	    TP_fast_assign(

-:1524: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1524: FILE: drivers/gpu/drm/xe/xe_usm_queue.h:54:
+}
+/**

total: 0 errors, 1 warnings, 4 checks, 1546 lines checked


