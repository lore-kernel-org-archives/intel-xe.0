Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEC5C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 13:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C510E2AA;
	Tue, 27 Feb 2024 13:17:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91BF10E2AA;
 Tue, 27 Feb 2024 13:17:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv3=2C1/3=5D_=60drm/xe=3A_Move_lrc_snapshot_capturing_to_xe=5F?=
 =?utf-8?q?lrc=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 13:17:42 -0000
Message-ID: <170903986295.337360.605465457462957134@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [v3,1/3] `drm/xe: Move lrc snapshot capturing to xe_lrc.c
URL   : https://patchwork.freedesktop.org/series/130434/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ed7aa4acb76b drm-tip: 2024y-02m-27d-12h-51m-14s UTC integration manifest
=== git am output follows ===
Applying: `drm/xe: Move lrc snapshot capturing to xe_lrc.c
Applying: drm/xe: Add infrastructure for delayed LRC capture
Applying: drm/xe: Implement capture of HWSP and HWCTX


