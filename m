Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B37EC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C5C10E8C8;
	Tue, 19 Mar 2024 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qv1hVBjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F35910E8C8
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 17:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710871148; x=1742407148;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bEEmLZhLhHP7EcN3DhlhkTLYqsG5jrElU8opluRwaAE=;
 b=Qv1hVBjSrRSOcQfPhbmK734tFX2RJrWTOFERd1R6C7cgLG3scda+nXoL
 3tyun/5qXvY7tlPooBC87H00jYjYDb72FlRTxAKzc1D/r4m21oAqublu+
 TV2H/6sSWwrtgrc7YUMMH7BI9PxaYG4uLTUucd1QyTMwCqD8O9J/CVhEL
 Htl8ab1QtWCHqW6MnHSjJOlh8U4vhEbnO7SsaUC91psoAlQzCkBjbMzXU
 lXlzne7QybR3uihd9UjxHWAy7dBEmexrwAgUalQY97yq4smC99RuvkNtD
 DjCRrqKZ8mxLKpw4H73qKeHkcsCM5N+cZh1tCU3EFHStRyN7ApJ6vNLFf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5637999"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5637999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13922914"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 10:59:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 10:59:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 10:59:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 10:59:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 10:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hsm2H5cY4LvCgS18LCg7PxkXeO7Ms9HJ+9Bc+VibsSBubyYbPfipXBAlvTNHzlU5ZmRnKvHzPB55WIs8p4epjOd3FH2dHRNCuLJATKQPdUDW+3pkIm5ibP26TdchNf6HOVCUvz6J7w/6LwVUCrJneJRC7anf/KV/Q2e+w+lF4LzuqO+haa1tRqIawpSzLDX5Mjzd/BS/IbJ2elv+BKoV4pT42KHWE6CcjS2pt97OrVDZJF8jsNC5k4G0Z7+Vs1W80WGUNpxHfAzczY11lWfmjc2AXunyTQFXIwFTYoF9UP2CvuNIVbbLujyjV4QkJLGC5RzxPDXfp1o3/oodox1oyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIU/XAVv8uYybjX9gHZ32b45dD+IDkif53b9fUC8rJc=;
 b=hNvKnD2mrGUDDN9nGqC1hWsE/eg7WJbCooPQu4Hw92H3WYwclGkdUM0DfuHE0lEfDmGBJJMTmQ4s8dp3Q4bxgNDTnFK5U3ODStk59DSwelO2o/xVXUrqIhvDN5Z7e3py1z1SJSi0x4q9FAbaob83oDWmt/sbfwDQmqlGmCNgUWmvKhYGfS6Zgm3fOIBOjThrRvH5VaJC2spl5EkkwEaFJocM+6T6AF4eidBeHcONKLpJo1/BLurQR4AhMArEDJ3ameWV5E8NbmgLGhZioyZUd1yoELDoWvINo9QZTPFYuEbiE+wDQ4Va+tE+VG2irXvLlOAsRQGgLwOynTrTdOIZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 19 Mar
 2024 17:59:04 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Tue, 19 Mar 2024
 17:59:04 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Hellstrom, Thomas"
 <thomas.hellstrom@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 6/8] drm/xe: Helper to populate a userptr or hmmptr
Thread-Topic: [PATCH 6/8] drm/xe: Helper to populate a userptr or hmmptr
Thread-Index: AQHaeacyrFZKAg1vZUuLgzbG6NtpqLE+3oGAgABoxICAABIBIA==
Date: Tue, 19 Mar 2024 17:59:04 +0000
Message-ID: <SA1PR11MB6991F42090E3F51D38057EA3922C2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240319025511.1598354-1-oak.zeng@intel.com>
 <20240319025511.1598354-7-oak.zeng@intel.com>
 <79823ba6edcfeed9010ef2d390e4cc9765e7191d.camel@intel.com>
 <ZfnB5RMGfzAVPwoR@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfnB5RMGfzAVPwoR@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS7PR11MB7951:EE_
