Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B45606A324
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JAtfhCSW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A3E10FFF7;
	Thu, 29 Oct 2026 07:49:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEAB10FFF8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793260141; x=1824796141;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d5xOUxqUF4t1jRDQhaUh/DFSaHMb+Ybgva4iZiPh8ns=;
 b=JAtfhCSWZ5c+yQm2EmbsP8UfSdB7mZ/GiwvHIib102lKLjy+Q3/jMsOs
 I1iJFXnOmx5Q5F0YYeQJ745hCCWQisoHfh1j02Pq4GKBhMoWVE2OqVGuS
 q6WeJEOkhM5sdbJ1r/fmlaw/kiABC6B3CAWneT7xLKgZiRldZennJgOnP
 N0E7x4+f5GN25SxpfHSOI2j1zsQsuzuPe5NCRgkb2A6BZyyfb64E6r+By
 DfcY5mVQaJAVQqslbGVB88/khtMfSyKIbv5QHBiFHJeyi8OtluhUb4vbh
 2e9f7Qted094H8CNTjk9hUtl+c31JVkSi1gAT2l0rfzvC6wGnpjMyThzu Q==;
X-CSE-ConnectionGUID: qgNKnv/7S3CCXmq8e9Uv3A==
X-CSE-MsgGUID: D/cfvr+5SZatJux9jLvGZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1899519"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1899519"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 00:49:00 -0700
X-CSE-ConnectionGUID: YSht2WsrQpSIFDfjxeguYQ==
X-CSE-MsgGUID: C+5LIdG2RDC/KhAbd89WIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6823425"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 00:49:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 00:48:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 00:48:59 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 00:48:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dudn1abAUsK/9+CYlGr9hIMwr3KN6RHDpWglKRMJiZqbefNcVKQLMGRNdGmOWFhetFdwvSuHJbT6e1+ddYl9Olr8tYy0OQvmiq/NEsZZmJ7uC8lMaO61oqaTKj7hbTicUBkJbhn8DsF9bRuzt14NbD1C2JaYT5gqul7I4rg+3QVHDqSpguzMtOAxU5bb9/gJbCz/Gou7pW8S/wTyPFGUYIwdFe7/a1jLh494NR6BshbBBUnqRhtSMw/Wdx/uYu9+59UYY1SrKeNOVpDUQP+xFbl6bxXu3w1KySK7emqVXJ48HjZCi0Pe0M9NAklJ8SaaYhPXW6F56YDgcPGzFEUl/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c73QCx8bNnhMSuAuBbLcOSQz6JF7TVRD463MJNaEAXU=;
 b=Tr9Jsvwa6uyzn4A+FO3PndEIMmOIszq+6MyOAJUJ/gtpKiOeRx2WXDAUz6a6RG3CV2m9mKZZKuuczy8wg/U8bN6vcqwSDgoJZQG8gXorntxtfBbu0Fy061lFPDnWBulBh52xXX4RAqF8wM7dg8+ubZDZCDt7YRdnCqO+1sHoT1O+ln1S1gWF4hJr3VKLqQmF7uFhLS40sTH3IZAIU/tNiK9wkunZnFxsiJu6jAGG1rfLoai9OwPyi3FEJMZA3McM6sZ7IA+KgQ1qWBMN0Gpaq5TPszL8xJMxxQmqnRdSluWEsaDIuu8BPHeEvTp5unBbGeedEG5JSq/6lzGHUPmdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 07:48:51 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Thu, 29 Oct 2026
 07:48:51 +0000
