Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B511D2503B
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 06:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9AF10E2D5;
	Mon, 12 Jan 2026 06:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8ot7HAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EFF10E2D5
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768200637; x=1799736637;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D6+J9kOUC1BntM2f0wz5sOK5e9DxkHM37+GEMl/rWXE=;
 b=g8ot7HAhsvKuAXXS4DVa9M44rCWpoeskvxoAsCUphBhsiCToJmO4wKz+
 CcS7B95MFCOnH9vIm+cK+wrPCAleuRYoKASQI2q1hpExPKmZFhsP036QF
 32PxH2qxsK1vtJWd981iQSVFn0d9W1koucr2rzb5QIHgzhxQv9kfscksu
 48X3yA/7RjxoSx2uQTGhW92V/eQLwtuvASVI7VbD99fAFvp7itPWK4jFH
 Sm2sXM1N2Ia1hAfTtDYp8DAcK3ThLnNiO+0v4cfxTVEUteWKyLAmIQIqp
 pPuyrpNemPGFAwCWKlbVGc41jGXghZzJ3r617TR+LJfCWBZDaG16FrCBs A==;
X-CSE-ConnectionGUID: DrnFIu+aSe+MGlDy4PgvGg==
X-CSE-MsgGUID: 3rsbdX1ZSr2fehck0CSN5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80191006"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80191006"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:50:36 -0800
X-CSE-ConnectionGUID: NcKtga+aSPi2JmtXpwssyQ==
X-CSE-MsgGUID: I2Ur7D/nQ2WtpRMtxlHiwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="209088463"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:50:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 22:50:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 22:50:35 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 22:50:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUAN0N9Qv5a6YYBYxsFYRqXHY9bE/D0RW+MHr6RVIPQl1/khW2qHFSAQOGbQD0MU3XKuEoepBnTmWprXqzuA/irwk2qNed+xbFcnENkjRVnQphoxZ6s8vSLdp+yjWU29sNsGkZl5DdXq7EZfiUY4KWxLJyR6X7PaoEIsEaAYLJK/JIhxKuNyTsWquG4knI56Z8cNBnjXIWyxeeldG5tqntYj1ybQh/Kn0i64jEfEFT0PNaWEScmJjBExFE+vmyF73lLzIZG7M8f4t1fcevSrXepXsbh0F/vZFpFafSQq5YvyeARLHC+BX+uLWXNqsWrgBGGgyxH4CAZJR5EB8jx4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFBVCZEfQkxXyx9OBOEmOWAfO7jWSjUl5NFFXcgEy3M=;
 b=COKPr8NZqNWBe2mU8hLETQoCjbutTiIYBzMQ9y+2YiAxm21lmj98aDUbSC/FYJP6MpJ2WigZcL705UEc5lWDriJEN4DDybyTrx7LhfqZB6RIeIfSHDVHKMLh3sk9ruuVyYKB5jIby5VuwEigYXwD1yJVjIsZ0Z819O0vgwHAJcMgjMmQTG0ZWntPLuPF+osFiQLtBeBYYMerfWVobGfNdUe+H31cwqt7wuhAz37aTijt/XCGchLB5aZVDZbXdB9QrC03fXI3eVl1I+AutlmkN6ci6zh5oCAKYMyxMt3qHdIw7X13j1RPT5rHQ/8iGMjdPIArAYD/VQ03R+oSELJ6LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 06:50:33 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 06:50:33 +0000
