Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE46C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 06:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AE510EE1A;
	Tue, 16 Apr 2024 06:03:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA7010EC30;
 Tue, 16 Apr 2024 06:03:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Cleanup_and_fixes_in?=
 =?utf-8?q?_drmm=5Fadd=5Faction=5For=5Freset_usage_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 06:03:34 -0000
Message-ID: <171324741423.1424678.5376377632840140625@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
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

Series: Cleanup and fixes in drmm_add_action_or_reset usage (rev5)
URL   : https://patchwork.freedesktop.org/series/132150/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5f7597e990be drm-tip: 2024y-04m-16d-01h-07m-54s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Simplify function return using drmm_add_action_or_reset()
Applying: drm/xe: Remove sysfs only once on action add failure
Applying: drm/xe: call free_gsc_pkt only once on action add failure
Applying: drm/xe: Return NULL in case of drmm_add_action_or_reset failure
Applying: drm/xe/gt: Abort driver load for sysfs creation failure
Applying: drm/xe/tile: Abort driver load for sysfs creation failure
Applying: drm/xe/pm: Capture errors and handle them


