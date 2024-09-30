Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80367CF649D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 09:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3024010E2D9;
	Mon, 30 Sep 2024 09:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NceoBcz2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3D110E2D9
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727688981; x=1759224981;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kHAh6VVqDpwIEofsby22UZNUCekCMb3KLDDoMcki7no=;
 b=NceoBcz2w4hpInAEe1tk3xjLcuV6G07IzLVlVqw53IoNvyZBPv5MgO0J
 ArTgxRPtdEQIcZcDIHFv/CUBQtaBl/u5fbRJeL2eKHz6syQt2PHXDJHhw
 4ZJX80piw6mWxA07dbcVy3SHOdkBtljDUyVwQJVIKrQHutytavYKSrvdD
 8TMsyeOoJgUFNpDmVuV40df7OXO3Rt5gcGzuIL7SaHNyrbV/1+tqOcNqY
 oomnL9YwuG6tY4brDBC/WCqbh5MlJWmQ6JMEXAGNeo/PyZusouHQjRaEE
 Y5C6nNAcbm4BNFrQMYIukv/PQk0vjJqlmAfGMZIXX/ODf9ZhIMeSaaOw4 A==;
X-CSE-ConnectionGUID: lSOFMg8US+yQ+UnuMQRgbw==
X-CSE-MsgGUID: sn77gqB7QwyXJlnwTRZYYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37910011"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37910011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 02:36:21 -0700
X-CSE-ConnectionGUID: k9GkaGuvQDmhmbf6TtiDnQ==
X-CSE-MsgGUID: eZace062TSONYErbvpUw5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="77751125"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 02:35:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 02:35:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 02:35:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 02:35:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 02:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJo1+/nKXkNWBgL6SA2RV5aK8j35jk6NdW240N7/PUfBk4OTV6S4njsWJxfUoH6eY9sqAI5R4bvzV6kQNfoh2waZKPydlUPKiOaQ0XQrI4/EIch6hi46tBMDYKlRZPbsvsAuRJ01/Y9u4FPyaYQ6t4PtvWdBMl5a9xU4u1/SuqbhHFFBIae+X+N33YVa+d8DyUYiAZUil+nHareJ7xS9scW3IFmFGrCjAbAHD0C4MdG9ViGh9tzl1pX49Tb2Z8L36mcslar5d0fKio2k4XT4V0Te4XW23+z9MNsJcLLSqW2hCDE8RRJjnfEbu/FupR4WgsF4L6SteoXgQ2MKCeyP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWOv6py6Aul1Hmw8ts1epNS7I3CodWzUUaHyPEJgfYo=;
 b=Kwiu8UtIUJgmgkzuxNd8PRY1Yd8iqceIv0/aADfBO9F+JqXonITBt6T+QyupkgExb16y4V2fWAGoJEm5YpGAHez3moisv3VbMo1V0Ef+uckQBAxWYdbU2Yk+KF/LZrNSCAqNpXQK+FI21j3w/XnTM6xWpYaSpzT61uR5Tk5a1fyZtxSvo5bkHqNaLjMmDkmD8Rgq47iqc6Hdr5rLWpp+N5HjaqbGX9OtDU0JQ+zHoUUmOY2R+NhKZK9Afy40WPWKi7KOJ82Gzi5Y0rUfu4WcoU7tqVfqx+y7BQa4wQhdUqcjZWiREhhZ0s+8/7TK857ZfbIXIuohMF2J/M/+KuS5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:35:43 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 09:35:42 +0000
