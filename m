Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128BAFD0648
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 07:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B538710E25D;
	Wed, 11 Mar 2026 07:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O15UxbbF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F6310E25D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773214162; x=1804750162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=chknfCmjnrHZiCU3pn3M5IP1/8bIy+xwMqSxPM8NiG8=;
 b=O15UxbbF2eNG7SsFF1Y7zuKzrFRZKzXxDOueP1s2Jk2hkiXlOYmDoDgX
 NRfx+fU4UsgvC7slJar64ztUsebaOi9zLGsFEUkPMQzEvNNEJBaZdX8Yt
 l4dBoChi8aSJ6NZJPzR8UVRlDwNRsmi0s6M1huZx+M3PixsXf3Q16mA9l
 t3oJMANJxj1K+QdOgGxZyXEoTrdqXgJHTWIc/08m8nl8mwE8nsgxSdmSy
 Ad1M/2Di4wDBJrM0klheX8xLF9ZCRj94XDqGdqwxCUe6DVIvCYa+1+5HP
 9iTJ5V2DTAee2LaqD5OWqg9fM1DcAOYNsozp3LE9NG5+RQv9AZ55t7qYY A==;
X-CSE-ConnectionGUID: wqSxO8RwQzi890Ga+VddUA==
X-CSE-MsgGUID: AroiHF90TDajD8CmIWLz5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77880212"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="77880212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:29:22 -0700
X-CSE-ConnectionGUID: Gt2GawDPTQ6Ri4ppsfa2kw==
X-CSE-MsgGUID: urFW92E8QsWxCidrW09Kqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="243388007"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:29:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 00:29:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 00:29:20 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 00:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux1tbp2aV01wwqoH5PZHkGAEIv3ArmyVyclAhm5xpCcVYu3YNGyDwkYBmIO5hSv5e+sSpdK3M2stRGspsf6NsjFYqEULIL/EC/ylTixwMvdQ5VxyydkbEgbFUnWM2I5Mkt91c2j9rukdJKeYdf5rlu+pS79HnXW31MHY0vb6y5DLBvGVK9lcxFpkZWFNyNJF1Yzg1btEKv54ER2rI32YCIMPS7koAulEiogFZVbWtXlJwZmZ4maXAc7jfh7n5k5xJlOHtxe2zPF5k0AP/3fLEvmGeBQ907yuduxfPl4ITcWSHOZspFA8qrInTLsI+t/hfuE1yhMIc5Y98s1pBTdP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBAMxdu2YP/zp76nCA2hXnxfvuXAFxXy7RNuGNcwBAY=;
 b=G5mANn2+8mNNN2rfS3vhWL/IhkAK1z6PNv+1m3Vk830nQNnxQ1/n3Rt+NzgvmD3ntDfCjoq2DgMWNd5C+u/kR46qcTN/s9t12nr1uS/xSKL+oCiOk0o1stSSpi6KjeYsy3LMVMI6o/i0WNtQBfFuI2qHxtOkIAkoImfbxczQy1mVk3pvHjI4eExbT2EvxPZ/EG0GUTLYd3laSxeLYrQsuTaRvtZ43iZrq3dEUd7P6jmR6JwfHeRfLZEAs0ScTlDYQsZhwU5sv2CnOzSqcCSMJYwdwqZP3k+iCFpy1hJehW/6ngDLaFE3xsfO0iyJFBi8tnVNXko1im/rLGUKbbXo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.3; Wed, 11 Mar 2026 07:29:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 07:29:11 +0000
