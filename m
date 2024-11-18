Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336DFD60CFA
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 23:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E1610E190;
	Mon, 18 Nov 2024 23:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3PuO1qR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4289610E190
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 23:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731971713; x=1763507713;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aoq69JCrOe7Cu9tn87iLpEwofLyJCq6xBhp+Mr2/cxM=;
 b=O3PuO1qRGLPpo4/5DkyR5f2bhkIeNaduaB5BOUH6RVyRj4DH4mIYGkb+
 LYWlCsLL45hFPhElCtaLElRAeTAmcsKBXdGMgGsB/riaL0CKaAg5mjiG1
 zvSjqx2aytO9yMj3bW1o4ot0IQ+8Br8H9YPwQxL5qwNjRGwME9wGs3JSA
 yTBPo8+94dJJcEfR9Y6/z8t5nSVcLard+gck0TwLo8zOUk1qLtzH5Pimq
 NtkFG/ZxDgk1N4A7dlJyhjEaaMXXHVLngt2mmrUliTWryddPr38d8nJoN
 6ZWnGefnf5RTCQuLDypuPohXurnl3ecUzXURYYxwJRGK1FyjTKus2wFso Q==;
X-CSE-ConnectionGUID: X3IJB0QGTwmqGTZXxwdbAg==
X-CSE-MsgGUID: ENEg9sCrQGOB8LNX5ujC8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42466333"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="42466333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:15:10 -0800
X-CSE-ConnectionGUID: nDxma/JlR9mH3YH3D1S2mw==
X-CSE-MsgGUID: 2RfcshHlRxuFB2ay/o4e9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89777019"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 15:15:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 15:15:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 15:15:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 15:15:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaEuWskJuzhKFJ4fJB0RRv/i6EBOs+OlDi5PdPb0vrmoQn/1UAxGTtQgSqDYfa7Qdy+wOVW4Hn9XQ2ZVornH7223GTNF95zffCk7d3Z1TNjBmnHJXnVcPO6UPX+f9m0cZY7FDBVX89aM/4pXymSDYsMMCu9OXBAbzmpuVw8/5O62FALbbguqJo/7Udecg4jpRuPIm2W4QP2vDA+fe3sFJ/DkVEca6CvPhMdhVLEgGaZIuWDY4IIqn2oTvZoKoVKTT9P2lIE6y6JuOzlqE07l9O+G77A2v4fBt+GlwqSSwguh3DoMoMXQTmtx0+fq35AwizsFNmiqTjUm9rZAV44RmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dN7lBDBAXT/IHBZDghvzCE5/Hcnql1HXwGgKYJOYto=;
 b=bCPWXk/COnkb2TIEZ4KtCbrCHkNQQ8rEQ6urgQROcFLVLJRD9qtTXDCXJzVqRYl0Jc6a/MIXP2I8GyuFVmbkhww2PTWdCLmOejh78HWJUhmTbYa69J3h1LU3q5cNtmWkTBd5emvvScO5UL+Ik/3KG2JBNPpDtSYz+4GRIJ5ObmuIl322dYEJnDDMnDHIEm641n9jLp1P5eyd0iM8+zl3E+gXNHq97B5wz9/KV7fckmUKho5mHgoSsbBG3UjNDfAkpBzTBY5APG0DGy1JYjpxDRLdBWpSG56yFHNj+myslTgvOcIqeNlcUF6g7lYMqrJZ3owUtaYsQTcSZppkuJHYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 23:14:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 23:14:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Sort again the info flags
