Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F7DC369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 12:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D81110E0A7;
	Thu, 24 Apr 2025 12:08:29 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBBE10E0A7;
 Thu, 24 Apr 2025 12:08:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/guc=3A_Add_LF?=
 =?utf-8?q?D_format_output_for_guc_log_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 12:08:27 -0000
Message-ID: <174549650777.6019.17623638816433071867@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
In-Reply-To: <20250423215821.3078428-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add LFD format output for guc log (rev4)
URL   : https://patchwork.freedesktop.org/series/146541/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6176f7182260 drm-tip: 2025y-04m-24d-12h-05m-09s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add log init config abi definitions
Applying: drm/xe/guc: Add LFD related abi definitions
Applying: drm/xe/guc: Add new debugfs entry for lfd format output
Applying: drm/xe/guc: Add GuC log init config in LFD format
Applying: drm/xe/guc: Add GuC log event buffer output in LFD format
Applying: drm/xe/guc: Only add GuC crash dump if available


