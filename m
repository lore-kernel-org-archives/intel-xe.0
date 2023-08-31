Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E20C83F37
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 18:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9675010E1A0;
	Thu, 31 Aug 2023 18:29:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8A810E1A0
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693506570; x=1725042570;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aUfOqySTcrb/GXhmQwSJ3mHl7sSSd6xm4AZwGg9yKSQ=;
 b=WbY6QlXKgPj4fjlojQZuMQBKRstNldBR5v9pfMKabb5LzAWayDv/aUiP
 ehyXvhGXFlMw+cdIMjqoEmd/0YLQ6w925PPG5E9vfOtxbE5urSibBYSPL
 VxCPdgoLw+kxR0ka5AKggKSfqiTNOn1mgYCyvEX6YYpamXwP94G7a9JVW
 jrvu7od9vOqHjy79bivyhjhXrD+danq/pW3zIvhcLb9TN/eSgc/mWbGix
 Hm5vChvN9rH99RIH0uxwDv0iYyO1WOOkwvqMCR43RPzzDXDa5+D8568Bn
 ZjNOa2cn4oHwdVTlqGJstZesxSPLW/DvIZwcTH8JTMfFzWqk++ZAr0uCa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375967817"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="375967817"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 11:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689453776"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="689453776"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 11:29:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 11:29:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 11:29:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 11:29:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 11:29:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmVZ5SqUAPWopyWGjKkYMTAaxuIW0oUWjEv8AGHX9z/L9xx2Gw1ol/GrCoxG9Ao/t7mW1LJwT3BzgS0gO8mpqIomU8914Ob52Nk95cFO4oKBJ+UyhrvppuWY/hYZCpCO3zUUUTH91fi9KFSBiHB6HklUyfUZVJbJKJsq98fSif8CLsFELkgR9RCkzsP7X+0hNhJgDSZpDafTj+IKXWgl3MoD0iHn3Z9fWYxOGeKg6NlPWJUtdclMSZL9yl2pGQ1UxhhgR3/GFe9OZkeY+8/sjpujcTmK8klALdH3MRTtUUZRk6nGg0s5svw81HaKuNrAxJAEc6umJvSV/lQdrhlxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmqEstmMQDfmwBlhyzvLdPMBcDOID4WFVUuXO72GemQ=;
 b=GSREB42v9qJgiue9Am7ssJhvZyZ/tfuarWmE7kYAXw/Kl1MNuIJ29XCF/nrfiiGK/34ym8QQ3pyaD4oeqCJ5nlUS0xBaadxK5CmTr93cnda0fhjKA1NgLiHqAx2G3M3Wd+b84KECNxDoPS43B5FEL/L43Ej7w5I56H+nj7T/fIwUGTjluz0oGpi51NxcKzClqgtZGAzBMk1GbwkeNAURK6deex9xnJlbiC8VNnHtVjKru8rMzHzjMW6m2p9iDd86E8UI+nDyjSLIbQz30zcqmsa9rvITcMPYAwKz8ZkLzEx5StXy8+tiwnmZJepCrkCqKglMy+74KlD7TlQw90v8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 18:29:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 18:29:24 +0000
