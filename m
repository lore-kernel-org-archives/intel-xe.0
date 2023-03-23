Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C35C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 03:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC08710E42E;
	Thu, 23 Mar 2023 03:00:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D863F10E43B;
 Thu, 23 Mar 2023 03:00:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D08CBA0BA8;
 Thu, 23 Mar 2023 03:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 23 Mar 2023 03:00:34 -0000
Message-ID: <167954043482.6628.18304204058281630667@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230323025801.822678-1-matthew.brost@intel.com>
In-Reply-To: <20230323025801.822678-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Proposal_for_engine_query_uAPI_=28rev3=29?=
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

Series: Proposal for engine query uAPI (rev3)
URL   : https://patchwork.freedesktop.org/series/115477/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit e6f9b3b9a18f2ec7b3aea2bbc7160ef5387dc878
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Tue Mar 21 18:16:47 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Wed Mar 22 12:42:12 2023 -0700

    drm/xe: Reinstate render / compute cache invalidation in ring ops
    
    Render / compute engines have additional caches (not just TLBs) that
    need to be invalidated each batch, reinstate these invalidations in ring
    ops.
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
=== git am output follows ===
Applying: drm/xe/uapi: Use hw prefix for hardware engines
Applying: drm/xe/uapi: Add query engines uAPI


