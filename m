Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C484CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 18:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137A610E025;
	Mon, 18 Aug 2025 18:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iw3qGwr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727310E025
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755540960; x=1787076960;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FKmomAxIKeOttEoHFwT1vm/ahuJa8fNBAtu9uvF8sxU=;
 b=iw3qGwr76yVrOI1Bg2ykmR4Id9X+/+A/Rmmy1vf2SWvQ0LNtQ26S8kba
 fR8eNfRRjf6DBabLGBp8VCaLnMQ3v7Fxrfyroiz3fPoUyLUvPRJoVhMe9
 96aZE765SrfX1DLS+OYaUz5M459hc9Ce3hr3GcodR9gCwZEQRkC/ysy2d
 L7kL/wh5kaa41fAY0vX5321jttazX3zBZmeBjiFSCYU2MrwcKVcdHsonL
 ehLANO0+DoIhzvMmNC04uDGOSX8jwHrhKBelVGgH2Doad0o7+69dMh18Q
 xN+PmlaJGFmYohrJj9YkUoRrnVj8nCED5rDk0utkj1HQUe3IZNhhoWA4h A==;
X-CSE-ConnectionGUID: JuC0L1ZLTj+Kn0XdeBgMww==
X-CSE-MsgGUID: HclC/6UATJmSsUYcZ4LUzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57844718"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57844718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:16:00 -0700
X-CSE-ConnectionGUID: mA6vQZvgQYS13TXAtMkuqQ==
X-CSE-MsgGUID: Cc4q+qaiRMiPZ02+baUcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167881269"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:16:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 11:15:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 11:15:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 11:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXyPM7JzsAlX8im9b+Kg00sF4ym3v4LUVoPZ/Vms4ysP7LS4Kob6iet5oPeMwwKCuOB9WU6ByoH1Omdqi6v+fACfQTkb4VvxvlO/U1ykibxMORg2TQb6cSmJhvAA7CkKY1QxlRY2PzwnCy3XwYRd316r7xTY8qFn2iG4+D/YybAoimg96cSYj6w5uDUnIVDwMlI3ZROVinzIqgstpT1pZZhfo2mtfL7iAahLR/ZflYcqP9ug4a/DS+evRg31cQsFRVwS5FuSwsaWTr5KavTKT9g9OisfzTtJUqe96/NQTcuF8tfs9GvHVz/U6Nkqab78XKIVX02KETDBmOGnFGAnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdNixeim9LePjWTdqSy+dwsvw2nVSfzU3RqFlE054vY=;
 b=wDFj9SDPhl3Y1Xeei6fpKgmlG5R/NmOqqpHgZAt2QWlbdqP5hHK0PgDWZlshIb1xl1WzyDc5fbYRdpA5OJQjv0VdQyonko6OJqsJKXNiZzhKszbFaj74WaTgMgk39Wc7n0TT3YXWrn0WSBbyaJB+i7ZW8hT9ZYG35RzvTc4DDpZfJFURxK5UvvUR0iFPvCn8eWC2kt186SQZ0B+LWBwuxJqL7GP5+PclQQS55VFMJhcsu5KQcvEpzvSfP/x/5irteIY7bmQfGKqM66KAJaCuW3fi315jg/rRJ3cgE6kfH+u60i4O4RrwxfHZTr5htcdiylvn7RSrptn8GD5bL+ygGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH3PPFEC89C124F.namprd11.prod.outlook.com
 (2603:10b6:518:1::d5d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 18:15:57 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 18:15:56 +0000
Message-ID: <802e3166-ecf0-4bd1-b854-85b55a17daab@intel.com>
Date: Mon, 18 Aug 2025 23:45:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/24] drm/gpuvm: Kill drm_gpuva_init()
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Caterina Shablia
 <caterina.shablia@collabora.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <20250814105950.2177480-3-himal.prasad.ghimiray@intel.com>
 <DC5QC7DRTGQW.3846S7WOEGQMD@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DC5QC7DRTGQW.3846S7WOEGQMD@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH3PPFEC89C124F:EE_
X-MS-Office365-Filtering-Correlation-Id: 45bf9840-6c89-4418-e731-08ddde8346b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXpqUDhRSDVJbVJqY0tKdDNzQmErUDY1anVqMTJhNHJWZS9XK0VMWW5uaHF5?=
 =?utf-8?B?Y2hHUVQ2SEhpQTFXeVZrU0xwTXlYU09ydFB0aHZqaVlPVHhUV0pRZ1RIc1VT?=
 =?utf-8?B?RE1qNFdUdVBPdktrRm04QngvTjAydVpubjFzMWYySGlzZXZEMDNlaldwYlRq?=
 =?utf-8?B?RE50UUltY3J6c1BqeE93by95S2RuR1pRa204Si9aVENFTEJhR2JNb1lSc2h4?=
 =?utf-8?B?Y1RTY3pDRGRMQVZGY3hVR1lHY0Y0QUxJRHJZbHd0VVZsQzRnV2dqS0NZVUph?=
 =?utf-8?B?eHVCYTVkb3VJenFXWUxBa1M1Z3JyVkZZYzZIbGVsdW90eXhpS3pLNFp0UmpW?=
 =?utf-8?B?THV3dzQyNVMwb1VNTjEvUEtkNHhDQmdFSExERHNJbnZnZFJGaUFsbWhXbnRt?=
 =?utf-8?B?QTRtWG1jWTlhKzRvU2cwY3NKRi9Xdm50QXlOWjA4WmlDOGtPWFNiL1hVTlJo?=
 =?utf-8?B?ckU1R29rTk9YL2JQZmNSeVVlOGJkekxwUFpvcC9FWWR0djVLV0NTS0FPTFoz?=
 =?utf-8?B?Tm5rMXFweGJUajB4Wlp1Tmx4azlTcTlIQm1jZjhwQXhyOUZITW4wYXpjeFNv?=
 =?utf-8?B?U1crdlpsR3pDaG4xOEFhNTNJZktUT3BuQUVhL1A2djE4T0h4dmNaeHZCbHlZ?=
 =?utf-8?B?by9hUmJYT3IxTCtXZVBQQlB1cG5xQWI5OFBCakRkUCs3M3lOcHd0dHRNQjZX?=
 =?utf-8?B?VDlBa0NuRzBZdVVpSVl2Z1dWVm1qMFZrUisveVpOb3JtUUZzNy9uQXRLOUR2?=
 =?utf-8?B?T0NuUGU0VTcxTytWYnU5MWU0SndKV0lQQk95VEZiNFErYzFhTytRaVJtVUxB?=
 =?utf-8?B?U0IwYTdQL1prWUNwVTU2MTBDMWJHbUZpdWpteFJoWVp3ZVByc0ZVZS9SaExD?=
 =?utf-8?B?VnVnbEhkaVZMM1haRTJTT2dVOXZiaDIzckdqa2JPc2RkejhCV3lDd1ZpNURT?=
 =?utf-8?B?OEV6TW1PNzJ2NUEvMnJhS2YvbFhFbWxHaEJzUEVXVUluRGVxZ1lWbTl5RUxZ?=
 =?utf-8?B?MWhXRnd2WFRqNTAxaUxsRkVsR1ZMZU56SFhkanhTd3VrT09zRHVZZmxNSmo4?=
 =?utf-8?B?UmtJTVRuNlp2YXVVK3puVHRUMkpIVWEwSXJCSytTR1hBL05JaXpEMXVva2tM?=
 =?utf-8?B?UWsrM3VuMFVLcmQxekNNQWg4NlhJbDAwV1E1dWluTUpEYnB1U3cvc1dkNys1?=
 =?utf-8?B?SXgycnpsenErWjNGUVpab0JQcFlGeHRWY0hvRkp1RmtncjVVNFNFYkJkUVhp?=
 =?utf-8?B?ZFZMRWlpUUJzTXV2Y0ROTFhyaU1NcjI2aEZqaythM00xcU9uaGFrc2o5QXhm?=
 =?utf-8?B?cjZvVUt0SHptMDRvdkxuSHYxcXB1NjR4d1VvdzJTMFVXa2JOSGFWUHlpaEdB?=
 =?utf-8?B?OHYzcmg1SzFmckFOSGkyQmtMZEpQTlZ6NDNraWZHSTRGSDhLVzhJL0JHdS9O?=
 =?utf-8?B?Rm1SdnNidjJ1b1dmRk1tR1kwdXJzcTJoOTJCMnhTUlA0UTJHZ05jU1dDM0pv?=
 =?utf-8?B?M0l4T0duYm1MR3B0ZGI1MjBrYlFCc3d2dVhSQm40bmxlbjBvcjZUeWxqanF4?=
 =?utf-8?B?T3VGTnh5ekJZbmdzRXdMOUQxWGZTSlE5RzQ5eDI2QWVsZXFnUkQzNzh3bU43?=
 =?utf-8?B?YUlJWFhEcWErWG9vS3krTnNsbmxhMWNlVUN0b2ZwU0g0aUE5TFA5b1dFTFNa?=
 =?utf-8?B?djBKZ1dpdkFtWDdHd1NqS3JDQm0rTkQ5RVBGSktncDdkbzFxVmpWMjM0eE1m?=
 =?utf-8?B?eFNCcUg3ZjNwUGNBTTNvbXZFMjlvdmdGR2N4ZjA1ckl1Y05KbFBwa1lYbGR5?=
 =?utf-8?B?SHl1YW5nVHB0WHdKb3lXNW5LMFJMRjlCVEVxdUp4Um9jakFoWWxjVTN3QWJL?=
 =?utf-8?B?bVpXb0o5a1kwNDljcUxGbzdrR2tRaDFWUWp1NVhVM2lLZWF1MEJ0ZGxZbHVj?=
 =?utf-8?Q?SvRXORbeI4M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3NRN1VoV3NFWUR5VWplRUtWSUw3VkpQVGZnbFBibWJRN29BajZ5WkRCS0dQ?=
 =?utf-8?B?TFVIbFVFRzI3b2gzcXkwSEh5QUR1WXB3TUxQV0pCRDAyb1NHcjh0ZHh4WEtz?=
 =?utf-8?B?Mzg2cEJkU1QvSEwxaWQyWjF4eEswN2ZDTEpVditoQ3ZwM09WcW9ER1N1eWNr?=
 =?utf-8?B?UjFWdXVyU1dQTUNTSkVFczdzeHRiRGxoVkdXV2dERDdKYWllbzNYTkZsMERO?=
 =?utf-8?B?eEhKV0ovOTQzQjVaWnNmcUtldElSMkNVOUVBY3B0bFMrdVA2WnlIZG1CZkp4?=
 =?utf-8?B?b0RRWFQ1N09qM2NucnJUS3hGdkhEcDQ3b3gxREVGSWVXSDFuWkhxYWhvSjRL?=
 =?utf-8?B?SnFDUUl4QW5icTdKd202Ni9YRkpiMjdvd0UzajdSdFlxTG91WDJJOU1ydEFo?=
 =?utf-8?B?ZXZMWGN2b2J6MkJTbXB4RlJlK2F6L2VReVhaMjluOTAyM3NWcllKZW9hVkFM?=
 =?utf-8?B?eUN3bTdmenRaMUlpbG8ySHVaUW4wbm9IdVBDMGwvTVFJMlhFc2h4VjZkS01s?=
 =?utf-8?B?VDYwU2s5MjF6N1gyeEdCKy90NWhpUU5ZRmJxSFkxOTRYR3ViS3BONGhadEx5?=
 =?utf-8?B?SnE4K3JKZGUrQ2dxcTA2SDFHNk5ndThUcXQ1RWMwcDhQTTl0c2NhSHJHY1FY?=
 =?utf-8?B?Y2xvbnFNaXlKTkVNSG80TWpEMDVITno4Um0wZFRaKzAxNjlMeVlrYjE2aWZI?=
 =?utf-8?B?NTNoTEMrQVpRcmJZUWdneWZFeUI1dlcwSVJzb0E1UjJZZmFCVzZYbktlNFUy?=
 =?utf-8?B?Z0hYbSt2d3VsRjBGUTNIdjFRVGg0QW1xWHdpZnNnSm1ZbzlLNzRIeElWMU9N?=
 =?utf-8?B?TTNWM2MveFBmZDNIYkp4bDJXWjY1UFRnN3BnRkFpMTF1UllRQXZOZEJLNUE5?=
 =?utf-8?B?NXB4MGN0REhnNXhydjVJR3BrN1IrcDN1YzM4ZTFTbk1HYWJhV05lWSs4Wk9r?=
 =?utf-8?B?c0pJNVRWTkEwam0zNitsYUpQWjlTeHZqZktkUjUxMjh1Vy94bVJHTkhvTmVX?=
 =?utf-8?B?by82aUJKT0dtS0h2a21nWWFiRGM5bk1xeWtOYmNYNUNqd2RKcjB4Q3VDOHJk?=
 =?utf-8?B?ZGlseHJvVjdYWTIvZmQwdGovWk5JSURqdXJxdzE5RnkvaE9ZM3ZvazJNK3hK?=
 =?utf-8?B?N3dHOFczME8zTEY2akJ0cWZNL1NadXNkWCtXMmkyZWMrUGZucFNWKzM1d0E0?=
 =?utf-8?B?ejBIVnZJSDBKSW5LNENXTkJaa3NGdGUyVkVJazZUdmpSV0RydDdzTDYzSXU5?=
 =?utf-8?B?ZjRLOE1hOUlYVVpmRnNZVHEzeHVzTG5zYXp6MHBuNjhvN0MrQUF3bVc1Wmtn?=
 =?utf-8?B?WTNGMFJMcnhYT2hBVUVKVG5kUUhiQlJ4Nm5NQndrZXVRUEF6dmlWTnhMY0dz?=
 =?utf-8?B?S0ZFdk5RaDFNb1NBM3JhckVhK3hqeXBTMWIrQ2tiQTZYTkdZSnVmek8yNGJX?=
 =?utf-8?B?KzlUUUlHWHJkcDVyUHFtditlMDZGQVJodGdZY1BFWUp2V1dvWWY3dXBVMkF1?=
 =?utf-8?B?bmFsaHVGUkVZd0NwcGdUS291MWp3QmN3VnI3QUlqckJPcXZ0V1kvSFNzOEVR?=
 =?utf-8?B?Sjk5MlUzYXhJTVRkTERtWHJYVXFhMWQ1Q2ViaVRnekFQTUdZSSt0by9ZSTUv?=
 =?utf-8?B?aEM0cDJKZGE5VmZsZHIzd1pJY3ZvdXZpRFROSFY4YVpBb3pKQ0tTUE1VemVI?=
 =?utf-8?B?YWI2VE9lUVlSZUxpcWVpeUFxZ1dSVy9nUVRYSFloM0YzZjFOelZ0U0svM0xa?=
 =?utf-8?B?ZWZiZlZycFNPKy93cXY0ZHZhRDI3ZTNFSGxISkRydW9pNWtVUHFETmNzSEdY?=
 =?utf-8?B?RFBxcWwvR3VuaEU5eDNKTWs2YUl6NFBiS1FBemQ4L0g3WDhJSTV5SXhkdDlK?=
 =?utf-8?B?UzlrNVFzT1NEMFR4UitMSG9lOHdXNHFmakhPWWZpQ2FnamlMbi9SZWF5cEpt?=
 =?utf-8?B?T3BjcUZHaEprRnFaYU95bXhoVXhISkt0UXZkbHU2NWQrR3pPRlFORVhWbk5r?=
 =?utf-8?B?MTd2ckhnSXVmVUVFRnRjZXhkOEM3Vk1pZWZSK0ZFZ2tXNWNKS2Joa0FnV2lx?=
 =?utf-8?B?ZjhxbUdGUGxtNVAwbVM3MmlVVU1QZVFOS0JwUTJqb21NNStwZzJudXMrZ3hY?=
 =?utf-8?B?QnBWZjkzL0JUTmpSSmhJU2IrUEE0S3lZRFNqZkVhaEpiekR0ZkJMUzRRNjhL?=
 =?utf-8?Q?83Ffmy6whvZIWdFa/5oippE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bf9840-6c89-4418-e731-08ddde8346b5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 18:15:56.8976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1FxMkygOa4i0DBBn7BxNe7GzGTIm5kk0dCxxI2bftMDTsWqTmcF9mvupgTWCohVARf3nV+DqUorz/Rf1yQ/kR8c5L+YoAlygMkA6/m44AM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEC89C124F
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



On 18-08-2025 22:59, Danilo Krummrich wrote:
> On Thu Aug 14, 2025 at 12:59 PM CEST, Himal Prasad Ghimiray wrote:
>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> drm_gpuva_init() only has one internal user, and given we are about to
>> add new optional fields, it only add maintenance burden for no real
>> benefit, so let's kill the thing now.
>>
>> v2
>> - Remove usage from msm
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> 
> Caterina doesn't seem to be involved in the handling of this patch, please
> either add her Co-developed-by: in case that is approprite or remove her SoB.
> 
> (Also, no need to resend, you can fix this when applying the patch AFAIC.)

Sure. Will Remove SoB.

> 
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

