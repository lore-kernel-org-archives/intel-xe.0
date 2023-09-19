Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44812CE79A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F1710E3E8;
	Tue, 19 Sep 2023 16:19:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2BF6110E3C2;
 Tue, 19 Sep 2023 16:19:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 265D6AADF3;
 Tue, 19 Sep 2023 16:19:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Tue, 19 Sep 2023 16:19:18 -0000
Message-ID: <169514035813.3668.8676534742535637920@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Add_OA_functionality_to_Xe_=28rev6=29?=
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

Series: Add OA functionality to Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/121084/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fac2e20c7 Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for non-display paths"
=== git am output follows ===
Applying: drm/xe/uapi: Introduce OA (observability architecture) uapi
Applying: drm/xe/oa: Add OA types
Applying: drm/xe/oa: Add registers and GPU commands used by OA
Applying: drm/xe/oa: Module init/exit and probe/remove
Applying: drm/xe/oa: Add/remove config ioctl's
Applying: drm/xe/oa: Start implementing OA stream open ioctl
Applying: drm/xe/oa: OA stream initialization
Applying: drm/xe/oa: Expose OA stream fd
Applying: drm/xe/oa: Read file_operation
Applying: drm/xe/oa: Implement queries
Applying: drm/xe/oa: Override GuC RC with OA on PVC
Applying: drm/xe/uapi: "Perf" layer to support multiple perf counter stream types
Applying: drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
Applying: drm/xe/uapi: Simplify OA configs in uapi
Applying: drm/xe/uapi: Remove OA format names from OA uapi
Applying: drm/xe/oa: Make xe_oa_timestamp_frequency per gt
Applying: drm/xe/oa: Remove filtering reports on context id
Applying: drm/xe/uapi: More OA uapi fixes/additions
Applying: drm/xe/uapi: Drop OA_IOCTL_VERSION
Applying: drm/xe/uapi: Use OA unit id to identify OA unit
Applying: drm/xe/uapi: Convert OA property key/value pairs to a struct


