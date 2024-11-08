Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D788FD64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ACE10E299;
	Fri,  8 Nov 2024 22:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqlsHMe3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8713810E299
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731104846; x=1762640846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WL/kOAX91DNkQymAtzt70H3OOR3giiLFe1AhvvK2O+8=;
 b=bqlsHMe3+mwVutIVMLS2H0uuTVZ3KSKllCZLv6CMqaEulPsRI/8D78/9
 CbPCTNJehRy/gxMcDRlLrqSLGFqiZc1Jx55Lc2g+JmE1P0HiDuGNY8WC1
 lq3H/0cSw9SnyYeOKF7Fp13GuJ2Wqoj/GxY2U4N6QNcZTePXWM2gFarJu
 wEZ39Abq9TWoeGcRDbDeo4zL/rg7Clb/Qj6OHxxWzt23nKJB0TCprm7Ze
 ib+TNUIyAWX4Y5ZWWtYldKzAiJlye1FAPCXnbGRzfGGSuK04ppxM0hK7r
 VnZVf/Ee5BuPExrQ2dZbu81t9CbKlfx5r3YHzqFJG2PYVhJnYFlh4RM7D w==;
X-CSE-ConnectionGUID: yu6PWxnTTL68eGA7gMTqyA==
X-CSE-MsgGUID: XFIebf5wTiyy9D7mM6gIDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42387530"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="42387530"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:27:26 -0800
X-CSE-ConnectionGUID: fdMyg+V8Tn+ZD1jo3YjlRg==
X-CSE-MsgGUID: Ux7/ydodSWi8XN9mLPVLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85833798"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:27:27 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:27:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:27:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:27:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0+GAcgSjHuoMp9n5h6E7saaKZWqKaHVFPctIlz2XRzly8X+TqGNZ/x+uajnCkdsBJXBrWS+EKjaytn2mqldeXLuz3UhS1Vv2pRQnC8iynw5aCQMv/psrNt1L/AmURRYTSfJehV+mYod748OJyH84M+eH8Hiabq0NuEoz1UjokOh1vuUDUaPTHD3VYbGItyHn0xomWSZ4AB9XPzfXLtLG6EBFUrw7rSG47eZlermSffDU/TRZG/e+Qqgs657qdiTQeE4ch6AsqcJZ6ZSwD1cHTuUpnHjdtAX22wY4LcaBqOz5hxcK1jdHPyID7/ESaWvGns4EL31cjSL2RN9hji/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7kJ7J3n2S6+RoEZBx5ijSlmubs32DGGMPu5gq/G2ZI=;
 b=tYr7ZDGxPOtcIahlUd+IlkgfGZyhADZRmKbDlws/6qVcW5dUVavgxK663+uPrldTkpK9O7tZZ/lxKza//Zz+2TZ3fxrcxx+cndZc+kNhqBJuZbaz+XeM3Oq3ej+gv7g2WcnChOAcinpwXc86AZpNcFsK310bN3qK3aUXt+CMPA4XPbzTW2uTefXqyD2OSuo28BLwreJLQd4xKI71o7adcKJizN+inhelXR+nIj2AehLbzZVFq0uOcH7U6Y1rZOYVBKBXo21qzMCNFM1OSxxtzdoLhWZFA3dZkRaRs2WiEtLR/4yXCfpGKE3E/y7JRYEVrS9pfeGiu/0GgIHdznDkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 22:27:23 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:27:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 6/7] drm/xe: Change xe_engine_snapshot_capture_for_job to
 be for_queue
Thread-Topic: [PATCH 6/7] drm/xe: Change xe_engine_snapshot_capture_for_job to
 be for_queue
