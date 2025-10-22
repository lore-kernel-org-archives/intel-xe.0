Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87BECCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 18:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F9C10E834;
	Wed, 22 Oct 2025 18:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dw+fCbGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9480110E834
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761158654; x=1792694654;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OQUMJQP0FNsHprLSiEs279GYEaF839/3oAiG851rUwY=;
 b=dw+fCbGdHnqe5JQg+299GRbL7DXyMFfCS483ilzq+v46d/izN0V3aVDg
 vLDn5hVSryFu0CLK/9IqKWqQqYp6+IPsVmjJprMQKZKp3+Vo1caR8XxEf
 EThsJZ7y7ZWo7vRUrP1YZgXMTrhca1rxqnjNTLDp6yHmdB6jiB6Fv8wem
 B5yAoGd+VlWpSfoGWnxleJFT+qdHEPCSf5sZnIUYQtYIP1CKHDY4ibS+p
 yYPx6DKtjNKDgz20ztyMpbcvHZnnKD/lDsE9Y32fmph4ip86zFdCQe5P7
 ywDJCOBBhYaT4AWmL8VsJjqqBlWjkp3jj7DRU2Ms5JSToUJxMjqtNgWjL g==;
X-CSE-ConnectionGUID: DIiY0C0mTYG3G2LI37rcGg==
X-CSE-MsgGUID: W8/WS9/LRIm+42RZeAEDaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63413777"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63413777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:44:14 -0700
X-CSE-ConnectionGUID: uahFieCKQjWQjqsm1wCq7Q==
X-CSE-MsgGUID: 9QbA6gmDQXyhh/kakNiEyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="207612603"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:44:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 11:44:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 11:44:13 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 11:44:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NecJlw4ZvsQr45Z44JOIHdF0bgtlQGJDz4MwBtzPejIuuPk+DtXFnW9zMRVk0g5qqzuwG4GZS+zAsLDNH4/kxce67spRKt/65iQbukc72RsQD8+xehwrN94kUXs+cG9SF6jexfaEq0hjCKnmijsuchdeI/H2H90Hc8dmb/0brV7jJ4OTDEJ6CDySvViNnbgL5D3UAfUXRHLO5Xotk1lq7dV8jkAgBRU6Vs6iIKeipV6EqtIl13AaHRudUdYb9/CCfcvOTtj92es0JT42k6DR8CXYPjxjFtBZ93zPN2j2NOsu8pPC/ZsUMsoTd/E4cQF7KA/gJoHEYj+GIY/S/+uLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Im+d2i2KnXW0K2o4U/xcr2LHL5VC+g//Dm9sf/WXq48=;
 b=ySI4BpaJv+W1UWmLaJIBxdg2I9Dyj3DI449eMQtDPqmMOTMPJW5zR6om+zmcwVGBV4JJ+dRCZyoLQuDymmUwWEaNmAP0GFDKc0hc5gRBapJVAaPXDx2q/Dik0mPbURpkix+z2nN2Nez+EE9xX1o9PebT9m1Mmvwh+JYL7iZ28CkXE+30v5tuhE+i+XNHKgEmeCQoso3v8+I706Qnz9dFZG2Lz8FD6LOncGaeq0Hy9uBtZx3mch2Wx4dd1eo5NMEZyaVtZVt62OrA8kkW1PKX+VXLrVBn2KtudSgVYeSmc5aPscqQbpDJbwEZHlaR9dZbSs5y0wXAEi+4zXWrUeriuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB9133.namprd11.prod.outlook.com (2603:10b6:208:572::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 18:44:12 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 18:44:12 +0000
Message-ID: <319e681f-d9aa-45ec-af92-3a9629d1bb90@intel.com>
Date: Wed, 22 Oct 2025 20:44:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix spelling and typos across Xe driver files
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yadav,
 Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
References: <20251022090344.934584-2-sanjay.kumar.yadav@intel.com>
 <d124774371d12d4cb1f3ddd1566beb539db63797.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d124774371d12d4cb1f3ddd1566beb539db63797.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0229.eurprd08.prod.outlook.com
 (2603:10a6:802:15::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e674e7-0f45-4906-e25d-08de119afdfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkNFRlBrMjBLZ2Y5a29NRER3bEtXaUJRdTM4OXlPUmJiR2JTQkE5TnpvakJH?=
 =?utf-8?B?YkY0WWgrRWNraFBjUC82ZDYrT1hxcEE4OTNMdk1hMldoMDg2ZHEyMklSSjVP?=
 =?utf-8?B?dG9PbU5FRG5IWVRYWUdaZUNKNkEvOFcxeU56OUlkOTdJakRPOXI2NUJuM3Vj?=
 =?utf-8?B?YW83b2gxc2dWLzB4NHFqbEZOaG4rdjNHbks0NFhFdGtFVGRVckptNEEvbDEv?=
 =?utf-8?B?NWppTFc4UExncS9rU1M1NGlNR01YOWVodENrajNFRUJPS3FSU2V0cjJLbCtt?=
 =?utf-8?B?a1pGemtJVXl5OGNpbGo0ZjBjUXlZcFMxT3lIOEZvSG0wSElxcEd3MVh4cmk0?=
 =?utf-8?B?VW45QndpcHFEM2YvelRsdDhIWXoxUFhjbytNVzY5aTRvaWxRSUxZcnFyNG1Y?=
 =?utf-8?B?WnpGU2F2LzV3ZVVobjJkYzgyTkR3YkwzOWw2UksraFZaR0k1anBOS1BBMFE2?=
 =?utf-8?B?NUVPMjRJR1ZVNkJ0UGhGOTMxWXRIVC92Z20xOTVsdmoyS2tpUnFCZHVwWTdq?=
 =?utf-8?B?TVZSUTBPaDk1RjltSEcyQVU4WG1ZMjZOZFRVa1NMYmJncFV1OXZYcVhhS2Qy?=
 =?utf-8?B?bW5PQkVpbkE3dHA5R2Z6eVNNbWtONGkwcG5zRDduQnZVRkwxM0FpbDdTVEov?=
 =?utf-8?B?cVRnN0VXUWQ2QURNbzBXMmpNUEYzVHRHUFZiRVZ2SzJZY3lWM3RrV3VLalZq?=
 =?utf-8?B?aGkvbkJna0grMEFSQzhaWnNWTjRSc25jOUl0eVZGZUJrVTU1akRjZ21rQkVs?=
 =?utf-8?B?Zmw0NDdRaVRjKzRBZW0zZzdEQnZVQmdLTjh6ZWY5NmZwYzFiSmtQYUxJcVZh?=
 =?utf-8?B?eExvVjlSVWJxOEFnVmowZFlZTnVFcjlLeWQ4L0xkN1BNbUhkaGxiZGkySDFq?=
 =?utf-8?B?VTZvNEdVK1dYOXVGcXFYa2hMTmt5K3YxUWFZNk51RndsU2NVMnp1blhRWHR1?=
 =?utf-8?B?SERQQUFiNFh2SzUwWHoyMXZMNWVzcXpiNWxZUGNrelhCM2NzU29SOXRFZnRh?=
 =?utf-8?B?N3FZU01lOXRicG11bGFONllzeXlzS1VQT3RNcW0rVkljNVVCc1hBbmJhcDkv?=
 =?utf-8?B?b1VQRGxpdmVZejhPTTBqUGludXpwUTcrMm9ManhkbSs3UldXL0szQktQY0Vt?=
 =?utf-8?B?OEQyOFlOWmkzUjBDY2N5SXAwVzVlaHFWTzBwWS9HV1hHeWpwVkF0T2p5dlVE?=
 =?utf-8?B?dFVIaWRrdk1xY0tybVZXSnlFNjVWMURtMWxHQ2xjOWExRndSbTE3ODdnOXgv?=
 =?utf-8?B?eDlUVGx5VFM2SEZmQXc3di9HOUFQbkRHUHVOeTFKUi9PdC9FUGsvY09GV2Fp?=
 =?utf-8?B?K3ZZSGlzNHUybDZhRDFkdnIrMyt0M3JDbDhYRTd5NVc3MlhLSUZPYlNpS2h2?=
 =?utf-8?B?b09WTXJHQ0hrYTZBME9JVWFIK3ZSMHpSaEMzQWthRXg3TzB5RU5vZzdFM2lM?=
 =?utf-8?B?NHFZd200blJoQlJvdVFPNnA2V0xSOHNwaStncXlYeWNRQ2w5RkcyTVhvOXl0?=
 =?utf-8?B?SGNZdzZLMWM5dy8rZDk1NlZkVnl2K0FIaXlzN3RzK1RReEo2OGxGQ2liV1hm?=
 =?utf-8?B?NlZLUVZTTEtMaUtYRy9Ob2NIVlNDMndQaUdlbUs0Nmx1WVhVRnR5ZDk4MW9J?=
 =?utf-8?B?akU4M1MzOHFoWGl1Ui9EZm4ySkpub2NuaCt2VkRFSXkrTUVtdVArRlhzSDdZ?=
 =?utf-8?B?UTEvZzJYdm1zeUtNelp3MCtiYlZhNk5QL0p6ekZxWnR4b1FIdEYreVVWNzZS?=
 =?utf-8?B?NkZlSExwVDRwaG9YNkVGTUpWN2hvaStHN0dpQjN2bWhLWm9xaTR3V25Ea3l6?=
 =?utf-8?B?OVdXajVJd3B6RE8raEZRMDRYQmI1V3FXMUdTSDNIU0ZiVm1qajdZdVByeElP?=
 =?utf-8?B?ZEcvSmt4VE9BSzI1TndGWFJLSFlRdjVzbkNFWW56UVhnUnBNZm1abUdxSVZx?=
 =?utf-8?Q?CToYJ0gRoDGy9A/q4B/rMBg6y/Sle35f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlmcG9KYldLaFdHRWplRC9Ib2gvT2hqQ0RmbGJGNGp0SWpZYXBzdWkvYVhV?=
 =?utf-8?B?SG80aDU5cWFEYjRMWU9RV2hhMWtUYzl3bjBlcXBGZDNLQTNJeENYOUxqN01M?=
 =?utf-8?B?MGY3YWZDWG5IcDhQRmFVeHdxMXZoL0xwNzd5TnFGdlFOckc0U29KcHZqdTAz?=
 =?utf-8?B?elJLWTkwMWZKa2JxMlgzVG5lSFcxaUV2eVhURGpCQThMb2dUc0laenNQZnBu?=
 =?utf-8?B?dW11WldoVTBBTFdSbWRzeEtoU1NPSTZ5bG1mRGVZbEpSZC9sbXdFU1FKS1RK?=
 =?utf-8?B?alJNdklwTEdwL0E3cUVYY0tsMnhqdG14ZnNNcHk2LzRKNGVwMkg2V052cExj?=
 =?utf-8?B?cEJpOWR0czJMRDlNek5ZMDNaU1doanpYSGZpdnlMN3FjVFdFenZpUVZ2VkZi?=
 =?utf-8?B?MDNNcU9SbVZLbWxFQlJ0WFkvM3VZRkIvRmpqd3ZGMk9QbmpsYURmMFNBRTZa?=
 =?utf-8?B?bnBHa3oyK1J4UGJkRFRnWndFY2RVMUhtL2QxcXBzUEJ5SkV1KzlkZzkxMHhU?=
 =?utf-8?B?QTRLb0lWZFR4b0RsTHNjOFZEdnJ4OEY0UEt6akFRMVhjdHRhY0JTWWxVazZz?=
 =?utf-8?B?ZDM5UTB5amNVRDlwblJuRDNZcEVra2VOMUcvc0hhZzBJR2ZuNDJTanlsNGFF?=
 =?utf-8?B?WVVER3FKaVczMFBpbzljWjZYc2tlNmJnYyswZGJSbFZ2TmNZaDRNWDEvZ0NP?=
 =?utf-8?B?TnlDVExwd3lDSGlJb1Uybm9JT0lmQ3NnQ3ZXang4OWRwaXRBbXlFbzNPaWYv?=
 =?utf-8?B?TDF2M2xNWGdwUUZBOFZ4RXh3SUlkK0pwbFdwTFJ0Q3hyMGVsTU0rRDlBSE9P?=
 =?utf-8?B?K3BjaGlRTGlwTGRUOStPU3pjblZHbWN6aHhpWXFaenFyby9UcVlqUmthcmp3?=
 =?utf-8?B?a3FRMGZxM0xGN1A1c2NOLzVjTjY1UmZrN1NOTFRTMDBhNzJXTVVmNkhwakJJ?=
 =?utf-8?B?c1F6Vm84dFlkZmdzQjlYZlViSTU4VWFCVWNPS2thdy9NNFNuMmFBUnNld2gv?=
 =?utf-8?B?dXVQaE4vWFFJOFVtRkRRenVNb0Fjb3ZENlNLSUIxL3I3Q3p4TWlOeEs1Z1ZH?=
 =?utf-8?B?QUI5dnZCdXRqZlNScHVOeDFsRVlBOEd5UGVsdGRnOWl1OWZRTm14QmYvb0pI?=
 =?utf-8?B?b3psNTB3cU1sSTF2dnVHQm5kemRWKzZVa1h0OW5NalJDK0Jtd0p6R0RLbGJj?=
 =?utf-8?B?UVlsNGlWcUJXa283NUF2S0ZZN3JVODI2K0pYNE9TdWxLeTZDV1BJYUJZZmRI?=
 =?utf-8?B?WC9NZG5vNWI0dFFBdTNKZ0NPOHg4dFQvTllCNWNpTkdnTkRETDNLeXR2V3U1?=
 =?utf-8?B?OUtLWGJtMW0zV2t1U3NWREpCZXdpYlFJZjhqajFFUlVHbUtjT3dxaTJCa3FG?=
 =?utf-8?B?cEFQcGxMTU9DTU9ncVF3RFMrclVWcVh2UytvUWxvcHVTYTZIOFZrYzhoWXlt?=
 =?utf-8?B?K2NreC9LQXdQczkrLy9ETytFZXBFQ1NiSmY5SmpQUnVSanA5SmsxcDJsYUtF?=
 =?utf-8?B?aE9KUEFPeksxRlpvSWZtSzR3Vk9SZUlWSFRreE53QmdFZHY4RHFVWE9iWDE4?=
 =?utf-8?B?dEhDTFFJSzcxZDRLTitpT1RCb3ptTWZGbklqK1k1MzNmQkxPWG5CRy94Ukgz?=
 =?utf-8?B?dm1sQTVtZjlKN2ZNM01lSkhqV1JzYndxNjN3b2MxY2U1WnhWVlNaTXV1VVY3?=
 =?utf-8?B?a0w3WEFaMCtUeGlnNjR3R1JDTjh6L3FVenJFTU11UmVzdTdzQ2xUektFc1I2?=
 =?utf-8?B?ZWxoVC9NRzZua0xUUXBQSW1WRDRpdUNQYzNtOTZPRC91VTRKdW9ESDV6MjV3?=
 =?utf-8?B?TzB0UmxSamZCanZRTTNtYS9QcW5adGlrQm4rVDFOMlZaaEhYRis4NVQxZlVp?=
 =?utf-8?B?cytJNXQ3MnArMEZFeGtlUGFzbmZLWUl2RXg0RGw2YUFndHBKbi9TWnZ0c3FN?=
 =?utf-8?B?NDZHZFNnVEU4SXNuckNSYVk5R2ZiR3pkMDkzdDdUdUdFQ2pKT0IwOHQ2MlNl?=
 =?utf-8?B?b3EyZXhhQ291dEJjakFuemQxNmR4YkpQZG1JRWZrdlQ2NVJ0UzE3YmJwckdW?=
 =?utf-8?B?Z1kzTmpxb0Rmd3VtaWJOSXRkRjl2U2VCZS82TXJlQUgxNTZXdFZyS2pjalFp?=
 =?utf-8?B?K29QbHVQZWpFQ1RudUd1MitYYzJJRUd1ME1MSytSUUNJSWpiVGJFR3JLNTZG?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e674e7-0f45-4906-e25d-08de119afdfd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 18:44:11.9891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BY0h3pWY+JCWbS6AhxWQ5NhZ2NYYcCCWDq05bt2wLnkPWdjX8OgrzhvnuJKMJbEPs/rpliZpQIGBCD2WRxvUe+Eis59WbGPWtVKO3iWBnK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9133
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



On 10/22/2025 8:13 PM, Summers, Stuart wrote:
> On Wed, 2025-10-22 at 14:33 +0530, Sanjay Yadav wrote:
>> Corrected various spelling mistakes and typos in multiple
>> files under the Xe directory. These fixes improve clarity
>> and maintain consistency in documentation.
>>
>> v2
>> - Replaced all instances of "XE" with "Xe"
>> - of -> for
>> - Typical -> Typically
>>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> 
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
>> ---

...

>> diff --git a/drivers/gpu/drm/xe/xe_args.h
>> b/drivers/gpu/drm/xe/xe_args.h
>> index 4dbc7e53c624..84488f527d9a 100644
>> --- a/drivers/gpu/drm/xe/xe_args.h
>> +++ b/drivers/gpu/drm/xe/xe_args.h
>> @@ -9,7 +9,7 @@
>>  #include <linux/args.h>
>>  
>>  /*
>> - * Why don't the following macros have the XE prefix?
>> + * Why don't the following macros have the Xe prefix?

but here the "XE" refers to the actual macro prefix, not the driver name

>>   *
>>   * Once we find more potential users outside of the Xe driver, we

which is correctly spelled here as "Xe"

>> plan to move
>>   * all of the following macros unchanged to linux/args.h.
