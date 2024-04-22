Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63021C10F16
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 17:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1509910E3D9;
	Mon, 22 Apr 2024 17:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRf63LaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A87810E3D9
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 17:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713805346; x=1745341346;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2NYQUhK8/9Llj+SePgf9b3RMc0t2KyXCTClCAuEKG6s=;
 b=DRf63LaONNZVDxjdZsQWbG7vS/GLPft48SKVY3pXbBCaqtEiZcp7Ki3J
 PCS8WWM5fYQjSNjlXOvp9KT1/W7MJMlxWlN6dAnznb/vyojPiIikjzUpT
 fCHGfoN20vFRhiR1U62K5pkht/Grx2OfNh3FRtmD0DASnkMIZt8pfuWbD
 2BHKC3CyYVNCovl2bRfwViZIZhwiqcko1ajAcx8WJwiKJsE628i82/Obb
 dAomnxXrQAdgrWgISEAC7F+vYNmBdm44Dg/obWEvXrLw44kRSeSzxV3RT
 tXmcv8nOMWu16EuV7tKC7XzQJKv3sJKlY7jFE933HU8BqKL3wAzavKsGx w==;
X-CSE-ConnectionGUID: Y3dUeXvqTgSYEuUUR/5c/Q==
X-CSE-MsgGUID: S2wQ9lzfRj6Mnw2Yl7vzEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9476824"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9476824"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:02:25 -0700
X-CSE-ConnectionGUID: IOLrwA2XTrm21N441r+hyA==
X-CSE-MsgGUID: zCv8McYrRWec7NrovM/uog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24520374"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 10:02:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 10:02:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 10:02:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 10:02:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 10:02:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwoXIUFEJQZIxrvhw5+gyS9ueD63h4ob/AToBNaJAF6bynLgx15+zzsEIfaXCMIQ/59LhfCrIrqj6/Cd3jnSFZDEThBu9/hgUyMgRDKoAHG2IDBVPX90VyreflDmx8iZJU/ywdQLndaL2o54VdvOuoYRiUCdHliCVtBfv6oS0S+26AW1Qg8iyBKUrh0yD1mHmKQ2l8+s5ThWdfeGxLhIJ5HkKf/nG93i4UNJ7/IuuY6782ktOPJQm5njlqEFQcBo/gKQwoeF+DSUWLKQlAT0tnzNO8GPpGQKXirAVKBMUFsSYb7SFcj04viFL8/AEPR0npcN2wmuITXzb3uQl5wiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz0hHVuwG0y8kVt+8WYOsnHbgVg6S3Gnkhg3l5Thp5A=;
 b=fVVWb8/P6gmuK/hIYyU+aBuSai6BZSN5H265YqEjdHSJZwH0jvkZNxvAAN+bjY532sIOUWCKpepY83Foz61g+w6Yq+bAyJS5GOd256gnnzdQ+XOFVeRcI4qumXVIMz8CeX6vm+hS7isc/Dy0zupjjOeqyx8tYkFo1cqjRScYMSuy5tXsoHjblK5qXPRtN7pW8djVp7RsmkOsbFFXgsBYXmp0Qk3DfGF3qqWSAPTcO5cV9pUO3PRrSWKlzeXo4u39A5mbqyOqbuMPs0owzKtVZAfItvPb84EHkFAb1PdiYqYmKzSe4ylk2K7xMBY5fKykO7piNGCRUPoDDTXXJWo6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 17:02:22 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 17:02:22 +0000
