Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E535C48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 16:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E595A10E9A5;
	Thu,  8 Feb 2024 16:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REGTNGyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD38910E9A2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707411497; x=1738947497;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9NJ8VADHe297WTIObrBIZzrej9FZPbU83p59kqzfG9A=;
 b=REGTNGyNeC0tEAxUl9tXrXljXJVrKGyhlRVVUSoNTPSx1acplbeAnrAl
 0BKE9PO8aoZ8jeulvclBU4CzO94l6A/u0/POma0EjFJkOIcJFMNbUIA+2
 AUm1zEjzbl1iu/+ZNYy5ZkLC0s6YOkTaRpQGbx9vUNysYbEGVhv0zhnnf
 06jKFbZpLRnAYX7X9juB1y75/xp8uj19wFTiOAwVX2fpWw6UniAbc1gtl
 2y6eeC3Dc0gKlYQ/JqNK87huITYhVww41fZ957zOU90MszwoOmAJ9m2mM
 E+E21s48HKsWUMalwQqXVt1z18i9IkzXpqv3bK/YcZLN2V+YRVFzdYDH1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18679697"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="18679697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:58:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1736949"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 08:58:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 08:58:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 08:58:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 08:58:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 08:58:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InKHaYd5P8NO2i5znk7wHtgz9qXcdIjqMt7u/4zBlpgkqfCHJx/vhRCwqXCQIWUSsj64yZfcihWT2Ad9xm757GxzVsSSYfT9fo10Siz0tCxC+H5ubdqcCjOkjSSwu6FUKr0RUJs9vRgU9xYBRPELZpDpgO8ysqGq5YE2hsJb7CNlf4OMRtslNGz2xBH7atBsvtwVQm+0diSIciqeB37f5xVDz0XS1uSNW7V6QqRz0LrjHpeDbARtQXPUi5ov32NJIW4qVvyttqxeWPcTL3Bn1SnjWLxEpeZlE7vpSa+jpO1rXyPmqS9/hEk9RNCgLDpLnji3L+HxlfXQpgM0iAVHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5ex8iYk8v2YveZif+H6c9K4g51TP80qXrsQqJ5Ee2U=;
 b=h8sb0fZhnN6ZaXb/xf83b3/8duRmvtISvI1GXLbZgg9tBaiM89yWQcwYijMBUIqEBTEOivlZmOGouAvIglpy/i8BcooaCR4dR/S8VjoPdDQSrdQvX46qaCEqG4GORuqoIxgoSkhcBNISFHX4GWTHtlAoJ96zXC/qkuQXHrwVjTzLnAEekyj4ZqCEqgJDFUCbjUBYXagD86zIWUwXDqUDAo2LEmToo9osX6f4OF5e87pIrimCXKnlTsSLIhKDxGnjf0KOugQY67BYl2eFxRPB9Vg/PkWRtcoaalGr6VaKt2CDSKi2/XAV35N+MzesS7RK2ADkhZMgsByg7xYtacgKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5528.namprd11.prod.outlook.com (2603:10b6:208:314::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39; Thu, 8 Feb
 2024 16:58:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%6]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 16:58:08 +0000
