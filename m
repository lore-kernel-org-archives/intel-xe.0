Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15DFC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 07:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B280910E996;
	Fri, 28 Mar 2025 07:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CResR/w0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62C10E996
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743148449; x=1774684449;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u6QfD6Jv2Qxhp0SzEBJYZoPr/71dUrdB3rUxMqnPb18=;
 b=CResR/w0uJYokBg2/jZ7IdJtLv8O43VPFo95mew1RHtKEXOiy3YKbA/C
 2rSf5zUIV5VJpmJWZrrdf3KgJoqDIfCkNBCxO15KVNYW02jWSbmqSp4W+
 O7erKSHUE2rV/Jq85UgFqfVE3oS2EwUSDXBityFcXlPMRSsUcdNoQCnEd
 jyjSs20FsMqnc/ucMGshLEHtbnr1AUpynuneDIBuTiTyLgbnUJQuUCe24
 O+agT+cj9aa+ErSqYDRMYqxwMlm0BODAw7rqGaWth7LYSpOueJOhqB9ks
 N6A9g5aKELjr6ZeyDCcFUobsiPYWmxdQEAAbg568pWWveCbm3qThW5dXw A==;
X-CSE-ConnectionGUID: 7f1iJCnbTwm9zf8VFLaYSg==
X-CSE-MsgGUID: F+UMXABgQtC808l8dRIhZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44420134"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="44420134"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 00:54:08 -0700
X-CSE-ConnectionGUID: znECS5J+Q5WkF/U38rMaqg==
X-CSE-MsgGUID: HQDrZ30kSjC4n1M6v64wog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="126302769"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 00:54:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 00:54:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 00:54:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 00:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0kY5nj2HyYXUd4jE/0deWG5EgpJFeQI+5cEl0/9m4bFDjoLqnJdVHASyY8c0Xf7kxkSMiMRRr23e/eaZpfwfIhPpbq0s56JiYUMC3ecrKVtI7XtZZFR6guYw7EC19hY1XSHbyFEzSYXZkRa+v696LhsMCQAX0XWzs3zfZ+ISk2kHI4qOKEAXxt603L0t478P1BTeg4mG4gDDhwJLstCvd6LzvKyaJLqb0uy2Wwqwb3bbmUkLsmxcVJz/oMuyzjGN9cPeYVZOgDM5+OO6938EvFYMVa+ecahzc2tFajfQWVzbSX0WNxkYKEu/5g4kcmy9zjXYrlkDqASLn0UUCe6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0s/n5cnLbKO3oHNCHPBip1ryQaocfHDk1m8RkMbm3A=;
 b=JMIAj5IUP5U5sWLtb7Ae12nh/TE2O2aaEAJ3PLr/nzx/mwEtefxHA32j1hneMTcdYetH9ey6dnpl1XAERSTMIKxqHl1qndTJtOdVEZEx0KUwoly7n9zkxYHHQ64WDvbQ1jBEmjV4YmcByYKOVJnwztyBGYizzaEgGDOQlCZqBXjlI+VjtAUrfBlkWS30HM21G9sUTaXYpwcYiYn0nFUw+rCtHXsOGdxN3F89wmtN8M+eEojBbc5gUv3o8U1SqkJiJkI14rqep93A7ZPH1pb5wd3yjzqzsNq8du7ISvqTtODvXkWoHianN+3MBvLLLUXcrChBhSlh1cXwsxrd+LELxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM3PPF99D0888FA.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 07:53:38 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 07:53:38 +0000
