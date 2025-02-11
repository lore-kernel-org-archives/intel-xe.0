Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D662C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 16:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172F210E6FF;
	Tue, 11 Feb 2025 16:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gez0gfdA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F241810E6FF
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 16:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739291018; x=1770827018;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=O+ONh5AXvpjvvyGeuzHZlcuyvjmOBM+aCOqTfEwHvsY=;
 b=gez0gfdAHwjX+1aSjQNY67BjhSpMRp9XJAnurQ4NwbyWuhJgXGhAvOJt
 LZKGYONC6S57VwvYeOsqtMetde7J8YFJavZYuY4gKpZSngKhvKp0LwmAh
 6Rs3zQHJFYept2N179Jrl1EsKmHrjHjZlU7K2CZeKz5f2OK6JZXSsx3Cq
 4SGOiV+MAFUZRh6JfEr6AZlyRTDWnHMp7IxP1NEI+vLUWPg3FZNmdlDlP
 MbDrdvr8NCyrR/BSFf2Y97UQ9OpTaAFhOaDNzDi7pvCdG+mwYJWMCDva1
 5j9fZ0CzUalPh9F5qISqcWgCEL9NSOoFyFk42AKHbAEI0Hi9vYUNIBDg/ Q==;
X-CSE-ConnectionGUID: ML1RuzJrRYC4+q2gJ0CeGA==
X-CSE-MsgGUID: QWL89OgFRt28BmcZdCSvFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51345427"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51345427"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:23:37 -0800
X-CSE-ConnectionGUID: hGP7Y3eRSOOAVbmNHgFVFw==
X-CSE-MsgGUID: 2rHTgvN/R6W2w+qmTvLGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="117638974"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 08:23:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 08:23:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 08:23:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 08:23:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rafeNq0ew5HYA32G0vVnh+fS/r/YvunCpkWXa/KDM4BtbIKzKdf2eT+hMXn4qD6kmApK1zbHiDoZLX3cv/QI9tW5SlpRvcfckXweh97sglOZWxH3IUKeEtygJV3Mn5d77l77rWOp0IcS/Q5EKf8MZUu+pXFLuSQ74MYB2rqka4UJ2GiQ4tpNEWrb8yx1lQSr5WwIsB6/pCRL13Q9FRhAOYrVCKWH5oZ4Emzwpk7QPmGMPi79B5unBLExhersSNIT7zTWpcEUvlDMACt8sPV2A1b/3+d703/Vz/cgeKH1pWihUZj7TwG35c+ipsg9IXu01szjQ3WR8aFnheGF0lv9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7u1WiSPwe3QwtZSk66YRuoN+d46HPYO0en6baeCld4=;
 b=Yrf8LdrvOf/Dd00WZE5kXnUOvgkYjYArcx4swxVoo1009CdamQDWAyUmDtnoKafSotjA/aWCcXeU2iwA8WOJjIqIqpr+l+TZacshdPrZFG/m+tj78U7QG3fAvSnWs75oC/uAZP1kDItP2+hYRvWHCUPiVPqPNMUE8H9u/tpBI0KZNnE4irMNVe6A8/8paGWxvlxzt8rffS0VEKweElozSwglg/EEmMouAclzfqSdqXVcFeXFf/lPB1kepMr9txv0qXTrkA+UStMLBCvsiQqyt5VMxwvKLyPao0RlF6tLOY6km52wFRQpnRpe7bTqTemWGR8cNrHfOppgQOLcqfNH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ2PR11MB7669.namprd11.prod.outlook.com (2603:10b6:a03:4c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 16:23:31 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 16:23:31 +0000
Date: Tue, 11 Feb 2025 17:23:28 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/pf: Release all VFs configs on device removal
Message-ID: <20250211162328.qivtsljhoj3fqlwl@intel.com>
References: <20250211155034.1028-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211155034.1028-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::43) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ2PR11MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce30765-0038-44be-66b7-08dd4ab86cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eStpa21nMEw2L3B6S0gyd2lQZzdFeWNYeUZRTEtreXkvdXduZ1ZmK1NSZ1RS?=
 =?utf-8?B?TVl5NkVnTmx0YTU4R0h3UnBrRm5JMFlkTnJKdFpwMk84bmVSZGk5K1dwNnE4?=
 =?utf-8?B?RS9OODZQNEc4aTdlSUhpWmNKUDhISW91ZXYvZHhJa1ZXTWxzTTVYclBuczVS?=
 =?utf-8?B?V2tRc041ZzhLaTU4T1c4UnNoWDRIUDJoY3FVUmhpa0kzcVJRcnAxUitvZE9w?=
 =?utf-8?B?TzBEa1JMNHNYYkRHUm1jSUxCMXZaUnBrSTFTaWVyVnJ6ckQ0ZnoyUzFqWUU3?=
 =?utf-8?B?dm1Mc2ZwR25FRGtPOGx0bWNIV2xESWFQcUVJQ2hpMUZaczNPWmJRWVF0V00r?=
 =?utf-8?B?ZTYrT2ttWERoOUUvUFlHSVBHcXo0R2tvTXNBUTNPdnJhQUF0WW5GNDRueWU0?=
 =?utf-8?B?dFlocU9mVjF3STJESTNodWoxZE5zUjhyTGZJelhKSE5xNlZEelAzT0MwM0lJ?=
 =?utf-8?B?WmJITTJ0ZEZHdU1vR2hVaDJrb0hyZ3pGQzduVHRFRGIrNnVlQWdjMlJjR2J2?=
 =?utf-8?B?L2dnSnQ1cWdpTXFnT3YrS0V5MzJTZkFkTEZZYk5RMU9NRmdKUndrL1grQjVM?=
 =?utf-8?B?Y05FZWl2bFhTeFpWY2RVN05ibzJTbUJYbzlaZDB1ZGx3dE9tbGlIU3NUR015?=
 =?utf-8?B?a3lyRzhNeGptMHNSc3duazZqSnBzUDlJRDIvTDg5S3kxVFFvMldFc2xwRlJi?=
 =?utf-8?B?VU5jODFCcS9kUkJTVTdWemRlZGlocEM5SjcwTVJacDdGZDloaGxKQkNzbVNQ?=
 =?utf-8?B?dG1EMjNEWStwQWs3MDNTOSsxODZpZ3NBemdoeG8wOEhrV1V1RnRGY0d4aVBO?=
 =?utf-8?B?YzY2N1VlTi82bzZqYzBmVFh4MFZsVTFidngrMkRSZHU5aWxKbnZCQUZWYi9z?=
 =?utf-8?B?K3ZYZERWWnNQWkFoQjFESG5WUUQyYzJSak1ZbGhiODJkQ2xqOXk3cngwTnpk?=
 =?utf-8?B?VTRYM1Q5bGtXdFN4QkdkMXM5ODd3dFJMaU1pbXRmeFk3d2k1cHZ6S3RtOWE3?=
 =?utf-8?B?ZUlSM3BPQU9QbkJqejJjRFhycjh5RUcxbVBXbXdJZ0tFUndibTBaQ1RRbVRG?=
 =?utf-8?B?SGdNMG1DTTdBNndDZERCcjA3cEFwRFQwc2hnNHNGV0FxZlpKMGhTK3BzbW85?=
 =?utf-8?B?SnlEZ2hhQ1hsVnkwNi9TYXZSRWdzNURRMVp1Uy94WCtHb05hT3R3OHZ5Mm8v?=
 =?utf-8?B?YW1vSUlieTQ1MWlsOXBVQzEzc3p1Wlg2QThiNWU0OWRnaGtRbHdUTlBGWmRq?=
 =?utf-8?B?aHl4bUNERmIzL05ENE9yQXEvRDRzL0ZQbHlEQnNtK2JYSWJLU01MV0MvWnNX?=
 =?utf-8?B?K2NldE9rYUpZejQ0eE9vSkhyMUcweVFPLzBlM2p0WDFSbXUvaGZIeTBZUU5a?=
 =?utf-8?B?SWl0aktMYktXN2JZekhaZXFLT01VSERtMDhtZmFiKzhCMGRhSUNydnc0aG1O?=
 =?utf-8?B?a1BSUXlGWmZ0c0o5U2h6YTJpbFF0QlM2czFMRlUxYmpFenNDRkdTdXBwcjVO?=
 =?utf-8?B?UVlyZjRyWlVCcmsrdFo5WVlLTVZlQlRYUG9vc0RVZWVmdDZkVWVRN2Fld0tu?=
 =?utf-8?B?WVBOZWNpRm1KVENUZHFlRHBXMTVZQmJmbldHZnNhK0x0enZibkpWekhmVHlP?=
 =?utf-8?B?aWpheDdySWRTUEduaDVTNjNHRWpqSmJMQTZpdjBRRUtsbjZtTE9zYWM2eEhr?=
 =?utf-8?B?eEFLUmtvc08vdmFsWmtRMG5mZWx2Q0NabEpVUVBYdWRwaDUyV0E5Q3plcjk3?=
 =?utf-8?B?c0tLRzVYQ2RZVmRROEpWZDdPVXlOTFJueUtyUURqV0VJcDNHOS9KRmpRS0tF?=
 =?utf-8?B?bml0Q0lDUXZ0cnNDT3YreGdkY3prZ1RmR0NyY3U0NHZwREJNMHJYYnBEZ1Fl?=
 =?utf-8?Q?Qkeav5liMdIHZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0gwOWRSaTJYZ093dlM5RjdBUFJUTnF2N3A5RTZ5RGM0RnptMXdTcmdvUHlB?=
 =?utf-8?B?ZGNCZlRuejIyc0E2cWIzRFVZbGpNVGxSNGVlL0tuWTJWb0tLdno1TmlLSDBL?=
 =?utf-8?B?RHhIejFtdjVpbWlYVm1UV1dTeUdRWEZQTHVickdNN0taejg4OGlydmtoYnN0?=
 =?utf-8?B?amFzQURPNHlCeElaZGgvaWFOc1dFTFhaQzlyZTBoQ0d4dkpaRFRFYlB3a2hT?=
 =?utf-8?B?dDltdHdLU3BmWXFUL05CKzcrK0N1dVZWOXQzM29MNjFtanBybE9tZHU3RXRL?=
 =?utf-8?B?eWRqejNFa2h3U0VMNzBMS2M1MzZKQUhRWDhZQmhTbi9wbktsemFCclNYUUJn?=
 =?utf-8?B?T1VOWklvdWhtcmEybkZpL2M5c05DaUkxMm5NWjVOU2JHVmQ5MjZueHlOS2l5?=
 =?utf-8?B?NVNUUmc0NWtkbW03QU5XYTlxSW1Va1Q1ZU1kLzNEVHhNK3IwcWNwa3N4MHpj?=
 =?utf-8?B?N1JSN3NCK1BLMkZjemZqQVhNck9nR0lDak91MXJ1TzRQWlF4clhnVisrUE4w?=
 =?utf-8?B?MUNrYXNrUUpEc2NmdmxveFQxYm4yUlJ2V0RESlFZZE1peVU2bDY0bjdFK2hI?=
 =?utf-8?B?TmZBNnFpT09RRVFVVjJRaU4ycS92YkZnMjdoOXlFZTcwMkVxUTVmUVZaM1B1?=
 =?utf-8?B?aE1jRzhGVEhEOUpXd01wVVpNR01lcG9ZWGNwSHM0QXMrbjVkZ25wSlJkRXJq?=
 =?utf-8?B?SnpXRUpEUlpXUmVpaEhmQkNuYTU3T01jd3d1VlAzTXFkWkFETzljTXBYbytQ?=
 =?utf-8?B?QXhGMjhDVXh0RE9WemF6WmtYcWt4TUVnSm1Mbjc2L1hYWmtFZy9SOG52cjNR?=
 =?utf-8?B?cStMYWRqWmRGN21UVFhuUUdQMVBEWnNtVmZHWEM3ZktwZFlCa3pyd2pXd1Yz?=
 =?utf-8?B?Q3l1Q29oZDJ3czV4cThtQUprWnVMazhvTzZkVU1yTFdoQnpOYWV6eVFzV2NK?=
 =?utf-8?B?K2t6c1Z1M0JPZ0lVWFFTMS92Nk5LTmlKR2RVbWhldjl1ck9yd1lIV3hrK2pj?=
 =?utf-8?B?bmlCcTRWWHpDVkNDWDVqbTlRbnh6U0N3U3UyRmkzZUJCQmtKTHk3bTc3c1dz?=
 =?utf-8?B?Q2dZeUhBaWVEUE0wY1puWFcrejBKSVZXRmNRVWdLZm50R25XN0R1dkRrUjEv?=
 =?utf-8?B?Z3R4UmhPWlpzR2lPdjRMYllRZGljNHVaVkl2U01qQ1VhWDJyb21QMjYxemU2?=
 =?utf-8?B?d0pJZER5a2d5MzBJV3RaelBxMnlSdEd2b0NiY2ZucGYvRHEzT2tKY2M2VjRa?=
 =?utf-8?B?Y1Z3WG1KYmpaVFlTcmRkT1hsUG9JR2dhQjRCdnRGUGROaUFnREd1RkZ2M0cy?=
 =?utf-8?B?MlFJUmVwbjNCTkRTdWtheU5XSkNaWVFYUVpUditEek1rYkU1Tk9sMGF0VTJi?=
 =?utf-8?B?Zng5K21iZDQyNHN2YkNVY25YSzdUb0RiRlhlQmN1RnRPKzZiS3F3M044SXRV?=
 =?utf-8?B?cklCWWJwLzFja3NVT1RwbGdMQWJqcjIyN1BSYXFIazFrcVRYdnQxMHZhaGd3?=
 =?utf-8?B?bmF2NjJ1clgwN09BS0xscEkyU3dpUmlNSnNqd3lBRUVpRmh1NVNjc3U0Nmw4?=
 =?utf-8?B?NC9RckNoQnJNQkNYbjYwWUdxSmo3bmVSVlQvOHBqTHNNdGQ2eE9GMUxJTzJE?=
 =?utf-8?B?UEpoSTJpcXl2WTVzWnhMV0hVVlRTVExwRzhOWW5jL1l5N3BjMHBvWElEeDZ0?=
 =?utf-8?B?aTlIbGtJYTFXUEJhVDZkYUhPbk5Yci9ER2lNbnRrN005enMreTRNZ2loc3pw?=
 =?utf-8?B?TzM2SEhhUjZuTHZKTWFvYVNGWFZqY1lRN1VtVnZMbnlTRkhHMnQ0OWNVaXdR?=
 =?utf-8?B?S2NvOExzei9LV0NmbUs1SURRcDhtei8vL1B2ZjJvTzI2dUN1VjJmMWtjOEdi?=
 =?utf-8?B?cERZUEk0UVZCOEFOdFcyVDYzYkYrWVUvTUlSVCtzZkRzaEJaVWNrYTV5K2Nt?=
 =?utf-8?B?MGV6cFJuNXFKVGc0MWZKUGFwU2RHL1pMOVJub0Z1V2wwNWhXaVpGZG9nVDJm?=
 =?utf-8?B?WTkzazgrNURKZXV1Rzk3ZEVMM2ErSGJ4TzVQdVpET3VibFpWdnpzWjJ3UW90?=
 =?utf-8?B?bDNpc1M5UWpCRDc4WDM3Yk16MFQvNXRhOEFueXFDOE9VS1ZnSGVCZ0JxcndH?=
 =?utf-8?B?a09wOVpHamRRdU5BY083aXBSYnFyazBOekhqaDlTd3VRT2EvWTNCZENOKzIv?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce30765-0038-44be-66b7-08dd4ab86cc1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:23:31.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZbn7q9c4AeXBNCWp2zrX/sDyrS5vmZyJyA3FZOesrhrXuscXSAPXlFbLRIyL+x5qkPiCyTef0klqbibwIUF5aTbCMdhZ2oSHkbWoZor+Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7669
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-lut-11 16:50:34 +0100]:
> If we try to manually provision VFs using debugfs and then we
> try to unload the driver, we will see complains like:
> 
>  [ ] Memory manager not clean during takedown.
>  [ ] RIP: 0010:drm_mm_takedown+0x3f/0x100
>  [ ] [drm:drm_mm_takedown] *ERROR* node [fedff000 + 00001000]: inserted at
>       drm_mm_insert_node_in_range+0x2bd/0x520
>       xe_ggtt_node_insert+0x52/0x90 [xe]
>       pf_provision_vf_ggtt+0x1fa/0xac0 [xe]
>       xe_gt_sriov_pf_config_set_ggtt+0x79/0x7a0 [xe]
>       ggtt_set+0x53/0x80 [xe]
>       simple_attr_write_xsigned.isra.0+0xd2/0x150
>       simple_attr_write+0x14/0x30
>       debugfs_attr_write+0x4e/0x80
> 
>  [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
>  [ ] xe 0000:00:02.0: [drm] GT0:      total 65535
>  [ ] xe 0000:00:02.0: [drm] GT0:      used 1
>  [ ] xe 0000:00:02.0: [drm] GT0:      range 65534..65534 (1)
> 
>  [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC doorbells manager unclean (1/256)
>  [ ] xe 0000:00:02.0: [drm] GT0:      count: 256
>  [ ] xe 0000:00:02.0: [drm] GT0:      available range: 1..255 (255)
>  [ ] xe 0000:00:02.0: [drm] GT0:      available total: 255
>  [ ] xe 0000:00:02.0: [drm] GT0:      reserved range: 0..0 (1)
>  [ ] xe 0000:00:02.0: [drm] GT0:      reserved total: 1
> 
> This could be easily fixed by adding config release action.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: add explicit assert to check PF mode (Piotr)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c        |  6 +++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 29 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index d66478deab98..c08efca6420e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -89,6 +89,12 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>   */
>  int xe_gt_sriov_pf_init(struct xe_gt *gt)
>  {
> +	int err;
> +
> +	err = xe_gt_sriov_pf_config_init(gt);
> +	if (err)
> +		return err;
> +
>  	return xe_gt_sriov_pf_migration_init(gt);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 88bd9d97ba5c..10be109bf357 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2356,6 +2356,35 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  	return err;
>  }
>  
> +static void fini_config(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	for (n = 1; n <= total_vfs; n++)
> +		pf_release_vf_config(gt, n);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_init - Initialize SR-IOV configuration data.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	return devm_add_action_or_reset(xe->drm.dev, fini_config, gt);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_restart - Restart SR-IOV configurations after a GT reset.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index f894e9d4abba..513e6512a575 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -63,6 +63,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  
>  bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
>  
> +int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
>  
>  int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.47.1
> 

-- 
