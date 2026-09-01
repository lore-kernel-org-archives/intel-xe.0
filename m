Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F54C624D3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 17:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64AD10E408;
	Tue,  1 Sep 2026 17:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3YVigAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95B310E408
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 17:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788283180; x=1819819180;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bXXRnFgrPi/4Ws5+iefYSvIQAzc3g4PV4/PizO1QjP4=;
 b=D3YVigADYdeufacTjvaTR3o29Wy7iKwXVkibJInD3B/+7DRBsS77MnUB
 h+QhpN18/Aghk/BtNc7uq7J1k6iB1xhYI8oNb+s2KfGaRWPF0CGvteTmV
 Y9GVD8mSxV5r6MuXVj8yF4nGUKZdoTmnQG7KOaCpRoxUMWoJRZRoxg2GW
 GbhtzeUp/y5GxqhwcMrMYyZ2c2FwcliYUAfkF1BT/AaK8A1bH7jRkHwqe
 wLPTCdzUIiwmsI9WrDEHw+ezw8EkTmN089mjHP6UwxlEvZ/SWHzfuMQRI
 net/SReiXyAzpEcIv4l+1NaJwmtaN8iAHKws7NjtjWR9mjdYOZ+PTRZoU A==;
X-CSE-ConnectionGUID: 3EFugE3RS1a4ElOsbMfvBw==
X-CSE-MsgGUID: sCwEENqbQg6TrfLsOOIgdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="91235552"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="91235552"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 10:19:40 -0700
X-CSE-ConnectionGUID: UzxO5Sq+Sm+WRtbf9jTLgw==
X-CSE-MsgGUID: zbOAMbusQqGUwlP6uGXL8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="293982901"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 10:19:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 10:19:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 10:19:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 10:19:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/uuiQe1t426+k9xnQGwQKO4tshQcqpdcC5GJFs6sb5qxgnTzok0oqdVIgekkTPCbduc5OvXC4TCqTk3CsdbicG/78xKfRlGenHhvc35cgI4vuXEO3c5L+X1WXJpNRTxnBoG41o7T7kQx5wP2jtQoU/7NGqvpxlH/Ius8sRRrOeOqzwcZ6W/8/kJ38cRFSn/YXEnpGNfGZeSg/B0B0sl5uCzU0LtgH4wJE1PXu2q3QmWr7tiHhlzvc3Y4kj3Dg9O1uSKx2eCjhX+tUQ3z2/XgWJnztruiMjuYe+MtsD/qr+UC7fHXc51QBgd0iKSjGbH8jTQUupLzrkeCLQ5vcEzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW2zIiA9w5XfzyzW0M0uIiT1S9bwUUX5WZ+Xu1UOzPk=;
 b=FmCzKIgppYO4v6he1i4clerOFEWY9m4p31ZpspO4yqz1wmS8TQXBP2LEQTqBMEhobUXoQSe6no6q2d7aL7eVHGo4/DNaQM/3psndnNyR4zPvjtP0Otny+XuBQILuWpS6zNSrZea3HfDJzPhJcplzQmDCrBm56cFUWbC4HipHzr5jupIsOoCSGva2R4WOkHY18df2XQMb7wHtvTyx8UIk7FLKpHY8EhPEOkuvtErXbwtnqZT3SXUQDkE4QYD2g20KZ6AtqXd7MZyVm8bWRJflUzcu2CvS/k6UpeL0UL2vsHnmYyfWCpEp0NpOtr/mKzhkQ1ufencKGcj7el21oCZOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DM4PR11MB7374.namprd11.prod.outlook.com (2603:10b6:8:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 17:19:36 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 17:19:36 +0000
Message-ID: <9207fded-4149-4004-953c-5e125cdde176@intel.com>
Date: Tue, 1 Sep 2026 22:49:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
 <a063221b-7a11-45a7-bac9-12d19f6a2a76@intel.com> <ao9T2POk0wXbGf4L@intel.com>
 <6f8e5f5e-7bd8-4fef-b714-ef077f50812a@linux.intel.com>
 <apAtcSNzTKnNGU9q@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <apAtcSNzTKnNGU9q@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0092.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DM4PR11MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 4094e976-907c-4d5f-a046-08df084d323a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 5H1ErZzaT1O1RpLAXsCHySMrEA0ZANGWgYRI82Xo+dtDXCAlHZ6yDY7fXEY3ABo4v/t1o3fvl6Qa7dxPVflVCjRnvyeIA4IoG2myo5WMVfQvSCPDiLTJBjgksyTI1JJ2w5xzJGntgf/WJxYKtPprwDfr16FQI0gRo1Vf+XLS/S7obNOZLfXhybtz6L6xtCTYAJJjpYWAyzX47tgJbyBXIpJ+drrfDvt3xgNLcLNBysmaq/TMsMd6HN7+eeNnEEblsnC6g1IrgxflXuyyVh6T7fbzxGoh36Os886kCdc/P4LIW1Hsvo5ko3gRT/bbLcZKA2VfuIJw4Ubg8oYO5u//EIeQz0CU5da01q2CNYQqSJsVqETeMATy3sObA6iXEfDIg/zr6K0iupL87UQGjB91J5juXwIm7LV7romUf8D8aS4gqlCdyM/pDHF4ijIejmiucnQE0jmGnK9OmpPINvlAhQqfOBcrMuhd4uK8Trp6XvtBhzR2bn2lyZhEwwi+aNj2dkogvxsCYKOP7cPtM2tFZ0st5Hr+fXUvdZol3pHFfuLnU+oC9fBJA8gFPmkD424qGO3Y5F8V9kOP+g04Ri9luFRjj+r42/i+KO0kjnMBeSUVIVhTqWGghRynt9M8NdSdNEhkME9qJHGgFdx2FNUh6V9N/+HLzGjEwZPo84uG17k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am5VSkxYckR2RlJNMWV2NG4xeSswcU9YUU5ac2U3aWpiWkV0YTBDUWRScnd0?=
 =?utf-8?B?MFJFVU0rK21KcERvVUpQTng0R0x6S0dQTmJkdm9zTHBYUlE5RlBQZHd6cmlM?=
 =?utf-8?B?OGNnai9ySEZrekVFZzVXUjMzd2VJZy9wM3BiTVZKblJoVlhhT0VReFdMSGEw?=
 =?utf-8?B?NmRuQ0NIMHU1eU9JZGE2RUVsQVFkenVFM0c3SzN5QmExSXFxK3pqbDlZRzE5?=
 =?utf-8?B?UFYwZnJ0V3E0ZE5hYkxua1hzRXVOdjVhdGtidTlocnZQYWNzdlJTN0VjQWRx?=
 =?utf-8?B?eEwvbWQzNWxJVE1YcVpuaVVtaHJFZXRwTFltNCt4Uy9uc1FSYzZ6M3d6TE8y?=
 =?utf-8?B?MU9wcmFOVTRJc3ZPMU5aWm1ZNjVyZ2dJNjFQdk4ydm5OUGhiRnBjRWZHeHM5?=
 =?utf-8?B?NDBwMkVyaEx4ZTBVYVFLbXNwY2w1aWtmV3U2aVdhSXZQejh1amFpM3JwakZh?=
 =?utf-8?B?MGNYY1pJdVF5b1JwVXNPanJaZzBMTG5TSDVHVUpwNHhCNXpUSU5EamhObG5Q?=
 =?utf-8?B?NG0xNit1R1ZpRmlHS1BDUGJSR1U0UUdjYjFGZTE2S2RSUm5ueWZDVEg0aVhs?=
 =?utf-8?B?R3RxRUM0UjBGQTlRYzVoZEp1MXVqcVZWMGZYcmZScGR1T3ZJbFo0OWZQYm1h?=
 =?utf-8?B?YXpteWZhZ3ZZc0I4ZmZra3NuV2Yxc0MvZlY2VkhaSEIwSDlBUllvMTFKeTY1?=
 =?utf-8?B?NDdMU1duZG1ITGpvN2RsazIxSEREazhLTFFoU1V5cXpWZXNBM3RhVU5lemxx?=
 =?utf-8?B?MEpBenBVeFJSMnU5bFIwRkJYU3YvM1FuTS9YR0ZlWFJEclgwbXk0aFBsSW9G?=
 =?utf-8?B?aVgxSElKT0EzMXk1NlJVTjk1RUlSZFhDWmxuZTNIUlJhampGRHA1N3IwTzJO?=
 =?utf-8?B?c3pYZmkweUNYL1NhclA5TVlhOVUzbU9oZ2JWVU1TZ1VPOHpuQVlqWXBpY2pR?=
 =?utf-8?B?VlJRdE1zV0VETFZISW14cjcyemg0cWdOU2NKR3Y4SGpmazBUMlZJdk41NUxo?=
 =?utf-8?B?bEpQdldaUDRvTzRzWGQyL2RZZDB2UE0xS0tLZVBCVlBYL2dlWXZXTkdhVitv?=
 =?utf-8?B?czRFRndMMjZFS0srRTBLN3JRbXFvbnlJaWdTQWN2SVE0ZnRaZHJiVnczcTRL?=
 =?utf-8?B?QVAzVFZ2eWpQZEZDSGVhYWsvKytXdGlWWUl4KzJXS2cxTVhoTEI4ZzB4Z2w5?=
 =?utf-8?B?WE1Fb1BhYjFsVUZWRzI1MXZYdm9WY3hUSlVrWFNPUklLbG8zMUdtVlBPV1h3?=
 =?utf-8?B?S3ZWbFlKd0lDNVoxV0wwZVdLSkNVcmVUWXAzS3VXVUNYSGs1ZEkyeFhhWUly?=
 =?utf-8?B?UWdaVzUrSU1FbzNjb21XQ3JETlVvR3pRSitZY1YzbS8wRmlJSmZRc09SUUdz?=
 =?utf-8?B?STVSNXVoTk9LT3A3YmhFWXFVNy9yYlNyQVlzeXFLM21RQ3BTb3U1YUNkNlNQ?=
 =?utf-8?B?cU9JTnM4cWtVQkkrcUQxZkVKR2twTHNmNTZvVjYrMEJWOE42QVp4RW16SFNq?=
 =?utf-8?B?ejQ1Q1RicVJDV0tYTkxGczV2NnhYVDhaSmZPLzk5Yk9IZE14S2Y0SkY3Vk5z?=
 =?utf-8?B?WGtvS3BhSnByWnVTN2hXNGlJSUNCMHhNTDBSQ0xwRUJKZ0RCc2NxK0tJVUJT?=
 =?utf-8?B?L0xaUXRkVnNWKzBYZDhnbVIzMXNnU1h6N29uMFA2NVU2U0Q0QUpSekRzM3Ew?=
 =?utf-8?B?UkJ2QkdkbDM3bzJvYmh2T1VqM3luT0FQN001RHQ4K3k3NEl0OG9ZQ0xPY0s2?=
 =?utf-8?B?c2hjVDFtOUdPeStrSWV0L1R2Yng4Sjh0ZEV4Qkpld2NkZXlOZEJnak9PZzBn?=
 =?utf-8?B?Z0NXQVhrL3QyRTQyV3Q3L3VEM0xZNnNXNFh1SjdXVkQ5MFRkQmVjQ3JJZnpj?=
 =?utf-8?B?ZjMzKzRuaGhDOE1VZ3hDRWYza3ZOM0FQNVU5cXZZUyt6QXpUclhicHJMaG5R?=
 =?utf-8?B?N21XcTFHK0c2cVVKWFB4WGJiL0NiZExBZTJLSXdRNHFmMXh2VXN6cUk5aE1i?=
 =?utf-8?B?ZzdsVlB5SkVoYXZaSDFTNHdDN2VqTjArZFgvaGJ2RVFITldkKzZoUE43T1cz?=
 =?utf-8?B?K1BDWm1OWFdUSEpSTzgzODhTSXMzQkZXVk9kUFEwTjNlSlhjZlBNVnBkc2I2?=
 =?utf-8?B?VkFQT1VFMHh0cjVZd3M4ak5vSE1lNklWQjBydmpwSjlHTmdQck04Z1JZWVFF?=
 =?utf-8?B?U3ZFbmw4V29Sb0F1Mm1YRnpDOFhGenI3UWduajFNOFZmbE9pbW1vMWs3NUty?=
 =?utf-8?B?OGRlNlRNOGZXZ1J2WTZXN2hBVHRCRVZDZS9QcjF6bWxKR2ZIYkJDQ3BzSzZT?=
 =?utf-8?B?ZWtGM2pjb1FSb2FuZnhvdldxVHJVWlV4b2FWV2dMeW9FeFU2aUZCdz09?=
X-Exchange-RoutingPolicyChecked: LKJrAsZYGpe3BJ545GvzZEMEsfKsYA84PqGPS4lxgCwkZ3W/ZD1MaVq7WGcUmmKsIjqzn+Ss6DZuiaLMdkfGdtScCbmTW4yWwHAdLwf9RhIlVr5BKSSli3WJxPOfmexx9qSgRonFWVc6MUIiZZKPuFBL9woMq1nB9Ki2YLBDwVOY5hWco17aJbuOvmuaSkrFvLGZ6cVKamR8HHAmZXRwHX3qQROhXew7W8ng/0pQpLZu+D/iPpA96TSwl3fUhiHNXqQDZhOEr7aIp+lDHtLyoSqHEEND4q+d0VDPwrbTU/hB+pjTNwG9MCzCQiKZOxQaEeahu2ShYB4hTzlc5y+b7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4094e976-907c-4d5f-a046-08df084d323a
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 17:19:35.9260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQOEAZSV48U8yz7higakSMhco9j4nXbcg+jmo7XTwim/SUSvT+Aigzb7toNfVkU+uxT9iRPjSRSfZWe9+r1GvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7374
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


On 27-08-2026 17:58, Rodrigo Vivi wrote:
> On Thu, Aug 27, 2026 at 04:25:48PM +0530, Aravind Iddamsetty wrote:
>> On 27-08-2026 02:30, Rodrigo Vivi wrote:
>>> On Tue, Aug 25, 2026 at 08:20:36PM +0530, Nilawar, Badal wrote:
>>>> On 25-08-2026 19:41, Riana Tauro wrote:
>>>>> SAF MHB errors are collected and classifed under Fabric error component
>>>>> by System controller. For SAF_MHB errors, if the cause is data
>>>>> payload parity error then log and return.
>>>>>
>>>>> For all other errors and causes, request a Secondary Bus Reset (SBR)
>>>>>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
>>>>>    2 files changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>>> index d25d25f77531..586dc28a638a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>>> @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>>>>    	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>>>>    }
>>>>> +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>>>> +{
>>>>> +	struct xe_ras_error_product *product = &arr->counter.product;
>>>>> +	struct xe_ras_ieh_error *info = (void *)arr->details;
>>>>> +
>>>>> +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
>>>>> +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
>>>>> +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
>>>>> +					"SAF MHB error detected\n");
>>>>> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>>>> +	}
>>>>> +
>>>>> +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
>>>>> +			  "Other errors detected\n");
>>>> I think this also should go under recoverable.
>>> The point is that at this moment in time we don't know if the reset will
>>> indeed be able to recover the device.
>> I do not think it is right to say that, for any error we sure for know
>> what is the recovery needed. The respective error handler shall perform
>> that needed recovery action and anything that is recoverable by a driver
>> action is to be categorized under RECOVERABLE CPER severity.
>>
>> The case where driver can't recover the device by itself falls into
>> FATAL case. Eg: probe failure or wedged cases.
> Fair enough. Riana, could you please adjust both patches?
> And while at it, please add a note about this in the documentation.

