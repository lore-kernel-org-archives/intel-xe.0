Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F59C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 09:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ADA10F7EC;
	Fri,  3 May 2024 09:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYMOxwT5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF86510E059
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714730091; x=1746266091;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zfAj8ZaO2TKVOpxu6fstaQwRzWV9gBcriuaGkyxIgEQ=;
 b=mYMOxwT5+MmPp8guI1u/Dg95Cz5dhcw7cC0NeXCwpEb75DlAwB7qSTD4
 58RssMQTrZ7dK7Xz2RYs0aTST/1pGTijopY0SyJ515hkegHlUdia0sBPK
 CEpe3/rF1rkAIvZsa/bS/b+ZP3Kwt2sm1ryw2hERJkEr2XF+jckVzkaKG
 +03ksIDcr80ZYrokY6GKKjjvGC3bWpgJFwbjEYwSorwHHUIjU7dGts0JC
 WicBzVIoAfRid73Sk7iPOtDmUeAQj70knNPktC6aOoQU/ICl/ZtJgahy2
 5PkcPR96GuG/KIKOYrFjKmiTECg7MtUaZFbsHLcjJELGJRHPUFxoqJF4w A==;
X-CSE-ConnectionGUID: Ba9EqvMGTMu+eQYXGMoL1Q==
X-CSE-MsgGUID: 9ltNIjOgSpqC7DOOuGrGUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10360794"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10360794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 02:54:50 -0700
X-CSE-ConnectionGUID: +R7ZZntlTAmCSRYV4O1Ikg==
X-CSE-MsgGUID: naOLmzkdQp23rM9iXgKM8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27437462"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 02:54:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:54:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 02:54:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 02:54:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdqJooOXrAE+OH+SCwRpGMTvyoWux4DQFXt0pyEBbYon36uakorujuVpcuqPrxE8EG4j3s+E+ykhh2WfXYuAmtL7+rv0lUhsi+sl7BmfA+RFT3sqDxR+/fw16AtqjFpLxtkBaY4CC941cS8EfwHghXw1OGVqz53+JLsc+zVEJmPYrMF4GVXo8YtcmC0jjtc4od1wh999ky/MeBYmrsr1EPFwNa7f0hr7KyCiOaxdQbo+kiwhDonnbCO5f66197VxL4RvEeWpN88oV29pFDDM5cPOfn6/S9hetcy3DG5EFirNtvmm8Soxkmh8JN5ZoZLkYYOOxaZ6q4klPN3holxeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dPIzanu03wjUhwGnOko2ypSSASl14gLr1HlzlyB4EM=;
 b=FpcvOKePV9n2TXT7HaO/eSqe91HF+9/ZHp09SeGaJ+Yy0PgGEgTwnjdxO28t8CVYG6LvBH9IzPNBa6miKo8iyJbRSlMBTJySwS9J4hz9CE2Kawz6c6+8f/StWSGZ/t3bivSoL4RelX32xOah94h97k3jr6nN0YwpTTyQ8w//XIPzrQNemPshxMY/opZwGYTAO9cVFMBtZk0TUaZItEogGU9Ja99XzNsV+QSopqwamCOOIPNorD0a6xvg0XqFTS3bpgrVewCdmDu06YhBINriq/NX6dn17+d3J4m96loodto8zyHKtV/HfqbD6/1dHeYwfZi3Ad5+hObgjmPne/x/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 09:54:46 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7544.023; Fri, 3 May 2024
 09:54:46 +0000
