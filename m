Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE9C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 14:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21EB10F3E0;
	Fri, 28 Aug 2026 14:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UODF5VFz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29E610F3E0
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787926711; x=1819462711;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tq/OulpoKcJm+j5f1mt8E/mNm2XdyQ3y/Dz4r8zwFUk=;
 b=UODF5VFzzTYLN4GAJdB4nQUJyOUzPhS7gzGbJV0DXsyyGpBYGiSTW3Uv
 mMCmPN7H5Wk7dcv+Pt/mPFhmQdRC49erh0u9F0hHHJh105cAbqSzvw2Hs
 13r2lt0fACUfn3BGfG3FibmkPsFxXqgbv9h5zB0jPJDP6BEUx+86mL0QJ
 kwI6kGxYIQ9ULYTTfPIoVLlddF5UHIKnkqJYKSPgrPyNF03L2Uhzsoxbo
 j17RcHtxUdrXAvhsZvL5L0d8xaXYlvDk7TS7vuZHoSGxh0pv8tgSZcO2o
 CEFZwsY9Vs4Ita9Sewai+iSBwcNofAUSAxxf287YtTbP0MdkRfGJ3cY+F A==;
X-CSE-ConnectionGUID: +GCimr4oQ+uGGARUw+K4Qw==
X-CSE-MsgGUID: sstM0NzeQXyu4e1DMM56sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88312405"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="88312405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 07:18:30 -0700
X-CSE-ConnectionGUID: 9wNSjtRMT1eOaBS7aoI2DA==
X-CSE-MsgGUID: dVIMfuYWTqCUArsgAsw0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="270118744"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 07:18:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 07:18:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 07:18:29 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 07:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDwV9UPBRv4D0Fhuuw3hLqsBXTogyvbS306oFLx8Yv3fKoZ5v+NkyKvUxahZb0Rm2WcPitaMbnn71ynSXHoAEWuC7xOeINlROXJhiusAjIzCQArXNbDXsXFZgX2uUgvk1YTdFPMNYyGdxumd7KsFbTmNWpr2rJxdZD0gDLQefuT2+rfrt9EDRJoZ/IgEcBD1IFsYXkRpA0UKYcA2E2Jwmw3180o71IJgJ9eoyE+ozCECiSlt61klQ8D5BNZP3DvJOdMw/jxmV87w/9EYoQsxouobLF1L4HXgbOuCbSJBpYIA4b51aXnJ5qy+RWEVcVbzzD+UMefb6ZXZXxsGu/uc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOTWSdo03WkXfWuyj6XvZAkqyVqN6f0eh6G4hjvgNH4=;
 b=JgrVqWq0wLxeEKCiWgcSr7gwpNLJpkGrp1XV4R0WFXJX/Tmk/KHVJ2mHN3L8kixIowCSVI7uppwS/dCDRhB3MynK5NTIFiXdJCEeqR2ycYWxhlLdVNYliw/qsC168T9Qitbcv7guzhVmxOUBLvR7Gj4XpDYlLAeboGonFw0rKlNTqA8/cTArnAk1GvXlHseixLasVEnh+lrhlhM+IuWc2U/F8ECuGLjeRxhymfGOhXMGhv2QkAlQBQfTIW+8O8Zi6Qsm2uGEt6SjCtkwsitlL/WsRafGJwmUlph1WcJ9oz65lzLR8TT4HR7BnFbr5a4UHfROQDrJNe8w4Hz3BmwA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYXPR11MB8663.namprd11.prod.outlook.com (2603:10b6:930:da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:18:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:18:27 +0000
Message-ID: <432ba474-a670-4f98-bfe6-3ee151329a45@intel.com>
Date: Fri, 28 Aug 2026 16:18:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/xe/gt: Report GT reset and power failures
 using SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>
CC: <badal.nilawar@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <mallesh.koujalagi@intel.com>,
 <matthew.brost@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
 <20260828095803.2130312-5-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260828095803.2130312-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYXPR11MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e543ea-0629-49da-169c-08df050f3a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sLsMFAKfeRtcPxIN6L0OpGNuA1dlA993ZDckmC8tFDJDKz+2gVI9PTwkKBVLc8NZmHar57y2bvascGoa/QnrlrvgKWY5e2wjGpiCj4nhmxsKK12U1vxO87ypeyCspIPHQTwUe61lJHFIna4DJDze8y4kTRNKNDpSMt+3snbopeElvIO2R94d3cL0w6lGn/0kpP85n6BIw0YjRah2A/XR/H0ib1pOwiKEm38ZmgPxRaMzzEf+Fprz70BwOCGgUn668NPgDqWJoFdYf5HibZTLW2s5uy94cHa5XhAMdck3QBPwqvKf3t4jG+FRaDZtMzXehDyDkpniP9ZUIh9puMFIeEzsz34uY+g6HpSd0PlauXbGxUjt6oFUwiEIKX3Dc9Ev7UiQ8cNYV5mdbPpNZ1OVkVES1qafmsAoRjg8CjpeRY4qeECuIP9pQAPR42EPl7AbRsgjZiu3+BWgcb975HYde6jPj0xx8yKRdrKhBzHrimykBZ7wOTgu6b6TK13zCfcH+nVMI4hWOI9YnAXFSr1OJA2M/s9XQ+8ndnms/i2T0mh64bSjrR+nOfV1tFQYNmx1OIvmfMoLkDI0Qhb18OZlym1IYSG5f0CHY3EKPyadUNy0HFSzZPwLB5QABC1ExZEWA7lIgoY2DMvZZX4qLP8/JPsoe7WCfQJJZhNV8g8Brqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1dZZU9SeXNXdUlOemE2aHc0b1FUYUNkd2l6RnNGT2p0djJDVnBkWktGa0ZE?=
 =?utf-8?B?Q3R4dDNVcUNXTE9pWkZIaWR1OVVFKy9mVjRtS1JPOVEyUWE3U2g3QmRjQzRz?=
 =?utf-8?B?N3VKVlUvK2ozQjZtRWs3d2hsMjh1dW9sNkFoK1d3NmF5Tzdjd2pCR1FYWG1U?=
 =?utf-8?B?SFpBWmxTREZ0eC9jeXNHdi9LVkMxTFh2WkZ5MkNtQS9pQmE1TGtxMmJ4Qy9P?=
 =?utf-8?B?T3o4TWFzS25maDlqYWdTVHpyUzBETHpoTzN0U2FPRjBoK0YvMVdBT2xXLy9U?=
 =?utf-8?B?OGJYa1pNcnQ5K2pTd2FHczFPcHE4amtiNHVYTGRKdXBoVWx6MmlNUDN5VXh6?=
 =?utf-8?B?aVpRdDFQbUVNMGl0ZkVWam1Hd2NtQlNLdGJhK29mTzZ2MkI1ejZTUTAwbzRy?=
 =?utf-8?B?ZVZVOExwTWJWdkFXVnpENVVPeUYxQkJKQXY0eHZRb1JxblYyNFpOaC80YmZV?=
 =?utf-8?B?TWNhSEpMUmRPZllVZUVuMUhsNEN3MW1NVitjYTV4VXpML3RSRWIvVnhadWZq?=
 =?utf-8?B?aGNlaS94RFhBTjlUODBxdHo0NzVwSXBFaW9ZYUNmVXpRSCtWdGd0Q2J3aXpm?=
 =?utf-8?B?VGpiR2FXSGpWMlFSQVlPc29DUlhtSzhibllrRUtseVEzcllwN2d6WGRzdE9F?=
 =?utf-8?B?c2tITUZEQ3hlQW8xN1FEblo0Y1ZWV1pEQWFDL0cyanp4Y0c4citvQWttR2JX?=
 =?utf-8?B?UHpPRWJzMndUQzhXUW1oK1BiaFRkN2NjUmlMS0dXdkdEaUJ6QkJXaWl5OFlP?=
 =?utf-8?B?eTlPM3UzcXpkRlRudytwRDlzS3hkT0FaamJacE9iclhUakpvcW0rZVNGbTdY?=
 =?utf-8?B?WThFM21tdU1GbHVRYjllbWthWnlQN044NFNvZHh5SDN0QUpsZ2dQQTBUMENl?=
 =?utf-8?B?UDhXNTBoUEcxYStSQkgxTDFSazllaEpubHkwT3gvVFZlV2pqNnhRSVBkMzFB?=
 =?utf-8?B?QlNYQkt4eFA1YTQ4VHVQc29TRWxCcyt5QXliWitrclZURkxOUE1EdFhTMXdX?=
 =?utf-8?B?VU91ck4rUnBHMHZmMVlsUnFXM2YrazNMenI3cXZFZFpCNlVYVWtYdDhlTFBo?=
 =?utf-8?B?NW9udFBJQXRKWmxVSlp2SmtuaXJRM1BYbnRkU3F6TUVhbnVlR3MxdndnaTkx?=
 =?utf-8?B?cGwyNWJUTWhqdHcyc1VlVU1NeGxIRmhGSWZjQzBqQ0oxYmNMM1RBY2VMQWIv?=
 =?utf-8?B?MUFBazVmNDZHaTk4Q2o4ZmV2QVFWREMyeXpOTksxa29YVlJUYmFrTEtVNmE0?=
 =?utf-8?B?T01IdEVKWnVBWXZvTmdOV1dYdkRseFRGQVhzaWVvQzIrNjYwV056aStFdUV0?=
 =?utf-8?B?c1NTN2M2Y2k5TEhtK2cySzBBWnVVSVJvQkI0dW5zUU5nUlV3QkZPVlk3QXNp?=
 =?utf-8?B?UjlLTk1VN0dUUXRPT0JlUmZGa3g0L3RDQmdBS082UjN5aDlYb2cvb0E3TlQw?=
 =?utf-8?B?cTQ4ampaQ2lMU2FoT2ZvUUZCdnpTVUJrVngxY3lxaC9ReWl2aER3TXA2UDhU?=
 =?utf-8?B?RHpmbkZBMUFGOVd1TWpHV2tPdEhhU2FPNlozYVdqYlVtbitlVnhqalhqVWtj?=
 =?utf-8?B?R0FuOHdpL05EYytPWk9HRTR0Vk1QZmJkUGRNRGZ4VGwxeGs5QUNvQjR2cmFO?=
 =?utf-8?B?dGpmU2FPTk5WVnozVDh0ZjN4TEZzQXBGeTdQazR4bTdoanRvT2RPNytMb2pm?=
 =?utf-8?B?eGhSY3pQT3JzK1phZmxLdE9hbGFicHdQb2FZN3BXZk1FRndkZW8xdk41YmU3?=
 =?utf-8?B?czhicG53TWRQb24va2dCRzhMM3QzNm1KaGtJTW1UWFF3b3drSUs3cEMwSmRO?=
 =?utf-8?B?anVRZ0JKOG1adVJLdzViYjlXRkZZVUpWMGYzdkdwZEovR29ybVNYNVlVTGov?=
 =?utf-8?B?T2V6YkluU3pvV2dJSXgwa3lZY3V5ZmtGcGVraVgvbmRXVDAwMERseHZmVTRj?=
 =?utf-8?B?TUR4QkFaUW14WGNFNWN2dVh6citzTkJHdloxaFBselV2d2ducWVqUVBuNmJE?=
 =?utf-8?B?eUd3a0VRcW9MSWhuRG5vZlZTTXZhQ2pGWlc3KzRxcFNNZ0pUL0hEUlBPSWhB?=
 =?utf-8?B?Z2tnQVBGclpvSTQ5cFNNMDAzZTMwRzJxSVlDN2tWSHFWa2xFT01jTWlKNCtI?=
 =?utf-8?B?ZTAzL0tuYmRCQlJ3ekJ3U2RQZ2Irc3JCaDIyRmNCWUFabEFVY0NLcUg4SWxF?=
 =?utf-8?B?YWxnRld2M09TU3B0enhZSHJVcmRZV3U2SmszdUtxdWhZZytuZ1Erak1QVkxn?=
 =?utf-8?B?WXIrdlhNUjE0ejMvRklXMEVmMndnTDNFNEhXSXQ1QVJob2oyRTFYSVlVQTZk?=
 =?utf-8?B?dXViM0tLdnArQjhCdml5b3liVlZPcE9LY3ZxTnlKZUJpeUkvYlFwNmVQN0RB?=
 =?utf-8?Q?kHJkCsP01iusbZB8=3D?=
X-Exchange-RoutingPolicyChecked: kXXMW9PpGe8uQTEMzwp11KvCMf8d600XJq5h9Y9z5ZJIB32B0hU5r+KGRncYAzd7rhvKwiOeRmWKhi57J6UEeifyx5UBo2wl16nCI7GQbutEv3mXlbBdLqPbFmsjfN1rh7ZATm5fBPfaCjF8pIBfdm1O8+zaqnjjl8Bw2lFSW9woVYWaZS5+MOrly9/Jjj6MCFjcc5+vAWmbkC4jmi6oE7ReyrBQX2wRHQK3c0jLR8DJ5Kwn0YMln4Q46rjIXcEs9fq7DRoynqKTJxuXCMNT07pGmcQmpBSNIHdwe9SvigBm2z7cEoeehegvCUVFMZQ6ZpA5HfozsQDOl6PockO9WA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e543ea-0629-49da-169c-08df050f3a1f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:18:26.9932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMk7SvNUT9WKSRwDPXiM99P5K4p0J6gqWhEgkIFHAZbBosy8V/lFrDtBaumyXCVIeu9VxnbwQeBuRUsySHJqfHMp2TZ7tns4m6kHawJpUoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8663
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



On 8/28/2026 11:58 AM, Arvind Yadav wrote:
> Route the GT reset failure log through the structured SIGID logging
> helper.
> 
> Failure to clear GRDOM_FULL means the GT reset did not complete as
> expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and
> pass the reset errno value to the helper.
> 
> Keep the lower-level GRDOM_FULL failure report because it records
> the exact reset register wait that failed before the higher-level
> reset failure is reported.
> 
> Also route GT suspend, resume and runtime power-flow failures through
> the same helper.

can't we do that PM flows in a separate patch?
> 
> These paths were already reported as GT errors. This change only adds
> structured SIGID reporting and keeps the errno in the helper data.
> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6805e0d3bf21..58df31ecb825 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -824,8 +824,7 @@ static int do_gt_reset(struct xe_gt *gt)
>  	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
>  	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>  	if (err)
> -		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
> -			  ERR_PTR(err));
> +		xe_log_err(gt, GT, err, "failed to clear GRDOM_FULL\n");

