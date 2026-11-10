Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28512606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eJFuEyVw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8D010E013;
	Tue, 10 Nov 2026 13:56:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD1210E013
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794318972; x=1825854972;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Z4DRIk2MEAavxEwpiFE2gS2x5sgLbvJn8h+Oy2aCaAg=;
 b=eJFuEyVwKGIILOMy6mEBef4utNgGSJgIpVQIBkUiHSj5GCwClcu4tveZ
 3Xyp4B6Zy7zES8aDF2JCOjMY9sc3M7CPI+9OizkE2Mbyc36BnEXOIaiq7
 RleR6wYG3IBsh5S8+bOcdKOA/Z9pZtfCYDzOcHTHjFb9RwocG8DHgfXms
 2q8xgM6mUr9EYGiONNAE5YLEGMhnZyTHfYSSzJ1IOZsO6EKhPjFukpOi/
 MZYYe8XjBf4rLKOWXDYYiMKdOjIMVNggo+ExXN1MQSkpAqinobOkIhstH
 NUmxsHeYaMIt41ehxTMkSQ74uIhiUTSFgndCnqGPJ0kXmQf7DvVGYCIC/ Q==;
X-CSE-ConnectionGUID: 7t/Xuy2ATU+5kTCN08bXSQ==
X-CSE-MsgGUID: 2HGL5d9SSv6kdDSfPIVJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3099078"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; d="scan'208,217";a="3099078"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:56:12 -0800
X-CSE-ConnectionGUID: p/bY1X0bTHedpPlKum7uUQ==
X-CSE-MsgGUID: UCrGmXz2SZSpAIyfS6WwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; d="scan'208,217";a="9931645"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:56:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 05:56:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 05:56:10 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 05:56:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAH7q+zOCCaB3U9Pk2wmdefAzOsm0p1eu7S04Mwpgb94CySU89nEv9tE2hpY5MSSdgwkfOGysl6FSKPd1IDLmKoGe6D8sGOk0VmpfS8T0fJCvNcQi0A+4NzsXY8cvOylpKZxoeisrLxWLYyEE+lb9IwuSlpUJR4Q8frhVjo7Y3ChATVbrnnuUBadk4AuAikUw+QiixFj+w2+8zOMJ2Kd1lx4/HvpiGIkFWbbvB6zuqx2Iesph2mdjelVA105TGQhBFTdf3L6WNGo3bVbzoVEETfxycUwN5bvg8DZM/AZhmnAXkan/+KSqFf2qgTDV3YexIZVlRXvN7p7SnqEsFIiqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il1w51aNLt3VFIqziG6reUY1VPCIWOctRQyJbyWwKhc=;
 b=W33eG/nYjhfk/r4fd/fiK4JC8offj736dQvfyiSppuqMGBeKZ+9XzfrGURriD4o66858acHeNpC40hbIxrXoULzjka9Gh+1+Ul+73Hge2PZIFdlX5f1Qcce8LtCr0PqEVe6jbLHc8HMXJdBkTmXxfmoiGKttbadcT8Hu1yTa4iznyu8KD1NazV6h3rT4kWkM1M4ncyOm8LGIxHcqvWeg5cJubB97WUBfCuzCxMenRj2SZQqytmpE3za6VAmDU5IwS2kqHc8WFpK0/aJNQ+29Mn25xvU94FRpiQI5HufNRkmvCv2+CgOiDb6BHVG/eD3BM6OjgH4F/PCdhGlLgNzleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:56:07 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 13:56:07 +0000
Content-Type: multipart/alternative;
 boundary="------------xMr8bie9yKMa2jx2Tm0LvM1Q"
