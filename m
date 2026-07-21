Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC1AC4452F
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 03:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0867B10E28A;
	Tue, 21 Jul 2026 03:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+r4lv0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E934810E28A
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 03:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784604021; x=1816140021;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yO9rZP1ZvHwLgCKigYBtsCMau478aPp+s5SsNnl8hwk=;
 b=b+r4lv0K4uqBsBxlxGOoGysvCIN86yB8po4sglpGHWhHegafMmRDeKq2
 w6fvh4dnSmPEjpZouVxoatBneRAGIClZI414/oVfi94QqgJpXpaaWwL6P
 o/KXH2RbchPUmqQEZ330lGYHSXwipGeXgQZq5YAbRC4jlpLUzdXBGkbb3
 1EJajTPu0ZIAentuU0t39gbNt+ZzH3yw/60q9CoPbAi7HZLgbrjrh5tUQ
 cIO1GmI8T6HOHDtBL0fHUDN5d4tSOkHJg+xuS258RIoCB75yPmVA5FtVH
 f3Ae6hSr+vA1aN1kzfk7ws17ZnO0eJ76jFfW28Gsoq5k1gE2Jlpwe53E9 Q==;
X-CSE-ConnectionGUID: 7v0cBaqiRx6sctGY7n9AmQ==
X-CSE-MsgGUID: veGsyHWtQjWiKuveQs4XAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96327456"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="96327456"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 20:20:20 -0700
X-CSE-ConnectionGUID: u6+pxOqIS5qe0tqqBSvGVw==
X-CSE-MsgGUID: gNmW/CxxR4u75ZrB2mWJ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="257068543"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 20:20:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 20:20:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 20:20:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 20:20:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qer5s8n+sJ1fcAH2iQreN9T3ETGXbNMsMK5IVvrFlNrg56FwLYQCJ1hRB8P+Z7aulQnQ0hxISHs1KVwxIFfsWp5uSjsytaG0FIKQsu3SguHmutbddGl6EmTPN2vzP3BXJ3o9SSK8gE1TJhMl2tgWq8/mAY/Rz+ZIxTH3FJHkptqLVCkwlmubddyjOChh4GH+qW7FyToHO4PzKosz/08Iwa1xmtn07r4vGl8RTaaBLNoMA8aa17V388iRE8sVwLvc6pFakMS7TdQvs8TD+Vct9uiJtiXWv8nuY5QWwmRG+PI0+vo6/iGmQA8w3Y6iiuxbslA1ia+joorPM7ZpGGJj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bVuID+q1a9y7wkb8TzJaSBrBRNy5+RAhz0A5HjgXcs=;
 b=gXjcqq81wJM5004q+dMp3pOMyQkxrenBhN+TimJYX2Sn2vKRvTAscMTVFOFdzRdCPZ6NOGPX2uNTLQ14ycPCUCZMKua+RLHurF7GdmU6YUy4BRYhoL2sxJqKVwb9iGXEpOyZeR+YqOaFPnKcRMA8MIg/CXxg1Gc7VJl2AtuY7xeqLOq+sPaa4ycbpG2vNZimoWZ59hhrXp7IcSpoyWuMOFEr6sfdxUV6LG8ANL2JrxIJ1MFIDCqPQibawp2znIoohomKU9ZFPve5fzNWNN8KMHSbffjRziTL6Wu+8EtqANpDAyD5A4XFUA5TA4qiq+pZuSzWAJ0zPg8P+mfg/HZF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 03:20:17 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:20:17 +0000
