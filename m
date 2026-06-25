Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3289CDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527B910F3BE;
	Thu, 25 Jun 2026 23:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPY+dY8l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9EE10F3BE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782428640; x=1813964640;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RlvXy4Z8qYODcpwoHMcKueFdekOA6u4tjwaaNwsWNhg=;
 b=cPY+dY8lqtAjqDz4yqLZTK9Xvy3FgHgDPoE635MLA4357XuyO3sZkonn
 mif1Qo/QGphPim7uKMXvqydzlr24ATayfF4WEOby9YI8EC/iFYVuPDTXD
 Jg0H03KwFOetDKcweoH9bRUqJ9CCZascPJm2M8PUeWK+uC0Q1E7/Jf2Hx
 bdYYaePM6B3ElkPDQlGBvr2eTJKf6aKaSu83rs0PrJjIyYzGMObJVfWAj
 FyOYSGSHdnhFmD9PHBRfKhoZdlbLAVhM8ktDhY9WDsAdozthclEXjWHoU
 wNgttr+2W0aAfZdqgBtbtL1cAEPXDIfj0gfYsgmcnzFJCIOw2LZGIQHd+ w==;
X-CSE-ConnectionGUID: 24/RK9X8QiiRoE/88Mi9VA==
X-CSE-MsgGUID: EyMGPs5xRzKGAV+Pqtlibw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83283309"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83283309"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:03:59 -0700
X-CSE-ConnectionGUID: U9artDa7SMWVMgHLhGZEaA==
X-CSE-MsgGUID: 2k2fEZUFTbGyxqm1EmiJgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="254750913"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:03:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:03:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:03:58 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghu9scjNe1M/DBVAwsKlCr8mfa5VL9kdsWkIPn3B7znDHydf8XQFjW5ubImvDmUhy0TY0q9wpGPCKOP+mOnQytPDFvWtPadFQ1fNtbygGxq9YiHk4fW4xRCRcpSOQH8lFE+4aS12pMdqAIL1U2P2K/h6BKuElt1DDy7ekNP2ubAh3FzuTYVoOt2qYp4lxHPDyG+NYpIWBZja7fgTeNqZZjmLFOXWEf+YtLRH/9AGMd/LHBY294Iua1KA4St+BQIAKtOwvYU5m5WJOsVIQxVj6B2KR0lLH1v5GaZsVvG93612vEKE0TUYymeh08V2wH1m8K3QcnavJ/Hpz6iKSH5XKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL1noiCcB6m7fH4Lclg6W8lhQC8CMlna9/XEp+MQ5NQ=;
 b=cr5g+SsFozs+f8j9ISg5gbbHI+nqoBelEKcEHg/Jj+/vWJotwhe4UOr6WTvUYoyUuJDAiOzNzF8J0VvgvC88jJEIRzC4jxvNjV29lH8bNlivNR1ejvbEXL77gnL2O1mxnYbg1p7ahJ4vVsgPjGwFiM377AzyYgowBUecZSjm/NUyVJgrz1Nh0+ILez9SjM7MCciNO5u5OiM4VMH6WUkLQvwyl3ftrPm7PS2YBcsmtCZ64+XnyZJ0TXxs90QM/OtFEqNk+Yn7vE6AYIh3xLEUy/sO2djUU0MwzsCn/sEDpeOq2mSfY1JVUj6vrsMGVX2g670G3eS9oBVTuxtg0aJcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by EAYPR11MB9564.namprd11.prod.outlook.com (2603:10b6:303:2c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 23:03:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 23:03:56 +0000
Message-ID: <0ddae88d-04bb-4b97-933e-cfcf873a3750@intel.com>
Date: Fri, 26 Jun 2026 01:03:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Do not return an error for unrecognized VF
 events
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
 <13a16602-9bce-472e-a89f-d205f0d2afc0@intel.com>
 <2fb6ee84-c5a3-4889-ab42-93e84e6d9694@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <2fb6ee84-c5a3-4889-ab42-93e84e6d9694@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0210.eurprd08.prod.outlook.com
 (2603:10a6:802:15::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|EAYPR11MB9564:EE_
X-MS-Office365-Filtering-Correlation-Id: a5567d73-f3e6-4000-9f9b-08ded30e087e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RRzEZsumNMbH8RUWPPKsW6Y8Mic+3+syTWtptgeNvP5ldDtJ+H1mi5Enp3bwh7pj9BhOgZ9b74TLwhcGwfjhH+qpy+LTiU5RV3XdFa5vaxTa1Ow61l/yoJaF0aQ2S4v0/3xF3rSMY4g55hBmI/mwG+KUvyyBtRtTL9ueuvodSQBo1M2cvny6lvx1QfpaYvcz4SohyQnfLWWBYn04xIJyCzY8F7M1jHMZ2z7K0xEYhTAPJWNpUFB6dTxhlgYhed3B/gbFUIIIsOvvnrEA6w7GdgHOXTVEkTSEuxqvsycM1vTIXcHJAiEkS5RnWDC1Gf6hA+pxYIQAg/ElpZY/P8k9NOvttt5/47i6lFfzPWcyu3vuQ48k/ye2AhI4C2x1GHhaVPa5XYy37klFd0E1NwOm2ko7o0PNDzC1fIbNrNDsQwGp1S5plhhRh0ZuTMSBAIRNtUEI6adpvV0zRI7PEzxWUDQfFlw/toBcoW0M3aZS85MlprBbFX6i0uzrj8bfy1h1OwS+1KpokmGY+gjP23wpFg/Lp6dWCP+poBKbAfW/tKDFMxxleyC/vF8mBhQtCHdYjuMTr/A+yWIwZOlccXkpkSUGMicu8oRa5JkQse5j5gE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHJBM2lWQ3pPRU1VQmFuK1dhT2pITEpHTEZZTlFEK1l3SUROVzBHdmJtVEFN?=
 =?utf-8?B?ZXBMNkJQYndGT3d4RjlQbVpOUEI4ZGVJblRnUCtZM3FqMUorczh1YVhMYitk?=
 =?utf-8?B?aks3OFpERzQ4ZmVxWWNzSGZoREhSM1crUjlDTkF0b1JOZ0U1SE16VktPNVRk?=
 =?utf-8?B?NWtNTHNMQThqNkMyT3VKamllUUVjcDhLa2NZMnFTejJJTUNvYzRmOUhpTWVL?=
 =?utf-8?B?TXI3VStJdmIrcm52VStVcHFmMDhSWmtWVDZRU1A4a1dMbVV5LzV4K2pqaGZa?=
 =?utf-8?B?Z1hxbGNna2ZtcWRqdktHNHZlZmpqaEJ4V1QvbDZpTXR3cHp4czh3TThtSmRp?=
 =?utf-8?B?bUxVck1PUXRHRHF6ZFBlZlRFWEk0QjFCQy9ZR2RVYWMydlo4REF2MEFwQ1BI?=
 =?utf-8?B?OElkUHJFY1dmY2FJMjdEZXFTbFVubkZ6aEJLcDQ5WmJjT1lNMlhFaTEzdjFO?=
 =?utf-8?B?Skk1ajFtNEVKOUpnTVdRWW9QZWVVVzA5bDFXdWRnSVloaytvcEVMYnVTU0Nz?=
 =?utf-8?B?MStLczU1VFAya1JUdFFGUVVVaXgzYzg5S2Q2MGZmTndpVWlPODlIRm5sT3ow?=
 =?utf-8?B?Q3RhVEpmYldrcWlHUXhiZ3AyRW44c1M1d0NrTEI4RzVPT0hyUnZKOTdRdjVB?=
 =?utf-8?B?R2RjY1JxN24xTHpSOHk5NUdYTHdBUWlsdjVrc1FQSkR5VUpHVURJVXptS3NL?=
 =?utf-8?B?aVYzcDdQazhqUUdMWnFFSlFuZkxtaWJIWVBWOFZJb1F0Ynk1QTFmT0s0MHVR?=
 =?utf-8?B?ZWYvcTJEVy9CVDArY1ZDMmFOZEw3VnR6bmlhRDJUT1NrMEt6L0VHc2xqb3hr?=
 =?utf-8?B?eGQ5T2lxc2VBL3p1bXhWUnErcXVlM2UvSlIraWYxU2kxTWVpU2dzbUJ4a1hk?=
 =?utf-8?B?THBPZUkySVlHQVZJdE9PV3pZZUlMRDFWOGRzc1hNTGM1QnNobUtxTDVMUTdo?=
 =?utf-8?B?ZGtucEM4M1pUOW41NytTK0lCWGZzTnRGaVVHWWlISndpbDFuemNqTUQxeXps?=
 =?utf-8?B?dTd1S0RuTVBmM1RiSkJ0OXhCQ2RiL2d4aFhoUmlCUmFZYXR6ek96Ymc4MWlG?=
 =?utf-8?B?OXhUdEJiVUFYd1RjRUl1NEFZTXgrQW9DYkVJU1pjLzZXV2NRaTE3Uzc4Y3gz?=
 =?utf-8?B?eFBaak5EWDdSRit1emtQc3ZXb1FxLzlKektoZUtOZ2hUZkxOTkNTVStWUjdB?=
 =?utf-8?B?L250UVAzbEV2YWQ3UHJ5WTRweFZ3OWp6NE5CR0p6RW5Kd1QyU3dUc0lWUVZW?=
 =?utf-8?B?aGM3Y2VCMUIxT08ydlRaQklKLzFCeDZzTTAwMGE4Vi9QQmhhQ0swNFlVcFI5?=
 =?utf-8?B?S3pteUZDbWVKa2NoamJmNzJYMXo4K2NLTDVnQy9qdnYzbkhTVzRNUDdMelpE?=
 =?utf-8?B?a1BaMEtKalR1SWdxbUg2QnZEY3FvV3QrbzM3M2JOeXpLWE8zaVFXN3dMN3oz?=
 =?utf-8?B?dTI2dmZwdHg4OFlhTWZMelFDUEFQOUZWZjBDRGFqSkQ0c3pHOHlIcE9tRHdV?=
 =?utf-8?B?bUJFeU5acUZtUXNuN2tQK3ZYWDFlaTkzbUVUN3hpdG5kWEI5bmJYd3JtV1Q3?=
 =?utf-8?B?eE9QMWV2c0liM2pBOVJyWVNXTUcrR0Z2YnJESXdwZjIrQmdCRmt2N29XVmt1?=
 =?utf-8?B?UjZsdE1BK2krMGkzanNuSXpqVDJubHF5UkFldHZqQnpLVnZySjh0b1I1UmNj?=
 =?utf-8?B?bWRjYW5qRjk1WWxGUTB1U3ZFZndsSUZOQVkyMDZ5U3NMSnQ2b1lHWnRpUzJB?=
 =?utf-8?B?QkFqNExSb0MrR3ZGamI4R2FQbHRBc2Y5dlJMNmhkWEVYbzJsSHA5eUlpNUV5?=
 =?utf-8?B?M1M2Zlhmc2l0ZHhVNC9tU3N2c05XMXNCdHN4NkFtR1M0YnZGOU1KL0RLYzRT?=
 =?utf-8?B?QndIZUVSTUpFdWZXcXBXaFZZbjJheXBVWUtIVTVPMTFsbVoyVkJZZ0VKb0h2?=
 =?utf-8?B?NXZsdDFucDZaWWNFWHJHNjJseVN4SVBzTTZGMkE3T09GTUpSdGVlWkYxSHVO?=
 =?utf-8?B?eHBISnVmK3U2UmorSWU3dGt2T1RNcCs0em43NnB3blYrUUdvQm9VMkY2aEl4?=
 =?utf-8?B?NnZKclU1OTM4aUxpcTVjdTZ6ZzFLeHZPc012REp5NUZSVHc5dDI5SXo5WEg5?=
 =?utf-8?B?NHl6bk8zekU1K0p3Q0poVWVmam9XZk1CVlVsR2NCd2laY21nRHNLSlBHVjRh?=
 =?utf-8?B?SEZjWVBwY0Q3OVdrUGR5MzVhYkh0YkFvQXlObU5DTzlZT2UwaDVHdk9JWE5S?=
 =?utf-8?B?ZHoxN2FvU09kMDB1VzY2ZXFycDVCZFdYOWN6eGM2RlFCcUlwU1BweVZIemhO?=
 =?utf-8?B?SmZiWWNKcURsR3QzS291azVxdVNOcS9hOCs1akFTeWlQZzdvdWxhV2E0YXRk?=
 =?utf-8?Q?5s62u3A1Ef3XgA3E=3D?=
X-Exchange-RoutingPolicyChecked: VU7Q1jiYzE+hVkcfFtUiaeNflLanq7saXDPymF2Ov5V24AO/gcTxwbAQylmkZHAYg4lwS+7G/boZAv62jJeJD7IqBr31lYGZM8ceIiAiiVqG6xvZ8AKbw1NP6lfHGl8mJh1MMh6x75iPRaCmAzYTTpKUdKKoObD7cK55Y9mfhC3xGaVpYkHYVuD82dKkcDoD5j1THcPrJrnltzDKb4iJwEBQjVVThmOir1qLAMFawuy93XAt499MDJitnhVgMr2ZauH9/BoRVP6byHNnSdm1mlFNpDCEw8Hawlfv420XP2hAQMr3Ut8YehxLRbiU/81EalbyCYucibzpipPsfi+6xA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5567d73-f3e6-4000-9f9b-08ded30e087e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:03:55.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt2Q/PoWP5QUElJfnBzmM+BkfwG6JLzfMu3bwHY8SWPhwX0Rkn7w8VreJzWYg7WrIKnv9IQVNOq4bCKXbp+3V1nRQgOnMSa2ZRQHipIEM5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9564
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



On 6/25/2026 11:42 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/25/2026 2:21 PM, Michal Wajdeczko wrote:
>>
>> On 6/24/2026 11:56 AM, Michał Winiarski wrote:
>>> Notifications about VF state are generally not considered critical
>>> enough to warrant PF GT-level error
>> hmm, but without that error we risk that we will not notice that
>> we missed to implement handler for such notifications
>>
>>> and subsequent reset.
>> hmm, actually this could be our "problem", as initial idea of returning
>> an error from the CTB event handler was to print the whole CTB message
>> for inspection and later we also added the capturing of the GuC log to
>> figure out why this message was send and if it is legit, all this done
>> by triggering a reset to leverage existing capture mechanism
>>
>> maybe we should change the CTB code instead and trigger a reset only
>> under a debug config ? otherwise, if somehow we still have some gaps
>> and GuC will keep sending some unrecognized notifications, we might
>> enter an infinite reset loop
>>
>> @Daniele, how you see it?
> 
> The reset is not there just for the capturing. Our assumption is that we should never get a message that we do not recognize and/or can't process, so if we do get one then something has gone wrong; since we can't be sure of exactly what has gone wrong, we do a reset to re-initialize the state and start clean. 

but after this 'clean start' we could still receive that unexpected message again, so we will run in circle...

if we believe that there should be no unrecognized/unexpected message, maybe safer option is to immediately declare wedge?

or separately treat the -EPROTO/-ENOPKG errors (wedge), vs other (reset/capture in debug, just error in production)

> Note that the addition of a new unsolicited G2H message to the GuC interface is considered backward incompatible, so the GuC usually implements an opt-in to keep the compatibility (i.e., the G2H message won't be sent unless the driver explicitly opts-in to receiving it); a recent example of this is the uncorrectable error notification (https://patchwork.freedesktop.org/patch/732697/?series=168465&rev=1).
> 
> If you think that we shouldn't do a reset in this case, then this patch does the correct thing by processing the error within the handler and not escalating it. Maybe we should make the message error-level though, so CI will flag it?

the sooner and louder we will report the gap (wedge) then less likely we will hit that condition in the production

IMO reset should be triggered only when we are ~100% sure that it would help and it's unlikely that we run into the same situation again

> 
> Daniele
> 
>>
>>> Convert the error to dmesg log.
>>>
>>> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>> index 058585f063a93..65f015d0ede51 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>> @@ -1973,7 +1973,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>>>       case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>>>           break;
>>>       default:
>>> -        return -ENOPKG;
>>> +        xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
>>>       }
>>>       return 0;
>>>   }
> 

