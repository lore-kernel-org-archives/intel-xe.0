Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15AAC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5F10EE84;
	Thu, 27 Aug 2026 06:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOgvnYwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B453A10EE84
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 06:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787813194; x=1819349194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0S6lkPSsEDI+BgQ8zDbzCyyi9Ru8exE+VRws+4yJ8rU=;
 b=JOgvnYwWiKvyreSQoSa+aKnyrhw/gl1mujEoKks0mfKJUiGq/DNBRR+r
 S5iXmJNMP297MAC5QjBV2dIUnI8SbMwRwdgo2cU7c0mJgVweUBbv2dDjk
 t+oWmTfHug8gJNCnTr4M1KMnw5K7DdmMQdgu6pHF9Jf+TXB7lMIGMvcbG
 sKYneDpRv55Nk50TH1fBqneXycrNnhu2eUFji8oy1fw80aHMoeOtUumQW
 wuRtl9AqSsuYpH96beH/ZZQs10LAAsUBAEhQ3iKwsaucNufnndp93zwKu
 y/VrMWGKCHOcFWm8T5oLRHI6gokF9aTB1UpU7qatRf1pDIO932ZiMAhop g==;
X-CSE-ConnectionGUID: 5mjqZ/bISziVAwvCUn1T2w==
X-CSE-MsgGUID: mRTG100BTbeJGirehVUYtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87441691"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="87441691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:46:33 -0700
X-CSE-ConnectionGUID: izS+k3fZT6m+99Hh8SBkEw==
X-CSE-MsgGUID: 4ChFA+kwRJyk0OEn6I/nPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="273043399"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:46:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:46:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:46:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:46:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQuGUyr2P/RoQ7xuasi+pn298QueS0woHBWdOgQYGLmGCvP6oceRr+br95V4TDXjcCPWtjH078bwZBYTzWxOhVGJQXsKuYB9yeBw17rDYFqfOsgaQbFkrSOCZ59rum4T1+0nhI+zskPCyVhhUY7Iy/9DM6sclr8X4qZm26nXzz5z/dZRQyJVBKr1pD2mguWYvgfsaVOgpPc3I9wnwYKjovXcIb3sbfng6loWuPcYXQD36OrQZOokfRllgK9qVqTqyFMDxQcNyMnvdAMqfffNL9pxqLqFiDCE59nFEk7ToKk1hNVTCwN2rO4MFRrhKcAFIa0Ic9llwfaCMUu6hOMPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKw4De0nihYLt5zDcJuok4W7qRzxMthZInsqVP1Qpnk=;
 b=vsn6Tg8nZQSFhorFjlnIKQCsJDWqvWLIVo832fnRTEENxPnMzCXgmdgZuwxiqYrj7SekbhNrsFU+ekNNwlQHPOYmEQlEwFRtr4b5y5NNHVHuNz3a6sDDTDz6mKu3iyR+fZb9t22a2nWcJN4IgVMrbOapbtul9HoHtGrHGq2mQXwMoim/IaM7GDMOxt1VMRrXka94B/b4KFVJriL3LR79o/Nmk3WarD8E0ErlBzcWXNaJsWY3lPrtCoKbRFoirI4T7Cq0XV6Vgl0rQtv2zpItcp6eboUtG5aAbn90RaR6AIUQgAY1bzDVNk3B6sde4I0DEnJDWxnuQqizqjrsnAISJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA2PR11MB5131.namprd11.prod.outlook.com
 (2603:10b6:806:116::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:46:31 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 06:46:30 +0000
Message-ID: <c6636540-e935-465b-83cc-2813b2814498@intel.com>
Date: Thu, 27 Aug 2026 12:16:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 11/14] drm/xe/vram: Check bad_page_reservation policy
 in fault handler
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-27-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260826135136.204044-27-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA2PR11MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 55889169-aeb6-4298-35ab-08df0406ed21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Te1QZI9HXKlHwwmd+yWBwHg/rPXLmr2PvH30XBj1NgHFcBI66wSmC/L7XYATyVkb6aGiY1knjyIg4XN8mpaKmmuVdbb+YXZlVbTTaCP3YCrb8Jc16NHd0S6WrM6rTxvpBgduwvoC3sSxx9qxKWBXa1Xp9jQee8W/A/c9e46zcIaLygSd8Nh6IvNoeg58rHv5440X/VAIXi4o2xHQuFRueBhfSP3FmThem6i7BQw2hABGwrt90lIt2Yb0K0LmfyiRrtmb2NB5gjzv2eZF6TQzYrmExgmmboib2Ds62xk/qt18htLFm9AABr9+nyDcBQOtQhGs93QFa/jTMwh3ilNZj3iqgcBOOsABLbqawSKE7uibqG+bzPvbbIArGvFakuwDARgB2Hnwh/lAOHqv2OzsOQNBpZzq7VQ4I6KH+hNeUIwQ8bBAnLRilSAhK7du/m9vuq/gRUzOaRtgDtYufbsW3Ep1Zx6m2t79AgNY8Ztf3rvhIttL36gKDNULfgYFe9Vix8Awo9+cbWskEgZ18Y6NdJ6a635PnWvTIv/IW1/9+HLPel/tDuXAOd9qsSgMsuD9/OWBcoOR4mK2EPgoMwolQkwAQY32TwwyGXNEQVdwK1uibZG+nCqdOPZJZQI/VKAVsdRqoxIJxT7yz5iLuvWa2vlIVL2XVE8uSlATiX0DJWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2hZaEJkUVFsR0xabUlhcXRyM0Iva1VWKzZWcXg5ZDRIUU5rRUdmQ3JRWUsy?=
 =?utf-8?B?dEVEYVZ2ZmxPUkhZMWxDZ2RJWUhCL1dJL014RFRNQ3ZSOWh0T1FZZUpyV1kz?=
 =?utf-8?B?ZGhQOW90d3hjVHVYTWNXbDA4dXpKN2hER05IR25BNk9lZG1aVGl1Nkdxa21O?=
 =?utf-8?B?NFI0OFBER0xIdDBRS3hndVdSSHNFem5vOXI0ckkyTTdsQ1hybEVzTzdoME1D?=
 =?utf-8?B?ajYzSWN3ZWIyRHJqSnVVbHdoU3hLeGkyMkhEaVIzTDVWOFBkZGorQ1BPblQv?=
 =?utf-8?B?L21oci9QL08rVjBndXM0bXN2eXl0Q1l0VlQ5QzdldEhMeEJoOFBILzJkbHhs?=
 =?utf-8?B?QnFZS2V3bk50V2daQ3M4Z0VGWkk2KzZkNTVSSXpDcWsyS3F1M2k1NG02SmhN?=
 =?utf-8?B?SzRxb1BzTjUwVkRzRWVaNTBxL0w1akNPMEh6ZHBZNmNEWHN5NjVJUW9hSmFT?=
 =?utf-8?B?UzQzSUZwUDhRVU4rTG41RGNzSmcxS1ZLK0pBNHZTem83bjZRTkRQdmdqalJL?=
 =?utf-8?B?b3hFRkNoOTRyQ2xRaGhKelNJVFBSd2hVWnA1VUtMcndkdHVvWExINnJ3dlJV?=
 =?utf-8?B?OHJYVFRRaTlKWVc3aUh3dm4wc1ZZek9zWHpKb2dzNlFvKzFLd1lwRDFhcmIz?=
 =?utf-8?B?Rm1DdnZqQS9STUdXUjlCNUpqVUk1enJkeHkzVkszWkhSZlc4NnNLMXIzQ3h3?=
 =?utf-8?B?VitLYU13TUM0NkNNdlBXU2ZKZlVVcnlQdTJiVU1ucXZ3U2hxRnZPclVPcHJQ?=
 =?utf-8?B?VmdXYmVJcEdmUWJva0dBR1MxeTB0ZmlxS2FyeWY1dStoZ0ZxMGJ5bkh5RTNR?=
 =?utf-8?B?MHNPbEVTeDVyNVVWY0MyUG1uZGFZNXhnNXkwZHpZRi9KcUtkbDVubkZDeXl5?=
 =?utf-8?B?TjgwN2tuL05GeGVZd2ZjV0FNbXR4YW82K1h6ZSsrSWN2NnVYWWhDdDN2QXFO?=
 =?utf-8?B?OWVrS1ozMlgzVmVIclZRaDJ1L2VNTXgwekdFUmxUUE1HWkdsdWF5eERTL2tX?=
 =?utf-8?B?TGhOOUM2dnNJUEU4TW56TTh2bVp4bmZoYlpoZGNnbWxGNFVIY1R5ancxcVMw?=
 =?utf-8?B?eHV4cTk1YkZOSVpiem9NcFhiSzRzV1JaU3VwM0xwWHgyRFdJaXB2ZktRcS9i?=
 =?utf-8?B?SGcvL253MTczZWxCQTNZVzk0MWRjYldaQ2x3bTdsSUZMS3VidEcxNUVmcTE2?=
 =?utf-8?B?alQ4TTc0RlIydmZ3b3JiZmYrSWJvRXArWThLRFU2UVZUUFRCM1dhMDlnQXhY?=
 =?utf-8?B?YXErWEJhMXhiRW9KNmk0VzRpYTI0ckIxT1UzN3ZwOXpTRmJvZ0U4VXdrNnNz?=
 =?utf-8?B?NGlVa3lUekM5ZE13MDlHWkszbW9uaVlJL016NGVpR1pxZXlPWTJXTFZXM0M3?=
 =?utf-8?B?ZmpiQmFWc29zRmVERmQ0NW5jbnRjS0dqdmtJQVBoQTg1YTVIME9YSkg4Y3pY?=
 =?utf-8?B?UytWaDVpU2VLK2JZcVZudHJwZDdmeC9JU1ArNy93NjlIQkN3RlNuazFlMml1?=
 =?utf-8?B?cFVsQzdySUdIU1V1c3lseTdOVkk3eTBucGZUOUFwUVNmM0FEQTJQd1VJUkQ3?=
 =?utf-8?B?NlRYeUlqNldlbHhFNWJuY0dpWi9QTnAxMURKbnFLQzYzQ0M1R0NzZ1h4Tjdp?=
 =?utf-8?B?NVoyRERueG1mSFcrelV1QWVvLzVGbTduT0I2NGFMcDU5bVc0SUEzbE43YTVL?=
 =?utf-8?B?UllnWEtSbnpkR1dxdXRWbHJLdUhuaWZ6SjN0L0RGbGVUZVZNejNmc1BnWmFj?=
 =?utf-8?B?M2MvdCtPc01DMSsvbU1YYjE1UG9sQmRrNThDRmdJV0x0bFlOMDh6ZUxyTGZs?=
 =?utf-8?B?YmRlOThKU2VKK1JVRnhXOWs3bDc0MjhncGZ2QUtTMTBZZjBuN3pGZ0JhTWd6?=
 =?utf-8?B?RGJzMi9XZS9MdUNXaksvbTRNdUw0cDNiR2w4QkRnSitGdDU3MEVTa2pBMGxv?=
 =?utf-8?B?M1FhMDlzUC9oeUtoWHg5UDhQaG95NloyaU1obW05bUt1YW5RYVBRUkFXTjh2?=
 =?utf-8?B?eWtEZndsMFF2akhFNER2NUJhWWRheG9KSFpPclRDbTBjYkovYjhpTlp4Ykxz?=
 =?utf-8?B?eUY1eFRiOStCTGVDVFVIZ1U5Zks2MjA4N25QbzJLZWFrZjhlOWtIWHNlNDA0?=
 =?utf-8?B?cTZOcGcxOGFvRjhVL2IwYnJRS3hjZk0yMi9kVitrd01hMVNQYWVnRkpzb0N6?=
 =?utf-8?B?YkNtTnRSTGdDUlBXV09xcVZIQVY1QXJCVHJKMlArUUJFWmJIb2diZ290M3F4?=
 =?utf-8?B?TVczd0NaY2dVdjBmdUk2UGxDaWM0ejRRcVdtUGpodmJXTFFGeFpHSHYvNzFx?=
 =?utf-8?B?SFkrMkNXUllId0VxV1Fadm83R3Z5MjFCTFNGQjU3SEUvejFkWEdBQTdOUWIr?=
 =?utf-8?Q?3JOFsx0LgLhmpNJk=3D?=