Thread-Index: AQHbMgWlCHfqayAXwEimexfwfv6tBrKt9g0A
Date: Fri, 8 Nov 2024 22:27:23 +0000
Message-ID: <CH0PR11MB5444AA077279641D8E901EEFE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-7-matthew.brost@intel.com>
In-Reply-To: <20241108174312.272792-7-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB5279:EE_
x-ms-office365-filtering-correlation-id: 57c34f98-df79-417d-5711-08dd0044841a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?p8w+mp+PFnrnFgaz5Xz2qtLmV9M9L3LJMeL7fl1CsVzzWalW7NhY3m3SwWhN?=
 =?us-ascii?Q?Co9uF/Jfqr0sOMj9kQpiB3aIFyoT8UMeF3h0EjBK+hfqpvdHxABLsEDH5w9G?=
 =?us-ascii?Q?05tHjJe+X08Vw5CKcU7NSv/8tHOPYL/eq5GUKJqSaHpEKAxuvpYwH1p2X/tP?=
 =?us-ascii?Q?OWjEUqGYtji0vNfwWKKeGAAiNetBlzlZHPvroVIV4y9Rp2mKLMz4RipJaZN9?=
 =?us-ascii?Q?C4VgVgMcX+ApnQ4wXiF9vqOFv0jaT/5EfvHvF9J9xPIxFVxF0tWrJGiFsCh8?=
 =?us-ascii?Q?gDE36fFGfqLOdZV5nABnrxHEP9ro4dhuvwkSvQHbceGgnSMx46ct9S4ZYP/i?=
 =?us-ascii?Q?adqdc8aNtw3rPIpl5gF/fBpxMrErPhcYCROHfnjbXkFLsDDsMnBSgkvdxL2C?=
 =?us-ascii?Q?zEg0NcVZGZlqqfSq3c60HdGLO5hvCyQDMGyGGUq0JnN7ghqwfH+ZIpW2iY62?=
 =?us-ascii?Q?7pzKYrBKnLvtqDdjgRExL7kowvragSBsMCALL/W4Y50+JT4/IJs5Vawp2B2C?=
 =?us-ascii?Q?gG5en0tiGODzr3tuaJJRuWRvK7IjdfAbAfv8BCpSu1IWt4yzbS3oqEr0YfPl?=
 =?us-ascii?Q?RT3q3/+S6bkFj0O9tw3HAP216IAlh/UOPcH7sJeRy3m/3AddFNbPOlmNnS8Y?=
 =?us-ascii?Q?dKlP6nISZSUYDYHT7Bb5MpNj0j32aMXXA8OBdDmXcq1tp/pt7a3drUkEn7TD?=
 =?us-ascii?Q?LX3fqs8fQrLVDT6YMKMPCHE1JHPTWcRobt8RdcWPzeJght6TO1f+BTQNmfut?=
 =?us-ascii?Q?raNINttnSyEBjz7q0KnUHzne+IAxluVhrT1ZhaqBgcxoA8sTNBU0x3gub0ba?=
 =?us-ascii?Q?JyztPOBlY/Od03qGTUpeUTrSzg2ruRmxaGw8kpMllpV2oiCe1NStzjpaA5Z/?=
 =?us-ascii?Q?1j6VynE89Z9cdXM1H/31BcjTkyigWyDaxrq4+iXcm3moX/KYGgXqzJiD1aqr?=
 =?us-ascii?Q?Npe5s9gQVn6Kkx/fxayPPFEvow77EEk1WsUnibZaZJ1zz7OOSgyEa8F4o5YW?=
 =?us-ascii?Q?ke73Rg+93Ch3ivhoZqNhZhUFhXspEilik1jqbLfO3I7tnXCAMDSPIposDOge?=
 =?us-ascii?Q?AIErY2Lv4YfIpOcsOi7py+uFQbC7qWEfvOuVRGu6B2AL+ksh0o2YC1rlJj2/?=
 =?us-ascii?Q?OogaTliXSZcoV7Z4mgDlYQRrGLg91h5P3rN8uxHENrpVBesanv1LhX8McUct?=
 =?us-ascii?Q?3MX7metkzCObfI+qgks95u1BYRIq47svFe+MHVdmNQjWwfsdOVfjeV1RxoQR?=
 =?us-ascii?Q?qgVAAFFwWkeDRWhej8aSR9UYwz0tW9FKOGokqqNh52TP+3LAM4pcJX9k7d+4?=
 =?us-ascii?Q?wa2NI5iwNXv67ruPH6MaDh1644BtUBtwFT8Vef2rsfZIjwAuxZvXgSm6dm4i?=
 =?us-ascii?Q?NtHo9Bs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?As3J+0kmBwU/X7Q1SW7MDoiwCvV2nStjN3mZeZdBYk6n+QLbo1GDJByr5xaQ?=
 =?us-ascii?Q?i7UD6UnqXcXgYlNJNQhMCvRRJbOme7PqZ2PrGV30eCEVMc+66nDyNhBuC940?=
 =?us-ascii?Q?W1pxFgoQBjbgipWMLJTVuF29gKEECkVUB04PNprwmf8Cjn3fvOvR9gLfIOqr?=
 =?us-ascii?Q?DF5bEGi0X7wqOdpyT1pUoQd/455WAZGbqK0YsDFOIcmNdCe2SL3C3DgxdZy4?=
 =?us-ascii?Q?a4vTxeYgz4vMWWuHPFCxM14Wv23oHVJ+42FXgXMF4fH+cuRgyjxBXq2Zc6FC?=
 =?us-ascii?Q?2vJsJOgP9Kc3UOpA1oODp6VovqWw7KDJUOTnKH1oI2dy0PONedj3TbtlkPnp?=
 =?us-ascii?Q?9S7rrtF9X0Jme2wYt128EOx3O3OMmcza/4HGpps3aIjhymEpmWbwdK62Hpl6?=
 =?us-ascii?Q?F17EpsDLD9GoDXHdMc/1jUe+WcvCUhrrBXG+B/gomJBZc+Cv4w5Aj7fuTu/M?=
 =?us-ascii?Q?TmlJpQRf9whZwbZvwFDuNhiiipHAvE/CQ5D1Z4YAERa5vCceDjcvSwt94jWd?=
 =?us-ascii?Q?TW1PyxoYLjhIa0Tb8pxV3tDfZEb7h5nEJP7OQ495mbQlUiMoS5cjBT2hDhU7?=
 =?us-ascii?Q?0gIRbt7QzaUN/U1P470cDS1s59f+ZHE1r2iYMsfyPgIiK5ItVp7cjza2fiHU?=
 =?us-ascii?Q?oDnPGue1hC8ojsWNQzgVy7A8XcHXslgeJn5Q38o6FayAeHQIszOSR+J0jtQj?=
 =?us-ascii?Q?3+fxo8ByxTNde6rmRvpUp4F41mTmYd/MyY0xssK6EwlrYQ6zdS14iiIL+t5W?=
 =?us-ascii?Q?qbkrm9i6p1p8xPikPD0m2/g42MaCitJlQUc86/2m2Xm/ueT35DjDQnjXwfSC?=
 =?us-ascii?Q?YDERuW+xNAEsMoXqLGpBfG89F7PLSY4rvfvq6l1+OcwXQZ3cRM5T6xo5qUN/?=
 =?us-ascii?Q?xqzGwrCx0LeT0YnvW5yxZ0qoKo6G77787maRWCOlAAB7DXeJS3PTyjtqhcUz?=
 =?us-ascii?Q?lJ4DUDZLfJ8fPz6i2CbrF5UPhK62lzCJnkPrgxvgGUK4tGMJDyKZWbkU/PvO?=
 =?us-ascii?Q?1T8kyqd39dDmKO7RArm37kqinUE/ddiVCfGaj5jHaXH4LsthoHus36O7hhLF?=
 =?us-ascii?Q?0doTul6jCPExvQVhjTWEAPlLr4zyT34JokJ7Hj4ODHfdme4apfV4aBsYFqgd?=
 =?us-ascii?Q?R/Hvl8GkrO25wD2uOlLoZmz8zh+peCURwTn3KyfLhaaimEAiQ/p26o/skwtt?=
 =?us-ascii?Q?ug/CulDcl/Q3SPAJgd00ClqUTxwPBbSaDfkGX43wh0wqm73ghoykbNEu0C9P?=
 =?us-ascii?Q?bMVoHOYoC18j/gcUA4XCffvXwC7eYLG++RpHshvT9c3E7xJdoviLx7RNtqIP?=
 =?us-ascii?Q?GkbC3BjwPW1IOM36ihg5sH5fq3YFPErD5S3U/Bk5DiRL7LWRWrxPOCNo+y95?=
 =?us-ascii?Q?CkGpJ1rNp7toQlEeKHzfbZqV6lkAx83UTsQs/kRhrxO+jNB6H9tL7BR1gndO?=
 =?us-ascii?Q?AgwZWEoBTF6EM8p1onqqGPxsQrQ671vFbZtvkJL+/VBwYwc1a+Mp9GQ82ieq?=
 =?us-ascii?Q?Lt4qnTtOPoKcJV5/3Pu5iGhcA0syyoI6JBAVc9AmcZ1G/cU+blo36+BoV1Gm?=
 =?us-ascii?Q?gJd0feNSLs7EX2PO2birW99pWWUTcXcORvCubixS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c34f98-df79-417d-5711-08dd0044841a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 22:27:23.0408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3skXtDljuiY51avsyHUPW4XlrPi5CKiWfxJ0WpHM1hZhuIpc8VN1kRBS7njisciu5o0kC1gfNDwO3i7DM+etEBl76foiDH7q/7ueNBpW8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Friday, November 8, 2024 9:43 AM
