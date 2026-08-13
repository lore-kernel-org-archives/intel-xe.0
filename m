Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE39C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 08:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D4810E4EA;
	Thu, 13 Aug 2026 08:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AldEn7L7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449A810E4D0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786611259; x=1818147259;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+dJp0KqLptbFMZv/GFRE4UYaoRdLulkzmNjKeESDa/c=;
 b=AldEn7L7Jry3mfMuv3VQR23hNjSRm/R6pdxgrXf39vf9o9skJaY9MqMe
 TWlj6QrDj2eJ8GHQe9feYBAimjjDCWalqsDr36C3e+gdfxPbkZR/rHWui
 LQAILk7xieXZiwtb1h4tMDy6HqJhFe31PqOFNoogoah6FRwun6xUJwi+Y
 nXE5PqZ/bvDXvn8TFj84V57WM01A6Ym+5fOOQLsxyatmrds+XtRi2s7yr
 f7AvDkUF465J6f1Oqq5zVGONn1PKD95bxVbKIesp/V9JiitJCK78LitOr
 QwX0Fo1j8wxsieG4IZ4nCOazEgd/R+3DWzhY+oCoihZt2cfrvC2Ci5det g==;
X-CSE-ConnectionGUID: m9Dca00oTEC1pcdK/9eTLA==
X-CSE-MsgGUID: P02WUDQQQu+u4/Rdm7PNUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104713289"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="104713289"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 01:54:19 -0700
X-CSE-ConnectionGUID: MfMUqD58R2uw+kfSvV6NIw==
X-CSE-MsgGUID: JD3C4kGCQbGLcNH1IWx1aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="265858539"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 01:54:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 01:54:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 01:54:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 01:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGgU5g1AhKMMF1rzWa86s2vZ9ABcMeRY20rIFYTKuXtn65uiawSd/CEQZGwneaJYsygBkU6/bmvyIr3OE4262+JcTQrRxLrf5vuAhDdSEDtzdghUDM/E6pJTTIYjGjUN/7paVOJGX5FqB53RtP3bfW1qMgmevDaFSRM0s2h8xSKIpHbuWLbyPlIkQugn2I1lKooIMzS19PFG8w/iItZAVtEmBDHgdI4/PDCvBY3alMeRglk8t40qH8+S/BcFvubvbSmpN3wJfLoOtz9LHVwYV645pxSEI3kbKZnAZ8GXLJaD6HFiahDNBX5NcPyb8nUpUAsGo8tsb1bOdJ91JJSGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QImTH+50TFth18kScw4q71+abJglUX34eIT3PPZCljo=;
 b=XUXuIGb1R1tkcDvchi8gpaXqgOLVXyqyyO+F7OS/6W26r2lDED9Z5mjOLOxDm3YL4A/rRT7AREhRRoyDm4IPYadRFzvLv748YS5z7UnTXOzNc/rYwQPzpVd0ZpDV/hXTRCHROSnU8W4gtgZDl18G1iWcsR12oyJdkuhaw/XZAQhr7TWUVsGqTxOoDSPGlzbv/8HQ6FRrz6JOkVb5lr98ZSpPv3WD3VSFMJBvcrULxCKjMN+UqR4cs68mSTRgPjbU9ceYhBX9LP6Baydgr/+l1B6M2uNicNRLSjOYWRwJdPiH8d9fClkfWqUABCllh4jsWQ8/eOruWxC5ULNMSv+juQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 08:54:09 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 08:54:09 +0000
