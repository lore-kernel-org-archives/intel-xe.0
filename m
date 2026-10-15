Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA7FCC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 08:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C96210EB84;
	Thu, 15 Oct 2026 08:29:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB49A10EB84;
 Thu, 15 Oct 2026 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792052956; x=1823588956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7qVbYh1wIOMdKTGCSKnin6hwUNmuONmPkl3uU4aEKBo=;
 b=ZuFEUQAss+GWc2RBen9uJA8MC0BcODZv9r9VKffin07ll3GFEzTtUPe8
 UT0Lkb4Ypx5PmppjiPXKP4Dvx4t9RB/T0ZjJwsdg5GpmI/kjI8J0/u0O1
 0z/mdvcNzsUrCCrHSs701pxfGUzW/2miLuejYzhoX71Jex5UUrwOOwuP2
 Z2h7CBNgodCppz2llwvjuSzu4GdeBLpTdA3FUtpATa/YqVVlUXJY6KVMo
 iDbBbyCsd2ovFBOxO1KGt5K+5TLfzOE5p2Me+4WNBd2VUOXlsW2Rz84u8
 9qk2fhqOl1fnp+T/ovqQE/zU08G4vHtlwhNI2DvrFogF6Ba4cdooqU2Uj w==;
X-CSE-ConnectionGUID: voaViguTTnOTMqLTiqjozg==
X-CSE-MsgGUID: CO8+vQ65RWKnsMqxLSTB5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="720748"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="720748"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 01:29:15 -0700
X-CSE-ConnectionGUID: s8Y7MCaAR4OwnHDfHgaTMg==
X-CSE-MsgGUID: UicS58xyTQGpyFvSx1PFPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1543445"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 01:29:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 01:29:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 01:29:15 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 01:29:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI5uInYqpI4dhdEh4ez8thBavOXsNFSI85lYtIIDgCKQTDG6R68EKL7bkWvykNVdcdgAX4bAW2VZ+zerSNW0EIMM9iZeNC4Q+O6oRbOByzaOkmLeVT/O/pZFfiOuaASZ5SsWe4rA7PFFvPpd3Ax2786sgCbBRHhkfB6T6CKLmJoqq5ZTqG8+VbKc1izG80UMbFium6kmEDbbmVyK2YA3aQrQB6w0skaFQk0IrBXE4XC0a8CYVMx7i/zZpwHJjBEsn45+AmvP5+OCBc0AjwrnycoMBXyD0LmfRvfAY8m1qGuq9GLuTT/g47iuCCwRbBC/sqXn+jb+7gNMrM4kl0RQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SadwovlWDPCmGs+FuIITNv2t59SilwgRset9hjw7yL4=;
 b=ILdwbXpQxyk8kE0BH25Q4zy/vPkbRjUyFTmElaUPd5C3uW5pqYwk1wGzotpwADeYcuNHrW4Mq3kqFJD3IJQ8m5JRSIAw2lycJRdd5M8ijBCjykK6NDK68mDasREK5+Ggd0g5g5dA7khWt93i1Pf6GrCykhIAXbP1I+il3VPRbXm0dsMCCjh91Hq6m1vOXV37rudbDu+Y75n4pe7JqU/eEz7+P0c6Nhgoqk2A0bbG64zcb/mX732Qt5zNrRpnHc8z5pjrpT/7g5z3FIHlmqWMYFae+icopX5QxwdHyX8WY2wtyHRLJGu+MzY1xKO904N5bMb7gv242HG7YvyQbOk4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA1PR11MB8279.namprd11.prod.outlook.com (2603:10b6:806:25c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 08:29:12 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 08:28:59 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Charlton" <charlton.lin@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>,
 "Almahallawy, Khaled" <khaled.almahallawy@intel.com>, "Wang, Rong"
 <rong.wang@intel.com>
Subject: RE: [PATCH] drm/i915/display: Limit scaler count and disable pipe
 joiner on WCL
Thread-Topic: [PATCH] drm/i915/display: Limit scaler count and disable pipe
 joiner on WCL
Thread-Index: AQHdVi4dRw1rpXnK1EOav4zGRNENirb+USkAgAAAu9A=
Date: Thu, 15 Oct 2026 08:28:59 +0000
Message-ID: <PH7PR11MB82525A0AD2A7235DF33C4B8F899C2@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
 <DM4PR11MB6360C35FE5D3B33A5428667AF49C2@DM4PR11MB6360.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6360C35FE5D3B33A5428667AF49C2@DM4PR11MB6360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|SA1PR11MB8279:EE_
x-ms-office365-filtering-correlation-id: d57fbdc0-8adb-4e3b-0b0b-08df2a965c50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|260925022911599003|18002099003|10067099003|22082099003|6133799003|260925021311599003|260925021911599003;
x-microsoft-antispam-message-info: RwYjv2/w6d7rFJD/REeWm91yOaMQVdvph0furvj3HLZ7FkEQAn5iWROhfCJ6QhXuz9LBLBAtUaYysCHmg2OlP6RbGwMQ38dkymNx+h8VJk6F6S5ZjJ5Stw8LaJhtQ6nFyFLD5GBv/6NjaDyJmgcAErkXYmonCs1w7bMHESSPEbF1mPn25mEv+ZvLakgFirYQAqMjnEcGRvzSFkNwBFFZkLFevGiA5N3ues2IejOd2DyOY1LQP2oxZKL5Xd9P+oouP698mCcSGxX/lS+96e0ZAsiKJ7MZd1V6XMcon/zd6faGG9hXH+wtxbcKUYIqrqD1IMjgmGOAC9mehFA1O+JQB0aLZR3Vb0oPMzZOikJQxHse6dcSy+i4PmOIcB+TJDm7AcdsKXa9BA1y1rOGowjXwztAFA6/gnC7w8J+OmcooBcit0lTyWDuU6bvN7tX2MeJjdvOkz1/GjL5k+yEyhPxgxLRJuGFOuzUue4nfeIVcrVwDZhfrYCQKeGe5GQv2tayZ3yYYctSWAanHe5rPCsDu9uW4eRi7WoxJnaIp7yOEgrdel5k36v0gIt+GjVXyijVzOBIKqIi/wCijFiwqNnFRq9hwS3tLjhUaYYWXnv8UQnLL2cPzz7ogP60HRK11aSYZn2tHTToygVKKOKPQNS+fneMyaTAeSoNKHpLth8k8lvkOOSlTx3yv/pDxanFRX8MFiI6RhsSedwNmgwmbxZx0QWY662TN0phsVJVfWDLPyU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(260925022911599003)(18002099003)(10067099003)(22082099003)(6133799003)(260925021311599003)(260925021911599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JbWGTUU8iJLmfuRW16DLIYHDy2QWDaAISwBzMsfv0JQWQyLGXP7gT+dz56tV?=
 =?us-ascii?Q?YP2+Nvx5+ATapngpoHon5gtULJzSEIE414UHaauw9ih2bNWQjJJab0xmGm8N?=
 =?us-ascii?Q?+YxDtg2TUvjnAhDB6pRHA6e7IeBfJ1T3khrm/44CqaoMZLIw36gRUYUJ6di0?=
 =?us-ascii?Q?o+JUN+GJPwhRmnkLlTn/Z3GdDIp/0inzBhi9lVELxLVyLjwcLuKi6NrmgQOX?=
 =?us-ascii?Q?SuChHXiDMQpfuAsfrELlIleO/JwfhgOIyNmQocDusaujB835mXf0CtHhwhhk?=
 =?us-ascii?Q?vzwOvqlMQuZi0dcwFliziZrtoRm77i9N2FFwgT8X/AkKkunlke8KWW3VmLO8?=
 =?us-ascii?Q?ayj4408QOkoFM1Aa23m1UGN3zyzvzYY0QDaj1x/QtpGsY+EhITZRihd6o353?=
 =?us-ascii?Q?xzXNuuBsF/tWWoPK8YvBI/xbHYKxue79P2epkCHEIkWduRxTg0B8xBFo/YdB?=
 =?us-ascii?Q?rHNDYkBTrm92j9G4hme0YDju90sEy5O0tDJ3Z/Co9hawLFALiImyvP5FyrNX?=
 =?us-ascii?Q?bON4cVFBvEz2UkdeQgp6WMHvTlme3SXyagjWoEnjnnvHs0r9IuiocQs+AOZX?=
 =?us-ascii?Q?xMADXDt1mzB8rWlD7FoYbgZBftdfDEnn9UI0hWoo+ohYhTw6sNOXx/oooZP4?=
 =?us-ascii?Q?TU1PFbrAvCG85vzJ34bwuxq4Adra3j+uMrcMHaBlOi76M66TSgbJ+RnkaB7l?=
 =?us-ascii?Q?XgZ5F9u4UBfMXZUvmf3KiRZqqqQOQdNOJ1sg014japlygccUz/xWrfRwaKcF?=
 =?us-ascii?Q?GEoJy9bUYjUVi8OjlPbmGccMPq7F1fo9Cbxx67kK4Gr/VfyJuQW69jK7VTIO?=
 =?us-ascii?Q?cMn45hKQmd0iYD8qzNB5lehvG1vuoal/glOdz/+l8kNfzCTP2LhVZ8F8EVZI?=
 =?us-ascii?Q?wZ7xUZjJDshbeVG4RISmhnV5JdHE7IKd0Kf2dEM+Enec8bq1G9eJMwCOQdmc?=
 =?us-ascii?Q?3v5BZBgvtaG/8WtfhKF54/f4rie3gloXSHpVq+JWtsGZcC8FHvWjBWWWUUSz?=
 =?us-ascii?Q?Uzv4Va/azCi6AbhoYstrFtDWpVV3DI3JgdoNmp6M7DqGvEg9kqOROWvAxJMS?=
 =?us-ascii?Q?ZndRby8QLnlAhxZdUwcNqawlcQnjHHkO8SX6S0XLqHHODb1dpq0qHiqvwQ4R?=
 =?us-ascii?Q?t+X7WxWCvtNUimTlJGy4jnfLI8HWYWlCwMDTGQUe5bA2a2+O+DEkEhigg6xR?=
 =?us-ascii?Q?9Bjc7/5mlskJ9FpGIoRTx62y2oHrfnEysWe9u+20MUOeGbsl6FEzmusU7ny4?=
 =?us-ascii?Q?jztoFiUDZHxBEhiqxdb5E18MTtsCDzKTQMomeZN2UwsB4HcOp/exYl2C34Ff?=
 =?us-ascii?Q?lZTnYM69izqGVdOYfPzmQTiir3Xb8tjkgK9RejGihYuW0gFUBk/xo3sWsJ2x?=
 =?us-ascii?Q?W6LuVZ1fWC47Zy1oUyIn3pAwGCHyomxF1BM+6AK4KccWpnsgW9V3gOPGOxPL?=
 =?us-ascii?Q?ZfYzisLbDMFulhVMFiHcCvQsTWhdg/pQ2L5/HL9IQ8kDlk07USL7EhvtopLG?=
 =?us-ascii?Q?BRDvdAb82YIM7kq8zdeiGA0+YRAjvgSDSBkVg/1vFxh1Ar9J78MnY5DpZ/o/?=
 =?us-ascii?Q?OfRcVc2KQ0w8jMd33h1enSBJNtBV/T7qj67KuKMsY5T3eEPXORhvaTN5Tnf6?=
 =?us-ascii?Q?tDdyw/btEGgJth02hp0x68erMP5os3FJXCJxd+n3cwLr1rEicLFc3sV0Gh8d?=
 =?us-ascii?Q?iZn63+CQZuySEOqOZJKJ7O2PpCBeQKWbgn9FgH5wY4RujCMdkGRT3GA6oN93?=
 =?us-ascii?Q?pO9Gn8hJ1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DU04d+pxbTLqOYbQoOO4e3AgcTjmljx+uKiOqiuaGORuDKT9h8gwGc3n3UzDARLS8JoL0qlR0VdoPFlWAAgf1Tgq3SHcIwBxW9sZzH2phCZNm8DyFVaTSFwHwZqbZWf8LtqrqFXX4iBm/e7+s+q5zp1CBjHJXmywAC7nagjYKdKDz6yQwy3W3+lKODlMNX5n/xTJpFPPfbkLMwyzTE/QVAPEu1LORUKjRpxFN0AruFdAL6iNdj/SX//DvXu71Cl3ljKomG4BiRczJFvtnKdvrHF/iH3rqscMZgGKwAnJavTPTS2RqFwlRxP/YOaXJXFsjIWcCTjrY1vvNjeDh3UY+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57fbdc0-8adb-4e3b-0b0b-08df2a965c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 08:28:59.1674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFOymwS7enWL3UR5/qAsADp9MWwQymXAewT35IUnf5SLl+KcMoxGC/JHiHMwl2Qe2L7ndXOko/wWru5i3/Fco43l1Fa06rGPCzWapao085U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
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
> From: Shankar, Uma <uma.shankar@intel.com>
> Sent: 15 October 2026 13:56
> To: Srinivas, Vidya <vidya.srinivas@intel.com>; intel-gfx@lists.freedeskt=
op.org
> Cc: intel-xe@lists.freedesktop.org; Lin, Charlton <charlton.lin@intel.com=
>
> Subject: RE: [PATCH] drm/i915/display: Limit scaler count and disable pip=
e
> joiner on WCL
>=20
>=20
>=20
> > -----Original Message-----
> > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > Sent: Wednesday, October 7, 2026 12:54 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: intel-xe@lists.freedesktop.org; Shankar, Uma
> > <uma.shankar@intel.com>; Srinivas, Vidya <vidya.srinivas@intel.com>;
> > Lin, Charlton <charlton.lin@intel.com>
> > Subject: [PATCH] drm/i915/display: Limit scaler count and disable pipe
> > joiner on WCL
> >
> > Pipe joining is not supported in the WCL display configuration.
> > Modes that would require joining are rejected, matching the 4k 60Hz
> > maximum resolution documented for the platform.
> >
> > Single pipe scaler instead of two.
> >
> > Bspec: 74286
>=20
> Change Looks Good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Hello Uma,

Thank you very much.

Regards
Vidya

>=20
> > Suggested-by: Charlton Lin <charlton.lin@intel.com>
> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++++-
> >  drivers/gpu/drm/i915/display/intel_dp.c             | 4 ++--
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c
> > b/drivers/gpu/drm/i915/display/intel_display_device.c
> > index f17fc2c68472..c74256359c25 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> > @@ -1813,7 +1813,10 @@ static void
> > __intel_display_device_info_runtime_init(struct intel_display *displ
> >  	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011765242))
> >  		for_each_pipe(display, pipe)
> >  			display_runtime->num_scalers[pipe] =3D 0;
> > -	else if (DISPLAY_VER(display) >=3D 11) {
> > +	else if (DISPLAY_VERx100(display) =3D=3D 3002) {
> > +		for_each_pipe(display, pipe)
> > +			display_runtime->num_scalers[pipe] =3D 1;
> > +	} else if (DISPLAY_VER(display) >=3D 11) {
> >  		for_each_pipe(display, pipe)
> >  			display_runtime->num_scalers[pipe] =3D 2;
> >  	} else if (DISPLAY_VER(display) >=3D 9) { diff --git
> > a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index d8c0d9381471..47741957935a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -477,9 +477,9 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
> >  	    !connector->panel.vbt.edp.pipe_joiner_enable)
> >  		return false;
> >
> > -	return DISPLAY_VER(display) >=3D 12 ||
> > +	return ((DISPLAY_VER(display) >=3D 12 && DISPLAY_VERx100(display) !=
=3D
> > +3002) ||
> >  		(DISPLAY_VER(display) =3D=3D 11 &&
> > -		 encoder->port !=3D PORT_A);
> > +		 encoder->port !=3D PORT_A));
> >  }
> >
> >  static int dg2_max_source_rate(struct intel_dp *intel_dp)
> > --
> > 2.45.2

