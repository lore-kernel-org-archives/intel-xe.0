Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A4CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 21:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280F510E142;
	Mon,  6 Oct 2025 21:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfFF8FLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284F310E142
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759785278; x=1791321278;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HEyM1FgCGOgYmNLnPToJdQZbowZMOFgCHc8kGB7c9QI=;
 b=TfFF8FLmkd1a7wLM0v5USi1spDiTcGAUuUMrnQqvK9GLejR6cV8qmC3L
 iB0++9+6Qs8tTJqahin0gHAnFYc4J78YdmM02hPmiBnLpwv5vIG5WH1Yu
 TA4B4ZydZ1w+rSagl0DlpMyn1Mp4kKNERgmRbhXzHbYjpKAOzf5cxLY2v
 68CEuLyhoiClLWJJ+7SGVmWKf+njhh/6FK2ZrnaDzG//8sH911nFFgVod
 XXyTycmlcLirxaKdymYv4i/Dso5lQEkOwN8fBkqtalnMyf1X+UhBV6AJ5
 KMZWlevzk1mR5Qo6XuJpG1U+pIuucyL+8W4ezxpTIu9HRu0AM8R1Fx98Y A==;
X-CSE-ConnectionGUID: KU41SOevT8uJ/li4oXsnRg==
X-CSE-MsgGUID: fE++cqx/R5yAEylr5/4v9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="79615527"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="79615527"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:12:55 -0700
X-CSE-ConnectionGUID: TiUHNlVNQ96oLIfJzwK+nA==
X-CSE-MsgGUID: /Asy9mpkSxq/ML07qBRqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="184348393"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:12:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:12:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 14:12:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:12:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJ9xdIyWFJ+cPzRYyhpPbXANqKClMKi0rbsyBrTOyeNkkC11HrLCqU4VCUvDynBYVgE529AJVLmWXJ0t9TAaymkv/c/8/NjS7JyJ+JLD6R2Vv522f9EEmQZH5DvA4zkTNG9KiSIPNRcuLxC2Lca+IzBmql4orDhcB1DMGLSLaIN1JnJ5iuOLHwJ20G741/Gk99twiXgfSSYk1k1HcFa3Q3o8JbHns7O9gRV0MYh0Wim7O2J+cQRV1ePvPHcfNa3d20qZ5wuQ264ZPsiyXCgJ1gTQDS8coyHqOZir0jQWXFuXlA43ff+nKFQKCoSr0ly4hGv5cgXQpJOjJDpBFRDHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tm/KzKWsekjQK6O3rYeO1eVbnyFcKqrM4gFTetbJBYQ=;
 b=Ekv7YWzj+UpN0I+dKbf8Bf1KIugr5q6SvI7mAkSiJUaU8uRqKNP6CQKvV2PvYw9mTDA3m9Y7eYZVzqghloDK4dQneAHbjwxCx8x6vgJpOGEAX8he+L90sFmdai4ZiT3trHrX46ckubp3HhcHmhM2SOUqA7+1YpfeFg4QC7DiDFEMK4gI1cbqKEe8+JXoOcv2NqoKWeX6k/pfOHjzuvvjbedkLAqqgYv2l1URIGu7bAFb544L6r8AdkTIwfU4+YZciyQw8hCiDa8feqhEAUbnmVK//TrbBicV1FBuAF2fCEGHaz9SLTfYoLnGTAIxcbqzSx/+f1HQJYniFFqOj+inWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:12:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:12:48 +0000
Date: Mon, 6 Oct 2025 14:12:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <rodrigo.vivi@intel.com>, <carlos.santa@intel.com>, <matthew.auld@intel.com>, 
 <jani.nikula@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v5 5/8] drm/xe: Implement xe_work_period_worker
