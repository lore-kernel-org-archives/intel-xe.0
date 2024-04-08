Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B229C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DD910E74F;
	Mon,  8 Apr 2024 17:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feD7wBce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9339B1127AB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712597574; x=1744133574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bbyrXbc6bz1r8yTx1n2uAHHniPkxPHf3tG+mfAyDo1E=;
 b=feD7wBceHT83XGGDmP2DQkjJpDyAY2ijeFFjLPI0f4qTGnUN5k5I3jMY
 vKw5ynliVZiCycHazq/nXGcn+uVIGmHzn4RPMJ2MsbzRZdBiNST+9gDzF
 PmEJkRsMNwgfz7uEL4upIIeFkuxGztOaNHZoE6EbBkpU/DDHfcoLpsehF
 bsKwZJRSoXsnil0VDVXmBwYcsf60agdZaltM2hxUKFINyJ7SuSZTlg0/W
 8fLlK9rzRxbtleWqo8H1OdZ2fasQi3yxu2rNgiII/sfrJ6NGi8n9ZrKqW
 wwcNoLiqfHmfLRYwrCiS3IlD0At2/b7jukuswi5glDaOTbrO+VBD25SCf Q==;
X-CSE-ConnectionGUID: c3nVbhbIQGKcWWQQljVUHw==
X-CSE-MsgGUID: NzPtdE+bQ8mKwb+snQVf4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18607448"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="18607448"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:32:37 -0700
X-CSE-ConnectionGUID: Wudgn2sAS7ST76sKNqPdqw==
X-CSE-MsgGUID: 4mLuI3bTRymFo28UPCMkyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24583015"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 10:32:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 10:32:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 10:32:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 10:32:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6m4kY+gGNIsUShXW2jYyoUpysFzCD4gr6HX/b0Uzyddxzpsgzx+W4diNC0hYeSbIH7BFv3/a4dMLnw13aKvUnrflhZ9m2rM6QpULGwP9nbibugXQsYeFB2WOIkzOeoSbItb3vhvSfBPn9Y9XwSaMz9pN9tOWLLU4+0sTfif90y75IbgSkVb3WU0FFgsQIVaMfsD4kNuB6ihgYcnxreV7nAUknTw2TMJVNwNaIjUUP6UrcirZ2fJhb6Cnr94qqOle2zrHLlDfvrmfTpX7vpL3yXEkEXedJOyKnOtVv1xMZjvT1hiXkI8QwWTwaGBXrqJWp/kQay/jQwLiCba4lD2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKOJRr3FJP4EKYaBzPmgc20ktUr80bqk0jDnRwHfbn4=;
 b=bSZZBxSgTXX/dYcOpRz0Bo/Ie8m7epr+cJ3NU7244FH/1YUnZlbqqufh6V5GZRGHNKkcwaZbNqsL2OexJPUQQTdCyqSz3cDyN3LTatoxnxyYe0E3qVLWr4r73BxxAdyPJrecy1/oVhR/3ynQmghmD6PiGypHNjXa09qojSCxHjHwtMJz9QiBJ8GR7uxnrCbiN508f1vRFhYk9/o+zSRyFNjt2yW9qDmF1PiJaqJ6xTIsqKwh4RF8p6pGuul/TDuACJxU7WNds+NsFxnsL6UPPde+PqSQENeqAicmDZfZ0/sxCbnouHAcQ84etpZnt+MfjhSAmudwh6FXngQ8/DukYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Mon, 8 Apr
 2024 17:32:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.7430.045; Mon, 8 Apr 2024
 17:32:34 +0000
