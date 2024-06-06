Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF753C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 04:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6B510E0A5;
	Thu,  6 Jun 2024 04:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/HJPXXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749EA10E0A5
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 04:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717648485; x=1749184485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ojvB6iEToEMNj0AddY4slg5mxbeEbN9e2UlN/VpD1Mk=;
 b=K/HJPXXEfuBEearAdyT5YZz5sziA4ENJw2kEnWbGhRHqTzfoUy9dR+aK
 wDO2FicfPU+KR8AMy+VEi1L372Yt/gTBP8FW0uqe7MeVGp/cJeAiEhxMB
 qEBLtxHViBAi78q3i6blY7eB8n0LOYGeUlnjil+r/SJhXd9i1kcpqD6WL
 MZTIKnJ44pOqmdLbi5fKRTP+Ue/T1ssXl840BN1YzPrWBcsraa6K6Ug3O
 sp/tM1zTvexfkFY1Vl1NXhLMAnRcJQkhXUc3oGc2ziiTHzE80ubjqYJmI
 g6XMpS9XmN0HYfxA16aLtPeXFrBVyWTz1w8w9u5bqZJkFltJ3YQUWgcSL g==;
X-CSE-ConnectionGUID: Q6ZhUKcvRtStD9Np/kaBQA==
X-CSE-MsgGUID: 1f6SERnrQkao7+vHtZ9Ikw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24950928"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="24950928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 21:34:44 -0700
X-CSE-ConnectionGUID: qcF8DuoqQVCWXZzPIk/tJA==
X-CSE-MsgGUID: /Q14QC5WSZidtyOaebh+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="42754310"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 21:34:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 21:34:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 21:34:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 21:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4TTdt0Xt5QJ4wGYu3QwLa/KxZ/3UDjVDmSmeAn64LJt9dF0vsnNWem4u7/AxNLH3fy8vDKrPizmxU9Yt0Wh7DkH3hhIxO26946NL31j2e0sRRLFfzSBIKfAXjpvOcbLjKGkPm0Yoq97eKGYzvVTrOVO6JrMiIbVfLZYvMlWS1iM/nd7sZnrxLKegymqlZL5wUEME6kxkyfsK16wOkGVSBSDYMUIX1YMmZWP7ssMNfB7K0QpalbColf3DRUwfj5r/h+i9sIumHtJpFNOUuqKwteTeruvVRXaG3H6XJEESCN2hhmOHCIi0xsoj+MfiY92SGbSCKCkfZMMTcv25Ij7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAANJEMg/UXyJTWrr3sNNX7uKYtfSbxxMnHptD/B3MI=;
 b=RIin7dI5dUXyp0hCyMymNT4pXNR6pJLGPmmNOUvCrNb19vw55YitQpXfoH/nQh9hzm6tf2pV+3EmEVD8nc9J4LNPPHB1uUEXfeuz3BXkMhJHwEHuhEYEw82Vasr/tkyCy/5fsrbEfUyVMsuScE/L5oJFVH521JbEKX9MqFQqblbiWNRe9ApeMWmwCzi6lic1Sf4rI7GALt/6ZzzHU3wZwifSrgLY/ZHeMIphyfDVBdSOG2kClTht0ypDmrAtcd3RWHiIH/lkgw9m6gjHL1z6H2hBfLUs9FIOIEmEHjiTSY6gtmk4sBw8EAUmrZdzVdFsiOpSzJK0TRuVHksXUhaoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 6 Jun
 2024 04:34:40 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 04:34:40 +0000