Message-ID: <d7eeb026-2de9-4dc3-ba4e-610cc9a97e17@intel.com>
Date: Wed, 11 Mar 2026 12:59:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] drm/xe/sysctrl: Add mailbox communication headers
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-11-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260310182336.611041-11-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c21509-9d1a-4e4d-9078-08de7f3fe3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: tP0DA8cmTeG4zqw0CfXZnZYrFmyB9JLX/Lk7KGYw5vzb6AGHj+SKLLGAHyL7C0CEekjUIdjIozR2D+20RG/WdoJcYa8OXJ/7g/w8sv3fchVWvmk60qIFbuIP9xcbzAD+CuSAvVQS7mXUOrW679JhCkKO5IwaXCDaAJRiGzejc7xSSRPBizoluMvJUSXqrUmcGnyWWIzQCc0Hv7W3aOlsQXgoOA2RMVx+6JEtiAfxvWUaqeTtNBQkTTMoDO31KKywCdW2SWixn6hott1irCwTVHdECFqXhJ0SlJzUccJKmR7PKERStdtlI2/ex1aoYhAsL+bXktlE0I92R2IfzD5CyXdb+C5FnTOLq0/iuglOcDazjwFBPtX2LnN6twOH3zdfR8rUcrnvUnkNYZHoWQcKsReZ2RG4xjSCzAlSBfR2NIvfLMfnrKhV/bvIjk7hARBx4UFOOEQLyUvikWXRj0yma/or9ry4fRMKjLDSB5U/MNzma8AmfQraV00EK6oYDfVRNv5F8PoTOxk1kXCX5HDl0wSfYArNg48sAY11goUjM2hqu+QH/qR969Qrxpzyy6QIRgmgnIhmskvFFEXiZA+gUfWBycWhhRQ9cQiXUkvxW/46fECjoRXH514VtxvG6NXSrGIkV3EBTtVgNG4GFSCDzA/yN/uU9esCwtNsNN3eKcqio1x/rVoR4RPwOUpTLNtHGXCXEF4mA2uQfl263An02qepJvsDixza0U1f+7Db9KI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmZEbENLUDhyNXJwTHZsaDhoYXI5M3lreWFCUnc1U0YxbEg5WUp2MEVSZzJV?=
 =?utf-8?B?dGt4UFk2ckpQWGUvRlZFdlBnRzEzNDBFdkd2bXFudm1KeG5nS0xPeDJ0M1pn?=
 =?utf-8?B?dE04ZnBmNHF4WHhleEVablEwM0NMb3hyczVSQ042NTZqNldGS1YyTFpuUFpt?=
 =?utf-8?B?djI2ZG95ZGQ5aWREa2JsNkw2UVpyNjQ0UGlwcDBNaW9Ga2hxZVpwR1NBM2Yy?=
 =?utf-8?B?ejBSZHF5dlZMN0o3dGxpODB0d2hvYnNBYU1lc2Q1TjBOTmRJRnlEaXp2Um5p?=
 =?utf-8?B?eDFma2tvN1ZKSTJ6NkoxWVN5cVFTUVh5N2J6ZHRVVzZSKzY4VGg2bm5yQ1Zz?=
 =?utf-8?B?TVF2RnZoWDNhQnRjYVRzbHVPUkNaK2duY2lnKzhXNTZYbUhUbXVMSy80QnFC?=
 =?utf-8?B?OVpNajdrLzVyRC9Odm80UnBIWU1NcDdNV3h4TVNCWi9WcWhLR0lpNjZQWm9V?=
 =?utf-8?B?NHJvRkJDdy9sa0VpWFFtQzRYZlNxb0QyckYyNlQzOCtSbVNKRzBNTWhGTzNK?=
 =?utf-8?B?YXE5TGRuVTNGTDcwbXhrZ3ZXY0IrU0lwR3dpNS9VR24zaWxyN0RaYWVuM2dM?=
 =?utf-8?B?YUNMTzR2ZGNLRHZTMTRjOUh4enhvVzc2VjJNZWFmRFBmM1UxSStRS1Q5VU9r?=
 =?utf-8?B?UWhkdEpoZFhKUWNadU1jeUNQS3BZYkk0K3R3WWlOSDlIV3ZkeWovV0VyMEkv?=
 =?utf-8?B?Y3AzWU9rbmpCZXpGUE9uV0RGaVMvQkZ3REdhUE1PS3pxS2JpQkQra0dTT25s?=
 =?utf-8?B?NjRnRHdrNmsxdHRGY0tpMkIweWJ0NVBPZE5veVUwOUtETzN4dzJPb3RmUXhT?=
 =?utf-8?B?aUVsUVYzbFRORUtBTG01REx0WjdzRjVsSmtCT1p5b3l0VXh0UzFNWEVqREFF?=
 =?utf-8?B?NVR0b0xqZEpCeThRT2ZzRk15ZnhkOHgwMkhDRjMyS0xwY2tFcE5KOXBOT2cw?=
 =?utf-8?B?YkdPMUxMaml1TjRwenByb0FaQUR5Y0dnWDg0VDBiTUFSSE9TQnhKYldRL0RD?=
 =?utf-8?B?SnFOTGpRV2c4OG1OUndPOHpiOEpuWTBYUkt0R3IzbDJFdWhXb2ZYYkpkaUpX?=
 =?utf-8?B?Z3QwRXFBQW9jQUlMSFpVRU5aNG9ORm5jV3dEWFlSeTJVQ1Y0eXZTZVpoc296?=
 =?utf-8?B?YTljQ0R6MG9KL1hjNW1Kalo4MG81bXlySnB4QjRkZ3pkalFFeTVaWnljUU4y?=
 =?utf-8?B?QVlUOTlRY1ZVMUZDaCtmVGdwaEFoRzYzSG5BczNjTWlaTTI1TlQ5aGtzMm0v?=
 =?utf-8?B?WkZyeU1JT3M4R2dwSWZNVUtVQ3Y1bVZ2NjFWakt2V2QzU2cyQ2JsendDaXJv?=
 =?utf-8?B?d3dPUUpoNm1LZUZXdXBuU1cwZXpCT1pnTzRBTGNJaGtyRFM4MjkyVlplbi9Z?=
 =?utf-8?B?Q1pXT3ZNNWdvMjMvWjFSMUdQTzFaYkFCcHR3cWQxS1lzc21Qb2N3TjVVSGhj?=
 =?utf-8?B?TDFPQ0J6Y1M1d0NkMWhLV1BNNHhkRXQvenNxUTkrVnAyajVPRDNsazBwTk9w?=
 =?utf-8?B?MjlHUXEwd2lqWC8zay9OQ1ZNekhRMGtyK2xNZm92VThMb0ZMRTRySkExMmNY?=
 =?utf-8?B?Tk1lOXRmb3VKUEx3S3QrK1diMzJNMDZEdmlWaStxakZoMGlSRVZDbDNaV0dq?=
 =?utf-8?B?WHYvYWUrRFY1ZU02UW1pVGhFY3o5cUw5dUZEY09wS3dwRHNzYXU1czk1L1ZC?=
 =?utf-8?B?NUs5dHk2Zkx2SnJwVWVxdWdFM20wNnZDOWYzZ3pveGs0UUF3MTQ4eXhBTHk3?=
 =?utf-8?B?elFodHJRMUwvZ0loZU1hdDhtdkhjQ3pPVjRpMXRjTGZidUVuVm1Sa0R0bjl0?=
 =?utf-8?B?dGc1U1BaSTNTK2Z2RHErLzVzZ0FVUEVoeUhpdEZqazBvS3ppdkhDd3IwT1o3?=
 =?utf-8?B?WkpnNmw4RXBCRDlJalNXOWRXTmdHbUFkSHdta0c3bFhkaXFOdTRCQTk0WUk1?=
 =?utf-8?B?dmFYTUJiRWE5OEIxb1p3ZzFZWENBVWlURDhXbWFxVU9tNG5VTE9YNXdLdUFC?=
 =?utf-8?B?YitlLzVMUzk4allhdW1Ba2hxYkJMdnA4bncrN05wcUxmUmRldGlkc0h1R296?=
 =?utf-8?B?a3dhUDNjOTZkc0VuQldTTDdpNkhFNkRnLzRrUzZjbzVGamVLa3BrZHJoNEtx?=
 =?utf-8?B?V2tkbkcwVE5kaFRrUEIvRE00c2RQR2pFN3laemZDN1hva3UxdHZMT1FzbjJB?=
 =?utf-8?B?UnJaTGxIanBUZE9NMklGVW9FV3pqQWxlNisxWXJCbFMyNlRpcU16UzJlR21X?=
 =?utf-8?B?SlhJVU9nd3h2OWZMVEVKN3pLbG5UbjFxYnpPQlZ1WkQ1OFdVRVkwWnRMVDZa?=
 =?utf-8?B?cVc2Q0pUYTVLQWE2MWI4TG0rQThUVUtDVmkyaTQ2eURhRTMveS9Zdz09?=