Date: Thu, 8 Feb 2024 16:57:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/vm: Avoid reserving zero fences
Message-ID: <ZcUIBqIBA6JrObQZ@DUT025-TGLU.fm.intel.com>
References: <20240208132115.3132-1-thomas.hellstrom@linux.intel.com>
 <4d058e2e-dd9b-4765-b579-c1cdca71ca41@intel.com>
 <f7638e75a7cc0c1d289875e81cde4d8772f197e7.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7638e75a7cc0c1d289875e81cde4d8772f197e7.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5303cc-34c8-4a48-a757-08dc28c72051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqSZeWukhBV8uXILbXJl10I7fg+odfuRxS91fEGgLowj2Xka69lU4NaQVxXsYIeHCPxnD+Xc5vB+8sOjk3+/oDJ1Zv+RhQwzdjnYLtQqRF4SpRXuuxCa3AxC3yWSdIwv7mEBOCyRIkq4ldjIlFI0qqHHUc/Fm9q7J48GWbR6L2Q8UbdJ19OD9Si5MFkC+UaEAGCKAbHy2qad7aVt+E0Cu1n1sfvsTe4yHzIXIklZQBIin2VbIKzzbEOS2IB0BvZoD4ulKM+yRfoTr8q+iWHLAfXkU/K1wHFTWFK8q/eRfbx1Ipil/0sEvwiPkO0wLNHUhayVjs5nDTqqApR/NhoOhW1g1f90UOOOg2omLmvARnDLoitY6EEn19ouGoS41bR8x3duRZNqjrC5nI7+BfNdKdnEKj6lX6xRE/3Uc+DFXCSW81GAdELuCZD6TkU9+9FJS2Ae4kKKMlL1MCqa5kPTFe+hUVdY2tZqG+4EH9wwvNXdhAeaDYRqeMv16qj8ulVTzFosU20Iv/mVTWyFiROsZBEMfcp/WKIRxp9fGOMql+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(316002)(54906003)(66476007)(66946007)(66556008)(6916009)(41300700001)(6666004)(2906002)(5660300002)(4326008)(8936002)(8676002)(44832011)(6486002)(478600001)(966005)(6506007)(6512007)(53546011)(83380400001)(86362001)(82960400001)(66574015)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?n75gvBrFzo0C6TRHbGP0di0ZhINZdtHIjAL9CKBBLnuJYMJHVBfJ/6b2Ka?=
 =?iso-8859-1?Q?jsWWST8DtKMefZBUTLomI6BT/LJCeyU3b6jEy4IOfQpR5hU26bCPDTemnz?=
 =?iso-8859-1?Q?usSQRPJ3ryGXcoHQdazPHIFMgBD9XstdXOe+vJSy2YY5sohv/jJZRhNyXp?=
 =?iso-8859-1?Q?d6ebhQezH/GvL58mW3MnmUISndwQvKpTGdvPSnfkWAMnB2WYaIRiEr4vO8?=
 =?iso-8859-1?Q?81x44fxgN0TRMLLGt/31zvDri5N7Fx6RIbjMO93JBm35rcKl2Z/t80WdwP?=
 =?iso-8859-1?Q?TryZhV1XHC9xiVExm9zUZ/XCk4tYmqQ4JhP3brRBIS4PfosZnZGUNPL8/v?=
 =?iso-8859-1?Q?50tzY2TNePxqj5fYRP+9IK/m+kF+3AcBgD5CUWzCTnbFD7c9qNGRJBrukx?=
 =?iso-8859-1?Q?R3QNplUlpRnq1nHnRjHl9lX/udLMyxdi3xYecTGtfFFapnNk2coNSkmMzn?=
 =?iso-8859-1?Q?XXPdnEDbnw0EUp3Gxhw74DhZawS8yLs0etiLdff2TD/6fgGuw2PqDL0XFd?=
 =?iso-8859-1?Q?p0G6U8GrDfR09bsjGDGmbB0StvOp1fAVjymcXZuQ1ynISSUZxBOoNNfLgz?=
 =?iso-8859-1?Q?CC9XBWQXlTDL010yBrlqOsRhbKnYKydbgHukj/wRFBNUMmoonN91xF+XPt?=
 =?iso-8859-1?Q?tTObzR9SDMl8N7tnOS++gq8QNQ7SubtCCEuZoA8bR+y4RI7HR/jPTn6zeb?=
 =?iso-8859-1?Q?1BWaNRLZjafiVYNpTTGKB0xXeFYkSSxH/B09kjjHvsXT/sokYtexCpDit9?=
 =?iso-8859-1?Q?GTVijaZlHuM/uboRpzb0BX5tk8ryzTqI5amvi6fiwD7cv0IEZk5tepQu3b?=
 =?iso-8859-1?Q?WkYe49C7YRsjvXLE2jT8c0TWjtQLnWl/MltS/yOzvKjyH0byIr5/A8A+zX?=
 =?iso-8859-1?Q?NNNZnhSvt5EHvckBNHhqK5JRDn2OXV/YY0f/IOXJsqcxg0Cy1BOL+0Ovd8?=
 =?iso-8859-1?Q?2B6kMDfETUJwdH+CMLBVP1gAjiPappLv+guZzGXdXQRN/kha/blNmlYPe0?=
 =?iso-8859-1?Q?w/45Ynnl4yFtOqT91oeD1PuhpOtcMcyTnMq/wC9iEJJUB9NWeE4/qnBcI2?=
 =?iso-8859-1?Q?ffedXmxfuds2DP9ar4V0Mt5EsT6eXP98Xa2ibSIkXU8Fb+T/lR7hz3xcHX?=
 =?iso-8859-1?Q?KFarmtSVEBd9a240OXX8dzybX7+uORoCSsIL4z4gjI2VkY7U00xw2G/xAL?=
 =?iso-8859-1?Q?iWishg+jpI9bcU9v5H3p3LxBshcAZ9knqnBAeAGd4az845Z8fDv/foST/R?=
 =?iso-8859-1?Q?grF7/KWstPHhkaakCi/5DfpFCoSELnCVxNGvf+u+OUITyYAVHmsIiMHJXX?=
 =?iso-8859-1?Q?XFBOsSoF/0S/oUD7giw6ex327DescYrQaVhbyf1a1a0CtWA+ea7Waqh+LZ?=
 =?iso-8859-1?Q?Lg3q/vyLutm3A4QWP7Go6uMUvZ9GA9ogaperKcp2Dyi0lCqkctnN8JIzxO?=
 =?iso-8859-1?Q?qKgJDT5QYvoYuOex2Vb86pLBZ3k7DF9RfSD7txv97dBDvqprqMl8uzVxTj?=
 =?iso-8859-1?Q?4A2DV19FZcUoUeVKrk7Lt5XQhWIBhP9HVyTlLDRD63QwHQQl5IBt/68A4J?=
 =?iso-8859-1?Q?RDDUoPntbdjXZAQdY3zv+5Zy2+yvp4iP/WbURVlTxmyc4CtoIhu+rHkZ2g?=
 =?iso-8859-1?Q?gMjhA5GqF/hGgj4MCPSjK5GYMPTdpbdVuf5TxltDxFVNr2r0yDWu83yQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5303cc-34c8-4a48-a757-08dc28c72051
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 16:58:08.6824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IO2wHxtDfe3VsznR1go62bbf47wLvmHuCDIo5ghY/88gaWpImReO8VWBkYG9hcT2/LIBFqB4rQlGqEcy7xB0iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5528
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

