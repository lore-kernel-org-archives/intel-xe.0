Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28075CFA74C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 06:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC0710E84D;
	Fri,  4 Oct 2024 06:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDDQYUsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F3910E84D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728024630; x=1759560630;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w/ATBYcq42oddKfA4/BweGMTCnei8fy3/7J0yac8Ph0=;
 b=oDDQYUsTTTi4KPpYX8J0ogdyGUfOyLRQ6sM+tJKa1GQfT9YEz4fuJq0U
 7+L3qlo5FqszlI7hAilqZG16DkuvEf1x4kgva3R8AieQ/x6f13/eUqEUX
 IPYym7lz8OL3Irgx2jySMll+BqAsFwkvT8EPHGr1syG7Eh8mNAPBb/tFR
 A4EdPIkoBfKc8b2qXV/cOPT06lr6uDXbNxKkPlnwLpDHW5UY8XTs2RLn5
 uc726wSsMBbY+WpWWSkBwdYbF3/tB946BPasQnDqv5LItYcyK6DejIzu8
 tzVuL4skK2sgSdnsl/eDZaYWersrpIZ1jv7/DZoLBKmGUykdpjCh5C+OJ w==;
X-CSE-ConnectionGUID: 9bbHFrM3ScK7DTI8vg7sTw==
X-CSE-MsgGUID: LyWCHB5pQKq6jd6EUbP7gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38598942"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="38598942"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 23:50:30 -0700
X-CSE-ConnectionGUID: z2/LY1CtSTu7RgWEbOF9JQ==
X-CSE-MsgGUID: m0eGO2J2QeKzGt7etaHAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="74294529"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 23:50:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 23:50:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 23:50:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 23:50:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 23:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ph5lakfvxEvtDAoYVETFal47khgo+2mxvy9Vkg19RH48NXBCTpzJ2wH8NlCZKRj9zjV6VNw9+fie3AAzYeGqTdC1xAqpuZCRMSBIU+ZbOBxQQKmFevklYTzoF4fCcOOkrh516zdA8rawii4MYGfNH/ShiS+tdvAl2gAu1vXqw03vC3avny/eyW4rzP/dhqGAw51V9WI7yVWjW2Nw5vJDEXjyxPdVMEf7Je6AqVAJpbSA2bhT5jJamR8fjeT6G9hGbdRdBTLGZlsD8PS2C0RAoGZk0gaTxXB0OhN/FkQgKwcQrxRDpMme1qgoM+ISC6lDFZwB0J0dY/UXlwDBasPSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9arC+bJp7uHl+UNBUf/VkI1HP/4pI1r6zqhd6ZGlmM=;
 b=XoPAz6Ux/wxNUpZ/uu6Nf9gE/o7s6tQBGeWnzoREtIs82c5rEmqZGO+iqLGW8OppX8miLLJxEChNsjhkgzIgSBaXA2zyt4Dd+U+/8PP1ZSNOoZkbkCtVnactrqtzYruAqR2/lUG7CDJ4w/ELdaXQ8uz76fuUSDEdYFb4nlOBGby/H0q/wP4iy0/s9g4AuA+Of7nWj1Uhf36tsiIUokK0mgH5Zb9dO3HkHJsKT46uuXqdJhB/2++eJqCUhUiCgZmdQOICar/ryedQwEzm1BczKfhosTgiSXTshqqkygZ12dKm+Vfbdj5eO8CEJQ1hf0fJ8cjLllLTVTsWUvK3lx5Fuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4795.namprd11.prod.outlook.com (2603:10b6:806:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 06:50:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Fri, 4 Oct 2024
 06:50:25 +0000
Date: Fri, 4 Oct 2024 06:50:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <vinay.belgaumkar@intel.com>,
 <vivi.rodrigo@intel.com>
Subject: Re: [PATCH] drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h
 resp times out
Message-ID: <Zv+QJ4HVR0pJbNsX@DUT025-TGLU.fm.intel.com>
References: <20240927192428.1160211-1-badal.nilawar@intel.com>
 <ZvcjVH9Y3AVjGMsI@DUT025-TGLU.fm.intel.com>
 <2198b044-4b1c-4933-a229-d94095b87d5d@intel.com>
 <Zv1S++mT0UuQEFNZ@DUT025-TGLU.fm.intel.com>
 <ab52e413-3dc4-494c-b50c-5456c81502eb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ab52e413-3dc4-494c-b50c-5456c81502eb@intel.com>
X-ClientProxiedBy: BY5PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4795:EE_
X-MS-Office365-Filtering-Correlation-Id: acd79eb1-5230-4e66-052b-08dce440d360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KoLdmmvgqSOIOXy4f4gF5+7DgBvcnB72KkP+8aITU29n+m6h7Ujyrq4Hnq4X?=
 =?us-ascii?Q?BN9JzLbRU39P3q1QWhqD2gXHcgQxiMv8eXpvtjMqdHCp8mSphMba2cmt0qCM?=
 =?us-ascii?Q?V15qC38THlZwllLTosUeGog2e7XKeYgMkEM8pvVsLWCMXXqMnYiff303DIEt?=
 =?us-ascii?Q?LLfxZevsErOo//otyMiqLCvxJU6Wuklq6f0jbjKkzg8VsTNbpv+vdFZH5fqZ?=
 =?us-ascii?Q?lPvIth79wGWELN34UKtzwHgT9bVxEPsa5lBFY1mCRbgPavGlnfy3/tnP6ZGd?=
 =?us-ascii?Q?sr0tf3cpcZF7AELko2JpHV3ax+SJykhwOeRIeRq11MlKARd+oM3xDveJu2Zz?=
 =?us-ascii?Q?DZfFyivdgl9Fm3m8NRn3UlhvyC/19fv8IPvho7O6jzRzXnGRSxdoLhSCeVxa?=
 =?us-ascii?Q?Lw8Mog0am3IL0A8gCtHwSDhXxBBJS2GioXH7NOfTtxvwQ9I4etuym6my3aXg?=
 =?us-ascii?Q?iq3ZMOLPMI8o66/edrmkkJwAFfP7fh3RRp7W7iyuOcn4HKhBPku6OecBXQB/?=
 =?us-ascii?Q?5pNA0CagqW9Czn0aVEHSoVm6Enna9j37W+yh+6VfkZrYhDv9yGmarzE/YTk0?=
 =?us-ascii?Q?OaoLG21N8N+upOKVE/RcedGKUyWG1iemUEJpkmfBOuALdTbwUjksmfSun3dp?=
 =?us-ascii?Q?ZhVSKft67XnOiBhEI/GpzkZwK9OmAc3I6pWsLzrDzvvV2DlvtOeIA8szeaP6?=
 =?us-ascii?Q?8/irySaV3ZeDglZHM9YDLeLM9VTEbdsbKyHLyXQuK7TPJiyzbC8ww3t39m6r?=
 =?us-ascii?Q?uCgL65ZayWagybVJvaq7dMHNWywQ+gy52stj3nKsF3iOtOlv8PQGdATaPSXA?=
 =?us-ascii?Q?bDGhCAYx5u+OmXNngd2WCAe9sw3jwV6wtyAmSzo4pgAHnyh38OVGLptZyOq8?=
 =?us-ascii?Q?NujegX6dkTOmSzA51RZ+4aFWvO5BYN89l0LhCzok/SAKAr/7k9lKaP8zVigA?=
 =?us-ascii?Q?De/gjwBeKNyCN+Dx2JTAMvkIlB+2cheChbNmGipXg916+cItTm0/8xiIogmb?=
 =?us-ascii?Q?Bu5+0ERFrFnrVMYrNdtraHM1LhYmN5+3rQKr+IMUbMAGHDy99RMUA3bE2BtG?=
 =?us-ascii?Q?LKn3cUIPfh2CI6jUy+FcW5+hA8CMqR2Gc8guQb0eKD0pSd3S8/0d8tB5pMtc?=
 =?us-ascii?Q?AFjqd94Sd1V8IMfxdus141ABAFiwzDaOITFDgWquvB3uofWTqfZ6kMMWZGGE?=
 =?us-ascii?Q?RJM7xiFADQziMPrVRC1i/ukzLPlvYjVvYP6/ZgPMiqq+ZP9N1hQ7q0nN1Qc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S1XRLHUX4vWextuJoL0P3Yj91cM48CGczG6t5KFqobNK/vhnFMQEBtsk8c00?=
 =?us-ascii?Q?XyW0BcHIj/kJXY+CH/JhY/MGLHfMFv6YPSymjPPO1tSK1BccuM2vUhfScPNa?=
 =?us-ascii?Q?5ImwdTRyEsOgXj3XDCRx0mCacDHAhrc5PmGYUXuUl19saGfLsf5IwdTE4+PP?=
 =?us-ascii?Q?/yu0+0KlzdntJgoFqGg1szDlA3YZDMRfJkNG/PduXjV5+GXkppbwMOxIEd/1?=
 =?us-ascii?Q?sXd0/7ySaL5xtbjdAXrmymwiXkHxetJ0h2FvN14TEoxAgd3G/ExNwsqA/+Bu?=
 =?us-ascii?Q?faMBI6c6WBVaCVStWPMgg7ReFa2ZcMNXmKI3IvUDE4kLIGcAtt6RgVDsnn9J?=
 =?us-ascii?Q?X+tr40UATa+wyCwzn4keyu+EbAxYzdTiSOMfR/gTwqvHCrrQ1iEPz+FtG03x?=
 =?us-ascii?Q?9iUQ7dcYHmGMMmB2NDp0AfmES9E6ZuqeKuRDHmyHzsNzcN//IAYj+wgBLUD+?=
 =?us-ascii?Q?Qr+GzUpuLRGj4vdB0EoJ4QMNtV6RroGV+Z570xteDekLPmq6UwU04o7vgqmv?=
 =?us-ascii?Q?ojCumWyCEkaDu7WAtipMVSJOC2oPiWNJOmjz5Iry09vI7ipuBvLiHG3uf5bH?=
 =?us-ascii?Q?FO0LI1wDBenk9dx5kPCwdAipJJR8GxbnLS2V+fTNW4Mxqw3uFUy3A00sRGrp?=
 =?us-ascii?Q?dpAIhy3epGZyRlvKv85A0PWjrIQw4TuXwx6tQYjtiJW/1z9OgYVR0n6/2fHj?=
 =?us-ascii?Q?OfEj1pI4JAS/IDqGITGbyN/I+ByX3C5qOsXNEqW2g9qHoFnMOhBbzpp9U18F?=
 =?us-ascii?Q?1pXUenkntCtwYTLFDb2CihkhftH1sXZbYJB7lyUq7BpH43NF5ktaMPloOTsX?=
 =?us-ascii?Q?FketEAxZ88XkxLyN2wGbIZRGyCJ7rZJxD0hBlJeOa+ACMxcjsenRiadCrIRE?=
 =?us-ascii?Q?QLfFJ6IF9nThy4VTOir7p83KH+f6CFqoy7Kow9HO2K8I/4DlX2riLTpaLQwo?=
 =?us-ascii?Q?gmBM3JW/XY5odhyhtHkGFrcR9FhDsiMSEeoL68W5AWVf6dk3rfQMU1Hfot2U?=
 =?us-ascii?Q?ekPf03xdXZtRFIKPkS78tLI17YvsSHAq5DwJYQmrgSA6SsMxtphvrFUSb/cy?=
 =?us-ascii?Q?Ym03PKQAZzJHVgQJd0xtlsbDZ2gZo2DrIAnkmy9arkqe1crLCm6jOu7NP9+b?=
 =?us-ascii?Q?WkFG//sAU0Vqe6AABVkzrOcqQA1ED2oxpoKX8iAwva1dSKcM6Yy+Gwe3iMpk?=
 =?us-ascii?Q?brAAgm92Q6a1XQ5E9TFmmkaJFI/yKyJrDQLyLUrZE5igcqcsSMLQzL1jYpRm?=
 =?us-ascii?Q?HmvDaUQwd06mlph6Bp6w6M91qi1IoXQ7LKLoIvR0Etd1QegI5gp8pyXbItyY?=
 =?us-ascii?Q?+xp/PLOQWvxGmalo+7age2jYPXnBHrKx4EQqYPDD8nv8AcI/E0SYfn91efTD?=
 =?us-ascii?Q?ZtIuU4WfH9nfpBroM8SeF9TYDU8XyqwdTJxjl4/EL98EvFdkWxrkKoIgWDoT?=
 =?us-ascii?Q?NoZCi4gRiUoLKojeqAOfh+5nafIu0TepXXsGsSeDezSpVVv95sEgSXY22np8?=
 =?us-ascii?Q?kjETQ5vF/YEInNdZGzJthTabgSxQVwHpetZykbKkEUC51pu6lLsO2r+q1XaE?=
 =?us-ascii?Q?X8jQP+98UoB10NgdXrA4kKeiUAyFgQSzFOhnVwOAWNjiPvLAWMVspG0TPG7b?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acd79eb1-5230-4e66-052b-08dce440d360
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 06:50:25.5995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pRN0YtOVGzjOQ1M2Xk62u3gV+ecFS8v4Pz4kTctcCrg73Ra9jPWjTMau+N8Swxwv7OYaKZVw78XK+Q3uf0gew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
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

On Thu, Oct 03, 2024 at 03:24:12PM +0530, Nilawar, Badal wrote:
> 
> 
> On 02-10-2024 19:34, Matthew Brost wrote:
> > On Tue, Oct 01, 2024 at 01:41:15PM +0530, Nilawar, Badal wrote:
> > > 
> > > 
> > > On 28-09-2024 02:57, Matthew Brost wrote:
> > > > On Sat, Sep 28, 2024 at 12:54:28AM +0530, Badal Nilawar wrote:
> > > > > It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
> > > > > queued, but it didn't get opportunity to execute and timeout occurred.
> > > > > To address this the g2h_worker is being flushed.
> > > > > 
> > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++++++++
> > > > >    1 file changed, 11 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > index 4b95f75b1546..4a5d7f85d1a0 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > @@ -903,6 +903,17 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > > > >    	}
> > > > >    	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > > > > +
> > > > > +	/*
> > > > > +	 * It is observed that for above GuC CT request G2H IRQ triggered
> > > > 
> > > > Where is this observed. 1 second is a long to wait for a worker...
> > > 
> > > Please see this log.
> > > 
> > 
> > Logs are good but explaining the test case is also helpful so I don't
> > have reverse engineer things. Also having platform information would be
> > helpful too. So what is the test case here and what platform?
> 
> Sorry, my bad, I should have added issue id in commit message.
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620.
> 
> This issue is reported on LNL for xe_gt_freq@freq_reset_multiple test and
> xe_pm@* tests during resume flow.
> 
> > > [  176.602482] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: GT[0]
> > > GuC PC status query
> > > [  176.603019] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
> > > GT[0]
> > > [  176.603449] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
> > > running GT[0]
> > > [  176.604379] xe 0000:00:02.0: [drm:xe_guc_pc_get_max_freq [xe]] GT0: GT[0]
> > > GuC PC status query
> > > [  176.605464] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
> > > GT[0]
> > > [  176.605821] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
> > > running GT[0]
> > > [  176.716699] xe 0000:00:02.0: [drm] GT0: trying reset
> > 
> > This looks we are doing a GT reset and this is causing problems. This
> > patch is likely papering over an issue with our GT flows. So this patch
> > doesn't seem correct to me. Let's try to figure what is going wrong in
> > the reset flow.
> 
> This is seen for slpc query after "reset done" as well.
> 
> > > [  176.716718] xe 0000:00:02.0: [drm] GT0: GuC PC status query    //GuC PC
> > > check request
> > > [  176.717648] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
> > > GT[0]  // IRQ
> > > [  177.728637] xe 0000:00:02.0: [drm] *ERROR* GT0: Timed out wait for G2H,
> > > fence 1311, action 3003  //Timeout
> > > [  177.737637] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC PC query task state
> > > failed: -ETIME
> > > [  177.745644] xe 0000:00:02.0: [drm] GT0: reset queued
> > 
> > Here this is almost 1 second after 'trying reset' which I'm unsure how
> > that could happen looking at the source code upstream.
> > 'xe_uc_reset_prepare' is called between 'trying reset' and 'reset
> > queued' but that doesn't wait anywhere rather resolves to the below
> > function:
> > 
> > 1769 int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > 1770 {
> > 1771         int ret;
> > 1772
> > 1773         /*
> > 1774          * Using an atomic here rather than submission_state.lock as this
> > 1775          * function can be called while holding the CT lock (engine reset
> > 1776          * failure). submission_state.lock needs the CT lock to resubmit jobs.
> > 1777          * Atomic is not ideal, but it works to prevent against concurrent reset
> > 1778          * and releasing any TDRs waiting on guc->submission_state.stopped.
> > 1779          */
> > 1780         ret = atomic_fetch_or(1, &guc->submission_state.stopped);
> > 1781         smp_wmb();
> > 1782         wake_up_all(&guc->ct.wq);
> > 1783
> > 1784         return ret;
> > 1785 }
> 
> And CT is not disabled yet, so SLPC query will go through.
> 

