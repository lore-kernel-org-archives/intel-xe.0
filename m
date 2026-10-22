Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5692D606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NnDMgATW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7C410E446;
	Thu, 22 Oct 2026 16:13:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6C210E3B9;
 Thu, 22 Oct 2026 16:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792685612; x=1824221612;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qBRzZXIKUgocgmjedA/vDKuNPposnWzMz3Reg04pfU4=;
 b=NnDMgATWq+R1cMYi7twBfeK+AGht6v1xmUD8VdLh7LsO6yPQS+zScdf/
 oQn9pe2v/B4fyZKq9XAsuoXJ/GwFya3VPI7NjispY55MpAm4xmtz6Zsmw
 +9JtnwuIo1YhholqqG3OchBXKKNeiQ4hgx5uyJUx/dpnOX/DH78xi6D0P
 8LjA5dtA33kFT8W77wnFIzi5ccPy6GigFHUVI/V5pt0+VDkDRg7kSqelt
 UJyWkeoFB6kMH8IbXIyHpB+xc9FJgiZkbQ7qkytS9ZX1yI8+p+plva2BU
 xr1d9wbYpxvwdXN9i4flQiieEZ19RrPSVklncx4pviCgH1ajso8ep4hBq g==;
X-CSE-ConnectionGUID: Y8l3uRKGTWuLI0Dr4uPsOQ==
X-CSE-MsgGUID: BzsRDvH9Svq0roBJvziTBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1319962"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1319962"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:13:31 -0700
X-CSE-ConnectionGUID: 69bp0fBmQUWKHmrnBrrtWw==
X-CSE-MsgGUID: DEH/L0CNQE+g+4ecgEqoNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="5226701"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:13:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:13:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:13:29 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XonUBN7eDVJ6aeI+7T0Qlabq+aEfcp9kgx+TpxOiJBefv8SA49aO2SEKWTIjvBBmXKjVs2/kReiBF5eZUcpd9q+rDdZgj0IC2IJ0tzAXv2pZHXW6lPKhCmuMnIk30ErewQJrhmZIvQuJqTNM+O8gYOq64MLlaXU3DVYadF0ZDR5J9u+zcxOySVjbayN4vqcb42Nn/fzI+KulSm3RdhtQz/EA5H8JRitKzgEak6htlGP9Kn/mOiwuLDlvL/ReLsCLqxTb5SFWe45wtdBamnwyuri7SxTXzF09uO0AcTkCD3ryXyBCw/Kij6lRrNEy30blCvYaiAgqD/NZgZ5446k2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAgW/7cMA/NZzbr+4U7F752GJTuIozU6lCkctvsNzOY=;
 b=Ch92oAGHRNybC2e5wsgf//4ZZ5bsOxhZaF4KtBDiRH9eyGM0HX64w8GRFGpigNvYnfq58gyLiWJB043MOWgHWK+vzs4hJz+TxKIfeDncM97tOG0/8L87OrNrxZDSw9eLQz7Npm1tPwr9nfTu44esiBQymLM9O+B+qXxHM6AsBoGYK0aBz8Gp9CgsF45Q/rtnBLMj/5P2vunOVLBK3MLUfzWpCsihvSZhhsLUqdvKnD5gIZCJ2iRU8J3Flp/E1OBBvj42QVc+UMIjU7C0rrD9QSokR96+DX5kxkmYokGFXqOFzqg/v+6k49hN4m409ogvcLwTzDtbOrM5s3yLrM3soA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 16:13:25 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 16:13:24 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v7 12/13] drm/i915/dp: Extend intel_dp_can_support_m_n()
 for BMG M/N bypass
Thread-Topic: [PATCH v7 12/13] drm/i915/dp: Extend intel_dp_can_support_m_n()
 for BMG M/N bypass
