Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A309FD5F75
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 06:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3413E10E455;
	Wed,  8 Apr 2026 06:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhRKX5Z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006310E455
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 06:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775628189; x=1807164189;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fT8gZsMJYlY0bXcC11jOsGmBCaz2emcwdMONC/uBUE4=;
 b=BhRKX5Z+eGHVPXr0jOoJbWeNT5DRQMXoyad1mpeo1yIf/130Mzo0+QqJ
 I6zNk/14TGnyA2UihcX2+XWqTpokQX6h37P+2WShoy3v2GIlW6KaepR8v
 uSaS1fFUE9dI8XLGD7LtK8XPXzSQ8D9sg9BwOQSZ3kbUsfpTdQWEuVtyh
 syOcnRre59rvxmmQABMBRZrFEKwrGMoR8Bnt8RPPMr19NAtaGaAaEoYOy
 AeJgYjvlAUkZusliBUQuea6pED814+Or4mDP9Jo3uhxwenLObGGuMZk+2
 62LgYUfoxjtUdpo4iEm65vzAR2IOdvlNzNS+Ap1RgYY2/zvX4Pi3NdmpD w==;
X-CSE-ConnectionGUID: Y+LNEftMRbifvnfePmHeGw==
X-CSE-MsgGUID: U+13AHkwT8arJR1tuXdakQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87300593"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="87300593"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 23:03:08 -0700
X-CSE-ConnectionGUID: m5LglPJLR2yhFV7Q2NK6xg==
X-CSE-MsgGUID: 93ivLgAxT0Ox2euTNeRr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="251521116"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 23:03:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:03:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 23:03:08 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obCrEOIUpcX+qEwHxJMrUbpH9EapkKEIRkmXcylaMcWPrDgmb6BL4+Uz91c/JNyDuBgCm5yOeL0hYiIyeiOVeN7x6/R/4sS0pgnLePH+xRQ0UFGc8m6Ol8RBjMO0SXlwiWKflX+v6aq5QEKjZARYZXAVXl890AjyD28AJbm/GK3EwIQP5cmb3QMrY8rYamWvin9yxePMi+f+cmXsnGFNXPmczx5CiuEIh4v88Kv1lQwTts8kcnJhh2X97tsugEZqqP5BGFpQyoZh8GLbtp50oTgfBHzx2r3r57IjFqTYvdGKTo3mDgYotmpmdSJM4cfL+VsYldBQZftd9Dqosmym7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHn4PSDDe5xQcw+I3jIxAZt8cG8si2izgWrfIZ2ifQ4=;
 b=ndZf4eg3hYyQPoVaaXtOlXJLddegPu6CimiNtnQFVTru8mOrqjp0bLjZJV1QJP071bocTeYSfSIqTjCNcx0fi73I2yLOlNQ8+ddm/V1iFS73j7b6A9DrUmdMgR9JOzZ1H7i9gOoEU2Hf9VQafOdZNFWN0tGjjKF4daDYETEY2Os9h6xaivP7WthrD8Mij810KbxkPS21S2yRUCAsGD0a+A/mlWcA1TsTXGf0DjD0DUbm0XE0IwvcNklboa1kemWlhZ3R7wkMjSPres88yy2fy5pKYfKFhmykteLSfuGxoUtmmPNYp6UKSEU23rH4Ccdw9NruRMU9PhVghEj8eCnAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 06:03:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 06:03:04 +0000
