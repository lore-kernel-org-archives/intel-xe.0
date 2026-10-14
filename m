Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A09ECC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 00:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE1A10EA48;
	Wed, 14 Oct 2026 00:31:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CCE10EA48
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 00:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791937858; x=1823473858;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bkUJXr79aRyWy90EMxs+6ElAGZM+eBt4P+P7MVKnB88=;
 b=V4VbuzrVd9P2yN/7Ea/ywkUz7nvu+gNdMCBDaxWwyLt/iF04go5KvmLm
 XIGAy5vdqlpgMajmTXaGYhZlrThkGikWIiY0rDn9umSHAOTTETT6gR5ma
 HqMAJ22HCwRAN2tvv9zGv3AiIWrw9afmTetTwNHECJyGPSCpSpqeScv1L
 Qmzev635bFyfq6Zd50WvcHumVSbd2UGpJoz1YtHuFy8WMw/Q+CXkemnRb
 IKCbz/gQ1ZT8fyMjptdSWLGZUwDQ3s5gM4pnqghpGPIo0Y2w+wRWObPw9
 iRtlaca5DKWjIFTl0+0TgCjuxEnZbf4EKM48mmqwMb03R8O7kv51CqL5S w==;
X-CSE-ConnectionGUID: oX1JiN6ORB+vllT925AsBA==
X-CSE-MsgGUID: R2RfnxvzQ6myrTJfB8HWBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="781011"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="781011"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 17:30:58 -0700
X-CSE-ConnectionGUID: Cs7M38QXS0Sa6URtEgpJgw==
X-CSE-MsgGUID: cgaFt7n4RHyxhYlqqJqVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3141637"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 17:30:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 17:30:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 17:30:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 17:30:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HadfMPAds3LQ89Ylckxp+cklA6lcdKLPa9f16+Bg86S7dBOKUQ78YRt/ZoxNtu9j7g0vp5L7gx/Y8hp5sEPa0Ag1zlmD88xLMOt+954BfqRHG2yRpX1ci1NBCgmJDFuROpg+34ml8J4gceK5Kr1IvbrWWvRJvF75tSoQ7EEQhYQMLThOtMEfJEOeqSzLiJTnf7noiSGfGDJH8VhJopbT/QiKCEmZevS5Zwj2Fh8B3V7PR6qD8eZ1mNgE1vIbB6OvRFyfXGdwIE1RbhoBZrOvrYJPEuMPWvsWhy+1dCx1DrmXC3PN0bxCZYdXC8nSD0MXEjbEADM0x5wjmovkoJaakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OynbXW2me3T80lOyDu6JfpYUbS9Wp3/+6hjOyr9KsI=;
 b=K+7GNCW6YwW5b+92vy7sUJtJCg9XZ5UAiw304PXnYhX8subUigUSSHfQuGJEpz8z/9aZ5C8PY3CqQUgMFFYMdpjEEJOGrq/VfSV8PAMdhtzzjDBpBrC0iny/8VQqjYcbrVJc1GbJH+rN4wifAhVo8CJIWLgOLBotifuV8vIyx3PMTL2nv2S+dPKuMQO+aK8fq/LQt1QVGS8b1wGdN1+aH1gCYt57+Qr5goHB5P7nAlDRUtKcyKtktf0PVBJqJqY6694Cw37qn69oq8axQrCMytPpYb7PARWBBKcuz1S7N1cyOisW5ms4Lo4U5rZlYPsblQ4AkhNqeQUTiwaIl5ejFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by SA1PR11MB8279.namprd11.prod.outlook.com
 (2603:10b6:806:25c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 00:30:55 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::c18e:c2af:9f19:8022]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::c18e:c2af:9f19:8022%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 00:30:55 +0000
