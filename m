Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3032C3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 05:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67EA10E98A;
	Fri,  9 May 2025 05:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CE4NuODZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DAD10E98A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 05:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746768127; x=1778304127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=690E3cshlz7amvCS0TVda/r3n6ZGL5zwN7h5/SHUXuY=;
 b=CE4NuODZtCBC05oebMexJbaR/svvtd1wlph2RykEznXDo4+uuJXXGFnD
 +mLTXPgC6jWeXzt9/M8C7w1bTbB/oFM4IXcbpmeO+2BZuSo2vW+oqF7d8
 KpqyWNZhXZN9qAY5i0BYeX3DY3eRLS15HzcjG/Wnzvp5MbUnysEekkT2V
 4yThwvLChtC3Z+x7twr7yLBVQmpWAcENg3p/svcIF2D8SLV0Ajsv9lmH7
 gD+vOQwUAX+ulaIGayGFgRBCxYue19bfqIdwM1d6haN58a27W2Q9/mFR1
 Nf5qdHhlIIG2Dlc+mZlwD3ET3wFNl2tc0+/RR8NukurLIq6XSx2ksIJN6 w==;
X-CSE-ConnectionGUID: AvEbxiYqTG2p4JyZ4M8mkg==
X-CSE-MsgGUID: FvX0R+IUQgGyxreuW+mzhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59208505"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="59208505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:22:07 -0700
X-CSE-ConnectionGUID: GHx0TtskSoSCV31t1immaA==
X-CSE-MsgGUID: 8m1xx4CmRLqRbUxjBVW/hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167582584"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:22:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 22:22:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 22:22:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 22:22:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMRXMl2IeCH+mOx+YtgwTgOXkymf+Vq+prA9U6Zum1Bwc2JcgoRyVBiqyiYuWW0BEE7agJobBEjrcDx8ZRMBACPtzMvbnxF66ePaQVWp3Bels1FCi+0aeiHMRB7HQEgobmFKwr9StsX/QAuutdC03W2SaM/Eh1atB9h2RUoOwzNmoawtK3i17qd51EKtY+YEh3Fi/39aMkOEcTnAgz0sZEHR0dErrEY8Kvgyz7d5vrudXQGY+xLAR+IjcrpMS2Hhkg9KIJMjF0CDf/fB//xe+O3rbgR5bTLxZENpj/Auka1A7bCsonAqXluaMnJty02yLXY9deMzqeAP+pNHFuYtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfhMLrQ1mgRdA7idERB1khQBPaDsqK38etnm2nElGKE=;
 b=hAbXnR30x05tx9I0zDKREFMihLZXeKIdhZ+vWm2+Y3ioOiW5jPIEk6Cg7XFVhuuDgWk0233UYtVz+EDazQFM2cM+MBX5otGVYZ3i/sP0I5ohaq/zoSiNadFUgxzdCenPsO6ypC15uDNf4Zp028CSFCcYL+/Zywk852SUFkvJt02mGF5PbRzwbYGs4729OhZ/DaF4EZFh+X0U0bLgG558Szo82ztWXSCrawepNAF3sbm9YVZeCC3BWGp4W3r+ilzb3HiyVNR6LWfilng1gFuyGumswf5P4WHUVWUuvzQaTE+IGPq2O2yiSfNU8z3sSzTOUos0j1aNd3sbrnFG8zOaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 9 May
 2025 05:22:02 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8699.035; Fri, 9 May 2025
 05:22:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, Intel XE List
 <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
Thread-Topic: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
Thread-Index: AQHbvzhoGgF/1G1jZk+XRiKf1XRZ+LPIwypggAAhVwCAAOE5gA==
Date: Fri, 9 May 2025 05:22:02 +0000
Message-ID: <SJ1PR11MB62047295ECCE32263D447976818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250507101112.4678-1-aradhya.bhatia@intel.com>
 <SJ1PR11MB62047A2D7451CFFF32ECCE66818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20250508155426.GN6239@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250508155426.GN6239@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB5880:EE_
