Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FFECC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 17:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF50E10E391;
	Wed, 14 Oct 2026 17:52:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349BC10E1A4
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 17:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792000341; x=1823536341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZftON/3AhW737KQtq9pR9aLxm310Hdvs8rqCZFU51O8=;
 b=aBvaSAG+aV4yV6cxH8xQyAt5Lr9EoB0plchG50al4MKbUf36LbYeritF
 rkIj4Bea90BP1w579gW8YmCXyGwLI6HgiUDVuXAV8KIvZ/LgynfTARGsp
 8eaIcz79E/xopP4meZJJmFZwgeiTJmh7dpwnujhR4Ve1g8v5B5lsGouMm
 HuQMOAB0T6o8NvTqoF8wewaZBzyxx6fZz86BFtRC73gq7pS8/QPRfmnMy
 w7gqSHaRbH8HrE/Z8QVGjbmMhIXs0VA/xmUuCDn1JjoH6LdojSZxZ0YbX
 GGwDxMh0pvIiidK3ML23Co/xqxx/IYuOPj9MQJjKMnYYSPH79whK+qxDC A==;
X-CSE-ConnectionGUID: BrjhzP3uR3G1ync33CeaxQ==
X-CSE-MsgGUID: TZCmHkvrQoCC8fvkJX0PXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="760698"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="760698"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 10:52:19 -0700
X-CSE-ConnectionGUID: 8Px9InAsSHOOKbmGm0OsPg==
X-CSE-MsgGUID: SpcQqrPJQWSEVVF9aU1Xtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3234769"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 10:52:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:52:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 10:52:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yH9fkF7HF1jKNNEPx3QMKucEhL0Mcg4Q71NQi0yMpshkC3P7NlDjcz2+W4E2rYKs1NQA2naeG805AM/KQQ+0hiNk8IiYiSWdiS/emYLyUt4C3PJyR93hcdgmck+Smnyh2EpfLxKsC9qSuJXCjrBq1Oxv3VXU6Xld8arSagEeC9BojeB88WwzkDnDof7nT2RlRW7kuLZL7sJef0TXWi4uQbfkwdQpTdvmA+HuH9/OiMCe+PBQiOw8+wismrBe00akfYQux79E0tHs2OBzp2dQiStPuEcp0KFIZDGh6NnCuZNqUeK4QtjwmqHPN8VlPBXun2sK0bd2TNR9LjtVN1QxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekiMx2ypimX4xO1z4CJgWCVGDnLlF17LuSphm/8ye6o=;
 b=B27sfH2QGXOOENF07t+eUpYCXWllqzJfdznKzLNTXByBLNlgLJmasbyAwVwgL3FYcEev4rU7gNgoegm/z6zPMeyXHI4ZYAkoV0fG4/sN+EA9tCaEP47nrTeYf5kCdj2fFgh/UEthkvX51+Ai5z5S8VHfQ9jzNuWk2seW6CXeE9NEL0EQsG+08HxdA2nYFUC2bkfsT71ODJshfoK2lB3lX5E6b/6RUCF9vlFyZB97jFNTHTjVgyWAPypNQUSuvTZg7l7Rrd92n7r3beJujBTS6xV7e4HQHI4cWrQCD6NiswelNmPFA3ZdA7sw5d5R6+t/sNfRb4QzBUMxDzf9mkyfOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SA3PR11MB097687.namprd11.prod.outlook.com (2603:10b6:806:595::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 17:52:16 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 17:52:16 +0000
Date: Wed, 14 Oct 2026 13:52:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v13 12/16] drm/xe/hwmon: Update memory controller
 temperature offset for CRI
