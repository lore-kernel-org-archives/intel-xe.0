Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD9606B711
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d86YCqSj;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XDXz4lDJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DAC10F3F8;
	Tue, 24 Nov 2026 09:48:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4555210F3F8
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795513694; x=1827049694;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=sXvWmj465ZAIruc/SVuIZ2nLcbga744Vzo5CuiDv/B0=;
 b=d86YCqSjF20JXa6NclwtdoQrWKYenoODm0cEOWuFEr4zalZGYg9ACDdf
 lb/ynjVmWuaO+Vhw0dqyV1AFxsRizJBxgAXna19dIWB6y7kmC4r5mgcR4
 5nDJU121FEQ1QLd4vnDR9q6ghnEDhQHMACRtfC3eauVwtluKDlL1tCIXm
 +NFzCaXy/deIau1cQHsSNJH/Za4KiLwZHwTbK38OShp+0cZzvT1rG/tlb
 mmvIHlVUTbvYx3hDPiNTVFq/hli9MFvztnwwxtteE7YVcHzj4XXFeAUMB
 PHaAoMntuDS/SBk2RcLeaW/fxwwrxqFDHpGyr22q8FSV5cubyk1ncIsVs A==;
X-CSE-ConnectionGUID: O5s5JtqSQCCx1pu2anUlqA==
X-CSE-MsgGUID: aOLig39BQ+u8ijjToaRTDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4363181"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208,217";a="4363181"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 01:41:12 -0800
X-CSE-ConnectionGUID: dyYc3NdlQ7eNLtM4aqH0wQ==
X-CSE-MsgGUID: izPaDuQXQuKCIdGpvJ9BBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208,217";a="11493431"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 01:41:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 01:41:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 01:41:11 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 01:41:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsuTYkfUf79asOIzcCiD2ZDBBy3zcBM3oe0rYv9lXazdOEC2oFF1TdkS5zyfUyJvaCyJHSbYCeIXN5AQsjs6D9BMKs8EZq5BztUPWNUhLcv+RHTBI2KaatjWsdvcg0mwo57pbaqUjCC85QEzyr2bXCXGD2svxLLIbyTQSkk1mXPiWxv4m/CtdGDgsaYxIe/gVCAJndfRk+YjNNgl7xB566Xg+MANpDgrJOUvqCoAjCPSFCCDZTSDFcpK7UCjQHa4eHWJHuQlHNMoZxqtsQVos0/eVE4kiKSVPMS/W0lPeijW4rUZ/OeNTQzJhms5IX08vQVvfuFUkvBod36UOzIVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqPpsDMlMASGQb1sTK7HjRfYB8gHYKqnETsoZqKwOf8=;
 b=LMD98KW0qwYXtcKem2hHJp37z/pDhxJEsFLDRUtN/jtY7UJQs7zYS/1Lo22RYLuTnMOQBtVAiRQLAlzM/AnfxOrhDdbvjG32g1iD5cXyPak71flWcX4f7Rz7gOD7ceNAJideGgPQsVn4x/gAwyHq3f4fMoXfi0n3xhZLnY9CZ6NXz1STK4n2JW26CO2o9uzEvuVt8Sv8FndW8wjvN5w9EUuZf81uSrgtBqKs1CW3pq8fRj6PhLwzF3h0UIGNCLatGuxgcqf0VvwFow5irzYU+3nM9zhndzgwVnGDfEmItepmsipF0AtS1lyY25AGENwh3uqqeHM8gzcsibmw9SxOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqPpsDMlMASGQb1sTK7HjRfYB8gHYKqnETsoZqKwOf8=;
 b=XDXz4lDJ4YiiHZCdrj4ifnMwBjK+4avp4FAPuLJSalItZm6hibQljkII6gUAL8gMhg8sr+v4t6mfRgKUuHffiX57rj7oqct+cQYxx3RLGqRfxcI813InkKkzT6w5FckDpEWyeOAxeNbY2u4QYVuoz/UMeJqcetDJc8e0YtAHii4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 09:40:15 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 09:40:15 +0000
