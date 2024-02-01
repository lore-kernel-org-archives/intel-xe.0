Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FADC48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 20:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D8110E0FF;
	Thu,  1 Feb 2024 20:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTNCZZ/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E0E10E0B7
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706819151; x=1738355151;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6KLSn9QQD9DA1lGatSTFozJSsOxN03AC4foIG7RoIus=;
 b=mTNCZZ/iqjmAdG3alEuoWHK+qRtM3Zv/Ze0tGgxZH3g/2MPKZRMKtQO3
 FAvQNP19p0HvHyqnmDIXUbHPOlsB/q1ZW54uX4YmkDCxAlhacAYDEG5nF
 7/jNF4zn8VBN0dqmzrdWXv17lLBF4HNN4YYVmCIszeMc4evNvlLSY5O6A
 MU8wCm6hDWzUXce2pgwzHdJE24hDzDRZclCDIYvVFcn+PjjGDUvh8iVEn
 umZETlz0PNxpNo8BsgjV409x+dCXHoaZrovoW1/mJk9vommdjVQNYBjJq
 LIGBuN+UJS8Qcp+1UbM3uuDUu5QlwDV7fOKyG3ZCrfhQL7jpQwJuEc9z3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="25458160"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="25458160"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4494751"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 12:25:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 12:25:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 12:25:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 12:25:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 12:25:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpbsVrRhKpRMStueIcZ4+y8Fys0qd51PxLFK3jC4Hk5H3YtFuhdmrWy/d6IpDbQESp1lLfrxBdeo7MTwJ65j5LpFp9iJbfdQvmdZI4xAwdXvjoVLrbvYJqblpjPD7ld4qIrUKCbkKA0kWnmI1tW0WOC51QbuUM5y+/vtD8MWSVs47vTVBDsQ4JX1zCIPP0qaf/9/I+2dgT11yvO3iR5RTHeQaxOpQThYHozatC5ta6HaISDpTlISrKD4t7DMJD5GpVJI4R+jKmqDx3NQA0WM+hUQ7+wa2qIquuerYJfdeiPlp5M3bCetc5LJE7Qr/rc6tGMfpDe6oTVFTsc2Lmz56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpCkLWezrYv0/y1YoNJWctopWPvId4juzV8ECFHNPeQ=;
 b=D54Th/TtbYSseqQ7UAqPLA8+YCJA3Ni3HEgcUKhT1R3Ww30A/pmrttwX3mZtL38YFgDUKN0Shzzy/1HTuJhyouRp6pigBqiP8NxFQRIr61UR/V6RujMTM1GdijRUrxaXCm3ALB1skqq3QQwd+VeuYGpvw2+bBCZO7Prvv7HdgVxn4jKEVPxjc2vtcPXcBzbgbiChn6DOMjNqhHbRRCjouiiDHSyVlx94s1zsSHg469g0LIC21VB4oK6owSyShV0RqBqJVCaq88KrDaR7WUHwNBgS5wuVlRHBZJ6MogrgwS71D8xVPVnh1A44U0abTYGc5ht8JANFBGCXB8L3vkuJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 20:25:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511%4]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 20:25:41 +0000
Date: Thu, 1 Feb 2024 21:25:38 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Brian Welty
 <brian.welty@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: Re: [PATCH 1/4] drm/xe/guc: Allocate GuC data structures in
 system memory for initial load