Message-ID: <aOQwzYTSwpMR6VW+@lstrano-desk.jf.intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
 <20251006142034.674435-6-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006142034.674435-6-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: BYAPR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc6defc-73b6-4618-f8f8-08de051d19ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEJJLzFreXpBZzlhVStCajNjUG0zTmNNWitwYkNyNjQyZ2JtUWVuMW1MbkFl?=
 =?utf-8?B?djFEOVVrQjBBYk10eDNHaXRoUXNYSytpejUybzdnRmU4VlFWZ1ZQeEVSSTMy?=
 =?utf-8?B?UVBhTFdZaXE5eVp2ZnhpYlBIMFMwazI2OTE0ZmhVRTNOSkxkT0RnMFhpQ25a?=
 =?utf-8?B?alpqWDdpTnVyK1RSTVhYWUFqdjhXdEZBNk1semQrME1pRHlLcGk2NFlHOGZK?=
 =?utf-8?B?c0tLM0ZCbDFGejJMSEg1Y3NzcStJSjNyRTJabGpYUHVLOVJNU1VBY25oOWM5?=
 =?utf-8?B?VXRZYkRKSmdJdDJUbkNZbE16cVNEa3VEOUszZGtSWlMrL1FIV0N1eXhmSjBp?=
 =?utf-8?B?SjdtSHJDdzF2YjhENS94WmNBWk1XekhCUEdodjVqK29XTldlT0JoK3hJQ2lM?=
 =?utf-8?B?VWF3RnV3NVRPYWRnelRISzBUb2JsbXd2NjVzL0U0Z01FV3c3T3pQL3JMZU9m?=
 =?utf-8?B?bkFRT3FOVE5XWVFJWE5Ga0lEZ2Nab2VhcVh4RDNMU0JUQ3F6TExtT3FubGlQ?=
 =?utf-8?B?T1NITTNGS2lmMjltSXl6dElTdnl2bmY2c1VQRnNVSi9BbnJzQXdlbjFCTURF?=
 =?utf-8?B?NUtOekdHMkdndlFQMm1JL0FkbTZPZjFsYlpRZ0h2U09ZZHNnV1Y4TGp6eWVI?=
 =?utf-8?B?dVg1ZC9aa25jOVVzNWpMamVFajJ1aGZJOXlhOVBOZ0tkcnlDTEUzZFdZMmFu?=
 =?utf-8?B?MDBIUnBnVmU1WVU0RXdqUGpKaGZuSzJzQldVa2J3VVNWSktCNGJ4bi9CdlNh?=
 =?utf-8?B?S0R1UEhlaFB1bkdXbHRBQnorMlM1L2liSW9UR0FVS3FIcEs0dy83eTRPRDRS?=
 =?utf-8?B?eGVKMWg3bDRaanN0UGJNd3NteGZPYWUwOVFtZnRQOWxTbzRteWllNmZCTUFm?=
 =?utf-8?B?RGF6eExrU2Y4d0tNZzZuRDlHRG9rS1QzMUJ4d09sWGVLVytCNVFjbm42WktZ?=
 =?utf-8?B?ZEZpaXRPblNKRVZ1NjhkaXJJRWMvdkltRHlDWkY3V3FSUERhbkpxK3A1TWM5?=
 =?utf-8?B?MndhRGdBVnBXcjlhZ0FJSjlnU0VVbjBUUTlRK1FGb3QrY1JJMkltajJ4bEVq?=
 =?utf-8?B?MDVCT3VqUHFReEc2UnQ0dXhnL3dOWWQzcTN6QklUMTd5WmdOeU96bUZORWpk?=
 =?utf-8?B?bUMwa2RrZzl5ajZtMGZlK3dsT3h6aGpGWGVuaUhIMCs2QWpCbWlqNlFwMmlJ?=
 =?utf-8?B?RXRvVTZyZVM1WG5uMWdSNnVWcHRzWUhabGN4TmtMWWg0cFk5MExWN0cxRlYz?=
 =?utf-8?B?cURaYk95OUl2dVhhSUZvWmhGQmFXRzBWYUpia2x1TG13NzgvRXM2MGZ1SGgy?=
 =?utf-8?B?eWRvRXRmNGJ2ZlUyeFhqbUUvZU5EcEMxZTMxa0tKUm1UQUIvcXpOODlmeUYv?=
 =?utf-8?B?WnVrdGtkT0MwTkJreWgvaVROTC9YM1NQTGFtQTdTMTNSWnJ2aXF6NEZrWVA1?=
 =?utf-8?B?U2dTNFdaK05mRjZrTVFtcXEwUmFweUZnOWxCQnlWeGpRclEzM2J6cjhqVWVS?=
 =?utf-8?B?eGw5SUZVellHZVpvYjFrUUFjZm5PRmxodXlEOSsrY0dCZFRCU1h3ZFBlRkhy?=
 =?utf-8?B?Wkg5cG9zV1JxV21qTnRFL0pnMzRqbFMxdmI2UlIrUFpuVnZjdEhoQlIyK3BC?=
 =?utf-8?B?Y3F3WTk2cmhQVno5N0hlYVYxSWNVSlB1ZENWRDh0bkRUOS9Hek1yWlV6MGhh?=
 =?utf-8?B?cVlwNVQ0ZG5OU0tsV0FORUVYQlNZZmxxM1NkYldBYnp2M3pQd09hb2xUa1Qz?=
 =?utf-8?B?ZHBWaDZWVHBCMUROb0paMVpmT3dxWjJyRUhuRWhKVDZSekhmSU16dW5ZZFZV?=
 =?utf-8?B?OHlGRVVFaVBKcWUrQmNyNjBlTWw2M3NKYkE1TXh2aGNuWXVLc2d6cVVBblhP?=
 =?utf-8?B?Q25FMzFKUlFtcElyVE80Q2dMbUh3SFdqclhuV2hrYVI3aklkanZaWVgrS3N1?=
 =?utf-8?Q?TfUczW/yliq+s0FCfyaWiJJIvKKW8xzM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YktWLzM4QUVyajZyS0l6bmR5Yi94YnNyd1ZvODdMemV4OFlPS0ZhZ2ZTeFcv?=
 =?utf-8?B?SmpNNUZaNER4Y2MzU0hMeEI1TklsT2EwV1d3SFRlQ3FPWGptQjdzc254ZUQ1?=
 =?utf-8?B?aWszZHJWZG1MQ1RDNVN4RWMvKzczWTNvYUdraUJlQVZzUWJSazlXaktJbFBZ?=
 =?utf-8?B?czkwMVBxcFlUdUpjOHllek5pd2JVTk00VlQ1RlMzYWpNNHRKN2lyZG9DaDhz?=
 =?utf-8?B?NHJNdWV3NCtEODBaajI5ejZ5ZEVTUkZrc1dYRW1HMk5CRjBBWTNla0puQkF5?=
 =?utf-8?B?UlAxU2N4eURYbGtxYVhOQUV2cWtuelBJcDZXUGNBUE1KYk10aktFc25XaUxp?=
 =?utf-8?B?MlQ5dlU1UE1pQXVYb3BkMVIxeFBzUVZ4dGtDcGdPZ2xqb0RnKzB6WDFWQlVQ?=
 =?utf-8?B?bzNSMGRHUVdWN29EQkZFM01sbEl6SmFaaGwrSnBndzRpVWZ2aVMxSFEwTDhO?=
 =?utf-8?B?eEs0UnZDdkZkSkh5ekxReWNuRStoN2lvV1lYUmM4NlR6dlBKdzBwTTZ0eFMw?=
 =?utf-8?B?VGl6OXRqNkV4SDJKYXplRHZJb2pwazVRMWRqejR0dEJjU0ErdlhiMStpOXN3?=
 =?utf-8?B?QTkzNGIzOGJpQ3BsektZR29FU1BnNExqSWdEcE5wdVZsVFdtMldEcEYwdExM?=
 =?utf-8?B?aWdIdFdFSDF4VGVTc2dsU3c0cTN4MnVLTmFKcmNEOGk2UFF6N2tYUlViUDVw?=
 =?utf-8?B?WFZDc2ZtWlNnZVpjendXK2w4aUdjaGE5WmQ2elpvancxeWFEQUdObEM3d2F6?=
 =?utf-8?B?MVpkRk9pQWpJRTZqTnExZmtPSkxQbU5CMkdURlJHUVhIREdFbnJlUEkxNW9Z?=
 =?utf-8?B?bkNZWFErNFpOUm9lK2twLy82NGNLcm5KMUxuWVl0YVozM0VLSVhCREgzUWJ4?=
 =?utf-8?B?d096Q1llZkVETzhYTjA0ck9vMi8rSzBZY3JDVFhtb2VWMHhYMXdoUHB0dktj?=
 =?utf-8?B?bGdvZjZJNStMU3RJWFM4bmRJRW44RjBjNmZjT3dOM0FOUmYrQk9UWFhaREZs?=
 =?utf-8?B?N0JSdzdpdGtXbVMrUlJQQXVQUmpqN3A0QzFRYUIxNkNsam1lbW1oQks0cUVw?=
 =?utf-8?B?Q2RKTzZ6a1QzUUZIaUxGcVI4Mm9BeTVYU0FpeXFtMHgrRERTZHhBRUdqaitm?=
 =?utf-8?B?ajFGa1pESnFqTU52am9DVVFYKzcrMDBrM0M1ZDRYRHJKNFRNcWlRMFpQMlNp?=
 =?utf-8?B?MGVjck9jTEpXMlkyZkp3em1xU1E1eUFtNDk4NS9DL1RUTm1TUnA1R25KcTZJ?=
 =?utf-8?B?UXlROGRQYUtVT2xyaE1UeW5NSWdxTk12Q3RCTlVod3MxSDBjQXBJQXlUQ1BV?=
 =?utf-8?B?WVhrQ3p6RzdCdEhPQnhZSzRZeG9SZVlqelNIOERVdVFwdS9CbEZMclJxWHpa?=
 =?utf-8?B?NUxkdHBiRXlCSWg0eWFlVEtkZ3llbGNFWEhLdzRSSnZYTno5YkNOeHdLeVVt?=
 =?utf-8?B?YXR3dUFoVUxhQlZ6S0NIRnBNQnJNZFZpSGpBZzJDM3BhWThZZzNFOFUrMlVl?=
 =?utf-8?B?L1ViU1NwOFJvYnlzVFJQNkQ5NllPdi9Gc3ZtSkFHQ21nTkoyT01ua1hmV2lR?=
 =?utf-8?B?S1cxb2dkdWJWMDIvZG50Q1lyaDg2Zk42dytvRktXL3RkaVd4R2lYNUwzVUdR?=
 =?utf-8?B?ZGJrMEZ5bk5uWnpyRGhUT29HQnozYVNTWVR6cUZRVUZqY29TWDd0Mnd2bmNq?=
 =?utf-8?B?QnpoOGZqSzhUeVI5TnIzWUVCTnk0a3JCSW1wdXZVWEZOSFJDVVBuMU52OWpM?=
 =?utf-8?B?TE1iZXQvRGUwb0ZmN0RBUkE1MGRmRlhVRHp6cElUZDZRQkNTcVN5eS9kbFV2?=
 =?utf-8?B?aE5aSUk4ZVhnQUJjaDVGU09qcFdjRzh0cVBITXRYQTc5UFRMOWNtcGpBdGpQ?=
 =?utf-8?B?SjBuVlZMNFlVVTJ3SjE3OVJYNzlScXdYeTVDNithY1lodWQvMnBhUmNaYmtz?=
 =?utf-8?B?L1BGK3A0ZURPRzc0VktPdXgxWjBMK1haMGx2YjRkYjQ2SVJQL2Q3dExPZkx1?=
 =?utf-8?B?K2dOdFl5RTk1eDYzdVVjZTR5VUxrWldlY1llT1pSQXlTc2lyZ2h0THdSaGtH?=
 =?utf-8?B?MTVsaDdwZGVxc3BMdlZ3bFRXa0dpTnZBMndERE42WjlvK1FHUys1L2lxZ1Y1?=
 =?utf-8?B?djU4Mms0WCt4S0RkR2dVTG05WWlSTXpBbnlFbUZ1Q3ZhLzMvcVlzaldRNmdJ?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc6defc-73b6-4618-f8f8-08de051d19ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:12:48.2952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uAgxISOA/m1d26QIhaFZc2pCtAzew00FIT/FtWyetlfHEz4m0jeTQ108vfWLyyHi+SE+zl1VxeJr8EOYT5LMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
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

