Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE05606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aBtqDgYz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E507010E0C7;
	Wed, 21 Oct 2026 17:58:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3E910E0C7
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 17:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792605492; x=1824141492;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1B1f2acwp5D5hiXFJI+6BTWDKwg1I8o1LrhrXISj9i8=;
 b=aBtqDgYzX86ENnStss8HSyAy9e/Z5scuWFfCg+jYmfLuJAefBJk4yFR2
 L50ejm67sqMqiT6RBYjecj43kXJe/OmSTjUnsPlq1b0axvn1hYD6SYuat
 CsUpC0fgMHp2ZpS5zdgev8tpiXrb0Sr2lTWmoBEWVynFjoDMozanjLRAX
 SkSLHCkdrr2IQZEwmnDhprahtwbsyoyWWra/3FnVcnD7wIWuMge5abIBn
 gl8+nUVXzWYCBeX5kBVUdqyE4Aiws1myZcHz7bE1q4UA6AtOjfMhYVCEj
 fP1/k6I1POts7q3h0NVt3y+6VukbdQUUHAD2s6enA73fsJDfxodgaCRNV Q==;
X-CSE-ConnectionGUID: ebyOKWO1TyCAgtCzgE5pDA==
X-CSE-MsgGUID: sM4I7UdUQcaAfI86iMA6nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1319718"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1319718"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:58:12 -0700
X-CSE-ConnectionGUID: qQsQ1pXgRZyJpt0HWEaNAA==
X-CSE-MsgGUID: eiL4YWPfRjSaKzrNv36beg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3469784"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:58:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 10:58:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 10:58:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 10:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICvLz58vS4dRw4xod0NGzIMMKCXAGNez9YfcFw1pz9rynKarSPgCXoRu++BOzOteqXS/vGVX89AV0MgSuW3pc6Ao7JMtOokrmLD+x8M6mZC23MhB7YGO/EWL7Ouh+LaOJWvVwQvUeU+0DdLBwLLh1eW3y9osx82qgvro48NV+U3mtNssOaqLfjbRZy4g0PBYiUjC+hT+tmmAm7uS+/pUVmK8E6mbhaF8C20sCg0B5xY/THuoluQTvULWesEwB2GPMFc216mAyYvC/HuH82ldNbrGn2jh8zDhJg5mB8niqs7MAjJ+jFnhPbFzSJIhOBK8ipcHpdgmXY+80wVbOHh0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6UVgjE/qkNbuB4GyV0/vjp3tq8OYKe8TMl3PSlDZDE=;
 b=FD9MBioOYtfc0dKEewZ3/t/qWl0nedRiek7QbXlBtqfeVaMEBZVKjwBDzKPRdHQpRZuIaFIzkysA/wxWbhgtV13yprF7RjgTJDeXp6QyLquIPkF7GAXIoINxeVDWztLSatO9xYYzUcPyL802ru/0Vv+ZG0KlT8Z4/KN33N0LiSx5P0FPfx7UgDJxvwJ6shXMhxVDQEdRfMFtvaIx3Pld+Yb3bTC7ufhhDaAKbxyQhlhelLiyNpDtz0kjLm3NhRHAkq4FGCN4GBLcWz3XTyGPSeAXxXczy+STh9cztAiEe6vm8yshIiTS9ROZroEaJbfZT1dw3BEYBkeQvkxGMs25Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0SPRMB0020.namprd11.prod.outlook.com (2603:10b6:208:433::21)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 17:58:07 +0000
Received: from IA0SPRMB0020.namprd11.prod.outlook.com
 ([fe80::289d:f5ff:d1f4:a9ec]) by IA0SPRMB0020.namprd11.prod.outlook.com
 ([fe80::289d:f5ff:d1f4:a9ec%4]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 17:58:06 +0000
Date: Wed, 21 Oct 2026 13:58:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <simona.vetter@ffwll.ch>,
 <matthew.brost@intel.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <gustavo.sousa@intel.com>, <jan.maslak@intel.com>,
 <dominik.karol.piatkowski@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>,
 <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v10 08/27] drm/xe: Remove ifdef in DRM_GPUVA_OP_DRIVER
 svm subop checking
