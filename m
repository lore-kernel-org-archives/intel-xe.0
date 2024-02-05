Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5D9C4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 23:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBCF1124A0;
	Mon,  5 Feb 2024 23:20:01 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C861124A0;
 Mon,  5 Feb 2024 23:20:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Assume_large_pa?=
 =?utf-8?q?ge_size_if_VMA_not_yet_bound?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 23:20:00 -0000
Message-ID: <170717520067.1024443.13553000807666857855@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240205231714.2956225-1-matthew.brost@intel.com>
In-Reply-To: <20240205231714.2956225-1-matthew.brost@intel.com>
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

Series: drm/xe: Assume large page size if VMA not yet bound
URL   : https://patchwork.freedesktop.org/series/129555/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bd387794a488843968f23bcbab3641b425ce9f47
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Feb 5 15:17:14 2024 -0800

    drm/xe: Assume large page size if VMA not yet bound
    
    The calculation to determine max page size of a VMA during a REMAP
    operations assumes the VMA has been bound. This assumption is not true
    if the VMA is from an eariler operation in an array of binds. If a VMA
    has not been bound use the maximum page size which will ensure the
    previous / next REMAP operations are not incorrectly skipped.
    
    Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b71b753a5041cf8869006840c7577c3bac01d1cd drm-intel
bd387794a drm/xe: Assume large page size if VMA not yet bound
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8f33b4f054fc', maybe rebased or not pulled?
#12: 
Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


