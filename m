Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDF2C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 05:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A6B10E1B1;
	Wed, 13 Aug 2025 05:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfsaXXhh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CE410E1B1
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 05:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755064723; x=1786600723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SvBRrgT0NPbzoFQv5AXm5eBUQ3i+sWyYWIP+a+Dttf8=;
 b=GfsaXXhhUHbMqOO3iUlP0bNhyML89jWvsDxIz90m13bBV43XUANzCGTz
 IuaC7KDHtb5MM6iiBXisis0n4kZuDa8t7ZwkLgP/inWOxPTMGJmzVrTsW
 kt6SKKqWKp1Ft9mx/U+YensjQas6RlHaZe7rUbktNWP/Ca7YCdG2Jvopf
 4j/dvVsgvtB1hNAYfzKdt7X1Y0DJRib8bgaUEwc1O8uD8lh4UwfSK8qfg
 h/fFiVwPRTNFSa+LF42S/3fnBYeOOeQ7BWuknDBE/jsQ4jMZPxSnooWkX
 qjyWXX7EVtmO2LoZ7VYmU22UmwacZSHJn25aRhNnnR1F+wErsQXNCKlCP Q==;
X-CSE-ConnectionGUID: AYPZTU+KSwGBweALmq+gBw==
X-CSE-MsgGUID: cWV//sk3TEuCZIfXk8wDjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60969800"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="60969800"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 22:58:43 -0700
X-CSE-ConnectionGUID: hqIUQ471QUuuqC01uocGWA==
X-CSE-MsgGUID: WLI9Ke0OQZ+ReC481QWJsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="165605351"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 22:58:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 22:58:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 22:58:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 22:58:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHlEwI+C49dEqT7IjAT8MSdyyswGEqZXaZmI/02Q7Ag2/Rmu1LdDHW7QZ6EKoHPx7VswTRiJle8bBOVsR/Zrb695bv6I0JwxjzQ4NyIRLrmbWqZZ/NXc75C6MZ/2Xbisnam724ckzTeyqHMVyrNqFJ9WgBBaMnLw+srJSn28N0f9okOtSpURjc5qbKt57SzO0KHUCzfHzF3IzpjBB4fNnW57fRntmac5qUoNJQodQ7j2r42UzCAQGiUmmSjVomIAGZwbN8XcqLjJIHPCCfjxk+zWYUlGr4OvjL5wlyilZlBWtfO8wVLPe6Qc8ljQVRGxUSJvYH6sRuAPu18m0J9wKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmMDzln4FMgPQgRqGQbKMy3vQmqE1sg0lI6Jq2INx6k=;
 b=c6nBcCOzd1HMREZSR9etsaGI5Q85gMFTb68SQcAVurdXHv2p16Eh8kEVUMlwNt4KKZzwAP/2MZZkXAqOlEE5Q20ihPrkHWXcV0kUexL1ndzA9ZmVvRQuStegWGq8Bqf/GbzNXbo/FDkhQTKCq5X50kmKWyr7DXnl+puUU6u1oAncSsWa8chEfWnplPPD3oXOt88bAPrq2ADwt3nO9t4HhOjwzrBYQYxg+QVacvZQbJZFy3KR7RgvJzgwjJSPIxVTnVaQVjb3csveLrGr2UN9pjBtUYe45tY4OsmVHYKPuS0pa1TqtxBi4zP70ceY+H837DbXVEdBN/3XdkKalXxL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.13; Wed, 13 Aug 2025 05:58:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 05:58:38 +0000
