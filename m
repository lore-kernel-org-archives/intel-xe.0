Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEC6C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 20:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF2610E916;
	Wed, 12 Jun 2024 20:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKlem/G8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A3910E916
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 20:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225453; x=1749761453;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uVO6BYZb1HNErg0XnLnMVZxhr0Cxk8LHFmzQNpfSOJ8=;
 b=iKlem/G83nCA5OBalfWMbK77GGBOFBrQdacb3wU4yV4ma8UQmAG3/jq3
 weSjaLIH9gO349nyJY2XMakiEzozOxp8pLE8wyvlKBTQdq5YjsWN3bO47
 B2wABoCAWfh0PTZMwTFCdG81XkmpQUi5WScRGe9c3iuEDFjtce5DFelV8
 JpFuEjYSQ0FVLTGIYWfHLJ6dd2X0NQxtUT6gyZ8duQ7pmqfiHJWsak9MZ
 pd/kW11VgpJOqwD+FWF7XiKHHEGLb+8FE77lJi0/BQHXZefC6fBqgLZ3O
 DMaepRgKInHlZuiRsIpG0EneRNbxrM2yD9tCjFo68q+pb0o51r/POOj3D g==;
X-CSE-ConnectionGUID: wQBrMXQ+TFuqKhaMrJGD9g==
X-CSE-MsgGUID: 8LrHFnOhRIy7BtxLcpBq6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25647928"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="25647928"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:50:52 -0700
X-CSE-ConnectionGUID: otjxCpUFQiaKnPzREqWSug==
X-CSE-MsgGUID: haLs+XS2TgGvCqrbwJYF8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40008408"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 13:50:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 13:50:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 13:50:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 13:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJHt0H0xli6o4Nt1Idw7KfAxqvdnZ4+nDumg3sSV+kC+YqlO4X3IP0RGwv01lZIFR2RbUQZ7s3hC+FnphezYBZFWvV3sXiIoMuPLLDKSi1r3SSNWJGOHT8PyALanVLP/tREWWDsha0FetFX117tOEbWqX6J4NiMJYPIlJHU6Z23MTDuGoxALKt3oJfb8PRpwZXMMwLXoHs9a3v5Ugz5xnketZSSRb3VZJq574lTNHbsLpuuxaXQt067aM5d49dui4DmszRY1HG6JsR1rM7icgYU1iiuFxfhGy7yd7H1arX5VpUZCYIwpg8x+4Z3HVPmXdZBLsUqgQg0ZYYGKM3f37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G92yILG6sWFWTdokznLNuAmeBqzNywizawawzYdz/Rs=;
 b=DGd5j4w1yKQgSrbZEb2nmdydAY5OiRwVVeNHJuzdCvXKkmZkng8hWoa1R+BrD0Cx7W8guDyDm2Km/yM0z1Ws3BlE/e5B49/tscgKkB9MxfCv9/TC8d4enMUCEHiZ1gNapuCiusHZLgIW/1jiHuTdNhHWcLDK1X93tZc5n6fT8RTJGOAOMNDxPUIO7I/G3Hc3cjfLgb2Honammo4sNsiorQHTyP0tOY6ed/ybUo5uMAvrVbv6QqOuln33a3I8nZSzbMC4c1mL6nv6beaDCag9JRbHl2eLIeZvwdaxWfBaQw1TlKoCSgi2D3iJFOoB2NELHLQwKY1L7AQEq+5TGsn2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 20:50:49 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 20:50:49 +0000
