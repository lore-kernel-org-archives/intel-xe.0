Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4B7C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 18:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A510E3EC;
	Tue, 25 Jul 2023 18:07:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261D10E194
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 18:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690308431; x=1721844431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zc8NytwW8UtFaZ7ePrIw6NGpFQtZUe5sQk22zAkcDDw=;
 b=F91QbLrUyjlP8xVytKiD56kOSO3F5mrnFw1OKSEoHmxMN/EoHsA22pVR
 9t7Xd8RZNpZZbK9/8Y/yMCri0ua4dcFQ2S16RDdjWOxgg/BLubLzE0Yqr
 RDEEKWTDwqqv6hI3wlUnCplSKookGZStz3XFfWqwBFal/jFNPpqgWFCW8
 Sf827LjW0Rfpm4uqvEAcoEYKvQsKtf9YttJGki8jwV/JNoNsC8vt6/HbX
 UWJTgg0dkrsTYODujGrNKRMLsqfM6NMxty6Hi8K7v3veSDwIA4U14/SkC
 8l0YJoxbdQi5wRsdtisgfd+aZV3J5HFYgnMgMRirZNVfBaHmt7StUptuG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370481991"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="370481991"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 11:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="972775274"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="972775274"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 11:07:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 11:07:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 11:07:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 11:07:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 11:07:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQbyNpygx/yRLQV1bnjJ4hRYOc5UF06Vl0DPxXLYyl0h6Ce/VS3KaWlSHkdx3uxDNO31f7020sPoh20hnawUHYT/RHTEZNF4TMiDrQ7DyfPaPW84ID8cXgicdQttfNUGpuv8ojX9u5ey75R5uhMWX9q3Oo61KXMmy9dgo6mjOQ4/7JfS34HX8TXXp9UvcC+8yx91qqDco4b+uCrcOtxZ7V8xKCkbv/MwuYQJLPXCOlFarej5WndAtbCUsbpFJHL1kQPuP5HMOyNRGcYSydzYjxy5ylTbs/5lRvXL29P0Cqt90+ChIyXv60v0+PMIr+HwUBS7PLF9cVEeCpVYJl9DGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3RDxC+E6L7evd0etIlHVhpYzyQPSBqd5bkexPZ0KGE=;
 b=YhNr8lTO+lSRWkFPwMO/DGvY2NWzoITQvAU06dU4Fst4U/TYz610N6SA0MmNz94NilYg2lMrNJDOr3lCSaAtT4iILZCPjq0y5J909Qzi8JLY3KQjQpfZDUS8e22Pca3glEGk3P6f9D3tn+giBVDCN2DToug+5/S9pRvhI/k893c74V2Eucl8IHffFh9qyapjPhwv/3rhyDwX1In8ygNugoYeptmzCA15LZhX2E7ozZxhINdrhjs5y6rx7Gg6d+xpTonuRZZ5/qlscZMO64SsJ0TH+eMj22fR6MuLuzknxXhLd73xUcaob4m/qmoefRj0gLv35kTQFUdMEWGWmijX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 18:07:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 18:07:08 +0000