Date: Thu, 31 Aug 2023 14:29:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZPDb/1DentGfPqbB@intel.com>
References: <20230831150048.1760018-1-matthew.brost@intel.com>
 <20230831150048.1760018-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831150048.1760018-5-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c83099-f990-48f9-4f57-08dbaa50333f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iSQDN4wExAHhSdA3pAMzk1IzfKG72kN5BevZY1R7uijFYHwJeol9VDNbJPqIctQ71syQiuXK9NOFiMkv6a97PK+4mJl2yD1EGN8S/53omVCXHNgqVcqbZFqYlASXcSa2+hCcIE63ce5vv9y4L6g7OwUgxbZd/kNTIseKjy8dHFy1Oa1XB6/q2KBZqq84dkayjBzUS3cdWEpV+r0+1N5bzBAf3pKmzzqbAM7vgsLMJ/APoZ7BTkzJnSW0tdRFYg447B5sHSEpcgFNKxMUOGaTZILbPamR6naSTYdYhythCfTtgHu8nLPBioeHA/PfIYgocmIaLI9H2mNPGkTbXz5gUNFgb7hINur/OtRP4/2oRks3Z2KZIC5esrijgSy/7X+b7UcrbDTfqe1pY+puago2TngUqZk7FszHV7sJ6r7mD/mUFQvN/CwfR/8fuUtGC7aB2aDx1ISfIS+zgTBaJehuCp0x/M08eesrF/VjTQX/ImxwRsON0FtWfzyVYZAJTDVV/6/QPh2Y772iGBEPtuHe67Wv77OPHn0AGgocVrnq+rdtpRroCu0bmmXVTWKtOIfH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199024)(186009)(1800799009)(36756003)(38100700002)(478600001)(4326008)(6512007)(44832011)(8676002)(2616005)(41300700001)(5660300002)(6862004)(8936002)(86362001)(6666004)(26005)(6506007)(6486002)(83380400001)(316002)(2906002)(82960400001)(66476007)(6636002)(66946007)(66556008)(37006003)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i18YgW3FucTYRWxNrQ3Es5OfKnsrYRa7GSzq04DSb5zNubMGb7BLxzK9Ttqs?=
 =?us-ascii?Q?sR566BjSIO51/ChBbsSXe1BDBTy73V+EZaV2VUjLOflrovjagE+ClBZ0auhx?=
 =?us-ascii?Q?fU0v23IT4tOLeTLI9GuPrQgD+ALu7WB1zWjzKBKcwXFHPQDBIOIQ/KzJWZoy?=
 =?us-ascii?Q?xySpRcIRBGgn1+QN4Co2khYa9GYkOr2rP2EPHPIVN60wRL3tsfkcYS9asSad?=
 =?us-ascii?Q?kxfnVfuh+5qIeQtgcjGvsyB7VtH1rjcGZPTlEMIGQ1SgLxz/lkbpzqrNzLGS?=
 =?us-ascii?Q?rUtikkc7ayb+DCbmYjes5q5RckB5rYL3oHEWwPrr/CQk/4NwylZzT/QfdIPv?=
 =?us-ascii?Q?iolpcfpc3ZLneevLh3uMA8u15BPVKouXQoMdVX425Y8ENpg4pWTrUrtBAqzP?=
 =?us-ascii?Q?ZDFx5QsFdNAWs6OdBjDCIzfBcCWpbgh9PJaOEMa5toeGGrcRUeQ8x0TqaxhB?=
 =?us-ascii?Q?9UqIand+qe7AMvFZOAIwWwDdcSegtoOMjRiChUuewmmSYYdRPNfzgxhPyi78?=
 =?us-ascii?Q?wZs3AoQb2/yWJxkd9+W2xj7A25zKQ7SkmLzipgeLdGZ5Mv0eY4vvjtVGOUJh?=
 =?us-ascii?Q?dbXN4knxP7cl7vHFKBGUWQeV7PsrTFWshBPq3veW8BnXoCz3RsNbRJzZgU7D?=
 =?us-ascii?Q?r2JNim9TSDDCZUI9gsE8nYioOXoQJg6nEhiltKy46QeCBBk2EIvBY3JM2Cxe?=
 =?us-ascii?Q?qGix6joc2ScgCbvF9jxyHgvbr9GKkjaHs2VBD+mtClJg3daIgjnegCUt77Ww?=
 =?us-ascii?Q?K4BCQyQwJwCua+D+jqO5H1EoEIyItAbdabu2F8xPwmk8pP3oK5q+CCBUF7OI?=
 =?us-ascii?Q?OH+Ro6wAMWi6fSitz0eaJkFVEj1zoyWgFMc7p5LAWndK4qIdaIJVkmoOEiNE?=
 =?us-ascii?Q?yJx+XVHB4U9t8CG8QmZtpIo1DPbUUINyFUmz/H/hB57KiZlfnu7EmLhYdt3L?=
 =?us-ascii?Q?y3FKbW9i6MeFiaR1DCRxP8rCBVS7JAp1XGvtnHALG9pDKHrHwBYmexpVwIcP?=
 =?us-ascii?Q?+A2xfhP/yShBXfeUaQ5BkBWc+3xQMJiz3RlmihqV0koHuNgcYaDuwAcAN/GL?=
 =?us-ascii?Q?fOjSkS6cPl8p6KycE6XC45TdUt8zYUP1uOOyoDT4cBaw05opDa1zakRUEhUg?=
 =?us-ascii?Q?sZlyzAiqdkIidJYNeDuPeuldGJ1wzZdOULupIRT1oqFiuUvYhne8fmHcqPkC?=
 =?us-ascii?Q?CBMjG9rO2dvVYGM3ptsQhiXxEpLgFmL0fEAuKPf0gpxmwAX9zHbyAM4qBE6G?=
 =?us-ascii?Q?eTzECNxkFKzS3LCrEMvZQhz4Wwg/LcLakWwUJqFyVWNE3T5L9EAGpmQ9fIW7?=
 =?us-ascii?Q?6CDUcU4M/43UGzHiq8tNKaKIVXXo81GIwfHinGwcSevBnUXbYMo6DjnfQ84K?=
 =?us-ascii?Q?OgRRPUD9yPt9boaKcNNkpmPWbpgB0/6F1vDCwvH9A8gd3paasOkD/W4RRSEu?=
 =?us-ascii?Q?kg0Sx369AXyuCXShZmAddjYuiHKNLF8OEIlzjGXAVBbEw3gOH7aOZ6MFRwWo?=
 =?us-ascii?Q?czVlbBKqpecZSuj4cpC8XL/Q/3eVFqlPZ0vLv6pP2gmUwnXH05rbDaD8W+EB?=
 =?us-ascii?Q?VPpbx+D1h+rCA/6csHhAq7/8M+NDPfBax9wLLlf3GHQ2VoTPRYaNE/MPaRs5?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c83099-f990-48f9-4f57-08dbaa50333f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 18:29:23.9694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtUuzrwGn2LOjSV/h5CTH80you/0CcmoqYZzZoXJrGuRdSMgPSSQgAtcE5NFVj4fhUmcVmMUjgtrif0GjKM9Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Fix array of binds
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

