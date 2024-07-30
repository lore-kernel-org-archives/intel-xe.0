Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9996C3DA70
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 14:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1D7892F2;
	Tue, 30 Jul 2024 14:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ei2Lh8lt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746AC892F2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722350489; x=1753886489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2xIDXJC1Utr9l5UOTWwJI2PsVsYEbG1uQtwy9MqHFqc=;
 b=ei2Lh8ltntPJnU7rb5CGwNGGlBS5/EKaUrcfj4n5Hkgqn6ESw3aA+qbh
 qCnrf4kKW4CXsQW+y5iTi+7GUoCPdWMeTNRq+32u+xKtoQ9YXPq71/H5t
 LClfhyyTCPaHHA07AmZbxchg8LQ67tghPmmdEeh7YS/wSL2EUUTyR5cNC
 2CrYvwXqZvvXDFJZHsR4zLyFyxcPEXeHkw9M/yzsiU36jabuTF3CWNq4r
 tDxz/EdlUvgrtqfXz+4+kFNM9+MHqVEjxy3XKTSn4sx2jcXNueMo5PnsC
 CTRD43TqMBPlzezwGnOzRgRgBzwSWxdC1TU+zdTFQ8cQtsL8Fq4+l7vAL w==;
X-CSE-ConnectionGUID: PomhhxBhQ1aQDZzwqbNXDw==
X-CSE-MsgGUID: t9MgUcSnSSCaq+k6Z2gh8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20309613"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20309613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 07:41:28 -0700
X-CSE-ConnectionGUID: jWSNQz+LSZqgOfTPDJFVHg==
X-CSE-MsgGUID: YEbSzhLtSQS7HcbVLvlDPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58992268"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 07:41:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 07:41:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 07:41:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 07:41:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 07:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BECIM/d6/aK4b/FICV7SALTkNkXr33GObrVPOwE8cfA2QPRL9rOuBOqlxZ+7OYqR4/T0i1daOJrvbM2umtDqyFkmKrp58fGkAZv0DL3Dy1+Cb2EYRfQ2SXeCONbMC/c8WsrCieXeDnPWavyO1uBXwn3HEQd0pXcIrgOpArettDcZ518xhtKTCCxWDQvRgW1dbBh8y+h/XQDENtOmrVAldefR4MV/nH9lJ3ku6AeKMOZHboT7AU50CIvjKKkpVUfAo6yjyH5dpE6m6fYcXeC+7cUa/dKKIPEExA79HCTQU3JDa/DzzPU66H0hfj+uJnXWZqu0TjZTGx0qg15Hz1HHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBZEBDmraNnO+qiAC8DuaALnDKtBjbW+xb8sCC7I7gE=;
 b=aUkqTtaLRdN4kXDYKM0sVp6Yyr3zyFIN2V9Bi2qnA6/+nIzSIsaMIp3LglyMzqiPFA3cBett/wNPvXJtjhsEHx/OANKwRCFUUZ53CHl0iIynV2HjL7mlE9VJ4DmHG7rzR3U+NvLpYpHtSv5lT9sOQ1HNqIZqDxH73JbMP/J7ST0m3ZmoRUfa04VGI+DIsoF5mWMCr4ELiH39bhH1XGkLxbeXQzwknBlxTMbSoOwGgGzmpOPqCRcSPI39RHrhzlnbCpGGVtQWwkaw86Fy1owbdVhaeixIc1eMVC9ThUCuqkuhtfVPtiSzE2D/lQcicbd/eZ/6jWoXpDNX/0zxGwyIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 14:41:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 14:41:22 +0000
