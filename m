Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F294C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 22:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2247B10E0E8;
	Tue,  7 May 2024 22:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kr6oCyJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4162E10E0E8
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 22:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715120261; x=1746656261;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a0bB+mc9Y+sURSnzQgLE43mnsIcGZLPVVx3jwBbpidU=;
 b=Kr6oCyJmpBvYUGb0X2/did7gvv+Q+VOaKWgjnnU2mKahwYMhTLNwxYy3
 BozfGKZqKtDLuUB28TJ67L463wEg6LpeDZv/WHyQql3wr3jm0K+FAjUVp
 l1RbS576xYDCIiYPaYx6ZdT5G40OdbpzFtMA9Zf3KuFBqLtIUdeeeUcuf
 ns4/yDNCPIUZidm/sQbV4tkj3J+GbOnte9d/YxD0Ssxu36HR/jGiLM5c4
 nTYWl5/qH/F0zhw0n4U71tioqN/sYkpa9s8lggoOuOowZkaVsA8ULLM92
 jjzhJwaOhAct69dXhO1ByOpciTVoJVeDcR/YxUZMHYTYp6dtlYVQpBBdH w==;
X-CSE-ConnectionGUID: KYegCP/JRKWytJsDR/yN6Q==
X-CSE-MsgGUID: Znt2VMsrQ5aLYxNy/oeXUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11163382"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11163382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:17:40 -0700
X-CSE-ConnectionGUID: wygbGy/ySs2c36VsQUe5hg==
X-CSE-MsgGUID: bu9o062rTNieZ6nZbTANkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="29227259"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 15:17:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 15:17:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 15:17:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 15:17:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G84OYornJJd32qUMmQr/H68uigJIYnh1WkDbyHH8iCLKabuVEeBpSOq33++YXEfK8JJN6D54Lwu3IAY3YqZPzfJzSPMX+iWMgujftiGl5hxof9TcSagTV4oIhXtqZhgjqhdEsOaaCFV+KRr1sNZ9eisL4OrinE+DyusWQvGCuhaHa2SbvS4gpVI0nGrj3CnwPBNHCxIdGPLV7lfvUcqit7u5ef+sUKLeEpnkKsoRFVrBzmo6eGgdfrkc5GtNUAHpdN6ePT6gnyhxqYLV9KV/I9pSwHF/xv9q+emM26EWxYiwZ50vsqiAQvgjLfP67NUFV7nz6NOi4n2sMOPdaDMNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTAdt0i9pwisrMZzhR9TwzrIif7QPtr///aEXjrg3qs=;
 b=iwQ9QulTMhKmLjtwfwszkKPLl/qyiK25ydk7MbsiZN06o7wKQK4W5nkL4glsnQrIUD38nqBSVwUOkc7Wd1ZfzcSeth1VU+Swg/vHpWtQODwlwPww7+ZQJj0m7CZLK1HMwzzJSuaFagOhccnQCFRGEm5VC8QziO/hnEIoBqjloDnTNmdEYwt8pBVVVUY+ehEc2fepv/mS+DTwdRU5ijVrVaqewcdrEFT00kQ3ZXta4Bl6wOthcvOZ+dp1pC8ns7HZl64mLduWSBnaGWffBYEp3gfAtlaCHcurEWsYNZP6ba2TdjISDMkMtLIhybWWWwzOcCj7rVAIca9nzlvI6ROcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 22:17:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7544.036; Tue, 7 May 2024
 22:17:28 +0000
