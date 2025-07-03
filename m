Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3161C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 00:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906C10E0D6;
	Thu,  3 Jul 2025 00:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITOAnnIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F0310E0D6
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 00:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751501886; x=1783037886;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=jPGOHK5Sp8ZAP+J5Jr2ec80gITkFcO2cyulDW4ptB1M=;
 b=ITOAnnIrG5pUc8XaKNH0r74GWjJiGvfKj/hduI3kVvEFX4yNbSjjTSVF
 kcOYdYZDukfiWAhcyoB4uAttEo2t6RvGQcxzKQ24JHExGnEHkpPoZacCz
 Tz85m9F0P/9wIy4DXODuzNv9iGNJs375R+BjvgoTj4bcP22oxgwA3Gaah
 kmNXNiJF6I2Sd+/79/BV/N9kc4/d1UmTjBcTzDc386BrHgDfg7cbpND4G
 QE8Mm3/xKWORtty5vSSRY9gYgxqhQVnWtiaTB0dnHam13eC4Bnp01jACg
 EEOjN4ii1DGFPnGYfI6BSU8skKxrvTGKFFcZ4GDrvSiXD+J8CBGmYkXKJ Q==;
X-CSE-ConnectionGUID: EmS66oZSTAyWH8aJNrY2Ig==
X-CSE-MsgGUID: YSLu4koJRXaP8QQLdaZAmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64059971"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208,217";a="64059971"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 17:18:00 -0700
X-CSE-ConnectionGUID: UipC+JtzSHKUfievnGjGbQ==
X-CSE-MsgGUID: 3T+AsPVcT3CS1PK1IjEZ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
 d="scan'208,217";a="185156950"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 17:18:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 17:18:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 17:18:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 17:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL8/FfBqfWBlJ5B6QOd3wXwkM7fbRzE6ARtuo+QfLmO6NLF46sITv/3nvNEfR34pVQNhbm+vnjkEaKZJlL9Icf+7bGEMzqCGMXJzHwsrZfMRlK4gD1FZcVhcWe9BTaybJGPtNFoajoBiJ/qlAonoEUf6ohC0J3rWy4ObEW+Xuy8eMdLXHZ9qKhqKW7oQ4gA/1P5QRuWFbwCYpV5ykZWEWy0Gc2kMgrWO8GIkRQEOraRekX47BP0Omlc2JBcNV+fUsnvbYDeCr5YAfnVCNFXTOZCA0eKtkDWQA382/qkTNYWoZ1PMyO5YS6L2cRdT282x/jzdKYOVeczaYfKtLwWX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+Rnwp1TTQJLwDnkZpor5T2ij9Mpny2o5eiLVGAerVo=;
 b=jXknDsCwwK+FUrZbL8Jq77KxjeD/sz3U2lGRIPuRcBlki95gy/F+oimO9gpK6VNKyyRNDbMD+1bRykLOdaN7wrpIRUBFyNobWTVO0C12EJ88Klc1/vMKxjFNoSmuvxy1nGP0QmDrP4/KyVUP1u6aiz92kJ7YrldfrMuq02XaGg+0hpTKAopDw95cpHIwsQ6J40JbekcVq98OFU/XdQL+y0JIsY+gqd3+AiZF23MpcSuWWeEtVRENEANp69/pWLausceeTUGm2wDOd3cjvKPdkioRac8z1giR2vCiLvzTjHXDMulF9QFxfU3uzchixE/T4PrXsj1IGqzCqoCtxmpdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 00:17:15 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%3]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 00:17:15 +0000
Content-Type: multipart/alternative;
 boundary="------------NnzGMUyYASz90jubns3Tcs6p"
