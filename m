Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E096C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 11:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A783910F2DA;
	Thu, 13 Aug 2026 11:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyNZIvf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD6610F2DA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786622205; x=1818158205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZBc42ZNTODfvDkzDB4pIciVwIQynQSIY8aOy2BpP0rE=;
 b=UyNZIvf+qhYRSLYwnTDpjTdfHIdtpHodDL9gyofkkvHA4XqfUOULZQHz
 VwmIf0Oz10s4Bd8gXp56sbVn3DpQKCk3N0BPP52/MJx/LM4x9UCtDLNaL
 GAxhb2vMPjotROgs5lwsdlEiIoq1o1oDDQDZNf9eLEVRCW9iWovqxvTbr
 29gvEsUmyr5yLXWVGb2BOnz0Io9dJfk3ssLQ40qFPAwzTvpzAkw2hlSRP
 I8vFRo8HYHIkCvttY/PVC3nhWHSYDcae7BeJxjHVqQvOVAZ6HJ1Lcx5/I
 4z1XYMJ3HnNzVPBO7vULP/UJfzPo17F7oJY6xv3aMuVPkYuR+rhu2LvXn g==;
X-CSE-ConnectionGUID: z9ys5LSOS3G5ZPX7N+/2Lg==
X-CSE-MsgGUID: RSOp9dyySxy+gs8jeQTVkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89713659"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="89713659"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 04:56:40 -0700
X-CSE-ConnectionGUID: snd12BwwReWtwKpbr8i3iQ==
X-CSE-MsgGUID: cuk+oz1XSgGuAG+XOmlZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="269114159"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 04:56:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 04:56:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 04:56:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 04:56:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Id97uUR5MWR/nB3mQBNo87Y+HEp7Ea/sRpSrQbkHC088/3SdSUq7w1/Q8VZIMJPE3BJqs7mbWzN64uu+eaXMTxXghsqgdqPBTW9xq8rAcglO6jS1YMBWaFOeU4K7o+NaQy2e0PKglMkL2pEdf4bBnnlYa+PILNNTUmkqBPbEmY+UnjXPqltelXeeANte9GlS69d1iPSJAhu+SdyDmBekZfhNWiGwA72ZMhBcBi6zmOaPwQXdToaALE/JlhwHqj7lP+ppf7VnwcT7NH4QT6xApANfna2HRViGBMK6vgb4kaduuEjnO7VolSpMIa6F4SYYVaf+zaD0QaXF1SKgLGnTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZZ091H4uI4BgLgZHwVgMFegaXTRck08YR4G7x6L7io=;
 b=F1LVS6WS28mgG5uh2TgrttvHZxhs/rL4OmfW6BH87NQnmzZGkDkhm4yTJ5FjGHKfegDnDl6SiqoOEQ8b04VoFXOQkP+C/Is0DDz+0Bzccua3B6n83HAVoWBlZddy4x4lWUXXeBjRpNZ3evM43l/xe6Kmk559Ix7FZc/nTMDdLLf6Pe68kYRvZlB3B0wKbKZcqYwNOVq/afxq1/67wt4tsobEG7jXOwvlb37qwhpBNIZf71ikCNEoWz7g2Yh+LegbQzFtfIC6QSKZ9I4aO0w1NtMubo8ihZq3fr0Ri/kxvkL/J+k4sbATMhXZm/YPiR2Ydqj04YyFVq2WzZDy1zCQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 11:56:31 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 11:56:30 +0000
