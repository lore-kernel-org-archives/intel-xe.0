Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CB9C61DE4
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 04:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC5810E39E;
	Tue,  1 Sep 2026 04:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEcbDJk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6566610E39E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 04:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788235782; x=1819771782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OFfbEq9xuIVecST6LdKLxEhNvp1bXWwIgOb3uVXTDBk=;
 b=bEcbDJk5rXy6BXnqK2ZWFJaIpjj0uuhXXJsyzh+wOdFpvTnhWMxbJniU
 x4Q/CFNJvhPtkvqWeRCNnpMmL/2KeQZnKkbTrf31svWK8Vq5YGTNKjjpB
 ZYil6XqKjiBjPGLRZYkjJ0zxS1ZH/ytyk6gQFKuGySvA9a1N1j4uZasB3
 b1FjwY5EtaRoip/0iFFqrJPtr4AN3BVzRkYu7KkG7au+hrNaD1XnyPIf9
 FIK/Lqe6tD9yYcrk/RftchBLfgrVJsGUGB3DkJRwLbtsXxKtyUgPb24rZ
 PGUJHSfwjQQL5xDbxZtwHCHqcP6ffBrGCTR7w8AIdlqYV52RHOF11JPqI A==;
X-CSE-ConnectionGUID: 8u0GnrQARNS2mPngu1+R9g==
X-CSE-MsgGUID: jU106FwJQJWj3bT6lZ9NSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87593370"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="87593370"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 21:09:42 -0700
X-CSE-ConnectionGUID: uV8mTsGGTo6j41K3OQzT4g==
X-CSE-MsgGUID: f7FMcFXTRZWDHSWsJ4I4Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="262836622"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 21:09:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 21:09:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 21:09:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 21:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snfj8PzZJUFfvjOr+0bpSEqyZtudWbqqT4ErQ3eBzOztRwGaD8j4eYFu1yZVnEDmwkABqatRExqHXw2Ffli9CTvYddZDia2/D4ErgWjPnRozvRbBoc7wW1EUu3FprnQ/hAelUrF9kmNIxaLBoFnRAI6KEvpMthQARtvJaMQfI0HkKsVytKKj/MDoq0WjIqlYKGLO7maaav34+m/7C7PujptaDTELk1x22rIxvRUIiUNmVmsEOhBNuD3ALf5pXE2cJlrr2vEQYi4ErljDU/o0dVo08rIu0JplVn3qSIk9WQVGu1uOJWhMa43pf0UIuenLnjRwoPrTILSithIfhPDk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzANcnBDoz0T/H7ecy7GthuTLgN43SKDk9TUvdsFs0E=;
 b=Gx+b/7tOLS/bpO+3jdP7tbEjLpgQoTL8to77/mOLXHQp0+pHMfS6QMUToYaJrLHGx5i3uXD5t09dtWJS8Qay8LTnNLd9XRTHAXL/K0fRQrsK8aqlCUXl/kFljMVO17uDg7zAoANeoBimW2Xm7jMxirhxsBbInCyH12iituZdvk3oyEYydvQXjXE5xEnhdIwNP+pl2waegZH9rCCK6jh1sRGETrzHSdmdvTgDVePqm23BNv2PGILpEN+BIuBzfRBraqmhbGXLsM9kYd3GEuOns90hMbzUOJE4aKvXHhkk5MKW/Bf/luJRKfogoRJHydNxxT6T1F2JkLwFkAT+QB+Cgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA3PR11MB347531.namprd11.prod.outlook.com (2603:10b6:806:52d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 04:09:38 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 04:09:38 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH V19 00/15] Add memory page offlining support
