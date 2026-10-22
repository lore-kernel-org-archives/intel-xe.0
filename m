Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A50606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f/7ymsWe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3CC112805;
	Thu, 22 Oct 2026 16:42:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23ADC11274F;
 Thu, 22 Oct 2026 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792687364; x=1824223364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oCZBDv115WVOeWChTy1D7O5LHywkkY+XaZwpUePrqao=;
 b=f/7ymsWeGN7DdEuWV/l6Lqir+FZ0+ptcKFAjovDhxL02HiRmDVf5K+JV
 x1Sfa8SmWJaQunL3u6FxGYnLhpb5kkJ8OHpSDLyavCBao0hA8+yFK3Phs
 hJ58k37bdoIpMhuwRU36rG8oE1jgwq2iYMwIrX6kdR/+4lGaqVh5U2Qcv
 NB2wQ2Ozx0rPhwl/Fx7ZGhfrWqSVQG0kBwZKGJJu1pkMb2Z7erj8fquMN
 J9YucCMLxlFv6KGLpnSRFuVjH5+agAVPYsDI/U6W+4jV0FQmOuQ+7s2Ox
 joDqiL5PMNDpnOfLF/+tJff9RukcD2/476Kg4xKapRtGYLkq+SSSPxKpl A==;
X-CSE-ConnectionGUID: Gny9ejkgQ5Gg2TAfMOJxgw==
X-CSE-MsgGUID: 0F9avsSkTgyhR0GPYBD0PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1455540"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1455540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:42:43 -0700
X-CSE-ConnectionGUID: PTVGjChWQwaAj/b1lMOyrw==
X-CSE-MsgGUID: nx7IBvyiRgOzbPKFeEF1eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3529545"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:42:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:42:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:42:42 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1OjPyQmkidMXuh1o4J7rDaK1clUH6Zc1tBVr6EHacamDXvgEEGBL1Mybt5Z+Kf+dYUkeGJm0MDOyZreOs/9TQ0LzRun9fOspBOa1YUlXjfOgWD9sJsl7kQGEyrH1RIU8qWUnVa6w4n03v0Gx07iulwZIM27ZvQiBLVhcbHzWU2xvFa22u/teo8jd1KTvz2TQVI0pXOlR0ajaO/vnUEcjClKOo1ZhBBEkvfYX4HrXBi939b43sPO7yR2DEKIW+K1175U/TN6TAy86br+ooe4Gaqa9G/WgOfRPOpLSiicvizz4gf7l6HNW+aKKfWrxovvKeoPo6jDfjU8iMPV3hClpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peVci+H0xdgBxc3x/Y1UxGdc7LXoVheJiwEpY8uUJIc=;
 b=HO/J4NCPaJ5X6QJDk7GK0ALgMcL7sYn9pOUNyhivpqE0/el5Pr/p8+Qg0aNnk+EFYec+bSI90hwrsy+wk+IY4uW0LSq9LUwmjAf2p2gfYbzvyN7zOM80LdxamRYCu/7FeFIl7EX9lvhD+ee44bPn2rN7p07SUt4Q0pHrnaiu2JJ9gBxN1T9Uli9fYym4yNdRQJHdGqlpAOge5gLm/PDgZCjo8a4UL/Vu9V7jiOyKV0ecbKFPPPfi6q+u09X7sEHSoYCOAYkBS1kHAiBGAqScuDkugYfA/Ov7NsoKBDuwFr0TWfCGt9Y6Di8dQyiwouP+X8xf3l19wmFTjSE/zO4RfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SA1PR11MB8446.namprd11.prod.outlook.com (2603:10b6:806:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 16:42:39 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 16:42:39 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v7 04/13] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Topic: [PATCH v7 04/13] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Index: AQHdYdSpkCLI16UYfUmi/202UitOsLcJxOOw
