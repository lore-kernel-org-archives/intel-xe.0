Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC65D3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 05:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E5F10E060;
	Tue,  9 Dec 2025 05:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPwbdxJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06E210E060
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 05:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765259835; x=1796795835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Naf3cylkhB/Z2wD5BaV/Oz3wNYC+PpBBY6qvWVOEY70=;
 b=MPwbdxJ1SLaOErhd7vLzgl0NvhtmIXFU+3q6h5h7f3KIzNn1thsKB2X9
 LGdDPhV7UDzJbVaGQpH/w/txZwOo9amhL9rU1pJ8fAEMiz4T5F3n979dC
 Df6R7veIp7HP2ulImq7e4Fcs2vszQy89HP4/EpGbXxzmSgYuq/yrgzWzh
 qggJen9Fk759pO5HUDXvo1iSjCI2tdzGz9rwdzmMPGjzwPZv26AcJnYcz
 ygScNpHTg35LidSodW4XhpSicPFXv0Kx6PHtL9bKDbtAt1fboDhsoMV4E
 v/fMZpNOLU9Ru0eb9OskozxcqAwiN+kJFp8tnmJgjH4QVKE30SaTdP7am w==;
X-CSE-ConnectionGUID: 5/e2ZirIS2+t93j4k85vuw==
X-CSE-MsgGUID: 9FE6ZvuUTB6ccqUa/YhJbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67172910"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67172910"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 21:57:14 -0800
X-CSE-ConnectionGUID: +hPfXpmeQ4GEcdJG/FJGpg==
X-CSE-MsgGUID: DCVGN6FZTXOHN30+OzIsVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196427169"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 21:57:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 21:57:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 21:57:13 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 21:57:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nddmAkqA0Xdm2oLFsdWOCJ+GlJ7uWt3GAxwEAQ82n4xCZRdPSoh+PrrMWxEkENBaxmD34Tpr9U2MYgIJhAhPj7hBlwJJmsrmM1JCQhxtEk0KMXB5hbYWuvXW2gC/oXo2M86mxg6sPW5WGmkiZ22R0IIX1k+e8EX8HQo4Q+LKl9IpcBQmHygxa1E+L9oaeZTtDpsD8QBno/ebZWCjHv/zgU4FO+s5gSTBGz9MZqmvVd5BGScBpMVvj4SyQFNbv30Gpd6Zs6MhOB5c1Ft7EycLffLr0+7p9+z66vunmFZ6IHKvrKWfZWFhKXTxQxW87UDeMNFZfq6zln/+jd91XUOpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO8K8S0VHMMrAu5eNTxBesCIZGVSnYJCIUx5x6WHdFA=;
 b=zWZ16jLwpU1xo8UeGCy/DXVHNQNK3iN6f5i3kn4+h9DPzLSHuU7Ys+gzWTGnw2dAz3iE8MRzv9LDUp1JoaQB++PW5tLAf/2yEmu0G+NJ3vie4B5QzJxR0nWkDr7KKwKFe5h1EU1lsby8xIkwAXNJ5fMMJqBUnqyVbalYADj+os/o0zukLO9P/HpicrJeCjQveMpESa750mMC6remYb9CJobxl4iMrRXfQBqOX7tmuf+e6GKIHblSb+QJAqmEwAOHXBcYsbJhU0ehxBmae61yN6TfGQeOGbPt05133NO6qZiXQMG/rjQk76+BISx4Vt4BGWgsH06sSJd1gAJe7KWfEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 05:57:11 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 05:57:11 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Topic: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Index: AQHcXyi+Fk1JPC2dNk6+KKZ5pdCOXLUQlpUAgAATKACACDjfwA==
Date: Tue, 9 Dec 2025 05:57:11 +0000
Message-ID: <SJ1PR11MB62042AFB9ED9CE6A6CC0EDA681A3A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-21-brian3.nguyen@intel.com>
 <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
 <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7505:EE_
