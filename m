Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78A1D1D88B
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 17:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCF010E0EF;
	Tue, 15 Oct 2024 17:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLRCFpEP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE4A10E5D5
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729015157; x=1760551157;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=47hlRYUYxW5CRxvWKSNMs6kMKnH5ipUfkPtONDuvCd0=;
 b=mLRCFpEPr4iUjdPTKis5XE6swH/LGaDME+o0jW9T2ZlwDZZlXCYBPUyX
 h/qDFKD5xSbMHwilRgoUk7jarx+94AE5hmwKDd34oodyJU2ROIJOj7ETC
 AcyqW73Sy0lXenp0+kjax6m4M/SjkmPr1Aji5QBA+Kk1vSwNN2XKlZ17Q
 BNulkMzY1eazqn6S4WZhR6Xx3tkikgXKj7ZzAtEmr2oO1FYewbijikNHB
 OU/iZPogeDZkHdObfQ+UqRLw5Y9dlJRxqOBN1BAa9WbKDadX3SYE4SWG1
 2MjG75NhZFEZVRDXngZ9BXl03H3MPHaJXEFu/48BnvA/EVE1VMFLJ27N0 w==;
X-CSE-ConnectionGUID: tN9luYu6Q/Wx9aJCjAG5ig==
X-CSE-MsgGUID: J8VOtEnpRjmK92kGfb9e8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28557416"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28557416"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 10:59:16 -0700
X-CSE-ConnectionGUID: IHjsuOSqRXmvH93TLv5Nnw==
X-CSE-MsgGUID: L+JO47TRT/2Cz0yySWVmAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="101300580"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 10:59:15 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 10:59:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 10:59:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 10:59:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 10:59:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vz/IQdtUjk5H051fjOomG9O30/UAXpMNpOAsQhxnV818CUkcoYaaUYmRhdwn34uV+N8IQ7uTyg4G6U7sjjjTYRVO81FNY4LF7hlJ4iRP9D3b9/6r+UFR0OgoIutz90D82hjnvWaoVRM0ixVRvv0vcs9xuuR9uaKpQ3bTyBohgQ4FrUUSsJ35tiZ20IxGnjl+DgejXIpOr+FgtXejt/BWt1CG8GJBEstK42Bmo8aN75+Wuc3cmlIua760uBwkEAetWu77DtHWeswNk8UxI+PWDMHt8oJCy78CAbdM+xDx07J5opNmNNkjDlfxaSCjOlkppaXxngtNwAFn3XMCXKoRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYQmpeMPdxUjf4xVs4Kan2PL0HJwJYO6kElRVAAIFMk=;
 b=eala6O86zAb9mKntMTMvgCs+SmB3AzBOf60ZGau6Kh/R0gGDptElU4lsr8fzk3a2BefyF97Hij7cFHvsYx1qUDwT/ldKq7uZ38TvBOozu+5wx4RSBOOGyOlnrB0NyMQeNGBnhv5mDLLpW5psUYaIw7NKpJKUd1fwq660vxXqBemlMw7x0PDeQ9CMfuJ6Mh0maNSWejzlDiyX2wnwM9eUfYUx/4QwvlwV2/M1tKk8E1F/L9NPfDr1eGnQ0nLhnhW5dLaH0wnaZsoVCLUMx+PoUj0QHtBWBWZa2HD+hg1+FGP30yMY74Xx9EOyMF0kN9ytFVNWEv+1Uyy23C7bbDmn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Tue, 15 Oct
 2024 17:59:12 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 17:59:12 +0000
