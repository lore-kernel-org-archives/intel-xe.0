Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744CCC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 14:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F66110E6EC;
	Tue, 25 Feb 2025 14:35:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B7710E6EC;
 Tue, 25 Feb 2025 14:35:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_VF=3A_Set_submission?=
 =?utf-8?q?_version_in_xe=5Fuc=5Ffw_struct?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 14:35:18 -0000
Message-ID: <174049411885.1991856.9575632631982920371@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
In-Reply-To: <20250225132337.6508-1-lukasz.laguna@intel.com>
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

Series: VF: Set submission version in xe_uc_fw struct
URL   : https://patchwork.freedesktop.org/series/145406/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f4e2e14001a8 drm-tip: 2025y-02m-25d-14h-02m-42s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/uc: Add helpers to set firmware version
Applying: drm/xe/vf: Add helper to get negotiated GuC ABI version
Applying: drm/xe/vf: Set submission version in xe_uc_fw struct


