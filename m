Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79859CCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 06:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBE010E097;
	Tue, 11 Nov 2025 06:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSdIVoNn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FA110E097
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762843562; x=1794379562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nq4eDuhwHHQie3rknuTQybYWm+4U3AVIOFEeRI1hd7E=;
 b=fSdIVoNnz/1vBzvzs+bNbkqVu9HbMha57otCoEFWbxrbTcwkhNemxSoh
 GwK0pe5KdM0jmo9u4UtHXQVSci9/ABSlstPCMttFYeWHG9188NZyiHFu3
 WviX3+hN5O6AdGDzYVo6RPrBR+pJqm1UEaUd3ChYfh72mrbRMW8ZU+211
 KMG+ZYACgKkhUTM48xFDuF7lLOrUFiOEJit8PZzWiQvBxF+X6O5qVSZ6I
 epb4jm4sNxJ2Voc++IdWqs+y3XTrLFdOKFwTLfq0NI9VN1T4oXVuSBfy2
 CsV8nX4RdlPnFnHRhF2o7s9MFtQZWCoi4Q8eOozRRrRdWLnVJdWOHCulo A==;
X-CSE-ConnectionGUID: wXR2v4QZSO23CDOV8Yg5Ng==
X-CSE-MsgGUID: RLt+T+YRRgGYoLFr866xWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64605261"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64605261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:46:01 -0800
X-CSE-ConnectionGUID: VKzW9yEhThGSZbRtzipb5Q==
X-CSE-MsgGUID: DIX83NwESfK5eZWUT5hVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="212275124"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:46:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 22:46:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 22:46:02 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 22:46:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pbpw/LG3PnGH4hCxwfAwwf958hII8F2iPZt6sxiMzEdwP7qUgV2C+f4qbprnClHyW7uZsnQN5lIQnGUQ4X2HiuGFkFghxUfcTrBBdiEJS1jJVD2Bsr6+Web3I1wd0UZMfNF1Drngv0LeRuXLlSw216nyXfB0cUK3BXsaML+LtruY0aekFR0ckvjGvK1ZDO7BRBHHKcxrFC4RT6etqPer/Iw/xXuj5ZKotUiQjaPAeaxfKo/3iLdjj7Aj7IKJqmd9e5JJHdAqOBWZt/Fn3bpaoS4KqeqcoSB5AYaybfNv7sALUtORLyUF/EccAyFQj6kIfzmR3vZ80wolhTJqUWs1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6kjlEnqqbMkPWLWYNxCXmaz535JFcpatlUTtANvKK8=;
 b=a6MpRxhkx/hTbon5nfPFRbrboisLC0SyV91+PAtLBqDiN1cNNgWZRQUTS17C/4SmPhi25nV2FzitmCyn1gYJpm6jQ6i9LxQH+OhB9xN4zFK5mvuAFHZmsUF5g9SDY1uUEKC5OY362WO4+jH7v96r/zU32L11TOd1BqvD8fQw22bUwQqgDn29HK9l9SyJzvQUEfKScy6BlFM7AJdReM8MUajmbgbaJObXwcR9qzW+54i/zmgrc17uVpmWyRSo+umHaL9jZ1jygP8/y4AJGP5Z3l4OW1Ej1rThZdChjxCOeBFm8/vwlqEVhBShNe4DbVvLjS+sNNry8cyko78OlJ2mDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by SA1PR11MB7698.namprd11.prod.outlook.com (2603:10b6:806:332::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 06:45:55 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 06:45:55 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 1/1] drm/xe/pat: Add helper to query compression enable
 status
Thread-Topic: [PATCH 1/1] drm/xe/pat: Add helper to query compression enable
 status
Thread-Index: AQHcUo9/6lZefvN4W0GS/cHHPCa6L7TsmDYAgABn/NA=
Date: Tue, 11 Nov 2025 06:45:55 +0000
Message-ID: <IA3PR11MB8987BBD03E967F6212636966D0CFA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20251110221458.1864507-1-x.wang@intel.com>
 <20251110221458.1864507-2-x.wang@intel.com>
 <20251111000354.GM3905809@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251111000354.GM3905809@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|SA1PR11MB7698:EE_
