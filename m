Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414EBE92724
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B5F10E484;
	Thu,  5 Oct 2023 18:05:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1728810E482;
 Thu,  5 Oct 2023 18:05:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0D38FA03D2;
 Thu,  5 Oct 2023 18:05:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 05 Oct 2023 18:05:41 -0000
Message-ID: <169652914102.7512.16080435866946957769@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231005150619.9521-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231005150619.9521-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_series_starting_with_=5BCI=2C1/6=5D_drm/xe=3A_add_28-bit_add?=
 =?utf-8?q?ress_support_in_struct_xe=5Freg?=
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

Series: series starting with [CI,1/6] drm/xe: add 28-bit address support in struct xe_reg
URL   : https://patchwork.freedesktop.org/series/124666/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: be79dc250 fixup! drm/xe/hwmon: Expose power attributes
=== git am output follows ===
Applying: drm/xe: add 28-bit address support in struct xe_reg
Applying: drm/xe: add read/write support for MMIO extension space
Applying: drm/xe: add a flag to bypass multi-tile config from MTCFG reg
Applying: drm/xe: add MMIO extension support flags
Applying: drm/xe: map MMIO BAR according to the num of tiles in device desc
Applying: drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension


