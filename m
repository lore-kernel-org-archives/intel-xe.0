Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12450C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 18:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3F910E5EF;
	Tue,  5 Dec 2023 18:14:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B1310E5EF
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701800062; x=1733336062;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/NRIdFqHDg5tT1HtTzwg8qrzr+x3UjdkmlU71Qb0WVc=;
 b=i3Jv2j5NkB+SQeEqDtRBfPh/IH0Nxfvyn9Y4Pxxv7r+vY2gnye1Z9O57
 HHck/TExzSH+s1fWr5XvblDBf7RYRd5KKx4kzhbgPTUm1z5lu/GfIGGhp
 ApPl9bKIFYQbcjOGmZmlcYmuB9jiMXYF9YCp65seitbtybmn6ZdhLchDa
 /S2sx/Ukb+Ue1ubzNhWYyMzJixR7m17dB8ex/fbgGGxjl/0Ox7KG0IHn0
 BXUhrPcGv0CreiOixrmAvRgYG0FqLprCJ+QIWg24FPcvYXp0n2BtEIMKt
 2Vmbk+X1427A4ZRiIlMN8bN0ftPDiV4RgwzbrQjDdAWySoKvSWf36I8lK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="993164"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="993164"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 10:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764419499"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="764419499"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 10:14:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 10:14:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 10:14:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 10:14:20 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 10:14:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx5qTBImoQxGVg5uFgWWNTpdOehuicb7LOxY6MKhCGNOH0K2BkxRbk4kery/8BXvZUrMKJ2Zb+XDDGBqrRUD8HRXLGjlNP3LdxmBgmwAZS4FU8alN/v3XURW5AH8s7wb+Zfu5fZGKvpE32K80yjSgDBuUobJVXbuKqtUbsSwOwffuonG/jwwiMjfqSQp/BeTSBXmbwRpTu8uP2k4dvtRFWVslpetyYIjS5E/NRg3f1/k34Pxku8o2tNUgGCxtOVpHqH7JvAQRPrJIKOstKDbgovxZJmiqPyOYg9pVMJ+9px293Iy4dQq+CMF49UmEeA693hr7+kR5BukcDZ2emuTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyP/13Z3OM63hZ8TVUo3VqcwHy0FNSkl0n3L8NezAos=;
 b=hV7wa6zL7AXyDPWSe35zYNR/5br6+u1mn+0XkiueY8UMd7U85f3GXkHUz0ywCHvfdWXk86QOGkbRf7+DIf6jTyMQVSOpF7KzAmpoR0d82BJVrQfiOwndPCngygotfgmOVBwsW41xKFgBEbe1JabIghQk6JZCQuzL9SbGQyo8wPh/66wOG0F99X9skuKg9h2u6zBWijMn59JJhAipidNI1xUjRYy3bZp/ESIgMdjJOXNo0FXn7apjeNT6+fnSCk9yQZcieFM0AkTqwiraAcA7INULafgbenzE8sflFXuZVyfvNt3prprVtR2EroX+ZIew+5phO8Do8GAfv+M9xENbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 18:14:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 18:14:17 +0000
