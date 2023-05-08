Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9E4C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFAE10E038;
	Mon,  8 May 2023 21:11:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 503C310E038;
 Mon,  8 May 2023 21:11:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 474F5AADEA;
 Mon,  8 May 2023 21:11:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Mon, 08 May 2023 21:11:10 -0000
Message-ID: <168358027028.22734.12746338732113787337@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5Bv3=2C01/11=5D_drm/xe=3A_Introduce_th?=
 =?utf-8?q?e_dev=5Fcoredump_infrastructure=2E?=
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

Series: series starting with [v3,01/11] drm/xe: Introduce the dev_coredump infrastructure.
URL   : https://patchwork.freedesktop.org/series/117473/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 6d1561872 drm/xe: Print GT info on TLB inv failure
=== git am output follows ===
Applying: drm/xe: Introduce the dev_coredump infrastructure.
Applying: drm/xe: Do not take any action if our device was removed.
Applying: drm/xe: Extract non mapped regions out of GuC CTB into its own struct.
Applying: drm/xe: Convert GuC CT print to snapshot capture and print.
Applying: drm/xe: Add GuC CT snapshot to xe_devcoredump.
Applying: drm/xe: Introduce guc_submit_types.h with relevant structs.
Applying: drm/xe: Convert GuC Engine print to snapshot capture and print.
Applying: drm/xe: Add GuC Submit Engine snapshot to xe_devcoredump.
Applying: drm/xe: Convert Xe HW Engine print to snapshot capture and print.
Applying: drm/xe: Add HW Engine snapshot to xe_devcoredump.
Applying: drm/xe: Limit CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.


