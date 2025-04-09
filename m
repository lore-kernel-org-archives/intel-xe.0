Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C41CC369A2
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 23:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23F810E295;
	Wed,  9 Apr 2025 23:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMHZ1nI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3539E10E295
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 23:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744240561; x=1775776561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LXgzJ0wgeT6fzwmnOggQxnFu0H1PYLwL5uOz/c0YhCU=;
 b=CMHZ1nI1qrpNxa0atQgYnQnxPNQ+0EgJtGwG2PMIo6nYEjFhyiRkbt+9
 osIp5DOkOnzXWqceXrGePN6hVj8A7Tnck7EuIl+H8AMUaqkat9Lt6ksbV
 kjEjkuXTSqxrZvg7g2FVQtIRJxFMrU0LWxfBZXpfl4j1ZaGBrT1iXEy5Z
 J5GEnUSbD4wUS3DvI7YaG7tbioATQ7dFGIBsKutgzcQgXHtNuuLwGyJ3y
 1mj+5h077HAOrF8B0xVydjenC8nIT/nT61cdxMPjtsn4ykPYoMPD7N4E5
 aIWO3sieKmjG5QimLEOMOdvq5x1AbrdYMrBLDOmtdRsygzvlE/W1tK9Uc A==;
X-CSE-ConnectionGUID: aTGGXWIjQS6xMFHDtpskaA==
X-CSE-MsgGUID: E/VZSWtCQxmW+C0rcGJuDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45631733"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="45631733"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 16:16:01 -0700
X-CSE-ConnectionGUID: F1h3RS/jSCGn1SZYaH0o9Q==
X-CSE-MsgGUID: 1epTwJ6iTKGAV1ljnthsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="128686070"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 16:16:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 16:16:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 16:16:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 16:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8ndaXYo81YJ448M4VLC1yoIyv1cz+Z4R6mBW70PksbKfBIClWpy4tIgY/DyyAV5aJxLeIo0QPpTY17FBbt3gsGzcCQTkeQtBE7rwVLp8KYQzn55GCbbzlV+X7q7aPtOFMu3UkXvquXs+xmTFjE+AyRsYW1YHUejZ7/dt2S2XENDj9TcodeLxLyXBVD7JFypN4Qt/QgoOT6OcXMOOQmCuvacuAECTyneHDNOvhHooB9FmUZeA+/m7Frj5eCWEVgkhHTzQx9D7jgirHw46MJGg6MTkRsYE1t7Du0ykTQrYBV7KyN6sacRGHj2WlsQ2DHhCAmkX63pB7nDnfHiwZKh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+S+iDkTiJXFHzvecU/Zqk+ZhPAU7Vf1yLmna7ZT6Mg=;
 b=pZ+E7U/TN18PDqF1g2uIc0o9Dh5MFZr5w4DrGAqpOsn21TNnqAQgRpsqpNoQJWKq1MKqrjBwcPu5ZL/Sjh3w7qC4BGB0nllTb5b6d/643H+u2vi6dXQmRAfYRwFVGV7Hx75KrF7uq6UE1nYYosgMsyE2nn0QV/dNZYUPH76FMcEodYObnKXYf/qr8FdA5lP6S5AU4FLwClXjQex85Pt2ELaeuh7aakVLhhlk4I7x9LZkVCFUVu+HzWCjthWithHUzIS9oyoNO46m0C+FGfSBl70/tlT2Al0dCjCPYi4axlWSnv5mu4DLw9BqaGLXVl8Fb4HgLT/v+AVt0ZnSDlarPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 23:15:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 23:15:56 +0000
