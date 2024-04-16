Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD81C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 00:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C2D112911;
	Tue, 16 Apr 2024 00:58:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EC6112911;
 Tue, 16 Apr 2024 00:58:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv6=2C1/4=5D_drm/xe/lrc=3A_Add_xe_lrc_ring_tail_function_defin?=
 =?utf-8?q?itions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 00:58:37 -0000
Message-ID: <171322911710.1424598.13449190232381239671@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
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

Series: series starting with [v6,1/4] drm/xe/lrc: Add xe lrc ring tail function definitions
URL   : https://patchwork.freedesktop.org/series/132471/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7bc330055f5c drm-tip: 2024y-04m-15d-20h-48m-49s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/lrc: Add xe lrc ring tail function definitions
Applying: drm/xe/xe_guc_submit: Fix exec queue stop race condition
Applying: drm/xe/xe_guc_submit: Allow lr exec queues to be banned
Applying: drm/xe/xe_guc_submit: Declare reset if banned or killed


