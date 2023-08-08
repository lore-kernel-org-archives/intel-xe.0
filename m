Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D579C001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 21:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F0710E104;
	Tue,  8 Aug 2023 21:20:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1D210E0F8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 21:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691529601; x=1723065601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Lvf3XKftLmc8hqGQWynpJavVgzv/ZxNHZ96YQ8HvTY=;
 b=FZ1MTEt7IiUKL3+0XCu5YhL9cGJAe3XZDnfi6LzYBSvvYWCU1bm6t1+I
 TV48GQxVDszN7wrNQfP3CN9iB4JlJm5aYM5yY4vbRdzxanGEd/iN+AR0L
 I3AS2TWLD1grA0n+bG8y3IYBvDs51Cr5hfTs57Y+YGiFjP/l2iE3iY4C8
 fw6+E98n6QbzZ9XVoghZV4i+6A8K5NnvGoIESR4lWFTMyMMnUUEerg6gH
 5qdYe72eDpHrSMZBZSSPFv82cm8jor+6R3AjZGy+SIwLMpOOjVkISMcUg
 KWBQjr+/LRH1VlgCxqSFlCR/Vf8xQ7Pq6uH6oZFYJ6eAGM2+A5y6GmwC8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350545024"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="350545024"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 14:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845655571"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="845655571"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2023 14:20:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 14:20:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 14:20:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 14:20:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hipDvCMI0Ze0vxTaQFaazxSKVkgPm80a/v3Bk93Kqi9zXFp5TTvs07L11ZLVzkd74Mj6aXQJF7fVeiC/0Su0yz31As5h6xvGIqzdRtwx5YX07Zj330yCKEa2n/ZJ8CVdou4Ugo6x1Jyy1IawtildC/6IeRiPwDPAYu+VNjG1Yb1xjhu9CZbDV37eg0CLv+DEBtgL+WnKX9UWqBb5BiAnjPPoi4SYrcHQPOJ5QOMbiXxYxZaBomtj6RLfy6mmLOTe0vs2780HIAMK/ur0ovpcXpvtjSA/pku/Y3sA+dfQaCXU2Zhy4Yh+maYTr6GazqNYm9R2RW9O5g1G9kdQsrCPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdikrYXKOLpYRNb4JBcQThFZLDPTVeUIWg3uBuCmHnM=;
 b=M4fWLbZGejteCTDGsKyk/1urfIFxsINxqDF8fdmd3fskd8Y7OFGnDaId/B2mutJYzdJn8EpJa66Jd1/mgTiKCM3zDbaltFP5Mb7yuedk46q6M8zxol8F2n71vhaz8o+P5R5SqzozwKvScDEwaT/bMps64yoMblVHATaw9a8CIr4Ax1Mg3H8LFoEuV63Ji11BAbZkgJXDJPFXPKdCQa7AAJCFdVN7FxOV+c4ncmKLITxnvaKulpyE+RxWbnMdFMjFcRbX3IDaCX34VRG92k0hYyOkKNP31HIjytmMIkR/HTqTThlnm+ChAejTfbahvxkz+Im6bxeJB/OtANgkN+BuHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5430.namprd11.prod.outlook.com (2603:10b6:208:31e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 21:19:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 21:19:59 +0000
Date: Tue, 8 Aug 2023 17:19:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNKxe3dUcaZ5/L5+@intel.com>
References: <20230808091208.112793-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808091208.112793-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5430:EE_
X-MS-Office365-Filtering-Correlation-Id: 280ad7c9-7d56-4dd3-825a-08db9855385b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Daw4dTxiChNtG/5oJRpiXOXJop5jhNSqI0T2L26LgPebcA6WolT7XW43CKE4LPhpR96puRhO5Gg8mRHTu/RfewtFtZN+dKwxuNWtF1uzivB1bdtqqc77zck3XMhOISAD9Ccccbr3d97zeHgtW4dDhIy2XkkOGfpB7ghClglNLIEyREjLaJCiVocXopxjuboNYxp+6cnPJrXyeawK+LPIm4trhzzE+FqzqmyL5uJouJ1sM0Svb54lR3oagIjHMj/7I9CiPkGqjRNUHOjciKqOQKDl7UhGtKky+zFNJY3rTiXFXlj3D/TpQsLs1yxupq9/HHKCtXlZpCDchsVG/nQv5qPXOqA3omcI8hNQ94FeVLhTEoTxRsVsaEvnMYzQ6l2VSUQYalkwfh7W80rgU7lwMksgciSf+y/i2B2z61s7ZYtLOLiFlzFYHKK+QequWDLdpeWNdFHrdNlHvoWFo8nqtIuEjUQtnZoRzT3IF2R+c0TWFWwVMDvspHiar9+L5hjBFf/5m0BCibDMsdlNhow54r8AD4uAn1i3nE5VrjZ9OAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(186006)(1800799003)(966005)(6512007)(6506007)(26005)(36756003)(37006003)(38100700002)(5660300002)(44832011)(41300700001)(86362001)(6636002)(4326008)(66946007)(66476007)(6862004)(8936002)(316002)(8676002)(2906002)(6666004)(66556008)(478600001)(82960400001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1/NKre4Cfxaz5AB7yuH8nMnBpLD0EtljYsy8M/aVwmLUQdMG6KR/cdGwxSb8?=
 =?us-ascii?Q?bpux5p6OiUVoiYNYfLLJkjnqhD9ZiHrlAz6N20ibrylrgYrC1CD3iH7Ya5U4?=
 =?us-ascii?Q?gnXjNlvHyj/ma9Gr8eFSa8g7BaT2hAL2ya9hvIrVr6HO8z1wHRU2sfYeeEtR?=
 =?us-ascii?Q?p9Q9D/Ks3Z3kZ0gD8ZLTyCYNa/e2vC55lIGtwmrIntEt7HSVE8k0qAUH9iYd?=
 =?us-ascii?Q?QXd7aILLGGQi+TpUPsdyWOAcLm321amZE2MtsQDIfpUSgIwqnJvKkRYypgcn?=
 =?us-ascii?Q?Mo+LTDWfCcm4e1C49ekqm5G+JjWOVj0wHLgEtSSA5pcTgA/QYjeoSalzycEK?=
 =?us-ascii?Q?S22MXypc5EZXXRXldyFcAADUyj5FLkZhj90d3AFZcj9DOBFp7V01OgPVWQK+?=
 =?us-ascii?Q?hPaCLIkIzRk6hBuV+AFa/igwH4AmdXaztwTo0OcylDhCuvALKgas+H3dpV6f?=
 =?us-ascii?Q?6bqZSrjhiPl8aqJWoGhRDnp6PwnKfgqwHcB33bHTpQ+P7wNxDPWz4onvRD6/?=
 =?us-ascii?Q?2TCXZIsAbeD2ILx2lWtj6Fywt7DkLVC/t+SbwZ7H+oergH3p4D1B9hV8Eqku?=
 =?us-ascii?Q?O+5cTAtIi58XRDSWzJLIwiFy7Ks6LFlE8EXuSU0JABbwHgqyUQwmAdmO6GfH?=
 =?us-ascii?Q?wQyXBVFjKhVKaRp5SlOafUTavbA3WGkV7tI9sDufQpk7+Gkbyb6gyFQcu3JK?=
 =?us-ascii?Q?4QJi2AfzodXqf1DfRKPDaHvDQXTQiWRxlCaTPJJaAc1j59fQUhJEfsjZARjJ?=
 =?us-ascii?Q?7KTEDwqtMjIt6PoY+uWoZj32Ky/23ktesX4wSGroBguRHhuNbciAzWgNmkVw?=
 =?us-ascii?Q?Zmm0JsOu5JrbD0/ly9jY5SjUH98g2eUj9BHNNEkz8FQpVDf+QtXbOZb+WMUo?=
 =?us-ascii?Q?vIJguKtuo22aZPfKjDU1/WT3nyKY/VnRE6BVsP4L8y0M3jZbOfMp0U/KbWVM?=
 =?us-ascii?Q?nZ0fMvBfUcGv3qucQhRww63evdBUVBR6BDvWAsYhqWnTxAqIlTKCa28NjsTt?=
 =?us-ascii?Q?UMg/fA4bQScOJUR5X2+ZLPaPgpcqiW2BDyNo9o55yhkVsKbQytlv9OOcJ61R?=
 =?us-ascii?Q?bgSbQ85ltP7KSEu2AY5V400bo2EPKqXItizbqUQs6AyAf9vlY99yS8cnF1lJ?=
 =?us-ascii?Q?sQHe4Yirh2eXvYNjXrwhCRcbSoWbNE+a0yIV4ZVrdt4nV65SfdwZYzF5hvOx?=
 =?us-ascii?Q?EVWGf9SGQlKVDNIVSoBCdzwbK67iTN+8Bb1hCboA2jQFbze7zCTUYf1iMgHI?=
 =?us-ascii?Q?mxcBDL7rTz2KUGqH4WveduV2F+bht9Q9/fYoRUW/ZMWPJZWXg9zlE+tqzCm1?=
 =?us-ascii?Q?zI3u1oowxp7a+PCl6wLYjVLR47YV+PBBrovXScEgxY79cPKKn6QDL/qc4hYR?=
 =?us-ascii?Q?RB+RprT5peK6GSW9t5r+KhB5AjZWlKjx+YHSoNx/mE+EDDg//3q4NDzeOUwg?=
 =?us-ascii?Q?Xo3OerWzdqUdK3okYR16aE4uYPFpFmoZN73Jt0IAW/viQ6YndYY4i/Vv/Eq2?=
 =?us-ascii?Q?a1gKqH+WrTCbrSIBaLe0KJWM/m5VdjFxvPWfcsBBmhp6O8PJOND9KD8WtQwo?=
 =?us-ascii?Q?yjUaVZKE7t1YVpQLsZSp95F+gcomaDNY57tVMuPGqEQBvQ84sZPWMP7l3LmE?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 280ad7c9-7d56-4dd3-825a-08db9855385b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 21:19:59.1728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vVZnqONafhoU1ZlJg4gAnf/7K9WqMhHUjHTJug5SwgqlaAPn5C0XKviZY3AGDdUbObMGOpzvap6YCSzaQNO0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5430
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: skip rebind_list if vma destroyed
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

On Tue, Aug 08, 2023 at 10:12:09AM +0100, Matthew Auld wrote:
> If we are closing a vm, mark each vma as XE_VMA_DESTROYED and skip
> touching the rebind_list if this is seen on the eviction path. That way
> we can safely drop the vm dma-resv lock on the close path without
> needing to worry about racing with the eviction path trying to add stuff
> to the rebind_list which can corrupt our contended list, since the
> destroy and rebind links are the same list entry underneath.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

it looks right to me. Although it would still be good to take
Matthew's eyes here,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 10 ++++++----
>  drivers/gpu/drm/xe/xe_vm.c |  1 +
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 284c86107a5f..6a7dc14feab0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -504,15 +504,17 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  				vm_resv_locked = true;
>  			else if (ctx->resv != &vm->resv) {
>  				spin_lock(&vm->notifier.list_lock);
> -				list_move_tail(&vma->notifier.rebind_link,
> -					       &vm->notifier.rebind_list);
> +				if (!(vma->gpuva.flags & XE_VMA_DESTROYED))
> +					list_move_tail(&vma->notifier.rebind_link,
> +						       &vm->notifier.rebind_list);
>  				spin_unlock(&vm->notifier.list_lock);
>  				continue;
>  			}
>  
>  			xe_vm_assert_held(vm);
> -			if (list_empty(&vma->combined_links.rebind) &&
> -			    vma->tile_present)
> +			if (vma->tile_present &&
> +			    !(vma->gpuva.flags & XE_VMA_DESTROYED) &&
> +			    list_empty(&vma->combined_links.rebind))
>  				list_add_tail(&vma->combined_links.rebind,
>  					      &vm->rebind_list);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 936492915ecb..aef032ba8e27 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1450,6 +1450,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  		}
>  
>  		list_move_tail(&vma->combined_links.destroy, &contested);
> +		vma->gpuva.flags |= XE_VMA_DESTROYED;
>  	}
>  
>  	/*
> -- 
> 2.41.0
> 
