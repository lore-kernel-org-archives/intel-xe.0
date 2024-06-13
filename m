Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63AEC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 16:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8EB10EAF1;
	Thu, 13 Jun 2024 16:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awQopYKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE5110EAF1
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718296672; x=1749832672;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dC8pPLeMWnAWzpNmNm59yKt2OSxI8NH0zcaeaqtCmDM=;
 b=awQopYKPsuDy7QARfYcDg1EVcs6f1h4alcyfOV33caxRD+6xHnoOcWVQ
 qF7Np3POISPNGFHsaeDotdwhC389M4xmtdNKwCCSNXIH8JIl+/HFntYCG
 aStLVpBbVIQLPa8dpBCEsiQ40vg0tr6JcHpxoYMWzXS2Du1Xoo4Ff8DJN
 rFbOfW57tmOVwIF3qmZ0FXrofLO5e8N2fcq/s5JUlY5Bp5HD9ooUoPmDx
 jLzsTrZq4CE+mkPqFqNIn63iFcn0U5gjTjttTTy89N7aPEpL+G/rw0RqQ
 pE1tqL3js5K+b5jpEuVWFAxNHw+iTjRpnc/XEy5+UdOhLZWTjat7A3kBq A==;
X-CSE-ConnectionGUID: SkgXJ73US+Gbf9OJltvwwg==
X-CSE-MsgGUID: jb5OwzjJTy29HdJ8xfb2ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="37657722"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="37657722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 09:37:51 -0700
X-CSE-ConnectionGUID: MkIIv9zARV6R5pPWRQP+oA==
X-CSE-MsgGUID: DNyzPB7nRm6ENS+nKO4YbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="44731491"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 09:37:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 09:37:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 09:37:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 09:37:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 09:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7jcrjIG23mYdAMrdLJOYZkBWTZWr8vZVkfoglrG87qNdi+ycaQ2jMxMPqZB3eYEiXMjfekNBbTG2diLTn5U4X63xpC3gs+iilsMwIRYH+kxp25DrIL9K6RkSQjv4LBig67rQEVmN9XfwIxOFck4DWhG9jLpeUkHEH/gVcdwzP+hB4W3TrfG9EoP6pZ5jTLBCOxXUb7lSyd2hdUlIsb+n4MxRJAfBmMqUlGVCJL0U+UDbKr2D41QDVrBWipMCFwrvbs7sNanVm/gKsJSLN0Y0J4tvkZlTaox5wgVi1dXRQUhfCS5dmpjC9awTCattamlkgSC5/RCodKMp2Q3zxXhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvX1o0M6iO2q/rP8b305ORU5uDA7l/oqmd0BUuuRypY=;
 b=LEAZMtrJ2rOmwhRddjfq2h7zheJyO+qOiH2OufI2EHoHtkSunzZvZ2O01aXLj3JmTL1gLpDqOVA91Yt/+GmFwTvVWNQdO253M1WVtibe5PTwrLM1i7ZrlBJRGiicuoGU6KU5nD/drZ8AeumJHPPrvV77sb+cjU1T4hvpRlFHtaVyEON4jcUMUAYgVBpgfuch4evxApjQJoCYZ423w+IKWfWg8oNU1JE+6/goNJZNGypaLSM8o3jFLLiwHLmZbjagaxMAWDRi2qW56TGGRRxTTQ6RSSGSXPqTrJnGb6rfNtpu8BcnMjITleFhgzLKYfpuAyIeWQvLzCporL/ac5FjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 13 Jun
 2024 16:37:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 16:37:39 +0000
Date: Thu, 13 Jun 2024 16:37:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty,
 Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Message-ID: <ZmsgMoNAilAsyY/j@DUT025-TGLU.fm.intel.com>