Message-ID: <499f6990-3513-43de-a6cf-efffc5f64bad@intel.com>
Date: Thu, 3 Jul 2025 02:17:11 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Make_multi-GT_migration_less_error_prone_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250630152155.195648-1-tomasz.lis@intel.com>
 <175148725016.129312.8753908561688059415@1538d3639d33>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <175148725016.129312.8753908561688059415@1538d3639d33>
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 2140f078-ba18-44fc-12c5-08ddb9c6f67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXBXWlh2dzBLOU4wV0VySmhXcHB5NndvMlBua0Fua3VJS2pMWmhDM2wwM0Fr?=
 =?utf-8?B?eHY5N1ZJS2hZejBtdzFyblA0T3pOakMzYjV1Mkh1ZlJVQVRHRHVJcmE4ZkVy?=
 =?utf-8?B?SFh2MzNnZ0NZb1ZESnFlV3d5KzZWZDJVSlNrdi8yTVJ3cnJxV1hCMTJaenov?=
 =?utf-8?B?empLbUlWMUl2TFBGbXh1OFp2ai9NRk9rVXpZSHQ4dFYrQXFHck9qU1VkbEtU?=
 =?utf-8?B?SkZLYmk2ZjkyeSs3aVdHSlYxZDlTaDFmNWhPanJkVlgvVWNmTjFKRlQ1RXli?=
 =?utf-8?B?dXdTaTVSbCtHaWJSQk9mNDJrWElSL3ExdGRDRlJFUEJZa0N3NUtpQW9lRDk1?=
 =?utf-8?B?MnhSVkkySGpyNkJETXI0T1h6emJabHlPa0lvb0hEWGNHSXJoVE8zS2lWRk4v?=
 =?utf-8?B?Um9EQ282RktJVVNDMGoxekFaOTVaK090aHV3THpnOWE5Qk4rMjBOcUdWM25v?=
 =?utf-8?B?TkJuVzJzRTJSVW9YYUt4b2RZT3JJMlFTT0dmdk1tUEpEUlVTdXJ4MjhRbG5Y?=
 =?utf-8?B?VG9YZDFzK0pITGxuQUFvVFRNMW9qbGVtUXB1c1ZKZUVZS29ZVVZUOTNPV0xL?=
 =?utf-8?B?dTJLNjFHdWNDTFlXVmlpU0E2ZWREYmZpS1VOS1psRFZ0RVNFQW1vZ3QxSldq?=
 =?utf-8?B?YzBuWjRIcUlyOXEyL3l6WFZlN0R2OUR2SHBuTG1sdWxSK0VaTFdTUmNNNXUr?=
 =?utf-8?B?Sk9HOXhQZTUxd21Lb2lVMmsxWjhTQjJqUnRtY0JsWk5lUS92bnlIRS9jdXdV?=
 =?utf-8?B?OURuV3FxK3libzFKcCtISSttSHdlNlQyOUNGaDNYYzRhbUEyYkc1aUs5R3Nx?=
 =?utf-8?B?d1dCdVRtZmRvKzZqL01ROXFNcnl1UjBseHhtS3lUWFkzTmFiMkIxVkZYVmNs?=
 =?utf-8?B?SHQrdTQ2Mjk5U0M0c0pwbmk2WEVXYlBZNVNVaDdXNERJK3dKUTlTUEZPZWVo?=
 =?utf-8?B?aHg0ZGZCc3k1bkVrb2dUZkk2VjFJelM1UGo4OWJZWHFzdG5rd1ZmOTVlWERX?=
 =?utf-8?B?L3dQbkQxUmlXbnRMenFoS05KbEZnRUxYZjMzYUhST3hOeE1YdzQwQXdpS3hx?=
 =?utf-8?B?MzRUajk0Y3I0a2U2YkJld1pneE1vTjBsRnpyVkowNWFXblNYT2Jkb3NkeDNV?=
 =?utf-8?B?a1ByVlBTcmRBRUVzNlliVlFpdy81eWlwVGQ1MFpSMzlIVzR1VElINTdiWmlS?=
 =?utf-8?B?Z2R5bmZubm5UdTFZYW4yZnQ0dk43QUZmVlRoa1NkN2w4TzZ1Q2F4dXhTMjhj?=
 =?utf-8?B?RElPd0Y3NG9WRVo0cm5aU2dwby9hc1hoMkRzaTlNSW5ZUklYbXUvREZnQzdr?=
 =?utf-8?B?YU9LcExSZFpTUUhyRmFIUjZuMmVITjhEUlVpTHFZZzhNSTlsUG1va215RXM2?=
 =?utf-8?B?eDVmYmtuaDdqWDB5WmN2c3E4dEtCS0Nnd1BLNU11RnV3TVJacTIwZXZ4UFZl?=
 =?utf-8?B?TWd2NnJTdEUrVzRRLzd0aXVIdk5oMVhiWmVDSnhWRnZIbFZrd1ZlQysrV21H?=
 =?utf-8?B?eXFNaEFyNm92N3hQZURKekI5R0gzNFZKMzN4S1lieThxRzdTZ082SS90SEpD?=
 =?utf-8?B?a1Noa1lXcU5pWjdlc3hibFdmeElRMkpTdlVIb012Qjg4d3JGUVRJVkJhdVZv?=
 =?utf-8?B?MXlldTFWK205K1lkcUVTYzdhSmE5T05lTXlranZBdmI1Tk9QSTZ1UGxxeUVa?=
 =?utf-8?B?emJoWEFPbzk1d1RPQkx1SmllUWZ1L0RjSERwVGQzSkcwTjUzSWlrYU82K3Q4?=
 =?utf-8?B?RWpSbnRUT2o2M010eCs1eGpTL2FwdEtWbHlaWndydEhTSmZvNjBqLzY5WENu?=
 =?utf-8?Q?QK+jMUt8/GSnBarl2BUoaHWR6eWIbt+1s7T3A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2lNS0FabUhDRURPQ0xHdXlrcFZHbG5GdWJ3U2d2dnpuWnVDcm5QWG0wWXNH?=
 =?utf-8?B?RGl5dFM3TzRoNXFrSnVoVVJtRkFPeUhUbnlFaFUwalMzRm50ZGdOTWQwMDIx?=
 =?utf-8?B?R01NcjNZY0RHbndoSDZYeExQc1I0dElRTEhlVUlpbTR0VnpsZElxRUV3Zkh5?=
 =?utf-8?B?N1ozRzlhSlY5M3NJU0x0b3lGaEZBa1F4L3l0dURKQkJ6RHluRkV6eS92ME1m?=
 =?utf-8?B?YWdHNVVVcTA0T2h3cXI3dEdGTTljQVlvUzBZbzdDQjNoR2l0VlVab1FTMVly?=
 =?utf-8?B?OGt3eHIzUWpEQ1JGM1lKUEY5NDVGU0haQlNXSm9xelhFZnZEaXZhWW1uZ3BO?=
 =?utf-8?B?NG9kQ1lJdWtnWm9ZWTJ2K3pZbUErZTRRMURYVDFZTVNCdWJLckpwNEF0N05U?=
 =?utf-8?B?UGZjdUd0MFp3dlpKamZzM2Rpc2hjck16dGxVRFdiMzBOZVVBT2t3M0NPWDVx?=
 =?utf-8?B?elp1SHp0M0NuanZ0YzJyR1pIQ1hCTTRUenZkU2VMbGxnd2M0N3RQKzJoVTF4?=
 =?utf-8?B?ekpxeE9GeXM3aTVOaEtPU2plRzY3b3djTzdLc1l4MUxnSlhnVExObGswdkkz?=
 =?utf-8?B?SE4yaXl6ZWVZUTQvQ09VaER0NjEzenJVbjZWQXluZTA0OTUzdGdnd3JUbUV4?=
 =?utf-8?B?UExOMHU1T016ZGRaYmRaSlRvWk94YnhrNktBVEt2V3dJdDA1NXVud1c2NXJK?=
 =?utf-8?B?blFreWNVMlJUQnI3QmkzSU9nelJrSk84Q0NyUmJmQjRNOHZtdkZmanFiWGxu?=
 =?utf-8?B?NWErVVN0bVA4SWNNMXk2dFE2V1lPSnkzMEVvUldJUndiM0hvVXVOQmhkZ0pD?=
 =?utf-8?B?bFNLVWNxaUYrOXdUSU93aGJZVFRNeFNjeTgyTHQ3cm4yR1BnZlRKejAwSlZE?=
 =?utf-8?B?dWxDc2VndEpScEdDNlZqdFNWSkpQaUVTdkdVY0ZEUHZyTlA3SDBqd05LaHI0?=
 =?utf-8?B?V2pvQytxNnJ1Y1JzUktCQWZSenlwaGRtTmx1VWlXME0vNnVyWWFUdnI4TGtu?=
 =?utf-8?B?UFA3NEFsSm4yZVh3WmxjTHJXZlUrWi9GSGIreE5CSmxVU040Zi9LOUlGZlQ0?=
 =?utf-8?B?VzlPa2Q5bStYMm9uZlZZNHdraFJwMFZJU3UzVkdPWXdRZkhmZUovWCtJRVVQ?=
 =?utf-8?B?U2ZyK0VPRUx3N2JBWktjeGN5Qjg4U1hORkdua0w5alFuaFppN1VVczcyY3dS?=
 =?utf-8?B?VUJsQ3MxSUFuT25rSjZ5dmZ5MTZ0bFZOMnMxd2VNZXI3bnhEdWloQ1ZDY0pL?=
 =?utf-8?B?VW9QWUFYUWxpempwa2FsKzBvQVdBV2tSVTIwZy9nNmNFTzk5MnVOdFhQbjRV?=
 =?utf-8?B?aVcxSENMTyszb1B2dk14WFo2Z1FDdHZkbXNqSUZwTXBXWVZZN2NFN0hUWEQ4?=
 =?utf-8?B?ZisxOVA0c3FOK05qNmxHUFVuOU9XRUNNcGQwaHcxcmhzaVBiWmVoOHRvaHR3?=
 =?utf-8?B?MlRsLzkyK3RGbkhjbEt2NDd0Z3NjMjN5NlJNVXIxSktnNHdxY3FvSnFUUDkz?=
 =?utf-8?B?UytUK3BSdjUxTFc4clJjWHhKNk54QjFTU1RveTJMeU9vcWlHa0ZFNUNUVkxh?=
 =?utf-8?B?YStxWCtlVkZPK1VuMEJWRElJZkNBc2t2NlBybmV1d2RGQVJHSDVHdHJQZkQy?=
 =?utf-8?B?SmF3RTVnTEJzSzIzYnhpZm9UM0JKNmMzZTFlWDk0eTg4a2lIM0xrTFZqNlls?=
 =?utf-8?B?K3JxMndjMHl2dE1KejI3cjBYcmR3aEphV2U5OGpOVElhaFhEZno2WSs1QkNu?=
 =?utf-8?B?a244cm9nNVJzL3cwMzA0RDlXdlFvUzU4aWNlVERzdG1mVVc1a1RGOGV1enl3?=
 =?utf-8?B?Q253WTJEMWYzREd6THdTeWpGUzRMWUROYVIrWmFJOGNobEJrdjB0Q0RqbWd6?=
 =?utf-8?B?TG1yUFlzOXJhMExrdTh5QVJGQ2Z2MFFZNUNIZ0o5MHQ1STRQcmlZVXVZRHZm?=
 =?utf-8?B?V0lzSDhCb2pkNUE3WkZ4YUQrZStCcnN4VTZBUm1rRnFJR3poZ01hM3pwOTF1?=
 =?utf-8?B?SlVUOGJLMmtHcG9kRnRWc3hxbnBERk9TVUVmNmhzd0lRTC82dDl6eHJnT2FH?=
 =?utf-8?B?SEVjOFVtZ1l0cTAyWmdIZjNMTG1rWGFZRDlNWjVsbEJaMlpRZWxnQU91TmRl?=
 =?utf-8?Q?UaLTdZ4eiPXM3C8Z2+HOpoP53?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2140f078-ba18-44fc-12c5-08ddb9c6f67c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:17:15.0736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfLcREx02lgjDuMIAWkL/Ruzx7qXEhOT6phj+snHo5Mh+4/ZwQdUMmyifwMVbZ7Be7fsd0eVVbmMdhnPLcBEAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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

