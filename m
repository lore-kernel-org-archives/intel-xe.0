Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D3CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBED10E0D1;
	Mon,  6 Oct 2025 14:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ09de48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA49F10E0D1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762322; x=1791298322;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JAWOj+JA4e8eAvfa13qbAx2hJIsdJxELyJISqa2fM+g=;
 b=HZ09de48T7oS66CsigAkFdCnG1DUo+XDUYdJVlHhW1VrIkMJqkVfoEgM
 W5i2qg7qa45cQ3rkMyVcUPQu4RspkBhEDJb8SdGPygcNMkfmDHZCrLwK7
 SARRyLWopq6m7849ttISWQIQqyp3IbVw6d5d/6uhS6fdE5OPtw7cjxDC/
 uhi6bPdz1b5uUFXHegu7v+Pmy6eH3b1zoqBXmHlANZUlHKHZNGMwpgWiW
 q5hLx4FA2jeStjjMOHeBDWNuy7u5ZFWeqYiDhXXKmG9mbTkjCGn/e8m5v
 p37Mp7QXacI6rMuHjfiDYYrllWNzGizjWoM7yCTpUHgUKzCDVq59GzOo/ w==;
X-CSE-ConnectionGUID: OQYVx1EHQwqJ6Bzd+j1lNg==
X-CSE-MsgGUID: 5R0toAFTT8+RHlMCTfY51g==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72188878"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="72188878"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:52:02 -0700
X-CSE-ConnectionGUID: PnQbJSYATqOxY8BjpHb06w==
X-CSE-MsgGUID: Bny2vP40RIyFGa8wiPCl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185172031"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:52:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:52:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 07:52:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcbLdC2fALqhysJGFiC43FnJiNkM4JjnEAXwAfSfnHMOZFtTZc4tpTW7K4ZPJxXaR2fkFb1EKBOzqxN9srIL1AaLxlXCViPjYfyFqtDJDs2NMqt/k0gYygRgGb3LmSeaca5o4gUrALgISFUapAdVjlHQyVyQWF7iAX20Wz6mmI/zuZOZ6PzuYxvxFzrKmmY+f/yKzRTTrll2CaRp5TxyCb1owD8LYijrfDosoa2PLlzXYOjwNTQDT8+g6DFXyV4HdaVBBTla7gGZg2cxpBCCeWQDh2Hlqv1Bsj/pEY824rbEsrSaAydOyy35Gz027z8T0L2uZdcV/YutJzr9uKE5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E85FT5NQaTnZF8XSyJ+uujXEyxKFW4Ao4hEJvkk5+Hc=;
 b=MddJTdxds4kaKGQ3dWiUdbVu5fqdP0i59ASVZEXzgExQgXZNqkwE4I4qggsAoYZLSgWW9k3Yb11+7slm5BOOn85EpmNYSwI1LEOlr1hmFfzITqFSWdX4gTH0WAmfkhlFC+8kCaDC0x8cmK8hZuAOSzwoHY9bjBfI6LNjhWSYKkwF4qETfXhlPAGQez7ZGHXNUpWkS2Ltrj9FdPVDEKZS0OxP58XSJPMIB8s+usV2d/nEMCH4WOlu8E/l/KX3NrbVzhQ2swZtVI/9NUrXQ9aak6BD3RQGCpG52/MEiMaCF7wBmeKNxCVpDTecUOV4qJxcwTZ/sDY1rqAxUSi1k8QcRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 14:51:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 14:51:55 +0000
