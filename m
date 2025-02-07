Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D6C02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 04:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446B310E041;
	Fri,  7 Feb 2025 04:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5r3+JnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585D410E041
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 04:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738904201; x=1770440201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cTZ6jq6JjjB62h8VNUrAtkBdSV5dpo9OYW5cZbXrOdo=;
 b=j5r3+JnKBD1IxpyGYl+rdhnyLUHG4nMl1Ky60Pdl6mPvbjZuz/Cxq1av
 tEayxQXydZEMLlc46bQ7ExgoR1L5Reg8KdumjU2uDQHdqTBK1BnhAEA+c
 xltKIpTXqqtSsl38hee6YbO/lPttknzvjT+m8/8TkfN0hpoEeALjJnJR+
 UFbAj5w1hlQS0PFhdgG7hQAQAxvjO5O6M9+ZxmiDXovVY3daSIba4XjVd
 bSOzICSy66SBhoUpQNGc4wTVo+7T9YsQVag8k65WEZFyB4gMtMTlyGIZj
 ei6LwTzeWedYbCJ01nQaLeAOFTasDHnZzwyaJtVeUDrmwHc4CABO4509f g==;
X-CSE-ConnectionGUID: gBs/UIemTTOVlO0tDQam7w==
X-CSE-MsgGUID: INvmsmVmR6a8CRpHe44IAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50925351"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50925351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 20:56:41 -0800
X-CSE-ConnectionGUID: s5s39GmBRr+pQpxsczUcyg==
X-CSE-MsgGUID: 1i1AXKjdQCK8WBANdYmEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111617616"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 20:56:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 20:56:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 20:56:39 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 20:56:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmiPzYDlzUK6EQ5+oS5mNRRzd2tsOOxQx6reBMMtouV00BvCTjL9nTperbnBJqj57JXM/Qo1FBXkVema2T0RnTP98+Pr9YmB95NCFH56GqSK2fx1dxuVtJrJKmHyTWT9d5/uu3Kt7QApzN9d6MM+Yka33RY342RzDVs0of4jZoDtxAWyZLmYd/XGoQhyQwN/tOvnMcLOj3Mlt3tMq8q0M0VtihXd750cbjn3ait5U/0YUb3JHT/ci62Qbjqizz5iZCgNHb4fK2LI6IfSpBhaI2heDeTmkNDtpZI8jE7WeIAulE39uEoDo/3r8g4OQq/vyH0cJ1mxrX1xDtgB0zHklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq7Zq7R+r7Qpm9XRT/LoPn+KWcCptQlg3uViUY/zPw4=;
 b=XgSpCiJyh3+8T+Mh1a6sbf13kZRzrOgRW8hoHBkIl9gavgIzh9WLyS5xVZRn99lKl3HSBsNmx7jR56vA526/+GHT5Z17xNZOLdLVgYcgvUGyBOcf0CHrL9Oml/iTX7kZJW1SR2bJjNnOtm1kUjCSixmNNMMIB558vhQJ1Q0AxpGLBIcWVRv8y4azi9idgSNHXYDeDEIbib9i8RCsHYDGtYNsMudkOdwNvSSjXbanyIROS1aG54YRibIXxbFxeLI5VP2/4XnPdAkpIdaYoErCkd9tFtJ2pRvO95SMpL+w6wyKWjfUbiO7ko2Z3Axdm5Isn6v/ZVeo/o+IRwORPnz9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 04:56:33 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 04:56:32 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Atwood, Matthew S"
 <matthew.s.atwood@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
Thread-Topic: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
Thread-Index: AQHbceiQwbd/xwYJCUCmFJydIUyFq7MvlX8AgAr7YYCAAGpPAIAAWdag
Date: Fri, 7 Feb 2025 04:56:32 +0000
Message-ID: <SJ1PR11MB6204B568C84D3D28ECCDB92481F12@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250129005551.106214-1-matthew.s.atwood@intel.com>
 <20250130173030.GH4460@mdroper-desk1.amr.corp.intel.com>
 <Z6Ttkcj_XWatYkkF@msatwood-mobl>
 <k4s4hzkryw33v6iy77ippwfqpzgvarbey2ac4vaapue4glsonv@3jhaz6lteoaw>
