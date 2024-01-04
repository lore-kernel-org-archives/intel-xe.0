Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7E5C4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 05:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7986510E38C;
	Thu,  4 Jan 2024 05:43:09 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334DB10E38C;
 Thu,  4 Jan 2024 05:43:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Introduce_Relay_Comm?=
 =?utf-8?q?unication_for_SR-IOV?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 04 Jan 2024 05:43:08 -0000
Message-ID: <170434698817.1840.4006243914968287238@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231227235838.212-1-michal.wajdeczko@intel.com>
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

Series: Introduce Relay Communication for SR-IOV
URL   : https://patchwork.freedesktop.org/series/128042/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7b3b98d03 drm/xe/xe2: Add workaround 16020183090
=== git am output follows ===
Applying: drm/xe: Allocate dedicated workqueue for SR-IOV workers
Applying: drm/xe: Define Virtual Function Identifier
Applying: drm/xe: Introduce GT-oriented SR-IOV logging macros
Applying: drm/xe/guc: Add helpers for HXG messages
Applying: drm/xe/guc: Update few GuC CTB ABI definitions
Applying: drm/xe/guc: Add Relay Communication ABI definitions
Applying: drm/xe/guc: Introduce Relay Communication for SR-IOV
Applying: drm/xe/kunit: Allow to replace xe_guc_ct_send_recv() with stub
Applying: drm/xe/kunit: Add GuC Relay kunit tests
Applying: drm/xe/guc: Start handling GuC Relay event messages


