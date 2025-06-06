Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145EDC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 20:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4C110E363;
	Fri,  6 Jun 2025 20:27:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B7210E1D5;
 Fri,  6 Jun 2025 20:27:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_WildCat_Lake_sup?=
 =?utf-8?q?port_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 20:27:56 -0000
Message-ID: <174924167660.57344.17469580042697207624@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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

Series: Add WildCat Lake support (rev3)
URL   : https://patchwork.freedesktop.org/series/149794/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b8f759deb9ab drm-tip: 2025y-06m-06d-18h-48m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/xe3lpd: Add support for display version 30.02
Applying: drm/xe/xe3: Add support for graphics IP version 30.03
Applying: drm/xe/xe3: Add support for media IP version 30.02
Applying: drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
Applying: drm/i915: Set max cdclk for display 30.02
Applying: drm/xe: Add Wildcat Lake device IDs to PTL list
Applying: drm/i915/xe3lpd: Extend DMC path for display version 30.02
Applying: drm/i915/wcl: C10 phy connected to port A and B
Applying: drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02


