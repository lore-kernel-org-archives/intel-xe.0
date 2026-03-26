Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A213109E52B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 01:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D069510E167;
	Thu, 26 Mar 2026 01:17:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4C810E167;
 Thu, 26 Mar 2026 01:17:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Issue_GGTT_inva?=
 =?utf-8?q?lidation_under_lock_in_ggtt=5Fnode=5Fremove?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Mar 2026 01:17:45 -0000
Message-ID: <177448786567.399091.11015192262011654929@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326011207.62373-1-matthew.brost@intel.com>
In-Reply-To: <20260326011207.62373-1-matthew.brost@intel.com>
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

Series: drm/xe: Issue GGTT invalidation under lock in ggtt_node_remove
URL   : https://patchwork.freedesktop.org/series/163883/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5a5729c44b4cc07998df88c6cda03bd5e65ed1d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Mar 25 18:12:07 2026 -0700

    drm/xe: Issue GGTT invalidation under lock in ggtt_node_remove
    
    Async work (e.g., GuC queue teardowns) can call ggtt_node_remove, so the
    operation must be performed under the GGTT lock to ensure the GGTT
    online check remains stable. GGTT insertion and removal are heavyweight
    operations (e.g., queue create/destroy), so the additional serialization
    cost is negligible compared to ensuring correctness.
    
    Fixes: 4f3a998a173b ("drm/xe: Open-code GGTT MMIO access protection")
    Signed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3239a1a0a30dea3fe135700010ee4e41841877bc drm-intel
a5a5729c44b4 drm/xe: Issue GGTT invalidation under lock in ggtt_node_remove
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Signed-by:
#14: 
Signed-by: Matthew Brost <matthew.brost@intel.com>

-:37: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 17 lines checked