Thread-Topic: [PATCH] drm/xe: Sort again the info flags
Thread-Index: AQHbOgn9rZp9HF1BMkOyafob5EYsUbK9qtdg
Date: Mon, 18 Nov 2024 23:14:58 +0000
Message-ID: <CH0PR11MB5444B4AF62EFAC8F3230978CE5272@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241118223314.1969166-1-lucas.demarchi@intel.com>
In-Reply-To: <20241118223314.1969166-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH0PR11MB8192:EE_
x-ms-office365-filtering-correlation-id: fff98ccf-ecab-4973-342f-08dd0826d265
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9j6v6D8T9PIq2/g0AVrVDVpkO8KfI8nF0kjys0woZXdt8x7O6Cluokp8W3Xs?=
 =?us-ascii?Q?indAp+v1nKJtvEuKEl4uZr6TJKMaPUpHpn3kFEKIVRYDdpODhYfTKnvlh2/6?=
 =?us-ascii?Q?8qa3t0UJK8jD5BXOPFC3AsAl0/IbQFBqCYHdkQTOuNRSklhymMURVseiS96S?=
 =?us-ascii?Q?s1t/MNju4C0+mTzW4To2l7kkX76pxH7FyIP96AOTTlXnP8Ni3XWU1YYsrWLt?=
 =?us-ascii?Q?U5njvgX53ydrHdJW9S0aqYNcvw8quf950zOddlnG4joW1ZDnWZn1HNN7Sg/7?=
 =?us-ascii?Q?VW9VI1xqQdo/eKTAZs1nRwKhewSmLFXCb4g8LsSnWS0Be6zmvTwZY06yXQqj?=
 =?us-ascii?Q?dlJGIg81bgNAw7kcyd202L99i7RmZecRzXP3uoM8ySWpKawYIhdLYBlZJnDM?=
 =?us-ascii?Q?DD7FmTEzxYvNTWfNi+rK9HRr5Zu5WGgVEq+uq+i8nbp3cLoBCGfAv8QwKNz4?=
 =?us-ascii?Q?Nenps9F+CmGhSRro4msQWi4D7R3xy5YKByanrPu5kS2TwrhOngWaSQzBkfiD?=
 =?us-ascii?Q?5TBDVPXI8W+z6pRfH6/j7nDSvUuxesR+dK8v1H0zNkmEfEZeJQKxNvX8oEXi?=
 =?us-ascii?Q?2pUKodynMhIEGJ7eadLsktnn1Bpq2Vfwe7KetXWXJLa3+QzumJDIJ44Tqcy3?=
 =?us-ascii?Q?yH2TpZPGcKoonnYuSk2SCqOjKGjtmQxj4GGayGK9TXBK9ZcL3PeftYCsKWij?=
 =?us-ascii?Q?OpRKZWNUOVza8YTmaHNbeMmFDTeK5yvINbz1UT2aswABzGbN+lQhFvwDLNGo?=
 =?us-ascii?Q?99C3VfLaEcU1unQwz7jHup46DvhRjCsgzffYHD+lPJFhLLJg7SYJy+Pnc61N?=
 =?us-ascii?Q?C2EkN6nEX8iO2LFAVdJMKgk1jEsZtvAYKA2rTu6MET4yqnDEhQOHtUHstvlO?=
 =?us-ascii?Q?gTmq4DNe4U6NKB02sCZctChTbhkDIOxT0mLyYV4VTvvZRn1StOzOzvj02yeE?=
 =?us-ascii?Q?p3TWi+3KYkvpCAMMYRUHHy5q2/L+hZcIEDR+IML2bMANPEFg0vmRgZUVhYJ5?=
 =?us-ascii?Q?drjBttLSFzBE5JFg4GVRnAk5saSDMilo+o/xTTs2tpUXpsPIKr+1l/xgH0+E?=
 =?us-ascii?Q?FiiPCh/x2rTFAx45lgtQ021Tjj7OsmS9lawNL7/QyFNV03AQzh+R9YbT2TRw?=
 =?us-ascii?Q?51GvE2D0rI0rJWQa3yudKhC80t7PDiS8RDaVD/Dgl0cGJfpHp7Fwt7pUjBnC?=
 =?us-ascii?Q?5v+l/11/jPPE6rey+MgktJvh3yzXSvMvbjb+N6rKKYLChRLOufHX/wg/B5du?=
 =?us-ascii?Q?D3V36kYr07S3dSUyApyL1kroAKfHclcPr2keF77jM0h/aKjjd7wEkE7t06br?=
 =?us-ascii?Q?CWjr5aYHLTXhZJbLDJGfDR2KEDlWZY8m4KNtVpxIh8v73LXov4+6arwDGBET?=
 =?us-ascii?Q?lrc/oag=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A6sEIKGIqFI5aUjink28YGI7B9uFp0Yb0iXy0v/yc1g8Y0fkhC8YLIFZo7eY?=
 =?us-ascii?Q?O3DkJJOuzrVomGmY/xkWce6zBdPzvWB4K852kJh9Ti2B1MxrLwprlQkFCcZE?=
 =?us-ascii?Q?+eEXXVT+50LwO8dmwMnSdWJHWP/0JpNIH2cpjVqw8QdRMScDcA+YUaiCaUWP?=
 =?us-ascii?Q?aLDId0bJ9Z6BYkn2uxPIQo0dFylmDoY/BWbVFfKVYoF489JCmYioNzT1YYkV?=
 =?us-ascii?Q?oikVjybO1Ywb581BqO/RQPYdCuLQFWPFAbddeWEMW2lDzEWwIX+QVt19H77D?=
 =?us-ascii?Q?/Bj+zw7hbwcfOF+KVtIgpuE9MXN87k0nR5Oc9A7P9wHz91g38P7a/lCVANN8?=
 =?us-ascii?Q?OW+sDLk8J6F60sC1KXyszHRTzASpeEEl4jkz5q38Mf1556iGdYvTKY5qUk8N?=
 =?us-ascii?Q?Yp7zuxAXcIJ9mY3TdtUw36wTphy6rHLwiNP5fnVOQXZyavQB7pny1z7W2NKJ?=
 =?us-ascii?Q?SpIplFOtXOnsjHjd7wFz+Yv2TczPjgeIRFovOSBfd6V5/8j8iM218N5KCx7E?=
 =?us-ascii?Q?pO60Uk6vPfCGXvy5OO3gLYXQPDmmrk+FW14CupOWA5PuugOSWWfjc+gDRFdx?=
 =?us-ascii?Q?Bgq0vXfZdRHNB4Yhxb4LGLMlSObw0oU4LMpmAZPsX6kU6Ff2GqqN8TxX4mPz?=
 =?us-ascii?Q?UECgcJN+SBsehGDqgZEijKOy5GArWrZqMoQZBaEiMXnIv7xcow58beIJtpzs?=
 =?us-ascii?Q?OVYqo8o2VeZInlwwXVHzryrf84ytdCBLsexFIOsbLJeqcoOhx74hHOhupm4q?=
 =?us-ascii?Q?AzqOO93QLBG0T/SU/DCxSHR62rqLuxoJ1tSRX/aDF0cyoDZ32iB0r3vLUEMi?=
 =?us-ascii?Q?0q1679DCkl3HpkOT/r2nzv7BqcnJ20eZMNGwIp54xwazM6+gsQQZzVHnxfVp?=
 =?us-ascii?Q?gfqCdqP4ORYacbrC7GpbBfTccHgzvAgoZLrN3+qQ7lIEKugfIMKFd9cLdN9H?=
 =?us-ascii?Q?xIrGGXvH51Xx/2BkUww9E/LMmn48n5NwUC+JruV9vRGSyPQfYk4tYyT7IyZd?=
 =?us-ascii?Q?4JdH/dX4H2l9qDX2oe05hkHc8W52Gf+mh4WKxo4w6fv3Yw4pn9xG3nYMbfl1?=
 =?us-ascii?Q?E/EaGLl2WuWgqkV2cl7Zpo0PlVp7Ny6OyXxhF7CBQOtqCh4Hk8bLFPoPGbe8?=
 =?us-ascii?Q?CYHdAbc7H98c6GPPSiZIdPp+sDZyZxJ9mVTHYOUcoL8Mcq4VRzi3VkriHDuh?=
 =?us-ascii?Q?ZiwodoLO27CnBqzgJ1IOWrIM/FGYJ+uT7OkzR8nHwNzXHH8WjjPz91yTK29i?=
 =?us-ascii?Q?L96fPMiO6RAcuZVnt8gmTHPfvgXLKait/QryfDwPwq75dV5Qjo/EA7X2XwLK?=
 =?us-ascii?Q?OujujhKNXGtdJK5lzfx8nEncHLOuMHNiCa/SiQC6WfgEGuzatmkEPD9gSqJq?=
 =?us-ascii?Q?5Bb9c+HGEUCOycpjEjvphjQKzesFN88rJolFKO9cCTYamtq0l7E9aFyTwBUw?=
 =?us-ascii?Q?ZmrhdMelzdRStNR7uPGPmtrUR5RA9O3eaAo0Q4o+hCyK7+afxmeIC19AalsJ?=
 =?us-ascii?Q?ToBr2dK4Usykf6YfhR1ppf0Oty51L0D2/9RR0Ur3/e9b/XmYzaaBgMpnzBkP?=
 =?us-ascii?Q?+nBEO1WRSCz+zepjG/FK8cm7yItyu3g9ns7jFKTf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff98ccf-ecab-4973-342f-08dd0826d265
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 23:14:58.7687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGSDnagxp8/SPy7FUpoRKS3xX1slt+z6sDgIPupwOc0DrP5yjS+petzJ8ZLVbqTDRWv81iAbzsIxZlz2nYL0UGug0MsPiUKytX08V8If32Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Monday, November 18, 2024 2:33 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.viv=
i@intel.com>
Subject: [PATCH] drm/xe: Sort again the info flags
>=20
> Those flags are supposed to be kept sorted alphabetically. Unfortunately
> it's a constant battle as new flags are added to the end or at random
> places. Sort it again.
>=20
> v2: Include the other non-has_* 1-bit flags in the sort
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 32 ++++++++++++++++------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 8592f1b02db11..8b2b12daa49dd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -294,14 +294,21 @@ struct xe_device {
>  		/** @info.va_bits: Maximum bits of a virtual address */
>  		u8 va_bits;
> =20
> -		/** @info.is_dgfx: is discrete device */
> -		u8 is_dgfx:1;
> -		/** @info.has_asid: Has address space ID */
> -		u8 has_asid:1;
>  		/** @info.force_execlist: Forced execlist submission */
>  		u8 force_execlist:1;
> +
> +		/** @info.has_asid: Has address space ID */
> +		u8 has_asid:1;
> +		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit =
*/
> +		u8 has_atomic_enable_pte_bit:1;
> +		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM =
*/
> +		u8 has_device_atomics_on_smem:1;
>  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
> +		/** @info.has_heci_cscfi: device has heci cscfi */
> +		u8 has_heci_cscfi:1;
> +		/** @info.has_heci_gscfi: device has heci gscfi */
> +		u8 has_heci_gscfi:1;
>  		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>  		u8 has_llc:1;
>  		/** @info.has_mmio_ext: Device has extra MMIO address range */
> @@ -312,6 +319,10 @@ struct xe_device {
>  		u8 has_sriov:1;
>  		/** @info.has_usm: Device has unified shared memory support */
>  		u8 has_usm:1;
> +
> +		/** @info.is_dgfx: is discrete device */
> +		u8 is_dgfx:1;
> +
>  		/**
>  		 * @info.probe_display: Probe display hardware.  If set to
>  		 * false, the driver will behave as if there is no display
> @@ -321,20 +332,13 @@ struct xe_device {
>  		 * state the firmware or bootloader left it in.
>  		 */
>  		u8 probe_display:1;
> +
> +		/** @info.skip_guc_pc: Skip GuC based PM feature init */
> +		u8 skip_guc_pc:1;
>  		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG registe=
r */
>  		u8 skip_mtcfg:1;
>  		/** @info.skip_pcode: skip access to PCODE uC */
>  		u8 skip_pcode:1;
> -		/** @info.has_heci_gscfi: device has heci gscfi */
> -		u8 has_heci_gscfi:1;
> -		/** @info.has_heci_cscfi: device has heci cscfi */
> -		u8 has_heci_cscfi:1;
> -		/** @info.skip_guc_pc: Skip GuC based PM feature init */
> -		u8 skip_guc_pc:1;
> -		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit =
*/
> -		u8 has_atomic_enable_pte_bit:1;
> -		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM =
*/
> -		u8 has_device_atomics_on_smem:1;
>  	} info;
> =20
>  	/** @irq: device interrupt state */
> --=20
> 2.47.0
>=20
>=20
