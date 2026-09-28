Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CB4CA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 16:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5D210E64F;
	Mon, 28 Sep 2026 16:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TY9iEduP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB7E10E64F
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790611857; x=1822147857;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qEcrATKB8LNXprLzT+VAzwrwG5tDkDAFa1jFAVwIWSI=;
 b=TY9iEduPoAo2pzE/Zp6E9dmfAQbweNFNDe0DtwjFp6zX+tfYGPulrKWJ
 /sXhYynJQcCZ7aIXpE91makUJl/4N3CiR33PTxKScKjvVhivdFbsRsKMA
 wQ1jEWKXOwa5UlZH1a6N6gal0OTl4CZ8Mk8hjXUOkoF1t/1yMXuBqtHj4
 uH8/Wy/WX8swns+rvihvL+fsVwY1VpZ31DFrFl+ir8EZvEoUOe6CK3ykR
 5YHKo+xVb5fGcj5s92RcVcNw+Aqn5qIFxuEzgVF/4H4DDCA+yHpUbIWT5
 xtudWtMPg57C4veYLf6jxK5E75SB1uDbPS6Skhno1k9Ka8EvMp0uS9A6T g==;
X-CSE-ConnectionGUID: nSlGVX0XQzWjDPTbZwxpmw==
X-CSE-MsgGUID: 1cAWOzcmTa6glzBAibqbtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="93805878"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="93805878"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:10:57 -0700
X-CSE-ConnectionGUID: 2Vt1kd+wTyuGz3vtegP6VA==
X-CSE-MsgGUID: AK+buAWISmmJlHmDcrbq5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278465874"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:10:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 09:10:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 09:10:56 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 09:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fA7F6Mx4dFfwo0gdxYPX2ChbBQIibs9cOi7pLi7/5Keq/4yOAqCGRpBVTlt54amIuq1QGz9tqVZilm0j7wR1Y/iIrn/kcmXY9HOJtj+LcDDmOls6g7BXBOz3TIblBD74M6IBPd4dQC1Zg2eI4KnCHK0KjpqFKaJQH4F1Up1xd1gzLCCKb8EgKJIqH3/b4L/8ubcxIXCH690jduqq2kFGurnQ5DAeAVXQJ8TYJTmPlHi/gFZxGGhpSyTTHRFW9Ojsloa8B7HY0drcK8CGnQfjSisT4YPU3WzZI9sW2lKHVDupo7TyFo88tPh6iygBvJnP/2uHgHr+G+Fv9p4OuAjObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAJfDThjXZu40m04jznjS+7ok26WllcX4DbQlcYuvZM=;
 b=Piw24V8UoejWgxu3BneGG23LgJc+vr6QCrpUQhwIWOXzzDZ7p26K8Nb936s2DU7QajQstmEkIk2vzBw+P90wQD4T5k/IQiJkTSW6aus1kxf5HAedml+sd1ea6cn15uWpFzn+1f5FNG/67YkzLU2ZFeffOKq5V2oXb9AG79V/6qInj4ULhjs+xu+ZWEVcRYZExjrDFjow1HR5iIKrEDDIuO5GUBICjk/bp8blId3hrFwEQcYgAcaNBZiBrwHIG+6tA2kaTHspXiFopXaHz+L5rj2no+I0XOit7Wj+jLV7JB/LFy3cGJpyrUXopczOETGqSpSfIGlAWXCwsIKZcdLD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 16:10:51 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:10:51 +0000
Date: Mon, 28 Sep 2026 12:10:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 06/13] drm/xe/hwmon: Detect unavailable PCIe thermal
 sensors
