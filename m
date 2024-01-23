Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA80C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 04:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D27510E122;
	Tue, 23 Jan 2024 04:59:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289C10E0DF
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 04:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705985986; x=1737521986;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SBVj/5X4FIJsUBYCm+lz0kvMAtyNGzVHYHyKCTKGKow=;
 b=Ffq7rFV2LfJ3EI/R+E/wf3QRSfGaLjWbvkeQfakfwztoqpDxqOKejj90
 f8GVbJNLVY6rU2sKuL9YIS9wgVD3ovOWiyfKdU05rwmEa+BWkYP5At8A9
 +t7OlQuz/SBJHpkqnkite5K6JTk/ZWug2RUhyX9WJGBl2QTMeaFqtXvrP
 ojg1xdxB+bA9Sm0ZZ24sHAQx+733mMK4dljiCbtrwDrFAABsM1Nr5m9BJ
 ci8QD0YCQOx8SjLKAhBgRCCfEO87q9GEINY1EcosnGWUp818tukYilquh
 HSFDHUxriAtn7KV5IIF7BqqC2We5r8oXRBWoHvFzvHAkHSLHk1xA7eq0y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="398564170"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="398564170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 20:59:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="20210482"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 20:59:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 20:59:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 20:59:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 20:59:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9I4iFg88HKurGPJAo3rg2Hc6jPl0ThPL5f0E9b6DLt1uKtC9n8QIBeHpW+8Heu2zzn2UYwm4PfvXiwQKQVM8rIPsU2OJMxMk0EI2005StAvi47c9JjlwmRGPgMQnoY6TQ6VRlY1tHwIm2AAxHolT8lEUt+FY/yetBn39PyBvfbC3qqVD5VZ0v/6CSX/zLpmtvEBTXaOsTKUdqiY+2ER9hZnm7GkJfWpHuYzzykcXnbEYVDgnw2tPYKVg9VVgUxDPoBKyfHKhF26TUHjQua+CoD+gqARHQJnYnq/CYtgtvdtFmTqQtwJ9YKXIStxqUBrcMhsDQnsy8A3SaXDJHer3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PQfgbQHbr1zcvbgQWSwpPOT9XfCIG2w2WLF768mpa4=;
 b=ZUrHxxeDv7y5B76AUiemC5fTGtbvon4MlyMhiVKdQxvtzYNm9zxI8R1u6RyY/jLVGSCOzJYmfhyrTr7C/ulR7QwBF/p8/EOKBH/KfxcHj7G+HqtRfEhdOha/ABriFomwUX4Wbo4RjdHFbxJJZCx0/DoIC1ihDE34H95k2CN7gHpSnH1t5FV4DOzsDKChIJmLGrnuuRtrbcWSC0Wjo4fdQZa+s3fO/jjDP+9sDbCNY4vW0DN/jHuw1C7vqoXMXuoWRkCujwyTwcUAIQatVPR+HANWo/tmPfSOUeMJ6pY1MukkW4t7PMWHShxpWTBMA6QPcItrivlnxdDmVvgS4Jh9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 04:59:42 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::d3b6:7b11:2e0d:3b9f]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::d3b6:7b11:2e0d:3b9f%3]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 04:59:42 +0000
