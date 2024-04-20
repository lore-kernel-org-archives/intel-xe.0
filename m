Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0017C4345F
	for <intel-xe@archiver.kernel.org>; Sat, 20 Apr 2024 02:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF6E10E57F;
	Sat, 20 Apr 2024 02:04:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D135B10E57F;
 Sat, 20 Apr 2024 02:04:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_SR-IOV_GuC_Relay?=
 =?utf-8?q?_PF_services_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Apr 2024 02:04:05 -0000
Message-ID: <171357864585.1536851.4914450965512361070@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240418152802.182-1-michal.wajdeczko@intel.com>
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

Series: Add SR-IOV GuC Relay PF services (rev2)
URL   : https://patchwork.freedesktop.org/series/132612/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5b8f5c906246 drm-tip: 2024y-04m-19d-22h-43m-43s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
Applying: drm/xe: Add helper to calculate adjusted register offset
Applying: drm/xe: Add few more GT register definitions
Applying: drm/xe/pf: Add SR-IOV GuC Relay PF services
Applying: drm/xe/kunit: Add PF service tests


