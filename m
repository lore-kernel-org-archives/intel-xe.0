Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2713AC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ABD10E1D3;
	Fri,  7 Jun 2024 18:37:36 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A77810E1D3;
 Fri,  7 Jun 2024 18:37:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Tracing_cleanup_and_?=
 =?utf-8?q?add_mmio_tracing_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 18:37:35 -0000
Message-ID: <171778545523.28075.17842816716417890736@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
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

Series: Tracing cleanup and add mmio tracing (rev4)
URL   : https://patchwork.freedesktop.org/series/134258/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 29955874be9f drm-tip: 2024y-06m-07d-16h-17m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/trace: Extract bo, vm, vma traces
Applying: drm/xe/trace: Extract guc related traces
Applying: drm/xe/trace: Print device_id in xe_trace_bo events
Applying: drm/xe/trace: Print device_id in xe_trace_guc events
Applying: drm/xe/trace: Print device_id in xe_trace events
Applying: drm/xe: Add reg read/write trace


