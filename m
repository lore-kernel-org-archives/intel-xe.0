Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A966DC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E77810F03D;
	Wed, 24 Apr 2024 03:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXPF7wgX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318C10F03D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713930936; x=1745466936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SSzmeFZnREbpgTJi7F/25SEH3aGrex9gf1JsQnlbvLg=;
 b=DXPF7wgX6Y7uE6W0u924/7uZY6N0sALdESacBdsY7wWpTmEyscoVxz47
 vSVuD5tfXtLaAL+0BWxQSGeUW7ZR7Gk8Uvt/FgQlHtFzWyBVs0d5e+AHf
 viBTLu0TBBGFCBmfJi6mciJAcn8LwICdm7d8QG4bTDDR3Ns0SLW+ZPAHl
 RIeNZq+1ptjXfE66EzpebGdFjR4/CffvNgI3Hvh15btA6oLgbObBtFONK
 icwJLCR9gfCOUk9iBmlJEvvDkS6rlx2MBCpbTPSpBlG5d2Fx9MCbP6Vfr
 tYdVawrx1VRu09jmXjX5lmD0wwKUIAt2D4dIr/a1sjTJxVggDFX7pIkRY g==;
X-CSE-ConnectionGUID: /TzDuPMARoWfJL2fTDd8Kw==
X-CSE-MsgGUID: WiElt3ScQEugIN7vwlSBmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9371775"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9371775"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:55:36 -0700
X-CSE-ConnectionGUID: 9S5FEQSyQaiP6nU0Ug31mA==
X-CSE-MsgGUID: khhAbB2PQx2nxxy5ms+68A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="25091344"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 20:55:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:55:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:55:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 20:55:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 20:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUQQIbhO5Nn8Eu0WtNKR00X1VGhQa3MWeAERuQjf+fwbmgtDo/eKpNjHJctQwxDsn70K86HCgFqe7WXjLOBLB8YLawcDCm4jOa6ucz0DIw5qDsZOQo9ZXzGXMQUYn+TvuL+ujEhAeNN8ax8YxnQzM4i79HvtgZWZohRJQFJVsAFEBOy+CsAPsppg+tKW2P987MsRWzPafVNB5ejfWjKpiJ2oEPmiHT0I6UJGXmtcI0UebQoURayYaUnqnPd52BVrdAu1FIykfNFcID5iPrEaAJK1SG3ym9y3gszLSzCgsUCcgjNoO5JA2z0lFJFsz2/QeM+ak9sPzHUM3XV7sPdvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmX2Po6oPR30uRCY61QAySCm1dNG4vqpoVdSws562AE=;
 b=mtb8koobWS+h6YVjdyB1qCOlvXY5BD11zT8kcTodPEzS6aLyV9JiEL8IClt2/QBPbwA7oKKcaQNN7CqWb0l6CO/nrTuHQ/zmzQnAi63+nvWNGSvF9IEVN9h6knGukhf9q55JzMBGWdXhrbDxJVQ2u/cb0LiiC81eolSmBocRXD8cXYGKeviRhon/nJhK3YZcLMwrVN1QdXVmVsFCB5VP40TPuH81ByIYdlyvl2qnPzQQ83mDy82LyE2fqL+FceXieUGDNzjA9Q7SI/S7Jv0jRbKAsSZD3VPqfA3EHg4DZeFKT+JZJUGHGpAZmM2W5qHjuS03d9PKyJevb5bywiiaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 03:55:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 03:55:25 +0000
