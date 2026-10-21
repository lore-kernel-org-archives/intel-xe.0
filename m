Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F85606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SOgc5dEw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E0F10F8D3;
	Wed, 21 Oct 2026 05:42:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81C010F8D3;
 Wed, 21 Oct 2026 05:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792561352; x=1824097352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kh0X8cdlLKGXkP2ks77YMN/GgDd18J4CqtH1YDBPCYo=;
 b=SOgc5dEwuDRi8XRkRnxp1ud/2d9IYAVmRoPlCD9kvo0QI99TpEV0vucs
 cgJvPZjquEaD8iVDhozNWT03zGdzXMIrGk7qKzhVb2Z3RgXtShVJxVq9h
 GfNJswDHqHkOxR4GuXv2/kot6YBdOtz5vEF2CMxAHs8ThxuIBuUmtbika
 rHUi1Hoe2bPIEP1cKpDKtKI4c3ExnDj/1eHl0koRDc7zd9dG/duSMJm/l
 7r6pPWkCaFNSwaWbwNW9Al+/t2cvM4wDp9W2Yx7vKQetegWbyZl2jynRM
 x4S7rK5aFLJTfSvDwwp8k8HMddoC4cFN/gCsS8Mhm4twquD1TOcBIfT8q g==;
X-CSE-ConnectionGUID: CGvEggiiQQyMItIlp8pHVA==
X-CSE-MsgGUID: u/4jDyrWSIaPTcad0kYf/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1164166"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1164166"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:42:31 -0700
X-CSE-ConnectionGUID: FCCJOvXfQ+2YWr8D2bOilg==
X-CSE-MsgGUID: y4XZ0AJRTR+Cr8c7lXgnkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3046683"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:42:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:42:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:42:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqPDIvDFYmqGgle20W29WR8sGPTNmmarnKNrvYzhBzZGfweyW/R6yr6w7CT0nA8vBcspY3N9tyJhsAVL92yRy7Mqp9EHGLQ5+ikZ3DZx79ChUWgSAub2BnIAgZkKAxpgbB2ksuH/9X8pNXJhcZuN/tu5G56MIYvGw4jE7SBEG1wx3MCGayNXdlYAUeX6wcaoDpDOxiz2T5AAzgbK1H0yoTWzv2QCU8QtehNj7mIM2sbTGhonTFkGTB3M5ckG2zctdV1DMU77jTo2u/i+YYg9wI0gzsYnCsipNwTGdFqiGyU4d4oCqlI7gNQ/cPo3t9GsqU8UbG2aY92JpN212d77Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVebncNArv/xnIrdWboxIOQX4TukiaZWJ+Skf4behkA=;
 b=VgGqSLz3FeJi7wmYiVdml3Ry3W6r7XHmAGpc4VbcvQa4x7bVURI+V08prBFEUePrqT9ryQaOj17T3rbwidcyrV8+7nNu5Wy4icUFDu3Ml4BJiUuFkXC2jTWgFPXSNjuuoV8PfwoDaFUBEHwPAYx4CjWhn+4KTEptPFPbi67gbnLNVsOWbEgxsk5dJJagt0K9gVADZ2ivJS26BLxSoY5+E68cc359ZizzMtx3p83+4i0wDTAexODilJSu/HoU4pQMcXq1A+BJflsbmcMA2m+E1klTT/ZCJmPkLw1WDY2zAwZgK/4NoBDxVv4RHeB0kVaTTWaWzTglGRwaJL1WzaglRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by BY1PR11MB8078.namprd11.prod.outlook.com
 (2603:10b6:a03:52a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 05:42:19 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Wed, 21 Oct 2026
 05:42:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v4 08/10] drm/i915/display: Implement Wa_14021768792 for
 BMG DP for link_m/n ratio > 10
Thread-Topic: [PATCH v4 08/10] drm/i915/display: Implement Wa_14021768792 for
 BMG DP for link_m/n ratio > 10
Thread-Index: AQHdRmKEvCkQmsao+U6kYx/NMnBtxLb/OXeAgAh2bkA=
Date: Wed, 21 Oct 2026 05:42:18 +0000
Message-ID: <DS4PPFE901A304F52FC3B8346A6ABDFC471E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-9-suraj.kandpal@intel.com>
 <BYAPR11MB3783EC87B61E7A237D3921EBB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3783EC87B61E7A237D3921EBB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|BY1PR11MB8078:EE_
