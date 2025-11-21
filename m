Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85232CFC29B
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 18:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3301010E113;
	Fri, 21 Nov 2025 18:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T91LnVdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04CA10E113
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763748175; x=1795284175;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ltUG9ajxh8fkCs6uBqIlyRrOyT2Q8C7zVG7qTUQklvM=;
 b=T91LnVdtBT0+l66D0SZ+GoHKjugxMXICUg7Vz9oKQQ5By8sssdWi8sp2
 lXRi0hFitOUuueadhxmXcYdG0uw9ObrTdlDoqqh5holrv96ABzAGL3vkb
 UgQROjeYBbcKFvu1BE4u4FgCV8I04Fs7Hykgju8ZPeTWfAenUcyd7wufC
 rjblTT6mgxSkkSpZ5fyn0F4k1i0UlkV4z1bIbXwmEYYaruXqetJZRFN6N
 H9y8pbwxkQOUVJv3ICWVTa0JEjbB8mVlNoZDHO1gjLBcjCvHDTqxZMtlA
 7zx4/83mKhH+VpLJqOlZZUdcB8ZRuyBiG5v0u+06TJ3gRcHCafZk6qFRE g==;
X-CSE-ConnectionGUID: x/Ee8tMWSEewqqMpi+FZfQ==
X-CSE-MsgGUID: hz6EHMZVRtWHP5B+x5NC0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77320257"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="77320257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 10:02:55 -0800
X-CSE-ConnectionGUID: rauQ8y1SQFW5K1wcwvC4EA==
X-CSE-MsgGUID: OF0AvwrdRx2nnJGhcv5VYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="196889777"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 10:02:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 10:02:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 10:02:53 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 10:02:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNTz+PkHyKjFL10qWv9ruUSUr0SxMdujdf6UBqX4iTKt5Q3MD9r/qNp/kofF5Tsn24M+GWPAs/L4MXek4mMefK7GSrXgPQgvH1Yxm0Ik1s8NaJxo7tUUtHa+yL14bDpO8lIsxXxLcp/80E6/Qpps3t5rliRFhUyo46RjfyMyXNnSI96hw7A8NNd19pe74DdMgsloEzD+XskfgbEms0bIU+hFVYqDC8KDHw2Sz2MNlrMagcaQ1KdkAkO+OaK3zrlwdLgC6nLSR6B0IyPpTb5NXQP2pGxXeh004cIBt7m3zs8lA/qzt3lT3kRaV+2dDR99qc1829/fMEiXpPVOSYQfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8FtiHGOv/xTFmU/e0XOjqPoa5aBKjZGS9G2C2Dalgs=;
 b=F/nVuZmcwUMPKsta3q5qKnVR1q6T/xdFoAfxDAE8YHpfVxVgAh4XAVf5T74Ud5Tu6boa1fSmDS6wf7aSXBspQKFjWN0clXEqPv0E81wYwAz/01ZXR9H9tLvuMZrcjk8ov0dCqivyWtGxPckrFbFO0zSA9FsdYNPJ7J9QwYEOZ59eBOP8MvpV98wKDVbD/RC2zk77tSo0F/lhNaCW3hWFgQxEBnbjO0TSPigFipqeluwSwTBfe1NUJSCskHdOH2zrrAFivx10p0icumOJpWR0a1RX3dHjLiPxecD+PTswHAl40+ElmH5nGUI7piG4ceRh/cAOpT0OLxHSl4ejJR830g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 18:02:50 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 18:02:50 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 03/11] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Thread-Topic: [PATCH 03/11] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Thread-Index: AQHcWGqVsfB7hiUmmUqSE2wL0noLobT9aL9w
