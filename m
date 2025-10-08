Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A956CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 16:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B22D10E12A;
	Wed,  8 Oct 2025 16:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqMMsOTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD3210E12A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 16:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759941188; x=1791477188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JgpXXZ6Q5W0PUPLKuyNkx/HngNIGGrfGDk4axy9Sijc=;
 b=gqMMsOTRy+sbLeVzqaOw1tQHaWLisgyyni/vd6FDGeuLSVwdcghts2LL
 /7MDYU8WI23t7iQQJrbaouony/b3P6CUS7C3Jhhf8xHwGeUyHE56i5a1p
 QR+tr5lplycYgPzw5EwLMVx3gR6ssAAD677EWrWdodLqFVwZCoRB/vSiL
 e3lu7A/yPtvmdZxpkgmKa89FM88UPk5qwIvqV+ftYYeo5ujJ3gY4FMmey
 yo7839nS8jzKE+fWay3eA6bQfNDltfk8EQ/SBSvfKbb2oFXty477UYwIL
 FIRvdL7erCEB7JEmhW/caxnKkts5ZkhxFRaUY/chbSK1Qn0kI3lAgV2Ap w==;
X-CSE-ConnectionGUID: OcoYKL1BSgGz4TeFxkcL6g==
X-CSE-MsgGUID: 5ogz5eJMQduXXNPnMHmsVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72754636"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="72754636"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:33:07 -0700
X-CSE-ConnectionGUID: AHkuvmIPSWuwXca/2RfzLg==
X-CSE-MsgGUID: ICCf9aFFQeKGWKVz1+8oIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180895351"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:33:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 09:33:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 09:33:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 09:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moHSJU/fjP64yfQ88jbmqvrCHNnKXSJ9Di1ENiessDNDT8A8TBxvvpc4IAAuKD4YAeFeWBlBs6IcMNKTLok72u6u19qM9DVpa/IOezNX92KG4LSEAVBDPFF/UCcOSOr5PmIWcneqjXpcPf0QzmQT5LQBQeRGs0o6zenum6YEmE6jRD8NiDFg7PK02hyzLKlho8XzxehVzEC/3GY67hnOShxIfSS0sG9lRVGoQ/WcUay8GMIouvN3OsAs7Iz1xcFcD8w67pINVRTaXssnlcYDM7PLw2sWHUDRmA41TvCEM5lMkTagKu569RLUKdaSjVELGSquehC8qmmrtenaqkxe5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktjLKkbB4HRkzEY7Pwa1C9jS2li4TCP0n9OPvPVskek=;
 b=fNADQ6CK8oFfY6fwnPfTwD/dOG1BfF55eXw/rwl//Q6esJnsxpGxuertZr6tu6krEHdj2Onqd5OhH4rZwso/AV8sMjdWrmkvm5O0M+Mg+LYBnQY2c4PMjf8AtQ1+aZYFVk2dEXLtPJpEFRUts4z5tkt/+i6qStrWsHmlVlrByQCfccQYFDm06TvPQkCSPPk6okHm1X09sUd5Q/aaUK6wfDqfb+pMx7mWPOBNCCghuSRPWdKHsN98Eau6BJdaNLD1frf0cf8gLzPVu+4/RtNna3PFNOFO4PMQ4JV1uFNbVH87QTJKijSi6B0RJ2sEueEitiDP622/gcEiPE01A01ueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS4PPF31CEE2CEC.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::1c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 16:32:59 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%4]) with mapi id 15.20.9137.018; Wed, 8 Oct 2025
 16:32:59 +0000