Date: Tue, 5 Dec 2023 10:14:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231205181415.GJ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231205155820.2133813-1-lucas.demarchi@intel.com>
 <20231205172803.GV5757@mdroper-desk1.amr.corp.intel.com>
 <ekkvdie6ymvosnnijgjgivz7jta6jykcgbtbwwfy4qt5uphqxq@ur7a2hakv3ns>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ekkvdie6ymvosnnijgjgivz7jta6jykcgbtbwwfy4qt5uphqxq@ur7a2hakv3ns>
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e830a2-9e0b-47a3-aa9e-08dbf5bdfebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +PaQRLZfWNuVdo/iYUktgzA0wCwGownD+OZRFfewxG9lbZkCjSdxTdBv+DHo7qoprj9zLsW72zK/uxdsQTo4dPXU04gay6GkhkDIflH9KYhAjgV8CBx7O/pI1Hrd0hLTq2abVrkQFWycW5CL5HQKYYUQXbC91d2xMt+ca8N3tTalqKPZI3NCP5s6T06x2T5MRfrcT1OL4KVUSjoLkcLQnpUIdiuQru0HL5lx9HxI45CemtMRN/8H2lZJJB5xhzfBTfe2HUozO9iypDoVFJdnt9P+7MirzzaLYZPdPy64La5CTnzDfQAEyUxSCxxVFAY8jqamQ1/rAINiw6Y8E3LOilJVqoLRvoiDz8eIzOkA15mIePA7x7OZfTVl5VjYS9gCYS/JOLvZQFrufvRPMDCCSRwdpn8/iwlyb/74gctYuOl+oRYiW+dYqEwr1Tn5bOfkRDKeUiPuG2GlAjK61PNPzKepqs2YntmKcsx7yoB8Ljs2O9kKCa4unZN2W4lVLMrJdRIR3xlMm8AacFcDDXtK4xELo8nhP6jLM5EDMKY8SwOMC/GSv+VqQmKQ0GAg5dZj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2906002)(33656002)(316002)(66556008)(6636002)(66476007)(8676002)(86362001)(66946007)(41300700001)(8936002)(4326008)(6862004)(5660300002)(38100700002)(82960400001)(6486002)(83380400001)(478600001)(26005)(1076003)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?09dqz6dXUwSJjDlk35REz1rbeGK+OKErJ8ApWpnfke+UBjC9SHOMU7F0VfYw?=
 =?us-ascii?Q?LNgfGmCxZQGBqHLll63Fr/45pFMc4zmW97vz52pasRHcW/4l/bL0QaT3PZgW?=
 =?us-ascii?Q?dQpAh2Qs+3MBjs+i+RHrtxsYb+J/ld4CqYPxKvaqEAmDFUaaZI/xv4/77tAi?=
 =?us-ascii?Q?AlA5E+BXVcdk31lyaor2MDdkbUjc5N2AbDQrjavTTwiOqkYjBDEqtNL/PHJr?=
 =?us-ascii?Q?7pK2zDAu5DUORjBBfzVikX5QW/wylXBx40HoZj0/OMlyV7GFOoxiy3r+Wb1e?=
 =?us-ascii?Q?G0AHyB4ChJYfjEAjj6zUKej5KigHLC99i44/mEZPKeO4OW9kxBc5dNfgk0Pv?=
 =?us-ascii?Q?m+3gj6W1brwtovvkDee2HNzLeZL5UpUJ4gk9lXx9BvF+6/iGOFUq3THJMTDY?=
 =?us-ascii?Q?mr2Ced61w5T6gi6/wB9ie95LLKjOw1d05zom8YxsqfU4PTBQeU4yaehxtfJX?=
 =?us-ascii?Q?gNCWdifjqYT7bJpem3YhGdo47hIPUocG0hQVrWh7M4hYCff5PjcEEw6jHqoX?=
 =?us-ascii?Q?1SOk3mMhF/tmqeUGkl5KTlstsEa56JT2UeIXEHwAu2IVBCc+8dwy/Qal6Scb?=
 =?us-ascii?Q?ZKgqkelyxZluRhCd2fOCWVsEGS/2q/JGsDfTPke9LUJMd5gX0Vw8NOT8g+JQ?=
 =?us-ascii?Q?kBv6AKVH7nNhJNifJwNjFJSmbORs0YtLLWX4/NzseAqUUAKc/adnEFAbPJ24?=
 =?us-ascii?Q?fmgekUsGRfSpVZlVZ3SP93szUcvKP2/rcu/fSvYKd4yiG2k1lYZe2ybK/Lx4?=
 =?us-ascii?Q?n640fbSbToBoj/x1q9Bn/fSCfYCd0iKB6oZ+WE2lNc/ejWtF92d4TrdTTumE?=
 =?us-ascii?Q?PKBJ/VMwpEdeUnbqamDuOpaOKatzEHr0x/f/VP6l/Dfld6rGrUufHmFO00g2?=
 =?us-ascii?Q?EcbZ7pCePCdTgRjhT1uQbVL+pakEkiS4I6UKnPvSM3fPLIjNEwqmtkcR21ZR?=
 =?us-ascii?Q?ut+NyUxnkBskb5XJZmLsXg5y1g3YWxyTrawhrYkhjhC2HbzkMN2cLOjbchFc?=
 =?us-ascii?Q?2DYUN3FRacw5l/vjWgEFaM7KKP9OgwzWEfFYORUoWv+68H04iPtbv/KUUYy1?=
 =?us-ascii?Q?bVtT2i5k/TMAFbS1ciJ2yvLBhejSdJi6pM2Yr9eKoSZqrRDjUdaQ/xikznBu?=
 =?us-ascii?Q?AQI56TUPkZ4kW6xCY4aehCEEH0zjARvnhgLvEY1aNuBGKvNT4CH+nJ02DJ/b?=
 =?us-ascii?Q?UHWRJ7zcdcmfV0y199Uz0N4y000JlZTcdLaraZknaAl7ZZz9ngEOTVTBf2qK?=
 =?us-ascii?Q?ynY0pTHlEW17ynKpC7Q33uMsQ7Gr2hO+lEVuB1pZzbTwE3GRECdESfaQ8D3T?=
 =?us-ascii?Q?9UIct7KGroJdrHLHUz9GS46XXBRdZPKdhpQwmLky7F7UT0WWXcSrPknxMsXi?=
 =?us-ascii?Q?XxdAXlCRNgwrslqHyJ0c/BU0seYeI2gjZDpTeI3DPBZz8OjNiyYqACJhzSTB?=
 =?us-ascii?Q?nydvePR6p9OKk5xKoKoEqXT9M/baLF2yF/YcVakJ1tUTd8aXB5Wr/D9V/BOa?=
 =?us-ascii?Q?S/GxcgclPEZUmCQvAc07Uk77hHtsONyM6VmFFIBLEpJ4vf7lD7Bcx26PHT4o?=
 =?us-ascii?Q?DSpYVaTPTPXwXfCwkTjnb9KooY3sbiyoelrtijtUH6BQcVfA6a4o+wCdN42J?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e830a2-9e0b-47a3-aa9e-08dbf5bdfebe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 18:14:17.6092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YzfmQKkPsxXZgfLEdZOpAr/WW6jAK+FlChNd0PKSyagVBl1WbWJTb+yG8lktwzglF5LbZzb4U5SA8PxYe43ROwkZksBUKr0jQJa3OQ1zck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Expand XE_REG_OPTION_MASKED
 documentation
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

