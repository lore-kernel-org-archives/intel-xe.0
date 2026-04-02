Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985CED6AAEC
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 17:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F38110E0F1;
	Thu,  2 Apr 2026 17:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LV8EEnZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1195010E0F1
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 17:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775149925; x=1806685925;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NHDv+KIElQlwKRXsoqapZFtJDE/35087j6eYwH8oXgM=;
 b=LV8EEnZkPANuz59gRHbY7jNQqVpJneLgriqj4Ui5JPplE7yW2lKrxI/8
 SyKQzQ0gQ+UKwDglV1F7VE/K7fBVwtNZ6hm2ARyl0CuvfQ3qyJd5Aw/M+
 JuQ4Mv73NiUS8i05Y1ma8ObvNkAMMSK/sYpl7a7/yr/aqS6/1uH79p38b
 A8uOgNr9a9Dmva9uHzTOgLMbLelOxMOlg+GJIBBMHtHVPNMPfg6+CTjMT
 /E7cq+ZOHK5sfX9q27gFtONjFNvJgS3tdXBGJwigOVPqpXuuBS8NF+7vj
 5LECIS2XYOtQvPgY+a3e4VHPOR4AI5RZt+2eOim1lywsqIgp4kFWexUSr w==;
X-CSE-ConnectionGUID: Sj/3eIDqRnGzpnAr4/w8Xw==
X-CSE-MsgGUID: /KJKK2byS1KpR8Mgp74WDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="80103652"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="80103652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 10:12:04 -0700
X-CSE-ConnectionGUID: N/DlxRsQQEiUUTvUz/GVCA==
X-CSE-MsgGUID: mpucwUfXRxuIMJIhsB/d5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="223753436"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 10:12:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 10:12:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 10:12:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 10:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxfjMBLlPX1w2qLWuO7SO1WIi1sXTpOuidNE39M9awwf1EhtXOA5qVCUczk26GWm6Cd71UX8V8XQfP7G1IJtnP/aBkR/4mJMtwjBeSM+rDq27S1B0PHg0FErGflG2y3YPlho/hY/kS7kY1rZn4B1Cc56GzAYqo1BfeElSISVBxjLvJ4k+Aopi7Rf+JJ6JaHBIjoYe4WyinoCkka9m3hbucwm3E+uosDiw62P0BnRGuow/PkVkj5fEA5LRe6DlLUihigQibdBYZETWIZ5MyYqeHsXbGCV8M+hlarjxjEl3S05hiSbF8iv25DJ7ciPRpfyB7CHiKRzZKfaxh7Nm92wIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8VtfXeZvhgV0+E9HnS3GxesUI24PthLvw598qvjMx4=;
 b=Kw8LplAmSWqvRNcQsI+vCsafmRBC4phh91Msq4zynry52GhRnkbFAzZ1mg03ptZednfpjypg+iWGIq+l8zX2fGtmsn6s99GAIBt1RuOINsgr6u445DBh29Xkbi3Cv7VBIjo2/XfqLqhghVMOVSM/1yw1lo05/lznVXY6klHYTUh5pRypZsmi0nCYz7JYNyU7AMejvnLAvpYs6ypv4S9eNeEDthWhcGLRJLfgDGkySCuEJj1/2GKOshDhqQdW89y/reGaZSxs1cA0iG7DVgxzIV+KCdZ+WrDP+hap4OhmM/p5D3y35kXMpwpOuO0JvYUdFD2i8xGdRPw/ER/M2WH2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 17:11:56 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 17:11:56 +0000
