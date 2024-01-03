Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CD5C47073
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 03:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A22C10E1C4;
	Wed,  3 Jan 2024 03:17:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3F210E1C4
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 03:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704251845; x=1735787845;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4l+Me/oY3XCJufblE+r0JxB1K9s5i+snk80oKrIUzUg=;
 b=PeaDmwupV/emaC2kL3Bu6p5Jdj+txE+O0N8XZTt40HeqqS3bK8lsClwC
 TQ5/flfB9XZuUZouyhMLw+otSFHlc7mTvPaPaUd0CcRheZo55WpSUESZh
 DVxCFJ63TwNK9uJYgBj13rjND548OVdF/THInIOQLji2+zg+bQAaxK2RP
 aW+7sfoeUcGD8eDExaG+i4LIE/faNBz3J/JprIjRPpie8BCaVq7bJGOyJ
 PbOHyxY0wqSUiccOsj7AsFP6HkS3fDwCOCfsdkkWmakBioQFockfrmmOk
 n2UpaLCPeEC1+LMdCRMVXAQMJGwEICEKn7mH2YMFrd1riwbmX0tw4T+me A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="394102533"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="394102533"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 19:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="808703142"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="808703142"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 19:17:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 19:17:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 19:17:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 19:17:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 19:17:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5z2ch36yJDvLRq51YVkLx0rZ2+CIc41bPp8ImsdYuXEtZFed5FW3KMAhXmhTV97Xv9Jaw1roQ8RdK+TmVyu6vwArn6AmxlEkBuMvdZYto9zCGLEayNhELXVWVGn7fQuP+DVH7b12/e7vkVSrE8v8FlhOPGP6UaOOfpuhYbdpZc7ybRuefiAm+KF3t8D8cW+NDthguJBziG251MJWZRNKo+dxhwV6X3eh7hOzTnRAGSMUg6wqJlpsnj/xivmoVYQdjVw4b4KlmL3HsYGjAOE4GiSM8CshwPUJTyEA4EuABFNoZnMZc1BhqIEJRdrPfJjVUIkmokwQabv8W4s3yfmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAA5EDhBHXpYQTypjtCSvE7E6VpZn0r5qE9pF+MaXVQ=;
 b=btQW79x9Boj58jM7U2YzRLX49Xs0cO5Z6wGGKPZ2DwKXY/DS1N9/WYwYLyeKvyKjEppQz3ONudNtV4bCPN2g4UfhezvhfUDI/vAPYtS6wNWg4VPRNYGKY2u9yet8BdGlh4MX1lYnne/U/N6YrMLt8nHRduAiwj/NLcHYzzMo8PIqqOgqyo0Nv/OHOEK9SKcnFsgh3scWJ50v1g4kke+C2UBSd5DlIWOk0boK3mbk3IsaPVzp7zElUcCO01oRLoRsMno/E1I1zjQnbExFSAilrT8kaBEixEC+i+BwTgctTAgmhi5lrZIaDXChoheNqquBGwPwu1B41oNs43O41FTimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 03:17:22 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957%5]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 03:17:22 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
Thread-Topic: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
Thread-Index: AQHaPZpnO4kWJvMpgk2HwibGJC1Dq7DHSbMAgAAdw0A=
Date: Wed, 3 Jan 2024 03:17:22 +0000
Message-ID: <MW4PR11MB70565545C05F1C9238438949B360A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240102165142.853141-1-himal.prasad.ghimiray@intel.com>
 <20240103011618.GT1327160@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240103011618.GT1327160@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CYYPR11MB8429:EE_
