Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DA8C982DD
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 20:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696CA10E11F;
	Fri, 18 Sep 2026 20:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTrq4762";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5179110E11F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789763343; x=1821299343;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MR1f/r4oJklFB50GVQiXn7oC9q+bKBKTT3ziYZZy4ys=;
 b=YTrq4762C5ks0zLXb0J7z4Sf/5WFWAaWghdas5H6yJerXkIj5vBYSwJv
 tmJraJFybkFUmnium+LXBcTZ9bRHN5ChBkUweZ6P5Rz4rWZJOpGUhAA82
 88G8VnXBFxBkdP6V8x6CGQjDbMAcT/SVrTZjkTd/PlMrBd+tyjJwU3JQu
 05MiJxEqa3PxnM6/n7NUMsey9dxwEqS04wPX50fa+PnvgEuh8TLmQSQVH
 zRfV3czPBppHmJX7Zk5UIWjl2Y2epc67GPakBCvUCosQZ4iUqo43Ih4xk
 k/s14PN+tDLqSNP91VJ1yaLTmI5Tpb+Fxx3yEa0K1W3rz+V65O/maxzbp Q==;
X-CSE-ConnectionGUID: zf3+wu31RmSZdT/ZGcbvpw==
X-CSE-MsgGUID: QzYF5macTp++ECfOihTZNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="795033"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="795033"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 13:28:50 -0700
X-CSE-ConnectionGUID: ESKAe0kYSYe8waqI+2TZmw==
X-CSE-MsgGUID: iU5Sv6qgRDaTaXd+Joo7UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="299677184"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 13:28:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 13:28:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 13:28:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.24)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 13:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQPwfgfGrAKKSj6aJc4rl0at8vYmor43lpk0elqfQfkv13/uf938m2/Re/t4bpgiIt60uHVvjm1kNloaVvjBq2hjuWXmkuYLy29tvkW13fwkqHQ48YRkHFkT4QtzbjfyHOfmGYv9xxs3yx5VlFbJn7m7nRzPwcOYM+RAfmq1rTi4ALFwZ5x7wfJqzI/zek1GVBnaD0EyzgmNyoJY/37Y3T1VLuoYbnbPOgRu2vwIdQl47DTYNCW4+aXC2v83VkUUzv0kOcaIT77oB/v6039uEfH3xi9xyTnjnvJP/qH/fyVwLIB+7SUzSnOe/dCIbxCbklEOcMr0QRt3AbIzBQJsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykEBT3zjNXvvG0OyflMsGZRkJXG/U9JAnpiWLi0lcME=;
 b=GK3ar6wlBPEqFvdb/UakvKjsbeUf/BuL9Hk9GEDfu29rejNyLShK8qFGcYB2BZn69MnepIU+xqyiGOdYkTWzfP63qqhjxGiMCsg4jkgLCuVfT3ww5wrxicF9sd5klG030YFiis3sxphdxwPNj7GV+Z7EZHyFBwN7fPonZkXZqJz+h+z0JKZQLyB/Efbb7+xGdaSd2I9Gm1xBI/VbAh2D6yozSLsojE8H4OPNHvYwzc/yN17RcrshvpoUE9Z+LVxaoLbOI7GpXrDeC0XZvr+eiSjhiEvuKQV1/Db6nhiWnd14HVMuF9926iAn89AcSmfh/C9ph67wXTtjix+303x1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 20:28:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 20:28:38 +0000