Content-Type: multipart/alternative;
 boundary="------------SQBdRublE3KPwNt4xFxqIf1b"
Message-ID: <b4c1113a-a102-4dcb-aa2e-9f5a9837a30c@intel.com>
Date: Tue, 24 Nov 2026 15:10:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] drm/xe/pf: Explicitly use shareable GuC doorbells
 for VFs provisioning
To: <intel-xe@lists.freedesktop.org>
References: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
 <20261026104224.1018993-5-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261026104224.1018993-5-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: c186245d-31a4-493a-54d4-08df4a0ef153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|261021123027099003|261009223027099003|4143699003|11063799006|56012099006|261021121427099003|261028144727099003|261102123227099003|261022105027099003|261026121527099003|261026140227099003|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: E9tVLMxqIQm54Q2BGAH21rCS66H2uXucRRFtZLs2wrDrSY00gIFI/L+e3pINvFpgO4tUCwCrN6WifBAGbtKbNl4Vj84q1mJ3sa0N0Rwje1xyROfGOCM2E6t/ZMqsYOofHAjuo60YFh1qM4HQ4JIAYadwruhWxyio4NH4r6+fkDQbEjLSLWjHQssZAx3Zoil6Zi5QtoIptmSBhh8l/l7pJpAJBIgGnFxeBwEm9kJWn2phAKWI4gvwFKnjn69jxkh9c5bbu1vP6PDdijoFt95jDlGwdrRkDttWFL0UD2ppt0r0DX3ZBjyK+DQNmBoubyhyInXe5+Zcy+IDCYfZt+8qigYYk3AM7CucQtfRtjNIvt2dYk6kJWaLACF+ZDtVo0kuARUAGm6NY+3I05e8h3dAdmZ74UHUSZx1zA6UDqHdbvouAjnGU7V/6KGd4B7ff018e4A9bBeRrwJXAWiz+DFrKMKxxjsKg/MgmJrBGbDc3WBspOWjSLsqVnn0mwlDyUwyIftHD6N4e05Zar/LAg+SREivfm5L17n0arNp8+1mhqHnxVc4zielWcBlh9hEPCtK5N+RysVldsGqrqryicSCqdkCFKffCTMLBAun+P0Lrn7+FWYJpvMZlwUppKnPAeQcGqJ+xuux8WKTG7rHfHgKmjSOSh0skGwi/IbVBraki2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(261021123027099003)(261009223027099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJKbFpWUXp6S2cwL3hKSG1pbHNPOFd3K2xKTjl0SXJBZ3dhRjVKTTRjbFJX?=
 =?utf-8?B?VUJlU3FiQ3VnR0s2Z3JGRUNZZCtIYjBKNzJJT3dWM21SUW5QcWVQWGdQM0hF?=
 =?utf-8?B?SEVhbHd3bTRXZ2Nnd0ovQjJOZmU3dm5nb0JSY3lURFprTlNBdW1nVm1qQ05S?=
 =?utf-8?B?RVFwYUpsV0xsOXBKeEFZcEtiVTFGdExHUEJqSVZhQVArTS9BbTFwaUc3MUc1?=
 =?utf-8?B?SjJvVThWOUlpblhkYTkzQUJyNVZQQmJVcWlObmV0K2dqMVZMT2VqVXlRVXZB?=
 =?utf-8?B?LzY0ak5VVFNpVU1oU2RRUjZqYi81T2Z6QyttejFHZDZ5djNSVmpzS3VvK250?=
 =?utf-8?B?SExHMEd4dDBWUGdMeVFyZGs5dGRmNlJaLzBodm16MVlSR2hTUW5sbHBiSDMw?=
 =?utf-8?B?NEliOHJtLzNVRXRGNDNOaWwwZ296a2ZKTHE4eVc1bG5naDh1YlBVejZUdC9T?=
 =?utf-8?B?UVFGSTZRbFd1UCtBMGRTWG1IK3VOTE9COWVrVnlSSDF1eURtRU9xcTQyWXV0?=
 =?utf-8?B?TEd4Y0k4QzlwK3RYSk5LaUtVT1R2cm1IdXh1T2E5MWRZQ2NxTXpwZ1RaSFJo?=
 =?utf-8?B?ZS8zMDNlbktYTDAyTDFwYW9nV2tvYU1VUUVWcDVoWUEreGdSU3AreWVLeHNp?=
 =?utf-8?B?d2FrdW41alVxUTgvZVU0blhyVHFYYjIvOWJmTHkxSUFjR1o0dCtqN1JIM2RJ?=
 =?utf-8?B?OTYwd1pVZUVkSS9idlVSZ3Vqb2VrVWdVazF2Yk82dVF6N2s3aXk2UXZoL3FL?=
 =?utf-8?B?bjJzeFl2ZUlYZk9oZlNhb2hXL1UxZDNXYVNQRVU1WW43aGZtUDlEOVFsWkFG?=
 =?utf-8?B?Nm94dUVYbFZKcHI1a3o5Qk5KM3VIVmEyVHFFd3lmNWNUdmh1WE40c0Z1UGlV?=
 =?utf-8?B?b2cwcUFUNkdocHRtUXVOWCs4dDNQKzh4K2pWeUxrVnN4b3I5WFBJU0xjV1FF?=
 =?utf-8?B?Yi83WWt5WkNiTktCUzBhcmprY2pFRWNNTmMxYmxoZTNSSXZsUUo4YTZ4Q3Jt?=
 =?utf-8?B?aitRYVhDcVR5S2hlUTErTHJ0K0Ixa2pnejNwMHJjZm5RbXlnczNPZW85N2Fp?=
 =?utf-8?B?d3hab2h3RWcyeWpKc2lDNkxQMllxd3N0aDdJSjFtVDhGTmtkWGswWWZPRlln?=
 =?utf-8?B?aDFVVmZZVkExRzcvV25DVlhFUjlKVER5RTArK2hKOC93TGxtYVlKRm96cVI1?=
 =?utf-8?B?SnlNZ2N3SkNrdnhsam45Tnc1elRzRUtST2l5aW1lMVczZTI2TGovckg1dmwr?=
 =?utf-8?B?QXN3QWovYktHU0M3clBUcE9hQ2xLVGsvRlFuOUl0Sy9NeWdyV0FOSXlsV1Ry?=
 =?utf-8?B?UWI2V3c4K05Hc21GL0FDK01BVWJUYk9EY0x4K0pYM0ZxQm04VllBa1ovMXdt?=
 =?utf-8?B?S3BPamhGRmlTOFN2WVZXTEFGaTFidy8rOStPZ2JpRmI0SHUxR0k5MlJVMVNw?=
 =?utf-8?B?NURDYU1mOVpEY1gwcEFTb3lqdlZCRGt1bElsNHhZT3UxRU9VZ1hYdXRianNO?=
 =?utf-8?B?T0J3QnNLZnBrSGhnY1JXS1BCODgwS0RtdC9BakRFaWVSck5Wek5HdG1TNkdo?=
 =?utf-8?B?dTkvOVpsa2dYWVBQRDFhZzY5WGFkTENLcnhjNEpIZjRlQ1hpR0hJTjRlL0c0?=
 =?utf-8?B?cGwzbjhKbDM3L1pVZHpSMEkzcjBmQ3pqcjdycGFtbnh5bElyMG1UMEwvUEZl?=
 =?utf-8?B?aExhQ0RaZkRRTTZSTmFjNm9QMFZMOEFSZFkvaHA3V2phbDVuUnJFbnBMR3Rq?=
 =?utf-8?B?UVFoYWhmaFRkSkhYR1lCTVV2MHAvT3dtaDI2QjhWMGhoL2NDbDgzU2JqNjl6?=
 =?utf-8?B?RFFERU5oVVpRVkViUHJzNCtvcHBDRUdwUlppMFA1eSs3dE8ybUh4L29aazF3?=
 =?utf-8?B?YjdOK3BVc1lJSGczbUNHVUFRTzhHVWV0N09ESGNsYXVIeFFuSTQ0Z1d2Vk1R?=
 =?utf-8?B?NEZHYTBETHhjU2laZkJmWjNTUEYzUVlXN21zQU0rNXhBTUpCcUFiVm00M05F?=
 =?utf-8?B?WXpoa0JhSVRrOEdtYmVSVklCL0JnYWpmMnBnUHFPUEZPSkpmR1JJN2k3Lzkx?=
 =?utf-8?B?Z1BNdk1EUjlYdHMvT3NseVB0akZ6eFNCRk1vdkFvMm9OYzZzaTA5bzJPMU5L?=
 =?utf-8?B?YzVoU0JFK2pIYnhGOWdIWHBnSXVUOGdqWnFZL3prMVRzQkQ3VlkrMVl6aWRn?=
 =?utf-8?B?RUFCMlQ1dWUzVzVMeUJxeTVNZUdTL3ArZ21vamNQYmh1MUUrRnB4eE1heDhU?=
 =?utf-8?B?NTFrL0Jsd0pZdWhnRXlOZkR5QW9MRHdnY1J4b3hwYWZsWXRyMTZXTWNmMWNu?=
 =?utf-8?B?SmJ6ZVMvNDFCZHcvZ1Q4amQ5ak03Z3M5YktuUVZRK0pIOFZoaFVSRFQ0WENV?=
 =?utf-8?Q?XkWHvVPNnT8a7uf4=3D?=
X-Exchange-RoutingPolicyChecked: PlSu+iksruMGd+NBTQP/cR88rJDaW5fylsIAYw3uvtULUSIOFPuZ5MmsLiGTjWq3IOUOksvhIAVHqc/aWLxuLlt7s9eS551gCKuP4dw+RsLFgNj3wwC17xV1IR0XuaJtOWm08SiJf38XnBPWLRW9hlYETkB2Ihoj7+jdsRYuCtRYS4CIwP63UdE8IqJZtG7u+5+Jo7Mlg/NR/B6JSPB5xul8hvykVAFEOFP5qR9WPFVboybP9yfF0pkbwEagX6IBdibWpoqJA4R6POfQ1zdO3e6IlaQYk9sINX+rMsqGMqy6UrtmRji1b2Bi4oxJx3fk9ToRUV+wX+yt2q2kRgUk5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c186245d-31a4-493a-54d4-08df4a0ef153
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:40:15.2408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVv0EU0pcyWodb5M1uPsDJxgukt3pzokvnIMOPjsCPrLAMWfLuR/frgMvXS+2Cza5eykRj0q8UaEN1dp0gQSox18+0UhJ5alQL4l8e88pws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------SQBdRublE3KPwNt4xFxqIf1b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 26-Oct-26 4:12 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Switch PF VF-doorbells provisioning to explicitly reserve and release
> doorbells from the dedicated shareable pool. Note that shareable
> doorbells are now reserved starting from the end of the pool, the same
> way as GuC context IDs, leaving the lower doorbells for the PF use.
>
> Also, let's remove the legacy GuC doorbells reservation API now that all
> VFs provisioning paths use the shareable helpers.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> ---
>   .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  4 +
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 ++++--
>   drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 90 -------------------
>   drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  6 --
>   4 files changed, 20 insertions(+), 105 deletions(-)

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------SQBdRublE3KPwNt4xFxqIf1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26-Oct-26 4:12 PM, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261026104224.1018993-5-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Switch PF VF-doorbells provisioning to explicitly reserve and release
doorbells from the dedicated shareable pool. Note that shareable
doorbells are now reserved starting from the end of the pool, the same
way as GuC context IDs, leaving the lower doorbells for the PF use.

Also, let's remove the legacy GuC doorbells reservation API now that all
VFs provisioning paths use the shareable helpers.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 ++++--
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 90 -------------------
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  6 --
 4 files changed, 20 insertions(+), 105 deletions(-)
</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261026104224.1018993-5-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------SQBdRublE3KPwNt4xFxqIf1b--
