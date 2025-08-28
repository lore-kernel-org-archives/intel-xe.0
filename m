Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DCACA0EFF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 03:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FEB10E171;
	Thu, 28 Aug 2025 03:00:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD43C10E171;
 Thu, 28 Aug 2025 03:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_user_comman?=
 =?utf-8?q?ds_to_WA_BB_via_configfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 03:00:07 -0000
Message-ID: <175635000776.275917.15310776477489907382@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
In-Reply-To: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
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

Series: drm/xe: Add user commands to WA BB via configfs (rev2)
URL   : https://patchwork.freedesktop.org/series/153594/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 133568e6f92501c6b7cc8352679a3a50fe3b8f51
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Aug 27 15:35:31 2025 -0700

    drm/xe/configfs: Add post context restore bb
    
    Allow the user to specify commands to execute during a context restore.
    Currently it's possible to parse 2 types of actions:
    
            - cmd: the instructions are added as is to the bb
            - reg: just use the address and value, without worrying about
              encoding the right LRI instruction. This is possibly the most
              useful use case, so added a dedicated action for that.
    
    This also serve as preparation for future BBs: mid context restore and
    rc6 context restore that can re-use the same parsing functions.
    
    The bin attribute from configfs is used here to allow multi-line input.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch f6f3d6ae1615f7ca0e414fb0766ab17eac65ae7c drm-intel
929e860c08c8 drm/xe/configfs: Extract function to parse engine
e8b024b6a436 drm/xe/configfs: Allow to select by class only
af233b4957f4 drm/xe: Update workaround documentation
993f464a9927 drm/xe/configfs: Fix documentation warning
e0d2f9c99828 drm/xe/lrc: Allow to add user commands on context switch
-:62: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#62: FILE: drivers/gpu/drm/xe/xe_configfs.h:33:
+static u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+					       const u32 **cs) { return 0; }

total: 1 errors, 0 warnings, 0 checks, 86 lines checked
133568e6f925 drm/xe/configfs: Add post context restore bb


