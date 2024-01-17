Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA306C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 21:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AE310E867;
	Wed, 17 Jan 2024 21:37:39 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1141610E879;
 Wed, 17 Jan 2024 21:37:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_correct_the_cal?=
 =?utf-8?q?culation_of_remaining_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Date: Wed, 17 Jan 2024 21:37:38 -0000
Message-ID: <170552745805.537692.12387587777366004757@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116195251.651321-1-fei.yang@intel.com>
In-Reply-To: <20240116195251.651321-1-fei.yang@intel.com>
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

Series: drm/xe: correct the calculation of remaining size
URL   : https://patchwork.freedesktop.org/series/128844/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit faa257594f90e3056b10efd15f2f90105fad937b
Author: Fei Yang <fei.yang@intel.com>
Date:   Tue Jan 16 11:52:51 2024 -0800

    drm/xe: correct the calculation of remaining size
    
    In function write_pgtable, the calculation of chunk in the do-while
    loop is wrong, we should always compare against remaining size instead
    of the total size update->qwords.
    Also, when performing dword writes, dword length can be any value
    from 2 to 3fe, always adding 1 is wrong.
    
    Signed-off-by: Fei Yang <fei.yang@intel.com>
+ /mt/dim checkpatch 6002d529f9fe420895d407e481d39b19b58ec001 drm-intel
faa257594 drm/xe: correct the calculation of remaining size
-:23: ERROR:SPACING: spaces required around that '?' (ctx:VxW)
#23: FILE: drivers/gpu/drm/xe/instructions/xe_mi_commands.h:39:
+#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x > 1)? x : 2)
                           		                                     ^

-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#23: FILE: drivers/gpu/drm/xe/instructions/xe_mi_commands.h:39:
+#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x > 1)? x : 2)

-:23: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#23: FILE: drivers/gpu/drm/xe/instructions/xe_mi_commands.h:39:
+#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x > 1)? x : 2)

total: 1 errors, 0 warnings, 2 checks, 16 lines checked