On Thu, Aug 31, 2023 at 08:00:48AM -0700, Matthew Brost wrote:
> If multiple bind ops in an array of binds touch the same address range
> invalid GPUVA operations are generated as each GPUVA operation is
> generated based on the orignal GPUVA state. To fix this, after each
> GPUVA operations is generated, commit the GPUVA operation updating the
> GPUVA state so subsequent bind ops can see a current GPUVA state.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 418 +++++++++++++++++++------------------
>  1 file changed, 212 insertions(+), 206 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7d64da0b3b70..b8c50ffbb623 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2426,24 +2426,73 @@ static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
>  	return SZ_4K;
>  }
>  
> -/*
> - * Parse operations list and create any resources needed for the operations
> - * prior to fully committing to the operations. This setup can fail.
> - */
> +static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> +{
> +	int err = 0;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		err |= xe_vm_insert_vma(vm, op->map.vma);
> +		if (!err)
> +			op->flags |= XE_VMA_OP_COMMITTED;
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> +				 true);
> +		op->flags |= XE_VMA_OP_COMMITTED;
> +
> +		if (op->remap.prev) {
> +			err |= xe_vm_insert_vma(vm, op->remap.prev);
> +			if (!err)
> +				op->flags |= XE_VMA_OP_PREV_COMMITTED;
> +			if (!err && op->remap.skip_prev)
> +				op->remap.prev = NULL;
> +		}
> +		if (op->remap.next) {
> +			err |= xe_vm_insert_vma(vm, op->remap.next);
> +			if (!err)
> +				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
> +			if (!err && op->remap.skip_next)
> +				op->remap.next = NULL;
> +		}
> +
> +		/* Adjust for partial unbind after removin VMA from VM */
> +		if (!err) {
> +			op->base.remap.unmap->va->va.addr = op->remap.start;
> +			op->base.remap.unmap->va->va.range = op->remap.range;
> +		}
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> +		op->flags |= XE_VMA_OP_COMMITTED;
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		op->flags |= XE_VMA_OP_COMMITTED;
> +		break;
> +	default:
> +		XE_WARN_ON("NOT POSSIBLE");
> +	}
> +
> +	return err;
> +}
> +
> +
>  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> -				   struct drm_gpuva_ops **ops, int num_ops_list,
> +				   struct drm_gpuva_ops *ops,
>  				   struct xe_sync_entry *syncs, u32 num_syncs,
> -				   struct list_head *ops_list, bool async)
> +				   struct list_head *ops_list, bool last,
> +				   bool async)
>  {
>  	struct xe_vma_op *last_op = NULL;
> -	struct list_head *async_list = NULL;
>  	struct async_op_fence *fence = NULL;
> -	int err, i;
> +	struct drm_gpuva_op *__op;
> +	int err = 0;
>  
>  	lockdep_assert_held_write(&vm->lock);
> -	XE_WARN_ON(num_ops_list > 1 && !async);
>  
> -	if (num_syncs && async) {
> +	if (last && num_syncs && async) {
>  		u64 seqno;
>  
>  		fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> @@ -2462,145 +2511,145 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  		}
>  	}
>  
> -	for (i = 0; i < num_ops_list; ++i) {
> -		struct drm_gpuva_ops *__ops = ops[i];
> -		struct drm_gpuva_op *__op;
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		bool first = list_empty(ops_list);
>  
> -		drm_gpuva_for_each_op(__op, __ops) {
> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> -			bool first = !async_list;
> +		XE_WARN_ON(!first && !async);
> +
> +		INIT_LIST_HEAD(&op->link);
> +		list_add_tail(&op->link, ops_list);
>  
> -			XE_WARN_ON(!first && !async);
> +		if (first) {
> +			op->flags |= XE_VMA_OP_FIRST;
> +			op->num_syncs = num_syncs;
> +			op->syncs = syncs;
> +		}
>  
> -			INIT_LIST_HEAD(&op->link);
> -			if (first)
> -				async_list = ops_list;
> -			list_add_tail(&op->link, async_list);
> +		op->q = q;
> +
> +		switch (op->base.op) {
> +		case DRM_GPUVA_OP_MAP:
> +		{
> +			struct xe_vma *vma;
>  
> -			if (first) {
> -				op->flags |= XE_VMA_OP_FIRST;
> -				op->num_syncs = num_syncs;
> -				op->syncs = syncs;
> +			vma = new_vma(vm, &op->base.map,
> +				      op->tile_mask, op->map.read_only,
> +				      op->map.is_null);
> +			if (IS_ERR(vma)) {
> +				err = PTR_ERR(vma);
> +				goto free_fence;
>  			}
>  
> -			op->q = q;
> +			op->map.vma = vma;
> +			break;
> +		}
> +		case DRM_GPUVA_OP_REMAP:
> +		{
> +			struct xe_vma *old =
> +				gpuva_to_vma(op->base.remap.unmap->va);
>  
> -			switch (op->base.op) {
> -			case DRM_GPUVA_OP_MAP:
> -			{
> -				struct xe_vma *vma;
> +			op->remap.start = xe_vma_start(old);
> +			op->remap.range = xe_vma_size(old);
>  
> -				vma = new_vma(vm, &op->base.map,
> -					      op->tile_mask, op->map.read_only,
> -					      op->map.is_null);
> +			if (op->base.remap.prev) {
> +				struct xe_vma *vma;
> +				bool read_only =
> +					op->base.remap.unmap->va->flags &
> +					XE_VMA_READ_ONLY;
> +				bool is_null =
> +					op->base.remap.unmap->va->flags &
> +					DRM_GPUVA_SPARSE;
> +
> +				vma = new_vma(vm, op->base.remap.prev,
> +					      op->tile_mask, read_only,
> +					      is_null);
>  				if (IS_ERR(vma)) {
>  					err = PTR_ERR(vma);
>  					goto free_fence;
>  				}
>  
> -				op->map.vma = vma;
> -				break;
> +				op->remap.prev = vma;
> +
> +				/*
> +				 * Userptr creates a new SG mapping so
> +				 * we must also rebind.
> +				 */
> +				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> +					IS_ALIGNED(xe_vma_end(vma),
> +						   xe_vma_max_pte_size(old));
> +				if (op->remap.skip_prev) {
> +					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> +					op->remap.range -=
> +						xe_vma_end(vma) -
> +						xe_vma_start(old);
> +					op->remap.start = xe_vma_end(vma);
> +				}
>  			}
> -			case DRM_GPUVA_OP_REMAP:
> -			{
> -				struct xe_vma *old =
> -					gpuva_to_vma(op->base.remap.unmap->va);
> -
> -				op->remap.start = xe_vma_start(old);
> -				op->remap.range = xe_vma_size(old);
> -
> -				if (op->base.remap.prev) {
> -					struct xe_vma *vma;
> -					bool read_only =
> -						op->base.remap.unmap->va->flags &
> -						XE_VMA_READ_ONLY;
> -					bool is_null =
> -						op->base.remap.unmap->va->flags &
> -						DRM_GPUVA_SPARSE;
> -
> -					vma = new_vma(vm, op->base.remap.prev,
> -						      op->tile_mask, read_only,
> -						      is_null);
> -					if (IS_ERR(vma)) {
> -						err = PTR_ERR(vma);
> -						goto free_fence;
> -					}
> -
> -					op->remap.prev = vma;
> -
> -					/*
> -					 * Userptr creates a new SG mapping so
> -					 * we must also rebind.
> -					 */
> -					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> -						IS_ALIGNED(xe_vma_end(vma),
> -							   xe_vma_max_pte_size(old));
> -					if (op->remap.skip_prev) {
> -						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> -						op->remap.range -=
> -							xe_vma_end(vma) -
> -							xe_vma_start(old);
> -						op->remap.start = xe_vma_end(vma);
> -					}
> +
> +			if (op->base.remap.next) {
> +				struct xe_vma *vma;
> +				bool read_only =
> +					op->base.remap.unmap->va->flags &
> +					XE_VMA_READ_ONLY;
> +
> +				bool is_null =
> +					op->base.remap.unmap->va->flags &
> +					DRM_GPUVA_SPARSE;
> +
> +				vma = new_vma(vm, op->base.remap.next,
> +					      op->tile_mask, read_only,
> +					      is_null);
> +				if (IS_ERR(vma)) {
> +					err = PTR_ERR(vma);
> +					goto free_fence;
>  				}
>  
> -				if (op->base.remap.next) {
> -					struct xe_vma *vma;
> -					bool read_only =
> -						op->base.remap.unmap->va->flags &
> -						XE_VMA_READ_ONLY;
> -
> -					bool is_null =
> -						op->base.remap.unmap->va->flags &
> -						DRM_GPUVA_SPARSE;
> -
> -					vma = new_vma(vm, op->base.remap.next,
> -						      op->tile_mask, read_only,
> -						      is_null);
> -					if (IS_ERR(vma)) {
> -						err = PTR_ERR(vma);
> -						goto free_fence;
> -					}
> -
> -					op->remap.next = vma;
> -
> -					/*
> -					 * Userptr creates a new SG mapping so
> -					 * we must also rebind.
> -					 */
> -					op->remap.skip_next = !xe_vma_is_userptr(old) &&
> -						IS_ALIGNED(xe_vma_start(vma),
> -							   xe_vma_max_pte_size(old));
> -					if (op->remap.skip_next) {
> -						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> -						op->remap.range -=
> -							xe_vma_end(old) -
> -							xe_vma_start(vma);
> -					}
> +				op->remap.next = vma;
> +
> +				/*
> +				 * Userptr creates a new SG mapping so
> +				 * we must also rebind.
> +				 */
> +				op->remap.skip_next = !xe_vma_is_userptr(old) &&
> +					IS_ALIGNED(xe_vma_start(vma),
> +						   xe_vma_max_pte_size(old));
> +				if (op->remap.skip_next) {
> +					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> +					op->remap.range -=
> +						xe_vma_end(old) -
> +						xe_vma_start(vma);
>  				}
> -				break;
> -			}
> -			case DRM_GPUVA_OP_UNMAP:
> -			case DRM_GPUVA_OP_PREFETCH:
> -				/* Nothing to do */
> -				break;
> -			default:
> -				XE_WARN_ON("NOT POSSIBLE");
>  			}
> -
> -			last_op = op;
> +			break;
> +		}
> +		case DRM_GPUVA_OP_UNMAP:
> +		case DRM_GPUVA_OP_PREFETCH:
> +			/* Nothing to do */
> +			break;
> +		default:
> +			XE_WARN_ON("NOT POSSIBLE");
>  		}
>  
> -		last_op->ops = __ops;
> +		last_op = op;
> +
> +		err = xe_vma_op_commit(vm, op);
> +		if (err)
> +			goto free_fence;
>  	}
>  
> -	if (!last_op)
> -		return -ENODATA;
> +	/* FIXME: Unhandled corner case */
> +	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
>  
> -	last_op->flags |= XE_VMA_OP_LAST;
> -	last_op->num_syncs = num_syncs;
> -	last_op->syncs = syncs;
> -	last_op->fence = fence;
> +	if (!last_op)
> +		goto free_fence;
> +	last_op->ops = ops;
> +	if (last) {
> +		last_op->flags |= XE_VMA_OP_LAST;
> +		last_op->num_syncs = num_syncs;
> +		last_op->syncs = syncs;
> +		last_op->fence = fence;
> +	}
>  
>  	return 0;
>  
> @@ -2609,58 +2658,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  	return err;
>  }
>  
> -static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> -{
> -	int err = 0;
> -
> -	lockdep_assert_held_write(&vm->lock);
> -
> -	switch (op->base.op) {
> -	case DRM_GPUVA_OP_MAP:
> -		err |= xe_vm_insert_vma(vm, op->map.vma);
> -		if (!err)
> -			op->flags |= XE_VMA_OP_COMMITTED;
> -		break;
> -	case DRM_GPUVA_OP_REMAP:
> -		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> -				 true);
> -		op->flags |= XE_VMA_OP_COMMITTED;
> -
> -		if (op->remap.prev) {
> -			err |= xe_vm_insert_vma(vm, op->remap.prev);
> -			if (!err)
> -				op->flags |= XE_VMA_OP_PREV_COMMITTED;
> -			if (!err && op->remap.skip_prev)
> -				op->remap.prev = NULL;
> -		}
> -		if (op->remap.next) {
> -			err |= xe_vm_insert_vma(vm, op->remap.next);
> -			if (!err)
> -				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
> -			if (!err && op->remap.skip_next)
> -				op->remap.next = NULL;
> -		}
> -
> -		/* Adjust for partial unbind after removin VMA from VM */
> -		if (!err) {
> -			op->base.remap.unmap->va->va.addr = op->remap.start;
> -			op->base.remap.unmap->va->va.range = op->remap.range;
> -		}
> -		break;
> -	case DRM_GPUVA_OP_UNMAP:
> -		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> -		op->flags |= XE_VMA_OP_COMMITTED;
> -		break;
> -	case DRM_GPUVA_OP_PREFETCH:
> -		op->flags |= XE_VMA_OP_COMMITTED;
> -		break;
> -	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> -	}
> -
> -	return err;
> -}
> -
>  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  			       struct xe_vma_op *op)
>  {
> @@ -2878,11 +2875,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>  
> -		down_read(&vm->userptr.notifier_lock);
> -		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -		up_read(&vm->userptr.notifier_lock);
> -		if (post_commit)
> -			xe_vm_insert_vma(vm, vma);
> +		if (vma) {
> +			down_read(&vm->userptr.notifier_lock);
> +			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> +			up_read(&vm->userptr.notifier_lock);
> +			if (post_commit)
> +				xe_vm_insert_vma(vm, vma);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_REMAP:
> @@ -2897,11 +2896,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			prep_vma_destroy(vm, op->remap.next, next_post_commit);
>  			xe_vma_destroy_unlocked(op->remap.next);
>  		}
> -		down_read(&vm->userptr.notifier_lock);
> -		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -		up_read(&vm->userptr.notifier_lock);
> -		if (post_commit)
> -			xe_vm_insert_vma(vm, vma);
> +		if (vma) {
> +			down_read(&vm->userptr.notifier_lock);
> +			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> +			up_read(&vm->userptr.notifier_lock);
> +			if (post_commit)
> +				xe_vm_insert_vma(vm, vma);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_PREFETCH:
> @@ -2990,20 +2991,16 @@ static void xe_vma_op_work_func(struct work_struct *w)
>  	}
>  }
>  
> -static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
> -				    struct list_head *ops_list, bool async)
> +static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> +				     struct list_head *ops_list, bool async)
>  {
>  	struct xe_vma_op *op, *last_op, *next;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	list_for_each_entry(op, ops_list, link) {
> +	list_for_each_entry(op, ops_list, link)
>  		last_op = op;
> -		err = xe_vma_op_commit(vm, op);
> -		if (err)
> -			goto unwind;
> -	}
>  
>  	if (!async) {
>  		err = xe_vma_op_execute(vm, last_op);
> @@ -3042,28 +3039,29 @@ static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
>  	return err;
>  }
>  
> -/*
> - * Unwind operations list, called after a failure of vm_bind_ioctl_ops_create or
> - * vm_bind_ioctl_ops_parse.
> - */
>  static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  				     struct drm_gpuva_ops **ops,
>  				     int num_ops_list)
>  {
>  	int i;
>  
> -	for (i = 0; i < num_ops_list; ++i) {
> +	for (i = num_ops_list - 1; i; ++i) {
>  		struct drm_gpuva_ops *__ops = ops[i];
>  		struct drm_gpuva_op *__op;
>  
>  		if (!__ops)
>  			continue;
>  
> -		drm_gpuva_for_each_op(__op, __ops) {
> +		drm_gpuva_for_each_op_reverse(__op, __ops) {
>  			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
> -			xe_vma_op_unwind(vm, op, false, false, false);
> +			xe_vma_op_unwind(vm, op,
> +					 op->flags & XE_VMA_OP_COMMITTED,
> +					 op->flags & XE_VMA_OP_PREV_COMMITTED,
> +					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
>  		}
> +
> +		drm_gpuva_ops_free(&vm->mgr, __ops);
>  	}
>  }
>  
> @@ -3384,14 +3382,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			ops[i] = NULL;
>  			goto unwind_ops;
>  		}
> +
> +		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
> +					      &ops_list,
> +					      i == args->num_binds - 1,
> +					      async);
> +		if (err)
> +			goto unwind_ops;
>  	}
>  
> -	err = vm_bind_ioctl_ops_parse(vm, q, ops, args->num_binds,
> -				      syncs, num_syncs, &ops_list, async);
> -	if (err)
> +	/* Nothing to do */
> +	if (list_empty(&ops_list)) {
> +		err = -ENODATA;
>  		goto unwind_ops;
> +	}
>  
> -	err = vm_bind_ioctl_ops_commit(vm, &ops_list, async);
> +	err = vm_bind_ioctl_ops_execute(vm, &ops_list, async);
>  	up_write(&vm->lock);
>  
>  	for (i = 0; i < args->num_binds; ++i)
> -- 
> 2.34.1
> 