Date: Wed, 9 Apr 2025 16:15:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5] drm/xe: remove unused LE_COS
Message-ID: <20250409231553.GA5080@mdroper-desk1.amr.corp.intel.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
 <20250405171539.599850-1-shuicheng.lin@intel.com>
 <DM4PR11MB545698951D6422604F91D9B7EAB42@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB545698951D6422604F91D9B7EAB42@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW5PR11MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 183c552e-54c8-4446-b112-08dd77bc7b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ppj/65pOZ56SRtows+BULKQ8jFS3STkZjSjmK4he4H9IwReXB6UMrvOAc0Rv?=
 =?us-ascii?Q?nXgIPwFl94Ecd6r4GPIj50MOZwRdvy8YaVZFprojS/wnFrfr8yZUwAmDG8Hm?=
 =?us-ascii?Q?krDHOh1ScizJAgHhKYusD4lrJSPoRaiaT8UWXxyEPZppDtWnPT29wbr0xUMy?=
 =?us-ascii?Q?SwCh94tCsR+xyqwyJaQIKZDsBOGi2XZfOF4phj2WvYEXJvXgUqLSaaewde1C?=
 =?us-ascii?Q?e/ECjyWNAvjycCbQ3phfYDHX+2Oj2mor22FNulq3Y0Htt5lBOjC1n3iE9dHx?=
 =?us-ascii?Q?93TXEXVBfkmzyPEGrhwV1joSElDkfprNOzmCkaZ/OaE7Ka6MM0rR88vdgXvn?=
 =?us-ascii?Q?5bkpF8g9heeZN/9+4hFk+4T3Q5TgAoJRE3AvA7yRBTEL/760vnwV0V28CXLz?=
 =?us-ascii?Q?wTk55oOLmLqh8XKmMawFquNvWNlJn0U1mmj1jQZ3RvtQbxjEnpSCgGdc6ugB?=
 =?us-ascii?Q?kEgrlhaJB2NWRGYMTyp+A7r+0xKK14J3NSadtK8J/vtUxoGlqyV0m1e//508?=
 =?us-ascii?Q?NMJSqIbwc6jtM95dfc2myrsBoKfb8UUvJJDCFHJAa1kPYMZMOTVV8h6MOgz2?=
 =?us-ascii?Q?lUGBC46ZzPVPgEStPDO/Nne68VOjtqxaoOyuW46tG/s1hVcdRcU88zTxt4dG?=
 =?us-ascii?Q?4nqLs3Ucls38H4ch2iCg+6YZ3X16WohWs4fPCw0uIUOBS+PHg1ACrZJXjGyf?=
 =?us-ascii?Q?ouNq6V9Q+F0xLKf/1RI87QFZysI/bYWqP5aYfxBQSZbLEa+76FVA/fwfMjIq?=
 =?us-ascii?Q?vM9RCppJ3GJwg8YDK1WEMujjvTVsOGNkEMcflo9s3G1RP1xWc1b53r2ObDqY?=
 =?us-ascii?Q?fcFGrGCYKEumGx86nWJd/UlCDc1khxyAMUqS2pgCOMP5Ua8X9kC2l0KFqJzI?=
 =?us-ascii?Q?TZo2Xqh3xHMLMJR/weH3dVw5/IVqKKYHlnfJnirRZoZtpMZ+j2839h1NWgmP?=
 =?us-ascii?Q?/j0VoTf6Y2WAuFrzk/zXbjRhDygl/nicOwzpKTe8gzsLk1uJJ/vxXAt62TKX?=
 =?us-ascii?Q?ySPVebzEsrXnuzPlZEFDP7NFnncwEEC/XkRvuiyKBB6GK0ispDtk6Xt0w7Qk?=
 =?us-ascii?Q?JZU/p4buAQJOv/QBgxeD+i9GcfpAgPh5hdkpJ2Y3ecaHaO2TDrmhXMxcQOUp?=
 =?us-ascii?Q?ocR0EtxthmtXOnxrUFiYoHfLqmiCMq9nVTD8XQFIrAJyL/VGvtEmH6Y912r2?=
 =?us-ascii?Q?8ij7wM0cTCOyuLE0yLNNNrx0qun5muDqCsVsscb4OWN2b04ryuw22ZfcLfe7?=
 =?us-ascii?Q?kwzUjp0iO1HrxuqCxJ9xgMgrRXWn5NbsjH6b3dVyKjP4t2xagDGGfzLuqtiD?=
 =?us-ascii?Q?tJT+A+uAxAeQ16ZibJExb3AB6xe121tSxSJicTCkT4qvbZJ9wEes+Pv9rR0P?=
 =?us-ascii?Q?EntBdldKugqcuSRTZ6Dbyhhg3G1K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vm8ihWDs9iCqB9TQaygEK+Xl5Hd8poKKPtLYUMcQhT6AcmbadLtUvfb1BMpg?=
 =?us-ascii?Q?lrGyNHOUu9fVc4QfacKceS9fdXmy0fOsfVq4VUWJRz0TDmcGXT/IjJBv5a1u?=
 =?us-ascii?Q?N78jBglhYSr3Y4Ltf8qiMVij0N9JMVuDTws+5a0OBbSBca0bHUKkwCZt90iJ?=
 =?us-ascii?Q?j+EsyAe05v9K+yRCWfLSu2L0hyFbfT5JiuffELTI8/0aPvKRk7tbRwHnnZUd?=
 =?us-ascii?Q?PSJWvhHlTUlRXwxfx4MPeDe9cIKoad9PYeaPKdxgRTF0ufVHP99eFXexxp+P?=
 =?us-ascii?Q?Y4N3SxLLmlyWQSaOkuH5Y0BmUs134iCs6k9/88sWbuAAzAnAdkePA3af0IGW?=
 =?us-ascii?Q?kG4jg5O5p2yrTEX8J0IY9mIHkIWMgzZcc5tI+P75LMqM7O+lD0gFVbS29ikR?=
 =?us-ascii?Q?bQ5fVpQHaZH9jlFofUt9kTx95Et8A1zdFAWrb1Lp26PpB3RTt12z5ZRnNoMH?=
 =?us-ascii?Q?7OIp0eu/OvvmfIv8Sh8OzR6RmYPn9efLw1ooXJ3FauvGhYo1HEdesapr54Lc?=
 =?us-ascii?Q?kJhbvvYrbwsIp2NR/BVrK/ehM3UkKAnDBd8TfLhzSXvFBmyZ5b3rybhN+rjL?=
 =?us-ascii?Q?g8MAncYR+mexuOouqFke/tPdfk0ffgs7UaXb5o/TU31bQdW+c7KVSKOGb5fL?=
 =?us-ascii?Q?g5FgCx+oiRLEk4f0xFOTr5VszV/vDIEw2VVueet3A0fj9ze18dlYEu8n0iFl?=
 =?us-ascii?Q?XyrbC2D+LTRGGMvv5DIFG+dtbuqbLpqgpAJnsMiUSl/QSEnIJny8KyO8D1h/?=
 =?us-ascii?Q?TjfyXzH0uKsH+E2ouhVVcRvoEKJVWVv3paBJw9nYxfpHM76XDVoSEtKrzaUS?=
 =?us-ascii?Q?K7a5Z5IHsKHUc649VvKckdxzwi7O8pf+h9Cit4Bxmp6IvflI5adYnm9XUKHT?=
 =?us-ascii?Q?cfBHdI/S/QPM2nresX2t0NbQKDAtxqSuG0owK6+OJ/p6iO5+Hdhu/dnSOHpQ?=
 =?us-ascii?Q?3wTORcsQhBYVuyopp7GAqUQh3TPigJ+WxyQDLYAYpNdmkLcxftdPvz05Ra2P?=
 =?us-ascii?Q?anAUL+7L3vj5Sn6SSdtcTmuVNjXgIuQtmShkVo/pa7EAdX5UoJ/W+0//J2on?=
 =?us-ascii?Q?S//YP685mG1A5Bt6FpyqEDZofStMf7GFUcUIubt6r6ZV97Zb5H7sg0ntwvfL?=
 =?us-ascii?Q?Rj7JlITsK2KwzC/OS+ijHFey7LAt7b/DHHWJr5EZj+18+mPdr2g0Qia8UooM?=
 =?us-ascii?Q?4ocK5mdQ+atVhPET00b2XbzK2MOkRxUrA/d3qpdJjuTTd0gX6ge0E6wlMPuI?=
 =?us-ascii?Q?s6yTCxf3glgKKUhLHCD01ElMnOp+H9n2aW2u/txYIwwShe6hN3KQEu7aZQYX?=
 =?us-ascii?Q?8j/a4SP/fODZeGROFaqwz5sWtqi1BNgEh5ekH6MZlosUGHwoLs5VBwjdEumB?=
 =?us-ascii?Q?QJ99O+20bplbOZoW5+Yrvxrd58bmJXKpkDWLB6X+vaLJ3LhWYGj9dcuX/o6W?=
 =?us-ascii?Q?rt9i2lMAZXBIuyvSMWmPSTm8iDcuP5BxtkFKq/p/BXAmarmrIPlGzluUMq1x?=
 =?us-ascii?Q?IZoDBri7nn9p6tq2PxTBBLSCoQGrufCfCGYbeHLm40ShZYcBrgw3G7UBxtQC?=
 =?us-ascii?Q?rizYfm9tORCFe1amgt6BdSXuNuiQG7mwhLST1uALJSvmAreCq4klnhuxdxYA?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 183c552e-54c8-4446-b112-08dd77bc7b2a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 23:15:56.2414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pII/PciwqyGAQN/7jjBMYx8KQu5/QaO1Ykzj2Rn6AA/FGErMHUSa6Pi05sMxH5VWZ9g4ObL44l6KNBoHu8DyEusY9/fK27CHiJZqu2aeGkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
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

