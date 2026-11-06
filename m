Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D89606A31B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 03:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AxV5VYQG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276BA10E259;
	Fri,  6 Nov 2026 03:37:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842E210E114
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 03:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793936263; x=1825472263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=scqtf01DraKQBmPaIj9xuHDcTO7nzuhdmMPxmlfbe70=;
 b=AxV5VYQGZ0Ho57Ul3/6zZlv3QMMiVPonb+skeF4RkFdxhBnrwy/iVfl4
 ugI2/VEmJjp1k2q+PJPVL//9IxFuH2rtLnXfWLsGVXIWJO2DJqvHezxEo
 EGPDT5XWY/YILMEn6+TzS+9+x2BXNsZnVsRn/Itp9CHwkUxwSxrR7HoYt
 2IPL3aHVY140Z/IkiQgpE6blKRtB6wAgTbH86ciib946O94aepKaDnOW0
 Avng6i42/E4b0//UzxfWtZg0RMtRpFkNuo1JjVWKEXxtlBrhHOUIU6NKN
 yem0/wvFXxds0YKcTLkUIMseTAA515hkCFQC3a5ikGRdATuqfklt28h4F A==;
X-CSE-ConnectionGUID: uUKVZY3RQwyafJvLczF2Ng==
X-CSE-MsgGUID: 3VlERZeEQLKSEGdQ6C4uNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2648683"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2648683"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 19:37:42 -0800
X-CSE-ConnectionGUID: KkZPYMpVSE2RZbGamJ+r5g==
X-CSE-MsgGUID: +o+iBC4aTgCotgxkuKk3Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7510366"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 19:37:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 19:37:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 19:37:41 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 19:37:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwdyEJDZuIJyuXHERRuPUpqAg2i9GLE/CwAd7SL9oViJrfiDEbAMQCPnImHsRfGObba8Hw1w/m/r/Ox+rZqzQ5HaBGRpbZko89JKv7C7snWY/Vx7mqJgaVcP2a/++g+luhsVz7YiX8PuVO/5T8iQr12QwxFakQV1/7eLdKWMCQNvT89YX9WUK9wv60FeFYvDTdDI5ciTGGPzkFNclFERniqOAz7AY/JuBPPy1z9JvOJOowgEv2DYCj7aG5VVzDARduwhT1eGOx3lFy3j7l0O/GrENavtYKjMsPMNZ7/cR/+n9HP/XxDUnghjGpNNUQ2iiNGEmHtagAWzSPSW0FdHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk0du1LHmWeWFhtGzFKWUX30IXFgQ0h/591IEKZUrYc=;
 b=mu7TUCpFaWFV2oGYjuO7Aqahu7xnFJYki6YFvohejUiMFZwbXMXe4MCkY3nAfMSH3PehPbSz5WvrTbDa0MgLhQDAzNV1Rguym/GL+cAhJbzkdRsZTeK0yTmzAoyq0c0HIPbbtRDIvHyFi/lpbw16C+kBrDLOsPUFNdlVfDouKlPL3YdHajhojZaOrFPqaAjqeWX99vXosGH+kpwrMrYAi/vSro2UKy6//dz5zxaRBQAyRQD41pIclPAYUUbMssQB6QJjoaqNM9a71QIsuAD26HI8Y4rsqre1p+FtieojeJKn4wPST1nKARLEGFhJmRxqbCbbIQIN6JmaA14aN+X7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MN2PR11MB4743.namprd11.prod.outlook.com (2603:10b6:208:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 03:37:39 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 03:37:38 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH v4] drm/xe/guc: Demote uncorrectable local error log on CRI
Thread-Topic: [PATCH v4] drm/xe/guc: Demote uncorrectable local error log on
 CRI