x-ms-office365-filtering-correlation-id: cfd96d97-2be2-4ab9-89fb-08de36e7cb6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?E4TZUa/xNWePjOPYp3Xp3/zuRmxdx0WTLmNXN48qLlcTBx/XWLJP5Vgw1BkO?=
 =?us-ascii?Q?WDrts2Z4xeYRD6kw5vz8Ra0HrBQHBRwtaqNgPniCiPnVnP/k8p4qmBODhn/q?=
 =?us-ascii?Q?e6QCsBcpvSjgFnvAW3l8p+NGhy/ZEu0X+XPOm36ZOQwM7WVv8xS/yqOQZtFD?=
 =?us-ascii?Q?BUjoXsAB6pow7v1JnRcugPyVzbPYyVaOn6zCt99NMNRCBLIi/WAjgAfOeS7m?=
 =?us-ascii?Q?/WjWmMikHUklR/Q4WXaP9ww+JY3hIofiMWH2+skVUmCc8a9t80i+NIMTORqk?=
 =?us-ascii?Q?mXPQk7k7bi2V+eYRkWyx/UxF1QK/RRQW+1ugZHQUgpdmMNpSmoFnwEtdFMU3?=
 =?us-ascii?Q?NA4zW1tvOWt9g9yDCIsZw4ZVtvk5CCTI2o0lxfTYmK7WjwQYp2ZAaere1VFh?=
 =?us-ascii?Q?RAWKcBOxdD/8dG7vrk62lvmf3tRm3CBC9oYnK0SgcTs8HfYcZPmuKoeBfi4u?=
 =?us-ascii?Q?hGb3pk++4JhYjQqxPWkLjfCCXOQxur11ssGGIuwpNbkhQPFEVRu92Ldd4QHb?=
 =?us-ascii?Q?EY0LGRfdnGAYLqTZXdwlLGnrDuslRSSk77vIPTGvhVw0tGl5osq8lJVNr4GC?=
 =?us-ascii?Q?t20CMUyKFzN6wV/CqaEQqB/AIyq7FrVTX49yHAr1UU8GOUgnZegzXs7MwsSZ?=
 =?us-ascii?Q?Occo0R3yrXz0DsdIlhrsYxKhkWTQOQYzOTNCoYNfbSP+7D09LaCYsu/PW7ug?=
 =?us-ascii?Q?r0gaamM5ae3YUyeC8nPl8zC8vi+XD8BMXs3/2aNmLwWYhWr2TpgGy5oHPA2o?=
 =?us-ascii?Q?25scyZ9U5m6FFTcx28ULBYApzQlhnKpBxNCsEqFLRg4jcaJQFFLY2qGCye9g?=
 =?us-ascii?Q?dYN0hauo/va2bX2KIRKVJQbL5qffzMykyvdwrtXoVVp1lO7INgtpMMef5QcJ?=
 =?us-ascii?Q?0II8iYq8g4grKXu8S7pWNFE6OHE+NrJ9DTYdaZAmCHIfjmErPSp/kV7Yj37F?=
 =?us-ascii?Q?rY6kB9ADfiCSSF1FDmkiyLkuNHXgS9ZGsUdDcc+Jc8VNLArnrqaIWwZPfY0P?=
 =?us-ascii?Q?kqztH4pEsHlRjEI+szdWl8+pqcW/EFozmh/BWzDCtbcoyYrU/zCCMa13Xv2b?=
 =?us-ascii?Q?OH506EbaOZsXKFu8sqHqJPdL/L1jwfcjXHQnwsvQ/mPmOSnoa/vzl+Gm03BU?=
 =?us-ascii?Q?WxSPHwbR3uY2GOcbMsKTNz89nFxygiZldJnuzvAUwBVsc0Z3KkGZjZG6p1jq?=
 =?us-ascii?Q?Np8azy3c4GhEmV+fSGRKiRrQIjhqjAGkxGnNs6DLGNK2XjphOSqFn5OiGAFL?=
 =?us-ascii?Q?UcPki7pj7uAoZJCwzSr1zfikMr4ZdhzAVhg/5AO7Z/3wFddPQgpYeoQ7I99v?=
 =?us-ascii?Q?uQfF/2qnRl8fJ+w3y4zxZCSZzSWgsE7C1abfKSX/2wFvTOAjnGxIDjrc1HKU?=
 =?us-ascii?Q?1Uv9kGpbYjqqSOOcx5Pe2aXkQYMP/dkz3H9e9Lg7LPHeRRRfNp348yCtfTqA?=
 =?us-ascii?Q?U/DSamABUEOf4Pbx4QoyqyqL0ClfnJ34y6CKUIjeLXBL3AE6npW7f4jXlRuU?=
 =?us-ascii?Q?QHyTtdGDKV/Cz71SAHLni/Ap6bdG7sr7j8xG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ajVJytbp6+Vgm5x6wEaDnOTlIo8VyfdfedGlxYpWKTKXtrPgK3Nro6CQENsC?=
 =?us-ascii?Q?g5IT4M7iwjPlos7CZD+tDZnOrH+L19sJSDwRwu6m1IWtr2WRWewrcY1WPWgZ?=
 =?us-ascii?Q?cvDVVTCrSDshyEpi0PLnksHeM1HzAwwFTC0q3KNXxkOUYA86DVgPl929W5CP?=
 =?us-ascii?Q?wyAoULgEOgu7nEVlvNlRYr5VmbGpE2oWJMfDPL6gwzBDCTkbMiadm+CLgtcd?=
 =?us-ascii?Q?mx2sPP+E7iiSAQ4EuQDWiJ4+5es224e20Wjs+keN+rDf1uZdEQzD2AucLPq5?=
 =?us-ascii?Q?7/+2YYI9zXogkohLLYHsXcppKbZxb7R+szfzTYIGbma0M0uNTgsRD8/1zmxs?=
 =?us-ascii?Q?aPNEwSPuySkC1SzBvKEzZEztPIXXQXLBchlQx9OVF6pBF1IMLwZa6vo44b2s?=
 =?us-ascii?Q?P3GKwP+uXa8r2NjGZvm+7HqLgZwnur84q21g5Rjt91sE0nnmVIUM5lOP620L?=
 =?us-ascii?Q?BgDHwaOa0duZWeIh4HHJajGSOGizojkmtVYNIDU9OQlGx3hA6tJGJyZOZ4Gf?=
 =?us-ascii?Q?1lAY4c4DLf6MrVZX80y8Rf1a9OOutalCsuUtsTWxCNgDesVOMxq6l5ry1TsD?=
 =?us-ascii?Q?7SPdUmydC4CVCFY2Z5PUFmZC2kxLWHTshShn9EaBJXqBZ2T9LMMllnGujc89?=
 =?us-ascii?Q?dJbQFSfNvG30tXzRsr7XdMdvhwzBCkgWN5RMx0ey81wRBl3qg47fqgLVbBUA?=
 =?us-ascii?Q?N4vfh4P+48XsfOtBv4mjRJgvUkH3niopVhgUpajTSi34Fqc8dU9h2OuOovlY?=
 =?us-ascii?Q?FGMhpqvLZ9dHh9XdglbG8A1E+XQS41OJcMPtI6Ycgk8O/ROryuPHyNpTEmM1?=
 =?us-ascii?Q?M69ExEJOEQLPPhBwU7mOO/Wh0C3CTyRtI+YU2sW8ui6/lvfU6WNvvI2ZJfm0?=
 =?us-ascii?Q?tM7G6PaLlryUKASg816WYsWRUeaT66UX2wBFLpN8EGPoD+R3vBS9NNjvYwBr?=
 =?us-ascii?Q?111MDcz5OUvyRJWdpODKjYO/DU8zwKMd2qb+Qwl8T7t54FcxtFjC3L/+43bp?=
 =?us-ascii?Q?XJHd3+ezTsTdTtB0QS+0Dzp9fTvyhpvUj/938PYIGpvSrmIrLSdTlb16cKuK?=
 =?us-ascii?Q?Q36l5k5pP10j8gn7bNkwJG15q8OKQ5n/n1HUwQyxbcG6CjSY4u2coaN8yHrN?=
 =?us-ascii?Q?1AKI6Wx22rRSX7Eiz/DwbkTJGtRD1A+wgdFs6m2gRYjMyoHDFvjmyC2MeIxT?=
 =?us-ascii?Q?u897bnf4od6Pewq9ffenSinEom96K+o+5cxcNRiPu4dgYQmy5vWxCkgtviAl?=
 =?us-ascii?Q?X7I/9W/G/1li4sZjAeRNfMHmstV6YhN77dQNOY2hyniqvQg5FmftmS/efQ2U?=
 =?us-ascii?Q?qGGxKbTv7awaUjqOua7Xe4EoAoqE0wlbY4SaLjZXujQfMWdRRXnwYaFAoLwX?=
 =?us-ascii?Q?0AraSn83BQ8os1slKAfojh9gcXUsZUDLUHpqF4DkdZJ8AmU+WkYOwAsOwynx?=
 =?us-ascii?Q?miO9odMBCybHBFeQ6L10dShN2PACtPztpTqb4OpXZz1vk5/cDYzoMCBcOeBu?=
 =?us-ascii?Q?99s51TiPgmKPzGeKHa9L7Bmi4y7C2aH85Vc70oMjo3BGGWj40PwmYYafTJzY?=
 =?us-ascii?Q?CijCo7YDVzTj/NHxqwOLHvgXn+PGb+MPoACjVHHJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd96d97-2be2-4ab9-89fb-08de36e7cb6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 05:57:11.1379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwCG1CN/eMqj2gJBLJfxCdgnujhywueC4/fWzlzCX8YOLwj7MQvLWsW5y91SAa+6UDUFAsY/VM2yjJk42pKOje8/0Ugi58yqYLvmercinc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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
