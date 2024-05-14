Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D4FC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 18:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F4610E18A;
	Tue, 14 May 2024 18:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax4juTr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B934210E18A
 for <Intel-Xe@lists.freedesktop.org>; Tue, 14 May 2024 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715710723; x=1747246723;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=03W+4D5BqFMN4ljrig1uBx9LgQGQbVrfw4T/MMMsj+s=;
 b=Ax4juTr5pD1hVI5ocGlAUabE42IEpxQH4Qo0MH397oED57WlUQgBWkRn
 8SmKZLtVcuIvz4FQt4J0mc683CHDSCyNPzI/vR9Fgb99tNqJbgTsfEq23
 rvHTT2N7elk9pFn4H60VZf8bRe4WAibUx9tZrmMcz0P92j72oHTQ/GB1W
 O2LOumjLlJduInZmZT2xkehNZySS4URHV1dSErX9hg26qGMKh9JceiaLj
 u7dn5KcrZdICtSG0wGVr5g5wkczHxHFquahA8Hh5bGq7vHLtNNtE2XbN7
 Pf1QeNS+lM0BfgrFkltCH2C7DzulVY0+UytNQ7c/dkZQetqUzK7ECAymd w==;
X-CSE-ConnectionGUID: gbeIte0XTmibtnxvMWwp8A==
X-CSE-MsgGUID: uSrz8oGBSFKRYixXNHqOfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11881601"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11881601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 11:18:43 -0700
X-CSE-ConnectionGUID: sQzBTMnxSPaOpQnYY6rcyA==
X-CSE-MsgGUID: O1OtUqC6RNiqO32y3WxKFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30899475"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 11:18:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 11:18:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 11:18:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 11:18:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLnJp5HVtg0Hnmh9RYCX0iLXz6v7V2zf/Hy/KD13wGJZ/CFb2eaIQx+EpAC7LoavInGfnRh5dG/1NI08X4T6Fhss8zxj/Y2jlCjODn7pNOMHS2aIC6CksJqRMasXF9g8qjUj/SD2CdK5qBDT0ovWIjVj6KfnK7ueBP1cUWavAgXlgPp+dXj5w3CJoNf/9faNXe4QxKqjtKF7u6DGKaFObldMHGuYbdpz9feFdMUak6OCBe2ItpCYqfeLbLLuXlSVMhQi5olWc+tjr689/NzDDwtbDA5RjplnnNRofaiLGj9cAhZwGif5T0qTvU20d20NCboXtkedFURD+PtWuIaNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjDj73XAQsWiRiHTdr2mYIqJwC3AogUAaN4RN2LmZkY=;
 b=Bpe5rUmSw4lfdwl7CmrAnTTp7pNz51S0vUKKH62Ra8NefgZRCKRuk45DypsMQ6O1HjF95Ro/aN6tpTM2/q3QAacQCym48uVlRFj7Fwgfwf/7Fp2hw7YIy1feTukYeJPifD8Jm/qf/VMKkBPKMwdii72G7zT703fMga0/+i3wlN190zquZF3Ns90HnTE+PoEhIrT1i7MmU7m7inofH5mxxCMj7I6lRTtfgAfkAR+m4J1C31AWu2S1qePV6SCeBJETocoxrz4yyXi6yTIL3lvKwN0yqR14mDHPRLuN/EPO3HrITVk5Su9TEyh/3Ub7Q0kp4jT+UFOxK954+dse8IDHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 18:18:39 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 18:18:39 +0000
