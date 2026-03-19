Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963CA1091926
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 21:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88B10E988;
	Thu, 19 Mar 2026 21:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ux9mXcia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1008410E988
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 21:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773956228; x=1805492228;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kRnoZVKBmkgncWUtJ+YVRlGf5SuIDeEpSLVoj6aNGPg=;
 b=Ux9mXciaUBYlAFijVYz6HHu/jcycXBKCohkYnMelwD2BLG8afb9JvED0
 k02nE1lVVataa+9d7FSpQxZD5e+TMucWepVVeG3TcXuqo5a8eYQovjLFM
 Mmt7Ak4mnyPYWmrFLga8f4NA2V/qkbG6I/eQBuTYcElnPaR20YA1gEc+2
 kFKQAlsU4KtAe0ghpa2iJaGhfa+ZV3UmDs6zc3/qpsWYSvrIifU+Cb+W9
 TzJkJvcxwdiq3nLdjKR+JeC7gi4NPHGRJzogHybEETP9Rc5/cPMvjyCuR
 RoLoFr6b/GpGMVuvtktEp7MGdFvVgOJ7tkNdC8jjYTamLNG61wc5mS8jH Q==;
X-CSE-ConnectionGUID: d1jg1KLxQlyfBqo+b8XEOQ==
X-CSE-MsgGUID: xRNQkFFESpSWnOE26L0VEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78946685"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="78946685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:37:08 -0700
X-CSE-ConnectionGUID: vt2R5RTNTXmI9lRWCnLQVQ==
X-CSE-MsgGUID: y3zV03IXSomRvW89zjPbJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="220488014"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:37:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 14:37:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 14:37:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 14:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnxBEYE2LrUhWveLIyr/cBJcYNp7XFTYSGsnfXUEqkxWQTmUBT9z+w/bH8BTgcLT9TsnszIAa3iWdcC3SP9sB60YkuLxUDssvZjbO3zxKI3QN9+J41QyFK8tKLhMEREcf3myeUT5Pckerqfz1ifIlG5XFyhKL0A2EN4cvkTqn4o5SNKdSk5kIrzA+hDLIgUVBwmjmXlyiSUDeRcblRvBFWwmxPDTsWY3+5Bj3a1SwVkURltiTArWd9mRWBvPReKzk9VNyrGZq6+vtTCAaCJjoG+yOikx0lUT1spFqCQI8rOTmXw9PeVjHmp/CapgN6iz+N/vNOQKPPOoyOzNTRVTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUL+JmjyUlsuLBnYk9dlLnUUXMWTlxtJoq6Qs6KffZo=;
 b=cYucGrTvNDfqkG5GIWdDQHORIE1RuZE/sA0tDhhZlaiS47AKAwtN3UzTbT5XFrMVOC5M6Ws2ESZo7zY6Zr6QJV1UznsiCxySgB3BrTQQl3j7lFRj53tn+hnHl8hnzymyok6hh0JcVFZwSmy3MfsI1SJm+7eH3hNnWlYiEBK5EbroWSnm/beHM40KpOTC9BKzkCyqHHvFCnyr7XmMtAZ6YS24KWCogOTTc4OoWA08YOsM76ClxbLbPx3SkPJg73K8MJVS2P/cHamQwtX4V57SSZfMN3BaCqrpPMIXNrWu1Ydk7zFfXzMTNor9PZXzY8SdGmEJ8JNe6gC0bl5/fIEAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 21:36:57 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 21:36:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
Thread-Topic: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
Thread-Index: AQHct+QwYSq4dPRiyEKv3HHvjIGz1LW2WioAgAAA23A=
Date: Thu, 19 Mar 2026 21:36:56 +0000
Message-ID: <CH0PR11MB5444C674AF8A8CD19A915045E54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260319210534.218992-1-stuart.summers@intel.com>
 <874cf179e4c6aed3fb36208064fa9c20a90ba7c6.camel@intel.com>