Date: Fri, 18 Sep 2026 13:28:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe/guc: Use different error codes for CT errors
Message-ID: <aq2e9I+uUeUJlkpA@soc-5CG1426VCC.clients.intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-9-umesh.nerlige.ramappa@intel.com>
 <088c7152-3776-4670-b939-c1fe558e0381@intel.com>
 <aqnNykdW8AeYUzpG@soc-5CG1426VCC.clients.intel.com>
 <aqnQckN7OUBIcnT7@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aqnQckN7OUBIcnT7@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: d83398b9-1305-4682-66c8-08df15c36c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|3023799007|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bREpG2rHintvRbZsjylJjxQEEtECKAxXRlH/D0PcJXVS2+q6s80LSQDQlj2HQxYBuM1D55vvxbg81ZiHAvaZBRbeZi8H41dx+tS0tjEKHwI7sDKOjFj4KWu81lW3EAJBVEhQdItkHIZbVVTBwT8xWQA9f7g+eQlp86QUOzJE/Lx4YtugONKbzYYpbiilXfcXcNxZmhvBsbuxE7nuXe1mPnMPkqXR6gTovyQHaOx7im9iHsTJnTwZxgHZ1eZzblQBE8Yg5VlPh7WNudyByTb6OhOWIWI5LrYBgvkofRP0UZc7pXfvZmhnsvtlzt8a9vEmkXuQsZZ4G1aMsefZMlO34cQQ9fXRryKh7BtZOIco3Nsdm3eePcg38hGDwWqjcJ/bsBvNZGEpO81xFw6kX+AY8kbKwFsw72B+N2f9TJanNowmhgVBNAf8q+E9lCSePZpUSZUuO6JqgYTw0hgICgDz6YFexht04PDY2YAUT4BhWqy7b5WWmRo1WV/DLHDOOlcE74Iv4wGtJsU8AESULEy27xqPL2HuEOGQNxHVgHEnLTQuRnjDzgJl+yupbUFiupcedyB68azLT62QHjCuzdX1jsK82h9ULvrQxf6OREOhfQrzHFx1XSNd/6AVbX6D7+mYzVYz13g+ClhH39qWiwiyJ6Ix/xiOxyHjD80EtQLAHrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmtFUmZsNHg5T0lLdUtBNE1qT0VpWmN4ZzFNNlNuOVFsMTVEWGNZSVFUN096?=
 =?utf-8?B?eGcydWhtY2ZTM3ZqdmxGZnY1SjVoTUsrSzBYdWV0ekwwTXlpOElrMkdpRmZQ?=
 =?utf-8?B?OVRBamliR1lPSnZQQ29MdTZLNTlBN3NELzVRb21NcFNTR0VyNDhwUFFpSE16?=
 =?utf-8?B?VHJjMnNoV001T1BrVUc5b1VGaXl3VEh6dFdsZHVVUTlJOVBBZnN1L3RDMVR5?=
 =?utf-8?B?OUtMVzZndzY0R0VTSyt1WjZwZmcvYTBLdFIxeVpDL0RLbDdxSmZ3OWNnQXZl?=
 =?utf-8?B?UE4zYUxLYVdDLzJydzZ4RkprQkZTZDRobGlkL2VXY01xWHAxcUxRaWcra0ww?=
 =?utf-8?B?YW82Y1ZCNVcxenNBMFFiaE5SUUtscnladUY2a2NCRHRiazg3OHlVcDlxY0VO?=
 =?utf-8?B?c2d4aE9wbHVkRUQ0RlNva2xTOTZwSzNndjNGS0E3cnJCMzd5cHRyVzBUL1NT?=
 =?utf-8?B?bkxoK0ZxWjVIY0NOVFlzYnVmYVlwQnp2dkZoSEtvUWU0V3RpWjFjcTh3UlFX?=
 =?utf-8?B?cEh0SkVBK2xzakZ1cHpSTVk1NHRlODhrbXgrMitzUXZSbDBLUjQvRVRjYkxh?=
 =?utf-8?B?d2N6NTQ5a0thWDgxT2l4bHNodzJ2dkFZd2RsRktUNW90RTZrVUIvbmRoS3pz?=
 =?utf-8?B?R0gxUmtURDJSbi95NFpKaDZKSHZSY3lnOHM0Vzh2bmxycGdhcXdONUM2c09K?=
 =?utf-8?B?THNHNkZwV3NOemZ3TGtROXh4alNmNUQzazlqYlhtREpMdXl2Y0hlMVJ2TW8w?=
 =?utf-8?B?K3V1OXdiNm1SU01DNWRrVUd1K2lvd2laaE8wV3N3ejFPcFlFUGJVSmdmWHU5?=
 =?utf-8?B?YXExckozZlVEV2ZETERBTit5QXhVVnZzR0kwRE1xUWdsSXZSRXp4U3BJZHlM?=
 =?utf-8?B?NVFWeU5ZSnNlTDVmekw4TzdFM01LMXpnUmMrbXV6Y3ZwODJnaE9lTks1RzJn?=
 =?utf-8?B?aVV4TVpWOXlDSWtvTWNybkJKMGJiMlBkRDVTcVBiTkhFSGVxbXVvRk5QWGVs?=
 =?utf-8?B?RUFRbG93U0lMb0NWdkhJWUJzZ20yYzRraGpDNlNNcHlSTXllcHVrdStNczZj?=
 =?utf-8?B?SDg2cHZuTmZKMW1sT2RibnJNLzc3ZVAyRkNabFJpVGZVbTVQMVZISFVYeTd5?=
 =?utf-8?B?empSeEd5cWFMaE5pYTBzZmJWY1pJakJhZXFLT3BUV25xYkFuNXRLSXFFN25n?=
 =?utf-8?B?S2c0TkkwcEZ5a3JvTHFxb0NBNzNHc2JXNVVsT01Db1RoTFdXd1RQR1FSdXEr?=
 =?utf-8?B?N29DN29CMTNVLzduTlRhR1doZUlzeFFpTUtmVm5jL2FMVk5PTitVeUdXcVBm?=
 =?utf-8?B?d1YwNUk3bFRGV2ZvTlhrSnR0RzNpOHhGTEUvUmxqTnI5bzA1eERuVU9iQml0?=
 =?utf-8?B?Tm0rRmVWRFpMc1lyVWRaK2U1RVhUQ1gyOUpubit3T0xDeisxUEFHa0RERU1V?=
 =?utf-8?B?cVFhbFhhTG55NWpoN3A3ZDhhT1UrTVJmNUdEbjNMd2ZOTXVad2xyUlgvLzB2?=
 =?utf-8?B?QnhkNVRxclJqcVp5aHVKaUowRDB5Qlk4d3JsME1UTTBJdDF0MjJhVHlzZXIz?=
 =?utf-8?B?YzE2a1V1NEEzclFLcldyR1N3S3AyT1liN2c4T3l5VzBVVURiM1BmT0l3OHVz?=
 =?utf-8?B?SUM4amhpaVJ4d1JjcjdpMHFGVXhlMU1iOWpkRkZrMzJaamRId1Zoc1VNM1RG?=
 =?utf-8?B?SmxocUp5dEw0ZExQQ3pUbittTzNvMCtXajVqQU1OM3RqTXJEbDFxTEdhWldK?=
 =?utf-8?B?UVkycHFWOVRES2p3M0MwRW5IYXl0ZnlETm1Nc3hhSDhwVHVIazJVZkRhNGZs?=
 =?utf-8?B?Mmd0ZEE2S1krWmpaZVpjd09RU2kvZWhwOUwycUtDcFlzWm5rZkxoNnlvVVJC?=
 =?utf-8?B?b203clgrOHV5L01hZFdTa0dMcVpEQURiU2s3MzVCMkFXQ04raDJHc2F4bzBD?=
 =?utf-8?B?OHlhTEZ1ZjQyNzdFVmVsbXJKOVB4Z2hIem16RHRyVVNKZTlYOU1Fc2NtaG9D?=
 =?utf-8?B?UTFLM2pTb2FrVmsraWVZaWc4ZldrU1dzRWhFY2tweFA0bTRwVUNjNDVac003?=
 =?utf-8?B?RlpTc01QSGljY0gzMllIY0NpYUEyaDhKRVByRUF1NFlOdDJZM2pySVhLQzFo?=
 =?utf-8?B?U2lQSjdVTmFMOHdaanNkeXVYaWN4WlRYcHlnTzNlTHRSVUtqWHEvd3JUaGRp?=
 =?utf-8?B?VGJLekw5QmhPSHZQZitPZ3Y0WDdQZ2xKRFhrS01ORHV1Ui9BQlpYT3hCRXc5?=
 =?utf-8?B?NTd3aTRVQytLSUlQRUY2MHBVbTVyUXFUaFV0c1VGZTFGaDR3RUMyWEYwUndv?=
 =?utf-8?B?dEx5RndQUFgvR2ZyNEJvZHcyS1ZXOHUrWGtGSUNwM2VYdjZCa1NVQVJpemRp?=
 =?utf-8?Q?eLv04k1/jFNbh7Ts=3D?=
