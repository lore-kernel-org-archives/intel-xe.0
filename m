Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2924C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 17:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C5B10E155;
	Thu,  3 Sep 2026 17:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VomISfTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C4F10E155
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788455688; x=1819991688;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IuPM8bJR04Exq+nRURU9hGUl6R5o5Ik+gJi3AfnaTTY=;
 b=VomISfTo34wSwDbBD4S0HmJPwRYyz4JA5ah8u0zZB4WPorb6DY8BB1n0
 MEzWVF7JgUXDcm4G6EHweSz9LYsIRpXNpgIL/hNBFR5YETIq+KEeuJhkG
 zgur5HAWbbLT9j51B6sr6/xm2czg+Ffjc0gn4SwrGzCOb+8eTAwRJKSLu
 2uMyPxbqPkERZyaBtdowAjx8pmtpJHAmVq8QBNbjiXH21tgmkwAcSQNED
 m+VrdoSR+HQVLbVj7TKRcEQnImtRECGu16+DtgQO1TvfvadSRWc+irwv1
 BtDfR/t0g3ljHEbpcVWCFXbReS8K5qX7bmv2+IOVyc7GjlFYFr3+kLojh A==;
X-CSE-ConnectionGUID: eCxEHLk5QISX2W3vZp4Ztw==
X-CSE-MsgGUID: tfdQyaycTsGZE9O5cuHr6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114492224"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="114492224"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 10:14:47 -0700
X-CSE-ConnectionGUID: /ziqDknMTlukTEx5PvrNsQ==
X-CSE-MsgGUID: 0JTeSAVoREiT6Oz1mC88Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="263601381"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 10:14:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 10:14:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 10:14:44 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 10:13:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEJnuH8XO1Ghfnp4xhNwEbJEGqIe7soKd4M6NwwveoAWRdzk+bicnSG4X7/+NMSr4dmmYr3mmprtbLmmGWCsC4y4O5RNI0zKvzAD2jzO5EYMVGWr1c1ezlEI0x2SffrTjJ6823fKGOThRQxhB+mHEizt/EISq5g6s2EZDUthl+qQyv7MyFjaoGQBqZPQyhmWKXk2Y5KpDQrJ6rSo1HwYlvGAa2S1TnBlBSz4YAE4ANwH6arcAWp86Y2jAz6A5UOIDUraz+H8bLZwTz/UcXMgiIjOqs+G24JE5oGpuNlNQR8Zwr6B5+okO6wi3tB9DSrhSCoT9Dl4VhaClRogosp5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a+9LDp8PJHI4a7MCiiOiOrTYQP1xZOeUv5DQrsRe4A=;
 b=a5mxwbA0k8jJiyS3/MzTL+yOmmRwKqWTJaboVWQEp/f7cxrZrnOZ8+69mu9cgeGBze+K/YHAijj1FH+NNP8u1muEQNt8XBIzXOeCBTRpjbtSxMgH2rpFnUU72jV0iG3Wksxy7IurjLwhcKHmjrvLp4DtUqhqyyqaRBq3U5Bp2mjX0Jq1XW0LdVvYRIkk2LfKVSJSWkYjYuWYwi11vlFQJVMU0+bJzYoPs6hqbGKAAcKL3g+sM9/U122OUGZWIJKY2aVLrLsY/KN7+AzvbJ6dRacBZjXrPAuXDWSwOFkV85Sj5mvThxV8atjpyyakxi+D1ntr/Ku61JN2n0ex9KJzKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 17:13:36 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 17:13:35 +0000