Message-ID: <7f06c809-58ed-40be-9492-1a30b06e5440@intel.com>
Date: Thu, 13 Aug 2026 17:26:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/32] drm/xe: Report 'device wedged' errors using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-25-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-25-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0222.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW4PR11MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: c9803ced-f153-4256-eb3c-08def931e92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|5023799004|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: B5GBBt5ErM/ZyO/ljNm69Pspb/CJsJg5tvT9mcCW10DUiqsNTcys1f9Qqb7KnbqgVciXLHsINCaPsQwDEGlKAgNWHF2J2UuJZX4FWJoGrPs8M9yMcNUF+dvjZqfOsCTGnWfoWlJ/Gz5zDQPswpXIQeWy1aEZckzuztiThkDVEgAh4NFFzHN4ZAyD0iDhMP2oEF81ZtZthJny+KJmLLZlaCWj4o4DtIVyTbYsNfWTB/DTG2/1GJ8/E7rS6sahtiO8v+PZnzDGgpJ5ZQaivnm/sYosdoCbbCUv4Hq1Vs72PKmb90QGirvw//IlA/LDdYg92fXGCLloEyEI92SbrtzpwzWVD89KUaZuiNrdxGMIcz5rH4k40BEkAjypC2Y24Bpbu1NO6Zqbf6bvfpIWV2sMWypy8Md0hVsg1tRoMJaE0KqTW1+UaQfxmUkBd2zelBQEN9PJVLmxhvvI+A9cZkXx6ueglXzvzq/JvwNQKMHbkOiEkShag1piT/P6gjGYf4KTXaGHFccfszqZqDHZp+7+lLLJUYRMZQxU0AhbsN0U8s/hZ2AoeS1WEndxw+9BwprjJixUo6iuJzsZhWQtTC/w2zYy65g64vj/RFrREF2gC7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVBDVDlPaER4QnZIZDkzNTYxUzk5K3dicmhhY2RGeFQrdkFkdDRjLzNNanc4?=
 =?utf-8?B?NyszeWVmRXkxWG1tRDZ2enU0TVU1aSttMk9iQUU2Q3F4L2loMUJOSTFmTjg1?=
 =?utf-8?B?cW4zUkxUQTRVY3lWcmV6NWRxS3kyU1pwMjdDc29CYjgvVnhsT2xNL1N5cnB4?=
 =?utf-8?B?SW1uMmJ4YTMwQ2p3RnIvZzBTZy9Md3JOYVdXWjdnWmJHQ20vU1plNFRDUDR2?=
 =?utf-8?B?MGc4ZWNCWHR1NHdaZ3VxOTdWRTN2VUlsV09jK2g5Q3FXcHlzRVFuUmZWbnlV?=
 =?utf-8?B?WlZsV0tPaElaOTcyL0QrK3Q4Mk9lTDVEODJGQ0J4RUpoemY0R2grdnBralp6?=
 =?utf-8?B?TW5EOUd4SFFnRDlObm1sTUtRUTFQTGdhTTRBM0VZc0E5NUE2UFY1Q3NpZDBa?=
 =?utf-8?B?cUpBVXJienRRVFJXaU1raGs0bGh3TmFBQjVjWlNLd2d6L2lwQURiUFpIOGtQ?=
 =?utf-8?B?WmxuUUVNT2syNnBGNHd4bXhqby9GVU5ubmpTdjBUMXJ5OWxMa1pvUzl1Q2s3?=
 =?utf-8?B?UFlJcjdlaC9vUU5GWGp1RmtJd09oMldTR2NReVRlOHZPOE5MeWI0enhYRGNn?=
 =?utf-8?B?N283UTVBM0QzTUswZ0NTQ3BITW5EVEljK3l1MzJhVitEWnhudmpCTzc2UTJK?=
 =?utf-8?B?WWpONS9pTHM0OFhLaDBUMy9VSDg3V1FJcFZOOFR2Q1RuMmZUdHpTNjUybmk4?=
 =?utf-8?B?WWhjUU5nbjBia201cjNOVUt4Ym5STDBOaitTRUIwbmF2Nmhna01yU2hoZEpD?=
 =?utf-8?B?ekl3NTJhVTllaGVBcmxtbk9YakxjTkxjVlYwUGwxdFhVU0Q2U0Rmc05kUWVl?=
 =?utf-8?B?Qm0yaHFodzFYNENCVFdJVnBmdnliMzhHTS90bWl6WkJ6VEFjeXFLanRRbTZR?=
 =?utf-8?B?dERQNG1CeVNYUkkwcG42N3VFTmhoV0FHaEcvLzJlNGdvL2IyUGY5Y0VrQlZP?=
 =?utf-8?B?cUFTQ1ZtMnBHUE1Vd0ZiS3o4RHJPLzJraURKWjJQMEdCS2tVMmxmKzhRRG5o?=
 =?utf-8?B?TXNWM0NNbjdMamZIKytpUHdac0JkMUN2VXVIdjV0ZENzZUF1Q3Q1dld6U0Zm?=
 =?utf-8?B?UjNNN21IVUdkTkRxTWxoRGpoYWdCcWE1UUNMckVlMGRlcEhDeWhVTGpTRnp5?=
 =?utf-8?B?cEhIMXdHTVdJT0pObFMwcFgrMCtKalIraWRabndzakpKblpYaFMzVWw4VExM?=
 =?utf-8?B?djRUQlN4WUZsalh2N2VjcHNoeHFyNE1STnlNNTJGT3pFVWY0bVdoV0thZEtU?=
 =?utf-8?B?SnRDd3BXWXJFMTlKYVo5cldMVDNxNElhekhVMjk4WjFRWlhjSjRWT21Jdjhx?=
 =?utf-8?B?S0piUzdFV2MyRW9Ud0pYYUQyRkZBd3RaZ3NRNlh6YmFSUXkvVHRWNDNSa21S?=
 =?utf-8?B?NUhmeW91TFRMcjFvalVuQkxKVkFDUzNuREpxNUNaYmFyaFR2bDRKdVUycmtS?=
 =?utf-8?B?eXc1c1B6dmVxa2NwMXFZeEFwQ1Zlc0czM3pjM1NuUlJ6N1JEY2I3cVpGbWV5?=
 =?utf-8?B?Q0dFdm00MlFrY01YWGxwWkJVNFA2aEpHQnpWSDdBYnVwTWhkNnF2WlN0OGpJ?=
 =?utf-8?B?aGxZQ3M5cmVVSXFXbEdvZ2NUVGY4a05uRXFPNWVjdkFRaFJhc2VET0docTIy?=
 =?utf-8?B?dFU2YnIwSEVDWSsycUVQaW9SSEY5SVBHK3QwNk5YaUtCbFQ3RzF4d1gwNWpZ?=
 =?utf-8?B?VlNQUXBQR253SDRDT014V1ZTeGNDUVh6VU90ZG9wUGlsV3ZIWXp5ZG9iUzlB?=
 =?utf-8?B?QzlsZWVSNG5nV0FJdmpkdmZXNG5QTkpWOVB3VTkwN3hFdEhuTS9HenFQTnZh?=
 =?utf-8?B?dDZ0ajNzTWtkbEwyNmtNNEl6c3V3ZEJaU01LMzU3ZURMVW1KTFp0aldaTmNC?=
 =?utf-8?B?Z1k2eTVWY1VSYTZ1bzdrbEdZQ0pSTEk3d1E4eDlOclJyTjJwcHU4empIVFNJ?=
 =?utf-8?B?K09aNVZHdkVNVTNoNUZoNXZJbTdITUw4QTNJQXZLUUowazR5Wm1LTDFpVGVM?=
 =?utf-8?B?OTBraE1kNnppQ3VHWFRnZ0Z3eVljMEg1d0ZNTkJaVDhjY2szNkVjMTVpb2xX?=
 =?utf-8?B?endJakNWMHU0Q2JEWndvKzVGNi8wQzhVZ2xNcUg5OWc1VE1HVFZPWWxDMW9p?=
 =?utf-8?B?S0NYUVphaHRxSHBDT0Jwckh6MUpUampXSlozU1RGY052WFlvNFkva2hOUWYw?=
 =?utf-8?B?anJDZ0ZIV3pYWjBpWjZucHE3Mmk0d0gwVlNIK2hPT2JRcW12eC9ZcC9KTjR4?=
 =?utf-8?B?ZEFlVUFkY2dRZzROVzVOck1VN2o3VnlQVmRyY3lyVnU4UEVzQmIwTWxmYXpY?=
 =?utf-8?B?R1J3MGxOcXFpb0xZU2xyMmVlSmFLVzJFSWVJcHg5di8xclRqcDRZNVR4QWNs?=
 =?utf-8?Q?vQ3xNNOGQtzr4W5M=3D?=
