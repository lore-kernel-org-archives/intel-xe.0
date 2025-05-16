Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22999C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 10:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF87710EA3D;
	Fri, 16 May 2025 10:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLQ/iNhd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA5610EA3D
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747390988; x=1778926988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EXbIZwkQqOjiIK8hMwxvXtA0N2HM5jWmyXvG5jakcrw=;
 b=SLQ/iNhdXeS2Tn8Z0XUkzbh1dJ977QdpZArEUpIKKp+bVFJUujYgFqU1
 TQAxlu794Fer7t51TmfqiW9jdbUfTGX/mABo6kvFINfyYyAIL0NMBSeT8
 gS6oy9oS7iN1BHHQf7Gsp0DWJ2vPSXFWY4CYp/T/N68UQIaMOpyaeaMrM
 kisPH4BYzepB/NZIldLTl87HQiLToRe4vcTxjTWyVnErh1MHUu+PnrGCE
 l0TCgrhRSuQgv/tVFIwzxsi7zeQyThA9FuCdjKBt1amsXVW902bqTqvy6
 sXZXUr34ie9+KXdIhjR1t1va1n1xG51AVY8TBsEzYy55Z2xvlMo3L3Ord A==;
X-CSE-ConnectionGUID: qLWwMhiRSFeU1Y7gKxscRA==
X-CSE-MsgGUID: 5qCTMGGSR5qH3mNIeD9peQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53173395"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="53173395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 03:23:07 -0700
X-CSE-ConnectionGUID: 3LsN8ftfQl6/XET2YdpCFw==
X-CSE-MsgGUID: 4E2aPd0FTTygqQhis6c5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138569196"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 03:23:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 03:23:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 03:23:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 03:23:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpcM9aqTu6cPdJYjcc02CGa9Fc0AYyIWxs/mGnrGHep6QsDmdLZ9nQ0rh93ZmTAlhDquWRPwC1HsN1vuHiZFNj+zy8zhgxS42Yff8VilqfMPJmWTqvUS75B1tqMvtCxl0mVMAxbJN6bUwMQtMGK8lj6yYqR2yWiaWwL5hUOprRlQJiwBl+McnGYaDM6hLffg2m1EaIPlv96BFTTYA3Ho/XCVQ6oVD+3bNVlU4zshH53TZWA1fdSiiq+7ik3JKxm0KyMSADGxECmbZHJg0E4C5h0EKkz8du1xXzNWMczcID/P2qXvpaPkp/bwcwbIQaZPagsDYqpqYVhg/G2a/Uzk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFjivbgzsqzK7ZqaDdpLI339SHXmv7BY0OloECvF1YA=;
 b=oL3ixfKzH8TIlJR2wShX16zb9W0kDuIpj6ebqcvU4NzfUFf8jW5aezfa6pZ8In4VzeUI89/770ohm+G+1ipr+AzG5ipAqrycyFOY5XZvGB4zmRZw/RhmML8WKbxsbcJ71alzEzEzjUuxsi0BPgWB8n3bDgeVDWRXGa5lMwlcLE8YF54PYfU5UFmLitELBjcgJDpgPiJGJ4FaUluZdWtITAk1s7MWm2WLr1sCc3Yi/EoHA4dU59hjFOtMMVlpackBrCWUPF0Lx86hARgfK906b3sehrY0I9KOQ+UCZdhaehMKcnDiTmO86SR7XKJbT6eeUEPo5JSvWtAYhO/YAOarPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 10:22:35 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 10:22:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Default auto_link_downgrade status to false
