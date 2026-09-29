Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384EACA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2510EFF1;
	Tue, 29 Sep 2026 18:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zjy3wlt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9231910EFF1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790706581; x=1822242581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JH69COEQWlgFzo0z9R+JTpYd8mBbmiNY5qIAO8HcolU=;
 b=Zjy3wlt08igKCaqv2GanBmKPqROyLw+uTwU3oSNITbkg77cd3xpJvPR0
 TKZaANgr/2GfeqmJVlNOug0vsBbDpHYY8WSMABRUVh56XQUOyQXXXiZE9
 s6agspnKJ+mWi6zqYJqLWbX1kEhIp+SMEnxtFPVrKPDvnt3cEDNs7hoRM
 wk2aNEdTWU4CxjZFibvFIsZEJvgGVcGlB3kSjediTDbUYesqFbYCGbe2a
 qnxabYv0Rj665VfHWp9ymtOUc3l9S96HtK2Pa+CRmgNZ+HBoZAoXmpRxy
 vWovrPPyoZmEbySehHz6VZrLSMbhTgj3gX40lORWYN3SI3oNdZufwCPxd Q==;
X-CSE-ConnectionGUID: VHYq2ViLQ1G4Qi3rT+jrig==
X-CSE-MsgGUID: 4le/V6fASDGMxDUwfLNAwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90333134"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90333134"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:29:40 -0700
X-CSE-ConnectionGUID: 0FBRDDFsTqe3zd4mJtvKzg==
X-CSE-MsgGUID: herO5wIgR+eBezWislUBZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274990223"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:29:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:29:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:29:39 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFhrR7kEC61/3ivti4OiaTgXZOgPQxGybtR8giN7kNWB5EC/QdcwSxVnma2PuxcYOct6ENb+QIuFPozYdoEfTVwSRt4edwXKWBKvE/utjh4pgEDHOEELCZWzljdu5vxjOUjwOuIEX8CLe0Ux6+HniSe4GIjidWX2o0ij6+wiRo8EL77hUdjdMvRQhfXtWgWKNdWgW741Npe3ysGr2A0QGxVSg6UZ+TYoi7p3CTmgLWFxum11Zz+AmEC88Jeze2IsCwd3pyjlWMoGguu+jgTN9U5phJZ46vmg1fy05Zece9JH0YMyf3xSLLkNNEJWvbK71INp+YECAGwwE+Z+XwJ7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wv1QWHZdvpjt0yQhiAOXIjUj13Bs3eDuo0o2BVkhdc0=;
 b=WYiXKlbmO8KBYYLnIeQ1eqaRN/zzyez2j+1w7A49KxsvhICXdWWL7UcOpIsDLUEw91x0BKaGe9cJjaHvafBv6sO5AG6/d5FSqtG+0znjwN7XLO0vbg4ZKMJwWJCUdFQ9fEUmykmmuw35HG7fL6VvB5D62gaEjmjYnU0lZYDqhhHbD/TmWK/jPeFPZe49r1bidkA3L/UpybcYZltKrQnYxaPwrJa3wmQndhvz6wDiS7ADZ3c3EsZWm5h7UKhc3lC73y4AqXByAtUtZgfi+hJ0SBdppmU2bLsJjzxzMMdGmEQDMUgr2psJ/idkeVUmMRZL1f5rpxEKYLViWujXquqDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 18:29:37 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:29:36 +0000
Date: Tue, 29 Sep 2026 14:29:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 13/13] drm/xe/hwmon: Update PCIE temperature sensor
 offset for CRI