Message-ID: <as_BTb-GDagB03do@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-13-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261014115806.831459-13-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SA3PR11MB097687:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ee47ef-a5ce-4d21-c1c3-08df2a1be2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|261009223027099003|11063799006|4143699003|22082099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: rZoJWLTSCIETUOA78Ox0GmXr9DXrZabkTZeLDB/kMBqRBT61gCUhyrNStOUVdF/rzHpI+kQexSpJ83YBbfxnpszjEOo5xm99983bwpiwNeLvWKYso8hL2pDhfI3QppgrPDz2RGbMtLB4rqZBjXk5sIKW152YovFqx4tGft2b+t7aiUQWBfAA62LxI8+wnTl15NyZ5nJ9V9tbsoHTCcTkqKVz1c4LKZlBRYkzJ9Z4lD4L2y6DKKYacQFI4XYWVUXO5QlkN8bjkLdAntcwCO9ky7sFnMa2G4pJq9vRgfixjCJO3zh7LdnJrlZilwC63wUePdBblYOu29+ejeeQONNi0zjQAtj4PO5OpqppfW3kElbjxa7PRIFfrN4b0JbiM+9xXJsnqUwpR32FotRjCfA+B+QhdfqGQc37VXf1WCedYmgb+k/VxQRNlX8R+sww5Q3X1z0w4oTLjytLmB7On2wJvfSZwDYNpaFT7sN0gEv19Cqkv/MdBL2GYHMQdm78sigu+9FPBFwckk9pkAd9o9Ua82kF1MJBlEqAsRJXEuWbgqfa7q6gXIO6PiaFVDre5fNL0QL9hYnMbMiHJ5IDQ35rj3DAy0ObJGvBF+vUfzDiaQpwjw2vbcOhKTkVt8QGZltmvh9fxV9CTnTMy2AKjGVpTrVk76jnAlplUvcNZd/6h+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(261009223027099003)(11063799006)(4143699003)(22082099003)(10067099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZuKSWeoR+1wGM6qmnG/oFE3qebM83/JDr/qGaCUq5LyeQBHdhrfVGkQIsGiu?=
 =?us-ascii?Q?t7XKZT7G8f2vxGn3mwP402F8PZkQEHyQrItpbTzPgG4hzZJuURE+iJM7S6UR?=
 =?us-ascii?Q?W84m4Yrg1LYbmWl5kHWJW7aDtffqDtZ4ocu0mKo28mc9iaQ4n91q+9OMjrfO?=
 =?us-ascii?Q?hWsl6qJtpWXdju1767s9LcDLe629xxBnOa3WsoxQHDRwbV8QgAVpEVYYyh4D?=
 =?us-ascii?Q?aFMgvQSah6BG9/FA3F+hM63hok5ilxTduCbpXjmlLWOQ+VG4jGnf9umxjczJ?=
 =?us-ascii?Q?dRadJ2ru5ej2VLcJLLhO6hV8m7ZMLv5fQj2PLMdAFMeEaUuBitjHLCXQGS5b?=
 =?us-ascii?Q?vacTheAHepBre1p/i2HeMHUgKRBFEU7So4ldmWa5TwGt/Ve/qo9o4kvKku+w?=
 =?us-ascii?Q?4H2reXiQUUMXHnzqEXL6hG3GxVJv7QmKaqSi1Cz8FNAQy4XT53wUTq9cjJk4?=
 =?us-ascii?Q?GOdLAhia4LU2Bt4xJJhyLZShtvC1Higme3yI5b1e6vVNIE/IYyJ9csau27V8?=
 =?us-ascii?Q?4sJFFp5k5bms0b6gFOj+shSjw8/qjYUWmCBJGGi3wfX8GDGn6Q8nphWzPkiu?=
 =?us-ascii?Q?8dy2Xj3g8p5XMPqrkZUXGx2wJBKQ20B0cShp2pvkaj+CeljgvT9gNfxMt1Cb?=
 =?us-ascii?Q?aCsY86iXTLTJcdzo1xdPwToHtsIwjqa8rHMXO+T41VAKS74jvXahCNrNZASl?=
 =?us-ascii?Q?hcpcm/rYgfZ0sNO2QRnrh6BVWhkauXI4Eh08ydBFC3nYISMurkuaYPLehWZI?=
 =?us-ascii?Q?0R/lhnrfn3kc53aV+5C9tSgAVlwQ84IxybaomQ1e6xFNyWkDdaXQLtldGrt5?=
 =?us-ascii?Q?zf1H3jH1qqRijY2cA+Ei3pzivF+ImwHsyRT8A33jz+hCRVwU/jxK+ZK203OC?=
 =?us-ascii?Q?pXrbt1j6fqtIgkOShWzeKHpntQ+7In+bNz67wZ8yyc+eCjaeV5fLofrgAdVm?=
 =?us-ascii?Q?XrcPkvFREGY97PD5L97t6cCPuV6P82tOfTiG2Dqhu5W5zKxLW8EQ2pdJRtBe?=
 =?us-ascii?Q?03mtnzcB30HbWDZzJ2acFxWv6GhEJIC/6zxKlJiD1wXkQ/8pY7jN0AUsVzXr?=
 =?us-ascii?Q?oWOHnj+ljfegMT7BDSJl4UPMVOwgK+Cct5Ckv9Be5tUG+tGWSjtNFM94a/+T?=
 =?us-ascii?Q?FV9tJltPVp+73O5pSex2RddKt4bmJYNiY/V2olTgpY3lFmR0eXxZ1TOdGAAe?=
 =?us-ascii?Q?7kY+txzAri2kn+1LM1RaS4J2M21t7hFUN1J5A/lzPGXHtG3WCje8rbZb7x6I?=
 =?us-ascii?Q?l75sKSU/XzT7was2r66QctjwJ9lQcd3FhRpoUlyN8gIG9Pvb9ItZYhay5psW?=
 =?us-ascii?Q?dnEtPa5w7dwtsCj+ofipxXA0R8xQysnHNBZ3M0U5ceg3C5P1s8ea9v2ZQCPT?=
 =?us-ascii?Q?xlkBYPBImVP4ZYpxQ9EcUF+NLcwGIutZJz5rFl722usqYc3hU/CqqUeEx50k?=
 =?us-ascii?Q?ITd8MYncXckQw/34gpggKvxVII0KWGixc3RXrY+0bI3dcrJdrIJxh0HMLGHp?=
 =?us-ascii?Q?QhEbHy7g1+1//rm5oD5SjDiKdY+vqD0Pag4EG2bHvVmrsDobgVi6VW7Q7rXX?=
 =?us-ascii?Q?Z/SFCo2T59nVZPYM8UfAXFhSvi8e3mdSXQjFEfS9z/PZIRWmSRpIz2X9JANn?=
 =?us-ascii?Q?J30rC/DV/2y3+xw+YrOsSo9JiRCCgC830Oxam2Js4pMobAhr1rVIN2MzS+RC?=
 =?us-ascii?Q?QSxPxcOSIZoI9tM8TR0cQtG2rPSDI0Eednxa4gtnUjBIlybJ4Ke6Hgl8izsY?=
 =?us-ascii?Q?fK7sf88ipg=3D=3D?=
X-Exchange-RoutingPolicyChecked: XwsfX27U59y8oJNOIDQiYrUSoHdCDbtFKdEDiPqmVig7BHDC/Z0gr3wHlIn6R8V0yMvBlThBl0PNn+Az3cmyTtPPvqouiuwqwhmECm9PRXqmWEv2psT66nmJOaw+lukg/Z3oZwycegyzi77MdfEhTsgWt6/DdZ7tS+pPwBJIJVKiIbp1wJWkAvUhH+5fF80tIKYuGNzhiUvzN/bTrRHYC4XYg0sHIaKG3GmCGDyS4bS/aORv+GXJM+CQtgsjhbyaX27wfx2RSA2uSrrRTIK/K+xCtw6rn7Q5zh9R3RQ6LV3Q0dUMvjUClHXZWTj70vsovCi3JaTZVdG/nwfNdKbSrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ee47ef-a5ce-4d21-c1c3-08df2a1be2b1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:52:16.7974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erL3e7pFNRaPNiSPUQfRu1MLNWjUZotlQuGDGqdTR3DrzEhJFBbrwtcz81MX5aGo9vrrFI+D5ShdfeSDPvQVpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB097687
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

On Wed, Oct 14, 2026 at 05:28:02PM +0530, Karthik Poosa wrote:
> On CRI the memory controller temperatures moved in the READ_THERMAL_DATA
> output: they now occupy bytes 16..19 instead of starting at byte 2.
> 
> Read and average the CRI memory controller sensors from bytes 16..19,
> keeping the existing byte 2..count-1 range for earlier platforms. Only
> the group(s) covering the used bytes are fetched.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> 
> v2: Use the CRI memory temperature mapping only on
>     Crescent Island. (sashiko)
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index dad2397db141..eef6560569ce 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -109,6 +109,10 @@ enum sensor_attr_power {
>  /* Index of memory controller in READ_THERMAL_DATA output */
>  #define TEMP_INDEX_MCTRL	2
>  
> +/* On CRI the memory controller temperatures are READ_THERMAL_DATA bytes 16..19. */
> +#define CRI_TEMP_INDEX_MCTRL	16
> +#define CRI_TEMP_MCTRL_COUNT	4
> +
>  /* Mailbox sentinel reported for an unavailable temperature sensor */
>  #define TEMP_MBX_INVALID	0xFF
>  
> @@ -986,14 +990,22 @@ static int mbx_temp_decode(u8 value)
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> -	int ret, i, count = 0;
> +	int ret, i, start, end, count = 0;
>  	s32 average = 0;
> +	u32 data = 0;
>  
>  	guard(mutex)(&hwmon->hwmon_lock);
>  
> -	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
> -		u32 data = 0;
> +	/* CRI relocated the memory controller temperatures to READ_THERMAL_DATA bytes 16..19. */
> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {

we need to be consistent... we either use >= cri everywhere or we use ==... 

> +		start = CRI_TEMP_INDEX_MCTRL;
> +		end = CRI_TEMP_INDEX_MCTRL + CRI_TEMP_MCTRL_COUNT;
> +	} else {
> +		start = TEMP_INDEX_MCTRL;
> +		end = hwmon->temp.count - 1;
> +	}
>  
> +	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>  				    &data, NULL);
>  		if (ret)
> @@ -1002,7 +1014,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  		hwmon->temp.dword[i] = cpu_to_le32(data);
>  	}
>  
> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> +	for (i = start; i < end; i++) {
>  		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
>  			continue;
>  		average += mbx_temp_decode(hwmon->temp.value[i]);
> -- 
> 2.25.1
> 
