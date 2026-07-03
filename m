Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AE8C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 07:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631BB10F6B1;
	Fri,  3 Jul 2026 07:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOl7pyZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914E610F6B1
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783064499; x=1814600499;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+tdW1GErBIo0LYbel6fgWz9+mpruUycEAr5xkUATR0Y=;
 b=TOl7pyZMlLCgjFfXtSx2hvZenyJ3MzsgsQRGIH5sXV26Eq7SN7Gfu7Su
 tsW2HC/tk+CRLPllKkcLn0/HMSvLFPfl8JtzIEgJSskMtk53TyIwWU+om
 +OEXRT+Dx2xuNL8qLWWsm36rq28thJWvXrHuUMF0PtGb2lh3e5+K5wjin
 JMdFvGI6lKV3l/K67zgmUPUnBSHPjzcxVFJwwO+FPkUp4ukjGl7KmqcdO
 BNxdYMPPZx3xKZxKYCXnugWEu+0nFnM+EbZxCY1JNhdlc8PIk8f1yl8d/
 Q2K6NVpiLoGk940eCTIKdKO36qct6M3x2T4AoCpq08OX5Ek4FAngi+RLe g==;
X-CSE-ConnectionGUID: a4e1KmaNS6umn90wGxtozw==
X-CSE-MsgGUID: SgWvEzIuRh2k6x8lVrtXNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83590996"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83590996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 00:41:39 -0700
X-CSE-ConnectionGUID: qY2SkfCWS2exd0febd0gGA==
X-CSE-MsgGUID: 4LlOst8GTH6q5i5ZEQ1vJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="283144018"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 00:41:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 00:41:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 00:41:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 00:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOvDmR+OLPKYSBY4Hd0Vm74gnFxfBMY/Cvqpd6OkcL2vDNBEibVt0BMj+KLpg87ehdXLdygZ+l2IFnnc855k/b+VZ8uRYl3bs2/YZkFA6qgK2zrSUPe5o+cQq+tnESFZ9Lk7pFzQibsCk1X7LMcSgFPEq/XVbOKzEzT+OKZ3dJs9aj/pZ46YrELsdueo2uRDDEfrDUuE5MbFWu0H1YtUZ6opB11AVIz6R+8tnz+OzPf1pXr4TTbGfR3YSdk4c8LrOeut4/w5ik8E5CaWCzF7YgHsExrcxKwhs5erQ1DQADjD1VL668+ateq9RU737teC3ljL5Tdu9q9zr9qYDlaEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyogUjvIGNbDyV0hAiLHxzCeiIe2GAdnfKccBaCrik8=;
 b=u5QBmr4+qBfMcSSI50YfR17T0D6t19B0zXtAtdHbx1yLocEJwO8Pz8c1Th+hQy1EcTErU3ajSgrfCdcjd1qqxMyvXSynZLZxl5Mt7053gsRC3oedcvTV89Nohu/a32bRypf4cgLndp4Hn8AUiKr0lQsqQIxfjIBsDJ7G1KeWC/u0cmQ98Uiymcxrq12Kx2DcmU4+4pEGasq2QV2tVKM0Dkf5S429kBKSN1tUiV0jv5i8d9oIcARYenqbbiwwWPdq3KwfaGXHY8TEsxlo4pBa+W3Tr5gFhQkdmZHNx4KKrKTd0apOOmFYZhNLX6KP+SQrNIcdvygoie4+eEt4Jk8AHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Fri, 3 Jul 2026 07:41:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 07:41:34 +0000