Date: Mon, 22 Apr 2024 19:02:19 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pf: Expose SR-IOV policy settings over debugfs
Message-ID: <20240422170219.6jbgcvfjcfvt5tlw@intel.com>
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
 <20240418203442.226-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418203442.226-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: 03eb76fb-3838-4b0f-8fda-08dc62edf9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3h1NU1xZCt6QUVtVzJmTy92L1BrbzVhUFp4eGgvcm93OVN1cHhVMkIrM1JQ?=
 =?utf-8?B?SXhhVmZ6NWxXd3lMZHVoVndPSnFaT0dXUmtGU0xBeDNyUVIzdG5tLy96c0w3?=
 =?utf-8?B?Ym41aWxacjFqREc2aE9VcTV1QndnTUp0WnhlaC9qV1FodUpKaTdKSm1EanNy?=
 =?utf-8?B?d2dobDNVaStFb0FYNHFqcUp3bGRGY0RYK1BTRTRiSGZ0b240VkxzNENId1Fu?=
 =?utf-8?B?N2RRSkkvRkVZV1FPc0N6Y3V1amhGZlRYUG1BN1h4OWFxL25KVmxhajZQeWxl?=
 =?utf-8?B?eEkyN1B3UjlBcUl3dFFsRzZwT3ZuNWNBbUtiSFhxRzNScHhWUXFZVmowdTcy?=
 =?utf-8?B?d3Bzc0QyOVZhNzFxVmJ2djFmWkxQeFdsT1pTbk1zL09iWklod0FVOWJWWnlY?=
 =?utf-8?B?Rno1MnU0SDJYZmpia0oyOE0vTjBpdlNrdHJuQ3VSL2lHVm91aURKcmhwU0Vv?=
 =?utf-8?B?aEJiSjNvMStWd3IxTU1NN2VESHViRHVSb003S3NNYjBJQ3JDTTNjK0NZc2JF?=
 =?utf-8?B?ZDlpWDljNG1EMnFhWUxqeWNzNXF4MjNZeG9ZODFaYS90azI4SVVKZE1uc3Zs?=
 =?utf-8?B?dU5TMGkzNWovRVZ6UERZUUQ0RkhkbEUxVE5obElYOGszRUhMODRXbFB3VnQ0?=
 =?utf-8?B?RUtxVUZ2OU5QdXNSamxTMWM0UjRwRWhnU2VYS1ZXSmtkRElFWFlLRXdPRUhK?=
 =?utf-8?B?ZVhqQTYzcWF4YmhVU0tRZzduMkxMeHR5WkFrUHBiR0lTc3Zoa2lPL2xvczZk?=
 =?utf-8?B?VHJXaGxoV1c4OHFUcWVYZGRkdklTNlM3SGNiYWx3RUFQVG0yam40Mk4rTW02?=
 =?utf-8?B?enN3SGNXYVJRWk5yZklNNENsL0VvQ3BaTkRaMGFaU1B0ell3Ynd1UGEwVmNP?=
 =?utf-8?B?eHRoZWlsWlEvVGQ0eTJxVk5JdUVUVDNCRkRLTHFZSWdFR2NtdkxtT1hCSVVC?=
 =?utf-8?B?WFovS3NUaDZuK0Y4eTNYMnNkQzljeENMWi9xRnlCVTZvZzRXUUxwNzl1amo4?=
 =?utf-8?B?WHVRSmJ2ZXZQM0t0dHlpT1pMeVU4T1ZFLzJvYzVHNTlGWVZhSDMyWHRVQ2tz?=
 =?utf-8?B?RTlPRS9HQndwdEhlYitESTF0OGN2cVlGQlRmMWZ4RXpMRGk4bHZjSURIOVFm?=
 =?utf-8?B?M1dvcld1VVJDanNlaFZPbm1aaDlKWTJMQVJmTUV6bzFvYlNNZlYrb1VneC9y?=
 =?utf-8?B?VjRaTURNbGppYisvc2E1VjlEYTVocVM0OVVTYzdtdmRuekRpV0tFZ3VvQVhS?=
 =?utf-8?B?QUNtSWdSWEZJYXh5MVJwemJiSjFPRGpjVy9VWmI2S2o4ZmJHcWZQdEozMmxy?=
 =?utf-8?B?cEc1cUFMWlJYZCtCWDA4WjJXNHBaK09ydEtoRjJQSkxQNFp4M01GWWtpUDZ3?=
 =?utf-8?B?UTZFamdsaDVReXl1MDZ3UmFvMFpLeERDWTJWVnl4WWRwVURveXRDcnpwMEVW?=
 =?utf-8?B?MTNRUis2N1g3R3VIZTM5elY1akg3WXhkQlpianQxemF3Z1lINGZnZU5KQ0Vs?=
 =?utf-8?B?NmZoMmxGV2JKM1JGTmdzaTVibkdidmxxYm1NUHMwdFNuaVN2NzRURmdzM0cw?=
 =?utf-8?B?UkQ2YStEVnRhUlBvZyt4UDFqTGRPZk5kZXU5K2wrODlscTArK3J5a3F3ZVBj?=
 =?utf-8?B?MHZ4ak9JYTY2N2dDNXdEYmNQT3liUE9iQkd0RE1MUXlsYlNPajZCeXZ6NjV0?=
 =?utf-8?B?YTVvand2ODRrU3l1eExmcm91NXpmSFVrblJOaUV1RXQ0YUlTU0p2QUFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2NPdU9HbGpMbDRJdURYZStaSCtRbjNQSzhqMDJWeXZFY0NTdUFNZW1oS3Ay?=
 =?utf-8?B?RnE4M0xvNndUR3c0WnA0RHdWOElna0NyaHpRWGJxVFZWRG41ZDI4SDdLSU5R?=
 =?utf-8?B?dkFXL1RXQ1lLZjJYaEFsMEQrZXhnVk5aazc1N1MyK2N5ckFXWVZ4N29KTUxH?=
 =?utf-8?B?WmduaWFYbGxKeTZEekt5UlN4T3pzaGVYWkZNOUVoMmdPcmhoTlZnZGRzL1Iw?=
 =?utf-8?B?UTNsM1ZEYmtodUFFNm5tckpieEZkQ1FHdkJYQTN6UzQzMWFPVjZLWDNrVG5K?=
 =?utf-8?B?ZWdlZlBQd3ZqKy9vTThSeW9za0c3UmhYem45NVc2djE3TW9ETEx6UTJWYjNT?=
 =?utf-8?B?R3JYK1pQUm1FZGUvcTZaQWE5bndFdC93MExRcFYyUWF1TXNkQVBiQ1pZWkpx?=
 =?utf-8?B?ZkdpZEZIMVFNVGdxclhxM2puUmFWZ3pXbmZEd3NKaW9JazMzUGxRKzlIaWdQ?=
 =?utf-8?B?R2N3Z3BTUytWdnI1UUlRVEQvc0FWQTBKbi9Ia3BJZWpsWENBUTFCOHY2Yyt0?=
 =?utf-8?B?UENoU3VTdVpYUTdtUlUzOWpaUTdRdUtGVE1xbHRiTnF6RTZlcVF5MUpqcDdO?=
 =?utf-8?B?cFI1ekszdUplVTYwOWUvUzZNU0JHdWhXdXVPdnlQT1RCUzdPR005Skh6SkJT?=
 =?utf-8?B?UmNiUU8rcFd2eWkzam85NWswRXU4b0ttQ3Y0TWpqNEVodUJXUDMvcDg5c2Fr?=
 =?utf-8?B?T21QUm1SdnE1WGpYL3JCV2oramJOeGNGOW1OTVl2Y2dmMUF1NnhkQ2VuRk41?=
 =?utf-8?B?c0FBSXlFRWNlWTNWM2hKK0tJYTlMOGxoSUk5dmE4MGlFQ2MreHk5U0kyQkdt?=
 =?utf-8?B?cDFOeE1tTUsrNlEzNVg3cVZhZzB4aFlCbFVRbThoMmlXZ0ZteEthOVpkNndt?=
 =?utf-8?B?SnNYMDdkeDRQRWhSTlJnUTRwRSt6Qm15ZllrRnJpc05vU2JUZXRYcmhNS3Yz?=
 =?utf-8?B?ZDNLazJBck1nQ1IxcWFGMkJTMUJnUjE1T0RIazJqbnFKeUgzSjdPWWozWEFD?=
 =?utf-8?B?eUxiL0diUnVtWUZLeFVHWUt4RVR1bXRBQnBIUG5xL2FqeWhmRjRsVlBUQUxk?=
 =?utf-8?B?SkN6ZkI2VlJPK1hWLy9VNjBScjk4YUpwUEJsNm42N0NrZ0VrS3NJN0V5WmhF?=
 =?utf-8?B?Ykx6aThoaVZ5eFNaRGFFdGZRRm13SkgrVjVHcHR2R0lVZkh5anVSbmdxK09I?=
 =?utf-8?B?WmpuWWNzZllhRjJJL0VtM3oxd0o4MWZ2YndGVDVLWkwxL3paNThhR2V3QVp5?=
 =?utf-8?B?dzdPZjh4SnBJaUpLeU5aZnFRNHpPblRkSTgxV2RSQVIxMHE1RlFSYlRKTWNq?=
 =?utf-8?B?ZzNvckNMc0s2aFZGRGJZWUJqMjBsbGtoT09DYTZNa0xYV3hwSFNyWVM2LzM2?=
 =?utf-8?B?YzFFSkh0dkUzRi9XWG9tQit3TEIvalNhaG12YkRqazRwSEtUbkY5bHhVclg2?=
 =?utf-8?B?c01Fb3dFdStSOVdTYUdnMGZXTW1OZnRIbTJCMFRUTG4ralF6eC9FSDBzNHZx?=
 =?utf-8?B?UzZzL3FlNWxycUx1QmtXQWQvRUVFNS9VVUExeklheHBGZE9taTNYa3VoTGZi?=
 =?utf-8?B?andGOWpqNEpKWmhzUExwSHNua210ZUNPeVpKWWxuOE0vSVBHWWFIcnZNSFdi?=
 =?utf-8?B?Qzh3RXhTS0ZWQTdIZlM4ZU8yelljL0g3cmxrYTFQdEpUSUltRDNzOUtjZlNI?=
 =?utf-8?B?NlF6Mm4yNnZISkdtL25aQmFpTzRFQnprczdrVnAvdndBRk9MWlZDSy9LTmJL?=
 =?utf-8?B?R0RYRFp4L2Voc2tzYmR4R3I0ZlRKOVBtNXVsQmJyVld0ZHdmYUcvK0wyWnov?=
 =?utf-8?B?OWZwTEl5a2E0OURTaUpZT3IveWhqKzFxbjgydXhnOXp6ZmhTbTNmNFp2K2hu?=
 =?utf-8?B?SjlXS2tocmhZL3g2VU40b1FGVW9OZUxONnFHYVBSQXFGZS9DV2Z6QzZSZFgw?=
 =?utf-8?B?OGJoVTVvanNGcFBiKzc5ZENkQ0xBM0FUU0lHd3kzdnNMRmlGQ1hVRXYzb0x1?=
 =?utf-8?B?TEIzdkI1Z25oczJyV3F1SDEwTU9HbU85UmhnVnZuUldGRWZxZEtYTlppZXI1?=
 =?utf-8?B?Ym9kVWhsYjJnVFI0Sk8wVUxKYVpvMnRQdXZxV1dwYTJXMCtNeGxKRURZdktU?=
 =?utf-8?B?TXM3N28vekFtbFJob0FxaVZCU3RTWkNmQVdMQnN6VHJWOE5oL1d5allyMlpl?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03eb76fb-3838-4b0f-8fda-08dc62edf9dc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 17:02:22.0632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfWAzKdledBSAmuYMr8NZk8/PSkaNz1DUExDgWHU89xH3x5yzpTgUlqMU7SMuolINnPoGnxW/Q67CC2JNxq/1qoNLx577EU4eJ1Fj3q4/U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 22:34:42 +0200]:
