Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187FBD1CA0E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 00:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D6010E157;
	Tue,  5 Nov 2024 00:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFXPVjjn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE0D10E157
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 00:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730766494; x=1762302494;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=apj7/ZuZIXYYwh6KP2CtZiWmUXPrUwl2R4yQ9Rz5I5s=;
 b=LFXPVjjnfhT1DgWcbtVbjlwNZeedFDJFMC4ypXSrqyNTeuMLU47WlxpW
 zCCTsekPM930JxNtTNA8OpvE9yZE0PvFgD1T/hhV5YL39+ltFrpJuRBBN
 8di6pFxBgTaG7++FobNCX+fkXt1Q3CJFYmvyWZkB8v3t20BIxHqn6ZmXd
 c5cEmcs7jQQsoOhSXgRevm7VMaMBNVwf/15gHSMyGXzR3m1teaszsY+9r
 +INLy3/o09J94PkNCUznRrPFf+vA/6pPWtUZ+t74Fmo2pIuVfJiHUf2rA
 ktgC8xMPlyyvGfAD7BxatWSyBPfFZC5I4bhwPeNOMIdpZG7en3VD2Y0ls Q==;
X-CSE-ConnectionGUID: NklrYu4nRvamqLiTWDuF2g==
X-CSE-MsgGUID: +lMa2jnNRzqrkuHdsinDIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30437251"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30437251"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 16:28:14 -0800
X-CSE-ConnectionGUID: X6NokrjfSe2pZ1ZoGFrNQQ==
X-CSE-MsgGUID: 8PG1A7wFR+ifFvT0FCFN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="114605678"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 16:28:14 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 16:28:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 16:28:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 16:28:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqITnkxrqWNluxwH8pFgYO/lKJRK9a7TVuj+GGesw80vVwZhns3EIgX0cczRjkGT2iRymAlU18qg6/OGRlyUU2RNIoTwLPKv32+nvxzhcfb4S0dmhg8uLPuJcM/sg4Zdz1wwG9FWoYX+MpsagRMqpikmqDEf99vXCfQxeMPX4337WcRIf6zT7mPXffQBXYzIH6Sk0x3J4rn7cGWQDE72vKs6542eTq6cvISwyz5H23w7W05PCZoRw/xPp+D7OlIa6oebCkUQIk/mfsHFcSnMXxZMFVK274Fbz3bD1MnaRgsYIXPQxknUkD9MEaNrz15Kp2DIZ4PFJaavT1MdgvNvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkepZ8Og6KvclEQKuPUgVtgD2LCP/7s8RXP6K1Urhb0=;
 b=r/rGe9tvkMytFe0FyZUA48p0tWFjU4l6l8HY9vEuXB0zHP1wYEv5TrYfJFQHWAc/0KD7amcl5s6p2RmP20oY1uWoO99NJ6t3dBIPThlabbczHNgfTMd+QyJcQKMAd0Hjr+/pPhWXM+iawVbBhDWfzkr1ibuipsau/wm0a7GWI8GhmtJyxNXaMFMjEQkWi8hnhb+/i/NfCvox3q/PPN9z75s4syfNxwvIB+2oxMEz8wmh1y1xoJ8rLiKtfxGBbNGj+kLDL2+Eab9rjLk2JCUvls1XYRFDF4ug3XN8BRokuOW1ikOKOmvHtZyqf/WCFvpztZ48O1+4RWPQdND3mguGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:28:11 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 00:28:10 +0000
