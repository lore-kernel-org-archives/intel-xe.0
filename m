Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA45C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 05:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2552F10E1AE;
	Fri, 26 May 2023 05:06:18 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EB110E1B3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685077577; x=1716613577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A1JmzpF7/jx4snWZ8kMjQKP4CKvoGhHCtwwAdexE0hk=;
 b=Oa+jrX6Op+O9fsNuo/6yH2YTAelEgoCb+JOFIdeEvYNrNhTO8atmQdFD
 S6LlPvtIEsBSVcWyP87fHVWEQNC7pWE1aNJKlN11FOYCy6+DzBaC7cwtc
 tV/OSDqEjljQzwutbjy2oWhg8pnknqk21zRcMSlap6uS130Qj0u3mX+j7
 9CG5woLhkvC2tYb4kJklSOzd3imoiVDtkKX0PIiF0JgimgT4RK87fBb7D
 VEId/zm8eD8IE+H3WfOu1zgtVDLuVxox1gBuj97PNdt4kLOtvmRUkLKW5
 3CFAR0+LeowCjZFovGVX9Hi1S8v1ths2Mj/ds/vEmb9FbQjJ8kmoi+eT1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382363611"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="382363611"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 22:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="1035207757"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="1035207757"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 25 May 2023 22:06:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 22:06:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 22:06:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 22:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZeF1yYCdeJUVkTbLQd5/GHeF3A/JQlUPVabPCPWdUigjIZFvaZtAvm/PvtceMosOpns8hgLs57EdB3LZWR+uBNXBEutUlQa+wIxdsT0Iddkck3ww8smWokZOxBQjB4iaxAQkk7snFPeYT2mK/klsWMxAdNOWGqanqxZXMeGZowcfYSLr1tagTzKKfTuTirA3I+qr4MxeB7Bi9VC+5SF905lEjgKO5hGNicxtDf10rI//ozcJhvk+8IdLD28KXjxztWbSifgJPsozKgNPO2ktldBepl+tKjGMc3DyrV1PNR9kH2FgdcbO8JhfjzMGEnRp8v9VUZEMNzYVk2X+2GPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqEpR4HNHDuou4oP4Dbp+p4Z4vJyL1WP2YHGxsDx7PA=;
 b=UU9LlQGjYUlES2i7iQBwF9i9DktvGm2VdipP8OTJnCxC476K/unr4/jGEXxu4APGdfo2T10bXULhezNlS4TYTkF5IP+OnLPyJurrG9p0/bi8D+lgsyhYXDMcXtIxIuK7eMvJ1B90IWMNOFMeqcBU6yScrYUKxnC/dSDvvwxg9fEft4o4J5ZKMk6X81ZYeWGnwc5dKUSl58bGc+0Sk5XUukyaZsvigMLzmVnCB/GwHaVhQk/s7AkV6Ojijg0bZVCZvwU2PbHXu0r/CmOuFkQCAY9eayYffHR2MeQxVNFwl1IICj0+M3xNEMXRPc6/dQBRbMfJgr4d/KWLL+qFPcP44Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Fri, 26 May
 2023 05:06:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 05:06:08 +0000
