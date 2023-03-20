Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C90C7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 08:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E788F10E247;
	Mon, 20 Mar 2023 08:15:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C59E310E23D;
 Mon, 20 Mar 2023 08:15:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AEECFAA3D8;
 Mon, 20 Mar 2023 08:15:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Mon, 20 Mar 2023 08:15:57 -0000
Message-ID: <167930015768.26307.3671051329035959799@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230320081257.1788039-1-francois.dugast@intel.com>
In-Reply-To: <20230320081257.1788039-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Split_code_between_common_and_platform_specific_=28rev4=29?=
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

Series: Split code between common and platform specific (rev4)
URL   : https://patchwork.freedesktop.org/series/114630/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 2664e8ea1914beb122f30c56f3f54bc423b1364d
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Fri Mar 17 15:34:41 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Fri Mar 17 21:31:13 2023 -0700

    drm/xe/mcr: Separate version from engine type selection
    
    In order to improve readability and make it more future proof,
    split the engine type from the graphics/platform checks.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Link: https://lore.kernel.org/r/20230317223441.3891073-1-lucas.demarchi@intel.com
=== git am output follows ===
Applying: drm/xe: Introduce function pointers in xe_gt.c with local structure
Applying: drm/xe: Introduce function pointers in xe_guc_pc.c with local structure
Applying: drm/xe: Add platform specific functions for a new platform


