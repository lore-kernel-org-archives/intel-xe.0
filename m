Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8A8D6AB16
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 22:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9276210F68F;
	Thu,  2 Apr 2026 22:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/Jve/Is";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649AB10F68F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 22:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775167589; x=1806703589;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8x5a4xOo4hlN5z3ayoer2vlfA1THh0pbA2SeuSaXi/o=;
 b=A/Jve/Is9WPWB15g1d8F0HUsB2QW5MskD4uXdWTlvjR+EsCUIk2Dovj9
 0HRK1pqiFvxXclxWq8l1NwR/IK4eqg2Atrd1mx1VU4DRDTvJ7VndPeLFy
 bzrIUpcSNhxP8k4hRQQuvPrQcMLdcLRTqHZ+sD2xG25kDIXt54mUsC1oy
 jF8hk7gAo7YKfzaqaEHqC0PYp+DTXyrKU0Oaf/qT+KLJ7h/RtwEdEOqEb
 ET6UKk2hOBKWQSoCA3xyiY1ofIxr26kx7fuFrnl3S6ds6mQKWxdWQEmlr
 PJnp0wMuiQSENdVwwz936qvlwLuUlR7RtwtsyKBl7rc8H7qAF1juiKHsx A==;
X-CSE-ConnectionGUID: R85xvwMRQUGLBBU7CIQWNw==
X-CSE-MsgGUID: e4838XjxSdSQNXAcK3fBWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76426742"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76426742"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:06:28 -0700
X-CSE-ConnectionGUID: txM9pQ0vTMitOFU5rkSxkg==
X-CSE-MsgGUID: dli+sX7DQGGY1qsh9DevXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231900517"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:06:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 15:06:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 15:06:26 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 15:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+6k3ym9D/dN4WsInAepIYcX4wvUOxLg9KPUy/VWRPIKEi6nxTjnxF1Rqv0j3+ktXDu8sP0qJ8Uqzg5kq7lyNkkhqoKXXW420MZzh3RTlVcf+usECGJUeNvNHCLJB0o+txm1Lc2lHtHi+fg/Nu2c9isPABdzQRHZLnZq9qn/sUmTkdzqgUDnSiY4V2DzVIJiCOO6lxLQ3pFqXgZwuN8P3r9qnOByzc2QI6wxngHA4eIrEFAb9/Zf/l5xdb6Z2Nwm3gYO2mG22KpTRbS3bw/knE9mnpXlwlDAXsXics74KyGvWIRt4I0sPBG7m35vmYV9VRWZqxbJ8MCuWHbodZDqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvJmA87j1UunIQGgm4lx66s3Pk6AmX2gXR8j01CZzkg=;
 b=ireuaAkchZoxtWLswfHODRtTRsMFmF7MWFCW8/LVPBYxMk9Aswoh3+gXYSmJV4fzWiQutg9xKzC4NlUgn+BSKzeYc5fWczGQGH4klcICKCzs3rnbjhYALEbWNVukKtlv2wBQ50pPZDUpTlSqtVT+/nU0QKZuVEfNHJf3+RtkSiRTzpyccUv31L0Xwfeeyk6/r8M8Cpz8xvTXcyin446J42AF0YcFNfLWFIHw8d86SL4Omh0/BBbLzmpFXiQps+Z1L79k+9Wdi/UcNoLioDkLt03g0LIeVYl5DrURl0XWiCw9B/gLh7vjxo6Ue/FlGUOV++fXjEYdEMfv4u60AgKp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB9751.namprd11.prod.outlook.com (2603:10b6:510:397::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 22:06:24 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 22:06:24 +0000
Date: Thu, 2 Apr 2026 15:06:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 08/15] drm/xe: Implement xe_access_counter_queue_work
Message-ID: <ac7oXAvrjNbJdgIq@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318074456.2839499-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b589daf-6c95-43de-cf0e-08de9104144b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: grDwgM0EyPvVZVAPSmfJKDPjWKi1d8GkizTj/iLwEXMeXBp55LDUEQAMldv/fYiVqmn+FU80RTYXSwA2sL7HMMwhsnwfm/mJn0ZRBmVzgxzUod2/8uRuEWlEzjWU1g+NztM1iyLx1TizdQn6t6aekWYXWMIbaBnySrIcVlYWhAfCog4yVMYdUEXvaNjrRqzNqh3dCgTmai+jCi7BaaP15XeE5V6XxnmmNRvfJV+M9PpGpydlRlzQk1qTnbNfmtrVn1MqJ1B77W/Qa39/mNvpfBZGcIltTpWNpvxZXw0pyW4f+HKB15k6fO6ijlKzRxMH5Pgfe2xTIEBXCUU88kiwtwoGyLiZp13qnMYRpVzwizdIE10AtLWlLCKp9jCXknpdiuxqNvL/Pi0nAcfvBRPBEhyhLH5nrvQVEpzaojUzDfbIM2aCpjjaZkl6cqKuJ1+pQHgUcf1BYPUjCmR5t3BjJrFtyB2nGOj8diUKOFkGrs4rGvJ9nq4ChN9UMAX20Jd0Dpagor5NhcvTozB2kcFddAuUzmTSnWo/tMqyIM7Rcjf09GJnPDBvh/rjgyrr2Ur5EKAyQgs0rrzXgRDjY/2dNTdbvdFitiL5N5Dy7fbt+/TXmLLqRsmVmjeT+Cqz/PVPCOt/Zow+QDBJxx0mF6oag+ktokSxGtYYivRufFXq5mpVKUPJaqOwCJK0wAoYY68WOW/hvgu1vgnnVJwJLEyraOOmNIB+oLaQrO4KD9thtWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdUbWlvY2lENHVFVmpTWi9qa25VdmZidzZFWTNaRW44WVRuVUhONGxWSjZI?=
 =?utf-8?B?N3ZXMzRsWk9MejN4emVWL0Z2ekVPQmpoNnBPbnhNdnVyTUZJMGVlNWYvcEFs?=
 =?utf-8?B?RktjM3RYZHJFdGhYOG9MWXdoVERhSnhUK2ZRSnk1MHRiV2liQjFuSm40N2wx?=
 =?utf-8?B?ZXdqQlk3N0MwenlSbi9KZ0gySnZkY21ldkVzUWxzdXpzY2xNY2ZybHhlK2ZF?=
 =?utf-8?B?YUpsMWp1UU92WFZhNWJQK0Y3Ykg3dk5xY2JYd3VNY3p3a2NTMEJJUUg1VzYw?=
 =?utf-8?B?YUFXNlBCWi9QNDhyS2lQeC9Na3hpejh6Y1lOQTQ5eTJxQW85dEpvZC9uZlhD?=
 =?utf-8?B?cnRaUmd4SEtUZVNMSjU4K0JaVFordmcyaVVNWGpzOG9BZ0k0cmtvMWhSeXFh?=
 =?utf-8?B?T0xXbEtiZENZbUZMVDEzQUxmbWFZRnhyV0k3aGNCSDdzaGQrTVdJUVZzLzVM?=
 =?utf-8?B?VzdlOWhxNU1FOUM0U3FkdklkeC85WUlSeUJUak4vUjZOVmtwZHpXMFgwZVVH?=
 =?utf-8?B?NThKRkdmenFhSWlTL25yWVlUOFlQdk1aUjZtbUQrQnpPamptN2Y1SWRQb3Nw?=
 =?utf-8?B?UWFtRllndFM1dXRWd3Z4cFdmZ01ENlk0aGd3MzEvbldOV3V5cUdOMjBhVEhU?=
 =?utf-8?B?QjFzaEk4ajRLMWhWemRYNkVneUU0SnA3NkY4NWJsejZ0Y2NxVEVQNFJkOGh6?=
 =?utf-8?B?Myt1cW50NEplaEp6M2srQ0tmT245OEIzeVFKLzI2bC9iOHFlT0tHK0pnZTAw?=
 =?utf-8?B?NXVlSFc2MVhudFA4cU9QR3dxdkhzKzhOdU1hajFrV0ZtS1BCOGVXL005WldO?=
 =?utf-8?B?QVNPYytVSjkwZ3RBdjRzQWJUakJsODZ5bWVrcEVCTWw4eGh4Nkk5T2pNSmw3?=
 =?utf-8?B?dkRxZXE5Sjl1bVo5a0pYZHgxMmVmcDQwdDlsNWZZTlplajNKak1GU2RyZ1pl?=
 =?utf-8?B?T0c1MmJEL1AzbmFON3dpai93b2UvTENzYjVaMWlrSlZvNVlCMU5KSFdaK3Rr?=
 =?utf-8?B?MzdHdUpheFkzQ3luQnRjMDloNUNLVW1tL09hWFhiNmFRSFZqaGdXS1Bqa081?=
 =?utf-8?B?Z2t4N0tmTVozS1F4VUZLR2pFRU96VHh0UWsxQ3lMRHNTMnJ2UUNqc0ZtakR1?=
 =?utf-8?B?NUk2VGNpUG9mNzFleGtkNWoxZEh5dGg0NU5NR2V6dk4vU1l5dUd2WngreDVt?=
 =?utf-8?B?MGw3aDN2WjY3T2lSYVcza2s4U0RWUTBCaTYyeE9IaWg1QkV0bExHNnAvRndp?=
 =?utf-8?B?QTJCVG1UcWZsSlhlYnFVSEQwQ2VjeGtVNHo3a3JLTU44MTFHUC9XTzVaK3I3?=
 =?utf-8?B?bTV5YTFZZHBVUVFRY0RIQ0IzdVVaelhWTjdid2lhb0s2cGdTTEErVWNxMXh5?=
 =?utf-8?B?K1ZuSVp5Z2c0K0E2OHBGcGJlZlpNc1N0UXlETDlxcGVkb1BYdnlVZVhXUWRB?=
 =?utf-8?B?Y3lyY2RhZzhqaERDNWNwa1BORU9QbnBxQkU1MjRTVURmZDZrdDlJWDN3ci9y?=
 =?utf-8?B?SUVydEJTSWU5QnNqUzNGd1cvZDZCQXVsbmpWMmJKa2lHNUF3QTNjbXNrUmRV?=
 =?utf-8?B?RG83YmdkTGpXcWZBbW8vcFhZNVFPZkN6aThqWmVBRjdQdHQ3TXRPdDFFcUhI?=
 =?utf-8?B?cFVTaTVTajBleE8xbVFlYWhlT3Y5bkhVUlpicUI5NWpKNHZKNXNmcmExVHYy?=
 =?utf-8?B?azVlV2NRc3E2NEtLeGpIdzU0QnVybDhHQUh2OU9KeFF6L2xtQzlTVklzNS9x?=
 =?utf-8?B?dldESS9OSjFKT2pwc2c1bk5hODF6Sy9yS0dkSzVPMDFwLzJQbU5MbEhkeXBB?=
 =?utf-8?B?b0kyNUMrcTZIZjFPMzRZbzU2dG1pWkpYUUlWRUNiOTcwbmdEOGVJRStuRnda?=
 =?utf-8?B?dVFLaVMzUVpINkx5MkpZZVJIYkxESFJBOHhtbzJ4SnB3TFZhbE5zM05tTzBr?=
 =?utf-8?B?YUcyczY4elpUako2d2R0eW1GY1g0WEdqUXhzd3lDSDF2b3U4MzEyQkdjUjVP?=
 =?utf-8?B?NHBBT2FMclFYSHZtRTVic1J0M0w5VzZHNmg2d0pYcUo4bzZqaEsrR09CUFNV?=
 =?utf-8?B?TDhLdndiak1TOTN0YzZBSUhySkh5dCtmbFdSZVl4aVZGKyt6d2UxWHM5cVJY?=
 =?utf-8?B?bnRNeGtuZTBWK2NhS3FvT0NNL2t5SnRlL0ZIUkx6Rkl6aVYvU1hKUEI3Nits?=
 =?utf-8?B?dmVWazlaWStGd0F5aVJCTHRma1htZDAzZVh0SWxPaVcvb3lZUWtaU2NCTXBp?=
 =?utf-8?B?dkxjS3M3dW9tQzhZZ2lrTFlGWnI0NUdybUsyaWxlc1hhWmtQMFo1VzR4bEwy?=
 =?utf-8?B?MzltQzA3NmxvK0NiMXBUbFVWUkdCRy83MTM4WHlhaWpubitRWVhEY0pJb0RX?=
 =?utf-8?Q?ycn4dhiDFKCnJmMk=3D?=
