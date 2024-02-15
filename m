Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C5EC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 17:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF5410E25E;
	Thu, 15 Feb 2024 17:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cB11vxbk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA7410E25E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708017700; x=1739553700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SFPbiDWWneplXUcQQYt6m9BrbOPW0MYg9ERLVnjZYH4=;
 b=cB11vxbkwB2whTbsjrXX/q8PDnaZPJ7n4wEeXNGnUA2UZEEQ/CQfzNO/
 tDciKBJ37/2qklN2tCdZiT0NnpcW3p973eQipAgjOgKaR+At43hr9B24d
 4i1WNYYpHTRRLknCNF/5toTdgMZb9eqSIGSiawMVsjSu9B8BwhwOcQ/il
 rM/zNZpxuvkMWS2dteSn47wOM8GZPSt+vni31LJWbEXgCBhoB+XsmXZfs
 V5R7OAMsmhnr+qJYNbwOaP+eJUoFN8x6glV97m/vMNsQFNbSA5oRR6t4D
 k2XHXQ5rWoG4XmaeVFs8C0x5MjAsi7Uei0sKOuERAwox/E5VfM6icsA5L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="1992738"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="1992738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3513369"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 09:21:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 09:21:39 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 09:21:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 09:21:38 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 09:21:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYY7kAXf8wrbQevGlRzAbGfifTD0sYMhzX/4nYSzr6MVUZV4hpn0fTHU9l8iMoy4ltBhFXvp8rEKcN4NMiPNU8mHim6flSqJLJQSPiRN70q5V8rl/mvPQ+Eo6BjlIJZplITJ9ztX/GkIO7m2TtZFv7Apmb3rTBoJJ+SYb4URyJp0P/7e0rhGDV3wBwW+DF7n9Wq2XCtzY7q+KE21x2J+gIPhLuSNO+7dI9sSbppVRwdhvvAvFyHUM3yGRCqZXxY27e9eiN+2bdnThCQGGvoi0T0J7HX2kEGlM32bcLRUfFhlwsoGQqgpPBf80yq8RJjc/i/8IW+wKoE7nCU2sLJaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1MrqoYgJiBytlPVctmMduBD9AF2TAfrV3PhKRVKV+s=;
 b=WE7tOhrHXyZm0MjQhVLlcoJ70/fwaS5XfiVJvmlFHK/UffxKShPAoC8B+jO4fK41nPp/ub8Kf0fi8Diw02AYC27obeB085EM4NwuJH/zudYd0lduxfJgCyC0USICb+Qhwx3woZdRhZnaTw74AZkh8UHu1pw2Y/wv+6Ty6haCK2HQBZ+gePG2su/k+wF+qPLFBFC0MEn59anHR5f8nPFKOBVhLIopiYYcF3NyKG+gScEKIrPVqTgO+Ud9ROMnu4TbA7aQ7Us1XrvGPtZiL0C3d3CiCx0Q3Tb8nV7i79upcv1WRYk5bG5l1C6IA0fP1TXi9WKgL+01NK753QvwuUXQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Thu, 15 Feb
 2024 17:21:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 17:21:36 +0000
