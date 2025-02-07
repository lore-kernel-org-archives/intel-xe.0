Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E3BC02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 06:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F5510EA26;
	Fri,  7 Feb 2025 06:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtkvUF7n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE9C10EA26
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 06:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738909529; x=1770445529;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=56Uz38C8UGt7ZsE/FBaZuzPaFO5v0ihi0UQ9msmZVYs=;
 b=QtkvUF7no8+pyIF1umWp7A0ewI+rthpZVJdeMF93Np9UmsM88DS2TIG1
 I7JtMPVxLcgS2vAuK7ufXdaHzudH6eri1dy8p9eJ2KeVCpnTj0I0nb7ug
 YPYA1RxOHaU0mX+4lie1ltaYXnIH1/RYTjMmn9lavvhWE69OXYwm4Yr9m
 7GV4fz6ZHebxEtaKEc6DziVJMa+SSp4gGzvfPxjmap5QRs772DT8FtDDu
 M+RZYbWHiE8bg/E50YxQ4ckCdW4HObOSL+BhWnLKv/gMUudmgMY34UmIf
 6WVDhJQi+hWB3/LIMISmw9mzEqwMSTLVa1E4Xx8igCbKdO/WhrxVuFxAA w==;
X-CSE-ConnectionGUID: LfhEzRqSSdiJsvLkZDPH3A==
X-CSE-MsgGUID: 7dlmPtR3S7CHjFQV5vMS7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43204287"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="43204287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 22:25:28 -0800
X-CSE-ConnectionGUID: xZDvBc3LSp+3EfTDjtBPpw==
X-CSE-MsgGUID: wZO7MRtXTxiM+au9/PNDAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111265977"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 22:25:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 22:25:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 22:25:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 22:25:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmQ5h6IYNcPxqw3/UQ/Rir12b76PyuelwBFe7KiJvaOW2kbpBjeLIo8FgiPYV/MQ43rFqmrFGY1aagUSQ+S+Zq7vzff0sixrc1uOakBCm3anLVPCTg6R98YDwbWKOvxQDmQAGOaUoxqTjSo6uwCYl1sTveicjGMNw8XXXoEZJ6JORIXN/j3XEKeuF8r/F0N7rAg6CwqiaYDrLVRrA4fYj2CGbxtyJNWg/upEQvqBY4uiBBiwhhiN7u8IdYLYVUBoOyN/N8csf6xAbrqXrE3JvL96z32DO396miv3m0vZUrAJzea4xEXJddYmeNVAQYsRVh7iH36AwsT4lAEaYjqV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFLdtuBwqBd1pWtfPQQOWJ/Jegxx1t9L2xupi1GlK7g=;
 b=Y5ziRTgVOwnioNUdhhLJ9DeSMa7MU1ybNKJ9WgL3OXSIsMFvC8WwM7mEgm6TpAuWRrYmYvccQMKEPYwhh+NHLtHg05srfjJhy+DxwQfCmnsAaqyy9uFRCwdZLK+VOIQ6ZyOaDZ2Mi7Y/lOLXh1APEvuN3Kg9q/+59BHGm2NULQtxWGiT8BXMwMPuc/0gnY29FJjnBq1W8JpEuukN1yiDzMeNUBrU/2GFJ8icxwEfv+LkUL2d1wfZbnZC/5OF3DLPe2AmP1SFXgrK0GFuRhcExyo8mjgGW/9d2amSO4KX7aAPRefFpQxoxkciyvkdbo6bAryyJLhyL55IXnRES56fPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:25:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 06:25:24 +0000
