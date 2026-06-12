Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA536CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 14:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C2A10EA15;
	Fri, 12 Jun 2026 14:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIicbK+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9524210EA15
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781273323; x=1812809323;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WPX/FLWOvYNYOUZepbMJDiRbIeMNPIP+/UY+OkONcUw=;
 b=eIicbK+6UDnw5OdcRzK5XjjN/LojsFXElgeQpGRBOVXaba9lackTuou3
 8JRfR5feWR2sE6nETzD7Red4odk8JK6u1v7rvw2c7p/xzdwNv10CUbsSC
 Zbu7BtNtT3kruTV3mKz14RYjPOEJlpmHdp5JI3LlcDqf7P84NqT2wdWOX
 ql2vWdPdWade02a1Rnq3wuSBkczfwzoGOZtyYeOztUoj+QRGwedclDdF3
 GNR2D0K2OrvyRwu+ow5dBZc+tWLUkbDwJ4S34H8WJalu9UoqYzDNJlpeR
 2kN5MRWLyH3Iq87aMemQBfRCkOivvh06aLYE+tiJOPq2BtBXOrCg5IoXJ A==;
X-CSE-ConnectionGUID: At7d3kloRGOd3FdIYA6jAg==
X-CSE-MsgGUID: 7FSB57dGRnuRFuWjgSAqFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107536826"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="107536826"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 07:08:43 -0700
X-CSE-ConnectionGUID: 1UJ0trfkTm6ycfBSdDSxJA==
X-CSE-MsgGUID: 72U0oMjLSIqBczzWZidMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="244408011"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 07:08:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 07:08:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 07:08:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 07:08:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNuy1ON0bpKK+EstdZexgJlNk5vz0WsbEmYhjKYxqI8xM2dRm4CxhQCvbR8jUghIbaBg0GDWHVhUUqz6PrstGr0y5kV2aKTPgHpUGhICW8KyT75GsW2lvUoiPDp8XeYxMRMAr+g7LpOLTrOOcSbaGhS8bE+Ox7Kt8ZgdPo7jrkKrBFzzHUXsaQYK615C8H5NIbx7Z32LyGdXYdT86g1iU3D/KefFTScQrU+rv8F1JouGnJK7BRM2ogibdZL6NNEsoIKM+ZoHYNbzbpTzH5i9RZNlsWXPfLIK9g5C80hU2Lpo3SUtbsNXxtprhZHExjqOf/lHyxodw3JhJhOAx32R4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55/MOzEwZa+RT7Nl5iCPZK7L6PCSLXip24su50UhbvE=;
 b=v5R5sJOi36Dd7MccWJugFHoRm1aLWZgbeOl/AyF++J6iJBN/KASbfrdWV6i9TWsoSYuWnUcV/Yc+jYMleQF0em3GTdSx7jZ5k7YddnOR3Mbubwmx1+1xzTOk9jL489wV3BWa3k9h9XhO4W0fF1YawXJKem/WyRJf8RVErcpTSayCKDvpqNNqYZNyFbqxlWBQ67xL6BMDKbZE/Md3w1dg97k4pZ9j+FAfiK4hvRpuh5UGR7PbHtyvWMFsEorJwjjVLVH12g7zxUkcg4KxklrfvMVuv+XPRtzEpK1JOat+sOZxwtZbmEMEMcuqUgLqOUa4SG7PRPn9tOlh7XkSLEXWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 14:08:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 14:08:32 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Add missing references to workarounds
In-Reply-To: <20260611211106.GI6214@mdroper-desk1.amr.corp.intel.com>
References: <20260610-add-missing-wa-references-v1-1-0947577238bf@intel.com>
 <20260611211106.GI6214@mdroper-desk1.amr.corp.intel.com>
