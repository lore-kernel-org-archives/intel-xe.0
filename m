Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E4EDE9A7
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 17:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D877010E14B;
	Tue, 10 Sep 2024 17:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPoh9hTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA24410E14B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725987887; x=1757523887;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wHBifidHeCBlEyDY5N/AZyday9GtxY84XJ3q3TFmSO8=;
 b=jPoh9hTI30BDWAoy8ljOaj88nyHpEKuHgiqzc1QhSoSsZylh8wh93qQt
 5ByB2oHKGc3gOaX7GWg4C3aJGlXEk2DO85ccsPwvbWnEr4hM3yPelDF3K
 chXyMzxBPMDQmyhf4C3RveB/xm/emTdQsrW7hxuaiQFQV+bfYXqVESQzk
 8/uGrXRq81WW5HBXWbwfYiGt2ZgGHbmgo1d/4X1WXvrBEs2QRhMco6/vS
 WpaoX5xVHTm6Po7vOM+V75L3xkbxLawbhf9jXv34jiIKaHFLuNOUfqiFD
 s3HOUllMhtD0FzocGlDncTqLCciPVcQyKujnHNlPnreb0Q59k6p55jR7M w==;
X-CSE-ConnectionGUID: LSCaXerYR3iGyb/cAXwI7g==
X-CSE-MsgGUID: EGyin3WUQAeXMQ/f5MLsRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24568843"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24568843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 10:04:46 -0700
X-CSE-ConnectionGUID: MixIa7vQRqWsZB1zvGQ+Xg==
X-CSE-MsgGUID: uUGiIf1iRQSijWqpWbIZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67333992"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 10:04:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 10:04:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 10:04:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 10:04:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 10:04:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1Ni/ZCYezke4L5Olv4H5Xiw/HyBqRa4INMagD89falatWd/ebq4MzqHk6O7wdMHmN0tu0uM2l9RgM7D0BP8vCc2tDLLME54QI1eK6rEG5sMBOSL8vHTLiCQYSpT6OnY/qrKGW+C1WyqZYSNFkc4vRz9eRC7r1+x24qsG0+cadtb++2tCOV58tuGvaSmZ8VbuDc7pHk6J9AdS6E3xiTmzYO6xJeqB1xEtVVW1Ujf5vkHEhxq11G5f/DCeGxlR/FYEyYdd0XZhn6sz0IA0adjpFcff795NVHe3BkO0iO7TLMg/UQ5TJ7OoO+DRht8QCuWYchl13LGnnxMy5fhpnTkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DoEcYsIMenQfOwD29J50qsYLCXQzeoNS1s5HlpcgOk=;
 b=BbwdsuevXUa/IyJ3YJjDjLBZvF13BZ3G7GvENIsp4jnvejP1M7d/+fcoVZL9v2WePSIJ3IH4ppOT6i/bFSKKDIH+lXJtPiR/i5cRkQr1MAUh7i2/25XgCmkEh/wC3o2K5sILjSpT+D+GGpWMf0Ip6RDwecu8hBFky8COHQmoidPYSnh1x/msHdI3eazVPD7Dt7eCA5dV726FNkvVtX2+bsuFgqAWZ84x8fzpHt3hIBBAuAIWzBkC9VTQD2IuLweFmT3oILmwfNK/Re4HARbPVJHzCxWBkRj7YuNIKXhXeoNviOXRtO+iOdnum6WF8lju0eWHFPlv2g7hXNJou6Vdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 10 Sep
 2024 17:04:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 17:04:35 +0000
