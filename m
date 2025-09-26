Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2E7CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 16:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A101610EA9A;
	Fri, 26 Sep 2025 16:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbwcBg+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5356710EA9A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758902628; x=1790438628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YqU5UGBNsD15exh4tr9KhQ5V4Mbhn/8EN33xCwnTC9c=;
 b=SbwcBg+hyNnU2YGMKcU4EoOtWUZOxODI3Mp0p/icxrSSgGgj4f7AtMAG
 bH1pEyznQorbGkiNUd1cdrnS921t8ZZ1JM/VhxhAulTJm0QsiulJYASAK
 9OQC2R8BDY6jSJvkM59hd21Hx9iOY78cUTwopAfGXYloCrUnaKpxWclHt
 lErNhhM5ojSAdCxBYSgvjPRsb2se24RY0XmEe1/0QkNeLuT3IKty6TKfd
 /skQAkbRpfJeB9nXYWN/QZIWYJP1OhOFHwZBo6iTBscxxpD1a2S44BHI5
 cEGB9//TpvndDOYT+MIw3ITNSWDOd5H7X+nATihARaBvJ3U3zJv4tCak7 A==;
X-CSE-ConnectionGUID: P27IoLAQSNOBFlP8KMmPbQ==
X-CSE-MsgGUID: tNHxI+5dQRa/GyQCmaF8TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61158629"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61158629"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:03:38 -0700
X-CSE-ConnectionGUID: eQhOm8e5QP2FWtAmt0zNzQ==
X-CSE-MsgGUID: IbB5W7zMSKqJktv2YBfuBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176770719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:03:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:03:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 09:03:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.25)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0itSYXRPVNy0+NlAk8zXDCAaBSzIactSuVp6/YckYnduisFrwlJ+vKEE6GBh0sropZB/ovglsgj+ZCmHN17LhHp58juBFY7OJ05wAMUm6yzW3hql404YkypDKZrqKenPE6J0gOHqz3UitwXvPeQbbWx/HO6rUzSNB5AVxgJ0x8G0GQo4GFzdIhxe3ztJVtRRxByid2pDfzjKt3W3etcYJzbr5uBEA0aR/bhtmaHMk4qiFVUqxKOAtzv0ZexPVMcM41CvZ9s9fH4JbiCbSlZwRYL7Lx/HPTIyfJMkGtOkUMAQmurwB+7lJMz0VvGybYy9vk2VQVR9ZJu99odSt2JkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SCC4e4fY7Ej++0X1PhhEutVnbugWBqu8RhJ8JfJ4es=;
 b=sPW2Zl0wGMP7nBfSVo+0R0uDeTL9RoLrri7XyJ/OS+OijdUcNjDcdk5sWtlhyd4jP5hzZAnul9SBNYXY3vtqa0lzxZNCYjKEmN/Xn5fd/DX+ySZ/7axEKC5Pxd2GA72gAV0XbsW+KUKRkrdsSVHsfN+Pkd5eM0XNtwXVBM9PRpUh9qGbxcLElCZ8k7qj8Ppyp/vMoSnrfMFtmZmxK+0JIzWruhsc8YzLG4cd0GLz/Oi8T+SRZPEbsyJIgDOv9CyE84KVHW79Rg2H9sR5uRtPqDvtDxB6c48EIyUgX3CZcYE2beAkvdr9fBw3FwdddD2j71J9qj1VENizXWHSCLLn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW6PR11MB8367.namprd11.prod.outlook.com (2603:10b6:303:249::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 16:03:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 16:03:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Guard against NULL return for xe_device_get_gt
Thread-Topic: [PATCH] drm/xe: Guard against NULL return for xe_device_get_gt
Thread-Index: AQHcLly9u+vu/FUD4UOL3zmg8zVaWLSkduSAgAEpoZA=
Date: Fri, 26 Sep 2025 16:02:59 +0000
Message-ID: <CH0PR11MB54449E3C8518815D1B192CA2E51EA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250925204106.67332-2-jonathan.cavitt@intel.com>
 <a2777749-a680-4c96-b5a3-44b0b5b1d356@intel.com>
In-Reply-To: <a2777749-a680-4c96-b5a3-44b0b5b1d356@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW6PR11MB8367:EE_
x-ms-office365-filtering-correlation-id: 61eebe8b-24e0-45ed-cfa6-08ddfd162a7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UBh+MPa0OP+D4G1v2bacA8sDjYRRGAkVlyOg+aCHQZJyfIxweWsKSxnjyfLh?=
 =?us-ascii?Q?TFBqW/SJ/4rleiupMRgakFExfewRGUzyrqn4SQd3f2Ufc1sUWpz6NZFjDhFS?=
 =?us-ascii?Q?+7kPaa2zPDz7uZcw6BoclOmpWDYbXI+BYNpe3Q8NsNUVTlXRnBfauyirWgx/?=
 =?us-ascii?Q?t21LvGrBaPChvhEOtCe9EwfZRikEkzCrJlvVuXRreYU69LvgREn85uRXkYUq?=
 =?us-ascii?Q?WdIu04vBwD3bWpic9tVY9AImXbm28pyoqAOUNqRLKUOm4JZn8jbouryHo2QB?=
 =?us-ascii?Q?elOm1kUEIXChvGARXuNaVoHHRHXB2mnSaxSErfd2EfcckDE1QiYNOMF/39xV?=
 =?us-ascii?Q?lhFZ1odTn1UbeK+pn+0IL8SxSd0SLG+oQ49Bb2d01EXYZWkzi595fxTb2hhI?=
 =?us-ascii?Q?93t3KENNVvDbkzemLi/J7d5R5Bd8s+R+8jyKHs55PLJzLnnJSeBXxLBq3iKs?=
 =?us-ascii?Q?orFxK2fBMY4t2a4ZOuvYYuV2nCVvcUsmXA4CDOa2czNzpg4xEBfgH7tRzxr8?=
 =?us-ascii?Q?BZXYuaKFYhKQ50jesTyDINpTSeb47kXo/EhVJoP4qayk1HHPxIb8WCk2aU8i?=
 =?us-ascii?Q?LKglm9u3ImX1F4GIisaS8eKl2eGshYS61Hrq1rPqTAZ3VOGbMYbKddHBoKqN?=
 =?us-ascii?Q?uTKV33gLCM4FEFU2mZe5BEWBEoe2vdOppEZqxomovY2ZP1tTSdvc5bsd9Th+?=
 =?us-ascii?Q?Fb7Yy5T2GCmsvATBIuuVakQSRfM/zI52+4sJbiNzWGcSK+DehUfgajfR6jwL?=
 =?us-ascii?Q?6LyZwILi2udmixSdc+ur6+63fK/LpEKHUhQc2+9usXqPRGhiXiUBOKTM96G3?=
 =?us-ascii?Q?x4QlnjfxGVSQ9A1YCPmxxfW0mQFBD8lfci01IYpARfi6DJM3K9uMBLkeq5F6?=
 =?us-ascii?Q?FkRfwQ2NEyKw4UEchlpXPzCq+1N2xgnLZ0maRPop7rs9jwwKmi7l4vDexYBN?=
 =?us-ascii?Q?iu4McADDrtNxkdWqVk9xqNCQndIomPkPlkl2SsyJTVpk6pR4VhTQgmMEWv8C?=
 =?us-ascii?Q?F/sMc0rg5iH36v3qvcjNyvkMYbM0UCzl9hot27QKCBpqDP4NssVm3lWGBeqK?=
 =?us-ascii?Q?O05v0D9sKlKJ7x28z6YXL/AsTiqqQBwJc+dad+Q0obQ7xcOZjbVQlR4whF1y?=
 =?us-ascii?Q?W97nRfSQkPpDwvSeMsWWoue9nzHPGMvOr0NjWIx3HPCeyglIV9Ae5D8qQ0/t?=
 =?us-ascii?Q?gAcvX43obcMyNMi1fb5dg/hWkGezm6102dKZzXkx575HJMRIL/Voq3sgSpl/?=
 =?us-ascii?Q?pJ5N/UI3+lO3v1liMbj+x49L5oFs07lgLRtYfcvPUq39ArUMXtDi3dEqJaRM?=
 =?us-ascii?Q?MzwVXERmSzUXFlJ2C0NDNHRSmnR0QqNhEly5/Vit0gSw0uwX5IFiifVDQJQj?=
 =?us-ascii?Q?oVzF+O8gVMvLCbUKBUX5xj2jMPk825o+UdUSngS/oQoijrBqvL66VdcMslJ6?=
 =?us-ascii?Q?chEVXqAkoT7AqNHlEosZPs5n3RFqThrumlsJc7S41ueiGWoGhiVM1CM2Ni29?=
 =?us-ascii?Q?vM+k4U4U0fenSQeg9Hi79sYTBqwnFu/j+v9p?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2j+UelzMtkke+qq/B2PWoHMmwGwPSVaW6fvDHNi3aTJFYqf/tviVdRaZirM5?=
 =?us-ascii?Q?tmBwaZh8oBR3faRQJb3PS/a3Y05msaXpufiTSBBrYUAZ2CwDaV3WzedyVvu2?=
 =?us-ascii?Q?0kC8Q4/VjtdQLJggiaY21UGLjTXV6YTGxVnOaq1803fdePD06e9no7/h15sT?=
 =?us-ascii?Q?aTtXeAhzEXKoPXzhY1SFFZo0rlFf+DKgJmpAx0latUuRhzv0aG6mAinSUeCW?=
 =?us-ascii?Q?PN+7elPfI1JbzrqEqoMy/y1JYGd95AAZrOHap/acN8Wy+4tCTYt4i5KE0gzA?=
 =?us-ascii?Q?rv0Zkm2FzZHh27xGRGqRZ8dQQaCJNnTwEKvQNn5hn9orNegCwEFEkGkUNSCb?=
 =?us-ascii?Q?LPWRlm55YCc634uI9D0EkZ1bhvdfCgEYg4sXX6YDvO1rVzaSQS1ES/uuLQqj?=
 =?us-ascii?Q?wGPXli9SVs3voA5LHTv4OoSwikGXXWYJRY52vET+oToJQT7bZ70rGErs5y0k?=
 =?us-ascii?Q?sJlfw/O3L/zKtaJhQfsM0ZhpIRxpd0BbwPKOxSYGGYqScmDvsogOlh/cB8ST?=
 =?us-ascii?Q?pqVYMwODEpiln4AQM79pcaqbRp4Vs4+EvAFvt6ODHb/JQFCo/5ngHProc+RH?=
 =?us-ascii?Q?+j1c/z+FhM/Y+0SJj0zEEBEPrhhEtXJrMeewM8hQ6FCDyt8xMoCJDRynddsQ?=
 =?us-ascii?Q?Jnujg+B14iQz7qsB0VL/BwKjzgyq48MUVRfTQ82hG3rRzxC+3Sa7PFKeMyg4?=
 =?us-ascii?Q?K+rU2X1zsUVqh6exO/bvH+/h2f/ndN9RV4UmlyDRfd+cVs5/sv+xgL62+b80?=
 =?us-ascii?Q?QmQmJP9Gjh/Q+KYsBExzaoD5bhq90w/NgXfdqTAWYB2PIOOh5Zr+G9f4yv0P?=
 =?us-ascii?Q?jxe8N5eiw8Z7Yo9sxhJCVZMAYdOTA6Skk7xF0mi6zl+MYB4Jw4Q82UTMcdcH?=
 =?us-ascii?Q?CRP/L77/nkmsk5RBdlb1BIt7Xli7856W5tA4ag4VJiZilttUUVd7aPLzc/lR?=
 =?us-ascii?Q?EPkitVKGxfz9mtSMg3wa6aevSKFmyCS3r/tEXX61NGnA5UKSEKq/ptEOeYc0?=
 =?us-ascii?Q?gzVZTNhRyx8NKk29fYizg7ZPqnZRfAfF6X4plRG+DYenWComEVLZ61u786Ms?=
 =?us-ascii?Q?8gmWI9l/IE/OCXs45I3JRhnI1BvwHp2iyC31CeUu8en8I7yHW8JnQdUJndGs?=
 =?us-ascii?Q?U7bfITvpaHIxcYlesr8RNQWjOfkRrfxh4ju8EEMdAmlSpsC1N3DKcMY4c52K?=
 =?us-ascii?Q?SMlgHuuubdWQrsrdGL7euxpFLaxPV13Uy1zj/hXX4uZ2uVvE0Iv3FtGLcirR?=
 =?us-ascii?Q?mA0Vs+qqFPWfvY+uL1R8DGp3FJusf3h1+neDP4Oo2oX0d0HXlFcbA62TmuTD?=
 =?us-ascii?Q?vFyXvYvtez0L9efZd6UKA4wOZ6+56KQ5QXXIM9miOXGmcAeFy9nlh/59YYDJ?=
 =?us-ascii?Q?sAsSzNJbSX1i8GNKm3u0QSP48hleflxwkO860QUGd928wZqQPpeCKrgce6uZ?=
 =?us-ascii?Q?RHJPjhDX9FZ3rAXY3HCl00Yrb6zaI6zE4VIt9+Ibq1kiFCHVOQ1p8UgBUsXT?=
 =?us-ascii?Q?Cat7EK3X7AKmfSpAtjicOBfSMwxhxOFKiV1lDcPctVNUARMM+hhvKuUUhn53?=
 =?us-ascii?Q?pKFSq/pylSbjWadUzwdckoQSntxGpMKRatvJIUayCsrMe+BhjG5dYipOU/zG?=
 =?us-ascii?Q?1YpzQlMHLBV0A0I8tWHBlCkEghC6wuD0FRgrEMaJ5TwA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61eebe8b-24e0-45ed-cfa6-08ddfd162a7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 16:02:59.9789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZXtdSYCNRWS0y1pfnn15X9gjjmNqiSIHUeZZR2Is7A2RObc+R4qPSkZvmeyoISEPv3WM4xejHJcFJxmMkQnNwKCYlHEIb/WOcO8a2HrKHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8367
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
Sent: Thursday, September 25, 2025 3:15 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>
Subject: Re: [PATCH] drm/xe: Guard against NULL return for xe_device_get_gt
>=20
> On 9/25/2025 10:41 PM, Jonathan Cavitt wrote:
> > Static analysis reveals the following issue:
> > xe_device_get_gt is theoretically able to return NULL in some cases, bu=
t
> > several use cases don't check the return value before performing a
> > dereference, resulting in a NULL pointer dereference.
> >=20
> > Add some guards against this.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  5 +++-
> >  drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  7 +++++-
> >  drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  1 +
> >  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  7 +++++-
> >  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  | 24 +++++++++++++++----
>=20
> at minimum, I would split this patch into tests vs production code
>=20
> >  drivers/gpu/drm/xe/xe_guc.c                   |  6 ++++-
> >  drivers/gpu/drm/xe/xe_hw_engine.c             |  3 +--
> >  drivers/gpu/drm/xe/xe_pmu.c                   |  6 +++++
> >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 10 +++++++-
>=20
> but likely each file/component should be fixed separately
>=20
> >  9 files changed, 58 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/=
drm/xe/tests/xe_guc_buf_kunit.c
> > index d266882adc0e..6582aa4404aa 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > @@ -57,13 +57,16 @@ static int guc_buf_test_init(struct kunit *test)
> >  		.subplatform =3D XE_SUBPLATFORM_NONE,
> >  	};
> >  	struct xe_ggtt *ggtt;
> > +	struct xe_gt *gt;
> >  	struct xe_guc *guc;
>=20
> please try to keep vars in reverse xmas tree order
> > =20
> >  	test->priv =3D &fake;
> >  	xe_kunit_helper_xe_device_test_init(test);
> > =20
> >  	ggtt =3D xe_device_get_root_tile(test->priv)->mem.ggtt;
> > -	guc =3D &xe_device_get_gt(test->priv, 0)->uc.guc;
> > +	gt =3D xe_device_get_gt(test->priv, 0);
>=20
> maybe we should just use everywhere xe_root_mmio_gt()
>=20
> that should free us from asserts like below
>=20
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
>=20
> which btw, is wrong as gt can't be ERR
>=20
> > +	guc =3D &gt->uc.guc;
> > =20
> >  	KUNIT_ASSERT_EQ(test, 0,
> >  			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gp=
u/drm/xe/tests/xe_guc_db_mgr_test.c
> > index a87a7b4b040a..69c1d467e2ee 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> > @@ -11,9 +11,14 @@
> >  static int guc_dbm_test_init(struct kunit *test)
> >  {
> >  	struct xe_guc_db_mgr *dbm;
> > +	struct xe_gt *gt;
> > =20
> >  	xe_kunit_helper_xe_device_test_init(test);
> > -	dbm =3D &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
> > +
> > +	gt =3D xe_device_get_gt(test->priv, 0);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> > +
> > +	dbm =3D &gt->uc.guc.dbm;
> > =20
> >  	mutex_init(dbm_mutex(dbm));
> >  	test->priv =3D dbm;
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/d=
rm/xe/tests/xe_guc_g2g_test.c
> > index 3b213fcae916..4675d92366d7 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> > @@ -356,6 +356,7 @@ static void g2g_distribute(struct kunit *test, stru=
ct xe_device *xe, struct xe_b
> >  	int i;
> > =20
> >  	root_gt =3D xe_device_get_gt(xe, 0);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, root_gt);
>=20
> adding random asserts just to make tool happy is usually wrong IMO
>=20
> note that tests should focus on the test scenario,
> not on validating preparation steps as those could be hacky anyway
>=20
>=20
> >  	root_gt->uc.guc.g2g.bo =3D bo;
> >  	root_gt->uc.guc.g2g.owned =3D true;
> >  	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, =
root_gt->info.id, bo);
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gp=
u/drm/xe/tests/xe_guc_id_mgr_test.c
> > index ee30a1939eb0..44b72a6aba85 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > @@ -11,9 +11,14 @@
> >  static int guc_id_mgr_test_init(struct kunit *test)
> >  {
> >  	struct xe_guc_id_mgr *idm;
> > +	struct xe_gt *gt;
> > =20
> >  	xe_kunit_helper_xe_device_test_init(test);
> > -	idm =3D &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm=
;
> > +
> > +	gt =3D xe_device_get_gt(test->priv, 0);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> > +
> > +	idm =3D &gt->uc.guc.submission_state.idm;
> > =20
> >  	mutex_init(idm_mutex(idm));
> >  	test->priv =3D idm;
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu=
/drm/xe/tests/xe_guc_relay_test.c
> > index 13701451b923..82973f7a843c 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> > @@ -31,6 +31,7 @@ static int relay_test_init(struct kunit *test)
> >  	};
> >  	struct xe_guc_relay *relay;
> >  	struct xe_device *xe;
> > +	struct xe_gt *gt;
> > =20
> >  	test->priv =3D &fake;
> >  	xe_kunit_helper_xe_device_test_init(test);
> > @@ -38,7 +39,10 @@ static int relay_test_init(struct kunit *test)
> >  	xe =3D test->priv;
> >  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> > =20
> > -	relay =3D &xe_device_get_gt(xe, 0)->uc.guc.relay;
> > +	gt =3D xe_device_get_gt(xe, 0);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> > +
> > +	relay =3D &gt->uc.guc.relay;
> >  	kunit_activate_static_stub(test, relay_get_totalvfs,
> >  				   replacement_relay_get_totalvfs);
> > =20
> > @@ -476,30 +480,42 @@ static struct kunit_suite vf_relay_suite =3D {
> >  static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
> >  {
> >  	struct xe_device *xe =3D test->priv;
> > -	struct xe_guc_relay *relay =3D &xe_device_get_gt(xe, 0)->uc.guc.relay=
;
> > +	struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
> > +	struct xe_guc_relay *relay;
> >  	const u32 *msg =3D test_guc2pf;
> >  	u32 len =3D GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MI=
N_LEN;
> > =20
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> > +	relay =3D &gt->uc.guc.relay;
> > +
> >  	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_process_guc2pf(relay, msg=
, len));
> >  }
> > =20
> >  static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
> >  {
> >  	struct xe_device *xe =3D test->priv;
> > -	struct xe_guc_relay *relay =3D &xe_device_get_gt(xe, 0)->uc.guc.relay=
;
> > +	struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
> > +	struct xe_guc_relay *relay;
> >  	const u32 *msg =3D test_guc2vf;
> >  	u32 len =3D GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MI=
N_LEN;
> > =20
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> > +	relay =3D &gt->uc.guc.relay;
> > +
> >  	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_process_guc2vf(relay, msg=
, len));
> >  }
> > =20
> >  static void xe_rejects_send_if_not_ready(struct kunit *test)
> >  {
> >  	struct xe_device *xe =3D test->priv;
> > -	struct xe_guc_relay *relay =3D &xe_device_get_gt(xe, 0)->uc.guc.relay=
;
> > +	struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
> > +	struct xe_guc_relay *relay;
> >  	u32 msg[GUC_RELAY_MSG_MIN_LEN];
> >  	u32 len =3D ARRAY_SIZE(msg);
> > =20
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> > +	relay =3D &gt->uc.guc.relay;
> > +
> >  	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_send_to_pf(relay, msg, le=
n, NULL, 0));
> >  	KUNIT_ASSERT_EQ(test, -ENODEV, relay_send_to(relay, TEST_VFID, msg, l=
en, NULL, 0));
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index d5adbbb013ec..1a3c2187af20 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -467,9 +467,13 @@ static int guc_g2g_alloc(struct xe_guc *guc)
> > =20
> >  	if (gt->info.id !=3D 0) {
> >  		struct xe_gt *root_gt =3D xe_device_get_gt(xe, 0);
> > -		struct xe_guc *root_guc =3D &root_gt->uc.guc;
> > +		struct xe_guc *root_guc;
> >  		struct xe_bo *bo;
> > =20
> > +		if (!root_gt)
> > +			return -ENODEV;
> > +
> > +		root_guc =3D &root_gt->uc.guc;
> >  		bo =3D xe_bo_get(root_guc->g2g.bo);
> >  		if (!bo)
> >  			return -ENODEV;
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_=
hw_engine.c
> > index 1cf623b4a5bc..f4b9857d6195 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -1071,7 +1071,6 @@ xe_hw_engine_lookup(struct xe_device *xe,
> >  	idx =3D array_index_nospec(eci.engine_class,
> >  				 ARRAY_SIZE(user_to_xe_engine_class));
> > =20
> > -	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> > -			       user_to_xe_engine_class[idx],
> > +	return xe_gt_hw_engine(gt, user_to_xe_engine_class[idx],
> >  			       eci.engine_instance, true);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> > index cab51d826345..0fd12decfd89 100644
> > --- a/drivers/gpu/drm/xe/xe_pmu.c
> > +++ b/drivers/gpu/drm/xe/xe_pmu.c
> > @@ -142,6 +142,9 @@ static bool event_gt_forcewake(struct perf_event *e=
vent)
> > =20
> >  	gt =3D xe_device_get_gt(xe, config_to_gt_id(config));
> > =20
> > +	if (!gt)
> > +		return false;
>=20
> while this fix looks ok
>=20
> > +
> >  	fw_ref =3D kzalloc(sizeof(*fw_ref), GFP_KERNEL);
> >  	if (!fw_ref)
> >  		return false;
> > @@ -219,6 +222,7 @@ static void xe_pmu_event_destroy(struct perf_event =
*event)
> > =20
> >  	if (fw_ref) {
> >  		gt =3D xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> > +		xe_assert(xe, gt);
>=20
> but here, in similar code, this is done in different way
>=20
> how can this assert help to solve the potential/actual issue?
>=20
> >  		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
> >  		kfree(fw_ref);
> >  		event->pmu_private =3D NULL;
> > @@ -499,6 +503,8 @@ static void set_supported_events(struct xe_pmu *pmu=
)
> >  	struct xe_device *xe =3D container_of(pmu, typeof(*xe), pmu);
> >  	struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
> > =20
> > +	xe_assert(xe, gt);
> > +
> >  	if (!xe->info.skip_guc_pc) {
> >  		pmu->supported_events |=3D BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
> >  		pmu->supported_events |=3D BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY)=
;
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_s=
riov_vf.c
> > index cdd9f8e78b2a..0879fd687169 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -177,8 +177,11 @@ static void vf_migration_init_early(struct xe_devi=
ce *xe)
> > =20
> >  	if (!IS_DGFX(xe)) {
> >  		struct xe_uc_fw_version guc_version;
> > +		struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
> > =20
> > -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_vers=
ion);
> > +		xe_assert(xe, gt);
> > +
> > +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> >  		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> >  			return vf_disable_migration(xe,
> >  						    "CCS migration requires GuC ABI >=3D 1.23 but only %u.%u fou=
nd",
> > @@ -361,6 +364,11 @@ static void vf_post_migration_recovery(struct xe_d=
evice *xe)
> >  	while (id =3D vf_get_next_migrated_gt_id(xe), id >=3D 0) {
> >  		struct xe_gt *gt =3D xe_device_get_gt(xe, id);
> > =20
> > +		if (!gt) {
> > +			err =3D -ENODEV;
> > +			goto fail;
> > +		}
>=20
> adding runtime checks against the conditions that shall never happen is w=
rong
>=20
> code is expecting real and valid gt, so maybe it is just using wrong help=
er?

I think it's still pertinent to check the result here in case of an error, =
so this was not
changed between revisions.

Beyond that, though, I've applied all other revision notes to the best of m=
y ability.
-Jonathan Cavitt

>=20
> > +
> >  		err =3D gt_vf_post_migration_fixups(gt);
> >  		if (err)
> >  			goto fail;
>=20
>=20
