Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654EFC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 21:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED7210F1DA;
	Thu, 27 Aug 2026 21:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeIAVN7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B09110F1DA
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787866078; x=1819402078;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RtSqQEokP0qVm5lkUf84dsRSEKHSaDKy+eJbLnLNE4A=;
 b=OeIAVN7KQ4Nt/wELKc5anZZeKo5SKwpd3zd+F6F1EhpRgoprUTXtDe4t
 UJZx4tdcqmrmhEfX9K8mNyOdlMPn1n7lZyo+hLvxTi9Y9qxeQovjWB15C
 69s7H3uggqMZpz3z2mnW2wN1SVkigy3GSYxBQ0Y7kAAydR5M7pIxz9xNc
 YARbujDCH8zvo5gUxLF1FTGOF4lfeVcnbJRnNv2HCPcp1L9Nwj1apRH21
 UPD37mYC7CX/YwumvpztLOKgoRRTMWCw+22Gxe36WtnUIj8A+LpVFdNoG
 vPFxO2+hRn3Lk6AQwldoK11HwE5aPRXXl8u5QgIIba6aVx0+J3A5pMHxS g==;
X-CSE-ConnectionGUID: Z1h6lc9lQFuex1Miu5C9PQ==
X-CSE-MsgGUID: iZo9qwEITHae5jbq6fp7Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92190905"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="92190905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 14:27:57 -0700
X-CSE-ConnectionGUID: qBv6TZ5YRfGAruySESbJMw==
X-CSE-MsgGUID: OJDjO2gTTIOqD66AXvR9tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="306191000"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 14:27:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 14:27:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 14:27:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 14:27:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx1+ryqBN8S6t8PkptIays4QXJ1NXrtxQ4BL6eNhMKltODknVs7vSFM78kZLnPGRyIJZ6jXGIZ5c2zZ/0bSfbkiIeXShY4ay1wOd+h2OzoBmRf1rfjHFaBsOxr8/wbnZff5Or1o8/u9M3hLfjCznJAtchaTdGvitJcU5HRG3pYEijvqY3QXfs8UmoHWggXd7KBjjj0k1mJQBM5s1l6IU5VsGDsQR8SBsbSj3X5sWwlFkmrTod40hAC/Pok8hXp/poeQsQW0WS5MpQGV9oKC1k3lLp+EFJPJo1xSglHTS8FCAvGEQ/oaZtXaKpCAu4U82meW6QtdSjWoFp3YkTlvHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDoizeJh468m4QTKkt6rv4wFI7wzPv8h2nbDSoHzVMM=;
 b=Gm+DK1f0SkUdFZ1UlY+lu/xagqrt1MjRyZUJrH8P5O8Edx7T55yRsuJpHardpkpjl0KPGBT0MgJZX+UMKNPyXR3HMfavIi7BwfjOZDhuFuyxWpcl0FV32mH7oYm/1BnUEVorqvC36DtRocM8Rc7N/R5ShO2c3pQY9wG4J+6DcwyCvmxeghZNJGjgjogbXQZlf86II1KXt40KyowN+EXF9lOZoC1wdtyGR+6ytwxWmXJsxVBrpcv1c6CZmGGfjKn4g7wECqZK3vo8CCrOoMu8zZ6uuXisGG0scj8tRzk9lo53opoo2A7wLuEA06EVM3zi+EXPZEummKq+lMP916+ojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV2PR11MB184224.namprd11.prod.outlook.com (2603:10b6:408:411::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 21:27:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 21:27:55 +0000
Message-ID: <6b5fc72c-d0ec-4c23-a5f3-e2408711ee37@intel.com>
Date: Thu, 27 Aug 2026 23:27:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] drm/xe/cper: Allow hardware error CPER reporting
 from xe_log
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-20-badal.nilawar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260825175916.1103841-20-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0113.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV2PR11MB184224:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cdc5bf-aa22-45ce-7048-08df04820ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|18002099003|10067099003|6133799003|11063799006|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 6W1t8q2tjjmzo1NrWWt6IbiGFeYbOEsKZ/NMcw+IHV8OeSu02aKA77XC+Xj1gZ+V4Skon3ZZ8xOTjeAZNWupMXlUIlSBdmY+ic1nCgs3+Vd21eZlbKQ4EgukImjbhTIM/vtSHLpHiAM6D5LIVz0Ugz9ddlmEMSXZaSxw37ztr1eMSuw5ad3o3U4eGrKun8noFrcPt/6xp1dY/vNxPgM0SF1pw0rIDo5YDZLdkhLctmKCI7ccM7fMotVQQVFHXNsPAc+FvV08Kk0b/LtQ5Zr6Po+XYsBPlU0vKc0SsawyuMo9z28/L9478wLH28bFv/H2v88K07hSm95E4EShKYoRk88gA9PlMxp3STacL93cq8ss0Cuef9SpgsIKJXFa5cSQh5hTwOabaW7DkubtcqlOmpSf0REaJxQuh2pj0IiX1LxAEHBXqrYkpmcOyfDo9uFub1n3EbnZ1dikRhtfCoxyRtMR7GEfnfQ6+4pKHo5QZRPJtA3K3nR9rjB6v5gDCPR95xNf1/i0ucO4GE2t+w/SuMf6ufio7JHVl4ZCB03EJvJxHkhTa6CWLi3X9gYWuSUgCvthBQLkqq9xvAKEzuh4EXx0e3mRe5hVQIy3BUJeki15AtJtWD1cKkTTP2Mh76c2LOeZKrFdDIdD1dGMKzE/zZbkZ2irwYw0USFog1ejxRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(10067099003)(6133799003)(11063799006)(22082099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFBWdHB1SXRXZzZ4VTZYVHVaV0FBZEQrTVNZaHVFdnVIY3FpKzBIa0szUHM2?=
 =?utf-8?B?KzhyZFlBanlpalVlUDZzeWc5eS9DNUJNUTlkVEZUbTFEL0RiTjBFMklqUG9r?=
 =?utf-8?B?YWxHTVgzMW92cUpjZW5RWDlhSzF6TVZCN2tsbVFFYUwrNVlSM0tjS1pkRnZu?=
 =?utf-8?B?SFMvc1cvMDNRMDJwWlczWitJdkM1RjEvUlkrZThwUy9reCtxYVRXQzN3Y3N6?=
 =?utf-8?B?cklMQlFUMXJPZ2E0T2dBSSs2VFlLMm90TUx3K0lUVis4enN4UC9nZ0ZqTDJw?=
 =?utf-8?B?bFRWRU5nSjQveEhzWDdGbVVuVkxSOEN0VitFNUwrR0lrZW9rWlhYKytLWHZa?=
 =?utf-8?B?ZXcvdTU3Y2lUT0JQczRlb3EzRmNBNVlWSXViTlBqNDZ6MnhvWTFoamgwdU5t?=
 =?utf-8?B?dTJZZ1BoZTFMYVhONU95cGhPcnJpK3FwNzRQZG9MQlFoL29BSFByZDFpY01t?=
 =?utf-8?B?c2U5bnlEbXEyVlNVdGo5dmdja3VPL2xhc1JIdzN1NkU5akVJTVVocnFpVTVm?=
 =?utf-8?B?Y3g3N0RwNVFrbDF4R1YzUzdHWUROdFJEdXNDclFwTWpRVGhjNUNubjR4VWtG?=
 =?utf-8?B?dDVSbEdzR1NXMDNUZjZjRmwyRjFUVHFYVDBhSm1IQm1XUFVzQnR5WGpyN0h2?=
 =?utf-8?B?SEcrcGx0amdBM0g4UjFZUWQ0cWprNzFTYytCaDUrN2tEMVZ4cmcwUHpjMlFx?=
 =?utf-8?B?RGdhdi9YZ3ZvYlNkMUYyaFRGNU9CeGdrSStOSDVHVmwxdi9ZWkR6K1hLNFB1?=
 =?utf-8?B?RDhYZXZGK2VGcXNQMFZxZ1YrY3pBbTNQNlV4Y1IzS0V2THdmeFNsdTFNU0ZH?=
 =?utf-8?B?YWswMU91OGdoTGpmR1JoWUZDQWFvVnFWSU1HZElna09aV3E3ZEFRSFhoSStS?=
 =?utf-8?B?eWxJaHpoUzFxc29EdGVjN3dQd05YSmd1emJvaGJXSm1aVkxQQytmNUZYUW1L?=
 =?utf-8?B?eE92dkx6ci91VUlwcWlsNFVucjFGbFdlV1QvVUJHWG1KMmwrTjN3S2R2RTI3?=
 =?utf-8?B?enVlMThKWk50Z1BqOW03WU5DNGMxYlN4eUJrdWtDaHF1bGdPRFFSSjhBaW9n?=
 =?utf-8?B?T085bzdIN1FXaFFsNUZ4ZXlveUhpZENLUDA2bk1rZ1IrQk9oV3g2S2hkK2J4?=
 =?utf-8?B?d0F1Q0prQWFvbTJUZ0lwU3BtNzduNHJPb0ZsTHJVQmVGSW1VRHdyczRlWHVv?=
 =?utf-8?B?Yy9UTHRIWGdxalpXcjgvYklXMS9mNFJZS1VqelZ2VzlXZ0JuWkZrWWhVeStv?=
 =?utf-8?B?SHhqSXRPWmVkSDA3Z2pDSTNYMUlNWXVCTnhleTE2QUJxa1hESE5PelpURUtP?=
 =?utf-8?B?WTdJS3lMdEtBWmFDSFdRS2twQjdNeW5qcXJaZWhEM2E3MEFseHg0M0dlclJD?=
 =?utf-8?B?bWF2cDZqKy9xQXpZTHhLR0x3REt1b3dFQ1JrSHluL1JNeXZUUmR6VVEyUVRL?=
 =?utf-8?B?RDNBbDdTWmYvTjJEb2RoNTh6MWlCOHNZUmVHVU9XdlZSS1NaQ09KSGp0ZVlD?=
 =?utf-8?B?b2tIZjdHM2cvZUkvWmRYL29hZmR5THRwWjFJbU1XS0lmaVRYWnZoWHRTUlpj?=
 =?utf-8?B?a0hTbGpFZ1kxcFl2TWF5UkxXaG51R1ZBU0dEQWNPaUZGQ0FOeVAza2lpNHh4?=
 =?utf-8?B?dGpUVEV2dlJCREhSWXErazFkTityVS9JQTZLRHdyNFB3OUdRdFk1MlA1UmxO?=
 =?utf-8?B?MXFyR2diMFQ0WEcxMjRkalUxcm5GOE1PcDQvaWxPamN3TzdQSktUei9tU0lG?=
 =?utf-8?B?eUVaVkVTaCtjSVpZUWc1a01YMHZQUEo0SHRzalVYNFo5QjVOcmlidU8zQlJ2?=
 =?utf-8?B?ZnBDVTQ5a2lXWjlWVHZaVnBDYWVKaStiU2NFbGloSFJERFJqbGowNVFsMHcr?=
 =?utf-8?B?TWFiS2tpbmdRWXlzNms4MCtPTU54SUdaa082MkRrYXM4T2hGUTREUVh5RkNh?=
 =?utf-8?B?ZENkS0tHMi9yOG5NODZBa2tZTjBXMDc0UzVKd0JhVGF3b05kQVY2dFFBT2hj?=
 =?utf-8?B?VU1BOUh5N2w1WVZSNGlEeWt2QVdoN1FOVzVEQld6bk4ybEo0RlA5OFo2WjV4?=
 =?utf-8?B?ZXREUUpzZGRRQlN0QzMvK0lVOUlGUHdUa0FjR1hHcEFLeGxvcnBYY1dpbEMx?=
 =?utf-8?B?NFJFdTRMc1ZRdXI4VXBzWTN4WWswdnFTdEh6cEFiZUQ4cVFOUG5BYmlPVVUr?=
 =?utf-8?B?YXVBaFQ5QkpiS01NY202V0JRZEc0NlhCbGEvSFVtNmkrWFNNczlpRkgvQVMy?=
 =?utf-8?B?aFhEanNVY0hqb1V3QTUvSWlGbWZTcSt5TEdja2FqcDU5V2Jwb002dmdIdis1?=
 =?utf-8?B?eDBrQ1Z2S1ZBcUJ5UEorY0YyZ1VZbkdxVHVGTTNpSEV0L3NVbkJaSWt1cndx?=
 =?utf-8?Q?U3c+jeTD22DqsTNQ=3D?=
X-Exchange-RoutingPolicyChecked: K5F2Uu+Mt3+6B93tQBW5ytlF+XC2ZzAvZbeaYsdklNYZjKEJiAUfmZoCy8IKEx5JqaQGERTZbW3nDVu+95er3Rb2o69v/VXyBvc5OeEnB5KK03e+fJ8wE7KUpD/0Uhef3eBTIM2w87WeHT19orKE++MjeL00wP2+ClrUk9Da2OLPlFp4iUosmSBjYQ8eGmqC4+bslFfbYfpUOTPkYrak020oLel6IHirELlfBjgEYVa3FrQCvsQUvdu8QNa2i8vIXCAiz/sONqbu6C9UZGjRSdqJ2Pb8P2ZjXJa+jQG+AhdtAXckpXGcHhpwLAq64aizd37J6Cy0aZSkMK+zVs9LyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cdc5bf-aa22-45ce-7048-08df04820ec0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 21:27:55.2130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObuAHInnax6nPEM9X7pez7ak54MK5HKJVRFrJPmO5z0L6hemDeFZQPujXEQpib+A0JaDu8CRDl3DHjThLwTmAmE3ryAnJaYCYwu8ilufAW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB184224
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



On 8/25/2026 7:59 PM, Badal Nilawar wrote:
> Add xe_emit_hardware_error_cper() as a public wrapper around the
> internal hardware CPER emission helper, enabling xe_log.c to emit
> hardware error CPER records.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_log.c | 17 +++++++++++------
>  drivers/gpu/drm/xe/xe_ras.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h |  4 ++++
>  3 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 5549ef6966fd..c78fc195c55b 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -10,15 +10,25 @@
>  
>  #include "xe_device.h"
>  #include "xe_log.h"
> +#include "xe_ras.h"
>  #include "xe_printk.h"
>  
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
>  static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>  			  u32 component, u32 location, const void *data, size_t len,
>  			  struct va_format *vaf)
>  {
>  	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
>  				   component, location, data, len, vaf);
> -	/* TODO */
> +	/* TODO software CPER */
> +
> +	if (is_hw_sigid(sigid))
> +		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
> +					    (struct xe_ras_error_class *)data);

