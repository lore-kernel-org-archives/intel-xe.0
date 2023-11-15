Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F32DC072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 21:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB3D10E262;
	Wed, 15 Nov 2023 21:51:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8431810E262
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 21:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700085069; x=1731621069;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wTVnfwAKSVfB3hw4EPrYGKTjeBaP2moTCfpFgCGeqE4=;
 b=OO+uhRn1RNJ3M1hCuPkP/MO0ja+Nf5FQpJpYZoWpwK2B3TAXCJYrBtRV
 z5Fqx4O1+XwQT/bu/xJdhRs0dUL/dPjPAwrlfnxq/SHXIZYBGknwMrc7W
 54IiT0ttVf/SH5X3Ifz2LyGw80A7XC7VLjLw/5S4uZQZSizPZ9AazEfz2
 3c3UGOIniqK7G/TC7uXgGuv8pcmOjJStr9z0i3EAdILXIuWT3voK3QNB2
 fGwod1PPXKUsQlScIGV181MaEH/j6Q8WFEUobAwgA8/Hc+wvvKwxw/9w1
 2eJLxf6D5hr+cNFQfWlbKcklFoGvtss51c8zLJgqsSYggwo2Xx42+hdz8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="390755968"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="390755968"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 13:51:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096572812"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="1096572812"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 13:51:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:51:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 13:51:08 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 13:51:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgXcFt2y/yaMpkbI1aZ4D08Me+cfoGkua7E/JWjvVVfpxkCMta4ToOYS3JNNNb/8FkK2jkoIy6AKnvakILrKE5cvP0OYYrxqi7CdTE+A5jWdGewB3D7G+W5w7PG6ySkHpaRmO1jFweV4xuqUmUJAN1rVFEVxFi9gMo7nw0vuaYLslDFIwtQkNXhikpkKkckMgyf0dww5m7/vn7pIeP6mbdKtWjB1XVR4+li+9emJFckxj+7E5D4lpQFXVGpVQZrKvGNwUk1UaRDNHoiUivHtnA9PHfWkSjAZLPrtB+foUcziGbZhqw4OQZbuUJZi+22HRONp75sFSNYdbz8udqOElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmby1xn3J0fluLlaxPHdrLXGbR7jCdILnk2+lIdNEdw=;
 b=I3szr5yuL8S2wRwQz8fW1uMYSuGLvsYuQTPjqejLlwPsC40vYFCGF5OC8qH1K5qeEU7v9f9VRARRBKGZLDxcfMR75j9X6IN8neJ/1eYXZSPYMn0G1KWy9+5vil5YJTSb1kFxH263zHvtGAUQPqKwkwpcfvbUfBefxaDIYdJa/5JeMEm/MlA42f6rL7mLeEvaXr3layVCXmIqs/T9TnPVBeb7rfQttAP3SUmMrISrkevrbnKBCMOAlmDC/mahNXYkcxoiFQyAcMCLIfLTmLNfePKzpWFcR4vj38X8EgoZR24va23Vi3EPil0mwxg5C5sL/mda4tZAskmYRXhwc89+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 21:51:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 21:51:02 +0000
