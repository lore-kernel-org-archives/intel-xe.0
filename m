Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE32AC52D73
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0CF10E62F;
	Thu,  8 Aug 2024 03:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx3QyDKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F125A10E62F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723088807; x=1754624807;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n2Vk5dqf7BJ3P4G6TvUVPYiR004NhoMNNZasrAvlaQ4=;
 b=Kx3QyDKRZn919s5yPW6mYGmvig2hOw7pan3QQj4C+RQnFLheSfGx2p2+
 Lfd2aWuM+c8wCRf7K3859v6ZJ5TNAk+8mSS5y/ZnDdXKGYwhBYrekQ+AZ
 JwMkqpvP+DGexCFJ8w8QRhAtcZGVPY+Kr6P1lB5DaohnRPk90JBlzjyQ+
 tIpO6dMCdNIdg4puKnBh8hNiJIzh0FtnN9Iaf0uqOxi0iSKI4tSjrQnmI
 5VDbY+Di37XQ1/HMDQx705Rh/knvaMxIIiK48N7aEazkoCXIwhQ+Lec8R
 /Id5IeAz2Yf1+GEib7LooB3kLRq7c6SZ9VFdhRmVgxHktOKSwcwAO3JF/ A==;
X-CSE-ConnectionGUID: /RF6nN/zTDKwj99TeJmlNg==
X-CSE-MsgGUID: T7Jq/qMUR1+lvcZjYiiFiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31768918"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31768918"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:46:46 -0700
X-CSE-ConnectionGUID: ecD7zyfzQnqL6m0ddmcEZA==
X-CSE-MsgGUID: hOrEK8pPSXelFVt70NPvoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61732070"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:46:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:46:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:46:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:46:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xizWyaizf3dbwdPgfnDwHlZA64p4kvCXh09Eq8CrPS+YCaF8JniPPmxhW3jEo4KKLJD1DDhEO3GBBjgkmOFDtkWnza1qYrO00hhmjFrHPIhLxqIe1xJlen69wre8Z8b08wVFRDq5X8OO0MJBfJE4WodyTMwPu+YgaANZiAl4MyVXtqN+Oq+DsLxZN5JWpIvP3zYvBqb51Aryyo7QKhi2UMd+ZohgDRMCJP12Kvd3QbtcrpSi5A49MtE8lBv/VEisyED3wQ5OhU1uetHIcjwRA+MedgMDK+hDaqSuAOFeVCOKh9TAUCD5l41RPW9jgaNzRpNPRds7ZX2F8qQZAJZiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scsejB3wUvW+eABQPQJ7v2am5GQE23idaOp/Xc1plN8=;
 b=BNO+F0omOOQJw8AnrS6o3L+C00zbn8ve92wF3g2CdRrOd4Lkhs17ku6/AHW2CvXWImE3Z9cMhNk6x0gUTfdSSK+jFDJW5FP3P0+82+EbCtFjbsA0fudXmdJhd1JCX/gmbpveFLpvMwAYcjgCroMpD6xpbpuO4JUi1ZGm+odkgYWfGRJl/9kaAE0PpYbTS8B8MmOE0Zyw9wKcrI4IX5+F6e+Pl9EjikHN0Yz7hrTmVZhcvA72/xX8UxsJ8eUJF7tpeMGwONeZq/025bMF5ffMIrf/JuZVm1FTGt3TP9FBa1Oo8yQIYlXVod7Iuw9PrnKD4sm3tkn3Dct2nWJrpGvpMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Thu, 8 Aug
 2024 03:46:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:46:42 +0000
Date: Thu, 8 Aug 2024 03:45:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 12/13] drm/xe/vm: Remove restriction that all VMs must
 be faulting if one is
