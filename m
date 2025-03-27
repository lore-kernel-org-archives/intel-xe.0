Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F566C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 22:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA04A10E1C2;
	Thu, 27 Mar 2025 22:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbembzqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4550810E15D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 22:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743115750; x=1774651750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c72AJ96vpq2xz0k0Bx04rgJi911RBQmFV5ykToKFtS8=;
 b=MbembzqAm0NicKe3ytb2CokEgVmePSbIJBKab/28Vi4a44+z/B9hFJSI
 uCvEOv+lh4QTxRPyt+QnMDR4JWMYaCKsLNanmtkNcmk6j7MVy3aFZAYn/
 xaECFNhD/3oWpgnNbDicsmKelLNdnTp1yV6XN7NInGlaX+uCAf1YpXgdB
 6R6PGqfqqWTUajjIlIzHKUM60YMOzYMa7x8gjjFRv2Y3qEj9pom2pO96U
 b72LZckqeqvU8mbAFdES1xz41E5OWxXd7nODbIzZ97eXRd3052+MCWqkO
 yggx/TQx80/07Gvndxm+ojnR0Uhh4ve6oYKXr2xSdKg9WcnhvHYNS6J8W g==;
X-CSE-ConnectionGUID: SUQ6oT4sTCqYWBWlmxILfA==
X-CSE-MsgGUID: e44GOBz2RJSL5my0TwC85A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55842070"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="55842070"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 15:49:10 -0700
X-CSE-ConnectionGUID: QkNaoiBgSsWWnr4K346OEA==
X-CSE-MsgGUID: ZKgEDmGSR3yHFCaf2FkwhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125033703"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 15:49:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 15:49:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 15:49:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 15:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZ2fMVsyDHOG2q+8ybhCBIXi0iq7AmX4KdabpqPQSrHjL+umT857BV3SAkhbCMXG+Xqh5pa6OpGJnEdPYxnuVpTpop+s1fISlHYBSASRcyd51XrP6Qqu0sDSy25N03g0/fTxa4ei2+/53KLqgRy4mGHENqs8wm/54MaRYStvXU52LiFL/0r0+eKsHZRIGDz9UiXmds55ITtK4rnELONxWAsQyV/jTQwWPKXWdEjdEuNJ64J1JN4a7JrjSXNHqBIrypyJ1mZLmKy2i4z9Efx10xfTvl3xWWIy+SaC0sF+DTepwxDKt3m0NQJFv5N44ItIoO2ChkRbTL5CTt3//yvfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWaTFSw/BHESskJvpyM0Lg3AMIl229xnJweT3Vxv6VU=;
 b=rQyaLHou9N0zpeEiyy8MWkht0Gz6K0y+nSlkr4LiMjkv1WIAfoeac62/V4067TiA9Uam/+n3TzRUYZN3UEb5OVGDJ2FW1MKY9kgWnPlxcPKPG3WBF0URi5/8j5rVXCy9/NknSrGFG4gSVyhcRMili/bgebl1ypGPFXjQp6xzMaDWR5vmwL9PIw6NFNgOz6JYv1pLctFxCJhRdSzyNht4koeSCWB0+J6op/ejoEkZijdgTuNJ2qMYqxYHjmity5dwH0u931PXd/RU4IMPJZNgKn/HscyBuN+GKWigRqAVfAIZGZWzIf79Fmo9r8G9uzluJIv4+kmjsQo1oKJqfO4HZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 22:48:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 22:48:23 +0000
Date: Thu, 27 Mar 2025 15:49:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 07/29] drm/xe/vm: Add an identifier in xe_vma_ops for svm
 prefetch
