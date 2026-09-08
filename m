Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97233C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 03:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539D910E536;
	Tue,  8 Sep 2026 03:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLmkYQDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6170D10E536
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 03:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788839746; x=1820375746;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kiDohgOkwP873RWIfUmU3HZs33WN04HUBkq+7VX2kzs=;
 b=HLmkYQDVlo1HxY18MgH3X6ZxmYpk5HCxk2x6jbij8yMi0/mYOlH+Mv7I
 vteZVnsg7i/+ECsFDdbbzIYZ2urFsM62kQdqynLGAzfT2tMkKqPpvaZzY
 THw/OBjUN3kk+cwL+J4MMe3ZbuFM4zBmCua3f//MJyflWVpk+BQA8FwyQ
 Nc57RBe0Ueae3lEFsCzMcZ7aHJ5DWHlFI4eHXoOx+MnuqoMLew7BBgq65
 pCDUMbTtRo4iZdgGBfNaiSgecR8EAM2BSqzIWl8ownraCx7tWN9luLTCK
 SIdChlwKxBhm11ImYVvZ/7S1c6/yTzdBF+6i8E6j6G5GTQHyctmmgxDKn Q==;
X-CSE-ConnectionGUID: 3ls+x2DwSSGgv5BqKz+lDg==
X-CSE-MsgGUID: /ShB8ep8TQe5CbET4sPT3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106603596"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106603596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:55:45 -0700
X-CSE-ConnectionGUID: g5ytO8EGQhSqrPmOKhAMMg==
X-CSE-MsgGUID: fe6zaY//QF+rqGS6qa9Zrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="266524969"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:55:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:55:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 20:55:41 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:55:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDlJ0JywrU7gyCqdpkpqBSDmwKSUsGgmdcZO1gFljjfU2cASUXDCnwwo/+wcIXakbk+djWHHjj0wh/+dKW5oe0GExgLJDLS4N9qBchM+eXpG+fJmAVfehqB/2SZL6r0kSrDUwc3zAFHgeZfll6Lg/MAhKo1+odDu4E8k1fymHtRJj4aPJcbdCIdoXoqUS+mGmv7ufioG0MJiRi+bcnXBuT/3GiDQ6N0Y8PDD9QN6BQ55SEThKssu7eyPSS9cmP3CtFFd9bBaLPXaEya+xHmSPwW/3Wzi9vhMSZFlb7RWQrqg4rO0uq4tpl2QGH1nofs8RuXql+K0mZVD1agT0G+iFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J95k/dPTxY0hxEoFn7B58FHIDOppBFjk9hCvV59RQVg=;
 b=LwRdcYEiimQd1NUJ2WDHKuQU2B/X4P89vbhJjfQ9q+fzxv2bNUnaQdjKl6JrGCZgchYZ2qeqUpj5943W8lsUost8nxJuGgvY7faNfjbQX2xE6Mo0XO+lD5Gek+z5R2NRf0/6qJAP0ucd7f2sqZVbGBitML7CY4g+ZlJnaaXjNQ8tUvlkPDPp5ff8LMRDgXVm12I4aIRNf3uFjWr+eM4CO1r8F1y5BjoDeloLxLay/Ahph/u/jIuMIbM2JsQ82K/2kw78sKaJbUJCOR9XdMuklaFgHaHYi3i0qNsS/OPtH6EFEqsO03Lb3uI4leL3WR6fLXZ5lDlwMTsfYAgm4WbvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 03:55:31 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 03:55:30 +0000
Date: Mon, 7 Sep 2026 20:55:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [V2] drm/xe: Skip clearing purged page-table BOs
Message-ID: <ap+HMbjPp68+Wb+d@gsse-cloud1.jf.intel.com>
References: <20260907153706.888679-2-tejas.upadhyay@intel.com>
 <a081b43b-c4db-4744-8b81-7a87040b573b@intel.com>
 <ee9418ac-38fa-4891-8024-4d4752a406b7@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee9418ac-38fa-4891-8024-4d4752a406b7@intel.com>
