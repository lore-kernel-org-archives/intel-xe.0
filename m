Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECAFC4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 20:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E7410E1FD;
	Fri, 19 Jan 2024 20:28:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E06210E1FD
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705696135; x=1737232135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oRlJ4fsPfCpje9zRHMh5f9pAHfaEcHGRiHnwB6lnFPQ=;
 b=DhDiVMUG5XlZ5DMjIT0Or5c2CAy+3ToSbs3cBicVM6GWn+U7w+7EjGVa
 B739I3uJLtVeR/uBu78SXY8ESB6YcTaM3HF3+7ec7IRSwM099OZMCN9IX
 GvKsTgdtxWKTnSsjVWyem1fwI6XF+MLgOn8linBf1bnX2aQ9IRVTxd8Fi
 UU0zACMhZ7hMPGXpHsgO7gugxw9BI7oX+TrzKw6LDDXQrplkKQj7Fqq21
 Pv3om8IGEp//g6djzM0TUSvw19v2e90li8nQfNQL2XuDwnDraOG7bkrAJ
 GPCL+mMxnETr4Fm4PKppSCupf36KMKkaKCuNRGBKK0rSOYpwfDQScH59b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="7588217"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="7588217"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 12:28:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1032040909"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="1032040909"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 12:28:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 12:28:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 12:28:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 12:28:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 12:28:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKx7+vqzDJTQkSZ3QZEQ5hT7UiRKYk/hfH1oFJ7fxQfeMAeCGLlF642B5t5Vf9zM7n86ZMBeETdyEDPqrb25HJ5rlvtNP1eZWeamYRGsg059tC+Vy31q6hthEEJXTafzclZUF6OcwZFlQ0in4NvLygzFXghj9bN7rRBPqKHGyKSGdfXvC+UMAPHYfs+CRF0WoRRipEN0OJgxcviJUD4vrqDTt5t4+eXr9lJceXGJkfTo+y6l79H6IFlmRWIscrWp4SAp1xy6994WAxSZBkqeLXBIfrbm2jdwbrLboPA5osCsh16OUxhZ6+V3TyfW8Pr9dJEBugidRnkiqh/GggjLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dX8wXDq1ON24VVg8mTu+IX8U4l54P8U00MsmnTSdRY=;
 b=gYxCJtZlU3th/a/+KZVO2XrOvfRkBElh5vUiHVnPLUzZBTt0d0DrOvB9eRcDr3oMW7Ye6RMFxCo2yFrb2WVFObofX4NTIB48VRt9FxHjrvSDkO5lW/sL4fsut4k46zVY5FpKYaghAqCIZkgmb0n6luEUnfF4WwqpsUjpSafYqiyn66zz8fTyXCn7nCO0Cz/73FHySaE87StGgLDqvGkcL4Nzn2VCd237BU8q7Jahs0AbmZkM/3mXZ6m7Crw3PGzeIiJ1Fp3cHgiQZZWg8TfrLbe6uuE1wnNkafqUR/ERpLCfZn5L4YTH3vkspmH3EBOEfh7GnKckJbC2rRQn4J9hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 20:28:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.026; Fri, 19 Jan 2024
 20:28:49 +0000
