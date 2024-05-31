Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430D7C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 19:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C36C10E142;
	Fri, 31 May 2024 19:59:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3757D10E142;
 Fri, 31 May 2024 19:59:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Fix_missin?=
 =?utf-8?q?g_runtime_outer_protection_for_ggtt=5Fremove=5Fnode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 19:59:27 -0000
Message-ID: <171718556722.2243384.1305371219210404467@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531195315.217230-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240531195315.217230-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Fix missing runtime outer protection for ggtt_remove_node (rev2)
URL   : https://patchwork.freedesktop.org/series/134308/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 71fb583af6de drm-tip: 2024y-05m-31d-13h-29m-19s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix missing runtime outer protection for ggtt_remove_node