Message-ID: <f42318be-d3a3-4619-b1a1-5053f99e9156@intel.com>
Date: Fri, 3 Jul 2026 13:11:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] drm/xe/xe_ras: Refactor get_counter() to return
 response structure
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
 <20260702111401.3680214-12-badal.nilawar@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260702111401.3680214-12-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0241.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 85459b22-22b5-4f4b-724f-08ded8d681ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info: Qo+UxpHm4o/qMA9TOpnAbxKT9gILf46Hslmefzw79fIXV21WKyCN2TXqsEXp0qVdK1patlSFPA/6RhtPKVrDFcaxaCNXBCtjEsXaXYSXchFYfl+g+6cOrx6lMXIsAyonjADOo6BfuomP12NJJyyzeqLJ1dCqUcu3+lzQHRktS6lirNprOZEg+9dacjfr7fvhHB5EdV0Pi+o42mgLqK5rTvezLfG3W30YUDX8adlwR36JtmLjp0wM5wV0wT0EUz39Z0Wrs/7hYie9Kzdwbrb3jNPxWXk9C3Jox498dmRz4RfGAQ9XbAUiFy95/xXAvnZRcSPHeARmMM03mEf5mdn8CEaboJvMJ1DRktpJe1ggm9wFVyGNqYWeX+6pKxSumK19BDQ0qHYC9wVUopGCOrlhOcPDhbhWAtJ/ZN8lvr6Di/Ye6kH/2m91V26AXh1u1Ngdh1ebyNsO8pnLTk6sy1bIQwO9ZspsLla/dCZgFooJw8DobmgCQc+vhDzdpGpMonVi9Ofh+FsoZjpMobfcM8wniKqDfqXVRwZjLkYCNpcw4jslPRPSlZ6xqpUf785712o+AWR/4pwyN5miKjBd0V0Y7HmsYBdA0t2WmdwuygpCmWRkmm/g4yne8y7oZWpOFqNZG8it1RifSxFBXI7g+kNjPzdK0nwOVGuugFLIzRzIO4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzlsd3U0UWNaL2NESzRWc2NOQWlDazFyLytFb2EyOTBicFJBYXZiS2V0UkNU?=
 =?utf-8?B?MW81SXRtWDdYampQbXZKQnZkcCswejZDYk1jZm1Qa1Q5a3RoNUhqK3B6TFZJ?=
 =?utf-8?B?dS90OTBPU09mMUlpUE5WS2RpYmcxMFhxSUZDV1R2SnF2WlJnUGsvT0hMTTl1?=
 =?utf-8?B?WDVnMy81ZnJBcitpSUhEWWJJaHFZYlMxdFlmMGtGeHJzcDZZbzZkbE5kczRa?=
 =?utf-8?B?dDB3QmpBQmtqaEpWNG5VeHpaNmdJUlhBdzN0ZE5QdGZ6Z3RYQmFieTlBYTYy?=
 =?utf-8?B?blR4S1FhNm8wVjBjZEJuOFkxZmhzRGtOSXJNNE9UYktkWGJaZVZWSC9IWXg0?=
 =?utf-8?B?NXdIYnVVU1crZFNkV3JuTzZMaVd2R0RKc05OeFphZ0VNRXJCMVNpK3ppNFFa?=
 =?utf-8?B?R2VxVjlBRDNLeHg3Q0hpWnpYSGlkbXgzRUVtekxRQnYzajdpdDQ2SE1CbzAx?=
 =?utf-8?B?blk3U095a2Ztc0k2ZTRlSHlEN0pIOUJ3N0FMQk95RDNkNHdaOFdlZ1RpRkkr?=
 =?utf-8?B?M3ByUXdIaGtCN1hRK3NYVXhJQnRCMXNHQ1J4NDQ5Uk45NHd4cTVXeW9xQVNl?=
 =?utf-8?B?OUVpdGViN2JPdjZYazl2QVl3cU0yMEFSK1hWdk0zSmE1Yy96YWd6U0dLUk1i?=
 =?utf-8?B?L1BIS3lYekl3V05vQmZaUVZmMWN4YVN0bHRDZmgyUnVYb3B4bmNZNkJST3Z0?=
 =?utf-8?B?L3pMZm9ibUt2RlkyMXp2Z2JsNjFkK0Q1ZXdnMTBZTlFYUC9WRTJWUDVaRER0?=
 =?utf-8?B?b05RdlhCTS9XWWxyWE5iRFlYaW9mSjR4TlRwRUFYOXA3NmN5d0EyT016TGQ0?=
 =?utf-8?B?WXgrSUwySWhHK3YvU1FteXUwRlBKR3ZnellmWDZETTRNcGd4Y0x6M2pnVGRD?=
 =?utf-8?B?RXNOZmtRUldHNlQ1WmNVU3FaWGswK293aGE2S2MrMGp3M3RqSmhlcFVmd1FI?=
 =?utf-8?B?b1hSRlEyclFid2EwLzNzYTY4NHFLaHlVZVg2R2hqV1d1bXRlVitZNGZBSGVm?=
 =?utf-8?B?ZEFVQlgzZ0JFVW1CZ08vcHNNZlZqS0FHbFFoeklWRDFBam1heHJueVliU1lF?=
 =?utf-8?B?cS94bHBSSWhzSXhmS3AwS1YxNHpOdkxzdlhGYVdhcW1hTFJqWlhDWk9WZGRN?=
 =?utf-8?B?eUlmODlWV05Fbnh6QlpYdzJFdVliWVlJbFB0TmhBbGRhY3I0UENFalRYS2xP?=
 =?utf-8?B?RjF3eDZ5TG80M3pERTZxRDlRL2dtWk5QMHNnSFB2RHAvMjMzQ00xd1ZUeFlz?=
 =?utf-8?B?ZXdjdjE5RmROeTJGQk9lZ29WZEpES3pBQW01dUo2TTNaYk1lRlZEOGJuVHJx?=
 =?utf-8?B?SDFYZ1dtaEkzdHdOQk9TYnZBVjN5UW1aQm0yN3E1djJZSm4yaHpwVnNVTlB4?=
 =?utf-8?B?OEZMZjdmSkJUbFdTMjdibW9DdTU5YkhYcVBJTmhjTjRBUDhsT3AvalVSQzly?=
 =?utf-8?B?Wk1EMGRZdjhUSmNkdVpMS1FhYXFWdlhOWnQrclNtRStCd0xOa1VPMHB1ZjJI?=
 =?utf-8?B?eVRRQkFhWEY4YWtYTEl5ZjlpY1E4elAyK085MmdxZW1SRlV3N0t5cWZNOGhi?=
 =?utf-8?B?OU1aSlh4MzFMZWVuSlFoKzQ0VWJURURxWEp6Wnd4UDZvOVc3RWUzOTY5ZWlF?=
 =?utf-8?B?bGkvMFNCQ1R6WmJaTDJQTUZ3TmZ2MGF1WWxGcUhQMkVwbWpOZkFQQkNlYWxK?=
 =?utf-8?B?cEJ0V1FhcDBnajMyZHpaSkNRcDE2Yk11SStUcHpJSDIxMXFpdGF5Um9VSGgw?=
 =?utf-8?B?YjhLZkw2RExkRHA5UVZjTWxSUEV3N0NrcUxnUXJpWTU2OGU5V1hIOVVsejRo?=
 =?utf-8?B?cUQra1JaZzBWc0NkbzVvOENlYzNTNHdPWVViTTBVYnpPK0MwM05GMnNEUUdr?=
 =?utf-8?B?bmovZ0lYa1lCMzhuZk1aZ2dYYkxsZHpvTWlGWTBTajZ6RDNjVHh4bVpXME9L?=
 =?utf-8?B?amZvMDhQK2lGbFdiQnBuUWl1Tk1KRDRMSVlMcGtwUkV5WnhJeTlJb3hURHRr?=
 =?utf-8?B?aDZxMUJoLzlSSnp1OTdvNU1sTll3WktLbUF4N0dYYzNDYWVjYmdabHFpUWVi?=
 =?utf-8?B?b1dQbFJtWkFSVnlCT2Q2bCt4aTlWSk52R2o5QlJFa2xiL1VxNVBjVnpYSjdh?=
 =?utf-8?B?L3JEQ0tPNkE1MisyM29Cc0FOeGM1NVJNc1JxdndZdTJITXl5dW9GZUtLalhH?=
 =?utf-8?B?d3JTMlhxOXd3bW52SDZzQjE3anJCamJEdStQazN1SnBtT1FMSHlZY0FvQjZD?=
 =?utf-8?B?aSswUHNhakZkTVpDUmp1WmtpMjF1dW9XakhFMm9udmc1SHhnOEwybU5uOHk2?=
 =?utf-8?B?czRGdU5NeWR0bk1pczhkTk5WbC8vY2ZIZVdHMVlCOTQxR0luSHhQZz09?=
