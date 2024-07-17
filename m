Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FD8C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 23:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC3B10E493;
	Wed, 17 Jul 2024 23:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qw7zpeT1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECB310E493
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 23:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721257477; x=1752793477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hB2qgA6d9pyyGqhpLtNFb2FgASDyjzU91tINXQGBydU=;
 b=Qw7zpeT19Me21Ne3+I3Suw3FazITaSJA6RAis3mefUhK9JVry1dF2fyM
 h3O/7hHuCgnmDHWBOhIl0PsKkG6IJs0vEdj1MqTOKB+E0ocZcrMhljXWw
 TZcQpXKq1iFM+oTfTGdVVK5TXcDqfseZ2WhjaTzMWQsirnAiv7MDYVEqO
 8JBIdzTsliR0reDufDVCkNcIHY2QXWZKA3JyzW0o+1eE9R9qjkl7WMznf
 odvuiQuEdQRcYCHf2OcrCLfLN1n32pTg6l1kHO6TznnvmKLHN6kAcyYNf
 MOwaQ8cBvIczRYDCg/dhra3osWQ3GBEWtsMb2dgLb/ERjU07IuueEuH/a w==;
X-CSE-ConnectionGUID: lm7PCl3/S3WL8lRe5hhj6g==
X-CSE-MsgGUID: JoA3VT5dT5u/CUlk8EkRhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18661883"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="18661883"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 16:04:37 -0700
X-CSE-ConnectionGUID: r5CGrQ1eTaedQlKt+/v/Og==
X-CSE-MsgGUID: f4h4FwCARYS8mRVRGwwYWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="54741183"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 16:04:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:04:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:04:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 16:04:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 16:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1e5bd4ztBIKaNjZ96R2j6p6UITeLrXA7msLrxekiELqSkok6DFHjyhYS8iiJuY9W2tgwHmDE/L4bUEtBdp7ohh+fCEXWIXPOIGkVdDtECEBUA73/YtQEsIi68PRZqKbiDCqulbScL5NggVI11lav+nnuTDZndWtYTRejWogEXGw+3XJ+LIDqTwMzJtyZ9XOx6Dv8Tb3hadYre4lKRYr602XeRA7Mg7KenUP7ahUspBcXSDpLvyCrrd+LM3FpJ0IUoa3WvIA+dghFsfxk0+0K9sr0U041+gUHsp+LN9q4/ea8PmilJJ5bte1Rsd0ad103nyzoRmezoa9H4yWMZ2iAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWmNfyCfxz6QuQsd9qgsBqce+ccLO13HtMChuLHADTA=;
 b=WRLS4ntMgQVcW2owWq3PJpvVLYP2WMSKWSm9K/AHgIcdwO1FBswfMT260BumeSMPnBCrx3BJi/UcbMS5IDB8hHsjuKKqzP5AcDo808eZqNXQPhy8GzNi6C/128NvTeXfu1XfL4RL3S7VObpMiCSd7MCRX0tkwgNILTEEjdSS1w9c8bc23uou4Rx0kWGzEdHyPweMRFAZhoF6vvUbRSXsadUPQD7jG6TuV8zYiXJXa4nyaST8Zuff+Nc8dlDPRVIacjZ0wTVn/5uDAVlGwhxdQzgGkYOQggu0IFAXqi6R5FlkA4sGKBT1XP1Pj25TUDusf+Ok+otnEFm0fX7x8MpAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8356.namprd11.prod.outlook.com (2603:10b6:208:486::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 23:04:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 23:04:26 +0000
Date: Wed, 17 Jul 2024 23:03:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 8/9] drm/xe/hw_engine_group: Resume LR exec queues
 suspended by dma fence jobs
