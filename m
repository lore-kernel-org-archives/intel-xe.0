Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42F4C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 13:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771FF10E49D;
	Mon,  7 Jul 2025 13:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGG555Wx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C6C10E49D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751896584; x=1783432584;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wgEJGW4quInKERavETmH9qaVhtF8h+eAz0ihoSZFLvI=;
 b=cGG555Wx4KsN1ZkHTu+2MUNMFso8ajkFiCUBmVSxnGp7zOBxoeTmXNoK
 mj6ptDDkGjaaqTP2HHYId7zOLwYEsC1i7KTIZN5zlI+tY/TDVj3Gf3++p
 jX0mVsQclV7GmJgFxqROJ0I1AxgM/ITp+Bm5Ult7e55j68H9rQlJyg9Cf
 5cYYFrgnZ4Y9BWoAPPQdt+M0EQkZVKSp9MmyoSETmKqLPQvfRxm0/kZmr
 USWMblgzUrq9PTvz4xiiUtvTuvL+kes9LVVdK+nOXWiu3e1I2tlhmHc9G
 8pjQHyk9e0AeZ2rtxNLi979fjjeKmx12QmdvKbKBsY3lz1q9jDm9Bo9P2 Q==;
X-CSE-ConnectionGUID: H8vfdndATXS5+Vx2LDHFAg==
X-CSE-MsgGUID: W8f+D2EdShOnG2u4rAzefA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57786890"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="57786890"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:56:24 -0700
X-CSE-ConnectionGUID: xIjzhR/BSrShQjJSJjmkkw==
X-CSE-MsgGUID: lMXFj/3dSNWo2EbXYa3hZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="155316487"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:56:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 06:56:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 06:56:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 06:56:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9QzpJmRto053/Luw8TmdfOCBnjVogUILU3tRmWxP5Cjp+i0wXg3jN9G1OR5qF9EPD6f3hi5xHgX+9TPzEa2HBg6q1p9+Xa65zgxRxNnKSTwzQ27ZjHbOGBCdCV2pzZpHsPbGiTO7d4adFurkHYfr/BZ5jl68Nj94EpXQYXpO6pxO3LTggWQW7FbnDn/NEMod62/+yYd9P74u2FumxYLcnnA0N1J/qX7s3eK7sx6qosfvbmsJSoCJG728NzAm83u65OLI8QoR+ek2V4Xg6oTZxAibzYJvMb9APkJoT6MzlluaJE5eoE/dgMXV1KhOZuqHHUAOB8ZI/ns8bFcSc0PaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qtzxq+pa0e3DLFLwWMb0qTCAaSxXm30s9oaEUcVA2M=;
 b=CwlxFy75gMXsr48rsSu2ZKlCikqT/CIlpM7UmSy1+O9ymf9BFPum4qNEG5P2A/mT8TRMnoo/HpaopPQ2URHgq6421sX4B0O2KhcDWL+qPAeDY/+ewUGJDqsMETVO370X++lJVyp++nGiO1dAHfR4oYNXQORWVjZq1FXj5cWR2220IbG/hgx6f0uCTk0pr3vWOT/QCWJphmHKUh6bsJuFXeMrMyun0GtxsWtjIppF/7zS9UHvlqTRlqjz8RYgmJalOWvJAZ4cBkLd/A+yE4UAl7rLK3dNYqCf3AcmNkf4IjId8Gi20U/ajC63IRwh46vTAF2OXK+m6VShARhiU6qLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 13:56:20 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 13:56:20 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Topic: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Index: AQHb7GLf/swB/5MSzE6vZn1OzlJQrLQms/8A
