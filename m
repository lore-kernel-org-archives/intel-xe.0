Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2089C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 13:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B0B10E082;
	Wed,  7 May 2025 13:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TskEqOX5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706E710E082
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746625830; x=1778161830;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=yk/eJ6vzeh/rH9F16VThQ+f5eZgNkr+k35M2yOHRf4w=;
 b=TskEqOX5EOyTkl8E0DfdJ51G0e2Z0P0iAnaYD5vVD4c+B1leOzt68EcA
 bUmskqgc19KBsKGuZ39ix5Uj0ac6sF3lln3S5+kZ6mcZjXg3XsUN/B9KS
 erioG4a5V/6xKmv2cfn2DIdk5JRRxMWmCIbH8UNWtpNgWME2BpS34rx1b
 fT7y/9jYkDvJUlVmQUDWh7fT0mK1ReERNH72r5hkcZBT7kq3aVqZNkfQF
 4kb/aRCfcf/JDNDCl59irGY6Ou47MA4JyvNv8VOdsm0aQY7TYkwvhZv5M
 WKFl6pyPuR9o19wGGuHKJRsQxI1nmK3aGnwI+Q/JXDArJAPge0OF6XXBV A==;
X-CSE-ConnectionGUID: oI/IL5uuTYKR2MQ/LGTd+Q==
X-CSE-MsgGUID: XNnxQvxHTYWSoaCNpZC2Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59014078"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="59014078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 06:50:30 -0700
X-CSE-ConnectionGUID: kmmguaDfREOlqyuB3EPmYA==
X-CSE-MsgGUID: uJI2rpEGS5ql26aOqUrBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="166893997"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 06:50:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 06:50:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 06:50:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 06:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBQt+ojAIjd4HX4Q4OUvHGe2cDJBsjOpx7tYII8UE9JiSOYCDQZK6CSwT+wlfKT2TrFofgK5JuqcudULthXtXrhwQu17fQ8m2Om7E0t008m1XWDBQ7+riOA+Eskx9sw/9XRQWwt5fWO1BfEpUpsjXPGgNEQ8cH2RSpJRQh/u0Afy/bfd9wrtgduhuLLSN3sY6ZihCwUONn3lw0f/Ga05C2+HofUDPMHaGZwRHp7flCeeECZjajfia1NArZ7QS6UbpaNnj8FOs+qDIwXRnBrDS3+6c+OKvDevoPXTcI4H/LLgapMwNSyaJTuKjcZIWQRebVmR8Joy8DH2D3hhEQs/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A+sh0jiPOszYoHlT8pyRzYqjmWZsDWoozTHuf1R3ek=;
 b=UkTpgbFB5WrdXR04go0x6cpeDWuPj/mDdPP4B79WuxSs/omwAxWc/2j2TbtLN2Crez84gpxzHhKj1p9RXPxzy49vHzuDT+yxvMoz9TKIhgihSxVWqgB4lB7XQVxYtXBZZnkptnw7rkF6B5UKNs+4VRdURh9NgxDtC7E6YQfXKgOr7eOa1jLt15wcrd9Omxotr/C0zsShXmYu/EoSrIOUskgYmqW6LC9A3uYZdJMiBTJCDFILay4TCUlWh5FSkHYmYEkE1KAXP6ihxzkzWKmrx0WxHQhKJEEfY5tYOmyMifpEM1cQgePoZqiNQthmRo5kGUpizWEb3N0aEtk+FgqDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 13:50:23 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 13:50:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250507124437.2651331-1-nitin.r.gote@intel.com>
