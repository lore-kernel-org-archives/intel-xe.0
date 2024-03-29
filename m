Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FB8CD1288
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 02:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B851E10E283;
	Fri, 29 Mar 2024 02:58:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F6210E283;
 Fri, 29 Mar 2024 02:58:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Update_GuC_ABI_defin?=
 =?utf-8?q?itions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 02:58:49 -0000
Message-ID: <171168112985.1066046.3200207512119197716@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328183147.495-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240328183147.495-1-michal.wajdeczko@intel.com>
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

Series: Update GuC ABI definitions
URL   : https://patchwork.freedesktop.org/series/131786/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 98f893b726e1 drm-tip: 2024y-03m-29d-01h-42m-42s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
Applying: drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
Applying: drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
Applying: drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
Applying: drm/xe/guc: Add VF2GUC_VF_RESET to ABI
Applying: drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
Applying: drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition


