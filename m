Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CACC369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 05:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2E110E1D4;
	Wed, 23 Apr 2025 05:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y84HCWY1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB4110E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 05:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745385984; x=1776921984;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BcPlhV8uNCRLwtfhAV1vVQPdlUx2MPRPjA+509+1jMg=;
 b=Y84HCWY1oExYRwB2odavkwbOn8tbjdFgPCPGckIcBLot2OL8DqlNBvxp
 FK1tZfNeb+NYVyB07RNCOIRGyOJztjvG6Y+uS8WQCXsFGNWcrqosEp8nB
 TSx5co1PEOOpRuA2bDeSDL/jTR5h0EXNOsT3HgqyW4Q7w4SO/lmpFBbjJ
 EjVIcrD7IT7dOsnLV13wUNY8FS08i1H8zcuQoeapaCFKNppoowQCf14nZ
 Q65RHXWZ6966TacRqb9bbrSSYGtGwzX+z3BlgrYd0a5QF3R2GIGvQU9AA
 +EzajTaT0ngKitZW6YqKDt9mrSVGeac2QtkDigOvdACDeP7RIFMKlBaQT A==;
X-CSE-ConnectionGUID: Xs+B1DNTTH6qPHBWKXugMw==
X-CSE-MsgGUID: 5JmyKNwcQZmpFyy4u1kM2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46842493"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46842493"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:26:22 -0700
X-CSE-ConnectionGUID: P/BWwouzQ/a1MneBdsrbig==
X-CSE-MsgGUID: aoD05xZSRiCYP8tkdxJUGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="133157140"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:26:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 22:26:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 22:26:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 22:26:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWfcKQJufpwMhnARWTSCTqtBswGoIvOE4EAp2hw4VjYf5sk4MmRMzQ19+yN0SmuHCQyeQQ6AIHVKaf38M6kdO+GaAzDedeqHnYFd9xYLQGuAFRObowdUaCcMDlFhEJVJOJVhb6zwgextr6Ff8BWGVZzE5KFws2ixMgn3eYtYlXIt3JzK4+BI41/3anmGmc+3ICy3Ex6ZB3h4ACdV4N6YyVM9sJOaMBfPxaBrmnN4nbiPoabA54XYV2/4iof0Ydv3W5639WniOKYYqEriSYeZVJOQi/BwAkCh+Ffbuz7mVK76Ichs/D9jKYuTiZfzE+trtzi/YszGI0Wwm7J+c8mbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wNv4BgjS4LVIn1pTqd/0P6j5caLFBzkMSHcH3U63iw=;
 b=rZJnvqp8B7xNYtPDFnIsxR46uJoGwdPltU0II1kLfLOFhKYAmL/2vP6Qjzv5utC5begeAE+c7QF3nZRDXoR0q8TivRsPpXjhiUnFkXCi/LDvBq9iL4YL+p/6WHZSG70zH7qsdlaSpDt67zLESnPLDDcy3/QqaDYrtLQT6Uv/YVkvaA4TnXETE5lJowWS1HbaAz32o6ZvluHiCp9Na6gw4RG9UzeKvd4aW3iMuitn+n8A9FHV1e1ktoPzaAzsqaoygj8iqkoP+CCcjGf6lyarLQTxVccc4eixGZofQuyddKQIOzFVcM/f6gYQvhojhtzzTj+YEtxN+h5IQKrVbj5Cmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 05:25:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 05:25:37 +0000
