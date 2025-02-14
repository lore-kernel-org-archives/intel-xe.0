Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6DFC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 22:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BCD10E0A6;
	Fri, 14 Feb 2025 22:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THY0U1fv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFA110E0A6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739571559; x=1771107559;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lsYotI/ugHN0bpiHVNR+AvQ1oGlszJcwOe5lczj798M=;
 b=THY0U1fvZ+43etxwDO3bQrgtZTyPbiu/2Ng9GSd1gZb6EmTmuPBsY6NV
 1v0msojp/t9Anm7YrzGIb2ifMMz1+yIQgwaNIfGByjs1kUBQphQx96v/R
 pV4063uvZij483q+mBE+Grlcou/OaVqVfIabjDWDNSxKr4sd4Fuh80toV
 bPe/fu8kDjGTE5jTkS9x0X8IQq/JwPHZ+i4D8OD9VdwmweS6OwCqzWxEL
 6WL1hO9wIisuRBoxZWPOrHq9hyszWjeGywRLTmzLPAQ05zYzuAoC/+4wP
 W4LWtmds/mX2iyLdCs1qCm97/bawo+DtWhXJv9hkMOXHfziqHffR+XFbI g==;
X-CSE-ConnectionGUID: d5e1q0BpQjeZbbkNPGM5VQ==
X-CSE-MsgGUID: Ga5IO8tySWSV7DuYolBMRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40603233"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="40603233"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:19:16 -0800
X-CSE-ConnectionGUID: O3gh6fWETVGEyRgXChvPaQ==
X-CSE-MsgGUID: cyKB5clbTaOqQkuXjwGHZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113555138"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 14:19:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 14:19:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 14:19:11 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:19:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/Xz0HdB5EE+dMuidaNcc8ZG30ySZr7sH/lbg/AKQ9x/3YH2KHDHWpMfZvczdMdaWK3HyE6VDzcdVopMnUppVOPqSDvBLLKiP2xDXwQ7SuWzyHX68VjImURbJpDGvfsJbw4DJJ+3aCzP7WWUyhgOJu+gsLiJhgS80icG8jNo1h0mNuhThTfbwrWxcMy3JnLa5t5MiojHXg7SoELaT87If73GhcTwYdJvPm3K1JDVXnOPqI1OO7cL/+q+jZGBGozcJoJIrgij2hRPK9RJO0z03brkE47UGxK5wR1foYKJ5oxKd0W5VEOErwWleqOVK6WVPviKnc9fhjikhSCXS0yfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLIio9ZuSBw7NX7C1kWPGY0Zn8K8XRVb9vrBXqASoZI=;
 b=FoA0f+oYqOW5UxLcny45L1TrlwSIqOyzO8h5yNmTHFyWLTeKNLhu4lX1VJtSlBoNRI4bXbboIQJdtg0ciBWsoSySfxUIDeP+PkWNcqgdHRGR7BIFjxKxNj4bGXzNeqlbxkNjM12dm5h/s6gPq/WLo4VDQMk0ZcgJe1SpeI+97Oz0zAg1VB9UK7V0uotgt9gofKOFdPnLweWYXdVqJhk8CooXA8wVQB2Ez8zO8NG/4PNwnKITADZxouNkXeeXA6HCkLgFqbxiUbSLw8wHtHmE4bTNZy6J0vOsVdlRrDG14NTVQB/ajboQALTgHWR7ViY8XDgWMp7EbzfM9X4aGa5tQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 22:18:36 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 22:18:36 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/9] drm/xe: Switch from xe to devm actions