Message-ID: <f0cf73ab-084a-4fe8-8382-514ceb3b14c9@intel.com>
Date: Thu, 13 Aug 2026 14:24:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/32] drm/xe/survivability: Report 'sysfs failure'
 error using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-22-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-22-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ce2269-ad20-4534-55aa-08def9186ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: pytbSbBajcg9woYu6O95XEeMYlfCij5CZeVrGjma02TI2LQmPQCA1s0+H2VtLeXfUXAa9PADTErNbhDQ/CvKCVSNm865yv+7CBodOMTvpqBvYNJwFvgKrUwQiIR7A39P+jKd18Gk/qjToVo9jYLSidc5C0xiESSE9c9TEc8e+cVs9YWn13kRU5mVvL8m3csoq+6Ikh4/w0LgF5gRKalE5I2pri/Cz13hy+J9xM9W81KbZmpWA2jW4gupBLcF0OKSrgWYd1hYGS2y+H3Mj1YuZ7bB/x9PmUfP4h9mZ5dCXKdM87RlhGQVPi94xKsX7KeLCoJhd8FeWG3SlOqScaOFhZWo1ztYao4gD7E4WlLIlBa8B/nGikPT9mYnc/HQcmcj20XMb0a9pLlffy6N4nx50t5zRvik6Dfqe7GJpHFPwxTNFqROFr2FC3nRvaiJWHK0t3izcln5LAuuWPKTiZWG9ASAjFQjgsNZ7N3/ygXkOGPto3ov9oTzHkKaJqy9LYbtcBW9Hb5u0SAFnAsUSjamB565IiDkUuaZTveIUKfVsNy/mndgz7q3CIV+nule+neJIpdO64Qc2Mgopak3b5fGa3lCdwxZ7E9nP/XhIz7p5KraVaxWmh7SLyvsKuvMZwy5yG0ZlOPKpk8hrtskCiaw1bTziGw/etpdY+9jxfAYvTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXV1eXl4VW5vdnRWQkhudmFBZWdmQlp3MU1CQ3ZoYTdnMDZ4dG9ZcWtNK2RZ?=
 =?utf-8?B?M01PKytIME42d21CZDB2UVhKdGFEKy9VOUxYREJTOGJkNk1TUFRTSm1mUUdn?=
 =?utf-8?B?ZEpzS3B0c0o5aUxSVVFPbjA0UE1lTWx0SCtVKzZHdVpUT2hzN1o3M3JDWGtr?=
 =?utf-8?B?RVJJdWdJRS9teUM5WnI4VTN5d1d0emhQVjZUSGVnSUd1WUluU09xYSt0UVRH?=
 =?utf-8?B?OEVZalVjcnh2cXdjRm9naDJyK3dqU3dJMm03aDZUd1BWcjhQdXlxSTQwQ1JD?=
 =?utf-8?B?am9QUklmeWs4WjA3U2V2U3JEdkcvYm1XcWpoS1lHaHJMTXJ0V1QxLzVsYkRm?=
 =?utf-8?B?SkdTZzNRU0JJeEVBNU9TOVhwbUlLRnZuUUdqQlptZWYrRHFmV1lpSWdMa1ZD?=
 =?utf-8?B?MGFBNE9Gb2FoRkVlQ3JIdjFjRW1VOENWcDNlMzhkOVhaL05LbFBsRXVWdm1S?=
 =?utf-8?B?ZkJJSGFSZURJd2pENDYzbHhOTWtlcXNyN0NTNHJHa0NNYUFCaXpDN3BEaFRz?=
 =?utf-8?B?dkU5aTBpK21FOFVzWDE2RW1INTB1QVJsWkVSeUIwdXdBcFdqaUpJQWk4WmNI?=
 =?utf-8?B?dXoxVmVMbUgwUnRGNWw3S0RBRmdKOERpMlRGdUxoTjZEK1RNYXF2c202akhx?=
 =?utf-8?B?RkVIZTlyaFpoYVlOQXIwdWpGLzVvRm9GS29Rejl5SlZpcjZ0YXl2NDFiVXJx?=
 =?utf-8?B?QTkrQW92ei9keXdHbkYyb2c3ejhoZ3Y5SlA0NHZkRlFPWVJPaHBpdlgvZ2sz?=
 =?utf-8?B?TmNkbnRSdzhjdm9CQzJXTGhuZ095QkJIbnFlU0lKZGx2V0QvVWl4NXVWekIw?=
 =?utf-8?B?cS9KVHZDNWdQQVViTS9BbWx1amdTcjRrMFZmWjd1RnFSMEpmck1xRmxCUTR0?=
 =?utf-8?B?ZERzWFdLaW9reFZWbVAyZjdLQVVSS1p4Z21MSTRsekhnQ0p3UUZhWmVMbGRR?=
 =?utf-8?B?cWdsbldHRVovTy91dmRaN0tyV0pTZURsVCtjM0ZkK09MSW1ha21LcEtyRytT?=
 =?utf-8?B?SjU2ak44QVRIOWtjN21hOHRaVUNyMjJXQ3ZjTTJkTVUvN0ZjWnJ3YWpWbmZx?=
 =?utf-8?B?QzRrVzV4ZE9WUzU0eWkrQ2Rja0liakNpMi9FZFRvYi9oeXRxNUpYYmtJbFF5?=
 =?utf-8?B?cHF6WEtEY0c2UmJVWlNpMTFVVDV0VmtQV2J5UUk1dHVJK0p4UkllMDcrOWNi?=
 =?utf-8?B?dzQ3MlpWNXZUVC8vS25ubnV3b3VDZndzRGhtckxnK1pYcVNGWEtDaXNsamFP?=
 =?utf-8?B?aittQVNwbVFrS2t1bDY5dWx2SE5nRk9sYktmampQZkN3b2NDQ3VuNWx2TVNW?=
 =?utf-8?B?YWFWMER2bmJJcy94NnR4WW95MmVRRWlFSkJNNDNycUFkQ1A5ZWt6eHIvQVdN?=
 =?utf-8?B?Nkh5UGhyVTdERWU4YVdzMklxTjdXajB0ZWQ0akw0bHlGa0J0dWY1MVYrTzFP?=
 =?utf-8?B?Tmhsalk5eUI1RGdWUzhLRUhjMXlPcEd3Y0ptQ3c5c0RhN1hRUUx3SnRvckhI?=
 =?utf-8?B?YmN4NHYwNXZINXlnRHF2dHF3cWVnQVkzVko1VjdSanpod1VmWlJFeTVBNGsy?=
 =?utf-8?B?bHBKRWNWUW0zdWRCS2dFQ3FwdFFTNDFkR2NlNUNINDZ3YmpGc2hpRmJCckt4?=
 =?utf-8?B?VEdFbDBRWng0UGhza3FtRXA3SHlURTRSbU5kdEhxZWkwa2wxbkJhc0FuTXM1?=
 =?utf-8?B?b2RXYzA4c1VXUWRYbXlZWC9oWXIvMTJCZE9kZjIva0hlY1o2cU42ODZxODAw?=
 =?utf-8?B?eHhxSzlSUWpQeXprdkdOTVhqRlQ5YVVvS1dha3dWcDlva2pmZGthWWFUcm9j?=
 =?utf-8?B?Nk5xd25lMTc4aE5yc2wxYWV5OUsxREJCMW1GUXYzYjlqN0Y3WFlleG42UlZG?=
 =?utf-8?B?RURCVHUxSjE1MmxmejJjejA3empna0FabVhueEFSYjNRbDJRMUZzcitDYllB?=
 =?utf-8?B?ZHpLS1YzUW9JYndiTDIxbmRIME5ESERFK0srSGI0dTdrR0VjR3JhbGU4ckd6?=
 =?utf-8?B?WFB0cXMxdHN1WEJtMUF3NW1DcGZHNXZseTA5d2JhaitnYzRSWWViWFJzK3ph?=
 =?utf-8?B?S0lnREU0YUFRLzVFZXN1YUVMSHkvUlAxekNPQnRNZUpNaE5DNElaeU5OL3Nl?=
 =?utf-8?B?UjNBeExPVWExMFpWVGVVVTJyaURlU2Z4Tll1Z2pHenlzYXQ5Rmk2bm5ySHdj?=
 =?utf-8?B?cUIvWnhZem40alRGS0sxMXpCTkJhR01JVlVmNTQ2ZmgwOEpuT0Nubi8rUExF?=
 =?utf-8?B?OEZSYlczKzJpNi9Mb082bFJ6TmF0bi9QYkhURzNZTzZsMk83Q2E3Q3VGc24w?=
 =?utf-8?B?R2o3YmFWWG5zN0hPa0tPd3VoNXlzM1BRS1JmTXpuZVBXallmZDBtZUMyaDBq?=
 =?utf-8?Q?5kKuLvfb0xwWPoRk=3D?=
