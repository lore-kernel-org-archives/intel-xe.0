Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B2C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 04:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173E310E1B4;
	Thu, 10 Sep 2026 04:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7F+/Qa5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC5910E1B4;
 Thu, 10 Sep 2026 04:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789015085; x=1820551085;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RIuqYizwHmDujdU6V0cFENMMfs9OwCcjWZx4V3g+VG4=;
 b=X7F+/Qa5mPNOmD10QLVy9mT2TKG9VDPSiHx1VPPfQvpIWmDohrbRhEL1
 giBTuosXbDmxt8DUwFXsSYofTJwu/r5hCjhPiCoFtqwyhl+ojboZWi4J+
 K0WJNHB/rZBMejUZYtHZBFCzWKJyYFrREyZQA/LV/6j/fhw6ukqNVYfRC
 seJuQXUGnSHMdMhfOTK5gBgPOx5kO8yca2Jb6mOHIhI5hFnSty40Hw4zu
 JLhUaem1uDk8NlCeDeVb3Q7oubZje2qKAYIGoGtIVfx+saXPQvKTAeYJx
 iLyDLSk3T9XrNt/XOGdLATrUgYc771TnSUHJyyPI5VlT2kgdMbb1RyKla A==;
X-CSE-ConnectionGUID: kOXXbTKPRqyvxg0AARgzOQ==
X-CSE-MsgGUID: vssIZ7WIQXaB7V5cp60aug==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100048788"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="100048788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 21:38:04 -0700
X-CSE-ConnectionGUID: 0Zz5+xGdTsCbMcfEf01AIQ==
X-CSE-MsgGUID: uz+LMiN4RfK1uH36qkZPpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="268957082"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 21:38:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 21:38:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 21:38:03 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 21:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FL9rAgISWOphS8oqBvF3n5MTKji3EtV6LbhhsK2PvoQsqZKdKTNd5P7Ye7fNskoGWMEl1qBfKvs551TGwTHsdWoYxo5sPJIfxiMui1ZfyQqkvag+AlkdXDhn50B5XRJAspzn3mEQLEtNsteKmJaX+A+7lqdTsNnPJCn6Ots4O410QMQynOlY7H9lN3Hqhx8rnHe8/+2Qr5z0BMBTSk0zjYkiDw0D5JzP1CgNFIBzQh9li5/HTGnR52txktfZVe9bdl7p3t6z624iVs2LHucamuLtlOOWFTLlp3Kgt3XceA1Oxm1KnNrHlSqs6YFiuypcxnQrvEAAdSBtTTb6UHeNaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnqgnJKGHpHz6qZr2XFV+UggLJFFii3SJps1nDCmAbY=;
 b=DB7he/kI8U4vxmhRnZFcqDdcUjgj9R0R9hYBMo/OvxOd0sl6SX6ck+tRm9OQ4GjXluByRU8O3s0/2Q3eYAAuVYczSepOQf04KxIce2TUkRTUry0AjOG5VQ32YuqMssYHuXnpB1a/8OldIiU4+OwxWsWYLyMzgZyk33FXGP4uHGEr8n0IfdCS0U+gIcl76k5XTkQNhjoTwQSUHDjyImG0TaxLwncYgWqqcW4OGg0qgc0wb8crXw+AnJAC/eXbKvGyMI7hejT7m+Ymub1Z+I7l25kvFlBI5/+P5wdzWHMPn1eOSJJU0LassZOptLJf5hob2sGVtq9+qvh6/FOLd/yGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 10 Sep
 2026 04:37:59 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 04:37:59 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/drrs: Synchronize drrs activate with debugfs
Thread-Topic: [PATCH] drm/i915/drrs: Synchronize drrs activate with debugfs
Thread-Index: AQHc8dUnBv4DB3stOUasJOT+MvRGZrZA6gKwgIbulvA=
Date: Thu, 10 Sep 2026 04:37:59 +0000
Message-ID: <CH3PR11MB7300219196761BA4157AC11CBABF2@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <20260601144255.1481931-1-arun.r.murthy@intel.com>
 <IA0PR11MB73078D7B4B2421E9237DB3E1BAE52@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73078D7B4B2421E9237DB3E1BAE52@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|PH0PR11MB5832:EE_