Date: Fri, 21 Nov 2025 18:02:50 +0000
Message-ID: <DM4PR11MB54568A7D65434A8212340866EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-4-brian3.nguyen@intel.com>
In-Reply-To: <20251118090552.246243-4-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA0PR11MB7353:EE_
x-ms-office365-filtering-correlation-id: 8c3bc3d7-2103-4903-f080-08de29282f88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?YLE/V1sm7TQ6OAjgrOkZHioCEUM+YNcjL/xFOrPvdYWpI1mp1Bma3ouK4M3/?=
 =?us-ascii?Q?TaO0qTE6NQr+KFLeOJtVxzKtFBk3momoTraHNR2w0hNBf0BDpb619slTBI73?=
 =?us-ascii?Q?2JHnDaVENZ6bXoivonCFAe48D8Jc2GWXndVLZ4qhvgcq/FLv7B6EFginlNry?=
 =?us-ascii?Q?QjvClvdfYYYdq1vJRPcyDsJ/O2Lj4sTZ1I6NnTflnyNcl18AmBzFuE4sMW3I?=
 =?us-ascii?Q?hCvRjBzTVTqtY1JCAJj+KsV1SCEbbJPPNaltStrgGndxDpoYf9Y656Q4lu3m?=
 =?us-ascii?Q?pfI8+ddsO+2fIo+wVPMan270V7nQaaTALj4RUIotKy+A7r2e1HTIVjmGbry0?=
 =?us-ascii?Q?yQP2IQs3i5wMgD62oc76aqr681awRe5RbOFgzI2tmkRpW56GQ3zpQMQI+699?=
 =?us-ascii?Q?13JE9XjtYU7xOXP87jYvbVgJEL3YeLo+duDDgJhiRytqLmcnbszHTQq3k9lv?=
 =?us-ascii?Q?3D2UN5viq5097gNE2BzDAlVH8YS8o9n9TUhPwVRRHRVCDuK9Mp871PejCGa0?=
 =?us-ascii?Q?UO2fTFi1kqrwVeyo4CiCePTHAOEgJFtFif8KvjveQVY53onW483HRGZ2JREj?=
 =?us-ascii?Q?SEbk61snUcfGyg7Su/NaFzEqvQTx0hoEZr0UQSPqjcN7CYz0vwHeY7z7AKsX?=
 =?us-ascii?Q?U5JOp5A4IZPk3kHNvgOoU9qo93+9U37bvAEBj2xQLXHV3YgInxz86YK8mIey?=
 =?us-ascii?Q?o5llbXtn9i3klYLKBXrBvny1sVu9+2HS6QC9IRRA3NwDtrFQOK3mk8kQYHmq?=
 =?us-ascii?Q?udpgoHqP69m6S2Puy4juKMdljIiY8Aeyc/W53c+CjJVadRy14u6KwNQdryNf?=
 =?us-ascii?Q?7nGd2HOL5xowi7illWskKzTWbw1B1PeThsaxTzl4UWsmzRFbVQN4PWZwN8XV?=
 =?us-ascii?Q?Ar4YjBHOXrbgIwDF0t9kmMqR+QScF8r9OKJNgvG2vvvhZnbw3icTZ/bJz7rY?=
 =?us-ascii?Q?KhznJ+fqPS6ncnsJH1706KeP0UH2TnN0vex2wDueaxgUEnZ6HmCaeAD6VSGP?=
 =?us-ascii?Q?HN40YrK50a683tXMdALnQ8xhgxpd/KqJgAZcnQVX8ng+8bES2+aiW7v15wos?=
 =?us-ascii?Q?rtcAfZ8A/08rdIaGLQzMxpJjCth1J+iZbGkX3XN0ftC45+lD8OJLt0EPLOnH?=
 =?us-ascii?Q?cVjpPJG0SPhbuuSp6392kALosxL/4VkmlszZ3717fcf2lB0q844ClOvdIRhH?=
 =?us-ascii?Q?cHvIgPy6yWTzzYNglmbEJ0jE+yk7jOoQrKlI9H+h7w5Lqn6xMbaWO5549UjI?=
 =?us-ascii?Q?ML5SiLkv8NW2HEK9CHy9b9qMmcyb8Vs9N2+iOIoDnWa1TgapSIEBuLXt9YcB?=
 =?us-ascii?Q?upzLEvSeIze9o5lKA0FGDTmd1Rkt4DwGZjzCTbCf3hOWWsGhgCNz08qMBiJ/?=
 =?us-ascii?Q?LXkTqJkFlaGz+Jv1T7dRsMzNGhqqdwj9Zd1mDPIhbO+GWCjOgQE7dh71mmwW?=
 =?us-ascii?Q?lmCbv0cRfcDQkcICXO3YzUvWtTi/Oez0LBWB2kyRnTjcK0+JzQoojkKUx8KL?=
 =?us-ascii?Q?qKsg4HjX085YoRC/gdS7zsqx09Qg3kyAj8Ag?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BarlSHdslQOsPUVtZocFGijCngCQ7EPSaMf6sYsu9YKASF97/yjRpuCDDPUw?=
 =?us-ascii?Q?+gJ0cWRWbIpdKTcZL0J/Gatu6fGa26XqgiXQz/lzHYEzJ2j7RMlJ4LKiibFy?=
 =?us-ascii?Q?vn2jRwoKV7kL60IuMuKvgeV58XTSgDdM86dW855qwWzbHd/GovF0Cb+cUKdL?=
 =?us-ascii?Q?aMb0wWX6OSRzFe+7KnosYK3azA/BnLJGKJpBo/1IyZcga9mdP//xDttxKJg/?=
 =?us-ascii?Q?bBF5hTDLWyrHeT2ubyaobbYtmlZUCqMbyafGPgzfzySg2TGh90yaCKkySyuq?=
 =?us-ascii?Q?WCeiuSPMyRJueZpQHP9A+Fq28OJTCzyS9Q/wrKbjK/iu5L0wT2cPBMlQbpBA?=
 =?us-ascii?Q?ej3RJBKlbDY4cCDXERDTk2cbCYUW5Ckwo08cbqXIAXxsIdD0LechISPvnad1?=
 =?us-ascii?Q?zQ/pbfGTfP9YhwsgPoS22coiMif1mWVh7RWH78lsYbpabA9oVmL5y0z/uWa3?=
 =?us-ascii?Q?vNzilFqtv1NEEf7o+N54QqLKotVc6GUZAkgahlMm5UuX7e6M2++Pa8xMBxel?=
 =?us-ascii?Q?n6v42zxBDwX2PGWOWk00kJEAyxSx9hQxQq7DOrmnkcsy14FL4v3CzmFrmms5?=
 =?us-ascii?Q?rAK73sG2UpCioDP/Cu9TX/a1+acBdRBQ7m5AStucqg+/3fFNvc0swErMDUxg?=
 =?us-ascii?Q?oW0Di24BAT52q8YMhUXWfVKCWsbg/pRtzFaQyyJbIXZHc22eGplSByG6sliZ?=
 =?us-ascii?Q?6PV08wrurmZvVCDxFdnIhGtd+zqNITaNvukkLm+a/j3ebqGKQVKsI0Z5Elql?=
 =?us-ascii?Q?24Zykn7zn6kf88OvGtylbuvT1QIyObIFfjMdlHQz6vBbFvoMTlcbHA/Zp1Bg?=
 =?us-ascii?Q?+JzNSCUIyuVsP65LhiMrYHsnP+sCPcEKu9+fB+/He+9pFbbuBgSc8JEiHyjA?=
 =?us-ascii?Q?t7QYP+3keiDtktTyPC5+0UeH+Eq9HpxK9fK6bMC2w5zYMCH34fDP5V2agniG?=
 =?us-ascii?Q?3m0gdTas/8qWFwdALNnlZ+Xw7iBh6S1wQlzpiqu+EDEWI5do4F3UkM50E+Fo?=
 =?us-ascii?Q?n7kkl0DfpVBCK9tCFlCb9nXgg3H+3UPvypuce7gy9PhB6ScUw+HFQ+qdYXEE?=
 =?us-ascii?Q?13XDVnlCnBQL5b8UPqm8jqbRVVz+Etg+txooSqcCAE3s/iXy5XmO2CRk+bVM?=
 =?us-ascii?Q?C9ax6wVdHvLVOTM8mONybZw0EzBm5IG56KlwxYfT4r2iy7NRgaGKcqy0vWgn?=
 =?us-ascii?Q?hDE9OMzrB4KJ9ukfmdu9ZG00XGiwNaZkvbCI6D9eMPuTDKYrXwFz1x3+5y+U?=
 =?us-ascii?Q?fSGGOZQqmgB8LCSZLzIGhymVJWOsupQPirt9yvp50t3xWGtaLZ5bj1GwwvvP?=
 =?us-ascii?Q?DacMNPCSVV/8XRcuH+giOqCjtov8VG5dHOibGaz9nT6K/oksieunaTXjEpHe?=
 =?us-ascii?Q?eNBhGwNc8GSaTX/EwG+wlOj8LTG35U6YkqjKKTF9yQrnjn76WMNltH6TmM4s?=
 =?us-ascii?Q?WuxYc28ohoos2Qr3dD/I52an7nRBRihQAxD+HSG2Ew3ACoBg6fP+Ejv9jW33?=
 =?us-ascii?Q?CS9aLvHsky0Oy3C0tcdbOGzzKmIk+blPVJmm1bdcV0If9sbFrT+Z1JbokeSh?=
 =?us-ascii?Q?YwnB9KI01D0aH6GxpebvvzBn3kuFGQQ3HxeWZ/uw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3bc3d7-2103-4903-f080-08de29282f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 18:02:50.5862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yZU8oe42qA9GRqSI2uSvIZeRnRT0Gso6hvE/3crDMWrXsn7rRITxp7kPyxln4eWVMRQ2o62g1HyMH8xJ8bQxvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7353
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

