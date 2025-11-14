Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34AFCEACD2
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C6810EB19;
	Fri, 14 Nov 2025 21:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iy2oqa8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A125510EB19
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763154998; x=1794690998;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XHDyXWzhlaiEJHKUR0Sz5aFNDHOJ3AVKY65pWI3sdps=;
 b=Iy2oqa8hoWDKM7qT+mlcXR65Z/7SN9d7AXyLYx662q2x9u1CCgV0LGXU
 yiR1jIUDFkV8AzxPhV4x0UbjkQ3yGt94ifypbtCby7oyhteATbksUB6EF
 ESOxQb8tMcLmxTNiqdrHHmfy35QWHiEizbyJ0psQymJmxkbRJJaxDJZbX
 BAEd52B2PI80y6I2zbqVvgqhkzz9S0oaWECPriFNpQ/Aq7y4gCosUWf0h
 zDFO55urZzPYIlTMxxxOZDY6Z9MpmdqK0CjitJ36+U4Lv9Qd0lBw7UIfg
 cEC0lv+1/IqvbgbCPYWtMbikkV4wos1bRrG6KXL924pQYIGXEEPD9DtVG A==;
X-CSE-ConnectionGUID: MSU1kWzhTWyz1B3kRtbKzg==
X-CSE-MsgGUID: g24iV+gzTECuDHXgCHzQLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65191450"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65191450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:16:38 -0800
X-CSE-ConnectionGUID: TO484q/PRXehMkb0GpAMWA==
X-CSE-MsgGUID: DZ/j+RTZRACOVVu1BmrcQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="195023712"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:16:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:16:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 13:16:36 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:16:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OW3rX9TcgCoEwDyblpVbRdt6r5Dq1DEr4wTWeQJHAVbLCpjvQ8WnzUO/prGBRbHOsYwEVzhGh8NASpJnGBOJxqyTnXXWEW3/kGi23U1CXHvy44HilfOmWn29yE4yfUKjf0Y3jra0uksT0NmrLyhvyaW5LI6NwJTyaj0L4IruSoy5clsDaTBnAULNTnHAVjibbs4tizlOa53dGFK1PKG2aEACLxN8QMj87DQdKQ4og3AoDmmmp1CX0LF+Ft5028eYCP/WC3kxbEVIgUamSoTaIHdrX4rrn+wH3svM587UDmdbq0n5lnAF99Z3xrKvakxYc5jfa/fNY+KLS7MJY+dEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYfTPiaOsJtxTVWrpCm49M+ho9Ksh7szU2Hgq1lHKYw=;
 b=ROEz8pZ47bXzUny3czbx5KEB63XdDQZlmsAXR/8Dgtra2HBUkFKCXo+ZGtJ+n20UR7uUPBNl8aXMOsxmJoNG89sTuQ5hlU6WKZSiuyJZxrbeMvImdeHWKDzgpgarKAmJiHEU1WEqL6DXCKLUAD90erTlwDIeTC9O8JqzrcAUMWzoz4jAjOxluQ/ctUfIswAqSb0Qr9NRBTsufbQo0YAC69RPvyV7GZEQfdrlfFu86SCnSS8aYM0zgiUpCImfa11QXHRsz2eqMrs41HLX/uRQTLOseYG15wQAbwWS9ZMxq79UxBahFvwFi60Ywij9txKWmL70pFwoTHzY8Nas8ac1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4443.namprd11.prod.outlook.com (2603:10b6:5:14d::27)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 21:16:34 +0000
