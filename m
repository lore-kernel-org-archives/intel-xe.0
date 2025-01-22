Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A181C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 22:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E926710E26E;
	Wed, 22 Jan 2025 22:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDs9u3H2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FADC10E776
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 22:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737585138; x=1769121138;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gTok7fpjppCOn0XmREE3EXCwg5Br7wTHIsO+OelNMIk=;
 b=NDs9u3H2m1mgIffvpcKoD0gipr88c+K5qktSBqJuyc9DjPS31lzWzfEO
 ODSl9+zK2vZHZe4+1/Z61vJkC74PIIhCjw01LTra4oTKfK0+ILEoNQnTW
 IHUG5M/c84KX8+5H9QNVIRQKHDEp9yqNSzeaMoUueSzpWOgILbkuSxUW5
 hXhvrbkCHz74fHUOxmzAq98mfpuJTf/WibagTGpQVoPIBcIJEubuYgOLH
 tntsyNpURt9aUid4VnUaq5fZTO8zh5DgveI4+F2ISRAIzRAOwlZ789hkk
 QjQauU0T43mICC6x62c2Tni1OKTHtWgRY8xOFsZPEotcJmUoCUbExhuyR A==;
X-CSE-ConnectionGUID: JQku3apfRemJpOWAPC+SYQ==
X-CSE-MsgGUID: tBxanjpTT02FPjzWi6U2iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37765567"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37765567"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 14:32:17 -0800
X-CSE-ConnectionGUID: y2EYgQpdQPaWIsvf7X/n5w==
X-CSE-MsgGUID: yQFZxnarRi60yPZAov/1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138146386"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 14:32:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 14:32:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 14:32:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 14:32:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPdIBj0rdQZ582wZmCJjJTtjqODUlo3uouWW3bTCeLwOWoR6kqD/+1NY+zMNLn5/KEcLmnMK9qIMBbjpR6bf8FaL6TZ9/gFOePEkD6lgR2vqR17hP5X7SnWdVXvoAEPVkL6c89gcdyyHOF8TJNn0mzdamQ6dOxb1YnM9iK0/tWzVYNxbFQnphBs0BlVd3jM7s6f+MJTN0Za8p3OvsX3XQ0EsmED3dOfEX1UFFyGb4s36rp8hqNNAD3/t3Lod6jJdsrEBLFSrpqnwx11oUaf+79DdjYLKDf+zIa1BcvR5otCF/J0jrn6yLY7+VoTuH8evTq4kOZHvX+0OaYp21hTHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EArOWK+wuc7a2m5GistplfoqqF8jcm/0T63t+yYy5M=;
 b=i+5LiEXiuTWfXgQNF9p+0jKRqECIFlJECPoDNhCXu+FEJ+kDJJmMpM6Lq5gMk/mD7bd/1RxC2W5hRwepg5ncLnePzRJNFtuFwxoPwwlrfW8y3BpfevPJzWWgGhydZWCKIX+JAH+rvLDV7mG6DWX3GCJSgaFpHwXaFLl1pulpeVX0d37WfbnE1G9bbNAQtpPOHZ8B3UxgRoInvVeF5Nrb/7j9O6ehS4g7rAK615yWddkMSLj7akUnEGBCDnbjd56Z5ut/2xQflbjcl7NR7+cD7bmJFmvT2z+mG5Cm9CujRjMegoeXFAQnZa+swzTml11ajmh0WfJf3iCTu+G0DRvqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7734.namprd11.prod.outlook.com (2603:10b6:8:df::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.17; Wed, 22 Jan 2025 22:31:44 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 22:31:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
Thread-Topic: [PATCH 3/3] drm/xe: Don't treat SR-IOV platforms as reclaim
 unsafe
Thread-Index: AQHbbRfDQM2Eq8O6bkGOWQjQdQnTHrMjXGIA
Date: Wed, 22 Jan 2025 22:31:44 +0000
Message-ID: <CH0PR11MB5444B0D6DFCE0A49EB31DE7DE5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
 <20250122214955.632-4-michal.wajdeczko@intel.com>
In-Reply-To: <20250122214955.632-4-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7734:EE_
x-ms-office365-filtering-correlation-id: d6659d9d-7958-43b5-0b09-08dd3b348cfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?bnkdhc8yJhqZJJJJKwC4N7Aa8k6oNJ9WTpRAS+scb+VlxwgP4IPrm2SldN?=
 =?iso-8859-1?Q?X9b7UKBuGD2Pr0eUKGMvjutcTZdQsemgLFz6pyXTOT2wjpjwVOQj8wtl2q?=
 =?iso-8859-1?Q?9LhfNeyXbFd4qs5i9aqejKocFQjP0eCofRAtjfKi58+wYLtR7J7GsnL1ab?=
 =?iso-8859-1?Q?VxU1qNoZhj9Gw/WLTz9YLoxGhqW59VNax5JqnRbC8pTl5x6aLG/4Cz0k3H?=
 =?iso-8859-1?Q?ClDnyF0GI260QeR1/R3f/4oULfzaxj7gpy5GN4T02G5XumS7SV16+GrIeB?=
 =?iso-8859-1?Q?8C20GdnaEIwWW6Zq1WozHGICiLRYa3g7JJxiYUNXkxozpx+GNVrlpSt0QO?=
 =?iso-8859-1?Q?HL3IwZ0lcRGf+BneNTyVYl8suZNTUmJ/kSTmI1zxBtzLhUOI43w6VcRRWf?=
 =?iso-8859-1?Q?rFkJ3eQuWGETee87P0Yl7jF7ZIMGWhSLFHoZU9j4eFE0ZFgKhc73XG33n7?=
 =?iso-8859-1?Q?BJB6+V7jKCgBcUhcJX9h3xDvppDFwUusB1qunwtu4d9SoEHFODigBYZcjr?=
 =?iso-8859-1?Q?xkUTLzNYIdAkfhHwiOWPjs0fcQXofFK63H16QtUPiLk6not4zyN5hURQyG?=
 =?iso-8859-1?Q?AQHw5fS/qcnhivF7qfH58ijCRB0X10NXYLaIYoPbYrUZAn4jXZZBn8qZey?=
 =?iso-8859-1?Q?PV+EoZZUwSIo2Ny/MgbCwjGIFkpqml1GWqM7hYYrFDjDs3nScIkNrNpJ72?=
 =?iso-8859-1?Q?Zktre6Cn5ed0bGLjpQ6o74JDaf0eMrkIst7Tcu5p8zxbxp2sTJnSpDpKhJ?=
 =?iso-8859-1?Q?uvUcSjICsgtjuCWiOMad1n6e3tgh7vr7/C+ZurT1vUP+y2R1GYgiko+2t1?=
 =?iso-8859-1?Q?qnNZ88/CLtNP97dd0JUXhmcsTt1CzhD3YWeMc36/lGmVf2LxuJWqyDGsdp?=
 =?iso-8859-1?Q?+NOk9f6an6QiIy06zZztVLaDv+EGmYgO8ccL5rIzkwRP1sVMJIQDFaFBM7?=
 =?iso-8859-1?Q?1YBpQqkQ5Nmn2KPyUfDE6OJ9QXW/H2aWrs00FLL9S/rS3L+ls+J0zmotqm?=
 =?iso-8859-1?Q?92mSBHm39oKA70ZSRSYr0L+NWvkB8E3JzLp64lQpRZh8VRjt/p/rzhRP0R?=
 =?iso-8859-1?Q?bVt//bxzMxhzHGTR/HBhmX7SSCwpvzPylUP5yLqgjwuRww4nE6NDI9xlpB?=
 =?iso-8859-1?Q?BMBp8eJrBgVI/t6a9Gsc8tKMITqsWtksWJm1IolRvQm9NV/UgkNSk+WT4U?=
 =?iso-8859-1?Q?FY2+/NOl4Zxw2A+k2iWdtxhEovc8QV/KsMQ/zNs2vyu4eQbEvnVyOO1i4g?=
 =?iso-8859-1?Q?LVy9OIE0sTSHTxANSAHugCbgvrtZIPOggGxNdSmL/h0uItgqo9f+3pZ26z?=
 =?iso-8859-1?Q?UuJQOgBNyrScQYgDecqSG4CrAEfiIp7t5F1f/F4QtUvDTWutwFTeKlspim?=
 =?iso-8859-1?Q?ZbHkdhU+Oov9Kx3dBYqnxAMXyXoogtfZY4w2f5uADGZwPz42N0NXl2jzFz?=
 =?iso-8859-1?Q?HmlCdyLrTvl+XQD1f7QF7EtmHTeK6XQrx8iifABVUGhhb/tg++OF/lv0+c?=
 =?iso-8859-1?Q?OG1XqHO/j314OPqiToMTOZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VG0KzqWFkCptHK8grAhLjCyOyTjmpQ04JqjVaCEgZMHB878CsK2SAixz7M?=
 =?iso-8859-1?Q?ZBKliUrnDJ9QovCZ++tZtfejIoWD+HmKhe8CVrOQqmg7DFqjBzNw41JR+7?=
 =?iso-8859-1?Q?ZLdmBk/iD2X76CNNK0G96eJCsqCwm+qCwOPrhQ7eOCL0FInv3UVMxqwCf0?=
 =?iso-8859-1?Q?iEWIQrJw8SuGeaaxmmXK33Pwmn6Yj0cR5Rx8vTgOY5Ir5NaCc3rMX1M/PU?=
 =?iso-8859-1?Q?yX0fBY5/RwH1lbnTY3jpHWBGtH+FkB2xhmum2ow7AwOJ6uNOcZPswsht5J?=
 =?iso-8859-1?Q?d3PsZsFLqx4X5CcMQXBpauxNR9l6UlFPYmO7jg8sEipLHxSwrvXwKzt+/P?=
 =?iso-8859-1?Q?2HXcf7Lvs5ZbVzGyOI1wwwHTHQLDxDtJ8vw4SvDnQdn3JS1f2cI9ABUWjx?=
 =?iso-8859-1?Q?A0GvrZJiytxY8QaW8Raiw0KDkr7eDinUujhUXKxt70L9KNg6FUkP4wlSe2?=
 =?iso-8859-1?Q?qoeFMZhGl5/BNlJc5ayRW619Sl6ExoSB1j1udyzWGeZhWhFQIMc/jSHfiF?=
 =?iso-8859-1?Q?QfGq3aVnKifsxcFsa/FXlcPguIWnhlhMzzfjs3xlWuHs6C+JR97dIU8jhH?=
 =?iso-8859-1?Q?glhqbIq0pM/5O1NkyQOq5mjC/WFFkPIkVzjiXhfgenqzUpBTP82zKtpNAT?=
 =?iso-8859-1?Q?Ih51VwZLR98ZW/tC66nk1D2eKyOKCKd5TSex1uha5II/5qZ79eB24PIYkH?=
 =?iso-8859-1?Q?9xQx4u1wRtETw67fj1w2eu1r6AZmT18XYgFnQVYznvie6rGzqfdMkhcQql?=
 =?iso-8859-1?Q?+3meDS/6s0Qq0gm32OfVmqje1FyQRopeal/gOdwqG7lSDQyP68db6W4bID?=
 =?iso-8859-1?Q?/kjY+2seLKX3HNH1+P5YchKpTj9glUR326pknl6kTDcIRvKtnQQ/6fLSx0?=
 =?iso-8859-1?Q?l8TXotnn/BSjwfXzSiuX2y2+xvU7hMyF1J8uwjXxXegvckaszS98/CQxWo?=
 =?iso-8859-1?Q?C0nfotTUQ1Yc78kUh3vgEEvbXFEexc+CWQd5whwN7lmKgLOlkaNbWF7LFl?=
 =?iso-8859-1?Q?M1xnn1u04BLyZ2oY//SIAU5WVOoRCuaK3To4jxTnkHO918ClmsT9eri6Ue?=
 =?iso-8859-1?Q?/7pL0Q8CVLNheCiCnZI4IH5y0CMRGm6o4zCuJn/2FUSvL+jO6gnAdamDsD?=
 =?iso-8859-1?Q?uAlDs/9mzv5T/qcQOo1dAoOyUIuq9cLzaXX1j0pd1dgt3QBRi3NGB/O88m?=
 =?iso-8859-1?Q?2vWZtQLLoORXunGankx9GGS29Ld1JGmc46wvWB+FlF/aG5zpqTHA5nhGEO?=
 =?iso-8859-1?Q?JLKrHgWfMevckJdMKN4wWRJblKIJglUzT5I2+7lF6lNuENIPVxp9PtfSFw?=
 =?iso-8859-1?Q?zTQa8+3IGyhQWXoGkKAfDfqjCyWY3Fey0E97XEVFyx3++e00z34QNuVTCd?=
 =?iso-8859-1?Q?iObRjmFIB8F19shdHiCXwYQwjGDi7UFdK/wVgkcsNW0NNPVBFxjpDt0jlL?=
 =?iso-8859-1?Q?OdZZCmuZ/RBlEYZFSjpAPkVa+1wfcs2eZAuGOv9/vrfTQxvyNzRSHWjR58?=
 =?iso-8859-1?Q?5X6iBMv0acI1uyOGTpU4PPBuuQQmNHi0y+8DdGwDJgB8m3pMwFCNjtX+T2?=
 =?iso-8859-1?Q?37UgjFEBX2at/pcqPRSbigDPij/J4bu7SoTjpW/b73c6UCaZyUKNd5hAFz?=
 =?iso-8859-1?Q?braGbLa0QSJWIglafEwW35+6K3Ybs64Tm8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6659d9d-7958-43b5-0b09-08dd3b348cfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 22:31:44.6040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHpFRw1kjExtFCFQuCNxpq2keLTuZttW7wVw+BlU3mAGtmYoCrrYscul/KxCMib5eibyy+PgQYPyQh8EuDQi0A9qCMWBoLXsuGcAAEX/vO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7734
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, January 22, 2025 1:50 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Thomas Hellstr=F6m <tho=
mas.hellstrom@linux.intel.com>
Subject: [PATCH 3/3] drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
>=20
> We believe that we stopped allocating memory during resume or
> restart steps thus we can say that SRIOV is now reclaim safe.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>

Assuming this works correctly and the belief holds true:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c9cc0c091dfd..1c42c47a3005 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -90,7 +90,7 @@ static struct lockdep_map xe_pm_runtime_nod3cold_map =
=3D {
>   */
>  bool xe_rpm_reclaim_safe(const struct xe_device *xe)
>  {
> -	return !xe->d3cold.capable && !xe->info.has_sriov;
> +	return !xe->d3cold.capable;
>  }
> =20
>  static void xe_rpm_lockmap_acquire(const struct xe_device *xe)
> --=20
> 2.47.1
>=20
>=20
