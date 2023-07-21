Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94EBEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 21:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937E910E08F;
	Fri, 21 Jul 2023 21:36:50 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9300D10E08F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689975408; x=1721511408;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/s/J5a8tufZUFeMZSBpJT1XeR+R+V5FVLVJe9yi2v4U=;
 b=V0+F9aIyu/mVgZgBOgTu5oKzIytBtF1s4nz7Lna9i92hq59Jijg+2rC8
 ElanftfScMo4xiFIcWREep1UIf2t5hiuC4/ev852oABgN1smOIL9zF6k4
 2+2at0djDYwsaC1iRehYbXDhe3bncaFzME0YfPOFOgXUpIXWAWoR4X9GW
 ZoHy9bL1wxlI8zntlQbXWXbA5H5aHHLeLF+B1TTbkUe/D+qwou8GJnCUM
 QVg3WMwiO2KZrUCmJEaWVl5kH2TEQgKboQ+TxVV59fDbNUcQ4oMoUbFFQ
 tDoikmVpJ5QoBldSfKbSQl70Pho83TJYHTTZ762/pBLYrjYb/J06bbufW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347415883"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="347415883"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 14:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848966026"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="848966026"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 14:36:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 14:36:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 14:36:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 14:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDWl6AQWeSNHIqyZ5WTPa1wlv32Hl4F5hUfbhda8btpFWxc7G3dIA9JKHO0xb7UcjeWeCFfZmm0rpSzMdWXYpY1rxMVsqCaEkr2VEIV/zdyLhVQE3unu9rGaTvmRBm0B6x4jxLXGcBnB+KoFs7pHTBO39WydXc8DsVDoVMxq2rV8+g4FKFe3vI61nsG9rSqBD/4WvpdtQgW2VYYxJLZFYI/zS6Og6PhYYkxroxd10ifwjCcDdFe75PFqrHDEjTbpIBn7dwhY3MHlXHuvcXBUMINTiLA+G+r7YXE2MYE/trnHEIb/ELfvDJ7npjzOVoEidUgyfKpjMclkuvbN8m03kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLmjV43k4WHAQAJBGZA+hsW/QCQPMmW+YfsRsCeeC5Q=;
 b=S5lFCqaDm0+iynkRMrAamoA55kNkYbF4dvhCB87G71hbbJfckr0ZgqiWH8OtG6Qe2/N/Uh0JxJdhKjkpNEeeWRdT87MGuGdHTYJj/uiAxw97AIA98qux6uoItZ15wX2eDNHoLr6qbn7cVgJCIFm2e2i3iHPzSfFBdwRkgiIPmOsmkIkkMbOwqj9AGupho91ZLiCQb7GkIiB5ZUEmbZ2bvf9NotdoEnebWvjyUhWZJ+iDQsIENrE6Nz5K65cuLX72RMbOnwoSTELcbJCJHtHIxI0N8GnJFEolFUC5MAbQfgVrv8Lg9BN24DB9+CZzxO5CG8T83EnBFTmFPOQ/Ae9NTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Fri, 21 Jul
 2023 21:36:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 21:36:01 +0000
