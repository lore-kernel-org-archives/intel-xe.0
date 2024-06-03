Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C56C25B76
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 10:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBAE10E15A;
	Mon,  3 Jun 2024 10:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzdjBaS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B4B10E15A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717412135; x=1748948135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OYOx1GyYGLECINN2I8fY/OF+S8XS8SjiL5NjSUqQzqE=;
 b=YzdjBaS6z8YYfRuU5sp1yXNtwNZeImySG2+GTXDXVbJuEUuLud7TP0b+
 iAAuHnDdvStw33qMlGnl4VReVl+6HcQPeM35njEI0HPkKKiLRVNUtDhvo
 dQdd+pK6h80jgxaLv5kEiftEvGJj0Cph/O3/UaxaMS1YJmF2lHfrgouZX
 Mk5SWHN8AfmLZ6zhXZyko0iqpPb4j3RQohXA9zSLZ+yihukM4FxHcsHzD
 3JWxQfYLegyfUErX/ZAgRMSL3WGh/RMAHCsz/2/rIGpy4feE5xit+LgP4
 bcE+aGNKJxNFCqKggQ8hghozx4ui34p/0vZfUKzptdGi1g/XGSwjOr8SK g==;
X-CSE-ConnectionGUID: iqjLISOnSl61Q9OLZ9i6yQ==
X-CSE-MsgGUID: 109pHb+STOiach+WUqE6bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13841290"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13841290"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:55:33 -0700
X-CSE-ConnectionGUID: 4NM3tP6TQD2J5xtChraRxw==
X-CSE-MsgGUID: obsuMTggT7CsoDtti8aRRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="37292481"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 03:55:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 03:55:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 03:55:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 03:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0kWOc2m8Z142TSvEOeDGOzpiC5eSTfvW/WapopQHHWmTEJuc8R2s+aDBOtsUP+6EepJHHI7keanvTtaElqPDaNNY1XnbVnYnIJsqKqBe7EnSYxgU1BoQbwBFH5p2Q5+S7D8j4ZGzor8UW2HA6I9XehVz3ejuDXF11qmgXjYk42QEhCJ9cUpVkrCME2jOzFY4Zc8xCtqNh71CYY2vRdUjGuVK0OrOSH9Jkjzu3yeMUVZ730bZ7FCvzdfo/JP7TKt+8AimIj7G5fWNQSoT1AGgXt8oqE0q/4QsD9wtQXGEmiKzPdaXBs7qDfu9Gadxt0ocOEHas2AjSiR2/kOtU3hFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhuFvth2z1mMv13+XobefHHeBoJn17Qg+IfbkBrfQ5o=;
 b=UpOUg9cx4XjsYV2BzpraCtmi6iN9PqcyB90dIFUReBm2N0PrPFMGPHdmgdC7/cbaW+gfmtbu0bZtvsINNmdGsgaeQAwB6cmLq/aWbq0o2JfLqhuOSHmsLDisfZr82t55zqrpk7YocLInD0/7Ml1UsKWfPDHdQPNurgWKeY1q3q+lc6aMCv1vwYV+HG2ia6l/Uf80jLftfIbpCEyIrXg43mvsR6Ns7OIns2J0KAxUVMmAMHTNGC/YxzklPOaxNnRZC/ppmz6rxunOXxbyoDaC77rlPdpFWylM4cB3RISpl5fXLeO4QoZmQekcXpHfhvDWNNsUPXQ0cjAWIDmlv/CAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Mon, 3 Jun
 2024 10:55:30 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7611.016; Mon, 3 Jun 2024
 10:55:30 +0000
