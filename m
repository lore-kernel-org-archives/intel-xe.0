Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B7DD64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6F710E027;
	Fri,  8 Nov 2024 23:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PshXNbiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BDF10E027
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731110156; x=1762646156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BS9UC2YXUz6xy3JGkvnMi0u8oUgkPoBwZJ+e59xDrTw=;
 b=PshXNbiFltta4nhFRHf0N0Kx0wEOa1MBrGttRWDL8NCF0S23VrgqK6z/
 XhhHkhuVlfEWSCKgT6EiqClMG53zoPrjROHAMLxDelbEGy1dAiU0xYXX2
 nj3hnK8DBsJ7CEIvVINX4qA8/kWN2E/mhwS0cG7SZSeEbR5JYouJ7Xkao
 A9PdZnHbBcbO1HYQvLVe1BOMyG/FU8O3fpnrOilSI6hVczFypfvxvI00e
 9vkTjtfk7iEsPfIVSyvOMb1R2XJ/2z2XUGVp3TeHkmamTxwKg+mNqtZGW
 FGqhuPspTpQZDT+Vq8L2LA8N4zbnx7wE+G4H0s0oBzfWxPmQWpw3mdTqW A==;
X-CSE-ConnectionGUID: MJVuPpzATvWfPLTktxyU2Q==
X-CSE-MsgGUID: o8E0zyhLSJezWA/9vHt0xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="56406325"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="56406325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:55:56 -0800
X-CSE-ConnectionGUID: 5oUCx9FrSwaATuz35Vybxg==
X-CSE-MsgGUID: ntOVuskzQHaXNoOP/Xz/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90643168"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:55:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:55:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:55:55 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:55:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmV9OvVrHBTNopXoK3UQwb8MLlxjx8LBrUZyIeIE959rdN6dOicpz1YZJQrG5rS+mNi5Z1OsxVsBAn2fCUnwbzRZi8u18Sg+ZmAMb7EKg7HyFD7Ro11OiKaC44bfP6XwsJ3agVJtvH2ejRHdRmlOFxDSX2+oV/7LJu7OBtN4Br3aGDEFtFHyhDaMsAffWakLnNGhKfCts1ZVECb6H+B2oq8CGYq3z4Zd7WfLRlgn8POuONrZ5j6XA6kuGiFFBNXS342qWj5if4oV4Qn07I9QfXpFRlhJJ6HZ6F1uHl9HLGsaMxdXgyPOOMN4b9nAAif5SSk+HZVShK6L6jesZa/rXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pw08O4mkomOq1dM5E6+OPSY3qXdDvk4urHOwaiVO3DA=;
 b=pSAi47y3WRAFQjXymQYmg8Fz0c2WbfdNCx4taKCsd58GlrPFBlXHt/G+zmhSsd/e0TW/6B1nPZeGHQvNYuUqRn6yPQm1pEJsoX0jaMjIvhToYp8njSjI4IuR8zKcqQkzx0Jia3VGtFDTy85MNBS+Pxtx9+OW90e+incjlbaXf2eZSAK50vg9WTO+P6i3lTRUDFEEepk2bnocFnId7RBpc3ypBUPjI8+AJkVv4Qe9LkgBsYfNzQ/YwvEf73ZM5iggRcUidqjxIo2YkcerspkHktk6WkmMrt/5htVPHnSO6cZj6OxC6OY5rUs31pNOvA4wluODb8b+5xEkEIXGrI4V/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 23:55:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 23:55:52 +0000
Date: Fri, 8 Nov 2024 15:56:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Support crash dump notification from GuC
Message-ID: <Zy6lKMVs/G0ZRbBK@lstrano-desk.jf.intel.com>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
 <20241108212737.2044007-3-John.C.Harrison@Intel.com>
 <Zy6gNqJ4B7urZsj/@lstrano-desk.jf.intel.com>
 <22a9423e-53b0-4541-91eb-f743f0cd3de1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <22a9423e-53b0-4541-91eb-f743f0cd3de1@intel.com>
