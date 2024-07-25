Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5465DC3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 01:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC56410E02C;
	Thu, 25 Jul 2024 01:14:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920C410E02C;
 Thu, 25 Jul 2024 01:14:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Move_HuC_and_GSC_FW_?=
 =?utf-8?q?defs_for_LNL_and_BMG_to_drm-xe-next?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 01:14:03 -0000
Message-ID: <172187004357.364098.16924087354898269779@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
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

Series: Move HuC and GSC FW defs for LNL and BMG to drm-xe-next
URL   : https://patchwork.freedesktop.org/series/136464/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4a9ed276779a drm-tip: 2024y-07m-24d-20h-41m-30s UTC integration manifest
=== git am output follows ===
Applying: Revert "drm/xe/huc: Define BMG HuC"
Applying: Revert "drm/xe/gsc: define GSC FW for LNL"
Applying: Revert "drm/xe/huc: Define LNL HuC"
Applying: drm/xe/huc: Define HuC binary for LNL
Applying: drm/xe/gsc: Define GSC binary for LNL
Applying: drm/xe/huc: Define HuC binary for BMG


