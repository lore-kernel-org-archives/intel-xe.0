Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AD0C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 15:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87A010E02A;
	Tue, 16 May 2023 15:15:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C101F10E02A;
 Tue, 16 May 2023 15:15:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7501BACC22;
 Tue, 16 May 2023 15:15:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 16 May 2023 15:15:16 -0000
Message-ID: <168425011644.14223.9617800861402353198@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5Bv4=2C01/11=5D_drm/xe=3A_Introduce_th?=
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

Series: series starting with [v4,01/11] drm/xe: Introduce the dev_coredump infrastructure.
URL   : https://patchwork.freedesktop.org/series/117821/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 9e6366d33 drm/i915/gt: drop dependency on VLV_DISPLAY_BASE
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