Message-ID: <f81d997f-2892-4ab9-8b0f-2bb5fa15bf6c@intel.com>
Date: Fri, 7 Feb 2025 11:55:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/xe/pf: Enable per-function engine activity
 stats
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-9-riana.tauro@intel.com>
 <8c88768b-a503-447d-ab76-d01b5612026a@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <8c88768b-a503-447d-ab76-d01b5612026a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: f58d39fc-457e-4606-470c-08dd474034a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z09DSWw0R2Vuc1VPVXBtcUdoNFNYblJHMHUrVmFWc1BINTIrb1g5OS9wd2I3?=
 =?utf-8?B?aGQ0enQrUVJxY01FQ3llSUFEa3J1a1NBbXAvNHQ4bG55TzJ2VGlZc1MzRjhX?=
 =?utf-8?B?R0FTdzhLUStJZDFIYzRYQzZFdDMrS0FqNFYvdEVaWFZjNStwaXJwQnZyODU3?=
 =?utf-8?B?NVB4YnR2VnZxeTBqSXdoeXQ1MWhhaVNpUm1wSlBNYWNIWWJpUzB2SWZQYzk4?=
 =?utf-8?B?SEIvdDl4ZzB0aStGZXk3aHQyRUFqTTNvR3lvTW1kMkl1aEd5eG4wcUdNQm5u?=
 =?utf-8?B?TCtGMTZlcnhpTUpvOHMvL2R1bjNqZk5qMGduMFZ2dlBJTkYxVTEzN2lzb21q?=
 =?utf-8?B?azBxWUZoa2JpWDVhMk5ac0VveGFEWGFWZEF6cS9zU1N5TmkyVzR0enRDdnBa?=
 =?utf-8?B?OEppcHB3YnNDZjB6ZjZ0bnYrczQ1T1k1VlFKNjg3eEJsajNaNnR5aTBWUHlz?=
 =?utf-8?B?TEM4R2xTd055QkFBelNQLy95YUtlakNnV3ZTc2VHQzBqc21JYlNlSW9VRmZU?=
 =?utf-8?B?NW81YU9hZnNYakdOK1prdkRqblU4YndDRlErNW5iNWxBdk1kVjVabWd2YS84?=
 =?utf-8?B?bGU1VUhBcjRUa2tldDJSWUVBeVE3eWI1REg4ZnRJZWJHT3JhYmVFSEpMVWJJ?=
 =?utf-8?B?VzQvaVdPSVdPMFVhdVNpSTdMY1JOK0UrU3dQU1drMDNydDJzekJ1N1FPdi83?=
 =?utf-8?B?b1BveE1zbkhQNm1RbGtKREtHMGR6ZG5yZ0dnTEtWSXlWYkpxeE5DMm5HT1Ay?=
 =?utf-8?B?SVozNkR4djRwQzQwcmNhZkJrLzVqMTNsYkI3Wk5yVHMzNzc1U210VXhOeVpv?=
 =?utf-8?B?MUZSUU0zMGo3UEZHRGVET0tpZ1hWVmJFM0pldWpKWEp0Sy9ZL0luY3ZCS3F6?=
 =?utf-8?B?cUJqd2NENlMvQUpjWU9MVHdOVXB2YVRuS3dVY1AyS0xrRlVGZkFaWUFSc2dh?=
 =?utf-8?B?UlhxeUxTV3BRa3ErbVdpUVJFcy8xZnRHQ0Q3K3hzSytFTlhOY3pZekV2UlJs?=
 =?utf-8?B?SDNQcFMvQVVaTGQxa3prSEhnQ1ROVzgyeHV1cklXd3Y0S2ZSNWx0akkwQUU5?=
 =?utf-8?B?TWwxT2xTVkxFR0d5VHJvTW9zbVoyb2t4ZnNWQ3Q2NmxYeDdHYTNjWGFBeDdh?=
 =?utf-8?B?RThDY0JLUUJOcWRPQUFyUFpQQ0RUdFVJdzdXTkRBUWxXOFFaaW9xU3oyMHR5?=
 =?utf-8?B?ZUZ6dmwrUjhkdURKaXkyV1Z1V0JGa2RaNHdKM1pJTEdoOXU4WGR3UlFHeTUx?=
 =?utf-8?B?U0U3a3RtSGw1VEFwdW5HSlJaN1JnYnA1S2h3Vy9acWorc1Boc1ZsTWtQbnZB?=
 =?utf-8?B?YWVOSFVRaW1GQ0hFbGVDeCs3VVZkWGxkOUZXN280UUNEQjlQNHZoUStBbVFF?=
 =?utf-8?B?YXVyWWZYU2VROHlLaXB3Z2N1QUtNNXpibXBRQ2dDbGpxbnBFV0NWQWdZVVlU?=
 =?utf-8?B?NjlMdjVkRnBCeUViYU8rc1ZrWm5ZSmMvNm9YUHRNU1RTaEY2U1kwR214aTFo?=
 =?utf-8?B?RVI0dVJORFJjNUN3Z0RYT1B2NUhRNGZQUWpUb2s4RHMvSWZoZWhQcExuQzJX?=
 =?utf-8?B?NVZXSVVJMGU0YTJ4OEwzdm5HSnVJa0x5WkFlUjhVZEVwRGh2ZGtMM0FOTFMx?=
 =?utf-8?B?djVwMjA2ekVGU2QwellnalFGcllTMWVoMU42ZU1MbWpNSE8vWktudmxPa3VI?=
 =?utf-8?B?emRTamtUT2V0WWJ6RWlDNkNQd3ZGYndpdGtpL1lYTXdnYlYxSTlCVXh6QzdT?=
 =?utf-8?B?T3YyY2pSalVSVTBHSThMb21sRVR3Q3hGK204YXh5SUEwWjFNNVpEdlBYdGI1?=
 =?utf-8?B?NTA0WndLMkpjbjNqaXhXNGx1MHc3RU9KcFE1ZmUvWmd3Sm9jbFRrTmNuMFVR?=
 =?utf-8?Q?h/j5L5GKCZsL1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1pUOWwrVHFiMkF4WXJRUmxIS2o1WjBQdytHVzM0bE9UalN6Unk3c1hFVUpt?=
 =?utf-8?B?YmZMM0l3dWVtVlc2NFNSeGZYcjRRays5RTBiMXU1V29PM2ZpMFhVK0h2WVZV?=
 =?utf-8?B?b0tpWkFyMzJFSnd0SGhlUE9ibEZpbGNMWFdwTkRpYy85OFd0bUFjbGE2TjdY?=
 =?utf-8?B?ZkdpNTNWQmpjeHBuME1FZ3hzYzhPamJ2UmxKeEM4ejV5Ym1jYjh1aHJCdzBJ?=
 =?utf-8?B?QXdpQk5USUV3clozVGRrQTJJYmhveTJ4LzFLQUlVaGg2RHltMURLa3FqUWZE?=
 =?utf-8?B?T29NZlBiK3NLem1yZnZ4U0I2bkJjMHBTQlptUVhyRGV5aWlqelJYSFVkRnRp?=
 =?utf-8?B?T3lVdUIrbUc5YTVocjBQL2JSaUhrdmVpRURocGZicytBV0JFTWdFczVNQy80?=
 =?utf-8?B?SDFYNG13QkFWL2I1azNKaDRqeWJqb0NST1E1U3RNeHQydGJaYm5xcHJBU1dK?=
 =?utf-8?B?dFFwV0VtbHRHOFAySnVYNXRWZ29hVEZEd2Rub2dwK2laRktVSGZ4RkhqQWZT?=
 =?utf-8?B?NG4wVElFMzU3cXRjbUNzZ0ExekU4SlBSdG5IakFuWGc0cDJaZml1NVRtRFl5?=
 =?utf-8?B?OFRZUDNvcCtPRXVWYjZwVFBqV0lsODJqeFlIWGllWlpiUk5Pd0RHMVlwS1Q1?=
 =?utf-8?B?MnYxS3Zwd3dZeDdvSUE2bG5rL0plbjJVMDlZaXBUVCtJaFlMOU5rM0hwemYy?=
 =?utf-8?B?WHM3VFcyc0U3RHNFQlVlSC9OeUkwaXVybE9qNERtS2dWUi9TRmtrNXlYeCtT?=
 =?utf-8?B?STFqV1ZRekhuSEo2SGU5bUQwYUdhUjg0a09HbUxZSWdoODRSV2lQY0NsVnpr?=
 =?utf-8?B?Tkxva3JUNkRmOGdhU0ZuT29JMm04VHJySUpWSnJIbmt4MkNMWnd5dG1Zc0o0?=
 =?utf-8?B?NDArL28xR1lMUnZhTWxBbmsrUGxBcnNvVDNjZjZYRGplMVR5L0dUYWZNZzJJ?=
 =?utf-8?B?N05nRTJPNFVXZ05MMUxmSG44SFBpZnhnelk1RWtQV0ptL3BPbGRQZjFlaWpJ?=
 =?utf-8?B?Qm1JdnBHdTloZm1rd2NFeXFDN2F4UktNUUh1dWN4MldFQzhRcjk1S1hEdDBu?=
 =?utf-8?B?MUcvRUNsTjZrcFBqVEs0Z3dUdFpTVW44RWJtTnJtRDJJNEp1aTlNSXREd2Vr?=
 =?utf-8?B?Y0k2OWhkMS90OUEzVTRUNUpNelBaMXhldm9DMTJmck5RbU4rUEVnT1NBaUVh?=
 =?utf-8?B?TXNMeHg4ZFhXWjI4WEFOZDRUSjd0YmNwYy9EQUQwVzN4anM3UG5hejU2a0Zq?=
 =?utf-8?B?aWZuc2RVOW9aZHZlUnBBTXNEa2V5QkgwdjJ6OTNKQmF5TmExYS9wcGVsYUUr?=
 =?utf-8?B?L3F2N2x4ejdwZXM1dkpXR0FKQ0VEMU93VWJMbFpOUk9FUGU5bFEzKytlbFhs?=
 =?utf-8?B?UFhBckJlMGxGN1E1WEFFWXhiZk5iYmhWbjZwSHZVK25TUkFyVFFaVjVKNFlS?=
 =?utf-8?B?WlN2RklNNXhmc0tzWS83OXZCMlZsTzRTS1RqclBJNkhXK09tRzRuME0xUnc0?=
 =?utf-8?B?SUdZRis5ZkNEUVJWTy9NUDVIcUpmU3ZIWURkNmJqMnJhc0QvblBWNlI5L3hn?=
 =?utf-8?B?M2hiOXYxNWVzL0hHMFFDT0d0OEpCVGFwRktPT3Q1dG92OXRibjdlSk9HTnAz?=
 =?utf-8?B?cHlyY3h0dWFCMWFTUitrZ0d5bFRWVXh2Qm56S3dNRVFEVTJPdy9vN05rK0Ra?=
 =?utf-8?B?V0ZaNzJ2ZmxpRWRqM0VyWllXYXo2WHRZMFRiTkhQQUd2VUZWcWV1cHQ3T2Vn?=
 =?utf-8?B?YjEza0doVVloVUZkWHpVUjdTanhleG9LYnBTK3JuZ2syYVpxbXdEMmVXcmFt?=
 =?utf-8?B?ek1iS0xWQVdQT00ydW10TTZzUUNEWWxiUUtqV2VXKzVqellWdnFDbjVydmRo?=
 =?utf-8?B?MnpQaHNOUXF6SjhyWWo2ZnRxZ1ZUY05PbFlza2hxRFJYbE5LU3RwYm10WmpT?=
 =?utf-8?B?VnZzT3ZWVHR2bk1xajc1WDd3WUZBQ05GdlJDeEpaSllBMGxzcHJNdSswa3Y3?=
 =?utf-8?B?dit2eFVZSUdWU21KWUtpYmNueFpqd2lpbE5ncnM2TzlGSlZhZVFsUStteEVm?=
 =?utf-8?B?NkJPa053aVU5OFZkckp4SkpkMmthWXc3cDQxTkx6alErMW4rT0M1d1J4Nmtn?=
 =?utf-8?Q?3OdVIFf0mIVUdzT/1yCCyoh9v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f58d39fc-457e-4606-470c-08dd474034a9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:25:24.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bfL5ZsJiQqrrQIoaZiCw4Ks8CwUabOGIAzjSvYpWmNWhNHtNFWQ1AY31uRie9H3S0+879c/kRPwzUF0S3IFFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
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