X-Exchange-RoutingPolicyChecked: o4F4ZPKpydGBSye0V0prrvHYhjcZ1SF97Z9CmjAKiVhh7jJdPnjrVg+jA1pwCRB8/hnfocf8JGDyjoP5sAM9WEJB3DDXIYc/9VANugN8hjr9kEegvua/Q3bom7I4qELoARLkxxwyFlh8iZToFogCT61ZgLh10rpsnKPl3C7cl+9kR8eipKFuogoMkbhXY55t+Fy73iotvydArfwcd5WNvYpmsPvkDJ1aE7SWf5Nl3pUVwljGnRbj7fClct0SRga9PgZLlmHRvWAQflXfiILBSMfehC22eIl0zx2HzOAYeHKkwApm24agQR8hxfEVHja9zT+MkMVhQkxP5OJNoZA0PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c21509-9d1a-4e4d-9078-08de7f3fe3bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 07:29:11.7488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiVSH1uZmdXA0sKkdz92wT9yNTxakeZvYHoMrbsDvPkNWoaKBYDLSAD8r1CQZ9WZQgG5NUiVQvaXDQfyqkjfvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
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

Hi Anoop

On 3/10/2026 11:53 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add ABI definitions, mailbox API, and command structures for
> System Controller communication.
> 
> No functional code yet. Only protocol layer definitions are added.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v8: (Matt, Michal)
> - Reordered patches for logical flow
> - Moved ABI definitions to dedicated header
> 
> v9: (Badal)
> - Renamed MKHI to SCHI (System Controller Host Interface)
> ---
> 
>   drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       | 31 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 31 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 35 +++++++++++++++++++
>   3 files changed, 97 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> new file mode 100644
> index 000000000000..bc4793fb21e5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_ABI_H_
> +#define _XE_SYSCTRL_ABI_H_
> +
> +#include <linux/types.h>
> +

