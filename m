Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FECFC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543E810E34B;
	Wed,  3 Jan 2024 18:45:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BD710E34B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704307538; x=1735843538;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i2hcabs6wxSHaZM67gb/ZvahhJLCiCeGipm9BREi/i4=;
 b=Y5GVCx6nHhfMubsQmY92u6aJgAPFT3UrcAbC/MAW8NXktwzZ7Van04KE
 riyyZ+7/TSZvBA/jGe7NxhvREoAWV5qPbevobVutyZnDU5nMaUGVMT4XO
 RmIlM5MdcB6Lz2j36SalQfWmrlBbUYJUphk336QUnOkuDSnbwf+Fi9kZI
 AabxqDyhwMK/yV8bBVdJgzvCEVBl0N1XUjRVuhLKFiQAEcMNArP43xw3+
 gmGMyRjaf43dm8hz2QWuwYx9GxKw8ObJHgKQ29vzALFfOb87U3TJ5baNR
 AxH360QuzcC4goGcQfFYZtlsHSaU0gZD5E4eq9iNu8cXDbDV02sv8sxVN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4392927"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="4392927"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:45:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="14575383"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 10:45:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 10:45:36 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 10:45:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 10:45:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 10:45:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnJQaiuUIoYgYIrE3sE5GrAo4JT24fkE47aK5u6IS045z96FPwvYdgmE7JoQIKl8DkkRE2p2UbLbiB3kdU7Bpr7JNYZcZRb+YjjmrmAZtL/MzpgRWoqqfDObFMB/ISZtyOuYxy6ybDOLEUUTLULLqdmOk1GA/ATx3bfC0PktAf31Uoqb+4Rp/ZpnKHNH8SA4hQqpu/XEnJ9YfnJgvHpMY0zAZEC5H1CEnvLVrXAIevA4njiDpzgVoiQ4/qTbIIFPfCF4QuXxy3viAEMDNJWZOQLNHUbtH0b81XUWm3T4vfzJnJmCsbgbTeYoG94QLemkDVdjGlPH7d9FE0L9iA60nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQ5oMlTvG8s6IVsyuvYATnReRlI0l3i7sKsXT1hcz6M=;
 b=ErK3QTMMQmMD2H8jDBOlfvS76O7XCws6+s8sU1ibVvpnc+cZvuTdTAIW8I16fsrB3+rYbuIBkmt2bQhEVdOtlcleAFp6t+X4OWAKxmpbahI2LUe80Xijj5H6LR7sMLu3upSaRnOZ+PIqUaernODqa2Xqkfw1Vu/F9mvJF/g3eDZhFtGLAmn4W9E3F8yhQAzYOMTAZ0kaqbqjKbIiuuJFJuhdB1xL5FWzv/B4J/AV/mPYNZHT5El4LB6xgqA+dQEXL/lQBdqNCo7oox56VXTpbn+dmBXGINFx2iedJyYrmpykJ1/ccbGjUq5ZQvD3eIdAMd29USAUwPft0ZphKT9RrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 18:45:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 18:45:33 +0000
