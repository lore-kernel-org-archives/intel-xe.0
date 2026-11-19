Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD7606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TjunxUv+;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IuFehwfm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD1510E168;
	Thu, 19 Nov 2026 16:37:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7533C10E168
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 16:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795106208; x=1826642208;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HvPPC9bPHGrLuv+anIDOPfqP/wvOUreH+oGFueGOUTg=;
 b=TjunxUv+1Q3Kjgkgb6i25LVwlNOb2KoyJwhXRracl+5qkFLF77ETIBAJ
 yBljCo7XLXNuzC8b7E8vkkOHhMFqyKI8KFgTUS8wiquoXnSnT+3jCtKM/
 uQQq0HzIOnE7iULja9SB8wDA4ZPhN1/gLqhXynAcpOieeQgyZS536XrTN
 twZWknc+U5Gu6vZ76pxcKmX4k8RNt+cICGwH4uJ3AWPZcpmu4qrhQHXV9
 QB9v/XqBBNvb0Ti3qmT6oLswSAmYT3zJGVdC3LHLg3NMrTpK2CQMuzrS5
 0Evii4oBUOjn9D5VbOOSINmmom7+UkvouymiCctgjkga4qkNVzGaXg59X A==;
X-CSE-ConnectionGUID: am1t69DVRPqI3to8uEqiNA==
X-CSE-MsgGUID: jhzzA1AZRO+8Shpgqr26Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3845272"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3845272"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:36:48 -0800
X-CSE-ConnectionGUID: p0RevvxaTeidVogyAkpFyA==
X-CSE-MsgGUID: MW8nIFigRN259C41R/RRbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10279811"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:36:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 08:36:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 08:36:47 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 08:36:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p15QrPUOcUNcPBBn4CzhSOQJvKWQ02wh5xj1VMXdjD4m0ZIO2MKQ1Litk34Plri3UFFaii6QqCdIcDLq2bJ20RsFsMpxV9ob9cw+7a1yIAa+2f04M63BaytLf6Ah71HGkSS78OTpDlX/eQQbpVH3XVL+pp3USbhhhKPELXlamaIcGYFyJ33S4N5fyyEJqhJqdCI0HeH5h9JXALFFMiMRmQNPXpJFFyyqMP6Dyhz8u6IFYpm6CvHwIdHqtmx24cVd0PbWKXXecQ1RgtDS2uQxOnHVkPbYWN+jfIxEDFHS6v7ys67jVugBHUAnRyU/MMxead3sKS0XaqbflPdaeVmO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mRKQjse8x5SxkkaVic09UgvZ/+yu0KUoB0DRzmfefA=;
 b=t9Uvu6oYfnkpzY3RnGe7kfIJxUIHhhp+pLBBk/9WNw8WffHMNI76fKJi7qcaCmGXwStXEYTqM7te4/KT93+zyj6V6fI+QEo6K2McQvZwu6h4HJ1iCIH2JPqS8iIugdaSmMAfxHBh7eFWOD4fn5Uu+YIGkqk0fH4SKZww1mS9U5GiYLTNOnBwu/FJryyqVuQQ9EJolo4HDF+xqW0pcaytW6IARiv+n/TkuvlvbOIRqrUWzXj/Kf0CmBOTRZiD7clKyEKEADBlopb7+89hC+KNTQ15oHYNsmQFmpuYRZFUTI+7F+5jx09Q2PtvEqASdRnxuAsbIA9tlwF/4VZgStk2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mRKQjse8x5SxkkaVic09UgvZ/+yu0KUoB0DRzmfefA=;
 b=IuFehwfm9cYhKX+5dtazt5yLqu9PZUV+Rb3/axI2ml9+bR9bxpFx0Qa7J1qiD8yq6tbaelNagfh1g1StWw9OukN/jnck1lRftsuzzYoQqVBJXVpgKqJAmEiQxgaDIkafTfxYMCtAk7uzPEW/IuuUZ+UfHCPZkGwuLfYiX2/ml8Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB5928.namprd11.prod.outlook.com
 (2603:10b6:510:144::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 16:36:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 16:36:37 +0000
Message-ID: <5363b647-5d77-4a47-ac24-6fd407182890@intel.com>
Date: Thu, 19 Nov 2026 22:06:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe: Requeue the rebind worker instead of retrying
 in-line on -EAGAIN
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-2-af2e327833a9@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261119-userptr-repin-v1-2-af2e327833a9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0277.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::18) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 9835be38-9b16-4e59-b2af-08df465b47ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|261009223027099003|260925022911599003|261102123227099003|261021123027099003|56012099006|260925021311599003|10067099003|4143699003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|11063799006|260925021911599003;
X-Microsoft-Antispam-Message-Info: M3GushkjY4KhMs/ZoTBhcswuKWU4WwU+TErYWaEOiekzs+6ZZS4Z+w7L1cL4l2kgljgec+xBOGeN/Q9Gv1W/ZYRAEsQiTeOLjVCw1Zt9Dq2ypdl6VwL5OZoZQT84U7YK773/3sOCcOiMq0Xf3KCGWnbA+0VQk5FWnWhj/FkQHOTpchgf7SEHEhhyWJtR4arriTVKEPPT3ISJCY3VOrPz8wGhEtcHKAtrRssQPpHmR8OzsSKIra93j0/tveeNYsxiVn/EtpUTBF+m1qAdHjfodZyqMEgr0/mUyV/Lzh9Y//nuF8bcXeRGzlWsKQefYmx9qMuyV08EGXoDZDgDou7udvfTnJB3rMvvcNyJQreaNW7J4biCjy4iy1ToZNdAauQ+a5LdIxk1u6V0QERFC56tY8kDY1xC/5rTdt4jcsSJFKCUAnN0J89ep9n13kGQxK240ZNqt8VMlSkL9um4KyJkGKH0ErQ9fRGp6iaCkg5txG+f04jAAm2kCdle5CAi3Fx+etCbSAh7ur8afWicxaOqwCK4FMDoVOIT55mGwPixJVitMpbvRNm8KTtBLy5jtz0OBZ9VeppCCzJrkmZOlZRZ0fDC17IVCkdLxeMrs5NGcurjdxkzNqCGLEPs5UN5p2pRVIOdEUY8itBzEbpR6O+b8FkQRoEvrepZug0bsqXJS3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(261009223027099003)(260925022911599003)(261102123227099003)(261021123027099003)(56012099006)(260925021311599003)(10067099003)(4143699003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(11063799006)(260925021911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGFscG0xRTRnWEVNcUtjU2tIcWtLVFNiL0NlaGFmUWY4aFZhL3VSQkZRRGpn?=
 =?utf-8?B?eEpieUowS1prbmk0Y1RITTJvbkJJZEVIWFZsbG13TmVIU3RlNmJsRDZhaXFR?=
 =?utf-8?B?bXJhZkNTa2wxVmlVOTBSYW8xRUZUSndyWk5wRitlY1ZycVp3UU1YRWRKL1BE?=
 =?utf-8?B?Q09CYXVwbjZ1cEJZR0NVUVNEcDcwc0ltRzJCclZ1V05mNGo4VklsWkZtU3VJ?=
 =?utf-8?B?ZHNKMzdOaEltS2ZOUzFZWHFDc2lZcGtpRE93aEJ5czBCLzErNnNrOExYQm9Y?=
 =?utf-8?B?b0NnTzVHNFJ2QUJRdlJ0NEhxOWtrMXBYbCtlbnBJQUFFMHpmMC8zbTh0aW1w?=
 =?utf-8?B?UVA4eVlpSnJDZGdlYTZNaEgxcjBaMWFQSDVYa1lzRG5BQzE0aG9KQllzL0hl?=
 =?utf-8?B?akJvYXM4WDlmb095Ym9XUmRGekZ3SnRONVRIWUxaaWRnWFh3NjFBYnBtcWdV?=
 =?utf-8?B?SDdQbEdjZm1uOVRVRjZiK3lFeGxFSlYrTU5Uc2ZGWFQ5RmdTcUhGSG9tMHdB?=
 =?utf-8?B?RnpYaEFESWFCQTJQSUxBQTEzbmpSb0puRjVnTDJmYmtGK29QalVvZmJ0NnVk?=
 =?utf-8?B?cWh5K0U0WGN4NVVKaGRURCtSUUxFMEllTUs1dm1tY00yYnFHMXk4dmFKcDdK?=
 =?utf-8?B?Y2YxaFp6SDROYitjamg2UXUwckxLdnZDbDZPd3kyNnMzQjdrUlNZY1dXNmly?=
 =?utf-8?B?VWZXclJYSjdIUG9LNEswWFNvN3NMS1JOY0k2b0ViYUdxeStOZEl0UjNQOUM3?=
 =?utf-8?B?QVBWL0ZKb0UvS3EvaWZSYUNRVkxCVDlrNDFvbjBHbEV0a2NraURlQzZCMEpL?=
 =?utf-8?B?aG52WFU3Uldzdlh4akE1SWFPTGZNVTBiYXNZckNyeU51TjA0K1MwSWR3UHEv?=
 =?utf-8?B?ZDA1d0lmcm5GUDlscFJhTFErZ0tsQW5md2VBSml5N25YS09wNWFoMDZaaVJi?=
 =?utf-8?B?K3ZNU0lad1RBSTdpR29lSHk0RTVWaURFZ3hRU1I1ZEl4K0FpMmE3VjlycWRX?=
 =?utf-8?B?NEdDVW1YRFlRaVliTGh0akMwOHVtMFhLbTdlc0RsUzFYWmFyWXZjVjNxOHVo?=
 =?utf-8?B?RmJBVmxpaVlFYXc0OTVQZ2ZqNkh5ZHF3VC9KMnh4bng3UXNXY1lMVXVRVFpi?=
 =?utf-8?B?ZmpLclJZSXlhQklmNzRoYnpBN1I1OE82YWVQYTFucklPdXlhamR2S2ZGayt5?=
 =?utf-8?B?N0YySkJJVlRoa2dZRnlCTWw0djI2Y3kvK1lQa2JBSEsxb3FTdWJrNnM0VVJw?=
 =?utf-8?B?bmV3aHBPcDE2NEFOUVh0eVowbWlQbUN1ZHBhSG5nNkVJTFZQWWtzdUM0dS9Y?=
 =?utf-8?B?RFU2dmxtZFZmbHZjMHhqNmp3ck50NWg1b3ZKMG9CeVBOTFlqWXh2bktKVkpP?=
 =?utf-8?B?S01QazJWcE1yNGpXbldJLzRDelVvMkdna0JvK3loRkxOYU5SdlhxbDVIRmdv?=
 =?utf-8?B?Qjh2aTdmUUR2ZUpWT0FMN0NadFdRcEd1UGZYa3FrTlZsWHlmMlBuSFV2MHZE?=
 =?utf-8?B?VFdpeDhuS01MM3BuWnlMSDhNUjNNZnlmanpuUWZycnF0dzZKdHFic3oxckY2?=
 =?utf-8?B?ZTlJcEtYODZaUi96WHNjUVltWG1TNm5iMS9nNUJYWVNURUl1NHdZTnA1K3ZM?=
 =?utf-8?B?bmdMdW45UUhDQVk0dnZEQkdGMGhoWFdOSDZRRjBHeklMa2pTKzBkVDgwSmEy?=
 =?utf-8?B?K2dBbldCWVlZMlJXaEpCaEFuS29EZzZ2bzJxSGFSdVB3bGFwYmxxZlF3UEV0?=
 =?utf-8?B?Skx4Uk1OLy9oRGI2ZHFrMW9LRVVTaURyWU9Md0RlQlBCemY1bEJBOHB6T2RB?=
 =?utf-8?B?T2JpQ3JPMmthL012bWtjY2xweW9xdTZucktlak0zRVZ5U0Jzb1FyM1l1aWlB?=
 =?utf-8?B?UkVWb0R2NDllQ3cwRGFEdk4yN2NLTi9LZ2hqQkJRQTM4WlEvaXpRY05XQXNk?=
 =?utf-8?B?RUxqcmVlK3Z2WE5NMXdNMHdxSGFqUHpwN1dab1RnMmU1THVBWnZuQ2VvQXBo?=
 =?utf-8?B?TGVPZVRJOWExMzdjelpCSTgzSStCZzdqaldqRitSS2RBVDJKVWNKa2VJV3R4?=
 =?utf-8?B?RVprMXJMdGtyMFc1bTZMK3d4MGpiUEZmV3B4Q0VEeFlucFRUYlVLblZlM1dm?=
 =?utf-8?B?ekZ5UWhvT3U5TzA1ZC9mY0ZLbm5nY2swcVVmT0xEVjhlcXFSSFJpRnlNZEZT?=
 =?utf-8?B?alVTWlcwMDYwN055LzJBNkYwRXFZUEVPam1LeXFpZ0k4UC9lZGFOZThZdmZi?=
 =?utf-8?B?OUozYnpXVkZHbk1mT3ErdGtYU3kzZGo3OXFoeDJQdmw2SnRJSmx4MXZVOG5p?=
 =?utf-8?B?VDYxdEJ6VDlYbEdPSzBHSFdiNXYrbnNPTE1zNWtIaWI1L0Znd2g5UnJ3OU9k?=
 =?utf-8?Q?3w/vES6VrIFvyVXA=3D?=
