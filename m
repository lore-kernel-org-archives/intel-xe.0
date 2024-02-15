Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66826C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 18:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A25D10E073;
	Thu, 15 Feb 2024 18:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QU5W+q/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BA010E073
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 18:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708022111; x=1739558111;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TwgeKnN4EB0R+1wEoedTKVUYF2shdOQXt2RznnVZtZw=;
 b=QU5W+q/ANKUIgzk9zTxGvWlJGOxTBl+1n70NBGzShrv3rtuPCOPUjLvG
 icxmTZy7FMRr7zugqcawegw9FCo6MpdtiupeOkRFi6NyqX/6wBBmxogcu
 MKHd8HzPN6kQ3Osq3ZqGkuQyjy/WSarNvdFftgSJeYg13TahyKPkACgu4
 ebvUAYoGB7zmV23i5FJdty3aNRA9mw7iQCTBs2ybPbbxwynRsyuw8inAC
 BNWC7ibZ/ANqWoKrkYDOnkFDr8Hfrb9KS17AGN3l+GexH6/x7T10IIWDF
 7mAKTfSsFbOG60KGdMVugeYroBJsmVDQyUXHa7aSr1GVZwZ+nyxW7ZpFZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2249252"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2249252"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 10:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8314076"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 10:35:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 10:35:07 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 10:35:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 10:35:07 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 10:35:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPeTHMNJKG7FkPWCnw3e+Dj4Crgaccniq1TJCUmBsWvn7DrxcTWMKKZw8HB6H2ab+CCkllWn7NmNXCV8YbjEeDXBjMgpjZcTfISrrgZis45pOwUjrU/TjRryC7VxY1vKbUhyPdUY0E3kH5f8s4Y1P8BGwn1lQRXCPCU9CdmfzSxH2j/oj3Gi0SLr2O7/8Oc6QP8WXGWHMIDxpSNsPkZEqvwdSrt2Yv1O1nTJNj6fRuXc90l4qwHdNDaRC3z434SE0S6RUV1yPoZtalBRcQ2wrX/255tlG+/l0UcTlfeNK1Ps/+K0V7OiHEpSpVuAAwzyyLwopgv6ZzJ7tINBqaAAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7nkr+vWvFlJIZJbmrfAT50iXr6yCPEHQelBnjHNxi4=;
 b=J3Uf6+wjaAkS2byWq4tqisL0WeS1eJs27oppDuB4UMGOFK8DeG5lSU2dDKR/hKamlZPSQsoPg5g8D/caMyAl2yICKueTo5ZTeTC+B3GOh+5pZbNo78HuIdsUjYG9ShFs1+Xyg8mA0LfmNrEYhNCAngGP2J/MNg4i33I3ibJQLm7t38K71zmjyyqbsCWaB8ZwjHGqyrbK17DbHTdV+aPZCM8ncXS0bDMSXUcDPiCI5Zx4Gp43uQOFkTckF74bxSWZbADGZ2cR+zkI650apKJhujBU8uUpZUyNKJVCqQiBocZFiDB+zKSukvgEUkgKXi1XlF1N5BlORe3nx0LQ8EQh7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 18:35:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 18:35:04 +0000