In-Reply-To: <874cf179e4c6aed3fb36208064fa9c20a90ba7c6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB8288:EE_
x-ms-office365-filtering-correlation-id: d94dde1a-9297-4da4-5bf8-08de85ffa544
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003|7053199007;
x-microsoft-antispam-message-info: G6qEoQFoKn4EGjlcYQmzs1VcweEeQD+D4ti9PZzsMfLRjhxvfHaGfqiqhx0rISm9NywNxLGIrvPLeyIX1IMiIbIXen3Ciu0HUkx7LyZh1X3chNHq42Hb9bE7Zv9I3sIoEcmh2pRxKDsVQ1IpZcpo4m5FQurSUKf//2k8GJf0efxQgoQoNDjiD4ufFja+BZFfKWmzfZMYjzqxosCxm9GM9jol/Aosn1r0A5y6yK+loqUOE6yg0PXc5/o5nArakXlYvobXz7HmPSM3sgd2V7E+o6KNKsmhfjhNuyYPzDlEJVw6osIxz2ioMXGEcqZVVeED3oWpu+Nh/jtWmC2NdzlqC4O5lCB/i70p0lbxV72U+V0ZAmlU4d0o9kvT+L44Plv0hMnImKALWbsSKltOnZVNzrb1ppvvlYJs+ZfYRzikADMVtq5LDHwoEhX+ahaKDU42BSCXmUNPaoijYhK8PTztA8zRMDJBF/96rX8KlX6yYWSsMGyN950lfyzL838Snq29Hbt9EJjp0QQw7Rb+yW7VUqTdEYobFLox+EDD++K5zAw36MzHMUcyq4KxJY6qeP2U8voqnjphIBGnzAZnAD4c5IpxUFrlZdMVbRK1vB9ENZqR0on7TnyU8HuCkm82tMic6mXJRQ+LweUXYUa0WGGN020rkyy2jTwp00aPF/529wCHr+n7jtJzQItL+52JTn2N3eeRIeNp31C11k54qFxljq+oiY+V0rxAXF2DQS6m6dwLQ9TX31j5uJ5F8yuG6M9wyePG1PqV2O3C2ZZFncgby+yKtwbgh3fPALJhnGD+NOA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?G/GA4tAPlWS0ZLeSMU1m4hjI93uaYPw+lmqnCAROLzU9N80iP+1+K1mI01?=
 =?iso-8859-1?Q?L2cpZVW8opMhn4KscoNis4/QngFf8eQvE3rFmwNWFh7vWk/uyIjBL89OXx?=
 =?iso-8859-1?Q?YJYGtD54YNaTsC60Dx6QO5DwSRX4rJ45YEsuYcwsrk2udu9FNh+PevhvXL?=
 =?iso-8859-1?Q?b25OesDXthnCTEvV1rLYCfxBof8u0BuYb0os5gC4ndSYK3XVYft710F5Ox?=
 =?iso-8859-1?Q?RQ3hKytoE5lx1UIG/wqZJT4YtjJ56Mq+T5g2CHonx9s2tlM9hzDqNrAB5w?=
 =?iso-8859-1?Q?1TvKpoI3NsZtDkCsZFNC6n/VS0w3X0v+RnwEGsUlRRcADBTGhvyGejkUm3?=
 =?iso-8859-1?Q?YT7VMHt4/qVq8aGpvgKu/QEEpsz5x8ghPk83DyMLKFTwOcb/E9Q6XO3H4Y?=
 =?iso-8859-1?Q?rc2V6kPiW4+bdGpRsn+UB2j+SPYrvqqwkaySoe3NlPpgkXnvGqHXWAl+bW?=
 =?iso-8859-1?Q?QPJa3OyJ0VnbRfA8fEomeClN9VJm59cOB4G4FKGDkLT5RY6GRx15RqXsOC?=
 =?iso-8859-1?Q?X5dx8Zuci5UWTwseqwytQjZwhu3bAVwF6ChESdaauh09Euuw6il89AZOQl?=
 =?iso-8859-1?Q?yQSjS2XaYO5JzTrYc1+HTCdGKNNFC+uDklxvE81ykNSx34PzO1lyZPzu6i?=
 =?iso-8859-1?Q?ba8Mz2T1QJyEz2Jo2XwBWsGYBF55T771IyKiUZ/Pu+G8qphuoPnGdG2mfZ?=
 =?iso-8859-1?Q?m4vj3sjM7oLu6pBjaK4kGu78OzcSsMwdv+UiCPLnJobZYnuRAxxm6PXqZT?=
 =?iso-8859-1?Q?/YCLRY/a+aDU9+M2L6dRDZeaJVG0T8DANZLB0QPDCjquERfIURd1s80FJv?=
 =?iso-8859-1?Q?iGWlhcpI3Dn9MK0F5dg5i7vB2wJK9KJEEtZzFJDTfZgiyuguZUy+Hs2Zqb?=
 =?iso-8859-1?Q?jeMR+zkfW9y9KFvOrwRRaciQBnnyo8uG1QZTdRPLQYYVit+zOAD2OkOxJT?=
 =?iso-8859-1?Q?fwkd2r01euOLRTac8gTuLG0U91Sx/qmhr1DDD9gyAWOWmEy5fwPVS56jua?=
 =?iso-8859-1?Q?SzvYI2nwZmnMnJYYsU6o8Elt7UKFnhhHOTKuYF6Tfz88r54DLkNVvjv3/S?=
 =?iso-8859-1?Q?V0saWjvBXT+/u5uCjDRt5GoezRYQjca0nVqVZeQW6Ec2XFULH014YIRdCX?=
 =?iso-8859-1?Q?jmUGvDjHNKm9BDfCeZB+J0/gKQ3UW3z88hpnF8Tm+t8N616WPrgsn4yc5r?=
 =?iso-8859-1?Q?qYJWo0T8Hu//Iw/rugpQo1NKycnBYxmeWamGWqSJ5Jq6sKUWlEQcN9vJCY?=
 =?iso-8859-1?Q?DK80sE7/q/l2YfTbbsIZiffdKYPyCAO3jgscyN5U6xgbPZf3CnjRJlImCi?=
 =?iso-8859-1?Q?BAaVcGDZ+pE3kOxGo3MvkhRKip4MWso1f0c6dH+LjiwwEEZOJS5/6augiD?=
 =?iso-8859-1?Q?OjfGA3nmvRr5tnHs0C4qE3IkCG/Yszc3hw7A+7TbqZdXDEI5jNemXK5fSH?=
 =?iso-8859-1?Q?1gsHd5R0VYKgVZkigKS4YgkIdMaTY+R1gVSuGscoiJoTO0ZEiitniYbuPT?=
 =?iso-8859-1?Q?gd7I2hBwXWwWh+2bs2H8ivUjXJSDhOkl2X4Fsl5xcklkjoRIumHA599srB?=
 =?iso-8859-1?Q?maa8wknwtFRTPHqOT8mJ5HUapiQkGfSntUAGgEfA2uEASZKLr4vb1/hKDU?=
 =?iso-8859-1?Q?/IMixlSHHTfuOwvFUYz0xPnMXS8109EhyA2ikNz4W68uZu/rMvwkUhMP9V?=
 =?iso-8859-1?Q?bt2/yanpHH003WpEF1hnUB5AWeuPGlmiLR2YHAAtG751nOsFwkRxV7e4AV?=
 =?iso-8859-1?Q?Dx+DWn94mfFI5aebclywFF7t3TdSBXSKKhdP8GXQowoXPxjfHaPnwTmm64?=
 =?iso-8859-1?Q?7r5rds8f0g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: D17Mou6ZxIWJaWqC4aE2dpkN5ZxhgJHIrBdgdCn4hYeaHugHH2e0Gqgci/HL0MqNVsDD8EQjVRA0qkl8unMACMOQ/u2MMUNehZAE29blULo1CPlA417wDOyEswPTzXZv6YabOOs97WeAMofS92qQXivUjJyDbDzYhKffqo349V3FqHTbsLfzlYN8ZgHDvx0ju/c7fxFgBeQo1/fMOHaTvM0ik0SzrG039c2B0EBfSDCpk0nevcwFeqEQuJg7DR2u2/GE8DnQzvYpyl1J+ncc8+w6obRjRKZc46SJZbUcgqK3fpyZ6WUUVIPDQ18wP3s0bUFpL0ERpSHCfCo3zmiXhg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94dde1a-9297-4da4-5bf8-08de85ffa544
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 21:36:56.7699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00AloRBYGl24fDl1DzGPgjUk3DxJnQtZm3yRD/DBupo2uuZDSagDqMrulqqGIyYcbrX5GAxoEE7M91S6lIUTl/Omjw8iNaKN5PeEJn6OhIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Summer=
s, Stuart
Sent: Thursday, March 19, 2026 2:12 PM
To: Summers, Stuart <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com=
>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
>=20
> On Thu, 2026-03-19 at 21:05 +0000, Stuart Summers wrote:
> > Allow platform-defined TLB invalidation min and max lengths.
> >=20
> > This gives finer granular control to which invalidations we
> > decide to send to GuC. The min size is essentially a round
> > up. The max allows us to switch to a full invalidation.
> >=20
> > The expectation here is that GuC will translate the full
> > invalidation in this instance into a series of per context
> > invalidaitons. These are then issued with no H2G or G2H
> > messages and therefore should be quicker than splitting
> > the invalidations from the KMD in max size chunks and sending
> > separately.
> >=20
> > v2: Add proper defaults for min/max if not set in the device
> > =A0=A0=A0 structures
> >=20
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> > =A0drivers/gpu/drm/xe/xe_device_types.h=A0 |=A0 4 ++++
> > =A0drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 20 +++++++-------------
> > =A0drivers/gpu/drm/xe/xe_pci.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 3 +++
> > =A0drivers/gpu/drm/xe/xe_pci_types.h=A0=A0=A0=A0 |=A0 2 ++
> > =A04 files changed, 16 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 615218d775b1..0c4168fe2ffb 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -137,6 +137,10 @@ struct xe_device {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u8 vm_max_level;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/** @info.va_bits: Maxi=
mum bits of a virtual address
> > */
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u8 va_bits;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/** @info.min_tlb_inval_s=
ize: Minimum size of context
> > based TLB invalidations */
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u64 min_tlb_inval_size;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/** @info.max_tlb_inval_s=
ize: Maximum size of context
> > based TLB invalidations */
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u64 max_tlb_inval_size;
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/*
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Keep all flags below=
 alphabetically sorted
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index eb40528976ca..7512f889a97a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -133,12 +133,12 @@ static int send_page_reclaim(struct xe_guc
> > *guc, u32 seqno,
> > =A0
> > =A0static u64 normalize_invalidation_range(struct xe_gt *gt, u64
> > *start, u64 *end)
> > =A0{
> > +=A0=A0=A0=A0=A0=A0=A0struct xe_device *xe =3D gt_to_xe(gt);
> > =A0=A0=A0=A0=A0=A0=A0=A0u64 orig_start =3D *start;
> > =A0=A0=A0=A0=A0=A0=A0=A0u64 length =3D *end - *start;
> > =A0=A0=A0=A0=A0=A0=A0=A0u64 align;
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0if (length < SZ_4K)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0length =3D SZ_4K;
> > +=A0=A0=A0=A0=A0=A0=A0length =3D max_t(u64, xe->info.min_tlb_inval_size=
, length);
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0align =3D roundup_pow_of_two(length);
> > =A0=A0=A0=A0=A0=A0=A0=A0*start =3D ALIGN_DOWN(*start, align);
> > @@ -163,13 +163,6 @@ static u64 normalize_invalidation_range(struct
> > xe_gt *gt, u64 *start, u64 *end)
> > =A0=A0=A0=A0=A0=A0=A0=A0return length;
> > =A0}
> > =A0
> > -/*
> > - * Ensure that roundup_pow_of_two(length) doesn't overflow.
> > - * Note that roundup_pow_of_two() operates on unsigned long,
> > - * not on u64.
> > - */
> > -#define MAX_RANGE_TLB_INVALIDATION_LENGTH
> > (rounddown_pow_of_two(ULONG_MAX))
> > -
> > =A0static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64
> > start,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0u64 end, u32 id, u32 type,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0struct drm_suballoc *prl_sa)
> > @@ -178,9 +171,12 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> > =A0=A0=A0=A0=A0=A0=A0=A0struct xe_gt *gt =3D guc_to_gt(guc);
> > =A0=A0=A0=A0=A0=A0=A0=A0struct xe_device *xe =3D guc_to_xe(guc);
> > =A0=A0=A0=A0=A0=A0=A0=A0u32 action[MAX_TLB_INVALIDATION_LEN];
> > -=A0=A0=A0=A0=A0=A0=A0u64 length =3D end - start;
> > +=A0=A0=A0=A0=A0=A0=A0u64 normalize_len;
> > =A0=A0=A0=A0=A0=A0=A0=A0int len =3D 0, err;
> > =A0
> > +=A0=A0=A0=A0=A0=A0=A0normalize_len =3D normalize_invalidation_range(gt=
, &start,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 &end);
> > +
> > =A0=A0=A0=A0=A0=A0=A0=A0xe_gt_assert(gt, (type =3D=3D XE_GUC_TLB_INVAL_=
PAGE_SELECTIVE &&
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 !xe->info.has_ctx_tlb_inval) ||
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (type =3D=
=3D XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX &&
> > @@ -189,11 +185,9 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> > =A0=A0=A0=A0=A0=A0=A0=A0action[len++] =3D XE_GUC_ACTION_TLB_INVALIDATIO=
N;
> > =A0=A0=A0=A0=A0=A0=A0=A0action[len++] =3D !prl_sa ? seqno :
> > TLB_INVALIDATION_SEQNO_INVALID;
> > =A0=A0=A0=A0=A0=A0=A0=A0if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 length > MAX_RANGE_TLB_INVALIDATION_LEN=
GTH) {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 normalize_len > xe->info.max_tlb_inval_=
size) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0action[len++] =3D MAKE_=
INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> > =A0=A0=A0=A0=A0=A0=A0=A0} else {
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u64 normalize_len =3D nor=
malize_invalidation_range(gt,
> > &start,
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
> > &end);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bool need_flush =3D !pr=
l_sa &&
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0seqno !=3D TLB_INVALIDATION_SEQNO_INVALID;
> > =A0
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > b/drivers/gpu/drm/xe/xe_pci.c
> > index 189e2a1c29f9..5e02f9ab625b 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -743,6 +743,9 @@ static int xe_info_init_early(struct xe_device
> > *xe,
> > =A0=A0=A0=A0=A0=A0=A0=A0xe->info.vm_max_level =3D desc->vm_max_level;
> > =A0=A0=A0=A0=A0=A0=A0=A0xe->info.vram_flags =3D desc->vram_flags;
> > =A0
> > +=A0=A0=A0=A0=A0=A0=A0xe->info.min_tlb_inval_size =3D desc->min_tlb_inv=
al_size ?:
> > SZ_4K;
> > +=A0=A0=A0=A0=A0=A0=A0xe->info.max_tlb_inval_size =3D desc->max_tlb_inv=
al_size ?:
> > SZ_1G;
>=20
> Basically I decided to get rid of the pathological case for now. I
> figured 1G is a good happy medium for larger VMAs. Let me know if you
> have any concerns there though.

I was going to comment on this once I saw it, but you already considered
this issue.  But yeah, SZ_1G seems to be only about 1/2 (or maybe 1/4
depending on how rounddown_pow_of_two operates on ULONG_MAX)
the size of the original MAX_RANGE_TLB_INVALIDATION_LENGTH value,
so I'd say it's probably fine.

This patch doesn't have any other major mechanical differences compared
to before its application, though there are some minor concerns regarding
normalize_invalidation_range:

1. There's an xe_gt_assert(gt, length >=3D SZ_4K); that was left unchanged =
in
this patch.  We might want to target xe->info.min_tlb_inval_size instead?
2. Using normalize_invalidation_range immediately in send_tlb_inval_ppgtt
instead of initially operating on 'end - start' like before might result in=
 more full
invalidation cases compared to before, as the function seems to return a va=
lue
that is more often than not larger than the raw 'end - start' value.

As long as you find these tradeoffs acceptable, I don't see any reason to b=
lock
on these concerns.  Regardless of if you make changes based on these notes =
or not:

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Thanks,
> Stuart
>=20
> > +
> > =A0=A0=A0=A0=A0=A0=A0=A0xe->info.is_dgfx =3D desc->is_dgfx;
> > =A0=A0=A0=A0=A0=A0=A0=A0xe->info.has_cached_pt =3D desc->has_cached_pt;
> > =A0=A0=A0=A0=A0=A0=A0=A0xe->info.has_fan_control =3D desc->has_fan_cont=
rol;
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> > b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 8eee4fb1c57c..cd9d3ad96fe0 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -34,6 +34,8 @@ struct xe_device_desc {
> > =A0=A0=A0=A0=A0=A0=A0=A0u8 va_bits;
> > =A0=A0=A0=A0=A0=A0=A0=A0u8 vm_max_level;
> > =A0=A0=A0=A0=A0=A0=A0=A0u8 vram_flags;
> > +=A0=A0=A0=A0=A0=A0=A0u64 min_tlb_inval_size;
> > +=A0=A0=A0=A0=A0=A0=A0u64 max_tlb_inval_size;
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0u8 require_force_probe:1;
> > =A0=A0=A0=A0=A0=A0=A0=A0u8 is_dgfx:1;
>=20
>=20