Message-ID: <3893229e-a54f-4847-9740-60d18637b289@intel.com>
Date: Tue, 15 Oct 2024 23:29:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/26] drm/xe/mocs: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-14-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-14-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af776a6-c99d-46b6-e8e0-08dced43133a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlBCRE1OK3dwaXI5dEdpaWMvdnNjY0x0Z2RObjJpQ2o4MzBkNWxNRDE2N21U?=
 =?utf-8?B?aEtoVXJoU0hTRzhzU1MranYxWWhTWU9tUENaTlZuRU5NYjlyMS9ObW0zMVpD?=
 =?utf-8?B?WXpHMVIvdzc3R0VMYkRlWWQ4emRROVpMdkFDc3RkbTlvdHZNenJPM2J0elcr?=
 =?utf-8?B?UFRzZUp6YzNNcHhjbmx0aU4yOW5rN2ZnM25SUndOc2YyVHBhRnB2eHpOMnk5?=
 =?utf-8?B?anhHZWtJV0M4UTc3L0pUeFlsaW1PWTdvZWMwUzE5aVRJR1A4OGF6c3Nybjhs?=
 =?utf-8?B?UEFGaG1NZ1BkOEJNYTFqcWFNTUJkWEZNNFFQV2c2WWJ6UllKTERKc0M4eXpq?=
 =?utf-8?B?OTlqYVZjaGdtMG1oU21nZ2pVQWlzdkNVaHp5VS9aQmd5em5ka1VkSzUybzN4?=
 =?utf-8?B?blRBd1hPRkduVzZpS2RMa2tkWFlMMzAwWFNOT0l0WFA3RU5ybXRKYzFiZENk?=
 =?utf-8?B?WHBDd2c2UkN5bC85cyswTXNseUxBeGVJOHQ3c3dNb1diWldBU1hqWGtaeVJi?=
 =?utf-8?B?cGZjTURwdzVHWkJodGdISGtRS2ZIUlJZM21XTG4xdHgxa1FmNzg4UjZOT3I2?=
 =?utf-8?B?Sk1xcFZDTkgwWWhoUWVBSnJrMEFGNGEwMlhIbkw4cit6bjR3dWNYZEFqTGJk?=
 =?utf-8?B?Rkk0NTNyQ0JtMm5IVTY2MjV6Ylo1dUI4YXZLQ01odlZqTlVLbHFBUENYaGl0?=
 =?utf-8?B?dnJwVE9TNXduSTJlb0Rzd2h1QjlZeDRxZkk5UGpMdjBCMURxb3QvOWN0Q2Er?=
 =?utf-8?B?d3VDY2VHbmhZZTJVb21MYUZ6Z0VhTktnb05KdGZuMGpNNU84YUNwaEprVVRl?=
 =?utf-8?B?Q01Pa2k4amFDbFVFc0F6UHBpQjlmcUNxcy9zR1F0SUpiQ0pEak4vNXRMT2dF?=
 =?utf-8?B?L2drWHpUS0hZaE1QNnZVelpyamhpN1NmR3ZDUEpucFN5Z0VuZHkwamxlbW9x?=
 =?utf-8?B?SXZyNTdxa0ZIcUVGTSt1cURHUmJZOUM0WmlnR0tHaE9COXNONVUzYmdSUEtP?=
 =?utf-8?B?cllXNHlvMUluVXhtZTV2U3pEeUVETnNORnZoN29vNXZmdHdOTTBmZ3VNcVNk?=
 =?utf-8?B?a2F6Ykd3aS9tdXJ4WW5sc2pncXRFc25UajRIK254TElnekhpYzFTYWdGSGlX?=
 =?utf-8?B?WkxXWFRoNWpIOWZHNWxldVE1WWVCTjdyTnJpYmN2WjQzV1ZyNGFjZUo0SUM0?=
 =?utf-8?B?SXFhcjYxRzRETzFVb3Q3SVJuY3duWUMzZ3V2di9DZ28ycStrSnRmMC83cHpH?=
 =?utf-8?B?MnNvK1FmMjEvZTNKSnl4UGFuOC9hUEZkL2RCNUlFNlVncGphNlp4RTVPZkJl?=
 =?utf-8?B?OFkwNVdzVWFQUGRhVitXWHJuems3Y1Fod1V1Mm56S3BvUy9XU0w0MTU3RFRC?=
 =?utf-8?B?T1lnOXNBU1dGbFMwUENjWGdndkE5L2pJdUc0K2hzSDFRODVBVHBnTTVNcXk5?=
 =?utf-8?B?d2Y3a25JSTNDZ3dTbWFmTkdnY3VSTjhVeXA4RDExY2NnTGt0OUxnYitvZ3N3?=
 =?utf-8?B?SnhwQ2t4dG5wUUpOUFpnbmgwU3plWG9lVVE3aGh0eFo1OGJDekpYMHpwMFdQ?=
 =?utf-8?B?TEZ2TGM0Y1k4YmlaYVlqaEphZ3ZIdUJibHIvTS9KUzBYbHBTa29LbWFYQUk2?=
 =?utf-8?B?UVlWZlVrNmt1eWFtVGtjQzFleURhQy9iaWpsTkxIWWw2WFJVdW1MT3R3LzN3?=
 =?utf-8?B?Qy9icEoxOFA5WEdLSWhtRUY2S3h0Q0lXUE56MCtvNnMvSnZoeTMxQVBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGR4SHdJd3lsK3lDcERLUU16QWk1Q0tST05tclFXVzRlVTlGYUxEUFV5RE9m?=
 =?utf-8?B?SXZIcUdsVkRtTTFDMVgxVzlidWpBNTRJbXZKa3ZRcXprWjlObUhoa08vaWUz?=
 =?utf-8?B?b1VySzVncENVaFNmczBOWklTazA5aURBM0RmV1hlZ0Z4dGJnaXNyU3dqZG9K?=
 =?utf-8?B?RnRCVjZyMENRNEJMVThMSGl4bDVJTDNmcFhSajJobnRNV05wbWtrSHRtWXVX?=
 =?utf-8?B?N21wSXhWSlFMUkxFQjRIeDZsRGNQREc4OUd5eGxiem9rK2RFQjB0Umk2dkN0?=
 =?utf-8?B?aUx3TGRDRkFEODVIRFhHc2lCZGR6VEpSQUppekdUZ2IyN2Q3K09kNDlrRWtt?=
 =?utf-8?B?bnBtMGZXSzdVRDhndERiV09KdUh3aW11VmdnL01kcFlhancxcG9nNVNzcGs3?=
 =?utf-8?B?cnp5QmVNOUQ2cXREZDZOUEYvZiswTlZOWEFreXMzVUpHdDI2N205TU1NMTBh?=
 =?utf-8?B?a2gwWXJydUNmMlBnWW5tMGRiMHFTYWNXeDl1cVphakNWVGtDejJwUU5IeEtH?=
 =?utf-8?B?K0oyQXVzOUs5ZjRaeVEveHk3dVhubzM2SXBoZ2JpMGhDL0QxdG1nbnl3a0Jl?=
 =?utf-8?B?OGZ6dGp5VFp5ZjkrWS9QSkV3eEtxUjVFM3RrSGhzbzBFYjIzQ2p4MkE2WXBx?=
 =?utf-8?B?NjdQOU44SSt0UXJmYThWRG4vMTNuWWhVOFgvTEtJUTJwUHRpTWdxNlZsWith?=
 =?utf-8?B?cENXWFhjeXlranVaVnJJZ2NUSmR4VEptTTVkdi8zY1ExNEtsaWlabjdLakxj?=
 =?utf-8?B?R0ZmY1NMendXOVpJTUxkbUYxcTR3RWZ3Nng4dlEwSE1aQmVoYVhMLzJWRUdx?=
 =?utf-8?B?dUNZck5FaERETjNUSWwxejRFQmFFRnJJaHFNRzluN2ZlQ2xXRjRabTlXREQz?=
 =?utf-8?B?Y2RLV2V4dnNUTnZMNXJLV1M0YnpKdXYxM0J0STdIRFdNa0RUUndSSURlZDNQ?=
 =?utf-8?B?UW52OXM2aGxtemN6WFpteWZMWWxMOWN2ZWNQcTdmU3UvK1BIb0J4TG1xTHow?=
 =?utf-8?B?TUpXQyttbGlqRkM3K0RhbE5VQkZneGVNcnM1cUZUdDVoenBIcjBuR3lOcXBP?=
 =?utf-8?B?K21zVXc0bzlKSXRENklzN2paM0Y5T282NU10NEZiUDMwb0pjWm9CRWgxZERx?=
 =?utf-8?B?ZHBZNUtvMU1VYUc1bmNUWEdpaitwUGF5QkFwZkdMUXhGZGt6WEhuVGkrYm9s?=
 =?utf-8?B?WlhScnVHR09CYVZZYlowb0QrMGk3dWIzOG9Od3ZjL29Cc1Nva3Nnbmhsd1VC?=
 =?utf-8?B?M2I2TmpTUnI5OWVLR05zbjJMYklqQklaZFNxOTBLS1hXM1RqQU9pUXRocnNy?=
 =?utf-8?B?U2NLSFliZ09kV1M3a0E4YUJudzFRNkxDbzlXRmx3M2lTd29ZU3lKQkUwTHdm?=
 =?utf-8?B?azFNUFlQYWluM0prL3Q4Q1A2cE1LdFRVRTBHeG5nNHRvWlNLWUY3YVBQNkNE?=
 =?utf-8?B?K1llZ0Myb1hSNHZhajR0S2ptUzNzMHFreUZER2NCZFBtZ2hYckJMaXF5R2ox?=
 =?utf-8?B?V21LSHNxd0dOTXZNdjN0QWxIWDNGMWpmYm9wc3FSc2JMWUZ2WmlTTllWKzdY?=
 =?utf-8?B?K2VhWUxLMjd2RnNTSFNGNEZrZUFRZFZ1d3MwbERuY3NrcDB6dGRERGpJeHZs?=
 =?utf-8?B?Q0pYT1NHVzF4K3c3NFRJeGZQTE5VOFlOS3JJVkM4a2hhcU9YMDcxNXI3YVZz?=
 =?utf-8?B?eHdqeERkUGVSN0wrWm5IczJKUGgzb0JCc3FzTXlsdHUwNHArd1c0NTljam80?=
 =?utf-8?B?cGlRTW9ZR1A0VFJHWHpyMkRCRkxDeVc3S2VkR1p3b1M3dmpmOWtDUDNaNFlx?=
 =?utf-8?B?UE1MMVBrU0ZuMmUwZWswOFNxRnJHbUtaTjV4TnFCb28wMnJxbW5JZ3EreXhS?=
 =?utf-8?B?eVdYY2pXbytjZFZYNW45WE9EU2pQbnRpNWgvYUFxd0YyODhVNWI4bGtjQllN?=
 =?utf-8?B?KzNRb2d2QjJaMFZBZ1k2NE4wNk9oVlpHK2thdlJQb2xHNU1ld21rRnV1Z1dy?=
 =?utf-8?B?R0dTWVQwblVSSm1vbEJuM29mbDlHN3ZMNWIxaVZqUWpxbDRrVWdiS0RxaFFk?=
 =?utf-8?B?UEppTDllMnp5N3Y0UlRza2R5QzdLdHVEanhIdExFa2hNR0ZrTWp6S005TTJS?=
 =?utf-8?B?UkNLQjlvZzZHazVoaHB2TlNlNU9rZktCUGhidjhGc0IwN0ZRa3VZRVlVakJM?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af776a6-c99d-46b6-e8e0-08dced43133a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 17:59:12.4666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfUCUjF3WlASHcbol1AcBBRwxSJ0x/pdTcgWvIhf8B8yMPDHlGcJMwG+V5bEk/HtWBgvYIvlXYYWGX9hKCKG9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - don't use xe_assert() to report HW errors (Michal)
> 
> v5
> - return unsigned int from xe_force_wake_get()
> - Remove redundant warn
> 
> v7
> - Fix commit message
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mocs.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 231d0e86ed83..54d199b5cfb2 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -774,25 +774,21 @@ void xe_mocs_init(struct xe_gt *gt)
>   
>   void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
> -	struct xe_mocs_info table;
> -	unsigned int flags;
> -	u32 ret;
>   	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_mocs_info table;
> +	unsigned int fw_ref, flags;
>   
>   	flags = get_mocs_settings(xe, &table);
>   
>   	xe_pm_runtime_get_noresume(xe);
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -
> -	if (ret)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		goto err_fw;
>   
>   	table.ops->dump(&table, flags, gt, p);
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   err_fw:
> -	xe_assert(xe, !ret);
>   	xe_pm_runtime_put(xe);
>   }
>   

