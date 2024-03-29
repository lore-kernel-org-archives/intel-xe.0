Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFA1CD1283
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 19:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3651D112846;
	Fri, 29 Mar 2024 19:11:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B1F11284B;
 Fri, 29 Mar 2024 19:11:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/3=5D_drm/xe/xe=5Fguc=5Fsubmit=3A_Fix_exec_queue_stop_race_c?=
 =?utf-8?q?ondition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 19:11:00 -0000
Message-ID: <171173946034.1081852.10240036680750347430@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
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

Series: series starting with [1/3] drm/xe/xe_guc_submit: Fix exec queue stop race condition
URL   : https://patchwork.freedesktop.org/series/131824/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 15fe5f853b06 drm-tip: 2024y-03m-29d-16h-14m-37s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/xe_guc_submit: Fix exec queue stop race condition
Applying: drm/xe/xe_guc_status: Allow lr exec queues to be banned
Applying: drm/xe/xe_guc_submit: Declare reset if banned or killed