Message-ID: <9e87c59e-de7e-478b-8916-ba25a24c6f37@intel.com>
Date: Wed, 13 Aug 2025 11:28:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/i2c: Introduce xe_i2c_present()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Raag Jadav
 <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250812122646.1178231-1-raag.jadav@intel.com>
 <aJs8F1gFEhKszBD1@kuha.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aJs8F1gFEhKszBD1@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: b947dc3e-63d3-43bb-6ef6-08ddda2e725c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlowU0FrYkwzQjRJQ2tTdVN1dndkSkYyWDZCVDRJTDVwc0RvekgwLzFadlNs?=
 =?utf-8?B?V1ErMlRzblhlMVZQZk04TnpjVUFraXZXT0g4d0NHaG1aamdzVEY1eWNzOTBx?=
 =?utf-8?B?R3VhZkVpVXY5MGkxMUdWbW5yekFVMVdiZmE5dWFlcGxubThKREhVR0hTVTIx?=
 =?utf-8?B?Tm9wOUdEbnpLSUVqdnJEK3laVXUxcTIwU2ZDSlBwMHR6ak50cnVqdW5pTy8x?=
 =?utf-8?B?K3d3RHZ0d2tiQnM2U3R4bHVzcnFqVFJrcUNWMDJPaEc1RzcwWEhUbVNCUzlh?=
 =?utf-8?B?ckhDSEQ0aUpJcFF2UVc5VUZ6RC92anJUTW5yaVkzejcxTU01YW9HSDYxL2dz?=
 =?utf-8?B?NXNGRkVnV09DN252bEVBamQvcHJpS1lpNGtsU21mWUcvWXNsVTdBbkJGakxQ?=
 =?utf-8?B?RXpDdmU1SjlWUytUMlA2YWNtN200djNZZzNacVBGMUhkYWV6U3NueFoxLyts?=
 =?utf-8?B?OUJhazBWeFJaZUJWaUlsek1sTlJsbnpRRzZmeDJTU3NWK21WK2hTM1U0T2tG?=
 =?utf-8?B?eGE5SUlXYkNaMjJwNlVHM3BQNFZCQ2FvSmV4bkk3TWoxY0pmcDlqQXRqNVpl?=
 =?utf-8?B?bU56dFEzaU1leFNxSWk4MzYyNGFvRE13ZDFSN0VrN1gyNm1qSG9NbWN0YzFK?=
 =?utf-8?B?MUpCckFpSHdEUzRvdHJGK1NMOG5Cb3RkNmlMRzkyY01SeXdhS3ZROHIwMURY?=
 =?utf-8?B?cHBSekptZHFiam9OTkNadDVuSUdSb0pML0xzZGJXMWxQUkF0NjdhbG8yWmFT?=
 =?utf-8?B?azhCQXZjWmZrZ1dFSmhXOXhPWnYyemFYREhkS3hJQVl0MjJRc2tZUmRXUkdQ?=
 =?utf-8?B?bjJCUTgxeVNxR0d4UkJ3K0VqK0Z6WVd5R0hzU0FGNC9LL1lqSmVoSE5JU0Fp?=
 =?utf-8?B?Y055S0tPTFRUOGhsWU5KYVQxdXBybU5pakxkNHUzWVVzVXlEdVMxS0g5ZEwy?=
 =?utf-8?B?K0o0b2ZDaVFZZ1E2aEZPVDl4dDZES0FqQURTNVd2dnZHb1Rlakd4UEVqQ25j?=
 =?utf-8?B?cUtTVUwxaHlaZ3pKL2ZHMFZFSnBzdHVEY2R5Tkt5RGtXNGI1SldEM29rcFFs?=
 =?utf-8?B?WE4vVmwwaDFEV3RQSnlWUk9NY1pwR3FrUlFoMG40bHYrZzMzdnFxSGJET3ZP?=
 =?utf-8?B?N0xLVVZKOEhNSUtyR1daMUdoR3UrMTJJV3NYb2Z0aXR0ZUlVVFRscEZ1b1Y0?=
 =?utf-8?B?M0NJL0M3bjNtdkNoVXVKb0laS3JVL3hqOGRnQXBVZU5HS2VkaFRWREJtd2hS?=
 =?utf-8?B?K3ZiUTdsTHBZa2ZTbnh3Vjc4MzBKbzlVeDgzMTR0cTZhRThXS25vRjRucTFu?=
 =?utf-8?B?TndNMmVMQUdnSjhRSzd0Mi9NU2tKWkFaWmFpbTMwUDBjQXprL3FUaUFXRWpP?=
 =?utf-8?B?NFFINGdsdjllKzQ5SHRpd2RhTm9YVmh6NHordytVMjEyUWpXUHhSS2ZGTk1j?=
 =?utf-8?B?bXZwVW4yL0hwQ0dJQ0IrdHZBUmFPcnhyZjdQRDAxbEhObmxXUEFkMnlWOEw0?=
 =?utf-8?B?UEF2WWtsMzNHR2ExU0laVWVyWlIvdVFwNXFzZTcwQ25sSkJJTWZrMUxRQXNs?=
 =?utf-8?B?azRIQzI5UzhiOE5FL0xaUjhYMTVLQmo1akcxbTBnenhMWk5MRTNvSGU3b2NF?=
 =?utf-8?B?OVR3OFRaSU5OZDZpc3ZyOW85N3h5Q0dVaVJxRnFHT2l4ZmNES2poU00rUHVK?=
 =?utf-8?B?eGRybHRqOVJtL1E3WU56NDlLZEFDRzNOU3BFVzNZRXhhYW9EUG5NTk9uOTJY?=
 =?utf-8?B?Z3ZYL2s5czBwVmRsUHUwSDEyd0IwSDVVaFFxdUVtbUxIemNtNXAwR092c0Q2?=
 =?utf-8?B?U3YybWhlU1YwTEYxWHlIOHpObU5UOXJNYTluT2F0OUo3Tnl2R0o4MFRiQ1c3?=
 =?utf-8?B?RDBoVlZ2bzhTbXBZNU16OGdVKyt1QTNzS1NubXRneW5OS3dnVENiOVJFU2dy?=
 =?utf-8?Q?H/MLyYj5Wzc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzU4bzJHMkd3VmJ2eDNnSVpObmVMbW1LRFVDc0dSaDRrdzlnbXB4Sm8wWE9B?=
 =?utf-8?B?Q1prbThhTGxQbVpqMmt5VlNZYk5FVXhMTGJPc0ZlSTU3c2xza3NpeFI5dEli?=
 =?utf-8?B?V0NJNVRZR1RNNnR2Mkw5V2JCNnVaUkZTVHFLbElDWk9rMHJqd3dZUkpuOXBC?=
 =?utf-8?B?VGdFTWJsWGFKN1NUdGxmNEJnVUpwdk9wanAvZ25HeForTkNXeCtaN0RyS3Fs?=
 =?utf-8?B?VEJLUUY3dzVMODlPUTFoRkN6Q2FUOU5sSTdDYVNFZkZJYlp5UFRBRXJBTVo0?=
 =?utf-8?B?L0J4NnNNc0pSVjlGcTJ5ald5UXVzRVJDUURlbHdiZUNBY0lWVW52SnJLc0tk?=
 =?utf-8?B?OGJPZThHemZzMm8yN0hoMmNCVHZYemR4NHlxWGlNdXcycEd4WHc3SHJNQ3cy?=
 =?utf-8?B?MHE5QjVBT0V4VDBKVlFYUHluQytvTmZYMFVvOGtWUm9teENNSjFtMXNGWUtk?=
 =?utf-8?B?aHhBU3hJd0ljcko5WHZ1S1gxSk0wRE9VZzdwa3RUeUlZYXNWSFJOSnR2Qldy?=
 =?utf-8?B?WHNJL2ZTM3FFMGFuSXlsUktTSGhKbk9OZGJ5YXFTdnhFdEVhU3htZFNrUncx?=
 =?utf-8?B?cTJGcFVVc3VvazR3a3JoVHR6ck5GcTkwVktQTzVWOE9RUzdyNE1WYllBZG9R?=
 =?utf-8?B?NFQ3MDNMLzRwTjkreisyRCtFOTVnYkMxOXZ1SzFTbG9PN24vWmRpUlJuZlpu?=
 =?utf-8?B?VFpIdGovcWdXNWFvQ3BtdTNhSENuZ0VEem9jQnZEdWlxN1BYeDZ5dDNNT08v?=
 =?utf-8?B?SkRHMUszNkwxOEFHZDY3b1NzZFN5WlIyS21paENwdTA1a0ZhUFlOZWU2SExC?=
 =?utf-8?B?MTlHUDVKei96M3FjZlVyMWJGOWJLMC8rd2FNSnhyV056Q0xYNjF6ZEtucVJV?=
 =?utf-8?B?Rmo1UGdMT212bHNseUtFbVNnYkY4ZlpxcjJQRUNUckhzT1Nhb2NueWxlR0No?=
 =?utf-8?B?bld0UWpleUV1aVl1aGZMT2lUcmtPeDJ0UmdSY2dacFlNY0piWmZOUjhsZC9P?=
 =?utf-8?B?WHV3cXFxcUhSaGhVOUpmOFlxR2JkZVZrUlkzYXdSNHBzeFNuNURLRW42ekZM?=
 =?utf-8?B?dDJQRGJHUUhhb01JUGpuUkdkV0xrYzU2dENuekV3K09pTVR0RWI4TVRCTW1N?=
 =?utf-8?B?Z2Q1dlBtNjl4NTN2Z1Vsdmp5RGxkTE90TG82aTEvNld6Q3FBd0NuaFI3Rkph?=
 =?utf-8?B?bWZvTDRqQmMza2s5MXFOMHZycldtQmtraWNrV1QyMHY4QjVzem9jcFJmQTE0?=
 =?utf-8?B?Q1JaOHA4WFpjdGsxMTBDVVlnNCs0VU1XdmJXSlRoeW5vMVFHMTdWTmVJWUM2?=
 =?utf-8?B?Nmx3dmRWZ3dkQ1R5a2NwN3NSSmJveFdqWGpzMk9GU0tjRGRzcDd0dVpqdTY5?=
 =?utf-8?B?MTJ4QXBPY1V3S0RsTTFCUU1tcWRkU1RFOU5VVFFQNFFieWIrMWlFQmt6MEIv?=
 =?utf-8?B?bjAzQnYvaU5pYW13UW5xb2ZVQ0R2K3grOFBMWlhtWHV1NlJVVFlrUUJicldz?=
 =?utf-8?B?N1kxckYyU0l0RGs4UDQyZXdjSzZFV3RtUXNwRURaVEt5SlZBZVc2NlQ5TzZa?=
 =?utf-8?B?RmFWMEdWcWF1NmxsdE9ER0w0NVE1RVl5cER0Q0NRTnlVMU9TWkRVbkc1eStQ?=
 =?utf-8?B?bGl3WUJQY0JLYVV5NUVpVTh6NS9sZXB2Sm5NMVF6dHpiN2tUYUxOYUprK01U?=
 =?utf-8?B?cTFoNXdXOW5lbXZDK0FEWVpncGQ4RjBCTFJpYlBsYndCTENXQldJemdwTERq?=
 =?utf-8?B?Uy91Ujl1aFpPalI4SVpvYVRsbU05TmNINlk2ZkZnMXk1NUQxUmtxdS9wTElQ?=
 =?utf-8?B?Q2tPZWhVbURiZVBtWHZtdnJ0Znpld0tlWEVTMTdoMm93SW9yMTQ2Qlc1RXNx?=
 =?utf-8?B?ZC9lVlk0RFN2Q2Y0Y2NFQlJobzlJVTJKNHJ5Y3pWbmFEOXdIeEpzSlFFTG1P?=
 =?utf-8?B?WlFIQTBwbkVtR3hwek9jcmtCVXJ2Z09KVmNHQmVTU2dYVXBKc1ZvZkJrQnh6?=
 =?utf-8?B?V0RVMGZpMDdwbFE1cDMrWE53R3pmUXZmanNidEVZZHF5SzBodmtqeTFUeUJi?=
 =?utf-8?B?T1JzVHB6Zk9Ud3VMcUY0Z2hRMzNRMy9lTzc0Ry9pc3p1dURBSGF0UHlnWkto?=
 =?utf-8?Q?1MT65Zwo0fa8p6ikekELixRlZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b947dc3e-63d3-43bb-6ef6-08ddda2e725c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 05:58:38.7151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4drraLrF0t8QLpOFzfLIW+q8yzNWr3TmY6Of7EWH6pRNPsWVLC/QItB6x9Tc9T839y36vOe25eegULmWpe2Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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