Message-ID: <f09a3676-9047-407d-9502-5ab509846995@intel.com>
Date: Thu, 3 Sep 2026 22:43:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/xe/hwmon: Enable fan curve control support
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-7-karthik.poosa@intel.com>
 <4b1dd652-77d4-4f14-941d-3b53d04ffefe@intel.com>
 <dd29aafc-1a33-42ef-8cc1-8593edbcce29@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <dd29aafc-1a33-42ef-8cc1-8593edbcce29@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0081.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA1PR11MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a21030b-c5e5-4c40-24a9-08df09deb03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|5023799004|10067099003|11063799006|22082099003|18002099003|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 5B9SYr/6UNjIOKGkipk9pnDjYksfPkFS+OACDD/6cdrs96YsXhcOFdPHIZCDTzotXoNg+muf9SUmw2zMLbRhpaN3AZhpBocNF/i7+RnoFdzgHthFl4z6Dja5BG3nNlPjavf8JX3JbtdSt+Pfoz6argouKO41Ptp7tdrnNk2p4YP+hxkso1U2JF5pMQ5OqFGxUP9HorqkyR7cyp39dhrhYKk4GMil+DWNQ18y+KVCmrVOQTFzd4Ksop6TMXTDG7WwrXOsFt3BPtKFHY/fbLekIYy3dT03C+Qt19EjpCrehqvJi9yA6c/0xij/+mW1xYwIagFGryQMiue2AHFdjzGCv/UuNdoryjQlznZJtkuBiqCnowmh99F70zyt0TqJ0HwDBby16DW15VTdJDGa7YDQNdreyHv4aXk2zNhWquXT9RXTONoMZ6LPgE5NN0pJlPhEX77KzcFh1JLZXB1UWFVb3Hf5+Oq/Cv7ZGep2WawZzkkJuMhB6WSwI8guC3r7uMVHDxd0ef/aPGeIdrVAbdOPTGwttoZjRjfnPlOFgyAbKBIyFqb1dNxCApeGrtYpS+vfsT5qBvGjv+Gn7LDBlsyR3T4DDCnk32A8hjHsN+FAVz4p4ZdwwQuusfITLpijZjk3FJIlJok6PROj/R6pSVmMp9N7Yr73ZM+bpDq8vl7nveE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(10067099003)(11063799006)(22082099003)(18002099003)(6133799003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTZWa01JaGVibXZJcjBSdEJJQ3VVcmhERlpnT3ArZk4zdlorRjJtWHZMenZs?=
 =?utf-8?B?VlUzdzJCeWM0RUlUanpsT1hKa1VYMmpDZ1B4cWJldCtaQWVNTzJPREkvMUJI?=
 =?utf-8?B?elZuYWNOMGxPT0hJdTBMYzFOQWNoSDNVZUc0dXYxWDFuQVNpc3lHdnJxcDZk?=
 =?utf-8?B?VlRxMW8yWW1vZnZRYjYvQjdITWJadVBSanNRU05ieXZ4aTVqSS9tSFNwVzRZ?=
 =?utf-8?B?SXhFUEZTRy9JOUExbVhkSFV1bFpGcmxkQ1F5NTdab2lhbi9KNWFRbTE3ZE9q?=
 =?utf-8?B?MTRKSDY2YmczbDFIMUMxcVpwNEFJb1MwdUd0U0VXTUt4SlFEdWlzUkpKbDJO?=
 =?utf-8?B?RC8wRGdGK3k1VlBDRndqOVVJR1Z6ZTh2RTlUaktodkZuQURLL29HdzYyTDRQ?=
 =?utf-8?B?TFc3YlIya0dFTk8wZW02K2xwaXUrOE0vZDNwNnVMVDl3d21wVUZsVUU2cmNS?=
 =?utf-8?B?K1gweUp6Y1pnQTZadmgyaktOUkh6V2doMkJOMnBhK1hXRmFmblNRNlU2NXpY?=
 =?utf-8?B?TDJBSFBSaUpWVCtDOGpTKzlkc2JCZkpiaHdlZWh6ZWY5R2Z1Nndvdm1hbVQw?=
 =?utf-8?B?Wis0ai9iQmFMWmxJVFd4TFIvdkoyb3h2UGh4Sm5jL0pFTHRkbFp5YjIxdWJR?=
 =?utf-8?B?elQzZWQxSENIYk9NNzUyRVlKODBoNnZFejVRZXJ4NlpaR2JUWlU0Z0lWbTVN?=
 =?utf-8?B?RjF3M2ZLcHJ3S1Q1RlZ3SmxtcGo3Z2lUcUcvdTUrdmNtYTdTTnYwdjR2T2tn?=
 =?utf-8?B?WXF4U3E0bTVVVGtVVE9HMFBHSUpnREVNSHhzOG9IZWRjZDlraU05V1ZBRC9C?=
 =?utf-8?B?bFgva0xLWlBIdEhuOEd5NXFZamVKSitGVUZXTW5rWDhDQ3F3S1c1aDk5bEpz?=
 =?utf-8?B?dzhjYkdtV3F3bndXNk1HR1hIMk8xQ3FqMU1xRGZGTlgvaDJMWmM1WUxleDdX?=
 =?utf-8?B?V05jN2pLK21Odzh6dDFLeGZjTVdab2dDS3gzSVIzQ0FNb0FSMkV1YXRiUjRY?=
 =?utf-8?B?cU1YcVVtb2hTaCtZU3lrUWFIeDJHUTNSZWZMbW1oMWYyRk9nRnhINXBnOU5a?=
 =?utf-8?B?L2luMVVQNzVkZk5NUmR1a3MyQ09xQlFET2duTjZ3amNEOEtoQjRMdDhSRkFj?=
 =?utf-8?B?eUsvOVhNWHAyWlhnVHFURGsvdzBCZmEybjA1SFByallhcE5WeGw1aUZiVEJY?=
 =?utf-8?B?QWcrZ090RVA3R0M2S3krbFJmbHNuQjljb2syNE5iZVROeDBZTXAyYXVWWitm?=
 =?utf-8?B?blBRK0VleHZVVlZFNDlKZmNQcTEyUGhRU2owMUhFelNrcWM4UEs1RTZXR0Nx?=
 =?utf-8?B?OHlEYityR1N4bkMvYlJQeU51aU9GTWc2QzcvUFNBbmNBVWJKK2dENjZvQThE?=
 =?utf-8?B?bkFQOWNHejltUFJwR0tmSTBEc2RINlFWMkY4a05KL0h5UGd2bFZwenVPcnhR?=
 =?utf-8?B?WE5DSkRCUDhDQk9pekhyRC93dStEQ0diMERBK3gwbmlLaHBIWVU4VTJJcjZt?=
 =?utf-8?B?SUZRcmVmREdiU3ZUdU91MW5IK1NNZ2tBTlpjYW16cEsreXlzVjIwV1Uydzlk?=
 =?utf-8?B?eSszMWlUL0I2OVIvRTMvTHgvbWNFdEdvZWJWSEgzRkRaNytPcmtSSHNkemJu?=
 =?utf-8?B?UStiVVhqOWZ4cUI4R0lSY05HemJEbzZra0kxdHBCMm1MSTU3ckp3Z29TenVO?=
 =?utf-8?B?dWRCZkQ0YWhxeWQzdGF6Q0o5MGQ2MXhweGswdUg2a1NlNkVpZUZrQXAwN0h1?=
 =?utf-8?B?b2djelpWMi9nTXYvZmJTdjAwT2ZkNnJ1TlRsWDFWeFYxcFIyWFQ1ZVd2SFFz?=
 =?utf-8?B?OEEyRHpodEd3ZFVWUTNnQmF4aGhSWlFvSnhFeVRjUHMwZUxscllwTzVWR3VU?=
 =?utf-8?B?eDRMWHJLK2docHFEdVVEVVZZUFhhblNaa1dqcm5xdi9QcjFBS1FUL3d1ejBG?=
 =?utf-8?B?Tk9UTE9JeDNoL1VCeGV2allZQ0RVMnBtUFdaQ0pOMXNQOVRaTG1FT1V2czZF?=
 =?utf-8?B?T3hDNWI3QkxyL2duL1F3dHUwL0VoMlpYNTNrYnAwZnF5cGxiZVh4bURGclJ6?=
 =?utf-8?B?T3pVUmtDY08wODlkblZnaUxHNTFMbm8zYnViaG9ldk9ySTh1UWlVZUJSRHJC?=
 =?utf-8?B?QkJGNWxOV2lmWVhZM0Q4QXdiYmZzYk1xOHNBcmpHUk5DaHYrN0pRc3Q4Y2RW?=
 =?utf-8?B?OEtWRDhrSjZhVlNuUm9mbkxvVVU4NC9ZZStiUzlodHBoamVUOCs4dmlMdmI4?=
 =?utf-8?B?SHVoR01FcEZUVVZ3MXFNTWlFcmUzdm1jVEtCeC9mV2xvOVRCNmZxOGZMVkhn?=
 =?utf-8?B?S1dDdlU0bXJGOUMzVGc4ZUU0TkRBakFjbGhTSTVlVm9hK3dzUHk5WXNybGkw?=
 =?utf-8?Q?MmBa2TdrqSatjxnA=3D?=
X-Exchange-RoutingPolicyChecked: WTMsa6Vh1JwKennZ0vmduojlnTLDhrQtt6fihHhM/aVgwb0Oe9+VdkHslz4piiqm7tXhYKA9/i96r7ChAarjUIsh+OjVVJlKuxINZUT5rR2hJdBZIWZhhoRm1wpDs7ORliL1uk1T1jfAF6MKuCe+HlWPEvkWb7+Iyq/Jaqq4AGd6Amfarut5s81ZCL4FRKb8dG7GGEcMup9xuFLYLJC5ByY4gvIqM1vNJhLj44s9EmFXvdS1FA2phStLgaa18qiJaWN9sSAIoSeM65COQiGmrHjnAraWI8J0UDm8nZIofkA5mnSQX0aOq9cpvq6lNFzKSa2IvrdH0MHyv8HgE10s3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a21030b-c5e5-4c40-24a9-08df09deb03e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 17:13:35.8325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlKgWGpLlAOCa1uch/eDwNZ1v686R65y0kjkp+npF9IM1C5ZBvPEsotIDZTAMxR8nRg3M2/kHPILqZoXHtHHzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
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


On 27-08-2026 17:37, Poosa, Karthik wrote:
>
> On 22-07-2026 23:46, Purkait, Soham wrote:
>> Hi Karthik,
>>
>> On 17-07-2026 09:47, Karthik Poosa wrote:
>>> Expose curve-point temperature and pwm controls via
>>> pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
>>> F is the fan number and P is the fan curve point number.
>>> Each fan curve point has temperature and pwm sysfs.
>>>
>>> Update Xe hwmon ABI documentation for pwm auto point temperature
>>> attributes.
>>>
>>> v2:
>>> - Use xe helpers for dmesg logs.
>>> - Update kernel version in Xe hwmon documentation.
>>> - Correct debug level of some dmesg logs.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> Assisted-by: Codex:gpt-5-4
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  16 +
>>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 700 
>>> +++++++++++++++++-
>>>   2 files changed, 715 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> index effc7d38ce1f..68cc6b99e8a5 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> @@ -341,3 +341,19 @@ Description:   RW. Fan control mode selector.
>>>                  user table control and value 2 to use firmware 
>>> default behavior.
>>>                    Only supported for particular Intel Xe graphics 
>>> platforms.
>>> +
>>> +What: 
>>> /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_temp
>>> +Date:          June 2026
>>> +KernelVersion: 7.2
>>> +Contact:       intel-xe@lists.freedesktop.org
>>> +Description:   RW. Temperature in millidegree Celsius for each fan 
>>> curve point.
>>> +
>>> +               Only supported for particular Intel Xe graphics 
>>> platforms.
>>> +
>>> +What: 
>>> /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_pwm
>>> +Date:          June 2026
>>> +KernelVersion: 7.2
>>> +Contact:       intel-xe@lists.freedesktop.org
>>> +Description:   RW. PWM duty value (0..255) for each fan curve point.
>>> +
>>> +               Only supported for particular Intel Xe graphics 
>>> platforms.
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index fa9dbadd5fd6..a3ed139ad446 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -173,6 +173,10 @@ struct xe_hwmon_fan_info {
>>>               /** @speed: fan speed in percentage */
>>>               u8 speed;
>>>           } fcp[MAX_FAN_CONTROL_POINTS];
>>> +        /** @last_point_temp_valid: last user temperature point was 
>>> written */
>>> +        bool last_point_temp_valid;
>>> +        /** @last_point_speed_valid: last user PWM point was 
>>> written */
>>> +        bool last_point_speed_valid;
>>>       } fan_table[FAN_TABLE_MAX];
>>>           /** @max_rps: maximum fan RPS */
>>>           u32 max_rps;
>>> @@ -779,8 +783,11 @@ static const struct attribute_group 
>>> hwmon_attrgroup = {
>>>       .is_visible = xe_hwmon_attributes_visible,
>>>   };
>>>   +static const struct attribute_group hwmon_curve_attrgroup;
>>> +
>>>   static const struct attribute_group *hwmon_groups[] = {
>>>       &hwmon_attrgroup,
>>> +    &hwmon_curve_attrgroup,
>>>       NULL
>>>   };
>>>   @@ -945,7 +952,7 @@ static int xe_hwmon_get_num_fans(const struct 
>>> xe_hwmon *hwmon, u32 *num_fans)
>>>   }
>>>     static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, 
>>> u8 fan, u32 *point_count,
>>> -                    int table_type)
>>> +                    enum fan_table_type table_type)
>>>   {
>>>       int ret;
>>>   @@ -960,6 +967,16 @@ static int 
>>> xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
>>>           return ret;
>>>       }
>>>   +    xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>>> +           (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>>> *point_count);
>> Remove duplicate log.
> ok
>>> +
>>> +    if (*point_count > MAX_FAN_CONTROL_POINTS) {
>>> +        xe_err(hwmon->xe, "fan %d %s point count %u exceeds max 
>>> %u\n", fan,
>>> +               (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>>> *point_count,
>>> +               MAX_FAN_CONTROL_POINTS);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>       xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>>>              (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>>> *point_count);
>>>   @@ -985,6 +1002,60 @@ static int 
>>> xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 poin
>>>       return ret;
>>>   }
>>>   +static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, 
>>> u8 fan)
>>> +{
>>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>> +    u32 point_count = 
>>> fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
>>> +    int point;
>>> +    int ret;
>>> +
>>> +    if (!point_count)
>>> +        return -ENODATA;
>>> +
>>> +    for (point = 0; point < point_count; point++) {
>>> +        u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
>>> +        u8 speed = fi->fan_table[USER_FAN_TABLE].fcp[point].speed;
>>> +
>>> +        /* Ensure fan control points are strictly increasing order */
>>> +        if (point > 0) {
>>> +            u8 prev_temp = fi->fan_table[USER_FAN_TABLE].fcp[point 
>>> - 1].temp;
>>> +            u8 prev_speed = fi->fan_table[USER_FAN_TABLE].fcp[point 
>>> - 1].speed;
>>> +
>>> +            if (temp < prev_temp || speed < prev_speed) {
>>> +                drm_dbg(&hwmon->xe->drm,
>>> +                    "fan %d invalid user point previous value > 
>>> current %d: %u/%u prev=%u/%u\n",
>>> +                    fan, point, temp, speed, prev_temp, prev_speed);
>>> +                return -EINVAL;
>>> +            }
>>> +        }
>>> +
>>> +        drm_dbg(&hwmon->xe->drm,
>>> +            "committing fan %d user point %d temp %u, speed %u %%\n",
>>> +            fan, point, temp, speed);
>>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, 
>>> temp, speed);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    drm_dbg(&hwmon->xe->drm,
>>> +        "committing fan %d user table with %d points\n", fan, 
>>> point_count);
>>> +    ret = xe_pcode_write_timeout(root_tile, 
>>> PCODE_MBOX(FAN_SPEED_CONTROL,
>>> + FSC_WRITE_NUM_FAN_CONTROL_POINTS,
>>> +                               fan),
>>> +                     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>>> +    if (ret) {
>>> +        drm_dbg(&hwmon->xe->drm,
>>> +            "failed to update fan %d user table count, ret=%d\n", 
>>> fan, ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>>> +    fi->is_full_speed = false;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int xe_hwmon_activate_user_fan_table(struct xe_hwmon 
>>> *hwmon, u8 fan,
>>>                           bool is_full_speed, enum fan_table_type 
>>> table_source)
>>>   {
>>> @@ -1105,6 +1176,633 @@ static int xe_hwmon_set_user_fan_pwm(struct 
>>> xe_hwmon *hwmon, u8 fan, u8 pwm)
>>>       return 0;
>>>   }
>>>   +#define XE_CURVE_IDX(fan, point)    (((fan) << 8) | (point))
>>> +#define XE_CURVE_FAN(idx)        ((u8)(((idx) >> 8) & 0xff))
>>> +#define XE_CURVE_POINT(idx)        ((u8)((idx) & 0xff))
>>> +
>>> +static int
>>> +xe_hwmon_decode_curve_index(u32 index, u8 *fan, u8 *point)
>>> +{
>>> +    u8 local_fan = XE_CURVE_FAN(index);
>>> +    u8 local_point = XE_CURVE_POINT(index);
>>> +
>>> +    if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS)
>>> +        return -EINVAL;
>>> +
>>> +    *fan = local_fan;
>>> +    *point = local_point;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static inline enum fan_table_type 
>>> xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
>>> +{
>>> +    if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
>>> +        return STOCK_FAN_TABLE;
>>> +    else
>>> +        return USER_FAN_TABLE;
>>> +}
>>> +
>>> +static ssize_t
>>> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
>>> +                  struct device_attribute *attr, char *buf)
>>> +{
>>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>> +    struct xe_hwmon_fan_info *fi;
>>> +    u32 point_count;
>>> +    u8 fan;
>>> +    u8 point;
>>> +    u8 temp;
>>> +    int ret;
>>> +    enum fan_table_type active_table;
>>> +
>>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    fi = &hwmon->fi[fan];
>>> +    active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
>>> +
>>> +    guard(xe_pm_runtime)(hwmon->xe);
>>> +
>>> +    mutex_lock(&hwmon->hwmon_lock);
>>> +
>>> +    fi = &hwmon->fi[fan];
>>> +
>>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>>> active_table);
>>> +    if (ret)
>>> +        goto unlock;
>>> +
>>> +    if (point >= point_count) {
>>> +        ret = -EINVAL;
>>> +        goto unlock;
>>> +    }
>>> +
>>> +    temp = fi->fan_table[active_table].fcp[point].temp;
>>> +    ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
>>> +
>>> +unlock:
>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, 
>>> u8 fan, u32 point,
>>> +                      u32 point_count, u8 temp, u8 pwm)
>>> +{
>>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>>> +    int ret;
>>> +
>>> +    if (temp) {
>> But as per the xe_hwmon_get_u8_from_sysfs() "0" is a acceptable curve 
>> point then, why is it being over loaded here ?
>>
>> Thanks,
>> Soham
> The intention here was to indicate whether the update is for the 
> temperature or PWM field of a fan-curve point.
> instead, we can pass an explicit enum describing which field is being 
> updated
>
> enum xe_hwmon_fan_point_field {
> XE_FAN_POINT_TEMP,
> XE_FAN_POINT_PWM,
> };

If this is only for this function, you could use a simple boolean flag 
like is_temp or is_pwm but up to you.

>
>>> + fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
>>> +        if (point == (point_count - 1))
>>> + fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = true;
>>> +    } else {
>>> +        fi->fan_table[USER_FAN_TABLE].fcp[point].speed = pwm;
>>> +        if (point == (point_count - 1))
>>> + fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = true;
>>> +    }
>>> +
>>> +    /* Cache intermediate points and commit once the last point 
>>> arrives. */
>>> +    if (point == (point_count - 1) &&
>>> + fi->fan_table[USER_FAN_TABLE].last_point_temp_valid &&
>>> + fi->fan_table[USER_FAN_TABLE].last_point_speed_valid) {
>>> +        ret = xe_hwmon_commit_user_fan_table(hwmon, fan);
>>> +        if (ret)
>>> +            return ret;
>>> + fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = false;
>>> + fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = false;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static int xe_hwmon_get_u8_from_sysfs(long val, bool is_temp, u8 *out)
>>> +{
>>> +    long hw_val;
>>> +
>>> +    if (is_temp)
>>> +        hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
>>> +    else
>>> +        hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
>>> +
>>> +    if (hw_val < 0 || hw_val > U8_MAX)
>>> +        return -EINVAL;
>>> +
>>> +    *out = hw_val;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static ssize_t
>>> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   const char *buf, size_t count)
>>> +{
>>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>> +    struct xe_hwmon_fan_info *fi;
>>> +    u8 fan;
>>> +    u8 point;
>>> +    u32 point_count;
>>> +    u8 temp;
>>> +    long val;
>>> +    int ret;
>>> +
>>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    fi = &hwmon->fi[fan];
>>> +
>>> +    if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>>> +        drm_err(&hwmon->xe->drm,
>>> +            "pwm%d_enable not in manual mode; cannot update temp 
>>> point %d\n",
>>> +            fan, point);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ret = kstrtol(buf, 10, &val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = xe_hwmon_get_u8_from_sysfs(val, true, &temp);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    guard(xe_pm_runtime)(hwmon->xe);
>>> +
>>> +    mutex_lock(&hwmon->hwmon_lock);
>>> +
>>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>>> USER_FAN_TABLE);
>>> +    if (ret)
>>> +        goto unlock;
>>> +
>>> +    if (point >= point_count) {
>>> +        ret = -EINVAL;
>>> +        goto unlock;
>>> +    }
>>> +
>>> +    drm_dbg(&hwmon->xe->drm,
>>> +        "updating fan %d point %d temp to %u, pwm %u\n", fan, point,
>>> +        temp, fi->fan_table[USER_FAN_TABLE].fcp[point].speed);
>>> +    ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, 
>>> point_count, temp, 0);
>>> +
>>> +unlock:
>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>> +
>>> +    return ret ? ret : count;
>>> +}
>>> +
>>> +static ssize_t
>>> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
>>> +                 struct device_attribute *attr,
>>> +                 char *buf)
>>> +{
>>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>> +    struct xe_hwmon_fan_info *fi;
>>> +    u8 fan;
>>> +    u8 point;
>>> +    u32 point_count;
>>> +    int ret;
>>> +    enum fan_table_type active_table;
>>> +
>>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    fi = &hwmon->fi[fan];
>>> +    active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
>>> +
>>> +    guard(xe_pm_runtime)(hwmon->xe);
>>> +
>>> +    mutex_lock(&hwmon->hwmon_lock);
>>> +
>>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>>> active_table);
>>> +    if (ret)
>>> +        goto unlock;
>>> +
>>> +    if (point >= point_count) {
>>> +        ret = -EINVAL;
>>> +        goto unlock;
>>> +    }
>>> +
>>> +    ret = sysfs_emit(buf, "%u\n",
>>> + DIV_ROUND_CLOSEST(fi->fan_table[active_table].fcp[point].speed * 
>>> U8_MAX,
>>> +                       100));
>>> +
>>> +unlock:
>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static ssize_t
>>> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
>>> +                  struct device_attribute *attr,
>>> +                  const char *buf, size_t count)
>>> +{
>>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>> +    struct xe_hwmon_fan_info *fi;
>>> +    u32 point_count;
>>> +    long val;
>>> +    u8 point;
>>> +    u8 fan;
>>> +    u8 pwm;
>>> +    int ret;
>>> +
>>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    fi = &hwmon->fi[fan];
>>> +
>>> +    if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>>> +        drm_err(&hwmon->xe->drm,
>>> +            "pwm%d_enable is not in manual user mode, cannot update 
>>> pwm point %d\n",
>>> +            fan, point);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ret = kstrtol(buf, 10, &val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = xe_hwmon_get_u8_from_sysfs(val, false, &pwm);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    guard(xe_pm_runtime)(hwmon->xe);
>>> +
>>> +    mutex_lock(&hwmon->hwmon_lock);
>>> +
>>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>>> USER_FAN_TABLE);
>>> +    if (ret)
>>> +        goto unlock;
>>> +
>>> +    if (point >= point_count) {
>>> +        ret = -EINVAL;
>>> +        goto unlock;
>>> +    }
>>> +
>>> +    pwm = max_t(u8, pwm, fi->min_pwm);
>>> +
>>> +    drm_dbg(&hwmon->xe->drm, "updating fan %d point %d pwm to %u\n",
>>> +        fan, point, pwm);
>>> +    ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, 
>>> point_count, 0, pwm);
>>> +
>>> +unlock:
>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>> +
>>> +    return ret ? ret : count;
>>> +}
>>> +
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 0));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 0));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 1));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 1));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 2));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 2));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 3));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 3));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 4));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 4));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 5));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 5));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 6));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 6));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 7));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 7));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 8));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 8));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(0, 9));
>>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(0, 9));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 0));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 0));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 1));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 1));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 2));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 2));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 3));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 3));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 4));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 4));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 5));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 5));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 6));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 6));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 7));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 7));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 8));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 8));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(1, 9));
>>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(1, 9));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 0));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 0));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 1));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 1));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 2));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 2));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 3));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 3));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 4));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 4));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 5));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 5));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 6));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 6));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 7));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 7));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 8));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +   ��          xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 8));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_temp, 0644,
>>> +              xe_hwmon_pwm_auto_point_temp_show,
>>> +              xe_hwmon_pwm_auto_point_temp_store,
>>> +              XE_CURVE_IDX(2, 9));
>>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_pwm, 0644,
>>> +              xe_hwmon_pwm_auto_point_pwm_show,
>>> +              xe_hwmon_pwm_auto_point_pwm_store,
>>> +              XE_CURVE_IDX(2, 9));
>>> +
>>> +static struct attribute *hwmon_curve_attributes[] = {
>>> +    &sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point9_temp.dev_attr.attr,
>>> + &sensor_dev_attr_pwm1_auto_point10_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point9_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm1_auto_point10_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point9_temp.dev_attr.attr,
>>> + &sensor_dev_attr_pwm2_auto_point10_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point9_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm2_auto_point10_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point9_temp.dev_attr.attr,
>>> + &sensor_dev_attr_pwm3_auto_point10_temp.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point9_pwm.dev_attr.attr,
>>> +    &sensor_dev_attr_pwm3_auto_point10_pwm.dev_attr.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
>>> +                         struct attribute *attr, int index)
>>> +{
>>> +    struct device *dev = kobj_to_dev(kobj);
>>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>> +
>>> +    /* Temp/PWM pairs for each point. */
>>> +    u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
>>> +    u32 fan = index / attrs_per_fan;
>>> +    u32 local = index % attrs_per_fan;
>>> +    u32 point_count;
>>> +
>>> +    if (!hwmon->xe->info.has_fan_control)
>>> +        return 0;
>>> +
>>> +    if (fan >= hwmon->num_fans)
>>> +        return 0;
>>> +
>>> +    point_count = 
>>> max(hwmon->fi[fan].fan_table[USER_FAN_TABLE].fan_control_point_count,
>>> + hwmon->fi[fan].fan_table[STOCK_FAN_TABLE].fan_control_point_count);
>>> +
>>> +    if (!point_count)
>>> +        return 0;
>>> +
>>> +    if (local < MAX_FAN_CONTROL_POINTS)
>>> +        return (local + 1) <= point_count ? attr->mode : 0;
>>> +
>>> +    if (local < (2 * MAX_FAN_CONTROL_POINTS))
>>> +        return (local - MAX_FAN_CONTROL_POINTS + 1) <= point_count ?
>>> +            attr->mode : 0;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct attribute_group hwmon_curve_attrgroup = {
>>> +    .attrs = hwmon_curve_attributes,
>>> +    .is_visible = xe_hwmon_curve_attributes_visible,
>>> +};
>>> +
>>>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>>   {
>>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