Add documentation. Anyone not seeing the version history will not know 
what SCHI is.

What is the reason of using SCHI? why not just mailbox_msg_hdr?

> +struct xe_sysctrl_mailbox_schi_msg_hdr {
> +	__le32 data;
> +} __packed;
> +

I don't see this getting used outside sysctrl file. Will there be any
users for this else move it to .c

> +struct xe_sysctrl_app_msg_hdr {
> +	__le32 data;
> +} __packed;
> +

This should be u32. Any conversions should be done in sc_send_command
not by upper layer.

> +#define SCHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> +#define SCHI_HDR_COMMAND_MASK		GENMASK(14, 8)
> +#define SCHI_HDR_COMMAND_MAX		0x7f
> +#define SCHI_HDR_IS_RESPONSE		BIT(15)
> +#define SCHI_HDR_RESERVED_MASK		GENMASK(23, 16)
> +#define SCHI_HDR_RESULT_MASK		GENMASK(31, 24)
> +
> +#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> +#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
> +#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
> +#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> new file mode 100644
> index 000000000000..91460be9e22c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_MAILBOX_H_
> +#define _XE_SYSCTRL_MAILBOX_H_
> +
> +#include <linux/bitfield.h>
> +#include <linux/types.h>
> +
> +#include "abi/xe_sysctrl_abi.h"
> +
> +struct xe_sysctrl;
> +struct xe_sysctrl_mailbox_command;
> +
> +#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
> +	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> +	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
> +
> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
> +int xe_sysctrl_send_command(struct xe_sysctrl *sc,
> +			    struct xe_sysctrl_mailbox_command *cmd,
> +			    size_t *rdata_len);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> new file mode 100644
> index 000000000000..fdf8d1d4e3cd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_MAILBOX_TYPES_H_
> +#define _XE_SYSCTRL_MAILBOX_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#include "abi/xe_sysctrl_abi.h"
> +
> +/**
> + * struct xe_sysctrl_mailbox_command - System Controller mailbox command
> + */
> +struct xe_sysctrl_mailbox_command {
> +	/** @header: Application message header containing command information */
> +	struct xe_sysctrl_app_msg_hdr header;
> +	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
> +	void *data_in;
> +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
> +	size_t data_in_len;
> +	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
> +	void *data_out;
> +	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> +	size_t data_out_len;
> +};
> +
> +#define XE_SYSCTRL_MB_FRAME_SIZE	16
> +#define XE_SYSCTRL_MB_MAX_FRAMES	64
> +#define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	(XE_SYSCTRL_MB_FRAME_SIZE * XE_SYSCTRL_MB_MAX_FRAMES)

Maybe use another tab and keep the macros aligned
Also if these are unused by other layers, define it in .c

Thanks
Riana

> +
> +#define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
> +
> +#endif

