Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BC5C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 09:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE5A10E9C5;
	Wed, 15 Mar 2023 09:17:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA7ED10E98B;
 Wed, 15 Mar 2023 09:17:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5D7B5AA3D8;
 Wed, 15 Mar 2023 09:17:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 15 Mar 2023 09:17:39 -0000
Message-ID: <167887185937.19839.15315926087181088542@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230315091740.1580755-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230315091740.1580755-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_LOG_GT_hardware_errors=2E?=
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

Series: LOG GT hardware errors.
URL   : https://patchwork.freedesktop.org/series/115175/
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
Applying: drm/xe/ras: Log the GT hw errors.


