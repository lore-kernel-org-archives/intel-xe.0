Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2906C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 20:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674ED10E71A;
	Wed, 11 Jun 2025 20:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVsWHLNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90DB10E71A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749673126; x=1781209126;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C7MMx26YxvKJNq/0Aa68qksp3LwWDYVqrQ9D8hGn5sM=;
 b=HVsWHLNXvXvMOatkB4SZe4VNWy9W9KlnCzBl1c6ZGFnZaocnc6H0FU3q
 GuPp21Vky3ju4kyQpU2hxhdbaMMyc2UjLYoPIvypwGziX36Kd0Z8Czao5
 V2QEKJblpcFdjmIyPTZZTu0eo9qKjTOpZG88URput/DIwP17F5JoCqJH2
 iXII94MxK7NNu0f7kPPVnwMqiXe40yip1CSRmhW0DCRcXLjbMmpzeToXR
 NSmFxlGpnFfDNIRNdVKF70n53vBwvcODsPhPg9g9ke6cMY3BbNdeL0NLY
 F0RvejwBF/wJ4jyss9WPfaBkWrZwCfeKsGIf9jh7fR0bVZMzfPx3b08Mv g==;
X-CSE-ConnectionGUID: vQ8GQhCSQNiPUr93G4Z3fA==
X-CSE-MsgGUID: EvcrJ2x6S7CMH2w50vBELg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51708762"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51708762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:18:42 -0700
X-CSE-ConnectionGUID: 4wcSwhf4TsiifLwmxoj54Q==
X-CSE-MsgGUID: xHov4tn6RiyGGZuwc1q7/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147195902"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:18:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:18:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 13:18:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:18:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwcqZfw31fdqltIuh4kX8asXziIjgpmrG2CHuLDin7JitWis2lQUinAJ0MsIS5aDDf/pugnO4ebxqQRfm5TqkltYLy8Z9/WWROGtwqh5gP+tUY3vRZOi9Xrql3KnkycENRI1Af1cIYHk2zwDlEQgAlqZGsnKq477LfcS7hP0JUyHH/NbQjIh7OzbBATw3szJstEGPOHZpHWTEJRpqRazO0G1llkf+PWpjN22df9O/Te5PccdDwd3J6itiNlxNGRIXoMsFaayTF90QrTYUsQgKFl67x8q7n9dG04YcMzqdF6wBItIRKAeMCma3u4yxOig7FCQZFG8GEIPoklfKJARLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1Eq5d1Kb/P2jk0ycP8bcff4T5gtZiHoHk537XFV2gg=;
 b=d5DrL/wxRTiLzZKgPkuGwkpsTUG28jNgWYDbaKjigxWYL6tyz0zESUaTM0kZ2cG2lpX7oR0vdaADjHTvLkkkZuT55g5AFMmqbprRC1xNBdCKkfCr14YPASK8Nj6URFQ3n0XmdXSNXmg63f27whZ5SI1VYU6qZyCFphfx+8aji8mcQGOuU5tlmH3umo08627Ggs8XA0Llh8XK300+3G3KBdg/Z6WQWwBlGUZl3qxb0/4Ti8BHDWmV5phKosaH94sHxnoQAejDzl6AxhO8QH3IkIyzv8KaDw4Fqg/izNfv5wf4dDVnupXBQiK9PFLueLkkyQkd/PJam7Na+c/113cOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.32; Wed, 11 Jun
 2025 20:18:39 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Wed, 11 Jun 2025
 20:18:39 +0000
Message-ID: <4613c9c5-f1da-4c26-91cd-09f08181aa9e@intel.com>
Date: Wed, 11 Jun 2025 22:18:34 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v4 2/8] drm/xe/vf: Finish RESFIX by reset if CTB not
 enabled
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
 <20250606001823.1010994-3-tomasz.lis@intel.com>
 <80e07435-4db8-4456-b8f0-f8864b4d4574@intel.com>