Date: Fri, 21 Jul 2023 17:35:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLr6PqWX4g4Zzi36@intel.com>
References: <20230721192152.275803-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230721192152.275803-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbbd98a-72ee-4cf2-259c-08db8a327aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTKtf/m/g64N7BcHa9Fy0T5t4Oe//+q6jgS59+sBextMLiS5j5H+rKM9OLDfzubPHBa2r/XPEVk/cRtvNMDRPmtEPiEKNkHZJ81cgBYILwI3aXoh1RGm7LR1Mx1MlwwVsfr1X8dlNNIMVhY5RA1cqK41Qfh0tYKeu3e2RilStT5EROuLwR4ZfGZGp2X9hVdbkUzXNoOHRkJL/uK1hyZSP94H0zw29FT6WqmBw5q/R35heaXGrKPDsVe5z5wFX7QGyC2sS0J444v5Pf/txNrUT01rrIaG05ECemaM0IjA2HSQV3znVUq4P/yN2dN6TmkY/nX/kfPGXEL6QlD9u0epj7DoIA48XRiYMtcGovCTgbP92ykY7K4ZBkULx0C4orqtr/01eb91IBL3clNO6aER21g2N5G1f5oyp2aImSfjZapjNlTLQ8Rl3qKOsypGsjuujMcmWTb3dulEtDAbvwRx5Mo1DHYIpjpSUUmYXBqOT3YzX6RfDAobjMjk7J9GaI8BT/g28D4ky/PCC7sd2/hD0AX1ENs/T/f0wQChmbROwLj5TZtf/YwXIMoHweWzBp5S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(83380400001)(478600001)(186003)(86362001)(2616005)(6486002)(6506007)(6512007)(66476007)(2906002)(66556008)(36756003)(38100700002)(6666004)(37006003)(44832011)(41300700001)(26005)(8676002)(82960400001)(6862004)(66946007)(6636002)(8936002)(4326008)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uKlVkpmk+DUq+E+aAmYkw6xna58qT2IiQSDyMixh86bGmTEIk9SuazX6RDRp?=
 =?us-ascii?Q?Tgb6D2vREDeIlpX1Q2lSjMzy436h9nitkgB49MjLXO/7aI0/ZYGzbtkGjb/o?=
 =?us-ascii?Q?s7pLsGnvMtga4ZBnUcaBlKStTK7tRLNTlBdc9CRL6M09inOAc+yzHOsFmBYc?=
 =?us-ascii?Q?u8oQi6vWJEJyERvbEMO/cFyqofa+CrLxtKw9rqoeyTWPxeCVMUIHXmiuBLNS?=
 =?us-ascii?Q?+Sb32MRBn6KvhnPNOi8JxHDrL4iviajx8C4WJs3PaDOsqAL/y6kEInnbyQLb?=
 =?us-ascii?Q?h7FoilWMW8bllQ4Z0YCmRIaLegpjSoBENmSMQiYVXq9Fm6vk2HaHcn/v1sWA?=
 =?us-ascii?Q?H1grSfrGnvV/Zz5zX9A+1kpg48qqu7yNBDNXDrTybPj0vO5uHl1m4M2xOLh4?=
 =?us-ascii?Q?lWAN5TiSShsW/hBj7X1ws13LkbC5ZprRorUiEQ06VzhLnxasPETEimeT4dph?=
 =?us-ascii?Q?N+x7wtvj9v+BI5xVgF45iFUayBE2ZaxCLuhdJwDFaU4Lrg6xaQisrZd4jT4Z?=
 =?us-ascii?Q?sohmIiPa6Z1sdzmaO2QQv7KasXsP8QQTsr5xfC9YK2Jb8pn9HT3t2QsDoquZ?=
 =?us-ascii?Q?emZt521Qxv7GnIqtxtdDRKcF6I/HXjS3zmgr6fpdwByTjQiJb+h56mpEL6Ct?=
 =?us-ascii?Q?ezNZbyVehfdXoII3RQjo2IPEU9BG2HEg98ZL6JCClfhw/Cqm/yuP5Zjt7KFs?=
 =?us-ascii?Q?cXkfScJVuvoEVtncJcp+Pa//6ESPNKXYF8UBFenj447o1zcxw8NdRYZJMUAO?=
 =?us-ascii?Q?pM7nzfu3wX7YRudIlrldyS+ovls7FMoJvy61//0dW8zrb9cMFw8HeqzTyUi/?=
 =?us-ascii?Q?GlHF4JWHe+pbjBXL58/OszSpb5N23pkA4OmR970R/0rpyFaoN8bYnipdx1v3?=
 =?us-ascii?Q?oudPbwa0l/MvgnE/UB1uQOmh3nf9RctZhvMGrfCAzf5iK/XZmlkmErQqmeH7?=
 =?us-ascii?Q?wezsrVLfD3ck9GCU7jA1TWRyM/AY8NjUI5hxkl4dl9Qf6dxvstF6DNsmcdfY?=
 =?us-ascii?Q?Pp0yaaP0FxSynfkJvCtN/21Te/vbSxQntV/WfyzhyDH/4dbbW9cCRr05BZrP?=
 =?us-ascii?Q?yVw2CNNZ2r/8YSDqGkifAr39JDNC4XpMqbSOblTjTtQjdx7hIrfA81xdNTI6?=
 =?us-ascii?Q?K8EMg4jbimPkUZNsyZOAoJcyZ9BQWup9qTj32g3Is/FiO/iPlz5oobaRX1T5?=
 =?us-ascii?Q?gEFuKVT8nWHGeP/UisKxEUu9uzgg6YwSK4WjgxutBbLMBGMLsI0PPPRpsJTi?=
 =?us-ascii?Q?VKH9WOOxad53K/uHfQFbNh0H6NDjKUiRn+26LRSESmSLJwCDcYh8z1/I8ugy?=
 =?us-ascii?Q?gz3XOeRH3AJmwipdBPKm++76AmoF/ynoYHydB50hWG9I3qDeXe0gRM9tM9Ns?=
 =?us-ascii?Q?nDQL/UdFSWLNOTVKNpcnRh9Q78PG7Gk1gD7WkfeTeyrW8Mlt+stnqDGKvMcN?=
 =?us-ascii?Q?sBLrB06uM3E/aHOzoRazyLof/AV5LPgsISIhS4zW80XT/URXFc8QCesk8OSc?=
 =?us-ascii?Q?CKDQo0l+nnlGehJAaIQ7bJxVTsKpvmtN/UjzL9iOlwWMe+oJnOodbWJDU8mm?=
 =?us-ascii?Q?GLeEdxgO2AOlAFw/ajg2pdpXGfQILW6/oOqKbQv0H39FhajZr2nOsNsNWmC5?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbbd98a-72ee-4cf2-259c-08db8a327aa8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 21:36:01.6410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qDg6b5eMYLjDQgvwLyvpkTq9s6MlXlsbpZNQsb4r8/xmiCt16/7nWDE1sbgeUa1v7c/Ih/JxZr+K+5f/GLT4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use migrate engine for page fault
 binds
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

