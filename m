Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81958C54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 21:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CF910F317;
	Tue, 26 Mar 2024 21:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAl/HaiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E41110F317
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711486842; x=1743022842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/AjI0uvp2+mX8xAJ07Q4fyxk5jIInBkEDHrg4qY2uxc=;
 b=HAl/HaiLeH5nZJ7NZSHPKu9toQXOujfXXTjg8Z3UMPD/MVzYgnrLrRes
 LwZD6dunrkmRXMJohLWg4Ysb1qrzDony2AeqY+kiBHORDtzB3fCiW8nvn
 DLXWGr1jcxyDzdLcgFf25yuDlvTt8meqIIR+nJGj28go8ywRu7hNyRW4d
 2CTJeCXxL9/gLKlBKdpWv7Lqf279evPJ9w4eZnG0Ks6/TPd0G2MxH6un9
 HBQANiB7FiVAZT+87Pz0G2Gqx8dbOOEZKiF74VU7EQKQv5AZp9Z0jdI5h
 tlVcnABnNlW6vTmeG7LUqPKKzaQg49/DlDnzJF7WJxRNfot4mA2JjOr5y Q==;
X-CSE-ConnectionGUID: h2v939KyQDy3rd8JYHStPA==
X-CSE-MsgGUID: ReAftrPtSb2cP0KhCyZsAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="24006409"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="24006409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 13:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="47091747"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 13:59:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 13:59:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 13:59:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 13:59:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 13:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+Z2Ib6iNvFC12yq1sbjvCilI3J+rySWJIOx+r8pneNRH5vLX+Xwy5Jn17uXeSgapwbPKfkBUQqM2mohsq5B0MXDFiF1MsstB4PPRcZ0k9zhcmCulkCCy5LsPYceNDrCkG9uSDCdx0OQSoc22KgS8tXyJU4FotG5SRXk/9WF/kexhoR7/5VviK7i50Npg6qtUjjWSYnGcv0ibJjAr7YR7cPMDYRenDJUhUbWX6514vtUXqv/7Nq/9+GyUX/sqLTXcDAKb0s1dxOPHcAj5lYu+2KrTZ3tQdJVTqPQOpRD0e4wzM6oPAsY/Y1h9cE+QhCPNeLheGlPoTenO38PvxLPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m0FraD2RG7f2GVZklYz9/g28RVSuZFBNivbHuOFZZw=;
 b=Ye+tnQnCZKSoNy+QjyZebN3VouJ6XtgzdLtMobkD7TmQCNk6KvrSz04XIgJh8rO+12ughyqaClgoJ4QXC1NtMSkQ/zzfotuVtUAxFUGFjH1fE9/AuAH5r8eLO7QlahcepiOTcO8IA+cUjaIlQRwWauvlJwTOuSkK44FV9rpPAQHtQVzmzbZ3RQVg/oacTe8YJy+O/Jm1y1RNNiaInBzMJZIKWkTXuMKPbQvUmKM8EwewGREAHArC4Ehyh3PyGm6Yc7uKyfe+dxkenhbHKkcSIHnbmE4fr4i3bZBTWpfI4yc7821CHviE6Ee5WtMh0LZ4DC0Ftu/xJBgU05fRr+JEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 20:59:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 20:59:18 +0000
Date: Tue, 26 Mar 2024 13:59:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <balasubramani.vivekanandan@intel.com>, 
 <lucas.demarchi@intel.com>, <gustavo.sousa@intel.com>,
 <radhakrishna.sripada@intel.com>, <clinton.a.taylor@intel.com>,
 <matthew.s.atwood@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <haridhar.kalvala@intel.com>, <shekhar.chauhan@intel.com>