Message-ID: <atj9KSTxUWJJr9jD@intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-9-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260903145952.848051-9-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To IA0SPRMB0020.namprd11.prod.outlook.com
 (2603:10b6:208:433::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0SPRMB0020:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d23a0c-c1dc-492f-184e-08df2f9cdbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|10067099003|22082099003|18002099003|261021121427099003|261021123027099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8g8VL/VpCclMLukCqq8LL5SnEqSgF8PAH0I0Z3548Rpo1Qt/2Mi4E1I9qrBa56MUk5lqTN+97JpdKEklEjAlBgV5fkFDt4gmlv6MEQhCba2eZUCL16NxUqjvVQPAnOOMkOKHuB+OEGz47xjq59YOR9y/Ox40deZ97OOGQCH0TTxPz42AreQhjKUDm2yzKkPyKMsOveKG3ZmjTWb31Lx72jHWanMSznWEewDeNGCiwbmcNkra9rj4YFf6AkcChvQBAm8XoYw123/VbWQvbMekP4bi4hfz6nBjbEmXcKbK6ftBjXKKeyStRZ9d2io2uYkL6FrriL/Z7Tlx7VlXXPrAHkKQTmT+7PhQbIqitICM5CzjsL8Va1Y6hnMu6gwozh3kUy3Og/HbdU7vY2yTzIgdsmKsFRdpuEG4xyq0dvqWi5SYzC2PaxNJAatT6I22pxlj8umHaLsOSFBHjiuvmq/0vsF7bnBT4XzJbMRUdoWifACQXkgarS7yAerHvsq0ojiRACZxUntXfAC5nYs1Ha+wnU8DKeEAtpUKwEJpORVLbXt/X1jHQeFrj5buq4ibvdTy2decnrcEy/r2djyLjzf+KpIBhIRYxIEXJozlk5/yWhjul0WPW799nNAh7gTgOcGLLz1hmP81qzSmZtH04M495Wg0lC4QFUycSNZq94PppAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0SPRMB0020.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(261021123027099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G4Cxj05BIeAREWUY7LuCnewFI5sGotZCoHu4Swetdpzty9Y7JKjoCgsjFQ+Q?=
 =?us-ascii?Q?ny/ohxznQqEBI8yuOCEkZDOvIFTi+N0qsvxs7CXWovyd2P7MTauX5/2gnydE?=
 =?us-ascii?Q?rAuARcqd0Mi4dpcFAhWecSouyvOXb3zp1KgWUp4BVkvDo7mezdyUDg11Euzl?=
 =?us-ascii?Q?CCZ4n07lLfthAKOlPWSlDDkb41R4wHerxPR4jovBsmKfWXxSjRb8NPjcEZN9?=
 =?us-ascii?Q?s97lLB5xrtOBhm+DHmi76dzXkbhY7abnLQ34CoFfozDkT0cruXcODGK5jzlg?=
 =?us-ascii?Q?wkd0L1ZejuyeN9sAgcGj/HW6NNI/ccrPou9vejNgdvwMtMF8ldWUeOQigHBm?=
 =?us-ascii?Q?DWorIyWyPWseRp+S9jGfi9+wqAMbe4n1Fvt3+0SleLpQrPU91d+2RNcJaUju?=
 =?us-ascii?Q?rQZmN9YtzH2M5cSStJYKFFpwbn+N1vrVUvehCXMwZXxeyXjWqvSfWKA/oSF8?=
 =?us-ascii?Q?Wkrfk8k4jilHz2b6d3G8bqQpB+0wSBgWwEp4Kbsj5AhAMG/cPYtK6ImpZLD+?=
 =?us-ascii?Q?ZveR0azn8pG+M8rFo5XIqLM/AoplhS3o9C1uMBctIi0wtnzny51tIa+mWYXE?=
 =?us-ascii?Q?5FqfFK6xKwku3kdxZlRd8JFkgPPOY7VYgzvyuoSP+5GW+nzEi8UerqrYiVXj?=
 =?us-ascii?Q?1kBdKTwp7BEFUgYh0wByQd5tB2oywEDCQahqlBAwsH9fMZDUg3Rkks0ctcWb?=
 =?us-ascii?Q?gJ1VF7fnhh2wZujt2J2H4aT1za6q7WIBg++VL308QEUrAxzEPYOiE/uuoks+?=
 =?us-ascii?Q?U97jK4YTuUYTsVX9owIaf21XJgi5DZUHB1+b7fJXxAdflq1Y1r8DTtJki+OF?=
 =?us-ascii?Q?fclzpPAUHCWR5l0Q4ZX4PBaRFw8reYWhYZ6EANf9H3YPPS7zsmj0s/32q21Z?=
 =?us-ascii?Q?UBun/9OrHR4xaydT7nEhqNwXqW/USNxH0QvXlhzxuR1DYRYqTtQf45Iu4SiS?=
 =?us-ascii?Q?dJ6YuNrICFWDR0JVIFR+jixpyNFTXubrvWPdGz2nv5OhgZx2wZMuYgSMsu0H?=
 =?us-ascii?Q?G/RY0dsDckyq11I1pdUb+vnYfW1L+nrpxPqjrqOYI3keiLYsy4GgrBdNeROS?=
 =?us-ascii?Q?GsPC5skczXJDD0xmxsC2hLIybACZS30UWjM73abyovlzHQlwCapV0VZ3Vc7Y?=
 =?us-ascii?Q?vnMAqv9zSOxJZ8WbMeqmra+2XhmSCJSIfP0I0i73yqMzvy2S3i/coNyIIjFe?=
 =?us-ascii?Q?pdKzDbEcHFOwXpbDJ/un40ON0c7Diluco/IyWAT7yJ+SOGNbW/1dzOkvjGtV?=
 =?us-ascii?Q?vvNmb+fHkpFW/PoZoAmHN7o9sBh0lwwR3KBk3sk6TO4Am1gXYuxRku9PqUtB?=
 =?us-ascii?Q?owmnsTT40Ve2XHrKsBN26SXR37oiCS6ar+BJVObybHhI323IPuKOvRGVi2N0?=
 =?us-ascii?Q?ss/ZXfFiYy5/trUMA/G1f5DvjRsUSl32+hgZRskMWU7F1O2jB25WXUChgs6Z?=
 =?us-ascii?Q?eQ4I+DS0wXBthvtg51EuO9Bp+zhBgrVFyNt+PLr0iQYNo+ulU9gZZg4EH8f2?=
 =?us-ascii?Q?Fw4pdR8FjeyXZC6Q2tXEaORxWQeePF1US6Ozm+h+3RzbmictRpL7XCWdR4uD?=
 =?us-ascii?Q?SlApW7CPlEBu65a2kOvkzlITlDzGdsym1WquNPqAZF6mlVU8ndi5bzcQjvpy?=
 =?us-ascii?Q?2pEDbCae2HNiYZKS+gBDfAST2SwNDJHXRP5IC5B55SU7iliTjmqa3IhGy1oX?=
 =?us-ascii?Q?RmcmLw6+9ZkmDnDjn/bgchr7uvXwcP5VJ3q+hGORtibhFcrz6qqjXQv1FSSQ?=
 =?us-ascii?Q?ME0lv+OmmA=3D=3D?=
X-Exchange-RoutingPolicyChecked: IeEeYXz6VlK2cGHcgQ69mNIoPQMA8XWmvP2qt52DqzsAQpZdCmQnea8KFNdlDwcRXKb5MfGlloORIBOgc0JZTUwjbg1QOEd42InCuAUsHQTPvGuA/43AURSPlZM44kS8p0AKInsbXbJzTQaPgXxCiD6XK47n0mIO11+28LXV0ssI8OxMqAhDk6bYACty5bTR4473unnGL7a4k8RUQQvEx9S2Lfulw6wg/6y0U1ICTBhhZ2cZiznLt43/6eG5g+uwOWQDAWMPiSLUBdr51RHJEpTFAJth2mfCh/LNlMVuZjtAfS+vRv9atOfZ+1Xjfrs+BngBGpgUF/wpxmYiv9qY9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d23a0c-c1dc-492f-184e-08df2f9cdbe5
X-MS-Exchange-CrossTenant-AuthSource: IA0SPRMB0020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 17:58:06.2753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/uB0SqbIP0BhxdPhhbBcRm0fjqBsiewqF1fD4dNVbNb0jOTgBv3Qn9zhFl/1bfJ0ETrDcjuUc+f8IpfzeND3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 03, 2026 at 05:59:32PM +0300, Mika Kuoppala wrote:
> Always emit the DRM_GPUVA_OP_DRIVER case so the previous break is
> effective and we never fall through to the default warning.
> This also allows adding more subops in the future without ifdef dancing.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Please let's resend this as a standalone patch, get it in and reduce
this pile.

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5d990c1c3740..b7749eda6490 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1622,7 +1622,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
>  		}
>  		break;
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>  	case DRM_GPUVA_OP_DRIVER:
>  		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
>  			struct xe_svm_range *range = op->map_range.range;
> @@ -1637,7 +1636,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  			}
>  		}
>  		break;
> -#endif
>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
> -- 
> 2.53.0
> 
