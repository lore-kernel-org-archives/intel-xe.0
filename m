Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D93D73E8C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 21:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E1310E8CC;
	Thu, 29 Jan 2026 21:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3BUzhqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCD210E8CC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 21:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769722819; x=1801258819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B9sgdSejhYNHjnGMiKOegbUdJ9oDermx7cgHU7r2OCA=;
 b=I3BUzhqwee0yUIzF+qWG8WGqhBW+0vP6Uf77eLtmcp8O5WAAZE6OWBHb
 non4QDtPMmBMSWQvIjLEmDtaiNsxxB08RzMO3B6l3MyWhaNekDgD+BRyF
 pkoGFNZDIrxRabukfMp4+4rt3e0Q82qdBtg0VR8iYQnM65QPEB+XcSQFU
 +s/8x7hUiTT4YkPrrB/oAJ+HYE2PAgVt1PU+KZpQu6lGP5kIv3vwnl+HJ
 bHZ5IXjfQCuu9+VMh9S08/0SgtuMAosmxYLq/uwePn6T3aIrF1GoyZswN
 D3bGMAdP6vbz8PaIDpNcgrmwLW/qwvoHiw631iFgr9q8QTTSSn8xwbK3a Q==;
X-CSE-ConnectionGUID: 4r+yqrE1SgKvA88NZ0v94A==
X-CSE-MsgGUID: J8SzyemVSteLQVipc107kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="93632941"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="93632941"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 13:40:18 -0800
X-CSE-ConnectionGUID: DhK6Ovi2RcuAGecVPjMR4g==
X-CSE-MsgGUID: pxAfQbstQGq2mk9jtD2+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="246311564"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 13:40:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 13:40:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 13:40:17 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 13:40:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOCcp6G/18hsJEWH/Jeql4hSTphZ6j+QzPYPry1CDAS8CSBpmewQWpbsKWDo3ofRVwZ4phS312pw/+IAZVgnlM0qhiJf8pciW90r1DXLcJFWBWrDhH5C+Ses/xHFHc5KUHT/OvlLqCLkOgUN1A/av1R1R3uK1WZ+AwdxyeIJunjVwJJpVtvD+2HzRCjXz9vmoKMEptUIyI+xsQiu+BibU3+a/hd2upyU71x6lZAflRr2HvjmANWTagueMg6T6nG+J9eegPK0YXQEDIIFAeOTpzKVUs9Wm+shUtAxC1ZaN+Ea6q+VLN+nD7B0pNGXzSrWyn4pYJhRO5kRzxkJohrduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiufnuDqY/YGnY8L4lm6bgGXXDM28d6ha/903k0K+mc=;
 b=HnUBNhHSn9t/ulw4Slrde++PmM0Qv9s+zJNmAJnv3raaykTEDGmuLhz4c2Qq27SwE+w/CsfP7b8rtlhiNvVmrmkKn03+L8kuRWpwJlhS07MWJjbojCIMckwkbkcT7g/wv5wdr6QYyoxZnd7eADpIRgaIdFH3zIG+2zXkRIIr+NJCc6KwvbY18Pt0ituMFnEHJUuRBp62oOx/IvGenbQz7aeLP9imw2DOkGgSe1I8jbI0P70bxZzZ8WvP4zb3lzoO2AU0gwino8IAijpvQtzObcUuVqs62RMxDVYmiWMrXDCVO2X021+g3Ks8H6FJU8dE/2USUsz6EU0tTCxSBD8RCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 21:40:13 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 21:40:13 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Move page reclaim done_handler to own func
