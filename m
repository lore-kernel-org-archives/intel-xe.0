Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35859CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FC810E659;
	Tue, 14 Oct 2025 16:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OabvdhRS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACFD10E659
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760459650; x=1791995650;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QLirjIooP+IvrQ051FCeNjSyzmPBIzaqPmKAVc/rUD4=;
 b=OabvdhRSgawIzxDy0tLPBWuQJpe8A7yiPqrz6XMhd5lreNG6Ta5BzImy
 iGvjFmXAK/5IOoHzXSwfhqNpRAlj3qyHIi5Fag4A6OVfb6u/Ybd1QChNm
 DaXjIL+30Ju4BtL671kUSxVKgP8Kt1IgcKlSrm0mvJjGvB0mLJr3hy7A1
 UzH2PLpb/MOrqgSPuYjz5uDEWY9274IL5joh44kCeblQ0myqOcW5F/3UG
 Xoi/b4aFgzNP6wkJMQlIccd6QAVb2zpzU8fFN+Zw8SDOKqiQuaB9TuiWT
 mznML7IBEemGgoK6oBwPRpBK1W4Kc8YVjmGaji1TFZjWXJL9ELKlzO/DM g==;
X-CSE-ConnectionGUID: VBnl5s+HTjqFXvhld8gTRw==
X-CSE-MsgGUID: esAh4MVmQm+rkdoDJRkrmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="50187189"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="50187189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:34:09 -0700
X-CSE-ConnectionGUID: +gXgQ1O8S/uxKuKaXXiccA==
X-CSE-MsgGUID: 5gTZ+uGmR76PmIbHD+YmiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181610136"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:34:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:34:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 09:34:09 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:34:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXOVbVjNA91ypLgQtX7yUCqtjPf1DyN7vpHTQQ9W/le0k9+8NKEy89nR3mMBY7aMHawX+ohx2LZ5fFh3dMsrez3tMJGv63Myaqj1vJPL1S3331jm1eqF3/QSrVJzWyCYkNhEkabhqYko5/Ux5kdHQ9MlYJI10P6Dp9iG2/0ALIF8QXjRv2aZWooIUW/26oDuxrVcLtt2X2olSx+pRshn/hI/khT1W6sr3iNFhe+tP2G6J0QN/DfGzRuCiG1FawLV5J9OxitaZJ4O3xi51EWtWDPLsEyV8jhMGja0psEBhH9vNl0k6PwqByvCJjebqytq5DJ/vkG6DxiCgTreEPts5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bh99lI86AhKV8VKCH2ihIEUdoyopIf9TPsUOYvxAVaM=;
 b=WMAAqRRr/v3S+qAvYgN4wVnh2HV9ex8c/H22Db012+86N8dmHztjodqPrW+JPvfrN+tW+nkMCWXWLkqXWGJ2uDbCqb/VBSOj0J4kXXVInYE7zYCLav7I4SLOVVb5/peOAx4dIY9yoLZpGIyLlByHNya6dVB3uH4UK282mvyoUHeRT4XvUn5v8eKeEbru5ICmEgFald4o5ncBd6s/+onPafPuHM4CAOQcQwy6lvonTxgSyvynRmk8dwU0rXXnOL4OSvvVNN3pns6bn5qWYvS94kCyun7YCma0rbQfsKmUkRp+UgPaapM4SDt21485eIv4V+GiRRuM1iBOqLYjbVuS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 16:34:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:34:06 +0000
