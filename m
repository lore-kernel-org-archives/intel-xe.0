Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0589C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 12:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A032810ECA4;
	Tue, 22 Sep 2026 12:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COg29aeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2BD10ECA4
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790080813; x=1821616813;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=u06z37GGRrMkiqkjY9OaDpa+kl+2zgawqVPSKVxVYaM=;
 b=COg29aeG7vHstjkBNPW82ohAnKPF3/DARhDKmyD+pn5CahEV5dZoQc/L
 ym4YaYJVqW0lxYE98mSyVoNGA7E9gsb8VdBPLuTfoOTXtaZr56lNVn+Ad
 i8NUu4/IoUb2XQHKUMZXy95TGwfzSpDSRtd9sdJFLbIKfIkQaJ952zuuZ
 W1NuQ7AVNd38I29wt9xtAhmPsJH8tQqFDzg/+6KV1c1GTM+JLYQeH/7yY
 sJ2F9EtlLRk2bu7jlajycaHFBOh0KRP4hTeEHyljZRdmos+Knk8cYL005
 /Yu2r4VfkoM++kh+iRIDIUqLW4ejMMDdHs4POdci6Qg8vSLYNb9obqFDr Q==;
X-CSE-ConnectionGUID: p1RZdtyKQe+Ch4fDh+OS9Q==
X-CSE-MsgGUID: Uh32En/jSWeEqey9fyqe4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116200714"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="116200714"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:40:13 -0700
X-CSE-ConnectionGUID: 2QhJgqBxQ4eb1QqSTrjBAw==
X-CSE-MsgGUID: BjIa2DGsSEmWZPZAA2qr3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4412273"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:40:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:40:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 05:40:11 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkEKLn5oNRuaxJpdlkVA47bXaJ/xMUoCFGo8kOF96xjks7VUeRyXQpVrASo5HQRoarsNW1SS11r7iZyNzatOH9aJHOz9NQXve39LfDOxbm5+PeSCfDXcG0da+Yf9kweybfsBkNnwkoAC4sm2y2cu9K75YMmmpviQJPwg3cEtcWwADtzmUCnMxePGQXbsNXQrlyfq76Xvet2C0GKPKxe6T3H2kZg3JpBuukVBn8fYwXLm5gVRVejsos9UGlAerdZvfDX7qU48RDHCEPVmV4LHaf6FEDothS68N0MXcpl8VIjQHdtsKhbtfyiozschFqig+9ALXPyxGvI0v8zUYlGztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLHQ792HninP+NSyg8otKN+5sEQluXlmt4SmIO9fyao=;
 b=y69pfC6tzVRaa6xs/lV/je3cmWkfSDdboHeWGCiI10gQbmLRB2c6eWZqFY01C2dMuahvk+ZnxKKd/UfHyuvvnrwMtgWhyqPV0KJxbrgirEuqlX/Ci4XQCx5NQYFSY04V0PbuR+IANSHUlNr1v8J0WvoA9iiruQoTaar5mxSdyr6fngUgI5cxhsVRINq+n1/Xjf9RHkfUGBrXMx7y5dSO1D5ym3bGYcDWPxoOkTvbcKGSCbr2W6G3YSSc5fMogpWklSO3Uprq6+UgIxWNKnHJkAo/4DKPSt51C+EWIMSiOToOCoWmDhqY0xoZgIqWJ9nZj9S/y1Cxr/CmQKIH6FY2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 12:40:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 12:40:09 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>,
 <tilak.tirumalesh.tangudu@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Add support for Wa_16030224309
