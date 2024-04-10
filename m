Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CEBCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DE310E596;
	Wed, 10 Apr 2024 17:08:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34B010E596;
 Wed, 10 Apr 2024 17:08:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PF=3A_Add_support_to?=
 =?utf-8?q?_configure_GuC_SR-IOV_policies_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 17:08:55 -0000
Message-ID: <171276893566.1338407.10595493953538703078@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410170338.1199-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240410170338.1199-1-michal.wajdeczko@intel.com>
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

Series: PF: Add support to configure GuC SR-IOV policies (rev2)
URL   : https://patchwork.freedesktop.org/series/132271/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8fa0e230782f drm-tip: 2024y-04m-10d-16h-32m-53s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/pf: Introduce mutex to protect VFs configurations
Applying: drm/xe/pf: Introduce helper functions for use by PF
Applying: drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
Applying: drm/xe/guc: Add helpers for GuC KLVs
Applying: drm/xe/pf: Add support to configure GuC SR-IOV policies