Message-ID: <2b2e8c8c-9230-45fb-b1d4-8855de265633@intel.com>
Date: Fri, 28 Mar 2025 13:23:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/29] drm/xe/vm: Add an identifier in xe_vma_ops for svm
 prefetch
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-8-himal.prasad.ghimiray@intel.com>
 <Z+XWALoZ8tfnFAN9@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z+XWALoZ8tfnFAN9@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM3PPF99D0888FA:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7ae7fe-9f83-44e5-b800-08dd6dcda65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGFXUUl3ck16M09oVG1jQlNHcVcxcWdaL3FOSS81ajdUVUtPSXlwN3JORm9i?=
 =?utf-8?B?YkdCdXczeFlaMjJlaCtkNzJoOWQwcmNvQjM3bG9rb2NoUHNTRkxWQTVUSEdG?=
 =?utf-8?B?V0ZyckJiNGI5b3d0Ym9vV1JsN1FkY21pOVZUK3MvTGtjU0paNExyV05GdGdD?=
 =?utf-8?B?eVAvVkllcUNWWDVoR29WRVIrdzY1NlBadk9PNzlqREVKOC93NndXOFVmdFBi?=
 =?utf-8?B?MS8rNVJ1M1pSR1EyRWVvU0xxTEdJMFFvVTJJM2lJL3oxSVI5UkZMZ0VLWE1v?=
 =?utf-8?B?OGdVand5Ty9sSmgxVmgzYnNOSUpxM0hkckd2akM5Y3pVdFY3NzBMdWZpZGNO?=
 =?utf-8?B?SlgvV2I1dVVJYXIvRkZGbnF6MDk2Zk5VVEt1MmNZVHI4ZmoycVZmS3pJSTZQ?=
 =?utf-8?B?dStmR0RWOFdIVWl2SjhFYmIvVjhrVlpPM0NWMUtOZ1o3MWlQNU15V2xybFBs?=
 =?utf-8?B?c2k2SzRma0dFZHJWdTYwYklkZEdXaTJ3dFdLZlV4ZERuM2RVQlhCV3RkMXJM?=
 =?utf-8?B?aHlBc2k1YUs4VzVEYjg1L1pJY2NRUlNqRVp6OWpycUlKczJpRmFQUjZKS2pO?=
 =?utf-8?B?clhpM1lJZlRLQWJIaWNPd0l2ZThWV016ek10a2VZQjNCNlV0bUczMGVpcVFJ?=
 =?utf-8?B?ZlVQZjRldzBWTHVaN3BTTlB0LzV0K216RlVCaTEvQ2Y2TGExQ0twYkhDUDNC?=
 =?utf-8?B?UlY0a01DbXBQNk1sWkM1K09EYXlPUEExWVdlKzZSV3hYaWxROVI0YXd3MU1p?=
 =?utf-8?B?QTgvdUhOT3UvY3VBR1Z4N2JVMkFHWmZZa2ROT0NwQS9qT2pNU2ZORTlwZHZS?=
 =?utf-8?B?MFRGZi9UZGU3dkpaOUpZU01SZWU4RXpoY2FOQ1ZnMERnY3hGcTIyMmFqMjRW?=
 =?utf-8?B?NW90MFdueTVaMXpGbUV2YnVRM0RaTXdUaUlFeGU4ZEZzdko3SWtoVXlydVNi?=
 =?utf-8?B?eGFERFBlSTVzV1Rsck5qc1RSMXVYWUJPbVQ3TWpVSHp3cU44VGpNRW5rSFZs?=
 =?utf-8?B?S1RuSzh2aENOemV2RkU4NjR1ZDFjSG4xYXVrWnZKaU1tcHdLcG1rMHRCRGE3?=
 =?utf-8?B?dlFEekcvenpVMUNwL2ZHdmVlSWR5cTMzdWpOL2V1SVZNVlZ3V3pLNHB0WWZD?=
 =?utf-8?B?ckF3K0xkb3BvbWk2U0I0QjhZS1RtMGZkNjBycmZLeGhSUUJGZE9YRjNwNVZX?=
 =?utf-8?B?WlFpQWtsNER1STNRaDdldUNpY1FIdk5iaXR1UmJ0T25RY3k2NHo5TG03NFlz?=
 =?utf-8?B?bUNpWXdzenBGazQ0U1BTUHd0RVhnZjN1YTI0dFh4SHB6eDRGYkx4UUtIT29U?=
 =?utf-8?B?YnprMWdKbkhYV2tsMFRPTDF1RHZkK04yRGJNbkkwck5USVJuK3FxL0RZaGFV?=
 =?utf-8?B?Rk8vM0tobVI4ZndQVndCUk42S0JyRWF1OGJYZ0tUVVFHNTk1QVU0YzBheXM1?=
 =?utf-8?B?WFd2VDFQWTV4c2EyTUhGRnZpNUc5RE1ERGlYWG80UjBNR0xpMjV6azM2OE9H?=
 =?utf-8?B?ZlFmSThhc0R3QTJUVU5reEJIZ2d3YTZTd3p5ekZWTHgzcWxrL1o0eHEvSjd6?=
 =?utf-8?B?M1h5WVdiUUQ5QjllTnhmbzRzVmNWQmd2Q2xGMll6SXQzNXFDdmRlb0pWNjh0?=
 =?utf-8?B?eHlKL1g3UCthVnN6ZTQrc3BuQWVQb3lyMVdsdU0vNGNpdVp5V0p3VHA0WTVh?=
 =?utf-8?B?aHZReXA3bEgvNW03d0JFbWFua0dWaTYxNkIwTUNpSEdXSWp5MkZsMnJZRTBX?=
 =?utf-8?B?VjlibkdYeGowNWY2OEtHa3NEUXQwWE5Rbi9Oam4zanBGSmtMZFFZanV3T0tx?=
 =?utf-8?B?NURYbkVGR3RRalJMb2svSTVKVjAxR2RIWnJCbTJ1OTNZbS9FNGlEVmFyeE5L?=
 =?utf-8?Q?WVnYnICW8P6A6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SElURG9Jc0xIODJZMFkxWXJ2TFlydEc2UkNuMksyZ1BQcFpYa0lRdS9uR3p4?=
 =?utf-8?B?VmZWWi93K1pDYmFNWHgxeE4wRncrakx1cFJCSXpyZnQwTk12SVpTN1NpL1Fq?=
 =?utf-8?B?L09ZMjhvdnpaNGFGcmhzTUFpdWIvU0hHTWtpUmRxK3R4YlZWbHVlWmJpRDZa?=
 =?utf-8?B?SzhveFNDNmRQemxoaVVSSGE4OEFzWUhkREExOFNLZXF5aXNtNzZRUWc3bTVa?=
 =?utf-8?B?WERiNGpMY0QyQjdBcGtEL0VzSjFsZ0JVMXl6Qk5zSkVwWmJhTEZoQ0hDbE9p?=
 =?utf-8?B?TmwzSTgveXpSRUtkTElZWlI2NElNZW9hbml4aUlhclZlWUZOdmNyc1ZybGtK?=
 =?utf-8?B?amRkN3kyYkhzSS9ySmxaQWhKTDF5S0hGQm9RMm8yZGhIODR4ZmRPWEJKRmlF?=
 =?utf-8?B?YnNTeTVSaktzSjJmQmZFVGJ2R3RNSkFxRVNCcG9GOHF1SUJuNTA4WjZDOTIx?=
 =?utf-8?B?Y096WG9saU1zQmF2UmpVNCtkWFc1a1ZtWnhNOWFzZnhqNDAyVDJVZmY5QlFz?=
 =?utf-8?B?WnQwRC9Dc2FDMmVEUWQ4Y0gwSXViL1FoUUozdDN3MnpiVVA1QnNIUnU0N1hV?=
 =?utf-8?B?Z1UxWndLV2JRQ2txOGo3TFBOcFhwOWE4OWJUTlM2bk0zdVI0Q2lFRnJmNnpH?=
 =?utf-8?B?WE9Kd08vWmZCazlydHk2SEtXTDdoeHRlMU94YzEyaWNUdU9zQ1E0Szk3NXVJ?=
 =?utf-8?B?a1k0YW1QMW54SElIQlNoYTZBQVFXdUFVV1ZoSlk3SU1TNi9nUWJCMkFGTEVX?=
 =?utf-8?B?cU9aVFBOa0ptRENJU3VVZ2kxRVJhTTVtbFZpd2xCNGdBcm5oWENMSTM5Kzkv?=
 =?utf-8?B?TW1jNHdUcHRmdnMzRDRObzRRSUh3ZkQrdG1IRmM0Tkl6S0ZYWHpYeGgzekFq?=
 =?utf-8?B?QWpvVW5jeVViUWlKeTNxUk5vREVkclZGS2VnalpqRHFPZXBndFNrRmxnRVpa?=
 =?utf-8?B?ODI1cHR2R2ErYnkybmhnQ1cxbkJncnB5SnpFTnVocnRKRkNaWmNVbW56MEcw?=
 =?utf-8?B?RzdXZmhIaWlSdGtDRCtQUGxNUlpFSDgyNWxhQ1RiYWZjc3ZQa1VyT2RlVjV1?=
 =?utf-8?B?TEZ4K2VDMVpNRFJERXB0NktRbmk3aXgzUi9OSE9GSTNRRmxMbnppR3ZEbmlj?=
 =?utf-8?B?ZEx4VkpjSndzdTJFUVZQSy9kbHVFeitTQ3BwWU9sOUczVEJCcmY2YnREVWVw?=
 =?utf-8?B?YlpoVDVTd1JoYk5OandzcGppenVUUmNVcFA3T2I5SU93SUUwU2tWT2gxSDVR?=
 =?utf-8?B?eGJNTTU2UFFaNUNoOWI1dWxwT1NiT0FqbndwLy9ubXZNM25GeDdmMGJLeTIy?=
 =?utf-8?B?b3VzRVY1VDI1a1lkYVpXS0FxZGNKMFRGNHhvOTVxbmNReDBQYk1vMVVKSG9Y?=
 =?utf-8?B?TFA4RGlsS3hlb3NCSjE3QVlpU0Fqd2tMTUk1UVBaVlM2RzlVcTEvRXM3SWtZ?=
 =?utf-8?B?ay9QMm5KZmo3SjFDNUpOdUV2WWtObjYyK01UdlZYWU9Tb2xEVlNQWmI3bjRw?=
 =?utf-8?B?L0drNVAwdVBQYnpqYThyV0NEanp0YllxcFl3Y1hnV2xtbE5JcWZvT0ZCR1Ji?=
 =?utf-8?B?bjZVTTkxemlOK3p4QUI1R1RoSnBYZUZQdk9wcEJrM25JWHMzVGZycVdNVnRM?=
 =?utf-8?B?N2ZpVnR6aW1mM1Ewd2ViRGwvcUdTemtKekUzZXBCSmJSaW5KL1pRVkJXdU12?=
 =?utf-8?B?dEhsbXd3MkxpR3ZCWVZZQndqWkU4NkEwMXpMOFlNakk0TVlteGMzcnpkZ1pC?=
 =?utf-8?B?S0NGMFBPaDVDbndEQjk3b0NHTW9KM1U3a09qaThRSStsWnZYTGlweVNLa3l5?=
 =?utf-8?B?YzBKRmxZYko2OVh4cWdsTURCNXlaZElxckhRZmRqS2RrRStWdDNBamVJWUZW?=
 =?utf-8?B?SHpoMUREb1NIdytYTHljRUN1aldDSHFwd0JZY1JVRCtabnB4Tmg2N3hpbExZ?=
 =?utf-8?B?ZjUxNU9SR2RXWE10T0R6TjdsMVpZMHFERTloZHZIalRSb0hUVXBOdWlzYi9P?=
 =?utf-8?B?Zncvdy9jTW8rVXh5cWNaYXFWcW5EV3RPYm02K1RvTEI0UmRKVkhISDl2UUsw?=
 =?utf-8?B?SDVuRWo4ZjlKZXVDaElXSTNlV2hoNk1yYm4rNlU0cDVDenorNGo3VGNoc2RP?=
 =?utf-8?B?SjI1d1U3WGI1NVBOdzVDNWlkczE5NWREcmdQM212TlJUeGRKQ1NBMUs1MEpm?=
 =?utf-8?Q?11WzV+Jc9H8S7Z3pX+gDzpk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7ae7fe-9f83-44e5-b800-08dd6dcda65c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 07:53:38.6163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C672xsVcVRIyI8U/oMTz3rmK5qd3IuzRZM5/2chIF0+7btfjlbbfYzWhxWcf14Hkaer6Enm/Gb6SvarKmP6UOCF4h2TCIAfim6c6fZhaNPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF99D0888FA
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



