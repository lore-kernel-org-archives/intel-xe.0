Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A2D65C53
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 17:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935B610E8D5;
	Wed, 17 Dec 2025 17:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgOz4JEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE21710E8D5
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765992339; x=1797528339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OHoOMCtb696tVnjXWryVOFlj2NE97OdfiivVgjlfPwY=;
 b=MgOz4JEYbmyQXDoUmGvsLn5YuEO6ETMAkP8rm14MpTH9sed+2Y+sVakU
 Qm64hxIJO5TCve+um3iW0KRgdM5n8/zvVkk7uCGTjfoj0viF1QsUk+fcm
 URvtdbGIh4MJArOPCSQ/+FcYWZ4+EbgWzki+/s4QFtY9FlPpPwLCywCa5
 vQ3OTKQXU8m7/Or9wMJ5IC8L3eb6jQGN6UxGqBZROL9lH6yzJgD3VOsqL
 Gr74ggFwldHp0x6t8Dyg8rcwagfAvFJ9x065WoE+eHjxnM0xxaC3doTTx
 Q6drSLeUVJI9cpLt8AKeY17/z9hSmgZGuC25Fw0WQMHVUQuibLf3pr8QP w==;
X-CSE-ConnectionGUID: Hq0YrQDtRtSjI3zEdVxAlA==
X-CSE-MsgGUID: Py6z+6vuT+CeZHBWjdzLqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67826905"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67826905"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 09:25:38 -0800
X-CSE-ConnectionGUID: H8gQFm41R3ilo7WPAPMFeg==
X-CSE-MsgGUID: dzURfrPMTi6NtiJaFprlOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="198429048"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 09:25:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 09:25:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 09:25:38 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 09:25:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/xgOiOgDqrNhy8JA/+SL8xpNzjiAFlt1cx46zjGiAq/7MwQav5FNXajQjHifWq+yVKazgYtRfE73so9Ra5HSTkaT2YRD1mM6EWx4C9TIBrlV0sd7mo30shrMDiKRCjnxQXMQv5UOtxMYP/8EnFxcbOg+lj5T4TYOYO2MwIpiEzbCYh0BxGu3qRmO9hVoFNTEhpFxuvr9BJGBZ2LibK9FjISTHa1a7Q8LHf2BHOrJMpUoL/H+30OhPOb9XXVNmd9MN2pI+Jhhj2pz/4zLpDMb3wrsQVOGR7W/To6FQnrI7BtP2PnZdildp6G6NYMbF754eImKbxbHw1GnVcG6nynIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmHqAX95abq60SeCkzIsIISOqIRlFIF5DrIBKoX1aoM=;
 b=MZuuMrsTwVZXM8odhmJU5PHGAgybkDe4BMAuXj1An/WA4FiWAGUZORxh2kgjSCxK4oJljlF62PyzgKtPc4CbW6QeWnorDARNEgul1LtLdVaolyRZQ8UtZbyau99TzULFp7PzUDyYLmKgldfAyw7SJJ6LMvCbG42aapCGQ6KvpKwdP4mKlUOnWlvYTkoPLPKsO3bHd6T4YR2GY7LF3eGRvtNd4JMhZVO6mHe9q4Q1uJ87B65VYwpaUJIltbwZ3SLrXmNZTJH9ONv59uWMDdQqrxkL7U8P1fcJk66uYb2dC6usEyHTeKilbdb7DMt5SQyeFxd4R2tbjfCs1W5j/ojWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:25:35 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 17:25:35 +0000