Thread-Index: AQHdbTXW8M/iwxWVWEC4RjEboh55vLcgZR4g
Date: Fri, 6 Nov 2026 03:37:38 +0000
Message-ID: <DS0PR11MB8718B114A0B310519E2A796A81762@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261105145531.1847892-2-varun.gupta@intel.com>
In-Reply-To: <20261105145531.1847892-2-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|MN2PR11MB4743:EE_
x-ms-office365-filtering-correlation-id: f681f55a-09b5-4339-d9ad-08df3bb74de4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|6133799003|18002099003|10067099003|38070700021|56012099006|261022113327099003|11063799006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261009223027099003|261102123227099003|261022075727099003;
x-microsoft-antispam-message-info: cB/66xuMfupnsHCvPWwan3DuQvHJCrC9zFB0HShN2W/s6kraDnyLYiUkaIICoFQNErAHGnUP8shy2iYL/WG97DsOPaetLfQXG77rbQWKBEpmKRLerfiMObGXyy5L8u7f0nsfyPohsyuXlib5v9P5izS7C9jAK9WdddaQ6sweqpUmVvlyYzpIHe70AOyJUNwI33Mz2EC++jRP7TP3Ld23kPkLMNFhzceCFeL8jBXjeAY/h2Drb/RJ+Py8CQPjehwD1lZ+8SmvEFhIjN0//d/XU3rO/T7oFCkaE/AWgalFZRFVCb6N0eis030atDHWndWRKoREQyzPqhXzaghN6hGE231AVsSxxwEtAbIE71ApJpWOd/leAAxhvgIt1LJxhuwtNbG1ZzgV/JkGOXPqO7W8OPjUd/zWAIvTOFk8ybs8bnmBQtG7rpuzL7myv6h10o5p1005tXuIWO3OjW1PRZ7GWi4pxt7K7+ax2xaO7FfKDwlI6lw6E0B5h6J0Gm4LR43HwFQTlLVuVVgZSvjYSFHoFmcnJt5UkEruGs74oAR7Lh1XIzbhP3jePFInTmr2JEAaU3aYR2BlAKAqFqSXsC/xneetBUoRCnTpn3fjv+lHSgne8iRqp5f7Kbopoo2ao2IngSUzfRpQZFbFi8DZYphRGMdfNbKk6+TiBXQH6FOwjpO8sNRDxGxOuu2JwAM0yFy9F+6Xi48HkDFEj2Pg6h3L8YWHhvnEGJ2SJWkbjhtmppg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(6133799003)(18002099003)(10067099003)(38070700021)(56012099006)(261022113327099003)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003)(261102123227099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tEvCYhKEz20ZPnR1wLY9782TkWapiRt7x0FgFA0rlmfM+qDwlmfSC6+IrSe4?=
 =?us-ascii?Q?DMa+ch4EbS9P4O4DrlVIVP4qno4smy7z7neLeRTjtB3j0HWjor4z1Fc4iz56?=
 =?us-ascii?Q?D4S7gPc7H/05MX/oNVFoqxkpGV/J9tB00sEdZVby38WQkij8e3ulHcHsywmm?=
 =?us-ascii?Q?KUkxaLrFeKX4AHdSQaHwEt6lcXmlLe/GcSSH7fGJetZFWWvJTRxbWJseOzur?=
 =?us-ascii?Q?ezbWDk6o7JuKSrKBDo/YnuzDno7DOYrgf7b4oSngK+/IHOLOoSGtQO/ZpOiI?=
 =?us-ascii?Q?TFRi/w55kUe8yl/RlP6Eso1ZCV70Gc1SK0y9JFipRtjBcBQ2yDxSTH6dKbTX?=
 =?us-ascii?Q?3KyR6kqn6RfHgDvfVKEcuXF/G+D4nLydvYv7XwH6jF3ybiZm2rkRP1b5ejOw?=
 =?us-ascii?Q?eSCsbIdeEOonaJw4WiVOrkREdX63rrQsdJ3B1h/saBkpYmKakXLTw72GSZKr?=
 =?us-ascii?Q?waw1gqzTRahTTg2CENwl3VvWrvmfFvsGJi9OZgJqpDorkkQfzUyhrunH5t5N?=
 =?us-ascii?Q?49J/9cWZd6te7gOCdbWtZNj5FafYDDNvwlCBs/34//6r3NgOsbblE+gQCxAn?=
 =?us-ascii?Q?qH+zluSe5NthR83bV1OkBCZPMWZq6sltz2ztoIthaMDn+F8JmyEU+I8OZ5QW?=
 =?us-ascii?Q?JAIChVTc/y4bRUQfc4OIgnb9Ny866Cn6EdeVmCHuu+2oZmL+05cSyZPukO4B?=
 =?us-ascii?Q?4VQq3R2erXpoB+nd1+sLdcHAg5OxZWdneI44k06xGQF5TM76t7sx4wB/rug/?=
 =?us-ascii?Q?b/xk+RgVSmN+KN/kZp50eZLRjFEfRubagoC/Vd8PY+vX3OiYoozba9HEvkA2?=
 =?us-ascii?Q?DzQaWsj+xdLlc3iqlEf9r6sbjFqlxMVyEheVnCVJfHKqw6yznec4E9JJSnmU?=
 =?us-ascii?Q?w2vF58ZLosp0sqIOAqNkoGxXyQb77FdSxCnEn/hz4OHI8oCcO2z5DSVoa1Dy?=
 =?us-ascii?Q?1ow1V9qnWj7iPmi6XrdiRVG4LuFk/ZXvXsQ2+sHwSqQurUo2kDEOgsFgarci?=
 =?us-ascii?Q?iMVwctJVG391VPXFiSK0AAQMca4WiUUqcptUhp6ol2Ssssnt6puCGoXGoWUf?=
 =?us-ascii?Q?mzqw7SamKt967Wt0ZmevA2VDd6ctEv5TUfUAYv9KmojrRNsuEa2ly6wea39s?=
 =?us-ascii?Q?KUUYOsEbn22vYlUidixx343LOsgP6JrdFAgdAHUZNQT8caPpbug8NCAZV5Gz?=
 =?us-ascii?Q?CynPegbQzJetONQbQLbAv9B/+RGPXPKBRiUxkoGpPmS6pDjSjQGoUaSPic+R?=
 =?us-ascii?Q?caE1X6P7TThSY7b2f5j6GMNjWPhuyuIi2SEzRwz/P2935DbLQ3g+CqzT32yQ?=
 =?us-ascii?Q?ErD8DG/QK0MBvSHHO/Hwj+iXObCkQJF5a5ZUonetSGr7lWH3dJaMkXH0AKqw?=
 =?us-ascii?Q?kqR9YX9boxxeD1ftL0xtctUCzmZuvjNFP8AEAkaT0slRfNbIFhMUMz9N1qhq?=
 =?us-ascii?Q?Dze2Ch/frp69WsVs0EuojdctfFv4p2Cuc/L223YLwCUtCWnRm2auPZikHwUj?=
 =?us-ascii?Q?LKjAuI6W+7IeC5t7VzUT2bjoGAo2C1f9PZ1zhSuqAqden/J19nJXgWoYMuol?=
 =?us-ascii?Q?M/hxowlDOqwmRrBRFaTEJ0dz4tNgjurj5ixPRTnDiHN+nGJVv6LtHysBksLB?=
 =?us-ascii?Q?JACR2Jd9xVEJKtSZpWHDepQmnMpNlCkvpCHR8ATvWfIDe87S2ZhDl9l7p17c?=
 =?us-ascii?Q?bfTf932NiTBEdq2RyQ9VXdp/a2eVU0bQFXZKgHTnxwGOkCbWEw9K86WrQPg/?=
 =?us-ascii?Q?Yni3HpPhpw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: n+uv95xDkv+Im6dBCKUzLqpPuFCnPatgFH3EgQZgfsOaxTbAd2kuXkpAIT6Bp+S+n97BNwV8GeGA+M5/gjBsOGDUUhWs3v5YIWAn+PrVPsNfza/lDwUNNtFl+mAYCnyJ5aBRaKBf2WBE59gQlHypbq+6YSYrXDzxtCUm8wnZ0kk4pc3pPYkSlxnJYCXcI1J1Hhh1rmXi8CLAQCqrVB+NZdQ7JLkwOSVHlyS4XWqfEHrX//GQlxx6mHnsJvEByPck/KZYc6Xo2I7/qjjUp2ddgryqlB1PCBQ/bXFnRKzJg2nQEcU5tZfR/DdqAFyjeYvp/M5wZOp4ODP/Qw9lCMfsEA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f681f55a-09b5-4339-d9ad-08df3bb74de4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 03:37:38.1485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AIZ+yfb1Prz4zKZ4H2Ml5IxYaBhad67sBzc0LhBIiFv5tH04564eu22cdNum9byJkzODQV4IM2Wmjw0RoCzd7lpQoSbI9L2zQKIx7rH1IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4743
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Varu=
n
> Gupta
> Sent: 05 November 2026 20:26
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Tauro, Riana <riana.tauro@intel.com>
> Subject: [PATCH v4] drm/xe/guc: Demote uncorrectable local error log on C=
RI
>=20
> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> local, queue-level context termination rather than a global device or dri=
ver
> failure. On CRI, due to a hardware limitation, the platform cannot distin=
guish
> GT translation faults from true RAS conditions, meaning standard workload=
s
> routinely trigger this error.
>=20
> Printing this at ERROR level is too noisy and causes false-positive dmesg=
-warn
> failures in CI. Demote the log level to INFO for CRI.

