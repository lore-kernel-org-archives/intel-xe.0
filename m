Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9386ECFB455
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 19:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84510E409;
	Mon,  7 Oct 2024 19:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7GRCLlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE87910E091
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 19:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728328466; x=1759864466;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=KDsqKysHvAVLCsk3BrYhR1q1L5BLZ0AnkkHv4SK2uSE=;
 b=f7GRCLlqSGpK1FeVUWsJz/jBz2qKBPPSgcrot2eS3UHObr6J9JlmafW1
 X3EgMUDgNp81KAjwSB2h+D7ad08fJh6GDG6r2vf99PKCs1GLoDqMF6xwL
 ZVhIjLeRFoJJHLOJTbYXBotnSbhBDpG8Kw58UzZtMqbiNrdnvp69/TYyG
 VDPvpgY4NPM+jvniDD6IZ0HEsgiWNnWliwJlB4kdCxYIjdElsqgYbwr/b
 BTq254U871V7wMGqns1FK53gIJ+/yxLvprD6l7FrE1q0CZsYLw13Jd0zQ
 WKF3AbeZOJ0Frj6gQl6vlkVJgDke/ney77tGsKAkaWr9aORoqcFavmY30 Q==;
X-CSE-ConnectionGUID: FPqioaaqTT+MAUNzSZWVug==
X-CSE-MsgGUID: 1xteQqMzTk+MKX5XsMDT2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="52896202"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="52896202"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 12:14:26 -0700
X-CSE-ConnectionGUID: 1E54/U/TSg6ZPutuhvASBw==
X-CSE-MsgGUID: s6q+ejUaSpeG+d1rzsS0qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="98901926"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 12:14:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 12:14:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 12:14:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 12:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfPPRcsYRT9D9oTOITwgU1Wgn4SRiw3gn6NctWTk3Mf5t5LTTB/DjxIE6RYP3fkZ8a8iKyjc6pywR2mpdIA7YSntcbi5uwyW9NP3USv7aiqrK/kKk47UlQcprxg1YtsKD8+GncFDrmop3788wywkjVVNiKinxqKfJYfsszPx+C2l4uUlgXq2YNowozb7YcOvWUGV/VqOlFM5a0TuV3d/ZOEAci1lm9Rwo3sEOnL4znr0kGCcvHo2GpyPwgVo10ggcqF2tMaJm9SrmyMwMa456Gd/0DwFHx6ow4aKuXfdJsGSeo6saIvsb6rbAONbRc4ljxTVoSnGCUuBx1brCTyyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Txkv0YdRd23HhF2KBwEIVEWLae1t0dROF1+E4bSAjBc=;
 b=ExtYxzFtJ6xoqsjDnjJ3fEML877glDDcQug25a4k4SjuppfrgHNx+kK3v0eZhCHQ20WST8QSA3+BXOtVSywwNGUgS0XJHnSi3p1PmTfi5H5Gz+NbnqZ62aBha8hmFf0ucuLIzI5RhT2c7PS7xoBwEYIeKJda3lPRywJamWomrQdaHuvrYO8b+ygWufU57lXlkEtbD/5bglhgyxJ5hfetmh7STtxmyP4mj1uXhZUOBypcgQIO2+oJ1AdgA1FYV4B5NLJfJp83pcqsAnjMtIsy8cB9BhB1lMwhPC22P2EBo3HOyWkLJkKtbeODgh5YC+7UCLSx8jBmGd8MpJx4OdWeiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7819.namprd11.prod.outlook.com (2603:10b6:610:125::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 19:14:16 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 19:14:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241007154143.2021124-2-matthew.d.roper@intel.com>
References: <20241007154143.2021124-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/ptl: L3bank mask is not available on the media
 GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Shekhar Chauhan <shekhar.chauhan@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 7 Oct 2024 16:14:10 -0300
Message-ID: <172832845077.51486.13337173554400751419@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40)
 To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: a41aa06f-2a07-42b9-03f9-08dce7043c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjBESFAyeFNKY2JKUWkyWGI5OVFvWS8yNlhsQVBDVnVOaWZwR1FHQ3N1VFFU?=
 =?utf-8?B?YzZtZkpyc29PNGQ4UE9ZZmpqSjFuRjNud2lmakVNVUphQjNaWXhtdlhIZkV1?=
 =?utf-8?B?L2EyMXFoMmNFTVh1clBKeUs2ZFNzLzhaTmowRSs0Tnh5MVZzSmdHMkFjcXBx?=
 =?utf-8?B?QWFJekwwN1ZiRmZFbVRNSk9IaHFBemsxc1hVbFlqczcwSDUyOTdFUXJhek1J?=
 =?utf-8?B?ZkZWVXpGSW0wY05sZEFneFk4RE5tM2srNmFNdWJMWDdmVE5wSTNxTDBTZ2RM?=
 =?utf-8?B?U2I1dEZqWmFKOCt4Q3VWdWV0NU54QWdJYXVlNGtLblhOZEMrVGtTdVA5SEND?=
 =?utf-8?B?aFNLK3M3VXh4eUw3YkZqWTZEWGFBNUovOCtYaFFyNDdPUTE2b01Zdms4Q2xP?=
 =?utf-8?B?VC96bDd4TnZCSmhDUW4vNmdHeWNBUmlNak55QWZJT0ZMRlN1dnBOMzN0blFI?=
 =?utf-8?B?ZllZTDJZMW9Zdjk1MXpleTJma3lLd3NqMVVCR3AvNUJvQm9PZU9NOWljdzRH?=
 =?utf-8?B?OHJJUlk2Mmw1K2FIb29JZHRkM3lIUzhGOTV6TU5SUUFyeWp5U3FBL2QxYzZZ?=
 =?utf-8?B?MEpCUnJYVHVreGl1RTdxZS91Q1hncG9nbnQ1NzZ4MDZCdWFMUDhIRjlHaHlN?=
 =?utf-8?B?b1ZIVzBJWHhUdnVSU0srdVFPUy95RjVIY3ZKM3NrRk1OUkpsMVc0ZC95VlFv?=
 =?utf-8?B?ZGhzdEY4ZFQ4WHdkbmRYSEp6S3pvQmNrUy9ndWxnZHFVRzBBMVF4dkJRQTVK?=
 =?utf-8?B?OURFL3ZQTHQyWHNFV0FMODNJeHRQUUFvSmtzdTRVeUh3aHV5blN6cmE4ekZq?=
 =?utf-8?B?WEpEbkswNXpiKzY0bG9JN0IvRUQwLzg0ZC8zTlVPKzlaODNOYjY1N2hic05P?=
 =?utf-8?B?MjdGNm44am44MW1rUkFiemg0ZHR5MW9DYjY2K3dYUXNDc0E2bTdScnlnVEUy?=
 =?utf-8?B?d3d2Qi9OYzI1S0dRNWlnc1VoMnFtKzUwbmVhaHJJRm9GUm1sVlg4SzdpRC9u?=
 =?utf-8?B?c1pubDhYOEVtN1RTR2ozVmI5dW5xanlyYTZ3SkRmYzhtc1RCOHVQZ0ZGa21L?=
 =?utf-8?B?dVVUSDV0OGs4eVI3RG9lbTBaUFNpbWtCOE5Fa2VOYjNqdGs3Y2Y5VGdWRHRY?=
 =?utf-8?B?MjdabU94VmV5K2ZEMUpUK0t6QXZNK2hNS2EwNE13OG1tOVU2U1N4aU5qbS9L?=
 =?utf-8?B?dFBYYU11N21BWXVIU240YW0rWDdpeXVJWmJGR1NuWng0VVFvOFliWktQRGZG?=
 =?utf-8?B?YWtvVlh4YVhuSTlKeWg1cXZ6dXZWQjBiSVhya3JzTWlxeHNBajJ6bk5oN2xQ?=
 =?utf-8?B?SEFrVTIxaDRwVkN5a0FSdzBWTGhZano1am5BZ0pVbGdZQzBnVnZoZjhQZHB4?=
 =?utf-8?B?WldRbDlqdXM2OEdZRjZKNjNaelJod2o4UkVSNC9ha2lvcUoydTdETVppREZz?=
 =?utf-8?B?RXp4d3FhWGY0L0hGNEp2ZHRJeTlDTjBNRGlDeTljWGhEd0tGekNYNE5RQ3B0?=
 =?utf-8?B?RkVJTXdhL2dBTXJ4NjNHaGdwTjNLWEUveWptV09ma1JmVXgrQnlsUTU1Zzlm?=
 =?utf-8?B?SWRaRUROQnlsTzNScVJXdmtsRHM0NkVYVEpNVzlPRUo3NEFIMlJNQkppMmpD?=
 =?utf-8?B?RHY2b0VjMWVtQW1wYWFINWI2RW1KUm8wTWdxbVd0UEJXQkQ5dXpJR0xUUWYr?=
 =?utf-8?B?ZUwzSDhGNkRRbVdJaXVyUTE3OXBhckhJQkRYRk1jTDZGK0tjd244YkpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTVJbGNkZiswMzBKaFowaXFpS3RsMUZRQzROWXExUmRwd1VwM3Z3d1dib3pM?=
 =?utf-8?B?UVZ5UkhzVmM5SWtnNGdwcTQ5TVlZYk0zWmNvUldvQWRLdjdkaG1QbDI1QlFp?=
 =?utf-8?B?NU5JVUVJQ2VicUtGYkVkMkdZaEdKcUF5ZUNFQ29lVUZmbWpwUkdSemZZUGxD?=
 =?utf-8?B?K2o2RmVSWFQyeXZHd2hpcDNSdWRFRld2elpMSXBmcWU2a1d2V1c3SVNJZEdm?=
 =?utf-8?B?Vld3akFVNi8wTHg0V2Iya01BdWtRLzF5cVhBQWsrUExtcERXMGVncTBiUzNa?=
 =?utf-8?B?alNZeUlhcmhHMXNxVlFJOVgzSjlnTjduaUhtTThFQ0RKN2FETHJ2RFpmV2Zm?=
 =?utf-8?B?clJQbVkxNXhqMzRIVU1Xc2ZPSnJDbndCVi9ZUTZaeTdLM084ZWZ5NDRBZk1F?=
 =?utf-8?B?Z29WdFBleUQxUS8yTFN0QWJiKzlqaHVoWWhwQjBJNGU5Q1Nnek85ZGFMNU1X?=
 =?utf-8?B?ZFVKUVUvZWJDUEFObjNIM3VZZlBHK0szT25LSTVHd2F6ZlBJRGZ6RmJqQmpl?=
 =?utf-8?B?VStDY3hIYnh2WjI1NGxOeTB2UGpXdmxQK1NWNTAweitDVnFEK1hPYWh3VmVm?=
 =?utf-8?B?R0pzdFlKckRXRURleVRRQ1pBVFMwWjhHcVh1VHBoWS9WeGdweHluWmxOb0tv?=
 =?utf-8?B?UklCK1JpV09pTytGOFVUUEcwdDdlaXJwaC9zSTI1UHFQSmJJRVRIN3lPUU9q?=
 =?utf-8?B?Qno5RlcxdTNvN0h3Q1l5eFVzaWptN0ptUUhFQ3hxcWhtOUtQdUF3TFUrQWpn?=
 =?utf-8?B?M3NnQWFlL2xEakhVK1F5a0xtT0p1Nk5aRFp5UFFPWVQ3RkhzZkovTm82NlpK?=
 =?utf-8?B?NTFNYXczWUFMWFRQMFJFUXF4Z0ZjK1lhVW9RNWZFd2VUY2N5Yng3VHh3eUNL?=
 =?utf-8?B?eURLSEh2ODI0NjM2eXpKd3B3anlXdENSSDdMQzNjZjhjRzkvSHptVGNNR09r?=
 =?utf-8?B?c2oyVHV1UmpLcVNqUjJhWmhiOXR5Yk9adGdHTnVycW5KelpVWmVTbFFMWi8z?=
 =?utf-8?B?OWVHVGtmVkZNTTJ1eXBwaUlWNitsMjNSVEVub3lBWVFMaVo3d3ZnNmtyM0xv?=
 =?utf-8?B?WEt5YmVKaG80ODhWUGl3RXdGdi8xbU9ZVVFGcHFMcmhRaFJSQlVxMng3VXZq?=
 =?utf-8?B?WlZaZmV6ci9hUW9ueTdLZzVEcE95WXZKKzA1Mkdsc1F0Q2M2YjUvdDZodVN2?=
 =?utf-8?B?ZmF6N3FhRWcvLzVScUxrWWF1M3Frem1tUkJ1MUJuSVlwRWRjaFZNRTljRGlh?=
 =?utf-8?B?cTJiTEJyYU56U01CcUVRU1hKbHFRakUzOVZianNCK1hlenAwTlpQKzAraVNk?=
 =?utf-8?B?YW9ZTnF0TytJMGo5b3d1aEMra1NjSllQaGdBNDA4UG5ZdVpCdWZVNCs5aDZm?=
 =?utf-8?B?M3Q3SjM2amRNV1VBQmZueHhyOUFBRy9pbjRZM2J0ZWtGRzVVb1JYU0JkSDFl?=
 =?utf-8?B?R3NSUDAzeGM3OS82ZDQ0Q2k5YklTOUtPVDZTaDNmbG82S2h3MlpUbDg0bHgw?=
 =?utf-8?B?M3VjS085VDkvQklkZUxla3d4cS9ldHlmWFhpdmd2ZFNwbXUyaGNDTmNPU1V6?=
 =?utf-8?B?MnVTWjg4QjRNY0N1VSsrc0tkMmF5YUZSL2ZEVUJ2NzhPTzVaWHlKRzdrZ2Nn?=
 =?utf-8?B?RnlnWmNrclV4K3dyR1ViRXY2V0w4ZG9aNWEwZHBSSFFBa0tZQXg5ZFBjT3dP?=
 =?utf-8?B?Q1lpV1ZVbG9IbU92M2JCQTIzdmZwSVRpVFFlbTdnSVdSd2U4MjgrTUhRejRL?=
 =?utf-8?B?bDVvQzl6b28rZXQrbXVocTQwaWdLN2xlcHFXL1owRXFtN0lCbTFrN3FPUXgx?=
 =?utf-8?B?aWJzUTVjRTQ3MTUvWFdscC90ZEc4a08weVJSZzFQY1owRVhqZTRudnU1Q2Mr?=
 =?utf-8?B?b0FNWElwMTI4WVFTaVRFY2pOYmNpNzM5aGluOVQzdTdWeEl2cEdyQ2VJQVFJ?=
 =?utf-8?B?cnlMQmovWERhUExmS2hHUTJqSWZhazhlMkxwTGEvbHo5Tzc1SGZpclc1a2RW?=
 =?utf-8?B?YXlZY25HT3greklhVDV2R0JJbCtFcmFvallyUlU4RFgzZWVwYlJIYlUwTWs0?=
 =?utf-8?B?ZWJJYU16TGhKR2lCczYrTEpsakxzOVlNMXl6RDJUMGgyQ205akhGME4vdGNV?=
 =?utf-8?B?b0Q1UW85UEF4THg4bUluZkdyTm9UbUszQ3FIOW02cjFVdWhOKzV3K0tUK0M3?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a41aa06f-2a07-42b9-03f9-08dce7043c81
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 19:14:16.4436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c8WJY9lHZm61VdEJa6cJYBlqpt8Lla+KKSyhB5oLujvdW/sXK1LB/emOV9eVppr77PTkjGNoSryXUl2ZSmSMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7819
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

