Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C97FC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 02:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE7D10E5BF;
	Thu, 21 Mar 2024 02:27:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C0E10E5BF;
 Thu, 21 Mar 2024 02:27:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Change_userptr_so_it?=
 =?utf-8?q?_can_be_unified_with_hmmptr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 02:27:01 -0000
Message-ID: <171098802189.938557.4503012043684751222@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321022939.2279979-1-oak.zeng@intel.com>
In-Reply-To: <20240321022939.2279979-1-oak.zeng@intel.com>
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

Series: Change userptr so it can be unified with hmmptr
URL   : https://patchwork.freedesktop.org/series/131398/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b82909921086 drm-tip: 2024y-03m-20d-21h-42m-28s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:264: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Introduce helper to populate userptr
Applying: drm/xe: Introduce a helper to free sg table
Applying: drm/xe: Use hmm_range_fault to populate user pages
Applying: drm/xe: destroy userptr vma on UNMAP event


