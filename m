Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E48CA9EC5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 00:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C7910E045;
	Tue, 13 Oct 2026 00:52:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DE110E045
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 00:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791852757; x=1823388757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WgkFWzkIs2h+qeZT9wpB0eTtrNhnzCE5q2kDF2JrOdI=;
 b=nW2fFzmmnqSUXOxJT56PHTCZsTpm/3Trg2z2rW/bf54wj60EUC/HWFsm
 foM+9EHixWxgD+Q21D1JADzcp25CzgRg8mfQCr/zRD4uFUvvuLkKG+qyh
 pqfTb+V22e9JGZuhmeJWiBhsV7auSv8A3ZsPbk8aDsnwF7dbMDcy+fQDO
 MVCgPCl29Sl0pODrdIlowf5jFInzCWSostE9n+D9kVvFgbabuFIH073O9
 ESrpzLOu2YRRw4C91g0WHbq4mDki5ZHhiav30bqeStLfmrAQMoMaE/QEg
 l/WkROvdgCCa7suBbpxLvOMstza+uWVtNjaq+3iEpbEujneOGTCWSF1dk g==;
X-CSE-ConnectionGUID: OVRQ72xISri6quh3/VbKkg==
X-CSE-MsgGUID: BfOnOOyARTSAeZEXeCOpoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="577551"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="577551"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:52:36 -0700
X-CSE-ConnectionGUID: A3jMj4WLQYSqiL1eoFSZew==
X-CSE-MsgGUID: +34YRIeIR86Faw1vRvmq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1083975"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:52:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:52:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 17:52:35 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n76E5yhrrq/Nsjg+Hf6EhnkbvP2eB5MqVhDLCKkYUZemJJUDZVBL2uLOnZXezDpr00oqFRBR3VE8nhEk/BLeJ9YdN4trl1IKVKUOCUL4Oxi9mCEC2N+si5DuyXPd2Atv/DJQw9G54yhmfAXMyycS1rIhsqrD9krHHBUmUS9FwNlPBej/nx0H3Fs46rwDOw/xC+8nv1Ee9N8VcB4A+CGM/+kDX4iQY8T8meXfUckRrsxrYs/KozlbP0H3uKAcfPK2xgT7R4vKjgATn042Mz/5qICWtIlT6b4+ADZzQ7W74K9/TOCS+J+Ea2dK2zQQ8ZrM4iiCx18YlzSmbtU6lnPRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M9tGoaeQfPNx79NihoD96FDOx3NWB0ddtuf+t+COd8=;
 b=tvXxj+vBUDof2YJCrjODc1MESqyvDI22nLTsLIAHhPpe1xueAwN8X/4f7fvnqAFrRLjqrHNmFA6p6xiguZDoX+OdWzKxfVg7KRW4BJj9JfUHEzCNU1RnyQ+73Ll5YXPejZSNgV/ePUdHD42gCkLTc+Ulv6PZbyIH5LoiPDRD0+WcpyDjXFKWQTVAP0zBHBn4fiho7V9C1cqdZBUgRsEQM1sp9CGzWzTParXTd9IY57S+az80UaP+zrrPQkmp+JuYQBmpewHCypoEA9TUa6Ng+gtxcf73/e9JibyTpvu4QnD+mPdAmQyK2kA+Vjsh7axrt+lB9sQ/WBzrnR8aGSndsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 00:52:32 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 00:52:32 +0000
Date: Mon, 12 Oct 2026 20:52:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v10 13/16] drm/xe/hwmon: add PCIe temperature support for
 CRI