Thread-Index: AQHdYdS1f5BNsUsoiEG70yKOVcNHd7cJuDJA
Date: Thu, 22 Oct 2026 16:13:24 +0000
Message-ID: <BYAPR11MB37835D03743FC55851DCE427B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-13-suraj.kandpal@intel.com>
In-Reply-To: <20261022032247.1378809-13-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SJ2PR11MB7620:EE_
x-ms-office365-filtering-correlation-id: 1082e403-8087-4da8-23d6-08df3057661a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|10070799003|366016|6133799003|10067099003|18002099003|22082099003|261021121427099003|261021123027099003|261009223027099003|260925022911599003|4143699003|5023799004|260925021311599003|11063799006|260925021911599003|38070700021|56012099006;
x-microsoft-antispam-message-info: eLe+52ch/Tn0J6s277siFHjxx4kg3l2Akp7shD4ZcA9FyT9AnOZxS1j+6fSVomxzkVOoQZNdWCoJF3BWkommSfolzyPNEkZX8tcEktLesHcNqPrJviL70XfXQHoR6zCsLEPGAT9Dw4rxDKS9oNFQzcSw6pLt7pYWqNEnJvFeOkpwZpSVLwxbZVXKsBy6H10l/MFUki6EU7MnJmHJcSl1qHFQfa5hCHzKwV4Vp9Q2nT+61TFCXz0zpBlrqa0mtlrtS5FA1X+/l/joiYrTTAKtUJMHjZwiB83wHFydBQOfkIbfNF6MYXCDTMIplzV+lqjmeYuKchYTX3etg6POlwETV668E0d/hIhEZxtl2aMxXtm3DlMn0wvKGISsMDblcyAH2ppKpHQOF07Xxzct4X/RdCPG/PrS696RMT7Tw9Hy8P7CAwcyQEbbNd4vcknoo2nGQRhc1WtLWd2eVse4MmZPU+GP3z4dAJqPq93OdDO8Gpqh7e0/X/Cmjhu5Sn/RLGjtglzoz0UqtVzd99kAV5AY1N6vDvgId78MnX80gjQbwhbQj/nGv8onVPJ5LARjLuGbrbhEmJ46mV9hP/g1CRbaJbOnq16obbUCCB8rWApj3T1ftixW/QbZdy+/max/LtBKsM+2B/nwWKaP997jupjoCFlNATFmIabk1vO7blrZCKmg00ytficLoAPB8Md1i4B39kLBBh2/sfh9rzJtMn5U35r1dgGKrRhdPJOaPRnrbZk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(261021121427099003)(261021123027099003)(261009223027099003)(260925022911599003)(4143699003)(5023799004)(260925021311599003)(11063799006)(260925021911599003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qQDfuGaEyJYGvoheyxWOtDkinobWTiQATR0GZ/09bXPMFCdpFTMemoyEp0LX?=
 =?us-ascii?Q?yjkcWmHXtocqr2gSwY7o1yGNT0iQVpj9YvZri3HiXrwnsip9hoxef0JWYQvR?=
 =?us-ascii?Q?792gxCF+h6jkpbKB1tnw4jdHKcku7K3o/cTIxj7cLhOy9Da/aIQhmAF5/pbc?=
 =?us-ascii?Q?01dmGhETvSL4a2eK1PN3OysOUDoeDKLk13DZiR9KHgURlfNPN/Mx2NkEH6lx?=
 =?us-ascii?Q?IheSq75dGkP3tLsedoLecCBskxwUDWRPvpT04J9DPQIYqdu5+6amWDi3KSCk?=
 =?us-ascii?Q?mPMQvUA6pOVJhWO7qHSlocVC2DK1gZ6z1QSPPPr9fGCugr6tfTwVSYzaDa+M?=
 =?us-ascii?Q?Jn3qYLg7b4/RaJhLpPxHfs8GTVXlaJxXrBqo+O0q+z1s2fETNkI9ih16XMAH?=
 =?us-ascii?Q?p/JiCJ7Jin8RcsCXLfX5x8rmJj1xUR6Wfjoq9sVJ7wQToiweltpAKhiLCFGb?=
 =?us-ascii?Q?+ODPYNb7Cu3cXWXNLw3hrCCovdSwirpMsQe0W9w7iGIYQuY9PlvyaF3LzrO2?=
 =?us-ascii?Q?32isZb6WJ0gVs/Ms+C/pILEaUNG5yfvB8jUrDuROwm19vCoRPHRm/7EM2JY7?=
 =?us-ascii?Q?rQ+BcECGu+fg+vLTws2KkZqyFD4culXyaq1Yqtgxw2AbWjql6kdyPxbtepIf?=
 =?us-ascii?Q?an4pTwxhL8QB5XhzPIxQLjQ+rwB+QR5dl0k81KNl9dTUX/1tBxu5IdHYOPkv?=
 =?us-ascii?Q?PCH/WB4rPhzp/i6uzEadme+RARDq3iKUQ2xMvA2vUaphWxiaGtGUkzxJH79G?=
 =?us-ascii?Q?UvIDgnDyPKQ4UBPkGnR6vf/eptL/M5hnMl9SOU3LA9k1mBtXdSkBXKJ4qO0U?=
 =?us-ascii?Q?UYI9Urluja1vnRG3+rOlNrUwvE38NtYSkqj++Mu/TARrBUitCnLrgpPjlv21?=
 =?us-ascii?Q?5EagO/i1U3DROGj1xNuT7wtSG2+2zS3+VGKRHZCCYKQtBSQj9jzCRjjxzbIp?=
 =?us-ascii?Q?gsA82+dUloQO8LJ4w/HQnDWb6i9fChZROlc1zkw/53atVvYb56g5U/1O+Etv?=
 =?us-ascii?Q?Hh+JPsUABLQXgZ/yOhd+husQEWMCRm3/0wp5jcQ8O8/mMTbH6YvRukpeRSf5?=
 =?us-ascii?Q?5R8Vhf5XKi/410uxveOfHE1Lrmo0WPAlBSUfxMdgU8TMbKOHAYx7iW43spfv?=
 =?us-ascii?Q?tT8GimL0GS7LhozLXEeV7fygc1aF2Uungix1pFz4Hw1wZL3EAHzOuv+3DLXv?=
 =?us-ascii?Q?uf0iySMtRMfhp7w7zhjWrDA3yxSuuIOIae2AuSRtoMwGYzK4WvBACG+a3ygl?=
 =?us-ascii?Q?T03kmITekfIg7rccLdcDsRwk5PE3OReWPY/Kf1wm6mLMi2Ds8A0u2vJW/Z7u?=
 =?us-ascii?Q?NyqtPnW151+3uylHVZX4ce+6tbFazxVtBIxc7667BfwtabU+mA+p/UY4Kpfu?=
 =?us-ascii?Q?94zFRR6Mv54BAMCq+JypqhGSG5zFDTq9L0g8hxrGss2onH5TUs9WuNH2yOBW?=
 =?us-ascii?Q?a74zdE2nNcs3qri90aI6ZkSAttVBMR95a85nC2tYcd9c6gWK5Ownz7h3vi1K?=
 =?us-ascii?Q?j1XsS9bi8yE/RcliiN94+ZX/+ozh2cFvMDdECFODVUBm7g7AVYxkIRXbvBWc?=
 =?us-ascii?Q?T88KbDxNtCYXAdLMYSvOjCL5JVJernZbc3AoGU24iWywJ3q5UrM4uKhpjrvU?=
 =?us-ascii?Q?mdAxRi4k1rdNGTbHlU2lZkpvwjcdw3x7wp2DvK245A6GxMoQO8K5txYxRGw5?=
 =?us-ascii?Q?LnxMIjLl0+ri50FdiHx3dVwDkO6Ef9BAVxdD0V4DzHFfObNNr0tTbRp/oBOO?=
 =?us-ascii?Q?7Xkz6Ehj3uQbg2ER++u+pUE1HOB/akuo/jYpidgTwlQ2nEh96F77tFOByALn?=
x-ms-exchange-antispam-messagedata-1: RBVblFN9DZpNnX/FU2Vf2fnkaTn2YZuNjKA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: edmNZauU/CWr6rrkkcBKfQVWtjwU8ZJQzRW17CncM8tax8yJKHm0qTh/9kC6bo4RNCuqSQdqdelHZmm9u/nroO4IsYo0a4+tR8k9HmaueYbUNUh9Zy4Tl2+oMGkz9aPSwsQaVbtvFk2H40xnccl+76mUkBSH0ZqPYJpB5s9csRJhXiut9p2zIbU4UW0NWd0neey5lbXhOAOI3EBhGYqXIjLgGn05A4ZGUE2Xlznpx3b9kpOEpVRVrCgLmSz4liWwRbHuULWUL1t82Z80tpb87/GtwPHWo1iKLv7Nb0UFU+SjnqE95HwFXIQO3UdaCUJTxSyZozDN3tEy6ei/atzuoA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1082e403-8087-4da8-23d6-08df3057661a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 16:13:24.2723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJPMecGra9/8edOYHJ86KqpK6k54Xt/gVqcdO/9A8dv1RCcFUvyKrreX3NvXM6SyQSNlyf5SyJvEVGTHDxyRVTA4ZXZVksOkQ78TnqNA7V1nDYZjWHWY05z6Vynqow8K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 22 October 2026 08:53
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v7 12/13] drm/i915/dp: Extend intel_dp_can_support_m_n()
> for BMG M/N bypass
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> On BMG platforms, the standard M/N ratio limit of 10 can be bypassed unde=
r
> specific conditions, as permitted by hardware capabilities.
>=20
> Modify the helper intel_dp_can_support_m_n() to account for this by
> checking whether the platform supports bypassing the limit. The workaroun=
d
> is only intended for 128b/132b links, so restrict it to those.
>=20
> During the mode_valid phase, the check assumes that TRANSCODER_A will be
> used, to allow the mode where the M/N ratio is within the limits for the
> workaround.
>=20
> v2:
> -Keep the helper static: the MST mode_valid now goes through the shared
> intel_dp_mode_valid_m_n() rather than calling it directly, so it no longe=
r
> needs to be exported.
> v3:
> -Use the cpu transcoder instead of the pipe, following the change to
> intel_display_can_bypass_m_n_limit(). (Mitul)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8e6ba5b9fde6..045524994d85 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1285,9 +1285,11 @@ static int intel_dp_link_m_n_ratio(u32 link_m,
> u32 link_n)
>=20
>  static bool
>  intel_dp_can_support_m_n(struct intel_display *display,
> +			 const struct intel_crtc_state *crtc_state,
>  			 int pixel_clock, int link_rate)
>  {
>  	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> +	enum transcoder cpu_transcoder =3D TRANSCODER_A;
>  	u32 link_m, link_n;
>  	int m_n_ratio;
>=20
> @@ -1296,7 +1298,16 @@ intel_dp_can_support_m_n(struct intel_display
> *display,
>=20
>  	m_n_ratio =3D intel_dp_link_m_n_ratio(link_m, link_n);
>=20
> -	return m_n_ratio <=3D max_m_n_ratio;
> +	if (m_n_ratio <=3D max_m_n_ratio)
> +		return true;
> +
> +	if (!drm_dp_is_uhbr_rate(link_rate))
> +		return false;
> +
> +	if (crtc_state)
> +		cpu_transcoder =3D crtc_state->cpu_transcoder;
> +
> +	return intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> +cpu_transcoder);

The same bypass conditions (UHBR + intel_display_can_bypass_m_n_limit) are =
duplicated
in intel_dp_check_m_n_ratio. Please move them into one helper so the predic=
tion and
the decision can't drift apart.

>  }
>=20
>  void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
> @@ -1386,7 +1397,7 @@ bool intel_dp_mode_valid_m_n(struct intel_dp
> *intel_dp, int pixel_clock)
>  	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
>  				      INTEL_DP_LINK_CAPS_FILTER_ALL);
>  	for_each_dp_link_config(&iter, &link_config) {
> -		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
> +		if (intel_dp_can_support_m_n(display, NULL,
> m_n_pixel_clock,
>  					     link_config.rate)) {
>  			found =3D true;
>=20
> @@ -2775,7 +2786,8 @@ intel_dp_compute_m_n_ratio_limits(struct
> intel_dp *intel_dp,
>=20
>  	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits-
> >link_config_filter);
>  	for_each_dp_link_config(&iter, &link_config) {
> -		if (!intel_dp_can_support_m_n(display, pixel_clock,
> link_config.rate))
> +		if (!intel_dp_can_support_m_n(display, crtc_state,
> pixel_clock,
> +					      link_config.rate))

Bypass-capable configs now land in the same filter as native ones.
SST walks rates in ascending order, so UHBR10 with the WA (ratio 10-15)
gets picked before UHBR13.5, which may satisfy the ratio natively.
Could we keep the WA as a last resort: build the native filter first,
and add the bypass-capable configs only if none qualify?

>  			continue;
>=20
>  		intel_dp_link_caps_filter_add(link_caps, &new_filter,
> &link_config);

One suggestion, not mandatory,

If possible,

This makes the bypass branch added in "Implement Wa_14021768792 for BMG DP.=
.." reachable.
Please put this patch first or squash the two, so the WA arrives as one wor=
king change.

> --
> 2.34.1