> From: Nguyen, Brian3 <brian3.nguyen@intel.com>
> Sent: 04 December 2025 05:52
> To: Brost, Matthew <matthew.brost@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> Summers, Stuart <stuart.summers@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>
> Subject: RE: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
>=20
> On Wednesday, December 3, 2025 3:14 PM, Matthew Brost wrote:
> > On Thu, Nov 27, 2025 at 07:02:09AM +0800, Brian Nguyen wrote:
> > > Use page reclaim list as indicator if page reclaim action is desired
> > > and pass it to tlb inval fence to handle.
> > >
> > > Job will need to maintain its own embedded copy to ensure lifetime
> > > of PRL exist until job has run.
> > >
> > > v2:
> > >  - Use xe variant of WARN_ON (Michal)
> > >
> > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
> > >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26
> > > ++++++++++++++++++++++++++ drivers/gpu/drm/xe/xe_tlb_inval_job.h
> |
> > > 4 ++++
> > >  3 files changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 347b111dc097..833d6762dd8d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> > >  			goto kill_vm_tile1;
> > >  		}
> > >  		update.ijob =3D ijob;
> > > +		if (pt_update_ops->prl.num_entries !=3D
> XE_PAGE_RECLAIM_INVALID_LIST) {
> > > +			xe_tlb_inval_job_add_page_reclaim(ijob,
> &pt_update_ops->prl);
> > > +			/* Release ref from alloc, job will now handle it */
> > > +			xe_page_reclaim_entries_put(pt_update_ops-
> >prl.entries);
> > > +			pt_update_ops->prl.entries =3D NULL;
> > > +		}
> >
> > Do we not need to do this on the media-GT? Or is issuing PRL a single G=
uC
> sufficient?
> >
> > Everything else looks good.
> >
>=20
> It should be sufficient per tile. KMD will request GuC FW per tile and
> afterwards GuC FW will issue Page Reclamation to all the primary XeTLBs, =
for
> GT and media within the tile.
>=20
> However, I realize that this means we should be disabling PPC flush for m=
edia
> TLB invalidation otherwise, it will conflict and do a PPC flush anyway. W=
ill have
> to rework some of the logic to handle this if so... Taking another look a=
t this.