References: <20240610203300.182615-1-stuart.summers@intel.com>
 <20240610203300.182615-2-stuart.summers@intel.com>
 <7e08f192-1b2d-4099-9e0f-c83749496658@intel.com>
 <29065404957bff03d2cf4acf59d772b0562d7020.camel@intel.com>
 <7b868598-9de3-466f-9ca0-01b5df296a90@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b868598-9de3-466f-9ca0-01b5df296a90@intel.com>
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BL1PR11MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: af889c15-8c02-4af8-3120-08dc8bc723ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rSJwiSHNP5ytRDkK2g3WW29yqqqgh1IQE6dg9rjxSg4H7wqg6Ct1IILPmn?=
 =?iso-8859-1?Q?DGTrIyACT82+e6h4fmJF92UFbb7757jtmEmkz4VKe3phBKvlXcPjAN4s/1?=
 =?iso-8859-1?Q?4OWc9CJ9Ii9FKF0yIQ3XN5RMoCUKs/RxjEKk2VtHxTr2RQzl1TiG4+8Sw+?=
 =?iso-8859-1?Q?BCRcuXiE4qHsDpMdPRQ+D0uP+lTxYmIgWI/9FPmJns+8U62Sfd4GOf5q3k?=
 =?iso-8859-1?Q?dwEeMWpsVi+PEfmJngAVgcqkz9o4jL0gCWDNRKaN7vk5E6nSK3+gQh5rj6?=
 =?iso-8859-1?Q?HeM0ZNF5BgIZKPpynNlpmtPR8lJ8iuaxybvFqYIqM1o2XYPb6i5l+YBLqw?=
 =?iso-8859-1?Q?pd/Kw+52YKU0Iz5fWkfZHXpJkKivYKiajuLRIQa0oRqQVJMHYratw7YGWZ?=
 =?iso-8859-1?Q?FS6WAjXkAO5qudlOcXQnMM1nqlwiduJ6kEcGiTVTLiLmQuT1eamw8EE94/?=
 =?iso-8859-1?Q?P00VPOY2koiJBMBenpgdKAKrZgIElzH7UQHn+ogi+27F7ZcnxUc7cQie33?=
 =?iso-8859-1?Q?hUeSA1ACaDblxn7MjaGNihFmPUy/HOFZUYRp+nLDBU5Gbm5yHDtx6/RGht?=
 =?iso-8859-1?Q?J1XVgCdTRORj53RxKBGqiIWL2WoO1J3n+uOdAfJ2V37LaWJ4TQAc2mJvPa?=
 =?iso-8859-1?Q?5or1t5OTZrQ1OZa33s8xTXMKCyWxwocg4lcyn9+eq8poqpAy3lPDnNrVWQ?=
 =?iso-8859-1?Q?PJBWsdH8Wrfci5ILe0W1mlPo/0e6sY9dGZXNlqWplF2qIUGwuJC20McUeE?=
 =?iso-8859-1?Q?UF1cmBa1xgAGsaSMZmS/vURnHKmyDuDg/5uTCBoJXZPYzoS0/yP/wcsekq?=
 =?iso-8859-1?Q?eWegmZP8+1ySNI2P/hIGK+h1scVnb0iDpFn+NTBwTJrWZffbYP/KeL8iD3?=
 =?iso-8859-1?Q?cW0O2efvxohz/6WhaOngBWgwkDhnGV1Q1zya1VuY7xQW4yh36WyJXOrmBx?=
 =?iso-8859-1?Q?4QgPoy8EojH8daSW5R0k7wifB6VCx7X5blmBiRqrmX02GCpVgsMg89mDm3?=
 =?iso-8859-1?Q?OVzGPvo7MMYYuxLMV/f6t29Vglih4a5gYhaY2RFcnTs1Rm8HdJ5pwIzXBd?=
 =?iso-8859-1?Q?rpiHAwVT4CYyH3HCmiKy9VCTekIaaARp4x6TM9/hLej4JDXwMA+P0I8QQk?=
 =?iso-8859-1?Q?77EJrJoIr2wej+qHEw8iFITBRL1VoS4krfvHRe8Orl9jXU8LeaY9ROJD0A?=
 =?iso-8859-1?Q?5TmRbTmUtnwwZbfnEaLrd0zqDNoSpnB27RtBXSbD7RuGR5nwMPTuVOZeCL?=
 =?iso-8859-1?Q?0OTnTKm+Ph1fmhSs/38ACFTPOnRlpo5ZfpqAgp25cSnYWIwQIB9iQSp0I5?=
 =?iso-8859-1?Q?knDbjcSxryU4RpMPlyZdtN1lgEHKDvvhwqsG75hn3hSGP0s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Gl14qoK5Z54uh4ZZdEdvJz0nC8vPOsXoy0eX95PBCnYRuar0PFLPN4o0+J?=
 =?iso-8859-1?Q?yqiDskRHhDf2ZgA/iRjQ+WglKALqUmpKPsu+B63H3XRoOj5tR7d2QA8TfC?=
 =?iso-8859-1?Q?rqMTAG1ivg6eItmfw73+VzGN6CSBL5FTIZ8l4D4ahqpxY/5fJ0L3lBdOLX?=
 =?iso-8859-1?Q?0emLNP3dVg666JUoZKXGULipo84yx+XQr8a0fS1Og1x6c3lPGpBXqqGuN+?=
 =?iso-8859-1?Q?0d9v3AptwDAe7MNfIHvFSbXxqv1dvRndatGmgsKZIdUgjKUYhsmGauja+v?=
 =?iso-8859-1?Q?3V1QHlR8BD9jZBBQ5b5+gQwhOzxPgfnyM9qX3RCG+K9kGdBJ8y2lbHFE1c?=
 =?iso-8859-1?Q?Z4QXL7XD2S1Wl+Rk3+ZYCiFDiQNxTnuuDl/bH/RqZyrt4vdtfbo4kUZquI?=
 =?iso-8859-1?Q?QJWZSHhVRfs/SvXQuabeCTlnQIH+SmMTNMuCH8zkCEqjINS3XEarv5t5KZ?=
 =?iso-8859-1?Q?0pN+U/3IogBl7QJO+rfgVOVy5jvGFdpF6+zOuRRmMotTce+kOgIZSrljNc?=
 =?iso-8859-1?Q?E6P73u3mDODtuM6jWjoeImIlz9FsKsTT8y/9XkKBXB7TwhSwctuo8MuaZ2?=
 =?iso-8859-1?Q?w7LJN6lw06flFj7nFU86EAseGNdsu+lTbwPjzLnnZr1ktM0BCxF6uMUDCM?=
 =?iso-8859-1?Q?MecEAYL2QQGnQObKl9BNBGYwJZf+2Sg8XyXe3xpMUs4qNms2h6S/1IIa/N?=
 =?iso-8859-1?Q?4f2l/A0qBRcbpllHDW5CK06pVP5GeWpSWs977sDP2yf2WH+fWbNEm9lHPa?=
 =?iso-8859-1?Q?MrUlFRVFrPIHPxTT8CkLIgXxtw0zQGY9c53yu4WOYFrqldOd2i4ErX29uD?=
 =?iso-8859-1?Q?WSBLyeCD6unQw9iQ37KbmeaBYiGO+h8RE4SeHrAHBsSdPA0K1otAkLTWad?=
 =?iso-8859-1?Q?FHGolIttmDJL1G/22nyXDPB+kNuGiWyKbUPJyWwDeRxHyEENIaDX5e/Hyd?=
 =?iso-8859-1?Q?ZZNmSYcZ+1kG/YOfmQKbiExdtCtYNaPfpPg5OL9oozeOu0lqgZ9s5zlTfk?=
 =?iso-8859-1?Q?OB8hz5hVJ1X/roRjd8hygYBw7QTJVM15PmqB7MEG0mb6zuB0rDWO6MVrS+?=
 =?iso-8859-1?Q?4tOMQexIW4R1jay5sSCd0/y7YUAq5ANpA2TtYWN2/ozQJnbA0RlGI/DTLp?=
 =?iso-8859-1?Q?ENuV6UrguGgBJDuANCvyLtUoivZOf6J3pwTz9e7zcA37UV+tcUnE4Zlu4O?=
 =?iso-8859-1?Q?us2IPZKENHmBxYpsXzb3UuTk/5ML5aZ77FUyvghgWdZxBwoHUHeZN/Bwnv?=
 =?iso-8859-1?Q?ZAM9zlLfvj2ZXMjuH2Gg17uYf64W1KAoIy/WwEtK4V7/gCRSG5eLE1dZO6?=
 =?iso-8859-1?Q?Iub/1t7PieoIa45w8Q+IGoaF39gXPtEDg76uMjzkp0X0zIpkeceeE4ANH4?=
 =?iso-8859-1?Q?eKyyiLAWVXzaaofcCltLsMXZ0OqN8MN68gPramVrMuNfz5ncz06AANT/Uz?=
 =?iso-8859-1?Q?jqHFQrG4z2NqS4dLgG4+G+Y6kCzSk9S1GIreBWONTOVeumLCw2mwZT8liA?=
 =?iso-8859-1?Q?TCvgjZ8khjnSpAvwRzlQ6/3P225tEo6C99mE9Ys/iuDAOrH/QRSlweXmQm?=
 =?iso-8859-1?Q?7CanYhYETAsrfKgW4kBe+a33j4P6FZRSx6VKzVanGpVvjnQEnhZf8lea5n?=
 =?iso-8859-1?Q?Csn+IildDx3IjczrrKAhXs1QnHSF1lfswmLwyybIPKiZDupBYTOnrz3A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af889c15-8c02-4af8-3120-08dc8bc723ad
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 16:37:39.5453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52TsCQj/9yv/VA1QHCaGyhs3u5lhRnWiVrTecbLJpHfqSYjZ8PoUD16Yl7sLMU9LMHKNQnDShFMTUCF73XDDrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
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

