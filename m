Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF411CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 14:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DF710F1B0;
	Mon,  1 Apr 2024 14:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSXQX7e0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBDA10F1B2
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711980947; x=1743516947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GMCmHWaXb8prD7sJ4EVvYIuqtxXgEomZi61mLlDdJMI=;
 b=FSXQX7e0QVykmoZ6ZbiSUETEWLWo7lxNAqxEUVgT1LUqwWRmSJe4a4pO
 uJjIR2u0PPGa8cgooo6AESY4TAWx4UOLWnk2ODiPoe/DDXpvhq1GrJiAW
 dqYk1/Z0qZCUWn3EWP4I1otT+l9Q7ChcySQgoGqxDYIDpPzbo/H6voGX2
 9j/89ygtu+17rvgL/zY5RGfNirnMIlU1guy0xcZN/6GpZ8e1lYSSyknJi
 R86R0df2QC8C9UA0pNT8quyNVepH+2vdGN8STch3SAv0i+BN2ZHN8FNXA
 y6TfDn5RsB8LxSkf9t5b45yX3m3t4ljGMhFY+JOWkl4RFMNlZSefIHHKB w==;
X-CSE-ConnectionGUID: 6GhbVqHlSeCThz4VhxcIfw==
X-CSE-MsgGUID: PzGuv9trQWC8cZwHlBGaSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="6972952"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="6972952"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 07:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="22387144"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 07:11:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 07:11:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 07:10:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 07:10:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 07:09:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URbJQ3F+a1Xv4noOHjw6yiw93GIt1cIpT8r7Y2KoAxOlXKr1FtKrvw3JJVykhBpWhucELyzzElQV+ZVKQ8uNqXzIioWA5mXSejOos7IuPY0fcn+aIwHNWCqwNSfJ/FBDAeFhAydwvmsKE5YBd3PA07xO92aTuD9wcncd1wp/MxDOnbU16pOEk7fVUQy8rSthEmwsnsK/ebjyZ3wj16DLnWyByV0+JcNsvm1+pYK5HA7pIOz8YZM5JCljB1P/o1a0OpSGFdyG0ozMqHIhA5JYxwY9MlIa3WDQVKxCfqZ/B98NpRsg5qCrSuSyeRsYaJItKoNB7Ct6uOH1czCMp2P+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Gp4Ro7hhv5THbTPTI+N8t2LRgmxcH+AshPfNfIfMVQ=;
 b=nlQTCyVsVw70c6upLaDrGStyHun20RcDckpQ73tB2GUdtz+USkcZRo9DF0NurxBWbuE6qdJ73D5P7+lselGyePwWIgdZQI8+fjdbYDXaNn8p2SdlA+1CW2TcSmMAPYbKw1XILF/5q32F2U5MhNbdqks9dcB2jFq37drVqow7RuxLdBNORdYtd2RuDn2vMfnxfEjYrVWDPRCb4gqAu2tg1B2FzpxCG7n24SBYfu78j/oUQaIKeRGLw66ZxM4TfekcaKo7yW6u01odH4Gh492/4LeVaWl36RFppXxbxkAjsqXFCLp80eqEoOBD30E3jRVFEijL9Te20U+ULKoIWOhApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Mon, 1 Apr
 2024 14:09:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 14:09:50 +0000
