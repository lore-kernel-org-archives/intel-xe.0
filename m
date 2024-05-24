Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5B4C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 21:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB84E10E042;
	Fri, 24 May 2024 21:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0e9mQqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD0310E042
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716587168; x=1748123168;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hj7ODpXsDWwVNs1dY7MzWfjqkBJMP3rFYK3Ibr5ep5o=;
 b=h0e9mQqTQoSVylksZ4J0gwz4dBfrFyF34z7weW9aZLVRFUNgBtPPk5P7
 iKtO5wNvQ2LlCR0lQYzU7Y8zvs11MBpOyGQHL+zMh3BvV7VU9ElcFxOS1
 gAW1767wlEKt9L01zH3uRKqj7Zrq+CgKC/qCPUwv6sVTlbxzi9uD12e0+
 93MbRvN4wKpE3nn/4vw/EAgcbXrRtgjfSTyWimBeMR9PnCXdibkvElta0
 awqNHeR7iYxPad4bDDaQp5AGvnshZtB+7wws5jqaC3NwYbSUuoRj/ZdUq
 K19a9lJoi9ovGa88qxlQ/Eghgjfn/W+aSlk2g5RKPqQWdXtiGjshhZGP5 Q==;
X-CSE-ConnectionGUID: y8V39d6rRkWvMzB0UG+dOQ==
X-CSE-MsgGUID: itN2tpsjTfmcci7Z5zrWBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13154476"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="13154476"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 14:46:08 -0700
X-CSE-ConnectionGUID: XIv2MgCpSHCv7DSVnIzZ6A==
X-CSE-MsgGUID: uv4DOb8CRcaQWZ7/bdLAQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="39002068"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 14:46:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 14:46:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 14:46:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 14:46:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBebskB/hpJnF/SXtuADW3g+Bn8uyQtFNrzBatpF0FxsiXJIR/mTWonmDMZPsJw+gk15meN+HHgjzTgEkIveKVVja0XROphO895xft6C4REnJhlRvrCCt0x3RixWzHhKusVD1Ubvt2TXHxuLT0jM4t0A97sdkp1+E1klNDXUckdEgsVNKCAh80rwD9Zfsnp+Qn0OvnbcyJvYE6V27Agki5aaTgsFykGQBUe0jwUC62w2dhFu+fhAQnvDLrG/8+PDdZtnCPbNQFQSadVwzPJ24i5ixJ/mu8yMx/8PsBL1ZwPB9fdRKoC+FAI+8g0gV+ErLc9FiHqgRNiJBIotfX5g7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzMlkqkQgGDHiZWVhemqoLL+V/haXSFZB8TTYhNX5zo=;
 b=el07220OXbd01OIbuB3SLNKk7VJs4GZJfxBcpi5g16LGD75OYNqg4px/abClN1JO6IrQgjMtXPSlRwsxQ+mXtmhdHCRnwGlkdHjb/ZmkZx4bkg1EjlWHoTQi+nSpJR3vTHmB8WlI3sGrapxehT8POgsX74BbX5KGdBA/BBBoKfoOVNw8sJGzMJ+aUc5x3yLwV+AmYbUZHGwWBaOhUQg45Tti69YDdIACUNs55XRDBLPQcbGDP6EPx5c8A+ENL43/8TK9+MwCUeqpyCII6VJdtSDWGLEulZjz7Iz4ELAbmuU8uZHEkXWC8n/lfG4NJeMZl6VRla1FngdB7SfDx8eMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 21:46:04 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.7611.025; Fri, 24 May 2024
 21:46:04 +0000
Date: Fri, 24 May 2024 14:45:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jani.saarinen@intel.com>,
 <matthew.auld@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Use run_ticks instead of runtime for client
 stats
Message-ID: <ZlEKjjKtgXpmAA3B@orsosgc001>
References: <20240524210949.1345804-1-umesh.nerlige.ramappa@intel.com>
 <ZlEDgDx3fDtiQSEo@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZlEDgDx3fDtiQSEo@intel.com>
