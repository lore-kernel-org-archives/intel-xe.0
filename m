Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F3606A331
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bvUtYvZh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=LhrC3vLv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCA610E564;
	Fri, 27 Nov 2026 09:47:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66B1112902
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795772839; x=1827308839;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wt/j4BD0Of3pur5Kpd+yEsdGI4RdH1xeCqU4sDAU3j8=;
 b=bvUtYvZh4TsqIQWZHWZTiDOZHjUkZct0X6JpspZBo7LA03FeOij992y4
 O6+D7FsD22VlOdi94fXzYp1v/vxIOq0i8wJt10+znTTrAFXn/lwLrEhr+
 Lypr+nk2XiGMATMUzZKBOBNcqI5zzBBtOLwhPJtFMTHtOdMchy8SJoQsB
 c4SN4aNdcgDv930j+yJz4+mjKZc6q3jJLqfhWLltMt7M9AgP1kCMJBpvx
 Cviz2QeBCWMm59f5gMyM75onBTR/rdB7sR/ztjB4JmhHFHIgL3c3WKste
 NGuutPyRbg1uhdz63ZoTrNY/D8VtB1qimGPrruWNnZ7ow0AmeeiMEeaUd A==;
X-CSE-ConnectionGUID: kGyBJ5zpSeqFNxLPFNmilg==
X-CSE-MsgGUID: AmE0C4yfTOGD6Sth9hlLzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4732571"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4732571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:47:18 -0800
X-CSE-ConnectionGUID: BRiWv7KcQnyzkWHdcDjtAA==
X-CSE-MsgGUID: fO5LHV1GT8aPl4bel0VAFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12665380"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:47:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 01:47:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 01:47:18 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 01:47:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymg+hnwoKNeXCw+gCeWDpRvXONkNU4qU/i7r4/evISXUaN4Jj1sJlOsjhguTvWv+AaJkQOrCpO9DqaQtaILYsGFE/UiXUmbLU2NoToPxMqCBCQptEfOJRVcdrKe7P4F4UV7XrpcTMIH51dhQjSS13yT0uuuZkQT5i2AfR6jIOJEqmZg7ykxq4L/5UWPAHpzTcTSQAYm/p2QJsISlFq5W5Q1PcIZxvZ9QuSVy14xoX1emP5FGGJ0w0hIO/691xoCUwLeRhsuv3F4pmcWHlQbTcrkuyNogSkam9v62832O3G7sbGb3Zq59dion05j0vutq5BuXuV1Pwy9C2bFz4TRN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ/Ad4dh9zPxrCyWmynDkQ7CNOQaxsRHCBWQhzfYEdA=;
 b=BVIIsosU4Iyf5Ycz2DAhOW2X0LoOIaP+EsVEwFv1ZvDxn+YdORPdgXtQ8lSpFNYNR2ISGzj670EkNcdcb3hAI/kk3glBVgGqyJj/Ud6kcX9Ic4+vQEonyP6SASXcloyu8Toy0391UOXldZw98G+/WTjf3V3wDpT6xyq35Slyt3T7fen8uCDNh3HAup7IeP1U8e/evcwSSMPWlhGvFPsNOzXZy7KmPwqwnF+EKoO7VvXZQbbF91xfpfBMzo6RiVlELs6/uhDvLz4chODCwc03grpnehX7lATexSDqRUJRMWMLstzPWoxaO4oqlEZmBEymTlBNLvSsAtzxSCCm3O9r3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ/Ad4dh9zPxrCyWmynDkQ7CNOQaxsRHCBWQhzfYEdA=;
 b=LhrC3vLvm/eNxTq/x8Z92TF7pcBAJrMVBm6tMlAhXcdAnA7fxKxnidpSpyCIytyyuKdAaeUmpKtWCKe5s0WmCSl8fM337/2MgWO0DysaoIzK/M1Oqo2obrJrDfFOScOyBiegb/jBMG429hciw5HdOUcd9yRSyCeVsC/MDOoBSN4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 09:47:10 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Fri, 27 Nov 2026
 09:47:10 +0000