x-ms-office365-filtering-correlation-id: c3114f1e-ca3f-4701-797a-08de20edf6e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?a+MbPLk39TKwCmZAA5kp0Pim/mg4uLvbK2/QccS7rREY+/awziouPa9QB/tS?=
 =?us-ascii?Q?uSPu6ypln3GzZCAVS7V7vYnZm8m+cp/WFAEPU4Oin6Rtw/NnOKqBI76ijGpl?=
 =?us-ascii?Q?boEDf6lbQg2z+erssYd96dj2NA4lplIUsE2+/TV8mmXi7zr4cL4zHmzVGFUg?=
 =?us-ascii?Q?ayQEu0x0OJIrdsCigeVl+ueU/cSx+RbIdW3ox2KWEx3DdjZ8PNSC/0Rcov14?=
 =?us-ascii?Q?7mXDbt7WJxIbWsM60SbP8+8QTlFZZi2JeaHGCZnAuqVKt5d7edAivGaUnjZU?=
 =?us-ascii?Q?lxTevFo84CsKagx6s523F4gN6IA/jtxVQzD+6S/YtfagiFyr3+fEa02CW0cJ?=
 =?us-ascii?Q?DDuBz0I0GeWcNSRr3HPiCRCHUMZzxYsbGO5c6N8mwUYhFyhLg1VXm3bzrK+6?=
 =?us-ascii?Q?0H5zOOc7WHhVu7hJvqLdiU8T9sjdeUIEXsg6PwQTEGFQNVddFPRSzhdgX8lW?=
 =?us-ascii?Q?FyRkSiiSe13jsbqthUc/cgdeJ/7nvEUzkWHM+2RYIxykWyKIrFgNxuIW8JG0?=
 =?us-ascii?Q?ks28xtMINCzke+8Z4Ab7ZxqfTkEekGDvbz2XYmScyvP72S50h5vNw6yoekRC?=
 =?us-ascii?Q?6LjPlfbsg34u+CYfSN5bPAtSENLPnmpTkEqq7iz7wFd3PQPL8jXGvAAmziEX?=
 =?us-ascii?Q?gIScnHu2bwHlDZPxgchbhc7/68GLgyWIvuU37SYHy70jQ1CUTJWxOEKihmBZ?=
 =?us-ascii?Q?f1FlrPT6oSFqVQ7Yrvo0o66aJyhCrkUn8HM4osaWaUaZxYDo8FQ4C82HR+Vx?=
 =?us-ascii?Q?HHIsMAEeUenzNF5UxF5uv9Neqan9zrl3s0kAivkzO9SZk+IqXSIDkM3BRNFA?=
 =?us-ascii?Q?vQB8HO0nk2yL6e7PD6raKs62B5YbURk6UkfPwWl4kHMQHscsxmLWno0x8lAD?=
 =?us-ascii?Q?+RWhVcZovGUnzbUGDe/isT02xja/gJ9FXMqDajJkAILpc2s6JZyfmtAAkEuj?=
 =?us-ascii?Q?wLL8Q0wjzKFuLD5pGwK83Vtiye/CVv64zPIpZsrlFZtGIKnUbHfQYw0Knhpw?=
 =?us-ascii?Q?vByCtmbYKajCK2Sg2TgQEfhSJbgzGziAtSUmsCO+m7OET+D5z9gctXlEQBXH?=
 =?us-ascii?Q?36Mt6YQETXOlHyoHpe8FR0ebU+t9SsGH7r2vAsWjDLiINlXlFvqGaxgMV8K5?=
 =?us-ascii?Q?Icw+X4uW8oOVexrZQ/HutHdcDoe2mSmIo2uSi2blOw+yPVLo8tPR5FXeQryn?=
 =?us-ascii?Q?VEaqMork/fBeg0RwyiQwq6QX/Okhcz1mhOUohj3VUWJdSniGZTCfIgXTp4m7?=
 =?us-ascii?Q?yhHZ7OGNSWre/RlluFS/oL+q+6kpsgP3Mi24LwLgP8VdKXbsEkHeOq7jkOQm?=
 =?us-ascii?Q?pjS3/TkDOh/OihnbxLA5tdtiw9gbq03E3Tq1CVNpBwY/1GVD0g0jYb1ALF+z?=
 =?us-ascii?Q?cu85blYFKCU6VWNq4HJ+TLpYt8MUKJHKdVpRwg5ChFH8SxFlm+6Lt9STKjs7?=
 =?us-ascii?Q?jvmc91L8o0SQlRoNOGznMuwgiwcJ2mu6TupkZiRzLbwmF8unG+M30w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R1FHHwk3LsV3gvmjVQjKkEG2PUdpi7bA6Urhc9TaS+gjvzWXLJxhHGCx8KBQ?=
 =?us-ascii?Q?DKnMoxJA74XRNJ+D4LLOGmXuES6B5X7QzwnrrCidBJKBEh7z5T/GKizAgj6k?=
 =?us-ascii?Q?Qbq4dcDDxiKniSdNPL2dvmXD8FIbHB0q82aX3zjSKzkR6rXHpSPhdiI+8y20?=
 =?us-ascii?Q?YJSY0kRgHX6ml292egl8HUlT+zCEQdrKpZU953lEIbTTUNjSZ6FU5qBddRGf?=
 =?us-ascii?Q?IbbHpmWObjtjCB+Xe7chyqgcRvTOIn0tVL/gru4Ery5/uolvuJwC4oq2Y/Mi?=
 =?us-ascii?Q?ADpPknW3VaiDAHkx8+otSWgWxZDGMY5DRf14bVIzOPOA8vEaDtlgR75q8IkS?=
 =?us-ascii?Q?c7QGiMMUZvoTbLxUthKcoZPHqS3jXIe5MhBQDp+AEhLiG9Y3rAz0/pRqOY7M?=
 =?us-ascii?Q?Hxp1CiZDqpzReyPCE8+MYBMcMpoG66HGrdSvsinavQ8zIx1pkGkfp/v69PhC?=
 =?us-ascii?Q?JMRCMM1acKkQR+Gq/7tpIAPKjoZETRr2aa+tPWRIeYfsuccrWvzqRwkIFSQv?=
 =?us-ascii?Q?9Jh/v/8ur9yRMJXLiZJtQHuqeMIbDqdinAnMqacbeU7Vyuq35ywP6B2KDTOd?=
 =?us-ascii?Q?RRxvXSfYKP7fuzwSOyZacepumPNOud9lHzIeylbIvxUdSO9LDG+P7QvMlAAU?=
 =?us-ascii?Q?O1LeJXO8uQNk7JlS6XBumxp8QsolpxJYjIVAYiy1NppfUV+eX815/pu2U9sL?=
 =?us-ascii?Q?RoLR+DseEQKVOe1d/NdAImSOqkZYxi8Ypzxb60C1S4uYdM5P7kbAW8KlZ3qE?=
 =?us-ascii?Q?+iLBhftxfKx6HEMNFxWCBzpYA1CO8q62sPrlUuB8BdyQpIm5UXv+qzkDJAa9?=
 =?us-ascii?Q?6HHeql+2/Lhw8fMXB80arW6sO6MwxnMdUsRPTK4XpGBRZ9y45GLEts4q4Pkw?=
 =?us-ascii?Q?WPTxdXILQCgUx5TQ+2d8onNb+Wj0IfmqApxzPcCw9qxup+PV5ZqGLKqpFr7A?=
 =?us-ascii?Q?gq2lJxcPhiwL9m+6AK6ARVvF4ZkASN0tWbTBgvSyYOvB8ZiCZRTw2KYA92xh?=
 =?us-ascii?Q?v+oV0le7ube1JvAXXq+SXR9zSH0lx5GlE+ho/w6mDx3MCxlqf+697GiWYCsF?=
 =?us-ascii?Q?AceR4uR1IfwKZjL8QrTs1rCOm87NgPEj0aBB8L5lL9w2aSjjFJFwSk6z+Ixw?=
 =?us-ascii?Q?svDL9XNJN+2JNA6S0HYNDSaOXtmi8E9965uLVTvBZGLYhYiKjlasIESwBoBd?=
 =?us-ascii?Q?W4Ypsq3F1f8XzhRm/T3opDyr/OD+Zgex5Ru0Grwi8KgQlb2HLMxas9QLeiJT?=
 =?us-ascii?Q?/ZaVUgNeKwjV/ez2ZBZeXeDxCXVXLt2zZM/kt/t+4sHGM+MEpcwAH/xr+J5F?=
 =?us-ascii?Q?C1V9WtH6EwvEUNG1Qdueb9ZZcGHfG5ie/bXlrWf+wneC+qKO6fRJH8yHnOCN?=
 =?us-ascii?Q?nGA4vMiNUyrXx+BQfVOOZUDWjbDJWaxkXEUf/cQx/buDptQeUfMLsRdA3r4f?=
 =?us-ascii?Q?dmgAXrwsvYb7bQ35HyV0BCQAq0QNIFYyF0rGl34f8Go3Bn1oOlUN/f2TsbKs?=
 =?us-ascii?Q?ce2+q9GZKmjnD+rH0hvDBV/uc1v4PgQDLz9xWaTLkBGgGIq8Zn63n0SdOAJD?=
 =?us-ascii?Q?pCqhowZCAFb8+fYWtpk/bb5X6EikOpcnukJM6Bue?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3114f1e-ca3f-4701-797a-08de20edf6e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 06:45:55.4431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UKtG4HXqE237jj+GHibBiCDaow7YxPqx5J8ijyZc7DvxK5Li9bMvVel7MutpILD+TnhZWLRzKPSvz4gbBk/hdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7698
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

