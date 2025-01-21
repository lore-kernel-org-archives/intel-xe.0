Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD59C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 22:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6609D10E279;
	Tue, 21 Jan 2025 22:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeJxxPKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AABA10E279
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 22:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737497324; x=1769033324;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ObvnKisB41UeTGbkW/JN/BWO0I7o5tGKRCeVghulgyI=;
 b=FeJxxPKtaPe1nv0ENbKXk7jRXcdTqQVoKh8GxHWjbZ4WFH6FQNzvGnXV
 x7ZKOJwh/BVB+7xl9OsUr/Mx8AgTdNJakf3efQAfQ94uvbTyqrQ4ARS+K
 INorFG353690zqwiKtnZbZ40Y8id7kWHmMIut3jEdVXIVha/sZQsS4IKD
 E/dmy0qXAzpF83b6WPAOVdeBI3a4nEX/zvrX2g8RUsO2yfW5sLpO5abqe
 CQ3HXSwGxjeufiChu4Idy3yhz9nGt4epkhd5peCZ1hB46QMB7tTvUBqgQ
 Z77Q85PcVMEevSl425S1lYVJN0rQRLGFN6dv0e+w2xT4dIApr3GEPGizT Q==;
X-CSE-ConnectionGUID: mQhW3IVnRQSIgFklXOPrgA==
X-CSE-MsgGUID: tg7H97gPTxecZGME3PW+pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49350994"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49350994"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:08:43 -0800
X-CSE-ConnectionGUID: 2s2xE9PERpGjFXML4zX2VQ==
X-CSE-MsgGUID: yy8fIHqSTC2jDI3FUqyBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="106850982"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 14:08:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 14:08:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 14:08:43 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 14:08:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF+P/FHbtOcpUFj/HWNNOgn1xQLmhzeq0n8JmbjsELoubwekjq4ZTsxUT1MPRlOQwFl1erQLzYkWFz3LWBbz68bpzytCRaSzPJvvpu8oiPx4PjG/lNOpLRgr5vndveaEIsWToFSIsz2pZjx5vgrdCtWsocQILk1nf03B+uCpT0HO6OskLACGfjEhcCJmgGgbiw4TuNEL12GXXAUqi+MT3v8Oo2cDMHRvzwboJKqDu4ue2tmrLVP2oDNXvOeKsvbzNxfmLg4RvSzof5Ped0lvRealjqFmr4VmKx9PKZ/081Onw1xL+Xvbg9AGfZK9Jb/r1/i4wd6Ow/zOVogV8hAWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XO/3/Jrap8lmosKOGMyaasTooP6Kj/3ttwlTS08MDI=;
 b=TQVuQ9DfjapYmqMO1rFP3NT3EOgsBs7GuXF7TxfGLUsSN0ry+WcPti4JxGTjcjVhM5KpWZWr7XzD6+drDJ9o1p/W6Mhl6IOYE9yck3B97j4qmzV4IXf4gy+6oSuyx+ao9/4NhKNSu6jj6WfnshL3D4JUrJ0zaZm6WrcGPkkZXdTnn5wfsk41KsNcGEaRd0Q/Dyv6NISp0o3OkP6MJIvuctXRbaacsqihWFrauOlncmmwkiPu7OUK26w1I4gUan/6Qc+/Ry81iYHT5S2eCcEP1iRz66uusYpea0mu3h7IkUcXtZVAqvMzNE+EgAak1SGfQAkZyFMWgmb53QnrVePYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 22:07:59 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8356.017; Tue, 21 Jan 2025
 22:07:59 +0000
Message-ID: <e5c9b15f-b465-4c1a-b99c-39f98136fd4f@intel.com>
Date: Tue, 21 Jan 2025 14:08:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [topic/xe-for-ci] drm/xe/ptl: Update GuC version for PTL
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250116183144.378985-1-vinay.belgaumkar@intel.com>
 <349ff52f-94d2-4e14-b0cc-2847312877cb@intel.com>