Message-ID: <Z+XWALoZ8tfnFAN9@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:303:8d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 87268e17-6f6e-4aa6-86e8-08dd6d817ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H7ptPF1QZV5WJMoFA/VIGf2YNohRym4x4LNnCgvyqbf5IjXluLuWDmirAyld?=
 =?us-ascii?Q?0fAdS1yO5e5Y2ZlXbr+Xw+1HlfHmEa5QtjsL1NBJjq1PXtb41ZtdgeU5TjoY?=
 =?us-ascii?Q?A8lgUnRNhM873vBmW+8+8PcqkY1U3EAzg+T+TkqIxhuuo8OLh2KfmeOIZKU7?=
 =?us-ascii?Q?6kjgJMpJL9OKOMAJSAZB1gPNEVAySYkt0jwaEQi/0fpWVuMPclpl0QZNH1Mj?=
 =?us-ascii?Q?HhA+ew8W/1AnPWXLYUGw3SAHp11f+iFI8k4I6AutTB9Tbh0uFjzHuWpyjFHM?=
 =?us-ascii?Q?a5gcdTkGatNXO68BMeX2R2JZZQy5oUdnlgNjqeRiN4NyYvmrlLaIAEa5SCYe?=
 =?us-ascii?Q?4Zcbc1saGIsSyZhVe6Tl71+rRNXX701geSfgd98RRHX7j+luAs84b/90G4vC?=
 =?us-ascii?Q?4gv1XPUuXE8XJszLV6Ax0PGK51j5sJM2JfYuAaAWjkjPq3MxUQV95O4CvVoe?=
 =?us-ascii?Q?hgbmUrHUrNhuigHNUl5OKTgItovgDgY0mRN8Fwsi3tMguYVm2HLLf32PxFw2?=
 =?us-ascii?Q?OAjVzbTCkJ1Jiq8vlJziMehxzCfAXSkg9yu1ufBK7rKLovzKeHqD6J3kzJJI?=
 =?us-ascii?Q?O58aILF24RfJ1BFfdpbIll1Fw82xE+VXhWUfeyJBmZxJPdK4rSdR9Hranl1o?=
 =?us-ascii?Q?wNxCAHcMMwAPPNVh3Rqk5qBDC0PwO0fPV7ZUlLveVhbWs5yvp5xa1Nmo5kq0?=
 =?us-ascii?Q?SJ6Ggk97v9BoAmH8FRaVDPKNA1/4IXmGyobFCkqINmOImcSbYnj5I1AlObIG?=
 =?us-ascii?Q?r7gxdf2xByv0o9pVuAfQyIV2r35RF6NZGBMnVqTvYPEuYEke7M83Uoqu3mzM?=
 =?us-ascii?Q?V4id0SVjy8U51VtoFeTZiBmba8Q1NwBeAtiQZiFk2qi6kbkSqK5e/rE7dshd?=
 =?us-ascii?Q?PXS7YYUeoxn340kJKRg+WI5JuIolVKsE01RZnS0PLPM/whQ6MwfG5Pw0M241?=
 =?us-ascii?Q?5HqDjP/DrfwydL/e7jvwmuJ4uP7OnSf6WdKrkOzzYvG//gysGlkPz0R7SDaZ?=
 =?us-ascii?Q?0PAahtHk0lrl2xZ//a6bvqzE6ILYESYOi1v56KVduYVp4xyw+aEux/cX8j/f?=
 =?us-ascii?Q?WgJ70BhuFpQ/kWG3uv6Dvn5oN2Sjtl1DYjE/H54u+bHA2Bw2/P5zurQEKzAP?=
 =?us-ascii?Q?l8kNOg43QrLg7klSgv1qLQ2KPabyMZHkbGO8N77IkSTChFQ5rzMjR2xDPcoW?=
 =?us-ascii?Q?ivd3Co/iq+K8NrbS6eM++wABfZlRHWHHmwacm33lbcy2swqGJANZ1IeK7xE1?=
 =?us-ascii?Q?3ImZI+kc4NvXw7sEuG1NnkJQd5hfmCXgYJra/93cO60AZcxxdI4YsQo1pVal?=
 =?us-ascii?Q?QrXkeeVTREbNGgHW/NAJgGn9uzRD5DN+c1f/Bskg0Sh6sCEAhSzmKlQnTZlX?=
 =?us-ascii?Q?OAECmO3OmAM/L1bQ119OehFWtcgt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LEYaEk+2usYmkdb4gvoL1kB8/phwtvDshSuAPFm0Wgs/yus9AVQJ8CMMlSP2?=
 =?us-ascii?Q?K/gUqhey4o0uFbUJctJitFRRFL0Ar1PTote1iJM/rO+FaQR+6YHgH63P0DsL?=
 =?us-ascii?Q?RxXTKLsbl4QIycSW1wR80f9HT4X9+/t/TbRKvF0N5bKQguI33Tjxx2EK5xcs?=
 =?us-ascii?Q?zxHkzhVCfX96CH57oTfcV7y1740fCH9ix9a8yUX1FgdDinKbeA6xnF5C0fiD?=
 =?us-ascii?Q?QRUeDPx83krc0Di2qdHzHPYenBX2b/B0UAFhuhR3KgaW0ZltDgibmSM7nAkw?=
 =?us-ascii?Q?MDU1oPGFhpWw6rHoS0Ue20At1uJSv4aYlEQZm8siU9GpI7qJcQJ/6N1bNfGA?=
 =?us-ascii?Q?70HwFpaRezh8jJJxFOs5HM+XBCZRvjq8/znhMyFl5QD54CUwqNFRM2XcOYwV?=
 =?us-ascii?Q?VF046Ql2HLFdsvgjrxFQMtQ66k2dpsfEYQ9maQo6UTMKFldsTSz6FnUwZmgj?=
 =?us-ascii?Q?8PsTF/I4bcEZbJ4PaJTNxMejrj8FefsJDuR3xz1mN7VC2ZsLF65QnEd2rvLp?=
 =?us-ascii?Q?3sGa6VxQgxw9KEsXE8R7zj10c6CYEV1gBs1Rp2AyHTaOKVAS97kD9V2coyRc?=
 =?us-ascii?Q?vNNcfwqnjIt4r04SBV9By7A0d8hL2nG18wY62BCYZufZKCP8pbr6JUBM42Tz?=
 =?us-ascii?Q?4hlfYhEeMDYigC09/qeWKPElfzmgQMJ10seOwKAa0EevsGcAAde+J1fY9/SL?=
 =?us-ascii?Q?cP5P2cdO7Tc8/1mmAffKF9aPu6GEsEmSDLZGecBStQFKZ8ezlQRxjJSLHfQG?=
 =?us-ascii?Q?43L+zf7U+SaRrZf8rIBc7BehtQhJN4kzmt/mkqqClSIK10b0M/2SZL1uq05D?=
 =?us-ascii?Q?CKnRKDfVkOQPVfOmHEeKcDgDIvPXA3u/JS3HaVcq8nnyWf/CgtzNiDIGyEpO?=
 =?us-ascii?Q?LFSF28MlLGHf5Kpdtr0C8ub7xUZq59WhPtnoZV5MumF3ryJHcxe4MBCQSXOb?=
 =?us-ascii?Q?U+y5OPya95IBQQu61J60C91lB+fL3ks4ZL6Ryk/oShyCdLd+gYzmihRQqyo8?=
 =?us-ascii?Q?iRAqKHPzIa1Gy8S/53ywvH4XgpBVlp1FEwUgU3/I6vy1iilRBqYsVWGP/1us?=
 =?us-ascii?Q?v2Li0x7ZD4b7uk72/CWqCz5CnTgY1NnQdfM/6B/Et0y9M5OE8ahHEIwx6LwP?=
 =?us-ascii?Q?ttl9xJkQk2OGH7U9hxt1pdtZGFWxmOnL94E/44v7LWp1pk+tHrvUNTmcJUrG?=
 =?us-ascii?Q?7RaWY4s0d+QbNYZr87tGumh4MERS6hUdOPSsOj2ZCJU0q3CnRh7iIWGPfhGW?=
 =?us-ascii?Q?QO1xl6THv0jM3Rz7n/nJJVEbxvY6zWO84mc5iNpyYSXDPtnku7fQR7EAFe94?=
 =?us-ascii?Q?efiXWgqoukHc30jV9qrtquYhiKsV1FzuwgmwfepnLJrYLcaCy7FnQBVuqFFb?=
 =?us-ascii?Q?YeQQU5RY50eOTJOY3WSnXy+I4h+/6HuqWMPEAm1WXprjo1bSCjjLJUDwgU4d?=
 =?us-ascii?Q?7Uz7NYagptBe2uvk4DWL3Wv9n7NXno/zbbc/UIdIe2griPARzoIxKPKDnpjH?=
 =?us-ascii?Q?Y8HDMH3eMOg1GuzjZe1wWag0MCYJqQ4Sg8DgwWAnAoJs2G0YtzCWo78HiJBr?=
 =?us-ascii?Q?5VPh5+iKFjOHyXffoM720aupUCK/An0fWJV2reOPJKsQOrc54OlDeVLv3Bev?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87268e17-6f6e-4aa6-86e8-08dd6d817ab1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 22:48:23.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cuQqXbGj32SOFOvBdgKp15xF5VCycnOWCPJhlPUBh6ktPS3e/soGqaQ1ppvocN9KWdzqAnNzHgUe3g3UzhqWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
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

On Fri, Mar 14, 2025 at 01:32:04PM +0530, Himal Prasad Ghimiray wrote:
> Add a flag in xe_vma_ops to determine whether it has svm prefetch ops or
> not.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 1 +
>  drivers/gpu/drm/xe/xe_vm_types.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 53a80c0af8de..b83154d338c7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3215,6 +3215,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
>  	vops->q = q;
>  	vops->syncs = syncs;
>  	vops->num_syncs = num_syncs;
> +	vops->flags = false;

s/false/0 - I this static checkers will complain about this.

Matt

>  }
>  
>  static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 93224a87ab03..0b02a37bd2f3 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -443,6 +443,9 @@ struct xe_vma_ops {
>  	u32 num_syncs;
>  	/** @pt_update_ops: page table update operations */
>  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> +	/** @flag: signify the properties within xe_vma_ops*/
> +#define XE_VMA_OPS_HAS_SVM_PREFETCH BIT(0)
> +	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
>  	bool inject_error;
> -- 
> 2.34.1
> 
