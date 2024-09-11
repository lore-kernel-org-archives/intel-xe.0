Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A66EE499D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 12:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DC010E9BC;
	Wed, 11 Sep 2024 12:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEmxdG2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723EA10E9BC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726057228; x=1757593228;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=txuefI5DnbJ2A8teD3/lA2VXjH30gF+YNC3HlV47JjE=;
 b=fEmxdG2UUTUy6ORQiRHV4smjDS7TUoSjr6bcf813yimERU6EYVviBFFT
 /aFaeDcvAcC+6XOZ08K/O5M7KRNT7Vo/TH2tp95rYX9yDRM2RBPGsXwxn
 jl+hmQR66B6/b6TZpGl3/ZnBuqUAgGeH7+Zw3cv111cTSEfAF/RXF6qRQ
 0Itap2YjT1Egddw5R4g+LJUXBHenYjQo9UCI2npByW/Y4JgldT/mA/n54
 VUYPyj29mu8aXqrHgZlZ7bDY5KX1Ed6DgC0bZJWpngBmmiGX2mg5egPPf
 ZRyDhUMOt7NCCY7dCUp13N3cPiny7111Vb44K9rwhYWH3b7BL7UJ2qhpF w==;
X-CSE-ConnectionGUID: CfuD0pt8StCEmeNQKE2v6w==
X-CSE-MsgGUID: n/mfdWLTSmuzTgWhzkh2sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27773932"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="27773932"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:20:24 -0700
X-CSE-ConnectionGUID: /I61VT2BQ96wDq9aCwUdVQ==
X-CSE-MsgGUID: luJPM67CShWRMQWa0OmWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72121515"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 05:20:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 05:20:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 05:20:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 05:20:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzsPjQvr7DwUyspaLd8TJ/s4GzgyqLF9n1kRC/I1wwIoun4gbluv2jKnhhXfW8gyHJIG8R3bO0JUkR9sQR3gNmyjGHtD0udo8RvPu5obW7dunDhhDYUY9V4h6nladuTj7KWYJjgZdRMU85HsArqiSAgJFQaL17iZWtmj9zVgX17pE1j/m4rutZJcjA/ifyzLp/WmNw3sCG/lJtVhy8fKlBrFsUig/ShXYCYQFsEzjK6vpsBbLG6N5M2y4+1iQCl9oB3wjNRlpW6ZOrSgauFLjs15j+6H3CSg4w3aY6K6RAlx2Zt2/AVYgNegShI6xUk1+E6EOM3G6V0oveozQW4m9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP/w7jyOpaB+EqH1ar6nXQWt7X+4P+EQ0cQJNhgxKnU=;
 b=fpDkycL8jvZ3gbO/cJet2Yk9ab8eeKi58XMBdgq7/Z5J/J1gxwmT3jBw+8czNhUH8Th66R/JrqlIG/SznzBUUO2U6tsLFzRPMvpMrbAIpHtIKBmmlLTf5mqPNWgVI3uqyl+5Ek/DEmGirB/R3K3yCKOzhCUr9hhJ1BkgfgZ+ZuJn0DvG1EL3bqXe4dm9X5Ta08l2MGRfc35qaZRvVzT6q5G9+cuyHLO70Vet5Fhp8HPVy8eK1FfQOyl2gHwXtZWcZPxmzg8Q20kHu16mszUQuQ253NfjVfgUDCgA57XSWx6Py4rwwGhVAfaiNAEM0MzcI3yLDgSiUM4gBbqVCW3LLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 12:20:21 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 12:20:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Thread-Topic: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Thread-Index: AQHbBC2aE0C/q0Z9wkqyX4TdiGu937JSdOIAgAAFr2CAAAL7AIAAA38Q
