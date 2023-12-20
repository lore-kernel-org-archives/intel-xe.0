Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE339C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 16:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9213C10E601;
	Wed, 20 Dec 2023 16:39:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E9E10E601
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703090374; x=1734626374;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0ZSFMOePBoGyUazS/5CBXDoI+fWnhw3PFFVc22xF/1k=;
 b=Vt+zKir4k+SFA5MxUxAKu2IkZ4MsiCAo7nASRxzK3/D8n/fyf3ObW/mN
 T/1hOmaIzvrXCb6bH1I1Kb6PGLKjwdphEmGT692MAuLfj7tfe9PmE37/U
 owZHAvr7bt8o5ugxB6whEWC3TCgQ0iqBUVYdGTfXGjlAzFVDr0rga53IP
 YqJfWhuYeGiEjhRwbEKlnTlvG4zPiwj3VGSOM6Q2nL/EjabtzUpIn/YAC
 rNMkp8bQDY7f1KoW1L32e1O/je/H6VeQIeCxxidBSx0WFBHN0x6z2Vku7
 TiOaRFwq5WX9Yyy2LlaTOXVrxT2T3npyPFPud9R6Xf+6pC3+y528R2b2k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2695540"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="2695540"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:39:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="18010610"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 08:39:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 08:39:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 08:39:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 08:39:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0eOZV0QbtcPhB7yiLOSHx3vV47MnoAU34mrn0rgs+RqUOOjqemlzEHX4LfxlmqAqqVCnmQO+7a8CFj92p3Af+c/a6pn5/izoO4mUhQ8RcRXxaQ3U2dc+hxscIq93DiT6xUWjlv4F7O+a53HIJ+wq9tkay0jSoyTz1vrvqlMTSewOyiHtn8Wfnrf5qEn8FqiYtWK9NmwEuMS1Z1lMBa2IK4NxMzqEPGfe+4mzhdM3Grmih7kILEctyrxG56EsZgAshtYdPqPdcpuk8w1xaiQwpdFkjLh9WO7EhP6b205xSkvpsAZURSrSxA8BHKdjppvVTh5VH73JogUXNQzUiMgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2QG7ioKxn2oA3BpeKkZvl7trcrkVaMUcz1xpGy48AE=;
 b=OflLRqk2lGP8IzE5NTbYNKiynH/WIPJdSb5WoNP4b1zM68NpVso+pUrzuBzFled4Oh2NjNOf3YdLMrZvW6VtlhvMFPoRejDeCdN4lA/4xNLD4i2dGdzLD0uc8YAnxnli44Z9ztHC2rpyksb3vWoM0cgsjKqrq2yyBXptBExyOc7Mcw8dkX/dDAy1WPdnAVo4PU78/G9uGtNLJJmMhqg1EEvb97xIxzM+JJIY1958Ec0jGApElmT1PCjiXuHvFJ7YWAa2qqAcxH6OWuPitOiBZe8yGYkwY9yzGnhbXjKLCq2bh3jbLsuRqLB5wuHuHbVT5Gy72oLU3VWU2G0I0c0tqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5103.namprd11.prod.outlook.com (2603:10b6:a03:2d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.19; Wed, 20 Dec
 2023 16:39:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 16:39:30 +0000
Date: Wed, 20 Dec 2023 17:39:27 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Remove uninitialized variable from warning
Message-ID: <xuvphm7qqvebglmu37w324yfhwsbvo2v5aj6xfctgdblume7tl@ox4lzqorbok2>
References: <20231220161923.3740489-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231220161923.3740489-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: dc070e69-8a3e-4840-594a-08dc017a3d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u7ohGHfu7+tLWDUIo0rXQRfk+fOEHrcUbJKhMwpDvIk/wgebEz8Q+MuHS1BwdWsaHNPshz+qeStHcD/bGKnAQjeIZkNNAow72ZiHZ2j5aancLimhMeXLvqhtDilRWyuwO3rUn6goW4fJYqH3sQ+wggDBs4KZ6Kxz4ptd3Wg7LehOb6c6R97iho23v+V6EzswrTeoeSTL/KnP7TuL+FWonWtiMAgpFwfL1vAG7+14olv4fk1Z73jHmdQ/PzE03nPcqgFYaAfoVQ9WZs5crD9ZrDv4VZI7myZWxNSz8INYeKkBQNMcJsBiu8nV1xnHLMbvz/zEQ5+F0k/gFxSgRJ1xR8uGx8tiEkBpBxN8Pjj/BsPelTu9L4/Gqbzt3HUSGFOAq4NG5S/mipwKCaIYbo8C4DdpQar31boQ615jXFBCCLLqtKNqbLEKmV+cJTG71BfaleSTR/mGbQmChObe30aYQPDPZpJENpbLYE/QmJc0PiyJWjN+hJNKpfvi7LbWZ9TqSOs4CNxJVBbqr0mG72TyXSzE2KlknxBMUOcE9Q03ELRFfe+4iGlnmRUf5Dze1wrQnsTcNbmEPin41llWDIEkvkosKsDZarvTSOfeddJ4gEfliihfEYEyZ9n8bsx5zJii
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(396003)(346002)(376002)(39860400002)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(66946007)(66476007)(66556008)(316002)(38100700002)(6636002)(83380400001)(5660300002)(82960400001)(6862004)(33716001)(41300700001)(8676002)(2906002)(4326008)(86362001)(8936002)(6666004)(107886003)(9686003)(478600001)(6486002)(6512007)(6506007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWtmOWhhUzhrZExBMVlBb2wxcGJCQ0hKTXJtaWdQVUtlN3lNd2lkSlltTitR?=
 =?utf-8?B?NGJVTk9WL0RkQUFCVE04SnNVTUN0SmovbmpQVC9JK2F2OU1BUWZ4Y2hUVEFp?=
 =?utf-8?B?aEMwd2xNc0hITEVNN01SM0JMeUZPUUdOakZHTHh0UVlHbW16SzlsMnBZdDJW?=
 =?utf-8?B?RmVMeEU2R3Z3U2JvU0RiaHBkZWRLSGljTkJxSVJpSHgyZ2p5UXU2SjJzQ2RD?=
 =?utf-8?B?Ui96eUdxNGxLaGYvUHMwbGd5YVhaVmE3RUtPdDFlMWhjVGN6UVFlQ2d6OWRh?=
 =?utf-8?B?ZE1VdkhPZlRKWGNIdXBJZ21EYjE2SkRLOTdWQmh4MFpyQzFvUkFZb2dqUzZy?=
 =?utf-8?B?emhQZFZUK2ZtZzFKZjBWV2tKdm5zZkVYcFNRMkRDS3AxN2tzY0luWUtvY1BC?=
 =?utf-8?B?VVdlQXZLa2p1WkRKSWhNa1c5a3ZodWFlZTR3MWpSazVvcEpuRXBaeGJsb01z?=
 =?utf-8?B?cmNNUHozKzlCUS9PSFhMYnZGWkpnZENOTHlJQUxQWjJwYzMyRHJHMDBRcTFR?=
 =?utf-8?B?TGFPWHFBbnRFUDlwRDhSVk8zTWpnV3JDaWh0Z3ZicG9aUU9pTkgySGpPUWgw?=
 =?utf-8?B?NThsWDhxaFA3UjVnV2ozblg2K0hNVmlFWGZYakhTMEttWm54YlErY214OWFi?=
 =?utf-8?B?cCtGY2orb0tWZ2VMMDV3cjE3RGtab3NMSUNLNi9Hbmd2UVNXNFJ1RXZ1aEVM?=
 =?utf-8?B?RlhyN01Qc3FaQm1QcGo5UmR6VXJhS1BJZyt2OGR3am1YaXg2Ymo5NXZ3cTk2?=
 =?utf-8?B?dkd6TU9kL0pqS0l6dEl1UGdlZW1yUlNSOUtPSW1hVVMvVjBFKzlpeGxpWEtn?=
 =?utf-8?B?eFFoZjAraE1jaHBBN2xENUxYUTBVSUVEYXNWTXE3NXVmZThPL0ZBQmxFb1BZ?=
 =?utf-8?B?dEg2dUwvNkN5aWJ4SUNqUnZDVFZTZjdUSXdJZ3dVamY4bVZPUWh4c0pVQlN0?=
 =?utf-8?B?d3JtaDhvMzZOZFVLUVhydlZTSnVJMWkvM0k0NWoyYjVrbnNScUxwZWNiTk9K?=
 =?utf-8?B?N0VkdlQzOGxRS2wza09ZNkZJSTJtYVZyMWRtUmVDUnhod2VIQ2twbkQzWi85?=
 =?utf-8?B?ZUtMUlltOHpkWFp2VWtHampDTTRNbXlXcit3UGZZNlBWVHFpMzREajc2V0JM?=
 =?utf-8?B?Szc4NUF6K3o1anVmVmRBUCtoemVBRkZhL0ZRYUtTM3RwUVRHUXB0dTlxalBU?=
 =?utf-8?B?MlBMbFl2WFkySGpobFMrTUtIQTVuZ252d0tLdm8xbVVqWXVVZTNYdkZOczln?=
 =?utf-8?B?UGxwSFFGV3BiOTVGK0NIOUE4aStpWUhuang4U0czS3BJQ0VWRlZjQzEyRTln?=
 =?utf-8?B?SWlsWUUzM3dMcjN6em5uWjkvQUl2M3FYYndhMlhFM1FtOHFRWGE3SVJnY0xK?=
 =?utf-8?B?RGhlZHphUnlKM3FXYldFalhZNXlOOURNN1Z6cm9VMDBPbE1uUkVIaHJlQS96?=
 =?utf-8?B?djl0VTZiVUI4aWtiWTRZYjk3UVRvRGU5M1RScUgvVXRnTlZaMHJmcFZuWkQ0?=
 =?utf-8?B?azdXbktFR2M3cEZ5NnViM0NXdGExL2xNTUJyU1ovYngya0g2UE00MVpkMGlC?=
 =?utf-8?B?SzNNVXFqVUdKWUdxanc1STNyeVNQZmRiSEZTMjB6Y2llOUVUbzM4dEhEOW5t?=
 =?utf-8?B?KzdhWkNxampSYkhZOEY0UFZOeS83dkhtQ1VmM21QbkphUnAyWlZYM0pWQ25C?=
 =?utf-8?B?dTNtS1d4NXVITTMxa1Mzc09VYjJhaGhxbGRaSHRSOVFTUEFqNm8wamhCZlFX?=
 =?utf-8?B?MWFUZ1ZKY1JFZlhUT3A5YlVzT2oyc2F5UGFoTmJETDMzV0tKTHo1OFJCZHlk?=
 =?utf-8?B?dmlqTlNqUnRFM0E1dkh5TC9GTlpMK0JmdlNmZDdPSTNOcThvZkxweko0WW9x?=
 =?utf-8?B?RkszYnlTZCtNR3RoL1cwV2dLQzkvOTR3TkFGOTluR0hLMDlRcTlrZHljaStz?=
 =?utf-8?B?M0hyQ1A1T3pzYzVuR2k0QXAyaUxHRDJ6cXIzNTRuT3U1RkVDZWJheWl6dHFN?=
 =?utf-8?B?cmo4cjRCaVM1YVdlVGVUeDNiK25vZXVXY2pyQlcrUmk0YUJ2bytsMU9tQWR0?=
 =?utf-8?B?Nyt3SkJXUGJ6UzYvbVQrZk9JMjBVMVAyMmdzUlBhQ0Z0UUNoTStpYkVvS05N?=
 =?utf-8?B?cERDWGREUW40K0pyZGV4VS9hTERjVlJ3YmR1Y3V5TlFwUldtS3JhR2h4ZGV2?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc070e69-8a3e-4840-594a-08dc017a3d51
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:39:30.7649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEIbrbT3YygfzqdQ0l99HlrNGpuLvmVw/rOHf6FGusBiu/A86osnmAxiYNG5ZogZQzAvROBreY5X/eIpMBKjlz2qnjmWvXsE/xcStw31p5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5103
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023 at 08:19:23AM -0800, Lucas De Marchi wrote:
> "err" is not initialized when failing to create and add the freq0 sysfs
> file. Remove it from the message. This fixes the following warning with
> clang:
> 
> 	../drivers/gpu/drm/xe/xe_gt_freq.c:202:30: error: variable 'err' is uninitialized when used here [-Werror,-Wuninitialized]
> 				 kobject_name(gt->sysfs), err);
> 							  ^~~
> 
> Fixes: fc5b7e3efff3 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_gt_freq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 08eabcafe7bc..3adfa6686e7c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -198,8 +198,8 @@ void xe_gt_freq_init(struct xe_gt *gt)
>  
>  	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
>  	if (!gt->freq) {
> -		drm_warn(&xe->drm, "failed to add freq0 directory to %s, err: %d\n",
> -			 kobject_name(gt->sysfs), err);
> +		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
> +			 kobject_name(gt->sysfs));
>  		return;
>  	}
>  
> -- 
> 2.40.1
> 
