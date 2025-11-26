Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4F0D10F4D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 13:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6AD10E137;
	Wed, 26 Nov 2025 13:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORcVRc7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473FC10E137
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764163042; x=1795699042;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JcgzXLBS/A5o2h1/sNwY9tvzm/DQKUky9lHTAebd/Eg=;
 b=ORcVRc7yUfkbLNB4TqmgX9AtAzXScUzWki2j9dzQWVD8ASWv90nVOhGU
 8GeObtRopSDRM5W3K69jQOHIuGNcB4Qufuvzb5FwRFXnjc6wHRAXWDZnn
 SXzP14u+0PtWpb3iVWcxQ1raFTE/5ZHFClJBAQIHW925cO8HdBC+fnZgc
 /V92Aen1qCFls3BAN3FJEA8QbFId001RFXKEf46fYdqezaRtYyLf3sdb3
 kXDXogQiBVlODn3vX6OVzx8w7jqiuEH6Vm0Jw+4SuIlpcXZUrWdvWTHmZ
 PttigRZ2FFlULcpKB/xZ5/o2TEt6OGFd9yV5QqxhLKpudP9mUu7Y0w2lM Q==;
X-CSE-ConnectionGUID: BwKua/9aTTeW7F0T10bNjg==
X-CSE-MsgGUID: pC3ri1jLSCS57AiF0S2r3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77564461"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77564461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 05:17:22 -0800
X-CSE-ConnectionGUID: Oe5iL4fxQ8+hgEnLJVpfQA==
X-CSE-MsgGUID: hx4oxrtPSUyDkTQbg+B4tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="223894315"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 05:17:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 05:17:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 05:17:21 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.33)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 05:17:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGEF+2n/sEOGdwxIYtoSeEuhgMQNXMxF0x0mid+hFstpEGeTzDlg50p82ZY+NMOwCdxOOYrjUslQCqmxQ+QgwHtPtV6sp0huKCNKMJg5Boi8ytca6RYws2ZJQ+xxW+eRMBPR/qxV1rFK1K55Bhg+QjwzS4r6g2GC6tRgduzZ0DetAEdgKbf9NCwEigQm2t/cqgQ8HVWUfXpK3uZz/PtIS+/gQq4hTh58B6E+sfguUE3r7UAMf5lutBWiHlRi8Yoj4lTHq38I2H8VTUB2RuRTlsDzZl9gD+19BxcnkdxhN9IFJvrckmQLheIdByZdqkH1tbhzgu6+678TutmDvtEytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z5AiQkxPERp/4Zn7JzYWb8aTS3vgKvb/KMni+VUXWY=;
 b=xJUmDXzHZZgK05zJa4P1J+FqLp4+2X3yyH+IRdgYZFGbmlnpCjnCEcyaFN98vO1hUVBOqw3f9XfidHbyXbacNUWn5SqnSWpX9OcLn6UQV597M0TiA39UdkzABVaYZn9Cx5ROsVc5oSuC25BQ5wh3m3P+nhhKpsH5PdQptkgsmMxiSB1rBY70phanfgsf0pl8K/NGWqcoUruyjInYmgQEiiaRqrZwjTQTif8j9Uv9AmjCIjZN3/U9NmkHsJZWR7qxW7+eAloZ9MIPs6919phxGWmhzb4x6hyam9gda+qn29O/kNvW260sKgoTuSJUC5g2EG5P5BowaOE/x0ceK753uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 13:17:17 +0000
