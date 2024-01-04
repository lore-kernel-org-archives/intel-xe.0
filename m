Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD0FC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 06:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B9F10E393;
	Thu,  4 Jan 2024 06:16:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3598910E393
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 06:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704348994; x=1735884994;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v1Y40BkqwdPviLuMYJkNMjta/w66YNH08Vzklp7DH40=;
 b=MGV/MSR5W7CipzatPPe+ZCXzEzmXB9dMPvkJ93nOOQa9KWCpWcpThgb/
 ZcmTOnh1CTeer5bEXA7bh7Hub5Hm4bZYwJNBCWC1UzEz8oPGO8d4hLe/D
 Am9aj6IimqgdAIqDPPfSHpmpaTVMMj5bV8xrrh61R7JospMVxj9i7AhRc
 velg9NPIL15uaKpeF7AIkZbOZ6yEq4RkpCBiU7rlHrFVU4ty6jGlGn1+F
 E+Sn5X0/VC7DJAvPj6yTdYLjexzd3wg/JkxyV7xIwAqsJUibr19CuZ+8y
 +/2Vv0575ygC6AcBnZK1KU97sCMwdmLXNBbf/XcKZcZRvYguqpMAODKa7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="428297013"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="428297013"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 22:16:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="783758788"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="783758788"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 22:16:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 22:16:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 22:16:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 22:16:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5V8BK+f29sTcw+OJ1eI52zrdda6mbXMd/xhj56NRgubWn8t3C5cikrKuSW3N9O3sn4k95N6RLCDx6TnbnVmCHENKwPwa91XePcHWaPGpyrsJ4M6UICC6HsfoeKoEkM4HYf/bR9LpAML5kcltFv1ZscyEib71ZtbsyN+da4GkE1ioGcZNeNJykEwpVoOQlqLiA/+RnUb4Z2O6+aW7adKL/OAKw0PLIyk+a9L/FCvPnCceDe1BzL+BjkKGQ97JP0bpUoJaX5TUsFpVJz0HWfnoiHfw1CN4hY2sbbGXxn+qBCn8/Xu6hodrtlkvorxxxUXh7OAlEARdrBiPYhjVCHjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5JrddaBClDphsAyuk8GCfyRAGcnboz6JGwGrhGBq+c=;
 b=gYBNMQpHRccaphobmT8Mb6pNM+fTL1QHsn95IMNfFFbUtJwZsre1SVDEBXY4S/5lNwzaauaD3lw+kjnUaPaHayaR00VvT4cbeWp270GpS2HKPEghuA7fW4T8cs/PFHvoODuQpbMf4nzxtyT31Xykjhhj5K09pi3Ada752RVIin0FygZiCH/XNdi7kOOCkXO8f1DzA11LY+2uTGNmtW8EkvIoK8KxBm+A9rp0Aa4mdX5d4lX22atgPa5VQtqSfvH8Sp+iqfQaBmq3a/ilbIZCpaCYOR/jk79lgUrMBZhu0MVfd/ncvr6RIibDG14bUU0mCSk1U/q5LFKfWMUlYxS1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 06:16:25 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957%5]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 06:16:25 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
Thread-Topic: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
Thread-Index: AQHaPZpnO4kWJvMpgk2HwibGJC1Dq7DHSbMAgAAdw0CAAQdjgIAAvjHA
Date: Thu, 4 Jan 2024 06:16:25 +0000
Message-ID: <MW4PR11MB7056CC6EC4FBCA11F8C178F7B367A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240102165142.853141-1-himal.prasad.ghimiray@intel.com>
 <20240103011618.GT1327160@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB70565545C05F1C9238438949B360A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <20240103184531.GD3529480@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240103184531.GD3529480@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SN7PR11MB6677:EE_