Message-ID: <9ade12f5-d9c8-4d94-be02-d3980ceaaffa@intel.com>
Date: Tue, 23 Jan 2024 10:29:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/xe2_lpg: Introduce performance guide changes
To: Matt Roper <matthew.d.roper@intel.com>
References: <20240122054904.2111721-1-shekhar.chauhan@intel.com>
 <20240122054904.2111721-2-shekhar.chauhan@intel.com>
 <20240122163304.GA5506@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240122163304.GA5506@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::18) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: f194c429-c32c-441e-a162-08dc1bd01c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCvXbT8zh5HyR2JKb+pt4+Buyo6JZaWNbznoqqDNrKS3w/cfLl1rIrCaXVB1k2+lz2TqIPCoY4YbCjVtpag6T7zH+uFaeYoD0CuESBy45s7XZHiLl3MXh4Ro/GaC7/i4OWrbqq63ETDeyERBblNUl9IixZXyFZLAadEh0GHRcSmFsxlgBQl5eac3K3jt2csenpSxmUEfmSEuclSmVkmOjiVAVqBTxLhA76NV87kH5d7DT5XTiIzBkkRwFh6ys6u68JojzYX5kKxAkiTW+/Yx5zE4nb12OeZuy8c/ZtPGElTQAscRzZxvrnWT9BT+MGXHHur8TQ0Hn7RYiK5SXEoB/1h+b34Z3QJ7rqkJukTUDzbUR0lw4TCJ1Nm8Xf8i+rcdTOyU7FSnb45qlaHrbalgSOVVPDanjpvHb6XW41p6BnVlWnNtE+cI/pUH3IE67o9Cft/9CSFQVehVGWbee9ZP7wCS43+oLyHM9l0OY5PX6xGk+h2wXjoUaErJMdWfb/KyDCO88RSwKRKVMHNL86+9ohlVg4sHctpYUI5NvehYqc//84YosBf9MSzxyF3aBJ9VVIYHYB+O/wcr0BxTERc1yi67uvgWtLdybhrc5q5eFYKQvsrIYzdanOkFoAJznAa8vyFD1no4Fqfr091w80BAWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(376002)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(6506007)(53546011)(6666004)(41300700001)(36756003)(6512007)(2616005)(5660300002)(316002)(6636002)(37006003)(66476007)(66556008)(66946007)(82960400001)(8936002)(8676002)(6862004)(4326008)(478600001)(38100700002)(2906002)(6486002)(31696002)(86362001)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRzS2VTdFZoYkd1Q2ZSN2gzdW9BSGcvcnpWMXc3bkhKNW1lakdkQU1rWExi?=
 =?utf-8?B?bnNNNnVXekc5Snk1NEhCVDQ0Z2dQRVpNdG9QRnloTjNORkVwaDB5Z0s5UWNO?=
 =?utf-8?B?WUJMbThXVnVJMllNSkxOd20zVExIRzRTRUtPSzY2a2dYVUdVTDdYbmVJWVZy?=
 =?utf-8?B?Q1VueEl1eEU1YjVhZlNWMWlrcmUrSnp0WDk5TWJTT0ZiVm8vR0hEN3hhSlZo?=
 =?utf-8?B?cHdIeTVhK1h6aU5MY3F6Tnl0Y2MrK2lQRWN2VWZ3UkRGUHp6NGxDRHJ5N01n?=
 =?utf-8?B?c2Jqb0R6OVgzeWtTSE41NFVsRldMVHQrdHRZNGJDZm5LeHUxMnBmR2JpR2pB?=
 =?utf-8?B?aW04VTZud2lhRGM1RHlSNWlOckVKSzBUTG51cytudmZHTWhKMEJHVk5QNnZL?=
 =?utf-8?B?Q3VkZWZzQkRoRnNoM1JEek9TWkhoTTZXaEFaM3plQ05rMHNSdEI0NU9oSXVK?=
 =?utf-8?B?OUU3ZnpseUpLbjVKL1YyWVFTYkM5Y2thVVM1aW1LUENxR2YvNDdkT3IwaGRr?=
 =?utf-8?B?MlFBVitZZ1BjbytvNVVJYU9mV0JYMGpXQ1puV0c3TU52M2w5RExVVUFmYm9X?=
 =?utf-8?B?WUZRQStUOVpweWxRb1RwMDJNWm1wMk9SQzNqL3hjbldCV2U4ODhYcms1c01k?=
 =?utf-8?B?Y016QWY3c29MUGZwY2pDLy83bkJwZmErbXgrc0s2NTdHUG92RGJ6VnZHRkd6?=
 =?utf-8?B?UWh0ai95SlAveHBHZFNXMTlsZm40WFpzVWRLdW05RlVzTUpMeGNuVkswclRW?=
 =?utf-8?B?bVorZmNpTStJaTFINy9kYVo0VG1OK1Y5R1NhTGpyZUUvam83bkt5Ky9pdXVO?=
 =?utf-8?B?bWNoY01zZC9kVTIwRk9qUXUraFR5elVVNUZpS1hHOHZRNXQrRmsyNlpaQ1d6?=
 =?utf-8?B?TlEzYzBrNEkyOGtmQTJTYjNQbEE1S0dEaWJjN3dOdXlBODNCSmZ4VjZ5TURV?=
 =?utf-8?B?WXp1d0FpRkNxMXhxekJ0M0crbUtDVDk0TExQRHVVUFh6aDZBTjZCS254ZEpu?=
 =?utf-8?B?ZG9WYXFDcGFyS2RwSjBCbFduNW1MTzZSTzkySS9xY0I2YTlCNVhDeTFXSEpW?=
 =?utf-8?B?R1EyeHI1bDFhWHpiNnFEY1JwU0paUXZ5N1JSdjk0Q0hwSVQyUVpLdVk5TUNl?=
 =?utf-8?B?S282RStPVjFyZ3p2UnYxaE5oaStySktVRmhkYzVIOSs3K0w1aVBLZHNKUDlu?=
 =?utf-8?B?M3dSVVpNaVNtNlpGbXJyYktNODA3YkhwK2IreDltRjRGRGRYRktZOVA0ZjJJ?=
 =?utf-8?B?am9iS3VQcnFnWVIwSVVYOGhMWC9MTENHMERPUFhxNmtQR2F0RU1TSWp0aFYr?=
 =?utf-8?B?SlpSZWtxVTYybWloWURubVpzZzFyNHFSOCtJTFo3RmErWHJzNTRmMWZqUklk?=
 =?utf-8?B?ekwrVXdCU1MzVTFiUHBKR2VHRXNvQXkza2huT3V0cWZldjJNdnRncG9hS2lV?=
 =?utf-8?B?SXRHT1MxNmQ4YlZ0bkI2Vzh4dVczMi9Ca0EyTmVjdUoxTEsreWxMajVDdGxI?=
 =?utf-8?B?Zi85bkN3RGE0QlBLYVAxQUdmbGlkajNiK0ltc2pjOElUMFo0WFJYVGZ2Z1hk?=
 =?utf-8?B?R0JxS0FKSTV3dWdXQzdlcVBiWngyU01XcTVONjJxVjhoNFZRVUxMQm11VG1p?=
 =?utf-8?B?RnVNNUVwdEVWUnlSQ2t1cVV2cGk0M1AxdkxSYjlIT29IMTJpdzBmdGhiNzVx?=
 =?utf-8?B?R0JWRXVvOXJqaVZDVWZEbXZQaGIwMXRRaXhYdTN2bDFyYU1obldqWnJvcVdG?=
 =?utf-8?B?Z2UvWm01M0JNYUFPaVZtYUkzUlVQcllpaHFsMXpRTWpwTW5pQVJvNEJTZm1q?=
 =?utf-8?B?dllldVRnU3lyWWJQenowc2JlUjJxTVd5ampiZFNWR2ZnbndmSU1xL0lrWVRF?=
 =?utf-8?B?eHRIUU54Yy9wcG1ROWxPdDdyVEk4cXNVamhoSkFJL2dkOWdPWDNhRzBSbnFV?=
 =?utf-8?B?c0pCWW50TnlqeEdBZk4xcWZrK2VKdk1neG5YNjN3bHdmVU1mVEdmbFoycnR1?=
 =?utf-8?B?VldtNk8xYW8wVCsyTGdmRWdiVmRWck9kOXJDYjZZaWZ2SUVQUUhNVVNKbWlQ?=
 =?utf-8?B?RUNvNGgxek43NUY4U3doZFNMV0FTZ2pLUnFjNmRkejlRM0x6a3o5VjhSUVNE?=
 =?utf-8?B?OEluV0RQQlFJUjQxaDBqMFgxb3dOK0FpWVVrSmc5YUhZRU81RmRTN0tRZTk2?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f194c429-c32c-441e-a162-08dc1bd01c30
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 04:59:42.2659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V59SHOG8GYZJ9aBhn8IEo7HExaobx41CvWCmcNJF3UbNLyIglZowhr8nz3lM4e7VWlfVVSj5Iaw6ykvHMaJVy021SEq0PrfeVYjzZ6Gr4WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/22/2024 22:03, Matt Roper wrote:
> On Mon, Jan 22, 2024 at 11:19:04AM +0530, Shekhar Chauhan wrote:
>> Add performance guide changes to Xe2_LPG.
>>
>> BSpec: 72161
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ++++++
>>   drivers/gpu/drm/xe/xe_tuning.c       | 9 ++++++++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0d4bfc35ff37..cd27480f6486 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -144,6 +144,9 @@
>>   
>>   #define GSCPSMI_BASE				XE_REG(0x880c)
>>   
>> +#define CCCHKNREG1				XE_REG_MCR(0x8828)
>> +#define   ENCOMPPERFFIX				REG_BIT(18)
>> +
>>   /* Fuse readout registers for GT */
>>   #define XEHP_FUSE4				XE_REG(0x9114)
>>   #define   CFEG_WMTP_DISABLE			REG_BIT(20)
>> @@ -289,6 +292,9 @@
>>   #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>>   #define   XEHP_LNESPARE				REG_BIT(19)
>>   
>> +#define L3SQCREG3				XE_REG_MCR(0xb108)
>> +#define   COMPPWOVERFETCHEN			REG_BIT(28)
>> +
>>   #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
>>   #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>> index 53ccd338fd8c..3ae1c0622c32 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -37,7 +37,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>   	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>>   				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>>   	},
>> -
>> +	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
>> +	  XE_RTP_ACTIONS(SET(CCCHKNREG1, ENCOMPPERFFIX)),
> I think you meant to use CLR instead of SET here, right?  Since the
> setting we want is the "Disable..." line item, which turns off bit 18
> that the hardware already has set by default.
>
>
> Matt

My bad, will address it right away.

>
>> +	},
>> +	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
>> +	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>> +	},
>>   	{}
>>   };
>>   
>> -- 
>> 2.34.1
>>
-- 
-shekhar