On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> Allow for tlb_invalidation to configure when driver wants to flush the Pr=
ivate
> Physical Cache (PPC) as a process of the tlb invalidation process.

How about "Allow tlb_invalidation to control whether the driver flushes the=
 Private Physical Cache (PPC) as part of the TLB invalidation process."

>=20
> Default behavior is still to always flush the PPC but driver now has the =
option
> to disable it.
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 11 +++++++----
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 21 ++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_tlb_inval.h       |  5 +++--
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c   |  2 +-
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  5 ++++-
>  drivers/gpu/drm/xe/xe_vm.c              |  4 ++--
>  6 files changed, 35 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index cd126c53faab..c05709a5bc98 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -34,9 +34,12 @@ static int send_tlb_inval(struct xe_guc *guc, const u3=
2
> *action, int len)
>  			      G2H_LEN_DW_TLB_INVALIDATE, 1);  }
>=20
> -#define MAKE_INVAL_OP(type)	((type <<
> XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> +#define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type <<
> XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
>  		XE_GUC_TLB_INVAL_MODE_HEAVY <<
> XE_GUC_TLB_INVAL_MODE_SHIFT | \
> -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> +		(flush_cache ? \
> +		XE_GUC_TLB_INVAL_FLUSH_CACHE : 0))
> +
> +#define MAKE_INVAL_OP(type)	MAKE_INVAL_OP_FLUSH(type, true)
>=20
>  static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)=
  { @@ -
> 100,7 +103,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_i=
nval,
> u32 seqno)  #define MAX_RANGE_TLB_INVALIDATION_LENGTH
> (rounddown_pow_of_two(ULONG_MAX))
>=20
>  static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqn=
o,
> -				u64 start, u64 end, u32 asid)
> +				u64 start, u64 end, u32 asid, bool
> flush_cache)
>  {
>  #define MAX_TLB_INVALIDATION_LEN	7
>  	struct xe_guc *guc =3D tlb_inval->private; @@ -154,7 +157,7 @@ static
> int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
>  						    ilog2(SZ_2M) + 1)));
>  		xe_gt_assert(gt, IS_ALIGNED(start, length));
>=20
> -		action[len++] =3D
> MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> +		action[len++] =3D
> MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> +flush_cache);
>  		action[len++] =3D asid;
>  		action[len++] =3D lower_32_bits(start);
>  		action[len++] =3D upper_32_bits(start); diff --git
> a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 50f05d6b5672..de275759743c 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -324,10 +324,10 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inva=
l)
>   */
>  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
> -		       u32 asid)
> +		       u32 asid, bool flush_cache)
>  {
>  	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> -				  start, end, asid);
> +				  start, end, asid, flush_cache);
>  }
>=20
>  /**
> @@ -343,7 +343,7 @@ void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval,
> struct xe_vm *vm)
>  	u64 range =3D 1ull << vm->xe->info.va_bits;
>=20
>  	xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> -	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid);
> +	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid, true);
>  	xe_tlb_inval_fence_wait(&fence);
>  }
>=20
> @@ -420,6 +420,20 @@ static const struct dma_fence_ops inval_fence_ops =
=3D
> {
>  	.get_timeline_name =3D xe_inval_fence_get_timeline_name,  };
>=20
> +/**
> + * xe_tlb_inval_fence_flush_cache - Control PPC flush at invalidation
> + * @fence: TLB inval fence
> + * @flush_cache: whether to perform PPC cache flush
> + *
> + * Helper function to modify the tlb_inval fence to control the PPC flus=
h.
> + * Other components shouldn't modify fence directly.
> + */
> +void xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
> +				    bool flush_cache)
> +{
> +	fence->flush_cache =3D flush_cache;
> +}

