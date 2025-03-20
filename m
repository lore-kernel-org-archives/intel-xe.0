Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D406C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 17:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0600C10E65F;
	Thu, 20 Mar 2025 17:37:43 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B6510E65F;
 Thu, 20 Mar 2025 17:37:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Replace_xe=5Fhmm_wit?=
 =?utf-8?q?h_gpusvm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 17:37:41 -0000
Message-ID: <174249226121.59394.6940211651197948770@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320172956.168358-9-matthew.auld@intel.com>
In-Reply-To: <20250320172956.168358-9-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm
URL   : https://patchwork.freedesktop.org/series/146553/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1f934e6cad9a drm-tip: 2025y-03m-20d-16h-26m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/gpusvm: fix hmm_pfn_to_map_order() usage
Applying: drm/gpusvm: use more selective dma dir in get_pages()
Applying: drm/gpusvm: mark pages as dirty
Applying: drm/gpusvm: pull out drm_gpusvm_pages substructure
Applying: drm/gpusvm: lower get/unmap pages
Applying: drm/gpusvm: support basic_range
Applying: drm/xe/userptr: replace xe_hmm with gpusvm