Date: Mon, 20 Jul 2026 20:20:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Ilia Levi <ilia.levi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <koby.elbaz@intel.com>, <shuicheng.lin@intel.com>,
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/mmio_gem: fix fault handling for split VMA
Message-ID: <al7lbcjU8JsqasVE@gsse-cloud1.jf.intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
 <20260526125106.2806522-9-ilia.levi@intel.com>
 <7baa79b5-a2e4-4064-8a19-c0f263a883e2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7baa79b5-a2e4-4064-8a19-c0f263a883e2@intel.com>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV3PR11MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e04777a-7a5c-4c4a-8d89-08dee6d6fcb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: fSegyi76pjREnURH6Q45opBS/9QaOFYkjd7T1qhz1KETyrpUEqEe7+rOrqUfUyzlfYiNd7ot1cjhLI3vY8kgawquKMzjLY+RRIpycztdHGjEQ7WsnU2jn9ylw17RnfHFg5nLgF1IVEDbdNR31MeRFN/ig73egEmy67XwG47zPKT3/DqL+KaeHw19pTinjxAKQcyOdMFL7mirLVIlBv/NJdsEbOW/wkuVl/1BeACXOJpfzm55kXFHD2+q3kgnqpRkmuuEF+FXPUf/jDUaTvK990nC9jCQyCCjHI027En9zi52p2VOjAZuAhLn4UTWoBqukt/2Jm1BSQHoehINNf4fKl9wL4uvs54gLv+E5XnwIA8ZajkLG0Jj7tLmAmsNHifxHs9S5EmHTix/DC15R7Md0XHwh7LBvzxHOCTKRE9Ca9PzOkdGq/M4yWp6PyHXvctKOjXTEPKLXrVuym5KDx+EuMcOibzBGwLKIr9g/47W2dDO4H5hjXCFYltmk8wJQT4E0hRJcHE3kLav32z+90Flm7IENvnd60Yf46ah/PmSKRQdhpfcc/UGGQCulptZZhUPBkV5xcN+xQDoV+gJR2uSDVGBl1EDwRABgfdqWrNi34ms+Qb/1AkhitjQvv89YoqqwLbVRW63JjF7fzMS4iVGMZ/1gNNd6RjnAEbhwxeYN5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bP4L1W/55j/Rg7+zibCraZdCLWKODMP+qaLUWlDLCI7GlEaNvYDAHPRJEiU5?=
 =?us-ascii?Q?aGTMnx+q7yXWOh2eE+c89Fk4lhXdLBw/qG+tfzoOhFylCHGhTFJ91OV0QScO?=
 =?us-ascii?Q?XuxRLX61M55K8pHB5sx6pNZzlGNMwM7pGFcqkWJT2M10JyRk7IXFWrNtGTkp?=
 =?us-ascii?Q?Yh95ml+q2uvFQhWJO8T9XAfg4r0LgDxm8/KrmMI2roLSr/6y9ZXoYAm23hqR?=
 =?us-ascii?Q?4ewRVvR8pWs5JMpquLFLRUjRZjhQ/ektLgMpg3X/BnI0awzsyh1r9IFpe6bM?=
 =?us-ascii?Q?qM6o9aV38wTACEZDweVeTNUU/TtSRs9NFZIfGj55fwyFWGaNGrmqh82j9UR7?=
 =?us-ascii?Q?03ZuCoxIY/kIq2opEXQU2N7eHN3RVCE/VfT5jV4yNH4nWE47fqDC1DK5ytZV?=
 =?us-ascii?Q?pCFi6cLeT4YYJZIU9umEzeFkNjd4OQsmWvn7OCl6qkwMdie1n4WwfjuT2GLU?=
 =?us-ascii?Q?mwVWOQCDcNFcjGu8AW05bo/2yVq3ZCIvxU7YQU+6vTSwsqUcmLyLhTrOgKYe?=
 =?us-ascii?Q?IaDfv+s9ZzygNfAPsZFqQM75XrNsseV6XK6P7nA1g8eXANW++XqLkvUUy0TP?=
 =?us-ascii?Q?wjl20j2ESMNf3p90n5dZxLslWFAHtC/0rtk04diDuev6dfcPWBqQ7IJBCGdN?=
 =?us-ascii?Q?2+Ix8Q1VNLyCfDjxWTLmPLYX3PtO1ly+dVEJv0CYu4lRp2h22vFtMBbj6jvw?=
 =?us-ascii?Q?bEbsAXzmHIBFCpkU62TSiOA3S4WkJL6qPg55jU0f0GT8wSFny80/5cVKr8vb?=
 =?us-ascii?Q?L/mRX6Uk2yCfwpwNcVdy76P9G+6LDB74EQcNFNwV94U8eqqb54EkBQuVV8YQ?=
 =?us-ascii?Q?XXs5mAyvMpmwrLTWYiUobXojIsUmU/2LfCttrqrFIgN8O4ojKTll1+W97X7k?=
 =?us-ascii?Q?P30BvhSplYoPFQp85w1E2lvp2PlSLbhuWZchiMAcqMC+ZusPwg5T+I/EkBc8?=
 =?us-ascii?Q?l8RMrBni1E5Nb87sao5sUzOscbf7AYv850IxZWUFfFcCxICnoVpnExJn2LUT?=
 =?us-ascii?Q?1ejzw67RYJ/4psi8ytBu9GrxUJdOJCdJHJLNB25ttEAbVINaMWP3xTnxQM5W?=
 =?us-ascii?Q?fwuQXTvWXVUfYMpV0qAUom1SR3u53jQroeeaI0XERAhya3AFQeOjqOhD2m5C?=
 =?us-ascii?Q?GYp5lMpOs7xX3oWb0ltWSu831HByeG1Htg5hhz7Na8mMLSkMHxkaDU5Ggd2+?=
 =?us-ascii?Q?Da4JjABYRIOJ/mP+66YjU7adfsCodMkg2VJxRnDXPBH9+WwQrzpsoxCZPHOG?=
 =?us-ascii?Q?+X02379J3od7VrUaUg2wXxdmlOK3Ai9QJBA3hRNXgHizpjnjfwoRmks3F1oF?=
 =?us-ascii?Q?HB3NidZWc7Q9ZT+DTst1VPXi1c2DNJ5A3e2DkZnnb6GW9o5SgC7YunWUwe2u?=
 =?us-ascii?Q?O2nD1V0nt4UKyCzvBIdE/8MI++8K2WZHBkZCHHmCGzuGiIXv6ReKntEluV1u?=
 =?us-ascii?Q?xvUhfEV96HvcQpIfb1iNRC80Vfpf3Utl1ZT/G65vgUI2x2YB1JUMHGnrcT3r?=
 =?us-ascii?Q?Kb2q0BJ30VOV9pxfybeH6JwI43nzLFNQoMCFPfsA5D9vezDZ+xr4WpLHs5+R?=
 =?us-ascii?Q?rs0y/0Dg1R0IHlg6X5OQ1jWiaflBuym15i+CTpxXZk1nLsJ7iS/Ln6Pr2lAf?=
 =?us-ascii?Q?Dpdbght3IIMnbrhYhcqefxXIdxF+ORFiQAY3O4n1DeShhpDNnJZPf9A9Oewp?=
 =?us-ascii?Q?8g+6P/Ypyl+xf0F2I1q3rbe/farZpmWpDjKdpzBYrclZG8DfnTaxeqePcIRE?=
 =?us-ascii?Q?VhVd4avtJeUtCDTjzSr+nvdQi7GnNqI=3D?=
