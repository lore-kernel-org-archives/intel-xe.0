Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B4DCDB471
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 12:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A680810E033;
	Wed, 24 Jun 2026 12:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0012/uR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BAE10E033
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782302405; x=1813838405;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6N45UkX6/1bt1QvveaX23Ug/tfKfkRaik0ryRiQGmts=;
 b=H0012/uRWcJ2rUvY66rSpUxLxsM8VWajKfWoNqvpCkVozFUaAQLK3Kn4
 APWx+d14fRiqrZhMMGe779VebHEDCo/1ri5xMGtwFm0w8OyIiOVAqc9Y6
 Q0WhJ4Pb+hUnXK8ND2PNbhM3JEi66CenK+opNBBqPPW1Q25JprlnhSi2e
 vQqB7RyyRQQGEb6G7bbvbaJSNr7khPLVbTqC/qLJTsOSY8HuXkMa3+O0S
 QPjeuGuGDIQnqDnZNazm8FCNsmm3+0m17prhdAQx7SLFBHGKBDKfxbvrz
 3HvzutIzNY0PUQkCaGVf57L6VgM5bZMvPMTul07GcKhXu5FfxgyaWp9A7 g==;
X-CSE-ConnectionGUID: 4b6fMvZnS9aX1OjCV+C0Ww==
X-CSE-MsgGUID: EXoUgEINTlizVUHYpPS1PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82932752"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="82932752"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 05:00:05 -0700
X-CSE-ConnectionGUID: p7cJNyEqS/ierCBbA3oahA==
X-CSE-MsgGUID: fwCufqcjRtK5C9X8u9v29Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="243450068"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 05:00:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 05:00:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 05:00:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 05:00:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/+Pvz2YRvM0Kpqp86cvFyL5n717j1Upbqm7KJ4+viWlSmt2H3kdVnGR2g0pPi1uEfSwuPB1YXhrVQGsJ985EIIQhmsBkRPz0w89YdQBi1kZINhedvHJozJqoo78GglmfrltQTi2MHjkNP4rkFuIYFt+baO+TQ8XCuThT18IYI+WOFm4UeBqaluCSsYfOnqSn0dyrr1NtuYyuZbH+wxofADMBWGJv8ia3rIC51y888ds/hWQwAYYXBoLb0rjLI1fClRtAIgECND9+/XZL/WG4WekbTZ6dYYq2NpAVBZQZUxTAMr3VRbEt0J99ufqAS5KQUzaIpc0FIFMsVG+NoKX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dH69yqZFqPBo4XrdA8BCdcx95h/D9IFyWHeyh/KDKe4=;
 b=lfaRR2G1uA4vn14qhH7MbHgdlSaFkmDEfBoJi5dhrS7X/zFwcQRmWHJ/YA9zYMoNbOUbK7gGL3OOIymObb4JSgkH8ycxsEC814F8fQL7AFuuX0B5LxdVZ5omRFTZGNWWNaUZTm1AW1D2h+jUZa/0IBaQDyYHqJtrB1kwQbtZ7kENGORECT2gdQ5pkbVZxOnXka83N1CzadRXq0INcLbQ+IJDWe5HMLWshyTXNNrcJKYwlohAeWqkMpGQdYuOyUV7ya23vPvd99eWwAsDLvC099pJ1SSFd4cxlgdPxdIXdOznVmhScDpQrcZr1H33Del9I8gZFGoXr/dTvoJfAXQhpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by BL4PR11MB8872.namprd11.prod.outlook.com (2603:10b6:208:5a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 12:00:01 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%5]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 12:00:01 +0000
Message-ID: <2d9d1866-587f-4cae-b314-3c05ec4f3825@intel.com>
Date: Wed, 24 Jun 2026 17:29:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Do not return an error for unrecognized VF
 events
