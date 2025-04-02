Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87395C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 11:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A9910E110;
	Wed,  2 Apr 2025 11:52:29 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307EA10E110;
 Wed,  2 Apr 2025 11:52:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/format-helper=3A_fix_?=
 =?utf-8?q?build?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 11:52:28 -0000
Message-ID: <174359474819.26330.10399426231130051063@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402104430.142398-2-matthew.auld@intel.com>
In-Reply-To: <20250402104430.142398-2-matthew.auld@intel.com>
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

Series: drm/format-helper: fix build
URL   : https://patchwork.freedesktop.org/series/147118/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5fa328607555604bd3127f9bbe07442bbb6635d3
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Apr 2 11:44:31 2025 +0100

    drm/format-helper: fix build
    
    Build fails with:
    
    error: multiple unsequenced modifications to 'sbuf32'
    [-Werror,-Wunsequenced]
      264 |                         le32_to_cpup(sbuf32++),
          |                                            ^
      265 |                         le32_to_cpup(sbuf32++),
          |                                            ~~
    
    With that move the increment of the sbuf32 pointer to the end of the
    loop, instead of inside the array list initializer, where the
    order/sequence of the sbuf32 pointer modifications is not defined.
    
    Fixes: 58523a25cbf7 ("drm/format-helper: Optimize 32-to-24-bpp conversion")
    Fixes: 3f31a017ddbc ("drm/format-helper: Optimize 32-to-16-bpp conversion")
    Fixes: 65931bbc5177 ("drm/format-helper: Optimize 32-to-8-bpp conversion")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Jocelyn Falempe <jfalempe@redhat.com>
    Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch f0fd77956987f035c79d08c812343a27a655a57b drm-intel
5fa328607555 drm/format-helper: fix build


