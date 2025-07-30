Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B91CC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 21:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B4510E0B5;
	Wed, 30 Jul 2025 21:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeAog+KQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AD110E0B5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 21:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753909762; x=1785445762;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=62aXMfyzHZmd6MS5yXyNqOl6ExJdQVmhJzx7Q45A2xU=;
 b=eeAog+KQgiPiNdvDB9rHwaDNbhGZMI0pL892MqbtSm9/Ta5Uys9PbXaV
 OsJkSq+U4MascLurMKyRBLdKnA72vWy1V27gMDWqA/ICeV2bLZZxPLrS2
 XxkgdIPelbG0DTtqgxBucUEtWOvr96ggJcUcBRskd/yPiAnXZ0v/Mg7D1
 QAEhovrl6+Tkl0WxSd72e60ZUGqWtqUIicc49TRut5i/RbqPy8F80ODTc
 6mROlsx2hSwRl9DujzQ7YZjzaYECVcLSjNneYjkgZiOzLvomZxZcMkJi8
 qocqMmUW0OhPPdeoOVPx9vF6scScBvlxf+NJjSKDfvWHh5JGSOvaUcDNS Q==;
X-CSE-ConnectionGUID: 5SymkRCDT3SSq/53ft5cxA==
X-CSE-MsgGUID: zjoE7vohSuSHflPFhJ04hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56302993"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56302993"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:09:22 -0700
X-CSE-ConnectionGUID: k52eoqVDREih0WltyqLeNA==
X-CSE-MsgGUID: N1yvd0AITtOx0UOeJRRmYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193930114"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:09:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:09:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 14:09:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJHeLXG9dWSoPxiNoL4TODFmC4R6EGnenvkJxPwoNBGtirb/9iKgPnzSIqco3cisL5sOFJ2lIK6bACvEjthmfP4b1ft+UnE+y7ylpynK/e/QcyWl8J9ajATKK5yE2ure2nHue/29eurIKm3nb5CK0G3Rfh822CURwowA230l4NOmJBPxo5s+qy0XENONEZRMJ097jHkLTpi2LdBxqSuzOq20nquKdgg8kMia+1I0qKXVDDtErPTAuyDXwJwv44vHLQxZJ9Z+hoElsYaXu4XqbZdjbxIJo6EcIhKQJ4vGVvBk5npA05dbueUMFKis5EL1DnVP0mvyTw9/bRNWSTC7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjfBdLHX8aX1JJmzS5gsQw7IjwIqKv+r1BdQd7SfIOI=;
 b=YVKpVQA9Ry5b5sSSdSMGKQpZ8RTS9rX17kaSWyAtWtufFdQo0QN9nVZWg1hvCEWPgCkknXD218zsTnrWG4RcEINpmRRzTzJAcBE0nZGjQo0GFuvKaauG8aYliXykTi5f+/4qvFJFsbgplFnk0kep08FYRe9zyLXhEU08AoWxQZLAnaKmAPsuKp6Vxg2n6gTrhwADppseOb5GwOEtpgGG0dJleN8J9m+A4+Clw0Nr1Lxp6lZxJZNZs5Ik8RaOXelIyQIMAfWtWRn9pr3IAnxa+Z3DIuMfIkyrgi1bWtrblQk3w7a7cmStRYIfGcU1wl5FUHLq7q+QpKW4o+tqV62DJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Wed, 30 Jul
 2025 21:08:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 21:08:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
Thread-Topic: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device
 removal
Thread-Index: AQHcAXpVrY6yb2di7Uy/3QqHj1LM8bRLARZA
Date: Wed, 30 Jul 2025 21:08:47 +0000
Message-ID: <CH0PR11MB5444B1CE4DD9227B04115BDCE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-2-michal.wajdeczko@intel.com>
In-Reply-To: <20250730174913.178434-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN0PR11MB6304:EE_
x-ms-office365-filtering-correlation-id: 77786329-aa75-4b2d-25b9-08ddcfad467a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?W3Jy1YEMZtsZSIcH81eqEKeSLNM7PQ5kWiNg0LBszV+aU1ZnUc88jmm60IR0?=
 =?us-ascii?Q?ag5RN32WWvy2zrJ7ez8KpyDxLuNcXa3gX2Q6SzVChZsY67kWVMWnkw2/8fPc?=
 =?us-ascii?Q?09NWYnRLZHRJlUIeQYJMM51UCO4+rimDGYgJkbwPAEEqK7PxkX8v1jqL4mVn?=
 =?us-ascii?Q?ulmX+/48IzNSLLZp9CwqNUnydFU/uC8ADKlMp+JOeJ5Jl870v2EpoGu6iENh?=
 =?us-ascii?Q?tETp/Wcpo2wN3y7U+Ctns5rpl8NIjt4UijGKb1VNvE4XtISDUq/XxSB2yzTg?=
 =?us-ascii?Q?4Gl0xGn2GA8J1ssJg7DUbLb5rD/Z30dgK1WC172EY2arTh+Q88IdAo6upBw9?=
 =?us-ascii?Q?E/zUNl1yVBu856tkF88K3tVXrfKMJQJ5pQ1D+iJLuy04HMYuUV79jnU1YLYx?=
 =?us-ascii?Q?dEst75bv1v1jjT9JgFS1fwrZJX40kN0N1wuE1Xi456yOwCH2uyA2yElIIkjG?=
 =?us-ascii?Q?0bQyoftRgGeoD9IrDoGl68odcKoI5o2mEmLk//Ap3Q8uP6mTeAjwG7eDcSXB?=
 =?us-ascii?Q?Vqqp6wDRYe0S74E5dBrEw2bvhJNGHaTwBazLtBPLhtKoxcXk8hP/7m8KaPPh?=
 =?us-ascii?Q?Xqba6+sPdEMavvAZFjogVCCxciUH3BdUau/56RCZmtJBVf2gqJSsneK1AY6g?=
 =?us-ascii?Q?OKIZY/6PTD5Afj3YH+Z26U/Pm7GK1tQ2gflzZZJNKcnOjNXONzgcNUNnDpVc?=
 =?us-ascii?Q?rpGngbG3JbtjUl9En8TRtBJuaGaWckiRyTYh49fj3uamHabvGwjeIrFmmDxg?=
 =?us-ascii?Q?XUk4tHsKeszriIaanGTd15/PAsDK2KpEMDwW0+keFx7/ATMBH2amD24cVfaa?=
 =?us-ascii?Q?e/Pc1RiSJ3F5X1CyXO3UOZ8BwtW67KqES85M2Rw3g8uIrauQi9yfAU3n5A98?=
 =?us-ascii?Q?SVDzHRUXJvzvcekBCk/Mj49pGNR5dx5wyiCVtfVErjU97MSb5evLq5Sdyk4K?=
 =?us-ascii?Q?zjgMszGhp4IBFOzMU3vHSYE6Uc50SKffr+xXXhZEE6rX5JqoY8y5oV7+r4eJ?=
 =?us-ascii?Q?xSeCjMfaQziDNnGBA2B6pkrMf55qYWuNdX3CSWhMY8hQkM3JtDMd84cyGgAz?=
 =?us-ascii?Q?/wQ8NO/sygVo5XfFNz1/a7vQbMHWN4aYbYbBogs4CkEF8EUisWzy+IHG7wEP?=
 =?us-ascii?Q?Qz1Iuaw8djux7v2Aw35LAHYyZ5PF4UQJ/zUhnynrHqpEo12A91yeYe3Q1Ynz?=
 =?us-ascii?Q?jUOxQfjumOE4YVwscNFXSgbg4uZIynx1HeVYB47juDHUmA3SKkYPc/RPHoVQ?=
 =?us-ascii?Q?dhH+9DElFVW6nLvoW7RLhmh4qUqs1Ri/qwkLjN1/cL27zJM1SDm3iezQnSFs?=
 =?us-ascii?Q?uB4Fc0aSpJw0VRekc8wSQjxyOlj3QoM91lxYZi57sTtRD/3Fw59BljACIpQ5?=
 =?us-ascii?Q?0hR6sv+cD8Hi/3CS0T1UPwc24kK1sD12gsNQELPqxhojbcdNlMZmq6AHDBe6?=
 =?us-ascii?Q?c+PMm7sJeQbcWn8Qmk2puxhnPO+jaTtLVPuGS/kPL4ViIINW9SKxBA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kuqK4oQLIlRoIm4v3pA6Hz65x25QnPdCeLxeWHPZ/pKu5SYe4sQ4xZYvG11N?=
 =?us-ascii?Q?6Hh66oLiFm6UI/otlBYRU0+PmcOMdOb7qGIYi8JzMvsckRCqueojnqgZXsTo?=
 =?us-ascii?Q?IdsCjFPTRZH07czZznuWcy/SujYWzyaunKIUTeOilG6cQbVbMY5Ij8dCQNZa?=
 =?us-ascii?Q?a7NZoUfvjiDObetVq4FrRIO3pyQXFQliJsODG9QVlxYDVTro46j7vbZAuQhN?=
 =?us-ascii?Q?0csHpRkWZJ3YLyzsG5Z1aO5OkhfFaGLJgyHjdriWptA0XdJ0jGWl63B+JBmP?=
 =?us-ascii?Q?Kcy8jw2vpI3krafmLzgnplinjwrqQfDYY3mgUR0tUJLiMFEjgR8BlnSqCRMk?=
 =?us-ascii?Q?GKIKUi5vbI51x9/KUlmEyYIKe1im3dF1o65H0B/7nAO5Mh0jZbUidVDVATYC?=
 =?us-ascii?Q?tsogRpBU/WkzScPSigqLAsDSK1nRxanesc7uD0or89N8Hlk5A1Yw7UkM1hfo?=
 =?us-ascii?Q?KdkjE0+233iAGUcz/CM/wl7wOeH6T/LZpQde5tWdd1c4G77iao6SOXulx+AR?=
 =?us-ascii?Q?cVV6xnfy0wHSx7xWxWmNHOZozFu5SapdAjpMjNF0zTLG0oLbYDCGWVJi//J5?=
 =?us-ascii?Q?aKre2JdtzeaSpQFlhBCrl5aAmL5n56Tlu+FXPZXiqDs2ZwZd8+cd5m3KyeXu?=
 =?us-ascii?Q?aUX+40BHNmvV2IyRJeJwjs2brXWigg5AMgNkwOQDzqExS1SaVRaJlbp+99sJ?=
 =?us-ascii?Q?WruO7P1cK9ovCimqu/zm9dCZb2FXKDnIrx58vgG6LT1IIqiXB3Vhg+uMs9e0?=
 =?us-ascii?Q?pRhzy6OowCcntMbuFKkuEpS+iZ10bxbul3yJ+Ag7ZCjKNTlW5v69r+XA25Jl?=
 =?us-ascii?Q?YIyCadtTK0yeE/5D8gto7EPBbxMJpqyBjsiTZ9ZNSSehctLkYcpE8GSYYUWr?=
 =?us-ascii?Q?BAciNWN8E8WftBjKpJjDdDtlcONy01LMh2OB6WvVZ69x6XkR6NCuYkfM2nHt?=
 =?us-ascii?Q?yRB6h4s8V+ImyUcZ4HQB9J8cLwFLI8nc61YAh+noirGVBzvpnC/uf1P8OKrX?=
 =?us-ascii?Q?5xNMtJCOvmAkH6U4YjeGxB7Z6wg0VnerNYn1O/SrzonDdBcNW9cULfb1brfb?=
 =?us-ascii?Q?NUjyyrUJt15MkxCwkpy9ZjYrOb8zuTMOfJid6YRlLnLr9D+QLkR5IMX2/b5z?=
 =?us-ascii?Q?XtyXdW6AUJ5Y3nLPBYZZgkFuUnpLr27nDOdqhB5XfAzAIPMJkTFXjBzf3FRB?=
 =?us-ascii?Q?ZEviY04zLykh/6LplhmI6Qw6ABM23MwEWSMYtk+HFmYiu31GoTNiFLRLevpa?=
 =?us-ascii?Q?ovDwwaiVmT4sS3qgI+fdAsL8PL3XvtAVJxYYpN7JauwqGvYk1TAGngHNgSzv?=
 =?us-ascii?Q?YTJjeeFfqRZTkHM+ORWabOVFQTC5z2/T1IeV8zkARQbRrneJNViNw4qPcL1F?=
 =?us-ascii?Q?04xDFfTH1S1AHVfQVUvsZe+n/PSm7S5f26MzLxzIlrqd4OH0sXja8NS7gc43?=
 =?us-ascii?Q?mEIrN++W92OTui6yJ4fcEcuGE0bAlhhc35hDIHKthTmaRJ81uS4ZKACXW20T?=
 =?us-ascii?Q?8oNQ7KcOmsWq4dm5Im/rhVmXyNOQL9enXEmdYF0YCecBOJAQLLaV3TEk+4qJ?=
 =?us-ascii?Q?echgGnAgMaLG8GnzolLejV1fa0sTIKgt3WsI3FW8bUkIazW4p2E401LdwyjL?=
 =?us-ascii?Q?Ze/MTLoetCFKDGgHQzGFIR7HD7XUadE+MD36OaYyV8sE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77786329-aa75-4b2d-25b9-08ddcfad467a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 21:08:47.4787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brfk4gPQcsc+sTyxCvBUi8gQEmzXveuijKfEqdhUp7kStEkfzLfsKoEFJBr5eeJkKEomgQ6GvHJE3he3CRwF+V0tQpx9Fok04xtDdVYfUGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6304
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, July 30, 2025 10:49 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
>=20
> We can't let restart worker run once device is removed, since other
> data that it might want to access could be already released.
> Explicitly disable worker as part of device cleanup action.
>=20
> Fixes: a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning to worker")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 30 ++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_pf.c
> index 35489fa81825..2761319fdc26 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -50,6 +50,11 @@ static void pf_init_workers(struct xe_gt *gt)
>  	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
>  }
> =20
> +static void pf_fini_workers(struct xe_gt *gt)
> +{
> +	disable_work_sync(&gt->sriov.pf.workers.restart);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
>   * @gt: the &xe_gt to initialize
> @@ -79,6 +84,21 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  	return 0;
>  }
> =20
> +static void pf_fini_action(void *arg)
> +{
> +	struct xe_gt *gt =3D arg;
> +
> +	pf_fini_workers(gt);
> +}
> +
> +static int pf_init_late(struct xe_gt *gt)
> +{
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +	return devm_add_action_or_reset(xe->drm.dev, pf_fini_action, gt);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_init - Prepare SR-IOV PF data structures on PF.
>   * @gt: the &xe_gt to initialize
> @@ -95,7 +115,15 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
> =20
> -	return xe_gt_sriov_pf_migration_init(gt);
> +	err =3D xe_gt_sriov_pf_migration_init(gt);
> +	if (err)
> +		return err;
> +
> +	err =3D pf_init_late(gt);
> +	if (err)
> +		return err;

Everything else looks okay, but I don't think this conditional branch is ne=
cessary.
I think we can just return err here unconditionally, as if we fail this bra=
nch, err
would equal zero anyway, which is what we'd want to return.

With that change:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
> +	return 0;
>  }
> =20
>  static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
> --=20
> 2.47.1
>=20
>=20
