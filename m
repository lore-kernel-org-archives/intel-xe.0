Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A1CC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE1410E57F;
	Mon, 28 Jul 2025 19:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKloGaOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD2610E191
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732750; x=1785268750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NprhvZi8GDkS69PneKXdqb4mRnK31wV2owyaqavUHxs=;
 b=RKloGaOZBxFv1jcbEHHXGiuSXPZHj6sBrabGXekBQ2bFTXoxoaKL7U4F
 IHHSPUTFMRfkQvHppm8uEOuP6wmFrNEzN9beD5tBKV6SjpEXVNQpNCQi/
 mfmv7bht3+TQx68QwS7E78A7RYGvYacY7rbyEGCTGprB/6a+I8LDIufd8
 0RMWbi74B/H+Skvw1nTeMzi71MGG0mybEe596yrsCqyvQLFhfrt4NncJv
 6vq6CLl2GkiyTLeXzN4WFmOMHAhDLzWqJB4PUE/34G5oDbU6wIQGGeQ9T
 WgknOzZfRyFjCoZo9oqvliPgphL5e7NluWA7mVRAvsaZ9mraL4Aw6KUah Q==;
X-CSE-ConnectionGUID: doZTVBYUQo+Gm49lpIvQOg==
X-CSE-MsgGUID: g9VsqAUPQtO19KRkL/q/iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59639052"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59639052"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:59:10 -0700
X-CSE-ConnectionGUID: LonweRsvRtG+KHsDJ0VM/A==
X-CSE-MsgGUID: yjLAVX5XST+R5ESg6K3tvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162077523"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:59:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:59:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:59:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 12:59:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WumtonnFJ+7dsIxy9oYw0nTqPkx/UFi+LdCdUfhjktxh/uzG1OQ5xwOOk+d4EY/EEtF/Hk/lOBP7a4cTe/uwuFHzgxVXeOZRXaSVE/4/0BY32sVesZL+cS6Grt8xMh6aIwQw7YIOswlYVojojWnpzpr8+Mv38N9J0iMny0qZgPTmkCx1vhodgVfgx3TiEHD91N9nXDTYVro0HblP0ZiOFfvOqy/m7bVcP9xvGNfs/uyz5h7Pf8Tw5m1wHypjup+phtI6oLpcgnhP05mqB3osMMJxjItjIyFsYjIMYwRvf3u/JKEJBjBsM1FMOfrH/qT8mEPRzMizW/K5sxNq+XZNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiGXIFl5fZve3CeXz1NowRd+CO9KyzsE1x/9yElUPA0=;
 b=LyUmBmJQ+4jFrJJCt76330smPfiDxtKCbz6oYA2Ubo807+ldCffafkXE3F2jiIfWF5QTVullmqYr3nON2uMdxd1ShdkpnYItacycqwB740wYS9G7ruDoExqc/Chg5yFfreVqGgp7uVJxEUEsXvddG+R0PfGpKdp2LRrXordFz3UU6xXB2+ctLnFjHI2Xee+pnvXhOn6C+3J0VmrWOf7RswSn/othz+mmdwHrxElvM5XCn6l2fGCGOVZrA0ocvBYb4+I9DQGyQvwsC1KHXqDpNdXJdUKiE9KKvp4I6apMOA/PDJPYJsmRWosImMpM5oADVmXdgWm7nIHaVfvfqEiDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:59:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:59:06 +0000
Date: Mon, 28 Jul 2025 15:59:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 02/11] drm/xe: Print module init abort code
Message-ID: <aIfWhigyVwaBdfFa@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-3-michal.wajdeczko@intel.com>
 <aIfR7noIcrRAMnJf@intel.com>
 <36f1f722-87d1-4ef4-8761-192019b41fd5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <36f1f722-87d1-4ef4-8761-192019b41fd5@intel.com>
