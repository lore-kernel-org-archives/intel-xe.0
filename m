Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1415CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 22:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C60210E858;
	Wed, 22 Oct 2025 22:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbClP3KY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD5B10E858
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 22:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761170951; x=1792706951;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mYLTydZbiudlKU/udjpe3AyvTWamc4fOfhjgIpE5BrA=;
 b=nbClP3KYyy6y/hq/dNQcMK51hmUcf6KWvyfhwXm6ITVUYQbnwjuetr7W
 d1E+4JT2UazcEGPiNtZ7uYyqBlB5b5mTo9Q18NLKVZ4AcM7KfpgNRrN0S
 gcZfJmqM8HD4SLkNt6JwjwPF/XY1njdE+9LgumK5rmZ2DwBMk1VFy3rnx
 9ic1oVXr+FLvSWz5JP2YW0gm+nKLE/bMvz65pM5RCL5xzrfaZ9eN91RIk
 YsPhRo93n37Cq1fwSizBnKzppHGN0XT1LbTS/6+aaW4YllkKvb8JqQiCI
 GNQMR7YVuxCRCnI/Ljj9yG4QpTn6S/LbRbn7IhBJzVUpSbXPLYMaMYD1N w==;
X-CSE-ConnectionGUID: YS+egnlDR9a83X81H9GIhA==
X-CSE-MsgGUID: RmDmaCZfQ7aDbdL9+FFdng==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65947738"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208,223";a="65947738"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:09:10 -0700
X-CSE-ConnectionGUID: QWcKWQnjTh24qgvoAShj+A==
X-CSE-MsgGUID: u8z4KxJhSSqOFo5Vknu4ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
 d="scan'208,223";a="183882522"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:09:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:09:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 15:09:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNXefK3SmLTDzt7CR42/RBbGsyAvuL6LC/xonjcXCit3c9zce+I2/FAtjAo8IcuXRrNpsCZIaQuNpqh2eZ5xWRFw9efIrGqYhe3STDOmDUJ7DD8gyCCxCVRudUG//zi3sLDgxEfU1ZHNiWMz7UR6loy6GX2Y0FZv/YRKFvI226MWezxyI+NTqJFdBI80BFcBf+nREZm4Xjy9smwSLSRFsokjEFmQxjHwLc6YC+XGdAX6qGDpf1bytQHxrzFmTJWiK184LYwz6zMZlUFEeRrXcfEPgSISxgiGpYz2WHJ1Jj6mwJ1S1XwvyOLgnY6OK7wv1iagFHtCuLkmgsqgIV5yYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yD9H6+owgNR/CjBjsA+6QBtIiYc7m+igF0kDSD0U8a8=;
 b=gpqBH1J5LcR53yF2z+avLTTYjeUieTyqTkal1eZdkemJyelRyibjpCVzPbtTBJE1KpgyTxKnFRyPsGT6UVW7TL4FsilwG0Qh0YBi98de1AnlVp4cig46n7kFAodclhf0nDTGP1e4HqaqnYjIJPzBmiim8kk7wajbCtKf+mUd9yZ4frz14KCNTNu8s55HYanA5w5OQPjAGn5FsWIznGv/ArfjgcACVoMRv2/In7sTPYDebarZY46/7G+CVPzIi4LcFz+Do2G83qda7W5gJB55Zu1tO0+wB1CKVfTqfmlZptvCOCj9vnKxsJYCRXTdU5CwVxTTt3JszCJboyMvQwnkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 22:09:02 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 22:09:02 +0000