x-ms-office365-filtering-correlation-id: 28a69597-d3f2-4831-d1ad-08df0ef54aae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info: /fjupt0g+g0EEGEkbhlf0dnhRZ4v2PtkFOf92q2727ORM+idKFEoScHQAxKvt1Khph2+1erHucarOAlpY8MMymSfXDRk09uO8liXqIA7LSTOEM1N++yL70DbSEKeFwLsC5c6EF7kHHTJKGny+CXh5I9oKwlh4cT9gQuliOK25tvxXjVFiu/H1xTbMMG10pRUCD2sxysOtXU4Z8e/Qug0MlN5xDgpmIJifLpcG9Agu03KuQAeZLkYyV3EBaV6+efHKWd7XdubHS3kkhVJfQkp1elRGqxR1rKRXJfHCotyE1yiK327nPsJr+Xd1AX6ikDJTntbbjN9nhAxq2y4YFuKHQ92wqtxylQPNExTYSvAb2X+k1SVKny2rYzNnNRBGo2WsQj0eW8T82GDEyvRs/gL6yufx4sVDwaK8p7kgOoUbeJKmKORA9ieVXMleyIvb5OHuXvYWCxx/CdtBsUlnHDhQh1bFfwsvtPTo43iuNMgzNzfqkL23M7ORfV3j3otuTv1Y6P+yyLJGkEP7oiqQkfab8yV0n//eWHbTGRbd1x6legrAq5Jpp3/ocdPewVpB2jlua6ssHZKo7heX+t2c3nuvnhb94i6o/3A7fCThbXHDpkF/uKA5VYdmwF3GFJRTB6CHvB+2oIj9ZQdmE+JPlC6SFWT4b+iDdYq2JKoAExLK3o37/OAuzu2gFoEHtI/NzR+uzsPlzn08oBvHt4OZ6ZWKG3tQRmDNXyUIA7H5d25CFU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J52cdHE+k9PuMxD79+pYmEjJmIf9iZwkU4JIrRbYhxPMjU+RXPQKT3Mx8UGI?=
 =?us-ascii?Q?37m8UglfrOvmzNuTqYQQaSF0LVNJest2GZT9CsTZgCthKgShIU4cKrqQou/C?=
 =?us-ascii?Q?uoELxNr6/Rnw9qi0bRlR1GCZ/LyNPu8sBpjiLICONeCl0rXlRY0w9fv34F7y?=
 =?us-ascii?Q?nkD4848GYxAjLKyjFy2YEVLFrBQFPttVw3b9ByBTCTi1TZhISH7nM+Aik+E2?=
 =?us-ascii?Q?6ztqs8mHNe1FqRQgSrFKVjHAcDIRkLzBwvlUeXbXgMHsGmhArkNoggOFOSGv?=
 =?us-ascii?Q?RnKc2LQeQPe97Ser7mhx0URq+GZx1XtT3oIBgAmUHpWLWIr0jjX5hOrj25Ii?=
 =?us-ascii?Q?DRLVone9KmjPTr/+V0BaX1VTN5O80K+WxA3/uw7PEV+O13X1Pxu15dxOuz5/?=
 =?us-ascii?Q?0ZXJUjCpdAfaOq2AHbD9flcXRP/bvqSR+tzjkp4JfubfRsiWJ513TTSZhjxt?=
 =?us-ascii?Q?qD8Ojd+UvYD7POrincc2u1Q9uX9L19gFwsoAglyT9ym1DB8hAINZDq3aUYvo?=
 =?us-ascii?Q?pZqjWG/6qM3byBxoruX/VcrZDkc4MTrXIzDLcoBPybHx6HT2knp3MsM3N2b2?=
 =?us-ascii?Q?YrAGwSHSMV43eBlBuTck0ugFqllCW+u8kXO68rz8DO0+Z8nc5ZVScMwGgIMj?=
 =?us-ascii?Q?hKLlqY1IKa+S2Z+N7RGkxAW2exqrw7GGJ6PzhZJ8cTLc36EeiEKYvt5sDqgK?=
 =?us-ascii?Q?U73C9MCLvl1ZFDntPV4bEYjiJz0hbWhZpVDdZnRWO9X6UKS3eXIGbvQ3ipYd?=
 =?us-ascii?Q?h/O8TrGi/wNMhBEfIYNHh1RXzC5cuXG3TT/gY1XiJ79B7ipCF5js/yL5me9Q?=
 =?us-ascii?Q?rF08oI5UYf58HdaBRrXmVl1FnPAJ7zD9kU2MtZqtAQ+KM65UlhWBg6b4dTdS?=
 =?us-ascii?Q?Np9hQ7vEtVafor/xbxrzYtdjg8SgLQBOrTvo486FnyN5TB+5UdwaNt6Grgm6?=
 =?us-ascii?Q?sWpXk7lp+eqcYXNUx0Ye0isbbxUO9t+OIM80l9PjWfZyJOaz9X/GjJC5EyPh?=
 =?us-ascii?Q?TG/vL/r8jkokTpXoVzwu1vWqjEb3NWTNjFb+PzUfl/+lpAKdi4eFOrSqxaCL?=
 =?us-ascii?Q?SvTNg7wHtH/W98Sa7Do9VgW9L0zHh7dTvGUmIcJfUoMOlBRVDjwb2d84aYvR?=
 =?us-ascii?Q?AnZEr5W/fRzsMd/E4olF2qsldGVIwwkeTYVcKrLJKyWNa/tsev6Wx11am735?=
 =?us-ascii?Q?i3x0Z/3UE1milhBFLAc/VPIA3kkZZRmp7JlkXfKvhvzJuj3bJ8MC6YdDADJj?=
 =?us-ascii?Q?ghWdX6WXWzttklily9qMdeCPUocnR6nryVABY4hLOvUPWCwVZe/cXxGDwvXf?=
 =?us-ascii?Q?WT9Z4yIMS9PFCEziduHV77dR/xkDzHCzlcpkpDZYkFu+BA6dXRYK++dTTmgT?=
 =?us-ascii?Q?q2bjG97UCHDYAj88IyCW0vHg48GcRrAzVeB2QulsP7YxS98gDIwCTyN3Xr0r?=
 =?us-ascii?Q?JxKrpSTXs/Pt3FYfjvV4Iz51/eVnztHjEODXYUdAAlT39K2KDcnleQrq+n0O?=
 =?us-ascii?Q?PLdfNsr0/dKe0SlQV4srS9OvqSJAwslq/yPOOBbHZVbz71059WrMKyEqVp30?=
 =?us-ascii?Q?9oVPNdZ5L9wfgJrFxldhav6UFS0jJw89mRQtcxziMktBmNFmmv+nGG9MgG8Q?=
 =?us-ascii?Q?ZGNKJWnqoQxqwE7i7AUVBit1am3SChjvOFLlILl3+mKZX78Xz1nUvcu2TEM4?=
 =?us-ascii?Q?3vxpXyTCzZa7S5PQF+tSY1RDqIh56SW0cNlx7WlCdqNHJMQohw5mFCQv0nYD?=
 =?us-ascii?Q?uYYzJq02hA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: L4fNwGAeXKaXV+EK3sX7muqxZBNtW5aXv3It17s9xqh2KkI/UUlzilA6ZmoNeUkvtlh5EIY9Ep/k1xBK7/bKeBC6uX8pqHZfVWV1VSZZSB7xELwVGrN5PZ1XJCb9z9nhDRrYRwxjshN1Pia4AVk3VntM/ySQaJrnKWBRsmgaBxSDDGIKKEU4jR1W5XLR0Bx16Q0vORJDAnDFJVOlstwlk4JRQhv3KyOqkx84mFuaMIraBHy++mxftmD3NlMX+f0FjIR9Hb7jkut70NQr++UW3HHRPU7IkZazlsxfmpTkFarZl6+aaiPgXefr6lcIQOs/VbwDIr+CeLoRyt5Jhu71Ow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a69597-d3f2-4831-d1ad-08df0ef54aae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 04:37:59.2373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NRW3najmGLSK/ZvymPQXS8RCSsSXlq7Fnf1LfYLWIhcRiWBz1hqLfZKfyWEBoEqI6fCC9r3IVarmW4uM2DhFzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
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