x-ms-office365-filtering-correlation-id: ae5005e0-5f8d-4d9e-dba1-08dc0c0a8049
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b21yYghQ+1ePzhFr0xWCV0O5tvqhBy8gXxdsNXcDvrQYOErMZCdHAvETrrmZNw/oUgiY+tV50xSvtEv88eIEmyqKwH0K12MoU+N4cG8FMquQoIefJOC9fcAThAuZjhWnmuttxA8c4x394OJEUBG9HI7vK2h/JTIKC3ImoOLStxpUGzIpuQQIGEU+duqXDEHc/6jcSWucFnaNfl6DHEnVngoH8h3+fNPLKXtPgZ9HmekxQTxwLmwIPNYVIsRRKF58uFFg+hITzQpqc/FLSvTpLR7pZVK0vWPQYFK93nZ6AW6CMCClw4Yc4TYOIu8sBZlFUheo33V9/ApqfVtktcpDddQtsOAZNR+uLin88fxg0rHnyYnxPgQVlH75BLLfIz5YwK8pAKsrW9Vv4DFTS72V0IgSQ2zYYPOaC+CBjK7nWg3P9M0t+Z7nB+zRM2+74TXuzQlWOZz1bTssLbAPj2NUdVw+6I1HlIh12i7H7XsxWGmaDgdHAPw2ziOeKkJIfnApVrZdC+KacTdrYtg24jqDd9jw1ySg7A7hhBDKCmzo4fghpWwwaUVrq5UQdQqqAqj+TJ5Yu2yeQhGr48mQ3wsQCsAE6penfzGwUlKX6+KVgd4l8PlfwKNWbrGDihwBEoIY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(2906002)(8676002)(8936002)(6862004)(4326008)(33656002)(5660300002)(52536014)(66446008)(66556008)(316002)(6636002)(64756008)(66476007)(86362001)(55016003)(478600001)(6506007)(41300700001)(53546011)(9686003)(7696005)(38070700009)(71200400001)(82960400001)(66574015)(26005)(83380400001)(38100700002)(66946007)(76116006)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?l/xCXDGhYuaOZWSjMLe5oIohtsRPNPceFjJrFa5A1VO8c35K0z2ZnlRtXj?=
 =?iso-8859-1?Q?HYr1d1lnW24HUo6H8nhX51dRkpwcmzXOdcuYDRPjvOPtO7pAbFiE51s7+0?=
 =?iso-8859-1?Q?sgbg4u4flhR9h1/v/NfWw80C+jBfn+RmQPkOQGrPIpI/3vcctsH6geTxYQ?=
 =?iso-8859-1?Q?eZLdTH1LeItaeDq/RjdXv63LYeqi5kcGwJpeAHDlmuMCMqKcTl7hb9m/DL?=
 =?iso-8859-1?Q?A19QFrxWCF46FgcSa/rH8tj3Ikxgu5qNI/Zc9rxtc7/snzUj6njFmCF3R/?=
 =?iso-8859-1?Q?CAa37neNddv+Q1+SBYzHyMgE6rPno4kVX3qcQ0BEuxCA/TrSlz16vxuoT9?=
 =?iso-8859-1?Q?D6HlkUvVd6v/2T8wxzlWZG1HX6KQApwvoW8TBJxJhgsccBeMPrX8akHnBC?=
 =?iso-8859-1?Q?KSf4yyjx76S1N8OlIOlQZbOPfBH6dStVkYwLs6qNiB4vf2SxGArIFq5c5i?=
 =?iso-8859-1?Q?xzT7LSA5Jp2FqWz3g9rX27J/CddK6KUUMK52d1FEc4MnwAN5sah4Uk4IiB?=
 =?iso-8859-1?Q?n5XRagxsDhedgCkwi2S7Jl/MelF0LKA3B0mEaCodC/LqhxbWsAggZWAQWi?=
 =?iso-8859-1?Q?z4gbPIkKQEFDJA7JnkUFM5JnkwGLX8qDmlSFGB/HZ8M3stOpr8cvBn+YML?=
 =?iso-8859-1?Q?qnzF/Ex8YAo0atQOmxXhhJip/KuiITmbIlyfBDoibQ88Yr0JEIDk8pmoR3?=
 =?iso-8859-1?Q?6PobeVRwmxFgfeOgkv29FCPQUOOuo8N0Sx5Bg1M5EXBddjWsasDt+u4GvN?=
 =?iso-8859-1?Q?sCTyAzqzMBjfP98rAhX02nGpR4+5KN0xT+n40JRm9GDKxYNwu+KgxaUN2k?=
 =?iso-8859-1?Q?vaNaJ4z6wrucfkem+WCVjgcDdONdh3CA6l8EqE2EWClkiBPfaPpZrdVl+E?=
 =?iso-8859-1?Q?7mmZphJEpeWi263eMetvRaEQBr9fe/g3UL6Hjf8HSo/FnuUfo+uJPkfvEE?=
 =?iso-8859-1?Q?riBCMzYn+3uFtyYdbjAX7FMNPzP7nyYA8EJXndKNe/Kefqpn0hs+BKgjjP?=
 =?iso-8859-1?Q?b6FQNNwmm1qBm1fKXfWo8y+yA/MDg5gN8UqdtZHMOJ09YMrnOzK4+P0ndf?=
 =?iso-8859-1?Q?+7iFdwxPmFnmnArjAF/k8x+MATPJdCJK0Bxa41cqSa38InQhRUq9u3opvG?=
 =?iso-8859-1?Q?il/IM6Z/1XWszgXiqosa+VqJOfBamHZ22Jpao1wYfTIdtbtvd3rpDQlt9P?=
 =?iso-8859-1?Q?jLIL1Xwy4VZ8uHnEdgOvrBsEw2ByaHphW40iSZjdtmqf3lcjvytSDvfMQO?=
 =?iso-8859-1?Q?3tZ4rdavGEYYAYpwYTcftV6lQAGmvOyg6HmFGkcN06X3b1ZE8Thn/42L7/?=
 =?iso-8859-1?Q?dkZnKCZdjU6JHIrOjqYQTJ612N7FgYnRO80nBPgixtM9jrYWd7Fr/MhBpb?=
 =?iso-8859-1?Q?Xi98gmKlsL2ub2jqIyTNli0KaLc0zG4HmRRurzZgKwxAez/SOKDE2UbCs6?=
 =?iso-8859-1?Q?ZbYCdtS2QudlutgGWL9thv07s+XO9grZInlnUeLUUKzwhSuwx+n00/5SpC?=
 =?iso-8859-1?Q?yrN2LJgtsmuFjhr1XHqjDybI0NUedlvLo4XMwx+Pc5gGv+8wgeaOxuP5IO?=
 =?iso-8859-1?Q?pW9XwsClDTKkVIyDt/9OTMpp+M2aWGMWRQ6+OdMG7peI2dyvnPB22JsWw4?=
 =?iso-8859-1?Q?7EZ2vExJBKOjiMCVoaYBm7mitMI0+82HP8WU//gxjmu47+fqKvPOX2pA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5005e0-5f8d-4d9e-dba1-08dc0c0a8049
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2024 03:17:22.1085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: opDhTBAeqosu5R1O1KlCVpu5n3j1u4TCKHTcG8+1RewvcsNYROPGYBFU8tfMhQgt4iaVQaphKOuxxZUHg/SbJyH5mJ90BW6SnrO1f28dbS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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
> Sent: 03 January 2024 06:46
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
>=20
> On Tue, Jan 02, 2024 at 10:21:42PM +0530, Himal Prasad Ghimiray wrote:
> > Use XE_CACHE_WB pat index by default on xe2 platforms and use
> > XE_CACHE_NONE_COMPRESSION pat index only if buffer supports
> > compression and indirect access of flat ccs.
> >
> > Fixes the broken "xe_migrate_test kunit test" on LNL.
>=20
> How/why does it fix it?  Explaining why this is the right thing to do is =
more
> important than just stating that a test changes from red to green.
> Does the WB vs UC even matter here or is it actually the coherency with t=
he
> CPU cache that matters (meaning UC+1way would also work, but
> WB+NonCoh would fail)?

