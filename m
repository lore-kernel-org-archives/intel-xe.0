Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E2EC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 13:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CED10E3C4;
	Mon, 29 Jul 2024 13:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ey7XxLxw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2ED910E3DB
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722260512; x=1753796512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MRHUOzgIlpsfKyj7fSr6RvKjLI5LDwD3pcYP3ppdsjQ=;
 b=ey7XxLxwgy0kq/B8d9BMchd7CmdRMpDFRo7QUAi+gdYjJcAZlNEadGNs
 BKRYD/H1wW1psPAczE2bjxVy7zXbj4sbprR26PyuPOBec4Bv8EUTxZBVD
 4fjrLkD/AfRjfcV33j+8M9T1eaAFYdQxslr3JpxKTSIrTdf91vSYAwZgG
 NH2XCHFAuaA9N4SHqEE2f/5vUf6nq+oWOaJrEFdIOHIdf+CUryBzizVmv
 OP1p8++WkYNFfGWRKTv5e/R6+Vx+LCvztKeDaz80LoHpSiAgT5pDNEMve
 dvj+nlB8Ze9qjWf43Fkc1dpDViBCS8aMV9Wgjnv1Q5DbjFNDPmt1kqkvE g==;
X-CSE-ConnectionGUID: v2g/xUAwTNeog2CWKq7Ugg==
X-CSE-MsgGUID: LmCUBIZCQiuOnsKWD+0DaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="12770209"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="12770209"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:41:51 -0700
X-CSE-ConnectionGUID: Oc0KPKO+Qp2y1xEPpg+ilg==
X-CSE-MsgGUID: uEO78drrQxq+Ze6qYGZg6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58110969"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 06:41:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 06:41:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 06:41:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 06:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+HFa1ixuCO3Fg4+U1upiIZk8m42E1E/86AmYq3BvJhsAuBUWtzzZQPZyLtRFwxfQvHF2Ccp2MoxyuYegod+wzh3MutXpAXqXwHKrGngQK8hPDILN4oodnAQxzIQFfyi3nlSHds1/KC9TR5NJF9uuTvrf0rmj+iImyu3sp42wbSyG9tGJO5H5hoXjdbG5ij/Jlp/xUEKne+0JIwpgHD+QhvzysLOTuDxukYmL3kr4IE2UWFVH5v56ZJxtbodONbTCAB0ODCK2zovmjgdOF4ABNC0XnIfUGcDuMi4y7MDUwqv1f5cIsOeucuYO5XtcJALxxm0/Rf3m7B4bCvQPmJfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcKXW+e/1ZM0ae778vaPkd2a4goAQjntdiUNqXgPSuA=;
 b=pnRP7x1btHpThcoSAdv/r4gHVV8pBPCOeiu9X6euSefSEVejMCyjs8Uz5J69NKenAGMNtH38sR7YalnnWae+m/QVR2VZbRoWRRVqrV8GFiUdASwr12jRud7uIl4p46BUxGVjn8E8VGwVRFzeel/amsLJ7MpiWzrJ8nzfKg017uEKgrP44KSVJ8GZkVy276dm428oit0XISNxT7rLq3ile51MZCvK/BilqULTgP3VTqWafJtjG0OITdA+AaRZt8C2u9SK8RDSjBMXhLHZT1mXdPc/5VQofgb3/38gCIIAfxkjhHkjxqHoubsW4a+2Lm/fSKSyNnglMKRH9UZgNaIxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 13:41:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 13:41:21 +0000
Date: Mon, 29 Jul 2024 08:41:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Ohad Sharabi <osharabi@habana.ai>, <intel-xe@lists.freedesktop.org>,
 <obitton@habana.ai>, <kelbaz@habana.ai>, <gustavo.sousa@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: restructure query config types in an enum
