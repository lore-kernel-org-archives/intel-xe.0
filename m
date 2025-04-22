Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377E2C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 18:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF38C10E2CB;
	Tue, 22 Apr 2025 18:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+unYW2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973B910E2CB
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745346280; x=1776882280;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yrulMO3tnoZ8AupK2eyRq1pPT4qnwmJTKQboH9u98So=;
 b=W+unYW2AE4TfXBHB0ms8i+fCk250JL+bKVkDgxxj6Zq2jKObn3JKUXQA
 sJ5UL6zteB4sJ9+yC7By1lqx4IP5kFz/iP2HsCtmaH0z7tDtzfv8tBWZL
 1gmf/357aDyX0zt1Ip7JKHWZAdmfuSDEWLFGwME2RIsQe4mVMOkAbjzNf
 6OMwgYpFbIqzrfRfSTZtYdkzKaOeCyuhM26LFGBwET4jezj2IdneLn+h5
 dMeGnSE5BY0gsYLkzXV2I7BCkIcz4TipSRuDYcmiYH4wbE6/XJmjVWunA
 XMKkZjEvjB1XLxhJKtzZ3HHef0cM4QHYbJOUonFwHpCQB2oZECk1Slh09 w==;
X-CSE-ConnectionGUID: HGi8dQxjTMmEVM2pMsKscw==
X-CSE-MsgGUID: mQ3BQT0rQey/qdueT+J59w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57903648"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57903648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 11:24:39 -0700
X-CSE-ConnectionGUID: Nz6iwDitQFmlfBXjE7xzOA==
X-CSE-MsgGUID: hMJv3CCCQ3CUGd7ypQF1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="137073477"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 11:24:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 11:24:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 11:24:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 11:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L13WW1uqWU5xETfyipdgiAElnDz5UswUXmC5SK1G02hryMu4PfwZ3YQJhgEX87YrXh3WYvMVP6PsfA4zBCjp6+i2ddj0Fm8CLdWN3axxv6ZP5WiGj+cGhHLtZQrRpUhv1gjmnJoP/gFMloOp7yjJIwQlIdII3UAGA2DmPjqcsYC44rrtcHcaTUiChWHXwC3xjHNWUSmlcbxC4WPLh+qFpNDvi6MTXkY8cs8CH3I4tXUQ+IfeTMbNI/sFbUv6iXpAWnAhelf61v6lihU/HZg9eNzbE6kwZ3E7dJJNGl+Riis6UP65B47AXRouhLr8E/x9Ex9n3uvWXMVz70t0yjKGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1021BaBN1tRutgGRApZ1UdyfEUq1sNCllGl4k/QvlJA=;
 b=FfGD9+aoR3Ssd0dXdBAjtQ0rR+t/2VIj46nmyFPVYoUlMvoR5fe7g1zyWGOl71bbpXvO4+30ZWFvrnUjMXcjYWu+t9ON77IwdOL/dVl0TC6P57TiNB4YrurVwQnA2nU9upq7xUTKw9dAlSLtyx94jVCQnLmw4FUH8rGxuPXYnRGMaJGSVyzqX8+cz1uOZYd/V4GBbQDNxxJaNNyYP1Psa+e37JS2PSa/xpuHKjwD8jp9o0Z/e7qWqi1i5HguUyiipev9TvZfAOwYMEIlza3fU+vtODSR1GUkN3hi/VzxqWWey5xdC2C8gEr8KyFMGMMae3JFcIlUINtd/uImCR0MtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 18:24:19 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 18:24:19 +0000