Date: Fri, 19 Jan 2024 20:27:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Moti Haimovski <mhaimovski@habana.ai>
Subject: Re: [PATCH] drm/xe/vm: bugfix in xe_vm_create_ioctl
Message-ID: <ZarbGLxjKJENYDV9@DUT025-TGLU.fm.intel.com>
References: <20240118173155.3851635-1-mhaimovski@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240118173155.3851635-1-mhaimovski@habana.ai>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: ef142861-972c-469b-5a95-08dc192d3e61
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsUcV3iEicUoE/2EJCqcrwZWdkNO0GjK8OAf8bbMmztOqBGJuifulikNkQPRaWWjl8w2A8fmTLmrze7GFCQRvs2cvqVQRlUBqwNJKS+iD7rtv9bFXI401ErUEL6iKQS2pcUuuffrrcDcRBxSWDUTHX7Xd82PcjMXlcYlfOHgn0HrI8uHyhq9P7Ugwmcko0wHtsdaOlxebXFmXxTdBO1HWFfRvuOPS6IJ9VJPpdN9kvdWyPOFapig1DiG56WDWNrbztwwtAeqFesAMHuITCMvjTfi9Yf3t7d7awszUeZ7jQZm8GyeBRpqdgbkTn9dFW3cOGvh9t5lRdPo4bx58kdeVK/JFBRHfAxuvKIO/TQ7Qco1CKZ5xUSe60P+O4tQoTCMGUD4oCofQo1bWd0S7y4F9Y9dhx95t3Ori8fntBtzAKfA0XqbM5E/AqFhN28cHuC6YqaX4Mt7+H7jI9nRAbHNRiIoMQ6sttMGfqeGx47XDZWPM16ukrI9BKWvSx3jby9DJgbW1BowDWIn1uJJD28HFm/Nz4bx6l4taJvcWSaH4AfTUBUEXz3ILEEUu96zbKnc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(5660300002)(8936002)(44832011)(4326008)(8676002)(6916009)(316002)(66946007)(66476007)(66556008)(41300700001)(26005)(6666004)(478600001)(6486002)(6506007)(6512007)(38100700002)(86362001)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZEHnKqrbnekV6CySKaRR46UC7HZB0wLZnU4TD4O6gdBBl/d4EQmerL/F5y4b?=
 =?us-ascii?Q?2jq3YcrF2gj0cDT9ZpymxeLDERcmUK/977end6TaAnjdl52Voo85Uu4Nmfa0?=
 =?us-ascii?Q?78pTFEJBnvSIu7eXNwJaH4/joRW+JoyIo/Ui1OIFuB/H7sjM8eUJRquQ2C6D?=
 =?us-ascii?Q?qHjddRcvczbtWbSiJWtUHcxa0UkCgJYQyC2G7L7dzIphtNPctK6LGLCtbKRy?=
 =?us-ascii?Q?tMhLE7ZD8ggKj+GgyeqJYOSozil1hdMNolMs1C3BEEPu2or3X9hm33eDnCy8?=
 =?us-ascii?Q?ISSlMfAPoDoEQ/hjPSsUIN9t1YoLwPRcxffe1y9u0ENj8sUin5AZhJ+rAcDD?=
 =?us-ascii?Q?QBGmVUKEOwhiEW0bgatyt4v40CAlaRVl04MNM5nVuCuMSS7po9nrh8mV62dO?=
 =?us-ascii?Q?MuqSMCx8LEuMVokQ3NaW5fpPhcUXRLIetvHZNYEeYHpF+VGgHoI+LR0wIzN6?=
 =?us-ascii?Q?5PlTVJRJ7RLIFqP16OLnVXPl5fArS+TLBy850aHf1waH9e7yXQ0rH74Diqlt?=
 =?us-ascii?Q?cLnXfMMVfJVtGZR10YvJjX5cZbhw819Kmlq2QzH2N7nyucjMs5f7GBVm7R3q?=
 =?us-ascii?Q?pPJE20oJpvjzs/8+N93tX1xDdfWPo0qYm94CxH2VWiYuwi9m9eZRFRgESMQ/?=
 =?us-ascii?Q?i86K9s0Fpc+LVfS9pvz3izALcFS2P79k4Tocv2O8GEk8mNXF01oBoPGS8zbg?=
 =?us-ascii?Q?ZRk8qHGpaWcWmWShXgQbfAqWKeC+MV/ryy0zRCxmDDrsnCeF964hnlHwUwVf?=
 =?us-ascii?Q?45Y7HRdhYqiKodrUL4wOpnGMmMbaldsCZp+MR7S1dK761k8H2J9tKF8lsMaa?=
 =?us-ascii?Q?pmh4RdWrWWqNPuwgOKxv9BRg4JG51XchB3NOlC0YXVV0BieRRN3XTtWC8yMb?=
 =?us-ascii?Q?Umnob8pE3f1rb+07N+Tvz8RxTl0jTRmalgfwj5+mhYwtaHgSrIaaS1WE4IFE?=
 =?us-ascii?Q?YtWhmsN+rHjUDYcKW26621VhCWyqwLB1RoDUwkiqOULNXvCb2CBgY7gNt/W1?=
 =?us-ascii?Q?4aMAgTng2hWEIL2w3LoxpdVCX2WhOqJpP2Nq8p+necqOd970TdwBWGeeq0Go?=
 =?us-ascii?Q?zRMm+tffXWi25/199s5WK8u9ChU5WecWzre41jj8PlQOpt1+AW+sirJ4kf44?=
 =?us-ascii?Q?W9fqVXsEJB6EfJL+uFz1WRgmhq3knKHkk2hNDACasPRJ9sepbReLceFUW2Ix?=
 =?us-ascii?Q?mknRKSIUv1zfoYZpdRy3bHwhZQg+ldGbugbrU4epn5paTFq0+SZekQvYWoAL?=
 =?us-ascii?Q?jQWYdm8g/sQXb+ROoCrnSt1E5Pd5CyPc8p0GLBBmwd96dX/e3ODXaFy9tNLw?=
 =?us-ascii?Q?pHgHDVECYpKRHPRJqT5kFxEf2ttPPYGuRCw0eJBvPAmGspJ+Gqc3VcLMZXmH?=
 =?us-ascii?Q?sGwn+0W9ravIsbSM41acbCiUVb471EhQeujLX8/5AjIV3Zs1IPIBcJhlo4tW?=
 =?us-ascii?Q?6KNNsYoPstBoAHQfBrjavrtEQo0JeRdCN/GE23XIH2DO6sozMTv9toO//G6I?=
 =?us-ascii?Q?SLe6d3YnK8tUBCvHzgGpr4dAD0PULmfY3mr7go1ETXfvnhCROW3Dzii6BHbL?=
 =?us-ascii?Q?IYGy3QD8L9MFxy5t+7k73HEkmb6vqbZE0sg/dG5i9yR1nBaHzbasxP3VCNK6?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef142861-972c-469b-5a95-08dc192d3e61
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 20:28:49.2095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmh3A3ksz8TfIDc3W5XSnHHOrYlfBCKePxlJSvxevsnBIb7VYcRrrASCLtvrNTVr96OSFJ09bbF7ISL8SBdQQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

