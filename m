Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AEAC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 13:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8042110FA0B;
	Fri,  8 Mar 2024 13:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVNXN+Jg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB4310FA0B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709905809; x=1741441809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gAVaeJIBZiJAMA060LKqjKdRHbTy8AU8uXhrjo8g6BA=;
 b=fVNXN+JgndKJgRSKjzmwYEDgJgEGlufkViv+so83BVx61RTMlvUMPlQT
 itQkBKXJMbaIlmetwtWYFLlhP1HIVXDFgvFma2p5xKwmT49XWy2WWNwSF
 8XchyzCFQZ4jxlXMLRoXGJwgtpQQdEmPrd97vYT22PD8tYh6EW4JpGoA5
 AZ6iHa6C7nJMPJv9Em0yVMgImq0c4hmnEonfoSdbyU5QhNEEQIxr3HRzx
 w0lgIlRV9hpOzexHBCZrFKCwgnwUZr/7U/enPKW9dTs0samMN65g0In0c
 evbzptDWpuRcLIPYaVJzsz3dRU1xFYf8o0e7NB4r6z8eT9Q6/1va8BUCJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27095503"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="27095503"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 05:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15164720"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 05:50:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 05:50:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 05:50:07 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 05:50:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fenK0nqwLJD0NCfjYxXxkLQA6SXZahVfcFeECnV3qkmu+zNetiaOH1MCTF+UHsZYULqimCjxWlEinxQQqNRIEIC93g7/hSi5upe4omMDBJRXBbt9cMUN+4sDu8qzXOISNjo27Ptszb2UkG7e/xE0WJyzt6ZPsA5vQPUIHfjQsfA2wHHuTE039erhbOvBAAny5KorX42nJ8zkTH8+HWaPlL/g/EyMlC45DZK6ZQDpfszVgYUAR2m4AcfkGyqui1LzgD6OXutmPAyDpsFTXHw3a9j0n7NFNTbee1Shv5JxP3Qn2LwiomdYpkdvVJauF86rN56ia8PM0nkDrcYabfyrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QkEIEuiKD03nEK50vLnq9kVXZ8DZl9YvB4iqaVqCl8=;
 b=G8rvpaz9VwYG7c/6WgcHfz7Omp33/pGv2hMZ7JpXJw+1ZvKXZ6Fi9XppQyZrTKkzOVUvHi2EIvMjz583iQPZXtW2huj3Ov1Q1wyKcvo+QbY5HLLOh92TIfol+C/fli/YuF5OfielIHk570Rx40rDABvyjE5hlTfpX2ui+pfLcVJzahsM3BPlUNhmni+DgEZCrLYIOJoQIPx4nBPfpdsnVQHjK7X+Apnbl25sQVjsZNSjbG31Ixd2sC9hS1zCRZ+0A1X5SQTPmq282y8TUENpWeVK2J/u8AG/NiIETIU+2x6TZcCQYlg8kYK3AZxYJptalTeEFp3eT1UzO8oFvdtxow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.10; Fri, 8 Mar
 2024 13:50:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 13:50:05 +0000
