Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02D4C55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 06:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E7C10E115;
	Tue,  4 Aug 2026 06:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3Xj83U3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9E110E115
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 06:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785826583; x=1817362583;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CtXuBYvTJunJ5eq4u0FePIhZACUqneT2S/7ctP9KVtU=;
 b=d3Xj83U3c2/v7QoFcwzmzXBHTu78Lk8wroRxLo0rHpobFj7VDlJ2Kn5c
 DKTgdSJj7CI+bzWy1pVQGBiTmbfDwUOFaqg/+OBISJukbBmrWl5rDDRYz
 sLo0Pt2AxxM1u6PsKL0X4mF22c5xkHsl9kITD34eODFPKDxfhUuIWC6AG
 ghF2NjTX74A5LWV2tCZK2wcpOa9EiepBF4hOcRDffQhNsLeh2yJyywvOG
 BYzq8TfEjuAbgTvU313cmtmXW3tDt6XUS8AtMN1fG6QSz2g85pdqIw6Mk
 SKXBCv8VBofK4OC9ATPDcfx+nRBnoNXIDxflIiVlyxm7tPr48clZto38U g==;
X-CSE-ConnectionGUID: e/CdyoHCR5meCRw6qpsf2g==
X-CSE-MsgGUID: wiZolYEYROa5AST7+8DTOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103773435"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="103773435"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:56:22 -0700
X-CSE-ConnectionGUID: pMaBv1EWQdKYQRAv6+ZPzw==
X-CSE-MsgGUID: h2xxJe6sQjeHQL5tw81D8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="286078403"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:56:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:56:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 23:56:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:56:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHx0fLdq6gFUYx7MyCirMUGACrOPnACwqUcjcigR1LU/MG+x1G89847p0/it8qxend4UHdPVOlF6wL0C5PmNjFuoX1D0LMXZZWaPdi5oHALdUQzQsQh5M2haUl5CKY1WPFUgyZIBwmoEhl8oiIj2i12u0zkMyBT4xISrKb42QxXS/claxwrZNJxUyRRiTAV50tG/wQo/FKm3pc0M3R9cMj7fLAk3KUmv/uzK2A0PBpn8oEkxbNir1KYyTsGAxoHRY/o4EmdstZPfLLeEPsOIjsEHBlXBPQ8CUSYYKGoTPgDFJi5SLBVPjuk1+9gSGArLcMVk3K3pefYRmLtty29gVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7AD0gUt5/4BgfwA1tANAyAh1zlK4o6V5GArRx7H714=;
 b=TqCVE8wryeiv+p8GXZY33r9VLunVcQbwhgFh4ETFJxrmiGOxa2kWtb2Oj1PB7A0t0WD1hc3d/NwBP2Zt8KcmuGnat11LTffh5RbVLUekho1WJr8GSsiQhptg4jOLB3EN7JLmdV3hPkB45hBkdJvjwwDtmcIAsJBj2wDnfg8n624N92kOWWWJKR5lBkPcPYHTRVUDy1h/JUZDsas91agiZJHojQY97FuXX5GSdjQ1/OfL+s9o9wA/V5C2pcSyhweFK8+auWticKf7c4iDiHrLLA2mzUJ5VGpHK26Mdu69Su1XA8p/GeACV1wsafJGJ8L/+BuEdiAqNg1NGvJ6yHuiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 06:56:17 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 06:56:16 +0000
