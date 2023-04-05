Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E07C77B6C
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 21:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B3410E262;
	Wed,  5 Apr 2023 21:51:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50EC810EA3E;
 Wed,  5 Apr 2023 21:51:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3873BAADDD;
 Wed,  5 Apr 2023 21:51:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 05 Apr 2023 21:51:23 -0000
Message-ID: <168073148319.14695.1896723542054908649@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405195205.1674844-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230405195205.1674844-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/doc/rfc=3A_Introduce_the_merge_plan_for_the_Xe_driver=2E?=
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

Series: drm/doc/rfc: Introduce the merge plan for the Xe driver.
URL   : https://patchwork.freedesktop.org/series/116169/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 69fe222d7918949d37a95fce4aa834a129789535
Author:     Chang, Bruce <yu.bruce.chang@intel.com>
AuthorDate: Wed Apr 5 17:13:03 2023 +0000
Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
CommitDate: Wed Apr 5 13:23:15 2023 -0400

    fixup! drm/xe: fix pvc unload issue
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
=== git am output follows ===
Applying: drm/doc/rfc: Introduce the merge plan for the Xe driver.