X-ClientProxiedBy: MW4PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:303:6a::32) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc9b8e2-637c-44fa-f2ae-08df0d5d06d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BopksURquvleFqsTrBwVTeol11elF0TLR8vBMH+Rq9TTeXDcDyxD0xebwV2FuKnXDbiPNutZyg/n1sUZlkLUnCuHllzIEEHLfxsVwTyBdjxiLVT6Ha1yjIIPXLYWywoiaHVgOAsosQtLaQJRcQ/ecl87w/pmR+WtiPnRZK9VP8e0tCnr3iAaGYjEC1GP9vYwc4EIkUgQAPvPf7XYTZO5H0jUTA4s/iFPDXcq+QYzm4Ushh98WADEG1b/8eYYCZfozI4KcXTMLX6U9byG14Y/Tl7aK6zWcMohhnORs+CwA6URtkkSiLFHLdPM9ONPVUriME0YTrDNB0g9vGR2vfcJVJuTnaisQ7BeFd03AC21Kk8m4aab1bNjofTzVIpg2agOTYE5ltZh7Nvp1yYdMWe3W6xLk/hwNAYLOJ3gpFN9OjNTj8ZiYddqo6nEszqaWp1wPWzLnJgSquconTf1VHfSXUx3M9N0Obf+BNYAMMBTNfn0Zcdb63+aAdzQnhgPCxb56iZsBmL/Cs+ukWLfld9JBhXKVJhe582FLo+vGPEvnpGSgudovphyWIh2B0ysiRe0LwMRnsW+Vd/pkAV6jBO7ElwDJGB7NRcuysYkMZOj5MBDbGZ1iIT/gycS6wlIckkdPNyD1C2vhGUakZgFQ+0c/vXNs+oDZEbSb0GsLc3DVmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Uqga7HCIU3temlmrJ4rflGppC3VGLgKKE45Z3Aydo/eRWS8oVxujswLZys?=
 =?iso-8859-1?Q?XED+3ZdL/PBk5Uok+0E0xtsHoaVegPEjfqALnKGDODooAkC8zzf74uudbs?=
 =?iso-8859-1?Q?Dsnn0KDfx9Ag84JPdLE5Fjn423JfKeACdh/FC1TVJiyiOPUcUb1qnfr7+7?=
 =?iso-8859-1?Q?RUKkZ0krQXd+2kZfJrQFbrO8i2RKTrW7qsW/n3fTLbO3FJZsooWff9cwNW?=
 =?iso-8859-1?Q?5C4BfjgNs5f6cvT7QO3WqWZERHyV3CX6fOJJaWFCBrUeZeJsmJVK52DySs?=
 =?iso-8859-1?Q?8iRpShhez8nckMO7T4atxyIy2sX4AlEKRFIRG4Zpu21pfYOeXJCuAAAxmR?=
 =?iso-8859-1?Q?X3arwN3BVAd2/UuceYhUJRix8V0rWvBYHa3XTehZhJpiQuliDBkdfc8/tI?=
 =?iso-8859-1?Q?waq0/fiPpY43dqGYPZL37njTeAfzDnsyNYPHUsWxKzw7rQHXi2KJDkJcG6?=
 =?iso-8859-1?Q?OKuCr/HTyNy50GnT00MfiKtzasrN9qG1Ls5sNpTsHq+G1Spewnpu1nMPys?=
 =?iso-8859-1?Q?nndOE7VRTMbl3KXudnMIcRHWfyIF/PlhQmwHBbinwTpM/cYJjwfM9oe42C?=
 =?iso-8859-1?Q?qpGvKXdQUdY7I41z7spPRsMEoH0LD6HVEAQVt58EXhVQpXXGkZDp9hbA6K?=
 =?iso-8859-1?Q?JMkbALizFo6nD5uOPkf511ZzkuZESVu6/t5zxVkGJ8Crgl745cOU2+pl3Y?=
 =?iso-8859-1?Q?PV8mXi5uJwNovmRErIWm3vR4x/EsMCsrcDEk3PsnVAIx3rmjdpRC5iuG03?=
 =?iso-8859-1?Q?YYqfRb6KZr2Ff0CPu2Fp5aBfk4E3oNs81LB1GtEFCO/wP7vg5KMaqq0iSE?=
 =?iso-8859-1?Q?UNxImadJpn4/TJVZGa+75YLDleoQw7W6f3ngZJODPH/9r4lC4MvbZQlUCZ?=
 =?iso-8859-1?Q?7e0qseOmGaVeyPon7f3MgEGgZqF6rr4ru70YKgDUpxXmdk6+ieudeJ/FTU?=
 =?iso-8859-1?Q?3Dj64E8XuDK4Vl+V67L3eLJApK8gOS3QYOyrIgKPShW8a6ShuaQlJS+h+2?=
 =?iso-8859-1?Q?Iw9Nyzg5DaUdBVahxwu2nW5HsP4Dprrx2FZyRCgunlVcia3ZITtfRBf1UA?=
 =?iso-8859-1?Q?7ndkQfp1Y4A+0UYjpwT5auIQo/eQo1L01fEX6Kot+/GFzP5212/FAd19HS?=
 =?iso-8859-1?Q?Mhogv+8Ddm8GBeWXunGD7eT+WdJm4LSIb1iHEHzE4bEOP81R9GBky5NNdu?=
 =?iso-8859-1?Q?zKi+SfMqFFjL1ltIHvurBQAR3cR4wdP4EyN9xcLLN4hS2if2BdTtH+sASY?=
 =?iso-8859-1?Q?ljVFVMSZQ1ZJNSack3T/Q/UHVXWbqzy0MFJ6cqHgQj4neLgS3K/kCaZvoI?=
 =?iso-8859-1?Q?G/KCcBVL3aAtH8eILBfHoR3TU2fgBFp6zRbSikl53zgBbAbFcOANKtcL1I?=
 =?iso-8859-1?Q?UX8w4Nw6ayhwAhiLfCwPUEknPb3Zt6aYetfIFT5D8/Do0UFCZKJ5Y1f6KA?=
 =?iso-8859-1?Q?XXb9qRMH24xL8qUdUJrEbHzXxhlv+3xqpUsK/8n62AppDEX9NmQEtDxgt9?=
 =?iso-8859-1?Q?5eRyu+joFL9FuM7qqHR49RKXP04kToOvUOwiZzbU3SFEwaMjW9OG8lOB9j?=
 =?iso-8859-1?Q?u/PCqyOnJ9PQLabsevU1fv37R9c7k39TAgAUn6+8QvR8L7q9qxF2JkFv1i?=
 =?iso-8859-1?Q?YGd+tWkf2qIbSFJLbIrFW4msL3K6em+IprlS/yXmUmB8U8d4D1nf0ARzsg?=
 =?iso-8859-1?Q?gUYZmkbd2KqxzAvU+ESxlDfYPXsS7U6iNz5/cAGlMzpWh9eofefqm/Tmbp?=
 =?iso-8859-1?Q?4QbPXqDNC4Pyp/vEngLXooIMXDx2YkI7tOXzBgMKui8erkBjaCqvGHeyhU?=
 =?iso-8859-1?Q?twMdiSFkySFxWesoqmxYzs4DDpVORD4=3D?=