X-ClientProxiedBy: MW4PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:303:b4::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ef34c1-50e5-4a71-7a76-08dd0050e0a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dl6f7ehhF16hL8eWfmDO7FYWkQG+7eRHU5izXFRKisyttZ/yobrzGWMPJ3ro?=
 =?us-ascii?Q?jFnKGhDJ0t9L9pUaQyGt0KHKbVhAljSVtzuwouTg1PSr0Ax0Z2zglyrn+MmS?=
 =?us-ascii?Q?fFXTiIfq8PEOub3mvPpUfYH7E6/MrlCuDraoZnoWa0fr/N/ZNUx2GM3icm6i?=
 =?us-ascii?Q?9+PCUFl2fDK01BnmsvGRUj3SnNmclbVgPjDsH/PkX45EApTkDZLJiRq/OPkh?=
 =?us-ascii?Q?IajD1qrLddIWxGIW76fnxZybi/AgQCAY3Uci4y9nvRiFdYmryKbi5gm+Z2M8?=
 =?us-ascii?Q?W/Al9UouSVLBO9YQJxRdjecszlI9XaU/K1GPQ52puxm5nJkg4wzHoEtz3ey0?=
 =?us-ascii?Q?bvE+J7tQRNXuDRAT3ROKIOzQ1p6ARA72O7H1DwdidbwpJ8C5QfwmbdOJ2Gyr?=
 =?us-ascii?Q?v9YNO/d+tocAWi1ec7aFako9AJsnW47gqJt7JmuMlsoh9lCS6An8yBgvSd8L?=
 =?us-ascii?Q?ClLJ31/tCT2fhZgrJESHG1EavKDQLVrvmAIaTR8BjH9PDiHu6fO23Wcs6MVX?=
 =?us-ascii?Q?9U1Eu3F808nGSKpc/LSXPKSz05lU4Qklf1md+wnSydyFKWELV9MAQloNtp91?=
 =?us-ascii?Q?fkOpc/iHZXLED9UpdZq6gshKggc1SSGPaHJR/2MFZJjrgFyRwcBvFeTZx+M9?=
 =?us-ascii?Q?uks7t9UQ1GHSqeZCm03XCeoanopqrKGbcuR0O9d3PiBcQZcgyQngJxV0hflM?=
 =?us-ascii?Q?gFgdybp/I1kBE7i4gdPTMkNMOctcsGQ7aSyOLKpvs1ZXWy4pCpSaBIuTS0bG?=
 =?us-ascii?Q?9UX+hne+s/4uitCkAVuTiDwATiuitvxjtHC2DGwSXaEMfHcwDt0/WexO5rej?=
 =?us-ascii?Q?vKAifpBL72K7HE22lG/lgPFkq0+qzaVidXxR2a+U2ngOH6syLBEmRKg0qb3z?=
 =?us-ascii?Q?L5J5g1lSGc7OQespgqZcd5A8cE4N3GyWYlyhDZZn5lkUvOaacSnTZcH0VBCj?=
 =?us-ascii?Q?d/sQmmr3JDs5SLeX9c6wyXxTbvitqj2QaOgd4gYhJq0vpSJV13NDwhG6U+io?=
 =?us-ascii?Q?WuDpibmh+IJZk7cWUU/1noj/qTdBnw9PBTyMOnT6KofksDEClhx3+UFyt0wR?=
 =?us-ascii?Q?ZayKrjvtwcG6xjMGXW1OdSvCK0AvN7ahDKMR0rmzafz7niWkZLT3X4rBjOQ7?=
 =?us-ascii?Q?CMCQkgXAX3q2MkOh4de8mUx245FCL2GbuCECr1sNT0o4cSxvY4ZUYgPJdQ+A?=
 =?us-ascii?Q?GEDWbKU1aEOfq/2TgDA6eDRnmrD2OZ/o2dfRYWh5O3LuzrGIHtxT5oC0gkXf?=
 =?us-ascii?Q?ZuXYG0R+t5nHvn4zIBpG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mAU6n6K/nV4SaU1Zg4PkFw1MMHe0WLNjJASIdYdROfypRizsaCjUvbUbrq06?=
 =?us-ascii?Q?0Q5vDib+RQH5J06cutFPA+Zd3Hem8rvvkZsTt5t3pU65IignoLUPWrYtgkC3?=
 =?us-ascii?Q?hmBvv420y65qOuFsZl5HJ3YIM+hZXEFbRGx67XSvjBE1yhWSQgHDynBpZbXY?=
 =?us-ascii?Q?2ZuH9DXbEYaOKJedXOrKWgnwi9P/FibHbSeh4c7erZ0kYgo3Lux7vyA37idy?=
 =?us-ascii?Q?x2hWevhhYmlbBwqLwPcttJFko3oydbveC2oxhjqxp4DpdKghHXRqP4CpjvJd?=
 =?us-ascii?Q?x0vZ0yEsYedrLgUaE8y+sf5S5wId8xX2ILuk9UZ0aGOguj/Ilf5Vas0V1v2z?=
 =?us-ascii?Q?hIgdPP1wDDKUmfbgzdGuDl6xiE0qXberA6q70HjuT+TyLRWVU/rupVSFQuoZ?=
 =?us-ascii?Q?KPUZVYRlBx4V4wMATH50zGGqzl6SpwCR0PA0PpyrjQrPRTtcZ1fXGStOZ5HO?=
 =?us-ascii?Q?YNSdRtextVCz0PosWB9LXjjABj6X680T5pCl0YyyWOlxAU5kfrYj4KxnsItJ?=
 =?us-ascii?Q?gedHRA5sNyzPzXNeOdFHlEajGrh07WUUwBPHN3e5DGlnItENWMJdEvv7gmE/?=
 =?us-ascii?Q?Gevduq65aTe2DchLGRS4UU42aR+0Z2642j1Iekvbe9iF5n4RjvHcVBolTQZ5?=
 =?us-ascii?Q?3I9kYbnNH0q3YnU/toIiCoFHTiRoct/7UeJ0zl9HnpnI3MEAceP6PRwzw6FH?=
 =?us-ascii?Q?5hU04bdR7rxEO4WXk2X4miIMez17Bu2yo6ztH1aBPMSGDLNz6o5zh/KmrEon?=
 =?us-ascii?Q?tiq24itZLkspBYCQou+J7SVX0YvzP21Siyp8zXmsDdux/3sGlWghXSKByHSZ?=
 =?us-ascii?Q?p6PzFBwtiTM33hLjcp+c1YaoVp0rDIlvRw7S4//NRT0Ve6SeWR36zd+g4uUJ?=
 =?us-ascii?Q?G4hsuMDi+13GoKF6r1BJo8DBS/SFzNKhYfM0x/gx2eES0RXvHKaDenpd/ZXg?=
 =?us-ascii?Q?5MqnRLp2Fa1XrrNrmW50Dow8P7gf9ojtd030i5BZVu5xPrqNb4UPdIoGr7/f?=
 =?us-ascii?Q?/8Kqp+ZiXh7/Q03FP5OX3b3X0TTIf6XITuAKUGhSD5VZ/k8RXAIJo4tXlC/4?=
 =?us-ascii?Q?OMm5Fa7ELG6hTxc3dc1q1z4Ows2BvXhQh10FfFCjQPDD6LSPAGWg9Gcuxrj5?=
 =?us-ascii?Q?rFKrJiFLGWswXfdrDDXIQd6vO7rE7Nlogwbd3SR/mlFlSsGQKZV/pK4tPb8N?=
 =?us-ascii?Q?Jt+StnQyy1M3Wvx57mWXALnVILe/i5Yy7RONQjgmvuto7S7Rs7p6PR6lEmH/?=
 =?us-ascii?Q?6Ms1eljMx8YA4eHaup6xymjYR1It0yXgbr5wbq07kqax5vi6waCXpjH300KP?=
 =?us-ascii?Q?h6lwnAjRZcQUFseJB9b50e2hG+gpbBKTFiIyWHVaOtmFGSHJi1vBvZZLTiH0?=
 =?us-ascii?Q?pqiIg4ILrxyGEwq/S2ukiGFfF8y08+KDdcCZPPIYEA6SbbGxP4IxNMNRXLhh?=
 =?us-ascii?Q?8CoABlBpP+OH/rN8l2irRQ3NgF0UaLZIywYcDSwhXMfzNeDVHTFSoBrivOTr?=
 =?us-ascii?Q?HT3WEnNHsi7WPGJJumENJL8U7dWRwZ02zEZ5nF0Erq7sO25xazcmoAJOm6iZ?=
 =?us-ascii?Q?K9k7MetGWcazOFA2NuqGlqPMIV2DRLCUeECY7yu1mDtKfbyh5Im8qKAc5BGs?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ef34c1-50e5-4a71-7a76-08dd0050e0a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 23:55:52.4568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdIvamtcU43S1samexM4L8YdsoXFL5UGdWngc+GlgXqRAIMCJbbyjiscUusIlsfDSl+vzBemTYI8tKe64jRudw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
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