Hi Xin,

> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Tuesday, November 11, 2025 5:34 AM
> To: Wang, X <x.wang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.c=
om>;
> Zuo, Alex <alex.zuo@intel.com>; Gote, Nitin R <nitin.r.gote@intel.com>; Y=
adav,
> Sanjay Kumar <sanjay.kumar.yadav@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>
> Subject: Re: [PATCH 1/1] drm/xe/pat: Add helper to query compression enab=
le
> status
>=20
> On Mon, Nov 10, 2025 at 10:14:58PM +0000, Xin Wang wrote:
> > Add xe_pat_index_get_comp_en() helper function to check whether
> > compression is enabled for a given PAT index by extracting the
> > XE2_COMP_EN bit from the PAT table entry.
>=20
> Xe1 platforms have a different PAT_INDEX layout than Xe2, but it looks li=
ke bit 9 is
> reserved and guaranteed to always be 0 on those platforms, so this helper=
 should
> still work fine.
>=20
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>=20

Thank you for the patch.=20
I will rebase my series (https://patchwork.freedesktop.org/series/154714/) =
on top of this patch.

Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

> >
> > CC: Nitin Gote <nitin.r.gote@intel.com>
> > CC: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> > CC: Matt Roper <matthew.d.roper@intel.com>
> > Suggested-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pat.c |  6 ++++++  drivers/gpu/drm/xe/xe_pat.h
> > | 10 ++++++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index 68171cceea18..1b4d5d3def0f 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
> *xe, u16 pat_index)
> >  	return xe->pat.table[pat_index].coh_mode;
> >  }
> >
> > +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index) {
> > +	WARN_ON(pat_index >=3D xe->pat.n_entries);
> > +	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN); }
> > +
> >  static void program_pat(struct xe_gt *gt, const struct xe_pat_table_en=
try
> table[],
> >  			int n_entries)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > index 05dae03a5f54..b8559120989e 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer
> *p);
> >   */
> >  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
> >
> > +/**
> > + * xe_pat_index_get_comp_en - Extract the compression enable flag for
> > + * the given pat_index.
> > + * @xe: xe device
> > + * @pat_index: The pat_index to query
> > + *
> > + * Return: true if compression is enabled for this pat_index, false ot=
herwise.
> > + */
> > +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> > +
> >  #endif
> > --
> > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