x-ms-office365-filtering-correlation-id: a8d3ec35-a446-4eaf-7e4e-08dc0cecae7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vSIFMrrkm8ksUp+wZEnQcbs35nuaXBP5HE+eUWUfA5oHrNASUJC1LB2solXGEVR53uq/xatjjXitWvVwLiXbu4MhKqQMx6olkaWPsiWF6BdGmxhYqmdqKJ+obobQAIPAO9D0aZ0cqQ8OkhvF93g1p0WXrnlcY8q82M87XNlzjnYERK63DbxP/sJaVKjroSA01eOM8LLgtYLV93IdE3zCtCLDnX2rwOjbeAr/FxKrtWrQ+VTP5Ktka+xaeonek48f3Bnq8PkwJiy92wSnnHFAz/fqaiNZ9XeU25TaiCc0QZ9PpBqtQPYxgnLRohV6ZgrpXCKBj+hJNx/+7uvHZE9V0QgBrPH3vu30WrIBBd67K1EWdZVRN138+rbSWLcS42ksn1K0Go4Mw93OHbAHRe5kcqRHEJ9+j/82pYtZI97Qp3cokjQFAtmXl/YOqci33ZV0m3yeOw+HfiLx58uAUufLQ2x2iJvkvDFLLzRPlGtN5X9iUISIfDrT8mzyI1qh8BBHASMe1GzCWlGSMLdG+KuWZ9t8BiC+3hCSJRMyIx8NJjy9uOwJJdP6MnteEiRtTEk53xDVJ8y+NjaFaqrKWPwAentMV/q8DTBnpZA6aEvkNuwNhLLg7HfT39nrjDI0FwF9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(2906002)(4326008)(6862004)(316002)(8936002)(8676002)(52536014)(9686003)(66574015)(66556008)(66476007)(6636002)(64756008)(55016003)(66446008)(76116006)(66946007)(26005)(83380400001)(41300700001)(38100700002)(122000001)(82960400001)(86362001)(33656002)(6506007)(7696005)(478600001)(71200400001)(53546011)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?muFtEfsJmOybaYyBAtP/ncNhERd6Nanod3FmmiXXcJfSMUo3yEsKCTqVLb?=
 =?iso-8859-1?Q?quwyuVV+AenqhfWUKO68aiwux7n99KNDMAGZFkd+WiIBg2+f8ZzDnt0kRs?=
 =?iso-8859-1?Q?NecyrrdHJU9O6GwCRzPaDVXe3q30+S2OF1zE8NajHp1nIZYw9HUBMAaLf6?=
 =?iso-8859-1?Q?3Lxqd5eNBFqllIX08Y6VQ9L3e2A/Lk9wXpuFUNdEjbFiO5Tbjg0y0wMRNq?=
 =?iso-8859-1?Q?YEPaIJ2J/TgkNY0Adqzp82+SWPXMN8bJW5xKT2aatDUuzlNqV/q8ixYOn/?=
 =?iso-8859-1?Q?s4NuW/Cga34jfU92ceBuZFJWx196DdxmptgnMHwumHTojB3ZJEee+JY3+M?=
 =?iso-8859-1?Q?NA5xohANOmPFjcPKyBsiSL/fdtxSiRTmWa6UKYHFhAMFrOLzgWZxzawbfu?=
 =?iso-8859-1?Q?Y8DPWUM1goR2pRsWyTo1HB0Qt0Ob5bsOBloO9ilp/BGT/pLUjPU5PZd7UU?=
 =?iso-8859-1?Q?Og2M8onIGALxE73Awh36tHgRhFUD+ZnjCG0akxQnuY/wEMz3iUoz4Txfzw?=
 =?iso-8859-1?Q?AGSvi8An4wcO7cElu8wvjt5JGopsTFMmQ1oGp+XuLCeWNPcHLnghJIjVHP?=
 =?iso-8859-1?Q?pfV0OC4reiRwuJAn5TmIwYFY8Tw5Eo7FNcnYGi44w1YbKHQpxhvXSp+BsL?=
 =?iso-8859-1?Q?B8Nstai9SzNaktEBGq8vJ4PC5h5PqwPD/a4Fu4HujmKg78FXCgVq6ObBj0?=
 =?iso-8859-1?Q?pbzGfnt0F2+gRdj7SWYjGcICZ2RGzTDJzaTfpnRvXnD5gek6qnokG/NtJL?=
 =?iso-8859-1?Q?E6lV+xaZzYTk6nYGhxPMxTGl4EVXm6FAb/EpWATQo/xJafc9faCWPm6gYD?=
 =?iso-8859-1?Q?b1Xui+LbbLrz3JaejnIKV4wB3+6GzlX3FXZfpd+iYpqnHkvp1z2qU83k6Y?=
 =?iso-8859-1?Q?vwhIF43AdQaZ9xHqOgtO6eTBnbTNidWjpgWrsXUPgRdjzHYc0mZGQE3L7L?=
 =?iso-8859-1?Q?DQv0CtcTidRsiTKN/1/nfJg7f5JXsyAq00WahJsw08IwGQ5yW5ObZa5wUy?=
 =?iso-8859-1?Q?9U3P+oFI2W1tLoqYtELMikINgBGvGbxex5MEvdiW+7k3/Y0nbXZKlKbAXB?=
 =?iso-8859-1?Q?HRHw4OE9FfG6k5ORqsatcqu8f7bujkZ5F3lG6VzZ/UMMeHYxJJYmmlmtbZ?=
 =?iso-8859-1?Q?ku3ieRQJ9NVzLgm38xV0PNySvXabQ3PSqTAu010DlDQxM6klJ8NxMZ7bX2?=
 =?iso-8859-1?Q?8pv41lH1/PlK3dSrPCY6fsBh+e5TqKkjl3OSd2mpjEck7kNZQVWRAnygiS?=
 =?iso-8859-1?Q?354SfIWGwuwnEDAStcVywIS1+lk3w80dgxAfhYOSzLA1KFq0K3h4Pg2F8E?=
 =?iso-8859-1?Q?NaAXkEiyy2zbRiYvhmIYH5bPUAS2nPdKhzObJc2gugijJ3NmRRz8IAxLcy?=
 =?iso-8859-1?Q?9P9Oe4VYRt74uXU0Y32X80eiD+oxxHnnuPhF2HWrmCRFChkWCX47YJHMKD?=
 =?iso-8859-1?Q?Yahx0uLhDsbOiIQT+/U05ufjqq2XiKb+vMblJnj+sKpQ2RntCF+m7SA46r?=
 =?iso-8859-1?Q?1OQgl8vnQHb+iAAMTB5qc6RlJhc1k3bBhGSzimwsiNdrHWIyfB+Obihblx?=
 =?iso-8859-1?Q?InswPBHB9+J9f3ksQ7PidI6p2Fv5Vz5SrTiwY6rxPYw74O6+xpjW/Fj6MH?=
 =?iso-8859-1?Q?0HGGDm8Thz5u5KfTfe7kAeLS+oh7oDdk27dokCg6OzUX79RKKs8q5ptA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d3ec35-a446-4eaf-7e4e-08dc0cecae7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 06:16:25.8286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sBv0evYxWKurkR5F6SQqwfM/NYfwuzcOrnt2ul+Euk8u04vqPzEjCddV5ou+yy5+7eMJlCkVHhAuzipZOjfOpiqLRjlZis02cRZxbHPS/cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6677
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 04 January 2024 00:16
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
>=20
> On Tue, Jan 02, 2024 at 07:17:22PM -0800, Ghimiray, Himal Prasad wrote:
> >
> >
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: 03 January 2024 06:46
> > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
> > >
> > > On Tue, Jan 02, 2024 at 10:21:42PM +0530, Himal Prasad Ghimiray wrote=
:
> > > > Use XE_CACHE_WB pat index by default on xe2 platforms and use
> > > > XE_CACHE_NONE_COMPRESSION pat index only if buffer supports
> > > > compression and indirect access of flat ccs.
> > > >
> > > > Fixes the broken "xe_migrate_test kunit test" on LNL.
> > >
> > > How/why does it fix it?  Explaining why this is the right thing to
> > > do is more important than just stating that a test changes from red t=
o
> green.
> > > Does the WB vs UC even matter here or is it actually the coherency
> > > with the CPU cache that matters (meaning UC+1way would also work,
> > > but
> > > WB+NonCoh would fail)?
> >
> > AFAIU the coherency with CPU cache is main thing that matters here. It
> > shouldn't be really related to WB vs UC.  The pat table entry
> > associated with XE_CACHE_WB is coherent whereas XE_CACHE_NONE is
> NonCoherent.  UC+1way would also work, but WB+NonCoh would fail , I had
> tested using pat index as 0 and 5 respectively.
>=20
> If non-coherent is the problem, then how does the compressed case work,
> where we always get a non-coherent PAT?  Is the actual problem just that
> we're hardcoding a setting in general?  Don't we already have a PAT index
> (selected by userspace at bind time) that we should be using?  Or am I
> misunderstanding what the PTE's we're emitting here are intended for?