Gentle Reminder!

> -----Original Message-----
> From: Murthy, Arun R
> Sent: Tuesday, June 16, 2026 1:36 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Subject: RE: [PATCH] drm/i915/drrs: Synchronize drrs activate with debugf=
s
>=20
> Any comments?
>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
>=20
> > -----Original Message-----
> > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > Sent: Monday, June 1, 2026 8:13 PM
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCH] drm/i915/drrs: Synchronize drrs activate with debugfs
> >
> > Honor the drrs deactivate coming from debugfs and keep it disabled
> > until the same is enabled from the user.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_types.h |  2 ++
> >  drivers/gpu/drm/i915/display/intel_drrs.c          | 10 ++++++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 84bd0d993197..709595bde8d3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1537,6 +1537,8 @@ struct intel_crtc {
> >  		unsigned int busy_frontbuffer_bits;
> >  		enum transcoder cpu_transcoder;
> >  		struct intel_link_m_n m_n, m2_n2;
> > +		/* Runtime override; set to keep DRRS off across commits. */
> > +		bool force_disabled;
> >  	} drrs;
> >
> >  	struct {
> > diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c
> > b/drivers/gpu/drm/i915/display/intel_drrs.c
> > index 0fdb32ef241c..6bebb04034e6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_drrs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_drrs.c
> > @@ -165,6 +165,12 @@ void intel_drrs_activate(const struct
> > intel_crtc_state
> > *crtc_state)
> >
> >  	mutex_lock(&crtc->drrs.mutex);
> >
> > +	/* don't re-arm DRRS if forcefully disabled by debugfs */
> > +	if (crtc->drrs.force_disabled) {
> > +		mutex_unlock(&crtc->drrs.mutex);
> > +		return;
> > +	}
> > +
> >  	crtc->drrs.cpu_transcoder =3D crtc_state->cpu_transcoder;
> >  	crtc->drrs.m_n =3D crtc_state->dp_m_n;
> >  	crtc->drrs.m2_n2 =3D crtc_state->dp_m2_n2; @@ -376,6 +382,10 @@
> static
> > int intel_drrs_debugfs_ctl_set(void *data, u64 val)
> >
> >  	drm_dbg_kms(display->drm, "Manually %sactivating DRRS\n", val ? "" :
> > "de");
> >
> > +	mutex_lock(&crtc->drrs.mutex);
> > +	crtc->drrs.force_disabled =3D !val;
> > +	mutex_unlock(&crtc->drrs.mutex);
> > +
> >  	if (val)
> >  		intel_drrs_activate(crtc_state);
> >  	else
> > --
> > 2.25.1