Message-ID: <55b67f93-cc9d-4474-87ea-5dbd5306fd0b@intel.com>
Date: Tue, 14 May 2024 11:18:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Improve robustness of GuC log dumping
 to dmesg
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-3-John.C.Harrison@Intel.com>
 <28b8fef5-14fd-48fc-92c7-09196d7f6680@intel.com>
 <efeef3d8-d656-4dce-af2a-516ff6be1382@intel.com>
 <ba495159-24ca-4dfd-b890-7ee126d8d719@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ba495159-24ca-4dfd-b890-7ee126d8d719@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f897c35-185a-4ffb-2ffb-08dc74424703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEF6MExBYXRqTFUvcGZBeTc1TXBOM0Z3T3RIaDhjazNhVEh1Vm9UZnBWNUlI?=
 =?utf-8?B?TFducnB4aTBXOGNxU0phM0FtVnRDVjZvM2dDRkM4YXFRTlpoTmlVQ0NMMUhW?=
 =?utf-8?B?aEdzdy9Wako0cSs2djlSam9EK1NiTlp0Szk5bHdEUHZPdW1NSVBtRk54Z0l4?=
 =?utf-8?B?NlVIbTJJSXBPeGozMCtrVWd0RG84Mk00TEJHTHdHSE1qcGNQYmVtV2FmMm1U?=
 =?utf-8?B?c1REbGQvaEpjMUNoV0lHTTd6TzlNSG56M2tzMFRGYjlDVWVNbzV2dmZDNlRX?=
 =?utf-8?B?Ly9raEdPaU9xT05OcCtHbDNWcHhtdG5kN0ErcmZWYzJkMWZYUEppYVVMWEdE?=
 =?utf-8?B?WUY2MjJIVmt3Zm9JNXF0RnMrR3ZCcHR0YmlrQ2ozMmJLY01KaDdGUjdjcmd5?=
 =?utf-8?B?dGRZdkhKOEVld0ROM3F4Z3ovVFY3R2gxUWFPOCs2VS9KZjhicjE0ZEZHOE9M?=
 =?utf-8?B?U1ZqTWpnL2ZzbUhnZ1piT2FpUHpPaDNUM3hTTVNTK1ZvRFBRWi9WcUM0WXdi?=
 =?utf-8?B?NGlxYlV1N3NPZzhsblJweldPdks1Y2hZYnlUbHBIbEROMVQrMGY2OUJaQlF5?=
 =?utf-8?B?ZUc2WW5LMTVYMUVudVh1Y3ZIYnAwT1RtcU4wUUEzQkxQM1h5SWFJMFAzVWlN?=
 =?utf-8?B?ZVF4bUNvc09WbXgxaitmQm9pYjdOTG03dVlmVEhodUJDZzNoNjJIZEI3dFF2?=
 =?utf-8?B?aEEwZDc0SzhtOWR3dCs4VWJYbzFTNEFwalk1dUNFUW9kaFdlRElKREtnVGFu?=
 =?utf-8?B?U0dwR1JVY1p3VnVTN2ZrY2ZFVFBZUVB0bmNyVzdZZmpwVEFyN25laWZPSFBj?=
 =?utf-8?B?cW40My9wUW9DSjZ0NzZXa3dJRVlqc09Jekd4UjJ2Z01iZHVuN1BRemFDMzJt?=
 =?utf-8?B?Nk1JWWtHYWg5dGRJZ1RWdTRVcGtGZHIraEE2Q1Yzek5CeFRIUm15ekUrOHdh?=
 =?utf-8?B?UnBGTkF3ei9QZ28vcS9PbXZjd00zRkJScGRGMWtjSkZ2RmNuTUcraG1TdjRa?=
 =?utf-8?B?bUJCcVpPMGtOQVkzWEhOUmROcEVuNHljdDE2WHNuWE1QZmg3YzErczI2UWYr?=
 =?utf-8?B?NFhBVUZEYnYzUHVHdlFSN3NjK0czYkhtQnlsbzBMS0dVai9iZ05ZZDJxL1ZX?=
 =?utf-8?B?bitRRW1WaDJ1YnhheDhiaitjSGxFYXNmVkRiOUFYK0x5R0p0dDNlOEo4UGJk?=
 =?utf-8?B?UXZ4VmRmZXhsU3FwMmg1NW01dE56VlRIbG04TG1STFVaUDVTWlRqT0poaS9i?=
 =?utf-8?B?Tk1QazZ0L1Ruamd0ZnZEYzBwVmlIOCtIczdTM2E1aUVlb1UxMUhEUGUyUlBH?=
 =?utf-8?B?Z2FDamNSSTlJcVRqTm0wQVhwbFNTWGRBQWNPYUpTV1ZyQUR5bzY0RzZDUHdl?=
 =?utf-8?B?Rkg4SHd2RXVBNE9hL2dZck1QUzVHUjNZQTBaZVpIWHNiZENoRWJDMW9HZEdH?=
 =?utf-8?B?Z1cyZFNCUGdFTE5Wajd0U09Gbm04a0dsbmtEMUNybmJXRkU3Tm9nVXdrc1RF?=
 =?utf-8?B?Sm9BUFJvSjFwT3RhU0lMTjFvTENEYVZJUVh0NWdhLzlIcndJUCtJay9XdFpk?=
 =?utf-8?B?c2tPSVhndmNSV282QjRMUGVYNzZqbW55c1NSd2UzSGpmbE5xeE5vWGJHbWZY?=
 =?utf-8?B?Rm5WK2ZURko0UHJPOWZTemt4RFF2NlhFeE81NXNXalBJTkdXbnlqWVdXc3Rj?=
 =?utf-8?B?b0UxMHRhV3UvejFDQ3lJSDlRdGdjQlBqbXJneE14NEVabXRIWVNkWExRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2t1bzV3a3h2aVJpaGpSaHdwamxNUXRoZjNhRjJsWWVSUjRVeUhGcHYwUUJU?=
 =?utf-8?B?amhVUENKajQxOXFoT1VHOTNJMmUvYVo5OGpFWWowL2QrY2RIMzZTT2NBdUhs?=
 =?utf-8?B?WWxWZWFlWk5wT0F5TnBxNDlyYmVuK21Kem1WOVA0VzFrR21vL3hqZzh0REFD?=
 =?utf-8?B?WFJKY25sQWdITVduMzBNUlJ6Zk1pQUdZWHEzS2E5WHFjT0MvT056QjErOU5K?=
 =?utf-8?B?SjhMNitMdjIrdzZQdXFTaWZySkh3NEcwVVhrcTRWbW1nbHZwaFZ3YnJkMzlN?=
 =?utf-8?B?NkRxS3MrMGRkQlVaKzB5a1d0QkozVHR3NVhra2VxeTNUcFgvNkk0NlhRTXl2?=
 =?utf-8?B?MFh5cnd2elp2YmIrSTQyZHRoakg1VEZNcEd6MHNaQzI1dnZKcjd2YXlJa3FB?=
 =?utf-8?B?SDNxbXkrdm5waDhhaEkzZGtuUWRWNFFpU1BxWFFtZHdqM3lrNVQva0xZY0tr?=
 =?utf-8?B?ODJLOXI4SlJvQUFZcTNua3JLY0FlcVJUeGdjZi9wcXFINS8rc2lucXZJbjI5?=
 =?utf-8?B?K2ZRMGNWMVRoOEs1TEZNdG11UHQ4M3hWQit4VyszN0RNdGNWZW1ieGl6Rkpq?=
 =?utf-8?B?dExDOWlVamM4Y1JaWHZjWXk1ZmliQnJWUytPZTRpcE9GeHRCZzAyckRLd2dB?=
 =?utf-8?B?a2tIRzM1NHNlZzhpZ2pIMTBabXR3R3hGMjlOQXh0MFBNUko4MlBvVTFnbG9h?=
 =?utf-8?B?OUhnNGtlamRRbzdtcGxTbWtRRldRKzkxQW1yVGtWVzNUTWtsdGNLOHRROGhR?=
 =?utf-8?B?LzJaU2p1bHhZRXd1R2JyS3pvZkdGUjlPbU1ITjVPMWtYMjlSYWlpYXg4RnFx?=
 =?utf-8?B?YU5ST0ZvSnFrUHU0ODdzc0o2SlNmM2JXOEF6TUFDQXhkckg5VFh5MFRlYWpk?=
 =?utf-8?B?c1pDdmdPWWJKbUN3Mk43T0Jka2s2bHc2SzAreXRCdm1MM3cvcHM1ZmFmcWR6?=
 =?utf-8?B?dkpEa0FCUkdReWxBcFI2akdPOS9qQU9pUzV4dUFjcWlmOWYyaVYwN0JEaHh0?=
 =?utf-8?B?RjZ6cVJiTytYV0hmdFZEdlQ0ZE55V2diQXhBWGF3enZhZGxKeFlaY3EwSENK?=
 =?utf-8?B?ZHh4YTcyRUYvSGs0WStCalJ6TDZDZXc0Rkc0SVJEMDVXMlErL28zWm9kZHQy?=
 =?utf-8?B?RTN0dEk4V0NzbHNoVzhxYk9RNHBxWTk5WkRLTUFuZFUwMitiRUtzUEdsUjl0?=
 =?utf-8?B?Uyt2a2ozcFlNTVlzZk1jWHZBeHArOFV0RHVSTTZMNWhGblJWZkI2UUZvS3Fq?=
 =?utf-8?B?ZGdtVXpza1UxZnlWVEhDQnNGcGVESWhRSGpBTVMzOFNQdUo0cFE2QVExMVgv?=
 =?utf-8?B?WjNBQVlJWG5nYURpdTk0dEVLeVJ0SlVNL09XQlVUSU0rbFl5SmluWHBEUmtp?=
 =?utf-8?B?Z3pwS1BTODduYUVxZ2ZpNlR6eGJUd05jMUVJY2pyVTNDcHBudzVLL0lVYUQ4?=
 =?utf-8?B?MVNNMGEzTWRNRlhmc2g3c3ZLaXVnS1R4NENnNVpieFBGUGtpbFV5U05Ea2I4?=
 =?utf-8?B?MmVCbHE0YVVjaFhicDA2SWkyMXA1UFNyc3pGWmdmQmpMdkJnQVdHNUNCU2xx?=
 =?utf-8?B?aHlJaDZ6M3RHZmpHYzZYaUpjZHh1VEhrK0psR0JicTRQaGVPQmlDYmtEVGYr?=
 =?utf-8?B?am9YNkNDYjUvZFg3aWp2Y0NxYTRvK1FzWm5jRityazJHTzYrampLODg1ekd6?=
 =?utf-8?B?SkJjKzdoelVwdi9NVXgyOFdHbk9zcmxJMDJOdzliNW1lZXV3R3FDZHZJbEE3?=
 =?utf-8?B?WkRVci9nYUV5eWQ4YW5ldmQxMm9PdS9CU1h2bWRtaVRIRGpXNXRidFNweFQ5?=
 =?utf-8?B?NUU3YjJ6UUh4d2M2R2NqWm1yU29xWFdhdUhVWlduMzBKeEVzdXo1QjQ1UmRj?=
 =?utf-8?B?dzFxVkp2KzhvN1k1c1NBR3I2ZUtndU9WdmpOaDRtRmhYNXdHVWxDZ1ROYlk0?=
 =?utf-8?B?NHUwY0JVcEFMWmdQZ0J4bi9LN1J6ZnFVeW5BNTFwSGVoWS9qNXVLL1RnL1Rr?=
 =?utf-8?B?Q1JuVFoyVkhZcHh0UThwRjJvVGhuQ0E1WDZhbTg5U1FQTy85Y0JDZmRPWmYy?=
 =?utf-8?B?ZnM5UFRLeHltMnQ5aGc1S0ZQcWNpWDkraW9QT3R6WGkrYUxFT3FVWW1MbVhB?=
 =?utf-8?B?dmZtOWxPU3JCOXNqUnF2bkpUQnRmM3dQY05WanZkSXJJdEVldFZGMGlHc3Rw?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f897c35-185a-4ffb-2ffb-08dc74424703
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 18:18:38.9619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YYAMCD+WOYkvcR+7magGut4KQXdwU1wujruRBOHCDQt+z09k231/9WA4KBgtZSgJQg7iFQu4oBGmVrxR+t6Z7WySdlNmrRT8irULJ5SFB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

