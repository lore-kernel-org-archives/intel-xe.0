Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF8C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 09:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3B210E4B7;
	Thu,  2 Jul 2026 09:59:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFCD10E4B7;
 Thu,  2 Jul 2026 09:59:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/migrate=3A_Revamp_?=
 =?utf-8?q?PAT_index_selection_for_migrate_PTEs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 09:59:52 -0000
Message-ID: <178298639257.142688.17873596801457617337@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260702092829.206806-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260702092829.206806-2-sanjay.kumar.yadav@intel.com>
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

Series: drm/xe/migrate: Revamp PAT index selection for migrate PTEs (rev4)
URL   : https://patchwork.freedesktop.org/series/154629/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cabf10003505385233c22e2ba72cd6e2035c2561
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Date:   Thu Jul 2 14:58:29 2026 +0530

    drm/xe/migrate: Revamp PAT index selection for migrate PTEs
    
    Improve PAT index selection logic in xe_migrate.c to avoid unnecessary
    coherency overhead when host-side memory is uncached. Previously,
    we defaulted to XE_CACHE_WB, which enforces 2-way coherency and may
    trigger cacheline pulls from CPU even when host-side memory is never
    dirty.
    
    This change introduces xe_migrate_pat_index() to choose the appropriate
    PAT index based on the actual TTM caching mode of the buffer object
    being mapped. For iGPUs with WC host mappings, we now prefer
    XE_CACHE_NONE to skip coherency snoops. For compressed PTEs on newer
    platforms, we select XE_CACHE_NONE_COMPRESSION.
    
    This avoids unnecessary cache traffic for uncached host mappings.
    
    v4:
    - Keep xe_migrate_prepare_vm() on XE_CACHE_WB since page tables require
      page-walker coherency.
    - Pass BO into emit_pte() and select PAT attributes from the BO's TTM
      caching mode.
    
    Assisted-by: GitHub Copilot:claude-sonnet-5
    Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch f36fe20a48c4b20672b7893f3beb142a84048841 drm-intel
cabf10003505 drm/xe/migrate: Revamp PAT index selection for migrate PTEs
-:26: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#26: 
Assisted-by: GitHub Copilot:claude-sonnet-5

total: 0 errors, 1 warnings, 0 checks, 160 lines checked