Message-ID: <e5471134-2b52-4dd1-9deb-add956e4544d@intel.com>
Date: Tue, 30 Jul 2024 20:11:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_gt_idle: add debugfs entry for powergating
 info
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20240729102942.937680-1-riana.tauro@intel.com>
 <8373f7f9-fcce-4779-942f-360fb1e2f3f8@intel.com>
 <bdea1614-6bd0-4629-83ca-61c8299a8eeb@intel.com>
 <CY5PR11MB6211FB3085793D1505BA90CA95B02@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211FB3085793D1505BA90CA95B02@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d19766-7919-4c2e-4e73-08dcb0a5ae36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGVteTExdG85U0JOOUhxSVRsRXJHN1pSMWN1SjJpQVpnNG9vOG96WUsvUlQr?=
 =?utf-8?B?MTBPVzIyUE41dE1Tc3hJMlNkR1B6RHR0YXRZaEUrdVEzeFE3VEpCcTdENHEw?=
 =?utf-8?B?NFVRTm54T0tlNkZ5ZTlrUjZwN1VPazEvR29mTG1UWExSdE5jZmJva0I1a0lB?=
 =?utf-8?B?ZXIxa2JjM0tPVS9OTXVxTWswTC9oUTRFTE96M0hBU1NSMVdhZXFiMmtQQ0Rj?=
 =?utf-8?B?bEU3c3lBcjdWcERGdm5HSHU0Kzl2akFJVzBBanJ4bVBxazVNRitoVlc2L1I2?=
 =?utf-8?B?OEFKRTFNU3E1OWFERnJDL2dueWY4YTBBWkhqOEc3T1k2VFIxeFZicDdIc0FZ?=
 =?utf-8?B?djB0MXBEaWhoN0NUdzhJamU4cXZtMHpaMHFKdGN3empiWko0VENTb0ErUXJJ?=
 =?utf-8?B?YzYzWlJYN2VKQUZrUm9YcnBaRHFhSXpjcGt2aFhhVWNXVkNienEwRFV6STI1?=
 =?utf-8?B?WUlkRnAzVkdYVTlSRE5sMURqL3hRQ2ZnbHFLaSt2NENQa0U5dzJjVE5LTUpa?=
 =?utf-8?B?ZGY2cXhQeUdtRS9lWTFwcXF4N2h1V1g0eXArSXNBL3k1TE5JVnFuYlgrT0sr?=
 =?utf-8?B?NUNvVm5qd09uR2lEMUZIbncrd3VsWStKNlc3TWNIazdPcEVCUk1KdUlVbHA4?=
 =?utf-8?B?enpjV3d2dU03alFkZytZbVJISCtjaFVxVnJpVWswYlVhVnlPMWlldi9INTEy?=
 =?utf-8?B?QTZxYWFrMWRDYktmQ2dGY00veGl3ZWt4a3VObU1vQTkvU081SlVQSXEwcEhU?=
 =?utf-8?B?WGpVOURBUzNvSWJzbTdZVmlxeHpSUUdOT05yTUtCMnBQM0puQ2NPWmVGQ1A1?=
 =?utf-8?B?TEZqbkpadGNJN1R4dldZT3VmcDhNcU16Q1k1QnBKb2pjTWY3dTh1YjZjME5D?=
 =?utf-8?B?Mks4V05aR3FEMEZpMEFaUGFrSHFiMTRuNDkrYnVhd0l6ajVvdlZGckhCZU0v?=
 =?utf-8?B?TXRqTXM0RG43Z0hJOFE4SVJqaVpwbDFkYjhNTGxqRE9Ba0x6UFBlcHlkTnh4?=
 =?utf-8?B?UFh0M050WlVYZ0x1TlBHOE0ydHczaTdQZ3YxdkNwZTdsZVpySW5aU0tVTlp2?=
 =?utf-8?B?ak1pSUMxVGEzejZMSFRRYU5PT0FGQWliN1NRdEdMb2cvUHBKMFMrNDhZMFA4?=
 =?utf-8?B?OHVPTUhGQ1ozWHFtZ0Y0bCtLcXJyS2lQUmVFbzF6Qk1paXRabURwZTFpeDl5?=
 =?utf-8?B?M1dYU1cvZDFrR05henM2L2UvYkRUcTdKeDdTN1lZWEpRRytWcnF6anFiQm5k?=
 =?utf-8?B?YlVqdjMxZjhnUHVUd25EMlBUaU9hOTdETEI0V2JZZUY4dFQ3eDU5emRoWHhU?=
 =?utf-8?B?anhrNEw4bGcyZGIvdldTdGQ5TGpVSk9Fb0ttaWJEYmJmNnIyK2tKR3RTR0h2?=
 =?utf-8?B?ajVPQ3BDdHhsc1JTaDhzbThCT1lQYWtGZHhRUG15NGk4NzhIK2dLYlV2VGRl?=
 =?utf-8?B?Q0ZjNkRpSEEzOVoyamhmbjR5aC8wR0ptNlU5eURYbXRhWE9OMGF6YVpod3lP?=
 =?utf-8?B?VHVKMXN3ZkhlQlpFQlIzUjFmclJDS0ZFaUZFRGVmVTdTQ2FQUWlLaEcvR3VR?=
 =?utf-8?B?b1RoajlxRmdMNWVWeWhBTVRNUWJtVjBnZFF0THhuUkw2d3FRaVRmUDNYUkJT?=
 =?utf-8?B?RDc3MVpTenRYdnVyY2FYdlZDVm9Hcmc4bURDczVWbWpmemcwVkRoTE1PMEZi?=
 =?utf-8?B?SWdFWGpwWEEyWkdJREtBMjFGd01tMzdhUGliOWYvVUJjWkszTGNLREpjdnhQ?=
 =?utf-8?B?UHBTcU5DQkVDZGhPR3I0TzZHVnVNaEhienlONjdSWTFlK0lWMGd2WnU4MjFS?=
 =?utf-8?B?UTFEamhaa1h0MTVvZEYvdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25uNi9sZWVEOGtabUhpcUtLL1Zwc1FNOUdPZkltOWJUejNBa3RmbnJDSzVm?=
 =?utf-8?B?U1kvNkxuSlphUSs1cXlJNWdxaXIzODIwM0VTbGgvRUpNZ2VXK04yVnVRS1cv?=
 =?utf-8?B?dHRTblNzNjd4ZlMyZ0RSM0dyYStIWENzbk93SVFzZEdkVEhxR2x4amlYQ0w0?=
 =?utf-8?B?QTV4NmFOUzZkN1ZnMFIyMmZIMU1kL1dCL2NlNjAyV0ZIZlpJOGVxZDB3SmdJ?=
 =?utf-8?B?NTRYN0RPS1B5VFZRQ2tzZmNMaitERGdwVEVlZ216ZDlPQ3Jpa29GZXIrakVE?=
 =?utf-8?B?RzhNLzY4VEhMeVZ3czdwK1lxSEQxM2t5MTB5c3ljZXJyd3FOOUJRb1kzV0tE?=
 =?utf-8?B?bWdNMEZDbnArV2NzdHRXU29JVGNqQzM1Vmp1WjZ5ZjVSbkhBaXpUbzVPU2ps?=
 =?utf-8?B?QnhMTGpueVBLbk9qKzExa29jUGpTVTgrVGRjRDBlSGp0ZHRXT2VDK3g3a2l0?=
 =?utf-8?B?blhhSHhUWHhTL0NnZnN1ampvM2hJZWZUV2Ywc1kzOEJZUFZHV05tR1JIanZn?=
 =?utf-8?B?V1ZjYVBMUEx1TFJNQlhyZUFFVWExNGc3UWRDTzMxd3h4dHYxeXJLcElyL284?=
 =?utf-8?B?allNRTVHZTl6eWtUemRiaDE1S3JNeEpER1VicWdYN1B6WjFzNFh0UzFvNFpU?=
 =?utf-8?B?RUdqZCtYZXJxT0tsbzBxQU5hSjFiNThocFJubTQ0Y0R2M283M2UyQ1l0bkZl?=
 =?utf-8?B?RTBkcnlvY1FLRjd4RkhHcURDZThMRCtDeGpXS1cyeVo1Y29kWjUrMm9rMjRp?=
 =?utf-8?B?eG8yU2FnQTVSVGtDUG4vS3NrdkNOYmdVVytJL1grZ0JXZ0ZNVE1kUGhzTjdV?=
 =?utf-8?B?RFFKOXVUbEhkdno2TnQya3pFTGtpM0xYN2R0Y3VwUHNaVWg4dlI4Y3FUMlA0?=
 =?utf-8?B?NWpqQlVxNUUyL0JmYVoyWlIwYTdMOUdUaVltaldmdWR1UkVGVjJhZm1oUGRH?=
 =?utf-8?B?QThiYmVoc3ovREdKZzVNYXZhaTkyTytRdG5HUmVXMXNweUNUK0xlbWhaVnkw?=
 =?utf-8?B?OVRsT1kyWjNCN3dhK2NKU1pLcTRJeUpSL2UvcU41UVhuSGJLUkZaSnVwd01Y?=
 =?utf-8?B?SkR6MkJiQXJaaWhHTU9tMUlvM3RYenE1YTR6em9mK0lRR0hVOUMwZWthR28r?=
 =?utf-8?B?RDRac1hoM2lJdmJBQ1BubkIxK3J2aWVzaFBNZjJmZVZTWmFyU3pwbXVwQkJQ?=
 =?utf-8?B?aHUxeFZadUFGdFhVRG00OFk1NXR1VituVHRPQS9WcERHMEM2RzQ2MzZJajZG?=
 =?utf-8?B?NFRGMFA4MlJJeFFZSFR5M3d1ZHJGbk1vaUZCY0Rwd0V0YXQwRXFTSWp2eDlB?=
 =?utf-8?B?Nk1kaGQwVUFBT2lzNDFLWFQ4V1RGaDJaVUgrRWh6SmJIaElRTHlTckNQNWxJ?=
 =?utf-8?B?ekFzR2dKdVFZM2RvWkMyeisxUzg4M1VMaDBQaE5WQ0c2UCtzNG42YmwwQ3dH?=
 =?utf-8?B?c3BibGd2ZXc0OTd0ZVl3Mmx4ME80dC9ibzlWc1BaRzRwTUk0dlU1bFdWTW16?=
 =?utf-8?B?VkNMakc4M3lBUHlQelpkcWExOUR6b1EvdEZKM1hOR1hQRHRyY3NjWjVqckZC?=
 =?utf-8?B?dFViQjloakVlM2NsYzhydFNwNUtpN2ovcHBiWnNUWFRhOEFLK3lHOGhibU1n?=
 =?utf-8?B?WU81dkxiQlRCUjFjSmc0aUJJOEkxV00zd2gveG9GSndaYlpRc3N6S0lrN1Rn?=
 =?utf-8?B?MFUxbFkrdHpwZVhOcHBoRHNON1ZaaCtndjlUTzI5WmJnbDM4eFNpZ2FUdjVj?=
 =?utf-8?B?MlN3d0ZaTDV1NzJPN0dDR05FTnpSRk52NnhwSjRucWthVzQ1TXdHd2NwVHB5?=
 =?utf-8?B?SkdJdHZYUVNCR1ZSbUc5b2kzaVIzSzlVeExRbkVjczVyYmRMNUcva2cxUnBK?=
 =?utf-8?B?eStTZGZyRnBHMy9ISXFzaWRCYmw2VFFseEFGVmhuSVZNakVYaXpCcmE2QlRp?=
 =?utf-8?B?L2ZjKzV4R0Z1R0wrQlFkdU9EWjkzUDNPTndKN01rVmJJVXMrK2ZDVFJOMTRP?=
 =?utf-8?B?cEZyNlZmY0xQUk4vZ3A5R0IzWFBjLzV3VnVZMUxZKzRPb2FKQ1VOa0QvWVNm?=
 =?utf-8?B?ZTNRTDdvT0oyR2M0SXlKSXZtbndNWlVFSkZRV2c1NVVycTJlZWI2R2Zub1VS?=
 =?utf-8?Q?BpdlrxSH1fakQleaaIH/sGj+C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d19766-7919-4c2e-4e73-08dcb0a5ae36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 14:41:21.9780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wLXZNCEgbXLnk7FGVgF582Uv5twCwWSBvx7DAcgPczp7SWRKyC38OB1W583li/uETsV0mzxK/ZYYmhqkihtiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
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

