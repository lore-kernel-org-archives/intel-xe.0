Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C93D2629F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 22:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713C910E659;
	Tue, 20 Jan 2026 22:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNyg/Yha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D7210E659
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 22:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768949799; x=1800485799;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a+BiysCYMu72QoSdcmxcpJh0BH73MnHpsQXOr6S5kpw=;
 b=GNyg/Yha4j7NIhq/VHmyuMZw169W3lYOeZFfeAykhIPw6sd1rnLYvHxT
 Jn+tGgaWO90L9n5nTub5dr+tO8oJbtVKxbBhkRpaRm9YIFYd5rEFPRrkg
 EBwMyb1gFLOtrpMiMVqabADvc0cyYC16bBCcUC1H/vrM2Nh2e2OoXJTtS
 qX3P7T3hzuCVoyUGZyrd0+eYu3hgmbPs4bLzTbSytXIGnOpSQVYRKlTju
 O9Tl1SIEN0HWIasF9Vu0WvMRqzVcGf/CztPVG5chY1hqUzxQRUjzM+1Ey
 2WvZ721pjmPkWhAE/By3rFIXdB9qYxYgsA7166A1FWniFj1RQZtCI+/SN A==;
X-CSE-ConnectionGUID: aFCpXe/uSUK//Y8XELNmIw==
X-CSE-MsgGUID: LRFbDeUqSr6u37djP4CfRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70224862"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70224862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:56:39 -0800
X-CSE-ConnectionGUID: ffC2qQwBRDux1WV9Uf1auw==
X-CSE-MsgGUID: 6pg0YjgYT4+Ux4sVBMXlsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="229212088"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:56:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:56:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 14:56:38 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:56:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noecaAryfIxlGgVgA/ZEvx7zTMIz/09GsmZIuPEpo0Yr3XLcN48Gla++4fdndzZyU9MhveueW2sIpxpJa4Cn/IE1MFu9uc6meynXQj650bkBBQIsRT72mI+KEhlADtIHFEO2Bkw698QtHuSOqyX0wSJnAfrLzj9PQjL+jMFyyrWKUo942HyOaNbh8sWjOQRvVClx3A0iY/GvxgF7R7kjPm8hTSS3aYSjxfv6KiZWNVK8GxzThsEKBw5PDAUhKVxKRBic8eZ3bvCUbxdAdvXICP7+FWZ192s0fDrSOTbz921QV8l4WVdWxriNBmJxae4fcXBa9u0SZkhFEZowisQ7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myNOCwriZW6/J5e8gSeTSmfr7OXJghI1llEH9Xqqy/0=;
 b=HLXBctk2ADKwPG9Vysc9Anfgu0fQaXRi5OU3BaQfiG5AXLu9ZlGgrdxeK2RURP4Ha77jp8rWu+Zg6E3PrAmobQULyPOH2gs11YROCLhgkfDfNF23n4hYWwDjUw2IrCRqe68zZxTay9YsAx9ryw4DWoFNErcyIsdT/C1GPCAz+H0JExuQPbhrMya2GQf71RPOqbJIfYuo9bXPTg0lcx2EeKlFyenOngfJzVk44qLdWEQ95/rK5xlThrDerZx7sLV/F7qNr2ak/obQO8AFRX2C02wEajFvILPu6k7trxg7R41Ofvpck7N0rpglODdR9aA+tbsdXt0xZ6iNtQJ1ofyDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8699.namprd11.prod.outlook.com (2603:10b6:408:1ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 22:56:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 22:56:35 +0000
Date: Tue, 20 Jan 2026 14:56:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Farah Kassabri <farah.kassabri@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ilia.levi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: add kernel VM BO unbind helper
Message-ID: <aXAIIRj3OaLgEMvU@lstrano-desk.jf.intel.com>
References: <20260119150330.6537-1-farah.kassabri@intel.com>
 <20260119150330.6537-2-farah.kassabri@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260119150330.6537-2-farah.kassabri@intel.com>
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 057e6991-f5f8-4640-8021-08de587729af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IzEaOQzymdxL6DCqxn2DazQpDhxnX06OD9iKfbWB0TtjP029MvyMI/wag64i?=
 =?us-ascii?Q?7r58G71YuAbgbURzL/J5VFmCuiOiFKHwtAZ0jjpREJ25evvckgbQyXn/XYtW?=
 =?us-ascii?Q?DZsnZ2bc3bQL8wh9TPcXFsVf+OKG+uqSE7KzIXbUWj04ES4UcLFSw73MydoL?=
 =?us-ascii?Q?hHLqO6O8Cv614OTUj5kd43AKlh0pzlYc2Zm0bTUU0J/RpoPfe8fBHzI6jWPm?=
 =?us-ascii?Q?bvUWFRQprZWu0PBxKdKAc7AmG1TEVaGnRAssVn0DfRDyWBsdWq2cRI0T0bEt?=
 =?us-ascii?Q?0pQBy98XJqRY5w/UI7PFMlIpAxw41Mh9n8sPsg+BWuFX2+Sx6St6cjxsHyL4?=
 =?us-ascii?Q?t41odhes+VAf1hBKfbw3iKnj7C1bg4PyFVMatONHdetglUidGD7IsIyZFHMR?=
 =?us-ascii?Q?kBxkLjLrBI5/T2qIhnigloPsKvZENDnZ3qejzYSHJ3XvTIUA5OqQHQkAtRRp?=
 =?us-ascii?Q?dRTecK6nbKrVvtRPqnymKp/gT1qeL2jAmavlZyD1LEUW3ym+UrOovyH+EzmS?=
 =?us-ascii?Q?J1VaamajDAK6KUYgr3Jy8SOR3nbPk3sNlR38dkyruCSi7CkSDoP4AYo36gsS?=
 =?us-ascii?Q?/R9d8E2dPiYlw/bGxcYjMkhUxh7xM+M/VHoXcTpQZEm7XC6GU7nJxl80kFMd?=
 =?us-ascii?Q?+VERJIGCo8SGmNd6sE+CpqiiqiMTsW5ym/RiWcDTGfkbdZGPwv+4o2ZaMQD1?=
 =?us-ascii?Q?4tOrJKczqoG6g6HKeqgdHRWHd9SZO6d56rEPxOF+/AFM7WP2dSzgsdhvNe+m?=
 =?us-ascii?Q?ShlxIg0DypHf0vd7W6orprSli48uXdfNNs3UjgssLWLmPs8+2urQqCBPiZdk?=
 =?us-ascii?Q?Pd5GNC7JTmnLD/QpAsO9Wry7y/gALZdB82DttJ9lWmn+z6rjd+U2ku/eq8F/?=
 =?us-ascii?Q?rB1mllmVKfGdTLbg2/KDrl/AcV68WlqZW2ifv9Rke6oQz5Kwzac5uFdKpi99?=
 =?us-ascii?Q?82Oeo4kKWwVE78sQoFIkj5MtseqOwzrasfg6y8y86N280PJUx/e4OMQlvYIa?=
 =?us-ascii?Q?3EXOpUAFWy0HWkqCH4FVLgIxIlTOh8ovsBNanr5BusxCNwGGaiDRCPrX1ymn?=
 =?us-ascii?Q?Vki/NI0ecOzvDgB5SFeGLP7TvYhpjDNjH1rLd3lsEWZ1n2Dqjfw9AKLSpRZo?=
 =?us-ascii?Q?YoDkn3sM/IhAZxJRBcj4EcAtVRXRz7nNvXuTOFvSX6bPLP7j4X4cGMm6Z/C7?=
 =?us-ascii?Q?MzTn09DhlZesJ+zLWNHH8V841Oki7RhgbMsqpU+5/ZlHTNl4RGoSDoBXb4RB?=
 =?us-ascii?Q?wD50Wt7Y/NtGqo52ZB5l3e2KFeI1oUzcUUO1/VG2yB0uskMFJeok4CPL+zaP?=
 =?us-ascii?Q?/ECYdXFqvFMwVqD3xGe8Su7Q8+RBpVMZ4Qa/rhkZV64N33mg3nQjKRGjlgN8?=
 =?us-ascii?Q?Pppv7axz2WgWdClQAL5d3xN5l3jsi+/atxCOQksXCR+8QLnqJFpu8JiYjOiE?=
 =?us-ascii?Q?RlPV+nUIvGpOOdIhitqiOMt8VaJJDH0crkKf0uy8ys9tWwmXQ/5Ua4NkHYsx?=
 =?us-ascii?Q?XzgfVvixofp8HpLg9swQXmVfMUINLhkBfmhF2Oiwg1WR45BjgArMbXrcQJE8?=
 =?us-ascii?Q?as+8RHcsE1ecKeH75TI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LunTo5Rlro77y3fomPq/KwuXFAHRjMYNdhQKIOx1fTw/P9Y9KYkMPWd7m5Ej?=
 =?us-ascii?Q?Q536Wi6YXJz5rgSZ0v/LP/dy6tFkDDPzlfxRugOskr/5gP0JQEs6lGvCX3MT?=
 =?us-ascii?Q?jxfhxKieJgmKSzc8FjixsOBcLOVEZ1h7LXsf6iaiRiC6OVvADIjk8W+yYhEA?=
 =?us-ascii?Q?0MlRz89XnDtM3WC0lqCEN2+z5gzzQURagCd780MLY7ab3G5LvHwyN11l5mHo?=
 =?us-ascii?Q?70H/Py43hhOIULqDSY/vdYpDUfUnOgoDy2uxBrgPTFdmcvx/11RAKYjeRkRD?=
 =?us-ascii?Q?kjS6qBS/V3LZX8Bou0zpsWwW1zNweeWV8LtcqicBoC6jBvYNsGOXksgmUxbl?=
 =?us-ascii?Q?MkIa+ukp5/LpDjTBMJaaY7rtOi31+mB3fNRg35EIcChvbNG0kdPADmB5EZn2?=
 =?us-ascii?Q?DFOMopvOJbu2B0rhT26G31hF1Zcev774kyjuqRr39SHycZcptaB9lUja7NH8?=
 =?us-ascii?Q?tDGkAouVYMiv+3+cgmRhRLgTWjsdDM15NFJO26QWgp0p6Md2Z9rWq5+7oaJD?=
 =?us-ascii?Q?UCT/zfv8gDqIVjozCsjoqL4gup6X3YXlQ2xDcEnagMzmhPoSu02V9QKGZiRl?=
 =?us-ascii?Q?0VnsvJG9neCXQ+mCkj+xDcvmAE+4Pal9RtnyLVyyJUyKWhl9CR+4gou+hxW4?=
 =?us-ascii?Q?dgaE904RI41j/xECvxTdBVHPS9CzYLPSVgYT5OOpkdZb+Jvd0KnB66bteF2Q?=
 =?us-ascii?Q?0ne5KVuyjKkW4PBpJflN4jJ13JbAXPSy849P7kj9kVQq0iHTFBjlIv3kgtt/?=
 =?us-ascii?Q?JF8i985eX6c3V0wKR/jdV9unmMacZa46akZtmY874yTDDO59k6QknbVRqTpp?=
 =?us-ascii?Q?y2LJ+8cSSVZWa1IHdMvQipLMxq5S25asFz/sk0bNGRHu4QfKDxpFGGhl8owL?=
 =?us-ascii?Q?svDhn133U0YGkkGcq007DSR3kjvXFT4aXWhta/ZsWXlstGMaizRAvXuvBUYK?=
 =?us-ascii?Q?HRRKyp2mCOmFLHoevN4s5Em9QoMUVKlqMasLTBkhKGHL0smt+qFujMwAHIFg?=
 =?us-ascii?Q?3bfNekdoahWTNWiA0Rk2Ow29La0Yfz45rJOBDXgAExIaVGC82oRNS9HOkIuq?=
 =?us-ascii?Q?yn143YqKEKDE6fjKoboRCirUDPOwbXuy/LFZB0SGWV7fji+C7JPafQCrGUqa?=
 =?us-ascii?Q?kYA/DnsLN3LEfGOwCwzbThwa0fO1g6ozXtTNNX3KIi/GLiKcii2MsWps4Zj0?=
 =?us-ascii?Q?sVuugB1D/TJEkeGh2hbQ0/FWb8Yc+796N3FPD2d716PpDwwdygRVrWy/X/M5?=
 =?us-ascii?Q?Lm7AN0LePEkmsE1iecJxV8Iww9mo20oQKVlrTg4AsNgNuR1msm/5uAuFmvDk?=
 =?us-ascii?Q?riaknb9dOa2RJJNzg5HmwsRkY2s6xCyMQdfABRGkw9hMjGQFsgEuzdZz5tmC?=
 =?us-ascii?Q?qYBi8h6o1DFXdu8BixZKAntPOpLUPcmm8kkFniYLGkkGk77m1JqJfeU0MKTe?=
 =?us-ascii?Q?7ZFp+vUtIfRxBsLb/0iI+ZNGAfWhVrZL+xWiAPWGYh6c8BD1XNR8bIQ/8QWY?=
 =?us-ascii?Q?x26m9JuzdOySN4UdksINUPi3BxOCN8ev9EUKf5eWtwCa3wEAtr4qjgN5i5Iy?=
 =?us-ascii?Q?thAV1ewYuOOOPxVJ+fS1iKgqPs1BIllzhuZ973pbaHEJIaxhs9jpwIkeRu0i?=
 =?us-ascii?Q?fCvMsM3DP3C8x4DmpSqZ9nxDFeo8LuWZMErOk/6bLY0eu68bfsn1FuVPWmZg?=
 =?us-ascii?Q?+oR3NbR0R5CWa3GBPxeILp6qTJHR3S15zWS6HgHpyd/b5DrESRDmAPhR1/Ec?=
 =?us-ascii?Q?JN80uRuXsozJPcFzln3ZPkDBQ3eozp4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 057e6991-f5f8-4640-8021-08de587729af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:56:35.8202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkswleIBKO+IoIHYP0LdXAOaLaFqXEV2KcOmGltemogcRqmvvjZAViJuoqCNNeGza5UfKHlouk/If5u1Y0Ya8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8699
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

On Mon, Jan 19, 2026 at 05:03:30PM +0200, Farah Kassabri wrote:
> Add xe_kernel_vm_unbind_bo() as the counterpart to
> xe_kernel_vm_bind_bo() to provide symmetry in the kernel VM BO
> lifecycle.
> 
> The new helper allows explicit unbinding of buffer objects from
> the kernel VM, enabling proper cleanup and preventing stale
> kernel VM mappings when BOs are no longer needed.
> 
> Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
> Reviewed-by: Ilia Levi <ilia.levi@intel.com>
> 
> Changes in v2:
> pass cache_lvl argument to the map operation instead of 0.
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 59 ++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_vm.h |  3 ++
>  2 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a27145a4137e..425f406712b8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3830,21 +3830,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  }
>  
>  /**
> - * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
> + *  __xe_kernel_vm_bind_bo - internal helper to bind/unbind a BO to/from kernel owned VM
>   * @vm: VM to bind the BO to
>   * @bo: BO to bind
>   * @q: exec queue to use for the bind (optional)
>   * @addr: address at which to bind the BO
>   * @cache_lvl: PAT cache level to use
> + * @do_bind: true for bind, false for unbind
>   *
> - * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
> + * Common code for binding and un-binding a BO.
>   *
>   * Returns a dma_fence to track the binding completion if the job to do so was
>   * successfully submitted, an error pointer otherwise.
>   */
> -struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> -				       struct xe_exec_queue *q, u64 addr,
> -				       enum xe_cache_level cache_lvl)
> +static struct dma_fence *__xe_kernel_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +						struct xe_exec_queue *q, u64 addr,
> +						enum xe_cache_level cache_lvl, bool do_bind)
>  {
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops = NULL;
> @@ -3860,9 +3861,13 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>  
> -	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
> -				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> -				       vm->xe->pat.idx[cache_lvl]);
> +	if (do_bind)
> +		ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
> +					       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> +					       vm->xe->pat.idx[cache_lvl]);
> +	else
> +		ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
> +					       DRM_XE_VM_BIND_OP_UNMAP, 0, 0, 0);
>  	if (IS_ERR(ops)) {
>  		err = PTR_ERR(ops);
>  		goto release_vm_lock;
> @@ -3903,6 +3908,44 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  	return fence;
>  }
>  
> +/**
> + * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
> + * @vm: VM to bind the BO to
> + * @bo: BO to bind
> + * @q: exec queue to use for the bind (optional)
> + * @addr: address at which to bind the BO
> + * @cache_lvl: PAT cache level to use
> + *
> + * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
> + *
> + * Returns a dma_fence to track the binding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				       struct xe_exec_queue *q, u64 addr,
> +				       enum xe_cache_level cache_lvl)
> +{
> +	return __xe_kernel_vm_bind_bo(vm, bo, q, addr, cache_lvl, true);
> +}
> +
> +/**
> + * xe_vm_kernel_unbind_bo - unbind a BO from a kernel owned VM
> + * @vm: VM to unbind the BO from
> + * @bo: BO to unbind
> + * @q: exec queue to use for the unbind (optional)
> + * @addr: address at which the BO was bound
> + *
> + * Execute a VM bind unmap operation on a BO to remove it from a kernel-owned VM.
> + *
> + * Returns a dma_fence to track the unbinding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_kernel_unbind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +					 struct xe_exec_queue *q, u64 addr)
> +{
> +	return __xe_kernel_vm_bind_bo(vm, bo, q, addr, 0, false);
> +}
> +
>  /**
>   * xe_vm_lock() - Lock the vm's dma_resv object
>   * @vm: The struct xe_vm whose lock is to be locked
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ff32f43aa1d8..b87e80227c79 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -272,6 +272,9 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  				       struct xe_exec_queue *q, u64 addr,
>  				       enum xe_cache_level cache_lvl);
>  
> +struct dma_fence *xe_vm_kernel_unbind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +					 struct xe_exec_queue *q, u64 addr);
> +
>  void xe_vm_resume_rebind_worker(struct xe_vm *vm);
>  
>  /**
> -- 
> 2.43.0
> 
> ---------------------------------------------------------------------
> Intel Israel (74) Limited
> 

You should remove your footer for public mailing list posts.

But patch LGTM.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 
