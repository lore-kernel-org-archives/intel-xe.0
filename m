Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF9C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 22:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE7410E4EF;
	Tue,  4 Jun 2024 22:00:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9CC10E621;
 Tue,  4 Jun 2024 22:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/xe=5Fguc=5Fsu?=
 =?utf-8?q?bmit=3A_Declare_reset_if_guc_stopped?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Jun 2024 22:00:19 -0000
Message-ID: <171753841983.2266113.8852706013466258343@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603210554.2458942-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240603210554.2458942-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_submit: Declare reset if guc stopped
URL   : https://patchwork.freedesktop.org/series/134415/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 596cf447db94 drm-tip: 2024y-06m-04d-20h-11m-26s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/xe_guc_submit: Declare reset if guc stopped


