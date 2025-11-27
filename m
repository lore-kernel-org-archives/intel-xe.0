Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50357D11183
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 11:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50F910E766;
	Thu, 27 Nov 2025 11:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFzBKeNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D6F10E766
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764242993; x=1795778993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D3kh2jXQKeVnFHtIDod8gmFtkzM8l4qnp/ShKPx3RdA=;
 b=fFzBKeNXHMktoswyK8CEfekpMoylsk7Sp6cCXC4vdjk9xnds2q2eHoPU
 HsCEG7aTaMsFz3XcB7qwlsQrivSm2RWdQPEXtqEColJ0Og46tCZ3RWXxy
 Apz32xtbo9Xk1+l4T/I9WYzgf+mHfyy6n6kBP8yoa/rYMlsuC1Jw6wTB6
 Jg0xRgVvUtawyh9qfwrOaDmflABJ1p3PjCDJDJye2cKvOhKMMwLmVuLyo
 YR+QFN4UNQjuhI02RXvysI/Lc3CaJ2G5JPuDstQgthzGdYbkmkl3qvK+R
 FhWQ4a6wuvB1Nu4HAOY2Fgj6JH8H9JVUCPdUAVMA1pinU7+qKAacAQXzt Q==;
X-CSE-ConnectionGUID: JlQqbkl6QuuD6kXb09Tgog==
X-CSE-MsgGUID: e+sW8ZE0SuG52E10Vgy3gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68881050"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="68881050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 03:29:48 -0800
X-CSE-ConnectionGUID: ew40/QMhSxutaHIfntaMRw==
X-CSE-MsgGUID: +1t+cHnBSrWBpngyQuZDkg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 03:29:48 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 03:29:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 03:29:48 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 03:29:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XV2TV3YSaCCVmuM0Zo0qG1zuisgZPDJAgPJyrhHiGFfcKrrTFU2WjhVELXuBJqaJRsWHC5TYW9Thg/RqjMpF7Vs5ON6FVHxqUT6GvMuUYMv12n85YOgbeH7sWkBhc7cSF2Xmxf1Q8iPccGn6BKFLtZfw/ZJ+zUbSyZDA5B2MiJwtpTeKhWoXwVoUAHSLcws64xh7pxXOJorKjTgK21loNL0HMQIbnPL1yt1nM/R8DksbiFsPeLOe8slWyCOldw9rJA+IEQQpWCI5jiSmlD1Vl/MP3L7KY0l/vGiNNoBjChwNTBQop9QyM8LxiUq29sT1hRHx8lRs6TQIGaxOC3i/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eohL/jblrq3Fob6h561ytUMCUiiYmZqYDWQ+1GCRJ3Y=;
 b=DsrAmquReCaru2bgb6kF88uX+Z986zzIwSWyB4lPbyb0XHLy8uBLeh1Fswj+95rjMPvZ5XtM7QtnWbNA8ZNjp1Z1mRY91tdO72bz9mkLr7tTvQIKXKXjVdctb+4mvP5QlF6gFlK9zmbpPq1DLAOzKKFsbYNudd6EVgsETI5nFeKqoD/6aKghQVvixNkHZb5ULXaUnyhy4ox01hVvKTCDYIyQsEBtl5YscWGkd9dOK00gdSsY+lE4UbCDjPL4HJZ3dGElw0kkwS7PQ+XF2Rt/GDOtItEFmsIVCSZte35nDvf6GG4+fEwuehyW67LG46rbDm6ij6594YcMYSSY5M8a+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.14; Thu, 27 Nov 2025 11:29:41 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:29:41 +0000