Message-ID: <227b34a9-1e5b-4f29-8347-d34ba7359d55@intel.com>
Date: Mon, 3 Jun 2024 16:25:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Cleanup force wake registers bit
 definitions
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b6373e-f98c-4408-8c9c-08dc83bbaf6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TytmTzJrcGJwSTByMFc2NGxZNFg4YzZpNEF6dWtZSzdYdktITzdmK2V3aElH?=
 =?utf-8?B?M2plRUhVeFFJZE90b3pMQkhlQks4YWtxYnk3OW5ub3dkQmFpK2tSTmZvMzM0?=
 =?utf-8?B?cEVqY21vZUczL3R0SENkWm9GNHRhVjBJOFV3bTRJbDd6ODZkV0c3MUcwa0Fl?=
 =?utf-8?B?VFdpclYrUDdDOVNZc21GR0ZrNjhBeWZYeXlPK2pubnpkU3dBcWQvN2dLRCtB?=
 =?utf-8?B?RTczTE5yaUhuNWhLNnFyUmhhTnFlVHB2eVI0TE0zU1NITzU3RFNHbWM4d2RR?=
 =?utf-8?B?elppamlBQ3gyNnRvK1l5b21HME4vOGNoQ2FQZERieHVPQjVYU2dUR0ZhRFVv?=
 =?utf-8?B?RUpRaHZNTFlTMlhjSDNaUlh3MTFwWFhUb0dIdlVpQWVWQk5EN1lOaytrVU9u?=
 =?utf-8?B?NVNFcDdKczZFeUFyZGJVNWlicVR1aTBiUGc5dHdZM3B2QmRlT3draWFTVmV0?=
 =?utf-8?B?R3pZYXVPd1ZGQmFUUlhBK0R1NU5IL2pnNXdwSlBQZjRiUHZ0eEJvNG5YdU1D?=
 =?utf-8?B?d2FURkJzcXJxakV4S1M4SXBIN3BEWW1rMFY1UmgweVdTSHNkSmM4V3pGeXFp?=
 =?utf-8?B?cUpwNTNQaFVyckRIbVYrVnl1NjQ5aXJLTUtNUVZKZDNMZTRjVEU3bllCYlJD?=
 =?utf-8?B?NnE3Z0tObklmcER6Um5GTHRjaW9QY1FmQ2FJRi9YeUd0bWVjQTdTZERVS3Nk?=
 =?utf-8?B?N0hnbkN2b3ZpbC9ncGJrbDJXejRnYkdwa1JlaEhKMTIwb083T3JJVk1sdUd6?=
 =?utf-8?B?Um10c2NCbE14UGhYcytmQm00SG5tZ2Z6L2R1TWhoS1RaMG82QVFXbDhLWFo1?=
 =?utf-8?B?NzJxVzBYbE51c2RMY3VxV0lucHZHT1RhZWI0aTJ5bnMyWExKNTViV2JRMGdB?=
 =?utf-8?B?YTJXMXM3bXBZRGhISFFCYW04ang0dGlSTDhrRkgvMlYxNC9OMTFja2VsOUIx?=
 =?utf-8?B?MGFmSk1rUEozZHBYWHZqTG1VR0VHL0daZGFVY1ZhVmNXT2tXMDE1cjBuNmt0?=
 =?utf-8?B?WUZrbEovbzhXcEEzRTc0UFFnbmd0OVNseWFwdWlqcVNHbzZqcHJBOUVWRHFz?=
 =?utf-8?B?ZDg3d3dUbmhRQ3VYL3VuRDFjVDF5MFdlQ3hYUjhjL0swcHlLWFM0Tk5icnF1?=
 =?utf-8?B?ZlRRVGxzZHROb3EwV09qV0JQd3ZuNjRyQWo4WGpONG85RnZ3WWo5WUdnalk0?=
 =?utf-8?B?VEdJb0NwVW94TGtqM0ZSMk9MRkxQRWJONnZRaEFEK05NalFMUFAzSC8zWmla?=
 =?utf-8?B?Um13MUJMa1hLVzI5eDJNbzhqMzkwR1hYdkxOdHdYK3ZQazJZWU15Uk14TXdY?=
 =?utf-8?B?R2habC80SEF4UVZnOFhPOC8xWXVNcmh2TVJpMlR4Kzhjek5oSUgzM1FWVXYx?=
 =?utf-8?B?bENvN1FkenpDMmFxZktMbVg4dmhRNnpvZXZVNG15aWVOcFBOZ2VJQTI4a3JW?=
 =?utf-8?B?YnowMURYcUw3ZXQzS241R09nRTZZSTVPb084eXlZTkZ4OW5uMGZReDZ3TWpJ?=
 =?utf-8?B?dnI3b3k5eW5sNXNRNmhyaWdBd2hWRkU4b0thRk1EQzJlWHAyL0xNLzZlR3lO?=
 =?utf-8?B?WXFoNWRHVko2RVJacVdycGwwTE15czNUWE5uNndXQWxJbnRGRS9MSzFHeDQy?=
 =?utf-8?B?SGszTVgyTThOY0toNGpZL1Q3dXNDK2d3V2Y4cDMvSlYyK25mMUJLL1VzSHBj?=
 =?utf-8?B?aEZSVjlYQTJEUlpqWGJSaVIvQWVHSE1WTEdURUZSLzZSNUJRaWt6Q0RBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzZ5N1NFa1Flb05LMmtTdmZjalJUZFNXY1pVOVpKVFM2d3JqMGdITUdXekRu?=
 =?utf-8?B?TFJMWFBPcmQ3UHRNZTlLcEh4UmFiRTBVNlZrSVl2MnpFZ1dxUDh6VDM1ZXIr?=
 =?utf-8?B?QjZSeW9YcE9oUzh0UHA2WkxOMkR0M3gwSFlMY2J5V2x3WFpUa0lMT2dSN0xP?=
 =?utf-8?B?NlBTL1hFMEh2cmFQcVhLSXRCSkk3bnRTY0RiZ1ZoLzFsS2Zwa0JWY3FXZndW?=
 =?utf-8?B?TitaNXdWRFdGaE9uTGQrdlNlcXprTjByQ0RneVArQW9PdFkvRHZacWJ5Zkpl?=
 =?utf-8?B?RDZvNUgxMEpMaDlYYTJpYmtRM3BrZHhoMEFRQW5jdjJ6RENkYktkcnpNQkk3?=
 =?utf-8?B?UFhBT2ltd0gzL1NSWlNVN1FWNUJCUnlldC83dXYzcjd5K3NQT295U3ZKOE8y?=
 =?utf-8?B?cEl6WHp5S2RIbVNocFVpR3ZXTGtMeG8rUDRzSFFyZlhMY05mSDhuNXg4ZnhS?=
 =?utf-8?B?TkVhQ3RCdDM5VTJjaUk0bTB1VHh3QkdtekVDYW5SWTVtQno4bWF3STk2QWd6?=
 =?utf-8?B?Yy93NnFSQ1crSXZIK3VzQUdNUGNDSi93bVYzVTlYeUg5NkZuUjhsL05aemw1?=
 =?utf-8?B?RTdmWXIxbjdVL3QwbmhZeVB5L2xXZHBQTEJlY0loTGZZR2J3VmQwMnBTdUFm?=
 =?utf-8?B?dE9MQUVGVTVmb0F3UERWRk5tZHdoTHV0YnVNb2FpM3ZTOVVMNC9mYzZNak5m?=
 =?utf-8?B?cTZvT2xkaXNaenN6RnJ5aEtMakRDMGpxMjd2MVl0bnk2T1VOQVBLcmoyTWFC?=
 =?utf-8?B?NE12YWxWMTh5ZCsyS0h3dzFobDFhcHVTQXVkTzRxVlUvbmUySm9ubWVhMEJz?=
 =?utf-8?B?dkZXY1Y1QzBuZnNvOVhWYzZZUEkwTjR4eFZITEFoUkRIbUJlei9HcDlPSUow?=
 =?utf-8?B?MVYvWXM2ZXpuN2o0bkhTeDNrOE90OWJpaTFXMUlZWUNhS0NEb2VzUE54T0Z3?=
 =?utf-8?B?THlvK2Z3Q1phQkZrZldLeHJyTHdETEJUZVB3Zzdhb09CWjUvc0ZZRjVOa3dJ?=
 =?utf-8?B?Z0tUUytRTmpVTGVURDJkTGE0ZzJSMngwdE9IZGpybkl0eWdvUEhsQW55bWZI?=
 =?utf-8?B?VEtPNTVMRlZFV2czU1E0WkpkS2ROTmRWVG9FQlVIUkE3TWlHT0dXa1NDQ24y?=
 =?utf-8?B?VkE2MDJFV29jL0VOZXIvMjFUOVM4Z2h2S0pRNlNocEJ3VE5BOUFMYTBzeWl3?=
 =?utf-8?B?eW55aHlxTUlSVVRmc2hLclg3aDhSbEppM2JoRTFBQU96T1pqc0hITVozL1FS?=
 =?utf-8?B?OVp5N28zOGZSbEwwM0tYZ055M3puUWE4TWxRbFZtQmZkZVpxRm8zbU5JYzVt?=
 =?utf-8?B?K2FEL3RqVERGcC9Jelh0ZDk3RkY1dWNZck9tVDU1emQzYnNSMk1DSDNnemlY?=
 =?utf-8?B?TlZwQ3VPajNZOEdEQTUyU1B5SWtrWGhkSDByd2dXR1dNMk5WTjBvdkhCa3VQ?=
 =?utf-8?B?VTBYdi90amtZNzBteFMrZytrRXk1czF6S3F1blpDSnZDUUhtR0tTRVVoUmQ4?=
 =?utf-8?B?cXYyQVk0ZVRTUVpJMUt5Z1F1Z2hGbERGRDRGNFBpQmVDV1c5TyswUUUrTVdB?=
 =?utf-8?B?bFhiN1YrZnBtMEhSOUtOdmUwK3l3QVJ3ZGRUenpaeDQyN0hsdVh0VUtHcEpB?=
 =?utf-8?B?Njc5dkY5ZmJtZ2RMeUVaOSt2Wm84M2V5MW4xbmJsUy85VnJvWTNXUEJETHVo?=
 =?utf-8?B?SFRBcHlTamlKM3lPR3FManIyMVY4c3E5czQvbURiOVZuOUlsdzdQeXJtTE93?=
 =?utf-8?B?bTBNUEY5eDMyTGRTVkZreHlvaVFpdXI0T2NHZUxJWjA5bVowcUlkYk5CNm5C?=
 =?utf-8?B?blVSdXZNZFI5ZlZyaHVQdHEvVGFDakYwN2xrOG94bFZ0OStMdjNURzFYOE55?=
 =?utf-8?B?VmJqOHU1dEZOb1VXV1VvT05PYnM2NldjU2hXZmxEV2t6L0lBeGpyK2s3bGFu?=
 =?utf-8?B?eWNVYUEya1o5QVRoZzBHVnN5d0R2SG9GamI0YThFbXhyNjNoTE9TTlZYN2ly?=
 =?utf-8?B?bW04Q1NvRi94MkM4aWVoZ08zdUJzK05vZVl6RkRnVFlqQzJmL3dOcmdUcWZW?=
 =?utf-8?B?SExKMXU1RkQ5UGQ2N2NxZk9BQTcwVzNhL0Z0RmZmakYyZVF5NTgyNmxKaVdC?=
 =?utf-8?B?NTZlRm1sTFlnWUxNNHRUTW1aanBiOHp1czRTY2FvOFovK05kNmJSSGlKWFBZ?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b6373e-f98c-4408-8c9c-08dc83bbaf6a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 10:55:30.7882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7QfYl2QmvHzjT1KmVDgyUc01z0Po+OSBRR5W+A5s7CJBofzp4FS2OV7iC9dpeVGdc5JnIzPO020wjFSz8mVVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
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