x-ms-office365-filtering-correlation-id: 01e4206a-0f75-4ee1-42db-08dd8eb96e0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AJ4MbvUApri44bY5+9+gYYSbh+kXKwFGq2dIO5BMXDVk4VsSiALcCU5BSGZ3?=
 =?us-ascii?Q?XH9y2PUMpfFVtcrqtJBS+Y6zFTaoberHkvvSsxDHeyh3gifRfVsZYpLawmV4?=
 =?us-ascii?Q?a4jKyVuiLZSenXPLNaCmQ5iBl+QoN49aFvGgc0kQlLPTma7Ixgbj4eMbm6tx?=
 =?us-ascii?Q?lf50ofXT/5VYUIIwwaqOB1AwUmrihn47XTLmVlLXNbUmsolpENH9iVZhMt+s?=
 =?us-ascii?Q?HCrbby16YHhvT0RslSGb5PDPFwv3pWAGe6kDqndpIEi92bs6vQKyvbp467vf?=
 =?us-ascii?Q?OSWrkGRUvTNywZIsM1iFgKnnrdxVVzpddNMHqYFkPcp3FMrEwh5T/pAcc7dv?=
 =?us-ascii?Q?gjOTJI1rTqkFHygmHgWfiUuAUKpxUo8XQej1EYwwKD7xTgTiWdexY+6qrQRG?=
 =?us-ascii?Q?1ciwLbgOC7p0lqZZA48UEoeWlk7m9giin1Iu7BvwHJZYopyLTwp7sZfJliWE?=
 =?us-ascii?Q?Vj/gr4hID4g+S7le/CQK/FxZFjIO7IvP0vHxIHnufHPwop5PlzEP6V2Ncf4j?=
 =?us-ascii?Q?0rwupGZ6/ho142N4zg/dsq2VP2fgfZV/CP477wF08btOc4LXSDFAYZ56K5eZ?=
 =?us-ascii?Q?mNsse+STdM4NVBbw0PsZ/QEwommVY7EQFw/4GbLR+U8uJ78l7JNK75huLoXX?=
 =?us-ascii?Q?4MFqRZNciMxw8a5HxNzLQwQhTLoAbE340NVohCIfFXz9IajuhslQF+0X4IP8?=
 =?us-ascii?Q?ZolclS7ekv1zDgrwbrYwUeHwZJJjbT4RFfi0+vGwNsXViFiIrBJuz2UdR2gF?=
 =?us-ascii?Q?l0DfE2+XAvjPA+5W5znmTsXi+/uW/5tV84LmrMfMP0oQbdQKBsusOAq9+mti?=
 =?us-ascii?Q?EqWAj/BYsXeoOCOkLtWCqlBS9PIBejylfggmcrkbGeiuXTaIteNS11CfGqNC?=
 =?us-ascii?Q?1wJzXihB1ILXTgklnWDvuEjOJfNNPEVJn4MPW2R9J2UMsl3J7XtsNmOFnfnE?=
 =?us-ascii?Q?5SSLxkHxezE8dY7a9Y3OKuFkmJscAL6BP61jNReJVmjSlMr58p17oIqgYGBP?=
 =?us-ascii?Q?/26PJSVIHgCZSWyEUjrq5FlmTWkWVTBDVFvXfNnrVFV1xLevTPkjXjdUKevc?=
 =?us-ascii?Q?HmOx+3sPNvIQwCTodLtKyVr1KHXDWAOzkD9FqEtfZqjl0OcaQBuQB7vND9vi?=
 =?us-ascii?Q?U3CqVEoV9FiYs9kd+kL+QC4lt46ERe+64FYKGYofprROyLSdlOAK2yD9Vrub?=
 =?us-ascii?Q?hopJ+zyIAxj817z1qHZJRqt7uZpDqE3Al+RXsW6kuraGZfIkwPQPZlCMymJn?=
 =?us-ascii?Q?AM8mGbJ4dP6RydhYs9b88RXtnRjaJr4v6Fh2LgL99Di734WUPNRwSt9RWAHz?=
 =?us-ascii?Q?trbZwLpyV8zECFPZI56fXxfVDIjPci0dD5RCiqc+KoIFUHBmmD25AR9qiNeK?=
 =?us-ascii?Q?9smdhgArqIO9jlhz4LaWJ94nypCQZF/IqThaJ5FNlxOfkRlZxwsDtDkj6ewm?=
 =?us-ascii?Q?M6jioGtP1Pd66P7nlphCCP8y/sPyj906JsavbGzbcvrJXfPdWlHsYg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jWBcV4MVwMED47q2EJEQzCwnussE+nh1eAH/LH83LYOEpP4txbWoKbdGypkB?=
 =?us-ascii?Q?Ubu2hZo+kY/ApyychOOkj9h8h6pna5yF62uP4dzdYDTc5O+X3CBkgqlD2yTi?=
 =?us-ascii?Q?8giii0QpTzyRxoiUUAsw0NMfpT+Y3TtgjYQhw4SvZoXym6ETCBmgSL3JqE+3?=
 =?us-ascii?Q?rNCp3gM8j3GSbPo9hgQ5oXdbRJpDiv4+Kjrihjo+wmj4AKW9vqIcmdPwv4do?=
 =?us-ascii?Q?wKTHYeLaWIy2OWtw1g2YNyyGpltfX4dWTIS6uChZ4SBXmPrYDjWKXueTCtBk?=
 =?us-ascii?Q?PwLV0nfi9QDXdJ2ecjtNnSItH0uN5Di5Ql8fz57L2lfp7pkiriTKKinRuf2J?=
 =?us-ascii?Q?neeeZW5sh6BsGFA9XnZIJnC8/HUhFHsZsNInO+dEogweXzHRbV6nTMYz+KjS?=
 =?us-ascii?Q?2yezA9G4caYmWsQ22fqNqiyaCCp9qF04P7AtPZeFbLj5ipmT9iUgpy20twWa?=
 =?us-ascii?Q?UVE5pS7R5s16CvdKCMMK6YkFEYg6gtpnuAQtmC2KMdQhaMgti/UsT2PHSIj1?=
 =?us-ascii?Q?zyRVLyHUWP29FNax/nfLYixcIl7mdGOad6dF3CdEY7x+fewosjnNpjJbifiv?=
 =?us-ascii?Q?AnCmL4DOEz5sNPbtZiMWRshGmrvjq40x11H6Ksy9BnKYhmEq2irQUMZbKX89?=
 =?us-ascii?Q?GI38imR8XvNbnQEEBD3GIXVpN85e0ZBdd9sJXVHBPmCC7AXscB0R2rzc7kjj?=
 =?us-ascii?Q?9qiyAp/Yfd29J6JtrD0i5nD/JhX3ghXtyJE+Ap4tZ2LOXgPmq3d6/1qn/eVH?=
 =?us-ascii?Q?PtLEu5Rqo4YGR2TzXNUMJDVMNQpkiQmdDHDhYaSb3mmoA0HpIkG74q2rOGz6?=
 =?us-ascii?Q?DZLvgLKz2NduSQuoBFy5HUuFEZM8amVg4k7CAm4GY9yNLRDfFaEGK+gL2MJE?=
 =?us-ascii?Q?mQufkk4G13ZGOl366HWrqLhNhTvDUsYlzrO2Eb2M6RHNiVBntg7m3aog6R8q?=
 =?us-ascii?Q?o8nLBUI3bQF6U1EaZcUeJCsotR/ThMKGuigT+AkKiaSLg2U1pgapb06PUKmY?=
 =?us-ascii?Q?iWMhCo4ZqQrtIc+03M3twZNCarNuD8m3IAPZJzGhG121CWiEMlCmnotkU/Yi?=
 =?us-ascii?Q?pBMnWqPfcrlMyRgiOT81888fN6pysk9UapHyfS4AhnapGbNsMjt8fQFtvvaj?=
 =?us-ascii?Q?ooN7BBZJhYZElL94hebBW4zRKVw/vom+dRoXxz7FKDme7e508dyCr44aNJgq?=
 =?us-ascii?Q?mBonrheuiK16+WF68MyM6sgR/l770sLH+HuvTquUcNUAW7LczKjD1ReNd5Xo?=
 =?us-ascii?Q?txGE7Q4Vcj75nzRkN5JBUuooF7WkEMoRc6ZHk99hFJ+v/dXNZQQ1F38gp1Wg?=
 =?us-ascii?Q?OlvGxfTOR/OgY2tr12dDKSdihsPd7Rp9iq05tF3d1l9p+5aDayb10YGWkswJ?=
 =?us-ascii?Q?JPOkMTwv6cjzprFTxqlC9rwM2zzJXf+kTigLTkgu1uopYTORH4wid4WqwAoU?=
 =?us-ascii?Q?06mI0XPp4zcm7A3sln/SQN5bNazuHIMuP7i1tS+PWbbtNRr5sP0Cy0zMMhjI?=
 =?us-ascii?Q?Vta0FkqBQLNMvuoiOFe++gUUUGF1RWSs1oYGu2+5zHCr+oSdhfQ+bVt4058o?=
 =?us-ascii?Q?hwRy/keCcUhPO96mqicCl4OnBbNKwe6mCCKGKJpeCpodrn4hcpSVWA2oUcya?=
 =?us-ascii?Q?8Ch5hW0BYThnZI4/N0pbQrLB+hgbnaOcwIBbdqjQPUgS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e4206a-0f75-4ee1-42db-08dd8eb96e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 05:22:02.2736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JqT0NM+H53B4W5nYAPcD0ZPVrfDRQVGzpba9qMyHxujW6yMrGgTt8s+dC55qUd5NuXSvt0E19fKrMooLzho1kfUD2hOSPAtxEblbb1w0u0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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
