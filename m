Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F24FCD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F5110EB37;
	Tue, 16 Jun 2026 19:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgNo/8mv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D34810E665
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781638427; x=1813174427;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FORDQWsJ3k6gTr8CXjJfQYckd44VViPYAgON7AlVRtk=;
 b=GgNo/8mvJnObgcUNTTqhxo9DzOlWIfDhwvqc98NUkUHn4myzjFuNAAjW
 ZT3fvJGfMZf/qkEBM2hUlHCjQSDOQtQ9UcNUpWEvsE4tPmpXGSQ3RrMMh
 Dj9roN/JSluvYVww7r3f5h8HVNJrPIgKkRFOVe3CpfHTdFyNRcvouvw0M
 cPt5fPd48eqQ9f0BIyyQ6CvkLry023DjoB3uO4MvygFNTEovTH1lyzO0A
 2EojiPvAn4+q3m45GfHPfXQbsSTvlgAAOUs+KGPHEYF5Tu5vbM5zvCPg1
 12geHGtsN4ORfdW/Fa6EiVHmlTKKrvuA2EE9k9JHXGR+a0zcrRd6Wq7YD Q==;
X-CSE-ConnectionGUID: s6+QD34qQ5iwJBYIHnduwg==
X-CSE-MsgGUID: xDiGgH5iQR+fFKvrFiUBQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82614218"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82614218"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:33:47 -0700
X-CSE-ConnectionGUID: rsCMz5NXT4izuIASP1W4RA==
X-CSE-MsgGUID: MB3Q463ES+SZx42VryvZzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244971498"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:33:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:33:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 12:33:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpdCP0t37YcC3ChpXyn48nMkxWyITax8gWVpOIl7epHvo75hV7VPCUbkBvIAGPhptJ434JVj+6fabMB2O2e/cluU0nn/Jk44AuzKCI5+EsIiY4UH3eJ60KsitCToG0I6O5+WbULcLu1r1jQPEzzsNrMDG3DGKPDHGIlk1uCiLY+rsLBiDlldvB3UW5KkgjiarnTMPPAxt/qaiR1skvhNx7DkS6LHsxDRzkqdfZfTktZbSQmsrAPN0NECMAu4sqb0LrHXGhPaKPHFJqI7v8B6SqMch2ioSIMvyhzJc64FxQMX4Z/BmKgbvbpQ9w9rwo2YuaXzydVGJCukhXC/LOUc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZFwz6j/qP3vGu9qO6TUPBdoQYvP5VvXLx6fsPX1Avw=;
 b=uZgiU85AQzFzfW768kXwupNexiXn1F4EeS6Gt1LIm0F2NJsikz4cb3xsnQ1p89Z4ZTiaGofvBtuiFIYCv+XHNTSTH8YFl/z++IrJVRyLUb/yqzPzHMJ4PLQ+Z/UJvd7YQ6/0aud2MPl2YAjK9JS6daOE5M9x7NqCi1id/FoqMW1ayZkLDWzMpoTh0FXBrsmogYNRE6ZmZ2unsiMNjI3yfo2CsI+sJu7VLVtHNlfB3UmYZ+2kZa2RdDikTc5kfgEvwQuACTlUaktIYgMoCSivlymasvbk7TQuhBGSKf2D/9ixunvBbRZEWNT4ln4sMGdnPbbYVXUpKgK2KMTkDE9WxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by DS3PR11MB9819.namprd11.prod.outlook.com (2603:10b6:8:364::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 19:33:44 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 19:33:44 +0000
Date: Tue, 16 Jun 2026 12:33:31 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe: Add devid and revid to xe_probed_info
Message-ID: <ajGlC2gfy1LPmcu3@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-3-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-3-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::13) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|DS3PR11MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: dec693f2-be6c-4e59-14a6-08decbde2deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +2JNmFHvH9jnfNXtA0uS29z2eesidDjt8Ss5Y5CyyOHHLxiVd3GL3u1NeR4ph4PJBJuHRWKUuXZLBktRchptQi4rEbLHnm4ZBQTqLaHHS+DOnUy/meCBvtmFO6zYHiBcYOulmd6z+/msQM7DQ6cVa/aqyCF3ug5dNlbx/W9q9ButEYAdz4OoScgQXUBv6Uw0AeGHFFw5GbJNerNeVPH4lZxG8LG4hIkQYCktP7VmCpYNeX/4uHLe6SOma1K/o4UfIA5zcbGRBsn5EYKJpXLoWxmUWhKC1qvpDMzMFHd4WkYH+NYIqF23gkYFVqDBrc0xY5RN3p7pAUsH2wuyIYLtep4j6cAYuEE9GMMgLfeCocJVZmMA5qkxIfUtC+4mn2Nncu8qgKyeSYMClZ+KStyqBZQEKnxO8L9M/qOZr8X5BqYOUapTZ1slFrGTcJ3kdWMej0zbSPHIXIPHoRrYriU0zIfi3JYvzav03JWswCGgBbfGkacGf1rOJ6lMw2M4gxuKJmemGyF5E8rGfR6jlbS4sV5h/POTrtm6eIyptyADFA5yLDJ+YxX40vbuRrb1POocdWix4ef3ukpwJnYLGqJXh83U/IA4NfQEsuT4NkwcVWgn0GOEkQSa0V0kwJUM0KqeVlSV4CJP7/t2u34BxlIXXLEzJGTdl/cXceqSoQlXKHMH5GpWW6Vb/jR0ym4XRVRK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Squ8FseNjufKacCRXc2JBBvGcDRCcydpfx4RxhGSixfkKTAmAOL5PjNA1W/Q?=
 =?us-ascii?Q?v0q1HXHkC67YgcNB7EfNA9sqbzj8L6Lthw9M0mdSqq9Zo/hMfCTCmZUi08T4?=
 =?us-ascii?Q?8F8uKsHzmWW3IE0c/dv+86Q0iG/VJ0/8fqwT0s9BoItWmcDwB7JS1BX/+J/K?=
 =?us-ascii?Q?7IVmMDXjZZcjBfm4lSQe2t1OhnLTciPLdleOApAJu+oLOHlDOv0ELFxCd6kw?=
 =?us-ascii?Q?AItQT8BcI2OQRWHUWBdeBZnRSbWEbcCuA5YCtEFvAYi11y2+V8D6w+VlaU1A?=
 =?us-ascii?Q?ynLkwTlb/dtsVQS+DYRivuXDDiu0g2ZLke4le/zhjZDaI8TChx7Ot4ob28M2?=
 =?us-ascii?Q?BH6epe+hRk3zMayLehsBDE3wIj6rvMiKQd0xZX4exsMDy2zSxL6OVFvyjwuj?=
 =?us-ascii?Q?ucw0SwU0l5ZIJ5+Q1tXQcV1FeILIOekKA2JUT72ZgwxfsceE9MIN3nrRMa67?=
 =?us-ascii?Q?yQCzTl3JQhJaSyUG6BnzYnWFl9gPe33on1Y2lg/mkNkVHEyrdPiK9UfAyyia?=
 =?us-ascii?Q?/AFF9XgOH7ADtE1PjCS74smSjhD4lq2v40sXfjRLGVLd1HQtdLJfbZNK1LYm?=
 =?us-ascii?Q?hNEipX+tRNy2YMs5rofw4jjZ5figTL4tSaEJlw5u2AManKyZtcVxliwUPmfc?=
 =?us-ascii?Q?hxqfF+xJ9UYGX9+LcE2sqVFMIg4bbD1JIZgC48hn90hqpL4IcNca7nK3/s3K?=
 =?us-ascii?Q?jWhyogjihrD0Jbwyr6VBULPJmxnGI+aPd/5OINhisOwK6caaeLy6UTFnntQ0?=
 =?us-ascii?Q?hBZLeLgzxnnXlU/kwAjwPjl9ZMnGisigEV9b0ffiMpIPJ5mEPzjh7DqB7IwF?=
 =?us-ascii?Q?z3r4hzygJajwQuME59t80ss7v2k1S2XU8hoPbCaxKtcHw9eZ12tBqlSUaMG3?=
 =?us-ascii?Q?8K7gV2IkKgsGYL+c4sWOUoiy7565Xa/3u0xQcwZx6r74dnv7D+sUKFlUhdet?=
 =?us-ascii?Q?qhl/Jr4J5ClMaJf4YGQC6svBQC9A7VreLFHN8meVRmgQt3ZrQnoWjgZKw0jd?=
 =?us-ascii?Q?18YsfZPET+mLq2L2i1OyGyHpRAH6hDj9QkRYV4mZCLN6T7QddZ4KTh3SDFRI?=
 =?us-ascii?Q?xkdU77U/siLg/g99g9JJEvU/QJ5C3WWHPsUta8jVoKGtDfDd766VdfRUpCiX?=
 =?us-ascii?Q?QqU+U4Nd/bRAWQdMLDkb0vM2WCB+euNYV0MHyUoLOyYtJMXqTcwdVNYsdtJV?=
 =?us-ascii?Q?S+VmoN0NWJ3yqirEh1LveDK6mQkQYJcvdEJq7ujFGhGeYfLwWOjEOCD/mEmH?=
 =?us-ascii?Q?BqyAVLVRYnas5LiCRsiWRyYc21flVZhBMDFPe9c8i1IwbXDShOuPzbZA+Ge7?=
 =?us-ascii?Q?aolWcLwscvpg/bBKliWQc4qNFFJ36jB+b05j7pR2vpkt4a3k+m76+PMCp83a?=
 =?us-ascii?Q?C/qKsmenagor4xKL0loFKR/lIcdyHeg+5FycCNPH76K+RJ2IsfroJRM66vS6?=
 =?us-ascii?Q?ePGn+r4n1lGHKuMsY+m+rvSDHbTenKlFQSM5wU0wsm4ZCut1BRsCJ4XDFl4U?=
 =?us-ascii?Q?SuX4n0W36+S92/03JCegpRIxp/xCQkle/FAruilriLuLJ/G7fp3JDi8E/Wqz?=
 =?us-ascii?Q?OIeIs3bSJcgHoCfgcrSRoOuWn0F8wGKz57H3FSGtl/cDmwXtz1CmaiMK/9np?=
 =?us-ascii?Q?bwjNC0cRyvqEQSQ1UaY49G+rrVhgOAFSL+B/2GGFFssUtoz7HeE0BaT5QAAV?=
 =?us-ascii?Q?fJ8689KXlWi6fPnYSNGtkyyU/koX4SjMEmQ4tSUKeq6we0bFnghkfhLnRsBP?=
 =?us-ascii?Q?Mzs/P6FyrA=3D=3D?=
