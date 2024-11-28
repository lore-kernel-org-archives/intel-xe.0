Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33648D6D25F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 04:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC00810E776;
	Thu, 28 Nov 2024 04:05:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E5410EC14;
 Thu, 28 Nov 2024 04:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vm=5Fdoc=3A_fix_mo?=
 =?utf-8?q?re_doc_typos?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Nov 2024 04:05:49 -0000
Message-ID: <173276674942.3968974.13379086957949936008@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128035901.375399-1-rdunlap@infradead.org>
In-Reply-To: <20241128035901.375399-1-rdunlap@infradead.org>
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

Series: drm/xe/vm_doc: fix more doc typos
URL   : https://patchwork.freedesktop.org/series/141863/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 070f8d586adcdf77bd6b1aaed1c8f4d603286ac0
Author: Randy Dunlap <rdunlap@infradead.org>
Date:   Wed Nov 27 19:58:59 2024 -0800

    drm/xe/vm_doc: fix more doc typos
    
    Fix all typos in xe_vm_doc.h as reported by codespell.
    
    Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: dri-devel@lists.freedesktop.org
+ /mt/dim checkpatch 2a09bda868b896bc2a88a3a902e493063ce9e021 drm-intel
070f8d586adc drm/xe/vm_doc: fix more doc typos