Thread-Topic: [PATCH V19 00/15] Add memory page offlining support
Thread-Index: AQHdORT7Urk7a4EefkqY4fCNJt2BNba4MTMAgADrl5A=
Date: Tue, 1 Sep 2026 04:09:38 +0000
Message-ID: <DS0PR11MB8718B98EB0F7A14D8A1AD89381A82@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <apWKAFsHP9XLMOHn@intel.com>
In-Reply-To: <apWKAFsHP9XLMOHn@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA3PR11MB347531:EE_
x-ms-office365-filtering-correlation-id: ca15887e-ccd4-4575-c2f2-08df07ded722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|38070700021|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: NUtsRd8EWlJRx5VSKJn63GbqvxfGyxSMPD2MkZRIPBfPTASorpyduqwdbL+Nhsv8A+39ESUfFiAn+/56FbQxGLANvIwsn5PRjPOwWYl9ifRxmckO5mMpw/geS21QQCIqC+cy4FlInBoKnPzN2uc+ZpCysvy0tUJNTI9o9eeXQ9nrCN9Y6zExIVM7vDTIu99oVloD1RSlCie9nWVoisONpQBD9wfsgVj3t5+yyhqDPdR9uUcooQtwOWOEiUKzxKSSUxHlg1vkUPJlCB39s0edxzZ5U/g0azw4ldTtaYieZArD8tR7c53/kJfS1/KT5++3403BwisBv7lLr7zvYKtcx3cW/niLS++a7U6N3py9VAp97AZFSSQDT/Hkv59RYsbPFtGI1v4n4TEpJdqpmKe6EFaak4ma0TdcG8owAD0f0Q6LUg/sO9FRrGHT6U1BC68GOeDMv0ko93K10aBHYljRXLf82I5TM3Qw1NPAup+HZIPGUX/W5K3qVb6nzGWuMQpQEBLP1JPmABvQeW5/EGueVP6Ld5Qh7h2vQxQ98sH715dSDrBRrYlt0/jxOQp5HLTbxLDQVvc9aJjtuCRqGL6GaG6NGcn3ECz43bvztOB8apTzCNxkvXPupRKj1Zc1zFsOy5t7d31oObKXm5898vQcqLmWBt2/fA2sptQfHXD5iqk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SNt5qgs2Vnr7yYcH9fUssGpwmQJBG9ycMBGHaZGT4frPzAPXSoK5t//Ow89L?=
 =?us-ascii?Q?Yw0rQl8GnMGP9fRWdxG3A1nxeLyLNSyLktLm9LEJ45x3htC2vQWYbgBraZAY?=
 =?us-ascii?Q?y1n7WMRz6QKZ3HcSP/8Q2xfldQdALMRtJDvItrv8BOQvsgl9Cju/0y012ig8?=
 =?us-ascii?Q?mHP+fR15mKS1LD8aoWa4gpdB3vAv96aICvn+GY3VvzHC0xQKNcTrvvqQRAOG?=
 =?us-ascii?Q?LOl/QqEgHMM/3bhwa4XKjQ7ZVMTdL+3cTFxIHGuLrzLhS4rW2dAE5Nmv4DQ0?=
 =?us-ascii?Q?D5P0/ydyepry4eQtAwLFix/Kq0UonpNJKrJulxqrBkiAh1vv+7cEJySmX349?=
 =?us-ascii?Q?vgOMVEGq/xd2iFFc2WNmMSoKMng25h4OymGzJ5gn1naDIuaVjJvIswTL2qKf?=
 =?us-ascii?Q?RWgSekm/9j9OvIhISjlLgpN5h+V98zEHK2TR5AHtGezbjieAMa7pqiwTw+vm?=
 =?us-ascii?Q?eB00TGrLGxYFdGzE3+6NJqkDk0BQ5K4a8BpVjcNGKP4zuyNY+PmD6+fnQmf/?=
 =?us-ascii?Q?WsqXxNohkVL6WQiTKPMBVVwUhkQF/iD7cNEA74V/2y8LNacLJRsckNgp/h8T?=
 =?us-ascii?Q?Ci+JuKyCUze/uUoU9gOwlzWtztQfqfIsHe3q807p/9qR+q5EOPcyVGPYLmEr?=
 =?us-ascii?Q?Umg5Es9kgk2dswMopcZqIHi5vGmnFAW+SgXYNOrVaTXThi1X5baehAmSvq9N?=
 =?us-ascii?Q?7qpvE3tdVeN4Nqqdj+IiLGrXL5Tspee9svj1Je1xJSil8Meo+M6TmaITuEeO?=
 =?us-ascii?Q?5xUQAkiH7uW8sUTAKQ1Oo9J0MhHdtcGkOuidlzQMjY8229qTJ8tQOOYMCJga?=
 =?us-ascii?Q?DwUiMzXaAGj3Zs/8ockMkEPItowmw/F1H92Qnv3ItHMWNfFR/bmutac3ILcp?=
 =?us-ascii?Q?6p3kPAOfxnLHgOzZeScFkgPnanWvKai722dt+aEzW+3ldJQ9bQX9HM8Ab1Br?=
 =?us-ascii?Q?GtUvCdqhqFu5UXebHQjdEIHdRSQxLTAnt+xNpFDtRJL6sfn0frfG/WccpQFZ?=
 =?us-ascii?Q?zQ/8txv6nbPQH5nVbIieuZau/rlBkFT71ORg5dupirZMTby1ISDy9abHremp?=
 =?us-ascii?Q?KDKeisbfImPDuFSFG709Jfjo2nrWenBAq6B8H0GdPTLnQEUPQ/bdpW59ghqa?=
 =?us-ascii?Q?aCedsnLrb9R7xesyKomMoq2a/xDBmZBJg9BZ84WDpa6chbhAjhj6tSTF9/vF?=
 =?us-ascii?Q?RmbdTvrtfIRXBFuNdQkfWJcd+s0/ScWQvUKlGMBHND8ko6mpVOvgrOtxytYI?=
 =?us-ascii?Q?7Nq0HZJux4nPd2QMHp2lDZJut0RfPAZi5sr421x6q2uxUBXVwVqArIDtxNie?=
 =?us-ascii?Q?UXmH7eCvAFz4OeD/EDbFD1DZkk+evxf1YAiybY2hCa3ubtyl40r6izGWksf7?=
 =?us-ascii?Q?qhg+kLBR/bWRHSFYtGyVzCHuEsFWOddzq1AfN3Om5J+v+qsGN6wZK1ERgTOq?=
 =?us-ascii?Q?9AjVs+cqsMixUXeiB9uHoV7BpivvNJn6XzuZFrhsHpHKHehuy36iJp4A2eMe?=
 =?us-ascii?Q?5yptzR4t0AmTE4WQVLW34768jfsZDJB/QPdFQFBJ7hATmnMkkMAfJALmmIF8?=
 =?us-ascii?Q?lDoFfXl6/EUZE/Ui2a3TpFU7flTI0RZdM3L0K6CetnYCoLYE892vzYjHfjVq?=
 =?us-ascii?Q?WK2bx/2OI5s0n4L/vA0jmXKgQWNSHx+3jYpM5kMZpX4j0CPoc1ZnASC+h4Sp?=
 =?us-ascii?Q?iya6vHRON3jb0LSp3+vxn7K9F7Sd2v4jQ6TbtDXjScGPloCbEc0730mpuxbN?=
 =?us-ascii?Q?WsEpVWcBlw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JV1jigRK7Fd6H3xNvhrMbqDWEwd50zCLo2DA6Pzxwskc+XKEJ/KTO6irLuGHc6w9g4IdpyH+O1YTsI6nChNp8sgHEZ0z2X5w8fh8Rvst/bezQeiwP1yQ10KpVU+9MYWthwGWLYi578V5OIXGq8fRqMXg5QgYxp8dPAnDx2rruF3d5SzHUM62H8ltquVXFLchIt1LudWFVe2L5tD7DxAAqE594E9PgD/eqII+9jpYtWEQNMkZ6PYAv/ZwS5GehSpjT1jnutEyXF/+eS5GAoMyBhYvGq2Kr8LjALLZzyMEEqPYpfiQYEQrNGxe+JSoDbt50tcWz9lEcDu+VmO210f0RA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca15887e-ccd4-4575-c2f2-08df07ded722
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 04:09:38.3399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jCkaiYoJjEdBpgggiRLiHQdcLyc+HzTtxePB+vnCMr73TBWXUDQDHlYjNObXcL/ZoOm+7gBjYfh6NJcKdRSOJmVVxs/Ro6GMQJ9I+eZn6A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB347531
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: 31 August 2026 19:35
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH V19 00/15] Add memory page offlining support
>=20
> On Mon, Aug 31, 2026 at 12:19:42PM +0530, Tejas Upadhyay wrote:
> > This functionality represents a significant step in making the xe
> > driver gracefully handle hardware memory degradation.
> > By integrating with the DRM Buddy allocator, the driver can
> > permanently "carve out" faulty memory so it isn't reused by subsequent
> > allocations.
> >
> > IGT tests for testing this via injecting simple single address and
> > duplicate address fault to unit test functionality:
> > https://patchwork.freedesktop.org/patch/748439/?series=3D170555&rev=3D2
> >
> > v19:
> > - Sashiko review comment closure
>=20
> I was going to push this series, but I see that there are still many Sash=
iko
> comments that seems valid in this version.
>=20
> Could you please comment one by one at least documenting why we are
> ignoring those? (I mean, only for the ones that are not pre-existing)