X-Exchange-RoutingPolicyChecked: dI1YJt5VVhNH1L0f3hqIQY68RiBW2yYMe+/F43NQgdWHm2JLWsopGWPz1DzND37uXgSv+ZlZ3jh0aDTTRznrt1ZaeCIpKxCEox8WwgdSeZgfgH6RsYGOhGfDB9fI73ubQA2i8qkh5Lcza092tE1ApEDh7UNfB2T4Ys9Vgvpiltuws8EPUOrRWmLOM6a602UOkpa3cbMSBTUA6dnnL6sUtnJR8nRH0P9j5Km4Pm1hDOD8wxO0izvkRpADZYeg7q8ZN5ZMUcmw/jBNSJ1Ezm49xhioFCWHV9PTjJFx2V5Z8lUaK6xVk0uQolomOICBnwfmsI317npZZSXonqwuIrtmhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e04777a-7a5c-4c4a-8d89-08dee6d6fcb9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:20:17.2663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quRh4MRHaYaiFRuDiJB1/HEA+N9yTgXpXhhtDPK+R1iRprwwwpYckMCDo1SizFJqp9ZC+ZZiaSIQgE8HABZUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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

On Wed, Jul 15, 2026 at 02:05:35PM +0100, Matthew Auld wrote:
> Hi,
> 
> On 26/05/2026 13:51, Ilia Levi wrote:
> > The fault handler currently assumes it always operates on a VMA spanning
> > the entire GEM object. This does not hold when the VMA has been split,
> > e.g. by a partial munmap or mprotect. In that case the handler may map
> > wrong physical pages or cause SIGBUS.
> > 
> > Change the fault handler to map only the GEM subrange corresponding to
> > the VMA, and do not set vm_pgoff to zero. Many DRM drivers do this
> > because helpers like dma_mmap_pages() interpret vm_pgoff as an
> > intra-buffer page offset; leaving the DRM fake offset there would break
> > these helpers. Those drivers can get away with zeroing it because they
> > map eagerly -- all PTEs are established before mmap returns, so vm_pgoff
> > is never consulted again. This driver does not use such helpers and
> > defers mapping to the fault handler, where vm_pgoff must be preserved:
> > when the kernel splits a VMA it adjusts vm_pgoff, and the fault handler
> > subtracts the GEM object's fake mmap offset to recover the page offset
> > within the object.
> > 
> > Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
> > Assisted-by: GitHub-Copilot:claude-opus-4.6
> > Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> 
> Would it work if we did something like:
> 
> +static int xe_mmio_gem_vm_may_split(struct vm_area_struct *vma, unsigned
> long addr)
> +{
> +       return -EINVAL;
> +}
> +
>  static const struct vm_operations_struct vm_ops = {
>         .open = drm_gem_vm_open,
>         .close = drm_gem_vm_close,
>         .fault = xe_mmio_gem_vm_fault,
> +       .may_split = xe_mmio_gem_vm_may_split,
>  };
> 
> ?
> 
> I don't think partial unmap or similar is really a real use case for this
> type of special mapping. IMO if we can just reject that would be simplest?
> What do you think here?
> 