Received: from DM6PR11MB4443.namprd11.prod.outlook.com
 ([fe80::5c3a:d77c:85e6:b4f6]) by DM6PR11MB4443.namprd11.prod.outlook.com
 ([fe80::5c3a:d77c:85e6:b4f6%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 21:16:33 +0000
From: "Zuo, Alex" <alex.zuo@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files
 failure
Thread-Topic: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files
 failure
Thread-Index: AQHcVanNctwL+VAH0E2doyMvEVTWGLTyqwsQ
Date: Fri, 14 Nov 2025 21:16:33 +0000
Message-ID: <DM6PR11MB44433EAD9369AD1D212B11E891CAA@DM6PR11MB4443.namprd11.prod.outlook.com>
References: <20251114205638.2184529-2-shuicheng.lin@intel.com>
In-Reply-To: <20251114205638.2184529-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4443:EE_|LV8PR11MB8582:EE_
x-ms-office365-filtering-correlation-id: 6d773438-14cd-48b8-b681-08de23c3168a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?q5gfhLhZtg1qfDYls/IOrInDgtEgyXBTzOYo6u+4eII9MApApWlWQ6KY0YOC?=
 =?us-ascii?Q?1yTWzOOiSsXciWchqNhF0UXN2Tdt71F15qkDTHH2Q6Fz3fmTUGsBOBtDojMf?=
 =?us-ascii?Q?+KBqseHNh5vurZxM335mTt43REKITC1nwIp/vmbyHGR3TxNW4p1A8clTvAVM?=
 =?us-ascii?Q?itXDo7U5wGmgN/v1kAz2f1ztLR/g9eowQ/h8dk4hmS2GFX2rgRnqBH9YPlZ3?=
 =?us-ascii?Q?l60B7J6uxE2N6gdOrnSXvPvGgWSuVNMJRqULePkytReb+4e6FoHQR6AviqKw?=
 =?us-ascii?Q?z4UbCzxHhYaW4LADROX52KxXNSNnwhNL9eZLvRwmWxuTLv5yuSsCllT5pb/W?=
 =?us-ascii?Q?NLPBVeuX7y/4JpZeAWXj57ifnRkxUuCYkC2ptIQwhGEmlvKgMJylVwNMkkjb?=
 =?us-ascii?Q?c6Zzlj/IzKQ+deqjXg1Tii9GhXUcV1i66OI0kax6w2ICNMUpPe1K7wYzQHPr?=
 =?us-ascii?Q?AbcLNb0l/BM167W9Kcjx26C0MjuIoItgVSXLwsLVZBghj0Vi2CaNs5oTKR7R?=
 =?us-ascii?Q?S7QjQG3wWfU1xLWAt8XDrepNCA8BWEd4HPmErCCaOyvnVvOdTHVo3LDj89BA?=
 =?us-ascii?Q?kBdBrKhf5/WTAwwnpV/zFZDKm3xf60TCaxbFJz/RzDiEorKHyAUTJuV5wC4b?=
 =?us-ascii?Q?hk2/3Gri4+n0EJhO3Fv4ipnYLiifmW5EuWoJsnYoo9tsN/tLnvSzw0G5IBka?=
 =?us-ascii?Q?UCo02u9m+yRBzezIExQXFEpU29ntVvQjP21s8XGFALqMyyFYsOonIklh1Fhi?=
 =?us-ascii?Q?kJfovRqHCxyhAKYtrdtcelNQh+YCMq1xKIp1jN05lxrbJ+YwZTckrV6bYbo7?=
 =?us-ascii?Q?zxhZryAfwvwPQBKxRdbmZZpF+6FaFkRQQg236FVoHg5qN2slBQn+JrvoZsaT?=
 =?us-ascii?Q?plozv2Rr5b+bOyWGz2xBl+VvvGqJj66I4xHxGKX7+N/jQgDBADJGgSOZXO7X?=
 =?us-ascii?Q?abwLwEtp3GmH2EsGHXs2pWeA5qfaeIZRcsWAZEeWduP+mxb3nKQMW0fS8P2m?=
 =?us-ascii?Q?Q2E7KCDUygnmW36TBMNPbDXOXh+qh2f2kOZvE1UMsu6c0nZ0nbleP1KKzbdn?=
 =?us-ascii?Q?bmkr77Facnxrz6DPwvMck/FWj4xX1LeATk2Xe4aSI8siq8xiIYM1dnQk63RN?=
 =?us-ascii?Q?imcFWD86woRuOkK60DH4iZ9pOOYxTq3/9cYQnxnrCYbfost0lxWHHzIkSrWy?=
 =?us-ascii?Q?BY9VpVherQVuumpQ0UEaPa7YDrsShrf/Vcw9lQEDeNo9c+1I940lpePiAhHE?=
 =?us-ascii?Q?fRGndLbOajpZbpgeS63ha+6sBgX9OLm6Cark+sEpW4QLF6EJsC0sFWj/OfK+?=
 =?us-ascii?Q?DJupscd9Lu5VqK8MhQK67mJ7C5DnYqcqDn37fWBHpzNhmDm42Q1belb8lzJU?=
 =?us-ascii?Q?rLgbdMrKiXMvMuNKj6k+c+kY8nf+nKFQIASAgmJWt696ZNC/Xyg/Cvy34vnl?=
 =?us-ascii?Q?s4M4h/i0LbGhCD/CfG6TzvwrVMEaGn55QeT+rYNKdWwhVGwRCPwS8MxDs6F8?=
 =?us-ascii?Q?YkZuX6We0EgWQMjdnIvUlBxYwrKbrqUJNt5L?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4443.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rGT4GV5485Qk0ZZQcFKiW8foHcXoBjmiNxIKVeF9HcHnmvOlb6obV4/kcllq?=
 =?us-ascii?Q?/5FbPXNbygayE5KJwq6uBR8sFDppa/UmVGWBUNm2ESVbMLU6Ha82hLtK0Fp8?=
 =?us-ascii?Q?zfJ5wrLHJ5fHIukkflSWtM3FtooBY77Ocqb00BoHLTFNFBrWmL8BMxNln2iz?=
 =?us-ascii?Q?uCHKhyUqO0fxIEKyiS8da6OeiKNRqhBiBQkVlRWODKXavHH9XYiDvqkTHT6U?=
 =?us-ascii?Q?gONHJg1YYdqcpzhBVQngHf0OYYEHFG8XnqI23laDci6vP6dOs6/6lmy9MxVH?=
 =?us-ascii?Q?Soz3Nl2PWEmAlWwPJNkGE7h53KVpD1NAJ1vd74PHCo0/vemobatmNgbmE1Wf?=
 =?us-ascii?Q?5SHz7Bu3iFcjPukkMpy9udevxZgAtk/zC7HAObnuyeteMoN6Fpc7Gs2qv/vY?=
 =?us-ascii?Q?douz4Xo2tAqHMBhqhVAcjTTwJypyz4pKtMewgqGJg5w2X2U6SLOnrdMg1LXb?=
 =?us-ascii?Q?+r79SAfAYltL0Hz4XnzmpACPoJAjjBEnt3ya9jfXCjo4ndXQIg9Q04AGEBg0?=
 =?us-ascii?Q?EpnrYM6hWk0QPjHu0fhshQaoY5+VHFtZhCzYgADghAJz0y1Gbv7W1GjHoWYl?=
 =?us-ascii?Q?7nQPC6hk0G/HTRBmkJSX2ikncHLTnfJAi2O07I3mgaCNti2PUoOkmSvwwiTl?=
 =?us-ascii?Q?imOn1ts8bYENrooCb+xtKGmEq7kfQROOopO3oEvznspITeJVB3+rduUWqMvR?=
 =?us-ascii?Q?1Q9azeDlbsr+0q3J9p+1p36tCvk2kalJlQ7FZFOP8LMZ9FLo0w10tnaj+sRz?=
 =?us-ascii?Q?7pO8TRoCS48u834p2eHwc/3UXsJf/ohxkGZN3Iz5LRarHYyyFzJDtJvq2Lqg?=
 =?us-ascii?Q?n4oykePaXjEKQ7JMVZ1LOHqprCWZqgwGIXZujUI+0eqCQ+pMuNCIIVq6sPQK?=
 =?us-ascii?Q?EXU/1MJAaAeLc3xMXSrC8kSwdP9SjzwRlywX7qGo8YwNv22PeEeFqx/Kt01T?=
 =?us-ascii?Q?il8fEa61or8vi9FgTMPdyiwujCJeXUzHH6O34xiDjOHmpdsW9Oq7c4WL5/UN?=
 =?us-ascii?Q?PZMXnNi2YNM0mgyAVgbRuyNf5E8GKCATuvCxfZitspTkuZI2PIC7CT10tZtF?=
 =?us-ascii?Q?djl2JGLd/abRv17cTqjfmaDYFlJzbVZX3HjB1WIeCFq6bBd/QRy0fZbgmYlJ?=
 =?us-ascii?Q?gar0xC0zr41tEorq2UBNuF38voQA2ON491pBES+elz9OtdePc0+oaD3PAW9j?=
 =?us-ascii?Q?wE0uaLZ3Ky6le9LSymH/CJZKwBJPq9nK8LHyP/1gw6dKDNVlf+K8zM158ee9?=
 =?us-ascii?Q?nRls3791+OYyz+xiMMAxeWwVOpVws4k+Ala4F1qYQODJaIkjmFiLFL92/tox?=
 =?us-ascii?Q?89HTwTyPWEpneD7A+JKIM5vuaGIH+32OhHkxTwpc/kuSt/XKoqpY9GYKGa7U?=
 =?us-ascii?Q?OM9uA3e2e/WODs2/Di/I1WYGAaIN5K7eMeUhagdejJmey6p3pQveLAdr7ufj?=
 =?us-ascii?Q?CMXx5On0Z7Q5x+yCYBY0NPjRsiMhXFMgbZNsHyTVh51JrvQYHUdm+YV82HMc?=
 =?us-ascii?Q?+B4GfY/0ZwjKqZlNBmsAzgU2XB1ZKip/pcIEf/UhUdb55GtjSf9WqiQf9XDR?=
 =?us-ascii?Q?YRfKLo8p9YABrwj5BNQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d773438-14cd-48b8-b681-08de23c3168a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 21:16:33.6629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lb5P7h8QWeRr/d2knAqiYIJxAZ3x5w5tyLVptnXhKzDENj3+Hdx9Ev3dilxfuxY+wGuJHyXQky8T6/GadoOdig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
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

LGTM,
Reviewed-by: Alex Zuo <alex.zuo@intel.com>



Have a good day!
---Alex
-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Shuich=
eng Lin
Sent: Friday, November 14, 2025 12:57 PM
To: intel-xe@lists.freedesktop.org
Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files failur=
e

Ensure gt->freq is released when sysfs_create_files() fails in xe_gt_freq_i=
nit(). Without this, the kobject would leak.
Add kobject_put() before returning the error.

Fixes: fdc81c43f0c1 ("drm/xe: use devm_add_action_or_reset() helper")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_fre=
q.c index 849ea6c86e8e..ce3c7810469f 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -293,8 +293,10 @@ int xe_gt_freq_init(struct xe_gt *gt)
 		return -ENOMEM;
=20
 	err =3D sysfs_create_files(gt->freq, freq_attrs);
-	if (err)
+	if (err) {
+		kobject_put(gt->freq);
 		return err;
+	}
=20
 	err =3D devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
 	if (err)
--
2.49.0