From: "Wang, X" <x.wang@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe: Dump PAT entries with reserved mark
Thread-Topic: [PATCH] drm/xe: Dump PAT entries with reserved mark
Thread-Index: AQHcQ56Vsr5ODpI19EqkrOXyRFxaW7TOuKXQ
Date: Wed, 22 Oct 2025 22:09:01 +0000
Message-ID: <SA3PR11MB804663C2A664A60E8713D7AC86F3A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251022215504.5559-1-x.wang@intel.com>
In-Reply-To: <20251022215504.5559-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|BN9PR11MB5244:EE_
x-ms-office365-filtering-correlation-id: eac0ad8b-df18-4dfb-cf93-08de11b79b9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?H+NFgzGDDvLyTvJ92Swu00/9ygjeWDuQlKH31Ee65RJGQxXC8dcpi6j3Ohlq?=
 =?us-ascii?Q?p5d+kQaFjeLLKNaKRqVebsaBKwRaUepsWT188Wc0nDVf1MStM0ami24YMvTQ?=
 =?us-ascii?Q?nLi1C2AQb+Eg1FquwtO8Qgj81+jK0vZyrvSo+kR6WBNxFgfyVANw6J2qnaxC?=
 =?us-ascii?Q?tut3BGEwVPpjXkcPrNqREi3KKfSHPXDKr5CqGlQgqkjFdytGOSIbHxeBRZ5E?=
 =?us-ascii?Q?hn2YivQRPch9aDC3ZWOlpOZ2GycGqJabcsBj37VF9VsNxHgWjJIGJbcWXX36?=
 =?us-ascii?Q?C/q8Xrh7BC99g6WfCYLcs5O8LQ/ZqK2/FPmETdu54PF6jKMNRJOHQSMEk5EF?=
 =?us-ascii?Q?TQ8Qav0eCwWnvK/8BgF1SuDvZcGaDnzEVLZef3WwWMcdegYSFMLK4xeiFPzC?=
 =?us-ascii?Q?qlXl+2b/jywhpEZu+o0PfXf0TK65MeVXmxerCgRcfRDCFs8La0VEP7x2i7YM?=
 =?us-ascii?Q?qhdknNkRgM3dmR4htHYc3seZIf1iTU8Dk6sY4vSggEpqj+IqKlG+bseQMu/f?=
 =?us-ascii?Q?RkPXxeXJiEuzZZyZkJYsTlK0swu0AwKvvPfDJndjYjf2f2WCo+9cUlsnlewS?=
 =?us-ascii?Q?P43xiMFqFn8lU00Bih3hSuu3w/Ovr/QnkY8t3op69VTRI/RtC1USyE5UebKf?=
 =?us-ascii?Q?9hEo/BnvzDqkobM83YPMB7WZeW350PLdviRUfEkDy0tlepRPPQJppHIdjyoW?=
 =?us-ascii?Q?OIRy3u0EaR3PWkHypatrYqLw0dtReldVE4FtHPfL2n9YKuufaEv+S2P6XnT8?=
 =?us-ascii?Q?MdJ3pm4LMR5jD2T2VwRjzqQrhTwuWxNw9ssyeWAH/4rlGRWKQ/J7KlBVkRaX?=
 =?us-ascii?Q?dcBc8NtSXHzjd0gLMcmvRe1X+zP2M4gD9D8sSfP7GQ814d0kcdtmCWEaQcgk?=
 =?us-ascii?Q?IEi6DFJngesZIXveFUQLNoR+bF0dIR7/iUQjNzmHT7VnSYJUFZLYkdlSisYO?=
 =?us-ascii?Q?qmVvGoHSKHAQWOOLLG2aUD4U3e2ZNUYdWSChg2PRd3MNM3RGut2HdianXRT4?=
 =?us-ascii?Q?9wm0/ZKV4OjDzfKipa5hzVNYvRvI5Kk0Gf8FHCydZN3xeUcA8XIH+5CHwY0f?=
 =?us-ascii?Q?gzl+MHhf2chYvX8RqNM07n46PH6RstwkpjWz+YOpjwqTlDvxVp++rORNZn4f?=
 =?us-ascii?Q?NnEfd2s3OpolnmIhx8Nkgav/BQe6C7uxcraleGbsmAYWhKI/sDGu1S4PYzoe?=
 =?us-ascii?Q?D3RPEa13JPLWEZDiPhkcVEtrC4LqyOrnKOWU0K+Y2ykvdXvAJKfjPX9J0RlY?=
 =?us-ascii?Q?79g1i17CiM4ilv0q2AG6mB/+SzBZvZrYv7F2/KVEfASjICh9ksnr2A4bDOqN?=
 =?us-ascii?Q?xMBIFAnmqQsTIiddo80dY0mnGd6isvQ9nMaqMJqwvX4oeJhe1zFmAoEf/WwO?=
 =?us-ascii?Q?TlOiFir8gICSR84WnOAYaBulbiJ6OHQGV03SdjAOvg/gVPC7KnOPRBSlCVpz?=
 =?us-ascii?Q?9tffOdrLTafiQfXS3v9M/24O8wNdrcrzw6WieT0CwKiLK91L6rZxarsPKZkr?=
 =?us-ascii?Q?ntAUmy7gILHL7aYII3wykRfvlPc6RrQqxgD1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jMtlfw8+RW8VFFN6ZdpGDvr3dzUFlYtM49H5nqicJLu/RCtyz511mjGt0fiZ?=
 =?us-ascii?Q?yZRFgurz5TDfMkg+rFD8k4b+NcdXNlFSZCv4nwYbBrRpt5uLfTgrB1sWIGIO?=
 =?us-ascii?Q?ijJq/f0gx89QV8pYDFqU1lZZ5xTP3VFWg5dUGpt23uSXQamt25+AVbpsnlGR?=
 =?us-ascii?Q?t1EFmw0ap89DFN9swUvGS1tRz8/IGBz4yONokw2RHHW4kkOqiw66ZJvLaDrY?=
 =?us-ascii?Q?xaWfZuVw6L8TmmjZgZVLCXLXE9OvspiyqSgMJ8Id0BNG2HvP3Am3I3r1L600?=
 =?us-ascii?Q?EhitdklYYqgJp0P3Mf1+7AYgE8wq6SVC0GSWtfYjIiJzPPJShQOG79vg9AdA?=
 =?us-ascii?Q?aCRLwNhkYBLw5PzaD/7hrmM9IoEpijBYRxyQOPKiYSrKse76bXFXj6edqs85?=
 =?us-ascii?Q?hcBQXJY0O/R95HWqQwP6mCagEZ0AMXVpNZu82bKeQveZaOQLmc/g3b88tdYM?=
 =?us-ascii?Q?X1jtEbva9Scl69xzxm6bSfL8Xelxl6BbMLHnYIle4LvtZzd09mbrgLqhHGJb?=
 =?us-ascii?Q?2kE//3K36m/b8Ugewb0H7udk0SOYP8EFs7SK5QwR+bPhvysOG81V0TNx0bzI?=
 =?us-ascii?Q?EyvIUO/BL/F0mbJmV2oVbZcdeT5We0BpAIE0oDPkbSdBB/YhCVnizNeoUpV4?=
 =?us-ascii?Q?ZRYqpLNV2kqY5+gGeEnSP44SlnY2HBc3ZuHTWKoVs2YK1dH2AWWb6hfRQzU8?=
 =?us-ascii?Q?fJh6I40lJgVhEPe1J+M+FmaTZr69kIfN2iuqkENmD5alRfzcYoQmdQIMGKFw?=
 =?us-ascii?Q?TkItSRg4EcJlruPKRMhqMIBFok2TPN/GRC4uIZfTaJnFyRHlj7KbFFyLpB65?=
 =?us-ascii?Q?KqW8dWT/FfmBAcOma/nduRSFRT9WrdJJkzRdlX3mijsxvAP74Bxf67HZZ3Ch?=
 =?us-ascii?Q?HtIqATU3PJxyk8NRIYEuc9B+7LurErp3FcbdIF3gp3ICj7f2CP1jm5xN7aVa?=
 =?us-ascii?Q?kvo/ckqGpir/fvxGcHdNkt76wX1EEF95pGoZIZyIjrzOpe+Qk7hiqMZJG9Zk?=
 =?us-ascii?Q?iOKG7OIAEaSFKkPPDcBBJV7jlJqLvXRtAhHvcN0l4rEWKdW4rzj5pLjy8HHi?=
 =?us-ascii?Q?SLnCfM8wujDYZtRFS3+cM3K9ikIAWY+ohgD5oVwUQ24ObbgUkj01+bbAxMNR?=
 =?us-ascii?Q?l+6Oqt7YSjQrRxrNTG82ij4yH8GFh48yxHeVloswhDqO3ny++o612DrMkzju?=
 =?us-ascii?Q?bQKFUJsTOFChUgp1eZkXPWVEszkqagK/K/VnLeIroze6Sf+sSdV2kn1m1dSd?=
 =?us-ascii?Q?yxndHfcn/7HnqHmHHB7H96+8NZLV0RyGf/3jinSGcEmnzBMnTHWnM6Yr9Cbw?=
 =?us-ascii?Q?Dl8Ut5WDIVzNl2Ywu5RYyrgUF/Lk4hi1mR5JIThN3FI/RT7/Fry4pMC1A41R?=
 =?us-ascii?Q?N923cg//bZ6Z5QN+ELwpCOJJQIKnIloXW8O28BpduxkZHYmq5Z768xR9OG/T?=
 =?us-ascii?Q?MKXFw4THmGGAtFimNUB5Ty8zl1DR0utgh4fyalTR07cPwLGDD/FWOhi+g066?=
 =?us-ascii?Q?qssDtruytWA+Q8q1uYKCM7J3z8qa1tQkfA+VALXWso5f+7zYSmygQu7bfQM7?=
 =?us-ascii?Q?uXfGIJ9iVVGPgNt/ZI0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac0ad8b-df18-4dfb-cf93-08de11b79b9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 22:09:02.0497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c4E2s6Bx77riSN3vWR89nLEfshsHBmm30axcEbCgPfjDTIqI2shNg0I1Cfpfj0b9CJqhdZ8KnHKiVlbOnMlL0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
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