On Thu, Jan 18, 2024 at 07:31:55PM +0200, Moti Haimovski wrote:
> Fix xe_vm_create_ioctl routine not freeing the vm-id allocated to it
> when the function fails.
> 
> Relates to: FSW-1360 xe_vm_create_ioctl does not free vm id on error.
> 

This needs the following tag:
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

> Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>

With that tag added:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a7e7a0b24099..8dbe13676a2f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1855,10 +1855,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	mutex_lock(&xef->vm.lock);
>  	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
>  	mutex_unlock(&xef->vm.lock);
> -	if (err) {
> -		xe_vm_close_and_put(vm);
> -		return err;
> -	}
> +	if (err)
> +		goto err_exit;
>  
>  	if (xe->info.has_asid) {
>  		mutex_lock(&xe->usm.lock);
> @@ -1866,11 +1864,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  				      XA_LIMIT(1, XE_MAX_ASID - 1),
>  				      &xe->usm.next_asid, GFP_KERNEL);
>  		mutex_unlock(&xe->usm.lock);
> -		if (err < 0) {
> -			xe_vm_close_and_put(vm);
> -			return err;
> -		}
> -		err = 0;
> +		if (err < 0)
> +			goto free_id;
> +
>  		vm->usm.asid = asid;
>  	}
>  
> @@ -1888,6 +1884,14 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  #endif
>  
>  	return 0;
> +
> +free_id:
> +	mutex_lock(&xef->vm.lock);
> +	xa_erase(&xef->vm.xa, id);
> +	mutex_unlock(&xef->vm.lock);
> +err_exit:
> +	xe_vm_close_and_put(vm);
> +	return err;
>  }
>  
>  int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
> -- 
> 2.34.1
> 