Subject: Re: [PATCH] drm/xe: Add new PCI IDs to DG2 platform
Message-ID: <20240326205915.GS2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240326103825.3832879-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240326103825.3832879-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB8179:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QH0i8N6g3W3VGv8DQD7gab4Y6o4krGBUGahhMloBTyusNNrt2pV4/6Ty1P5gMAA394p+CDKe1mAVLhdSORCWBdNLGzLoPse6s4VFgF6cruN7zxi+JpFdslw/HhwgCL7dmNXoAp83gYvY2VglqzfLnfpqtxYBEmB5dqyF550ywZNslHW/qySqzzaXrtZXcRx0YQWSxXp6gUlcCMpeV2ZQBSZVh0rGjhFz9QaVhzhWnQuffrj8UoYDcPq82kYoe35tKFOA9ADjNxj6mzBkt7i3rAaW1Lv2klbBakBYg82irC9nXxC0+qB+WyeGJGeXbhrQDwg1dV3dNaYqC/Y6xAvvWHDiEt0am3SC/iwoCGwS9Uafz1JSZO9ft05773pg/0L/XLzOhF4DyUr1eI+rmsvTLPZVAEIxJ1mFQMMkEG7T8Z56joe1+ihLfokQuLTpujDIEmxpQ4LCuvRbmVRvyAapW5o1wxihMYvJgRqotomr0xRneTOsy6Ej56nKpR77HQYyZc7AnjY4n66GF2w5Rd4CWMw+Y215vCIaac0AzG5SMylqaohSalfh5dte6lag4GUjV5ofPViLerhspLKMFMIlO+z8dyThzh0P/vmmU2GOFrC5vYIROXn3A4K86XWjGSgd7nFN+5jNWGYXFuNvVPiNpd6/etjLryxYsjjQEOA5FxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5NGDJEekd7dn6sNRq4soDdzxWJH/TypJEOR+hKkMXvIxUptTAUQnzxuOkS7/?=
 =?us-ascii?Q?H4sAYYXkewzEXqhE7SqRfJjU26pyVCQHlBCUaVnMfAQGmC51JssamVx/7r2u?=
 =?us-ascii?Q?4IN30EyFKrWyVrO6b/vksCPQZetgkJcTJniUtu+fC7gSjcVq3rNYmmUjV2sP?=
 =?us-ascii?Q?SunfxRfliv6JY66b1EYaq6veHGLFZ86PX/+D0HzqpLlw8KGgVSR8femetcIo?=
 =?us-ascii?Q?vAsh80P5PZ6RWqjzoxjRiC0vRhrQSbnbJTbMYNP6HKAkXuV62NIUwfQq5vZh?=
 =?us-ascii?Q?x1+EcaxHgnuMTNRIqF1bTFqGr4Luo/GW1N4daWOwTPwgJouDIaAk2cosUO9W?=
 =?us-ascii?Q?D8dvws1tR07j0/P17tcNlmaujGL50lnllev0mzIZKKy1OYsQI0Jv3F+KdPMO?=
 =?us-ascii?Q?QhXtQxtAWv/+0q3qeMjaA4Nm/JUHCloejdBWB3Slx1lplhGYKUFtqmELWhBY?=
 =?us-ascii?Q?ZSEegum49H/sD41gK/gD3ucUXLuKBRFSAgOiisG6M5Bx2hzwYfFm3Kslwhou?=
 =?us-ascii?Q?rb4JuzgXTn78I3r2cwVx05Qfd5j5R5MlbOy52EszOzqLV+CkBhnAENfX7V35?=
 =?us-ascii?Q?Kh8xLcIGxplxLlyH3gGonTeL8i42lPXHC4vavXCys8ZJ1yRKRazDWWeK015I?=
 =?us-ascii?Q?EkvSfYvbXoVEG1AT4cvooJ11zfi683saShZimvYbgu+2Af4BFmSnqCNMlE08?=
 =?us-ascii?Q?R6WI4KjkIZvyJ3NggnbdyN3QaLebK/Y4T4CtusY+CpCFYvRKSOUD1lV0mxl2?=
 =?us-ascii?Q?d9cYnhv1Pm5ZUQGEqW0U1o/KwoXltsRdDb6nkPZSDjpzR7xzat6IYVLwwL8y?=
 =?us-ascii?Q?143A7QLF4K3b2umBtJDlZmmi1Kwoce5CtiK4NI3quYv0HAlENZcfy6cME4WM?=
 =?us-ascii?Q?TZRrXMPNVaRwf15M+Vq+snmVsSALb52ZWfgSUekZhdIJeemJzc3mHKl5lcGa?=
 =?us-ascii?Q?ZpT9xO4T5MU9XaNVlegJsVZon4i/0Sbf/+K6QJjPpiOpC9sM2uTUC6KWfYoA?=
 =?us-ascii?Q?acgqank3a7KIUjHS3Mc7PJF+Ai8/a4yULyOmKGRlbnFq3NNwGZeq5YgMo6Mt?=
 =?us-ascii?Q?CDrWNDViYP1y71q+dhFO3QiQ/9zLnoIRAZ/ocUXW4TpkRh0SQZd5T9bGbYKD?=
 =?us-ascii?Q?xR6w34T/AOVsiUTRHdmJvm/O0D90xCNfBfB+5ErmRzrqbrdnSpP7eh7Ez04E?=
 =?us-ascii?Q?hAKjhr/g43Tvwr6vUSxvLuxlAmli7AXjkoK3U8sZjTqCdSDWDxb2JnQOgeSc?=
 =?us-ascii?Q?FHR4dGoQk8nl5sSF2luvsYFrYCTrvLtlQ0RWNZM8EZ3JzmI0Dq+eLj2KqGul?=
 =?us-ascii?Q?HvVDDPTL0AKUvXIeGPpsP3+wZgbqpvdXHvkzfYexuvlWiXsq5u+9SX7mb5i+?=
 =?us-ascii?Q?WViYFOAQQZWTET/SIzQatRz4UyUFAk8hEvtZ9pLx/wHXX+bUqe+rUeuaIXsC?=
 =?us-ascii?Q?L811SPu2Onv+SR+HqjqPOON2Dhp/MdnGTmWMjf0uaF9rQgl4O9XTvi8IYHv+?=
 =?us-ascii?Q?DeZkD0Ea1PJROSOoqg9Nzn8IdPfDGQfp96+xaJEEKGb7jH0cgWDuH5PaX3NG?=
 =?us-ascii?Q?LlNBJGrWi3vHTKtk1/yKKpXTqo119EwqM++nK1KoWhzA0RyGgH0sx0pb7EH/?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb21266f-1c20-4c08-6390-08dc4dd79a29
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 20:59:18.0844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xafBQ5Jjsu29UxEwXOE5g97jcr22ohNH6m1vjfbR5v2gb6egzPhZwo+3lkKRdz4Y0oTF8PZnaAns+UwBssrwStaDV6cTmUF1CfIHwDea9qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8179
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

On Tue, Mar 26, 2024 at 04:08:25PM +0530, Ravi Kumar Vodapalli wrote:
> New PCI IDs are added in Bspec for DG2 platform, add them in driver
> 
> Bspec: 44477
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  include/drm/xe_pciids.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index ab4a8987ac65..c7fc288dacee 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -134,7 +134,9 @@
>  	MACRO__(0x5692, ## __VA_ARGS__),	\
>  	MACRO__(0x56A0, ## __VA_ARGS__),	\
>  	MACRO__(0x56A1, ## __VA_ARGS__),	\
> -	MACRO__(0x56A2, ## __VA_ARGS__)
> +	MACRO__(0x56A2, ## __VA_ARGS__),	\
> +	MACRO__(0x56BE, ## __VA_ARGS__),	\
> +	MACRO__(0x56BF, ## __VA_ARGS__)
>  
>  #define XE_DG2_G11_IDS(MACRO__, ...)		\
>  	MACRO__(0x5693, ## __VA_ARGS__),	\
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
