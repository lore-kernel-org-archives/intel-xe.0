Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EACCC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D1610E1DB;
	Fri, 26 May 2023 17:23:12 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506E810E1DB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685121791; x=1716657791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qfm0iT+DtHWcFRDz1duecyA/mH24YpzI9Bg6ExviSRI=;
 b=Y8MKwXIWoykVA9aRq9CbX5xjR1z1SKRN299tpEC2j7r71DxzqnzySqqk
 vqLXEt4odC6OJYd4kMAyZUDW4vydIW1yQEl/X1MYlS8Hvu64l101Hsf7l
 Ci9pJ+eu3YtpKAfUIRy77W/PunHDWhT9L1LNW1li3YdS9elnUUmK4nOMz
 FJOemOMjBuX2N2OUY8XRvH1veQDlG8f2Pi/QlJJx7ce0BXSIIIdDPilsc
 RqqR97aUixDZH/cAoz4SrurOpgF4K0pM5BjX9pdn04uXyCI1Py+EQE4Hf
 W22i/fLSgGlnvYPMleMUly6sDjgRQinftUSe39ZrY8Ayj7WCJnHPlJTMQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382504343"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="382504343"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699481552"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="699481552"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 26 May 2023 10:23:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 10:23:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 10:23:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 10:23:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 10:23:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laStnvTJO3qsFUbVDkpkcip0JQsFL2hUv5t3himLzeciTRi81AgYRj13dOL0uM93KwPUCrEdUpJtN65av09tDqJsSvWucPeSr02NtvXrTBkErwsItscnNlFgoume5nTNWDoBH+NvNR28ea+EBjnsAGlaaUUQtiZdw51x+Qw4wU93dzoj+SwIYu+g7R961RPPpaLE0tY1bbxWR4r2FI479EhWVtXBqQkoEa18Y4MQ9uu7E+fqCVa6DNr/DumHkK+3ltq7wWofexNRZ+Eh3evzZFY5C/REe21Hc66HneqodAD5DPPlVl7f4b7+7LhgInVcr96ogrZvn7Plvmmyu+3c2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gbl0I7+IWj/8A1adEH2Zz61+T9+D13DRtCUn9FZS8U=;
 b=bTEgt4f9aTwJWQ6GygA/qYi0uY7QVKVjaIwP5+3cDHYsUEg3PRHakrW9IsIQeh17GpXcBrV9Fn3N8wlotObq/C9FVOFGX3MPUrM31lbMFP2zPiPJsrmDO04ozKfAkczscAYsa7Ndhdta94amwJZvzxd+HjldkD9dStdReDQC6zr5Bln7rmPpD35LCLM5q+YiTRkaedHigZcYjZt11l9RhvzoHBz9KooD+snW7pPjd1d0IhbXNsdkWT66N94t9b/RtEaN9IHXDTXKh7VNsohDC+zktFFQCNB3HaMaRZCFcG5k4P85EqbRRDNnH+qPvsScn/A/ZSKwxoB2tttTrElgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 17:23:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 17:23:03 +0000
