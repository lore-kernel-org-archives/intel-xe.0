Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945ABC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 20:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD741129B1;
	Fri,  3 May 2024 20:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHJYEdn9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662BA1129B1
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714768763; x=1746304763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kuhexni2PHn9QYLmy8X+6e3HQ/dgtE37EjhPuNNYcqo=;
 b=CHJYEdn99jhICL4PtdC+BQfx9OyVUHslY0lxe5CuoMXqPikB/DpPA5EL
 GXY7BsfjDXACTf+yDVeMhnEctSSjUBQXmoM7gB+m9S9RrD/kbtDJz1Fmg
 w6j2huCBmQ5Z6tnwqslpg9okA3jZwwZNzMyjACzLcjI3mJNRbElAkV4x1
 X8nN63MW7ppY+znLQhs8IPf9QRDMASrAkW3bJBncQzRnXjk5oHCWkJYDg
 +ctnE0aKbQvPi11pUp6/7r2ubyl+Bhp60QEQZloKPQpE9uwjHiqSDwEs/
 +r3HwR/ZSU5org+DKxrv7MAXQ7319cS+h1y/tsZhMkNd66DvY97PfNElf A==;
X-CSE-ConnectionGUID: XiqE0R9eTjeVyn7viPhZbA==
X-CSE-MsgGUID: To3FhQTCT2OsMS2blBQYmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14399000"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="14399000"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 13:39:22 -0700
X-CSE-ConnectionGUID: OFyb6K9HR6iEv/6vSYYBPQ==
X-CSE-MsgGUID: JhEc8yihTBWA7neSiVjPeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27582830"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 13:39:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 13:39:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 13:39:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 13:39:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 13:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVXT2ylvqDTZzHS15Pq+YOVk9GN8cfep1JtasrTsBG73HWttqxQ7UNhlDkNkzjhQuOBX3JRrqpsIx1xgH9ZzYVGVDlMSYi47qae8FxkEgj1qz9FcXj8Mz9jBn/l7GIhPl3CeUGX1zcN+N5U9o7tCN578nj5GEW+1yfJ06zJlJAtgoRTIsySXdWbl3+gUIryTPmXn8nLq9Yf9uhze3n/TSrSSG+npVZyUsFmwtNwnCnLY+7pQ8HN1lbMLHWGfGBOMPtrPs6+9OSpd0Ih7kU6cinyNOuFEh7D73bKRBO6OfZgBS85HuGJnJchakhJjTVDXON5f7wLliyC5Js9JEAKGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoneVju8MkZrPeBET04ltPMdyRpJRQdYR+0CWw0ZQfs=;
 b=C0ZfU0sxTu2wFMFwJteGhefZJ4YOuJurgyQCUBA1IZVDbK+wsEFdu4L5T9CU4ULyne9QgHrUa3LpxeJIDT00Uyj439WmCtscCjuAIupK+gPGgAmZ7YgbKxUvdIsMU6J83/Oj8Uqz7KoDTjpQX86GiJSbYWOKYWv0QbzlVV7YKSiEWLwv1uV5b6WCc4422dlnN+VMmOnmrntuJay/49kmRdji9MmfiRJDH276PJKoi+CHAwMPOB2n4ETnwAVzBulAl1veSW0z/Af0mhO5B5Rs85x0z2YCaoi2p99Azy/D2X2SiQW+ysOi81rqTtV7FvsIadafiQFdG7zriAYsPmoVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 20:39:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 20:39:13 +0000
