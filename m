Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8A6C83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D48F10E640;
	Tue, 15 Jul 2025 18:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJjAzxYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49D010E63C
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752603913; x=1784139913;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mLmNEAFcOFUxgfEzypvr7ES34yp9W/2CStUE9mfR6oU=;
 b=cJjAzxYtp7DZWhbjost8uOx3fPxuvf/GiG2uO8ZVkj0pbD/pGPOAgP3L
 U9hwPuudcp/M89uPQWCrd/jeh4KOymsWRq2szaOinl+mCQ2Fjh1TZd6X5
 tJSxkgcr0U+KxJ3S2ptUcK5O0wlbjL2xYRldilSwUpHnRzwbx5aEFw0fW
 ieuZbHrSugCsXMu1QhxWKQ5PJWuoipk4s2Ch7zv+HndFVf800fRBBoQqk
 6ipPp0+gixrf3gBNfS7GXiHMbNwiDjpxKJJhUoRpIFAkEvvY2G+7klWpx
 lTG6omZw9YO1juQNCpntIGAQRgXnknzer+MxFVCSXcDnErqaYYhPOImwb w==;
X-CSE-ConnectionGUID: +joT5X4WQaKnjYGCD6w7hg==
X-CSE-MsgGUID: m1y68eYLSYm1UQtAlMnrOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54690878"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54690878"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:25:12 -0700
X-CSE-ConnectionGUID: nBwUUrNYT8iQrg9qfAjuSA==
X-CSE-MsgGUID: lhwQrXvDTpKBtqWo5PULeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157845395"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:25:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 11:25:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 11:25:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 11:25:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QB+FL8A6zAV67CCIr4P1EPGSgprQYLJhq3NH6LK6YoVTeSpwcDzNOImDtz0S6dWYWk3Qi9l7knnEi2cJziIWsuOHwJc00+1/f0CSxkW3CLm/ZMe5xjm9R8ujj0IzGk0BBJ6s4WBTsgDlnWWQFEujCdyEO0IyJs6YAj7K6tqsmagY7fVKwoC0DOnFDAhnnDwLGmrpwVZypqg2BXFeZiLH232qkneftjENmILZaWQ/siOGhZr4mcACjzoodN9YB+hHPUb8CKoG4rOIFdF5RoHR+S45LGKLsAiIJLEhOs67+sKvZWHZvy2ox/M0guX+y1lashtYWwpvcrcATCMRtpaRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cdq3pGohizDpqK32tTMTd/iHPzv/5fbGbwolFbcmFzk=;
 b=TYujlUfDyjig5ra6VJt3lt5mH9pZ+Xp0VHzX60kAWWk9p2fTDS6u1bmFeac7/Xnx1Ldk+xNylGXS4A+qYAqC0dLUrOJx2/xp/KLqXKxeF1FCi2ru5h9fyB1IvUK3/mcQTsdefRb2li0YOVd7daJJpSxzV4M9txp2f1d4Jt14wWLnvK3PivmJj9aM3mAPDnNvwsP/5tCu41SFC4HrqMte8h123nqV/MG9UlSORCyzfJFEjwL8woekfGptocgOVjAUpLWzPbwsggwpHuNXpOcLbFDrk5G0aCR/Uj3M4mlD5cBc2Acdzq7plkViiHHIlIcWW8k3n6cwtXQVp46YJW1RUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.23; Tue, 15 Jul
 2025 18:24:54 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 18:24:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
Thread-Topic: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
Thread-Index: AQHb9bRmPQnZvo1mEEyH84It6bFi47Qzfj7Q
Date: Tue, 15 Jul 2025 18:24:53 +0000
Message-ID: <CH0PR11MB5444C731316EA811DE6ADA58E557A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250715181419.807-1-michal.wajdeczko@intel.com>
 <20250715181419.807-5-michal.wajdeczko@intel.com>
