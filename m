Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CAFC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 19:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4615F1137A8;
	Wed, 17 Apr 2024 19:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cpbc8EBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556A61137A8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713383477; x=1744919477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4E/04u74LTug+ZS6Ks5I+3EFOG0WsHK0BXW8/bOmSQg=;
 b=Cpbc8EBMD8E1EWQvlXTJcCBF0Uf/+H3IyE3+a1KDFWaPJcjuCbonXgke
 ptxPaJuzqZ/3yTPHTIhGUGs8to4QnsPBM6BemjuU4mX8L95OsmVNJkzOK
 XdIUxJzxfAoDfRrZwx0tm89yj4U6JEHaxKac6NydBVPdbmX6NhGrDpgum
 Qa1ZSs+EkHh4hCYWEuQ1PkORMn+1x4uk8I+p3VBGJYJnQAexAkJLdoBRj
 BMdB/ortRbN7TSpl8pvJxgZaQeOxI7Uw/J+f/Kf0VMBjQjiAyxCZEZYI6
 C/FdTfJ38stJ5DDaYNiHrPd5qZxEuNy8Pt0V41/jpwVTl/TZps+imQYBZ Q==;
X-CSE-ConnectionGUID: xlUciCC4SNe48nGuNq9UJg==
X-CSE-MsgGUID: jhEMKvEdSe2nikek/PC8Hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9025115"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9025115"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 12:51:16 -0700
X-CSE-ConnectionGUID: nWxhxDPaTmubZcXzaA968A==
X-CSE-MsgGUID: VMD6261/RQKeX7eUNS417A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60152639"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 12:51:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 12:51:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 12:51:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 12:51:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 12:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c66oim08eNlOoP7NAk3nkIeFnG5yWa7w3//7Yz4Q4/ec+nadomwV5YPW6jGeUgNJsUgOmE7DVT3MP7IjeieBpWHrsOcV9dA/QzlUw9sJSTrR6mopGR9zqkJ6geOyQrfOq6J6QS0aEwJogXIQMh0a5MlsVAj1vzd6ZkPjdPJFOsodll3l9F9RUS9M2CIQ2gE34+T82mOia5EeMl8tkVqj2NUUmeHKwNmkQGv0KlddK2S6cU3ISW13Tg+YLhB/imUVXly5SCyZ6arxWRXYp7fzXI7azfPBo7ujbidwYCKHoQMiTWzgNLd/+m+5lGn5EaC0QaMYJD2ld+m4QPKpIS7pRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swEVyMkQ5+gvjB2Z0oWiV/ICbGsa1ShX+TPCTwIdUbU=;
 b=by5OPxHg1T2ZZmgnYqzqaogSrauJm0ruOLrWNJM9CpbiAMWSABpEBpTL2Fbl2vWyWgMxMunHreaxInwsCXXHBfd3Fmo2VPaslltNmsQHi97Z9VLxulfXWfLXEmk9briZ8Cpou7qG6pZ6EUVOVZlh/OFRen5tQEpNKUpBu+2mpLS8s/+TCCHUgEzNX6WBbdPTDcYe2XKBosmy71q0YCCRAH1/NVUJma/H/BznUxG+yzcRYgjIXbA04tXcMeMFWMzlRVx56q2OqpwR6RYQvFmmH37f25u9Z4DzNyugJDTM0VgpWN8TwdQFnHz8bYHOemtS3dZiBjJ7nOaPOs+np20DJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Wed, 17 Apr
 2024 19:51:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 19:51:07 +0000
