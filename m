Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42437C54E68
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 00:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A734110EFE0;
	Mon, 18 Mar 2024 00:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4IMUW45";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C061B10EFE0
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 00:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710721819; x=1742257819;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zfD6mw+yhjM/6OKiWFFbSeoJLDOCWaiMIzno0spRfoE=;
 b=S4IMUW45zWlcZmwum2YRoCVxSf/BAyuRwlZiTO6lMpDJxR6RwhFGL6VX
 sjlvQ7/RLW6OTl/Zar6WzEkVeumiVXbUju5aPk0Uzp0nag8TRLuZWgWl8
 PRdC5ypYM5d1w4FDnyBY/L2CaIQWfTrABftyWBJeukTIbrfeRZMeQVC8X
 oXAae11XlFfG7wus7i6zOr1WhGbxtc3K4lVMHQmgy7dEHtqDP2376DHRY
 niHuAUej9iezEnfKb8i3sNOLxpDJ7nshQxv3eM0Ty8L4iUgY9L7Ds9w1F
 pUta+7/E/GSApWhlZUmvR8SePIb4uPlsOym1Xcgmrh3QE+k3kqPBFBAWX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5381308"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5381308"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2024 17:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; d="scan'208";a="50738846"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Mar 2024 17:30:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 17:30:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 17:30:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Mar 2024 17:30:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Mar 2024 17:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2EH67+vat/AlBv9QGlW2DTEc8PuDe6QfZudtPDdiS6rnslTBDEv0LiZmHrWPtOduciYitj0FYYn6s4zSxE6NHex4HI3YOV8ejvq+ox0qdM/vkTZHBv/PAW/ofQELg/wHG07LWOSspA8yTTZHCFdB8Ya6Zym8MDdln1dAPh+tohLDjgcAxm2wwPFFBrKhzI5vn0TsHK4DIP24183nUTuINGlwnxZtBClaxMZUtl4Da4r24W/tcqCFtY7QYh6vCGHdyOXm7IKef+8SNtM1NvgUq/mz7ZOmhYtsa4I5UgdPc6oq3tSo7+nyVIwhDNHJs4Uyl4QODsB6FlVuy4bsb63VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+qKSz4PQYw6PmO02f2scs2/iQHmp9ykw3JuAVlNgIA=;
 b=gF27xactRyPb4zIh3qPTyFXyNzdAgdPR5cOJZT5zmRbCCc8Vh4PExcH3fxckhthWTHpKSJa2an/2ET49l8q42SckHg3KA2J0IqJxlSCY2X8SXiUH7YpSupUM+4RrT3RsKn9jGqtEDDVIJ1vG6xFTAjGWAZ04tR7B7bPU824zgarz17f9cAarekc/t0RuLpD7ukch+RLOi4EEi6TsO5lw8P/sjBAdJlF8etfhcxQNZbRRT08LlDhYY3vMkYkeSSBnsAOs0nBa4CPZ4qAEi1RcNA/lzZPoOeBhMgqLGD+DDhH/28w08rCPieeBOWaiELZIV348QaeB6h2DxDF0bKFKPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.24; Mon, 18 Mar
 2024 00:30:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 00:30:09 +0000
