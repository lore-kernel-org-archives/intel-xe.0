Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5400EC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 03:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0627910FA06;
	Tue, 23 Apr 2024 03:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mz1Beufv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA9010FA06
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 03:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713843366; x=1745379366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/XCrDGHcN5GIYcOmt+YopS0wYyY7OdLXOhS3SgscHsk=;
 b=Mz1BeufvKsbKa335ljJ2WTGDnIf5JIX/qXbOktISVwfpD1KoUmGt045C
 vvX/WorwiPv7CA92mRrEziot4sOKdegoMDE7SmW33VylrfNmlLrYRopm5
 clBD3VkB0dzPVEirqagoMpbk5jXpLvaYyhdXxC3SXz870//hkjASaDJty
 8kugbZ/15/Gn6FtZ2bLgfYm8rKM5Cz4qoLtYcwiBbXgiZYogD+69iXa7g
 ItCyaszzrAC77l4GhUMpjGwDHI9Fx9COWIQbi2QhYjYl9SynSZHEb93KE
 7LS6LTUKfnfNWrkz+VjAcmOlU3fMPKTx6oEqTFCe4seSyNAPv/8Eut7Q1 w==;
X-CSE-ConnectionGUID: TgNBpkoDRjGmbevuwl+JQA==
X-CSE-MsgGUID: s2B0Ea3QRIin5ws2fTd/5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26924813"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="26924813"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:36:04 -0700
X-CSE-ConnectionGUID: /GBKyvXGSMO22EwZtBS0fQ==
X-CSE-MsgGUID: SokDXtv4SDOohHiStKNF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28883416"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 20:36:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:36:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 20:36:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 20:36:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9W6gKFb/aKDgxVaM4Aa8uPHPV/g/M36OAJjMTE4nsZ3c4E/5fM2XyDLtnYRU7/zIA1q+ePKAZ2cdlumeSyZ+4jUhwy57keXSDBdCZtHXWPWBRxSy5IqZEdOpF4CXLw9K24SzaJM+pFH8J0pX9KjTQP/XHzKralB/LFMKvhMmbeKnsaJ4rJGHV6+P66O6AWYC+YQF8P+2i1gaCs6WzNl4YHUMNdm8YJFKPIiFUYn3wjfJREO/qcDUAcubyx2EBY0tV8Srgny8uK2OBG829t07DNRY2wKBnGIWmPOvPmsR8pAtgPEFpIG4H7xs540NLXOTtXWADnH0y0G9RSxigr1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pEgNH8bsY57Y/zHu2xKIxTLJ2H9QnCCGfkmsrELKjI=;
 b=Ha0mDfahMAmlpQgyew9bExAzGaoVW4vm3y4Yuj0EsdNIxhvzf27Yoq4nfEa00WFmrIo+ijQfASJXb+MQs3dZMNs/T8LrPtvElpGvJzO7biqNtPw9Wvu+jGyWSx3xbe4do7iEpXv7us5rDXWHjZEAgAvH8xfHyrNBm5N3dwcgNNNcQyJzu3lPusQBpMmCn5O02lukS7vqV44Qev3Bhw+y8xXXE/LUTvy90FyxI0gMLYEK4QVJKHMOyxUYLKgpPqlwY9lL8DjbNsoK8lhGyOA5HX5o6DnE9o8xSQm+bNfGov84eUEzmVcp5K3X9e4aRkb/tJRYY7YON8r6UzTss97xbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 03:36:00 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 03:36:00 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 11/13] drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
Thread-Topic: [PATCH 11/13] drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
Thread-Index: AQHaiwmrqiRVhi9CU0iO0z3QSEVifbFvwv5wgABLFgCABTpo0A==
Date: Tue, 23 Apr 2024 03:36:00 +0000
Message-ID: <SA1PR11MB699148B27B3EDD83DC2E88F692112@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-12-matthew.brost@intel.com>
 <SA1PR11MB699187124D07E9B753DEAA46920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZiLJwnOZzrx/PaBn@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZiLJwnOZzrx/PaBn@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB8414:EE_