Date: Tue, 14 Oct 2025 09:34:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 03/23] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
Message-ID: <20251014163403.GO5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-3-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-3-bfb74f038215@intel.com>
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 37768dd5-3f11-43c7-fca7-08de0b3f7e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sHNk4BAW1yHWAPWO6GquWT78w4INCjduWMnxQ0bHJBALMrXtXqJ2ddfO7pFT?=
 =?us-ascii?Q?eE9VEzow3M/ijqVz8IZoa12DFyNq6rmre1mAL0vh93ZLB/Jvlxk2uqjtznxa?=
 =?us-ascii?Q?sH0062pDAaf4fSHv8W0//m8N0rA85+VoK+w30WHc96nF7shDQe3N3CM/kEZg?=
 =?us-ascii?Q?fiZ6FY3+5OfDfswmbA9KqrtROW6O53usH81na0vVKoNgrM13IArz5/kwOR+u?=
 =?us-ascii?Q?9yM+6X3bxyw0RCAD5mZkSL+W/ueQvS6A8CZBCms11IWPbMsM7uT2mz/bxxBd?=
 =?us-ascii?Q?i4LOQ12JCliJwDs2HV2N/e9J1+UYBRjk6hqb63MqEbyR3KvZTiNxil+S+KNr?=
 =?us-ascii?Q?X88sbeLtXArAxb2MtozQGnL4dsoGc/WFvczUBfulANU6A9VjUyk38n1Vr0wu?=
 =?us-ascii?Q?fazfYGrwBHGst8tUSMMzmkUmYn6igWRPGL1eqS/3kMjjhJqFoyyMf7KJyESt?=
 =?us-ascii?Q?Ju71zyqq7pMf4j2GDKWI6hbtA/QVb70+sFZG/Q+9xXkHkNq+Egcg6d7cQY9B?=
 =?us-ascii?Q?79JXxBl91H+7vIHc/nWjSCfkfHOqZ/1pgDUZ00yEbtD0GD6W5JGml4+S0k1G?=
 =?us-ascii?Q?5063QMQoXu+aMz9alIgACENLYP2nNM6ychGJbnqIiJ8kzYJ9DNdzOzqyZSBr?=
 =?us-ascii?Q?JoTC74i0zlCJXDmQBAdWQAwDzg2kkA6GUHY4XTVuqDcy4hXyQDNAa2YlNXUR?=
 =?us-ascii?Q?jpZKwTjvgjAUmdCTQI56aoXJg8hK1a3MC1beif+fGLFmgIgsSrn7aFNjCL5g?=
 =?us-ascii?Q?Z3UvgbaaZhtufkddNBsroqwcVIAZfkDNQCfPYoXZaJtHuHPYcF7WNM6jx+8p?=
 =?us-ascii?Q?0gZKLiFLS0GsOqkJAHozmF2f7gJDn6OSNPIhQqwwog4UGr/uQlbqOWNG5Pq1?=
 =?us-ascii?Q?z0VXrEt04rpYbqUPmTL9ON6V/+mrsbynKFmfc/iNv2w3dZCddi+usyuijZcb?=
 =?us-ascii?Q?thJtn+CUhPQMq6JU4rNGvdvR4HP6allgqiFn6AQeSN5YCVbHaByNKACMPMxK?=
 =?us-ascii?Q?Cpsq+I5+Kpp0fkUC1FR0+Z56i+JAcGkahz/rdLpNngU8lodWjMIFkgB/GNY2?=
 =?us-ascii?Q?8xRzML80RgGCb9IT2AT5uDDS180XJ3DjDnq4f+3Me4ow6czaWWk+LT6ikucq?=
 =?us-ascii?Q?kMndhXIUTabxm4J25WCuacWU8xFIOfUjINjqirWv7Cy9IBAmyBFAveyzoTWX?=
 =?us-ascii?Q?gGYmlKS39p/u8pc+f7XdnioIIEfzSpCWMgwpmrN0Ul29XISpBUtRpjh3Eu7j?=
 =?us-ascii?Q?DyWx6Lx3tFjv3PFdehtHZy3pYFOUjeq1yUKqRhf/X9o0o9sNVRaEuXNQYuhP?=
 =?us-ascii?Q?HcYbhOvUM5LYhlgnf7vdXCMVP96wQoBCdTFuPjXvKme/UQs0UlBcTmEwP3Y7?=
 =?us-ascii?Q?cwKFK2MbSyqTds+GOGtsK+BuqtDeKev6+PWK+QxIdBgoKpaSYPD1CSbwQN+h?=
 =?us-ascii?Q?GBomyyIldu6lIepykbtKeNTHmV4FoFHN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wiaYSJ4TJ86cgORDROFSp8tDGnYexmENXKxMvmra5jBureIy7tLq5Rj2b/KK?=
 =?us-ascii?Q?xQse6edVEl6g8zQ0NS7giGIEr0CaR+45PAG1W0yMgKZc553VdFZ2nwLF2UHi?=
 =?us-ascii?Q?2VRjMC3HRfUbC8uyMCag/52JUzB5fPGvA1JgnDfhhsKJbisZf8NtuWjmoaWw?=
 =?us-ascii?Q?oXWHMhfnsX0UEziHQX3yljdQCa8Gbtb583lmexNOWaozhWKQGpM3a1uFI9xb?=
 =?us-ascii?Q?rTa8qq0OVUt8jyE7VXdNrayrI6ENOgggdqb5jzAcJ7vZUrdUN9cmfcXqmnCx?=
 =?us-ascii?Q?o2BgUIxAP4AjJR3ekNi1DoZmRmhD7NCBWbKe2rvRzTUuD3L6tHszdxoFZCP6?=
 =?us-ascii?Q?suGOr040TlGUfxMPlgTz3qbnsLcmr4JuZ3hdaNVX9lr+d15D1s2GvyoMQi2W?=
 =?us-ascii?Q?XuHwXuppQL/aPOV0rydBI+Alkhsi4qtq66rk8B4MfV1/Y2t6HLizY3RfEfXu?=
 =?us-ascii?Q?Jn/h0wknYcu+AyWs463aIEWPl38qxQ1UFk+Wdf2UXhhMRqmLgbkpe+p724Ip?=
 =?us-ascii?Q?d3dA0RL1g4YMGcskoyNGlkcaAVmDKYabnnFXxfUiYgr5pMKFwCEpQdkHRhez?=
 =?us-ascii?Q?lfcE7w45B/YhvymqLLPnMt9/qvYYL3bRtCbOLQObImz/D2CTM9a9sbEt8wHU?=
 =?us-ascii?Q?dvRrxFWWbiBLE0QWc/CP7Vr+MGaJYgBdvtAfUjQadehEZ5zNAKRf4B7niffK?=
 =?us-ascii?Q?aCIAQHppbILBvUO6dwF/RRfHkVBcWQuIoSvFSTWUrSXRBbRcvAYJb6atsUIS?=
 =?us-ascii?Q?JESPuAPLgGTB8NgApt4+1KCWYuKoFhwMfqDED2tClFbPBSxWIub1XDO3XlVm?=
 =?us-ascii?Q?SYCRMuYZZhClL8RCBzIL+um6f34eDvYOec8xzYjrLnmPXXI1DMNjDoTT1crx?=
 =?us-ascii?Q?rQNFOo4mz/Do/rSpIz+K/jV3J2KxgvnvtGy/8s9RBV1NUzmN0EpJN8lHpFTu?=
 =?us-ascii?Q?Ugpx9eqRItwuDMzriQrzV0JjkAGmqhIZUcLaFi7qgyzdlIbJ4W4+TgBup6Z6?=
 =?us-ascii?Q?h5jcaJnwMU2D3dRbAXBqLHHtNIl3jyMMQRf2Rme6Z5o0XC6UERIPjdZZ2DAz?=
 =?us-ascii?Q?ALQxsq7aYSV6W/DZTJPDKa3tXRq0HumEqXics8fXWRDVRMLSCvqL7Vf7d6ic?=
 =?us-ascii?Q?cOpCdUOdt+YnkqkC+aMtZLBEZ++LezWKznh1BP38zaBq7UzV3ppSx5vFhfEJ?=
 =?us-ascii?Q?73iHW/MTp+alKnQz9maLteXQmvGKc6xKY2OZg7fNlm4lRG3y/XP+eNkbtIpt?=
 =?us-ascii?Q?3ERzrZ/33H3QEfDHhmJ8dhpYBd6xbwsEIeCgQJT8ykxx6bZIKnvCKyHisEQc?=
 =?us-ascii?Q?+ggDiJO4OvIi+McNElkyZ38Wzi/K6/zrv1r8JKjZtJR1yqCdopdR1U4nsXsQ?=
 =?us-ascii?Q?mJcz8Up5s7itVq2C3y3m9Mue4itVFZULdxFMUHaslY/U4jijhuoht7CE414R?=
 =?us-ascii?Q?mVtcJ4CDAToVlp0MqcSYSuJ2o49BOgO9fTeMi0QpelGua5ALH9fxFCvsjiFg?=
 =?us-ascii?Q?KzWXr/b4m0BZFBwS34lo0Mno8OMr6olZQZ23GhZqY+jY0io7HEQGa+YBxVvo?=
 =?us-ascii?Q?d5RnlClOj5KFFl+8YaPnGTjPCnAAPbTP/w6YeIyTjGqd6Lg5VyrBwIF/bq7r?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37768dd5-3f11-43c7-fca7-08de0b3f7e3c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:34:06.3912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RccZSXji7Aq1HJkFrs0B33hKym1Kuiab/G4RLC9KXfzGQsf1naehxnZh6aMDfIvz5XFRjucOxAWBcZOCZJQ+k8vb7hfCJwN8CQc56+QzMqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
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