From the gt0/pat file on BMG platform, we can easily find the pat[13] is a =
valid entry and PAT[16 - 19] are reserved entries.

/sys/kernel/debug/dri/0/gt0# cat pat=20
PAT table:
PAT[ 0] =3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
PAT[ 1] =3D [ 0, 0, 0, 0, 3, 2 ]  (     0xe)
PAT[ 2] =3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
PAT[ 3] =3D [ 0, 0, 0, 3, 3, 0 ]  (    0x3c)
PAT[ 4] =3D [ 0, 0, 0, 3, 0, 2 ]  (    0x32)
PAT[ 5] =3D [ 0, 0, 0, 3, 3, 2 ]  (    0x3e)
PAT[ 6] =3D [ 1, 0, 0, 1, 3, 0 ]  (   0x41c)
PAT[ 7] =3D [ 0, 0, 0, 3, 0, 3 ]  (    0x33)
PAT[ 8] =3D [ 0, 0, 0, 3, 0, 0 ]  (    0x30)
PAT[ 9] =3D [ 0, 1, 0, 0, 3, 0 ]  (   0x20c)
PAT[10] =3D [ 0, 1, 0, 3, 0, 0 ]  (   0x230)
PAT[11] =3D [ 1, 1, 0, 1, 3, 0 ]  (   0x61c)
PAT[12] =3D [ 0, 1, 0, 3, 3, 0 ]  (   0x23c)
PAT[13] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0)
PAT[14] =3D [ 0, 1, 0, 0, 0, 0 ]  (   0x200)
PAT[15] =3D [ 1, 1, 0, 1, 1, 0 ]  (   0x614)
PAT[16] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[17] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[18] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[19] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[20] =3D [ 0, 0, 1, 0, 3, 0 ]  (    0x4c)
PAT[21] =3D [ 0, 1, 1, 0, 3, 0 ]  (   0x24c)
PAT[22] =3D [ 0, 0, 1, 0, 3, 2 ]  (    0x4e)
PAT[23] =3D [ 0, 0, 1, 0, 3, 3 ]  (    0x4f)
PAT[24] =3D [ 0, 0, 2, 0, 3, 0 ]  (    0x8c)
PAT[25] =3D [ 0, 1, 2, 0, 3, 0 ]  (   0x28c)
PAT[26] =3D [ 0, 0, 2, 0, 3, 2 ]  (    0x8e)
PAT[27] =3D [ 0, 0, 2, 0, 3, 3 ]  (    0x8f)
PAT[28] =3D [ 0, 0, 3, 0, 3, 0 ]  (    0xcc)
PAT[29] =3D [ 0, 1, 3, 0, 3, 0 ]  (   0x2cc)
PAT[30] =3D [ 0, 0, 3, 0, 3, 2 ]  (    0xce)
PAT[31] =3D [ 0, 0, 3, 0, 3, 3 ]  (    0xcf)
Page Table Access:
PTA_MODE=3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)


