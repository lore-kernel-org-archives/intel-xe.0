Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB38C47422
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA6410E09F;
	Fri, 19 Jan 2024 00:55:40 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9896110E08E;
 Fri, 19 Jan 2024 00:55:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/guc=3A_Add_Gu?=
 =?utf-8?q?C_based_register_capture_for_error_capture_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Fri, 19 Jan 2024 00:55:38 -0000
Message-ID: <170562573862.558567.4714546408676843563@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119004203.393262-1-zhanjun.dong@intel.com>
In-Reply-To: <20240119004203.393262-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev2)
URL   : https://patchwork.freedesktop.org/series/128077/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ed982e1f2 drm-tip: 2024y-01m-18d-23h-31m-18s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add register defines for GuC based register capture
Applying: drm/xe/guc: Expose dss per group for GuC error capture
Applying: drm/xe/guc: Update GuC ADS size for error capture
Applying: drm/xe/guc: Add XE_LP steered register lists
Applying: drm/xe/guc: Add capture size check in GuC log buffer
Applying: drm/xe/guc: Check sizing of guc_capture output
Applying: drm/xe/guc: Extract GuC error capture lists on G2H notification
Applying: drm/xe/guc: Pre-allocate output nodes for extraction
Applying: drm/xe/guc: Plumb GuC-capture into dev coredump


