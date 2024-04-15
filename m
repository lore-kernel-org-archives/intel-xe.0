Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F48EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA2410F0DE;
	Mon, 15 Apr 2024 17:15:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2960910F0E0;
 Mon, 15 Apr 2024 17:15:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PF=3A_Add_support_to?=
 =?utf-8?q?_configure_SR-IOV_VFs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 17:15:04 -0000
Message-ID: <171320130417.1404431.8841015801505476636@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240414190137.1243-1-michal.wajdeczko@intel.com>
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

Series: PF: Add support to configure SR-IOV VFs
URL   : https://patchwork.freedesktop.org/series/132416/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4369453e15db drm-tip: 2024y-04m-15d-17h-02m-11s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add helper to format SR-IOV function name
Applying: drm/xe: Allow to assign GGTT region to the VF
Applying: drm/xe: Add xe_ttm_vram_get_avail
Applying: drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
Applying: drm/xe/pf: Add SR-IOV PF specific early GT initialization
Applying: drm/xe/pf: Add support to configure SR-IOV VFs