To: <intel-xe@lists.freedesktop.org>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260624095634.1250956-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::13) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|BL4PR11MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: f68337f9-0d82-4128-8acd-08ded1e81e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vh6pZ/DKZINdu0s+yNNeDYuay2Ix27kslwYl5xHDQu3IPW/cbH7mkiv9mhkH6bdG/RGZB/5hauancd983906G0WgdXB/cfQ+WrycbVYp0t0L1Kldfdn4DONmfVPK7vgsOXjgS+USRMXm1XzuDZyCacEiKmLrBI98NYmCLpSDh0IYth+YSQ887AGQsTlZapbHbmuflCrZSWMU1Li8VyqziE7kDfoRGDgl9TiE5KECH5S+HcKAzcl+iol+PF4ui9kxEYSreZcrRS+jTIuvbF5wKaSGRYg2EAMu47pkJPs9cGTwGeL5MsvwGK0RAqwfrtIxK1ssXGkDHV0UmDvQXJmTV1aiuAN7FAtgfm8GlVcr9tNgNKcdyd8+xzembZ6W8M7+VeGOJ9I/heN4hMutuh8c7VmIjvR/bKlvz34jCI5u63W2KnWD48Io03+ZeGCeVz7Jo7KT0TpFSCOdzZcp6I/YXzxTLxOOPw0zV9TFD6EQvfRmN6cOvAtXvsWdLwhTvnSpPChXjH4gkcU2fLwBvnPxS3zjmfyiMXTDI+yIF3R+PyRe29vWVgMaUNWDbBodT6hY1yC0k7MDshCxOKcJYsZRGj0UIWWtzHbmIHisW38D6HkQmf7UVlslrvvUV5kT1rKgRI6ZAMCyrQniu3lbaN2gBPuO/xMq6pWAWkJU+Om+L/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUlweG90Vm5sWldncVZpNTdsaG41K3VjTzI5TFU2NENzZTBIZS92LzBvcnZW?=
 =?utf-8?B?cWFQWnBORTRDZFNsRDgveUkvRzZsVjgxaVlZaDZ4WGdBbDBHWEZ1QXBJbjlN?=
 =?utf-8?B?bHBuV3JzQXJQUWtIVzhyelJkcHFhZ3kxaFdrYlNESlM0YWl1VG0vczFLWDZw?=
 =?utf-8?B?TFdaUXg3bjBaYnFSWWs5YmFNQTFQWjN2UVUxejRoQXhzMnBHOTIyYUVMZkYw?=
 =?utf-8?B?TkdKLzdJcEIyMFdEdUtDY005Z3owV1k3MlQvSG1aZ2Vwa0h2K1dhV1J4Q1By?=
 =?utf-8?B?TFkxQnBCbDQxNm1ndFIyemNqNGhma3hhSmRsV3RnVExlV1dVYmlkUUlqc2RB?=
 =?utf-8?B?Y204SzdlTU40c0hBd0loZ01aWUlKNGRmN2hNeWp1TDQxdUhsUXRLNFhmUTN5?=
 =?utf-8?B?a3MwTzNTMWdCY3M4cS9RVzRFREVuazhHUEtCamtxOTZSak92Y1Y5NS9Gdzc0?=
 =?utf-8?B?UkpIM0QvY0ZuYmdSRWY2RnExQXIvR0NhbGFaSVJrdTYvaXlvM01KejFPNEdJ?=
 =?utf-8?B?N1p3aGQrWmNJQ0lkS0M1WHRHSWxRNG0xMUZSWmwvM0pxamw1aENrQko3Njls?=
 =?utf-8?B?QXdIbTNIR01NZW1QSUw0UXAxRzdiWlp5cGlwRk1teC82ZFIwM2RnNk1YekZR?=
 =?utf-8?B?Vm1FbEFtaTltNnltMUw2cWRHZDR2SjhZUmNtOTIzUHdlMmNvZjJwSCtSNHph?=
 =?utf-8?B?eGJscFoyR0NLY1gzUXhNWnc2SUxuNjRTTTJSR0FseFhLaHJmeGwxenM2TmRV?=
 =?utf-8?B?K0xFNkZTQTJoSjZ3NWwwZGQ1bEVkek5iWldKWE9IVVhhQXA2OVlhQS9XRmp6?=
 =?utf-8?B?K1hXbG9IWTlIL1dOQlZKUW9YeHA4c0hGOUQ2Mk8wL2FQSkhuaWtoVDlhK0Qv?=
 =?utf-8?B?K3VDbTAvUCt1OHZGa29YWXYvbFBEWUFpUjVodEF2U2Q1WVV2cFNNMFplY1Nj?=
 =?utf-8?B?WGpSQUo0Sy9xZ0RWTUtVeFFXeEFvV0NuNVp2cXE3ZkpJVFFiQVY0ZEJkd2Fm?=
 =?utf-8?B?U3lxVHc1YWZ1cTZiK3I2L1g0N2YvSG1iRzE3Wk91ZFdVWitmeUxoRlgxVGdq?=
 =?utf-8?B?cUpsQnA0QmtUU1gyZXlNbUNFQ2JBRzRnRVpOaWRYU0cvKzNteW96djlKTERj?=
 =?utf-8?B?UHNXdXd4bkd0Z1JuTjlyY3N6S2xkVE9LN3VMNStPVk1hOXFra1FEbjl5bnd2?=
 =?utf-8?B?QWwrd0F4ZUwxWlVmRmhwNFgvOWpLTzBURDhYT2VEcGhLZUNFb2kzaUY3Z0E2?=
 =?utf-8?B?QUloNTFYK2tOMVlicUJEdTJjaFgremkrVjgwWkVaT0x1Yk8yWjdiNEkvdHl6?=
 =?utf-8?B?N3B1Vm1iQ2hSMTZQMVBPNEM1QmpIRk9LM3EvNlBiaUNpeis1OFpzVmJDdk1P?=
 =?utf-8?B?d1V1WUNaSktNcmZ2bWlZV2U2YzE4YzFBb29CVXFqRVlGaW5sQXZzRFNBUDdS?=
 =?utf-8?B?UHFFeGd5NmdqbEtObnhBeEsyajlRdXljWmRkeDQ3STVWV3JRT0pqaEMxSmpV?=
 =?utf-8?B?d2FxbjBPaEk3WVM1VTZTenl5R25Sbk5vUFNwa0F4L0puK0RnSDRwU3k2aVgx?=
 =?utf-8?B?MlVvVHJvTURJRFdsSFNZa25mdndHNTVudER0NDNBYlM1MTdDKy9aVXZkeVI1?=
 =?utf-8?B?c2FPdFc4R3BMR3Vtd01BN3lObFBraGFoVjRtUzFRVHZjSTVsMVZVczNtT0Jz?=
 =?utf-8?B?TXljQVZvM1BwZ2ljUURtZTN2MnYzTXhiZkZ1djJhbFBURERpcUtIbXo2MHA4?=
 =?utf-8?B?SURlS1dscGN2UHlRY0hnVytiVnFjTEJ2QzhqUnFKV2N6TzFNOUVSekNVaXFM?=
 =?utf-8?B?MEJIdGlpalQxeC9MTERoUzQyVzN1LzRvVFNrTUJva1FDanpYKzJ5QXRZQU9l?=
 =?utf-8?B?L0ZCSkowcjVKYk5hc0hDSnFKSmNWckxpUHhNeksvUUZUWjc1SDdkaXNVODlo?=
 =?utf-8?B?WUNwNVQ4S3lCRk5zZk55ZUNrRHFPUTJOcDNkY25RWElIRWNYbjZWOUozcUJL?=
 =?utf-8?B?ZjVMSVVXN0UxTGl0U0g3MG5JVUZNeE5JZFBqTU9UTXVEVGQvb1JlRG5YczJk?=
 =?utf-8?B?ckpBRjNrMm96ejNBbnAxRzNDbmlzaFBmU0QzTFkrUENiV2podXBNQU9jdE9Z?=
 =?utf-8?B?cURIMmdkbDJtdTI0U29aeGtzeWd2RUpiTGdLRUFyRmlmZ1h2RFJZZkNXa21t?=
 =?utf-8?B?MU1xdk5LeHFnMlRVVGJDaGRZZ3VBalB0Q1h1U2pRdnFUS0lsNCtCcXVDYk5h?=
 =?utf-8?B?RktSV3BsOFNHTTJmVVRkL1lTNzFObk9kN3lEUDJTNVdxTXBJU3VoMDdiTzdF?=
 =?utf-8?B?MUp6TWE2MmlDb3gzbkZXWXJiMGQ3b3ovTVQ5YlpwckFjZGZvWW5qcHZ1NitT?=
 =?utf-8?Q?Yxfc4TBOpe6yqois=3D?=