+1 - I don't think split would really be a use case and most xe_mmio_gem
usages are likely exactly one page, right?

Matt 

> > ---
> >   drivers/gpu/drm/xe/xe_mmio_gem.c | 18 +++++++++++-------
> >   1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> > index c22a38e5616b..15e884ad3f1c 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> > @@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
> >   struct xe_mmio_gem {
> >   	struct drm_gem_object base;
> >   	phys_addr_t phys_addr;
> > +	unsigned long pgoff;
> >   };
> >   static const struct vm_operations_struct vm_ops = {
> > @@ -92,6 +93,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
> >   	if (err)
> >   		goto free_gem;
> > +	obj->pgoff = drm_vma_node_start(&base->vma_node);
> > +
> >   	err = drm_vma_node_allow(&base->vma_node, file);
> >   	if (err)
> >   		goto free_gem;
> > @@ -147,8 +150,6 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
> >   	if ((vma->vm_flags & VM_SHARED) == 0)
> >   		return -EINVAL;
> > -	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
> > -	vma->vm_pgoff = 0;
> >   	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
> >   	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> >   		     VM_DONTCOPY | VM_NORESERVE);
> > @@ -190,7 +191,8 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> >   	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> >   	struct drm_device *dev = base->dev;
> >   	vm_fault_t ret = VM_FAULT_NOPAGE;
> > -	unsigned long i;
> > +	unsigned long addr, pfn;
> > +	unsigned long pgoff;
> >   	int idx;
> >   	if (!drm_dev_enter(dev, &idx)) {
> > @@ -203,13 +205,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> >   		return xe_mmio_gem_vm_fault_dummy_page(vmf);
> >   	}
> > -	for (i = 0; i < base->size; i += PAGE_SIZE) {
> > -		unsigned long addr = vma->vm_start + i;
> > -		unsigned long phys_addr = obj->phys_addr + i;
> > +	pgoff = vma->vm_pgoff - obj->pgoff;
> > +	pfn = PHYS_PFN(obj->phys_addr) + pgoff;
> > -		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
> > +	for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
> > +		ret = vmf_insert_pfn(vma, addr, pfn);
> >   		if (ret & VM_FAULT_ERROR)
> >   			break;
> > +
> > +		pfn++;
> >   	}
> >   	drm_dev_exit(idx);
> 