Message-ID: <722e0474-dd1c-4925-8e44-f385d3fd0e48@intel.com>
Date: Thu, 6 Jun 2024 10:04:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: Matt Roper <matthew.d.roper@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
 <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
 <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
 <20240603210336.GA2906448@mdroper-desk1.amr.corp.intel.com>
 <8cc78563-5b65-40b7-b5d4-49fed52c6b88@intel.com>
 <20240605210915.GD2906448@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240605210915.GD2906448@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::30) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 069bc263-f0d1-4540-4acb-08dc85e1faec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWNnSWZiMDdVMWlVQktBakZqcm9YeUNtOTZPcGZpRjV4NlRwZEFKQVpLVUVh?=
 =?utf-8?B?NWd4aWRZWnhvVGw5RjRMTVZ4bElvUEtrbnE4Uk9kV3ZjNjV6VkJTaTExaERB?=
 =?utf-8?B?STIyK0E0UVk2aC9heDlUWHI1NEJUOUthakJHbXdMV1p3MmJ3eHZNWmJrZU9V?=
 =?utf-8?B?M1RFS25yYXVLYzViL1NOaDd1aEdydzIrendTVTFPbEw0bTM4U3cvVi8rRThF?=
 =?utf-8?B?QllOQVBqL2IwZFNSZC9MZ25mT285ZUJKYUYxSlNJTmxVY0Z1bDI0V3dDRnds?=
 =?utf-8?B?NnowSlZlQWNqcS8xUEJxeW1LN2pHY0JlVDZIcU14VEQ4QlNyNHdkTGlHT3Rq?=
 =?utf-8?B?M2NLV3g2ZW0rOVNqcnpYNW1lK1grZ2Q2ZXQvczRXMjdQeFRFK1dVVWlUVUR1?=
 =?utf-8?B?YnVwUU1Ia0RQQVBIekxxdUxTZy96V1NYQW1GQnFLeUJvOVd3Wk1lK25seVRU?=
 =?utf-8?B?RS9XMmhTZWlZdTJXWkQzdS9TWC9MRWRpS3IwUHBYclRrT25Wd1FtYWtsT2dL?=
 =?utf-8?B?aFB6VWs3YXk2dzBrMWwzaW1NRnNQMGhzUjU1VWx1b1NuVWVyR3RteFR3cDZi?=
 =?utf-8?B?V3hFUW0zdDcyYmdxUmt0VjN0dDFjbmtlU1hVWC9wME8rUFlXMkxKY1k1akpp?=
 =?utf-8?B?UnhHWVVaMEdSekorY1hlTjh4UXBkWXc0VkxaU0w1VytPelhHZzIxbVJVUkM5?=
 =?utf-8?B?dlVENnR5eHAxeVQxVmdoSjh3dGw0Z2Jvalkyc2NYeUxhYjdKTHcyWEdDdkRO?=
 =?utf-8?B?UVFvV1E0MHJpaG5iL3hnOVRJRkkxNlNSdmVoUEFSU0lSMGszYjJxS2V1U21l?=
 =?utf-8?B?TXpEZU41eStaUUJpWXZ3K3J4UURsb0J0c0R1MklpVlA5ZDdaU1BJcVYrcDlB?=
 =?utf-8?B?WGhucEkvMEJhbVRyVVhlekpTVnN1S2ZabXRzWHBUUGh3Y2J2VHZGa1hIRWtt?=
 =?utf-8?B?VnMrK25RKzhnclRzbGlRek5yK0xpNzJ3MEcrakd5YXM2RlBVQTJvWktVVnhE?=
 =?utf-8?B?dGpJblVSQjgrZEp1dnNqNURqd0ZubDBOTi9kaktTMzFSMndTeXJpUk9BRWQ2?=
 =?utf-8?B?N29uQ0JYUW5xUkdBZ05uT29DNmJrSUkrYzdtd1U3SDkzbzBrbmhUaTQ3Nk4y?=
 =?utf-8?B?WUkwdk1id05Wc2FPbEZsSkpHYWxvTDE1SmhHMzRHSUkwZCtRaHp2ejZtbHhU?=
 =?utf-8?B?a1lqM0l4eTZxVWZQSDMyZDdSb0QzQWVGNkZhaisxb0hQSmJ4emhjTzlkVmFk?=
 =?utf-8?B?SVBvcUQ1dWFSdjFreHgyVzg3S0lMLzVUSmlndVYxRGxDY1VYQlc3Z0NYWlNq?=
 =?utf-8?B?UEs1N0FEVDdhT0xBTFplMkxJdS84OE1UellRcUsrRVlWVkdVTjNUbkNiejNS?=
 =?utf-8?B?cnU5dTdtTHc2eStSODB0em9XKytsYVNHMTVCaGZ6UUQ0RkJmc2ZjNE51VHdY?=
 =?utf-8?B?akgveTdmbmhiUHd1MVdVdTYraG9Jekp6UDBET3cwOUhUS045MmEydFBpUDdK?=
 =?utf-8?B?YjAxaWZCK21vY1ltbC9YMnc4c043WVFwcXVRNjdvcE1EaTFmTFdpOEs5Qm9X?=
 =?utf-8?B?SjRFaVpwR0ZQM1JRQ050Y1I0b3lYcFJYWCtocXNVSWlxT1ZsamphTEk3Rmxo?=
 =?utf-8?B?VWFzRC9ENEt4eTZLTVhPMm1aalcvclVvUEdnUFJiWktrcUV3NjZMMHJ6RSsv?=
 =?utf-8?Q?J7bCYHWSaV562BpIiCYi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVBIYVdlMzNxaSs5TVQxaTM0bUViTFVia0dCWUpLZUtCdmVsMWF1azB5c0gz?=
 =?utf-8?B?L0FKWVBLQWZhbEJHUXBES2tNcXZTTmowSTB2bVJIMXNIcUw0TE5XRld1ZkVh?=
 =?utf-8?B?dWk0WWl0S0FaL0RuV2F0RVI3ZzI4YUprQklkMXBtWUl5VWdqQ1NNZXRUdFNO?=
 =?utf-8?B?Ymg2YUVLNUVJVUxqSGlyeExvT1UzblNDVDludEF2SiswOVhZMjFwMFRrWkFl?=
 =?utf-8?B?dmVaWGZHdXY4THBDb1RIU3JoMjVJbmU1OGlnUjhLaEFmNjBZenQ5eGVFZnlk?=
 =?utf-8?B?ZkJ0UG14b3piVlBuZ3B0cUR2YnFtbGd2Zk1OWDJlZlBaL050cUpVVEdvNlB3?=
 =?utf-8?B?NW5wOFYxMmZ0clJsQW9nRTlMVmF0QThLYnJ0NDQyaXZPNmJNRTFmVmg4WVhB?=
 =?utf-8?B?WWg4UWVjY3pzaEoyNzgwOWJoSVVZSVhhSW1WRDNnVWVPNnBXWEVSdVJZWndX?=
 =?utf-8?B?b28yOWNsb1FJbnp5RlBuM3N1bDlzNjJaT1ZFOXlpRFpDTVkxZE5TM1hoMnZF?=
 =?utf-8?B?SkN6VzNpV21sZW41RCsrMkx2RjVMdjZXVVp5Vml1bzZ1RG9WMEVBbDdxaXo4?=
 =?utf-8?B?YldxMERxZko1NnVhbDFZbVJFSFFWaGEzYXhGODR6M3Iydk4yWG5vL2daQXJT?=
 =?utf-8?B?WS9vazVMbGFWOWVuYXhmOVFwdzhhV3dZS0ZwMm5sbkU5b0JwREdXK1FqT0Vm?=
 =?utf-8?B?RVd4bzFsdnFBUGc2d3NaRDRKc1EzZkVhTnJ2NFdKZjBYQlFIZFlKTGgwanhH?=
 =?utf-8?B?eU9EV1dobFRCc1R3WGNsWDVmbWx5TWFsajdWTHFQTFVtYnkxNHVreUFCN29J?=
 =?utf-8?B?MGZQZFJHelpoTExtZ0J4N1JDb3U4dkNFQTdsMDU1NzM3Z2d6NkI0UDh0N0V5?=
 =?utf-8?B?WWVSeWFaYVNNUS9WWHJnSUI3MFVJRFpkaXNHbnhoeExnbk5XRGZtYUFabTBN?=
 =?utf-8?B?aFMyNDlRMnh5QnUyQ0F5MXFSZFFMSkt4M1ZrTTUwT1JaTTBvZTJCTEVWN2xW?=
 =?utf-8?B?aUlkZXRVcU9SOTVOK2Ezb1hzNnZjYzhiZ0hVS1hLYmYzVzdTbzczQlA0S3dR?=
 =?utf-8?B?Vy9lc0RpS2VTVlIxa1dtZ1FBK1Znd3RIUGp0eW8ydjNWbk5xMllWUGtLcG42?=
 =?utf-8?B?aVZwZWFYMkRTaFVSd0xZMWZLdHV3djUxbHY1K081alNuYXlEajBIenFTbnZ0?=
 =?utf-8?B?SytSei81Rm9pbFJTQnJML1FMc29VYlhpRzArRnQyb1BUYTdPVlJhcDlPblpO?=
 =?utf-8?B?Uk5RZThZWlNTZHF0aEtScHBBZ2xDNzRveFRsWDNaUzQ2QzMwMzd1dHFwSzAr?=
 =?utf-8?B?Q3ZNUUExT2ZMdnc5MFo3UTR3QnJMTkszT2Rwdi9kMnBFWjdyRmRNTkJsSW1T?=
 =?utf-8?B?TVlGMnlBalBnUUpmM3dXQjhqLzVLT001SktXZ25EajUwQ1c1TVYzMXkvSmFG?=
 =?utf-8?B?cnNjcWVJVGhKcEhKVGFqVlZORVdSRXR0T2tMOUIxYWRCS2l3dGZpcnN0MGxn?=
 =?utf-8?B?V0NuRndnM1Y1bGUwWk43ZUY5VE1ONTlDcEpqUGxZNXBxUjROMDF4Y2xZMHFs?=
 =?utf-8?B?bjNueW9uV1V6ZTR3dnpxSG9RNC83MmI4bkI5SjJpWXVsS1pPVllJbzBXcHJy?=
 =?utf-8?B?UmhPRGhvYnowUjRuNHB3SmZFeVFqMUdPYWRyamw2YnNIYVQvN0VLTmZpeklx?=
 =?utf-8?B?c245alZkZ3BsM2tqOEhNc1BoUWc1MG1kMWY2c3BTMHQxOWMrMXdsTitMc2xa?=
 =?utf-8?B?TFVWakFJMTFjVVB3WDVCTnVaYVdGM05DalV6QU5McGVjZlcvMklCRWQ1TFJT?=
 =?utf-8?B?WVFsV3d5LzFtRGRmaFp2R1piUmkwUmRnMlVBeHRnY0QzcjUzMEY5QWlGWmxM?=
 =?utf-8?B?NVUyRC9wMG9PT1ZKTEJCNE1sSGZZL1Rkb2wxVlFhdlBUbWJkWTFTWFJnQW54?=
 =?utf-8?B?Qzh6Ynd1aTJpVUtqaFVva1RiMkhtZVZiVWlVS0VubEx1a3E3OTFxSXU3c2FM?=
 =?utf-8?B?aUNBWVhNM3l0bHRUSElPL1RHNkVGZVR3S25sNStVdzk2OXVmQ0ptOU5XeTBL?=
 =?utf-8?B?R0NjclhaZDhZOHREZWVmWjNURUJCVE9JYTNLYUM4RDNNRWpHeXV1UVF3Ry9h?=
 =?utf-8?B?NXIzRzRjZmdTWlE3ZU5YMHJJY09iU0ZEOGdkdVR4bDA5cWNBVHJTMUVYMUJi?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 069bc263-f0d1-4540-4acb-08dc85e1faec
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 04:34:40.6821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls9P+jtd0CLfS+BCbFXwOQ1tpjcgjSfX/kExDaxuyRfQ3oj2eUg2fcng9jvjAe52lELiCynr1ky36PaaB3/1iN9RSdcXw+lC5vDUSlbFc3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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



