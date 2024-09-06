Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA653E6FE41
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 18:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7299E10EACE;
	Fri,  6 Sep 2024 18:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhKepvWW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A05B10EACE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725646279; x=1757182279;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c/O1RKdiAWBXnVIyiNW6zCNhyj3JiNdKMvgdQti1+cI=;
 b=dhKepvWWxId9DdhbTXqAp6u5i6l5PuQmClT+/pCz1Nq5HlcQiYTnX0pS
 gFgq+8wdrJgBlH6+KQAAY1aPjGYEF/eVnfy8f4Mv/tWo2mIlU0YzLpBZS
 rNC5gObE9ofKr2zV/CU0u5octG14e3Ar1s7J7TOOZXvHxyL9N3D5DKp7L
 4/92KaZMF6l7DJ7AQLdrwL3R8Ptb5j07yhzxm5TJM7utuZSGe/EjY04V9
 tK5M5U/34QLOxeULXuIjGpvEfvCOlR7mbbwrNAucXlwsVsjQn0/EtqRAY
 3alkmk/YcuKpk0B5xBf4q/8ryoMfcZO7K3daBGO0LHhhQV6IW7XM2URCt g==;
X-CSE-ConnectionGUID: xbETmvH2QNi7pbg1ZMasKw==
X-CSE-MsgGUID: BUTRY9lPThmaatHg/NQznw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24215449"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24215449"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 11:11:19 -0700
X-CSE-ConnectionGUID: 37O4NdtPTIyUSYPAx/ACIA==
X-CSE-MsgGUID: MWdK8+WOShaiw7cR0LRe7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70830302"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 11:11:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 11:11:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 11:11:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 11:11:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 11:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzY4viezOCmQK7adIM0ByOSjQb2rneJfMKP4e3GWocb1So36vyus/nccajaYYjGW51tkrqC1HOpqfqZ1HioO6lKYBnoj09xU+lAQjYDiBoLOkGDds7FOeWnqW4QuiSygzBQDNV4Leam+x0X60kN0w08ZjKi/rWO0MEpH2zIjFvg/Jl571CKRbiMcnYSTCc6lCArL8f9rh+oc+djniWRsDATNQm/gqqIVH8zxoD6jZMxU64XYx5XVaYoqZ7LkCkHxtxuS5sP0YihShzI+ggOtyUe+QZCwNijM69Pe0Zns3Bm0wCq8DjN/LwzdAZyWd7tCkicuW4JqwGg0Q9QCkXRzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifj8vnthClMLEerDsXnw8Stj4pEc9ocjqJYh4Q8xAWY=;
 b=NzXiyDE4v1ng3Z2f7B/Yz4vjcjrXsseCFiVsMyLtxr05ugu0Xf4S3RIQVi5J0B8w7Ja67utipdFfAjzrpvLzLMW1vzkA/YftJOB+CnKs0vB20Kl3P7tR9+082VZYmsKCaJ0lFxrX71eZidEVKheTAsdXC33Q4g0ZZuaxPEUlz3D+c/2dIAxJcX3f5vplXL2tzCvoGnen+a0DI4dDxUQcw5Lzrqjj1JEpxj/oTHdYQkNz661y2JhriKtXhqLIIQldtqJ0g7emAlPjUmIgaBB5940hojp+eEWShqqngyI3IRLEgUyadnBRmdODnTHoG8+l+bdgYbQCVRK0RQnPtOYWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 18:11:13 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%2]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 18:11:13 +0000