x-ms-office365-filtering-correlation-id: 5db5bdad-9895-4918-a480-08dc63467ef5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?ADVxQW1wQrdN6MXvR0ArEbtcFnMdpGtGJdaWsQVKNdiK2JzkyH73aleNTJYH?=
 =?us-ascii?Q?0vU0kFle+7O401mzNOFqaKP0ACUswrGCnUMT80U1lS36SaCOoFkWVc6KJfsg?=
 =?us-ascii?Q?GlY8R0Lkj5en5KZwMpEXm2+rwLDz9cP1gStbsnW9C4FdN1hH6tx17CzkEEuw?=
 =?us-ascii?Q?ajWKZih7tVGWoMgzSrY9Flr1VrvZIkgX5Ss9ArYU4WRec6E7NFQvVC42cflW?=
 =?us-ascii?Q?JxMN/YLUNWNIlQFDL0Jl8NT1/pogYUSkJAd0Mc/18LIyoByuSBRmv9qq71HS?=
 =?us-ascii?Q?CWAXOOmJLjxNoxUjA299TQQtikDHC9nzsN+MxGQdRdFgEYWvixgWPejoDPej?=
 =?us-ascii?Q?ABRH6qAFHaWrjstoEXZ+FS/fLyLFoH8LEMbKN5XMCIRRVqSYemOkAs0uWudF?=
 =?us-ascii?Q?JI8axajZBqSKkfqTx7EK5Y4up+PLD5wP3xNym9zZnyc23ad51Qf2GU528CCn?=
 =?us-ascii?Q?zxPYym5qggNHWvVnqQRuDxoisnzHc4I127c+HmBFruTsNR4nJbXmYzS16P7r?=
 =?us-ascii?Q?26v6ld2TmSQP/GZdkOUZcmcIMs8Np8Pn7Lms6I0NdTyFJIlDiY60hOWMAJK7?=
 =?us-ascii?Q?ChG8jeJ/71AThxwIEFIiYUni65WzMzuM65UgenNSqXfpRXykq+IykKslez/W?=
 =?us-ascii?Q?TqmPse8ZjbT7VhY6QY7wAad0L+iADxy5hbZXQ4fmmSwp1cgRjTbPY8vBtKbr?=
 =?us-ascii?Q?3KiB/R5mK0hEcEGQroSg8LchB2MWCuRdVxiEgT8FsnDmWSUh942iyhTa7PYF?=
 =?us-ascii?Q?YAF9mdIF5RPrGpsX3A67l1YcGRrmyRyXhjIHHbsVLftCJEBid9cQ3Ixsi18S?=
 =?us-ascii?Q?KDKTJlGxi+CFvkIivsEydLqkmTCsobXqhTxDLwRIFoz+jr2l4GhnpNP2nMq6?=
 =?us-ascii?Q?3zsNWwVFjjT3YDVAgBeOgFQpulmPJKp6VUnemgug/fY4emXaVy4T2aCYkV0S?=
 =?us-ascii?Q?CTkBlqyDb1GIam9k30/NePcXa+odTBMh0iqXKewHvJs2clLwFQBKam/wdFGb?=
 =?us-ascii?Q?6wDbYq657JV9ivT76N4UJMB3+1T0KEFLMF0S0P9TCh91v2sd5ZYrZyTvJWAg?=
 =?us-ascii?Q?uNSydUuHPndGxVKeZ3Kwd3Td7gygHOAGA80s4LbtGFDWg7BuMzrHOKv9w2KB?=
 =?us-ascii?Q?Bg5map6nVjQldBvkWlIORSseg00+F4Kk23z2aaHrSuNWOcsQnUFo/6u9Drh9?=
 =?us-ascii?Q?y8FLGBbLQ/j1C5DMyikzvuYTxvpX8+cv3vTpwhyvWH5qXCSkKNm9gdJ0Hmeg?=
 =?us-ascii?Q?kknDgUIflrJs5xpELzNEUfbl2/ci4JIIpSAGRIOB72lUbNSATMi6hS1XVtMM?=
 =?us-ascii?Q?tpd9oOgxmYHN729wbA5GQJIe2t1vrhIL5qLHhmffwzZNFQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OAf1vmOeGB6Akiw0EpNkGdIBVY61aZpIDFbt3Je5KMmJBouMyRkigdDYg6Nw?=
 =?us-ascii?Q?5TAfR60uC0D4q28B6Y8sKytbaxIt87sv+3UeeNic2TyufT/PXM1K4n90+CR2?=
 =?us-ascii?Q?ksy5yWXsjgRDilBP9pUsxcdLGIE81CcYwGH9a0URyaX4I7w+7MneQ56Vss4r?=
 =?us-ascii?Q?+EdZbaIWkbsbb5ZTxF7juCuqYmvHJdv9e6+5LH0Cn7w5J7CCRp4IVIhx7BQZ?=
 =?us-ascii?Q?Ra1iCfJSeBiGIpI6i6uARX+jF773hDM8iVDYjHTlBIU1B5Lup94P7aQ8Pwi9?=
 =?us-ascii?Q?gIImqAd0qgIhfL5HWTXKX2QNpXV9AT4fOPPS3DQqTi1ymdTeK/B48zqzv4Y0?=
 =?us-ascii?Q?LwxbAvyk/VQWAytdW1VUWjqJjMZ3RDo5PIq+5zg1Yn3mmaQqy0m5WpwiokJG?=
 =?us-ascii?Q?NhT4Tt85Tvekjhs8BFMZfwCS6TwYtrhlXwqli0PNl1dSfwRgDu4N13jB5mko?=
 =?us-ascii?Q?tpl4ivUvxJCA/o24TWLZ1Wt4fvzroirQBl1A2HXZ9mSybphizc/7Sc6CpTmR?=
 =?us-ascii?Q?PlfWF0ET74TqqVc33y1xYITm2UMt8W94WloE7tVA0fHXnXVTLbuMrbhPrj4i?=
 =?us-ascii?Q?UruzdQIJoGy2GzZXEM/8G8BS9q5V6WvQrUwHoTNVBJkRmQAKRtdlFnRJwsDE?=
 =?us-ascii?Q?ecwp2ExOZXZ79KrP+Z+5DWfK/nBazVeBLARO+Js6vFTuykmw/spx3Eft0+Uw?=
 =?us-ascii?Q?EOIA/3/dmeQrKW6N5r2qU8kJSuM7L5fOAnBSDE7m8A96yHzw0FZGs+a45gtf?=
 =?us-ascii?Q?bdTn+6W6k4kQd+BdMwnPn6V06kh3yy0FsyUXn3bQhvzZF4jafYvsjm5cuhTE?=
 =?us-ascii?Q?qcfhtoZ+7/310j3OIHSMyszuP5RW8G1R2TNw7wb0teVzR8z6+lP99Ah6ELcH?=
 =?us-ascii?Q?l5x5wlMewdOnPFE+UTm0WUGDt9UUPccz5PBcXVt7mcjfWdio1o4gB5KLRowB?=
 =?us-ascii?Q?2BWEmOyMBWGnGt9POIDSomH3oo+OaWeS4bnukNq6WvFuIJrzTxnX/+NJpmFe?=
 =?us-ascii?Q?9nxYlenTMpTxGqZAxafUrNUBkhrC1DJO/Vu3aZ/dAFRFoJU1NubAR3gO6HsK?=
 =?us-ascii?Q?5ObRC04EwzG6qKNcg0uJpdPgTb/40PwW9G/6PoiV1vrvRELz/hr8+5l0/poB?=
 =?us-ascii?Q?bF/gCmw5uF2l69r8PMTi+z+SHwXKuvVHDzkt0sg09PPCbK2D+EFgqK+bnfMb?=
 =?us-ascii?Q?nD+GNN0KLZUk6Q0JtDG6Zscw5/CdsgpwRW/mlvSDeVsi/sZWxVfi6H1S9dpJ?=
 =?us-ascii?Q?+KvXcuIzKVD4/B1u1Py5zYAPoJjcUkGzrpKyHRpDPBqOdkILIK/lZClbziGQ?=
 =?us-ascii?Q?qy0eJnJHhqQLJKFfQBfJtXSQGX0haR0gqcimHEeQC9gm0P1aBOkOdb2x54fc?=
 =?us-ascii?Q?oIoJHZlQfhhpvcRl9LI/EXWP7FWkrzL9Ljn1mwXN9Ilb7xhesSJkqzEE7XeL?=
 =?us-ascii?Q?FK483J7dwiin1AOcyAOaFp6IMOBMLBhBC7Lf82KSMoYqsq+kfN188OWJTZYn?=
 =?us-ascii?Q?SxIbB8vyVZFxQFwOceFs9PKPwe0C2PjDu3iY+p3TlQ1ofIAHIfC6yrDTD6ZD?=
 =?us-ascii?Q?BGQ0PCVVv7ZvlzPhv2g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db5bdad-9895-4918-a480-08dc63467ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 03:36:00.8036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uz4uy4zc3kwtEvcBKCcwIrfa6TPCGSW616GCRY73EejjhKtP1+2Kn/n6SZIQ59+5ByXax8vqc+JmGBEu2g+RJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, April 19, 2024 3:45 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 11/13] drm/xe: Move ufence add to