Content-Language: en-US
In-Reply-To: <349ff52f-94d2-4e14-b0cc-2847312877cb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:a03:338::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf8bc81-7ae6-4155-e79f-08dd3a68113f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWFGa0NPRW8yajhzQWxFMTVCdkFSem00dmpBK1RBWFpJczFNRytMTXh4c3d2?=
 =?utf-8?B?Mnk0VlBhUjVxamRWb2tuUnlQRUJRbncyZGIwTnRhRVc4TFowRlVEazNmQzVE?=
 =?utf-8?B?a0E5d0hOdHFTd2VCL1BzQ1pZN1VRci9FeG9tQTdRR1hsQjF6QzFGWWF0VGtr?=
 =?utf-8?B?SnFOYnIyRjdCUGpEVFl5VGFibTIyTll6bGU0ZjUxNDVONFhkYnMxOHdtU0pl?=
 =?utf-8?B?eVc0NVV6TnF6eTdXRGR6dDhJelA3NXFIYjJ3aWY0WUw2SFMweXBlLzQzUHhC?=
 =?utf-8?B?akZEUGFDTEg1UVNlR1ZqS0tpQ3dEQWhBMDREVDZKdUJNbjBSdmoxQ3lGQ2Vt?=
 =?utf-8?B?Z0lJKzM4TUpiL2s1UEd2VFB0RFkraFVVTU1YSlZqckZhczh6VFBNOUtieHhy?=
 =?utf-8?B?WlExd2ZySnQvZVg3Z1RNOG85Y0M4ajROVHAzYjFWL3hocFBzbFZ4VVphWjZz?=
 =?utf-8?B?TDloZG9sQi8zWWJ0S2c0cnBwZmF0YlhjdVI4L2lQYkJvOUlNSnh1SFZVZDQw?=
 =?utf-8?B?THlwK1lFS0pVZzA5ZGxWNi9LQ3ZyUDZyYkkxN3pvdlhPaHRFNmRQV2ZuZjc0?=
 =?utf-8?B?WEJ4Zm1JMVlpdXpwQWZKRSsybk5rSFQzdzhXdUxjZnZUUW0weXlHU3BvMll6?=
 =?utf-8?B?NVVxenZwV1I0aUZIY0NIOEt1ZUg4SnFhRzB3c2J6bDVpRk1aNW1QN1hBT1Fw?=
 =?utf-8?B?bVo3NThTTDVlb0dtNDA3eFJqQkxCWnpPZXl2Y0FGd2NjR1JadElZemdaS2FY?=
 =?utf-8?B?ZnR3eHRQVERMbjQzeXpPR2E4dS9WWnNQWjFEYy90dUVWdW9mOXl3RnU1ZEpL?=
 =?utf-8?B?Q3lzL0NxeVVmb01yVkpNMUYyNGtZT3dtMnBpTEJGS0RySTZ2UE9ITzlZUVNv?=
 =?utf-8?B?T2t5YnRhWnZxbWlmeldyMERrS1hkZERQdTduQURiVWcwTHBpT05WNUJoY0pB?=
 =?utf-8?B?Ty9LYW5rdERrY1cyQi9CU00weVpCRXZOZ00yM1JGdVdOM0hpVG1Uc1Nsci83?=
 =?utf-8?B?SHNNWitFaW9oZlp5ZjRBVGJpaEVuWkhTWFVqN1AybHB6dUF5WWp3Rk05R3lO?=
 =?utf-8?B?aGZQZzkyUEQ2dmVmMEUyVWVHaFp3Z3FKdnMrclhrT1J0aktLVGc0M09qemJN?=
 =?utf-8?B?RmMwNTJXbXIrZTkvWm1BRzNIV0xXQUVNQXZUVit6V1ErazVrSDV1Mk1FUU1w?=
 =?utf-8?B?N293TXFnb2pSTTRVdnlBdGVoVllxWmVLY2p5RDFZY3htdjRlOUoxQ1JDL3VE?=
 =?utf-8?B?TEZ6YzZmZXV0L2xrQ3hyM0xSS2pFQjZ1cjhzTzVaWnRCbmd0UHlaeUY1Y3gy?=
 =?utf-8?B?bUNQN3A4VzN1eDR3LzlWSmZ5dnB4N3dNTkJKMjhkZ1gyUW41alFVUVhPTVlE?=
 =?utf-8?B?M2NMTkNyS1lBZ1drVEQzYnRwb1RDUUxPS01XZ2NCaXl3ZzlGcFg3OCtCM2o3?=
 =?utf-8?B?c0x1OGlwdit6TkErRmlIaEM3SEhsQ0creHpGMWE5RGQzTGkwVURwYXR0MkYv?=
 =?utf-8?B?d0J1U1RWVDFSTVptNmttRmhiMFJOVUJhczNmazVOaU9OeDhWcXQvRzFhTktH?=
 =?utf-8?B?cHVwV1VRMm9QK2NQWnJDUFBOQjcxaDgzSVBibER5N3A5WGRZVzZRdHI1REN4?=
 =?utf-8?B?TnRWeUxXcWNzMDBNUDJzL0hJVXdVZ3RuRVNid0YzejdjSXdrVElsZjBXM1Uy?=
 =?utf-8?B?QWFtQXl2MWlya01jNXVlamF3cnY0V0RwSjVpSnluT0wwdU91TU1LeXBHbjd6?=
 =?utf-8?B?T0NjWUQ3ZFpsWTZuTWc4b2RTVm1DT0s5RGc2UzM2SFZucjM2U2IrY0docjBT?=
 =?utf-8?B?dytLa25MZFVOdVFnNXRIVFMrOFlMRkhuY1laMGlzdGJ4K2RaTmNuSURoTFlW?=
 =?utf-8?Q?eCEyHd+SDG5vd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmZWL2s4V1JtUXVZOEhxU1p1cjVTNG5OUTVwZnZaSTZpZnpjWmhDeStjckl1?=
 =?utf-8?B?QUZxRWJpVzRrMzVSZ2JuSUdoL1VpVW1wZnNIQUJFMW9ESHFxc3RUVTBsZjc5?=
 =?utf-8?B?MnJpZDVZQXdXWlJQVXVYc1ZXUjZZdmRxN2UydHp5NHY3amNtVG8xUlU4bzlC?=
 =?utf-8?B?US8za1NXTTQ3a0lUTndHRVo5VE5jN1NBT0hMakFScDE3bHhNNWwxR24rWk1B?=
 =?utf-8?B?ejlvdXFESG56Y3BIdUc0VWlXYWZEUkZxaWRqZTBtYjBjb2YxTUIvSkJ6UFVD?=
 =?utf-8?B?b3pJTW1VMXZUcmFHRGpYb2duMHFiTEdlYUh4K2hZNEhLamh2WjdFdkNCUVBV?=
 =?utf-8?B?U2RndFRoQzNpVVY3akRKck9lNjVPcWNwdDhCd0RyVWxpMUY2TlFSY01GTjhE?=
 =?utf-8?B?MU9rQ1JFOU55NklUa0JIa2FBWksyamQ2N0tTRTdXNG9BUXRVajlMQzVpTjBC?=
 =?utf-8?B?aVcyRzZWc0tKZGEyMEVSb1ZTSWRXRWVKYjRWemhvcVdhdHllNmR1WFcrNWM1?=
 =?utf-8?B?YnhoTzRXMVBabU5wbWJ5eWZKZG92aldaOXArY3lSVFBDM0plMGdEOGFTait4?=
 =?utf-8?B?anB1MklIYXd0c3BEREl6MTB6RzV1S25ZVVR6ek11azRVSFZLNmZWT09vanBT?=
 =?utf-8?B?VE9IeVowTTcxa0VsUXBFaUVlV1pwZ1QxYUpMZEdBaUp3Z2NBa1Y2alp6eWxJ?=
 =?utf-8?B?bGFDaE1NTXZqdTM4L1lXUGVWN3lrZ1VtZzlOSVJQbkkvN2dWU09oWS8rdXM1?=
 =?utf-8?B?bEhjRTBXZnZXbXFWUmdDRGxuQll6bWdGWkZmTktQdGpsM2QrK1d4TXY0Sk8r?=
 =?utf-8?B?ZzFVTllnaVdrVE9WbnVSOGpsSlB3QzRnc1d2RC9mZ3JveUUwY0V6NW9XMDJ5?=
 =?utf-8?B?ZnBLbHF1emZ0aW51WWhZcE5PdEt1QlFOdUZGdzZBeVNXTG0weEthTDVPTmRZ?=
 =?utf-8?B?Y084TWpvNnY0Ni9mTzB3amlIVGhHNEoybGNVZFFNN2htVWo5T0FacUpZQUxF?=
 =?utf-8?B?NnVWd1hCUWwzU0V3VUY2cEJXWlhTdGpyd05YWUtQZ3hCN2tnUEVCVXQzcFBW?=
 =?utf-8?B?UFIzY3NkWFFZMVA1cmd3bGFLdVR0Wm5qazZxaUxycE40ZXh1bkNxQzJGZ0Rt?=
 =?utf-8?B?dU1yRFEwRG9qbnBoNGo5S2pmVFRILzN1UmtPQy9aUE9sQm9XL3k1d1JDdURl?=
 =?utf-8?B?R1Z6b2h0eTRyVnIwUUxocVIzRW9rSEFzcGlyK242TE9RNk1LNWFwVEpOTFk5?=
 =?utf-8?B?emp0ZE9Lb0R3ZlVSYTJIS3RRNm1LZFNuenVKNWRYUCtMUXNoQ3RCZFIyVXJx?=
 =?utf-8?B?bXRQdXY0WUFrNkluU1lodjh4Q1dyS2d1Tk01VHZycEcrV1Ivdm9icEVMVDZl?=
 =?utf-8?B?SUQwcUxkN1NIVzRiRElTSllnc3FHdFhIZTBrYndLTUdiQ2tIRThLNndkTDFN?=
 =?utf-8?B?UjdNYXg3STg4UFQ4aHdQaEtzdlk2Ymw4V1ZKcTlXWitZSk11UWJFdHZQZUxQ?=
 =?utf-8?B?TUEySWhkRFh2akxjeVFsSzVremtEU2lJS2tQRk5BS0I4VmlTQThWdHB3cGRZ?=
 =?utf-8?B?cXFzSE51N3ZXOVhQQ05uQy9ONHQ0dE81NXhydnU0OXJyYW43TUs1c2Y0UVQ3?=
 =?utf-8?B?L3h3QjQxQ1F3Q1ZhdCtxNTN1WUF3RFlyRTY5Q1dnZFBMWGVTRnNWRm4rRUhG?=
 =?utf-8?B?M1Mzb1Q4N012V2lvMkFwZ1cxcmJPTlpjTVRCVEJKOFVOaVl5SHFiSEV4eEs4?=
 =?utf-8?B?T2NGUVFsMCt6NG9WeDJlb0w0L0RYTldINE9nWWRjZkpvbndmS3NrR1JvUHpa?=
 =?utf-8?B?SEc3OGdGai82clVtM0ZRNXpwbDh1QXlOY0lxNlFVWWxQVmVZNENPSnM5RlZS?=
 =?utf-8?B?QldSQ0pBaWlYdjdEalNXeDBJYXFNS1ZHckNvUEJNc3F6OEt1aCsrNUVtWWZX?=
 =?utf-8?B?aWc5SEZRYXpDZGlBbzZRYXhiR0c1Y0RzMGxOQXFoa1FxYUlVdStZbDlzRXVt?=
 =?utf-8?B?UFl3b1VSVHE4dVNJQU1aTFFrTTVhWWNLSERnSjVBWmtmbDBKRVZjam9hQzk2?=
 =?utf-8?B?VHQ3L0RGS21PUm1pU1BPSVJLSnNXRU1BSWdXeUF5UC8vTDFQV3B2UmgvVDMw?=
 =?utf-8?B?cGRhNTQrTm9LdjJrbnNOallSUHljcjRjenhzWlc2ajR2dUI2UllPTEZZbm9I?=
 =?utf-8?Q?nHV2YY3NHYqRQUQFi+br5W8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf8bc81-7ae6-4155-e79f-08dd3a68113f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 22:07:59.8352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Snn4d8SYaclegNnOusNC35r5DAGJI2gpucVqkLt29vn4Wb20FIRsR7Gkq1SJXc6wn43LoQMTDy/HetLBukWY3+Lo0Beat+NLOSPi4IRBxCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
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




On 1/17/2025 1:21 PM, Daniele Ceraolo Spurio wrote:
>
>
>
> On 1/16/2025 10:31 AM, Vinay Belgaumkar wrote:
>> Move to GuC 70.38.1.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele

Pushed to the xe-for-CI branch (squashed into the original FW definition 
patch).

Daniele

>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 9c14b0adad0c..18e06ee9e23f 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -107,7 +107,7 @@ struct fw_blobs_by_type {
>>   };
>>     #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, 
>> major_ver)            \
>> -    fw_def(PANTHERLAKE,    mmp_ver(xe,    guc,    ptl,    70, 36, 
>> 0))    \
>> +    fw_def(PANTHERLAKE,    mmp_ver(xe,    guc,    ptl,    70, 38, 
>> 1))    \
>>       fw_def(BATTLEMAGE,    major_ver(xe,    guc,    bmg,    70, 29, 
>> 2))    \
>>       fw_def(LUNARLAKE,    major_ver(xe,    guc,    lnl,    70, 29, 
>> 2))    \
>>       fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl, 70, 29, 
>> 2))    \
>

