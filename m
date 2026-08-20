Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B22FC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F96F10E625;
	Thu, 20 Aug 2026 22:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqjehDTu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B6D10E625
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 22:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787264942; x=1818800942;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QRnHrmg0uJt6B4WVHbl+YlJvAd7TnwtRrXv5OmVJ5RI=;
 b=aqjehDTu6BfbpBGZeqWUWlrePexdo68O/e26keg+iIWS3g7c3sVi29Ch
 gSExde94NArNbteWS03udoVgoERA2tbgg2kzD0XONVtHyHQhQEqiOSGgE
 C/1sBj1xoWx8zyM0kVn4DjJH1o0Hcc5sPReWpOR3SyUde1ukUgHf/oANU
 jOuPU0KGGt+3l4ZcuiFKKs3TWNZGh3mHMKY6I8F5S9SOBv/AFJYC0/eUT
 2xsbhOG3oyLop7mSAPHXMykS1e1HZxm+5BwKmpLIKsYxpisjBfm6Rtv5G
 05HmCWiDPMorKZipmD3HpVsfQtTpme3g3ItjmNiV3+sJdFlnu3JGNHJT2 Q==;
X-CSE-ConnectionGUID: TefKkVurRk6blv/HGPrGZg==
X-CSE-MsgGUID: xSHurNIYTB+IsiqqaWe7EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86761382"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="86761382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:29:02 -0700
X-CSE-ConnectionGUID: gomNhIBxQWardvgcwug3CA==
X-CSE-MsgGUID: 8+Cx3y1/QmGC1BIXtSbMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="265662441"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:29:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:29:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 15:29:01 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:29:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVuiTVxbJ9NkeyalUKGh0KLB1W6IpFzBB9RrBrV7ZHB6MVaK/zhA7kTovcwQ3SYNsgyWdZ8/hgWmZesP/fiyPFMIVaKOXXOBze8AxIqt/uKLKN82tl4LqAHpaC1uzmyI/xd/D+X7mHgdAGnwvwr3oC36/nc1k93QDi7NQ7jBHaJcDbWb++gcNDWMJHqJuNsiREFcNutiEdUtlXZmyed5AWBPfn8KIu4QNoOPkHtNT+Gvi/vtxXSBTAj1CoG7gkbHg3SaH/UoFwq4TbGmYvKE7fjJ6BWF7HQ7pt/Yx/BkM+bVrQGjjBxUxj4gXOuEmYWTKIkUL+55C+gDN4pcHoEsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGKYgnin2uLFYTy7b9poCFZT+bdnt7I+8m9TBHbwbGE=;
 b=rJzq7nGL96NJ6dLUovq7CxLVdufJgySuHyUrIK/qRo4ABPiMRoOs9c2KGxteS4SmoE/+mgTgGQpUQkia0v3aFxeDTx4F++ggzPvsvxVB8vXHpNPsGOYcaAk2IWwJ0dovpGbpnOL11B10V2Wus83okqIQX0veVeBGuy81civmIBKzY3l5nwG/RwLFdYeaTIidyARL9WZmQR0j9UTlyoq0anzh1gwlbuG4LOh1GcesTy6E6j0nshqwEqfHgrR1codcwBtKaD0bJEaEdKStBvAmgk5oC7ug8IvMqZsf9PRgHP6gZXaCgyJybfsvooSSD1MUsL/C5nD7w0V2xRYnshwGzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 20 Aug
 2026 22:28:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 22:28:53 +0000