Date: Wed, 3 Jan 2024 10:45:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
Message-ID: <20240103184531.GD3529480@mdroper-desk1.amr.corp.intel.com>
References: <20240102165142.853141-1-himal.prasad.ghimiray@intel.com>
 <20240103011618.GT1327160@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB70565545C05F1C9238438949B360A@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW4PR11MB70565545C05F1C9238438949B360A@MW4PR11MB7056.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b48c3cb-a0f3-4663-cecc-08dc0c8c2aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aiaxJWWMos9dO0SKPxcRWKwqFTZy09LtSADowmqkNO+23z1qukMtCw30TAI5S392E2BpxayzscBxw39CXSf0pO+k5OFs5lK1fbnnuBL14aCbILQzH9uBOKfv7P0O5x1Z4WK5kO0/0HbaUI3NMm9mFGNiiboCKAHV8Sg5pZ0AhXor4NTaRKXYvkDoVN4o9kDTttb4/gK46IcWXx7LK/h9tpxDY+lDTxIgsB2PvGb0jCU0jRzFfxmhOjqAoQwCbU2xxcUvWxaW4yheoIC5MXTZZBMToZ2MB3eGQFbTzDNSqvGgQNRwvBd+uhh24HTdQ4XBXxcGpfVwfpO47KJGPvMxf/uY0U033Nfk6syr0iP41c/qAYdvWJuO+CvpNdhgF/Q5wMskcBlUW72W+ygtsKivjRk/7iR47VVMgGQXr2UE1exn2nQOqIzw3e66ZmW4pjhGiiWyzoezWrICwPDBu2hwcwChVZZGjVTgD+Lf9vPmdyc4uJu3Ar01QC2mDe0tdThd19t635Dg5FHzas7xppYWt0zn2waoIEN+bh20Xi9vXMcpRy6VNfVlo93e3irDBx+C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(66574015)(316002)(26005)(1076003)(6512007)(41300700001)(5660300002)(86362001)(8936002)(8676002)(33656002)(6486002)(66946007)(66556008)(66476007)(83380400001)(6506007)(6636002)(82960400001)(6862004)(53546011)(38100700002)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XKyTP+wUz/LBcWRCK9ZDp36gy52R9eXHpbBsi0o3CDgbvL9U5R+3h1OcSD?=
 =?iso-8859-1?Q?kijgbzczzztHDEcoX7sLEMVnsDgFrO9ChCpDAP9PFJNeCkaSQEuQl2fW4u?=
 =?iso-8859-1?Q?7Tcwi6hd9g/J4XHVda7hBPGeJHzWEZhGpnj7KwaaYsMLy0EgBqSfFeoxHm?=
 =?iso-8859-1?Q?b59jg19edvrV2YW2d6wZlPIbP6QsWlvYDnUf5CRDC0NizvwBnDNGdVVp7s?=
 =?iso-8859-1?Q?BudswM3lpCl595MQBEOjFaeDSx+94YZFq50DtBK9tzGAbZ+vuudLDyxl5s?=
 =?iso-8859-1?Q?UNAym81tBlYsv0gOC05nFoVaF8pu9weuoyMC5K18W9KkW9e7FDcGas1j3d?=
 =?iso-8859-1?Q?TrP8qL8pY3mWwU4giUe0ulw8FO0Csps5B7Tu5bYw5ffd5jk5pp4e9bn/YA?=
 =?iso-8859-1?Q?Ie4jVJr8xwJxpJUQu01rbjvktFw5SXSCoG+Oy/x1m847PzqKNjFYGgtGJm?=
 =?iso-8859-1?Q?bOWNnDdD65XmWEf7xGfSk9R5UnKCFFS/JftRcXOUFhF/q3lD0JCMjySwy9?=
 =?iso-8859-1?Q?xdPcovEq5hao7q6J8Dg0l4yJdvji261is0OuuEXMYGEfkN2O2XMgv+twPZ?=
 =?iso-8859-1?Q?ZwvcJVODgR3b6kAxjO/GoD0XJG53JPq2JkqTY4mT63/MRu+NntTF5eqhoy?=
 =?iso-8859-1?Q?mNnyA5DlTFGxGkzUk8mIbbWL3INl3zwsdLh6RWynlFGVNR/Q4ycqHNVjZm?=
 =?iso-8859-1?Q?DjPtDZwOrRSDJDR5ggr7uL7UVH/dKxulgOonScsZgalodeUMhsgHweoMxr?=
 =?iso-8859-1?Q?0/wUan220hU0UTc25/8ZAGe0ZsDefK5V2re5tLvDT99mRherPYLvh6yEM3?=
 =?iso-8859-1?Q?D/swBNDlqyEvX3nFnTnk+7xM5nWUK2CP+fRoUMhchRcO9oaKvhXVJfIwxk?=
 =?iso-8859-1?Q?m3zKesOjhbn0BwqShOw13IIL2Lic4EqEw2EF0VFVtLKF52664ZDdnL6Adh?=
 =?iso-8859-1?Q?23wRce5YGuSCLSVLOjy4ww7pPgfITgr/fGeUaF3qpjCuuvKvjURBd5r/h6?=
 =?iso-8859-1?Q?v0TBLsFv0ue53hLD8zmml/3BxzeO2/tk7hROuOqSrHuG4hhUut9NuBSksg?=
 =?iso-8859-1?Q?YsKnDx3B4i1uu5EkG9VC2ELjJCGqNl/Haj8xxlPB2BB2KUBtVn/1z9E5hk?=
 =?iso-8859-1?Q?rse5vXa9a6p+Dk9NMMK7gAGsMrDYRiAKi+e/UGmLvWuFS27C/vIzTIPcC8?=
 =?iso-8859-1?Q?OO4rnSeWvNluNU/VhZsqhcK++jmynz+xHY6zoCMtiso8CfqeSkBiCjRR9k?=
 =?iso-8859-1?Q?hdbrKYX92VrBEz5gEaGt8BmA5EtExG2YtriSp+oDS/ag8MgOk5SA0o5omy?=
 =?iso-8859-1?Q?Cyy+ga/hbT2kFEQIDQo4e1wh95LcRxIlIGjJ5OupqVNvxfjWNEcdqBAMnT?=
 =?iso-8859-1?Q?H1bRyselilBm8JbMPKYfNTWufc8+eJyBsioBVhschBQJMin8DE20Tcs7qU?=
 =?iso-8859-1?Q?4V8RXsuOKecRqb1Aat5j8HgPaqObP5tMj6s6Z0cKbKUwNIfoF+Wa1WvRz8?=
 =?iso-8859-1?Q?4mkaKjtc8B9a0ShQMPZDszFlRBHJnOHO4xVXvL4TJk/9xrAqZyyX+Napx3?=
 =?iso-8859-1?Q?ZQM6MFTDLx0+g2xOgjpwYmYHh/EoxqpfoDqsfDa3tRFDw3RrRgnNBeFgNK?=
 =?iso-8859-1?Q?V1Iir7TvpxfIU1JfbOGiZrkxk7liyKJdACrxKqAkiQ6pX53qdiatn59g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b48c3cb-a0f3-4663-cecc-08dc0c8c2aca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 18:45:33.4475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DgtBanXp1aPUTpVOQCKI03NjmgywPpsofbEy3nxQ8SpHS1tnngDjuhtqWLA2FFN3nF4CTC9vZj2OFtmzou6Nm/QcXHWnZDFrCrlzKZu0nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 02, 2024 at 07:17:22PM -0800, Ghimiray, Himal Prasad wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: 03 January 2024 06:46
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
> > 
> > On Tue, Jan 02, 2024 at 10:21:42PM +0530, Himal Prasad Ghimiray wrote:
> > > Use XE_CACHE_WB pat index by default on xe2 platforms and use
> > > XE_CACHE_NONE_COMPRESSION pat index only if buffer supports
> > > compression and indirect access of flat ccs.
> > >
> > > Fixes the broken "xe_migrate_test kunit test" on LNL.
> > 
> > How/why does it fix it?  Explaining why this is the right thing to do is more
> > important than just stating that a test changes from red to green.
> > Does the WB vs UC even matter here or is it actually the coherency with the
> > CPU cache that matters (meaning UC+1way would also work, but
> > WB+NonCoh would fail)?
> 
> AFAIU the coherency with CPU cache is main thing that matters here. It shouldn't be really related to 
> WB vs UC.  The pat table entry associated with XE_CACHE_WB is coherent whereas XE_CACHE_NONE is 
> NonCoherent.  UC+1way would also work, but WB+NonCoh would fail , I had tested using pat index as 0 and 5 respectively.

