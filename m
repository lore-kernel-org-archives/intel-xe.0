Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43E9C25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 16:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC8C10E689;
	Mon,  6 May 2024 16:05:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A1A10E689;
 Mon,  6 May 2024 16:05:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PF=3A_Support_for_ad?=
 =?utf-8?q?verse_events_notifications?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 16:05:06 -0000
Message-ID: <171501150687.1939724.13362182617946830163@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

Series: PF: Support for adverse events notifications
URL   : https://patchwork.freedesktop.org/series/133236/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5a59c9dd7c7b drm-tip: 2024y-05m-06d-15h-59m-14s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add more KLV helper macros
Applying: drm/xe/guc: Introduce GuC KLV thresholds set
Applying: drm/xe/guc: Add support for threshold KLVs in to_string() helper
Applying: drm/xe/pf: Introduce functions to configure VF thresholds
Applying: drm/xe/pf: Allow configuration of VF thresholds over debugfs
Applying: drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
Applying: drm/xe/pf: Track adverse events notifications from GuC
Applying: drm/xe/pf: Expose PF monitor details via debugfs