References: <20250507124437.2651331-1-nitin.r.gote@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Disable null query for anyhit shader
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <joonas.lahtinen@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <tejas.upadhyay@intel.com>, <nitin.r.gote@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 7 May 2025 10:50:20 -0300
Message-ID: <174662582054.2473.12369854211740990391@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN0PR11MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e5aa32-97d2-4418-f78a-08dd8d6e1d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHRtejkwQ1IyNVlFS05ZK2ZJaHlLcXZ5SDkyR3VialFLNGVqSTl4N0QxUWFZ?=
 =?utf-8?B?S3ZGc3BhRUFVMGhPVEhrNUVpbFFlR2xhd1RwbTZ2L25vcHhBLy9rVGdiTmF5?=
 =?utf-8?B?QzZiR0QxYlRpMWZIYkY4YmpQckRwZnRuNXBvS2JtcnhGT3VLdVR0bGhsaGsx?=
 =?utf-8?B?bTRLWUZnRkZ3Rk1FVUNzN0NtVFlOVkMrc0Jka3hEQkh5dW82MGk1SWN4dWo5?=
 =?utf-8?B?aTQ1YzE4dHJncEZ2bnluaXlaRUpHY29RMjhVR01EOHlJZmZUOGNoNm04Nkkz?=
 =?utf-8?B?SEg4TU5WZFBpa1pZa0JsbERROFNCMnZxbHJWSkxKbldlWmJrNWQxU1NxckYx?=
 =?utf-8?B?RkU5eTdiTXVJeTVuOFd4azZ6QWM4MnUyNU5ZRzU1Y0FxVFBlODFIUjk4MmRw?=
 =?utf-8?B?cUgyTmtXYXBTbWw0SVVYZHo0MmZjaWtQNmIrSGdIK3FXbE1HN0t0LzZER1Qy?=
 =?utf-8?B?Nmd2NzFsbEdrVks3cWZock5kQldMN01PWXQzeCtjZ2JVMEEzRy93RnVnNm9a?=
 =?utf-8?B?c3RuY0JXZ0tFUU1rU2VUbEZFT0pBcUNMNjFrc0RCNkYxMnd1bFdnc2dWQ2o3?=
 =?utf-8?B?TUwvZmxIOXpLQllWVUZYSWRnT3pwMW5Xb21IOElIYmpIa2RUS29OTE1kUGhh?=
 =?utf-8?B?T09aU2pZY2tlMGlnZFRrVm5VUHAvbWxLZGE1d1ZKRXRkc3ZuNlVNK1V4a201?=
 =?utf-8?B?SVZHck5SMWJaR1dybFlSLzhNWlhLQUNSUFVQYW5tL2RIeWpPK3hBdFNkQXdS?=
 =?utf-8?B?RkFwMTBiTExLMjRBYlh1RmxnWkVQQlY1bGJ4Uk10RFY1bW5pMEw1VEhZMkZk?=
 =?utf-8?B?bXdNVWQrbVJ1d1lhMnZoUXpJeDBrWXZ5ZzFncnZCZHlhZXoyc05SZzEzVTl5?=
 =?utf-8?B?eGhOS2FwRmNSTjlnbk9YakFnWUczZTk1N2tFcDhIYmh0eGtFcEFiaVdjUU03?=
 =?utf-8?B?WGVRZTFzTTRJUUowSW54NzNpRTNMVk1KYzdrZ203N2V3SGhISnE1bFIzd3dK?=
 =?utf-8?B?TU5kR2V1SFlCVEJ6SXNRb0pPbURKemxudjJCK0o3WkZBVXV2bFdUckp3OStk?=
 =?utf-8?B?QzdKV2xZWllwZ2lmbUdES1NIZ1BER3YveFNjdUdNdGpiUzdUdlNmM05LSUZY?=
 =?utf-8?B?N3RaSXpCQjVqODFtVWlObUFLTHlJZGVBemxxVjJCYnpuNzVCZlRuYVA1cFoy?=
 =?utf-8?B?NFc0SE9kK0dFemJnazBBOTR5amU2ekRDZVFOS01QUTl2MUtwdTJnZXVNdlBq?=
 =?utf-8?B?bCszbFVWNk9WWmprb1oweUhJM0JKZDIvK01yUHJFVUhSRUdsS0VMNDNhSXdm?=
 =?utf-8?B?TDJUWGEzVmZtaGxya0pYR2NGTDVFS2UyRERQclVsNVJVZEhkTmlkeVR2bkcy?=
 =?utf-8?B?WGMwQThDWSs1d1pvT1lCdkNYWTdxZXVrbzFBdGJMSEdWL0hPVHhGWkN1WUJn?=
 =?utf-8?B?MVh3WHpsdG9pblVQeEY5anQ0dnJEWC9pVXMzRTE0VHNxb1BBYkk4L0ZvR3h2?=
 =?utf-8?B?Rlc5TlhJZ0xQRGU3bmgwTmF4aEIrQ2IvYzg1MHd2dXZaRU11cWhrTDd6ZnpR?=
 =?utf-8?B?MlhDZ1dtSS91eTllNFlxVkc4NXkvUVlYSnRMbDBSNFV6T1VHcFRCRmpieWlC?=
 =?utf-8?B?M3dPTkZwTTNDbU1qb1M4RzhmdDVlZ2FtZDcxSXo4TFphcWp0YnY5d1JWQTZx?=
 =?utf-8?B?V3FuMDFQU0UyMWFveFc4S3hwVTdKSnQxbWRQKzdVbm1xS25RSGZmZDE3UVFq?=
 =?utf-8?B?L2JQRjVtbzgvSmxYYklWKzJheXh3dXJFeHQ2VzhEckJsYUIyWFNaUURWV21S?=
 =?utf-8?B?NXpxQWVRQXhkYms3VUM4cWYreFJWdkZ4TWJGbDJPaDRMNnFaSS9VaElOdURo?=
 =?utf-8?B?L1hXNFUzNGIvTFFwYTAyRm00TkVwTm51VTE1dGlpYnFETmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWY1VUp6MHZNRUZqbFk2RkUzVHJWbHhOZHQvMTNvWGg2RHArTlpmM0NWS0Yx?=
 =?utf-8?B?MEVXenZnL1hYbGdlTE1mMVhYNGFwODdqY2pSaXJianJ2aWZoaDJIMGNKL243?=
 =?utf-8?B?RnlzTXFJMWVsVnhqc2FEaE5iU2lUbTM2WW9CRE1uTGRzbUo1TVlYcVVaS1o2?=
 =?utf-8?B?Z2cwZndYY0NBRVFRQTcxck1ORThITHpMNXROcks0bmpMQ0Y0QXF1azZCVXVL?=
 =?utf-8?B?R2t0cEk5YnE3V1pHRm9nOEpacmtSL1lFSFdXNVlIbGE2RVlTTjFZbXB5ckxl?=
 =?utf-8?B?eFpIY2NTRGZGQ0V0UWxDSWQ2bHhFTkRIL0kwd3NXanNzVW9aQWpaYXFTYUVp?=
 =?utf-8?B?alpLRW5uVC9PY1NtcmxXNW5yMTFkWitYTkFyOEI1ajExZ1RZUmp5SVpYYkl6?=
 =?utf-8?B?eCtHWGFhVXNqM3hqUVhYWGgwK0VwSDlUV0s4VzBRVlBTejRsVEhGWXR5Zloy?=
 =?utf-8?B?VURUYkJFYSs4L096S2NvUFlQNWRLaUZXNW5sWlptUzlEYTVmOE9leUFzcWFr?=
 =?utf-8?B?Y0FDeVExQWNURmhhTUhpVlNvdDNpQS9YUzV2Y2JVL3ArVnpnYUpQajlJUTM5?=
 =?utf-8?B?eTM1T2pLZ011WWpKdkdFVkNzZFpyT3llTVJLb0szdUFSc01raXJDVE4va0xi?=
 =?utf-8?B?eXE5WSt4MEtqWnRhUXY0MW8xeFlpVGYrNjh0T2sxKzB3dTdDWjgyN2RjcUti?=
 =?utf-8?B?NzNQLysrcEs2UWYxclloUXpLYnhmWVgxdjFRWUMzdUZWK0Eva1NYMTU3dXFM?=
 =?utf-8?B?aUd3Y0NMVVJaWmtqWk5aTkhYZlBWdE9MckorTjdCWXRiSVVxWVQxRGhqWUlo?=
 =?utf-8?B?dTlPVks2M25JNzdzeWtVRDRlaUJCT1VETWxSdWFSZFgwRDVhYVJ2SEQzbjhk?=
 =?utf-8?B?NVE1NlJqcmZaaU9ZTXVBRTBLdUV3Q052TEFWVmh6bWN6UTdxVEFBZjM4RHJY?=
 =?utf-8?B?UUttVHFRTmxIUXN3V083RUU5Q1ZwUnFQUWJkeVhhKzRSZ0xVWFRKaHpsb3Z4?=
 =?utf-8?B?V3dDL2hGV2pwSWU2bUZvalluc0dJMDRhM3JqVTZIZWxEV3VUbkVQT2VJZ0l5?=
 =?utf-8?B?dnI0T1FZR2UyVUtucmV2UUJyZmRLS1dtYlVYbWlpdmdXdEQ0N3hBb1dyRDNz?=
 =?utf-8?B?ekJhVXVTbHBRNVVJYkVvUWs3Y2cxdjY5U29yMTJFOVI3SUx2N2h2eHR3NldY?=
 =?utf-8?B?WmphTW9RV3hhMEJWblpxVFVQTVN2dUFGN3FoZlc2c0xGOVQzbVRlZTdMZnRG?=
 =?utf-8?B?MU5kUE9vajNuK0x0SmVJditzTk81VGk5ZkZGTEpjajVqdHJXOTZyL1hhUVNl?=
 =?utf-8?B?YnFUc0xWcWptQUJQNlpvZ0dvOHJWa3JKeDA1bjl4WVFjTmFPTGpEazVGUVE5?=
 =?utf-8?B?UEl2M1VRR1c0c1JST2NaZnpQWlhyK2lqQ0QrdGNnUkJiamFsa3BOMXQ1WG5k?=
 =?utf-8?B?WnhZTjM2UGhpelZxdEdvTFh4UExTdGpuaG56UnNIOGEwZDNLWkdFdmFQekhM?=
 =?utf-8?B?NkRyOWhDbEVqZFZSUG1NUFlXWjdHK0o3dXJPL3dSNTRXd1FHVFBEVFpWeFFZ?=
 =?utf-8?B?UXR1Yi9VSVp6Vk01N0tZMkpLUlZLL3k4K09vYldXcEhVMHFhZjZjd1F3S1Nr?=
 =?utf-8?B?aVNYcTl2NlJvUWova2hlOERuSjcxRTRpRjlER0VMRGZRYXhFM0Y2ZU1HZXJy?=
 =?utf-8?B?N3NENmR2b0w2aThScHREK0tLUDVyMUlIUkIvQVdBSkxlVjV2RkZKc2xNQUFy?=
 =?utf-8?B?R2JUWG9OMWVTa01ucW8zMkNJMzExNFNyTnhwdHFqcWwvaEZZeW9ReEcrVmRt?=
 =?utf-8?B?cE9FR1FmQ2c2VEhNbmpqRDJjdmFKdzFTSm9zQUxnSHJDVU9xWStWZlZlcnV6?=
 =?utf-8?B?T0VmajRaWFlPY1FJODBHTmxzamUwM0piaFlxenpwbTQxdlVYMnRNY2dKUmN6?=
 =?utf-8?B?SE90RVhxbjRYRElsOGJGSTJ6QnMwRUlTYzdBRytab2luRzVHUUM0eEN1bXZl?=
 =?utf-8?B?WXgvVjUwNWRWMTNyZ2lSTUxrS3JCMU1Ub2UrdWcyamlXVlBjTStoV1ZQVjNR?=
 =?utf-8?B?WUYwU3Y4d0FtTmxJWDFUcjlXdlJWU3B1Wmw4RVQ3UEMwYWxjcW85ajZiTWpM?=
 =?utf-8?B?d1BDc2NzNmRac0NOZ1BRQ1JyVENjRFByanZiRHRHakNNK2IvZDFQWWY4akJ2?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e5aa32-97d2-4418-f78a-08dd8d6e1d6d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:50:23.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /X4TwYUt94JhHHOUjMFR2EDUu6+VXw5anXwAr07z9iE6/benGnPA/SdCKud/N4Ufqhy4YwvxKpKKYEkWdT36fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
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

Quoting Nitin Gote (2025-05-07 09:44:37-03:00)
>For PTL, disable null query for anyhit shader as it
>currently does not bring any performance benefits.
>Quite the contrary, disabling the mechanism brings a
>small but consistent perf uplift.
>
>Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

This seems to match the requirements for Xe3 according to the
description of RT_CTL. So

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

However, we usually have entries in Bspec 72161 for this kind of stuff.
Could we get that page updated with a proper entry for this tuning,
please?

Also, I would use "drm/xe/xe3:" in the commit subject, since this is
applicable to the Xe3 IP and not necessarily specific to the platform.

--
Gustavo Sousa

>---
> drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning=
.c
>index 49ddbda7cdef..6f2f3428b12e 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] =
=3D {
>                        ENGINE_CLASS(RENDER)),
>           XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERR=
IDE))
>         },
>+        { XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
>+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
>+                       FUNC(xe_rtp_match_first_render_or_compute)),
>+          XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>+        },
> };
>=20
> static const struct xe_rtp_entry_sr lrc_tunings[] =3D {
>--=20
>2.25.1
>