Message-ID: <3739228e-2de9-4e83-a676-e4d41d9fe41c@intel.com>
Date: Tue, 10 Nov 2026 19:25:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/xe/cper: Prepare CPER headers for software
 errors
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261105085348.1467925-10-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MA5PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::6) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|MW4PR11MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: f11e533f-6bae-4024-f6fa-08df3f325e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|6133799003|10067099003|261009223027099003|261009221227099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261028144727099003|8096899003;
X-Microsoft-Antispam-Message-Info: 39X1j0pAxrcLHGulQFboTuE8p0f1Gmn/ZbzsYNFIZybAOr03DVkBl0MuOHiYpnBnjwxdCyjBF0rg3YbzDq/7zYBpFt2WBscgSgsC5KAE00IzxoqpfF0HDjO/8EZVAbaTMMBuV6YPtTl0SgRDk1/QT0TNEv9GR5L8f8GEYRBeDZ1O4+uF5vd6SwNDUigwTV1U8T+9AHvG0Vy3eB/NP4oqtfMsL1ybu7/gPYjwjAnYCN/IB3cOzv/p6h4k+eihlu9pZPxzkfSsowl/C3AhK+FfYjk9hGYPHFVJ9C00cf8V5vHtL4mUAN5QgYBksmRh5nRCyKfqrcLGF/hBMU2xkuDwqR8CGU9rFZwasM6hMPkyPdpmhQNO0P86HmCxbQiXIbYEPTE94o3pEl1b+6NM8g+UFPd5cWFGwQtpb3y/Y0efrWNH35bjthnVkdyAiHPePDHrkO+HfISl3dpU8/gDNgl1BOG/WpOOFEYV9xSJn/ww48CTQv+d3sG/iqlO7iLikZMRr1iHIJ9NohPFAuwtgMUuNnK9XwOsoZCkoq/Hpqcg9KfXFsMP+IL67Zyf/81R0u6gRYkVYfyktHaPlqLRdy9yxnW66pnEwjSkIA7nf7BbUGi38lN2/8nqIVrf/jLmgO71R7dme1qIPY2+hIBWuFs9r6qgCEA+kfU/8ArY/lqXQaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003)(261009223027099003)(261009221227099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWlheVZRODNiNmJYWXdpNzh1cTNub0dzK2pIRC9ERkxTb0NWYkZJbmR6d1Jx?=
 =?utf-8?B?bW1mUjVDV3kycy96RWhMYzFpMzRRL0ZxVW1IdTdRMzE5d29LL2FTUGN4REJO?=
 =?utf-8?B?SUVPcHM2aGdOckxON3p4TTdKYTFaYzA1a1dGakpUUjNXTWJsZ2FWdkpqZXo2?=
 =?utf-8?B?N2tBZ1FJL3UwK2VyYVdQblo1UWRvYUoxbEVrRTJZR0Vib1o4cE8vVmFyMDZy?=
 =?utf-8?B?STFudHZEeVhjdmxzRnErRkVIUm5OMExZRlFWNjd5cnFmZ2NiOStNa3F2UVk4?=
 =?utf-8?B?OWhVN1FhcHQyYWVyL2IxRHNBN1M1aGlwTVdudnR6eHdvdXZ5SUFIVE84RmRt?=
 =?utf-8?B?T29YZXkrMTNWRnphOFBkL3U4QzNtUlpBa1FETHhQOXpHRmhQcnRpT3J0aExt?=
 =?utf-8?B?cks0RFp5bnV6WER4Z2VJZERxVjJETkhQd0pvT0tLeGcrZlcyQy9mejBoYUN3?=
 =?utf-8?B?Q214WkFScnRmSko3WS95VzMwVExSK1lVV1YwVzVQY0NMMUVnRzNubDBWdkhS?=
 =?utf-8?B?K3lZbTRHOEI1a2hjVTJRYUxsSytTSjBFUjczUnFXS2QwN1RZam9xMkx3SmVT?=
 =?utf-8?B?OWJoRSs1QmpaTkxwcmcySEhPNEU4NFFKWmxBR0VkQ2d2bjl0V1ZVOElsSVJD?=
 =?utf-8?B?TzFodllkakFiZTZyU08zV3g4QnYxdUdCeXZocVlRc2UyWlhOU05na01EZW03?=
 =?utf-8?B?Z2Uvd2ppUWt2ekZNYnBxb3VEM2pkNVkrK0ZYTWdZVjBneTlGRVB2RTd5ZTQw?=
 =?utf-8?B?bFdyTTNaZ0U0bGtOeTMwRnZZMm5qbXk5OGJZTDBPaUhiMDZqZ1RyMVViWGNm?=
 =?utf-8?B?TTJ0aEFvb3lUZjB4VlV4QXVtQ3VCcnN3cXU2dTVtb09zS0U3Wmd6QkFweGNV?=
 =?utf-8?B?SWtDV1hUTGtHRk1TRjhDOEladm9Fd2NNdHNsTnpocG9LR2U5SW5tVjJjTXNs?=
 =?utf-8?B?WFVFaGVuMTNDeCtVdUZjamVNdzJGVUhMdzhsVnRjNXBCTjBodjdmR1pLNk9H?=
 =?utf-8?B?cTdLWEFFckpZeFY3cTFIVG5heHd4UnhieHZjTnlvTUtXajRzRGlXOERHT1FO?=
 =?utf-8?B?ZDV3SVErWTN2NzRaVkVFd1B3L3JVL1htQXA0c3FOTVgxNkp1aFY0Rmpra3Vj?=
 =?utf-8?B?dnp6UDdsOVI5NGZaWjJVWWIzR3VzUWdQcWJ2VVB4a3BoQitLdU9GWGZXK0Fm?=
 =?utf-8?B?NVZZUEZscUxpeW1rRDBISWtRRldzVXd2cEpCYUh6Qng5aVcxUFY1Q1Q2VWJz?=
 =?utf-8?B?QW14aHZaVHBsMVdLREFUZnVvRSt1TnhPdUFXRDFUa2FtOVhjdVM3L0prak9E?=
 =?utf-8?B?SVgzeDNhQmIzTDFmMHpYTkdtTFV6WkZ5OTFSay9NdGV6SzY1UzJiZ2tObGVz?=
 =?utf-8?B?M2Nwd3dpMSs0cTdEa1NwUU15MzhvcUVOaExOR2ZlZ0Eva3kzTTRkNDB6Ui9T?=
 =?utf-8?B?azdQTW80SWU4ZHRlNms1VzFMNEJXMVVtZ1ZGVmRzdGhOZjhkZExzbzE5a0hU?=
 =?utf-8?B?L0JXNUpnaTdWVGpMSzBUeHIwZkh5blR0OVkzYnp5ZGV0dXFWZHZibnMzQzVs?=
 =?utf-8?B?RkNWR29uUWZuT3ZjQnNzR3N4Sk5vSHlyZzB5a3RuUkRmdXUyV0Y5MnZ4TmpC?=
 =?utf-8?B?c09LZFFxZW12RTBhdzFCcTJQakF3cHpUV0kyRkhtek5jSGtCRGJxR3JtVGhU?=
 =?utf-8?B?RlB6UG1oNGR6QjVTOFFFdy9NZWY4WmRTaEZyays4bVhKT2t3K0tublV5dUlj?=
 =?utf-8?B?aFFjS0YwNm1WQk1iVnhZT0ZtTVpMUzlXVGtkNFBMKzlPOGpNbVdTbVNkOGk5?=
 =?utf-8?B?bUpVRUNZekY3T1BIdzQ4UmxrS09ESHUvSkJPeWFBNmx0ZHplbXhzWmZQNHJa?=
 =?utf-8?B?YUpFTDhheWh5S2NpTkp4enRRSDQxUlpyYUJSUWt3U2N3K210ZE9jdUNZTjht?=
 =?utf-8?B?US9zRTcwS0cyQTh5Q3ZiUlUralZjSDd1WUhDLzB0OWxWTXg2Ym13OHVya2Zw?=
 =?utf-8?B?cFg5WEU5bVR5VHQ3dm53VjF3eTdSVnBWZ1ZOdFFsbDgrejRtbXJGaWU4czFn?=
 =?utf-8?B?dUlVbVVBZS8rbkRvMXlhNEM1TGJ2ZE0vdTNodGNHdDJpVlpyT1FtQzNaUXBn?=
 =?utf-8?B?NDlkRFpKdFNkbDhnZ3djcHBCN2pzQ0pvSktEU2RGMktRN3o5c3pzOWtCZXdP?=
 =?utf-8?B?aDNvS3FMS1UraWN1R1NXcUs4VXBscjlzdEVUQ0ZKTS9DQk5lSVBOVjdHdkxn?=
 =?utf-8?B?bitjY1ZubWpobDkwL0JRYzdlMWF2MlVIN1VEekFuNVNyQnY4ejVMR0FyWndH?=
 =?utf-8?B?NTFkR2JZdnZla2c2ekU1L0FUT1gxcC9WOVBsejFRZFM0anUvRUhoZz09?=
X-Exchange-RoutingPolicyChecked: lcsEO/Ma9rjtj38h/IgbL8gxmzW4LPd5cx8+46IdYGqtaqJsQ+/vjErocDzekELaz6VGclc07ySeM+Lx/Mn4Eun2E3nm5VyuZGjTBN6N5WMbgAVYbCDxOhFF/RrcPV42vimc9wKQiS2Mh/8EdLSVqXrHR84thbixOzhZuVkfGpxy6aTEPpGkoNiHkDOI2N7dOdmo3rM11Z5XNfGkYIYf48sgpthv6vvpR/QblxntZ73o3BsWTJmpPpYFMKKFBW7wfpe9d6tCDNARAVxWLIHxR8723KfsfKSNZ/KUZ9BgY/yeok94zgkgFBNNMdWVZbf7MXt2IepyhjtnZHdmKckE1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f11e533f-6bae-4024-f6fa-08df3f325e33
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:56:07.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF2bafr0mZ9F0fJyKwE/21UeW09SmhtYIMHx7Npubx03N3cf1RGsZI1/RJZsBmZsiNSkMokgbRtiXuNC4wlFIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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

--------------xMr8bie9yKMa2jx2Tm0LvM1Q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 05-11-2026 14:23, Mallesh Koujalagi wrote:
> Add software error classification support and reuse the
> common CPER header initialization path.
>
> Populate software error metadata without emitting a CPER
> record yet.
No need of this statement. First statement already covers the change.
>
> Cc: Badal Nilawar<badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
> v2:
> - Move union inside xe_cper_intel_hdr structure. (Badal)
>
> v3:
> - Introduce structure where it's used. (Badal)
> - Move error-class union inside cper_init_intel_hdr. (Badal)
> ---
>   drivers/gpu/drm/xe/xe_cper.c       | 21 +++++++++++++++++---
>   drivers/gpu/drm/xe/xe_cper_types.h | 32 ++++++++++++++++++++++++++++--
>   2 files changed, 48 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index db3513c59834..10aa10bbf282 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -14,6 +14,8 @@
>   #include <linux/time.h>
>   #include <linux/timekeeping.h>
>   
> +#include "abi/xe_log_abi.h"
> +
>   #include "xe_cper.h"
>   #include "xe_cper_types.h"
>   #include "xe_device.h"
> @@ -92,11 +94,11 @@ static u64 cper_timestamp_now(void)
>   	return ts;
>   }
>   
> -static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +static void cper_init_intel_hdr(struct xe_device *xe, const union xe_cper_error_class *error_class,
>   				u64 first_timestamp, u32 sig_id, u32 error_count,
>   				struct xe_cper_intel_hdr *ihdr)
>   {
> -	ihdr->counter = *counter;
> +	ihdr->error_class = *error_class;
>   	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
>   	ihdr->sig_id = U32_MAX;
>   
> @@ -219,11 +221,12 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>   			  const struct xe_ras_error_class *counter,
>   			  const struct xe_ras_get_counter_response *response)
>   {
> +	union xe_cper_error_class error_class = { .counter = *counter };
>   	struct xe_cper_intel_hdr ihdr = {};
>   
>   	xe_assert(xe, is_hw_sigid(sigid));
>   
> -	cper_init_intel_hdr(xe, counter, response->timestamp,
> +	cper_init_intel_hdr(xe, &error_class, response->timestamp,
>   			    sigid, response->value, &ihdr);
>   	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
>   }
> @@ -249,6 +252,18 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   			     u32 component, u32 location, const void *data,
>   			     struct va_format *vaf)
>   {
> +	union xe_cper_error_class error_class = {};
> +	struct xe_cper_intel_hdr ihdr = {};
> +	struct xe_cper_driver_error_class *driver = &error_class.driver;
> +	u64 timestamp = ktime_get_boottime_ns();

Why not ktime_get_real_ns? Also, for readability, initialize it later.

> +
> +	driver->error_type = cper_sev;
> +	driver->error_component = component;
> +	driver->tile = location;
> +	if (IS_ERR(data))
> +		driver->cause = -PTR_ERR(data);
> +
> +	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index 68e30df0440e..d8581992dc45 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -45,6 +45,29 @@
>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
>   		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
>   
> +/**
> + * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
> + */
> +struct xe_cper_driver_error_class {
> +	/** @error_type: CPER severity: CPER_SEV_* */
> +	u8  error_type;
> +	/** @reserved0: Reserved, must be zero */
> +	u8  reserved0;
> +	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
> +	u16 error_component;
> +	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
> +	u16 tile;
> +	/** @reserved1: Reserved, must be zero */
> +	u16 reserved1;
> +	/** @cause: errno of the failing operation, or 0 if none */
> +	u32 cause;
> +};
> +
> +/* Same size as the counter-sourced error_class */
> +#define XE_CPER_ERROR_CLASS_SIZE	12
> +
> +static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
> +
>   /**
>    * struct xe_cper_intel_hdr - Intel-specific CPER header
>    *
> @@ -52,8 +75,13 @@
>    * All multi-byte fields are little-endian.
>    */
>   struct xe_cper_intel_hdr {
> -	/** @counter: Error class (severity, component, location, cause) */
> -	struct xe_ras_error_class counter;
> +	/** @error_class: Counter-sourced or driver-detected error classification */
This seems redundant. Otherwise  /** @error_class: Error classification 
*/ is sufficient.
> +	union xe_cper_error_class {
> +		/** @error_class.counter: Counter-sourced error classification */

Keep the original doc.

Thanks,
Badal

> +		struct xe_ras_error_class counter;
> +		/** @error_class.driver: Driver-detected error classification */
> +		struct xe_cper_driver_error_class driver;
> +	} error_class;
>   	/** @first_timestamp: First occurrence of this error class, in ticks */
>   	u64 first_timestamp;
>   	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
--------------xMr8bie9yKMa2jx2Tm0LvM1Q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-11-2026 14:23, Mallesh Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">Add software error classification support and reuse the
common CPER header initialization path.

Populate software error metadata without emitting a CPER
record yet.</pre>
    </blockquote>
    No need of this statement. First statement already covers the
    change.&nbsp; &nbsp;
    <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">

Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v2:
- Move union inside xe_cper_intel_hdr structure. (Badal)

v3:
- Introduce structure where it's used. (Badal)
- Move error-class union inside cper_init_intel_hdr. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c       | 21 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_cper_types.h | 32 ++++++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index db3513c59834..10aa10bbf282 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -14,6 +14,8 @@
 #include &lt;linux/time.h&gt;
 #include &lt;linux/timekeeping.h&gt;
 
+#include &quot;abi/xe_log_abi.h&quot;
+
 #include &quot;xe_cper.h&quot;
 #include &quot;xe_cper_types.h&quot;
 #include &quot;xe_device.h&quot;
@@ -92,11 +94,11 @@ static u64 cper_timestamp_now(void)
 	return ts;
 }
 
-static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
+static void cper_init_intel_hdr(struct xe_device *xe, const union xe_cper_error_class *error_class,
 				u64 first_timestamp, u32 sig_id, u32 error_count,
 				struct xe_cper_intel_hdr *ihdr)
 {
-	ihdr-&gt;counter = *counter;
+	ihdr-&gt;error_class = *error_class;
 	ihdr-&gt;validation_bits |= XE_CPER_VALID_LOCATION;
 	ihdr-&gt;sig_id = U32_MAX;
 
@@ -219,11 +221,12 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 			  const struct xe_ras_error_class *counter,
 			  const struct xe_ras_get_counter_response *response)
 {
+	union xe_cper_error_class error_class = { .counter = *counter };
 	struct xe_cper_intel_hdr ihdr = {};
 
 	xe_assert(xe, is_hw_sigid(sigid));
 
-	cper_init_intel_hdr(xe, counter, response-&gt;timestamp,
+	cper_init_intel_hdr(xe, &amp;error_class, response-&gt;timestamp,
 			    sigid, response-&gt;value, &amp;ihdr);
 	cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_GPU_ERROR, &amp;ihdr, NULL, 0);
 }
@@ -249,6 +252,18 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 			     u32 component, u32 location, const void *data,
 			     struct va_format *vaf)
 {
+	union xe_cper_error_class error_class = {};
+	struct xe_cper_intel_hdr ihdr = {};
+	struct xe_cper_driver_error_class *driver = &amp;error_class.driver;
+	u64 timestamp = ktime_get_boottime_ns();</pre>
    </blockquote>
    <p>Why not ktime_get_real_ns? Also, for readability, initialize it
      later.</p>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	driver-&gt;error_type = cper_sev;
+	driver-&gt;error_component = component;
+	driver-&gt;tile = location;
+	if (IS_ERR(data))
+		driver-&gt;cause = -PTR_ERR(data);
+
+	cper_init_intel_hdr(xe, &amp;error_class, timestamp, sigid, 1, &amp;ihdr);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 68e30df0440e..d8581992dc45 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -45,6 +45,29 @@
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
 		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
 
+/**
+ * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
+ */
+struct xe_cper_driver_error_class {
+	/** @error_type: CPER severity: CPER_SEV_* */
+	u8  error_type;
+	/** @reserved0: Reserved, must be zero */
+	u8  reserved0;
+	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
+	u16 error_component;
+	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
+	u16 tile;
+	/** @reserved1: Reserved, must be zero */
+	u16 reserved1;
+	/** @cause: errno of the failing operation, or 0 if none */
+	u32 cause;
+};
+
+/* Same size as the counter-sourced error_class */
+#define XE_CPER_ERROR_CLASS_SIZE	12
+
+static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
+
 /**
  * struct xe_cper_intel_hdr - Intel-specific CPER header
  *
@@ -52,8 +75,13 @@
  * All multi-byte fields are little-endian.
  */
 struct xe_cper_intel_hdr {
-	/** @counter: Error class (severity, component, location, cause) */
-	struct xe_ras_error_class counter;
+	/** @error_class: Counter-sourced or driver-detected error classification */</pre>
    </blockquote>
    This seems redundant. Otherwise&nbsp; /** @error_class: Error
    classification */ is sufficient.
    <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	union xe_cper_error_class {
+		/** @error_class.counter: Counter-sourced error classification */</pre>
    </blockquote>
    <p>Keep the original doc.</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		struct xe_ras_error_class counter;
+		/** @error_class.driver: Driver-detected error classification */
+		struct xe_cper_driver_error_class driver;
+	} error_class;
 	/** @first_timestamp: First occurrence of this error class, in ticks */
 	u64 first_timestamp;
 	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
</pre>
    </blockquote>
  </body>
</html>

--------------xMr8bie9yKMa2jx2Tm0LvM1Q--