Date: Tue, 10 Sep 2024 12:04:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Enable Xe2+ PES disaggregation
Message-ID: <t7zip5kycyg2rtnzesno5rjlkdfu35idee6fk5sn2purbif5wm@2qxutmrlwj2y>
References: <20240909165933.2638765-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240909165933.2638765-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: da4a1203-ccd9-4045-9a2a-08dcd1baa563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e6RGOAlAhHKSyxIZh0ICvWgyiL4PuqO6DoJhGH0lpQx6it37LuNcmL1HwdtT?=
 =?us-ascii?Q?h5VOzzJnuKDzvbej+qcIbUROpfM6YsQMiN7rXAgk4IvkHtCQrp0vp7k9Q6zG?=
 =?us-ascii?Q?wADCbafdTRXsOBHfOvf2EMj9aYd4K9Xd/FLdzRpk1C2/xXA2gVtIrQMSUMUQ?=
 =?us-ascii?Q?BVRwgPkC0BAzWDzdxboS/J5F7pp7dh9Fwg/7tdcFvHsl2mOHK+1gmsNfUeBs?=
 =?us-ascii?Q?X7IgBr73cMOUWe/3/sX1DhWMWCwYIXdbDs1jnikwim/erM2k+qT7RCTr4hZ2?=
 =?us-ascii?Q?74MG4eoQiZA+raZku4PrLuimm0zMjU/9cVIOlxc63EoEdSf3lWvFvHEMDG2o?=
 =?us-ascii?Q?bqJhenfODxFQnKvxGArx/amLxZzOL3f5+vuX2lbZ42EO54h18se03TekY8aI?=
 =?us-ascii?Q?0Olvaviq3aOABAIiWqE9+3l22f06qecFD8SUKBrI1ivwIXflBxS1qkv3jeyf?=
 =?us-ascii?Q?oPHoILJi0ww09W/0sFMbZh7Th8NorC5B56lULQCE/NG6jKZ/ES9Dh43D/YYD?=
 =?us-ascii?Q?yUvlthCKoBPBPx4r83faLvQwZWPI2WmtNe6gkeR5h9K6RZf5u7hObfAGUFDM?=
 =?us-ascii?Q?EapUWiUY/z8TYIgYL7eLRfCvcDcCgB+tzUwM2ZEyIHIvXdYhMS4yDFzCasCn?=
 =?us-ascii?Q?Z7WgNZiR4YFqBjYoBP46k2P9ecLMTOilz2+OJgUe01U3w8FXbuXoTYR7a5sw?=
 =?us-ascii?Q?XWw2O5jwwInp8LvskJ4KViyeq81DluIj5fp2udXZMKy4DA2NBlnLt1EnarXo?=
 =?us-ascii?Q?OBkzGHEhfFnmficg+whqgfUHmHAxiNNjXeK/lkulhrBCnmOxap82Yf3dnhx6?=
 =?us-ascii?Q?4hSozjs0NgfpqjDymVZcb2DLNsqlQkz2W7tJJQSRIFS4GhnCrjPmpMn7BIqO?=
 =?us-ascii?Q?AfO+haNzkDkIbYcI8IHJ/GfsjvSa/E2o93bbc4Lt+p8HALCsi19NCugDfAUi?=
 =?us-ascii?Q?16sgmvdcjgCLq8BnNvtkbHWRwv245DC2ZKZJQsruZdjI0SQC82n+d5oHuk0M?=
 =?us-ascii?Q?pwbm85SWrll1FgW2qw0HvZfcXKKXXE9Qv8uULg0dX0YJ3GPwg/9AD0PDlK7I?=
 =?us-ascii?Q?VZmKFJmaAxgLyTkD/CHDjzOzk8YAuBKfxhjq+HpqS/FPfVVXLEjTkBprJ6E0?=
 =?us-ascii?Q?iX/ltuhLWSyqwN14rwod3TRxio4AdoVXSJ9ekl6OGgSiWDc2RxA4fxxZ4L4r?=
 =?us-ascii?Q?SjXyudzaNWXT4rfOBZUZF/aDpkMWPNSTh5YVnzharh5puyQGUxrsh0XbAWrc?=
 =?us-ascii?Q?HDcKBIaUJrHyuGqub9sbZ9Cl20h032+ILPlOqWpdUeNh8KolmZCml52dMGBl?=
 =?us-ascii?Q?jkfsttFWQ0xPP6QhSwQCt/KYw2OmFnQqXO9G8tRVwj3K5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yxdNVDOZQYvTFz+spsehpVNx8WR+8rCD2z83A9TJ13KOi6xaijpct7sZ+L5g?=
 =?us-ascii?Q?P4KdBe3xOFNgT3uaZqc9XWHat2+qiU0mZJ7IJj18FPqMDb236x0aR+dcbHGH?=
 =?us-ascii?Q?bxAlLCb9Un1p4hVmSTLzPdCFt57I2zXO3Qf31E8BS9MNjwWaC64rKxB1ds7d?=
 =?us-ascii?Q?tfJ7yFjbQHN/enMCIU8691mfa0TK9Op/GHct6HFdBwJaUfz9CNReOr2Mt2hF?=
 =?us-ascii?Q?3U+xWxfYRkwyMMuzao/IUJozjt0S/VKylDGfpPoDmNZMWWdMe61o8Z1Ik0lR?=
 =?us-ascii?Q?88nhqcGGpi/n8Z2xAUVob5PxueAEFD2uUP38qSt/Uh04TL6vQKSwu5bET8Q1?=
 =?us-ascii?Q?v18UJLlGJIUErmG29w77dfdjSOsy2KV1g2tWHqkSZVdfzfzx3HZsDzatAmbr?=
 =?us-ascii?Q?bJnYMQMTXnM7ekLQNkdo8HJIkVse969zWVlqY1rRIGjSn1UEbAeiWQPAAZ89?=
 =?us-ascii?Q?yFuIgreDYLhMSFt4DNYVjaTveGAVsnGBj7cbAz/tBgdDwPBmLs4C6vSH0rQP?=
 =?us-ascii?Q?K7D43DPNWdsl05rywQhDgu5keX+yXxZtg1K97SgWnPx4L0fIcmDoqsHd+qHI?=
 =?us-ascii?Q?WwcaN4OnSAiPBihMTSZ1pX7w8FJ6YSXBPM3iAS4NiMLFSzkDYo2imuSHdBGW?=
 =?us-ascii?Q?9D95roHCBMyGaVZYTSNnG82hgAOgfOBqHJro+dD9/MZED61/XCmcvmiQaJb0?=
 =?us-ascii?Q?4uXNO9paWoGcZ1SGrHDUyZ6aYqzSq9ihgzWOkvL7v9x3EjtGc91pamPazV9n?=
 =?us-ascii?Q?9176FGPrwVlbQGhERUKihuAn///kxnB6Evni2Ojpn61GwFMgNT9V2zZTcRHG?=
 =?us-ascii?Q?MzHMzcykVnSinMPj48ICfDHdruyQoeuyFHQmodb6Z2szCs08eZO/TY6+pU3F?=
 =?us-ascii?Q?X60tDKmVF0TSd7aairwN3HPfy0D/8bYy+EN7qN+ygXzR83HrNlcQ7kNCQmw7?=
 =?us-ascii?Q?Yz5GvbrK+W6BbugxfNEG0ekAvdk94qXB/iCsn5yL7hqW4uOICaZfusnt/gTQ?=
 =?us-ascii?Q?8/Jyg7rRKPnZy+l1aLo+XdV9jBZ6ET3hDmItn6uu9qBpo3zt1coB0IabPsJn?=
 =?us-ascii?Q?YXu5hWdoDxzAePUbqBRkkNj0H1FzfzX8qd3FZ4NVVw/Y+0YILkqQfOvk5Ozr?=
 =?us-ascii?Q?PUXgJ4pgC3tezYG6BqJpPFYhBdVROlONuIMDlb//p+XHWpevxtunEZs7XmJz?=
 =?us-ascii?Q?Nvol1xNfIjZJV9w+d8kyaTaV8LXV+cJBPz227SwhlQjED9ppPPR/1rR7hK6T?=
 =?us-ascii?Q?pHwj8cpe1lLTyft6JN/eZK54OYNwxczMktk5q9uSF7a9oJPTKYf5uATf8J7b?=
 =?us-ascii?Q?tiLHF3+bSM4+BJ+Ceg2KtOR8bpEel80BEpIMYiiahkJ+oi+cmy+F5D8ZATgn?=
 =?us-ascii?Q?kfi5BuAoJX5aVXHyv5QysDdssJGtiCLpZTLs+uqTjH+R1eMiZi7sOZxAuDLl?=
 =?us-ascii?Q?Mus4tebXARmZ6gHG9xACeQ97kOo5Qd7wOhjfF6YnvgsmQLkjJNnmslIKCLQA?=
 =?us-ascii?Q?GKrAbqgeN1u3MD6vIp3UORhAaJiR3G1ROlJ1739q2f+JOdi7cmdwHl82tI4N?=
 =?us-ascii?Q?d3MsdaQr50xBNxAc1u1FKiYi3KcwCdktU3vv9cIXTvSrBIPTAmYIbDYRwcDC?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da4a1203-ccd9-4045-9a2a-08dcd1baa563
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 17:04:35.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TX6+sxv7o+XWo23YiHmEKkM2nTcrRq1M4KXndSYwB10ik27a2aR3ruVO6d+kv26eQiU/D0N+XStZvMYoyoALxrK+yaAhNzRsVXge24ElDLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
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