Content-Language: en-US
In-Reply-To: <80e07435-4db8-4456-b8f0-f8864b4d4574@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 467ff0ca-3d61-49c7-80ec-08dda92526f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXZlOTFqOVMyT1ROL2E4dHhOYlMzNFF5MDNVMUJGL0R2eU94YUxjb3JiTVpW?=
 =?utf-8?B?RXFSVEYwVVF3V1FMd2ZQVHJVVHhIQjhFVmFHaUV0akp3UU42R3daeEkxdEVN?=
 =?utf-8?B?Vi9obEYwTjJrby80Z3VMZzJ3cDg5L2VUaUFGQytPdlhCNGRncVhVY01OeEk1?=
 =?utf-8?B?YXNmbmpFUUJFY21wSUNCMGwyT2c5MmRuTEt1TFlpb0VLTVRUSzdKRGk2dith?=
 =?utf-8?B?cjNSOUFXNHF3V2U3d0NySlVEdkZZaHJraG53eFRHa1lRSHk3bnBEUkxkdm9F?=
 =?utf-8?B?b29ZKzZ1dm14NzRwdlJGa3VnNno2cUZNSHpnbVJKdGdScHp3S2lTNlNIMlFv?=
 =?utf-8?B?YWdJWGo0L2hNYjFTM2VaVXFRNGpwY0JnYkdXdEpyY2JhYnphKzZ5NlhsN0RP?=
 =?utf-8?B?a2NKeXVBOFJDQTFpNEFhdE0xUnlicGVwWG5kU2tsa0ptVkp5TTFNL3RuSCts?=
 =?utf-8?B?V0RSUS82Q1pLVXZhdDVaTEVYVWlZbHltSGJKZnF2c1F5N010cVhhcSswSUcr?=
 =?utf-8?B?VjEzMXMyRkx5OXd1clRSWmswZzhwL3diUEJWL1NhbUhoYzUyaWxmaVo2cTlN?=
 =?utf-8?B?dERjMmo5Sk5URG1wQnhXYmx3czQ2aFVqcUNUdVM2RkZaaGFhOEhuUlJGVjda?=
 =?utf-8?B?QVE0TlpMV0VoYy9ENS9vOGEvQnRCaDRNTDNCVTdXUWNPVWZMc2JIUTc5QzJ6?=
 =?utf-8?B?VXo1TUd0d1hHUFgrZVQ2eWxsT2FIUndrQW1Va2tieE5menRpT25qeWxJcEtM?=
 =?utf-8?B?SnZoaW03V3JtR2tDcGFjTjgySmNhdzVLdlZIZHUrdUg4VmR1amtKS3ZRK0o3?=
 =?utf-8?B?MU9OL0EzY0NSdFpDYTErWDZSbE95d0VZRm5FRGV6UmUrNm12UkN1VUdXUmdr?=
 =?utf-8?B?eDdacE05LzFka3E1S1orbm02OWhRVkpFY0tJb2x3UHY5MXBhNTY2eUhhZE5Z?=
 =?utf-8?B?UFlRQlk3SWlhVVdWbVdwM0VrR0JpL1hjU09UQ041NzFXdVlwOWJzRGpFVUxh?=
 =?utf-8?B?dVQwbnVRaTVVM3dvWkkyWE5EZVJuODM5NHBCOW9GZnB4SFJXWUhCUTRIbGY5?=
 =?utf-8?B?Sm5ZQ1RuaGdheVZsOXc2bXc5MWFyZEVOeFhBMjJXZm8valFxVk9HVW5LTytN?=
 =?utf-8?B?NW1pN3J4ZU8zUjlYQy8zMzFCa05hUERDVzlsS2ZTNSt6RmZjemhheHVabDky?=
 =?utf-8?B?VlpURWQwcnVEYVJlMGRGSjNKV0NpZ01yby9KQ0QvUFhpLzhpRmpNWXNHeEVq?=
 =?utf-8?B?eUc3T2VyaXNBdFFZQ2JqTGlCM1V4dXlEZXp3UkhuR040bml6NnJodVZPUStw?=
 =?utf-8?B?TWZaSFYxbzQ5REtjS05DcEY1NXZUL29EOGl6WlFXR29CT3BNSWtLcTBnS2hT?=
 =?utf-8?B?YzlNdVNtMnJxeFZObWZPWlJOeEFXUUxNTi9LZE0xSGZIZzA3cmdpUk5IdEF0?=
 =?utf-8?B?clp1d2xCcFlPc3IyWWlCVWl1MjQrSWJhdGRuMGhmY1BxR0pWUE92cExUQ3BV?=
 =?utf-8?B?M0dpWlY1d1Y0WWx0SExLZ003N3VOTnFGcy9uNERtU242SWxhQnhSQTVWZSth?=
 =?utf-8?B?RmhDNmVEV2lNUmkxcnpvelh6Z0lpZW13dWZHcUZhQ1I1WWtyTzEwaEIvQlhn?=
 =?utf-8?B?MnU1WWx3ejQ5cXFQN3NVKzByeVlrWWRpZXNXMU1kNkI1bk8rRHBjdktOaG80?=
 =?utf-8?B?T1BqVEVlNEJoNGNHTWp3eG5zcWU2cG1PNFNYbUtWdVVHREc5Qk5FK2NQUXJM?=
 =?utf-8?B?Z2tJSVFYeEl0eU0zOTRPTUhFUVI2RENGVWIyd3Fnai9vWHhrU1lKN2xSLzFj?=
 =?utf-8?B?aFFJNG8xY1dIV1NGUVlISnBaei91azI3SExnUzVFRk5WYVRMMmtLR0QxRFJ0?=
 =?utf-8?B?SHhJSGFEeVB2ekFUNlZZZkdzZzkxWHZXMFNHemhQWnhOSFRSTnl6dVRyZ05o?=
 =?utf-8?Q?VGLPX95Rf3w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTFoSmp5blNmc3BMYlR6aU1uQ1dkQXRsSDRlUmdRdU1TMjZHUjBiVEVCMHl5?=
 =?utf-8?B?Rnk2T09KekxvOVppWmR2dzBkaVR1cnlIbm90N2hpdFR3aUc5Qy9CT1drLzBH?=
 =?utf-8?B?QWxzOU5aNFNKdkFjSHdPelNRU2puR215MG1WYkllRlFabGxjSERpZ0xYSlZS?=
 =?utf-8?B?OWNZbjRwTlNLSXNtYWp2WlY4WFBSelJQVlVnSEZlL3dDaXFuME9tVEFTOXBy?=
 =?utf-8?B?RnRkeHU4NEw5NHUxd2N2bWc0TEdxWUVadkFVWmxDUS9xdDBVcnhCVzNOaHEr?=
 =?utf-8?B?UGhFOVN4d3pac2I0U05WTGUwTzFTMTVPNWd4RXFSSTVaL0xIUmFWS2dybWl1?=
 =?utf-8?B?YnUrcTlJNzVTVSsrYXNNeXdHaFc2bktMRDZDOW95WC84UCtqZkhOTFFWWVla?=
 =?utf-8?B?eEgyNWUrNDBMWThmL2F2OVBRb044bmJmL3BSd1I2Y3hCcEo3VTVySFBJQmxB?=
 =?utf-8?B?aTY1cHViNEF0aXlZRTdTRWR4ZDQ5dHlXTGV5aS94Y3hUUVBrZmFxZFdPL2JB?=
 =?utf-8?B?eE9CU3VDK1NjNURtNlF1blJaVHBBUlJtNks5SGZwTFJiZ3YwY3ErTkhONEMw?=
 =?utf-8?B?bWsrZTJnK28yb3ROR1YwRjM3MmxMR1lWNFdZZ3JrRVZiejU3cWVpNCs4eE9K?=
 =?utf-8?B?Y0Fqcm0xa1VQU0tRZnNNK2l6ZGFhRlR4aE1nUStLeFlmVVlaazdCYUtBbFpr?=
 =?utf-8?B?S2JwQktsV3hUZ3ZnTUw0QWJyUGJCZEZ2VUFQUGRtdTRzSlA2M3JwVHZqY3Zh?=
 =?utf-8?B?Uk1HTXdSV1Q2b01ZSXF5VzBhOHJwODlYZ2w2aS9iM09NVFI5SE1HR0NKZmlL?=
 =?utf-8?B?L2dsWDgrSE5FRHAvMGZNb1ZJN0lzS3NtNjBVQW8yUTluSkljTERMdVYxOGFW?=
 =?utf-8?B?N1FtMG1QeXloREhuT2wzaVhQQWRJTTB4OTF6c3lPVnlpQ1p1OXhyYXFoL0Er?=
 =?utf-8?B?V2M3SXZheng5N1VWMXZCQWdDWVJxTEd2WjdnNG5HL3REa0xpTEZIS282NDE2?=
 =?utf-8?B?KzZxSUFiaytXSmhFamdkMzdmRlZJdmMweEhBVkFHbjBVZURsYXpqL0xkNWFk?=
 =?utf-8?B?NTBOa0RJK2JZMHVzZ0ZKSU1VZi9zYWhKS0U5Z3JwTjJSVkVvM1lncEtHdmp5?=
 =?utf-8?B?NUtmRCtUQ2tycGNEWEQyZ0w4NUZ5RUc4YTBjanZRcURPSEc4QmlBVTA0KzAy?=
 =?utf-8?B?U2VtRlVybk9rb1BLamczbjkrSFNZWTA1aDZFV1RDcHF0dUpTQ1krcHAzenFy?=
 =?utf-8?B?TXcrZGtycmZuWGRzbWdkQWNqd0E0WTBQOElwZ3BsV1BwS0VIQi9sUzl1L0ZT?=
 =?utf-8?B?aWNiQkVRMXdqR1pjTDhpNW00RXE5aExiZlF2Vit4dFlRMWRXeUE4R00rRDNo?=
 =?utf-8?B?UVlhYURSclZHc2xid29BZE9wTTdjbjRwQVhlMk1PQlMvZWdBYXYwR2ZJMHBN?=
 =?utf-8?B?NFVXN05WRVd2WGhSQWQrNkZhbDdUeUNhU3kwR0o5K292bmVUMmZTUllIR24y?=
 =?utf-8?B?bXJKTTNDUlUybUc2QVEzdWdIQ3V0bmV6TGNrK1BvN3VreGRzc0h4ZmdETVdH?=
 =?utf-8?B?bjJpRzRVVlJFTGk0V1lpRWcrcE5jQWxMZ3dUVFVsTm1pMy9EdVQwbURhVHBx?=
 =?utf-8?B?TXJNeU1OWDV4b25VV0dRbGpSYnFBeE5NY2Y5cFFjUnN4cERDV1hxZ1F4UlNS?=
 =?utf-8?B?ZStEZDZ2YS9uWHhBckpTeFR6UFU3Wmp2QURSa2lvRUxoQjhwaTFRdlMyZkNK?=
 =?utf-8?B?QnNCbXFNd0oyeG94ZW16UktTZE1JVUV3TGlwQk5ySk16TGM0akkxY2Z4ODUr?=
 =?utf-8?B?S3RlRmZ0MlptRzBITUxhcHhyblBLYkVUOFNsTURyYXJHWUg5THpESldzSXZT?=
 =?utf-8?B?ekVFblg3Y0J0SGVLYS8zNFI3c0JQQzhhbWRLdC84Q0dhdTVhYnF1MnBqZmxh?=
 =?utf-8?B?eWZ3bnk5eDJEUDNSWDdNOEd5MjZKMzVIa2o0ZkhPVmsza0RmallqQ2tqMjJq?=
 =?utf-8?B?bVJZT2htNDNUOG9xOTJjNkZkd3VBeGo5Z0VwREF3dDVjNVpUVEE1Z21FUjJF?=
 =?utf-8?B?Uyt2T25sbHp2Q0VhclFvWFdOQ01JcVNnSS8zc2tEbWhuQnpDTlR6RHFqbXBS?=
 =?utf-8?Q?uxPRBSj2cLduIV/pdFySk9RLC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 467ff0ca-3d61-49c7-80ec-08dda92526f6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 20:18:39.1808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWNYvpYUpUm2Dfv5Jj+akPOmx7RiI1NLV94tJhaf2+h5MrsxuGIaHVje2GvBfK3offmpSDUc+wm+XDx1boje1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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