Message-ID: <66bd2fdb-3f25-4177-bf73-fb786643e5d2@intel.com>
Date: Mon, 30 Sep 2024 15:05:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240927002344.2565250-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: c80f0816-1efc-4147-7022-08dce1334083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXY2WmwvWU1VUnY2SEZnWGNSUC9YUDJBNHcxZHZxdnVSZ0xrdUFyb1hpeEVi?=
 =?utf-8?B?VnZTODBLZ05iZE9uL1B5dUlYcHU0TzhCMnhVMWRhRG1wSDVIZEJ3UFBtd2RV?=
 =?utf-8?B?blJiS0M1dERtU0F1L1J5VVMwNWhqS2paK2FoSnR4RGZFdTlNYktyWXNtVlha?=
 =?utf-8?B?dmlFMUpuSXo0a202UlVCVzhXLzM0UWtQamgrT1hySzBtc01FMmg5KzZ1OU5z?=
 =?utf-8?B?b3h6eFA3UU15cHVQLzBzblNtcmxjckRIRmdnUUZFd1o2Mk9hdEU4eCsrV0dm?=
 =?utf-8?B?ZUhFUS9wMWtkTEJ4cVVBYVF6d2NiY2RjSUJKRGU4WXBadm1yVnpKNlNFYlNh?=
 =?utf-8?B?eE5zeTFmYmtadFh5bXpRc1lYNDltejJLR0tBYTEzeFZrMlpISmM0YURKTTF0?=
 =?utf-8?B?ZnNxN1F4YThPcGF3M2NzQjBQTmdBelEwMmZTQ2w1WTZ1Z1FXTzV2cXRQOGw1?=
 =?utf-8?B?R01DakJ6eXcybXNYZ24zY1pJSDFtZVZZK29Sc0xnSThKYTgxTWljWlc1RzR2?=
 =?utf-8?B?UDMwNWx3bXRUOVJPRlZhZzl0VDNjVHVONFliKzQxK0c3V3UyZWs5c01WMG1r?=
 =?utf-8?B?Mmx0TDhyWnJ3dWZra0cwdmpIdVJpbUlLV05lRHcwQVdlUUpYMzFscEp5SCt3?=
 =?utf-8?B?YUxyS2U3RVV6WmFHeUhaWk4xYmdyNHpDTVdsSkprd0V1SXY3RDNYaUI2eFF3?=
 =?utf-8?B?LzFBeStudkNjWld1dFd0TUpQaTJVK3kzbFlMNmt2QXZFZHI3WVpJQ1JUaDV1?=
 =?utf-8?B?ek5mOWNSMmk5Y3QwTmwxTG1Jci85OTdrYnk0L1ZQNUREdk5HRi8xUmo2c1dN?=
 =?utf-8?B?dVkwUVZLUEJFMTRMdHMxNjhCd05lMUN3RlJ0bEtVQlBMVUh6NHBRbklkTjl1?=
 =?utf-8?B?aWZ2bmwyWUFCUkRaeGtwWlJYYlM5OVdVam1NVFJtVDJxbkVSVzJmWFhTS2hF?=
 =?utf-8?B?dHpWMks2RGI2SUQ5cmNIZHZUUFM1MkpIT0tFVEd2Qk9WNCs5eEVCdk4zalhp?=
 =?utf-8?B?amhKOVZjOURLZ2dJZDltbXJDSlA4WHhGcTd6MlZmYW0wdjRBaVgzV0tyMkRE?=
 =?utf-8?B?VFFnMDhuZm5SMnM4RDlPK2dvT0h4Qk9vQTIyckhoNlR6TG95dnZCQkFGU0hR?=
 =?utf-8?B?MkdJWTIxWE9Sd1BSdUhxQnFDQ0pIenlvWkRMQTAzYmRUdWZwY3l1YnovdVVo?=
 =?utf-8?B?a25MQkRUTnBiUkRWMjJ1RWtCSitVTk9mLzlOZHJxQU1yOFdEM0wyZTZWcFIr?=
 =?utf-8?B?ZGMrOFp5elZoYUQzQjA0eUtXNUxacnozMkdoZ0NrRzluVVlIOFcrYlplYU1h?=
 =?utf-8?B?eUt4Z3IrelBXNExwWitVRVlyeDZJcEhOMlZodThzdHNWYzVlWkpyODlIMlRR?=
 =?utf-8?B?Q25CeHBZbjlabUU5MVNPZ1VuZ3V5dGhSaWRjMVRwbmdSVHd6Q2UwMjBqSEQ1?=
 =?utf-8?B?RE40ZU5ZUWNoTTJocnhrTXo5Y1Z4R0dFcDVMN1Bvb0FiU1pOTUg2ckw4d08z?=
 =?utf-8?B?aTYxamVNYi95MjR6a0UrcnRHTHhCUzkwWk1sYk5aSVBpSllld3hYbmJGRGZ6?=
 =?utf-8?B?K3U2Uis5MWhPRCs2Q1ozZHYybkQrU2ZvVHBoenNmYzdTeVpRTndLNWo0V05z?=
 =?utf-8?B?a2RYSGlQN0dPMk1RR1ZlcVc3cmZNYkNGWDFZd0QzekE1Y3Y1R29WMzNmMWk4?=
 =?utf-8?B?ZEl6YlBlYjRyYWhqSjBvelc0YjRXUmIyM3V2dlhGVEUvZ3NXOTJkbmlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3ViQS9BZ3NKKzdwaThwd0NLSjdSSHF4UmlUZ1JVTUpZenhNRW5vVmo2RHp1?=
 =?utf-8?B?QWg5dHUzUXIwQ3FKYWYrMSthUlNLSDBmeGxsNExrZFZiL1I1UEVJY2lYRXFP?=
 =?utf-8?B?REtsbXR2ZUt1UnVCVTM0ZFdGSDhZaXJ0bWJHL2xKS1RsZm9rQXlwQkNuUVNS?=
 =?utf-8?B?VzRzMnY1UGhkME9kY29nTEpPS3dpKy8wZjcyQy9pTS9GUzd6ZjdGSHdNNDdH?=
 =?utf-8?B?MFlQdUpueDBQYXQ2Q1VBU0o0ZE1ycmpGdW1tdDFUS3padVE5amptRHE5c0Er?=
 =?utf-8?B?OFNVbUNhZVllUkUxSjN3YUVCNDEveVJKdXpRNEVreTBjNGpubGphTGx0dGtE?=
 =?utf-8?B?WlF6NlZDMEJIUW1FcnpVdjN4MlNocFlQQ1M1Nlo3a0tMZDdyUW5uWnQvekFM?=
 =?utf-8?B?UkhvZmNkeHR2cDVtcUlrYnFYNzQxRnVqTzF0a09xb2FyUWhRQzNLTVEvc0o2?=
 =?utf-8?B?KzVQKytXbU9ERjZTZkxRaUdwcWlhTVgzUnAzQ2FnWnplZE95UHY3SFEwZGVm?=
 =?utf-8?B?UFJsRi9ySDZpUG42NHFGRGMrdXJPaGNLMG41UHE4SkdkdlRVYlZRVyt1bXUr?=
 =?utf-8?B?Q3Z5OG1LM1FEWlU3bXdMZ0xuVjdqNURkZ1g0ZWFCREZnZUtsY1NtRHMzZXlL?=
 =?utf-8?B?L1lOdzZOTkFXWWxGc3JjY0JFaEZhV1BrRmp4T0RyU3JmaTFFZHdKZVBDaHNH?=
 =?utf-8?B?bTNheEhOclhRRXVSQ3RZY3VRNEFBUmNIc25pQ1AyU3lFckRMcUdZUWo4aGpp?=
 =?utf-8?B?ZXAzcWF1L29QVDV0bjMvL3hJcEhyeWtPa3VpT2FJcXdmVk9BY0JGZmc1WkhU?=
 =?utf-8?B?d0hXczYzeTBvNFQwOXh5c2JVbmQwNCtuWjRUWW9HMURmamY0WmNleXFOWFJV?=
 =?utf-8?B?Tm1RUkphdGRaTURCZmNieE9JMTBReWR3a1dVUityMU1LcVlucmI3NmxNVnBx?=
 =?utf-8?B?L0ZHdXVIcjFyUFk2NU52QUhYdFBoYTQrYm90R1VLdC9lVlV1QmNKNjJ5ZTdi?=
 =?utf-8?B?eVJqQWd2SjB5UjZRdHlsVElQNUc5anUwblZkTkVFVFlpak9GYU5zUDZUdDBw?=
 =?utf-8?B?cjVheUY2dlAwTlVxYlA5dno3OE42MlV6N3UvWkJTRGZoTUxtb09qaXFHcElE?=
 =?utf-8?B?aVBXUFRPV2dqUCtDdkRvc2UxTGF3WjJXVkpYOTg5aEN2UUpWVFQ5bXJabGVE?=
 =?utf-8?B?N2FSaEFDVXZMSTV2VW5keGJWMXV3OEZ2d2JkcU91WTJxVzdmTUgyRW5vS3U3?=
 =?utf-8?B?RkNaRUUyTHB3VDJVczlOQ2ZJT1RwQ3BMM0pka0p1MkpRS2V1VEtsS0wrYkJm?=
 =?utf-8?B?cXNzenZaQ2g2QlIxc3NRSmZSQlhYN0dwd1RsQlVMQzBsdWtzcCtjazZkRUx6?=
 =?utf-8?B?Y3JEelBXTlJML2dVVlB5NUVDTmZMckZJS1NheDI2N3lDb21RdElTVTdVUWo0?=
 =?utf-8?B?SmlZa3ZMVWQ5OGRYbnp6a2w5RkRQajhEbFJoRkVtL3lFL052dDJ0a3J2MDdz?=
 =?utf-8?B?cmRZcHZlRkpOR0M5TDFjZFcyOTB3NnBGbEdodjlTU3NvMTNiQk9zL05YeGtF?=
 =?utf-8?B?WVl4VExDUnNoTmVYWTNZWWlYY3ViMjhOTUY5NDZJTVdaVHRGS2g4QzB5amRn?=
 =?utf-8?B?STVWWHYweGRwNVIyQkNjSEJEK044MUYrNU9tTlJTeUppWWdVSWtDTzAyRUxE?=
 =?utf-8?B?SDlQUlgwUjlPRkRKODA0am1NRkVGMnBOdGgzRGpIbjFlYURlbGlrcW53bCs5?=
 =?utf-8?B?RFg2SWRBSGNZWDNOaDdBRnVMRklERVc2NmRMcnlia0EwMjA0QVp5SmdIWGNQ?=
 =?utf-8?B?K2RSODdpZzNSZjYveWFwOGJKZCtUVG5UVjluRi9aejJLWXlHU1RKQXdEdytm?=
 =?utf-8?B?MndFU0F2TWZsRlJmKy9wa1lOcEJ0bVg2YU5zOWgyY2FEemhQZW8vSHRIeVRa?=
 =?utf-8?B?OThBRlhQS3FnaWlkbWZOdUVTdjN4Wjk2YjRSSm8yaHhEenZERlh1U1NzbXp6?=
 =?utf-8?B?UE4xc0VBRU1vaWpHbi9KMVc4KzJBNEgxK2gySHFJVXFPYUhUS29qMzZxa3BL?=
 =?utf-8?B?WmlUQkYzRThpSWs3VGdTTzJ1YkliUE40QWhrQ3d2enpENFo2MFNGR0Jlbmxi?=
 =?utf-8?Q?LWjqteJkTHlKDNHgQsoWMx9aF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c80f0816-1efc-4147-7022-08dce1334083
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:35:42.5009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZaLNjsULdE/Y9ycoiPYOKeZkWEf/DtG5V/nHpR6ioDfOTh5lr/xKTMj9hAcMJ8iSYGiiQhnURDKVPRFaLuClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
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