Message-ID: <vbsgkhdcgtpndbhbqpxv6wurmeuxzvgvrnjdhoarlztajbydke@bw5uym2eomjo>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
 <20240129130308.3544466-2-michal.winiarski@intel.com>
 <ZbvWlEXjQz+7/iWQ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbvWlEXjQz+7/iWQ@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: VI1PR07CA0158.eurprd07.prod.outlook.com
 (2603:10a6:802:16::45) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 493a9850-657e-450c-bf2e-08dc2363f5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCICUko/Ln0IYPV/Yjv+SemyDJ+g1Kze1wkQS5JMkvtCa47l/dJ/CmZ3PrDC1fpcXgNtVhSK3JmXRqZUv28/dufCcM+0TLYgVc87pj6WPCV3LgidxLW4lF9h0guKsuAHpqrBNUH8ZvFJJfw2JeQA3CLq/Fvob+OyoHi728iA5UaVLDm0T7y7mOxqWm0MD3Qm3iRnOArgLv/BSlLrdE2o/eoTuh0B64AkK5fCpMckU4c1C+D63TB1nA/+tuIj7BBMJckG+zwGREkdZX4kOcrjS56JLHRjvjE73UWt2qJiejjhRXeq8kE4kD2RN8DmRskie8LzAnQYLSI/MiwaC1crR77gYEdQYRse6zF/sKevp38xX225t3XQ7Jqq+mgS32IKsSFHdHJ6SsdvvKOgL/7M4n6RQUSEsWLVgb++4VdcMYR3ySuaiw2PDYkFY2wCS8Yl1Uqd+I5Wp8PO9AjCz+Q5VOSaM7Bf8xZTj4jR86IgXLawzVD8xe68vacgMvm8HbLUfkG40TaHBojoOOU88sDk6EyOPNaZ+8m1JuYkzOrzVuW2KgvpEzHCAPMhFDFBipHIeq/ye2pTwURPALKh6TzDBBFT/j3arYvsZxTLC5CSOyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(66946007)(66476007)(316002)(82960400001)(6636002)(66556008)(2906002)(54906003)(6512007)(6862004)(9686003)(4326008)(8676002)(8936002)(86362001)(5660300002)(38100700002)(26005)(83380400001)(6666004)(33716001)(478600001)(41300700001)(6486002)(6506007)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVozaXhYUHRWYzlvb3pwTjRrRlIvKzNwWkoybnRsMFIyZHhPS2Q5cEYzVzho?=
 =?utf-8?B?TjBNYmY2YlNWQ3hrNVpyak5tYjY1elZtKytHR29qOGl3clBZNFpqVHU5bEEx?=
 =?utf-8?B?d2g0NUZwR0lsMjNkUDlTRXFPbHZQdGNYaG85OUVSMnUzYnN3aDRKcGZpVEJH?=
 =?utf-8?B?bXlrTVZManp2QVhwMVdKNnpqR253elBnUGdrKzM2WmhJWkVUM1JzV2xhN01Q?=
 =?utf-8?B?L0hMT1laVGVqQWRlL1hZcXVrUmx5U2o4YUpGYlBxQkQ4cWZueWdUbktjU2dH?=
 =?utf-8?B?M3NnT29mcnAyVVVjQmtXeGM2MTY1YTZoWnQ3M0g2YTJ5cENtRDhxRmFVZXpo?=
 =?utf-8?B?WHQ0M1BYMU1pc210SGVFMlBHZ1dDYnFoWVdSV2hWUHc0NCthMzVZWG51cFRK?=
 =?utf-8?B?SzAwRzYxeUg4Q2ZiUUV4d0VHbnNLUE1sMXFWNUJSNiszZnJIT1UrR214bDNJ?=
 =?utf-8?B?azY2dUxyL21XUHQvTjI5K2o2MkY2ODZqbW5SN0hxcWMvYklZNUNCR3U3QmFK?=
 =?utf-8?B?YXNadS9BZVJVT3lNSzRUSzBqYlZVMEJhMDhrV2VWWjNqYXdlUkdJeXBTdDJp?=
 =?utf-8?B?eHBCSm96T3B1bEpzRllkV3IxQlJUVmFxLzBBOHB1VUJwME13dmxBR0Z6cWRO?=
 =?utf-8?B?cy84S01INi8rUFgrTitBM2dkc1VHaXBFR2gvUjdFK0duOW9EN1BuR29zZnlS?=
 =?utf-8?B?bkpWQmVQeHJCOEJoOVp5NnlubjREK1E3SENWMHF0L3k0MEM5U3dmRjVhckQ5?=
 =?utf-8?B?VU05Qy9teGU2d2s0OFB0azNvTERRKy9PMDk4cHF2VmFTQ2F6TUtIRVdvaCtC?=
 =?utf-8?B?YmdaMkQyQmNib2hxeExaMzg5a2JuandaMW5KdXlQbWFNSTJOYTdMZkdqWjZy?=
 =?utf-8?B?TTMrM201OGJVZjNCSXV5c0k4Q1hnQVl1aUJ6emd2YnhGZVlVMTN1eTI1bHBv?=
 =?utf-8?B?Z2IrdzREVGxvb3Q2VCt1Q3Jaa1N1bG9qTzVIRCt5dXRneU10S1BTa3h4YW9O?=
 =?utf-8?B?Y1dMeWdPVTBPTUdnTk1sTXo3b2FOTmh5TGQ5UHFTNFl3VUR6eFAzdmptbWVt?=
 =?utf-8?B?d004K05MT0VDNGR6L3preEovSm15dzZSanZUcEI2ZEdQekVubGR6ajB6T2sy?=
 =?utf-8?B?b2hQZnlhZnNhdGZpYTdsaVZhZmduZ2FCWVYvdElRSStqaGtXNHUvUUNoTTgw?=
 =?utf-8?B?aGl4N1FEd1YxaExYN21HWWVsd0FoclNWR05uU1YwTDVXcTFZYTR0ZXo5eURz?=
 =?utf-8?B?RG5lMXZUdXpYZGVuQmhTbk5xQUlidExBL1VxcXRsdEVsMnpXVzhsTEVKV3U0?=
 =?utf-8?B?Y21aUFNMRC8rWnhmY01vMHZNcGNFNHdtc1Jxak9DbnBOU2FRck94dGJkU0Uw?=
 =?utf-8?B?S2dweUtaUkorVkFNa0FPNGFnU280Y3ZLeVNZODlmeTYzbjk0V1pmeXVPYTlB?=
 =?utf-8?B?YlFnSlF0YkpvckRROTcybm1sMk9HcmRPUDYzOHQ1T2NwNC9BSldwVDVuOHBV?=
 =?utf-8?B?OGsrak5HL2hJYk5JUVY0dUtzdWcyUWlhNmJnMExnVGF1OVlQT0ZlWnUrVUpi?=
 =?utf-8?B?K2Q1dnBDV2JYWEpxeFFLcC9TLyt4WjFDbjNlOFVLZW1ROG5JQWh4bGZQZ00r?=
 =?utf-8?B?eFlINXc5V0xMUDRxTkRCclQ5NENmSW8wR25aZ2ZOVHZCUWtKZnkvellMZm02?=
 =?utf-8?B?eU51cXUxeGliM0kvV1o3dVpzL0dHaGxVQmNLRkpvRGNmbGhyTUNVaCsvQ0Jv?=
 =?utf-8?B?RFBJRzJHT1pLM3UwdHpIZTRZYk5La2JLdFU5RXBMVUFrRHE5cU9ZTzl0a01j?=
 =?utf-8?B?T2VBcEdmbDNKWjIwdGhnUjA5bGJ2ejFmRnBuWkpDUGh5WEpLdUx6QU04RUJs?=
 =?utf-8?B?T0xKSGFzblRRLzZrd3ZpNHZvUUgzc2hhMXJGelM3ZXc1aHRGVnhLTys5dHZR?=
 =?utf-8?B?UStuaEYzK3FsL0hveGJQWU1sNmlqN0kwVjdhaDZCUnRKMm5BNHFzZzV4Ylpk?=
 =?utf-8?B?WjdGSGIzcUZvbDV3b3ZnTVRjWE95MzlNaTNDYjhIVTQ0aThGaE5mNTJTUFh1?=
 =?utf-8?B?dVdaK3hMYUUyaWYyK3ZsaksxTVIwMk1uT1owMGZnYS9mZnZ6elFBakRoUUYy?=
 =?utf-8?B?djBSL1VRUDhlTDc5UTNUOXd0dUVtNlljYk9RZDJzTjd3cUJwL2lhblJuazdz?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 493a9850-657e-450c-bf2e-08dc2363f5e2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 20:25:41.6830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxjXb/6jiCo0C5ZGWFkWtf5rhTmRBhpBTkpUnQAhqWAG3LZoMDykHFjPyahcwDT3xtRC/+5Hb6XTVEKQdy8ZDVFBwo+VbxJnrs4dXMAPEDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
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

