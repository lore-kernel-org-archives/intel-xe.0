Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB7CC47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8E010F198;
	Wed, 31 Jan 2024 20:03:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01ED10FCC7;
 Wed, 31 Jan 2024 20:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/2=5D_drm/xe=3A_add_a_new_debugfs_file_-_mmio?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Wed, 31 Jan 2024 20:03:28 -0000
Message-ID: <170673140885.878359.8616234778974933931@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240131195953.852641-1-kelbaz@habana.ai>
In-Reply-To: <20240131195953.852641-1-kelbaz@habana.ai>
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

Series: series starting with [v6,1/2] drm/xe: add a new debugfs file - mmio
URL   : https://patchwork.freedesktop.org/series/129383/
State : warning

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
commit fd6e6f30064d174a0a11b4103d045f181d505ee8
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Wed Jan 31 21:59:53 2024 +0200

    drm/xe: restore xe_mmio_ioctl as the ioctl handler of the mmio debugfs file
    
    The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
    and therefore, recently removed.
    Nevertheless, it is now restored for debugging purposes to function
    as the ioctl handler of the 'mmio' debugfs file.
    Note, that the non-admin user's limited mmio access (aka, whitelist),
    was removed being irrelevant anymore, now that a user using debugfs
    must anyway have root permission to use it.
    
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
+ /mt/dim checkpatch 8327dc2a5a26f82a8700035c6259f57e9299d6a2 drm-intel
248274590 drm/xe: add a new debugfs file - mmio
fd6e6f300 drm/xe: restore xe_mmio_ioctl as the ioctl handler of the mmio debugfs file
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:154: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#154: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 173 lines checked


