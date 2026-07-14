Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06179C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16FE10E06C;
	Tue, 14 Jul 2026 10:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaYezwVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD5010E06C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784024842; x=1815560842;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=824TSGHax79RuNeefa/I6JzekLXQFXN/1JRDOBonTDg=;
 b=FaYezwVyQmH5L7YUXXrAD8XOzMVWJwCE/raaDatIJhAoKU8tcPH4Q4Ro
 /6/29e1ptcn+EFrRWVX0OxRivHrCkBziVJKii/f0Q1InYI9RcHmW/uZgU
 SLng7znAfGWRZOtDZCxNg49xPjhciFjdqQ+9FBvQ0kev8hgzvRbpXbtTh
 Ekky4lW0nfKb5yX+a7zsMyNoftWmDwHv09vUsYaBttP9zKhsqzxSnReg1
 0C7h2cXLrLPeNSN6pCIJATymCNx6UDTqHZIGS5yjuGQyxrnHYusR+s5ko
 2SJz32lm0BS3nOqE++jzFYK9kRp0Urmj9GTmx6juFaiebwfF2HGT1RTX8 Q==;
X-CSE-ConnectionGUID: ryrgipjTRnStXuC7VrzeQA==
X-CSE-MsgGUID: QMF1yiXbREKRGBSDbhTaMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="107436103"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="107436103"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:27:21 -0700
X-CSE-ConnectionGUID: uvdGqe0HQhiC2wwcrSJx4Q==
X-CSE-MsgGUID: CHer98wRQmCkWqme58Evpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="251404959"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:27:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 03:27:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 03:27:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 03:27:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peUVPal2WSucrWz8MsgQyd2ki9ZQ2zCb6LiHBQOazaXQ4mn5sRC3WybJJDsZzxDG+VL0EZzuMCJT5zHYc6YNU+uBeOazTGHTDZBDk5KO5np+dMTeHUsDSb7t/LB3s3dewRWWouBl44X9c4ySOWke3AizUeh2yAI3sFgAT7QKU0pPGSuG0X9nrexB6S+kiOJ42Iu5RSKI8rLrC7CkJwOJR/9pC5QZdyhBKruaNvL9wyciVJZi4+XVcxN64GhpYTiqeJVXfieseOxnMGjF6g6UjMCEEYhun0PsUPNL6YJdBASfIJMoDqzbR1Tgu0wb08vQsNri0QKuzA2guzhxxy+AgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgYnxIz296NtPjvkjzxWYQMp6pM7ISNhbwe9B4i8yZY=;
 b=hT4+BxzWMZPjVQlIGla2ZXkQ5b+OL83SgztMaTXWXir/s+U/sELM5NzMMeoe/Y7CpP/OlJJrZ2Y6BfehyB/kp/fFSLw0vImrNuXtnphPZQOpjgAMIxadyL/kGp8f2LfzQbz/1NNYphi8hyn7u8CvaL29MVp1w87Z5NdZA2U2asFCDNTOb7/+0qzTYINzYVj+352q1xvsDbEmCBeyQ43T2BEwzXj+LpXXuj2qlV/i1UvXmRXKxkL5G5/6qKLKltLn5KkmuTlXIC0caGQeplgP2pKMIoumN/VgKwscQm8iXw3dv8vQaOd46c48ljqeaoo+04pmEDQoODAK32tnNYkKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DSWPR11MB9560.namprd11.prod.outlook.com (2603:10b6:8:36d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 10:27:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 10:27:18 +0000
Message-ID: <699bf9dd-db68-4d72-b778-d9d9fb7b080b@intel.com>
Date: Tue, 14 Jul 2026 12:27:14 +0200
User-Agent: Mozilla Thunderbird
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260710122007.3329932-1-satyanarayana.k.v.p@intel.com>
 <20260710122007.3329932-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
In-Reply-To: <20260710122007.3329932-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B7D.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::605) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DSWPR11MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbcd4f6-083a-4a1f-3c4b-08dee1927b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qJL+Yk697rUt+e3RITz/3MF/SBvxiKkQRqs23h6mC1zwOKi2a80UeaSMmM2bGJKWurmY4+SZRmQ67TOFR7cAgfTc8dHy7+Vn/vUig6sW3m7NW02YcCHuHCHMGsPWbiU3qdoy+8NCBqI8yAscK4HXN9z/q3ONHrISpmDVkzoqwVksdhTFY9lCeTj4P7bkx4Q3KFl4H7lm9x6I35tQLZm20p/1h4K4tfB7CnKAlw/8+FqJN5c+vyPQETblgwJtTPe/aJc/pAGA7Xsg7ITGJLiAHWstDCi/NTEUi0BefStpSGUlcFlLrbl1alQ1MzAMxfaf+cEMoR3fMZ+k01MN0vpYNsf7t6rl37NBPDJRKMnrxtk18au2Env8q+IlO0OInbZJQCdvdPG6OCuQv8IoCJIvxFE0/oRQd94+1JdZu+zTMxioMDcybXx7Z+22mPpzhWLlKBi2xM9Efj7p+nDypK0rFMSDmWngT39KpaMwQjJEEnHNWI3OSgjhni6Lt+8hOpz0r2kalolmyrmBHQE3PVVSOz83BfX5jgJxoBg3w6/aiC32ARN0w4XjQA5tjBTlGbi2CDD5/GR5IN4vOQ2JeVOljmwHzG9shugdLt9yfLX5SBS8mpm8bcU/+jH0Xf2QijEn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTliclVGUWxVTXE0bFNoN0c2L0R2Q3pWOGN0SWFMeHVybEF6bmVkR0ZldjhJ?=
 =?utf-8?B?YWQrdVpoOElnNk5xcG80ZWwzaDByUFJYZ0t6U09xTlMvL1oyVFNwc3ZMY1dl?=
 =?utf-8?B?elFoUmRRNkk1Y3NwTjR3Zy95M3A2OFRXblI2L05pY3JsME5wZWNkcGcxdENS?=
 =?utf-8?B?YmgzTEgwUlNmaFFaTkY1MG5IMmtyY1dMWjJ0dmk3OGVxYkFxbU5wQUhhUEtR?=
 =?utf-8?B?Sk9yQldvankySmdrZDdxWXNBQi9LYUVYWjVkK215ODZ4S3NtZWtjWVNRd2pa?=
 =?utf-8?B?OTFYOE81NjdxUDhHWEhTSEdxbE41V2RiN05sdDZib1grL0JmWHdxRTI4MTBG?=
 =?utf-8?B?QXlhb2VoWWJQMEU3OGVkck92Z2J6eUE5NG02NGVPTDNqM2UrU2pRNHBrMnpj?=
 =?utf-8?B?d1JXK3ZxbXFhbVBRemZacVlwd0RUcDI3dUs5bU1XUThkeUM2SDZVamxyaGMy?=
 =?utf-8?B?ellEcGRPd29vSUtVOExwTkd3d2hyYkRhUWpYV3pmNmFRdzNFZlgwZmdFb2dn?=
 =?utf-8?B?dkZvTjZlYU9vOURRTkpOeEh2RHZQbWNiNTlOYzc2b0pnTDRiSkhxMkpBeUgz?=
 =?utf-8?B?NFArR2t6S1ZoVkRCcW9acXl0NlM0amVyakg4Rkp4cG9US2hieS9WdHRLYjh3?=
 =?utf-8?B?NkNnaHpnOEZTMGN5aEFVRHhQcXd1b01sSGx2LzA2VjRRVVZkV0xnY3dxaW1r?=
 =?utf-8?B?eWVyNVlPK214OXhra1hiZGRsZ28wUlJ5dmp3dkIzSmw4V094eUNTVmhQL1RH?=
 =?utf-8?B?ZHZjeU1uWlcrZTJOelN2V09BS1NPK1p0UEU3SmVCS2Y0R3JTSklvYVpZRE43?=
 =?utf-8?B?RjRKejVPeUx2QzhVZ0piUm1qcEJ5SkZkKzBIQ2doT0RXUktwaU54Sk1MV3l4?=
 =?utf-8?B?L2wyV2FkZ3FiWVd6YjJ6L3dLK1U4bXRQV29aOFV0SjBpcDhmUU9URVE2Ri9o?=
 =?utf-8?B?cDBrYStCMGVRVk1HSG9Nd3BVUW5YSGdhUmhlWWwvcDhRZWxrUmQvUkNnTXU1?=
 =?utf-8?B?RWIzbnZ1T0xmQkFqU3ZlNHRnUnh1Y0gxNmtHV1F1Q0JPUmhFWjlPNEpHSGJp?=
 =?utf-8?B?eS9nMmREWnozNzFPR3htZXJUa0hRWHcwVmMvcDR2Yy84dEdLNHUvNzhIekpK?=
 =?utf-8?B?bjF5VzFMSHBrS1pEUXByREJicXdETHU5bU0rRU5ML2Zta21iV1hkNXFoMHIw?=
 =?utf-8?B?NnMweHZYUWJkRVJGUVZCMGFEY2VGQnp1Qi9KLzNEQy92aDVNZlNvOTM2S1FB?=
 =?utf-8?B?UXRvc2dWY3VmRkZZUDUvMm5NblNIMWFQdks1Qys1N3JuTGRITnY5Ly9KQU9F?=
 =?utf-8?B?b3FhMWlsS3JCSWgxUEpVdTFac0haNnFCWnd6Mll0TmhnbGg3Z3p5MnFIZUJh?=
 =?utf-8?B?a2k2MVk4M2krNmRRRTNzazE5YmtDY2FSUDlKWFJiNVdzWG01VzROc0hUWXky?=
 =?utf-8?B?YVNpbXlObDBEQW1RMU1mOVkzRTZxaWxXYWFkRDZvN0NzOXdkUnp6dWNBbk5E?=
 =?utf-8?B?Y3BHWThIampSb1g3UlQ5aDV5dU53VWZQNUw3S3lVb3lBRFJFb1RsMDlzb3N4?=
 =?utf-8?B?N2QwV3M4bkhvZWNONnBpTWpjYjhGVm5NYjQwMkJlMCszR1F1V1U2OXhmc2J1?=
 =?utf-8?B?bXFxellBUUpKRzlJcjNqOXU0WVZjMFg5OEQrM0NxVGgzTjhVcDZFN21MaFln?=
 =?utf-8?B?dFl2SGF0bWVyeVJONFZzSnBZRjQvaXB1TlF0c2NvN25WaE5WemNubXZVcGR0?=
 =?utf-8?B?L0Y0eWg1WXJYRnJjVUpVTXlKYlpISENDSXRkeHRjVXBjUTRSTDBsWW51ZU9k?=
 =?utf-8?B?dWZ6RkliQXl0UEhOcmFKNjRLWUVDakIyRy93aVZyTkE3blZUdnFUNlhRMnlF?=
 =?utf-8?B?OHNIdEk1QU4ybTVIck1SSkxMM01XQlhQWGtLNVhCdlhBaDhOcHE2WVZ0Nmdm?=
 =?utf-8?B?dUFNTU1qNnUxeDJqZms3TWtTRUhadDl3SjNhY0pUMUpCL21nN0pMbC9pakNX?=
 =?utf-8?B?dGxJeDFjK2ZQc094RVVYSGpWRVlWT0lRQ25jQVdlczJiWStxaG9ldkVXbUhn?=
 =?utf-8?B?MlJKekk1dFVxV09DVU9pcWNySnI4UURnU2Vid2cxREVLdkRmMTVHNTUxb2tE?=
 =?utf-8?B?aHhEc0ErTmpaQ2hqM0FiZGhTY2tSc3N6VXA0c1hsa01uZHNJekVLM1JZY1N5?=
 =?utf-8?B?bGNPYU1BZitSSmh2U09YSWM5WGNYenY3cFZremlWalZlSW5NVlZhRlRSVjd0?=
 =?utf-8?B?aFBoZTc5NU9jdnE3dTcyUmMrdWF4dFJNRFpmTlROQWQvT0lUb1hWakkyUWpH?=
 =?utf-8?B?ckF5bXNEek9DZzJRY1F1Q3RqM016SmJrcHBTMjNacU1ybmFvc2VGaDQrL08v?=
 =?utf-8?Q?lzzCj47WhbPkvYlE=3D?=