On Thu, Feb 01, 2024 at 05:36:20PM +0000, Matthew Brost wrote:
> On Mon, Jan 29, 2024 at 02:03:05PM +0100, Michał Winiarski wrote:
> > GuC load will need to happen at an earlier point in probe, where local
> > memory is not yet available. Use system memory for GuC data structures
> > used for initial "hwconfig" load, and realloc at a later,
> > "post-hwconfig" load if needed, when local memory is available.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c           | 32 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_bo.h           |  1 +
> >  drivers/gpu/drm/xe/xe_guc.c          | 34 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
> >  7 files changed, 71 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index d6a193060cc0b..7df87fbad0938 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1605,6 +1605,38 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
> >  	return bo;
> >  }
> >  
> > +/**
> > + * xe_managed_bo_reinit_in_vram
> > + * @xe: xe device
> > + * @tile: Tile where the new buffer will be created
> > + * @src: Managed buffer object allocated in system memory
> > + *
> > + * Replace a managed src buffer object allocated in system memory with a new
> > + * one allocated in vram, copying the data between them.
> > + * Buffer object in VRAM is not going to have the same GGTT address, the caller
> > + * is responsible for making sure that any old references to it are updated.
> > + *
> > + * Returns 0 for success, negative error code otherwise.
> > + */
> > +int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
> > +{
> > +	struct xe_bo *bo;
> > +
> > +	xe_assert(xe, IS_DGFX(xe));
> > +	xe_assert(xe, !(*src)->vmap.is_iomem);
> > +
> > +	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
> > +					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					    XE_BO_CREATE_GGTT_BIT);
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > +
> > +	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
> 
> Should we not destroy / release the *src BO here?
> 
> Matt