Date: Mon, 1 Apr 2024 09:09:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: Update xe hwmon with couple of fixes
Message-ID: <fnbme2rfaoiubj7mmwjl5qir246cn7u53b6jmgia3syobnhiy2@d5p7z5ep6eqz>
References: <20240331145340.4065125-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240331145340.4065125-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6349:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4KtWQye/PVX3VCmXDUA8iOQA5W9Q1R1du6LyCfeml9ijR9UdVPfM7rXQ3VpdXMgPbB7V4SHlpASbW53h9+m05JSpCjiPhDMC6Z7WCApw9PIB2KIK4jcOryB0hy+AGzlo+V4H75FPzi15VXP3lZTJLsf2PvLiwo3uxhZQ4EzX1s/A4g1SvERlwBl4IpOUA15CZEIl5fek5VipShfjXVWQOnFyiKXguRhh7r1jrkGsrF0tvCeMSEOJPX/CO8I/x28PexE2oJUYu6ozgzAOLg4K/H1+Ird81XpJmsmlg/PrAJDrTi7leIUSeeSvLLbxIbIhIanY1Xt+mTG2IYWGQCllJpbsxZXHIZShhdQNyb8B/oj+/l1UKbHN+IRweoaNveItYwd8/25rbs6UjJ+5mP+45UtJn3jEmWedFYEWMfoJrht/tyaEwOz9WPckkB79YEiVXD4th8yzcXgyFZ+tBbnP5ihyy3Jdu00aDmljEQmVW/KGmmew8uFiMTr7/Av9yFh8TCBtP6RCfvuOGoGxjBS3g5U9AXJOfBBHpG4BYbCkFLrpS8ZYFyCMu9MIEAHPC09rTaKFseV8kZHFtOH6FCGiNWdc99Fd8qJ+E+mRDKM4FDFsw7oa8OokD/lk+8UMM7BYn2t40+srTwASc9zlgzaazU4wR/ivKJyPRTmRXJRhSTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L+9355kQKIkHZFNcwgZ0r3BHTN13T9lFfbizPFAQh5+k4oQqfm3eaOK8nmGu?=
 =?us-ascii?Q?KnwcPDkYolNTnzNT7YvxhTdihww3JZis0T3txjrul77HhhR4xm+jWSyl1+iO?=
 =?us-ascii?Q?eNBfrWwjspxZ8uudn9gj0RqSTN8MmS1PTxBBX7bU8lAeF6/WAj5Ons+ABi9A?=
 =?us-ascii?Q?/IBQWFT7XUzApME29OeSD1sqzwLDa4CBxjlHd+VOB3clhRmukUBITQpAAsca?=
 =?us-ascii?Q?XmQIE8d+RilMu1sqj/wHKJsJulhCHL+5vmKYu0cG9/EodI/hDVSzyWI+XUYH?=
 =?us-ascii?Q?KTXKrYnwqKsM65GxoEO80BYMs8X7jGK3X+Ti0Jo7z5C621qN/GVQ4QJqsisM?=
 =?us-ascii?Q?cmG/TDhfm+1+fprKSalT3MugdCFKrFj8GrroOWO/4ABTzz93n3lbsk8NyomO?=
 =?us-ascii?Q?jzbt3e8SmXzoj9Mpt0BsN9JoYVotBhgTUsntg/lkrbbZ9pmDtE+XwKoc8R7x?=
 =?us-ascii?Q?FAneskx8hiw7dni3K5iOJYfZY640MwCoHkEmGdgpAjyLTTdgvhLSH2nPUWVM?=
 =?us-ascii?Q?6j5nNcgZVmnYmk7Ypefd/DvMZHhu0lBK0KaSL5DsLJq74dxwuKXAKrN5eN86?=
 =?us-ascii?Q?S7mbDPOo7DOeoDncdyJFAD0HD+eF/aKc5xOqlH3vNLp71eCHQ9mUIl1GQPqu?=
 =?us-ascii?Q?THl5xO40GbLZzZgG6v4P7F/cSX/UryxriQfOlmP5YKbjMf9xRMgHGu65fjn+?=
 =?us-ascii?Q?wnP5z8PFPp0yIVBsMUi8MoLqrlYa7WC0PvgqSqh7W7bus1jL4r454JVtFuu2?=
 =?us-ascii?Q?r2aoqqUu4YJ0wrzMvJk4jRelzIqoJe/ESNYSU2w8yKiQdWldxRY2FRXe86Za?=
 =?us-ascii?Q?8OkfKkmkoX+AIVzAyZOo927+5oli59mo0fYRLowinuFmRH2BWSbSHbSalIsa?=
 =?us-ascii?Q?A/Q4NTrD7/Gu4hc9y30g2N+659VQ/g10C+maMQXkXZcXIMQSNPvXn57+SfgS?=
 =?us-ascii?Q?kKksZlP0thJ4EeZ4IoIom6KUhKCoRt8B5RVvsUmUTqgsDBmJ1bDCgu9yKuce?=
 =?us-ascii?Q?qHafCHeMnxRXt1RKtZu3QGNvvovamVQK0ksFG1CyavHIW6E8QpAsth4L5hU/?=
 =?us-ascii?Q?2bk+M6DF2RwdDx9pT4i2oZSrOvebimlGrC7hY11eHXOQ/SzZyk8uChHP3m7q?=
 =?us-ascii?Q?cERX3af5YkU9vQxWLH62/cjUL8YunILCg+TFzIvk2ba2eu7pw5JyxvAxif/2?=
 =?us-ascii?Q?Aw85R821NapHOiTc9mLZ9EHnDE40UP51WGk7pTWog5d/Cl/SQRd2sARTkf06?=
 =?us-ascii?Q?ZE5uhVRoPH5Wihx+L9uhzSmTeI43XTWMKAWtrz0V4hStcUpw5YzBoxEOp44n?=
 =?us-ascii?Q?YqR+5lTg7inDsHfR77lDo1u6bLv9qqxOLcsncmsaebZ116HoxEfWOZXXiu8N?=
 =?us-ascii?Q?1IS1vF/+7e42SCL2SDNIBrTkwSqRm6XdMENspg8R+fk0vuLhSwkEF3vbxwx1?=
 =?us-ascii?Q?0OC7wEct3FAIo2EqJvJECDfvlIalbPQ0U6oKuV2wVDmEEVE/j+umN1NuFD12?=
 =?us-ascii?Q?KUcQAycu/kgG/n1KgiHupX2aP/cXUvZWS1qSPYVBc9vSMcbXi29qymk25s1H?=
 =?us-ascii?Q?pFZ3ptssxBGMrsPRDHlRTyajFcDvot6uQdji5/NQePeTmwdAvnXsCSh7J8yt?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e02f85ca-e484-4929-a4d4-08dc52556536
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 14:09:50.7267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJHNXtDaYxHdJvYkJj+fwXOI+0biQ6AZNQqnbw/otAN3I793i+1ZHoYBACoyQULC5b5NjXPWdj7kpPoIOKr9g7c908zZ87X1gYxH6cJUyRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
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

On Sun, Mar 31, 2024 at 08:23:40PM +0530, Karthik Poosa wrote:
>Fix potential overflows with upcasting.
>Initialize variables which were being used uninitialized.
>
>v2:
> - Rebase.
> - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
>   With this change caller function need not initialize value to 0.
>
>Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>---
> drivers/gpu/drm/xe/xe_hwmon.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index 7e8caac838e0..bc1bc73749c1 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -129,8 +129,10 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>
> 	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>
>-	if (!reg.raw)
>+	if (!reg.raw) {
>+		*value = 0;

The worst part here is actually that xe_hwmon_get_reg() is using the raw
value and that XE_REG(0) could result in reg.raw != 0 (even if the
register is invalid).  An invalid register has addr == 0, but
xe_hwmon_get_reg() should either a) return struct xe_reg or b) return
int/bool and the reg as output value.

Lucas De Marchi
