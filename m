Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF47C9830E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 00:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D03E10E4C5;
	Mon, 28 Sep 2026 00:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evFUlotI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF1B10E4C5
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 00:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790554566; x=1822090566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o11qBCFTRU2W7ESlREtsqGaeFKHmvBNjP3wqWQZlbwY=;
 b=evFUlotI+q9c23SrMPOJ410K+5fuRFEfGErEREg74DpsrdrlUUig+CrJ
 z1dUbMrsEWK4WqTneQltKe3QxauBt5KCNThxXfJ+YCjTdHiRP/fhoh1Zc
 y/VDcABgJum8DE6LzZN3hsr9JFmrIQF6TeFDn0TQqFbUU0ilbjfTU+FmZ
 h4D8H5NCdlg9lsdeEEl85HsfeFbs+TO31n0QCTqZwpEeQ0f+y8OgzfF0p
 QZiUQqaxDVLwzHWxvLwbXhqtWxzb8HMKRg4qKPGn0oDhgWCkl2IeiEi98
 4X+GH1AzODrVpgHiLad2dsFdV7gV+3+Vv3WW9/b2GZktV3Rvx5KH+rUyQ A==;
X-CSE-ConnectionGUID: g7ZovV8wQkWGPzb+mVgOFQ==
X-CSE-MsgGUID: i1J6Ieo3SC2zP+aq7xyIxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78812248"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="78812248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:16:06 -0700
X-CSE-ConnectionGUID: ZneqAXoMTNuiuGge2WNyXA==
X-CSE-MsgGUID: mQWNuOOUTcC21/GRpMHtAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="278252952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:16:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:16:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 17:16:05 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:16:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRVviK3eBXWgVt1bMCKqQMXI740lvzwZ9Vk+5iiinNMPWZPZZeuIExPClaLKEB83Ttej60pvvCptNGkkN4M617E6OMOJOf68mO1pVA0aulIY/vs/0Gb9i/0cg+y5b/T7RxNUW9HPe8RF56b0D/W+0FU+VvL61hsXIL3WMB+2j2sjPcrwJVe3MKj3U7WZiJMVs32trYd2CmELX7+12skYjfdEvsQg6pr2qkQNzOjFAYg409fvXvyOJmuqPBZXi6uiG67+3Z9Z5l8xnZP022Nx+XAHa+kHMniEwwZKC6YSCvjGQeccjUTBukXAWcJyYlxvHA0z92tBvPPVNg5sX7Sx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kiN/Y52AkPfFuz3sMreiWeapwvMdM8uSsyeai2bCXA=;
 b=Bm+wRuCMNUn69s3B88IAtWPf+siLFtxI2tafo1T5fZvNyXx/icg1zDvvPHhuJLxbRqcKjQmVVV551fwKcBjcwn3pl04F7LCpcQvWz6uQZCAI0IvAODnUyGykiJ7yLxdvwi2CD6M5ACvA4kqIgGUTlTxJE37Q79ljp7VOaG20p21ix+Cezy2Sd9kQxF8wAWe6+bgK9LEVi8ASpYZiRwVtaVAGRBHJTUEMp+xuSZbtsZzzmZ/VZFVcQOvQ/eGuQva2Quxrqf6e4REpTf5adteRWTlumX+xTqqW2aeiyAhdZsA4RAJLDDK2En1oZLQBKhcGXBvGOoPSwr3+vGLvwMKd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by LV2PR11MB096109.namprd11.prod.outlook.com (2603:10b6:408:422::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 00:16:03 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 00:16:03 +0000
Date: Sun, 27 Sep 2026 20:15:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 02/13] drm/xe/hwmon: Decode mailbox temperature as
 sign-magnitude
