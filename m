Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E46CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 02:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5670110E6D3;
	Wed, 15 Oct 2025 02:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adZIsfzj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B781A10E6D3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 02:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760496752; x=1792032752;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k+ySkEOpS3jIDrBWQrePGL2DHwmPzDfCFgL3zZYbaVU=;
 b=adZIsfzjZO16a8qyxKepD+/EQ2maHWxIoxICy4aNGIA6lSJhmhfqEyha
 l4kWVO2sGvxxmxEH5nc3MpVDNMPLrG3ghHGfWHDf+W/2UM23fF7RolPUO
 3tltZzJ6/D4WAjWMZWX6v6JUmD1pMwPjavaYUMFkUjSZ7hyBmjtG1gvPR
 He3OwLJHyR333Dek24ZLmW9fwHaDuBcN15WzpBShBtERNtfuLbVPdGNJ9
 0M8aDaD14En+myvj3H9e7eyWg3EfIoeU7avk1Y+m+gsXynfq/jyDET2W7
 siz/vQ5gXpTkiP3RFK/WcYFr5lzOsD0h2nUfGvRDAMFmXTgZcxsl26pPR g==;
X-CSE-ConnectionGUID: nL1J1Vl6SaWDx2JB+RTRVw==
X-CSE-MsgGUID: M0MnClbzRAKs3jrY47zS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80297300"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="80297300"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 19:52:31 -0700
X-CSE-ConnectionGUID: E9ZFM2slQW+k+rGXQjRlcA==
X-CSE-MsgGUID: 4Gt0tdzcTgyhutw5RjBxiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="219185151"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 19:52:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 19:52:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 19:52:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 19:52:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlDQifPGKGUQJGfdwLaByjFSyML4dfwNecVxQ8QbDGlLK4I3Q6mjrnjZMD5pZ4oJf1UrG8RLzUvd3e4Uo/EbgyQkxXID6z3H2O+9hSi91WWcE9A9Tx5y44T8oiXA+ytksRpQX1Z2J3TYraIXukXYerqH0z0sd9zy71e6I80YOCYSQbJa8NwFxfAO/yevqf6UfNCTnkLcdMF3Y3HdAU38KXwworECUj740VFEv9RNUTJarHLenr/l6us2tKjmVHmN1b731nQqdrNOmp8hNATgJEJN3GX0oDgvBwwhioOR8PFGUJR287jgY9wcKfp3riRJnAKLH1gqbu+sGZgvG5+rGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQu35aVEXb4yxS+X/tNtlUcpxQDeWsEGpSk19kvhEds=;
 b=i9HSajmwGYqTEP2QPEQNAx/fvcNnYtA937TXAauySsI2OxOf8BU8ultrimSgDiOU3SJJuK4z4bbpfmPvv952PXRIW+4+yD/mRAvPFONScB+4eO+kbibLveabgvqQbImLtrgIGzdgtcQP4rIU42nMmAOuLhq136+4M9+2buXIu1tK2LyW1dzN1QwNYEK5UZlVVulROV8vCyiTdF2nBveRj3dUFm+glYPHFrHEDHwJAileB2hmOiHEKGZlfhlesG8+LPCZO1L24CnezMhbHb//o5iuzg3QwSTDkwq3qPta4mU7njt7tAtxVxzt55HsZT3KBhlDHlgU80wsGrLvWRByxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 02:52:27 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 02:52:26 +0000
