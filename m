Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1659CF07B5
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 06:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD3A10E879;
	Thu, 10 Oct 2024 06:53:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1710E879;
 Thu, 10 Oct 2024 06:53:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Use_trans_push_mecha?=
 =?utf-8?q?nism_to_generate_frame_change_event?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 06:53:26 -0000
Message-ID: <172854320612.1214013.12788339195872397967@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010053316.1580527-1-jouni.hogander@intel.com>
In-Reply-To: <20241010053316.1580527-1-jouni.hogander@intel.com>
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

Series: Use trans push mechanism to generate frame change event
URL   : https://patchwork.freedesktop.org/series/139831/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e1aba2bf4f79 drm-tip: 2024y-10m-09d-20h-21m-55s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_cursor.c:910
error: drivers/gpu/drm/i915/display/intel_cursor.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/psr: Add TRANS_PUSH register bit definition for PSR
Applying: drm/i915/vrr: Do not overwrite TRANS_PUSH PSR Frame Change Enable
Applying: drm/i915/vrr: Use TRANS_PUSH mechanism for PSR frame change
Applying: drm/i915/psr: Rename psr_force_hw_tracking_exit as psr_force_exit
Applying: drm/i915/psr: Simplify frontbuffer invalidate/flush callbacks
Applying: drm/i915/psr: Add VRR send push interface for PSR usage
Applying: drm/i915/display: Generate PSR frame change event on cursor update
Patch failed at 0007 drm/i915/display: Generate PSR frame change event on cursor update
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