Message-ID: <7e379db6-3b3d-4129-8254-29ed548408d5@intel.com>
Date: Fri, 3 May 2024 11:54:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Refactor default device atomic settings
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Brian
 Welty" <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>, Jose Souza
 <jose.souza@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost
 <matthew.brost@intel.com>, Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng
 <oak.zeng@intel.com>, Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
 <6fbb932b-9525-4fce-9376-30f422da703d@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <6fbb932b-9525-4fce-9376-30f422da703d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZRAP278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::15) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA3PR11MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 32371c1a-a3f1-443b-95b9-08dc6b571090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2xNaS9ZMFBOYVk5NmlkNmJQMnpCdHVPQnQvdjhOMFNyU3FGNkQwbWxuR0hk?=
 =?utf-8?B?T3lsMGZWMDdCYUdsZHdpUFhEa1hEVXNJTEdYc0tCd2lmQU4waFgyNWJNVWdr?=
 =?utf-8?B?WFk3a0dWU3pST1l4S1Nwemdmc3NSaldhUklRMUowK2dBcVBicEZFMnoyQ205?=
 =?utf-8?B?MVp4ZVNOZ2tjRHJlU1F2eVpocWJLVFAwREF6Q2IyS1p6dmVuVEZnbU1STE40?=
 =?utf-8?B?L21pbUorWkdmL1dRM3N4VElDM01pQ3A4Q0hMT1FqYjRVRkNNNGt5RHkzcW1B?=
 =?utf-8?B?SjVzZHFtUUcwYkRFYnNQUkFiN3BmTjc2MG5RNnlEbFpLYnFEVllwRGhEd3JW?=
 =?utf-8?B?Z1dGT2ZqY1d2c0dnZzNhWUc5Um54SGxhb2JuSHNkL0psVXNhQllpSHdubEJo?=
 =?utf-8?B?bzk3UzVYM28weFRVNUdIYkxERWZ3ajc5U2p1SHpHanBvTFUyaVFUeHRtVmFN?=
 =?utf-8?B?M0RFVzR3ZmZQVjFvVm1TaDlQMXZkRllEZEt3bjlYaFBYamhNcjJycWJVbDJ2?=
 =?utf-8?B?c2QrL1IyWjBpMTExYmwzcmVCV21VdGNzd1hBRkdnWHdOTUNwek1yaEtOaTdL?=
 =?utf-8?B?UjdJZXYwUEpRejlJcEpNc1o1bkFvQWtkM0JUUlhGcU55bmZJMXZ0S2pDVFgr?=
 =?utf-8?B?ckJnaXljV3dYblNGd3JNS08wLy9kQjN6VjliK2JYZFBQeW81WGJrTSsxUWNa?=
 =?utf-8?B?WVpXRmpNLzJlTTJtZkhwL295a0lJUnVxTUs2SUplSnlSNGNFRElOOGljWExZ?=
 =?utf-8?B?RXVDSjJIMGhQUlg0OXA0MjhkRTZMV3FnVHRIancyWEdueGQ4QUdEbDhXUlk3?=
 =?utf-8?B?M2k0eUdHRDN5V216bWEvNmZjejk0WXZVOStVWC9hK3ZiaTUySXJCbC9uQzlo?=
 =?utf-8?B?WFFRVW1iRTdGNGhoZGRCcDd0Z0Z6QUQ3YnVrKzBObnVIdTN4c1RxTE44dHl5?=
 =?utf-8?B?b25VRW9hUVlsK0xqMGlXTWF2K2U2UjYvM1JRRmNXbnRGOUtDK2JxTWR3NGgx?=
 =?utf-8?B?NjJWSGJxbk1VVUY3QVdQekpiSlBGZlczaDhCZ0g0SnhPbkViSzdwS2lGUkNl?=
 =?utf-8?B?akd1b1poWjhTTTFGUkNwZ0ZRMS9XM1I4SEx1ckVjYVdJc1Vib3YvZS9Ccmhy?=
 =?utf-8?B?aUNBQXdkTFAwRkhUNGFHeFRzcmxMTjdXTWFOVTFua3U4SFpZYXJUOGhuUE5t?=
 =?utf-8?B?cHJ4YW5TbEN5ck5qYWl1QTZQK2VLSDJvc2VFcTI3b0ZacFY4TEZ2MDRWdjZB?=
 =?utf-8?B?bWZ5TGlBeHppYzB6bUxuelI5NFQraElTZ01YVWQyZTVMQkhqZnYvaHZlSGhJ?=
 =?utf-8?B?eEF1Q256akFXMWVvKzBBQ1hud1d6Yis4UXUrN3lVY2dmSExac0o3SktxeW1l?=
 =?utf-8?B?UWdMZldwRjc4UkNYc3h1NW1Cc05qRVBEWUFSOWdUSWZ6NzUyNmtEWm9NTFBK?=
 =?utf-8?B?UUF1U1l3Y0ZhQysxTVlyUXZOdTRad3M4SmphYkI1anE2bitGZERPbXVEd0U5?=
 =?utf-8?B?ZWFkSDMwc3l1SkN6ODRiY3NqKzhrbDBUV01BSGNhR3dFMzFvSEhRSGxyR2ty?=
 =?utf-8?B?UnVhaW5sbjZrUk9qUnNiTW9RaFFITlZkcXpFbVBFYTcyY09EMmQ0K1dCNzZP?=
 =?utf-8?Q?N2z4wUYHS51SJBQBLfEBC+2intMDP7CRO+D0eqCweDok=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDlBVHJPNXZpenRyNDUzdGVYQVFJYktBdXVJV3U1bkdzRDlTZUc4UWRISHZu?=
 =?utf-8?B?YUo3TUhQUVRIWTI1N3lFSDk4MFE4dFNIY3NSVTJDVTM1UlY2K0o5SDdHTlMz?=
 =?utf-8?B?NXgwelp6SG80VVp5czJUSXU2b2FZWlJxODhIT2pFSnNTc3ozR3N3NytOSFhG?=
 =?utf-8?B?VFBWNjBiTGxmcExIVnZBSmpkNU0wZS94VHk1VnhiOE8xNDRhVE5Xemx1Snp2?=
 =?utf-8?B?VEFwbnpybFF3UHNaWjFrVVN1bHB5aTFrYnVtOWtOY2FKV0VGMXNNMmE3dWI2?=
 =?utf-8?B?c282cDZ4bHp5aFd3S005TVlMcVIxNGZiaEhDV0Jyb1dDc3FBQ2Z2aFN0cklz?=
 =?utf-8?B?N0dweDE2MlJ6T2phc3ZKSURiQlhSMkRyajRNL0VyWnVoNlBkTW44eC9oNTUw?=
 =?utf-8?B?b2xubmtqQTJuaG1aRmg1ZUpYbEFOMUJ2NnE4NGgwaEJRUWU2WXZBWHI1M0tL?=
 =?utf-8?B?Y1gxaXJ4cldSdUp0ZkY5UWd4bHBERlJsUVp4ZDZtOW1iSmhkTE9SV2lNOUdG?=
 =?utf-8?B?by9xSUR5RlEzZVdxQzJLR0JPYzU5bGFqZFZiVUFpb2FudXZsZXhPZC9aeEpM?=
 =?utf-8?B?cHdJSjBoZ0J5U1RQY2h3Y09icFh4RExmSG9DbDNRMlo3clQ5MjkvdFo4VHVt?=
 =?utf-8?B?bE4zeDdhMHc5b3ZOdHRQRU1aUEo5YTZ3azZYQnFraDVRTFYrVFVuTzBrSkhE?=
 =?utf-8?B?SnlxaG43V3EvcENiYXRvak8wOXMvQTZaMjFLbE1UcTR2VTcvc2lpdWJjZ2Qx?=
 =?utf-8?B?UVJOc2NzUlFnRnpReVJVSTlLMnBpeml5RnlEVVFJVUlkR3k1UHdNZXZySUNh?=
 =?utf-8?B?cnRoemxrZjJMM0tsc3hxQWFnTEN4R2tOT0Zma2tPN0cwaTN6dWdNUnI0ekFn?=
 =?utf-8?B?TWtzOXduRGdiaU1TU3NrajJrMi8weVdnbjdid0p6UFZVN3dwTFE2d202L2J5?=
 =?utf-8?B?VFVBMzJyUnlnSTJFYlY2K21sZTZUYVlKYnlCUXVYckdYd2d1eVN5M2pRU25R?=
 =?utf-8?B?ZXVLZExQRXFPZ1NxRkJ1em9MeTBzRGlaMnJuNmtRbkgraXdyakMwWDZPSEh1?=
 =?utf-8?B?WnA5TVVqMk8ybVkrTWpMc2xKSXZjZ1pVckJzbmFXaSt2cEY4NW44M1dKUVJa?=
 =?utf-8?B?S3lTT3lrUmVGTC9lWU5na3VkZDRCTVdUMUY4WEk5T3ZWRldGRG9IemhkVUFN?=
 =?utf-8?B?dnVJdnBPTGdiOHVpdDRLdnVHUTlOb3JNd3E4YmNieVA3VS9pbmlRVHl4NWFx?=
 =?utf-8?B?bDVXVWJHaTJ5WFB0R29IODBtbWNJZGw4WGQ1YTJycWxYdkVmK2tqdkR3ZWpo?=
 =?utf-8?B?MG0rdDVRK1huMlg0cmFCY2pGelJCb2p4SEhlSTFQemNTRHB3ZDFLcTlxbWhx?=
 =?utf-8?B?ekNCeVZrY2EzQks5TEl6cGtFd2trNnloWGllUDlkMytza05ET1RsY1hkcnRR?=
 =?utf-8?B?RDlEZnpWeitHaXE4ZnhNa0luTmtZWkJ2NkNtL01ESFNORVVtZnRXWW1pazBB?=
 =?utf-8?B?UktNZXFTbitYWTJPWHZUd0NXRDZISEpMOTZmR2RjSU9DR1cyV0RDVlUycWdY?=
 =?utf-8?B?V0x5R2M1VHNHOERFQUNyMUxhb3Z1UmltNlhEVW43NjhyaklNYzliK1V5dUlS?=
 =?utf-8?B?akhNVE51OUVaWTJmZzZKaGw2a0dJUUpVSUMyUTJYUktuWkRDYmxDZmZjTTBr?=
 =?utf-8?B?N3BTOURGODBmdGlyVjlmQWVXbk0zcHQxS0F4dzBDR1pNc0NIVElYczF4SDUr?=
 =?utf-8?B?S3hpaUdDbjNobnQ0VWR2ZnlFcjVzWG1xb2R2L3FXNGVOaGxob0JpWUovSDI3?=
 =?utf-8?B?eW91NzhPR3ZmaFFheWgzWEVVTlpQcy91WEF0a2x5Z3ZOb0o2S1o3a1c4Qmpt?=
 =?utf-8?B?RGRRVWFnaEFiWU9kcEZuRTdPdnBGbXdmQWRlTTJIZ2UzTmUwTTBmRjJSQi9T?=
 =?utf-8?B?Y1l0Y3hOY0NkQm0rcEJBeXVpMlhtc0NyVHlHR1ZUdi9PeHZ3Sm5XTXUxVTdZ?=
 =?utf-8?B?dzFOVjgrSmV6ak5YdzNtYkxYRjVoeHd5RDNlRGV1dGt4empYMVREME1QVDhm?=
 =?utf-8?B?Tmd5UW54Znp6Z2lpbXZNaFUvK0dicGxNYUVHM0dNU01jS0VRdHBSZ3p6NG1G?=
 =?utf-8?Q?DCySsEhskNHajSHs/DCXY9GcI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32371c1a-a3f1-443b-95b9-08dc6b571090
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 09:54:46.6383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXrYpiA6XvCxlBGdYI7tIFc8BCQpoiBZTuFO6+DyzbBCj5ELm7OftTixP2/LYwcd5XrlsNSgiun/pkmGILHgnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
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