Hi Vinay

On 9/27/2024 5:53 AM, Vinay Belgaumkar wrote:
> Provide a PMU interface for GT C6 residency counters. The implementation
> is ported over from the i915 PMU code. Residency is provided in units of
> ms(similar to sysfs entry - /sys/class/drm/card0/device/tile0/gt0/gtidle).
> 
> Following PMU events are being added-
> 
>>> perf list | grep rc6
> 
>    xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU event]
>    xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU event]
> 
> v2: Checkpatch fix, move timer code to next patch
> v3: Fix kunit issue
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>   drivers/gpu/drm/xe/xe_gt_idle.c   |  20 ++--
>   drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>   drivers/gpu/drm/xe/xe_pmu.c       | 172 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>   drivers/gpu/drm/xe/xe_pmu_types.h |  58 ++++++++++
>   include/uapi/drm/xe_drm.h         |   4 +
>   7 files changed, 253 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9b0218109647..7a190c49c573 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -872,6 +872,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   	xe_gt_idle_disable_pg(gt);
>   
> +	xe_pmu_suspend(gt);
> +
>   	xe_gt_disable_host_l2_vram(gt);
>   
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 531924b6c0a1..e0a12ac7387c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -277,18 +277,26 @@ static ssize_t idle_status_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(idle_status);
>   
> -static ssize_t idle_residency_ms_show(struct device *dev,
> -				      struct device_attribute *attr, char *buff)
> +u64 xe_gt_idle_residency(struct xe_gt *gt)
>   {
> -	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
>   	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>   	u64 residency;
>   
> -	xe_pm_runtime_get(pc_to_xe(pc));
> +	xe_pm_runtime_get(xe);
>   	residency = gtidle->idle_residency(pc);
> -	xe_pm_runtime_put(pc_to_xe(pc));
> +	xe_pm_runtime_put(xe);
> +
> +	return get_residency_ms(gtidle, residency);
> +}
> +
> +static ssize_t idle_residency_ms_show(struct device *dev,
> +				      struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>   
> -	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
> +	return sysfs_emit(buff, "%llu\n", xe_gt_idle_residency(gtidle_to_gt(gtidle)));
>   }
>   static DEVICE_ATTR_RO(idle_residency_ms);
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 4455a6501cb0..887791f653ac 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> +u64 xe_gt_idle_residency(struct xe_gt *gt);
idle_residency_ms?
>   
>   #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index bdaea9ca1065..b1b38d245e00 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -11,10 +11,15 @@
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_clock.h"
> +#include "xe_gt_idle.h"
> +#include "xe_guc_pc.h"
>   #include "xe_mmio.h"
>   #include "xe_macros.h"
> +#include "xe_module.h"
>   #include "xe_pm.h"
>   
> +#define FREQUENCY 200
> +
>   static cpumask_t xe_pmu_cpumask;
>   static unsigned int xe_pmu_target_cpu = -1;
>   
> @@ -35,6 +40,11 @@ static unsigned int xe_pmu_target_cpu = -1;
>    *
>    */
>   
> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
> +{
> +	return container_of(event->pmu, struct xe_pmu, base);
> +}
> +
>   static unsigned int config_gt_id(const u64 config)
>   {
>   	return config >> __XE_PMU_GT_SHIFT;
> @@ -45,6 +55,35 @@ static u64 config_counter(const u64 config)
>   	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>   }
>   
> +static unsigned int other_bit(const u64 config)
> +{
> +	unsigned int val;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
> +		break;
> +	default:
> +		/*
> +		 * Events that do not require sampling, or tracking state
> +		 * transitions between enabled and disabled can be ignored.
> +		 */
> +		return -1;
> +	}
> +
> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
> +}
> +
> +static unsigned int config_bit(const u64 config)
> +{
> +	return other_bit(config);
> +}
> +
> +static unsigned int event_bit(struct perf_event *event)
> +{
> +	return config_bit(event->attr.config);
> +}
> +
>   static void xe_pmu_event_destroy(struct perf_event *event)
>   {
>   	struct xe_device *xe =
> @@ -64,6 +103,10 @@ config_status(struct xe_device *xe, u64 config)
>   		return -ENOENT;
>   
>   	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		if (xe->info.skip_guc_pc)
> +			return -ENODEV;
> +		break;
>   	default:
>   		return -ENOENT;
>   	}
> @@ -110,6 +153,63 @@ static int xe_pmu_event_init(struct perf_event *event)
>   	return 0;
>   }
>   
> +static inline s64 ktime_since_raw(const ktime_t kt)
> +{
> +	return ktime_to_ns(ktime_sub(ktime_get_raw(), kt));
> +}
> +
> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
> +{
> +	return pmu->event_sample[gt_id][sample].cur;
> +}
> +
> +static void
> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
> +{
> +	pmu->event_sample[gt_id][sample].cur = val;
> +}
> +
> +static u64 get_rc6(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	unsigned long flags;
> +	u64 val;
> +
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (device_awake) {
> +		val = xe_gt_idle_residency(gt);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (device_awake) {
> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
> +	} else {
> +		/*
> +		 * We think we are runtime suspended.
> +		 *
> +		 * Report the delta from when the device was suspended to now,
> +		 * on top of the last known real value, as the approximated RC6
> +		 * counter value.
> +		 */
> +		val = ktime_since_raw(pmu->sleep_last[gt_id]);
> +		val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
> +	}
> +
> +	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
> +		val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
> +	else
> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
>   static u64 __xe_pmu_event_read(struct perf_event *event)
>   {
>   	struct xe_device *xe =
> @@ -120,6 +220,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>   	u64 val = 0;
>   
>   	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		val = get_rc6(gt);
> +		break;
>   	default:
>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>   	}
> @@ -151,6 +254,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>   
>   static void xe_pmu_enable(struct perf_event *event)
>   {
> +	struct xe_pmu *pmu = event_to_pmu(event);
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		goto update;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	/*
> +	 * Update the bitmask of enabled events and increment
> +	 * the event reference counter.
> +	 */
> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
> +
> +	pmu->enable |= BIT(bit);
> +	pmu->enable_count[bit]++;
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +update:
>   	/*
>   	 * Store the current counter value so we can report the correct delta
>   	 * for all listeners. Even when the event was already enabled and has
> @@ -277,6 +402,7 @@ create_event_attributes(struct xe_pmu *pmu)
>   		const char *name;
>   		const char *unit;
>   	} events[] = {
> +		__event(0, "rc6-residency", "ms"),
>   	};
>   
>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -465,6 +591,32 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>   	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>   }
>   
> +static void store_rc6_residency(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
> +		     xe_gt_idle_residency(gt));
> +	pmu->sleep_last[gt->info.id] = ktime_get_raw();
> +}
> +
> +/**
> + * xe_pmu_suspend() - Save residency count before suspend
> + */
> +void xe_pmu_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	spin_lock_irq(&pmu->lock);
> +	store_rc6_residency(gt);
> +	spin_unlock_irq(&pmu->lock);
> +}
> +
>   /**
>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>    */
> @@ -492,6 +644,24 @@ void xe_pmu_unregister(void *arg)
>   	free_event_attributes(pmu);
>   }
>   
> +static void init_rc6(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt;
> +	unsigned int j;
> +
> +	for_each_gt(gt, xe, j) {
> +		xe_pm_runtime_get(xe);
> +		u64 val = xe_gt_idle_residency(gt);
> +
> +		store_sample(pmu, j, __XE_SAMPLE_RC6, val);
> +		store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
> +			     val);
> +		pmu->sleep_last[j] = ktime_get_raw();
> +		xe_pm_runtime_put(xe);
> +	}
> +}
> +
>   /**
>    * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>    *
> @@ -525,6 +695,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>   	if (!pmu->events_attr_group.attrs)
>   		goto err_name;
>   
> +	init_rc6(pmu);
> +
>   	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>   					GFP_KERNEL);
>   	if (!pmu->base.attr_groups)
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> index d07e5dfdfec0..17f5a8d7d45c 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.h
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>   void xe_pmu_exit(void);
>   void xe_pmu_register(struct xe_pmu *pmu);
>   void xe_pmu_unregister(void *arg);
> +void xe_pmu_suspend(struct xe_gt *gt);
>   #else
>   static inline int xe_pmu_init(void) { return 0; }
>   static inline void xe_pmu_exit(void) {}
>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>   static inline void xe_pmu_unregister(void *arg) {}
> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>   #endif
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index ca0e7cbe2081..1213d2a73492 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -11,11 +11,34 @@
>   #include <uapi/drm/xe_drm.h>
>   
>   enum {
> +	__XE_SAMPLE_RC6,
> +	__XE_SAMPLE_RC6_LAST_REPORTED,
>   	__XE_NUM_PMU_SAMPLERS
>   };
>   
>   #define XE_PMU_MAX_GT 2
>   
> +/*
> + * Non-engine events that we need to track enabled-disabled transition and
> + * current state.
> + */
> +enum xe_pmu_tracked_events {
> +	__XE_PMU_RC6_RESIDENCY_ENABLED,
> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
> +};
> +
> +/*
> + * How many different events we track in the global PMU mask.
> + *
> + * It is also used to know to needed number of event reference counters.
> + */
> +#define XE_PMU_MASK_BITS \
> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
> +
> +struct xe_pmu_sample {
> +	u64 cur;
> +};
Is struct required? Next patch also doesn't add anything under this
> +
>   struct xe_pmu {
>   	/**
>   	 * @cpuhp: Struct used for CPU hotplug handling.
> @@ -58,6 +81,41 @@ struct xe_pmu {
>   	 * @pmu_attr: Memory block holding device attributes.
>   	 */
>   	void *pmu_attr;
> +
> +	/**
> +	 * @enable: Bitmask of specific enabled events.
> +	 *
> +	 * For some events we need to track their state and do some internal
> +	 * house keeping.
> +	 *
> +	 * Each engine event sampler type and event listed in enum
> +	 * i915_pmu_tracked_events gets a bit in this field.
> +	 *
> +	 * Low bits are engine samplers and other events continue from there.
> +	 */
> +	u32 enable;
> +
> +	/**
> +	 * @enable_count: Reference counts for the enabled events.
%s/counts/count or counter
> +	 *
> +	 * Array indices are mapped in the same way as bits in the @enable field
> +	 * and they are used to control sampling on/off when multiple clients
> +	 * are using the PMU API.
> +	 */
> +	unsigned int enable_count[XE_PMU_MASK_BITS];
> +	/**
> +	 * @sample: Current and previous (raw) counters for sampling events.
> +	 *
> +	 * These counters are updated from the i915 PMU sampling timer.
> +	 *
> +	 * Only global counters are held here, while the per-engine ones are in
> +	 * struct intel_engine_cs.
> +	 */
> +	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @sleep_last: Last time GT parked for RC6 estimation.
> +	 */
> +	ktime_t sleep_last[XE_PMU_MAX_GT];
>   };
>   
>   #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 2c5f258eee3a..3ef3926551dd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1396,6 +1396,10 @@ struct drm_xe_wait_user_fence {
>   
>   #define ___XE_PMU_OTHER(gt, x) \
>   	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
> +
> +#define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
> +#define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
Do we need both of this in the uapi file.?
We can have only XE_PMU_RC6_RESIDENCY(gt) and use

switch (config_counter(config)) {
	case XE_PMU_RC6_RESIDENCY(0)

Thanks,
Riana
>   
>   /**
>    * enum drm_xe_observation_type - Observation stream types
