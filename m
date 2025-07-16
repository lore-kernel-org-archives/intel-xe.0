Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBBDC83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 21:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469A510E3C7;
	Wed, 16 Jul 2025 21:05:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99ED710E3C7;
 Wed, 16 Jul 2025 21:05:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_psmi_suppor?=
 =?utf-8?q?t?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Jul 2025 21:05:57 -0000
Message-ID: <175269995762.168226.3341263553824235897@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250716-psmi-v1-0-674c13d7028e@intel.com>
In-Reply-To: <20250716-psmi-v1-0-674c13d7028e@intel.com>
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

Series: drm/xe: Add psmi support
URL   : https://patchwork.freedesktop.org/series/151729/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dfe52f85cf07675a200d28eb0f5491f219ace703
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Jul 16 13:55:47 2025 -0700

    drm/xe/psmi: Add Wa_16023683509
    
    This WA ensures GuC will restore the media MCFG registers at C6
    exit.
    
    Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e7058b7a607f5fdfd7bc4586644756d7ef002331 drm-intel
73742b19d957 drm/xe/psmi: Add setting of PSMI feature flag
aadd54083c6e drm/xe/psmi: Add debugfs interface for allocation of PSMI capture buffers
-:120: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#120: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 369 lines checked
6e47433d5511 drm/xe/psmi: Enable GuC Wa_14020001231
-:34: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#34: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:387:
+					GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT,

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
dfe52f85cf07 drm/xe/psmi: Add Wa_16023683509
-:35: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#35: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:106:
+#define   GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6 ^IBIT(25)$

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