On 09.06.2025 13:00, Michal Wajdeczko wrote:
> On 06.06.2025 02:18, Tomasz Lis wrote:
>> The RESFIX state should be achievable only when CTB communication is
> I'm not sure this is a valid statement, we can't make assumptions about
> the VF driver state, and CTB is enabled only when driver is actively
> submitting workloads, which might not be its 100% life time

Right. I probably remembered from early spec that GuC decides whether a 
VF KMD is working by checking CTB registration.

In the current spec I see the decision is based on whether "the GuC 
interface version is 0", as I understand that refers to the version 
remembered by GuC from handshake.

Since this is now the indication of whether KMD is loaded, I hope GuC is 
clearing that version on `rmmod`.

Also that changes the way migration interacts with suspend/resume.

But back to this patch - it looks to me that there should be no reset 
added, then.

We can get `vf.guc_version.major == 0` only in case we receive the 
MIGRATED IRQ just after enabling IRQs.

And if this happens, VF2GUC_VF_RESET message will be sent to GuC anyway, 
as initial part of `vf_botstrap`.

Of course the bootstrap happens before we get provisioning (before 
`vf_query_config`), so all VF KMD should

do is check whether the config was queried, and if not - skip the 
migration completely.

Will replace this patch with a solution which takes the above into account.