X-Exchange-RoutingPolicyChecked: NmHpKl0kBBxjBZ5j+zygk14QKrOutaIFsnHipbk51gN/1aBnQJb458mn4/5VWi1m/xjd9vIrqLDeL1od92I6lJQ+Cqrogqhi/BI2nsYKG1AdTVboc8LAqTk7muR3aYA34Jrh/VFAaTQ9DfC4TpPSTFDjpOgudoC+pgJDZPDARgjYw+ImLkTXUOuPkxMcWX4mwVROWKaj2cUufR6HsN6/frlSDIOd4PzfOGxeAoZugC9/EeIaelUuqnJdB6cMWaBbdwYiGKcVt9XWVzSqf8/igMtY39cDrqNRu45VMrfxmqjhSO5a6zZ3nbOOfbDEIGsBls+Gn0e8ShhaB6JOdomWYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dec693f2-be6c-4e59-14a6-08decbde2deb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 19:33:44.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azZixWaVBXAWjGyQh74xhD2KQB7U9UtBSTgVR6ZEL7ooTpJ+1Y2CRFMgENyyZ0NUQbogEJjOsiLtp0nx7Y0a4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9819
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

On Tue, Jun 09, 2026 at 05:17:35PM -0300, Gustavo Sousa wrote:
> The PCI devid and revid fields are info that we probe from the
> hardware (indirectly via the PCI subsystem).  Add them to
> xe_probed_info and set them via xe_probe_info_early(), since the
> respective fields in xe->info are updated in xe_info_init_early().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c |  6 ------
>  drivers/gpu/drm/xe/xe_pci.c       | 23 ++++++++++-------------
>  2 files changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 51d032a9e01a..1baf3cd0d381 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,11 +311,6 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>  
> -static void fake_init_devid(struct xe_device *xe)
> -{
> -	/* Nothing to do, just keep zero. */
> -}
> -
>  static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>  			   u32 *ver, u32 *revid)
>  {
> @@ -382,7 +377,6 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	xe->sriov.__mode = data && data->sriov_mode ?
>  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>  
> -	kunit_activate_static_stub(test, init_devid, fake_init_devid);
>  	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>  				   fake_xe_info_probe_tile_count);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 646e04c6254f..382df59260ae 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -727,18 +727,9 @@ static int handle_gmdid(struct xe_device *xe,
>  	return 0;
>  }
>  
> -static void init_devid(struct xe_device *xe)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -
> -	KUNIT_STATIC_STUB_REDIRECT(init_devid, xe);
> -
> -	xe->info.devid = pdev->device;
> -	xe->info.revid = pdev->revision;
> -}
> -
>  struct xe_probed_info {
> -	/* Nothing for now. */
> +	u16 devid;
> +	u8 revid;
>  };
>  
>  /*
> @@ -747,6 +738,11 @@ struct xe_probed_info {
>  static int xe_probe_info_early(struct xe_device *xe,
>  			       struct xe_probed_info *probed_info)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	probed_info->devid = pdev->device;
> +	probed_info->revid = pdev->revision;
> +
>  	return 0;
>  }
>  
> @@ -761,13 +757,14 @@ static int xe_info_init_early(struct xe_device *xe,
>  {
>  	int err;
>  
> +	xe->info.devid = probed_info->devid;
> +	xe->info.revid = probed_info->revid;
> +
>  	xe->info.platform_name = desc->platform_name;
>  	xe->info.platform = desc->platform;
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>  
> -	init_devid(xe);
> -
>  	xe->info.dma_mask_size = desc->dma_mask_size;
>  	xe->info.va_bits = desc->va_bits;
>  	xe->info.vm_max_level = desc->vm_max_level;
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
