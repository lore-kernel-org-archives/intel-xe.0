Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFE8D64099
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9317A10E027;
	Fri,  8 Nov 2024 23:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BL8hM+6g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B6210E027
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731109750; x=1762645750;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9N+EA+eEauhoDtULTC3/LU2OASeNd1wyatGPfXlKh/Y=;
 b=BL8hM+6gevFmAgwGn8lA08gkmT4Ui9oJGlM7jQZ7i+YhZUnhM1uTnqxD
 794AVTG0f4sabhAxh1e9nSC4H1cY7M7xp4+d37G/BhOi99+6arKbsv0gK
 Mw7c03kw4rf83UKUfz7oBaNMy6bBa7kHx4pistRlDD5v7gu1Rhq7TkpT7
 jEwYrLrxMz3c088kwvItiZcoWwuavTHq1WVzqtIArgeyJMbCYTGePnf5e
 Dza5LUFC5WXpmgPtz51wt6kB4L3NYm9kWyziXMKsPqqnGOW2U/2P63i0D
 k3bALqzsMxBuVKuZzya2v4l1VMlyFJyyrwAnWHQeuPWiZbctl4D505GVX Q==;
X-CSE-ConnectionGUID: 0ZUfk8h8TLuXggnfkrJNYA==
X-CSE-MsgGUID: z4zwHY+kTU6H6Gj1qkWm6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53570479"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53570479"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:49:10 -0800
X-CSE-ConnectionGUID: tqsdkKX9Qb2xkUtSrvP1lA==
X-CSE-MsgGUID: +jFWeNvYTJ+DJPl9K92EuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85786892"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:49:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:49:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:49:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:49:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seFkNUJmxXemX06aziYk7+7VSxyXQubLAzcj5C8N0UvpVXF8x+UBh/NAgia2/aBkavgisyxJ4yJlcESiWjS0SMxUvIhc95Zzr5nAUqMSK6jdanb3uolerBjUT0dGzVHD+PIUlhCsqtHIOsf2FZvD8KTC+3Cv7d+kyV/TEFeVMeTHInwzhPHB4bDd0Ec8HuAAB6GfqHsrskZ9x6Mrn1mFRiQHVUxx9iF3uf+A/8zJDLvARUydUTvPRczWqYx0Xb/QkbJhkaHwot5/RScn0Rqd3bJeD4As+zaEPW2ZMhOtncR7jywxq1tWY/h9o3P2R51JvWLA2SKla1Xiqp1Uss5tZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8UDwg1MDlcFSQKOBapq24Ayw9OstAXtKhvImE6SPUU=;
 b=i1A6RoSXI1c6nZtbaOWfKrok+VirWbcmyD8DwNbEiCQhncN8c2MOKzR3FGcWg5E1D52d+twk7vMFU+KsVPBafVi2HRY9bvljz8PHLlpV6uIVM/YaJ68pjIy0RwaP659jrnkl7nVdpPwUccdp7nl69FlVlBoO3uHH2+UrUb6vuRmnrUK6FnDLRCZ8jfxECdMEGOsb7CG9DWR+Vf1znmWhKd8Tfu/9ga03m7hmIJk+/lmif4Rc5EMpxwcNnH2ZevRy07JsslJSmfJrqIKVfYj9Jnu8J+G2LR73ePlX2K72s2xZOFgZV/aOyX40xVtx7m7sTF/zRme8bSjD4KTnZmqt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 23:49:07 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 23:49:06 +0000