Hi Lionel,

On 5/3/2024 11:47 AM, Lionel Landwerlin wrote:
> Hi Nirmoy,
>
> I've updated our Mesa MR for this : 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28823
>
> But then I started to wonder if we needed to do anything at all with 
> this v6.

No, there is nothing to do for traditional APIs.


> The only scenario I'm not sure about is this : a BO is created with 2 
> placements LMEM+SMEM. When Xe migrates the BO from LMEM to SMEM due to 
> LMEM pressure, does it set AE bit in the PTE?
> And then if promoted back to LMEM, is the PTE config DM=1 and AE=0 again?


For traditional API( not using fault/LR VM) then both backend will have 
AE=1, so on LMEM pressure if the buffer is backed by SMEM, it will have 
AE=1 as well.


Regards,

Nirmoy

>
> Thanks,
>
> -Lionel
>
> On 30/04/2024 19:25, Nirmoy Das wrote:
>> The default behavior of device atomics depends on the
>> VM type and buffer allocation types. Device atomics are
>> expected to function with all types of allocations for
>> traditional applications/APIs. Additionally, in compute/SVM
>> API scenarios with fault mode or LR mode VMs, device atomics
>> must work with single-region allocations. In all other cases
>> device atomics should be disabled by default. PVC needs special
>> care as it doesn't support device atomics on SMEM.
>>
>> v6: Only check LR mode to determine compute API as fault
>>      mode requires LR mode(Jose)
>>      Set AE=1 on SMEM+LMEM allocation when a buffer is migrated
>>      to LMEM from SMEM(Brian)
>>
>> v5: Fix broken atomics on PVC from v4 changes.
>>
>> v4: Previous assumption that device atomics should be disabled
>>      by default on SMEM only BO was wrong as traditional applications
>>      will not use such allocations for CPU atomics. So remove the
>>      VM bind flag and the query uAPI and instead refactor default device
>>      atomics settings as per VM type and buffer allocations.
>>
>>
>> v3: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
>>      Remove redundant coh_mode param from 
>> xe_vm_bind_ioctl_validate_bo().
>>      Remove has_device_atomics_on_smem from xe_graphics_desc(Jose).
>>      Replace DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM with
>>      config flag DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM(Jose).
>>      Mention that PTE_AE will not be applied to userptr(Matt R)
>>
>> v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
>>      Use XE_IOCTL_DBG for checks(Matt B).
>>      Move platform checks with help of adding flags in
>>      intel_device_info(Matt B).
>>      Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B).
>>      Create query uAPI for this newly added VM bind flag(Jose, Lionel).
>>
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Cc: Brian Welty <brian.welty@intel.com>
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Jose Souza <jose.souza@intel.com>
>> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>
>> Nirmoy Das (5):
>>    drm/xe: Introduce has_atomic_enable_pte_bit device info
>>    drm/xe: Move vm bind bo validation to a helper function
>>    drm/xe: Introduce has_device_atomics_on_smem device info
>>    drm/xe: Add function to check if BO has single placement
>>    drm/xe: Refactor default device atomic settings
>>
>>   drivers/gpu/drm/xe/xe_bo.c           | 14 +++++
>>   drivers/gpu/drm/xe/xe_bo.h           |  1 +
>>   drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>>   drivers/gpu/drm/xe/xe_pci.c          |  5 ++
>>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>   drivers/gpu/drm/xe/xe_pt.c           | 37 +++++++++++--
>>   drivers/gpu/drm/xe/xe_vm.c           | 79 ++++++++++++++++------------
>>   7 files changed, 103 insertions(+), 38 deletions(-)
>>
>