Date: Thu, 25 May 2023 22:06:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <lrapskpbgn35wj2vq2jew63zzstt5ppxngyzrywqfwjok7atfv@nfbkjma3pbtm>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-18-lucas.demarchi@intel.com>
 <20230525232510.GE10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230525232510.GE10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:a03:54::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: f42ac8e3-8b47-4dd0-7a3f-08db5da6ea66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFf/+HprGcUf9nixQIPrIcmJXw2igEfSrPAyxPz0yBeVXKBkaoKNb2ChBGgziwsd6b3KvMVuZ6MO+j9NkKAyrBVeS3eFQ+Ee4M3F2b4nYgRa5jjbcm7yuFqE8e/LvZGFPozsTn+Jba/w0Yuiy/FLCjVobYMgAqWwY2LPciI2FMzzCHPkNXKCJ21MfrUVWUQ6ED2ib20NYH8bPRrPbpuzIKvcBbGlxu4ldK4r+2AGQjmAec2C/IjRR/xgmOq8gWh3oGNe3xlVv/rDk/E6bvCJWvmx5CFw9uw8HU2UUwSFrwM3ftplq9f+0m5o6ZL6EoHXGTXX3XjPd3zpDMX37UmB2rhAwZVMl6joLp3d5yRwyLqkRNOdfrnbUYCKlM2geDFfTf7isx4y43VqYNXfjHacvbAT95kQ6Ideban02Aokx1NkgrMxR+ybvug8kToNFlftDB3WYVNm7tWsnYbIaqKKPOMnmXN8xnwnL0Y8wYHNGEFvXGAU6RLCEMgvnFB+4qCb1jQv3s47hGCkXL89xF5X/EANSKCj7XRe3I71oENVULchE7kRNsH5BcPs6nZtGW/B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(83380400001)(2906002)(186003)(38100700002)(86362001)(33716001)(82960400001)(316002)(6486002)(8936002)(41300700001)(6862004)(5660300002)(8676002)(478600001)(4326008)(6636002)(66556008)(66476007)(66946007)(26005)(6506007)(6512007)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mfGVLG+Gpu8mLEGpn/C+HTtNTiO3WJL7aMB99ZBbotsI2MraGKsYl9NdV4nu?=
 =?us-ascii?Q?pZN8cU9p+ZT062mQ3nejySWaVYW6cKQevTszZNz9FlyKZUVFpPRfvG/iTbuf?=
 =?us-ascii?Q?SBTTpvHjOPCVWppEuHtakDiN7fWnIC4ddDznKkl72wVTfk2aP7lILjH5zCfj?=
 =?us-ascii?Q?+k6ETG+bU71TxetD4/qtReNDO0/7pWFxDBuoVDhHhr2E3ytKpSkWyExYWLBc?=
 =?us-ascii?Q?pFpuAJN5GGzJFx5zcg/Y0ljbdCzM3cvxqHZojiZVN8QpH/KPWi5FS6Dl+1SR?=
 =?us-ascii?Q?BovvmHs74IfUxODZYKHTBKLG8RuKNuioH7YvK+qbElUH780fR1YsaW2JhTOJ?=
 =?us-ascii?Q?ew4SOla/3u6Kgnu0QUYTsizf+4WhMis7rFXJ0v24/oFmNRCl4rxJQ6yPCcKr?=
 =?us-ascii?Q?0nZDXGlWFCAhdfPwy3Gg5MQXUBujkKdjpuO5NDN09dJU6uAJ2kZq/4fgQeqk?=
 =?us-ascii?Q?VSAKdxx4ApWkipOumOloLMTeHTshFqzG2A4JikENV8UVZrQwAcn60jjNVqQx?=
 =?us-ascii?Q?i5qY2lPX+owMChPZi6Jkpi046caXszbkMBCl8GtYYZV3mnIb+KLholjyrYZF?=
 =?us-ascii?Q?28/9xXbqMVkpFArZUvOOVR2gyBksmjFCzKIayTavFXzjVEjH3Qy6eriDUgWe?=
 =?us-ascii?Q?EZsZWQVMi0jGK/ZwMKU5phyduMZwwGtAAFEUmBeNI0MZPgftzto8yRx04Cpo?=
 =?us-ascii?Q?tcn2kGt6tv/rwyAP8wUJ8cLRF2zkzb8sk+zeXVMEfmgcOP4e3N+Oc/C1Pcbm?=
 =?us-ascii?Q?ZcFSpAthKfjtECFuG4v5x0rGtq6QQh+QcjATxI8y0pfR7NT4Q77nhH3a22ii?=
 =?us-ascii?Q?oV2ei6ACWYi5yWlLlNMA+bPKCwzeL03VM6L9oEb6suwtA3EumwWmsMPLiAM2?=
 =?us-ascii?Q?SeiTrtsVbba4gkY5rOy/s8/hDiQ34U2ktiDxRMA8oegCwb2yoYzR8DvsaFSq?=
 =?us-ascii?Q?zpXcHVg3xnkgTqyPkK1TWONRGNnppdM/nUL0stDHyJl99aBVJI831jsggEZv?=
 =?us-ascii?Q?UtMdNj7ebqmPvx4KpLRhB3tSW+oSN9COxOe36lmd/cyr9W5fL+u1AazjQZ6d?=
 =?us-ascii?Q?CtnRp9AXzLPMdRgIMwNZoyjLj8Vr7s6I71Cc+S/FhnBqlMslZk5Od3WAhGRu?=
 =?us-ascii?Q?q/HkOK7/bupltwN0b9E1Y9ILj7BWrop16qsPmcvwZPg/hUTYtJs/KOgczQ8l?=
 =?us-ascii?Q?JoClyg1kmDNcms5N3icHfmifDqbT2mUF0Wm7Nvq0HYbLCLIJdoq+ZNbIn1Og?=
 =?us-ascii?Q?0VCG92AlAYXi8AGeznNZN2cfSQqwmbbOfcgaWE6TJ8kxDcaxeynvGoxLLOgF?=
 =?us-ascii?Q?h1FqxwDxben8y9aEV0sa/lA+/0X1FrPOpwl4yxLLziKQ8Rn6KPZBbT12Lgmo?=
 =?us-ascii?Q?bikSAlHmh25Wh8Th3uUKGFqevrzjzilYmw3QA8YBliwJhPl6aaNRR8LQtlyu?=
 =?us-ascii?Q?Yg4z0wZgZ0e6q4zv0tocad4HIb/wwsXhDbNWE3jekCL9ywHMQyr0ehraQwbR?=
 =?us-ascii?Q?sKSvNvh1hI54AlPehWPdzBLdclmvFq5hlqSi2pXFMQVSULzmRln1utodNC+0?=
 =?us-ascii?Q?OJarYNYJhYSQ2bMwaK7Dom6JiL2QYUipgvCx3YR1z12N4w9NultT5fvR5ub8?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f42ac8e3-8b47-4dd0-7a3f-08db5da6ea66
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 05:06:08.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkIa11vfRSfJuvitqrAK9pMpnaMcJEJ6MZA34hGz6We1z7ZoyD/ZISno1GHIsfHFsrSIfJkLlcHJ2uty/0omvWX98+6fSvM3RS8XOzMwGY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 17/21] drm/xe/guc: Port
 Wa_22012727170/Wa_22012727685 to xe_wa
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 04:25:10PM -0700, Matt Roper wrote:
>On Thu, May 25, 2023 at 02:34:03PM -0700, Lucas De Marchi wrote:
>> Wa_22012727170 and Wa_22012727685 apply to DG2 using the same action and
>> conditions. Add both to the oob rules so they are both reported as
>> active.
>>
>> Do not Wa_22012727170 to PVC and MTL since only early A* steppings are
>> affected.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c        | 8 +-------
>>  drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
>>  2 files changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 5eccc4b67381..1291f71348db 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -161,13 +161,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>  	if (XE_WA(gt, 16011777198))
>>  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>>
>> -	/*
>> -	 * Wa_22012727170
>> -	 * Wa_22012727685
>> -	 */
>> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
>> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
>> -				STEP_FOREVER))
>> +	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
>>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>>
>>  	/* Wa_16015675438, Wa_18020744125 */
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 3d4304b7111e..fecf9dd431c5 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -4,3 +4,7 @@
>>  14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
>>  16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>>  		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
>> +22012727170	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>> +		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
>> +22012727685	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>
>I don't think the G10 condition applies to 22012727685 if I'm reading
>the database right.

yeah, you are right.

Lucas De Marchi

>
>
>Matt
>
>> +		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