x-ms-office365-filtering-correlation-id: bb7fe9af-2ec6-49e2-b6cb-08dc483e43c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n01Y95aJ6wd68QPh2zoezK01vmgG9ChR58j9JbmJIh/01nz3PJJVTkhuZRjNjDDZFmnGXB4vIcAN25LLjzf1DeJb4NfbWoOfNtgHU/crgkd+xOL1pRNO5v9oU4qsB4H4KTlglv5M1pXEIbfAPP+v5HWAZHEy4PwiPEVkxwRfjWNLhqfPW2V9XSGXsPe6RtK/a3OGGxQd8HbKcRpdd2xbR8vDsfujTWUqAciMawWUHh3L4o1g//CDUmNGL7V1w/u+/64Zm8HaNsr3RcNBx8orMIjpHE/SI6MGv/GJCa28aJOLswIwtRf539GX8qjwx4JWoZ9UVmMXGLCXboPfRyf8RzLGqcVTerOrYk6zhaovcZYmCjoKcN6hHmAseaKhCUBH8zABeqQs8PsiIw2rocdSRK7OQY85vdDkoKVkQft6ldgaL/FrsTWIqvZZKDjum14VDnqJZ/GIAznj2doG2t+I2co2kNudYmWzzfvzcjaRPm84nAPAMdnj+jV7ypiNDyz3oRNinmXxVF/DIW3fgYKAEruNyPkVobNvLaSMEHe3jOjBlStxYLiiaeipoir6yn0PoyChkFmy3IVH3BwrvfGVQROxPTdncdV3FaF6+xOwcb1KODrfTsIfLn18AxlvvHBmu7YCSvTbtjujy1UXEDCy8Asu/w1QnctEf7QpaiMq+KI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4qOfTdnV9v5zs8rZ9yylefGDtzAOlnU0GaCyvfq00FwrqiJ7iVflxuNYVl?=
 =?iso-8859-1?Q?AQFCYKB334Bx7LzJzWMZPrjfcKNHLdH/yBI4q++zeyXk/BIuK4bll2DwB5?=
 =?iso-8859-1?Q?57XuvR/lJCCHXyBFU9Bobv1oN6cSCAlGZfKsQPSg1pmw15OTrhELew92xe?=
 =?iso-8859-1?Q?vOPfitJv9tEXqyBDgaOSbX2vVwMgg38q5XppLWmWG3sUGNzPX9z3iJExd/?=
 =?iso-8859-1?Q?0MxbJd1Nu9R2AW605XEg0oU2fgbIf12CM/R7S2PqDU4tmNszK4U+FSIv1z?=
 =?iso-8859-1?Q?FSPX2xL/3QU029AykmUgvesOA42AqeY0H0lnzIcTOsu5EjL5IrFlO5AAJh?=
 =?iso-8859-1?Q?stmc9HjzuhlKLtKdZUTxYIwV8HpCGwZdCTXKZrOQO45NYDI6mO+LKiTs8N?=
 =?iso-8859-1?Q?e5LC4sLqugRuWtbYzrcEi5OaxEe0WAKJ5hJ3A+A4ndyLO+n6HKdKuocGCk?=
 =?iso-8859-1?Q?QkpYdRdPRu2YoEnjerZsRfAFV2aZvjAbA61SYRsjCVhxIsAK4QPMrvPedA?=
 =?iso-8859-1?Q?k3BJBYdXkFCfE+vGPF+i9LEvD6n1ST/X53SVZLoiZQbeZ3dqnYa977k2dc?=
 =?iso-8859-1?Q?QgeRwdgBJrV0R4eGwcz8TM/x3MyTji5fPXNLenB61VfY5tfmdPnmv0Avw7?=
 =?iso-8859-1?Q?AGQA3MEvT7pmIyUcz+xnMaIJRmHGR2mE98YEhgFvl1Mp50nKOrSMff/IsR?=
 =?iso-8859-1?Q?BMoHFRP4NpDBBOgCWoXAQ55Q9CmI196KCBJ7yY8+zjIG7iRV+lS6+RodJ+?=
 =?iso-8859-1?Q?l46kaBNYbEt4UnRdgsp1cPxcNCc3XGk2zwtf2YSeaUIvk1exlqNHjLf3Qo?=
 =?iso-8859-1?Q?bBISn1DodO3JM/9O4IW8W+3J1AQ3hjUDVgX9WAb8VsOui4rF3nMW6QIbrM?=
 =?iso-8859-1?Q?5QitEe1x9LtvrvNw/GyjHGU5CCzolfjsqaKa85U/TmVpz1AXyzQEruvYXK?=
 =?iso-8859-1?Q?FwhHsjgtFOZ8rhTvYg6FQBRzkPviPMzckUp7ULjXrP46bLb+ZZt+QIwEK8?=
 =?iso-8859-1?Q?6IP9S+8+XS6tv/hRVwQY5UeN1oxFH9u09tK/JlaUv3aKlDslo0lcw5Ivza?=
 =?iso-8859-1?Q?ezumZtw4+jjjCkxlJLL9MOgW7lQP9a+pOUUIEh5NnFuRbodSKGipsuiXBD?=
 =?iso-8859-1?Q?6aOcANyj2kUe5W2G/iQZmO9YF4/X6AplctqofHSo3Edki4s2W4RHmfC2Eo?=
 =?iso-8859-1?Q?HmrrqNIGo4KNbsNb/52u8dxTl4phtu84Frks9LutM71/w/cHuDktvM98o5?=
 =?iso-8859-1?Q?CX8XkSWfgeQ0a8MsFf4PmtvYvAcQtho7I712hu+mii/3oNr7kAQQdIxK4n?=
 =?iso-8859-1?Q?ifWyGdNgQUfjZrLjp0yyYt6cJUCC2b5lXJ/go1B9s2583QKO+pcuHOzMkp?=
 =?iso-8859-1?Q?Pl+UdzXjuhjUwPj4DdKvGNbrGRRAgdjo2mFlIyjMPWMM+yvuRJUIohljGz?=
 =?iso-8859-1?Q?DcYWHUtDvRJ3sV2zhd1MLkKxjou39dyY+0xgEK17PbhGNMTIBuTV5ad6Tk?=
 =?iso-8859-1?Q?ioHEULCBbXk8h3FelBvWLixmJ6bvKMt6WnHsNcy1TDuA0r8SwvZmqjl0TJ?=
 =?iso-8859-1?Q?ip7SVeOe4aVBz/2v9uVSnLpnDUBjqED3gYFqndMidxbam39UFNbyjoAnFz?=
 =?iso-8859-1?Q?FKHcs2Xo2saUw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7fe9af-2ec6-49e2-b6cb-08dc483e43c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 17:59:04.1842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKBfNJZ49JHprqMZR1faB8iCRuWKbE8wCmGF1yeR/Uz+R5YxmrDS6jZd6fdN4SN9Bk6Jdl9xnVlm/dO8qptmvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Tuesday, March 19, 2024 12:49 PM
