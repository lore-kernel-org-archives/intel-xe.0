Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8245FC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3844F10E194;
	Thu, 14 Dec 2023 19:42:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAB2010E194;
 Thu, 14 Dec 2023 19:41:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9D97BA47DF;
 Thu, 14 Dec 2023 19:41:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Trivial_register_cle?=
 =?utf-8?q?anups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 14 Dec 2023 19:41:57 -0000
Message-ID: <170258291764.19957.9255449208075440429@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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

Series: Trivial register cleanups
URL   : https://patchwork.freedesktop.org/series/127829/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: e9f8fa579 drm/xe/xe2: Support flat ccs
=== git am output follows ===
Applying: drm/xe: Drop "_REG" suffix from CSFE_CHICKEN1
Applying: drm/xe: Move some per-engine register definitions to the engine header
Applying: drm/xe: Fix whitespace in register definitions
Applying: drm/xe: Move engine base offsets to engine register header
Applying: drm/xe: Move GSC HECI base offsets out of register header
Applying: drm/xe: Define interrupt vector bits with the interrupt registers
Applying: drm/xe: Re-sort GT register header
Applying: drm/xe: Drop some unnecessary header includes