Message-ID: <be6b2671-34db-4937-b8b1-981a12b25fe3@intel.com>
Date: Thu, 27 Nov 2025 12:29:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/pf: Handle MERT catastrophic errors
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>
References: <20251124190237.20503-1-lukasz.laguna@intel.com>
 <20251124190237.20503-5-lukasz.laguna@intel.com>
 <LV3PR11MB8695F2D970C3371714FE4DB0F9DFA@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <LV3PR11MB8695F2D970C3371714FE4DB0F9DFA@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0226.eurprd08.prod.outlook.com
 (2603:10a6:802:15::35) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ba9476-2152-4bd4-41a9-08de2da840a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzlXRTJxMlVMTFlwNjhDMWhNM29jMVNtdlE2Y1NyVkRuTU1Jb3Jia1hlRkhn?=
 =?utf-8?B?Tm5FaWZsRWFoU1VLcGlaK20yQ3ZESmNwQUF5MTROS3phVWxpd28rVnNybDFz?=
 =?utf-8?B?SVZZR1BVZ0dQdktha2c1RXpGMUJ0UDVnaHRoaGxqR2lKN0FWR1RyVHMweVcr?=
 =?utf-8?B?RVRlM2hMVGtrOTlOcEdLTi82eFNWZ2NiOTFWNDdBV2FLK2hUNitIbmFJTlpj?=
 =?utf-8?B?ZU5ySmI0QlRzN1RIcnZVWjlVMDdFN2ozd0ZBaWhnOUFNUVZmcjZpVWU0OElF?=
 =?utf-8?B?MFNUUngrS0RpWGVqcWNVYmJpR0NLZ0xuLzBMYkl4THFzSk1rQkM3bHNqNHpm?=
 =?utf-8?B?WUdZM0tTTU5QYW5tRHdQZk8vN3hYRndFM3daWmM0V0NEUUczWmJmUERpb0o0?=
 =?utf-8?B?L3hDSitCNG5XL2xYeWpKVEs4YTlLS0h0Y09OMzdYK3dBK2VEV3FyZll0Ujla?=
 =?utf-8?B?OWpGUnZqaG1hakhPbExZNmU0dUM1UXNMRzBkTEcvVVU0UDlpZEh2Y3JRMW41?=
 =?utf-8?B?YkJndVNIM3c2RytHTXpCVHd1NHZBbzlsOWIyQXIrMnN5b09qSGU2eW9rVEZ5?=
 =?utf-8?B?Wk5xYUo0bEI1T3FZVDN4TWsxZ2g5YjlESUVjaU5LMUtjS290STdvSHJmKzkv?=
 =?utf-8?B?bjluV1c4dkpqVnpZTWpvbG1UWGhtTlBheXpTamF3KzdwS0tCSk5RWWZmU2Z6?=
 =?utf-8?B?Rkt2OGlLK3RXdnlTM3NneEZtMEQ3cnFoNnNrTHZWN05kWVVVcWdXUXEzaDlE?=
 =?utf-8?B?VTN5NFRTK2lGWFlpVHY3aHRIRlRiVUd2U3BlemJyZVZTRGZCMEU1UmlIRlU1?=
 =?utf-8?B?R2lWV0lXSU1scWNsdTNwSW9jWG8wWXRNSmhPcHhoY0tHQmRzbTdiMnl6VGd2?=
 =?utf-8?B?U1dtMlN4ZXgwZi85WlJYUEc0SGE0Njg4a0h3Uzh0ZzlMZ1gwV2lqb2FZaGVt?=
 =?utf-8?B?OWhIVVRFT0Nickh6T2FhZW45anBVQWdVbUpETC9WaGphWEs2TXRwaU5ITXVj?=
 =?utf-8?B?SC9YL3FCdUtDZklURFg1S2wxT1NteGdyTmtUc1ZzK1BEOXZmVHdIaFMwQWxT?=
 =?utf-8?B?aGxBNGlpN3Q5ZitLSjZaays5L2lkVzVqaHZXRlV5NDVEYlljak5SWHhPcmRx?=
 =?utf-8?B?d2ZlOGxqa0xsWXIwWUNyWGRpYmJkZjJXMTlWYWVrWHBYVHh5WkhIT3ZOeEFQ?=
 =?utf-8?B?Y2ZjNk5XY2JqQmNkWkVDdUhJUmlveGZDSTFxU3hGVlo4RWZBUmd3bUc2SzFY?=
 =?utf-8?B?LzBjZUpSL0FyU1Q5QXBkNjcvMHBNaGxBVFAwTzFtZ1NOeFM2bkV6WDdyY1l0?=
 =?utf-8?B?c2V1MFFIRFltOFVGY2U0aG1LemdldW5OVHVYK1ZLQUV3a0FzRDNOUk0xeG40?=
 =?utf-8?B?OEt0KzNMdWJCaVZVcHpvM3RBVU9ldlpWZjdFRnh1SnA3THhTUTBjakdhODQ5?=
 =?utf-8?B?ZVJ0RVZXUGZsNUlIQkQvbkhLNWRJK2lpQmxhRGt1eGo5dWUvWGpIUU1jcVNK?=
 =?utf-8?B?bDRoTEdoTzQxc0RXSEhtN3dZT3hmUm9lS1o3UU5WM3R2YlM4WXFRV2ZZV1Vi?=
 =?utf-8?B?SysyMUxUVTIxT2xnd1Ztb0xObVFBdVc5ZzNNcHJrdnNYdlVPdklsbTJldml3?=
 =?utf-8?B?SGEwSmlmM0Rqc2lhYzBzUmVXV0RhR0tkTUhBUU1wQTdvdHE5ZG93MW54MU5i?=
 =?utf-8?B?TGt2TVVDaU5sRVJqZWFTUkM0UkpNczZUMjBlSDdxVlplS1VML2hzMktaYUFi?=
 =?utf-8?B?V3Y2YlRTWEJDalJRWVhocGQ2aGhyZENkWUVmRVpPdWV0c0x0NDNjZFhZbTdo?=
 =?utf-8?B?dTlUMjVjOUZLQ3g5SUhUNVM3TDZLQVgrYnlJTDE4dDVoWDBQMnp2c2ZCSVpX?=
 =?utf-8?B?ZE52dU5qLzIwVlp0UjBSU0NoZ2pNR2svVTY2cnpiL2Y1bDRHaHZGcXVwZFU3?=
 =?utf-8?Q?2185QdXKE6RBTTLp/UMlKsbvt5Yc8UcA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vjl4SERaeWxPSmtvbUkvaEI3U0dobnBkSUd3V3ZQem80Y1AvNTlpT2txcG54?=
 =?utf-8?B?VUdvSHk1aWc1aTZmeGF1d3MzN2JVYlNQbUhrZTM5U1pxalg1cERhNDZYNE8z?=
 =?utf-8?B?YUc5ZnJFejZXb0h5S0V3NG13a0lOdUVYR2xnZ3dFZFNaYmhINWRsRytieUhU?=
 =?utf-8?B?UytKSFJTMWRRNGZaYWMxeUxobEo1cC8zRTBCeEJPdE05SXRQSk9OSTR6Skc4?=
 =?utf-8?B?T2hWSnZpY1YwYU5kMW1DV0w4Z3ZRN21mT2o2WDZrUFR6S3ltdGlkcVUxd2NY?=
 =?utf-8?B?UmhEME5LTm9EQndtcEw0Z0orZGh1bVRta3JuRU5iWENwQTE2VVlETVJ6Vllk?=
 =?utf-8?B?cEQ1cStLWVFIbXFhWXBycWc2akZxY1hQa2ppbS8yWVZYZlhkRHJJZk5WRmph?=
 =?utf-8?B?d3F4V2p1dGhXQWw2WjNxLzVCckpYZi91UmhIVTByZGl6Uno0YXNnS3E5emh4?=
 =?utf-8?B?NlR2RDljdk4wK1QwR2VmWWlkRFZPUU44RnpJbHg1Zi9OZ0RLL3RtUEJiVlB5?=
 =?utf-8?B?eFRnUTBrR0dJSUFnOUxyMzZ2VFNaZGsvU01FQ0o5T2kyc3YzdXQvQVBabC9T?=
 =?utf-8?B?Ky9oTjV6VFZQTnB2TGUrcVZLRXVDb1N5Tkk5b1VLcXFxZXBJdFllWVo3dStQ?=
 =?utf-8?B?NmFzSkkzQkFRWFI1Z3BTam90blZadnZlWFEvTGgrK291TGgweWFLYVpsbkll?=
 =?utf-8?B?akUrdG00T3VMcEdWWG9UQVZOZHF0czJ5YVN6aVlLNHo0cld2dmVDYWMvaEZn?=
 =?utf-8?B?MDBsb3VYSHYvd05yWjFoT2t6TCtUUVBjVkJtRHNqaDV6QzhPMS9jREdNUWZQ?=
 =?utf-8?B?LzlUMklwVVZoYW93ZTU1K3JXdTVDSFhnc3NGK2pGZmdSWEplTitPSmxSZ3JH?=
 =?utf-8?B?M3hDVmJEVU94TTNlcDNOTW1lNmZyVkYxU0hwdDlzdkg5RGRpKzBLTm0wVzc5?=
 =?utf-8?B?Sno3Vzk2QXRmTGF1VlhZQXhQM1gwY0YwVlNNMkZ4TlRIaTg2ZytwRFJZSUlS?=
 =?utf-8?B?QlAyM3hlSnR1QW8ybDZGRnhzdi9ReVBEMFRmT0tZWGMyT2dVNmYwUGM3aWdC?=
 =?utf-8?B?R3dRL0Y5aklhY2gyZWUyemo2NUFlNzEwdU0rcGtxOTBhdmhCYnlxbkhsQXhL?=
 =?utf-8?B?UlNIcW1BQThCZ0tCNHZGTG5XZ0tGRWFWZTlKYmF3Nk1QMVdiQ3pCYkVYR3cr?=
 =?utf-8?B?RXpMVWRMZGV4S1RZZGFCUjlibEhGODZIbFR6bGI5cjVQb0t3OEpJTTlKRE9z?=
 =?utf-8?B?TnRqbTg3cXFxWGJMMzNEeFhTWjRibmNyMHFwcU9MRW54eXZiRmxoTHNOVWFU?=
 =?utf-8?B?TFBjcVJMV0JQZWFZK21WeHBlMysybHhSNjdVK3NXK2R0SnYvS2t2b0dOR3J4?=
 =?utf-8?B?cy9jbHdQaHQ0M25aUWlNNVF0VVBnaVBoNHUyWk81UHpkZk43cjFFUlNHc01S?=
 =?utf-8?B?L1lYUWhsUFowa3VCV054dzN4SzdoSmhmcnhJNnJidzFQa3VJUGRGYXRLYVpw?=
 =?utf-8?B?U2dWa2dtVHNoYnhwWUV0SlRIU3RZYTFVcExTNjBIYlBURVlrQVE0WHgzV1Fi?=
 =?utf-8?B?Q1k3WEM2U2dUaG92S1VISVUxWEtDWWlpS3FEaS9DYXl2ZnU5TDMycHIxL2xN?=
 =?utf-8?B?NTVuN09QY2s4SFdSYjRodzZYc0tVSHdLb1Z5R2ZtaU5wMU83dWMrV2NFQ0Za?=
 =?utf-8?B?alBSU0pielF5NkRnVFlPZkZhQktKSkV1Wm1IUzBwRktVbmFXQmJoRG0xdmc5?=
 =?utf-8?B?cFFYTHNhbVFwdDlwREVlRHBTYXZRbUZCdWxwajdwMjd0Ni9jRFNzdmJqd0Zr?=
 =?utf-8?B?dDhBelJlb3VvVXJiVE1BUlVIblRrRXl1ZGVlQjUyRmludE5aekZ0emxsbytJ?=
 =?utf-8?B?cHBKWStaS2ZVT2JJc2dOdlpaR3FBL3J5dytTT1N2OGxGeWxnOTY1cEt3RE9E?=
 =?utf-8?B?SXZDdTNXaTBYc2wrdExrd1lmcXYxbGJhUWFaS0RoMitsRVFsYnA3ckZGSnRJ?=
 =?utf-8?B?bjBNRDR0VmRuelBnb2lyM1RZSHVOWlRicVY0anRMREJMOFM5SG85R3pMSWFn?=
 =?utf-8?B?VDlyeEhpZElNTGVCSUUwekQvNUZWT1dGVVVSR1U3TzR6aktkQ3pHKzlocUlE?=
 =?utf-8?Q?CC/roL3LMieUUty3vR6ol4zOU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ba9476-2152-4bd4-41a9-08de2da840a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:29:41.0956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwoGnUakHjSbi4ZuVxmfeEiAaecQZj3MR0KX5RZXyJ8yKvFIhqnqm4gqKKlPzvikN0Sl/+AzG6FMmjIBjUtRow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