On Tue, Dec 05, 2023 at 12:07:55PM -0600, Lucas De Marchi wrote:
> On Tue, Dec 05, 2023 at 09:28:03AM -0800, Matt Roper wrote:
> > On Tue, Dec 05, 2023 at 07:58:20AM -0800, Lucas De Marchi wrote:
> > > Expand documentation and add an example to make clear this isn't about
> > > generic masks in registers. Also, fix the doc regarding read operations:
> > > the mask part has no effect on them.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> > > index 6e20fc2de9ff..c50e7650c09a 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> > > @@ -60,7 +60,16 @@ struct xe_reg_mcr {
> > > 
> > >  /**
> > >   * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits marking the
> > > - * read/written bits on the lower 16 bits.
> > > + * written bits on the lower 16 bits.
> > > + *
> > > + * It only applies to registers explicitly marked in bspec with
> > > + * "Access: Masked". Registers with this option can have write operations to
> > 
> > Unfortunately, this notation isn't always consistently applied in the
> > bspec.  E.g., FF_SLICE_CS_CHICKEN1 (0x20e0), documented on bspec 55934
> 
> It shows "Access: Masked(R/W)" for me. Same thing on bspec 45921 for the
> same register, different platform.

Ah, they put it up at the top of the page rather on the fields
themselves as they do on a lot of the other registers.

> 
> IMO if any register doesn't have the tag, it needs to be raised as a
> bspec bug.

Yeah, agreed.


I was mainly wonder if we should say the registers are "usually" annoted
this way (since across thousands of registers there's almost always
human error for things like this in the docs on one or two), but I don't
have any specific examples at the moment of it missing, so just
indicating it's always the case is probably fine.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