In-Reply-To: <20250715181419.807-5-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB8551:EE_
x-ms-office365-filtering-correlation-id: 078825cb-75e1-4c9e-a980-08ddc3cce4f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zgNH+CA7anmsq9OOpL7GMbSqcuqjW4YO4R1Rf7QTBbwubYz4lDXN5KVP1PUV?=
 =?us-ascii?Q?12urvIuo++y4GrSlKPp9gEbqx5ZrhfQ6HxhXAQRobUAv06BQes15h/bV0Cs7?=
 =?us-ascii?Q?wm56t0KmSuv/+oOfebAUddOBE9Q+JnJR11na70cmxuueeM5hmjCkCkfcvo3y?=
 =?us-ascii?Q?TNmafF7dkvn8DsMoVvIgSIgdlX/uv6QUBJJxO2UW0+yZBAcqjfbcQQXp31cV?=
 =?us-ascii?Q?PBA1Dtm0xunIjlOTBBM/boyJ9x87nPnA8NjcHxJshodNhSlOxVvLjohdUkJO?=
 =?us-ascii?Q?wS37DJsNFvIcrL2+t74BLCjlM9MwFgxDGV+RksCOhLrEvoD2YZ5KFViyhUXR?=
 =?us-ascii?Q?nhkKoipNQhXWl9gKqwWM7XNPiwEPoFFOekuprgJftN42iPSG7L/QYCzyJXEc?=
 =?us-ascii?Q?VD9flwylSv3DlFe3lsuIdnM0Z1l2HrD/z8/3CFCkGYtmt+JimOOUe0Qnrixv?=
 =?us-ascii?Q?D89F3BBBAUGWAYMy7V4Jwn6pRz6y23AD0JIgFJkESR4Nc+3Ri4b6zNQ4RtkQ?=
 =?us-ascii?Q?8XKbcIvcGdXMeWZXTTu5oYLXwB8UmKI/hfpoYfPeL/ZjqQZMwYxl+eKSJVNI?=
 =?us-ascii?Q?Dwd3L3b1BeKAl1X/rLbVeNbzn81+RpRyE+QqnGBjL17JUbpoBb2YXWZlbqef?=
 =?us-ascii?Q?SXmS5kvEaQXCYtDd5M1RHfS7gQnGpPmkZhugT1UWr1+1NuO20GsKabh0zZZv?=
 =?us-ascii?Q?l+217aC5Cx26PBttgHiopnC3aQmhioTJ3HBujWm39GNbJvbJIrHYpzyeXlZ2?=
 =?us-ascii?Q?qlD5s6Hy0g8myT6mJoq8eM1bdMFVfSDPE1F5etNRhzUHW7ob3dD3NHZ5wP3u?=
 =?us-ascii?Q?aDa+l5JTsd0LUutVkvOvA4IBN02ubj3HkWzOVefNJcKqcQt1s8HQ9/LQdBqi?=
 =?us-ascii?Q?T+TjqnXY6xz3iMGSyS3ML+wlsy/nJOzroAun8dzTO/K6/KjHV/1XdwFcihF0?=
 =?us-ascii?Q?IHMtiKiohdBw839NXuW6yX14lh97PW5JAumPjisOCnEQecrdWSv3OxekOXFr?=
 =?us-ascii?Q?S0nZ0U44504OcIuDea9rKTRZTXUtGhDQcDxbiekmwYeszBm5t8ARUM77NwrN?=
 =?us-ascii?Q?UrIEso5mUUEoqqiSaU5h2whXOHCiUq85pMIv7wjVyQC6Q5Ik8RsIKgb+j8Ix?=
 =?us-ascii?Q?zNzDuL28xlYMzp5MXmVi0YEqbRevsLuy9M8VqBAg7FWqTvq4q0Ls2LB+Hjby?=
 =?us-ascii?Q?TdDa0p/3OnclWKZBWqwlI/dUCnBk43i5W21uhunQ/drCizIwIGze/F3+Ej8p?=
 =?us-ascii?Q?a41oORT1+N1z0XAKZe1rNp/1lP+JQj4KtJxUrRyPEjpeNssG5EtN5fMrX5Qy?=
 =?us-ascii?Q?c1QFCm74ixhTYWDZQQm+pbR3k5HqRt8zH7lgws+Qsgssm0LHHQfVPXi0Rkph?=
 =?us-ascii?Q?rjYjb4pZLxU4b5KiHfrR3C3/ayUFw4SYpaEYYor2rmSltc24RkxaEME5Cinw?=
 =?us-ascii?Q?Qd2EDGkVv6g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FQaf3DiaSSs1JpFqc391Aj+nj05OfInP8yCqBYi/ErObNRyTSY1TivHAYhad?=
 =?us-ascii?Q?+yP3jtCXnFPV/kkx/Rp0stzO+tb5lbuFf1MnuK3yIHnm+QoK7Jw2G0pw5KJV?=
 =?us-ascii?Q?n2W3eGhkxOzoFzkEzW5S6a8tDtV9gGoocES1hkGtSU/M4ZOblly3MrXIyUeK?=
 =?us-ascii?Q?uC1Ghu9mVJ9iV+mJILDuYydq1LphwhDIg4ySRi6vrCHW3Lcwc3klHCLfhkKD?=
 =?us-ascii?Q?O92wQLay/aWDdzFsP++9UPg/uJglLEDQMD88eMs79Om6WC5OaXH3otGbVNrc?=
 =?us-ascii?Q?oH3Quo720OgcYnMEk5x0yDH31o/3h0pmZYifrqj6C/7Zc4CSVRwh2DxM/zYb?=
 =?us-ascii?Q?Pw7HUQcGt9Mk6g8Uc885xbLNbhEelIHRvjl1s2FpBI2sQu6bYmYzz9h5bsKD?=
 =?us-ascii?Q?E+vmhg3aQ6NVMAgB7AqmUsrN+kDCVA7wDXOQ5Ic6g8FG2rMua4zBRTrFfjO+?=
 =?us-ascii?Q?s3j3KLKvPWnvds78gpZq8vxmrDiuepHd0Bqj0XSaGBZoOQvEi+KOCaHw+T0r?=
 =?us-ascii?Q?igRXZKkGaJO0z9/vdMu/zSbeIPCx55DXlC4pfwn/6DwtmGiddcV5AEX0q/fI?=
 =?us-ascii?Q?X+f6vCrMcr+oe/24nuXLQZD7cdtm07TQ9F2dTSkfZTxo+abppKMnRlWwRd1i?=
 =?us-ascii?Q?CqaZY1ef2IKzZLB4OLHeXsMLtoUb4ytO1T4N7cmsusXVnSsm6cSj9I2bvuOP?=
 =?us-ascii?Q?Bi1K02+uvtytB3kGNYaEz8DbR116xsWdqcmNwEpPAOoytk6cD99uemRrfcHx?=
 =?us-ascii?Q?AAPAbaBfloDSQKa2qY+t7OCq/ZfQDy6ylOzpz051Ii2I8s1oG8WbXKQe8VoC?=
 =?us-ascii?Q?MKzMtj0ZoE3Nv2w+G/BiNLR1KEO3zkfQA57ORnwYkYZBIH9dzlYpM3wfU+SE?=
 =?us-ascii?Q?XX9x7knefTbgc42oJnrINqPTRuJvkXMUM/CeCoCeuGnOneS9NbmJScYxp/iS?=
 =?us-ascii?Q?Jn5iEQXv65E9wFveEWO+uuW8whnwbRlz3OnhlUnwiRhhO9++ex65mvOm+70n?=
 =?us-ascii?Q?J+myixRH1pYUC8W3GCI5PmYqpGYcI9o9f54BjGwgXcUd/qvfB2WDSntGIffd?=
 =?us-ascii?Q?qZhY9dYkUlPEh5UA8Tq4twBm1PpgopgbiMtPuJZ3pqatrGeRPk42jenRAgMb?=
 =?us-ascii?Q?vKAGsdU16STus11Oov66gjcd/qQOGC4WOo9KYu4vETnR3jQDbdmh4pSKmyXo?=
 =?us-ascii?Q?5jGxtoxm+11CPU41qu6nyEwKGroRpNeaNGlTtUfTY1Sd5Jn21G9YcPEKP0mk?=
 =?us-ascii?Q?9vwwHqiu9ndtu4iD2LwR804aOmIf9v3opoeV2d5aQaszdeCjknG2Z3Pm1P+d?=
 =?us-ascii?Q?a6jgnXGhUa6SUOOrR4yjvhM2JNVYyXxXg+HdkvZ/PXo1wDYjdmWYuqozijcj?=
 =?us-ascii?Q?8kCJ4WjVRakZDpIarLiZsCCBdGvW8nML33DM+U3D2P0gHccV/tGDiFph/M0l?=
 =?us-ascii?Q?gXQN/npHUlUnJKfJf7FreyCysn0feg/0RjM9seBRLopFQZuAj/EMnnKFf0ky?=
 =?us-ascii?Q?KxYs+LiyDPF7A+YNQUsbBpWFUh2BECvZV8xtqgf3d7J6ioQvLQsmv1vB50Oy?=
 =?us-ascii?Q?jbXAUN10WgyuuxlfQcGavhnjvUIk2T4cV0bKRlxKVG02rax+VQPzwNDH3rKd?=
 =?us-ascii?Q?WOAeCjQ0AQMJEAKjvz4Wyyo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078825cb-75e1-4c9e-a980-08ddc3cce4f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 18:24:53.8697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zdwucZQB2oPbmEI2z0tExtSDDBDJ1eRPUd8cP0CYsCGgUNY7bEOKG7AVK0bPfvNNz4QBgWxB40kYzMzX0axTds5wtqaCN1SP8lkxFdtfNUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Tuesday, July 15, 2025 11:14 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Vivi, Rodrigo <rodrigo.=