Message-ID: <02d74b93-563e-4fab-a330-f05cf1898ca5@intel.com>
Date: Wed, 23 Apr 2025 10:55:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-3-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250417111233.2322000-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a06470-51c4-4224-c842-08dd82274782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3Eyc1FjUU1yazBhVUR6UXNoNEgwZG5hajV5Y2krU0dQRjVUNkI2bXBWcGJz?=
 =?utf-8?B?OXJYcGhSS3JKY3BCck02ZHVIeDlURmRaSVI2ZkhieGhhbjlBMVNHSFFmNlZM?=
 =?utf-8?B?VGRNS1FnZ3dLNEIzQkdwdVBzN2k2bE9UUGYrRW5BUWF0NDhZZm1LRXVJMmJi?=
 =?utf-8?B?U3VIbENxTFZ1OWYzR2RldG1jQWpmdk1vTitsTGw2QlExVHBkWHplMFJTMDht?=
 =?utf-8?B?UG9hUk9zWktxYTJUbFRJenpaYjFxWGFOK1h0YXhYUGR2ZjdzL0twYjhsWllL?=
 =?utf-8?B?dm1zc1JQUEJUUjNMVUR3QWhqc3JPYWhoblBXM0Rvc1Z6QThhbTFRUDBLR2hQ?=
 =?utf-8?B?VlNiU3FVRWVUM2ljcmFzVzhVVUxneUNoQ2V5blprNXJJZTFCZDhTUEJ4Zkhl?=
 =?utf-8?B?TVpnN3pURXVTK0FKWmNtRVo5OUkxQmZ5Yjg0WFpYSkZwaEUxQXFEalY5YzB6?=
 =?utf-8?B?YmdOSnAvMjZyTlU3SmRDU0FHckgvUndyTjU2VXVoVGRuZTkwOHZvWVJBWGxO?=
 =?utf-8?B?aU5uS0gvcUJVRkVQdEwrbXhnMVl5NWFYNEhGejdFLzk4dnZmNEkraWtPeTFo?=
 =?utf-8?B?d2p2UXErc0J6SmhRdXpKczNMVEowWjlFODlMTGRSMEROYmdxVG00dmNhOTdy?=
 =?utf-8?B?ZWRPNHBjMm1jTGduT2hOckYrcHplQk5mbXhhNGlaS0p6OXZYejc1SHIyT0M5?=
 =?utf-8?B?Q1lxT0FOekxpbzlUbWZNTEJMdWJITllOQXdYT0dLTFhCK3oxcDN6YkFWMXBT?=
 =?utf-8?B?MkU2WFdKVjYveVVVVVJLYUZrMG1CcmZSQ0sxVDFMK2VybmxwRkdzT054NHF4?=
 =?utf-8?B?a1huWUdqKzN3WnZnV0Zha1I3RUNuNDF0cm9UaXQ5clk0OUpiMENjeXdBeFFs?=
 =?utf-8?B?RlVsK2JuSkRHYlJMbjM2N3UrZXl2RmpIZE1KcnFWQTdWYjdIZVVJcmhrcDJn?=
 =?utf-8?B?L1FVNE0wVEg2bFY0RVBHL2Q1cHpZNFZBZWZhajJEYkp6dThaYXA1ZVVsQUVB?=
 =?utf-8?B?YVJxSm83L3hLZEhlc1hrOFZ2ZUF5TDlHNFlLaVk5RWRmVWx4N1BKZWw4NWtz?=
 =?utf-8?B?VElHQTB2UURGbjFOQXRDTElQL0ZMdUlNYkdqQ1lWK0h6RkNaeS9URE1jOUc1?=
 =?utf-8?B?Z1phRW1NWnBLWEgrWFFWazFhc0RLeEU2K3NOSWxmVUx1RGRZMVZNTmxoS2VX?=
 =?utf-8?B?dC9nVUxyc0pYQjZHK3pvZmw0b2JrRUlEZVBwaXVaWFJzTmMvOTR6UHV2YUY4?=
 =?utf-8?B?L1NXbEJHbDJrRUJSelVUemc1V1d0UHVLenI4SDZXSmg3b2E5ZzhtYTVEM1RM?=
 =?utf-8?B?QXluQk1PYXJMQzhYbWs4V1BlTnI0K05KQVJ3WFFCUGFQVG5CUnhoY254U2ZD?=
 =?utf-8?B?b1g0bDBoQ1dhalQvTit4QVZqVUEwVDA5Q05tUlNBQkhCRkxuVFZNb0IyVEtj?=
 =?utf-8?B?Tkt0dmNJTVV2clhiMW9NRHNmVjRBSTExTmRaTER2WFowV1ZxbU5UTXhYanpB?=
 =?utf-8?B?SWZhdVkzZjd2elN1bHFIY1NucFlBNHhESW5CSjdzbTNRZUZ5cXpvcE8rVmd5?=
 =?utf-8?B?OXZMNm1qQTFrdk53V0tzVGxCSCtPdUhudVFXaExiTXB0azJsQzJGWWJzdkZw?=
 =?utf-8?B?SFN4TmYyUFdrbnZ4cE41L3JDVXVWTGg1UDVwZDJheHJJSEJqbS9pYTJTRmoy?=
 =?utf-8?B?ZHFHdEV2YVhuSWRra3F0OGJlcjl4cWZweW9hbkQ3L2JMOWdUSHNHd1lDNG9q?=
 =?utf-8?B?Mnl1M0ppcHZSMTdLbWhwMWlObWRraHFYbEVRZnFQL1RmZmxCUDV1eUpBa1Vo?=
 =?utf-8?B?STZ0b2FzOEhYTmVwM0Zua1FIRGo2MGdycVRvN2Vwdys3ZmRoaVZKRlBwRFJv?=
 =?utf-8?B?cUZDODZxanpmSG1KNE5pOEMvc2o0UjNRamZETDl0dk9wSWdia0NGemJicS96?=
 =?utf-8?Q?8Gak6r0RIOk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHY5cWdVMkJSOFJaaHhPRTlWaUNjc0M0OHMvWjJBOWV2dGo1Qmp0Q3lFLzc5?=
 =?utf-8?B?ZW5CNG5adm1meXZjZ1N5SG95c3RnaFRiK3BPNHU3UmdldjltR1AvMUlHZE9V?=
 =?utf-8?B?enF5cko5V0NyTjBjS0V3akRJbVBYOXU2OVc0OGlEUFFrTVhVL0hnRW1KZ2dH?=
 =?utf-8?B?bTB4ZGVwcWtsUHRHU2hNeVAycnl5UDN5ZXI1Q014TVExcnYxM1RjeU1tcFZo?=
 =?utf-8?B?ckhDYnNnTFRDSEhianI0cjJDalVmOVZtc04va1FadTIrYUsweGltZ2o2WGtq?=
 =?utf-8?B?ZFdOKzdVcmd0SkY5MTluOVBwTm1wZC9vS3ZId2JBQVRrQkdNb3JnWWQ1Yk1I?=
 =?utf-8?B?Y3N2NmhnNzJqV3JFMVFaMmVMRDlIdXY2SStjOGJXb0libGN6TTcyZkNESHN0?=
 =?utf-8?B?cGVSbWl3dk1sN2h1Y3ZJcUtpdGtWOEthalQzczhlTDJFajB1cEt1eU8xQjdS?=
 =?utf-8?B?eEplZC9VTWxFR3JGdUROTW5Neno5VG9sVCswUUxHVFZNL2JQa3VKZjIwbnAy?=
 =?utf-8?B?blUreDd6UXBPZ1ZkQnFIWlFlU28vWVhFc1JrQVJMV01Mem1rZ0NWYk5vSkNp?=
 =?utf-8?B?a2ZGMzU0UVBjdEVlSVh3ZDl6di9zVUw4bCt1TVZrcFU4Q2Vkbzl5VFBDY0Z2?=
 =?utf-8?B?RFA1b1NueGhnOXlrY1F6UzRxc29ITzAvb2VLMTZsekVvdm1uVC9Vd3NxZnda?=
 =?utf-8?B?K2hYRHh1Vlp3eXo5eXJEUkdxbWZUTEYwUlM2ZWVBSTFUZ2RVbDF6MThjRk1R?=
 =?utf-8?B?cHp2dnFZay8zeEw3aTVDOHpxMWZoVnhGQlgwb1BMaHdXYkZYczFmSklpWk5C?=
 =?utf-8?B?dVZPWUpsTGEvSFo5NzZGNW8yQmRZdEhab0J2WlJPdFZaM3JLZVM5cDdhME1W?=
 =?utf-8?B?WXRQc3BNVGNNRS9iRGdRZ0ZaVHBCRmVJajdNUEdMWkkzVDVGa0NHREJoTCtW?=
 =?utf-8?B?TGlyU3dMcFRYWkg2NGxBdWFRbnkyNjZRT2ZQaDRsUGVUZ0sxSmJ4QW83NjB5?=
 =?utf-8?B?SEllRFRNOWt6YkxDOFZSaUJ1VExDMDhEdncrU20vb1B4MWI3d1lpMXNXdDEv?=
 =?utf-8?B?R1dRM1Qwd296dURXTHZMVWVVRWc2d0JxMkN4UlRlM2YwbjNaNjJsRVVoYlg4?=
 =?utf-8?B?S2lYeldadjlrc3g3R3hYZWc0d3BqSzJBbFM3d0VOaWRta05qK2ozeXVpNGYr?=
 =?utf-8?B?SHQwTXRTMzN5MFprbVgvdVNpY3VQOUpxODlaQTVEWWN2SG1hc1FvUXdJYnRK?=
 =?utf-8?B?bWZIbWFUVzFHdmVLdWtJL1pVNzJCR2p2WXpwaEhPR082WktqQmw0MHdvR0k5?=
 =?utf-8?B?WE5YVVBhZk5KMnlLK1FPK1dTdHJiNnhqeUs4ZkV2SnBZVXZlYklMbEJrMFBN?=
 =?utf-8?B?dmo3Nkg1am9tamN6UXhOUjM5UXNUY2tERlg1TUR6ck5ISTNCQWd3MHI5ZzVQ?=
 =?utf-8?B?YVpXdnM2bjhqWmZRZWlTMU5zcTRGVHdqRlI0TUZ2d1laaEdCSHc5TmlsVUY1?=
 =?utf-8?B?QkVjZ1lidUxaSTZmdnBDbDZ4aUg2NTJPK1Y0T25XeDRaYnE5YjVoYiswOWhS?=
 =?utf-8?B?eXZ6U3I0R2ppWjN3bndsOEhyWTRYMEdEWGxNUFFNSjd5UUpQZEVNSE4ydlVR?=
 =?utf-8?B?RkpWc2phNEE2Szk5U3krOFRpUlgrOVdGdS9nL1MwempuMEJaUHltSSs5L0pp?=
 =?utf-8?B?ZUJhZkJwaEFObEQrU1BySUZOdG9NMWkwa2RQdisybUZHS3VFWCt2LzlCMmJ4?=
 =?utf-8?B?OGtFdWt3Z0pQU2lMaS9HWWd3bk42WEFwa1lxTlNTdE1KekdOUlN6bTBDbTJM?=
 =?utf-8?B?QjQvZ0RHb09ZbHV5Y2puQUNmbE5BQkIxd3BPQVZBaCtoUFhWdXlaMkdYcy9Q?=
 =?utf-8?B?N3NjelJQd1BzWW9qVnNSWWorQ0dGZXRNcS9aSWVSWjNPSHM5SHJ1N2IrUDVv?=
 =?utf-8?B?ZjZLeU05SzV1QklrMDQxazNsaEcxK3REVzBERmlEQ0I5SXZhYWduN3drdVU5?=
 =?utf-8?B?YjVXU0xtMzB2dlo2bFd2ZUVaUUU0ZGQvRk1LbjdmNHlyY1RiQ2h2RCtFcHJq?=
 =?utf-8?B?NFJ5cHpUc0dmd0dONkl1eGlEVzRsNk00SmU5eFpNdWZFcWlzL0hBMUJSUVYz?=
 =?utf-8?Q?PKBs470UCrg/cqFWU+Y8MIeFM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a06470-51c4-4224-c842-08dd82274782
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 05:25:37.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPKEFrtsNDkNakqh/Hiyp5TtsxajJYrNsbdEWTl/b9QlMMyWr+9Y/pnDQ8egB0ifTbZLq/WMpF2UhUG+hzx62A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
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

