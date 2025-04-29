Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2015CC3ABA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 05:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D334C10E0AA;
	Tue, 29 Apr 2025 05:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TV8RfOjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6598F10E0AA
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 05:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745905067; x=1777441067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=unGfjfgcNl1LPiyAYZ/g69eC6D6SXBavFwGkt9p2NwI=;
 b=TV8RfOjZ8tvu5dRfXHAbLXoZUT7TWBTXuXiyVLz7nWLTfGvhEuPEQ326
 KGH4QL7mw+Fae3Khci6IaSQNS2BnGCKbYHy9iK/1imkZntC3/QpEne8BO
 HR0y9LPUsTLVFT6Il7t++XlD8w3NLXQH6SerfTDGE0kuvZeRU91OWekxc
 UhZpHaOlaOMIzqA/C1HCcBgg7j3vD5zF43mjlHuBOu1AWgZhJz58G8047
 5F+GkPtRWjEeEQNoWC7otoppTbJs7mE6c1wpxWfbLFgNnrIaKz6uPSBhM
 Kp0n388Rt1t1K0vnGnleCafARQBkaoUGK8gOAArlXgeE0y6rVqV4Xaf8T Q==;
X-CSE-ConnectionGUID: 2lOIG5hQQWiAfcrmUfkYTQ==
X-CSE-MsgGUID: DrAgTsDSSI+7RW/AazFZiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47654064"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47654064"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 22:37:47 -0700
X-CSE-ConnectionGUID: eMNL7CA9SZG6TCCkLzgdrg==
X-CSE-MsgGUID: fFQJ8arCRh6v/h46jQufHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134239453"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 22:37:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 22:37:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 22:37:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 22:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUx/Wc1VsP+XE04lDZttG/6y+nHHOrkRv0Z4FBwPRdQgKoOTp3KyI4zhiwJ9Tbg+9jFADKPiWKwQp2IrmYSdiRc3603lv+4mbp5XVihetqmY6LZAm9kIBjcRlTh+gNR2c9ZFfqOZxpVvFA7rmcOWvNRkVW6740l7KA2P6K1D2jZzGe8PwFQTzXFxnD+deiH9Do1J/QAQXuF0SEDAXaHNS0e0kg8zGsPEDYgS8y0D5sfizeEpMbXGLw3XoOgfFBjH6miWJIpgxAVD187t9KEcHwagsnphTPX1VRjYa4zPMvBGNFpw82c9vlTIYKx9IeYXkRmibO7nT+D8tpUvHhM2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDyW+a5PW3aLuJCfV1CrFlN3Euw1GsaKGQUQNgoVqyM=;
 b=WMdFqm7Y3McmecDIXneCLkn8vh5holxvgORkidaMdS5+ZNnbmpi/DS6JvBu/hTTuffvQz1jvJb+WRw/XS80u51VlkNaWcjSvxvHyp1vGRKWSCrBDXHQaajbTjTQHiwbjOvwWxnTV4046ct2s6FZvHCb6wrGlQ3B8QZ6cDRcOMj7ZyOaa6SlV97gfDBN42lPCevIaYgd1hqbOjRRiirYCwF3QnZQk2jBhXGhcJPRmlTvYUstAmUA5oJLib8HXCKZzyUUrCJ29AEYBdny9eW2ja1MfMyM6v8sMutElb/ijZe5UuuMwKa2/YPH6eUku3KSy72wz4kAdQ3YLUDkqer8N+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF3D06B1BFF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::822) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 05:37:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 05:37:43 +0000
Date: Mon, 28 Apr 2025 22:39:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 16/18] drm/xe/svm: Add
 xe_svm_range_validate_and_evict() function
Message-ID: <aBBl+vO5VBlQv3Jq@lstrano-desk.jf.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-17-himal.prasad.ghimiray@intel.com>
 <aA/wy2hC6DDCitDL@lstrano-desk.jf.intel.com>
 <0fdee639-3a6d-4f3d-bb50-746ed30eb4ba@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0fdee639-3a6d-4f3d-bb50-746ed30eb4ba@intel.com>