In-Reply-To: <20260922073518.1444952-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260922073518.1444952-1-tilak.tirumalesh.tangudu@intel.com>
Date: Tue, 22 Sep 2026 09:40:01 -0300
Message-ID: <87a4p9foim.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: ef85fc71-061f-4f17-812f-08df18a6a349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|11063799006|7136999003|11062099010|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: mqZ1QfUKt0hJJkhOCsH/KanHCQxNzJ0QvsZV+gQLV6Kleu9MFBpHJOiMB0Wt2mmRcSM6utpCkbMjTLaGTj+eGQbegqgQZ5e04x0PomJvyZ3ugQ8asyyHApy4W5dqyVNkLTzeHqCRKjdyrAwXbmedQoZzjljtOSL4pd9kDXHDuHrCZAiey1VET9aeMrzFFFJWONalpmmfenMgykCBjNrNSxqijGf4wBu8c85xmfNxDtB9eqvpbilABZk5urvYfz/IUX3jMJDV832DH4U4HbDtTjXbBWHRTKuPRVCroSbsd81Oi+Tzec6IBkxz0P6Per95XlwoPZX+nw1frXAjclrCpHXpXBsqMPXnzdLhzatzb7BdPle+D+vziJmh95IBL8Kn9gK0SaL1xMqStj3anwJ3oyBNeercNogjZt5kRJWL+n2G67Se6Ya4sYncReKswCYz4M1L1l6C4aGj9F8elhzSQuUANlJXVNZk6ZsfRJ56f1OtWOZ3CWgE+zE/c0KU+9rld4lj3vX8r+RAX7pRckyfjHcz+BBtmpLzdX0vsVuHsfBwS3zO5IwOpRZKOxPrAFxdq5HAiHAEz2/S+mJgaiAedA9JnedkpN5VAO/K+BMZ+X9MrdlpxYBTvgYF0iv/1/Zy4PQU9swg2Wc8X9sTbEE6MKrh3o9oCOHaEV/A9xO2fk8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(7136999003)(11062099010)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q2p3FuH58iQ8dG/LaZHOmwGzlFQwie26jeHB9RImMJlnbOq1MvhCLWWeL07E?=
 =?us-ascii?Q?W3WgvWsbvZ8A7SGh0mtSVKA9U/dWzBKWsS3f49DK1c/kXZdLvaUe4WUtpLm9?=
 =?us-ascii?Q?sGPvVTjz/loQMvZDPJtP4QjfoUEHCtgzMC869PglThb8aO+tY6/BYEpCffk/?=
 =?us-ascii?Q?3KAhfwlWYDfvjLQ4gz63qHVg4qpRc4AMr5xiWIoncWMeDH4f9guKw5jnhL5T?=
 =?us-ascii?Q?Ufd38Np8jsiBbp1Az9GmHrvpeh+npUTJ9e7W9BmVZYIqPEJdPjz80GxqdjsA?=
 =?us-ascii?Q?e8CNjmZSOZNJg7UB8FVbys+MXvRhs2GntjPL3eeMwNs6QWRn+l7+UBa0NEoR?=
 =?us-ascii?Q?KjQyQIM31QWtwRKmkBFPBb6lNcaKTwj6I5a2EBqJnuuebeHpmtpaadE18Drp?=
 =?us-ascii?Q?HyRnC+ZgL98At8R3IbZHRo0KpUhPLI1OyPaKL3bvfDFcH8DFOlgSYqJBrggu?=
 =?us-ascii?Q?bhY/AUdPT21R6uNXXhBZljsDljFyCWgyWYUmKGnih7owcKT2HfBNtlEURhKd?=
 =?us-ascii?Q?xpMNgMW8SzM4roRUm2lWOaO6XYio8FUQ1VmK2q2HIyy0b7M332D/RN6bWp5V?=
 =?us-ascii?Q?UGP6KYQTPeWl1k2ptkt2QxTI2kKlFnKGJI3cMPjUWS49/myaxDDJ/6b8WZYl?=
 =?us-ascii?Q?I0lq/pFbapHlqXP+MarDiO7SVdmXUpBoxcBlHbZIFSParqsdn3QOBM5zTNAM?=
 =?us-ascii?Q?9HOaH5cSWOv1SHHwO/njNCOyiZGwUPEIFIkeIDioF25v+MvmWfuppGopIdZL?=
 =?us-ascii?Q?rm7Z/7MZ6XT2GxQDR511Qakx1V1ALNP0pPpwsOmtcEQcvzI5BZSrQ3myv1kx?=
 =?us-ascii?Q?rrEKmp2acC5GOq5gSxoKGrNAJJXWiJPuZV4RTOI4gQoCw1Bgi5JiQO9Ieyad?=
 =?us-ascii?Q?7H0myFuOxp5cvUs3aJv5QmPoPRvo6Qmkh/jw7QMTJIbFJss/TO6QnohvUbY7?=
 =?us-ascii?Q?0rdjDNEFC3ZbKjD+W8qOSlwE1PjXcnGdYEakd2KdofaBdJkABYbLOKnW5Tbl?=
 =?us-ascii?Q?v1fmD5Fwiy7sMtXZHivPfEBtXDmIRBcRyK6/irXOgkmOd+RMOJMI70tqo6TR?=
 =?us-ascii?Q?HI3a3aL0/0BLp3SUG9F2jaHMLMWIaYZQHLuLYAYitISKPqYV13P838LkKYyF?=
 =?us-ascii?Q?49EA4kE+hMcE6rNgIfdP7m4Uz3KBrj1pWhtO/+/bFx8bM5aJJH3Ax00PVE/I?=
 =?us-ascii?Q?AQxv4hM9d4P/wS4Ap2Mm0jvezPKyQVnOy0L4/vJEWAUMfuAf538mwY05yQ8A?=
 =?us-ascii?Q?Sj45sPwVwiG2XoHlA0y7cNAfVaxghGj6+zAzbrkNbtTP4KuIcgXBjYwhaIlj?=
 =?us-ascii?Q?dyMpy0YrmUF750mcQwxHIOqIN662Bn6+B0bN3AjNzzorwRiez5MiS+fokdZm?=
 =?us-ascii?Q?OK+yd+V0timnSQ9+IP1587XnxVM3mPffQzxtussXpss0iBftT8/QLnJR0lzE?=
 =?us-ascii?Q?IisNXa4qs7dien4VVOtInapOIiE92ps/Q6PhtEcbCHFmivRntI+nTHnSgOKz?=
 =?us-ascii?Q?J8aoAVv96ICAY3fto6TPEKqTQxNVY1sGuZweW4GIDD0C9kC/zfKZceZSuLvB?=
 =?us-ascii?Q?3WgqEEWPKYkI8FjMs/fFIpIy/USeQrjIMhHLrd+7pBOOLcTghTeZUKHcoEsK?=
 =?us-ascii?Q?8WMNNH2mlJP3XpWkZOvS2Aiwn0NkhY977ZDQU424e45LkhdsPYOXJalAjrWg?=
 =?us-ascii?Q?s2alOiOcFF1EP5fV0akZrDQhd46nRSMk7aiX22dUdlJQXDHtI/hzZniX0mH5?=
 =?us-ascii?Q?73gWB9zQ/g=3D=3D?=