--------------NnzGMUyYASz90jubns3Tcs6p
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Manual check of fails:


igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:

  * shard-bmg: PASS
    <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html>
    -> FAIL
    <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html>

This is executed with SRIOV disabled. The code change in this patch is 
only reachable when executing on a SRIOV VF.

So, the altered code was not active and couldn't cause this issue.

The issue is worrying though - looks like we have a hole of some kind 
(race condition? coherency/invalidation issue? buffer lifecycle issue?) 
in xe_vm_bind_ioctl() which makes it possible for blitter to start 
filling unmapped memory, causing CAT error.

It's good the relevant logs (dmesg during startup and dmesg during 
execution) were linked to in the "FAIL" link - that made the check a LOT 
easier to perform.


igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:

  * shard-lnl: ABORT
    <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
    (Intel XE#4917
    <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917>) -> ABORT
    <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>

Another non-SRIOV run, so modified code was not active.

The test is error injection during probe, so the error lays in 
exceptional path of said probe. Looks like the probe error can cause 
unclean finalization of drm_mm. Not very high priority, but this is 
probably always reproducible, so easy to fix (at least compared to the 
previous fail). I'm a bit confused why it's reported in CI if it looks 
like an issue which would have 100% reproduction rate. Maybe I'm missing 
something.


