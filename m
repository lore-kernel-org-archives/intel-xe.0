Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9430AC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 08:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712D110E951;
	Wed, 15 Mar 2023 08:18:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDC4E10E969;
 Wed, 15 Mar 2023 08:18:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C4736ACC20;
 Wed, 15 Mar 2023 08:18:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Date: Wed, 15 Mar 2023 08:18:23 -0000
Message-ID: <167886830380.19840.10631413953089041933@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230315081500.608346-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20230315081500.608346-1-balasubramani.vivekanandan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Skip_XY=5FFAST=5FCOLOR_instruction_on_link_copy_en?=
 =?utf-8?q?gines_=28rev4=29?=
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

Series: drm/xe: Skip XY_FAST_COLOR instruction on link copy engines (rev4)
URL   : https://patchwork.freedesktop.org/series/114751/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 7bad0b6678a74e882ecb8f76b25741024d7a1389
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Mon Mar 13 14:16:28 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Tue Mar 14 17:57:34 2023 -0700

    drm/xe: Replace i915 with xe in uapi
    
    All structs and defines had already been renamed to "xe", but some
    comments with "i915" were left over. Rename them.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Link: https://lore.kernel.org/r/20230313211628.2492587-1-lucas.demarchi@intel.com
=== git am output follows ===
Applying: drm/xe: Skip XY_FAST_COLOR instruction on link copy engines
Applying: drm/xe/tests: Adapt migrate_sanity_test for link copy engines