Message-ID: <7e5a812c-da0b-471a-9329-2638eea15c07@intel.com>
Date: Thu, 29 Oct 2026 13:18:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe: Toggle the D3Cold enable flag at runtime
 resume
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>
References: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
 <20261027174351.619929-6-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20261027174351.619929-6-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0281.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::15) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|DM4PR11MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: c34c1e8a-67ac-4b02-bd44-08df35911272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|261021121427099003|56012099006|4143699003|11063799006|261009223027099003|261022105027099003|261022075727099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AmDbrql2Mm4mNnvoFDaoa58v6PNvh5SYgGL5Mbs801KYxPMHNbBJeSDnRm5MIRWujeVQVBZ63Y/Di7GgynxpwvclaOlhrITQfDiBPP9tlCLYvEzyolS6xqIeKz9y7j/Zbnpt7vrHKsU5d5i0uvDvt0zeEnRlYoms78UbtrMBSKTvqJR3QBvUDdh1t0C27k3vUQ9jnuFL8VuDxxPsn3g9S1FfHEXafukgOQ7faQ1kuIVmSLvoPBvnwU1sJmQVOcNl2Kxrlh+ZeSi4qHdUf7v6xXviDXtI8qnbc3DyQOztc1AHSW7p1i+RssoRrrhkYFj2ewyyUCIfGfP52Af9EkE7Au6wYgcpVCTfsv2Qo/vAUwZAaYqjsxW56iS5OIFNW3mRTrNPvk7w96SCNyGrHgm/gkg121OkneKhVEHa4uvqdxDPCFQdcfUd3TdRaGI2MWxBdRD2raZQmFLlaaUg0v1k/Uxt5SRFbZjwow8fN8OOi1FeZ5oPJnE9UK/Tlt0Ow5oyzusVA7Zd8zJSFlUbsqzLd16oONdG54tGce/ExQ/UUZFKLQlnfdzmkqoZco8tX8LCLwhaYqcdwiVRdUhVaAnY7HhIqENi66+4pk9it29W7Fs9YrbheA6sKT0FSv1B2QcLXVZQ409iIOmVDC9JNsGYbxIm09qBEIlOM/9sUsTeJD0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(261021121427099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261022105027099003)(261022075727099003)(261026140227099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJ1bWEwOUo2VHVhMGc5OE5hNVYxOXptZFJCbmpEQ2RXcU9CbnlnMjF3VTht?=
 =?utf-8?B?VUt4VlVuNE1CMjFZWVYrYjcwK21RRlFUY0tic2Nqd1BzUW80eDdZV2laUGVM?=
 =?utf-8?B?UE5kdEF0UGFyUFhRdVBpcVhnbTdFSkdLaVhWYnBzMlRGSlIyc28zeUUydDFJ?=
 =?utf-8?B?bThnMHpUbWpuaThOZHlkaVRxN3orWVJjcUliZzZOZlAyOXo2NmYrTDJNY3F5?=
 =?utf-8?B?MGw5aHJBaXh3U1UxanoyWkJMbzduZjR1UUFhTDBxRlJkZ0tGMlpUVUoyeDh6?=
 =?utf-8?B?amxwZit2VjhUT1RUZFdWZFZpbzl0dU5lWFNuQzMyTDMzQlNjS0ZYbE4waVNm?=
 =?utf-8?B?YnNiSmdqRXU3eVFUeGNaQUxmTml1MWh2UWpuU0RkSWVnckRPZEVCR1JwdmI3?=
 =?utf-8?B?YWZNQWtqYXJ2SDhoalROYVVaWGFBaVFqVGlQTkRBZnpUNVgwTGlPYnF2Zk5i?=
 =?utf-8?B?WkFhQXBsRGFwVllxWUZhMmU4ZFUwWFdJbG5CUXhLZi9waTJzc0x0TC93Q0Qy?=
 =?utf-8?B?Z1VleUVvZlJLSEdseFdsN3ZHcHc3eElGVmg3eWI5Skhob1dVZFpNOW5Kbmlx?=
 =?utf-8?B?U0RidG5pNS9mRGRaeHpNVnB0RTMyT3laM1QwSTZOUU13NW5JZ0JqWVJzakJD?=
 =?utf-8?B?SkZPR0ZhNWhRQVNML1Z3MmFnRjFqN0VEWjJNblZYZ0dpcUV1UkdZblNYRjlM?=
 =?utf-8?B?bktnYzZyUGJEQTZVbkRwbEpIZUNLMEJMSk10WndqSnRPcW8yRXAwV0NJakJs?=
 =?utf-8?B?QkFraHBDOWVFVk41eWQ2TXFYOWZDYnFIZkRaVW5GWVV4WkRpRjUyT3JjWFo5?=
 =?utf-8?B?SVVsMzdPQ1I5SEVIK0JiR014dU0wanlFNFR1TWJHdHBjdzZTUWRZOGNsUGV4?=
 =?utf-8?B?cXlZVmQ4a1RXN29iS3JOOEtsMnR2Tjg2M3J6QTFGRGJMQ2ZSdjBjc2RVNlpL?=
 =?utf-8?B?MUpVaEhhMVd2MlROV2ZvbDdicGZLckc4V1FmeERWM3l6eHdFZzIwR3NERUtB?=
 =?utf-8?B?NEozMXBSaTJNd3BpNzRsa3ZmY2JrYWg1Q3JPdit1V0NuQzZBUXNkMGY2a3NK?=
 =?utf-8?B?MUlkL1F5Yyt6YlRXRVBUYlVZRnQ3WFpCaDE4NjQ5L1U1azZ4bzJJcjVCckMx?=
 =?utf-8?B?TDR3ZnRuU0ZPZWxUcFNESmJ0U3ZiNmREMmk2N0NXSEt0WUxQdjAvV1FTZ21Y?=
 =?utf-8?B?b3NDN0lnM2hXWUErYlRqREVzNXB2QmgyQ01iTUdnOHJTamdKTjhjYzd2QmRO?=
 =?utf-8?B?OVl5SDZTU2dhRGUyd3hFMVFxUGJjeVh0R3Q2SmxqNWFSQzJ2TzJXUm1PQlg4?=
 =?utf-8?B?NUtBN2NjQVBFOElhNitieDN6TG5RSEJ6SUdtcGtsSHp6TC9LYTJzRVZMdEx0?=
 =?utf-8?B?SWFCQ3R6ZGpsNTVhdFN3TUxtbFp2dkp3TUUxV0tqalBZV0tpSmFpUUlDbVdV?=
 =?utf-8?B?bDF6L0ZVMC9xTlRBQVFxZzlVMHkrOElScW12dkZ5UWZFSUhuWUE2QWpDbEwz?=
 =?utf-8?B?VFFzZXZIQ21yQmRzL1M1b2JMM1lGRWtHMTA0eHFFeWF4VnQ2RjFaNk9xcVpP?=
 =?utf-8?B?ZXpmKzRmb0pDdnFvanpRc2IyanZ1cmtDYTBCeEk1Qzh6czYrTXBsUHdGcFdE?=
 =?utf-8?B?ZzQvOEoxZXFoOFJGNnJHYnZ5YWFEQnJ3L25MYXpxano4NlRrNkJ2WUNXWTlr?=
 =?utf-8?B?d2pUdXBhUDNQVjVOSU5DNTRBbWI0NWlHcDRzUnh0eW9QVnV2L3pyYWY0RmdE?=
 =?utf-8?B?ZjFtMllJZktseWpLczJrTm0rcmlLTmIyYjcwaENsS2NTbkd1MDVZUW5QOXFM?=
 =?utf-8?B?YXNsbFpQWW9vdTJHV2NUdTdJSFdVOTVZOUlDK2cxdGpVNTRrNzU3UzRRL2RD?=
 =?utf-8?B?N3dMS0lCVEVWRFlXVEF2bSs2eWN6WlZGUHF0akI5NFAvTThSZXdDcE44STVE?=
 =?utf-8?B?Nzd0SWZaQlBXOVlaL3Z5TFVvQkdsOGNITU9aK3QzdnlKcjRBbjAzdTcxSE1l?=
 =?utf-8?B?S213eEZ4Mkp2MnFyZUlqRDN1N1hLLzRVa1pDQ0F5NVdZOUMrQlFVb2c2bWFa?=
 =?utf-8?B?YUo2UVdFekpGRXFRZTk2WHFtV3lydmxLWWhVWmNDMkZna2w0UHRzdTROdXVn?=
 =?utf-8?B?ODJnTFZGRURTdkdWWFNsWFo2REZCSTZ1MWpKd0ZyTEZ0UmJOeFlTZTNkVUdy?=
 =?utf-8?B?UUNIVndkS09CTXpabytjMXlPS3hIdVZkdHFiYTZMUk1BTVdZV1FUVzRSSXlx?=
 =?utf-8?B?WFhPRUVTb2NMZ1pzcGhjV2o0V2dIQlZRdXFXeXFXelVtVmpYbzN0MHhmNnd4?=
 =?utf-8?B?QmdMZmkzeTlhVWVuUzVNUytnUWRKcUx5Q09ES2N1bWwwYlU1QisvUT09?=
X-Exchange-RoutingPolicyChecked: wrwH84bP4e7Od0GdC3ZwqJBVuUmWnvB5F6zcOlozI5IYxc7RHAqeOSvMm1HgT59v3YwSv/sDg+EIRmYLvfr1XH0gky+/Dm9fwoxNQZ8eGZrqKtmlm3884lYAfdo4sm4bijAQ5fqvhKy7rE0f/bBzxxCFRaNgbj+A5NmDsaNlUKl6yBgZA4bCfgKjISVGg+Zf+V4w3MStf4x6oIp/12PkPqOhxaKZD6i1y4fIf+MlscR8i9CnjBaROPcSfRCnBXn02LIc8gNt0r2YHkRQBsV07Ks5yfRs40NHaRjyVK2Pj5dluohRaMHyc/w9etILjIk8+COEd2i5X/YD8sp5tRj9xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c34c1e8a-67ac-4b02-bd44-08df35911272
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 07:48:50.9921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAcGkeE1L89fNOnXpaG7q7YBHtIwvbG29LGj7cgPZv+heGC84rK9XceCAFYFSaQlX2wi6LbRW8HFWDvFwe63cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 27-10-2026 23:13, Vinay Belgaumkar wrote:
> We enable this flag during runtime suspend, need to set it back to
> false early during resume to maintain consistency in pci driver's
> internal state. d3cold_toggle() updates the root port's ability
> to go into d3cold via the dev->no_d3cold flag. With this patch, we
> are ensuring this internal state remains consistent with that of
> the endpoint.
>
> v2: Clarify the commit message (Matt Auld)
> v3: Add fixes (Karthik Poosa)
>
> Fixes: f026520367be ("drm/xe: Only set PCI d3cold_allowed when we are really allowing.")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Acked-by: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 0c13eb901aa7..d13599d79ae9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1456,6 +1456,9 @@ static int xe_pci_runtime_resume(struct device *dev)
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	int err;
>   
> +	if (xe->d3cold.allowed)
> +		d3cold_toggle(pdev, D3COLD_DISABLE);
> +
>   	err = pci_set_power_state(pdev, PCI_D0);
>   	if (err)
>   		return err;
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
