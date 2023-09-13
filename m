Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E11EDEC4D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 13:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04EB10E4C2;
	Wed, 13 Sep 2023 13:52:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D68D10E4C2;
 Wed, 13 Sep 2023 13:52:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5B58DAADDA;
 Wed, 13 Sep 2023 13:52:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Wed, 13 Sep 2023 13:52:55 -0000
Message-ID: <169461317535.31249.11753494490009164729@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230913095800.1661119-1-kelbaz@habana.ai>
In-Reply-To: <20230913095800.1661119-1-kelbaz@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_MMIO_extension_support_for_multi-tile_devices?=
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

Series: MMIO extension support for multi-tile devices
URL   : https://patchwork.freedesktop.org/series/123636/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 89b671db4 drm/xe: Use Xe assert macros instead of XE_WARN_ON macro
=== git am output follows ===
Applying: drm/xe: add 28-bit address support in struct xe_reg
Applying: drm/xe: add read/write support for MMIO extension space
Applying: drm/xe: add a flag to bypass multi-tile config from MTCFG reg
Applying: drm/xe: add MMIO extension support flags
Applying: drm/xe: map MMIO BAR according to the num of tiles in device desc
Applying: drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension


