Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03AFC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 14:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F3F10E13B;
	Wed, 26 Mar 2025 14:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKA4KqKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4232010E13B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743000628; x=1774536628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sHv8kRL+cCskYZTROPKHR5U8zPiOAGW6fToBABlS7M8=;
 b=fKA4KqKfpn32yor4gU2CHk5HnLjzsp0uKkGCMszRhdqqpUpuDwgJB2wA
 PkU077ghJtKT/NX08No36S77pf+PChBPJ3dc8ES7+/F4WmZyBeublK50M
 VyNoKzl/yQ7kkR9UhbvpUijraCRBTbsRGrf23BhPnmaNSaxghtNb2mYmf
 fxKaSlJS96evhWy0IS/JFygKLxZ4biQ9i/u7ApynPOgnenpvuPariCXqY
 nT9yonbZqvm9yK/Cv7/OqMobWd2Vcp0BuImBGEM9kBh6xvpdG/K1fmeyL
 ssi78yWeQe49g5rDDdRhQsvL6JId4bx76bs2+0MrqxCBY2T54pMPIimL4 A==;
X-CSE-ConnectionGUID: CNPDJmv6RYmV/32gV3atFQ==
X-CSE-MsgGUID: CAFQhfbqTpioKeRsRSI1iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31898857"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="31898857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 07:50:28 -0700
X-CSE-ConnectionGUID: fpW+Y10aS9WG2oeCKXCfZg==
X-CSE-MsgGUID: s6uP5HiTSp+EloVcqM30Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="124759781"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 07:50:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 07:50:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 07:50:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 07:50:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFOu3eNkBc6TH1W1r+iAYTnBv5YK+mNAEwnGb/IYByioQ3NODz7/xPu+/tuxGjwJgsX2Ayn2NTbcQH3N4K7Lm6BE3Zz+WSHm70m9n1lG2KDf1HU4HlGQNYgxW/7yca153+4Sdv5c2uD9lJZJrFxP/WLWZmPN/cAXZsdjtWDT5ldFYb1YRW+hyXVxJ6DcMKHPCNCKv8YMFxemX/vGLtjoy3l3B9lJsZDdpWJU4IRbC6CQft4NcseW3WAd0lqF4JzK/YZQF4k+FVf2hEoOK4ufqtTfi7AiQvA141MqDmRIVRfPhV0NruxALUvRHB/t+u/iTRLEe9s3+2rRZ3VW8HZgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNHoSCVzUUVg/m6a/cprH0Dpc+bfEo7vhf2D9p1QrkY=;
 b=u6vYWfgJI3xuZV3h9Yi1TXOyvIMcktW2N/14WKMHx0Ir8MWEJgSNQdd71vQrEevzptNJC+UXbuHUaiL8cv8NyPwJFr4GZ7+5OKHJJEgxUA8kUUkc8ZTvmIVAv45LgneuYPuU308z2WmTWPt9P22htsbqrNutCNAB8cZEy/E+/DoN6+FbNwGAi+fGSLu4sHPnztMpwJvLq8K6OX3DUdqfEzOzp1UAGDzKIe9YHcmWjNgSoTRAwSkYA7HIB091Qyvq4PqMSTvMlxmz0pSNoQWFi/6jRWqFiIuEO7je+dgJDGr7XkBakDWXxonEWerMW6ZNu2akeYSEVsvB/g4K0Utczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS4PPF93A1BBECD.namprd11.prod.outlook.com (2603:10b6:f:fc02::3c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 14:50:25 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 14:50:25 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
Thread-Topic: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
Thread-Index: AQHbmMdeG+ib0QKjH0iieC2Qjdkym7OEQi6AgACVJ1CAALH2AIAAAOdg
Date: Wed, 26 Mar 2025 14:50:24 +0000
Message-ID: <SJ1PR11MB6204E2F60CA1F971F6239FF381A62@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250319121349.288844-1-tejas.upadhyay@intel.com>
 <Z-MAJWTFFlbaZZcj@intel.com>
 <SJ1PR11MB6204E7681720F3D6F7FFA94181A62@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <Z-QSjKb4NgYXKmeb@intel.com>
In-Reply-To: <Z-QSjKb4NgYXKmeb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS4PPF93A1BBECD:EE_
x-ms-office365-filtering-correlation-id: aac326ed-623f-417a-e22f-08dd6c758aa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O+kMztDDjrn9TuKc+b9w5DCpPT1qknGGCZwJVx0ZJhJKZzRxWCY3JcAHp+Ol?=
 =?us-ascii?Q?ReZIghh6kro7txFGGqwcGogr/bJjrZqudLV9A3dHrRBQ3AO1pDlPdp1QoP2O?=
 =?us-ascii?Q?dOHenJiiTEC8W3yDi0XGIuh5oGZ0eMyD8kGWcPWqrfe3t/2+t5dpxm7rIOCM?=
 =?us-ascii?Q?xHUx+xqDFxuXM05KNTmiY4Vgn5SUNEJvibSC+oYVGoQnGiXBifxBL5CrIQlr?=
 =?us-ascii?Q?nHq1KsVx96YSryn7FGyS5YQNndo+eDRp2QxF7tmCpX1RfS7RfzOTs1QeO4Qu?=
 =?us-ascii?Q?49USWNIPYmJly6NmkSPjDfx0DlyCAsxV6bzDC1xo4LNMsdfZugy6LsQZ8McG?=
 =?us-ascii?Q?LfOn6H1cJgyShc5K5Lv9ZU+bKiPyVGlcGeemlzuNqvAdRXHs78VRuZiuqSXR?=
 =?us-ascii?Q?tbzGp68KbAK6gqDwZ+/kRn9+y0DKvP7frZgeUC7tlb20oytbxhYbidX2pIwj?=
 =?us-ascii?Q?i8AnfNQ7V4hy8KK2ps77K1VWKYwMabrdaLIdn1k2EhJmF5ALAsGcmcD+fy8o?=
 =?us-ascii?Q?gCj/DyOJ3Dp8n26ZPjHFwfR5QnJq+zD/4TfBMMbl3q3Ya6KMhv4pILdDODSn?=
 =?us-ascii?Q?BWRl0ZrFmYl10nLulU3ZroqYBkMlCB8OmHjS7BoURQsKLcxbcamP3lXdOWtn?=
 =?us-ascii?Q?kIGw8CHjh+GT7vmHfzf7vPjp7Y+M4JjYW0gvjVXKzysCEaOceCSfKt9SmBV0?=
 =?us-ascii?Q?aVOyXxK940bwa2OnxjFhMyXTzKo4thbauNzeV50uWj0PaPIYutz7aE6MyUtl?=
 =?us-ascii?Q?W/NVGxH/I+IV4GaPQvNaVWkUD0VFEspl6ubLGMNMkulkTWnylL+RvktgcIuF?=
 =?us-ascii?Q?9IBEdWsUh5IduwjP7zvYQUqxpDXgS/y31CkPoGI9dAcsO/4JrTUMSZI2E5BJ?=
 =?us-ascii?Q?io85UvgLzmxfVLgCJAYJlDcmPV10g9HuwGvR2PXIwzox+lWW0nkztnC8L4ED?=
 =?us-ascii?Q?xV/FfIHxi4pu51G9XGplBtZ5qYFAgAgzpMHuqbQGEU4/uSYN1R38jrmXCY/C?=
 =?us-ascii?Q?lxTaRou6okutwCp+M6XwBB1dZkeW0fV+FMCJOFxsYwxr0uO00SpmSzQ/8OIo?=
 =?us-ascii?Q?xcSG56yhrsqrqXrmCSRGWZLD3Qh+FPRGvdcDcR3ipwdvOfka6TMW7PJw/WNy?=
 =?us-ascii?Q?9PJ1kSo1CVkqPmmadciiBHK0tbel6wqPhWp8zU4nZQldqh94kSd1vhjqlUXT?=
 =?us-ascii?Q?e5mEvXol0iTVXHqxYFgA31czhCOK69D4d8Trbtfy00Cef1lOcDSOuBZxO3y1?=
 =?us-ascii?Q?7Huu8DDGXBnFG02tIEKZkMRuHmc9w++IVEpAttdynJoBGhvfB746nN/es5H3?=
 =?us-ascii?Q?El8zFZV+Gt7yxMs92WjLj0nUmOUan3xFAKO90vhzZKG7iXeyhpCYusSe19ZV?=
 =?us-ascii?Q?lor2gCc/SVhkghWZhaMsCKOsEXwLAuy8g+MrykDDZFsxyXB8vajzDc0Wo931?=
 =?us-ascii?Q?b9IrsyMQkBZp/juLBzZXsB0TtMv9nwE2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mdo4+1yTJxFczmx/MA0ebTP0PlqWZDcAJ98tOQzmS1e2GX++1Z1TjFgowyFq?=
 =?us-ascii?Q?13vMSw5IaUU7eJEIyGmJ8mu2VPCPW7skx1fMrocX64maqZDhKQZZtedZDRYk?=
 =?us-ascii?Q?6BZpNFTeW0aJCR3n8Y/PzHQpWB8WrX9jpD/J5eYF0Eim+Tl6ChqtcaQmoJQl?=
 =?us-ascii?Q?xEySpzyvSDDqQ5J9Z+Tk8awLkMy+pYWo3YrM9J7U8p8zEQY0Gzl6E7iLHTs3?=
 =?us-ascii?Q?wfs8nV5qzJYGqF6QKLDcNguSgcJ/gOtPCCojpGSeuw1ROOYRn9Xv02I8Gpb7?=
 =?us-ascii?Q?M9hw3IHNRh3xRib+gX3INqCRE6fs3MfjBjWtHc8qWmoE4vbYM69uliPDWA3O?=
 =?us-ascii?Q?7bkP105hMZITh0I5oBPDXfM4JJe0bmd6gWJ44hJk0RINKgfc2JcQl6+mE03l?=
 =?us-ascii?Q?MccQk9Q5w457PC5AYeHw4UHMfv1PVjwJnd97pJuermgS0y369vYynHixEg8h?=
 =?us-ascii?Q?FJf6jyYC+wd+zBOJVjSTfJV6xmAqNDa/4lT5lJt4JpLNLDwFej6bphHw7BY/?=
 =?us-ascii?Q?4EQkztQe5eaHr5WtBuMmvjLkSsoqqr8sANxkQyiYIHU0B3OjiCsGS0EtP6SG?=
 =?us-ascii?Q?7FCDnaZGLqd7D6XL8mAFJ4DfZHcmZDTiqspCVbgI4Fw0nXvCKp4iPHJ5Zl1h?=
 =?us-ascii?Q?bTz77oUV4KoYK45EGdJcKqOzm50BkNwUtDJhWS2LlioisC4KQNrkOBqEm0uA?=
 =?us-ascii?Q?vRB8tD88hskv0T/Obhan+ysKrSKkZ8Rw3WXgk05opSYi9rYpxxJ3IX5Bwm+c?=
 =?us-ascii?Q?n646bkYd2RNjjsmxFKZZFUWDoVHd0j90YbaovSz4b/ExIIBgvelvWDGU91ws?=
 =?us-ascii?Q?DVCLU62QBZ+XtTe5nuTY2ZiM7undNV2iKXILbDQ2kqJ53Wa92sgBf1tlvSrW?=
 =?us-ascii?Q?8ItcmSGoRXKeRyyuLLk7ugq4P5G8rVmMD3A5tKS6bsEm014JdcqFIlTDmlRj?=
 =?us-ascii?Q?5/4ENb468vO+qzkkycbUgGN7E0ogmSQaf0cRXGN2CRdxYqJoQbfLL416hng8?=
 =?us-ascii?Q?E0KGhqAe4s4hvjjIcyZ6/Ni6oV/gTOmPQgSTcNwW8As1IxqauM/iTGs+qudx?=
 =?us-ascii?Q?aaL+qnIln7UVD7oeK/YlN7UPur04i/N0ZeD9UGrnFS2F+Y7+EGny6yquimBw?=
 =?us-ascii?Q?NWRnGCfzuSugXqlUSUidrFGusJ1CWCkBMVZlL/R8IfmCvuSWFVZ1P+GR0Kd3?=
 =?us-ascii?Q?Wyg1hfWNENzR06dyefKhhdcvX7OVVFaC6ELQKcH8vX6n2zOWRb8/4VTSFk1v?=
 =?us-ascii?Q?vrQn+KU4zhqvo6qdAuFJQ4QxXiWtvco9UGO6yTExPKuGQ4aMcgqGnmG0hWC8?=
 =?us-ascii?Q?d9fJObVtKVHbSKrHyG3x0da+9om/4FHCPzHYpz07EHT41xDKgPmeW2TPqNO/?=
 =?us-ascii?Q?O0+Ga42LpVlCiEfTPJhRd3y8Sq1SRn1qyJ5H5/+r69z8woW9qh/cZ/SQbxC5?=
 =?us-ascii?Q?UAXcwHeISi8ta0me0W1FrcLBketElB/3KelCs1VHkCcohqGXYcT7HxvzoelJ?=
 =?us-ascii?Q?cBLb0dG0DTJO5sq/hbND4LAfX9+4XiBGU5qAtg0B3rlRS0P5JHWlNTzFFD4Q?=
 =?us-ascii?Q?dNOOxfeBVdsT070PBOsxOwYNFreS65tsF351VBnoGDgYfathswcsrrn7wzez?=
 =?us-ascii?Q?UyAM0vcqXn6fVlEq5BwqARxDOTuqKJ9Wyd6XTl6XlTMB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac326ed-623f-417a-e22f-08dd6c758aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 14:50:24.9073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYjaYUP60plU7J6Nk1bKSkKPIS927l3V5GytC4/hfAUyygunW9MHSKa9HMKLSKPT1qmrX8N4542JurwBWqRk9WGklRNHX3aznLSb2u2Ywzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF93A1BBECD
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
> Sent: 26 March 2025 20:13
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH] drm/xe: sysfs_ops needs to be defined on parent
> directory
>=20
> On Wed, Mar 26, 2025 at 04:14:21AM +0000, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Sent: Wednesday, March 26, 2025 12:43 AM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>
> > > Subject: Re: [PATCH] drm/xe: sysfs_ops needs to be defined on parent
> > > directory
> > >
> > > On Wed, Mar 19, 2025 at 05:43:49PM +0530, Tejas Upadhyay wrote:
> > > > Currently, xe_hw_engine_sysfs_kobj_type is defining sysfs_ops on
> > > > wrong directory. Sysfs_ops needs to be defined on immediate parent
> > > > directory to be able to called on each attribute set/get.
> > >
> > > Please bare with me, but I'm having a hard time to follow this
> > > reasoning and the patch, why, and everything else going on here...
> > >
> > > >
> > > > Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs
> > > > call")
> > >
> > > Why this patch is claiming to fix this? Please note that this
> > > mentioned patch just replace the default kobj_sysfs_ops per the new
> > > introduced xe_hw_engine_class_sysfs_ops. They are basically identical
> functions.
> > > The only difference is that the new one call our runtime pm wrappers
> > > around the calls that we need.
> >
> > Earlier we were not doing any common ops for all attr set/get, each
> attribute has individual setter/getter. With 3f0e14651ab0 ("drm/xe: Runti=
me
> PM wake on every sysfs call"), we introduced common ops on all attr set/g=
et
> and which is must to be called now. Thus I though of adding fixes. Please=
 let
> me know if you guys think otherwise I will just remove, not strong object=
ion.
>=20
> I'm sorry for the noise. I probably had enough coffee today, so yes, this=
 is the
> right Fixes tag ;)
>=20
> >
> > >
> > > It never touched anything that this patch is touching below.
> > >
> > > Perhaps if we also need on the sysfs on upper directory, perhaps we
> > > need to also replace the default sysfs_ops on other places like in th=
e
> upper directory?
> > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 67
> > > > +++++++++----------
> > > >  1 file changed, 33 insertions(+), 34 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > index b53e8d2accdb..25592f178482 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > @@ -492,39 +492,6 @@ static const struct attribute * const files[] =
=3D {
> > > >  	NULL
> > > >  };
> > > >
> > > > -static void kobj_xe_hw_engine_class_fini(void *arg) -{
> > > > -	struct kobject *kobj =3D arg;
> > > > -
> > > > -	sysfs_remove_files(kobj, files);
> > > > -	kobject_put(kobj);
> > > > -}
> > > > -
> > > > -static struct kobj_eclass *
> > > > -kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject
> > > > *parent, const char *name) -{
> > > > -	struct kobj_eclass *keclass;
> > > > -	int err =3D 0;
> > > > -
> > > > -	keclass =3D kzalloc(sizeof(*keclass), GFP_KERNEL);
> > > > -	if (!keclass)
> > > > -		return NULL;
> > > > -
> > > > -	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
> > > > -	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > > > -		kobject_put(&keclass->base);
> > > > -		return NULL;
> > > > -	}
> > > > -	keclass->xe =3D xe;
> > > > -
> > > > -	err =3D devm_add_action_or_reset(xe->drm.dev,
> > > kobj_xe_hw_engine_class_fini,
> > > > -				       &keclass->base);
> > > > -	if (err)
> > > > -		return NULL;
> > > > -
> > > > -	return keclass;
> > > > -}
> > > > -
> > > >  static void hw_engine_class_defaults_fini(void *arg)  {
> > > >  	struct kobject *kobj =3D arg;
> > > > @@ -611,6 +578,38 @@ static const struct kobj_type
> > > xe_hw_engine_sysfs_kobj_type =3D {
> > > >  	.sysfs_ops =3D &xe_hw_engine_class_sysfs_ops,  };
> > > >
> > > > +static void kobj_xe_hw_engine_class_fini(void *arg) {
> > > > +	struct kobject *kobj =3D arg;
> > > > +
> > > > +	sysfs_remove_files(kobj, files);
> > > > +	kobject_put(kobj);
> > > > +}
> > > > +
> > > > +static struct kobj_eclass *
> > > > +kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject
> > > > +*parent, const char *name) {
> > > > +	struct kobj_eclass *keclass;
> > > > +	int err =3D 0;
> > > > +
> > > > +	keclass =3D kzalloc(sizeof(*keclass), GFP_KERNEL);
> > > > +	if (!keclass)
> > > > +		return NULL;
> > > > +
> > > > +	kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);
> > > > +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > > > +		kobject_put(&keclass->base);
> > > > +		return NULL;
> > > > +	}
> > > > +	keclass->xe =3D xe;
> > > > +
> > > > +	err =3D devm_add_action_or_reset(xe->drm.dev,
> > > kobj_xe_hw_engine_class_fini,
> > > > +				       &keclass->base);
> > > > +	if (err)
> > > > +		return NULL;
> > > > +
> > > > +	return keclass;
> > > > +}
> > >
> > > I couldn't spot any difference from the both chunks above. So this
> > > patch is more moving things around than doing any change right?
> > > perhaps a different patch or a mention on the commit message itself?
> >
> > The change is, immediate parent directory should be defined with
> attr_show/store ops if we want it to be called on every attr set/get call=
.
> Currently we had sysfs_ops defined on parent to parent directory which do=
es
> not get called on underlying child's attr set/get call.
>=20
> Okay, now I could spot the change:
>=20
> inside kobj_xe_hw_engine_class()
> -       kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
> +       kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);
>=20
> and inside xe_hw_engine_class_sysfs_init()
>=20
> -       kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> +       kobject_init(kobj, &kobj_xe_hw_engine_type);
>=20
> With this you invert where the runtime_pm is called moving it to the righ=
t
> parent.
> I partially agree with the fix, but I don't agree with the patch itself.
> Not only because I got confused, but because it creates inconsistency:
>=20
> kobj_xe_hw_engine_class now uses xe_hw_engine_sysfs_kobj_type and
> xe_hw_engine_class_sysfs_init now uses kobj_xe_hw_engine_type
>=20
> If we want to invert, we need to invert the sysfs_ops inside the type fun=
ctions.
> But also, I don't believe that there is the problem on leaving the runtim=
e_pm
> hooks in the parent of parent. Just in case we end up adding some extra f=
ile
> there.
>=20
> So, What about simply:
>=20
>  static const struct kobj_type kobj_xe_hw_engine_type =3D {
>         .release =3D kobj_xe_hw_engine_release,
> -       .sysfs_ops =3D &kobj_sysfs_ops
> +       .sysfs_ops =3D &xe_hw_engine_class_sysfs_ops,
>  };
>=20
> Thanks for catching that up and fixing it, Rodrigo.

Only problem with this approach is, .defaults will need in its ops, as it i=
s also using kobj_xe_hw_engine_type and .default has only getter method. Le=
t me rethink if I can do something for .defaults

Tejas
>=20
> >
> > Tejas
> > >
> > > >  static void hw_engine_class_sysfs_fini(void *arg)  {
> > > >  	struct kobject *kobj =3D arg;
> > > > @@ -640,7 +639,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt
> *gt)
> > > >  	if (!kobj)
> > > >  		return -ENOMEM;
> > > >
> > > > -	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> > > > +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> > >
> > > now it looks like this is the only real chunk of this patch, last
> > > touched when you added it:
> > > 038ff941afe2 ("drm/xe: Add sysfs entries for engines under its GT")
> > >
> > > And now, after this patch, who is now using
> xe_hw_engine_sysfs_kobj_type?
> > >
> > > Looking further to both types, perhaps we need to kill the
> > > kobj_xe_hw_engine_type itself in favor of the xe_ one?
> > >
> > > Or perhaps we need something like this:
> > >
> > >  static const struct kobj_type kobj_xe_hw_engine_type =3D {
> > >         .release =3D kobj_xe_hw_engine_release,
> > > -       .sysfs_ops =3D &kobj_sysfs_ops
> > > +       .sysfs_ops =3D &xe_hw_engine_class_sysfs_ops,
> > >  };
> > >
> > > >
> > > >  	err =3D kobject_add(kobj, gt->sysfs, "engines");
> > > >  	if (err)
> > > > --
> > > > 2.34.1
> > > >
