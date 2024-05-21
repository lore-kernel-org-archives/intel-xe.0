Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2A5C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 20:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B72610EFD6;
	Tue, 21 May 2024 20:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5arnYIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E577710EFD6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 20:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716323202; x=1747859202;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=JkOyJwHslr49xaT8+9nuwt+dSucb9Shpq3S7Anyjm54=;
 b=K5arnYIBHaOATymz/7TFvMuj5JIR0csFBxDyWF9PLZrXA4jBhpnKEKp1
 WV3Ho5EpjKT8HnP4hrLWFvWS8sU5XICQy7oTckIitXJUnDynYhODoQm+f
 I0mhzSlSIXNHTvvAB1pF73rEJ0SJtZ1mBlgEv8udTsK5/Mdq4fXV+8KGq
 BCZcMx6GsJat10NSQI883IsULyK0x/P8iYuk6PaHgOREuskymZpnYHBJ9
 wy8hRF6bMwAITNCyot2lf7uaJttAC1+jDPmsfPa8QY7Nh3I2cZJAhchOd
 BChU7m6zdl+JeMUv6FtwUZdFRY3s0eS4m/cKz8M4KjvV012eDo4y1SOMh w==;
X-CSE-ConnectionGUID: 5taCfLQ0Srmo3F5yvwmmFg==
X-CSE-MsgGUID: ngmbnKJSQkWqZ4lJ0BNf5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12661353"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208,217";a="12661353"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:26:39 -0700
X-CSE-ConnectionGUID: /3/9QgezRzaP/eINaODb3Q==
X-CSE-MsgGUID: JWN1EYN1TH22eCybGGIakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208,217";a="33190401"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 13:26:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 13:26:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 13:26:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 13:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/7MAiGvvsgPT3OvP6zPFO8/0NMh/RgaGw1/+Rw6wBeN36IdJdeXpFYnPwaSNprk/O3XminnXNn0QCwfI9rpHlyF+2xs3Ct6JC1DhyciSY8VC+DC0/YS8NGzRp7sURSFIMFZQRYeZ4pLVZZ1feWLG//vEAvuKJ3p+ra5UXLfEAcXr5umRSfL5vOKdQVlna4SqhKfIQ6jBzo9pt/wHg2O7cbFV+rQSSHV9rJb7F7rCl5YQyVSi7O27vTRFhIkLSKqXWv6nsNuj4zQzUZGR7qZyYjQtIXs8FlaYxVX2gZDYDuRKiqLwOeIdq6rhNdXUZWYsba7oqIjMznIHGRFfEKRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx4Xt6v0GbPb7apXu0l1/Mq7Mv9HG4RZ912ZZltaos8=;
 b=IVAPjnKEOP9tIM1nQCsfenELcvI+OdUQHXK4YFaj4aTrpPcTDL4/xXvK/lXeSbu8fVsYn22LPoJSzzrWjFC7ogoJPzYJaYm0wTKcXBHU4urr3qRqXY38PyKikXbmPfBCyTXzRAS/V3HeuImqxeAJjrITWA6xJ+uk6H7VinVSRxsnwzqnh32oGCUPO5ViIbw1r/r7/Ofh1HqyNxr427voODlKXhcB1j+i2deF4j4MfSvzQlQcEp4Xr0memUvhx7ZC0yFy1mw/kEsWTN9KWRdtUQ6/fCaSNTwjml25xj6rQp5dtG85X7XgAG4MSTYnhRUZNsIYzIdkoraWHXAccOm6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB7702.namprd11.prod.outlook.com (2603:10b6:a03:4e2::8)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Tue, 21 May
 2024 20:26:33 +0000
