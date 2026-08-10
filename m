Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B6BC5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 21:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120B110E1E6;
	Mon, 10 Aug 2026 21:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7jN9LH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2E110E1E6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 21:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786396312; x=1817932312;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2UPkyiTCRE/znl1kjuJF/j9YDONRUCI74uP0wQ5UreU=;
 b=Y7jN9LH/tGBISfbgNvxfhQ7bFfxa3wfaC2OWuPSpM42iSaD5AiJOn8pA
 MuZ21e/lyV1UgljBx5enln+1gMS2X7VP2RBaVvCE47Gcvd+iNcsYJZDbk
 UikYc97uzIBEced7YOvvXznXnqsnxnLAJx6B0xXCcBMesifANzKIsPg1l
 x2Cofhyvq70XYNi39ykYP/Clz/nORScWllmPrAfZOH1/V8vbsnURqgG4W
 z0F/IhCt5QEQ0+yze9A7CkODqbUe3IGguVW7B5UlvkzZYYYVvbWQtRK0Z
 CYhTjwxYfo2zzOTdSJBfxl6W2IRq2V/MSjOVqQLRbPjMkMn1ZlhJMClgP g==;
X-CSE-ConnectionGUID: TOQwmuZcRPmW6B/ft3dkWA==
X-CSE-MsgGUID: 18DxZUlRQC6kGCzSzy+6/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104453030"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="104453030"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 14:11:51 -0700
X-CSE-ConnectionGUID: i73smuSpTliNgi8tIHKYnQ==
X-CSE-MsgGUID: FZEVhtx+T1eJQbXeMb8YuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="259296470"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 14:11:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 14:11:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 14:11:34 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 14:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCO6Nkh9fQoai31+ed8vN4hsK9+Mn2yp9LCswEKWLdpqweRqDXRKoB2eF96A9xOThKwRmbDcYZnK8SGu73QBrR062+sRd8Tid2Yrk3Q9wPnWAU5VoIYAfV6CFF9jGIyZ4pjNMxGWg80TO1bWDmeASAKEyBYBeIcjiSeZwzRo8SteU56yHpcPgbAIwJFhJ89KBodjac3Zy6inidGrZkw/4PDWC5hMvTS+sOc8LQXYBO+uMfsPB8hoeREI94ngbWzwG27I0LOjBT8/NxKNZjKx1JmSBtIPN7UmzGH2pCRurtqEBW5lEPZaS6aeh54YIJcu8c5PkvUXUlagx7iXDO58AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovn9KEoxZc3C85gWSk4a1GjD8ddwtWirCyria8iykl4=;
 b=l6URKe/WxFTtq1j2S5MT+TAUs4Myux7T6GLH0OCFc7EOd01uYt3s7j0f+bU3sUKES93NadEZ4nkTcAk5imEO85GdbgUFqjz+36z4h5JaDE0cqwGUMZGbev5SlKaYeacky7hW0191Kzbq8uR4hd9txKtOWxwIgx8XGbDcRUA1Cx9Qh5FFl4NJh5iFUwNTHl3DiGD9fthOg3YrURwCYZ29KVTXd1XVrRxmAhmqytSg5oipZApRemdRgQCXMbta5MXUGqKEGdPxKiQkpM/PwhUhsTXaOny1LC9D0gi5uk5XKnOLkt4ahEzW/Jvw6P6xYNmKs9+qLsmHtgzG5USMxJn/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7249.namprd11.prod.outlook.com (2603:10b6:610:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 21:11:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 21:11:31 +0000
Date: Mon, 10 Aug 2026 14:11:25 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/sysctrl: Add fwctl support for System
 Controller
Message-ID: <ano+fWaDSW1hOLIG@soc-5CG1426VCC.clients.intel.com>
References: <20260806120310.2054212-4-anoop.c.vijay@intel.com>
 <20260806120310.2054212-6-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806120310.2054212-6-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0289.namprd04.prod.outlook.com
 (2603:10b6:303:89::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 8840de66-bcfa-4f44-9d4e-08def723f361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|5023799004|56012099006|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: KnGSsdZuQ6tXeZGmufP9QdH1CzUt2XKGH9xV8E1s9aa5FEBgkArUdV3l3Id/v7flygRGAVqlfBFqCtIhPuGzfYy4u0m+rkztbmiP4b1ysWVxPLv2YbU+F92mIL6gC37cowN02W8rP3RjP9IZOMy2Zlwtwm/cjAURPPUhi4K6XpwT6YPvg3MC0R78+pIhdCtrtuDzDPQO3apAd3BwAuKWjzUd9kWNHoqzQ2aVp8Y82/dk8em0NjZJW5OGvN2wxTMf3MQrVtZjz5eg4TAK0nEt0ONd6AbVpNufKn74nOIy8sGvvxAzQ3xmb9fp21kNyd/tkYrA92aJfGNOOAxODHWNMrRB7dAClVwlBoV74eJiiviIg4xpJLNMsV5qeU/GV9M3mmQxONQzPe8mqHReDV7t4lt2t6fTJiaPlYfHrWdYMdM6AuV/+jdkfn0MeC06DB1fyzh6nCZFh0l1xcdsQfCV5jZ9upTrnHKjcmZQhawdKYc5vmpqbBubqouPw21gVvPHZIPWGnWF9nju9vXos4qTJiRuYQy8VnjYcGnYQPfpw2IgeUTm0/OKVtUeOT4uIQftnE4+/KlIIrk1SGxX6Rdg0bnZwyfw5KIqq4vQUYcXwqMZ2H7cZ8YNUFRvyH8cYoAfp2ZNZ2k1SQB/9DEwJ/xOu7/0XbLZ70JHnwDhJDPBlu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHFtZkxOSEJTdFdDb3I5eCtjalA4SmI0SE8vZytwdkVaaEZKUHVTOXpCM2V1?=
 =?utf-8?B?QVVNLytYS2dQQ3JIZkI4cDRDbDBmVXhMWmkrQ0lVdG83RjlmeXA2WEpQMmkz?=
 =?utf-8?B?cHZ5THArYjVyVnlmR0xEdUpNMThuaUtONitMYmxRRVdoZWhTT2pOdUhlN2o0?=
 =?utf-8?B?WkRQOWpqaVo0OFkycWRWckFQcVc3RzhWVHBMdXdrWlFaRTNFUWNTbUx6L0R4?=
 =?utf-8?B?eWhqU2FNQjFhZzJSTUk4R3RyaVVQeS9wZy8xQytXS1U0dkhMa3hReVk2TWxE?=
 =?utf-8?B?ZXNCWmlnN3lpQU1JUk5hTjlPaFcwNDhtVFBPMkRmQ210NUJtZDRCME42T3Jv?=
 =?utf-8?B?WTZKQ0NTdE53bFRCckFrYzQxekc4S3ZZWHZQWUdNamVyRlkwKzlUb0dPNTVK?=
 =?utf-8?B?TUZ4Rzc1T3JBVHFmS2dJV1FuNmtpVmUxejJJT09QMWQxT3RKN2d1SER6THRP?=
 =?utf-8?B?WkVXcXBVYk9NajBCUGNXOUtvS1lBUVUzRWExamg3dmNQYUhXKzZJU21veHBw?=
 =?utf-8?B?RmcwQ3laV0lKblIxUFg3aE1ReWE0U1hMcE54bzc3Nmh3OUxPVTh1ZEtORWx0?=
 =?utf-8?B?NzJXL1M4MEtudHlINXJkS1VmNDZIMDZOdmdFVFRPV2hPY29ibHBzQ2JQSmQw?=
 =?utf-8?B?TDMyeVYzQjZhTS9zenFiS2RnSjN0ei9FM3kwaFNGc0JwZEJlRG5CVVJScExj?=
 =?utf-8?B?dTg0alZCV2QrcERJSVk2Z3FXdUUxUTVRT2NnS0plakFySEtsczFzNkRkcW0r?=
 =?utf-8?B?ZU5wOEpFTmphc3JmTk83RW1LZlZZaUNHc1lRMnFxVWlXY0ZWekUvdW1RNWJ0?=
 =?utf-8?B?WDFwbkYxMFBYY2h1dWVic21HWmJZTVo3dDJUYUpYb2lsWWVMU0JRVUFyWWY3?=
 =?utf-8?B?bUpjL29xbndocEhYY2hjSGpEa2lmaXhJd2dqeTNMNUs4REMxWm9mWW1xbWlJ?=
 =?utf-8?B?TUpSSjE1N1pOR0tWQTI2ZTBOUkdFMjJhTlNkN1VQYnp5eTAvdHRTKzIrZmhl?=
 =?utf-8?B?c1pZWVlFZkFZOUxKMzJnbkpaL2xtTEhDN3lTdTJlQnZ5SUkrSWhNYTVIckxu?=
 =?utf-8?B?YjI4NzNSZFF3YnltV2FiSjhRTXhFa0dGajBXSXYxVWJadkJ6dEJwcmgyMm9Y?=
 =?utf-8?B?bWRsYWhGMGpQSDdud0hXclYvTE5EVDNER29jUlRmYmMxdDlnNWN2TWJLRHBw?=
 =?utf-8?B?NERpS0tVNjlMMkxQNHl1VHVOdzlyVHBIY3JscUdvRTQrR1UvRVJHZ0dod2l5?=
 =?utf-8?B?bEkwTlJMMzc4Sis3cE54V1F3UjdURmR2dWR3bno2WHNLOUhvY2dadi96bVVp?=
 =?utf-8?B?dWZ4cmpaVzRISVBtMzl3czk0YmlYdjh2c0I1dlRQR1Z3aFduSEUza0dCay9y?=
 =?utf-8?B?NEdjRXkrOS9IRXR6dVBxbU9KRjBPVGtUeU1ONFR1d3VkR2w3WEcvV3Y3N25m?=
 =?utf-8?B?bW94a09TZWdxR0VNR00rWkw4QjdyY0VQTEMvTEkxbXJKdW4vbE1BUW1CTGgr?=
 =?utf-8?B?Tk1VMnNXREI5by9mMHN4enp4RmFvQktPckU5VVNBSzlSbXBmRXU0R1hoY3A2?=
 =?utf-8?B?WVVVUVZlTGpVVzJnYkFWREE3M1hUMFc1YVE0QXg3SU9uUDhhVmY2MHI2emVh?=
 =?utf-8?B?aTRsUVB5c081aG5CQTJ6SGR3UE5RaFVKNmtaakgrM1ZPRjdZWG5uWnNDNkFj?=
 =?utf-8?B?NU8wUzl0M2NMa2QvNjVvYlJCTWVtR3ZkUVFyUXhMSXJKRFplQmNwUkl5QU55?=
 =?utf-8?B?UXVTL2JOK1V1MmV2R1pHL0FOWld5NEV1NmNWRkFnWmxuNTBKYkpEcEZjZGpH?=
 =?utf-8?B?KzY3UG8rQ3poWU5EUGJ2SkpmSUgvMkRnY2I0QUxFMkp5RlhmS0VSdGx1R3Bx?=
 =?utf-8?B?L2dKNjhhU21SWFVEc2kvT3hnZEJ1Zk1PaGRtQ3BOTWpkREtUdGJJZHdPamJa?=
 =?utf-8?B?ZkFFMnZUMS8xV1h3Lzh6ME4zRE4vcUxKZTJ2MG9nTnUrM1BhZ1R3RVdaVjlS?=
 =?utf-8?B?SG1TM3F1eWVKV1lUVDVwcUNDbUpoYUJiQlJwME1Va1Nnekd6cU93S1o1UWp5?=
 =?utf-8?B?VC9reG0yOEJlSmg1T2Z3ODRSZEhUdGpXQmhxaWR3d29HK0FwTFlxc3BJTWZK?=
 =?utf-8?B?RUdZeXFuMWx5UWgvckphNzB4a2xRejFPQWdXSC9FMkZaZzFUaXVzRVlGRUY2?=
 =?utf-8?B?dHFKVm8zUGNkQXZEaGs5VUVCVG1xdUplcXducjRSVEVUT3loN3ZwaTJPQ09u?=
 =?utf-8?B?aW9XNFVoakN6OVkzMVhJQ2NiTDZoQTlzYkwyZkwvTGxiclJxcmsxYzJmQ0pQ?=
 =?utf-8?B?Zzk3d1JmWDFvaXlsdTIxTStuRDdNTXJzbFUzQkRUclJiMXUxYkdiRUpldmZr?=
 =?utf-8?Q?2orDpAKNuO36eTsLIRnuBgJIn5UYofE6NfH4p?=
X-Exchange-RoutingPolicyChecked: G2IGB4cjVMxd9E1DFlqbE4WSPeMN/mDjq0iB/DkYVOa7N2tjIcCLEw61OiUrXLwGnpq1NgGDAfoF5HtlL0yPtk4TXDy3LHHsjC0/tReTDoGXlG7eFNEuZpIsABBKqMY5FEJmVtbbAoCXXWWUlMT9YJHQlKpbBEVEsqQOtij6hrD44CQ2a2+c0fjJ22oCdI+x87OOH07iS9kvl/+1ACQ8nwMtMewSvnpkZgfNMweSLrfpdGbpbmPp3hMi7Pc3dSQYe0kGyuVdOBCOw6F24hf/3bKrmp7mtkoSIG7zNs5i2Hdu0BBUaQxMFunxg2cKlxZXXzrniawQhqA4QdD//HZI7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8840de66-bcfa-4f44-9d4e-08def723f361
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 21:11:31.4971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7wOJgTpi0k3aUXMt6bxj/4L9M0D8SIylkuh7tZu/E+VeG+g4oJCFlVJM/gY08vLAa+IeMxn1NStWmO0EMg90PhDgZhewYKZDnaEO/735/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7249
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

On Thu, Aug 06, 2026 at 05:03:12AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add fwctl support for Xe System Controller (sysctrl), a
>firmware-managed entity that provides platform-level control and
>coordination on Intel Xe3p discrete GPUs.
>
>Register a XE_SYSCTRL device to allow userspace to query sysctrl
>capabilities and issue RPCs through /dev/fwctl/fwctlN. Initial
>RPCs support ECC status queries and RAS error injection.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v2: (Rodrigo)
>- Rename FWCTL_DEVICE_TYPE_XE to FWCTL_DEVICE_TYPE_XE_SYSCTRL, one type
>  per firmware instead of a shared Xe-wide type
>- Rename xe.h to xe_sysctrl.h to match
>- Squash uapi and type definitions into a single patch
>- Replace validate_scope() with explicit per-op scope/capability checks
>  in xe_sysctrl_fwctl_rpc()
>---
> Documentation/userspace-api/fwctl/index.rst   |   1 +
> .../userspace-api/fwctl/xe_sysctrl.rst        | 120 +++++++++
> drivers/gpu/drm/xe/Kconfig                    |   1 +
> drivers/gpu/drm/xe/Makefile                   |   1 +
> drivers/gpu/drm/xe/xe_device.c                |   5 +
> drivers/gpu/drm/xe/xe_sysctrl_fwctl.c         | 251 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_fwctl.h         |  13 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  86 ++++++
> include/uapi/fwctl/fwctl.h                    |   1 +
> include/uapi/fwctl/xe_sysctrl.h               | 117 ++++++++
> 10 files changed, 596 insertions(+)
> create mode 100644 Documentation/userspace-api/fwctl/xe_sysctrl.rst
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.h
> create mode 100644 include/uapi/fwctl/xe_sysctrl.h
>
>diff --git a/Documentation/userspace-api/fwctl/index.rst b/Documentation/userspace-api/fwctl/index.rst
>index 8062f7629654..f6fca11e6aac 100644
>--- a/Documentation/userspace-api/fwctl/index.rst
>+++ b/Documentation/userspace-api/fwctl/index.rst
>@@ -13,3 +13,4 @@ to securely construct and execute RPCs inside device firmware.
>    bnxt_fwctl
>    fwctl-cxl
>    pds_fwctl
>+   xe_sysctrl
>diff --git a/Documentation/userspace-api/fwctl/xe_sysctrl.rst b/Documentation/userspace-api/fwctl/xe_sysctrl.rst
>new file mode 100644
>index 000000000000..6dfc9e70b683
>--- /dev/null
>+++ b/Documentation/userspace-api/fwctl/xe_sysctrl.rst
>@@ -0,0 +1,120 @@
>+.. SPDX-License-Identifier: GPL-2.0
>+
>+=======================
>+fwctl xe_sysctrl driver
>+=======================
>+
>+:Author: Intel Corporation
>+
>+Overview
>+========
>+
>+The Xe System Controller (sysctrl) firmware exposes a fwctl service that
>+the xe driver registers as a ``FWCTL_DEVICE_TYPE_XE_SYSCTRL`` device.
>+Userspace opens the resulting ``/dev/fwctl/fwctlN`` node to query ECC
>+status and RAS error injection capabilities and to issue RAS error
>+injection requests to the sysctrl firmware.
>+
>+xe_sysctrl User API
>+====================
>+
>+.. kernel-doc:: include/uapi/fwctl/xe_sysctrl.h
>+
>+1. Driver info query
>+---------------------
>+
>+The application issues ``FWCTL_INFO`` to retrieve a
>+``struct fwctl_info_xe_sysctrl`` and inspect ``uctx_caps`` to determine
>+which of the ``FWCTL_XE_SYSCTRL_CAP_*`` capabilities are available on this
>+platform and in this security context.
>+
>+2. Send RPC requests
>+---------------------
>+
>+Each RPC uses a single ``struct fwctl_rpc_xe_sysctrl`` as both the
>+``FWCTL_RPC`` ``in`` and ``out`` buffer; the driver fills in ``data`` in
>+place. ``op`` selects one of the ``enum fwctl_xe_sysctrl_op`` operations.
>+The kernel rejects the request if the scope of the ``FWCTL_RPC`` call is
>+lower than the minimum required by the requested ``op``, as documented above.
>+
>+Code example of querying ECC status
>+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>+
>+.. code-block:: c
>+
>+        static int xe_sysctrl_get_ecc(int fd, __u32 *supported, __u32 *enabled)
>+        {
>+                struct fwctl_rpc_xe_sysctrl sysctrl_rpc = {
>+                        .op = FWCTL_XE_SYSCTRL_OP_ECC_STATUS_GET,
>+                };
>+                struct fwctl_rpc rpc = {
>+                        .size = sizeof(rpc),
>+                        .scope = FWCTL_RPC_CONFIGURATION,
>+                        .in_len = sizeof(sysctrl_rpc),
>+                        .out_len = sizeof(sysctrl_rpc),
>+                        .in = (__aligned_u64)&sysctrl_rpc,
>+                        .out = (__aligned_u64)&sysctrl_rpc,
>+                };
>+                int ret;
>+
>+                ret = ioctl(fd, FWCTL_RPC, &rpc);
>+                if (ret)
>+                        return ret;
>+
>+                *supported = sysctrl_rpc.data[0];
>+                *enabled = sysctrl_rpc.data[1];
>+                return 0;
>+        }
>+
>+Code example of querying RAS injection capabilities and injecting an error
>+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>+
>+.. code-block:: c
>+
>+        static int xe_sysctrl_get_ras_caps(int fd, __u32 *capability_mask, __u32 *flags)
>+        {
>+                struct fwctl_rpc_xe_sysctrl sysctrl_rpc = {
>+                        .op = FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS,
>+                };
>+                struct fwctl_rpc rpc = {
>+                        .size = sizeof(rpc),
>+                        .scope = FWCTL_RPC_CONFIGURATION,
>+                        .in_len = sizeof(sysctrl_rpc),
>+                        .out_len = sizeof(sysctrl_rpc),
>+                        .in = (__aligned_u64)&sysctrl_rpc,
>+                        .out = (__aligned_u64)&sysctrl_rpc,
>+                };
>+                int ret;
>+
>+                ret = ioctl(fd, FWCTL_RPC, &rpc);
>+                if (ret)
>+                        return ret;
>+
>+                *capability_mask = sysctrl_rpc.data[0];
>+                *flags = sysctrl_rpc.data[1];
>+                return 0;
>+        }
>+
>+        static int xe_sysctrl_ras_inject(int fd, __u32 error_inj)
>+        {
>+                struct fwctl_rpc_xe_sysctrl sysctrl_rpc = {
>+                        .op = FWCTL_XE_SYSCTRL_OP_RAS_INJECT,
>+                        .data[0] = error_inj,
>+                };
>+                struct fwctl_rpc rpc = {
>+                        .size = sizeof(rpc),
>+                        .scope = FWCTL_RPC_DEBUG_WRITE,
>+                        .in_len = sizeof(sysctrl_rpc),
>+                        .out_len = sizeof(sysctrl_rpc),
>+                        .in = (__aligned_u64)&sysctrl_rpc,
>+                        .out = (__aligned_u64)&sysctrl_rpc,
>+                };
>+
>+                /*
>+                 * Callers should confirm error_inj is set in capability_mask,
>+                 * and that flags allows injection (FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED),
>+                 * as returned by xe_sysctrl_get_ras_caps() above, before injecting.
>+                 */
>+                return ioctl(fd, FWCTL_RPC, &rpc);
>+        }

You could just use one function example that injects an error. Part of 
that implementation would be to query if error injections is available.  
That way you can just do away with the comment above.

>+
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 4d7dcaff2b91..a472cb52dded 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -25,6 +25,7 @@ config DRM_XE
> 	select DRM_MIPI_DSI
> 	select RELAY
> 	select IRQ_WORK
>+	select FWCTL
> 	# xe depends on ACPI_VIDEO when ACPI is enabled
> 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
> 	select BACKLIGHT_CLASS_DEVICE if ACPI
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 44ed055439d4..6560185c0ca7 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -128,6 +128,7 @@ xe-y += xe_bb.o \
> 	xe_sync.o \
> 	xe_sysctrl.o \
> 	xe_sysctrl_event.o \
>+	xe_sysctrl_fwctl.o \
> 	xe_sysctrl_mailbox.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index d25d02b24898..dc7df793d4b9 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -68,6 +68,7 @@
> #include "xe_sriov.h"
> #include "xe_svm.h"
> #include "xe_sysctrl.h"
>+#include "xe_sysctrl_fwctl.h"
> #include "xe_tile.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
>@@ -1028,6 +1029,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	err = xe_sysctrl_fwctl_init(xe);
>+	if (err)
>+		return err;
>+
> 	xe_ras_init(xe);
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
>new file mode 100644
>index 000000000000..27a40efa0787
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
>@@ -0,0 +1,251 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/errno.h>
>+#include <linux/fwctl.h>
>+#include <linux/slab.h>
>+
>+#include <uapi/fwctl/xe_sysctrl.h>
>+
>+#include "xe_device.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_fwctl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
>+
>+struct xe_sysctrl_fwctl_dev {
>+	struct fwctl_device fwctl;
>+	struct xe_device *xe;
>+};
>+
>+DEFINE_FREE(xe_sysctrl_fwctl, struct xe_sysctrl_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
>+
>+struct xe_sysctrl_fwctl_uctx {
>+	struct fwctl_uctx uctx;
>+	u32 uctx_caps;
>+};
>+
>+static int xe_sysctrl_fwctl_uctx_open(struct fwctl_uctx *uctx)
>+{
>+	struct xe_sysctrl_fwctl_dev *fwctl_dev =
>+		container_of(uctx->fwctl, struct xe_sysctrl_fwctl_dev, fwctl);
>+	struct xe_sysctrl_fwctl_uctx *sc_uctx =
>+		container_of(uctx, struct xe_sysctrl_fwctl_uctx, uctx);
>+	struct xe_device *xe = fwctl_dev->xe;
>+
>+	xe_pm_runtime_get(xe);
>+
>+	sc_uctx->uctx_caps = FWCTL_XE_SYSCTRL_CAP_ECC;
>+	if (xe_sysctrl_is_diag_fw_ready(xe))
>+		sc_uctx->uctx_caps |= FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT;
>+
>+	return 0;
>+}
>+
>+static void xe_sysctrl_fwctl_uctx_close(struct fwctl_uctx *uctx)
>+{
>+	struct xe_sysctrl_fwctl_dev *fwctl_dev =
>+		container_of(uctx->fwctl, struct xe_sysctrl_fwctl_dev, fwctl);
>+
>+	xe_pm_runtime_put(fwctl_dev->xe);
>+}
>+
>+static void *xe_sysctrl_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
>+{
>+	struct xe_sysctrl_fwctl_uctx *sc_uctx =
>+		container_of(uctx, struct xe_sysctrl_fwctl_uctx, uctx);
>+	struct fwctl_info_xe_sysctrl *info;
>+
>+	info = kzalloc_obj(*info);
>+	if (!info)
>+		return ERR_PTR(-ENOMEM);
>+
>+	info->uctx_caps = sc_uctx->uctx_caps;
>+
>+	*length = sizeof(*info);
>+	return info;
>+}
>+
>+static int sysctrl_rpc_ecc_status_get(struct xe_device *xe,
>+				      struct fwctl_rpc_xe_sysctrl *rpc)
>+{
>+	struct xe_sysctrl_feature_cap_resp resp = {};
>+	struct xe_sysctrl_mailbox_command cmd = {0};
>+	size_t out_len = 0;
>+	int ret;
>+
>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_GFSP_RUNTIME,
>+				  XE_SYSCTRL_CMD_GET_FEATURE_CAPABILITY_STATE_INFO,
>+				  NULL, 0, &resp, sizeof(resp));
>+
>+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>+	if (ret)
>+		return ret;
>+
>+	if (out_len < 2 * sizeof(u32)) {
>+		xe_err(xe, "sysctrl fwctl: ECC status response too short (%zu B)\n",
>+		       out_len);
>+		return -EIO;
>+	}
>+
>+	rpc->data[0] = resp.supported_features & XE_SYSCTRL_FEATURE_ECC ? 1 : 0;
>+	rpc->data[1] = resp.enabled_features & XE_SYSCTRL_FEATURE_ECC ? 1 : 0;
>+	return 0;
>+}
>+
>+static int sysctrl_rpc_ras_get_caps(struct xe_device *xe,
>+				    struct fwctl_rpc_xe_sysctrl *rpc)
>+{
>+	struct xe_sysctrl_ras_err_inj_cap_resp resp = {};
>+	struct xe_sysctrl_mailbox_command cmd = {0};
>+	size_t out_len = 0;
>+	int ret;
>+
>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_DIAG,
>+				  XE_SYSCTRL_CMD_RAS_ERR_INJ_CAPABILITY,
>+				  NULL, 0, &resp, sizeof(resp));
>+
>+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>+	if (ret)
>+		return ret;

Not checking for short reponse here like in the ECC function above?

>+
>+	rpc->data[0] = resp.capability_mask;
>+	rpc->data[1] = resp.flags;
>+	return 0;
>+}
>+
>+static int sysctrl_rpc_ras_inject(struct xe_device *xe,
>+				  struct fwctl_rpc_xe_sysctrl *rpc)
>+{
>+	struct xe_sysctrl_ras_err_inj_req req = {
>+		.error_inj	   = rpc->data[0],
>+		.additional_params = rpc->data[1],
>+	};
>+	struct xe_sysctrl_mailbox_command cmd = {0};
>+	size_t out_len = 0;
>+

We should check if the type of inject is supported. It may mean that we 
cache the err injection capabilities early on (during init). Is that 
possible?

>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_DIAG,
>+				  XE_SYSCTRL_CMD_RAS_ERR_INJECT,
>+				  &req, sizeof(req), NULL, 0);
>+
>+	return xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>+}
>+
>+static void *xe_sysctrl_fwctl_rpc(struct fwctl_uctx *uctx,
>+				  enum fwctl_rpc_scope scope,
>+				  void *rpc_in, size_t in_len,
>+				  size_t *out_len)
>+{
>+	struct xe_sysctrl_fwctl_dev *fwctl_dev =
>+		container_of(uctx->fwctl, struct xe_sysctrl_fwctl_dev, fwctl);
>+	struct xe_sysctrl_fwctl_uctx *sc_uctx =
>+		container_of(uctx, struct xe_sysctrl_fwctl_uctx, uctx);
>+	struct xe_device *xe = fwctl_dev->xe;
>+	struct fwctl_rpc_xe_sysctrl *rpc;
>+	int ret;
>+
>+	if (in_len != sizeof(*rpc) || *out_len < sizeof(*rpc))
>+		return ERR_PTR(-EMSGSIZE);
>+
>+	rpc = rpc_in;
>+
>+	if (rpc->flags)
>+		return ERR_PTR(-EINVAL);
>+
>+	switch (rpc->op) {
>+	case FWCTL_XE_SYSCTRL_OP_ECC_STATUS_GET:
>+		if (!(sc_uctx->uctx_caps & FWCTL_XE_SYSCTRL_CAP_ECC))
>+			return ERR_PTR(-EPERM);


EPERM doesn't look correct here. i.e. if the caller were an ADMIN, would 
this work?

If the caller is trying an RPC that is not available, then this should 
be EINVAL. Same for the below cases.


>+		if (scope < FWCTL_RPC_CONFIGURATION)
>+			return ERR_PTR(-EBADMSG);
>+		ret = sysctrl_rpc_ecc_status_get(xe, rpc);
>+		if (ret)
>+			return ERR_PTR(ret);
>+		break;
>+
>+	case FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS:
>+		if (!(sc_uctx->uctx_caps & FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT))
>+			return ERR_PTR(-EPERM);
>+		if (scope < FWCTL_RPC_CONFIGURATION)
>+			return ERR_PTR(-EBADMSG);
>+		ret = sysctrl_rpc_ras_get_caps(xe, rpc);
>+		if (ret)
>+			return ERR_PTR(ret);
>+		break;

Do these capabilities change at runtime? If not, why not just cache them 
after first read?

>+
>+	case FWCTL_XE_SYSCTRL_OP_RAS_INJECT:
>+		if (!(sc_uctx->uctx_caps & FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT))
>+			return ERR_PTR(-EPERM);
>+		if (scope < FWCTL_RPC_DEBUG_WRITE)
>+			return ERR_PTR(-EBADMSG);
>+		ret = sysctrl_rpc_ras_inject(xe, rpc);
>+		if (ret)
>+			return ERR_PTR(ret);
>+		break;
>+
>+	default:
>+		return ERR_PTR(-EBADMSG);
>+	}
>+
>+	*out_len = sizeof(*rpc);
>+	return rpc_in;
>+}
>+
>+static const struct fwctl_ops xe_sysctrl_fwctl_ops = {
>+	.device_type = FWCTL_DEVICE_TYPE_XE_SYSCTRL,
>+	.uctx_size = sizeof(struct xe_sysctrl_fwctl_uctx),
>+	.open_uctx = xe_sysctrl_fwctl_uctx_open,
>+	.close_uctx = xe_sysctrl_fwctl_uctx_close,
>+	.info = xe_sysctrl_fwctl_info,
>+	.fw_rpc = xe_sysctrl_fwctl_rpc,
>+};
>+
>+static void xe_sysctrl_fwctl_fini(void *arg)
>+{
>+	struct fwctl_device *fwctl = arg;
>+
>+	fwctl_unregister(fwctl);
>+	fwctl_put(fwctl);
>+}
>+
>+/**
>+ * xe_sysctrl_fwctl_init() - Initialize fwctl interface for System Controller
>+ * @xe: xe device instance
>+ *
>+ * Registers a fwctl device that exposes System Controller debug and
>+ * diagnostic functionality to userspace, on platforms where System
>+ * Controller is supported.
>+ *
>+ * Return: 0 on success, error code on failure
>+ */
>+int xe_sysctrl_fwctl_init(struct xe_device *xe)
>+{
>+	struct xe_sysctrl_fwctl_dev *fwctl_dev __free(xe_sysctrl_fwctl) =
>+		fwctl_alloc_device(xe->drm.dev, &xe_sysctrl_fwctl_ops,
>+				   struct xe_sysctrl_fwctl_dev, fwctl);
>+	int err;
>+
>+	if (!xe->info.has_soc_remapper_sysctrl)
>+		return 0;
>+
>+	if (!xe->info.has_sysctrl)
>+		return 0;
>+
>+	if (!fwctl_dev)
>+		return -ENOMEM;
>+
>+	fwctl_dev->xe = xe;
>+
>+	err = fwctl_register(&fwctl_dev->fwctl);
>+	if (err)
>+		return err;
>+
>+	return devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fwctl_fini,
>+					&no_free_ptr(fwctl_dev)->fwctl);
>+}
>+
>+MODULE_IMPORT_NS("FWCTL");
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_fwctl.h b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.h
>new file mode 100644
>index 000000000000..730f31e0d697
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_FWCTL_H_
>+#define _XE_SYSCTRL_FWCTL_H_
>+
>+struct xe_device;
>+
>+int xe_sysctrl_fwctl_init(struct xe_device *xe);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>index b507e1553cbb..7f39fd1a418a 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -14,10 +14,14 @@
>  * enum xe_sysctrl_group - System Controller command groups
>  *
>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>+ * @XE_SYSCTRL_GROUP_DIAG: Diag group
>+ * @XE_SYSCTRL_GROUP_GFSP_RUNTIME: GFSP runtime group
>  * @XE_SYSCTRL_GROUP_CORE: Core group
>  */
> enum xe_sysctrl_group {
> 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>+	XE_SYSCTRL_GROUP_DIAG			= 0x02,
>+	XE_SYSCTRL_GROUP_GFSP_RUNTIME		= 0x31,
> 	XE_SYSCTRL_GROUP_CORE			= 0xFF,
> };
>
>@@ -103,6 +107,88 @@ enum xe_sysctrl_app_id {
> 	XE_SYSCTRL_APP_DIAG	= 0x0D,
> };
>
>+/**
>+ * enum xe_sysctrl_diag_cmd - Commands supported by DIAG group
>+ *
>+ * @XE_SYSCTRL_CMD_RAS_ERR_INJ_CAPABILITY: Query supported RAS injection types
>+ * @XE_SYSCTRL_CMD_RAS_ERR_INJECT: Inject a RAS error into an IP block
>+ */
>+enum xe_sysctrl_diag_cmd {
>+	XE_SYSCTRL_CMD_RAS_ERR_INJ_CAPABILITY	= 0x01,
>+	XE_SYSCTRL_CMD_RAS_ERR_INJECT		= 0x02,
>+};
>+
>+/**
>+ * struct xe_sysctrl_ras_err_inj_cap_resp - RAS_ERR_INJ_CAPABILITY response payload
>+ *
>+ * Response payload for XE_SYSCTRL_CMD_RAS_ERR_INJ_CAPABILITY.  The mailbox
>+ * layer strips the application message header before writing to this buffer.
>+ *
>+ * @capability_mask: OR of firmware-defined capability values indicating which
>+ *                   injection classes are supported on this platform (see
>+ *                   enum fwctl_xe_sysctrl_ras_inj_cap in
>+ *                   include/uapi/fwctl/xe_sysctrl.h for bit definitions)
>+ * @flags:           Bitmask; bit FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED (see
>+ *                   include/uapi/fwctl/xe_sysctrl.h) indicates whether RAS
>+ *                   error injection is currently allowed by hardware
>+ *                   security policy.
>+ * @reserved:        Must be zero
>+ */
>+struct xe_sysctrl_ras_err_inj_cap_resp {
>+	u32 capability_mask;
>+	u32 flags;
>+	u32 reserved[2];
>+} __packed;
>+
>+/**
>+ * struct xe_sysctrl_ras_err_inj_req - RAS_ERR_INJECT request payload
>+ *
>+ * Request payload for XE_SYSCTRL_CMD_RAS_ERR_INJECT.  The mailbox layer
>+ * prepends the application message header before sending.
>+ *
>+ * @error_inj:    One of the enum fwctl_xe_sysctrl_ras_inj_cap bit values
>+ *                (include/uapi/fwctl/xe_sysctrl.h), selecting the class of
>+ *                error to inject.
>+ * @additional_params: Reserved for future use; must be 0 for most injection
>+ *                    types
>+ */
>+struct xe_sysctrl_ras_err_inj_req {
>+	u32 error_inj;
>+	u32 additional_params;
>+} __packed;
>+
>+/**
>+ * enum xe_sysctrl_gfsp_runtime_cmd - Commands for the GFSP runtime group (0x31)
>+ *
>+ * @XE_SYSCTRL_CMD_GET_FEATURE_CAPABILITY_STATE_INFO: Read ECC feature state.
>+ *	No input payload.  Response: struct xe_sysctrl_feature_cap_resp.
>+ */
>+enum xe_sysctrl_gfsp_runtime_cmd {
>+	XE_SYSCTRL_CMD_GET_FEATURE_CAPABILITY_STATE_INFO	= 0x10,
>+};
>+
>+/** XE_SYSCTRL_FEATURE_ECC - ECC feature bit in FSP runtime capability bitmasks */
>+#define XE_SYSCTRL_FEATURE_ECC	BIT(0)
>+
>+/**
>+ * struct xe_sysctrl_feature_cap_resp - ECC feature state
>+ *
>+ * Response layout for XE_SYSCTRL_CMD_GET_FEATURE_CAPABILITY_STATE_INFO.
>+ *
>+ * @supported_features: Features supported by the product
>+ * @enabled_features: Features currently enabled
>+ * @configurable_features: Features modifiable by software
>+ * @pending_features: Feature state pending after next reboot
>+ * @default_features: Default feature state from build configuration
>+ */
>+struct xe_sysctrl_feature_cap_resp {
>+	u32 supported_features;
>+	u32 enabled_features;
>+	u32 configurable_features;
>+	u32 pending_features;
>+	u32 default_features;
>+} __packed;
>+
> /**
>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>  */
>diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
>index 2d6d4049c205..34901d36cd51 100644
>--- a/include/uapi/fwctl/fwctl.h
>+++ b/include/uapi/fwctl/fwctl.h
>@@ -46,6 +46,7 @@ enum fwctl_device_type {
> 	FWCTL_DEVICE_TYPE_CXL = 2,
> 	FWCTL_DEVICE_TYPE_BNXT = 3,
> 	FWCTL_DEVICE_TYPE_PDS = 4,
>+	FWCTL_DEVICE_TYPE_XE_SYSCTRL = 5,
> };
>
> /**
>diff --git a/include/uapi/fwctl/xe_sysctrl.h b/include/uapi/fwctl/xe_sysctrl.h
>new file mode 100644
>index 000000000000..a4d117d906e3
>--- /dev/null
>+++ b/include/uapi/fwctl/xe_sysctrl.h
>@@ -0,0 +1,117 @@
>+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>+/* Copyright © 2026 Intel Corporation */
>+#ifndef _UAPI_FWCTL_XE_SYSCTRL_H_
>+#define _UAPI_FWCTL_XE_SYSCTRL_H_
>+
>+#include <linux/bits.h>
>+#include <linux/types.h>
>+
>+/**
>+ * enum fwctl_xe_sysctrl_uctx_caps - capability flags in fwctl_info_xe_sysctrl.uctx_caps
>+ *
>+ * @FWCTL_XE_SYSCTRL_CAP_ECC: ECC status query is supported on this platform
>+ * @FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT: RAS error injection is supported;
>+ *      requires diag firmware to be loaded and ready
>+ */
>+enum fwctl_xe_sysctrl_uctx_caps {
>+	FWCTL_XE_SYSCTRL_CAP_ECC		= (1U << 0),
>+	FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT	= (1U << 1),

BIT(0)
BIT(1)

>+};
>+
>+/**
>+ * struct fwctl_info_xe_sysctrl - device data returned by FWCTL_INFO
>+ * @uctx_caps: Bitmask of available capabilities (see %fwctl_xe_sysctrl_uctx_caps)
>+ * @rsvd: Reserved, must be zero
>+ */
>+struct fwctl_info_xe_sysctrl {
>+	__u32 uctx_caps;
>+	__u32 rsvd[7];
>+};
>+
>+/**
>+ * enum fwctl_xe_sysctrl_ras_inj_cap - RAS error injection capability bits
>+ *
>+ * Used both in the @capability_mask output of %FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS
>+ * and as the @error_inj input of %FWCTL_XE_SYSCTRL_OP_RAS_INJECT. Userspace
>+ * must confirm a bit is set in @capability_mask before injecting that class.
>+ *
>+ * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_COMPUTE_CORR: Compute block correctable error
>+ * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_COMPUTE_UCORR: Compute block uncorrectable error
>+ * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_MEMORY_UCORR: Memory subsystem uncorrectable error
>+ * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_FABRIC_UCORR: Fabric interconnect uncorrectable error
>+ * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PCIE_CORR: PCIe subsystem correctable error
>+ * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PCIE_UCORR: PCIe subsystem uncorrectable error
>+ * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PLATFORM_UCORR: Platform-level uncorrectable error
>+ */
>+enum fwctl_xe_sysctrl_ras_inj_cap {
>+	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_COMPUTE_CORR	= 0x0001U,
>+	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_COMPUTE_UCORR	= 0x0002U,
>+	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_MEMORY_UCORR	= 0x0004U,
>+	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_FABRIC_UCORR	= 0x0008U,
>+	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PCIE_CORR		= 0x0010U,
>+	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PCIE_UCORR		= 0x0020U,
>+	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PLATFORM_UCORR	= 0x0040U,

Same here, why not use BIT?

Thanks,
Umesh

>+};
>+
>+/* FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED - bit in the RAS_GET_CAPS flags field
>+ * indicating RAS error injection is currently allowed by hardware security
>+ * policy.
>+ */
>+#define FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED	(1U << 0)
>+
>+/**
>+ * enum fwctl_xe_sysctrl_op - RPC operation codes for xe_sysctrl fwctl
>+ *
>+ * @FWCTL_XE_SYSCTRL_OP_ECC_STATUS_GET: Read ECC feature state from GFSP firmware
>+ *	(GFSP runtime group, GET_FEATURE_CAPABILITY_STATE_INFO, BIT(0) = ECC).
>+ *	Requires: %FWCTL_XE_SYSCTRL_CAP_ECC in uctx_caps.
>+ *	Scope: %FWCTL_RPC_CONFIGURATION.
>+ *	in:  op, flags=0, data[0..13] ignored.
>+ *	out: data[0] = 1 if ECC is supported by this product, 0 otherwise.
>+ *	     data[1] = 1 if ECC is currently enabled, 0 otherwise.
>+ *
>+ * @FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS: Query RAS error injection capability from
>+ *	diag firmware (DIAG group, RAS_ERR_INJ_CAPABILITY command).
>+ *	Requires: %FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT in uctx_caps.
>+ *	Scope: %FWCTL_RPC_CONFIGURATION.
>+ *	in:  op, flags=0, data[0..13] ignored.
>+ *	out: data[0] = capability_mask, an OR of %fwctl_xe_sysctrl_ras_inj_cap
>+ *	                bits indicating which injection classes are supported,
>+ *	     data[1] = flags; bit %FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED indicates
>+ *	                whether RAS error injection is currently allowed by
>+ *	                hardware security policy, other bits are reserved for
>+ *	                future use.
>+ *
>+ * @FWCTL_XE_SYSCTRL_OP_RAS_INJECT: Inject a RAS error via diag firmware
>+ *	(DIAG group, RAS_ERR_INJECT command).
>+ *	Requires: %FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT in uctx_caps.
>+ *	Scope: %FWCTL_RPC_DEBUG_WRITE.
>+ *	in:  data[0] = error_inj, one of the %fwctl_xe_sysctrl_ras_inj_cap
>+ *	                bit values. Userspace must confirm this bit is set in
>+ *	                the capability_mask returned by
>+ *	                %FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS (and that its flags
>+ *	                field currently allows injection) before issuing this
>+ *	                request; behavior for an unsupported value is
>+ *	                firmware-defined,
>+ *	     data[1] = additional_params (reserved; 0 for most injection types).
>+ *	out: no additional output data (success indicated by ioctl return code).
>+ */
>+enum fwctl_xe_sysctrl_op {
>+	FWCTL_XE_SYSCTRL_OP_ECC_STATUS_GET	= 1,
>+	FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS	= 2,
>+	FWCTL_XE_SYSCTRL_OP_RAS_INJECT		= 3,
>+};
>+
>+/**
>+ * struct fwctl_rpc_xe_sysctrl - RPC request/response envelope
>+ * @op: Operation code (see %fwctl_xe_sysctrl_op)
>+ * @flags: Must be 0
>+ * @data: Operation-specific payload (see %fwctl_xe_sysctrl_op for layout)
>+ */
>+struct fwctl_rpc_xe_sysctrl {
>+	__u32 op;
>+	__u32 flags;
>+	__u32 data[14];
>+};
>+
>+#endif
>-- 
>2.43.0
>
