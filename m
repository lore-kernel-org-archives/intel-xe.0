Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9989C4450F
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB3710E73B;
	Fri, 17 Jul 2026 04:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+oV/Qk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B94610E73B
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261463; x=1815797463;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=N3Gmp/K3MQ7gNyUKDDnBbSITcCu6uNNElila+w/+EtM=;
 b=V+oV/Qk5fdDeBvW93oNcmFyPz8t4TeN2BQUNe6QbAZfkyGS7ezkZgUwi
 UHyWZqBG6X7u5FwjDE08sHCR7vvYxt0WhwdzX+gHv9mvo8FklZ0TxS+cX
 7ulUJbpPdpzSiHnJuWeqWnzieziJTz9JlbCjg6Qb5iUl5OrZqcMQ+Sz2f
 OxCUdfJA81EnYM9t+ppDv94l3hhu17jkDv4Ig1XUFAjFtk1im0VPiDNAN
 ns75/tTAqZEfB8o0jA4BZhJx3aiyK4CTguXi6PrYYMHtgT0cyZPqR0eHR
 25I2HmrU0KglJN0nrpoL0eL3J+cAxc24MPsN55JCNre14T2NjkOSPeqkd g==;
X-CSE-ConnectionGUID: MdOxSR1HS96iA0ldzsJRVQ==
X-CSE-MsgGUID: IujG3lw5Q5en1byls2YpaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84809784"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208,217";a="84809784"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:11:02 -0700
X-CSE-ConnectionGUID: JISazArcRL6FWpNd0NzjpA==
X-CSE-MsgGUID: uuG1xISrT+SdMoHNxBNovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
 d="scan'208,217";a="254031505"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:11:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 21:11:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 21:11:01 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 21:10:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1lXij3m0wgfDhNCUhZUSRlU0HAThF5ka1SpSBGxaxQ0mg/uHp87/JZcB/ZrzOOXMvSWteJHD8oQfx9SFeKXdEF4ROrQYOhdHTzE6UgAqXMlN/WBsYHNcHN72yPPgx2EEZQnkJcBUoSV0GcwL2uUX2w8Ndsbczd2ufmPbxVheJOWWsnemK8TCZJXJgNev0QEjVj+QPZGtqRSL0iPtQqHeHTehwWLFotDBU/D5NDWrCNhbsUIWs5foieDxIDW4+F80NxItaWBbASs5bRGimnKjkvbmY8eallKgTqu0j3pYaHa+5SAnqPLM+/AixJUjlSqguGacxteo6nYZyurEco8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlT+AkVOeuzFHyDZ4dilqNgEeCQ1q0krNzZvIAbJT38=;
 b=jyPxPnS+tvxspXwrBK/R+zr0ScQQmsoxRfGpR/tljQcbM9b3NjpGe9vN2tDrqcZAqszJ5SErrAVrFo3t/GA+oZpnZA5KkPeYASwpOWdbamR34KsrrOmT1TwECW+50s8UA/mXrqVI7Jh2u70ruZgadm1FK9fLYZR9haUlDt6oYqoXp0MBaSS2wucXP9KxCd1VUDTHDPgx8O7lWc4+4ZJfiJkRlAcweAqz/TKP96ekQ6NcnZfAKkyO4kOchxlxBHh6m+VdrbsLep74VSwR/8lzsDO84ZwYTAoqlQI1giYk7mmqc8X/nWMNtl6xI/VAeegw+SPedRrUUKFXSTaWoO8u/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS0PR11MB8762.namprd11.prod.outlook.com (2603:10b6:8:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 04:10:52 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 04:10:51 +0000
Content-Type: multipart/alternative;
 boundary="------------tDVEIg8px1Jf5fQ1y1EnOlYg"
Message-ID: <a1dda7b5-026c-4c7b-a646-09d0a0373592@intel.com>
Date: Fri, 17 Jul 2026 09:40:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pcode: add default timeout macro and pass read
 timeout
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260611074355.3562414-1-karthik.poosa@intel.com>
 <c719ed36144b24421141cfc12022e7f585bac88e@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <c719ed36144b24421141cfc12022e7f585bac88e@intel.com>
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS0PR11MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 6204d065-3058-4d5e-d9bb-08dee3b963a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|13003099007|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: D5L//cN+lZb9tEJTRGm+hoKeAxoeW3M2UBfe0A2Ncqeql/J6bhSnTrbIoKlVJBr4Jebj94BvaKjtcNz0Ssxids9332HaviFDlV42ex4rDv3w+NoGFp40OYjM3igmqi5qy34HWgnSXc7XNOrAFtanWjPI13fHQV15zx4+J5IAQKnlk/ovvNIr3EWWsJWwDC480QChFKZphf36SNOHPUjmMvqnxz+M9Ryxyw9VZUvqGE8OY1o69M3Q9efT5hhFqlceaOLnz5tOT+TFRrJNTopq//4oAwO0iTxx8PdYbEN4aTn9P6v73mu9/LJ7luMTv+YVIlAEM7YhKdneaAlEdEeOhsgtesFwJjJR5/kCbHvBQsHNxD3P8IWWvCJ4CPMYl7Ef1EKtyoYiZU504ay965EjRBZjrS7WRBd00+QK9dput07vLzEcxGZwWtsBCM7/8v9qaRCILXmHTzFFGpYtcS3Ii/QkC2GKiPTCpDzb1Yeap8fqeSdAkN6qeTE2Y8PCskBNjN31kqH4T0xFWQZssAOI1tksXgXr/pp0h8AmwBpMAWMNrI8+V+c3nvdNIVpCGDUFpa50LupA8veByMNYnhvvXnBrsRQscOjm6pN2b0EtL9JPDPnKXYShnvtHdUx/QI4F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(13003099007)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(8096899003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXdDc0pITXo0S3R3c09ROGlhWkFlRkx0UU9OL2k1R3UyTDM5Wm5LT29YMHp2?=
 =?utf-8?B?ZkcyWUFRcXBLd2NvYVRFR2FJNEk4R1NtWmhmODZHKzFhcVh1Sk41cVZEWDNx?=
 =?utf-8?B?VW9ieG1MVlh4cGVsZFlHWS8yRGpxUWFKQW1CbGNrTitDbW1MM1JndlgvNzhQ?=
 =?utf-8?B?dUtUS1A1UzA0VjFpQmNnYlJ5V2txWWpVUTc3MTZCcEozZzZZNS93b3dBVkFk?=
 =?utf-8?B?eDhzM1hRMU55TWVqakJST3hBOFZYZEhKRDl1S3B6cHNNSnNXb2RybXJWR2Yv?=
 =?utf-8?B?aklmVFl3aERLVkM4VGZ4NHZjRFRLZkgyRnJ1RmpmdlhQNjlLZnJqTWlMUkVQ?=
 =?utf-8?B?RjBGMmhodml2SWpGeVhZSDlHWlBjOE80Zks2RnNrUVA4VithQ29HQ0FLM0k3?=
 =?utf-8?B?cXlvSWNaQS9DYk5lVmtQbUhHaXc0MHdZYytlTlA1ZTBodmozNW1rN3lieDQv?=
 =?utf-8?B?clA5eDVZM3dFVnN2SVREWTdmN1VIV3NpU2oydjhET1FTcVZmK0w1MW5leVl1?=
 =?utf-8?B?TXRSRVBJbVZ5NXpuNFY3TWp2SlplMk5TNnl4TWtZRFhVS2ZCdm1ZMlZtY1FZ?=
 =?utf-8?B?MmRvQ0ZkbjZLd3QzV2ZIT2VDNTF5MUYyOTFZd0dVK0RrTk54M3dxK1FnSFdm?=
 =?utf-8?B?YmlsaWRTcU16eVMweXJmTWxzYTdaRUdNZUN1UlNVcUlPcE1nOHRoeXVOU2NX?=
 =?utf-8?B?VFBsMG5zYm1UaFhxSm03akgreWtreDVOcmM5a1BWMGdKQzBja1RPTFcwMXBa?=
 =?utf-8?B?UVZVR0RkbWRnUDFDVSszaU9HQlRuUzRRbWxEZ1FDWEF4Qng3clZHeUMvM08v?=
 =?utf-8?B?dTNpMkFkaWROYXZrNk44NC9jVFdlNDEzb1IxRnhEcXFvN2FldVRTaHFoekZD?=
 =?utf-8?B?cHJBb2dnUTJKTS9xMGlFYU9TZFRKcTJxOHEya3JKZS9oYUt0a0hwSFJnRE1N?=
 =?utf-8?B?bEpuRHBnYnNjZ2ZocjhpbkQzYnZXbTNqYmltME1yOVJVL0xiYXhuYkhwYjR4?=
 =?utf-8?B?YlU2TERvdEtPdXNIczNSU0VaVkJKKzI1Qm4zbUoyOGYzQzFGVkhzWE1lUG1m?=
 =?utf-8?B?NlpqR0tsQUtlcHpRckdZRnBnaWJqSHZZTzI4Nm95UUFmS0pEOWE3Wi8yRjJB?=
 =?utf-8?B?SHBmS3huK2lSdHpjVmc0WXhpeGdXakNoTjhmSUVMNU9BcjluK0VRdHhmTUdQ?=
 =?utf-8?B?UDJ2anZaYmlJVkozWGM1WWZobmJvc2RmMkJDdTlLUlhTQ3JOTklVdm1qZDUv?=
 =?utf-8?B?Q2FDM3pGODQzcll1MERqcVBjVjdVNDJrUWxHM3NmYi9RcmZiOThrUjcvZjFD?=
 =?utf-8?B?ZWMva0FwaG1FL3pBUFU3dVEvR1p5QUE3WmIrNWF6ZEIwL0VVdnN3VnAwWWVu?=
 =?utf-8?B?MWhOYXZ0QkFZcHhrSXQ0T1NkNmlxUUo5bEVyZ2JvSmV5Wk5UVkZmalF0KzhE?=
 =?utf-8?B?MUFnWHBsTndTWlVva1QyOER5Z2xPNENSK3YxdHk0SEF4Yko2NXVIUG1Db24v?=
 =?utf-8?B?Z09VMko5N0ZqM1diWXhqQVhQQzNYdnVVdER0Q2V6Z0Y3MjlEck51S2pBeGhp?=
 =?utf-8?B?UWg5N2Z0blp5cmszYTI5QkVSdFBuMVJuY0ZqcHR6QnlObkEvNVJSbWpRTFF2?=
 =?utf-8?B?Y0c0bDhUY21zUCtGVnI2NWpWM0xFb3VpNDgrSmVBTGpOQW1naytTc1Y5S3l3?=
 =?utf-8?B?NDhhRTZYZUp1WkFqMHFPZVBsajZuZTRERHdwYnJ3QjRyb1hua1B0dVlSUGgy?=
 =?utf-8?B?Vy9DWkEwOU8yVTVQQzViZ1dVVmVSY3JtSkY5UWZ6NmlpYnlpZC9LZFhrNkNP?=
 =?utf-8?B?eTBsSVpKODM3dnpxMDdzVllnSHVpaUpjb3FXUzJNOEw0NGFwc2hNWXM2cGJ5?=
 =?utf-8?B?WUJOaWp6RDNvNk9YQklxMlJoN210VHBXcWt4SE5lQ1R2eWtVejFvYWw2dVJU?=
 =?utf-8?B?QnZvdVBSSiszekF4R3VEWXRvR1hjM3BxVktNNEY4cEZWVUpmSjdTSWxHUkdT?=
 =?utf-8?B?VGhCVXZNcUlqaFFma1M2RWRtdm1oY0hFVGV0Y0grc1ZXQU9ndmViVm80YUQ4?=
 =?utf-8?B?ZnN3bVlmM2wxV2N4TW1OeFBZNE5halJNNElOeDh4eWZIUXh6OEdjUG1FbjBx?=
 =?utf-8?B?U2NydlpLMmU5M1BxaVQ1Z3dNeFFZRVc5N1BjMFdwN21MYWxkVjNGTzlGQ3FM?=
 =?utf-8?B?THBmcFVZNnlPdDQ3OE56V3JLenQwa01heUdOUVVXeXlUWDdCbWZXVUU3MExp?=
 =?utf-8?B?MFQ5alQ4UWIyMklQOXhZdXkvU0ZrdE9zYThQSmlzTnZqUWYxTmVPZGh6NStw?=
 =?utf-8?B?K1dnWU1PcGFNQVpEUmFZb291YW5qUGlMY3prb2w2RmEzYVhrMjVQUT09?=
X-Exchange-RoutingPolicyChecked: G2sAs3MMlqYF6z7JmfKRZlIOPQZICGmEiAkI7t8rWi+iqVXHCFrUFRPNuQWdxCCaqjyjM6JOyLb96G5xa/FL/LZRBLNx9rJWk4nASIWqZ+Tv2yOhOTWtMo0smL6n9RtghqerUN3DK5QIU9L4qn4GuTteW7KYYO8XjyQl1+lzWzsDxdiKvit7/GsbJ/JjKEiHwreVx5/Lq5Mw4r0PHQn0+FivYC/BDdHAgfMIAsV+/i3H9u2VKJ7h+IfyieZyc+9iyDwMMwa8ti3pjId7UyL0PNkGDpW3RbD0acVqtRBQoe3j0tUImMqBcBqUgEAHA5nPy+OD+k9ysIpvD0pymS+mqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6204d065-3058-4d5e-d9bb-08dee3b963a9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 04:10:51.7812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Geo30lfiVfRDbFdo5S8CO2t3PPqgpQVNCRPV1YzX8qw6BAieoDMTni7f+sTX6gSfbQHqVTfQ4W9kIKFCBIinGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8762
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

--------------tDVEIg8px1Jf5fQ1y1EnOlYg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 15-06-2026 19:02, Jani Nikula wrote:
> On Thu, 11 Jun 2026, Karthik Poosa<karthik.poosa@intel.com> wrote:
>> Introduce a default 1 ms pcode timeout macro in xe_pcode.h and modify
>> xe_pcode_read() to accept a timeout value from its callers.
>> Apply this shared default timeout macro across existing read/write call
>> sites so that the mailbox timeout is centralized and defined in one place.
>> This shall also allow callers to override the default timeout when needed,
>> enabling explicit use of custom timeouts for specific commands.
> Did you consider adding, say, xe_pcode_read_timeout() for the cases that
> the caller has to use a different timeout?
>
> Seems awfully verbose to have to pass XE_PCODE_DEFAULT_TIMEOUT_MS
> everywhere.
>
> BR,
> Jani.
Agreed. Adding a |xe_pcode_read_timeout()| helper makes sense and avoids 
having to explicitly pass |XE_PCODE_DEFAULT_TIMEOUT_MS| at every call site.
Added this in 
https://patchwork.freedesktop.org/patch/740789/?series=168027&rev=2, as 
this was need as part of fan control series.
>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_display_pcode.c |  2 +-
>>   drivers/gpu/drm/xe/xe_device_sysfs.c          | 16 ++++++------
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 26 +++++++++++--------
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c          |  3 ++-
>>   drivers/gpu/drm/xe/xe_pcode.c                 |  4 +--
>>   drivers/gpu/drm/xe/xe_pcode.h                 |  9 ++++---
>>   drivers/gpu/drm/xe/xe_vram_freq.c             |  4 +--
>>   7 files changed, 36 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display_pcode.c b/drivers/gpu/drm/xe/display/xe_display_pcode.c
>> index f6820ef7e666..aec4cbd25a75 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display_pcode.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display_pcode.c
>> @@ -11,7 +11,7 @@ static int xe_display_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32
>>   	struct xe_device *xe = to_xe_device(drm);
>>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>   
>> -	return xe_pcode_read(tile, mbox, val, val1);
>> +	return xe_pcode_read(tile, mbox, val, val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   }
>>   
>>   static int xe_display_pcode_write_timeout(struct drm_device *drm, u32 mbox, u32 val, int timeout_ms)
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index a73e0e957cb0..02462dca68a2 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -86,18 +86,18 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
>>   	guard(xe_pm_runtime)(xe);
>>   
>>   	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>> -			    &cap, NULL);
>> +			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>>   		return ret;
>>   
>>   	if (REG_FIELD_GET(V1_FAN_PROVISIONED, cap)) {
>>   		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
>> -				    &ver_low, NULL);
>> +				    &ver_low, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   		if (ret)
>>   			return ret;
>>   
>>   		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
>> -				    &ver_high, NULL);
>> +				    &ver_high, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   		if (ret)
>>   			return ret;
>>   
>> @@ -123,18 +123,18 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>>   	guard(xe_pm_runtime)(xe);
>>   
>>   	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>> -			    &cap, NULL);
>> +			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>>   		return ret;
>>   
>>   	if (REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap)) {
>>   		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
>> -				    &ver_low, NULL);
>> +				    &ver_low, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   		if (ret)
>>   			return ret;
>>   
>>   		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
>> -				    &ver_high, NULL);
>> +				    &ver_high, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   		if (ret)
>>   			return ret;
>>   
>> @@ -164,7 +164,7 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>>   	int ret;
>>   
>>   	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>> -			    &cap, NULL);
>> +			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>>   		return 0;
>>   
>> @@ -248,7 +248,7 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
>>   	guard(xe_pm_runtime)(xe);
>>   	ret = xe_pcode_read(xe_device_get_root_tile(xe),
>>   			    PCODE_MBOX(DGFX_PCODE_STATUS, DGFX_GET_INIT_STATUS, 0),
>> -			    &val, NULL);
>> +			    &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   
>>   	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_LINK_DOWNGRADE_STATUS, val));
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index de3f2aeffc3f..ddf3ba906d1a 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -202,8 +202,9 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>>   						  (channel == CHANNEL_CARD) ?
>>   						  READ_PSYSGPU_POWER_LIMIT :
>> -						  READ_PACKAGE_POWER_LIMIT,
>> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
>> +					  READ_PACKAGE_POWER_LIMIT,
>> +					  prepare_power_limit_param2(hwmon)),
>> +				    &val0, &val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   
>>   	if (ret) {
>>   		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>> @@ -235,8 +236,9 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>>   						  (channel == CHANNEL_CARD) ?
>>   						  READ_PSYSGPU_POWER_LIMIT :
>> -						  READ_PACKAGE_POWER_LIMIT,
>> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
>> +					  READ_PACKAGE_POWER_LIMIT,
>> +					  prepare_power_limit_param2(hwmon)),
>> +				    &val0, &val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>>   		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>>   			channel, val0, val1, ret);
>> @@ -771,7 +773,8 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	int ret;
>>   
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>> -			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>> +			    &hwmon->temp.data[0], &hwmon->temp.data[1],
>> +			   XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -779,7 +782,7 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   		hwmon->temp.data[0], hwmon->temp.data[1]);
>>   
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
>> -			    &config, NULL);
>> +			    &config, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -798,7 +801,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   
>>   	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>>   		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>> -				    (dword + i), NULL);
>> +				    (dword + i), NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   		if (ret)
>>   			return ret;
>>   		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
>> @@ -819,7 +822,7 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>>   	int ret;
>>   
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
>> -						  PCIE_SENSOR_GROUP_ID), &data, NULL);
>> +			    PCIE_SENSOR_GROUP_ID), &data, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -844,7 +847,7 @@ static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>>   
>>   	return xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>>   			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
>> -			     uval, NULL);
>> +			     uval, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   }
>>   
>>   static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>> @@ -853,7 +856,7 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>>   
>>   	return xe_pcode_write(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>>   			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
>> -			      (uval & POWER_SETUP_I1_DATA_MASK));
>> +			      (uval & POWER_SETUP_I1_DATA_MASK), XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   }
>>   
>>   static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
>> @@ -866,7 +869,8 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
>>   		return 0;
>>   	}
>>   
>> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
>> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL,
>> +						 XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   }
>>   
>>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 768442ca7da6..2c8aef2b533b 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -190,7 +190,8 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>   
>>   	return xe_pcode_read(root_tile,
>> -			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
>> +			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0),
>> +			     num_fans, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   }
>>   
>>   void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index 866986694d9c..7d1e33bb5800 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -132,12 +132,12 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data
>>   	return err;
>>   }
>>   
>> -int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
>> +int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1, u16 timeout_ms)
>>   {
>>   	int err;
>>   
>>   	mutex_lock(&tile->pcode.lock);
>> -	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
>> +	err = pcode_mailbox_rw(tile, mbox, val, val1, timeout_ms, true, false);
>>   	mutex_unlock(&tile->pcode.lock);
>>   
>>   	return err;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 18260c29e620..1b4319470b5f 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -12,19 +12,22 @@ struct drm_device;
>>   struct xe_device;
>>   struct xe_tile;
>>   
>> +#define XE_PCODE_DEFAULT_TIMEOUT_MS	(1)
>> +
>>   int xe_pcode_init_early(struct xe_tile *tile);
>>   int xe_pcode_probe_early(struct xe_device *xe);
>>   int xe_pcode_ready(struct xe_device *xe, bool locked);
>>   int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>>   				 u32 max_gt_freq);
>> -int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
>> +int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1,
>> +		  u16 timeout_ms);
>>   int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>>   			   int timeout_ms);
>>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>>   			     u32 data1, int timeout);
>>   
>> -#define xe_pcode_write(tile, mbox, val) \
>> -	xe_pcode_write_timeout(tile, mbox, val, 1)
>> +#define xe_pcode_write(tile, mbox, val, timeout_ms) \
>> +	xe_pcode_write_timeout(tile, mbox, val, timeout_ms)
>>   
>>   int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>>   		     u32 reply_mask, u32 reply, int timeout_ms);
>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
>> index 8717367ccd4c..ca52e25caef3 100644
>> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>> @@ -40,7 +40,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
>>   		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>   		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>>   
>> -	err = xe_pcode_read(tile, mbox, &val, NULL);
>> +	err = xe_pcode_read(tile, mbox, &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (err)
>>   		return err;
>>   
>> @@ -62,7 +62,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
>>   		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>   		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>>   
>> -	err = xe_pcode_read(tile, mbox, &val, NULL);
>> +	err = xe_pcode_read(tile, mbox, &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>>   	if (err)
>>   		return err;
--------------tDVEIg8px1Jf5fQ1y1EnOlYg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-06-2026 19:02, Jani Nikula wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:c719ed36144b24421141cfc12022e7f585bac88e@intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, 11 Jun 2026, Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce a default 1 ms pcode timeout macro in xe_pcode.h and modify
xe_pcode_read() to accept a timeout value from its callers.
Apply this shared default timeout macro across existing read/write call
sites so that the mailbox timeout is centralized and defined in one place.
This shall also allow callers to override the default timeout when needed,
enabling explicit use of custom timeouts for specific commands.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Did you consider adding, say, xe_pcode_read_timeout() for the cases that
the caller has to use a different timeout?

Seems awfully verbose to have to pass XE_PCODE_DEFAULT_TIMEOUT_MS
everywhere.

BR,
Jani.
</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Agreed.
      Adding a <code>xe_pcode_read_timeout()</code> helper makes sense
      and avoids having to explicitly pass <code>XE_PCODE_DEFAULT_TIMEOUT_MS</code>
      at every call site.</div>
    Added this in
    <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/740789/?series=168027&amp;rev=2">https://patchwork.freedesktop.org/patch/740789/?series=168027&amp;rev=2</a>,
    as this was need as part of fan control series.
    <blockquote type="cite" cite="mid:c719ed36144b24421141cfc12022e7f585bac88e@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/display/xe_display_pcode.c |  2 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 16 ++++++------
 drivers/gpu/drm/xe/xe_hwmon.c                 | 26 +++++++++++--------
 drivers/gpu/drm/xe/xe_late_bind_fw.c          |  3 ++-
 drivers/gpu/drm/xe/xe_pcode.c                 |  4 +--
 drivers/gpu/drm/xe/xe_pcode.h                 |  9 ++++---
 drivers/gpu/drm/xe/xe_vram_freq.c             |  4 +--
 7 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_pcode.c b/drivers/gpu/drm/xe/display/xe_display_pcode.c
index f6820ef7e666..aec4cbd25a75 100644
--- a/drivers/gpu/drm/xe/display/xe_display_pcode.c
+++ b/drivers/gpu/drm/xe/display/xe_display_pcode.c
@@ -11,7 +11,7 @@ static int xe_display_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32
 	struct xe_device *xe = to_xe_device(drm);
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 
-	return xe_pcode_read(tile, mbox, val, val1);
+	return xe_pcode_read(tile, mbox, val, val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 static int xe_display_pcode_write_timeout(struct drm_device *drm, u32 mbox, u32 val, int timeout_ms)
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index a73e0e957cb0..02462dca68a2 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -86,18 +86,18 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
 	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &amp;cap, NULL);
+			    &amp;cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
 	if (REG_FIELD_GET(V1_FAN_PROVISIONED, cap)) {
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
-				    &amp;ver_low, NULL);
+				    &amp;ver_low, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
-				    &amp;ver_high, NULL);
+				    &amp;ver_high, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 
@@ -123,18 +123,18 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
 	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &amp;cap, NULL);