Message-ID: <7514b3a7-ee80-4f1b-a2b2-aff3ea522ead@intel.com>
Date: Tue, 4 Aug 2026 08:56:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Fix invalid health error code
To: "Tauro, Riana" <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <soham.purkait@intel.com>
References: <20260804051214.1202957-1-raag.jadav@intel.com>
 <2cd81d12-a37e-47ad-a213-79a470ab7ad2@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <2cd81d12-a37e-47ad-a213-79a470ab7ad2@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0015.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f43c4ca-5eb2-4cb6-8bc1-08def1f57ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: VfsPheJqNuQm4IPJ/uc0P7n6x6FFl2FMa8cmUnnr1cp6HDDJHmcUQhAeNi6AlqGMSV28qZumrqXZ8G6Zx4vUIiYRq7jXt76VmGkdhnF1/NQepetxwFEcp8Qg1v5AZqbiE7js9aCnIPVzYgHinmSn/42mRjv5ZjnRL37LRKdG0SbkG38dWZ+4RQ7R6yi/F99ynUh7LIetHEete3QZAXTYzKcEsDQI2//h07yzcxam/z6n9smozWvrxKozj8XxsJyhK6rUNoEI40kEcV+BipK2bYjwxIkdc1cXS8Jx44BdlPMXxTqp5toBxNB+tY1X/os1i+TaylgDuMZuQv5iwYDX5DxAifQc/zCRvv1fm8jMBxba5KsML2jEyTunI7mP3duMlO/sfFfsHT91XFFCN/58rqavphWAsxxtu7Gv76BFfQFDuT2vvEB8EXxCoG52of/LBnqxGQe0xm9Q9k0jDUjUMjYfkC01EzIevQORmB3f9mCYCYQDXHAvl6tLeleSQxcL/J2NLpYPKo/GdI2WEedLnwJQDeblTh/DI9mcvl5byGPLviN2pB7GXu+g26SezK+Myv7KRZq/wpw9S5djusUZGmYnEkYGBlcG6DI6B5rkSk7bUi7P0llrhBNv2b4/jKm7HHjUka5xArSUkvg0mXM4+5OVghohgCjay/vVA1YSsD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGRBRmpXc1pWVzIzTVFTM2hQN2FZay9rZ2tCbWU4YnRjVk9vOEY2ckIxTVI2?=
 =?utf-8?B?NW1kdVRVZmZaZmt0RUp0aEJud3JpUVdXMElVdzVPcFF4WEwrM1BQVklGNVV2?=
 =?utf-8?B?NERqajE0Wi9GemdiZnhqcTRiOEVrc3FqZDlkMEZHTkVaZWw1OHg3eklYSnNa?=
 =?utf-8?B?dGVHYTZ6eUNZY3dJeUU4V3FnOUpBUkV4RUlvcWoyWEpIbHVHdUxLTmZFa3px?=
 =?utf-8?B?U24wNjcyREhGcEx5MmFGKzc2WDBoTDcwdndkTHhCbm9GdG10ZVVCTkV1cjRQ?=
 =?utf-8?B?TjEzc1VaTVVhb3IxZXhLdU01WHNySUE3dW9iaFVPUEFwVU9MS3BFV21lMVQ2?=
 =?utf-8?B?alB5dGczQUR5cEEzV1BCSFdEbU01d2RYaHU1eWl0ajN4aWgvcXo4ZFhkdExL?=
 =?utf-8?B?ak04a3FzQzRoelBIOFpla2RTNWtOTzZDZVdDS1hmYmJuUjVVNVh5eU1GZ054?=
 =?utf-8?B?SzJQN1J3Yzc4cEg5cHVDcmNPeHg4VDlkWDVRZmZhWkNISGpNdUFTWXlTdDI5?=
 =?utf-8?B?Y1A5OEFmeVU5YUVNWXhhQmd6VU1ybm9FV2VmYjRIK0lqMi9wSDNGRThqRU05?=
 =?utf-8?B?NURiMXkwcGNuVng4Y3JRbDNSblZyTS9jeW5ESnhRYmJmV1Brb1ozZjlYNFox?=
 =?utf-8?B?NldacEJIZmVPK3RMTW51aGNzd0ZkM3M2Yzc5eTdjcFAwVTVndEUxbTlXSjhh?=
 =?utf-8?B?a2ZEWVdHTE53eWpzNk1xM3VQSjRhYmtkTDU0WUJUWEwrL3B5Z1ZOd2xreVNo?=
 =?utf-8?B?M0FZUkpUZEY1d1dNUkJOVGlrK2xjc2pKa3RkdzduOGZZaUo2NlVHR3krV1Na?=
 =?utf-8?B?bkJWeklFcm16V3YraTY1bS8yTjR6WXhVTEM2dUxmMy9jQzFxeXBBYmhLU014?=
 =?utf-8?B?enV1TTRJNU9BaTc0elk5Y1JBRGN4VjAra2NLSzBCVzRob3A2ODZNbjdBOHdn?=
 =?utf-8?B?T0MvYUM3a0tjcm5Ud0pJcC9YanR3ekhpMDhIT2JaZ05qaVovZ0FFMW9JRmpo?=
 =?utf-8?B?UTdBNTVNZlduNmNxSkRyeXdOWFoyR3FIRXpzM0k4cTJ4SGlPM05XWCtpY2FD?=
 =?utf-8?B?VXpQK2xZL2VzOW9tcU1VWGwwUzZvSHM4ZENZVUZEWXJpem5JekZKS1JKeUxr?=
 =?utf-8?B?aFE1N1V5UGtXL2hOMmhzRVh6UTQyV3hxeFhiMzBkL1BTSXI4Vk5PT1g3NTF2?=
 =?utf-8?B?bnhMd0RFNG5Da0JGdW12Zkt1RnFteWJscXBSQktYWEpnV1M1QUQ2bWNDRkt2?=
 =?utf-8?B?MkQzY0RGMTBSMkFRT1NPSkdjSDRodmk2MW9rM2V6WWd3TlZRU1hScEhYRUpk?=
 =?utf-8?B?TXBXWmNYbFJ5QUdlZzFSKysrTGdEbkQreExkRm5qWHRJWDlKN0tGbnpacVBB?=
 =?utf-8?B?V05pYU1QaFZTcDNrdmxNUGdwR1JUZXhJemVKMXhzbExHN243b2RpS2tKb28v?=
 =?utf-8?B?andhL2QxU0xUY2cxUHk1NW8yY0dac2NQSnVLK3BVVElMRXpsZjhBMjRST2lN?=
 =?utf-8?B?Ujl3SmdwYXBWMW9JYVJPNzgyMmxGWDhEWEVpZkpkRHFmNFZ1ZWFtWVhuWHBW?=
 =?utf-8?B?dlp1eVdyMWFXRFJpOGtidUoyVUQvWnhyNFJvZkNXUHZTN2plUmhDWXZEYXZG?=
 =?utf-8?B?OVVGeHRaa0thc0xwTHpHMDFnRm9FS2dmS1U3WU4relVPTkdENzZ0aXc0cjRM?=
 =?utf-8?B?ekE3MnNleWk1blY5Rk13SFNlU25jaTFuTkFTWnpRRUJERklTcDlTeEJrS2Ux?=
 =?utf-8?B?dGpwWncwRjZxbE5kSW1BZmRxZlpLMU9HQ0lkc2hrM1hDVHVSTnVkRjIrN01q?=
 =?utf-8?B?WmxkV01ualJWTVN4OFJPR3NVRG5BQmpqcmg2VksvMVhFVEp1K3NoeXRTcTZ2?=
 =?utf-8?B?Q2NQOEhRSkkzaGZySzVaQkJDTTNTWGxQUXRoaDBIeUxOZ3MvT0RFSFYwUzZD?=
 =?utf-8?B?MitPbnNNRW9xTm9NdmQxSW1FcEcrMVR6SjZsalVPM0xsRktUTGFjdFcyeUZp?=
 =?utf-8?B?RDYrWDBVQkFpYkhlZlFNdHdRRHBXWC8rV3N6MFdVMjhJb2xaTytTZmpwK3lP?=
 =?utf-8?B?b3o3TWVxek1Oc0UvZmo5dEtINmZiSy9Idkd1OUlFckRkOFdRT2FNT1ZlV1FZ?=
 =?utf-8?B?Sys4VURZZlFvK2ZUbE5OUnlnOE5TTER2S3hGR3dkSUU1VzU3eWZ0QkJRNDZ5?=
 =?utf-8?B?Q2hmM0VOY0xaWUJTZDhoK2xJREpiNUlvSG93ZWQ5NVdCaHRuNXdTaVZFNlVp?=
 =?utf-8?B?VGxkNVdaZXF6aFZRV1RLQ1h5UVdMZlRLZEI0c01ZVWlTVlVlVTN4WFB3aXJt?=
 =?utf-8?B?Vjk0VE9wbkUyazZvMHQzL0t5aWgwU3NncFVjNGtWM1VVWDFTdk1obkFNOWtC?=
 =?utf-8?Q?Z12PrMESjFqEHAgM=3D?=