vivi@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Thomas Hellst=
rom <thomas.hellstrom@linux.intel.com>; Cavitt, Jonathan <jonathan.cavitt@i=
ntel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
Subject: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
>=20
> We should now have sufficient changes in the Xe driver changes to
> run it on ADL and ATSM platforms in the PF mode, to configure VFs
> and successfully probe driver on the enabled VF devices.
>=20
> While some more changes are likely still needed to fix all corner
> cases, we will not find them without running any tests. To start
> testing this feature by the CI, we need to mark which platforms
> have basic SR-IOV support and let the driver run in the PF mode.
>=20
> Since this feature support is still in the early testing stage,
> make all enabling available only for CONFIG_DRM_XE_DEBUG=3Dy and
> keep it on CI topic branch.
>=20
> Note that from this point, on selected platforms, the Xe driver
> will be acting as a PF driver, will some SR-IOV specific changes
> compared to running in the non-virtualized (native) mode.
>=20
> However, those specific changes are visible mostly on the debugfs,
> and should not impact normal driver execution, unless VFs will be
> manually provisioned or explicitly enabled.
>=20
> Once we finish adding the remaining SR-IOV tests to the CI and fix
> any issues that we find in the meantime, we will replace this patch
> with proper series outside the topic branch.

We're reapplying this patch with the purpose of removing it from the
CI topic branch and putting it in its "proper" place, yes?  If so, then we
should probably remove this sentence, as the replacement mentioned
in it is being done presently.