X-Exchange-RoutingPolicyChecked: okF80k3mWasbIs/GjUdMFwVGB/NNLvlwBl7SN47ZMB3cari3JV0QjFT2VLgDqZoEQ8YArPahdnf+PY34uXOCdr+s5UIS39n20/84MP6t63cNswo37rG4TGOcVHPn9ei2diY0TWTEVljQgt34appiaKOJSjYWcqYw9jXHAuOmon3PlvzX4CCDComqNmR3hSKuvTvWXQPA/UbZlZgyTTWpdlZ5YZX9hawH3OXJMZDuBq44R8/JbSoE8Eby7uKnRRvqIc/f42Rzdk+npqy5mMaO8H9puO3YiksNkkTuDXJMKWZ6B8cHLzRmTeZF3xA//kU3osQ3eNDHc4QyeIXapsun8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9835be38-9b16-4e59-b2af-08df465b47ba
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:36:37.1029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcfTpxoIEOoQ4shSgRY3/XZM0NXmR0uX+1RpN6O9H/BNWmqSvc6iE3m57GhonFe2zyF9x024fADvuf4Ge9t0ij1mWatlHWX9XWVemWeJYV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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


On 19-11-2026 16:44, Matthew Auld wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> When the preempt rebind worker needs to retry, it currently jumps back
> and keeps holding vm->lock in write mode across the retry. Only VFs
> with migration support drop the lock and requeue the worker.
>
> Holding the vm lock across retries needlessly blocks other users of the
> lock and other work on the ordered workqueue, and makes the retry unfit
> for conditions that may last for a while, like repeatedly invalidated
> userptrs.
>
> Always drop the vm lock and requeue the worker on -EAGAIN. This also
> fixes a leak of the preempt fences allocated in the failed attempt on
> the existing VF path.
>
> The userptr invalidation injection state that forces one retry per
> rebind sequence was a local variable that would be reset by a requeue.
> Move it to the vm.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_vm.c       | 59 ++++++++++++++++++++++++++--------------
>   drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++
>   2 files changed, 46 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 75be5e5329bd..ff8d355728fc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -542,6 +542,31 @@ void xe_vm_resume_rebind_worker(struct xe_vm *vm)
>   	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>   }
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +/*
> + * Force one retry per rebind sequence. The sequence spans requeues of the
> + * worker, so the state must live in the vm.
> + */
> +static bool xe_vm_rebind_worker_inject_retry(struct xe_vm *vm)
> +{
> +	return !vm->preempt.inval_inject_tries++;
> +}
> +
> +static void xe_vm_rebind_worker_reset_inject(struct xe_vm *vm)
> +{
> +	vm->preempt.inval_inject_tries = 0;
> +}
> +#else
> +static bool xe_vm_rebind_worker_inject_retry(struct xe_vm *vm)
> +{
> +	return false;
> +}
> +
> +static void xe_vm_rebind_worker_reset_inject(struct xe_vm *vm)
> +{
> +}
> +#endif
> +
>   static void preempt_rebind_work_func(struct work_struct *w)
>   {
>   	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> @@ -551,7 +576,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   	LIST_HEAD(preempt_fences);
>   	int err = 0;
>   	long wait;
> -	int __maybe_unused tries = 0;
>   
>   	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>   	trace_xe_vm_rebind_worker_enter(vm);
> @@ -564,7 +588,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   		return;
>   	}
>   
> -retry:
>   	if (!try_wait_for_completion(&vm->xe->pm_block) && vm_suspend_rebind_worker(vm)) {
>   		up_write(&vm->lock);
>   		/* We don't actually block but don't make progress. */
> @@ -614,20 +637,14 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   		goto out_unlock;
>   	}
>   
> -#define retry_required(__tries, __vm) \
> -	(IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT) ? \
> -	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
> -	__xe_vm_userptr_needs_repin(__vm))
> -
>   	xe_svm_notifier_lock(vm);
> -	if (retry_required(tries, vm)) {
> +	if (xe_vm_rebind_worker_inject_retry(vm) ||
> +	    __xe_vm_userptr_needs_repin(vm)) {
>   		xe_svm_notifier_unlock(vm);
>   		err = -EAGAIN;
>   		goto out_unlock;
>   	}
>   
> -#undef retry_required
> -
>   	xe_vm_bump_lru(vm, &exec);
>   
>   	/* Point of no return. */
> @@ -642,20 +659,20 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   		trace_xe_vm_rebind_worker_retry(vm);
>   
>   		/*
> -		 * We can't block in workers on a VF which supports migration
> -		 * given this can block the VF post-migration workers from
> -		 * getting scheduled.
> +		 * Drop all locks and requeue rather than retrying in-line.
> +		 * This avoids blocking other work items, such as VF
> +		 * post-migration workers, and lets other users of the vm
> +		 * lock make progress between attempts.
>   		 */
> -		if (IS_SRIOV_VF(vm->xe) &&
> -		    xe_sriov_vf_migration_supported(vm->xe)) {
> -			up_write(&vm->lock);
> -			xe_vm_queue_rebind_worker(vm);
> -			return;
> -		}
> -
> -		goto retry;
> +		up_write(&vm->lock);
> +		free_preempt_fences(&preempt_fences);
> +		xe_vm_queue_rebind_worker(vm);
> +		trace_xe_vm_rebind_worker_exit(vm);
> +		return;
>   	}
>   
> +	xe_vm_rebind_worker_reset_inject(vm);
> +
>   	if (err) {
>   		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
>   		xe_vm_kill(vm, true);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fb9305124679..756cf2dbee8a 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -350,6 +350,14 @@ struct xe_vm {
>   		 * kicked on resume.
>   		 */
>   		struct list_head pm_activate_link;
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +		/**
> +		 * @inval_inject_tries: Number of rebind attempts in the
> +		 * current rebind sequence. Used to force a retry for testing.
> +		 * Protected by @lock.
> +		 */
> +		unsigned int inval_inject_tries;
> +#endif
>   	} preempt;
>   
>   	/** @exec_queues: Manages list of exec queues attached to this VM, protected by lock. */
>