Date: Fri, 8 Mar 2024 07:50:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH xe-for-ci] drm/xe/pvc: fix CI GuC FW path
Message-ID: <7orfz6xq7gx2xisr2g6rspstdfue73ahrqt44eko3pkn3qrbg6@vzvgebsvu532>
References: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdcef91-1d5e-4f86-230b-08dc3f76a8b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCGg6DJM/aHYuoPCy0dD3bN2G4khhd2cqeauIY9KpiGRmgscXh2VLKjoR0gcRxslveO+zIcXErcRkY7QpLfRyyzhVhNb7780S7cAByVv90iOtEnARO9D855lurpjMoQecTBQA/ivw5x0Tr7Lw9tiKFimNknif7NtLhnSBi4/xtwJROWavAOcCFvYRh6W/GhEz+7ipblB4kHzdLpMySeJ1lsjYC41qeZdyLNBKUJVgtBPzBagE10fLqyUge4TC+22v29cVHQPnnpeIt24OzcxJW4vnW6GRedxxtXSX5KtJ7sJxU+ghPVpCsnvakQlnSRBxOqIDRf7PszVgegBYl+AhDxxcxsh6C1dxbiEWjowFPreGdqRF9XdLoQr5E9ma7B+lTdJyCOysTNJXCgdj/H0AkQaSOCP/dsATMITfSbMv/hKr24BrYpH4oeNcVfFtPIAQ+9mIDy8ns97QSidh3ogjeoRF2g3Cx0zpEDTgfWeOqgBC0AzmSugeyFofOtT05NNoEfnkz3a0S4jUZDWuQWSUh6V2+ugyfRPgTqIEwhMP9CFYyQrqEcph8GzAjZtcLwWiMi5LZ8EhLM0wzVWJPXKihoUzwlUuo7OPCldNkYn4OYEhWwHWQNhPViv27pUA/ilZFvYFEIWLKJwaME2YvdTV7pY/9IfZPSwsd7orQuM+rw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dr3+AO7RCDz7Cg2RMTy/MpU088zkPwozvUXEVgmED1AKoTh4pAZ9ja+isuTM?=
 =?us-ascii?Q?EH+72PV9DaaWHjhH+aahGsBKA0FoNoIXb/46RVSyHRU5pSQ7wEpO8T3xQzqp?=
 =?us-ascii?Q?ipPbbqqDWqp0+y3RjlKvSSZt2UxrRiF5Kly2OuImhbyGbf0XYifKiM3ncapF?=
 =?us-ascii?Q?/lL2ZABrUGgQGonHVbGO8R2Mx/QK+KWVRcIAo3SaCYizmZbhRQeX8ZqjPdyg?=
 =?us-ascii?Q?/4kdDhRvtU66Yq03Gt0TBwgIjuBfz4EbHUS6jJysT6BsJ54cH825sendszWO?=
 =?us-ascii?Q?B8OJ84rzwcXU7tiAy4mKaRYTcJ/ZbFjfkjuVK2FAIaC1MtEGY9IV2jTZcshK?=
 =?us-ascii?Q?Cafv1tEVa8i2CFKTVSln73Y7awpkLl7ADdH9IsPIcg0c3NHKmxrWBFZWVEYk?=
 =?us-ascii?Q?RsF0s7PTVKHRI8/qvRFJv8Fc+l3r2bbsTOgIh8yLlsyCnqj3f7mwlCX+aF7I?=
 =?us-ascii?Q?/de0Q1rCYkZZw5bzOnaJpTUIc0rwLR1Xa0k+pEVPRxqNDZwT0JzVjOh8zjIa?=
 =?us-ascii?Q?M6YJIjSrQGGkYqUR99nJXpRBvGqa8HsKEIQxs2daTtUiyMyimUeM2xNGSlmh?=
 =?us-ascii?Q?qJfOgGQT2USg3UflqYNRhTzr/+m+5lqvbnxueGA/68HymiF94e1ieJW5cZ+7?=
 =?us-ascii?Q?zgBSNKbbMwJgzlb2+7nJMHJMDYEx4HqMpcj+13XoiK7iO5Zwh16aAzgwt2Rk?=
 =?us-ascii?Q?gYBJ9aNz5UC9yAwbHDfeuILLIxORjd90zp05FTqiLQK6kfp3w+G6oudG7r0s?=
 =?us-ascii?Q?EMoYXFnqR/38/lCeHwN2p8G5Max0NgWyhKZcAWy1Lx4TzOCZ4AxMInyMpHNh?=
 =?us-ascii?Q?b5j5jP5R7OqcrWy4oUblKwISIP9tnxCS6FHALL1Z5uzVET3lIedAhWwCXeia?=
 =?us-ascii?Q?+Ozwj9hUh07fYac9YIy3Y3jsMfk/N5oGKZ9x/XPfCFBFBaw4SXM8j85R6XYN?=
 =?us-ascii?Q?wuOckmxadT9dLjiz5Yd3u0iMaErqz5GtgIfgUnN2F9h2jmA4/TKjfSOlq10D?=
 =?us-ascii?Q?c7Fvvr+jPV1BkwMqd5bmbRiT3icp+DzXl3yB6LRxmrjlf+v7lLIeyahxg5CP?=
 =?us-ascii?Q?I1DCKUZC9Iw/ZlwR2FFW5Qybeqjwd2BWMXNVqsnlvYMPQ8mAHY1hwS84YP+9?=
 =?us-ascii?Q?IWYvLDLcNTWOuMjoPRDvzhT73zP0gT3AmCfvxGsaZ76S7BVjcLjIzlBfPEVn?=
 =?us-ascii?Q?IOBDzF1VMlqqKavZsUUeE4D+WNZTMKjwEq7uVK+SgLr2FB2UK+eN5Ud7dRMR?=
 =?us-ascii?Q?2PUZicbKjxL4XHJw3EvVINaYMFbkmIH+sZqxC52JPtc5jZoOg2Z2yUaiVtGy?=
 =?us-ascii?Q?x0/mV0yPGFAVQeCa1359v6K8FhHWrb53kQYIxu7RbRrpeewwA9p5uSu4Vwm3?=
 =?us-ascii?Q?R7hQk1HB6woqQkGZ38+2TCAG9sdcFn2HNCqGghpFq66/pjR0lnqYDdLFm7Ld?=
 =?us-ascii?Q?6y2GkMp2G8xgi0j89cztC2bWwuY8UnOj273dJG39PK5sW2Z/MolEpfBQXKBZ?=
 =?us-ascii?Q?uTSwXpR7pP3ScvyqtEX3sXIYlbtKrV5MojDuF5TB8fpHPOPD/j/x8WQn0wmt?=
 =?us-ascii?Q?HYuj7aUR098xzkyOVRvL6f2hncm+64HU7zRIQcPf5aykCIGm4coiCCbvXr0d?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdcef91-1d5e-4f86-230b-08dc3f76a8b0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 13:50:05.3830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9BX9vChu4yTmZHQ0JIr0qXlQFb+BBO6sReUFIY0wamgSnvz1U27BuKdpL36WVJ1iTUXFn2CGoahXqMHtMi+pupCPV/Jt16dUuSD8twK0XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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

On Fri, Mar 08, 2024 at 05:42:02AM -0800, Daniele Ceraolo Spurio wrote:
>The new repo flow has the CI firmwares located under the intel-ci/
>folder, so we need to update the path in the driver. This messes a bit
>with the formatting, but since this is a CI-only patch it doesn't really
>matter.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>
>This patch can be squashed in the existing fw definition patch
>
> drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 7751d6ba6ce0..44b8c5f58fd8 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -105,7 +105,7 @@ struct fw_blobs_by_type {
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
>-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 20, 0))	\
>+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 20, 0))	\
> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
> 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
>-- 
>2.43.0
>