On Wed, Jun 12, 2024 at 01:37:58PM -0700, John Harrison wrote:
> On 6/12/2024 07:48, Summers, Stuart wrote:
> > On Tue, 2024-06-11 at 17:58 -0700, John Harrison wrote:
> > > On 6/10/2024 13:33, Stuart Summers wrote:
> > > > Currently the page fault queue size is hard coded. However
> > > > the hardware supports faulting for each EU and each CS.
> > > > For some applications running on hardware with a large
> > > > number of EUs and CSs, this can result in an overflow of
> > > > the page fault queue.
> > > > 
> > > > Add a small calculation to determine the page fault queue
> > > > size based on the number of EUs and CSs in the platform as
> > > > detmined by fuses.
> > > > 
> > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_gt_pagefault.c | 49 +++++++++++++++++++++--
> > > > -----
> > > >    drivers/gpu/drm/xe/xe_gt_types.h     |  4 +--
> > > >    2 files changed, 39 insertions(+), 14 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index 3858c8e0b707..5565732e79e9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue
> > > > *pf_queue, struct pagefault *pf)
> > > >                          PFD_VIRTUAL_ADDR_LO_SHIFT;
> > > >                  pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
> > > > -                       PF_QUEUE_NUM_DW;
> > > > +                       pf_queue->pf_queue_num_dw;
> > > >                  ret = true;
> > > >          }
> > > >          spin_unlock_irq(&pf_queue->lock);
> > > > @@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue
> > > > *pf_queue)
> > > >    {
> > > >          lockdep_assert_held(&pf_queue->lock);
> > > > -       return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> > > > PF_QUEUE_NUM_DW) <=
> > > > +       return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> > > > +                         pf_queue->pf_queue_num_dw) <=
> > > >                  PF_MSG_LEN_DW;
> > > >    }
> > > > @@ -312,11 +313,6 @@ int xe_guc_pagefault_handler(struct xe_guc
> > > > *guc, u32 *msg, u32 len)
> > > >          u32 asid;
> > > >          bool full;
> > > > -       /*
> > > > -        * The below logic doesn't work unless PF_QUEUE_NUM_DW %
> > > > PF_MSG_LEN_DW == 0
> > > > -        */
> > > > -       BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
> > > > -
> > > >          if (unlikely(len != PF_MSG_LEN_DW))
> > > >                  return -EPROTO;
> > > > @@ -327,7 +323,8 @@ int xe_guc_pagefault_handler(struct xe_guc
> > > > *guc, u32 *msg, u32 len)
> > > >          full = pf_queue_full(pf_queue);
> > > >          if (!full) {
> > > >                  memcpy(pf_queue->data + pf_queue->head, msg, len *
> > > > sizeof(u32));
> > > > -               pf_queue->head = (pf_queue->head + len) %
> > > > PF_QUEUE_NUM_DW;
> > > > +               pf_queue->head = (pf_queue->head + len) %
> > > > +                       pf_queue->pf_queue_num_dw;
> > > >                  queue_work(gt->usm.pf_wq, &pf_queue->worker);
> > > >          } else {
> > > >                  drm_warn(&xe->drm, "PF Queue full, shouldn't be
> > > > possible");
> > > > @@ -382,18 +379,42 @@ static void pf_queue_work_func(struct
> > > > work_struct *w)
> > > >    static void acc_queue_work_func(struct work_struct *w);
> > > > +static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue
> > > > *pf_queue)
> > > > +{
> > > > +       xe_dss_mask_t all_dss;
> > > > +       int num_dss, num_eus;
> > > > +
> > > > +       bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt-
> > > > > fuse_topo.c_dss_mask,
> > > > +                 XE_MAX_DSS_FUSE_BITS);
> > > > +
> > > > +       num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> > > > +       num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> > > > +                               XE_MAX_EU_FUSE_BITS) * num_dss;
> > > > +
> > > > +       /* user can issue separate page faults per EU and per CS */
> > > > +       pf_queue->pf_queue_num_dw =
> > > > +               ALIGN(num_eus + XE_NUM_HW_ENGINES, PF_MSG_LEN_DW);
> > > Do you mean ALIGN here? This is queue size in dwords according to the
> > > name so isn't it just max_queue_entries * entry_size_in_dwords? I.e.
> > > num_dw = (num_eus + num_engines) * msg_len_dw. ALIGN is just going to
> > > round up not multiply up.
> > Thanks John. No actually this variable is the number of dwords in the
> > queue, not the size in dwords. The alignment is to adhere to some
> > assumptions made elsewhere in the pagefault queue handling.
> That doesn't make sense. You mean the current queue content size rather than
> the total size? If not, then how is 'the number of dwords in the queue' not
> equal to the 'size in dwords'? And if it is the current count then it should
> be initialised to zero not to some confused max.
> 
> Either way, num_eus + num_engines is the maximum number of page faults. I.e.
> the maximum number of *items* in the queue. That number has no direct
> connection to dwords. You have to multiple by the dword size of each item to
> get a dword count. And given that the name is _dw and you say it must be
> aligned to a dword size, it does rather seem like it should be the dword
> count.
> 
> E.g. 10 EUs and 3 engines would be a max queue depth of 13. If it is 4
> dwords per queue entry then rounding to 16 does you nothing. That is only 4
> actual entries before it overflows. You need a queue size of 52 dwords to
> fit all 13 entries. And if this is really meant to just be 13, i.e. the max
> item count, then the name should be pf_queue_num not pf_queue_num_dw and any

