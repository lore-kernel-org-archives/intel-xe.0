Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E658C2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 20:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A5010E119;
	Mon, 20 Nov 2023 20:26:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC7A10E119
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 20:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700511971; x=1732047971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Sc2/bz4g9QLrYz/X/MnJvJoux7XvbZrgkwkWei1YY+w=;
 b=PSU+nVFxCbRzYRRWP9luO02uEfTq/TQXxqL8yfSJm95/Yd8IH3sLRl9f
 QA8/TFr537VDUd/EHA70d5Z7dwVwO7ueB43kkq103ffIOlhT2M7k7PCqy
 3ueQMLZjFv1J+8iCDFsMVGDdTIfnHcgNSoAcXZm027nDB8bTG2ix0SKOp
 Sglsk2Ethdf5yKsFDMUTVIVCxpHETRCcTBYNFA0fRMbEfru449lBDGl4m
 1cKmb/Ms4qdnfVIiLExDgDZhKnYKFQ2WwjtYsApuc7VHDo/WlwxGgMViI
 DVNEehKhm0ug9V9MS5a9GUxM7ZeavtA1+VnBzR46wK6dkzOx26I2uSzG+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477907245"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="477907245"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 12:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801306689"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="801306689"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 12:26:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 12:26:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 12:26:10 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 12:26:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eH8fFFY11QfvxBhba0AbLSejbr8sFN10K836ycJ5TGlD62dDGlvgebfO5nfM/8IcV0LV9/QbObijbSCgwaWiI/wBhhA4EJMtXIw4gjswmkXol4dKjQEY92BPguKe9lXPHFrMLjwvubeaoMVWKtQIIZssMRwnLJi8YedlGsb00nqObJd8smaWzvvejAvcX0eMcnLbfuBJ3oTgIaQ1yr1NtPaB+do1HPVe6NRoIj7RAlkT3SEQqotbiHS6sGN7/dLSw18COOEmQos1NtlxAv+FDqAlGd23+mBYNp3QZ97nM3krG3iGl+fWOHF4rC0xxMKo2XbPdboHrh1lSmCsmi0yEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVMb1YCIFoh+FGU1x6fGfEXRWgrJGMA6j7CYfYiBPUQ=;
 b=RffdgdQ8pDZPtjlz8CbP/XgdtF3LZmL5OSsf+BTKsNQZGYuYoqboXjGcIvsOhzZisrdqQOAGIY49p+rvrXf3LBWR0D+/bAIme9XxCoM/NIXhbW8SHD/Dn6Z6INwG9DwuuQLZnxHYmG7T4Ixrffwh1GoSQl5Cu0gH8GQDGruh42LnmAjIGa4kj9qkzHK/I8gccUw8fOUmJi8pXT0PRvP9jxFtMbjZbn1AftxsAb8LiyOzIn7fcMGCAvsrZwCv86MuTW/jatV4yL1bcphizxm+zBLJIuSHbIICnqtR+4EH3VLwYNkUXwnJCM1RQWABLboq0KviMUfN9bWrK8WfcNBqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 20:26:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 20:26:08 +0000
