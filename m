Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59486C4167B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A6010E325;
	Sun, 10 Dec 2023 18:04:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBFB410E036;
 Sun, 10 Dec 2023 18:04:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B869DAA917;
 Sun, 10 Dec 2023 18:04:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_add_a_new_debugfs_file_-_mmio?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Sun, 10 Dec 2023 18:04:18 -0000
Message-ID: <170223145875.19107.15701939989291699620@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231210180142.691057-1-kelbaz@habana.ai>
In-Reply-To: <20231210180142.691057-1-kelbaz@habana.ai>
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

Series: series starting with [1/2] drm/xe: add a new debugfs file - mmio
URL   : https://patchwork.freedesktop.org/series/127606/
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
commit e122ff58507a6dc439ed35cb4b2862e650c8d8e9
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Sun Dec 10 20:01:42 2023 +0200

    drm/xe: restore xe_mmio_ioctl as the ioctl handler of the mmio debugfs file
    
    The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
    and therefore, recently removed.
    Nevertheless, it is now restored for debugging purposes to function
    as the ioctl handler of the 'mmio' debugfs file.
    
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
+ /mt/dim checkpatch 1fc141d1f445b8e5ab4ff14645b0482dd98460b9 drm-intel
2782eeddc drm/xe: add a new debugfs file - mmio
e122ff585 drm/xe: restore xe_mmio_ioctl as the ioctl handler of the mmio debugfs file
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:141: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#141: FILE: drivers/gpu/drm/xe/xe_debugfs.c:211:
+		ret = copy_from_user(&mmio_data, (struct xe_debugfs_mmio_ioctl_data __user *)arg,
+				sizeof(mmio_data));

-:150: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#150: FILE: drivers/gpu/drm/xe/xe_debugfs.c:220:
+		ret = copy_to_user((struct xe_debugfs_mmio_ioctl_data __user *)arg,
+				&mmio_data, sizeof(mmio_data));

-:161: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#161: 
new file mode 100644

-:208: CHECK:LINE_SPACING: Please don't use multiple blank lines
#208: FILE: drivers/gpu/drm/xe/xe_debugfs_mmio.h:43:
+
+

total: 0 errors, 1 warnings, 3 checks, 184 lines checked


