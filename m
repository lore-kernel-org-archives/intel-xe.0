Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380CEC25B79
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 17:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E675310E2F2;
	Wed, 15 May 2024 17:12:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E2710E1BE;
 Wed, 15 May 2024 17:12:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_add_mmio_debugf?=
 =?utf-8?q?s_file_=26_restore_xe=5Fmmio=5Fioctl_as_its_ioctl_handler_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 17:12:12 -0000
Message-ID: <171579313298.2118792.16643459117788337201@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515165244.156194-1-kelbaz@habana.ai>
In-Reply-To: <20240515165244.156194-1-kelbaz@habana.ai>
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

Series: drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler (rev2)
URL   : https://patchwork.freedesktop.org/series/133505/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit be91b9b05abd7e052549bb3b85265152da6f7854
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Wed May 15 19:52:44 2024 +0300

    drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler
    
    The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
    and therefore, recently removed.
    Nevertheless, it is now restored for debugging purposes as an
    ioctl handler for a newly added 'mmio' debugfs file.
    
    Notes:
    1. The non-admin user's limited mmio access (aka, whitelist),
    was removed being irrelevant anymore, now that a user using debugfs
    must anyway have root permissions to use it.
    2. To support multi-tile access, the tile index is now dynamic and
    will be retrieved from the given mmio address itself.
    
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ofir Bitton <obitton@habana.ai>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
+ /mt/dim checkpatch 26a52a7b24c1f334d92f5deac9f3eaf3224f3864 drm-intel
be91b9b05abd drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:237: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#237: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 242 lines checked