+			    &amp;cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
 	if (REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap)) {
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
-				    &amp;ver_low, NULL);
+				    &amp;ver_low, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
-				    &amp;ver_high, NULL);
+				    &amp;ver_high, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 
@@ -164,7 +164,7 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
 	int ret;
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &amp;cap, NULL);
+			    &amp;cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return 0;
 
@@ -248,7 +248,7 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
 	guard(xe_pm_runtime)(xe);
 	ret = xe_pcode_read(xe_device_get_root_tile(xe),
 			    PCODE_MBOX(DGFX_PCODE_STATUS, DGFX_GET_INIT_STATUS, 0),
-			    &amp;val, NULL);
+			    &amp;val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 
 	return ret ?: sysfs_emit(buf, &quot;%u\n&quot;, REG_FIELD_GET(DGFX_LINK_DOWNGRADE_STATUS, val));
 }
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..ddf3ba906d1a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -202,8 +202,9 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 						  (channel == CHANNEL_CARD) ?
 						  READ_PSYSGPU_POWER_LIMIT :
-						  READ_PACKAGE_POWER_LIMIT,
-						  prepare_power_limit_param2(hwmon)), &amp;val0, &amp;val1);
+					  READ_PACKAGE_POWER_LIMIT,
+					  prepare_power_limit_param2(hwmon)),
+				    &amp;val0, &amp;val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
 
 	if (ret) {
 		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n&quot;,
@@ -235,8 +236,9 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 						  (channel == CHANNEL_CARD) ?
 						  READ_PSYSGPU_POWER_LIMIT :
-						  READ_PACKAGE_POWER_LIMIT,
-						  prepare_power_limit_param2(hwmon)), &amp;val0, &amp;val1);
+					  READ_PACKAGE_POWER_LIMIT,
+					  prepare_power_limit_param2(hwmon)),
+				    &amp;val0, &amp;val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n&quot;,
 			channel, val0, val1, ret);