Quoting Matt Roper (2024-10-07 12:41:44-03:00)
>From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
>On PTL platforms with media version 30.00, the fuse registers for
>reporting L3 bank availability to the GT just read out as ~0 and do not
>provide proper values.  Xe does not use the L3 bank mask for anything
>internally; it only passes the mask through to userspace via the GT
>topology query.
>
>Since we don't have any way to get the real L3 bank mask, we don't want
>to pass garbage to userspace.  Passing a zeroed mask or a copy of the
>primary GT's L3 bank mask would also be inaccurate and likely to cause
>confusion for userspace.  The best approach is to simply not include L3
>in the list of masks returned by the topology query in cases where we
>aren't able to provide a meaningful value.  This won't change the
>behavior for any existing platforms (where we can always obtain L3 masks
>successfully for all GTs), it will only prevent us from mis-reporting
>bad information on upcoming platform(s).
>
>There's a good chance this will become a formal workaround in the
>future, but for now we don't have a lineage number so "no_media_l3" is
>used in place of a lineage as the OOB workaround descriptor.
>
>v2:
> - Re-calculate query size to properly match data returned. (Gustavo)
> - Update kerneldoc to clarify that the L3bank mask may not be included
>   in the query results if the hardware doesn't make it available.
>   (Gustavo)
>
>Cc: Matt Atwood <matthew.s.atwood@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Maybe in the future we could update the code so that data filling and
size calculation take the same paths instead of being two separate
functions.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gt_topology.c | 14 ++++++++++
> drivers/gpu/drm/xe/xe_query.c       | 42 +++++++++++++++++++++--------
> drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 +
> include/uapi/drm/xe_drm.h           |  4 ++-
> 4 files changed, 49 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_g=
t_topology.c
>index 651ba53623e5..df2042db7ee6 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -5,6 +5,7 @@
>=20
> #include "xe_gt_topology.h"
>=20
>+#include <generated/xe_wa_oob.h>
> #include <linux/bitmap.h>
> #include <linux/compiler.h>
>=20
>@@ -12,6 +13,7 @@
> #include "xe_assert.h"
> #include "xe_gt.h"
> #include "xe_mmio.h"
>+#include "xe_wa.h"
>=20
> static void
> load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>@@ -129,6 +131,18 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t=
 l3_bank_mask)