Message-ID: <623e68b1-9272-412d-b244-0fa0465cd438@intel.com>
Date: Fri, 6 Sep 2024 14:11:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 7/7] drm/xe/guc: Plumb GuC-capture into dev coredump
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240827214726.1183935-1-zhanjun.dong@intel.com>
 <20240827214726.1183935-8-zhanjun.dong@intel.com>
 <7cd59281aa8e2b1851058866a22b14ec9320ecc2.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <7cd59281aa8e2b1851058866a22b14ec9320ecc2.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: f1867d27-fa02-446d-4f74-08dcce9f4b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1EzK3FJSFZaVUZNK0c3U0lLdkJoeWZVRmUvRmEwdkdXN2dMcTdORVhuSzBT?=
 =?utf-8?B?MENSUG1pZk9kblQ5RURYcC9JU1pDcHFydDVDQVpFR0ZhRFpzVTJBQ3FXNXJu?=
 =?utf-8?B?c0FHMVlRdThnTmFhTUdDcWNoemY2ZnJCQmp1aW9VVEMwUHVDV3FjdlhXK0h6?=
 =?utf-8?B?aFNObjhBOVNOaGxuYTZMbmhOUTZQeWlCdFBWQlVodVRNMktxOHlPbEFNYjVT?=
 =?utf-8?B?MURZR2V4QzZLTGs4ZzRQN1hCN09OUmVtcXp1L3h2clhkL1pMbE45RXEyWnJj?=
 =?utf-8?B?S28zdnQxVFNTRmlaYTZOL1FIc3dvZk5hRnBmR1ltb09QMXB6aW5MQzRyTUtF?=
 =?utf-8?B?OTNpSDBRZHA4SDRxenoyejJUZER1QjJaVjlpcjAyVVVlWXlJY2x3am5YOEJw?=
 =?utf-8?B?d2dudmZwcU9JT05tTDk5OWNKbnBMSUVoakU1RTYxTGplZDRSbnpsQ3dncmFF?=
 =?utf-8?B?YStLdnhZTWdCTTNPaTlxY2FsTWZvbmV4Z2liVkwyZkx6N29Gc0lRTHIxOUE2?=
 =?utf-8?B?Y1NzUlNycTIvUFRQWXBqaWdONWdoUTcvWUZobjNKcjZ0L05sa1k3dHphTWtM?=
 =?utf-8?B?Z2dwT1RFOU91ZUo4cUhvem5YbEQ5STVBMDRvY2dUbTdnRmxEOEplVkpRTm40?=
 =?utf-8?B?S3ZrTG5BcUp2a2lONENNdVFkT2djdTljWE96UkkrYW5yOHo0YklaeUtSMlc2?=
 =?utf-8?B?Y0lpS05PaDhJZkJkVW9mUC9HYklKS3JIdk9WdG5OT3dPd1hmdHZmMExpelov?=
 =?utf-8?B?d0gyVFV4YVdxNWFZYkorcEkwM01ucWxlNnppUlM5NndDRlBoSjN0TWJEc01l?=
 =?utf-8?B?YVhKMnlOcHlUcWF4blJ6elZJc3RpN0dWTUlCd25mWXQzdy9yNVNvNjZQQzdV?=
 =?utf-8?B?VXVZWVdwRVJDNDJ5S2lCV3VoZ2lBaFZPa1dyZ1RQRUUvWVcva1VUV3pCR1c2?=
 =?utf-8?B?clJINEZiRkllWFpCd2FKT0FPN0ZIMHhmL3pSZE1URlVXT1NQeHlwQkoyNUww?=
 =?utf-8?B?b3NDTjV6WURHNVBPYVN4eWwzM3pjTWRocXdCSVNaNDVZT2tDVGttYkNidm1N?=
 =?utf-8?B?N3c1WTNSNGpLTEoxbGlpNjkxVmpmTVNEK1FWOVlZV21jRTFDZDRNak5raEE3?=
 =?utf-8?B?NExZM3VLVENzRkt2NEpiWTJhYkdxUXFndnNnVm5HK1RiQVgzSmZacE4rUGVC?=
 =?utf-8?B?VVhVcWxlMUxzWDU5Qm9KUEpvTHh1Q0IyUUZtVnNYSlJXRzA1SHg1RXpnNXRE?=
 =?utf-8?B?NkVRRjVWMnVhV1RtRy81R3d2MllPYU02RFhNZ0VicTFWSThwYnZTekN6d2xt?=
 =?utf-8?B?YXNCVHJ1NWxkdFhEb1IxazBLMXFxWkFRR2JXQnVlUENkNTY3RTBPNW1RVmkr?=
 =?utf-8?B?WmFlT3NNQ3ZicmJPTEZROUNiakJOa3Zod2R5ZElkSi9xZmk5aXZiVGtSQXYr?=
 =?utf-8?B?OHNLVHhua0I4MFcvTXQwM09iZkpQUXV0ZWFQcHZkcHlhTG5BTjhibVQxaXho?=
 =?utf-8?B?VkdzejlCSjMwQTdUWE82UjFQUGdYK0ZXUlh0WVJ4U1pyUitqS01DTVhQckZ2?=
 =?utf-8?B?aFNWNHRudktTVHVPa2VWRHNJRVNuRmM5V2F1d1JvM0t6TmdkbTVFRmVqYjZp?=
 =?utf-8?B?SDV2Q3ozekFJUEd3bXcxbStTVmZ5c1UrWGNiSlFvNVZjdXdyN1FFN29PZm81?=
 =?utf-8?B?K0xDU3lLTE9iSk4rWHh0RkpsMys1RTN6V1FCUm9ab2lvQWMyMGpuREVSYi8v?=
 =?utf-8?B?NmxtY0hOM0Z5VXlDcWd5dExROGF4RUo1Mm9SeFFZOEFqSG1pa3VDMmVmdHRI?=
 =?utf-8?B?RGtzYmxuT0drVldyYmFWUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEd0NTUzK3pwU3lzWUE3UnduTHRsZE5oRlU0M1ZuNXJrN0JjQ09kZ0RkTlJp?=
 =?utf-8?B?dTd5aC9rTmF1NW1MQ1JHRlhkRHJXcmIrUlZzTldKQXRrNy85Zk1aWDcvbnY1?=
 =?utf-8?B?NHFJbk1NUnVPTlA0ZERxWVlDNE1abThtb3FyQ0I4WlRHMW5HSFB0bmdUYmNV?=
 =?utf-8?B?bk5QcHp0aEJwNnQremFVU011bzBBUkQ2VVhiaXRsUWRWeGR5eXpRbnFabVM5?=
 =?utf-8?B?VXptWlRtaGlLNE00V1JmN1dXejY3bTIyQTBGa1ZJdVpSQVRXNUxsOTY4dkQ0?=
 =?utf-8?B?ajNLNml3L1oxRzVzUlZIL3lIQk5UeWZNZEo3bGxmcFZZb0krdjlQZ0lVM1Vv?=
 =?utf-8?B?Y0M4QWY5VlRiMGQwYmJ1V1JPZUYxVUtWV25haXhhZVZpR3hUNEp3cGwvdEYr?=
 =?utf-8?B?YWxBWU5uY1htV29BN2N3b3lONlBvRDZjWmNRK2JyN0VEVU1udkM2SFEvMkNV?=
 =?utf-8?B?OTFzbVY0NUh1NlJmdjZVaGp4OW5EdGJQYXhHSjB2UE1UUXRsTGo1akdvWld2?=
 =?utf-8?B?RVNraGhXY29iclpOa2VGY1JBRUJYWTd0MHdHWkY4aDlSdUM1ekpSWkZuZSsv?=
 =?utf-8?B?QWJPTjNyK084WXdpTnptd1djQTRIbGgrd29yQUgzM1IwVEY5YXlHQVNIRTJL?=
 =?utf-8?B?UHh0RHcySmZZdXZKVG10LzFidHAxM1NlZEpKbFF0YklIRDlLanhyMkx5dU9n?=
 =?utf-8?B?MCtOQWlzSjZMb3pHMEE1KzhDMzBOWmp3MHc4eUpZN1h5YklacVpUTlNrTDBX?=
 =?utf-8?B?cmNaQURSekpqRmtsK0dRQmhYV1RUUVlubDVDT3RKSCtzWHRMWGw5UVorL2lW?=
 =?utf-8?B?am1oMEZSd29lUWQrRGk3VjFMMlBhVStIeDJ0NmUwNmF3dTFwcXh6akhUeE9j?=
 =?utf-8?B?ZzVmWGR3Rmtka25GazVjQVllcm5YLzBVaWhTMjQ5NmFxNytzRFpRZFJoSWYz?=
 =?utf-8?B?Y2YrU3JIdTlQY1JQQUE4emMvVlNXYnN5RFNzSlZpNHVFcnNxMkpFdEtUU3FQ?=
 =?utf-8?B?K1pNUlIzd1V6V2tYSzlqQ1UvQzhEd0JKQjdwM0xXZEJ0ck9Ta2pPN1FzKzJ5?=
 =?utf-8?B?djF3a3pSZmFXeEVETS9SUTE3TUYvcTlmeWVOd2pGbGZGUjNyZXJmMEdnbmNH?=
 =?utf-8?B?SXpKZkM1NDd1UTV2SExpMm9aTUEvR211NWZyVzJWQXkrSEttOEhzRmg5cXdX?=
 =?utf-8?B?emV4Z0k5WXJLemVJeWoxK3V0WDQyWm51clRWTnpiR1BEMDcwK1JTQ1B3Yit1?=
 =?utf-8?B?MytIMlpPS1dPU3dSY3U1SzQ0WXNWS01nUVg4UCtxd3lHVjlXekUwZHVxY0I4?=
 =?utf-8?B?bnVXUXRGTjNaclVkOW9BaGJVRExYdVNkS011SHZTTUp6SngzeGl0eGpBS0ZO?=
 =?utf-8?B?ZkRma3M3TzVCNGtUTzhuY1ppZFAvQkFjdDlGbUNSQi9MSW5XaFlyYUc1azg0?=
 =?utf-8?B?bXN1UkNLbnkwbUIrSmxlOXFBWGVJbkpjYXl2OG1yVEFSOWZOOWVvSHFzMk1k?=
 =?utf-8?B?bUVyamN2QmliSFRkalBxOGpNc2hYdkduSFZKd1pONElJMFpkSmdKbmZsY3Jk?=
 =?utf-8?B?NW9TRS9YUVJ6LzVvQmlRRlBGL1RQSy8xT0IwV2JHTzlKV3dHdzByZzk5S2lB?=
 =?utf-8?B?M080YkJiMnhjL1MrM2JSenFaVGhXQURGL0pKeEMrN3VFU3NHMmNOZ2tCTDY3?=
 =?utf-8?B?Yml3Y1MzanYzZ0Z6UWF3NWxoRXRpMTNlUzhZc05yb2VuNGpESDQrblBjRXl0?=
 =?utf-8?B?bU5MN3Nqdk1wMDY2SG1yT0FycVNVL1NybE9zVXpDR043dlRsSGJFTlExRFU4?=
 =?utf-8?B?U2lQVDlvc0dCb2I3RjBzNUZDVk1CZXV4WXZuQ1FiVWowWmV3bUErVVRSM2Nu?=
 =?utf-8?B?dmI4Lys4Tk8zR3pBcEhMNHVIdlUyYWgwaCt0b3JKeHNXeDZCVlp0bkVreUtt?=
 =?utf-8?B?VjJyT2F4S1dYOFIxcVNIa2RYRithdFJzZENZQnB1anFjSnlGMlhYT1FpYmRa?=
 =?utf-8?B?ZHZoTlVBM09oWDdzbGtpdGZiS1lqc2F5RnFSUFVaUFYvVk5NL1NHSVlkVk05?=
 =?utf-8?B?UEZ5Rzk1cHBNcm1RZHRiRGs2WjBsUExKeHFXSytCT2NQRVE2SmtSRkhBcXMx?=
 =?utf-8?B?Wnc0aXdCWHZJNlo3aHFYM2xWOXlYUUlTZVNFZFBUNTVDQU00TEJzR0FOeHk4?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1867d27-fa02-446d-4f74-08dcce9f4b1b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 18:11:13.7845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGROg5MpIdGIvyrhcrCDMrCqRKj6tBp0XXlIh+h09H7u83zcWGTvF7XLpphKVdIWB0DuOLqmWldeS0kOTSQWNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2024-08-29 12:26 a.m., Teres Alexis, Alan Previn wrote:
> 
> Havent gone through everything, but looks like we have a lot to
> digest, lets connect offline and go through everything. Suspect
> we might need another one or two rounds.
> 
> Hmmm.. this patch is huge, we need to think about how we can break this into
> 2 or 3 patches but by simple trivial file-specific change like standa-alone header
> modification in a single patch...  but rather based on specific flows or
> functionalities that can be chronlogical. For example:
> 
> patch x = only focus on searching for matching guc-pre-captured-node and printing that.
>            and keep the existing manual copy + printing (with the duplicate snapshot engine regs structure).
> patch x+1 = Remove the manual capture + printing (and this patch can remove the duplicate
> snapshot engine regs structure).
> patch x+2 = add manual-capture via guc-capture so that we can use the same list
> (for wedged-mode=2 and such)
> 
> I am aware this is a big ask but since patch sizes can be subjective, let's check
> with one of the other committers offline to see what they think.
> 
> Either way, I do have a bunch of additional comments below. I havent gone
> through everything yet - since the changes touch many different points
> in the flow. but I've focused more on the new list and the printing.
This patch will be split into 2 in next rev.
> 
> On Tue, 2024-08-27 at 14:47 -0700, Zhanjun Dong wrote:
>> Add pre-capture by read from hw engine if GuC capture data is not ready,
>> the pre-captured data will be refereshed if GuC capture is ready at later
>> time.
> alan: Maybe some additional context like "
> alan: i dont think the term "pre-capture" is self explanatory, since
> the term "pre" means ~before but in actual fact, even when capture
> comes from GuC it already happened 'before'. Can we replace all the
> terms of pre-capture or pre_capture in comments and code to
> "manual_capture" or "kmd_capture" or anything more self-explanatory.
Sure, will use "manual" in next rev.
> 
>> Provide xe_guc_capture_get_reg_desc_list to get the register dscriptor
>> list.
>> GuC support limited register ranges to be captured, add type of direct
>> read to read these registers by host.
>> Add function to check if capture is ready for a job.
>> Print out snapshot registers by types of global, class, instance and
>> direct read.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   2 +
>>   drivers/gpu/drm/xe/xe_devcoredump.c       |  16 +-
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_guc_capture.c       | 380 +++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_capture.h       |  26 ++
>>   drivers/gpu/drm/xe/xe_guc_capture_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c        |  19 +-
>>   drivers/gpu/drm/xe/xe_hw_engine.c         | 273 ++++------------
>>   drivers/gpu/drm/xe/xe_hw_engine.h         |   2 +
>>   drivers/gpu/drm/xe/xe_hw_engine_types.h   |  66 +---
>>   drivers/gpu/drm/xe/xe_lrc.h               |   1 +
>>   11 files changed, 504 insertions(+), 285 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0d1a4a9f4e11..6a8dee069974 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -605,4 +605,6 @@
>>   #define   GT_CS_MASTER_ERROR_INTERRUPT         REG_BIT(3)
>>   #define   GT_RENDER_USER_INTERRUPT             REG_BIT(0)
>>   
>> +#define SFC_DONE(n)                            XE_REG(0x1cc000 + (n) * 0x1000)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index bdb76e834e4c..783958829750 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_guc_capture.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_hw_engine.h"
>> @@ -135,6 +136,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>>   
>>          xe_vm_snapshot_free(ss->vm);
>>          ss->vm = NULL;
>> +
>> +       xe_guc_capture_free(&ss->gt->uc.guc);
> alan: something wrong with this code .. see below.
>>   }
>>   
>>   static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>> @@ -204,6 +207,7 @@ static void xe_devcoredump_free(void *data)
>>          /* To prevent stale data on next snapshot, clear everything */
>>          memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
>>          coredump->captured = false;
>> +       coredump->job = NULL;
>>          drm_info(&coredump_to_xe(coredump)->drm,
>>                   "Xe device coredump has been deleted.\n");
>>   }
>> @@ -214,8 +218,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>          struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>>          struct xe_exec_queue *q = job->q;
>>          struct xe_guc *guc = exec_queue_to_guc(q);
>> -       struct xe_hw_engine *hwe;
>> -       enum xe_hw_engine_id id;
>>          u32 adj_logical_mask = q->logical_mask;
>>          u32 width_mask = (0x1 << q->width) - 1;
>>          const char *process_name = "no process";
>> @@ -231,6 +233,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>          strscpy(ss->process_name, process_name);
>>   
>>          ss->gt = q->gt;
>> +       coredump->job = job;
>>          INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
>>   
>>          cookie = dma_fence_begin_signalling();
>> @@ -252,14 +255,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>          coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
>>          coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
>>   
>> -       for_each_hw_engine(hwe, q->gt, id) {
>> -               if (hwe->class != q->hwe->class ||
>> -                   !(BIT(hwe->logical_instance) & adj_logical_mask)) {
>> -                       coredump->snapshot.hwe[id] = NULL;
>> -                       continue;
>> -               }
>> -               coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
>> -       }
>> +       xe_hw_engine_snapshot_capture_for_job(job);
>>   
>>          queue_work(system_unbound_wq, &ss->work);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> index 440d05d77a5a..50165a10abdd 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> @@ -69,6 +69,8 @@ struct xe_devcoredump {
>>          bool captured;
>>          /** @snapshot: Snapshot is captured at time of the first crash */
>>          struct xe_devcoredump_snapshot snapshot;
>> +       /** @job: Point to the issue job */
>> +       struct xe_sched_job *job;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 20b38d60dca7..16f660db3231 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -27,11 +27,16 @@
>>   #include "xe_guc_capture.h"
>>   #include "xe_guc_capture_types.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_exec_queue_types.h"
>>   #include "xe_guc_log.h"
>> +#include "xe_guc_submit_types.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_hw_engine_types.h"
>> +#include "xe_lrc.h"
>>   #include "xe_macros.h"
>>   #include "xe_map.h"
>> +#include "xe_mmio.h"
>> +#include "xe_sched_job.h"
>>   
>>   /*
>>    * struct __guc_capture_bufstate
>> @@ -69,11 +74,13 @@ struct __guc_capture_parsed_output {
>>          u32 eng_inst;
>>          u32 guc_id;
>>          u32 lrca;
>> +       u32 type;
>> +       enum xe_hw_engine_snapshot_source_id source;
>>          struct gcap_reg_list_info {
>>                  u32 vfid;
>>                  u32 num_regs;
>>                  struct guc_mmio_reg *regs;
>> -       } reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
>> +       } reginfo[GUC_HOST_CAPTURE_TYPE_MAX];
> alan: lets not do this - we need a different way to do this, actually, we
> need to ensure ALL register dumps captured due to hanging workloads come
> strictly from either the GuC ... OR ... manually read (when GuC reset is
> disabled i.e. wedged mode >2 ). There should NOT be a mix. Exceptions would
> only be registers that can never change at runtime based on engine-class/
> engine-instance / executing-context-workloads submissions. If such a registers
> exists, it should be directly tracked by and read by devcoredump, not as part
> of the guc-error-capture lists. However, based on what i am seeing in this patch
> you are using this new "out-of-band-guc-abi-list-type" as a hack to identifying
> separating the SFC_DONE registers - but those are engine class registers so
> this doesn't look right to me. We add this to the GuC register list in ADS.
After further discuss, the SFC_DONE should be supported by GuC, so no 
need for the direct read anymore, make no longer need this.
To be removed in next rev.
> 
> 
>>   #define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
>>   #define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
>>   };
>> @@ -133,6 +140,17 @@ struct __guc_capture_parsed_output {
>>          { SC_INSTDONE_EXTRA,            REG_32BIT,      0,      0,      "SC_INSTDONE_EXTRA"}, \
>>          { SC_INSTDONE_EXTRA2,           REG_32BIT,      0,      0,      "SC_INSTDONE_EXTRA2"}
>>   
>> +/*
>> + * GuC support limited registers ranges to be captured for debug
>> + * purpose, for registers out of these ranges, direct read is the only
>> + * way to access.
>> + */
>> +#define XELP_VEC_DIRECT_READ \
>> +       { SFC_DONE(0),                  0,      0,      0,      "SFC_DONE[0]"}, \
>> +       { SFC_DONE(1),                  0,      0,      0,      "SFC_DONE[1]"}, \
>> +       { SFC_DONE(2),                  0,      0,      0,      "SFC_DONE[2]"}, \
>> +       { SFC_DONE(3),                  0,      0,      0,      "SFC_DONE[3]"}
>> +
> alan: these are engine class registers, they should be captured by GuC since only
> GuC knows what contexts are running on which engines at which point during a reset
> event. If you are having issues with GuC not reporting this, we need to work
> with the GuC firmware team / arch team to get this fixes. I suspect this might
> end up taking more time and its important that we can get the most common ring
> register dumps enabled first. I would suggest we open a public facing JIRA
> that ackowledges that we need to add SFC_DONE registers into GuC error capture
> ADS and proceed without it first. Unless we find that GuC does actually support
> and we perhaps didnt enable it correctly. Let's discuss offline.
Agreed, GuC capture is the best way to read it

> 
>>   /* XE_LP Global */
>>   static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
>>          COMMON_XELP_BASE_GLOBAL,
>> @@ -164,6 +182,11 @@ static const struct __guc_mmio_reg_descr xe_vec_inst_regs[] = {
>>          COMMON_BASE_ENGINE_INSTANCE,
>>   };
>>   
>> +/* Video Enhancement direct read registers */
>> +static const struct __guc_mmio_reg_descr xe_vec_direct_read_regs[] = {
>> +       XELP_VEC_DIRECT_READ,
>> +};
>> +
>>   /* Blitter Per-Engine-Instance */
>>   static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] = {
>>          COMMON_BASE_ENGINE_INSTANCE,
>> @@ -201,6 +224,8 @@ static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
>>          MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
>>          MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>>          MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>> +       MAKE_REGLIST(xe_vec_direct_read_regs, PF, HOST_DIRECT_READ,
>> +                    GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> alan: Regarding this  usage of "HOST_DIRECT_READ", it appears you are trying to overload
> a GUC-ABI definition for reglist type to workaround the fact that some registers are not
> captured by GuC. This is incorrect, we need to work with the GuC team to ensure they
> capture these registers because the SFC register state used only as part of the batch
> submission thru VDBOX/VEBOX CS. That means it should be copied by GuC. If we are seeing
> issues, we need to get this fixed in the firmware. I think mixing GuC capture with manual
> read is the wrong thing to do.
> 
>>          MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
>>          MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
>>          MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>> @@ -217,6 +242,8 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
>>          MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
>>          MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>>          MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>> +       MAKE_REGLIST(xe_vec_direct_read_regs, PF, HOST_DIRECT_READ,
>> +                    GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> alan: same comment as last
>>          MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
>>          MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
>>          MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>> @@ -292,6 +319,23 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
>>          return NULL;
>>   }
>>   
>> +const struct __guc_mmio_reg_descr_group *
>> +xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>> +                                enum guc_capture_list_class_type capture_class)
>> +{
>> +       return guc_capture_get_one_list(guc_capture_get_device_reglist(gt_to_xe(gt)), owner, type,
>> +                                       capture_class);
>> +}
>> +
> alan: nit: instead of two helpers above and below, u can make it one with a
> param for "is_ext_list", internally if-else it - maybe few of lines of code?
Good idea
>> +const struct __guc_mmio_reg_descr_group *
>> +xe_guc_capture_get_ext_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>> +                                    enum guc_capture_list_class_type capture_class)
>> +{
>> +       struct xe_guc *guc = &gt->uc.guc;
>> +
>> +       return guc_capture_get_one_list(guc->capture->extlists, owner, type, capture_class);
>> +}
>> +
>>   struct __ext_steer_reg {
>>          const char *name;
>>          struct xe_reg_mcr reg;
>> @@ -810,16 +854,16 @@ guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
>>   static void
>>   guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
>>   {
>> -       struct guc_mmio_reg *tmp[GUC_STATE_CAPTURE_TYPE_MAX];
>> +       struct guc_mmio_reg *tmp[GUC_HOST_CAPTURE_TYPE_MAX];
>>          int i;
>>   
>> -       for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i) {
>> +       for (i = 0; i < GUC_HOST_CAPTURE_TYPE_MAX; ++i) {
>>                  tmp[i] = node->reginfo[i].regs;
>>                  memset(tmp[i], 0, sizeof(struct guc_mmio_reg) *
>>                         guc->capture->max_mmio_per_node);
>>          }
>>          memset(node, 0, sizeof(*node));
>> -       for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i)
>> +       for (i = 0; i < GUC_HOST_CAPTURE_TYPE_MAX; ++i)
>>                  node->reginfo[i].regs = tmp[i];
> alan: same comments are prior - lets not overload ABI-types for a workaround.
>>   
>>          INIT_LIST_HEAD(&node->link);
>> @@ -864,6 +908,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>>    *                   L--> xe_devcoredump
>>    *                          L--> devcoredump_snapshot(..IS_GUC_CAPTURE)
>>    *                               --> xe_hw_engine_snapshot_capture(..IS_GUC_CAPTURE)
>> + *                               --> xe_guc_capture_node_from_hw(..If no GUC CAPTURE)
>>    *
>>    * User Sysfs / Debugfs
>>    * --------------------
>> @@ -1197,6 +1242,8 @@ guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *
>>                  }
>>                  node->is_partial = is_partial;
>>                  node->reginfo[datatype].vfid = FIELD_GET(GUC_STATE_CAPTURE_HEADER_VFID, hdr.owner);
>> +               node->source = XE_HW_ENGINE_SOURCE_GUC_CAPTURE;
>> +               node->type = datatype;
>>   
>>                  switch (datatype) {
>>                  case GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE:
>> @@ -1363,7 +1410,7 @@ guc_capture_alloc_one_node(struct xe_guc *guc)
>>          if (!new)
>>                  return NULL;
>>   
>> -       for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i) {
>> +       for (i = 0; i < GUC_HOST_CAPTURE_TYPE_MAX; ++i) {
>>                  new->reginfo[i].regs = drmm_kzalloc(drm, guc->capture->max_mmio_per_node *
>>                                                 sizeof(struct guc_mmio_reg), GFP_KERNEL);
>>                  if (!new->reginfo[i].regs) {
>> @@ -1401,7 +1448,7 @@ guc_get_max_reglist_count(struct xe_guc *guc)
>>          int i, j, k, tmp, maxregcount = 0;
>>   
>>          for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; ++i) {
>> -               for (j = 0; j < GUC_STATE_CAPTURE_TYPE_MAX; ++j) {
>> +               for (j = 0; j < GUC_HOST_CAPTURE_TYPE_MAX; ++j) {
>>                          for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
>>                                  if (j == GUC_STATE_CAPTURE_TYPE_GLOBAL && k > 0)
>>                                          continue;
>> @@ -1429,6 +1476,327 @@ guc_capture_create_prealloc_nodes(struct xe_guc *guc)
>>          __guc_capture_create_prealloc_nodes(guc);
>>   }
>>   
>> +static void
>> +read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_group *list,
>> +                struct __guc_capture_parsed_output *node)
>> +{
>> +       struct gcap_reg_list_info *reginfo = &node->reginfo[list->type];
>> +       struct guc_mmio_reg *regs = reginfo->regs;
>> +       int i;
>> +
>> +       if (!regs)
>> +               return;
>> +
>> +       for (i = 0; i < list->num_regs; i++) {
>> +               struct __guc_mmio_reg_descr desc = list->list[i];
>> +               u32 value;
>> +
>> +               if (!list->list)
>> +                       return;
>> +
>> +               value = (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) ?
>> +                       xe_hw_engine_mmio_read32(hwe, desc.reg) :
>> +                       xe_mmio_read32(hwe->gt, desc.reg);
> alan: i see you are using this for the manual read. I also believe you are
> also using this for reading steering registers, but method is not going to work
> for steering registers. Please see the correct method in function
> "xe_hw_engine_snapshot_instdone_capture" and how it calls xe_gt_mcr_unicast_read
> in baseline codebase.
Oh, that seems a bug, to be fixed in next rev.
> 
> Actually, to be honest, i dont see why you needed to move the manual register
> capture into guc-capture. We have been driving to ensure we have a single
> register list is shared across both devcoredump and guc-error-capture.
> I'm not sure why you also needed to move the manual-register-reading
> over to guc-err-capture. I don't see a motivation for that.
> 
> I think keeping the manual register reads in devcoredump subsystem is fine.
> We can keep xe_hw_engine_snapshot_capture but only used when doing manual
> capture as long as we use the shared register list, i.e. use the list
> from xe_guc_capture_get_reg_desc_list / xe_guc_capture_get_ext_reg_desc_list.
The reason is to use a single register list in capture.c, this 
read_reg_to_node will read into outlist, and the print_by_list will make 
the print out order follows register order in reg_desc_list.
> 
>> +
>> +               regs[i].value = value;
>> +               regs[i].offset = desc.reg.addr;
>> +               regs[i].flags = desc.flags;
>> +               regs[i].mask = desc.mask;
>> +       }
>> +}
>> +
>> +/**
>> + * xe_guc_capture_node_from_hw - Take a engine snapshot from GuC capture.
>> + * @hwe: Xe HW Engine.
>> + * @type: GuC capture register type
>> + * @list: The register list
>> + *
>> + * This can be printed out in a later stage like during dev_coredump
>> + * analysis.
>> + *
>> + * Returns: None
>> + */
>> +void xe_guc_capture_node_from_hw(struct xe_hw_engine *hwe, u32 type,
>> +                                const struct __guc_mmio_reg_descr_group *list)
>> +{
>> +       struct xe_gt *gt = hwe->gt;
>> +       struct xe_device *xe = gt_to_xe(gt);
>> +       struct xe_guc *guc = &gt->uc.guc;
>> +       struct xe_devcoredump *devcoredump = &xe->devcoredump;
>> +       struct __guc_capture_parsed_output *new = NULL;
>> +       struct gcap_reg_list_info *reginfo;
>> +       u16 guc_id = 0;
>> +       u32 lrca = 0;
>> +
>> +       if (!list || list->num_regs == 0)
>> +               return;
>> +       XE_WARN_ON(list->num_regs > guc->capture->max_mmio_per_node);
>> +
>> +       new = guc_capture_get_prealloc_node(guc);
>> +       if (!new)
>> +               return;
>> +
>> +       new->is_partial = false;
>> +       reginfo = &new->reginfo[type];
>> +
>> +       read_reg_to_node(hwe, list, new);
>> +
>> +       reginfo->num_regs = list->num_regs;
>> +
>> +       if (devcoredump->captured) {
>> +               struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
>> +
>> +               guc_id = ge->guc.id;
>> +               lrca = ge->lrc[0]->context_desc & LRC_GTT_ADDRESS_MASK;
>> +       }
>> +
>> +       new->eng_class = hwe->class;
>> +       new->eng_inst = hwe->instance;
> alan: as mentioned previously, i think we should not move manual register
> reads from devcoredump over to guc, only ensure the list is the shared list.
> Putting that point aside, above code may not work correctly. IIRC,
> node->eng_class and node->eng_inst are both GUC specific identifiers and
> we have to make some kind of conversion from hwe-class to guc-class and
> maybe hwe-instance to guc-instance.. (i am sure about the former, but not
> sure on up on the latter). So when its time to print, if we look at
Oh, class conversion is missing here, to be fixed in next rev.
Conversion is not needed for engine instance.
> 
>> +       new->guc_id = guc_id;
>> +       new->lrca = lrca;
>> +       new->source = XE_HW_ENGINE_SOURCE_HW_ENGINE;
>> +       new->type = type;
>> +       guc_capture_add_node_to_outlist(guc->capture, new);
>> +}
>> +
>> +static struct guc_mmio_reg *
>> +guc_capture_find_reg(struct gcap_reg_list_info *reginfo, u32 addr, u32 flags)
>> +{
>> +       int i;
>> +
>> +       if (reginfo && reginfo->num_regs > 0) {
>> +               struct guc_mmio_reg *regs = reginfo->regs;
>> +
>> +               if (regs)
>> +                       for (i = 0; i < reginfo->num_regs; i++)
>> +                               if (regs[i].offset == addr && regs[i].flags == flags)
>> +                                       return &regs[i];
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +static void
>> +snapshot_print_by_list(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p, u32 type,
>> +                      const struct __guc_mmio_reg_descr_group *list)
>> +{
>> +       struct xe_gt *gt = snapshot->hwe->gt;
>> +       struct xe_device *xe = gt_to_xe(gt);
>> +       struct xe_guc *guc = &gt->uc.guc;
>> +       struct xe_devcoredump *devcoredump = &xe->devcoredump;
>> +       u16 guc_id = 0;
>> +       u32 last_value, lrca = 0;
>> +       struct list_head *node;
>> +       int i, guc_class;
>> +       bool is_ext;
>> +
>> +       if (!list)
>> +               return;
>> +
>> +       is_ext = list == guc->capture->extlists;
>> +
>> +       if (devcoredump->captured) {
>> +               struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
>> +
>> +               guc_id = ge->guc.id;
>> +               lrca =  ge->lrc[0]->context_desc;
>> +       }
>> +
>> +       guc_class = xe_engine_class_to_guc_class(snapshot->hwe->class);
>> +
>> +       node = &guc->capture->outlist;
>> +       for (i = 0; i < list->num_regs; i++) {
>> +               struct __guc_capture_parsed_output *n, *ntmp;
>> +               const struct __guc_mmio_reg_descr *sub_list = &list->list[i];
> 
> alan: I'm a little bit lost right here. The param "list" coming into this
> function is the list registers that we use for registering into ADS (not
> the output capture node list). Then the idea we have is to format the printing
> of the registers that was captured from a matching outlist. to do that
> we grab the next register from outlost and then look for the matching
> register description from list.
> 
> 
> That said i would have expected the flow of this function to look like this:
> Step1: find the mathing output node.
> 
> 
> 	struct __guc_capture_parsed_output *matchnode = NULL;
> 	list_for_each_entry_safe(n, ntmp, node, link) {
> 		if (n->eng_class == guc_class && n->eng_inst == snapshot->hwe->instance &&
> 			n->guc_id == guc_id && (n->lrca & LRC_GTT_ADDRESS_MASK) == lrca) {
> 			matchnode = n;
> 	}
I like the idea here to get node 1st
> 
> 	if (!matchnode) {
> 		print_error - cannot find matching register dumps
> 		return (error?)
> 	}
> 
> 	struct gcap_reg_list_info *reginfo = &matchnode->reginfo[type];
> 
> 	struct guc_mmio_reg *reg;
> 	const struct __guc_mmio_reg_descr *reg_descr;
> 	u32 value;
> 	for (i = 0; i < reginfo->num_regs; ++i) {
> 		reg = reginfo->regs[i]
> 		reg_descr = guc_capture_find_reg_descr(reg, list);
> 				// in this function, loop thru list->list and find matching address / steering-info
> 		if (!reg_descr) {
> 			continue;
> 			print warning
> 		}
> 	
> 		//the rest of the print formatting code...
> 		value = reg->value;
> 		if (sub_list->data_type == REG_64BIT_LOW_DW) {
> 			last_value = value;
> 				continue;
> 		} else if (sub_list->data_type == REG_64BIT_HI_DW) {
> 			u64 value_qw = ((u64)value << 32) | last_value;
> 			if (sub_list->regname)
> 				drm_printf(p, "\t%s: 0x%016llx\n",
> 					sub_list->regname, value_qw);
> 					continue; // <--- alan: i think break was wrong here
> 		}
> 		if (!sub_list->regname)
> 			break;
> 		if (is_ext) {
> 			...
> 			...
> 		}
> 		// dont need that last break;
> 	}
Looks good, will be updated in next rev.
> 
>> +
>> +               list_for_each_entry_safe(n, ntmp, node, link) {
>> +                       if (n->eng_class == guc_class && n->eng_inst == snapshot->hwe->instance &&
> alan: does hwe->instance match the guc's engine-instance? need to check with the folks familiar
> with the guc mapping table we setup in ads - maybe not an issue.
No instance conversion code exist in Xe. Test shows it matches

>> +                           n->guc_id == guc_id && (n->lrca & LRC_GTT_ADDRESS_MASK) == lrca) {
>> +                               struct gcap_reg_list_info *reginfo = &n->reginfo[type];
>> +                               struct guc_mmio_reg *reg;
>> +                               u32 value;
>> +
>> +                               reg = guc_capture_find_reg(reginfo, sub_list->reg.addr,
>> +                                                          sub_list->flags);
>> +                               if (!reg)
>> +                                       continue;
>> +
>> +                               value = reg->value;
>> +                               if (sub_list->data_type == REG_64BIT_LOW_DW) {
>> +                                       last_value = value;
>> +                                       continue;
>> +                               } else if (sub_list->data_type == REG_64BIT_HI_DW) {
>> +                                       u64 value_qw = ((u64)value << 32) | last_value;
>> +
>> +                                       if (sub_list->regname)
>> +                                               drm_printf(p, "\t%s: 0x%016llx\n",
>> +                                                          sub_list->regname, value_qw);
>> +                                       break;
>> +                               }
>> +
>> +                               if (!sub_list->regname)
>> +                                       break;
>> +
>> +                               if (is_ext) {
>> +                                       int dss, group, instance;
>> +
>> +                                       group = FIELD_GET(GUC_REGSET_STEERING_GROUP,
>> +                                                         sub_list->flags);
>> +                                       instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE,
>> +                                                            sub_list->flags);
>> +                                       dss = xe_gt_mcr_steering_info_to_dss_id(gt,
>> +                                                                               group, instance);
>> +
>> +                                       drm_printf(p, "\t%s[%u]: 0x%08x\n", sub_list->regname, dss,
>> +                                                  value);
>> +                               } else {
>> +                                       drm_printf(p, "\t%s: 0x%08x\n", sub_list->regname,
>> +                                                  value);
>> +                               }
>> +                               break;
>> +                       }
>> +               }
>> +       }
>> +}
>> +
>> +/**
>> + * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
>> + * @snapshot: Xe HW Engine snapshot object.
>> + * @p: drm_printer where it will be printed out.
>> + *
>> + * This function prints out a given Xe HW Engine snapshot object.
>> + */
>> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>> +                                struct drm_printer *p)
>> +{
>> +       int type;
>> +       const struct __guc_mmio_reg_descr_group *list;
>> +       enum guc_capture_list_class_type capture_class;
>> +
>> +       if (!snapshot)
>> +               return;
>> +
>> +       xe_gt_assert(snapshot->hwe->gt, snapshot->source <= XE_HW_ENGINE_SOURCE_GUC_CAPTURE);
>> +       xe_gt_assert(snapshot->hwe->gt, snapshot->hwe);
>> +
>> +       capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
>> +
>> +       drm_printf(p, "%s (physical), logical instance=%d\n",
>> +                  snapshot->name ? snapshot->name : "",
>> +                  snapshot->logical_instance);
>> +       drm_printf(p, "\tCapture source: %s\n",
>> +                  snapshot->source == XE_HW_ENGINE_SOURCE_GUC_CAPTURE ? "GuC" : "Engine");
>> +       drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
>> +                  snapshot->forcewake.domain, snapshot->forcewake.ref);
>> +
>> +       for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_HOST_CAPTURE_TYPE_MAX; type++) {
>> +               list = xe_guc_capture_get_reg_desc_list(snapshot->hwe->gt,
>> +                                                       GUC_CAPTURE_LIST_INDEX_PF, type,
>> +                                                       capture_class);
>> +               snapshot_print_by_list(snapshot, p, type, list);
>> +       }
>> +
>> +       if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
>> +               list = xe_guc_capture_get_ext_reg_desc_list(snapshot->hwe->gt,
>> +                                                           GUC_CAPTURE_LIST_INDEX_PF,
>> +                                                           GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>> +                                                           capture_class);
>> +               snapshot_print_by_list(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS, list);
>> +       }
>> +
>> +       drm_puts(p, "\n");
>> +}
>> +
>> +/**
>> + * xe_guc_capture_is_ready_for - Check if capture is ready for the job.
>> + * @job: The job object.
>> + *
>> + * Search within the capture outlist for the job.
>> + *
>> + * Returns: True if found a node for the job
>> + */
>> +bool xe_guc_capture_is_ready_for(struct xe_sched_job *job)
>> +{
>> +       struct xe_hw_engine *hwe;
>> +       enum xe_hw_engine_id id;
>> +       struct xe_exec_queue *q = job->q;
>> +       u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
>> +
>> +       if (!q || !q->gt)
>> +               return false;
>> +
>> +       /* Find hwe for the job */
>> +       for_each_hw_engine(hwe, q->gt, id) {
>> +               if (hwe != q->hwe)
>> +                       continue;
>> +               guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +               break;
>> +       }
>> +
>> +       if (guc_class <= GUC_LAST_ENGINE_CLASS) {
>> +               struct __guc_capture_parsed_output *n, *ntmp;
>> +               struct xe_guc *guc =  &q->gt->uc.guc;
>> +               struct list_head *list = &guc->capture->outlist;
>> +               u16 guc_id = q->guc->id;
>> +               u32 lrca = xe_lrc_ggtt_addr(job->q->lrc[0]) & LRC_GTT_ADDRESS_MASK;
>> +
>> +               /*
>> +                * Look for a matching GuC reported error capture node from
>> +                * the internal output link-list based on engine, guc id and
>> +                * lrca info.
>> +                */
>> +               list_for_each_entry_safe(n, ntmp, list, link) {
>> +                       if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
>> +                           n->guc_id == guc_id && (n->lrca & LRC_GTT_ADDRESS_MASK) == lrca &&
>> +                           n->source == XE_HW_ENGINE_SOURCE_GUC_CAPTURE)
>> +                               return true;
>> +               }
>> +       }
>> +       return false;
>> +}
>> +
>> +/*
>> + * xe_guc_capture_free_pre_capture - Free the pre captured register list
>> + * @guc: The GuC object
>> + *
>> + * Free the pre captured register list
>> + */
>> +void xe_guc_capture_free_pre_capture(struct xe_guc *guc)
>> +{
>> +       if (guc->capture && !list_empty(&guc->capture->outlist)) {
>> +               struct __guc_capture_parsed_output *n, *ntmp;
>> +
>> +               list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
>> +                       if (n->source == XE_HW_ENGINE_SOURCE_HW_ENGINE &&
>> +                           /* Direct read is for host only, no need to refresh */
>> +                           n->type != GUC_STATE_CAPTURE_TYPE_HOST_DIRECT_READ) {
>> +                               list_del(&n->link);
>> +                               /* put node back to cache list */
>> +                               guc_capture_add_node_to_cachelist(guc->capture, n);
>> +                       }
>> +               }
>> +       }
>> +}
>> +
>> +/*
>> + * xe_guc_capture_free - Free the GuC captured register list
>> + * @guc: The GuC object
>> + *
>> + * Free the GuC captured register list
>> + */
>> +void xe_guc_capture_free(struct xe_guc *guc)
>> +{
>> +       if (guc->capture && !list_empty(&guc->capture->outlist)) {
>> +               struct __guc_capture_parsed_output *n, *ntmp;
>> +
>> +               list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
>> +                       list_del(&n->link);
>> +                       /* put node back to cache list */
>> +                       guc_capture_add_node_to_cachelist(guc->capture, n);
> alan: this is incorrect... if dev_coredump has been freed for one specific capture event,
> i dont think we want to free al capture nodes. Don't forget we can have multiple engines
> be hanging and resetting in quick succession (which is actually the case for some of
> our more intense igt tests, also if we have dependent engine resets, we can also see
> this). That said, we have to think of two things:
> 
> 1. only free the ouput node that was directly servicing the xe_devcoredump_snapshot
> structure that is getting freed, this means, we might wanna take in the guc structure
> as well as the struct xe_devcoredump_snapshot structure so that we can find the
> matching node (by way of engine, guc-id, lrc, etc).
> 
> 2. we don't want to leak capture->outlist: in the event we have multiple
> guc error capture IRQs and we parse and extract multiple output nodes from
> guc-capture-ring-buffer is but only one  devcore-dumps get generated and
> freed (see function guc_capture_get_prealloc_node where it bails if there
> already is a devcoredump struct waiting to be collected), we have to ensure
> we don't leak those nodes in outlist. However, we dont have to worry about
> this since in patch #4, function guc_capture_get_prealloc_node will always
> steal back LRU node from outlist if required.
> 
> That said, we do want to fix this function for #1.
I see, your concerns covers possible further multiple hang support.
To make future life easier, we might want to only free the matched node 
and nodes with the same guc id.
Yes, we never leak outlist, our code will reuse the oldest node if out 
of node space, so this is safe.

>> +               }
>> +       }
>> +}
>> +
>>   /*
>>    * xe_guc_capture_steered_list_init - Init steering register list
>>    * @guc: The GuC object
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
>> index 3a690e8b714a..bcda17ef9eb9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
>> @@ -12,6 +12,21 @@
>>   #include "xe_guc_fwif.h"
>>   
>>   struct xe_guc;
>> +struct xe_hw_engine;
>> +struct xe_hw_engine_snapshot;
>> +struct xe_sched_job;
>> +
>> +/* Register-types of GuC capture register lists for host side process */
>> +enum guc_capture_host_type {
>> +       /*
>> +        * GuC support limited registers ranges to be captured for debug
>> +        * purpose, for registers out of these ranges, direct read is the only
>> +        * way to access.
>> +        */
>> +       GUC_STATE_CAPTURE_TYPE_HOST_DIRECT_READ = GUC_STATE_CAPTURE_TYPE_MAX,
>> +};
>> +
>> +#define GUC_HOST_CAPTURE_TYPE_MAX      (GUC_STATE_CAPTURE_TYPE_HOST_DIRECT_READ + 1)
>>   
>>   static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
>>   {
>> @@ -44,6 +59,17 @@ int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
>>                                 enum guc_capture_list_class_type capture_class, size_t *size);
>>   int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
>>   size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>> +const struct __guc_mmio_reg_descr_group *
>> +xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>> +                                enum guc_capture_list_class_type capture_class);
>> +const struct __guc_mmio_reg_descr_group *
>> +xe_guc_capture_get_ext_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>> +                                    enum guc_capture_list_class_type capture_class);
>> +bool xe_guc_capture_is_ready_for(struct xe_sched_job *job);
>> +void xe_guc_capture_node_from_hw(struct xe_hw_engine *hwe, u32 type,
>> +                                const struct __guc_mmio_reg_descr_group *list);
>> +void xe_guc_capture_free_pre_capture(struct xe_guc *guc);
>> +void xe_guc_capture_free(struct xe_guc *guc);
>>   int xe_guc_capture_steered_list_init(struct xe_guc *guc);
>>   int xe_guc_capture_init(struct xe_guc *guc);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
>> index 2057125b1bfa..857ad10bb8f3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
>> @@ -41,6 +41,8 @@ struct __guc_mmio_reg_descr {
>>          u32 mask;
>>          /** @regname: Name of the register */
>>          const char *regname;
>> +       /** @position_in_snapshot: The offset position in snapshot structure */
>> +       u32 position_in_snapshot;
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 381be84740cf..44353e323f24 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1073,6 +1073,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>          struct xe_gpu_scheduler *sched = &q->guc->sched;
>>          struct xe_guc *guc = exec_queue_to_guc(q);
>>          const char *process_name = "no process";
>> +       struct xe_device *xe = guc_to_xe(guc);
>>          int err = -ETIME;
>>          pid_t pid = -1;
>>          int i = 0;
>> @@ -1100,6 +1101,18 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>          if (!skip_timeout_check && !xe_sched_job_started(job))
>>                  goto rearm;
>>   
>> +       /* Pre-capture register snapshot, if devcoredump not captured and GuC capture not ready */
>> +       if (!exec_queue_killed(q) && !xe->devcoredump.captured && xe_device_uc_enabled(xe) &&
>> +           xe->wedged.mode >= 1 && !xe_guc_capture_is_ready_for(job)) {
>> +               /* take force wake before engine register pre-capture */
>> +               if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
>> +                       xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
>> +
>> +               xe_hw_engine_snapshot_capture_for_job(job);
>> +
>> +               xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>> +       }
>> +
>>          /*
>>           * XXX: Sampling timeout doesn't work in wedged mode as we have to
>>           * modify scheduling state to read timestamp. We could read the
>> @@ -1182,7 +1195,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>          trace_xe_sched_job_timedout(job);
>>   
>>          if (!exec_queue_killed(q))
>> -               xe_devcoredump(job);
>> +               xe_devcoredump(job); /* pre-captured data will be refreshed by GuC capture */
> alan: comment description is not accurate. I think "refreshed" is the wrong term,
> i think it should be "manual capture data will be replaced by GuC capture if
> GuC succeeds on upcoming or already-completed engine reset, reported via G2H."
>>   
>>          /*
>>           * Kernel jobs should never fail, nor should VM jobs if they do
>> @@ -1979,8 +1992,6 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>          xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>>                     xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>>   
>> -       /* FIXME: Do error capture, most likely async */
>> -
>>          trace_xe_exec_queue_reset(q);
>>   
>>          /*
>> @@ -2006,7 +2017,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>    * XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION to host, this function will be
>>    * called 1st to check status before process the data comes with the message.
>>    *
>> - * Returns: None
>> + * Returns: error code. 0 if success
>>    */
>>   int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 18980238a2ea..ad3a108a2491 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -23,6 +23,8 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_topology.h"
>> +#include "xe_guc_capture.h"
>> +#include "xe_guc_capture_types.h"
>>   #include "xe_hw_engine_group.h"
>>   #include "xe_hw_fence.h"
>>   #include "xe_irq.h"
>> @@ -312,6 +314,7 @@ void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
>>   u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>>   {
>>          xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
>> +
>>          xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
>>   
>>          reg.addr += hwe->mmio_base;
>> @@ -809,54 +812,26 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>>                  xe_hw_fence_irq_run(hwe->fence_irq);
>>   }
>>   
>> -static bool
>> -is_slice_common_per_gslice(struct xe_device *xe)
>> -{
>> -       return GRAPHICS_VERx100(xe) >= 1255;
>> -}
>> -
>>   static void
>> -xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
>> -                                      struct xe_hw_engine_snapshot *snapshot)
>> +xe_hw_engine_snapshot_from_hw(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot,
>> +                             u32 type)
>>   {
>>          struct xe_gt *gt = hwe->gt;
>> -       struct xe_device *xe = gt_to_xe(gt);
>> -       unsigned int dss;
>> -       u16 group, instance;
>> -
>> -       snapshot->reg.instdone.ring = xe_hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
>> +       enum guc_capture_list_class_type capture_class;
>> +       const struct __guc_mmio_reg_descr_group *list;
>>   
>> -       if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
>> -               return;
>> +       capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
>>   
>> -       if (is_slice_common_per_gslice(xe) == false) {
>> -               snapshot->reg.instdone.slice_common[0] =
>> -                       xe_mmio_read32(gt, SC_INSTDONE);
>> -               snapshot->reg.instdone.slice_common_extra[0] =
>> -                       xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
>> -               snapshot->reg.instdone.slice_common_extra2[0] =
>> -                       xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
>> -       } else {
>> -               for_each_geometry_dss(dss, gt, group, instance) {
>> -                       snapshot->reg.instdone.slice_common[dss] =
>> -                               xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE, group, instance);
>> -                       snapshot->reg.instdone.slice_common_extra[dss] =
>> -                               xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA, group, instance);
>> -                       snapshot->reg.instdone.slice_common_extra2[dss] =
>> -                               xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA2, group, instance);
>> -               }
>> -       }
>> +       /* Get register list for the type/class */
>> +       list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type, capture_class);
>>   
>> -       for_each_geometry_dss(dss, gt, group, instance) {
>> -               snapshot->reg.instdone.sampler[dss] =
>> -                       xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
>> -               snapshot->reg.instdone.row[dss] =
>> -                       xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
>> +       xe_guc_capture_node_from_hw(hwe, type, list);
>>   
>> -               if (GRAPHICS_VERx100(xe) >= 1255)
>> -                       snapshot->reg.instdone.geom_svg[dss] =
>> -                               xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVGUNIT,
>> -                                                      group, instance);
>> +       /* Capture steering registers for rcs/ccs */
>> +       if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
>> +               list = xe_guc_capture_get_ext_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
>> +                                                           capture_class);
>> +               xe_guc_capture_node_from_hw(hwe, type, list);
>>          }
>>   }
>>   
>> @@ -874,8 +849,9 @@ struct xe_hw_engine_snapshot *
>>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>>   {
>>          struct xe_hw_engine_snapshot *snapshot;
>> -       size_t len;
>> -       u64 val;
>> +       struct xe_gt *gt = hwe->gt;
>> +       struct xe_device *xe = gt_to_xe(gt);
>> +       u32 type;
>>   
>>          if (!xe_hw_engine_is_valid(hwe))
>>                  return NULL;
>> @@ -885,28 +861,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>>          if (!snapshot)
>>                  return NULL;
>>   
>> -       /* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
>> -        * includes xe_hw_engine_types.h the length of this 3 registers can't be
>> -        * set in struct xe_hw_engine_snapshot, so here doing additional
>> -        * allocations.
>> -        */
>> -       len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
>> -       snapshot->reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);
>> -       snapshot->reg.instdone.slice_common_extra = kzalloc(len, GFP_ATOMIC);
>> -       snapshot->reg.instdone.slice_common_extra2 = kzalloc(len, GFP_ATOMIC);
>> -       snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
>> -       snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
>> -       snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
>> -       if (!snapshot->reg.instdone.slice_common ||
>> -           !snapshot->reg.instdone.slice_common_extra ||
>> -           !snapshot->reg.instdone.slice_common_extra2 ||
>> -           !snapshot->reg.instdone.sampler ||
>> -           !snapshot->reg.instdone.row ||
>> -           !snapshot->reg.instdone.geom_svg) {
>> -               xe_hw_engine_snapshot_free(snapshot);
>> -               return NULL;
>> -       }
>> -
>>          snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
>>          snapshot->hwe = hwe;
>>          snapshot->logical_instance = hwe->logical_instance;
>> @@ -916,156 +870,69 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>>          snapshot->mmio_base = hwe->mmio_base;
>>   
>>          /* no more VF accessible data below this point */
>> -       if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
>> +       if (IS_SRIOV_VF(xe))
>>                  return snapshot;
>>   
>> -       snapshot->reg.ring_execlist_status =
>> -               xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
>> -       val = xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
>> -       snapshot->reg.ring_execlist_status |= val << 32;
>> -
>> -       snapshot->reg.ring_execlist_sq_contents =
>> -               xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
>> -       val = xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
>> -       snapshot->reg.ring_execlist_sq_contents |= val << 32;
>> -
>> -       snapshot->reg.ring_acthd = xe_hw_engine_mmio_read32(hwe, RING_ACTHD(0));
>> -       val = xe_hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
>> -       snapshot->reg.ring_acthd |= val << 32;
>> -
>> -       snapshot->reg.ring_bbaddr = xe_hw_engine_mmio_read32(hwe, RING_BBADDR(0));
>> -       val = xe_hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
>> -       snapshot->reg.ring_bbaddr |= val << 32;
>> -
>> -       snapshot->reg.ring_dma_fadd =
>> -               xe_hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
>> -       val = xe_hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
>> -       snapshot->reg.ring_dma_fadd |= val << 32;
>> -
>> -       snapshot->reg.ring_hwstam = xe_hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
>> -       snapshot->reg.ring_hws_pga = xe_hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
>> -       snapshot->reg.ring_start = xe_hw_engine_mmio_read32(hwe, RING_START(0));
>> -       if (GRAPHICS_VERx100(hwe->gt->tile->xe) >= 2000) {
>> -               val = xe_hw_engine_mmio_read32(hwe, RING_START_UDW(0));
>> -               snapshot->reg.ring_start |= val << 32;
>> -       }
>> -       if (xe_gt_has_indirect_ring_state(hwe->gt)) {
>> -               snapshot->reg.indirect_ring_state =
>> -                       xe_hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
>> +       /* If GuC not enabled, and capture outlist has no job data, take it from engine */
>> +       if (xe_device_uc_enabled(xe) && xe->wedged.mode >= 1 && xe->devcoredump.job &&
>> +           xe_guc_capture_is_ready_for(xe->devcoredump.job)) {
>> +               snapshot->source = XE_HW_ENGINE_SOURCE_GUC_CAPTURE;
>> +               /* GuC won't report direct read registers, read here */
>> +               xe_hw_engine_snapshot_from_hw(hwe, snapshot,
>> +                                             GUC_STATE_CAPTURE_TYPE_HOST_DIRECT_READ);
>> +       } else {
>> +               snapshot->source = XE_HW_ENGINE_SOURCE_HW_ENGINE;
>> +               for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_HOST_CAPTURE_TYPE_MAX;
>> +                    type++)
>> +                       xe_hw_engine_snapshot_from_hw(hwe, snapshot, type);
>>          }
>>   
>> -       snapshot->reg.ring_head =
>> -               xe_hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
>> -       snapshot->reg.ring_tail =
>> -               xe_hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
>> -       snapshot->reg.ring_ctl = xe_hw_engine_mmio_read32(hwe, RING_CTL(0));
>> -       snapshot->reg.ring_mi_mode =
>> -               xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>> -       snapshot->reg.ring_mode = xe_hw_engine_mmio_read32(hwe, RING_MODE(0));
>> -       snapshot->reg.ring_imr = xe_hw_engine_mmio_read32(hwe, RING_IMR(0));
>> -       snapshot->reg.ring_esr = xe_hw_engine_mmio_read32(hwe, RING_ESR(0));
>> -       snapshot->reg.ring_emr = xe_hw_engine_mmio_read32(hwe, RING_EMR(0));
>> -       snapshot->reg.ring_eir = xe_hw_engine_mmio_read32(hwe, RING_EIR(0));
>> -       snapshot->reg.ipehr = xe_hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>> -       xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
>> -
>> -       if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>> -               snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
>> -
>>          return snapshot;
>>   }
>>   
>> -static void
>> -xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
>> +/**
>> + * xe_hw_engine_snapshot_capture_for_job - Take snapshot of associated engine
>> + * @job: The job object
>> + *
>> + * Take snapshot of associated HW Engine
>> + *
>> + * Returns: None.
>> + */
>> +void
>> +xe_hw_engine_snapshot_capture_for_job(struct xe_sched_job *job)
>>   {
>> -       struct xe_gt *gt = snapshot->hwe->gt;
>> -       struct xe_device *xe = gt_to_xe(gt);
>> -       u16 group, instance;
>> -       unsigned int dss;
>> -
>> -       drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
>> +       struct xe_exec_queue *q = job->q;
>> +       struct xe_device *xe = gt_to_xe(q->gt);
>> +       struct xe_devcoredump *coredump = &xe->devcoredump;
>> +       struct xe_hw_engine *hwe;
>> +       enum xe_hw_engine_id id;
>> +       u32 adj_logical_mask = q->logical_mask;
>>   
>> -       if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
>> -               return;
>> +       for_each_hw_engine(hwe, q->gt, id) {
>> +               if (hwe->class != q->hwe->class ||
>> +                   !(BIT(hwe->logical_instance) & adj_logical_mask))
>> +                       continue;
>>   
>> -       if (is_slice_common_per_gslice(xe) == false) {
>> -               drm_printf(p, "\tSC_INSTDONE[0]: 0x%08x\n",
>> -                          snapshot->reg.instdone.slice_common[0]);
>> -               drm_printf(p, "\tSC_INSTDONE_EXTRA[0]: 0x%08x\n",
>> -                          snapshot->reg.instdone.slice_common_extra[0]);
>> -               drm_printf(p, "\tSC_INSTDONE_EXTRA2[0]: 0x%08x\n",
>> -                          snapshot->reg.instdone.slice_common_extra2[0]);
>> -       } else {
>> -               for_each_geometry_dss(dss, gt, group, instance) {
>> -                       drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
>> -                                  snapshot->reg.instdone.slice_common[dss]);
>> -                       drm_printf(p, "\tSC_INSTDONE_EXTRA[%u]: 0x%08x\n", dss,
>> -                                  snapshot->reg.instdone.slice_common_extra[dss]);
>> -                       drm_printf(p, "\tSC_INSTDONE_EXTRA2[%u]: 0x%08x\n", dss,
>> -                                  snapshot->reg.instdone.slice_common_extra2[dss]);
>> +               if (!coredump->snapshot.hwe[id]) {
>> +                       coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
>> +               } else {
>> +                       /* If pre-captured and Guc capture ready now */
>> +                       if (xe_device_uc_enabled(xe) && xe->wedged.mode >= 1 &&
>> +                           xe_guc_capture_is_ready_for(job)) {
>> +                               /*
>> +                                * Remove the pre-captured nodes from outlist,
>> +                                * only keep the GuC reported data.
>> +                                * Except direct read registers, which is read
>> +                                * by host only.
>> +                                */
>> +                               xe_guc_capture_free_pre_capture(&q->gt->uc.guc);
>> +                       }
>>                  }
>> -       }
>> -
>> -       for_each_geometry_dss(dss, gt, group, instance) {
>> -               drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
>> -                          snapshot->reg.instdone.sampler[dss]);
>> -               drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
>> -                          snapshot->reg.instdone.row[dss]);
>> -
>> -               if (GRAPHICS_VERx100(xe) >= 1255)
>> -                       drm_printf(p, "\tINSTDONE_GEOM_SVGUNIT[%u]: 0x%08x\n",
>> -                                  dss, snapshot->reg.instdone.geom_svg[dss]);
>> +               break;
>>          }
>>   }
>>   
>> -/**
>> - * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
>> - * @snapshot: Xe HW Engine snapshot object.
>> - * @p: drm_printer where it will be printed out.
>> - *
>> - * This function prints out a given Xe HW Engine snapshot object.
>> - */
>> -void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>> -                                struct drm_printer *p)
>> -{
>> -       if (!snapshot)
>> -               return;
>>   
>> -       drm_printf(p, "%s (physical), logical instance=%d\n",
>> -                  snapshot->name ? snapshot->name : "",
>> -                  snapshot->logical_instance);
>> -       drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
>> -                  snapshot->forcewake.domain, snapshot->forcewake.ref);
> alan:snip
>> -       drm_puts(p, "\n");
>> -}
>>   
>>   /**
>>    * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
>> @@ -1079,12 +946,6 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>>          if (!snapshot)
>>                  return;
>>   
>> -       kfree(snapshot->reg.instdone.slice_common);
>> -       kfree(snapshot->reg.instdone.slice_common_extra);
>> -       kfree(snapshot->reg.instdone.slice_common_extra2);
>> -       kfree(snapshot->reg.instdone.sampler);
>> -       kfree(snapshot->reg.instdone.row);
>> -       kfree(snapshot->reg.instdone.geom_svg);
>>          kfree(snapshot->name);
>>          kfree(snapshot);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 022819a4a8eb..1df6a082487c 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -11,6 +11,7 @@
>>   struct drm_printer;
>>   struct drm_xe_engine_class_instance;
>>   struct xe_device;
>> +struct xe_sched_job;
>>   
>>   #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>>   #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>> @@ -57,6 +58,7 @@ u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>>   
>>   struct xe_hw_engine_snapshot *
>>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
>> +void xe_hw_engine_snapshot_capture_for_job(struct xe_sched_job *job);
>>   void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
>>   void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>>                                   struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> index 39f24012d0f4..4e3e9ddf5f5a 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> @@ -154,6 +154,11 @@ struct xe_hw_engine {
>>          struct xe_hw_engine_group *hw_engine_group;
>>   };
>>   
>> +enum xe_hw_engine_snapshot_source_id {
>> +       XE_HW_ENGINE_SOURCE_HW_ENGINE,
>> +       XE_HW_ENGINE_SOURCE_GUC_CAPTURE
> alan: mentioned above in one or more places but the first names
> is repetitive but more importantly, not self-explanatory.
> Perhaps a simpler, more readable option is:
> "XE_ENGINE_DUMP_MANUAL vs XE_ENGINE_DUMP_GUC"
> 
>> +};
>> +
>>   /**
>>    * struct xe_hw_engine_snapshot - Hardware engine snapshot
>>    *
>> @@ -162,6 +167,8 @@ struct xe_hw_engine {
>>   struct xe_hw_engine_snapshot {
>>          /** @name: name of the hw engine */
>>          char *name;
>> +       /** @source: Data source, either hw_engine or GuC capture */
>> +       enum xe_hw_engine_snapshot_source_id source;
>>          /** @hwe: hw engine */
>>          struct xe_hw_engine *hwe;
>>          /** @logical_instance: logical instance of this hw engine */
>> @@ -175,65 +182,6 @@ struct xe_hw_engine_snapshot {
>>          } forcewake;
>>          /** @mmio_base: MMIO base address of this hw engine*/
>>          u32 mmio_base;
>> -       /** @reg: Useful MMIO register snapshot */
>> -       struct {
>> -               /** @reg.ring_execlist_status: RING_EXECLIST_STATUS */
>> -               u64 ring_execlist_status;
>>
> alan:snip
>> -               } instdone;
>> -       } reg;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index c24542e89318..cc00fa878d3c 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -21,6 +21,7 @@ struct xe_lrc_snapshot;
>>   struct xe_vm;
>>   
>>   #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>> +#define LRC_GTT_ADDRESS_MASK   GENMASK(31, 12)
>>   
>>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>                               u32 ring_size);
> 