Message-ID: <2bf254f4-d07f-4ca7-9dda-6109bb97c200@intel.com>
Date: Wed, 15 Oct 2025 08:22:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/23] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
To: Matt Roper <matthew.d.roper@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-21-bfb74f038215@intel.com>
 <46abe5ec-3fff-4019-8af3-b273b9627f8c@intel.com>
 <20251014181436.GZ5409@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251014181436.GZ5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0152.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::11) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 28544471-652b-4e7c-fa7a-08de0b95dfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3R4WU80dGV0UWF2V1U1WHl0aVNRVHM2dzg5NmdBM2J2akVvdHAvSEFJcmNm?=
 =?utf-8?B?S2tXc09jbzE5M0RQZXBETFhWYjdySDVOR0RWSjBmamdvN3J6THRKYVJuMSs5?=
 =?utf-8?B?K2tBL04zNzk1MS8rWHZzOS9CdlE1MEVROHdLNkxWUHhYdERKSGwwbjFScEdW?=
 =?utf-8?B?QjE5SmNtL1NCVjZad1Q4RVJUcFNwVnJQdzRvOWpQcDlyME9OSHNOYVgxM2ha?=
 =?utf-8?B?enVudURiVVRKQmFCV3REQlNQZU5Oa3ZHNGF2ZjhKeTlRMFdPbEVDalMvdVhw?=
 =?utf-8?B?c0ZmUjFicC9lK1YwYitCbjc5OGRGb01IeTRDaDdCaU1WWGFmTy8xUG9ESlln?=
 =?utf-8?B?anU2eHd5L2g4M2NBM0lPak5zYWEzVzRBVksxMVFDRFl2TmFwUFZyQUZnNHo0?=
 =?utf-8?B?dUNlMll2US9kSFM4S29NdFFXUVZ3ZG5RWGNpdnlRaTJZaFpOeVM0YkdIRDls?=
 =?utf-8?B?Y2Z3MmY0UmVtamVxVjI0S2RQUGM0Z09IWWh6bi9iRGVjbkJwY1MwQTVtbmVW?=
 =?utf-8?B?VUR1NmNqOVYvUUhuTFZxQllQNEpST2VNN0VaTEdIOTZaMVd4dEpGVkI3TTVJ?=
 =?utf-8?B?TDU5NUF1UFRBUmNmR1pLa2Y2RmRWNW9MSGd3U2ZYU0FMcW9KNzdEeXlrNDY0?=
 =?utf-8?B?ZVIxZ0dFS2pkY1k3YllYcXM5NHE5WW5mcXBEK1RuWWNJK3hmb0M0N3F4OUtW?=
 =?utf-8?B?THFnVkhSWll1S2tvKzlIcG5PUCt6dU5wM3FxSVFSSk1uajQ3Zk14Q2Jiemo0?=
 =?utf-8?B?a1BLUnZQVGhORE1JcUFBVjVJK1ZVZXYrQXdteERaMEY0eVhidGMxVlQvZ1cz?=
 =?utf-8?B?MlBOQWQwek1McjFMZ0RtSDFaU0V1NlZuS09GQVFZaFkzaG00WHZUWWlYTnlz?=
 =?utf-8?B?eFUrVVN5Z2tMdzNsY3RJL0twZGYybFF6WjRleFk5eEZyM0ZYd3MyVUZCNkIz?=
 =?utf-8?B?MElaaGxDZW9GMGthZHBPenRPd1JBMmdpSTVsaG50TnB3WEtzNy9BdTJKQTFS?=
 =?utf-8?B?a1pUT2w2d3dmdDVwdDFWT3FmVkR2R2tqVXh0M2tuREhidUFwL2lQei95L1Rq?=
 =?utf-8?B?SVBSeWt1MEp4QjI0VXdCTFZ2cHVWb0o2MUtwZzZxSk14THFDNzFPMk0rUmcv?=
 =?utf-8?B?d2daZzhmNWFxdE9LSEtUcFcxNHozaFdCRi9YRURGY1dlelNzem53Y1oxcjBJ?=
 =?utf-8?B?OEMyVkE3bEg4L2FjcXdvTVoyazFsR21VMUtKN3NqWGlFOUIzRmhlVFVWcEpO?=
 =?utf-8?B?UWFkZ3FpR2srRW12WG5XOWtLMzkyTHF3U3hxUFRyYnBKZVR1d2M5dlNFMHor?=
 =?utf-8?B?SjJhT2h3S09BekYydUFiNFQyVnFROW90WXQ2U3ZNZ3VoZUNVajYwb1Z3WkhG?=
 =?utf-8?B?L0JhMUJsRGVYdzFES3VFMGdhUXE4NTlja0VUMVlNMGRNeU5vL0wyS2RsMTBE?=
 =?utf-8?B?MG56eTdSd2pWa1VtbjE1OWFZdk9GR1c3bXZtTkFOZHhMbWl6TldGQStidC9z?=
 =?utf-8?B?S01RSFc5R3loRTlzVVlTZm5JMTFHZ0hpSys5OElTQ29iMFRSdyswZXJoNnh5?=
 =?utf-8?B?YTBITlRZWWxhUTVwWEtDMmk2YTlGSHcvYzY4MkkrdzFzN1hza1ZaUENUTzh4?=
 =?utf-8?B?WVl3aDJXY0MrYmw0QnVxdVBNelhwdnZ6N0tvQkFXNXlRdi9tUHpZZ1ZJTkxL?=
 =?utf-8?B?NDZXa3VJcmdZMUxrMFZ2VTYwMDRwU0tsSWUwUzViMDJSMmNqSVdTNWdVNndI?=
 =?utf-8?B?VHhUL1NZUVdtKyt0WDVOQzhoZ2VHN255a0drNmZjWWd4eUFLRFcyTHpwc2gr?=
 =?utf-8?B?RlpwNTlLZWhocFJYcWxRUzRVZzY0RUhNbytINFVZcGR2L1NiZGxuUDB5eDJ6?=
 =?utf-8?B?VzhUN2w1N0ZnMmJoOXpTVmlTVVZjMmJHM2R2REltRmdZZTJPN2I5ZDFFeUdV?=
 =?utf-8?Q?m36b0+W5EjPovP7oaLzU9ZiakkP4awgs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnJKZ1pVTW4zcW5PZCtIQ3grc2hKcCs5aEpsc2xkYWNJZjJsWHpzYW1hTlFy?=
 =?utf-8?B?RE9WWjBYYXpSTFFPeXErWGZFcEF6MDhHNWt1SGVydXliMTUvVmNLOTFJRDRa?=
 =?utf-8?B?MFBTRDQvNi9sM295UkVMa2E3Qk9YSjJwWFlVcDBqRUNDV2dMSkQ4V3hQYVAr?=
 =?utf-8?B?YnhESGpIZzZ0NFVSRVRVN01RR3NnNVE1QUdueEx1WVBTVDFSSW5WMU5ZM3Jk?=
 =?utf-8?B?WGxTbHpyREdhcDRDN3RLeDhYSEFUR2pCdWsydlVtQUxXbUo3NWpiWnRnakRL?=
 =?utf-8?B?cmpkR3VEWFhMTFJ2MUNPcmVScmNTeCtwKys3S0MwQStxK0dEOUR4c2pZTHRa?=
 =?utf-8?B?WW1FZVlpVlFjVFM2MEpYOEh4KzhqM3d2cnZtYVNzTXo3QXhIS1NYVU5YRjZN?=
 =?utf-8?B?QmxKUkJtY0N6TDAySDRaZHlmQ0E1cXVyNkFFZ1g1YUgrRGdFeFduKzhDNG1k?=
 =?utf-8?B?T0JUdjNjZnIrdDZ0aGg0S3hIM2NoWG9RSW5Xa0FvZlFJdnhGQlR6cGF6ajdt?=
 =?utf-8?B?TWdRSWpMMWtFeUczektGc1JlZHBtZzJJRjJva2N6MnJTbDJvU1BRcmNOckEv?=
 =?utf-8?B?ZWc2LzFJWkQ0OVZ5WmhOMWhYVHB2R2d5Rkp6Yk91bmpRR2ppeVU0VE45OVUw?=
 =?utf-8?B?R1AzTmQ3Nmd5WDlhSit6UXpjUFh1c2c1TWw3NzdqMDAxN3NBNFFVV2IwV1Zj?=
 =?utf-8?B?YWliREFXeDRXajBtdXY0Q055b2Uyc2Z4VWVXWUxSM01lSlBJUUlRdlFPMjVP?=
 =?utf-8?B?UnFXVG0xQXF0WjEyUm9QZkxiSmRwaDRGRWtRYnpzc05mQkdBRjdrUXlHZjg4?=
 =?utf-8?B?Uk5KcW9kMk5IUndMS1hpWFd4NnAxSzZ1Qitwb3BCQWpDREw4bFVpNDVRRWpr?=
 =?utf-8?B?Q2NUSXg4QytPS1RYak1lQm11Sml5emRXMkVwdXhFd0ZRNXZkUkxOWVMyRWxR?=
 =?utf-8?B?Uit6T2k0c1kxcTdPNEJCYWlMME54cHNJZ2M0d3plRTVzbFFoZXVwQzhiRkRT?=
 =?utf-8?B?UUlqS2QzU0F0Q0tmdW5vWW5BK0RIblZNYnNRMUk2UGtuMkhTZzcyMGlGclVM?=
 =?utf-8?B?LzZIelhNNWExS0EwRDN2NlE4NWxlNlltNFFjNjFuRzJpQlpRdHhVSG1tYzFa?=
 =?utf-8?B?WGlnVjZIZlNBM3AyODZXVEhCa1N5YUZJSWtvR296b0lXZTFuZ3N6WHN2UEtx?=
 =?utf-8?B?d29ldnlhV3Vqa3ZSQlJGMS81blQ5M0FyT1FlTGZLdFNNYnhybjZyRzZ4aksr?=
 =?utf-8?B?MGhMcGdJczQxUWMzdm51R0h6aERGR3c4RVd1TFFqeit3WVFKYUZkMjYxL2hx?=
 =?utf-8?B?REJGZGhydWhTSWNlWGhXaHBBSUswWm82ZUF3MTdreHNKSlgzWXFKMmJhU3py?=
 =?utf-8?B?Y2lpS3lZNnIyeml2OUhzQnJKSmFNM3ZzYzFGazF3U2ZnYmRJQzU0VE9rQUdz?=
 =?utf-8?B?ZTJ0MmZNTHIvRGp4a0w1Q3FqOG9yWVVDV1UwN1lmWWdkVlpaWE0xdUoxd2hU?=
 =?utf-8?B?T2w2aXNoazh4UEhMWVhJMkJjTnV1cU9MZW1jTUpFdmRoaGRMUXFwUHBTZHFk?=
 =?utf-8?B?Y0twOXVqREZhRThab3BLeVNhTHdZT0o3eEFEcDBQb3BraVM5NldXajRkMXdh?=
 =?utf-8?B?SnE1WVFIbWRWMVBYS0FQUTRJL0dsMkZRRm9iWERYMTdXUWdZcGFlQkpBc0ZC?=
 =?utf-8?B?OHlFK3pNVG5KTDdiNHIweUlKakZnKy85Und3anZ4RTh1OFEyTWt5U0M4M29D?=
 =?utf-8?B?TEtIMWRLazhFMWt4WjdUQUF5aVg3SVIySVlIRHFxMGswMDVQSUNhRmhIUHE3?=
 =?utf-8?B?T20xenZOQUdVaVNkV1d4RDBLQVdnWWsxK254amMvTGZ0cmxZc2J6dXdOTDFG?=
 =?utf-8?B?OWtwSjF0V1c1aXAwZHpzV0MwSWVrU3dvR2MwcGJ4c2ZkSFVBU1ZVNlNZUFJ5?=
 =?utf-8?B?UkNtUE5nTXBQbmhqSHhpSVAwbEJYd05FYnY5ZHJ6bnUzVitxckwzWWRmVFo2?=
 =?utf-8?B?KzRTdjJZeTRJekIwa1FMTUxqL0tSbXZPbTFiS1dvczVlQnhnaHpHMUQrMDNZ?=
 =?utf-8?B?OXBCYXRSdkVRVmdxUEd4QkFMUElCei9DTmdmL2p0N1BDdTdzMGNJbXNMQm9i?=
 =?utf-8?B?amk0RU5PYzRHUTZ0MkNIdytlb096azg0bUN5OGpDTm13VE5KZ2Zyd3Z3UlVz?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28544471-652b-4e7c-fa7a-08de0b95dfb2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:52:26.8400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDIZvj3EaoIYSCOi4lV7V8niKTJkHxAXseeqMi6RpJ6AUrunk127hASCBKC/M2doXgihy6wPCRBVkRSj5F7mx2UVOu0GtBgJingc4/u5d7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
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


