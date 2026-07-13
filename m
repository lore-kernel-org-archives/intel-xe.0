Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258E7C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 20:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DB210EB09;
	Mon, 13 Jul 2026 20:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABmWgajc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3CA10EB09
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783976176; x=1815512176;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M5Y6srYbTXzHXBQIFllEtLSG3TWCveqgKVJsA/SfdTE=;
 b=ABmWgajcpnZVYgyLHCKyd3l9vYAwzgV0esFNDf4Fhr+sMsk2SVYOzJLM
 FzEoWxQ7LltkDMwRcHsUF/7vULboEb/LHHM/9ZJIvox4CkXYcFcpk182p
 CFAfFBZif332XMR3+nxJmA0YTNWf+q1SIbDM6tESgQzo4BLmhb0UDg3UU
 PPkn3UP1VrLeLe4PIHTiGmGTvu6Z3si8wln3K8RKPlHxMbN+cd0pn2GiF
 Norw/tWt8PXgdo5uuFRvp6rjkU94/z0KNzGybOL6zYKinCqVCpeSXhnEx
 Mk6VINh6RfV/sDw/t0QeLrkgDlb3oeqEPPLKU8fSSOrjRT/uo77I0a9e/ w==;
X-CSE-ConnectionGUID: oDEmN9nMScWXzKeXYEG5QQ==
X-CSE-MsgGUID: JmoN6dKZQp+LnR9mIprxlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83712268"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83712268"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 13:56:15 -0700
X-CSE-ConnectionGUID: V2o46mcXTj6aQhUS+7Pp3Q==
X-CSE-MsgGUID: x7AL0ojWQ5idIrBjl4PbVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259230906"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 13:56:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 13:56:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 13:56:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 13:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbU52IwgnGQ7FFNZOJoYdemHq3N0Os9kvJKH37ctoBWk2A6aFTg3XAicle24G0Pcxm9EvwM/wS/SjRIzpaJhwl7BxUMRryUB2ttgth0XtMK15DTQqqXNNMsvtnotQeu6dgY95cDJ7jSVzoUlVaYD+XuPz8Z/V1EzBE5ZhdO1Omh0YZhLBGaAU6pTaTkWqTi1PtMiUSJGHSvqskjeJalzPJ2jp+Eqsi8o3/YmyzkbaCd8vN2Ox4Uud75DsKpEhPfqPhi39yMbX1xqgtDgQg+YJWrsgXGz4HQ9TdKvKWhfNtuHpTWL+L9EaJUFgOq7nxsr1Anv9zT9u/iRFy56GynbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lImFal/S7qRltNliQIzSKOiJw+oEQg//KZHlupj9ldU=;
 b=i5+phgtAddzEhhcCaFMYJNh0raL+Fo1z2Fm5gRSO5vCzqLEBjNlMKfRgBMTVU4kq4rwBt3DXXlEeEEniHggopwjyf87bciyZkvt6ETVt0vGutoxU1moy0H091ntRlR9IvR+4oHTtugMgZdlewZE4HnZDYyEE3GpfYNb54aKC2wjm0TKNPrlPHZGhTHivzptpnUL6AGq3LIeSBXcz9JX66Yg2TIwA0ifWuq4s1/lZG2AHyQ5dOXVoO77uTuoe2xBw5+304pdS43tGgT5UyYW+4JND3NXgOdY7lglS8ggDHLNN3cS9MxsjWCjwj+n9sMOov8otVEp/9DaQNyPDFQXQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 20:56:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 20:56:10 +0000
Date: Mon, 13 Jul 2026 13:56:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe: Flush L2 asynchronously in
 xe_bo_trigger_rebind()
