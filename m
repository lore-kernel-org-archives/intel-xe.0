Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02421606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lardYjeM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9ED11224A;
	Thu, 29 Oct 2026 11:41:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D2511224A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793274057; x=1824810057;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uUg0zQjpvZzsYiGD90Fty25TJGKaZg2+tmcQGfIRccg=;
 b=lardYjeM4JOlE840cJMvpkpcJH+34YgfZ2voLPjI2Hy/DD8MLKsqT4KZ
 vouWVFdutjT2TIXzwtSSRlCCc+kBlu2MjgmvQHYSjjGrvURhzOpWHgSqk
 ZEigJ9xY2dpSZAY3oeRQDuX5W29H+icrQEfw//lAKDurKyxbpx2YMVE7x
 AUV1+nfb/NOSP8zGg1QYHO6VRt+lKxNSzjkY/iP6Bpy3bx+/DJZhwtVzU
 iURcIn33at0bBhQXsEa+yGJEn0pCV7BQHk6k8J37NsiwX2+NjWXVj4YJ1
 kWvq2QgW13F3AeHOdp+BkxlE0boqwW5mzLbR8hhCehgZibbeSjaxwo9Ye w==;
X-CSE-ConnectionGUID: FO1WOfu7Tna+LreKOXv0mg==
X-CSE-MsgGUID: 0qIrURwsSqyH1BNfMtGXuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1907225"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1907225"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:40:56 -0700
X-CSE-ConnectionGUID: BRtA3/n1R/qHlR0/n0syRw==
X-CSE-MsgGUID: 2kezb4oQTF26n6+zlWpH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5008407"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:40:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:40:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 04:40:56 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIFD64Itdt88fVCGdvttRNeTeZgeu1LJBp7RaXIEQOuLBv5SL0PTL/IOafyDVCIzmLIWOnmVD7hoJFpI2A1w8vsT1s+/yAu6pQerBQKtRrOTJ7hyGcmP6SKZxgM6vJomJNsQxUEH/SezY1GSKsWBanuyWVcOIafxeGJQe+fmQ6P6JvqecH6Q+0zUmY4jHeQZCdY/dRMlShOVjjtc2hNoxARYCuHFZ9buIQD9fUT3NYAy5MfwxcRSFJcJwFUYhcqX4kCjkutolVuHTkz8NAdwwinEr6xcGcp39RHWvj0KyCknnDSB5EtrUOrAFJBq5dQIBiU8Y8MLaSVnnPflX89ifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhGquC658ONqQzUCi1VWbKhlsreHvf2CTiKnGefaPoU=;
 b=j/HOdD7sMWTqxrf3mHFfKfVflyRFq2Ae3XhsbJ2gX36171SjDjSCzxSZ3ZwKKAfmlycIxNJQw6U9LgsRy2MDSZvzfMJ3yrCZAENjT+1RuI/A+NW6dkbilTYDfSrMFhjxQmHXSk2XCWp9zLf/JmwoxJM98PIfVNEAqcXbGiQMMLbpinlXGEfSjSRHAXdaiu6J1hMMbkOFyGOtKW1yOmBKkJtIi1LpnfRxMfh+BqEsw4PdjksBmLB3DidNHSort1QuTpe3xU7g4bST69k/IbPmDt6h6rxkcm20TQEBDARBzfWdChZdDm5B8N5N4esf2EIPdTXQAsofEcdyizCi0oqBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by IA3PR11MB126088.namprd11.prod.outlook.com (2603:10b6:208:54b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 11:40:48 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Thu, 29 Oct 2026
 11:40:48 +0000
Message-ID: <667cdb3b-879c-424a-b7b1-31383f0f660b@intel.com>
Date: Thu, 29 Oct 2026 17:10:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] drm/xe/pcode: add ordered write batch helper
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-4-karthik.poosa@intel.com>
 <40f75b8b-a04e-43ca-a79e-c9c08730fb2d@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <40f75b8b-a04e-43ca-a79e-c9c08730fb2d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::7) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|IA3PR11MB126088:EE_