Nit, You are demoting to DEBUG I think?

>=20
> v4:
>   - Change to _dbg instead of _info. (Matt)
> v3:
>   - Limit the demotion to CRI and add comment explaining the HW limitatio=
n
>     (Rodrigo)
> v2:
>   - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>     (Himal)
>=20
> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error
> notifications")
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e7c2778029c..abc2c3d67f29 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3610,7 +3610,7 @@ int xe_guc_uncorrectable_error_handler(struct
> xe_guc *guc, u32 *msg, u32 len)
>  	guc_id =3D msg[0];
>=20
>  	if (guc_id =3D=3D GUC_ID_UNKNOWN) {
> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown
> GuC id\n");
> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with
> +unknown GuC id\n");
>  		return 0;
>  	}
>=20
> @@ -3618,9 +3618,19 @@ int xe_guc_uncorrectable_error_handler(struct
> xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>=20
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s,
> logical_mask=3D0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q-
> >logical_mask);
> +	/*
> +	 * On CRI, the hardware cannot distinguish GT translation faults
> +	 * from true RAS conditions. Demote to info to avoid false-positive
> +	 * hardware error logs.
> +	 */

Nit, info -> debug in comment

With that LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> +	if (gt_to_xe(gt)->info.platform =3D=3D XE_CRESCENTISLAND)
> +		xe_gt_dbg(gt,
> +			  "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s,
> logical_mask=3D0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q-
> >logical_mask);
> +	else
> +		xe_gt_err(gt,
> +			  "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s,
> logical_mask=3D0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q-
> >logical_mask);
>=20
>  	trace_xe_guc_uncorrectable_error(q);
>=20
> --
> 2.43.0