On 5/14/2024 10:32, Dong, Zhanjun wrote:
> On 2024-05-13 1:13 p.m., John Harrison wrote:
>> On 5/13/2024 08:21, Dong, Zhanjun wrote:
>>> On 2024-05-08 6:49 p.m., John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>> ...
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> index 11682e675e0f..45fb3707fabe 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> ...
>>>> @@ -49,32 +57,79 @@ static size_t guc_log_size(void)
>>>>           CAPTURE_BUFFER_SIZE;
>>>>   }
>>>>   +#define BYTES_PER_WORD        sizeof(u32)
>>>> +#define WORDS_PER_DUMP        8
>>>> +#define DUMPS_PER_LINE        4
>>>> +#define LINES_PER_READ        4
>>>> +#define WORDS_PER_READ        (WORDS_PER_DUMP * DUMPS_PER_LINE * 
>>>> LINES_PER_READ)
>>>> +
>>>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>>>   {
>>>> +    static int g_count;
>>>> +    struct xe_gt *gt = log_to_gt(log);
>>>> +    struct xe_guc *guc = log_to_guc(log);
>>>> +    struct xe_uc_fw_version *ver_f = 
>>>> &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
>>>> +    struct xe_uc_fw_version *ver_w = &guc->fw.versions.wanted;
>>>>       struct xe_device *xe = log_to_xe(log);
>>>>       size_t size;
>>>> -    int i, j;
>>>> +    char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
>>>> +    int l_count = g_count++;
>>>> +    int line = 0;
>>>> +    int i, j, k;
>>>> +    u64 ktime;
>>>> +    u32 stamp;
>>>>         xe_assert(xe, log->bo);
>>>>         size = log->bo->size;
>>>>   -#define DW_PER_READ        128
>>>> -    xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>>>> -    for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>>>> -        u32 read[DW_PER_READ];
>>>> -
>>>> -        xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>>>> -                   DW_PER_READ * sizeof(u32));
>>>> -#define DW_PER_PRINT        4
>>>> -        for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>>>> -            u32 *print = read + j * DW_PER_PRINT;
>>>> -
>>>> -            drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>>>> -                   *(print + 0), *(print + 1),
>>>> -                   *(print + 2), *(print + 3));
>>>> +    drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
>>>> +           l_count, line++, __builtin_return_address(0));
>>>> +
>>>> +    drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u (wanted 
>>>> %u.%u.%u)\n",
>>>> +           l_count, line++,
>>>> +           ver_f->major, ver_f->minor, ver_f->patch,
>>>> +           ver_w->major, ver_w->minor, ver_w->patch);
>>>> +    drm_printf(p, "[Capture/%d.%d] GuC firmware: %s\n", l_count, 
>>>> line++, guc->fw.path);
>>>> +
>>>> +    ktime = ktime_get_boottime_ns();
>>>> +    drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX 
>>>> [%llu]\n",
>>>> +           l_count, line++, ktime, ktime);
>>>> +
>>>> +    stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
>>>> +    drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
>>>> +           l_count, line++, stamp, stamp);
>>>> +
>>>> +    drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
>>>> +           l_count, line++, gt->info.reference_clock);
>>>> +
>>>> +    xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
>>> Could we have a "start tag" print here? Make it easier for parser to 
>>> find dump start.
>>> Although we have the "[Capture/%d.%d] CS timestamp frequency:" 
>>> ahead, which might be an "in-explicit start tag", but if something 
>>> added after it in the future, this "in-explicit start tag" will 
>>> causes parser broken.
>>> A simple "[Capture/%d.%d] Dump start\n" liked tag is more easy to 
>>> maintain.
>> There is a start tag - "Capture/X.0 Dumping GuC log for...".
>>
>> The parser needs all the output, not just the hex dump stream. And it 
>> will already cope with extra meta data being added in the future.
> Oh, I'm looking for hex dump start tag, like:
> "[Capture/%d.%d] Dumpping %X bytes\n"
> Which contains total size info
But it is not necessary. There is already sufficient information for a 
parser to extract everything it needs.


