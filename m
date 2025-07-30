Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E67C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 21:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D7B10E10B;
	Wed, 30 Jul 2025 21:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtzMQAQr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7539410E10B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753911324; x=1785447324;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DkUEws+0u9bsnngu2VdyH25tq/9kfPVCt1s0Razztic=;
 b=FtzMQAQr9rvvTx3MvZrM8uxa30577C7sBOMxnZq78XuuIWIkPXLkwa4O
 mBchFl3ym2rS9Iu8Sf/uqueKRzU/7nA6UAuwqdU8wCZqD8GCblFNBOKe/
 Mp3WWGEQeNBLquZUC2CiJvHCpaKD0Wln7jMtZQqtVGFib04JXLDEqTQWc
 GBG3w9KVMSA7KHR3i6ASGXCXFenW62QfLJJ5XHqFocFJ1nJ/QeQiu4w9d
 A/KoPcFd3fbiANsDKtRdgxxpo31sWtr7sIIvWn8BY32P7Jvq2cUP6Regp
 eIzWbge3OnYDFLpJnMl2WwHdSailR0vtuavaLszCwzz6f0bySnANQBZXW A==;
X-CSE-ConnectionGUID: 5FdxbWO3Qhm0yvWzGIQCIw==
X-CSE-MsgGUID: Nz6cHBhvQ+ia05FXzR8Q8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="81679107"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="81679107"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:34:27 -0700
X-CSE-ConnectionGUID: VCfyL/OvTjOJJCyNF3lTFw==
X-CSE-MsgGUID: LdYZErAkR5WkhKzzniF9Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="168495840"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:34:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:34:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 14:34:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6swolVLcogcV3z9k/N6ehZv6PxnYT7ggAghHWxP3OnBldE/uozBxJUwDN40jxfbJsnCSB9VShtSy5LpiGboTAAA/bW04AdIAbQg8Tef+nLwB+TDvReZpVfzODPLkLMZdyACeM7ux12REz5iziZpjo17h+IcVyIrQgQBJdCyrqq4laBz1g4++pq6jNhz/hTLBXcWNnH/F1c3xWKTbAd9G3hsMdrKadg4CJfqCwej9nga8fVqZ6MLK3+mi5+4qZrePtrs6oMOkikit9pZQA5tjPNW1nS/NF0Cj7vGV2LeLFEqISOjdNnCYQyLzSqsBE6s5Evm+hvXX/eBMoQlzPSImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YEQIm06XXpBXpYNYKItL5OaESVzM0igCODK6QcFMqQ=;
 b=LgA2afmEMfUnnzCN9gfRQXCZZxWGkatR3F4AjowdEHibX/PLGTTzB3caefXjLwyq9fXk4FaYQBF5l69rl1q8610pZjWrW7G5KCAG3620y37Td1u/yPfZYO1fUsoXdM7jl4m7XBfc/EMA5Mvi3TBMb0xP4+GA8BNUPRtdX/QE6EhoHXf2U4hnzYEkCS3FIDWy4H4gbcDDC+/sJ6+BgLDt47tTNjNAIrb+6CrNO3Nut/JoJUwaRbampb0VSJ3x0bFvIOf4rDd3ns6JIkoMJj5gbGKrpaJa+QshdUmBhT3hjkmlUbxg27rPQFFIIDMUt/39Fp/pu1EzdJUhKX8Kat1G6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 21:34:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 21:34:06 +0000