That's what the __xe_bo_unpin_map_no_vm is doing. When the BO is
allocated using xe_managed_bo_create_from_data, __xe_bo_unpin_map_no_vm
action is added as DRM managed resource to automatically destroy the BO.
With drmm_release_action, we're calling it immediately (and remove the
action from the managed resources list - so that it won't be called when
the underlying DRM device gets released).

Thanks,
-Michał

> 
> > +	*src = bo;
> > +
> > +	return 0;
> > +}
> > +
> >  /*
> >   * XXX: This is in the VM bind data path, likely should calculate this once and
> >   * store, with a recalculation if the BO is moved.
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index db4b2db6b0730..ff919a836d163 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -129,6 +129,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
> >  					   size_t size, u32 flags);
> >  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> >  					     const void *data, size_t size, u32 flags);
> > +int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
> >  
> >  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> >  			      u32 bo_flags);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index fcb8a9efac704..9b9a1252f3090 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -272,6 +272,34 @@ void xe_guc_comm_init_early(struct xe_guc *guc)
> >  		guc->notify_reg = GUC_HOST_INTERRUPT;
> >  }
> >  
> > +static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	int ret;
> > +
> > +	if (!IS_DGFX(guc_to_xe(guc)))
> > +		return 0;
> > +
> > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->fw.bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->log.bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> >  int xe_guc_init(struct xe_guc *guc)
> >  {
> >  	struct xe_device *xe = guc_to_xe(guc);
> > @@ -331,6 +359,12 @@ int xe_guc_init(struct xe_guc *guc)
> >   */
> >  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> >  {
> > +	int ret;
> > +
> > +	ret = xe_guc_realloc_post_hwconfig(guc);
> > +	if (ret)
> > +		return ret;
> > +
> >  	guc_init_params_post_hwconfig(guc);
> >  
> >  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 390e6f1bf4e1c..6ad4c1a90a787 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -273,7 +273,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> >  	ads->regset_size = calculate_regset_size(gt);
> >  
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_SYSTEM_BIT |
> >  					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index f3d356383cedf..355edd4d758af 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -155,7 +155,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	primelockdep(ct);
> >  
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_SYSTEM_BIT |
> >  					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > index 2a13a00917f8c..ea49f3885c108 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > @@ -78,7 +78,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
> >  		return -EINVAL;
> >  
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
> > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_SYSTEM_BIT |
> >  					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index bcd2f4d34081d..45135c3520e54 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> >  	struct xe_bo *bo;
> >  
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_SYSTEM_BIT |
> >  					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> > -- 
> > 2.43.0
> > 