> Sent: 08 May 2025 21:24
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Bhatia, Aradhya <aradhya.bhatia@intel.com>; Intel XE List <intel-
> xe@lists.freedesktop.org>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
>=20
> On Thu, May 08, 2025 at 06:55:52AM -0700, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> > > Sent: 07 May 2025 15:41
> > > To: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Cc: Intel XE List <intel-xe@lists.freedesktop.org>; Upadhyay, Tejas
> > > <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
> > > <aradhya.bhatia@intel.com>
> > > Subject: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
> > >
> > > Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) platform=
.
> > > It is a permanent workaround, and applicable on all the steppings.
> > >
> > > Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> > > ---
> > > Changes in v2:
> > >   - Fix typo in the SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE macro.
> > >
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> > >  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> > >  2 files changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index cbb9f7cbcfc0..5cd5ab8529c5 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -156,6 +156,7 @@
> > >  #define XEHPG_SC_INSTDONE_EXTRA2
> > > 	XE_REG_MCR(0x7108)
> > >
> > >  #define COMMON_SLICE_CHICKEN4
> 	XE_REG(0x7300,
> > > XE_REG_OPTION_MASKED)
> > > +#define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
> > >  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> > >
> > >  #define COMMON_SLICE_CHICKEN3
> > > 	XE_REG(0x7304, XE_REG_OPTION_MASKED) diff --git
> > > a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c index
> > > 6f6563cc7430..67196baa4249 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -827,6 +827,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =
=3D {
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> > > ENGINE_CLASS(RENDER)),
> > >  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> > > DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> > >  	},
> > > +	{ XE_RTP_NAME("22021007897"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> > > ENGINE_CLASS(RENDER)),
> > > +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> > > SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> > > +	},
> >
> > Changes are ok, but why its LRC WA?
>=20
> According to bspec 65182, this register (0x7300) is part of the RCS LRC, =
so this
> looks correct.  Note that you need to search for the offset rather than t=
he
> name when looking at that page since for some reason they wrote out the
> name of this register in long form as "Chicken bit for Common Slice Regis=
ter4"
> rather than using a symbolic name like most of the other registers.
>=20
>=20

Okay thanks, right, LGTM :
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas

> Matt
>=20
> >
> > Tejas
> > >
> > >  	/* Xe3_LPG */
> > >  	{ XE_RTP_NAME("14021490052"),
> > >
> > > base-commit: a127cd437da1f18b6ecc9e03226d8e2b2aa79dab
> > > --
> > > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