Received: from SJ0PR11MB7702.namprd11.prod.outlook.com
 ([fe80::efb1:880e:6b09:127a]) by SJ0PR11MB7702.namprd11.prod.outlook.com
 ([fe80::efb1:880e:6b09:127a%5]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 20:26:32 +0000
Content-Type: multipart/alternative;
 boundary="------------yOgsx0swwMuSQ4FVcg00rsDc"
Message-ID: <f41eeb36-1367-4b9d-be69-e09dc5e01455@intel.com>
Date: Tue, 21 May 2024 13:26:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Properly handle alloc_guc_id() failure
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240521201246.4749-1-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240521201246.4749-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To SJ0PR11MB7702.namprd11.prod.outlook.com
 (2603:10b6:a03:4e2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB7702:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 70bb3beb-0ce0-4f19-6330-08dc79d44dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3ljQTlYN053OUpGY0RNVk5NeUNjRUhWWktuY0VjNjd1TWV4dlFoc0hNdTgz?=
 =?utf-8?B?Tm5ob3FodzRnMitsa2RqTU9Gcm1taUt0a3Q2aVlVUWZYTGYxc2xITlcxb2dF?=
 =?utf-8?B?emZLQUttWS9BTzNKM1VGVjlPQ0M5YzcwMWx6bHBTa01vaEVuSHV1SFpJVXVa?=
 =?utf-8?B?OFU1OWFJdk15RERvRXBVK1BzN1RZdlF3NjZRNG1IZENBVXYyV3BpZWMyZEZO?=
 =?utf-8?B?MlB2UG5iTzFqRG5zMEVMY2tCeXdnMjlwQ09IcnBxaVBMMTVBaTNNV29MVkZD?=
 =?utf-8?B?d0FEM2s3MGJvakp0cXZnTkNSdlFVWTgyaUJtNmFERnpJcTBiUDBPcVc5dkJM?=
 =?utf-8?B?ZTRzNkVKcytnc3dVODA1V1hQc3hWRU9lSlpBYjljRU1sb2pXa3ZHRmh2djUw?=
 =?utf-8?B?NEcrSXdKYTFicFlUcUhndjRpbm5wY2ovUnVmdlAySW9iSHcwK1VLNW9zQlNI?=
 =?utf-8?B?NTZiZHpJbnlIT0duRFUzZHpPTHVxTGF5N0JyV2RrMExkQ0J0Z05CbExheVRa?=
 =?utf-8?B?MmtNU2c2WkFYQlVLY2dFMHdnMyt2UkZEZ0tvcy91Nzhqcld3anNHNW5xS0xn?=
 =?utf-8?B?NHZ2WVlxSjdKYitlTVhqbStSVnBHNHhlNGxTWHdxaGZyT1dCbHZ4K2l6d0Z1?=
 =?utf-8?B?SmxZbFZTTS83Mkp2YmZtdW9iK1dkSjhZWFNYNHlvdjNYaGFCcHRYaUJNbVdU?=
 =?utf-8?B?b2hTMURDenZjais0ME5kWkVXTENoVDFQb3cxbXB3SENxK01xUXN3L3QycUUy?=
 =?utf-8?B?SDVoZ3U0cSt4RGVsTjQrU1ZON3lmc252UCtiMTM5eVpHNGRmUEhDOURiU05I?=
 =?utf-8?B?QUpIQXc5WW5Hb3U5UmVNc2VrVTM0TTdBNENDcXRvcjRrV3g0c0ZiUGJWUVIv?=
 =?utf-8?B?MkxhakRBOGNPLzJhSDY1Z2hmRGliWXp5QWlsRFBKZTk0VDliZ0pSeGxMZldY?=
 =?utf-8?B?SXM5WTRkK3h4WlhGVms1b1gyRVpqdWx2YkJob0ZBZlVsRmNqbVBYVkV5WDBz?=
 =?utf-8?B?SGtDeFFCRWM3M2xCYUsyTU5RbVJwZ1JPQk9ramJ2bTdUOG1IR1k2Qnh3czEw?=
 =?utf-8?B?ZVFoL3lGaHdId3Q5S1lIN2VTbWU3K3RwREZUcU8vUXR0Y3pWMzlVeW1NMlVj?=
 =?utf-8?B?cEFLSHRaRE42Y1drR001eVNjdlE5bTFFakVick9PblQybk5kdCtJUXRlRTFP?=
 =?utf-8?B?VUc0c0Vpc3UvdlhraldybnJDbnVIYTlsT0JBaDBGOHdUdklKSmk3djFWcjFT?=
 =?utf-8?B?NHdyS3JMcTdIblp1QTZEWkNwdzVpelpPazdxdmRrcWVjSmFyUVhWTXJRM3Fm?=
 =?utf-8?B?T0d5TkhSZjlWcVZwaG5EUDVsbE1kTzlTWTNyZFF0eVluQ2pPWlI2SFU3VFpY?=
 =?utf-8?B?NHhyTjVJMTZUNnZ4NHU2b3VOLzF5WC9zdXFlaG00cEJSd3UyQzlTYkRhcDJH?=
 =?utf-8?B?RHhGMSt0dVJuRUdBNzhiK29jNHdSVjRmZkxtTWdaNVpwTUxFcm5JUFZGRXZn?=
 =?utf-8?B?WFl2THpoRno3Q09rWUd3bjF6dy9xWDZ5S01JQkh3d0tabjBwTklrTFFLTnp4?=
 =?utf-8?B?RkVpWlZsMzBQajNJMG03VVBXczRKVzc4S0M5ekVnallEWlJua2dFazRaNkM3?=
 =?utf-8?B?aStzVVYzTnRqN3JsY20rNktEZmxKU2VZSHNVTzZUSElTeHRBbTYyUUlSRVdp?=
 =?utf-8?B?c3dvcDYrbVJSVG9XK2xFWHowdFd3Q3BaSEQyS0hDZjkzUGo3RzUxRzBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB7702.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzZxbjdHS3hWVTdINFlTNXpmMmZiN2Y2SmRrRm95NXR5a0UvTVdZR0pjLzE5?=
 =?utf-8?B?YS9tNXNJNGpaVmtMdnVEZ1lYdncycGhKSlBLUEJhWVMwVFFkOWhnbStudGVm?=
 =?utf-8?B?SjN0UUhPQy85Z0ZIdDQySXRGRHdQeGxGcGdsR29JOTNVZUd2TjJaak9iSnFK?=
 =?utf-8?B?YTFldVBDRUNGWkcxV0pSZ21PV0tPVnBQaGhTK2xFOCt6MWhqUU9wMzlmdUJu?=
 =?utf-8?B?V3R4ZG9XaWNmeGR0TzdGb2lKaWk4aFB3OVBlWExBVWF2cTdjSU9IY2VFSHlm?=
 =?utf-8?B?VGpBZDRUNlo2c0J3SWEraUI3M0lVbjBoYS9FcDcybitrMW40SlZERkxLQWRW?=
 =?utf-8?B?Q1hqRGJ3RWVWNEZSVWpYWVpQTGY4Vm4rdkJaQlFxbnFiYWNqSnB0aWgxdHNJ?=
 =?utf-8?B?VFBZTjJYcXBkVnNEd2ZzMGhNajRac3VISUJQMUhCaiswL1kwdjBmMTFFUzlu?=
 =?utf-8?B?S3kxaTRSc012b0IyMEZJUHBWRFJRL1AxYm1TdTJJNkdqc3hnb2FYVDBUMDNZ?=
 =?utf-8?B?Mzl6dXJTL1d4OW05RGhTNjJOb0lybGhhVU0raEcxRkJrYUcvNnEwNjRQSUdn?=
 =?utf-8?B?NTFuUUJTRFdhY0swdzNIeE8rc1h0ZXhkY3NTRGUxb01SWlJrcUMzb3RteUh3?=
 =?utf-8?B?QUhKbFA1L0VGcHNiRlJyWGJ0UVByWURMOUszem0yVHJtdzRYNlUvcGdZMW5W?=
 =?utf-8?B?UFBBQ0owck52NEZDSlE2OEl1K0NSajZ5TnFZRnVBNVg5OU1kVUNyY1VJSHRO?=
 =?utf-8?B?MDFmd1diUUlqUzZlc01KL3dvS25BR2haeVNkUzNCYm54TVFJQ1JlNEYzblNG?=
 =?utf-8?B?L2YwTlQ2V3RrNmtzNlN1TjNUSDgrM3hMaDB6TVk4MlFoSFcyRW80UHpSMWhC?=
 =?utf-8?B?RGUzTmZKaDgxRDhSODYvd0pNaEovSEltS2R1c3FZOERxb0dyWnNvYSthMHN3?=
 =?utf-8?B?azBVNVVBbFZCWkZGNWtkOC91S09JWlFidk5nUWIzUzUyTWxrWFNTbytsejdB?=
 =?utf-8?B?Si91VlhPUHNKc2U4Zm1yZ2ZuQm01M0tUaThGREVTcDJ1dWNZR2Zra01BdW94?=
 =?utf-8?B?VUxGQ3dBa0Z3N1JXU21WK1lNTWtGaFlidGs5TG9sUlhlaFUxeVNLWlBMeWNo?=
 =?utf-8?B?Ykw3VXBETk5VRVVLSEZmeVZXblphWVBIVjVZbXZQWS9jYWRmTkprKzZnK01i?=
 =?utf-8?B?YjV0Y2M2YmlyTjR6WHhiTXVFK1Bva1A5SjJpbXQ0c0QraUpncXRiQlBFT2ZN?=
 =?utf-8?B?aTBIczFwNkk2STNZeG9rVjI3RmhqMG1Pb3NYd1RWRGRkcUYxQmQ2bjNmM05h?=
 =?utf-8?B?R2U4Zy8vekk0NGpaRmxpdkJxYmpURnZQM0ZIYUdDa1J2VTlMWkpyQW9WRmtQ?=
 =?utf-8?B?WE5vZTRoK3FnQzFBRldvUncveTdZbUFaVU93d3RjRkpaMGpwaFJzSFNrZnBS?=
 =?utf-8?B?a2ZaMXU3c0xBSG1ZVGwyeUg4WDZHdkJBV1oxRkNNNUptRkhiV2V4Uk1qNjN5?=
 =?utf-8?B?QkpQeHJGYUk2WFRDSEQ5Q0llL2daY2tlOVFkYVR5NFB4NWVpa0JoYUt2UFVP?=
 =?utf-8?B?elkxMVdvUHo3TEdJS1pvTmhaU2QwMFdpMHRwNlgzWkRmclJVaGVVODJpWU45?=
 =?utf-8?B?MDhYd2QxQkN3Tm50UXVOMnJrSHU4cmo5RzJTUXJHVmx2U1NuWURFajJ2TlRp?=
 =?utf-8?B?NHV3R0ZaZXY3aG1LR25WRElXTnNFY29Kd3ZFeTgwLzZDZStaQ0s0WlIzZGp0?=
 =?utf-8?B?Ujk0b2wwdnF6N1FrRVNkWDNqQ01OTVhkbUFXTXhoZ05MMllYRVhYeHQyVDZK?=
 =?utf-8?B?d0JkMDA5VVNnZUswVGJDc3JnNGxyUCsrR3VxZjBuaG9TWkRkeGszSHl5aFM0?=
 =?utf-8?B?bFVEeVhhOTFORkdYSFJPSXJuSFQvbHRGak5CVTVwamRKaE83SS9YOS9IRWNK?=
 =?utf-8?B?cndVNjBSVnNaV2YxWGs3cFRpREpuWVpEcHM3cVJUMmIraGwvNmw0N3BoYmh4?=
 =?utf-8?B?c0RNck1rdWpSRDRtNitqc1MwTStJSklRL1VzZUlqN1lpMlVNd0VCbFRaWXEy?=
 =?utf-8?B?cThTWXVjUTNEd1hPTU8vTnFTUW5ic3E4S0tER2xjYW9Pd3VqeEFHRk5ITUxq?=
 =?utf-8?B?UThJdG1UOXh0M2MyUkVrQ3hXUjk2YTBuVmxBb2Vod3hCbk5CMnp4SEFlTlBj?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bb3beb-0ce0-4f19-6330-08dc79d44dee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB7702.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 20:26:32.8325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpbH+SAOphc3sdSNuICATEhRcnGyFuEn2LqHuxBp7qgIWnRdIuCWOm82X2bJBybEIT/OM8of2cffzjnfH6iQe6tSJqFWiPFhKnL9Pg95jeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
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

--------------yOgsx0swwMuSQ4FVcg00rsDc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 5/21/2024 1:12 PM, Niranjana Vishwanathapura wrote:
> Release the submission_state lock if alloc_guc_id() fails.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>
> Cc:<stable@vger.kernel.org>  # v6.8+
> Signed-off-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
> Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>
> Reviewed-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ad2b8067d071..c0b901c5565b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1304,6 +1304,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	return 0;
>   
>   err_entity:
> +	mutex_unlock(&guc->submission_state.lock);
>   	xe_sched_entity_fini(&ge->entity);
>   err_sched:
>   	xe_sched_fini(&ge->sched);

Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

--------------yOgsx0swwMuSQ4FVcg00rsDc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/2024 1:12 PM, Niranjana
      Vishwanathapura wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240521201246.4749-1-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">Release the submission_state lock if alloc_guc_id() fails.

Fixes: dd08ebf6c352 (&quot;drm/xe: Introduce a new DRM driver for Intel GPUs&quot;)

Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v6.8+
Signed-off-by: Niranjana Vishwanathapura <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>
Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Reviewed-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ad2b8067d071..c0b901c5565b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1304,6 +1304,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return 0;
 
 err_entity:
+	mutex_unlock(&amp;guc-&gt;submission_state.lock);
 	xe_sched_entity_fini(&amp;ge-&gt;entity);
 err_sched:
 	xe_sched_fini(&amp;ge-&gt;sched);</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap=""><span style="white-space: normal">Reviewed-by: Jagmeet Randhawa <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a></span></pre>
    <blockquote type="cite" cite="mid:20240521201246.4749-1-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------yOgsx0swwMuSQ4FVcg00rsDc--