Date: Mon, 18 Mar 2024 00:29:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: Helper to populate a userptr or hmmptr
Message-ID: <ZfeK2EuGI3UT50be@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-5-oak.zeng@intel.com>
 <ZfNdHSODk7eNLA5X@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69915347D87B6A97A8E5AD05922F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB69915347D87B6A97A8E5AD05922F2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a33150-cce1-45bc-b242-08dc46e290da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vk+W7euiTV4OjcIFaBRqLGJJiigKkAWB9nkIwqJi/EKB6U1nHAOH4u7zcd2AA4LL2EMCyXo51FtPsKlPpUfIC30ITwWlV7RjLNm2q9LcamR7jomCaPzXa3XLmwvPB5Lq+if2IbTJUtzzP7ZHwRMHHyrq+fn7Kep2gZIwW1gLix21CkjJ8fXgeOiFX9pL7151RQTYADP5s42SERRhanwpSmWBwBpB5kAIw3Zzgz/zdSRCPNn5u8NhCxCWS+EnGnKzE5GDp9hzSLCenJ5PoVhQMfkZOIYKotcGrm+Td4/tDa20G545HvRHu2Q6kaiyMUUP6qYQ7T996yePbVNeL+twfJrm55qul+A/6CMSQwgYDQUtVarKroSdS7iQJjM2Pw0o6/z+NXa5Vjb3f0+3EFdVwFDCepmMOQQrTJrE5J0QkBSS9hG62Fq7Awj6Khi1GNH9PaBKvpjmchf/mWKu2dOq6LtWs2sSJrNunMH1IcXPRpaJtXyT++EHi1LI9Ve2eaDnho5cFta9+ZHiN8IlqMHu6Kz5FX3dAgtgGiAAVzGRURp+cp3P8CXE8ayq0Yi96lurvBJbBXVfbNglY30fIRA1zcZyqDdUHZqR/HrYXHPTtzOQTTTxvTqZIAtTEDrEkHKr9GDycQ0plRsVPgUiLY56otsNQRaaV2JoCv7NXrhfsN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?twLQvDP5DBeGruaLLPhb09OSl+EfMIIFRYhrZjxpjLBG03Pp0lQwrLbM0q?=
 =?iso-8859-1?Q?T3jAVK2ADvnhD1IWcMZ9EKEPNtK028Fqv7D4hEvQdwM+8QWTfOAlWZUnbx?=
 =?iso-8859-1?Q?xpMXzpWdHg1CbCoJQA65U3d/rnQiGa/4EY6FqWwCBJXX/VvXN5rnAcnq5A?=
 =?iso-8859-1?Q?YhG/Ix2dEDRx6TRudrcv/Obvl8f8kn5TWpIPP5bwEmaN7mg5Md346PZ9S8?=
 =?iso-8859-1?Q?O8L5zidegyAieotABBgPeBCA2vAu+Lu2vqtsUkhgWI0ftpKZlRU52UcGR9?=
 =?iso-8859-1?Q?l5HInAS9tqEH/hXkzvdYZRrPutHKZoPEuwxUGz4vCuvBU/a+378FyQTHLB?=
 =?iso-8859-1?Q?/3UnPJRnhx+w/rJTjnnvEsf0Gg/TbFV4YZpB1Xm4v8rYTyRrDH8aqe4Pxb?=
 =?iso-8859-1?Q?Cc9NaITlRFYb1OPSjyPId4HOKrrvGqRspW/NKTHtd6rc7TLR/WlOwxE7Qj?=
 =?iso-8859-1?Q?Qgjm43FkjOl9V/zF2VbhApcR6hqBwvdT0vklEHe2DrH2n1j19yZtiZrOY0?=
 =?iso-8859-1?Q?1iUOIDKbtMcrirc6lpq564i2vLjEErhQ6yI4Cca4I/dtIx9mb7tOtqDcOC?=
 =?iso-8859-1?Q?r5j3eg2JNkX4vhFObhsZtqW3UtcFP6T6ttw37u6yaUHs4SISW4nysohhsx?=
 =?iso-8859-1?Q?HZLnCo2XSJn5ukJzdJuIZwsSD5h3mE4ue608+13yrNLSuEgFLubA+uLaYQ?=
 =?iso-8859-1?Q?nwQ+I5qLzuxOtqQYZsHcin/KLFrlZv6ECtf8/51OM3ueXJ/96mtwhg2lBx?=
 =?iso-8859-1?Q?KwbDxEwy+6WDKWL0gjeHJltR//YsnB4fzNF3Ig0pBdDWvqbLZvGhNrWqOt?=
 =?iso-8859-1?Q?EfGJ0oT3w3Kzjjq6Nxr/2VetwymutRAQEAb0fdJotn74eGVXgRoKfQvMv5?=
 =?iso-8859-1?Q?h4og+cnV/cDkjv4r/Yp7QmsCsiSbtsL4NEU047452jsDuB313wzZa708x0?=
 =?iso-8859-1?Q?/buyzhAPwVCJGEGEuk4nSOntFY5fJSpmYDZ5L6ACOX3s9F7dHD2FrXjX3C?=
 =?iso-8859-1?Q?55Vaz7k7+iYAsHg1JVINxwKdlhybMUl5eD1m6yxZ1TDVYxGZdn2uSNxAKT?=
 =?iso-8859-1?Q?JSDPa04UTrd6ibGqc3QmgtAlwuyP9UapBj0lHtWSrisVKrARkyyF3K+FUw?=
 =?iso-8859-1?Q?c/YWumTeMq6irCyCJvveyM6wKFw0M6y2UXHYu71fOdGfAYrAT5bgBTh4/2?=
 =?iso-8859-1?Q?ppZD1On53R7v9jxsEEQdVMsdkqHWeX64Xi6BGKmOnJ9VjQCO9ZL0ZysD3R?=
 =?iso-8859-1?Q?+7AcxjWE8kk1KV/tpcvtG8FB4pNvawO6qUWNrl7Kz5kZJ4/BWbmnVlR9Zz?=
 =?iso-8859-1?Q?ml8F0XwDSsBRW9vA3acJ8sRh1PIvLOKPIzKj4Uo7/y9SvGJTOicGLFAKMI?=
 =?iso-8859-1?Q?zrvgvmvPE01PgTBBJAl5N4nxcqOQ9Q2jx154NgYspMEgjavrcj9QNvUWLm?=
 =?iso-8859-1?Q?WsP6dwVIR9uLVAESG0N6eBInQoCNac9uvOXCIJBVR2xIRoiMi+/m700WCe?=
 =?iso-8859-1?Q?civPeGRbGvNR0lR5/MT59ByIpJCULbr4BN/GwCC5ylD17BjBNmb6t/xKY3?=
 =?iso-8859-1?Q?HODpcm9R0dFHoMe+YwukuAtn30wzkp8sHeTpkSQ8mYb54WddBdwnr1aLpg?=
 =?iso-8859-1?Q?F4pZ0QDnP1iyXIkivyyAfkylHn3gTXH54X1dTew31Ti+A6Pgnr9YrUQg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a33150-cce1-45bc-b242-08dc46e290da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 00:30:08.8929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3NVRDoU5R5FT3SeVXt37270hbChWN/AOqEhVLGnOgt9BEOVgVCXmKlG5bOcK6nZAntNLlcEEVWu0VOgMNh7sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
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

