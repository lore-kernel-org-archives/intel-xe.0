Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722A8C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 17:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C016610EA74;
	Fri, 28 Mar 2025 17:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLgO87IE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBD310EA74
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743181703; x=1774717703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ninINtPh4qGeJlpie/1dCxRHtnTpHMmZ0R3KBSKN/wM=;
 b=TLgO87IEjKG5QRdJWwUQJ9h65zu7sTivsh5QEG8fgN/IcOAMf1fS1N3Y
 rN0+lWOiXtfmF25+lAMP0y57VFqpuW0zQpTCXq6LlZckVngfv/M3C6MO8
 R3exk+eRQ5odbwiq3ZLMaaO95psLOWAPxGpef2swFLbQBL2qjc9oy/LZC
 EwaNHmmZkdjGvJnfLzLDPz82LgDTreUkb1k93f6iU20ZUY9fSg+WSw6xB
 w5YuwkozlZuNovYNDhVo8Unot/SPOcApmAQFbKXsYl7e2L5Lm0nwUakZQ
 HaYr87KaEhXDsZfZ9tvR5hWF4VUlLwq6o1oAjllCI5FKlhTYmhVirBmDz g==;
X-CSE-ConnectionGUID: Vokb1z7HQpOf3VeovLjHVQ==
X-CSE-MsgGUID: f1nGcDCERce26tvRnmsjMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="67022653"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="67022653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:08:15 -0700
X-CSE-ConnectionGUID: k9FtxMnSQwqZh9HoeCjygg==
X-CSE-MsgGUID: jSXM3cksRyiLTK97NpnJIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="162730322"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 10:08:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 10:08:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 10:08:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 10:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKM2P6+kWRwqHkORmrc5U1c0lexJ+QmBGk8JJe3AL+9bHlQVuzPQgpCFBu82D99srFmneKLchewtfKry1xQoYw2mZUHUMUY/Vvf0ahZq6O+a70qikpZ8FLWNOKgVUzDAswBMDxzxqcEv3gMrna5npRouxWhFBma61tBDB59wWYTrW9zUyjN/fYzVDy/RAXccdRml77KMDE2eeBIhVrv2Wh0jvIdyA2OUOGZZG1DaoYhNC6KrUniEP7PMMLOrxrEpGArxYfRsEQKo+wL8WYgSXkcKdLjTtA3rt6qLeKrKoz2GiagmJJ9WR0bZIbP0uDcFJly62wkVhHOmyk5pA3JlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBicm2E2hHfWB0Qwx6seGsBkYGoInyGF5tscBur4Mbg=;
 b=aAVeQKe8PIPX4OAEEOYM4cBAL54clcYLVf00CvL4UIbVYfmt0mqPZS3euE2faxNQgH5zYXLK5IVYoNTJlo8zFmzSbtjPflMu5kP8kcMCSFki5Y5OyaGgb1z5xjlegWey7lN+pueP1cAV6PbhM4vjGCtPqQZkIRbyIaPexjTsuKUkx7ab7F6MKmpTrzAMWMRfHZJ1/bcFoJ75EsZIVIKxbUJtBLcWkrEnGNPhtI92vEPNg41KHRODGmOQPxwAk2/+WBujRcAZqcaBwvqRHyj6FA4Aww/YxrEc6kng8a38nnpCVIHMGIb5S/9/ZJMz8Sg2oyrQ0siShuzAG97/7S7PFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 17:07:57 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:07:57 +0000