Message-ID: <4eaa265d-0ee3-4f5d-95b0-7a9b4bd3af4b@intel.com>
Date: Mon, 6 Oct 2025 16:51:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/30] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-17-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251006111038.2234860-17-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0041.eurprd09.prod.outlook.com
 (2603:10a6:802:1::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 965cf4c9-206e-4474-60a2-08de04e7e4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0FKL2pRbDlqbk43VjR1UEkrUTh6SncrVWN6a1N2ejRKVmJqSHBOZTRlakF4?=
 =?utf-8?B?bVdzNEVxancxcTh2R0dHK3NPdjdwRjA3SitGcklkbEVFNlYrL2NZVzlsSFdi?=
 =?utf-8?B?YUlraU43SmNwZWYwczEwNC9nSU55SFNta0N3eW1meXo3NkZYQ1FIaDJjTWR6?=
 =?utf-8?B?RldpdVRyS0NneW53eHpWa1p2TFhnT3RxRnJjM1hTbmU5NXRSVmpKWU1tb1pj?=
 =?utf-8?B?SEE0dGxFa3hYTDhqMWFoVE9ha2ZqZ3FJY1NKY1NTQTAxYURwYlVQMTFCbU1t?=
 =?utf-8?B?OVBQdndteWlZMUpIVnZXUDhVOGxiTzBNMU1OS0dYOGpGVWdtVzlXT2lvOTR2?=
 =?utf-8?B?cERQejdGek5xY2JuL2ZHT0xlMmZwRWdGb25KcFBzUGFKQUFrVWY1bnEyRENE?=
 =?utf-8?B?Mkh2R0R1ZnVQc3V1cFR0dThlNGt6bDRTMC9XYkw0TlV2UmZKOWlCaHJGVEox?=
 =?utf-8?B?N1VLWURrZFVCMlQxWVFpbFVCeEVtM2ZoZlZjM0NNTEhWMFpBSjg1MUh2NGNG?=
 =?utf-8?B?b3c3SnZjQjBXNmZYNmY4ZzMvcWNrUkNxcWFKZkxKN2IxLzJ3TC9zYXJweVZO?=
 =?utf-8?B?NXFEUCtoOFhqQ2FyMnR3cGVVcldrOFBaZURUMzl2Z29NNUpmVytKMnQzZmdN?=
 =?utf-8?B?TUFyTUo4YUFvTmhCaDhOOWRJMmZWY1I0cHR0ZUxCUVJhdnUyU0RSS0ZOcHhG?=
 =?utf-8?B?ZzE3UHpoZWUzZFFnYnJYTTd5T29SOUhVVXh0RElFRGVQaEJJdGtQL3dDdk5Z?=
 =?utf-8?B?eG56QTBiSEFqbFlKY3A4SjhkR1FGUlROcnRjT1k3RStpR3UxOUE0VERNVmZS?=
 =?utf-8?B?QzZMNTZjdFlGb1Q2NWIwa2lDRnM2SExhQWYzeUdEak90Y1UrbWpQZzFhaEdy?=
 =?utf-8?B?cGtzd1UxMUxPYmx2eHVrQmdXTGdmb0NVMHA5SzluVS9GdlFVaFJZMFdaUmQ1?=
 =?utf-8?B?YUV2TXptZVdXQnFVbFR6UXpMb0dKd0Fnd1NIVlhsN2dMTGcvTGtLYmQ5Zkgr?=
 =?utf-8?B?S2dxR1lVV2hRSm5qdGxXWTZycktoNEptL3p6d2oweFp5VFZ5SVk0RXVxMTUr?=
 =?utf-8?B?eUpFN3BSeVRrV0htQXczMkIvWHNpQmgrR0R3TDNwbTNlWGcrekxLcmQvZlZF?=
 =?utf-8?B?aHpYNnNpZGNZY1JEZ2xBbFFxNVBkYi81c3NCN1Rid290aDduYTNhWnZXSENy?=
 =?utf-8?B?NDNLbEtFQnFOY2V1M010SXZ5aG5OYks1M0lUaHo5OTBzQ2hrNDN1WTZJOE95?=
 =?utf-8?B?L1RMd0F2TGFmcEhBZENtamRBd2QrcUFMTGFuajZRckFhUXVMWXBrY3lhZzhK?=
 =?utf-8?B?eWdNWXpUaTZWVlpOakxldmNKd09qa3BGUWJpYUxTa09YMXNTRzlIOWs5Umgr?=
 =?utf-8?B?ZlBXRjdDdHJZdXRIbmIvMzBDN1pJaU4yZ2oyZFBnNmloL3NPMzFDakNIbzBR?=
 =?utf-8?B?cTljQmprZExrSDZEcHBlQ241L2hYRTFBbGVUWmI5bnRCYjUzSkk5NVo3QWNQ?=
 =?utf-8?B?THowSVpScmJIeCs2UTdhM25xTWJkTUJNNmVYQlFSaXc0akl3UVExZ0pzamVP?=
 =?utf-8?B?SjhhVnZ5aDgrd1lnWThLQXdBbGVxdGdmY3huZ2hlSGVnY1hud3M0aC9NaWVF?=
 =?utf-8?B?V09pc1FXZmRLb0N5dmxURWxKZzVXaEFVY3RMVXVEVlFSc3NXNzY3Zk9jU1lJ?=
 =?utf-8?B?U0ZqVTR4U0c3eXYzUU0rNTVGNEFDSzE3NUU0REJndkcweFlYK3l5bXpoYnRw?=
 =?utf-8?B?bTlGZkg4TGc1ODRXcW5zQWVNMldzNHprZklVdE5oOGpqWDBjUkI5WmZTNDh4?=
 =?utf-8?B?dm9NakozUGpsV0daWTJGZzFjWC9DK2NjdDNzc3Avdi9xQnQ0OVFXd1ZzaTli?=
 =?utf-8?B?Um1TNWxNemtPbUtLNE5JMzB6L2NyczNldnlwSlpTZDRkdUt5ZHVjdkRZUDlK?=
 =?utf-8?Q?i/rhYMKIuct+OYjVr1d08/s7IiABREcy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1Nvdy81UjF5ajNWTnR1NXJaZGQ2dFlLVkptNUR1MHFjTFRJY01PY2VJb3FC?=
 =?utf-8?B?bFltY1FrLzdkMzI0ZHRldFAzSG9RTzJsVm12Mzk2Tk9kQlVLUjd1alllZm8v?=
 =?utf-8?B?cXRZS21KNkNzNjVZRFVrNExQOGRjU0k5TEtkTlVJck5GUG5nVVJXcHVualRp?=
 =?utf-8?B?U2tBSjlHd0J5dGZQbUJ5QWc4ZmYwMy9QcTE0Rm5aRHFsVWJ5TUZ3Z1hZU1Ns?=
 =?utf-8?B?K1Nmdk12VkNvVE0wQ3FDR1IzMDJqZkROZVFLV2hhelFnVTFsY05nR016bUFO?=
 =?utf-8?B?SVpjSU02bi9wMDNHY0RHYWV3VUFlaStRQVhVOEh3SmIyaXJOWWlkdWs0NmVW?=
 =?utf-8?B?eFM1UVFibHVJMTg5ODFVVkw0N0FtNVZzdmJGdjJnOC85VXd4V2hrMTFYaHlJ?=
 =?utf-8?B?YUZGUmNzRExLUkdtT09yQ0xxNXR3dm1XbGlqemFzeXQyeUg5OUFIS21QMUNK?=
 =?utf-8?B?WWpSS3Zhc3NVa2FJVG92ZWxwYXB5cGs3dGxTR0JOL0FMRXBrM2JYTkE4YUJK?=
 =?utf-8?B?YU00U204ZytRQ3FxVC96Z3ZCaHMyL2xaUWtLdlJudHVwNE0za0oraERHRmZ4?=
 =?utf-8?B?UzVkcENMeFltWXNxM1Z3VUNyVTRHUjZvVE8yL2lRVUJ6RisxaS9uM1NpN0tk?=
 =?utf-8?B?VmszZktwSU1QVjkxY1puNE1uTDdwL3ZibHhZVHljUENadmF3TDM1Q0poMTdP?=
 =?utf-8?B?clZQWE9nVG53TEhOWkQvVGREYVloQ0c2c3dOVWR0NXRCenFKdnU4V3BtWXpy?=
 =?utf-8?B?UkFXdnRoeC8yWVh6Qmh0YStYQnc0QXp1R2lNemhLd3FJNmo1T2lpTUlZL1l2?=
 =?utf-8?B?by9IMGdyQ0lIZGZ3MHRwQnNQMEthdXNsaDMwZG5DeWVxQkR1R2ZkOU5TQjVE?=
 =?utf-8?B?dG4zYjVqUEtISlhoaXNNTjlXZ3hjbDJLZDlCZlA2aHF6WjhsalV2VVBjSjZz?=
 =?utf-8?B?N2ZLb1Z3c2YvZnpuaUtPcGw2a1VWelljc1ZaS201MGtsOGdTdzNpcTZmYXNO?=
 =?utf-8?B?L1ZwTitIZ3ZvY1paQ0luaW5Na1BvbWxjRk10VDlwelcvM2lLb0poaWZGVk1Y?=
 =?utf-8?B?bW9aQlF1Unh2Nkw5WG9UQ0JabHd6WnF1QW1CMEVIeXNORWRuc29FWjQvbmJk?=
 =?utf-8?B?elV5ZklFYmdlU2VjVEtOOWFIWk5iR2hrSW04bFVOQzlOS0xORjBWcEZwb1M2?=
 =?utf-8?B?TjA4QSt5ZDF0N1VHNXFhUGIxTjFrb3Q5aldiVDNUT1FnSjgvVWFpdzdSR3BO?=
 =?utf-8?B?VFB2S3R4b2RvVnRvVjJ5N2pNRGxKUm1SalhFSFA0MTZlTmJzZm4vUmtTdXlu?=
 =?utf-8?B?cExhYzlRT0dkbm1FR09vQUxjd0FqbHQ0c2ltdHM4VnM0b1lkV1N2WDZDRUJB?=
 =?utf-8?B?UGlWQXVmOWhJN3RjZ0hMVVg3Z3dUMkx6NlNkRVArZ1k5R1VWUUtsNEJNVlhj?=
 =?utf-8?B?blhZVHRZSVdZK1lBKzBWeG1hUHk1cjJhM2V5RUJ4YmdyZ1RjUDYrZ1F5UmEw?=
 =?utf-8?B?eXZxcVB5aVhMUWZqUXRzajRBTHpLOHFvM3ZGVy9Va0ZlY2Nac2ZxWWNxb0x5?=
 =?utf-8?B?ZGFFTHFXTkQwRThaWXQxNEdYSzVtcGZlOW5XNDhCa0hRS0MxZ0psOG0rcHRB?=
 =?utf-8?B?V0kwUXgyRlNzdHo1cGRMVnhQM3luaVhlUlF5Nk5yQ2tEbFJKekE1ck1qQTdG?=
 =?utf-8?B?NVlHUnZldmFDeUVTaUxjSmZyaFQwTnI4SFpoai80ajRMNXRuSmxPZ1F0N1Vw?=
 =?utf-8?B?djVkTUZTQ0pGcVg2UC9BK1ZpRitQa0c0MTUzMWNXRWhucHJwaGpYci9iQ0ND?=
 =?utf-8?B?dFdJUXVsaTN4RDg2OUtXN04rSUZpaEQwTW9YR1pvSGZQR2M0UGovd0xyVUxH?=
 =?utf-8?B?R21BM0prb0tiWUZCSFBRUzlyc3EwRnh2WlRnd25KM08zZ2t3V3Mva2tYU0Z5?=
 =?utf-8?B?Qmd3R0ZPaVV5QnBQY1FkSUkwWW01N0pEaFZFVDFCZDNEbU5xU3VJYXcvQzdH?=
 =?utf-8?B?T3lyeFhZYi85ODhyYUkzRVQ4bUJnTlRPNmNmZWpJQUNFUlJ1QytTUXdWKzdy?=
 =?utf-8?B?ZkJsaDFZYldrZmcxcXJaN0w4MElMbDgyTTJwZm84cW1IazgwQkZpcTI1d1d1?=
 =?utf-8?B?RXphM3dJcDVDUS9wREgrOXowU2Q1aHpZeU5FcEU1YUlERUpvZlZseENyem5T?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 965cf4c9-206e-4474-60a2-08de04e7e4bf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:51:55.7147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhE3sDzNgbdGAh2/F8nXoMaK2/CKI2MoOseOWpCwybI76P3RzHcPUZ+pEm8qC3tmiEXjj5/s1pwqGaVunp/zOzRyDgcJcn82w89qOGUs8sQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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



On 10/6/2025 1:10 PM, Matthew Brost wrote:
> The only case where the GuC submission backend cannot reason 100%
> correctly is when a GuC context is registered during VF post-migration
> recovery. In this scenario, it's possible that the GuC context register
> H2G is processed, but the immediately following schedule-enable H2G gets
> lost.

hmm, isn't that the other way around ?

We should know whether schedule-enable was processed or not, since we should receive corresponding DONE message (or not).
But if it wasn't processed, then we do not know whether context registration was processed or not (as we look only at G2H).

and the schedule-enable H2G is not "lost" by GuC but rather it will be made void by our explicit CTB clearance
> 
> A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> simply drops the duplicate H2G. To keep things simple, use
> `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.
> 
> v5:
>  - Check for xe_sriov_vf_migration_supported (Tomasz)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 33 +++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9f0090ae64a6..3ac654cebc79 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -32,6 +32,7 @@
>  #include "xe_guc_tlb_inval.h"
>  #include "xe_map.h"
>  #include "xe_pm.h"
> +#include "xe_sriov_vf.h"
>  #include "xe_trace_guc.h"
>  
>  static void receive_g2h(struct xe_guc_ct *ct);
> @@ -736,6 +737,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>  	return seqno;
>  }
>  
> +#define MAKE_ACTION(type, __action)				\
> +({								\
> +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> +})
> +
> +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> +{
> +	/*
> +	 * If we are VF resuming, we can't exactly track if a context
> +	 * registration has been completed in the GuC state machine, it is
> +	 * harmless to resend as it will just fail silently if
> +	 * GUC_HXG_TYPE_EVENT is used.
> +	 */
> +	return IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe) &&
> +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
> +}

not a big fan of this hack, but since it may work and speed our goal,
with re-checked/reworded commit message,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +
>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>  
>  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -807,18 +828,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>  		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
>  	if (want_response) {
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
>  	} else {
>  		fast_req_track(ct, ct_fence_value,
>  			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
>  
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
>  	}
>  
>  	/* H2G header in cmd[1] replaces action[0] so: */

