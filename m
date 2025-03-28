Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128C8C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 03:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E82B10E972;
	Fri, 28 Mar 2025 03:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyT8TcbM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D2B10E972
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 03:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743133127; x=1774669127;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+mYxzmSJkV+9BjJPC1sfqwzKzaeXXSr4Yof49+BvBcc=;
 b=HyT8TcbMPE+zZ+1GR5/XDCThKLMIBCWQBEcZeORSyBGgRXkpsoUA0Duq
 qYC3e78t+FFVdP+6q2vzRkz9yGVM3u6VLjH+GUbeCXh7rNbJerJfYsRLC
 XONHmAfqLORSKmz1mBA3Z8aBjrJxilARXqN5HRshYTLCqbVPfxu5ZavaJ
 ZZmYIm8Ah28rR+cH6oIdAKz/jClTyLsyvcjez5dTbJPQ/hdRyPd29Ptpe
 yvxZ/ZhnMyv+nv/vY9eKWG3TcsnrbNlgMhRemhBmaWdh8C1MSEz8NL5fJ
 kDmKPAusZb00VWdcf+Q0qGZvSl17Ec7qUM75ZGDamAT2X0bZ/JJFioUSR Q==;
X-CSE-ConnectionGUID: cR2RcviRRfKnu+qkjpfxkg==
X-CSE-MsgGUID: go9Ukr+STSqRfUvmCZ9aiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48269936"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="48269936"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:38:46 -0700
X-CSE-ConnectionGUID: +u7aXazKRAmea639jwq13w==
X-CSE-MsgGUID: erAcqrW0R0SRB5JlmivmUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125083776"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:38:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 20:38:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 20:38:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 20:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVeDZLMCBOAj/l3+EF0jrlEcFzPURLBemWWrrmi85K3h9AN089VIQzmfy1KZuCI7XKu/YcX5fayC1Zr1u87qvTFHp4MlwimkxEcK12b4SBAt9hAh8rcyj505cYRH+wStdEqhrjDqjISogbYaqdGL+mWzx19TpnBqbruRosF0MJweGB4I2MB+mHiwdc5xb+e8UnNXnoi4wz7kyntILNh44xI8GA55jIjNFmpxZ6EqtQ+pcAI/uiU49H7J1IjoWOChlrdkoIk/t60TiAYIPkEn7H66tLAYzTaWm13dpP1HL+EPZiFZAxqFELP/bMq5GniP4uphNDa+32+2sl1lOV52gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVAmFZeY0dG/LHb92QTlAN5eSA3VWjDFkUR8Y48BQXI=;
 b=d1HNvbyJbOBDu8T8D8SgTVHIMsCoJS4FBGtb6GNCpuP02hN/GT1EC98zKihO+ZynukTlG1wCOcLC+P9mcGTaJxqtUwLx7OPfM/u9g4xxgdNzEycRm+e2ez5zGIykhZj4T7YQTmmEKCbiYKISfa5fWrPsyT3E89VCmWR55vk/mMEOWnDx4XCmbZZEHbgZu8JdROV/lStNf3yx4j1a4o6m72n3DPaOzUY3ImxjCm7wY6rqqMOA6PoO3UpQgr0XnVYXWoU1D2REX+v6AlzcpvPpTUfVwHe5eotUrohoc6G5QfzmgTCPQmiTxKOkSkeKhDNHu2uvmHALpEvUaIKQ0XHyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5891.namprd11.prod.outlook.com (2603:10b6:303:169::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 03:38:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 03:38:41 +0000
Date: Thu, 27 Mar 2025 20:39:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Add LFD format output for guc log
Message-ID: <Z+YaCmivtd1Wa9wU@lstrano-desk.jf.intel.com>
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
 <20250327234028.249314-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327234028.249314-2-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW4PR04CA0235.namprd04.prod.outlook.com
 (2603:10b6:303:87::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a91807-a46c-49a4-e2f4-08dd6daa08b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NWmmm2noQ+o85jh75MGOeI6FioCatVr4rdk0/ovqsSNrgdUriLLqg/keLP?=
 =?iso-8859-1?Q?h7lSepICWCBmcWtt2tyaxRfRWoQs9eLWVztPnLvovPssN4wcJPKYWLOgL5?=
 =?iso-8859-1?Q?qDbg7/ThkSR3+J+WjA9uhxFHSFJ7574qhSC2+hsoH+mhkrCsfwf+zvNGYe?=
 =?iso-8859-1?Q?5uGLeCWTijLe7Eqll6FhhjzewWnSEg8JmFqK6FlgtHSgFC8/okD/VCNzhD?=
 =?iso-8859-1?Q?1GYyasJZ4IJjOWZpTYkc/43lt97IW5TWgjZTOnTHp1OEnV8T/I4V9yAgv3?=
 =?iso-8859-1?Q?xex76Nq9Ew5mQ4fSERFzFCmLKRRvu0XbvS6/ej0DqSl0jGtI6P+GJgSxwu?=
 =?iso-8859-1?Q?9Gm10CKJc0+zHWnt+wSpSdIlx6VlvAdlQNqoAScGFkT1lJ4CMF6aYvcMj0?=
 =?iso-8859-1?Q?pl6amirw1uExaVsFd4YXPjYYWd3SW9xe2jr8TaqDpeZ+H7goPfnBmH6BGu?=
 =?iso-8859-1?Q?I++XNH+NaN0D364Cr0H4agwPhoHsTkRj/6XVrVVjvSsctwNmA8IJBnFUe9?=
 =?iso-8859-1?Q?xmUP74Nor4CL0tMqD2DAYttp7G+dqzSK8oarz4o5cFwSf1KV1th8+pyFGD?=
 =?iso-8859-1?Q?m+klPkBrzk0NKyhR9c9tMHiX8bZIhAIsTasCUGpaHe7aqmq9sZlujNfqdA?=
 =?iso-8859-1?Q?8sTK9+kM0LBwF2gY3ylQkoNT56VQ0JJnz73uh5p39AKCOj03UYbbsODTKf?=
 =?iso-8859-1?Q?VxPSN1Lr9Rv9vydG2cENCCuY2Ckg+wzTkzaSTc/FsKs9xrgHs6SFUtsBep?=
 =?iso-8859-1?Q?KYwEL1cOK7vjsummMoHF1TA9hraofT/2Yismjne2aVUYGGhOjFE40Gy1my?=
 =?iso-8859-1?Q?ysg3rWfKPqnRUkq5gbT742sAKTW/paqjtR3YNkIfJ/RhTr9k3RxHKv53v5?=
 =?iso-8859-1?Q?Glnc4b7pyMMnpBY41jpnda867XXSEFIXRPS2M9DQ02R8fmY+zq5/eLQaas?=
 =?iso-8859-1?Q?jnXhfOO6mHeMkJK/ZtykDTlSJeikzRxgozIraPGZmwEPthtJAmLwdgr953?=
 =?iso-8859-1?Q?rsB301KBlPOFoizBXOaVUQLMkVpjaaFjZN6ZRUVIgkZAgq4yW2pFGKdGnH?=
 =?iso-8859-1?Q?dejs+gmmj9gZr9ir3YOeegu+f+2w13GQ0BFmKlzXtjUS2pCTw/wLpxyd+M?=
 =?iso-8859-1?Q?Js9B31hpImSD3oD7OfTAIG1pfpePSlwsLyPkl1MTvuO+0VjgkW5MQI9SlV?=
 =?iso-8859-1?Q?ooImzIQepW1Ldzb6006AQnD5hoPkGw+PfGcLA2ELwUZQHkMpdmBjl23+5N?=
 =?iso-8859-1?Q?in10ImA1huwGCTgCWRXCFMPqwbIS8PhJGODiXqKI2Mc02EiBEjRfc9uH9v?=
 =?iso-8859-1?Q?5O5NhHpiCp3WJ6ly+gJlGJsOTd5rrUBF9M1YfI/t4bdGzSczBSkOBAkBaP?=
 =?iso-8859-1?Q?7AIqBQhf/poF4PdQKoxCdhN06aN/o602eMdT7vX82T4KZ1YHjqLIjG5pqu?=
 =?iso-8859-1?Q?cwMDdB96OMdq6v2M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7r6ixrRcHpQvp4reNwUpMUCyrTt71h8hSm6xAR3BAMaoOPgpZEvxvwBWis?=
 =?iso-8859-1?Q?DFG4lYUgKxDNCv98/J9+HE3fSmqqBNsguaAgpL2W6GFDgHjKDUngRkYdGs?=
 =?iso-8859-1?Q?hJ3Q7c+dWErNZujnVPZoFg8ESJuUNQafo3VRlBm5WLSUQtA1JTEogmmquu?=
 =?iso-8859-1?Q?TQB6PUOxv0NmZ2pJS/Zb7mjVw59AUHjl0XJjL3bso70XERnh5jJ316x56W?=
 =?iso-8859-1?Q?T92iH/qypQskv5+lc3JhNNw9wyv2i48Iq+KUS8nGQdrne9JE3i1Kw8hC7X?=
 =?iso-8859-1?Q?D7kEaBYBBM4ibfeYrE/w1OrX2cAOkeIe2kFjQopKGyENGPaKGC8Bwj48s1?=
 =?iso-8859-1?Q?lx6vAGQvlQVeznd+/miX28UcTE+5bAU+XMXmp2IxvIPE4NODSYO7hXOk2f?=
 =?iso-8859-1?Q?jDDupcPq5RaVAYq/IJiq2jv58RY2p1H4WgE79v9X8f8zMvH1KjFux9wjTW?=
 =?iso-8859-1?Q?Ho6El/i8HUBQLPB7rJcRSiz851DEWu0CzC6e+306We1DjnZfBEwZbSPtJ8?=
 =?iso-8859-1?Q?rPsKFfxR4bsOr+HhOO6eJ6q83Ha2Z820ZkqjpJymnkxT+VmCrbVZZ8qQfB?=
 =?iso-8859-1?Q?3yOeId3oYFT7QcCMnLr0mZ/0jxhEdUNnfh+A59nVSN7UGYhscPb5grci9e?=
 =?iso-8859-1?Q?TmhTACNMl7tkzLZBa037wx71CwD3g4tlyZF6sbXfI5eAOeUxSQeOq1Zybe?=
 =?iso-8859-1?Q?sN6MVys48yyuBKzexV1LSdaH7aK6gG+6xykxczD3QyetRr4xQFaGJCfvL/?=
 =?iso-8859-1?Q?/Ual8F3a44nGPyPicAJjGQaQIA7JvtkqO22SWaET2vKYVxNiIxBYqg00nl?=
 =?iso-8859-1?Q?xsZ2qpNE3xCEYR7uRH5x+NeqPuLG16scCVLFuNujujhCwaECTgYOIdehBO?=
 =?iso-8859-1?Q?QsWX/i1fYH/iZBHSkhl1yqIPjGVlz5HV9b3JUGGzTqzWB1HMtI1T3iP2qy?=
 =?iso-8859-1?Q?EXWSZ3zNp55XKs5Z9hYDLgU6tU/2K9a4u9bN/b7aPMxUriVcrWdBAtiBrE?=
 =?iso-8859-1?Q?Nvy3sU5L+4StQlvY2PleKoSFhKe2qn2v8/G3Ekh7EWTHGEtY2Mz5sRxpzn?=
 =?iso-8859-1?Q?PoO6lkn/ccXNoc+D4k6I7kcHW+I8H4AqIDYn2rcF2RDDdymFBUD1Zl3JXu?=
 =?iso-8859-1?Q?0zFWacLENgoV+V/I8XsGZB4cZpRjlFtys3VttWjoxIyatimDb620L2LEIU?=
 =?iso-8859-1?Q?tBIv36OArLhMAVigXVoVr2Tzp7ueRZfK1WOuqiZJx1cuHjhJyDH/D/Wd60?=
 =?iso-8859-1?Q?UW0sIgI1ToVM4LFANoWQjOupIRngdJXEIDcOZaIoPSzDreVBRznIeoH5b4?=
 =?iso-8859-1?Q?pAicY6z0u9KpJF0AsvOnXzpzmPqPiVOymsqkuMX4hYBigBaqTd/33ZX5W3?=
 =?iso-8859-1?Q?gjmKNf37+rjPpedKM1TuDbrtMGHApfNlAz88QeAjfTOCklcEouEqZKDU+X?=
 =?iso-8859-1?Q?fJp5xw1lmoSj2QW0B7PZ0uIxns7wV/0fREq6tV35jnfONQZxSIIkuH1zIi?=
 =?iso-8859-1?Q?h7VcMXiBDbPg5QduddcQEXLi8jWFSiETNhwBbeBeu9J1/BZPTPf7GLPCya?=
 =?iso-8859-1?Q?mxf8HO2rJfpYt4aD0yCyEe4noysE+mz538udRJSqVmAs3eDapI1wPtAm0l?=
 =?iso-8859-1?Q?tP279l193n1Jq02Ho+inXlYlMywqYGIbYyrKW5ArZGFEWWCAwELj3WxQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a91807-a46c-49a4-e2f4-08dd6daa08b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 03:38:41.6377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ey78nh0JbKuylNn/meJvHfFdYcJqK+SOzy3nrTIMHihGmXrWDB3O3iBT7a08l+Ls80Zj4YUbnyKksiXj1wuDew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5891
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

On Thu, Mar 27, 2025 at 04:40:27PM -0700, Zhanjun Dong wrote:
> Add new debugfs entry "guc_log_lfd", which supports output guc log
> in LFD(Log Format Descriptors) format.
> 

Not a full review - but couple of drive by comments.

I suggest trying to split this patch into a series of smaller ones if
possible. 756 loc is lot for a single patch. Off the top of my head...

- ABI patches
- New GuC patch
- New debugfs entry patch

> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h     | 112 +++++++
>  drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 261 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_debugfs.c      |  14 +
>  drivers/gpu/drm/xe/xe_guc_log.c          | 368 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.h          |   1 +
>  5 files changed, 756 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> index 554630b7ccd9..50b697e44c42 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -17,6 +17,118 @@ enum guc_log_buffer_type {
>  
>  #define GUC_LOG_BUFFER_TYPE_MAX		3
>  
> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
> +
> +#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
> +
> +/** Log Init Config KLV IDs. */
> +enum guc_log_lic_type_t {

'_t' suffix isn't used in the Xe style as typically is used for typedefs
which are frowned upon in upstream Linux. I'd drop "_t" suffix
everywhere.

> +	/**
> +	 * GuC firmware version. Value is a 32 bit number represented by
> +	 * guc_sw_version_t.
> +	 */
> +	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
> +	/**
> +	 * GuC device id. Value is a 32 bit. Refer BSpec symbol
> +	 * GUC_DEVICEID
> +	 */
> +	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
> +	/**
> +	 * GuC timestamp counter frequency. Value is a 32 bit number
> +	 * representing frequency in kilohertz. This timestamp is utilized
> +	 * in log entries, timer and for engine utilization tracking.
> +	 */
> +	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
> +	/**
> +	 * HW GMD ID. Value is a 32 bit number representing graphics,
> +	 * media and display HW architecture IDs.
> +	 */
> +	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
> +	/** GuC build platform ID. Value is 32 bits. */
> +	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
> +};
> +
> +#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
> +#define GUC_LOG_LIC_TYPE_LAST	(GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID + 1)
> +
> +/** struct guc_klv_generic_t - KLV with multiple DWs in an array */
> +struct guc_klv_generic_t {
> +	/** @length: Length in Dwords of data. */
> +	u16		length;
> +	/** @key: Key value */
> +	u16		key;
> +	/** @value: Value for this key */
> +	u32		value[];
> +} __packed;
> +
> +/**
> + * struct guc_sw_version_t - This structure describes the full version of
> + * a software component.
> + */
> +struct guc_sw_version_t {
> +	/** @patch_version: BR[7:0] Patch version */
> +	u32		patch_version : 8;
> +	/** @minor_version: BR[15:8] Minor version */
> +	u32		minor_version : 8;
> +	/** @major_version: BR[23:16] Major version */
> +	u32		major_version : 8;
> +	/** @branch_id: BR[31:24] Branch ID */
> +	u32		branch_id : 8;

This needs to be defines if this corresponds to a hardware interface.
Based on CPU compiler target endians, the bits can get flipped around.

> +} __packed;
> +
> +/**
> + * struct guc_lic_format_version_t - Log Init Config Structure Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_lic_format_version_t {
> +	/**
> +	 * @minor_version: BR[15:0] Log-Init-Config structure minor
> +	 * version. Must be GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
> +	 */
> +	u32		minor_version : 16;
> +	/**
> +	 * @major_version: BR[31:16] Log-Init-Config structure major
> +	 * version. Must be GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
> +	 */
> +	u32		major_version : 16;

Same here.

> +} __packed;
> +
> +/**
> + * struct guc_log_init_config_t - GuC Log-Init-Config structure.
> + * This is populated by the GUC at log init time and is located in the log
> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
> + * buffer states plus this structure must not exceed 4KB
> + */
> +struct guc_log_init_config_t {
> +	/**
> +	 * @lic_magic: A magic number set by GuC to identify that this
> +	 * structure contains valid information: lic_magic = 0x8086900D.
> +	 * Used to verify the information in this structure is valid.
> +	 */
> +	u32		lic_magic;
> +	/**
> +	 * @lic_ver: The version of the this structure. Detail description
> +	 * is guc_lic_format_version_t
> +	 */
> +	struct guc_lic_format_version_t	lic_ver;
> +	/** @lic_dw_size: Number of Dws the `lic_data` array contains. */
> +	u32		lic_dw_size;
> +	/**
> +	 * @lic_data: Array of dwords representing a list of LIC KLVs of
> +	 * type guc_klv_generic_t with keys represented by
> +	 * guc_log_lic_type_t
> +	 */
> +	u32		lic_data[];

You can use __counted_by(lic_dw_size) for some additional checking.

> +} __packed;
> +
>  /**
>   * struct guc_log_buffer_state - GuC log buffer state
>   *
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
> new file mode 100644
> index 000000000000..8aaacab244cb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
> @@ -0,0 +1,261 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LOG_LFD_ABI_H_
> +#define _ABI_GUC_LOG_LFD_ABI_H_
> +
> +#include <linux/types.h>
> +
> +#include "abi/guc_log_abi.h"
> +
> +/* Magic keys define */
> +#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
> +#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
> +#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD
> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
> +#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
> +
> +#define GUC_LOGFILE_LFD_MAGIC	upper_16_bits(LFD_CRASH_DUMP_BUFFER_MARKER_2)
> +
> +/** The current major version of GuC-Log-File format. */
> +#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
> +/** The current minor version of GuC-Log-File format. */
> +#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
> +
> +/** Log format descriptor type */
> +enum guc_lfd_type_t {
> +	/** Start of range for required LFDs from GuC */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
> +	/**
> +	 * GuC Firmware Version structure. LFDs payload is
> +	 * guc_lfd_data_fw_version_t
> +	 */
> +	GUC_LFD_TYPE_FW_VERSION = 0x1,
> +	/**
> +	 * GuC microcontroller device ID. LFDs payload is
> +	 * guc_lfd_data_guc_devid_t
> +	 */
> +	GUC_LFD_TYPE_GUC_DEVICE_ID = 0x2,
> +	/**
> +	 * Frequency of GuC timestamps. LFDs payload is
> +	 * guc_lfd_data_tsc_freq_t
> +	 */
> +	GUC_LFD_TYPE_TSC_FREQUENCY = 0x3,
> +	/** HW GMD ID. LFDs payload is guc_lfd_data_gmdid_t */
> +	GUC_LFD_TYPE_GMD_ID = 0x4,
> +	/**
> +	 * GuC build platform ID. LFDs payload is
> +	 * guc_lfd_data_build_platformid_t
> +	 */
> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = 0x5,
> +	/** End of this range */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
> +	/** Start of range for required LFDs from GuC */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
> +	/**
> +	 * Log-event-entries buffer. LFDs payload is
> +	 * guc_lfd_data_log_events_buf_t
> +	 */
> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
> +	/**
> +	 * GuC generated crash-dump blob. LFDs payload is
> +	 * guc_lfd_data_fw_crashdump_t
> +	 */
> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
> +	/** End of this range */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
> +	/** Start of range for required KMD LFDs */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
> +	/**
> +	 * An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t
> +	 */
> +	GUC_LFD_TYPE_OS_ID = 0x4000,
> +	/** End of this range */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
> +	/** Start of range for optional KMD LFDs */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
> +	/**
> +	 * Binary representation of GuC log-events schema. LFDs TLV
> +	 * payload is guc_lfd_data_binary_schema_t
> +	 */
> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
> +	/**
> +	 * ASCII string containing comments from the host/KMD. LFDs TLV
> +	 * payload is guc_lfd_data_host_comment_t
> +	 */
> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
> +	/** End of this range */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
> +	/** Start of reserved range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
> +	/** End of this range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
> +};
> +
> +/** OS Type LFD-ID */
> +enum guc_lfd_os_type_t {
> +	/** Windows OS */
> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
> +	/** Linux OS */
> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
> +	/** VMWare OS */
> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
> +	/** Other */
> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
> +};
> +
> +/**
> + * struct guc_logfile_lfd_t - Log format descriptor (LFD).
> + * A type of KLV with custom field-sizes + magic numbers.
> + */
> +struct guc_logfile_lfd_t {
> +	/**
> +	 * @magic: BR[15:0] Expected value: 0x8086. Helpful in detecting
> +	 * file errors.
> +	 */
> +	u32		magic : 16;
> +	/**
> +	 * @desc_type: BR[31:16] File descriptor type (the 'T' in TLV) is
> +	 * used to identify how to interpret `data` below. For the range
> +	 * of types, see guc_lfd_type_t
> +	 */
> +	u32		desc_type : 16;

Defines as above if this is hardware interface.

> +	/** @desc_dw_size: Number of dwords the `data` field contains. */
> +	u32		desc_dw_size;
> +	/** @data: Data defined by File descriptor type. */
> +	u32		data[];

__counted_by(desc_dw_size);

> +} __packed;
> +
> +/**
> + * struct guc_logfile_fmt_ver_t - GuC Log File Format Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_logfile_fmt_ver_t {
> +	/**
> +	 * @minor_version: BR[15:0] Guc-Log-File Format minor version.
> +	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MINOR
> +	 */
> +	u32		minor_version : 16;
> +	/**
> +	 * @major_version: BR[31:16] Guc-Log-File Format major version.
> +	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MAJOR
> +	 */
> +	u32		major_version : 16;

Defines as above if this is hardware interface.

> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_guc_devid_t - GuC Device ID.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_guc_devid_t {
> +	/**
> +	 * @guc_devid: GuC microcontroller device ID defined as described
> +	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
> +	 */
> +	u32		guc_devid;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_tsc_freq_t - GuC TSC Fequency.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_tsc_freq_t {
> +	/**
> +	 * @tsc_freq: GuC timestamp counter frequency as described in
> +	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
> +	 */
> +	u32		tsc_freq;
> +} __packed;
> +
> +/** struct guc_lfd_data_gmdid_t - GMD ID. */
> +struct guc_lfd_data_gmdid_t {
> +	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
> +	u32		gmd_id;
> +} __packed;
> +
> +/** struct guc_lfd_data_build_platformid_t - GuC build platform ID. */
> +struct guc_lfd_data_build_platformid_t {
> +	/**
> +	 * @platform_build_id: GuC build platform ID as described in
> +	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
> +	 */
> +	u32		platform_build_id;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_log_events_buf_t - GuC Log Events Buffer.
> + * This is optional fw LFD data
> + */
> +struct guc_lfd_data_log_events_buf_t {
> +	/**
> +	 * @log_events_format_version: version of GuC log format of buffer
> +	 */
> +	u32		log_events_format_version;
> +	/**
> +	 * @log_format_buf: If `log_format_version` == 1, array of
> +	 * guc_log_format_version_1_t. If `log_format_version` == 2, array
> +	 * of guc_log_format_version_2_t. Dword size determined by
> +	 * guc_logfile_lfd_t.`desc_dw_size` - 1
> +	 */
> +	u32		log_format_buf[];
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_os_id_t - OS Version Information.
> + * This is mandatory host LFD data
> + */
> +struct guc_lfd_data_os_id_t {
> +	/**
> +	 * @os_id: enum values to identify the OS brand (1=Windows,
> +	 * 2=Linux, etc..). See guc_lfd_os_type_t for the range of types
> +	 */
> +	u32		os_id;
> +	/**
> +	 * @build_version: ASCII string containing OS build version
> +	 * information based on os_id. String is padded with null
> +	 * characters to ensure its DWORD aligned. Dword size determined
> +	 * by guc_logfile_lfd_t.`desc_dw_size` - 1
> +	 */
> +	char		build_version[];
> +} __packed;
> +
> +/**
> + * struct guc_logfile_t - GuC Log Streaming-LFD-File Format.
> + * This structure encapsulates the layout of the guc-log-file format
> + */
> +struct guc_logfile_t {
> +	/**
> +	 * @magic: A magic number set by producer of a GuC log file to
> +	 * identify that file is a valid guc-log-file containing a stream
> +	 * of LFDs: Expected value: 0x8086AAAA474C5346.
> +	 */
> +	u64		magic;
> +	/**
> +	 * @version: Version of this file format layout as per
> +	 * guc_logfile_fmt_ver_t
> +	 */
> +	struct guc_logfile_fmt_ver_t	version;
> +	/**
> +	 * @lfd_stream: A stream of one or more guc_logfile_lfd_t LFD data
> +	 */
> +	struct guc_logfile_lfd_t	lfd_stream;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_fw_version_t - GuC FW Version.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_fw_version_t {
> +	/**
> +	 * @guc_sw_version: The full version of the GuC microkernel that
> +	 * generated the logs as described in
> +	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
> +	 */
> +	struct guc_sw_version_t	guc_sw_version;
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index c569ff456e74..6449c9a69b8a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -48,6 +48,19 @@ static int guc_log(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int guc_log_lfd(struct seq_file *m, void *data)
> +{
> +	struct xe_guc *guc = node_to_guc(m->private);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_guc_log_print_lfd(&guc->log, &p);
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
>  static int guc_log_dmesg(struct seq_file *m, void *data)
>  {
>  	struct xe_guc *guc = node_to_guc(m->private);
> @@ -89,6 +102,7 @@ static int guc_pc(struct seq_file *m, void *data)
>  static const struct drm_info_list debugfs_list[] = {
>  	{"guc_info", guc_info, 0},
>  	{"guc_log", guc_log, 0},
> +	{"guc_log_lfd", guc_log_lfd, 0},
>  	{"guc_log_dmesg", guc_log_dmesg, 0},
>  	{"guc_ctb", guc_ctb, 0},
>  	{"guc_pc", guc_pc, 0},
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 80514a446ba2..5659d60e41ab 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -7,8 +7,12 @@
>  
>  #include <linux/fault-inject.h>
>  
> +//#include <generated/utsversion.h>
> +//#include "boot.h"
> +#include <linux/utsname.h>
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_log_lfd_abi.h"
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_devcoredump.h"
> @@ -19,6 +23,57 @@
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  
> +static struct guc_log_buffer_entry_markers {
> +	u32 key[2];
> +} const entry_markers[4] = {
> +	{{
> +		LFD_LOG_BUFFER_MARKER_1V2,
> +		LFD_LOG_BUFFER_MARKER_2
> +	}},
> +	{{
> +		LFD_LOG_BUFFER_MARKER_1V2,
> +		LFD_CRASH_DUMP_BUFFER_MARKER_2
> +	}},
> +	{{
> +		LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
> +		LFD_STATE_CAPTURE_BUFFER_MARKER_2
> +	}},
> +	{{
> +		GUC_LOG_INIT_CONFIG_LIC_MAGIC,
> +		((GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR << 16)
> +			| GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR)
> +	}}
> +};
> +
> +static struct guc_log_buffer_entry_list {
> +	u32 offset;
> +	u32 rd_ptr;
> +	u32 wr_ptr;
> +	u32 buf_size;
> +} entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
> +
> +static const struct guc_logfile_lfd_t default_guc_logfile_lfd = {
> +	.magic = GUC_LOGFILE_LFD_MAGIC,
> +};
> +
> +static const struct guc_logfile_t default_guc_logfile = {
> +	.magic = LFD_DRIVER_KEY_STREAMING,
> +	.version = {
> +		.minor_version = GUC_LOG_FILE_FORMAT_VERSION_MINOR,
> +		.major_version = GUC_LOG_FILE_FORMAT_VERSION_MAJOR
> +	}
> +};
> +
> +struct guc_log_init_config_save_t {
> +	/*
> +	 * Array of init config KLVs.
> +	 * Range from GUC_LOG_LIC_TYPE_FIRST to
> +	 * GUC_LOG_LIC_TYPE_LAST
> +	 */
> +	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST];
> +	struct guc_log_buffer_state log_buf_state;
> +};
> +
>  static struct xe_guc *
>  log_to_guc(struct xe_guc_log *log)
>  {
> @@ -216,6 +271,305 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	}
>  }
>  
> +static int xe_guc_log_add_lfd_header(char *buf, int buf_size)
> +{
> +	int len;
> +
> +	if (buf_size < sizeof(struct guc_logfile_lfd_t))
> +		return -ENOMEM;
> +
> +	len = sizeof(default_guc_logfile_lfd);
> +	memcpy(buf, &default_guc_logfile_lfd, len);
> +
> +	return len;
> +}
> +
> +static int xe_guc_log_add_payload(char *buf, int buf_size, u32 data_len, void *data)
> +{
> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
> +
> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
> +		return -ENOMEM;
> +
> +	/* make length DW aligned */
> +	lfd->desc_dw_size = data_len / 4;

s/4/sizeof(u32)

Matt

> +	if (data_len % 4)
> +		lfd->desc_dw_size++;
> +
> +	if (lfd->data != data)
> +		memcpy(lfd->data, data, data_len);
> +
> +	return lfd->desc_dw_size * 4;
> +}
> +
> +static int xe_guc_log_add_typed_payload(char *buf, int buf_size, u32 type,
> +					u32 data_len, void *data)
> +{
> +	int len;
> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
> +
> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
> +		return -ENOMEM;
> +
> +	len = xe_guc_log_add_lfd_header(buf, buf_size);
> +	lfd->desc_type = type;
> +	len += xe_guc_log_add_payload(buf, buf_size, data_len, data);
> +
> +	return len;
> +}
> +
> +static int xe_guc_log_add_os_id(char *buf, int buf_size, u32 id)
> +{
> +	char *version;
> +	int info_len;
> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
> +	struct guc_lfd_data_os_id_t *os_id = (struct guc_lfd_data_os_id_t *)lfd->data;
> +
> +	os_id->os_id = id;
> +
> +	version = init_utsname()->release;
> +	info_len = strlen(version) + 1;
> +
> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + info_len)
> +		return -ENOMEM;
> +
> +	strscpy(os_id->build_version, version, info_len);
> +
> +	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
> +					   info_len + sizeof(*os_id), os_id);
> +}
> +
> +static int
> +xe_guc_log_add_log_event(char *buf, int buf_size, char *log_bin,
> +			 struct guc_log_init_config_save_t *config)
> +{
> +	int len;
> +	char *data;
> +	u32 data_len;
> +	struct guc_lfd_data_log_events_buf_t *events_buf;
> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
> +	struct guc_log_buffer_entry_list *entry;
> +
> +	entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
> +
> +	/* Skip empty log */
> +	if (entry->rd_ptr == entry->wr_ptr)
> +		return 0;
> +
> +	len = xe_guc_log_add_lfd_header(buf, buf_size);
> +	if (len < 0)
> +		return len;
> +
> +	buf_size -= len;
> +	lfd = (struct guc_logfile_lfd_t *)buf;
> +
> +	lfd->desc_type = GUC_LFD_TYPE_LOG_EVENTS_BUFFER;
> +	events_buf = (struct guc_lfd_data_log_events_buf_t *)&lfd->data;
> +	events_buf->log_events_format_version = config->log_buf_state.version;
> +
> +	data = log_bin + entry->offset + entry->rd_ptr;
> +	if (entry->rd_ptr < entry->wr_ptr) {
> +		data_len = entry->wr_ptr - entry->rd_ptr;
> +		if (data_len <= buf_size) {
> +			memcpy(events_buf->log_format_buf, data, data_len);
> +			buf_size -= data_len;
> +		} else {
> +			return -ENOMEM;
> +		}
> +	} else {
> +		int cp_len;
> +
> +		/* Copy rd to buf end 1st */
> +		data_len = entry->buf_size - entry->rd_ptr;
> +		if (data_len <= buf_size) {
> +			memcpy(events_buf->log_format_buf, data, data_len);
> +			buf_size -= data_len;
> +		} else {
> +			return -ENOMEM;
> +		}
> +
> +		/* Copy buf start to wr */
> +		data = &log_bin[entry->offset];
> +		cp_len = entry->wr_ptr;
> +		if (cp_len <= buf_size - cp_len)
> +			memcpy(&events_buf->log_format_buf[data_len / 4], data, cp_len);
> +		else
> +			return -ENOMEM;
> +		data_len += cp_len;
> +	}
> +
> +	/* make length DW aligned */
> +	lfd->desc_dw_size = data_len / 4;
> +	if (data_len % 4)
> +		lfd->desc_dw_size++;
> +
> +	/* Addup log_events_format_version size */
> +	lfd->desc_dw_size++;
> +
> +	return len + lfd->desc_dw_size * 4;
> +}
> +
> +static inline int lic_type_to_KLV_index(u32 lic_type)
> +{
> +	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type >= GUC_LOG_LIC_TYPE_LAST);
> +
> +	return lic_type - GUC_LOG_LIC_TYPE_FIRST;
> +}
> +
> +static int xe_guc_log_add_klv(char *buf, int size, u32 lic_type,
> +			      struct guc_log_init_config_save_t *config)
> +{
> +	/* LFD type must matches LIC type */
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_FW_VERSION != (int)GUC_LOG_LIC_TYPE_GUC_SW_VERSION);
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_GUC_DEVICE_ID != (int)GUC_LOG_LIC_TYPE_GUC_DEVICE_ID);
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_TSC_FREQUENCY != (int)GUC_LOG_LIC_TYPE_TSC_FREQUENCY);
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_GMD_ID != (int)GUC_LOG_LIC_TYPE_GMD_ID);
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_BUILD_PLATFORM_ID !=
> +		     (int)GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID);
> +
> +	return xe_guc_log_add_typed_payload(buf, size, lic_type, sizeof(u32),
> +				 &config->KLV[lic_type_to_KLV_index(lic_type)]);
> +}
> +
> +static void xe_guc_log_loop_log_init(struct guc_log_init_config_t *init,
> +				     struct guc_log_init_config_save_t *config)
> +{
> +	int i;
> +	struct guc_klv_generic_t *p = (struct guc_klv_generic_t *)init->lic_data;
> +
> +	memset(entry_list, 0, sizeof(entry_list));
> +
> +	for (i = 0; i < init->lic_dw_size;) {
> +		if (p->key < GUC_LOG_LIC_TYPE_GUC_SW_VERSION || p->key >= GUC_LOG_LIC_TYPE_LAST)
> +			break;
> +		config->KLV[lic_type_to_KLV_index(p->key)] = p->value[0];
> +		i += p->length + 1; /* +1DW to include kev(u16) and len(u16) */
> +		p = (struct guc_klv_generic_t *)((u32 *)p + p->length + 1);
> +	}
> +}
> +
> +static void xe_guc_log_load_log_buffer(u32 *guc_log, int len,
> +				       struct guc_log_init_config_save_t *config)
> +{
> +	int i = 0;
> +	u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
> +	struct guc_log_buffer_state *p = (struct guc_log_buffer_state *)guc_log;
> +
> +	while (p) {
> +		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
> +			if (p->marker[0] == entry_markers[i].key[0] &&
> +			    p->marker[1] == entry_markers[i].key[1]) {
> +				entry_list[i].offset = offset;
> +				entry_list[i].rd_ptr = p->read_ptr;
> +				entry_list[i].wr_ptr = p->write_ptr;
> +				entry_list[i].buf_size = p->size;
> +
> +				if (i == GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG)
> +					config->log_buf_state = *p;
> +
> +				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
> +					offset += p->size;
> +					p++;
> +				} else {
> +					/* Load log init config */
> +					xe_guc_log_loop_log_init((struct guc_log_init_config_t *)p,
> +								 config);
> +
> +					/* Init config is the last */
> +					return;
> +				}
> +			}
> +		}
> +		if (i >= GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
> +			break;
> +	}
> +}
> +
> +static uint xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_bin,
> +				       struct xe_guc_log *log,
> +				       struct guc_log_init_config_save_t *config)
> +{
> +	int index = 0, len = 0;
> +	char *bin = (char *)guc_log_bin;
> +	struct guc_logfile_t *guc_logfile;
> +
> +	if (size < sizeof(struct guc_logfile_t))
> +		return -ENOMEM;
> +
> +	guc_logfile = (struct guc_logfile_t *)buf;
> +	*guc_logfile = default_guc_logfile;
> +	index = offsetof(struct guc_logfile_t, lfd_stream);
> +
> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_FW_VERSION, config);
> +	if (len < 0)
> +		return len;
> +	index += len;
> +
> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_GUC_DEVICE_ID, config);
> +	if (len < 0)
> +		return len;
> +	index += len;
> +
> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_TSC_FREQUENCY, config);
> +	if (len < 0)
> +		return len;
> +	index += len;
> +
> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_GMD_ID, config);
> +	if (len < 0)
> +		return len;
> +	index += len;
> +
> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID,
> +				 config);
> +	if (len < 0)
> +		return len;
> +	index += len;
> +
> +	len = xe_guc_log_add_os_id(&buf[index], size - index, GUC_LFD_OS_TYPE_OSID_LIN);
> +	if (len < 0)
> +		return len;
> +	index += len;
> +
> +	len = xe_guc_log_add_log_event(&buf[index], size - index, bin, config);
> +	if (len < 0)
> +		return len;
> +	index += len;
> +
> +	return index;
> +}
> +
> +static void
> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			      struct xe_guc_log *log)
> +{
> +	size_t remain;
> +	int i;
> +	struct guc_log_init_config_save_t init_config;
> +
> +	if (!snapshot)
> +		return;
> +
> +	remain = snapshot->size;
> +	for (i = 0; i < snapshot->num_chunks; i++) {
> +		int len = 0;
> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> +		char *lfd_buf = kzalloc(size, GFP_KERNEL);
> +
> +		/* load from log bin */
> +		xe_guc_log_load_log_buffer(snapshot->copy[i], size, &init_config);
> +		/* Conver to LFD format */
> +		len = xe_guc_log_save_to_lfd_buf(lfd_buf, size, snapshot->copy[i], log,
> +						 &init_config);
> +		if (len > 0)
> +			xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, len);
> +		kfree(lfd_buf);
> +		XE_WARN_ON(len <= 0);
> +
> +		remain -= size;
> +	}
> +}
> +
>  /**
>   * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>   * @log: GuC log structure
> @@ -251,6 +605,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  	xe_guc_log_snapshot_free(snapshot);
>  }
>  
> +/**
> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
> + * @log: GuC log structure
> + * @p: the printer object to output to
> + */
> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
> +{
> +	struct xe_guc_log_snapshot *snapshot;
> +
> +	snapshot = xe_guc_log_snapshot_capture(log, false);
> +	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
> +	xe_guc_log_snapshot_free(snapshot);
> +}
> +
>  int xe_guc_log_init(struct xe_guc_log *log)
>  {
>  	struct xe_device *xe = log_to_xe(log);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 5b896f5fafaf..37ff4d11e6cf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -40,6 +40,7 @@ struct xe_device;
>  
>  int xe_guc_log_init(struct xe_guc_log *log);
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>  struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>  void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> -- 
> 2.34.1
> 
