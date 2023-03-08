Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B31C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218A10E0B5;
	Wed,  8 Mar 2023 22:40:12 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017C210E0B5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678315209; x=1709851209;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z5eyRep8YaB/96+viN1onp/34iGhU400cN5eNUWPqbA=;
 b=IMGDh/5Vt76F8wqrJ9UCRj2O713N9QjVgTzhTJSJOHuBuTUKyl0QwJYg
 EG0Xfpq7OTWVVxoPwcQaoiiWimtpBlnXeL77NecloVuukl3X0avDTQO9n
 ZtJz0582ALEvqojMgNITWGHOu4EKkyi4/KWWicUlvpUSge2XGlcX0SP2H
 TVsRTueB1nhU8/UBRPyHM3XE0WuKZY92QIFAJuR+YHqI2vDV4g3Iz2GOC
 aGDcIdafLYZjOPNE81WWwPIbUnFgGU0cpscay5ytePCxjjFbNwujdBgBB
 4Y++MQqHFhUT0ISfz3fhRbhrnsi1nPZ/9cVenEHo/jyqD9dvPCDw8AAJ2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315951843"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="315951843"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="677160449"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="677160449"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 14:40:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:40:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:40:07 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:40:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHKBwUouzgtKgy6DsATZP4g8yRTGRMstXLqAZZMXxG3tDnN5GSGDBcpZ+RFECWje+FuZjXMyLV4xqkxKlk6sz+yTJNzsAgt6yqPUWK3HpO/Kzr+py6MLX9N2iV0fFC3w3HCHBuJlBjZ+ZxkzEL84E3URM2YJhgpredMFnsg64w/ddIbnnDShvftpveBRSOY8tvUynl1VSFP8Bsiav09GZ6myqy6H8Iq8UjI7iyw3sz1KUQhGV9LkdSNjz0gvnbCqj9bS2xCXmnbKMbafs8c8emNs4JrPrhzCBDYCPdTbVXp1dzhcG6qSAKGmtiGXukZw0F9x8Hr7I1xN+Di6kxQ7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lx9LT6j4qi397Ee3fPk+8bCELJOiMObGcMAoeVevSyk=;
 b=Uuh1Qh8lC41XmLZQ4anvvb+R/e7cERq0qfh59q2pyzYJZhU8NGG2X7fFRbaqqaDqXxUBlwd3tg349HiwYYVihSjq6CCdNLHB56AsJkDl6lTTBYvsFAqibUBQD5MmPwq6OUyEy0VG6nv6tyPS+Qhmd6KmexRfqMBJQHsi9jmtFxCSRpb50sXSjeKe4KTi5puFsZ9fkGErXUdhpdteZifs2g1dK0KKJoIefKwkCPN5bDFRwBgh931VhVAPfoV4dvRZgXitDApOCHWEdsZuhsXWmPqiZdKjqMss1JtdyzbY6wCjFe7eLR9vNIn78p6ddNl5R8M+9T7N2kRRIyiG/fGn1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5562.namprd11.prod.outlook.com (2603:10b6:610:d5::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Wed, 8 Mar 2023 22:40:04 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:40:04 +0000
Date: Wed, 8 Mar 2023 14:40:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308224001.GG1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 56637d5f-1bdc-4342-72bb-08db20260f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eX8CAH44ljVA1x6i7syr4JSujKoxkZIOsD0bPNHqgRPxdc5rE8qIirfBD6klcWTkcTfbCN1ghC9KZabFF7ALuWDUG9w8zVsvbQPa0mcKxbzZBM2HvcmWeOigm35H10DOnhvdDXgBu6kcs0F3Os5/f58CgT32IW4k/b3u68ZPMErpj/dF8MkRlbVjoLE0vem8kefEgqWdh5OQt4VmXax3/+NUXzEXChpsvM9Syi8dzqpXE4puDLyeXmvDdC2v/oe3K4GBLp2Xi2iuSqrqwOoB/oee0Ap6IQohdmHt5rZoHhFMVR3X4iAKHWi9CcI23IXsTWDt63Cx+fLpROTu1ups0LDzQCD8qyG5PwXYFo0YZWahrIUPrOoiHMyLD5WeGp/p+MOpOz4fRTaPFznzz26ccN8uskfBdhfJaWsGCQZ61O7qwadtni0mniV+dPgDUHwCWmCpZ+/wZ/+0Lod3Um1oELzTZzHKkl4zeSTkrkXYP1K1YsknefNlYo3XaxZ1aXE4MCO11Js6k16s6kMB6SX3N2dEgxCNT2/rYjxFfQ/SuyPUtZBuOIp7elqQmwSYgbrFdcjJu95peHmy/cSvBzVeA0LwiuYz+kG21fTvy3mUSRK0+p/optceZ0GT3J6eOuCx9l9Z0ZtookBuqn9dSIejtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(26005)(8936002)(6862004)(5660300002)(6506007)(6666004)(82960400001)(38100700002)(6512007)(83380400001)(186003)(6636002)(86362001)(316002)(1076003)(66556008)(41300700001)(33656002)(8676002)(66476007)(6486002)(478600001)(66946007)(2906002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zHzD1qfe4dFpfEX0d69zfeF7rIDmKK3qHeIB1hCM4u6yEbYp8+55FKe/7XLU?=
 =?us-ascii?Q?6MzS6oayfiK672x/YCP8VampOiSfcrjukfxwfDJZN7g/voMsB+LZxwZXqwhg?=
 =?us-ascii?Q?kVp1hAm+UEB/31L/EUzicEQNNPuvnCVCSy3CXkOSgAiWfKffzLVR3qHrgLrQ?=
 =?us-ascii?Q?Es+J8FlQLFVGVe1DaINNO9GkIizup02qTonTzCb2TNY2ZBd7TdNAK0JkjH/D?=
 =?us-ascii?Q?P3jeMojcA1fCrj5svX6OaqHThrXnAUBcMy3Ia/WO0VojgBvTuesIn7jNH9S0?=
 =?us-ascii?Q?sR4yh+nTdeisOyNT6aEody5EfIfKgEKMUl3//qsIdZqVzhBLAkp7sr2DFiu0?=
 =?us-ascii?Q?P3cZovHF0VPkcShD0LVnKDzUNw9QPnAPRefv4rq6zZH9E/6dw+dzp7rSuTRb?=
 =?us-ascii?Q?XA7I75BcCiAE1IiyvvFKhdSoK7aWhtoQOsohI4QA7IN+YNJUFULzSSnCXxDd?=
 =?us-ascii?Q?KOKZvKHyESMmdwGIKVZC5SLbJzT5XqGgUgc+uqSjuEEU5FgnyXDy3rm6Bvf/?=
 =?us-ascii?Q?TApmG1icmXXFVS/iZI6ae8e/vB4pALXXFvVZUD7Qa/M+cLqcaN4tqDuN4WVq?=
 =?us-ascii?Q?1QiEINWXAiCOZGQ4QMLfcIfY43v7FU2NUmrcGT1NK5drQDz/j2MfQcHXdIYi?=
 =?us-ascii?Q?xa+UZHArxzXa5qJsHW9mxuBmA0vAJiCipbK+K9UI1b2WwfanpCSPzOd3wM5x?=
 =?us-ascii?Q?dWpa4jKcNSGX3vIUrgXyysma8TaGPgRgNLramYBiMZFHby0jg3W/dcZ7uYzR?=
 =?us-ascii?Q?IkiSF/gRhSaRYaSBg58h9NknEc2pyg4BnyQ0Hnt+i0ii3jDU8uhsxmeAKuCa?=
 =?us-ascii?Q?9lk3ljJBM8rLpsQsQT9YYgkFioKzpm22u7OoPTXOuekn0UNHn3IjL1ufa1BZ?=
 =?us-ascii?Q?iW1uaETVHK07H5ftZ9wneXIB+cyNrebj2F6D7apWNZCdJgn7c99ylX36OP82?=
 =?us-ascii?Q?dkT6RRBszIo7B51ERmssANFXTUiZDRnHt/Y3WZQgkmcll9PhGqZrn0fAKcuO?=
 =?us-ascii?Q?jL0flm7BGx6qUUto4kRz5bT1eq8j0ImOMRTG0cTLO93ZEz/dQGztQCrPlBFb?=
 =?us-ascii?Q?s5mmwXEcR499f8jbCztTthMsiKBjk6cOlYAaisAdLOj2ApvFBtW+voqvn38s?=
 =?us-ascii?Q?x+IzF8Nso6wQeZm5pBhPIqSQKpCNHEX4PcBes5Q32pMOzbTVAThSnHOnQCq4?=
 =?us-ascii?Q?kGeqQ1kLSfUPzc3N7F7UTm+gMUrhX4zFqinbSW6+tOYYh46fBH36SUIWvd1Z?=
 =?us-ascii?Q?mpe1x7qBTZ895bTZTGIQZik7YSTW+8kuUjNAkRA3yp792w9lI1UmVdWwgfuA?=
 =?us-ascii?Q?ah4yc/mTnbPfBZUwjccLohmI5mJrTNmIjVAQLslfvSL0ZwCZriCRyqzBVdsS?=
 =?us-ascii?Q?eURhMMPFvNT2np5KiF5j9+dvElnSUyvOARiaXeE0pMGWDUndKPUO8ibdqS0d?=
 =?us-ascii?Q?iVwhL3I/lfnfyPGBqjkOQD52ZjazY9W5F25Vl5jE7K1mfi7B9H/rRDmJWOtc?=
 =?us-ascii?Q?7v6N/40B9JLdRC1G6Eb/DsBRzsECVha7KiUgD5Ckqd0UyXpKRb4Zic5L3Bj4?=
 =?us-ascii?Q?FYAmL6SMq8hN3nulXibl52bK2tuycpTILJoiCIc7OAHc6o6yeZ0s65cbEp75?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56637d5f-1bdc-4342-72bb-08db20260f48
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:40:04.1715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4IvCHjgdfcJIZmkbd59DM32zLvsxsI/OPsRWVvX63VFkT1+1vbWFc5itABcbf2EoqQ0QZa3ozyXPyEzv0LzGq+7C08KV2ebp2I9E0JXWzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5562
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 12/19] drm/xe/pvc: Remove A* steppings
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 01:24:39AM -0800, Lucas De Marchi wrote:
> The PVC pre-production A* steppings are not going to be supported in xe
> driver - the steppings are important for the WAs and since we are not
> adding the pre-productions ones, there is no need to add the stepping.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_step.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index 14f482f29ae4..ee927dfd3eb3 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -79,14 +79,12 @@ static const struct xe_step_info dg2_g12_revid_step_tbl[] = {
>  };
>  
>  static const struct xe_step_info pvc_revid_step_tbl[] = {
> -	[0x3] = { .graphics = STEP_A0 },
>  	[0x5] = { .graphics = STEP_B0 },
>  	[0x6] = { .graphics = STEP_B1 },
>  	[0x7] = { .graphics = STEP_C0 },
>  };
>  
>  static const int pvc_basedie_subids[] = {
> -	[0x0] = STEP_A0,
>  	[0x3] = STEP_B0,
>  	[0x4] = STEP_B1,
>  	[0x5] = STEP_B3,
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
