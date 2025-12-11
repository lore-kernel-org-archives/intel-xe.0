Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF223D43356
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 20:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A9A10E12C;
	Thu, 11 Dec 2025 20:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OyxbJRmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76FB10E0C8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 20:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486366; x=1797022366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XoiMcd3YuNxLp36Ip6BrJetdXLFxO6dvcYKXQHMHyWM=;
 b=OyxbJRmn/6Ww99on09jt58Ryzoe4B6BFjeyeVhLkv4f7cd/Il52uYFJe
 Be8sF5b1eIUB0pP9qpofg3FJW5KnIfibHfIt5swXUHUm4G3oKzEL03Ybj
 YzjtJhr3i2Lwo+FdlqTPRPOkReGKxhFydloftqy51UCkeh0xZqJJyU/AZ
 Xk1hWuDpikhR0+pkYcSNn6R79SVWbnJAAv5khvo9HlJDOZsnfGt5pX+Sh
 m3Tg5yMLmWnsiJPv+Uk2wFeE6ARp82b+Oh4XoV+cYDtp9FrnSRtrLYouQ
 cLWfQMbbSR/rMcVoshJWGtAEAnBTlyZ+2yxBNwV/kOQGAYGUP8w1wZYiA A==;
X-CSE-ConnectionGUID: 7CofYal7SoWhJ2KI2y4HlA==
X-CSE-MsgGUID: x9XRnlHvS1iOq9De6Teldg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67409852"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67409852"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 12:52:45 -0800
X-CSE-ConnectionGUID: Cw/ubtM1RUWio7SaYBdYhw==
X-CSE-MsgGUID: 6s76LQHSQTyU+FQsJHtGJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196892825"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 12:52:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 12:52:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 12:52:45 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 12:52:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8/j0OIk7eOQCpSdsk1Ctsu0ikdXlEMdolKS63XsgBW4rb1m28hAcKJ8+J3Ds8LZ5I9DVORkkTOyOKCfLwi0xzo51JvKOogDNpgVFSI4ylY+eMkUTkjbHoWiz+GVhYC9Jyobe5F2SV5gFA6eQFE3aTWKsfPxPVjmHtFeVQIZFbX8W0ovwwdKJ3R2Y16RiGrauu5RpzVtnikq9eEIvBG5OXHD2neXS3CDJNqy9vo785SDmerNE6D47TnMKbF+O/hJ7orL/Z1csdH/myVaLwVLDd9ybMhzjQU/yEPsEkemKKzbfkUz0T8Fzj5gOf4mtxTUHBuKqq+JaONr+b5Hc37lKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zxukaCIj+Z9hEXsQLvZ15yiPa3fe8FILE4UfoAw49s=;
 b=DsvybD6xost5N2ynqobruI6ciuXVAqQ3iZt1Wfj1Yw3ZIJOpf5z0b625nbYRzbXWeAb33lHYBmaEhI+7SCG/mXP9h0kZ0ROzKO3B2hXsSu8Yvzh7YafaAScJQkoxzg5+t1ATz9nbLOC5IVnBA2FnZ/BlL5E+9vrH24mt+Oyl+rhduQPjmOdKUk8vA9zQdFFmgq2sBaY7w1w+QyAiCu68tY+6qIBH63Yhqur029pROeouijcCUUbAYSbQLD4y05jjKVAV7/OOFQtp4Y0WiWNVfo4+nhW3L2Cf3We6W8aNCQpUWObzeI2tfE+zQqHCwjSX7RIqKAz9qfTypCPgDv4b9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 20:52:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 20:52:41 +0000
