Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C594D4A5EB
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 05:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C9910E357;
	Mon, 19 Jan 2026 05:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a03xKwgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74F010E357
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 05:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768799722; x=1800335722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cWafkotFYHfqP0BbhyhTVd7GAdk4XkNxXG7BJAXuMkk=;
 b=a03xKwgviqkDz7LI2iQ39KGm62uz1zfJt4+qDufhSz2aJLHdKGMpdWzw
 xemTMTczNDPGg/QI4tUCR0jBGxb5/47/x+E6p/5Lg8jfA05Bs5EjxrwUf
 O1RB7LIj7Dt+kBy2lhXXNv/iQnNfLT18xG9k7KD7CDlTWO/wcg4cnMk0c
 alNBS8g88TZzwB/2hm2CLlzV3SDHhY9VpyOrnzsPcMocfESG1HiyHHnzx
 ToNXQtOqsn6slLv3RwVMSMBXx+y0xZ3UDQPXdRyyHN1IQucq19x3orDJz
 MPc3hovNC5UQzmShYFoIvwDzTqgICEkV3XddmMurFIc+KWBBD7azKIBQZ w==;
X-CSE-ConnectionGUID: YSRKLCfzR6OKwivAktDKgQ==
X-CSE-MsgGUID: cwSkWiwARbmdvdxuVkfH0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69981410"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="69981410"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:15:21 -0800
X-CSE-ConnectionGUID: FDkKdGMGREGkO6pg8P62IQ==
X-CSE-MsgGUID: MnOfI+iyRMmATFkWW1Eleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="205829851"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:15:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:15:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 18 Jan 2026 21:15:20 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:15:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXyW/65XNUd/C36bwz72emp40mN5gvlU3lAdFWi/TXBKvGdMJrctFarEkc4xXCdbS7IiA95Pg/mwpDQI2DuwGZNuMlMfw6Qsu4Tosc97J4gxRD47Dkp7MkB+7R2Dj8yNip3k6ChO9ocSJTN8m+OKGbCWtJZRFtrcMy59+2W+i2JxPIRgtxCbPwSW4aAjmkgCVNmrxKulkb5v6C1wYhOSaOQOnSQv+uA1AneWOeqbjk6HNQ6wBtqTiVpp4cJ2wIPuNRWT/De0yiSbXX+y8F5B6hPayRqhDnT41kwX05QDN/B74jsx+ofPiPxw9aKttmmHTOEx1vvEYlEOIv9HwvD4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MQC/M89Nz6pAE6SpTIs58rFVqpG/3N/rG9dCyP0AOw=;
 b=SCrCRMqB+Dx46vDXx/U3cc7V1DcrbTKiMf1hBSREAeVuZkW5PrXWzFYu3Dxty8NAinCguNJYCtcqaLQqNtQZYP2QjWYWaiYoDk4TDCrgRXSccg6dgNpSCsEA1ypGnRVd7t2HuFesxI78aYZUnrm+dn+XxH96FTr4PXeP4eZ8KdEsQefbfHHW13lbTD4veMdssbELs28j0ZhAG6bC1c9IyElcaG4QqDJxRbQGq5QxfPwb6h/bZ4eRzIKVFHe9B3gRuPCXI531imBpEjSAkOjNSesJXa/z08fzO/vFlJcphYzaTJz5dCg3WwKhNGXnnfJGhK7DXBk8ZuJ4YneQYMF5ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Mon, 19 Jan
 2026 05:15:18 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 05:15:18 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Nguyen, Brian3" <brian3.nguyen@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Thread-Topic: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Thread-Index: AQHchzFbwJzYjZ7qwkCWj8BbtAmoobVY9iTg
Date: Mon, 19 Jan 2026 05:15:18 +0000
Message-ID: <IA3PR11MB8987A663916C092F585F840FD088A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
 <20260116214055.2882338-4-shuicheng.lin@intel.com>
 <20260116214055.2882338-6-shuicheng.lin@intel.com>
