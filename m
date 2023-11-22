Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D67C61D85
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 01:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B4A10E5CD;
	Wed, 22 Nov 2023 01:12:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB2B210E5CD;
 Wed, 22 Nov 2023 01:12:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B7A24AADD8;
 Wed, 22 Nov 2023 01:12:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Wed, 22 Nov 2023 01:12:32 -0000
Message-ID: <170061555274.4725.3761787043061337052@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120185700.3304104-1-david.kershner@intel.com>
In-Reply-To: <20231120185700.3304104-1-david.kershner@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_support_for_XeLink_device_=28rev2=29?=
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

Series: Add support for XeLink device (rev2)
URL   : https://patchwork.freedesktop.org/series/122168/
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
commit 369c6386dd46e2f0446fe6f6e7ffe20410548135
Author: David Kershner <david.kershner@intel.com>
Date:   Mon Nov 20 13:57:00 2023 -0500

    drm/xe/uapi: Augment query ioctl to allow for fabric
    
    UMDs need to understand if two devices have connectivity, and what
    that connectivity is.
    
    Add to the query_ioctl the ability to determine if a fabric id and
    current device have connectivity.
    
    Signed-off-by: David Kershner <david.kershner@intel.com>
+ /mt/dim checkpatch 89e2bb1e155242dd9aa46bc90e563e71c5f498b0 drm-intel
44056a6dd drm/xe: Introduce XeLink device
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:294: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#294: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 871 lines checked
19672d28f drm/xe: Teach Xe how to use objects with XeLink connectivity
-:504: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#504: FILE: drivers/gpu/drm/xe/xe_trace.h:112:
+		    TP_STRUCT__entry(

-:511: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#511: FILE: drivers/gpu/drm/xe/xe_trace.h:119:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 486 lines checked
369c6386d drm/xe/uapi: Augment query ioctl to allow for fabric