Message-ID: <5056ca59-580b-46d4-aa81-9593db4c273f@intel.com>
Date: Tue, 22 Apr 2025 11:24:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpusvm: remove unused pages pointer
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250422095943.1198393-1-dafna.hirschfeld@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20250422095943.1198393-1-dafna.hirschfeld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 105514e8-8099-4f5f-37a0-08dd81cae5d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkxYNWRkY1dBa0ZUZW5mcUF6Sm1JK0hkYjJvZURnejk1SnI1cXh0M3dSeElB?=
 =?utf-8?B?OUVCNmN2c0UySGVjNjVZTEJWeWROOVdLU3EzbTN6MlBCN1ljTG4weDRBaFVz?=
 =?utf-8?B?V05HVUhoNTQvU2llalplazY5bk9nUkNrWjVlbVhnc0tDTzBLZmY5NGxCT3RO?=
 =?utf-8?B?WFlwVWZMY2F1aWt1UkRPL3l4RVg3S0lHWTJzT3VMVkNjNUg3a0xMSFFyVUFI?=
 =?utf-8?B?U2xXeDVOOWozNHlrWjdKR2pKUmxLZFZxN1hFUmVxSDRNc2FXR0kzdTVkSEVZ?=
 =?utf-8?B?RUxMQXMrTy9ERlhJRGgwM1RsbEZET2lqYVR4R0FJeEd0OEduMndRRTBJOTB5?=
 =?utf-8?B?K24wTjRMUkZPRzY5eVpzbnZFdlA2K21GVmlrSWxBbXlLQU1meFFQZ05KNTI2?=
 =?utf-8?B?TWFscDhYekdvY1BWLzBPY3RkMVNZTjhWWnkzeGFudHFoZTlDdGxRd1dJbmhN?=
 =?utf-8?B?dkFUN205bkJCUVVCWlpJY0tqWEwyUTgwR0N0cFhEL1BnVE13aDRBeVgvbUxh?=
 =?utf-8?B?M2cyemQ1VGdtOGlZMkxTVTBtUENBdUtnN3R5eE5RVWY4aWR5bmhxcEVEVVBo?=
 =?utf-8?B?WVI3S004U2VPTzZkaUlFQlUwT1lFcGpLeHd1Tm83bDhUR3ZISmdlZUxHZEl2?=
 =?utf-8?B?cSs4YjI1TXBVclExdDE4eDZ3Z2lUOGVDcnZtNmJ2ZXM3bTZkTUVISjlEeWJF?=
 =?utf-8?B?ZkpUNGw0R2JUemZEVGNqNEE0S3FCSDBJOXd6TnJ4NHlzYmRYOTRZK1NKcFdw?=
 =?utf-8?B?UWdyMkhyb0lOUTVleW5nWEU2UjdJYmR6VU9FNmhzdElqMEtjZkYvaitUN3NI?=
 =?utf-8?B?ZGhmcEQ1ZExSNmduOWQxcnZmYTFBYUY5eTR4ZnYrVVNKemtucTVoUWlQSWFX?=
 =?utf-8?B?VkVpM2RWdHhwZ0p6TWFVSHpSZEVVamhZYUdWVTBveWtDRFhIZVR5L2V2Ymcx?=
 =?utf-8?B?NWhUczJ5YjNaZFpzdXI4M3p5YWVuSm1MeS9KR21zcHlUVUdzZDFqK3RsWXNi?=
 =?utf-8?B?VTVlVGM3VTBOWXQ1M1FCRVh2bUFKdjNJdFU5clMzd0o5TU8rdTF5a3lrT3Fo?=
 =?utf-8?B?S2xIblp3TlFmaWdqMzB2R1dlVnBjNlN4Y0NoR2Z3cllxSy9GNUJzb0pOWTZR?=
 =?utf-8?B?Mm5oRjhMdTMzc09jRG1NS3lEMFBUdDdUaksxeFdVY1MvNk0vR0VNQTE3eXo3?=
 =?utf-8?B?eU5lcU9qNStmTzliMTMyRTU0QklmQ0xrRVlGM0VCSTI3WXlteGVXTCtLOG1V?=
 =?utf-8?B?TGhHcCtLN256ajV5QlZYblBuTGhMYVpUc3IrVnQycWNaQ1ptSFNBdjJIb2VU?=
 =?utf-8?B?ZEFtWlJiM2dMam9oMnEwRGtjSjFQUno4eS8vNmd1TmFwMlJUVmt0enZHNGpW?=
 =?utf-8?B?Vmh1Ty9uMTNyc25QYlRya2hVeCt6VTNScXI0dGNEdGlrbk82SVduYzVxUTZy?=
 =?utf-8?B?dk9kNXpqYzM5QWt5U2hFcFdVMlZYUE9TMUN5d1pCNW9oZ1N1d3ZMZnZjMmJF?=
 =?utf-8?B?bGg1Ykh1ejZLdnhkbE05RHpBRytMcVZPNlhpUHc5TnZWdnRNSzFhRTdBejVQ?=
 =?utf-8?B?WnJJbTRHUlV0OEZHVCtuSkQxVVZvUWdYcGNjY1hQWTZDL21Zb2I3KzdRUzZq?=
 =?utf-8?B?a3lyVXVYdG1ab2NYT0JwWVBtT1ppZ1pIOVBpYkJZZjlJS21Qa3kzYVlUZWtJ?=
 =?utf-8?B?MndNdG1vLzhWaE1XZm1tNU1KRUlnd3JsQ0pqTnlBV1Z6WUZ4bnhtN0g2ZG5P?=
 =?utf-8?B?TWwzY0g3TCtsdFlyMHhvcDl3Z042OEN5d0xKdFRENmorbFlWMFRldlBOUGc2?=
 =?utf-8?B?Z0dTSkRFakU1QzR2SGVzdzBLN0ZUQVVKSmlPZFd5WWJWVlFVOFA1Y0o1cGM5?=
 =?utf-8?B?Yit4V2U5UFhXeXFjMFREbi90RC82cXJmeGY0cFlhd3BOOGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnZMRkIrRFhJTTZ6T280aWw0TzAvbnFJY3pQMVZiOGJNbXFhUDFiUDhNMmpw?=
 =?utf-8?B?bzZuLzJra1JTUUV1M0lCU1Z2UXdWdDVUVGk2ZWFlZlBJWWN4bUVlaXFrVitC?=
 =?utf-8?B?NDB3MmNLdVlBNEdaTS9NTzFFTmVnV1hnNUxic0NZZEVGZXQzYXJub3h1cmlO?=
 =?utf-8?B?dDZmRVA4RjhuNTducGVSTHdYbEhUcDJqZTZNOEdibkRUMkJKQmZXZ1o1Y29W?=
 =?utf-8?B?c2JSMDNOSm9VU0xsY09ONmh4UUlTK09RN25oRVJ4OVdMWG1zMEhvTHVyWWxP?=
 =?utf-8?B?MXVZYkdRMEUvSk5Nd0JEMTMzNllnUEo0Wm84K3hQbGtKRGZKNS9Cb3h1REhI?=
 =?utf-8?B?MlJrVEl0ZEhMQklIUDB2TlU3aHBEVzlaS0oyL0Z0VUp2U25YWDlTcldBcmtF?=
 =?utf-8?B?bmdaMHExejlUU1pqTGxxUk9NamRxbFZqZ1lod2lIekg3UHFudy9PdUZ3a0Zi?=
 =?utf-8?B?S0xBRUJtVU1iMDZzbG1aODdITkpWYXduRmtNVlVYNVZtYXNNb0FMYmlhVzlx?=
 =?utf-8?B?ZjhORmJxNDhycDB1ZGJ0NEY0TWtZN29DbjNEMjljZlpnUDF6K0NianpwL2Jt?=
 =?utf-8?B?ZFFpT3czUFM5ekd5UDBEUVduKzdXY00rR0lMR2hQaWE5dit0Kzl4UHpab3c2?=
 =?utf-8?B?V01YREtLWWhXMWo1S3FacUFENGZTNUlGVXlkaHF3MVl2Ymxkd3NwOURIZU9J?=
 =?utf-8?B?c3lCZUhBbnVxcFVORWQyRmVIbXY0UFVqWmNZZTlzUWxIaXk3a2RrRkV4Mjk1?=
 =?utf-8?B?d2VVdGFUajlQUjA1VXJWYnpDWnFNUys5dU5aTndpbjk3R0cxY01jY1NmRERt?=
 =?utf-8?B?a2NLb2p1bkttU2lyQ2pHSTg0Y3NibTVXMUtrcVRueWczdG1Pd1g0bXdZSHR3?=
 =?utf-8?B?cWU5b0lKenFOZUI4bXB1RTRTeHhYMmtSN1lPblBGYlJuUThjVm5CQWhiUmtY?=
 =?utf-8?B?aHVkQ3RkTXFHYjBrSXFKU3lCR3gvdElnaWhST3l3cjEyMHNxcERvWUhLemZv?=
 =?utf-8?B?SEpEQWdjSHlTTFZSeEhwbFlOc2hPQ2IyN3I2MVBGeEZBbDFDWW5XVU5XRFdZ?=
 =?utf-8?B?VDd1alUwN1QvcS90TmNGQ0JGcHZBcUNLZWdjNHNKNjNuS0h6bkNLbFdIUEdi?=
 =?utf-8?B?K0g2bzJKYVg4bXIzZkhtb3NsQWYwaFh6dCtoaFBQMC8vU1RwdmVkTE93Znpy?=
 =?utf-8?B?NjFJRVRqRGFuUmJRNWdKN0JqSG9XUTRjbDFKZUNRT3gvbnAvaHF2MkNOMXMw?=
 =?utf-8?B?ZEVIU0ZiaXRrK3lOK3JubncvYlJUTVVGZzYxSXUrdnNrV2I2UGJWQzdnaFJL?=
 =?utf-8?B?WmlyOXFWdDZSODhCTzJtTE9yWjhvOFNkZ0ROMHQ4WmdLNDdWUllDZmdxb0dK?=
 =?utf-8?B?VG9DNkpCNEpZajBENmNpRGpXSjhzMkhBUVdpZXNFcVFSMEVYRlVaZjhvbWlU?=
 =?utf-8?B?Z1E4c0dBcjVEVzRnY29IdzZCUURYOFBqWFpMSnRPS3NsZktHU3lqRUhwalJx?=
 =?utf-8?B?aFlMQXlLN3hOTnhQRklWUlFRSGVmQ2UzUFFHL1EwTWh4L3hsSDMzZXh3ak04?=
 =?utf-8?B?Wm1HbnlTYzU0V3RlbEJlbjd6ZG5MTTF6OTkwV05aaXllWXgxMS9aaWFkdFBv?=
 =?utf-8?B?WEhETHhTQktrei9odHZNb1puZERVb1o5Y2ZVU3RhK2V6dDc1ejl1dWhNK2xP?=
 =?utf-8?B?djV6ZkF5SGZ0Wk96U1dheHhaY0J5dTdScFFvdU5aekhvVHZvMDE5UkFnSmF6?=
 =?utf-8?B?cFF4eDVWZVF2QkErQ1NrNzRWMVNFclE0KzVxdXh2enhiVDBndHlscmxFTXk3?=
 =?utf-8?B?SjVteXRDRlpTVFVwRndBN1d2KzltM1R6Q0FqTEg2cG16M2wwZ2VyRmczbWhL?=
 =?utf-8?B?MlRkUGRYU1FYRFFFdkgzK1FrVkxGUDg4SWlManlVbUhIQzVrM0JrcEgzd2hv?=
 =?utf-8?B?Q2JJY0ppVGV0ak1ZRzRJdUxhd3RLSWkrQVI5YTh5TjZYdGlXU3k3d3dYQ3ZX?=
 =?utf-8?B?YXlLRkgwdWF4SisyWFpaMkp5cVI3czlEejdiM2xFK041Z1djNkNmdkFveitH?=
 =?utf-8?B?SFdHNW4vdzRudVpCUHFWajVhYUJhVlpETC83UTRLT1E0VzlJMlE2R1pPZXVJ?=
 =?utf-8?B?Z2M1RUw4Wk5oVTVNOWNpT1h0K241aEcvZ3VjajQvRVN3QjA1Q04vczNoNzNF?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 105514e8-8099-4f5f-37a0-08dd81cae5d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 18:24:19.7876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qhMIE/aOVB9EPL1YxpZyYo06o0dkJHsV4fPbEwD+apAisVv4UYom8lMBs898ZREe3yNQ4n+vyZfQBtztJcp3/ZuhqcBRpWgXShLa8zeMUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
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


On 4/22/2025 2:59 AM, Dafna Hirschfeld wrote:
> the pages pointer is not used, remove it
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> ---
>   drivers/gpu/drm/drm_gpusvm.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 2451c816edd5..30408f2dd370 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1330,7 +1330,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>   	unsigned long num_dma_mapped;
>   	unsigned int order = 0;
>   	unsigned long *pfns;
> -	struct page **pages;
>   	int err = 0;
>   	struct dev_pagemap *pagemap;
>   	struct drm_pagemap *dpagemap;
> @@ -1368,8 +1367,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>   	mmput(mm);
>   	if (err)
>   		goto err_free;
> -
> -	pages = (struct page **)pfns;
>   map_pages:
>   	/*
>   	 * Perform all dma mappings under the notifier lock to not
> @@ -1444,8 +1441,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>   				err = -EFAULT;
>   				goto err_unmap;
>   			}
> -
> -			pages[i] = page;
>   		} else {
>   			dma_addr_t addr;
>   
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