Message-ID: <ac48a2e3-6ab6-4518-85ad-0f696e09bebc@intel.com>
Date: Fri, 8 Nov 2024 15:49:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Reduce default GuC log verbosity
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
 <20241108212737.2044007-2-John.C.Harrison@Intel.com>
 <Zy6f16+PhbgxZYTb@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zy6f16+PhbgxZYTb@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:303:8e::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 2997f638-19db-4d3a-6a52-08dd004feed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1d1Smcza2lTWEljYUVJWm5iRU15ZjVieDJvYXlrUTFEcnNMSzArTjI2Ty9l?=
 =?utf-8?B?KzNiTVljN0dqWFBUMTlsNThkSXlLbmhUNWdOZzhnR1pna0VLaUUvNVFXd25P?=
 =?utf-8?B?c3VWeWFkKzczRzJ2bVQyUTlsd0ExdXo5YmlXVTR0RjRITE1CR3N3eVh1ZUdo?=
 =?utf-8?B?OERzWWVTajFlUkdMTTJmRGJLVFNNc0ROY3lWWklpdmpaczFSUG4wdTg3R3lR?=
 =?utf-8?B?NWVpcmhKM2k2bFdMNWVCbkpySkJGaGFtNWFFd0tVbUE0aFI1YnZ6b3BDc1Fu?=
 =?utf-8?B?Nno5Y2JSd0ZZVU9ObW5sa2NIM0l0UnhNL0RTczJmVytFM3pUdDE4UFMvWnZW?=
 =?utf-8?B?OHFnWlE2dFhQdGYzMmZ3dlB6bEhqSjNqUWpMOC9DMFdGeU9vQ1BoY1NXY2ZF?=
 =?utf-8?B?K3g1WW0rNGIrWEFkelA3VE40ZHlwNXlBMnF0RFVLQTV5RTEwU3hGU3pHUEdz?=
 =?utf-8?B?YWhPdXNsdktIeXd4RUVhMlNNc1Z0bldGTE9vQzJtM1B3aWFsMFVmeTdvcWRm?=
 =?utf-8?B?V2lXek9nRkt4dU5wNVBGa3NvV1lqY1ZpdEpPVkk1eXpBSVppSGMrNmtYa0dv?=
 =?utf-8?B?NERlbHo3QVN6YUtCV0J6ZW9zeFU4T3ZNY2tFVFJGVU9qbjVIdmxJOUVFSWZ0?=
 =?utf-8?B?NldKUC9RQm1HUW1LUmhxNnBLWm9Dd3RDWjcrWThPV3dMeVZlK2I3UFY3cDFn?=
 =?utf-8?B?YVZLZlVsZEhVL0VLRHlWRjVJdkF4UndZLzRTOGdIQXFvZnJMY285MndhMmw1?=
 =?utf-8?B?OGM1MDE1VUJvM2Rxb1FoT0xLYlJtTkR0eTljbGw4L2cyenQ4K1dnV2pqSFVJ?=
 =?utf-8?B?MEVmVk1Pa0JvWGM5RUpjVmYvL0dCVkl3dzBza2pyeW9XQ1BicWVVUjJKQit2?=
 =?utf-8?B?akVtaTdwZTNlNjZGR29IUmU2UkVhUEV3MmJudW1YWTNrdlovYkRjWU1Jb0dF?=
 =?utf-8?B?TGFjUnVlLzM0cnc4bDV5RnlRQys5a2UxOEVVaDlUWEQ3U3RQTnlTeUN5UUY0?=
 =?utf-8?B?a3M2OC82RDJsa3NGcnhVTThnOXFFbTR6b0VwcEoyUzM2bHJMZGVnd2ZqZWZ2?=
 =?utf-8?B?aXdrQjBBMUxUWXhud2U2VmVEZkpERURBaS9wZW5FTHVlMmVraXZEc0N3R0w5?=
 =?utf-8?B?VGVDalFNZE92QW1aSFliQm50VTN6TUIxVnY3SVFuWFRZVDJ3dnp4Y0JWYmRy?=
 =?utf-8?B?N1VjQ1dnMFlDL3FXNTJKRDVsNm56VzJWY0htQ2lmUHZoYmtEZGlWS2xZeHdJ?=
 =?utf-8?B?REJWYkpWbGd3aWIxSVJVKzRjcTFubUNlQllHeGJ6OXNiMmRHVVBVVTdOVkNu?=
 =?utf-8?B?WGNLUlM0WXBRTzd4aGFZNkJ1YlZ2Y1VxK1V4WVU1NVhKRWh6MkZ3ckFRN3Ey?=
 =?utf-8?B?c1VxdjJROVFMSGVYTE52aG5HZ2trKzFoNkkrbk95UC9qMkx6UGhrTkEvdzcz?=
 =?utf-8?B?RjJMS3lFUDNGMGJmZ2M5MnBUeHk4VzRpTDY2L2c4K21WN21KK1FZMUFxb3VU?=
 =?utf-8?B?SXFSSjc5OUh2dDMvcGhJbUtiaWpSNnhhamxwaVlpbjUyUGEyTStrYUhlSzBD?=
 =?utf-8?B?WWVXZkxmYkc1MEFpSVBtTnJscnNzREUrWnRFUElPQnAvVHQrZXpOaENzcFR2?=
 =?utf-8?B?Rm1pVmxneUdrU1d1c2M2ZitJaHc1V3hPcko3elJOa0paR1pYcyt6ODZNSFA4?=
 =?utf-8?B?b3FRSUFUSDB3UjdoNm9WcHBHdHErZjJqdjRYeDRzRzRLd29EdGcxYjloOEgr?=
 =?utf-8?Q?tbVzZ2tHeoofcxRdAtxuvS36FMnS1cyfM2ErleS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUovNFE0RW9seCtTYzJnUGhsTnpwc0JhdVlWZzE0eldrQnFjSWtmcWE1VFd6?=
 =?utf-8?B?REpIQmZOaEdVS2tsREIrZ0d4VGlPSHg0eThNUGtYSFd6NDhJYjRXQWNITXhk?=
 =?utf-8?B?RUtWM2lQWWg1a2l6WUpXNXA4aHhRNTA1WEtZcWNlNVc5QUxNalZibk4xK2ZE?=
 =?utf-8?B?aGFvUjYyU1pCdFhDNVRHQ2V2eWV3VE9ZVHNacUF2R0N2MEV4VVAycWxqbWRT?=
 =?utf-8?B?cGVNVCtlQU1BVllsRkhobzFNNGFEclZGazRTT3F6ZXFoTE9tRWxnKzJmb25l?=
 =?utf-8?B?KzlUMGZiUDJiQ3BMZlNLY0czK2xLWVdWaWZGTnRTb3JTeFJuOFBaeVhaT3hD?=
 =?utf-8?B?RjBmZ2RUY1o5elIzSndpczZLN2hzQ3Y1M1hsOENSRXRnek9SMkxlMUhmODcv?=
 =?utf-8?B?a2tRMHZrU2lPL3UxcHprVnVDR20vMkQ4MGd4ays5a1U4dGpNZEpKUzlDT3Ix?=
 =?utf-8?B?VXVwc3hpK3I3dXl5NWtjWXVCZmR1ZEwxUWFjMWpac3BBN1FVUFBSTnUyaFRr?=
 =?utf-8?B?dldUNkVRSEQzdnA4MkxYSkJlVzVxY2JUQjNpZmREWFU5RlB5UXRCQnZZZHlo?=
 =?utf-8?B?TmpXeFltSTRFOTZhdWRmUEVVRnlWaE9wOXQ4M2lTQ0VaMzZxLzRvS0VxRWtS?=
 =?utf-8?B?d2J5QUF6cmRaYmkwa2hJN0R1cjFteVZrWjlpQWRvOUU2aW9wK3NHTm8vMmFL?=
 =?utf-8?B?Nmc3dCt6M2xiNWNDQTZoWHNUZWJGdGZXOS9aMy92UXB2bW5obW82ZytWQllB?=
 =?utf-8?B?WUxMcTRuaElOK2lQazVVUmJKMlZMbUlQa3pIOFNuVmdTYk1iZnVVYTNhY2Vp?=
 =?utf-8?B?S0VqL1hlcGhrRFBwQ1JXeUhheVV4MGQ0VTZkR2ZsQzh5elZwSXNaUDlNTldS?=
 =?utf-8?B?L25hcTAzcVgzcWNubU9aR3hCanR0aGZzdTUrSmpsVzE0YTBaeG9ZYTc0MnZ1?=
 =?utf-8?B?bjFpZzUrZDRrb1dtYU5NTTBTNUFpNE9jdjEyMTNPTkJoT1FwV2VvOURRSWpY?=
 =?utf-8?B?eWJLWjRCMXhuNkJRaXJ5bWFza0pqbmFUeTQ3K0VEdVRicmFLdnRpNm5hdUhI?=
 =?utf-8?B?T3I4eXRaem0vb01qM0FqWGJ2VllodWswcjBhM05ENEFGZlpkMHlzQkdZcllH?=
 =?utf-8?B?eEk4dnhrNzFZMUFtRy9pR1RTN3VMZGV0V2FsVHhOanRVaWNHQkxJMzRySmpk?=
 =?utf-8?B?LzNIWnBZbXArb253OW5KZWtBcFExanlvUm5kY2FtWWY3dG9uVFVhUE84cnNK?=
 =?utf-8?B?dWhEMmdKbUxvRmVZQ1AvT3lsQk5scVVzdFlWbEZvK1d4Mi9keURnUkUwYXZB?=
 =?utf-8?B?WXViKzU1K0VGM1p1NHlPOW8zVGRMRXRnNFgxQUc0MXl0R2VSRktpWVRkRER4?=
 =?utf-8?B?ZG0rUXVtUDEwaUl6bENUTlJYQXNKTDdNb2U0anNIc1BnZWNseEZYYUtxeC8v?=
 =?utf-8?B?SzNLSjZRYUJ5Zm9iRDFKOFZLclRtUXp1OTJ6aUFXT1J3QjhSb1NKazJBN1p5?=
 =?utf-8?B?UzI5VnRHNDhZZ1BWMzN0YmxDVVd1d2hzRU1tejFFbXNFdmRYRCtFOE5UNGVL?=
 =?utf-8?B?bGtsWkI0blNBcFpqN2liUnpjbFNFT1p2RGJlSUk3TkwzK2JSUzB4Znkra3pt?=
 =?utf-8?B?aFFwSm1LVVpscmNTcUFIRW81UFBaUFduZkJVcTRWamZMNlZDK2Z2VzRBbnMr?=
 =?utf-8?B?cU9pUzhFcDRrUys4akNhcTdERG5KZURWUWJRL2hGenIxb2pIMFZZeWx2Tm1W?=
 =?utf-8?B?cW1qb3QyUis3eUlZYTI4Vy8yVTNMMHVhSncwcDNYTGVXcHgvSlBSdlhpS1Ri?=
 =?utf-8?B?SGtpelNxZ0x4VnZHT3I1SjExWmhmTkUxWHczcS9KWVQxR3c2UC9SNkdjcW5x?=
 =?utf-8?B?N3FtTDIwQVhnUUJnTWpzKzF0V0pYZEFpcTlmKzU3T1h4QjVTd3Z6WU12UCsv?=
 =?utf-8?B?SEp3RFBIakI4cGprNmE0K1VmeERMWkp2eEVxK3hUNWpWbTV5THEwdFVwWVk2?=
 =?utf-8?B?d1NVK2JZMVJzZDllVFhia0NYS3dFVnhxRGZVNFpzUmRGRXhqTERkTGc4MG1W?=
 =?utf-8?B?RW1tcWVQWWRGZVNZWFBMRWR3cGJkU3ZJLzQrcFRqaEFRRzA2aDdGUUFCdTYw?=
 =?utf-8?B?MFovbksvQ3ZnbXN2TS9ndzZUcnRnNHVmdkM5QktrNS80VnhvUTVDREw3Q3JY?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2997f638-19db-4d3a-6a52-08dd004feed1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 23:49:06.7404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaLhrz6GUg20s5/LCilfLGql8oHtngFxya8NKFfgrQaMAJsYdweNm3b+IEUCTq76cAW1prWtEU5ZyDunc0dCIXZdXF5B0F0rzP3IQ382RmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
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

On 11/8/2024 15:33, Matthew Brost wrote:
> On Fri, Nov 08, 2024 at 01:27:36PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Drop the default verbosity from 5 (max) to 3 as the extra verbosity
>> generally doesn't provide anything vitally important but does cause
>> rapid log overflow.
>>
> We still get the H2G, G2H, scheduling information and CSBs at this
> level, right? That generally what we care about.
Yes. Including full parameters for H2G/G2H.

John.

>
> Assuming the above is true:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_module.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 77ce9f9ca7a5..0f2c20e9204a 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -19,7 +19,7 @@
>>   
>>   struct xe_modparam xe_modparam = {
>>   	.probe_display = true,
>> -	.guc_log_level = 5,
>> +	.guc_log_level = 3,
>>   	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>>   #ifdef CONFIG_PCI_IOV
>>   	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>> -- 
>> 2.47.0
>>

