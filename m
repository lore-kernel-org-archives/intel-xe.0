Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58458C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2370610E29A;
	Mon, 13 May 2024 08:08:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7464210E4CA;
 Mon, 13 May 2024 08:08:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_support_for_VF_t?=
 =?utf-8?q?o_query_its_configuration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 May 2024 08:08:48 -0000
Message-ID: <171558772847.2094285.2644434099077033488@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240512154915.2040-1-michal.wajdeczko@intel.com>
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

Series: Add support for VF to query its configuration
URL   : https://patchwork.freedesktop.org/series/133509/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b5f09c51c3bb drm-tip: 2024y-05m-13d-01h-31m-15s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
Applying: drm/xe/guc: Add VF2GUC_VF_RESET to ABI
Applying: drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
Applying: drm/xe/vf: Add support for VF to query its configuration
Applying: drm/xe/vf: Custom hardware config load step if VF
Applying: drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs


