Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DD7CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 18:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C402F10E0A2;
	Thu, 23 Oct 2025 18:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a76Vg+Ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04E210E08D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 18:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761244045; x=1792780045;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sqCdrWVrDMJoXQRwk0B0NvbII0AojgfxmDP5LLI/2U4=;
 b=a76Vg+FtLpifXxMqcc87BQhADjDti5eeLMkV2JywRYC1HVX3miQqchSw
 gI/gS8iaRaoluGNEUfXslCxHczPwuwUBOL1THe1A+oQ1+hwaWHq45Tkqz
 sbPiHUhkRtuCaDjLLAzzowi+bfamImip8sQu4bxYdlDbH0Fkk5IvcvjJV
 7hXDENkC1x0qoU7auV6BR4XjS1eLyYBwRRxZnljQTN9NUjZ5L34x0NIN7
 CY+gPbzMhx866vVUoDcW1/yigRs0MUvutVJDugvebbG3Z+cpVUQLOk4Wu
 1gug1e2x2y7SehAuRviqv63pJNGdTiDmc8rxAxCqpLzwW6QEca18Wt9J1 Q==;
X-CSE-ConnectionGUID: gA8phwadRX26ddkGfB9a4Q==
X-CSE-MsgGUID: TCsnpEz6QraO2GvaBZKpqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74544372"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74544372"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:27:25 -0700
X-CSE-ConnectionGUID: hudBWc61QtSEZIYPwIkLuA==
X-CSE-MsgGUID: QetFgNz9QiWZpkDSElEHBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="188621843"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:27:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:27:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 11:27:24 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgOp5OOc3rzQL/KvPTtWDDYIhDwsyc0VSYI075MGAhtARxrNFzN2DRwJu9yrO7yIpZ2K5YXJ9Hic44wwf+ldDnJRkeRj+IVVdpeArTXf4owu1XXsff9kobuT7ImESxBfZd0V6CumC6sPXkFX7O/JU1Q/MWZtu3AZO1GPea66omDT4HPxM/GfpovslNlcfsVGU0GuXrbZ6Aujh6baJVZSQbqerGeQJpY+n2QesmZ0irdDwpQT8QsrEFX6336CnB3ZKf9l2k0oV9zGKlhDkMWXfUCg93aisAD1JSP2hqbM2QHO07cnuASM7v25m0NB40hjqEAgEkrQpvoaaa+cNNU7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hdv6nSYZ3Lz0pT6y1XY2A52EtzkBMpW2wYPq9dBGQyU=;
 b=P5A/ydOvc2SN9vohdo2g539zkplmkGbuphGVtR/Crhy4HzJ+lrnSULPqhdD6WmTLiZpyOFPpEpX8QpOh6DBRu5xXi2zxgGdICtmBQ45OvJEY/nw+teBS4ng3suh2ihaW5NSVEHPfnDg+QaLj3JcdJ52VhnWt1zzIOpQQGaECZ8unuo35Sbt37mg++mAxRz2eIGYwMT0/qkCfUxx8nVE1uH3KVcQY5i+9YFrapRGWK0wjmSLVemQM5ur3w/a+FaEW9OcIiFOUAEwlB4ezMjPyEUPEEC9pK5+LjADzDZlE0/qm34rgoMUV/rOe7JX6o4GH2iUr0Vc8Fb7Wa0jPRMY66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 18:27:22 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 18:27:22 +0000
Message-ID: <93041111-61b6-4442-a663-2d7c78a0a5e1@intel.com>
Date: Thu, 23 Oct 2025 11:27:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/uc: Change assertion to error on huc
 authentication failure
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251023181332.2490921-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251023181332.2490921-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c4da72-7ce2-4916-689f-08de1261ce99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z203STlxMzNmV0RMMGRBK29seXppN2t2OHRFVnVoS25qOHl5TGorYjFTMml3?=
 =?utf-8?B?Y2ZGWTNnTElPWkZmQVk4ZzRjUm56THJ5Y1pSc0NGaFVzZGdyYXhURkFUNTFP?=
 =?utf-8?B?bFRsV05RdXlLcVhDOU5paGEyZ1N5UkZXSWkyV3hjUkRNSlk0Rk0wSUNnUVpo?=
 =?utf-8?B?Y3hxbjdmaW5VZExTd2gzRkhaYVZkVFRSNTNjMWpuSVlHSkVFTHFTMTJ2WjRs?=
 =?utf-8?B?bUVmN2RneHFmYjQ5T1pzWHd2MXR2RkZzSEZyWHBpOG5VWTJIYllHM1N5dFEy?=
 =?utf-8?B?M1J2M2ljWXROTXhJNEVIdDN1QzFrdVN1VUpjMm82dDBDRmtEMXVSbFgvRzI4?=
 =?utf-8?B?ZUFyUi94NnRBNERTaTUyanpNcm9hVVpiTVdMWmxrUE44bEdLc2VsU2x3VlUr?=
 =?utf-8?B?NnpVUWxhMGdLN0ZKdk54RlFjTzlJNzlIb3JlOWFTb3REdTB4UTdKYldrOWNq?=
 =?utf-8?B?NmVlRVd2NVFuTHc2QXBFSVFNQllwWkhZZ3cwamFnVnNMREVTd01sa2dDYnpV?=
 =?utf-8?B?OGVsU3lqK1ZBUThFMjc2MzZGZEU5eG4zb3RheG83VFVaVXRJU1ZMK3Z5bDRW?=
 =?utf-8?B?aDMrR29NTmlwMnRrZVg4NlVFcE1mZjBuQTN5WnRscjlod1k2U1VSMmJMWkdS?=
 =?utf-8?B?anpjL1JIMUZPanloSi8wUEUwbG9VWUpXMDFIWkJoM3hheVUzWGduWmRBZE51?=
 =?utf-8?B?U2U5ZUZteDRicmptU1ErRFEySVM1cE9HN1ZCVWhSMzI4RzRYZ3VrSHZ5TkZj?=
 =?utf-8?B?UTltb05sNWMrUWdyYk5vRThoMnBIdlorYmJRUm91NXduSjdkUmNGWFBwTVdO?=
 =?utf-8?B?ekZCeXhqYmVtN2R6azdmdFZQMGdCRElaSlBoU0EydENJVTJFZUgxcXFpTXlM?=
 =?utf-8?B?c3E2QXNSZ1JEdUIwZytFVHpVa25Sb2VEQXBuZ1ZuWXNwVnVkRUpRNjNxUkE1?=
 =?utf-8?B?Y2lXejVFdlFOUnBMOWpoRUdCYlRZME9IaVA0TEtHQW51NTVydWlyZGtpQWVZ?=
 =?utf-8?B?ZGRXU1lQTm5wL1RWRmVkZWhCUHdhd25rbmFuTlFRcEcvb1JtcDgrTnJacVlS?=
 =?utf-8?B?cGprUGF1c3cwR0puY1kvWUNBNElidlgxMmxRbEswWkh1d1h6ZW1GcklCeDZN?=
 =?utf-8?B?ZDJqMVQ1aFVZYnB5VEEvZGxMZjlHR3FPZis5NkNyODRwcEJOc1dQMUpkZTQ2?=
 =?utf-8?B?Rnl3R0IvOU9GZjVoYnVsSG1ZL0drbHVaMDFaemVQVlJ6anRManM0TVFyY0Yw?=
 =?utf-8?B?YXNsVGJYNjVyRlZoaGlFNWVVaU1zaGRJRktDU2RzZHhlN0xGOFk4cDY0ZG5u?=
 =?utf-8?B?MWdDcS9vZUhZbGVENVZQcVZZYXRLUjI0VXJSbVkyL2tDSlZ1L1lOTytraU9m?=
 =?utf-8?B?dm9RMld2Mmx1RDJtOFlVR1RtRjRiZjBsSkhKZmhYSlAvTmNZYXV3QXlZOHdU?=
 =?utf-8?B?NGpCL1J2RHVDcHJpeXU4dVZ5S0RGQXVZMlg2TUltOXJPREVFNm9Rc0VLcU4x?=
 =?utf-8?B?elhoajRHMTJMaVExQ0tIRElmc01hY0VFNkRveDdOSDh5UG1BUTh6Z0txdjFB?=
 =?utf-8?B?M2JIYlJxbCtSVm03eGtDMEt5YlJZMTJvK1NkRlQxQVB2ZlhvakV1dzdaLzM2?=
 =?utf-8?B?NWtCVG01SExxRXZQdzBWYThubFl6TGtwcGdmRDFURDRuaVMwUC9MV3ZWcit1?=
 =?utf-8?B?SEN6dXZtOGlJeXJiejB1OW1nWkJTaVlKWUFmTzNmalhCVm5HYkFyT0xLczE3?=
 =?utf-8?B?bktQKzVRQ0MvT1Q0Mnc2TE9IMkRLOUNJUjJmcGJxdjNHRlh2dlVOVTBhdlRr?=
 =?utf-8?B?K2s0ZVlxRDRuKytvWHNiZmEvNkhlV25GR3hkbXJ3TVZORzBLY0NoemRpczkr?=
 =?utf-8?B?TUFLelJEbkp1ejdrb0VqVG5wekRWbVZXcEpWZU42UVp6dHlQR3lJaTNLWTFr?=
 =?utf-8?Q?KLtBNTXAWgv44AyVfZ/SRtN6mTtxnw3W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3JlRUJYK1RWSFA5NnpIWGVzUWExNGxlakp6Uy9PbVd2ZStjNVZlMGp6TlhP?=
 =?utf-8?B?dTErREE1aGFIakdhUGdEV290R1ZUUVVNcy80YU80bFU3S2h0TVRkRDBiQ0Yz?=
 =?utf-8?B?VGhVUGIyUUcyc1VhMEw1T0NPNE85M0xoYkRvblFtd1lYNVp1bXRpemF6Nlpt?=
 =?utf-8?B?T2pvbll5SXRveFg1eGlqY1k0OTNKTitjSGVHMXlyUnc5TGhqeVBBSmYrQlBY?=
 =?utf-8?B?YmtiRGFkVnZEclVKWmp4cWVrUG1kbnBPV0g3ek5nbVJINUZCbnFUMzM5Q3hs?=
 =?utf-8?B?ZjYxMW80R0tEM2NnWjYxaTdySVBEVk5sYXd4blRlRWEzRTVUK1I2a2VlUFRl?=
 =?utf-8?B?VEhvNzF2MWhBY3NCNG1ycTQ1RzgwTFU3SVJzYjRqSkQvVDEyakhkSlNHN09X?=
 =?utf-8?B?K1owK0o4V2lrREZTeGsyNzlsVnlzY2xsMWhaZ0ozczNrbEpPc2wrNFVscHFW?=
 =?utf-8?B?K0tCSGtpRnNRUVljcURiWk4yYmJ3cTJTaXo2VlpabzgzUlZ5aFVMQkhDQW5s?=
 =?utf-8?B?V1FYVnVXbDA4VmdOanlMbFRxSVNDMU9wU2RIZ01VQm5NOFB3ODRRajRuUGhZ?=
 =?utf-8?B?VnZSaUc5WHRrVXhZZHIrZjdYVFBKMTIxN0c2ZzR3NXh6VllWdmo5d3FwUFpW?=
 =?utf-8?B?VExrQUFDUWRpc1dmdW1GZ09BQnp1NThGczF2eFhiRWMzT0ROcjIyajcyVU9C?=
 =?utf-8?B?UEkxQmpjM1BNY2hBaldkVjBaWmR0MGtUNnloeEo2UTJTRE1tZ2hOdjNoeldE?=
 =?utf-8?B?bjhYRkJzRGtYZmpHOXJNb3htM1JrRVNvRmVOVjE0NjlxdE83dFNWTU82QXJq?=
 =?utf-8?B?Nm5DYUZSWVlFUXZ0NjhyWXBremJnTVVRbEZ1cVhqOStGYWh1aTQwdUpkTmJi?=
 =?utf-8?B?Mnl0WEFVa1FQeUZzSmZrSW9kZytmd1RuN2g4MjJWWVB3N1BQTmRWajJKbjlr?=
 =?utf-8?B?R1M4Z0o3MUlCZ3lVaytuK2pmY3NXVnd5VU4vMTFaL1hEbng4U0JqM3F0djlo?=
 =?utf-8?B?K0dEZGRiemQ0YlVBbWxWblhRSlBDVzNVU29zTDJidHpDbm5jRmNLQUVzWTR3?=
 =?utf-8?B?QVlLT00xTkJNbkR1S2txeU1NaVBxSW90V1Nic3JVN1F6YWV1WFU5ZWplZWc4?=
 =?utf-8?B?RUtpQ3hCOUMvNGtYUHZVSGM2L29welZRMzRmVXJvdkYzMmhwWG5qYVkxQ2hM?=
 =?utf-8?B?aTYybW5sQ0ZIK29tOE85dFhIYzc4bmdZbEo0NkpVdld2a0VsWWI0cmdSV3pu?=
 =?utf-8?B?SXU2elFhYVpJTTRLQ09MSzNKMzFXcnR0eU1JOW5IYS9ZQ1g5dmcyUzJXVEtW?=
 =?utf-8?B?NVErUngrUWs3d2lnQzQ2R2tOUnpkaXVVRi83aXJTTEFMMFFFRmhURTY0bm1K?=
 =?utf-8?B?aG5obTFpTGtLbm13ZmNFZ2tuWEloTTJqQUZyU2FwVXc2R3BxallvZ3Vtajkr?=
 =?utf-8?B?NjdUbU9UYWtoUitDTkRidVNrOTVHUWZnVTRJY2dNejkwWjh3ZHRIdkk0WTdQ?=
 =?utf-8?B?aEVYOVNrYzd0OWNVd3lLTDBFYmNuSnlRbGJmejJjQzBNdTRsVkpHZk9uQzdo?=
 =?utf-8?B?QnM0dXJtOHliOStwYTM4bU9uT3Q5MmxWVGhDSXN2OEZmQk9RaDRrRjlJUlhS?=
 =?utf-8?B?VDk2eHQ4QWxrYkc2UFJBZFlWM0ZVdVp3R3dMaHZ1UUQ3cllZb3ZmSHRkWXNl?=
 =?utf-8?B?Rk4yZWt1YjJ4Y1ZIbTg0aTZYSTdBRkJ0eXBOSFRub2VIS1JFb2JxeGIyaVNz?=
 =?utf-8?B?VjdLL3hZcUdkTktCL1RiZm5WdW5sc25yS0JBNUc3RmJSUnJORWFxWFFkNU5h?=
 =?utf-8?B?MVgxNXNib2ZsM2FPa1BpN1orby9MQU1yKzF2U1ZKZ3JYYWlLZWhvRjBEaDJS?=
 =?utf-8?B?VC9vUGxRTko2YzlER2lIN0FQZDJodmY2MGhUL0RGOWJkL0pIK0RMbWxJQUtJ?=
 =?utf-8?B?VHgvSllOd1kwVGhWVFBGak1vSnRHcXptTEtHeS9pcDdYTVh2V2xrOWpIOEtU?=
 =?utf-8?B?QWRGUTVkLzFKVkFqczcwY0lqUVZLQXFDNWd0bzMwNm9JTmVtSERDdkY3a1Y3?=
 =?utf-8?B?MDFxZTl0aUcwRHpTVml1Z0lHTGtxbDh2c0pZZllEMGxxRjhhQ2xLVUhWbWpz?=
 =?utf-8?B?cnZPTjNCckVzcW8zQlJRa3BNRy9rWnozM2tkUDZHOGI2dDJvN1krT1pHOFZw?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c4da72-7ce2-4916-689f-08de1261ce99
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 18:27:22.1647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqmthOyUloi2R8pUl4PylI74oOt6u0Zj+UIQUMCszpFUsCs4/b3kpI5JwekmOuGTrvEcoRMUGnH2Oa85T8GvslyAoopJD40oCk3Cofer5p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
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



On 10/23/2025 11:13 AM, Zhanjun Dong wrote:
> There is only 1 place that HuC authentication is critical, changed it to
> error to avoid tanited kernel on assertion failed.

This doesn't explain why we need to avoid the tainting. I would preface 
it with something like:

"The fault injection test can cause the xe_huc_auth function to fail. 
This is an intentional failure, so in this scenario we don't want to 
throw an assert and taint the kernel, because that will impact CI 
execution."

>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..2ae48dd234ee 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -220,7 +220,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>   
>   	/* We don't fail the driver load if HuC fails to auth, but let's warn */

As Ashutosh already mentioned, this comment needs to be reworked as well.

Daniele

>   	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
> -	xe_gt_assert(uc_to_gt(uc), !ret);
> +	xe_gt_err(uc_to_gt(uc), "Huc authentication failed:%d\n", ret);
>   
>   	/* GSC load is async */
>   	xe_gsc_load_start(&uc->gsc);