Message-ID: <arqRfKF_-HHrdvYO@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-7-karthik.poosa@intel.com>
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SN7PR11MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9b31e4-606c-47b3-17af-08df1d7b107d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: ELcumesQ/bBMi23HUCXqOjrj/MyD2Q+V4kIXo17BOIEZgC1YjlscrpGJLgd1cN3jfMwN3LQtiv0pM8vp3anGHOPUrUFcqtXnccJNJcv6vhglbLVvSPLmIyaICUzn14yxbx5QznqkwbwIQVcO9WYYvZEqp7gBZT8vXNcG/qBYM9jjix1YZeHnORm6mx7Ov07/+lhgAgJ/sZGpx2+45gGBe95RfTHuF4zM0NZaRnOywDeRe9pf8W6ibPt6gmr55Ha9ik97O/W3X91AoDZJGNTX0Ty1LI9gC0twgmW43hpI70ffyoHJCl51gYvxOKpSYcGE5X/K7xw4/h0GbUN5oYhBABV5JiQDXaNnTU2OuV4RpQy3XbcuAFC1lfSA5ME0LLCTms4d37fK3vpdK1Rg/nnYO90uPN7kNLvefeRRwfhhNVFShLuCeK0mfkgG4BXAwaGfhxh+rTbEVBImNUJZZGd9cj6/XOT8tVpeCF9aJVe54GzmsBUHsPkuvniCyNzi6IBtqlOelyRYVt3fdHRKO19L/q9HlCB7OfHrDFOOCp6R+vphEMD751K4ysro8Q9/4iA/cj7YkF54pu8e8bFTj0NfoGm+MBVCOMk2bAV9xkZbC9asv8POYNd2VWVS4YzX3oGkHhuxcVdPBLrvN5lhpKAHmZaKshbZMSAfyvzDEDmakr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Su0Krj0iDCNHPOeqlqZJ43NlvS2rK0xN6enRrZALw+wcgVJGotlWSAkEAVHR?=
 =?us-ascii?Q?SgMIOd33SaqShPJ8klvImnhwy1a3E7quRcy6QOw10yMF5hIkNzfT896tlDzj?=
 =?us-ascii?Q?r2IgkXRDMabPLK6AeGONuVMASXu4e7EW4pCBtjOHGijhR/juyQRGo44VRE9o?=
 =?us-ascii?Q?vhXjKipsfXwI852yQTJU/gSLnD1a+f0uF/M0HQ7H0uBnJI3wh8EEfXqPZQ52?=
 =?us-ascii?Q?j5y99c4/DsiqLKR9M31q3yoGVPpUlQTLThMwAmf90Y3ZPYFoUukjOmGpnDpM?=
 =?us-ascii?Q?9/jO8MnwCWVjkqrXMPMbNKqdXt350eIU0AVYtojzaaVZj3Et78O85ZgIdvZg?=
 =?us-ascii?Q?mgFY7Q3A2S6cO8iaTOwcQdi1Zhp6TBzzfT8yHGKU+YmMYBYq75PPQ1+IfHAU?=
 =?us-ascii?Q?XrgKnJtGf+cLW7v28jenWaSj3ojuXEkj/QlkLmCGaZCCqCzxaei92xf85fB/?=
 =?us-ascii?Q?h6we1T6jkxhyTQ8Iy9cyDZdMLLg2877CSa7WZS2bk2N9giZM6uLrGhw1JVEu?=
 =?us-ascii?Q?yaCTZNFY56NwACJzuCSXsjaCjzHbX58n/vopIpYZyPn4dhB1u61vmF/GSiEI?=
 =?us-ascii?Q?rTx7KJKn57MCjm0jCE2QAgSS8RO3wXG+ybpF3MU310Q0pP2WGFn7OyBFsJJB?=
 =?us-ascii?Q?0waPJakF4RlDJ7/WsNt0ycr103i7kUQS7Ysi5rISyDtQ/QSdIO5GoJk97OLR?=
 =?us-ascii?Q?YG+xrBtwwfUqtrGZ2PYt67ruVbT0fOf0RhDh1e7YJwcMID+pMJfdpdbV4PnL?=
 =?us-ascii?Q?Rza6h9Ks4fJEf1Zyai9Z1m230onOj78Z+YqtpkKAHrslSl0Zv3HMpdCoReJv?=
 =?us-ascii?Q?mQ+x0HQY5GLCBAkD4SMpaD/ysOs25+eWz+vDQtp6nUzsohI5Re79KQ0xrCMo?=
 =?us-ascii?Q?13Xcga0OISaZXcA7ffLmRy8mLnZ/dFLgh7tM41bsfA76ev8V0FAep/S3hwu/?=
 =?us-ascii?Q?ZIVb09+jRE+yKvaA807idal3DPXeRpnK94os/yvKEqMM2zhqUglGajz06rFC?=
 =?us-ascii?Q?B8Tebu0HSLIZXBQnb5LVEIWFjnzjeE8y15rdhm+sGNXzgrRUdk3RY3EJqERO?=
 =?us-ascii?Q?x8SlShkX7JkzKIMzT3PgmLk4Rg5gW9o+kv57WD/CJ5Zwos/xx+1e4VQZx0y9?=
 =?us-ascii?Q?GMuQdqu7DMjjIcvUHSxe5W+8VwoM+gRgBkQwSEdjK48jl3XaPr529ZvgGQ7B?=
 =?us-ascii?Q?IIwq7d1+w7134+2A/AIAYB9BEJKwR01SU+DBUlUUAomG5PBH3l+qvG1ykuoR?=
 =?us-ascii?Q?hit/Cxs0y0mpNRr8/rC42aRSC5PlFYTO4pceHQwbiLf+OMMTmU8srmJ9kCWz?=
 =?us-ascii?Q?bnW7PNtEOzkPc7GSJDi1vOnVazGbzyctO9S9QmMCS5NUDfKJNu97Z/mFxKcI?=
 =?us-ascii?Q?yn6Rmp+IoPsM991/cvoovOMRl465g7808tx4fDkK5ys1tSWk4B8+EgFJy3i8?=
 =?us-ascii?Q?llcxNCwG2NBdwCYiSnLuE9kaGdXVQ0ehjBNAiIp0xuJkp8xV1i3pvXMWffQ+?=
 =?us-ascii?Q?TwZbRL/+Wdbs8lkl1y660XTxO5hX0cu9D73z79MgQi/A8tRLTEjvILuQRw4+?=
 =?us-ascii?Q?e/P4ApFV+LAq4c62VgA/caplwWaGJY5WkneppmPw/8eBWSJaFyBIPgWqdST+?=
 =?us-ascii?Q?nrDlc4WvB5LxJLIuHbsiBDMEqrAg3OZlnmlRX/UUcYSUuXaROrIBQMR2Omxl?=
 =?us-ascii?Q?gwVngLNgHHYF/uhgQJmtktLQfsgP/FESRNJ44Tz9gjdhta2uvmCztKG6GEyR?=
 =?us-ascii?Q?CrCOYVewy9cZe8EBP74al9SjBOEl2eI=3D?=