X-ClientProxiedBy: BYAPR06CA0062.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::39) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b03999-ee65-4392-6ff8-08dc7c3ae957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHdZQ21FaUVMQWQxQWpScGlNb3RGcThqVmdHM0RheE1MZW8rWmtSb1QzWWMy?=
 =?utf-8?B?YnBrZGRDanFHSk9aMlg2UW9FUGFuVlVWaVNWY2MwTWFzWXZNQVQ4aUFrT0d5?=
 =?utf-8?B?bjQxNVBVRG9CZVBVVGNUSjZILzd4VDFxd0FXTXQxZWdSUC9aVk5BZ2xMQ0NV?=
 =?utf-8?B?NnJLVTB0QlhDTERKR2JpRG1raTNSMmU5YWsrcTZEN2ZHcHd5UUo4T0toRHJI?=
 =?utf-8?B?RkpsdElFKzk5ZndhWkpNYW0vUm9HMDFBYnh6OHQwbE1uclBzalpBK3EwcDFw?=
 =?utf-8?B?Ty9XUzZvV0RQbWRrUlZjbnJsS242MU9kTnZYZzVDU0w3Y3cxeXo1a2xZWnJl?=
 =?utf-8?B?RlA1RFIrcWpZKzJHb3BESFJnc1JZV2lUcnlEREZQNFFSOTByMTVTbW9KN2tW?=
 =?utf-8?B?RkZMRkdmdWJxc3JPTkVXZkFtVVNkRkJVTFI3MWJ5OFlWd05tb2NrZDJuRU5n?=
 =?utf-8?B?d2t4ZXduT2VVZzByZVFxVUxZWWNJM1JDSldTd2RweVk5VTNJK1hXODZ6N0dn?=
 =?utf-8?B?ZVJtOTdQeTlmYXZ0WHZiYnlRcTZycEc3UVRtQU1ibTY5a1NXZWd2ODNNdkNq?=
 =?utf-8?B?RDVoS0NUZ052RVU5cEE5dnN1Wlgwa0RuREg1ck9HU1pmOExhMVJ6UGJGeEFa?=
 =?utf-8?B?MzlMSDVtZm1GZ3NsR0xvaE8za0J2NjdiaUt1YUUwb2tGVzl5bVhKdGtva3J4?=
 =?utf-8?B?ZnpGRVREWExzUnFsTUxPUFZQQmRUMjRGUjVra3VWNVMxN0IzcUlDcmFRZ3Fr?=
 =?utf-8?B?b2x5VWhwUnNrRHZid21DNmxtWGhRdm9SSmdzRk0rQzdhV1BGVDhSMGpoT2ph?=
 =?utf-8?B?QWxrOXhUZUlvUFFqVGhkNDdYdU5VN3dCMVgvVTlCK2t3bnFtV3JBUWIzei9H?=
 =?utf-8?B?RkRpSUdBV1VUQW1xWnFOM2NNV2syaThEdzkxM3NCb2FRQUZXWmc4Y1RlK3Rn?=
 =?utf-8?B?Mk1Bb21RRDF3UTNXMXVvT1I1YnRVVHpQR3U2L21qTlZBeGhZM0pUZW83VDhr?=
 =?utf-8?B?QkdmdkJmY2FZdWNuaEtSVlVua1gyT2xubkEwWGV4eCtHaXBNM3RuenN4a2Y4?=
 =?utf-8?B?ZWg3cklxRDVpUk9oNUU1UlUxM3ErWlMvOEZzdG1uUzFVOVBFTnVUd214Um5W?=
 =?utf-8?B?RHBDTE5maHZGZGQ1Q08vdUs3MUVOSDlTTXVhQ2NPTmdrdXhaZkJmRWZvT1l5?=
 =?utf-8?B?NkxCVXRKOWNzall0c3Z2SGM1Y2NiTW9rcTBYVjE0RGNhckZoOW1UQUtxOHl0?=
 =?utf-8?B?Ly9wVmdKdjhwZC9CYzRHV3ppUVBVMHhhc2VOZWJjWDlmK1hWYlBNUmJuMzNt?=
 =?utf-8?B?WC9HQ3hPdUhvSnBScGI5djc5dTNReTdPb1hGQ1hwcUVWWExjWU1QRFZ2aUZO?=
 =?utf-8?B?VUljQ0JZd083NW5xYmJFajVjcEtzZG1EcmJ6SWFkUmpCanMzTVgyRzV2THdY?=
 =?utf-8?B?UmFNNUV0eVR5YmtGVDRXRVh5UTFiMFUrOEpLNEx3dE9hbnJnNWErbk5QNU1V?=
 =?utf-8?B?dTlvbHpVckxFcXR6RCtLOHp5SU1XaUtza0lna0pKM2ovc2J3MjFVcFhkZmd4?=
 =?utf-8?B?UzVSb1pycWFvZGh4U1JnT0dpT2VKMWJXNFo5RnRwbHNUemRQbWdYSm5nRHFi?=
 =?utf-8?B?cm80YUcxM0ZUazg0WFM1dUJPNUwrRTRDbyt4cHZwMk5QQnRndFVtS1V2SnBt?=
 =?utf-8?B?Qmh4UkxSd3FJejJLeGpMeVZlb1QvREZRU0NXeWwzYy9KRjVEZlhVV3pnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWpmSHFvQjc5YmRUVW1CbGxPMDBBR01tbG8rTGpBck9sTVc4ZjhUbVlLbUZm?=
 =?utf-8?B?Z3Q0dzFBMjloY25XUjhtcXR6VENtbEp0WHdUK2dTdVIvRWsyMHdQb05FUDll?=
 =?utf-8?B?MFdXSXdtbGUzTjlSOEJQTGtxdlBRcEN0K1NXQVYvY0JpQXZFdFJOdkozOFV3?=
 =?utf-8?B?Q0o1MVgvaW9OaEc0VGMveUFEVmo1S2wyZ0psZGxmYXprL1RKY09oUG1ET3RD?=
 =?utf-8?B?WEpyemFLUTdiYmFKYncwR05oWTF0dVhaUXRYSUlDZ1p4UHRFWGZHTlg3dTdr?=
 =?utf-8?B?SHpWTmoyZlU1ZjBiU1BJQUdnazdibHVNNnY2UWNNOVA3a0ZCaHozUzhVek9z?=
 =?utf-8?B?dnVXVXg3QVoxeitjMDNOdE1hRjZlK21QbERqeCtvOVVsdFBXb0ZRYlN4TmNJ?=
 =?utf-8?B?QjcvWFgzTmpscWVWa0NoNTg4VWhON2dNMkMyNmtldE5Td3dWTUJTdEVyZWxs?=
 =?utf-8?B?RS94VXlhQ0J3bVUrYWhta0FuRnNaMm9wWkpLUjMyQ3U5RWNoa2hqdjY1dUFl?=
 =?utf-8?B?eUIzMThva3lYazdwNmRjNmtxQ3NGbGtGdHp1R2ZWcmVNWnN2TTZCdkJ5eU50?=
 =?utf-8?B?L3RrS0MxbzJteWphazBqN0xWK3oyeXdkOTlUWGhGb1R1R04vazVWcUpueENU?=
 =?utf-8?B?cDl0OFAzMHB6bU84S2VRc1ZnYUxZYWJjeGh6cEI1SHJQdzVoVnc3UHZMcEFk?=
 =?utf-8?B?d2ZiUi85SHZOTE1YeDBPRDNYT0JHSTBMdkJyRm9RTmd0SWZmYy92NlRXMi9r?=
 =?utf-8?B?MXU3ckpMKzhZN1NLL05BS1ZEN3NOeUxnc09adDlrTDNsQkJsMk9nSVFlek56?=
 =?utf-8?B?R1lxVTlHeW15cGtTL1p5ZlF0SjBqd090Ry82RGwrM0JCVWNtWWVhVzMrT0VB?=
 =?utf-8?B?M2w3amVLdXhzYm5oQktaMW00cWhybjBFS0ZIWVphWXdibXRudHROZ0ZmOFRj?=
 =?utf-8?B?SEZYbTJzczdyYmhSQVNOU3prLythaWYvWjBnbHg0RnBJdEZIa21aVi9Rc2xE?=
 =?utf-8?B?MUd3YitSWnFXeUxSbjExZEw2N1IwZEhMV21hUER0enhpSGpRYVk0K3htT3Nx?=
 =?utf-8?B?Z3B5OTRhUk5NUTJLcDZnY1k0ZkVYdVNxRUZVZng1NEJaaVVMVlM5dGV4cUVq?=
 =?utf-8?B?a0ZYUHNXZklNOExld1g5dWtVRElzZHB5R0VibTNOdUlVQ2xKWElmY2lPVTJO?=
 =?utf-8?B?azAwdHd6YnhHajQ2OGZlb3ZFSW9vbHJGUkI5TXgvY0RYblN5QU4valBFcy8w?=
 =?utf-8?B?UFJhZUd4ZWtMeDlybUplenR2WE5hMTd4ZzVQdTZwbkZEUEhxMDBVSXEyRUNE?=
 =?utf-8?B?ejc0SGlQZ2VNVVBQVUVRaWR4eWJxWkVJTXUzdmtNSjJCaC84SUZjNnJPSVEv?=
 =?utf-8?B?VGsva0NJVnArekRKeGVtbGtpRnFrVHBGZXZUUTBjRHB2T3NrMVBMNFZITUQ0?=
 =?utf-8?B?QkpUblMxaFNVUFRZY0JxZG8xZ29PcWhFa3RmMEk0NEhqMHMxemR6b1pCempz?=
 =?utf-8?B?ODFDeDFGRitHOVFpK0I4OU5MNDFUdjN4a1JQcmw3bEJvOFh4bnRTenU5c0w1?=
 =?utf-8?B?amphZGdqV1lBNEx3bTJ0T1BaZnRVNWpoSE1uak55NFIvWlZiVlhNbnYyMGZt?=
 =?utf-8?B?Q2ZvbFRKcHdlaTlJZ25CQU5Xb2RKWU9VdUxrRThvRTBUV2hyeHh6b3U2SXhZ?=
 =?utf-8?B?SkoySmJ3ek5SNGhHZHBjUlBMK256aWhvakIyU3RPN1Y2YXBvcjhXUHk0dTdh?=
 =?utf-8?B?OHErMHFYRml6MGpWOWVBUjZtdVFHL3lCTnE3UyswT3JkcDZXaGNQWTZxM0Nu?=
 =?utf-8?B?SEdQeXQvQ2hhd0FjOEFJUnI3eDNUMW12YmI2bjdJSTBieFVwclY5SU1mQjJl?=
 =?utf-8?B?VkJTOHF5YXN4d1pqaVlrNUYxYzJOQXhnZmdHUi9XVEdnYmtUN2lTa3ZJZm0v?=
 =?utf-8?B?dGlhWlgzQzljSHZsNmxObk9ZMnVVSVllVWxwZUJyVGlrQjIvNnJZUmJBUGZh?=
 =?utf-8?B?WnV2UWhTMHJRRnR1YXMyd01pb1Q0M1VrUm9qSEtxcDdoUE9sVGxISjB6SWJh?=
 =?utf-8?B?UmtVblN4dzBxcjVvVnFGU2N0Q3R0YkRqVk8yUDFKcGNzbFVPMlZtY3dMajV5?=
 =?utf-8?B?anFRSk5KdktKbW12YVA5cmUvMENmZ1A3aWFLbUhCMXJKUnFyY3JSay90cEwx?=
 =?utf-8?Q?9uMShXBsZ1ptW/ChSp9lGpI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b03999-ee65-4392-6ff8-08dc7c3ae957
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 21:46:04.5846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8j8SjxqRojlnwM523C1n2llNA+4i+WTjMmYbQYf952+ZXBEyxEKipGVtyTPRjTqBQuRwk+D/HsLaLPLBhqoYqxyEJd/SjO8ERH0cmHlsKt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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