Date: Thu, 15 Feb 2024 17:21:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Deny unbinds if uapi ufence pending
Message-ID: <Zc5IADTQmmZzqs5R@DUT025-TGLU.fm.intel.com>
References: <20240215164021.438913-1-mika.kuoppala@linux.intel.com>
 <20240215164021.438913-3-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215164021.438913-3-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: e85b6a43-e194-4ae0-5174-08dc2e4a907e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucCPDk4pw0iU+902NJFaQa+dLs2rjPP62aXbYNdluAiguM2OmsvEoBjNQ2fP1C2UobHFVCJnHpjkB6ro9uDS/0J6IGMBfFoQk5lnWfVTZXJ3/3JrAFHpFLg3hM84/jDzC5+luaV9vLtBojwDgYfI6tg1X/ronMQvKMgaeoy5RyYnfHD+r7AMspcabNz05bNs9xM3/qgsWO1s+f+XVJMf9nd6m4VcXtXB2KaNAOM1QJyR3h7RaACF/P+B/cJFzwUV0AFNNze+K10Mkh/roAyV4jGVQssFeAQZSMSW6cgzx+D07TUO145jtjqCLoonxQ8aQplpKCzK0CQK7UPVBEcXweKpVdcNvKnd4wZ1xgOkhpgpu87igcQ4O5H9AuKILfOniwWzMFxuRc01VWbzquGMMGleMzS/h9nlSqEp/QKELnYXPYyWn1qthupdtqLo0K1IZkpkafv3k8UsCIEN4qHZiuiZqUEHmAII1xFRj3LOr/F/sIQxPKCaxwvWDVSPQnNf5jaT0XT/7M2PWGA0AHAFBOMnANwGJixj2MSHOYBscK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(478600001)(41300700001)(6486002)(966005)(66556008)(2906002)(54906003)(44832011)(4326008)(5660300002)(8936002)(8676002)(6506007)(66946007)(6666004)(6916009)(316002)(66476007)(83380400001)(38100700002)(66574015)(82960400001)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6kPApW3TD5lYLGFJr4U70xUxIdd7+HK3O5tRbgFI6tJDsmzoFTten24gNN?=
 =?iso-8859-1?Q?BLODiq4j7bN8bPfFiGW+VwzU11MHVoz15ZGjYXKGlLJmg16alEMsGmH8nv?=
 =?iso-8859-1?Q?0Om23OFRUKVi558VDjtcGVkCBLf4OBfxJiHIK6Uo93ewAxUWjpkrNFp3A0?=
 =?iso-8859-1?Q?ZPQTKpJRLu5q9jOICnJ8n2TZPWoR6ht2k/eoS+7p/9MySV1+5SwnuJklYU?=
 =?iso-8859-1?Q?cnFrfOeEhBFOWSpasUcN3cDqtjWt2hDhbcNwXUhkHE/1orf1dNP2l56GTP?=
 =?iso-8859-1?Q?RZXJDMFbcSNoHy26HOeveFfc/ByK6H6aXxVqxfmPM5v0GdPSyeUzdTt4At?=
 =?iso-8859-1?Q?qOv+QhBWdP5A51gJAli10jiRHne+G0FOJwhUHoud6aOGSoTY4ISLjJIayu?=
 =?iso-8859-1?Q?1YZqA8fUlS295fWkx06tELpqXx6DKAuKaaxWLrhrBEkiba43O59+KegBp3?=
 =?iso-8859-1?Q?PTgIHyTbBizIX5QWR6oxKYmOhWqkrqFxYvp0GFTPngt0J1WYxOYwwkAHft?=
 =?iso-8859-1?Q?kVC1wko4Yg8RC6a1qRPHWubkXIR3pR/ikuZqTfq7xtVaI7gSXtOS+GChj9?=
 =?iso-8859-1?Q?3Nx3PSHpNWjir0lagRCLJPML4G85TBJAfKJJ9J42Frp6zAkXGCP0L7YQBJ?=
 =?iso-8859-1?Q?gRZvP58+2/wU0WjA0NQSJGYxi4aU2TSELG9Wc27NogBOKhAs+HQobKsx8+?=
 =?iso-8859-1?Q?CzFFrzu5KGWhk97ZKeiPvQgXm203TQiUKWKvf6ME5sNh3qrg157x0hir46?=
 =?iso-8859-1?Q?r8c4irOgyMSQVN17kjZ9UfgKNmWxXiFi38B6j5CW2t6Jhs6NvZ6k56Qmub?=
 =?iso-8859-1?Q?mCBkhk4RPrIyHP46Zxyj59/gL7Lh5jikOcqlmQel+itnMd1PH+zWlYWybW?=
 =?iso-8859-1?Q?kEtgsC9FYQof8UfG9+u2R56+z1RLebyu6c5yZUmBctU37mY4gzu+aS00Sk?=
 =?iso-8859-1?Q?dGJM4APnCBUL8YdKP005FH9uhyx2gl9JLj5ZN0zf2UHKNtE3mkj0zLt+++?=
 =?iso-8859-1?Q?lvwRfbk8AI0ouaNH1qGsrhfVgUumBcnHpLqRvKP4r201RIb0FqFCAXUC0T?=
 =?iso-8859-1?Q?JmGrXgYiyjf2e23rnYPPB570hkQwD/aWlkgYcYYb4xR5HmmsGxG4xHaT7O?=
 =?iso-8859-1?Q?6Hx7HBwQ0Cp9G27UZIOCblYz1gpax7k+BaL/Vxcev4f/IDuFByrNKtSH7L?=
 =?iso-8859-1?Q?n/RXmBmV1xrIziJGXLZnc80xwNeOKnTde+R7Ak4FkQZAIDU1Ou4UPCNOhz?=
 =?iso-8859-1?Q?Bnigujnhn0rL5mZV5yGhvg92tOnu+yBcCRDwSZ+p4pw0kyzEKeOKtm3cvu?=
 =?iso-8859-1?Q?l1DNxscWZC8dSxnFNmUQJjk67efwoXpExgmEa1gJNSejoTX/aTC++VO1pr?=
 =?iso-8859-1?Q?CyY4+w41B5gO1EVkBwdDGXUFoov4oWliJwq9l2kYwTwN69x/1F+JRqjq9L?=
 =?iso-8859-1?Q?aAWrMLOohtDHQsX+G7XKwoYBQqy08YeeffAjGmjaT91nzOhBNJx2GrM1PU?=
 =?iso-8859-1?Q?O1Mthaq5yn50WirmhnkjZJ6pNRsKvYFtphNa0UqJ5SfsN/sDBGs50TzYLu?=
 =?iso-8859-1?Q?y/UL2rA/CXfWHrzAuWOatXqQ5UiKUCeL7GRq2ewf1O/RDT9FrErrZxfa0H?=
 =?iso-8859-1?Q?WtHM7ioiKnWSvsuO/HBVuWwqJ/R8INOmVDg6nI09ZbX0iue/w02thbaQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e85b6a43-e194-4ae0-5174-08dc2e4a907e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 17:21:36.7519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/vfbJRISm3gDSEnPOVhz9CpXzlpSzF7L6Bw73EygOXEQrh3BFeak1yrUj0bMFCcstmi/KO12Rr8+d9lAwGUmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
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