On Mon, Sep 09, 2024 at 09:59:33AM GMT, Ashutosh Dixit wrote:
>Xe2+ PES disaggregation for OAG needs to be enabled to obtain disaggregated
>metrics when disaggregated data is needed. There is no uapi impact of this

it looks like the *control* for disaggregated data is only available on
xe2 and we always use disaggregated, right?

>change.
>
>v2: Minor change to commit message
>
>Bspec: 61101

"Note: After enabling desired disaggregation mode/s using this control
field, PES MODE_SELECT field is used to configure appropriate
disaggregation mode of corresponding PEC."

Apparently MODE_SELECT == Aggregated is the hw default for xe2. Don't
we need to program anything else?

>Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Cc: stable@vger.kernel.org

If double checking above and this is sufficient, feel free to add my

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_oa_regs.h | 1 +
> drivers/gpu/drm/xe/xe_oa.c           | 4 ++++
> 2 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>index 1189f5a540a82..a9b0091cb7ee1 100644
>--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -52,6 +52,7 @@
> #define  OAG_OABUFFER_MEMORY_SELECT		REG_BIT(0) /* 0: PPGTT, 1: GGTT */
>
> #define OAG_OACONTROL				XE_REG(0xdaf4)
>+#define  OAG_OACONTROL_OA_PES_DISAG_EN		REG_GENMASK(27, 22)
> #define  OAG_OACONTROL_OA_CCS_SELECT_MASK	REG_GENMASK(18, 16)
> #define  OAG_OACONTROL_OA_COUNTER_SEL_MASK	REG_GENMASK(4, 2)
> #define  OAG_OACONTROL_OA_COUNTER_ENABLE	REG_BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 63286ed8457fa..0369cc016f6ab 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -440,6 +440,10 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
> 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
> 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
>
>+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
>+		val |= OAG_OACONTROL_OA_PES_DISAG_EN;
>+
> 	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
> }
>
>-- 
>2.41.0
>
