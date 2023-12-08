Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52666C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 09:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D1210EA37;
	Fri,  8 Dec 2023 09:22:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E908510EA34;
 Fri,  8 Dec 2023 09:22:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E0F9DAA917;
 Fri,  8 Dec 2023 09:22:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Add_OA_functionality?=
 =?utf-8?q?_to_Xe_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Fri, 08 Dec 2023 09:22:28 -0000
Message-ID: <170202734890.7324.491909971307129171@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Series: Add OA functionality to Xe (rev7)
URL   : https://patchwork.freedesktop.org/series/121084/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: c4235ef53 fixup! drm/xe/display: Implement display support
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_device_types.h:15
error: drivers/gpu/drm/xe/xe_device_types.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
Applying: drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
Applying: drm/xe/oa/uapi: Add oa_max_sample_rate sysctl
Applying: drm/xe/oa/uapi: Add OA data formats
Patch failed at 0004 drm/xe/oa/uapi: Add OA data formats
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