Date: Fri, 26 May 2023 10:23:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <csd75eobjwsjuc2yq22d3hfnj5hndqrldbm6qcgs55kstvfxmk@fqonjesdfzwz>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
 <20230526164358.86393-18-lucas.demarchi@intel.com>
 <20230526165452.GC1217712@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230526165452.GC1217712@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: d5275233-8954-4e76-defc-08db5e0ddc7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7Ulk2+uCGRMzrsoSgY0wIOj97xMRRBplmdLyT0qDQEftsAOWzRNZRGgicJfDerwDfOAoB/sbWrt5fyKPHgL8nC+AGmeR0UFvPcUCV3LGv1x+eKTY5KZ/5iplpMOviDBehLKoarKqX6zJhOvRKecZcw3wEiwbVY8pdwaKMYUZqr7eqL2UWAxumS1owKJK6o887VypDD7WYdZnqKZVgd5vdSJckpqv62hunT1fYVxOa34SixvKK1klGl9G9gmh9YHVoVTRXMAXi4eiypxzhgely6EYiFtp9IS8wrjjq2i1wKIToGYwVQIl7tXU+zYiawB64GwaxvWCto7py5kwXMb4Bl8acciusIxJBM66r4wzKUmFwXWAMTYXjQjbrNwrnl87yST9T34Il3IH9Sqk/YF1qbGffFVlVQXMT/XYNDEkiFNkaOkMtlwP8f2z2CFewSaSF3tYbo4wLNtUfSmoSZyOG/CgJcawGloockL+dyd1wb97L7UR5ywrLgQnT92xLwz9K/I7YmR7CX1pBq7V2UagsjJ5Bm7wTvT//HR3iPbTmwU1FIPpSmkcocvwNkZbx58jTq2ch/xpRAR7FtP9U3kVEJJyQvinRmB85yooXM254U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199021)(8936002)(8676002)(316002)(5660300002)(41300700001)(66476007)(66556008)(6862004)(66946007)(6636002)(4326008)(2906002)(478600001)(83380400001)(82960400001)(6486002)(38100700002)(26005)(6506007)(186003)(6512007)(9686003)(86362001)(33716001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AglCrfmXUTOHKhYLERTYGaIdzSuL5AkZyG4yPLcNlbb8lMqiePXn4oKmcbin?=
 =?us-ascii?Q?8N/qaGtn10FeD3CLVrDr4/s5o+J8PGfWZkvUDqGaXGVHhpH1yoqLZd3km8Qm?=
 =?us-ascii?Q?pFlnNnjCPXgDvmdAJuIUd8KHxyFS1Fz7g1pPvrd5WQSuT+RrehDY7J6Z2G0b?=
 =?us-ascii?Q?pry/GXbQ7tRJRTLaNoymaQIns+icyMJHFmZOeg/tQX+zujk7plSPlT7nOJcA?=
 =?us-ascii?Q?8h4dxi+oGKXKn4ggjh2p3plm7KTuWjkiijFCf5HTwkPImyO6aMmXqKKYqo3J?=
 =?us-ascii?Q?o8qWyIJlHVjVdwCfGVxB8DRExqX6i1tTx48moqOPdcNFxh+1zHusVupjld4o?=
 =?us-ascii?Q?o0U0H0NYoN2hLYBGALwhBC6otyZDcYwJ1+AubrNCRD4Nm8zuq8HwKDHVcT3a?=
 =?us-ascii?Q?bVs6qbPsbxYPzXvpzQ4NXcRPD8ljpW3nFb3CXDAiFWlhzTg7f2GVcaK1OLJW?=
 =?us-ascii?Q?1nLU5tAgdVQIoaMH7M+2Dkf6E3EIYvvpWWSmcSs260TnCGo39hfoPlYsoQP8?=
 =?us-ascii?Q?u91EI16n729E9h7+pBFGyI22t5mfZH/rIiP4gLV+E0XzZWf2Du4XC+iy3FY4?=
 =?us-ascii?Q?XSIqVcgPEFDAxX0iBSodxRq94WXW6xKvEAS4FutYH8Gfepr3hFQnI4enrtjo?=
 =?us-ascii?Q?ZKX244Bot4mSHcJX3W676zA4xnKO5/ruBsduFR6e5NiypiDTrZFHp7avIXqv?=
 =?us-ascii?Q?hKlunW9n9jSsZEPUIX4tHheQ+8MIgbe1MgMUGiXk8ccxJcQQt5CGlLVp5Ngn?=
 =?us-ascii?Q?n+2PvLyaGQqvq0Y3LOcPLCy0syGzjbcNh4cFwdKuAbv9ETXmJGM14q8pAdLZ?=
 =?us-ascii?Q?hSOMW1F36m4jGJoomejnjwBZWXpHZfHXIAJ8giRS+DImHpUYquPmarfOrZZw?=
 =?us-ascii?Q?OGH86flvyE8vH+jIo+wjPDCACuVrk+2ECPFYleASQ3hcKOSCdG6gzdkkhHvS?=
 =?us-ascii?Q?tGqJZ6V1EErRWcPwyMcIVkbZcbXbaDp5mSvVzMZ4b+cUcbDeUZOni3p4yMPo?=
 =?us-ascii?Q?I7414RGwVSsdAOlCD73W9QpNNWTwqxHodGpx/67qwSZLqmk5UEpc/gY+H0S7?=
 =?us-ascii?Q?aZWHqY/KJekSft89VBY+IZf0AVsUXh9uo3ScOAEuGzyAwivNpanIvYqf9vMA?=
 =?us-ascii?Q?raNAMUzZJehrviNJg9OKOqQEEFIvAwJTC4ClicgSujZEr1JfKf9CE3BQknv8?=
 =?us-ascii?Q?4B1wK6sXhc59qTQoqlkAjdiYw4PoVJlr1UyU6b13jGMfXmns6cJPq9dPxfg3?=
 =?us-ascii?Q?CKo+p27WWuDHmIAYUe7HOW0zANUmXyoNHwcInfhyl22Vdr/I8+a3185E7iXl?=
 =?us-ascii?Q?KkaAdPs1yZ0in5uGW2x2t48uKnCRnwjgU+BcNTVDg3HxeoE34Nm2Uss4oz4B?=
 =?us-ascii?Q?JJXEwOMMS/4Q6cF4Vz4dFejK8gPwMSAIcYYVxcXfuCmJ1Pj98v4+5wiyHEKE?=
 =?us-ascii?Q?oRtcWpskjTuoq4jeeFBE7rDOZa5KJ0bbyL4Aky+a/NWlNU/ap2CJlnzua6Vy?=
 =?us-ascii?Q?1wIn8qZrfgSF/f44VzV3XMzZPWwQ3dIU82EQmRFOGYZ/omlIjAmv5ByJfWaT?=
 =?us-ascii?Q?bnPT0OIX3wV90zVnlUHO0jXTVrGh80Svr/xMB/qQCiHJAwZKchNKuxiYdF2O?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5275233-8954-4e76-defc-08db5e0ddc7a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 17:23:03.2441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5R2/keWSV347iADu6HrBDV+3lYQ9HD2Sa4aWg7XVJnNxFdPmeBqLJnbkCYUuanYTfYVGvoTojp2r0mxlosglUvxUTPP18ROEwTprnm8CvPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 17/21] drm/xe/guc: Port
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

On Fri, May 26, 2023 at 09:54:52AM -0700, Matt Roper wrote:
>On Fri, May 26, 2023 at 09:43:54AM -0700, Lucas De Marchi wrote:
>> Wa_22012727170 and Wa_22012727685 apply to DG2 using the same action and
>> conditions. Add both to the oob rules so they are both reported as
>> active.
>>
>> Do not Wa_22012727170 to PVC and MTL since only early A* steppings are
>> affected.
>>
>> v2: Remove DG2_G10 from Wa_22012727685 to match current WA database
>>     (Matt Roper)
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c        | 8 +-------
>>  drivers/gpu/drm/xe/xe_wa_oob.rules | 3 +++
>>  2 files changed, 4 insertions(+), 7 deletions(-)
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
>> index 3d4304b7111e..ac3715e215f2 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -4,3 +4,6 @@
>>  14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
>>  16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>>  		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
>> +22012727170	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>> +		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
>
>Can we leave off the GRAPHICS_STEP here?  A0..forever is everything.
>
>> +22012727685	SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
>
>Ditto.

yeah, thanks. I will remove these.

>
>Aside from that,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi

>
>
>Matt
>
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
