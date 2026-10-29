Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A1606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=je6zOW69
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66F21120A0;
	Thu, 29 Oct 2026 08:12:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC18D11201C
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793261526; x=1824797526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+JbSzLcNVAGwQel+3iaXHw9DCykXVItPA30cfJx9icw=;
 b=je6zOW69eqmk7uHpzrK1iRwASp8mCYrzCDreJHkwUhMfiMhu3X6550eB
 OrfYgv3XWf0ni2SQKx2/k7eHcjnMJD3lTD1QhHMG6drruLh12NwrM6PUC
 JIWHOhIq0+4tbbclyFJ2zOYlBtuM8Kuiyg9QJa6pQKpCOkFuKPoIh4J4W
 uvlr+F77268eu6pGt+FRK+2vFlvxQReouXlAwMZ69CQTM/xzxGh24KjRt
 zOqGOvzlc/TRHgdknsmQTILU9ykMOyMz+R77C51olaf7vQuATVoZMaT1x
 VJzq0wL8vSjuXyI6trcS6WyRHu4j3a9CLHTb8jKjBwATDNkS6yduUhYqV Q==;
X-CSE-ConnectionGUID: 9FpgfWGMTE6BxWzLGmxQwQ==
X-CSE-MsgGUID: QMFiIRM1TIW70K7XLsJ8pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991123"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1991123"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:12:06 -0700
X-CSE-ConnectionGUID: SJ3ijPPWSKmEmc0gM00Qow==
X-CSE-MsgGUID: RfXudG48SCi//jXipf+wKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5403362"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:12:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:12:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:12:04 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEjBPX9ddMxskDAfvnm2mw5GHU6PXAJOkyhGi6H6Ch4wNAIhfQn+K5Wxn/m9CIBwOBGwX9xOkOD5n8ozpvbDZtjQzuFEN4fp7nU3Y2U0WK3HySyosSkqBLke5cnOJj0r+v9x1bGbo+secGYuzy5WDTjQiKGTl2z+a4+fq7jgHiVNJZtvLMXLJIG/wwk+1tHwbRp4xFKnGHAByRzzutk58AkInv7JQUycu+tteMhOiiiML5zP/mrDtfQ8lGBWnw43S6yo/bHiMnVFdKGaJVPj2dowx0mUFL2KaiiJzpCegHLNfVWoehLnqmpbTN+ABF2RgysVNuAJehI9cIGTvOoexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAj+q6IPrdathKbNI+W+8GAloB+yUuy7TOsPX95LHTE=;
 b=dtTiEpaTXreIX+3PrhyoNLq07GHc3x7sdUtG7oXJrDXHCpfEKqTNOfqZXS2oevzrbA9QwDnnwtmS6GuyxtdIiKVILRIZ3KTXvhqfNWrQQIvMRnqKBCe3Oiw1wr1boxPiUQUm0Ku5N+VWLCF5DmVWPY8qYOoxgXfb6KYY9YgbKMmSPHLuleJQI5OWYhg+ewsAVdP4n2+tnOxGEtXvqyrmX4M6UhJE5TDqHTBOmW3OFYj+2fWWMQKgiziW7UFCRge7SfCqWnyvH/ZSWEK1MloEWivFg04rHC0qhT/SKeaLp6fDIWsvKW4DEOm0Fd2IKesWsGbl/3p+gtGKT+e3WYlYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5000.namprd11.prod.outlook.com (2603:10b6:510:41::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.18; Thu, 29 Oct 2026 08:12:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:12:01 +0000
Message-ID: <28ff1a66-479b-4c86-b24d-2b38ba139d70@intel.com>
Date: Thu, 29 Oct 2026 13:41:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] drm/xe/hw_error: Initialize hw_error_work per tile
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-13-riana.tauro@intel.com>
 <276d15ca-bf1c-4510-8202-4f2f8ae46f65@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <276d15ca-bf1c-4510-8202-4f2f8ae46f65@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e869f7-0542-4e89-897b-08df35944f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|56012099006|261026121527099003|261022075727099003|261021121427099003|261021123027099003|6133799003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9oxmsFGWEPECb8sBF760ShABScCvOTe+JhKH38B3kuOM5QhRe0RTdbmyp7abtuor1JX3r1OWmjPB73RRD1kmtp3ZtfihpZzLmOOnJNo9uu/UZhXwAXTY62HkcaAZVyYpc4ZNH6781Iai6nEqQI9go/6AkNI/hfi2tbkx3IyHK7gQdcUvu9QXOkpw2jhw1ybZsBjsC2/jWBvp0kQnhPWm8/0JHG2x0m0S0zm3f3x41J1l/dmbEbhRC/uFkKdA+bESFhPMUVVnmLQ7yhI2fh3ZLYUK1gdRAWlu0hVNEYV+L70ha61JLxVHq3/1JDg1RRMHJ3PtpfSUUv2wHgUIzq1JV58IeFfQ7+QST7/xLDHBnhlHgLcq2ELvHpIT5QMet+p7JTayiFviip1eTX46JTgdEkzVD3n5+1R8cdK0vc9PCXFcoFeWcEP/tv/N7727WH8WgEUKC+f79NI9HOCySF41nRMNmAQzSD3s+bi2AnGMRAiI7YFsLnMOP3lssxbQZyNCCrL5hOpVB/ZG2NBW/xtFKDyvThcYEhLGRlDsCtPGWnRil95PDhLrdLSCp+KqNwihX1ocswyWMazSTeFD3NxrpEO2IClXD52FpVGy665ldUbzdwdK9oV8FVLUpXY3Wlr2Rw7C+JiBcMFvehX3QKT52vX1boLd0XhAqjgu8JxtRs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(261026121527099003)(261022075727099003)(261021121427099003)(261021123027099003)(6133799003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU5nOU1kVFlPS211QnFrZlB0ZVZIbDk1TlJRQklJZ1VlNTBrN2NuZU1hbGlD?=
 =?utf-8?B?clBOMWpKQzZSSHhybVQ3L3l5cDFSV2oycUhtYW9wV2FmckJvTVdBWXFzODRX?=
 =?utf-8?B?QzNIalF3RXpiN0hYSUdoc3orM3N4RGZJdGpQL25LRU1UZk9oazM1UUVYL1FK?=
 =?utf-8?B?dnRHTldLMTBTQUphRy9IS29rZWN4dDVJYmowR0U2MnVCWUdaek1wWnUxM2x6?=
 =?utf-8?B?aTJPeFVPWS94QytLMmJhbGNhd2Vkc2lGZXdjSlhJNjNjUzJYNUFjRjlMemFl?=
 =?utf-8?B?ZnJ0T25iODUraUNCNzhOSFAxWFFDeStZMkhxVHcyUHg3ZEYvb0pocVVtVFNZ?=
 =?utf-8?B?cDNyOUtRdnFzajk2RXFXYnpHOXhsSWFLRXBZTVJpUDYwRUF2aHdSVDR3QUpN?=
 =?utf-8?B?akg2eUU1QzdoOXhBSHMySWdsRnFCVFNvYTBNdTcxOTYxbVMxaG0vZVlzNWRP?=
 =?utf-8?B?YWdwNy8vNHFEMk1CZE1ybEw2RnBZWXpXQnNjOGE0Qy9jM2RLWjBqU0FXMDZN?=
 =?utf-8?B?aFJvcDJncFlyb2lZUzlmdXpHUW1uSllwZzRqem9sazJRd3JSN3hzR1NYQW9F?=
 =?utf-8?B?Rk54R1BKMHBPcnY3SCsyRjJycWRRaTRDMWw4KzhLQTUvZGhFVGtRbmc0cW1W?=
 =?utf-8?B?N0JReGg4ZzRFblRzZEZkWHZCZUY0NmtxT25NRWZobXNtVmdKSG81ZHNKQmxn?=
 =?utf-8?B?bWQ2U0Mvcm1sODdSbk1MWForVUVWZjBaOGVTNnZPbWszUTJvVnh2Y1RjRFpN?=
 =?utf-8?B?WVhxWDZkc1MvVDZGVlY2WTB6TkNCTWhJcWc4L1lGK01seVhqTm0wMi83Um40?=
 =?utf-8?B?eDkyQ1ptUTk2OEJDMTQrNWxzdEw5RWNhY1U4K3ZacXQ1K2ZkdGN0SG1MTERt?=
 =?utf-8?B?WktqN3RJZHRGMFJCenBLK1pJRkRHRGM3M29vMWdyZ0xySHliT1VGRWJPM0RI?=
 =?utf-8?B?VS9tamNVcllxWDNCVVJlZmluSzJXWkJBMUx4aXJDU2NqZEk3dTNKRzNSYUdW?=
 =?utf-8?B?UGVobVptZDgrVkNyekljYzB3Ly83WFR5Umo1aWt6QWVvaU1McmNVaWlXZng3?=
 =?utf-8?B?ejcza3Z0Nk1iMDNTa0RTeTFDcSsySys3MnU0eDdweFQ0NENPM1JyNk1udHB0?=
 =?utf-8?B?L0orVjIzanJ5UnFkN2ZkMWhqUXRZZTQwbE1qdThUdXM2alFIelFvNVdXdll2?=
 =?utf-8?B?TjdwQmRPQ1VBeG4vSVdNWDJVeXIzS3d6VmE3bG1rd2V3a2NZN0dvdmVaZVRj?=
 =?utf-8?B?QUNObTE2anRCalEraURpMEx6SjZsclFjSE1LQ2dQaVlqeTNvaS96REhKK1FT?=
 =?utf-8?B?b2FNNklBOExmR0tEWEEyZ1JNaVZzYmN2NFUvbUdBeXBaZ1NhNVQxbW8rdFpL?=
 =?utf-8?B?dEVnNjdNV2I4bVJtYm15ZkN5bXgyb1UxMmdrbEdGMWFzbzdKUTdSMy9lczRB?=
 =?utf-8?B?cVk3VGVQOTV0TC81NFhJVlVWeHduMlBhOTNoV1VWK0F4dHBsMmpteUVuYm9C?=
 =?utf-8?B?SUYxblIyelU0d21pR25xbmNMUTNESW0vMW9kdmpoQXFPNFhoWHZTMnhqQkJj?=
 =?utf-8?B?clZCcVNvd1NhaEZHdDROcVhVdDd0dVgxYnpJZ0Z4YWJwTFZieTdhdGRSSlE0?=
 =?utf-8?B?cWhNMi9VOTVhOXhvaGtrVzJ2ZmNUWHJsR1kvaHNCWjNReEprYitxM2szUWhu?=
 =?utf-8?B?bzRadFlwVWJwa1dwUHFFakwwQ05nKzZBOWRtRUNTbDJmZVcxWDEyckQ5UFJ6?=
 =?utf-8?B?RmdqUVhyZWw5eElveDJTTUpmVnp0UWRFdlBYb0doMDM5VkkvZUxrS2xNMUhJ?=
 =?utf-8?B?UFFwdUtYSHFYMGpNemZZNjYvbTgxYisxTzJUZk5tLzduckdDcklONzNNYm5T?=
 =?utf-8?B?S0pEZ29DTHpMN0F0Z2pSeGRnQm1LVk5QT3Y2RXRBTVp5Mnc2Umlpc2dEY0ds?=
 =?utf-8?B?QjY0bzEzTHJBUVBqQlZ3UmlKWjdHMDhRcEhISXZzUmx5citBTjdlamh0akhP?=
 =?utf-8?B?M0RIL3pUMU44RkE1SEQvelMvQzhYSCs4YnhSU2xjZnYyWTdOUTYrcHlRdnFH?=
 =?utf-8?B?dkFGbEI1SnVvZHE1VXlRbVRMSzZLNVBWeEs3ZmVRN3IzZG5zK1RTOXMzOEwv?=
 =?utf-8?B?UVZSUm9YZXptTXJvR01lTlVYK3o4V3lLa1R3TDZXSEloMk85c29WaDdHUzB1?=
 =?utf-8?B?YkNtb2piY1JIM0NEZWdSTGdnK0hRc2g0djJWMFRqZHloVm5SaU1RUGNSYlkz?=
 =?utf-8?B?L09ZWktCRnMvYURnWmR6Qnd5M3AzQWVPalpLSzJIR0dYMjBOd20xaHJueVJV?=
 =?utf-8?B?aUVPeWZXZDdYelZkUzNkQlRtNllYeTBVSkdERjNlK2NCZDBHWjM2dz09?=
X-Exchange-RoutingPolicyChecked: AVwJSw47wJYAurL+7vHjyMPXsC9kF/kmAZOwjZYCZKPoUYxPkrjndiHMCrIo/V2VdEyEnuKI/xgnnoCnhcBWVG3AY/IfeUvruYaJ/4Y1YKGapkuqBwI5iAEHyqndylHae787CvbuimNyHtYijfkMxcseykVPxU7aTVTOPAQUGMfsMxpB0YYVskzx/yafH61bUsWiKquHUnMe3bRGEa2czpHyN7FepRCHyF7Y11+KcUXb0He6EnZOsUXusfeGHNcYJwyegt5TZ1cYLIqGU6TT+dVLTeQWDNgLTdXxROqa7oFz1ExHNVCk7iBZ7XWaVSMPUKAO90TE6uYwshHT93p5oA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e869f7-0542-4e89-897b-08df35944f36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:12:01.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sLgj3baAA+vn+gF9HeIDRgQ5RUp1wp7+jQVHt/v9buHt0nhiEz4f+kUlRbHS/fBQaO9LzbQDWIQ2eoUxa5Lzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5000
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 27-10-2026 20:21, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 11:35 am, Riana Tauro wrote:
>> From: Raag Jadav <raag.jadav@intel.com>
>>
>> Since hw_error_work is now being reused generically, initialize it 
>> per tile
>> so that we don't hit uninitialized work for non-root tile. While at it,
>> disable hw_error_work on fini to prevent UAF during unwind.
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>>   2 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 41ddd997478b..f7799c3c08aa 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -537,6 +537,23 @@ static void process_hw_errors(struct xe_device *xe)
>>       }
>>   }
>>   +/**
>> + * xe_hw_error_work_disable - Disable hw error work
>> + * @arg: xe device instance
>> + *
>> + * This function disables the delayed work for hardware error handling
>> + * for all tiles.
>> + */
>> +void xe_hw_error_work_disable(void *arg)
>> +{
>> +    struct xe_device *xe = arg;
>> +    struct xe_tile *tile;
>> +    u8 id;
>> +
>> +    for_each_tile(tile, xe, id)
>> +        disable_delayed_work_sync(&tile->hw_error_work);
>> +}
>> +
>
> hmm, we are disabling hw_error_work.
>
> IMO, if we see non-fatal error fires on the IRQ path (since it's 
> asynchronous), since the work is still disabled,


This is done on device remove on unbind. So by the time this runs, irq 
is already disabled.
There is no way irq will get triggered.

But there is sashiko comment on adding devm inside another devm. Will 
fix that.

Thanks
Riana

>
> it would not be processed further.
>
>
> Thanks,
>
> -/Mallesh
>
>>   /**
>>    * xe_hw_error_init - Initialize hw errors
>>    * @xe: xe device instance
>> @@ -546,12 +563,15 @@ static void process_hw_errors(struct xe_device 
>> *xe)
>>    */
>>   void xe_hw_error_init(struct xe_device *xe)
>>   {
>> -    struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +    struct xe_tile *tile;
>> +    u8 id;
>>         if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>           return;
>>   -    INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
>> +    for_each_tile(tile, xe, id)
>> +        INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
>>         process_hw_errors(xe);
>> +    devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, 
>> xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h 
>> b/drivers/gpu/drm/xe/xe_hw_error.h
>> index 5e3a11424108..c2c0bfa6d9f9 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -12,4 +12,5 @@ struct xe_device;
>>     void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 
>> master_ctl);
>>   void xe_hw_error_init(struct xe_device *xe);
>> +void xe_hw_error_work_disable(void *arg);
>>   #endif