For read/write to flat ccs region the issue is not related to coherency wit=
h cpu.=20
The hardware expects the pat index associated with GPUVA for indirect acces=
s to be=20
compression enabled.  For igpu in case of bo create and migration and c we =
need to ensure ccs clear and ccs copy only
no main memory clear/copy( as required in gdpu) is required. We are yet to =
see how the behavior will be in case of xe2 dgpu.

As per SAS the display buffers will not use PAT indexes for compression hen=
ce can't be guaranteed that compression enabled bo
will always be bound with compression supported PAT indexes. Therefore we a=
re handling the PAT assignment in migrate_clear and
migrate_copy.

BR
Himal
>=20
>=20
> Matt
>=20
> >
> > BR
> > Himal
> >
> > >
> > >
> > > Matt
> > >
> > > >
> > > > v2
> > > > - Fix the argument to emit_pte, pass the bool directly. (Thomas)
> > > >
> > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Himal Prasad Ghimiray
> > > > <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
> > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c index
> adf1dab5eba2..e1a849d74826
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -439,7 +439,7 @@ static void emit_pte(struct xe_migrate *m,
> > > >  	/* Indirect access needs compression enabled uncached PAT index *=
/
> > > >  	if (GRAPHICS_VERx100(xe) >=3D 2000)
> > > >  		pat_index =3D is_comp_pte ? xe-
> > > >pat.idx[XE_CACHE_NONE_COMPRESSION] :
> > > > -					  xe->pat.idx[XE_CACHE_NONE];
> > > > +					  xe->pat.idx[XE_CACHE_WB];
> > > >  	else
> > > >  		pat_index =3D xe->pat.idx[XE_CACHE_WB];
> > > >
> > > > @@ -729,14 +729,14 @@ struct dma_fence *xe_migrate_copy(struct
> > > xe_migrate *m,
> > > >  		}
> > > >
> > > >  		if (!src_is_vram)
> > > > -			emit_pte(m, bb, src_L0_pt, src_is_vram, true,
> > > &src_it, src_L0,
> > > > -				 src_bo);
> > > > +			emit_pte(m, bb, src_L0_pt, src_is_vram,
> > > copy_system_ccs,
> > > > +				 &src_it, src_L0, src_bo);
> > > >  		else
> > > >  			xe_res_next(&src_it, src_L0);
> > > >
> > > >  		if (!dst_is_vram)
> > > > -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true,
> > > &dst_it, src_L0,
> > > > -				 dst_bo);
> > > > +			emit_pte(m, bb, dst_L0_pt, dst_is_vram,
> > > copy_system_ccs,
> > > > +				 &dst_it, src_L0, dst_bo);
> > > >  		else
> > > >  			xe_res_next(&dst_it, src_L0);
> > > >
> > > > @@ -978,8 +978,8 @@ struct dma_fence *xe_migrate_clear(struct
> > > xe_migrate *m,
> > > >  		size -=3D clear_L0;
> > > >  		/* Preemption is enabled again by the ring ops. */
> > > >  		if (!clear_vram) {
> > > > -			emit_pte(m, bb, clear_L0_pt, clear_vram, true,
> > > &src_it, clear_L0,
> > > > -				 bo);
> > > > +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > > clear_system_ccs,
> > > > +				 &src_it, clear_L0, bo);
> > > >  		} else {
> > > >  			xe_res_next(&src_it, clear_L0);
> > > >  		}
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
