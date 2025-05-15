Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3572C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 10:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B36010E832;
	Thu, 15 May 2025 10:47:55 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B663010E830;
 Thu, 15 May 2025 10:47:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Some_=28drm=5Fsched?=
 =?utf-8?q?=5F=7Cdma=5F=29fence_lifetime_issues_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 10:47:54 -0000
Message-ID: <174730607474.84197.14967288624502695694@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
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

Series: Some (drm_sched_|dma_)fence lifetime issues (rev3)
URL   : https://patchwork.freedesktop.org/series/148825/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: fbf1cb830ae7 drm-tip: 2025y-05m-15d-10h-33m-27s UTC integration manifest
=== git am output follows ===
Applying: dma-fence: Change signature of __dma_fence_is_later
Applying: dma-fence: Use a flag for 64-bit seqnos
Applying: dma-fence: Add helpers for accessing driver and timeline name
Applying: sync_file: Use dma-fence driver and timeline name helpers
Applying: drm/i915: Use dma-fence driver and timeline name helpers
Applying: dma-fence: Add safe access helpers and document the rules
Applying: sync_file: Protect access to driver and timeline name
Applying: drm/i915: Protect access to driver and timeline name
Applying: drm/xe: Make dma-fences compliant with the safe access rules