Message-ID: <a7f1b756-fdf8-4104-b827-42ac18fc5149@intel.com>
Date: Wed, 12 Jun 2024 13:50:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/guc: Avoid named enum types in GuC KLV ABI
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>
References: <20240611180735.1988-1-michal.wajdeczko@intel.com>
 <20240611180735.1988-5-michal.wajdeczko@intel.com>
 <ff5024c2-a973-4a04-a41f-d0197ea74561@intel.com>
 <67ea0d7a-1383-46eb-84fe-eb6140063842@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <67ea0d7a-1383-46eb-84fe-eb6140063842@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR2101CA0035.namprd21.prod.outlook.com
 (2603:10b6:302:1::48) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL3PR11MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 90025782-706f-4994-a5e5-08dc8b215724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUhveU9TN09waExlM3hGazBhTlE1TVN1UTFNM1Z3K3hyaTQxdEJhdEljT2ZZ?=
 =?utf-8?B?aGNMbTVqeVZJbzhmTFg1bXRhR0ZSZUxVOE9kNmVZVjlhb3habkJjK1ltUTdP?=
 =?utf-8?B?cnliYnZUanhPYUtWdDlNWG5BMFhLdFJjdmFKdSs5TjNMOWcrUFBkMlFic0VY?=
 =?utf-8?B?MmZQQnI2citPcmpMNEZ4TzNPcDlIdm5GUjlqQUJFUWdvWC91eWp0L2s1TDBF?=
 =?utf-8?B?NkVIWlZaR2ZoWFFsRWxwWXZFR2IrbGZlaXlGRVdKektPV0w3QWh0SDcxZGpp?=
 =?utf-8?B?RXVGN2d0OEJPYTlYbGFZcWFEdnJGK0FJRVcvMVAwSFJLaEt5eWRSdWVkb21B?=
 =?utf-8?B?SnRKd2RDcU5MRVVOQ0ZtbWRDM2liT3hjQlRReUFGOExUZFkwOWhvY0s3c1Ix?=
 =?utf-8?B?TkZiV0pSUUNITG1OMFpHM3FGeUhSK2JMbXFSNXE5a1NpWkxxa1YwSzhpVU5K?=
 =?utf-8?B?Y2hBS2IyNHlaZnROZ2g4S2dHL1Qxd3JCUm04WFdVTXduczZucDBOTUN3dStH?=
 =?utf-8?B?OTZCVUFhYWV6UWVYTkZnRktnU3pCWGpadXN2VURkdFVCVFVPSXE2U3BQRFRK?=
 =?utf-8?B?b1BvM1dXdjVZOXRpWlQrVVVFVXluRlh4ajBWcU9yMWpxN1BhZm16N2I4MnY2?=
 =?utf-8?B?TzdKVHZ2Qmo4TUNlVGloTjFMc3Jmc1lvOEMvcTlhMlY0bVlMMTJIQWg4UFBn?=
 =?utf-8?B?NVdmNzdudHZFRE5RKzMxRjJXc2JzMFJRVXllOEZldVEwYmxWc2RJK05CQ1NJ?=
 =?utf-8?B?ek1vNFRVaFdBYThHNjNjTDFjZXhXc3FtelYrQlBvNS9TcGM4S1NPWHBIQmw3?=
 =?utf-8?B?YWViNDJiYXNjSWwyTEFlOFVpM1k4bVlFWkI4MStNL0RKeitJSnBPVjk3UXBD?=
 =?utf-8?B?NGxsVTd4dVRnZStoUjJoQStoamNqVVlJay8zY2pMOWo0bVRKcWpCL0JJNGV4?=
 =?utf-8?B?WElqcUxzY0E4cEVhb1pzbmhmeERaNUh6SFhRS3lTc3NjYWo3QTZ3d0tnbUVL?=
 =?utf-8?B?WjF3eWlqSU1hT21TS0F5dnF4WTU5TDlkcmVXQ250NHA0eVRJcWZGekdBRStP?=
 =?utf-8?B?Rnh0dVF6bWl5cmtoakp1MzJJakR2U3ZFeGh3VndlZFZSLythYVMyenBGelI2?=
 =?utf-8?B?ME1SVExmOFltdHIzeWxZM2l4ZW5VOC9oalFoZFhsMFdiM25LeTBTRmVidFR6?=
 =?utf-8?B?aDVjaEhJTjl2dllYalZIVWJsMlB4UEV1c0YvUlVxbmlyTlI0Z1NOa1VJL3hy?=
 =?utf-8?B?TXNnL3d6eGkzOEJwSHExTi9QUzRYWXNic1M3MjVZWTRFMnRmNlJPdTJvWW1n?=
 =?utf-8?B?MEpDRXBSK3VPTE14dmZOY0dMT1BMajlwdDdBQjFwbHVGdHJIbFFFZTZueDFi?=
 =?utf-8?B?Z0dWVUo0dG1oRHJzK0tpcTRzb3laZUJhbTZnWE9RMThsaEFUN3BOSENadXNz?=
 =?utf-8?B?L3RGSmtnbTR0YzAwVXJnTUswRU9uY1Izb0xaTnpYbWIyNHlyT0RvdVBCMlVG?=
 =?utf-8?B?Qis0cjl2MERsbmZYRk5XSnJJQ0hZNTQzTVdnaDBVeVhuL2F6cG1XclhxZ1Qr?=
 =?utf-8?B?RFRsd21qSW9MQml0Zy9GL2JhL2Y2YitldFpDaHBWNHdOK1N6bHp0dmVCZFBu?=
 =?utf-8?B?RExLaEdZVDlsa0RKUzRvV0FvQlY1SVBpQzRnNUR5dVBwdjg3OGxxS1JJMUtT?=
 =?utf-8?Q?oV0L5AvEFBDMv1GShi96?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXIrRWR5eVkyVUlIMmFhMjQ2SE9ReGY2M1BKcWpwV2lTeVdRQ0tLalBkZHF2?=
 =?utf-8?B?YThadGsrVmtrcmNnUGVMdHNuc0JPVFE3YTdtdkNuaDAwK3lvRzE2c0F6dFpO?=
 =?utf-8?B?dTJ1WUVwa1kvcHNPa0FXZDJ1azYyWVRVbCtwM1JDeGtWZFFpbUhHTzlNNUlP?=
 =?utf-8?B?cGgxMFM0K1dkYUZpS2NFcTl0NkhHemx4NjlOS1JXcEtMVXl3NXdnZXpESUNX?=
 =?utf-8?B?Q0xlcElndUJucm5BK3QwbDdEQTVpRHoyaGR4ZXdaZjA4Z216c0ZjV1pkN1hI?=
 =?utf-8?B?cll5dUM4QlBTMlB1b0dTUnVkUjBoZnlFNkJOdjFJblhIS0ZDYjZwWUVjNG5Y?=
 =?utf-8?B?SFlKRDRHVkp6emxsRzJDMEtZYlN1MmRkZnZ3U2M2eFRvNm5hc08xRG9hTVoy?=
 =?utf-8?B?OWhGMkM1WEwwRUZGZFlvYkhtYU8vUFNBS1l3MVRGcThZK2RiYWc5aFBrcnVx?=
 =?utf-8?B?dXM1TDJxdFNSZWtlZm0xZVBHcnh1Sk4zSjhwOFFYZmYyazdKZXN3WjNaNnVS?=
 =?utf-8?B?WGkyblRkald0OUF1c3lHb0gzSzNuWlAwbXJQR0VPcy9kVW9OSDBIV2EvYjd0?=
 =?utf-8?B?R1VQTi9zRlFJdmtlWTk0ZGdFUlRHZlBWOGpJaUg2WWxDdG54QkN4UkNyQTBw?=
 =?utf-8?B?VmloODlLUmtUdUtndjU3dEowRDl1NDk5OG55TWVDNXQ5dDlrbHF5K3lPa0ZS?=
 =?utf-8?B?NUh0UFhkcnp3d2U3ZFUrQlV5bENCYXRxT0g1SXhDVkxwMHVUMVdSa05LK3U2?=
 =?utf-8?B?UU9QbnRsWnYraUNNRUJkcURSTm9qSlVuaXlXSko2dlkvdDYvbjZBbm9QNkw2?=
 =?utf-8?B?Z0VvWXg1QzA2WU15OHZsV1Q0UjRjbFUzYklSZEtpRFhwR1U3VGpyc2c1Unkw?=
 =?utf-8?B?UjdPRHYrUGZ0YnFjQWpqZ0xrYnlZTnJjNmtaKzdyOVRINFdnRG1PQzdDcW03?=
 =?utf-8?B?aVZySVhKcGtNNkEwQVA3Qk5kamNTb2pUT2pxQmpoZjZ6SlBTT3ZRMjh4dVNv?=
 =?utf-8?B?RWF2bFdsYlB6Z0tidm5HSHlNckFWUStSVjI0Z09LYmg0V0QvR1hMV2U2RFlt?=
 =?utf-8?B?d0dBMzVoU3lCMzE2dm1WR1NnWE9rb0NjUGpkdTFZL0xHcU1HZDMrRzFxOFpz?=
 =?utf-8?B?OFNEMHdqNTdYcEE5Smo3Mnc5MWtiYUl5akFMUlkrVkdTSnNTUmFody9kRGJn?=
 =?utf-8?B?LzVxbTJCKzd0K2ZER1VPbm55YXVja3RINk5OVGUvQnJuTWRGVFR0YTREOGpa?=
 =?utf-8?B?VkRITGo3ejF5RzA0cVBUSW1MclNaL3VZTVBlVFNxSlpVNzNORkVzTzJSckFC?=
 =?utf-8?B?TGs3YkQ5SHJZSW05Z3JhNHVkTkV2ZzV6Mmw2RXk0QkRhK05wQ2JvUWloTU84?=
 =?utf-8?B?Sm9TVmV4T1NCRkkwbnhFcE42Tk8xUWIwMWd2SmRoZmRpUGdISzhKWEtSaWR3?=
 =?utf-8?B?NFY0VndsaWxkUXJPTjUwam40aVpxNkRhWkRJOHNFZDlOZzlzT3laWVQyZ0Zm?=
 =?utf-8?B?dlVqUkdIUTdvUWtoKzZnT1RLcytscEdkYWt4ZXRvL0RKdXdTVEtwaVhaYzkx?=
 =?utf-8?B?a1pSZHlXbTU2akZSalRGWXd4aG5iYWVnenZYL0preVJZZTZmTjkzMUxyODNR?=
 =?utf-8?B?Nkp4c3RqWG8waXFRRG9xQmNUK3lUck9TMHRPMGVSRE5uQnl6VFJlUXAwZCtu?=
 =?utf-8?B?aitoSE9UblJra09YUU8zRmg3N3FGcHVQTjJ2aXhjRHRmRGQyRHhlM2NjSWxu?=
 =?utf-8?B?OVNEbTU5RzdpejVKcW9WUWdrZGI0QWpOdUpFUUZaYW90RXlpMHhjRnN2eTVx?=
 =?utf-8?B?VEc4bVlwUEFENFJHaUtqSGpnOGZsY2ZsOTdTeDBva043bWpmRzV6QkdPY3Qr?=
 =?utf-8?B?RHBlS0NVOStYbGxjQStGaCtTMEgySDA1WGowZGVGaTdLQTNZS2JtOXNCVExT?=
 =?utf-8?B?VXlpN1FIdXhjNWVESGRqTndHS0hXMVhuWlZzSkovT3A5MHFSK05STjRXZFdN?=
 =?utf-8?B?TThVNjdKSFRMU1lCZndEemNBdGxUcjJlYUMxRTZiVURrNUpiWUZ4L1JZMmtT?=
 =?utf-8?B?dlhJdURXYWJjMnRLMzdyZFlvcHpFbXZTODEvaGhydURSejY1NTI3ZGpkNW8r?=
 =?utf-8?B?UGVaY0FobXRSbnB1a2JDSXVwMTBOZm9LZ1h2Y2owK2NzSXpsQThIQ0tRZVEy?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90025782-706f-4994-a5e5-08dc8b215724
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 20:50:49.3398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlLC7kjQP9DGbSrLD/DOwllKdFskebEgKbsjRxi2DQfQAaIsa46GFxytcroMwc8uAfAdXypOXnl/gHGkjibfpvKhtTASl2CyYTwExFhsJ6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
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

