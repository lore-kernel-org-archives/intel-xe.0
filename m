Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08EECA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6095F10E03F;
	Mon, 22 Sep 2025 17:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qr+8Fl/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F234510E03F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758562990; x=1790098990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sOfiiptsyz7ZjvgAC6E3ofspDBTBDsma2XTYBW1jtWk=;
 b=Qr+8Fl/tLofbwQUl8lBvnpIsKthbMW4jf0GmnztTYChErox8pTpXAwNd
 2A9tmm8dTZKEem9aPM+Nfku57lXa16rkp73DdYYt43wALUKWvuoRVIRWE
 s8lxc/S2o2eYhOlIGviLuzRvFAd29WU8itl4yuNSy5De0d5lyQZHYVLEZ
 ZIoZI1GI1Cf3RdTnMwk4YBPwOyWTpcxAVBt9yG7nrI0g4CRddirIZG+ci
 WeRXFl5pC+KL1hYmB+R1D7VSKW1x/wh+VecyGgXXhkOeGa2RteIUKZHBe
 rQ4TnUV+/dF7VUoe+eA07DQVS3q4ruTKHaYJJN/1YRXOffGnjOLig8rak g==;
X-CSE-ConnectionGUID: s+gTJyRKTEqzAKrYIvdxcA==
X-CSE-MsgGUID: rhDeJIplQ7yblRLiyHihCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60886656"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60886656"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:43:10 -0700
X-CSE-ConnectionGUID: T+dXhlP5S7WxRAZouNwlOA==
X-CSE-MsgGUID: wtNUMTALQ761tvVRLL8G3A==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:43:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:43:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:43:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:43:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnJfbiO9Nq/KGVUWSQwiDl8tvkUIhrc7NgGpuZOiT6KKjPXx620PmmGm7HNv8g9kwFWStEMJy6Y/WBg6Isf9cW3K4Du2RxhL7kx2t3K7KCWlFFtW7VGOaXmqglqD1+1pck7+eqBhhx1dzhQfG24ukAeur+XF78GxbIhIyVCM4GJw68vjyuNqRzK/EcrcpjoQwXAjFYLugxOjnCJs+YoVIVmqazYuoHQuOwLrwXy5YCJxAANH2S48uLSBNopTQksuhECaEKiUg6SCRopl4asafpNcZ1uvfQcWalvMVV8uDn4Nhu+KFKH286W18msv0DZVL6eYLjVRI9p0pLX8sEl6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9qAD2zjKq3Wmp2hYSdJcyojC5j67gmfJV0FOtcq4Xs=;
 b=Vb6pbMjgaRC7m76JMxrQ1/MNjXm0nDqRQxu0VIT9JEO9r71ZjSgkC7L5SajAef+1yqYwFixhYUPLcoj2x0OhrN/W+VyiGMFY/essokNvxcG2pWZVh/Tzr4pmks3tJ7Yh3HIlAhz4w1SUYmc0B5I7c6awNwFTV0VCkWL2wcRj+D3PATJwzZG4EO+iWSnzI/mVCk8bd1FJpIlj4Iadx0rVLj4LICSyb33sQpXqv03vRUGImFj/3iDdGRMULVdCCeffUKtC+HTIlXbZW65Osw2A3e2e4wP/K37UXwLVkfH0CcFiIpc0nxRVwgK6HBTlxAD245QgkQf5bhSX6FawtMBYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7835.namprd11.prod.outlook.com (2603:10b6:8:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:43:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:43:02 +0000
Message-ID: <1566544f-4ea6-4fd3-9969-632fc6ac72aa@intel.com>
Date: Mon, 22 Sep 2025 19:42:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <tejas.upadhyay@intel.com>
References: <20250915143331.3269895-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250915143331.3269895-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0126.eurprd09.prod.outlook.com
 (2603:10a6:803:78::49) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d052f7-3db1-4752-f8a1-08ddf9ff7a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlhJVk1ham9jZ0RGd2VIVWE3dVBSMkVMSTdmNmQ0b2JhUjM1VCsydEZlL2Iw?=
 =?utf-8?B?ZTJYNXlzTi9tQjRZTldyUTlGTTkySE1UVmU3bitxVWdKekRsbUIwZC9BQ1FJ?=
 =?utf-8?B?SFFZWUhXdEVPNzBOY0U3aTkzODFpSWQvUWxZYnBuTWdOOGRqcDdLbmUxTVo5?=
 =?utf-8?B?dUdNT2FMeVppRGJWeWFnWnQ3MWZucjZFcUxGUy9nYkF2UlI3engyNk1IZkVx?=
 =?utf-8?B?YmhvNE5lYjh2M2VqNzAxNGhld0txYzhuN0tCb1VEZU04RjNFZUE3OElGRlQ3?=
 =?utf-8?B?R2dFQzcxbTR0U0ZmMlNKY0NqWTRhbDREZWpOK2o1Wkdjei9pTmhjTUFQTUxB?=
 =?utf-8?B?a2U3aTZESTFYWHF5UEpmdFVtUzkwb3ZNRlJpMW1iVlJiVGJpY3FXYTBHUnU4?=
 =?utf-8?B?WGdtczE3MUdmZnVhZjVTRXk2K1pwQkxYMXltaUN4VDB1TWpUdlRpaFJuVVM5?=
 =?utf-8?B?M3puMUR3cjNzZFVWc0N3dXkzUVRTTjg1MVRIU3o3blh6NHdTNmJrbitmYVhI?=
 =?utf-8?B?dmFRdVpDV0RIMnZURmtMQTdQYXM0UGN4UWZ0MS8rSzYrY1ZzRktUNmhidHV6?=
 =?utf-8?B?MnJ1UG9TOFFHbDM4WnVHUHJWZ3dRY3o0R0M4NHJCWWxpNHBRNzNkMmtOenVN?=
 =?utf-8?B?MUZOdXJJLy9EK3RDVzFXb2xyOE11c0xmQjBTSkh2cENuSjA5S2hnNmNQMGw0?=
 =?utf-8?B?SXdQVCtPVFpvdG5DNXgwOFlvMGJkMmF2MW5RMXlYbkJpNXMrK3BieEFMTjFU?=
 =?utf-8?B?eEJNMExDYzBKdVQzY01mdEwyRTd2dVl0eDRuaHdMTUdBYXFFdFFJYnY0MHFM?=
 =?utf-8?B?WkF0UjQ1U0VEb2xJbnJyMGdNUVpWZjR4c0cxdW0vS0MwcnRsSUxVRFFjUGJC?=
 =?utf-8?B?ekpxSXAvbXJnd0RndUJRTEx1dTJubnZ3K1VLdzV1SVpiOUV1ajNoUHVFb1Bs?=
 =?utf-8?B?V2ZxdFl4Z1FsM0xSdUMzZVgyUXdYZUE3WGVZZWpqTnIzK01KWmFnSzJBakJ6?=
 =?utf-8?B?OG5XZmRYTGdCQXZaTWpUL0RHcEZRS05pMWZNbHVyS2ZuMWhRVStYNU90Tkdp?=
 =?utf-8?B?S1ZIelN5Z3NkQ3ZpMWIrVE4ycFErTnYxQkdBc2pSOHpLOHgwYTV5RVluekN5?=
 =?utf-8?B?UFdRT1NiVWFwOEN2MlBHRzV4MlBjSDkrVHdrVjROaHBwY0d2T0JkbHByaDVp?=
 =?utf-8?B?T0VkbkVyaDdhMlQrT3FlZlB5UW95TCsvN2xWZlNDTmRiWWFiNWk2V0swallK?=
 =?utf-8?B?UklMdWJUVHN2MVFNWXhOZ1FzSVBzSkorN3NIYTNkZ3Z4WFhhenBGeGY2Y0tX?=
 =?utf-8?B?ZTc3ZERNRlpBV25SZHJKZVFyM05OckdCdVVqK1E1UlZNV2oxS1NZcnN6c3Y1?=
 =?utf-8?B?OWxOcFFQc0oxY0Y5eTBwcGZvSWQ2UE5lNlM2UlA0dy9iTnlIUU9XdzIvYjl3?=
 =?utf-8?B?VWNleUoxREV5QkZsa0UvRzZXYmV3T3JDYTlZbTdmZE1PWEJnOEw5d0RUbFpX?=
 =?utf-8?B?dGJJMFQxTVVSS1ZtQ2Z5dTgwalRWSXBqcnBVV1hlNnNCNG5HblFKU2tGNWdG?=
 =?utf-8?B?T2NPN0dlbE4vZGlPYnk4R1VaMHZjR0llWHZXN0R0TFQ1OElRQUlDV0Z0MWJm?=
 =?utf-8?B?VUcveDJHbStUcGdUUGpraWRIeGl6eUhMU1NydkdlZ2NaREJvUmJFZFpTSmd5?=
 =?utf-8?B?M0Uwam9jY3hJd1Y2Qm1DekorUThMek5JQzVsK3FlQzB0ZlVkb3Z0V1NYNUdj?=
 =?utf-8?B?Rmpra3JCc005ZFJHekVsZjBvNm5JS1BOZVh2T011S1lJTUZDdkZaUXlGSlAx?=
 =?utf-8?B?Z2h5bzJYdVB4NU90K0xyM0ttRDFpaW1BTEtOc3ZSaWV5TGgva00rRlJSaDBX?=
 =?utf-8?B?QVJqYVRKaDZvcmJ4NE1ET013dXEyNnprMzkyT3VCYTRVdmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck9pUHozVTZQSjFHVkUwSFhhZUxvVHBJejhKVjBIZVFmeVJxZ0VNRE5sV09h?=
 =?utf-8?B?QkZLYndxUnBtcTAzZTliUmpCMHc2TmMxQnhOWFhHWVBrUlBoOXh5ME0xK1Y4?=
 =?utf-8?B?aG11cUNrcFZCb2J2SisrclBnTUh3YlVmcW1kVVhHalBiZ29JRW9RNDk5UVBi?=
 =?utf-8?B?ejF4VlBSMUltYWRlSm5qdmZreUtsVkQ3Q3NSS1lCd3hLUU90ZlA0UjBCcnhY?=
 =?utf-8?B?VFVaYVVGcjZId3NpM1h5NWFWVHdFQituWTlIaCtmSjNrWGppZjBmYTNkbm1y?=
 =?utf-8?B?c1kzWW1TdkROWFQ3UzRhZGpGM0dRREtHZEovR00rUytGYm85VWV2U2xLZFd3?=
 =?utf-8?B?eGgzNjlYdWRrQ3ZTVVhmZXJSTlpScndmNGNLRXI1c2prZkdVU2VHL24vNHNx?=
 =?utf-8?B?eW45d0lnUFE5R0pMM2ZRM2IvQ0RVbE1HbkpIRDFKenhEOGdiZmlOTnFSaEd5?=
 =?utf-8?B?QUkxNGVia2FYSXJZVE50Yk9IU2N4T0xiRXRibW1wZmhxbTJVUzh1ZDdXQTc0?=
 =?utf-8?B?cW11eWZnaUJCRmdXUjZnRmgxMVFaWjJXcE9GTVhhekl2Uy9FQ3MvTGk3bklU?=
 =?utf-8?B?cjFTKzJCYlNYc1FXam5MYy90RGJiYXdTaSsweDhaUTFENTJDV1lHaDdsSi9U?=
 =?utf-8?B?aGxPWVlNYUEyZFhESzBISjE1eUQ2akNvQk5pRm1CcTl0WHIxcXVUOTRTUk5j?=
 =?utf-8?B?Sm9USHlTemtXSzR5dHEvWERTLzdVWXV3UDl2QXdGUVhKSDdqNkZxN0ROejRK?=
 =?utf-8?B?QUNsU3NBdTBxd3dDQ3VtRHFrdGVUYXM0aXFtUXFIMVVYUEZXODFqL01BMlB1?=
 =?utf-8?B?bzA3U0tiNmpxRDlXQTF5UkE3R0wyemdjU1oyc1BUS09oK3ZCRUUxUXRjM2N5?=
 =?utf-8?B?TlcreUxpYThmd3Npa0w3c2NIM0Z4d2syQXN1by9NY2NrUHJyQ3M1bXIwYThZ?=
 =?utf-8?B?TFN3eWNaZEFGdW45cnlwRTFwNldXRk1OeTczWHhTczNteGh6K1dETm9lLy9Y?=
 =?utf-8?B?YmU1U05ZUHhuazhqMFpSTllsalpwN25aQmZJaDB5d3VOTVhFa2FIWlZLNGli?=
 =?utf-8?B?eDF6a2x6OXlid1JBNjJzbThNclZNZW1NVzVCUFVQK3BiSU4vVkZtZW05a3Fw?=
 =?utf-8?B?cFBUQ0dMTWVScFBkUmhXeVZLWE9oT2ZZWFZSSUdhS2NLbHd5Z3I2ZktLZFlJ?=
 =?utf-8?B?U3NZZWcyVUFhYldEK0ttOUU2RDRUWVc5UHp0WE9sYnJndmFKU1M5bXNGOFFh?=
 =?utf-8?B?VEpOZGlmTHZIK1AzS05WSkIxbXNpODVFc3V0SnVNNXp6dXRrZTA5Z0VRZ2RZ?=
 =?utf-8?B?Y1RYWTlmSkw5Y1NmTm5CQi9WTUlHMWlHUnhra1ZXWXF5bjNEM2NndUU1eWxK?=
 =?utf-8?B?UHhUb3ZCMW1FNElyMEwrcnQ4cnhHdWtHOVFHVW5TdThJMDF5a1BFTDhkemF2?=
 =?utf-8?B?WnBraFBQbG1PT1laRDVrK3hmU1VOSGpjUmhQU3JCNmVXeUlaR3QreVJrMFV6?=
 =?utf-8?B?aHFpNEMrV1dCNm14MjJBMFFDNVVaTHF1aVRKQ0E1QVJNeGlvSXdTNjhrdXJw?=
 =?utf-8?B?NmhwWWNHaTIzcmJMdTAwbWpCMitoYjc3T1ZidzVMSDcvVGx2Y0dTT2RscTNp?=
 =?utf-8?B?Q1ZWbzVMQVozTVFUN1hCb25ycTdoZTVVbG4yY2loVUZOcmlaL0JmOHVZM1VD?=
 =?utf-8?B?dHlPT1JIK0czMGw4V2tIcmVsTmJPdG1BMTFxZHNkYWJCcjdGUEV5WlNYMHQ2?=
 =?utf-8?B?NnF3MDRoU0RhTUd4d21UVUxOK3lCMEt2MlQ3ZWRjRmZsMnRzaDkyTW5kR05C?=
 =?utf-8?B?NUZVTFdnY1Z6cGF1NTZNSTFDS09SUjMxZWhITWcvVnpOeWxlbnFOZmVEaEsv?=
 =?utf-8?B?VTJwVjNDUHdTNFQ0eW93OFAzYUdka1d4T3FoS291elZ4UTRySSs4VnQyNlg2?=
 =?utf-8?B?cGUrQnplNnBQTEtsd3paZXZCRWxpejV2QVZlak9TYk1hRVVKbmppdW9VTnZh?=
 =?utf-8?B?Y0k1WDhpUWdWMG5MQS8vOEFlN25OT1pKUjlOYVhtSHpBOVVaZjdpMWxNZFdH?=
 =?utf-8?B?SUNjcExzeTQwSWhmcHVtOVlDUzI3K0F6YXlBUitPMGtsWWM0S2M5OUxaTEha?=
 =?utf-8?B?ditzbE5oaTNZV3hEYUNKSEdpeWlpaStkSmY0RHJHZTlhbXhINnZPazV4WXIv?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d052f7-3db1-4752-f8a1-08ddf9ff7a41
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:43:02.1942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /r18UUl4FLzr1putNPu0ISYDulVfTojoB6y6JEpYuuiYt6DICRm1kBziCrVon9bfnwlHfPCSye6oqngSN1fhfxfVnHAF15pJyqTqPkrPuSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7835
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



On 9/15/2025 4:33 PM, Nareshkumar Gollakoti wrote:
> Multi CCS mode can only be enabled when SRIOV is in PF mode with
> no VFs provisioned.

maybe: "Due to SLA agreement between PF and VFs, multi CCS mode can't
be enabled when VFs are already enabled.

> Similarly, provisioning VFs is not allowed when Multi CCS mode is active.
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  7 ++++---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_pci_sriov.c   |  7 +++++++
>  drivers/gpu/drm/xe/xe_sriov.h       | 12 ++++++++++++
>  4 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..39df801e9cd5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -117,9 +117,10 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +	if (IS_SRIOV_VF_ENABLED(xe)) {
> +		xe_gt_dbg(gt, "Can't change compute mode when running as %s / %s\n",
> +			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
> +			  "One or more VFs enabled");

this should be treated separately, as there is different rationale:

- it can't be changed on PF with enabled VFs, as this would impact existing VFs
- it can't be changed by VFs, as they simply can't do that at all

>  		return -EOPNOTSUPP;
>  	}

what if right after this check here someone else enables VFs?

>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> index f8779852cf0d..1a80a293daa2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -20,5 +20,15 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>  	return hweight32(CCS_MASK(gt)) > 1;
>  }
>  