X-ClientProxiedBy: BYAPR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:a03:100::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 9380dc0e-2b4c-4b26-62fa-08ddce11354b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jagklgRmC7GIFaCTG4/56Vi9L60s5jQwOjrS8Y3Rk2OWlf4GuK6o8V93e6z/?=
 =?us-ascii?Q?v7kwxJVubT4vsHSUvnx1myTjVK2YabQfzrrX7Z+Q6XMTY0DUOQQI+mVv+584?=
 =?us-ascii?Q?3mysk9Y+GMtcldZITMRMuh2aypwA6tRpyWgOM/SLGdn3KB1zEu+fvhFdcXXD?=
 =?us-ascii?Q?h66v2qlIvCB2ft7M3dK0AlGPQW/ZtJpqfFJw1QlCp6QfQflwqrMfyzY0iE1a?=
 =?us-ascii?Q?dL2qjgf5/wmH0mycbxmOXNe1VgOQmvlmAA3SRcNMqhbkQktCkWzGX6nLrVuX?=
 =?us-ascii?Q?7pAwgBOL4W9EDp5FGMuB+BuKn+67beiNOxCC3aofVv1/bSipLNEYISCeMbV2?=
 =?us-ascii?Q?+SvajkS9GBMeV2uB097Jzk8Q1RS/tQoBYiXXn4G/tnbgu6tCVJEt4R6MPHwI?=
 =?us-ascii?Q?LuuRqWQOTe6nx9CuU1rmwLOcZMlusEYY0n6wvLO5lm6NhDsn2vm2AH5DwyKW?=
 =?us-ascii?Q?jFH/aXMkMrp8u0xbudjFDWQY9TcUPsfcJCNmzb3ak9BKq1CWiTT5Emk/q/Y3?=
 =?us-ascii?Q?2QbwdZFGyraPkfadeYqLJtpZnQ5NJq6C0LDyun5qSLPZGtwip7Q7+vcVcYT8?=
 =?us-ascii?Q?RVQ9MqMMGbg69ZfVZ1aFOA5sMmdvMk5EbgW17qWK/k/DLtIjzog08Rot1iXx?=
 =?us-ascii?Q?KQ2L8RwpnbgyXZX13MwsRMTGPsib0Dk/qQzHEt5avVIzjASHBN/Z2oh0eqjx?=
 =?us-ascii?Q?C+gxlk+U2K1Uulfcp8wRX2GK5xhZSxcLj1LKsMefhMXWiqp6KFfw762dRkPm?=
 =?us-ascii?Q?lF34raWljseTxPHclrqeqXM1qBFKTlJB2xMzrROX6HlSBrtMO+ne7aWEboEh?=
 =?us-ascii?Q?+P0wW34pBRgt4YM3Tft/eBJTePnrIyYPfyRCQQYO9KXDEDbv1bhNSMEmPCYE?=
 =?us-ascii?Q?qilw4+rqTfBHlqqRpdWqSWVd61P8RG9HjHaF/xZFjGJLTCNI5Zs4jTV11u5W?=
 =?us-ascii?Q?PqGtHzDPTSQeN6Sx3uBgyIMT5fwsP1/jipQzI3CURl+jSV2o+OE8R6jN+ej/?=
 =?us-ascii?Q?W7aDtNN4kCSZa4TnPQNVxeh/YpuWxUZ/Winej4KbMmwzqq8V7eI5Xe9DwKCf?=
 =?us-ascii?Q?ayPh9qpXjxF1k/om4Adghi10R+cUgUTyI6ehbT5mrKip+e3mAUNFr03R5U8F?=
 =?us-ascii?Q?mHEPlwqvpQRLaocmIGG/QF+Ggtit/hOBWm9PVF72Lt8gjO4885JlAzWA0tWa?=
 =?us-ascii?Q?3cqNPec7zdw8idQ1HtyZsoNAkhWWO3DqsI9O5oQiP2R3N71+7kOMQ2daAY1J?=
 =?us-ascii?Q?U2SOHI6UIcDbvuVzjr9hu/kelyLuvzhBRMz/sqo/+zN4IOJVdWPXgyGYofL4?=
 =?us-ascii?Q?55x0jtPmtVaTpwZgdQNWOdEub9m4ukhh55oiw4LI6OBuUp1WKwLdULtHDv6F?=
 =?us-ascii?Q?Vv5qsb1f+fGVDc8TPKfUaF/uiLGVGzwrVPXLfPTMvGaaPar9ToZm39S2uVc4?=
 =?us-ascii?Q?N7rLjQjriFc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y4GXbnCfsVmEL0F6pnVJrY7DleBmEoUnArL43L9tGtsb8r7N/j8SG0nI+gzT?=
 =?us-ascii?Q?u/ZRNT4dODyb4NdccMon2V2xXK9bCc7k6sSgDIiVRsO0YNMkpOzbjWwl/7L6?=
 =?us-ascii?Q?0KkCv5hz2BIiHsKkwIcu+yAWEDT+0G0aXsLqvyObmAglT16YJKIVwWKGqYa+?=
 =?us-ascii?Q?dtfgdpa2Bd/gjXrN9/3Nr9ZCjR3Qj7SFxZzKu7djTn1RY4ixURZnVvr8i6Jo?=
 =?us-ascii?Q?nGtfSWf3X4dfLq4HggWC02AGcpTQyHfR1u74VHDA13LeuKiouAxeIntW8tYK?=
 =?us-ascii?Q?I1Mh49qmobU/nFGbQmXJ7MrVtD2SmlS/YGGhRPmiLvM7m+K6ClsK+jWoNXDb?=
 =?us-ascii?Q?xAioPEYvmTmZVB+co2+Jo6sxfNTqZrjaitqU7f3s4IXdUe6NKApTNnFdAAKN?=
 =?us-ascii?Q?+SwzJVYiHIP0bHWlj68p5EiN3MIQoKlPpWqKl2IYsoq5JNkIxaeHTCgC37YC?=
 =?us-ascii?Q?vvDZLOmT/8K8EfgCt4YXm6FxUateghwP0qpNz0q8TgsN25X7p/XAHd0j5xKB?=
 =?us-ascii?Q?oRQZzqKiiOltfDnJSUKGxnd0zhf92Bm/QTgFJ7GBv+RpjoF3NPsrolN1vvQT?=
 =?us-ascii?Q?V/hyPHRycdDdlSL7VNLD5Y0FIERun0MMsV3BQ/gL+FUVTFFzUTmSLcfDJE4O?=
 =?us-ascii?Q?L6cervU5JPcf88tjVSxBq/QChlh8WLuPYFIJNdcWEnugalRMG6t3InwEDAH2?=
 =?us-ascii?Q?KFcGWSM2XXe4GlLKqiuWE7LOsy0SCqv+dnnNux1h+tDVL4YGS3D8tYhKZhFx?=
 =?us-ascii?Q?RDfxmIhu3ZSbKFv58kcNybNdgHs5729m9oSKEe5B0JT8fsRaX3TgVQV1evlY?=
 =?us-ascii?Q?HItNak1fRnLAARToDzs/IABijgHuLZkKa96SKjJT7KYh3Nqt79sDtyjjAvJ/?=
 =?us-ascii?Q?r7kES+ne6CK/LUAypBuq5D3hMh1djBj33j4PDaV6R2YHcR7r90HUdHcDOdel?=
 =?us-ascii?Q?4ea9fW8tzXpDkhBktKucTOf2RZm7Jr5kz9WocrZG/ENa/sfOJGspBTjnXhqk?=
 =?us-ascii?Q?oIoVsPq5/++ES0+Uvap4mvM9NDPptcrtGAmgttW222US6yHGTroENWwk8obh?=
 =?us-ascii?Q?DeBUSSRbzkhlNANMOVG4Hc46WK4x20J/GSXA0vuyJjRXwgro8vISyCfxrk3+?=
 =?us-ascii?Q?XC/Hl7o5xe+rjN4lU/H5YUlfSg9A2ZjXwL2hF7Giuw6YVpBMoCzFvE4fOIdh?=
 =?us-ascii?Q?1B+5q5YwIJxv0Ymx+IA5PQF58slhePkGValKfjrmercljY8ltMWsxaHSTBss?=
 =?us-ascii?Q?pMyUkx6k28xTsGc8TzKQfzSH/7Tt1OJPtzoGYipppTkmx3aXI3YcVNGGzJ5Z?=
 =?us-ascii?Q?HVESCBt46rzQoz49QhVO7TG0/sON7/lXj9lH2BaRioKyoqs8rZaY/+utfYZP?=
 =?us-ascii?Q?tLDbVUo2MZ3dbnS5ScuZYriOK72WFmV8yKwZm78kH/EO8KbY522R0PplX1CT?=
 =?us-ascii?Q?gH4OgkVw1w8T/SVGgMa1p39U0U5EvB5pEUmlAUTmI2M2it/gQ52N7yjMB0L2?=
 =?us-ascii?Q?SCBPmaTihNyZKyzbAttUAN0I2OA3ZMnulvX44smOFYgK7MDS59eMWJDzPG6y?=
 =?us-ascii?Q?6WcNDEeWtIT6F14v9gvk0xCvCXXYp64sy4C5ivvISEyRinyR2EqTqIN3VHQh?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9380dc0e-2b4c-4b26-62fa-08ddce11354b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:59:06.2332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBXp0orwEoVhMgEcBCoKnpHliWVNm22kK5q2BTFfziGVj1dtnErtx9Pi7wUwRDlMofHtleZ/HgYgVGCLyvukTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
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

