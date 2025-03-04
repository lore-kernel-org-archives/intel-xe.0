Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8D9C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 17:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEDC10E65C;
	Tue,  4 Mar 2025 17:27:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB22810E65C;
 Tue,  4 Mar 2025 17:27:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Use_MI=5FMATH_to_app?=
 =?utf-8?q?ly_RMW_WA_in_LRC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 17:27:11 -0000
Message-ID: <174110923182.677839.11806210782893345704@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250303173522.1822-1-michal.wajdeczko@intel.com>
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

Series: Use MI_MATH to apply RMW WA in LRC (rev2)
URL   : https://patchwork.freedesktop.org/series/145732/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ff2d693d8872 drm-tip: 2025y-03m-04d-16h-33m-15s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add MI_LOAD_REGISTER_REG command definition
Applying: drm/xe: Add MI_MATH and ALU instruction definitions
Applying: drm/xe: Avoid reading RMW registers in emit_wa_job
Applying: drm/xe/vf: Stop applying save-restore MMIOs if VF
Applying: drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs


