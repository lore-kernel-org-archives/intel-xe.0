Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA36C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B6B11226B;
	Fri, 15 Mar 2024 14:06:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393A011226B;
 Fri, 15 Mar 2024 14:06:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/6=5D_drm/xe=3A_Introduce_a_simple_busted_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Mar 2024 14:06:29 -0000
Message-ID: <171051158922.795787.1392129051526362656@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240315140108.217862-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/6] drm/xe: Introduce a simple busted state
URL   : https://patchwork.freedesktop.org/series/131188/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 475ba6bf5ef9 drm-tip: 2024y-03m-15d-12h-40m-53s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce a simple busted state
Applying: drm/xe: declare busted upon GuC load failure
Applying: drm/xe: Add extra busted protection for the no GuC reset
Applying: drm/xe: Force busted state and block GT reset upon any GPU hang
Applying: drm/xe: Introduce the busted_mode debugfs
Applying: drm/xe: Introduce the busted_mode debugfs


