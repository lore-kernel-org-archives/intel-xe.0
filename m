Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F83DC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 13:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABE389811;
	Wed,  7 May 2025 13:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kcl+xd+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FED989811
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746624873; x=1778160873;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nWh3qiiVXNwYO7yl7Rtq2kOoXRaq+uANhg8JtbkgVes=;
 b=Kcl+xd+9L1slm2dflRgY0KzKWIM7lbQRNajUsUI4gfCfajApLDQwiWZM
 KfwIyDvM0hMQvBHmPqdxKHM1ag41MXtM4Ptw//HmP9VImHSvYS/6hAa62
 x4qsheVwmqF29HxURASYFUQBx0g2dq/GHSxjLzDHufcgaUXKVJ0wrPYKd
 OGHa47ENImbNSt9ODDwGTe4+794EuhNO30OeYv3PD9DiE2GFMNboC4Sfg
 VcROymTVcWw0nKljFQkr1y0WKeCOkZX8njywAO+pOcevq64D+qSJjBpwj
 W+/pMZacYtVci7MFV8/5WBTPuIz5WE5w6Nu0pOtE75LM7JNRDsM0q8BUg g==;
X-CSE-ConnectionGUID: kK/e8zrNSI+NfsVAFhaUqQ==
X-CSE-MsgGUID: NcSiV2nLStCQQOVDR49nLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="35989947"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="35989947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 06:34:21 -0700
X-CSE-ConnectionGUID: xigVt/PtRM6uuRLm3PqBLg==
X-CSE-MsgGUID: 1fYBgYaORUCWx7uCXLqU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135869611"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 06:33:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 06:33:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 06:33:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 06:33:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4Kto8to2b9iz+2xZrghatqLyPj4p2mUuxQ/RiuRAlgNwAKRFdOHqD7SILouoVidIY9RV1FhRbUfK+yDVdZutoKKO74kHQ4ketUWQk3JDvX2PugpOJIOMZW1hxeBU6i2JQigXaLZnN0BJhU8W2XuZRbEIQ1zmp8nDU8ru1cAWwyrZ6CpPwDHgeeE5be3eD/0+wWWPHnhbWztuyUBStLrhjy7u/TF/ggu1p1s7u/DcH7pFWbtRpTTENCG7QicEAmhJTnNUfFI1N7mmP6pYEkJN5CEKvxPyAGfoRJqL9CBgtcj7REAF43KjTCjvHMYIfWGaZo/nzC7YEjj8ZpyMoOKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/DN38RYe7yvjXrt4EUrWanUKCZg2P9hkk+KHDCqJeU=;
 b=PD5sKR6O1XQKqIP4/A01+zRnFGt5hLC4KhamRL24kucV5ysYXttcqrR1eISGIyOcWstg8Gmhx+qe+LlDCjhcF/YtjN1lhNVeQTpNVi19LS30IasdzgyhzERNY6Knso1Wb1sbG6Xu5roIYTgj2JZ9LfP7tQ2KvhrAlkANu+aymkCseEut3xX/y5Qc5ad8LXBsmNl19cqWSxzkoASWTFzRj8X5nG/8zismMhOihJyisz8oz8e09D+gYleAsUl9aCjLY6mRSVwv6184+QrWrWMVHbrynHXzKmwb5dNIu7XOpkIo46tuW6o2cpkJTYs7KnIEc0X4BWI8z1KJYGH4YBExRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 13:33:13 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8699.035; Wed, 7 May 2025
 13:33:13 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Lahtinen, Joonas" <joonas.lahtinen@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/ptl: Disable null query for anyhit shader