X-ClientProxiedBy: MW4PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:303:b9::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF3D06B1BFF:EE_
X-MS-Office365-Filtering-Correlation-Id: 4deeb2d7-e69b-4ce7-99e7-08dd86dff6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jzcN0aVaKOLcaXAXDjNqhfgQ6yQqd9fLKsG2NmNNWDtB5BxE6yNs9zzo7hVQ?=
 =?us-ascii?Q?8TJbZ3eNiSHR/KOE4VPqeRcWef1f55TDpcR2c34fr6L99xxrDZNUQ7qmmW8E?=
 =?us-ascii?Q?1E4o/Kzo7Ixk4DOmmOUUfwUwAnBxhLqqbjZrFBkZIPZOgY5KsFmi17KXM+I0?=
 =?us-ascii?Q?fH0iw16XmgOGgCxobA6koVyaxu7+V2Ae35Wq2m+YW8A2Hk5rXi1VyjAeRHnC?=
 =?us-ascii?Q?yG1sxzGIL2l3al9yIVWDBghl/NWMcczIF1hPQof6vWP8TrRHhlVfNPS0cDeM?=
 =?us-ascii?Q?FWEUkpIDVyDUNdP92ZkgzzVza20sHcyV97sd9+Jw1Idw7fKrPsDfDsISbnOM?=
 =?us-ascii?Q?9G4CWNmDZIzGeiix3quRcC06TeJzja0oph+OeTydu6sudzyAOLtsozAfkIzF?=
 =?us-ascii?Q?VI5LjekPkPg3PJOLWElPNh1J3pyMqIOo353haSgr19RBWH6gCaON220ePS9k?=
 =?us-ascii?Q?5xBk0qWo2ZnYLvIeiBd6OunAEYK8RQgcWQ/S0MudZ5EC97yD10eSVm1dDmDv?=
 =?us-ascii?Q?wrz2HmohY9QoPuLLG2GYvekZitF0jw1ShpNQ300ZSfi22yGDKfwUFTgvtOHr?=
 =?us-ascii?Q?9pIAiLqktaxA2phWlMMWhDysuG6kkU5hqP/2igplTvCLgSDpo0N+5/SS8Mfn?=
 =?us-ascii?Q?jgF3rK+y2+4HNJDXW0svP8+Sz7ZymyQocBTKjkz255IjEa5IAZPYS0kGbUAu?=
 =?us-ascii?Q?UlQzqJ37p8diNKFIznXTqnkv15AuQBZo5XGk7ruf8ZtvtVToh0a9bY58SXzG?=
 =?us-ascii?Q?1WZvl29eCJD1nqlqjJ+io9pbBavR9/I9dNc9hQi3ObSEQpT3ZrZYpRgcwebX?=
 =?us-ascii?Q?XEospDI6by7DkeyI5cy8qfyt9xBEPMPwJaaFwe1Zl6gpJEUFQ9gTeDZykzLk?=
 =?us-ascii?Q?F64tRzFaSy0tMF2J4k1/aI2QSWOsWVUGJ29dOvYSD0SPv7bIfWSj359knvWk?=
 =?us-ascii?Q?QW1foKBaQmEfn82qdgd6/z+a44H6TM5lHNaqDigqId24QWS6Tx639vbbYztS?=
 =?us-ascii?Q?Vb+KNagtYHUsepCAlANismIqvCjho8BimVHSMc+qft4YHe9KsEKspIz3iaqu?=
 =?us-ascii?Q?eeRd61Kdu+woBPvXJRcnubljNnogPTNF1Drvy0RsGrPI/+wJtuZNk6OrYpwm?=
 =?us-ascii?Q?56AxmY3eN02743bRq4C2/S9O+SuftDuYR4SU/rRospw606Jh96fc8osv8XOZ?=
 =?us-ascii?Q?/dZm1Q/kLlhmYgXF5FEzcfwk1jPi53Rp5L3XIxOyWYDE9H3eb/ObVyYOcUhS?=
 =?us-ascii?Q?aJMcCbnkk0F9MgbWHDCfQ0IwqfSxmBVkWv3HX65aNjw7/ToAHJ7fHEVRBrFt?=
 =?us-ascii?Q?yoM+bxizg4iSxWLwvCsTDT/XmMN6BOUvVUmQS2ury+H4AbmDZEdxx1FpLDzw?=
 =?us-ascii?Q?+PEtcd0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cGBxaJIN5FluWiLeifxYYCvDz1OhaQwI164sGwFVGIm1hht1z/bdNbfggD+s?=
 =?us-ascii?Q?iZmFYYnzg5mlbgG/Y6wFzwa/9oBRguDMUPBkSICwoujm7O95C6OAyZJCiQ4p?=
 =?us-ascii?Q?EZlVMbjvkWthufehuE8uCGHEVPb/OaH5XY98TbWnnT8O1DB7Z8bYOmfS3FBo?=
 =?us-ascii?Q?kBW+9zL3y/VbslnkuXVlIZjDUM+xkTUlmzKS4WXwGKMU8QQmxGRdF5ZpF/yO?=
 =?us-ascii?Q?wi0w7KdgzURLbwIFS69NZbAlyhL1cyjilpbodfUOcnxA1rcCRDeexIWjPs52?=
 =?us-ascii?Q?+vKivTvja4PqB/dnwS52+DRbE3lUumEECAUls0jJiUdbasQx0Ky0WAnLi+If?=
 =?us-ascii?Q?lmBzFfKMGTwcgoZbGKvxcTr8sYy7ezW3cYSpdzscd1j1Sy2O+z1tshLz0aBX?=
 =?us-ascii?Q?vnI0laXxV7XwDZPxEqrtSiCC5TLAtRp/FvMRdpMpnA6SHOD3fBuTXb2K25n+?=
 =?us-ascii?Q?RVWxPSclphNghrNzeMY6+F66RDnWU/RwEv+hO/keK74fq4FJNORmRsy8P73W?=
 =?us-ascii?Q?QL3zUvdcv9H47jq1fXoUxGuH/v2Y/+QNMnxWeUYoZRukFHDoDKeW8Flp4pDq?=
 =?us-ascii?Q?wbzVJq57Y6gyXocOAWHodXZVQyv48wPkYgqo5N/lSCyIi+KsYpt6GPpFN+cG?=
 =?us-ascii?Q?rpTunbTtHLfF/xTWx6y1RiweXvaQ9XkJ4LZtjDHkpgfNfzV0be2JJmmvmhz5?=
 =?us-ascii?Q?/EKL5hd4yrfigLYdI48R7tH2THhK+B1crojzrNQr7af940+k0J3k1NQPFkbf?=
 =?us-ascii?Q?UO5vdbzp2WEcGXttXjCSRdcoeYkwTOjUghKV0g570vsurLw13VVlDqlDRjcZ?=
 =?us-ascii?Q?dcSE+bxQ87mQ/T3o5/324oaU3hA03yXUPDOL7OTlW6HOX/gQbDds0zpLV3od?=
 =?us-ascii?Q?vVazPhjw3IqB+LKgmqm7oIzzaDWJjpTD8qZWj71aZHlVSIYdhyCGgYEMsG9L?=
 =?us-ascii?Q?gFj4XeAXsXRgdb+vGHMc5fxJEFp3J58FwYDsZPgl+Bb0LyJzo2SsHjX6zemn?=
 =?us-ascii?Q?iG6b1IFko0a54alSgYqLxRbpeFTxHEpdwfZ3+/qtFYLoPs6lF0ujw16Zr7ke?=
 =?us-ascii?Q?gMMdprtXjO4Igi70IFoMTPLaxoFqrnNUgHov6mqHtYghixI6U8MtipqJWXpv?=
 =?us-ascii?Q?tnxw1gr7Z/uffk9v3TcXA/+EibVspcU73/InRKTg3cfZtUTEtHvyRVxZ0Wr5?=
 =?us-ascii?Q?qKDMFUo1bFMlkfK9mo3vzBFrb+0Ar2pYfwyz7spmp1zfZMLLBQnk9o7MYF4N?=
 =?us-ascii?Q?VsvOOZB57pTE+eqEARDE5RZUd0snxcuaex9CoK3xftzIc8mrlgnjToKAgSNT?=
 =?us-ascii?Q?Byfz/meQf2bky/kP6uhOfqPUY1Be5gC79FkRosWC8prSg9beWXeRBiQcy7+j?=
 =?us-ascii?Q?IwF4bqN5aNrD2L5zRokXeUHZBku5mASxx01j9UbKPWKaUN8R2zkZBFRN9dyk?=
 =?us-ascii?Q?gAolxoe7jUveoaAOXREaPc7WD0Mdq3zOvIwjE3jAlkllAFKrxr89pmnQ0oLb?=
 =?us-ascii?Q?TSVYfnjj5MV9SUwqOxmLV7r5SLTWSaCO3D1k6fg/SRGZfT+XsHSjPyRfX0OL?=
 =?us-ascii?Q?yTOggYr/Osb2JV5ha2RcoHFpyFZ97+xuvGZ+KBuIaLumWzDVYXx83gQ3EAAl?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4deeb2d7-e69b-4ce7-99e7-08dd86dff6f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 05:37:43.7137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttkFY2HPPSNmOAstqBOuUO0Fso5zkx5rRo8AgHohi1Pf+UjgydDC0GyGwimWKw0B60Qo9VuqemeFzQzsIIVBww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3D06B1BFF
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