On 28-03-2025 04:19, Matthew Brost wrote:
> On Fri, Mar 14, 2025 at 01:32:04PM +0530, Himal Prasad Ghimiray wrote:
>> Add a flag in xe_vma_ops to determine whether it has svm prefetch ops or
>> not.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 1 +
>>   drivers/gpu/drm/xe/xe_vm_types.h | 3 +++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 53a80c0af8de..b83154d338c7 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3215,6 +3215,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
>>   	vops->q = q;
>>   	vops->syncs = syncs;
>>   	vops->num_syncs = num_syncs;
>> +	vops->flags = false;
> 
> s/false/0 - I this static checkers will complain about this.
> 
> Matt

Thanks. Will address this

> 
>>   }
>>   
>>   static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 93224a87ab03..0b02a37bd2f3 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -443,6 +443,9 @@ struct xe_vma_ops {
>>   	u32 num_syncs;
>>   	/** @pt_update_ops: page table update operations */
>>   	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>> +	/** @flag: signify the properties within xe_vma_ops*/
>> +#define XE_VMA_OPS_HAS_SVM_PREFETCH BIT(0)
>> +	u32 flags;
>>   #ifdef TEST_VM_OPS_ERROR
>>   	/** @inject_error: inject error to test error handling */
>>   	bool inject_error;
>> -- 
>> 2.34.1
>>