Message-ID: <armxsfvROOsR1DRL@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-3-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|LV2PR11MB096109:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a54dbe-e542-4d04-f75b-08df1cf5ae7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|3023799007|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jWps389xivBuagsNlxlTXWS9Nfr8vBkQh+r183MfM9B6vTXok8BTngkSSjCvIjuIdB8opV38WTJgfuxV+m6su1k4RewqgAP7lYmGcSo6UP77TujL6fDXLaoS7lsf00z5B9YAYOX88PnQQtdLNUwWQavIZyH7aNIu0476Hs/U9PI799/dcIBZZ6PMKKElrE6Fg925pS/CTrpz56mVHk+P3osXOFh7EL68RmI6FCfoY6jOv1qCf3A5goEbZa78l1U6zMZ76KsdBc2I6WyR7mHNmTDH/kRJe1ZQYmxbPQPFANZ9E/rY43P9/y0Q2Wo7EWUYhGe0pm9JqMoOImtgA+JZNn5yytSzJgUKi2b6tJf94el71UUXHchT71O2EhSm4AUB8da4bSBEkKlVxPNQ9ZwnNRXg7FPQnwuDsjfBZuV5uzTIOjSKxNeopt2GyQo9v/d4r4l5C9WfajvvDgUa3HKgp2V8Wdy/f3EQVyM1itISN4M4vmt9GfGISFf/UhhJ5EZoxN4HJHh0doS4olxB36EUCUvLtoBF6oy7eChcY/V5aZ23ChwGIhhvXz+HJLPZjN35BB1M4ogQecGXUdWBpjQSkGLWiLdhLYti1yFL8sSQ+YeENHbtxhQeR59VwG7fnv4d350eFQugVwrBXkZ3MrxrTysG5hqNkZvm5bf3ByUfFCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9smarwqfjMuF3Qx7jNjPwXHicc860ZFXupM0A8of7r4sxDXj6U4VNIvHjKOY?=
 =?us-ascii?Q?rW93ZhzN7rMDIMaLFPb0BiijBs2Jp/IBdFOSTxiJZl5layt/OCKFL+hsAR1Y?=
 =?us-ascii?Q?VWEUyF6n4/sPr1629p4Mg1u/hNCjkKeoBy6tTt066xwZGPCYRg5fbTzKK85o?=
 =?us-ascii?Q?4LukKMbQy3i258KgYlwo7ENdikDXq+tjpZluAOT1ZOu5gZ/PrzZGk/niVR1F?=
 =?us-ascii?Q?3Xleh3J23FDm/JdHsulJ0XPZnjl3NeCdAqg65kJ9OaTYAPGD/ukyMWwwwNAl?=
 =?us-ascii?Q?7kWddqRptAgmAwXmAqWlHfk3vmL/R3gglO/5bwNIkdEjkWXtt4wrhj3Mi7HF?=
 =?us-ascii?Q?ERbyNfk2Ve2S0H3yOn4Ts9uAyjuSUL+/FEY3ZFiJQMT34G0kg5YkI+Fbkcnj?=
 =?us-ascii?Q?F+AQscfRMo1AGyOfeKDmCRuzdsz7dGdRsxdNkG7ZCZ/WWE8Vx81iLHz04/fR?=
 =?us-ascii?Q?/bDSuthykyC1Pf7DmuSqQFI2ux4J7f44owSK+2dD+zf8KoSBlO8gMEotTwKB?=
 =?us-ascii?Q?h5bUeAlgG5x7dlxATJZOV+K9Sd12ysz4nLPx4WsCDWV+Of4e82zd83TuW8Bw?=
 =?us-ascii?Q?CeZXOglnmwCpdGWfUSnIxmeLRYYK/tpTOOkU5oCJeeadsxKswcY0dPfoiRBt?=
 =?us-ascii?Q?YSu6duisb4uuNDY5QY+ckc6uc40TnNPbG08BLmpGYv7JgHnuIKLrHVnOblkM?=
 =?us-ascii?Q?fUkufuGalaI4uOsnAj3ABxupbUx81EFQWgh3zi8O7uqG35F502J8bhopNKDs?=
 =?us-ascii?Q?NdfqNs/xCmtHG6xSJjauZR3P5nLd+507z2rowXEMCke9IXiNBe5EZNCeOvJ6?=
 =?us-ascii?Q?o8+1rWuKg3d6nlZz4+VxmiJe5MgSGGladGNK162p+IMic4r4HAExHJsIpZcU?=
 =?us-ascii?Q?G+PyeYchHMzXPlJ8OoKL54KzL8WD27X6wHmSY0bj+oiL2fgdV8UV0NNKg6PF?=
 =?us-ascii?Q?14V3GnNBhdh8Zd/pp6gchyinZ7mbLULPZ2ChPqnrN9oqBbVvmGRP3UqXEmxv?=
 =?us-ascii?Q?O1L44h8XGxFv7HrEF+SIcWovh3UtvvDvCgtfXMzlvh8S+KASbqmfmREq6Hwh?=
 =?us-ascii?Q?Xo5XUVLMIhUnDyxioqOWhVAgMLFSXVe1/EbZ2TpmoRCyTp9HV6XT/xcKFXLE?=
 =?us-ascii?Q?/oQBkouV/Ac26bonUFbDS1b1U/MKasZrf3mBlY5G2gqqPGu1Rn2tXDUjG98H?=
 =?us-ascii?Q?mHjRT98YdtazP8guMaD+1V2l4VDpXdM0qy05arYrSEYy66lGa5sa9o6mAINT?=
 =?us-ascii?Q?9ghp377hB9oP7wpeMHeawoL4Y2VzWC2kB+EDwDuPM7cOL+GioHBD6CWBZOp0?=
 =?us-ascii?Q?lBZgvcFdF5PqSuwDR93a7KZKJT5Rk/GHeRGHEqty75ADWOPyccze9KrHgihJ?=
 =?us-ascii?Q?z5bGfSpbutlDgr2fMZsyaKl1WY6hMnrh02xFWObi/Wnm3rJ+HYVYiIQHnPmZ?=
 =?us-ascii?Q?BnyqNej32Sww0Md46qz8Hx4/3BSThxHUjmpWNGqLGHL+JJZIZ9LNgzzptMD4?=
 =?us-ascii?Q?r7wdEPiTHVXyTqT1CIVp4H14tZwj6sf7kQQod1V4RsS++nyvm+TqohG+YeBS?=
 =?us-ascii?Q?C/vlTKjwYRSyhS9VOtCq8dC65klrKCj9M0xs94b8Bx0QuKH1aQTQGE0/JC8K?=
 =?us-ascii?Q?SEuA0Wy/1bEhtBiPVwRkqGiHhAqz0QVz61XpinjDb0Mj6UbY2jCe1mBlkBLR?=
 =?us-ascii?Q?XuOrosuNeoBu7R+dveSpSSkf3YVNoK/mDIWZfHp5b5rQnddDMmUBDZlkdsxY?=
 =?us-ascii?Q?wp9VcKeqzdYIlMM+R4b8FT4CGo6BdGU=3D?=
