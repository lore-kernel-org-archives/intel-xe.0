Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F96CFC296
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 18:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BC710E8F3;
	Fri, 21 Nov 2025 18:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIl8PHFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B7310E8F3
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 18:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763748959; x=1795284959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PdfyzktwlM3BDTB0mUwKxhUT5f3/YH1y08OiOE3+HMM=;
 b=RIl8PHFNlpOdRs+TKzwzkXli1CboSwuuei3HcgU4lPxdbmyooGSerrI6
 OakEWFLD0Zv3sFfi2yMMURJlrHNUVRDo3f5rBqA4efVPCrsfbRTmodQ2e
 0JbWqEzH1q4GQWfyNoVu9qZ9/J6TxIUgKWf+dzwHGZyw7DMd0xQwXzecQ
 w2zJ0VGXtPOmE8B0AQ37rG6qdGpORDC6b7BM4f1jhaYDavHFVDwV01hDu
 yCQ2F4ObGy4/cpZUF6oZXKMUzvGfsILEwvUZN9azRPlY/2w6d741mGW3s
 QzTLg7+d0Ta8/aVvX3uwkm4QSC6YC9p7mD8rNQxDbCdL5YM6ksJuiB0Ft w==;
X-CSE-ConnectionGUID: 0CiI+7+YReeb0R6HrMwtNQ==
X-CSE-MsgGUID: ljtpuf3tQrm6RcD42uNOlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65732208"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65732208"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 10:15:59 -0800
X-CSE-ConnectionGUID: zXOYu20FT1WkXvCFik8Ntw==
X-CSE-MsgGUID: y+heV+CgSfWmb/XD0DGyCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191535826"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 10:16:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 10:15:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 10:15:58 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 10:15:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhZs22mZPuLkBL8AX9aPP+tjHvfUM9gj86IHw7BgBfJlgyYRxhfvTOkKNhGYvgsRcavOOHVpsLG7vT02lBNXRPOZ7Oop9GabgI3wc6gKfF2MPf1xo4/oC14dWtx0e2OZ5LahIB4l6wt+JhyZxJJGM/pMnXKYgcstQlElXjet0emlJ9s2SeTz4ZCYjUPVIBno3HhnEtfWezERPRGMODNJIaG2kxiiA/tkzbufXsRPyEOfTe+xeUSt93QJ0ezLfmruB+zmqQWCiD07KTKhqYLy4PkDvSlLxpt4LuYNuqBBfo3Si/d25HqfDYHN2cLLrP42YrjQ5JFlr7i/DIOb13FcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yw+kj2vZwR5pnVOxfyoGdDMd5diXfKh5ZvNDURzAyFg=;
 b=lM3z8LCc1tkuodPvPGftVLyD8xFm9JujVb35sg9UG96OrOaZvArIpLdx/vh/Xu4qZKVM3CgHWmvI4rpwYx6/3sFDLfAuVeHdGPVRfcAd9rVKC51nSPl09mojFUru13ugiQi1J+l5tpfpv0KmZhOT7hkNOyIcvJxBCmA4YGav8UcEM6PvXhxSnDB86J0r9LoiqGKLy22L+gHS0oNLeenb2HE66cAeKIIs66Yr7AhD3x/Un6sq84O2Azhl6JsraSX7VjR8KRTT+PEFdopVOieBmkfOGwyYfsfH8Wxtus0BCn3GfCsNyCYrpg8qwkHrEbtSboSaKkYGGME7NGtJGc3TDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.13; Fri, 21 Nov
 2025 18:15:51 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 18:15:51 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>, "Oak
 Zeng" <oak.zeng@intel.com>