Date: Fri, 12 Jun 2026 11:08:28 -0300
Message-ID: <87mrwz97hf.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0049.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: f7133285-014c-436c-2b34-08dec88c1625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hqHPe0L9LJR+6UYHYnxByhAKT3eKEhUg52PvLOOs+k8cCrEp4n83oELn67eE/xGTsawCQKqYLJemfnheELjem/X5Rgm13UINcLB3CeSHqSlmMEA8PMAcUiqpcYaQlooWjVCGnyvGkROW1BVTengtsNBDg/l6ALL4D+F2BTGS3Tb1udXFV3/wf0EkpyjlCrpBrfMvDUmcwYob+w+WcDS0/7u8NEnu1Rp3Ibq6wm3Elx9WKyyCbId5Cf/iUsy9vm7KOduWkYQwuJST9g/uZWYWzhnci3zWzDzICskN8hQY1KroDSAm6hkK0wj4wlFsJM2ZvYnuYTtkOB1IOwSFSPoJQW7IL0kFGwhOAzFKL+RcZ/ARtyJn3g6S0bJAFMfbWU8AahS15HPWMUDLK4IF1V5/FfK33Q//0SANjbAev5J0qOEaR2X5Qpx0kmJ01ziDHcUpETM+kF3EI7+mTUyiL/W5CkZvDj+CDm5EOkINx0eBkualXl0vgCr9DDsfgfsfu/Flhs5zk62yIk2KgvfIdZrOi3tWEh5HL2Jh3ZItFtN49KLhuKWjwms64veaVw8mFNIvbvA4g6bxhd1+RwtgPSUYyYWdRbDzlBz+L/7bpOyr5mqqhAdCYRAogcctc1zXwimn0OuHGAcCSq7XftyEhxBisUTLX/XDXZhEsLr7nQ0cY9uNzEEFJNSRkqXuUiSvbWrV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2OLioQjhzNg5nZlBIQotLtuLWet/WROiSm+0Cf0D6R7XACtpMjyD6HESfQ0d?=
 =?us-ascii?Q?3El0RFCyRIOoPL4HAV2ZG88nVkJn0wAZjaEBnIeBoPp9EfXM0Bb2Imp1rtKo?=
 =?us-ascii?Q?6rwO5FOfKaZUDjZDYjM+tYe1GxTg+009LEVeOGeJJpxU85fatNmh8DikTj9+?=
 =?us-ascii?Q?X/sNYwh73xfLz9Tz+GGvBd1GqpEVPL47Yo9vWUGBNpsLzsZk+SXzoNTtC4Ii?=
 =?us-ascii?Q?AO8IgwlN60XV5pSivk+kwROoHFvREHVeGmLYhhYZMkl+r4+xcdEaNHdOLqy6?=
 =?us-ascii?Q?m5MmJ0YasiYZjQP+fdZZT5FCp2ei9ZfdAZ2lkfZuWHg0ZqAHkEEnjdXKJu1w?=
 =?us-ascii?Q?7WNOHEUTDqaGxY3Mw+OvUAyTZ+p3XkIFz7Q3/8xMaz6Xt1+QJxLobN8oFDk+?=
 =?us-ascii?Q?g9bwZBLqFondA+jX8Bisdbq3Ga2XHYXMZu3/9MeRVu7h3huHpkYZG8wUyxyb?=
 =?us-ascii?Q?M1xpUc45VuaVqucF5uY2vvKu0xOhf7tECdqlFThyQELX0a815EuI7amq8Fx0?=
 =?us-ascii?Q?zRFSw6Wdgr5Br8sU6VwkD8NEOiKW7g7o9/F4ishTdhuMUQior1Vij1g2d8qR?=
 =?us-ascii?Q?whXyxC0XdshfEQqvg4IXw/m/+te+Q+1uUpH1oVSae7qExF8JxyzZsmP7dpkD?=
 =?us-ascii?Q?R1fCgp6W2msvH9dFBGawE44oPMj3Lk5cEN8NGshx6A1Wjr+ziNfajW2Vwi8K?=
 =?us-ascii?Q?iqIz6JJpstxd+HgjQf/20Sbp+n3kvqsS5VmiD0tyRKhC+LHshY0cRZjrz0KT?=
 =?us-ascii?Q?dhYCXCs8w9gObuaSfeFx1iWdobwzKQhx+jYvsrCM2oguS+vWQkn530l0APN+?=
 =?us-ascii?Q?Kvu0tzemv2BOtIQcPe1KPDeivE6WBF98Q/f1iQxS7w19gYrZErpzS/+QW60H?=
 =?us-ascii?Q?Gz+zAKC/BTOnBmUt9Z/6skiL+F8A3pL49dPXFKo85t0mUIIx/7VlYwfReM4L?=
 =?us-ascii?Q?fkqRErl9Cy17ZVUDHP5e8uD5m+uetdZQgnWjFbN6u9ekdUEQQvlimb3NAI99?=
 =?us-ascii?Q?34ej58pCEZwcWM9VAL9KNqD/VNuWXF/ph1JyV0yVIGIBKiMa0LUZCqe/LG5Q?=
 =?us-ascii?Q?FUx0eRLI9Yx0l/kb60r6dych8YEgx8j6wCEuhT6MAX7yN8z3u0m78RbYgGIk?=
 =?us-ascii?Q?Ff9Z62BzRm7FLnkjfBsSzK5mpdl0+J0eIqdugOnShw9jWKJ16Ox/nSDTYHFJ?=
 =?us-ascii?Q?s1a5SoE6pCIYmi49fX6pTuSM0/w3Vzf5SesqH4jkKt2cqCs30nnuM9LljARy?=
 =?us-ascii?Q?8meYSWbtlAoFGzcY0no5kYSAY2p3Sm9ao6S+dU+NSf8tm9h3u9KNRJSmRtKa?=
 =?us-ascii?Q?QVAv9w6FW5LAu4VOmBlTiIGUa2Zm9skt584njtO2v+H6T2HjofxDwBJxtLk1?=
 =?us-ascii?Q?IVs7vZoBkrdj/15TvCotjQUY/rK2uaMG3BuHf2lZ+kqAmjr9RNTUWBzanzv/?=
 =?us-ascii?Q?VlUP9NIYM1N3eoRCIajokZyOV/IeecApBJyQkiQuIC++oonJL5sSD2DMhicx?=
 =?us-ascii?Q?g0SuOFsjze5ZA4nJ2nyJbJcYkwZIoODjnSgdvNtUCxuhL2X5iOhlFL+EnVdS?=
 =?us-ascii?Q?sZ7FBZecOJvCHPp0Hyg7FIEwGUWofsdGGVM4bmsfadtg/V1EiRxIqI9zh+Hf?=
 =?us-ascii?Q?hJpwBXCDh4E3T6I6zbPswwEeBPyoVv9d6wiU+mmZzc0Ee6dISoPI+9QHZwZw?=
 =?us-ascii?Q?j4whaAfFIA6CPY61poBDvp8a4YEpxWJlMVuB8dRZMY45tlJXydBiTj32G8BT?=
 =?us-ascii?Q?cpkDJr1ZMw=3D=3D?=