In-Reply-To: <k4s4hzkryw33v6iy77ippwfqpzgvarbey2ac4vaapue4glsonv@3jhaz6lteoaw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4767:EE_
x-ms-office365-filtering-correlation-id: 5944fc7b-83b2-481b-3d32-08dd4733cae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?n3r8J0ggsT9PBk0Lj8maKUBXnvpuZv+QFZT7pso0CVopeMYU3XEouOLFii+G?=
 =?us-ascii?Q?bzG9IsktukjkaEVOAsQgw5f7of0WqS1unnmuK3+lggyQbh9RbCfO5KsarQ6/?=
 =?us-ascii?Q?6NUDkDyzm/TYZ/DCZH03hzr4UPSm42lBOwBA9WI5b1+HhBW96izyFG/4/1/J?=
 =?us-ascii?Q?kYJfZk0Ey2X4s5dU4nQbBV3UeQYSkrQz6G1lrkXyC3VQyUKhTthLCNPgslKg?=
 =?us-ascii?Q?Yto7xxwGMi+7AxIKT8k/JFo2JLkvXykCR/dcaeafsqBAjmt7cREPLAYbdSJV?=
 =?us-ascii?Q?kO5L9+xk4G4ohDzlYjmietQ6BT1OIq/M9BZijIyvziRP7uXpeRA/v4eeznZq?=
 =?us-ascii?Q?hyqCpwCfXj7j20wv4pXp+hij8jNFgVbBuQRRkIwVuquh5KhCMJFDbgKL/A3e?=
 =?us-ascii?Q?UXzszAekGYmdnCm4N655InfmUfh25ptim87yYnGNxz2Ait05YF5IOqaP6pd1?=
 =?us-ascii?Q?WAFv7OU5OzR4llPnUi6+0e0/ydob4ODr5FZNbEw9QAk3fA1WZGdmvAg5vlVp?=
 =?us-ascii?Q?LxIkiypq5mp22K7aViDy1X8tEsRQRExRcH4OIRoMzLlpEZJ7unIfclA9YVf8?=
 =?us-ascii?Q?F4rpRtZBRm3RKJ31Mi4/+Hc27G7I9GtjM6vdW8VXzohvGgZUXiZOC6fpW+Ne?=
 =?us-ascii?Q?1iCGILO/A72VNqAg2t3lb3ObIAooNIsiUpU4B77rkW8lEXaetJ2xcvwSHrcL?=
 =?us-ascii?Q?gTZZVbRTbj7rPugNtLHAe8PlU2ebnCB5BctQz8q66ycx6Y+xJqZrQMxriRUh?=
 =?us-ascii?Q?wNorYPkSo9mgeafoWhnYvXEZAYJrks4WJdfhK5ONNy75kTyOvE8b9trjxPJp?=
 =?us-ascii?Q?KTzK3uRFg8GxPqlQDbVQd8Z6nOnzvtLmd2rYtQa94i/MrhMBmOfNHMMyFzfr?=
 =?us-ascii?Q?YCHXGyEiho9ChUsXjCwdvy575IZHCdSuJ0Mpn1l9vwx12zykqJRfoXzD2pIa?=
 =?us-ascii?Q?8CHqaQgdyfV5vZ5yLaLYU68oPvWp/g84ku/CTQHnXUz4j3p3gUg4hAQt8AFv?=
 =?us-ascii?Q?6TMCBXa9X/jfd5IhLMiVsTPL4jLX4P8rYlCzyjaxO8hHOSWc7hC0/jIYmYnX?=
 =?us-ascii?Q?XjXrFGvrynnskjuWkAqpOfHwXptbP+OhMUChQuv4SC2rEXCCEtAscwR+TacI?=
 =?us-ascii?Q?9Qreb+2qhAzHmWI+neGe+JDG6+bAup+U60q8VGUtBT2dED8VUOGLXhnDt2Xm?=
 =?us-ascii?Q?4Ww2QcjgJM0N+qqchIO3Hlrg5q/1750kIP0ljSz907sN90yU7Qoscyodr47c?=
 =?us-ascii?Q?F9Nvz5z8rB36RQ8iKoolBMtZw/cqQnbNgEU8sl3hs7eLSYRH208cpRA2BMgt?=
 =?us-ascii?Q?rHzMg/pa3UuAgHImQ+Ldu7bKXtu/MixMkbbFGS9ibBh1UEMt1SG5M7dqrZAu?=
 =?us-ascii?Q?U6HUBBqOpOPxHJPFJ0BSD9vLD4SZHBFLB3Deq/DgWZy8pBDI6xa2aUXV/N/s?=
 =?us-ascii?Q?CTuvZWlaBp2sFbqhhA8GU8LjmcCfSAsW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Uo8uo9JykRzcn9hL2xQhq2a6CMOW8OZa/UITc4t9g2FYzDeVuNLDTP9iI57Y?=
 =?us-ascii?Q?ZXCvjM4DruAntPk5ES+TPYU22G1s58zVg76wWHSaRsA5NC9Y+vggqzK/wH86?=
 =?us-ascii?Q?hPskfxfJaNNr1/Oc7umSH65vAzssziePB/wlPK+n7AM7YbPWs7KTeG7IPyh/?=
 =?us-ascii?Q?d5CU6Ogl6hBLXjnE376M04eysAgjkL2j5COiGH+lkqtjKmvw2xe6Dif0V/jX?=
 =?us-ascii?Q?mFFuDecqYFEQ20fpDDVnqFR6oFOBnQbE7pMKsW5VNDqBIM53GZVGq+iPyc2I?=
 =?us-ascii?Q?KOSuj/0I/xtJJKzOIv5+OdpaQugRU2RGFaFkFKzTcmPpB57eZAubaUdZWjn1?=
 =?us-ascii?Q?6iApGzXRuJWs5rU4gN9rBszr2nL6l57Lg9ntw3XBVsOt8OGIMqoZN1h4oXgx?=
 =?us-ascii?Q?fFz+fdzm5PAM0HgdEMVqu9eVafgF1sbcDlkAw2V5ngtwSSWsmJextvRbUYwg?=
 =?us-ascii?Q?eBzBC8RTzwLUesD2bvsM1ib0Mp3MiGOga49NFj9CHSCSEsFvSkq1yR5gpKSQ?=
 =?us-ascii?Q?oMsAms7URancaa0Flm93+MEsYfuPoSbrL60utPpThyGIp314kn52E25Yu7aF?=
 =?us-ascii?Q?l7rcGRxp41mqKi3YtmzmANYAECDsOfhun3+rt2aX/8c14XS5mYSwRTOGHXN4?=
 =?us-ascii?Q?1+Pg9uJRn5xqfWePn1hjR6kpvS2UIn2oE1DTTQGhLpDwLhOwxInW5rTK19BY?=
 =?us-ascii?Q?DKZluwPGIi/IDVe/+DIPoq9yjFsVBDW72EDIUeqSSPjFOmzrPgsQYCtj+Wek?=
 =?us-ascii?Q?anlHEy5KrnKYGrJLIlpFl+S2IkvklMAOVWD/KPNno0j1pU1t4Nc3OSUpkmL4?=
 =?us-ascii?Q?8rrzxQSTRewPjJSPHLWdS49BcH/FFLflE+6v88yQ+tk3Uvs25pkPdAicAmur?=
 =?us-ascii?Q?XeJ99ZvIuziI2ZVWa9mTEDPNBZxCgy8fuaOJ6+hqBBtp0QomTyMf1OZbrDkS?=
 =?us-ascii?Q?Nl6RFTpDeatk9f0yi8UCaZFmQN6jE+z6cCFXGBhpACfDI3eoeqqgh3DqKWQJ?=
 =?us-ascii?Q?YNQdtSqesAuxWBGHwn08aYF6xDXB38SWoYB2AKXmzbbyKe/cbndxlXzHlEOK?=
 =?us-ascii?Q?9tPNe9Ut1VjacUL7fjJPlbKydRSYwQc9wAl/DEB4ckfrlKvDKmce0JhyPXsG?=
 =?us-ascii?Q?3vpa32AO7T4zWAqmdATdJrgEo8ZRp9GmyB4K2BWfmXWjoBFdhdBewISUQKGb?=
 =?us-ascii?Q?z/2m5SZK/mh8NCB/v4HIvJeFGWKUMowcew6rb9YtfLNG6jVFNZRiTm09YELM?=
 =?us-ascii?Q?OyyJsFQ3RWkO6Jcfqq26Rplz9ZZL6Jnznuk+LaWSXB1JEKEf6tPVkr6VnO4L?=
 =?us-ascii?Q?zBf/9y5pyhLWSr6i5Sev5QEtELZNN6c/qan7Fkedxmb9nZAW7zs9uc0aB8/r?=
 =?us-ascii?Q?YIoTMzg2jDCf/p+UW4GIj/ZlUfvtjP2+eHSu90nU+/JfxzJ8TvWvI3kR03/k?=
 =?us-ascii?Q?7i1fin+5DLdzpARUv1jI9BRm7jx3WZ+UcxT4EIR1F2msSDs5B0kV0D6bjguP?=
 =?us-ascii?Q?iqellJ6ANQbGRtNQ37O012mFnqPpVfRyArYUWUIGkLCUHyV+PAr5mbuXuX4v?=
 =?us-ascii?Q?2uT8+UV0OJLc/bZwqg8zpi3fvGodOS3Tq9WruCo+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5944fc7b-83b2-481b-3d32-08dd4733cae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 04:56:32.9236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gwV+XZoGoDEea+3khr9pouIUxXKYsR5n/rvlll/M4WvFJtGtwb6SR+Dx9JDxVE4wY57G+dEqv6qzHieptpeiK8P5pzxU26om0Ddl3IyPZwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, February 7, 2025 5:03 AM