On 11/27/2025 11:46, K V P, Satyanarayana wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lukasz
>> Laguna
>> Sent: Tuesday, November 25, 2025 12:33 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr
>> <piotr.piorkowski@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>
>> Subject: [PATCH v3 4/4] drm/xe/pf: Handle MERT catastrophic errors
>>
>> The MERT block triggers an interrupt when a catastrophic error occurs.
>> Update the interrupt handler to read the MERT catastrophic error type
>> and log appropriate debug message.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> Reviewed-by: Piotr PiÃ³rkowski <piotr.piorkowski@intel.com>
>> ---
>> v3:
>>   - use FIELD_GET() for consistency
>> ---
>>   drivers/gpu/drm/xe/regs/xe_mert_regs.h |  5 +++++
>>   drivers/gpu/drm/xe/xe_mert.c           | 11 +++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>> index aef66c04901d..c345e11ceea8 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>> @@ -10,6 +10,11 @@
>>
>>   #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>>
>> +#define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
>> +#define   MERT_TLB_CT_VFID_MASK			REG_GENMASK(16,
>> 9)
>> +#define   MERT_TLB_CT_ERROR_MASK		REG_GENMASK(5, 0)
>> +#define     MERT_TLB_CT_LMTT_FAULT		0x05
>> +
>>   #define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
>>   #define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
>> index 304cc8421999..f7689e922953 100644
>> --- a/drivers/gpu/drm/xe/xe_mert.c
>> +++ b/drivers/gpu/drm/xe/xe_mert.c
>> @@ -55,10 +55,21 @@ void xe_mert_irq_handler(struct xe_device *xe, u32
>> master_ctl)
>>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>   	unsigned long flags;
>>   	u32 reg_val;
>> +	u8 err;
>>
>>   	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
>>   		return;
>>
>> +	reg_val = xe_mmio_read32(&tile->mmio,
>> MERT_TLB_CT_INTR_ERR_ID_PORT);
>> +	xe_mmio_write32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT,
>> 0);
>> +
>> +	err = FIELD_GET(MERT_TLB_CT_ERROR_MASK, reg_val);
>> +	if (err == MERT_TLB_CT_LMTT_FAULT)
>> +		drm_dbg(&xe->drm, "MERT catastrophic error: LMTT fault
>> (VF%u)\n",
>> +			FIELD_GET(MERT_TLB_CT_VFID_MASK, reg_val));
>> +	else if (err)
>> +		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected
>> fault (0x%x)\n", err);
>> +
> Shouldn't we log with drm_err when catastrophic error is received?
> -Satya.

In case of an LMTT fault, it's not a PF driver error, so we don't want 
to flood PF logs with errors for VF misbehavior.
For the "Unexpected fault" case, using drm_err() makes sense in my 
opinion, but it doesn't seem critical to change, especially since the 
patch is already merged.

Thanks,
Lukasz

>>   	spin_lock_irqsave(&tile->mert.lock, flags);
>>   	if (tile->mert.tlb_inv_triggered) {
>>   		reg_val = xe_mmio_read32(&tile->mmio,
>> MERT_TLB_INV_DESC_A);
>> --
>> 2.40.0