it's always good to add kerne-doc for public functions

> +static inline bool xe_is_primary_gt_multi_ccs_enabled(struct xe_device *xe)

it's quite bad to have "xe" level function in "gt" level file
maybe move to xe_device.h where other top level helpers are defined?

> +{
> +	/* multi CCS mode supported exclusively on GT0 */
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +
> +	return (gt->ccs_mode > 1);

no need to use ( )

> +}
> +
> +#define IS_PRIMARY_GT_MULTI_CCS_ENABLED(xe) xe_is_primary_gt_multi_ccs_enabled(xe)

do you really need macro ?

> +
>  #endif
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index af05db07162e..96e3fd51b8f5 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -19,6 +19,7 @@
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_printk.h"
> +#include "xe_gt_ccs_mode.h"
>  
>  static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
>  {
> @@ -153,6 +154,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  	xe_assert(xe, num_vfs > 0);
>  	xe_assert(xe, num_vfs <= total_vfs);
> +

move this extra condition below dbg message below [1]
> +	if (IS_PRIMARY_GT_MULTI_CCS_ENABLED(xe)) {

	if (xe_multi_ccs_mode_enabled(xe))

> +		xe_sriov_info(xe, "Can't change the number of VFs while multi-CCS mode is enabled.");

"Disable multi-CCS mode before enabling VF%s.\n"  
> +
> +		return -EOPNOTSUPP;

this error suggest some permanent condition, which is not true here
maybe -EBUSY or -EUSERS or -ECANCELED ?

> +	}
>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));

[1] this supposed to be first dbg message

>  
>  	err = xe_sriov_pf_wait_ready(xe);
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 6db45df55615..78019cee61fe 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -36,6 +36,16 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
>  	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
>  }
>  
> +static inline bool xe_device_is_vf_enabled(const struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	if (xe_device_is_sriov_vf(xe))
> +		return true;
> +
> +	return (pci_num_vf(pdev) > 0);
> +}

please don't mix PF and VF flows

use IS_SRIOV_VF(xe) separately

and if needed add (with kernel-doc)

static inline bool xe_sriov_pf_has_vfs_enabled(const struct xe_device *xe)

to xe_sriov_pf_helpers.h

> +
>  #ifdef CONFIG_PCI_IOV
>  #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
>  #else
> @@ -45,4 +55,6 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
>  
>  #define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))
>  
> +#define IS_SRIOV_VF_ENABLED(xe) xe_device_is_vf_enabled(xe)

please no

> +
>  #endif