On Fri, May 24, 2024 at 05:15:44PM -0400, Rodrigo Vivi wrote:
>On Fri, May 24, 2024 at 02:09:48PM -0700, Umesh Nerlige Ramappa wrote:
>> Note that runtime is also used in the pm context, so it is confusing to
>> use the same name to denote run time of the drm client. Use a more
>> appropriate name for the client utilization.
>
>First of all, thank you so much!
>
>>
>> While at it, drop the incorrect multi-lrc comment in the helper
>> description
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
>>  drivers/gpu/drm/xe/xe_drm_client.c   |  4 ++--
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 12 ++++++------
>>  drivers/gpu/drm/xe/xe_exec_queue.h   |  2 +-
>>  drivers/gpu/drm/xe/xe_execlist.c     |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_submit.c   |  2 +-
>>  6 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 03bedc33b21a..d0936d82cc1d 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -556,8 +556,8 @@ struct xe_file {
>>  		struct mutex lock;
>>  	} exec_queue;
>>
>> -	/** @runtime: hw engine class runtime in ticks for this drm client */
>> -	u64 runtime[XE_ENGINE_CLASS_MAX];
>> +	/** @run_ticks: hw engine class run time in ticks for this drm client */
>> +	u64 run_ticks[XE_ENGINE_CLASS_MAX];
>>
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index af404c9e5cc0..5679e9b15d06 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -252,7 +252,7 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
>
>while at it, could you please also update the function name?