Date: Tue, 7 May 2024 15:17:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/4] drm/xe: Dump Indirect Ring State registers
Message-ID: <20240507221726.GF5615@mdroper-desk1.amr.corp.intel.com>
References: <20240506171111.16280-1-niranjana.vishwanathapura@intel.com>
 <20240506171111.16280-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240506171111.16280-4-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc88ebd-ba4d-4eeb-3a39-08dc6ee37b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sd65tVRtvwGtVlcPHYlVNNAFxEjat3bIdyge5Mav1ybARUrl4/WYrEmzxz02?=
 =?us-ascii?Q?krquoBW8Lpt9D2xgZPGGtQ6fxmobY2ph3CePPygtDEbvh7EIHSDZwafzKZ80?=
 =?us-ascii?Q?b5NiNC4TsOt5VYbeFCwonp/ZM6fMOgIjV9ak1/waEMvu88XJN24v0JV49do7?=
 =?us-ascii?Q?yAjx2ZuiaYTSQQNIIdfnIrJUir3dpB4eQy+jQAgXTaX2jnMRhW+IL5+Z6Js3?=
 =?us-ascii?Q?KSIdkmiDIQdu5qgPWbBjFH36BrblV3/KQmnp/aCKBt2wLg02GbcWplwtjNN0?=
 =?us-ascii?Q?ZadeY0tVo0vSjfJb8wG8HTv0y64k+n67Ou9Y9Ie12j4yrCk3HZsTD2vJL+qf?=
 =?us-ascii?Q?UtyfkJSCDsDjKUD3ZjxgR+9BuwlH9XIuTzUR/eDmyelytlePHkl8subhaWAn?=
 =?us-ascii?Q?3lx9+cNTr0tRmT2k5/5XS8GwWVHDqCcw+vcnrD/BIbgCjk3907GX15q+QpRY?=
 =?us-ascii?Q?QFUlyrvK0A6CK5mwdX7Jl2wdpIAoaFETTnd1Tx635yvbjtkmEghnlwWJHgWp?=
 =?us-ascii?Q?SlLQFDZlB66HZpgr9+SosnyN8mfzi+UKaxhWiAnlDME+eW0J82n3wHTZk4xQ?=
 =?us-ascii?Q?pN0BbAQ0HjeT4st4xqVULsGX2Yzpwj129kiGve9RM/uwkkoT/ETeAt1Exq2D?=
 =?us-ascii?Q?TVknPRgDMBVwOsQQV3KFMoJxgXLxtk3HKyvXqJoFYO/eoy49eXyuEACnJcbx?=
 =?us-ascii?Q?IrBFJYOdel7yGp+RGMhyaNo7j6OCW6f9x5tweRttlmC2JSFIoe01+VRLZPWZ?=
 =?us-ascii?Q?5lsu2oU1QGfdvCWbSQNc4USe+kvrQz7TV+fVN2+Gojar45PRR758YUaCMHpL?=
 =?us-ascii?Q?mQKZi+SDv19WgjQMY1e+6nAhwlJAYnVj+95Ti8bcQSdYNuT9KvFCwN2no74z?=
 =?us-ascii?Q?cKQEuWj0dR3G0ITITSMwd/lyx9cSrTWodqYbU1Nb1oco5rQ7ibJXutDgvXss?=
 =?us-ascii?Q?3c99iroEdkGRjFcMQBFdYPkRZv9ihL7qOMcHck3g8odZ3RJRW37T1pnTd766?=
 =?us-ascii?Q?dTlCA/UrvBGwevCfss8BDdDNK0ly7mPwBTBbgDHjxSLb0gs3J7sLjq7p3JHo?=
 =?us-ascii?Q?u11WJkp3znW4CZFrVmmBuGGU9jOj7htuErcQa768MVFd8Z595w7QLCu2AHIy?=
 =?us-ascii?Q?xdEq7CEuWTFsP3XATt9B8Xor9IJNplnJA0Rbw+IINm8Ep4PuzuspJa5n502F?=
 =?us-ascii?Q?bmu0CHIq+eQaKRewxXVAuTD0Cq5ZwICZnfUty9VL3NA1ywsgZy+RejLYmagz?=
 =?us-ascii?Q?k8SR6fgsp81XHValJMKhrOg8Y2THEaIT3oolqF+Xhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/6siXqr2Ju/WiTWgBSwMkj+229MWsrbEhEZTz2m0ZnvW8+NCvCBtpAXyRAgO?=
 =?us-ascii?Q?vYpvwwtLmGId3dgv1UlA9Lq8OqJoI8gHu8OMC6op92i/xQQbirxyMXB8o7m/?=
 =?us-ascii?Q?eQ3xXKPXzctzsyQvSZbW/IT105zhUs8hIG6/i9M0omtPy7fAF0m0WbSAdA06?=
 =?us-ascii?Q?T6lVoSJi1kgsm/fVd1FGONshA90M3Be5gxeZec17GQYcIe1/C+0WQFQrZnE2?=
 =?us-ascii?Q?JFFhAfHs/km/zPcHyDhvXXm6sT6QiPRhru7EX3gvp9QU5WNBKshrMq/c69eO?=
 =?us-ascii?Q?wWC4Q/UuQB6b+3Ed1wHfKCFxXgB78DFexRl157XHoB5o/NC3EUWOk0UoHkps?=
 =?us-ascii?Q?FsfuEpwttTwtt4HTaklLPo+bRSRilIyEvI6mWxNHsg4gEHlcE4Ln2irL/DXa?=
 =?us-ascii?Q?XOfRScm10+WaYcRZek0Dlzx/ITfmNif1zycCrYOWbQhX1wiTvY7BXw1+pObS?=
 =?us-ascii?Q?sJjHSUHbTjdUx/pvbVvV8Ig99ae4ddrlcbqLw1QKMy7JUtDG2nr8eEyBv4KZ?=
 =?us-ascii?Q?TojSFdP52QhKHKX5KiIZPCzxU5mkvwjmsqlyKPzV87q2j+xtVq+DgO3QBDx0?=
 =?us-ascii?Q?oM67cRhy6fESGAXGAqGCugdzpbIwIMia7DzxekQ/TpdBf80t1wA2g5k8SaUp?=
 =?us-ascii?Q?Dp3LaSE9QVoyyRmdvYVe+xdgpivpOWj2N80GfmwUYQIfHh1zasLkkTCnzHJE?=
 =?us-ascii?Q?+5oxM0C5Vd2pFT6DfzOGVGKJalk/kgpnfp0b3B9g2VN/y8hvNvY/JK5o6seZ?=
 =?us-ascii?Q?EBlW6j9rctLNiLl/AXJCsenAaAk0zZ6CWkphW6PNAthGT8iRio4ONSiY0xi7?=
 =?us-ascii?Q?VCvavMUuIk1Y8t7z/GJrnzna1loKr3onXZUTprt25R46vq+QIOTzWUigBIZq?=
 =?us-ascii?Q?+4Gs8oZsdjFQpyd7ZP12Yto/kCRy4EvHnjKXpk1kXE5wjxBrZW0pc4Wo2S1N?=
 =?us-ascii?Q?QUJxPJgbfLJ4oDXtntHvEfwur2IAylB0gpxbFyLfYJNevmOyUonOPLU/EPrA?=
 =?us-ascii?Q?zLr06J0nPwfAX/iSOrURJ9VSQFBUPISvSLjw7hHIlVxv3ep9dqR5L+CdGJ6K?=
 =?us-ascii?Q?TIIOhD9YyIIrKDmTpC4PcA0RZrTHFYBXxIiX3nHtSZt1DqWokh6DDjtILWId?=
 =?us-ascii?Q?0UIPQfJ4kKaDTXwUoNN5wJZD9l269Bjf6cd5hMMXg3kTHKMGsXvH2H8Mb+AU?=
 =?us-ascii?Q?rbIU43zOO7442CowL/AG6CApYMWXjYenK3M//xOnKNIDT/a7pBP+xgDV8szN?=
 =?us-ascii?Q?pmG2UXYOQfCF7cqCSr6frZaL/uihuVEFRrjsYg0kwivIcn+NOPmZEjqfBayX?=
 =?us-ascii?Q?Vob2eK0GWG2dr3V8+O8866O3k5ggDQAwIJiq1OEeu4vs4ZXcLttioymS7+66?=
 =?us-ascii?Q?yGNYetXfdMxS8z79vXZHmoAuzE/glYC1mfhSoljqtjrvspfW7wQWrTiV1zlF?=
 =?us-ascii?Q?U1pUG+hsxYUslvq8avy6w4177yU++CTaZSS0Wx+mBIc1Xe7wAyr4fBJ8WCLT?=
 =?us-ascii?Q?OiEadY2nfbocFKj0zA1VCK2EXbgDQqVeKQ85+0N6JJ96GS/GJxxB4bNSQyXR?=
 =?us-ascii?Q?hB0XXoDwZhns83ZW6cRAQpkrTxv4E8sP20A8cCcCNsb6Gvbfyi8hrwqk6/sv?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc88ebd-ba4d-4eeb-3a39-08dc6ee37b75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 22:17:28.9118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdgFj3kJMmjcoRMTlZ2SKi6ZK4DtbppCgFXXuZ4yTrKAew4m495L5Zn0+p9SOt5xMfN6pVNasGSkoaX99HQxV9ZIJgCx3IO1NlMsnYBRWWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