On Mon, Jul 28, 2025 at 09:51:12PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 7/28/2025 9:39 PM, Rodrigo Vivi wrote:
> > On Sun, Jul 27, 2025 at 07:19:59PM +0200, Michal Wajdeczko wrote:
> >> We should provide a hint to the user why the module refused to
> >> load. This will also allow us to drop individual error messages
> >> from init steps.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_module.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> >> index 593bc9e5851a..23be7c4cfde1 100644
> >> --- a/drivers/gpu/drm/xe/xe_module.c
> >> +++ b/drivers/gpu/drm/xe/xe_module.c
> >> @@ -155,6 +155,8 @@ static int __init xe_init(void)
> >>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> >>  		err = xe_call_init_func(&init_funcs[i]);
> >>  		if (err) {
> >> +			pr_info("%s: module_init aborted at %ps %pe\n",
> >> +				DRIVER_NAME, init_funcs[i].init, ERR_PTR(err));
> > 
> > pr_err ?!
> 
> that was also my first choice, but then noticed
> 
> 	.init = xe_check_nomodeset,
> 
> which is used to skip driver load on purpose, but not due
> to a real error, so I decided to switch back to pr_info
> 
> but if you insist ...

hmmm okay, let's go with info then

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> 
> > 
> >>  			while (i--)
> >>  				xe_call_exit_func(&init_funcs[i]);
> >>  			return err;
> >> -- 
> >> 2.47.1
> >>
> 
