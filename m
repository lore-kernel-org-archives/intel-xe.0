Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4131B606A332
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KYIepAj5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=R2jk479q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050A2112B53;
	Fri, 20 Nov 2026 15:56:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6A9112B53
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795190175; x=1826726175;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SSafKF6YQnd/rudToiQhCyY0X1h5foZ4BLLodleGQBk=;
 b=KYIepAj5wSgzmcCG0X6lZSXtM51KwNV1+iiyrjv9CvPqP9V0fMJ3K66I
 Os5rH0NBOm2qM6U7my8hb3o1O0P+nMCP8YcVbDxHqpm1NO5b7ZCzxqsWz
 V98jxEdMdBSX5urzEOK5P4iCgLpVkZbQlNZGoXzbxKANEd9o5Iva+7GM2
 7ywaB8upowW/YeF4EvXkan7YvM/qOFsZp93FnLnBjNODX5f+KppsaJ9xN
 qOQw3iddR0X1zKbRZ7rMXw5k3be3XKJmCwM4jnuD1X5J5wB3Pt3uvxuDF
 /Xmlw7TVmmNTxFvus0TEil/MPf/HOjZQn5y32gm+Qjk177XkS9LbwmEf5 g==;
X-CSE-ConnectionGUID: fyJuFu2iQTSVxqaIAunG2Q==
X-CSE-MsgGUID: 43XFDCk0RlaUiy2eRF0SjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4062745"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4062745"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:56:14 -0800
X-CSE-ConnectionGUID: HPpkl+mxSIu9XTwhcsJ7jQ==
X-CSE-MsgGUID: Q6wZxzpxSSyCRny7ckVc9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11058978"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:56:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:56:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 07:56:13 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:56:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baStgkvYXg5cTNUySsCLvxdS/ZkxYpXVU4tWLdx0nJ3n4AI6s4HJl+012QAA/hVk24Nop3H+Tl3Znj0KEzQO5wzC7LIA7RHGOMBztGc50MPPlZaNX3Dzj+wttQDxodxBtjs94JwnMb3YXrlANKTpKtMuvz3DutyW1yyrYlV0jUGv9t3Qjqyk6A87wjOvdi4tnSl/GFp54jOBOVcO7leqDvyRxSBRoSlAYKDSjGuTYw5zDVriAS9OJQdtlubRTd6Yp2vlZMmKpOfJP65q9c8bSq+WOU0TSGw5DyHCxflr/XfynOM1LO9jirEJ2vnrE04dvviBgcC+NzRsSNYnwwbHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgEEuy4AgwiejI7XallId8+0E3NFGHDYWe2fk7Gwp4k=;
 b=Hl0tFTorXO3GmO/5+dqfl94lBi6XsS/rC2m4LpxxNTjzSrqAAHKzXdwZSqnuzI4CWLN/Z2PUAwCIAy12M481oJhq1rrMt5N7rJZIt/K4UcnpnpUyhGC9Z0ijbSphNJsQ8jSTaxWz19igUyWq//j+SdQ3sviJxyXxhSDXbg3SsKpODjFD41ELc/1IxsMAm5gl3gmkUKcT4PYTJtJVCLiDXAD0ldacFLfiUW3WiydecS3ZxCDvHNxLZnuOi4YWxbgtfOCdBKUsn4AceD3IaOdcM5Roz92Ot0EVirt4HKMmMy2fw5lfcJ+HauOZcT0CQryWDolnZNPSwZd3508qSLZntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgEEuy4AgwiejI7XallId8+0E3NFGHDYWe2fk7Gwp4k=;
 b=R2jk479qe9a/T4TIfoiAKwiX79jC+htaRhkx4bdaSRSk6WBJ7Fx3JaWX5Dw1fRv0T4zbh+el9T5fIDy33fviN9t9oUc+77kHnGjp3ukkNCWJ9SwU89SBVnoj4EnXyWOb3mhIBqZmfqEIUCFWOGWTaEp4yL7XOUWgbwBzztWQT9s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CO1PR11MB4801.namprd11.prod.outlook.com
 (2603:10b6:303:9c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 15:56:10 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 15:56:10 +0000
Message-ID: <d2e45fb6-c297-4818-a4b8-80387eac22f1@intel.com>
Date: Fri, 20 Nov 2026 21:26:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/xe: Add a userptr repin timeout sysfs attribute
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
 <20261120-userptr-repin-v2-4-65e1f6e582ef@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261120-userptr-repin-v2-4-65e1f6e582ef@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CO1PR11MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 416620a4-77fb-48c0-9b0e-08df471ecbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|3023799007|4143699003|56012099006|11063799006|261022105027099003|5023799004|261026121527099003|261026140227099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: SyoBnk5QuE9m7qbs48bOqxcV5lhRJfZ59BQHT2oLb1T4P8JYYzJzr5uy6TyoxZZGF2kj6Kh+uP6kyZDfg98n3wAxLwB7gD57bdU/Xp4jX7v9fiYFWFd1TnZm9cfVZ/wSOVHFjXyjLspd5kmvZSAls8uBqJ60FOuZSKHoGRlAbExk5SxcgkbiqFqtiNZTX/m/6kqPj3Kj1O74+gkTCvvLTrMTTAm/i+AyAIVNjLU1AnRgNJHi9XuFbIki/nQzPN2yUyoFtjfG4Ot9CPYrx6Nmee9+eiwsmco7qqWTF8Q1IXahdFOkM0K+NhnkBfDIt0WtGMDG0fGDiB64NRxg3DSrJLW4Ev/jg2rM3LSPmn0JxIN69J/DNefsz0wedgrlI0/aTECpd8iTp6EBd4jek+eDXQEPDZk//5ZGpc17VncURuG3W0BNNUwxdaVkrzM+FwDa9nJPZjt4QOP2qVu0QR532n1FWu7I9fSKComJDrSSFX4AUsZYE9mEDKBaUQxkuuXuVXUxMTfXBRCQjL0xnaroEfa2KQv5N/PEmtbjIxA4QJNCwHyT1v8OvBlAmpRpSeL7vltM/Ofl/McwTNzQki4qRe4xyIRjpjvZc7Yt6rPl75RhAw9WONO7+OaKHm6y+5ylBDF7MVpTC8dxrkSyRmjUfkylFoY6ibI6ylSwLDp7Kj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006)(261022105027099003)(5023799004)(261026121527099003)(261026140227099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHZyV1NSazlzS3BYNnhhdjdsM3V1R3o0OFRSb0Ixc0dIZlV4a2hNa3FQd0Zy?=
 =?utf-8?B?bjY3cG9ybjBXaENFTnlrQ0NqT25aMHROWHMxaDRRVTg4Kzh1SFZCdldSRUtv?=
 =?utf-8?B?TUw3N3FRMlRnRjVTcVhaUlMrc3NJYXlFcDVxN2dVNmM3bHUrQldYc1V5R1dz?=
 =?utf-8?B?RHdIU2oxZ1hTUEd5c0tJMWZybUp4elp4NG16QjYyUTNsUmRKTDlBcUhKZUtu?=
 =?utf-8?B?Qk5nRHNYMVlHUzM5TEsySWdybWxIZ0FRaURZUkFSeFo2TENhL1kwRjB2dUNu?=
 =?utf-8?B?Z3VTZjV5cFdxQlhNWDlSZml5M3kxM0M2YjBQZlZWY1h5Y2ZoZ3RMTHFoY2hB?=
 =?utf-8?B?RVp5UU1CYlZLdHpnN3pqaDBEZmpsQkVPd0QyZ1RzMDZ6MEswTjIzS3kreVhF?=
 =?utf-8?B?dUpxVjk5VVVrbmh6dFNKdnM0S2N6OUFjSy9ibTBwTVB5aE55WVJzZ3d2eEMy?=
 =?utf-8?B?RDhOUEk5dmJSVFhoSCt3OGpsZERFTlJwWVlPb3VMckxwR253V0FDcE94RjNr?=
 =?utf-8?B?S3dSMXM3RXVtUmU2elAwenRCNjRkOUlML0lHVndLdkZ3VG4zVmNYY3ZBb09r?=
 =?utf-8?B?RGJ3aFJTOUgyNEIycmNsMmJ0S3pVTlVMNmxWQ1ZLeTBuU01iSEkzY3lCYkJa?=
 =?utf-8?B?YzVDVnZ1emtoeE9EOG1hbGlkVmV1U3pnTkRFMlNjMjRMRm5rOXJPS0R3TXEv?=
 =?utf-8?B?endxbHdVYm1Lb1BvQWJMYUhxNng4TTZIT2hSdVNFUnRJSmZuajRjRm9rZm1n?=
 =?utf-8?B?T0xmY1pOSnFYM2xtdGtqd2k1aW5nVmIvdndKeDZQcWNQVENINXliNVNHclFh?=
 =?utf-8?B?dCs0TEpFT05HN09yb0Q3UlFkQS9HUCttbjFsaEJJV1F6WGRCclcrdlZmdE9K?=
 =?utf-8?B?VkVLNjBYMTlCeWNlWEhWZUZwUU5oVmNZMFZSV01YS0hTNVpqR3hVU3NjaDRt?=
 =?utf-8?B?QXpIQ3FHcmNIK3pJcVliTFF2VXZzdFE3V1JkbHMyaE1pNDJTZk1JU29INndQ?=
 =?utf-8?B?dUFxMTIrVXFWM0xrRXBtYjdHbERTS05NWEdUc2Z4b0RocXhMLzE0VVBlUk16?=
 =?utf-8?B?cWdPS0FkSG1yVVcwS1RBU1kvMVJXMWpPSjNKeTR1c0MzSFA1VjZkUkY4U0hs?=
 =?utf-8?B?dXBrM2hmU2R6K3RtM2liMWc2eVpPdG9nM2RUOWZxSW9qM1FWdmpobHIxUDgw?=
 =?utf-8?B?VlJDWThMTWZPMnM0dC81WkY4cnVhZUlpNzRLcVZSSHFsNm0wdjJMNWo4c1JH?=
 =?utf-8?B?ZDFpR1krM291aUs0OHQ5MkxhRVdkdVVMU05MSjcvdHNDK2VWSjlmUldrR2N2?=
 =?utf-8?B?RVEwSnhYcmU5RzFybDJYMGdYNXJkVGcxcHNuR2VmeU5MbXI5QU1kMkM5U3R1?=
 =?utf-8?B?aWR1RCtRaWFmRDhFTVVHQVUyYmJjT3JqYmtpaTk3VktJRk9jR09ETDViZnRh?=
 =?utf-8?B?TVQvZVpLd1QxV1c0MlJYYnJTRmdtWjNpNms4L240S0N0VWFjeGl6a0ZreXFt?=
 =?utf-8?B?WmN3RXMyZEFqTXBNeGt0VVFpMzJmeW8zeGdTc2wwbW1tbWhpM2JsT1pzR3dw?=
 =?utf-8?B?eG5BbkV3aW9lMmlWcDUzRmgySm80ekhoSFBZUms1K3VWQTNkeFpDU3BJSWZu?=
 =?utf-8?B?N2xsclNBQmVxR083OGFkSEhmU3JJQTA2bXk4TnRrWmhsUjBqV29HY1JoSFdl?=
 =?utf-8?B?VnFrcjFVaWp5Z0FVRzJUYTRvUWVDZC9CcndabDRGTjFVMUM5aHlCWHBhQ3Jo?=
 =?utf-8?B?NFJ5WTE2aXBDd2hRbVdPOHlzMDl2Zlh0ZFBiajVYM0hxV3ZoVWhzZnFiN2Fw?=
 =?utf-8?B?RGVxd1lIQ056Z0JiSjNKL1F6czBTc1g5MUVWM0IwRWZHODlqdGpvMDlabXRt?=
 =?utf-8?B?Q2xua1l0V3A5TjRyb1oxRVRkRVlNcjMvT3lNbUxTdE1EeXZUL256eFpUaHQw?=
 =?utf-8?B?OHZLb0V3L2N3RlRxRjBSTTY2TVd4Nk1rQ3BsQUNUbFZPMDhyS2VTZGZVbnM4?=
 =?utf-8?B?Z2hhcVVRRlJIN3ppeHBvOXhjWUtsMHpRTnNNcFJaV0tmWGlCK3E5N1BDZDZ1?=
 =?utf-8?B?Rkd0cTVEMmhDRGtlK2w4TFBWOE1Ya2UvYWd3aU9penBRdVBBWjhXS2tyamFG?=
 =?utf-8?B?MjBNcnZwNUU5Q3E1VXovN1JuRmNESURKME1HbGx2MVkyMitFYzFuZWs0MWlv?=
 =?utf-8?B?OGJOZHFGcTk4Kys0S05yd0xJd2pkd0lEdWFJd3RKMzhnWE1XOWpWVVY1emth?=
 =?utf-8?B?QlNhUUh0R1l2L1B0ZmFENUVOWWJUR2dXRE02QjgzRG9KN2hkdFFOR3ZTWHhL?=
 =?utf-8?B?V1U0bmR1VmhFVXlOSlN6K0xKN2tWMzBFZlY1UmROamJsNERURUdwK2VuZE94?=
 =?utf-8?Q?eqxHWLi6Y8Z+qw3Q=3D?=
X-Exchange-RoutingPolicyChecked: laxoYzKmfR6QX2P9MgVrUoaKizTc/TG+ecfNdj37kU4hHS6bwH6BSPSSjmBOc86hklY8u0bdZha7FxzkED9hxZpdBsxrG94jF8XB5wRMA64KdewUgsTeeBR2bUKnx/YNLsWPruCeI1o77+F186btdTMHBDrks7/v4e/5GrWAeY3TTc3gqSMCSckCsqYLtLbwpvR5xdiEBQ3k2Hgp4lTlLZDoDK0Voa0Quas+LmAGM7u0Z0Hk06UDZJjnyrAl+HOaEQoQzLDzbbrst/x6ZDDmN58CdGLHc1zoONCc9TNRnmEgGJAVDTYDBgq9s3LWM1vtknYRPYm6AL72YgYRX5kitg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 416620a4-77fb-48c0-9b0e-08df471ecbc9
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 15:56:10.5559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qY/+KdiGujrt4GZLD7x90QMNMgjJAfFLrJ4gffA3jkPQ5GlFkuDSE1xmFlspDqNlRYA7JrnFoWhrA+3X5sBhGa+03ghUkq8YQZVtdyA42JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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


On 20-11-2026 18:32, Matthew Auld wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Add a per-device sysfs attribute, userptr_repin_timeout_ms, to be used
> to bound the overall time a userptr repin is retried when the CPU
> mappings keep changing during the repin. The default is 10000 ms on
> single-node systems and 30000 ms on multi-node NUMA systems, and zero
> means retry indefinitely. The value can be changed at any time and is
> read each time the timeout is checked.
>
> v2 (Matt):
> - Reject values above INT_MAX (or reaching MAX_JIFFY_OFFSET) with
>    -EINVAL in userptr_repin_timeout_ms_store() so msecs_to_jiffies() does
>    not treat them as an infinite timeout.
> - Lower the default from 100000 ms to 10000 ms on single-node systems
>    and 30000 ms on multi-node NUMA systems (Himal).
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Co-developed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |  5 ++++
>   drivers/gpu/drm/xe/xe_device.h       |  3 ++
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 57 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  8 +++++
>   4 files changed, 73 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f5a581d39c96..f0c88d3297f9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -8,6 +8,7 @@
>   #include <linux/aperture.h>
>   #include <linux/delay.h>
>   #include <linux/error-injection.h>
> +#include <linux/nodemask.h>
>   #include <linux/units.h>
>   
>   #include <drm/drm_client.h>
> @@ -439,6 +440,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>   	if (err)
>   		return ERR_PTR(err);
>   
> +	xe->userptr_repin_timeout_ms = num_online_nodes() > 1 ?
> +		XE_USERPTR_REPIN_TIMEOUT_MS_NUMA_DEFAULT :
> +		XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT;
> +
>   	return xe;
>   }
>   ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 7a7632e2d56b..6b1e48369bdd 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -43,6 +43,9 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>   	return container_of(ttm, struct xe_device, ttm);
>   }
>   
> +#define XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT		10000
> +#define XE_USERPTR_REPIN_TIMEOUT_MS_NUMA_DEFAULT	30000
> +
>   struct xe_device *xe_device_create(struct pci_dev *pdev);
>   int xe_device_init_early(struct xe_device *xe);
>   int xe_device_probe_early(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index ff5d25dd867c..f6275e74eb31 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -4,7 +4,9 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/jiffies.h>
>   #include <linux/kobject.h>
> +#include <linux/limits.h>
>   #include <linux/pci.h>
>   #include <linux/sysfs.h>
>   
> @@ -38,6 +40,16 @@
>    * reclaimed by the shrinker. Higher values reduce reclaim pressure on
>    * non-purgeable buffer objects. Valid values are 1 to 64. Defaults to
>    * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS.
> + *
> + * userptr_repin_timeout_ms - Report/change the overall time, in
> + * milliseconds, a userptr repin is retried, with all locks dropped between
> + * the attempts, when the CPU mappings keep changing during the repin. The
> + * time is measured from the first repin attempt after an invalidation. When
> + * it expires the repin fails with -EBUSY. Zero means retry indefinitely.
> + * Valid values are 0 to INT_MAX (capped by MAX_JIFFY_OFFSET). The value is
> + * read each time the timeout is checked, so a change takes effect
> + * immediately. Defaults to 10000 on single-node systems and 30000 on
> + * multi-node NUMA systems.
>    */
>   
>   static ssize_t
> @@ -340,6 +352,47 @@ static const struct attribute_group shrinker_attr_group = {
>   	.attrs = shrinker_attrs,
>   };
>   
> +static ssize_t
> +userptr_repin_timeout_ms_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +
> +	return sysfs_emit(buf, "%u\n", READ_ONCE(xe->userptr_repin_timeout_ms));
> +}
> +
> +static ssize_t
> +userptr_repin_timeout_ms_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > INT_MAX || msecs_to_jiffies(val) >= MAX_JIFFY_OFFSET)
> +		return -EINVAL;
> +
> +	WRITE_ONCE(xe->userptr_repin_timeout_ms, val);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(userptr_repin_timeout_ms);
> +
> +static struct attribute *userptr_attrs[] = {
> +	&dev_attr_userptr_repin_timeout_ms.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group userptr_attr_group = {
> +	.attrs = userptr_attrs,
> +};
> +
>   int xe_device_sysfs_init(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
> @@ -349,6 +402,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> +	ret = devm_device_add_group(dev, &userptr_attr_group);
> +	if (ret)
> +		return ret;
> +
>   	if (xe->d3cold.capable) {
>   		ret = devm_device_add_group(dev, &vram_attr_group);
>   		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f2a31949073..fc80cd2c766e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -437,6 +437,14 @@ struct xe_device {
>   		u16 idx[__XE_CACHE_LEVEL_COUNT];
>   	} pat;
>   
> +	/**
> +	 * @userptr_repin_timeout_ms: Overall time in milliseconds a userptr
> +	 * repin is retried before failing with -EBUSY. Zero means retry
> +	 * indefinitely. Accessed with READ_ONCE() / WRITE_ONCE() and tunable
> +	 * through sysfs.
> +	 */
> +	u32 userptr_repin_timeout_ms;
> +


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	/** @d3cold: Encapsulate d3cold related stuff */
>   	struct {
>   		/** @d3cold.capable: Indicates if root port is d3cold capable */
>