Date: Thu, 22 Oct 2026 16:42:39 +0000
Message-ID: <BYAPR11MB3783492E8D4459F3E4123C07B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-5-suraj.kandpal@intel.com>
In-Reply-To: <20261022032247.1378809-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SA1PR11MB8446:EE_
x-ms-office365-filtering-correlation-id: 613de3ae-00d4-4430-cb74-08df305b7c7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|23010399003|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|261021135927099003|261021121427099003;
x-microsoft-antispam-message-info: A2oLHYuOTu3b4+ieWBAB58h/BHfWhKK235PbUXvlbz49W3oeXOX2aTpaNtyWdPXRs9eE3h9+L+ek/cKJXNqg8pnmcIKra/tNx3qHB9lCp8l1yx76A7xVuVkI5q7ZARevhAFqvrWvA5df+1uvS1qI/+ioOIUI03XLNAAmteSkNthtpbBMdopGqZhy4S6qfv6thAJBaDhykFeb0/GWSE2yMjHue6tREqn0HVmWGx7fIvGc1F4S5ZREtAwRqdM5C/Hg69sNhxKlRlsrAqiQqE7pHJEXIbZEI/0T95B1LBdcnc60MasEzurSak3snlaOgDwAwYKDDt7611OvRHwdhwkf762qxgJT4E7sHLAHtvAnvxGYS9y3GJht26kOxw3Ftekou5lCMK8vvzt5JussJ7KJjQJoxSi/wiHorJWxgKGo9lSE2G6bS3NVhnwLcldMpglxQkpCO5DB+oD8B7z9ykEOoGtL9l0DVH8DConNS8e4pn+vsKz6b4OPEB8okw5vjtvmOddhp5AqJrNAgMKUHrh/cirFGxgdOQblal1b3oGgpQjGcYuCE7i60+rb4Tdr4fY8mlIeBnLRfIhi7JcHc+oEzzELiMxwvMbXIMd1do0Nx61G9FHEkJgDURpjPX0RQMGRAYqMtpLi3G0FjPz5ncT1OsFaP8Rhee2SQ26Imh6+l1FbaXIUugyezajHzOcUfdc9DsARosyhNNp8vWKGLhp7xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(261021135927099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yh5/TTO/hUIZppaEQXkatb+c3KkAA2e+eHVsgbjrDyXunmKGSgbayKH/ZfF1?=
 =?us-ascii?Q?GLd7pUB4Xg3qFl90yNE+YUyCs3uuRd1YMceMOFipJhrGzNU+vZTXXVphwVwB?=
 =?us-ascii?Q?QymJMFTx0s3ld/Q8K25epY02zrI/CblkIdJkO6QrDUNC4o/dCG5+K1JYtAO0?=
 =?us-ascii?Q?A5xJvWRMElqauxVuIe7/vc+Whk9WUKLzzkPZSGBAZLa5XnaM/k4j9VZzNa7o?=
 =?us-ascii?Q?ILHEx/s5HgXxwK1E/SuQmHOsCpdQ79pVSGmEPpYqAQrLmJvHWA3wjKRVAARr?=
 =?us-ascii?Q?Ng7tVHyVP1Qb/Z78j86YnQ0SKU/clWOiIbObFWeDqamidlW6nCN7AlPhM4dk?=
 =?us-ascii?Q?ZDZEgVy0bgRvYV/HKrg6oMOr74z5hBr4rBZElU0aqWtD/8opQm511izWOWSe?=
 =?us-ascii?Q?0hiYDD9kp0swlf3JfSkGBcR3VYCOu2hHs1SrzgHAc3nCm7I6N0+Vq91jXnXb?=
 =?us-ascii?Q?zqa32NRCI0FTRgaR3DkvXI/QyqudyQTgQ3KiFUCheUwhS9XlY1aSXiH5mK8e?=
 =?us-ascii?Q?/OxAFTmWSmhiKvLpZ/0yYj9PZYHOfQdXR0zMc9xyRIGVNIrqZogQdguvOJxd?=
 =?us-ascii?Q?YeQ95DKVJqoTz4uZ694+03CAcne26mk8B6/nXbTFlITEaXshD9EVJGXMY7N4?=
 =?us-ascii?Q?mMkvaUSitQ8swiLYPymyFYyse2YL9kriZrytp4bl1wdEAs3KoLGxK49b5pfy?=
 =?us-ascii?Q?Zn12TMi3KRPobRwoZ4SlQ1pNHOb0RoWv8zrNbVK0IcXmtVKK+dnc0Ry3HVLY?=
 =?us-ascii?Q?tu6673n99d4fO65WI4Dkc7j9I4brXzvmhsxPr8OUE6tzWAILUmEhg2tceGMa?=
 =?us-ascii?Q?jieWc/8PmMlU8JGNalLhMbLoQFTk5iYz358qSwH71V+dv7BwCurcwurBTG0f?=
 =?us-ascii?Q?TLbIJEdtsgfTS7rtjJ5ZX7pP5QtqGYqDes8sNfyJL0raUg5482a6gd/Nwvux?=
 =?us-ascii?Q?qGp9sRzbJMJ+4KynGn0bh3wLbTiX7xZyYVDhRa7dTJbyIwQtFwx+tr7+VKa5?=
 =?us-ascii?Q?h7KGeYI5F0STkP97x82FxGy1FxfJ08teLZidZ0aYtEjXnj98lDwCr377KqGp?=
 =?us-ascii?Q?UShZ3hbeuDoD9s8pQ+WDUlMiIRv6J6sm/Dyei/NIHaPc5UssX4iYa3mCxm2E?=
 =?us-ascii?Q?pY4hGGhGq+DPcWj6G7EVbQaIiq6YnwlnVA+/aK0vmJxAadXZy2YhUzihDUiN?=
 =?us-ascii?Q?OMoSyZ8y2A1OQSFUYIFNi2tUo4ThiO6+QfgeSAz+qRZnYGIasBXHtdCOvMgx?=
 =?us-ascii?Q?EavOwD2KlUAYu+0j12uyesfKc7T77l9w55qpgwjFVio7EVkOD8/T+80rYvYd?=
 =?us-ascii?Q?Rx9mfUHI7xnbpscgIXUAc/VO955aur05EpVcGtnk58EWeGbxQ5rEqHzBrIJV?=
 =?us-ascii?Q?HyBionVa0rjUHg0z1ltj2To5ECt4y+1j2ATL2f+vZqUJaKj6yRmnf6Nlbj5G?=
 =?us-ascii?Q?MvNBLZsDI36lzB50k255apHHy0ACSfYM8XLbMbTKPIsJtCkAfzBP38QGr9CQ?=
 =?us-ascii?Q?dai4s0/Uy2IQ6qeiz5LvV1a4kDlOdNcjlGf/0q8aGyjoYdeicO1Y+9uePftf?=
 =?us-ascii?Q?E7B/dCH5eyO5uGlmC1aIY4vMW8AkHcDF/2yWaBikNtbRaLVnhOrfGaAPgr1l?=
 =?us-ascii?Q?/Aip4Zg5wneHq6LaJ15vYY6YBhF+YvzzwzoA+pi01N000TICOXLT2eh2iMId?=
 =?us-ascii?Q?yV6kd5nqICa6rOz2JcQlFNq2AoICGgj7oYui21Vyp8ByEOOTLEmaZBSH0zlO?=
 =?us-ascii?Q?eluzKojQuefy2wiSZXSB3t9WIKBam/jkQimC4i1PnZ2ElT47sxrTc+UgO4G+?=
x-ms-exchange-antispam-messagedata-1: tdOMQ4UPL/tpBvN+dT7VZhcmEiFfpDI1etg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: W6Q+JJGdEzU0KuOYvnlaHh9vxgc4gb0GkeHYoq0r3cq4PCprtR25QYNYxrp8QsR18SnXuTfmTJoLxlub2a/xfh8N/IAmEmRhKuZRDri/YE/yL6cNwehQucMfV+kSviTePWTA1vFARGOI+GCaZLXl53Vx9sYuANyUm83KPObti30kbVuFqMXJn0gDRJcE6FU80A13z8STIQyGQHsBfHMEMrdFZjFjhcGUV6RhI5efORnJRvvDzCcCwrBV+9IXqr0zCHhLwuLh1445VHwEhMKl2gNH5KUxiI3M+dEuWEhRM8ud0vM6ddT9AKfpPxuwkD7qlupt4hVdDlA9oTqIfNehhw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613de3ae-00d4-4430-cb74-08df305b7c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 16:42:39.8548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDCpRzWj7Pxi0pI9eJkobOH9pzUVFeNkB0PeRBRs52Gl/FjmsiHU1xumnbzRzoq31x4Em+Zm+1X1wZ7Ww5hf9ySvuEZTbZU1sOXhB7Th3t+onbERFzpZFv8yzV8DgShQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8446
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
> Subject: [PATCH v7 04/13] drm/i915/dp_mst: Limit M/N ratio for MST
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> The hardware does not support DisplayPort configurations where the ceilin=
g
> of the Link M/Link N ratio exceeds the limit. Enforce this constraint for=
 MST as
> well.
>=20
> The compute config path needs no change: MST goes through
> intel_dp_compute_config_limits() too, so the link config filter set up th=
ere
> already excludes the configurations violating the ratio limit, and MST fa=
ils
> there if none is left.
>=20
> What is still missing is pruning such modes, so add the check to
> mst_connector_mode_valid_ctx(), reusing the helper the SST mode_valid
> uses. It walks the link configurations and only rejects the mode if none =
of
> them can satisfy the ratio, rather than evaluating it at a single link ra=
te.
>=20
> v2:
> -Drop the checks in the MST link config helpers, redundant now that the
> constraint is applied while computing the link config limits. (Imre) -Sha=
re the
> mode_valid helper with SST instead of evaluating the ratio at one link ra=
te,
> since the link symbol clock is not monotonic in the link rate and there i=
s no
> single best case configuration.
> v3:
> -Now that intel_dp_mode_valid_m_n checks for all configs just call that
> (Sashiko)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 7023619aaaba..f00edfb66a10 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct
> drm_connector *_connector,
>  					   min_link_bpp_x16,
>  					   bw_overhead_flags);
>=20
> +	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
> +		*status =3D MODE_CLOCK_HIGH;
> +		return 0;
> +	}
> +

Please check my in-line reply on

[PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST

Thanks
>  	/*
>  	 * TODO:
>  	 * - Also check if compression would allow for the mode
> --
> 2.34.1