Message-ID: <ba302e3a-50e1-430f-b38d-651e588f2787@intel.com>
Date: Wed, 30 Jul 2025 23:34:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-2-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B1CE4DD9227B04115BDCE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444B1CE4DD9227B04115BDCE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e5ad22-18a2-4b41-a649-08ddcfb0cfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjdzdGkwSThEM25KaHZJTVFIVXF4U1JJZ1RxYUdaVlVjZGtlY2JHTUpzV1E5?=
 =?utf-8?B?TDBGaTliT09ucEdwZmRiN1JFbW05ZURDWXdoWlVZZmNVa2M4Rk15RUh3V1pL?=
 =?utf-8?B?ZUswenNReFB5ZDF4M0ZTVUJsYXExM1AyRWpMOWcySE9iMWhIbW8xYXFxWkFL?=
 =?utf-8?B?SWNNLzJEd0RvKzFVbWg5ZTFoS29KZVJocXB5VEZVcFI3L0Z6TFBLMXJPb2F2?=
 =?utf-8?B?ejhtZWZOS3B4c3E3RDYvVEwxd3BhRVJSVjhYZ04xdjJQSFlETU9pTWsvVUhM?=
 =?utf-8?B?K2ZlSHJwMFdxMUdsSUVpQ2JWNklYcTV4QWJKSmJsSEUvNnJhYi84MGora3Vx?=
 =?utf-8?B?M1FjdGFvTGdSNzlKcVo3VUJZc05hbTBRdkorWFY2YVVtTDh6WUVpd0lDckVu?=
 =?utf-8?B?aHI2dnI2R2tJM1ZCRTF5UmlDaVNRdk5HVzN5ZnpKdFpxT0h3dWZnbFdpSHZV?=
 =?utf-8?B?M09oeVdCZTBKVlZkVjFLY3dtTTFmMXNPTVVFenhLOE5qalRaN3JYYk85dWdS?=
 =?utf-8?B?ang1TmlXZ3RvR1JTOFpUWWdGL2ZEMEdrOE45S25vWVUwS2wxdHl2YU9hN1ZI?=
 =?utf-8?B?VHhRY09KdWNpdklMM1Z0dW5BR2FSWS9FVDUyOTk4YUdROTBQblRFMUN1Tm9Y?=
 =?utf-8?B?Z3RkM3RMUzBaQ0Y4a3lUZVk5UGgrYWJ3ZUtTN2NOTkZsT3BzKzVPd3JPS3VN?=
 =?utf-8?B?aTNZV0dpVS9uak9KK1hPd2VOUFpobzFjcFhnZlhHU0QzdVh6N1A3NGEyV0pt?=
 =?utf-8?B?NllrdkJCZmkrZ055anBYL3FaTnVWbXUyVXFzYy95WCtVNkhLbzFxN0Vpc1hl?=
 =?utf-8?B?eWRrYkhXdFhwSUs5OTJpYmF5V3VWQ3dKRVNpVFRDRnpvZW5KWHFBdDVvczFl?=
 =?utf-8?B?Sm1mSlNPV0JaRUo2dzA3enh0WmtCWWtZQ2Fkek5wTmVzVXdmWEdZVjI2Uytl?=
 =?utf-8?B?Yms4SWlsMVRITWtvTEl1MDZ0ejd2RG9oUDB1MWltUTBSeXVsM0pJMjZXUlRT?=
 =?utf-8?B?cnhkK0NZUGpwT0NnenRmbDhiTXNXYjdrZVFUa003UUxXUTFkYWhVM3JVK09x?=
 =?utf-8?B?MkxsVEVVam5QdlByalNXbS9tTkVvOVc3eStzTXM2N0YyMnI2RW8vd290NlVQ?=
 =?utf-8?B?TTJXYXdPNnF3VEx1bEllUllDWk10YzFBUm5od2dzL05sN2lPTE1qUjFXTStU?=
 =?utf-8?B?cE5jUmtTZWhUVFYwd2wzY01YMUYrdUdTT3hhK2MyVlljaWJnZitIQ0RnNm9p?=
 =?utf-8?B?Vy81MlRjVFl2VjM0WFZ5WjcraFlDOHUwQlpNZ3lxamI4ZG4rRVFhUGwwR1p0?=
 =?utf-8?B?VXBlTkZoL0ZIMnRRS3dWdHFFQUVQc21iV3FJdDRCR0w3LzhvWE9kUnVIUEJk?=
 =?utf-8?B?em45Z25UWXN5WnJzeSswVXQvbk5ERkRhYTk5ay9ab2RVM2RTT3dRMTBBNEJw?=
 =?utf-8?B?WUpTQTI3RFo3ajgrb1ZqWXBtTWd2WjNVTHpJeWRSOG9sVElDZ2pxa0tkSDY1?=
 =?utf-8?B?TkZtTExrVTFaNXNDVjdCRURITlRZNzNUYjhvM0JyTHZYNUQ0Ni9DSEVETHM2?=
 =?utf-8?B?a2VJeEdQNWNVVnhrZk1tUVBpdlFzUnZmVE51V21haHFjaXNGUElCV0pvbS92?=
 =?utf-8?B?VkIvTmdOZ3pUWU9MWjdFQnhiRHNKMHlvb09XL1dhMDEzUC9kb0dEMXlyNnZX?=
 =?utf-8?B?T0dhNGExQnNzUk5tM1RXU29WZnJ3STB6VlB2dnJrUWFEK0Jnd2dDVTg1a2xW?=
 =?utf-8?B?L3BTM0tGRVY5VmpFNFlRcDFmaWhVRUFDcDFWOTRJazdBSlRlRW1RMWtmWkVZ?=
 =?utf-8?B?WmNxbHVLZ3cwZENGZ3FKeXpCYjY5cFY0VVFEVnpsYXVGbXhPQ0dkZzZ4OWNF?=
 =?utf-8?B?emRzVnd6VnRpWVp2b1pHS2JSZ2lHbjZaMnBlVnAzL1hmYUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnlQQm52TmJVOEVFa0ZOL1pTUE0yaXlWb25kOVBiRzR3N242em82dGUxTy9P?=
 =?utf-8?B?aHVJalNQV0krT3pYb1R0S2gxOWFiVDhQSm5ueDkwSFRRYVJLSVQvcjBmSUs4?=
 =?utf-8?B?eVNFeHF4N0hWcHNoUDhFaTMzelpQUkZuUG5sNnczVmlRVUFXWHFJY2EwTHVB?=
 =?utf-8?B?SmMybnNpU29DL3duLy9mZE5keGRoMlZrbk84eXBsMEQ5TkhZVWk5ZDVkVzY0?=
 =?utf-8?B?cGdtWHhOOGFrRTdXNHpUckxweU5sL09UcXVTSGt5OW1mVklvemVUS2FncWtw?=
 =?utf-8?B?MW9yVWx6RWpPa3o3K1RlOFAwRDdRRFVmMnZWc25nUGNlYk1jbEVLMXEwNWRh?=
 =?utf-8?B?clExWXBaNkdZZHV0QTF1ejFjN2p0T29GaHpKTk5YZkpOOUpFZW1TU1NiMWVS?=
 =?utf-8?B?ZkxHVFNGdW5aMzRBSlh2ajdjeFI5QWVSdHdCdjNOazFJUkhoWitRYnYrc29k?=
 =?utf-8?B?SGNWc0VMcFgwR2FYd1FzTTJyZ0RwdFdnTDNHdFZ5SUhKaFdFTkJjTm4yeG05?=
 =?utf-8?B?MUUwNGxNVjJqMjd2TitHZ3VVTFRFaytBeWRTYUJwZW55UkNNaXF5MFlDUHNi?=
 =?utf-8?B?b2NnL2krN1ZIMmdqTEVmd2F1b3BCUms4OEZycmllVHhXZm1JQldERGtpcE9J?=
 =?utf-8?B?V1RLUTQwWFRPWDFOZjFHbUxKNVQ3RHhDMEFTRUE0YzY0VW95MUtvVnpYQ2Vr?=
 =?utf-8?B?ZkpJUkg0TkorVmt4VEJESEZzSHEzdE95U3FQUUZTUk5tQWtIeWltTDlRUTJX?=
 =?utf-8?B?QVoyY2pRa25rV2lGYUdDZHhlSjBuZE1wUWx4Sm9wWkZpVVIrRHpqTVFTQURQ?=
 =?utf-8?B?NUlHQ3A0QnprdHQ0WW0zNWlvbVZDUHhRckw1RGx4SDA2M0gySmFMRnA0SC9C?=
 =?utf-8?B?eVZXM2U5eGV0K1JFUFNLZUJ6RjhCdExRSTdRVTNEWnAvYzJFSzhUNm5QaFlk?=
 =?utf-8?B?dUtETDIvTEVZV0RJakNDVVhzbHR6MTJPeFR1RDVCcE92bHdwZUxac1lrZUtv?=
 =?utf-8?B?aWFBQmcvV3lYYXJmTTBwUVBmeUNQWFNxU0dQZkJOcU1oaTQ3T3VhWjAyRk1H?=
 =?utf-8?B?RUZiTENIcTNLMmQxZWhLeG9KTVphOXoxQ0lId3JGaEk4di9wTlFEaDhERWdp?=
 =?utf-8?B?RnlTK1lmSFdadFJNQWhJSERvMUx2RGNFYVJWWU9ra25CMjY2QktxMGROM2VD?=
 =?utf-8?B?RFJ0d0lneE52T1lRS1lYOThiV09TcTVaVFEwanBBclJUZVdhWnNFQzhqbEtD?=
 =?utf-8?B?Z2dYSWpSTVFpYUxGcCt6NDJ4RThKT0JUK3laQ1NacjRZMjJzcHpiSkFwLy9F?=
 =?utf-8?B?WVFpVEU4OUVyU1h0WmR2REE3aWc3MWxYUnJWV3hjRm0zdEZnRC9EemxxNVZx?=
 =?utf-8?B?dTF2QTVPNnBqUjVaUERGdHF5Z1N2OXFBZVZRSGs2MkdHVlNMU01qTFBjaytW?=
 =?utf-8?B?dll1YUhlbmxwWWF2MHl2c1UxTFpVenVKRUhUcFBmNnNnVlpTYnFnMzFOTTQ3?=
 =?utf-8?B?QklKQXlJZHkxS1ZKb2lqU2tRamJ2ekIxeTVDNGZLSU9OUXFXSnAxSGN1UGg4?=
 =?utf-8?B?Zk54SURQaTRSRlJ0N0RBcXBLSjExODdDRU1kQ2JrUHh1bGNOT1YyS0FvOXZW?=
 =?utf-8?B?ZE1BdkN1aFMzU0JmTVhsSjFYNVZoSjBnekN1Z3lackF5VENXeVhBbVVKT0M1?=
 =?utf-8?B?S2k2UWRZMzhHWnQ5MGliYzRBT2haSzZyRHBhRm45dHVtYkE4OTFzVDRNWGFo?=
 =?utf-8?B?eDZVNlFCNmpDem1VMTNtcXNpcnludWVRdW5VUXMrc09KUkZPYzAwbjlxQTR6?=
 =?utf-8?B?MHcyWDUzUXBxOGVaeWJUdEUxd3hVU0g0NlN6a1k0Y29WNW5ZNHFhTCtUdUZp?=
 =?utf-8?B?WnRRRkRMTElIb2R4VWpSVzM4dmpDTGpGMThRKzNUbmVsSDc2R2NYemo0WFNu?=
 =?utf-8?B?dTJLdTltZk1tUjJndU1OMWh3cFJVMmJldC92L24wRHVCYUJDUkFod0VNNWRC?=
 =?utf-8?B?WTFwazJSUGlOTUxNcTQ4T01SdEhKWkdKdTQyMjBTK3Z3djlsTDB5V1U2aFgz?=
 =?utf-8?B?VnUrck1jazlseVY4K1ZxTW5UdFBtK3ZySUMzdE1HK2Y5T3Z3dlViQWJwaUcz?=
 =?utf-8?B?K2t6bWxkR0hCVWJ1cU1oTFRFQVdnVzZZaWVXUkRGaDVnK1NOb0xWcytsTG5Z?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e5ad22-18a2-4b41-a649-08ddcfb0cfe7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 21:34:06.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys6co3acl11krjJuwmYW0QVAxkoCCP5svp8BhOlFb68U0HS+8LAMpdyMPkqirCNCLsc2d7n4HVpwDhn0+azfX1cP2MG1ny1wMSr9peZtHuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
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