On Mon, May 06, 2024 at 10:11:04AM -0700, Niranjana Vishwanathapura wrote:
> Dump INDIRECT_RING_STATE and RING_START_UDW registers.
> 
> v2: Add bspec reference
> 
> Bspec: 67137, 67138
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h  |  4 ++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 260a44f46f7e..263ffc7bc2ef 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -55,6 +55,8 @@
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  
> +#define RING_START_UDW(base)			XE_REG((base) + 0x48)
> +
>  #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> @@ -110,6 +112,8 @@
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>  
> +#define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
> +
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index ec69803152a2..45f582a7caaa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -908,6 +908,13 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
>  	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
>  	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
> +	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
> +		snapshot->reg.indirect_ring_state =
> +			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
> +		snapshot->reg.ring_start_udw =
> +			hw_engine_mmio_read32(hwe, RING_START_UDW(0));
> +	}
> +
>  	snapshot->reg.ring_head =
>  		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
>  	snapshot->reg.ring_tail =
> @@ -997,6 +1004,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
>  		   snapshot->reg.ring_execlist_sq_contents);
>  	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
> +	drm_printf(p, "\tRING_START_UDW: 0x%08x\n",
> +		   snapshot->reg.ring_start_udw);
>  	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
>  	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
>  	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
> @@ -1010,6 +1019,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
>  	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>  	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
> +	drm_printf(p, "\tINDIRECT_RING_STATE: 0x%08x\n",
> +		   snapshot->reg.indirect_ring_state);
>  	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
>  	xe_hw_engine_snapshot_instdone_print(snapshot, p);
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 9f9755e31b9f..5f4b67acba99 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -189,6 +189,8 @@ struct xe_hw_engine_snapshot {
>  		u32 ring_hws_pga;
>  		/** @reg.ring_start: RING_START */
>  		u32 ring_start;
> +		/** @reg.ring_start_udw: RING_START_UDW */
> +		u32 ring_start_udw;
>  		/** @reg.ring_head: RING_HEAD */
>  		u32 ring_head;
>  		/** @reg.ring_tail: RING_TAIL */
> @@ -207,6 +209,8 @@ struct xe_hw_engine_snapshot {
>  		u32 ring_emr;
>  		/** @reg.ring_eir: RING_EIR */
>  		u32 ring_eir;
> +		/** @reg.indirect_ring_state: INDIRECT_RING_STATE */
> +		u32 indirect_ring_state;
>  		/** @reg.ipehr: IPEHR */
>  		u32 ipehr;
>  		/** @reg.rcu_mode: RCU_MODE */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