In-Reply-To: <20260116214055.2882338-6-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|IA3PR11MB9158:EE_
x-ms-office365-filtering-correlation-id: 1d8c3b71-1677-49e6-db3a-08de5719bcda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?7DyP1eWUp++Jbu7VmnmQfmIVf2F5x/Mbmb4hevcBrea6Vd9nLceNX3MwvuhV?=
 =?us-ascii?Q?NXkoa7vcUUk+lsRwKoKFTS5e6pOBV7HdEXtZcaKukgHeIDqZMaPkv9pW4tCv?=
 =?us-ascii?Q?X6etiYD04GVHueYqg3TKlA4C7Dwlj8f1eMpzlszaWZtp48wJkM0IiDhOBAIe?=
 =?us-ascii?Q?YZ50RgFIKBvIcoXpw4LP+AXH3FFGqUuHpv+9OGtsrac7ZkQmtGhU7XbgQvWv?=
 =?us-ascii?Q?CZ/otCgbMmreqmgnCNLWsTAC+GGEzK1qqlyxGTJSGnsu5dfTnXss+rk4Z25G?=
 =?us-ascii?Q?IKyJ/n1+CgZZHBAHZz1axNT5Ln7DV/9ssixKJoH5sHux4zfVYuxhQigVjEKK?=
 =?us-ascii?Q?F6pipCVUjMbl93DN4rk68h9cWlzUXwijwFv8uYlilFmlgbOnqb/lCgK+BosV?=
 =?us-ascii?Q?1awYwzN2CI62fOnM+aYz44u/S5aFewyFQxnj0C+KIJSxKSpiefATX9nkiH9T?=
 =?us-ascii?Q?iZ5V2Z4t7tX948K4OHPyret5WRaDUprpyRqp8TfwHgsE9lQxnC1Xd8+3xeYL?=
 =?us-ascii?Q?C5rD0uu52GFQ/oR3uveWxIxOd0QbKivClabX7Q3HAGiBY/Nsy/Ag+mUlmdah?=
 =?us-ascii?Q?OrQFy677U8G3Pf6DS+zLdR6JOmPUvZSVVM0H03gkguoYqJjEhwVNj7sRAvgU?=
 =?us-ascii?Q?NLCja/k3GvQNQpWcbIP8NGN9SH7Py39gw3Y9oiy5STFL7B2ZFld+WkT7HuMy?=
 =?us-ascii?Q?eVbPMw8lhWIz5Dqr5k9qMdhbxuG1d0kYpcQjtglBnQQyctOXabcQ4GuPJlJ7?=
 =?us-ascii?Q?2evvUkkBubAsVX22iy8AB3p1kvC94RJ2M9S0E/yJLp/q2t+loe+gkQxiv9q8?=
 =?us-ascii?Q?joUSPuTPZHcz7dDjuNygHvRq+1PCs0CexrrzLBODXeHV9+E1uzBC4fu54kRv?=
 =?us-ascii?Q?Os8FFlQmT+lEYd+UsOWd//mzmDXNYT+gX0f2D40pUpnZcpxOI3OOAPS60x6T?=
 =?us-ascii?Q?s8f/uPfUpJIcZHPW49r8cQN7t01r0YVCbbEDvwWe9JcdhGy+BtdcHhy65P0T?=
 =?us-ascii?Q?OggaOwJ3jpRVGWd6LPuTAlEgdPSvut03opx30VY6/S0lksY8b8Ddpplmrcte?=
 =?us-ascii?Q?zgEn3gKVjOMcZnqMIKS83GYORsWPnvRFzU39PX28ZSnfdwuP3yfCQpD9s73a?=
 =?us-ascii?Q?oM0YKp5P5LiRG5Jay8vjMO/Doo8AaTLj/RFmhvLHxfYdCvXcFRaxNTKtfqzY?=
 =?us-ascii?Q?DXYG/GuNH/r7MyAO4GikLodyX8X3A0D2oojqGLd5F2sxqUxt2vKn+vbkjrLj?=
 =?us-ascii?Q?spOsHd48ca1EChNiam7BO6xQnGDCHtkuF/K0a3NguS17wPtTtdp22BFArtQS?=
 =?us-ascii?Q?uRvYlGN3GFmbLXbbIWP+X97Olr3p0P/POAEBytSvl50uAcNKRxTFeRRX/9gC?=
 =?us-ascii?Q?WySQI3Na4T5EHZsdeiEEJOu+Irl0pTvdXx2S5SuPx3F5gYuIyR8fh+NQBW+Z?=
 =?us-ascii?Q?X8mFVehqQduvhASO8G2Bz013S1btl23HR9hglRkmKYqQzusQbMxIJCvGxZ5s?=
 =?us-ascii?Q?Bw9Q+OCQ0UGVadoZyRE3MhPYI9VmjhitS80kuD5iogoPz5oFXw7NNa9DxpZz?=
 =?us-ascii?Q?2AOboway7stLbbYWrubSnsuhUrCyNpSiNv2fePsDDVXwcRXsPOeEWEQ5DqkE?=
 =?us-ascii?Q?I6eI7+u244LAzj1sN3i/DvQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WDrHIY79eJz0JgzD4aTIORrfQnkqVe7rkClAFBkd6T2OMBsrtWfz4P/tuoM4?=
 =?us-ascii?Q?LGkvDkkk8tWOcAMDJSfwHy7uatltUpbRd9uKDfaNYjLsHq3ANpn7GHDQm9EN?=
 =?us-ascii?Q?n2ZvoDp74WpqsBthYgbZJviEdveW69wZxRsvvlJJoM0ABv7J56U+qG2ACRRG?=
 =?us-ascii?Q?yHQhhcVZ9V2nrmqDfF/5/09gerkd5irEFFR+Q0wDmWM1BN1SbOWb5LmSK8jL?=
 =?us-ascii?Q?U8PPmlBvMW+YABOPecUlVHbTQhGfBHvly71E2tHNYPk3F6Ns37OnyvqCWN7V?=
 =?us-ascii?Q?+5ptf5V+nsBu2z+CRVVxt1lo6GLNmvyjF1Y9ISx+/yp7iKFwjnhqtzRqMnxJ?=
 =?us-ascii?Q?EH+vUkMQaYKjWeG26ZNZ0/qfk3pDfxp+h3/vLVW+iZ5XQicU6Qddq0ZPa7Lq?=
 =?us-ascii?Q?5GxieAXTS9TQOD6L1WBk886lejxYQbjHPsAQSJusx+LlTHGogOlE/SkTsGv1?=
 =?us-ascii?Q?yQeyfhsYRzUVq4n6k1Xct6XTJtZbd8evtwe5AZDMN76iHJFg/4nwTXGxREv0?=
 =?us-ascii?Q?NxshiI9KjTrt4RIH1lCmXF1zQsB57uWTMn+QGihqwrlOZ3imty1KCkNZAmHQ?=
 =?us-ascii?Q?6SOfZH7p2AXIO5Xr08q2g+nWG2N/5ZPRCdDZ0xPCPBa+tMUxKBIKpP+jCYMk?=
 =?us-ascii?Q?PmKqiS/elw5pxuIrcJdeELFB8pl/u6jRbA3UvcQyK2opRuq6QfcbJT8YcpiS?=
 =?us-ascii?Q?pavzBCojW12lkKi7qJYvNJnP0CCmcxL2GieGbCt6DAdPb7XGOvD6+oPYsC1c?=
 =?us-ascii?Q?eWp8URs8sjmHoMBCDz+vcYrlS2tCnHRc8WekGYmp7PGuocDhfu1PDtx8S7Cx?=
 =?us-ascii?Q?mmjpAnLsf4jlW5x6GRPxtCVCHNYAS/H82VfnDOJpvfHNH5EWH/eG4qqUJdUT?=
 =?us-ascii?Q?SlpcDpIy/oQR8f5/Lr6ken4BtsuzDBr3oag6sPt2S6VxebC2308makwfDHyF?=
 =?us-ascii?Q?+lCuoXsrKkuLlu004XbG49Au0Ryqh2+VrVn2y5EKXj/Vf8XbhyHL3dPpl/wB?=
 =?us-ascii?Q?l6DuuJpOiarc1R7gvRzHIaqcguVHqj3SW6wRJ6Wt1VnlOBa260ggPF6vEXsC?=
 =?us-ascii?Q?kQ6Rp2x6UzNAV58OwWAcsHsBvODwvBhMDu0hfPidXJqe+PLnQnY2B4wf/C1Z?=
 =?us-ascii?Q?47CLJOwDer6s4z0kPbPFFmNleF7qZT9rN9MjeQQDvi8tILQC11HqlUtLZ8dX?=
 =?us-ascii?Q?9Rx1DVIaEu87aAVdNu7Mm7neuknGeOJwC6XF+oI/jYYoDEu6eMiGgO300EkY?=
 =?us-ascii?Q?N1kCQRdONdcyCQWKnrKlL6SVztuS8qVR90AAlOGWiluldMk8SClRtAqsHhqo?=
 =?us-ascii?Q?6ov+4L2F6tF4TOrRUeBWlHN5kU64ebeKCAUQpeMZox5QTOl67DnsBgS/YexZ?=
 =?us-ascii?Q?pEURnVU4piaynxJ+rTwyrrcrBfdYelM1pbp5TulT87dCaDS0E8q9pUbasl5l?=
 =?us-ascii?Q?VatXc+GmYA2SO0oGXDCBuM1eU6Vti1ZEHGFMA3c0UhEThZflB7+35+Urxm1L?=
 =?us-ascii?Q?Wl+cp1exZ2MdYRQ7Gl7I1YDO4+2zIUqeKImI4vai7B47uSQofG8QIfGt8Hr6?=
 =?us-ascii?Q?VTCdH91DYaKPS6ZRfRjLIhUNN+FYgBEqZbhJkwtqHP6uHyYW/sb9lKNIo9ED?=
 =?us-ascii?Q?eQkMUVThH5p4KYAF73pixqhoUxybo81/D5hkLHk7pfFXobncxEdd/30koZHG?=
 =?us-ascii?Q?Ia1z5os9CAdGGgxCcF+qKF8ik7iLej64vXS6AyoJzTk1vnru?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8c3b71-1677-49e6-db3a-08de5719bcda
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:15:18.7161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lcbnS5BhF74WYvLUxhb4+kyncDAzP9JkYAKXoNprpizL6qvV6qhCcuj0v8q4lLedSjAaj0qULbvJ6ShS5WZ0sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
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


> After a successful auxiliary_device_init(), aux_dev->dev.release
> (xe_nvm_release_dev()) is responsible for the kfree(nvm). When there is f=
ailure
> with auxiliary_device_add(), driver will call auxiliary_device_uninit(), =
which call
> put_device(). So that the .release callback will be triggered to free the=
 memory
> associated with the auxiliary_device.
>=20
> Move the kfree(nvm) into the auxiliary_device_init() failure path and rem=
ove it
> from the shared err: label to fix below error.
>=20
> "
> [   13.232905]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D
> [   13.232911] BUG: KASAN: double-free in xe_nvm_init+0x751/0xf10 [xe]
> [   13.233112] Free of addr ffff888120635000 by task systemd-udevd/273
>=20
> [   13.233120] CPU: 8 UID: 0 PID: 273 Comm: systemd-udevd Not tainted 6.1=
9.0-
> rc2-lgci-xe-kernel+ #225 PREEMPT(voluntary)
> ...
> [   13.233125] Call Trace:
> [   13.233126]  <TASK>
> [   13.233127]  dump_stack_lvl+0x7f/0xc0
> [   13.233132]  print_report+0xce/0x610
> [   13.233136]  ? kasan_complete_mode_report_info+0x5d/0x1e0
> [   13.233139]  ? xe_nvm_init+0x751/0xf10 [xe]
> ...
> "
>=20
> Fixes: d4c3ed963e41 ("drm/xe: defer free of NVM auxiliary container to de=
vice
> release callback")
> Cc: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_nvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c in=
dex
> 77856f460770..6d18c775d550 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -164,6 +164,7 @@ int xe_nvm_init(struct xe_device *xe)
>  	ret =3D auxiliary_device_init(aux_dev);
>  	if (ret) {
>  		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> +		kfree(nvm);
>  		goto err;
>  	}
>=20
> @@ -176,7 +177,6 @@ int xe_nvm_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
>=20
>  err:
> -	kfree(nvm);
>  	xe->nvm =3D NULL;
>  	return ret;
>  }
LGTM,
Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

> --
> 2.50.1