Date: Wed, 24 Apr 2024 03:54:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
Message-ID: <ZiiCi8RUNDytoZoS@DUT025-TGLU.fm.intel.com>
References: <20240424035756.2169209-1-himal.prasad.ghimiray@intel.com>
 <20240424035756.2169209-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240424035756.2169209-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:74::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 8993dd85-0f61-49d7-ec31-08dc64125f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zJRD8FSwZz1Jy1YTdw0eQ+EUVeO9hfT6FAGNEtlALkFaW23PSuVkVUGmQuXQ?=
 =?us-ascii?Q?M4+tJDR4STHXXJeXRem7DPoU48JPH06Gf//60fef19m/ICjCjC+NOFJppiju?=
 =?us-ascii?Q?O+HyMi+jbD79Hzo1Nykltw8VE7PaMUXDeKMCoKx4R9HfesXJ9C7oBS8IWtSH?=
 =?us-ascii?Q?FOaPabY+6enKtu5h7XN6TUEPOpAH8cSdU5EfBEuaitGOv3ne6eIU6UAwzvp+?=
 =?us-ascii?Q?C3oKJQJAS0QaKCRxD5EDGatviJV5dh43Rduufpr5Wu6G4F16CdcBZa/UuOXr?=
 =?us-ascii?Q?gXew2BIM97ptWz6D/emJ3ziiXc5yasINUf9EMi3C6a+o5b8MWKSfpq+wm0WF?=
 =?us-ascii?Q?PiHo2EwFpjOQs6S6cIv0KL51P21e4tk0Wo0O4/KcQP8WZ/W89TnimBHh6Kig?=
 =?us-ascii?Q?amwXsQbWHc9tW37zRSDYIzMiG224qgDSkjZM88Cddg5w9r80ukfB91gMlJb/?=
 =?us-ascii?Q?ldhiu3fkpJdqCrlG4Xc6cgma79t57gXKz4CYxFOw3Fcf1dJlAiVLIskUf1Pn?=
 =?us-ascii?Q?U4uyVCF8QprIIz4SF9RPR6dSSzwfhWAjmk/Wfe0QD9lKfznqAxTOgCmaf7DX?=
 =?us-ascii?Q?v6wIYypJKaLIUxw8hZHvMbXJScR0NzdWj08kTxEkwpIqIY0QcOTnG1GXQeNY?=
 =?us-ascii?Q?GrWNH4He3d35lZqEQJjURQfTznCfCPj3qUMxsLlcM/4eMivFUc0mwDL5+L8C?=
 =?us-ascii?Q?3gxoRtD+98HWB4iSb+lUaL24lIsUCopw2M5VvBb2e9OTjvqt1zjUnc8RDWyl?=
 =?us-ascii?Q?fBT85SP6oKDBz61n58oByoY6neAnfoOA+h3i5nlBfAJX5BNW6ie//BuN3E9b?=
 =?us-ascii?Q?6aQSCwJLKDce80Yo8sHVaqAMfvQTe+WfGh8uWaRMisd2DcCYglmAdy8b+vK5?=
 =?us-ascii?Q?yZjnYbg9RvsGidclzHALl79TB8l6pMwxjkQ0f/8wGnyrK/zCd0vxslVM1crN?=
 =?us-ascii?Q?byTa+RnnfRfj8CYWEaNrNJiVEwX1UkW5hcCQZqJycI7ByfINPA65fSwtEsDW?=
 =?us-ascii?Q?InvdEucmmVoH6dCsiw/VfiSn4zq0sztSickKVU82/syZl5o0KimC9yQ3QLqX?=
 =?us-ascii?Q?WdpFIVdyfhURzf62ubRCzW1IlAIR82SXN8FiB3BGksyI0JNmX9LlHYJZHb3T?=
 =?us-ascii?Q?qMik2j404QqgDAbGIz+BCkeZYmUra74x0Ni9Fr7ojPXYYBx8INonnn8ml0Sx?=
 =?us-ascii?Q?yc78RO2/VsKvcbJT1bG/pws7VwDyMZei6ztM2pyOXnos80PLqZ1qW5u3UICU?=
 =?us-ascii?Q?JNC4owo3HjUqv83gEKdZwzE7xySgshwxe4omKPtaiw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HKlRq5G/lj8nBGeMqz2F3tsaSQE+6BNkqigNeUHcLRu1yqrplDeqvyP2I4SG?=
 =?us-ascii?Q?Rs8pGz9AOj8/QB2GOUji+7ynlmsljpQwy4e3wzM9iVTNXAsSZoJeVKovXxCc?=
 =?us-ascii?Q?LgJqLrtpNGqVvN/2PhjHTAFM09FSuRP7u5mk6l6X2t4IzSyCEYr2tMzuAicP?=
 =?us-ascii?Q?SWUdtkAwcxM/8wJZq4uc0zuWxa/vlTZOW0llxRna+ZGU3cAyEjQs+ekM09KT?=
 =?us-ascii?Q?/m4osIDWEI9oOTWev1Xtm+eoZTYs0OKC1P3qyA+ongWNxDfig88lYV23jhgG?=
 =?us-ascii?Q?ikNbWEJktL8M4g+1GRQSc25wKdITNDlwvqZ4fCq4gYOYDF0cwkguJruoGzuB?=
 =?us-ascii?Q?eV2MHPtwP1cs8+47uGtlluhh89rZnn55mLPEx1LJJ/6LtTdkUPIw9o3/m2jp?=
 =?us-ascii?Q?J887MvEoMPYwxubV+ejaWlCGlGNqLdT5aI+/KPLU7x1N5efsa2NKRi5urzEt?=
 =?us-ascii?Q?LSONyyfSkwhWjBCAtj7zcgfBdzRJNR5pQKuZlScLj0n6K8cre2Bkm3it/heo?=
 =?us-ascii?Q?lha1zN67rDF3xA2HVxJt0KI6iVXuKrSAkUYlNDfPoB0/N4YyH3NiYLYoY5+o?=
 =?us-ascii?Q?jvIHcNS8l1HfhUCXQ2bX9iXaKzCTvdik5hUWlvvYtfH6of7KCiE6ifSU5uyj?=
 =?us-ascii?Q?JzgCFcb563io7tkg1j2Wp6grAvzGXfYqHAz70NV+27SkInwAFeZ2vJQ9rSKg?=
 =?us-ascii?Q?H2ZiiM/EXK5qBIRtY1QTfPtL8oZSKGFlAvlpS0sKGxs3E/6+mph3sFJi2ln8?=
 =?us-ascii?Q?xpY58QybuBgGLK98ZybRKnWKTIY6iUy4q570pOgb1JNcfkj2UxyMh/Lfvjdx?=
 =?us-ascii?Q?9uMRcCZfx3IZNde3gakEE7G8LNld+1fTnI2Wke9Hl/Ny6mKEe7pgmYWpdWuf?=
 =?us-ascii?Q?WdjhcFL6Z1z9eWA/KJ/kafApeT5ihMRbfmwWtsJwkgVFUJBpUKwqCllH5CP5?=
 =?us-ascii?Q?ThlL1tfw8sjbIBXwjIb5iVBJ8qNUKQvgkkQO6AYPKDBGZXmewkp0KKFaNGOe?=
 =?us-ascii?Q?lUR40OuHgoPD0QEf6v5QK/LGEJ6zPUix5jSd4GfKy+eX0yWa6uh5YswI2XZI?=
 =?us-ascii?Q?b+ibVWR32q5x7ssEJCWrvwDPnzh5nkfkAKL86t3WRu38OnIDa+TQkWi6FUHP?=
 =?us-ascii?Q?y8I2ZBbxWtMjyug1kzEUbzUbgIu22u6iEEY40eZhGBMNMfsW/Wcj96EpcBZT?=
 =?us-ascii?Q?1kcPBjZwZcjvPitKHW0RzjXseZT9HE+xz0x1vTDGObqsdkDCjdcounje0lJz?=
 =?us-ascii?Q?ero29XCGV+AVxDpxluEtgIOs9UzstBsLJuPNfdDGp7/TJOEmt/84Y3ceEdfj?=
 =?us-ascii?Q?eiOaIx2ERFM1WGdK5raoWLd9FAW7jsnaKmrZtSPXMMXYdPIhlNPlDU9DKgKJ?=
 =?us-ascii?Q?ckX7toUiFbMpuuS0Hvs5RmGB2I7Tcivj8umECDujIM+AoEl7ktiRKvdVM+ml?=
 =?us-ascii?Q?rHOqe4uC6SRBjBk6qEWUKPfJuAEnFvhVubHTbHTwS1XSmbxSeM9CtBdNaX55?=
 =?us-ascii?Q?tISVpEtSCPx9iX/4xPHKvqZfDF7kX/zG0m6PvgBIYZSd/htDusY1cDvIf98W?=
 =?us-ascii?Q?qoh6S0eeAeO5kDql7+9g+DQOBnXLAy80c2FlmA54pmGhrr84Lfz1JoWTGj8c?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8993dd85-0f61-49d7-ec31-08dc64125f94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:55:25.6852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHnkoac6M9KGCIkkd/RphEpz0+zk2tFpLekydfErruKV3qJ1+QbGt3Ql+3CyNpKMX/h9k6kYkM6nLlhKDdf0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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

On Wed, Apr 24, 2024 at 09:27:55AM +0530, Himal Prasad Ghimiray wrote:
> There is no change in functionality. Using the helper function
> defined within the driver.
> 
> -v2
> Use xe_vm_unlock() (Ashutosh/Matt)
> 
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 85d6f359142d..c350c561e7d9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	drm_gem_object_put(vm_resv_obj);
>  
> -	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> +	err = xe_vm_lock(vm, true);
>  	if (err)
>  		goto err_close;
>  
> @@ -1323,7 +1323,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
>  	}
> -	dma_resv_unlock(xe_vm_resv(vm));
> +	xe_vm_unlock(vm);

There is another dma_resv_unlock below the label 'err_unlock_close' too.

Matt

>  
>  	/* Kernel migration VM shouldn't have a circular loop.. */
>  	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> -- 
> 2.25.1
> 