Message-ID: <as2AwpTOLI0exo0N@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
 <20261012130401.443473-14-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261012130401.443473-14-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|BL3PR11MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 3259f8de-b38f-42a1-66ba-08df28c4438b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|10067099003|3023799007|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: THs/NleDNDMmw/1VXzhaHs+Dt2SJ8r5Cgcu8Zj9HLHjGg5VsoSggDf8PtNwQNINcGTJOjKQ0dMEib5JNpo7Tdj+SseXdolqXooiqZnG8hZchgWhhAbnq8EQCbJuCwZhwXC6UZAl5XaYintQkIFrj9ZCQZf3kIgnFRcED77+EfRcL5wCVklsyhYiea+4i4dGftIvsC81wlH9cyWfFzNJ8YWvuN4eEdXN6ezHUu7fRl5VcLoWAqHkdRtPFEhTHXPgCLUDpkswLOuN06wDWcpUN25M5+wwPL33+Bx+td2fBSB2fzY4AcSaQoIqKeNwuogbQAFzyLNgrrXA/pGl/Q3UjZPKqd4xnCwm3L8UYKVWyk96Ctau7lpN5YNMcR7A8E1BDzdkNg98yZIUbx2oRiaPh4ZHj2nnTsX3kLv9aahf/UqlGusYtFAhzk2uJ67Fl6kT6d7RjJ904DTKlvyqUsdlNMbTE4F8Y3iRAPrlz15GYBeHZEMcSmYv18qJF5NZPF5R3LfxTx09Mmgl7+py9625RI/zvsfZ5hDMQpR5pCRJmKWMgYwG98bfdI7EK3uGvOUkZxgJqL8RvgQPLXknrHhf89H3JhVYg4l/nzP3zHGO6aQwV+xP20Aqcjy0NANBfZy1m+UpqkCGDoxq08XrvsUiNqAaYGSXHt35racTDdCWG5vM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(3023799007)(261009223027099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rQPilm8a+0yK/Z74DwpmUFzi6YnWFqMkWuhcbPOxAkeci5esrCND5O1V/tBP?=
 =?us-ascii?Q?gv9c7DolyNcnt4aXT7Ptla+NITdjE7KX0S/cn10YfbcvQG+AWulcVHejmFlP?=
 =?us-ascii?Q?toE4u48vunI92XllFZf/8dbEQITE4L3huNPWdpwXhdeGMGTIh8vxuCJqEKF3?=
 =?us-ascii?Q?l/GfNajxCixJlsrP/Bh3bDVROTUe0SjzBfMyUpqux9FDCWwozxjSRsvWIqGF?=
 =?us-ascii?Q?TnNtngwTqFD1k3iLDkwZfNsZ3dZyBMxeqakIjdYFJtAX5RcuO1tU7+upGN5w?=
 =?us-ascii?Q?d8kzaGGbzlMEC+BFrUInVnvcNrNM4kH9hckAnk3RuslU+URhdQATEjFgPXgI?=
 =?us-ascii?Q?NU0gh67dJHlmBD2Ivg47QVsK9zSf15YuXrvgzJxZ2tOSSFdRta/Z3z/15liq?=
 =?us-ascii?Q?3bfmlV44GxmH27w9yTBJY62S//8ZKHHYlVbsmWg0Ge/XTlR7gTIJ2hwP3sUi?=
 =?us-ascii?Q?PIBdpKya+X2W/f4LPRmMgGJwodXwB55PwkAEO1n+vEPh0brUmUYKfKOU9VaA?=
 =?us-ascii?Q?SAbt5OL3JQvwWmgFXpXCMDOQG61tFFOAOOS896z1Q474MdTbWUFYOWDyoPQr?=
 =?us-ascii?Q?Sh1YnsCCiksJ0Wv0vC1pwIPHxIF0zQW9Do5uVidRcrS5lhWxrISYexpivfaQ?=
 =?us-ascii?Q?uQ5JlMonXZPJHn8KLvkOxLsHpbS320pvVPziCTQ8l33VV5NpU/+HHVgaa5kz?=
 =?us-ascii?Q?sPLeYU8Fxk5CfGDbTVCaU00re2Pqox4Wb3jr7chFr8k5zIAKwvd1D4OMLVxK?=
 =?us-ascii?Q?hA8oLmznGjvquWpa9hx4R2Ao2hEsJM8OHugB9Vge/xp9Y2ZblotWZ5HDwDMi?=
 =?us-ascii?Q?N9wHEHKIUfVKB42f4af+DiJKHRMdIIv6X/IHwFrfCYC/CKhwC/EPGmET52iA?=
 =?us-ascii?Q?K5+ABnybSFhZkSFoH/PoNUQzfLLcE56KOBB5yc5LCBd+XZHl0yA4E8oAr5j7?=
 =?us-ascii?Q?kXv49rahFQIvrQsbMMRSpTU9gDLjTbN9c/0n9DOJ2LHMW4iRaq9j7XehywSY?=
 =?us-ascii?Q?P0m0CLSo+DrpotGVEoG+TXO38sZSvOgIlEk30qPd9MlW2pBHIhBA9ym153yY?=
 =?us-ascii?Q?oswYHpmhlM6eUsiVktkdGGZCFHhSM91GOOsjSDdHgqKVL9cO1eDAP9Ta1B4I?=
 =?us-ascii?Q?EeeER+WNBCOrsLmr1JhTSIKWFrijF6vdu8PtIATjei5O3kV036h89JelFjU7?=
 =?us-ascii?Q?ivXNDgBQdpvOr7UoFxtJTMhhY1xbe72VkhIlIbMBTFaxl4dz6kYYmuRrjemk?=
 =?us-ascii?Q?tRtpRHCefN4b+MqipxQ8Wi8m6Cghj2iEc65wBE/A1xbrJWbfGkrS1xf9B2rv?=
 =?us-ascii?Q?hiKJnrCw3UhccR3ep3JKnkf1rBlMrkqwL7NYnIHWJ66jKxjvg7FrKdnCpaYe?=
 =?us-ascii?Q?x/HrJXRROHDQk0bAfiQgZoGJr2dLxxPewXNqDSdmwRkoeUoR6O8dC7l+UPml?=
 =?us-ascii?Q?mVXcHEcsifH76HpoUNypjDN+CT/6OE22FAxHWVZSpMir/n/4FFD302EhCcZP?=
 =?us-ascii?Q?2PCPDV1pyh+wnUFv1ckdb5nAVp2y1Dv6XgtL5dJXIPQvfTwB/glHi39Fuq6V?=
 =?us-ascii?Q?XK8T8UDLmVqyNzKJdteuBZNV4prUpMpHUhBtU4uNMFbv7bHkfy7YJtCO2UHP?=
 =?us-ascii?Q?JQu/aNa2F1XI4Olw5wl30eIXC4c5EFdCIy5oTnqJt/LcOvwz2pbt3S/LRSZe?=
 =?us-ascii?Q?rNnr/UDZjrxbsgou2b+8mRpbz9Wr0jOlsOTS3hLdN3L/XZUIJ+5pu/v2jTBq?=
 =?us-ascii?Q?W/404YC3LhgEJJ54VAnM+u267A2I2/Y=3D?=
X-Exchange-RoutingPolicyChecked: pftsxKjfvG70clj8K758vGJvtubE9Zk5L5TFPzc4GmxJHWmlcfyjGQj/d83H+YmbDCuhApx7caAiHyeLRIDTWxaSpSlFehX2S9Uv51fN2JVHHsH0okniclKHKvSPCBR294AdXBhakqTOR6+T9Bdq5PKnUkF2yxjf0AGKWW24Ca4+herciv104jeY1KoeKcDL2V785KP4nuV7rsUClkwwyO+SMdcKzA+vA7ZGAG9hjNFIsAaVnBmRb6Dnq+uDiCDj9QMPjuwkFf5RPRGTxSsgRWnvLgXhzGKaJn3HF/+mS3C0myRilVHkriUh9TqIvxWRQLYE8j3Ga1iQa8PskJgHGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3259f8de-b38f-42a1-66ba-08df28c4438b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 00:52:32.7709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P90zuZHElXdK5kRYKqP12+q6ifNjtsSGOJbxsjy42bItOEtyRv9Z/K0Zyt41AfClJIMiXt09hocQmLM+Tf9Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
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

On Mon, Oct 12, 2026 at 06:33:59PM +0530, Karthik Poosa wrote:
> Add the PCIe temperature sensor offset in READ_THERMAL_DATA for CRI.
> 
> Refactor PCIe temperature handling to use platform-specific sensor
> indices and derive the mailbox group and byte offset from the sensor
> index, eliminating special-case decoding logic.
> 
> v2:
>  - Remove variables group and byte variables in get_pcie_temp().
>  - Change xe_hwmon_pcie_temp_index() to take a const struct xe_hwmon *.

thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c     | 28 ++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_pcode_api.h |  2 --
>  2 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index d66ae0b88126..6e3f1d873dee 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -106,12 +106,15 @@ enum sensor_attr_power {
>  
>  #define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
>  
> -/* Index of memory controller in READ_THERMAL_DATA output */
> +/* Sensor byte indices in READ_THERMAL_DATA output for BMG. */
>  #define TEMP_INDEX_MCTRL	2
> +#define TEMP_INDEX_PCIE		10
> +#define BMG_G21_TEMP_INDEX_PCIE	8
>  
> -/* On CRI the memory controller temperatures are READ_THERMAL_DATA bytes 16..19. */
> +/* Sensor byte indices in READ_THERMAL_DATA output for CRI. */
>  #define CRI_TEMP_INDEX_MCTRL	16
>  #define CRI_TEMP_MCTRL_COUNT	4
> +#define CRI_TEMP_INDEX_PCIE	20
>  
>  /* Mailbox sentinel reported for an unavailable temperature sensor */
>  #define TEMP_MBX_INVALID	0xFF
> @@ -1016,21 +1019,30 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  	return 0;
>  }
>  
> -static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
> +static u8 xe_hwmon_pcie_temp_index(const struct xe_hwmon *hwmon)
> +{
> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
> +		return CRI_TEMP_INDEX_PCIE;
> +
> +	if (hwmon->xe->info.subplatform == XE_SUBPLATFORM_BATTLEMAGE_G21)
> +		return BMG_G21_TEMP_INDEX_PCIE;
> +
> +	return TEMP_INDEX_PCIE;
> +}
> +
> +static int get_pcie_temp(const struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>  	u32 data = 0;
>  	int ret;
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
> -						  PCIE_SENSOR_GROUP_ID), &data, NULL);
> +						  xe_hwmon_pcie_temp_index(hwmon) / sizeof(data)),
> +						  &data, NULL);
>  	if (ret)
>  		return ret;
>  
> -	/* Sensor offset is different for G21 */
> -	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
> -		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
> -
> +	data >>= (xe_hwmon_pcie_temp_index(hwmon) % sizeof(data)) * BITS_PER_BYTE;
>  	data = REG_FIELD_GET(TEMP_MASK, data);
>  	if (!mbx_temp_valid(hwmon, data)) {
>  		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 94575c476e3d..00c4fc7d0124 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -58,8 +58,6 @@
>  #define     READ_THERMAL_LIMITS			0x0
>  #define     READ_THERMAL_CONFIG			0x1
>  #define     READ_THERMAL_DATA			0x2
> -#define       PCIE_SENSOR_GROUP_ID		0x2
> -#define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
>  
>  #define   PCODE_LATE_BINDING			0x5C
>  #define     GET_CAPABILITY_STATUS		0x0
> -- 
> 2.25.1
> 
