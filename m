Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37265C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61D010E0A9;
	Fri, 29 Dec 2023 21:07:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F7210E0A9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884042; x=1735420042;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YXPr01zq1iB8GAcnAf5BZ8oYlF22kM5neWtTlv/ANzI=;
 b=Ve0DKqkZlwcpXhZ94iH+MIgsilXIPipLXDQLbSGaVhThLjH6IABKbXVc
 mNrcIn3tJeEA1Ub7t2GzOH5i4Qb2aH+/ZlNMQGZekPhG4me3np4yr6Eyr
 kOhyhJ2m03clUG9nAgh5rdYUM3PaZrMRC7Cgh+zGuNntESrLR0dujDkNO
 NHqanKNKlgq9zeu+Pq6rS1cOjYay0ILzCXCeCDMLEgo4TY1sirn9pn88T
 WpfAesC1B601yWhnYaWBRsgE79a/bxPw1LiyvohdqMbVmzzA8wIulyDtK
 3Phl2PHLJBwNWWSVuEpmnL7zTIezM2glBoNJtvs6t0NxB0jxJbelWa8m6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3758641"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="3758641"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:07:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="844783447"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="844783447"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:07:20 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:07:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:07:20 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:07:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUrz7RamZxNISSN3CP1eIsj3yh28pD70Di0/pdp4K8eQWiqFib9HdjwimM8Mx2B7qcdGcxjOBDXC32Mp1eUKT74j25+s1D5mGh6jbqZPoMurHgAlt1eRvTHz7gW2m3tg1kqvToLerVrg2FwWCbdNbcTHyqlMztR9bNHIVgx8m/o+icfiqcVDciIyVwV1XisT0RkVmSFZnb+eHsdGrKNjin4y326EKLCPeU/FSw8IrbvEBYZRvwzQWvt6xrbsIGco7Rlv4o/B6KUQqd9c6IqUBrlZ5iGYpdKAjKlFy2NKcOxuICXSr3Pm+498k/7YZUc35SLxPjO5qxrQxlCVGz3KPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgnT+gvCQZPjQAghEgMpTjLOWC9f+fkjeBS0yWkHTW4=;
 b=HF8vj0oHjT0Wt1et8jq3+XtQpNeAT9+eNEdpQ4Sidk95u67TRhx/R0J90uIjwSEK2DRsn6Us3B/p3rAPxXsSMvJwBHAE8T2SAp8DzULqVQJvt2hQrs4mVeIOmTn4Rkqqox6cBpbNxF00+yvdsMVGeB43MlN2pyVhuXRWLU6tYPa8KReY6pD8KajLmn+2S8u/GpXqF2mkcO1Wpg7IphajoVIVfkZRybiTle1TEzM3rwdNPaeH4kJJHIzMQ2AITzva45J7n9mn0vR381OAsKYMGAUokSe43XgaxF6cmX9sXgNVC68xdcn1a/FcQTTEmAIkLZISff7OztzRTgqcV9lA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 21:07:18 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:07:18 +0000