X-Exchange-RoutingPolicyChecked: JEUDnMpymyUAURfNw/7AIhzW5Cr2Wuz2I11qWrTYm9UdsejN5df29Kd+iIu7Vqsu+arzW6Eirdcy2//WzSJP22QTu4np71q77Z4URvnf9v736irsMkUWsDk1VX6sokuzPCmbJr04zpoYvoQWcYL4HI4oCAf+sI2VCbLJh2dfHosAXvMZsnxDVm1Oi77DWjYFbVCNuQ2SiDJPUYlq17jPQel8bsvWVyGIZHcMU3MO+n38eFfBhMUpN3+gSuFpiJcGExJt6M68zGMrsLzaJQqJPHot4BlmfBc4JnnUm+aCH1+fFFlyruyQhX8UvH8GucYKGO7iXTkclhG2jDkAfo88Sg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9803ced-f153-4256-eb3c-08def931e92c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 11:56:30.1807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 798j9+/d+KcB9+M9a5t9dOnuysqUfyzsVDU0kNCvLzsG0EqsbzX6SbabOdUTwTCsqxdjG7zAuv41OZicfOxbA2Yhyf/H4N8gkbh+Dpuyr4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> Report 'device wedged' error using xe_log_err_fatal() helper.
> Use -EIO as the error cause, as nothing else is provided here.
> The hints about the recovery method and bug filing are now
> separated as it only needs to be printed once.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 71111ad32465..74d566693dfd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -48,6 +48,7 @@
>   #include "xe_i2c.h"
>   #include "xe_irq.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
>   #include "xe_nvm.h"
> @@ -1442,6 +1443,9 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>   	xe->wedged.method = method;
>   }
>   
> +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> +
>   /**
>    * xe_device_declare_wedged - Declare device wedged
>    * @xe: xe device instance
> @@ -1473,12 +1477,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>   		xe->needs_flr_on_fini = true;
>   		xe_pm_runtime_get_noresume(xe);
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked.\n"
> -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev));
> +
> +		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> +		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			    "For recovery procedure, refer to %s\n"
> +			    "Please file a _new_ bug report at %s\n",
> +			    WEDGED_URL, XE_BUG_URL);
>   	}
>   
>   	for_each_gt(gt, xe, id)