On Mon, Oct 13, 2025 at 08:24:35PM -0700, Lucas De Marchi wrote:
> From: Brian Welty <brian.welty@intel.com>
> 
> Starting from Xe3p, there are two different copies of some of the GAM
> registers:  the traditional MCR variant at their old locations, and a
> new unicast copy known as "main_gamctrl."  The Xe driver doesn't use
> these registers directly, but we need to instruct the GuC on which set
> it should use.  Since the new, unicast registers are preferred (since
> they avoid the need for unnecessary MCR synchronization), set a new GuC
> feature flag, GUC_CTL_MAIN_GAMCTRL_QUEUES to convey this decision.  A
> new helper function, xe_guc_using_main_gamctrl_queues(), is added for
> use in the 3 independent places that need to handle configuration of the
> new reporting queues.
> 
> The mmio write to enable the main gamctl is only done during the general
> GuC upload.  The gamctrl registers are not accessed by the GuC during
> hwconfig load.
> 
> Last, the ADS blob for communicating the queue addresses contains both a
> DPA and GGTT offset. The GuC documentation states that DPA is now MBZ
> when using the MAIN_GAMCTRL queues.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt.h           |  6 ++++++
>  drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h          |  1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  6 +++++-
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
>  6 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 51f2a03847f9d..47e13a3fb9072 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -545,6 +545,9 @@
>  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
> +#define MAIN_GAMCTRL_MODE			XE_REG(0xef00)
> +#define   MAIN_GAMCTRL_QUEUE_SELECT		REG_BIT(0)
> +
>  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>  #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 5df2ffe3ff838..9d710049da455 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -22,6 +22,12 @@
>  
>  #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>  
> +#define GT_VER(gt) ({ \
> +	typeof(gt) gt_ = (gt); \
> +	struct xe_device *xe = gt_to_xe(gt_); \
> +	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
> +})
> +
>  extern struct fault_attr gt_reset_failure;
>  static inline bool xe_fault_inject_gt_reset(void)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc0..37e3735f34e63 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -91,6 +91,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>  	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
>  		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
>  
> +	if (xe_guc_using_main_gamctrl_queues(guc))
> +		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
> +
>  	return flags;
>  }
>  
> @@ -1255,8 +1258,13 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  
>  int xe_guc_upload(struct xe_guc *guc)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
>  	xe_guc_ads_populate(&guc->ads);
>  
> +	if (xe_guc_using_main_gamctrl_queues(guc))
> +		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
> +
>  	return __xe_guc_upload(guc);
>  }
>  
> @@ -1657,6 +1665,25 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
>  	xe_guc_submit_wedge(guc);
>  }
>  
> +/**
> + * xe_guc_using_main_gamctrl_queues() - Detect which reporting queues to use.
> + * @guc: The GuC object
> + *
> + * For Xe3p and beyond, we want to program the hardware to use the
> + * "Main GAMCTRL queue" rather than the legacy queue before we upload
> + * the GuC firmware.  This will allow the GuC to use a new set of
> + * registers for pagefault handling and avoid some unnecessary
> + * complications with MCR register range handling.
> + *
> + * Return: true if can use new main gamctrl queues.
> + */
> +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	return GT_VER(gt) >= 35;