X-Exchange-RoutingPolicyChecked: Nc+Rv9Mv4ZDJEQyg2221tvtYeMqOSYWnPb0OiTarqMNw0xrlJG5G2IU9rvFCj7K63AIHhyjQ/ZBqABK4H+qlsyiaR+c3lvEHdHzZ+IDeBWTozj83WoHdwgAPJCojG7m1LMVwJdTZyd4jTvyPhgXCOB0ze4B3fzYQzX2F6Aiig+seGdkVrUSgbmiEoFTux9zibmCpEEsNrnqzOEU8ht3p8lssQK2v2lT9XrwdBvcVrzFy51UNqslLdujN7SC0KSBwIz1DNxHHTkW3l1z8V/ggHegyTDnfZ1jhg3mlLJJKNHAe/oPY57eaJG+nTf4wg0O80SFh9OnwA1bHFLiP/agZqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d83398b9-1305-4682-66c8-08df15c36c0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 20:28:38.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqCrrr3a4MZxO+EaxEvlAQ4I7JYZ368xyroIvyfa+5c4zBQEVz9XB3nTyJjZ94JNQm5SZqmccxprj97rxSnftV1YZnrL7ZND7VKOxZgWeSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
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

On Tue, Sep 15, 2026 at 04:10:42PM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, Sep 15, 2026 at 03:59:22PM -0700, Umesh Nerlige Ramappa wrote:
>>On Tue, Sep 15, 2026 at 11:49:43AM +0200, Michal Wajdeczko wrote:
>>>
>>>
>>>On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
>>>>Instead of always returning -EPROTO for most errors, use different error
>>>>codes based on the error type. -EPROTO is retained for the cases that
>>>>are genuine protocol violations by the GuC.  The remaining cases now
>>>>report what actually went wrong.
>>>>
>>>>receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
>>>>two error codes that dequeue_one_g2h() could return on a fatal error.
>>>>Invert the check to simplify reset handling.
>>>>
>>>>v2: (Michal)
>>>>- Sync order of errors in g2h_read and __guc_ct_send_locked
>>>>- For CT errors use EPIPE and for HXG errors use EPROTO
>>>>- Convert the non-fatal EPIPE to EPERM in the helper
>>>
>>>nit: move change log under --- line
>>>
>>>>
>>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>Assisted-by: Claude:claude-opus-5
>>>>---
>>>>drivers/gpu/drm/xe/xe_guc_ct.c | 51 +++++++++++++++++++++++++++-------
>>>>1 file changed, 41 insertions(+), 10 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>index 5c4733da385c..c5a417fef913 100644
>>>>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>@@ -947,6 +947,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>>	u32 cmd[H2G_CT_HEADERS];
>>>>	u32 tail = h2g->info.tail;
>>>>	u32 full_len;
>>>>+	int err;
>>>>	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>>>>							 tail * sizeof(u32));
>>>>
>>>>@@ -961,12 +962,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>>
>>>>		desc_status = desc_read(xe, h2g, status);
>>>>		if (desc_status) {
>>>>+			err = -EPIPE;
>>>>			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>>>>			goto corrupted;
>>>
>>>I'm wondering if maybe we should introduce helper:
>>>
>>>	int ct_corrupted(ct, const char *msg, ...)
>>>	{
>>>		va_start()
>>>		xe_gt_err(gt, "GUC: CT: %pV", vaf);
>>>		va_end()
>>>		CT_DEAD()
>>>		ct_stop() 	// ?
>>>		kick_reset()	// ?
>>>		return -EPIPE;
>>>	}
>>>
>>>and just call it instead using goto?
>>>
>>>this helper can be later reused by g2h_read
>>
>>kick_reset is not called in the send path for -EPIPE (like you 
>>mention below), so not a whole lot of reuse we can do with the 
>>helper.
>
>Maybe I can use the helper without the ct_stop and kick_reset...

Hmm, I posted these changes in v4. I am not happy with the changes and 
am thinking of backing it off. CT_DEAD implementation is not the same 
for debug/non-debug code and I am not seeing much ROI on the change.  
Maybe we can think of it as a follow up rather than this series. Let me 
know what you think.

Thanks,
Umesh

>
>Umesh
>>
>>>
>>>>		}
>>>>
>>>>		if (tail > h2g->info.size) {
>>>>			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>>+			err = -EPIPE;
>>>>			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>>>>				  tail, h2g->info.size);
>>>>			goto corrupted;
>>>>@@ -974,6 +977,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>>
>>>>		if (desc_head >= h2g->info.size) {
>>>>			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>>+			err = -EPIPE;
>>>>			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>>>>				  desc_head, h2g->info.size);
>>>>			goto corrupted;
>>>>@@ -1044,7 +1048,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>>
>>>>corrupted:
>>>>	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
>>>>-	return -EPIPE;
>>>>+	return err;
>>>>}
>>>>
>>>>static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>>>@@ -1067,11 +1071,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>>>		goto out;
>>>>	}
>>>>
>>>>-	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>>>-		ret = -EPIPE;
>>>>-		goto out;
>>>>-	}
>>>>-
>>>>	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
>>>>		ret = -ENODEV;
>>>>		goto out;
>>>>@@ -1082,6 +1081,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>>>		goto out;
>>>>	}
>>>>
>>>>+	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>>>+		ret = -EPIPE;
>>>>+		goto out;
>>>
>>>to be fixed with -EPERM/-EUCLEAN, or ...
>>
>>I changed this to EPERM
>>
>>>
>>>... maybe this should be just xe_gt_assert()?
>>>
>>>IMO we should immediately STOP the CTB once we detect that CTB channel
>>>is broken so we should look for STOPPED status rather than info.broken
>>
>>Maybe, but we don't do that right now. Probably a future improvement.
>>
>>>
>>>>+	}
>>>>+
>>>>	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>>>
>>>>	if (g2h_fence) {
>>>>@@ -1809,10 +1813,12 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>	s32 avail;
>>>>	u32 action;
>>>>	u32 *hxg;
>>>>+	int err;
>>>>
>>>>	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>>>	lockdep_assert_held(&ct->fast_lock);
>>>>
>>>>+	/* Keep in sync with g2h_err_is_fatal() */
>>>>	if (xe_device_wedged(xe))
>>>>		return -ENOTRECOVERABLE;
>>>>
>>>>@@ -1823,7 +1829,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>		return -ECANCELED;
>>>>
>>>>	if (g2h->info.broken)
>>>>-		return -EPIPE;
>>>>+		return -EPERM;
>>>>
>>>>	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>>>
>>>>@@ -1840,6 +1846,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>		}
>>>>
>>>>		if (desc_status) {
>>>>+			err = -EPIPE;
>>>>			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>>>>			goto corrupted;
>>>>		}
>>>>@@ -1871,6 +1878,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>
>>>>		if (g2h->info.head > g2h->info.size) {
>>>>			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>>+			err = -EPIPE;
>>>>			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>>>>				  g2h->info.head, g2h->info.size);
>>>>			goto corrupted;
>>>>@@ -1878,6 +1886,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>
>>>>		if (desc_tail >= g2h->info.size) {
>>>>			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>>+			err = -EPIPE;
>>>>			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>>>>				  desc_tail, g2h->info.size);
>>>>			goto corrupted;
>>>>@@ -1898,6 +1907,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>			   sizeof(u32));
>>>>	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>>>	if (len > avail) {
>>>>+		err = -EPIPE;
>>>>		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>>>			  avail, len);
>>>>		goto corrupted;
>>>>@@ -1950,7 +1960,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>
>>>>corrupted:
>>>>	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
>>>>-	return -EPROTO;
>>>>+	return err;
>>>>}
>>>>
>>>>static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>>@@ -2042,6 +2052,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>>>>	return 1;
>>>>}
>>>>
>>>>+/*
>>>>+ * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
>>>>+ * is simply not available right now, which is expected and handled gracefully,
>>>>+ * or the channel state or the message itself is inconsistent, in which case the
>>>>+ * only way forward is to declare the CT dead and reset the GuC. Since the
>>>>+ * former is a short and well known list, check against that and treat anything
>>>>+ * else as fatal, so that new error codes don't silently escape the escalation.
>>>>+ */
>>>>+static bool g2h_err_is_fatal(int err)
>>>>+{
>>>>+	switch (err) {
>>>>+	case -ENOTRECOVERABLE:	/* device wedged */
>>>>+	case -ENODEV:		/* CT disabled */
>>>>+	case -ECANCELED:	/* CT stopped */
>>>>+	case -EPERM:		/* CT already declared broken */
>>>>+		return false;
>>>>+	default:
>>>>+		return true;
>>>
>>>shouldn't this be other way around?
>>>IMO original fatal errors are:
>>>
>>>	-EPIPE
>>>	-EPROTO
>>>	-EDEADLK
>>>
>>>as once we hit them, we should trigger a RESET (which will then
>>>result in cancelling all pending H2G with -ECANCELED, turning off
>>>the CTB), so any new CTB request will get either
>>>
>>>	-EPERM - already stopped
>>>	-ENOTRECOVERABLE - if recovery fails
>>>
>>>>+	}
>>
>>Correct, the default case is fatal above and returns true, so it 
>>matches what you are saying.
>>
>>>>+}
>>>
>>>maybe we should document in a separate DOC section all error codes used by the CTB?
>>>
>>>	-ENODEV = CTB disabled
>>>	-ENOTRECOVERABLE = device wedged
>>>	-EDEADLK = CTB deadlocked ==> RESET/STOP
>>>	-EPIPE = detected problems with CTB descriptor/channel ==> RESET/STOP
>>>	-EPROTO = detected problem with CTB message ==> RESET/STOP
>>>	-ECANCELED = pending H2G cancelled due to a RESET
>>>	-EPERM = CTB already stopped
>>>	-EUCLEAN = CTB already broken
>>>		btw, should we ever reach ctb.broken?
>>>		shouldn't we move the CTB to STOPPED state before?
>>>	...
>>
>>I will put it in comments in the beginning of this file.
>>
>>>
>>>>+
>>>>static void receive_g2h(struct xe_guc_ct *ct)
>>>>{
>>>>	bool ongoing;
>>>>@@ -2079,8 +2110,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>>>		ret = dequeue_one_g2h(ct);
>>>>		mutex_unlock(&ct->lock);
>>>>
>>>>-		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>>>>-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>>>>+		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>>>>+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
>>>>			CT_DEAD(ct, NULL, G2H_RECV);
>>>>			kick_reset(ct);
>>>
>>>hmm, it looks that during send() we kick_reset() only for EDEADLK
>>>error, even if we detect broken channel (EPIPE), right?
>>
>>Right. That's the current behavior
>>
>>Thanks,
>>Umesh
>>>
>>>
>>>>		}
>>>