Date: Wed, 11 Sep 2024 12:20:20 +0000
Message-ID: <SN7PR11MB6750BDA59443E449826A3393E39B2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240911093026.643605-1-suraj.kandpal@intel.com>
 <ZuGAXqmtrLOnjAGs@ideak-desk.fi.intel.com>
 <SN7PR11MB6750912B7086DD851CB8CC07E39B2@SN7PR11MB6750.namprd11.prod.outlook.com>
 <ZuGHotS095lXkdBF@ideak-desk.fi.intel.com>
In-Reply-To: <ZuGHotS095lXkdBF@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MN0PR11MB6205:EE_
x-ms-office365-filtering-correlation-id: e66b56f7-c075-40ba-52f4-08dcd25c1a8d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TOVSY+4TDR/NlMjlq69RJ07FIZT5orKICnmw+8QYeDZ42DRPEDVwRl5aviTq?=
 =?us-ascii?Q?i+J/XBTUvgo6A/QWEylaSbe6IUY7Nx+wP4KdtH8mD9uW3PiULnLUtu+F6uWb?=
 =?us-ascii?Q?cUt8mafPa8LoRQ97ceG1vrJTn4nBdZlJLpy1YgLk9w4rouKKgHh+N2bKqvI5?=
 =?us-ascii?Q?T7i8g4qyHZ/xONM+K/HgFB4xNH183rMpgFJ2UIG/I6rf/sK0hISxxhT0WWgl?=
 =?us-ascii?Q?KSttzomYhCell5EsNzwON3K7vfawkJyFLXsOVr0hAuPxANjA75Hc7UVlFpqC?=
 =?us-ascii?Q?q0yZ23Jw44ao4jW4+T4usb6x5XJo/nqUFopsA1Br/GaJuEVt+w4aPtiNySwe?=
 =?us-ascii?Q?Nf4qLFFHwSnDrSlCrNXbuVLdJ5boUGuMbg57aZziCrnObIIvNQ2TmymBfVFH?=
 =?us-ascii?Q?COU13iAFlTSO6uhuK1CqwTjEXiFDSlKdZy486x2/nFZLmJd7tzItcDuleKAN?=
 =?us-ascii?Q?rKtD3enOuQC2ZQUHEwLK5JdG+lyyitQX+kSIf6G8n/nhsRv/YgT8U1zJj5ed?=
 =?us-ascii?Q?n4PoRlUGToqlQVc7bMhvU/q6yAZm+W7Jowj3w1lrluE2OTV3+mVAIS6PNikn?=
 =?us-ascii?Q?e2WfLSw6yIGN4GQQb5UzVAlpG3gzqs3M/qhwbsGLITkgKAnzBQ7P5xoOb2n1?=
 =?us-ascii?Q?JqYhhaPnTfCS1P/0kgN0XnbarChwtKPNCDKgw7ZbATHTE7SpKob0EcxDOj/u?=
 =?us-ascii?Q?Q9ymk6jEf17XbzulhgCwpq9A5sRcD6cLSfc3Q/FzabCuMDPWGLlFWrvZr9g4?=
 =?us-ascii?Q?FhtqtpKfWt52WmSt+MTv01SALP2G7yjBDtIdL+nUKoG6lzbs8OQgpIZqL8xg?=
 =?us-ascii?Q?M+LfppVKueW03BkQ+dbIapXEgauIhHnQ03O18T4EurMC7QytG0TcqHsWrSaz?=
 =?us-ascii?Q?L9qG6ZlMNP0mOKpPTKNWyFM3+uDh20yl14L8cO590dqVeM/dnkmy+Cgu9r89?=
 =?us-ascii?Q?HvNvLxlpcjXa8T5z/MVU17fT0vEYMcsWRadPm5tHUHi0xLcZZ27R+nUD4riI?=
 =?us-ascii?Q?yEK7RHX0tWqLcyk1YmmwbRUTjNPTB3hptvEuriHfHK4J3qsZOYhrwZhvn1ad?=
 =?us-ascii?Q?Z1QeFW55qBIxPy5J+Gpp4jRQs1owckBeGse9QNn1rFPAFXMDVD0xtblpILNR?=
 =?us-ascii?Q?okHv2uyTo1p5edjClVRdb6h44c/CkczfUA/T8LH3ASz2OiWrKQjuxDKj76u6?=
 =?us-ascii?Q?9KuH/liQbK8i1d9fns2v1WR81/rC2I0U1PHRKMh8+uFKfuKxhiII7wxjDjZJ?=
 =?us-ascii?Q?tLRR8HIRsvh8kNufEkV7EUZfqDyIePkgnO889mrfinqx3HH1PSFMipuhwfH9?=
 =?us-ascii?Q?q6CXltGJkRqzQi3MykV0sWkpkyPbJFHzDLdUAmcfDreqKWlQER6HJuy3Q/Fk?=
 =?us-ascii?Q?uJoKdVF38zydY5BSCdScTOvp7fgyUQEmwnmYKbcOmfPq1Pp0Ww=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zaMxAEGAWSULMeUcgwKikEMRN/dn9FmY9xHsrrnDFnwDDLivcWcnPPzJirmT?=
 =?us-ascii?Q?HTXF929vsc1JaR4uq4HSVijhOlkXAltWREqZE5h2F38w3tVC/ayQu4QphPze?=
 =?us-ascii?Q?WdCuwx+WTQ1/dIbmf/OSFHK24cEvgy1BjoTuhVrB40Crn4DmmeAzcGUp5Ihy?=
 =?us-ascii?Q?QTVoO6iYkshWl4bWBXrL70SUYrMjPDwM7U1nJZ681cl6zH4qiFnUghWOzG0K?=
 =?us-ascii?Q?cjTjAXjCqX6eIrjCY8tw+7rYLUZ/VH4wFvAAyYPkUFEUicw+JPu99u9o8gzQ?=
 =?us-ascii?Q?z/+AR462QgBpK0t1ED560V3ghrSalGNrxROsCCvWhrw0Pzx1gia1zzPqk6qF?=
 =?us-ascii?Q?tRX1j/0no1BdFcKxj/HOVc/SWxF3xTxw7WSznerfRV8fIutcQbMDc/yKxgA4?=
 =?us-ascii?Q?SHaofY11KtnzX6kS19KnSQ5YvyJP9A1H5Emd0DXCJZUc8/gdMD+ByAkoM0yl?=
 =?us-ascii?Q?mMiuEAqucC3pzlt+fM8mvajaY61J8KJY6jNlUBQlbwtY1UMyecslOegtquFk?=
 =?us-ascii?Q?aXbOU6d7q2l2jmxQG7ul82LKvWo5TgGoW2ygc35bmOY1vguF5YHrikTY6Z9m?=
 =?us-ascii?Q?v/6bDj9DSXqRZvrnOi8wHRXq9ZpJEAVr/L5lyWiELWsBMdad/5EwWjJQVWyq?=
 =?us-ascii?Q?+YvxeFm3IULx6aUje+UEfyCQTiA15nX7l6OKMAKJXQHRr6+j+eiE93pjM88D?=
 =?us-ascii?Q?aU2FqhdTpE12quZDBbGHq2HhAbEZI1ItY5TJ5WK0o8Ga8Ye/Qa+h3p5gSP9X?=
 =?us-ascii?Q?lsHTcwDXhkquVaaQt601ZG1X6ZuA157oHJVXb7r91YAnERWA/ene/SxUhqfr?=
 =?us-ascii?Q?TBIgy6gB5mgJL7bPi5Qidn/e7x/Ghz4mXj38g29nv/PzgMEOii769YsQAHLR?=
 =?us-ascii?Q?A34pxo/E+lIBkBNjgPWcogkWffMLRC6l3bhw39F63cM+5vNGV9i2qoCjxjm4?=
 =?us-ascii?Q?Af8DEfFRMO/lt2pA2jZRIIGW8ax44vcoUREOH5sF21iM45QbfktGXLw1W9q4?=
 =?us-ascii?Q?ywmAEWwu7lhkubFaGLC4XqPb4V/xdSjbrKKpH53NKRi/ErFodGDa7o5VWnnT?=
 =?us-ascii?Q?u97zM9F2vzITBD4qtIQH/wrF6y0B5+1/riF6+xPOOBV38E/38MwC9+whtkwB?=
 =?us-ascii?Q?3/QoYAfF1Y7zpNfbWUcRc47QuPjI2j+q088c+2sv6CZa97pFUzX4aUhEK435?=
 =?us-ascii?Q?cT2xf/NQd8c59PP+3B+UDNQZ+Ax+j3ge4tHO1h7tqm9/O84/k+tmcrHRG3vK?=
 =?us-ascii?Q?IF6dNljtYWw9JOpbYLRkf1uiryEyGbGlS3rIfZLP2PfUAMI4ad85gMha3l2Y?=
 =?us-ascii?Q?rXoHBE+iMhJIpLqF3KFuL9E6nt1Ssnjnehzfw2War7dPY78m46wdv3n1OvPO?=
 =?us-ascii?Q?AcXzEjBwIiBkaYEjE/7rL3ng4+ocT65Tyorn8hqfcXXgEJ/0nhyj3uPG/UGs?=
 =?us-ascii?Q?6hscqVz2bZJlOhhWEgXm3/U61rkmQCnnJS9IjKe0vfDylfhAdjxnWRwprT7y?=
 =?us-ascii?Q?rUV+FSKBcZM+vG8U3JRIqsLedCT0+7Z3Qbvtq8O6NCO1mH2CEcEiRT4A6G5v?=
 =?us-ascii?Q?YymMaGjeDoT4rSiwf+OphxBjBJrJpVFQWX3ocacJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e66b56f7-c075-40ba-52f4-08dcd25c1a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 12:20:20.3970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3EvMgtfrwsamqHio2mqwHAFt0ZpjqE2f0+H0dtIglESQ0tmQU9ttdBfd6zMlY1qblsT/Q5ir0BWTioVAPRMbIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
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
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Wednesday, September 11, 2024 5:36 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>
> Subject: Re: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
>=20
> On Wed, Sep 11, 2024 at 03:01:17PM +0300, Kandpal, Suraj wrote:
> >
> >
> > > -----Original Message-----
> > > From: Deak, Imre <imre.deak@intel.com>
> > > Sent: Wednesday, September 11, 2024 5:05 PM
> > > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Shankar, Uma
> > > <uma.shankar@intel.com>
> > > Subject: Re: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
> > >
> > > On Wed, Sep 11, 2024 at 03:00:25PM +0530, Suraj Kandpal wrote:
> > > > Move xe_rpm_lockmap_acquire after display_pm_suspend and resume
> > > > funtions to avoid cirular locking dependency because of locks
> > > > being taken in intel_fbdev, intel_dp_mst_mgr suspend and resume
> functions.
> > > >
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > >
> > > The actual problem is that MST is being suspended during runtime
> > > suspend. This is not required (adding only unnecessary overhead) but
> > > also incorrect as it involves AUX transfers which itself depends on
> > > the device being runtime resumed. This is what lockdep is also trying=
 to say.
