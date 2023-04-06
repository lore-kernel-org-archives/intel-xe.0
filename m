Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E567C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2310ED38;
	Thu,  6 Apr 2023 20:59:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFED510ED3E;
 Thu,  6 Apr 2023 20:59:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E98BDAADD1;
 Thu,  6 Apr 2023 20:59:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Date: Thu, 06 Apr 2023 20:59:23 -0000
Message-ID: <168081476390.9536.2097579986842347873@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230406204745.272945-1-yu.bruce.chang@intel.com>
In-Reply-To: <20230406204745.272945-1-yu.bruce.chang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_fixup!_drm/xe=3A_fix_pvc_unload_issue?=
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

Series: fixup! drm/xe: fix pvc unload issue
URL   : https://patchwork.freedesktop.org/series/116214/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 77e9a52273eb0385a959d9b74f69edadd3f2aaab
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Wed Apr 5 15:47:25 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Thu Apr 6 13:23:04 2023 -0700

    drm/xe: Always log GuC/HuC firmware versions
    
    When debugging issues related to GuC/HuC, it's important to know what is
    the firmware version being used. The version from the filename can't be
    relied upon, also because it normally only contains the major version
    (except for the ones under experimental support).
    
    Log the version from the blob after reading the CSS header. Example:
    
            xe 0000:03:00.0: [drm] Using GuC firmware (70.5) from i915/dg2_guc_70.bin
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Link: https://lore.kernel.org/r/20230405224725.1993719-1-lucas.demarchi@intel.com
=== git am output follows ===
Applying: fixup! drm/xe: fix pvc unload issue


