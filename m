Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6534A606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9uRWUok
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4B710E086;
	Wed, 28 Oct 2026 20:57:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E161C10E086
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793221068; x=1824757068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SIP3W1/v5FTuuStJzvGGnblzm7ecQWV0sHVRZiq4LLw=;
 b=K9uRWUokdQgJ+0lZ7QGtJZeRHR1NQWvXEoBLTe6302QYODu7NT67D73l
 tgog7y/dznIMZRIAJJqKI+WW0y2LaBDW2chjzTxi9et9SnB+Il/TkpAVw
 /6B7+usSrYMm7dzoa2NtXPK8dUc/5S3xICJlapU0S6FAHDtc+MbkgNoqZ
 YMq0dBsmd3zYaKPC5bgRdoOF51v79aaNcW7u0pc4HbczdRzRfsHKcWzSc
 Pme4wlrRI9lv+wuPeymSreHEZvwiTQtR1+eRmO8jNsRrEz/cdDxMab+rb
 1jYMqEjhvwB0EgPZhlSGnPI/Z09JE6tUHpmeOvz5zbYNyCpwj6a+kDAZN Q==;
X-CSE-ConnectionGUID: ZB45ZSxrTcywNnXHIMF5XA==
X-CSE-MsgGUID: IuQZfK8WRSSlEb9QnnIAzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1838989"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1838989"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 13:57:48 -0700
X-CSE-ConnectionGUID: dSs4k1pdRQabk8z6aTPTlg==
X-CSE-MsgGUID: CkzVLIcyR2KUV9iTVucn+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5029102"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 13:57:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 13:57:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 13:57:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 13:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9eVRDvFzmxGiuNwaUUAi9xTpzlkeUrrMFAgfJ9SOSq4iULj4lhU54VE94IPZzir+o7S98491xj/hhCkt2rbTRpBe7dAH2FGixVMxY/wTnIG/5x4BVQf2S122vsB1c4J3k+9+IrV2oP9FDHch/088wNvXRVX5DixIfoiV8sZgR4oYnY7GpQKe7Ldl/BCCPUBo6HZpATOXeBSs9B3pwjm7umWYlWqF/FXelxVHiyh6c9JLOJm3LLuwb9oOqNgi6pcYX57MkD4yWQbTqbPSp6b2pwqwbs+fjPrPAuyZQS3hCPWz5PMglfLaPTiFd7rMG5PTvR4oNeEDkClzywzjqO8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw6VIHHy0WRWjyxTQVmzYvRsiXwSvCkvUjm2EOS28/8=;
 b=O1+KEmjPqYPSoq5U070je/45e0J5LyluJvmVx2K3uV1zilTQM4aQRfoq88mKWYFMXzzMZcNR3ZUk1SuUTfpmhVQ2HtxjFcp08FcNt9xCXa9EuM0MRaQ5X4bCRpUHwcr/kDoSZz94OMo2hXtOFGU/Zx64s598dJAni/D+wDivwOXlBVGPyVhNmSGLfZQ9rVjgr1Ipj1texvbGXX48SRG4crmnKC49461WedmgHc5Fk/fi3TVHUNEKI3ksYXvqfnJLKQ2TYtkbKM/oSZ8R3c2RopCbDCFnNPRXXR8Jc6yp3zCcN+ERo1TgvuJzbaYcTjUOzXHwkppQQNJzMmB5lyJAyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 20:56:39 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 20:56:39 +0000