Subject: RE: [PATCH 04/11] drm/xe: Add page reclamation info to device info
Thread-Topic: [PATCH 04/11] drm/xe: Add page reclamation info to device info
Thread-Index: AQHcWGqWVBKyPtyYkkaNVpNRDVrrdLT9dE4g
Date: Fri, 21 Nov 2025 18:15:50 +0000
Message-ID: <DM4PR11MB545629B7C843CA8A45867CA1EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-5-brian3.nguyen@intel.com>
In-Reply-To: <20251118090552.246243-5-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM4PR11MB6288:EE_
x-ms-office365-filtering-correlation-id: f3c6709f-80ae-419b-8263-08de292a00ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?RtqskR66oKv6XBtXyBiD/R8sBhBFdbgX+rjXUQOa9mc2dtsWcxAceUr4YFzb?=
 =?us-ascii?Q?/cZUEpZpK9HFrrtO0VEtWQ+0IWl4AV5debIxqBz+g5cP+2jlwM7GvBD7MpyG?=
 =?us-ascii?Q?vrJrK2PORbSjFnxwD+07EpkoK9rodGi6Qhp3X7SqNKCdXA0A8tSfzHxvUfpb?=
 =?us-ascii?Q?KwwZOtdvymyx31DguQ5v9ypuVodR0T0SfDWR1DEkPARlWUTsGPP8wVw29kSW?=
 =?us-ascii?Q?JRK2TAlqgZM1b7949L24lRpUsO6AEjH2P15WdRSrehRWbF7z/D9GU6IJnrjG?=
 =?us-ascii?Q?kAEIJweTaQlMmKu65guzh2erPdK7mLdSiUh5eV1DyJPBdH0eKJAhCNSCIjaR?=
 =?us-ascii?Q?zck1/Mi0EHo9g0gObo4K0jHChAn74BcQHtOGX6QI4+as4uHRq07yuKei8s42?=
 =?us-ascii?Q?+zKSVKRJxeL5luxTOkijKq5/4OoGCSBLRqauL9ohtXsywxoo05E5EKsgq2ND?=
 =?us-ascii?Q?vkSL8uGl4j2Aa2dGTCGR9FUK6FHnzKDIhGP594dvatmu2mNbGZJlzERk7CFN?=
 =?us-ascii?Q?8TavUxoowl0qAxUKvYwmRmp3e1NTz8BjKZ3hp755f0a7zb8rm2inNoyLjB9M?=
 =?us-ascii?Q?zdkdC15SVVFpyMBPWmMayslYPSenpxXmSbGSkR7f3EbEb1XFVIUD5mwKdJKT?=
 =?us-ascii?Q?8Z/s2SJAc6t37xxp2ecyoANfrjElxwkXumOWWAjh5Q0N0FXUHOjRiiKdVeqI?=
 =?us-ascii?Q?zjq4vU4vk+rr3nIV8XhNOMHm07ICAQYpTKe1m7F1EVJoA7KjaH6lFNjRLMRX?=
 =?us-ascii?Q?79eqPjQsJYGwFukYsGX45ztm7zJJIlJy/3azolPQG6XRBLEslwIOpyl9FlA1?=
 =?us-ascii?Q?1sr/jihy/3atVZIhUz8RRAjSwqhwNJVIOM1MCMCMZAjFYpe6xPk2fBkyZpUx?=
 =?us-ascii?Q?45tWumz6fH8FoeZPq0QLXcVvYcG0pF3aYV8VkvtX4hsUT9xsGGgsgszrD6zK?=
 =?us-ascii?Q?FuPhvKfLzQKPwEQ4CxHlyIt8IvLvSy7EVYHsvXIBSxLIfe1gAs3OVgZNfhsO?=
 =?us-ascii?Q?FECLdA6e1K+N9lRfiP9kun1Swr5LVvA99i98Vhr/iz6P6ZCXloZeMxoJ0/OV?=
 =?us-ascii?Q?MUg4e9KolpaLLoEWfa/os0swvvjTTatt7hHmugnBTjCZs9ltJ5THOXhy8erW?=
 =?us-ascii?Q?+b6gn52qVdY25fw1tahCnnRRL8uaExWyKwrqH1mgNChcaa0QmCy7EYWvY6mV?=
 =?us-ascii?Q?DVdJNecZs/HUgOUP3IuacmlRLz8Eu6qPP945GfQ+JI9MGgBsA+HDyogJt5ju?=
 =?us-ascii?Q?mD/6vFiRvhkPI7hpNxT2EvL5CErdGyQL4OCB7TeIFZ6OMC6Su/OARYwsrVbK?=
 =?us-ascii?Q?He3ZwVKTVzn5LecnQQ281UnqA6qGpgAwpQc7Hzuh0z1ioNOpCoJxgS/GY7pc?=
 =?us-ascii?Q?fakNIRGK3dhnzo+rER/OV6CkddXA9EWu3w1Q9fnVqR9BcE8uzDF4oXH7vHC1?=
 =?us-ascii?Q?C3CITqS7LIk8GeZ4QjgOd5q83nISrMjl8911JclFw34OZ7rJObVCq7pKRc3Y?=
 =?us-ascii?Q?mLcPn48Hgz8CDgm0BDyZNbfsDl2lBQa5rYJS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BgxvxbzW7zdrdhi4EuGLasOS9glqtjcl51P9fHzSKYaSwYftbWP/1gPFymSn?=
 =?us-ascii?Q?bZGuktlwvd44MLiYUk/bOLdaAb6KTnEEwZEJ1p4TxlHB/HEtS8xswrR6/0GZ?=
 =?us-ascii?Q?n7e5mHJDFztuxcs1O35E5EF2aI+6hifb13ggv0AjvN5WZbOdbX1qWJtsmzwk?=
 =?us-ascii?Q?LQwzBOp9Ua5ip9JIiIuw2xbKFuJSBf0nE938CdSI04MWymdAU5N6v3ByrzB/?=
 =?us-ascii?Q?Ug6giHcJHntO7w4f9M+HUPhQ2zJpBZqtibFg0uXG8vC3v4s4CA4KQtjOKPyp?=
 =?us-ascii?Q?LjC1srwSem4ePWmZdRAZPfdrOaNRLo0nrcNPUv7LapBVD92qLSaVAwDi6K6v?=
 =?us-ascii?Q?FwEhEGE3qilzYpVtZEbNQcl5nxb/2hercO6RyxjpmoJrOGZpcX8DW7E0bMBS?=
 =?us-ascii?Q?i7yBBZPiRCh1BzGicwPVZQxRtbY8GdJHoTP/PvvVfwV2w1L5rA2ziHpIMYhe?=
 =?us-ascii?Q?nb5luB3N2g9Tx9iSIBNSKxBPVdaqIktSG6MdpeEjehDPsbc+pwVfCs6/uIxr?=
 =?us-ascii?Q?CCd9rGayE3/fi5/yiqVJqhMztMRhwNTt90g/VfiPCBjdPCgZmQLPR6K9+tEO?=
 =?us-ascii?Q?Oo7u4OtIPW2fjf+p/giK3VwOYfjvIrGpxbhpLANGisUpAt4jyCc0C1SK1jIv?=
 =?us-ascii?Q?yNidISvZOHnsXKDHmvSueOwV0lAwC7H/Zil/vwy5w5VXWvQB1c9Tsk2qyc9E?=
 =?us-ascii?Q?CIgkLYbOaiYwJBorYNx99BhJqhawgfc1RRLjunxVaWPyhr+8N5BeoDpX61zu?=
 =?us-ascii?Q?uVbSC5JegNG+P5jUzte9HzjeD6F6mYYRbrSds6Xcp+OEtv/1hxfn/lfR0LmB?=
 =?us-ascii?Q?DWU5dGyf48LAPtXodkITzgbiAPJjTJX+zIR9YT0nvR+coXjLbK9mvx+pQXUG?=
 =?us-ascii?Q?59V94DARAsjsLMMVV2XZ0d9JK6yrzAA3YVt1uWoR+5Hqr/J5BV4mZfN/WuX4?=
 =?us-ascii?Q?aV79rf70Aa8vg6x9LwRa97oEhdAfvJ7WZX3WCPqKAxIdlbyLm8F/YI+f3PJ4?=
 =?us-ascii?Q?ni7aLIq5y30lDpTZuOOzuTdhiZbCV3PHVGDraKDitd1WxOCiFe5t8GQ8FhIJ?=
 =?us-ascii?Q?f78oewZ4dX/4crhWVqPIWu7GH0oTePNbAexgmVFJkqptaCT+xaxfxq+YFANy?=
 =?us-ascii?Q?PzucGw4c7xbl/t8SXB3rSkx6Q+76WB442vMdns0OxWGb54ahNWgyV4efAPPS?=
 =?us-ascii?Q?QubtkuvSjiSq/o73DE6LgSF1wD8YprLR4CDrFgEXyAjdRzytmhxcnVJmXr1u?=
 =?us-ascii?Q?K5JlR2NmU+d4s+kNQ3QXVgl6aFuwJnuLAZlvtc6YQ4Nw5XDY6C5sWeMuCMQB?=
 =?us-ascii?Q?tzlA8cT8ztzYGN2w1r1dtvIMr962H7WERqk2wyQOgLGZyq2HX/2DwoSoZWsY?=
 =?us-ascii?Q?KlS0koGkLZ6PhQkT+4j3OkmG7FX78MUca0WbMMa1kZNX67D9+TAi72VG5Zw8?=
 =?us-ascii?Q?5YGZq0GlDfxcdgvpDvQR26XX4jwZy6VHzrTrmxgdRFJzxI5hyhfQ3Nj6BERA?=
 =?us-ascii?Q?3Apd/VSxmLV18W5/w2Uhuc0iIlH6sRAHBrZMw/iTiLtY9tvd/ZPNqOYKGsfG?=
 =?us-ascii?Q?5gCENmhkPihEe4b2G0GE4jUDtYP5YQR+g5q/YLQo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c6709f-80ae-419b-8263-08de292a00ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 18:15:50.9546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2lUEB4ymXoFMc8gVA9GUkWURQLX1FcqVO+SguqXGZC0tH3/5ykdQuzZHa0mh7x3J2tqnqyR3OLdV/j7EsTOPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
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
> From: Oak Zeng <oak.zeng@intel.com>
>=20
> Starting from Xe3p, HW adds a feature assisting range based page
> reclamation. Introduce a bit in device info to indicate whether device ha=
s such
> capability.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 1 +
>  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>  3 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 0b2fa7c56d38..268c8e28601a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -308,6 +308,8 @@ struct xe_device {
>  		u8 has_mbx_power_limits:1;
>  		/** @info.has_mem_copy_instr: Device supports MEM_COPY
> instruction */
>  		u8 has_mem_copy_instr:1;
> +		/** @info.has_page_reclaim_hw_assist: Device supports page
> reclamation feature */
> +		u8 has_page_reclaim_hw_assist:1;
>  		/** @info.has_pxp: Device has PXP support */
>  		u8 has_pxp:1;
>  		/** @info.has_range_tlb_inval: Has range based TLB
> invalidations */ diff --git a/drivers/gpu/drm/xe/xe_pci.c
> b/drivers/gpu/drm/xe/xe_pci.c index cd03b4b3ebdb..43c47426313e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -673,6 +673,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_heci_cscfi =3D desc->has_heci_cscfi;
>  	xe->info.has_late_bind =3D desc->has_late_bind;
>  	xe->info.has_llc =3D desc->has_llc;
> +	xe->info.has_page_reclaim_hw_assist =3D
> +desc->has_page_reclaim_hw_assist;
>  	xe->info.has_pxp =3D desc->has_pxp;
>  	xe->info.has_sriov =3D xe_configfs_primary_gt_allowed(to_pci_dev(xe-
> >drm.dev)) &&
>  		desc->has_sriov;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> b/drivers/gpu/drm/xe/xe_pci_types.h
> index 9892c063a9c5..151743d4cf72 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -47,6 +47,7 @@ struct xe_device_desc {
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
>  	u8 has_mem_copy_instr:1;
> +	u8 has_page_reclaim_hw_assist:1;
>  	u8 has_pxp:1;
>  	u8 has_sriov:1;
>  	u8 needs_scratch:1;
> --
> 2.51.2