Date: Thu, 11 Dec 2025 12:52:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Increase TDF timeout
Message-ID: <20251211205238.GA3956769@mdroper-desk1.amr.corp.intel.com>
References: <f95d5884e2ed41aaabd83c319c96d309442679c2.1765485659.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f95d5884e2ed41aaabd83c319c96d309442679c2.1765485659.git.jagmeet.randhawa@intel.com>
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: e03aab52-b3cf-483c-a3b5-08de38f739d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QTbS1+0Sxd4xEgntmkGziHT3nOCRHdLoNfI6atVJgjOI7yZjrYA4R3UUyfcg?=
 =?us-ascii?Q?YyAETMWJuKh+0gIoanEhlUcERUTHBCgGbpju1XLvwLWQPQCDGdblKQUWzPl3?=
 =?us-ascii?Q?ivHquPvbawfJ8/SsvdUOxOaAHsFwprILI1hL+hDDxB0r+BAlfLuas0kMYYd5?=
 =?us-ascii?Q?/VcdYyecCXZzMPi8pAIITlT7rlIN+v1bnA8d7C3IY8AS1LB8J18hYGN3AAGG?=
 =?us-ascii?Q?wPOt4cY8DAyz/O1r2/mUNaiZBnDZWdcTZLhXI98MpunW2Y/iV80XIiNEQEKB?=
 =?us-ascii?Q?dxUEgpJp9ozAZ0JxjQ2ZlMjN/ivufZwtNm9m7QfT/8FBZgXj+rgSyqPZFw2D?=
 =?us-ascii?Q?YsW9aeiwPu8FMxXSSJvcnZejhYTcg2763YVktgOqASklN68JP0cdaqHMGzrp?=
 =?us-ascii?Q?zAkQhXP9rCmuH4eckKJGT7a9JffFIVduCWX/ucxJGT1nrTKU/qqVmonroqMI?=
 =?us-ascii?Q?Rew1OD9a8DbYPz076VCA6EqFVwsi5fXmlpvHp/XQKwTQZTnDpZpBx9MmDheV?=
 =?us-ascii?Q?qajIJ8gKhtWkdXkCpviDHG4hG0vLLEX8VccomSPH+BWXtB2wNkE5FlqVl0FL?=
 =?us-ascii?Q?wAst8a/iqTLQFWVlJThazDG2Vz3DYwhMXwPdS+iUVB1xbHM/+3JOnLnBU1WZ?=
 =?us-ascii?Q?ndFMVM4Et6SlYOD1wzcL6Id/A0qzbYKvbREb9d1ar38AgdNZ2owQgjI2Vf95?=
 =?us-ascii?Q?5TBjv157MW82/z7FeWwO3RFQrTML28EJOhPl3PmGE3kDgnafLeUJ2U86+CX1?=
 =?us-ascii?Q?p59AhtD4j39oYA1dIMdnbQMVbZ8f1PqbhkH+l+/3TBhUedTkdhci5Ne4Cz+H?=
 =?us-ascii?Q?RlyuzxTbpx7AZR2a5PEt7XMrF3rs0F5soOdcA+0bNs/aCEgBUimjlfS7fJuo?=
 =?us-ascii?Q?MG1IFNLH4PxrP3APO3wsxXXPKypKRhSd0KQQOm9S7jlsB7N5z2xNQlQs/E4e?=
 =?us-ascii?Q?oXmYMah4uVdEQi3XGycx9lWlHBQV6QQ326kXCtHco/S2GYPXROJ2N77giR5e?=
 =?us-ascii?Q?/KBO4zRbWgBFHRO8uVldMTOQ6w/ByUkM3vMYVGQEcsOxyJqNjfiiJ80YFrBv?=
 =?us-ascii?Q?Cjit706UHx9bMnMRSGqcaJxQg/Wki+DEa7X6EbE8PqxLpp2vj/khzeKjxt1k?=
 =?us-ascii?Q?G1yBqOrwpVwuZc9Kko+TWIGio7y/IPuyw/fcsMpyuA1ijyyi28AlUogKjnWf?=
 =?us-ascii?Q?rCmgpo1iKI1/60hz7hOiFXWqbbf5JaZseqSzFH4SKqhXRUxjoPUYaPsRZTB6?=
 =?us-ascii?Q?2WUBA3T+HVrtPSarL5cPt3BIQ01RBTnFCkssjYCuekwYjPbNPg/KkriTXfTA?=
 =?us-ascii?Q?+QBYNbADXT4Ct9Jm/DyHwGeOQ2r/WHUzaVwkQxiGXrjI2WoSL0sZx30yYryy?=
 =?us-ascii?Q?wDBW6MCk7GhiZeOifBZhthzlhvk9Afgj0ndWQf3RtSF92Ybu/0ngRXXBuo95?=
 =?us-ascii?Q?q3OIrOsyffbn3uu6za1ha3e0D2Deb3P2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmnAT7mqzSyxW4uWul7Hm1dQbTpf3muUDLt4Lrii1fi9fbnuwTyCn0v4HZa5?=
 =?us-ascii?Q?SNXZ8n0c5+4cNOB+jmktqV9GkTUcPcTWEYsfanMV+n+QO6vSO4XiGX57mbwn?=
 =?us-ascii?Q?/eIW36vTce2E5T1QceBE0esnbpVTwz2pBYkPM+4ZyO+tWtMoYsZQAPLvIceK?=
 =?us-ascii?Q?6LjOmyLKwVyyu5EZILQhuy+vBbLFQghrZKyjMj08IPE6Z5xnzGSsr/e1Z3Mb?=
 =?us-ascii?Q?jOPfOwuHELD1SW1FHf/k2/EeYDaroVniB0FyzHXLCWwuEQbL/bmGDu0TJmiQ?=
 =?us-ascii?Q?XgkroGDsq2IoZy+LbMNT3Ps9e5e8SbQzxum8+c+EZDEzH0ve0QGod5sAsiR8?=
 =?us-ascii?Q?GP1j/ifiSNuRDwHDUJTc91dJ4ULIJGgqke0dq+x7lixGAG4Xr8gggOVk2bqJ?=
 =?us-ascii?Q?LTO3BLdS0+0TDHvpShXEzegtMArp4THw5wZwz2LAq/SWlojRWVLUiojaD3XD?=
 =?us-ascii?Q?OxH6u8lfP2nl9RuSSZJVwmu9zkJTWUOnQR7ysOfpv0nGUmOHXQWbg76ydFFB?=
 =?us-ascii?Q?HEHkDkBbEemLB3/5UXBpHJFDjJGSujwv6knQeaNDxZb5z47sNFX2GsT/0l6p?=
 =?us-ascii?Q?fNfAKfbExnIjnKdM09zDlcSXhqs9axXxDAl4eKgwVk/DfsPUchV735YGqI21?=
 =?us-ascii?Q?p6U4ZngAKl2l6l/XElZI4H4drGoMwpSII8iaafcHk6bdZTPP3JZIzHw/uDci?=
 =?us-ascii?Q?MWV02HdRAngb6/clhXH52paOfDuCyS0ES/X/PrOxyKv/z6jVnHDAhV0xuNIQ?=
 =?us-ascii?Q?U1bJitqC2RfAqxigntcLZErEgDf48DdVo/yG6lp58EZ/qUctmbwG/9DxdVA0?=
 =?us-ascii?Q?2GN6oyGB4VtiNk060Ui6Y/UBitY7nfzalxtBmAcLpI3ZGqkgxS8fa/Uty5Ng?=
 =?us-ascii?Q?OLfxcTB4RDv6XmJZSHHtiU4GMUkXfhxIVvbQ0Y/wUOcnGYl4s2h+2i4CuPzK?=
 =?us-ascii?Q?VouORRWEFKlKwFdjf8/mqCj9cyaTVr/jWFq+shPAhtnnebzGiRVwipP5hPbO?=
 =?us-ascii?Q?EaTeJ+plYtMGUNuJlyw0kk2J1tojItJVsCr8T5i4feq+pqH5QEhJSR8e1lDj?=
 =?us-ascii?Q?Gkg0EUVilsWidb+tdlLsONl7WEHCzNCSITADigl7RVKIS862PeAxa5bEOxAx?=
 =?us-ascii?Q?QR3rpZKmErICQI/tWMX/NB/H/uFkvlNNHLxDi1qLCB+UY1kpVelalzRjM46P?=
 =?us-ascii?Q?QesRMdB4d2QXz3vdtgLT4yjMKBws1JYR5OzYiFwQJWDlEI9ZqOzgQyQ9NiHM?=
 =?us-ascii?Q?Yg8aJrT0eTT6Epkg8Ih9By5r6Q84HZ4TSUNP4xB9/RcmIAvbFiwHUPN/UAQo?=
 =?us-ascii?Q?xAbzySSBbRS2NiiU05L149kdXGF0RpewyRJU0Tzi/+f5nzdS3d5CvtxU73SO?=
 =?us-ascii?Q?eRm6Wx0LjHhnuAzomuZkz3kKSUVex8Mjq/29Ijk5W4DXHi0B//wDWkaKZDV0?=
 =?us-ascii?Q?xVkfvFqBtf+2QGwRhEVvscel5Nhg4iXIricfkjnuBbBUjw86Xvd2VtCoOtY1?=
 =?us-ascii?Q?A+prkUYhTvwAUTBsUbTp/wIq5Dg4jlOf78ErMwa1XEaZVPCdi1wVjST0dDjp?=
 =?us-ascii?Q?O4ZbXz7KrYYYQEkcUPQ0LmspWdV9B98pCaxiaDQCvZa7z3qi5Gb4wvnRz8xg?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e03aab52-b3cf-483c-a3b5-08de38f739d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:52:41.3012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klae5ViNcZmDl1OzHgot+WhbBwAr1hVVF14/G/XO/BaURY6mTXj6G8FYaxJnxp+Gq0GCnEBv4nGK3GvMrGW/RpQZXP5/ZcW5W1yw7OnabqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
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

On Fri, Dec 12, 2025 at 04:45:43AM +0800, Jagmeet Randhawa wrote:
> There are some corner cases where flushing transient
> data may take slightly longer than the 150us timeout
> we currently allow.  Update the driver to use a 300us
> timeout instead based on the latest guidance from
> the hardware team. An update to the bspec to formally
> document this is expected to arrive soon.
> 
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1197f914ef77..db2f04e1e60e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1050,7 +1050,7 @@ static void tdf_request_sync(struct xe_device *xe)
>  		 * transient and need to be flushed..
>  		 */
>  		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
> -				   150, NULL, false))
> +				   300, NULL, false))
>  			xe_gt_err_once(gt, "TD flush timeout\n");
>  	}
>  }
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