My RB otherwise stands.

-Jonathan Cavitt

>=20
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20240711192320.1198-3=
-michal.wajdeczko@intel.com
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> [michal] rebased, for drm-xe/topic/xe-for-CI
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 53d45779cbe9..dc4c8e861a84 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -193,6 +193,7 @@ static const struct xe_device_desc adl_s_desc =3D {
>  	.dma_mask_size =3D 39,
>  	.has_display =3D true,
>  	.has_llc =3D true,
> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  	.max_gt_per_tile =3D 1,
>  	.require_force_probe =3D true,
>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
> @@ -210,6 +211,7 @@ static const struct xe_device_desc adl_p_desc =3D {
>  	.dma_mask_size =3D 39,
>  	.has_display =3D true,
>  	.has_llc =3D true,
> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  	.max_gt_per_tile =3D 1,
>  	.require_force_probe =3D true,
>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
> @@ -225,6 +227,7 @@ static const struct xe_device_desc adl_n_desc =3D {
>  	.dma_mask_size =3D 39,
>  	.has_display =3D true,
>  	.has_llc =3D true,
> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  	.max_gt_per_tile =3D 1,
>  	.require_force_probe =3D true,
>  };
> @@ -270,6 +273,7 @@ static const struct xe_device_desc ats_m_desc =3D {
> =20
>  	DG2_FEATURES,
>  	.has_display =3D false,
> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  };
> =20
>  static const struct xe_device_desc dg2_desc =3D {
> --=20
> 2.47.1
>=20
>=20