Message-ID: <d87ce95d-7e72-484e-bb02-7e95bb4bd8aa@intel.com>
Date: Wed, 8 Apr 2026 11:32:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_sysctrl: Fix sparse endian warnings in
 mailbox header macros
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>
References: <20260407180339.794310-2-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260407180339.794310-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ1PR11MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f152c2b-6915-4a2d-8b20-08de95347f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: PEJaqaF/+9B0JFbTeVd3W7jbLRwmUJ1kH57BdNH4ukCkJHFmcENGteiFDssapkEfdhmjchCv3cxA5Wxqo69G+/HnCU11c+O9ExgJveWTLZz8CiRugfqmVPRYjWI2dsocXWlbFCmyJ9vOwqqyG8bclIaqn3MBKJSbEf9EMGux3iPUdRWV9x/qlHjVXH2c1li89mNxLY4wBrYHt9M+Jy5MHMtfzAjqLurLIM/1jxDGIxUBaTKqr1JJgByiX7Xn4+9JjMeUwoIG09IAb9Gfkxxu6+b1QVzgECoe9w+ijOWI4oeDWU2lI7Xi8dUOHVkiKFIvEnHei07RBshI9Qe+wXcIPib2O/HCyMf1z/D5EaCSn4TQdVcjq+Nvpd9LTPYV2XAdqgjrkWGZBxxM4jO2eyNW3ommwUwghK3gbdNluRGh456qF/lBKSxMh0ncL0dnCIn/hRv1hnT825WlrgZlxapVYUE/4snhUC9+s+xMOqjutX8ROMcwSkeWgfEWg67R3PWH9DAkBR3u6ldtcerJ/Z0oBNX9KM07UJyXf5c7gnVzF8rcWkKmnxa8Ti/OF8qhyqyfowekqC+6wzjgYVBnzkOujJFy1MldVDaCLlve//ZbqpfwjJMiuYdMvdizrUL0bE5St4wpj885mEd5fs/CtJAhZI9g7XGvXsjxqWwYGnx5MNawhRCvJKhZHRJW3yDg2mK3jNr6J7AVMI/3qrC8TRv5SFybblYxSG+E5N+pMT5spDQgsnvn+eW/MIFmNnnG32vp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU5rRjNDTFJlT3N0eWVDMmlXa0RweEV3NXQzV2tmNGZybWRUcEN1K2pHSFVB?=
 =?utf-8?B?UkxHR1AwTVhLTlNmY25oY2tjQ1N1bHVhdEVQNW03OElwZHh4Tmo0dkVrajY3?=
 =?utf-8?B?QTUzWlZGaWk1OFlHaFdzUkMzdkRkNHBCSVg2ZnpwUDFMSDVZMXBuNUJqNmtB?=
 =?utf-8?B?OVFXSTdmaWJSV3RyVUxWbFpGTjZJODVUODd5NE16RjB5SmFHU01DU3NRUXIr?=
 =?utf-8?B?c05rZ3BjVXNORXlqT0k2dnQxSFpaR2xSd1NvOGExT1FJeUdRVnRKVkFYMjZN?=
 =?utf-8?B?NFJtZUxpYlVtcTIrYVlGNTZJK3ppSFdiNFBaSG9udW5TOE84S2UwQkh3NzlE?=
 =?utf-8?B?a1FvRnMwV0RSSWZ3RU9vYzc1SGs5WmM0ZlZMYk8zV3dtdW01L1Noazh1eEFR?=
 =?utf-8?B?cUk3TFp3TUkySHZSaUE1SXJmNE9jbWh4TXlCcVc1SmMrRythdXlLQStQR0s2?=
 =?utf-8?B?dUQyeVlBaTVVdnlnOHN0VXlIclJrNWFyYWp2dW1DQjVENVhiSng4dnJXcnJN?=
 =?utf-8?B?RTF6YllLbzBHZFhjdnVVbmV2QU1SMlNWaDFERjFtelVjK3VHTGd1YjBBUk1C?=
 =?utf-8?B?c1VXYnduWHhjL2tXMXcyOU55UmFkSkUvZ2lNVDNZeWJRdld3aTZ6dVJPMkNj?=
 =?utf-8?B?TzZZSW9OUEdqd3ZCc1ZTWTh5NGhzaXVXMnhRYnd6NDlCMW1NSkpob1RtRnNU?=
 =?utf-8?B?azFPeEtzekZMTVg2L0dZZ1JZUXg2eTY5eG9MdWFKendtMllIZ1RWN25uZkho?=
 =?utf-8?B?YXRadXJHL0I5MnhNcmdPWGdIdS9NOWN5clNYOWRmZm80Ymh2bzlGT0xqaEFP?=
 =?utf-8?B?amJvaWpFRnpWZE9OTW5aWEF6MGdScm1LdzhpOXdsMWdzNmpJeXkxU0czTzJn?=
 =?utf-8?B?QVo4dk5qRXI3L2ZQNEpqQUNQdGFvZGpzZW9QOGpvd2xaZnpyVzJXdFJmMTdJ?=
 =?utf-8?B?bHpieGx4elBENW5JdDFPbk5XTG0wVlRZZXVGc1pTUUJidDJWbEsrOUxRbSta?=
 =?utf-8?B?WmJJWlBhMkdvRHd1TnVyRXhoemo2a3B1ZFJsbWoxRmgyRitYMnBTdjRjbkZJ?=
 =?utf-8?B?R1ZLOWk3WDQrcGVpRktHZGk1Q3lxUUxGNzIxN2lNZWljUHkxNTNoc3lJSHlq?=
 =?utf-8?B?ZElYcDhidkRNQ1ZDYmpmcHc4bEcwbUpkcVdFUzlIaVFpd3NTWmt4T0kxc1Rw?=
 =?utf-8?B?aGFtQXErR1dxNFJWWngxemVma0tzdmtCanNoamN6S0dFOXZOTW8wOEV5S3c3?=
 =?utf-8?B?aXYwQXNFaG4xb0dFQzgxQmgxTmswTWlYZlRmcEdlUytzQUJGOFpBN3ZadlY0?=
 =?utf-8?B?dnJVbE4vd0NBUlJEWHUza0ZrOHN6NGd2ZXVnSHJCYk8zSnl2eHhFMTg1MUpT?=
 =?utf-8?B?TXJMMXZURFAwSlhEUVdSdngzMVExSVkwUWEwdmdoYXZmQ0JuQ3R4VXRTZTVl?=
 =?utf-8?B?a2phUGhjZ3BvMGNjMnVUUjlBS1B0RUhQNzVwMnpZVGNjTGQxOE55c0xiK2Zv?=
 =?utf-8?B?MmpMYU9LeFlTQ3Z3aFpreXgrTmgvd3lxRG5maHJmSWtXR1FRMEh3K1NCQVpT?=
 =?utf-8?B?Mmo4NGdXRi9VMnB3MXZObnFvWFFuS2UwL1pRT01GdHlhRTRCNzZRbkRFRHZy?=
 =?utf-8?B?RklvMEJVcS8vUG9DQTBXZHMyOVgzbzY4RFdFWXRzM2pVSDROMkZjZjB5U2JR?=
 =?utf-8?B?ZHRXbVlUZllEdUwrTldVVGVZdzlZdEt5bys3Qk92N1VIa3AySGtVTFlnc1B6?=
 =?utf-8?B?RlFrYlMyRnNuQ25JRmlOSFVHcW9aU0dQbjZXQkR6aWpmRm5TYndtNUpneEcz?=
 =?utf-8?B?MVJZM254aVRsbTlCMUhyaFB1SGhBSmw0bk9SSVB6ZmFiaHR5ZHA3TkJ3bXQ2?=
 =?utf-8?B?bThPcXExbHdsZ09UUDJLOUkrb2tITTlkRjFlaDFnOHkzYmhxekROK0dzSENa?=
 =?utf-8?B?dTUvMVpRM2dJTWQ1WE1icWxxU0lodUp4R3lxUXZtbHlkYmlveFozUzhNcjYz?=
 =?utf-8?B?WUFsbi93NkxlRjREcVVSUXdRQ1QwWjlOYXVzU0t5cEFsUDV1WGgxWUp3bG9S?=
 =?utf-8?B?ZjlkN1JDWU5oajYvYTFvcW5sVXd3MlNnUDFjaFg1QmJJM2NBN0hucWZwL2hq?=
 =?utf-8?B?L3VveTBkdWoxWTVWaEpIK0RtTUg3aTBBY2QxenRIbk5IMitRY0xxTHN4ckdQ?=
 =?utf-8?B?NEd6QmRyZmJLTUorU3J5eTQxVG1pL2RPYnhQSjlWQm1wazFodWg0VEpsak9h?=
 =?utf-8?B?cDBZNVlxUHBSRFcrSEt5aDJmRjdvaGx5MURVL3pyeVRSVjRtQWpWNE1WcjBH?=
 =?utf-8?B?QnFsUGJLcFFhaDNXUXkzb0FSVFBmMkZvMXdsMlZDRVlVY0wveTVNUT09?=