X-Exchange-RoutingPolicyChecked: BTBnFHPGLfpTogp2R10iR3AHgX/ATEaIcVWUwb/wyn+Dd8yDmaqAU3YG2Y31ILorF1sFJ/8nx/+COTPYAUWZdUp9c0AIfuTFa3LdI7M1Y8g38Aqn7qY/AGP0USK03czrQDH0EPIqVI+TCAta60G1pCPDkYJjTdj+IeO23VBjxQZJUhQon0dQwfA51ED1CkirEz+do3aVkkoK9AeoHChFPaX8ZzTsoAE4u0c0GXn6Bdpovqn9JaQf4iwDzXttrYEhtHim0qCfyPX3oGesJLklsoGuhgMohBa3T/n26qezOw5f+k895kt2BNYSu36j3rwVTb/yQfDOy9j2xBJQUKJhqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b589daf-6c95-43de-cf0e-08de9104144b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 22:06:24.1608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUJe8rpWeRqBSWtqQgO8qZnHFB9vqKAdyzBHqeq4NI2GmGz73EAN/W6X1gEDBnGM7acdDfrj+Y6EVXjlybV54Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9751
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

On Wed, Mar 18, 2026 at 01:14:49PM +0530, Himal Prasad Ghimiray wrote:
> Implement worker function to dequeue and process access counter
> notifications and migrate bo based vma to vram and rebind it.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Again apoligize for streams of replies but one question.