> > >
> > > So the solution would be not to suspend/resume MST during runtime
> > > suspend/resume.
> >
> > I think that would also mean the same thing for
> > intel_fb_dev_set_suspend not to suspend it during suspend resume Where
> > we see
>=20
> Yes, that should be addressed already by Rodrigo's
>=20
> [PATCH 4/4] drm/xe/display: Reduce and streamline d3cold display sequence
>=20
> patch.
>=20

I see I guess I can create and patch above this patch series and ask Rodrig=
o to float it along with his patch
Series or would it be better to send a standalone patch now.

Regards,
Suraj Kandpal

> > 4> [213.826919]
> > -> #3 (xe_rpm_d3cold_map){+.+.}-{0:0}:
> > <4> [213.826924]        xe_rpm_lockmap_acquire+0x5f/0x70 [xe]
> > <4> [213.827102]        xe_pm_runtime_get+0x59/0x110 [xe]
> > <4> [213.827270]        xe_gem_fault+0x85/0x280 [xe]
> > <4> [213.827384]        __do_fault+0x36/0x140
> > <4> [213.827391]        do_pte_missing+0x68/0xe10
> > <4> [213.827401]        __handle_mm_fault+0x7a6/0xe60
> > <4> [213.827406]        handle_mm_fault+0x12e/0x2a0
> > <4> [213.827411]        do_user_addr_fault+0x366/0x970
> > <4> [213.827418]        exc_page_fault+0x87/0x2b0
> > <4> [213.827423]        asm_exc_page_fault+0x27/0x30
> > <4> [213.827428]
> > -> #2 (&mm->mmap_lock){++++}-{3:3}:
> > <4> [213.827432]        __might_fault+0x63/0x90
> > <4> [213.827435]        _copy_to_user+0x23/0x70
> > <4> [213.827441]        tty_ioctl+0x846/0x9a0
> > <4> [213.827447]        __x64_sys_ioctl+0x95/0xd0
> > <4> [213.827453]        x64_sys_call+0x1205/0x20d0
> > <4> [213.827459]        do_syscall_64+0x85/0x140
> > <4> [213.827464]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > <4> [213.827468]
> > -> #1 (&tty->winsize_mutex){+.+.}-{3:3}:
> > <4> [213.827471]        __mutex_lock+0x9a/0xde0
> > <4> [213.827476]        mutex_lock_nested+0x1b/0x30
> > <4> [213.827480]        tty_do_resize+0x27/0x90
> > <4> [213.827482]        vc_do_resize+0x3ee/0x550
> > <4> [213.827488]        __vc_resize+0x23/0x30
> > <4> [213.827493]        fbcon_do_set_font+0x140/0x2f0
> > <4> [213.827498]        fbcon_set_font+0x30a/0x530
> > <4> [213.827500]        con_font_op+0x284/0x410
> > <4> [213.827503]        vt_ioctl+0x3dd/0x1580
> > <4> [213.827507]        tty_ioctl+0x39e/0x9a0
> > <4> [213.827510]        __x64_sys_ioctl+0x95/0xd0
> > <4> [213.827515]        x64_sys_call+0x1205/0x20d0
> > <4> [213.827518]        do_syscall_64+0x85/0x140
> > <4> [213.827523]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > <4> [213.827526]
> > -> #0 (console_lock){+.+.}-{0:0}:
> > <4> [213.827530]        __lock_acquire+0x126b/0x26f0
> > <4> [213.827536]        lock_acquire+0xc7/0x2e0
> > <4> [213.827539]        console_lock+0x54/0xa0
> > <4> [213.827545]        intel_fbdev_set_suspend+0x169/0x1f0 [xe]
> > <4> [213.827729]        xe_display_pm_suspend+0x6a/0x260 [xe]
> > <4> [213.827945]        xe_display_pm_runtime_suspend+0x4b/0x70 [xe]
> > <4> [213.828158]        xe_pm_runtime_suspend+0xbc/0x3c0 [xe]
> > <4> [213.828327]        xe_pci_runtime_suspend+0x1f/0xc0 [xe]
> > <4> [213.828491]        pci_pm_runtime_suspend+0x6a/0x1e0
> > <4> [213.828497]        __rpm_callback+0x48/0x120
> > <4> [213.828505]        rpm_callback+0x60/0x70
> > <4> [213.828509]        rpm_suspend+0x124/0x650
> > <4> [213.828515]        rpm_idle+0x237/0x3d0
> > <4> [213.828520]        pm_runtime_work+0x9f/0xd0
> > <4> [213.828523]        process_scheduled_works+0x39f/0x730
> > <4> [213.828527]        worker_thread+0x14f/0x2c0
> > <4> [213.828529]        kthread+0xf5/0x130
> > <4> [213.828533]        ret_from_fork+0x39/0x60
> > <4> [213.828538]        ret_from_fork_asm+0x1a/0x30
> > <4> [213.828542]
> > other info that might help us debug this:
> > <4> [213.828543] Chain exists of:
> >   console_lock --> &mm->mmap_lock --> xe_rpm_d3cold_map <4>
> > [213.828548]  Possible unsafe locking scenario:
> > <4> [213.828549]        CPU0                    CPU1
> > <4> [213.828550]        ----                    ----
> > <4> [213.828551]   lock(xe_rpm_d3cold_map);
> > <4> [213.828553]                                lock(&mm->mmap_lock);
> > <4> [213.828555]                                lock(xe_rpm_d3cold_map)=
;
> > <4> [213.828557]   lock(console_lock);
> > <4> [213.828559]
> >  *** DEADLOCK ***
> >
> > Regards,
> > Suraj Kandpal
> > >
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pm.c | 28 ++++++++++++++--------------
> > > >  1 file changed, 14 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > > b/drivers/gpu/drm/xe/xe_pm.c index a3d1509066f7..7f33e553728a
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -363,6 +363,18 @@ int xe_pm_runtime_suspend(struct xe_device
> *xe)
> > > >     /* Disable access_ongoing asserts and prevent recursive pm call=
s */
> > > >     xe_pm_write_callback_task(xe, current);
> > > >
> > > > +   /*
> > > > +    * Applying lock for entire list op as xe_ttm_bo_destroy and
> > > xe_bo_move_notify
> > > > +    * also checks and delets bo entry from user fault list.
> > > > +    */
> > > > +   mutex_lock(&xe->mem_access.vram_userfault.lock);
> > > > +   list_for_each_entry_safe(bo, on,
> > > > +                            &xe->mem_access.vram_userfault.list,
> > > vram_userfault_link)
> > > > +           xe_bo_runtime_pm_release_mmap_offset(bo);
> > > > +   mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > > > +
> > > > +   xe_display_pm_runtime_suspend(xe);
> > > > +
> > > >     /*
> > > >      * The actual xe_pm_runtime_put() is always async underneath, s=
o
> > > >      * exactly where that is called should makes no difference to u=
s.
> > > > However @@ -386,18 +398,6 @@ int xe_pm_runtime_suspend(struct
> > > xe_device *xe)
> > > >      */
> > > >     xe_rpm_lockmap_acquire(xe);
> > > >
> > > > -   /*
> > > > -    * Applying lock for entire list op as xe_ttm_bo_destroy and
> > > xe_bo_move_notify
> > > > -    * also checks and delets bo entry from user fault list.
> > > > -    */
> > > > -   mutex_lock(&xe->mem_access.vram_userfault.lock);
> > > > -   list_for_each_entry_safe(bo, on,
> > > > -                            &xe->mem_access.vram_userfault.list,
> > > vram_userfault_link)
> > > > -           xe_bo_runtime_pm_release_mmap_offset(bo);
> > > > -   mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > > > -
> > > > -   xe_display_pm_runtime_suspend(xe);
> > > > -
> > > >     if (xe->d3cold.allowed) {
> > > >             err =3D xe_bo_evict_all(xe);
> > > >             if (err)
> > > > @@ -438,8 +438,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >     /* Disable access_ongoing asserts and prevent recursive pm call=
s */
> > > >     xe_pm_write_callback_task(xe, current);
> > > >
> > > > -   xe_rpm_lockmap_acquire(xe);
> > > > -
> > > >     if (xe->d3cold.allowed) {
> > > >             err =3D xe_pcode_ready(xe, true);
> > > >             if (err)
> > > > @@ -463,6 +461,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >
> > > >     xe_display_pm_runtime_resume(xe);
> > > >
> > > > +   xe_rpm_lockmap_acquire(xe);
> > > > +
> > > >     if (xe->d3cold.allowed) {
> > > >             err =3D xe_bo_restore_user(xe);
> > > >             if (err)
> > > > --
> > > > 2.43.2
> > > >
