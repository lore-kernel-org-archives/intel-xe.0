Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8688E606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 05:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bSuV7O7c;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=H7Rqq8dP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC910E045;
	Tue, 17 Nov 2026 05:50:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775E410E045
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 05:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794894625; x=1826430625;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9rcEdduVNdx1jZUXE6kfdC8MJn2GUDBMCNpOi/lQSrU=;
 b=bSuV7O7cYaPJgHO+/k24wLhDkjWh54Tin3oN1A/D2BHBlea4DdWRxBZm
 zVbHOpE1JcQRKcxVAiqHaXX8gDlTxktbCXsSFP6r0EUiSbz2Tkkni/Q2c
 2xslyEaRV8va4GXt8bc48gCWpeIRBjoOpHAfaDnn0KkUiqpjVPJBHB5it
 QCtw3g+3aUgx3DA6S2I2jCkeZRIYkaXsp1eBuOuZty0eTBJobS7KQYkqQ
 4g44aN8MGGmZSWX2ibWVeWLh+gaiug5hYb14AapKG+9DNq5GcHCTVQNJ0
 LjHKYRGPpgVx5eWj0gYHyRE2SOeXlvQc2N/iIjZAw3ZY1Kpjzq4gDRecB g==;
X-CSE-ConnectionGUID: XvCewbiaTTeVah2Mj1n8AQ==
X-CSE-MsgGUID: oV+9B/AQTbqH22+JEuPJ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3551482"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3551482"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 21:49:26 -0800
X-CSE-ConnectionGUID: FM9ces4HQV28+8Tpd2mENA==
X-CSE-MsgGUID: x0uJFOxkRDK/PojrUGjmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9787175"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 21:49:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 21:49:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 21:49:25 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 21:49:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7SSO+ZYaU8iNsZSX/E7kVXGy+RXXiY1Gs8G/SzqNK0k6WCbZzwa2/h5kKoIW/1hri5i5pdaAauaIX1W9no6ltHtQYknkt7UbP22DImgswHgR8KDWW3xKuy8VysF3pv5D8ktU3SrAIXhS8acvt/hQLRdYQ8Gw2bDZForbvjvyuk6N9udTIZugB64KhShyc744VyLmpMZ3FHxFNC1+XXNu1HQ9nidOAAsda4+5B3ZGtOv4Qufr6Tr34iZnm2cowNUduKVoySGojfdliyuixTo79HbIUx5/DSbnM7dom++GzExqTzckMlrJfnqrNcNb7l8jgwrTVavyVSv19+c0Ck1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLXgm7JtDoV85P5n8oZ7i1/6bOb0srpqknTG6IFEDp8=;
 b=bR+jDRR7K2Z3xT5BlmyXaywZq69DDczBCmAa6WZVhQ70SSdu88Caay6L0eTdiwyGD5Crf+z00pG+Lkt5rkd9dBbWxEiHMtmFcCGdEhrQZnmgqDtY8n6ah6XoSBFskk0OUzN2oGvPcjWYywVIYhahyI4Z9e0n242zpXnHsHKJT55lcnL5BZ6i7bJj+2yAkODSm+PW2jzX2LdLCQAcgNrbKElW/sEByndBpYcxrQFNVTNM5ltRCOu+RoE1r5/HjvmdnoQVaQ34JwrxzIxmTQbKnGCxniS46Kmr4KoTBZe0wo1toHrCXvf3m0bc70JqMP2ZoIyHJcnakXMgOaKe0sgCIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLXgm7JtDoV85P5n8oZ7i1/6bOb0srpqknTG6IFEDp8=;
 b=H7Rqq8dPamqGSvtkwuQ9cZUM5O2eRUyrqYnf8gg5fe5TpcJ1nt8tNdZ5KnHLZeLaPImoBKDocT7qkhEYELnPahMsjn2Rr2iPpHFRjpvFrB9ZYN2tcYuN4e58Zdf+OMc5oexVtgLQVcqT8TPZ8AoRVjvtT/bEO98jk61vOiburlo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS4PR11MB9603.namprd11.prod.outlook.com (2603:10b6:8:34a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 05:49:23 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 05:49:23 +0000
Message-ID: <15eee851-2dc4-4ee4-8e7f-12eceb43f54e@intel.com>
Date: Tue, 17 Nov 2026 11:19:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] drm/xe/cper: Prepare CPER headers for software
 errors
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261112134636.1860446-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS4PR11MB9603:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa896ac-d523-4b2d-e63e-08df446e87e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261022105027099003|261102123227099003|261028144727099003|261022113327099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261022075727099003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: X0rztW7BX3V/4MVFKt0ot7VA6F3lIS91OPiJggteJEQ93HpLcuutUR0+0mVgUTzcQIVgAjjMYhEwav7Xewuy8FzVFAPjDC0fjIrfegEHLdXIn8iTBQZva2noDKMmuF1hOLzfyzYApUPZyAIxaq/Xrp31cboB1NaeERfObGQDika73IdvyVOR871OWH7nQJeSDwCE+RuttBWtd44eBlz+n3JXxZWSShN4li5FKVtTdErEVoR7wFm21xCNg68w7ptm++qUDgdToWrfFZpB8fEUsk+KHOQnWA1pYlX4n95uUQoW2SObv6i6I2e/DZ1rLKAXLi+8C6qZdQ0Jzomv/8C1W2OffHLfJmL7k7pxJwMVvTEFLM3y1EfdET0EvgMWIxu7iLga01Eaz8uKXreAOaeq56zkC33NlSt5VfmlpOlwM6MF+4T15ZV7mDenQ3DyEskhC3Vhdb9xd0H1+1jrgLhyJ4NKvlNQpEw//xliKZSI2cmewRW8zbAAoaz7dOqwXjls2GbAjlRozI7gCOJ6y8ARD39AzZInF5p/3uOQceWl1l3SQQzg4Aup+gfg2F/EvrIW7dQhoNJpnTxsUT404jZUhgnzsnrz7Vas/RjCK0mABVzhfiZXfFKfDgu4is+oAqZNzazPSkVa/fUpQifSzrgKeDVJGsZYL/7slew3BgBk3hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261022105027099003)(261102123227099003)(261028144727099003)(261022113327099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022075727099003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003)(261009221227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0c4d0UrUGJwWTlUaWp1L085QXJ6dFdZcVljS1hwemdXd1lFejFhd3doZGp0?=
 =?utf-8?B?akF2UHFNVFF4QVFQQTJLaVJRaHFRaWtLZ0dPUW14empIbVVvNWhHZFhRY29w?=
 =?utf-8?B?Nlp6QStFdUNFMTZCUnNEYUlJcGk5Vzlya1ZMaldMb291OExNK3NPS0hpY3VC?=
 =?utf-8?B?NUpkMUM0bUJTRlRoMi9wVnpyc0t3K2RLamlJWUoybyt4M0xnODgzTC9ualZP?=
 =?utf-8?B?RHdGSEk3N3JZL01LcG1tTS9Ld3RzTk80dmxqVEI2SDE1NkV5Ulhic3Jhd3Fa?=
 =?utf-8?B?VS9QY3Vzb3cyS0c5V21rT0FRd1YybldhRnFpV010c0tsWnZIOWF3ZkoxMGFo?=
 =?utf-8?B?Nm5HUk10Y2ZOTHFldnBVQkxpNXN0UWw0Q29nT1JXczN1UW0rdktxQmhEcldW?=
 =?utf-8?B?S01laWNQV1lMK0o5amxCcU1Cb1FLZXo0V1NJbHJNakptd2FGNjczR1E0b253?=
 =?utf-8?B?OFJ5eGVINVdPTU1vdGhhZWxFR1IxcGZGcG90VVV5UVF3Q0tlZ0ZFQ2xObW9o?=
 =?utf-8?B?Vk5QdkQ2WUtFT0dnUmRpTnFsNE90VkVDSWJ2QW5aWVlVWjVsMnNwQWRQTC94?=
 =?utf-8?B?QXY5eldDUENtUXZCcG1kWlpvWDNva1VRYkRFSWkxbkRkRTV3Njd0d0U4N1R1?=
 =?utf-8?B?V0Y5NnIzZFJCblduME4wUDZTWExaQ2lhUTVPMEJrOEJkZjBWWDJaOGcwZDAx?=
 =?utf-8?B?VkJ3VHY4VHBzTUVOS3NFWDNHWjkwQ0xLUERRdnQrWXlNU2J6Q1ZuTTB1QTZ6?=
 =?utf-8?B?MDcxbEx6dml3WWw4S1FHSVB2aVRDK3NCWU5vUjNKUmYwMGtzOGpnZFE4dXl6?=
 =?utf-8?B?WEVVZUtFUWp4VWtQbkhaejJqcGNKMndUMXZCNWcwK1pJMjUxTlFiOFNyNytl?=
 =?utf-8?B?VTFqK0hqRjBGQ2xLaUprNGpPMithcjdnY1hCeG5EWUVSNTlpSmh4RTBJRVJW?=
 =?utf-8?B?YU5mSzFQRERuUzZwZzNxOVRNS3B0NmFhTHZhU3pPZ0RLb0RsZDJ3dU9sSm0y?=
 =?utf-8?B?UCtBeHJrWkNZekQ2WTlFTmhMWmNnbWJNMGgxL1hlSTd4WWdqeVl2Ry9zZ09x?=
 =?utf-8?B?bnRod2R0cVFZaHdsL2NCekdNNkxYY2M4U3dQWTFCeER6aS9UZ3h4N002aC83?=
 =?utf-8?B?UzVXTHNWUjh0OWpKZzhzYU1HT1UxamlvdllVQlA0Skgxd3ZTbklTaWtoelIr?=
 =?utf-8?B?bG40YTBJNzZTdHFnY2FhWStxcWVwd2xnOXV0czV6VXFDR3lEQzdmL2NEOVBQ?=
 =?utf-8?B?Wk1TeUtoK1A2LzdkRStjc1cyZ1pRQ2g5SE5hc2ZFbEJOa3dyanNDMWtDNEUr?=
 =?utf-8?B?eDg0N0NDZTJLZ0VIK01zWGFiTEpkQ0xlYms3K0tDMkZiTmVWUXBsSElQUEti?=
 =?utf-8?B?QXE5NzZaUUlvUWJUdU95THBBVDBIcmJwU3R2amNYa3lKYXBwS0t5MXdlOTY1?=
 =?utf-8?B?Z00vUTQrZmZIRGNnQmQ4eFZQaXM3cDhUSFZTalE1VDhVbU00OFgyYlpGMWF1?=
 =?utf-8?B?Z2huOGR0dVZ1OVc3eUdsa1RoUTdpVE5EbnVyQ2kxdkdGamhUa2wxbnFqVWFz?=
 =?utf-8?B?ZUh4alZydnJtaklianBaTUxxK2Q3Ry8rTFZ4MGxrKzlLSUpnZGpXaVdheVJF?=
 =?utf-8?B?N0VHem5Nd01Fa3dwb2pVS2p6bDM3OExQNldJdks4MHhtWGtoNFhaQ2Z3NnB1?=
 =?utf-8?B?eUs4MEpnL21zZWVhUkd4ak1iS3B5dmNMNmhRWWJKTXdQV3VQZk1KZW5ZN0tY?=
 =?utf-8?B?OStCdnBXelh5V2ZyRytwZjlHUUJqaWlnNTBaOXhXa1lFWXZWZ0JLemdUTmVV?=
 =?utf-8?B?dkdoT044RHhadmxZakNIVUtLd3lldWxHdlIwZ0pPTnBzUjRPQmgrbm9HWERi?=
 =?utf-8?B?bWdjQXB5QUczSWVUb3MxY2lYS053ZXhBVXhXUFNxa3ZYanludGtsUllhTk8w?=
 =?utf-8?B?L1k3OTMrTHVBc1NqcGFVVnlRQlVwWXJaNnJVc1AwSTJsT2o4UHRZc29pSVF6?=
 =?utf-8?B?YUFmR1NibUl2eDlSeXp5b0I4NDhPSEZvRUQvRThETnM1bkFzaTFhUnNTOWJW?=
 =?utf-8?B?Wkg5ODAvWWR6UFh3a3pmcE9kbE5BWU45cGNLRTh6NmM4eGwvckVOZ2dsNEl5?=
 =?utf-8?B?eWd4YkdLRm5WSi93cG5pRm9wSkMzZGFwaUw4SWcxQm8rTXlQbFRTVVplMmxD?=
 =?utf-8?B?YWFHdllpT1Q0UHBTMHhQS2E1TGRtc2RObzEzb3ZWTCtUcGVYN0Y2eWR5dm0r?=
 =?utf-8?B?bjRzV0NzeE56MngwaDZrSXBiOXhvcHZFbldCb2ROeHFzcktKM3N0TFZDNnJT?=
 =?utf-8?B?dlNVZjZnVUF0aVFkMFNCWnk2RVdzdXlEV1ExcVdVRjRzLzVxdFlRUT09?=
