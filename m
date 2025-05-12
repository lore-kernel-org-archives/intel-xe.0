Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F97C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6F410E46A;
	Mon, 12 May 2025 16:27:03 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E811710E1C3;
 Mon, 12 May 2025 16:27:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Replace_xe=5Fhmm_wit?=
 =?utf-8?q?h_gpusvm_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 16:27:01 -0000
Message-ID: <174706722195.70786.1409360275154101998@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512150637.61462-10-matthew.auld@intel.com>
In-Reply-To: <20250512150637.61462-10-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm (rev4)
URL   : https://patchwork.freedesktop.org/series/146553/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f3767db51c5d drm-tip: 2025y-05m-12d-14h-06m-28s UTC integration manifest
=== git am output follows ===
Applying: drm/gpusvm: fix hmm_pfn_to_map_order() usage
Applying: drm/gpusvm: use more selective dma dir in get_pages()
Applying: drm/gpusvm: pull out drm_gpusvm_pages substructure
Applying: drm/gpusvm: refactor core API to use pages struct
Applying: drm/gpusvm: export drm_gpusvm_pages API
Applying: drm/xe/vm: split userptr bits into separate file
Applying: drm/xe/userptr: replace xe_hmm with gpusvm
Applying: drm/xe/pt: unify xe_pt_svm_pre_commit with userptr