On Fri, Jul 21, 2023 at 12:21:52PM -0700, Matthew Brost wrote:
> We must use migrate engine for page fault binds in order to avoid a
> deadlock as the migrate engine has a reserved BCS instance which cannot
> be stuck on a fault. To use the migrate engine the engine argument to
> xe_migrate_update_pgtables must be NULL, this was incorrectly wired up
> so vm->eng[tile_id] was always being used. Fix this.

it makes sense according to the xe_migrate_update_pgtables doc.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 3 +--
>  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 457f1363ec67..bbc319fba9e8 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1421,8 +1421,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>  	}
>  
>  	fence = xe_migrate_update_pgtables(tile->migrate,
> -					   vm, xe_vma_bo(vma),
> -					   e ? e : vm->eng[tile->id],
> +					   vm, xe_vma_bo(vma), e,
>  					   entries, num_entries,
>  					   syncs, num_syncs,
>  					   &bind_pt_update.base);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6003c0be5b59..62a99c393d6b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1678,7 +1678,8 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
>  		if (!(vma->tile_mask & BIT(id)))
>  			goto next;
>  
> -		fence = __xe_pt_bind_vma(tile, vma, e, first_op ? syncs : NULL,
> +		fence = __xe_pt_bind_vma(tile, vma, e ? e : vm->eng[id],
> +					 first_op ? syncs : NULL,
>  					 first_op ? num_syncs : 0,
>  					 vma->tile_present & BIT(id));
>  		if (IS_ERR(fence)) {
> -- 
> 2.34.1
> 