>
> And one more option below
>>
>>
>>>
>>>> +    for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>>>> +        u32 read[WORDS_PER_READ];
>>>> +
>>>> +        xe_map_memcpy_from(xe, read, &log->bo->vmap, i * 
>>>> BYTES_PER_WORD,
>>>> +                   WORDS_PER_READ * BYTES_PER_WORD);
>>>> +
>>>> +        for (j = 0; j < WORDS_PER_READ; ) {
>>>> +            u32 done = 0;
>>>> +
>>>> +            for (k = 0; k < DUMPS_PER_LINE; k++) {
>>>> +                line_buff[done++] = ' ';
>>>> +                done += hex_dump_to_buffer(read + j,
>>>> +                               sizeof(*read) * (WORDS_PER_READ - j),
>>>> +                               WORDS_PER_DUMP * BYTES_PER_WORD,
>>>> +                               BYTES_PER_WORD,
>>>> +                               line_buff + done,
>>>> +                               sizeof(line_buff) - done,
>>>> +                               false);
>>>> +                j += WORDS_PER_DUMP;
>>>> +            }
>>>> +
>>>> +            drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, 
>>>> line_buff);
> The format of
> [Capture/%d.%d]%s\n", l_count, line++
> l_count sounds like an ID for this dump
> line is current line of this dump
> For hex dump, could we have offset/total size info? Which could be 
> used as an option to indicate dump start, where offset always starts 
> with 0.
But that is adding unnecessary complication for no particular advantage.

>
> for example:
> drm_printf(p, "[Capture/%d.%d]%x: %s\n", l_count, line++, j, line_buff);
>
> Then parser could have "\[Capture/[0-9]+\.[0-9]+\]0: " to looking for 
> dump start.
>
> Another benefit is: for the whole line is all zero, we can simply skip 
> it to save output size. Which is relatively easy to implement in 
> parser as well. Well, for this case, the total size info is needed.
But you only get large chunks of zeros if the log has not been filled 
yet. Once it has been filled, the savings would be minimal. Which 
basically means you only get a benefit if saving the log immediately 
after loading the driver. And if you are specifically trying to debug a 
module load issue, then just use a smaller log buffer size in the first 
place.

For actual genuine savings in real world usage, what we need to add is 
compression as we had in i915. That would add significant size 
reduction. But it is more effort to add in the support.

John.

>
>>>>           }
>>>>       }
>>>> +
>>>> +    drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>>> "End tag"
>> "Done" is an end tag. And it is more friendly to a human reader while 
>> makes no difference to a machine reader.
>>
>> John.
>>
>>>>   }
>>>>     int xe_guc_log_init(struct xe_guc_log *log)
>>