Thread-Topic: [PATCH 3/9] drm/xe: Switch from xe to devm actions
Thread-Index: AQHbfybMsKccUBQbDkuqyqLHdC0+/bNHVIag
Date: Fri, 14 Feb 2025 22:18:35 +0000
Message-ID: <CH0PR11MB5444B7F1705A86124CD09121E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-4-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4804:EE_
x-ms-office365-filtering-correlation-id: 9582df72-5717-4ad3-1c36-08dd4d458672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?NvEHhFA1+4d9cd0cEZfgMtrxyQxSjmhQoSvTBy8KZaiYu+7HsXTTSyoC2n2s?=
 =?us-ascii?Q?F6WOSjGMumdMMrMWcL4Cd3DO/rtpG2QWZZ5LjfEdgWKn4Rxrh3coA1cePad5?=
 =?us-ascii?Q?ydT+4arBriESzlpoMiiZaCM4vZ1drxDz6Wm9ultULT4rLv09DECUyd4+KNLX?=
 =?us-ascii?Q?xRNLMxSNx5UUdoMx/SoPbtL9nxe88H2D1EfZjG6WUSgidJCIhHTe24i1QlH2?=
 =?us-ascii?Q?teUVZSAdefLNFlVagdpkIX7qvjDUqjPH3TaFE3I7d8OmcpA7obQC/wVxSx/E?=
 =?us-ascii?Q?U5GRhuchPbeLlSV4zAxiRwrwznY8mPu4GQmjuTzEmEVjqAuI97T4ZJXmvmJc?=
 =?us-ascii?Q?cNQhyBuUbdtOtxtFa4ZBu3FI3PuHcwQxiLZ5+7xYkj8Yyg/1vNlABnIzsNNe?=
 =?us-ascii?Q?XkEfYTi4B7VhKs/dmio7+i0zuSxNGpds38ZKhnuUnR0Cr7yWXrcHZOoKkNRc?=
 =?us-ascii?Q?u+JbYNzSeRqzi4frmHV9fU9vmwkiJIZeO3X/4GonD3BQ0c/Tjw7OH/jpfZIh?=
 =?us-ascii?Q?DiBTZz0l3dRTZvAJe/1LOx10JdnX3px4X4ri488ZQbWLJpWdqWLcXYwzIoxa?=
 =?us-ascii?Q?x//ZIzWtyV6vTPBaQNVPpzU2T5BlPki1BgjQEsrBezSM3dDUWcSZk/TGUafv?=
 =?us-ascii?Q?W8NvoiaekKzUgi8c8AAGIh1ZtdTgBL5LcTH/k9IpWOw6iORH/uWuW8v3mI7E?=
 =?us-ascii?Q?kWrmwHl5LL5Q/QXn+Jua91P6zZQG11UBL0S+cpo+ozmbvgwjik8YG02mELpW?=
 =?us-ascii?Q?fsWcoXHPZ71Kg158QozjbFQrxX0HIGEDWdnA7KXq6qyae11rWz/fHoyTRRsc?=
 =?us-ascii?Q?WWI1y5u2aO1ASLiaSWYjiKpR6YxsFBoYRtBbQHdalFgvmqCe7h13F2EBtFM2?=
 =?us-ascii?Q?zAG3B1kJGmlQeDV7nWgF3OdjSlsJXOjW/PBTFWrCK9oXNaIa9LSbuqdlZx1l?=
 =?us-ascii?Q?s9uuVTgSSXkcG2ceB5OR4bvW5hQQXRIIotrZ2cZmAvCWCWb4vDOR1Kny3cwG?=
 =?us-ascii?Q?ssNxnBUJ79JAG5dNlA3AQJGFBgMqs5SAw4xVB2DyY4oNOwPO+FUgS9O+cutE?=
 =?us-ascii?Q?JK9pHXwz1apslfpqF8wsEUQ2aFg9a2iipE8PRI2boD322sZGOuKXuW/AfDkH?=
 =?us-ascii?Q?KGOTSrsJ37HKubobi5TI8ToAgsoaysAHxEpSRSlBxbGNITsHD6yuTs5TzBdi?=
 =?us-ascii?Q?C4FXr49/55bZmGouCdZFnG5BFOxpEF1B0hGGV9RKGujJ+3Gk+pfyJNK+5Aht?=
 =?us-ascii?Q?PZ+QIjQU7wbCGnGChJjxVINRqFeW84Na9yPm3HIEo8mZLAla+DA/cki7fCG7?=
 =?us-ascii?Q?ZYv9aVIWC1iqlgnCOexsEyYSP6Yp+rlDZAWYqZqW6mfwvHVqnc8UOKQ0vsXW?=
 =?us-ascii?Q?htxtwh0X46jmdys3XPbOuHTmp2PYEX4Y1AO9FTMhcaEU01uqqm/FgOGVe51Z?=
 =?us-ascii?Q?HqaQXbzZ2b5/KhSLa0V+0eeJe2M65yml?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yYNIDUF0QCDEu3PjVITfbxLsCPXFl3vVKDYxUws3Z1Ve/FM95NeMMI7+bwRz?=
 =?us-ascii?Q?2AEFmM91jt2FRqrtFgBUaQT704zPRPdp/L70nLk8M1/6sv9z1pZaSnpA6M9B?=
 =?us-ascii?Q?ojJ5RfKup4q5IplS/lVSlhdnKOjKqZc9WsdQvJQGFzil2Rw/XOcWqEA79v1N?=
 =?us-ascii?Q?J53ZG3YvXfbFhxeIg98euy1ybEQCGZt7chJO3cWoWucCQRXu2x1CpcS/V8KA?=
 =?us-ascii?Q?New1rD7Q9oAU+OwCABFGstQuKKY4PzH/0Hy4UEEnVvGzkuCVmf9+Ajqia8ct?=
 =?us-ascii?Q?b2ny2nFkku+Ah7hnRpPK1ux91m0KnEVkhuYpLG5sqm1uODGd/bPsxp7MSkdm?=
 =?us-ascii?Q?ZtvVOMqk+kW6qTePRYGRbXASGdYXyrWhHgTtFxHOh9MtCf3JX8jFJiQvXMPm?=
 =?us-ascii?Q?+mMDV85N6QQgKc7Ryl9a+FYFTdVAcDdpiEwlHQFry+W0NLxZVn2xv5pzPOBU?=
 =?us-ascii?Q?3JBHcutBrTgoh9FEerWHXt2QKGY06e/nTPRLJ2i1VGP/O8nVtrcQZoCvi5wV?=
 =?us-ascii?Q?NLcX53D7LADx4x+85+4CTs3B6j0A3D35ZxpAFprtgWjkdkbjTn5FdYpYVFlb?=
 =?us-ascii?Q?23Oq+CP0vkJsKpqu94ZQXMbrlOwufaR4akAggq4doOddmu13tfRiUK73tUbg?=
 =?us-ascii?Q?DjvIU1jd+iH1w7+Zu+4EbBEUCEG9co2f11VKr+/asa04wUOO6peRhMDmiJ1o?=
 =?us-ascii?Q?odduef67ApaRQ46ltC/IOplbROH4sCNnSYrWA7k2rOmEdlfDpxUu1adwimag?=
 =?us-ascii?Q?fPzyHmYQ6k75dRrlOTxjq1J5yfEbMlfWX3O71iDzJSXa0ih7r3puBLBqL6I8?=
 =?us-ascii?Q?BHHtvAUIQtfNPRo6A4bHywHuXMQjeo3qAdW4Cs172u8NF0Wp9pQkQSthZMya?=
 =?us-ascii?Q?BGf1SCpA61AcuAiYu2Fp4udMJ2LMOR85d631YNh+D2OcqRp3gHIr4mP46gS+?=
 =?us-ascii?Q?UKoigRrdYpKU2VHwwEqLS+KJEsj9PMiNILCvgAsUjHO6rqD8Y/mFolc1IDZj?=
 =?us-ascii?Q?TER7PpVVAcQcwm7PZi4m/XOR1fk6YWChn7grJeW54jjkOizaZReLv4VkZ+xp?=
 =?us-ascii?Q?d6HaXkypfPlRe3TU2tzwhts2la0BE86tXZkrEmmwBSnDttIUNOlAM0RWfCvI?=
 =?us-ascii?Q?KsAJ6QjAZO97V98F8YOomC2MgDEYmPqdVSUBCyo/C8hJPby0BxkoVsa3rSmy?=
 =?us-ascii?Q?u/GZ9H0tAxqAy7UPCMxIPfdHdDx7X3wf/WU6YTWpLtBYYkn01p2E1HLaozg3?=
 =?us-ascii?Q?/qbf5ST1myIdr3Ts+qKYWhjBZwkvDOb1SdxG+Y9EthKcHk19XSWRWl9i6gD7?=
 =?us-ascii?Q?tQteCSwLhAeDAMHmwEsR6/FVXPH0tuqpuLFOkd9PFaI98h+/qiGEUZ3VE2by?=
 =?us-ascii?Q?Q5T2TOALwINQWdbnFD2+YuNr1hTHE5XCDhhAT/XhJvQ/0XT3eHKZ3nnrGGBe?=
 =?us-ascii?Q?Uz8dDeMG837zwGPYw32PLNr5oNQtRqaVVvC7L7+8kHZsS+5k/aS5AzAtLt7r?=
 =?us-ascii?Q?bs+E4mYa9wTsCYcmoKsEqt0ApeFgTinjkGe5WkX//0znb8ghUtl7W9LDLJ2V?=
 =?us-ascii?Q?21LoerKX2baVTBypf0JBtuP/ffVTuee9O8fyaZX0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9582df72-5717-4ad3-1c36-08dd4d458672
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 22:18:35.9873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOQ1y3DPNHciRKZqcdLj+h+0NtF7AqMN2EfLZd0qMntZTYeC9+wUIBn3UCgfiGSCPCkbXi7Q6WFSZfCxIaBdvQQ/Nddq7K2K1SSNpCu67RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Friday, February 14, 2025 1:23 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH 3/9] drm/xe: Switch from xe to devm actions
>=20
> Now that component drivers are compatible with devm, switch to using it
> instead of our own.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks good to me, though since we removed all calls to
xe_device_add_action_or_reset in this patch, we may want
to consider removing the declaration here (I.E. take the
removal from patch 4 and do it here).  Alternatively, we
should probably just squash this with patch 4 in this series.

But besides that:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index f2064cfb55cf2..5ad2c99a9ae74 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -184,7 +184,7 @@ int xe_display_init(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> -	return xe_device_add_action_or_reset(xe, xe_display_fini, xe);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
>  }
> =20
>  void xe_display_register(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gs=
c_proxy.c
> index 31c90577faf0b..8cf70b228ff3b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -490,7 +490,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
> =20
>  	gsc->proxy.component_added =3D true;
> =20
> -	return xe_device_add_action_or_reset(xe, xe_gsc_proxy_remove, gsc);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_remove, gsc);
>  }
> =20
>  /**
> --=20
> 2.48.1
>=20
>=20