X-Exchange-RoutingPolicyChecked: HMangWB2uZtDP93u6jEvHk+YlrTh+lL/nMORIEXYzLTvYh560uF2lBYqeQUnt4aDhdxk6IGtqpeRj8vxFcMrw1WCf53qAQGh0k2ZrjI4TwNbXZ4mKH/WQ9kf/2Z6h/CzTg2RPaOeKhL0zLnRuqlxPBveLYgXufh1BOFkq5G6NzyhcCespe4khhNwYdRF46IN+7mTkP0ah5nwynW6VvJ4Kq+SRU2w9WUyX+Zgi5/5EBDI5fKNWRNa6e0wtMwJpHCuITJ06YoSx2mOAOUyeMSEfuqPiv2EelVoP5av5xQlOagR0SmP9FROeTQYcbOulqqdHYWVf2iv9lDw3QbPUvYztw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef85fc71-061f-4f17-812f-08df18a6a349
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 12:40:09.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6vMBRMMlFs7/6Y/Cy4uGr1CVRmBOBQUHiDFNZwfodHvT5XGAjSAtDjKIuVggMT7Mir6N4JAL7RSD5pIPvmJ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
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

<tilak.tirumalesh.tangudu@intel.com> writes:

> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Opt in to the GuC workaround, to ignore context completion status
> with preemption or preemption-to-idle in the CSB when the multi-queue
> feature is enabled, which is supported on Graphics Version 35.10.
> This WA is supported starting from GuC 70.73.
>
> Apply Wa_16030224309 to Graphics Version 35.10.
>
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c       | 6 ++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 685c4ef17b73..4bcdc1a96785 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -525,6 +525,7 @@ enum xe_guc_klv_ids {
>  	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
>  	GUC_WA_KLV_REMAP_RANGED_TLB_INV							= 0x900f,
>  	GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64					= 0x9010,
> +	GUC_WA_KLV_IGNORE_MULTIQ_CTX_COMPLETE_WITH_PREEMPT_IN_CSB			= 0x9011,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ff8eee3831aa..70babe95a6aa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -396,6 +396,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  				 GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
>  	}
>  
> +	/* GuC only applies this WA for scheduled MultiQ contexts; no KMD-side gating needed. */
> +	if (XE_GT_WA(gt, 16030224309) &&
> +	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 73))
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WA_KLV_IGNORE_MULTIQ_CTX_COMPLETE_WITH_PREEMPT_IN_CSB);
> +
>  	size = guc_ads_waklv_size(ads) - remain;
>  	if (!size)
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index dd69ad07f7a9..d06ee78bf534 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,3 +72,4 @@
>  16029897822	MEDIA_VERSION(3500)
>  		GRAPHICS_VERSION(3510)
>  14027054324	GRAPHICS_VERSION(3511)
> +16030224309	GRAPHICS_VERSION(3510)
> -- 
> 2.46.0
