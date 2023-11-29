Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5476AC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227BB10E0F2;
	Wed, 29 Nov 2023 21:48:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B777710E0F2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294535; x=1732830535;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y0w0AsT+l3HZTE8u7TFH0c69GdpBYiKjQh3trtDcVAw=;
 b=bf9SF08+33+1HGFFqb+m6no+LsKYmW/uJvKc7wIMHCPF9NP+jiXuXzQW
 Sp8w7GbWM9O26TCDCersXspgVk0POLU8dpFXXHiFkAPgHFb+dVY4k+gb+
 5j+4B4vx/jc4+1cEa0JphSl/gt4GCo+0fD+0/NesMwL4JfmeTMVoJeyAT
 gmruQy1DiUFYtjJWij+6CTzpCIuGIIfqy80BJa6PVvGtjEu+skvCJBn4+
 t8inImsoj+GUr8MoE85jzT4oHbKuEvdNCNzEKITkIhUfiogKmMbazp+yz
 sE5PYC+2HcNX6K4OurSY9BRQpc6QP43GNSh4hiVx83i/+90xDdMKRrDR5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="479432509"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="479432509"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1016410972"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1016410972"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:48:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:48:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:48:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:48:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:48:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGljcq+1sYwg34dqgH3hAC0dRfW517g/S7igar4Ok1GOsYbZ86EgRP+T6ArCpj1fdS6m2eL9EAw4TqVAzHor5UR9B+wWVExR/dzddXtRFwuNPbFpRnr7v4V/cFdLQIDDKYLySwvbPZKz9qmrNK2nzrJ9AkcuEIRzsRebBDvG0INpI26j0pdpw/XjfXc8djKWHfz/tu/XRITusZ0oMIAthsrtiTiZYPO23ZU4xzQriM+brp6cWfTaG3a6aMPum4Akd4ydB1HPg9NMvV652mvw6fToYp2PTesFkBr3UfMEncBPgkWpVAc1x7B/bMECfECMVoY16uJkReRyBXT+2GofKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoVSylEJdFBDEsUxRpQQfhzcRyORZseBrg2oYKVAvD8=;
 b=lvisd1F+6MclMq8cAMJC+eix//44QOVVjg7FXzmkizs2q00rrSRSAdbFakR83n6OOdSYD+e0s+3ubb4WV7/y5WHbe+WQRsqBsg6KtbA20ClEp95kYwFA3mAAUrRmM5lWlvIUpOjOoGdAoZjnjvqlNLzCQofvHK4Z8QKH9GfqaHImLn3mPeV+pHtlxDuJIz/fkRKYl9AJEtFNwFkYW3qmb4r/muQdUjkaAuZDXFEf/NDTqCCAlJKfzhI6Kq2xn5DcuO5UH0a8DUmJL0LraDE6qwyU4o0YUhq3fXYg6WQejkWc1MRl2NzXIshGU/mg/1LuzU15fU80HupCYU0ZUKGpjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 21:48:52 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 21:48:52 +0000