Date: Thu, 15 Feb 2024 18:34:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Deny unbinds if uapi ufence pending
Message-ID: <Zc5ZOGodThuMkeOO@DUT025-TGLU.fm.intel.com>
References: <20240215181152.450082-1-mika.kuoppala@linux.intel.com>
 <20240215181152.450082-3-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215181152.450082-3-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa158c5-d660-4197-f923-08dc2e54d3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+HylAFZdgyoo0JYlh4j/GFSOGhvFnK9LZNjRZjIKqwoxKeAIXAWxyWyOp016CRYi6iuImc38UZYVmvF8igASnjWFUg1cw9zuOOekQ2rpulDm+puXHKGTym/pbBiKTJexijElinRg+MmYu67HACjPF5Y3AbnDE4BNcdES342bGaiN5TLf0niut5GsaqhHumPfAJYcMPeNAAWRase2QqbgP9k9ggQK7ZuoCY1s2/21FTO2uUNwFgIamBEzo4jROFqVGhMJO3v8AT56a14czlWWmZydDt9xQfF9M3bOvRsvmLd6JikxnYzXipXkuxDnxk+9mwgsaMFkyjhr1/yCXOOGqiX1A1hnzDQidpfeAP7hxL0RRgo0EjLwdcVkxlId98IVT75UNQ1iopczD3QlMbi5VsggVx+Wzmz/hT+vIC7C1ni16rQmF4xbvTNG/KnxA9uv3t+p8yorTSZpuPZ15UnU2DlxLe07j7eqULyI9a1b/yKuMNG6wSwfAr7otZFlzT+28+HToU//yXW1T1S1kGGo4rFX90w2kHeeP5gdYFK5Us=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(44832011)(83380400001)(478600001)(66476007)(41300700001)(6916009)(966005)(66556008)(6506007)(26005)(4326008)(6486002)(8676002)(6512007)(66946007)(5660300002)(8936002)(54906003)(316002)(6666004)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B1e4z6ArZ+bjFGeO2HPe3DgH/uxNSz45DWYcZ50TBFrkG58TGVaIQzYWve?=
 =?iso-8859-1?Q?SExXjfAqRCRSwOoe5BjXj4a6jtP5FqN3mDO4GYhwFvqcg1SvVbkyHzY1b0?=
 =?iso-8859-1?Q?TWG7kM6T/OV40HuzXhwnE4fEgFAiN5Zb8FRRNX/kcYOUkAB5/4M9EjQEPT?=
 =?iso-8859-1?Q?gAUkAN6mJ40XaKCnwLulyJpJEUxbHt4IIDf93FqsJpKTwqbIu9WpP21boC?=
 =?iso-8859-1?Q?IL5eeFnEOPW5ZDMzAD/aWRNXP8Tze/bLGYz5n6ma/mJ1p+RjJ+eIDAtCgt?=
 =?iso-8859-1?Q?UP8L5nN8ADmc5bbnIUz000D8HP+JPX+VMrDMluD9ecdJXooU28gIQJh6lu?=
 =?iso-8859-1?Q?Nn3w0PN3yIi8vMnYiDHXsV/Li+MR3D7KRahRaVoz3JGDlUHQEDCUMnyM5X?=
 =?iso-8859-1?Q?GYq9ScoW2HpSmXkIo0eQVp2SOSyn43JLYz6UJ+C4by5gmbfEdFMNEXnvgh?=
 =?iso-8859-1?Q?RgzQMTMkY4nx7+wKgZPbmk8+S+Q0wCE6e3NgQHkDRpNEnXCeqr99y+TRB3?=
 =?iso-8859-1?Q?AJ/3sQtfuU5pCLltYZIsazzh+51ApTYvRq9U6pXdjn83iCKsHZqC0Frzyu?=
 =?iso-8859-1?Q?lLWzdfoO3NuoHPCVztUaiJYXFUPK4lwmGiOj4YzO10WhH08oK5LxZuyhhd?=
 =?iso-8859-1?Q?TYHBXmN9YmyFQm2WmCBj8YgLbMZ91lnj/BsMQ8yc3FHtggIz3tf7/pAirN?=
 =?iso-8859-1?Q?9dgflj4XXLKMDtOBqHjzASpHRZsxtS6TKrfIGtYO1NzsQE+OBKoSD3Ozii?=
 =?iso-8859-1?Q?AiJVC5SVwy0xLvrYiz9zffcNr8QUs35AActN79FnoyI21X7D2Wsw/uPuf2?=
 =?iso-8859-1?Q?B2arbUn+WuYAWZnCcw/PfwIl/p1FXqC5+BDwRRUzXMwaIaWTSWEb0VNwmz?=
 =?iso-8859-1?Q?WV3S30yGuX5tjOU8Bn4Bvm8drYaO1J607Gav3y7diotYFV5lWTaEjPCsd/?=
 =?iso-8859-1?Q?IuaL+o1XsmQyZs4810Hyl4KU0EuoQVS4FZ20VYH6DIM5VXEuKp+Pi9k7TD?=
 =?iso-8859-1?Q?OWKJsUZB0UF1EZMys1dc2cn9yD0UrBdARSKPPJxl63EhftoQrW10NUeOww?=
 =?iso-8859-1?Q?yUds8mq+YoiU1p8WcR7Qu4Md7CjcvkTkHl/D6CLlBhkWm9HaBT+sTLns9m?=
 =?iso-8859-1?Q?XqNk4yjBq6RowCw5CW9Z2vxg3+sncBagW+YQ6b9kVyMh/bInjFsG6UzgXy?=
 =?iso-8859-1?Q?rkZOkAOKlavryOdATVFXrEd0J40q4c/uiftuwIeE5aWRWmPEnj4w6fsRDM?=
 =?iso-8859-1?Q?uUFIDyWcR+KtIirgtxuXcNyKOfZe3oILVQr+ukbIDlb5AC2bl5OyH+TIEk?=
 =?iso-8859-1?Q?a3cRI/bg+Y6px+VycLLZQ+qVVtrxWPT1LA+kVOUwBz4y0sgr/cgd6vv2zV?=
 =?iso-8859-1?Q?nEaXKTBam+EwrcV/qyhEC0D5n1lc3ZJFXbwJvNnVlQjSt02mtDEPX0g+LO?=
 =?iso-8859-1?Q?jFIjSc/tSawkIo+JMN5CK0gIFTh4WQQrHa0+AlG2HHfV76AYa2Ip2aBPq/?=
 =?iso-8859-1?Q?MkPKvpCtJerTSeHICjLUDjdVkgwURb0vVddPrK0kKFHElLBX72tgh/UcLF?=
 =?iso-8859-1?Q?Z1AGJ5TPmBhMxjLBYLL0UDLYPQM5+zUc/rkRRSecpH6/JuNeJK9N/Q7Dhh?=
 =?iso-8859-1?Q?5DnYiTsaa4Vg/N2Gf+I/jUG9hmmH9bk/VIGrepbWlES3cZUphnAKtoLg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa158c5-d660-4197-f923-08dc2e54d3ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 18:35:04.8712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUhHNAR7ErUjOV63a+nVY5kFC8IvW0jX+hV66Is2vVfIylNEY1eBUj8rMelJdpIv82XFz8PJTWD/36Kq/flLKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

On Thu, Feb 15, 2024 at 08:11:52PM +0200, Mika Kuoppala wrote:
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
> v3: careful on clearing vma ufence (Matt)
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 37 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 836a6e849cda8..f72c8bca35277 100644
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
> @@ -1748,9 +1778,16 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
>  {
>  	struct dma_fence *fence;
>  	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
> +	struct xe_user_fence *ufence;
>  
>  	xe_vm_assert_held(vm);
>  
> +	ufence = find_ufence_get(syncs, num_syncs);
> +	if (vma->ufence && ufence)
> +		xe_sync_ufence_put(vma->ufence);
> +
> +	vma->ufence = ufence ?: vma->ufence;
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
