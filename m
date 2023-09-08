Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671CEEEB570
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9710E94A;
	Fri,  8 Sep 2023 20:36:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 65BA810E94B;
 Fri,  8 Sep 2023 20:36:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6132AAADE0;
 Fri,  8 Sep 2023 20:36:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Sep 2023 20:36:21 -0000
Message-ID: <169420538136.14897.16019384955921016326@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230908203302.449041-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Some_uapi_alignment_in_response_to_the_uapi_review?=
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

Series: Some uapi alignment in response to the uapi review
URL   : https://patchwork.freedesktop.org/series/123463/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 92bbb0596 drm/xe/uapi: Remove useless max_page_size
=== git am output follows ===
Applying: drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
Applying: drm/xe/uapi: Document drm_xe_query_gt.
Applying: drm/xe/uapi: Replace useless 'instance' per unique gt_id.
Applying: drm/xe/uapi: Remove unused field of drm_xe_query_gt
Applying: drm/xe/uapi: Rename gts to gt_list.


