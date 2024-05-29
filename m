Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453D5C25B7E
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 16:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78D7113EB1;
	Wed, 29 May 2024 16:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atlJtFNu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B72113EB1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716998449; x=1748534449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R/IiVOnwcTtSlFDNk/ur5ugZ/DX0ABfBwy5SXLgd/Qw=;
 b=atlJtFNuvwqYDilOOLWnORBCCKy5ZqwyTmCBB5ZGZvHnWjEwTP213P6Q
 XG+BJJkVCD3F3fiY7ln2SXeExERnpMSVsJfYTaTsQOpnVpTVEblb+whoS
 KqiVk9Y+U0zo84J2SRHIN1Y6xxKhzvhaE4pKaXbL0+ugno3UvqzfSsTMt
 ajgI3E9qkc7ENTzoE+3lT49/Xwav1Hx0tnZTUzffOvq8iUIoG/M/b9O57
 3wbEq/ffNID43lTDcw7wQgdZ+r78hd6kERwwbdyGM73ymvYPuR3ZcXC7l
 dFey0T29LJ48XTGl7iXiVMLBy6x28BCPMaXUm1W+t8F6MlaVnXb/XXf36 Q==;
X-CSE-ConnectionGUID: S4dnMdMSQQaBk6dQmQ5MKA==
X-CSE-MsgGUID: gOKZyi+YTNCd/OCFroa2+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="16363217"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="16363217"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:00:49 -0700
X-CSE-ConnectionGUID: zT9NECoeQuetUjXUqmkLaA==
X-CSE-MsgGUID: 6wGhtoUmT36j82eiaXiuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="36100689"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 09:00:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:00:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:00:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 09:00:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 09:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7FjdGu6HWVouMJiTtNZSrL3r6X99gUhk9+TSDr0S2A7rtWwqKBL5nNCQJwZaLcIIazNsw7wkPDNKeXqUCBz0eY3ou/vWFybY8Le+L06Fn9ACifp96gd5sgTdWwlu+3j1XS/VErC3PKpp5dlLfU4gAvg6ASqYpHxJBUT5hSUKc7VhdLPqzfVAKwPq5NFTwuo+ACpxFTKxHyuQKbOaAV7Ix4mxzMJqn9cBuQMg+asygypv6GEemavqeDuaeiQb8w8ue2Xwty20T4YBjU4atJMqaHz/SxNyYhTXX49o4N/3jydhLUz8crmWRNCTZidzriHpTGQ7K/V5TkbeqgMwtgwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53hg+9F8KpduvJ2GCusNGljiH75TjtAm9NojknlnusM=;
 b=eAsOjypSt/SAjFYrwryW2oD2LMCMo+OIgRoXtr7PyRCHlbWLtivkH0uBiQLIxURbD/iz2XNMvYKtN6g/6EPxpVwCsPbwAfUboY4ftS1+w6y4RbmSz8yI/bKY7+tj5r7MQX5avQZ5DDEiw30HvrvPLP4iDQqlnp3Mi1XD9oN+clpQ4zQX4D94HpjK4kNxdoo1TWak1T/OpTFX+zykofMJTmnnBBuHujLNYe/a58TsJgmNxCl4O1+2Q3rBmfWfHMI+FBga58Tf4NSj9tvHF9UHJfnLw2mQ4KzeNfRNyaG52sI01a2KGEAPE9BA2NQvSe5dFj+k9wtd7tY5PPGLqFikOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Wed, 29 May
 2024 16:00:43 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01%3]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 16:00:42 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2: Enable Priority Mem Read
Thread-Topic: [PATCH] drm/xe/xe2: Enable Priority Mem Read
Thread-Index: AQHarjwFXmtx1lVL7kerp77SnP0zurGs3XmAgAGGmvA=
Date: Wed, 29 May 2024 16:00:42 +0000
Message-ID: <PH0PR11MB5782B66225A9EE3FAC59939A82F22@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20240525004933.1124012-1-pallavi.mishra@intel.com>
 <20240528163455.GD4990@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240528163455.GD4990@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|CO1PR11MB5043:EE_