Message-ID: <e847e336-b259-4937-92eb-9d2879b1a002@intel.com>
Date: Thu, 2 Apr 2026 10:11:54 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IEVu?=
 =?UTF-8?Q?able_Wa=5F14025515070=2C_Enable_indirect_ring_state_for_XE2+_=28r?=
 =?UTF-8?Q?ev10=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260304003431.758201-3-julia.filipchuk@intel.com>
 <177500539583.420767.14332193738964909394@a3b018990fe9>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <177500539583.420767.14332193738964909394@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0097.namprd04.prod.outlook.com
 (2603:10b6:303:83::12) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: b81db9b7-8830-45a0-c95c-08de90daf156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: JrvQm1M1HnfA1uunS60B9efuptarUaFmZYm1Q1XJCXENN+4sVTbBPovnCoS2bKqQN8A4aQsUt7MPvbJIZX7PTRA8i5KtE6TYHW62obHqPWQ3+cSWxG8P77miL92gBcZ9m3HyXBI99JaKw/LHa/VwYVBf8Vn2kY3tMCqEDB7nSz0tbecC/zj3F/5PWhrdPBOf8c+FupruEUllq4xjXJ8J/lj/fAqdscaUAEz/pg51faKVNYsT/Z/CNakQMqmCFYTWkbmMnwF+CLze4rV2ps3T5GLUP5hJapdjNnbZyR0ib6i1UEQbXJM/GRr3cIEb+a5pI/1R71rGS+PZdLiiBy09PDjPQ9c2uOnpSoBVLrU307biZUARrBqSxjWpvgbEhvQYZ0QOvXawKT74gY3NRckIdkcbp1FxMHLMLOmMjLGp7bhRnH9FfZYdmaUkob7IuH5pkVNpbsDivPWspWhQCqnj4VS5JtyI1xUCL/LL5rbVnMXyOm0d28sLABN283tA2/BVey68fUeldNzWw7DjngYb1x9vNHypSMOKM7zhAy6Ro13ztIMZ0sMwgtc3B46yalBN6i44MoOwa1pAhoXgUI4/duwV78e4wDFl5NPMZXHXkSNnqvrSrRwYfXU0e21ErqIxqGWaetAa083SCIMToZLQ8WVQn9QmAKxGD1YYPh9zCrG5HvColPVu8tUGK4wXR0sm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akVic1pYc0xCbm1JaEd3NkduQTRFWHVSbGlGMm1HZmVxalA5azRldkVsSFZD?=
 =?utf-8?B?bmFXTDlhVmgyRXhEdjVOQ0dEQkQxbGM1bE1XVCtVMTRUNHR4U01jcWZPbGVY?=
 =?utf-8?B?Y05vQzBvOGQveG5ER05UTXRoYzYzZ1VERUR0YkFydHlMUElINEYwNm1iZ3Nw?=
 =?utf-8?B?QUF3SjZrc2ZiZmhKTyt6OVcxSnVHYk9QZzlLS3ZZWEYxQ3FkWjBGbTBlWmNF?=
 =?utf-8?B?ZmZ6eERKY3BNaU4wOXFVVllsWDNXWGFNQ3AxYTNRVGhEcjRDcTl0Uy9GaHdl?=
 =?utf-8?B?dStBZEkvN00wbnc0bkM0OGxobUYvaG14ankwS21KMDRIdW01UkgyNTZJU3Q1?=
 =?utf-8?B?VnB6WXJJNGN4WGJrUjVHNUtQaFU1OHRSRXdzaTI3LzlCckJXTk5RWVMzajRH?=
 =?utf-8?B?WVlKOHVNcmcyN0t6bGU4TmJCNXRVT1RLSm9NR25zTkRIaGswUUJMc2U1TSta?=
 =?utf-8?B?SEtnU3RtM2ZUN1BiQWcyUGQvbmdHYmhEUlJLZkdITElRMUZNRURSVDgxcURi?=
 =?utf-8?B?TzNYZ002RXRlajV6Q0IrWXg4UXdtOHQ2OFBHRDRPdmxLQlZkaFVuS2szeFFP?=
 =?utf-8?B?YUw0SlJzYjFzNnFCWW9zUStPek5SaGQ0VmtuMnhaVUQ2QUdZNmtFQzkzTEtZ?=
 =?utf-8?B?azludXZHLzV5am83QWdrRkNDQ0locFU4dGNPbElkUmtsSitvdDNydjdpRk05?=
 =?utf-8?B?Sm1IMXVodVgwNUxoWFpkUjhjemk1b0w5ZE9qaTVpZjJ3VkQ4Z1YyeGk5c2li?=
 =?utf-8?B?M3orTllkSU9lL0Fiam5NaUhZYU94TWhYb2NmTlovcTlmaDFuYXRLNXN6eERZ?=
 =?utf-8?B?aEs0ZXFDUVFGTVBSN0poSGNQR2hGc3F3WjN3d0hCbE8xVU5oV08xWDljNVVa?=
 =?utf-8?B?aStGb2p1M0d1RnZUdTd4VVJhK2lGNk1jc0JXUzlTazVXTjJwUFV6Q0xUTUw5?=
 =?utf-8?B?aVE3UjQyNURKVG4zeUp5Z2ZOZGNpa256eVU1UTBKVXM2aWdlL0dsR1ZTdHBX?=
 =?utf-8?B?Q05aNDQ1cmpvaGNwbmtmcElIMVdpVFNjUFZwdmVXeXF2cFRzYlZ6eW94NlFD?=
 =?utf-8?B?YkhDL3Z2WitXMmp1eEVsN2lCN04vWVBGUlRTbU15NkEvR1g4SjdoYzFMemNa?=
 =?utf-8?B?dCtWTGQwNmJxMVZNVlBiaklUQ3hDTjBZVGcvclVkRWpneXdqWEJ6Tjk3Zmor?=
 =?utf-8?B?YjFHeVg2MWtsQzdPcjZGT252NXdWSzc4UXpwd2lGNlZNcEtnN1dSQW5wTWdZ?=
 =?utf-8?B?ZjV1bnVsU1lZditIRE9STnIwWjNOVE01SmR2MUptZUJPeWFsVmdwOUY4bG1i?=
 =?utf-8?B?SldwZ29LaFMxSnl1MWkvMmV0aFRGbFZsaGFtMDFyM3VPaGVNdXlKa1pVbVVB?=
 =?utf-8?B?a2NiTW8vMWpwRExodWkzRXFha1ZoOXF0NVdxTmFZUGRJV0gyekQzd3hiMmZj?=
 =?utf-8?B?QmhUREN3MlVsY2k0bXY2SElsV29FOEg3THJBcCtaci9QVENkSXdsSGhUV0dG?=
 =?utf-8?B?UjFpM1lNbTJlN3lTcFBHS0hhdDBBc0lSRUpBSng4ZmIvT2FUVEtDNXVUUVZS?=
 =?utf-8?B?emp3cE16Z0cyUGQ1ZjdYeW15RTNwYVJoZktxMXNvU1dZYXkzK3pxdEFWRXJ5?=
 =?utf-8?B?SFgwd0xKZzlYUndWR1ZWdjQyT3ppSEwrK2dvZEpwVE9WK09weC9WUEpiK2Ix?=
 =?utf-8?B?RTdTS2RwWUtrSXFJbURoUm9uUWY2RVhTQnVPcmx6TEZadzF1dHgyVjV3bmZa?=
 =?utf-8?B?akNHRy9jQ3RZcE5PWFN3eUFhTnF3Z2hqYU5LMWkzY0RhS0hTdVZ2NHllMm1B?=
 =?utf-8?B?L3ZYZ1VYOHladUhBekY1WGZWVTJvSGthRWVPcmNyVm9IUlltenkrbGdaTFBp?=
 =?utf-8?B?Mk1hQUhHUmxtbmw0OW0yUVVOb3hNUDJ0NmF0cE4zWXg0eHBCenVGMVpMYTFH?=
 =?utf-8?B?NmJBckNmWkdhekw5c3IyMzYzTld6Yi8vUTIyOXZhZkpQSGxqVk1LYVBzSzZx?=
 =?utf-8?B?NXNJL0NLWnRCelBpS3JIb2pQanErLzVvQ3U5VGhiRmpvM0ZJdi9mTlJVNHVj?=
 =?utf-8?B?L0F4M2tCcTR5ZzAwbEFyS2xOazRmUTZQNnF2Q2NJZCtuTnZ4VGxIVm0vS2Z3?=
 =?utf-8?B?MGR3S0NzeXNkM2N4dit5aUFvSmtDNTVvSHdmNEZTUUl3ckhqZThrU3FnV010?=
 =?utf-8?B?eXJaVVNxc2lHVnBpeEVTV0FSOHJlaVBHdlNxaXMwVk1tM2RHTm9xd0oxU21r?=
 =?utf-8?B?V21CNS9vVlhqb3BiT1g0akNrSHhFNGVlckxjbkk0MUhJM2ZtTUZYSlY1V05P?=
 =?utf-8?B?UXg0UGZINUVLV0dHeVlpV044OUZ0SGhKL1N6NFo2a0xzbWNOcVlHbzhWcjF0?=
 =?utf-8?Q?9M1cxQ9XgSNBV448=3D?=
