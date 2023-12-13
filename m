Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12738C4167D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 21:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AEF10E86F;
	Wed, 13 Dec 2023 21:48:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C48B10E861;
 Wed, 13 Dec 2023 21:48:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 091E6A0169;
 Wed, 13 Dec 2023 21:48:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_XeLink_de?=
 =?utf-8?q?vice_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Wed, 13 Dec 2023 21:48:21 -0000
Message-ID: <170250410103.10263.6790158823934225056@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231213214525.2584729-1-david.kershner@intel.com>
In-Reply-To: <20231213214525.2584729-1-david.kershner@intel.com>
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

Series: Add support for XeLink device (rev5)
URL   : https://patchwork.freedesktop.org/series/122168/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8133771ee6f4132f0886868908a36a300a237e19
Author: David Kershner <david.kershner@intel.com>
Date:   Wed Dec 13 16:45:25 2023 -0500

    drm/xe/uapi: Augment query ioctl to allow for fabric
    
    UMDs need to understand if two devices have connectivity, and what
    that connectivity is.
    
    Add to the query_ioctl the ability to determine if a fabric id and
    current device have connectivity.
    
    Signed-off-by: David Kershner <david.kershner@intel.com>
+ /mt/dim checkpatch 5cd1893366708380854f4694ae57417192458a6b drm-intel
840e8369f drm/xe: Introduce XeLink device
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
d0a86534b drm/xe: Teach Xe how to use objects with XeLink connectivity
-:503: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#503: FILE: drivers/gpu/drm/xe/xe_trace.h:112:
+		    TP_STRUCT__entry(

-:510: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#510: FILE: drivers/gpu/drm/xe/xe_trace.h:119:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 485 lines checked
8133771ee drm/xe/uapi: Augment query ioctl to allow for fabric