Date: Wed, 17 Apr 2024 14:51:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Introduce the wedged_mode debugfs
Message-ID: <z2auuvqeokuzcif6k3w6tmoxfb7umragq6dva4hbh4v432vejz@di3tnyyhnvg6>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240409221507.1076471-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: 19149c0e-017f-48e4-2c32-08dc5f17b912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DwYI/vwtOT8PCHVQw6sMMbioO2YV8la9cACrZNs7fgCAOTXef1Q7x6wQPuHXHLnSietfdhkNu89xHZ4FJvi37jJaS4NvnU7RDTVpTzAt/Cd8saH4L+WY9ivtD9agY5t0+PrCc0HnASIJjeKDS+IhsqmHmI7Cr2w3FRprTjZvsxLnSu3n28/K7S5n72m3g+g51GDbC+Sg473Ph7pKJTB/6PP4qO8pM/5+eioj4D6yAk6ed9nx8a4Ifm6LgwHmHXFKHzjfMGRoOgdgRVSNaALSHEUEOoPqgukdWLxJkJTwnqlQ/SnGwjI7a/hdQ3ybMCoVS9n/5+YsnXrcEVg0W6Eu8uB7rW/poNIYi3bPmWwOjfM1yhFfejs3Gt6H9HgZSy7OMqQjb9fe7OZbAXalEwXUQ7irT1G4tOQkCaR1OzokESJhHVXYuaXBpUxbmOq7BAi5N7NkZY8vpQqyGEAV6q+Hx5HtlRVPw1YseHMRqwMn+NKGQlax2M/wn90ukXyu/7CQgTyYZUFZ87kST1uePxNjvI8AO2rCRt3c9686lhDVtgzS1/CGainpPrlALKSIDVgyQcAdp416Xlyxr9xgSzGjlztxbrsA3fMes9fvPFgWUFaoSRu9gWYjMMdks3sDGtDRoYnEJOnlx6w9Xa5Xn3LKyeYZ5ojhQLqkyjFyZNDSoNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6AJDd8HkMy7l+JrGArcSgRz81QfpfAo2ZbEIXGdg1uqY59MI1nOIPNaJJGle?=
 =?us-ascii?Q?o+vIfsyNKYLIRZ9+AeeqZvpSuqqtBHCFn6kUcyHw68Hvw0a3lzSEmwzT3Da9?=
 =?us-ascii?Q?hg6IBVPLeuBJ9JaMD0uXnAC3p8OgPi4tKOAA+sxOvmiRpkmWVE6Gl0Ueyits?=
 =?us-ascii?Q?TZ9oCXDOv9rRdFAE20k/Y0uQlpgVjE68sYZk9uf5rXbeIYqzNSkhgeMDsrlW?=
 =?us-ascii?Q?5+ohLZsdA+zX8N5frhVpWcHhwbuJcFIdfbt0o5pJaNR8uG3PC9etkLLa6sGP?=
 =?us-ascii?Q?k1ZMtI4iOV5f3ApOUi0BEsCOUyhP7PY9Wnh2nbmBUlsPRIpNWj4OIOGfF7Bw?=
 =?us-ascii?Q?tIscDPRcxokrDzdq2diHR6OKzZEZvw+Lzgm2wW9LXqSGgdh57DxJxj9ThgWg?=
 =?us-ascii?Q?WtpJyZrBqllGGXYRA8QCTo7IIEGcI01ld8+2L/74durE7SVjs93S4ls6FP95?=
 =?us-ascii?Q?jPEmLweye3yb1wrhaAIpa8EKRhNDtd3QL/DiFFUZLffHWZaFcLEJhjJSVQZa?=
 =?us-ascii?Q?rV15dE4lXeoKekGPmPNIzJluHtO7ODwNuYXjpcPWiYIRoq5LOXqq+9FypS4U?=
 =?us-ascii?Q?YgON1ltrTkAzPpEXVuiL67NciEXNK/SCq/WQgQlIrQP5k2obKu2DhvmqX249?=
 =?us-ascii?Q?aDbE+YakXD+g9TvLAMm0OtaICSzqMBnEnd+XetljY6VTqUd2H6PZ1nF2T0eD?=
 =?us-ascii?Q?rjr9DAJgAlFGN6AESkw87Vj6PV6IXra2loafUavyku1MLcWwh3GcmtmsuwO3?=
 =?us-ascii?Q?qRq0+Gz9uPs2QiLnnpyY3wITL+TvUa5n0j5ET4ZV4baIXd8On3FK836NKlQh?=
 =?us-ascii?Q?utYrL1Slf5tQCg0YFerlNPLKT5/lzh5dcG6e/DTHOxgshMWR8DqfXzmB06Af?=
 =?us-ascii?Q?SBzuagnZMRXpECrCwAOl35aZo5YE0J7QhkreWEg5V/r3Cpi39oaw25GOzaH1?=
 =?us-ascii?Q?B4vw4PXUNS25mx8wDPkQ3H3gvBklfKcqUNacqgPHe490aLC6DkVYsLqzKcuL?=
 =?us-ascii?Q?T2JBAxHnpFWdKE6z31uvTvLFg93EnYb53HfkXtkWNf/LWkugLlcrc8jzrY65?=
 =?us-ascii?Q?/HRu3DF1xgCSF/JgPCJu6QK9GqHvQBo2iv+DyqqwZu2aLGF7TxQItT8PuEOR?=
 =?us-ascii?Q?x46IILsyBCMxDzjebpQT8fAHzDHfxXIHS4f5l41gLym6GA6o6stuvWe1bW03?=
 =?us-ascii?Q?GflQxB5kie9GdGTlK1miG9fWNjQNKpMMrk0ewusbONujTIA1iz02olPilA6h?=
 =?us-ascii?Q?xBHWE4S6o0w5+7ox3HQQ00KBzG/CevfXMI2kYK+FLuThKioMj75knCAlXTn5?=
 =?us-ascii?Q?QosXyiIKqN038QjpsATl+K81eoUmldbK/24rSKgkG5m/FPt8PI7nlInfaL9U?=
 =?us-ascii?Q?fLhJIIK6PnLE1LLES/J0gnkCuXSaPTGzBJVi9+kT8RR/wgV0Q6waypvFwcax?=
 =?us-ascii?Q?jtFvqdRTq6h4bWI0hTTZLPhqDb8ms11A74ta9nm7Nazj97S7cnTEryR8EGG9?=
 =?us-ascii?Q?yr5ED/JAv95i8YpQ3CJ8eNJpzTissLCTEPCJ/CZmBclZSQtQVXyCCWrELPJn?=
 =?us-ascii?Q?aMCPTO05r9+Cp5UjTaMuTl1Fe1ERTs1/nmB2KJiwgiUIOkZyd/ttbvqqimW1?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19149c0e-017f-48e4-2c32-08dc5f17b912
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 19:51:07.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiPsvpDnnwPC5BXNgnDTD40h0RUr1YIwuHDH8kfvVHhsVymTOd2rv3qIA0X7EofDECbJ+kQHCnE3t6l/gtCNz+zkBk5pabPrhgYaBCgdeiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-OriginatorOrg: intel.com
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