X-Exchange-RoutingPolicyChecked: Yf0x81JvA9h6WEgHZ5FyYKhc0RwHfv+KFzaXDKjX90C2eDW2YuCjQshRQ7k5OYVMv7+7Q05MASw2B+9v7bGtiX+uA7usFrAb6dhvCDJrQKcAgWO5TBPZinLqrgR9klWHNG9T5Ls4goybfOFycRftWIioisPFj/Ob72SyApH0jjEL/YpiK7pnLfX0wQ1vlAl3P7uSgHznyCBVgLxlhkr3MDc4TN9swvPGOfVDNaKZiTLOAdqHRVZ8ljuAH/RRPAz1ogLKBy0swulHG0iEbvCm6MTuyfLKaGf676hBjspE1x9jtlHCXtrFoTdkUnasXXpPzM5MIoQ9lG2i498Eu8RCfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f43c4ca-5eb2-4cb6-8bc1-08def1f57ae9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:56:16.7354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLrAh0eHUE2ObhDwj88RmxCf5tb4/fmv4qysDMsTcW+l/bQtAU12Ubv9NqqftFr586qb7VozxoO7UQ6mMu7Rx1x4CcUzauZEj0Te4Lln/9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
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



On 8/4/2026 8:36 AM, Tauro, Riana wrote:
> 
> On 04-08-2026 10:42, Raag Jadav wrote:
>> We use -EBADMSG for corrupted responses from sysctrl. Fix the error code.
> 
> Let's keep it -EIO as it's more appropriate for sysctrl errors and consistent than
> 
> #define    EBADMSG        74    /* Not a data message */

btw, inside GuC CTB code we use

	-EPIPE		// for corrupted message/channel
	-EPROTO		// for unexpected content in the message

as -EIO is too generic

> 
> Thanks
> Riana
> 
>>
>> Fixes: 53a7115f9862 ("drm/xe/xe_ras: Add RAS GPU health indicator")
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index f7af4da8172c..bdad0621ae12 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -700,7 +700,7 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
>>       if (response.health >= XE_RAS_HEALTH_MAX) {
>>           xe_err(xe, "sysctrl: invalid health state %u\n",
>>                  response.health);
>> -        return -EIO;
>> +        return -EBADMSG;
>>       }
>>         health = gpu_health_states[response.health];
>> @@ -753,7 +753,7 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
>>       if (response.health >= XE_RAS_HEALTH_MAX) {
>>           xe_err(xe, "sysctrl: invalid health state %u\n",
>>                  response.health);
>> -        return -EIO;
>> +        return -EBADMSG;
>>       }
>>         health = gpu_health_states[response.health];

