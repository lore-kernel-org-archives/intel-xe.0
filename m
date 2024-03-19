Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06F4C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 04:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9488A10E62D;
	Tue, 19 Mar 2024 04:09:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3948110E62D;
 Tue, 19 Mar 2024 04:09:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Use_hmm=5Frange=5Ffa?=
 =?utf-8?q?ult_to_populate_user_page_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 04:09:20 -0000
Message-ID: <171082136023.900422.17825817305793354568@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319025511.1598354-1-oak.zeng@intel.com>
In-Reply-To: <20240319025511.1598354-1-oak.zeng@intel.com>
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

Series: Use hmm_range_fault to populate user page (rev2)
URL   : https://patchwork.freedesktop.org/series/131117/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e8f2ef9ff548 drm-tip: 2024y-03m-19d-00h-29m-37s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:182: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:257: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe/svm: Remap and provide memmap backing for GPU vram
Applying: drm/xe/svm: Add DRM_XE_SVM kernel config entry
Applying: drm/xe: Helper to get tile from memory region
Applying: drm/xe: Introduce a helper to get dpa from pfn
Applying: drm/xe/svm: Get xe memory region from page
Applying: drm/xe: Helper to populate a userptr or hmmptr
Applying: drm/xe: Introduce a helper to free sg table
Applying: drm/xe: Use hmm_range_fault to populate user pages