make sure to check data len before doing a cast
also, maybe do all that in xe_emit_hardware_error_cper()
in case we would want to pass other blobs to xe_log

>  }
>  
>  static const char *log_unknown_component_prefix(u32 component)
> @@ -100,11 +110,6 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>  	return buf;
>  }
>  
> -static bool is_hw_sigid(enum xe_sigid sigid)
> -{
> -	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> -}
> -
>  static bool is_sev_error(int cper_sev)
>  {
>  	return cper_sev != CPER_SEV_INFORMATIONAL;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index ff9d917b8e29..b4cdb5ec6491 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -837,6 +837,29 @@ static void emit_hw_error_cper(struct xe_device *xe,
>  	}
>  }
>  
> +/**
> + * xe_emit_hardware_error_cper() - Emit a hardware error CPER record

shouldn't this be named as:

	xe_ras_emit_hardware_cper

as we should use xe_ras prefix for functions in this file
and error is redundant as we already have cper in the name
> + * @pdev: PCI device associated with the Xe device
> + * @cper_sev: CPER severity
> + * @sigid: Error signature identifier
> + * @error_class: Hardware error classification details
> + *
> + * Emit a CPER record for a hardware error
> + */
> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +				 struct xe_ras_error_class *counter)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);

I guess we can pass xe to xe_emit_hardware_error_cper()
pdev was only needed in xe_log to cover early probe errors

> +
> +	if (!xe)
> +		return;
> +
> +	if (counter && !ras_counter_is_valid(xe, counter))
> +		return;
> +
> +	emit_hw_error_cper(xe, counter, NULL, sigid, cper_sev);
> +}
> +
>  /**
>   * xe_ras_process_errors() - Process and contain hardware errors
>   * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 618364734043..e5c4b2e2e1fd 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -7,6 +7,8 @@
>  #define _XE_RAS_H_
>  
>  #include <linux/types.h>
> +#include "abi/xe_sigid_abi.h"
> +#include "xe_device.h"

do we need this?

>  #include "xe_ras_types.h"
>  
>  struct xe_device;
> @@ -18,5 +20,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
>  int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
>  void xe_ras_init(struct xe_device *xe);
>  enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +				 struct xe_ras_error_class *error_class);
>  
>  #endif