Message-ID: <ZrQ/VDDIWSt1ZzZ4@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-13-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-13-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: c1205bd7-5256-4772-3b51-08dcb75cb7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZJzjfTM3PutA4swagr0BtrQh8VAkINe40RnKyXc2cUkKTRzCnKdn1C+tHuNg?=
 =?us-ascii?Q?FSAiSTPCcZLREasidCBA2rowVLK+hlsyHtzoHbsSPUVLYAYu5bGy5NtdwDWW?=
 =?us-ascii?Q?YxW1uicfT3Oy5YNvElv1cE01nrxDq6Jx9+AHwkPp+ki0EQQp0iweYhma9IM4?=
 =?us-ascii?Q?aUBzGo6rA9CXgVu2AHuaNxkn21gKN+04HisqZW6tJ9TmhkBPUdgBenLlt2bV?=
 =?us-ascii?Q?6jDwHaPdbk6durh87gCZA14yb+fenTpXMC46f2gybwvs4jM84PKxAOQptfyZ?=
 =?us-ascii?Q?JD4bLcGkaGPbJ/TppatP/ag27Zo/vJkiViPNN+sl1h0jyMcB2ddUqcCbuvIu?=
 =?us-ascii?Q?dJcDBXBIsm2elVRbArhukmLd9w3U6L0rW32m6NkAkQhbuhVbVsTHLwIVOTm2?=
 =?us-ascii?Q?g9JTamIE3DayLdtrybU9sxxgRhPUBPNoDJUplY/fCs7TFjQMZzEhPMXRQ8ge?=
 =?us-ascii?Q?uu/Tc4eV/WVKgZBlSAgUYTSbTGIpAhiDfCBrY2gr9OauWasdh9Y5C0CrxiDX?=
 =?us-ascii?Q?dPRyumigOEbjMp2URM7MktMrOBZIDsnjOVWYvpGdyvQ+OKrLDA7shZYhrfVy?=
 =?us-ascii?Q?IJ/2+HjspCTY1HoQyMvEBlsOa377yCDR00f7qSdqc5C3xTJPw5jQMl9ZmVVV?=
 =?us-ascii?Q?Vqnif000rFq7yRmDzGvVvE/rcYerHtaVqIu47/k2peKn45MCucsqoeQeoszr?=
 =?us-ascii?Q?9N2TjGLnbhqckBe9CqHGSx9qh373kMGMWu0o3ILsu8uGwUtANNczbdwLxeV7?=
 =?us-ascii?Q?rp27G57cL0FhzSMOxQXSNBaxryFzTVMl+AGeR46l+0W1BbyyFf1aecV1mkXF?=
 =?us-ascii?Q?TtyZ9qvvOR4IQYeeezrGD69dtKN4TCUQp0zg160PQfcXus4XY6s1vBGtlaWG?=
 =?us-ascii?Q?VcU2pUt3HP5zFp6vKSMFc7KoPLHRYTwMJgWWRNEZK1tB3yJmZqIK5R3Ocox1?=
 =?us-ascii?Q?MNyKu1/qU/hFIEYL4Ch38xgFiHjzOI9Z8OCMc+iXUzx4B+HpPwDEaEmSRnfI?=
 =?us-ascii?Q?CV1evv8QWB0CL9erVRile9J2FwZqTorcYLV2hjAv/IRa6zxwoHTt2Zh8/mLn?=
 =?us-ascii?Q?sPQOSK8UA+Np7wG6glZGO8tbZK+Ks7vBPHIR3lrtkyXcm3Ue2UUCeXuOULyH?=
 =?us-ascii?Q?T2/GsTvxSIFDrwxyhZl3zMTH+R7nZ0z/L1yXQdHl/D/WqrF9MYjbqnKXlvzt?=
 =?us-ascii?Q?gJU8bx2iQUEk2tcddhiCF0OJqrBMFKUNObGl7C9QydmPRy5MLwTDYPesvAnN?=
 =?us-ascii?Q?siTqtYUXLNbqnw/gEAw5TG8ABi2PzghGiC2njdk1StzrnKdoK+XM1EaIcxyd?=
 =?us-ascii?Q?4Q/ZAlUV3AbT8Y3oQdzIGU9soiAVqXx6cB8NdmXexhDJcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dRr2p7y35OcxrdijGNJ+HwnbvL/MlRl/9IJVhRlo56KNLjrjEvs/eIfunFhz?=
 =?us-ascii?Q?d1YijN2E9I8xHsrvQ8qAJwhPaJhsAL/8/PBCtUS/AT41v1JenWQeyHKwDLtL?=
 =?us-ascii?Q?9PwEUDsSbt3Ccb82yhRU8TQZ0xrinmeMKrWyVCevyRDeJ0ttSgmBms3YB/nd?=
 =?us-ascii?Q?pH8f43N7/NQUVAIODv4N8LLSe3Uxfwd3N/UIz2ie3wPby3JveVitH1ajBKIt?=
 =?us-ascii?Q?z4kp8JD2JuGMejE0hfozs32ORk6qOzle+W4JrR1WOeFwsY7U2MncFKaz8Wm1?=
 =?us-ascii?Q?S9KYNtINaPVSVWdhUsTwyH1Zf5X80GzaUFufRUvCjnmkFKC5jdg8Rxd5FDta?=
 =?us-ascii?Q?/6TZC86HedLM4ZEhnAjQj9FgCK27KH/A3+0TdbZE6XULjVOM2BBCl0OlmoE2?=
 =?us-ascii?Q?DhwsdmrUopkmzVwuK11krTS/m2XQxFWdnhSYvB3jQ7QqlknqnS3wBeG00XfP?=
 =?us-ascii?Q?Z+iVCD0ldpFF1MCfwUrq1hVDA+u6DmEol6dtfwwdMprWYenhcvC9SPd32nIF?=
 =?us-ascii?Q?qLN6wT19pCJvZ6YVIcql76Y1sCEcU8d2ih75+XvtEk90easuTgX2Jc/Hu1CE?=
 =?us-ascii?Q?3tiQtBOLAR3qD6KuJrW0DAuQx1umX7RW2FFbmnqrr4wfl3lRNcRw2AxrVI6y?=
 =?us-ascii?Q?xhGmqrCg31iDJYxvI2W1hyRMz6xrNcG5ArQT1FxXpFJsnRvebzTfbZ03VSj8?=
 =?us-ascii?Q?lhjYAy66IW+0XTL/oxuIWiTreDrbhL8u4IWdKOSTdZx4d0N3gABzBULApbka?=
 =?us-ascii?Q?+4RnCr3mBvpWpXrPmcBWU/eOMjWrmC4xrFIdlogRI+BLPM9iUZdYLUUNQOua?=
 =?us-ascii?Q?AhG021IuZSsoNjcP1TGh1ThIiO4BWemhymnxCT5raM9qzPoBy+yu7JRovNNJ?=
 =?us-ascii?Q?uxCpG8HuaCjCkWtgJzm3GcwdaKQXwauzesYeG3UEgzwCr0HKGT5QJCAxEJQP?=
 =?us-ascii?Q?K76N5R0Lgdib/5oNdYfh9sJ9pFoVx/UsaV0yToRag7VoFWFVhtZNu5uk5ck8?=
 =?us-ascii?Q?VVilH2bBZ7tnNbU2+I/RX1l1lrrGpw3g+/K8qQTFqY/KeVYz4cof/oMDsBet?=
 =?us-ascii?Q?ptY9oRvof1SO7EWQ1ha5vkwSn8wt6k3tvSzQaqhkAzTcS34942odiOeidY0M?=
 =?us-ascii?Q?IjJITkG6iGHdKlRGse4/g9/QlhCqJFtxn8x6UuIQ5yr8Nrb+K3mtuSKOAtA1?=
 =?us-ascii?Q?/oTITPZfmCn+w9ysV+bCmPVYxa3DkkYLR4LeIxm7Pa+JVlIbTQ9cdKy6XfVx?=
 =?us-ascii?Q?FAcbiOJ40ciSdUW9rKKMugB7BWyc1vNMDU0UielzHntdXOGwQh9kFMC8YOEJ?=
 =?us-ascii?Q?bzBC+4kMzkJN0kjSzOwyUyHHeoWnNwZEdG61S+W8kyppdQMBst5hcQQ39NoM?=
 =?us-ascii?Q?Lx2y6paPUCqYq2+WPoloIdaenG8o3IeZXBuEJUHJP/mfqrjpUIB5DEm0ne0T?=
 =?us-ascii?Q?1m0iY7orHOiEwbg2TBb+N8z0FUddEps6ksGaU0dwrwc3iHdKcLnkNDshwi+1?=
 =?us-ascii?Q?WSBFumXipVLcvDDrBFY2cbC57Vka7yiBHLzbnho0JpK0a5ilwAgfZq5Iwybp?=
 =?us-ascii?Q?WRQpOpRGVMd9fT4jNvsc/ZYaThFXxisodyjvt8Z5XpZPepDTI7jpDe5/t/OQ?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1205bd7-5256-4772-3b51-08dcb75cb7d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:46:42.9198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8ovvBQxawBa6tyxd64KOU7UI4WhaDbat+Zlkud4UTqPwuRyMWsXNZjNvdGIFbRo5M63v6ahKYBOWfiVng7vOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

On Wed, Aug 07, 2024 at 06:23:41PM +0200, Francois Dugast wrote:
> With this restriction, all VMs on the device must be faulting VMs if there
> is already one faulting VM, in which case the device is considered in
> fault mode. This prevents for example an application from running 3D jobs
> for the compositor while submitting a SVM compute job on the same device.
> 
> Now that mutual exclusion of faulting LR jobs and dma fence jobs is
> ensured on the hw engine group, remove this restriction to allow running
> faulting and non-faulting VMs on the same device.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b715883f40d8..7a88c65759c9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1769,14 +1769,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> -			 xe_device_in_non_fault_mode(xe)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
> -			 xe_device_in_fault_mode(xe)))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, args->extensions))
>  		return -EINVAL;
>  
> -- 
> 2.43.0
> 
