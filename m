Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69378C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 14:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239A910E3B6;
	Thu, 12 Jun 2025 14:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBW3K4h6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02A810E3B6
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749738784; x=1781274784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qWtgYK2Jwmz8CW/3Ip/YmQ7HOt6RP/v6nn3pnikssfc=;
 b=lBW3K4h64rWy4/rzfvQrRwCqEy9mXjR93qPhG7YdW1E90txE89K+ra4P
 rG45mQ08GsjgFkyVwYA8n65/YJ+GTaYwOx4O7OXtUoPIQ7h8lGdeMjZ8g
 8qRhQY1/Cwg/+5DJntnUC6lYGsQlVCxNU6AVdM+Yg8f44NoSIhNVEYbg7
 hYUK33chn/t28kQyfQMSqalht6zLAHmpTaLUaZgk52OADsiTHAuKbjRoF
 uJwKJYirht9Ie/HE3xF91OvGme7wXAf3IM78qD6LSTuS7fYPvYVKJMrsA
 nBtad8XcCY4g4omOXrvlCK40YU89QuluNog4xB5yNlLuaugPo2q+kWRvI A==;
X-CSE-ConnectionGUID: 5QZrwu0ySpyuhBvDy1HfNw==
X-CSE-MsgGUID: WV/mmwqCTxeI3nOO++D7Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39534965"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="39534965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 07:33:04 -0700
X-CSE-ConnectionGUID: 4L017G/OQqCef/Nkh3X9hg==
X-CSE-MsgGUID: lDPzY3zpRmi2i46Cbx0WuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="148028573"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 07:33:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 07:33:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 07:33:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 07:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQ6f6IBYqwrlsMWfH+e00lMIizifVsrFnzep9LYiFDK4JG/XJlsBxuWWRGBDLxcS0t/IYD3WVqYZZGB0X1TV7v9L65hAU9V1ylPav8GfttSU0uC4d0EZzgwAm1st6ha/7/O7MEt4W15Dy1+89i5OAkFusFUeSK47BOvm+Do7+GYPhnU80I6UhQxIx0bAslzagIHMntdJNzI5p5kR+qQZH3cZdrB8cN8VyLwGc+vUheydGeXq6iIw+RTkC3O8ViserYzaZVwyFY+dwf8nehWggt1NazmKJhyOyIMgSh6gcOmVQu9S72EtFtIP6Q65fhR2gk10nWKaSaPfFUcXLvotwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcDC0iEw/xnWeowpFF6girusZO9m1GYKe7KYsN/SX+U=;
 b=IB0KeRAqpNYt0PBBoSpw5cE6v+UMvQvgHsgc58y9hC8ebpChoypHD0FGjZpCGqZibGPVWoZ8N+P3wdv/NIJ1U/gBNH9dhUO97voIsY6SVv7wlEKkxLBk046gKs4NRaiANM26AVxflXnHSiRP6R9Dmmrb2he1/+FOxoEORjEoqBSBMqq1gMIj+dLhpmbTTzSu2f16s7GGO0AAoBpB6KRUKsbPiZTGDkA0NtTeS6IDKQAxjMEWnPDQsVIOZJp8owLQcHaCmIgD0Gr2YIaBIdDUInGj1VhG7lXcke4CczaaZclal/rUmSy74W5qtcmXwvOq5b04IbVWvsFlE7khcf5GtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH3PPFD9B78DE02.namprd11.prod.outlook.com (2603:10b6:518:1::d53)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 14:32:44 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 14:32:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Topic: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Index: AQHb2xS1G6L4Gnmrj06JQMCG4b4JFrP+fC9wgAAmsgCAAPFNQA==
Date: Thu, 12 Jun 2025 14:32:44 +0000
Message-ID: <CH0PR11MB544461EFF28E40A16C84A175E574A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <CH0PR11MB5444BB01251782688FECD0E6E575A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <a47f94c7-7677-4945-ba4e-cba894428472@intel.com>
In-Reply-To: <a47f94c7-7677-4945-ba4e-cba894428472@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH3PPFD9B78DE02:EE_
x-ms-office365-filtering-correlation-id: e283a1c7-bdb6-4ff4-684f-08dda9bdfee2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?v5S4mUwdnJi/wPfDEDiR7iY4vA9SRoWtzvym8PjILjaqwGteVHvJPZYdVr8s?=
 =?us-ascii?Q?cm0A2iwebu2QyMVzdmQ3wqssbi8H0RO4htLRm/FYYiMlGRGjoTxrN8vMKQ5a?=
 =?us-ascii?Q?Z3jbQpwsksSsYqXEQocgplWyNNgySr/AdN3QRDiUshMgN8CVdtzYB7qu5knb?=
 =?us-ascii?Q?nSi0LU3j+r/AtZ9aXqgeOX76+BhY4ZHm4edYJuF9limjvDcXELlL3QD8Reed?=
 =?us-ascii?Q?wus5HpG5hEnpSDLlk/TdYvDDoP7piupWRhLEXFtglBpJVh5Xps7JOzQzFBDn?=
 =?us-ascii?Q?nvUQyS/jFtDpIHw8eF/uL/D3ZkRe45lyKLuaKVSxXqYzrb8rLyBuLm1DZx2J?=
 =?us-ascii?Q?f0rNHQseH9dqQcjTRuamAheCO8T1PGdxNpws1u380J5tuu5m6KjqGoq5Syqt?=
 =?us-ascii?Q?rbjMVSW5aoNxWg3p6aaMG4NB1uZYllkPQDv9EnHmF5WJAiSosyrUl1QqFcL8?=
 =?us-ascii?Q?dfjlKZI9s1SFJGsVjILgfWnIbLMgZxKHKUwuGCDgV0BcStW3O3kbf4h4zM/h?=
 =?us-ascii?Q?Qw6v/wHwCezQKrOgGFa6p9JbqNtiMQMPyFUSiJGKq+dsXuWTrZv+UUcnyCe6?=
 =?us-ascii?Q?jj2yQCQMzSA0guJuFVBcttj2DY8nWIlqSAgX3XroU6fhZQ8PWOneUBwdhief?=
 =?us-ascii?Q?wlPi8mvMdltr7IvsOB0W70e1EhwM6tZTeFMJlWBLUVFgAc6ALW5wvrTntVaX?=
 =?us-ascii?Q?1h0dZrzKVm9o1Kp3p5JORqyfGpPu+u9GcjlY0cX8Fm525CL5IlrFsyf5rHfp?=
 =?us-ascii?Q?PY44LqEBUwOT1c5OU9iqvJIz7/qxVueS10p4Td23p6k9JgnZ5oz5iu1HIKyh?=
 =?us-ascii?Q?TDqcTAV93g161xLnsVaohmDMZTuCQLWNjVNc3VNCkGFZfKEN7KZpeCmpS+kI?=
 =?us-ascii?Q?49JrrQHejvWglpMAb4Z7NWEpBcQJ4B1LoEdXaE8jdHkRQB0ygtCHDBaYS6W+?=
 =?us-ascii?Q?VBoYk/JD2zZhQIQ2HIaeNXlsjaZt3ewdyUtvITOsWhNps9ePFigOVj9JbFjT?=
 =?us-ascii?Q?D2mPR3oUyv6Os73bnsUU+rya2hHz4Uvhd3kYUlV10kGAieuWrYXBZcpC3eBE?=
 =?us-ascii?Q?/ZWgOKJ4E/xLgyo3KkXWuvduXUuCbk6rGaqzWuW93cHjvApKS5FtYr4gGwPe?=
 =?us-ascii?Q?zZFO7z5HqtRuN9fJbaaITHJwCbzDBziQcNtKQ8jeUUuhqM76fOR6DE76gBkO?=
 =?us-ascii?Q?VrFYgNiThsbfpDDE8iZnsMiAA6BjUqksbok4vJh7Wf8zxMS4VXPNVlU+WNop?=
 =?us-ascii?Q?PUstFBvlXF9SDxGgwYr3B+zCqcHmrJbwj9exh/i0N2UnwCThJmMPYi5SjwRH?=
 =?us-ascii?Q?YBM9zFvV6EIZtPupexlrFHX5DPk8XYEC1+zVwVorjbI/AunMhMh06QMe15Hy?=
 =?us-ascii?Q?3ul/7WiMeiPnbuhaPFZLAZk5D4Y2A001d09KUtjeq0b86LiVGpCLSTwWikfY?=
 =?us-ascii?Q?gvXojhkqowcYMVMwiJp8PLw0uKlKGxL5WnX/p2/eb033TohH/tHRHKvqLvkv?=
 =?us-ascii?Q?SfCKHsYem3Qy0bQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UgK+FrFBm5+fbKVGlLX5IVPU78ma2RzH19Yr8YspxCM/IotiNt/CMj/xibfh?=
 =?us-ascii?Q?t3DeUU2ka777ZIfwiufR7PZSFISR3dpmMt5jmPk43TnicPLb19FqMPm9gN7P?=
 =?us-ascii?Q?2tnZF0GuU+l8FIO4QusZTyVUezSHnMfMBu4PAJ1a17pJQOK0bL0uyJvucVP6?=
 =?us-ascii?Q?a5QVzn+aTxbt7RNEwQzAHHvAjUwug1Aa7pEBPeBmHQt7utUZqBsB3ugZ8zU7?=
 =?us-ascii?Q?nDUBUqv/QkE7L6jeFX2C5r6ikPphSPJR1z29PxaRhGl8ybahG8prx4MFfuho?=
 =?us-ascii?Q?PPC2D4Fh2wkRQcsgFK2o2a2v5L78EqJgyNLL+9pbrpkzzQn3NQhPEt3NcUCh?=
 =?us-ascii?Q?zHpYTTKqfsO9OfptJL/Xp7hctpBIoQhIE/hT2x+YWlUWU46hM0PGtE9c3ymL?=
 =?us-ascii?Q?TQW5HhglisKWsTkzbPzhaeaLpxq/UUY41HeBJ4M2jikxO2br3N9XhIddooD1?=
 =?us-ascii?Q?eGn3NqpcYBVrahzxl4rfSXsK2UcOktx4XWtwX78MNpTDFUIoBRd4kdEyW6qq?=
 =?us-ascii?Q?T/Ksy5UkFbCXkvhfvg0NPZ4WKMGG0UcPKmYs1OaXJpLsiHMyO8HD71pj8lNi?=
 =?us-ascii?Q?R3OrtKKpdqoj253L04wTIJk/m1Ldx+zPPqiUYBags4vBbHYQjK82agDNvsVe?=
 =?us-ascii?Q?0BnIoz+BdoI7y5D+hvHovIws6XX52jERKYqJm5TcFVKo7jD2sjoeXlEEU4yN?=
 =?us-ascii?Q?toWyeMRd1tQjDXGXZyoAFhE5LFKT6z+5a2l+yZvqrVVVEE/rI8w6hkXY4J8B?=
 =?us-ascii?Q?+2AxU6c7vZ6zZbZARMB/L3tKh+RvNTdp1DEP2Bht1jHUx0cd4swlpLl5+PPZ?=
 =?us-ascii?Q?85kpA49d9OnqcohPSPlt32SS+3+kXbwmPvGxvnDbio0Vhgw0/ZcC4+SddQXO?=
 =?us-ascii?Q?9iW1Y4EPo0CR6V6aLjyqWC/4I9VT65psqMoRGYQoh7t6t2uYinHr+A99fd9Z?=
 =?us-ascii?Q?hLNjzn8aYT2spx8MoSXsgXTJ/0Gzwm8nyvXUT6ovotILTLgV0hBzXToVmBbO?=
 =?us-ascii?Q?X7PpbckK+HXknZfTGZGSxk7bA+DOZ84LycCzxvxeHga/gonyPj8qwn9z4tXX?=
 =?us-ascii?Q?rLF6TDqgyzC3E4sg/0yFI7tvMKa6fvJPtIAY0sgil+hjFjILVOpIBiELhgQ+?=
 =?us-ascii?Q?va7rffChrcUDrBCcByhtyF+mFlHLCsMbQ25wTlVDHPiahNt8f9wXWzJePJ7p?=
 =?us-ascii?Q?SSbYShr3vfSGb0hhI6xkrzkVy7363tI7pTkf8B37QRVk8OwB1veHqL7voB/+?=
 =?us-ascii?Q?gTpaYsoZdY2HXBt0SY0mPqxJUjAYxjLBZkThnv5P0hy2RdBC2acmTHemsvd4?=
 =?us-ascii?Q?BjETZJ7omkd5aTjv/BHh13zrzA+QWyY9G5J/Bqt+s6gDgTnOrJLwzLEOeiuO?=
 =?us-ascii?Q?pk1g0qlAour9/D2wiZi6fxclaNBCLSvr/o7t+y5oBEa4bVi+tK54jEg1+eA/?=
 =?us-ascii?Q?p1g4M5EEr0suPrp5Ha8Oa0aNbsvUSZoMxMqTudkZg9kQiJDszk3E3vyBmFLa?=
 =?us-ascii?Q?Uk5fjI3XVhwDNIxJdLkECNC/X+II6QARv4c2NJ3ZpRM768/uAtxF/IIIyNrG?=
 =?us-ascii?Q?wWOBvgFxt898OH7pNr9TLdiZ04Csftsf8iAK1hQIvf5w+NIxV/V550Yy9BqG?=
 =?us-ascii?Q?uA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e283a1c7-bdb6-4ff4-684f-08dda9bdfee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 14:32:44.6599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xr6+ZVHQpj7kilbBWh9d04L0CHeYIoUKngh2Be0s7Gr6x6iuO2tdI8k2cOE1ImuR2v/lZv/OCgfAw2VksR2TIRwAvEW7mZhV5RFkd8ddBlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9B78DE02
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
From: Harrison, John C <john.c.harrison@intel.com>=20
Sent: Wednesday, June 11, 2025 4:57 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Intel-Xe@Lists.FreeDeskto=
p.Org
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log targe=
t
>=20
> On 6/11/2025 3:04 PM, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jo=
hn.C.Harrison@Intel.com
> > Sent: Wednesday, June 11, 2025 2:06 PM
> > To: Intel-Xe@Lists.FreeDesktop.Org
> > Cc: Harrison, John C <john.c.harrison@intel.com>
> > Subject: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log targe=
t
> >> From: John Harrison <John.C.Harrison@Intel.com>
> >>
> >> The GuC has an option to write log data via NPK. This is basically a
> >> magic IO address that GuC writes arbitrary data to and which can be
> >> logged by a suitable hardware logger. This can allow retrieval of the
> >> GuC log in hardware debug environments even when the system as a whole
> >> dies horribly.
> >>
> >> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > So, this is basically a new modparam value that redirects GuC logs to
> > a specific IO address?  I take it guc_log_target =3D 2 is the default v=
alue, and
> > guc_log_target =3D 1 would print the logs to stdout, then?  I'd ask why=
 we