Date: Fri, 27 Nov 2026 10:47:06 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>, <raag.jadav@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/guc: Tear down exec queues on VF FLR prepare
Message-ID: <20261127094706.apy5mipgzqowmokt@intel.com>
References: <20261125080621.599255-1-lukasz.laguna@intel.com>
 <20261125080621.599255-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261125080621.599255-2-lukasz.laguna@intel.com>
X-ClientProxiedBy: DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: e57bc140-9fa6-4bbb-fbb5-08df4c6b6824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|261009223027099003|18002099003|22082099003|10067099003|11063799006|261022075727099003|261021123027099003|261021121427099003|261026121527099003|56012099006|261102123227099003;
X-Microsoft-Antispam-Message-Info: E6MSMyhySFMpNoIKrjCXyhUCziU78uJZY16CSzFbWdq1NoaEsxBznOKnGKeU3vdSHVJqJjUmUbmMHAkS13nx7ustdCGe4mblXtgZTvAecd/l70vVuf6A/nOHhlOBGBYo96moF6cnfPQUg0TYgG6aPHn6+MasqFlTEAWPrCHTrOdiHpHBLtBXEGYaHJeWTSx9aerLENBFKvIZdYgfcn9ySvE3BiODgLq3cqaBBwpKAvtz7j3nMwkmED3i/DFK9fuvLCpe85+WP7YFoJjPxiobK1rWRYa3M8ZIeqLOMso162+UU42bjcdtamUGs6fZEYvGPTSO+h83nf21kR/GeV+jJD1g1WdNvqJ3rIVvQ5moIshx1dV+KGeo+yvy56FYMFngxYWCo1mqGsy6VtNg8b9aqPEHWylElViMAuuUyxTU3ToEz0/6oJ/tQn5E7roMamSdnXM+EGflVE48zMznLyDlpI4VtGFek8y2jCvIE72Asym5bL6Ta2MNHHpi1akHdsP7a1UxHyJxYzTHUFkIdItMEBorPjs/AA1m5DtoFDxQwV4hkLfPf6qhjeM9EhTDC4aJ1caSE5V3g9kWKXZdWGHRg3XdyQts/DFF7XhzgbCymaZtQAhQ5jWYgavbo7kMZm0ma8dwmsaoitSu9dm1sd7Kt3O2lGBTETNZqYLL6HuhsfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(261009223027099003)(18002099003)(22082099003)(10067099003)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(56012099006)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmhMU3JDT3ZRbDhkVHUrTlhtRmVLTDN0OVdmN1cxQzE1a0I4TWxpclFYQzVs?=
 =?utf-8?B?UEZyK0lwNS9zd1ZhYkFyWWdZR3dKV0s4YXhQT0x2RlZmVUkvQk9oeXVLREc1?=
 =?utf-8?B?ZzRES2x1Q2Y2VGcwYXNEdUFlcWlIQW5JdHQ5TGhTaFMvMkhYNmtZaWxJbkVo?=
 =?utf-8?B?ckxmSkc4L2tPeUpzOTE0dE5lNmRYWTUzbGs5NEhxTHp6WUx2VjIrZ3dROVVo?=
 =?utf-8?B?clF0ZXQ0MXRKOXA1QmVPWjJLd3FYWklBQXk4SXl5K1MzeVU0eThDR2lkc2t2?=
 =?utf-8?B?c0Nmc3ZlcUxJRWdObWVtZUtWQ2MvQitINCtaWldSdTNCazh3SGg1K2RUM1hU?=
 =?utf-8?B?eVVzc1BVK3hQSnBhSWZwZXBLRHhjY0NKWVVGaVJvL3dMZEN3S0pIRnFGdVpD?=
 =?utf-8?B?bTlaWVBVdUhnTEFHallZL2daR0xZaGVOL2hkam9oS3JmWTNDUytKZ2R1Qmpl?=
 =?utf-8?B?V2Y3NENLTFBsTlNNMkd2OC9ycHQyQlRaUkhSVlZod1hSNG5ldmJTb09NUjZt?=
 =?utf-8?B?Y2FkYmFNd295NjdUenBMQVNheTYzOFBVc1FmcTVwcXFOTE1IRElPMFluZUds?=
 =?utf-8?B?dUYzR1YwbE1ORG5ZZjRjcStjZndiRlVqWitPM0RpclBqYkRVNFE0N3Y3RmRx?=
 =?utf-8?B?Z1BCREd6Nm9xVCtxNXdFNy9NRjFENTBRUDd2NHZuTVVTcVpQYlRsOEhRUHRD?=
 =?utf-8?B?dmprU3dTaXBONG5LbTg3cXppeW1UZmtwNnNDaXlVekZoTGhhNy9QWmJGdUJN?=
 =?utf-8?B?SWF2c0gxN3llTlJ0NTVrczl5c3ZBMGNBc1pmSjhuUVZKeHdpd1RiK1Bxc2l0?=
 =?utf-8?B?ZkVoUEtTeUhFbklCR2N5dEpZOC9yVWF2c3ROK3hMcXAzSUNmNGttc1A5amxo?=
 =?utf-8?B?WFl3NktrV04vcS9UbjNXdXlvWHNFWmhiWjdxVm5UQmFINWQyanZkVUFjYVUv?=
 =?utf-8?B?TDNEUXFYUjZZVkUyZlVEK1kwc1BiRTZueG5kQU91cnBwSHBFTnFrSk4vaTZq?=
 =?utf-8?B?cTQvNzlPRy9WUVlWbmsvZ1FCS0Q4MVJZQlNqVDB3ZU9HK01FTHZvSXovcXBI?=
 =?utf-8?B?d0l3OUEydE1nUGpZTGxYbzE3UDBKdVg4T1h5dDMrM3NkbitWblNDNldCUVI0?=
 =?utf-8?B?ZEhjV2d6Y2MyclZDZFhELzV1NGp0d3FtN3RiTVZudzZVSXptSnAvTkVpNFJs?=
 =?utf-8?B?ZlpxVGQwOWlCY0xDTkxYc3FEQUZVWWI1K3dkUGFUWFNxTFFxbkdrTlg3VE9G?=
 =?utf-8?B?cFljcFFHZkZTZ2F2aFR5YnloMmxPQ1UyZXFoNWE0eXd2VVh1dEtoNjQ1ZHZa?=
 =?utf-8?B?VHdlYWRTS1kwT2NlK2JDWHVSQlpYcE5ib3ZwWERQY0FDcFBwR1RMWjlaNm44?=
 =?utf-8?B?R3p6enBxaGRpaXBQcElCWE56dmtwZDIxT2NKeEF6K1g3Q3V0UXNLNXRLRUxG?=
 =?utf-8?B?c0R5U0ttcGdZMVRBUVYvZWZ3dS83clpMRGpqLzF1cVpVVHpPN2gyZEpHYk5C?=
 =?utf-8?B?NGNkUTNibzN6RnRHZWxYR0p3UkNZSXB5TDRvQTdDOFl6R2g4WjE5Q3BwR2JZ?=
 =?utf-8?B?M2F4cVhPakNrTnhVWTltb2lkVDBha3Z5bWpBVHpLQnZzdTgwMStTdTdWRUZ3?=
 =?utf-8?B?SEovaGprR0l5MFhoMzd5dWF2eTRjZDkwU2N2YmllWXJ0VDlrZDBOd25QZmtj?=
 =?utf-8?B?eTVDY0NOc2RCQmNnMGdFNXQwSkZ0VnpKd3NwMlhUUlFCNm1xN3dnV1FjQmdB?=
 =?utf-8?B?cE1JQzhXTDN0WERjZkMzQ01udWhwc3JLd1gwWW03OVVWSC9YcHFSZWx2T2tY?=
 =?utf-8?B?VWdleXpHTS85Sk1BcEhxWjN6bDRWdDlkdkJsQWtpR3V1NnN1cXpzU2VyTWt3?=
 =?utf-8?B?WDM1cWUrQ0k4SHNaek5QRTVhTlVZQjVURktJTGlvdGlJRDFSdzhOcjRLOEYy?=
 =?utf-8?B?NjI5T2h3Q2RqTk84WHZ2R1kweE1mdVhvR0hieHk1VVYvb21uVW1VdTVZWTh1?=
 =?utf-8?B?b2x4RXJ4ZFhMZU5YVmFHSEtpYU5VK1I4UWJOd1dzYkFybUNZK3REUkl4dVcw?=
 =?utf-8?B?YkpQVlIrak5JMzF3NXZwaUdMUmJ3aTY3SWIyVU9TQ3ZjWTU0ZmV5QVZDV2wv?=
 =?utf-8?B?Mm5KMUh3MUlDdE9USUpNdWY4NUliZDdUbVRuV0JOSlFEbkliendWR2R2MWE4?=
 =?utf-8?B?amcwektFRHVxUnY5TnUzNGhFTWZVYW1QbEx4ZStrWS9vU2ZzOVVsVjdGb0Ux?=
 =?utf-8?B?M2ZBTXNtd3JkeU9pZjliT2NUVFErNW40dER6YlNXeEJzZnB2Q3VlNW82U0Z0?=
 =?utf-8?B?Y1daV2QzWUJ5ZklTZFZhMnk3VkNwVHBITjEzVk1kS2dLTWxmZFpKNDVvYnZp?=
 =?utf-8?Q?omGX6b9wHPRM88+U=3D?=
