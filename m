Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0915C54F7B
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 14:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1DD10EF84;
	Tue, 19 Mar 2024 14:41:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736310EF84;
 Tue, 19 Mar 2024 14:41:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/guc=3A_Add_Gu?=
 =?utf-8?q?C_based_register_capture_for_error_capture_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 14:41:33 -0000
Message-ID: <171085929335.902947.4026266384089586629@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
In-Reply-To: <20240319143621.371087-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev5)
URL   : https://patchwork.freedesktop.org/series/128077/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a62a45162bdd drm-tip: 2024y-03m-19d-13h-35m-58s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add kconfig for GuC based register capture
Applying: drm/xe/guc: Update GuC ADS size for error capture
Applying: drm/xe/guc: Add XE_LP steered register lists
Applying: drm/xe/guc: Add capture size check in GuC log buffer
Applying: drm/xe/guc: Check sizing of guc_capture output
Applying: drm/xe/guc: Extract GuC error capture lists on G2H notification
Applying: drm/xe/guc: Pre-allocate output nodes for extraction
Applying: drm/xe/guc: Plumb GuC-capture into dev coredump