On 6/11/2024 14:14, Michal Wajdeczko wrote:
> On 11.06.2024 22:16, John Harrison wrote:
>> On 6/11/2024 11:07, Michal Wajdeczko wrote:
>>> The xe_guc_klv_ids name just for workaround keys is too generic,
>> So rename it to xe_guc_wa_klv_ids?
> but the idea is to make GuC ABI headers shareable between i915 and xe,
> see [1], thus having driver specific prefix in the enum is not desired
>
> what about guc_wa_klv_keys (as we have KEY not ID in the KLV)
Sure. Although if this is in global space rather than confined to a 
specific driver then shouldn't it be intel_guc_wa_klv_keys?

>
> [1] https://patchwork.freedesktop.org/series/134722/
>
>>> as workaround keys are not the only keys used by the GuC firmware.
>>> Other KLVs keys are defined as plain defines or anonymous enums.
>> Just because other instances are done badly doesn't mean we should break
>> the good one to match.
> all these are ABI definitions so IMO there is nothing wrong with using
> plain defines for values expected at the binary interface
But there is advantage to keeping things correctly typed at the software 
level before you get to the binary interface. E.g. you have a helper 
function specifically for working with w/a KLVs that will produce a 
compile time warning if passed a scheduler policy key by accident.

>
> also using defines allows to have similarly named related definitions
> that we could all place together (like KEY and LEN for each KLV), which
> would be hard to achieve if we will have separate enums for those
You can put #defines in the middle of an enum. Or you can quite easily 
and cleanly prefix the relevant defines with a comment to say which key 
they belong to.