> To: Hellstrom, Thomas <thomas.hellstrom@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Zeng, Oak <oak.zeng@intel.com>; Welty=
,
> Brian <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 6/8] drm/xe: Helper to populate a userptr or hmmptr
>=20
> On Tue, Mar 19, 2024 at 04:33:39AM -0600, Hellstrom, Thomas wrote:
> > On Mon, 2024-03-18 at 22:55 -0400, Oak Zeng wrote:
> > > Add a helper function xe_userptr_populate_range to populate
> > > a a userptr or hmmptr range. This functions calls hmm_range_fault
> > > to read CPU page tables and populate all pfns/pages of this
> > > virtual address range.
> > >
> > > If the populated page is system memory page, dma-mapping is performed
> > > to get a dma-address which can be used later for GPU to access pages.
> > >
> > > If the populated page is device private page, we calculate the dpa (
> > > device physical address) of the page.
> > >
> > > The dma-address or dpa is then saved in userptr's sg table. This is
> > > prepare work to replace the get_user_pages_fast code in userptr code
> > > path. The helper function will also be used to populate hmmptr later.
> > >
> > > v1: Address review comments:
> > > =A0=A0=A0 separate a npage_in_range function (Matt)
> > > =A0=A0=A0 reparameterize function xe_userptr_populate_range function =
(Matt)
> > > =A0=A0=A0 move mmu_interval_read_begin() call into while loop (Thomas=
)
> > > =A0=A0=A0 s/mark_range_accessed/xe_mark_range_accessed (Thomas)
> > > =A0=A0=A0 use set_page_dirty_lock (vs set_page_dirty) (Thomas)
> > > =A0=A0=A0 move a few checking in xe_vma_userptr_pin_pages to hmm.c (M=
att)
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Co-developed-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > ---
> > > =A0drivers/gpu/drm/xe/Makefile |=A0=A0 1 +
> > > =A0drivers/gpu/drm/xe/xe_hmm.c | 231
> > > ++++++++++++++++++++++++++++++++++++
> > > =A0drivers/gpu/drm/xe/xe_hmm.h |=A0 10 ++
> > > =A03 files changed, 242 insertions(+)
> > > =A0create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
> > > =A0create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> > >
> > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > b/drivers/gpu/drm/xe/Makefile
> > > index e2ec6d1375c0..52300de1e86f 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -101,6 +101,7 @@ xe-y +=3D xe_bb.o \
> > > =A0	xe_guc_pc.o \
> > > =A0	xe_guc_submit.o \
> > > =A0	xe_heci_gsc.o \
> > > +	xe_hmm.o \
> > > =A0	xe_hw_engine.o \
> > > =A0	xe_hw_engine_class_sysfs.o \
> > > =A0	xe_hw_fence.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_hmm.c
> > > b/drivers/gpu/drm/xe/xe_hmm.c
> > > new file mode 100644
> > > index 000000000000..305e3f2e659b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_hmm.c
> > > @@ -0,0 +1,231 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright =A9 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/mmu_notifier.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/memremap.h>
> > > +#include <linux/swap.h>
> > > +#include <linux/hmm.h>
> > > +#include <linux/mm.h>
> > > +#include "xe_hmm.h"
> > > +#include "xe_svm.h"
> > > +#include "xe_vm.h"
> > > +
> > > +static inline u64 npages_in_range(unsigned long start, unsigned long
> > > end)
> > > +{
> > > +	return ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) +
> > > 1;
> > > +}
> > > +
> > > +/**
> > > + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> > > + * have such information for memory eviction or write back to
> > > + * hard disk
> > > + *
> > > + * @range: the range to mark
> > > + * @write: if write to this range, we mark pages in this range
> > > + * as dirty
> > > + */
> > > +static void xe_mark_range_accessed(struct hmm_range *range, bool
> > > write)
> > > +{
> > > +	struct page *page;
> > > +	u64 i, npages;
> > > +
> > > +	npages =3D npages_in_range(range->start, range->end);
> > > +	for (i =3D 0; i < npages; i++) {
> > > +		page =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> > > +		if (write)
> > > +			set_page_dirty_lock(page);
> > > +
> > > +		mark_page_accessed(page);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * build_sg() - build a scatter gather table for all the physical
> > > pages/pfn
> > > + * in a hmm_range. dma-address is save in sg table and will be used
> > > to program
> > > + * GPU page table later.
> > > + *
> > > + * @xe: the xe device who will access the dma-address in sg table
> > > + * @range: the hmm range that we build the sg table from. range-
> > > >hmm_pfns[]
> > > + * has the pfn numbers of pages that back up this hmm address range.
> > > + * @st: pointer to the sg table.
> > > + * @write: whether we write to this range. This decides dma map
> > > direction
> > > + * for system pages. If write we map it bi-diretional; otherwise
> > > + * DMA_TO_DEVICE
> > > + *
> > > + * All the contiguous pfns will be collapsed into one entry in
> > > + * the scatter gather table. This is for the convenience of
> > > + * later on operations to bind address range to GPU page table.
> > > + *
> > > + * The dma_address in the sg table will later be used by GPU to
> > > + * access memory. So if the memory is system memory, we need to
> > > + * do a dma-mapping so it can be accessed by GPU/DMA. If the memory
> > > + * is GPU local memory (of the GPU who is going to access memory),
> > > + * we need gpu dpa (device physical address), and there is no need
> > > + * of dma-mapping.
> > > + *
> > > + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> > > + * memory. Add this when you support p2p
> > > + *
> > > + * This function allocates the storage of the sg table. It is
> > > + * caller's responsibility to free it calling sg_free_table.
> > > + *
> > > + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> > > + */
> > > +static int build_sg(struct xe_device *xe, struct hmm_range *range,
> > > +			=A0=A0=A0=A0 struct sg_table *st, bool write)
> > > +{
> > > +	struct device *dev =3D xe->drm.dev;
> > > +	struct scatterlist *sg;
> > > +	u64 i, npages;
> > > +
> > > +	sg =3D NULL;
> > > +	st->nents =3D 0;
> > > +	npages =3D npages_in_range(range->start, range->end);
> > > +
> > > +	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
> > > +		return -ENOMEM;
> > > +
> > > +	for (i =3D 0; i < npages; i++) {
> > > +		struct page *page;
> > > +		unsigned long addr;
> > > +		struct xe_mem_region *mr;
> > > +
> > > +		page =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> > > +		if (is_device_private_page(page)) {
> > > +			mr =3D xe_page_to_mem_region(page);
> > > +			addr =3D xe_mem_region_pfn_to_dpa(mr, range-
> > > >hmm_pfns[i]);
> > > +		} else {
> > > +			addr =3D dma_map_page(dev, page, 0, PAGE_SIZE,
> > > +					write ? DMA_BIDIRECTIONAL :
> > > DMA_TO_DEVICE);
> > > +		}
> >
> > The dma_map_page call here essentially stops the iommu from coalescing
> > the page-table into contigous iommu VAs, and stops us from using huge
> > page-table-entries for the PPGTT. IMO we should investigate whether we
> > could build a single scatter-gather using sg_alloc_table_from_pages()
> > or perhaps look at sg_alloc_append_table_from_pages(), and then use
> > dma_map_sg() on contiguous chunks of system pages within that sg-table.
> >
>=20
> Yes, this was my concern as well. I suggested we continue to use
> sg_alloc_table_from_pages_segment + dma_map_sgtable with only system
> support for now as device private page tables are still unused at the
> moment. That suggestion, among, other seems to have been ignored. I'm
> referring to my reply in [1], it would be nice to see those suggestions
> followed.
>=20
> Thomas is right about huge page-table-entries in the PPGTT. Add some
> printks if you need to see this in action (xe_pt_stage_bind_entry,
> xe_pt_hugepte_possible returning true).
>=20
> Make sure the IOMMU is enabled (intel_iommu=3Don on kernel cmdline) and r=
un:
>=20
> xe_vm.large-userptr-binds-16777216 -> This will use 8x 2MB page tables on=
 tip
> xe_vm.large-userptr-binds-2147483648 -> This will use 2x 1GB page tables =
on tip
>=20
> With your series it will likely use 4k pages for everything.
>=20
> Matt
>=20
> [1]
> https://patchwork.freedesktop.org/patch/582859/?series=3D131117&rev=3D1#c=
omm
> ent_1064237

Damn, this comment was indeed overlooked...

Yes, both yours and Thomas' comments make a lot of sense to me. Let me foll=
ow up.

Oak

>=20
> > /Thomas
> >
> >
> > > +
> > > +		if (sg && (addr =3D=3D (sg_dma_address(sg) + sg-
> > > >length))) {
> > > +			sg->length +=3D PAGE_SIZE;
> > > +			sg_dma_len(sg) +=3D PAGE_SIZE;
> > > +			continue;
> > > +		}
> > > +
> > > +		sg =3D=A0 sg ? sg_next(sg) : st->sgl;
> > > +		sg_dma_address(sg) =3D addr;
> > > +		sg_dma_len(sg) =3D PAGE_SIZE;
> > > +		sg->length =3D PAGE_SIZE;
> > > +		st->nents++;
> > > +	}
> > > +
> > > +	sg_mark_end(sg);
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_userptr_populate_range() - Populate physical pages of a
> > > virtual
> > > + * address range
> > > + *
> > > + * @uvma: userptr vma which has information of the range to
> > > populate.
> > > + *
> > > + * This function populate the physical pages of a virtual
> > > + * address range. The populated physical pages is saved in
> > > + * userptr's sg table. It is similar to get_user_pages but call
> > > + * hmm_range_fault.
> > > + *
> > > + * This function also read mmu notifier sequence # (
> > > + * mmu_interval_read_begin), for the purpose of later
> > > + * comparison (through mmu_interval_read_retry).
> > > + *
> > > + * This must be called with mmap read or write lock held.
> > > + *
> > > + * This function allocates the storage of the userptr sg table.
> > > + * It is caller's responsibility to free it calling sg_free_table.
> > > + *
> > > + * returns: 0 for succuss; negative error no on failure
> > > + */
> > > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
> > > +{
> > > +	unsigned long timeout =3D
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long *pfns, flags =3D HMM_PFN_REQ_FAULT;
> > > +	struct xe_userptr *userptr;
> > > +	struct xe_vma *vma =3D &uvma->vma;
> > > +	u64 start =3D xe_vma_userptr(vma);
> > > +	u64 end =3D start + xe_vma_size(vma);
> > > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > > +	struct hmm_range hmm_range;
> > > +	bool write =3D !xe_vma_read_only(vma);
> > > +	bool in_kthread =3D !current->mm;
> > > +	u64 npages;
> > > +	int ret;
> > > +
> > > +	userptr =3D &uvma->userptr;
> > > +	mmap_assert_locked(userptr->notifier.mm);
> > > +
> > > +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> > > +		return 0;
> > > +
> > > +	npages =3D npages_in_range(start, end);
> > > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > > +	if (unlikely(!pfns))
> > > +		return -ENOMEM;
> > > +
> > > +	if (write)
> > > +		flags |=3D HMM_PFN_REQ_WRITE;
> > > +
> > > +	if (in_kthread) {
> > > +		if (!mmget_not_zero(userptr->notifier.mm)) {
> > > +			ret =3D -EFAULT;
> > > +			goto free_pfns;
> > > +		}
> > > +		kthread_use_mm(userptr->notifier.mm);
> > > +	}
> > > +
> > > +	memset64((u64 *)pfns, (u64)flags, npages);
> > > +	hmm_range.hmm_pfns =3D pfns;
> > > +	hmm_range.notifier =3D &userptr->notifier;
> > > +	hmm_range.start =3D start;
> > > +	hmm_range.end =3D end;
> > > +	hmm_range.pfn_flags_mask =3D HMM_PFN_REQ_FAULT |
> > > HMM_PFN_REQ_WRITE;
> > > +	/**
> > > +	 * FIXME:
> > > +	 * Set the the dev_private_owner can prevent hmm_range_fault
> > > to fault
> > > +	 * in the device private pages owned by caller. See function
> > > +	 * hmm_vma_handle_pte. In multiple GPU case, this should be
> > > set to the
> > > +	 * device owner of the best migration destination. e.g.,
> > > device0/vm0
> > > +	 * has a page fault, but we have determined the best
> > > placement of
> > > +	 * the fault address should be on device1, we should set
> > > below to
> > > +	 * device1 instead of device0.
> > > +	 */
> > > +	hmm_range.dev_private_owner =3D vm->xe;
> > > +
> > > +	while (true) {
> > > +		hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(&userptr->notifier);
> > > +		ret =3D hmm_range_fault(&hmm_range);
> > > +		if (time_after(jiffies, timeout))
> > > +			break;
> > > +
> > > +		if (ret =3D=3D -EBUSY)
> > > +			continue;
> > > +		break;
> > > +	}
> > > +
> > > +	if (in_kthread) {
> > > +		kthread_unuse_mm(userptr->notifier.mm);
> > > +		mmput(userptr->notifier.mm);
> > > +	}
> > > +
> > > +	if (ret)
> > > +		goto free_pfns;
> > > +
> > > +	ret =3D build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> > > +	if (ret)
> > > +		goto free_pfns;
> > > +
> > > +	xe_mark_range_accessed(&hmm_range, write);
> > > +	userptr->sg =3D &userptr->sgt;
> > > +	userptr->notifier_seq =3D hmm_range.notifier_seq;
> > > +
> > > +free_pfns:
> > > +	kvfree(pfns);
> > > +	return ret;
> > > +}
> > > +
> > > diff --git a/drivers/gpu/drm/xe/xe_hmm.h
> > > b/drivers/gpu/drm/xe/xe_hmm.h
> > > new file mode 100644
> > > index 000000000000..fa5ddc11f10b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_hmm.h
> > > @@ -0,0 +1,10 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright =A9 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +struct xe_userptr_vma;
> > > +
> > > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
> >
