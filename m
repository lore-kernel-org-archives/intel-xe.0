Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE07C5B549
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 03:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD17E10E23A;
	Thu,  5 Jun 2025 03:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ms4084KK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E20C10E23A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 03:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749094898; x=1780630898;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fhUDxbM8AuLncUrbdQb/k7o6pjjAv7LvXs6HF9UVTJA=;
 b=Ms4084KKtzkq8Mkh0bJG33GHVNAKNSoDAI4rWCv+fyH9RVl6jBwRMLr1
 Tpjv54hD8VTuDmbnJ1dnHl8UR14paz9C4wgNLTklrhgwDPGHVWBnYtdyF
 Xc5qU6vNsuXU3FwemEle5d7CxWPQ9VG8mVVOypWGiAYAtkzvSDodJl2Zk
 6GxuS0SPXy4msSUj3V9TISjZOLK62fC0ACuTn39eIj2UfZbJuEDzk49W7
 MYFJrVRIvoygzCC/o3gkqUvjOGb6HN0+SDpjn2uXV84tjK2XKo861tpon
 Y3mirNY42SO7oqA0BlvsEM8mLfliAq070VxQ5DjyZPtpf9YeXc41N2FjZ Q==;
X-CSE-ConnectionGUID: Frpzx1VKTUKySUaehWWNuw==
X-CSE-MsgGUID: mv9WVDKTTdeBsS1TFytQcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68636150"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="68636150"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 20:41:37 -0700
X-CSE-ConnectionGUID: njxwhnSaSsGW5FLMhcpUqg==
X-CSE-MsgGUID: gu7NK4YJTHatNd4COHUUyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145720973"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 20:41:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 20:41:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 20:41:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.68) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 20:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK5v/oixAwygtlmEIUZoiAxYJkXJKQSqReXiOB5G/rResuEIGfRqoUeNmE/ajWXYipJISD+r50hMQGXs+p5ezM5+ECwum253a3H4K5namzvKkGGXCGOervSle52m1wYeanxcB57bCHsQb68JBXXBkjWpb8qKvldLSfq0dYLZtSIpHAnT98vw1tnit8kD8jZRbgdKaJBSJrXgd8MWhpD+wMtqcd6jjrMl5doZjcnDPiY7FGNwe2SWL4PN4a+Bf4zYWexK8kmyzxqNPrNPv4USaPZ7R/iCCpYrDFoPd+RlZ0m95odJtW8KX8W5wuTFQ6+A/AxN1g79gb7ShLx9dTPdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhUDxbM8AuLncUrbdQb/k7o6pjjAv7LvXs6HF9UVTJA=;
 b=y9QI/pop61yEdJIVvbtLJ+5aspfWN20SqsOv86HyvQY9UxdY6qFeVLDg8GK1OB/mwVuMM/W2KZOT34uXTtc/+WUKAKG56CGIcPCVtfUYEVeyfIU/qEal6iRq7IiBO2HVi+Zd6gWmOS44xxWEIEG/3WHV8PTR8U9S1AfEzU1PgabzdtvNgGmqO5l9xT39krRsxtwnO3uF4U2NtZPqcsoOP9sygdyXBV1DdUd0LTVs4zg1xxXFrrGqsSpd2kJODQk4xFJrIQXGQO0ih6bbDMZDLxlifoAQRrm4hoQ+7DhYpZX6Inyovwge7vZKWuv/0GVCRSivhj8xx4XBn9n2e1q14w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 03:41:16 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 03:41:16 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with
 no display
Thread-Topic: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with
 no display
Thread-Index: AQHb1AueDyKfPtK4wUKk30yboke+L7PweLGAgABYcsCAAEclAIABQ5mQgABPRYCAATKXAA==
Date: Thu, 5 Jun 2025 03:41:16 +0000
Message-ID: <IA0PR11MB71852A3007D4F9499F3BF80FF86FA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250602221118.306395-1-vivek.kasireddy@intel.com>
 <20250602224801.GE6239@mdroper-desk1.amr.corp.intel.com>
 <IA0PR11MB7185A38AE8BC13D4B6CAEBA7F86DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <13b240abd3144e1830bf18d133cfabeca3261653@intel.com>
 <IA0PR11MB7185E199BA1AC3599471432FF86CA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <60a9f7937cbbd953db5e6b1dacd8d0f7e6d1e775@intel.com>