I don't see this function is used in the series patches. Could you please d=
ouble confirm that?
Also, it would be better to add inline and just put the code in the header =
file.
BTW, how about rename it to xe_tlb_inval_fence_set_flush_cache?

Shuicheng

> +
>  /**
>   * xe_tlb_inval_fence_init() - Initialize TLB invalidation fence
>   * @tlb_inval: TLB invalidation client
> @@ -446,4 +460,5 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval
> *tlb_inval,
>  	else
>  		dma_fence_get(&fence->base);
>  	fence->tlb_inval =3D tlb_inval;
> +	fence->flush_cache =3D true;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h
> b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 9dbddc310eb9..b84ce3e6f294 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -24,8 +24,9 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval); =
 void
> xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);  int
> xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  		       struct xe_tlb_inval_fence *fence,
> -		       u64 start, u64 end, u32 asid);
> -
> +		       u64 start, u64 end, u32 asid, bool flush_cache); void
> +xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
> +				    bool flush_cache);
>  void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
>  			     struct xe_tlb_inval_fence *fence,
>  			     bool stack);
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 1ae0dec2cf31..6248f90323a9 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -49,7 +49,7 @@ static struct dma_fence *xe_tlb_inval_job_run(struct
> xe_dep_job *dep_job)
>  		container_of(job->fence, typeof(*ifence), base);
>=20
>  	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
> -			   job->end, job->vm->usm.asid);
> +			   job->end, job->vm->usm.asid, ifence->flush_cache);
>=20
>  	return job->fence;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index 7a6967ce3b76..c3c3943fb07e 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -40,12 +40,13 @@ struct xe_tlb_inval_ops {
>  	 * @start: Start address
>  	 * @end: End address
>  	 * @asid: Address space ID
> +	 * @flush_cache: PPC flush control
>  	 *
>  	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
>  	 * failure
>  	 */
>  	int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno, u64 start,
> -		     u64 end, u32 asid);
> +		     u64 end, u32 asid, bool flush_cache);
>=20
>  	/**
>  	 * @initialized: Backend is initialized @@ -126,6 +127,8 @@ struct
> xe_tlb_inval_fence {
>  	int seqno;
>  	/** @inval_time: time of TLB invalidation */
>  	ktime_t inval_time;
> +	/** @flush_cache: bool for PPC flush, default is true */
> +	bool flush_cache;
>  };
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 7cac646bdf1c..5fb5226574c5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3907,7 +3907,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm
> *vm, u64 start,
>=20
>  		err =3D xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
>  					 &fence[fence_id], start, end,
> -					 vm->usm.asid);
> +					 vm->usm.asid, true);
>  		if (err)
>  			goto wait;
>  		++fence_id;
> @@ -3920,7 +3920,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm
> *vm, u64 start,
>=20
>  		err =3D xe_tlb_inval_range(&tile->media_gt->tlb_inval,
>  					 &fence[fence_id], start, end,
> -					 vm->usm.asid);
> +					 vm->usm.asid, true);
>  		if (err)
>  			goto wait;
>  		++fence_id;
> --
> 2.51.2