> -----Original Message-----
> From: Wang, X <x.wang@intel.com>
> Sent: Wednesday, October 22, 2025 14:55
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Lin, Shuicheng
> <shuicheng.lin@intel.com>; Wang, X <x.wang@intel.com>
> Subject: [PATCH] drm/xe: Dump PAT entries with reserved mark
>=20
> Add a marker * in the PAT dump output to indicate reserved entries more
> clearly. This improves debugging and makes register inspection easier to
> understand.
>=20
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex
> 7649b554942a..82c221aacebf 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct
> drm_printer *p)
>  		else
>  			pat =3D xe_gt_mcr_unicast_read_any(gt,
> XE_REG_MCR(_PAT_INDEX(i)));
>=20
> -		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> (%#8x)\n", i,
> +		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> (%#8x)%s\n", i,
>  			   !!(pat & XE2_NO_PROMOTE),
>  			   !!(pat & XE2_COMP_EN),
>  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat);
> +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
>  	}
>=20
>  	/*
> @@ -431,13 +431,13 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct
> drm_printer *p)
>  	for (i =3D 0; i < xe->pat.n_entries; i++) {
>  		pat =3D xe_gt_mcr_unicast_read_any(gt,
> XE_REG_MCR(_PAT_INDEX(i)));
>=20
> -		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> i,
> +		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u ]
> (%#8x)%s\n", i,
>  			   !!(pat & XE2_NO_PROMOTE),
>  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat);
> +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
>  	}
>=20
>  	/*
> --
> 2.43.0