On Thu, Feb 08, 2024 at 04:19:08PM +0100, Thomas Hellström wrote:
> On Thu, 2024-02-08 at 15:05 +0000, Matthew Auld wrote:
> > On 08/02/2024 13:21, Thomas Hellström wrote:
> > > The function xe_vm_prepare_vma was blindly accepting zero as the
> > > number of fences and forwarded that to drm_exec_prepare_obj.
> > > 
> > > However, that leads to an out-of-bounds shift in the
> > > dma_resv_reserve_fences() and while one could argue that the
> > > dma_resv code should be robust against that, avoid attempting
> > > to reserve zero fences.

I think the dma-resv should protect for warn against this. Seeems to be
a common mistake that more or less is silent. We've made this mistake at
least 2 times now [1] in Xe.

Matt

[1] https://patchwork.freedesktop.org/patch/572338/?series=127892&rev=2

> > > 
> > > Relevant stack trace:
> > > 
> > > [773.183188] ------------[ cut here ]------------
> > > [773.183199] UBSAN: shift-out-of-bounds in
> > > ../include/linux/log2.h:57:13
> > > [773.183241] shift exponent 64 is too large for 64-bit type 'long
> > > unsigned int'
> > > [773.183254] CPU: 2 PID: 1816 Comm: xe_evict Tainted: G    
> > > U             6.8.0-rc3-xe #1
> > > [773.183256] Hardware name: ASUS System Product Name/PRIME Z690-P
> > > D4, BIOS 2014 10/14/2022
> > > [773.183257] Call Trace:
> > > [773.183258]  <TASK>
> > > [773.183260]  dump_stack_lvl+0xaf/0xd0
> > > [773.183266]  dump_stack+0x10/0x20
> > > [773.183283]  ubsan_epilogue+0x9/0x40
> > > [773.183286]  __ubsan_handle_shift_out_of_bounds+0x10f/0x170
> > > [773.183293]  dma_resv_reserve_fences.cold+0x2b/0x48
> > > [773.183295]  ? ww_mutex_lock+0x3c/0x110
> > > [773.183301]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
> > > [773.183313]  xe_vm_prepare_vma+0x33/0x70 [xe]
> > > [773.183375]  xe_vma_destroy_unlocked+0x55/0xa0 [xe]
> > > [773.183427]  xe_vm_close_and_put+0x526/0x940 [xe]
> > > 
> > > Fixes: 2714d5093620 ("drm/xe: Convert pagefaulting code to use
> > > drm_exec")
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> Thanks, Matthew
> What happened to your dma-resv patch you had for this?
> 
> 
> /Thomas