Message-ID: <ed88148e-f38d-4e8a-8066-ae9ea9b983c3@intel.com>
Date: Wed, 29 Nov 2023 13:48:50 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
 <20231129011624.836843-23-michal.winiarski@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231129011624.836843-23-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf845f6-655d-48cd-54ad-08dbf124fa20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1nEpNRVcudWko21MB/fi/c5IQUb6CDERm4QxGGu3XFgYJV5/p+IRigndHAfOGmRQwhx9HEf1QrcrTkObHIvnSzrMKJ/tu0Nb4qQkXEQMS1bXMrjMY1ILbY7wPolOucllPJzHfmWnzXXlzRm0vQKKwdy86wZdXaa5H99LKYysYhBi5FVEUthxbxlzXQUVlQdKuRNyGOgHaxrIPsmq1iW9Ikdto0L4PZE/EsGlt2ZOpun2aHgn+w/UBwIECe0Bbq1vGDfVrcpa3PQyGyKUTGf9UILr0MRAyFjSF0FdDQbY2fmNwj6B5LKeJMuyV3zneCVpS3FFdOuh9vaJ7mYa75mZjU4/CK+BNuXimCdHWWT605mCROY28rv9IKKN3ZueO0ooZfDSD9k/KiMVbOyO9Mb/uBQBATd9Rh/tw2Q8OaWq/osKNDQ1l/TrlhWI4+WhDlL0+dAkJi0l4hej19CAYauTMsmUVs03sm62lmJTaefreuBbeUsH29vKsi7XcCvK0IdbCPPrRfmeofaOKOOco/0L1eRWgnsGdB6d5cGHM2pj3Rws+FIIOwwEKhgBmL6khGYzTKmOGMUfibvMTWNlVfPpGUSSWBt3bEpK+gQuJlRmCkCI7OOWgv/9P3X95MXFMXFD0NJRGO/OV/HhjEohSMEypmhv9lzySTiO4o4o34gB9RBgCoNc8GBD/YwTx8hhylESSYEvwQPqPQVpkRyNnpwMng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(6512007)(31686004)(66556008)(316002)(66476007)(66946007)(53546011)(41300700001)(54906003)(8936002)(8676002)(6486002)(478600001)(6506007)(5660300002)(26005)(107886003)(83380400001)(2616005)(4326008)(202311291699003)(38100700002)(86362001)(31696002)(82960400001)(36756003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZqdGo2SkhONEVDbE4xK2orQW5keTJ6WWRLY0xlM0VOYlVrYUZDbzlVV1A4?=
 =?utf-8?B?RndPK2hiVnpQTm0rQ2ZEUXovb21UM2E5cjB4RU85WktkZm5XMDZxeXY2bmFn?=
 =?utf-8?B?dUtaVlJ2WXhxOFN5ZmRiaXMrazBQS3pIY2FzU1dISFZoM25GWGZpR2J3d1Ri?=
 =?utf-8?B?ODFaUVFsM1djT1d4ZHNsTE1CQnZKOWVMZHR5WDhESThtZGtlcDMrWDFKWlhq?=
 =?utf-8?B?V3pEMko4WGx3VlJyK0FzSFRPamlUVWhjNVVyOU8zdVVxMERTcmFRUmQ1NXR6?=
 =?utf-8?B?Ny8vWCtFMk1xVFdUem1tS0xmVitzYjhTaWY1ZGtEQVlWdEw5TUhsVThvWWRa?=
 =?utf-8?B?NGNPZFNpdWV2TTUyb3VlTHA4WkRxM2VWcDBVekZsdkQrYUJ2NGphWWNpc2xz?=
 =?utf-8?B?bkxTTjBHVEFPTkxyVkVhbC9KNDN5VHF2OUxXc1NabWVUQXVqaWtPUlAxZU5R?=
 =?utf-8?B?Tjl1WFhuNGU4MTlWMW1DVThxUDdSVURDUGhkTjNJTkw5TkhNQzR6Wmhrc3U3?=
 =?utf-8?B?SmdWc3JSNXk2Tm4wTGY4MjQxRW4zQlV0R3M1MEd6VUFJL3lSUzduQjdCVjk4?=
 =?utf-8?B?bnROVmZKMkY3bXRWcTVGeXB1RDhlTjY2aWJrdS9XNUY2bDhscXhadkZBYlZs?=
 =?utf-8?B?L1k1LzU0QjBKRmZ2M0RRc3FnMkp1MlVzdGRrSnJOS01XZHR2WXJFUVljQVNC?=
 =?utf-8?B?Q0VyeVROSG4ySkM5NmhXbXlwc2c0eU9Kem1hL3pmYWRJVjNrZDVkZ2ExdDlT?=
 =?utf-8?B?Q2d0WmZZUjB5R1IvY0VMdDlVNEhLeWl4K0hsOXI5YVhnOU02OXVPbFdEWEIw?=
 =?utf-8?B?UmJsOFFya1NZY2gxUW93c0FnbWFEdjlEaFRlZDFaOXFTZWlNc2VacmpCQmp5?=
 =?utf-8?B?MUw3elNETTdTcXdaQnlVbEZoTjZ3VzZzODA2ZHVxd2QxMktFalREOGNEdGl5?=
 =?utf-8?B?VVNHU3dhTkNJUm9KUk9kVXBrdCs5N2JzT0s4Q1lNandQNVRCejM1Ni9WZ3pD?=
 =?utf-8?B?WU5pNFlycENQSzFpVXAyNlVGOE0wN05RZE45clF0YU9xbnZqbmxFSG9Odmlo?=
 =?utf-8?B?RHZNdzFKeGMzMi9KcXJoSVRlbEVUd3ZwUlFBQVR4c2FwKzdnZHo1emlRYVg4?=
 =?utf-8?B?Y0NDR1B0eXFENjVEcVgxNHh3YjNLT2U5NkhiTGRDbUVEMmlKNHk5NXdjc1Zl?=
 =?utf-8?B?YVM5WVdMcjh2OU8zanV1dEE0NGhZSGg3TFlleVhMT2d0VFpvRkJ2alhUWXMw?=
 =?utf-8?B?ajVURE83a3EvZHAwd1VxZE0zYkNrMFlqc0JQV3RZRWo1Vzkrb3FDQnBYQlp3?=
 =?utf-8?B?K2g0K2VORXpxM29MTkdlYkRNZVh6bE9yL04zTUd4THprZWVuclBMdlRWMDF3?=
 =?utf-8?B?YS9RU2JzOE1VZy9XN0FMRFoxWDdTa3J2Y3l3KzRuN3ZJTnBpYlIxdi9TbkJ4?=
 =?utf-8?B?Rk5OU1hIcyt4S3NDWklmUWkwbzFpMWwwcVJoYXpmVWdZUkZGaWs3a2J2elVl?=
 =?utf-8?B?UzN3NmVrQ3ZNQndkMzU2Sm9iMlR0bURpdFZlbEdpVTdwM1piRkQ0YWhiTFg0?=
 =?utf-8?B?bEo4N3V6eWpJeFdSYXgwSk9wdXlKQWpiM1N3VC9ZOW1jd1F2V200S0V1V2du?=
 =?utf-8?B?MXlMamFFZEl6QXBVMWVUbXRodjlIa25hZFRqa0g4QmFudEVSZkxWOGZGTjlI?=
 =?utf-8?B?ZjJTUFBlekp3MFh0dTdmS2t5ZXdFL0hJa2xYY2ZUcVdIWW1leUNsbmJpRHZW?=
 =?utf-8?B?bWFmLzBodE9kamlhWTBYVFFTQUI0WXJuNVJlejJweVhkL0pJUzhUN3lESEw3?=
 =?utf-8?B?Sk81SkJVbUg0dllReVpIMkZlVTl4bk5OaXJaRVpGejhGSVlsL2dUUW5vK1FC?=
 =?utf-8?B?bzlDN2FWRUdWUGJMYTY0cFdnYXlXWURoaDNPVTQrQWtYN0hOZTB6QkJpZ0xT?=
 =?utf-8?B?UUE0RGNCK21hYy9RVEd2VDRXb3ZVSkZvZjhjZmYxdUNTQnROMmxRSHZTY0g1?=
 =?utf-8?B?SDI0Q2xHQ0M5RVFDWVdtc29HUkpKay9GU24xSVI3K1FpT09sR1RCRGNmZERv?=
 =?utf-8?B?R3g3Y3JuMkNRbzl2SmVNdUZMMDgxdFN5TTRhK2tUeDR5UEpLMGNGYmlxell5?=
 =?utf-8?Q?rnKCjBb2Oad/+66yiNFRi6tho?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf845f6-655d-48cd-54ad-08dbf124fa20
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:48:52.1661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rV6GK5JHYdIZnjRDhisWJCAdA2ACRnkNo6wcrrh5I2akO8s0CAKCNqq6p7sh3/48O8ZXvXNHoK5psO7qNu0Krg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 22/22] drm/xe: Initialize GuC earlier
 during probe
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/28/2023 5:16 PM, Michał Winiarski wrote:
> SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
> to access a curated subset that is needed to initialize the driver by
> communicating with SR-IOV PF using GuC CT.
> Initialize GuC earlier in order to keep the unified probe ordering
> between VF and PF modes.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
> v3 -> v4:
> - Introduce xe_gt_init_hwconfig (Matt Brost)
> - Init PAT before loading GuC
> 
>   drivers/gpu/drm/xe/xe_device.c |  6 ++++
>   drivers/gpu/drm/xe/xe_gt.c     | 51 ++++++++++++++++++++++++----------
>   drivers/gpu/drm/xe/xe_gt.h     |  1 +
>   drivers/gpu/drm/xe/xe_uc.c     | 11 ++++++--
>   4 files changed, 52 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 65e9aa5e6c31e..a236c36cdae3c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -425,6 +425,12 @@ int xe_device_probe(struct xe_device *xe)
>   			return err;
>   	}
>   
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_init_hwconfig(gt);
> +		if (err)
> +			return err;
> +	}
> +
>   	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 964e76f931a28..d2766c2c58f0f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -297,7 +297,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>   		return err;
>   
>   	xe_gt_topology_init(gt);
> -	xe_gt_mcr_init(gt);
>   
>   	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   	if (err)
> @@ -336,22 +335,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	if (err)
>   		goto err_hw_fence_irq;
>   
> -	xe_pat_init(gt);
> -
>   	if (!xe_gt_is_media_type(gt)) {
>   		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>   		if (err)
>   			goto err_force_wake;
>   	}
>   
> -	err = xe_uc_init(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
> -	err = xe_uc_init_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>   	xe_gt_idle_sysfs_init(&gt->gtidle);
>   
>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
 >       gt->info.engine_mask = gt->info.__engine_mask;


I've been wondering about the XXX above.  I added the line above that 
comes next.
Should that move into xe_gt_init_hwconfig() as well?
And replace it with code to read it from hwconfig blob?

I'm asking because I was looking at a change that would like to make use 
of a valid engine_mask earlier than xe_gt_init().

-Brian



> @@ -415,10 +404,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   	if (err)
>   		goto err_force_wake;
>   
> -	err = xe_uc_init_post_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>   	if (!xe_gt_is_media_type(gt)) {
>   		/*
>   		 * USM has its only SA pool to non-block behind user operations
> @@ -442,6 +427,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   		}
>   	}
>   
> +	err = xe_uc_init_post_hwconfig(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
>   	err = xe_uc_init_hw(&gt->uc);
>   	if (err)
>   		goto err_force_wake;
> @@ -462,6 +451,38 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   	return err;
>   }
>   
> +/*
> + * Initialize enough GT to be able to load GuC in order to obtain hwconfig and enable CTB
> + * communication.
> + */
> +int xe_gt_init_hwconfig(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		goto out;
> +
> +	xe_gt_mcr_init(gt);
> +	xe_pat_init(gt);
> +
> +	err = xe_uc_init(&gt->uc);
> +	if (err)
> +		goto out_fw;
> +
> +	err = xe_uc_init_hwconfig(&gt->uc);
> +	if (err)
> +		goto out_fw;
> +
> +out_fw:
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +
> +	return err;
> +}
> +
>   int xe_gt_init(struct xe_gt *gt)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a03..e9d6aeceb56af 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -31,6 +31,7 @@ static inline bool xe_fault_inject_gt_reset(void)
>   #endif
>   
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> +int xe_gt_init_hwconfig(struct xe_gt *gt);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
>   int xe_gt_record_default_lrcs(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 13e76e6805ca1..123baafc9ec38 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -29,13 +29,15 @@ uc_to_xe(struct xe_uc *uc)
>   /* Should be called once at driver load only */
>   int xe_uc_init(struct xe_uc *uc)
>   {
> +	struct xe_device *xe = uc_to_xe(uc);
>   	int ret;
>   
> +	xe_device_mem_access_get(xe);
> +
>   	/*
>   	 * We call the GuC/HuC init functions even if GuC submission is off to
>   	 * correctly move our tracking of the FW state to "disabled".
>   	 */
> -
>   	ret = xe_guc_init(&uc->guc);
>   	if (ret)
>   		goto err;
> @@ -45,7 +47,7 @@ int xe_uc_init(struct xe_uc *uc)
>   		goto err;
>   
>   	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> -		return 0;
> +		goto out;
>   
>   	ret = xe_wopcm_init(&uc->wopcm);
>   	if (ret)
> @@ -55,9 +57,14 @@ int xe_uc_init(struct xe_uc *uc)
>   	if (ret)
>   		goto err;
>   
> +out:
> +	xe_device_mem_access_put(xe);
> +
>   	return 0;
>   
>   err:
> +	xe_device_mem_access_put(xe);
> +
>   	return ret;
>   }
>   
