Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD569C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 17:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2A410E025;
	Thu, 24 Apr 2025 17:45:35 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0510E025;
 Thu, 24 Apr 2025 17:45:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Replace_xe=5Fhmm_wit?=
 =?utf-8?q?h_gpusvm_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 17:45:34 -0000
Message-ID: <174551673447.7603.14629145035087428263@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424121827.862729-9-matthew.auld@intel.com>
In-Reply-To: <20250424121827.862729-9-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm (rev3)
URL   : https://patchwork.freedesktop.org/series/146553/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6176f7182260 drm-tip: 2025y-04m-24d-12h-05m-09s UTC integration manifest
=== git am output follows ===
Applying: drm/gpusvm: fix hmm_pfn_to_map_order() usage
Applying: drm/gpusvm: use more selective dma dir in get_pages()
Applying: drm/gpusvm: pull out drm_gpusvm_pages substructure
Applying: drm/gpusvm: refactor core API to use pages struct
Applying: drm/gpusvm: export drm_gpusvm_pages API
Applying: drm/xe/userptr: replace xe_hmm with gpusvm
Applying: drm/xe/pt: unify xe_pt_svm_pre_commit with userptr