Hi Michal

On 2/7/2025 12:59 AM, Michal Wajdeczko wrote:
> 
> 
> On 06.02.2025 11:43, Riana Tauro wrote:
>> Enable per-function engine activity stats when
>> sriov_numvfs are set and disable when sriov_numvfs
>> are set to 0.
> 
> instead referring to magic 'sriov_numvfs' attribute name just say
> 
> ... when VFs are enabled / disabled

Okay will change this
> 
>>
>> Also restart engine stats when VF's are reprovisioned
> 
> shouldn't engine_activity take care of this on GT-reset on it's own?
> it shouldn't be tied to PF config/provisioning code

Wanted to add it after reprovisioning of VF's. Will move it out to
guc code
> 
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>>   drivers/gpu/drm/xe/xe_pci_sriov.c          | 25 +++++++++++++++++++++
>>   3 files changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index b1d994d65589..25855dcb6e42 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_guc_buf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_db_mgr.h"
>> +#include "xe_guc_engine_activity.h"
>>   #include "xe_guc_fwif.h"
>>   #include "xe_guc_id_mgr.h"
>>   #include "xe_guc_klv_helpers.h"
>> @@ -1972,6 +1973,21 @@ static void pf_reset_config_thresholds(struct xe_gt *gt, struct xe_gt_sriov_conf
>>   #undef reset_threshold_config
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_pf_engine_stats - Enable/Disable engine stats for PF and VFs
>> + * @gt: the &xe_gt
>> + * @num_vfs: number of VFs to enable
>> + * @enable: enable/disable
>> + *
>> + * Enable or disable engine stats for PF and VF
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_gt_sriov_pf_config_engine_stats(struct xe_gt *gt, unsigned int num_vfs, bool enable)
> 
> wrong place
> this is not a config/provisioning related code
> 
>> +{
>> +	return xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
>> +}
>> +
>>   static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>>   {
>>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>> @@ -2362,8 +2378,10 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>>    */
>>   void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
>>   {
>> -	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
>> -	unsigned int fail = 0, skip = 0;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
>> +	u16 num_vfs = pci_num_vf(to_pci_dev(xe->drm.dev));
>> +	unsigned int fail = 0, skip = 0, ret = 0;
>>   
>>   	for (n = 1; n <= total_vfs; n++) {
>>   		if (xe_gt_sriov_pf_config_is_empty(gt, n))
>> @@ -2372,6 +2390,10 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
>>   			fail++;
>>   	}
>>   
>> +	ret = xe_gt_sriov_pf_config_engine_stats(gt, num_vfs, true);
>> +	if (ret)
>> +		xe_gt_sriov_dbg(gt, "Failed to enable engine stats for PF and VF's %d\n",
>> +				ret);
>>   	if (fail)
>>   		xe_gt_sriov_notice(gt, "Failed to push %u of %u VF%s configurations\n",
>>   				   fail, total_vfs - skip, str_plural(total_vfs));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> index f894e9d4abba..a5585b178e6b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> @@ -62,6 +62,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>>   				  const void *buf, size_t size);
>>   
>>   bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
>> +int xe_gt_sriov_pf_config_engine_stats(struct xe_gt *gt, unsigned int num_vfs, bool enable);
>>   
>>   void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index aaceee748287..612e64efb43c 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -62,6 +62,21 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>>   			xe_gt_sriov_pf_control_trigger_flr(gt, n);
>>   }
>>   
>> +static int pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs, bool enable)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int ret = 0;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		ret = xe_gt_sriov_pf_config_engine_stats(gt, num_vfs, enable);
> 
> can't you directly call xe_guc_engine_activity_function_stats() here?
first patch had that. I added to pf_config for the restart on 
suspend/resume and gt reset. Will move it out.
> 
>> +		if (ret)
>> +			return ret;
> 
> should we give up on the first failure? maybe just track first error?
> 
>> +	}
>> +
>> +	return ret;
> 
> it will be always 0 here
> 
> but if we just track errors instead of early exit then we could print
> message here:
> 
> xe_sriov_info(xe, "Failed to %s function activity stats (%pe)\n",
> 		str_enable_disable(enable), ERR_PTR(first_error));
Will fix this.

