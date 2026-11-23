Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCA606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YGbYltAr;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TFSaloQl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C806510E727;
	Mon, 23 Nov 2026 11:39:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC110E3A4
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795433950; x=1826969950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dwZM7ZIdjoifYHDwCi3M0jnpc5b4N7SOX/A9cVc08yo=;
 b=YGbYltArfPeOuKJcuNZeSOAIMt7BYo10ysu9eByptEGJZndIk0Tg/T5h
 0tqMIlsajIKYmkPsa3JcevMTN7HxJVhygoW3aeXE8qnPvxUH9T/1yoS3f
 PUr6fYQ6V9ScsRFgtY96VMCwh8pyOSCfK0vY5RCOGz8ia1hLA6pE+ZPGC
 rAKJ711pXkPPHMVFhu4Cg3uMqgbiw13UcU/9ze61QXCfSVT7d38XFTx8e
 GvCQ85bSzbAN/gBqHh1JoLkLWyEUlsM56+Kev5Urh88Pp39/GLolwlVys
 DkETbZYzEtK2MVVM1jtLuo9Ghio1hjll1bD8Ld3EXJ2bNdWbdgcAIPryW A==;
X-CSE-ConnectionGUID: JREJD2mbQfeIXlIbG91LpA==
X-CSE-MsgGUID: h8cJ/jv9S1OkCkMmjQC5Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4249785"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4249785"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:39:09 -0800
X-CSE-ConnectionGUID: tGMBnTX8QyuydIa8fCQkeA==
X-CSE-MsgGUID: vfv3sy0PSreZx2icY3I53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11218598"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:39:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 03:39:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 03:39:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 03:39:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hh6a68O8fvJ5OzGBvgI/D5RC6Q89n7fYcId7Ni2jTkSDhCGht5NRomPnx2rZsXOIch7iSWLCd5fkesR6CTwB8hsdckPHNPQ5iY6rLjJvBVR2XGGhB7aUAFu4hKqydVayacDFLNTJ//qLQvK8h68X0UYYXoNFbh8fYE3+8Dl12OfyRT10olvNTLUPl/YQDXaLZTYqgkiZpZKBb6y4cUyQ2YuZhXNnEggqk/tjjyL5KMLDR3D4ZxnI1SoctbmQTnjYqp1JXNgw8kkDAeb5mLIOiF6gOyZBsKN08F3t+FF9/c2keSAlGLFAty/byZVWWsY+1TY1JrqERUxQMnITPg33bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=652R5IIDdPEP1UfjxF/Ts+mnBEKpCz4Wa3/RovYB2jY=;
 b=qjU2eXIIVWzxSCA5fxgXA7DUMUebtlTVUmfqeLgaUffWgJZUuIeh41TYF/yEn5SMi+IA6dygPjCtIdawi0D9A5PDHA14hZkFtahW65GIPVnBCHsI6v7p6UH7DNEEwxCY7w6PSMBz1NEjm+Mw9nocDgXYC+XKpXAdhg1t+8/vVXL0tzGUqvf2jSbNDLAFWHHo15RkV/McpZN4GaQreX58U2/UXtO4qCt0VfqWlg3svtkoAxFaa5HI0A/Q6J++DC3/yvU1UpX8ZHzzzZ2Nbo81PAxrSDTEDHdNrm42/HNwkC/KjOLn6jY8scjx+MkZ25pZTz/5hrAKE152rEqmAf6yYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=652R5IIDdPEP1UfjxF/Ts+mnBEKpCz4Wa3/RovYB2jY=;
 b=TFSaloQl0PnWTsCIntueBLE1DA43R+O/GlGxEFAI4puxQ6BbSPTv/VZYJv5s/0//0FiamQs/yhAMnfqwVYY5eK8Xz/UEz11A9fx1MbSGi8BbA10PQ4BL04OU1TADAN30bGWqGyj5Ft6a1vMwrZImh4sMM08DjBOVnTxN7TKKJw4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 11:39:03 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 11:39:03 +0000