Message-ID: <948f7093-d671-4cb9-b14b-e2d424867175@intel.com>
Date: Tue, 5 Nov 2024 01:28:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/pf: Expose access to the VF GGTT PTEs over
 debugfs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20241103201633.1859-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0056.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::8) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfc7300-62a9-4498-6a4c-08dcfd30ba5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0dIeS84UGRWVlh6S3k1Mk11WjFLOHhKR01WekpqNTdaYkxUUHBhSXNPOGds?=
 =?utf-8?B?VmNXQjdjZGhSMVVvYWc4T2ZVaG5hN1F4a0xjeFFxL1ZBRmZQOHdyMTVPUWVH?=
 =?utf-8?B?L2d6VXJ6dGttNHR1eHpNK3p1elRISU5RQXFPYlUxdWFWOS9BUmRSR0tRN1Ur?=
 =?utf-8?B?QXN6NTRtWUF1eDZ1dmZITGZ0WmtOK2xjeGFRZ0dyekRpSnhDcEVGbW00bmxi?=
 =?utf-8?B?T3hWRzIrR2NpdVFFWmFOYm9jTDVsTnY5QXhVaFVGOUxwWWhWaStPMmhRZ1JX?=
 =?utf-8?B?NWE2V1lUR00zMkVCSjlLRHRUeUVGU3hBSDBCSEFGdlo0d29iWU1ZS0gwclVM?=
 =?utf-8?B?TGxJdFZWRFYxVFoyMStOTnJLalpqZi9VVHhCdHlqTU1Rb3JUS1VqL3NlTHAz?=
 =?utf-8?B?dGZUZnpnOElUY1hvS1BRMjVSNHl6UVh1OTVWOXlmN2JQKzVNYXFYTnc2V2Y4?=
 =?utf-8?B?bTVGbSt5SnFaMUNwUTFVWWVFQkZnUDZNc0s4azB2SDJWR2JkcmhvUmpSZFNS?=
 =?utf-8?B?TGFxTlRpSGlSWnVZMnZhcUErMHZBNTVuQjNlSk9iVHRHN0hWZGJDa3VRR2hN?=
 =?utf-8?B?ekxxbGpNNkFyNUVzWGUvbEU2czVSNjhuMHA2Z09UVHB2c0NJSHI4Ny82TUl2?=
 =?utf-8?B?Sk1YTzdSRlBLZ0ZQMVA2c3lSSHJMeFJRcHp4clhMekRmUFZUT0Y3VG1ObVdB?=
 =?utf-8?B?dWRKNjU1TzJlZ2FVdzRGcmh1cEpQc1FhdTZHZ2JTemRpSVdLdDIxaVZuWEFx?=
 =?utf-8?B?ME52K1M2UmFzVzZMVGtQSWNpYldaZHZDY0h0T3ZuUmZEZmNtUDBpdGxYbXJZ?=
 =?utf-8?B?WGJXOU1wQ0JyYUFueGd0SFZ2TTY5N0RmenVFa1ZaUUZmKzBYcmFSWFl0V25E?=
 =?utf-8?B?K0FKOGZ4Rng2aG13V3lMcWZEd3FQdW9YWVNUVmZVM2lRNkU0NlByajQxMHlB?=
 =?utf-8?B?aW1VTlc2N0wyQnUzRmhGVGU0ZS9RTjFoZGZwbkNpYjJLRWtsR0NQUGdXTEx1?=
 =?utf-8?B?ckllelhjeUtpaVBZQzVCdzM1REl5aFFrUENmbUUwZWlxeWlWTEFOck9yOTBu?=
 =?utf-8?B?aGx3U2pHSWd3YmQ0ZUIrSi9adVd1eCtwbHdEM3pZM3lkVDE4SXFtcHo0YXlY?=
 =?utf-8?B?VkhmSXEzZUwvejN6R3VGajc2Ulg3clU4TWdCV1plc0V5bGVLdVRXVVpUNEJJ?=
 =?utf-8?B?dHZZSldJNm9idWhHTmU4SlRmSWY0cmVCb2VSVUNiVCs0Y3R4dFZvMFliRjBy?=
 =?utf-8?B?MjRvVmJUdEVWRVRrM0xrM1hTSGlOQ1ptVENmTFMrc2FXbGNXKzZrOE1TUlo2?=
 =?utf-8?B?VmxQVGZVTGIzaDZ0R25DNnBkaGFiMkt0bVBneE4vd0ZSN3F6aURMNExHcm9M?=
 =?utf-8?B?bGlhWm4vRlVpWm5CTHg2SUw2M0V5TUs4N05VSjJVTXltQW5tNHoyOUZIc2tL?=
 =?utf-8?B?Yk1iNGtjQXBDd01xUWk0NnNtcURDam9INXZGUFNIdHZkMU5wak93aWFHUmFD?=
 =?utf-8?B?NkttOE5KbWl6YXJUUVJMM3hVWlF0MkdSMFh0MHNxdENVakRTUjZuc3NFVm54?=
 =?utf-8?B?MGJnQXVndlh6Yzc3VUo0UTRqMmVGaDVnQWRrV2g5bC9OTVdOV0pIbDRzZ015?=
 =?utf-8?B?NlJhRzdKOGdHL1d2Yll1ekdLMHRpdE5YVmlsZjgyRUdzTlBHWjdVbFVMK2ZY?=
 =?utf-8?B?cUgrT1NDZHVTOUthOUs2RDRIYlQ2NGxIaklvSFkyUWpsSnM2MGlPWDljVnJC?=
 =?utf-8?Q?fN8qum3P8o9O5IIp6SJQylqRszbblmm4gZsjNX3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGpqdDRpdzJRUEZHM0RCTGE5VDBWdWNwUHVsYnNNTjNCRWJIbERLOW1EdTU5?=
 =?utf-8?B?OHVCcEhUb3ZpM0dzckd2RktaT201THVmUXpmRTFKVG9vTzJKSnNRc1lKRlB4?=
 =?utf-8?B?YS9MSVBrV1FXZkdoRjgvU0FIMm5qOWJZZVhSTjNRbXFodGVSY2hTbERnYVh1?=
 =?utf-8?B?WERLeDVhZUtEYXM1ZExodVQ4UE05aDVkaWk0b2FEeTVKcTZhTlErT2o3ZWlL?=
 =?utf-8?B?UXVtSklVUVZZSzVzdG9XT2F5YnhUTFU3U3BPT1ZaQ3c5UGw5N1ZEZjlZWlA0?=
 =?utf-8?B?UGc2Mm5YOGtGbHo1dU9ROXpvdXJ1QktMV1NDWFRWTDRIOUFtckpsWVVvZkl0?=
 =?utf-8?B?YVFONFF2aStFMVMzdEhNQm1wYTlNTDdrZy9sRExCOWZaRTJEWFVzeXVGclhk?=
 =?utf-8?B?RktLamE1ampMaktTWU1iRzEwZm1iWW9Qc29SWllybC84QlZHVVBFY2hEdUJm?=
 =?utf-8?B?eWl3YmxTSnJkcnVQanE0RDduVWIxL2ZnOWprdlVYdzRLMDJwQXczdkp2bXlo?=
 =?utf-8?B?YkhINURMQ21EdWZyNFZDQ3BGc21ML2dadkNOZnJ6M1ZacHhXM0kvMC8wWVdP?=
 =?utf-8?B?UUhMdWJqbFFDZW1YRUMvV05aVXRxUGE4RGJHeU5yL0s5Ulh2bDlUbWxuL25x?=
 =?utf-8?B?ZE42eHBQTmpqbjdQdTh6VEFReXBZZGdSSjR2VDZKVWRiaUt3eXlPeTFiYmNn?=
 =?utf-8?B?Z09Yc0tRaXJrcjFJMzlSSGlsQlhXdEJ2dEMwZmRUbVQ0NWZwbTVxTThtUldY?=
 =?utf-8?B?WGxETmRYTmRxSVY2TkxxUVJQS2dPQUFmNStMcDFQMzZqV2ZSSVhpYW1tUjQ0?=
 =?utf-8?B?MmsxV0x1ZUQ0ZFhYWXI0N1N0K0VXMVB2a21TY2lCeHhlSjRMTGJaVXdIYTNM?=
 =?utf-8?B?M3hxYUJaY2FKTUZwZjB3QnZhTkpkenpUVmFMSDhnUks5T2s1Nk8rZXRLeEVR?=
 =?utf-8?B?cFVuYnlLR0VrMXl1dmwzTmU1N0JDbWFXSlQ5L0JEMDRzNzNpVTh6Y0VnTzV1?=
 =?utf-8?B?WDNDWDZYUkxlNk1OSnRxaU5RZXo0RUcxT2Q2WGRVM2pmRmhoNGIzaktvRHVu?=
 =?utf-8?B?eXljNzJra21LOWRNRzBRSEF2R0tZOWZQSTJSUzMvNTZjbE5JR21lZDBKandz?=
 =?utf-8?B?d0tZd0orKzlXUFYwbGVUR2UvSEhhT0VTVStQTVRwK2FWdWJ4b1NOZHZ5eDJL?=
 =?utf-8?B?REk1eXAyVVBtOGViNG52bVRnejhCRVFRcHVWNUhLYkFJdGN1QnVpYzQzS2lk?=
 =?utf-8?B?Y0NHd1JjME50dzg5MEdadDVFZkRkRFR4amxvS3VMeWowaUwzNWFoQWlIUXQy?=
 =?utf-8?B?ZktjSGg3UHJvdXM3ZHRmY2FRWGdEdk5OeURtdG52UFVjZXQwRTN0MUFXZTh1?=
 =?utf-8?B?ZDc2ZjVWMnByaFExNWVqRThCSm5CNmJRcllKcmhiK1pTRVdiVEVWUUZDYlph?=
 =?utf-8?B?UXZBRG45eHJieE1nTDlBMzlnbzhwTjFUZW1JZXgzRWhuYnlNd3BmK2d1UXda?=
 =?utf-8?B?S0I5K1lPTDlXVFhBNU5aK0tjRTBDNFRwVXNITDJicEdhL3dKZ3JXdnVrOEVy?=
 =?utf-8?B?ek9ldUdoWXlZbk9YTGpuZk93S2ZFUkZJMGd4clpNYWVQNVRZMTh0ODJJWDlm?=
 =?utf-8?B?bDBrS1k2VndsZXZreW1pcCt3UEdYcUpTQ0gzazFaZHdUYlJZT1hFdHVGeEdN?=
 =?utf-8?B?Vkx4aGdBYTZCVjZzcnd4VzdmaEY2QUZKeHBQZzM1bGpLb2ZuYmJEMXlwdm53?=
 =?utf-8?B?VmZqTk44RXBoVm5ZREFybE53S2RZcUxJVlU5MnduY2Nua1lSZDRkdElBREFa?=
 =?utf-8?B?UmI5dGVCanMycWpYV1YwVW5yWkxyTGUycmVqZkpYSDNIZm4yS1NzNzYvK0dq?=
 =?utf-8?B?L0ZnUU5ObExDTjlPNEN3T2VoTS8wcE5LMFNDVFFIRDBNS3N4ZC84bmNYdkQ4?=
 =?utf-8?B?MUNBdjgyUDJQb1M3ZXlDdzVaOXhhVXUzR09hSkxlV1FCaVNTUks0OXh0eU5s?=
 =?utf-8?B?ZVpndnJLb3YxRXliSzdTYU9WWW1UTXpwbjBQb3haVGhFR0Z1TnFyK1l0UjZl?=
 =?utf-8?B?L1QyQ2x0cW5wcHFuWlNybmNTejVqei9JMTRQL0d2T1NhdG5CVGF1UktEVTFN?=
 =?utf-8?Q?Mw99X923LugHfz/skkG2Nf4B9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfc7300-62a9-4498-6a4c-08dcfd30ba5b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:28:10.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/3biYraQPZDAoHlRjujUw5Sr5t3Q3OoOGIm9NlbITPkZF/N1hblyt1NCjbqLd+224BRvcDNWY9zCnTGrEH3DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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