On Fri, Mar 15, 2024 at 07:35:15PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, March 14, 2024 4:25 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH 4/5] drm/xe: Helper to populate a userptr or hmmptr
> > 
> > On Wed, Mar 13, 2024 at 11:35:52PM -0400, Oak Zeng wrote:
> > > Add a helper function xe_hmm_populate_range to populate
> > > a a userptr or hmmptr range. This functions calls hmm_range_fault
> > > to read CPU page tables and populate all pfns/pages of this
> > > virtual address range.
> > >
> > > If the populated page is system memory page, dma-mapping is performed
> > > to get a dma-address which can be used later for GPU to access pages.
> > >
> > > If the populated page is device private page, we calculate the dpa (
> > > device physical address) of the page.
> > >
> > > The dma-address or dpa is then saved in userptr's sg table. This is
> > > prepare work to replace the get_user_pages_fast code in userptr code
> > > path. The helper function will also be used to populate hmmptr later.
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Co-developed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile |   3 +-
> > >  drivers/gpu/drm/xe/xe_hmm.c | 213
> > ++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_hmm.h |  12 ++
> > >  3 files changed, 227 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> > >
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 840467080e59..29dcbc938b01 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -143,7 +143,8 @@ xe-y += xe_bb.o \
> > >  	xe_wait_user_fence.o \
> > >  	xe_wa.o \
> > >  	xe_wopcm.o \
> > > -	xe_svm_devmem.o
> > > +	xe_svm_devmem.o \
> > > +	xe_hmm.o
> > >
> > >  # graphics hardware monitoring (HWMON) support
> > >  xe-$(CONFIG_HWMON) += xe_hwmon.o
> > > diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> > > new file mode 100644
> > > index 000000000000..c45c2447d386
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_hmm.c
> > > @@ -0,0 +1,213 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/mmu_notifier.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/memremap.h>
> > > +#include <linux/swap.h>
> > > +#include <linux/mm.h>
> > > +#include "xe_hmm.h"
> > > +#include "xe_vm.h"
> > > +
> > > +/**
> > > + * mark_range_accessed() - mark a range is accessed, so core mm
> > > + * have such information for memory eviction or write back to
> > > + * hard disk
> > > + *
> > > + * @range: the range to mark
> > > + * @write: if write to this range, we mark pages in this range
> > > + * as dirty
> > > + */
> > > +static void mark_range_accessed(struct hmm_range *range, bool write)
> > > +{
> > > +	struct page *page;
> > > +	u64 i, npages;
> > > +
> > > +	npages = ((range->end - 1) >> PAGE_SHIFT) - (range->start >>
> > PAGE_SHIFT) + 1;
> > > +	for (i = 0; i < npages; i++) {
> > > +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> > > +		if (write) {
> > > +			lock_page(page);
> > > +			set_page_dirty(page);
> > > +			unlock_page(page);
> > > +		}
> > > +		mark_page_accessed(page);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * build_sg() - build a scatter gather table for all the physical pages/pfn
> > > + * in a hmm_range. dma-address is save in sg table and will be used to
> > program
> > > + * GPU page table later.
> > > + *
> > > + * @xe: the xe device who will access the dma-address in sg table
> > > + * @range: the hmm range that we build the sg table from. range-
> > >hmm_pfns[]
> > > + * has the pfn numbers of pages that back up this hmm address range.
> > > + * @st: pointer to the sg table.
> > > + * @write: whether we write to this range. This decides dma map direction
> > > + * for system pages. If write we map it bi-diretional; otherwise
> > > + * DMA_TO_DEVICE
> > > + *
> > > + * All the contiguous pfns will be collapsed into one entry in
> > > + * the scatter gather table. This is for the convenience of
> > > + * later on operations to bind address range to GPU page table.
> > > + *
> > > + * The dma_address in the sg table will later be used by GPU to
> > > + * access memory. So if the memory is system memory, we need to
> > > + * do a dma-mapping so it can be accessed by GPU/DMA. If the memory
> > > + * is GPU local memory (of the GPU who is going to access memory),
> > > + * we need gpu dpa (device physical address), and there is no need
> > > + * of dma-mapping.
> > > + *
> > > + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> > > + * memory. Add this when you support p2p
> > > + *
> > > + * This function allocates the storage of the sg table. It is
> > > + * caller's responsibility to free it calling sg_free_table.
> > > + *
> > > + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> > > + */
> > > +static int build_sg(struct xe_device *xe, struct hmm_range *range,
> > 
> > xe is unused.
> 
> It is used in below line
> > 
> > > +			     struct sg_table *st, bool write)
> > > +{
> > > +	struct device *dev = xe->drm.dev;
> 
> Used here
> 
> > > +	struct scatterlist *sg;
> > > +	u64 i, npages;
> > > +
> > > +	sg = NULL;
> > > +	st->nents = 0;
> > > +	npages = ((range->end - 1) >> PAGE_SHIFT) - (range->start >>
> > PAGE_SHIFT) + 1;
> > > +
> > > +	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < npages; i++) {
> > > +		struct page *page;
> > > +		unsigned long addr;
> > > +		struct xe_mem_region *mr;
> > > +
> > > +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> > > +		if (is_device_private_page(page)) {
> > > +			mr = page_to_mem_region(page);
> > 
> > Not seeing where page_to_mem_region is defined.
> 
> 
> Yah,,,, I forgot to pick up this patch. Will pick up...
> 
> > 
> > > +			addr = vram_pfn_to_dpa(mr, range->hmm_pfns[i]);
> > > +		} else {
> > > +			addr = dma_map_page(dev, page, 0, PAGE_SIZE,
> > > +					write ? DMA_BIDIRECTIONAL :
> > DMA_TO_DEVICE);
> > > +		}
> > > +
> > > +		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
> > > +			sg->length += PAGE_SIZE;
> > > +			sg_dma_len(sg) += PAGE_SIZE;
> > > +			continue;
> > > +		}
> > > +
> > > +		sg =  sg ? sg_next(sg) : st->sgl;
> > > +		sg_dma_address(sg) = addr;
> > > +		sg_dma_len(sg) = PAGE_SIZE;
> > > +		sg->length = PAGE_SIZE;
> > > +		st->nents++;
> > > +	}
> > > +
> > > +	sg_mark_end(sg);
> > > +	return 0;
> > > +}
> > > +
> > 
> > Hmm, this looks way to open coded to me.
> > 
> > Can't we do something like this:
> > 
> > struct page **pages = convert from range->hmm_pfns
> > sg_alloc_table_from_pages_segment
> > if (is_device_private_page())
> >         populatue sg table via vram_pfn_to_dpa
> > else
> >         dma_map_sgtable
> > free(pages)
> > 
> > This assume we are not mixing is_device_private_page & system memory
> > pages in a single struct hmm_range.
> 
> 
> 
> that is exactly I pictured. We actually can mixing vram and system memory... the reason is, migration of a hmm range from system memory to vram can fail for whatever reason. And it can end up a range is partially migrated.... And migration is best effort in such case. We just map the system memory in that range to gpu for such case. This will come up in the coming system allocator patches...
> 
> This case was found during i915 test...
> 
> I also checked amd's code. They assume the same, just take a look of function svm_range_dma_map_dev.
> 
> agree that code is not nice. But I don't have a better way assuming above
> 

