Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B5606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eONC5fQY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D5810E7D0;
	Thu, 29 Oct 2026 08:32:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E581010E287
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793262769; x=1824798769;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6X0iOUqm/QA3rhCG8f1LwB3lQZ+1JsxTjESXYddltx0=;
 b=eONC5fQYF+4RnTY6ELWA+uAU9FLvBk5JI8dL+jfpE0V/APq4cVl+c6Td
 I/fESFkyKChPcU6MTLNYsRdT13ZbOtjEc+TfjqefuMC6ARJwo9rYioUaK
 z6OCELJ/lKO+/lNgfMASdsgwPSzEj0hus2EpbNZA4p7FP9pFgDtFlvKZr
 W9M+qd0KZq4XsgpW2RsXrhyhNT8hD0KCKP+jxxUazfw1dbH/Rw7hfJ5EJ
 y9MtneIzPBBzLIWi6PaaX+OlFgTWtdWPGchto5sDvDwDYVLf6TwMAwBoE
 +sNLTRqT0Ot99NYbzAj/b0fbjNxgLL2ebfsE+WzpeYzurg2S5HoU5JxGq g==;
X-CSE-ConnectionGUID: RgbR3K2KTjeo6frpd/6NQw==
X-CSE-MsgGUID: zvllqg0YSXOzQvsEt9lh/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1882052"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1882052"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:32:48 -0700
X-CSE-ConnectionGUID: bF75SS6bRDeTNHBMDJvfeA==
X-CSE-MsgGUID: eAWTp2EhRRmZumYfur0DsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5171604"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:32:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:32:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:32:47 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Saol/rSFxSOuztw8dAMYbaxx/HMBBcP94haWml9EzpW3LwbYJFsC0QcrFBB0AYrwg0/GIy6sy2MXFnOOarTIv1lwbGdLZM0rnUtDrabgn/oFt8AUEMxcIb7XUZnZ+dof9+bz5GAYVn/vwnz9f7kuWPs0yrjSQh7btmKMM9kWPAPbjHzFMuMY3p6hjUR3e/ihYeIx/wMnsAxI7Tc2dJoQnynsKMqana+6qisdKo1HZH/yn4w4NeJ8ZR85l3IAKxXC0lMFvJysmSyTBU72lvwBpEMhd1mSog110MxlihDr51QkFYENqBYD4Ql71f4eJhgl0RIS2oFX7M4UHK/UXk9OHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0SUBaJcSu5T9UZ+EviE7xNfXO3zVCZ4u6coKvenY3A=;
 b=PHqxm3eZo6a6zyaAeJqb9WHZsnsQ7vKtUOAh8jhvPwx5p1uWnDsJZ5iND9tx67846GPaV1HHcr4kzsjSqiVYGsEAW6OZQxjRryeDJHe5+0nQJU4c6P5vey04KxyvbgPorroSbMjomjp06dCUxuiMx7qBseM7XmzJ9PpR3J5jXmJVCKAL8Kse5mi9X1phXoD7X4ao4dHTULjTtwZVTWSMneWO+m7L+4Tl/LsemL/mzdklkL562J4BHjqwszgyJyqMOZlDC3kH+HOpyhmYgQ8S2H/+pbmaUP6UfPmeHCeUVl6Td2cu0H+6SN9Zv7vb1C5YDiL4BUQN7j3bRMum0b9/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:32:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:32:39 +0000