X-Exchange-RoutingPolicyChecked: f69nM1lQuyD6AEWGCWWlNXd1xCcDcQYrEUu+2sEYtd606lIH+Nqd/7ng6UofMLQXVUmLhzpUvrmCOq3aVBrEBX4CkQDrMpJiezUIWOVGGAyjypWbmWLGlMUv8PINmyWsiKdOh9AgGwuJ8tt4Tas2TeGS8LTFVKw95gFXORhqCsjZDYTEDaqonOQ7Py51y6B4VCthmt2xaIxHi4GtGClUeM+ATaX1PxrN6pwJ+PPbpG5GOyTYHdx8emqLrXfJpWS9yQcf8SxBQCtRBr7jChznX8O6IBkMciruiC9EcbB2IKhGD8Qj+ViJ5bqU8CnIxtOcprEqL9H+xpaqRrKDA+dSMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e57bc140-9fa6-4bbb-fbb5-08df4c6b6824
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:47:10.5008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNcSs9ggULj7ElOY9HuvK2iAYNTS5YFOxXWteaznp62UOctVoZJAvaPBFZdO/AsBjg0BUsnYZ0wfSWh0nKUQrqup2fVQ9xrFlGJySBlr4hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lukasz Laguna <lukasz.laguna@intel.com> wrote on śro [2026-lis-25 09:06:19 +0100]:
> xe_guc_flr_prepare() returns early if the GuC firmware is not loadable.
> This check excludes VFs, where the GuC firmware is preloaded by the PF,
> so their exec queues would not be torn down during FLR preparation.
> Check whether GuC submission is enabled instead. This is done only for
> consistency, as it's currently always true.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index fe3381602a82..00df83460022 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1771,7 +1771,7 @@ void xe_guc_sanitize(struct xe_guc *guc)
>   */
>  void xe_guc_flr_prepare(struct xe_guc *guc)
>  {
> -	if (!xe_uc_fw_is_loadable(&guc->fw))
> +	if (!xe_device_uc_enabled(guc_to_xe(guc)))
>  		return;
>  
>  	xe_guc_submit_stop(guc);

LGTM,

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.43.0
> 

-- 