To: intel-xe@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Z=
hanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH 6/7] drm/xe: Change xe_engine_snapshot_capture_for_job to b=
e for_queue
>=20
> Add job may unavailable at capture time (e.g., LR mode) while an exec
> queue is. Change xe_engine_snapshot_capture_for_job to take a queue
> argument and rename to xe_engine_snapshot_capture_for_queue.
>=20
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Notes for patch 5 apply here: commit message can use some work.  Though her=
e,
only the first sentence needs to be modified, IMO.

Once that's fixed:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c |  3 +--
>  drivers/gpu/drm/xe/xe_guc_capture.c | 28 +++++++++++++---------------
>  drivers/gpu/drm/xe/xe_guc_capture.h |  6 +++---
>  drivers/gpu/drm/xe/xe_guc_submit.c  |  4 ++--
>  drivers/gpu/drm/xe/xe_hw_engine.c   |  8 ++++----
>  drivers/gpu/drm/xe/xe_hw_engine.h   |  4 ++--
>  6 files changed, 25 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index c32cbb46ef8c..dfa946a3793c 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -282,8 +282,7 @@ static void devcoredump_snapshot(struct xe_devcoredum=
p *coredump,
>  		ss->job =3D xe_sched_job_snapshot_capture(job);
>  	ss->vm =3D xe_vm_snapshot_capture(q->vm);
> =20
> -	if (job)
> -		xe_engine_snapshot_capture_for_job(job);
> +	xe_engine_snapshot_capture_for_queue(q);
> =20
>  	queue_work(system_unbound_wq, &ss->work);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index cc72446a5de1..511a8e40d521 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1793,29 +1793,27 @@ void xe_engine_snapshot_print(struct xe_hw_engine=
_snapshot *snapshot, struct drm
>  }
> =20
>  /**
> - * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the j=
ob.
> - * @job: The job object.
> + * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the q=
ueue.
> + * @q: The exec queue object
>   *
> - * Search within the capture outlist for the job, could be used for chec=
k if
> - * GuC capture is ready for the job.
> + * Search within the capture outlist for the queue, could be used for ch=
eck if
> + * GuC capture is ready for the queue.
>   * If found, the locked boolean of the node will be flagged.
>   *
>   * Returns: found guc-capture node ptr else NULL
>   */
>  struct __guc_capture_parsed_output *
> -xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
> +xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  {
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
> -	struct xe_exec_queue *q;
>  	struct xe_device *xe;
>  	u16 guc_class =3D GUC_LAST_ENGINE_CLASS + 1;
>  	struct xe_devcoredump_snapshot *ss;
> =20
> -	if (!job)
> +	if (!q)
>  		return NULL;
> =20
> -	q =3D job->q;
>  	if (!q || !q->gt)
>  		return NULL;
> =20
> @@ -1827,7 +1825,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_sche=
d_job *job)
>  	if (ss->matched_node && ss->matched_node->source =3D=3D XE_ENGINE_CAPTU=
RE_SOURCE_GUC)
>  		return ss->matched_node;
> =20
> -	/* Find hwe for the job */
> +	/* Find hwe for the queue */
>  	for_each_hw_engine(hwe, q->gt, id) {
>  		if (hwe !=3D q->hwe)
>  			continue;
> @@ -1859,17 +1857,16 @@ xe_guc_capture_get_matching_and_lock(struct xe_sc=
hed_job *job)
>  }
> =20
>  /**
> - * xe_engine_snapshot_capture_for_job - Take snapshot of associated engi=
ne
> - * @job: The job object
> + * xe_engine_snapshot_capture_for_queue - Take snapshot of associated en=
gine
> + * @q: The exec queue object
>   *
>   * Take snapshot of associated HW Engine
>   *
>   * Returns: None.
>   */
>  void
> -xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
> +xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
>  {
> -	struct xe_exec_queue *q =3D job->q;
>  	struct xe_device *xe =3D gt_to_xe(q->gt);
>  	struct xe_devcoredump *coredump =3D &xe->devcoredump;
>  	struct xe_hw_engine *hwe;
> @@ -1887,11 +1884,12 @@ xe_engine_snapshot_capture_for_job(struct xe_sche=
d_job *job)
>  		}
> =20
>  		if (!coredump->snapshot.hwe[id]) {
> -			coredump->snapshot.hwe[id] =3D xe_hw_engine_snapshot_capture(hwe, job=
);
> +			coredump->snapshot.hwe[id] =3D
> +				xe_hw_engine_snapshot_capture(hwe, q);
>  		} else {
>  			struct __guc_capture_parsed_output *new;
> =20
> -			new =3D xe_guc_capture_get_matching_and_lock(job);
> +			new =3D xe_guc_capture_get_matching_and_lock(q);
>  			if (new) {
>  				struct xe_guc *guc =3D  &q->gt->uc.guc;
> =20
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_=
guc_capture.h
> index 97a795d13dd1..20a078dc4b85 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -11,10 +11,10 @@
>  #include "xe_guc.h"
>  #include "xe_guc_fwif.h"
> =20
> +struct xe_exec_queue;
>  struct xe_guc;
>  struct xe_hw_engine;
>  struct xe_hw_engine_snapshot;
> -struct xe_sched_job;
> =20
>  static inline enum guc_capture_list_class_type xe_guc_class_to_capture_c=
lass(u16 class)
>  {
> @@ -50,10 +50,10 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_=
guc *guc);
>  const struct __guc_mmio_reg_descr_group *
>  xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>  				 enum guc_capture_list_class_type capture_class, bool is_ext);
> -struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock=
(struct xe_sched_job *job);
> +struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock=
(struct xe_exec_queue *q);
>  void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_eng=
ine_snapshot *snapshot);
>  void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, st=
ruct drm_printer *p);
> -void xe_engine_snapshot_capture_for_job(struct xe_sched_job *job);
> +void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>  void xe_guc_capture_steered_list_init(struct xe_guc *guc);
>  void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
>  int xe_guc_capture_init(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 974c7af7064d..3df8543deec1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1066,13 +1066,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job =
*drm_job)
>  	 * do manual capture first and decide later if we need to use it
>  	 */
>  	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> -	    !xe_guc_capture_get_matching_and_lock(job)) {
> +	    !xe_guc_capture_get_matching_and_lock(q)) {
>  		/* take force wake before engine register manual capture */
>  		fw_ref =3D xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>  		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>  			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
> =20
> -		xe_engine_snapshot_capture_for_job(job);
> +		xe_engine_snapshot_capture_for_queue(q);
> =20
>  		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 1557acee3523..0cfa2b9282be 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -829,7 +829,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe=
, u16 intr_vec)
>  /**
>   * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engin=
e.
>   * @hwe: Xe HW Engine.
> - * @job: The job object.
> + * @q: The exec queue object.
>   *
>   * This can be printed out in a later stage like during dev_coredump
>   * analysis.
> @@ -838,7 +838,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe=
, u16 intr_vec)
>   * caller, using `xe_hw_engine_snapshot_free`.
>   */
>  struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_=
job *job)
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_q=
ueue *q)
>  {
>  	struct xe_hw_engine_snapshot *snapshot;
>  	struct __guc_capture_parsed_output *node;
> @@ -864,9 +864,9 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hw=
e, struct xe_sched_job *job
>  	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
>  		return snapshot;
> =20
> -	if (job) {
> +	if (q) {
>  		/* If got guc capture, set source to GuC */
> -		node =3D xe_guc_capture_get_matching_and_lock(job);
> +		node =3D xe_guc_capture_get_matching_and_lock(q);
>  		if (node) {
>  			struct xe_device *xe =3D gt_to_xe(hwe->gt);
>  			struct xe_devcoredump *coredump =3D &xe->devcoredump;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw=
_engine.h
> index da0a6922a26f..6b5f9fa2a594 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -11,7 +11,7 @@
>  struct drm_printer;
>  struct drm_xe_engine_class_instance;
>  struct xe_device;
> -struct xe_sched_job;
> +struct xe_exec_queue;
> =20
>  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> @@ -56,7 +56,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)=
;
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
>  struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_=
job *job);
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_q=
ueue *q);
>  void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
>  void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)=
;
>  void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
> --=20
> 2.34.1
>=20
>=20