>> enabled. If CTB was disabled and we still got it, then either we're
>> dealing with unclean initial state, or the driver is not currently
>> functional. In these cases, exit the RESFIX state by reset.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Michal Winiarski<michal.winiarski@intel.com>
>> Reviewed-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c    | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
>>   3 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 792523cfa6e6..8fa210c0ef1a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_sriov_vf_types.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_guc_hxg_helpers.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_mmio.h"
>> @@ -721,6 +722,16 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>   
>> +	if (!xe_guc_ct_enabled(&gt->uc.guc.ct)) {
>> +		/*
>> +		 * If driver initialization is running in parallel to this handler,
>> +		 * ignore the migration which happened before the driver was loaded.
> CT could be temporarily disabled during reset or suspend
> shouldn't we attempt to do fixups in those cases?
>
>> +		 * Force GuC to take the VF out of RESFIX state without any fixups.
>> +		 */
>> +		xe_sriov_vf_post_migration_reset_guc_state(xe);
>> +		return;
> if we exit early here, wouldn't that impact logic in the
> vf_ready_to_recovery_on_all_gts() which looks for bits in gt_flags?

Yes. Even without these skips, the per-device vf recovery with per-gt 
MIGRATED interrupt always brings

  the possibility that some flags will not be set.

The way to avoid that would be to make vf recovery per-gt. I don't think 
the way xe works prevents us from

that currently, but I am still uncertain whether that would be a good 
idea. That would mean first GuC exits

the RESFIX state before the 2nd even started the fixups procedure.

Another possibility would be to have a timeout - if some of the per-gt 
flags were set, but no further flags

come in ie. 5 seconds, just run the post-migration recovery.

-Tomasz

>> +	}
>> +
>>   	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>>   	/*
>>   	 * We need to be certain that if all flags were set, at least one
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 6526fe450e55..eff6c7b96f25 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -147,6 +147,22 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   		xe_sriov_info(xe, "migration not supported by this module version\n");
>>   }
>>   
>> +/**
>> + * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * This function sends VF state reset to GuC, as a way of exiting RESFIX
> "sends VF state reset to GuC"
>
> well, this function does much more than that
>
>> + * state if a proper post-migration recovery procedure has failed.
>> + */
>> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_reset_async(gt);
>> +}
>> +
>>   /**
>>    * vf_post_migration_requery_guc - Re-query GuC for current VF provisioning.
>>    * @xe: the &xe_device struct instance
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> index 7b8622cff2b7..ba846af34a13 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> @@ -10,5 +10,6 @@ struct xe_device;
>>   
>>   void xe_sriov_vf_init_early(struct xe_device *xe);
>>   void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe);
>>   
>>   #endif