X-MS-Office365-Filtering-Correlation-Id: 10607f7c-5c46-4e25-61db-08df35b179c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261028144727099003|4143699003|56012099006|11063799006|261022105027099003|261009223027099003|261026140227099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4X9vKoPIOeNVi9ldYVd24sRZzbhxabf5Dz7Yki+HQSY2FXAlvJ4Z5HO/RHD0Z7EwpIAkAG6kxgdfwKBB/mZpg+D62BYGfhgIK77SCtGBOUHokPSuSdPseasV0Eidx4yBunoIzgLeJR0d/cPBAEVtmNRKemVi/ig3dAtLbviKyZk30/zXJncmnW1q7jS9udQc9hAFYJ9dAArdRYft95L4uNUxq04KLRJzs2i1E6KZo+oh/1Vd3pxE8Iwg25tTLpPG5Li2b0HC5WRAl0Sw2sOcgDwRUulrwYWoqPGt1ij0hqrGb4Su9xGrLSpPRfwYHIhLH+TGDXhiwtl4dbtZJwQW8zR3sxmKS8XyP/3gKNQs2IUbXJFQK7e2exJI+A6w6jcxY6nmJnGsbbOdIz8sp2thmiHLTbpRAsWt3qwQ2kwCd+tisQt0zautTmP2HX4q3dsoNvZbWz67zonLRKI+YuINHnj++RB/mfdbMbwVcrn82XauAnBUJxvfqPYjMaSPf1c1iwU9w6HY6RigicUpPuAUUsTX4+4UaB6bqWs64HKGN/CTMlDNc81TnacXZEFP+kbo2Qh2Y4K88hKbJ8XVhbpCqFbc77Ot1zupuedj33MNic9PfL4vvzVMc4uUMdDPWIHRCFTRYc77Dpv+8NrQdtuuOAiLrcHNcr2TgmzlWKz13Hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261028144727099003)(4143699003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261026140227099003)(261021121427099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUpmQmxCdXpma3lsQSs2RnVqQ0ZBekU0NWRnYkRuN0FlbEIwQ0lHWG1rTkQy?=
 =?utf-8?B?bUVySW80R2U3Nko0VkdOczF6OG1nbkQyZUNsNGtFdmwzSithbHFlQTlVQnRO?=
 =?utf-8?B?MnNua0NzYnVYb3JYVG5SbGkvSmx0VHRnNm5vZllqVjNZWGI0UTkxWDZtYTk0?=
 =?utf-8?B?emtyTzZiNVU2RHgrZWVvZnVGdDk3YmtjODRSL211S3dGdWhWaXI4Q25YVUFp?=
 =?utf-8?B?QWxwUTJnT3pLWkZBdGl0Qm9LYmV5U3h1cGZveG41c3A4T2J6dU5YR2ppZFRp?=
 =?utf-8?B?cEtKbjh4bkR3ejJOMWZWYzJTb3JzRmF0UkZIWi9mS0c3RlBWaHdVdXhIbXVp?=
 =?utf-8?B?aHRpL0prL01zaGhhZ0RDZU0rdE9NaUxIRjRWZTY0aGgyckZQSDZJaUlXZG83?=
 =?utf-8?B?WDg1WkZNdXhkcnVma2dYbjlrMDc2dkQ3UHJDUVExVmRka3JzTTVNQ1BHQlg3?=
 =?utf-8?B?ekVVYkpSS2hsRGxNQ0p1NStQNkp0bXBiOTBNRXkzaGlkNVQ4Z3VYV3pHbFBl?=
 =?utf-8?B?dVloUlJKbGtiYUpUd3BtU1d1NEE3cC9yeXFhWExZTnpWR3h6ZS9mU2F2akM4?=
 =?utf-8?B?cExpbmRCWWZKbEpkOWpFWXlhaUpGVUZrVjRNNTJaNTRhOU9vZ3J2MFdJKyt4?=
 =?utf-8?B?QmEzbkIvOW8vUHdPL1M5K0RFMmF3Zmt6WlZiTFJWV3JjN1dGVW5VcHhnYTFq?=
 =?utf-8?B?WHBQcWxqRG1wYXNyazZOKzRwNkI4WkJ3OUxYenhzNXVWRy9EUE5kUlRQREd4?=
 =?utf-8?B?WHhQZnpKcFREaHkzNEV0SWhTYllBQ21oZFpCb2xUWS80Q1FralVVUDRteW04?=
 =?utf-8?B?UHM1YWh5aFlRUjlSODlWb3NLcmI1UEpYQUVITGliS2ZKVkhZZlJ1dVNzT0s2?=
 =?utf-8?B?NkkyU0ozaDR0MUxnaUtwamZLLzJwOTg1N0JtRVMwc2kxMXdaSUpOM04vcmlP?=
 =?utf-8?B?VThKazYva3MzQVFZekF3UXdmTnQveW1EQW9aMTU2TUpGR1NZQnJlazlvTy81?=
 =?utf-8?B?UFk5bUlHV1JKYXlFRm1RaE5Tc1BDbG9WN2dHa2c5ZHhidmdDaWNUaGFQTUg3?=
 =?utf-8?B?VEFhQVlQQ0R0RmQwQmhPSmRGU2FTKzlxaGY1ellsdFdUZksvWE01QzVNNWNO?=
 =?utf-8?B?TUxDWjBSRlVIYVJvMjE2akpZY2o5aXp5T3NWTUt4SkNXSGs5KzZlOEJrUjg2?=
 =?utf-8?B?Z3dwcHlsY1dhWGJWcUhyOWJEUVo0dWpOUisrQUdERHZ3OXVwb3kvT1NMQW40?=
 =?utf-8?B?Z203NzByWVVHY1BNODl5VlV3akpQUGVNNTgyN3lsRHFkMkFkczdpbVFqcnNI?=
 =?utf-8?B?TENDYm5hTWplbGtscWtMTmZlcG14NWxHRkE4RmdmdTZ5cjczb0FLdmU1OS9m?=
 =?utf-8?B?dlhDNlRJVHNEK0s5UmMvTWJyL3ZzdEVGbmRJUDJtQ2gxYmdOZlhEcVphb1FE?=
 =?utf-8?B?dlRYVEZiS2lKdlducm0xY1BxM1RLNm5KTGlETHFYbW12VjBhVFczL0V5NkVL?=
 =?utf-8?B?R0dmVEYrb1FIeVhtVUJXaEVnSEh1UnR2RnlOT0RnRWN2eFRUVWd6WnBwSjg5?=
 =?utf-8?B?QmdNdTdJKzY0N1VTc0JFVG5tWFhQcHlTMlNQaks0NjhMa3VHaUVqOEpQUVg2?=
 =?utf-8?B?NVlJYzRhV0lHYVZkNUkwQzZrWmd4Z3lCRGdWcjkva2J4MDVIQ2JIQmdsTldu?=
 =?utf-8?B?ajZFUVpSeEpkZFBudlozQ3VYbVRiVU5DWG93WkJyTk5XMlhaMG1pVHZhUkV2?=
 =?utf-8?B?dGoycGJlZ0dVUit6L1FKWEFWcjk0U0RQQWlCR21kQ1dlbWEvMEZqRWMvTWI3?=
 =?utf-8?B?Y3hoa2tvOTNURVpDaWtYOEYraHFjVmVoTXVDVU1DNER4RHBxQk92UmJWdmpp?=
 =?utf-8?B?OWp0TEYwQmVlRU9sMGZUWWVhL2ROYmd6NHdaQW9ndEljeUdvTmwwdk1IN2Vt?=
 =?utf-8?B?c2xQUkJtTkVIOVY3SlpDMGRQSlhucEw4MjdCaytFMlZNTlYzc2EyOVQ1L0tK?=
 =?utf-8?B?VU5NOE1ONC9HR0ladHRyRFA0QWR4UUxiOXpnWTUzTEJLQTBhcFRUT3NrVjlV?=
 =?utf-8?B?K2krTkx5ZFpjbWR5a21Jdk85TVZ0TlAxSjRqUEdGVFY1QU1XQ1NVcGNUWXpt?=
 =?utf-8?B?R2swRU5hdFZyUWlMVmZRUXpIWWF1ZFQzb1NQMTdPZXN5REJQK1BwUkpvWWNj?=
 =?utf-8?B?UjlPc1E5QWhyQ2NDK1dhRjg3ZGJVd3pPOWdaVXBYdzRuZFdOZ3JIVDIveENC?=
 =?utf-8?B?UDFjV2RGRG5Mdml6aEpOU3FPQ3p6QjA3VjVacytURnBGTjNQNHM0bjFJS2c5?=
 =?utf-8?B?NHY1RnBiWWMyUUhDQk5yMFJhelpjT0ZCWFlPRnYxL245Y1dOeXluUT09?=
X-Exchange-RoutingPolicyChecked: AruSPU/o8xxLaUi2x3rcfrh71TysCvluYE6igiPgk6j9bZtsDeWvSqiJuEL1KIjBcGa2Fn60B2mcZTT9FD0vgJFzpn0amEDlf5v5fPUKHetihwAc30jCEuiVZTl/Fuwy4orK4RRIC/Fl1BOlAGhJbRW/neFMDSZrHJRKJO4OHFrDRsyCvhMC+dJuIXZUlk81Ko9DivlU8B8ny2/2+NFP1fa6iTTZYu7V79XU3dOoo9eHTif5ecQo7S+oX3o7CkkVjJZ5N5Sf+iYVdcSkqjoqXntdRrQqpibd3IIvdxk9uMI39BbuzVZiAGlHYvm3FHTLpL0f05+g41mHuRwCZ2F3nQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10607f7c-5c46-4e25-61db-08df35b179c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 11:40:48.2842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQy2oUm74QQVIkiFpBSNgT+nQKuxCiG4QkNTFYYJ3SnKA0rzFDr2kx5m/CgjfBofdIz3uV4zyzjEH6bsSOdUlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB126088
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


On 29-10-2026 11:15, Purkait, Soham wrote:
> Hi Karthik,
>
> On 16-10-2026 00:37, Karthik Poosa wrote:
>> Provide a pcode write helper that keeps the mailbox lock held while 
>> issuing
>> an ordered sequence of writes.
>> This will be used while writing the fan table ensuring that is not
>> interleaved by any other pcode mailbox command.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode.c | 20 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode.h |  7 +++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c 
>> b/drivers/gpu/drm/xe/xe_pcode.c
>> index 266deecbb100..ca107b0234d9 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -124,6 +124,26 @@ int xe_pcode_write_timeout(struct xe_tile *tile, 
>> u32 mbox, u32 data, int timeout
>>       return err;
>>   }
>>   +int xe_pcode_write_batch(struct xe_tile *tile, const struct 
>> xe_pcode_write *writes,
>> +             unsigned int count)
>> +{
>> +    unsigned int i;
>> +    int err = 0;
>> +
>> +    mutex_lock(&tile->pcode.lock);
> nit: if count == 0 then return immediately without acquiring the mutex.
ok
>> +    for (i = 0; i < count; i++) {
>> +        u32 data = writes[i].data;
>> +
>> +        err = pcode_mailbox_rw(tile, writes[i].mbox, &data, NULL, 
>> PCODE_DEFAULT_TIMEOUT_MS,
>> +                       false, false);
>> +        if (err)
>
> Use a debug print in case of failure for clarity.
>
> Regards,
ok, we could print which cmd out of the batch failed.
> Soham
>> +            break;
>> +    }
>> +    mutex_unlock(&tile->pcode.lock);
>> +
>> +    return err;
>> +}
>> +
>>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 
>> data0, u32 data1, int timeout)
>>   {
>>       int err;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h 
>> b/drivers/gpu/drm/xe/xe_pcode.h
>> index 7e43792b0037..74bd553ab390 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -18,6 +18,11 @@ struct xe_pcode_version {
>>       u32 engg;
>>   };
>>   +struct xe_pcode_write {
>> +    u32 mbox;
>> +    u32 data;
>> +};
>> +
>>   #define PCODE_DEFAULT_TIMEOUT_MS    10
>>     int xe_pcode_init_early(struct xe_tile *tile);
>> @@ -28,6 +33,8 @@ int xe_pcode_init_min_freq_table(struct xe_tile 
>> *tile, u32 min_gt_freq,
>>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 
>> *val1);
>>   int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>>                  int timeout_ms);
>> +int xe_pcode_write_batch(struct xe_tile *tile, const struct 
>> xe_pcode_write *writes,
>> +             unsigned int count);
>>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 
>> data0,
>>                    u32 data1, int timeout);
>>   int xe_get_pcode_version(struct xe_device *xe, struct 
>> xe_pcode_version *version);