On Wed, Apr 09, 2025 at 03:22:02PM -0700, Lin, Shuicheng wrote:
> Hi maintainers,
> Could you please help merge it?

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
> Best Regards
> Shuicheng
> 
> On Sat, April 5, 2025 10:16 AM, Lin, Shuicheng wrote:
> > The LE_COS definition missed passing the value parameter to
> > REG_FIELD_PREP. This didn't cause build errors because the entire macro was
> > unused.
> > The value for this field is universally "0" for every MOCS entry on the old Xe_LP
> > platforms, and the whole field has been removed from Xe_HP onward. Just
> > delete the line so that we don't have an unused definition.
> > 
> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 58f4218c2569..cbb9f7cbcfc0 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -62,7 +62,6 @@
> >  #define   LE_SSE_MASK				REG_GENMASK(18, 17)
> >  #define   LE_SSE(value)
> > 	REG_FIELD_PREP(LE_SSE_MASK, value)
> >  #define   LE_COS_MASK				REG_GENMASK(16,
> > 15)
> > -#define   LE_COS(value)
> > 	REG_FIELD_PREP(LE_COS_MASK)
> >  #define   LE_SCF_MASK				REG_BIT(14)
> >  #define   LE_SCF(value)
> > 	REG_FIELD_PREP(LE_SCF_MASK, value)
> >  #define   LE_PFM_MASK				REG_GENMASK(13,
> > 11)
> > --
> > 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