Message-ID: <8dd53b1d-69b9-44ef-b90e-2f083ab18bf0@intel.com>
Date: Mon, 12 Jan 2026 12:20:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe/hwmon: Expose temperature limits
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-2-karthik.poosa@intel.com>
 <aWIldD6hKFt_Sle9@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWIldD6hKFt_Sle9@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c64faf-2e74-4998-02a0-08de51a6e1b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVpqUllSNWpxeWREMTNWTkhXcEs5TXVxTTI5S2NlYmZNTWluQ05vZmFuZlpn?=
 =?utf-8?B?dW5PUmxwWDRoNnZFUStKckl4OWp0U0MxQkxaYzc3bGRGU2VPZ1lIUEhUbTRm?=
 =?utf-8?B?eTREVmZmWmd0T0hPZm00NEM4WFNLZ2xCRlVicG1EdzY3Vk4wa1RBdVp0MmRS?=
 =?utf-8?B?YnhiMEN3TExDbzg4V2NNTkpEUTA3dElNR2RDZENreDVqTnVETUVCL0V1UElT?=
 =?utf-8?B?SVRnQVBXS1k4L3dIbUFXM0pqSXNKWG9FeXpFR2NCN1Y2QW8yNE5Jc1lqN0di?=
 =?utf-8?B?Ui8yNFJONThQT0RzUW03L2tGVmJzTC9SMStzZTE1MUVKYm1mZXRrcHRYNTEy?=
 =?utf-8?B?QlFlcVdmV1dYS1I2YXpkQy9laXkyZ0pJdWJVdHA4T2JzaWhsOWo2cWdqbFB3?=
 =?utf-8?B?empJemdxWDZ5UHhnNWQ5VjFtNktyZms3ajJyQktvdS9Pd2ZvMHp4Y1g5Sy9y?=
 =?utf-8?B?TG50ZWU2UkF1d1F2QzNYUWlLZHJNTzE1OEVWbTA4a1ZHcThzMHpDdE5vbmhq?=
 =?utf-8?B?eDV1N2RQTGp2cHdhMkNTMzRna2ZDc3oxVXkvVGxZSUtNWVExRk9KaWJEVDBZ?=
 =?utf-8?B?RzFHQU5haFJsSzFZa05BcU95MlpnalE2UVVJdkZZZUNpbDRPQ3ozaXFmUlZs?=
 =?utf-8?B?Q0NGaUVFVWpQdTZUSXJQK252RUtMbU9Ca1BTNFU0ME1wN2ViWlN4U1hEVTQz?=
 =?utf-8?B?VEhvSk9KMjJqMTdaek81bjlucWhZQTRMczV0SmxGYnB1OCtxY1JwZG12L29R?=
 =?utf-8?B?RjBWVnJDcFNVZEhXb0NGMGdDS1FjTnF0TS9pMnlEQ0xvR3lYZUFQY0s3OUd4?=
 =?utf-8?B?T3lZeUJUbG5wM0lsUmNxODMvME1lYjljbFpRaUM5MWZDSnArUXZMclAxOWJ3?=
 =?utf-8?B?aVZNRUc4UzVWRXA5SkNQeDZieFJ1M3BhREFxaU9LQzlGNlNmWTRNeHVQY0M5?=
 =?utf-8?B?TnNFcVk0aWsyL0VvcVhiWGxicjFMMll6UjJEcy9zaVBHekk2clVMSnV2SVU2?=
 =?utf-8?B?NUdNUFEvc25sR1BBRWs0YlRlSlY5VTdsbXVyK3BDQzE4WTRzTE1aL2dmek01?=
 =?utf-8?B?Y0xyL0hXNXFCQWJaNEFqRFJIOWxJNXRPVjUrQnhNUWt3WnVWaGw3VWhYdC9u?=
 =?utf-8?B?bzNjMDM3cUpjTHVqcjhIS2R2RHpUSkJWbVFLNFVVbDJ6SDZDc0xBR1RTaE5S?=
 =?utf-8?B?alBxVUY5ckpuVXBRUWxqdUVxaWRGczVNQW4wbkFabmN6SFM1N1UyWFR2WnRE?=
 =?utf-8?B?b09OdGNWNDljTmJoN0trZ2gzZW5UZ2hVOU1rVHlpL1FkQXViWDVjNVprVENJ?=
 =?utf-8?B?c0xEVm9ubG9HWjlCSEpSUkNkbmFPZEtnSHdrVTRsZ3RYNmJiTzRQdU94MlBG?=
 =?utf-8?B?dEt2dXo1a0hKK1FRcDRISDlhR3JOY1BDczNkYStZSndwYk94NWRpUGxlL3M5?=
 =?utf-8?B?TGZHTlU4YTdpajhhVVlUaW9qN1VrRnhKYVdSTnNlVllnZTRSdmFNeEkxNmNG?=
 =?utf-8?B?THB2ZmN0R2ZzRUJYMGxRZmhjdEUrd3RleTEwcTVhU2Z5U3Q3YW1LamtSTVhh?=
 =?utf-8?B?M1h5L2pKZ2VuclA4UGFKRlQ2cFN2cXdDQVM0WDk2TFQzTC9FNzYyYnRNbzhm?=
 =?utf-8?B?TG1JVXN4RXBsd3FDd1VMVVNuRWoyTzRaRWdLMm5tRlo4K1B0YlpyWTFZSWEx?=
 =?utf-8?B?QjdSQ1p5cVBiaGo3ck85QTNZMVgzQ0VaRUlZWHBpTGhQYzFZWDl0OXc4WjE1?=
 =?utf-8?B?d09zS1g4NnIwTnorc2pSNi9sQm1mdjVXc3ZoejlYZWRPSTFISGNtQTJ3ZG5y?=
 =?utf-8?B?Vm8yTTlwLzk3WDR5eG52cHlFUkU1bGs5M0lsdE1YQk8rT0huaEhZbnpjV1Ni?=
 =?utf-8?B?ak52aUF4cjY2MHR3WGZMMnlCczN6Rnd1VGV0MmVsMW50d1dNS1lVaTNlV3dk?=
 =?utf-8?Q?cMXi4fjzb++Wgi+jwMZinXKF9aezhNuf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5sb04rSmwzNTVHSCtKY2NCZTZWSkI0QlhMY1BaL1g5MHpvQVhOOXRpYkZY?=
 =?utf-8?B?ZVdRVkpmMWl4TkxGWkVkZURGZE5YTmord3RqOWduQ2FCUllVTkI4eDNCMWta?=
 =?utf-8?B?OFBsNXkvU3R2UFlJdXBZdXJJYjZOZ0wyTmU3KzQ4aUMwZDFHaHJ3bWJiQWNX?=
 =?utf-8?B?U1lBNUY3NUVvcFdYTzNJNWRkdjg0Vkk3NGJBQzJ3T1BUaERxZWhOdkQ5QytJ?=
 =?utf-8?B?Y1FkU1psVmd6OWFnNDBySFhuMWhQd0cycEh2b0xFMDlHL3NxQU1PdDM3ODZ5?=
 =?utf-8?B?MmxsR2lBRlJpdk9mb2FwbWg1M2tzclpwUWF0czZUcmVOV2l5VW83WlNHaHZU?=
 =?utf-8?B?TFdZZ0RsZmgxN01ia2xENnJHbzdMYXkvN3k1YkdsajdBSmY1N2ZwZnZacnVa?=
 =?utf-8?B?TmE2dlZib2F5VWVldUY3WVpycWd0bFFJcS9mc0g5YzQzbGRwVW1mdTVoSHpL?=
 =?utf-8?B?Rnl4MTNPUUR0Z1JEaFNmSUk2UTI4Q0tuSmFDTEFZYVlIaC9CSFZOMWJwNE1y?=
 =?utf-8?B?OEtiSHBlRklCRFlMZEVDT1JNeEdIWUJLN0NzSzJ1bCtBQnBFd2pVdFBnWldp?=
 =?utf-8?B?Rm1OanlwL2xlWHRwZFExR1ZQTDhKNVA3UUFLNEozeGtMMXpBb0hLR0xVeko3?=
 =?utf-8?B?NkhMbnJELzYyazFpSWEvMnRsVFNSK01NTG4zOFJkWmljVkJqdzhqSTY5RTNz?=
 =?utf-8?B?RzZvMDI3dlhWbWJBd3lGcmJ5K1M5Nnh4SHRMeHZScWR2S0JKdll2Z1VMRVBR?=
 =?utf-8?B?SmJjb1dXbFhFajlSN3lUaUpJVm5EZFdaRzdjRW1XczloNlBRdThxdHk0TXZq?=
 =?utf-8?B?SGlyaE9BVHFPRjk3L0ZnN0loRzdoV3pCK3lPMDJyUUZmcE1uakRMN1Z2aTM0?=
 =?utf-8?B?U3NWY2hFeUc2TjNDTUFzeS9JUXExSDcwV2tGRTl6UlN5aUtEU29BQlV4eGtq?=
 =?utf-8?B?Q1NmYlNpam1KN3lMY2VHdjM5Y2FVUXU0SjJ3Z0JFZitBOEdsWHFIb0xGUThL?=
 =?utf-8?B?bVVkMCs3eDFHQlZCcUhxVStYMVRKQlNFZXIrUHBzSEM0SVJIanYwWnJlZ3A3?=
 =?utf-8?B?UDROSGRTa2lLc25ZOFFHSHljM0Z0S2MrOWdCZ1NjUlc5NVFVTFNCY1hwWFBP?=
 =?utf-8?B?TlYzU3BqQWY2OUdJZ1NmUkt3eEZZb3NtM2ZDVVd0TXJBdm1qeXZHOVNqSzhO?=
 =?utf-8?B?KzI5SjFKZWpCcklPYkxjU3JoYVdPaXdNdlF1bHY4QThVOTJWNnBWbnBYZDhV?=
 =?utf-8?B?V3B0bHVzUlgzQjVSZjMrU2VteTc5N05VNFgrcVY4bWt0cENzZWZDRjJhVTA3?=
 =?utf-8?B?UUNPNU1Xbm02T2RPRUlvLzR6akNIWlhjUnF2Q3NDNXdjaXJYcmJ0ZEIzR1VY?=
 =?utf-8?B?Y3plLzNTRzBGdXMyVGU5MU1DWHUrYUdtaXNpdHBleVp0L3pTdVkxQnJoN0c5?=
 =?utf-8?B?ZW9wL29FWnZjd2JjOEdUR2UycU5sZTU5WmpocEFpMUlvVmYvdGJESU15MGQ5?=
 =?utf-8?B?cU9GUVArdFpvN0c1eGpzZ2laSlpZcDFzcEdRVURPK1lqWmJWSWQ4dnVlZ3NF?=
 =?utf-8?B?eVE0Y1BTa3Jzb3cwSmZqVmRxQlJlSTZEUkpmaDZhZWhCYThHS0FwR0VBS2No?=
 =?utf-8?B?YjE4cmhzd3pFWTZrTFZFTEdrUG1QcW9ySi85YllHNzFqWXVBaTcyY1djblRI?=
 =?utf-8?B?T24zYnMwbjR1ZHJUWkRqRUU1a1dEM1I2RFpYcHpuZHk2WGVsdFNuWkZvOTFP?=
 =?utf-8?B?YjM3MnhJVlhDV3NPdkZoaEhxTzF6N3krVEVLT1V4YnppbWJZdXJVWTFQeFlv?=
 =?utf-8?B?Mk56RzJPTHV6MVFBUFg4TVBOVGp6c0pzYzZraTRhUi85ZUtzSEdVQnZYV0l0?=
 =?utf-8?B?NmR0ZkZkdjg3U1FQeHVFODZPM2d5bDkycDgrZm9HMEpHcGtac1RKenp3N05h?=
 =?utf-8?B?YXFsZlN2MWhLdk9raTVhQW9CRXZ1blNlOVhyL25jektLTzZNb2NtTDBoMUJZ?=
 =?utf-8?B?R1B5YXVsSGpzOHo4TDRvMkU4YTlUUXhOVWt6YTFNOHBTUUJHdEYzTmZDTzVR?=
 =?utf-8?B?aDc3b0pIWXoxSWtvSXVYdVFsRnBwL05oT3Zvcmw2RnBGTWYwOGhNQVBmRFFt?=
 =?utf-8?B?WnBTTG5FK29kQjNITDNBYll3REx5MGFjQ1F6OHk4c2cyU3ZQaHZFM0pLYmlC?=
 =?utf-8?B?VDdBcnpZVDdRL29RRTAzTkUwQ21seHJ3TWcxUzRLZ2FZaE42WVBja1A0Wmpa?=
 =?utf-8?B?U0p2TDgwYXJNYzA4ODZaUnFka0l4WGFUb1UrZzlhRWFHUGViamY5eVowMVdm?=
 =?utf-8?B?Mk9qUDhBalhLOXhIVVFVYkZKcDgyR21NdThLSitYU010ZU1vc0duQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c64faf-2e74-4998-02a0-08de51a6e1b6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 06:50:32.9793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YvSwEatWcTgxq0Oto/EXb0xtaCeR3PVnyJVfCoCCa193ckFUj7x0UO0ElfDzMNP4JNrhkFmC2Zvi1fk0eSnLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
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