X-Exchange-RoutingPolicyChecked: AoSGayqluSlAiu1n+Qo4bZin7wE1qtdFIaRqY4s7tI6W50p4b4Ite1rQzq/5+l9jhCLdNehGS5TKeYNjTz4PexHKFF3btvBx43pHaCAXD21f8mlhBiDgRiJpsCIAM9vmN7CoE30cXfGDwXhfHuo4LA5jEkI1+gNB2CF/PCDOvL/sR56eKh3R7rwbHM+xKXDKTRwGvvd0GbTs4pAEWXb8y0L+tn8A2IKmbffXV3WoTNyhFjXftZ6VLL+HnBFw97xEKJAGlrNSCZJ3tUlomS34k23yTbecrlEpdhuekTs++b4321wlxPsiFPxPr0tiZ8lJrIIraKda3MVd0f4El9b2sw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ce2269-ad20-4534-55aa-08def9186ffd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:54:08.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDAKGr+JvsJZ8+ulOCjc6w6zyuC7xMIl2QLlQFhHGDsO2YOMAJgYzLHB3SoLnY2CJqEFf9+ZlqYLza+FJ703urpBAUpn6J9nTidEFvpa8bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> Report 'failed to create sysfs files' error using xe_log_err() helper
> from all sysfs failure points and for all call sites.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 85b4c125a217..2d8c532157fd 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -280,24 +280,26 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>   	int ret;
>   
>   	ret = device_create_file(dev, &dev_attr_survivability_mode);
> -	if (ret) {
> -		dev_warn(dev, "Failed to create survivability sysfs files\n");
> -		return ret;
> -	}
> +	if (ret)
> +		goto failed;
>   
>   	ret = devm_add_action_or_reset(xe->drm.dev,
>   				       xe_survivability_mode_fini, xe);
>   	if (ret)
> -		return ret;
> +		goto failed;
>   
>   	/* Survivability info is not required if enabled via configfs */
>   	if (!xe_configfs_get_survivability_mode(pdev)) {
>   		ret = devm_device_add_group(dev, &survivability_info_group);
>   		if (ret)
> -			return ret;
> +			goto failed;
>   	}
>   
>   	return 0;
> +
> +failed:
> +	xe_log_err(xe, SURVIVABILITY, ret, "Failed to create sysfs files!\n");
> +	return ret;
>   }
>   
>   static int enable_boot_survivability_mode(struct pci_dev *pdev)
> @@ -403,9 +405,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   	}
>   
>   	populate_survivability_info(xe);
> -
> -	if (create_survivability_sysfs(pdev))
> -		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
> +	create_survivability_sysfs(pdev);
>   
>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>   	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