Date: Mon, 7 Jul 2025 13:56:20 +0000
Message-ID: <CH0PR11MB54443606D202241399E6692EE54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250703213845.2259302-1-zhanjun.dong@intel.com>
In-Reply-To: <20250703213845.2259302-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8686:EE_
x-ms-office365-filtering-correlation-id: 4516c7fa-4657-4479-b81d-08ddbd5e0d55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UbsERFOP605Xvn9P3cO/AAe188Jzyc+gq1lo0baj+S7PxBFu5LDfPEnqhudZ?=
 =?us-ascii?Q?1Zl5oX7ICz8ZiNMxm3WQsl7Jm3n+8KiSPqkU/9O8CBWbrVqEZ47fDVNjL1e7?=
 =?us-ascii?Q?I/WcbpCB60VEFfbkbhV+VZiOBm30To5+QqTxaJjXZGa9moIkLTMtRJ96lyO0?=
 =?us-ascii?Q?/Q9/zCrYIxVGr0TjNDDQC6ac7LZ+RBD3Cwbkjj0Lw7pmT54a/Gsy5KR4qxCx?=
 =?us-ascii?Q?bYqg2Mr7+eMlTkrpT+m637QgeQ2Gi1/OV4/TaKkG/hSZ1vEw6JvGtvahIK8X?=
 =?us-ascii?Q?pmxe/jf3oKTpNBdFScv0SxcQ7DghbMYHx0HgD4B0JDS3BEKBY/4sff4uXT8S?=
 =?us-ascii?Q?EMyxQWSG8kvj/V3b7rxs4Th9paAlz2B4HmUIuqxllxvXmApo9Gw53jAKqoDc?=
 =?us-ascii?Q?Jut0WQYzJ/+LJ0JthH5yTvDSYkHOjFN1DmiSnImByHlsfquUNQgEKWmHWwqR?=
 =?us-ascii?Q?Y5UmQcoKz+ifsVMGQrS/S+1fd2SYCA737YxPAaVeYbCQrxW6Ciif3z4xdaam?=
 =?us-ascii?Q?hPr5ol9m3QUCxbt78KsNtMshHLe7t6LcfFBAHKitqEbzl5Okh9DW78WUhn/G?=
 =?us-ascii?Q?fSQhmQCwzZfl84CYcIytQ1AsNJN9J5NkE2LYDYp8eyBehYgdVDAv8TmHjnP5?=
 =?us-ascii?Q?ZKH37pbpBNLJFAQ+GohqZfjfPlxH/id7fkyC3z3Z7ZSsiE9YhUBpK9in8fDJ?=
 =?us-ascii?Q?PdH2nszw4tnjWubWp0F8Ad6Ns28cEapEvlryG+Ze3VZl+4niGdLGAcRpWYBe?=
 =?us-ascii?Q?NMyrdr6ZyDE9kBakfe8TUW4VWN9+gAkykIxqbHOd+uFSLG2MO+HXDeUxN1Yh?=
 =?us-ascii?Q?IIUPFr2xpKnFkxTGVHneQFxOeZ5ONC8hsyztIpI2PCmtuvyz/kY1hFVmHlq4?=
 =?us-ascii?Q?vyG7I1C/GQ9+oYIZqK7cAFMEexxAnfMdrzB620dZCc6H5dINhehjxjsXyaEw?=
 =?us-ascii?Q?GqDm1cKDCNkHWLC+ktFGF9T1DMzW+Y7N052h0OkycW8dgrSbe23M40aM7Fm5?=
 =?us-ascii?Q?AkfEKyoF0hE8/S+t3d2bFJzcRRJGMfcMe4p5d72o/RgD7Z0bDpdorN9f6WhJ?=
 =?us-ascii?Q?v5U6hdDiiuHDvq+zIrcLf1q/IuBZ+Fz2VWJtnlxlXjDeDGBdeafU22fY/g4u?=
 =?us-ascii?Q?/7r5NQJm2mzt+fgbQyOq3o+/SpBBZ9vFanQmwDWiLh1hYcVMpnXrq05rlXwy?=
 =?us-ascii?Q?sRxbdkQPZkRU8SmtXmdGGrmZ0KQiV8jfa/Dwn3yQzB27t/eOiIK4ZLcOmwsG?=
 =?us-ascii?Q?Dx0tgQ2Pu5mldYTHFs14fs/wGSLPAdNeD5IZf8RTSO/H0Ou0LscsGpUCovTu?=
 =?us-ascii?Q?ZZWgcPetrAOCXGY/lmME7faTgfvkhCYOWsmjFDlNbO9nugYc7Jfr1mFBYjvz?=
 =?us-ascii?Q?qcFuNiKs2HH5GZUlk1wbNvrtWgbwAiGuLG/cqe7L36Id5of3cuwS+8XdgBiM?=
 =?us-ascii?Q?emlLVb3dpuc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b/OAhAZSsNCnWmBCNLwUGSgWCUbX1EkGiXDPX19S3hYb+lT1a16NG9mtMorS?=
 =?us-ascii?Q?yd8ZroiaYgNPpo1QOjsHw8+EPREYPOzj6q0l/T/JlplZLHLYDPEGm1Wy66ct?=
 =?us-ascii?Q?N1yfvgItfmdegXuInVFMUujsdNRcgurWWGIHR1xZ7WY9PEIexV0NL5+n4HOa?=
 =?us-ascii?Q?t2IXpa5waQyn2XqPqb0JlriR9pDYAyIZ9jNVNXpFli15fDvbab9Xduy9Jwup?=
 =?us-ascii?Q?1NUc8a5UNRT4ElAErv2CKMkmhh45BMIT7D+g4zPxEbpL6Hnxpg+BmVOzxL9I?=
 =?us-ascii?Q?cHueEIj09sIQoFwqOnOBAwxcZ9k+xBCif+D/ffYZsCiNepxOwyi1KURJO0Fb?=
 =?us-ascii?Q?Vit6ZeVkkAiQN9AdeZYm58NjY4ZXKC5IGTWkeH7y8Nbk3P1PcaC/kj8VtymA?=
 =?us-ascii?Q?YvXnca4ZdlEYvoMhjYLzBj7CnK9betbnDJH08GBFeHkvszCz9AfCmDbquAmA?=
 =?us-ascii?Q?N4DDlApo9bfN3grLlc2DiwbZxmhz/G7l+A+sMfag4Ia+afESsxF4hQ/d8EtI?=
 =?us-ascii?Q?43Zk2Hml5yiKfrGECEy25LCnhgz0KA/7AxVb5OywrFTK9paKGiKqLaf6bOF1?=
 =?us-ascii?Q?/49E0kJ2ho+ZBiVHqu78PoBZU8RkHwk+3cFP2lU9idlWAFyf2epx/BR7iA/W?=
 =?us-ascii?Q?sRtoDkv/v7fQZx9DLyd5T+fyTnuTQvbPiRsp01fPeHKVqi19ELGog6c99ccc?=
 =?us-ascii?Q?06h4BVejilQsOBYVcpmLL0eNiUj+kCNODEoy1Dux/Or5bnGRvC/Rw2cMfWCi?=
 =?us-ascii?Q?e6zhtmN32jPLHe5CMnV2294coX69xHqTYph9UmIXTgcnP0cG0Q5G2tvweeKG?=
 =?us-ascii?Q?Ucxxo2Zfq8n93dbjnTwwHy3x0gxjvp4dJN/VE/Q5Hn7lmOb2OKlHejYzrMBR?=
 =?us-ascii?Q?61Nzcg7BikiFtw7+yJOx7JWE3D1SRByilf6QFAqA1mG3VMCTRRmrCUSkKPEY?=
 =?us-ascii?Q?P6E0oxHWvZXsWhWgEJ5iT6AzWZdgPpNjLT32BYKWFpOpnvIZFhiKvDPUNugt?=
 =?us-ascii?Q?yXXuXW+HzzJzoMI9EWzByBEviO41Ls/GA9yjmt81o5nLmQjcuBPndZs1BdYj?=
 =?us-ascii?Q?x0XdKJSPqP3/I8XBdjmkLXzlLuezRQBdxLffkdM3rfY+TzNBjLJYN6F6rkA4?=
 =?us-ascii?Q?EL6ougyNkFbK4/FikzvdPT9AWb2oU7L52ADhhElQpilfag64skwkMwFFQyob?=
 =?us-ascii?Q?oXMpj+a/N90JWBIZbFoXfedKPatPt8hX+ppY7lbIcNb3IPNCaZvbnClTxFGr?=
 =?us-ascii?Q?BYuqug69wOgwWXFEKBqqbOVSH+dBay+xP4/KH+ohgUkRZHtLNK1/f6NHqUwN?=
 =?us-ascii?Q?rI0z0GBEJAjapC8S2ImFXcwqN0CER51gpvmyj3tMePOyGP01XVYno41Cen/7?=
 =?us-ascii?Q?X+qzhnbKmqeITbOnbfDFuw5d9rU7kCJgdqfN4iiCQqEXW9+R+QLpks6Y6NUp?=
 =?us-ascii?Q?8bhHJ4JmCEe1GZ2fh6UCOdJyNOsxSHjwvtfvGWR5aaFtWY/ixY5Om4aq/LUX?=
 =?us-ascii?Q?XGbU2moXjDOvZZ0Qcg3+cnXee03qFymTe0uQUAUJdRw+GFS5WgnfW1hcb0ui?=
 =?us-ascii?Q?5CyduJc8iunusqRtY30sOuEHCktEiEQOmBOBiPlJiP69ysYolwKIvYE2jkM6?=
 =?us-ascii?Q?dJLQvvaUWGEL9l/XCwzjQvw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4516c7fa-4657-4479-b81d-08ddbd5e0d55
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 13:56:20.4397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8/3vt2cF5YrjwQswTYl4J8/QtYvWMkGNr8cEpg/62Fsf5mG5u3G50gAJzT0yx00AOuPs0PcHQ5lF4gaaepH8+hoLtKxoNDJED7Ioi/2cgQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8686
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
From: Dong, Zhanjun <zhanjun.dong@intel.com>=20
Sent: Thursday, July 3, 2025 2:39 PM
To: intel-xe@lists.freedesktop.org
Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajde=
czko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Cavitt, Jonath=
an <jonathan.cavitt@intel.com>
Subject: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware initia=
lization error.
>=20
> Disable GuC communication on Xe micro controller hardware initialization
> error.
>=20
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>=20
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>=20
> Change list:
> v8: Fix kernel-doc style
>     Add error handling in vf_guc_min_load_for_hwconfig
> v7: Add kernel-doc for xe_guc_disable_communication
>     Unset submission_state.enabled as well
> v6: Skip disable ct on xe_guc_enable_communication error
> v5: Set wedge is excessive action, revert back to disable ct
> v4: Fix typo and add new line
> v3: v2 CI re-run
> v2: Remove unnecessary jump to err-out
>     Drop disable ct, switch to set wedge
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 20 ++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
>  3 files changed, 33 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8573957facae..6643a2cb898b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe=
_guc *guc)
> =20
>  	ret =3D xe_gt_sriov_vf_connect(gt);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_gt_sriov_vf_query_runtime(gt);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	return 0;
> +
> +err_out:
> +	xe_guc_disable_communication(guc);
> +	return ret;
>  }
> =20
>  /**
> @@ -1337,6 +1341,18 @@ int xe_guc_enable_communication(struct xe_guc *guc=
)
>  	return 0;
>  }
> =20
> +/**
> + * xe_guc_disable_communication() - Disable GuC communication
> + * @guc: The GuC object
> + *
> + * This function will disable the GuC communication.
> + */
> +void xe_guc_disable_communication(struct xe_guc *guc)
> +{
> +	guc->submission_state.enabled =3D false;
> +	xe_guc_ct_disable(&guc->ct);

Didn't this used to just be a wrapper for xe_guc_ct_disable?

... Well, I suppose needing to set the submission state enabled to false
would also be a rather important step, so it's probably good that was added=
.

Everything else is LGTM, so
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +}
> +
>  int xe_guc_suspend(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt =3D guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 22cf019a11bf..20823b821f7d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -34,6 +34,7 @@ int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
> +void xe_guc_disable_communication(struct xe_guc *guc);
>  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 6431ba3a2c53..1012fe84b379 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
> @@ -158,7 +159,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> =20
>  	err =3D xe_gt_sriov_vf_connect(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
> =20
>  	uc->guc.submission_state.enabled =3D true;
> =20
> @@ -168,9 +169,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> =20
>  	err =3D xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
> =20
>  	return 0;
> +
> +err_out:
> +	xe_guc_disable_communication(&uc->guc);
> +	return err;
>  }
> =20
>  /*
> @@ -202,15 +207,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
> =20
>  	ret =3D xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_guc_post_load_init(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_guc_pc_start(&uc->guc.pc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
> =20
> @@ -222,6 +227,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	xe_gsc_load_start(&uc->gsc);
> =20
>  	return 0;
> +
> +err_out:
> +	xe_guc_disable_communication(&uc->guc);
> +	return ret;
>  }
> =20
>  int xe_uc_reset_prepare(struct xe_uc *uc)
> --=20
> 2.34.1
>=20
>=20