Thread-Topic: [PATCH 2/2] drm/xe: Move page reclaim done_handler to own func
Thread-Index: AQHckPk3zwD+TY26u0iDGvHhza/aArVprRPA
Date: Thu, 29 Jan 2026 21:40:13 +0000
Message-ID: <DM4PR11MB54560810977243466B4436AAEA9EA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <20260129082756.1096935-4-brian3.nguyen@intel.com>
In-Reply-To: <20260129082756.1096935-4-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB8425:EE_
x-ms-office365-filtering-correlation-id: 55795b84-08de-4753-d021-08de5f7efc3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?O1oOPwYo4qPhwEz4f7Bc421gD1+yhp/6IJlXCaFnJT1SqaRd+Akjy0VXY0Uq?=
 =?us-ascii?Q?vY74uHaGqBYDNsuzYRtw7tYVoegD8TQoShgnRvAvQDNMTArOzOyV6nPe7hc+?=
 =?us-ascii?Q?3lpdXUjtlpoCJQCJO5xfPD/CwaccyS6yoegf+wNbmiV2+KiTR+FiQI1x8XTT?=
 =?us-ascii?Q?C2+PveNURNcFD1YwKZXFg56H1z/9gxOjuQypBOnAGANxJw+5BdCCnAFOYCoM?=
 =?us-ascii?Q?TpsKThDUjTIj/I9+oMUF3fbq8+jLFBpRPiiEW5TAKUqfM+sI/7C3gK4Vci9V?=
 =?us-ascii?Q?5S+6bqNfFF8+pmAlgbzRiKQl8hWtYImb0n6KaJwULFBk7wT2eUN6FFaUMqFl?=
 =?us-ascii?Q?3iRQnLmVbOaCkoOpKda3U97enOmgNHPCzyvPICk75Bq9bg5D7BFEdXMGajX3?=
 =?us-ascii?Q?JApGLRz+Nf8JYL198MOtTFIs+Z5+LG7n4OAQ+IrLEajqDdU7WxbkwTuzy/m2?=
 =?us-ascii?Q?1ARiabqOxbwSC/mIHTwW+Dbr3r0/qY+ZqdI5SEi96e4qOw+2mFF0R+JD+PL2?=
 =?us-ascii?Q?1Jz8aFL7TDZz8DDIzS7y2fkdtDgZufs2wvSMYexyfxYutd/tEiBieMVZj/Np?=
 =?us-ascii?Q?CCAW+D6WqPlgz6GkrBFE5GKclWFuyNYUb5HNKEMX+Tjzj4GG1d4H3fMajRs4?=
 =?us-ascii?Q?h//IAQ1CxcAis8x5Lvmxo0mlo90QZvsfH+qMh706BuR/Nfh37IfTcZPrGXRy?=
 =?us-ascii?Q?GsVKG6igCVWzcmgRWG08RrOxnB9hnjT3XzNsxM7DTzfh8pCD+BP+TVbM5RFT?=
 =?us-ascii?Q?JtC6TlJjL17kA9uy8ghlC/rkVzkJcO/EiGx5l7Jxr5MdQMB7DzkC6sKExZbx?=
 =?us-ascii?Q?kAykYXDFWfuzy1iD3GeHt/RQ5BFxXQh8d0Ll9dRqPG3/icRLFl6Kq7kv9k5s?=
 =?us-ascii?Q?SwVeVWhnrSOWB4OIyUN0LglqPAdTcZ+edKQgu5ukHdzEuTwN8AP6+yBQOAbx?=
 =?us-ascii?Q?LIzYoZfuMlRQrjDjD2cEIT2Bx6mnxoBqfQJo2TD1zNtmRevszu9xfeT+hL2w?=
 =?us-ascii?Q?T1DrfkRCaVYsMFz4emQROVR+Wt7ofpgodcz4DTDFUE3mnNutFTGX9JVyMU9i?=
 =?us-ascii?Q?80ObiXKZfwy82JpsHFL4HrFykdlVLoUaeEyE/9q76zLuC3fzsvohCvqTHYgR?=
 =?us-ascii?Q?wvus0uvt+HLfYrhXdlKi788aV5PZRakEFyu5DMJVJYhk2Y9Cc+VCu0SCPUak?=
 =?us-ascii?Q?e6lh/ANoIJYPIX2k/nki0HmFjSUDWBXSL/THQRcVs25KUuXEENye5xBYkOQR?=
 =?us-ascii?Q?EqK5ywLSelCNNOdwOLfMNVtYsK1iKdW7CKJB5P9wd0oS+FraNL4lDJiSk1hg?=
 =?us-ascii?Q?kvUZ4a9Oo4WClKT7RD92pIYIxWlYbZWs3OMrSs18GOFnoL6+Oaw6LaRG5JV9?=
 =?us-ascii?Q?cv0Y2mDEIyD2nZ6wQCwrE6fJlCjAT7vG7YFNMf3ih5Ljoi3eTaPqt70SKyLj?=
 =?us-ascii?Q?4mNFKods3uwOP6Jj1c6fWA8VWyP1HT+jqsy+x043ryR9R49kCNIg2BjLe3aK?=
 =?us-ascii?Q?+s1nRMB0SVWKPVkLKM6ayc7oDkgKuO4yqAF6ruZjIUvMAxTXYmgtwKESPKb5?=
 =?us-ascii?Q?q+JCI7j7sU0c33kdSlwQ3sERtgG5kBA2TNmbpdKyRE7rj7uRByb3Uselejg9?=
 =?us-ascii?Q?VD80sS1Fw1g4Yby9D/DeLmQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9SjknJT7eIhh+qa/xgWJR6O7qk4G5zYyttVWUfqnw6Ic4XIFHSB+Mq67/BdK?=
 =?us-ascii?Q?gYw2cSj+zpIeDGGzszHphKCmz9kYpiIhQH4JNLHzMect6KKpmtBi8h0Bump2?=
 =?us-ascii?Q?hk55MUwL6zrndHYz+N1iqRz5+ytpd8l6ysna9aDMcbtsEp36WO+h1l4u8DcR?=
 =?us-ascii?Q?kGRAzbZI6ig/fuO7ldJ3lRvbx+o70agkqkGWzZo3eEaqIgvvi/msW1EVRzzo?=
 =?us-ascii?Q?kgz/iMr+ZBGLIGlol1JDzW8kZnkfV5R3BOSN3i1QpjLiHlaE39/gK2GMFPdD?=
 =?us-ascii?Q?Bzvg/FMyikoROru5pIznMw79kdzAUwiRxsuGL+P2F+ZEs8NbYPK41o+rzbyl?=
 =?us-ascii?Q?KOW8qRNmfZMSi/vEBMsWuMQ3a7M61UAkFIt7j995eCljf9ZCwFa0o8rwQ5R8?=
 =?us-ascii?Q?y2/GbZlWknXeLIS9aFoZT5TWRte1UpRvbPnLq66R/4MHC5FmbwrsxcTn872Y?=
 =?us-ascii?Q?qwg5lyvD2esb2ZzCrHVj2eGrUTGEulaPK4Gc3sLCh0M5eLf5Dit6FE5ooJLh?=
 =?us-ascii?Q?GtMluim27kHnJnrkN4tXniKQE2mzcTH5AJ9cUz+GwDIzNXBtNU1Ms3dTGfSN?=
 =?us-ascii?Q?s3K00mQiXlJwPEdBAZu1Xzt1bgwS/I97SolYv1oS2driDqK2LoGawwmNrKb+?=
 =?us-ascii?Q?x9icyT6AEsxU+3WB0XlX55O8oHMS5GsyeWGHmjtoXWhdpxeOngpXTwKl3iK8?=
 =?us-ascii?Q?+IRQF3RMScF4TDvn1VY+/AqXQBmWii3TrBgcmpZWKLx1y31O8HFrWL8Lv545?=
 =?us-ascii?Q?XjoYVbruBmfuMzqXTxC3hHrFgdJcDpuzRTXTu5Ebya5/9r5M+594bXzkYO1y?=
 =?us-ascii?Q?9TI5iHb7u7Xjj7vK+gQgO3urnf+PNtHcbJghBMEZGBnvgwHuYArK3jpHfmwt?=
 =?us-ascii?Q?rCh0yl8RmJhp+FA7Pu6VzfSBadSt8vN1Bq/hMgrBY8MifL+ZKc4hWtx+jfKm?=
 =?us-ascii?Q?+tP34/Q9brWf0D527DSqVpRKLso6EG0g7Sjg2aqS1q/bFufCMYYW1dF2zmAP?=
 =?us-ascii?Q?ngjjDC3M8+plYuwostkfZltvyV863YEscIYLCKJn7Abro/8OhMXC5LLesXhN?=
 =?us-ascii?Q?3SRpFzf1j5ga+Dnrh4xy1bBv1MxyX1xGM9JTyhCXrtvN2nYUE90CUG2PX/R/?=
 =?us-ascii?Q?saQ0M/N4Jejd+CL4JBSyYdxuGBfTwjUtZaifuRcJbFjI2h5JfFFLBcDCbbxU?=
 =?us-ascii?Q?D0DmUBD3TJWlS0RC72hM9SgzuU2FguDMxBoQMCu7A4MxDq5oX/I9JkeTpC6I?=
 =?us-ascii?Q?9D9TxsRrN34QiDo7C+uSgWMVlh0U8ob+gSCeKPFcKs4EaGF8bdKF28pu5ys4?=
 =?us-ascii?Q?BJ9MRIzSYKNHjGbZZjkE4he5V4tlfu9S5pzVMj38z1T/hCm89OQCha8VYy58?=
 =?us-ascii?Q?98O18g9MQmQ8IGvsdoHmrEWeBqBpZqYq5gCF6j3zK6l7JvuPcpROL4nzbGYi?=
 =?us-ascii?Q?9L/QqT3MRE9/nSayQmXueZUiIOk7fSR4di4FVA54q8tnbQO3JVc5mfmC3CXi?=
 =?us-ascii?Q?0naLKvIhJp8uWseISFXhirupH0QUQvEWPH5h2esMg/uLQBg240nddVDpdotQ?=
 =?us-ascii?Q?Kh9Z3MjwHcqDEgeHVi863SgoM0GIv98IP5h5fWvifAXa+sK4cyik9mMiKAR8?=
 =?us-ascii?Q?wiXBPWsU7HJDrj2ImHp7wfH2cquU5WSnscq+Z1zphywqz04c9LjMdO2jOdev?=
 =?us-ascii?Q?aCerO/vwR2m561S9M9trf8f5X1+iLRghjpd/aJKXZS8mmOdbChA6Xzcq+Hls?=
 =?us-ascii?Q?MM1ikiz8HQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55795b84-08de-4753-d021-08de5f7efc3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 21:40:13.5304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYXXpKhF3WkggzxYCR9r70HDIgCYBsuR3ipQWRyw5kTrC+Egc9kGSZJ/I2w7dwTuxcVIorj6w7kh56hVyFabVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
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