>         struct xe_device *xe =3D gt_to_xe(gt);
>         u32 fuse3 =3D xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
>=20
>+        /*
>+         * PTL platforms with media version 30.00 do not provide proper v=
alues
>+         * for the media GT's L3 bank registers.  Skip the readout since =
we
>+         * don't have any way to obtain real values.
>+         *
>+         * This may get re-described as an official workaround in the fut=
ure,
>+         * but there's no tracking number assigned yet so we use a custom
>+         * OOB workaround descriptor.
>+         */
>+        if (XE_WA(gt, no_media_l3))
>+                return;
>+
>         if (GRAPHICS_VER(xe) >=3D 20) {
>                 xe_l3_bank_mask_t per_node =3D {};
>                 u32 meml3_en =3D REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse=
3);
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 5246a4a2740e..158629971eab 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -9,6 +9,7 @@
> #include <linux/sched/clock.h>
>=20
> #include <drm/ttm/ttm_placement.h>
>+#include <generated/xe_wa_oob.h>
> #include <uapi/drm/xe_drm.h>
>=20
> #include "regs/xe_engine_regs.h"
>@@ -23,6 +24,7 @@
> #include "xe_macros.h"
> #include "xe_mmio.h"
> #include "xe_ttm_vram_mgr.h"
>+#include "xe_wa.h"
>=20
> static const u16 xe_to_user_engine_class[] =3D {
>         [XE_ENGINE_CLASS_RENDER] =3D DRM_XE_ENGINE_CLASS_RENDER,
>@@ -455,12 +457,23 @@ static int query_hwconfig(struct xe_device *xe,
>=20
> static size_t calc_topo_query_size(struct xe_device *xe)
> {
>-        return xe->info.gt_count *
>-                (4 * sizeof(struct drm_xe_query_topology_mask) +
>-                 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>-                 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
>-                 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
>-                 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
>+        struct xe_gt *gt;
>+        size_t query_size =3D 0;
>+        int id;
>+
>+        for_each_gt(gt, xe, id) {
>+                query_size +=3D 3 * sizeof(struct drm_xe_query_topology_m=
ask) +
>+                        sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) =
+
>+                        sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) =
+
>+                        sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_=
dss);
>+
>+                /* L3bank mask may not be available for some GTs */
>+                if (!XE_WA(gt, no_media_l3))
>+                        query_size +=3D sizeof(struct drm_xe_query_topolo=
gy_mask) +
>+                                sizeof_field(struct xe_gt, fuse_topo.l3_b=
ank_mask);
>+        }
>+
>+        return query_size;
> }
>=20
> static int copy_mask(void __user **ptr,
>@@ -513,11 +526,18 @@ static int query_gt_topology(struct xe_device *xe,
>                 if (err)
>                         return err;
>=20
>-                topo.type =3D DRM_XE_TOPO_L3_BANK;
>-                err =3D copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_ban=
k_mask,
>-                                sizeof(gt->fuse_topo.l3_bank_mask));
>-                if (err)
>-                        return err;
>+                /*
>+                 * If the kernel doesn't have a way to obtain a correct L=
3bank
>+                 * mask, then it's better to omit L3 from the query rathe=
r than
>+                 * reporting bogus or zeroed information to userspace.
>+                 */
>+                if (!XE_WA(gt, no_media_l3)) {
>+                        topo.type =3D DRM_XE_TOPO_L3_BANK;
>+                        err =3D copy_mask(&query_ptr, &topo, gt->fuse_top=
o.l3_bank_mask,
>+                                        sizeof(gt->fuse_topo.l3_bank_mask=
));
>+                        if (err)
>+                                return err;
>+                }
>=20
>                 topo.type =3D gt->fuse_topo.eu_type =3D=3D XE_GT_EU_TYPE_=
SIMD16 ?
>                         DRM_XE_TOPO_SIMD16_EU_PER_DSS :
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index 920ca5060146..0154fbe154e9 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -37,3 +37,4 @@
> 16023588340        GRAPHICS_VERSION(2001)
> 14019789679        GRAPHICS_VERSION(1255)
>                 GRAPHICS_VERSION_RANGE(1270, 2004)
>+no_media_l3        MEDIA_VERSION(3000)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b6fbe4988f2e..c4182e95a619 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -512,7 +512,9 @@ struct drm_xe_query_gt_list {
>  *    containing the following in mask:
>  *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
>  *    means 32 DSS are available for compute.
>- *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
>+ *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks.  This=
 type
>+ *    may be omitted if the driver is unable to query the mask from the
>+ *    hardware.
>  *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
>  *    available per Dual Sub Slices (DSS). For example a query response
>  *    containing the following in mask:
>--=20
>2.46.2
>