On Tue, Apr 09, 2024 at 06:15:07PM GMT, Rodrigo Vivi wrote:
>So, the wedged mode can be selected per device at runtime,
>before the tests or before reproducing the issue.
>
>v2: - s/busted/wedged
>    - some locking consistency
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c      | 56 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++------
> drivers/gpu/drm/xe/xe_device.h       |  4 +-
> drivers/gpu/drm/xe/xe_device_types.h | 11 +++++-
> drivers/gpu/drm/xe/xe_gt.c           |  2 +-
> drivers/gpu/drm/xe/xe_guc.c          |  2 +-
> drivers/gpu/drm/xe/xe_guc_ads.c      | 52 +++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
> drivers/gpu/drm/xe/xe_guc_submit.c   | 28 +++++++-------
> 9 files changed, 163 insertions(+), 34 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index 86150cafe0ff..6ff067ea5a8f 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -12,6 +12,7 @@
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_gt_debugfs.h"
>+#include "xe_guc_ads.h"
> #include "xe_pm.h"
> #include "xe_step.h"
>
>@@ -106,6 +107,58 @@ static const struct file_operations forcewake_all_fops = {
> 	.release = forcewake_release,
> };
>
>+static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>+				size_t size, loff_t *pos)
>+{
>+	struct xe_device *xe = file_inode(f)->i_private;
>+	char buf[32];
>+	int len = 0;
>+
>+	mutex_lock(&xe->wedged.lock);

what are we trying to synchronize here? multiple threads writing to
debugfs to change the wedged mode?

>+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
>+	mutex_unlock(&xe->wedged.lock);
>+
>+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>+}
>+
>+static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>+			       size_t size, loff_t *pos)
>+{
>+	struct xe_device *xe = file_inode(f)->i_private;
>+	struct xe_gt *gt;
>+	u32 wedged_mode;
>+	ssize_t ret;
>+	u8 id;
>+
>+	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>+	if (ret)
>+		return ret;
>+
>+	if (wedged_mode > 2)
>+		return -EINVAL;
>+
>+	mutex_lock(&xe->wedged.lock);
>+	xe->wedged.mode = wedged_mode;

should we return if xe->wedged.mode == wedged_mode already?

>+	if (wedged_mode == 2) {

this doesn't seem correct.

echo 2 > wedged_mode
echo 1 > wedged_mode

Second call doesn't fail, driver starts handling it as wedged_mode == 1,
guc still has the policy to disable reset. Or am I missing anything?

If we are not handling going back to 1, then we should just error
out above.

>+		for_each_gt(gt, xe, id) {
>+			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);
>+			if (ret) {
>+				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the wedged_mode=2\n");

humn... wouldn't it be better to keep xe->wedged.mode as is and error
out like:

	drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy, can't change wedged_mode\n");

also, we should return error here. dunno which one is appropriate, but
maybe -ECOMM. Also, maybe unwind the first GTs on error? May not be
needed and just make matters worse, but may deserve a comment about that
conscious decision here.

Lucas De Marchi

>+				break;
>+			}
>+		}
>+	}
>+	mutex_unlock(&xe->wedged.lock);
>+
>+	return size;
>+}
>+
>+static const struct file_operations wedged_mode_fops = {
>+	.owner = THIS_MODULE,
>+	.read = wedged_mode_show,
>+	.write = wedged_mode_set,
>+};
>+
> void xe_debugfs_register(struct xe_device *xe)
> {
> 	struct ttm_device *bdev = &xe->ttm;
>@@ -123,6 +176,9 @@ void xe_debugfs_register(struct xe_device *xe)
> 	debugfs_create_file("forcewake_all", 0400, root, xe,
> 			    &forcewake_all_fops);
>
>+	debugfs_create_file("wedged_mode", 0400, root, xe,
>+			    &wedged_mode_fops);
>+
> 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
> 		man = ttm_manager_type(bdev, mem_type);
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 7928a5470cee..949fca2f0400 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -445,6 +445,9 @@ int xe_device_probe_early(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	mutex_init(&xe->wedged.lock);
>+	xe->wedged.mode = xe_modparam.wedged_mode;
>+
> 	return 0;
> }
>
>@@ -787,26 +790,37 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> }
>
> /**
>- * xe_device_declare_wedged - Declare device wedged
>+ * xe_device_hint_wedged - Get a hint and possibly declare device as wedged
>  * @xe: xe device instance
>+ * @in_timeout_path: hint coming from a timeout path
>  *
>- * This is a final state that can only be cleared with a module
>+ * The wedged state is a final on that can only be cleared with a module
>  * re-probe (unbind + bind).
>  * In this state every IOCTL will be blocked so the GT cannot be used.
>- * In general it will be called upon any critical error such as gt reset
>- * failure or guc loading failure.
>- * If xe.wedged module parameter is set to 2, this function will be called
>- * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>- * snapshot capture. In this mode, GT reset won't be attempted so the state of
>- * the issue is preserved for further debugging.
>+ * In general device will be declared wedged only at critical
>+ * error paths such as gt reset failure or guc loading failure.
>+ * Hints are also expected from every single execution timeout (a.k.a. GPU hang)
>+ * right after devcoredump snapshot capture. Then, device can be declared wedged
>+ * if wedged_mode is set to 2. In this mode, GT reset won't be attempted so the
>+ * state of the issue is preserved for further debugging.
>+ *
>+ * Return: True if device has been just declared wedged. False otherwise.
>  */
>-void xe_device_declare_wedged(struct xe_device *xe)
>+bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path)
> {
>-	if (xe_modparam.wedged_mode == 0)
>-		return;
>+	bool ret = false;
>+
>+	mutex_lock(&xe->wedged.lock);
>
>-	if (!atomic_xchg(&xe->wedged, 1)) {
>+	if (xe->wedged.mode == 0)
>+		goto out;
>+
>+	if (in_timeout_path && xe->wedged.mode != 2)
>+		goto out;
>+
>+	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> 		xe->needs_flr_on_fini = true;
>+		ret = true;
> 		drm_err(&xe->drm,
> 			"CRITICAL: Xe has declared device %s as wedged.\n"
> 			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
>@@ -816,4 +830,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
> 			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> 			dev_name(xe->drm.dev));
> 	}
>+out:
>+	mutex_unlock(&xe->wedged.lock);
>+	return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 0fea5c18f76d..e3ea8a43e7f9 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -178,9 +178,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>
> static inline bool xe_device_wedged(struct xe_device *xe)
> {
>-	return atomic_read(&xe->wedged);
>+	return atomic_read(&xe->wedged.flag);
> }
>
>-void xe_device_declare_wedged(struct xe_device *xe);
>+bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index b9ef60f21750..0da4787f1087 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -458,8 +458,15 @@ struct xe_device {
> 	/** @needs_flr_on_fini: requests function-reset on fini */
> 	bool needs_flr_on_fini;
>
>-	/** @wedged: Xe device faced a critical error and is now blocked. */
>-	atomic_t wedged;
>+	/** @wedged: Struct to control Wedged States and mode */
>+	struct {
>+		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>+		atomic_t flag;
>+		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>+		int mode;
>+		/** @wedged.lock: To protect @wedged.mode */
>+		struct mutex lock;
>+	} wedged;
>
> 	/* private: */
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 0844081b88ef..da16f4273877 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -688,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
> err_fail:
> 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>
>-	xe_device_declare_wedged(gt_to_xe(gt));
>+	xe_device_hint_wedged(gt_to_xe(gt), false);
>
> 	return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index f1c3e338301d..ee7e0fa4815d 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -495,7 +495,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
> 			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
> 				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>
>-		xe_device_declare_wedged(gt_to_xe(gt));
>+		xe_device_hint_wedged(gt_to_xe(gt), false);
> 	} else {
> 		xe_gt_dbg(gt, "GuC successfully loaded\n");
> 	}
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index dbd88ae20aa3..ad64d5a31239 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -9,6 +9,7 @@
>
> #include <generated/xe_wa_oob.h>
>
>+#include "abi/guc_actions_abi.h"
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_guc_regs.h"
>@@ -16,11 +17,11 @@
> #include "xe_gt.h"
> #include "xe_gt_ccs_mode.h"
> #include "xe_guc.h"
>+#include "xe_guc_ct.h"
> #include "xe_hw_engine.h"
> #include "xe_lrc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>-#include "xe_module.h"
> #include "xe_platform_types.h"
> #include "xe_wa.h"
>
>@@ -395,6 +396,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>
> static void guc_policies_init(struct xe_guc_ads *ads)
> {
>+	struct xe_device *xe = ads_to_xe(ads);
> 	u32 global_flags = 0;
>
> 	ads_blob_write(ads, policies.dpc_promote_time,
>@@ -402,8 +404,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
> 	ads_blob_write(ads, policies.max_num_work_items,
> 		       GLOBAL_POLICY_MAX_NUM_WI);
>
>-	if (xe_modparam.wedged_mode == 2)
>+	mutex_lock(&xe->wedged.lock);
>+	if (xe->wedged.mode == 2)
> 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>+	mutex_unlock(&xe->wedged.lock);
>
> 	ads_blob_write(ads, policies.global_flags, global_flags);
> 	ads_blob_write(ads, policies.is_valid, 1);
>@@ -760,3 +764,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
> {
> 	guc_populate_golden_lrc(ads);
> }
>+
>+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
>+{
>+	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
>+	u32 action[] = {
>+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
>+		policy_offset
>+	};
>+
>+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>+}
>+
>+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
>+{
>+	struct xe_device *xe = ads_to_xe(ads);
>+	struct xe_gt *gt = ads_to_gt(ads);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct guc_policies *policies;
>+	struct xe_bo *bo;
>+	int ret = 0;
>+
>+	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
>+	if (!policies)
>+		return -ENOMEM;
>+
>+	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>+	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>+	policies->is_valid = 1;
>+	if (xe->wedged.mode == 2)
>+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>+
>+	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
>+					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>+					    XE_BO_FLAG_GGTT);
>+	if (IS_ERR(bo)) {
>+		ret = PTR_ERR(bo);
>+		goto out;
>+	}
>+
>+	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
>+out:
>+	kfree(policies);
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>index 138ef6267671..7c45c40fab34 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.h
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
> void xe_guc_ads_populate(struct xe_guc_ads *ads);
> void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
> void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 0bea17536659..7de97b90ad00 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -35,7 +35,6 @@
> #include "xe_macros.h"
> #include "xe_map.h"
> #include "xe_mocs.h"
>-#include "xe_module.h"
> #include "xe_ring_ops_types.h"
> #include "xe_sched_job.h"
> #include "xe_trace.h"
>@@ -868,26 +867,33 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> 		xe_sched_tdr_queue_imm(&q->guc->sched);
> }
>
>-static void guc_submit_wedged(struct xe_guc *guc)
>+static bool guc_submit_hint_wedged(struct xe_guc *guc)
> {
> 	struct xe_exec_queue *q;
> 	unsigned long index;
> 	int err;
>
>-	xe_device_declare_wedged(guc_to_xe(guc));
>+	if (xe_device_wedged(guc_to_xe(guc)))
>+		return true;
>+
>+	if (!xe_device_hint_wedged(guc_to_xe(guc), true))
>+		return false;
>+
> 	xe_guc_submit_reset_prepare(guc);
> 	xe_guc_ct_stop(&guc->ct);
>
> 	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
> 				       guc_submit_wedged_fini, guc);
> 	if (err)
>-		return;
>+		return true; /* Device is wedged anyway */
>
> 	mutex_lock(&guc->submission_state.lock);
> 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> 		if (xe_exec_queue_get_unless_zero(q))
> 			set_exec_queue_wedged(q);
> 	mutex_unlock(&guc->submission_state.lock);
>+
>+	return true;
> }
>
> static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>@@ -898,15 +904,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> 	struct xe_guc *guc = exec_queue_to_guc(q);
> 	struct xe_device *xe = guc_to_xe(guc);
> 	struct xe_gpu_scheduler *sched = &ge->sched;
>-	bool wedged = xe_device_wedged(xe);
>+	bool wedged;
>
> 	xe_assert(xe, xe_exec_queue_is_lr(q));
> 	trace_xe_exec_queue_lr_cleanup(q);
>
>-	if (!wedged && xe_modparam.wedged_mode == 2) {
>-		guc_submit_wedged(exec_queue_to_guc(q));
>-		wedged = true;
>-	}
>+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>
> 	/* Kill the run_job / process_msg entry points */
> 	xe_sched_submission_stop(sched);
>@@ -957,7 +960,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> 	int err = -ETIME;
> 	int i = 0;
>-	bool wedged = xe_device_wedged(xe);
>+	bool wedged;
>
> 	/*
> 	 * TDR has fired before free job worker. Common if exec queue
>@@ -981,10 +984,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>
> 	trace_xe_sched_job_timedout(job);
>
>-	if (!wedged && xe_modparam.wedged_mode == 2) {
>-		guc_submit_wedged(exec_queue_to_guc(q));
>-		wedged = true;
>-	}
>+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>
> 	/* Kill the run_job entry point */
> 	xe_sched_submission_stop(sched);
>-- 
>2.44.0
>