CONCLUSION:

None of the reported issues can be linked to the patch under test.


-Tomasz


On 02.07.2025 22:14, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/vf: Make multi-GT migration less error prone (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/150253/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/index.html
>
>
>   CI Bug Log - changes from
>   xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535_FULL ->
>   xe-pw-150253v3_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-150253v3_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-150253v3_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-150253v3_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html>
>
>
>         Warnings
>
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-150253v3_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_3d:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_3d.html>
>         (Intel XE#1465
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465>)
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_async_flips@invalid-async-flip-atomic.html>
>         (Intel XE#3768
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html>
>         (Intel XE#3768
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +19
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +111 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html>
>         (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#4418
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#4418
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html>
>         (Intel XE#4416
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-fast:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html>
>         (Intel XE#5354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354>)
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +3
>         other tests skip
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html>
>         (Intel XE#4302
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#4494
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494> /
>         i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@kms_feature_discovery@display-2x.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_feature_discovery@display-2x.html>
>         (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_flip@2x-plain-flip.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +5
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +1
>         other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +2
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +15
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +5
>         other tests skip
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@kms_hdr@static-toggle.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_hdr@static-toggle.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>  *
>
>     igt@kms_pipe_crc_basic@disable-crc-after-crtc:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html>
>         (Intel XE#5195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195>) +2
>         other tests fail
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#3309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-pr-sprite-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr@fbc-psr2-primary-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3
>         other tests skip
>  *
>
>     igt@kms_psr@pr-cursor-plane-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_psr@pr-cursor-plane-onoff.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@kms_vrr@flip-basic-fastset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5
>         other tests skip
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_vrr@max-min.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_eu_stall@invalid-gt-id:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_eu_stall@invalid-gt-id.html>
>         (Intel XE#5308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308>)
>  *
>
>     igt@xe_eudebug@basic-read-event:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_eudebug@basic-read-event.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters-userptr:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_eudebug@basic-vm-access-parameters-userptr.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +5
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-large-multi-vm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_evict@evict-beng-large-multi-vm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-small-external-cm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_evict@evict-beng-small-external-cm.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1
>         other test skip
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>  *
>
>     igt@xe_exec_system_allocator@many-new-bo-map:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_exec_system_allocator@many-new-bo-map.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +24 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@once-large-mmap-new-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_exec_system_allocator@once-large-mmap-new-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@process-many-execqueues-new-race-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_exec_system_allocator@process-many-execqueues-new-race-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +54 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html>
>         (Intel XE#5018
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018>)
>  *
>
>     igt@xe_live_ktest@xe_eudebug:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#2833
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#2833
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>  *
>
>     igt@xe_oa@oa-tlb-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#2248
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248>)
>  *
>
>     igt@xe_oa@privileged-forked-access-vaddr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +2
>         other tests skip
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s4-basic-exec:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_pm@s4-basic-exec.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_pm@s4-basic-exec.html>
>         (Intel XE#5255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5255>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_query@multigpu-query-pxp-status:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_query@multigpu-query-pxp-status.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>  *
>
>     igt@xe_sriov_flr@flr-vfs-parallel:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_sriov_flr@flr-vfs-parallel.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html>
>         +3 other tests pass
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-180:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html>
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip@basic-flip-vs-wf_vblank:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-6/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         (Intel XE#2883
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_vrr@negative-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_vrr@negative-basic.html>
>  *
>
>     igt@xe_exec_basic@multigpu-once-rebind:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-466/igt@xe_exec_basic@multigpu-once-rebind.html>
>         +6 other tests pass
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-8/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_module_load@load.html>)
>  *
>
>     igt@xe_pm@s2idle-basic-exec:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html>
>         +6 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173> /
>         Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (Intel XE#5354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354>)
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +11 other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-yf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535 ->
>     xe-pw-150253v3
>
> IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535: 
> 2180444bb7f18fb5bab882ad682a1f2f068e8535
> xe-pw-150253v3: 150253v3
>
--------------NnzGMUyYASz90jubns3Tcs6p
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Manual check of fails:</p>
    <p><br>
    </p>
    <p>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nome=
mset:</p>
    <ul>
      <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@xe_exec_sys=
tem_allocator@process-many-large-malloc-bo-unmap-nomemset.html">PASS</a>
        -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0253v3/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-malloc-b=
o-unmap-nomemset.html">FAIL</a></li>
    </ul>
    <p>This is executed with SRIOV disabled. The code change in this
      patch is only reachable when executing on a SRIOV VF.</p>
    <p>So, the altered code was not active and couldn't cause this
      issue.</p>
    <p>The issue is worrying though - looks like we have a hole of some
      kind (race condition? coherency/invalidation issue? buffer
      lifecycle issue?) in xe_vm_bind_ioctl() which makes it possible
      for blitter to start filling unmapped memory, causing CAT error.</p>
    <p>It's good the relevant logs (dmesg during startup and dmesg
      during execution) were linked to in the &quot;FAIL&quot; link - that =
made
      the check a LOT easier to perform.</p>
    <p><br>
    </p>
    <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
    <ul>
      <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-1/igt@xe_fault_in=
jection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a>
        (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/491=
7">Intel
          XE#4917</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-150253v3/shard-lnl-5/igt@xe_fault_injection@probe-fail-guc-xe_=
guc_ct_send_recv.html">ABORT</a></li>
    </ul>
    <p>Another non-SRIOV run, so modified code was not active.</p>
    <p>The test is error injection during probe, so the error lays in
      exceptional path of said probe. Looks like the probe error can
      cause unclean finalization of drm_mm. Not very high priority, but
      this is probably always reproducible, so easy to fix (at least
      compared to the previous fail). I'm a bit confused why it's
      reported in CI if it looks like an issue which would have 100%
      reproduction rate. Maybe I'm missing something.</p>
    <p><br>
    </p>
    <p>CONCLUSION:</p>
    <p>None of the reported issues can be linked to the patch under
      test.<br>
    </p>
    <p><br>
    </p>
    <p>-Tomasz<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 02.07.2025 22:14, Patchwork wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:175148725016.129312.8753908561688=
059415@1538d3639d33">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/vf: Make multi-GT migration less error prone
              (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/150253/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/150253/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150253v3/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535_FULL -&gt;
        xe-pw-150253v3_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-150253v3_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-150253v3_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-150253v3_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap=
-nomemset:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@xe_ex=
ec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html" moz-d=
o-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_exec_system_allocator@proces=
s-many-large-malloc-bo-unmap-nomemset.html" moz-do-not-send=3D"true">FAIL</=
a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-1/igt@xe_fa=
ult_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send=3D"t=
rue">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4917" moz-do-not-send=3D"true">Intel XE#4917</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-5/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send=3D"tr=
ue">ABORT</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-150253v3_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_3d:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_3d.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1465" moz-do-not-send=3D"true">Intel XE#1465</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_async_flips@invalid-as=
ync-flip-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3768" moz-do-not-send=3D"true"=
>Intel XE#3768</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_async_flips@invalid-as=
ync-flip-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3768" moz-do-not-send=3D"true"=
>Intel XE#3768</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing=
-internal-panels:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_atomic_transition@plan=
e-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2370" moz-do-not-send=3D"true">Intel XE#2370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_big_fb@4-tiled-=
8bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">=
Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-r=
otate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel X=
E#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_big_fb@yf-tiled-64bpp-=
rotate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Inte=
l XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-a=
sync-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_big_fb@yf-tiled=
-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1124" moz-do-not-send=3D"true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@kms_b=
w@connected-linear-tiling-2-displays-1920x1080p.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150253v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=3D"true">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894" moz-do-not-send=3D"true">Intel XE#2894</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_bw@connected-linear-ti=
ling-2-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-se=
nd=3D"true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_bw@connected-linear-ti=
ling-4-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-se=
nd=3D"true">Intel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_bw@connected-linear-ti=
ling-4-displays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-se=
nd=3D"true">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) +1 ot=
her test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hd=
mi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_ccs@bad-pixel-format=
-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" =
moz-do-not-send=3D"true">Intel XE#787</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hd=
mi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_ccs@bad-pixel-format=
-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" =
moz-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787<=
/a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:<=
/p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_ccs@bad-rotatio=
n-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz=
-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>=
) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-432/igt@kms_ccs@crc-primary=
-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do=
-not-send=3D"true">Intel XE#787</a>) +111 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-ed=
p-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-bmg-ccs@pipe-b-edp-1.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669" moz-=
do-not-send=3D"true">Intel XE#2669</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</=
p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@kms_c=
cs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html" moz-do-not-send=3D=
"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-150253v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@=
pipe-d-dp-2.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3862" moz-do-not-send=3D"tru=
e">Intel XE#3862</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=
=3D"true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-gen12-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-se=
nd=3D"true">Intel XE#2887</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true=
">Intel XE#2887</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_cdclk@mode-transitio=
n-all-outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4418" moz-do-not-send=3D"true">I=
ntel XE#4418</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_cdclk@mode-transition-=
all-outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2724" moz-do-not-send=3D"true">Int=
el XE#2724</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_cdclk@mode-transition-=
all-outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4418" moz-do-not-send=3D"true">Int=
el XE#4418</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-463/igt@kms_cdclk@plane-sca=
ling@pipe-b-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4416" moz-do-not-send=3D"true=
">Intel XE#4416</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_chamelium_edid@=
dp-edid-resolution-list.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=
=3D"true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-fast:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_chamelium_frames@dp-=
crc-fast.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel X=
E#373</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_chamelium_frames@dp-cr=
c-fast.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel XE=
#2252</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a=
>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_content_protection@ato=
mic-dpms@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"=
true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_content_protect=
ion@legacy.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">Inte=
l XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_content_protection@lic=
-type-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3278" moz-do-not-send=3D"true">Intel X=
E#3278</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_cursor_crc@cursor-onsc=
reen-256x85.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">Int=
el XE#1424</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_cursor_crc@cursor-onsc=
reen-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">In=
tel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_cursor_crc@cursor-slid=
ing-32x10.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel=
 XE#2320</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varyin=
g-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@kms_c=
ursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html" moz-do-no=
t-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-150253v3/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-at=
omic-transitions-varying-size.html" moz-do-not-send=3D"true">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354" moz-=
do-not-send=3D"true">Intel XE#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_cursor_legacy@cursor=
a-vs-flipb-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true=
">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@kms_c=
ursor_legacy@cursora-vs-flipb-toggle.html" moz-do-not-send=3D"true">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3=
/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>) +3 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_cursor_legacy@cursorb-=
vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" =
moz-do-not-send=3D"true">Intel XE#309</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@kms_d=
isplay_modes@extended-mode-basic.html" moz-do-not-send=3D"true">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/sha=
rd-bmg-6/igt@kms_display_modes@extended-mode-basic.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4302" moz-do-not-send=3D"true">Intel XE#4302</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_dither@fb-8bpc-=
vs-panel-6bpc@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494" moz-do-not=
-send=3D"true">Intel XE#4494</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3804" moz-do-not-send=3D"true">i915#3804</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>) +=
1 other test
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@kms_f=
eature_discovery@display-2x.html" moz-do-not-send=3D"true">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bm=
g-6/igt@kms_feature_discovery@display-2x.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373"=
 moz-do-not-send=3D"true">Intel XE#2373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_feature_discovery@disp=
lay-3x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/703" moz-do-not-send=3D"true">Intel XE#=
703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspen=
d.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Intel XE#1421=
</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_flip@2x-plain-flip.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/310" moz-do-not-send=3D"true">Intel XE#310</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@kms_f=
lip@2x-plain-flip-ts-check-interruptible.html" moz-do-not-send=3D"true">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1502=
53v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) +5 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-3/igt@kms_f=
lip@flip-vs-expired-vblank@b-edp1.html" moz-do-not-send=3D"true">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/sh=
ard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301" moz-do-not-send=3D"true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-2/igt@kms=
_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html" moz-do-not-send=3D"true">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0253v3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html"=
 moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543" moz-do-not-send=3D"true">Intel XE#4543<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-ups=
caling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1401" moz-do-not-send=3D"true">Intel XE#1401</a>) +2 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rc=
ccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a>) +1 ot=
her test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscal=
ing:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-=
do-not-send=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</=
a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-down=
scaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-6=
4bpp-yftile-to-16bpp-yftile-downscaling.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" =
moz-do-not-send=3D"true">Intel XE#1401</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#17=
45</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-4/igt@kms=
_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html" moz-do-not-sen=
d=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150253v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe=
-b-hdmi-a-1-y-to-y.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-se=
nd=3D"true">Intel XE#4543</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-4/igt@kms=
_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html" moz-do-not-sen=
d=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150253v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe=
-d-hdmi-a-1-y-to-y.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send=3D"tr=
ue">Intel XE#1874</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt=
:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_frontbuffer_tracking@d=
rrs-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-n=
ot-send=3D"true">Intel XE#651</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt=
:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_frontbuffer_tracking=
@drrs-2p-primscrn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do=
-not-send=3D"true">Intel XE#656</a>) +2 other tests
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_frontbuffer_tracking@d=
rrs-2p-primscrn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-=
not-send=3D"true">Intel XE#2311</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:<=
/p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@drrs-2p-primscrn-spr-indfb-move.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz=
-do-not-send=3D"true">Intel XE#651</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-n=
ot-send=3D"true">Intel XE#4141</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-=
blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_frontbuffer_tracking@f=
bcdrrs-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-d=
o-not-send=3D"true">Intel XE#656</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_frontbuffer_tracking=
@fbcdrrs-shrfb-scaledprimary.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-s=
end=3D"true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@fbcdrrs-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send=3D=
"true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_frontbuffer_tracking=
@fbcpsr-indfb-scaledprimary.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-se=
nd=3D"true">Intel XE#653</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_frontbuffer_tracking@f=
bcpsr-indfb-scaledprimary.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-se=
nd=3D"true">Intel XE#2313</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
53" moz-do-not-send=3D"true">Intel XE#653</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@kms_h=
dr@static-toggle.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@kms=
_hdr@static-toggle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1503" moz-do-not-send=3D"tr=
ue">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_joiner@invalid-=
modeset-force-ultra-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925" moz-do-not-se=
nd=3D"true">Intel XE#2925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_panel_fitting@legacy=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a=
>) +1 other test
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_panel_fitting@legacy.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2486" moz-do-not-send=3D"true">Intel XE#2486</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-8/igt@kms=
_pipe_crc_basic@disable-crc-after-crtc.html" moz-do-not-send=3D"true">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253=
v3/shard-adlp-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html" moz-do-=
not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2953" moz-do-not-send=3D"true">Intel XE#2953</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173" moz-do-n=
ot-send=3D"true">Intel XE#4173</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_plane@pixel-format-sou=
rce-clamping@pipe-a-plane-0.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195" moz-do-not-s=
end=3D"true">Intel XE#5195</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_plane_multiple@2x-tili=
ng-none.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4596" moz-do-not-send=3D"true">Intel X=
E#4596</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_pm_dc@dc5-retention-fl=
ops.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3309" moz-do-not-send=3D"true">Intel XE#33=
09</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe=
-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overl=
ay-plane-move-continuous-sf@pipe-a-edp-1.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"=
 moz-do-not-send=3D"true">Intel XE#4608</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-ove=
rlay-plane-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not=
-send=3D"true">Intel XE#1489</a>) +1 other test
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overl=
ay-plane-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-s=
end=3D"true">Intel XE#1489</a>) +2 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overl=
ay-plane-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-s=
end=3D"true">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4608" moz-do-not-send=3D"true">Intel XE#4608</a>) +1 o=
ther test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_psr2_sf@pr-curs=
or-plane-move-continuous-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-s=
end=3D"true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-pri=
mary-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send=
=3D"true">Intel XE#2893</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-rend=
er.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#140=
6</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_psr@fbc-psr2-pr=
imary-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">In=
tel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_psr@pr-cursor-plane-on=
off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0" moz-do-not-send=3D"true">Intel XE#2850</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_rotation_crc@sprite-ro=
tation-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Inte=
l XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904" moz-do-not-send=3D"true">Intel XE#3904</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_rotation_crc@sprite-ro=
tation-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Inte=
l XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904" moz-do-not-send=3D"true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_rotation_crc@sp=
rite-rotation-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true=
">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_setmode@invalid-clone-=
single-crtc-stealing.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"=
true">Intel XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_tiled_display@basic-te=
st-pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Inte=
l XE#2426</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_tiled_display@basic-te=
st-pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send=3D"true">Intel=
 XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_tiled_display@b=
asic-test-pattern-with-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500" moz-do-=
not-send=3D"true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic-fastset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_vrr@flip-basic-=
fastset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE=
#455</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@kms_vrr@max-min.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@sriov_basic@enable-vfs-bin=
d-unbind-each-numvfs-all.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-se=
nd=3D"true">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2849" moz-do-not-send=3D"true">Intel XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_copy_basic@mem-c=
opy-linear-0xfd.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send=3D"true"=
>Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@invalid-gt-id:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_eu_stall@invalid=
-gt-id.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5308" moz-do-not-send=3D"true">Intel XE=
#5308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-read-event:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_eudebug@basic-read-even=
t.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837=
</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_eudebug@basic-vm-acce=
ss-parameters-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D=
"true">Intel XE#4837</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-u=
fence-delay-ack.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true"=
>Intel XE#4837</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_eudebug_online@w=
rites-caching-sram-bb-vram-target-vram.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" m=
oz-do-not-send=3D"true">Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-multi-vm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_evict@evict-beng-large-=
multi-vm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel X=
E#688</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small-external-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_evict@evict-beng-smal=
l-external-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send=3D"true">In=
tel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688" moz-do-not-send=3D"true">Intel XE#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecque=
ue-userptr-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_exec_basic@multigpu-man=
y-execqueues-many-vm-bindexecqueue-userptr-rebind.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1392" moz-do-not-send=3D"true">Intel XE#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-inval=
idate:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-dg2-433/ig=
t@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html" moz=
-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150253v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-bindexecqueue-userptr-invalidate.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz=
-do-not-send=3D"true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_exec_basic@multigpu-o=
nce-bindexecqueue-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-se=
nd=3D"true">Intel XE#1392</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_exec_basic@multigpu-onc=
e-bindexecqueue-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=
=3D"true">Intel XE#2322</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_exec_fault_mode@=
many-userptr-invalidate-race.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-s=
end=3D"true">Intel XE#288</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_exec_fault_mode@once-=
bindexecqueue-imm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true=
">Intel XE#288</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-dg2-435/ig=
t@xe_exec_reset@parallel-gt-reset.html" moz-do-not-send=3D"true">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/sh=
ard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html" moz-do-not-send=3D"tr=
ue">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3876" moz-do-not-send=3D"true">Intel XE#3876</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-new-bo-map:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_exec_system_allocator=
@many-new-bo-map.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-send=3D"true=
">Intel XE#4915</a>) +24 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@once-large-mmap-new-huge:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_exec_system_allocator@o=
nce-large-mmap-new-huge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send=
=3D"true">Intel XE#4943</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-execqueues-new-race-=
nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_exec_system_allo=
cator@process-many-execqueues-new-race-nomemset.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4915" moz-do-not-send=3D"true">Intel XE#4915</a>) +54 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomems=
et:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_exec_system_allocator@t=
hreads-many-mmap-new-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-d=
o-not-send=3D"true">Intel XE#4943</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-=
bo-map-nomemset:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-4/igt@xe_ex=
ec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html" =
moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-4/igt@xe_exec_system_allocator@t=
hreads-shared-vm-many-large-new-bo-map-nomemset.html" moz-do-not-send=3D"tr=
ue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5018" moz-do-not-send=3D"true">Intel XE#5018</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_eudebug:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2833" moz-do-not-send=3D"true">Intel XE#2833</a=
>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2833" moz-do-not-send=3D"true">Intel XE#2833</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-tlb-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@xe_oa@oa-tlb-invalidate.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2248" moz-do-not-send=3D"true">Intel XE#2248</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@privileged-forked-access-vaddr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_oa@privileged-fo=
rked-access-vaddr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send=3D"tru=
e">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573" moz-do-not-send=3D"true">Intel XE#3573</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_pm@d3cold-basic-exec.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-=
do-not-send=3D"true">Intel XE#366</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-=
exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2=
284</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic-exec:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_pm=
@s4-basic-exec.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_pm=
@s4-basic-exec.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5255" moz-do-not-send=3D"true"=
>Intel XE#5255</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-p=
ost-rpm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel X=
E#4733</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-pxp-status:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_query@multigpu-q=
uery-pxp-status.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">=
Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_query@multigpu-query-uc=
-fw-version-guc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">=
Intel XE#944</a>) +1 other test
              skip</li>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-adlp-1/igt@xe_query@multigpu-query-=
uc-fw-version-guc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true=
">Intel XE#944</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_query@multigpu-query-uc=
-fw-version-guc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">=
Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disab=
ling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_sriov_auto_provisioning=
@resources-released-on-vfs-disabling.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz=
-do-not-send=3D"true">Intel XE#4130</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@xe_sriov_auto_provisioning=
@resources-released-on-vfs-disabling.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz=
-do-not-send=3D"true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-each-isolation:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_sriov_flr@flr-each-isol=
ation.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3342" moz-do-not-send=3D"true">Intel XE#=
3342</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-433/igt@xe_sriov_flr@flr-vf=
s-parallel.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4273" moz-do-not-send=3D"true">Inte=
l XE#4273</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pi=
pe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-1/igt@kms_a=
sync_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html" moz-d=
o-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/911" moz-do-not-send=3D"true">Intel XE#911</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-=
5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.=
html" moz-do-not-send=3D"true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-1/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-180.html" moz-do-not-send=3D"true">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760" moz-do-no=
t-send=3D"true">Intel XE#4760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-r=
otate-180.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"tr=
ue">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1727" moz-do-not-send=3D"true">Intel XE#1727</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"tru=
e">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150253v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs-cc.html" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@km=
s_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-se=
nd=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_d=
p_link_training@non-uhbr-sst.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-=
send=3D"true">Intel XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_dp_link_training@non-uh=
br-sst.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_d=
p_linktrain_fallback@dp-fallback.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294" moz-do-=
not-send=3D"true">Intel XE#4294</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@kms_dp_linktrain_fallba=
ck@dp-fallback.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_f=
lip@2x-flip-vs-dpms-on-nop.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-se=
nd=3D"true">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-n=
op.html" moz-do-not-send=3D"true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-6/igt@kms_f=
lip@basic-flip-vs-wf_vblank.html" moz-do-not-send=3D"true">INCOMPLETE</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/sh=
ard-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html" moz-do-not-send=3D"tru=
e">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-8/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send=3D"true">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" =
moz-do-not-send=3D"true">Intel XE#301</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-1/igt@kms_flip@flip-vs-=
expired-vblank-interruptible.html" moz-do-not-send=3D"true">PASS</a> +1 oth=
er test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@kms_f=
lip@flip-vs-suspend-interruptible.html" moz-do-not-send=3D"true">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" =
moz-do-not-send=3D"true">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597" moz-do-not-send=3D"true">Intel XE#25=
97</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0253v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-=
not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_j=
oiner@invalid-modeset-force-big-joiner.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012" m=
oz-do-not-send=3D"true">Intel XE#3012</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_joiner@invali=
d-modeset-force-big-joiner.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-5/igt@kms_s=
etmode@basic@pipe-b-edp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883" moz-do-not-se=
nd=3D"true">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150253v3/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-=
1.html" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_v=
rr@negative-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"tru=
e">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_vrr@negative-basic.html" moz-do-no=
t-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-once-rebind.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz=
-do-not-send=3D"true">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-dg2-466/igt@xe_exec_basic@mul=
tigpu-once-rebind.html" moz-do-not-send=3D"true">PASS</a> +6 other tests pa=
ss</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-bmg: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f=
068e8535/shard-bmg-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-218=
0444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bm=
g-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab8=
82ad682a1f2f068e8535/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8=
535/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444b=
b7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/i=
gt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad6=
82a1f2f068e8535/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-2/igt@xe_module_lo=
ad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535=
/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f=
18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-2/igt@=
xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a=
1f2f068e8535/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326=
-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shar=
d-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5=
bab882ad682a1f2f068e8535/shard-bmg-3/igt@xe_module_load@load.html" moz-do-n=
ot-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@xe_mo=
dule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f0=
68e8535/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180=
444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-2/igt@xe_module_load@load.ht=
ml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg=
-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab88=
2ad682a1f2f068e8535/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-se=
nd=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-8/igt@xe_module_=
load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e85=
35/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3326-2180444bb=
7f18fb5bab882ad682a1f2f068e8535/shard-bmg-8/igt@xe_module_load@load.html" m=
oz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#2457</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/sh=
ard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-b=
mg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/=
igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@xe_module_load@l=
oad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_module_load@load.html" moz-d=
o-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150253v3/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-150253v3/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-150253v3/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50253v3/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253=
v3/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/sh=
ard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-b=
mg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-8/=
igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-8/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-8/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-8/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-4/igt@xe_module_load@l=
oad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150253v3/shard-bmg-2/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-3/igt@xe_=
pm@s2idle-basic-exec.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953" moz-do-not-se=
nd=3D"true">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4173" moz-do-not-send=3D"true">Intel XE#4173</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-=
adlp-8/igt@xe_pm@s2idle-basic-exec.html" moz-do-not-send=3D"true">PASS</a> =
+6 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-ato=
mic:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-8/igt@kms=
_async_flips@async-flip-with-page-flip-events-tiled-atomic.html" moz-do-not=
-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4543" moz-do-not-send=3D"true">Intel XE#4543</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-a=
dlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.htm=
l" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2953" moz-do-not-send=3D"true">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
" moz-do-not-send=3D"true">Intel XE#4173</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send=3D"true">Intel XE#=
4543</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-lnl-4/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-270.html" moz-do-not-send=3D"true">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760" moz-do-no=
t-send=3D"true">Intel XE#4760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150253v3/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-r=
otate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send=3D"true">Intel=
 XE#1407</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-1/igt@kms_c=
ontent_protection@lic-type-0@pipe-a-dp-2.html" moz-do-not-send=3D"true">INC=
OMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-150253v3/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.ht=
ml" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>=
) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_c=
ursor_legacy@cursora-vs-flipb-varying-size.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/229=
1" moz-do-not-send=3D"true">Intel XE#2291</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7/igt@kms_cursor_le=
gacy@cursora-vs-flipb-varying-size.html" moz-do-not-send=3D"true">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354"=
 moz-do-not-send=3D"true">Intel XE#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-adlp-2/igt@kms=
_flip@flip-vs-rmfb-interruptible.html" moz-do-not-send=3D"true">DMESG-WARN<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253=
v3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html" moz-do-not-se=
nd=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543" moz-do-not-send=3D"true">Intel XE#4543</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-m=
map-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-4/igt@kms_f=
rontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) +1=
4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-7/igt@kms_f=
rontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141" moz-do-not-send=3D"true">Intel XE#4141</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6/igt@km=
s_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-1/igt@k=
ms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4141" moz-do-not-send=3D"true">Intel XE#4141</a>) +2 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-dra=
w-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg=
-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311</=
a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw=
-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>) =
+10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw=
-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-3/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) =
+11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_h=
dr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-send=
=3D"true">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150253v3/shard-bm=
g-1/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-=
do-not-send=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-yf:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535/shard-bmg-6/igt@kms_p=
lane_multiple@2x-tiling-yf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596" moz-do-not-se=
nd=3D"true">Intel XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150253v3/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-=
yf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5021" moz-do-not-send=3D"true">Intel XE#502=
1</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535
          -&gt; xe-pw-150253v3</li>
      </ul>
      <p>IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-3326-2180444bb7f18fb5bab882ad682a1f2f068e8535:
        2180444bb7f18fb5bab882ad682a1f2f068e8535<br>
        xe-pw-150253v3: 150253v3</p>
    </blockquote>
  </body>
</html>

--------------NnzGMUyYASz90jubns3Tcs6p--