On Thu, Feb 15, 2024 at 06:40:21PM +0200, Mika Kuoppala wrote:
> If user fence was provided for MAP in vm_bind_ioctl
> and it has still not been signalled, deny UNMAP of said
> vma with EBUSY as long as unsignalled fence exists.
> 
> This guarantees that MAP vs UNMAP sequences won't
> escape under the radar if we ever want to track the
> client's state wrt to completed and accessible MAPs.
> By means of intercepting the ufence release signalling.
> 
> v2: find ufence with num_fences > 1 (Matt)
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 35 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 836a6e849cda8..e9559aa80dc8b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -897,6 +897,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  	struct xe_device *xe = vm->xe;
>  	bool read_only = xe_vma_read_only(vma);
>  
> +	if (vma->ufence) {
> +		xe_sync_ufence_put(vma->ufence);
> +		vma->ufence = NULL;
> +	}
> +
>  	if (xe_vma_is_userptr(vma)) {
>  		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
>  
> @@ -1608,6 +1613,16 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
>  
>  	trace_xe_vma_unbind(vma);
>  
> +	if (vma->ufence) {
> +		struct xe_user_fence * const f = vma->ufence;
> +
> +		if (!xe_sync_ufence_get_status(f))
> +			return ERR_PTR(-EBUSY);
> +
> +		vma->ufence = NULL;
> +		xe_sync_ufence_put(f);
> +	}
> +
>  	if (number_tiles > 1) {
>  		fences = kmalloc_array(number_tiles, sizeof(*fences),
>  				       GFP_KERNEL);
> @@ -1741,6 +1756,21 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
>  	return ERR_PTR(err);
>  }
>  
> +static struct xe_user_fence *
> +find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < num_syncs; i++) {
> +		struct xe_sync_entry *e = &syncs[i];
> +
> +		if (xe_sync_is_ufence(e))
> +			return xe_sync_ufence_get(e);
> +	}
> +
> +	return NULL;
> +}
> +
>  static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
>  			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
>  			u32 num_syncs, bool immediate, bool first_op,
> @@ -1751,6 +1781,11 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	xe_vm_assert_held(vm);
>  
> +	if (vma->ufence)

This path can be triggered by rebinds (in exec path, preempt rebind
worker, or page faults. Those paths could be triggered when a bind is
pending, have no syncs, and we do not want to blow any an existing
vma->ufence.

How about?

ufence = find_ufence_get(syncs, num_syncs);
if (vma->ufence && ufence)
	xe_sync_ufence_put(vma->ufence);
vma->ufence = ufence ?: vma->ufence;

Matt

> +		xe_sync_ufence_put(vma->ufence);
> +
> +	vma->ufence = find_ufence_get(syncs, num_syncs);
> +
>  	if (immediate) {
>  		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
>  				       last_op);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 5ac9c5bebabc3..4a06420b941ea 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -19,6 +19,7 @@
>  
>  struct xe_bo;
>  struct xe_sync_entry;
> +struct xe_user_fence;
>  struct xe_vm;
>  
>  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
> @@ -102,6 +103,12 @@ struct xe_vma {
>  	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
>  	 */
>  	u16 pat_index;
> +
> +	/**
> +	 * @ufence: The user fence that was provided with MAP.
> +	 * Needs to be signalled before UNMAP can be processed.
> +	 */
> +	struct xe_user_fence *ufence;
>  };
>  
>  /**
> -- 
> 2.34.1
> 