On Fri, Nov 08, 2024 at 03:51:12PM -0800, John Harrison wrote:
> On 11/8/2024 15:35, Matthew Brost wrote:
> > On Fri, Nov 08, 2024 at 01:27:37PM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > Add support for the two crash dump notifications from GuC. Either one
> > > means GuC is toast, so just capture state trigger a reset.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 63bd91963eb1..7eb175a0b874 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -54,6 +54,7 @@ enum {
> > >   	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x1000 */
> > >   	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x2000 */
> > >   	CT_DEAD_PARSE_G2H_TYPE,			/* 0x4000 */
> > > +	CT_DEAD_CRASH,				/* 0x8000 */
> > >   };
> > >   static void ct_dead_worker_func(struct work_struct *w);
> > > @@ -1120,6 +1121,24 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >   	return 0;
> > >   }
> > > +static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
> > > +{
> > > +	struct xe_gt *gt = ct_to_gt(ct);
> > > +
> > > +	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> > > +		xe_gt_err(gt, "GuC Crash dump notification\n");
> > > +	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
> > > +		xe_gt_err(gt, "GuC Exception notification\n");
> > > +	else
> > > +		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> > > +
> > > +	CT_DEAD(ct, NULL, CRASH);
> > > +
> > > +	kick_reset(ct);
> > Side note, we may want to wire a devcoredump to a GT reset too.
> I have a work-in-progress series to allow creating a devcoredump without a
> scheduler job. I assume that would be a re-requisite to creating one from an
> arbitrary GT reset. Certainly coming in from an async event such as this,
> there is no scheduler job to use. Hoping to post that soon. Should be easy
> enough to connect it to the GT reset then.
> 

We appear to be stepping on each other feet, just posted this one...

https://patchwork.freedesktop.org/series/141110/

I had to code these locally while working on something else so threw
them on the list.

Let me know if I missed anything there or if you want me to hold up
merging as I was planning on merging once CI is clean.

Also agree it is a small rework (don't assume we have a queue) on top of
this to connect this to a GT reset.

Matt

> John.
> 
> > 
> > Anyways this patch LGTM. With that:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >   {
> > >   	struct xe_gt *gt =  ct_to_gt(ct);
> > > @@ -1294,6 +1313,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >   	case GUC_ACTION_GUC2PF_ADVERSE_EVENT:
> > >   		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
> > >   		break;
> > > +	case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
> > > +	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
> > > +		ret = guc_crash_process_msg(ct, action);
> > > +		break;
> > >   	default:
> > >   		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
> > >   	}
> > > -- 
> > > 2.47.0
> > > 
> 