X-Exchange-RoutingPolicyChecked: FPuGksizZWT7AYpBHzLxdQE5BdCmB22LqLNMMACcDKwjvBtbrmG00eJkNDhGoeM4htzTAO2SgDbt9dos/wWexQC2z1dTeLozJ27t0V9UFz2UVT+LrK3ecrtcChEyXdlWe6ax9BpvHYoKdmqU64M387AJfTbiYDo48rDbWyurNdcganG5OHtygZ9erkB+pZW8EorrsgDaTbJQVvc9z/Xsfz/+CF9FshEY7o3qgGyBJTlljCIAHLI8Bji37dgQDwR4xCb1TT1ki80sMVeZoK8/wUcwahDF1RfZtOyPFj3AiJP168S1Mumli2vSfMEiMvp1UeGXCpEUUfWTgyhlrwt6zQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85459b22-22b5-4f4b-724f-08ded8d681ce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 07:41:34.8986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DX4Yxh4lrVEjhDVPH/JTXwmNsjVJQf0xjajy73xQt1hx27hQcy5BDsNx1eO0PTkmnQ/HsFgyer/z+C8mEnXqfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
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


On 02-07-2026 16:44, Badal Nilawar wrote:
> Return the complete response structure from get_counter() instead of
> only the counter value. This allows callers to access additional
> response fields, such as has_info_queue for CPER record building.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 23 +++++++++++++++--------
>   drivers/gpu/drm/xe/xe_ras_types.h | 10 ++++++++--
>   2 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 85b0202467f6..e594d4d3a23f 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -157,12 +157,12 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   	}
>   }
>   
> -static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
> +static int get_counter(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +		       struct xe_ras_get_counter_response *out)
>   {
>   	struct xe_ras_get_counter_response response = {0};
>   	struct xe_ras_get_counter_request request = {0};
>   	struct xe_sysctrl_mailbox_command command = {0};
> -	struct xe_ras_error_common *common;
>   	size_t rlen;
>   	int ret;
>   
> @@ -183,12 +183,11 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>   		return -EIO;
>   	}
>   
> -	common = &response.counter.common;
> -	*value = response.value;
> -
> -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
> -	       sev_to_str(common->severity));
> +	xe_dbg(xe, "[RAS]: get counter value %u for %s %s\n", response.value,
> +	       comp_to_str(response.counter.common.component),
> +	       sev_to_str(response.counter.common.severity));

