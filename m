Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4201EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 02:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632CD10E0A9;
	Tue,  8 Aug 2023 02:04:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A43610E0A9;
 Tue,  8 Aug 2023 02:04:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 755B0AADF0;
 Tue,  8 Aug 2023 02:04:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Tue, 08 Aug 2023 02:04:33 -0000
Message-ID: <169146027347.13859.15030905350581452651@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230808013159.38811-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Add_OA_functionality_to_Xe_=28rev3=29?=
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

Series: Add OA functionality to Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/121084/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 229aa5f07 fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
=== git am output follows ===
Applying: drm/xe/oa: Introduce OA uapi
Applying: drm/xe/oa: Add OA types
Applying: drm/xe/oa: Add registers and GPU commands used by OA
Applying: drm/xe/oa: Module init/exit and probe/remove
Applying: drm/xe/oa: Add/remove config ioctl's
Applying: drm/xe/oa: Start implementing OA stream open ioctl
Applying: drm/xe/oa: OA stream initialization
Applying: drm/xe/oa: Expose OA stream fd
Applying: drm/xe/oa: Read file_operation
Applying: drm/xe/oa: Implement queries