X-Exchange-RoutingPolicyChecked: 0JWCMaQHYtpja9bghV+VmBy/5go0z0PUQK/dUa+4R2rFWNiq9Uxnw4L+Esie+P8gV0LhD1u/eljlTkzCXL0vxSO97GbotVAMA9cj/qLHOwGtxJke+5ERnnbPjavlsH/oX8j5QDpey5wGxtU7WD9gpiUiEpHR2GxGpNcV8rEvdiR2etpZ/sf3nKengztz+ZCVe4ua6dHkrCFpJGLx8Y6jphyJVY/tCYeh/rNxaw2SJykRquoPzxNelfJroZseZ4zShdYuVRNVSK1QqyIr0xcIcjQQz/j6qY/XXvik7aMsS6niAMBIcFaUlwkmeKNtMPZogBVf5QCH7rvwlDuML0voog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9b31e4-606c-47b3-17af-08df1d7b107d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:10:51.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWuJRn/bry8C+zg9M5k/DhNSg5qY5JaR4EK9IenlXOWB8E5xDFNOFuj1PSvtGWN3x+cmZExRJ25Zutp7dI325w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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

On Fri, Sep 25, 2026 at 02:24:22AM +0530, Karthik Poosa wrote:
> Return -ENXIO from get_pcie_temp() when the mailbox reports an invalid
> reading, so the PCIe sensor can be treated as unavailable. Guard the val
> store so the function can be used purely as an availability probe. No
> sysfs visibility changes.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 83466b8d8d27..4a7cf913e6c8 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -897,7 +897,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>  		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>  
>  	data = REG_FIELD_GET(TEMP_MASK, data);
> -	*val = mbx_temp_decode(data) * MILLIDEGREE_PER_DEGREE;
> +	if (!mbx_temp_valid(hwmon, data)) {
> +		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
> +		return -ENXIO;
> +	}
> +
> +	if (val)
> +		*val = mbx_temp_decode(data) * MILLIDEGREE_PER_DEGREE;
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 