Message-ID: <3ca4hqlxstyxrlhlfasypomdckvtfoszwokbwmwgh6fvj222p5@7j4mvwm6bsha>
References: <20240729121526.448199-1-osharabi@habana.ai>
 <gqffceiac2b6r5nsgmzixccfc3o4xsy4n5x2rsrnxxkca2nukv@whe7y5cqyv76>
 <87plqwxrmq.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87plqwxrmq.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:303:dc::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 940d9d46-bfde-47a9-896b-08dcafd421f6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pPiFT26C7eyM/uu3NfzdsSQSxegKZqP69CjdkrwjBCip5Tel1pVZx4Jj6zkW?=
 =?us-ascii?Q?oxuwe+fGucrYsF4OMibVQQ5B/3WZPkQxgP7BMy2C9r3QwCbYbMete3L7ogfC?=
 =?us-ascii?Q?0OA8z0/NJNLAg9uwFvyEzUM/z7Z/1F5srmzg8wE2FqdEdU+a5+qiPospz0+L?=
 =?us-ascii?Q?4AWEkhn7NNNv0vBmGs208CrF74fjW48ErE5dljEzomIBld0cIf9QcnXRd+0h?=
 =?us-ascii?Q?vHW0MJa9z3b/GzOrrOXTQb9D0FNHZbE/E/dMMinoFgDI+ebI0o9CSYsmVfVt?=
 =?us-ascii?Q?1D7Rd6KW/bmyji1WG7T4NmFLRPFos/jXSUAMGMNUtzcT9gYA43VgCcMyjSrb?=
 =?us-ascii?Q?nVW/n6T1aSICQ8w/hmOu1POTcxm/RONklHIDWdgY+1wJflyYqGbv/vYtDFcb?=
 =?us-ascii?Q?7DglyoL80EwoQ9evdbumx8htkdZYQvqyFA1xJtV0aiDHvWC+RZN+rOhm5Gln?=
 =?us-ascii?Q?kTzoTPwvQfrZaXZqfL+7l1hhoRzvkRqGx+R+Ih0Qxccgc7stZDknTjdP/W5I?=
 =?us-ascii?Q?9Ze0UjHBW279XG43KvxKVFjhIk54yOScM0mOwUuwrnmLjFjl1if+3TaVAVSL?=
 =?us-ascii?Q?BNK3a9nWNBDxRFjwmRgWa7nPyCAYUrGMsyuI4G+OVmpUg/QjdQSpeBp2pLKL?=
 =?us-ascii?Q?RV/R9TCdCWk5Jmfg9Gx0LuYRA4fe3LoKAz1Nif53ynWbd7pZqSLbk8o4LZ3V?=
 =?us-ascii?Q?OPyeCT2tEVk6yvVQb6vvdG7RwOXB5Ve2j6dAFOzteZ+E4BirlqJq4IprqRCO?=
 =?us-ascii?Q?BFau/A3OfI85ipqV6dW0On09GYpa6p7paOKzFV7PbcAfjDQ4s6LmHS+CUHtW?=
 =?us-ascii?Q?756HwNJ+8HdXAtTux7B33kTHlB4SRS/umpeA4AIcPCbN49XAWopuKjyu9M+4?=
 =?us-ascii?Q?Fa3BE/+dDej9etV1h4uvzgeQjT1cc+NP0DHhzaxgnIZb07HPnxQg8H/i//aV?=
 =?us-ascii?Q?bQUXLEjiTVulYQp5HilMtf5z/fRb/e9GtY1cAlFIvgsvMSntArsvM9JndIHY?=
 =?us-ascii?Q?SNIeCC0A1ex0VYlUJqx+YXSnVJMlk5ooj/gwH0c2G1WhFgVDaeyKgDXc6/j+?=
 =?us-ascii?Q?1eRsI5dL20R4i1AqcZz1J+aqQed/6mQ6B9UYlFbss6eoMggIViJUxV5EGT/E?=
 =?us-ascii?Q?hZnp+clI4tIUiLNtOgQHP4C6Edfv0PWqOQy6oDP7CZxa0a44hEXIRJ7DeoAj?=
 =?us-ascii?Q?1Vzwv0ep03FdImEhiOBUz5xPORHSs50A0pPM+2itcDJwIjPaeaGqXI+3JPmy?=
 =?us-ascii?Q?BdizeuMOHVRq7gsQyaQ1rvUfK1Kv7RalvDXw0N9j6LEQ2sKIRvKTABuldZcH?=
 =?us-ascii?Q?sczdnLQjMZl7hxI17H7z40Wp8EE1iW4PY01Zf0apSpbUJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgiYETYndigPSNM4wQL86Ha8uvv33zXzw5pAhJP2bEnwvEp5EwSdWK4PSil6?=
 =?us-ascii?Q?VpgMKWznFPbkAn71P/AET2Gz7kQoUw3aV3jhPUM1RbIEKIgXZD5o6enRIdRn?=
 =?us-ascii?Q?wapTQVzqejc8CM38V38skMSWlaamGzSsAelAjtG+3G7tSjNFzr7kIP5iavwm?=
 =?us-ascii?Q?70wSwlUoTMWVt/dOeqsXqacMKOIlzqtnEyET4aLvrSeIltSqW6itUETXXIeB?=
 =?us-ascii?Q?bNbkdpPzRthxUwUJHIutw/Qq0lNL0E0YhaoiXoAdjZSGX0S/EbLf3wcFUp3/?=
 =?us-ascii?Q?NsgA7cICh6zEahKYH0HddEu/8VagYics6ILLRRzFpQHzVGsa+VMEQ0ytkL8l?=
 =?us-ascii?Q?PwujcgyDq/nNDxUICHblCKKNDT5jPNoI9klehJQfEGqtZ3bDCnt+vB5wyurF?=
 =?us-ascii?Q?DGZsn0xfMz1Lx/kYYmOs54qGpDJ3upcpxfDDZt3oJzUb8T8eW9V88MteBtHk?=
 =?us-ascii?Q?xHVVEQjg60G6s8sFpA/BTyBeaTgR/1gKGgkl2r7NgI3avXXsvuec6XGvBWMD?=
 =?us-ascii?Q?OkxB0YP1NDYFXWgFoesjCMUS6GKzbPo5U2cU+zkvM1WLXsJu87h4OTiRAcNL?=
 =?us-ascii?Q?3fHW0FMHwWN2W/TF8Hld7R7iHHdc/9W9SnuHbMc8M8hd06uIAMKyJivNDqgj?=
 =?us-ascii?Q?yn6RltTlz1hHq2Sn2RY5dGkH/mmX5pY1/Sz2YnWmN5gHgjkNzAYaNuBTxJGa?=
 =?us-ascii?Q?ArLQ6gJxWNVXfLXcciuA5rOyVK5W5qnuhKEcURYm6IZdCq482DryVezRSuQ5?=
 =?us-ascii?Q?cC9KYvDrnj6bOR87wHQuXIOB7BOxOLgv+TzTnfMDWEQQdDrqoEFPksIpLoTt?=
 =?us-ascii?Q?HupmN9KMq57r9PRpAteM6QXHj7u/H+kkTWiOXduz1x2s0ZccJ46cusifzCd3?=
 =?us-ascii?Q?/mjBvj6nmitU+uL7zPDjmN4OczD8k38HydrsI8FzPe1KbUfmdsQlYJvXxROZ?=
 =?us-ascii?Q?WPcKhUKujL26ztYC2Lqeua6AW0JR3cChAuO/ptQAn6wViQzXkOt7/8KhPdj9?=
 =?us-ascii?Q?FOaEnR+MtdNzaZ5MbY5GeXqJulvYYvwgkHLNIyuf+2wqbvjCFnzE39xuLRUG?=
 =?us-ascii?Q?ZyHzCGld9QhutYIPiZUSJCFOeeesDdrL7VdSsts3aFPk5cvvq5nHR7aEyTEt?=
 =?us-ascii?Q?93vj0baGRmTtPsHREIGym+EvFff1h2206XocjQEG+FRhvrXh6OPDGV8OLRD9?=
 =?us-ascii?Q?nT1iVXbd6ahr90yOQtO7bIN0hfsESsE72HrDY79QOvzr12yCnMmiX4NVYsTR?=
 =?us-ascii?Q?UWuPWYBDEFPQALMDZGs93lI8UNijtUGcBQoGIWrg+aVukOnRyw+AgDlfRMWD?=
 =?us-ascii?Q?ioLe5qk97rQ2i/aRuo1pDgdEehaGfL0Y/g+1T33PiBNSkretyOmDkotBrbk4?=
 =?us-ascii?Q?5LCXes2HkNQ8GHovpBckLm9ehPzY3bYp5wfzxMOQpk4ypHbCmaNA91J9+CQZ?=
 =?us-ascii?Q?tcwvLjXMLF0ygIdRj4tFstiUUfBDTtmi3lMoOUoVy/5AUgC6KV72jLf3W5F1?=
 =?us-ascii?Q?hk19HZEd5IfUuN12D7y4MHtqUjUqyDToH5BCyaWRFS5K41XQPGhCMPp+LspM?=
 =?us-ascii?Q?NQK01jFp9191B/6GBnPmQQa+JQ61f9kBBHS8t9mii+se+oonTVvTfU97nI2j?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 940d9d46-bfde-47a9-896b-08dcafd421f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 13:41:21.8986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVoANS8awB6lQwy2LdPI71bP5iV6QhvcgPrwuXwurneG32chkYTiBw0gZtpXHE3k3rSiZlkbOa9ktTBb8xh7hIpWhfw6OUUAtIyF2Jm03zM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
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

