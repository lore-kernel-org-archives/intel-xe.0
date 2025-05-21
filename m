Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AD1C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 11:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465A8112025;
	Wed, 21 May 2025 11:20:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69DF112023;
 Wed, 21 May 2025 11:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/svm=3A_Fix_regress?=
 =?utf-8?q?ion_disallowing_64K_SVM_migration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 11:20:08 -0000
Message-ID: <174782640886.9279.15785911984349871814@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250521090102.2965100-1-dev@lankhorst.se>
In-Reply-To: <20250521090102.2965100-1-dev@lankhorst.se>
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

Series: drm/xe/svm: Fix regression disallowing 64K SVM migration
URL   : https://patchwork.freedesktop.org/series/149309/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 805476b2843d9db44a9a194d30ea779a28f4560d
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed May 21 11:01:02 2025 +0200

    drm/xe/svm: Fix regression disallowing 64K SVM migration
    
    When changing the condition from >= SZ_64K, it was changed to <= SZ_64K.
    This disallows migration of 64K, which is the exact minimum allowed.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5057
    Fixes: a9ac0fa455b0 ("drm/xe: Strict migration policy for atomic SVM faults")
    Cc: stable@vger.kernel.org
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 72b5b862a7983153a866cc84cbcafdab8aaf3bf9 drm-intel
805476b2843d drm/xe/svm: Fix regression disallowing 64K SVM migration