On 03.11.2024 21:16, Michal Wajdeczko wrote:
> For feature enabling and testing purposes, allow to capture and
> replace VF's GGTT PTEs data using debugfs blob file.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 62 +++++++++++++++++++++
>   1 file changed, 62 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 05df4ab3514b..69ba830d9e8d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -11,6 +11,7 @@
>   #include "xe_bo.h"
>   #include "xe_debugfs.h"
>   #include "xe_device.h"
> +#include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_sriov_pf_config.h"
> @@ -497,6 +498,64 @@ static const struct file_operations config_blob_ops = {
>   	.llseek		= default_llseek,
>   };
>   
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── vf1
> + *      │   │   ├── ggtt_raw
> + */
> +
> +static ssize_t ggtt_raw_read(struct file *file, char __user *buf,
> +			     size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	unsigned int vfid = extract_vfid(parent);
> +	struct xe_gt *gt = extract_gt(parent);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	ssize_t ret;
> +
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	ret = xe_ggtt_node_read(gt->sriov.pf.vfs[vfid].config.ggtt_region,
> +				buf, count, pos);
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static ssize_t ggtt_raw_write(struct file *file, const char __user *buf,
> +			      size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	unsigned int vfid = extract_vfid(parent);
> +	struct xe_gt *gt = extract_gt(parent);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	ssize_t ret;
> +
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	ret = xe_ggtt_node_write(gt->sriov.pf.vfs[vfid].config.ggtt_region,
> +				 buf, count, pos);
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations ggtt_raw_ops = {
> +	.owner		= THIS_MODULE,
> +	.read		= ggtt_raw_read,
> +	.write		= ggtt_raw_write,
> +	.llseek		= default_llseek,
> +};
> +
>   /**
>    * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
>    * @gt: the &xe_gt to register
> @@ -554,6 +613,9 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>   			debugfs_create_file("config_blob",
>   					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>   					    vfdentry, NULL, &config_blob_ops);
> +			debugfs_create_file("ggtt_raw",
> +					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
> +					    vfdentry, NULL, &ggtt_raw_ops);
>   		}
>   	}
>   }