On 10-01-2026 15:39, Raag Jadav wrote:
> On Sat, Jan 10, 2026 at 01:46:41AM +0530, Karthik Poosa wrote:
>> Read temperature limits using pcode mailbox and expose shutdown
>> temperature limit as tempX_emergency, critical temperature limit as
>> tempX_crit and GPU max temperature limit as temp2_max.
>>
>> Update Xe hwmon documentation for these entries.
> ...
>
>> @@ -808,6 +871,37 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   		/* HW register value is in degrees Celsius, convert to millidegrees. */
>>   		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>>   		return 0;
>> +	case hwmon_temp_emergency:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>> +			return 0;
>> +		case CHANNEL_VRAM:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>> +			return 0;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +	case hwmon_temp_crit:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
>> +			return 0;
>> +		case CHANNEL_VRAM:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
>> +			return 0;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +		break;
> Missed an instance, please drop it ;)
okay
>
>> +	case hwmon_temp_max:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] * MILLIDEGREE_PER_DEGREE;
>> +			return 0;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> @@ -1263,6 +1357,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   	for (channel = 0; channel < FAN_MAX; channel++)
>>   		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>>   			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +
>> +	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
>> +		drm_dbg(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
> I think this should be drm_warn() but I'll let you all make the final call.
Yes, drm_warn should be fine.
>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