Date: Fri, 3 May 2024 15:39:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Demote CCS_MODE info to debug only
Message-ID: <kjti4rdivtifgeteao3laabm5zrguwqdzng3lxkyrftl3wrjrx@yamzelvbk55e>
References: <20240503190331.6690-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240503190331.6690-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: c416c7ad-d85a-4750-b6f1-08dc6bb117c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d6VuIefBaUvklCcjUkhAwQEzf+BXwAf2NqqsCnD3TEQnHjIrKQoMI1WCxf/r?=
 =?us-ascii?Q?1O0nD0szZkP0YT4HMN3YJFVXD4+dE9W4PI7sbQpRshFmKfcjrApGVgeNOtDs?=
 =?us-ascii?Q?OP/0TZlVU2P8e7xtUGAt32Z7zEcd7fEWRSbXdmrmP+vcphRaN1t0l1Anurbi?=
 =?us-ascii?Q?f/9lDm+2HFsbZb19O3yWHjNbK7xj5wmkDodebT59XJJ3gmiWam9sAeWC1UTM?=
 =?us-ascii?Q?Y2pWShiVcjg0L83OHz+N5kCqi9hDoyaHRHvCKPa3gHoHRZtrZv0omWqQTiUQ?=
 =?us-ascii?Q?Z8MWLp/u5G804L9T7okA5zOhg0YJOKz7WC2346jSkYkMDzejXv3ZE5/vxWn/?=
 =?us-ascii?Q?VpwurKrn2+sEJDO42lvSfaS8C6VUFex6q5VQ+pWEt9bK5JfGCWSIDlFbC+/F?=
 =?us-ascii?Q?q1Z36fQyllZD/NmZrn8rNhxnbzw7v1r4LlF9CxjzcRMFBYAJ9tKEZ5FpTO+a?=
 =?us-ascii?Q?VBrRAHCZoZnITx1PwjBl3gWVVsPeYCAndzxPuG7+3nJpzE40dwDT6r0KO/SZ?=
 =?us-ascii?Q?8JxnO76vJGYjq3A4IsoZnIHoPKZ6/ykbD524l7pcT45o2H7p1TjE7fjoN4TL?=
 =?us-ascii?Q?d48Qm9KZL8XpUynVaicQyACuhGJ1WepJ4MllWVCRrlwQv40f6ZnME/t4IhdR?=
 =?us-ascii?Q?YYE3Uzhk5Tu/yt1I/1OJkfm2lF9KzAhv57LhEs7ITj7WvxfnS5EKUW4Mz4/z?=
 =?us-ascii?Q?v2nsQhxZHvOXW/30onwJyM8gs4cHWlRJrZnV0CREik4DxxHVCrAMVbuol7DI?=
 =?us-ascii?Q?jtdMOoHzSQL9dX38webozkPGqUjabRQ9g075Vawfkvyg/04B1+Rpsi15RniO?=
 =?us-ascii?Q?HMO+ZSeAQiAezwhoFzhX7JsXHpcDxTUuDxD2zBGRpNGNzRplccXT3eHJgaCF?=
 =?us-ascii?Q?7I+a5miI3r+zZfoA6dbqwGefd5A7AsS7zAX1e5bloV+HlGb908gHm/mLrLru?=
 =?us-ascii?Q?PvYs8gZAs3pLcruudrfBWRqfgDOrkySCtQSM0qmNj0weQ3tnwRXTH5y8eZ7I?=
 =?us-ascii?Q?Zrm9x/9LpgzVNo29YilN6yXjw4PKU77bVIQutjxs81pQ2by5oAIigAxdj0Qc?=
 =?us-ascii?Q?aRtdfoZVyWNm1mVQkL+su8Gnj7aGrI/3lN5LIolz1CVTnY4fBS0V54ucNDg6?=
 =?us-ascii?Q?QAzpslZxquH7QJxjZh8x52ORSWEeAsxMwyYjS0+AasPRFsUDrqSvR1c1Bkw8?=
 =?us-ascii?Q?gkuCmXBAlPgDTQyeJfJ8eKRe9FIWaksizYySys32qObDg+2avWC2eH3b5dik?=
 =?us-ascii?Q?F4fUdFlLse1Zf9DNHczh1bCyonqrEsOepOAePmEVWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/y071v3JvYjWiF/V2yBTiKm0U2repug6j+bLW58cYhN9BRdLROoM7JwpFTi?=
 =?us-ascii?Q?SxF5AsT9ONdzxP5ePIgn4AiqigJyiZewmVBaLQgnFMsuwwTo8M2C9aMVOjUd?=
 =?us-ascii?Q?wj7lJOxHy61ICC36GIv5lxX8XMJDF97doKxhe3XeJpsePZxU0O6neqQ2NADB?=
 =?us-ascii?Q?YiIN7GCCJdczTvbJKWjwb7kPPMn2zCZv6e1078Kkxp3/eI2ufMOaCmR/nkHc?=
 =?us-ascii?Q?+EXiKI9RUedlGKALp9L40xRtV9YrkcA5GZwaoGsPGwGIQm9txWc5SyRbhjiN?=
 =?us-ascii?Q?mo8WxuraaeGvNrN4/bcXvpSJzDI/vsxryGXDvrZCHX82HGCSRNIJaFu3IQ8q?=
 =?us-ascii?Q?87V45QOyLH0bBhpXXA0oxmmmKSb4/x2+YGSV8b3SVN2dnZHRIRsYX2N8la5l?=
 =?us-ascii?Q?wjm2Ub4ZhYVn68DJK35XcHspgW/fGnS1wn3Z5iGpwI9O7F6eT+sqqlPc9faR?=
 =?us-ascii?Q?f0MtEetTdgFclk/UQIx6c+ESdyKQEkGEQfZ5KX36MXSvFSyv+rE2s0cMyJpH?=
 =?us-ascii?Q?nWW094R8btGm/ts9iDuE8sUlfIErYSBYeis+Q6ATTsqNu2iXrTdgpbjXP0VI?=
 =?us-ascii?Q?XI4CfekayK8uKrtvQDBWbreXVvPVC7jwU+3yXH+cS8e1QBsh+geeP6kZ7rqk?=
 =?us-ascii?Q?xNNzrmDMxQh6jDFTuMsAw4nZzjAZEusTcooC1PY9wwjYrrSqfGbWCY48qmbG?=
 =?us-ascii?Q?O3E/H/vrZYhxjyB96yfdLg0ulCPFKnPgge96QImD7F7BtnWDVT0maWtglwYR?=
 =?us-ascii?Q?OpA9lZ0KmeifABnEWFM7zlAjXpgH5XT9ikVwRnKO2uAF7TmKIIWdolVot6Q8?=
 =?us-ascii?Q?xdVg1Wdt3KeVz3hBweiz2JTBz6a+VKxaGG3W9JD1vqJQ6pDIPSl72L0I/Z5R?=
 =?us-ascii?Q?oRZw+Ilz36d5SDogdTveXWUUhPqyj93Om0nbXzVVIQYz8nj2sodRiwjjHNuR?=
 =?us-ascii?Q?C2agTqwDR16r4jj1n7LA2WbmaPW6Blf9vYFI7Is3M5Pz0RFXa4Z16ub0ea9W?=
 =?us-ascii?Q?oT8Nj7FcKKFsPJZYTwFLYKnhQmoeULVK83NJ0geSArJgT3RdmplLcbQI/2Mv?=
 =?us-ascii?Q?iYMtJJsZPfeCjagEbDC1Au8+eoFuMMWtQIuFbis4S7H2LxhdxidU9Zosg5sK?=
 =?us-ascii?Q?lC9rfL9KlnOPa/0OKAtzMMDkEd0wbGuGF90v5/r329ijwn00X6iLTcpXlejx?=
 =?us-ascii?Q?eiWuUcfPMIbxze4kONveNcv9JXTFR8G3gXqzx12E7YzgU2UtJDFTbUgJ76jc?=
 =?us-ascii?Q?i9qNFVnFo2DmWcukxClFsAUkIlLsG2ReFDDrZSI1xktvMWR+Q7KSrqrZwiSz?=
 =?us-ascii?Q?IooalmmY/vyMyJrNf6T02xCDO+sXh1V76d8zJLFHJE3fTg7XGfOYn4HAREwz?=
 =?us-ascii?Q?aFlHr0aOrAh+Qv2AUAIkmtw23TUvQbkvbR8FrQVhsJzawwKlG+RhKqocXIKc?=
 =?us-ascii?Q?Z/Vzpl3093onJD4uPZbOKlGqnYxCkYSD0w4TW+A0Khm6zIxJ8l1HBwbpcp5r?=
 =?us-ascii?Q?ypcm140GS58l0PSSpmL8lqoWIlX3XYtO6rDd6BGRyK2/iLtx2dN3ggEMJI8f?=
 =?us-ascii?Q?u0phSepfuY6eooxd1dwVvr+40rZ21uefdeZh2vHnEzbEFJgeUyv6OwECPL2G?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c416c7ad-d85a-4750-b6f1-08dc6bb117c8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 20:39:13.4905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgza8n4kWANnSU5I+O2hdwmKoTAC72Rx1pznDi0ACXJcSAjAZbsdT92OPgjdnEcx38MN0Vn4NRCbIwNWx1Koijg641gc+yUZRqExQonOmfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
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

On Fri, May 03, 2024 at 03:03:31PM GMT, Rodrigo Vivi wrote:
>This information is printed in any gt_reset, which actually
>occurs in any runtime resume, what can be so verbose in
>production build. Let's demote it to debug only.
>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 396aeb5b9924..a34c9a24dafc 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -68,8 +68,8 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>
> 	xe_mmio_write32(gt, CCS_MODE, mode);
>
>-	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>-		   mode, config, num_engines, num_slices);
>+	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>+		  mode, config, num_engines, num_slices);
> }
>
> void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>-- 
>2.44.0
>
