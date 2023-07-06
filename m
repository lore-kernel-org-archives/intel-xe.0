Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85BFEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 18:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCDF10E0CA;
	Thu,  6 Jul 2023 18:43:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B3BA10E0CA;
 Thu,  6 Jul 2023 18:43:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 02196AADFA;
 Thu,  6 Jul 2023 18:43:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 06 Jul 2023 18:43:34 -0000
Message-ID: <168866901497.18976.9633597087733962779@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230706162003.427026-12-matthew.auld@intel.com>
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Try_to_handle_TLB_invalidations_from_CT_fast-path_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Try to handle TLB invalidations from CT fast-path (rev3)
URL   : https://patchwork.freedesktop.org/series/120174/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: abcb88850 drm/xe: make kobject type struct as constant
=== git am output follows ===
Applying: drm/xe/tlb: drop unnecessary smp_wmb()
Applying: drm/xe/tlb: ensure we access seqno_recv once
Applying: drm/xe: hold mem_access.ref for CT fast-path
Applying: drm/xe/ct: hold fast_lock when reserving space for g2h
Applying: drm/xe/tlb: increment next seqno after successful CT send
Applying: drm/xe/ct: serialise fast_lock during CT disable
Applying: drm/xe/gt: tweak placement for signalling TLB fences after GT reset
Applying: drm/xe/tlb: also update seqno_recv during reset
Applying: drm/xe: handle TLB invalidations from CT fast-path
Applying: drm/xe/tlb: print seqno_recv on fence TLB timeout