Why the unnecessary change?

>   
> +	*out = response;
>   	return 0;
>   }
>   
> @@ -207,12 +206,20 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>   int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
>   {
>   	struct xe_ras_error_class counter = {0};
> +	struct xe_ras_get_counter_response response;
> +	int ret;
>   
>   	counter.common.severity = drm_to_xe_ras_severity(severity);
>   	counter.common.component = drm_to_xe_ras_component(component);
>   
>   	guard(xe_pm_runtime)(xe);
> -	return get_counter(xe, &counter, value);
> +
> +	ret = get_counter(xe, &counter, &response);
> +	if (ret)
> +		return ret;
> +
> +	*value = response.counter_value;

Does this compile? I don't see a counter_value in response

Thanks
Riana


> +	return 0;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index fc496888b3f8..befdaf297103 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -155,8 +155,14 @@ struct xe_ras_get_counter_response {
>   	u64 timestamp;
>   	/** @threshold: Threshold value for the counter */
>   	u32 threshold;
> -	/** @reserved: Reserved  */
> -	u32 reserved[57];
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:9;
> +	/** @has_info_queue: Set if info queue is available */
> +	u32 has_info_queue:1;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1:22;
> +	/** @info_queue: Initial info queue data (first chunk) if available */
> +	struct xe_ras_info_queue_response info_queue;
>   } __packed;
>   
>   /**
