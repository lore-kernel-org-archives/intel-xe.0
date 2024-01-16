Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F3EC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740DA10E317;
	Tue, 16 Jan 2024 14:59:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9A710E317;
 Tue, 16 Jan 2024 14:59:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Update_MMIO_read/wri?=
 =?utf-8?q?te_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 16 Jan 2024 14:59:06 -0000
Message-ID: <170541714689.502239.15602224349601156323@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Update MMIO read/write functions
URL   : https://patchwork.freedesktop.org/series/128835/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c4796d784 drm-tip: 2024y-01m-16d-10h-07m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Assert size of the struct xe_reg
Applying: drm/xe: Define XE_REG_OPTION_VF
Applying: drm/xe: Mark VF accessible GuC registers
Applying: drm/xe: Mark VF accessible global registers
Applying: drm/xe: Mark VF accessible GT registers
Applying: drm/xe: Make xe_mmio_read|write() functions non-inline