> ---
>  drivers/gpu/drm/xe/xe_access_counter.c | 139 ++++++++++++++++++++++++-
>  1 file changed, 138 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
> index a2ce9dc45d05..9eb9917d8da7 100644
> --- a/drivers/gpu/drm/xe/xe_access_counter.c
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
> @@ -11,7 +11,10 @@
>  #include "xe_access_counter.h"
>  #include "xe_access_counter_types.h"
>  #include "xe_device.h"
> +#include "xe_gt_printk.h"
> +#include "xe_hw_engine.h"
>  #include "xe_usm_queue.h"
> +#include "xe_vm.h"
>  
>  /**
>   * DOC: Xe access counters
> @@ -33,9 +36,143 @@ static int xe_access_counter_entry_size(void)
>  	return roundup_pow_of_two(sizeof(struct xe_access_counter));
>  }
>  
> +static int xe_access_counter_sub_granularity_in_byte(int val)
> +{
> +	return xe_access_counter_granularity_in_byte(val) / 32;
> +}
> +
> +static struct xe_vma *xe_access_counter_get_vma(struct xe_vm *vm,
> +						struct xe_access_counter *ac)
> +{
> +	u64 page_va;
> +
> +	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K) {
> +		page_va = ac->consumer.va_range_base;
> +	} else {
> +		page_va = ac->consumer.va_range_base +
> +			  (ffs(ac->consumer.sub_granularity) - 1) *
> +			  xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
> +	}
> +
> +	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);

I can’t find any documentation on how the granularity works—do you have
a bspec link? Or, if there’s an internal document, could you send me a
message with a link? Without documentation, this may be a dumb
question...

Can the granularity ever indicate that VA + length is the hot region to
migrate? If so, wouldn’t it be possible for multiple VMAs or ranges to
need migration? In that case, we should handle it—probably as an
iterative process, re-queuing work items to migrate a single VMA/range
in order to unblock higher-priority page faults that may be occurring.

Matt

> +}
> +
> +static void xe_access_counter_print(struct xe_access_counter *ac)
> +{
> +	xe_gt_dbg(ac->gt, "\n\tASID: %d\n"
> +		  "\tVA Range Base: 0x%08x%08x\n"
> +		  "\tCounter Type: %d\n"
> +		  "\tGranularity: %d\n"
> +		  "\tSub-Granularity: 0x%08x\n"
> +		  "\tEngineClass: %d %s\n"
> +		  "\tEngineInstance: %d\n",
> +		  ac->consumer.xe3.asid,
> +		  upper_32_bits(ac->consumer.va_range_base),
> +		  lower_32_bits(ac->consumer.va_range_base),
> +		  ac->consumer.counter_type,
> +		  ac->consumer.granularity,
> +		  ac->consumer.sub_granularity,
> +		  ac->consumer.xe3.engine_class,
> +		  xe_hw_engine_class_to_str(ac->consumer.xe3.engine_class),
> +		  ac->consumer.xe3.engine_instance);
> +}
> +
> +static int xe_access_counter_service(struct xe_access_counter *ac)
> +{
> +	struct xe_gt *gt = ac->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct dma_fence *fence;
> +	struct xe_vm *vm;
> +	struct xe_vma *vma;
> +	int err = 0;
> +
> +	if (ac->consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
> +		return -EINVAL;
> +
> +	vm = xe_device_asid_to_fault_vm(xe, ac->consumer.xe3.asid);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);
> +
> +	down_write(&vm->lock);
> +
> +	if (xe_vm_is_closed(vm)) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +	/* Lookup VMA */
> +	vma = xe_access_counter_get_vma(vm, ac);
> +	if (!vma) {
> +		err = -EINVAL;
> +		goto unlock_vm;
> +	}
> +
> +	/* TODO: Handle svm vma's  */
> +	if (xe_vma_has_no_bo(vma))
> +		goto unlock_vm;
> +
> +	/* Lock VM and BOs dma-resv */
> +	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
> +	drm_exec_until_all_locked(&exec) {
> +		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram, true);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &err);
> +		if (err)
> +			break;
> +
> +		xe_vm_set_validation_exec(vm, &exec);
> +		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> +		xe_vm_set_validation_exec(vm, NULL);
> +		if (IS_ERR(fence))
> +			err = PTR_ERR(fence);
> +	}
> +
> +	if (!err && !IS_ERR(fence)) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
> +
> +	xe_validation_ctx_fini(&ctx);
> +
> +unlock_vm:
> +	up_write(&vm->lock);
> +	xe_vm_put(vm);
> +
> +	return err;
> +}
> +
>  static void xe_access_counter_queue_work_func(struct work_struct *w)
>  {
> -	/* TODO: Implement */
> +	struct xe_usm_queue *ac_queue =
> +		container_of(w, typeof(*ac_queue), worker);
> +	struct xe_access_counter ac = {};
> +	unsigned long threshold;
> +
> +#define USM_QUEUE_MAX_RUNTIME_MS	20
> +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> +
> +	while (xe_usm_queue_pop(ac_queue, &ac, xe_access_counter_entry_size())) {
> +		int err;
> +
> +		if (!ac.gt)	/* Access counter squashed during reset */
> +			continue;
> +
> +		err = xe_access_counter_service(&ac);
> +		if (err) {
> +			xe_access_counter_print(&ac);
> +			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
> +				  ERR_PTR(err));
> +		}
> +
> +		if (time_after(jiffies, threshold) &&
> +		    ac_queue->tail != ac_queue->head) {
> +			queue_work(gt_to_xe(ac.gt)->usm.pf_wq, w);
> +			break;
> +		}
> +	}
> +#undef USM_QUEUE_MAX_RUNTIME_MS
>  }
>  
>  static int xe_access_counter_queue_init(struct xe_device *xe,
> -- 
> 2.34.1
> 