On Tue, Apr 29, 2025 at 11:02:53AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 29-04-2025 02:49, Matthew Brost wrote:
> > On Mon, Apr 28, 2025 at 04:02:22PM +0530, Himal Prasad Ghimiray wrote:
> > > The xe_svm_range_validate_and_evict() function checks if a range is
> > > valid and located in the desired memory region. Additionally, if the
> > > range is valid in VRAM but the desired region is SMEM, it evicts the
> > > ranges to SMEM.
> > > 
> > > v2
> > > - Fix function stub in xe_svm.h
> > > - Fix doc
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
> > >   2 files changed, 49 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 90fae13b77ae..0e672e1e68c3 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -637,6 +637,43 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > >   		&& (!devmem_only || range->base.flags.migrate_devmem);
> > >   }
> > > +/**
> > > + * xe_svm_range_validate_and_evict() - Check if the SVM range is valid
> > > + * @vm: xe_vm pointer
> > > + * @range: Pointer to the SVM range structure
> > > + * @tile_mask: Mask representing the tiles to be checked
> > > + * @devmem_only: if true range needs to be in devmem
> > > + *
> > > + * The xe_svm_range_validate_and_evict() function checks if a range is
> > > + * valid and located in the desired memory region. Additionally, if the
> > > + * range is valid in VRAM but the desired region is SMEM, it evicts the
> > > + * ranges to SMEM.
> > > + *
> > > + * Return: true if the range is valid, false otherwise
> > > + */
> > > +
> > 
> > Extra newline.
> > 
> > Again this will need to be refactored for multi-GPU but fine for now.
> > 
> > > +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> > > +				     struct xe_svm_range *range,
> > > +				     u8 tile_mask, bool devmem_only)
> > > +{
> > > +	bool range_evict = false;
> > > +	bool ret;
> > > +
> > > +	xe_svm_notifier_lock(vm);
> > > +
> > 
> > I think Thomas and I landed on we are ok with opportunistic checks
> > without the notifier lock here [1]. I think we can follow that here -
> > use READ_ONCE where appropriate, document that the checks are
> > opportunistic.
> > 
> > [1] https://patchwork.freedesktop.org/patch/649590/?series=147846&rev=4#comment_1189676
> 
> In the case of a page fault, we can perform opportunistic checks because if
> an incorrect value is read, another page fault will occur to address it.
> However, with prefetching, if the check is incorrect, we will skip the
> prefetch of range and will rely on a page fault, which defeats the purpose
> of prefetching
> 

IMO the same situation but I will say stable check in prefetch doesn't
hurt, nor does it in a pagefault. Go with whatever you think is best
here - not a blocker but we try to make it consistent.

Matt

> Hence I thought having check under lock in prefetch is better.
> 
> > 
> > > +	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
> > > +	       (devmem_only == range->base.flags.has_devmem_pages);
> > > +
> > > +	if (!ret && !devmem_only && range->base.flags.has_devmem_pages)
> > 
> > s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram
> > 
> > Matt
> > 
> > > +		range_evict = true;
> > > +
> > > +	xe_svm_notifier_unlock(vm);
> > > +
> > > +	if (range_evict)
> > > +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> > > +	return ret;
> > > +}
> > > +
> > >   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > >   static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > >   {
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index 9be7bb25725c..e6f71ad0b17b 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -83,6 +83,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> > >   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> > >   					bool preferred_region_is_vram);
> > > +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> > > +				     struct xe_svm_range *range,
> > > +				     u8 tile_mask, bool devmem_only);
> > > +
> > >   /**
> > >    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> > >    * @range: SVM range
> > > @@ -276,6 +280,14 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
> > >   	return false;
> > >   }
> > > +static inline
> > > +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> > > +				     struct xe_svm_range *range,
> > > +				     u8 tile_mask, bool devmem_only)
> > > +{
> > > +	return false;
> > > +}
> > > +
> > >   #define xe_svm_assert_in_notifier(...) do {} while (0)
> > >   #define xe_svm_range_has_dma_mapping(...) false
> > > -- 
> > > 2.34.1
> > > 
> 