Thread-Topic: [PATCH] drm/xe: Default auto_link_downgrade status to false
Thread-Index: AQHbxkQ0eHvk244430OdvAu56xLo5bPVDA3A
Date: Fri, 16 May 2025 10:22:35 +0000
Message-ID: <SJ1PR11MB62047F5C074BB7E5E01359398193A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250516092325.5959-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250516092325.5959-1-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6055:EE_
x-ms-office365-filtering-correlation-id: 7003e511-12a4-405a-240b-08dd946393c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?B1laZPtdXyi23xTMvrYSD1EHYbcp+uiUgbJO8+szdyKZwrapJK6TAqeu0PlS?=
 =?us-ascii?Q?U2CnaQ0TwmHILumviLMq6KUSkGy3MQhXkMdfpshxFaQVCgj/K6nugya9estJ?=
 =?us-ascii?Q?YXj1BhYt4gfOHUHogqTAm9+eHijl4tvzTrgSz4hwzEk88nvDbQChmT7OlOGc?=
 =?us-ascii?Q?GQePZBvVWaVrKw6DYdMCLSY25RBWmZiPL8GEaqJ4hCMkqqBK6vSaPP/dNZkd?=
 =?us-ascii?Q?wr/UXBJ5PbDgr/hyWZfXRlO+pIHPgw2Xv5v/H2vxNk5HwG+Am2XgNFgUmneG?=
 =?us-ascii?Q?0As3nCw0qOwY1N1u3IQuRbuf1zcyANFTL84t1RGzlcIRX1cvKB7o0K7VIpEk?=
 =?us-ascii?Q?g6GDabwfQGdaaOBvT2RcOTTATki2z/XdzXIa0p7gd2uwLtI6msckJnaKMPrY?=
 =?us-ascii?Q?ALiR2LZye2rir65koVIdTmpvXVacQXq/ld+945yWW3cklkrHa5TThhDWwwWM?=
 =?us-ascii?Q?eNyeu2Ctcgi3gPRX+ghmHzVJo87eWkn2SZj8AnPuVgrLrym/9rK5DTDYbBZo?=
 =?us-ascii?Q?uNaMKlLieIt9ohL88OHhThWwDd2GGBFoU07MkWt6PoRB7fU3TFHXs24DTrVo?=
 =?us-ascii?Q?jWBrBKXMQ3b0lswr+7FB5bUW7XeAGIPbi8oau4jbK0OyXxTP4dIE8ELcIANt?=
 =?us-ascii?Q?9JhxLJddC7yF1T8ZmTs676qr9moLxm77exZKEFRS7kCSh78NlynbwqRQW/J5?=
 =?us-ascii?Q?s0AmHzrqEu6MiaWjQl9U/2oEe0ZsOGtGtQleWnbBwzLVgsjV81PL5BD7Hh4f?=
 =?us-ascii?Q?nBHICXNQYN2dXb+BsmAAhbQjVyHDj/dF7qKBYe5owMU7Ah9T3sSL1bShD/s4?=
 =?us-ascii?Q?uHuLM+9UAtgZp+5rL/5hYA3UiABQ4oea13qf4hudiHludv8Q6y1a9eFKdlz5?=
 =?us-ascii?Q?gaOA+9VE4paxgihQoRHlWxYAuSM8vkjt4SLPbOvzj4V7uLnhJfDJ1Mh7NkwE?=
 =?us-ascii?Q?bL2i539wEM8HixZK5kF5YxDOi3WkVcGMSIoNeS9n2DYAYpo5khKwBvT0y55f?=
 =?us-ascii?Q?gdL90aHOOhUhjAPWNpaEMy4yNUmZh4H2NHh8ydyFEuUOwrJrXjHfzF2yQnbO?=
 =?us-ascii?Q?id2oxKQOH4jWFfJjFXJDqOCM8WwNSLhm88m3hVcLIuD7tjA3AfLu4Zk47AFu?=
 =?us-ascii?Q?a9J7PK78pSy640CmlaudcOIHoeXCT57YUSMpcG+aNH2CGOKyO8bhSN2rDPo6?=
 =?us-ascii?Q?9/xwce5T34Ls0Il8z9xJrM1OdYLL5Y/BysIZFvCiXD8JaJK1OkYrw22nyQZX?=
 =?us-ascii?Q?Kmp8PhQxTNu8tSIb5b0HogAnTEd7X2nO4DTVffemh3nzOJoyENy8ClJXSlpy?=
 =?us-ascii?Q?4OS72ZFAFPJ0ZMLXk2u1kWzE8/Fd0t9K6uj2B4BiliPjgXNj5BFGSu3oOdVH?=
 =?us-ascii?Q?AmrAVhQAPdPOowwryh49BKLIKf15UMuEzno/0LGUplm2Tb48Sgt9E/hoeJjJ?=
 =?us-ascii?Q?i9ZsWKAOXjslKVT0fV3gfh4Jk0I+nqf50AWtPbGkx00qc2J6aQ/1AA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EZ/NNtvw/sSUEIhG2/cuUBHT760SqUh4GOLup9tPyl4ZvP8qCc4GdyIrK/PW?=
 =?us-ascii?Q?WdetryF51DdcpbjzXg7hwpDszGfc3qYb8v2GUqRJgf0IsToV+un+hBD3Rgy5?=
 =?us-ascii?Q?SzPj8pZzf/49VFVHMIuRfDY56O7Bstjd4mvybMimZ2gjGWUA/82/mcePYG9l?=
 =?us-ascii?Q?W8M+Gx+q28QLS9elPPG+tIWMhYjsfIQggszRo9g5xGJls146jwPd33A1LXbT?=
 =?us-ascii?Q?xRWeFK9D0QUJqxuGVc91DefZ0hpNjNFnAaASrUMPxk9jLR1rZHysaFWSBzgU?=
 =?us-ascii?Q?hXMs++pA4Vn6OEYjbXewCiF9E/Qo6VMzbgAjWYQ3WXwtFFZTPak1HrP7vcAX?=
 =?us-ascii?Q?KUuUwZTq+RIcZkiHTZkQHSq8DAkmvRs/NXmDjhJZzrs6erWkwXh44uBGTD7o?=
 =?us-ascii?Q?tSCwTRNYUTLWIMaHguCG9ZBgsmnPZKybGEmWhbU9GFRtwA6NHFFcnPq9VvoT?=
 =?us-ascii?Q?KLTWgNP39lFHUDm596z+5WlF7izmys/VrIz9P2BQKZLVFHiFByncc1H4XKpm?=
 =?us-ascii?Q?J3c0xLzwh3qS8HiUItfbMobcG/ic+SIWpIulGHn4x0GhjOgNcb6ACsWOzSHG?=
 =?us-ascii?Q?UIOTphNTD0T4UWdiwTx/zK7akrP/IVUAY5TQF5JEFcKErSCYaG1hPm67IrJ4?=
 =?us-ascii?Q?G3etMqFvlnS/u/CEk4HWCgZvVCsfiMLemv6pT+U/p/IttgGb8UBnArVb2Ls4?=
 =?us-ascii?Q?I8wxcwz6xuEjLf5HFypGLjsJT+kaiDBkoJA/G3H0QABUar741TxvO3E7Kpx7?=
 =?us-ascii?Q?ANaCKjegoYLb+h17YymjgBxExgE7p0Uw9tBBnTsn3uuHOPqxbMlkr/DDWLmy?=
 =?us-ascii?Q?TGijUJjEyZmdpPUVTy1x6ETOjt1jtTf6yJYtMWLhL9EZ/17T9UCUC6wLQHN7?=
 =?us-ascii?Q?ls2TTlBn3iGfZAo7QhfHrug0l0kCgERaBjUqHGovkzMqNvTACT07+EsdPapL?=
 =?us-ascii?Q?ESKguU8ku7j8U83J6ohKnj1Tbr0cz3CSpoxpqgKvmNUQh1kselcN6IahIU86?=
 =?us-ascii?Q?eObo6f2A6ZSx6V/A9qJbHYVx5yB1U6gdNErHyy4K5jvvES0+0DMlfn5b2kk0?=
 =?us-ascii?Q?YKB/DmU1N4oAX3m6D+7xsavOyc4MRxxr+ffH50y2Bv5L8PDyDuctqi+m22x9?=
 =?us-ascii?Q?G69CNGANPQT7rbrHRaphicEokYSFV2S9vzmL5zCiyb3hjlBHhSPdjwlD95X2?=
 =?us-ascii?Q?Q+O1FZ5dCzGQ+l/UwzDQeXW6JNxeHr50KV+hcY2F8VsbZSOS4zv/07ghYhJn?=
 =?us-ascii?Q?WDT/shIBE3x8WmipAqvPhp2pdTt0uDzJpzwscU71VFUsC/qWGA9hs9Rt5PKq?=
 =?us-ascii?Q?uZg3489vMFQMuxQ1H3jqMAzXocS30qFdxrQXSoh7JLayZZi1HOr44a+/jPk7?=
 =?us-ascii?Q?6CFyyuoh5y5wI7rl0RPrX7bdJ5OaO041hhoQaD6G1Co3q0cTUmpXOCZdwvJm?=
 =?us-ascii?Q?DUujGERJmMq1HrCfsXqtsO+QotXkXOKRapcOOg2rxn+Bmfp5FXUnnn6t/O7p?=
 =?us-ascii?Q?sfVdBlEpVaPa5Ks5ed+Fqu7DGraypb7+xhCYaOIIJM8d3Sj0pp9OAM8l1O7L?=
 =?us-ascii?Q?iwnM1nTn0lkWFZ6i2MLu+jabZ7/fT4oY0yB5UrGA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7003e511-12a4-405a-240b-08dd946393c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 10:22:35.8508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xF72R/m05lKx4/neB3dCHRX9+82wY3eeUS/LiamiJcx7/sJZ/MVvUYeTDCd0TG6IushdGepCEtkny9i3Txbf4760foo3EPNgjVsuvnL03zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: 16 May 2025 14:53
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Subject: [PATCH] drm/xe: Default auto_link_downgrade status to false
>=20
> xe_pcode_read() can return back successfully without updating the variabl=
e
> 'val'. This can cause an arbitrary value to show up in the sysfs file. Th=
is
> concern was flagged by the coverity static analysis tool.

concern was flagged by the static code analysis tool.

>=20
> ALlow the auto_link_downgrade_status to default to 0 to avoid any such
> complication.
>=20
> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 9628e9a0a0af..2e657692e5b5 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -124,7 +124,8 @@ auto_link_downgrade_status_show(struct device
> *dev, struct device_attribute *att  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> -	u32 val;
> +	/* default the auto_link_downgrade status to 0 */
> +	u32 val =3D 0;


Apart from above comment, LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas

>  	int ret;
>=20
>  	xe_pm_runtime_get(xe);
>=20
> base-commit: bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28
> --
> 2.43.0