Date: Wed, 17 Dec 2025 12:25:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <matthew.d.roper@intel.com>, <dev@lankhorst.se>
Subject: Re: [PATCH v1] drm/xe/pm: Handle GT resume failure
Message-ID: <aULnjAabXkM9jVfX@intel.com>
References: <20251217131909.1226331-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251217131909.1226331-1-raag.jadav@intel.com>
X-ClientProxiedBy: BY5PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e29056b-4504-4b19-14e9-08de3d9149a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3bCK+gaPVEKF7vgLOWZg9tC1xzCt7MZAzTsj16+enEecTra9iOZ+bkyaCyYJ?=
 =?us-ascii?Q?o0lQh0CcT7c5mRq16OwYPENFTXPvDMnHBF5zpxtZAh+4fdXTUmRuC9647Qby?=
 =?us-ascii?Q?rdfkzXV+WtYW41Xj+IJFfERE2p5SiFQFdf2gpLlyaVbXq579QvcA9qAcQH+4?=
 =?us-ascii?Q?TR9r72LO8qLZ98NOG6JeoywP8Gujj/hJQ6+9H2JqI3Kh23Eh7KRK/aRBtgBc?=
 =?us-ascii?Q?MV/qbv+OHoYexNiRIAOliCMSTgyqIO0aa2J3U6fPLEoiPtg8iDCdNG9skkcF?=
 =?us-ascii?Q?Er54QyhhwIyPbygzAzcSrR+oS+fsaNe6Z3oVxSDNpC33FGrS4+hVFmpih/cz?=
 =?us-ascii?Q?Q8WSURd/ZNp5DHeD987b8OwKDpLzlcuMLz2XOEWCk+UtTZm5Uo6pC07c4Fbq?=
 =?us-ascii?Q?lox1N0nUGX3+0Jy6GeN7EGLE+BZqC8UlIsMFFPCIxjpmHQrEX0jwbX/AXssC?=
 =?us-ascii?Q?Mhdxa2TNmqSZdpGo/q4zZTw4HwKXhcSxpRE3c3zS6jHrP0buJPQJHCspGwyh?=
 =?us-ascii?Q?6RaGcf7Drr6EIFWQ/qVAbrTEJ7cM7CP8OpvxvFF1KRnex+w9TVnGFKnFCZef?=
 =?us-ascii?Q?nAnLkxrh9twns3d9MM0sNhi1Q+BJtkpfPVRdHnSWAtym9rYVPNaPOPH3JnoL?=
 =?us-ascii?Q?JUvDP9aSVcoVc6E0g+GPOWRsRo1pQg5JZPEnodOpCfhf/om7b9h6X2Wb5Zus?=
 =?us-ascii?Q?qxHY30O3n0E2gjum/onBd3S0qIxeu9QQZesX9eo6H4YygvfNRuSNQm0nLEQl?=
 =?us-ascii?Q?TFpOxC0/QIBbHQnIIiFbPz1rk7d4JNG1m1M7TtalNoYgafMG5CKX1eRxg3cJ?=
 =?us-ascii?Q?3PQF6vQv5hqT+81hsTPDt3yKtHZXSgJN4K0RmypHWuA1EXQRon+tHs5nc7vv?=
 =?us-ascii?Q?ZlCG9EkBny7xUWyAwi4IYbXcTDghSv/RbVGRzDsze90EHECF+m40B6Br0AIK?=
 =?us-ascii?Q?/AVnj3xdeiO9rW2XcMk+QskTFjU3BsdNRhUAOrqgEkgMijCm7aXDBiM7mP8J?=
 =?us-ascii?Q?lL++//fO+UuST8giAtRUeCYEDSg/vW7i+LLOIEfvM/cKmFSUh+jF1qJ5zH08?=
 =?us-ascii?Q?tvulm9zeDg2pl+wpHxkLaZ9ZSUv5JSvKfMHsVrTEJlIj0UglQprITIwuM+8c?=
 =?us-ascii?Q?xJX8e3FsacAQ126RnRX/Fw/0BtPHgrDmqVojvbZMnxJMoAZQiBtD364Cnaf7?=
 =?us-ascii?Q?nGEHxypITx1nf9DHe6eucd3wVD/SUw94Sfox7dzTOD4VSDR2zQSEkG9bNZxA?=
 =?us-ascii?Q?x/bzI+Qqgse2dkTO0Hj8w+tt9Ahj4tI+1ay7NRaqkOClmgIyuhlDdusLnvJ+?=
 =?us-ascii?Q?g80/r3a+9HG6Ey0KRSl2OtAZ8y2oYHuoWScXmdSYR/0Il6vlkkLXGnC+bsNh?=
 =?us-ascii?Q?W+ZHIksesPJ68Zgl41uZ64gPdoTChB/N+kea1f1MFUdgHktyord639FsvRIp?=
 =?us-ascii?Q?w5NYZFkXuvYK1NrQmqKNwucwF6zGC+hR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?awpodNCAiLqHc9u7pxLVszXawmT01F1t+EQK8um+ii0HH9rwXM7oqUxIYqam?=
 =?us-ascii?Q?r6LA51Ks3A0R2HIdJbAsQUkTqKlI91KUvVcSCRPcVlI+uy9rLOzIuLH4iDwK?=
 =?us-ascii?Q?IKrGsPclngdRLqWHxEfnHRwpkMRsg3v73G7ETPb0otRxW1gAPE20de8gPaQM?=
 =?us-ascii?Q?q42JUfbjeLTWf2mP9LuWB6SHScVLy0622O9cNyg/YyYYfmaumn8despDmkgd?=
 =?us-ascii?Q?D4WwDUrYEnxKZwvq5K8PNWngP/l7KaHobAL1KgyBhBqu+aJu1P6Uf/fVK8oK?=
 =?us-ascii?Q?fZ1yOkXhbmjlExHPLboScz/agrFc8gFzYR732wUV7rV9IyhRNyjjGAqVa1i3?=
 =?us-ascii?Q?SdIoyQjEI8VrvOOzx3Ag+mBKaRqxQOcggT7xUUbkzMFZ7knsTNaPbwU25KQH?=
 =?us-ascii?Q?EtdKR1erb5UComGINYizRT+wdZa6zZMl9M0Nuy2+GSC4JOh8O+ZGnijj5LQB?=
 =?us-ascii?Q?GVubfB4HhxfG+1W86rW6jidZTAYvgCfPIYLKcKenahwwIF4+3UMsR3xtuV/B?=
 =?us-ascii?Q?qRTV5L+J+lE6B8YZDsK4pJ2jxgQxB2iWV7O1vsF1iaEKL43WLzPlmdmlWYGI?=
 =?us-ascii?Q?nMubKw3TdgFKL/bSJiCfAUxrW9a49bOa85jOclF8n9DgELC3pbPI1uDirF59?=
 =?us-ascii?Q?z/neUP4doY0qiH94jhQ6UA3A6essxTIjEvNrVXR6S/IEs3SGycsiHTdDIWwx?=
 =?us-ascii?Q?SVLTXHtFhQFurfWfedfxVzZ7OiHZ3e98PvaVSZDXWYsJlwQId+AQQMuiHJjD?=
 =?us-ascii?Q?YPthaEm1k70ZSDsNSeFDONxMsQFC40L/iEhityKoEwHSOIP9I7xXK7UR0M/F?=
 =?us-ascii?Q?Xtr4p7fZLJeRaSsw7rGOmmX21oqdye4P6FgerELh+bf+qcB462BEkUaioLjI?=
 =?us-ascii?Q?Ih54ljVghRhjYXgt/AsFmL3WbAen3b4qBVKBGvjq1o3j2P3Md+xrCqPwoNdI?=
 =?us-ascii?Q?sEolePWRjJKM3dbpRFsmwhlgB4olpg2pkz3NBZFFDQR/zb9kcsC6fHUUDiMu?=
 =?us-ascii?Q?9i2cpAV5yepzZEiAhZk0W8egRjLijpQcNn9EHyireTXbBUzqVqPaWrixkeVO?=
 =?us-ascii?Q?S3thG8SNdXgQojO9LO7Xi2eN3vlDktJYgvVbonuzhOebV1gsTyZEF+V+PdTP?=
 =?us-ascii?Q?cC8MeH+sKXXhhZQdbrBOdDuSpm20yEOeuvRtRXcoRX+IJZiGzVt4Tnyt30Hl?=
 =?us-ascii?Q?MDYGGM/hlsJXrqXWF1YezqSECJ4ijG6n5X/atmvathXCKm5pvz/tF9ZMcrr9?=
 =?us-ascii?Q?Z8qd8HyvYHn5Ri6JTMdxeMjHHwJyZAVFxxhp202KYDNwoaTFy0wSD69wx16b?=
 =?us-ascii?Q?NE6ugVJCcFq58lT81sYegq0QgY2RebSfWIfkdFirI+v/V5gaXZUUmyWj889U?=
 =?us-ascii?Q?aehhoY9R7LAQeGbG6uOplIWQOxylD/XzO7763dEA2/dfKs2Ew0aiuuSFy37r?=
 =?us-ascii?Q?9BCKkkGO+EzwWxQD+P3kqq/nR31/GswuXpIfoUmFJQTcJRpQAUIIrKqBvbiL?=
 =?us-ascii?Q?TTuYuK2VovpiSi0s7YjtKxrepQchSVF2ROQVXe0B+BH5cLwg8wASgzeLsYEf?=
 =?us-ascii?Q?uvZak/B9QiyBKgU5HWRKW8AHW8v9OmX2i8i0CFaLT5XfAGyOEKUuw4Jy1oFy?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e29056b-4504-4b19-14e9-08de3d9149a1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:25:35.0113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSNEC+0GZx2/VDv3claATMpMtRT0/td+HCipaPqXtlFaLCX4VeLljRm2DceWk2+/qV6z0o6dikArtSBpLNILsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
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

On Wed, Dec 17, 2025 at 06:49:09PM +0530, Raag Jadav wrote:
> We've been historically ignoring GT resume failure. Since the function
> can return error, handle it properly.

I probably had a reason for it, but since I didn't document and
cannot remember it, let's go forward and make the clean flow.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4390ba69610d..a8b50091d62e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
>  
>  	xe_irq_resume(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_resume(gt);
> +		if (err)
> +			goto err;
> +	}
>  
>  	xe_display_pm_resume(xe);
>  
> @@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_irq_resume(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> +		if (err)
> +			goto out;
> +	}
>  
>  	xe_display_pm_runtime_resume(xe);
>  
> -- 
> 2.43.0
> 