> To: Atwood, Matthew S <matthew.s.atwood@intel.com>
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; intel-
> xe@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: Re: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
>=20
> On Thu, Feb 06, 2025 at 09:12:49AM -0800, Matt Atwood wrote:
> >On Thu, Jan 30, 2025 at 09:30:30AM -0800, Matt Roper wrote:
> >> On Tue, Jan 28, 2025 at 04:55:51PM -0800, Matt Atwood wrote:
> >> > From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> >
> >> > wa_15015404425 applies to xe3 A0 step as well.
> >>
> >> We really need a better commit message explaining how this workaround
> >> is different from our usual ones and why it needs to be handled in a
> >> special way that's different from all of our other workarounds,
> >> especially since someone who just quickly skims the workaround
> >> database without digging into the details is going to incorrectly
> >> think this just applies to Xe2 media and isn't relevant to PTL.
> >Ack.
> >>
> >> I was kind of hoping we'd add a more well-defined infrastructure for
> >> handling device / SoC workarounds.  Adding quick hacks like this is
> >> going to get out of hand quickly if more of these start showing up.
> >Any particular ideas here?
>=20
> at the very least, use XE_WA(). You may need to extend the matches it kno=
ws
> about to implement what you need here.

As far as I remember, init of wa_oob was little late so we could not use XE=
_WA. I am not sure if init wa_oob moved elsewhere and we are good here!