Message-ID: <arwDgY5TyDd8UOxv@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-14-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-14-karthik.poosa@intel.com>
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fe6259-6e56-47fa-6f21-08df1e579daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 3YWX8TeSv+RFVn0omZ30Q+j2NvuttXInZi7HgfSGdRTW1FQngE5kGn5EoRdLA8cHOzQrKtoOX1yVecYKXaXizS1gFoxGfbU0E6dXeYJP9gPOA7m/pk1kc8+QM5gvn0FtaGQ2poshKcTXkEQoQwXpI0kT6lIPvxMRYF0/B1uXpm7VO5NRc8Xn8Wj1ZE2YrfgbMLTS7R7gWc6XruZE2EGhklyGadRLecV4g3kbYhmMGmgfCru0tjwh1YoO7x69qgJbjpC4bJ5mboXAFL6GtKhruH3xCQIa5hcPYeomtHIixcggh23ju6ve7AP0F8DOZGoBCQZG0P7fEctRV/mOmjRNBsZGLCfHmlEnR6udSYkPu7pB9pnwJhJRSVeRVUyeE3CrPkggZheJVODhRu1ZhbtwLMbghnxkSQ3oJEkjoNG5HtLe/N6V0U/lJSHNbLu3OnhfTBSo32gt7dO9QJb8lNylzVC0zBun2l4SlP/Cyby3wHijXWNeqhTBYdyJczNNKKo9CZzmJNz1NEcndgGw/9A444ncD9jAKN9OHG48ED//l4Ss+Y3VjRr/TltPaUMUNqFwjH5C5hNW+L6uHgpC9MBJkK7YXIUY7iYz/++fFN10twBTbZdpcsZmZ3u1zsaqKbM8A8y0C1Pg6hPzJhk/Q1MRziu/rtWfsuBd0y4LXoS1lgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YqAVNpXmWYrmtXFDweJlpHtm+HOsP6vb0zaxO7x7mHbFwVmi1o+iNDYI49jf?=
 =?us-ascii?Q?YXygg3FtWbfo46y6JuFhNJd5+jeWgEkuTtS/rt9XI6Cxv28N7wAv2k/ESp1B?=
 =?us-ascii?Q?3SMFa8bc8DtCFw5Y2B4tfWivFJ787D2V9c1tSJvdopreBw8blYhYvEEkWRAr?=
 =?us-ascii?Q?J6kHAVDEwnjCjJJbIY7/qjc+a/Vp+YB2oef9Cwbo6VOO/WluyVkus7UrzgUS?=
 =?us-ascii?Q?hsw08HJDBCgy70bnOj0gpyR5kDYyVHNPe1wdDgdQbjI4+8HNkjalUzppMy/y?=
 =?us-ascii?Q?jak495kcaYMpp8rV4I75rJgOovRdEeXK8dis3WClOlIqOtW6/mqn66yUZ6f0?=
 =?us-ascii?Q?to+MkGthKsHNeoo6yoIdvIyTEZAUPrV1O8RDAsPC8eTcHFWL58CPjQZdihYe?=
 =?us-ascii?Q?bd8dkksShVUCRysjkoHb9dmvvPjgW7bWa8VHQbdv16ZheJiufs9LULHXgNdu?=
 =?us-ascii?Q?NuzSpQ5bIEI0rCbm1b8CxeCGChs87/ZZFd7ejDEs5vid7Gs/oSVjSJPNmz5e?=
 =?us-ascii?Q?vDlV/XURqevZZHi3Zs7wydzqB9stofywr5oCJdGDweHoS4Fe5JoQyftEOlB7?=
 =?us-ascii?Q?DSz6gtz4Hal6i0URC1HJgtfPBjPT62oKkU0Y6T/AHJUSi7Jz6HlCkzpfDYX1?=
 =?us-ascii?Q?mO56MvJUR2FqpheXOZDVug+y/kGdvH0U0HmVTPjo9H0LQCMsxSm3GUmzwig+?=
 =?us-ascii?Q?6I38bpfJ747Gf345l5xM/yJzUztDBde8TT7l46DyrTz7dUtcEV7+/vN5ZKJS?=
 =?us-ascii?Q?OWIohxEVi00P6AjdIR6cLGHH9p2UjIIjIYUT7J5AS/ztMb3feV634mByoFeD?=
 =?us-ascii?Q?f/b6UoXuVvLa042iCPAUFiidz7SA6JEneuZtUZpWDlJaATfPqENMTJ26WLVJ?=
 =?us-ascii?Q?3Pk+/cCGXk9xlO2uO7dcBNZacTuXWj9uyyQIHSSlmow2YtnuO9I/2J2txTjE?=
 =?us-ascii?Q?8Xnsze40EETXQ3LnzlSuUekjOxsZ6aRxNqNE8ACTDLbVJSKrzkLQQqhTX6Xt?=
 =?us-ascii?Q?cxQ2nAk2hyZvmdryVeIVBFLWaExu/eCZ7JX5fZgTyfEzj8fjfMuh4uIl0dRN?=
 =?us-ascii?Q?3nCzTgZfO71sSuaEKy8jWRCIqjyMRHM8AtnsUzpfRB9w1jp2QB/cY8DzmOWi?=
 =?us-ascii?Q?yur6f7Sa+QHSwaFr06K5h1QLi8XJCVrLExESvKDoOrOYkf7+5yVh2F8CVQwt?=
 =?us-ascii?Q?fRYLgUyVgNJn/fS9J9qrYkEqSgWqMKC5dPjcAMAq6X7p228hmCpqW6ZXpGZp?=
 =?us-ascii?Q?42n8yTNskMDGJonFZ54q9I2Wshu3w7xkHe6tOZchkSUef0nDr/+Hti+wRCsi?=
 =?us-ascii?Q?+vNT5qGhLYPufDXHoUNPZzkFEuzb8MbAtIK+B+rbjjsDDqr5Gpylibv0GZoa?=
 =?us-ascii?Q?s5aKWZ9cJO583iWkNZIznbrZgrZUVAgSWj+WS6pXK+JZ1kUgubK9g9adokew?=
 =?us-ascii?Q?4tockDhVcvaerw9elMmwPVvHchAgwY/ILq9yGbNDV1v+F3CCKyW/9HXSJ6Jp?=
 =?us-ascii?Q?hkkXxlbcUgiLYfCkHkGPoRdbFv1+UPxm1O+fjO9AghO3/seUemsmWGG6S9yJ?=
 =?us-ascii?Q?im55UM2uRqYABuAMu0qsKk8by1Sj2vEGV2/ljPpbBIo98gVYQ/EeJUsFl28b?=
 =?us-ascii?Q?bDrW/cZ8A//G2k2yKOc8e4nhdXkGKrlEtdJyq3PeKNMDwxe5xQFiKMmyUF05?=
 =?us-ascii?Q?7tdSaXkcrqoMsPO7sMk8wAHuTz/JZrpn/Nss48XbdQr7gKdV7ZsCfQ3Seu6X?=
 =?us-ascii?Q?WrP4+onPub+PdOoPl5HtM4T5GMw8smg=3D?=
