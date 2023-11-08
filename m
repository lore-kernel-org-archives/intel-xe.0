Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29900C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 16:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BAE10E16E;
	Wed,  8 Nov 2023 16:19:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504F310E16E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699460341; x=1730996341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ESCGymRhGEoG5n/izrVv7RQlEyxndsJ1QKAd4JcqhEY=;
 b=IQX2X+e3gV++5E7hOOl11kKoQTcvp9NtsglwnHnBdRNDbwt7XQVWOtrY
 /KFvTPIecgfdm8NMXHXpoqR8t702Pvj+U3hvCNyMoc+oavNk8BIKUm49J
 69I0V11wBh2BsMVSdRx0bRpuWS+DZwa280qBhKeuI0xYEVIdYCMJhQ2y8
 hr+e88thcxER3hyzisBYO8hhTK0reMQ3wQ5CSu/iyQTOsxjp9lQpyPrv6
 E0h0BhKb1oN3g1cQePM1ITGQ6mYYx+afJ8TsIeEFyutktyaCcRpBAlNZR
 GMtgcnF/8SDCZKbyJW8gSceKi+Q9XQjq1xw099b9um3tlRPx+ocxC7amx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370004337"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="370004337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 08:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936558456"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="936558456"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 08:18:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 08:18:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 08:18:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 08:18:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAvQvdPljrtdylWoGcAoXQkbFglWG/kGs2zzRZTAihZKPXILUVGO5Spt8xvxQu4IfQuZoGAc6sqc97EPn40qZw50dUTTzmw7/Gn24f1qjR3gsPAj/egwd7kNsBzG+pRqylY1A1FJfYFlkIzhKmM5D0J2LbZ3Izj/rIsU4/EIAcpqkFMoWpb6P2vzdd4ovmLuOA5eq1XgM+oE7iEi2CwcMfE995Cmr6lST4/5owfb5aP9hyT3mTYhwtcwc3BCLs1RO66y7xxC+QFZnVepHVGACqzNhx+1cOkUxrYgMj6LkJVLm8blIH9Td263rKKNMA/WJlbluqKSJp6q3+9GkIdETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdnlFMre5mg7W0T8/LDilPc44IyGipWyun+ujQoWDxo=;
 b=DKAkeYOx39jgyZfA1Gw+Z0gBRzEtrygwL0/Jo7ejIwUFIpSVZ0G6pvUO6LhTm4G72wq3wkc/lN4//GgESzl0pSqUrU1hWjNZjmyDP/RSCyM7crgGxMkVS9hH1xEAqvlQRdRPlEXUgaWeSEJlrK+RhiOxwckvZdbzfmYSmsos8C4CLcuouWhOBemQGYxcBymdi3v1yCHUrWCLcc9e/vHCe+Lvv5CxN48LHKqB+OkCm3ijutztl2EcmT/0LEnOsH93qJ/Jt9xPTTnWFaCJ+DikTEzp1Lw18vjeCVIEJ7Zlfk1lTMYBz6x52l4WcHam4VHCYZ+afKReXIc+0ND2atrJtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.24; Wed, 8 Nov
 2023 16:18:55 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9%5]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 16:18:52 +0000