Hi Anshuman

On 7/30/2024 7:53 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Tuesday, July 30, 2024 7:33 PM
>> To: Nilawar, Badal <badal.nilawar@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Belgaumkar, Vinay
>> <vinay.belgaumkar@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>
>> Subject: Re: [PATCH v2] drm/xe/xe_gt_idle: add debugfs entry for powergating
>> info
>>
>> Hi Badal
>>
>> Thanks for the review comments
>>
>> On 7/30/2024 4:38 PM, Nilawar, Badal wrote:
>>> Hi Riana,
>>>
>>> On 29-07-2024 15:59, Riana Tauro wrote:
>>>> Coarse Powergating is a power saving technique where Render and Media
>>>> can be power-gated independently irrespective of the rest of the GT.
>>>>
>>>> For debug purposes, it is useful to expose the powergating information.
>>>>
>>>> v2: move to debugfs
>>>>       add details to commit message
>>>>       add per-slice status for media
>>>>       define reg bits in descending order (Matt Roper)
>>>>
>>>> v3: fix return statement
>>>>       fix kernel-doc
>>>>       use loop for media slices
>>>>       use helper function for status (Michal)
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>>>>    drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 +++++
>>>>    drivers/gpu/drm/xe/xe_gt_idle.c      | 83
>>>> ++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>>>>    4 files changed, 106 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> index 8a94a94d2267..fe774d0894fa 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> @@ -336,6 +336,14 @@
>>>>    #define   CTC_SOURCE_DIVIDE_LOGIC        REG_BIT(0)
>>>>    #define FORCEWAKE_RENDER            XE_REG(0xa278)
>>>> +
>>>> +#define POWERGATE_DOMAIN_STATUS            XE_REG(0xa2a0) #define
>>>> +MEDIA_SLICE3_AWAKE_STATUS        REG_BIT(4) #define
>>>> +MEDIA_SLICE2_AWAKE_STATUS        REG_BIT(3) #define
>>>> +MEDIA_SLICE1_AWAKE_STATUS        REG_BIT(2) #define
>>>> +RENDER_AWAKE_STATUS            REG_BIT(1) #define
>>>> +MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>>>> +
>>>>    #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>>>>    #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>>>    #define FORCEWAKE_GSC                XE_REG(0xa618) diff --git
>>>> a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> index 5e7fd937917a..c623295235d9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> @@ -15,6 +15,7 @@
>>>>    #include "xe_ggtt.h"
>>>>    #include "xe_gt.h"
>>>>    #include "xe_gt_mcr.h"
>>>> +#include "xe_gt_idle.h"
>>> Header inclusion is out of order.
>>>>    #include "xe_gt_sriov_pf_debugfs.h"
>>>>    #include "xe_gt_sriov_vf_debugfs.h"
>>>>    #include "xe_gt_topology.h"
>>>> @@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct
>>>> drm_printer *p)
>>>>        return 0;
>>>>    }
>>>> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p) {
>>>> +    int ret;
>>>> +
>>>> +    xe_pm_runtime_get(gt_to_xe(gt));
>>>> +    ret = xe_gt_idle_print(gt, p);
>>>> +    xe_pm_runtime_put(gt_to_xe(gt));
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>>    static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>>>>    {
>>>>        xe_pm_runtime_get(gt_to_xe(gt)); @@ -277,6 +289,7 @@ static
>>>> const struct drm_info_list debugfs_list[] = {
>>>>        {"topology", .show = xe_gt_debugfs_simple_show, .data =
>>>> topology},
>>>>        {"steering", .show = xe_gt_debugfs_simple_show, .data =
>>>> steering},
>>>>        {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>>>> +    {"powergate_info", .show = xe_gt_debugfs_simple_show, .data =
>>>> powergate_info},
>>>>        {"register-save-restore", .show = xe_gt_debugfs_simple_show,
>>>> .data = register_save_restore},
>>>>        {"workarounds", .show = xe_gt_debugfs_simple_show, .data =
>>>> workarounds},
>>>>        {"pat", .show = xe_gt_debugfs_simple_show, .data = pat}, diff
>>>> --git a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> b/drivers/gpu/drm/xe/xe_gt_idle.c index 67aba4140510..70fe76735621
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>>>        return gt_to_xe(gt);
>>>>    }
>>>> +static inline const char *str_up_down(bool v) {
>>>> +    return v ? "up" : "down";
>>>> +}
>>>> +
>>>>    static const char *gt_idle_state_to_string(enum xe_gt_idle_state
>>>> state)
>>>>    {
>>>>        switch (state) {
>>>> @@ -145,6 +150,84 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>>    }
>>>> +/**
>>>> + * xe_gt_idle_print - Xe gt idle print
>>>> + * @gt: GT object
>>>> + * @p: drm_printer.
>>>> + *
>>>> + * This function prints the powergating information
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise  */ int
>>>> +xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p)
>>> Prefix xe_gt_idle points towards RC6, better to incorporate _pg_
>>> sufix/prefix in function name.
>> Kept the name general if anything else needs to be added.
>> will add pg prefix
>>> +{
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>> +    u32 pg_enabled, pg_status;
>>>> +    u32 vcs_mask, vecs_mask;
>>>> +    int err, n;
>>>> +    /*
>>>> +     * Media Slices
>>>> +     *
>>>> +     * Slice 0: VCS0, VCS1, VECS0
>>>> +     * Slice 1: VCS2, VCS3, VECS1
>>>> +     * Slice 2: VCS4, VCS5, VECS2
>>>> +     * Slice 3: VCS6, VCS7, VECS3
>>>> +     */
>>>> +    static const struct {
>>>> +        u64 engines;
>>>> +        u32 status_bit;
>>>> +    } media_slices[] = {
>>>> +        {(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
>>>> +          BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
>>>> +
>>>> +        {(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
>>>> +           BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
>>>> +
>>>> +        {(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
>>>> +           BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
>>>> +
>>>> +        {(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
>>>> +           BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
>>>> +    };
>>>> +
>>>> +    if (xe->info.platform == XE_PVC) {
>>>> +        drm_printf(p, "Power Gating Enabled: no\n");
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> When device is in RC6 is there any significance in waking it up and
>>> checking pg status. I think we should check PG status only when device
>>> not in RC6, may be we should add RC6 check at the top.
>>
>> This is required only for debug purposes, is the coupling wih rc6 necessary? We
>> cannot save the previous status as there is no park/unpark.
>>
>> Any suggestions on what should be the output when in Rc6?
>> Should it dump Rc6 status instead of powergating.
> If it is in C6 then it is equivalent to power gated.

Yeah agree its powergated, so should GT C6 status be displayed instead
of each powergate or hardcoded values since prev is not possible

> Thanks,
> Anshuman Gupta.
>>>> +    if (err)
>>> Decrease the refcount / xe_force_wake_put
>> If there is an err there is no need of forcewake put
>>
>> Thanks,
>> Riana
>>>
>>> Regards,
>>> Badal
>>>> +        return err;
>>>> +
>>>> +    pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
>>>> +    pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
>>>> +
>>>> +    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>> +
>>>> +    if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>>>> +        drm_printf(p, "Render Power Gating Enabled: %s\n",
>>>> +               str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>>>> +
>>>> +        drm_printf(p, "Render Power Gate Status: %s\n",
>>>> +               str_up_down(pg_status & RENDER_AWAKE_STATUS));
>>>> +    }
>>>> +
>>>> +    vcs_mask = xe_hw_engine_mask_per_class(gt,
>>>> XE_ENGINE_CLASS_VIDEO_DECODE);
>>>> +    vecs_mask = xe_hw_engine_mask_per_class(gt,
>>>> XE_ENGINE_CLASS_VIDEO_ENHANCE);
>>>> +
>>>> +    /* Print media CPG status only if media is present */
>>>> +    if (vcs_mask || vecs_mask) {
>>>> +        drm_printf(p, "Media Power Gating Enabled: %s\n",
>>>> +               str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
>>>> +
>>>> +        for (n = 0; n < ARRAY_SIZE(media_slices); n++)
>>>> +            if (gt->info.engine_mask & media_slices[n].engines)
>>>> +                drm_printf(p, "Media Slice%d Power Gate Status:
>>>> %s\n", n,
>>>> +                       str_up_down(pg_status &
>>>> media_slices[n].status_bit));
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static ssize_t name_show(struct device *dev,
>>>>                 struct device_attribute *attr, char *buff)
>>>>    {
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> b/drivers/gpu/drm/xe/xe_gt_idle.h index 554447b5d46d..4b8192d3aee0
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> @@ -8,6 +8,7 @@
>>>>    #include "xe_gt_idle_types.h"
>>>> +struct drm_printer;
>>>>    struct xe_gt;
>>>>    int xe_gt_idle_init(struct xe_gt_idle *gtidle); @@ -15,5 +16,6 @@
>>>> void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>>>    void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>>>    void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>>>    void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>>> +int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p);
>>>>    #endif /* _XE_GT_IDLE_H_ */