X-Exchange-RoutingPolicyChecked: Y8F4z+rsB5VuDPmrNxwrvmwPh5AVhX6q9qwYgu8tOxYivd42ymF51p2uc0gVNvifV2jzbjl/qJcbiKjDCtm3znJfdfrG/03keL7ZCotySsPQJrf4bNoTfzxlE2865f8p+aoW6KTIMFg9/q9jrG6B99BoKalfEsl6Nw1ZfJtSHfK1CT2BT/Mb3ONElz/sFazZNSb12QaZF8nzK/FHjEfP8F9KbHF32UvB8RRW+OvseTnKRod+5X+UCh7NuAko7VALa0xAHzbpxGl2SuzzXbKJab0/0sqh+jzvUogF8Kf7PTRXciniRlsdc8ij4FRjYXJFMlVNiywFnwwI51nlAUKD+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fe6259-6e56-47fa-6f21-08df1e579daf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:29:36.8525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpyrCwSVVaUk9BX67XFoffkT54/MWBfIKW3dst/RiGlU6d2oCZH2MrNO78D/seZ1pLxsTsbnTmqCAPbV1rDOLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
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

On Fri, Sep 25, 2026 at 02:24:29AM +0530, Karthik Poosa wrote:
> On Crescent Island, the PCIe temperature sensor is reported in
> READ_THERMAL_DATA group 5, byte 0. Add support for reading the sensor
> from this mailbox location.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 79240d4aadd3..fcb1d2f14f5a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -113,6 +113,9 @@ enum sensor_attr_power {
>  #define CRI_TEMP_INDEX_MCTRL	16
>  #define CRI_TEMP_MCTRL_COUNT	4
>  
> +/* On CRI the PCIe temperature is READ_THERMAL_DATA byte 20 (group 5, low byte). */
> +#define CRI_PCIE_SENSOR_GROUP_ID	5
> +
>  /* Mailbox sentinel reported for an unavailable temperature sensor */
>  #define TEMP_MBX_INVALID	0xFF
>  
> @@ -1011,16 +1014,21 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	u32 group = PCIE_SENSOR_GROUP_ID;
>  	u32 data = 0;
>  	int ret;
>  
> +	/* CRI relocated the PCIe temperature to a different data group. */
> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
> +		group = CRI_PCIE_SENSOR_GROUP_ID;
> +
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
> -						  PCIE_SENSOR_GROUP_ID), &data, NULL);
> +						  group), &data, NULL);
>  	if (ret)
>  		return ret;
>  
> -	/* Sensor offset is different for G21 */
> -	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
> +	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21 &&
> +	    hwmon->xe->info.platform != XE_CRESCENTISLAND)

this is deserving a info flag no?!

>  		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>  
>  	data = REG_FIELD_GET(TEMP_MASK, data);
> -- 
> 2.25.1
> 