Date: Tue, 25 Jul 2023 15:07:02 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <2kl4qp2djjpbb4ef63irezikb43zau7hxpzx66vdxziozwwh4f@qcfoakkvqtmx>
References: <20230725164344.3797085-1-lucas.demarchi@intel.com>
 <20230725172039.GL138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725172039.GL138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: bc472187-0154-4738-c132-08db8d39f59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Q2zk6ltwKWtLPoL8wbu94fqyoU0n9GjbnJvm4/wj+P8M7FZoa2whInoXUAeku/+il0eog3myo0OTj68gS2tg0+LQaMcKmW5XVhiuwkhJMj7/tdDsybN3RPISr5rIGnOGeDbulES6cC26fR/Pz1YOujoVenJV/J4lTuRflNbdIBhZEBYrEt9I8vG+P5rgxRbAGfWzel6//UWoDXLmw7uGw1Llkf9QgwqlI4Vy+rQtyUbQvC542CtHLPOAyoreLDQxqyt3WW5sO+w7gp/13jSWpPbXsB46KSTb3HVBgoPLpl2YY+t7AAo/Xo5e3hMzwQWyX5BLZCDLn+iDAJ1/gIjwJXo95bTH5PBXP5cDK95ZhKYDm/WZmemxiHFZqWq3q2qmZOHkeyNDCPxVHSY/PVCzTBE4MLbWcs6W7WQAAZbM1QiZbEnqHTK9zDOoIhDwBo8P4FIkLCk92TE0xF0uy/0GfraVTY+3CzhzZ6LYRmncpGZHvQ1okfquucG5b0DjQec1MKJLGwolsPE0LWMpI5BI4qMTLLbAahCfct1FUYBaOHJ/QSEnSwqWs7YSsEuHqj2v8eVAEF1VZR7TTK9rIup+QIxIeO0YeAzj3HSE78D1bgDqepgPhH4kNqkgVQQY7we
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(8936002)(8676002)(5660300002)(6862004)(33716001)(41300700001)(316002)(2906002)(66476007)(66556008)(66946007)(6666004)(4326008)(6506007)(26005)(38100700002)(6636002)(107886003)(6512007)(83380400001)(9686003)(6486002)(86362001)(478600001)(82960400001)(186003)(27246005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YznBhgQpzo70g0zN5VnYgoqkimxhvFjTbLw+zT/9WqTJUtcRhHg6NQGBHtdx?=
 =?us-ascii?Q?iKvUHG4F/5ngIY8YjoyyabcFMmpq+hUiPiA9g8wwK4Jjidw+fBHKD/b+x9N+?=
 =?us-ascii?Q?635OVgnrMMRH98Bz6FcKKjYKQPWh8GTYkEh9JNX7G+suN0107ecaxopTzcSK?=
 =?us-ascii?Q?Pg50R39YHNvrLImk+KK9vGfcrjzOzMQizp/7ea4aoKXTYURODgRjkhrGKIBa?=
 =?us-ascii?Q?LNLdynJdhC6LNBCVcoOo4mUJsJatTKvhIJUuW9E4u8c5h78lgUy67odLPPAL?=
 =?us-ascii?Q?SQlk56f4xaNoG6Ej30dtwHQRL+d1BWXsImsw/Rt7MAGAHAoBvHz4GIRf/Dan?=
 =?us-ascii?Q?fRA1LnPQ04GrCNxzaz478aCrOji5myrXiDObnuuXaID33QF3zoSdElhEM7H7?=
 =?us-ascii?Q?6MF98C+BqEtlMDqGMkZ83JPEh+0j8sbGonoXPGKLmn7AdoV8P42Vdk+KLKaN?=
 =?us-ascii?Q?Hu52Ty0un2MYGe2K3scy7ReuJxgXooFtX/w91HghgBSuvhM00WpPyB0dsQdF?=
 =?us-ascii?Q?RQRm4owc8ycVkZmdkyQV7HI4JXSPrkjl8riV5reKWJj27SPvQ93FBNj1oeor?=
 =?us-ascii?Q?UpBOODB+WHTimvzHZpVhNLpOs9NyfYYp26+IXz2Kaoo4oMZd9q6JQja9dNqL?=
 =?us-ascii?Q?6y+TYNFlmjdADRjnp5LgfOj2rbRX/dy/5ozCB9oYW6YEQzC2chH/i8r3whZ2?=
 =?us-ascii?Q?6B9Lw/PE1ZzOX8KffOI+RAJYof9qh4B7v/5KXU7qfxgm8OZZW+cuyHu+QrtY?=
 =?us-ascii?Q?OnDgBwKUTWjm4LDjV9zWXbDVo+RGWzTJzL6P2oZA0sniApyk/Zl3UuiLX2p4?=
 =?us-ascii?Q?rEEwDlPi0tigTst99ZuQsy3kuP4+JU2zCcaYcvKgGN+gzCDTaonXqSG26Ifr?=
 =?us-ascii?Q?Fq98zqtkLQX27LGL3F5XNjRU4cVg2MXEDMmQEvkuyLO+h6ewV6spV1DChnS+?=
 =?us-ascii?Q?gYz255gLOj9g37/SXvI6DCMYwnKqEPrvvjVhl1FAfSlloGXnwC/Vk1bh8QI+?=
 =?us-ascii?Q?gouwEMQZnc1kV//dG9BLN8ELyL8d9qaGM5+CBDGmhYZam8bd5ZuTUlGkSaVb?=
 =?us-ascii?Q?FEaqslBWqHST2uDexKaK5qFJmO8LBU/aUCGkyGCzyJSNB9An3PuSyIkv3fCl?=
 =?us-ascii?Q?AHbirqzV1DuGIpY0sLB9/YtDlLlYSBt97sr1eVBLfG+U3IoBN+TfRB4HJurs?=
 =?us-ascii?Q?wy051QZdtasbSHOuxpi5/3UVaeEw0HglxlEDgltmRSDI3Ofnouu0bgXhLCBe?=
 =?us-ascii?Q?L1PV6m2Sls1Da0D4z12Wyi+VAl7OFI8c+KEnmyEhBXXJr3uHnGFONpFxPcgW?=
 =?us-ascii?Q?aKqoQNG4XSoP7gCtO0PhcB9g1TBD+5sAqqf93irjRm4+fStVO1ZoaEimNtz7?=
 =?us-ascii?Q?0ZRYc4aARe/q/l2sJ+E80gScHm2IFbWOhaYYVkEKjGKLSfNm766GmSd2A7jZ?=
 =?us-ascii?Q?gPrdOxQaZmBxmHCrRc0qg2u3NWcioRKS0cmTJJ8GPXvXao06rr/hSV8MY5I5?=
 =?us-ascii?Q?TCi85ZkDzFqK1xm6JHiEq9ZhKWEQtZBHWQ3wUGXzUh9oM+PxhG8Llr5Q+6/m?=
 =?us-ascii?Q?Bcu5fkYk4uTDjAQ2M4VqCMKoLAZZgOI2iUEeGPvYTGD5THPx6dspGO+FUxQf?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc472187-0154-4738-c132-08db8d39f59b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 18:07:07.9656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUOrWwlcPdMy7RhDy94u5RrhKEe7yecOhh7cJV4erXjXe9VQhy9bg4gbbOhlHFAAUPx858CsxuSo2DYTa5eFDyjyCId77y07lBS15wL48Cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix MTL+ stolen memory mapping
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

On Tue, Jul 25, 2023 at 10:20:39AM -0700, Matt Roper wrote:
>On Tue, Jul 25, 2023 at 09:43:44AM -0700, Lucas De Marchi wrote:
>> Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
>> mapping"). For stolen on MTL and beyond, the address in the PTE is the
>> offset from DSM base. While at it, update the comments explaining each
>> part of the calculation.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> Untested as stolen in MTL is supposedly to be disabled. Need to find a
>> proper way to test it.
>
>It isn't actually disabled on Xe right now, so we can still test.
>
>This patch by itself isn't quite enough, we also need:
>
>	diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>	index b5bc9233c280..30e43663850c 100644
>	--- a/drivers/gpu/drm/xe/xe_bo.c
>	+++ b/drivers/gpu/drm/xe/xe_bo.c
>	@@ -61,7 +61,8 @@ bool mem_type_is_vram(u32 mem_type)
>	
>	 static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
>	 {
>	-       return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
>	+       return res->mem_type == XE_PL_STOLEN &&
>	+               (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1270);
>	 }

Right, this will ensure that is_vram is actually true when encoding the
pte. so the DM flag is set.  Hopefully nothing assumes
resource_is_stolen_vram() returning true also means the platform has vram.
I will double check and send a v2.

>	
>	 static bool resource_is_vram(struct ttm_resource *res)
>
>With that the framebuffer console starts working properly.
>
>At some point we're also going to need to chop off the top of the stolen region
>since the WOPCM area is reserved.  But that can be a future patch.

will add that as well

thanks
Lucas De Marchi

>
>
>Matt
>
>>
>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index 21ecc734f10a..271b3fba4129 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -94,11 +94,22 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>>
>>  	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>>
>> -	/* check GGMS, should be fixed 0x3 (8MB) */
>> +	/*
>> +	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
>> +	 * GTT size
>> +	 */
>>  	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
>>  		return 0;
>>
>> -	mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
>> +	/*
>> +	 * Graphics >= 1270 uses the offset to the GSMBASE as address in the
>> +	 * PTEs, together with the DM flag being set. Previously there was no
>> +	 * such flag so the address was the io_base.
>> +	 *
>> +	 * DSMBASE = GSMBASE + 8MB
>> +	 */
>> +	mgr->stolen_base = SZ_8M;
>> +	mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
>>
>>  	/* return valid GMS value, -EIO if invalid */
>>  	gms = REG_FIELD_GET(GMS_MASK, ggc);
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