Revisiting the spec on this, I'm not sure whether using GT_VER() here is
actually the right thing to do.  As far as I can see, the media GT does
not actually have a "main gamctrl" register range at all (i.e., bspec
76445 only lists MCR gamctrl ranges, and 0x38EF00-0x38EFFF falls within
a reserved/unused block).  That means that registers like
MAIN_GAMCTRL_MODE that we're trying to write during xe_guc_upload above
don't actually exist for the media GT.  Furthermore, the tagging on the
register detail page 73540 also seems to imply that this only applies to
the primary/graphics GT.


Matt

> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_guc_g2g_test.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 1cca05967e621..e2d4c5f44ae34 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -52,6 +52,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc);
>  void xe_guc_stop(struct xe_guc *guc);
>  int xe_guc_start(struct xe_guc *guc);
>  void xe_guc_declare_wedged(struct xe_guc *guc);
> +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 22ac2a8b74c80..bcb85a1bf26d9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -820,16 +820,20 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>  static void guc_um_init_params(struct xe_guc_ads *ads)
>  {
>  	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
> +	struct xe_guc *guc = ads_to_guc(ads);
>  	u64 base_dpa;
>  	u32 base_ggtt;
> +	bool with_dpa;
>  	int i;
>  
> +	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
> +
>  	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
>  	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
>  
>  	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
>  		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
> -			       base_dpa + (i * GUC_UM_QUEUE_SIZE));
> +			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
>  		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
>  			       base_ggtt + (i * GUC_UM_QUEUE_SIZE));
>  		ads_blob_write(ads, um_init_params.queue_params[i].size_in_bytes,
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 50c4c2406132e..c90dd266e9cf9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -113,6 +113,7 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
>  #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
>  #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
> +#define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>  
>  #define GUC_CTL_DEBUG			3
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