On 10/14/2025 23:44, Matt Roper wrote:
> On Tue, Oct 14, 2025 at 01:39:39PM +0530, Shekhar Chauhan wrote:
>> On 10/14/2025 8:54, Lucas De Marchi wrote:
>>> From: Matt Roper <matthew.d.roper@intel.com>
>>>
>>> The compression overfetch tuning settings only apply to platforms that
>>> support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
>>> compression) some of the registers being adjusted by this tuning will
>>> not exist or may have been repurposed for something else, so we should
>>> take care not to try to program them.
>>>
>>> Note that our xe_rtp_match_has_flatccs() function will also return false
>>> on platforms that do have FlatCCS in the hardware design, but have
>>> compression manually disabled in the BIOS.  On such platforms the
>>> registers still exist (and it would be fine to continue programming
>>> them), but they would have no effect, so skipping that tuning is also
>>> safe.
>>>
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> The patch in itself looks fine to me, but, the patch doesn't specifically
>> play only around Xe3p_XPC. Maybe we can move this patch out of the current
>> series, or if we wish to keep it here, can we instead drop the xe3p_xpc from
>> the prefix? Thoughts?
> Aside from PVC (which is Xe1 and not relevant to these tuning settings),
> Xe3p_XPC is the only IP we have without FlatCCS in the design, so at the
> moment this patch is specific to Xe3p_XPC.  As a general architecture
> though, if we eventually wind up with other IPs down the road that also
> lack FlatCCS, then these tuning settings will also not apply to them for
> the same reasons.
>
>
> Matt