In-Reply-To: <60a9f7937cbbd953db5e6b1dacd8d0f7e6d1e775@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA0PR11MB8334:EE_
x-ms-office365-filtering-correlation-id: 0c8d8aeb-f381-4926-3672-08dda3e2d363
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?UgyWcX3oEI60DImD2oGKdK3TQEyS0t6uV4v4RS67eqy176WGl1eVRPlWCK2K?=
 =?us-ascii?Q?M8T29NRfARdAjfVQOOwYImxsaymIxK3K1JsEC9OUCBCMn9VunfEBiZr4T8pi?=
 =?us-ascii?Q?ZgsUcihngIZLE1CWUI9EtCNsmmO+pmn4sGUG+g+RtJEpqbne8+1t34BQw4Mh?=
 =?us-ascii?Q?kvBx0CyCQq5PX+R2hcyCK8PMyWxz/I9v1Ju5/NH8UM6rIaiwHM/7MVa/dXYf?=
 =?us-ascii?Q?voDgtsxOvlJ5jArIHSpLlfqCPd+ewCgBKrbKb0LpKQGyrRyiVJhYNr1JAgFC?=
 =?us-ascii?Q?dQxeVmnl2rimEIf3oV2q0WcB9WlC3ZabdSpRzqz3ZRFNxImPwKxR5JZC4GjB?=
 =?us-ascii?Q?67woM6iQXGSBccslSSAnPj48jcbs4zsaj6TjvfAx9ykEc8wGsa9vaj1ZXf+8?=
 =?us-ascii?Q?ZT51ThXnDxgauhy6ila1LrKmZEMS28p9CAmncvPquH0q7IsxMRXx3tOXexNk?=
 =?us-ascii?Q?HI8BbdBilnObG2T9xSbhENfPImMbCdgJDPhiVQRwPhr+dOrJh5OUYmeELFlS?=
 =?us-ascii?Q?by+tdTlujzkuFJilcmNOwME4klNXatKNdS6QTeHlfH1sZF0MQOhPMMoYcr3w?=
 =?us-ascii?Q?AvygLM9DJQANrZcLvuhLEKXy1yuwX3q336iScCeeeGQPeKgrBYzthH49CJVv?=
 =?us-ascii?Q?MG8UeY1JAXDorPNESoMHNGQ6vjg/TBBCOFbgLkZf9QLMmOPcuH5w0kWyHF/h?=
 =?us-ascii?Q?ilLzEegGpMg5yQXV/zx5OUAbzW5aeMMGfXUfV7nsFjU2z2WNxC6KDeUwO4YA?=
 =?us-ascii?Q?XBK1TAUH6VHgQugWo6m8ycLCO0QC/3qRXS4LuCfj8LLol3CXt7b8NZMTeb02?=
 =?us-ascii?Q?B0fqouGecTMf/l0O0QmGS2X9Agfb5wCIDSqEl6G+mXyNdMZS4hKKUFJlkuZU?=
 =?us-ascii?Q?/HqpPmJh2sBR1+9hmWt91u7D7SeT/5B3qdzZ7cS9281LcApvzsrv7+SHi751?=
 =?us-ascii?Q?3TLjrProw1UlZcSsnSaeume21m3jz12pWVs2lmdP88b551mQ+vhpKNaUWMRU?=
 =?us-ascii?Q?m1bgfQw23DfAhQx+NDGSuIzr+os1rPgY/tGnjYonkZaPO4vOTrnhZi7jD78D?=
 =?us-ascii?Q?ILfzV1L2MpmiOqj2p0j4mC9hi5Sa23s6+rnXC1tZaNVdWTZjvOmqFgtrx5sl?=
 =?us-ascii?Q?3m0sG1MqUIkz5Ed09G3c3UtwpIIyII42NMaDcN9pid4vAP0i9q4eE8p4/Wys?=
 =?us-ascii?Q?UevVidYqwYRlTK3a52A0QSvCkVrXBZS5Z8776HxatpOU1KQKLR07wMPT896h?=
 =?us-ascii?Q?2LvRH+CsiQQEHgSfHldGQ+lseHDs+9JYI/fNcHbjTG8AuS7Gp9jMqt4ZJDFo?=
 =?us-ascii?Q?26CeilRGuOSNFxM3716UIwyzec87ev/8JEu+S96/1D1XGRrhtc4ibbzIG0bf?=
 =?us-ascii?Q?tH6VzrPXWNySYFYT4BHSJj9+WHrPeykWi2L1GO3wmV/r/TYEQx/ptjudjIR9?=
 =?us-ascii?Q?KmxmEHUdwP06IGPJO2OZFGPubVOe7CoFnKHrftjITE1YWuv5D8vOVQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5CYiNdc16EYvztaBVTC0r+PezBLQA6gW1PGGSXzDY2K+szkSXNl1He1qo6Hf?=
 =?us-ascii?Q?udKy6q0OWe9YMUcINxOIBF4MvkRkey+OSkr3VND3Ad9Sfw2sAwiLltkvmOxv?=
 =?us-ascii?Q?shoRnujLkq5ZgeYNvXSrVT9KY8r20exv06sGDIRZ81PtmhXFtcNeKUMfF3zN?=
 =?us-ascii?Q?8HX8eHS/F9+sp8mdV5pghvBQ6K70ZFeaMSRfJew+PL+N+W1ERg2tU+YgozEJ?=
 =?us-ascii?Q?h1XDCVEi1FGQD/xG42b3z2yqtoPSLtZjMojE+vnL8vgCK/9b22HPh60I9YY7?=
 =?us-ascii?Q?MppaFaf8mxnUgrO4DZBMQU45VTkHXUMXQF1EaHK5cDbHRMI5aeumeHYNErVF?=
 =?us-ascii?Q?dYxLXQ79xSrzAqFZtONfLovx2MWUaT2dUBHGJklp2/yoKvCG77jRFYz1XXRn?=
 =?us-ascii?Q?UvQPTBDiFLXY3/GaOpBwqZxPVVAMsjGCDBMBaiyRqAcWpbQzkSX9QhB6sDty?=
 =?us-ascii?Q?/JIMiqB2S0LFbj/PMlZSG2KdcZMdfcCAk0IpsVn2V18AAalYFUgddK1JfyHX?=
 =?us-ascii?Q?0ekwy3F5TXLDn6YEYQUF3ScW7R4SE3iSqAmfwfUCGgJcFf5rgBXkt4UtmMrO?=
 =?us-ascii?Q?E9Qd/kMiDawOnYD/qn0rFCK279wJO5VGaT9qtB7bbphylfZX/LzReT1W8TAw?=
 =?us-ascii?Q?/3lNQAm8UIgYZfAVolzV0WRRNun+luqEDed2pGUXSp1c605+iEUlu2KSjeMk?=
 =?us-ascii?Q?UjQ8l9aSxGjTDNLGiZ2DDn0oZqE4XZOvYPuk+SnTpBdHaOuGtO4NB5WRx1OO?=
 =?us-ascii?Q?MyCqcQsJ8UDWcOPIcdcLk2vGWSPeAujzkyEaC6foz5CqvjY0lbEf0n17RK/c?=
 =?us-ascii?Q?peTgYUYvoTuQ9oNLR2IGTnG9CL/Az+PjeWRBxdrTEDsFg7Ojsgj9tODC+euV?=
 =?us-ascii?Q?sOQuTmnC7vb3+M+vGU9OSnZu47x2G+0/mvELd+KpZ7T6BQlhD5gQVZY+Nz17?=
 =?us-ascii?Q?RGEAipGsYI4fChpbaUgWQGJHTpIDoCL/dL2uKzhiK+Ek1tMeuq8pJUjPUA7B?=
 =?us-ascii?Q?BVvWj1PBRjGee+QXChwEOiIc3d1Jg7yI/nKHv38BVKK7hD8sx84Cl376O/0W?=
 =?us-ascii?Q?dc2PL1ATM7aUOclswlJ5eQ7ajfMzWCMG9Obn43Uo5GMp3mZQCQyjLaDe4MbI?=
 =?us-ascii?Q?bfPruwPJxpyGeAFvAMH5X1M3bZorD8ZaREvrsFFP2of2I2R1Sb5fPwsJFzac?=
 =?us-ascii?Q?FStGMTQuNypCYO6z72bREXDb2evXzUwKswFB6WUJ43V0vVyI4dvQnAGRoKnE?=
 =?us-ascii?Q?qLt/0ihvQ9yumwB8HluDYPtxPwQBeZCh6lpRpQHh3LlOGstVm1/jHZLfGUMy?=
 =?us-ascii?Q?Xmr88QNtzRmsrc9XiWeK4KV+5v4WypTMqgd5OZyZAKezheap22GzcZ5OHUWT?=
 =?us-ascii?Q?J1sBVkkzz8IRGotvl0hODlcV/PsXCbEeWVeuY+Pf14frGRAXA+yOaxrYAb5E?=
 =?us-ascii?Q?01K7gx9p9NGIWGa5SJUENFwqOFMBttp9/0uv3/3RFs7NcLNU47yoManoYgpX?=
 =?us-ascii?Q?AVpOV8oO5Nx+dTUXZHgvUuC51KtjMgrQmtmg65RonF7OKfGsZKtODqXA3ngo?=
 =?us-ascii?Q?YCxLGiEEwbn/D4EDCLn+iNkrL0WWGB9U477Zrc3b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8d8aeb-f381-4926-3672-08dda3e2d363
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 03:41:16.0444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wM7LjoOmpS0LpbBJC20Tm3zurCsQAQieILpKjxdF1Dp1PV1yEVtiS+cUfm7ITBMAFbAN5YK7Cd5PDFUUeWo3kQEqtmoIQYO8N5bszr868rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
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

> Subject: RE: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs
> with no display
>=20
> On Wed, 04 Jun 2025, "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote=
:
> > I guess we need a short-term solution to address this problem, at-least
> > for Xe. So, do you prefer the revert option or the minimal, safer Xe fi=
x
> > you shared above?
>=20
> Yeah, let's go with the revert. Would you care to post it, please?
Sure, I'll post it.

Thanks,
Vivek

>=20
> Thanks, and sorry for the trouble.
>=20
> BR,
> Jani.
>=20
>=20
> --
> Jani Nikula, Intel
