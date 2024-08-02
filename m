Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331B1C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0339C10E08C;
	Fri,  2 Aug 2024 22:26:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BC810E066;
 Fri,  2 Aug 2024 22:26:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Update_to_GuC_v70=2E?=
 =?utf-8?q?29=2E2_as_minimum_for_Xe_=28support_LNL=2C_BMG=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Aug 2024 22:26:48 -0000
Message-ID: <172263760846.503885.6760144050670076520@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
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

Series: Update to GuC v70.29.2 as minimum for Xe (support LNL, BMG)
URL   : https://patchwork.freedesktop.org/series/136857/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 0b8d955bfdcf drm-tip: 2024y-08m-02d-21h-37m-47s UTC integration manifest
=== git am output follows ===
Applying: Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"
Applying: drm/xe/guc: Bump minimum required GuC version to v70.29.2
Applying: drm/xe/guc: Define GuC version v70.29.2 for BMG
Applying: drm/xe/guc: Pre-release GuC firmware v70.29.2 for PVC