missed that one. Will update.

Forgot to include a cover letter for this series. Hoping CI will still 
run with both patches.

>
>with that,
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks,
Umesh
>
>
>>  	/* Accumulate all the exec queues from this client */
>>  	mutex_lock(&xef->exec_queue.lock);
>>  	xa_for_each(&xef->exec_queue.xa, i, q)
>> -		xe_exec_queue_update_runtime(q);
>> +		xe_exec_queue_update_run_ticks(q);
>>  	mutex_unlock(&xef->exec_queue.lock);
>>
>>  	/* Get the total GPU cycles */
>> @@ -287,7 +287,7 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>
>>  		class_name = xe_hw_engine_class_to_str(class);
>>  		drm_printf(p, "drm-cycles-%s:\t%llu\n",
>> -			   class_name, xef->runtime[class]);
>> +			   class_name, xef->run_ticks[class]);
>>  		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>>  			   class_name, gpu_timestamp);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 0fd61fb4d104..841d3ea71e0d 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -756,14 +756,14 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>  }
>>
>>  /**
>> - * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
>> + * xe_exec_queue_update_run_ticks() - Update run time in ticks for this exec queue
>> + * from hw
>>   * @q: The exec queue
>>   *
>> - * Update the timestamp saved by HW for this exec queue and save runtime
>> - * calculated by using the delta from last update. On multi-lrc case, only the
>> - * first is considered.
>> + * Update the timestamp saved by HW for this exec queue and save run ticks
>> + * calculated by using the delta from last update.
>>   */
>> -void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>> +void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>  {
>>  	struct xe_file *xef;
>>  	struct xe_lrc *lrc;
>> @@ -789,7 +789,7 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>>  	 */
>>  	lrc = &q->lrc[0];
>>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>> -	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
>> +	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>>  }
>>
>>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index e0f07d28ee1a..289a3a51d2a2 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -75,6 +75,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>>  					       struct xe_vm *vm);
>>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>>  				  struct dma_fence *fence);
>> -void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>> +void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> index bd7f27efe0e0..8e5c591fcecd 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -306,7 +306,7 @@ static void execlist_job_free(struct drm_sched_job *drm_job)
>>  {
>>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>>
>> -	xe_exec_queue_update_runtime(job->q);
>> +	xe_exec_queue_update_run_ticks(job->q);
>>  	xe_sched_job_put(job);
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 54778189cfd5..ee078a6d174a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -763,7 +763,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>>  {
>>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>>
>> -	xe_exec_queue_update_runtime(job->q);
>> +	xe_exec_queue_update_run_ticks(job->q);
>>
>>  	trace_xe_sched_job_free(job);
>>  	xe_sched_job_put(job);
>> --
>> 2.34.1
>>