X-Exchange-RoutingPolicyChecked: iEhy6JfPwIofkADhxmNXqZc9bpPK4OSp6ZPvHVXVEXOhmo7D+xkpNYoKHWi7AHpmt5z00Jx1SS703llQElOkqioDasQ0KKEWsH/eKn+7UAmHkfO6jWKtpMVBEzAYw9mbjfGu61ATm8Gal3VNh2tG8851CLXJCkdUVcC2OlrF9PoE+WerZfgE1HuIoLO+2X90PdBlV2aizz5Fc9atzBFlDiFGetI7lfFD1I5VJIUHImsdsEoFAN6zu3Vsa+Cpx1CylBKjWZ+MMEHACj1NdKqjne/wH6Z09F2OWodSl7U9QDkC26Y6ZP2V48Xz32TyIBuFjdCjKx0bou5w6huIRJZJ5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa896ac-d523-4b2d-e63e-08df446e87e5
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 05:49:23.0726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWIt2BKq5dQ3E13TCEZtKC2g25lYacecpnEAcBBGjvAWULJlZjx1eetE/aMIHSKlEzlcelrDsLTFvmonAtQE2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9603
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


On 12-11-2026 19:16, Mallesh Koujalagi wrote:
> Add software error classification support and reuse the
> common CPER header initialization path.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Move union inside xe_cper_intel_hdr structure. (Badal)
>
> v3:
> - Introduce structure where it's used. (Badal)
> - Move error-class union inside cper_init_intel_hdr. (Badal)
>
> v4:
> - Update commit message. (Badal)
> - Use ktime_get_real_ns.
> - Add BUILD_BUG_ON. (Raag)
> ---
>   drivers/gpu/drm/xe/xe_cper.c       | 24 ++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_cper_types.h | 34 ++++++++++++++++++++++++++++--
>   2 files changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index dd6d4251dd1d..b23f8bc9f993 100644
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
> @@ -92,11 +94,14 @@ static u64 cper_timestamp_now(void)
>   	return ts;
>   }
>   
> -static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +static void cper_init_intel_hdr(struct xe_device *xe, const union xe_cper_error_class *error_class,
>   				u64 first_timestamp, u32 sig_id, u32 error_count,
>   				struct xe_cper_intel_hdr *ihdr)
>   {
> -	ihdr->counter = *counter;
> +	BUILD_BUG_ON(sizeof(struct xe_ras_error_class) !=
> +		     sizeof(struct xe_cper_driver_error_class));
> +
> +	ihdr->error_class = *error_class;
>   	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
>   	ihdr->sig_id = U32_MAX;
>   
> @@ -219,11 +224,12 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
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

This can go in single line.

>   	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
>   }
> @@ -249,6 +255,18 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   			     u32 component, u32 location, const void *data,
>   			     struct va_format *vaf)
>   {
> +	union xe_cper_error_class error_class = {};
> +	struct xe_cper_intel_hdr ihdr = {};
> +	struct xe_cper_driver_error_class *driver = &error_class.driver;
> +	u64 timestamp = ktime_get_real_ns();

Same as rev3: Initialize timestamp closer to its use. Please do the same 
for driver and maintain reverse Christmas tree ordering.

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
> index 68e30df0440e..8e90a3220919 100644
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
> @@ -52,8 +75,15 @@
>    * All multi-byte fields are little-endian.
>    */
>   struct xe_cper_intel_hdr {
> -	/** @counter: Error class (severity, component, location, cause) */
> -	struct xe_ras_error_class counter;
> +	/** @error_class: Error classification */
> +	union xe_cper_error_class {
> +		/** @error_class.counter: Error class (severity, component,
> +		 * location, cause)
> +		 */

Keep this in single line.

Thanks,
Badal

> +		struct xe_ras_error_class counter;
> +		/** @error_class.driver: Driver-detected error classification */
> +		struct xe_cper_driver_error_class driver;
> +	} error_class;
>   	/** @first_timestamp: First occurrence of this error class, in ticks */
>   	u64 first_timestamp;
>   	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