Hi Raag

On 4/17/2025 4:42 PM, Raag Jadav wrote:
> Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
> 
> v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
>      Rework macros and their naming (Rodrigo)
> v3: Use sysfs_create_files() (Riana)
>      Fix checkpatch warning (Riana)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |   5 ++
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 101 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
>   drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
>   4 files changed, 112 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6c9d3009aa03..79b7b0ecfbae 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -26,6 +26,7 @@
>   #include "xe_bo_evict.h"
>   #include "xe_debugfs.h"
>   #include "xe_devcoredump.h"
> +#include "xe_device_sysfs.h"
>   #include "xe_dma_buf.h"
>   #include "xe_drm_client.h"
>   #include "xe_drv.h"
> @@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> +	err = xe_device_sysfs_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>   	xe_debugfs_register(xe);
>   
>   	err = xe_hwmon_register(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 2d25e5b5d4bf..923612a0a2e0 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -11,6 +11,9 @@
>   
>   #include "xe_device.h"
>   #include "xe_device_sysfs.h"
> +#include "xe_mmio.h"
> +#include "xe_pcode_api.h"
> +#include "xe_pcode.h"
>   #include "xe_pm.h"
>   
>   /**
> @@ -81,3 +84,101 @@ int xe_pm_sysfs_init(struct xe_device *xe)
>   
>   	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
>   }
> +
> +/**
> + * DOC: PCIe Gen5 Update Limitations
> + *
> + * Default link speed of discrete GPUs is determined by configuration
> + * parameters stored in their flash memory, which are subject to override
> + * through user initiated firmware updates. It has been observed that devices
> + * configured with PCIe Gen5 as their default speed can come across link
> + * quality issues due to host or motherboard limitations and may have to
> + * auto-downspeed to PCIe Gen4 when faced with unstable link at Gen5, which
> + * makes firmware updates rather risky on such setups. It is required to
> + * ensure that the device is capable of auto-downspeeding to PCIe Gen4 link
> + * before pushing the image with PCIe Gen5 as default configuration. This
> + * can be done by reading ``pcie_gen4_downspeed_capable`` sysfs entry, which
> + * will denote PCIe Gen4 downspeed capability of the device with boolean output
> + * value of ``0`` or ``1``, meaning `incapable` or `capable` respectively.
> + *
> + * .. code-block:: shell
> + *
> + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_capable
> + *
> + * Pushing PCIe Gen5 update on a downspeed incapable device and facing link
> + * instability due to host or motherboard limitations can result in driver
> + * failing to bind to the device, making further firmware updates impossible
> + * with RMA being the only last resort.
> + *
> + * PCIe Gen4 downspeed status of downspeed capable devices is available through
> + * ``pcie_gen4_downspeed_status`` sysfs entry with boolean output value of
> + * ``0`` or ``1``, where ``0`` means no auto-downspeeding was required during
> + * link training (which is the optimal scenario) and ``1`` means the device
> + * has auto-downsped to PCIe Gen4 due to unstable Gen5 link.
> + *
> + * .. code-block:: shell
> + *
> + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_status
The code looks good. But i am not sure of the word downspeed.
Couldn't find downspeed used in Pcie generation context. For link,
it is mentioned as  'link downgrade'

Could you share if you found any?

Thanks
Riana> + */
> +
> +static ssize_t
> +pcie_gen4_downspeed_capable_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 cap, val;
> +
> +	xe_pm_runtime_get(xe);
> +	val = xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE4_CAP);
> +	xe_pm_runtime_put(xe);
> +
> +	cap = REG_FIELD_GET(PCIE4_DOWNSPEED, val);
> +	return sysfs_emit(buf, "%u\n", cap == DOWNSPEED_CAPABLE ? true : false);
> +}
> +static DEVICE_ATTR_ADMIN_RO(pcie_gen4_downspeed_capable);
> +
> +static ssize_t
> +pcie_gen4_downspeed_status_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 val;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_pcode_read(xe_device_get_root_tile(xe),
> +			    PCODE_MBOX(DGFX_PCODE_STATUS, DGFX_GET_INIT_STATUS, 0),
> +			    &val, NULL);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_PCIE4_DOWNSPEED_STATUS, val));
> +}
> +static DEVICE_ATTR_ADMIN_RO(pcie_gen4_downspeed_status);
> +
> +static const struct attribute *pcie_gen4_downspeed_attrs[] = {
> +	&dev_attr_pcie_gen4_downspeed_capable.attr,
> +	&dev_attr_pcie_gen4_downspeed_status.attr,
> +	NULL,
> +};
> +
> +static void xe_device_sysfs_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	if (xe->info.platform == XE_BATTLEMAGE)
> +		sysfs_remove_files(&xe->drm.dev->kobj, pcie_gen4_downspeed_attrs);
> +}
> +
> +int xe_device_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
> +	if (xe->info.platform == XE_BATTLEMAGE) {
> +		ret = sysfs_create_files(&dev->kobj, pcie_gen4_downspeed_attrs);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
> index 2c1fabdba9e4..b557db0a6023 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
> @@ -9,5 +9,6 @@
>   struct xe_device;
>   
>   int xe_pm_sysfs_init(struct xe_device *xe);
> +int xe_device_sysfs_init(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index e622ae17f08d..101e3e6ecafc 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -34,6 +34,7 @@
>   #define   DGFX_PCODE_STATUS		0x7E
>   #define     DGFX_GET_INIT_STATUS	0x0
>   #define     DGFX_INIT_STATUS_COMPLETE	0x1
> +#define     DGFX_PCIE4_DOWNSPEED_STATUS	REG_BIT(31)
>   
>   #define   PCODE_POWER_SETUP			0x7C
>   #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> @@ -66,6 +67,10 @@
>   /* Auxiliary info bits */
>   #define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
>   
> +#define BMG_PCIE4_CAP			XE_REG(0x138340)
> +#define   PCIE4_DOWNSPEED		REG_GENMASK(1, 0)
> +#define     DOWNSPEED_CAPABLE		2
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;