Thread-Topic: [PATCH] drm/xe/ptl: Disable null query for anyhit shader
Thread-Index: AQHbv0p4fezvGO8KiEerrQJQ8u55RLPHKjrg
Date: Wed, 7 May 2025 13:33:13 +0000
Message-ID: <SJ1PR11MB62041A4F41D5E21E98CBFBA18188A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250507124437.2651331-1-nitin.r.gote@intel.com>
In-Reply-To: <20250507124437.2651331-1-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB7892:EE_
x-ms-office365-filtering-correlation-id: 67f265c8-2288-4cdc-9d2d-08dd8d6bb77b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?87T3IzhhaO/N2kOZ6wxM5PkfPRr9v62bZ41ECxAJC9PnT7BdH0gkt3w8+D3y?=
 =?us-ascii?Q?G2m6Q5cT6Nzp8lVZ8Wv/SNww0oamQwRIe/8XrrG2Ii9ksrn9qWWff4IbfCFw?=
 =?us-ascii?Q?WY5rG/bovy9bhyIpZPvo5uJzSVcdJy4DPiWqVe9PZa/uCk4kja1FXvBPKfN/?=
 =?us-ascii?Q?kQ4aGvAJN2qH6Jgq+03lqY7yiOBLGjEw5T1c8cZMVVAWiBd2UWnSHP4Fu2fP?=
 =?us-ascii?Q?eF/shU+qvmAf81l4so31DtfC9nubbIXk6qxQq//Sbed4JejO1mAepbUMlTf+?=
 =?us-ascii?Q?y0+VBYeO4MXcENWLmi9nYc/pg+XEZGNSGoAc+ogT+qUU3T4lr46nPEHwFpKs?=
 =?us-ascii?Q?lrmEeibMPKAd+x31pYZiyySMzz+w3aAPJb8SrCTeMyeEEPqq3Bpcp6cg277K?=
 =?us-ascii?Q?wdQoNVacYngKRp4kSjPyjjdXmIv4UI0jb3cGVcVIH2q8dVp2ppx7w8FnahN1?=
 =?us-ascii?Q?9XSnmzAEwCySw152XxoeAgcbE6SVit4M24s3U7OuZUKVFspXDV1k11rn8a6G?=
 =?us-ascii?Q?kvAzkRd8uuet6WGAgWw31UB8O6rDvp41s/oKfX7RfL6BUESm8a4xDNoxJhtQ?=
 =?us-ascii?Q?AXgRC7rmOi8iOPSFSMDyj5J+pDkslOhuZO6xHJZWK3nXhdT6RnnRCZd4yWS8?=
 =?us-ascii?Q?3otc+lTV+rbqxtJwZvculxRB+LHWsoiMuU2264OLeWXFunAmF1z/+pnre0jn?=
 =?us-ascii?Q?hMg+GygZ23GIHfY5kssIKsYYBP4wMTWhAC3HeUFvC32jncSW6GirW2JhyeSP?=
 =?us-ascii?Q?pmjpWnc4Yt4Gmy3P/DPXerLUwcvJOp8wlLQNhQWuvyYRDo48MXKj51BGziQP?=
 =?us-ascii?Q?RltqbFnIIjapNKu+r67Wz/e+Cf4vphuEaRAYPWfZbqvqKa1+uES4spQX4nG1?=
 =?us-ascii?Q?+L24jAxgEq9dLplbt/LexPXDzJ3KcRA1F1JS1dZ66GLr8i6gRZERI2eOztyy?=
 =?us-ascii?Q?f6P9sXwTUUISgyEShIgp7RM6fT1t1fqNVWxqRQUicR7QGuvy26zn3Rg0tOln?=
 =?us-ascii?Q?b+g9VrFc7cdSiAunqa/ZW5XUDpm2418Fer8Gs3PIgtiXI4+Hl6yeyHTsI2pS?=
 =?us-ascii?Q?2jbeDJXyHLXegmwaHIE81/kfMn9aWl0dPaqMduUHdN0CnSl2iDtQyn1qoRZz?=
 =?us-ascii?Q?LfmFkmpm1FAklKSIsUb/X4bbVfdE6pscntQPSJ5eAoK7u2y/9+Zy0k98R0UF?=
 =?us-ascii?Q?za7M2NIoA2LVF6ksurPNnoujpe1OxviAHsPUXvG5ySYGTTOzWVkpDAND5bjC?=
 =?us-ascii?Q?lZyRY1jOWUlpplbrhBdHZopdcGUfptKLnl+6h/Xy6DXEcjawnFqvmlIsQuEO?=
 =?us-ascii?Q?z5KPWyw5JpV3Gtgqdk6PWexPVDcP67KtSQuMPD2AiSzFM1qUQCN/WeJJJiD5?=
 =?us-ascii?Q?c9N7ZhlH4ZIp0gilGMEf0niuSv2+keSoiMyxqOPa+sD6W4SwThZwxiXFI+pu?=
 =?us-ascii?Q?Ywl0kBrmlR/ZGD5qwAWqaDKKVSKYemvNkwpXaipmiXj3XobUEmycdw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nff3NTtXXfCncLg5Tx8LyqXV2tRyYh1tn++5b0ta0a3llF8Iba5axyi42GLq?=
 =?us-ascii?Q?VgIat7UnbVmy2tR8A5u8VGg/Lxbw9qEvSNY4rYEnuDyn/BSOAkl/Egkz7dZo?=
 =?us-ascii?Q?LPgg+IAA9TSh8/6eHvZhleq55/q8oCnpXa8p8BqYagmUJGXRolOCqn0Il9oi?=
 =?us-ascii?Q?BVhYgkbU+MWkgt7yMTuAdqZjg3NciO2jD7pbLtPEK3BtU1fImWH1OCA87Pg+?=
 =?us-ascii?Q?MZI0EjleMtEnPxIs3Az9CBlP9k9aE7JCWY0YlNMeMWqVGh1krIkhIa1bl96R?=
 =?us-ascii?Q?58uTgxv1fNl9GdfnWflVLKC5QJfEMVVJak20UKZzHkmG+qmGu7qBHB5jeGez?=
 =?us-ascii?Q?Vfz6baC1D8fU6aYKXuMJSPLzG81FAG+D2m6sOFZC8KAqq+JARFgoWw18lMNI?=
 =?us-ascii?Q?+rquFQxzur2M+tkt/ceK5g0LuEYehpkkPBg5TrtABpMrygRyYncrWwUA7i4m?=
 =?us-ascii?Q?pQ3Ewl6TlsnnvEu6PGFb/9DvRMhhkDClxlxSSOrP8B3Pe5ACqD+TjiO+Rnro?=
 =?us-ascii?Q?1tsUZU6j/+pmrbk0js9v4cren0YkGhPX5T0D3Lcdcxg0Z49IXOkY5zwMY5HO?=
 =?us-ascii?Q?SdMcR7y5T0zrXSy992eM31RctlSHkiM9vOHn9oO0O2QeTBobb0/hP5Iuxt7V?=
 =?us-ascii?Q?WvQ8AfNFL9Pw2H+sAuF4TN7oxIHJNkd2yLrv5IB9MEJ6K2lEW+zWkrC25TqZ?=
 =?us-ascii?Q?bCEX3mnx6ooRmlqDagVIqjoRvsZZ0N5KsvjdH6z1S9aqgkBeuhGTxee6Ur7E?=
 =?us-ascii?Q?32be1B9ODQIDIVmV97vaCHNmzUcwMINdJ6abB3AAWG6LH0P/jeAGkJzIQGjG?=
 =?us-ascii?Q?zX6acSuPxel14eTJ1HIrWMfhjBVa3tePTpEqNrFrWCaiySAj7apr4BQt1bDT?=
 =?us-ascii?Q?d+4PUvglVy4wj7EiQ4I8O91S/SUEmw0zn2Q7VPTkqCtDvI9BBOmCGduji9e6?=
 =?us-ascii?Q?FJ2RysMX9vJKm2gWgrfxVWqQ0iTxfExQLmuFgwYWwTZL+iq+m1/jt27bYQxN?=
 =?us-ascii?Q?5RPNFIw+SD9sim4YoeRy/lbhPGsa3c+DHPoomK+4keCq56rbNwLAg2EpdNpT?=
 =?us-ascii?Q?SEKCmA5ihiSsQaoyj+P7cy8D1sswjpnf014Fi0bqJZPlOvK2WpiYeTRf+8fC?=
 =?us-ascii?Q?O++4pFAWDjXoOHnsubywfE+Ro4OHIsBRmCaJYZ278s1xbYOkTe2VIpUGSrTh?=
 =?us-ascii?Q?TsghhP4I0NOJCGH5bNUOZwiTvdijd+iwINGBsP3Yh3itX0O7tpOAV453O9UW?=
 =?us-ascii?Q?HmWiMLjppXpIdCV5nc9PvbfT65KBqZYwWBkwMtetRIkwDx0LhDAXGehbggUT?=
 =?us-ascii?Q?xnNfClIEiq69j8MxF2Er+BgtNnvqcEbj9lzRBmNe875kwQBRYrVUjGzII/Vn?=
 =?us-ascii?Q?+i6wieUy9vwQeM+vUbUXZbC29kmnUnLZ7MFPweniPWPB6BvsFUL9uh5wNfch?=
 =?us-ascii?Q?wRyYITokVSTYLv0tPJ4eB4pDPEqC1AxP8zMapCjSJ1Ne9O5JvBnJLwsFErIl?=
 =?us-ascii?Q?ZtNoGHkV8rp0VFdUirPuH0v45ZBCumxTPhfr/eJ+qxFVd7GgwNxbcMZjOn2k?=
 =?us-ascii?Q?Rj6Pukh+yuQ2Nzt0/yaHq1z6oS1qjQpuhIa0D9mZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f265c8-2288-4cdc-9d2d-08dd8d6bb77b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 13:33:13.5488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2q8c9ppp5qDYA1TDJIofRxkVClTJBXe7gxdQFzLtwA4FO1Lpjo9ayM6xmC2SUNhyBZg8Of8HtWclY2QqJghfpSTdskIV7zJxCvm3ctHa9S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
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
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 07 May 2025 18:15
> To: intel-xe@lists.freedesktop.org
> Cc: Lahtinen, Joonas <joonas.lahtinen@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Gote, Nitin R <nitin.r.gote@intel.com>
> Subject: [PATCH] drm/xe/ptl: Disable null query for anyhit shader
>=20
> For PTL, disable null query for anyhit shader as it currently does not br=
ing any
> performance benefits.
> Quite the contrary, disabling the mechanism brings a small but consistent=
 perf
> uplift.
>=20
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
> index 49ddbda7cdef..6f2f3428b12e 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] =
=3D {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(SAMPLER_MODE,
> INDIRECT_STATE_BASE_ADDR_OVERRIDE))
>  	},
> +	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> +	},

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  };
>=20
>  static const struct xe_rtp_entry_sr lrc_tunings[] =3D {
> --
> 2.25.1