On 03-06-2024 14:31, Himal Prasad Ghimiray wrote:
> - Remove unused bit definitions.
> - Driver uses BIT(0) for waking/sleeping the domain and since the
> registers are masked respective mask bit BIT(16) needs to be set. Use
> defines for these bits and use them in domain initialization.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 ++++---
>   drivers/gpu/drm/xe/xe_force_wake.c   | 18 ++++++++++++------
>   2 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d09b2473259f..441747f2d28a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -487,9 +487,10 @@
>   	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>   
>   #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> -#define   FORCEWAKE_KERNEL			BIT(0)
> -#define   FORCEWAKE_USER			BIT(1)
> -#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
> +
> +/* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> +#define   FORCEWAKE_THREAD_XE			BIT(0)
> +#define   FORCEWAKE_THREAD_XE_MASK		BIT(16)
>   
>   #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>   #define MTL_MEDIA_MC6				XE_REG(0x138048)
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 9bbe8a5040da..64721c01f30d 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -52,13 +52,15 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>   			    XE_FW_DOMAIN_ID_GT,
>   			    FORCEWAKE_GT,
>   			    FORCEWAKE_ACK_GT_MTL,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>   	} else {
>   		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>   			    XE_FW_DOMAIN_ID_GT,
>   			    FORCEWAKE_GT,
>   			    FORCEWAKE_ACK_GT,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>   	}
>   }
>   
> @@ -74,7 +76,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   			    XE_FW_DOMAIN_ID_RENDER,
>   			    FORCEWAKE_RENDER,
>   			    FORCEWAKE_ACK_RENDER,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>   
>   	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>   		if (!(gt->info.engine_mask & BIT(i)))
> @@ -84,7 +87,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>   			    FORCEWAKE_MEDIA_VDBOX(j),
>   			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>   	}
>   
>   	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
> @@ -95,7 +99,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>   			    FORCEWAKE_MEDIA_VEBOX(j),
>   			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>   	}
>   
>   	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> @@ -103,7 +108,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   			    XE_FW_DOMAIN_ID_GSC,
>   			    FORCEWAKE_GSC,
>   			    FORCEWAKE_ACK_GSC,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>   }
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   
>   static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