X-Exchange-RoutingPolicyChecked: m5vRXlkRBWGFmbVmqXvu+gYhCDcnSXdyLM1LQWSgV92bgSMIsU1ZBowEz3sdsRzlapkfaEACTA4lDENm+k/dOINgU7kfNti0bGEQwntDX/6/HuHG6ZGjXJOSIsr22F3aoNfiKvuBfm5MVhoBVsYQ2cZIVGFmydTwH2TZuPvgTVdpsjiAp5xJSvLteuZIQ5eNXCPeq5VUOT1lpBN1NjJoij4f9ains/AtFuqiKAKzb/+MtmZUMT7bW2K1yjuiS4knLkD/5ZB33kXpDoyj1uPaIwnrV0Ce7iU/zDed/BSIJr+T/y7jNtIb2LE44DbKpVgroSSRY2yoGe6rP/MoseHqgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc9b8e2-637c-44fa-f2ae-08df0d5d06d2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 03:55:30.8880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7LEVyVK19UXxFaScxYkePGoFENN8/NS2Haq9WkC9Zu17frFQX+HnUEtaECazJ1IrkfpVYdjKOUQVNakwu2PzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
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

On Tue, Sep 08, 2026 at 09:22:35AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 08-09-2026 00:58, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 07-09-2026 21:07, Tejas Upadhyay wrote:
> > > VRAM page offlining can clear a page-table BO's vmap before VM teardown
> > > calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
> > > writing to the mapping.
> > > 
> > > v2(Sashiko):
> > > - Fix lock ordering
> > > 
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pt.c | 6 ++++--
> > >   drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
> > >   2 files changed, 9 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 5d990c1c3740..a9b9cd7ac2c8 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
> > > struct llist_head *deferred)
> > >    */
> > >   void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
> > >   {
> > > -    struct iosys_map *map = &pt->bo->vmap;
> > > +    struct xe_bo *bo = pt->bo;
> > > -    xe_map_memset(xe, map, 0, 0, SZ_4K);
> > > +    xe_bo_assert_held(bo);
> > > +    if (!xe_bo_is_purged(bo))
> > > +        xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> > >   }
> > >   /**
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 9e71567b27cc..e77ff3cf3ca3 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1876,10 +1876,13 @@ static void xe_vm_close(struct xe_vm *vm)
> > >       bound = drm_dev_enter(&xe->drm, &idx);
> > >       down_write(&vm->lock);
> > > +    xe_vm_lock(vm, false);
> > > +
> > >       if (xe_vm_in_fault_mode(vm))
> > >           xe_svm_notifier_lock(vm);
> > > -
> > >       vm->size = 0;
> > > +    if (xe_vm_in_fault_mode(vm))
> > > +        xe_svm_notifier_unlock(vm);
> > >       if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
> > >           struct xe_tile *tile;
> > > @@ -1901,8 +1904,7 @@ static void xe_vm_close(struct xe_vm *vm)
> > >           }
> > >       }
> > > -    if (xe_vm_in_fault_mode(vm))
> > > -        xe_svm_notifier_unlock(vm);
> > > +    xe_vm_unlock(vm);
> > >       up_write(&vm->lock);
> > 
> > LGTM
> > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Sashiko pointed a valid scenario where the check breaks and could lead to
> NPD.  Please move to iosys_map_is_null check as suggested.
> 

Yes, indeed. Also if it isn't clear we still need the VM dma-resv lock
like in this series even though iosys_map_is_null won't have the needed
lockdep assertions.

Matt 

> > 
> > >       if (bound)
> > 
> 