X-Exchange-RoutingPolicyChecked: Oc2404SPIsSidxJuLrkuj0re6J2xKUIhOX3///eqCa4VsfiP1wHNKR6a+IrGvUKjZMUEnr9xMBwT71wqQQ41v3aAueo+5Khrc4GTzxxlMZmBmrycfM9FFQlIZlgHVF9cDniNdnKGHb6YJXNe18FadMLgrUz/Ceq3RqVoJvM250g1NiKuAA92BJKI3wpW7GLcRosUOUqo/SKtnxGIX9hPXiGh7oW9BCjGHl0hlRNssMtayQQasURJgq7quoydzgm8ME5k0QDlLAZ9N9Zk6g1iY93RNiJlki8DuoIPItOehmQTfml8qkuTJgIRp1ygHr/vKop267P1N8/sMfFa6x81qg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbcd4f6-083a-4a1f-3c4b-08dee1927b16
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:27:18.1295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uy8Nx/TJQZJDw2bED9hokq35MMX3/qR8gz73C8+WK0sy/jd+fFu3z/L1rZn4l0xZ7aiNt9JproOZluvbfP6qf6Hq8UocpshG0QwQLMbzoys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9560
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



On 7/10/2026 2:19 PM, Satyanarayana K V P wrote:
> VF relies on the PF to provide a valid hardware configuration via GuC
> KLV responses. In unlikely event of PF malfunction or misconfiguration,
> a VF may receive incomplete, zero, or out-of-range values for its
> submission contexts, doorbells, LMEM, or GGTT assignment.
> 
> Add KUnit test cases that use the guc_action_query_single_klv() static
> stub to inject bad KLV responses and verify that VF can return a negative
> error code rather than silently accepting the invalid configuration.
> 
> The following error scenarios are covered per resource:
> 
>   Contexts : zero, less-by-4K, invalid , one, more-by-4K
>   Doorbells: zero, less-by-32, invalid , one, more-by-32
>   LMEM     : zero, less-by-32M, invalid , one-GB, more-by-1G
>   GGTT     : zero size, size-less-by-4K, size-invalid
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c | 387 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |   4 +
>  2 files changed, 391 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c
> new file mode 100644
> index 000000000000..529513255dc3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c