Ok, they are the ones which either decided to come as follow up change or n=
ot affecting in our scenarios. Let me reply to them inline.

Tejas
>=20
> Thanks,
> Rodrigo.
>=20
> > - Sliting of making xe_bo_ttm_purge() export and NULL handling
> > - Remove redundant code in xe_ttm_vram_reserve_page_at_addr()
> > - Resolve nit comments provided in configfs and debugfs
> > v18:
> > - Splitting out the sysfs patch; it will come later once it is
> > redesigned
> > - Address sashiko reivew comments
> > - Add debugfs and adjust igt tests and fault injection
> > v17:
> > - Rebase on drm-tip
> > - Enforce CONFIG_FAULT_INJECTION_DEBUG_FS for fault inject
> > v16:
> > - Correct sysfs patches with moving code with rcu lock
> > - In case purge fail let next alloc decide final failure
> > - Remove addr_to_block API, its being pulled from drm-tip
> > - Remove some unused code and replace where existing API can be used
> > v15:
> > - Split few big patches into small
> > - Avoid vram_mgr lock in sysfs
> > - fix missing queue_pages counter increment
> > v14:
> > - Solve sashiko reviews
> > - Remove SOFT->HARD offline patch, decision is taken based on -EEXIST
> > - Dump gpu buddy allocated patch dropped
> > v13:
> > - Add fault inject and remove standlone debugfs
> > v12:
> > - Fix Sashiko review comments
> > v11:
> > - Add BAN reason for UMD to know about offlining
> > - Add support for soft offline mode
> > - Rebase and remove dummy lockdep annotation patch, as it merged from
> > upstream
> > v10:
> > - Remove RFC
> > v7:
> > - Improve debugfs warning messages
> > - Use scope_guard for locking(MattB)
> > - Adapt addition of queue member of LRC BO(MattB)
> > - Extend and use xe_ttm_bo_purge API for vram pages(MattB)
> > - Handle dma_buf_map requests for native and remote(MattB)
> > - Address if in never initialized block, set block to NULL
> > - Add lockdep in gpu buddy (MattB)
> > - Correct allocated_addr_to_block logic (MattA)
> > V6:
> > - Add more specific tests to noncritical bo sections
> > - Handle smooth exit of user created exec queues
> > - Break code and make purge specific static API
> > V5:
> > - Sysfs "max_pages" addition
> > - Reset block->private NULL post purge
> > - Remove wedge, return -EIO to system controller will initiate reset
> > - Add debugfs tests to trigger different test scenarios manually and
> > via igt
> > - Rename addr_to_tbo to addr_to_block and move under gpu/buddy.c
> > V4: API reworks, add configfs for policy reservation and apply config
> > everywhere
> > V3: use res_to_mem_region to avoid use of block->private (MattA)
> > V2:
> > - some fixes and clean up on errors
> > - Added xe_vram_addr_to_region helper to avoid other use of
> > block->private(MattB)
> >
> > Tejas Upadhyay (15):
> >   drm/xe: Link VRAM object with gpu buddy
> >   drm/xe: Link LRC BO and its execution Queue
> >   drm/xe: Export xe_ttm_bo_purge()
> >   drm/xe: Handle NULL resource and allow purging of VRAM pages
> >   drm/xe/bo: Make xe_bo_is_user() public
> >   drm/xe: Guard teardown paths against purged BOs
> >   drm/xe/vram: Extract buddy alloc and free helpers
> >   drm/xe/vram: Add page offline data structures and lifecycle
> >   drm/xe/vram: Add VRAM page offline fault handler
> >   drm/xe/configfs: Add disable_vram_page_offline attribute
> >   drm/xe/ras: Cache disable_vram_page_offline policy at init
> >   drm/xe/vram: Check disable_vram_page_offline policy in fault handler
> >   drm/xe: Expose bad VRAM pages via debugfs
> >   drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
> >   drm/xe: Add fault-inject based VRAM page offline injection
> >
> >  drivers/gpu/drm/xe/xe_bo.c                 |  25 +-
> >  drivers/gpu/drm/xe/xe_bo.h                 |   2 +
> >  drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
> >  drivers/gpu/drm/xe/xe_configfs.c           |  72 ++-
> >  drivers/gpu/drm/xe/xe_configfs.h           |   2 +
> >  drivers/gpu/drm/xe/xe_debugfs.c            |  51 +++
> >  drivers/gpu/drm/xe/xe_debugfs.h            |   2 +
> >  drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
> >  drivers/gpu/drm/xe/xe_drm_ras_types.h      |   3 +
> >  drivers/gpu/drm/xe/xe_exec_queue.c         |  14 +-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
> >  drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c         |  36 +-
> >  drivers/gpu/drm/xe/xe_lrc.c                |   1 +
> >  drivers/gpu/drm/xe/xe_ras.c                |   9 +
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 510
> ++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   4 +
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  40 ++
> >  include/uapi/drm/xe_drm.h                  |  18 +-
> >  19 files changed, 760 insertions(+), 46 deletions(-)
> >
> > --
> > 2.52.0
> >
