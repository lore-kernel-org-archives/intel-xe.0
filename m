Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39DDC5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 22:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D97110E190;
	Mon,  2 Jun 2025 22:18:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4847E10E190;
 Mon,  2 Jun 2025 22:18:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/bmg=3A_Fix_NU?=
 =?utf-8?q?LL-ptr_deref_during_probe_on_SKUs_with_no_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 22:18:48 -0000
Message-ID: <174890272829.42010.4881955462206944335@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602221118.306395-1-vivek.kasireddy@intel.com>
In-Reply-To: <20250602221118.306395-1-vivek.kasireddy@intel.com>
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

Series: drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with no display
URL   : https://patchwork.freedesktop.org/series/149746/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 354657e88d7a drm-tip: 2025y-06m-02d-22h-06m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with no display