Thank you
Riana
> 
>> +}
>> +
>>   static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> @@ -94,6 +109,11 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>   
>>   	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>>   		      num_vfs, total_vfs, str_plural(total_vfs));
>> +
>> +	err = pf_engine_activity_stats(xe, num_vfs, true);
>> +	if (err < 0)
>> +		xe_sriov_warn(xe, "Failed to enable function activity stats\n");
>> +
>>   	return num_vfs;
>>   
>>   failed:
>> @@ -110,6 +130,7 @@ static int pf_disable_vfs(struct xe_device *xe)
>>   	struct device *dev = xe->drm.dev;
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	u16 num_vfs = pci_num_vf(pdev);
>> +	int err;
>>   
>>   	xe_assert(xe, IS_SRIOV_PF(xe));
>>   	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
>> @@ -117,6 +138,10 @@ static int pf_disable_vfs(struct xe_device *xe)
>>   	if (!num_vfs)
>>   		return 0;
>>   
>> +	err = pf_engine_activity_stats(xe, num_vfs, false);
>> +	if (err < 0)
>> +		xe_sriov_warn(xe, "Failed to disable function activity stats\n");
>> +
>>   	pci_disable_sriov(pdev);
>>   
>>   	pf_reset_vfs(xe, num_vfs);
> 