I was seeing below assert and thus we decided to go with what we have here,

It asserts,
[  778.229096] xe 0000:00:02.0: [drm] [drm] Assertion `(gt)->wa_active.oob_=
initialized` failed!
               platform: LUNARLAKE subplatform: 1
               graphics: (null) 0.00 step **
               media: (null) 0.00 step **
               tile: 0 VRAM 0 B
               GT: 0 type 0
[  778.229121] WARNING: CPU: 1 PID: 1567 at drivers/gpu/drm/xe/xe_mmio.c:13=
3 mmio_flush_pending_writes+0x33d/0x350 [xe]

Tejas
>=20
> Lucas De Marchi
>=20
> >+Lucas
> >>
> >>
> >> Matt
> >>
> >> >
> >> > v2: query based off SOC stepping
> >> >
> >> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/xe/xe_mmio.c | 13 +++++++------
> >> > drivers/gpu/drm/xe/xe_step.h |  2 ++
> >> >  2 files changed, 9 insertions(+), 6 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> >> > b/drivers/gpu/drm/xe/xe_mmio.c index d321a21aacf0..98d068ad33bb
> >> > 100644
> >> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> >> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >> > @@ -150,14 +150,15 @@ int xe_mmio_init(struct xe_device *xe)
> >> > static void mmio_flush_pending_writes(struct xe_mmio *mmio)  {
> >> >  #define DUMMY_REG_OFFSET	0x130030
> >> > +	struct xe_device *xe =3D tile_to_xe(mmio->tile);
> >> >  	int i;
> >> >
> >> > -	if (mmio->tile->xe->info.platform !=3D XE_LUNARLAKE)
> >> > -		return;
> >> > -
> >> > -	/* 4 dummy writes */
> >> > -	for (i =3D 0; i < 4; i++)
> >> > -		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> >> > +	if (xe->info.platform =3D=3D XE_LUNARLAKE ||
> >> > +	    (xe->info.platform =3D=3D XE_PANTHERLAKE &&
> >> > +	     xe->info.revid =3D=3D PTL_SOC_STEP_A0))
> >> > +		/* 4 dummy writes */
> >> > +		for (i =3D 0; i < 4; i++)
> >> > +			writel(0, mmio->regs + DUMMY_REG_OFFSET);
> >> >  }
> >> >
> >> >  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg) diff
> >> > --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> >> > index 686cb59200c2..879486a818e9 100644
> >> > --- a/drivers/gpu/drm/xe/xe_step.h
> >> > +++ b/drivers/gpu/drm/xe/xe_step.h
> >> > @@ -20,4 +20,6 @@ static inline u32 xe_step_to_gmdid(enum xe_step
> >> > step) { return step - STEP_A0; }
> >> >
> >> >  const char *xe_step_name(enum xe_step step);
> >> >
> >> > +#define PTL_SOC_STEP_A0  0x0
> >> > +
> >> >  #endif
> >> > --
> >> > 2.45.0
> >> >
> >>
> >> --
> >> Matt Roper
> >> Graphics Software Engineer
> >> Linux GPU Platform Enablement
> >> Intel Corporation