This is correct, the queue size needs to be (items * PF_MSG_LEN_DW).
This ensures we don't get a weird case where a single item wraps the end
of queue to start. This is what existing code ensures:

315         /*
316          * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
317          */
318         BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);

So with this patch, we need a similar xe_gt_assert since PF_QUEUE_NUM_DW
is now a dynamic calculation.

Something like:

xe_gt_assert(gt, !(pf_queue->pf_queue_num_dw % PF_QUEUE_NUM_DW));

Matt

> code which is assuming a multiple of 4 is broken code that needs to be fixed
> because it is working in the wrong units.
> 
> John.
> 
> > 
> > Thanks,
> > Stuart
> > 
> > > John.
> > > 
> > > > +
> > > > +       pf_queue->gt = gt;
> > > > +       pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw,
> > > > GFP_KERNEL);
> > > > +       spin_lock_init(&pf_queue->lock);
> > > > +       INIT_WORK(&pf_queue->worker, pf_queue_work_func);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >    int xe_gt_pagefault_init(struct xe_gt *gt)
> > > >    {
> > > >          struct xe_device *xe = gt_to_xe(gt);
> > > > -       int i;
> > > > +       int i, ret = 0;
> > > >          if (!xe->info.has_usm)
> > > >                  return 0;
> > > >          for (i = 0; i < NUM_PF_QUEUE; ++i) {
> > > > -               gt->usm.pf_queue[i].gt = gt;
> > > > -               spin_lock_init(&gt->usm.pf_queue[i].lock);
> > > > -               INIT_WORK(&gt->usm.pf_queue[i].worker,
> > > > pf_queue_work_func);
> > > > +               ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
> > > > +               if (ret)
> > > > +                       return ret;
> > > >          }
> > > >          for (i = 0; i < NUM_ACC_QUEUE; ++i) {
> > > >                  gt->usm.acc_queue[i].gt = gt;
> > > > @@ -418,12 +439,16 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
> > > >    void xe_gt_pagefault_fini(struct xe_gt *gt)
> > > >    {
> > > >          struct xe_device *xe = gt_to_xe(gt);
> > > > +       int i;
> > > >          if (!xe->info.has_usm)
> > > >                  return;
> > > >          destroy_workqueue(gt->usm.acc_wq);
> > > >          destroy_workqueue(gt->usm.pf_wq);
> > > > +
> > > > +       for (i = 0; i < NUM_PF_QUEUE; ++i)
> > > > +               kfree(gt->usm.pf_queue[i].data);
> > > >    }
> > > >    void xe_gt_pagefault_reset(struct xe_gt *gt)
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index 10a9a9529377..c40b9c1b5fec 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -232,9 +232,9 @@ struct xe_gt {
> > > >                  struct pf_queue {
> > > >                          /** @usm.pf_queue.gt: back pointer to GT */
> > > >                          struct xe_gt *gt;
> > > > -#define PF_QUEUE_NUM_DW        128
> > > >                          /** @usm.pf_queue.data: data in the page
> > > > fault queue */
> > > > -                       u32 data[PF_QUEUE_NUM_DW];
> > > > +                       u32 *data;
> > > > +                       u32 pf_queue_num_dw;
> > > >                          /**
> > > >                           * @usm.pf_queue.tail: tail pointer in DWs
> > > > for page fault queue,
> > > >                           * moved by worker which processes faults
> > > > (consumer).
> 
