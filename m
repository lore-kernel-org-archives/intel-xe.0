Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F60EB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 18:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C6710E0C6;
	Thu, 15 Jun 2023 18:28:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F0CB010E0C6;
 Thu, 15 Jun 2023 18:28:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EE746AADE0;
 Thu, 15 Jun 2023 18:28:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 15 Jun 2023 18:28:38 -0000
Message-ID: <168685371897.10727.8048132597487944236@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230615181840.76075-1-matthew.auld@intel.com>
In-Reply-To: <20230615181840.76075-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/bo=3A_handle_PL=5FTT_-=3E_PL=5FTT?=
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

Series: drm/xe/bo: handle PL_TT -> PL_TT
URL   : https://patchwork.freedesktop.org/series/119400/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec9a9303b36a6a25f42054ce3ef2cbe7caf5ee11
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Jun 15 19:18:40 2023 +0100

    drm/xe/bo: handle PL_TT -> PL_TT
    
    When moving between PL_VRAM <-> PL_SYSTEM we have to have use PL_TT in
    the middle as a temporary resource for the actual copy. In some GL
    workloads it can be seen that once the resource has been moved to the
    PL_TT we might have to bail out of the ttm_bo_validate(), before
    finishing the final hop. If this happens the resource is left as
    TTM_PL_FLAG_TEMPORARY, and when the ttm_bo_validate() is restarted the
    current placement is always seen as incompatible, requiring us to
    complete the move.  However if the BO allows PL_TT as a possible
    placement we can end up attempting a PL_TT -> PL_TT move (like when
    running out of VRAM) which leads to explosions in xe_bo_move(), like
    triggering the XE_BUG_ON(!tile).
    
    Going from TTM_PL_FLAG_TEMPORARY with PL_TT -> PL_VRAM should already
    work as-is, so it looks like we only need to worry about PL_TT -> PL_TT
    and it looks like we can just treat it as a dummy move, since no real
    move is needed.
    
    Reported-by: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 6d2981d42cd891965094ec7d173203520cfa36f7 drm-intel
ec9a9303b drm/xe/bo: handle PL_TT -> PL_TT
-:26: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Link: with a URL to the report
#26: 
Reported-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