> We already have functions to configure SR-IOV policies.
> Allow to tweak those policy settings over debugfs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 50 +++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 8909bb950a8b..3a83af7aa039 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_policy.h"
>  #include "xe_pm.h"
>  
>  /*
> @@ -76,6 +77,54 @@ static const struct drm_info_list pf_info[] = {
>  	},
>  };
>  
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── pf
> + *      │   │   ├── reset_engine
> + *      │   │   ├── sample_period
> + *      │   │   ├── sched_if_idle
> + */
> +
> +#define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT)		\
> +			
The same as I wrote in e earlier patch, only here also TYPE seems unnecessary.
What's the point of creating a macro with parameters you don't use?
\
> +static int POLICY##_set(void *data, u64 val)					\
> +{										\
> +	struct xe_gt *gt = extract_gt(data);					\
> +	struct xe_device *xe = gt_to_xe(gt);					\
> +	int err;								\
> +										\
> +	xe_pm_runtime_get(xe);							\
> +	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
> +	xe_pm_runtime_put(xe);							\
> +										\
> +	return err;								\
> +}										\
> +										\
> +static int POLICY##_get(void *data, u64 *val)					\
> +{										\
> +	struct xe_gt *gt = extract_gt(data);					\
> +										\
> +	*val = xe_gt_sriov_pf_policy_get_##POLICY(gt);				\
> +	return 0;								\
> +}										\
> +										\
> +DEFINE_DEBUGFS_ATTRIBUTE(POLICY##_fops, POLICY##_get, POLICY##_set, FORMAT)
> +
> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(reset_engine, bool, "%llu\n");
> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sched_if_idle, bool, "%llu\n");
> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sample_period, u32, "%llu\n");
> +
> +static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
> +{
> +	xe_gt_assert(gt, gt == extract_gt(parent));
> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
> +
> +	debugfs_create_file_unsafe("reset_engine", 0644, parent, parent, &reset_engine_fops);
> +	debugfs_create_file_unsafe("sched_if_idle", 0644, parent, parent, &sched_if_idle_fops);
> +	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
> +}
> +
>  /*
>   *      /sys/kernel/debug/dri/0/
>   *      ├── gt0
> @@ -261,6 +310,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  	pfdentry->d_inode->i_private = gt;
>  
>  	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
> +	pf_add_policy_attrs(gt, pfdentry);
>  	pf_add_config_attrs(gt, pfdentry, PFID);
>  
>  	for (n = 1; n <= totalvfs; n++) {
> -- 
> 2.43.0

One comment above. 
Overall the functionality is ok:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> 

-- 