x-ms-office365-filtering-correlation-id: d43126da-9e8d-4301-5685-08df2f36121b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|10070799003|376014|261009223027099003|38070700021|56012099006|11063799006|4143699003|260925022911599003|260925021911599003|260925021311599003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: jYuuqSD+yzlIG/P3O3CSlP4xB1fbyBgg96/I/aU6GGbceOYUUPrifNHAXinux3ZM6HPNNXCeMnIXx97a6QhH5nc7EbM2XEn/3rUgccgdpnW10B1/F8zX0Aaocy3WRHFr8pfK467LhbS1QaK+OfRtYBAL+UHTJ1+DgcoSq50UgV9SFf9SLwPbFmx30sGpsgFgL+EeEwgv23uFqw/ltApSsIUeZmmEgUextTfqTiIqMvoflNBe5uWhh7sWMIM8HIiXjPoUxQKuTrIagPdory4q2yROkqSlAHKrp22z+uGmqvzCWUr+GdXol5CX203tDjil10HQG0uB+PXG3J1QpAmmJRdNOlfVU37u2TA2m6ZVfRYMluQTdxooQuTTbPsg0sQQwVqSUYGiyCcy+f2z3vCKGZyVeTlNq7Hz5NTZAoFfzW0LpRaRLtZukD12K2PsgDnLmHRfb5fb2Hh/Zj4RGNm4B9Z/w7jnWtr+8T1siiySOee3o60IA3NeiUtvJFM6xIWqIPMzcyCv87LhGcpW7Ozu4VVwzCri2uD2I94fP46hWt8dMRxdWEzpdI4LWeHDWRMErYORH45JXN8LS2Xu4GoRRGMTY/8fMO9ci990DQhAWqGZDPJYBkbRhy2n0p1LT493AAtY7HthoFr++jV2TzXa0rxEfLPpa0UCUYB7EUc6NojHCUS+ARzNRkgTfUYiX/wTRGU38vb7GTGFbRH0bSEcWPCukeieWSToCecD4s1iXUo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(376014)(261009223027099003)(38070700021)(56012099006)(11063799006)(4143699003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lA/FecRCXz7teYR1uyhwqF6sG0jqPNGQ9krB0AT9ZbxBPl+tEAhhBkjrqzXu?=
 =?us-ascii?Q?MiKH1hXMNrZek1RtzBBcIj2QdthkGtn53ztytiBFKo5WZ3RpW1G5M2k4SqRG?=
 =?us-ascii?Q?c5NeILhDnCQI+t9nBGablcQ3k3d2q+H35R7xrW4AkdkVxBgIqUWQuFydAmBa?=
 =?us-ascii?Q?j9Cz02ayk9BhYjmhq+Pvn/LfhrzrDzwaqnbuNjZyWKwRfG3voOgKFGimGJ1h?=
 =?us-ascii?Q?m045soCO23WShld9b8H3bFOhL+EKs2ItiUuE+/NBAmcLffD67g03o5BDU8BP?=
 =?us-ascii?Q?WywUzMXc3FSe7LmdVk7tb45MhgzRRj8pCvCZhPDV/Dx3sCu/d91JxjAXn8ex?=
 =?us-ascii?Q?LnLgmBhPogT3cDFg4PsIORw4ttbdEOqsbEIsH++ZfSWK0zBRJ+BNzFiEfLRE?=
 =?us-ascii?Q?OxHDqrgtJq/zLFE0KSAPmBBw8oQa7snq/xfmWzDVKsMTxhvvH3AinLQobb6j?=
 =?us-ascii?Q?siOHM57anqD/EwcDomN/1xQm500Fdv+fssFGMF14fSOGIhZ54kl+hMdzFa98?=
 =?us-ascii?Q?4lgAEqE29E8wfzxUlTa8jCkg8mbZuXr8elnafwc4lwL6uh8RthjN+reqya4Z?=
 =?us-ascii?Q?UZHhd5lMybugT9qXMQFu2wylZ6JAGVEnvryxV3Ibr+SWq73J5dL4BCdBu3/s?=
 =?us-ascii?Q?DX6y3OViJAZZJ5RrQlcECs5IGhwYVojFg0NjzhsgP4B2n3Pi6q9JfNL8hsxC?=
 =?us-ascii?Q?b4v4MT52kEvh5+AXndxPR2NyRDu68FhIeGAKkwMPUVI8llJFIKqe5uuDizO5?=
 =?us-ascii?Q?lFG9/71gIRwphTgH4gdHUKYKpiO+rOmHK/Sxl4opViWVNsg7oiT+zy0L6sNE?=
 =?us-ascii?Q?2KDnnbmVJVNKx7fW9oLBV6ZMkzdYJ0P/bkVyo1P2gw7N8gc9RLMUAC410KD6?=
 =?us-ascii?Q?F8ep5NAreHBP7PT0IrzNSSIDRclgoEwNQ73Co1jEW+IXQCHIydrHaN8iFrhc?=
 =?us-ascii?Q?/j2n3AtWStKd+EGAwEKWFUmY8hpVLzL/kJmafJoT8SVxGWzAqdvVRrdz9xC/?=
 =?us-ascii?Q?bfiwn4QesQBsEDKVy+T8nemATd6WZbCWKOo0SymLxA7iTzDAo78eb0xPuRep?=
 =?us-ascii?Q?V1xVlFpTqkV9GfVoSPVlbZC4SUUo0CMY9KwN+JMpyt7y2WowFD/ofE0MOkZ+?=
 =?us-ascii?Q?T4cYV4I1kY7AnJFLLQVHN+FsF2qnea6zSmhCrH7AmHs2lmaJpRZS8u9NI4mR?=
 =?us-ascii?Q?IrYfuGV3fAjvDWxJjz8Yp9P/khplKMlPNkJWpYOeffAsihwPwv4kQGgyt1Jq?=
 =?us-ascii?Q?PF9LDVXPnEmjTI5m6FzXApEcOHi1uLR8FsVlY5Uo7J9RKfBjgqVZWCOIfX7s?=
 =?us-ascii?Q?XPGm/PUJUvuPewpmAFlu+znRaagsQv0c4Xq1mt0pSE9ha4zDHHkupvV8j27D?=
 =?us-ascii?Q?k3pPHAhO0+j29rD2nR0C8+DiUeeRmylUxTo19cV1rWgYhfoZkpV92I7cIXeX?=
 =?us-ascii?Q?hDMVj1vOnYBAVbaLIFK0ps2HQnb3zOdveqFvlM5ajRhseD+oMBA28h26VATl?=
 =?us-ascii?Q?P/rgVK/nwKvbQWsWrz5fBXZVO5AQ3KfbHF480IJP/nf/d3lgo4eUsnzfCQEt?=
 =?us-ascii?Q?TJ80t/mVhK7ywMlPte2MylVGePmVnhZ2Xy0KggoYQBaGHEIA4dkdx7kaKL4A?=
 =?us-ascii?Q?zMx4KPdoRWpEFV6xuXIr0fEDHQHaLHcx9QxC/uKRiBX2meG6WJRAY1kOgQ4d?=
 =?us-ascii?Q?MLNuZerSKdQSxirFsbdapfS/zXKL2N7duwwxMZpi+NfZRmRayu6NAcMnrOQo?=
 =?us-ascii?Q?+7ia/NMczuO+3aP7PHmgi/c+6U625mZHLtf255wzBztxNAWzp0NJRuxv5h37?=
x-ms-exchange-antispam-messagedata-1: 9DsaoLnzKZ4dHA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zxrVShlqSlI49GzKWK36LudNr1RfwiGTHwaCCyNBIJXr+7Lyx+IOL1hVKC99JPlFarn7GQg/tkShiBCeFR5Ie0Q8C+mY/VIusAh9kz0wkk4OHaDdH/mX8ZteUmmB7djxoJe5yofNt0+NhXhCyih7cTPRfueXNT1qLR+YpLyppgibOoy87yS7irlzKvbJK/VkXUtIwmibRDDX36BC5RMH0VXUkFE6RgS6KI8fBGoHQ2Mb/hLThcUFK6mDAeHpHWvDBCfsvtbISC0gPvjByzyslZ8+G8zTWs9KvSuogj2IImhpwItlleF4N+3N7g9UPZHcQyzRPjx58FNBRVEIq+LZ/A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43126da-9e8d-4301-5685-08df2f36121b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 05:42:18.8346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyxH95CITuqtI+C1QyiZ3ba6g+HAns4zr5eNd9l2AgBCBb4r7PXTOEYUcRvgfJwYpE/kFRuCh3KuiizGL3yhYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Sent: 16 October 2026 01:54
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH v4 08/10] drm/i915/display: Implement
> Wa_14021768792 for BMG DP for link_m/n ratio > 10
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: 17 September 2026 10:37
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH v4 08/10] drm/i915/display: Implement Wa_14021768792
> > for BMG DP for link_m/n ratio > 10
> >
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > Handle the bypass logic for the M/N ratio limit for DP.
> > Calculate the M/N ratio, check if it can bypass the limit, and set the
> > appropriate flags for the workaround.
> >
> > v2:
> > -Restrict the workaround to 128b/132b links.
> > -Clear bypass_m_n_ratio_limit on entry, so a rejected link rate cannot
> > leave it set for the rate that gets used. (Sashiko)
> >
> > Bspec: 49266
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 31
> > +++++++++++++++++++++----
> >  1 file changed, 26 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index fbfc00101886..9c327008b733 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -3373,6 +3373,9 @@ static bool can_enable_drrs(struct
> > intel_connector *connector,
> >  	if (pipe_config->vrr.enable)
> >  		return false;
> >
> > +	if (pipe_config->dp_m_n.bypass_m_n_ratio_limit)
> > +		return false;
> > +
> >  	/*
> >  	 * DRRS and PSR can't be enable together, so giving preference to PSR
> >  	 * as it allows more power-savings by complete shutting down
> > display, @@ -3397,18 +3400,35 @@ void intel_dp_check_m_n_ratio(struct
> > intel_crtc_state *crtc_state,
> >  			      struct intel_link_m_n *m_n)
> >  {
> >  	struct intel_display *display =3D to_intel_display(crtc_state);
> > +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> >  	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> >  	int m_n_ratio;
> >
> > -	if (!m_n || !m_n->link_n)
> > +	if (!m_n)
> > +		return;
> > +
> > +	m_n->bypass_m_n_ratio_limit =3D false;
> > +
> > +	if (!m_n->link_n)
> >  		return;
>=20
> Should bypass_m_n_ratio_limit be set where the link M/N and limits are
> computed, keeping this function log-only?=20

The final link rate isn't known when the limits are computed, the filter on=
ly
narrows the options. And intel_link_compute_m_n()
has no crtc_state, so I'd rather not put DP/WA logic in there. The check is
called right after each DP link M/N compute (SST and MTP), so it's effectiv=
ely
in the same place.


> Also, as noted in the previous
> patch review, could the if (!m_n) check be dead code?

Sure will remove that=20


> >
> >  	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> >
> > -	if (m_n_ratio > max_m_n_ratio)
> > +	if (m_n_ratio <=3D max_m_n_ratio)
> > +		return;
> > +
> > +	if (intel_dp_is_uhbr(crtc_state) &&
> > +	    intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc-
> > >pipe)) {
> > +		m_n->bypass_m_n_ratio_limit =3D true;
> >  		drm_dbg_kms(display->drm,
> > -			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> > -			    m_n_ratio, max_m_n_ratio);
> > +			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
> > +			    m_n_ratio);
> > +		return;
> > +	}
> > +
> > +	drm_dbg_kms(display->drm,
> > +		    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> > +		    m_n_ratio, max_m_n_ratio);
> >  }
>=20
> Could the ratio limit also be adjusted in the prediction and mode validat=
ion
> paths when
> Wa_14021768792 applies? Otherwise, won't configurations with ratios above
> 10 be rejected before this workaround can take effect?

Done in the next patch, which extends intel_dp_can_support_m_n() for
the WA. Kept it in that order on purpose so the programming is in place bef=
ore
the filter lets ratios above 10 through, otherwise a bisect could land on a
config that's programmed without the WA.

Regards,
Suraj Kandpal

>=20
> >
> >  static void
> > @@ -3425,7 +3445,8 @@ intel_dp_drrs_compute_config(struct
> > intel_connector *connector,
> >  	 * FIXME all joined pipes share the same transcoder.
> >  	 * Need to account for that when updating M/N live.
> >  	 */
> > -	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes)
> > +	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes &&
> > +	    !pipe_config->dp_m_n.bypass_m_n_ratio_limit)
> >  		pipe_config->update_m_n =3D true;
> >
> >  	if (!can_enable_drrs(connector, pipe_config, downclock_mode)) {
> > --
> > 2.34.1

