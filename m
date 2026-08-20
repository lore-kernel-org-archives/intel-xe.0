Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B27CC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A02610F1D1;
	Thu, 20 Aug 2026 22:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lr2coeLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746E410F1B2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 22:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787265911; x=1818801911;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0XB0Hu9AJDKm3bj1FJnN6Txg5R9AHNegZa/1UHYat6Y=;
 b=Lr2coeLX4sQQhanzj/Gh+nsdThzH9YgpWlvKCKcNBR12Luwxe521bmSG
 6GzFwpS74cc9MRcIxvQIumh0jhx8TMAruEKYM7bMtRG0g0PJPbOpHDfmV
 GTETgTP25rcitYnKeRpWJXPer5cuXZcZTGgiQc593M4zE+G91qz1PIx8c
 WR64Veu4OVGs2ZGXYtUyjvJ8qR+IQRnCDa/vHrgPSsW1JT8K/oQBttuQi
 ZJYKdvDQeGrhBu/UzjoLPnbACwbF/7E1iy/qr4doRIKhOVX5HYYAYq1Lg
 s9xrlU6wCfLfk7UIolGT+s8Myz0sh2gnpyUHpbMJijLUCL9MufTmla+gB Q==;
X-CSE-ConnectionGUID: A8lSc0jhRzadSlTKhxh/Dw==
X-CSE-MsgGUID: H2atUeYyRASE3GZvH4T3CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="105193755"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="105193755"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:45:10 -0700
X-CSE-ConnectionGUID: FCCiu4s4QC+uyaMOSKJalw==
X-CSE-MsgGUID: q5Vc1X8NS+6D3w3AaeGEOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="270399427"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:45:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:45:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 15:45:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+15FzVQxcQY+Eeq2Ph/bdt06oiTNM6IhZqefHwM9TC/tZVxMFM+mTUWyoTfpG9im8GxWrCNX74+0w/S7+I0zZY1fILLEsRP1Ll3DGqK+8SKaHtH0fD2RunJ4fLm0e8YwrKedCh6Ok/4T3xssOZ8kSX1iybshOVAon4viJk7EmRA32HBXoZB4Ut28rBaI74nlJkDFC7bEpWILs4zA0sfLHLES7hW3HVuJ3b7CEMfo5p10eXi8IYw/EM1Q0OmVYom1arex4HcI3EnOJN3xGqdmeBnjr3/47ZbH2sPqdP+gAz9D6hcmdgh1XCiT1qzDO/L3zCBTwiDULzRlegOGLG6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5SZ8UPM6FVyq/TZYy0ZUDWsMGtfXBReydm9cJlc50Q=;
 b=TEd3uJjBPT1A3tnZXTq5rEWqa4yhBsjBHaM2tnKOOiQjXch5rGNv+U9nk2rfkyPMg2FWWycNakTp/r7sa36DmaJ9CjKVBF/x5OT2vPprUPSJqIA1SNZ69sGcZmcIYl5n/Ti/712yFGZZSF9J0I1A8YhXTIA2ej/TxlttnSKUHMgJXZO5xQubAfkewAHtjlraKxtPA8MbVkNYOktCu9DhF3plmFnKY8LOqeasDZvrunu4C2AdJQl5M7hQJJYRw1UOxA4e8R/iwj7EyulL6G3o5RVG1TWmFvCHahb6Ii3MI/+SRSgIBelnLd/5xBzHjRIRSIJMMict1DeqI0NwV3szYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 22:45:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 22:45:01 +0000