Message-ID: <4b52dc12-8ff8-4904-93a7-41f582ab8fd2@intel.com>
Date: Thu, 29 Oct 2026 14:02:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/xe: Add wa_14028434957 to Graphics Version
 35.11
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>, Varun Gupta
 <varun.gupta@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-14-riana.tauro@intel.com> <87h5i5nc05.fsf@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <87h5i5nc05.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: e69ab361-38f5-4641-7c8c-08df35973139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261028144727099003|260925021311599003|260925021911599003|260925022911599003|4143699003|56012099006|11063799006|261009223027099003|261026140227099003|261022105027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MHHXP2S2bHxbqdn54JjyiznG+5Vw0kTPVYh6l0tt8xuEw0YhYl9av3sbOX/NymMzyAa7Kv5DDIqH8lYESo65cxwqSRnPAMe2IzqCdQmESNJyJDw2u8+uizT7UqcXLjQ2DArHuS9/ft8qLshKGIVWlDgsWf73VJAs4HPHmBm9stN81+FK4g26s65OF+6IXV/6rhlMZeyS8Yc13tSUkgIpG1lT0bE5OV/N1dTFpdG4rMeIq2tPljK9HX+RTDnf8v+JUGkdemcPBS10rJpJzaImG24dOhWfK/UPsB0ah/Z0mBFKQFugkaRRLE3ziekfbP+H3j4ARgfVhUmnqBU2I7TKjxMccDHfTCIUu3m02ipe6zYxkwUU//KPZW3T68v3xqtwI6UfB555NPgCs8eWY1jd+th2tx3cZes1wS53YJoAVrqcpK+S5I8w5TNVHBvkEbSanD28azLZNDCxynYbv6X5jq69oJpAX+5fu1gtqo5oOX2Yt5gnnRSZaE47MacXI97aTirN+FaPuu2aOlCeLxTslEWVEm0YoojA+IczNtW42LRuncbMqA0TnE3DyyFGNDMxZfD1u5Xk4ZfNn6f0/5ZPzLF/OrYf5AjmnrRURQOY31MdxPzWWTVyQDrga41BauohYSkuUmuadHPOL2+6oneCoY8E6RphybFEQt4Anct2h2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261028144727099003)(260925021311599003)(260925021911599003)(260925022911599003)(4143699003)(56012099006)(11063799006)(261009223027099003)(261026140227099003)(261022105027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkNpNkVVUnNkenA4WjJmUWxMaEpHOUdLQ0hYeU1zMlJRVGVxNUliNkZ4dW9u?=
 =?utf-8?B?R0dscDBWQldCSlRGZnJaTHc5N0dyUFlONkFsSnc1ejg5WG1CaExHYmZDTjhZ?=
 =?utf-8?B?U0dzRUFmb2k3Rkd0cHlWSTFWN1k0US95Z09YNUVBMmRkU3dyaXBiY1VvUytj?=
 =?utf-8?B?MXhla3N2aEx2WXdiZGRDS1J0cUx6RjMzTC9RS0lCMWhQUC9uZXhRa280VFVP?=
 =?utf-8?B?b2F5OThiN3I5VGE1aVhLTVBXSndhaFQzZnNtcHQwUG05ZHBKeXR1Z21uNEZE?=
 =?utf-8?B?SXJsd2o5akh4bitXQUVHNnA1MTZoN2lWWlpjdk8vRHR6Y2dibmI2RmNuVlRr?=
 =?utf-8?B?aUFxWnFYU0grY1lkMkNWcjdwK1NDOUsxMnhXdC9DWmJ1dHdjUUxSMWRXb1dq?=
 =?utf-8?B?cGt2T0l6bG9HbmZRU0FLaXJJZXhiTGgyUkxFWGF2aDFPempIU0FvM0N0K1pp?=
 =?utf-8?B?Nlh4M3FtelR2TS9sbjZ1NTRyTk9odHROVkxmYTRacG1zdVBIMDh6eTlrZTZm?=
 =?utf-8?B?ZnYzeHdQdVA1ZHlaY2IvaVpuNWFnamxiSU1mZ3ZMdm9vajEyMVBBck1CVmtR?=
 =?utf-8?B?cEhNallUTjR1SjdPRFEvWi9zR01wSnYxMUdsR3RUeWFnU2Y0KzhoNjlicUtv?=
 =?utf-8?B?VXVQbmJLcWlMVm9pRTVwV2hqQnBhdk5VbU9SMm5IT1g3MjJ0VmFZMTBjUVlI?=
 =?utf-8?B?eWk2bHdyU2hranpNMW8vM3kwaCtPRngvc0EyajVzbGtCZ2lEV1RENjVKcG0v?=
 =?utf-8?B?bllnWEJDTnJqRXZNS3piZndNYm9PVUtZMkFxajZEcWlIY1pSRGZUWmJ2djV2?=
 =?utf-8?B?M3RGQUozVTF4ZllGWTRaWmp5VVplZjBTbXNXUmRQN0I3cjkydWdZSExjT3la?=
 =?utf-8?B?ZDZwaVMxaVFkSGRqb20yRGhvUVFXK1l3NU13MVVkRnRoSEhVeFVyVFpFcU5T?=
 =?utf-8?B?cUp2QzFjbnZnZmtRU2p5cnNNOXdwNGFOcjZlbDYvV2hmWnhsWTZheEV5UzBP?=
 =?utf-8?B?S25iMlBrR3VNVlZ4SzFmYTFPUksxOUh2S3M0Yi8yUktYYlJPZnZ5L1F4d0R2?=
 =?utf-8?B?cnd4b2taYjZDY29kTFRac0NiOG5hdkJyd29HQ1RQeldZMmsxSEtjVnhoaXhE?=
 =?utf-8?B?Z3RtZXpURUxoNkgvanBqQjBkUWFBV0tkN0xIZVFSRUQxN0RURUlWOUxOdXVG?=
 =?utf-8?B?cEVkWUN0bTdwdlVFNjAvSW9kVVJYeTNYM2g1ZjNmNUNhUTJiQ25reGN1eW9B?=
 =?utf-8?B?YTluMFZtU0RjeUYrYjdmK0xaUGxRTXZSa2ZIUExIVThIZG8wYVFHWGFOTzFq?=
 =?utf-8?B?WGFZQkVMZ2J1aEVMa3Y5Y1BYZkFXbTRyNWtnV2VpY3U0bVVqSUhvSk9LYmV5?=
 =?utf-8?B?N0J1aDJYMnFqWWs5Y3VEOWJ1a3p2NXpMUE5BVGdoWUpQdHBDN2NXdC9pM3N6?=
 =?utf-8?B?Y3Q5cWJDelJ0Sklxbm9GTnBwaC9QZFJNakdjMDgvR1pwY1ZRN0FRKzhoZ2pl?=
 =?utf-8?B?WEw0cktiWnVhVnBlT2t4cmx4clRiR2h2NDNKcjgvNEp2MkhoNFJXQVA1bE5Z?=
 =?utf-8?B?bytGN2hMNmtGOTVhMmxXWDBqZnlrbEJnakQxNnlwNW9QRmE2T2NUQVltaEo2?=
 =?utf-8?B?TnRoK0FqSlVoUTA3Wll1MEg5M3F5Ykl1Umx0akVXMGFydXZuZFpac0ZCU3Fw?=
 =?utf-8?B?Wkh3bVJSM05mN0dscno5NWtPOTUvSzJjTURiUnBOdUFiVS9JblREbEdSSExL?=
 =?utf-8?B?azhyUmFwWUsyV3RTbXU1dGZBTVBNcit3TTYvWXFFbGtOMjBZYnhhb1B5MXov?=
 =?utf-8?B?aWhyNUVqTUZndnkxYS9xWGF3ck9JYjNMdHhjVmdYa3Q3WHJuRU5ySmxrWGJp?=
 =?utf-8?B?dnJvV2NUWjdMc2FiemEveXoxeCtGd1VqV1pWYUVDaThHeWVhL3hZbzczUEZZ?=
 =?utf-8?B?SVhOOUxYOFdnOThkOXQ3SEJ6cjhadzg3c1l5bFVPcERlV2RLa2xaOENibUJR?=
 =?utf-8?B?dVIzbnFQVUpsakwvcXd2R0dUS1JXWENzMFY1T3pNbkRQZ1VIRCtkSUowV3BK?=
 =?utf-8?B?dktzY1BXVThBVFNYbXJqWFF0YnMvTDdlaTNMNkJLSzZtMkEvZmlzeldJTkc2?=
 =?utf-8?B?VTl6WXhMajViQWNnQjlwNlJOalVieVZRbVNrWUZoQkl4c0lYemJsbjVNaGpY?=
 =?utf-8?B?b2x1bksrRUZjS3NrbjlIMVo0cTFBZ0NvU3NaR1RoaWhnOUsrcVd2ajhqVXBx?=
 =?utf-8?B?Tk9hTGlGTzZ4bVBlV1ZVNkxsVWdiVXplbzVrRW9OSnBxMG9ydmtzSi9YSW5X?=
 =?utf-8?B?ZEIwUm1VS2RnbnpONGtZdlp6Y1F4VHJzUVlEaE5DM0RlWGY3eWl0QT09?=