Message-ID: <ZphNx/r+mdO9QAB3@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-9-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-9-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: 36176ca0-3853-4fa1-f78e-08dca6b4ce5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nKHa68Ki8U4Q9e2JfTECO+UHU54AQRGvAJxP6/lRxLTSH64STFaNdwDkq8mb?=
 =?us-ascii?Q?muwN21li1uRZ9/VmeLhif1WGg6jFP3cZ8Zndq9yCqx36+nloxPWZpXS95s6k?=
 =?us-ascii?Q?CWuOIVOaPKWEcaiY5kNxtTlZgS+62uX1Xk/+n2pYExjjMibj93s3hsUqfIeZ?=
 =?us-ascii?Q?bGvyU/KM+/vdxBWJyKaSwTOyM5RtmXz0zQeTQss4ey2HvZBNB32qUnXKgEZf?=
 =?us-ascii?Q?WqFtr2uA3zFdBPjFgpz1VD6+mmB8i0RViq0Ac7W7BI7mB5jklIcnxygROpBR?=
 =?us-ascii?Q?qcPDxEPE96Yhr4SYvl1oqNlZacVQX9FlRKGre4TlV5fPDCA3xs+ADaFefWRy?=
 =?us-ascii?Q?FxXSrGyiu5P3Z/AG7euWVq8G6ie6T7QmnC9PduZX8tOxkbC+xTjIBYCOcUjh?=
 =?us-ascii?Q?rCBwqgjgLRo+PbFW0+LCdFyJdrmii9GOEzdnXaC0ksbAKNb31IiNFXHhycwg?=
 =?us-ascii?Q?saUc+lo+I5gR9q4RvUdh0UvuZbUH+sskOTrYT42VZAJr+xDLl77LJUSmrcOA?=
 =?us-ascii?Q?thY7lDcUdV2Mfw/bNK5LMNWK9qI4Up5l6iJWmRbeZx6vUY3NChB5GidZMmDl?=
 =?us-ascii?Q?OOc7UnN30icfmXFt57ouzaP/fDJV+bmGYxXqEaoTbyCOP6syI9sCaQ/qFhH7?=
 =?us-ascii?Q?FLXPlt+mFNKIsIgGcZgwkrH1oJTo8loayxOEnz9DQ7iee6ki8NhRUp2KLGho?=
 =?us-ascii?Q?XOmcyrsmIlAdrsmWwhcV7kNVIztcvMjcQ6DnOQf1R5osZp4PvguYhxd/urYc?=
 =?us-ascii?Q?VGNxesmKgaiow7/jmUXl0+HrEWiHb7wAuLcE/T1SKj21SwLoAel/rwxoFyN0?=
 =?us-ascii?Q?/VRxipyk6HdkNa5Fjr1T0gCM5Auc2MjP0RVCMFVY435znE2nRJuaeVh3j4m2?=
 =?us-ascii?Q?+QLfBKiCO8sRpBPss6ajMhANll5M7ev02kbF4FmL78ChBO1OzQ/SHhjnLfjh?=
 =?us-ascii?Q?pxfNl0qNRB3NwEexKsA5STRAJyJBC0kiXWnDXDsdUnonr2ajflgb6YnSQ+Nn?=
 =?us-ascii?Q?0BKGGCxitWqNavEEhgjF0nQzcZvuMakAbxNA0oGgWhWVSkblmR0nNBBaRj63?=
 =?us-ascii?Q?yeQrXVvnonCt33885Q01f4Yj/ouiy/MXJABbjsID7/FuOtOApmqEgSdM9XnI?=
 =?us-ascii?Q?RJlGGCZqQFpx6kSMmsavu4wWp7my8jM5+3jh6xMp+51kee9Fp5rTiauRKz15?=
 =?us-ascii?Q?Pyxl+K9y4IQ591Wp82EC1D0zx7k0n2TtDGrCtJdKz098r514PCHbhdrHEbhd?=
 =?us-ascii?Q?0Fxqpi0Ycw4hO+TZ7U4H/swpPSW3HHLLSHVWzISiEszNANBHeZuye3enrHhi?=
 =?us-ascii?Q?KNtDsRdjvbuU1P91Q1Ml5drYNmT5Y89xd5mlyOIEw+2Uqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fFX7vQqDc+grXKFWNYHuNEBFGmtPk5w6Wvc9IkQxkKj9YzJP3xIoG4yOk7bu?=
 =?us-ascii?Q?XiRNYGFPjELpDL8pcKjwfUNnDarsuG/moYWXf4m4Jh13eqjYzJv+DzBvrvST?=
 =?us-ascii?Q?eoA+QBkuPJEhyklsRweAPwuHvFFU/qEhfRWAcGNhTU5yr8fHFef49DMTUqpm?=
 =?us-ascii?Q?mW452ri1l80XnH2njeXRiu113Icj0PemboI0ENPSGY8phsuhrC4tOWzptbVM?=
 =?us-ascii?Q?nNsq8VAVLcmxaG6zr2ROrn6eNVTwGh9n9wBPO4yOOGmCDO2wi6B2TQL2HLnt?=
 =?us-ascii?Q?MetJ0kZKXHcQ59atfLVeR5Qe8fTsk+UEpfNI5C8wmbY1vFUM6FB4LfkSytR3?=
 =?us-ascii?Q?EiVk+baB5IWSKset9iy6DXKI2+A70MHLDMQ/RqQvqR2LABlnOxzCdyltF7Jw?=
 =?us-ascii?Q?GUy2I3JFz7aJFx8+G+KclEk0y3rnzOBWExiJ9jR9XCdHW3SlEsqGdjlMM0z3?=
 =?us-ascii?Q?pLcyKq9Qk+jSNVHCAsz9wuBEZszIlPnSBMa0XZuVRggQpZ1GteDgnB+E8DeU?=
 =?us-ascii?Q?N0YPm3uQw7o+TDvOS2qNo/Bc2RU2U7b+uxGuSCYEOhzoaXAfbrnIyQHEF6Zq?=
 =?us-ascii?Q?099dEXP3T+FmUycSw/DqTkaSKmLj+L3qlWwl7aAjX6guBbzUiERbck+Ozpa7?=
 =?us-ascii?Q?NsXjq6WPub5uPd/x+nkrZ/el5XEiEVGmm8WOXVumxkPbUpLqqA+o1LpCHiDc?=
 =?us-ascii?Q?Y9ecJq18/6Pyvpb8j5865dBEYw8EY5o98ekUaniIdhd/1Gx++q2aeCCJtd1+?=
 =?us-ascii?Q?UFkvuZg13uPkPCCrdWsLIXPr0knjkhUo8P6p7AdN0EX6JgXJMhYMJ8wuXJqe?=
 =?us-ascii?Q?W/EozTLvxU1nm3U0T6jaERE39bdmzm4AMFLasZgYD+IsZu/7I1ji149ImeTq?=
 =?us-ascii?Q?G2QtOowowk95lXFzBBqOu8JK5XC+3PErsi6b4fdP/ooj0geziQxrKvy8CKYP?=
 =?us-ascii?Q?cTOqKv+teXB8FHogsMmsmDL0lklL9iHRF7B7mvNYQS8Sgn/+l7vB5tZ5ybhi?=
 =?us-ascii?Q?OIoZC/zolu70Hhxijg5i4zJkFMntAZ+Fr9XVEInQIsK6lQNHbHecjIUkT22r?=
 =?us-ascii?Q?dja0azgMi7Fu5bt99mQGW+oOxsvv5RNpkncOT4yMFtQvFZ3CvozQRbF4Rl1D?=
 =?us-ascii?Q?09ulhYpG9ZC7Nxm8wUKeqwSMVe44dS07aCa/wO/XnyO0A2FIuTwbVNfLvF54?=
 =?us-ascii?Q?+/VDxLoTrUkXyXg7rGv0fDrGNwCbVUbTz681vLszIaTnFUPhJme8tixC3bop?=
 =?us-ascii?Q?l9lupS/o0qAsc/GYm44TUSKC51X/8+uZbAleXtmo9H5dkltgUKK2pLO4mfgc?=
 =?us-ascii?Q?dXDisifpulb/G7XFknBX8Rn/yQTmuM3P3us6CnDku9vOaZoBSD8i+VOw8I4A?=
 =?us-ascii?Q?VHQO1V4oveHfZenYj0Y02n5s+mH5lN7bgvT8nT9ckaIywIZ4gM0ye1WFwnaW?=
 =?us-ascii?Q?vGYwRxYA2LJxTuKiFqqVeYAZJYpZpkhC/HC58TOpGnqYco1ZLjSXqbLIzicF?=
 =?us-ascii?Q?8fPMQHd1kmp12fdLUjwGkomy9wuqcUB7d6LwrLpWEViGjeSpVwNjOysc2K2l?=
 =?us-ascii?Q?0/dhxPRWLSJr05NK+NjoEMMjs22gqjyZCN0OkzqTEHoenQKQKX0pBvRqWirl?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36176ca0-3853-4fa1-f78e-08dca6b4ce5e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 23:04:26.7334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNgi42/IDI4Adjh/oI8aVDypR9dSuHQoz/cZeyrtTczc4WyVDHoP3QDdM4nqx9TFORuavbndxUE73pcdFYPglg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8356
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