On Mon, Jul 29, 2024 at 04:19:25PM GMT, Jani Nikula wrote:
>On Mon, 29 Jul 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Mon, Jul 29, 2024 at 03:15:26PM GMT, Ohad Sharabi wrote:
>>>The config query has entries per config type.
>>>
>>>In query_config(), an array is allocated using the last element of
>>>the query config to dictate the array length.
>>>
>>>Instead, a more robust approach would be to use the standard "number of
>>>elements" last element of an enum such that one wouldn't need to modify
>>>the ioctl each time another entry is added.
>>>
>>>v2:
>>> - modify `enum drm_xe_query_config_type` doc
>>>
>>>Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
>>>---
>>> drivers/gpu/drm/xe/xe_query.c |  2 +-
>>> include/uapi/drm/xe_drm.h     | 58 ++++++++++++++++++++++-------------
>>> 2 files changed, 38 insertions(+), 22 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>>index 73ef6e4c2dc9..aaa60ff764ee 100644
>>>--- a/drivers/gpu/drm/xe/xe_query.c
>>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>>@@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
>>>
>>> static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>> {
>>>-	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
>>>+	const u32 num_params = DRM_XE_QUERY_CONFIG_NUM_CONFIGS;
>>> 	size_t size =
>>> 		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
>>> 	struct drm_xe_query_config __user *query_ptr =
>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>index 29425d7fdc77..9222563cddc3 100644
>>>--- a/include/uapi/drm/xe_drm.h
>>>+++ b/include/uapi/drm/xe_drm.h
>>>@@ -378,6 +378,42 @@ struct drm_xe_query_mem_regions {
>>> 	struct drm_xe_mem_region mem_regions[];
>>> };
>>>
>>>+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>>>+
>>>+/**
>>>+ * enum drm_xe_query_config_type - Indices for the supported configs returned
>>>+ * in &drm_xe_query_config.info array
>>>+ */
>>>+enum drm_xe_query_config_type {
>>>+	/**
>>>+	 * @DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID: Device ID (lower 16 bits)
>>>+	 * and the device revision (next 8 bits).
>>>+	 */
>>>+	DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID,
>>>+	/**
>>>+	 * @DRM_XE_QUERY_CONFIG_FLAGS: Flags describing the device
>>>+	 * configuration, see list below.
>>>+	 *
>>>+	 *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>>+	 *      has usable VRAM
>>>+	 */
>>>+	DRM_XE_QUERY_CONFIG_FLAGS,
>>>+	/**
>>>+	 * @DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT: Minimal memory alignment
>>>+	 * required by this device, typically SZ_4K or SZ_64K.
>>>+	 */
>>>+	DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT,
>>>+	/** @DRM_XE_QUERY_CONFIG_VA_BITS: Maximum bits of a virtual address. */
>>>+	DRM_XE_QUERY_CONFIG_VA_BITS,
>>>+	/**
>>>+	 * @DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY: Value of the highest
>>>+	 * available exec queue priority.
>>>+	 */
>>>+	DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY,
>>>+	/** @DRM_XE_QUERY_CONFIG_NUM_CONFIGS: must be last. Number of configs */
>>>+	DRM_XE_QUERY_CONFIG_NUM_CONFIGS,
>>
>> But then when we change from 5 to 6, we are changing the uapi.  It's
>> very possible that userspace was using that number and then when they
>> update the header the build breaks.
>>
>> I believe that's why none of our enums contain a max/count/num element
>> at the end.
>
>Agreed.

just another note that making this for the driver-only would be good. So
we only use the _MAX/_COUNT when iterating instead of hardcoding the
last element.  That'd mean defining a __DRM_XE_QUERY_CONFIG_NUM_CONFIGS
or the like in an internal header or .c if it's used in only one place.

Lucas De Marchi

>
>
>BR,
>Jani.
>
>
>>
>> Lucas De Marchi
>>
>>>+};
>>>+
>>> /**
>>>  * struct drm_xe_query_config - describe the device configuration
>>>  *
>>>@@ -385,33 +421,13 @@ struct drm_xe_query_mem_regions {
>>>  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>>>  * struct drm_xe_query_config in .data.
>>>  *
>>>- * The index in @info can be:
>>>- *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
>>>- *    and the device revision (next 8 bits)
>>>- *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
>>>- *    configuration, see list below
>>>- *
>>>- *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>>- *      has usable VRAM
>>>- *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>>- *    required by this device, typically SZ_4K or SZ_64K
>>>- *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>>>- *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
>>>- *    available exec queue priority
>>>+ * The index in @info are the entries in `enum drm_xe_query_config`
>>>  */
>>> struct drm_xe_query_config {
>>> 	/** @num_params: number of parameters returned in info */
>>> 	__u32 num_params;
>>>-
>>> 	/** @pad: MBZ */
>>> 	__u32 pad;
>>>-
>>>-#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>>>-#define DRM_XE_QUERY_CONFIG_FLAGS			1
>>>-	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>>>-#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>>-#define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>>-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>>> 	/** @info: array of elements containing the config info */
>>> 	__u64 info[];
>>> };
>>>--
>>>2.34.1
>>>
>
>-- 
>Jani Nikula, Intel
