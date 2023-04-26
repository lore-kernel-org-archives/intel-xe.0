Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF148C77B60
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9017410E1FD;
	Wed, 26 Apr 2023 21:01:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4811510E1FD;
 Wed, 26 Apr 2023 21:01:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4062FAADEB;
 Wed, 26 Apr 2023 21:01:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 26 Apr 2023 21:01:17 -0000
Message-ID: <168254287722.17155.10367717050561463262@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Introduce_xe=5Fdevcoredump=2E?=
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

Series: Introduce xe_devcoredump.
URL   : https://patchwork.freedesktop.org/series/117017/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fd98c167b drm/xe: Limit the system memory size to half of the system memory
=== git am output follows ===
Applying: drm/xe: Fix print of RING_EXECLIST_SQ_CONTENTS_HI
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
Applying: drm/xe: Convert VM print to snapshot capture and print.
Applying: drm/xe: Add VM snapshot to xe_devcoredump.