X-Exchange-RoutingPolicyChecked: PqWQ9rGkJbhPZpxFxTwcjoQHe8DakjiGEZTDiIPWP36IYXaCmQiTe3bnbGTDQ5gTJ4b6/aqxwakf2h5f3BjX3OvA75MtwXspzZXORgtTfME4HKfRXo7wG5jgFoxJPbb966Qg1E/iEFGBtSHe1M/39RkoLfmLGTYaxaBnKBb0yQ8Ar1vgDxtdDpWNQJXVeVRe49h/PHW7aov4CcvuP0tOk4llw4lrhCk5LAHI07W4sydwS1EMjD2FtgN0CLJbCpLdp9sLsGSIS0vkTPW1fVc1Gz2wktY3ftvsjiJuu3fY3tlwa0+lXQlBupC4Vo2M5xWbDmXZoPqIaf/zeettOoFG6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a54dbe-e542-4d04-f75b-08df1cf5ae7c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 00:16:03.8086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4nffm5mUeWkDnT0LPOp2Hfjj9+FY94II5dHduOx/zookYNrM8y0SYIBTE9h+w1j7k3exccLebzK0UiJiDCJDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB096109
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

On Fri, Sep 25, 2026 at 02:24:18AM +0530, Karthik Poosa wrote:
> The mailbox temperature is an 8-bit sign-magnitude value (bit 7 sign,
> bits 6:0 magnitude, range -127..127), not two's-complement. Casting the
> raw byte to s8 decodes negative readings incorrectly.
> 
> Add mbx_temp_decode(), store the raw byte as u8, and use it in
> get_mc_temp() and get_pcie_temp() so temperatures are decoded correctly.
> 
> Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index be3fb6733b6f..57199ea00a60 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -104,6 +104,10 @@ enum sensor_attr_power {
>  /* Index of memory controller in READ_THERMAL_DATA output */
>  #define TEMP_INDEX_MCTRL	2
>  
> +/* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
> +#define TEMP_MBX_SIGN		BIT(7)
> +#define TEMP_MBX_MAG		GENMASK(6, 0)
> +
>  /* Maximum characters in hwmon label name */
>  #define MAX_LABEL_SIZE		16
>  
> @@ -139,8 +143,8 @@ struct xe_hwmon_thermal_info {
>  	};
>  	/** @count: no of temperature sensors available for the platform */
>  	u8 count;
> -	/** @value: signed value from each sensor */
> -	s8 value[U8_MAX];
> +	/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
> +	u8 value[U8_MAX];
>  	/** @vram_label: vram label names */
>  	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>  };
> @@ -814,6 +818,14 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	return ret;
>  }
>  
> +/* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
> +static int mbx_temp_decode(u8 value)
> +{
> +	int temp = value & TEMP_MBX_MAG;
> +
> +	return (value & TEMP_MBX_SIGN) ? -temp : temp;
> +}
> +
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> @@ -830,7 +842,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  	}
>  
>  	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
> -		average += hwmon->temp.value[i];
> +		average += mbx_temp_decode(hwmon->temp.value[i]);
>  
>  	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
>  	*val = average * MILLIDEGREE_PER_DEGREE;
> @@ -853,7 +865,7 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>  		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>  
>  	data = REG_FIELD_GET(TEMP_MASK, data);
> -	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
> +	*val = mbx_temp_decode(data) * MILLIDEGREE_PER_DEGREE;
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 