On 8/12/2025 6:35 PM, Heikki Krogerus wrote:
> On Tue, Aug 12, 2025 at 05:56:46PM +0530, Raag Jadav wrote:
>> In preparation of wider usecases which require checking for I2C
>> controller presence, introduce xe_i2c_present() helper.
>>
>> Suggested-by: Riana Tauro <riana.tauro@intel.com>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> LGTM. FWIW:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
>> ---
>>   drivers/gpu/drm/xe/xe_i2c.c | 18 ++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_i2c.h |  2 ++
>>   2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
>> index bc7dc2099470..6534ec5de6dc 100644
>> --- a/drivers/gpu/drm/xe/xe_i2c.c
>> +++ b/drivers/gpu/drm/xe/xe_i2c.c
>> @@ -146,6 +146,20 @@ static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
>>   	fwnode_remove_software_node(i2c->adapter_node);
>>   }
>>   
>> +/**
>> + * xe_i2c_present: I2C controller is present and functional
>> + * @xe: xe device instance

'-' instead of ':' according to kernel-doc guidelines

With that change
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

>> + *
>> + * Check whether the I2C controller is present and functioning with valid
>> + * endpoint cookie.
>> + *
>> + * Return: %true if present, %false otherwise.
>> + */
>> +bool xe_i2c_present(struct xe_device *xe)
>> +{
>> +	return xe->i2c && xe->i2c->ep.cookie == XE_I2C_EP_COOKIE_DEVICE;
>> +}
>> +
>>   /**
>>    * xe_i2c_irq_handler: Handler for I2C interrupts
>>    * @xe: xe device instance
>> @@ -230,7 +244,7 @@ void xe_i2c_pm_suspend(struct xe_device *xe)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>   
>> -	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
>> +	if (!xe_i2c_present(xe))
>>   		return;
>>   
>>   	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
>> @@ -241,7 +255,7 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>   
>> -	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
>> +	if (!xe_i2c_present(xe))
>>   		return;
>>   
>>   	if (d3cold)
>> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
>> index b767ed8ce52b..ecd5f10358e2 100644
>> --- a/drivers/gpu/drm/xe/xe_i2c.h
>> +++ b/drivers/gpu/drm/xe/xe_i2c.h
>> @@ -49,11 +49,13 @@ struct xe_i2c {
>>   
>>   #if IS_ENABLED(CONFIG_I2C)
>>   int xe_i2c_probe(struct xe_device *xe);
>> +bool xe_i2c_present(struct xe_device *xe);
>>   void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
>>   void xe_i2c_pm_suspend(struct xe_device *xe);
>>   void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
>>   #else
>>   static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
>> +static inline bool xe_i2c_present(struct xe_device *xe) { return false; }
>>   static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
>>   static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
>>   static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
>> -- 
>> 2.34.1
> 