Received: from MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::a972:1395:dd49:1dc5]) by MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::a972:1395:dd49:1dc5%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 13:17:17 +0000
Message-ID: <ba14e4d0-d38b-45f2-a964-f2364c91e66b@intel.com>
Date: Wed, 26 Nov 2025 18:47:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixeup! drm/xe/xe_pagefault: Fix potential uninitialized
 fence usage in xe_pagefault_handle_vma
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251125102428.2325859-2-naresh.kumar.g@intel.com>
 <63892dac-93da-49fb-a265-d8a1753f184b@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <63892dac-93da-49fb-a265-d8a1753f184b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To MW4PR11MB7164.namprd11.prod.outlook.com
 (2603:10b6:303:212::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7164:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a335539-75a4-44b3-7556-08de2cee1f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2hIRFo1clBPUzVianRGUGh6aVVycStXdFVLSHM4MURTMzI1YkI5MzQ2Ly9r?=
 =?utf-8?B?WjJaQTNnVDU3SUw2STZKeHQvbldzbTF6Y29RVFpiTHpWaDJkWUtXeTVpcTVU?=
 =?utf-8?B?U3RsRFVRck9wT3FvMTJNRTQ5alJPZGcvSkZwcTNXb3BwSEh3cWF0bFlXcm1J?=
 =?utf-8?B?Y1lCZU12R1dEREZhcnQ4ZkoxanZwV0pzUHoyUWJXSjZnbS9ZSzdEVW5Udlov?=
 =?utf-8?B?MEd6TFpEY1VrRWdYREZKOEFCcmwxUGJ0Uml3TTlreWs3ZkJELzZudWRPVDh5?=
 =?utf-8?B?UUlVOG5nT1lIM3B6WGlibStPT29KbjFOOGc4UTh2Z283T1VMQ1F1QTJiMVYx?=
 =?utf-8?B?aXdRYkhqTUZndVhFbzdSNUJvVWRya3E2dk1FUklDYmRQYWUrMEZhVHNPQ3dD?=
 =?utf-8?B?RU5IRlFZazVoTzYrcEd0em1wei9QTXVMUFdHZ3JRN2ZldENVQ254bHhxc0pD?=
 =?utf-8?B?YnlDVXlhUzVzYXVNTjF3bVVuZVptMmRLTUs3Y1BSNFJnUXFpa1pFYmtuNGN5?=
 =?utf-8?B?WVlwTnhOaGVnTi9UZU9qckt4M2gzU0dUai9xU3B4VHAyUm5jZ3MrUnI3Q1ov?=
 =?utf-8?B?cm1nOUUrd2R1SVVnMEdrdmhxem1jdkpISHg1eExENllKR0RvUzkxN1d1QWNX?=
 =?utf-8?B?dkphbmVzTUZUM1NQNWN5cWxxSE5qSk1XRmwyaUN1alVPSys5a2NrZXR0Wmd3?=
 =?utf-8?B?YjluVkRtdDR3WmVGYU94NEE4T3ZnR1FwUzUyQ0Y4RjBXUEl1dTdsaDZCa0t0?=
 =?utf-8?B?S04zUFpPYjBONG5ZM25LMkJkNENqbWZveFNUM294Wm5VNXM0N0YyUGkrMzRm?=
 =?utf-8?B?ZmljV1lOQU4xd1FWNW5tUUpTd1pKMmt2b1NTeUVTZU8rYlYybjg0c0VsejVU?=
 =?utf-8?B?Mmk1WHMyZ2FZaCtVUHZrQTNoczNsV1JXMjZ1dngySTcxd1RJYm5FOHp3WnRY?=
 =?utf-8?B?TWVhYVZxUVdEeVY1eklRRXVLejhhZ0lVWkJITjZEVUhaK0w1UXpHMzNsZGgw?=
 =?utf-8?B?S25qTUpvbU0xSzZuUWJKQWN3cUZXaVNQZ2hkaS9KOXlUSnpOT3hGWS8wRTZJ?=
 =?utf-8?B?cUZJU2RnVlhGY1lDbW5QTDM3VER2bFVSeFUvTngyV2cwTTZpUi81ZVdHa1BG?=
 =?utf-8?B?RElqWUZiT3cwRk5BMTFOWXViMTdDOVRNalhiRlNMczl2YWZOaS9TdVRIYzJm?=
 =?utf-8?B?NUhGdVFNLzU2Umhjc0RtRDVwQXFESlRMZUtzVUJCQWFQU05DeUF0Q1FrZThS?=
 =?utf-8?B?NGdLenJBVUFPMW53bzkyWStJeEQ4MTFJdTBEc3dCR0MzUkNoRnhtYWs3SUpF?=
 =?utf-8?B?dmYvTHdRZE9NM1RmallscG9DdjBYdkU1dCtqUFpGaUVjNUR4bXNIclR6UENI?=
 =?utf-8?B?bms3KzZKOUtEMkdGOWtJbE1EWHJ6aEsvZEUzMnVGcUZzc1VkRjlXRk53cnFU?=
 =?utf-8?B?bmhEakNvZnNicnU3UGFNV3FQOXhkVWwvNnBBWTU2aHVPYnVuYnpTWS9qai93?=
 =?utf-8?B?Z09lSkU1T1pkbUFTZkhhdW9ISDZqL3VteFFVMG5ieDBMYllIVjJDTGFuZjNm?=
 =?utf-8?B?R2JLL2JpcmdiMUV1NHNJcW9zQXJ3eklRdHZVVG9WSzQvblp3WjNKcC9yUlJC?=
 =?utf-8?B?dXpKeVQrSEUzZ3BwM3FTWWxlNHZSaHplOFBSaHdEMFdBc0pqek5WOENNNWNa?=
 =?utf-8?B?dHRybmlNT04xeHkyTDV3V2RSZzZUdHAwUTYvV1VWaVFmUE91ajZrWEUrdVlk?=
 =?utf-8?B?bWtsek5NU1hHemhFcnJaVUFiUmFBUlA0NXllcVZoVW51dWVRSDcxMDVQR0Nr?=
 =?utf-8?B?dTdmS1JRSVl6eGVGTklheTBTVWN6eDVOYTNtajVWN0hSZTJRcHVvcmlUTVNp?=
 =?utf-8?B?TnAzdElvWjJ6bm9QNVh0VjFOTkV2ZFZQdHlkeHUyRVkzKzVLSGxpcm5aKzlo?=
 =?utf-8?Q?5K0myX1ZoctG94oPtRwaMtlGkBD3LB9V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7164.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anBVeTR2cUMwbHF4NUEwbGQ2bUk3ckdHSVpZTGs4NzdYbE1tdlVrQmZRbE1J?=
 =?utf-8?B?YnpjcWMrdXV4ZHFaOHdkdWdabnFtU3lCT0c0blhYMzVjUThuKzdaNHBwaUZx?=
 =?utf-8?B?OWwrc1JOL09IZ242bTFSazZYM2UyZHUvNXBRVENwNDVhVm9JRXVTQ3hMV1RR?=
 =?utf-8?B?NUI5REFBam5kUjNoTDNvSnpGM0prazJRWVBUWGlXLzFvVnZjTmQrT2o1dkFx?=
 =?utf-8?B?U1hreVk3OUV3aDhYN0I3eVJucEM2Z3BLM0MvdGdMdDdVWHlyQ0NVc2RJMnBk?=
 =?utf-8?B?WldSK3dFeC9RQXBKU0RzcWVZanFUVlh4ampRWWhhbVpqcGFIOWoxRFQxcWJz?=
 =?utf-8?B?V08rMTE5R1U2US95U09abmdhSTNHNTRXSlNsZ1o5Um5FdldvZWQ5Ky9BaEVu?=
 =?utf-8?B?cUt2SFFUVkJRZnFoRFl2U2kxUkhLMkppZjRiOXUyUkU1WXFGU3Vsai9sZ2Iw?=
 =?utf-8?B?eUsvT005UWgzSWMyVUgwdkU0QXc0dUNybndVRnowblczSzhjTWt4RVVoQ3pj?=
 =?utf-8?B?U01CckN5TmJKZXk5Z0Q5VkVQdStYS241Z3B3YWljR0V0RUNzSXM2UmpuT3Fj?=
 =?utf-8?B?YWN1RCtTNjVBSytKUlkwdkxFOW9sbXNBYmhwbWhXSWkramsrYUoyOXFvTkNz?=
 =?utf-8?B?dEpYS0VDNTBtM0V2QTFlYnV4d1c5dW52eWxEUm9NaFltMk1pUDhTN3hDWWR3?=
 =?utf-8?B?cndGYVcyaXRhSGg5OXNDdDEvLzlyL2xTd3c2YjVXZVAzNXk3Y0VWbXZIT2ky?=
 =?utf-8?B?aVJaais4ZXJiakU0ZUxQSzEvcnAzQXRoT1E2Mk85azdBNU1nU2xPeU90VkdK?=
 =?utf-8?B?U1ZhTEgvNXByeFg1eUh3M2dhTDEyY3RpV3BuWVNKQUh0V2dwTWhkQWo5a2hK?=
 =?utf-8?B?ODdMdzZOc1hTOTNhK1pPMFJhVHo4amFoN1pFZ3dTT0ZyQThTbVY0c2pnQmtP?=
 =?utf-8?B?bVFvNndPWUlJdFYyVDdUSHN3eWxkMnhYaEJkMmJJcC8rbnFZU1N5RXNWMU51?=
 =?utf-8?B?QlE2dEF4UzhKV1BkbEZxY1hqanFoVVcyL05oaUljYkw2MGF4VzZLRlQ2Vllh?=
 =?utf-8?B?TG00SDdDa1FHbm5WN3RMc3ZjclJ0R3VJb0RBUnpsdlhGNitydjh2cW1rdjZU?=
 =?utf-8?B?RmsvTE5SQUxYL0s4UkJMSUh1RWpqc1h0T0VRTVNvSHk3bnYzUnJZQ2M1NDZz?=
 =?utf-8?B?QVczWThoM29iVk9IRUZ5QlNtUGt1V3ZzM1lhN0Ezd1RZMlEwbmtLK2NUMEFK?=
 =?utf-8?B?d0g5WklQaEMwMUVPUEFpbkZVbGp0RzIzTk40dldybDZEUFV4SWpkSmZLRnk4?=
 =?utf-8?B?YkR3QSt3UVo2Vm5TdXFBcVh4RlJCWDAvRWpTbk1KcjFkTnNodDVNTDl0Z3VG?=
 =?utf-8?B?aktvUnBYaVEzVEFMb1M4cWRnbEFwNmdacCt1WGRLajZFbVZxK1dJWFoyNXdo?=
 =?utf-8?B?QmhJZHVvU0kvS0JteGdUMHAxNTJ2RUZIcXpXK0I5aTlBaEJ1aUhtcVdmOFRx?=
 =?utf-8?B?WHFRM2tDUDFjZlNOQStCR3RURXk5dVV2dG8yV3c2ZGExNjJlVUowbG1MZXRp?=
 =?utf-8?B?Mnl6N1lVTmljbUV0cjE4SURCNWpjbnBBaWE5UDE2TUp4RVQ2WVZSTyt2b0gx?=
 =?utf-8?B?THV5ZU4wUXdOSXgvN1BHWVFvVDNpNllHaUNhNUdmTVlEd2Y5QWdYUVlNcFFq?=
 =?utf-8?B?Ti9oWHhLOHVZd29XV0svK3ljZzRHdjFQcDlCdkdCK3c2NWxWZ0t2MER1dXFz?=
 =?utf-8?B?b00vZk43YktKT0pnVzJFWFMwU3hJcWlidC9Hdzl0OHdJcURDN2NTTnN5Vmhq?=
 =?utf-8?B?MENISWQ0d0xyeDEvcGR0clVhTHdHZ0pmczVSR3Nic0VVbWlQY0JJNkFuREJ6?=
 =?utf-8?B?S2xmQTlWMk5PNzhzRTg1WlBMMnRkSnl2LzdVeURmZU5LcTZad0wwTHdDN0tz?=
 =?utf-8?B?NC81WkRoaUw4SlE4ZTVQYzU2QThrUzJHa3BySlcwek0rbWgyV2FtaUtRdCt6?=
 =?utf-8?B?ZGs3dWM3OGlIVkhOeFBGZUZyeGlwYzE3WjI1QXZ1bnhTQTU0ZjFnWnlxRDho?=
 =?utf-8?B?cC8vT25mSHZBV29ycU8zRXk1ZWkyWTZCay8wWW9tWERGdElqVzJNenJxaTd0?=
 =?utf-8?B?bThVTFFSUGNORnlQOHA3MFFHVHhYL0I5QmxUdnhyQ2dxNjU0SWFGR2pVcFhp?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a335539-75a4-44b3-7556-08de2cee1f2f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7164.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:17:17.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwCYRiVje09mHaZF3o4crWHncq+FpNiDvmldrnqQFwOQW0lWXgqGhwVWX6vB6W54r6ezaruTw7QTUF1t9qXmtaSoEY4W/nqucLP/OQ3VsJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
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

Do Not Review, Ignore this patch.

On 26-11-2025 17:25, Yadav, Sanjay Kumar wrote:
> 
> On 25-11-2025 15:54, Nareshkumar Gollakoti wrote:
>> The variable "fence" should be initialized to NULL,
>> and any usage of fence should be guarded
>> by a check to ensure it is not NULL
>>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> 
> LGTM
> 
> nits: Add a dot at the end of the commit description.
> 
> Reviewed-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> 
>> ---
>>   drivers/gpu/drm/xe/xe_pagefault.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/ 
>> xe_pagefault.c
>> index afb06598b6e1..401f1835939b 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -70,7 +70,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, 
>> struct xe_vma *vma,
>>       struct xe_tile *tile = gt_to_tile(gt);
>>       struct xe_validation_ctx ctx;
>>       struct drm_exec exec;
>> -    struct dma_fence *fence;
>> +    struct dma_fence *fence = NULL;
>>       int err, needs_vram;
>>       lockdep_assert_held_write(&vm->lock);
>> @@ -122,8 +122,10 @@ static int xe_pagefault_handle_vma(struct xe_gt 
>> *gt, struct xe_vma *vma,
>>           }
>>       }
>> -    dma_fence_wait(fence, false);
>> -    dma_fence_put(fence);
>> +    if (fence) {
>> +        dma_fence_wait(fence, false);
>> +        dma_fence_put(fence);
>> +    }
>>   unlock_dma_resv:
>>       xe_validation_ctx_fini(&ctx);