X-Exchange-RoutingPolicyChecked: gu381B5USNHquKE9wtyStgpX5YERQ6WR8AMLPTdPho/rt8avMpHVZb0Ht+w5VBODCED3+mWZC1qjODejfm6CyKOsrTLFCU0Sfn/qE2EWgC3wCXld0tWsj+UT1PVSuolnifadSGevlZCG4s714a15Yd5nYQArD88qTrlN+V/tpWuQekaXFU7Goz0F7h7IZYoT3DCA0TH72mL2JiknE7X6mnHDz65gFVF1sR2Gy0plQrqolOg8cPvWNQBIRdnwGXrDElPDceFkQuPeavXK9vpgcSKnEJz4GWZhmfLWhP5W9Snld6mEsypR73Rq3O7x7slsMnyoDJfncBu/vBH3YyX2dQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55889169-aeb6-4298-35ab-08df0406ed21
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:46:30.8036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9HsOK+8EWv1BGnVpoY/LohSpXP2fctG1HXcIZkMLVzf5Cw73efn2CM5nMRZrWSFPAbwO2Tv5Wl9lZDv7SFXgmSAFwbLWQIZyrpL74QJpSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
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



On 26-08-2026 19:21, Tejas Upadhyay wrote:
> Before reserving a page at a faulting address, check the cached
> bad_page_reservation policy from xe->ras. If the policy is disabled
> (logging only), log the corrupted address and return -EOPNOTSUPP so
> that RAS can report to firmware to drop the address from the SRAM
> queue without attempting to offline the page.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index b2b6c1bd2c55..24d134754265 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -864,6 +864,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   	vram_mgr = &vr->ttm;
>   	mm = &vram_mgr->mm;
>   
> +	if (!xe->ras.bad_page_reservation) {
> +		drm_err(&xe->drm, "0x%llx is reported as corrupted address by HW\n",
> +			addr);
> +		return -EOPNOTSUPP;
> +	}
> +
>   	/* Reserve page at address */
>   	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>   }