Date: Mon, 20 Nov 2023 13:25:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZVteMhLeF3eSO6DE@DUT025-TGLU.fm.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-18-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-18-michal.winiarski@intel.com>
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2ff797-0d34-42f6-54bd-08dbea06ed8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i23CmCITeapZqAntrMB/t1Mcovr18KLcnPsIw1x7sWbQYAlS4U/I3MOL3rvXQQ8VPBfTOBSlRQZvs+yzlBxkEH5GnduP7bDbHrxUE8gaGUYjxuTsiAlvnVJ7hadXdgDoU+bqToXMW5PuKeCj0+vaRUvv2JiEIfCQSCYIUJeniOrBDx0ktBR1DtJD1ReeMYsvSjQOgscleE9y3PvV9WR3LxlijVvbfJKXmpLsDwOZIJ4DZib9+0drMbXc41F9mBLGrXlXzYkVoY2Kexumd3QCwh2uwzlBW6BgkIjOdp/gbvpwUPWxKx34X8bzZ9kJn7IYH9ILNG+3XNEJ/t+P2HTMwZq2JrGEWbWXEiJvA/bzPcrWuEQAOmXiO0BFHapkm0HC2zhzRNzPJLmnET6bW6ovmZTH5/5ahxijfcVHQXVmAAsLYq+1ydhwPdWCyqL8zmp1pk5GRKmTy+A/cM+we6a2G5J/sRyQZx3BEIOz5ooQ06asrSfjWjBaOg6iRjoov4j6Ls9G8+jNHOLRY+B7cjsSUkdcT/rYrrFPNZ2kP2ApMrgf6sK00Cpo7u9ra9/c8gHt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66556008)(66476007)(66946007)(6636002)(316002)(54906003)(6512007)(6506007)(26005)(6486002)(478600001)(38100700002)(82960400001)(86362001)(44832011)(5660300002)(2906002)(8676002)(4326008)(6862004)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXlsN01ibHRmVGlKVjFUYVE1NVlrMFV1d0pGWERXbXM0SGJvc2xMRi9tUXo0?=
 =?utf-8?B?aU9RVlVDaXVabDRLOXRPSnlpL09aZkxLQ3Axa2FqRkl6dTdXbHBwbEZzV1Fa?=
 =?utf-8?B?SWU1ZFZSN28xcDZMY1RsRGtiK1Z3WGl0UTAvcms3NTRRMjNnREpMSkNUeTB4?=
 =?utf-8?B?dkVSNDdPUTFUTUpHWHIwTmZQZFlLTGx6SDlFc1Y1WGtFTVdGYVlwR1A3bmlS?=
 =?utf-8?B?ODhXUGtIYWk0aTY2NXdQQ1E5TndhejA3UDVlMURLb2dGdHFDVTVlZXQxUGZj?=
 =?utf-8?B?cHlhdFo3bVcreWNrTFprMjFkZ2R3WE10MFVnelRIcUJISnJpbVJiQ0IwWlN0?=
 =?utf-8?B?a2NRVklFYWNndXBlVjhScWw2Q3M2RXVjaFN1NXBFa2g1QkVjeUZQK2lLVGFq?=
 =?utf-8?B?YXdUWGpqNkFzblp4a1R3bG1wSmp0cnNZaVZwR3k3c1p5aGRCL0M5dDh0SG9H?=
 =?utf-8?B?TytIeHBTWmgyYWdTUWdnT2YzMHdwSXZGVDNnbm9SWnVZK2tDZ2hKdElYbXNk?=
 =?utf-8?B?OHJ3YjZaQTNhR1pSRXdMTUFhc3E0MXNaUDFDN2pmV3RMZ1JTZ1FiekEzdmEz?=
 =?utf-8?B?RE9XNlRWdHNub0RmKzFva0JOSUw3eWlFZjZMeisvRWkrZkw1L0Rmb3dZKzVz?=
 =?utf-8?B?WEQ3Q0t1ODltU3BreHJnditTUWZTamlmZmJaZmFSVmwrRXNndVNObXY0Z1hY?=
 =?utf-8?B?bHJvenh3VU40cWlIMlNKaklGY2NjeVlLZWNLU0ZGTlJJSUtMa09PaUZVb05L?=
 =?utf-8?B?UzNUMWYyeW5DMjdjVjdQTEVockNhaGVwajlURHZkc1NldTd2YzRWMmhnNkFX?=
 =?utf-8?B?S1Y0a0Zza3d5NXoxZjIyNHZ6cDZlcGFiZUZSS2JUUmFBZ3BvcGZsL3h3NHZr?=
 =?utf-8?B?RllTZHpSMFBIbER5cjVza1FtWE4wUDFtc3FvY2RMakdKWHJQczdyQnFUeG1O?=
 =?utf-8?B?NWppQ0FMenBTVXZieFBDblFaTzYzdTlSR1ZOeVltTjdVY3RDWFJaTDV4U3Nv?=
 =?utf-8?B?OUprVUoxblJuTlBINDYycEhzN3V4NzFYSW9TMUxNTmhNek81NUEwQUk1UTRt?=
 =?utf-8?B?dW95RG9jTlZqa2JhcmV5NTJDN2lVejZqQmhNR1VrZFFSQ1lNd1J4SHZFRkRv?=
 =?utf-8?B?ZDkwcUwzampUdzRzM3d2a21nYTFHMDB3VG9RaXVOYmF1SXpvaHJHUEhVTGZV?=
 =?utf-8?B?elBNM2h0Q05VL3Q3MWYzdmNmZXY4UVkveC93K0V4WjZaTDZCeFBjTUtQaFVC?=
 =?utf-8?B?UDQzNEhZV2J3eFp6WTlNVHdXWTRaN0QvbmkxaTNDRi96MjhLTVNtd3pNL21I?=
 =?utf-8?B?TVhuVVg0bGZJNlI3R3VuY085VU51aEFqNlRremplSGlkNUdnR1FwU2k1Y0wy?=
 =?utf-8?B?N2lYdjF0OStlZHBIRXp2bjZ5SWZmWDAxM2NvQzN1RHNjNUVySk1ZY0VFNmxs?=
 =?utf-8?B?bUFtSUl4V1lTN0FSbmlBYWxlcEJKMFB0MEZidHRLWWVqS3FYb0daTVQvYWNQ?=
 =?utf-8?B?SCtkWGk3SUtJNnpoZEZrRVJaSDZDNlg2NmpkaW5JK1g3SEgwMnIrN1kvZGtR?=
 =?utf-8?B?bEJwM05FTUczV25oa3JnVHh0ak40UWNXZ0tQKzJGdjFLUW9PUmQxYmdOdXBD?=
 =?utf-8?B?eUJqYlRFM1RTV0NIU1FEamg5TlZ5TWhhV0EvT001dkI1SVVLZjdRdWpKcWI3?=
 =?utf-8?B?ZUN3bVppYVBmb1pBQk81OVFqRW05R0RDamFjNGgwREJ5MHBZNkJSUUl0MFpX?=
 =?utf-8?B?V0RVcGR6SUQ2OXE0c2E4N1NXeFZCTkVMd3g2ZUEvMW1GRVl4NWZScFpyalR1?=
 =?utf-8?B?eVJhUTlrK0R6UjlMQjdsQ3NHNGxRY1J4THZ1aFlxU1c4Y2pHL1kveldiUis1?=
 =?utf-8?B?T09LNjJnRmhHcVVlaHl6WXZCN1FRRG5TME15NmNXbXhFS2RrSG0reHVsUXJs?=
 =?utf-8?B?eWFwT0RVTkd4T3UzZlVnMXhkMGJKTmR3M0JqOCtjZ3NVR3oyK05Qbk5qbmFk?=
 =?utf-8?B?alFwUW5DUktqd0NuZ0J2N0xTVTNybmp0cFVCR3FTQ1JFYzJCL2pTbGVuMjB0?=
 =?utf-8?B?SGtGWUpUZFhJd1hCSENaTzc1V2Vic2lxZzBYOFh4L3ZOWlZaOVBvek9Iamhh?=
 =?utf-8?B?dmVUcnptc0psM2YyNnRsNUhhTHRGUlNYdEZlSUZBa2EzcWRacWp0ejdBM0NZ?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2ff797-0d34-42f6-54bd-08dbea06ed8e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 20:26:08.0742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4SE5VqvgCa4CdnVthMMNxic66+TfWeVuYxhBOEjP00hPUnfe1jlC949resvO8hnb0drFIRsGcULC+2Ug9AlGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 17/20] drm/xe/guc: Split GuC params used
 for "hwconfig" and "post-hwconfig"
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:28PM +0100, Michał Winiarski wrote:
> Move params that are not used for initial "hwconfig" load to
> "post-hwconfig" phase.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783b..d1181ddf4bdae 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -192,6 +192,26 @@ static void guc_init_params(struct xe_guc *guc)
>  	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
>  	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
>  
> +	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
> +	params[GUC_CTL_FEATURE] = 0;
> +	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
> +	params[GUC_CTL_ADS] = guc_ctl_ads_flags(guc);
> +	params[GUC_CTL_WA] = 0;
> +	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
> +
> +	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
> +		drm_dbg(&xe->drm, "GuC param[%2d] = 0x%08x\n", i, params[i]);
> +}
> +
> +static void guc_init_params_post_hwconfig(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	u32 *params = guc->params;
> +	int i;
> +
> +	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
> +	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
> +
>  	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
>  	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
>  	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
> @@ -289,6 +309,8 @@ int xe_guc_init(struct xe_guc *guc)
>   */
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  {
> +	guc_init_params_post_hwconfig(guc);
> +
>  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>  }
>  
> -- 
> 2.42.1
> 