x-ms-office365-filtering-correlation-id: d227266e-6ca6-4612-0b91-08dc7ff87e58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?b/XxX4HaDmOajIiiFiyr/zIsalihhCbzem9iVJVAk7u0vD3hneV9BTZd3lHf?=
 =?us-ascii?Q?mgsXj3WZJU3dmJ8WJdOHfkdJMAkRDqHiX7wsoN09tE5ReN8vohkDCNtqPx2g?=
 =?us-ascii?Q?CljWKC6zxVVMOck1sg54iQwqSwaeSaoa+JG+3RGzeIwY0nJw0YeaFOcMHcqi?=
 =?us-ascii?Q?wSNqIyxrFtM/ukSvqGdKEm6A/2QFyAvD74edf9jK0kNrZ2um3U17/RhkXQ7n?=
 =?us-ascii?Q?oe7XYrUpTihk1V8Z388sZVLVFkL05jgFe5hfs6qtQBnGjhbGTr2Ra4DbCpxX?=
 =?us-ascii?Q?30+GPIq2/VfOPJV7Jk1PTDnn3fY3WOCeSnfFNGF+SXpbcWl7Gs5mR9DM6+n4?=
 =?us-ascii?Q?p0t3AgyNfHV0IvpzT5p+CROsaz/5YUXUdb7MFdwsfcBIBlJ2lpdPtjwbnFq9?=
 =?us-ascii?Q?YVMvAIKC+4J5sWHbNz1YkI+Gq9Gj2t+zHFNb98LQ9M1j0xrXnxVLKaJU5vST?=
 =?us-ascii?Q?q3esJQVUpI+u8u+qk5vK/rWa8J506xS8nXjUzNSTlFOEtLHfG9W2VoxHyJYW?=
 =?us-ascii?Q?10SQEt5QL8S2TnjKn8Aqi+i0dRMdPPo3J0X11e/SEbQfYXg3MLQt6PtgREiU?=
 =?us-ascii?Q?TfokIhBLrWqfkerBDSoUUo6hMzrUFOWacytr6s755UZuReRUV85fqNMY0yia?=
 =?us-ascii?Q?p/UMTUTEYb3dhNQ9KQ56g6TmOhlZXmzLJ5NZZJPgfQVs6V8PaZVp2j5zJj92?=
 =?us-ascii?Q?mrqWQrqhIk1KAcQxKAWogp/4SFzsUb+wX1bTbGwQvJZgaY55N1hbGXhLuoYn?=
 =?us-ascii?Q?XXUkYmaRIfCamiLx5+SVTWnYJT7wC/uAFOh+qyXuSIbCIsll5Ocxs/iFpgnV?=
 =?us-ascii?Q?oa8dTXD10JRkpOTtKvdm77Ak0Fi7hp/WF1a/P6ELLH83ADjuoignqYqtwCOF?=
 =?us-ascii?Q?NxgktvVYxED2Q4jyArFmYcT/Vuq+vWpq8dRaYwmYEqZChI5Wb62XIuJ8Wt+5?=
 =?us-ascii?Q?5uRFRo9gGUfo5ulLM6SO6y5pJPXY20a6FhgaihPPUwGqTJs5Q75OEm2rAeC4?=
 =?us-ascii?Q?Zo+3+sG8evPRETFBoTWQwQn2EMhBJIhWiNMC1gGa0mndm8H1BdfN8Ca6uw4T?=
 =?us-ascii?Q?wb0rpnWwV1HyasTXICJxzgbvVhATHhkffHGC9rTkBB1+wNW8+d/MxaKcYmcx?=
 =?us-ascii?Q?E7oy3LJE3A+9NS5rlM1fxvqs8EhOCRb6AZb9X2d7Ih3frSS38O3tHlBFdJrf?=
 =?us-ascii?Q?v9quXKtCfUhdjgspnIKhrlHKpSUdJA8Q+cqwIsXaLCvoYD1mrfb4ZBVTKQ9a?=
 =?us-ascii?Q?mtCV10Xn7wTtI60r/XEmQWF8ipoWs3dgY/GMiOvC/A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g7FbYAphTPjUesd7K8k7E3uH5ETSqx4UCzugEFATeXyWR+50lE2oxYoXE59T?=
 =?us-ascii?Q?bt5z2X4hqdzjC4HoPcveyBctSdj6CYOhSaogYP5UHUq2cwXnXK+EW+lcIUFd?=
 =?us-ascii?Q?uP25mq8KgO8OFII4+Tb4WrA23aG9DUqZj9hBO/eHHdhD3/aIA1pHIeGcZfcs?=
 =?us-ascii?Q?qwRj538V7fL/n3YTMICwlxBZkpPbK1bzRy4uL8IBiyS5Po7L9L8s3hL+1anl?=
 =?us-ascii?Q?N7YhWKzS4+KtQeQbnaYy9Pwt3NBQlRD9S8DL16/1v6UD27djWb//4sVsKykm?=
 =?us-ascii?Q?u/lq9Wyj9LLSUvOPn6+TUyBs821VOX/5tVMnRKXLiDzmNkyJndX63jgUbTxr?=
 =?us-ascii?Q?pHsRf0CDyYxGCy44Gh3boxLy6pIJvssgvXmkNxdbFTl3W7HOjAe1YN6KkeXc?=
 =?us-ascii?Q?gJf+ImvRfw7rmyY/PkJSJckLyprugDNkBOVbM5GMZVXkK1dQ5bTDXSv3wT6h?=
 =?us-ascii?Q?x5HXJjHluEcmYiAloq5v7L/ayE4kbU6iPwIqs38TKwtEilvw+eEhqnvk53zg?=
 =?us-ascii?Q?syYDso/0IOV3gGYNtMCNTGR99UghLDz3MUqBg+PQX/7oIqMf7of/8pQMzGVZ?=
 =?us-ascii?Q?LirqIcAI9sMsWWfd95OmOrmOFcgGqdTNMWTBzekEb+usoJa8UPOC6LLhvhUl?=
 =?us-ascii?Q?ebToEux92JCQzku7MW0Jeo5a/kHT6q01G48CrDt8wupIRKcoBTib2R/oCLQs?=
 =?us-ascii?Q?DUD/IWgSDWidJ4GH4dhro7yKUZgjOwZXOpAbpQYMA5RPifm4GPCPcS1LEDGP?=
 =?us-ascii?Q?wpYKAVeP1N4Nl/vLkERhrAIFfZgwPyvyuiLGYiFEJ3W6GQtvrbRMZhH0E5C/?=
 =?us-ascii?Q?4m/EA+gHzB8vfF7pU61MDbpJlzVoyEj7hRy/lJDNdgID9xbJN6glHEOpUBAI?=
 =?us-ascii?Q?x8/ZZ528KXjfob15U1s1D6kOH/Iu3thsJyv3+TPVX2eCfwRdEIdr4cE4BA2j?=
 =?us-ascii?Q?KQDwRfftIw5zux7FDMCRYoP8aGExX/tXhJLTuCN3rxC4E6t2L4pRmW7Q9Y6M?=
 =?us-ascii?Q?qFpwofwUmVmhIfzQumC9dNuTZNvVWDtNTrwZBp8xfT/7uiP0Q6DletL5CjYG?=
 =?us-ascii?Q?FWVxEHTa8vCqqOB+xd/sFZ1ZgKAslwaWCEwfp2FM7Q20K15zL8RisMYh4M9C?=
 =?us-ascii?Q?f+s6xjoNIBlHKd/djphFGnzMdmVPGXqYE2xk/krUDeZuFDvOxPbbtRjD1DLG?=
 =?us-ascii?Q?Pw39c7M+5hMN1uVV2TDUA6optZK78fLP0AoS5vxuV1N+LtdulORdYgLPyTOl?=
 =?us-ascii?Q?Y6EXc1+5xUwS5eBL+pvAjdBxlVK3jZGTHYvrdOPZV354iw10QMEblFoqXHSc?=
 =?us-ascii?Q?H25q2w7hN/iJQ5A5rW7JUdZV/aq+tw4bEQHKiIprcdcFFbvvQOdkzSb0bIgY?=
 =?us-ascii?Q?GkAouZ1/CYxqOWSmgKR7XTWkOyPC6/mOQ07TAVAI/m04DMTBZnIE2mydy4Yk?=
 =?us-ascii?Q?xUGvEFOy0AVo0heIxLp1Wh2Mq0O99GKwzMYGkBjoqiDwjaI1IInj4VoiQKpj?=
 =?us-ascii?Q?7p7vxDh/y0vWJI9goKjvKPqJbfg9OfUNwex5AbtNEDxDNScJYiu9/zUEGkf0?=
 =?us-ascii?Q?kjvpMvBJ6pl9RPAPU92jPrrzPrQAfsGJKFLHxihO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d227266e-6ca6-4612-0b91-08dc7ff87e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 16:00:42.7839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SPtoiOlbykaCZ4wyknPCXe0NADqUR+ZJ88TkYHS13VRzcLSaom9GncoT3dhDk5hbz8oHBbXxEtzHgvwcEqCs708urRpfsQZC2J2ljpP2Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Tuesday, May 28, 2024 9:35 AM