Message-ID: <947fbe63-650c-4a8c-b317-f8552c4fdedd@intel.com>
Date: Wed, 28 Oct 2026 13:56:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/xe/xe_late_bind_fw: Fix firmware leak on
 missing manifest entry
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>, <alexander.usyskin@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <kelvin.gardiner@intel.com>
References: <20261028181951.1093283-7-badal.nilawar@intel.com>
 <20261028181951.1093283-8-badal.nilawar@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261028181951.1093283-8-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::12) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SA1PR11MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c94407-e490-4003-a0a7-08df3535f67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261026121527099003|4143699003|11063799006|56012099006|261026135527099003|261021121427099003|261009223027099003|261021133027099003|261022075727099003|261022105027099003|261021130227099003|261022113327099003|261021135927099003|10067099003|261022115727099003|261021123027099003|18002099003|22082099003|261028144727099003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: dZy2vEa7ETCkmkA03cbTaqQDrVPeeY6iEQ8agt9Lvx5c5Y2C24o1FUYJi3k75YATC6O4WL8grZ4P7bpoj0djO/tBtNDNS7a2fVxBONfMUnnEO7OwrcxbfeHDPjZtDJFGc6rLa8CFbKczUWeemb/MvaFFpq3sx+HecomysKKRarnjFsqtdkOjhaJMnKiJDfdHJZfXBxCIno70g0rmk3+9dQorch+sG1uxO+uPw4Wtq9tycsGPBEij2VXOQvvM2c+EiCO0lptYfs+4XB2YxFwqMNxcPURrd6vCFA+Abo8CsUSCS/fXMnB7oqUq7gk8WVZs8hWKHQMB2n1/OWThFogNbtSES1txKfVpBLRtnqxfCpT0cXfBH6HHPAT1OKNYeeyy5MArHiBatIeIZ9CTaVA62hkC90b2x5TO2ykmQT99fVQS+Rn28HpPHgb2U8c8/2RCnIn750/d10qrVykViSjjlUPdk+P16U0pH74Sq546OIBHc5f9kzJBcKhoyKrcYphGf6kEoNvwvXEG+bRuj6ZP4qvz0OQuyK788R62Sx/8hXxOIDVOiFfzBjyJafZFR/ykFzQPG1vvCbpo/+jmKw5Y6Xdb0t10LfOqLbWw1p0xD1UD/1UzHPghTB6raBKlTxG8diawd6DIJJKYwgEoPOaikvHc4JVzoUJHT1ZfvPXFsIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261026121527099003)(4143699003)(11063799006)(56012099006)(261026135527099003)(261021121427099003)(261009223027099003)(261021133027099003)(261022075727099003)(261022105027099003)(261021130227099003)(261022113327099003)(261021135927099003)(10067099003)(261022115727099003)(261021123027099003)(18002099003)(22082099003)(261028144727099003)(261026140227099003)(261026130827099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzhXTkR6ODcrRnhEN015NWhKWmIrTE5weUdOaDBOL2JJTm9DTjJUa2I0d0dN?=
 =?utf-8?B?bXEyZGtOQUQreUpMMlE2UEpHcDkwb3pNMlZWcjNQUTluVHVXOHliUklqTnlz?=
 =?utf-8?B?WENUTDBJKzBqSjJsdC8wblJYbDIraEQrZHdhMWp3M0JLUDdkSFRPTDZpOXZG?=
 =?utf-8?B?aHZXSEpYRE9sTmdqdDMwWFNsMmMrbGNpU2dDdUxSNk1QdWUyTHplOEN1aWdj?=
 =?utf-8?B?MXQ3VGd3WEcreVkwRGJFTG04MjlOT3N2QThQaE9BbTVONmNrcjMrUWtjNE9k?=
 =?utf-8?B?QTJDa2w4azluSTNNdFlwV283dElmK0dHcnk2TlhmYmFUUkZTOU5PQWlZVjQ0?=
 =?utf-8?B?bk1vVGNLUVVGODFsQkw2dUt1NjgyRFRyZkNDZ0twRE94YTJ1WGcyVjRXUU95?=
 =?utf-8?B?SmNQUVVzOFZFL2E4VmdScUxDUWNKbENMWVgvSkhjTzZRWmwwZGc3MFQxKytI?=
 =?utf-8?B?WnJtdEF5WVg5dFlXVTZPOEpUSWI1bHk4Sk05QURSZjF2YWRJei9ZMUhHUGZs?=
 =?utf-8?B?amUwTVlzS3NlejlvRUU4elkwVEg5UW01eXRLakJQbEUwN0o5SlNTNkJLMjVO?=
 =?utf-8?B?VytSclZwMk1rc1EvbjRDUjZ0NUxWcVNIWFQzNnNKWHNoTmxvdWZuT3VzbEFR?=
 =?utf-8?B?OEtZZnVVdkp0aGJVV3djOGU3bDJDaWgxM01IL0VQNkhySVdEdGF2L0J1bHY1?=
 =?utf-8?B?QmpqQVVCZ2hnOGVpWFlHQ1ZhbStRRDNjQjFNdHZINkVUaEdlYWMvRWNKdEI2?=
 =?utf-8?B?TDNQTXFSdUFQdFRmZGdZVUNmZnAzNE5PaHlDZ2xiRWZsaGVMMVZJOUF2b2dv?=
 =?utf-8?B?alY2SGV4L2RQTFh0ZFpYeWpXL2RhbGRVdXE2NzdRU2ZsWkRLdXZiK3h0QkhG?=
 =?utf-8?B?OEFuOWtDUjhPVlBCaWkxMlRYb3FiNWxtMk9NQzQwaThxWndNdGVMUTRyRk9u?=
 =?utf-8?B?ck5wY2NBZlh6MTdlUHV4WWNLUWgvMndLaXBNdUppaGJ5UW5FWGd3WXRCRnh3?=
 =?utf-8?B?TUE3TG5Cbk1HQXVRQ1FrdFRZbDlsb1VVeFhpdm8wM0s2aGpaQnd1alZsbTRH?=
 =?utf-8?B?a0h2bG1nUDAzaGF4L2lCdlV0T0paL0Z6eTN6SXRYektna0ZkQzVXWllReHMz?=
 =?utf-8?B?M09jOGlLd0lTZzc2N2ZycTZ6UVJWMUU2aDhRMFZHTHNGQ2dDOC9BVjF2Z2Zj?=
 =?utf-8?B?cURKczc2Q1I4T1lkMTg4VXFXNWw1TmYzaWhONGc1ckxOTEtBK2p4ZElvaWNG?=
 =?utf-8?B?Q081UUJNeTZWZHd0aDcvS0dqNGNHMHFPVi8veXpwdTR1QWp4Z05DeW9xV3ZY?=
 =?utf-8?B?ekdvYXFIYldLbWhkR0Z1VWlrWm05RmpGeldnODhDRnBlU2lnWUhyNjlyL0hJ?=
 =?utf-8?B?ZHRqK0svdjJPYXhScmg5TllhbXJjMlJzNUw0dVZremVEaGc2SVFmQ1c4eGhK?=
 =?utf-8?B?SHlpckc1Q1N2QkVjbXRteXhPUFloSi8wRXg3YThNOXlqbHdoS3hmV2FROStT?=
 =?utf-8?B?Q0hQNWZGOFgwTHBHa3pPRlZkSXl6L0NMOTBjRlhac1loT054VFNvSzVqc2Z6?=
 =?utf-8?B?THpNQnBnc1k5NmFrbVUrVHU2R2toTjByazY5WTFaUUQvcVFka1FuRWp2MDFN?=
 =?utf-8?B?MGRTdWZaTXJJUW04bllodkhYWXJmUW1Hb3NyRHlJR2RvSWFod0h1MXdHdmNr?=
 =?utf-8?B?VVpsYWZYSGVRUHlGaUVrT1RjUmpYMHlxVzNMV0ZHSHF6UlJaa3FqSHZUNWdF?=
 =?utf-8?B?MXVjbVBYT1NRKzByTWpYSzNkNG9GNkdqSmdwMzZSaXRRZ1RzazhwUHVMdVBQ?=
 =?utf-8?B?bG1SU2J1bGE3TTlpN1hsay9yUERPZjUxUDBZeXJoK1ZsR2MxWDl4U21JUjdL?=
 =?utf-8?B?TzdEd1hpU3JzbDA5eUIwT0t3M3poRmNpRDRLM1hpWHF2UjJsb0tXMC9FUitv?=
 =?utf-8?B?UkNYQWl0aFJacUpDYk02dWcwSjJjS3RTNW01dTNnQWRBcjIwN0xxblJnMTNw?=
 =?utf-8?B?SmpSdEhmRHBxdVNWN3I2Wm44azJGcm9qZy9ySFUydEVOQzFxUThFcTRsRERi?=
 =?utf-8?B?TWpzRTJZR3dHRk5YblI4czgvSmlMZjdHZmJtRFZ0SGNlWmRnRjFPMVFHQTlW?=
 =?utf-8?B?SU43ak94K3VkZ2RaR2RTalhUZ0k0MWNWWk1DWEk4cklrU0xmbmhGMzN0dEtv?=
 =?utf-8?B?Q3haTWlCdGpyM1VsVDd5WE1GZFptUTVRcjJrcTVhMElzNFJKNjVVS0Uxa2t5?=
 =?utf-8?B?YlgrbWxCU2EyZnYyaHFHVnpnZU1uR24yNHgvdHdmV1BRb21IL2hEWkgxdU9v?=
 =?utf-8?B?ZUgrQnpLaXNidzFyb3BWTG42VEp1dGdRTXRBRnlHL3RWWEFwc2tNSnNqbHk0?=
 =?utf-8?Q?nBOdK6u8lAQBSNQ0=3D?=
X-Exchange-RoutingPolicyChecked: KMNRic724Pz1dzI8mNs1+714M+eKozERG1IFMAqKaKrHq4+5awOvAml024HHRU2EDEA/icO/G4ADv9cQebHNJ36z3mBy02uGm3Tz6Ss7kDOotiNPgi70EOyQ6jcH8ENNUOHyU5z3RJU8PrcdwxGl91JMQXScdYaYEjP5xqxmzDoKD2qZUsK9HVd3OFQn9LS1WWHaSUKfuuXvp32jXngraM7liLv3jMzqNXMY/KgEj7IAN12fZKGPHd1Nn1fGvU6IADjEyKESuQw7xi2Y/2UnlytCtNgIsvSHb/88c/C3R4h8xRohJ1NOQyzfwB+lnYU4fTK+zCmntH9VT0dj6xzx2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c94407-e490-4003-a0a7-08df3535f67f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 20:56:39.6434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pytkDaFpwJ0KvoiojtSOAc3VDdaKGzjLL6p1ZhWUb0a+gW9/9NqudyK1sKtO/BN/iPeyV5tDI26lvMDRQc4lHxd7K5S24GixtjTnx5h7Kbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
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
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/28/2026 11:19 AM, Badal Nilawar wrote:
> Release firmware when the "LTES" manifest entry is not found in the
> firmware header.
>
> Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 768442ca7da6..1bddfaf0fb9f 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -335,19 +335,19 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
>   		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
>   			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
> -		release_firmware(fw);
> -		return -ENODATA;
> +		ret = -ENODATA;
> +		goto release_fw;
>   	}
>   
>   	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
>   	if (ret)
> -		return ret;
> +		goto release_fw;
>   
>   	lb_fw->payload_size = fw->size;
>   	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
>   	if (!lb_fw->payload) {
> -		release_firmware(fw);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto release_fw;
>   	}
>   
>   	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
> @@ -356,10 +356,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		 lb_fw->version.hotfix, lb_fw->version.build);
>   
>   	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
> -	release_firmware(fw);
>   	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>   
> -	return 0;
> +release_fw:
> +	release_firmware(fw);
> +	return ret;
>   }
>   
>   static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