Message-ID: <019f20d1-6823-4907-bab1-fa801336b976@intel.com>
Date: Wed, 8 Oct 2025 22:02:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/svm: Ensure data will be migrated to system if
 indicated by madvise.
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20251008111050.293151-1-thomas.hellstrom@linux.intel.com>
 <20251008111050.293151-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251008111050.293151-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS4PPF31CEE2CEC:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f10596-da62-4ed4-4f79-08de06885775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elo2cWlVU01UTHRwa3V3TkhnZUd5VDhJdkVOdHAxTmlyRDZvR1EzQzRrdktP?=
 =?utf-8?B?S2ZVYmhLclIyTE40U2ZvSm5Va3JxdU5BajlqVWVqMmRPT2JVVmdhaFhGWGl2?=
 =?utf-8?B?TkhQb1ZWa0ZxR1RwcUs1WmxtcTNYd3U5L2w5R1hlQVVncmhPY2ZHcDZSNGwx?=
 =?utf-8?B?WGxTQ1RmZENmRmJYNVZpT0lIMTlpdlBrL2RiWmZzTHFZOS9TWE5YVjhxWjZ4?=
 =?utf-8?B?UkhScjhSYVNnRnYxdHJjTDNQVDdmOHdINGVKaTNqTkZhZDFsVzBsYnlHYUZM?=
 =?utf-8?B?U1U1bzZ5VWo0ZkFPT0ZiVHBLdzFqTzl4ZndxUU9RQjlZYk1sSzd2NUpWeWNJ?=
 =?utf-8?B?VXBjRlhYbkRKcGZoUk9DbEh3VDVaaEZ3VWxXN2F2dExpUXhOQ0tnMmVhZDRi?=
 =?utf-8?B?T0l0ZHBLZU1SeG9HZHNYTEJGM0FVUmJNVTJheE81QjE1WWJ2ZWVJWlFKRVpC?=
 =?utf-8?B?a1N5aHJkc1lRRmV4dDdTZC81OUh4RFBPU1Q0bTNSYjQzKzZUYzI0dkMvYWcv?=
 =?utf-8?B?RmNETnJ4UFB5RmZ6ZnFyS1dwQ1hRbDRwVHRDUkg0QmdRTXZKam5VOEZ6Vk1x?=
 =?utf-8?B?ZGQ3MEtKNGk3dS8zanhHSUFiaVVjQ0FlNVJsbjVBR3VVNGE1c3J6NG1KY3kr?=
 =?utf-8?B?dExWWUtWSU9TQ0RMMm84TGtzaVVxZEMxd202SXNlbldMMThKTm4ydUZrVnR4?=
 =?utf-8?B?Y2czUkVJYXRJSENFNkJPV1dwelVwOXdtOUtQaW1HM2FCRHdValdDWEpkeS9s?=
 =?utf-8?B?MmVPN2JjanBiT0ZvRyt6UndVQ1hsWkNMcEpaSCthNUo0eExvQUc4b3c4Q3Vv?=
 =?utf-8?B?UUd4eHVyZUJ1MmgxbXUxdlh0TU1lRE14dUo4V3VtT1JqbmVaYWZ6YVIyVTBT?=
 =?utf-8?B?Mzdhc3BqY2Q4VEp3ZkIxSG1xRHF4Q2xWbW1WWjhHMzcxYjRMUDhucjFTUGNa?=
 =?utf-8?B?U3lRbkF4eXFXZ25HaGI0Y1JMZmhId29HdlpXdXVDNHBoQmxTbHlUdzVuOEV4?=
 =?utf-8?B?Y09WZWpvUHB5TTJoalpIR2JLcndWV0hYd1g5algvdnk2d3FhWTlBRzc0YXlG?=
 =?utf-8?B?UnU4bFRzcGo3SjQ2bDJIOEN3aVg4OGoxZGFkay95RCtmdmtkQXFTV1Q4bjQw?=
 =?utf-8?B?RXRJY251V2YzSkhkSzkrcVpjcnp0OXdndzFZOStYZWMxZmpMVHJrWmUydEJ5?=
 =?utf-8?B?b1hOUnFSYTJxUjNGRVAvaGdmcXJJUnZTbHNWNlhKVUhwREhPbEZjK1p1SXZj?=
 =?utf-8?B?N0R3cS9Dd0h0NWZOaFdtOWt1aHZWYkZFREhleFQxUHpQTWh0T2l0YjM1aVVq?=
 =?utf-8?B?WkVwRW9ZOWkyWnNSc3RaTEVjVGxqazdjaDVOTlMzdUJzcW4rSkZvRE82N05v?=
 =?utf-8?B?Yjl3bjIycFAxUDJoR0xoVlhvTEUxaC8zdldHZG5JLzk4MTlvcE54QXpReEla?=
 =?utf-8?B?VkRSR3pCb2pIcU50akswd2kvMFFrK0ZsdjBjbmt1cmpGNllxckZRZmUwNW5s?=
 =?utf-8?B?cTVXcU1JbmZDRUpkUnVtYjU4NlF2UVR4ZmdtZGlTZ0pDY0NiK2VjRGhRdjdY?=
 =?utf-8?B?RS9hb05RLy8vQkErZDJyV1ZidFgrektiQ2dsTURyVEVuQWdZVXhWSEhMYUpP?=
 =?utf-8?B?QitLSEtNZkpnVTVWb1NRS0hMUTYra2pKSmwrTi9KK0dpUEc0ZVZJTXk3Z0pN?=
 =?utf-8?B?Zk5QOVNHZmYyTktjTmsxL1ZHNmp3NG1BWEsvQWszL0txaitZdDZ5U1BaOXNu?=
 =?utf-8?B?M3VodVJBTUpwWVpVdFNMTGk1cDFPVGNtZkg3RG5uK01Vb0lEeWtqdTlGZUZs?=
 =?utf-8?B?UTZLRjFvUFFET0d4V3IyTjA0ZWs3ajB4TmZhNzJxVElCblBNSVhkTEFla01Q?=
 =?utf-8?B?clo1dUExRURzTk1UTDA4ODJ6MEVYUloxNEUwT0hZRW5Oc2h1QWttb045YTNi?=
 =?utf-8?Q?t/RiTADblFQmGidTqY+c6Q9AbG62MAld?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnUwbDRVQmZ1bnBSc3ljYm5NUlhwb1FQUU1sb29KTFd4UnFUOXNKQTNnNzVk?=
 =?utf-8?B?RGZsaTRJTnF6RXNOeGN6ZEJLNGtEVFlicXhxYzhHc1R1RG5uV29PRUJEQnNZ?=
 =?utf-8?B?eGwwOVljdXcxK2dBMzE1RU1kRmhQaTFYNGI0SVEyUWh2ZEZtM2pFa0FGQzN3?=
 =?utf-8?B?QldaVFpIekViU0ptWmRCR3FXVDdTQzlGdG15TXc3b0hnMUlrN2NkeUxCTzBW?=
 =?utf-8?B?ZG8wSjVieHh2UXZ1b0tCQU9GQlRZbllwaWI3QXNlWnNRZjcyOGVHT2ZRWTlU?=
 =?utf-8?B?V2huTm56eDZkWnFZeXRUZDE4K0JsWE9VYlhaVGJ0WE5rSVN6UzZSc2FPeGNK?=
 =?utf-8?B?Um1yWnUyS3QrYnVXS2R0bUQydXJPK3ZXNXBDRkM2QmFnVkdBcExiSUxIcVdU?=
 =?utf-8?B?SGxwdFkyUkVYbWtWalArTHJRRENiWEdSK3FQcWlwRmp4QlM0SFNUOHp5MWlI?=
 =?utf-8?B?OXU1QXFPTUxGV21kU05Jbk1RQ0svTWZIaFlvQS9FeUN5U2NrZlNra3JkRjBI?=
 =?utf-8?B?cUxmZVMxOVVuRU5KUUhyQ09EZWd1L2JRNGF1TDhlL0QxaXdqTmlnTGZSaGNq?=
 =?utf-8?B?ckIwakdsMHZJZFk0UlFDM3pUUVJzbmY4Q3VLcmhncGhCRVpQdXRsRVlGZGxZ?=
 =?utf-8?B?ZHZpZExMUDlVd2haTVRYUGF5UWVwczZybjdQUm9IczNHRmRha3l0di95cEJt?=
 =?utf-8?B?VXROclJkV00zTEhMekEydlNnUCtpa1dTMTZMOWs4Z3VhdGM2YlZ3ZU82Z1BD?=
 =?utf-8?B?TVhEcW01VjJwdDVFaVl0SDNJUGM1SEd6UHVvM3BYYjh1Wk5yZVZpRzRUMHRF?=
 =?utf-8?B?aWcyT0ZPelloQ0M4ZjRWTWpkRk84Um04RXFGZDJ5bG43WE02bzFHZ3g1VEF0?=
 =?utf-8?B?TGF3RSszT1Z0YUdOWkEwSU1LRkhjWHBQZUxqY0lLSC9Qa1NQZXRCdXo4cHlO?=
 =?utf-8?B?Rnl1NHpqOEZCbXNDNzNjY2lXSThUKzBodnp6b3FUOUlpdzBuQi9zMnY0enZ4?=
 =?utf-8?B?ZkxvNklLZ25WWUNLN3k1VlBYbkxOYm9ZdjNYN3RoazVlemZMSG5kYkp5QXZj?=
 =?utf-8?B?VGs5dnpMMTVhcXFINDN0WkVWWjlLQjRlWk1rTExvNk16emFqcXEzUGZFUjM5?=
 =?utf-8?B?WDVJRzJsc0pad1J0QkdMc1ZCSmNub1pGSmV0WEREZk5qTE5BMDZUNTUzQXph?=
 =?utf-8?B?TjN3NDNyNmcyamF4TU1nbUZyaS85aC82VWlGYzNRaTdOdGV2bXVFOVZJZDMz?=
 =?utf-8?B?bm5iRGJvN1hVREVtMWgrbGdMbmQwcVpHeWFQNDFYU0tpNnBKOTV1ejEwcDlU?=
 =?utf-8?B?cC9xZGd5QVBYcFEyZFR1RXVMTHNBc1JLY3hKZHZvdm9lN1c2YWU2ckdPYzh5?=
 =?utf-8?B?OWtWaDc5OWRSRXpac2kvMzR6akpIMG5rUlYrdTVzZ29wWDZzdGE2VUhUZi93?=
 =?utf-8?B?Q3BDd1c3Z1ViYXF1SEd1WVd2V3VpbHo4N0VhS1lwM2VVR1k4Z1ZGb1lrUXFI?=
 =?utf-8?B?ZFpWb3RDR3o5SkdEVlJnb2ViQTdyY05kRjN0UUJ0MEppcHhhTGFEdzBtTkND?=
 =?utf-8?B?ODNFQkwxQlJzU0NyQUt1RnBsY29RSzhoS3lsZVoyVUViMndpcUg3aE9EMDFF?=
 =?utf-8?B?TGs0aEdyTXMweWcyMkFMQTNCMjZRbDZsS2cvL2JOY3JtV28zd1ZKcUtoT0tI?=
 =?utf-8?B?enVKVFhNSlcwSEY1d1FEZjlkVmJRNk5qQzhMVi9ETWtQTFdSbXlFelBXenVv?=
 =?utf-8?B?MXhVaFBxdjZhY3BBRFJUWU51TTZwL1hMMkU4dm9Oc2NpSTVadHlFMWQzNHNi?=
 =?utf-8?B?UE5iVVUvUWxZZ3ZuUHNUaEZYYTdsMVpmRlAvbGc3SjVWYVdZT2dNbVZqSDJU?=
 =?utf-8?B?WTkrTGVlZkIxR1NrQlh1TDdaWjF2eklRc0VUYTdpSmwzbGh1K05vL3FmaUtY?=
 =?utf-8?B?MFYvN3FXV0tQUkEyWFFvOENjTjRkVC9tck1vOU1Wa2Frb3ppeTdSRWJlWlNB?=
 =?utf-8?B?WHNod1hHUnVwbGFrcytwVEdlemYyNCtOMmFvQTdFVDY0M3dGVU1xVFFqTE5M?=
 =?utf-8?B?SmRyN2gxTktrUUpmaFNSdjlFSHpaSks2UHhaejZBOFpjWEJwbHBRakNpbEtr?=
 =?utf-8?B?c3FDRkEyOTZwRkNObElMVCtXU2lJVHFBVUUzT3hlRG1VejZVOXBPWHludlFy?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f10596-da62-4ed4-4f79-08de06885775
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 16:32:59.0816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+bQ2oow97WhmuF2I64bgmRzpat876ZF9Ljxji4cuvzVHr8ohLZdewLlzs9AliGa7ayltixirRHjq2oqSGkhfOUkPTdarYu5y5dm8d3ZtLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF31CEE2CEC
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



On 08-10-2025 16:40, Thomas Hellström wrote:
> If the location madvise() is set to
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, the drm_pagemap in the
> SVM gpu fault handler will be set to NULL. However there is nothing
> that explicitly migrates the data to system if it is already present
> in device memory.
> 
> In that case, set the device memory owner to NULL to ensure
> data gets properly migrated to system on page-fault.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7e2db71ff34e..fd906eb03d71 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1034,6 +1034,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	if (err)
>   		return err;
>   
> +	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> +	if (!dpagemap && !ctx.devmem_only)
> +		ctx.device_private_page_owner = NULL;
>   	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);


remove redundant dpagemap assignment before 
xe_svm_range_needs_migrate_to_vram check.

  >
>   	if (IS_ERR(range))