On Mon, Oct 06, 2025 at 02:20:26PM +0000, Aakash Deep Sarkar wrote:
> The work of collecting the GPU run time for a given
> xe_user and emitting its event, is done by the
> xe_work_period_worker kworker. At the time of creation
> of a new xe_user, we simultaneously start a delayed
> kworker thread. The delay of execution is set to be
> 500 ms. After the completion of the work, the kworker
> schedules itself for the next execution. This is done
> as long as the reference to the xe_user pointer is
> valid.
> 
> During each execution cycle the xe_work_period_worker
> iterates over all the xe files in the xe_user::filelist
> and accumulate their corresponding GPU runtime into the
> xe_user::active_duration_ns; while also updating each of
> the xe_file::active_duration_ns. The total runtime for
> this uid in the current sampling period is the delta
> between the previous xe_user::active_duration_ns and
> the current xe_user::active_duration_ns.
> 
> We also record the current timestamp at the end of each
> invocation to xe_work_period_worker function in the
> xe_user::last_timestamp_ns. The sampling period for this
> uid is the delta between the previous timestamp and the
> current timestamp.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  11 +--
>  drivers/gpu/drm/xe/xe_pm.c     |   5 ++
>  drivers/gpu/drm/xe/xe_user.c   | 127 +++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_user.h   |  19 ++++-
>  4 files changed, 150 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5a084fd39876..54ac71d1265d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -140,11 +140,12 @@ static void xe_file_destroy(struct kref *ref)
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
>  
> -	mutex_lock(&xef->user->filelist_lock);
> -	list_del(&xef->user_link);
> -	mutex_unlock(&xef->user->filelist_lock);
> -
> -	xe_user_put(xef->user);
> +	if (xef->user) {
> +		mutex_lock(&xef->user->lock);
> +		list_del(&xef->user_link);
> +		xe_user_put(xef->user);
> +		mutex_unlock(&xef->user->lock);
> +	}
>  	kfree(xef);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b7e3094f8acf..c7add2616189 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -26,6 +26,7 @@
>  #include "xe_pxp.h"
>  #include "xe_sriov_vf_ccs.h"
>  #include "xe_trace.h"
> +#include "xe_user.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  
> @@ -598,6 +599,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  
>  	xe_i2c_pm_suspend(xe);
>  
> +	xe_user_cancel_workers(xe);
> +
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
>  	return 0;
> @@ -650,6 +653,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
>  
> +	xe_user_resume_workers(xe);
> +
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> index cb3de75aa497..fb54d2659642 100644
> --- a/drivers/gpu/drm/xe/xe_user.c
> +++ b/drivers/gpu/drm/xe/xe_user.c
> @@ -5,8 +5,15 @@
>  
>  #include <drm/drm_drv.h>
>  
> +#include "xe_assert.h"
> +#include "xe_device_types.h"
> +#include "xe_exec_queue.h"
> +#include "xe_pm.h"
>  #include "xe_user.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/gpu_work_period.h>
> +
>  
>  /**
>   * DOC: Xe User
> @@ -50,7 +57,82 @@
>   */
>  
>  
> +static inline void schedule_next_work(struct xe_device *xe, unsigned int id)
> +{
> +	struct xe_user *user;
> +
> +	mutex_lock(&xe->work_period.lock);
> +	user = xa_load(&xe->work_period.users, id);
> +	if (user && xe_user_get_unless_zero(user))
> +		schedule_delayed_work(&user->delay_work,
> +				msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL));
> +	mutex_unlock(&xe->work_period.lock);
> +}
> +
> +static void xe_work_period_worker(struct work_struct *work)
> +{
> +	struct xe_user *user = container_of(work, struct xe_user, delay_work.work);
> +	struct xe_device *xe = user->xe;
> +	struct xe_file *xef;
> +	struct xe_exec_queue *q;
> +
> +	/*
> +	 * The GPU work period event requires the following parameters
> +	 *
> +	 * gpuid:           GPU index in case the platform has more than one GPU
> +	 * uid:             user id of the app
> +	 * start_time:      start time for the sampling period in nanosecs
> +	 * end_time:        end time for the sampling period in nanosecs
> +	 * active_duration: Total runtime in nanosecs for this uid in
> +	 *                  the current sampling period.
> +	 */
> +	u32 gpuid = 0, uid = user->uid, id = user->id;
> +	u64 start_time, end_time, active_duration;
> +	u64 last_active_duration, last_timestamp;
> +	unsigned long i;
> +
> +	mutex_lock(&user->lock);
> +
> +	// Save the last recorded active duration and timestamp
> +	last_active_duration = user->active_duration_ns;
> +	last_timestamp = user->last_timestamp_ns;
> +
> +	if (xe_pm_runtime_get_if_active(xe)) {
> +
> +		list_for_each_entry(xef, &user->filelist, user_link) {
> +
> +			wait_var_event(&xef->exec_queue.pending_removal,
> +			!atomic_read(&xef->exec_queue.pending_removal));
> +
> +			/* Accumulate all the exec queues from this file */
> +			mutex_lock(&xef->exec_queue.lock);
> +			xa_for_each(&xef->exec_queue.xa, i, q) {
> +				xe_exec_queue_get(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +
> +				xe_exec_queue_update_run_ticks(q);
> +
> +				mutex_lock(&xef->exec_queue.lock);
> +				xe_exec_queue_put(q);
> +			}
> +			mutex_unlock(&xef->exec_queue.lock);
> +			user->active_duration_ns += xef->active_duration_ns;
> +		}
> +
> +		xe_pm_runtime_put(xe);
> +
> +		start_time = last_timestamp + 1;
> +		end_time = ktime_get_raw_ns();
> +		active_duration = user->active_duration_ns - last_active_duration;
> +		trace_gpu_work_period(gpuid, uid, start_time, end_time, active_duration);
> +		user->last_timestamp_ns = end_time;
> +		xe_user_put(user);
> +	}
> +
> +	mutex_unlock(&user->lock);
>  
> +	schedule_next_work(xe, id);
> +}
>  
>  /**
>   * xe_user_alloc() - Allocate xe user
> @@ -71,9 +153,9 @@ static struct xe_user *xe_user_alloc(void)
>  		return NULL;
>  
>  	kref_init(&user->refcount);
> -	mutex_init(&user->filelist_lock);
> +	mutex_init(&user->lock);
>  	INIT_LIST_HEAD(&user->filelist);
> -	INIT_WORK(&user->work, work_period_worker);
> +	INIT_DELAYED_WORK(&user->delay_work, xe_work_period_worker);
>  	return user;
>  }
>  
> @@ -153,12 +235,49 @@ int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid)
>  
>  		user->id = idx;
>  		drm_dev_get(&xe->drm);
> +
> +		xe_user_get(user);
> +		if (!schedule_delayed_work(&user->delay_work,
> +					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> +			xe_user_put(user);
>  	}
>  
> -	mutex_lock(&user->filelist_lock);
> +	mutex_lock(&user->lock);
>  	list_add(&xef->user_link, &user->filelist);
> -	mutex_unlock(&user->filelist_lock);
> +	mutex_unlock(&user->lock);
>  	xef->user = user;
>  
>  	return 0;
>  }
> +
> +void xe_user_cancel_workers(struct xe_device *xe)
> +{
> +	struct xe_user *user = NULL;
> +	unsigned long i = 0;
> +
> +	mutex_lock(&xe->work_period.lock);
> +	xa_for_each(&xe->work_period.users, i, user) {
> +		if (user && xe_user_get_unless_zero(user)) {
> +			cancel_delayed_work_sync(&user->delay_work);
> +			xe_user_put(user);


Here’s where this looks problematic:

- Calling cancel_delayed_work_sync while holding a lock creates a locking
  chain between work_period.lock and every lock acquired in
  &user->delay_work, which is a pretty risky thing to do.

- __xe_user_free acquires xe->work_period.lock, so if xe_user_put is the 
  final reference drop, it could lead to a deadlock.

At a minimum, you need to release xe->work_period.lock inside the if
statement. Ideally, you should reconsider the entire locking strategy.

Matt

> +		}
> +	}
> +	mutex_unlock(&xe->work_period.lock);
> +}
> +
> +void xe_user_resume_workers(struct xe_device *xe)
> +{
> +	struct xe_user *user = NULL;
> +	unsigned long i = 0;
> +
> +	mutex_lock(&xe->work_period.lock);
> +	xa_for_each(&xe->work_period.users, i, user) {
> +		if (user && xe_user_get_unless_zero(user)) {
> +			if (!schedule_delayed_work(&user->delay_work,
> +					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> +				xe_user_put(user);
> +		}
> +	}
> +	mutex_unlock(&xe->work_period.lock);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> index 341200c55509..55016ba189f1 100644
> --- a/drivers/gpu/drm/xe/xe_user.h
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -9,6 +9,8 @@
>  #include "xe_device.h"
>  
>  
> +#define XE_WORK_PERIOD_INTERVAL 500
> +
>  /**
>   * struct xe_user - xe user structure
>   *
> @@ -28,9 +30,9 @@ struct xe_user {
>  	struct xe_device *xe;
>  
>  	/**
> -	 * @filelist_lock: lock protecting the filelist
> +	 * @filelist_lock: lock protecting this structure
>  	 */
> -	struct mutex filelist_lock;
> +	struct mutex lock;
>  
>  	/**
>  	 * @filelist: list of xe files belonging to this xe user
> @@ -41,7 +43,7 @@ struct xe_user {
>  	 * @work: work to emit the gpu work period event for this
>  	 * xe user
>  	 */
> -	struct work_struct work;
> +	struct delayed_work delay_work;
>  
>  	/**
>  	 * @id: index of this user into the xe device::users xarray
> @@ -68,6 +70,17 @@ struct xe_user {
>  
>  int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
>  
> +void xe_user_cancel_workers(struct xe_device *xe);
> +
> +void xe_user_resume_workers(struct xe_device *xe);
> +
> +static inline struct xe_user *
> +xe_user_get_unless_zero(struct xe_user *user)
> +{
> +	if (kref_get_unless_zero(&user->refcount))
> +		return user;
> +	return NULL;
> +}
>  
>  static inline struct xe_user *
>  xe_user_get(struct xe_user *user)
> -- 
> 2.49.0
> 
