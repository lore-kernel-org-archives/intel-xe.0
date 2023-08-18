Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5FBEE4998
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622C910E049;
	Fri, 18 Aug 2023 22:11:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3624710E049;
 Fri, 18 Aug 2023 22:11:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F174EAADEB;
 Fri, 18 Aug 2023 22:11:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 18 Aug 2023 22:11:29 -0000
Message-ID: <169239668995.12740.7064060612849210601@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Add_Lunar_Lake_support_=28rev2=29?=
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

Series: Add Lunar Lake support (rev2)
URL   : https://patchwork.freedesktop.org/series/122353/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: ddd311457 drm/xe: enable idle msg and set hysteresis for GSCCS
=== git am output follows ===
Applying: drm/xe/xe2: Update render/compute context image sizes
Applying: drm/xe/xe2: Add GT topology readout
Applying: drm/xe/xe2: Add MCR register steering for primary GT
Applying: drm/xe/xe2: Add MCR register steering for media GT
Applying: drm/xe/xe2: Update context image layouts
Applying: drm/xe/xe2: Handle fused-off CCS engines
Applying: drm/xe/xe2: AuxCCS is no longer used
Applying: drm/xe/xe2: Define Xe2_LPG IP features
Applying: drm/xe/xe2: Define Xe2_LPM IP features
Applying: drm/xe/xe2: Track VA bits independently of max page table level
Applying: drm/xe/xe2: Add MOCS table
Applying: drm/xe/xe2: Program GuC's MOCS on Xe2 and beyond
Applying: drm/xe/lnl: Add LNL platform definition
Applying: drm/xe/lnl: Add GuC firmware definition
Applying: drm/xe/lnl: Hook up MOCS table


