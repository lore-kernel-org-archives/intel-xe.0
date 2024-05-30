Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB10CC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 14:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8452310E23C;
	Thu, 30 May 2024 14:14:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6736A10E23C;
 Thu, 30 May 2024 14:14:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_VF=3A_Setup_VRAM_bas?=
 =?utf-8?q?ed_on_received_config_data_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 14:14:22 -0000
Message-ID: <171707846241.2238285.5163364873694126700@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240530133527.1328-1-michal.wajdeczko@intel.com>
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

Series: VF: Setup VRAM based on received config data (rev2)
URL   : https://patchwork.freedesktop.org/series/134097/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: bdab4dd15a63 drm-tip: 2024y-05m-30d-13h-50m-04s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Move XEHP_MTCFG_ADDR register definition to xe_regs.h
Applying: drm/xe: Move BAR definitions to dedicated file
Applying: drm/xe: Drop xe_ prefix from static functions in xe_mmio.c
Applying: drm/xe: Promote VRAM initialization function to own file
Applying: drm/xe/vf: Setup VRAM based on received config data


