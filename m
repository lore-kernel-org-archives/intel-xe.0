Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F6AC4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 13:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B715610F9DB;
	Mon,  5 Feb 2024 13:43:15 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085FE10F9D8;
 Mon,  5 Feb 2024 13:43:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Declare_=5F=5Fx?=
 =?utf-8?q?e=5Flrc=5F*=5Fggtt=5Faddr_with_=5F=5Fmaybe=5F=5Funused?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dawei Li" <dawei.li@shingroup.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 13:43:15 -0000
Message-ID: <170714059503.1024297.13225562830268818684@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240204062324.3548268-1-dawei.li@shingroup.cn>
In-Reply-To: <20240204062324.3548268-1-dawei.li@shingroup.cn>
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

Series: drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused
URL   : https://patchwork.freedesktop.org/series/129541/
State : success

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
commit 529af3bf93f212c782d3d41d92b6badc563a05a9
Author: Dawei Li <dawei.li@shingroup.cn>
Date:   Sun Feb 4 14:23:24 2024 +0800

    drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused
    
    Kernel test robot reports building error:
    
    drivers/gpu/drm/xe/xe_lrc.c:544:1: error: unused function
    '__xe_lrc_regs_ggtt_addr' [-Werror,-Wunused-function]
    544 | DECL_MAP_ADDR_HELPERS(regs)
        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    drivers/gpu/drm/xe/xe_lrc.c:536:19: note: expanded from macro
    'DECL_MAP_ADDR_HELPERS'
    536 | static inline u32 __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    <scratch space>:54:1: note: expanded from here
    54 | __xe_lrc_regs_ggtt_addr
       | ^~~~~~~~~~~~~~~~~~~~~~~
    
    1 error generated.
    
    Declare __xe_lrc_*_ggtt_addr with __maybe_unused to address it.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202402010928.g3j2aSBL-lkp@intel.com/
    Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
+ /mt/dim checkpatch 89404d6657779870d0d97f80a267f75a36c6744b drm-intel
529af3bf9 drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused


