Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020BAEB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 08:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80DE10E2FA;
	Tue, 18 Jul 2023 08:50:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FD2B10E2FA;
 Tue, 18 Jul 2023 08:50:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 38D62A47E9;
 Tue, 18 Jul 2023 08:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Tue, 18 Jul 2023 08:50:23 -0000
Message-ID: <168967022323.22206.9296677932484229489@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230718080703.239343-1-anshuman.gupta@intel.com>
In-Reply-To: <20230718080703.239343-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_D3Cold_Policy_=28rev8=29?=
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

Series: D3Cold Policy (rev8)
URL   : https://patchwork.freedesktop.org/series/118035/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: a43fd52b7 drm/xe: Cleanup style warnings
=== git am output follows ===
Applying: drm/xe/pm: Add pci d3cold_capable support
Applying: drm/xe/pm: Refactor xe_pm_runtime_init
Applying: drm/xe/pm: Add vram_d3cold_threshold Sysfs
Applying: xe/drm/pm: Toggle d3cold_allowed using vram_usages
Applying: drm/xe/pm: Init pcode and restore vram on power lost