> vm_bind_ioctl_ops_fini
>=20
> On Fri, Apr 19, 2024 at 09:24:18AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Matthew Brost
> > > Sent: Wednesday, April 10, 2024 1:41 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH 11/13] drm/xe: Move ufence add to
> vm_bind_ioctl_ops_fini
> > >
> > > Rather than adding a ufence to a VMA in the bind function, add the
> > > ufence to all VMAs in the IOCTL that require binds in
> > > vm_bind_ioctl_ops_install_fences.
> >
> > This is a typo right? From the codes, it should be vm_bind_ioctl_ops_fi=
ni
> >
>=20
> Yes, typo. Will fix in next rev.
>=20
> > I also want to make sure I understand here: so the ufence added to vma =
is
> *only* used to make sure last vma bind has been completed upon vma
> unbind time. So even though it is more natural to set ufence at bind func=
tion,
> it is safe to set it after all operations are submitted (vm_bind_ioctl_op=
s_fini
> func). No vm_bind ioctl (and the vma unbind triggered by ioctl) can go
> through *before* the last vm bind ioctl's ops finish, right?
> >
>=20
> The ufence is attached to all VMAs being bound in an IOCTL. It prevents
> any of those VMAs from being unbound until the attached ufence has
> signaled (binding operation complete).
>=20
> It is safe (and correct) to attach the ufence *after* operations
> submitted because we are past the point of failure and are under the
> VM->lock. The ufence could be signaled or unsignaled when attached to
> the VMA. Safe to attach signaled ufences due to ref counting. Future
> IOCTLs return -EBUSY if trying to unbind a VMA which an unsignaled
> ufence.

