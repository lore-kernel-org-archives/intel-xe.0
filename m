Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5959606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 17:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXgjGyn4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D84510E1FD;
	Mon, 26 Oct 2026 17:21:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BCB10E1FD
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793035289; x=1824571289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jxfycBusPv8M8MpcwFq6yjOH87MdFweQ/tXN2Hrtq/o=;
 b=TXgjGyn4euGbfUTaMoGW6AYFJJraA4/N/tXjgOky41vPGCduA7MIS74Y
 wu/hCfLJf0uc2lTMV6mvtNHKn+m8EkDcW2sJi5Y942+E+OWe0sNr24SxR
 tPVmPyW493FRqqYVQMRPyFC8X7bSOnD8uIBIFVCSdGXbxp8uJYE5ArvCS
 PfGCHbN+3JXYsVB1bVivIGSyEWOouhI6h1rxX0+wAYwW31VhUHW3H2ipy
 zpC7Ae4p8YYsSdkLl5TSPKc7yoQxRy5VD8N8d3ZrZ/IBWTojKu+Ygjm2N
 bAjzaQSzYF+ssY+iJo8SrRvznEhNQYDX0+5gH/8HvhgvRKpgMFdTMOIVe g==;
X-CSE-ConnectionGUID: aNM4umChTaWHQ8bywgXG+w==
X-CSE-MsgGUID: Bq3WngKFTwOkYWjfPR+xlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1589604"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; d="scan'208,217";a="1589604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:21:28 -0700
X-CSE-ConnectionGUID: 6e7tKsulRlyPhMuJvV3g6g==
X-CSE-MsgGUID: 3zp5S6I4TR2/DwwDztnUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; d="scan'208,217";a="4275845"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:21:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 10:21:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 10:21:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 10:21:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdHsNeq2ioTF+nvgIU0evy472r1gY2Gne+gbXl60V2somKdmKyO+uAku1RRbeKZpG873bDzuuiX61acbntOwGomHBjZkl5X4v1GQOpBnDOsVBui1oASRFR/LlpK74oTW3n0qKvarvA6GBh0smfzoOpH6230gB68JHVIZVSI8eCcNJKoA8jQdYUVmXV9VWps3BfdWIKU63IEK7PnylMtPbVWtPrsbnXB/IYNr8uaina9kThqa9XCGMMhGu9DtfJmX9Dfqav4ev34GQuz7rgHuGAR3UTsoIJ+qe90oX76/gmXLu1jNQF2VGMA2miUzZ2q69q4w1MrWCAeFm3S5TqhtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEPo0XjX1nxcFUIkhrPSYa/OaeG/P6GEN0ItIbUvgq0=;
 b=bpkfdFvCX+3HOuA0jRamSP+AEoSSXOM02rb8BLPHcraukCmM2KluvOaujz4IEnbDHX9G20Mpw6eyitKeOBsxoFlVHWITtiyGVpc2jAw+aYvu95Pncnl2AYpAhSeNBw6HqGQtH1kiLpXxNNY/x9ZiIdJTqXRQgxYscPwCqaD7aFrjoEiSianb7022s1uba1eYhn6aTsmNHgsWo+3VfHKPQ+JLrZDN3vJ/tV7IYg/v0HVffoJwV2yytxr+x2s9OlLYGPUStT3KJk2+SrOMK6IQ6XhMlirubcwbNmYwxmuVHMIFVhIQWhNkxLThm2fVczJ1IlDkD/Ltw35nFJeGjwmLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH8PR11MB9974.namprd11.prod.outlook.com (2603:10b6:510:3cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 17:21:25 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 17:21:25 +0000
Content-Type: multipart/alternative;
 boundary="------------ggoq5rhOM0k0EL9yFV0Vtizm"
Message-ID: <a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com>
Date: Mon, 26 Oct 2026 22:51:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] drm/xe/cper: Construct CPER record for hardware
 errors
To: Matt Roper <matthew.d.roper@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>, <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-18-badal.nilawar@intel.com>
 <as9Zvxl3-Lx4H6En@black.igk.intel.com>
 <332beff5-53b6-4043-8b60-7c73ca780eff@intel.com>
 <03767785-851a-4b84-8271-388d33d7669c@intel.com>
 <atrHUMcymdVC9T-l@black.igk.intel.com> <20261023230429.GB6078@mdroper-desk1>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261023230429.GB6078@mdroper-desk1>
