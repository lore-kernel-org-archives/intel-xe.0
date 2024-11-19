Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BD8D6C290
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 20:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB99B10E093;
	Tue, 19 Nov 2024 20:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8gte4i3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD3710E093
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 20:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732046598; x=1763582598;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gS3ndCFi6T54nvcIA+2I8O7b7uVtUmck16fd0E7LbJE=;
 b=a8gte4i3B2TatDmiHZODdnLGCKSGEe/oG3j3y3HEd5221dNLzjFTzJFT
 Ae3FLtj6MMcRM8b8ClnZLuDByK6Vukv+XJu1mojGEWKk7QihAmqIr5FuX
 FEslzvQPVgJraqslmJGV659yx1YfPeAhM4XpUBiV6i3M03p8aKJOxG/j2
 86EysHNy6gDIujClv5Qw14mmhGsb4u9wl4gT8QwTLmATuYa+3ImFivlWM
 ZG/bkqHauXVabn1fXVyJpiXjXFnJqt9J2Kxfdp1tay6T6VhjWbeiJLyb7
 e3gf93qkkfWqyk9ZxLGJOMdxrZsm9SUrZwMchMDuHZA6pl/vYyy0B+syC A==;
X-CSE-ConnectionGUID: Eue9vj3CRJixMKJ70ndRZA==
X-CSE-MsgGUID: L/IG2AaMRmqDi1jRJNAl1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42711103"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="42711103"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:03:17 -0800
X-CSE-ConnectionGUID: e7D9aiduTF237m0HxFeG6g==
X-CSE-MsgGUID: S/PcY88pROi3IqelJaalkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="120537677"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.70])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:03:18 -0800
Date: Tue, 19 Nov 2024 14:03:12 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/xe: Use new force-wake guard class in xe_mocs.c
Message-ID: <q6oftdodc3xpjczeddv3ghr2c5msrqgekbz3f34yi5leg4hz22@dwodxaqpk6pd>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-3-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241118184511.258-3-michal.wajdeczko@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 18, 2024 at 07:45:11PM +0100, Michal Wajdeczko wrote:
>Start using new xe_fw class to minimize risk of leaking force-wake
>references.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
>v2: rebased
>---
> drivers/gpu/drm/xe/xe_mocs.c | 10 +++-------
> 1 file changed, 3 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 54d199b5cfb2..f18aaa6595c7 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -776,19 +776,15 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct xe_mocs_info table;
>-	unsigned int fw_ref, flags;
>+	unsigned int flags;
>
> 	flags = get_mocs_settings(xe, &table);
>
> 	xe_pm_runtime_get_noresume(xe);
>-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-	if (!fw_ref)
>-		goto err_fw;
>
>-	table.ops->dump(&table, flags, gt, p);
>+	scoped_guard(xe_fw, gt_to_fw(gt), XE_FW_GT)
>+		table.ops->dump(&table, flags, gt, p);


afair one caveat is that you can't have a goto that jumps over guard
because of the usage of the cleanup attribute. Is that still the case or
do we have some magic convincing the compiler to do the right thing?

once we get agreement on the approach, please let's convert everything
that can be converted to scoped guard so we don't have to keep both
approaches for a long time.

Lucas De Marchi

>
>-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-err_fw:
> 	xe_pm_runtime_put(xe);
> }
>
>-- 
>2.43.0
>
