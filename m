Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88798EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 16:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35910E5E2;
	Thu, 20 Jul 2023 16:47:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1712710E5E2;
 Thu, 20 Jul 2023 16:47:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 10495A0093;
 Thu, 20 Jul 2023 16:47:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 20 Jul 2023 16:47:53 -0000
Message-ID: <168987167306.20753.3763694301157272082@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230720155546.199766-1-matthew.brost@intel.com>
In-Reply-To: <20230720155546.199766-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_More_VM_cleanups_=28rev4=29?=
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

Series: More VM cleanups (rev4)
URL   : https://patchwork.freedesktop.org/series/120574/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 9cca38d11 drm/xe: Make bind engines safe
=== git am output follows ===
Applying: drm/xe: Remove xe_vma_op_unmap
Applying: drm/xe: Avoid doing rebinds
Applying: drm/xe: Reduce the number list links in xe_vma
Applying: drm/xe: Replace list_del_init with list_del for userptr.invalidate_link cleanup
Applying: drm/xe: Change tile masks from u64 to u8
Applying: drm/xe: Combine destroy_cb and destroy_work in xe_vma into union
Applying: drm/xe: Only alloc userptr part of xe_vma for userptrs


