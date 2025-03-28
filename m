Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7365CC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 20:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF9C10EAC2;
	Fri, 28 Mar 2025 20:46:52 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D8410EAC2;
 Fri, 28 Mar 2025 20:46:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Replace_xe=5Fhmm_wit?=
 =?utf-8?q?h_gpusvm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 20:46:51 -0000
Message-ID: <174319481129.17146.3571149704069342000@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328181028.288312-9-matthew.auld@intel.com>
In-Reply-To: <20250328181028.288312-9-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm (rev2)
URL   : https://patchwork.freedesktop.org/series/146553/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b8a000ee8dbf drm-tip: 2025y-03m-28d-19h-59m-23s UTC integration manifest
=== git am output follows ===
Applying: drm/gpusvm: fix hmm_pfn_to_map_order() usage
Applying: drm/gpusvm: use more selective dma dir in get_pages()
Applying: drm/gpusvm: pull out drm_gpusvm_pages substructure
Applying: drm/gpusvm: refactor core API to use pages struct
Applying: drm/gpusvm: export drm_gpusvm_pages API
Applying: drm/xe/userptr: replace xe_hmm with gpusvm
Applying: drm/xe/pt: unify xe_pt_svm_pre_commit with userptr


