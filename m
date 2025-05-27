Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00923C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 13:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26A510E4D7;
	Tue, 27 May 2025 13:04:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BCD10E4D7;
 Tue, 27 May 2025 13:04:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe/svm=3A_Avoid_duplicate_eviction_on_get=5Fpages=28=29?=
 =?utf-8?q?_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 13:04:32 -0000
Message-ID: <174835107293.24233.1318228187812023082@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
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

Series: series starting with [1/1] drm/xe/svm: Avoid duplicate eviction on get_pages() failure
URL   : https://patchwork.freedesktop.org/series/149506/
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
commit 8918e80cc69468dfdbd321eb8612f8f4066bbd63
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon May 26 22:09:07 2025 +0530

    drm/xe/svm: Avoid duplicate eviction on get_pages() failure
    
    xe_svm_range_get_pages() already calls drm_gpusvm_range_evict()
    internally when it fails with -EOPNOTSUPP. Remove the redundant eviction
    call in the caller to prevent duplicate handling.
    
    Fixes: e0ff0d7cf928 ("drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 994b4d24e5526a8b1efca4ca25a3a3be47a886e5 drm-intel
8918e80cc694 drm/xe/svm: Avoid duplicate eviction on get_pages() failure


