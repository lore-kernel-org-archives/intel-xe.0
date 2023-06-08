Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61A2C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 08:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990A910E213;
	Thu,  8 Jun 2023 08:26:38 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FCC10E213
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686212797; x=1717748797;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OuNhOMf4z7+HZ4ds46z7PVGtzPondcs+7efuIDy5H94=;
 b=GzSEVFqtUfmPpTVVZOVTe7K73ZtkuMyuyNwpFr3PbxL/u671suJU/KNs
 McJjNe9wHOJJgIplFipzNgLXgBjkVil4vn/BYqo2Ie1vq+FxPib2Bkqqm
 CexDVzHfb8znuTe3VA1d/b8/5mymca9+kTVJAfH71vyt4KHgPXdeaXTp2
 BJEtUPA4Pn0UNnkWQt+owrXMFh6iz0rPcOjDePm4juGXgKpXGMaMfot88
 ZSwIpfWi7NRFLXW5plNAD+YXcq/3N+HWt5CGqNMwfFtV5qw0ZxJMYTm50
 07f3pw0oVzPUqu2x9SeO27H6TuJTqHXrnYpEQ0CXZovs2X8qKpAtuYWPG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360582416"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="360582416"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709898133"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="709898133"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 01:26:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 01:26:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 01:26:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 01:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7RnjVzh8kR90siF/3hDblYwZuxxIdBiyu35ij9mEZ70T/k5nGxxMyKgZCyo7Pcyr9KRPiQWwXjC2JY6BGqbe/8eVAAZzhhxTosdzH/B6BYjgtHc+A+G+LZ4XAzgTooyJ5W6smztrIWkCWUwLxq3T9DMAzPT1dOTRMlAHJHlPw4EjzdOhLO0k98wPz/oxXAB734PwbivYcRIys3UlVvKnXeXw5NYPuaiNeUSxJWPMCxSbdZf3mD5l4Rc9BJ/UPMzw7KiMO1v/h0izWwRt+yRHtZHXBvpy4uNsLXMv6+KNiOXykGPHuSWOpQGwy0hOyKXWhtQqJPRmf42Po3JzK2ngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqcJshr1/WmOHhZQFjCH15dswkUOHcTUv41PjQUvCoY=;
 b=N2//oU6in4gqtuNRDxowCuc0rHu4vDfM/HqoM8Vbx0cpCdc6Exi0V23hZRzAVs37/u30sEyO4s/MZh5zgS51Z5pYvjQFNP6qBvPMe6/HGk3l1clMRrKi5tEO0y8rWzdzzuIZ6lP+AosPigaCdHEUIahLIQM6OZDKERLuLGlQIkuJhkTdYDAKIrsKX+euu2aSzORKubSis2QarpnBwHBd6r0WygrNjXvXgbMazWV7fFzTTXJyvdXn5RuFbBMKYVxT2FPQtFH32bLv+tz//ibzOvnWDPsbtAWVqyborfqrgBgY/ZsuUEDwXgiMoCcA2D86ogV4lb9a8quJ/RQdzjsOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 08:26:34 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 08:26:32 +0000