X-Exchange-RoutingPolicyChecked: ZcDGjvYPS1hgyxIzTe8vR0Htx3vYr6rT9MKCINmNI/mj+JwFGuSw1aFA1jtgeX5R4de/VZnHitO79Dox/RHnr5GKX6DpcDj+gcCszeeVu6pbDE7EF/wcrW+VtL/gcUtwAnrNMWP7SfVxoWK134DtlgtRmRHcaIu/X/PWD66+izv6JIZOq7zCB598S2J+nGkJIZVpuNF354QzH+RMGl3/Vajq/HunuWQ//f7I71HlaURaBvNiv/45t+ztiuGRb0wmf/bnJL43p7gXGktBLobSlNBc+uqHQtazCE9rRtb0MhVujPFUanBczdH5OXLfdVox95bJEAVaZAJWHs19cz9X+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f152c2b-6915-4a2d-8b20-08de95347f64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:03:04.4845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpzpkL4YRG9upSaZZrE7GQeBJv7CTj5VhUIkyFDUJNeBASuYBQLji7r4OxSuZvAF6IJQrQWaHI9Hk2HEHdb2Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6275
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


On 4/7/2026 11:33 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>
> Remove unnecessary le32_to_cpu() conversions from XE_SYSCTRL_APP_HDR_*
> macros.
>
> Fixes: 37ace5254a2b ("drm/xe/xe_sysctrl: Add ABI and mailbox interface headers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604010228.Z20DhK4g-lkp@intel.com/
Looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v2: (Umesh, Riana)
> - Fix macros instead of changing struct field, per review
> ---
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index 91460be9e22c..f67e9234de48 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>   struct xe_sysctrl_mailbox_command;
>   
>   #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>   
>   #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
> -	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>   
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> -	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>   
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