On Wed, Jul 17, 2024 at 03:07:29PM +0200, Francois Dugast wrote:
> Submission of a dma fence job leads to suspending the long running exec
> queues of the hw engine group. Work is queued in the resume worker for
> this group and execution is resumed on the attached exec queues in long
> running mode.
> 
> This is another entry point for execution on the hw engine group so the
> execution mode is updated.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index e6c755a04fd8..dd8ef65cbf2d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -431,6 +431,26 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
>  }
>  
> +static void hw_engine_group_resume_work_func(struct work_struct *w)
> +{
> +	struct xe_exec_queue *q;
> +	struct xe_hw_engine_group *group = container_of(w, struct xe_hw_engine_group, resume_work);
> +	int err;
> +
> +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR);
> +	if (err)
> +		return;
> +

I think techincally if we were previously in EXEC_MODE_LR the resume
loop can be skipped. It is harmless though to call resume twice though.

> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_lr_mode(q->vm))
> +			continue;
> +
> +		q->ops->resume(q);
> +	}
> +
> +	xe_hw_engine_group_put(group);
> +}
> +
>  static struct xe_hw_engine_group *
>  hw_engine_group_alloc(struct xe_device *xe)
>  {
> @@ -438,6 +458,8 @@ hw_engine_group_alloc(struct xe_device *xe)
>  
>  	group = kzalloc(sizeof(*group), GFP_KERNEL);
>  	init_rwsem(&group->mode_sem);
> +	group->resume_wq = alloc_ordered_workqueue("xe-resume-lr-jobs-wq", 0);

I think just 1 non-ordered workqueue for all resumes should be fine. You
will also need to destroy this via drmm on driver unload. 

> +	INIT_WORK(&group->resume_work, hw_engine_group_resume_work_func);
>  	INIT_LIST_HEAD(&group->exec_queue_list);
>  
>  	return group;
> @@ -1235,6 +1257,7 @@ static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
>  {
>  	int err;
>  	struct xe_exec_queue *q;
> +	bool suspended_queue = false;
>

I think you call this function, it implied that at 1 exec queue is in LR
mode, right?
 
>  	lockdep_assert_held(&group->mode_sem);
>  
> @@ -1247,8 +1270,13 @@ static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
>  			return err;
>  
>  		q->ops->suspend_wait(q);
> +
> +		suspended_queue = true;
>  	}
>  
> +	if (suspended_queue)

With above, maybe xe_assert(suspended_queue);

Matt

> +		queue_work(group->resume_wq, &group->resume_work);
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