X-Exchange-RoutingPolicyChecked: Pose85rHVW1NcMwOllQlpFDtH1hWh8fvqI/bvtNmQurZdFjM3DaTCKxjbjAvBiwgXrSLsxpugZHIn19ej8jTYcsp/B9X5hvAuvo4PWeq/qGwmzMCfBONbMWRpZWToXt/+OUWpVQ0WU9RjHJqv1Qm4mdpoqjiRZ0otsmuEcHbLhtZWhSV2ZMX3cx2h5ax62TdXtVq0OfR+69V4FEojEEOIdLYhtXAJgmT9S2wW55r9SRj5vAvNcdYMv7KguJxxpqB7aqTv8rIqsW+THqmRdAN3BVu6gDMIz+kNFJMGVP542P0HMC0w6PZwnO+B5wPjLxO+Gnk0qb8BP0p7kiB3QMqgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f68337f9-0d82-4128-8acd-08ded1e81e83
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:00:01.1159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArTiVT20X4UmxOteEW03So7GSZuhoCPoPgTNOAh6W8SzK9pStE87iqJEbGIKbtu1idWkS54hVdQF+eZRylFs+NC7Us1qUFnR9no6Inkfohg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
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


On 24-Jun-26 3:26 PM, Michał Winiarski wrote:
> Notifications about VF state are generally not considered critical
> enough to warrant PF GT-level error and subsequent reset.
> Convert the error to dmesg log.
>
> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 058585f063a93..65f015d0ede51 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -1973,7 +1973,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>   	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>   		break;
>   	default:
> -		return -ENOPKG;
> +		xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
>   	}
>   	return 0;
>   }

LGTM.

-Satya.