If non-coherent is the problem, then how does the compressed case work,
where we always get a non-coherent PAT?  Is the actual problem just that
we're hardcoding a setting in general?  Don't we already have a PAT
index (selected by userspace at bind time) that we should be using?  Or
am I misunderstanding what the PTE's we're emitting here are intended
for?


Matt

> 
> BR
> Himal
> 
> > 
> > 
> > Matt
> > 
> > >
> > > v2
> > > - Fix the argument to emit_pte, pass the bool directly. (Thomas)
> > >
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c index adf1dab5eba2..e1a849d74826
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -439,7 +439,7 @@ static void emit_pte(struct xe_migrate *m,
> > >  	/* Indirect access needs compression enabled uncached PAT index */
> > >  	if (GRAPHICS_VERx100(xe) >= 2000)
> > >  		pat_index = is_comp_pte ? xe-
> > >pat.idx[XE_CACHE_NONE_COMPRESSION] :
> > > -					  xe->pat.idx[XE_CACHE_NONE];
> > > +					  xe->pat.idx[XE_CACHE_WB];
> > >  	else
> > >  		pat_index = xe->pat.idx[XE_CACHE_WB];
> > >
> > > @@ -729,14 +729,14 @@ struct dma_fence *xe_migrate_copy(struct
> > xe_migrate *m,
> > >  		}
> > >
> > >  		if (!src_is_vram)
> > > -			emit_pte(m, bb, src_L0_pt, src_is_vram, true,
> > &src_it, src_L0,
> > > -				 src_bo);
> > > +			emit_pte(m, bb, src_L0_pt, src_is_vram,
> > copy_system_ccs,
> > > +				 &src_it, src_L0, src_bo);
> > >  		else
> > >  			xe_res_next(&src_it, src_L0);
> > >
> > >  		if (!dst_is_vram)
> > > -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true,
> > &dst_it, src_L0,
> > > -				 dst_bo);
> > > +			emit_pte(m, bb, dst_L0_pt, dst_is_vram,
> > copy_system_ccs,
> > > +				 &dst_it, src_L0, dst_bo);
> > >  		else
> > >  			xe_res_next(&dst_it, src_L0);
> > >
> > > @@ -978,8 +978,8 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> > >  		size -= clear_L0;
> > >  		/* Preemption is enabled again by the ring ops. */
> > >  		if (!clear_vram) {
> > > -			emit_pte(m, bb, clear_L0_pt, clear_vram, true,
> > &src_it, clear_L0,
> > > -				 bo);
> > > +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > clear_system_ccs,
> > > +				 &src_it, clear_L0, bo);
> > >  		} else {
> > >  			xe_res_next(&src_it, clear_L0);
> > >  		}
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