AFAIU the coherency with CPU cache is main thing that matters here. It shou=
ldn't be really related to=20
WB vs UC.  The pat table entry associated with XE_CACHE_WB is coherent wher=
eas XE_CACHE_NONE is=20
NonCoherent.  UC+1way would also work, but WB+NonCoh would fail , I had tes=
ted using pat index as 0 and 5 respectively.

BR
Himal

>=20
>=20
> Matt
>=20
> >
> > v2
> > - Fix the argument to emit_pte, pass the bool directly. (Thomas)
> >
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c index adf1dab5eba2..e1a849d74826
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -439,7 +439,7 @@ static void emit_pte(struct xe_migrate *m,
> >  	/* Indirect access needs compression enabled uncached PAT index */
> >  	if (GRAPHICS_VERx100(xe) >=3D 2000)
> >  		pat_index =3D is_comp_pte ? xe-
> >pat.idx[XE_CACHE_NONE_COMPRESSION] :
> > -					  xe->pat.idx[XE_CACHE_NONE];
> > +					  xe->pat.idx[XE_CACHE_WB];
> >  	else
> >  		pat_index =3D xe->pat.idx[XE_CACHE_WB];
> >
> > @@ -729,14 +729,14 @@ struct dma_fence *xe_migrate_copy(struct
> xe_migrate *m,
> >  		}
> >
> >  		if (!src_is_vram)
> > -			emit_pte(m, bb, src_L0_pt, src_is_vram, true,
> &src_it, src_L0,
> > -				 src_bo);
> > +			emit_pte(m, bb, src_L0_pt, src_is_vram,
> copy_system_ccs,
> > +				 &src_it, src_L0, src_bo);
> >  		else
> >  			xe_res_next(&src_it, src_L0);
> >
> >  		if (!dst_is_vram)
> > -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true,
> &dst_it, src_L0,
> > -				 dst_bo);
> > +			emit_pte(m, bb, dst_L0_pt, dst_is_vram,
> copy_system_ccs,
> > +				 &dst_it, src_L0, dst_bo);
> >  		else
> >  			xe_res_next(&dst_it, src_L0);
> >
> > @@ -978,8 +978,8 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> >  		size -=3D clear_L0;
> >  		/* Preemption is enabled again by the ring ops. */
> >  		if (!clear_vram) {
> > -			emit_pte(m, bb, clear_L0_pt, clear_vram, true,
> &src_it, clear_L0,
> > -				 bo);
> > +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> clear_system_ccs,
> > +				 &src_it, clear_L0, bo);
> >  		} else {
> >  			xe_res_next(&src_it, clear_L0);
> >  		}
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