X-ClientProxiedBy: MA5P287CA0361.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH8PR11MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: fef7fe3e-27e3-4afa-2560-08df33858fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|261026140227099003|8096899003|56012099006|4143699003|11063799006|10067099003|261022113327099003|261009223027099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 8JBnlGYxoOjDlN7CBZq8Jx5GWuIjnxtphTpkTFIRaXGu7d6C6ER+u6U8SyoSfeFpeVHOyQYsf1OJx+EGrO0rUQpd75oDNR3yQUNbGVvIAatuOcDWaiT8Jdl2VLe5w3F0g/Apvmy6hNyVYgw0VbQY+YZJkwqW0Ot8oOY57KVlfJp33pVclSEzgyKL/r70vXCiv+l2byja2v/aBJuenzhp5Mk5ZnDssZCPtsdIWdAni58jx/+LXVcqu5OMigh9rin3U/IdTe5fnQzYBRAdI/OECevdCF/2vrgtuoP2+u47nWwyw7JC1zIKhiWilFAUo7e4geRTKqGRAGkAH4msjjkTey2bFNfXiUw1viSQNToelFxZ6arQHfOPk262HH+YtIaN4AVWaRqIzWCau0RlA3ldL3iEiOdJBXH1ZBU2Tf2d1U6kvxepMA2756BrcnWR7qbeMnFVIGaAAhe5RH/mKcao865PJ6jA8fuFgbQToA00l48LBztnXO5sbnXnXjHe8SoFgUgDmPVXrQ+TbTFUN0tiltVlNhdHgHT4f+b1KTpAUor37MHfjhVFiZ3fzQEGhBHQ5IAOxin6qLEu57OJTR2Dp0AEhnpYsHW857WDmsbEwt2hHKYbxfT1xtoLOZ1akuLMvfctRMf7PsdGObkc0gfHNmmD27LF0Qnqk8opWu9Fq64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(261026140227099003)(8096899003)(56012099006)(4143699003)(11063799006)(10067099003)(261022113327099003)(261009223027099003)(261022105027099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFN0VGFWMDJtN2F2TGp2ekp4VXh1TTgzTXBra2pzODZVTFQycytoY2FjQzJt?=
 =?utf-8?B?RmN4ZFR4Q1ora0RLWVZ5d1E0MElVS3h0Z1RDRFV5QTFTQWE4bENKdzhUUmwz?=
 =?utf-8?B?TjlyVk1rbDVlTXc1Z3NlSXoxVkljNnNFM2NFOW80TjZLVUtGd2lWd0lWN2lY?=
 =?utf-8?B?N0M5N3JiZVF0czk5cWpBNFNxclI3NkZrdGpjYTZDQ0JZb2FaTjByTklkQ2h2?=
 =?utf-8?B?ZWNSSitScjhpRWZWc3NSR3FFdVJUQktXclBJMGJoc3RScncwZFVNQVJVZHh5?=
 =?utf-8?B?ZmgxR0E5d3VUbW1qcDZGK3FINDJjMmkxMnNpeC9mZVFEc3pUN29oVHpWeXpk?=
 =?utf-8?B?Ly9oVHVhZVovWmhHYkpQY1FxNmxyQkNOSVNNb1c1QTluNzdUbk9hWlo0QWJp?=
 =?utf-8?B?MVdVT1ZlcVVpYTB5ajhLNGduYWdReG8wSlBEaXJpN3Brajd4ZWQvQW5XRUoy?=
 =?utf-8?B?ZXBoVk1reUg0RWpGdVlMUzRwN3VzOEwrWWlrOGNGdE5wT3U2a1YvVURyTHpv?=
 =?utf-8?B?d0YyKzhsTk05d21ENVZTWTJlNVhDVnRNUU5uSXhUNXFueG9kQlJKbk9qaXlh?=
 =?utf-8?B?ZXY2eURGNDEzc3lITEd0eWl2SkpVVEEvQmx4YjY0RldNYkNFQUFxaWN6L0pn?=
 =?utf-8?B?WnV1NVRpYkRyajJJcVA5RmZVU2FMWUtGemVlTm1UaGtNWTlaVW5sU2E0T0xh?=
 =?utf-8?B?SklEVy9jaUpleGpwN3FJRExZZFJpcS91MUF3TGJXWVlwYVZkMnhTK2pIZWoz?=
 =?utf-8?B?SERuZ1Y0UXppUmxZdk00eGptSDhXRFFFS0Yyajc1bmJIcVZXU3phWXhTenpk?=
 =?utf-8?B?Y0FuT2VpbzRMdFVmMXNZMlB6QjliZEg4MDJOb3ZTVFVTL3Q0Wk5oUlRKUG1a?=
 =?utf-8?B?eGkzWVBqbEhhejFnS2dBSk9uZG8xUkVJYXVoKzZZSWhqSXE1Q1h3cjdBQm9w?=
 =?utf-8?B?LzFibUVXaUJuQWpPWEQzd2F5Zko5WFc0VU9mQVNpUVNJbk5CUGxJZ3FXUmMw?=
 =?utf-8?B?SEZ1NUxxYzZvYnJnbTRqNW11T3o1RkVvUEl6d3ZNMVNMOXllaHlWNUJjdHNa?=
 =?utf-8?B?bkx4dEZpWE1yL0JvQWZJQ0RYbWZ3dGorYmMydXpzODVvQ0JOTUhyb0RQcHJZ?=
 =?utf-8?B?QVpzdFNOL2pONFlkbUw0ZTc2RTM1SEdTWFI3Z1VtYzhTTmhIMTNPRmFsTXBp?=
 =?utf-8?B?UTlTblpjM0ZlNFNlS0owNWtuMnVybHd6L2NGVUNLOTcxSzc5d0ZNYXkyM1p2?=
 =?utf-8?B?WVpBMTNYT2tCQWNSbjl6VC83WTREcWFhTTJzTllrZDlEaitleHBwYXd2YmNP?=
 =?utf-8?B?US92STNVMFR6ZWk3ZnR5amFwUmNRLzhhd3dCbzBTZ2VLL1hRQlg1TlNKYkVp?=
 =?utf-8?B?dFNseFRSdGh3WmpFdnVWdk10cVhvWnE2MmxtVmdnOHZWQlBGblU1UEpoUGpS?=
 =?utf-8?B?SDN4NE56VldZdEhGUHU3TnhyOGowb25ibGRkdDlUaUNYS2N2R0JqWUtZMWZS?=
 =?utf-8?B?NTFoem9ENENkR1FYRVhza2N1SXVGT09yQXkzTmN5Um85cVZLYUpWMTBFdjV4?=
 =?utf-8?B?bUJYMXNsZkphTW5PNXhmcGRGY2VSZEFXWEZ3aGo3TlRZc2pxNzNJV3RTUTVy?=
 =?utf-8?B?ZVBwMDJYTHhGRkNXYTliRzFuc2ZxSmFBYkZCc0ZyMnFXUndBeHd1aXdxcmlp?=
 =?utf-8?B?SmZRWFVQV2FXbzI0Z3lLQ2dwQzFVT0RCVzVZR3hnWFRGdVhoaXp4T1JibVA0?=
 =?utf-8?B?dVRRS2pQZllINnNWekVLcWUwQllXbGtOcmxvQVZIR2xBSGhyRGU5TnZOM0Mx?=
 =?utf-8?B?UTdGblhoZFkvaGhiNHhWaGFwR3hEVXpQVHJzSmFHRzhCUUF3UUc5K0dLaTlH?=
 =?utf-8?B?YXJwc3JMbXRJR2hTQzZrQ1dIclMzeGo4UHZpWVZQOGZSRnZXazAyNW4wQjFQ?=
 =?utf-8?B?NWR5bXJRTXgvbG05TUVVTjlPN293NEE2ZzF6N1RzUlJQSVRDejdxcm0yKzcr?=
 =?utf-8?B?NDkvV2ZXekZlcExqR1ZBUi9zODJCejNyZmM5VUUzZk00b2NsNzJ1azZoWlRQ?=
 =?utf-8?B?dGpyRkdoS0lxZnRZSG5GelR2blVDSEtUdkpsUk5FZHhXb0JiL2RwYzNNazBi?=
 =?utf-8?B?b2Y0cHMraWJvSUZCL3FHZ0RIazFTUzNMVndkY0pjZlFvMDd5ZEVRbkR1dWMz?=
 =?utf-8?B?YVNWNTNKcm1wSUd2Vnl3YlgxT3REN1I0K09DSUtFOE40ZVVHNzdEQkJKeW92?=
 =?utf-8?B?bHpUUVVCa01DWVBac0FVNURzQlVrbGhpeVJ2dWdSKzMzM2toayt0UENla1pO?=
 =?utf-8?B?SUg1WXdIRUlxdmFOUkMrRTd3elFYdGY5eTVydjN3emxjUHJUK3VqUT09?=
X-Exchange-RoutingPolicyChecked: PAKC/DaF7EMYBp/IcfvCz9rDQRAL+IGF8DQrGg2NXQ0T7uFz3XzTrgqU5sN6VEEZKznScoWwOlXUZI99+BGeOM3AcASWO31VitSyJp7Js7I0InhA99Mrd4iqIIglJ7xzFvOF52J6CXOQ5NQjpzPzlIAGxBNOfjTaD7JQiNcimLn5+7MO81SAnsd83r2kALdjI2y0LYXcwzeuuLsAwF7zXiQNASc3bNVEuiYJV5QioMHCLv3i7/smxyMkV+5wJtH4HIUNsZxQUWMDqW2B8L/C16rcfoqm3coBK783gn+euFCSu66a9oYFLOFYIeKB23+vJl7YaeHFsFxiTkNNGxRKZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fef7fe3e-27e3-4afa-2560-08df33858fe9
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 17:21:25.1120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/pgyZV++gr38wPEmGu3odV2cDo9SXDsSgtDzH8aAawlRd6fUXYhhnhWWC6iiN3Z5EFZAKGnjj9rhNe+ryD2Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9974
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
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------ggoq5rhOM0k0EL9yFV0Vtizm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 24-10-2026 04:34, Matt Roper wrote:
> On Fri, Oct 23, 2026 at 04:32:48AM +0200, Raag Jadav wrote:
>> On Thu, Oct 22, 2026 at 10:24:45PM +0530, Nilawar, Badal wrote:
>>> On 22-10-2026 19:10, Nilawar, Badal wrote:
>>>>
>>>> On 14-10-2026 16:00, Raag Jadav wrote:
>>>>>> +static const struct xe_platform_id_entry xe_platform_ids[] = {
>>>>>> +	/* 0x674C  platform/8086:674c */
>>>>>> +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>>>>>> +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
>>>>>> +	/* 0x674D  platform/8086:674d */
>>>>>> +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
>>>>>> +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
>>>>>> +	/* 0x674E  platform/8086:674e */
>>>>>> +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
>>>>>> +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
>>>>>> +	/* 0x674F  platform/8086:674f */
>>>>>> +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
>>>>>> +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
>>>>>> +	/* 0x6750  platform/8086:6750 */
>>>>>> +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
>>>>>> +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
>>>>>> +	/* 0x6751  platform/8086:6751 */
>>>>>> +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
>>>>>> +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
>>>>>> +};
>>>>> This is unrelated to cper and shouldn't be here. I'll rely on Matt's
>>>>> input on how to deal with these.
>>>> Agreed, I don't think this is the ideal place either. For now, I'll keep
>>>> it here and, based on Matt's input, consider moving it to xe_pci.c,
>>>> which maintains the PCI ID list for the platforms supported by Xe.
>>>>
>>> One reason I placed the table here is that these aren’t general-purpose
>>> platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s
>>> platform_id field, using platform/8086:<device-id> as the name.
>>>
>>> Since CPER is their only consumer, keeping the mapping with the CPER code
>>> seems reasonable to me.  I’m happy to follow Matt’s input if there’s a
>>> preferred place for this kind of mapping.
>> My only concern is that we usually don't have device ids lying around in
>> random components, but that I think is upto the maintainers.
> Yeah, I'm not familiar with these structures.  If they're CPER-specific,
> then keeping them in the CPER file seems natural to me.
Fine, I will keep them here only.
> But it's also
> true that it could be easy for these to get out of sync with our general
> PCI ID list if PCI IDs are added/removed.
>
> If a new PCI ID shows up, how do we know what the values should be here?
> Are they documented in the bspec somewhere?

No these are generated as using uuidgen utility as UUIDv5.

$ INTEL_NS=$(uuidgen --sha1 -n @dns -N "intel.com")

uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:674c"
9046afe5-9041-5124-8614-92550d9e9da6


>    How do these values wind up
> getting used?

This UUID is populated in CPER record to identify the platform/SKU 
associated with it.


> Are there uapi / ABI implications of these values?

No uapi implications. As they are part of CPER record should remain 
stable for given platform/PCI ID.

I am considering generating the platform UUID dynamically using UUIDv5, 
with the PCI vendor/device ID as the name.

This keeps the UUID deterministic for a given PCI ID and avoids 
maintaining a separate mapping table when PCI IDs are added or removed.

+/* Namespace: uuidgen --sha1 -n @dns -N "intel.com" */
+#define INTEL_CPER_NAMESPACE \
+       UUID_INIT(0x3e54f727, 0x549c, 0x5ab3, \
+                 0x90, 0x73, 0x52, 0x2a, 0x81, 0x15, 0x20, 0xe7)
+

+/*
+ * Platform GUID is UUIDv5 (RFC 9562) of "platform/8086:<devid>" in the
+ * Intel CPER namespace, stored in the mixed-endian guid_t layout used 
by CPER.
+ */
+static void cper_platform_id(const struct pci_dev *pdev, guid_t *guid)
+{
+       static const uuid_t ns = INTEL_CPER_NAMESPACE;
+       u8 digest[SHA1_DIGEST_SIZE];
+       struct sha1_ctx ctx;
+       char name[sizeof("platform/8086:ffff")];
+       int len;
+
+       len = scnprintf(name, sizeof(name), "platform/%04x:%04x",
+                       pdev->vendor, pdev->device);
+
+       sha1_init(&ctx);
+       sha1_update(&ctx, ns.b, UUID_SIZE);
+       sha1_update(&ctx, name, len);
+       sha1_final(&ctx, digest);
+
+       digest[6] = (digest[6] & 0x0f) | 0x50;
+       digest[8] = (digest[8] & 0x3f) | 0x80;
+
+       *guid = GUID_INIT(get_unaligned_be32(&digest[0]),
+                         get_unaligned_be16(&digest[4]),
+                         get_unaligned_be16(&digest[6]),
+                         digest[8], digest[9], digest[10], digest[11],
+                         digest[12], digest[13], digest[14], digest[15]);
  }

>
> Aside from everything else, should we also add some kind of kunit test
> that makes sure we each PCI ID has an entry in this table and vice-versa
> to make sure we don't forget to update this table when platform PCI IDs
> are added/removed?

Agree, Kunit can be added as follow up.

Thanks,
Badal

>
>
> Matt
>
>> Raag
--------------ggoq5rhOM0k0EL9yFV0Vtizm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-10-2026 04:34, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
      <pre wrap="" class="moz-quote-pre">On Fri, Oct 23, 2026 at 04:32:48AM +0200, Raag Jadav wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Thu, Oct 22, 2026 at 10:24:45PM +0530, Nilawar, Badal wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
On 22-10-2026 19:10, Nilawar, Badal wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">

On 14-10-2026 16:00, Raag Jadav wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+static const struct xe_platform_id_entry xe_platform_ids[] = {
+	/* 0x674C  platform/8086:674c */
+	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
+			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
+	/* 0x674D  platform/8086:674d */
+	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
+			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
+	/* 0x674E  platform/8086:674e */
+	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
+			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
+	/* 0x674F  platform/8086:674f */
+	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
+			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
+	/* 0x6750  platform/8086:6750 */
+	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
+			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
+	/* 0x6751  platform/8086:6751 */
+	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
+			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
+};
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">This is unrelated to cper and shouldn't be here. I'll rely on Matt's
input on how to deal with these.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
Agreed, I don't think this is the ideal place either. For now, I'll keep
it here and, based on Matt's input, consider moving it to xe_pci.c,
which maintains the PCI ID list for the platforms supported by Xe.

</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">One reason I placed the table here is that these aren’t general-purpose
platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s
platform_id field, using platform/8086:&lt;device-id&gt; as the name.

Since CPER is their only consumer, keeping the mapping with the CPER code
seems reasonable to me.&nbsp; I’m happy to follow Matt’s input if there’s a
preferred place for this kind of mapping.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
My only concern is that we usually don't have device ids lying around in
random components, but that I think is upto the maintainers.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yeah, I'm not familiar with these structures.  If they're CPER-specific,
then keeping them in the CPER file seems natural to me.  </pre>
    </blockquote>
    Fine, I will keep them here only.&nbsp;
    <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
      <pre wrap="" class="moz-quote-pre">But it's also
true that it could be easy for these to get out of sync with our general
PCI ID list if PCI IDs are added/removed.

If a new PCI ID shows up, how do we know what the values should be here?
Are they documented in the bspec somewhere?</pre>
    </blockquote>
    <p>No these are generated as using uuidgen utility as UUIDv5.</p>
    <p>$ INTEL_NS=$(uuidgen --sha1 -n @dns -N &quot;intel.com&quot;)</p>
    <p>uuidgen --sha1 -n &quot;$INTEL_NS&quot; -N &quot;platform/8086:674c&quot;<br>
      9046afe5-9041-5124-8614-92550d9e9da6</p>
    <p><br>
    </p>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
      <pre wrap="" class="moz-quote-pre">  How do these values wind up
getting used?  </pre>
    </blockquote>
    <p>This UUID is populated in CPER record to identify the
      platform/SKU associated with it.&nbsp;</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
      <pre wrap="" class="moz-quote-pre">Are there uapi / ABI implications of these values?</pre>
    </blockquote>
    <p>No uapi implications. As they are part of CPER record should
      remain stable for given platform/PCI ID.&nbsp;</p>
    <p>I am considering generating the platform UUID dynamically using
      UUIDv5, with the PCI vendor/device ID as the name.&nbsp;</p>
    <p>This keeps the UUID deterministic for a given PCI ID and avoids
      maintaining a separate mapping table when PCI IDs are added or
      removed.</p>
    <p>+/* Namespace: uuidgen --sha1 -n @dns -N &quot;intel.com&quot; */<br>
      +#define INTEL_CPER_NAMESPACE \<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;UUID_INIT(0x3e54f727, 0x549c, 0x5ab3, \<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x90, 0x73, 0x52, 0x2a, 0x81, 0x15, 0x20, 0xe7)<br>
      +<br>
      <br>
    </p>
    <p>+/*<br>
      + * Platform GUID is UUIDv5 (RFC 9562) of
      &quot;platform/8086:&lt;devid&gt;&quot; in the<br>
      + * Intel CPER namespace, stored in the mixed-endian guid_t layout
      used by CPER.<br>
      + */<br>
      +static void cper_platform_id(const struct pci_dev *pdev, guid_t
      *guid)<br>
      +{<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;static const uuid_t ns = INTEL_CPER_NAMESPACE;<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;u8 digest[SHA1_DIGEST_SIZE];<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;struct sha1_ctx ctx;<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;char name[sizeof(&quot;platform/8086:ffff&quot;)];<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;int len;<br>
      +<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;len = scnprintf(name, sizeof(name), &quot;platform/%04x:%04x&quot;,<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pdev-&gt;vendor, pdev-&gt;device);<br>
      +<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;sha1_init(&amp;ctx);<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;sha1_update(&amp;ctx, ns.b, UUID_SIZE);<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;sha1_update(&amp;ctx, name, len);<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;sha1_final(&amp;ctx, digest);<br>
      +<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;digest[6] = (digest[6] &amp; 0x0f) | 0x50;<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;digest[8] = (digest[8] &amp; 0x3f) | 0x80;<br>
      +<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;*guid = GUID_INIT(get_unaligned_be32(&amp;digest[0]),<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;get_unaligned_be16(&amp;digest[4]),<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;get_unaligned_be16(&amp;digest[6]),<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;digest[8], digest[9], digest[10],
      digest[11],<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;digest[12], digest[13], digest[14],
      digest[15]);<br>
      &nbsp;}<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
      <pre wrap="" class="moz-quote-pre">

Aside from everything else, should we also add some kind of kunit test
that makes sure we each PCI ID has an entry in this table and vice-versa
to make sure we don't forget to update this table when platform PCI IDs
are added/removed?</pre>
    </blockquote>
    <p>Agree, Kunit can be added as follow up.&nbsp;</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
      <pre wrap="" class="moz-quote-pre">


Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Raag
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------ggoq5rhOM0k0EL9yFV0Vtizm--
