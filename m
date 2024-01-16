Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988E4C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 23:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6435010E62B;
	Tue, 16 Jan 2024 23:19:03 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316BD10E622;
 Tue, 16 Jan 2024 23:19:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe/guc=3A_Extrac?=
 =?utf-8?q?t_GuC_error_capture_lists_on_G2H_notification?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Tue, 16 Jan 2024 23:19:02 -0000
Message-ID: <170544714219.519235.17218883996590266333@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116231600.154097-1-zhanjun.dong@intel.com>
In-Reply-To: <20240116231600.154097-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Extract GuC error capture lists on G2H notification
URL   : https://patchwork.freedesktop.org/series/128854/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b6b50ad4c drm-tip: 2024y-01m-16d-17h-54m-51s UTC integration manifest
=== git am output follows ===
error: drivers/gpu/drm/xe/xe_guc_capture.c: does not exist in index
error: drivers/gpu/drm/xe/xe_guc_capture.h: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/guc: Update GuC ADS size for error capture
Patch failed at 0001 drm/xe/guc: Update GuC ADS size for error capture
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