Message-ID: <alVQ6FRxDseVVPgE@gsse-cloud1.jf.intel.com>
References: <20260709225309.2056268-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709225309.2056268-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0141.namprd04.prod.outlook.com
 (2603:10b6:303:84::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7221e3-a135-4357-9882-08dee1212b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: wwNGjGxdhZnXb41iTQ8h6yLQmO7SZ9px0kKUyiH0rS9jkLbeNFqjR/NxullZaxi/tvZtDnyF2kaWmhhjZt1RZFS8H1zXgcgICr73eKwNOfhm3RB7m/3MqbmVhrElmmlp9nPcsLskFQN75r0lno0M5B/ccUTvNDu25vS061iKfU92Jq1Nc5w4vssuNjJv6ANLEKcmo8Z4xNHYX27TiIIlxM298Mls+RZVqwC5U9TtBgSZe8xW7LT/kRxAF6pzv+BCrVzanxZ2XIzEWARUaLVbaBV32d1NEawmbIUhE7koBRS1JrMdIn+a7sOiF/9iE4XSCvKG2csVP4R16melbnoADIF4HEOiEol2Xm0svHxuwgbqMancQ654RLiadzFYcl7CdW+Dqpf2JB8IhTryVX1kv1Na/8VsLp7KUl3Lp24qFBOhw/pXm1u6UwDbW1eFF3gtKpYKslphNRZYSciK2GxkPbAiPToGxrlPZC0MJZkEO7mLHhWzC/6mw2CtKTs4R/y9pp+3atR29a+pGhLvfoex6Ie6ah7N4azpNAmC4j8ZZHWTWI/F5w/VHCzEoVJtzV8Ks13ITy6fGkXNAFp9L6l3qFY5BG1aMi/VrTeFKms7HpEu7u55Mi3LX1C/2GK8MGhh5B7TlrceR9wX5nEYaQLeUBq4HwBCP9I2Ot87gJrk8hM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?W+py+59dxl1JHZWCsWiTsXGNWmQZSEkFixby4Pdf7UtH4ZnfWo+VFHtKRi?=
 =?iso-8859-1?Q?9WExkfzKX0yzfmixkLOipzJHWtCoWWFiuH1FIcbtMP29eNQvPgu3TQEHdw?=
 =?iso-8859-1?Q?RaIWl+aKuYPNgzeDvLdUPw7o/epr69GBnB6dEj94aP02V1sytI6bsrlWvo?=
 =?iso-8859-1?Q?+6yTbDQn22TRUvqYNPZE+3sHavrBfsvc2XWKhFVrSWX7wCQJSSzISQL35E?=
 =?iso-8859-1?Q?muzUjmJE43bvudhPaqkUJX1rpoTvhypI/iXPL6ZNnLQpSTLLtf7Rr9wBY+?=
 =?iso-8859-1?Q?9rrEGGaSsL1lzfbCSqQqM+p7mrw/baERkReQH9KQUIiYjc0QlJESPgdffS?=
 =?iso-8859-1?Q?IfsbVigbhDwcQrAcLu87U8lZbv7vNitVu3saJuFhU7Mxff9GNP17zOTB3x?=
 =?iso-8859-1?Q?E1gvw7n5vvwHw6xsLbA9jWB6Irn+U0hfuWlrBtTKVEJcWIUlH5lcL7HJnq?=
 =?iso-8859-1?Q?pvo/Gt/vA2gXDQMXTgfcz0zwYyRBPV35uzELhU8sbSqHP/tnLt+DFIZsP8?=
 =?iso-8859-1?Q?0Bklzzc3bDcxzsP+ykEgoyS6oVIudz73yVAZHM5pbS50x3ZGINmQ5qsZs5?=
 =?iso-8859-1?Q?vxhecwji/bUFhyQmNOV/9/UsC9zJ7m1JVcoQDsknmYW1IOWuYMjZ5vIJyh?=
 =?iso-8859-1?Q?oVoxocpfnEKmeVM8pawMKVejZWdgUN2rop1OBPTEoHwgADpf8LTevsg8Rh?=
 =?iso-8859-1?Q?8mqE7yn5G+f+XbKCdSvrms5zcQE1uNufDLtWAbHxAaqAqQzU9ZwTmNtffp?=
 =?iso-8859-1?Q?tnyc/MUeSLvSMjHlgnE99TzSEDC4E1d1KYegc8f5qqW5DQTE7JR2ikZhDJ?=
 =?iso-8859-1?Q?rt/BcPYqZzxDZl4zg0ss+ZfbPgaf0uJVwsfKinxW9y+BA3VPk2U6FOOu6A?=
 =?iso-8859-1?Q?hNWIZVksrNqxYXvgX6uEU+/cYo0dAN3OP4ZlaDOX2/MrLe1ntjo4ij0zWX?=
 =?iso-8859-1?Q?CCayu7rKBkD9burumgikEeVPqWWmLpRTXdaLZUIFXnXOCooseAjPKeWcZx?=
 =?iso-8859-1?Q?0DScIC5BfDi2mmzsRSx2PIqDxoa1D49rC2eyR9pd0Ac3JHeQWKOLuIrDOp?=
 =?iso-8859-1?Q?nXHMoseQ89ZK79o1AOL4p/wP7zPlIBrfwYPWDYKbl0lLHAltQ2pGXmP5Fi?=
 =?iso-8859-1?Q?3WbqET+mh8+6ZdboaurLOF+JaHWLdVqmIUGazAfxGLQgtZQjVWP51LdoKW?=
 =?iso-8859-1?Q?QuJ+umseR3b6aFKNGVwHt5s30U0qMTiL3VHRmRDWcpo43XvPitO/eUEkr9?=
 =?iso-8859-1?Q?THKA+7+bRy084HPfWSUGDEJNc01s4ROrLaS5dVD9DwpxfG2aZdK/noP2dy?=
 =?iso-8859-1?Q?vh7BXnB3ZR1mgAz+yUPvZaIGOZ3aK6cloQE4OGRcjHwsyeycsMa0L7vmqU?=
 =?iso-8859-1?Q?2im3glvWT9kHQNUDX1EzKksRh2PzhFcxmIDgifmuLpnEa0jmXrWKEizZ1f?=
 =?iso-8859-1?Q?zD0vruEKRGeAiZJHLkpVEZ9oyV+wNabMe1jRZxCVqoJFj6+FX8kM2wbDiN?=
 =?iso-8859-1?Q?ClsdZbk3A+xUR8N8Yz9DYPqv5Y2grzvHWGXb5hQi9SfMpeXhj8+1e5slna?=
 =?iso-8859-1?Q?vsrxgdv9zDoJUM3UmGr2aUDmHRRUlA94QEn+SKyb6XCV/1tPENXqRvupcu?=
 =?iso-8859-1?Q?Ct74+gTUGiH17XF75bE8hpBdDbB9s4OMvDcgqXUU1zMGAhFnRn4wqrsyzh?=
 =?iso-8859-1?Q?JQB2AalVrdcfpmlrh1OZ6nrfMSwMl9xUlAHVQjsBbe+WYIksZiR6xHzpT0?=
 =?iso-8859-1?Q?EW4E3RVEYePWH6El8n9fmhWX/h5CSbpo0qswtVyEkguFTeU/RqRhBQbFbr?=
 =?iso-8859-1?Q?h+H0hB5EiEiHYVNj9v638KexqFNeftk=3D?=
X-Exchange-RoutingPolicyChecked: pC6VoH3/BYYTZasCaGpNY3eiof0QJlWS/fkDOV1D5jar8Jiij9HRYFX/oViX+TXWMETjTCVGYb6ytmkULLgXBFFw3kDZdmSUu5+SUlNJXBD/Vv5SrOQ+mBZ8V15spQkt4oh4kryikizoMOvA16vcFotDAeKysutoiS9uJrsPT/qfvHyLaIzWyrUSPgIIZQzNhUgpKjpqJYw7h7fzQlilNxtf+bGOmKaED/U5bRb3TKGyR5pw0u/6qNntliAgy1kNCDcHG8ruMg9jIgYqE4NMBHc/fglawvw0kcTKETkRCuk6Hnggxd+aJgd5q+GDHUQExOWd/ij5kWYlgwSKOlXG8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7221e3-a135-4357-9882-08dee1212b17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 20:56:10.8007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: turJhpoBcV1hIydhc6tfcsyiJwZFkXqAxAmUvGy4eeWD//8dI/mdiZHw3UbjBBGR3qXIx8mOqTQkDfwF3FaCFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
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

On Thu, Jul 09, 2026 at 03:53:09PM -0700, Matthew Brost wrote:
> On L2-flush-optimized HW with a dma-resv (non-fault) VM, evicting a BO
> only needs to flush the L2 cache before the migration copy runs; the
> mappings themselves are torn down and rebuilt lazily via
> drm_gpuvm_bo_evict() and a subsequent rebind. Today this flush is done
> by waiting for the BO to go idle and then issuing a synchronous TLB
> invalidation per mapping VMA from inside xe_bo_trigger_rebind(). Both
> the idle wait and the synchronous invalidation stall the calling thread
> while holding the BO dma-resv lock, serializing the move behind all
> in-flight GPU work on the BO.
> 
> Replace this with an asynchronous flush. Add xe_vm_flush_vm_bo_tlb_async()
> which, for each VMA mapping the BO on each present tile, queues a TLB
> invalidation job on the tile migrate (kernel) exec queue. The jobs depend
> on the BO's in-flight GPU work, captured once as a singleton over
> DMA_RESV_USAGE_BOOKKEEP, so the flush only fires once the GPU is done with
> the current mapping. Each job's completion fence is installed into the
> BO's dma-resv as a DMA_RESV_USAGE_KERNEL fence, so the migration copy -
> which waits on the resv - waits on the flush without stalling this thread.
> 
> No PTEs are zapped and vma->tile_invalidated is left untouched: the
> mapping stays valid until the lazy rebind, and the only work performed
> here is the L2 flush. On any failure the caller falls back to the
> existing blocking wait-idle plus xe_vm_invalidate_vma() path.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> ---
> v2: Less verbose comment (Thomas)
> ---
>  drivers/gpu/drm/xe/xe_bo.c |   7 +++
>  drivers/gpu/drm/xe/xe_vm.c | 125 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h |   5 ++
>  3 files changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 85e6d9a0f575..aa3b60ac2e01 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -686,6 +686,13 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  			 */
>  			if (!xe_device_is_l2_flush_optimized(xe))
>  				continue;
> +
> +			/*
> +			 * Attempt to flush L2 async, fallback to sync flush on
> +			 * failure
> +			 */
> +			if (!xe_vm_flush_vm_bo_tlb_async(vm, bo, vm_bo))

Sashiko pointed out this should likely be gated on !ctx->no_wait_gpu.

I think that is correct what do you think Thomas?

Matt

> +				continue;
>  		}
>  
>  		if (!idle) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 73ac031ffb04..4557a8a4d270 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -39,6 +39,7 @@
>  #include "xe_sync.h"
>  #include "xe_tile.h"
>  #include "xe_tlb_inval.h"
> +#include "xe_tlb_inval_job.h"
>  #include "xe_trace_bo.h"
>  #include "xe_vm_madvise.h"
>  #include "xe_wa.h"
> @@ -4401,6 +4402,130 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	return ret;
>  }
>  
> +/*
> + * xe_vma_tlb_flush_client - Queue an async TLB flush for one VMA on one client
> + *
> + * Create and push a TLB invalidation job on the tile migrate (kernel) exec
> + * queue covering @vma's range, depending on @dep (the BO's in-flight GPU work)
> + * so the flush only fires once the GPU is done with the current mapping. The
> + * job's completion fence is installed into @resv as a KERNEL fence so the
> + * subsequent migration waits on the flush. No PTEs are zapped; this only
> + * flushes L2 via the TLB invalidation.
> + */
> +static int xe_vma_tlb_flush_client(struct xe_vm *vm, struct xe_vma *vma,
> +				   struct xe_tile *tile, struct xe_gt *gt,
> +				   struct dma_resv *resv, struct dma_fence *dep,
> +				   int type)
> +{
> +	struct xe_exec_queue *q = xe_migrate_exec_queue(tile->migrate);
> +	struct xe_tlb_inval_job *job;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	job = xe_tlb_inval_job_create(q, &gt->tlb_inval,
> +				      q->tlb_inval[type].dep_scheduler, vm,
> +				      xe_vma_start(vma), xe_vma_end(vma), type);
> +	if (IS_ERR(job))
> +		return PTR_ERR(job);
> +
> +	err = xe_tlb_inval_job_alloc_dep(job);
> +	if (err)
> +		goto out_put;
> +
> +	err = dma_resv_reserve_fences(resv, 1);
> +	if (err)
> +		goto out_put;
> +
> +	/* Cannot fail; consumes a ref on @dep and returns a referenced fence. */
> +	fence = xe_tlb_inval_job_push(job, tile->migrate, dep);
> +	dma_resv_add_fence(resv, fence, DMA_RESV_USAGE_KERNEL);
> +	dma_fence_put(fence);
> +
> +out_put:
> +	/* Drop the creation reference (destroys the job if it was not pushed). */
> +	xe_tlb_inval_job_put(job);
> +	return err;
> +}
> +
> +/**
> + * xe_vm_flush_vm_bo_tlb_async - Asynchronously flush TLBs for a vm_bo's mappings
> + * @vm: The VM @vm_bo belongs to
> + * @bo: The buffer object being moved
> + * @vm_bo: The gpuvm_bo linking @bo into @vm
> + *
> + * On L2-flush-optimized HW a BO move only needs to flush L2 (via a TLB
> + * invalidation) for the BO's live mappings; the mappings themselves are torn
> + * down and rebuilt lazily via the eviction/rebind path, so no PTEs need to be
> + * zapped here. Rather than blocking the caller on a synchronous invalidation,
> + * issue a TLB invalidation job per VMA per TLB-invalidation client (per present
> + * tile, primary and media GT). Each job waits on the BO's in-flight GPU work
> + * (all dma-resv usages) and its completion fence is installed into the BO's
> + * dma-resv KERNEL slots, so the following migration waits on the flush without
> + * stalling this thread.
> + *
> + * The caller must hold the BO's dma-resv lock and @vm must not be in fault
> + * mode.
> + *
> + * Return: 0 on success, negative error code on failure. On failure the caller
> + * should fall back to the blocking xe_vm_invalidate_vma() path; any jobs
> + * already queued install harmless extra flush fences.
> + */
> +int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
> +				struct drm_gpuvm_bo *vm_bo)
> +{
> +	struct xe_device *xe = vm->xe;
> +	struct dma_resv *resv = bo->ttm.base.resv;
> +	struct dma_fence *dep = NULL;
> +	struct drm_gpuva *gpuva;
> +	int err;
> +
> +	dma_resv_assert_held(resv);
> +	xe_assert(xe, !xe_vm_in_fault_mode(vm));
> +
> +	/*
> +	 * Single fence capturing all in-flight GPU work on the BO; the TLB
> +	 * invalidation jobs depend on it so the flush fires only once the GPU
> +	 * is done with the current mapping.
> +	 */
> +	err = dma_resv_get_singleton(resv, DMA_RESV_USAGE_BOOKKEEP, &dep);
> +	if (err)
> +		return err;
> +	if (!dep)
> +		dep = dma_fence_get_stub();
> +
> +	drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +		struct xe_tile *tile;
> +		u8 id;
> +
> +		if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma))
> +			continue;
> +
> +		for_each_tile(tile, xe, id) {
> +			if (!(vma->tile_present & BIT(id)))
> +				continue;
> +
> +			err = xe_vma_tlb_flush_client(vm, vma, tile,
> +						      tile->primary_gt, resv, dep,
> +						      XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +			if (err)
> +				goto out;
> +
> +			if (tile->media_gt) {
> +				err = xe_vma_tlb_flush_client(vm, vma, tile,
> +							      tile->media_gt, resv, dep,
> +							      XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
> +				if (err)
> +					goto out;
> +			}
> +		}
> +	}
> +
> +out:
> +	dma_fence_put(dep);
> +	return err;
> +}
> +
>  int xe_vm_validate_protected(struct xe_vm *vm)
>  {
>  	struct drm_gpuva *gpuva;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c5b900f38ded..dd5b070eaede 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -26,6 +26,8 @@ struct ttm_buffer_object;
>  
>  struct dma_fence;
>  
> +struct xe_bo;
> +struct drm_gpuvm_bo;
>  struct xe_exec_queue;
>  struct xe_file;
>  struct xe_pagefault;
> @@ -254,6 +256,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
>  int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *batch);
>  
> +int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
> +				struct drm_gpuvm_bo *vm_bo);
> +
>  int xe_vm_validate_protected(struct xe_vm *vm);
>  
>  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> -- 
> 2.34.1
> 
