Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61A6C25B75
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 10:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AAD10E645;
	Mon, 13 May 2024 10:52:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C425610E636;
 Mon, 13 May 2024 10:52:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/fbc=3A_Add_sizes?=
 =?utf-8?q?_to_info_message_about_reducing_fb_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paul Menzel" <pmenzel@molgen.mpg.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 May 2024 10:52:42 -0000
Message-ID: <171559756280.2095032.3719309150802857920@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240513103652.371721-1-pmenzel@molgen.mpg.de>
In-Reply-To: <20240513103652.371721-1-pmenzel@molgen.mpg.de>
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

Series: drm/i915/fbc: Add sizes to info message about reducing fb size
URL   : https://patchwork.freedesktop.org/series/133532/
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
commit 0d4a4e7cab7820299a5147ef2198ea86717c564f
Author: Paul Menzel <pmenzel@molgen.mpg.de>
Date:   Mon May 13 12:36:51 2024 +0200

    drm/i915/fbc: Add sizes to info message about reducing fb size
    
    The info message currently does not contain any information, how much
    the stolen memory size should be increased.
    
        [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
    
    To be more useful to the user, add the sizes to the message.
    
    Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
+ /mt/dim checkpatch 64f1f664cc724aeac5f4f9bad3645febaec41135 drm-intel
0d4a4e7cab78 drm/i915/fbc: Add sizes to info message about reducing fb size
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
    [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


