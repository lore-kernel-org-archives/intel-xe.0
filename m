Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBC0C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D43110F58E;
	Fri, 14 Aug 2026 13:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7gCHkmg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA7310F58E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786712738; x=1818248738;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I7e/S8uWmX7jgQXSmN8R9rPD2kPUeeHTX4xnkOMvO0I=;
 b=D7gCHkmgbim39YrXtF3/dwfDJuuSBMhZcYtdT8b08NiR4hnfrfdMBfK+
 PhLJjZcOQDilANCXsIFn30Ka2V9kV5hpZtFsr/nvGt1otJuclVPZGCeA9
 0FPJ8QKcRjwhcq6O7oQX5om3JUuoyHw4fwwrsvDZWFY12Dyo/DpwGrGKa
 cc2BkZqYpVUrA29vq/drnCign3lXr6EkDwUSxHCI+cBgDwPWjCB36/qQu
 KmO6cgfkNHwLYshfXdgA1r220trApksky/8neSN1mgbZgjgU2YTaiWakL
 uL5qjmPJMCFDUqZt8zO4OLa/zTRe4sgtFppTnHvUSDh9CUOd7mrpyVJPF g==;
X-CSE-ConnectionGUID: wlLf2RZLRmijyTNGF0Ga3g==
X-CSE-MsgGUID: 9o6Njo8nQDuWa4FH/Bu8jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87052919"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87052919"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:05:37 -0700
X-CSE-ConnectionGUID: SQgXgI11R+2LwNNlLfplmQ==
X-CSE-MsgGUID: lge28jxsTGqbNCZ5B06Ptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="261575730"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:05:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:05:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:05:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6R8RrUWOBWPqYvAmnklW5gvz+13w6cP+tKT1VLu6ROb/+uQfgzb1p0sFLGEzv45dRlk/ORtFvrKjsNpgw29QCwP0hb6OoVbCxBYgRdQ4ddTyiYZp6dA1YBhzuCLoll/oTtaa4IZrlYlNMvpVvhzGdX1g4EPOTPpDyRTKsIr5un7s5cHBamvfXa6OHiqh0QbQcJqjcS25xOax25Pa55WJoTOwCDcQSOSBTH6PQ4EpCHH8O3QZIpJj6sXTtfhAb7wphIgjHTZhx+09yj5AIHp4dJDtzlfBV1/VdDpF70S7AiNDemuBJ7/DILzDFRZiMAl0imKzUe2mtmDH8xazk+uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRUtgzBaS3gX8aviYAv8LAA2WwLNdCNx92RlhEX4P7Y=;
 b=FE5yvCe0/zXbYOIvFt1QD4wsK62s4anIlKYyNMOJqphu0NWm7jul4Fr9oQuMV6S48RjmOw3dy0Mtp/fjY3uWjKe0EqVaMTy7lhrUmqEH2p8o6dwSEi8ljI3cGxECtpZTjP7HVxbIOQrIfOdVi6wX8fvw2uK16QEWpADRoozmiycfhMre1IvHLW0SaGo5p0JFCYpsMdfhy6jHApdI41TBZzJ2RL4JYWl/350M2B9WrCPvCkCZm9Fpp0KqKSCQQX2D7RZ9FBYcVxXABI3bPfUOCBlu4DRmTtR8sxuQq3Shkcfkp77DvHMd/i8lb1tvfZ3SfUhWLKNrYJd894bQITJraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ2PR11MB8498.namprd11.prod.outlook.com (2603:10b6:a03:56f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 13:05:25 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:05:25 +0000
Message-ID: <d5c8e2bd-7c84-41c8-a0b2-e99cb799f2e8@intel.com>
Date: Fri, 14 Aug 2026 18:35:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
 <f617645d-69c6-4fa0-8176-1837b982ab7a@intel.com> <an4UMRmPXPbTnBGh@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <an4UMRmPXPbTnBGh@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ2PR11MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e1b4d5-09dc-48f4-2e44-08defa04b4ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OvBLbJKJg5X6qiiKiieGmXUGi/AJoqTYvgnwlJ6g6TVIgA33cv7AbHyo7KwrJaqUdwPdIPqVAhaPlpVSdnJZZdiGyQ83XTvvhgfccISTPtbp70pf1zteqk5scU82u51YLQwCDX/jtIpRRnKH1baQxs2joFFDHHiE5J6+EiJsgkry1ptP5ou88j5mZb50JNKbArm249KvU4boaKOcYQJPnY1fcbhU0IkQbgIThyyESe8q3+P3G4mcZ8DzeFMA7jgVmxkQnn9J4xv34m3Zm777qb5MLUD+BWg6hOWR6x3q6+gUN0S8d1D8XNOs6wMGjekpriC7wMWn1xGUEPLDWDeRh6mQrYlJcq92rvSEC07bwikFIuav8pBtVXylF4L20dIg+VlIG6VTb9gW6uiuKq8hmQyalbjuDUCv/VnCr/T2mh/aLX01WfgNlJmJy8WliGhRvcXWKx0Kd0gy7CFSjistWFwndyzX0vLKS1h6sTZMsJOfERnW0WjZl4z86LXCki7a6qfEfgbr9/txUx/Qr3g3ZhoC+swvNq4PfR/gfgSNlS3p+rj4InVfiEO5ZeR3OIPa4N/EpHwR5iPxWgZa3MNG3d1oZpXRxOXoPDt2jh/OTRst8ep+jvnyGAWid5OhpUIS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0cyUjJ5ZVRiMUY5d3BxTGZidzR5RHptMXJOMEVuVHV0NkdFNU0xZVlGSG5H?=
 =?utf-8?B?azdkOVUvZi9WdDRyM0FoMkxuU0M4SWFNbHNTQ3FpTGY1RVZaUTRqTWZ2VVd4?=
 =?utf-8?B?YzVFYlJhNFBZZnBCR2xWSHZzTEtncGR0bWtGS3R3bWZQanJrVSt1Q1FvZXFS?=
 =?utf-8?B?d2tPNzFESjBqOEREc2RzWXNiWUtkL3FMZHB1OGRMaEk4UXNoMy9hMUtkNXlo?=
 =?utf-8?B?OXRrOUQ4bDRqdUR2RW5kL0tVWTZ4bHFKRGlNd21EbnNsamNDaFFiS3gxdkIx?=
 =?utf-8?B?ZlFRUVc5b09abWFkdS9XbGY2VzE3aUdDLzZYQmoxWHp6ZWROd2lsRDRIRjVM?=
 =?utf-8?B?RzNMbkpCZ0NUY3gxcjdwRWN5R0NMZ1ljb3M0MnRpR3NVZmVGVlVOWFJrenc0?=
 =?utf-8?B?NmhwRitRMzhMWjNib0JTY2EzUEdhb3lUMlBGZElLNVhKbjlyRFp3WTVCVDR1?=
 =?utf-8?B?bmU1aUtjQWFCMzVmeXU4czdWOHZYNXlycXY3OFV6VE1odFNhQ2dqQk5YL00y?=
 =?utf-8?B?VmVyRDIvOUU0VEs4Um4wWXYvb1N0VTlnSERQOW8vcytWMnJUYXVTcmthTFYy?=
 =?utf-8?B?QkNqZDQ5WXRIczNSNE5wMzhWZlE4WkU2REIzS21XSlF6UEV3aHlkNkNGM1Ey?=
 =?utf-8?B?UkpHU1doeExDaGt2N05DMVdZN2JoL0FaUS9nNTMwdEM2Q1dPUGdSZC92V2VZ?=
 =?utf-8?B?UWt6dldKeFFsV3I0cldSQlFBWFNHTDRSR2xVU0szMUFZZEtuend3UXRtdm16?=
 =?utf-8?B?c0JjeXhmcTBiRU1CN0taZ2U3a1h2V1pHbGdSSW1VZVF5bFF1bUViV1ZYQk0x?=
 =?utf-8?B?SW9oQlVsN3Q3cFJoUmtyTTZ6RWN6TVZmTGoyQ2FhOXBlY3hGRlFoTEhIdGtI?=
 =?utf-8?B?cHhUdHVScWFvdStxSzVwNmExdHRmSjBQL3pOUFNQbS9WY2Z1bitKNGR5UzBR?=
 =?utf-8?B?SEx5dUl2UlhnZ3ZJa2xTMXdhQ1pqSSt3UVIvT2tSMkFCc2pRRmpLVzEySUQy?=
 =?utf-8?B?MWFpdWhtZjU3NHpkZGQ0R2RLcTkzRG5TTUhoRUh2ZkRwcHV1KzU0N3NTTEJZ?=
 =?utf-8?B?VHQ1V2RxcVVPWDQ1R05uL2FEbW84MTk2R3UyY3hFdmlSRElnVlMwdTU4MndJ?=
 =?utf-8?B?WEJtRWJWc3FvSXUwUlo0b2JLa2lSWVBUR1gra0M1TG9TYkd3ZG03ODVhTVZF?=
 =?utf-8?B?dzNpUmFIT2dsK3hHOXRnMUFHYXdMYk9tVlRDZWxjWG1qTExKZzc3aGNybGRS?=
 =?utf-8?B?ME13QWtvUWxyK0RzNjNXclQrdGorNmI0SGluWkR3eUJobG1nYWp5ZkdwRDh1?=
 =?utf-8?B?MVlLTThMaVd2WVZON0o4Zzl4SFRaYkZ1MGxEUml1UEswWmFYSDJ3Q1BrWExK?=
 =?utf-8?B?ZVNwTk83UEFsN3FYME1zYUFBRURMVU9raGVWNXZVM1hHaS9QWU5NVWNYeDZW?=
 =?utf-8?B?NHo5aUYzS3pIMVZqQndqVmhBejdNcFB5ZitxRXR1NkhrYXlnRUhCY0xhajVl?=
 =?utf-8?B?N0lnZHlkeEZRa0padS9KVG1ydk85ajV5RnNMUG1aTk1GMERhQnRzZmdJNWlo?=
 =?utf-8?B?UHlwODJ2ZE9sWS80cVB2Zjd6YUVtTHVVYW11NXZHMFZsVld5U0N2KzQrZ3E2?=
 =?utf-8?B?bmZwQVBHM0J5cGpiM0E1VjR0TXg4ZGlBZkhrNFh0TVozd2RPYzcydU1hU3VZ?=
 =?utf-8?B?VTlteVAyVDVZNmJkandRM1FoNE05U1FkaE5pOGZtajBXdVVZc0haRlZHRjda?=
 =?utf-8?B?SStyQk9JMDIzb09CNTBNUEVhUGphYzFQaGY0cnRZY3ZkaVY3UG5PcWRCWkJp?=
 =?utf-8?B?REtxS2EwK0htWWM0U1QrZGxrUGpFbExxMmk4WHQ2dDZnYWtOdTQzRWk2dFFJ?=
 =?utf-8?B?TU5jSm1yVzhvdlNVOW9lbENPcmJFU0tZZ1lDSCtueGVLUlh0VURONFBNemtz?=
 =?utf-8?B?aTBrRDZMcCtJaUtwWnIxanZsU3BHL2p2Nkg3VU9EWStvZmw0bGhBSGpsemti?=
 =?utf-8?B?aFcxTjVLMHhpVS9pb1RGMklNYjl5OVRCcnkvT1FFMU5hVzMydlBRc1QxR1Uv?=
 =?utf-8?B?UXNPVTFjb0I5K3F0SWNYVGJBYm0rRTdmcHFZQWovTllBUXkvalBBR3kxb1pm?=
 =?utf-8?B?MU9DaVRoZ3RRUzZWY2xWQ0xIbFJEdXRsUnFVLytRUVpyeGlsZElyRThOQnF1?=
 =?utf-8?B?UGEyR1B6M0poMis4Q1l6cDdvR3Z0akFteTBMR3loTFlKWlUreUlMazJqWHlF?=
 =?utf-8?B?b0xDeTJFd0JScUZCcWw3WTl1UWw5SGNsMUpwbU5FREN1K1p0a091MHRmVkNr?=
 =?utf-8?B?U2hvRi9FNnh0Ulo5VGF6VFNWQXpwUysvQU9RVFpJZGdrS3ZNUlZmdz09?=
X-Exchange-RoutingPolicyChecked: PNQgwaOl9zQ7KHy6wJ2fyWD5S4y9/E2N/gz3GL1ixVFK2HA/cYDFC3HMdoHlw4TYKZzQoLBMBAV4+PrDrpeC9+v5LZ9gQhuwpAgtM+gWt1QFdgq9bNPET1O1Dtgi8s+EmX2Y+EDrKjKfG7CZqviJdKZ/4L93tBX/X6MOtuTrI+ec9top0Jb6ZV0Z0PDySXu7Tu3R+yQ8HzelXpri1Omls8+xTgkYTCnSE/TR2A6d8YbhGbwD8v2cEWXQj/zMOmTX5gzJx2PhzJWmw5EuU0GFAcXj13Dsd+vyJ3IAUhxLmF0mvSUt9SlNESz67m9c12iGvBiLsQpvxBkAfHdHyqmnlw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e1b4d5-09dc-48f4-2e44-08defa04b4ef
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:05:25.6647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: re8e274BuY/updqUWa7M8klxKZwZoyJ7YJeTn2lOZQtulZdC229/iw6XbZMUIJRZz9RR5X4PIhzodqj3CSL6AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8498
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

On 14-08-2026 00:30, Rodrigo Vivi wrote:
> On Thu, Aug 13, 2026 at 07:12:41PM +0530, Nilawar, Badal wrote:
>> Hi Michal,
>>
>> Couple of comments, on rate-limiting and XE_SIGID_WEDGED, from v3 https://patchwork.freedesktop.org/patch/743308/?series=171022&rev=3#comment_1373861
>>
>> are not answered/addressed.
> Hi Badal, could you please be more specific about the questions and repeat them here?
> I couldn't find from the provided url...
>
> But as we chatted, this series doesn't change the behavior of that and
> the comment of rate-limit is exactly to ensure this is documented. To
> ensure it is clear dmesg is not an ABI. It should not be reliable in
> any way or shape. It is simpler a helper.
Ok.
>
> On the wedge, the resolution buckets were removed, but I'm not sure
> if there were more questions around that.

My concern is about statement "Pick per *report site*, not per 
incident", XE_SIGID_WEDGED is not site specific SIGID. It can be 
reported from multiple sites.

>
>>> + * Examples::
>>> + *
>>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
>>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
>>> + *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
>>> + */
>>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>> +		 u32 component, u32 location, const void *data, size_t len,
>>> +		 const char *fmt, ...)
>>> +{
>>> +	struct va_format vaf;
>>> +	va_list args;
>>> +
>>> +	va_start(args, fmt);
>>> +	vaf.fmt = fmt;
>>> +	vaf.va = &args;
>>> +
>>> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>>> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>>> +
>>  From kunit example I got this output for hardware errors.
>> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR*
>> SIGID=204 (0102030405060708090a0b0c) [Hardware Error]: testing HARDWARE
>> signature
>> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR*
>> SIGID=202 CORRECTED (0102030405060708090a0b0c) [Hardware Error]: Tile1:
>> testing HARDWARE signature
>>
>> SIGIDs 202 and 204 correspond to the XE_RAS_COMP_DEVICE_MEMORY and
>> XE_RAS_COMP_FABRIC components returned by firmware via xe_ras_error_class.
>> If we want the component name to be included in the error message, what
>> should be passed to the logging helper? The current KUnit test uses
>> XE_LOG_COMPONENT_NONE, so no component information is being emitted.
> Our design goal here was to minimize the SIGIDs and make it per site
> due to maintenability concerns.
>
> There will be a field in the actual CPER with location and that can
> also be printed in the msg if needed. In a matter of fact, this
> is what we currently do anyway.
>
> Increasing this to a per case id is a big no!

Agreed.

Thanks,
Badal

>
> Thanks,
> Rodrigo.
>
>> Thanks,
>> Badal
>>
>>> +	va_end(args);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>>> new file mode 100644
>>> index 000000000000..d475e816ee0b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_log.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_LOG_H_
>>> +#define _XE_LOG_H_
>>> +
>>> +#include <linux/cper.h>
>>> +
>>> +#include "abi/xe_sigid_abi.h"
>>> +
>>> +struct pci_dev;
>>> +
>>> +__printf(8, 9)
>>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>> +		 u32 component, u32 location, const void *data, size_t len,
>>> +		 const char *fmt, ...);
>>> +
>>> +#endif