On 06-06-2024 02:39, Matt Roper wrote:
> On Tue, Jun 04, 2024 at 04:22:00PM +0530, Nilawar, Badal wrote:
>>
>>
>> On 04-06-2024 02:33, Matt Roper wrote:
>>> On Thu, May 30, 2024 at 10:09:30PM +0530, Ghimiray, Himal Prasad wrote:
>>>>
>>>> On 30-05-2024 20:14, Nilawar, Badal wrote:
>>>>>
>>>>>
>>>>> On 30-05-2024 19:51, Nilawar, Badal wrote:
>>>>>>
>>>>>>
>>>>>> On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
>>>>>>> Make sure that the assertion condition covers the wakefulness of all
>>>>>>> domains for XE_FORCEWAKE_ALL.
>>>>>>>
>>>>>>> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of
>>>>>>> XE_WARN_ON macro")
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>> index 83cb157da7cc..9008928b187f 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>> @@ -32,7 +32,7 @@ static inline void
>>>>>>>     xe_force_wake_assert_held(struct xe_force_wake *fw,
>>>>>>>                   enum xe_force_wake_domains domain)
>>>>>>>     {
>>>>>>> -    xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>>>>>> +    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
>>>>>> This will always assert for when domain FORCEWAKE_ALL (0xFF).
>>>>>> Not all the platforms support all the domains.
>>>>>> e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use
>>>>>> case only bits for GT and RENDER will be set.
>>>>> I think to handle this correctly in struct xe_force_wake you can add new
>>>>> enum xe_force_wake_domains supported_domains to hold bitmap of supported
>>>>> forcewake domains. Use this bit map to check appropriate domains are
>>>>> set.
>>>>
>>>> Hi Badal,
>>>>
>>>> Thanks for taking time to review this. Agreed the check should be based on
>>>> supported domains.  Will look into this.
>>>
>>> I guess the real question here is why we'd ever be passing
>>> XE_FORCEWAKE_ALL to xe_force_wake_assert_held().  That assertion is used
>>> to sanity check that we're actually holding a necessary power domain
>>> before performing some operation that relies on it.  Nothing in the
>>> hardware should ever actually _need_ every single forcewake to be held
>>> at once; we just tend to grab XE_FORCEWAKE_ALL in some places of the
>>> code because it's simpler to just blindly grab everything at once (even
>>> the ones we don't truly need) than it is to figure out the specific set
>>> of domains that will get used.
>>
>> In the save/restore code path, both at the top level and in subsequent
>> levels, xe_forcewake_get() is called with XE_FORCEWAKE_ALL, as I believe it
>> accesses registers from different domains. In my opinion at subsequent
>> levels we should
>> %s/xe_forcewake_get/xe_force_wake_assert_held(XE_FORCEWAKE_ALL).
> 
> We just grab FORCEWAKE_ALL because we're lazy and don't want to add the
> code complexity to figure out the exact subset of power domains
> that are actually needed (which may vary by platform).  We usually do
> FORCEWAKE_ALL in places like device initialization or suspend/resume
> that aren't in a hot path and are only going to take a couple
> miliseconds total.  If multiple levels of the call stack grab forcewake
> redundantly, that's fine; forcewake is reference counted, so the calls
> lower in the callstack just increment the reference count and return
> immediately, as we'd expect (assuming every get has a paired put).


Agreed, the subsequent calls to xe_forcewake_get() and 
xe_forcewake_put() merely increment and decrement the reference count. 
However, if we are confident that the caller is already managing 
xe_forcewake_get()/put() properly and the function operates 
synchronously, would it be reasonable to acquire spinlocks solely for 
the purpose of incrementing and decrementing the reference count?


> 
> xe_force_wake_assert_held() is intended for places where we know we need
> a specific forcewake domain and need to make sure the function never
> accidentally gets called from somewhere that the domain wasn't already
> held.  I don't think calling it with FORCEWAKE_ALL make sense since that
> implies you don't actually know which domains were necessary; if you do
> that it will just impair our ability to do more focused forcewake
> acquisition in the future.

I believe this is the gap: After xe_force_wake_get of FORCEWAKE_ALL, the 
assumption is xe_force_wake_assert_held can handle the enum 
FORCEWAKE_ALL to confirm whether all domains are awake or not. However, 
this is broken: the function is written in a way that it can't handle 
more than one domain at a time.

For example, the caller of xe_gt_idle_disable_c6 uses force_wake_get 
with all domains and simply relies on 
xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL); within 
xe_gt_idle_disable_c6 to proceed with register write, without actually 
caring for actual domain it needs.

If we see no real use of xe_force_wake_assert_held with 
XE_FORCEWAKE_ALL, I will proceed with dropping patches [2/3] and [3/3] 
from https://lore.kernel.org/intel-xe/ZmDhQJLrleUjetIX@intel.com/T/#t 
and will add a BUILD_BUG_ON if the user calls xe_force_wake_assert_held 
with more than one domain.

And from BSPEC, it looks like xe_force_wake_assert_held inside 
xe_gt_idle_disable_c6 should use XE_FORCEWAKE_GT.


BR
Himal


> 
> 
> Matt
> 
>>
>> Regards,
>> Badal
>>>
>>>
>>> Matt
>>>
>>>>
>>>> BR
>>>>
>>>> Himal
>>>>
>>>>
>>>>>
>>>>> Regards,
>>>>> Badal
>>>>>>
>>>>>> Regards,
>>>>>> Badal
>>>>>>>     }
>>>>>>>     #endif
>>>
> 