@@ -771,7 +773,8 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	int ret;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
-			    &amp;hwmon-&gt;temp.data[0], &amp;hwmon-&gt;temp.data[1]);
+			    &amp;hwmon-&gt;temp.data[0], &amp;hwmon-&gt;temp.data[1],
+			   XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
@@ -779,7 +782,7 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 		hwmon-&gt;temp.data[0], hwmon-&gt;temp.data[1]);
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
-			    &amp;config, NULL);
+			    &amp;config, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
@@ -798,7 +801,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 
 	for (i = 0; i &lt; DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
-				    (dword + i), NULL);
+				    (dword + i), NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;thermal data for group %d val 0x%x\n&quot;, i, dword[i]);
@@ -819,7 +822,7 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 	int ret;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
-						  PCIE_SENSOR_GROUP_ID), &amp;data, NULL);
+			    PCIE_SENSOR_GROUP_ID), &amp;data, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
@@ -844,7 +847,7 @@ static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 
 	return xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
-			     uval, NULL);
+			     uval, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
@@ -853,7 +856,7 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 
 	return xe_pcode_write(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
-			      (uval &amp; POWER_SETUP_I1_DATA_MASK));
+			      (uval &amp; POWER_SETUP_I1_DATA_MASK), XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
@@ -866,7 +869,8 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL,
+						 XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6..2c8aef2b533b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -190,7 +190,8 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 
 	return xe_pcode_read(root_tile,
-			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
+			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0),
+			     num_fans, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 866986694d9c..7d1e33bb5800 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -132,12 +132,12 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data
 	return err;
 }
 