Personally, I find the way that H2G/G2H action definitions are scattered 
through multiple files and hugely spaced out within those files makes it 
extremely difficult to work with them. The original single, concise enum 
of all actions was so much easier to use.

>
>> Having a named type gives you an extra level of compiler type checks
>> that you don't get with a u16.
> fine, but at the end you need to convert to u16 anyway
But the later you do that conversion, the safer your code is.

>
> and hopefully there will be no clash when those WA keys will be used
> where we use another named enum for KLV keys
I'm not following. You are saying that there could be a clash because 
0x9002 is used for a w/a key and also for a policy key, for example? Or 
that there could be two intel_guc_wa_klv_key enums that are used for 
different platforms?

John.

>
>> John.
>>
>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 2 +-
>>>    drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++--
>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> index a0b80c9fc5ef..831a2b57f308 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> @@ -346,7 +346,7 @@ enum {
>>>    /*
>>>     * Workaround keys:
>>>     */
>>> -enum xe_guc_klv_ids {
>>> +enum {
>>>       
>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED                =
>>> 0x9002,
>>>        GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING
>>> = 0x9005,
>>>       
>>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE
>>> = 0x9007,
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index 1c60b685dbc6..a3de00e92b4e 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -285,7 +285,7 @@ static size_t calculate_golden_lrc_size(struct
>>> xe_guc_ads *ads)
>>>    }
>>>      static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>>> -                      enum xe_guc_klv_ids klv_id,
>>> +                      u16 klv_id,
>>>                          u32 value,
>>>                          u32 *offset, u32 *remain)
>>>    {
>>> @@ -312,7 +312,7 @@ static void guc_waklv_enable_one_word(struct
>>> xe_guc_ads *ads,
>>>    }
>>>      static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>>> -                    enum xe_guc_klv_ids klv_id, u32 *offset, u32
>>> *remain)
>>> +                    u16 klv_id, u32 *offset, u32 *remain)
>>>    {
>>>        u32 klv_entry[] = {
>>>            /* 16:16 key/length */

