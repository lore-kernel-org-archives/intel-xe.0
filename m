Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D2DC76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 23:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454B10E0B9;
	Thu,  6 Apr 2023 23:59:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7706510E0B9;
 Thu,  6 Apr 2023 23:59:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 39CCBA02F0;
 Thu,  6 Apr 2023 23:59:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 06 Apr 2023 23:59:28 -0000
Message-ID: <168082556819.9536.14246172402580714142@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
In-Reply-To: <20230406235621.1914492-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Begin_adding_GMD=5FID_support_for_Xe_=28rev4=29?=
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

Series: Begin adding GMD_ID support for Xe (rev4)
URL   : https://patchwork.freedesktop.org/series/116047/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit afd9d46bd231a3884adeacd6b8afb6791ca20ac1
Author:     Chang, Bruce <yu.bruce.chang@intel.com>
AuthorDate: Thu Apr 6 20:30:13 2023 +0000
Commit:     Chang, Bruce <yu.bruce.chang@intel.com>
CommitDate: Thu Apr 6 21:01:28 2023 +0000

    fixup! drm/xe: fix pvc unload issue
    
    fixed include file orders
    added last empty line
    fixed copyright year
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
=== git am output follows ===
.git/rebase-apply/patch:154: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Start splitting xe_device_desc into graphics/media structures
Applying: drm/xe: Set require_force_probe in each platform's description
Applying: drm/xe: Move most platform traits to graphics IP
Applying: drm/xe: Move engine masks into IP descriptor structures
Applying: drm/xe: Clarify GT counting logic
Applying: drm/xe: Add printable name to IP descriptors
Applying: drm/xe: Select graphics/media descriptors from GMD_ID
Applying: drm/xe: Add KUnit test for xe_pci.c IP engine lists
Applying: drm/xe: Clean up xe_device_desc