Message-ID: <a04b62f3-2202-44e6-87b9-a6f08726d2a9@intel.com>
Date: Fri, 21 Aug 2026 00:28:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] drm/xe/sysctrl: Make sysctrl_write_frame() void
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-12-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260820101632.527214-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0297.eurprd07.prod.outlook.com
 (2603:10a6:800:130::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: aea5633c-faa9-4c98-1d46-08deff0a6a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: h67hZ7vHwkTxjHgOP3YbgtaHyIgO/nK3iK6lB8/dQBEk/aQxUeX+vKSyTRjDy3nmri0kYdYKD88DARD9YU/eDvyWsb8zjCRVSEa+1JqoHaE4n1Ap8PtX//VahW4iftpQcNBFCdHLyy+M9bdnmvlYfs2U8dnsSU1BqRPR1vbPzc5e58QX0CEZGy5zdAxt09UD28ViI9xkH/DO9rkw/bK5g8+NdViKf13JurAzmIugGlAk5U61lp5O/5L6xaykOYa/0wp0T4iVX+byI6MsZhP0Qcj2Q3DiskwxqYYb0lXfIWCixsS2C+hvhf6YqVjmZBK2KX3eY6DE3+OPUZtoJTr92KTKqwTEA7gUlj/lQhsoS8el3o+ozSMHrc/kN+Ip8l0zTgMD7Hgx5fVY0CL4dy7dz2DqZMUF7++lYfv/qKXQFBeMwSuKtHOkYDUJMPnG5bDt7f0J6vxhkxnmjIyS2H0zTDzxGoa6IXd8WMvEhaf4eQX5Yfvvik1cLpCZXE9IEgjSHn+SPBnEmc7wdiiaFmFsBv/VTPvUo09tNFTkU/wJfbZvscSTp5rvw1MkbaImVRlUL85Xs0kzkmoYLIeSnSornFcxyxNwcbr3aprXCG0wsr5rGYuwMhmq3WHOnuvdUaxTKq/PVfZ1ZNtOUZrF43v28zVApMUnDXfaxbgX2mksGjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTNZdUNBcDNsY1djOVJMT2M4a1cvTHRPdlBPN1Naa2E1ajc1VkdOZ3VyMldP?=
 =?utf-8?B?SDIwQjk2S1hHbzdQUmpWc2xNT3paM3lML1E5dWFTZzRBSWFuSnJhdWRaVUlt?=
 =?utf-8?B?M2U3T1MxWFE1eGVnMVBmRG9VSnBzYlBKa01KY3llWkNaVHQrYmI5a084N2Fp?=
 =?utf-8?B?dE15dEExcWhUM1h3M3g2STQxd1FuSm03dlQ0dVg4UDd1WWlvWlF1Vlk2Z3J2?=
 =?utf-8?B?MG16cEI0ZEc4dThCYmFjN0c1QTlJMVdLNjVwNXFYeGUyZndwNG00MDJ0akxU?=
 =?utf-8?B?WVVHdjRYNTl1TFR3Rjh2anB4d3RtTFJlUnZSZE5GN0kwNXdtdVNTbFUvak9s?=
 =?utf-8?B?NHZWUFQrdXJkL3Z5OUsvbDdNbXFsb3dTaURSVisvTzhQb0tUQWFleWwvVnIw?=
 =?utf-8?B?dml2bDdCMnpwUDU4MEM3OCtVNWtuV0YxRmJJUmJnWG9qMWVjem5WUkYwT0hB?=
 =?utf-8?B?aVV4SG1DSStVSEhIK0FvRmZreGs3Wk1ERXFDbUg5T3JWMmkyVTByU1A0MmNr?=
 =?utf-8?B?ZExtZUF2UWNXQUpSckM3d292QU1rR0t2S1dtL0xIWFozcTBlTmh1dVpJeG5D?=
 =?utf-8?B?S0JkOHJSY2s0RTdPTy9XSkFrQUhOQmtrdzJwcTJwRFN3K2d2amlBV2cwTzVq?=
 =?utf-8?B?MW8vdWg4MmZrZ3VMR1duMU1ITWlXb0RXVENaVFRKUlJtT1RQMytKOXZiN1Vu?=
 =?utf-8?B?N29RNFUzbk04T0hBRGIreHdEdllxVlg4bTI3bmwwbjNxSzVNcWJqZXJNTVhM?=
 =?utf-8?B?bmt6dHAvdWtNb2syWkJZR0FLSXlqL3d1TzZKYTJEZ3ZoNmVZUlRHclpacXVM?=
 =?utf-8?B?RHA4R0NSdjVKU2lZWE90bnduK0cyUjQ0QVNZYTlReTlObk1IemdVc3Z3SURq?=
 =?utf-8?B?NnQ1Wml4em5uMXh2TE9hcVF6M3ZxaFpYTTFDeHBpTDhNVVFLNnozWVZ1MUQ0?=
 =?utf-8?B?OURva3NibmQ4bGxXUXF5SE1JYUtpWUFyMmE3RnVLNDRGeXVEbk5GM0JyRld6?=
 =?utf-8?B?M2d2UnowWlpqa2JvazlCQVgycUhoNHVFS2N4UWdkNGFHc1FCR2xWd0hKY3Ra?=
 =?utf-8?B?S3A4NmhWUmlRN2p1QlAxTkVYeWVGdWc2aWkvLzNhemdjeG02N1NkSEh0L2xa?=
 =?utf-8?B?RFE1QmhXQ3BxdmF1N2VtcC9xenhLOWpKbG04Y1QyMzQ1SmtGRkdZYW51QjJT?=
 =?utf-8?B?SmhPNjRERmJEVHByTGlxU3psWFMvOFNCRHgrbFZRR3Q2Rmc1MFlteU1DUDIy?=
 =?utf-8?B?eDRacm5UNkFhNW1NaENYbm5HSnhia0FPY0ZWRVRiWVNqdDJnVUhvaHNDN21t?=
 =?utf-8?B?dUZpL1V6b0hXVVpGcm1IYjdweXp6UVdGV01hcEdFU2ZWbmh4c05YVDJwdys5?=
 =?utf-8?B?QUFNM2tmcUpqekhMTENtaktZcWhoWUY3NlM2MWhxKzE3NXFCSGRLbDJwNktU?=
 =?utf-8?B?S0FtdjlBQXZ5TTc2d1ErbmlVTkNKdEFTTFhzbWY0VjFwS0RXSlR5dnNxellP?=
 =?utf-8?B?azE3eG5JWGRicU1nMnJjTlE4cTV3VlByRmRvMUxzckpsNWF0TVAwQ2x4Sm15?=
 =?utf-8?B?VkJEOVRxc2t2ZzRuWGJwaDBYSHBFNExUMTZsaThneWh4SzhuYjFSVUkybXIr?=
 =?utf-8?B?TmJHNGFrQ2ZhZ3pnYU9MTzcxUmc4VENnL1duMnREZTNwMmI4aUsrbVczTmkr?=
 =?utf-8?B?OTl5SWRGZ2hQK3M3dk0zWHh2OEtocHNBRDRWWU8ydjJsSk9zMXc2SW4wWVNY?=
 =?utf-8?B?S3lIRGVKOWRjV1lSYW54bCt6czd5OXRlMDMzOC85MkhqVitYQ0k2YmxPd1lW?=
 =?utf-8?B?MVpvWk0zM0pianhNSlIrMUJOSE01QTMwNGZJM1N1dFpHMXRERkdrc0JHVGdH?=
 =?utf-8?B?U2VBME9udTZ1V0JiNjVKK1pDbFhLbUhkMjRNSUMyb3RVdmxiVXFEbzdWYjJG?=
 =?utf-8?B?R0tnWnJkOUJGMEtIYXdIUnY3R0hmZW5Td04zNWpyVElJbkVwbHRmVmsvNkhr?=
 =?utf-8?B?ZHZjQzJzam0wZzZIL2lVSTg3YURBUmU0amVHdHFSelVCamhHSmhtNml1cmQ0?=
 =?utf-8?B?Q2JEeFdsSGd2aWg0YllQbDVDbWZDa0N3RFRKSkk2Sk91UnBvY1gzWXlKdjRN?=
 =?utf-8?B?b0k1NGk4Qmt6REhzekU1Q1E2ZW82NjNZREFqdW9JTGlrMzArbjRmRXdDNEdr?=
 =?utf-8?B?TjNCUWpOd0ZvQ2xvaTg2Yk5HODFQai9OQ0ZxUFY5S2dMMlFlbWJQdCtJMW82?=
 =?utf-8?B?SzhnVEFHaThmWWRhRHVjRVllSFpPTWJ6YUNPVGR3cEhsTEdQKzdjODBYQXBQ?=
 =?utf-8?B?MUExYkNSRHJuYzJsYlJ4d0RoZmhNNEpPS0NIQTJBaDVjSkVJb0gvWFR2YTFZ?=
 =?utf-8?Q?Hphr2qpqJjiqWXBA=3D?=
X-Exchange-RoutingPolicyChecked: Lji/ijmMeL8ydayBT69z8FtsQ0QTTIjqGlZujzvDISttTFdvUBIRjE0w/Z2s3poY6DvsDx5z2IkcpwrNrV+t5lbEUr1WpYep4WiTBes3FszTAiDElzP9SX8OSWH7tqKQgDq2Mb7qZHU7b9mq3k2t+nPP+fxfzC8mc2vvtwGO/gwsoW1Xf5ZQvJIZEYFKDvPaAX44iicjVN/ML618IFlNR9M444EG4+T+0DID4ZM33MVyMmMlAFU/QBSykd/ZhpMYqvLw2h1YmH0P3hc7adKCxSASo52VznNwdL3XQp8P+0/bo5wqnIp9u6dRGGGEvWM0P+uOCmwpV9L0/w7pgknTFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: aea5633c-faa9-4c98-1d46-08deff0a6a7f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:28:53.7604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dzRL/uEY4JPVO0ntB93P5gTaJZLOaONsYSsX48/zpCR8qXz7UDOt60J60lyyBx02Su+7YCGScVIf01jiPBt6BFi8c0YRP/eNeIinIxKIAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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
> The function always returned 0, so the int return type is misleading.
> Convert to void and drop the error handling in the caller.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3523651b467b..ac58571f2a43 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -49,8 +49,8 @@ static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>  			     timeout_ms * 1000, NULL, false);
>  }
>  
> -static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
> -			       size_t len)
> +static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
> +				size_t len)
>  {
>  	static const struct xe_reg regs[] = {
>  		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
> @@ -66,8 +66,6 @@ static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>  
>  	for (i = 0; i < dw; i++)
>  		xe_mmio_write32(sc->mmio, regs[i], val[i]);
> -
> -	return 0;
>  }
>  
>  static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
> @@ -154,11 +152,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  	for (frame = 0; frame < total_frames; frame++) {
>  		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>  
> -		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> -			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> -			sc->phase_bit = 0;
> -			return -EIO;
> -		}
> +		sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size);
>  
>  		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
>  			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |

