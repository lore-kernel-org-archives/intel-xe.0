Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF89EC79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 14:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67A910E156;
	Wed,  9 Sep 2026 14:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnapVhjw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498C610E156
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788964095; x=1820500095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/IWb7BqNZ1ZPDsy4EcBRUo55V0c2be+QBRnBVazzLB0=;
 b=XnapVhjwAg3rR5aJi+XrfMVM+rhE4MYWTo7UOS/lmuuqzpeqtwKp32i8
 252dVSbHmo0fEtWpvMjSsTjMSCxFSa32uXSmwiExL6fH8BrLxh+tbokta
 /WaujnU261ASG1madoL6Wclue7RM2lwMiRMxS96Dfx/oW688eHACqR7Wm
 V/0aB8hCTWqDK83iA53ZW7xAKWPaJi68NlNNydv8vg3RQNX+/2FmnOxpy
 t/CtA9/L8adT1JdQKM9670WjqkQ7LyystQOEI9p+lw8c6ykaNIP+UsUcR
 DrNbyuqH+jnFKq8enLqjuN5jzEvjGYDh0U/2ISK6Nh7aSIFJBzs6GrGMv Q==;
X-CSE-ConnectionGUID: 3VGtCp4lQ5OY+NtiLUQQsw==
X-CSE-MsgGUID: J7cSgAxaSZuHeKXp/skqug==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89432975"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89432975"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 07:28:13 -0700
X-CSE-ConnectionGUID: 1bLqWRRjSW2ajlqhn2kppg==
X-CSE-MsgGUID: Wd4iI7r0QdOxmfVa2/VYyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="294838109"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 07:28:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 07:28:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 07:28:10 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 07:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSBdzB0fSuwzrB1bZBizt/PmIsc7L9yYlvfHA28RtZpQNQ7dngxlPzV9OPxLhO1BPRUVY4bpfec+py7B7YYAgu4u0td86wDS9I6p5y61FyNHHP9gWCKwZACJwUM5yIJImQpjTMupf2IIJugFCd2WM1LAkZbw0/wwiv5960tVmSi9Tvl87ztgzVjJoRv+vtja+EeqUa2DfiF6UpBefIss+LCNt76/syvp3MTBbcw/CfD0xYZq2ThnYLzu6yzXbY6ZdbwUIgEqvfCCwsJ1xe/YSYp1vnnihSyxFLxKwKvTw3wKwnM3XQi7MB42EA7SO3d+BUuuhY5a4sM+pYpGYg1g+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7vfmMfZ8o2FX1ukCihtqiRda/CyxlHXIJM1PHSGbbg=;
 b=UaB3OZtiE8U/xcL6hrqE7sZU9iU3rvn6vQofgUBQcvA6D4QOQ/UWKwzI/j7RdMBmLG43Ag9c0DvBTzGkdoiUoHR4bGXdgHjVJD+QQodaXM82Zj++yTKv0VgQ+e42Oav+iUwL5I2JWQRpnzWBAwY0loEohDOkMtuVD0Cn9bg4iezZif1JKjuv4+xJf8xMhf4GL8+jh6dqfqXvQghrlk9t/uXmGFC9WE899heB+6wR9pHzcpkwRsDsI/Gn04eki4GdhD3fUzGhNQQ9QIrp7u2kKAZSMkPys2xliMTzVRKgHhCE1B/7VjpQlIHXJcj9nMYhUR7x6IVwty68bmf+7XaGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 14:27:58 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 14:27:57 +0000
Message-ID: <570c3776-1157-4d3f-985b-330caa7ca769@intel.com>
Date: Wed, 9 Sep 2026 19:57:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/i2c: Expose AMC Alert reason sysfs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-5-badal.nilawar@intel.com>
 <aqBZXRgr6epDvWmE@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aqBZXRgr6epDvWmE@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::12) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bdec00-f4ec-4809-c536-08df0e7e8b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|56012099006|11063799006|3023799007|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JOIJY4o2welhoiwswRPZKxY52Iu34vmp2wNUlTWGgmhoyf9ff97i6SJQ/m/If7J6NxzxDCCUh6/4Hm1vYswos8k8R9W7S21vn6RyS+oYdEZugDPKh/zth5aAO5dtRos8rFLT2IZHTkqjC6WdJovYDrMGndHRrgcIgHMAoYZ2dtPvYNgRknu4GcR5Yj8PfemTC582BmdFi/r4u62YrCSeJnmB3XzLyfH2mh/hpwecgyWaNnMMEltz5YpPfEN87+Mz7+vFRv64ahpWpi4AcxtYYmUcTh6Foq7X2ksymcwQfmmV8rnVtmwJ67XYLFUxkxXWQT8emOz6OtMLIBe3M8H+cIIWko5cJAKjWGQucgM3Pk4MXsiE5zHY5T8GwShnP7ZQdo4tw7D0hnlYNU/OoUBjcgkr14W+WX0fysia0HHnghAt59J8O5ykM55UsRyVZpDgpST02T3rA1gHMuxrKQ5FhDvCqWeB3ljN1OUk/4Tp39IrMDTaZyRNRmxa+/pA2D56QFKDqI6HtmZaCx2i/acudlZy0g2Sqmze+7ejBhFJpmJuJpbZRhERjl2gvcLd+u2Qz7slRKePKfg2OinyiE421jQu5ZSsRERhyMKBvBpMEg0DFb7aLarYD1Kt3mORvm8cXlUoELFNNCIk9CkLnNl3/usfZcgk6Ofu1vZLyFWKD80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(3023799007)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWZDRmQ5VHJVekpWeG0xSlRjK0FZZWZOcTZlbldjWlR0Rms4a3ZwM1FKSWVT?=
 =?utf-8?B?SGZrcVV5YTZXU0NHV3lqaFp4cmxQazM4Q2xtVThKTGtFL2dKc2lNejRpRE9Y?=
 =?utf-8?B?bnM4b3p5UnQ4ZTBna1MyQ2t3RnNWakhCcHF3M1V1WFFyWWdtZmloWUdodkI2?=
 =?utf-8?B?Q3k4bFdYZ3padFpKRUc1SStKV1Fyc1l0V0VzNHhsK3JySTBHeFRNeUZUOXp4?=
 =?utf-8?B?cGx3blRvYjBEY0t2anJ1b21IM2RwZTFidFczUE5TYTdNV3MyYWZYSlNGL2VX?=
 =?utf-8?B?emFDQTBHM2NYSTZ6cFRJL0QxT0doTm5LTU1zMU9FQVUrd1FIU251Nzc4Q08v?=
 =?utf-8?B?eUdsS2pFNGpEQ1ZYNndHakZIa0hvVDdDa1lVUisveGFxOVRQbm5vZ2swR1Ri?=
 =?utf-8?B?Z1FoeHR4aEhmUTY0K3VxZ0xxZDFiRjJuRmtzL1h3cHB6amZhUzBCc1gyU2c4?=
 =?utf-8?B?cHd5UWlNUmFnNjZwOWVSVHRrYjlCb2FvTHB5SEtacFc2TnVHVVlzZHdMZnVh?=
 =?utf-8?B?clBCZGxhWHNWTytPY2tYK016a2NqQm16bWRSUGV5cXhsSTgzL1ZkeFVLNy9G?=
 =?utf-8?B?cTgyZGh0MDFMWURoS3UzaWVVaWNlRENxaEVzSU9CaVI0eDQwdktPbUJQemhT?=
 =?utf-8?B?ZEpob1MxeU9CY1NyUVowU0Y3bHJ6RklXd3pKbDNnQk16ZW00QWRPRGdBTGpP?=
 =?utf-8?B?RjBUN2dTL1JOeE5oa3RuYzIvT0w5TnFNY0lwUmpSWFBxNEVReE5EQmFzUzRa?=
 =?utf-8?B?NEw5cGh2N214UER1UlZwUDdlRnBOZFVPc2I0ZzE5bjVhTU0zN0dCalFLWGVB?=
 =?utf-8?B?TUhkYThVdW5QUWpaT3RzY0VDTE5nSWVPSmk1L0hNd2lRLzBYNVA4QndsUGNV?=
 =?utf-8?B?aytnUTVnVWM1cGtSWXR4YXJSbVpRMGVPQjhVMVdJaElrWUlITDkvSEpDdHJS?=
 =?utf-8?B?amd5cU01YytFTkVPNTVHOFZoMW9xT1lhMFJ2N2NQWUVEQzF3M3JZeWU1MEZw?=
 =?utf-8?B?bkNHVmJiaXREQ2J6NXpvZDkzTzZlcGFrNjJ1UGZubGpqblh2OERWOVd0VkxQ?=
 =?utf-8?B?SlhiOGowVGFoemJWZThpRStsQWlibitNYWpWcXFxRU5vUEd6UGxJOGtXQTVP?=
 =?utf-8?B?bWx1WmVKOU4xTVpvSElRaVBYMnRDLzJvZWl5a0pLVjgrS3dEaWwrRk1mOTl3?=
 =?utf-8?B?aWZsYTRHSi9PME02cC9CcVRVdVFibmFSV09zWGd3MWczTU1CSThTVWlYbDJw?=
 =?utf-8?B?VjhYNVQyaXJCZjBPYWFQa2cvWllVa2p0UStPbUxTUFkrNE9oSkJoWGFrSHZD?=
 =?utf-8?B?cWdYOVJqdGVFbHN3eVhJcEJrdWZXelZJaGtyQ3VXTWJ3VGhpU0pPd0c3Y21Z?=
 =?utf-8?B?VDFOOHhQR1BoTWJlUWVlVWw0eWcrM3U3YUVHVEEzRmx4ZVpjcWFzYlYzR29X?=
 =?utf-8?B?RXBnUVhGUGx2ckwzdWRBQnJLdFhTdHppNlhxL2FPNStoLzFEZEY5K2NLVkxn?=
 =?utf-8?B?Rmg1eHJwejNmMG1rdVk1L3pLWFI2M0JNdkU4bFVwVjlXeXNKY1g1eHVVU0sy?=
 =?utf-8?B?TUZaRnk4cDFCQmZRZnkvbllxU3hXWGY0STVWNEpMS2xVSG5ueGpoYlVGRExZ?=
 =?utf-8?B?NEx2TTNwMlhzYWFzN0k2b2dobHZxNXFvTlJxUkNURHQ5UDlaK1Yrc1dFU3U2?=
 =?utf-8?B?K3BWaXA1NTZpdWIrUm5pRldFN05GWnZpQ1orVW1CcHhGQ1FVU29qRkprQUo2?=
 =?utf-8?B?L1pFdU1JYXB2NDR1RTF4SlpGQXJ1cjExREUrOFRoWmV5YmxTdThoN0p3K1V2?=
 =?utf-8?B?bTVpb1FUbzZwZWQ5cjdPbnVqYjlYT1YyZUYzSit0a2JNUG1IZlRJOUJJK3Mx?=
 =?utf-8?B?SFRhR1lLNDlwa2lBdjIza1RXdVVwcjhPY3RxZUVHWXRwVEtobU5EOEROR0VY?=
 =?utf-8?B?LzB2RUc0ZXk3WVgwcGM0MWE3WldSM21CNGM2UGVrTHVuTU52Y01CaGprKzg2?=
 =?utf-8?B?UFFybHBqN0h4c2YycFFCeWZITHFPZVd6cW55TVZHK1BJemtST05oZ3FsL3FQ?=
 =?utf-8?B?RXRtYmdoa0tlaldDR1pId0xoUTA5WUs2V1FsTTg4ODMrVEZObmQxYld4b2lQ?=
 =?utf-8?B?U2pVeFFBNUFZeVptTHVtL0xMU2tXMFVxVyt1SkpEckppajJMRTVTcldYSklU?=
 =?utf-8?B?RFY0bSt1QlBnS2MyYnA5OFRHSDk4blpYSTNoV293Q2U3OWRocjBVNHhBdDhw?=
 =?utf-8?B?R0dhTXVBckFlUkZpWUU2Q0J0Zkh1dkxUTk1OWndwZkRaVDAyTnh1Z3BnL2ZN?=
 =?utf-8?B?b2NDOWl2MXVQM2ZOT3FrK3VSa3pmay9lU1ZxbnpKcTR4cXlpK0R3dz09?=
X-Exchange-RoutingPolicyChecked: Y85k7yZ72ht0Z3srCxSNp48OEHWDxAIlvYFd4ZxiSvoT2TclxfXz523MqMfp8uUmbdcj4/3pc0MXuEmtqaJIyQZKriRrtiepkv6ue6JEpaGbJaZ27FbmX4bhbJUeJ3JSBQISXrYVcHpmhYw0Z+Y0BMAbx3lAzwchfeaLApjuweMIOfoE+7nFOKAMdJ1QmqksHBfbDSyCD0rCSFLjyP8ym+JNJGLxbvmBTrCTT/Kc9cSiEsQoX1mU+SU/fkKxxX8GnaJ4EEFr1wSnNPca7sTjqyLuwnKcUTAcg3tJ5eXtpVlANlIbTNBCeVsb1/TRSgeAFQMHuH6ub+GtCQ6I37OOVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bdec00-f4ec-4809-c536-08df0e7e8b4c
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:27:57.6690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9udg6nMrbXolwYN7AHIPrMWoEHgsCjZUChw/cbpF4m1gcLwb8KF+WI0AWErYDptWm7M5OWTgIZNELMteImWY+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
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


On 09-09-2026 00:22, Rodrigo Vivi wrote:
> On Fri, Sep 04, 2026 at 09:36:10PM +0530, Badal Nilawar wrote:
>> AMC raises an SMBUS alert before performing a power removal or
>> power-cycle operation. The xe driver then places the device into
>> vendor-specific wedge mode until the recovery is performed.
>>
>> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
>> identify the required recovery action.
>>
>> Assisted-by: Claude:claude-opus-4.8
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> v2:
>>   - Created sysfs during i2c probe time
>>   - Fix Documentation (Rodrigo)
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 +++++++
>>   drivers/gpu/drm/xe/xe_amc.c                   | 61 ++++++++++++++++++-
>>   2 files changed, 79 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>> new file mode 100644
>> index 000000000000..4e5389163dbb
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>> @@ -0,0 +1,21 @@
>> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
>> +Date:		September 2026
>> +KernelVersion:	7.4
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This file exposes the reason for the most recent Add-In
>> +		Management Controller (AMC) alert on Intel Xe platforms.
>> +
>> +		An AMC alert is delivered via an SMBUS interrupt and causes the
>> +		device to be wedged, requiring vendor-specific recovery. This
>> +		attribute is created when such an alert is handled and is
>> +		available to all users as read-only.
>> +
>> +		Read returns a single line containing one of the following
>> +		alert reasons:
>> +
>> +			Firmware Download
>> +			Thermal Trip
>> +			OOB Request
>> +			OOB Reset
>> +			Catastrophic
> please make this non capital letters and no space
>
> firmware_download
> thermal_trip
> oob_request
> oob_reset
> catastrophic
>
>> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
>> index 8ecadee6eea3..c2d516c76502 100644
>> --- a/drivers/gpu/drm/xe/xe_amc.c
>> +++ b/drivers/gpu/drm/xe/xe_amc.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_device.h"
>>   #include "xe_i2c.h"
>>   #include "xe_mmio.h"
>> +#include "xe_printk.h"
>>   
>>   /**
>>    * DOC: Add-In Management Controller (AMC)
>> @@ -46,6 +47,7 @@ enum xe_amc_alert {
>>   };
>>   
>>   static const char * const amc_alert[] = {
>> +	[AMC_ALERT_UNKNOWN]		= "None",
> shouldn't be unknown?
It can be unknown.
> shouldn't be in the list above?

Not required, as only valid alert reasons result in the device being 
wedged and subsequently exposed to userspace.

Thanks,
Badal

>
>>   	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
>>   	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
>>   	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
>> @@ -56,6 +58,8 @@ static const char * const amc_alert[] = {
>>   struct xe_amc {
>>   	struct xe_i2c *i2c;
>>   	struct work_struct work;
>> +	u8 alert_reason;
>> +	bool sysfs_created;
>>   };
>>   
>>   struct amc_header {
>> @@ -104,6 +108,45 @@ static const struct amc_request amc_get_alert_reason = {
>>   	},
>>   };
>>   
>> +/**
>> + * DOC: AMC Alert Reason
>> + *
>> + * On Intel Xe platforms, AMC sends an alert notification via an SMBUS interrupt
>> + * to notify events such as firmware download, thermal trip or a
>> + * catastrophic error. See enum xe_amc_alert for the full list of reasons.
>> + * Upon an AMC alert the device is wedged and requires vendor-specific recovery.
>> + *
>> + * The alert reason is exposed through
>> + * /sys/bus/pci/devices/<BDF>/xe_amc_alert_reason
>> + *
>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
>> + * specification.
>> + */
>> +
>> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
>> +					struct device_attribute *attr, char *buff)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>> +	struct xe_amc *amc = xe->i2c->amc;
>> +
>> +	return sysfs_emit(buff, "%s\n", amc_alert[amc->alert_reason]);
>> +}
>> +static DEVICE_ATTR_RO(xe_amc_alert_reason);
>> +
>> +static void xe_amc_remove_alert_sysfs(struct xe_i2c *i2c)
>> +{
>> +	struct device *dev = i2c->drm_dev;
>> +
>> +	device_remove_file(dev, &dev_attr_xe_amc_alert_reason);
>> +}
>> +
>> +static int xe_amc_create_alert_sysfs(struct xe_i2c *i2c)
>> +{
>> +	struct device *dev = i2c->drm_dev;
>> +
>> +	return device_create_file(dev, &dev_attr_xe_amc_alert_reason);
>> +}
>> +
>>   static void xe_amc_work(struct work_struct *work)
>>   {
>>   	const struct amc_request *request = &amc_get_alert_reason;
>> @@ -158,10 +201,15 @@ static void xe_amc_work(struct work_struct *work)
>>   	case AMC_ALERT_THERMAL_TRIP:
>>   	case AMC_ALERT_OOB_REQUEST:
>>   	case AMC_ALERT_OOB_RESET:
>> -	case AMC_ALERT_CATERR:
>> +	case AMC_ALERT_CATERR: {
>> +		struct xe_device *xe = i2c_client_to_xe_device(client);
>> +
>>   		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
>> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
>> +		amc->alert_reason = alert_reason;
>> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>> +		xe_device_declare_wedged(xe);
>>   		break;
>> +	}
>>   	default:
>>   		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
>>   		break;
>> @@ -176,6 +224,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
>>   int xe_amc_init(struct xe_i2c *i2c)
>>   {
>>   	struct xe_amc *amc;
>> +	int ret;
>>   
>>   	amc = kzalloc(sizeof(*amc), GFP_KERNEL);
>>   	if (!amc)
>> @@ -185,11 +234,17 @@ int xe_amc_init(struct xe_i2c *i2c)
>>   	i2c->amc = amc;
>>   	amc->i2c = i2c;
>>   
>> -	return 0;
>> +	ret =  xe_amc_create_alert_sysfs(i2c);
>> +	if (ret)
>> +		kfree(i2c->amc);
>> +
>> +	return ret;
>>   }
>>   
>>   void xe_amc_exit(struct xe_i2c *i2c)
>>   {
>> +	xe_amc_remove_alert_sysfs(i2c);
>> +
>>   	if (i2c->amc) {
>>   		cancel_work_sync(&i2c->amc->work);
>>   		kfree(i2c->amc);
>> -- 
>> 2.54.0
>>