In addition, rather than hardcoding xe_log_comp_recoverable(), we should 
preserve and utilize the severity reported by firmware:

static u8 ras_sev_to_cper_sev(u8 ras_sev)
{
         switch (ras_sev) {
         case XE_RAS_SEV_CORRECTABLE:
                 return CPER_SEV_CORRECTED;
         case XE_RAS_SEV_UNCORRECTABLE:
                 return CPER_SEV_RECOVERABLE;
         case XE_RAS_SEV_INFORMATIONAL:
                 return CPER_SEV_INFORMATIONAL;
         default:
                 return CPER_SEV_RECOVERABLE;
         }
}

Then use

xe_log_comp(xe, ras_sev_to_cper_sev(severity), FABRIC, &arr->counter, 
sizeof(arr->counter), "Other errors detected\n");

This keeps the CPER severity aligned with the severity classified by 
firmware while still treating firmware-reported un-correctable errors as 
CPER recoverable.

Thanks,
Badal

>
> Thanks,
> Rodrigo.
>
>> Thanks,
>> Aravind.
>>> It is a moment where we are handling a global uncorrectable (fatal) error
>>> and we will return the reset action in a hope that the PCI subsystem will
>>> be able to perform an SBR to save the day and we start everything clean
>>> after that.
>>>
>>> So, I believe this approach is correct here.
>>>
>>> Aravind, thoughts?
>>>
>>>> Thanks,
>>>> Badal
>>>>
>>>>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>>>>> +}
>>>>> +
>>>>>    void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>>>    				      struct xe_sysctrl_event_response *response)
>>>>>    {
>>>>> @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>>>>    			case XE_RAS_COMP_DEVICE_MEMORY:
>>>>>    				action = handle_device_memory_errors(xe, arr);
>>>>>    				break;
>>>>> +			case XE_RAS_COMP_FABRIC:
>>>>> +				action = handle_fabric_errors(xe, arr);
>>>>> +				break;
>>>>>    			default:
>>>>>    				/* For any other component, reset */
>>>>>    				action = XE_RAS_RECOVERY_ACTION_RESET;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> index 99b2466e2062..73517fd0d415 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> @@ -12,6 +12,10 @@
>>>>>    #define XE_RAS_NUM_ERROR_ARR			3
>>>>>    /* Error bits in IEH global error status register */
>>>>>    #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>>>>> +/* Bits 16-31 represent individual SAF MHB unit */
>>>>> +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
>>> Riana, please share where I can check to help reviewing these bits.
>>>
>>> Thanks,
>>> Rodrigo.
>>>
>>>>> +/* Fabric Data payload parity errors */
>>>>> +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
>>>>>    /* Device memory error categories */
>>>>>    #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>>>>>    #define XE_RAS_MEMORY_POISON			BIT(2)
