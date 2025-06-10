Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7972BC5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 00:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A99210E455;
	Tue, 10 Jun 2025 00:28:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765B110E458;
 Tue, 10 Jun 2025 00:28:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_early_wedge?=
 =?utf-8?q?_on_GuC_load_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 00:28:27 -0000
Message-ID: <174951530746.62161.4906116379539730638@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610002245.1056576-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250610002245.1056576-2-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: Fix early wedge on GuC load failure (rev2)
URL   : https://patchwork.freedesktop.org/series/149906/
State : warning

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
commit 1473f03770b3fa956b9eaf995790a08aced26de4
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Jun 9 17:22:46 2025 -0700

    drm/xe: Fix early wedge on GuC load failure
    
    When the GuC fails to load we declare the device wedged. However, the
    very first GuC load attempt on GT0 (from xe_gt_init_hwconfig) is done
    before the GT1 GuC objects are initialized, so things go bad when the
    wedge code attempts to cleanup GT1. To fix this, check the initialization
    status in the functions called during wedge.
    
    Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
    Requires: 1e1981b16bb1 ("drm/xe: Fix taking invalid lock on wedge")
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Zhanjun Dong <zhanjun.dong@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 52ecbb6a68785860c776b29f58792d9807243979 drm-intel
1473f03770b3 drm/xe: Fix early wedge on GuC load failure
-:13: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 1e1981b16bb1 ("drm/xe: Fix taking invalid lock on wedge")'
#13: 
Requires: 1e1981b16bb1 ("drm/xe: Fix taking invalid lock on wedge")

total: 1 errors, 0 warnings, 0 checks, 59 lines checked


