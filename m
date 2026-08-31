Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BC2C61DE8
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 05:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0FA10E5E7;
	Mon, 31 Aug 2026 05:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdG9cOlA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0B710E5E7
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 05:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788154212; x=1819690212;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5P7e2bXqkYJmHxBkdTUtex123oWfp1uf6ij96WYY3e0=;
 b=WdG9cOlA4s2a6OInXDC5XHBSDQ4dWHzoc+EAo+ca/TkrqLl5o6fqcPDP
 hNf/Vk61dOYUycOa+ZSg6B2EkWlpWVCWp1fB6RmASrocBkXLEP4rfWBBp
 obzGfiEnAO2c/eqRHnx3nr8Bd7cNSmUie2LkUhN2Y+9k4MmtWhyvlFOZx
 ejkVds+mg4D9gpGXzycEryga/zvHJF6313uRjPIGz4kpo19TkJ2688PSR
 A6AbVq9Oo1+nOYi0BjTVujYdDRkb6UBkaXN59UnZVXHKfTRJaByHguG34
 NjiMHlyV27rMNgvFUk4hJuadzq4uqqj0r9DJdzzkP0BvbRDHtjcOZmavb g==;
X-CSE-ConnectionGUID: 3f8nmvnURZejo4u4xAVvAg==
X-CSE-MsgGUID: Zyc8SyxnSZWKWaV4o6xBZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99902399"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99902399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:30:12 -0700
X-CSE-ConnectionGUID: XhfGL5BiT/OP+BBjCCelBA==
X-CSE-MsgGUID: ok8Ar1HnQyy5MG0yEddSZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="266877343"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:30:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:30:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 22:30:11 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:30:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6wnimSKW/aiukc2dsobrFInf0Z+PbesyDc2WmFR3k2E9so/p+OHfOMwbvZ4NqlDTwRT9YLFPAVF9Qrff+j1suiS6dOwIwLU7m9bv0645ZGb7CcRxCWBan+2YuyoUnqF9Ir+p4pyx66vlRRz64zlMhicBQlaE05P7ZEYORDUnqlvUqrPHaxFgg4Ofb1Q0/1YG4ladnpItCyGh12hPYOK+EdUD+4Vb9rFQirQk8Fznv7HVEsSAD8/tifgQY5dJi6b0HrQcbweVn7ppdNUpnIqyJgecOGYg9qQG2AF/Ts4/WaKgPrBoFqb3uNsxwI084EJDUP4gK0gLx4RrLNkjWvmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gsZFCPLeVKlJA9Am2LVvqQlEwuusqbzrCJPHz8Uwt4=;
 b=UesjuUP+BI2qjCIbkwKNUxxPmtAipMQMer0X+EtqmTmK8DTYc3n6gduQgRKPeL5e+OTzHrasMgRi++6OrfoJHRpwF5jgsWBRB+/51KzmsqERjGk/9pIJ0AU/frpMfVown1oaNTl9mebAmnal75HXqJa6ytum6Cq1JjqGuD+4GPzeRhijEvJwzK+fNaKKssrM6SGeuON9nZ1NHr4S/U5i9hYXaLrvQl6rOcUOm42Z5JoE19zj66kuLDIKAPEq76RtIBzWJ1WJ+WMDHQ0BAwanHTkUksZYKex3Bf9F5dbaysiGjZB/yv8pUPE+hCNnGgNIhM8lXVdUnPXazAnQIT8IJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPFA424F92C2.namprd11.prod.outlook.com (2603:10b6:f:fc02::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:30:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:30:08 +0000
Message-ID: <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
Date: Mon, 31 Aug 2026 10:59:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260729171546.3368457-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0325.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPFA424F92C2:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9f0a23-520e-4924-85fc-08df0720eb90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|10067099003|4143699003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: PPjSiKkx00BOJq1tWTmrxZO62JJCyGQM7lfB9aq6FVCOcVIumCSknpU+dVbtZeIICR+G8E9o3+jphplp0bDZpudYbpZD4A9yJn26u7Cbku+jEwFTUzpmheTmrDkr1IQsnoyurCvcg22m24xWG51XDMkjqE/68MUjfNr56bpDA+aQ4IReqEKsTgnrrc6P1XFLY3kdq8Y9JOVMpXjUsESHNVp8xKJXekZPlAKlF5aQm9lzL9TCJeQYcTOuj5/d92lcABUqqxIB4oaMuEoqKVftUoCZpZySRmUltwwmqq+cugJYl+9mx1Q1ki5wwE3n+GMfkhqJcuozlOzF+EnRNFdEwWwP6QWHlEy3l6GAlCaSx9+0+e4UPGauwWrjyBPR+mjnuLnumBJYmqk7OmaU0vDb9mjb6f9fQCTxdF6yuy51a2rAcWRaJggEvCb6Sc0/jwlxQBaNeq4qaMCKQ666tSddxqIB9WW0RQKVdCr1JkEY0bRoIpc0nHPxdGs/UGxN6AFNH1UxLlK1WRUeJ0ZdU8cODIVPLn8fMYBsfcB9cepe8RzHrOUp34csl6/lSHqteoNunGaBgavXpUSo8T/6k9Efrs348KRlFVg/WXvNcVs7uYSGd5mYNJVGY5vv0wvCxsjfCeU/SWqA3ghASp/p+VoBcgMvk6Y9uzT+v9wWOsQ/918=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmkrWjAyQno2cGlmQkhEVXBxMUREaytHNmpBOG5uODF2NmZkVjd0QXo4cnIr?=
 =?utf-8?B?WmFIMEtEK3lLZnNpK1Q0OGp4NG4vQldPckN3SmZSaGNsQlZreC8yRHBaa1NH?=
 =?utf-8?B?VVJEWlNaZnZtZVp1RkE1TmlKTUtGQUdqRU9VWjE0YXYzSzRCak1Ld3llUkZx?=
 =?utf-8?B?U0ZyOEtWV0dtK3F0K0NSMjZ0bG94dkJzUEN2WFgzd084RWU3My8zQk95SEY4?=
 =?utf-8?B?eDZVYTVEa1NmcGpkQ2tZT0NRS2lyd055NzR2S2kwNjdDa3FOM3gvNk56UGY5?=
 =?utf-8?B?VkV6dUlhbnJMRHRrbmNKOXpQY0NLUDNiYUsyWnJXYXhyWHNjMVhlZjk0dDZL?=
 =?utf-8?B?Tlg4eG1QcFd1bFFQM1ZQbG1FMURSSGw5bCtiL0RVTVZDRkkvd3VjaFZCMmRv?=
 =?utf-8?B?S2ZXTlZoRWdRR3Z6cFhDa1ZHUTVaUlV6cmYvVlIvNWgyaVYycXQzOU11RjZN?=
 =?utf-8?B?bUlGNnhhVysvQ1ZFb25DWDUvV2FmZzR3YlpJZDVvNTJicFlDRXZqTGM3bU1t?=
 =?utf-8?B?bTgxVzE1UDEwVGhWTmtGUHFPblZhajMvSkZnMXhQOXFqWm42SnZKZ3dtVFFW?=
 =?utf-8?B?NUFkMzFZNTNnQ0JBbzl5SnJmV241NkdYUmJJOUxsU2llU0ZSdDZra2xiMHI3?=
 =?utf-8?B?MTQ0aTZicjN3M0Nvd3BqWU5UbVYrNUFaWnB1MGZzUzlNY2FxMkl0QWhkQTR0?=
 =?utf-8?B?Rlh1SGg4aEhEVWdFRW9kK0xnNWg1M01wUHNrajRRNTZOVmdGWXNNZkpuc21L?=
 =?utf-8?B?MURSbzdnUCtXRDBaMEovWUZSa2RXcFR3cVljKy9PbnVkSEVxaFIybDhpRm01?=
 =?utf-8?B?eDFpempuczVJQTNyeHBHTkJWV1h0dkVibnpNam1FejFSZVNIei9ibmFYL0Va?=
 =?utf-8?B?RmU3aG1jQWRFTjNmOWtxNjgybVFjRytLWHFtUURpejZxK2laWlcxSStzRTh0?=
 =?utf-8?B?SzBacFBkOUh6NUFEUXNZcnhTUUsyNE5YaW1JbjJzd1ZxOVE5aDRTUXhQRE5M?=
 =?utf-8?B?Mnh3QTNwUGtObDhLVGVHMC90eVJJRmVFRzVmL2ZkVzcrblg0UnpwR3R2UVlj?=
 =?utf-8?B?SWdYY3JqYmFCN1dYVU9CbGVkN0NGQjM2SUJXZ3hHS3Z2QWlaSVNLZnhEbm9B?=
 =?utf-8?B?T1NpV0JBNGpCT3k3UEtjbm9Zb2RZR0l4YUpEcktKSTlHcE84RGpBcFdqRmp6?=
 =?utf-8?B?ZkxXcVQvc2w0MWlZcGZ5NndTSWYveDJZSlRUc0NNTFZ5TkJRR0txMHVDbU5Y?=
 =?utf-8?B?QTBVVWJ2Wk5Eb05aV2xhNFh1dHFSMGNET09MbmYrNmROQXpZZ1BPd0Jkalo1?=
 =?utf-8?B?ZU1XNE82Zll5Snh1Mk1PdUtVUFhZc0dRWXBGNGJiVU5Qdkw2cnlhRlJRTUpr?=
 =?utf-8?B?RTZ2cGlYVnRsd2R5eWtvL2RzVlZhcXNjRVhXS29RdHBqelpLejRxdW16eC9l?=
 =?utf-8?B?aWhlTW4rTWRueVdkb2RGcjQxbmFqMGk1TzdqbTFwOEJ6VldPRW5mQy9sWkJH?=
 =?utf-8?B?WFF0ZS84VHU1cU90YUVBY2ZFR0kwTlJNZnlybldmcjN5U0cxemZER051WGtH?=
 =?utf-8?B?bDJ1dWMzbWRkRkZmUDBSUzM5dnBMY1o3MDRmdjBYT2hLWWxVUkpjS3lNc0V4?=
 =?utf-8?B?elM0ZHBvblQ1bXZPelY4eWxDMWxOcGRmMlcwajhzMm1KaXJHZUdLWGdobEQy?=
 =?utf-8?B?cklONTFJTmFITkZLSm93a2VyTHgvalgyVTU3ZGdCWjZkTHNwV3NkZENkVFFY?=
 =?utf-8?B?SEg2ZTR3MFdWaFlBTVNjWWR1WVJiOS9rb2VFOGw3NzUzbllrUWhVanJ0bUc5?=
 =?utf-8?B?NTFPQzIrd0ZTUk5WNWwxVjdOOG9xU25ibDkwWTJPdTBFbjRqckE0UUMvRUwr?=
 =?utf-8?B?RStqWVA0QnMvRmhuUzhCZFBkajdiY1RKVHJWUE9EaHE3bUVTV1ZNM1YrN1Zk?=
 =?utf-8?B?TFhIS3VuRlNGaE94TjRpdmcrZWo5WVdiUmNkZnFuZDdTZ1hxemtnQk1xTm8r?=
 =?utf-8?B?eXozVHRKWTNDV1lRVGZrbmVwNG1HNTR0VmRCa3NHVFlCVURSVkV2Z0VUbURF?=
 =?utf-8?B?bFV1cTZCV1hlTzVoKzlnWUh0dkJtSUgxcHg3Wi9QazFVNEpFU09SMzRVMDcx?=
 =?utf-8?B?ZFo1Yzhpc3o1Z1pLQVRXdTBnU2dRNHUralNNejEzN1VXMVNYR2xYc05IdDdK?=
 =?utf-8?B?SUtRNmtZQWVyQndTUU83R01tSG0zWjFZdTZzSUdEcXJ3aGpjNlVjeTkrRjJ1?=
 =?utf-8?B?QUVIeEkyd0Z5Yml3a0JSV1VkZWNBbEFWc1pXWk9QaHArSDVpeHVRMk1TbXho?=
 =?utf-8?B?TXFlSWtJdVdQMFZqY2o4NlZsWDNrWlZINXU3L1p3NWVVaFFiU05odz09?=
X-Exchange-RoutingPolicyChecked: RqCWwlw4C2hBy4xiT0Hx1QaQ7EWmROburRayOtVC9j755b9uudGGGM66haZh+6tePucDYM0Zqde/sy+6Tx0lxBBgKCgO/FlvubxEIfEMm0Xdlq4IM/mjNS8tocTkbOyVgy2ai1AT/kiH9M6Q8PFnikJnZW1cbu0QzTjkSh8EZ8az5p1ECT8EcswBCKRfxoqu0j9LwqiXmpoz9mKOSr1hsXElcMchdiI4t+dXgRTq5LkfrZyW26jcrZOwXrx5XTRXF7nYbP+v0pAtddZREI2m0PbpKP8EtjboV5N2dkttIzv+rlyAjl49ihgOxb0DsScmO3MVq5QIJ/45+2IuazHpow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9f0a23-520e-4924-85fc-08df0720eb90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:30:08.6183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YGNqVmkpCSPHz9BkkFRK2K/GkNWbJBswhDrZy4Ile2/4/15cF1L7POILWUJ5ZK9qJjEVWKeMzVHSGtyJ1gg/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA424F92C2
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


On 29-07-2026 22:45, Karthik Poosa wrote:
> Mailbox power limit operations can occasionally take longer than the
> current 1 ms timeout, causing sporadic failures.
> Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
> PL_MBX_TIMEOUT_MS to better reflect its usage.

Why is the timeout applicable only for power and not the other attribute 
reads?

Thanks
Riana

> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..459ad953dfc8 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -102,9 +102,9 @@ enum sensor_attr_power {
>   #define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
>   
>   /*
> - * Timeout for power limit write mailbox command.
> + * Timeout for power limit mailbox commands.
>    */
> -#define PL_WRITE_MBX_TIMEOUT_MS	(1)
> +#define PL_MBX_TIMEOUT_MS	(10)
>   
>   /* Index of memory controller in READ_THERMAL_DATA output */
>   #define TEMP_INDEX_MCTRL	2
> @@ -199,11 +199,12 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>   	u32 val0 = 0, val1 = 0;
>   	int ret = 0;
>   
> -	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> -						  (channel == CHANNEL_CARD) ?
> -						  READ_PSYSGPU_POWER_LIMIT :
> -						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> +	ret = xe_pcode_read_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> +							  (channel == CHANNEL_CARD) ?
> +							  READ_PSYSGPU_POWER_LIMIT :
> +							  READ_PACKAGE_POWER_LIMIT,
> +							  prepare_power_limit_param2(hwmon)),
> +							  &val0, &val1, PL_MBX_TIMEOUT_MS);
>   
>   	if (ret) {
>   		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> @@ -232,11 +233,12 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>   	u32 val0 = 0, val1 = 0;
>   	int ret = 0;
>   
> -	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> -						  (channel == CHANNEL_CARD) ?
> -						  READ_PSYSGPU_POWER_LIMIT :
> -						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> +	ret = xe_pcode_read_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> +							  (channel == CHANNEL_CARD) ?
> +							  READ_PSYSGPU_POWER_LIMIT :
> +							  READ_PACKAGE_POWER_LIMIT,
> +							  prepare_power_limit_param2(hwmon)),
> +							  &val0, &val1, PL_MBX_TIMEOUT_MS);
>   	if (ret)
>   		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>   			channel, val0, val1, ret);
> @@ -252,7 +254,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>   							     (channel == CHANNEL_CARD) ?
>   							     WRITE_PSYSGPU_POWER_LIMIT :
>   							     WRITE_PACKAGE_POWER_LIMIT, 0),
> -							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
> +							     val0, val1, PL_MBX_TIMEOUT_MS);
>   	if (ret)
>   		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>   			channel, val0, val1, ret);