Date: Thu, 8 Jun 2023 10:26:23 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZIGQr6uEqyP8G9r9@fdugast-desk.home>
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230608050333.37581-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 8063bd00-6331-4cbb-abbe-08db67fa1049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zy7sGXYxt+TOHoDsQxMecTNQcfMJUbPtcyd517Nno4Ll6WRrEnjGWLwJFsur5YcIuix+t7MtuX2ky0VL2LbB5rX2/wHBWvah/pOgBd5SZ+AGtF71EF8QiLGV0BtnJFZqP+cQkDKVuJxWOo/GQuntJQ0KIs2UOYNKp3oSxQXcg1HgB18QmDXpC/H2K5rnfrXYm8X2/pv4r3gOlyd6GoiPgT8QSsDrVhOC4A8ep0CfLyQHUyqYcLj7JeMQ2AuSMoNe4XXJP4RDOHWdgX7SAFYSENxsUA5M89hiCWvLM/7XIChlpCNyQlZkKofopHVq0YlRBY94hTzznBogeLdzuHxD7ENn5WLY7fRytaswCuziXLeuxlrnVGEL0R1vcTJW3XSaEFOAlZbwEXKHlQo7JmGqX7hrRaMIpmc8hlIvpMiVUblYESL85jF+vpNNIMqqA+EIc48aDIfZP4pB2AjrtzIfsvXlDrcTL8wsuO+fRHDRekp1VDgwkQDiwBSXGGn1Da67ikLY7epLWaGKGiiHtDMKNOazMLgSz/J9EzL1i6OppCAmtp4azHGbbsWpYdfTm3IB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(26005)(9686003)(6506007)(6512007)(44832011)(316002)(83380400001)(6636002)(66556008)(4326008)(66476007)(66946007)(36916002)(6486002)(6666004)(186003)(478600001)(36756003)(2906002)(5660300002)(8676002)(6862004)(8936002)(82960400001)(86362001)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YIVROcCUAyUSU3k3CRyg9QtqWj9zRqBXUk1/nuH1dC8aZsGT/XJGn6ZA85jq?=
 =?us-ascii?Q?5WCPOW3K6Nq5dmFSFm2aD2//X4F78rkINE+3ugF2dui6mTl49/5w8ZrW1/aP?=
 =?us-ascii?Q?7IilMv3zeiwbSH4p6pEBM4Fol/zvK/qo8gI5oF5icsznF3JZtsiUC+4G7+gK?=
 =?us-ascii?Q?tzNDTNjevT/on/8GqzXhb/tbPzQFpl7lKRjc5h9D/GlMHRUj5j0RXgDHevL9?=
 =?us-ascii?Q?3uHDIQSIY+23OSvuh0IfJ+bKtSIKZGzbYof5ox3Q/xZ0Uw+6OxDwnsPzB/8F?=
 =?us-ascii?Q?suqguBQjqI8m+FO8K6LXpPP/OLoEdHTWK3UWv7ofk7lnNAttWwvYJHYRKusH?=
 =?us-ascii?Q?2BGY7+T/wmDFwxItA6sWyyOdPo4SZOZQUGA55l0x2L2RSXKpzOYacrTcvvWH?=
 =?us-ascii?Q?Lhsu7pnw9kEWL5b2f4CXGYtln/eb0JGVBrJZYOnPMrKEuFfXRULQT195lwLG?=
 =?us-ascii?Q?prfURXrmTbAIf/k1Z1FrJg+NAhCm6qQzfJ6lWHv2j6YfzocMxXob+how9Oln?=
 =?us-ascii?Q?QG0fPBPq/ljXTrAetfn0ia+Bj0mhk60+tX4X1OxHsZa2NhWQixErdegSVSF+?=
 =?us-ascii?Q?aSE8bOgt6ZJ95Wsuh8MdXlPbW8Ec8mI3oIfesrW8d6DdBRWHjcDJZQXu0+zq?=
 =?us-ascii?Q?vYHLRB6KmXCp11BijNJ6xOxmerNoSmOBN+/265LSkfHe5zehOtg96iil9TP/?=
 =?us-ascii?Q?6f4+dPnBuBRKOrZRDQQ/qN6pMZ+s9T84HxnYXJvkENkzmQodJTQE6CDWosMb?=
 =?us-ascii?Q?J4Rqq02tQBn9vlniWm4cBEgG1gqSD0TuGKCRDNem/pnhcprj5ZpgDaZy5lms?=
 =?us-ascii?Q?tgT73SpqOOhfLOlo56Xo4ayCmidsb2LjorlMF0e9IFvmZoTSeGwNjn4DStND?=
 =?us-ascii?Q?E8fcODyrjzDZWok46bRQQWVGwV+H/v1ffqwNX4DiyZGQgxnEnQkA/fgKDnbV?=
 =?us-ascii?Q?46oZWHFFfIwT4jnlNoa4oNi+q5NHiyemPmDdKDnzwa++rUj0SXp+FzyevkKH?=
 =?us-ascii?Q?Irak8oIIob5Iwv9jBsdB+l3n2IjFqpVmLbcBxqerk0w9NHhJZKn0j6kKFL46?=
 =?us-ascii?Q?MvI5ClrqNjHmmQ27feCKZ+DTEa5eVNoefxLkx+Owd6CojtKAP2G+SkSZvSNl?=
 =?us-ascii?Q?PiXi/VywQ8FWytT9TBfueruFe222GOdBmaA58V5zuJxOYT5ij/JYoERqG6gX?=
 =?us-ascii?Q?kyUYij1d2JKpmRja+hXjtJuQD+SvNDW+XJUCJD/INFG6gOw22z3QERO70xgv?=
 =?us-ascii?Q?7zgd8hUG/tJ/PTXbxH+0h6POz3d66jGsCel+4J33oRP/9+juQxhy9iHxjndS?=
 =?us-ascii?Q?qHOT/2Re8qdrHUwAsM7emMYzGzb7cX/11u2+BbValHRC8+G580Uet31ojEPP?=
 =?us-ascii?Q?eEkJGxSCmgrVdzPhX4SbhvAkJp2WjDOSc+MK7UB10l2bzdC8om6O+qH/oVi6?=
 =?us-ascii?Q?8lfwpjUhMQ6hqojvkwoUYasBT25+lviugxZFMJTVUl8UTdzcGCDjWML5zk0h?=
 =?us-ascii?Q?YhIgJlLXmskE6TXAAK6nEjU9xXHHfBVfFeiyAQt1j6bsD/gSXv88FdjKdzKl?=
 =?us-ascii?Q?Z37gJkaMVlf2SP1IVayYFtkQ8nC4MqCl+sUHsR/kns3i+plEZiUas2I6Keby?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8063bd00-6331-4cbb-abbe-08db67fa1049
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 08:26:31.8060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STp12KGVH1UN82rrHyVmNRVwgz/9Wxa7H383FmKR5FSfvG6LXj/9kLV2evxLQZx9MZXgfRmZ/T5olP5AZ4TosjOifhOMcJX5rHYIwzQiOwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe:
 s/XE_PTE_READ_ONLY/XE_PTE_FLAG_READ_ONLY
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