> > use 0 as a default value and not just default to 2 all the time, but I =
think I
> > already know why (we need to guard against guc_log_target =3D 0 anyways
> > to prevent printing to stdin).
> Um, read the patch - "(0=3Dmemory [default], 1 =3D NPK, 2 =3D memory + NP=
K)".=20
> The default is zero. And no, nothing prints to stdout. This is about=20
> hardware level debugging. It has nothing to do with stdin/stdout/stderr.=
=20
> Those concepts do not exist in hardware nor in the KMD. If you send the=20
> GuC log to the NPK target then you need a hardware debugger (JTAG, etc.)=
=20
> to read it, as described in the commit message.

Ah, okay.  When I read "This is basically a magic IO address that GuC write=
s
arbitrary data to", I thought that was indicating that we're writing to the
in/out/err IO addresses, and that the data being logged "by a suitable
hardware logger" was occurring separately.  I guess I also thought NPK
was a writing protocol and not a hardware address.

It didn't occur to me that we'd need to directly write the logs to the
hardware logger in cases of catastrophic failure because we already have
methods of streaming the logs directly via the serial ports.  Though I
suppose that we're talking about different "logs" at this point?

The reviewed-by still stands.
-Jonathan Cavitt

>=20
> >
> > I also take it this is modified on boot by, for example, writing
> > "xe.guc_log_target=3D1" to CMDLINE_LINUX_DEFAULT as a part of the grub =
file.
> That is generally how module parameters work. You can also set via=20
> modprobe.conf files as long as the Xe driver is a module and not=20
> compiled in.
>=20
> John.
>=20
> >
> > Yeah, seems good.
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> >
> >> ---
> >>   drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
> >>   drivers/gpu/drm/xe/xe_module.c | 4 ++++
> >>   drivers/gpu/drm/xe/xe_module.h | 1 +
> >>   3 files changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >> index e16d19b44bcc..9c0e3113f7d5 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >> @@ -35,6 +35,7 @@
> >>   #include "xe_guc_submit.h"
> >>   #include "xe_memirq.h"
> >>   #include "xe_mmio.h"
> >> +#include "xe_module.h"
> >>   #include "xe_platform_types.h"
> >>   #include "xe_sriov.h"
> >>   #include "xe_uc.h"
> >> @@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
> >>   	else
> >>   		flags |=3D FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSIT=
Y(level));
> >>  =20
> >> +	if (xe_modparam.guc_log_target)
> >> +		flags |=3D FIELD_PREP(GUC_LOG_DESTINATION, xe_modparam.guc_log_targ=
et);
> >> +
> >>   	return flags;
> >>   }
> >>  =20
> >> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_mo=
dule.c
> >> index 1c4dfafbcd0b..fc8c681819b9 100644
> >> --- a/drivers/gpu/drm/xe/xe_module.c
> >> +++ b/drivers/gpu/drm/xe/xe_module.c
> >> @@ -21,6 +21,7 @@
> >>   struct xe_modparam xe_modparam =3D {
> >>   	.probe_display =3D true,
> >>   	.guc_log_level =3D 3,
> >> +	.guc_log_target =3D 0,
> >>   	.force_probe =3D CONFIG_DRM_XE_FORCE_PROBE,
> >>   #ifdef CONFIG_PCI_IOV
> >>   	.max_vfs =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> >> @@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar si=
ze (in MiB) - <0=3Ddisable-res
> >>   module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 06=
00);
> >>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=3Ddis=
able, 1..5=3Denable with verbosity min..max)");
> >>  =20
> >> +module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0=
600);
> >> +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=3Dme=
mory [default], 1 =3D NPK, 2 =3D memory + NPK)");
> >> +
> >>   module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmwar=
e_path, charp, 0400);
> >>   MODULE_PARM_DESC(guc_firmware_path,
> >>   		 "GuC firmware path to use instead of the default one");
> >> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_mo=
dule.h
> >> index 5a3bfea8b7b4..4d978f6f26b6 100644
> >> --- a/drivers/gpu/drm/xe/xe_module.h
> >> +++ b/drivers/gpu/drm/xe/xe_module.h
> >> @@ -14,6 +14,7 @@ struct xe_modparam {
> >>   	bool probe_display;
> >>   	u32 force_vram_bar_size;
> >>   	int guc_log_level;
> >> +	int guc_log_target;
> >>   	char *guc_firmware_path;
> >>   	char *huc_firmware_path;
> >>   	char *gsc_firmware_path;
> >> --=20
> >> 2.49.0
> >>
> >>
>=20
>=20