Message-ID: <ed7ee372-598b-4567-9906-76f9a0f010b0@intel.com>
Date: Fri, 28 Mar 2025 10:07:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't print error about hwconfig when using
 execlists
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250328154236.9216-1-stuart.summers@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20250328154236.9216-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|CY5PR11MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a054e0c-e9fd-4344-2f8e-08dd6e1b161e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWF1eU96NFl3R2RrTVVaQzZySTRIRG5LK0pDRzRKL3AwTXRXaXozUmFvOUMz?=
 =?utf-8?B?OWlZZ2dhZzU5c2d6cWVTTG1mSHhMOUxTTkRTQUozVjFXTyt1ZUh4TW5WWXhY?=
 =?utf-8?B?Ny9hNzhDZTgxM0NHVGg0WWFGa0ZudlQvYVB5T3pJenJqNDdvWG5ha2VmSGxM?=
 =?utf-8?B?WVliemdmM2ZRYnBMZUIyZEdvaFl2SEN4SGdORWFyQVRjR3h6anZvR3BkQTVR?=
 =?utf-8?B?RkNsclNzZys3V1lFdjVYZWljaFJRblhvUEJVVU1rdnVXMjFqR3FCUFNhZFln?=
 =?utf-8?B?RW1mUU9RWk01MkxLdTFkd2ZGc3ZnZUV1RDNJRERXZ0tRVTVVd0ZJdExXQS9O?=
 =?utf-8?B?VTcwUEI3UEtZNnJEa011RTBrQWN5VmFwQzJwQ3pObThUdnVwQ2VOWjFEUHFu?=
 =?utf-8?B?L2Y2MGVGdVlYMGFWcUlZTDk0WWJTS1NQUmU3SVFjMUFSc3Uwb0lWcC94bldL?=
 =?utf-8?B?RWp6OXZIZi9SdDRVcFFsbE4yUzU2SFYzZlBxWkI3eXhNdE1KTXgrVTZZbW5m?=
 =?utf-8?B?T21vR3BWYmljWFU2ZlA4ekMzOUlhWVZrcG5BNXd2cXIrVUtBQVN5TkFhS04r?=
 =?utf-8?B?eFAwQllVRnZxQWNOOE9IdnRJTVU3VUVHTy9BQU5BNmhTSlFJS3lCUkZIVEcw?=
 =?utf-8?B?KzM5WmVSejZ6SGZyOGI3OTIrc3d2aEkra0VNTFY0cis5RG1NWkd4RkJ5NkJF?=
 =?utf-8?B?cEFPTlRyZkpFblR2aDE2dzN3eCtaWXNZK3Nuemhua2pVVk81QXRXVnA1Q0Nq?=
 =?utf-8?B?SDZrdGF4dUZSVytJMDdGZnhlS3orU0dqYVd1a3ZNNk02NWpjVmc2eGZBU2RD?=
 =?utf-8?B?dnpQa2MydFJzMUx1bm01eEZHN3NLV1c2ZW5lR0J5VlIyYUZSblpDT09HenE2?=
 =?utf-8?B?T2dpMnhPRHFDeHF4eDFmSDRGMXd0S3JpNEtaU3pRUmsycGIwOTVmNktGYzVo?=
 =?utf-8?B?ZzExNk14dWk5SmZLU1pEZ3Z1WlREeG5XYmo0MTJEb2hDS0llMmhHWTBYMi9w?=
 =?utf-8?B?dG9BWC9uNFgwSTdHZ3dCOW9GWVQzRGQ0VmdDbDArU1h2OFlsdWVRSzAxL1RC?=
 =?utf-8?B?VDZrN1J4VGxoQk1oQmJIckgyckFhMXVxaDIvSmg0bVJkbGFsRjRpVDFHNlRx?=
 =?utf-8?B?Tmg0YnRUWElwWmlXanowOENIUjM5MkhXby9rbEhBang3VjFWZkVyOGhGMFNp?=
 =?utf-8?B?QUZTRUUyOU05bDE1TXBOUmh1OHkwSCttRThObDRsTE1EWU8yM0xHWm5QcWor?=
 =?utf-8?B?Qzd6WTdGQUZXKzYxZys2c3pldjByVGxiWnZIV0tTQ0ZsbnJwQmJYaUhzODFh?=
 =?utf-8?B?TjZUTThuY0lRN2FHbVl1bEt0bFMwS1ZqdTlSRldwclhTZy92SVhiaTQxcUNI?=
 =?utf-8?B?WGNiZ1F1UytVS05hWmZxL01SRzEzNkZJMEtsdUNBbFlsSzV1UzdiNCtObXd4?=
 =?utf-8?B?NXJWS3dlUlpVaHAvY3FQeC9xY0g1UzBVYnJoUHJuejVNamxBY3dsWXBOblha?=
 =?utf-8?B?TjRmV3FQcXc5Sm9RNXJPbDRBMENCc0VrMEF5bE44L3IrMGdaL0d5WWRVUjF5?=
 =?utf-8?B?ckVzQ1RPQUNLQzdKVGlhTXBVazF5L1FhRHRyWnpycks3cmVuL1lJMlArRmo2?=
 =?utf-8?B?blFDSk51VllWa1VqWExodXFhS0ZCS0lXVGdFZjVJOWIxMXd5WGtQNVFRUFkz?=
 =?utf-8?B?bjhBWjgxQzRQWFNST3ZyWWUwT1Z2Z2NkbWJ6MU1KbGE2eGRVbEd3OXkwdE1P?=
 =?utf-8?B?ZDgvd1gwVkZocUpzRDhVWWJ3YjQ0VG43K2tJTDYvMFpKYjhuY2JaZTdzZkQx?=
 =?utf-8?B?QWlueVpvNjRnK1V0WVZRRkxwdEFoWUlnWnEwQ3FjRVNldmFHTmJGZHRUa3F1?=
 =?utf-8?Q?L6ySu9n24Hn7E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEN2dVh4ZFdvYW9BamtSdkpNRFlyaVh4bytIUnZYQlovTWxORzFjbldVc0Rk?=
 =?utf-8?B?Z01HcnZOSXl3UitLaWs1UHRNTFRoRTVxM0pUMGdkeE4vRzJ0MTNEVmVacFkz?=
 =?utf-8?B?U0FqUmxJMEVvT1pJWlU1ajQrLzFjd0VBYkZkMnNKc1Y2VWN3VzdzR29jRGt6?=
 =?utf-8?B?akpCTGpLWUJSNHNXbFd0WUNkZlFoWUMyODN1WjdTSFdOVk4yTS9POEJ4NnZv?=
 =?utf-8?B?Z2tBWnZBT0FTSEwzUnBxQ2VCSTBzWFYydm92K2RNNDkrbE9mRGMzeFNhTENM?=
 =?utf-8?B?VkV6dDR6WTkvZEZnZXBXMkpGWmVIMmQzbjNJVlpLdTIvdVVCRWw4NkJ5d2VQ?=
 =?utf-8?B?VGY3eXhMRUhjamt0anR4VDBKRkh5N2JzbnJ3SE9DS0x2S2V4YzdES1lteGx3?=
 =?utf-8?B?SHZEQzVtZ2pMVytoenRaSjNqR01tb0dZMzErdnVzcHBJRmNSZHM3UXBYZ2E5?=
 =?utf-8?B?RjFBRU42bG4xNDJaUUpubjhEdW9SZVlKTDlIRndFWXp5enp1RjVySWEwQXVx?=
 =?utf-8?B?QSs5ZlpuaWxoZ1ZaSEEza3FCNTNYZ2xwVG5HbTVvRG0zd0pMZHE0WW5sYnhq?=
 =?utf-8?B?TDErMnVUMXl0WUREcCttV1lRaUZvZ2NzbzVTdlZ4Z05QcVYvdWFDNHZYN0dz?=
 =?utf-8?B?UmJaWVE1cDRua1FUTjYwNWU1OGIrVE5OZk93eEdJdTNBNmMyVjAwSm1HOHFG?=
 =?utf-8?B?NTJyajB0YzhWUCt5cVZWWGFSa1QxS0pRd2Y1NjVnL0p3bDMwb0ttRDNVaEJn?=
 =?utf-8?B?L0lZOUQyMHJrbTBHOE43RURiOGRyUStzL1Nzb0djN1FRUkx0d05qUDFIVHdH?=
 =?utf-8?B?KytPb3E3bUtLV0ZuY3BORlBraEo4NlYvWGN6S25GcmJrbTM4Nk02dk15Z201?=
 =?utf-8?B?YmFvbVpZNWRDYnhZb2d3clg0dUVWbDMydmVBaXNXc2pISGhsakhiZGhUclI5?=
 =?utf-8?B?aGNGQlVSdEVKNmxOd2FWbnp1UVBEQ3FiMlk1ZXVSVHRweWo2N00xWlIxQXM0?=
 =?utf-8?B?RThtRnFFVEtaVVp5cm1ORzRMWVp0b0lrK1pLTm1JM0QxdHNKNDNlUWNUeHBW?=
 =?utf-8?B?TDVleWZ4SHg3WWtQYzNzZ0FEN21sM3RoQllkSEg4YlplRGRmSTJnN1pnenQ1?=
 =?utf-8?B?MlJ5UGwwTHRSd0FLR21UTUJ2ZXloTm9oL3ZEWm5DU1V5c2xja3EzN1NLWU16?=
 =?utf-8?B?c1V3SlozcXdDaFZHS0IvQ01jbFdrR1JXNWhtWWJlUWtwRWJVcHhFVFNwd2xX?=
 =?utf-8?B?QTN3YjVWcWQxQ1N2M2hxWmpoWHJDTkNSc2g3VTBEQWRxbENCWW5MSWtYYmtT?=
 =?utf-8?B?T0t5aFY5MkNhaVFaOWUvZHMvWjlwZCtXeFhwRzdQOXd5RnFFS3UxUk1uNmlV?=
 =?utf-8?B?MUZ4OFlpTlJkb05hOTR1VlR1d2RGKzdMK3NRQU44NlpCTnFYcmNKRE4rVzFp?=
 =?utf-8?B?enE1emhMbXJIais4ejJnaCsrSm04SE9JVXhkV0EwcTdtdkhLZTgwa3lWWFVi?=
 =?utf-8?B?Zk8zUGVZMXg1RlloMEVkL3hXamF5cXJEUllORzFEaUtrS3BXVEhPVWpvT25p?=
 =?utf-8?B?QlNtMzZLRGhvelVCQWkycVluTHZFUENZa0VUM1BITHFnQW43L0lXWUN6amk1?=
 =?utf-8?B?eTRvYUsxTHVGKzFoQ1NOTzFIaVFGRGp2MkdRczRJRFV5NmRkVWw5VHM3MVd4?=
 =?utf-8?B?bXlwOHBRUUhmNkZVY3A2K0Y4QjMvSGk4cFVMWEFNWWFROFRMOXlXdm1WUmFH?=
 =?utf-8?B?eUVDb1Y5bVM2WnhlWlFKeW1pOXpSVVoxbjZGN3dxRUFJZTJncXpROFVWR254?=
 =?utf-8?B?N0daRlBrR1pKOWU0blVpYTNRZXBLdS81YXU4bTJMckQzREp2WUNiWmJMVDNm?=
 =?utf-8?B?eWFBeFFEbGtKM1RSY3ltNHpZZURadXJnelRQMm5sRU5nL3AzMm92OC9CV1JB?=
 =?utf-8?B?OWZWWmtXcFpEM2s3dVVsTEpvTkd1ZnBGV1QzS2J2TWwrRlhpeEwwdG12ZkY3?=
 =?utf-8?B?THZ3WldKcGlmaFNubTN0T2xMTHNlTXFkM29mRCtaUzEvczJrZ2d6R1RUekxU?=
 =?utf-8?B?a0dobXQ2emM2WEwxanlFVzVUVk9OZjBiaU9qL3FDOEFoeC9aVklsaVN0N2VF?=
 =?utf-8?B?dWQxUzBQdjdlT05xTmpnT1U1dTVja1pXeUJLU3hBVkpKN2ZSMGlleE5sRTVx?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a054e0c-e9fd-4344-2f8e-08dd6e1b161e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:07:57.3568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAclRbhW+IPHTXZ8FQU7hK6Jf5Mu4Q82m0KPlGDs6B1OSTxX9/ZcOhPoieXH2WUlR8hBRj/ocU5VE/Q2q+lKnCBb6ZrnLP0P7Wu9dE1vYSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
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


On 3/28/2025 8:42 AM, Stuart Summers wrote:
> This error message is only applicable for platforms using
> GuC submission - to warn the user if the GuC they are using
> or the platform they are running doesn't have this information
> to provide to userspace about the platform. When forcing
> execlist submission, which is something only used for debug,
> the user is running at their own risk and should understand
> the limitations of running without GuC.
>
> v2 (John/Lucas): Don't print an info message with execlists
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_mcr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 605aad3554e7..d4d9730f0d2c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -345,7 +345,8 @@ static unsigned int dss_per_group(struct xe_gt *gt)
>   	 * Some older platforms don't have tables or don't have complete tables.
>   	 * Newer platforms should always have the required info.
>   	 */
> -	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
> +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000 &&
> +	    !gt_to_xe(gt)->info.force_execlist)
>   		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
>   
>   	if (gt_to_xe(gt)->info.platform == XE_PVC)

Since we're using force_execlist (a debug option to bypass GuC and use 
execlist submission), the user already knows they're running without GuC 
features. So printing the hwconfig error isn't helpful.

Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