Okay, makes sense, I'm still skeptical on whether this should be named 
with the prefix Xe3p_XPC if we expect it to carry it's effect to other 
future platforms as well. For that reason, I believe, the commit title 
can be 'drm/xe: Skip compression tuning on platforms without flatccs'. 
This in itself engulfs Xe3p_XPC (and any other future platforms). But, 
consider this feedback as only a nitpick.

Since the changes already look good,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>
>>> ---
>>>    drivers/gpu/drm/xe/xe_rtp.c    |  6 ++++++
>>>    drivers/gpu/drm/xe/xe_rtp.h    | 10 ++++++++++
>>>    drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
>>>    3 files changed, 22 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>>> index b5f430d59f805..22a879270c1ec 100644
>>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>>> @@ -376,3 +376,9 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>>>    {
>>>    	return xe_gt_has_discontiguous_dss_groups(gt);
>>>    }
>>> +
>>> +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
>>> +			      const struct xe_hw_engine *hwe)
>>> +{
>>> +	return gt_to_xe(gt)->info.has_flat_ccs;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>>> index ac12ddf6cde6d..92f0d16110dd5 100644
>>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>>> @@ -483,4 +483,14 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
>>>    bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>>>    						  const struct xe_hw_engine *hwe);
>>> +/**
>>> + * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS compression
>>> + * @gt: GT structure
>>> + * @hwe: Engine instance
>>> + *
>>> + * Returns: true if platform has FlatCCS compression, false otherwise
>>> + */
>>> +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
>>> +			       const struct xe_hw_engine *hwe);
>>> +
>>>    #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>>> index fd58ea5e78bf6..7c140d8cb1e07 100644
>>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>>> @@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>>    				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>>>    	},
>>>    	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
>>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
>>> +		       FUNC(xe_rtp_match_has_flat_ccs)),
>>>    	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>>>    			 SET(CCCHKNREG1, L3CMPCTRL))
>>>    	},
>>> @@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>>    	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>>>    	},
>>>    	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
>>> +		       FUNC(xe_rtp_match_has_flat_ccs)),
>>>    	  XE_RTP_ACTIONS(SET(L3SQCREG2,
>>>    			     COMPMEMRD256BOVRFETCHEN))
>>>    	},
>>>    	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
>>> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
>>> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
>>> +		       FUNC(xe_rtp_match_has_flat_ccs)),
>>>    	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>>>    			     COMPMEMRD256BOVRFETCHEN))
>>>    	},
>>>