PPC is physically private cache for render only, isn't it? Or we have PPC f=
or media as well!=20

Tejas
>=20
> Brian
>=20
> > Matt
> >
> > >
> > >  		if (tile->media_gt) {
> > >  			dep_scheduler =3D to_dep_scheduler(q, tile->media_gt);
> diff --git
> > > a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > index dbd3171fff12..2185f42b9644 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > @@ -7,7 +7,9 @@
> > >  #include "xe_dep_job_types.h"
> > >  #include "xe_dep_scheduler.h"
> > >  #include "xe_exec_queue.h"
> > > +#include "xe_gt_printk.h"
> > >  #include "xe_gt_types.h"
> > > +#include "xe_page_reclaim.h"
> > >  #include "xe_tlb_inval.h"
> > >  #include "xe_tlb_inval_job.h"
> > >  #include "xe_migrate.h"
> > > @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> struct xe_tlb_inval *tlb_inval,
> > >  	job->start =3D start;
> > >  	job->end =3D end;
> > >  	job->fence_armed =3D false;
> > > +	xe_page_reclaim_list_init(&job->prl);
> > >  	job->dep.ops =3D &dep_job_ops;
> > >  	job->type =3D type;
> > >  	kref_init(&job->refcount);
> > > @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue
> *q, struct xe_tlb_inval *tlb_inval,
> > >  	return ERR_PTR(err);
> > >  }
> > >
> > > +/**
> > > + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> > > + * @job: TLB invalidation job that may trigger reclamation
> > > + * @prl: Page reclaim list populated during unbind
> > > + *
> > > + * Copies @prl into the job and takes an extra reference to the
> > > +entry page so
> > > + * ownership can transfer to the TLB fence when the job is pushed.
> > > + */
> > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > > +				       struct xe_page_reclaim_list *prl) {
> > > +	struct xe_device *xe =3D gt_to_xe(job->q->gt);
> > > +
> > > +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> > > +	job->prl =3D *prl;
> > > +	/* Pair with put after bo creation */
> > > +	xe_page_reclaim_entries_get(job->prl.entries);
> > > +}
> > > +
> > >  static void xe_tlb_inval_job_destroy(struct kref *ref)  {
> > >  	struct xe_tlb_inval_job *job =3D container_of(ref, typeof(*job), @@
> > > -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref *r=
ef)
> > >  	struct xe_device *xe =3D gt_to_xe(q->gt);
> > >  	struct xe_vm *vm =3D job->vm;
> > >
> > > +	/* BO creation retains a copy (if used), so no longer needed */
> > > +	if (job->prl.entries)
> > > +		xe_page_reclaim_entries_put(job->prl.entries);
> > > +
> > >  	if (!job->fence_armed)
> > >  		kfree(ifence);
> > >  	else
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > index 4d6df1a6c6ca..03d6e21cd611 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > @@ -12,6 +12,7 @@ struct dma_fence;
> > >  struct xe_dep_scheduler;
> > >  struct xe_exec_queue;
> > >  struct xe_migrate;
> > > +struct xe_page_reclaim_list;
> > >  struct xe_tlb_inval;
> > >  struct xe_tlb_inval_job;
> > >  struct xe_vm;
> > > @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> struct xe_tlb_inval *tlb_inval,
> > >  			struct xe_dep_scheduler *dep_scheduler,
> > >  			struct xe_vm *vm, u64 start, u64 end, int type);
> > >
> > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > > +				       struct xe_page_reclaim_list *prl);
> > > +
> > >  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> > >
> > >  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job
> > > *job,
> > > --
> > > 2.52.0
> > >