Message-ID: <d017a880-898d-4253-889d-13ca1e3963c8@intel.com>
Date: Tue, 13 Oct 2026 17:30:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] drm/xe/forcewake: add delayed release and
 lifecycle handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260930220820.2184643-1-zongyao.bai@intel.com> <as597xuyHECbO4hZ@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <as597xuyHECbO4hZ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|SA1PR11MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: a5dd33d3-85ca-41de-dff4-08df298a690d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|10067099003|4143699003|261009221727099003|261009221227099003|11063799006|261009220027099003|261009223027099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info: /KHyXOpg0IClx4xGMjEwUQufi6OP4wTCY8I/VrLYHVNLtcYyDzX/TGbtr1EhJCrgDdj3GRbPhwXlgn6PFnnj0yWTjlCkWs96b3oOAA1n6y+/EDtCucRAUjOW0x9dETCPz51GU1vj7wj1MJU0RxUt9T5R5dIHEQuseLofoKJWR/6Qgv7pA0vMOCiDyFveL2srucAW+VydFDp1u32FBLe6da2CTROopm2YRkzJdRAN88UIkODVNhUf1qugq/fPlbKhlaYkxR+s56VJLBR/OeDoWV6rSXocHewAoWpaKfn35kg9G39PX72sign26WGv1NTSzPEZjN8i1tszSZsKdLiIUkDp/s1vPyi7qml5VgZfI2CFeZL1dwnfFUNzKmpKPpPL7fsAibSVyJWWNu6cUFg275eCSsOt5fwbIhavEG8DNadnesHF6kOIrQibMEaLJ9ccBQSfAkBAhlx2Hiqv8gyXxEmz9g8YwFqsEfW4YUCBFFSsmX4Ic/+IVavuJOEvHoSRg3W/1RPJ/VjybM803rtlFv2cYRBeREONzZjw6JQMJc6qcmHGZw8MtGvYabjL6yuqNF6rBQIwPcPxMxTqCs0LuLpCHyFYi8oaYASnzX0h2teoivWCbpUJ8B/b92WRijjP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(261009221727099003)(261009221227099003)(11063799006)(261009220027099003)(261009223027099003)(261009223327099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWpWdlFIcUxWWEdWYVBqREdOQVdQcmw5dkp1bE14MHJMR2wvUGNvckJHSWd6?=
 =?utf-8?B?Y2JMUUpnR21OSllXQnIxV1lSSm5RZGFCZ0hxSy9UdnpzcjRLZjNQQmRHUHVP?=
 =?utf-8?B?NkNyNHZkeU0xMUxlUStSNFhOSEhYM2dCNUhjaWlpRzQ3Mkp3RmpHN2RFSG9H?=
 =?utf-8?B?K3E1ZmNSbTZkS3AwQUlWMU1NYjFiczF6VGRnWUVOWUs5M3c2VDFPTlowV01q?=
 =?utf-8?B?dFlneUpyejFRWmwxWVBZSytlUGp1cm9jVmI5amE4Yy9MRWxRcUxaZDQ4RUVs?=
 =?utf-8?B?MU5xYityamN4ank3N2pTWmNKYXIyMCs1R29sTStXeUVtQXNGQ2tLeHZFV3Jv?=
 =?utf-8?B?ZTJseHBNamhHUDBFUE9Za3RHOWZHSHBvN3AvVm5tSFlhWFhwZlloU3ZVcnVB?=
 =?utf-8?B?bFJGZExYMlozZmRUOFFGVXVJbDh0Wkk1eTBnUU9MK1hmVFFCOThIeGw5N2t2?=
 =?utf-8?B?Tm5XWXdJRzEwcEdUaVZ3Y3haNVJSQnN0N3IzMllkVEQ2ZExFV2lWemJGYnVV?=
 =?utf-8?B?RUNKSEhsVElBbExTeHUxRUFKQmY2aTd0L0x4bkRMS2RUWkc1bnJvQStzNjUz?=
 =?utf-8?B?bENDaHFoTllpT0N2bnNScHBpMzVxS0xtR0JEczVqM2hlek0rNEFWbGlNSDQx?=
 =?utf-8?B?NHhralozaWp6SWl4ejVRellKS0kydE8xWnd3dWdWYXQybTlqVXF6Q3kxUjVV?=
 =?utf-8?B?OVkvSzRhVW9Fbk9EcUQweWpGZnBtN1YzVlpyRHFZRVdBQjZwRnd1UVFuOCtM?=
 =?utf-8?B?VjZ5S2kvQStsekJub2djenNsVGhXSGhmZnNOUVZCWVQycFVBRE1TK1RKeXRL?=
 =?utf-8?B?dDZja2VmWlhIeVZJdjVMVGE1NmVadU5VY1ZZejJlRzZWWW5LVFg2dE1pZE9M?=
 =?utf-8?B?ZFIzR0NGVThxejB2WXA4U3ZRNVd5RHFERGVqYlZqU2prazJPNEkweTZ3eGFx?=
 =?utf-8?B?NU90SXl2Y2JkVHdWWVZMYUJOSTc0MzNDNmw5Uzd1eGlaM3d6Skd4WDJsOVF5?=
 =?utf-8?B?dXVnaGdMaUZnSlp2cFh0M09HZnVCQysxeHhQbzNFR2N1eHMwTktON2UzYnFu?=
 =?utf-8?B?YW13Z3FTQ2RncnJGbFZ5MEpWUTFHUndpa3VYZk1ocHZTb0RETnNmSkR4UnJo?=
 =?utf-8?B?clI5bnpNbnRJTW5LNDd5LzJYU2R2d2YxbmIzc0prbE1kMVJKb3FjK2dCUnBI?=
 =?utf-8?B?c2g3YzZJYzJHR3g0LytvVUJaZkgvbms4cHR4MDhYT3JwUGJJYmhuQ1F0aHdI?=
 =?utf-8?B?NDVReW9vWUR4ZWV4VVhld3Brb3FhYzkxd3l4Qm1HbFJLaFRXZFYzV1lCbUtJ?=
 =?utf-8?B?M2FnZThFb3Y4RU9SMzcvSGdkaE1mWWxjRFhXUkMxWDFnZU5ZTXFUMWZpRE9J?=
 =?utf-8?B?ZTlTUk9vanhZcy8zcHM3RnAvTWlPL0xISDFrL2dsbXBGMVd5L08wU01XSlBV?=
 =?utf-8?B?ZWt0QzlMazNzVjd0YlBERExCSW1sZGVkM3JXUHlsY3ZwbGRnSWtubldPTWlZ?=
 =?utf-8?B?Zm1XOFIrQUFPdWxnTER3bDVuN1NqcTZ3emcvalZGQndzN3Q3azVjelVXT2Jh?=
 =?utf-8?B?VzE3NUp4RXNDRXZ3dGYyVmlOOUsrMktJbWk0UWFkdEJFYnViR2tSSUJuZmI2?=
 =?utf-8?B?N25tUjFSZ0dsOUVhdWZSSE5QN2hhRmZqSTdQblJWd0F5eTQxL0pkRGNTOFpG?=
 =?utf-8?B?Y1lnTUxUVk5TK0RpSW5ZbElmRlJBL3NWUUx5MVdIWHdneTgrN0tCUzFmSmw2?=
 =?utf-8?B?dE5zQ0g2bWxYRDhYM093TlBjZjlLYjY1U0JLbGJ5eVFYL214T0lZSGdIQjgy?=
 =?utf-8?B?ZTJQWnFCdFhwRnQ0UktUL1I1U0xLdUFrZWc3L1RleG1vUGhCNE9mYStlV1ZZ?=
 =?utf-8?B?KzRDN0g0WXFsRGVLMDhvTkw4cHZwdXI0QllsZnB4TGJ6b3hmaHo2b1pwWDZt?=
 =?utf-8?B?UWhoOXIyaU13cXVtaHlrelNEVkhQN0tKVVpwcFpLNVZjQzJQUTNBZ3pwU0VZ?=
 =?utf-8?B?Unk0RUY2Y2hEVGkyVXdCTGNDTUJBbUZNcFhEK0pNaWg4ZGtsdTBLVVZoUHVT?=
 =?utf-8?B?MUhsSWtIWFRQSS9nNWQxOHhTUnJCMUE3T0hjTlJnZnMzTVpSZ3FTcGdEbWV1?=
 =?utf-8?B?eEwvMW42OGs3blRJRlFPUDVKSVdJVVhsN0tkK0dIelA3bkc4TElQMklraXZ6?=
 =?utf-8?B?S1NlaXc4L2c3ZHVHaWtEU2JoUFVPazhha3RCL1NXRStYYmYyUHpoUm05dlc4?=
 =?utf-8?B?UUhKTk1ZSlQ3M0RuVWxlSUkvcDdKdFpLZWlYS2hCb09xUE84SFEzbWwxMmxs?=
 =?utf-8?B?TnpBYVcvNHpqWXZsWWdKQjl2N2pqVVFqU0dnNXRITVVRalVud3B2UT09?=
X-Exchange-RoutingPolicyChecked: y9hg5h7v+9nGt17vmjVLm4tR/V9olyrZw4gol0uOKT0I3lb4GmClpjC8G1hJIkwj9eB80jpf2J/wYrs5aouCIBBZiQnZjq+UUg02zUz36tFsheiDzlGZ5F8CqcwIAync42xpajy+e3StG9ToMxDphmAiW3nIWIligmv95B18F8XsZOZDoiq3ulxc6qDaWocRztGv1Cv8Xc4BkZRnP0whfA+p4dOc3cU8KKPIqHTSNRdb+CPD0Uaf5H98Drtk1jWdyhRlIzwe32rXBdfiI4hGiNFIDll1HP4B4QT7u9Ai8u9DMsr+GMYk1n+Ih9ha6t5vFCY5Sd3rzHmKz225aghkNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dd33d3-85ca-41de-dff4-08df298a690d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 00:30:55.6552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbKALv2sIPsrVIMAcicEQiYn+obgRW+FyU8hiuh/C+PrYzr7Bs2y/icyA8l1I+HUxKwa1ywvLGbKdALxpiYfpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
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


On 10/13/2026 11:52 AM, Rodrigo Vivi wrote:
> On Wed, Sep 30, 2026 at 03:08:16PM -0700, Zongyao Bai wrote:
>> From: "Bai, Zongyao" <zongyao.bai@intel.com>
>>
>> Engine-cycle queries used by profiling tools such as VTune and PTI can
>> arrive in bursts. Releasing forcewake immediately after every query makes
>> the next query issue another wake request and wait for its ACK.
>>
>> Add an opt-in delayed-release path with a bind-time configurable hold
>> interval, defaulting to 100 us. When the final overlapping forcewake
>> reference is dropped after a delayed-release request, keep the domain awake
>> for that interval. A get for the same domain before expiry cancels the
>> pending release and reuses the awake domain without another wake request or
>> ACK wait.
>>
>> Only engine-cycle queries request delayed release. Existing callers
>> continue to use the immediate-release API. Delayed-release state is per
>> domain, so a put that drops the final overlapping reference honors any
>> recorded delayed-release request.
>>
>> Protect engine-cycle MMIO access with drm_dev_enter()/drm_dev_exit() so
>> drm_dev_unplug() waits for admitted queries to drop their forcewake
>> references before teardown. For system and runtime suspend, synchronously
>> drain delayed state while keeping delayed release available after resume.
>>
>> For shutdown, removal, post-registration probe unwind, and devres teardown,
>> permanently disable new delayed releases and settle pending state with
>> xe_force_wake_stop(). Register the device-wide stop action after the
>> Driver-FLR action so reverse devres ordering settles delayed forcewake
>> state before Driver-FLR while MMIO is still valid. Keep the per-GT cleanup
>> as an idempotent fallback for earlier probe failures.
>>
>> For PCI error recovery, use xe_force_wake_stop_nosettle() before
>> pci_disable_device() on reset and on paths returning
>> PCI_ERS_RESULT_DISCONNECT. It disables delayed release, cancels timers, and
>> discards delayed-release bookkeeping without accessing MMIO.
> I'm having a hard time reviewing this series. The patches seems to mix
> multiple stuff into one. And the solution looks a lot over-engineering.
>
> why not using a simple histeresis timed put with a delayed queue?

Hi Vivi,

Thanks for your time. I totally agree with you about the over-engineering.

The series started as a minimal hrtimer-based delayed put. At first I
ignored the races with shutdown, driver unload, device remove, FLR, PCIe
reset, etc. Each review round exposed another race or lifecycle problem,
and fixing them made the patches more and more complex.

Why I did not pick delayed queue earlier:
When you asked about it before, I rejected it because the hold was 100us,
below jiffy granularity. I treated 100us as a target value, but it was
only an early tuning value. That was my mistake.

Switching to delayed_work has a trade-off: the hold becomes jiffy-granular
(one jiffy is 4ms with HZ=250, that is 4-8ms sleep hold in each cycle),
so the effective hold is a few milliseconds instead of 100us.
And since only the opt-in engine-cycles path is affected,
at the cost of slightly more power after a profiler query.

I'll also drop the configfs knob; with jiffy granularity a fixed hold of
a few milliseconds is enough, so a tunable is not needed.
If no more requirements, I'll submit a delay queue version in this week.

Thanks,
Zongyao

>
>> v10:
>>   - Please ignore v6~v9 in this series:
>>     https://patchwork.freedesktop.org/series/167697
>>     Those revisions used incorrect Root msg-id(s) by mistake.
>>     Created v10 to clean up the threading mess in previous revisions.
>>     No functional changes relative to v6.
>>     Rebase onto drm-xe-next at fa8b3b6c4a4b.
>>
>> v6:
>>   - Add a permanent delayed-release disable state and clear stale recorded
>>     requests on the immediate-release path.
>>   - Keep flush for system/runtime suspend and use terminal stop for
>>     shutdown, remove, probe unwind, and devres teardown.
>>   - Order the device-wide stop before Driver-FLR while retaining per-GT
>>     cleanup for earlier probe failures.
>>   - Add a no-MMIO stop for PCI reset and disconnect handling.
>>   - Use the configfs group lock when reading the hold interval.
>>   - Document the per-domain drain and discard state transitions.
>>
>> v5:
>>   - Split the original patch into four patches: unplug synchronization,
>>     delayed-release infrastructure, power-boundary flushing, and opt-in
>>     enablement/configuration.
>>   - Preserve a newer hold interval when an older timer callback is running,
>>     and settle an outstanding sleep ACK before waking a domain again.
>>     (Sashiko, Matt)
>>   - Synchronously cancel delayed-release timers during forcewake cleanup.
>>     (Sashiko, Matt)
>>   - Flush delayed releases during shutdown, device removal, and
>>     post-registration probe unwind in addition to system/runtime suspend.
>>     (Matt)
>>
>> Zongyao Bai (4):
>>    drm/xe/forcewake: synchronize engine-cycle access with unplug
>>    drm/xe/forcewake: add delayed-release state machine
>>    drm/xe/forcewake: quiesce delayed release across PM and teardown
>>    drm/xe/forcewake: enable configurable delayed forcewake release
>>
>>   drivers/gpu/drm/xe/xe_configfs.c         |  78 ++++++
>>   drivers/gpu/drm/xe/xe_configfs.h         |   5 +
>>   drivers/gpu/drm/xe/xe_defaults.h         |   1 +
>>   drivers/gpu/drm/xe/xe_device.c           |  33 ++-
>>   drivers/gpu/drm/xe/xe_device.h           |   1 +
>>   drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>>   drivers/gpu/drm/xe/xe_force_wake.c       | 337 +++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_force_wake.h       |  48 +++-
>>   drivers/gpu/drm/xe/xe_force_wake_types.h | 123 +++++++++
>>   drivers/gpu/drm/xe/xe_gt.c               |  18 +-
>>   drivers/gpu/drm/xe/xe_pci_error.c        |  23 +-
>>   drivers/gpu/drm/xe/xe_query.c            |  81 ++++--
>>   12 files changed, 696 insertions(+), 55 deletions(-)
>>
>>
>> base-commit: fa8b3b6c4a4b297bf95935065b63f8852cfc5481
>> -- 
>> 2.43.0