Hmm, based on what you saying if a migration failed with a partial
migration I'd say we'd do one of two things.

1. Reverse the partial migration
2. Split GPUVA (or pt_state if supporting 1:N) based on the migration

I don't think we'd ever want a GPUVA (or pt_state) that is mixed between
SRAM / VRAM for variety of reasons.

This is all speculation (both my comment and yours) as we haven't gotten
to implementing the system allocator in Xe.

How about for this series we drop all device mapping support (this would
be untested dead code in Xe which we shouldn't merge anyways) and just
add the hmm layer which maps a SG for system memory only.

Once we need device mapping support we add this into hmm layer then.

Sound reasonable?

> > 
> > 
> > > +/**
> > > + * xe_hmm_populate_range() - Populate physical pages of a virtual
> > > + * address range
> > > + *
> > > + * @vma: vma has information of the range to populate. only vma
> > > + * of userptr and hmmptr type can be populated.
> > > + * @hmm_range: pointer to hmm_range struct. hmm_rang->hmm_pfns
> > > + * will hold the populated pfns.
> > > + * @write: populate pages with write permission
> > > + *
> > > + * This function populate the physical pages of a virtual
> > > + * address range. The populated physical pages is saved in
> > > + * userptr's sg table. It is similar to get_user_pages but call
> > > + * hmm_range_fault.
> > > + *
> > > + * This function also read mmu notifier sequence # (
> > > + * mmu_interval_read_begin), for the purpose of later
> > > + * comparison (through mmu_interval_read_retry).
> > > + *
> > > + * This must be called with mmap read or write lock held.
> > > + *
> > > + * This function allocates the storage of the userptr sg table.
> > > + * It is caller's responsibility to free it calling sg_free_table.
> > 
> > I'd add a helper to free the sg_free_table & unmap the dma pages if
> > needed.
> 
> Ok, due to the reason I explained above, there will be a little complication. I will do it in a separate patch.

Maybe something like:

void xe_hmm_unmap_sg(struct xe_device *xe, struct sg_table *sg, bool read_only)

Again for now this will call dma_unmap_sgtable & sg_free_table as we
only support system memory, once we support device memory it will skip
dma_unmap_sgtable device memory.

> > 
> > > + *
> > > + * returns: 0 for succuss; negative error no on failure
> > > + */
> > > +int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range
> > *hmm_range,
> > > +						bool write)
> > > +{
> > 
> > The layering is all wrong here, we shouldn't be touching struct xe_vma
> > directly in hmm layer.
> 
> I have to admit we don't have a clear layering here. This function is supposed to be a shared function which will be used by both hmmptr and userptr.
> 
> Maybe you got an impression from my POC series that we don't have xe_vma in system allocator codes. That was true. But after the design discussion, we have decided to unify userptr code and hmmptr codes, so we will have xe_vma also in system allocator code. Basically xe_vma will replace the xe_svm_range concept in my patch series.
> 
> Of course, per Thomas we can further optimize by splitting xe_vma into mutable and unmutable... but that should be step 2.
> 
> > 
> > Pass in a populated hmm_range and sgt. Or alternatively pass in
> > arguments and then populate a hmm_range locally.
> 
> Xe_vma is the input parameter here.
>

It shouldn't be, thats my point. It is the wrong layering.
 
> I will remove Hmm_range from function parameter and make it a local. I figured I don't need this as an output anymore. All we need is already in sg table. 
> 

I was thinking a prototype like this:

int xe_hmm_map_sg(struct xe_device *xe, struct sg_table *sg,
		  struct mmu_interval_notifier *notifier,
		  long unsigned *current_seq, u64 addr, u64 size,
		  bool read_only, bool need_unmap)

Again now only system memory support. This function will replace most of
the current code in xe_vma_userptr_pin_pages. I have more on this in
patch 5.

If you like xe_hmm_populate_sg more, open to that name too. As with
xe_hmm_unmap_sg, feel free to rename too.

> > 
> > > +	unsigned long timeout =
> > > +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
> > > +	struct xe_userptr_vma *userptr_vma;
> > > +	struct xe_userptr *userptr;
> > > +	u64 start = vma->gpuva.va.addr;
> > > +	u64 end = start + vma->gpuva.va.range;
> > 
> > We have helper - xe_vma_start and xe_vma_end but I think either of these
> > are correct in this case.
> > 
> > xe_vma_start is the address which this bound to the GPU, we want the
> > userptr address.
> > 
> > So I think it would be:
> > 
> > start = xe_vma_userptr()
> > end = xe_vma_userptr() + xe_vma_size()
> 
> You are correct. Will fix. I mixed this because, in system allocator, cpu address always == gpu address 
> > 
> > 
> > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > > +	u64 npages;
> > > +	int ret;
> > > +
> > > +	userptr_vma = to_userptr_vma(vma);
> > > +	userptr = &userptr_vma->userptr;
> > > +	mmap_assert_locked(userptr->notifier.mm);
> > > +
> > > +	npages = ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
> > 
> > This math is done above, if you need this math in next rev add a helper.
> 
> 
> Will do.
> > 
> > > +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > > +	if (unlikely(!pfns))
> > > +		return -ENOMEM;
> > > +
> > > +	if (write)
> > > +		flags |= HMM_PFN_REQ_WRITE;
> > > +
> > > +	memset64((u64 *)pfns, (u64)flags, npages);
> > 
> > Why is this needed, can't we just set hmm_range->default_flags?
> 
> In this case, set default_flags also work.
> 
> This is some codes I inherited from Niranjana. Per my test before it works.
> 
> Basically there are two way to control the flags:
> Default is the coarse grain way applying to all pfns
> The way I am using here is a per pfn fine grained flag setting. It also works.
> 

I'd stick with default_flags unless we have reason not to.

> > 
> > > +	hmm_range->hmm_pfns = pfns;
> > > +	hmm_range->notifier_seq = mmu_interval_read_begin(&userptr-
> > >notifier);
> > 
> > We need a userptr->notifier == userptr->notifier_seq check that just
> > returns, right?
> 
> Yes this sequence number is used to decide whether we need to retry. See function xe_pt_userptr_pre_commit

This check basically means the current sg is valid and short circuits.

Maybe we don't need it? I don't think we ever call this function when
this condition is true. But if it is removed then we should have an
assert userptr->notifier_seq (*current_seq in my function prototype
above) != mmu_interval_read_begin. This ensures we are not calling this
function / mapping a sg table when already have a valid one.

> > 
> > > +	hmm_range->notifier = &userptr->notifier;
> > > +	hmm_range->start = start;
> > > +	hmm_range->end = end;
> > > +	hmm_range->pfn_flags_mask = HMM_PFN_REQ_FAULT |
> > HMM_PFN_REQ_WRITE;
> > 
> > Is this needed? AMD and Nouveau do not set this argument.
> 
> 
> As explained above. Amd and nouveau only use coarse grain setting
> 

My position is use coarse grain until we have a reason not to.

> > 
> > > +	/**
> > > +	 * FIXME:
> > > +	 * Set the the dev_private_owner can prevent hmm_range_fault to fault
> > > +	 * in the device private pages owned by caller. See function
> > > +	 * hmm_vma_handle_pte. In multiple GPU case, this should be set to the
> > > +	 * device owner of the best migration destination. e.g., device0/vm0
> > > +	 * has a page fault, but we have determined the best placement of
> > > +	 * the fault address should be on device1, we should set below to
> > > +	 * device1 instead of device0.
> > > +	 */
> > > +	hmm_range->dev_private_owner = vm->xe->drm.dev;
> > > +
> > > +	while (true) {
> > 
> > mmap_read_lock(mm);
> > 
> > > +		ret = hmm_range_fault(hmm_range);
> > 
> > mmap_read_unlock(mm);
> 
> 
> This need to be called in caller. The reason is, in the system allocator code path, mmap lock is already hold before calling into this helper.
> 
> I will check patch 5 for this purpose.
> 

This is missing in patch 5.

Also per the hmm.rst doc and 2 of the 3 existing existing cases in of
hmm_range_fault in the kernel this lock is taken / dropped directly
before / after hmm_range_fault. For the current use case (userptr)
taking this lock here certainly will work.

Again saying the system allocator will hold this lock is IMO speculation
and shouldn't dictate what we do in this series. If we have move the
lock in once the system allocator lands, we can do that then.

> > 
> > > +		if (time_after(jiffies, timeout))
> > > +			break;
> > > +
> > > +		if (ret == -EBUSY)
> > > +			continue;
> > > +		break;
> > > +	}
> > > +
> > > +	if (ret)
> > > +		goto free_pfns;
> > > +
> > > +	ret = build_sg(vm->xe, hmm_range, &userptr->sgt, write);
> > > +	if (ret)
> > > +		goto free_pfns;
> > > +
> > > +	mark_range_accessed(hmm_range, write);
> > > +	userptr->sg = &userptr->sgt;
> > 
> > Again this should be set in caller after this function return.
> 
> why we can't set it here? It is shared b/t userptr and hmmptr
>

This is owned by the VMA userptr and should be set in that layer (set in
xe_vma_userptr_pin_pages). Setting this value means the SG is valid
(this maps to need_unmap in my function prototype example).

> 
> > 
> > > +	userptr->notifier_seq = hmm_range->notifier_seq;
> > 
> > This is could be a pass by reference I guess and set here.
> 
> Sorry, I don't understand this comment.
>

This is current_seq in my function prototype example. Does that make
sense?

Matt

> > 
> > > +
> > > +free_pfns:
> > > +	kvfree(pfns);
> > > +	return ret;
> > > +}
> > > +
> > > diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> > > new file mode 100644
> > > index 000000000000..960f3f6d36ae
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_hmm.h
> > > @@ -0,0 +1,12 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +#include <linux/hmm.h>
> > > +#include "xe_vm_types.h"
> > > +#include "xe_svm.h"
> > 
> > As per the previous patches no need to xe_*.h files, just forward
> > declare any arguments.
> 
> 
> Will do.
> 
> Oak
> > 
> > Matt
> > 
> > > +
> > > +int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range
> > *hmm_range,
> > > +						bool write);
> > > --
> > > 2.26.3
> > >