Message-ID: <2a7395fe-869b-4a96-a464-8e1f05614124@intel.com>
Date: Mon, 8 Apr 2024 10:32:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe: Incase of action add failure, free_gsc_pkt
 only once.
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
 <20240408144944.604448-4-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240408144944.604448-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB7757:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c++N0NrjZeUH1WzsdBaQzCXwpDuOo6kkxWogtpwZCJoaHlWPdXfZDHitaaFkIF7GXDuQdDJopKl1mUWzaOAImaQNHCoBBu67seUDehTDYBVsgQMetLsQo9w8z3+DkN75oPu0pP1nuGGB//l4pJVp55oZ48o6QMKR8EBKLpeDI2CDN39mN29mxEOgfBFoIRntH6GvU8kJl1uWk3yd/UGYakljqkAsJBY+XMZ4Fb+IsKYf2ICVS07fzc6poRa09KUlmA7a46pLwRUVisaIguMaO+T60UWYizMJfr0zwyBnAN3dC0HVaLVbaVPv2T8G01q6vYxf+M1aFhPF0pBn119DFpTiyqDOgv02RE9WhcxW8zqQ3cImdbRDJ/Y7VxetYakciWty+hgxOIFaUs8M/5yM1IPC7V8YZT+qQUdKMCh6XPwc7vl7MMzhbxpY5cMJc+8RZSdHivtDj03ZuQUFx9Ee14geks9pEBWobHTGeBZMOmjapba87hvasY36xw0N8H7PFsGgFD9vFQoSnPsjAOGEjtiugyhsvD+sRh4prH7qBogVemIBMXtj2gO5qZz/Gm52EFsRguKjyk9IHrohNl0s2vyycwOSQpu7Mg5vKRV7XrQNIfc91ltQzm6d1iO8FhtKEUe5QNroOZQsaAoTSOkXtA3Ko7l3XQ9FnK7muUwJW/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnpzaWJVeUxQM09iOXlCUG10V2hHbUFrVnFOdnF5YUhUSndJZjNlYjRWWERB?=
 =?utf-8?B?OThtWTNVYWFRSWlmczRVMllPQ0lzSHNRNGcvYnhIbWJXd3VHcTQ4VUZRRDZU?=
 =?utf-8?B?V25sSTB3UFBsbS8zSS9kV2ZvbUpVU0V5dC9jVUN4eXR2Yk05dmE2eXpqTTlG?=
 =?utf-8?B?NUo2WjNIZzl2RHJMQ0tpbUwxMHBHYjlwMUVVellxT2NndU4zS3F1R0EvUlln?=
 =?utf-8?B?Zm9zWkl0emdnMzZ6MHJQbkdiRW8yVVg1Z0VDWlZPWFp5bjBWT01JWjBIcmF1?=
 =?utf-8?B?UkFxdGdodmxtRlJyeVNINFhzU2xvRzFnOUFKMDkzVDBpMGRISStrSk9oM1py?=
 =?utf-8?B?ZTNrK3p6TmdkdFVEdEpyQnl5cWhZK2JxeUxSVEoyUGwrQW5BbnBwME1EZzJB?=
 =?utf-8?B?c0piY2R1aE9vYnhtd0xqalZ6NTdpbU5HcnNyYllISDE4T1RBUzRYQ1ZhaXBR?=
 =?utf-8?B?Y2YzYys5RXBTSmJBMWF0Y3gxMHB6TzhuejMvOEV0OUNQZXlTOVgzS3dmV2FU?=
 =?utf-8?B?Q01KdE5nRWtjb0trR0NGa2FFS1g2V1E3RjNFSGc4aXh0UWNpVzVLZ2FKOWR6?=
 =?utf-8?B?YWpwelM4dXo0OVRBZ2hXWC9sa29qVEJuY0JPUkRuTy9IWUdwcTR1OU5oNG5C?=
 =?utf-8?B?UDZzdnNIMlRSdXl4Tm1QQ21qd0JXU3J2LzVRR3EyeEduMDdYbEFwdlYybEtq?=
 =?utf-8?B?emFmVndydzBCQUJ0M1M1a1oxRmh6SWlZVDRnSUpJR2RBWjBpNGRyTU9rV0tC?=
 =?utf-8?B?a05ha3NzU3RGSFhadXBTZGU4UVZpUTYrYmw0ekQ4c2lmaVdEREM4R3pDWjRy?=
 =?utf-8?B?R1N0QUhXbFRWblMyTXZDN25HNGJRdEVIMStpS1IrZnlsVTAxcmpmajZjT0ls?=
 =?utf-8?B?M1JmeUJCMDF5ZjlzZ2ErL2c4M21vQ3lOamxyK2xXSnZoL1B4RVlBZ2Fkb1dy?=
 =?utf-8?B?MmVkdWZJV2VzOTlQRzA1Uk9FOTlWNjI3VDNRNlNITitQa0NEa1NKcm1CQUFT?=
 =?utf-8?B?MHppV1QySkpWNmRRazZVbEwrb3d3ODFwK2s5YTJjemZoK2FveGlGaUxlL2xF?=
 =?utf-8?B?dGhDQk9JMVFpSk1yL0FFSDVnOS9zZThQWmduSDNCcUlRaGNEREwzVDJJbE1u?=
 =?utf-8?B?SEMxUGU1eXlGbXU3ekR3V0M1dVZ3WVdDT3o1VkwreldxYktjTFF0SGZWRllU?=
 =?utf-8?B?V3pzVHpwQ1daa1ljRklENW9HM0x5dmgvMVUyTzJXWU9ZYVNqUkF2TjljMzMw?=
 =?utf-8?B?bm5YMS8vdU5CMy9lbFlGSEVzeTI4cUUyMjd6SEpwdWpKaThCSzk5NmhZdFpN?=
 =?utf-8?B?cTVNeHJKMFMrcHRqeVhEY05jT2JwOTg4YW1RTzUzMmNZeEdyT3lJNEM5cjhw?=
 =?utf-8?B?S2NUZFIzajgxVngxUmI3c01jWEo5aTdIN05Xc0NIRzZEWmRNNXFic0NBM0J1?=
 =?utf-8?B?U2tDNk9JNmlPMHcxeE03Vzdick9GT0UybDY5UFpwb3NtY1EyMFNUZzNnVnNP?=
 =?utf-8?B?RjFOVEN0a3B3UUQyVzFpWk5BVER6OWZIVTJGR0liNXpsUkRVeXN6RWxTdE5C?=
 =?utf-8?B?czdxMGNoM1ROVHkyOHBrVDZYbDNXbFIyN3MvOTl1Q2dnYlU4NHQ1U21OWXpr?=
 =?utf-8?B?eGRSeGJZZmxRdlJpN1R5Yi85Wnhnd1ZTRXNUditiS3ovTldaK0RrNkxhTHhJ?=
 =?utf-8?B?NUZBSGhsaytkTUJpUjIzSlRuNFQyMmlrUzlqT1F1M0doeFIrS2ZkamRrYUFv?=
 =?utf-8?B?QzlUR2xzRXV6SzkySTlKQytVcVdmdURHNFYrMzA5NnNBOWowWGxmL05JSStk?=
 =?utf-8?B?bFl6Yng0RmZSNlFxekV1M3BsYm9zTks5U1J5S1NGV1VRN0ltY3hydTkwa3Nm?=
 =?utf-8?B?Skh5Qi9SQUsrRngyd3NHWVFPVGVmNnpnK0MvdzZwWmIzcHZkU2VKSEJ1bEZU?=
 =?utf-8?B?MEx3YUNld216YjhjWFFMWlFBc1N3WHlCUkZoSll4UFRhdWgrdXVLL1pEa1lY?=
 =?utf-8?B?Y250V3RaUGdWOEppa3hRWjUzb0NibWoxOU5VeWFhcDNDNkxCOVNvL29ZbmRz?=
 =?utf-8?B?MVdrTlA4dmF2azFHbGY4MTFlOTRjdGFUSzdtN0ZFTXR3OHZBNk13MElYcVZR?=
 =?utf-8?B?Vm16QjBqbzF2WXh3bUEzUmQxMVdidnRKT1g4V1k0ckQ3SmVqNHhlT2tWbFZt?=
 =?utf-8?Q?X67lZ9xNh6TqZBnxZLUBQlo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4441c044-144d-4719-9774-08dc57f1e029
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 17:32:34.1382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNcDTMICKMnhN2kAPA0b3Cax8FcRurLKcMwgTF2RCs365BiOPUO2xqR54DekhUz5IYhT1vx1WRq+r9lu8SZTcgJ9XvfCAKguV6Wbm6rNu4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
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



On 4/8/2024 7:49 AM, Himal Prasad Ghimiray wrote:
> The drmm_add_action_or_reset function automatically invokes the
> action (free_gsc_pkt) in the event of a failure; therefore, there's no
> necessity to call it within the return check.
>
> Fixes: d8b1571312b7 ("drm/xe/huc: HuC authentication via GSC")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_huc.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 78318d73e4cf..39a484a57585 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -53,7 +53,6 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>   	struct xe_gt *gt = huc_to_gt(huc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_bo *bo;
> -	int err;
>   
>   	/* we use a single object for both input and output */
>   	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
> @@ -66,13 +65,7 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>   
>   	huc->gsc_pkt = bo;
>   
> -	err = drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
> -	if (err) {
> -		free_gsc_pkt(&xe->drm, huc);
> -		return err;
> -	}
> -
> -	return 0;
> +	return drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
>   }
>   
>   int xe_huc_init(struct xe_huc *huc)