X-Exchange-RoutingPolicyChecked: b7T5L+OX+fgkzAw7Ilj4FpHqga5xutRtgVY/7zbY5c8bulYp2AaodzNlDUuebGSwybuijAoy2H4TFsqvSJa+CIGLWhZPHvnoohf5138dg2eNuGmqKMNaCpH+mCpCIbtJTurm4GPWOekabYGxIwwLclLdfYWiEOUkstUE68OWnOe3+Z00hO3yeoSGCOBSQfT1mAugOoBAdViEcRfgL4nYoQoRCN7dgmD8uaZyWRHR16Fi71/S1P/XrHDkdhjU1izd09tv9S5gFNFUsM26tjd0kzmCJbhK5+yBHp1c2JTu+y52hOg6E9VyPdbJac/7nB3pJBl/vqREf3GqwCmROfVJrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7133285-014c-436c-2b34-08dec88c1625
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 14:08:32.7132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsE0DKZI9UZ1gqObVgJQVPamz3pp+ZT3jPbP53XA3AmgdpUmJOFR80erRswDjPdrG8Saa12rmXEwQc7W6PzTJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Wed, Jun 10, 2026 at 06:20:47PM -0300, Gustavo Sousa wrote:
>> Sometimes the same workaround implementation ends up being the
>> recommended fix different hardware issues, which are tracked by
>> different workaround lineage numbers.
>> 
>> Some of the Xe3p_LPG workarounds got "dismissed" because the
>> implementations were already in the driver, however for a different
>> lineage number.
>> 
>> Even though the implementation for workaround #A is already present in
>> the driver for workaround #B, it is still important to reference #A in
>> the driver for tracking purposes.  Without such a reference, we risk
>> dropping the workaround implementation if, for some reason in the
>> future, we decide that #B is not necessary anymore while #A is still
>> required.
>> 
>> As such, add the missing references for Xe3p_LPG.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Applied to drm-xe-next. Thanks for the review!

--
Gustavo Sousa

>
>> ---
>> Note: I realized this while reviewing the workaround database for
>> Xe3p_LPG against our current driver code.  There could be more cases
>> for other IPs.
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 635d5461f712..139434946f8f 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -293,7 +293,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
>>  	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
>>  			     DIS_ATS_WRONLY_PG))
>>  	},
>> -	{ XE_RTP_NAME("14026144927, 16029437861"),
>> +	{ XE_RTP_NAME("14026144927, 16029437861, 14026127056"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
>>  	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |
>>  			     L3_SQ_DISABLE_COAMA))
>> @@ -587,12 +587,12 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
>>  
>>  	/* Xe3p_LPG*/
>>  
>> -	{ XE_RTP_NAME("22021149932"),
>> +	{ XE_RTP_NAME("22021149932, 14026290593"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, SAMPLER_LD_LSC_DISABLE))
>>  	},
>> -	{ XE_RTP_NAME("14025676848"),
>> +	{ XE_RTP_NAME("14025676848, 14026270459"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, LSCFE_SAME_ADDRESS_ATOMICS_COALESCING_DISABLE))
>> 
>> ---
>> base-commit: 10db0c83b0ccc3211990b54235475abb9d383851
>> change-id: 20260610-add-missing-wa-references-c58331fb7e55
>> 
>> Best regards,
>> --  
>> Gustavo Sousa <gustavo.sousa@intel.com>
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