Message-ID: <08fc12c9-60b0-4fe5-b726-99b7a697b242@intel.com>
Date: Fri, 21 Aug 2026 00:44:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/xe/sysctrl: Log group and command ID on
 mailbox failure
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-15-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260820101632.527214-15-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0157.eurprd07.prod.outlook.com
 (2603:10a6:802:16::44) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: ed307545-65b7-4e77-30fa-08deff0caaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: risC13A1HbrRSLLjy9S30kdxKR53wkUQsfddEBgwLhOkAGMJ7aSCq4+/NhL+OYBKrKSJCgzSMjT1MjV0pj11MTVqn8cvipn8hq/lNiiS2r92V+nrhBsU0AP+X8lf9GylRMfISqPwX8MrayTfPBZCJRNW3DX27VZ2sfa6Q7Qpzi2VtUaxKQbttQCAkPJhMgkJK9OgMau7fcHPKJRTK1KZTs4dYk6eZMVrr5KB12tx73/sSMO8FvBfkJeQa/FsLNwfYR7wfMDHDb/IWfJaDr5aKIpPEpaMJbEI7/wds78I8HfiSUYCIYIAMj7kQy2M4+2Xd4Nq38pCXC0qPq85qGRRKoxU0Apyi/2x97v6oSVsIJ6hg5w3No91P36BHG1+87mk1BnI87+hyHkUJtzW5JrUMBZFM/b7L4c79L6QwPl4OBhrngQlpvP5I0YtG9d2tZnVOyc7tJEfaWoJ8rM3E3Nop56Si+yDWlzMeBCLmhXQ45i6/4gLoQ/88G0NlAHoHb5nC9WMjSiUkO4aeO0y1DGxnuYXTyRseCr4CzGH1x6SfMHGXl8oaaQX4mXeYmJfAfJgzd5CL3JEiVqHIY5ypNJYeAU//ab3ZRoObby4DWWc3p2fpgLmdbPFCZYhInJ3o7AlIoUZvY3kuJK269vH1+bnmeAvNZu/GRKv5IB8dSdshTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHEySktXOEhpY29MdEN5ZWkxa1VFMmw4ZXM2Tkl6SHRmZTFnVUtjSCt3ek9N?=
 =?utf-8?B?UTdWRFZhTXpFdjY3dkNaVEdvRVFBeWttRmkxdUJ0L2JMcHVWeXpMdm9GRVBG?=
 =?utf-8?B?cXc5RzhrcGZhWTNkRlV0T0lMSXFUTGlkbXFoaFR2TXppdGQ2aXNVSFViam04?=
 =?utf-8?B?TElQVG9WY1N1WXFtZHZvUzB5Nk0yVksxeUZnNGZjbWpHNW1uMHZJVi8vTDBX?=
 =?utf-8?B?dU1kNm12Z1V3RXdXUVh0NjRDTGVKUXd3b1pmVGFTY2lXZkJUcGJsN3RYOGV5?=
 =?utf-8?B?Z0FQdGRVKy80dXExVVkxVUZHQlRnTE5DdWU2TlR5dFU3bEVWYzZWV1Z5d2dJ?=
 =?utf-8?B?VlZmOGU5QzEzK3VPQkFaMXZuMVpMaWxvQ2dZZzhiUVROTDRraGN1Y2hiQU5t?=
 =?utf-8?B?djlDci9oSVZPdFdIelJTR280empWUFlGM1dBVmF5dGZma0N0MUVNQS9yT2pS?=
 =?utf-8?B?YVYyUHNkZmZhRE9Fek1DVEROUGdteU80ZElUNm13VjBRdkUxdlRNM1hISHYz?=
 =?utf-8?B?bEdoUmpVWER1UHRlV24vV2FGcE9LTmNGSis1T1VzZk1lT1o5MThNbmNJblor?=
 =?utf-8?B?eXo3S1k3bnRKWHBlU3B5VHMzU3h1N2x6NmQzTjBzS284MzRLMm5pQmxxSVQw?=
 =?utf-8?B?SXVXdXd6NUY3YU5nQ0RRYzEzNm1hVUkrc0xSNnJvVWUwMGJyVVMxVXplQ1NB?=
 =?utf-8?B?SkN6Q0k4Z1dvSXMrUzVPSEdqcGFjaTlidTFHREZrU2dZMFY1Q01iRWNQRjJs?=
 =?utf-8?B?OEpMcVB3VldrQW5oVEVRRGM3blU2NlBISlpweURtWDdLZUdPOGN4NTQrc0JY?=
 =?utf-8?B?REVXRk1WU1k3TGdrNEN5REduZUZhdDh0dkJpeFZmNVYxZlI4ei9UZjZUQzFu?=
 =?utf-8?B?QjJ1SFd3Zjh5UDlXc2FQRWhDbFNrRDZndWxmUU9nV2JhbkZibS9Jc0VaSkhL?=
 =?utf-8?B?cWxNYkdoZ0xPR3Y3eGN3SzNoQy9TNzBxc29RcGtTZTd2dnZwOW92UytOeDVS?=
 =?utf-8?B?MXRjZ1p0UGg5TjBEUGxneHcrWEthZVN4anNydWtMU0gzMldOVzN5UEgyOHFv?=
 =?utf-8?B?VXBVVmhKMGlEV20rTzM4QU9lN3dPUWJ6ci9JVWE4bm1ISisrOGRGTlA0dnZs?=
 =?utf-8?B?YnZvZTB5bWEvNTdIeVl5MlQ2anR6SGNwRjhzWVk3WjlUU25ubkVLRVc5SnhL?=
 =?utf-8?B?QnB0ZmxQc05RcVNxL243bTIyRHRSMkVOWTBjTkc2SXdhNXNpdlVpZ3dJenZ3?=
 =?utf-8?B?YnpJQVVWN2pvbE1ZYXcrY1QrbzJidm9hUjNYOGZpenZVbEQ2NEdhZWlkeDdK?=
 =?utf-8?B?STZkbWpwd1lqZ0NZWlJIcUZUdC9PV282eXNqSEJMSGk1K1VCVTljNnJQT21y?=
 =?utf-8?B?Ny9OQU1pQmJ0WXRUL2liQi8zS0hhOU9KV0paOStBUWFCenNCRkNpZFNqcThn?=
 =?utf-8?B?SDdod1h1NU1sSjJpSGl3aldBU2dwd0dkZ3JIeHA3OUFMUUlEZ2dNMk81Sm44?=
 =?utf-8?B?Sk5SS0RyUDN0U1U1TXR3UXA1VHhVZERrMEIwa29xMWlUUklHTmZ6V2FMbnlX?=
 =?utf-8?B?d2RoMWpWTEZpVjZmRWlwRVYyR0tVRGtXcG5Nc3FEZjBHL2FpMm1LcWg5ZEpi?=
 =?utf-8?B?eVBUOGRaTjh2R2gyZHIzR2R2eGNSa3FtaHc5NHh6S2lSY1ZUV2ZKVWRVQmty?=
 =?utf-8?B?S1JsNzg0a1U2eGl0WWh1Zm5udUVEZnRUSXJ3RXIvNTZINi9HUzZlaU9CM3V4?=
 =?utf-8?B?bWUxL0dwYm40NnBGdDgxSXVCQzlia3pGWTZ3OVM1QjFKRVppbitNR2toTlZ0?=
 =?utf-8?B?KzdFSG15M3BtZVZzU0ZzYXgyd2VHdCtDVFZWUW0xa3VGVXIxaWRYZ0Y4SUdH?=
 =?utf-8?B?Qk81eTVZVVBYQ2RHOXpJbnhZcHdXZjdoZThQdnVIMmtTcFNPd2VFNUhqRm5P?=
 =?utf-8?B?QzVlVFoxN3JPdWM3eHhuZFNWUU1sTU91c3RGN0JEdzA1aDdVWWFrclYwQXJV?=
 =?utf-8?B?UkJySnRaUFk4eHlKNzUwVDNsUWthSkw2SndyOEdNdmVEZXJlR045aE9XRjBt?=
 =?utf-8?B?bmJwTjliV0dudjZ5clFhaTNRSDRCK1NPYWJla1h2akdGbkhFakl4b3IzMG10?=
 =?utf-8?B?aENRMytKWnROQVl5VnBESGVCS0d3UUVaei9tdVZhL2hqcmtrYjZHK05KeVMx?=
 =?utf-8?B?WFN0VXdPSjBONHFFUGtsd011eUhHelVvTTg1SXJhZ0pITll4RVVBa0pEZkhI?=
 =?utf-8?B?d3ZreHFRUHJ0VUJ4dTZnZld1QTcwOW1iQlliSS9uR2Q3TEd6UUVlVG82U2hi?=
 =?utf-8?B?SklrNkt3bW51QjAyTDAzazJsT3pwN0h1TkVMVmxJYlJIWkNvQjFveDg5TVQz?=
 =?utf-8?Q?3DbE+C2d+IzkvDLU=3D?=