add _kunit suffix, per [1]

[1] https://elixir.bootlin.com/linux/v7.2-rc2/source/Documentation/dev-tools/kunit/style.rst#L192

> @@ -0,0 +1,387 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026-2027 Intel Corporation

ohh, you have a time machine ;)

> + */
> +
> +#include <kunit/test.h>
> +
> +#include "regs/xe_guc_regs.h"
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +#include "xe_vram_types.h"
> +#include "xe_sriov_pf_helpers.h"
> +
> +#define TEST_MAX_VFS    63
> +#define TEST_VRAM       0x7a800000ull   /* random size that works on 32-bit */
> +#define TEST_GGTT_SIZE  SZ_2G
> +
> +static int guc_action_query_single_klv_stub(struct xe_guc *guc, u32 key, u32 *value, u32 value_len);
> +static int vf_gt_config_test_init(struct kunit *test);

reorg your code to avoid forward decl for static functions

> +
> +enum vf_config_types {
> +	CTX_CONFIG,
> +	DB_CONFIG,
> +	VRAM_CONFIG,
> +	GGTT_CONFIG,
> +};
> +
> +struct vf_config_type {
> +	enum vf_config_types type;
> +};
> +
> +enum ctx_config_types {
> +	CTX_CONFIG_DEFAULT,
> +	CTX_CONFIG_ZERO_CTXS,
> +	CTX_CONFIG_LESS_BY_4K_CTXS,
> +	CTX_CONFIG_INVALID_CTXS,
> +	CTX_CONFIG_ONE_CTX,
> +	CTX_CONFIG_MORE_BY_4K,
> +	CTX_CONFIG_MAX_CTXS,
> +
> +};
> +
> +struct vf_ctx_config_case {
> +	struct vf_config_type config_type;
> +	enum ctx_config_types ctx_type;
> +	const char *test_name;
> +};
> +
> +static const struct vf_ctx_config_case vf_ctx_config_cases[] = {
> +	{.config_type = { .type = CTX_CONFIG },
> +		.ctx_type = CTX_CONFIG_ZERO_CTXS,
> +		.test_name = "contexts_zero_1vf"
> +	},
> +	{.config_type = { .type = CTX_CONFIG },
> +		.ctx_type = CTX_CONFIG_LESS_BY_4K_CTXS,
> +		.test_name = "contexts_less_by_4K_1vf"
> +	},
> +	{.config_type = { .type = CTX_CONFIG },
> +		.ctx_type = CTX_CONFIG_INVALID_CTXS,
> +		.test_name = "contexts_invalid_1vf"
> +	},
> +	{.config_type = { .type = CTX_CONFIG },
> +		.ctx_type = CTX_CONFIG_ONE_CTX,
> +		.test_name = "context_one_1vf"
> +	},
> +	{.config_type = { .type = CTX_CONFIG },
> +		.ctx_type = CTX_CONFIG_MORE_BY_4K,
> +		.test_name = "contexts_more_by_4K_1vf"
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(vf_ctx_config, vf_ctx_config_cases, test_name);
> +
> +enum db_config_types {
> +	DB_CONFIG_DEFAULT = CTX_CONFIG_MAX_CTXS,
> +	DB_CONFIG_ZERO_DOORBELLS,
> +	DB_CONFIG_LESS_BY_32_DOORBELLS,
> +	DB_CONFIG_INVALID_DOORBELLS,
> +	DB_CONFIG_ONE_DOORBELL,
> +	DB_CONFIG_MORE_BY_32_DOORBELLS,
> +};
> +
> +struct vf_db_config_case {
> +	struct vf_config_type config_type;
> +	enum db_config_types db_type;
> +	const char *test_name;
> +};
> +
> +static const struct vf_db_config_case vf_db_config_cases[] = {
> +	{.config_type = { .type = DB_CONFIG },
> +		.db_type = DB_CONFIG_ZERO_DOORBELLS,
> +		.test_name = "doorbells_zero_1vf"
> +	},
> +	{.config_type = { .type = DB_CONFIG },
> +		.db_type = DB_CONFIG_LESS_BY_32_DOORBELLS,
> +		.test_name = "doorbells_less_by_32_1vf"
> +	},
> +	{.config_type = { .type = DB_CONFIG },
> +		.db_type = DB_CONFIG_INVALID_DOORBELLS,
> +		.test_name = "doorbells_invalid_1vf"
> +	},
> +	{.config_type = { .type = DB_CONFIG },
> +		.db_type = DB_CONFIG_ONE_DOORBELL,
> +		.test_name = "doorbells_one_1vf"
> +	},
> +	{.config_type = { .type = DB_CONFIG },
> +		.db_type = DB_CONFIG_MORE_BY_32_DOORBELLS,
> +		.test_name = "doorbells_more_by_32_1vf"
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(vf_db_config, vf_db_config_cases, test_name);
> +
> +enum vram_config_types {
> +	VRAM_CONFIG_DEFAULT,
> +	VRAM_CONFIG_ZERO_VRAM,
> +	VRAM_CONFIG_LESS_BY_32M_VRAM,
> +	VRAM_CONFIG_INVALID_VRAM,
> +	VRAM_CONFIG_ONE_GB_VRAM,
> +	VRAM_CONFIG_MORE_BY_1G_VRAM,
> +};
> +
> +struct vf_vram_config_case {
> +	struct vf_config_type config_type;
> +	enum vram_config_types vram_type;
> +	const char *test_name;
> +};
> +
> +static const struct vf_vram_config_case vf_vram_config_cases[] = {
> +	{.config_type = { .type = VRAM_CONFIG },
> +		.vram_type = VRAM_CONFIG_ZERO_VRAM,
> +		.test_name = "vram_zero_1vf"
> +	},
> +	{.config_type = { .type = VRAM_CONFIG },
> +		.vram_type = VRAM_CONFIG_LESS_BY_32M_VRAM,
> +		.test_name = "vram_less_by_32M_1vf"
> +	},
> +	{.config_type = { .type = VRAM_CONFIG },
> +		.vram_type = VRAM_CONFIG_INVALID_VRAM,
> +		.test_name = "vram_invalid_1vf"
> +	},
> +	{.config_type = { .type = VRAM_CONFIG },
> +		.vram_type = VRAM_CONFIG_ONE_GB_VRAM,
> +		.test_name = "vram_one_gb_1vf"
> +	},
> +	{.config_type = { .type = VRAM_CONFIG },
> +		.vram_type = VRAM_CONFIG_MORE_BY_1G_VRAM,
> +		.test_name = "vram_more_by_1G_1vf"
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(vf_vram_config, vf_vram_config_cases, test_name);
> +
> +enum ggtt_config_types {
> +	GGTT_CONFIG_DEFAULT,
> +	GGTT_CONFIG_SIZE_INVALID,
> +	GGTT_CONFIG_SIZE_ZERO,
> +	GGTT_CONFIG_SIZE_LESS_BY_4K,
> +};
> +
> +struct vf_ggtt_config_case {
> +	struct vf_config_type config_type;
> +	enum ggtt_config_types ggtt_type;
> +	const char *test_name;
> +};
> +
> +static const struct vf_ggtt_config_case ggtt_config_cases[] = {
> +	{.config_type = { .type = GGTT_CONFIG },
> +		.ggtt_type = GGTT_CONFIG_SIZE_ZERO,
> +		.test_name = "ggtt_size_zero_1vf"
> +	},
> +	{.config_type = { .type = GGTT_CONFIG },
> +		.ggtt_type = GGTT_CONFIG_SIZE_LESS_BY_4K,
> +		.test_name = "ggtt_size_less_by_4K_1vf"
> +	},
> +	{.config_type = { .type = GGTT_CONFIG },
> +		.ggtt_type = GGTT_CONFIG_SIZE_INVALID,
> +		.test_name = "ggtt_size_invalid_1vf"
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(vf_ggtt_config, ggtt_config_cases, test_name);
> +

can we have something more like:

struct config {
	u32 orig;	// value to preset in vf.selfconfig
	u32 query;	// value to return from query 
	int expected_ret;
	const char *name;
} testcase [] = {
	{ .orig = 0, .query = 0, .ret = -ENODATA, .name = "none", },
	{ .orig = 0, .query = 65536, .ret = -EINVAL, .name = "overflow", },
	{ .orig = 1024, .query = 0, .ret = -EREMCHG, .name = "lost", },
	{ .orig = 1024, .query = 512, .ret = -EREMCHG, .name = "reduced", },
	{ .orig = 1024, .query = 2048, .ret = -EREMCHG, .name = "increased", },
	...
};

to keep the test values in place?

> +static void vf_gt_config_1vf(struct kunit *test)
> +{
> +	int config_type = ((struct vf_config_type *)test->param_value)->type;
> +	struct xe_gt *gt = test->priv;
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv,
> +				   guc_action_query_single_klv_stub);
> +
> +	if (config_type == CTX_CONFIG) {

define separate test function for each config category
there should be no "if" here

> +		const struct vf_ctx_config_case *c = test->param_value;
> +		enum ctx_config_types ctx_type = c->ctx_type;
> +
> +		test->priv = &ctx_type;
> +
> +		KUNIT_EXPECT_LT(test, vf_get_submission_cfg(gt), 0);
> +	} else if (config_type == DB_CONFIG) {
> +		const struct vf_db_config_case *c = test->param_value;
> +		enum db_config_types db_type = c->db_type;
> +
> +		test->priv = &db_type;
> +
> +		KUNIT_EXPECT_LT(test, vf_get_submission_cfg(gt), 0);
> +	} else if (config_type == VRAM_CONFIG) {
> +		const struct vf_vram_config_case *c = test->param_value;
> +		enum vram_config_types vram_type = c->vram_type;
> +
> +		test->priv = &vram_type;
> +
> +		KUNIT_EXPECT_LT(test, vf_get_lmem_info(gt), 0);
> +	} else if (config_type == GGTT_CONFIG) {
> +		const struct vf_ggtt_config_case *c = test->param_value;
> +		enum ggtt_config_types ggtt_type = c->ggtt_type;
> +
> +		test->priv = &ggtt_type;
> +
> +		KUNIT_EXPECT_LT(test, vf_get_ggtt_info(gt), 0);
> +	}
> +
> +	kunit_deactivate_static_stub(test, guc_action_query_single_klv);

likely not needed

> +}
> +
> +static int guc_action_query_single_klv_stub(struct xe_guc *guc, u32 key, u32 *value, u32 value_len)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int *type = kunit_get_current_test()->priv;
> +
> +	switch (key) {
> +	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
> +		switch (*type) {
> +		case CTX_CONFIG_ZERO_CTXS:
> +			*value = 0;
> +			break;
> +		case CTX_CONFIG_LESS_BY_4K_CTXS:
> +			*value = gt->sriov.vf.self_config.num_ctxs - SZ_4K;
> +			break;
> +		case CTX_CONFIG_INVALID_CTXS:
> +			*value = GUC_ID_MAX + SZ_1K; /* greater than max context value */
> +			break;
> +		case CTX_CONFIG_ONE_CTX:
> +			*value = 1;
> +			break;
> +		case CTX_CONFIG_MORE_BY_4K:
> +			*value = gt->sriov.vf.self_config.num_ctxs + SZ_4K;
> +			break;
> +		default:
> +			*value = gt->sriov.vf.self_config.num_ctxs;
> +			break;
> +		}
> +		break;
> +	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
> +		switch (*type) {
> +		case DB_CONFIG_ZERO_DOORBELLS:
> +			*value = 0;
> +			break;
> +		case DB_CONFIG_LESS_BY_32_DOORBELLS:
> +			*value = gt->sriov.vf.self_config.num_dbs - SZ_32;
> +			break;
> +		case DB_CONFIG_INVALID_DOORBELLS:
> +			*value = GUC_NUM_DOORBELLS + 10; /* greater than max doorbells */
> +			break;
> +		case DB_CONFIG_ONE_DOORBELL:
> +			*value = 1;
> +			break;
> +		case DB_CONFIG_MORE_BY_32_DOORBELLS:
> +			*value = gt->sriov.vf.self_config.num_dbs + SZ_32;
> +			break;
> +		default:
> +			*value = gt->sriov.vf.self_config.num_dbs;
> +			break;
> +		}
> +		break;
> +	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
> +		switch (*type) {
> +		case VRAM_CONFIG_ZERO_VRAM:
> +			*value = 0;
> +			break;
> +		case VRAM_CONFIG_LESS_BY_32M_VRAM:
> +			*value = xe->tiles[0].sriov.vf.self_config.lmem_size - SZ_32M;
> +			break;
> +		case VRAM_CONFIG_INVALID_VRAM:
> +			*value = xe->tiles[0].sriov.vf.self_config.lmem_size * 2;
> +			break;
> +		case VRAM_CONFIG_MORE_BY_1G_VRAM:
> +			*value = xe->tiles[0].sriov.vf.self_config.lmem_size + SZ_1G;
> +			break;
> +		case VRAM_CONFIG_ONE_GB_VRAM:
> +			*value = SZ_1G;
> +			break;
> +		default:
> +			*value = xe->tiles[0].sriov.vf.self_config.lmem_size;
> +			break;
> +		}
> +		break;
> +	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
> +		switch (*type) {
> +		case GGTT_CONFIG_SIZE_INVALID:
> +			*value = SZ_4K;
> +			break;
> +		case GGTT_CONFIG_SIZE_ZERO:
> +			*value = 0;
> +			break;
> +		case GGTT_CONFIG_SIZE_LESS_BY_4K:
> +			*value = xe->tiles[0].sriov.vf.self_config.ggtt_size - SZ_4K;
> +			break;
> +		default:
> +			*value = xe->tiles[0].sriov.vf.self_config.ggtt_size;
> +			break;
> +		}
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int vf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_VF,
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +	};
> +	struct xe_vram_region *vram;
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	/* pretend it has some VRAM */
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
> +	vram->usable_size = TEST_VRAM;
> +	xe->mem.vram = vram;
> +	xe->tiles[0].mem.vram = vram;

do we need this?

> +
> +	/* pretend we have a valid LMTT */
> +	KUNIT_ASSERT_TRUE(test, xe_device_has_lmtt(xe));
> +	KUNIT_ASSERT_GE(test, GRAPHICS_VERx100(xe), 1260);
> +	xe->tiles[0].sriov.pf.lmtt.ops = &lmtt_ml_ops;
> +
> +	/* pretend it can support up to 63 VFs */
> +	xe->sriov.pf.device_total_vfs = TEST_MAX_VFS;
> +	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
> +	KUNIT_ASSERT_EQ(test, xe_sriov_pf_get_totalvfs(xe), 63);

your fake device is VF, so don't touch PF-only fields

> +
> +	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> +
> +	/* more sanity checks */
> +	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
> +	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
> +
> +	gt->sriov.vf.self_config.num_ctxs = SZ_32K;
> +	gt->sriov.vf.self_config.num_dbs = 128;
> +	xe->tiles[0].sriov.vf.self_config.lmem_size = TEST_VRAM;
> +	xe->tiles[0].sriov.vf.self_config.ggtt_size = TEST_GGTT_SIZE;

why? the test goal should be to verify that VF correctly detects and
rejects any invalid config received from GuC/PF (as this would be
the part of the bootstrap)

the only case where we would need these preset, is the restore,
where we just expect that all config, but GGTT start, is the same
as previously received - but I guess this is a separate testcase
or to be done within the test scenario itself

> +
> +	return 0;
> +}
> +
> +static struct kunit_case vf_gt_config_test_cases[] = {
> +	KUNIT_CASE_PARAM(vf_gt_config_1vf, vf_ctx_config_gen_params),
> +	KUNIT_CASE_PARAM(vf_gt_config_1vf, vf_db_config_gen_params),
> +	KUNIT_CASE_PARAM(vf_gt_config_1vf, vf_vram_config_gen_params),
> +	KUNIT_CASE_PARAM(vf_gt_config_1vf, vf_ggtt_config_gen_params),

there should be separate test names
and use better names, as now it would be listed as:

	vf_gt_config.vf_gt_config_1vf
	vf_gt_config.vf_gt_config_1vf
	vf_gt_config.vf_gt_config_1vf
	vf_gt_config.vf_gt_config_1vf


> +	{}
> +};
> +
> +static struct kunit_suite vf_gt_config_suite = {
> +	.name = "vf_gt_config",
> +	.test_cases = vf_gt_config_test_cases,
> +	.init = vf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(vf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 802c982ea39b..7b4b88cb81d7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1579,3 +1579,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_vf.c"
> +#endif