Date: Fri, 29 Dec 2023 22:07:16 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 02/10] drm/xe: Define Virtual Function Identifier
Message-ID: <20231229210716.f7h2f5gptzfudxxc@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR4P281CA0426.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd3db28-0dc7-4c98-c6e5-08dc08b2240b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rO+IcZdRx/Kk3wgLENC0kqaIvAzj9B6FGc74J/mPQvMs/7dcsuCq07swO6lJPy2uYrzpJmeMAc/POrMq2vSTmFmi45wRJmECJ7ljnSuFtYkF3YoHxMyogzlfjgB0hbTGJY7FcNTFzzs0DIdE8iqjpHvWX5PACQeglnMc+7Rex929cgC4om1b63BgXyMWkh+gB/vMwcBBnujkcCrgv5KgHoq+wcR8Q9isa8LDshC4OSurxLeMOa/3eWidjCxeYgIA6nTUHXOv5LcTvwyguFdjx6z4xxBW2VLfBswXmV7xdQdAsaQ7+pfLXrKemBLyIOhwmyi9yZT6Jt6h0fmKBGEbSNbPxqLOofjOpy6CJHTdR8FLirXJmdZOxYBFcZ3NTzSBvOlPowg9sfxVt/7gGTxfVhwRHkz0NAQBquhSDfc82ira/2gmb8AmIcY0mp06WA0xvQJcSnkBM0w57ZMjWJpddjqIpzx/62Xusnmr+aBa8t5vDrrh4wUq+doWytZdmZuxEoPBsDFLrmg+K1kCAAu5wp4oahyltZa82nx/qqW+9fyskCt06FcaY4ObzyxgLiZQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6512007)(6506007)(5660300002)(6862004)(8676002)(8936002)(4326008)(2906002)(37006003)(6636002)(66476007)(66946007)(316002)(66556008)(6486002)(478600001)(38100700002)(41300700001)(86362001)(82960400001)(36756003)(1076003)(2616005)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzNjdnI5d1lJOVVteGx5cmI5TThmNUV6emlHSVJzOEhEcFYyMmFmSEpzL3Mx?=
 =?utf-8?B?WDJBQWF2M05scC9vV1dsVmRmU3NjUCtNeU9OTWtQNk9obEFjNE0zd1IvMG9H?=
 =?utf-8?B?SjlDQkZybngyR2xjd2RKQm4ra1gzWGVQbHJvclBaWmVkbEtFSDZ3OVlvY25X?=
 =?utf-8?B?RDVRN3lNazBRRENYVFAzZFZQUUxielJNaVByaDl2Ni9MdUE3UnFZbVM3RXhR?=
 =?utf-8?B?YTlQYXk1c2s1ODJ2cVNjOTJ6RnZpZlRuS0dISWxEeDIxRWVSN2lURVVCU0xV?=
 =?utf-8?B?TFo1N1NGaVlZQ3dNMWo2NlJmdlQxSTI3RnB6TVpLNWVrY3lXN1JCc29VM0Vu?=
 =?utf-8?B?TlBlMFprZWZlVWhaYnh6UW1EdnRsZGNEemxjUGhLb1JpbjRRY1ZqcW12S2F5?=
 =?utf-8?B?QVFwTzVCTUFBTzlBMHVkMFdqNE5ScXlXRTR5U1N6RnFQR2xKVThyd0wya25K?=
 =?utf-8?B?QVFRQUpML0duWHNsSlB5TG8rNHQzNTdvWVpvVHlrbjZ6YXhsU0VXOW1IVm5H?=
 =?utf-8?B?WW5mYmZveHd0akhMc1BRaVFtUjdMemEwVVQyZGNlUFlkQ2ZQT0NpTXZrK3Vw?=
 =?utf-8?B?VGNoQll5cU9SeWxIKzUyWGp6eFFDWlk4U2FSQXdnZTZjdTVvVVNkdGM5MXlK?=
 =?utf-8?B?SXdDT2EvTFRqZW1EbjRLbThycUFXYk0yd3hNVUhvcktWWGpCY2crSWZPQkhX?=
 =?utf-8?B?cEl4aTVEczQvdWhMRklzbWJxYkMwV0Z3a3Eva3kyTXBSL2ZLbTFnYTFWeE9C?=
 =?utf-8?B?enN1SVlkUjhjbE84L2ZwdUo4dDVQRVVWYURYTVM3YkV1UWRvaVhLUW5vdGEy?=
 =?utf-8?B?VnFPZjM4ZjZ3dnRseHl6cEI1NVloWE9yS3VVWktYcS9jc0U4V01QZFo2VjdP?=
 =?utf-8?B?dXlkdHNHZWc5aWJHWWJMOU9tUVZWd3FmUjhoakhEUGJQMjFhcFk2c0pGSG40?=
 =?utf-8?B?UDFwRkk5eWVxN1ByU0tmY3d1THdvTUQ5bHNsSjlHMS9hL3hXelVxWXFTaTBl?=
 =?utf-8?B?YTVLY0U0WWV4WG5TS1lpTCtVUkljYUk5MmxZY1NLUFpoNElzeXg4TDFKWkNT?=
 =?utf-8?B?aFlNckU5S1dvWlQ3d0JTZ3hHODljNU9tN2tQUEhNaWFSNk9JM2NlUVVEN0Nj?=
 =?utf-8?B?ZFZIc1JzL2xOTmFEcVYyTStGUWJocnRTbHNJZkx1RXZQUjVmNGZzVGswcmxY?=
 =?utf-8?B?K0RtY2h2eUJrblBzbHUySUNubStyazk4VVVCTVJteHlYTlBvQVFqMHRkS2RY?=
 =?utf-8?B?aFg1a0FVc1FpTW5QV3ZveEwvQ0VmbXVRRGw2TE9teUgwWkNaOHZIV1ZIYnZm?=
 =?utf-8?B?TlYyek12b2duUlZHQXZkbi92V3JhUHE4T1k0TGN3QURHUzc1V0EyUngyMlJn?=
 =?utf-8?B?NlhVamFadGcveC84MEViSFJCRjVkUjZoN05GRzVMbkFsc1VQZVhrbjRPYUY4?=
 =?utf-8?B?TWRhT2NVc1pzeE1zSHhxRGxlTDFoRkx5N1NFdWxXRVZlLzhEK2p1YmhRaU0r?=
 =?utf-8?B?aTZ5SCsvbktoM2xNcjF2WXpGRnJIRGhNeXBwT3ZRcUVIVFlNN0ZZT0VxT2VT?=
 =?utf-8?B?RFo4R283V3lMYW9yV0gwajkxa3VTYk9jbWJzUWdZMEpaNFFnay9xdDU0cVBt?=
 =?utf-8?B?VU90UlNyQkh4eTdvam42RW1POVh3c1VaU0VNcHRKQ2dkVFQ5L01qTkQyMWtS?=
 =?utf-8?B?YXBPY2xkTzN5ZGlLQkYwc0tFSDNqbmVxQk1zd29ndHFMTjJ0djRlcWw5MW9X?=
 =?utf-8?B?aFFoVk9TQ1hwOFNKbnZVV2lOQThsbUQ3bVpkaGluaWJhL3RMVHRRQlN4Zm54?=
 =?utf-8?B?aUlDWGlxUWRadjArb1IvN1lEcUdla1IrNlFxK2ZQTHgrMGxjcTJBVVJySCt2?=
 =?utf-8?B?SVl2K1I1Y3ovdno5ZXo3SkUrNU5VUHB0WnpEQ2JEYjBxMS9CNFhmYlc0VllR?=
 =?utf-8?B?VzM1VzZRM2kxaC8xcU5RZCt4QWZlQm5KeVFYS28xNndJd1cwcVFWREI2Q0JZ?=
 =?utf-8?B?eU9MRG5XSFk5RGpLNkRzbmtoYU5peGphaEVtSE1Lb3VaYmY3UndwbXJ3Q2o2?=
 =?utf-8?B?VjNvL0NOYWtZMS9kTUt1aHFCQ21IMmtKdlQzSUQ4Y0lIeTNnbTdGN25lRGFy?=
 =?utf-8?B?TndjY0h0dUpaT2poRGdsM1M0SVpLSHgxY1plZlVsMllIZ0l1UXJ5RkRXR0VS?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd3db28-0dc7-4c98-c6e5-08dc08b2240b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:07:18.2606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1nwl5SYvOU8971Rf2PcFmedhJPP52y1ncVro/lNNLEIhDlSOuVNoyGaL4bXT/beehytoZFwaACJBNRFgzDdyNF9jdtKRMBrVvmHusmVEyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:30 +0100]:
> According to the PCI Express specification, the SR-IOV Virtual
> Functions (VFs) are numbered starting with 1 (VF1, VF2, ...).
> Additionally, both driver and GuC will refer to Physical Function
> (PF) as VF0. Define helper macro to represent VFn and PF.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_types.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index 999a4311b98b..fbeebdb12166 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -8,6 +8,18 @@
>  
>  #include <linux/build_bug.h>
>  
> +/**
> + * VFID - Virtual Function Identifier
> + * @n: VF number
> + *
> + * Helper macro to represent Virtual Function (VF) Indentifier.

typo

> + * VFID(0) is used as alias to the PFID that represents Physical Function.
> + *
> + * Note: According to PCI spec, SR-IOV VF's numbers are 1-based (VF1, VF2, ...).
> + */
> +#define VFID(n)		(n)
> +#define PFID		VFID(0)
> +
>  /**
>   * enum xe_sriov_mode - SR-IOV mode
>   * @XE_SRIOV_MODE_NONE: bare-metal mode (non-virtualized)

One typo to fix:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.25.1
> 

-- 