X-Exchange-RoutingPolicyChecked: RLB+hRS85tcjb2PIKJ2uL0EJocZDXXctubAfxtAjq5iaJxWDCw+CmRPJUMUJvQFAIKo/z9TIcezlKSCQjMRLCz5XQsCO88XOqIYYPXBPFLAKi1/FWMbSt1+x6ooXvRLvMnipavAAwq/oV9auyK1itH314wg0PTLkTKKx9cqpe3GacSXLCBZVIDuGPaX32rO8V8UKHccBkk7UwQ1yNLuAtfP/NzYyzVtUcrtMBK743rI4GJhiVvxvqbnxk6JIDfjhz56uenGiaFsNScYVjU1KPZi1wNPaCBqHQ4DryZubKxw1340pWemvUi8SNLNvY+7MP2JIDFF5p26SpX+VPQ3g9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed307545-65b7-4e77-30fa-08deff0caaed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:45:01.0712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsozsL5l8Fv0RyoYID/90q6cO5qBQgS9Hz/P/y0tCw3fPbkIYSmUGM6WLUZPzsmF6Ee922fMLw79+jP6uF2W8IeVHOVHGHjwxtxOorT2g6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9226
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



On 8/20/2026 12:16 PM, Mallesh Koujalagi wrote:
> Include the mailbox group ID and command code in error logs
> for command preparation and execution failures.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 9d7915c9d4ae..dd4cf8ad1279 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -373,7 +373,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				      cmd->data_in, cmd->data_in_len,
>  				      &mbox_cmd, &cmd_size);
>  	if (ret) {
> -		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command group=0x%02x cmd=0x%02x\n",
> +			   group_id, command_code);

maybe just:

	"Failed to prepare command %#x.%#x\n

>  		return ret;
>  	}
>  
> @@ -383,7 +384,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				   cmd->data_out, cmd->data_out_len, rdata_len,
>  				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>  	if (ret)
> -		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret, "Mailbox command failed group=0x%02x cmd=0x%02x\n",
> +			   group_id, command_code);

and:
	"Command %#x.%#x error\n

>  
>  	kfree(mbox_cmd);
>  