while around, can we improve the error message here?
we are not clearing that bit, the CP does (Bspec:52549)

	"full graphics reset not completed in %u ms"

>  
>  	xe_gsc_wa_14015076503(gt, false);
>  
> @@ -1013,13 +1012,13 @@ int xe_gt_suspend(struct xe_gt *gt)

hmm, for the PM flows below, is the SIGID GT_TDR correct one?

shouldn't we use PCI component (or maybe new sub-component POWER)
that uses XE_SIGID_IO_BUS ?

>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> -		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
> +		xe_log_err(gt, GT, -ETIMEDOUT, "suspend failed\n");

btw, maybe it's a time to improve our error message:

	"can't suspend due to forcewake error"

>  		return -ETIMEDOUT;
>  	}
>  
>  	err = xe_uc_suspend(&gt->uc);
>  	if (err) {
> -		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> +		xe_log_err(gt, GT, err, "suspend failed\n");

	"can't suspend due to uc error"

>  		return err;
>  	}
>  
> @@ -1065,7 +1064,7 @@ int xe_gt_resume(struct xe_gt *gt)
>  	xe_gt_dbg(gt, "resuming\n");
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> -		xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
> +		xe_log_err(gt, GT, -ETIMEDOUT, "resume failed\n");

	"can't resume due to forcewake error"

>  		return -ETIMEDOUT;
>  	}
>  
> @@ -1092,7 +1091,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> -		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
> +		xe_log_err(gt, GT, -ETIMEDOUT, "runtime suspend failed\n");

	"can't runtime suspend due to forcewake error"

>  		return -ETIMEDOUT;
>  	}
>  
> @@ -1116,7 +1115,7 @@ int xe_gt_runtime_resume(struct xe_gt *gt)
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> -		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
> +		xe_log_err(gt, GT, -ETIMEDOUT, "runtime resume failed\n");

	"can't runtime resume due to forcewake error"

>  		return -ETIMEDOUT;
>  	}
>  

