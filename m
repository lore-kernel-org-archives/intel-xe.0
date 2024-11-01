Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE98E67491
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 06:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD5610E1BB;
	Fri,  1 Nov 2024 06:33:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B7F10E1BB;
 Fri,  1 Nov 2024 06:33:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Use_trans_push_mecha?=
 =?utf-8?q?nism_to_generate_frame_change_event_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Nov 2024 06:33:39 -0000
Message-ID: <173044281933.1386901.17520731053462890929@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241101062728.3865980-1-jouni.hogander@intel.com>
In-Reply-To: <20241101062728.3865980-1-jouni.hogander@intel.com>
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

Series: Use trans push mechanism to generate frame change event (rev2)
URL   : https://patchwork.freedesktop.org/series/139831/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 73837e0500d4 drm-tip: 2024y-11m-01d-05h-17m-37s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/psr: Add TRANS_PUSH register bit definition for PSR
Applying: drm/i915/vrr: Do not overwrite TRANS_PUSH PSR Frame Change Enable
Applying: drm/i915/vrr: Use TRANS_PUSH mechanism for PSR frame change
Applying: drm/i915/psr: Rename psr_force_hw_tracking_exit as psr_force_exit
Applying: drm/i915/psr: Simplify frontbuffer invalidate/flush callbacks
Applying: drm/i915/psr: Add VRR send push interface for PSR usage
Applying: drm/i915/display: Generate PSR frame change event on cursor update