On 7/30/2025 11:08 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Wednesday, July 30, 2025 10:49 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
>>
>> We can't let restart worker run once device is removed, since other
>> data that it might want to access could be already released.
>> Explicitly disable worker as part of device cleanup action.
>>
>> Fixes: a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning to worker")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 30 ++++++++++++++++++++++++++++-
>>  1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index 35489fa81825..2761319fdc26 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -50,6 +50,11 @@ static void pf_init_workers(struct xe_gt *gt)
>>  	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
>>  }
>>  
>> +static void pf_fini_workers(struct xe_gt *gt)
>> +{
>> +	disable_work_sync(&gt->sriov.pf.workers.restart);
>> +}
>> +
>>  /**
>>   * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
>>   * @gt: the &xe_gt to initialize
>> @@ -79,6 +84,21 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>>  	return 0;
>>  }
>>  
>> +static void pf_fini_action(void *arg)
>> +{
>> +	struct xe_gt *gt = arg;
>> +
>> +	pf_fini_workers(gt);
>> +}
>> +
>> +static int pf_init_late(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>> +	return devm_add_action_or_reset(xe->drm.dev, pf_fini_action, gt);
>> +}
>> +
>>  /**
>>   * xe_gt_sriov_pf_init - Prepare SR-IOV PF data structures on PF.
>>   * @gt: the &xe_gt to initialize
>> @@ -95,7 +115,15 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>>  	if (err)
>>  		return err;
>>  

[1]

>> -	return xe_gt_sriov_pf_migration_init(gt);
>> +	err = xe_gt_sriov_pf_migration_init(gt);
>> +	if (err)
>> +		return err;

[2]

>> +
>> +	err = pf_init_late(gt);
>> +	if (err)
>> +		return err;
> 
> Everything else looks okay, but I don't think this conditional branch is necessary.
> I think we can just return err here unconditionally, as if we fail this branch, err
> would equal zero anyway, which is what we'd want to return.

this was done on purpose

I'm pretty sure modern compilers can optimize that and
IMO it is clearer to leave success path fully visible

especially that in the future we might want to add more steps
to this init() function, so we could have smaller diff and
avoid diffs like [1-2] above

> 
> With that change:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>> +
>> +	return 0;
>>  }
>>  
>>  static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
>> -- 
>> 2.47.1
>>
>>