Date: Wed, 15 Nov 2023 13:51:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115215100.GN1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-11-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-11-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:332::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 3597e6c2-3b9c-4080-8f90-08dbe624f615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 37KinbgSC9xKOCSuKLfbzDNoEmiPlPosdOZrPiuMorHIs3PMiczotnxIhrUiu2Y3C5KubiZBYMfG/+4hxvcCr/i5FKrUf/u+7bARxKZToX4BP+hXZHZyL9K8iKxIC1gIQ3/YLeMPPhoeFuTX3VGho6LIyRo81mN6zg2IVGQkyBv4nUCqk9ow2E75I/7B4QaWA+YAxrwNsbYW2h1P9dALZVIdZtTro+k6hWsdMN8pTIkBwNhzOPLJ6WFtQHGc8kVS+qmha4mUZI26CVZeHx53J1uJZFCiZZ+0R0mrjE8uD/ukFqywFWUfe50wJ724mxe+JpQQ2tRS2jvcuRJo/3Jk0HaOm0lA7jzarJYThMHGrZLNQIdqGDBxs4WR0WKDo0he/qroTkx5/fvuqn8Zd+2iXUJ0QDK3zw25slowTPlgIZ+aJRtcGjmPNUCmfa4Hy7NyAm0OTVg9bFBLf1IwgJsZtXVgD6ben5mYGbie7KL1UoysgP28V7SDEPpxTZXZGCb8GCk5hP1XTHnI94r5qbKeGk1qLkVpmR0h/6WQBOLbvNBk1abj6BGwzUgU6TKgywJn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(1076003)(5660300002)(86362001)(41300700001)(26005)(33656002)(82960400001)(54906003)(66556008)(6636002)(66476007)(316002)(6512007)(83380400001)(66946007)(38100700002)(478600001)(6486002)(6506007)(8676002)(6862004)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk5sNTlvMjRiRnRkemR6d1VNR1doa0NCejRiVzgraGM0ell0U095Y1NrajEx?=
 =?utf-8?B?eHoyYlRJcGRNOStTVi9UOVM0ZWRYT3JsVjEwRytRamplRzBJSzhXZlByRDJO?=
 =?utf-8?B?NThRSDJQMzlpa2tDMjEyb2JWcDBPYzFVTitNd1IxSjZQMWVVRTlrKzlxR0tD?=
 =?utf-8?B?SHl3LzVXRkxYV3I4bEtYRlRzOTBpeUVsajZhZFZ6ckRCY0wzYm1DVjBCOFNQ?=
 =?utf-8?B?L1ZpUzZyQWFCcm5LcG9NR2NjdjFQL3o1MllFODQzNmNsM3p4TDdOcVRxcWR4?=
 =?utf-8?B?b0llbXcwVm9JTGFBV1ExZE9jNGQ0bXJMUERoa0VqblRMb0VoVjRka2hXLzhL?=
 =?utf-8?B?djdRSm9TM2VWb3ZGRDF0a3c3WDNPU0FMc0RCRUtad3pTa1gzRHFXOEZ4T1dK?=
 =?utf-8?B?TW9ZTXNCQlJxMkRSVCsyQTVUeHp0QzZqbFM4RHFDOFR0LzU2UVBBb3BXWGNz?=
 =?utf-8?B?dUcvMjd0R1FubWlnS0Vjdkk0Z0lXWHJZMzMwTVZLMENOei9xK2dEQ29la3dp?=
 =?utf-8?B?L2xUeFRyVmwwem9tZHoxOG0vY1FSRnJvK0tlV1A3NEdPNEZuRmVtNGZnZ3o2?=
 =?utf-8?B?aUV3THJaMTZJQllxLy9Eckk1c3owLys1U2R5UkZkWDA4V0J2U0NkR0lIQ1NO?=
 =?utf-8?B?a0xnN0hpYXNwOUZjbVZKYU5STlppMjUyMEVJOGF6VzB5UlA2YnMyK1pyTmxI?=
 =?utf-8?B?WnRxcHQwa3ovNFdtUVpkL05NZEhJalhxeEplNXlPa3VxVWJUVEtjOU4vakds?=
 =?utf-8?B?Wk1XditEd05wbkc1YjdkdHJlelV0cTJFd045eDNabnZjM09ZL0RMUXBUOVJB?=
 =?utf-8?B?Nmk4SWVYRWV6ZVRYVGd2eGV4S2hnVUJaSEQ5NzF2KzdpeVlRTWlGSXB2UjlO?=
 =?utf-8?B?bmlhd0J0dnRsZ0xmWmptcnFucUsyRWVvc3hqTzhPY2p5MXMvdGhZdlFVNENz?=
 =?utf-8?B?dGZKak1KYnJkdU1IZHQ0d2hWZW1pZXB4dFpCSUVpZG8yRm01ejY2VFVnYlJX?=
 =?utf-8?B?dFhHZEZ1L0Y1b3gwZEhVNzcwMGFzSXJhRUgvWkhkQkU2WmErR0tZNjU1Q3li?=
 =?utf-8?B?ZUxDNFZEN0ttOTRiTEI5VXpBdHlONmRLd1lyRnM2dDVybFBtUWJnTDgrNGty?=
 =?utf-8?B?bXE4N3AxaUVCajNXMEU0SkJ4ZnptbnpSMTdyTTRlOU9vRUx4RkxVUDNVanNw?=
 =?utf-8?B?M1NxWmVjNlREWHJ6LzVJa2dZVlZvOFc2U3NEVStQOERkLzVRUWZ3MFlsVFd4?=
 =?utf-8?B?ekUrdGRSVE5ZeDlXUW5sM1czd0hHR2hYMGE3WXRhU2VYV294emE5TUxKRlZC?=
 =?utf-8?B?NG1XQnVieGZWKzBPS0c1N1Q5NHhxR1BKNFZtTUl1dzJZVlY1UnJSc0paaElG?=
 =?utf-8?B?MURQbStaUkNtbVU0dmdRN3c4T01sVjkxQlpXMTVIUXhBVmVOd0RIZWdDd2FS?=
 =?utf-8?B?YWE1emxDV1d2S3hkYzlaN1FqYXc5R3IvSkE5MTZGSHovY3l5SVFTQTBVZDQy?=
 =?utf-8?B?SHRDc2hzSGZLdjJOclRFOGtRUG0vVGlzZDBhUzlqMy9xYU1uaFVTVy9JZlor?=
 =?utf-8?B?MC95eHBKL1hON0RLdUhkTlBNdnJ6WWQ5b1BWZEEwWkpMd3dmL0M2UEwzbUtC?=
 =?utf-8?B?SWFhTXdJOUxickc2eU56S3lOaDNFVDlNRjE4UGRSa3J5VEZlMUg0ckkyU2lH?=
 =?utf-8?B?Ni82ZnJwNXowdTk3aWtzb043K2VUQmg5ejVhbGQ0OWUzY3NwRVJ1Z1lGVXp4?=
 =?utf-8?B?cncwTnNmZ1oraHh5QlZ0QXJjVzlpVDNEUUtCN1RkV3VXcEtaaHlBMTlHRmQr?=
 =?utf-8?B?K1NTTXNJeUMvdWFtT0JiRmZnc29WWkR1MEVjeW5GcjcxcHZRYkplR1F6UG1S?=
 =?utf-8?B?TGlseDVJNVB0VXlGY3NDa2ZHK3RhSCtxU0ZpMGxwVFdsZXBrSXVhRi8rTjky?=
 =?utf-8?B?QmVRdzVhTThLL1F1akg0bVhFU0E3WGw4SmNOUDRWUUtSYitZMGllZ3RGN0Zz?=
 =?utf-8?B?bDVaVnRnZGlHYUZmWDg0MWljVEh0dnVZZU90UlF4S0VEdXl4UlpPQmxaV3hG?=
 =?utf-8?B?cFVkLzh6T01LMnlEbkZXbkJjeXlIMFBIclB1TEJtM2hhNzhxNTdtR3NtcWNG?=
 =?utf-8?B?UkQrN2ZocFQwdHlFTlpWVmEzb1ZGNlc2N3hZRmdCdUV3R2padDNZM1Nac1F4?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3597e6c2-3b9c-4080-8f90-08dbe624f615
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:51:02.5980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soKW+rj0E5dfauBYs5f7BA45j4pOc+VoE5u4Q4/pDbVdiIwaQt5VOpJZQyr0c/bRPAwST/nGYxR8mVVZg2eDxLhEDMP7Bw63/LGBI4st/M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 10/20] drm/xe: Don't "peek" into GMD_ID
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:21PM +0100, Michał Winiarski wrote:
> Now that MMIO init got moved to device early, we can use regular
> xe_mmio_read helpers to get to GMD_ID register.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_pci.c          | 35 ++++++++--------------------
>  2 files changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cc27fe8fc3633..6b195115564ce 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -38,6 +38,7 @@
>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>  #define   GMD_ID_REVID				REG_GENMASK(5, 0)
> +#define MEDIA_GMD_ID				XE_REG(GMD_ID.addr + MEDIA_GT_GSI_OFFSET)
>  
>  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
>  #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a1026b7ee4727..a6c08577b01d2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -21,6 +21,7 @@
>  #include "xe_drv.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
> @@ -441,29 +442,6 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>  	return NULL;
>  }
>  
> -static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
> -	u32 val;
> -
> -	if (!map) {
> -		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
> -			gmdid_offset);
> -		*ver = 0;
> -		*revid = 0;
> -
> -		return;
> -	}
> -
> -	val = ioread32(map);
> -	pci_iounmap(pdev, map);
> -
> -	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
> -		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> -	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
> -}
> -
>  /*
>   * Pre-GMD_ID platform: device descriptor already points to the appropriate
>   * graphics descriptor. Simply forward the description and calculate the version
> @@ -495,9 +473,14 @@ static void handle_gmdid(struct xe_device *xe,
>  			 u32 *graphics_revid,
>  			 u32 *media_revid)
>  {
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	u32 val;
>  	u32 ver;
>  
> -	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
> +	val = xe_mmio_read32(gt, GMD_ID);
> +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> +	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, val);
> +
>  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>  		if (ver == graphics_ip_map[i].ver) {
>  			xe->info.graphics_verx100 = ver;
> @@ -512,7 +495,9 @@ static void handle_gmdid(struct xe_device *xe,
>  			ver / 100, ver % 100);
>  	}
>  
> -	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
> +	val = xe_mmio_read32(gt, MEDIA_GMD_ID);

It's unfortunate that we have to read the GMD_ID register through the
wrong GT pointer, but I don't see a good way to avoid it.  Maybe rather
than defining MEDIA_GMD_ID with the built-in offset (which people may
try to copy/paste for other register definitions without realizing this
is a one-time special case), we should just do something like

        struct xe_reg media_gmdid_reg = GMD_ID;

        /*
         * Since we haven't initialized the media GT yet, we need to
         * read media's GMD_ID register through the primary GT's
         * mmio; that means we also need to explicitly add in the
         * media GSI offset.
         */
         media_gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
         val = xe_mmio_read32(gt, media_gmdid_reg);


Matt

> +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> +	*media_revid = REG_FIELD_GET(GMD_ID_REVID, val);
>  
>  	/* Media may legitimately be fused off / not present */
>  	if (ver == 0)
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