I agree CT should not be disabled at this point.

> > 
> > If this log from an internal repo or something? This looks like some
> > sort of circular dependency where a GT reset starts and the G2H handler
> > doesn't get queued because the CT channel is disabled, the G2H times
> > out, and reset stalls waiting for the timeout.
> 
> This log is captured on LNL, with debug prints added, by running
> xe_gt_freq@freq_reset_multiple.
> 
> If CT channel is disabled then we will not see "G2H fence (1311) not
> found!".
> 
> During xe pm resume flow this is seen during guc_pc_start->pc_init_freqs().
>

Ok, was spitballing ideas - if this is upstream then the CT should be
alive but somehow it appears the worker to process CT is getting
staled.

Also it very suspect the time gap between 'trying reset' and 'reset
queued'.

This patch doesn't look like the solution. Can you look into hints I've
given here?

Matt
 
> 
> > 
> > > [  177.849081] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: GT[0]
> > > GuC PC status query
> > > [  177.849659] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
> > > GT[0]
> > > [  178.632672] xe 0000:00:02.0: [drm] GT0: reset started
> > > [  178.632639] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
> > > running GT[0] // Worker ran
> > > [  178.632897] xe 0000:00:02.0: [drm] GT0: G2H fence (1311) not found!
> > > 
> > > > 
> > > > > +	 * and g2h_worker queued, but it didn't get opportunity to execute
> > > > > +	 * and timeout occurred. To address the g2h_worker is being flushed.
> > > > > +	 */
> > > > > +	if (!ret) {
> > > > > +		flush_work(&ct->g2h_worker);
> > > > > +		ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > > > 
> > > > If this is needed I wouldn't wait 1 second, if the flush worked
> > > > 'g2h_fence.done' should immediately be signaled. Maybe wait 1 MS?
> > > 
> > > In config HZ is set to 250, which is 4 ms I think.
> > > 
> > 
> > HZ should always be one second [1].
> > 
> > [1] https://www.oreilly.com/library/view/linux-device-drivers/9781785280009/4041820a-bbe4-4502-8ef9-d1913e133332.xhtml#:~:text=In%20other%20words%2C%20HZ%20represents,incremented%20HZ%20times%20every%20second.
> > 
> > > CONFIG_HZ_250=y
> > > # CONFIG_HZ_300 is not set
> > > # CONFIG_HZ_1000 is not set
> > > CONFIG_HZ=250
> > > 
> > 
> > I'm little confused how this Kconfig works [2] but I don't think
> > actually changes the time of HZ rather it changes how many jiffies are
> > in one second.
> > 
> > [2] https://lwn.net/Articles/56378/
> 
> Oh ok, Thanks for clarification.
> 
> Regards,
> Badal
> 
> > 
> > Matt
> > 
> > > Regards,
> > > Badal
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > +	}
> > > > > +
> > > > >    	if (!ret) {
> > > > >    		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
> > > > >    			  g2h_fence.seqno, action[0]);
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > 
> 
