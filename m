Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184E0C3DA63
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 06:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40E810E06B;
	Fri, 26 Jul 2024 06:49:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CFD10E06B;
 Fri, 26 Jul 2024 06:49:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Fix_rtp_when_process?=
 =?utf-8?q?ing_OOB_workarounds_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 06:49:48 -0000
Message-ID: <172197658827.385062.3992659170151826362@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
In-Reply-To: <20240726064337.797576-1-lucas.demarchi@intel.com>
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

Series: Fix rtp when processing OOB workarounds (rev3)
URL   : https://patchwork.freedesktop.org/series/136538/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: edd84625d093 drm-tip: 2024y-07m-26d-03h-31m-00s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/kunit: Test WAs for BMG
Applying: drm/xe/kunit: Rename count to sr_entries
Applying: drm/xe/kunit: Test active rtp entries
Applying: drm/xe/kunit: Rename rtp test cases
Applying: drm/xe/rtp: Fix off-by-one when processing rules
Applying: drm/xe/kunit: Test rtp with no actions
Applying: drm/xe/rtp: Simplify marking active workarounds