X-Exchange-RoutingPolicyChecked: EVm3s678sLxHThu8F4Q1W4ETsCmcVTTbccrOaTMq42nnTvPgZgZF4Fu9TMajEmXG2FNNTzeVB6jUcAY+KUgFUDlj7upsdbjyoViRc0U8UKo4sc7UaJCrTvD1XxDar8zyvgFUNm6HgaVhgI16rvsG5gTAmMpJ5757AvXRVUrg3CDA2JQRCa0BoBLn1wORPqC1ncprmQD0Eus4gP7+jR8shIeu8lYsOCsraUFsKecVqihSBziMr+BKh1ia3jjDNMcVuPAI1eQrH8Cih7+DvR/Kgu61fKFD0SYTTyPbU+9xhrR2tpoW9yPqBBnoyo3tg3FptG4RFaAUhWp9pdndBa86fg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b81db9b7-8830-45a0-c95c-08de90daf156
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 17:11:56.2157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8j4zQFTcm2srp1zx4OEeZqCk4707Ptz5jqkvTxB0IktTPDu9I9nAgw/DJ9mGgisUcHMPq49ppZmoXVLVMSZK9dafN/Ns20pJkKiT0/W5zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

On 3/31/2026 6:03 PM, Patchwork wrote:
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>     - shard-lnl:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/
> xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-2/
> igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/shard-lnl-7/
> igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

Failure is unrelated to patch.