Thanks for explaining. Patch LGTM:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

>=20
> Matt
>=20
> > Oak
> >
> >
> >
> >  This will help with the transition to
> > > job 1 per VM bind IOCTL.
> > >
> > > v2:
> > >  - Rebase
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_sync.c | 15 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_sync.h |  1 +
> > >  drivers/gpu/drm/xe/xe_vm.c   | 44
> ++++++++++++++++++++++++++++++--
> > > ----
> > >  3 files changed, 53 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> b/drivers/gpu/drm/xe/xe_sync.c
> > > index 65f1f1628235..2883d9aca404 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -338,6 +338,21 @@ xe_sync_in_fence_get(struct xe_sync_entry
> *sync,
> > > int num_sync,
> > >  	return ERR_PTR(-ENOMEM);
> > >  }
> > >
> > > +/**
> > > + * __xe_sync_ufence_get() - Get user fence from user fence
> > > + * @ufence: input user fence
> > > + *
> > > + * Get a user fence reference from user fence
> > > + *
> > > + * Return: xe_user_fence pointer with reference
> > > + */
> > > +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence
> > > *ufence)
> > > +{
> > > +	user_fence_get(ufence);
> > > +
> > > +	return ufence;
> > > +}
> > > +
> > >  /**
> > >   * xe_sync_ufence_get() - Get user fence from sync
> > >   * @sync: input sync
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> b/drivers/gpu/drm/xe/xe_sync.h
> > > index 3e03396af2c6..006dbf780793 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.h
> > > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > > @@ -37,6 +37,7 @@ static inline bool xe_sync_is_ufence(struct
> > > xe_sync_entry *sync)
> > >  	return !!sync->ufence;
> > >  }
> > >
> > > +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence
> > > *ufence);
> > >  struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry
> *sync);
> > >  void xe_sync_ufence_put(struct xe_user_fence *ufence);
> > >  int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 0319e70577fe..1da68a03407b 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1900,17 +1900,10 @@ xe_vm_bind(struct xe_vm *vm, struct
> xe_vma
> > > *vma, struct xe_exec_queue *q,
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct xe_exec_queue *wait_exec_queue =3D
> > > to_wait_exec_queue(vm, q);
> > > -	struct xe_user_fence *ufence;
> > >
> > >  	xe_vm_assert_held(vm);
> > >  	xe_bo_assert_held(bo);
> > >
> > > -	ufence =3D find_ufence_get(syncs, num_syncs);
> > > -	if (vma->ufence && ufence)
> > > -		xe_sync_ufence_put(vma->ufence);
> > > -
> > > -	vma->ufence =3D ufence ?: vma->ufence;
> > > -
> > >  	if (immediate) {
> > >  		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs,
> > > tile_mask,
> > >  				       first_op, last_op);
> > > @@ -2918,20 +2911,57 @@ static struct dma_fence *ops_execute(struct
> > > xe_vm *vm,
> > >  	return fence;
> > >  }
> > >
> > > +static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence
> > > *ufence)
> > > +{
> > > +	if (vma->ufence)
> > > +		xe_sync_ufence_put(vma->ufence);
> > > +	vma->ufence =3D __xe_sync_ufence_get(ufence);
> > > +}
> > > +
> > > +static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
> > > +			  struct xe_user_fence *ufence)
> > > +{
> > > +	switch (op->base.op) {
> > > +	case DRM_GPUVA_OP_MAP:
> > > +		vma_add_ufence(op->map.vma, ufence);
> > > +		break;
> > > +	case DRM_GPUVA_OP_REMAP:
> > > +		if (op->remap.prev)
> > > +			vma_add_ufence(op->remap.prev, ufence);
> > > +		if (op->remap.next)
> > > +			vma_add_ufence(op->remap.next, ufence);
> > > +		break;
> > > +	case DRM_GPUVA_OP_UNMAP:
> > > +		break;
> > > +	case DRM_GPUVA_OP_PREFETCH:
> > > +		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va),
> > > ufence);
> > > +		break;
> > > +	default:
> > > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > +	}
> > > +}
> > > +
> > >  static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct
> xe_vma_ops
> > > *vops,
> > >  				   struct dma_fence *fence)
> > >  {
> > >  	struct xe_exec_queue *wait_exec_queue =3D
> > > to_wait_exec_queue(vm, vops->q);
> > > +	struct xe_user_fence *ufence;
> > >  	struct xe_vma_op *op;
> > >  	int i;
> > >
> > > +	ufence =3D find_ufence_get(vops->syncs, vops->num_syncs);
> > >  	list_for_each_entry(op, &vops->list, link) {
> > > +		if (ufence)
> > > +			op_add_ufence(vm, op, ufence);
> > > +
> > >  		if (op->base.op =3D=3D DRM_GPUVA_OP_UNMAP)
> > >  			xe_vma_destroy(gpuva_to_vma(op-
> > > >base.unmap.va), fence);
> > >  		else if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP)
> > >  			xe_vma_destroy(gpuva_to_vma(op-
> > > >base.remap.unmap->va),
> > >  				       fence);
> > >  	}
> > > +	if (ufence)
> > > +		xe_sync_ufence_put(ufence);
> > >  	for (i =3D 0; i < vops->num_syncs; i++)
> > >  		xe_sync_entry_signal(vops->syncs + i, fence);
> > >  	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > --
> > > 2.34.1
> >