Message-ID: <5928b2dc-953b-4a5e-bbf5-341aa11608b0@intel.com>
Date: Mon, 23 Nov 2026 17:08:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] drm/xe/vram: add decay-based reinstatement of
 soft-offlined VRAM pages
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
 <20261112124329.2960272-6-tejas.upadhyay@intel.com>
 <d3d09c5e-9ed6-4ba7-86b4-3dec77a7a337@intel.com>
 <DM3PPF4C59643280B0AC2BB341B78002C2581452@DM3PPF4C5964328.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <DM3PPF4C59643280B0AC2BB341B78002C2581452@DM3PPF4C5964328.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: 95fa8116-af99-4a16-cf20-08df49565fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261026121527099003|261102123227099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|11063799006|4143699003|56012099006|10067099003|261009221227099003|261009221727099003|261009223327099003|261009220027099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: FbW0JlIRfeNKasiC+KYtGuPwKC+M7dtW2jkNpVGasZvNx6Mfwnn1wY/cpFkR5ajHf9V/K3HORI2kC+Wj/iKg3r+7FVth7W2PHp2+0S0ETT4dxA2lXpg9HK2J7m7lZUaQlY9PwJQ3JPvlEcTwXoa9n/IlYB3ZEkaDD5AO+suz4sQj+S6NoNw8JgIiABiNXB7vC2yYnFQB8yfmnx8U16e1F2Yr9Xk6pYjR22X6EGcVSv8eSgpSZ7FD/DCBQZ1S2fRzz61pGF3J16MTYXijXgc1Zb0E73yA9JLIuE3RA/zQlPFi5qHo474IMflkDz7VhuXbcL4wzMKjNHmDM+lBWoE/tr+mx6MGI7GDfDiaiGjpGwyBP7mP/vYLdVU9yQOuKfGv/RH42WcmjKPDNjbldyEQJdWye34H5FnIFEztPcogckHXq2SckwxSo5Rb9l8xRpvGL25YeLPZMJSnfXLOTl5Tvnlq1KOIHB5uvIzwAOMXh6Bnb8T6UWL5I2QixPMwjk6HJ394fvVPMorJq7Rd7PW1KyxSmDWVVFrngO++LAyH/D9ZZgDNiInRArKPjnECUhYVvstf64Fvjy0utYiYjwRy0wMAUXRHo68z9LV0ARwSp+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261102123227099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(11063799006)(4143699003)(56012099006)(10067099003)(261009221227099003)(261009221727099003)(261009223327099003)(261009220027099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzlvQmJsNHRhaDEwcDdRRnppbnRkRDV2VmVrWXlJaDZ2c2VLNmxNR0ltcUN3?=
 =?utf-8?B?Y3J5dG5oUnBWN1VtaVUwbW40akRQbnBEUG90WDFFZG12TlBKaXJjQkFMNHA0?=
 =?utf-8?B?bXlDdWJzZzhYNm9zVTAyQ1dkQ1NuYmhXS01Yc084VC9HSWZhY3NCVXlQZk9k?=
 =?utf-8?B?MU85ZzFVc1d0Um9tV0hjN2NDZC9HNis0OGFvNElSbnl0L2p3d1Rqb2tHKzdS?=
 =?utf-8?B?eVo2SCsrbFhKem1PS0RRM0tPTUR0Qk5Tbkc0RWRzbDJLUWlhZ2wyNDgwdjlq?=
 =?utf-8?B?QXAwWmJRRGhvZ29BSGROeVBRS3VKVFVOMXRyc1FyckN0cEkzUkVJcUcwMVBU?=
 =?utf-8?B?OHFUTEoxcHpjWDRmc3RMNGRFN0U1VitDZGo3WWd6cXJHczNNOHVpMTlCWVJJ?=
 =?utf-8?B?b2d5ZnN2QlVLRzZYcGduKy9WdUc3amd2dkNYMVZyQjVVR3gySWZvZUN3ZEVV?=
 =?utf-8?B?MmpiNzNNVTM0dVJKT2xxSVcxZ2hYUVVmeEdzUjdzbnltci9MRzMzQ1dSSFZM?=
 =?utf-8?B?Tlk1RCsvbWxpZEZCT0JCUGpNaEN2S3lKSDZHeXBidU1TK3RNTzNPeVhxYm85?=
 =?utf-8?B?RUdpYkh5TEc0UU5vdjltZ1AycmlENEJlQnlFTkxCK0N6YXVqZWp5MHE3Tkhu?=
 =?utf-8?B?TVFSNEs2elg2bkY5am5ZZ1ltalhVeDY4SzlmS0xidGNTRmtocWxBYVFESTNP?=
 =?utf-8?B?Y3IxSG9Xc2RmZzBuanJIN1dWL2p6VlludUgvZTJFMzhZdXpBbVRabklNeGtE?=
 =?utf-8?B?Q2NJOVVHTW9kSFZHSDRhSVJEWEZRaVdCVEM3dldTSy9kYldCaWU3SUovTzFx?=
 =?utf-8?B?aGU0U3hrT1I0T0xaemFWWm9sUkhPbUorV21rMEN5WEZNWlNhSFZOWHN1c0dD?=
 =?utf-8?B?amZLWDIzc3FpYUdGbkNXSDhSbk9mRmJacW9aUk9OQTdpRFZRNkwzNnNUcGZJ?=
 =?utf-8?B?NTY4MVJKbnMrM00wTWMvU2U0dUgxMklReUhtdDZoUU14cEFua1VxSmRGemZR?=
 =?utf-8?B?OFFhblNTNmtuV01BUGh6ZEVIRFp3SWdWL3J4SjJHZlZKRWxTZ2NqWDFXbnJZ?=
 =?utf-8?B?cW90aHR4QmVqeWJKU3hYVlRHZWNiblJlMXJQdi9NdXNGU2xkTUpwTmRQakQ1?=
 =?utf-8?B?RHNHVmQzWnlZZzhFUkpJc0pPaHJITGRGUjNjV0VsVVRPYitORzBnMW9rQSsz?=
 =?utf-8?B?NnZLNDl5R21SRm9YMjE4OXdZRmZ1bkQ2SGt3RCt6a1ZMWXI4UWY3L2ptYjI2?=
 =?utf-8?B?MkUyUStOVmN2L1lMNlc3a1IzZXQ3Ymx5YitvUktQTmxlYnVkM0tlZHhjbTYx?=
 =?utf-8?B?WUZ1TnQ0ZlF4WkFPRFNmWTJrSzNtY0ZndVBZZWtCZXE1Nm1ZdmpMcEsybGdP?=
 =?utf-8?B?aGFZa0Zkb2RzVWp5RXM0Y011ZnczS1d0RTluMDZQQm52SFNOdGkwVlVUd2hh?=
 =?utf-8?B?NmcxbC81Y2dHd21Uc3dQOGZxMVpydjNrM3dpVThiTWYvakQwbG1NWnFsQW1n?=
 =?utf-8?B?bytWNGFxdUttMi9MTS9MWWIyQlowZ2lPS0pOWnRQOXM1UWZMTXlQbGRMK0pG?=
 =?utf-8?B?UThMQTIxWUtxMlRtVjN2ZVUwcVlXNnBXbURFeUVVNE12eVRVWG80SHBtK1p3?=
 =?utf-8?B?dGlObVY2Rm53blVrYll0VEt0ZjQrVDZKOGkzTkwvcEZVOUJUU1dnMURoNFpY?=
 =?utf-8?B?cHNsNnlYV3ZybkY5RVpqWGxBbTZtTktFUmdyMUVMbE0rS2xsVGRweU9hSi9k?=
 =?utf-8?B?WE9rMDVMYlFYOGZQbVd3OW15TjhZL2xaWFFKdmFuYitkam5jZVZIVXNlZHpi?=
 =?utf-8?B?Nnk3c041bU0rUW5DZ3dnYWJrcllVOWViVGZKZGVsdmN3bEtBWWpVSmRHVk9J?=
 =?utf-8?B?cktXVHZvdjYyY0hzZklQL3IwdVI1SG9jME5SSFRDTmZLS3VGTUppc2FjMTV6?=
 =?utf-8?B?VGM0aEVDRk1KT0M1OGdMcjdPL1RjeU9lMjlrZFAxWUx2NE5yVHY1NWIzSGJX?=
 =?utf-8?B?cnRmY0poeDVUMTNXcmJvaUJhQmxQZlhUdnlKakM0T0xtN2lleE80L1N2MlAv?=
 =?utf-8?B?b1hBcFlyR1pNSWZmOFlpbmFtZ0FoMXh2WVlxckZQNzNMWmlsemNnL1NvUjh3?=
 =?utf-8?B?VC91RjlJajJKdGhBbmdVU09qWmV0SjUwQkgyTTJBdDQxYVA5a1djc20xb2hq?=
 =?utf-8?B?M2RaMHBkbzdXeHBCZzY4N1VMY2krOHBHbDRJdWY1dnM0RlRZQklJRWlDVDRq?=
 =?utf-8?B?ZjVHYWpGYWxiQWNweDlpcGFXNHIreE5wMmZkdk12NEtDNGpwL3JMV1IvcW9H?=
 =?utf-8?B?Vm10RWpXbXgxMXY3WVhvaGE3bEYxS0JnUDFWK0xXc0g5NlUzNWhlUT09?=
X-Exchange-RoutingPolicyChecked: IlAGRbhwmGqhAVITz2CdQvVogDfEPwxWLvB/KawOfZgbXEDofUXiPS3gQSmd2fbHElGUhuYpBUUnoSYQ7DQtNywnmfXYBesCUTla48r96TAg9q9RAm5poPrE/lF6KlDwidzCIq64C/h/236nohYbTTSHZeNe01rIjG7n7aZJIo6qF5RamnfzISqUonq7VSgFtOo5KsXy+AemFu8tDHd1yaMhqSz6k+N/gwF0UPvYxg0qByUZlzYXJ2Y56WM8nwUko1cLv1Sfefmus+TzBZexEnvTD/xmTgTiY18HVhRTdl65fLQr3PP3WZh1LCR2uA+YmzlBj8Rlmcm5HHXfH2qsew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fa8116-af99-4a16-cf20-08df49565fd8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:39:03.5518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plAuwaK4cKLZMTVDvgeFy/TUeOCtxQfGumyBP2viawdrRlCG+b59juTqvJbTUENz3lAOItXN8NQOnPtA3ZyOQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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


On 23-11-2026 16:40, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: 22 November 2026 13:58
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
>> Matthew <matthew.brost@intel.com>
>> Subject: Re: [PATCH V2 1/3] drm/xe/vram: add decay-based reinstatement of
>> soft-offlined VRAM pages
>>
>>
>> On 12-11-2026 18:13, Tejas Upadhyay wrote:
>>> The existing bad-page flow soft-offlines a VRAM page on the first HW
>>> report and promotes it to a permanent (hard) retirement on the second
>>> report at the same address. Once soft-offlined a page stays offline
>>> forever, which over-punishes transient DBE errors: a single hit caused
>>> by a one-off environmental disturbance keeps the page reserved until
>>> the next reboot / probe.
>>>
>>> This change adds a per VRAM-manager decay timer so that a
>>> SOFT-offlined page is automatically reinstated after the configured
>>> decay window (default 24 hours) of no further reports at that address.
>>> HARD-offlined pages continue to be permanent.
>>>
>>> Also adds the xe_page_offline_mode enum (SOFT/HARD) and per-entry
>> mode
>>> tracking with SOFT->HARD promotion on second hit at the same address.
>>>
>>> Configuration via configfs bad_page_decay_secs (default 86400, 0 disables).
>>>
>>> IGT coverage:
>>> https://patchwork.freedesktop.org/patch/765064/
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_configfs.c           | 55 +++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_configfs.h           |  1 +
>>>    drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 64
>> +++++++++++++++++++++-
>>>    drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 16 ++++++
>>>    4 files changed, 135 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>>> b/drivers/gpu/drm/xe/xe_configfs.c
>>> index 2ddd707a6dbd..306c4019aa58 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> @@ -305,6 +305,7 @@ struct xe_config_group_device {
>>>    		bool enable_psmi;
>>>    		bool enable_multi_queue;
>>>    		bool disable_vram_page_offline;
>>> +		u32 bad_page_decay_secs;
>>>    		struct {
>>>    			unsigned int max_vfs;
>>>    			bool admin_only_pf;
>>> @@ -327,6 +328,7 @@ static const struct xe_config_device device_defaults
>> = {
>>>    	.enable_psmi = false,
>>>    	.enable_multi_queue = true,
>>>    	.disable_vram_page_offline = false,
>>> +	.bad_page_decay_secs = 24 * 60 * 60,
>>>    	.sriov = {
>>>    		.max_vfs = XE_DEFAULT_MAX_VFS,
>>>    		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF, @@ -702,6
>> +704,36 @@
>>> static ssize_t disable_vram_page_offline_store(struct config_item *item,
>>>    	return len;
>>>    }
>>>
>>> +static ssize_t bad_page_decay_secs_show(struct config_item *item,
>>> +char *page) {
>>> +	struct xe_config_group_device *dev =
>>> +to_xe_config_group_device(item);
>>> +
>>> +	return sprintf(page, "%u\n", dev->config.bad_page_decay_secs); }
>>> +
>>> +static ssize_t bad_page_decay_secs_store(struct config_item *item,
>>> +					 const char *page, size_t len)
>>> +{
>>> +	struct xe_config_group_device *dev =
>> to_xe_config_group_device(item);
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	ret = kstrtou32(page, 0, &val);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (val > jiffies_to_msecs(MAX_JIFFY_OFFSET) / 1000)
>>> +		return -EINVAL;
>>> +
>>> +	guard(mutex)(&dev->lock);
>>> +	if (is_bound(dev))
>>> +		return -EBUSY;
>>> +
>>> +	dev->config.bad_page_decay_secs = val;
>>> +
>>> +	return len;
>>> +}
>>> +
>>>    static bool wa_bb_read_advance(bool dereference, char **p,
>>>    			       const char *append, size_t len,
>>>    			       size_t *max_size)
>>> @@ -943,6 +975,7 @@ CONFIGFS_ATTR(, enable_multi_queue);
>>>    CONFIGFS_ATTR(, migrate_ulls_period_ms);
>>>    CONFIGFS_ATTR(, enable_psmi);
>>>    CONFIGFS_ATTR(, disable_vram_page_offline);
>>> +CONFIGFS_ATTR(, bad_page_decay_secs);
>>>    CONFIGFS_ATTR(, engines_allowed);
>>>    CONFIGFS_ATTR(, gt_types_allowed);
>>>    CONFIGFS_ATTR(, survivability_mode); @@ -954,6 +987,7 @@ static
>>> struct configfs_attribute *xe_config_device_attrs[] = {
>>>    	&attr_migrate_ulls_period_ms,
>>>    	&attr_enable_psmi,
>>>    	&attr_disable_vram_page_offline,
>>> +	&attr_bad_page_decay_secs,
>>>    	&attr_engines_allowed,
>>>    	&attr_gt_types_allowed,
>>>    	&attr_survivability_mode,
>>> @@ -1239,6 +1273,7 @@ static void dump_custom_dev_config(struct
>> pci_dev *pdev,
>>>    	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>>>    	PRI_CUSTOM_ATTR("%d", enable_psmi);
>>>    	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
>>> +	PRI_CUSTOM_ATTR("%u", bad_page_decay_secs);
>>>    	PRI_CUSTOM_ATTR("%d", survivability_mode);
>>>    	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>>>
>>> @@ -1427,6 +1462,26 @@ bool
>> xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
>>>    	return ret;
>>>    }
>>>
>>> +/**
>>> + * xe_configfs_get_bad_page_decay_secs - get configfs
>>> +bad_page_decay_secs setting
>>> + * @pdev: pci device
>>> + *
>>> + * Return: bad_page_decay_secs setting in configfs  */
>>> +u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev) {
>>> +	struct xe_config_group_device *dev =
>> find_xe_config_group_device(pdev);
>>> +	u32 ret;
>>> +
>>> +	if (!dev)
>>> +		return device_defaults.bad_page_decay_secs;
>>> +
>>> +	ret = dev->config.bad_page_decay_secs;
>>> +	config_group_put(&dev->group);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    /**
>>>     * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb
>> setting
>>>     * @pdev: pci device
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>>> b/drivers/gpu/drm/xe/xe_configfs.h
>>> index d726800de26a..231148dc3338 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>>> @@ -25,6 +25,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev
>> *pdev);
>>>    bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
>>>    u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
>>>    bool xe_configfs_get_disable_vram_page_offline(struct pci_dev
>>> *pdev);
>>> +u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev);
>>>    u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>>>    				       enum xe_engine_class class,
>>>    				       const u32 **cs);
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index 36d47de8b11b..ed0ca5f2b144 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -355,6 +355,51 @@ static const struct ttm_resource_manager_func
>> xe_ttm_vram_mgr_func = {
>>>    	.debug	= xe_ttm_vram_mgr_debug
>>>    };
>>>
>>> +static unsigned long xe_ttm_vram_decay_gc_period(struct
>>> +xe_ttm_vram_mgr *mgr) {
>>> +	unsigned long period = mgr->decay_interval_jiffies / 8;
>>> +
>>> +	if (period < msecs_to_jiffies(60 * 1000))
>>> +		period = msecs_to_jiffies(60 * 1000);
>>> +	return period;
>>> +}
>>> +
>>> +static void xe_ttm_vram_decay_gc_worker(struct work_struct *work) {
>>> +	struct xe_ttm_vram_mgr *mgr =
>> container_of(to_delayed_work(work),
>>> +						   struct xe_ttm_vram_mgr,
>>> +						   decay_gc_work);
>>> +	struct xe_ttm_vram_offline_resource *pos, *n;
>>> +	struct xe_device *xe = ttm_to_xe_device(mgr->manager.bdev);
>>> +	unsigned long now = jiffies;
>>> +	unsigned long decay;
>>> +
>>> +	mutex_lock(&mgr->lock);
>>> +	decay = mgr->decay_interval_jiffies;
>>> +	if (!decay)
>>> +		goto reschedule;
>>> +
>>> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link)
>> {
>>> +		if (pos->mode != XE_PAGE_OFFLINE_SOFT)
>>> +			continue;
>>> +		if (!time_after(now, pos->last_seen + decay))
>>> +			continue;
>>> +
>>> +		list_del(&pos->offlined_link);
>>> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos-
>>> used_visible_size);
>>> +		--mgr->n_offlined_pages;
>>> +		drm_info(&xe->drm,
>>> +			 "decay: reinstated soft-offlined page 0x%llx\n",
>>> +			 pos->addr);
>>> +		kfree(pos);
>>> +	}
>>> +
>>> +reschedule:
>>> +	schedule_delayed_work(&mgr->decay_gc_work,
>>> +			      xe_ttm_vram_decay_gc_period(mgr));
>>> +	mutex_unlock(&mgr->lock);
>>> +}
>>> +
>>>    static const struct dmem_cgroup_ops xe_ttm_vram_mgr_dmem_ops;
>>>
>>>    static int xe_ttm_vram_mgr_dmem_reclaim(struct
>>> dmem_cgroup_pool_state *pool, @@ -415,6 +460,8 @@ static void
>> xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>>>    	struct xe_ttm_vram_mgr *mgr = arg;
>>>    	struct ttm_resource_manager *man = &mgr->manager;
>>>
>>> +	cancel_delayed_work_sync(&mgr->decay_gc_work);
>>> +
>>>    	mutex_lock(&mgr->lock);
>>>    	xe_ttm_vram_free_bad_pages(mgr);
>>>    	mutex_unlock(&mgr->lock);
>>> @@ -438,6 +485,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe,
>> struct xe_ttm_vram_mgr *mgr,
>>>    	struct ttm_resource_manager *man = &mgr->manager;
>>>    	struct dmem_cgroup_region *cg;
>>>    	const char *name;
>>> +	u32 decay_secs;
>>>    	int err;
>>>
>>>    	man->func = &xe_ttm_vram_mgr_func;
>>> @@ -447,6 +495,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe,
>> struct xe_ttm_vram_mgr *mgr,
>>>    		return err;
>>>    	INIT_LIST_HEAD(&mgr->offlined_pages);
>>>    	INIT_LIST_HEAD(&mgr->queued_pages);
>>> +	INIT_DELAYED_WORK(&mgr->decay_gc_work,
>> xe_ttm_vram_decay_gc_worker);
>>> +	decay_secs = xe_configfs_get_bad_page_decay_secs(to_pci_dev(xe-
>>> drm.dev));
>>> +	mgr->decay_interval_jiffies = secs_to_jiffies(decay_secs);
>>>    	mgr->default_page_size = default_page_size;
>>>    	mgr->visible_size = io_size;
>>>    	mgr->visible_avail = io_size;
>>> @@ -725,8 +776,12 @@ static bool
>> xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
>>>    	lockdep_assert_held(&mgr->lock);
>>>
>>>    	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
>>> -		if (pos->addr == addr)
>>> +		if (pos->addr == addr) {
>>> +			if (pos->mode == XE_PAGE_OFFLINE_SOFT)
>>> +				pos->mode = XE_PAGE_OFFLINE_HARD;
>>> +			pos->last_seen = jiffies;
>>>    			return true;
>>> +		}
>>
>> Can we mark the entry HARD if the same address is found here too? A second
>> report can arrive before the BO releases the page. The entry stays SOFT so the
>> worker can later return a firmware-retired page to the allocator.
> Thanks for commenting,  for queued pages we never run instantiate decay worker as kernel was never able to even soft offline them, no point of re-instantiate.


LGTM.
Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>


> Tejas
>> Arvind
>>
>>>    	}
>>>
>>>    	list_for_each_entry(pos, &mgr->queued_pages, queued_link) { @@
>>> -804,6 +859,8 @@ static int xe_ttm_vram_reserve_page_at_addr(struct
>> xe_device *xe, u64 addr,
>>>    		INIT_LIST_HEAD(&nentry->blocks);
>>>    		nentry->status = XE_PAGE_RESERVE_PENDING;
>>>    		nentry->addr = addr;
>>> +		nentry->mode = XE_PAGE_OFFLINE_SOFT;
>>> +		nentry->last_seen = jiffies;
>>>
>>>    		if (block) {
>>>    			pbo = xe_ttm_vram_block_owner_get(xe, block); @@
>> -843,6 +900,11
>>> @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64
>> addr,
>>>    			}
>>>    			++vram_mgr->n_offlined_pages;
>>>    			list_add(&nentry->offlined_link, &vram_mgr-
>>> offlined_pages);
>>> +			if (vram_mgr->decay_interval_jiffies &&
>>> +			    !delayed_work_pending(&vram_mgr-
>>> decay_gc_work)) {
>>> +				schedule_delayed_work(&vram_mgr-
>>> decay_gc_work,
>>> +
>> xe_ttm_vram_decay_gc_period(vram_mgr));
>>> +			}
>>>    			return ret;
>>>    		}
>>>    	}
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> index 4a2cd27a5b61..0a6d8f8c2aa8 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> @@ -7,8 +7,16 @@
>>>    #define _XE_TTM_VRAM_MGR_TYPES_H_
>>>
>>>    #include <linux/gpu_buddy.h>
>>> +#include <linux/workqueue.h>
>>>    #include <drm/ttm/ttm_device.h>
>>>
>>> +#define XE_BAD_PAGE_DECAY_SECS_DEFAULT	(24 * 60 * 60)
>>> +
>>> +enum xe_page_offline_mode {
>>> +	XE_PAGE_OFFLINE_SOFT = 0,
>>> +	XE_PAGE_OFFLINE_HARD,
>>> +};
>>> +
>>>    /**
>>>     * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
>>>     *
>>> @@ -37,6 +45,10 @@ struct xe_ttm_vram_mgr {
>>>    	struct mutex lock;
>>>    	/** @mem_type: The TTM memory type */
>>>    	u32 mem_type;
>>> +	/** @decay_gc_work: reinstates expired soft-offlined pages */
>>> +	struct delayed_work decay_gc_work;
>>> +	/** @decay_interval_jiffies: soft-offline decay interval */
>>> +	unsigned long decay_interval_jiffies;
>>>    };
>>>
>>>    /**
>>> @@ -79,6 +91,10 @@ struct xe_ttm_vram_offline_resource {
>>>    	u64 addr;
>>>    	/** @status: buddy reservation status */
>>>    	enum xe_page_reserve_status status;
>>> +	/** @mode: soft or hard offline mode */
>>> +	enum xe_page_offline_mode mode;
>>> +	/** @last_seen: most recent hardware report time */
>>> +	unsigned long last_seen;
>>>    };
>>>
>>>    #endif