-int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
+int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1, u16 timeout_ms)
 {
 	int err;
 
 	mutex_lock(&amp;tile-&gt;pcode.lock);
-	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
+	err = pcode_mailbox_rw(tile, mbox, val, val1, timeout_ms, true, false);
 	mutex_unlock(&amp;tile-&gt;pcode.lock);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 18260c29e620..1b4319470b5f 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -12,19 +12,22 @@ struct drm_device;
 struct xe_device;
 struct xe_tile;
 
+#define XE_PCODE_DEFAULT_TIMEOUT_MS	(1)
+
 int xe_pcode_init_early(struct xe_tile *tile);
 int xe_pcode_probe_early(struct xe_device *xe);
 int xe_pcode_ready(struct xe_device *xe, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 				 u32 max_gt_freq);
-int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
+int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1,
+		  u16 timeout_ms);
 int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
 			     u32 data1, int timeout);
 
-#define xe_pcode_write(tile, mbox, val) \
-	xe_pcode_write_timeout(tile, mbox, val, 1)
+#define xe_pcode_write(tile, mbox, val, timeout_ms) \
+	xe_pcode_write_timeout(tile, mbox, val, timeout_ms)
 
 int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_ms);
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 8717367ccd4c..ca52e25caef3 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -40,7 +40,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
 		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
 		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
 
-	err = xe_pcode_read(tile, mbox, &amp;val, NULL);
+	err = xe_pcode_read(tile, mbox, &amp;val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (err)
 		return err;
 
@@ -62,7 +62,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
 		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
 		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
 
-	err = xe_pcode_read(tile, mbox, &amp;val, NULL);
+	err = xe_pcode_read(tile, mbox, &amp;val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (err)
 		return err;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------tDVEIg8px1Jf5fQ1y1EnOlYg--
