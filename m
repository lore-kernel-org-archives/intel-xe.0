Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B268C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2034710EADA;
	Tue, 21 May 2024 10:45:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1AD10EADA;
 Tue, 21 May 2024 10:45:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Prefer_forward_decla?=
 =?utf-8?q?rations_in_headers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 10:45:21 -0000
Message-ID: <171628832175.2162685.13584088210643750411@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521102828.668-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240521102828.668-1-michal.wajdeczko@intel.com>
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

Series: Prefer forward declarations in headers
URL   : https://patchwork.freedesktop.org/series/133873/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 362550fd170e drm-tip: 2024y-05m-21d-08h-03m-08s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix xe_uc.h
Applying: drm/xe: Fix xe_gsc.h
Applying: drm/xe: Fix xe_huc.h
Applying: drm/xe: Fix xe_guc_pc.h


