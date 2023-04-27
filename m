Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9952C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 12:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09C710E24E;
	Thu, 27 Apr 2023 12:44:20 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A571510E24E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682599458; x=1714135458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cKZOxPUpqHCxiyfJIAijr8La+LB8D0MxBfrl8HNucnQ=;
 b=YMLuRPTxVRu//YA5vcWj2MUfjlbsWPfhx38E+VlcTaNbI9MSbjxVoQrf
 7KLJR2unmtckS2Y/2nD4Lo+u1G0isnD3L32TUsxKw3v886ntmXjRWg6WP
 r7JCGgAncxTEIEB4tR+suEG/DVY+5aMTls1YFBv2ZxWuh9JOXEUFeVrc1
 D4VzKBc+VOMRvdR/Ey8DMIZfueVPUEfe7LL/r2adQVCKq2nYmGnjiBghl
 kwl1YRexlHzi9DTU1HU7mNKO6wKi7kbKD4jUzBaRR+yoqTZri6Z9uY/b2
 EcQIECjdjnOKvaWg1nvtiH358SumigY7FuZ5LatrcOCXkZJO4ZWTvB99B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410459330"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="410459330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="697055266"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="697055266"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 27 Apr 2023 05:44:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 05:44:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 05:44:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 05:44:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 05:44:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJRYDThoPlyXzAhcpK0R66mkkZe2HFnnFhEtFgMQCRVO9nxLw50eTeDcZQOtnHqFlD3fi6PM//MfQDSWSDE42SCljZoFwced10O64ACtB7x3o/nnV/ROWvjxHbTZfU6NcDhcKuMUv1ahPo6scwLNYgTtY0xNkkoy3mB4jPVW2EZov2dft6i4JGgGGNLC5a2+Yj7QeJvoDnpJGiW/Ta9Ddgc+sxWjOruaHhfiwec5eYqm8z0WNqCscv7NtbSIuy7adYuSrgkkPcjPLf4WWEVFH31FWJNgjtGwq68JwyUOeKMKx98GBP222eQaPUJYWeKylIerAyTPod8SQQc624pdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYOuuKRLIdNgvAZCvz6sSVWEu8h5xpRpSrDEYtEefug=;
 b=OFgC2FiH/BrtCmdvsVDQqeHdePdY34OAxhcb3mMdWmje+ExI4SN5Gn6OnJ93tcQtTIKtA3r60pW+E5UimGOj9iESad5kLU39Bf1mMChT2ysQ48ZFY/qioudX8eBAYQKFgzdB/HuraAKgHIz0JxLIaKRWqg8sZy8U8gv7VE53KjO1e2aRSqWCMXU0Wz3F594ARqhpqoucU67sHbh/ccWUJsHg3wXXNtpmcICQpNck1VSpv15P7LgLxOqqeIzOhFKEHZG9inNbRLuGUgGFhzIDZmnxZ+nP2OclqGsI2oXIx3ZjhLFngGJibt/RbAjGxyM/NMgdzlEUtxi1TTmI+fRuAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7348.namprd11.prod.outlook.com (2603:10b6:610:14d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 12:44:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 12:44:13 +0000
Date: Thu, 27 Apr 2023 05:44:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <p32usqfzgmhf3hfdyu64pwalvotfl3pmulgdqk7bnh5o3vhus7@kqfxwdfy3ado>
References: <20230427114648.35124-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230427114648.35124-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d2b508-9648-49af-8244-08db471d1adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLIoBZtCMF5mRT9GNf6qNGbzE5U+er4elQr2cTFAYi8XzM46bdNgLVlyTiUYwqPWl7gWeM2UF7BsgmGbGgKVX/9vW7UpLCMoR7M1+wtOfgnTs4vpgLFgR+cqqb/arT0fZ+GbITsPf/vTO88sEFuY9FJfk6E4hmhOw75woKO1pYyVgdjDscjNGvBedFoN6Lh3ewtE4CAIFL+0DIvLPkd8pO2UVUh6URCGz8XtnDQgBREdBCCtqKa/2W5mzlqLODWKFQrbNZ+R2M8A+ykYo6N1IcLW7KQMkslH6oePsrw76cbmYCN49WIXrrqAiYmtxf8unz9u6Z4sdbRcn6D62OWeI0nmmBj8jPPJ6jLBhnWC9DUq/Sfe32kced+v2q1bMDOUR4aVyAH5VS4qSXqp3pp180Cw9hALOKWIg7P0ras0iWuaoZIxajglJRW5JelJV8EHOzur6nuocX/Nrp3DDGDpVng6mVnmUQD2VFKYLTnBRSS0dsLcKv8nnNKJ8loDj9rEM4t5xMjaACo6d5fT8ycfTSGLJ9R9r7C1a0VfY1IlRXcCf1jzBquCI0ZYi2vBFaCW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(83380400001)(186003)(6512007)(26005)(6506007)(86362001)(66476007)(316002)(6916009)(9686003)(66556008)(82960400001)(66946007)(2906002)(4326008)(38100700002)(41300700001)(33716001)(478600001)(5660300002)(6486002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IXYCj0hVyGNutZAIylQuBvC5TEF1MZt+tlrG5ZfSicRoAIn3Ah8vs7oT5g8S?=
 =?us-ascii?Q?jw/R8X2j80Oo6JAfDYpqHxIJ9luY7TWnDuoHn89sBHNPyOMeKI9ftvxAtf4K?=
 =?us-ascii?Q?PFVM2fNqkrMbl25JhjHe+ZzHl5cLWUrgNnxzZ65I5fCdGvsclvXO2l8Cra0P?=
 =?us-ascii?Q?Xkq4MfhZIyfXbskLfguyZYvSakBuIVkfJpB8o3olHnBaQhYrm+OuQhjtXY7m?=
 =?us-ascii?Q?T3VBKHkd6BhBHZ9i6XLIVelYPbY0wxeiGkt17W1CkDczy0wPM8y9bwRmMn9p?=
 =?us-ascii?Q?W3bZWIEOkrQu4tr0OTFvCuLkQaWhZPI70iZiGzt9l7EkfAHVvVDD4oscLtUW?=
 =?us-ascii?Q?6RMR1vTC+D94imkvIroGR/3EkWAm4WmYUfPsd1kgxP7y/9BZKeMwp5HATYYq?=
 =?us-ascii?Q?4kZy7GmdOXsZsEjIB1chwBXhs/VgiGkJKe8ee6ze4ZFe1mn6kCeewLwhy51F?=
 =?us-ascii?Q?dNbgIEak+GEAzNFlqNYWvGGwnJpPQFEWnUkDCdwazpvmNBTjj4t1r9Re5pCE?=
 =?us-ascii?Q?yn9TvdoFW9kH4Eov+g2/iFXLeyqUiRREAKQ8LzLg7CjAO2dYGHVa1u2ViTOs?=
 =?us-ascii?Q?LZirWSU/5B4hf7iNV+eYM+03GIsskgJX6zJlmPQ86ZjhX+RjuihrIO1Etysi?=
 =?us-ascii?Q?CA8v5hh5gTQL+OjVSU3TLepBetocBaRGCfLbuJ0WJe2pLfF5uYvkc+7slD11?=
 =?us-ascii?Q?xVMDDGl4ItH8mkRw0drYeCzXa72WpQlwMrfnPjDU7HlIJtkYeOg1Q36hqHP0?=
 =?us-ascii?Q?xg7ApdZqEKfJ6la0FeZ3whSjKikJB9tZQMG+xRfat0GcUeSY/aJ+YuwPAg4/?=
 =?us-ascii?Q?XSE/IFkpcWEH4oL9GCG+dP2xLWHg/Gxi2VCgHGmrgzgprcj3FoXzn2/ZkiBR?=
 =?us-ascii?Q?2EpCMfOoPeoO8bWwkTjiQNGXb0JefOmNYTsy3v5rBpzygNK2eU69pgNFgVZU?=
 =?us-ascii?Q?eoQ7rydXlZQXI7L8dWpmFuY0Qz5gZdBmwetKKYbjiJ1e3nHNJFQZByDLqnjy?=
 =?us-ascii?Q?eUyAAQM/bkaAHAIH916g/kpxvfVkKlTkCZPzpJ5Z65dK+yXERZstxnMcP17m?=
 =?us-ascii?Q?wzcJxQNfClG10szKk+2Zu2M1PF40bFq/H/5wdEa0nRxUjO64ZRQ7tJ9MdSQO?=
 =?us-ascii?Q?2zokVauv06Ydh+PRDJvW5rtCxUufTzs8dQzPIFqU32yl1md+0jIsZXVrsvU9?=
 =?us-ascii?Q?yi3gn8ewWbsb2z6qJbsQmP/DUnKhrrj68eLQVi66HnU9uCIXVfB0IBkZKfSi?=
 =?us-ascii?Q?WgeHg+beSvTG4FliMmJvtfQIu1SWj/wxvMHg3pnt26wdfSUKkOH8iddsPWaG?=
 =?us-ascii?Q?NJWSmuwtoU/nmHSJybbbGflx3n0QAYJJ3HmVmzcwR3Qg8D5ErAqeHVIDrVbN?=
 =?us-ascii?Q?gv6/Hn+iIKvQTlWAbmPci5GDImdNRLeKTzEvx1DRyI2SFyxDgKQUMow5NT2f?=
 =?us-ascii?Q?z9GbP80tD5R4o7x10C2/swq+X5lEM3ThNKK+BUYN0vHHjKuw7s6On2Pp/Fgx?=
 =?us-ascii?Q?KlBaV5D2N82Zocn3TeZ611YiaysIHSTeYgENDJRkItM2b/isbjQjIC6wqmO8?=
 =?us-ascii?Q?/Kfp7NQk9vZB6q5hu1WkSbjsuSRMNGDqIViO1bYIbnFGux9ehsvXPJU03icV?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d2b508-9648-49af-8244-08db471d1adc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:44:13.6500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbJISbi5zVekmsIoP8NBpPKqHrDVagNOrO7t9AyK+IzesnFv+rSnF+eFsa8iYq1I7z7lBBJr4NPaSslPWtiJgo7C4w4Odfu0pYJcUfU93wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7348
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove extra xe_mmio_read32 from
 xe_mmio_wait32
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 01:46:48PM +0200, Maarten Lankhorst wrote:
>Commit 5a2be6ba6ba0 ("drm/xe: Let's return last value read on
>xe_mmio_wait32.") mentions that we should return the last value read,
>but we never actually return it. This breaks display which depends on
>the value being actually returned where needed.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Fixes: 5a2be6ba6ba0 ("drm/xe: Let's return last value read on xe_mmio_wait32.")


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mmio.h | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index a36c52bc098b..1a32e0f52261 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -85,9 +85,6 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, u32 reg, u32 val, u32 mask,
> 	u32 read;
>
> 	for (;;) {
>-		if ((xe_mmio_read32(gt, reg) & mask) == val)
>-			return 0;
>-
> 		read = xe_mmio_read32(gt, reg);
> 		if ((read & mask) == val) {
> 			ret = 0;
>-- 
>2.37.2
>
