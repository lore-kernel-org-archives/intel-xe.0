Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C77C76188
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 01:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6918D10E2B7;
	Tue,  4 Apr 2023 01:44:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF83610E2B7;
 Tue,  4 Apr 2023 01:44:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D5F73AADE4;
 Tue,  4 Apr 2023 01:44:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 04 Apr 2023 01:44:26 -0000
Message-ID: <168057266685.18898.229203325984279240@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230404014228.3738347-1-matthew.brost@intel.com>
In-Reply-To: <20230404014228.3738347-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Port_Xe_to_use_GPUVA_and_implement_NULL_VM_binds_=28rev5=29?=
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

Series: Port Xe to use GPUVA and implement NULL VM binds (rev5)
URL   : https://patchwork.freedesktop.org/series/115217/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 63b79d536e96e045be4f6c63947c7d42e8dbf600
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Fri Mar 31 16:09:02 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Mon Apr 3 13:41:08 2023 -0700

    drm/xe: Fix platform order
    
    Platform order in enum xe_platform started to be used by some parts of
    the code, like the GuC/HuC firmware loading logic. The order itself is
    not very important, but it's better to follow a convention: as was
    documented in the comment above the enum, reorder the platforms by
    graphics version. While at it, remove the gen terminology.
    
    v2:
      - Use "graphics version" instead of chronological order (Matt Roper)
      - Also change pciidlist to follow the same order
      - Remove "gen" from comments around enum xe_platform
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Link: https://lore.kernel.org/r/20230331230902.1603294-1-lucas.demarchi@intel.com
=== git am output follows ===
Applying: maple_tree: split up MA_STATE() macro
Applying: maple_tree: Export mas_preallocate
Applying: drm: manager to keep track of GPUs VA mappings
Applying: drm/xe: Port Xe to GPUVA
Applying: drm/xe: NULL binding implementation
Applying: drm/xe: Avoid doing rebinds
Applying: drm/xe: Reduce the number list links in xe_vma
Applying: drm/xe: Optimize size of xe_vma allocation