X-Exchange-RoutingPolicyChecked: b423lVMGhfsnBcO7+pVuCdAYVMpIlM2b9ybuQTRWxe+Hd3x0jgL8m5HLtSvbnyirm/wBNQOdiPSNJPksEGQT18BwFfgaOEG+JGLwAy+O7xb9LaeN6/LDUf+KAFc0+OyoBfkUtKAgcH3NZGWNzKg4wlu9Tu5jE2d5MLS/TFiGY40t2+eeGjvIaeppZg5+OKA35qg9/b0Ap359FDzX2Wc/xKwDuKtXop4SZaKww/3IzzmjgAlUnVCpURaUhgW6cnSLJhQngqDgsM9GP5ab9RzObYanoe3ju00V1URX5Z5zrMoNUg1TlWjibmbtr6uoOyKQoI5rTEhDnkX5t0Bvg3cSaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e69ab361-38f5-4641-7c8c-08df35973139
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:32:39.5598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 314Icoc5XDABUBEd66Nk/XqajAyeVbWih3HeCRaYuhvJbq1pV1Rj2aUmIw3EMsVhyG8Q34Ugbc5wJFoj2PWSsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
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


On 28-10-2026 19:49, Gustavo Sousa wrote:
> Riana Tauro <riana.tauro@intel.com> writes:
>
>> From: Varun Gupta <varun.gupta@intel.com>
>>
>> Add wa_14028434957 for Graphics Version 35.11 to the table.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> index d8dc41851425..36b2567994db 100644
>> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> @@ -7,3 +7,4 @@
>>   14026633728	PLATFORM(CRESCENTISLAND)
>>   14026746987	PLATFORM(CRESCENTISLAND)
>>   14026779378	PLATFORM(CRESCENTISLAND)
>> +14028434957	PLATFORM(CRESCENTISLAND)
> This conflicts with the patch description.  If the workaround applies to
> graphics version 35.11, then the rule here should use GRAPHICS_VERSION()
> instead of PLATFORM().  Now, if this is a platform-specific workaround,
> then the commit message should be rewritten to reflect that.

I picked this patch from another series and retained the subject.
Will fix the subject and commit message.

Thanks
Riana

>
> --
> Gustavo Sousa