On Thu, Jan 29, 2026 12:28 AM Brian Nguyen wrote:
> Originally, page reclamation is handled by the same fence as tlb invalida=
tion
> and uses its seqno, so there was no reason to separate out the handlers.
> However in hindsight, for readability, and possible future changes, it se=
ems
> more beneficial to move this all out to its own function.
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 23 ++++++++---------------
>  drivers/gpu/drm/xe/xe_page_reclaim.c | 20 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_page_reclaim.h |  3 +++
>  3 files changed, 31 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> b/drivers/gpu/drm/xe/xe_guc_ct.c index dfbf76037b04..3d69314170f8
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -31,6 +31,7 @@
>  #include "xe_guc_submit.h"
>  #include "xe_guc_tlb_inval.h"
>  #include "xe_map.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_pm.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_trace_guc.h"
> @@ -1604,17 +1605,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> -	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> -		/*
> -		 * Page reclamation is an extension of TLB invalidation. Both
> -		 * operations share the same seqno and fence. When either
> -		 * action completes, we need to signal the corresponding
> -		 * fence. Since the handling logic (lookup fence by seqno,
> -		 * fence signalling) is identical, we use the same handler
> -		 * for both G2H events.
> -		 */
>  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> +		ret =3D xe_guc_page_reclaim_done_handler(guc, payload,
> adj_len);
> +		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
>  		ret =3D xe_guc_relay_process_guc2pf(&guc->relay, hxg,
> hxg_len);
>  		break;
> @@ -1822,15 +1817,13 @@ static void g2h_fast_path(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> -	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> -		/*
> -		 * Seqno and fence handling of page reclamation and TLB
> -		 * invalidation is identical, so we can use the same handler
> -		 * for both actions.
> -		 */
>  		__g2h_release_space(ct, len);
>  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> +		__g2h_release_space(ct, len);
> +		ret =3D xe_guc_page_reclaim_done_handler(guc, payload,
> adj_len);
> +		break;
>  	default:
>  		xe_gt_warn(gt, "NOT_POSSIBLE");
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index e13c71a89da2..60b0fda59ce3 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -11,6 +11,7 @@
>  #include "xe_page_reclaim.h"
>=20
>  #include "xe_gt_stats.h"
> +#include "xe_guc_tlb_inval.h"
>  #include "xe_macros.h"
>  #include "xe_pat.h"
>  #include "xe_sa.h"
> @@ -130,3 +131,22 @@ int xe_page_reclaim_list_alloc_entries(struct
> xe_page_reclaim_list *prl)
>=20
>  	return page ? 0 : -ENOMEM;
>  }
> +
> +/**
> + * xe_guc_page_reclaim_done_handler() - Page reclaim done handler
> + * @guc: guc
> + * @msg: message indicating page reclamation done
> + * @len: length of message
> + *
> + * Page reclamation is an extension of TLB invalidation. Both
> + * operations share the same seqno and fence. When either
> + * action completes, we need to signal the corresponding
> + * fence. Since the handling logic is currently identical, this
> + * function delegates to the TLB invalidation handler.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_page_reclaim_done_handler(struct xe_guc *guc, u32 *msg, u32
> +len) {
> +	return xe_guc_tlb_inval_done_handler(guc, msg, len); }
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index 3dd103e37beb..0412611f3af7 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -20,6 +20,7 @@ struct xe_tlb_inval;
>  struct xe_tlb_inval_fence;
>  struct xe_tile;
>  struct xe_gt;
> +struct xe_guc;
>  struct xe_vma;
>=20
>  struct xe_guc_page_reclaim_entry {
> @@ -122,4 +123,6 @@ static inline void xe_page_reclaim_entries_put(struct
> xe_guc_page_reclaim_entry
>  		put_page(virt_to_page(entries));
>  }
>=20
> +int xe_guc_page_reclaim_done_handler(struct xe_guc *guc, u32 *msg, u32
> +len);
> +
>  #endif	/* _XE_PAGE_RECLAIM_H_ */
> --
> 2.43.0