On Wed, Jun 07, 2023 at 10:03:31PM -0700, Matthew Brost wrote:
> This define is for internal PTE flags rather than fields in the hardware
> PTEs, rename as such. This will help in an upcoming patch to avoid
> further confusion.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.h |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c | 12 +++++++-----
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 29eb7474f018..552fe073e9c5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -65,7 +65,7 @@
>  #define XE_PAGE_PRESENT			BIT_ULL(0)
>  #define XE_PAGE_RW			BIT_ULL(1)
>  
> -#define XE_PTE_READ_ONLY		BIT(0)
> +#define XE_PTE_FLAG_READ_ONLY		BIT(0)
>  
>  #define XE_PL_SYSTEM		TTM_PL_SYSTEM
>  #define XE_PL_TT		TTM_PL_TT
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index bef265715000..39ec94549439 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -102,7 +102,7 @@ static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
>  {
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  
> -	if (unlikely(flags & XE_PTE_READ_ONLY))
> +	if (unlikely(flags & XE_PTE_FLAG_READ_ONLY))
>  		pte &= ~XE_PAGE_RW;
>  
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1c380ad7f6b..94fc9c330235 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -61,7 +61,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	bool in_kthread = !current->mm;
>  	unsigned long notifier_seq;
>  	int pinned, ret, i;
> -	bool read_only = vma->pte_flags & XE_PTE_READ_ONLY;
> +	bool read_only = vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
>  
>  	lockdep_assert_held(&vm->lock);
>  	XE_BUG_ON(!xe_vma_is_userptr(vma));
> @@ -869,7 +869,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	vma->start = start;
>  	vma->end = end;
>  	if (read_only)
> -		vma->pte_flags = XE_PTE_READ_ONLY;
> +		vma->pte_flags = XE_PTE_FLAG_READ_ONLY;
>  
>  	if (tile_mask) {
>  		vma->tile_mask = tile_mask;
> @@ -923,7 +923,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = vma->vm;
>  	struct xe_device *xe = vm->xe;
> -	bool read_only = vma->pte_flags & XE_PTE_READ_ONLY;
> +	bool read_only = vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		if (vma->userptr.sg) {
> @@ -2641,7 +2641,8 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
>  					  first->userptr.ptr,
>  					  first->start,
>  					  lookup->start - 1,
> -					  (first->pte_flags & XE_PTE_READ_ONLY),
> +					  (first->pte_flags &
> +					   XE_PTE_FLAG_READ_ONLY),
>  					  first->tile_mask);
>  		if (first->bo)
>  			xe_bo_unlock(first->bo, &ww);
> @@ -2672,7 +2673,8 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
>  					 last->userptr.ptr + chunk,
>  					 last->start + chunk,
>  					 last->end,
> -					 (last->pte_flags & XE_PTE_READ_ONLY),
> +					 (last->pte_flags &
> +					  XE_PTE_FLAG_READ_ONLY),
>  					 last->tile_mask);
>  		if (last->bo)
>  			xe_bo_unlock(last->bo, &ww);
> -- 
> 2.34.1
> 