Date: Wed, 8 Nov 2023 08:18:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20231108161850.GR5757@mdroper-desk1.amr.corp.intel.com>
References: <20231107165026.1797349-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231107165026.1797349-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: ef75f2ff-e31b-4b48-197c-08dbe076660f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U8XPyvzZlh4/5qYX3g7A4iEmtMAVrPd6SLG/XPuVwPWDqWmPU2UDNAsRiOp0P6G3kNfk0g1HIXcfPcyo6kQtn9HaJ0kg/PB+vqIK9JPlDrYKh/NlDQ+1Udu+WnRtZZftja66kRcGatU9vXp0MNmBBqDn4BaJQHTj2JWPR1ROLZCVzu3s5opDLM9iAnfmVwdSzTgjR58bE56YdwMBqLfpX5Jni05xX8DCSvtiiGQ3rmO9grP0o5jnlHkuPnPYhbiOBMBevU7d7/BKS1drlJptleUVFzkX5yzup04yBsY3hMZ53XFXPCHXs6Ad0OMHIbccWUcf7tGBsNGlxsiJfewUuOs1ReoqNh5mw4bmW0kn+2xwk0sD24B9JoR8agaO2vhkfVxP1Z7yulFHcXIwHqyBnkbNJC/R70p6ObIgpDLEduFYQO0ljz2TAGe5SV9r0XSSk0sLy29HiabxNM5MUFk1vfPXAVnwYXV0WYhKPqKRuN5TGr2qZdERpqZmQXczZfDvZimyjoZPhAsZYuwLQLVOyN7Hw08aVypS2lYAG/aoztHCT0QY5v2rb/okPt8L/3UW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6512007)(82960400001)(8936002)(38100700002)(33656002)(86362001)(6506007)(1076003)(6486002)(26005)(2906002)(478600001)(66476007)(8676002)(4744005)(5660300002)(6862004)(6636002)(41300700001)(316002)(66946007)(66556008)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GPArr3O/yVwkE9E0/dQOZKJ04aefnJFlL6Y0LUWgDeDV6cm8THGZAjBabJys?=
 =?us-ascii?Q?K1SE2d4a/qsRQrez7LpvhEUIngMGAc2wM0Ixhl4imBQV8Ljuo+qfTiHAjD/n?=
 =?us-ascii?Q?f/HqOVjvx3EdVYPIx07MN1hf2jQk3WRVakZpCjGjITizRREMLI6v8vtmH+Aw?=
 =?us-ascii?Q?BTSIxBbZG5rkWtwME5SscSnIS0GljrEndCRGa68dBzUO6Edn9qsSd6eYoZ1e?=
 =?us-ascii?Q?yOUxwLT+5c/tksxfjJFfJRpQVQeIW9CAu7nee4EXwQyRoIBLxBlSvQPUrMGX?=
 =?us-ascii?Q?FmLFITUcYbGU+dBU9kGCjAd6bd2atRX+fyZaSCsGOejdQEWBtG2P+YsGdebg?=
 =?us-ascii?Q?JQ9depYkkrUa8ko98Rhz7vkGAlyx093bzeWnx/SQ4xs2iqoSp3jj8F3Ey0TD?=
 =?us-ascii?Q?mH2G5rRIOLxYw8aMH+i0ZpeiLpdf/1Aqha4a7q+yqQ+lkTL8Do0hPmsiPjPk?=
 =?us-ascii?Q?+8JJH8Wcp7goYaBcbuD4ABBCtNg926Wd7Qma1ZXnkSMt4N/EXTj1G9GBew5i?=
 =?us-ascii?Q?wTR3gdxeNv5KDQXZNiUJCw5dsHqtMFV59zOFcqhvHkm0LP4MNlpAH7muo1zm?=
 =?us-ascii?Q?Sdgo1RDjmc316j5mbmJHsGi1fzFJLE1ifE/lXrZXv4mV8zFLbGol+McQNh9b?=
 =?us-ascii?Q?mMJO3RZUJgFrA5LxMUaXVQ6RY6N9245ISWNzgMnavLkngftKTTgSKP34YQ1b?=
 =?us-ascii?Q?So4y2zMm46BPTXDabqAMfHE5iz7w8XbXPpZJgpBryNP0DcNxVxDDvhjWFvaA?=
 =?us-ascii?Q?UL3sj9P5P6FrL4qoGXLeY75+GK2azWypCC2E9q5LcItH7TCYhaLo3KZfa0Zo?=
 =?us-ascii?Q?w21zgPENvhScSDy8DteKT0JgSE001RpFyfqLkjh0HLnR30xYhguOOeNZumf7?=
 =?us-ascii?Q?6Jen1S5952qzCTrEB/CKMB8M049cCw+bJ683nuWGslcf0+c/1Oj+aXgShTmZ?=
 =?us-ascii?Q?Gknzev43HMaCA1BROTyccGVlTPcpbvz810STTLNGFm0O5FMmm+nvEXkBJXA1?=
 =?us-ascii?Q?EXfTVZjqyC43H5/V35DpkpsemVW6gNmsUL/IQI+uld5NRYgWQLkJ8Oe4Qhmt?=
 =?us-ascii?Q?H6G/v8em4Qv7vzDJg0LlDBSUo1XY3wSzoY/m94fLZuu4ki8uRUnACEQ3B2wK?=
 =?us-ascii?Q?hrDttcA6Sf9BdPqKxOtNtRyLDa33jOO6qoheyacrFAnBzFvBzdZqMBL1L7jM?=
 =?us-ascii?Q?Sb4Fkt72hmJcfAR39wlb3kkF+sFn2s8uoQv+BNKHHbz9Uh9ptXH6DIWWhsU3?=
 =?us-ascii?Q?Jg6fNdQAWPzeniqvTdIrg0AgPpGeemAZbLQu6V4SJBW1Xb260xwut8YLJOZV?=
 =?us-ascii?Q?vJTCe+/HSKqmpAn1aW6k0IlFQMTRXahNkIihbpR61JTVEm1TToYG2pT1a6C0?=
 =?us-ascii?Q?KbhFtOJ+juBFEKalsXBn7Ih2watezd1ci51jnhJisQH08y/hPHg+MM6LvbcE?=
 =?us-ascii?Q?nBuhAUb8cHGAQu0MAmSxBxssQm4iAQe9cCagiDVtfBWex9k5esXH7aeC39nB?=
 =?us-ascii?Q?kMBbbyWaNl100IotAVoCwdRabzcP/Ear3+fPTIVTwBGQiTadO4wolJ+6LQFb?=
 =?us-ascii?Q?Agl2SjU+Z3mkBzY3gF/ghaHerV/pOhQJWe3QpMneqZLeRv3wzl3HASsjIHr0?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef75f2ff-e31b-4b48-197c-08dbe076660f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:18:52.6972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qk0QrzHfuUKe1l+TQVaVCndEtcBe1iv5FM+Yr23WPujYoERZT5zKE+Peo7OOORpT55kwadhbftx2wj6NdQeOVlk7eKEULJZZg2ymT6WZVf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pvc: Add pci ids for PVC
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

On Tue, Nov 07, 2023 at 10:20:26PM +0530, Shekhar Chauhan wrote:
> Add two newly added PCI IDs for PVC
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/drm/xe_pciids.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index fa1c8201c1cf..68fbab161feb 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -168,6 +168,8 @@
>  
>  /* PVC */
>  #define XE_PVC_XT_IDS(MACRO__, ...)		\
> +	MACRO__(0x0B69, ## __VA_ARGS__),	\
> +	MACRO__(0x0B6E, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD5, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD6, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD7, ## __VA_ARGS__),	\
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