> To: Mishra, Pallavi <pallavi.mishra@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/xe2: Enable Priority Mem Read
>=20
> On Sat, May 25, 2024 at 06:19:33AM +0530, Pallavi Mishra wrote:
> > Enable feature to allow memory reads to take a priority memory path.
> > This will reduce latency on the read path, but may introduce RAW
> > hazards.
>=20
> You might want to elaborate on what "may introduce RAW hazards" means.
> I.e., it's worth noting that both kernel *and* userspace-submitted batch
> buffers may now be subject to read-after-write hazards if they don't use
> MI_MEM_FENCE in cases where there are assumptions about operations
> happening in-order, but where a read could potentially leapfrog a precedi=
ng
> write now that we've enabled this.
>=20
> Presumably since there aren't any other changes in this patch you've alre=
ady
> confirmed that there's nowhere in the KMD itself that needs extra fences
> added to avoid read-after-write hazards...you might want to mention that =
in
> the commit message too.
>=20
> This could expose previously-harmless bugs in userspace drivers and/or IG=
T,
> so it will be important to make sure we land this before lifting force_pr=
obe on
> these platforms, otherwise the appearance of those bugs would be seen as =
a
> KMD regression, even though the bugs themselves live in userspace.
>=20
> > Bspec: 45845, 60237, 60187, 60188
>=20
> 45845 is a page for pre-Xe2 platforms, so I don't think that's the one yo=
u want
> here.  I think you want 60298 for the Xe2 equivalent page that documents =
the
> register bit.
>=20
> >
> > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_hw_engine.c        | 7 +++++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index 263ffc7bc2ef..4e8f9a61f0bf 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -104,6 +104,7 @@
> >  #define CSFE_CHICKEN1(base)			XE_REG((base) +
> 0xd4, XE_REG_OPTION_MASKED)
> >  #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> >  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> > +#define   CS_PRIORITY_MEM_READ			REG_BIT(7)
> >
> >  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0,
> XE_REG_OPTION_MASKED)
> >  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index de1aefaa2335..34aa8b5270b0 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -424,6 +424,13 @@ hw_engine_setup_default_state(struct
> xe_hw_engine *hwe)
> >  					   0xA,
> >
> XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> >  		},
> > +		/* Enable Priority Mem Read */
> > +		{ XE_RTP_NAME("Priority_Mem_Read"),
> > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, 2004)),
>=20
> The current platforms that currently support this are BMG (graphics versi=
on
> 20.01) and LNL (20.04), so the starting point of this range should be 200=
1
> rather than 2000.  Also, since this is a new feature rather than a workar=
ound,
> the expectation is that it will (probably) continue to exist on future pl=
atforms
> as well, so it's best to just use XE_RTP_END_VERSION_UNDEFINED as the end
> point so that we don't need to keep coming back here and updating this fo=
r
> every new platform in the future.
>=20
> Also, RTP rules using GRAPHICS_VERSION[_RANGE] only get applied on the
> primary GT.  If this feature is also available on the media engines (I th=
ink it is
> since I don't see anything in the bspec implying it wouldn't be supported=
),
> then we'll also want a second table entry for those (i.e., pretty much a =
copy of
> what you have here, but using a MEDIA_VERSION_RANGE(1301,
> XE_RTP_END_VERSION_UNDEFINED) to capture the media IP.

Thanks for the review.=20

Just to update you, I see below failure=20
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/bat-lnl-1/igt@xe_m=
odule_load@load.html

Working on resolving this now. Will update once this is fixed and patch wit=
h comments incorporated
is ready for review.

>=20
>=20
> Matt
>=20
> > +		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> > +				     CS_PRIORITY_MEM_READ)),
> > +		  XE_RTP_ACTION_FLAG(ENGINE_BASE),
> > +		},
> >  		{}
> >  	};
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
