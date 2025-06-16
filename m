Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF077C71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC48710E060;
	Mon, 16 Jun 2025 06:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cH/P50eK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF3010E060
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750054355; x=1781590355;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4iOIs2+vS79LdETA1Bcb6Z7Upv3jZapNhwMKvGLWV44=;
 b=cH/P50eKuAPc/fFTPZtdokSpt+O+1zTp5Lw5FnnoCrft+vleIAJ4T6Yv
 PTdMGdAxRemkcATfyxQVOEnQEq8kLcualjn3VhdsfZWzOXyCXBKA0Eoa8
 mjNsL/VQyqyZtGyfb5etuVdeDaEoQcZuy8+r9FzwTqsBYGO5qgr8RBIsV
 VvcRvxVv5adogHpuwA6Mch+rXbPCuxUcWn/cjRDh6a341rFYhtAGwMjS1
 eD68CM57snT3gdnlkZ211KSaG/guzcC25eFreeGPgqL0yM+TqBAjgt0o5
 q+VBW4B/imtu0eVcTZZ1U13AJWo/CHeWH6UbOCzf8wEAMdCimCPyeovjQ Q==;
X-CSE-ConnectionGUID: n2bAZB9AQhmrGPIQLqTDTA==
X-CSE-MsgGUID: s2UlPGwvQfqrC9L9uLBKiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52278265"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52278265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:12:31 -0700
X-CSE-ConnectionGUID: 2QusoYKkT/GbI53r/6iVXw==
X-CSE-MsgGUID: w3sOo//xQyKJpaKWn4xn5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148751373"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:12:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 23:12:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 15 Jun 2025 23:12:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 23:12:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkd2Guw5t/s19VBXLpJYkuHqdPRl0MdQzlXNrfPQKopv76r3cTMZySL/WqwkRPLaYqhA6M97OUpnKjlZR7aZ38HGOOBRx2hOAaVatctPz9B5iEV3TNPxhPQLYziVYcv7/AW5SkogDSd3yZZf7zg2z8x0behPyjdJHpXGAWE0bBYUEPtleesC7Lsm5WMrEivYnqNBFUa+CVs533Ix6SlErOCl+yrlDiPaZ3HFKi+rTGeCWhGJCo4Nqhx1+GqT1ypasMn72kV/2Va0s+rS6TFXwOnsroHeYrQj4eykm/1ADB6wxCmrUrVQdfvsXMEA0K+l/LfAgcLeTNvEIdwCteOD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaUCWujQBTR1AhdaBovaG8owePnZPmySDLMF1LKdI90=;
 b=kt0RillN+F2QHTE1MDaMMe7bFe1zVx/p641s4K+n1/Gl0/4k48tviG4nb6Ks+K8IYj5nEUEABPHX44C15u++LVxPGBNzZYm+PI68PM0W7a6Q6vNAj8kqZoedfryVIQ8TRnK9vulKyIXKzwQKrCZavp0Y6vUNyiegn9WfY7xWwNS9YOPflqlgzWoX7WBGuoTJaMlJ0fgw//yKd12W6bJtAhWAAo4kRhC34XLTXoupwWu1hReineG1yg/vT2sZTM2OguZMbAtqwehPpporvZCLc8juFAOqDbTj8k4dsDusWvsLXd1JIoAE2gAyYySqYQFEIPHkvscnFFyM9jTRKvXzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:12:29 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 06:12:28 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe/pat: Consolidate PAT programming logic for
 pre-Xe2 and post-Xe2
Thread-Topic: [PATCH 2/2] drm/xe/pat: Consolidate PAT programming logic for
 pre-Xe2 and post-Xe2
Thread-Index: AQHb3KzdQVBXaIzNnEGxfRAvbO2zF7QFUbFA
Date: Mon, 16 Jun 2025 06:12:28 +0000
Message-ID: <SJ1PR11MB6204AA20D3F2F853265041698170A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250613214751.792066-3-matthew.d.roper@intel.com>
 <20250613214751.792066-4-matthew.d.roper@intel.com>
In-Reply-To: <20250613214751.792066-4-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6354:EE_
x-ms-office365-filtering-correlation-id: 5b114cd6-ee5f-425e-5a7e-08ddac9cc56f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sADS2gt3izbHyFq1/8ZjN8S+Vzr4ZleVQa6deF3wlgWVm1jAqQOkK28pWaah?=
 =?us-ascii?Q?WjiK/z7cgSuXutoqyiDelvM5irlbmiFCJxetJgxHc8pwEFEzdqDc9kvxCU6A?=
 =?us-ascii?Q?uFRBWzd8/2eZXTXzhEHBhs1nfpG7LM+8t3xOMSnGd5utu3ddOJAYUW6waSX3?=
 =?us-ascii?Q?+V1r7Tg5XIxyt608wPWVgruEgdQK4Gp7IANE2iOYH7pZdtcTzGWpFiuVsdkX?=
 =?us-ascii?Q?bOYrXDt1/qBKKDTdJ5M6eTxqX+4GoRTKGLC8EUrd6cZZB0wRsQSBHTWNRP5k?=
 =?us-ascii?Q?UZtSIoTPUybxud8iKfeOSAkDsVIZpUpv6utSeFN71QTKKQAL4J1gq7eUltW2?=
 =?us-ascii?Q?Tl1cGd7UUVD7pyy87sNgjj1AcEbUJhFFqt4dCd1pObeaqi8rIr7bev+PDyyV?=
 =?us-ascii?Q?S5CK5jkEURU3izcJWI6hcqlRmIUAdRLQOgvmhF0OnETcGk7iwK8zdF4/VM1T?=
 =?us-ascii?Q?c1HTbr+yr7FuRGNyQPOIDzuVJuj8b0LxOGu3eSHiUJG7AKDabe6Jo8luNArk?=
 =?us-ascii?Q?GgnPQx/C29aSjex+NnrFJTWzSc6z+g3jkiDLAPMwY8ecCuyiN4mdV5CmjmBP?=
 =?us-ascii?Q?4X2zQZaGOHReenAP+TMhR3NDBsY7eqV7R+DmDk0hXjPqzBx54bx5/xiZQZ5j?=
 =?us-ascii?Q?4d2MMVGctKF7s6XBWTTFftU07chkB5eD1hQMMo37MrlJ/FzDiqZHDVxwnF/A?=
 =?us-ascii?Q?32WMl6vAxCDp+jBCdSUpY7etkV7RAxk42+UucLFuLrgXrHFQvsE4E7ly4NFP?=
 =?us-ascii?Q?YXi9fELduLpUSYd15UOfHB50z0fto3RYNL1Jmjt+2PAJ29T3W5N+26VCZctv?=
 =?us-ascii?Q?Vzsp+0aC94qApIT3vWckAOBCDmKg3zA5fnX57j/dXbKdHXyPpi/9oAHl6BGm?=
 =?us-ascii?Q?yVFaWCVRPNb5IvjKCq8DY2V4gq9b+EZtpDIv/s+tHekNckzeVT+j3pigBonF?=
 =?us-ascii?Q?FsKoPY+OVhEOruJ5wygc1nYCIf2HEsE94Ttjz/0bfcds7SLSUfoERPtbECz+?=
 =?us-ascii?Q?3i6WkMSPSjilFmnEmoKfq+v9wthSn5UkHzCwH55XTC+gzWzBUDYOe1Dw+c5Q?=
 =?us-ascii?Q?SQ1oxZlXWF99MvzGQN9IFj2joIFz4SRAQDxy/e6O+eVFz9ZeeUanWiUeYu+M?=
 =?us-ascii?Q?Z7O379ydov+xrW36CSl+9afNm+FoQztXDUbq5k38tBc4iJdTnw2jQYpUgHnd?=
 =?us-ascii?Q?zzdt1aN3nZwYegGQxVDP3qNwWj0qxTErZ8P+adYiVrJWDPEPyhMUBvP/RMQQ?=
 =?us-ascii?Q?6heUu7aUqH8XxosNCsiF7CuZFOPhEQmVtF8gId/D5QYB+gQbJoJnLXU3R/T1?=
 =?us-ascii?Q?uA+uDkJCVVBW5/kmT6lvyszpbf4jwJVCeXVeAhPv1+jmgjxP45ZY1fxE6hty?=
 =?us-ascii?Q?zxw0+OMM6kQcf76yS+HH7TROPSDFTI0Tr8OnlT3QLB5AWL8jZz+mrGHw7Jxh?=
 =?us-ascii?Q?qgaAJaUx+r1+Y5lA/RMrD6eTANKYbOXkGanvIQkIOzTagKU+IbTIBA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vDocH+IxIZYbT6vv7GLin45bXziGR7DJc334HWih9KJGvLgHnvr4Q7amzIMU?=
 =?us-ascii?Q?26H3h+wJwlzy2Ng1BTEOguVvKWBteHGQrC3fO+et69+GlKLje+zp5ii9rwks?=
 =?us-ascii?Q?cInlGgURgnj10F+Jfz6uTO3ybq1dk1EkNKUT6e1zBwBPB5lgEFl3uiu8HicW?=
 =?us-ascii?Q?3SXFA2XxmdkCplSu7PVwrmf+D/yJZS5x1m0NU+1+eZ89bm+FP7rH8kX7Ux1t?=
 =?us-ascii?Q?mxMxi5rzM0Om/2KX05qke1Nzbhi/UZvijE7ybU68m75DYOzmjRmdDPBZnmFL?=
 =?us-ascii?Q?4ma2e2PMGYRjYzTh2/zOKGWTDoj3AxuMDFEWmm1VzlPW9ltGh/VHQoMP9j4a?=
 =?us-ascii?Q?TSfjHplybq91DwcT7QSDM+0LNBbxRBTsX/4YBePnsSCoEEDD4ihJ3YCn+zFx?=
 =?us-ascii?Q?jGwOi6KpcwhqEKKqK1CRn9vccnMnGQGwfdlHz68NP+ji6IyZubfe1fTJBbkS?=
 =?us-ascii?Q?LxgQnvlG2iJb45O9/fiR1KTCOzi8swCqHLu3F5ndD+F0HLQaTHqcQ8UmS5AY?=
 =?us-ascii?Q?859A72WJe7nitgMzdEyqCVL9zkUjroV4xPeTMrlc3T4661vnsq4zrRhl2OVr?=
 =?us-ascii?Q?XVVq+Gur4LdBfwStNrqIE0wU1Lm2oCm9o6czVSzCEKA08qaDNnN7hxjDL2Y6?=
 =?us-ascii?Q?XQIRis2V+4EnfFAPRYubGu5aQ1X3Hs1Kj2HHkNrgnEZoQRR3XizQVSp0h8/V?=
 =?us-ascii?Q?d7YqMIE1jIod4fRHfZJNklKz/raZifJftAdnJog8QZ7st+P1Ge2kRUU69u5B?=
 =?us-ascii?Q?iY8Dlv6tHHDA8Hukb5TD9CQTpvU32T/Q1zkQGmN2rFxsalrIScTft4Y0dMA1?=
 =?us-ascii?Q?jL0wDR7ax8u1q8gHbk49z4IEkNp2xDunsB9U8MVgS2NP9YKuInY4QmHghYvL?=
 =?us-ascii?Q?B/DItVd5ImFgt2aK1nUz+yXTYK6eOfZlc5EAYKIft0hWtM646RCQ94qL0v5h?=
 =?us-ascii?Q?BuNrGwhZR0cF5FbZ+ki3cC8lBu1+fi7KRxLXrhv7S2o+5isErYAvSvYd6uor?=
 =?us-ascii?Q?xa4Rw6HgLFs6uLD/Ew1yQ86flvxhoMSyox4lrIf+N/anrWwpM76mLDpEL8ao?=
 =?us-ascii?Q?xtxz4umNfsGm3/zMRH2T34i64NC6nKqMFlBLvg1ZjVjU7UZWbjJNfp0bORFE?=
 =?us-ascii?Q?R33UNytxA8Gd/bjO7ZRcglnRERUmuF7HWH6P++RGK9GLbvHKIOUNnjY2uDej?=
 =?us-ascii?Q?48QpkafOVBTDdNk+tFUDYzk+imKcgRhi0HJVbWKkx8PD1NT9xFs6nO1rIUpw?=
 =?us-ascii?Q?gf0Iu/nHBAiJGbHVe6cs1rZusYjNrfoq+NDI1QI99byPsdVP5QfyyTOz0E+G?=
 =?us-ascii?Q?oYQZx27pgsVnXFxRJOoa521EC6clXymCuzAnjE927K0h6Rg3Kb/2Hibyjmas?=
 =?us-ascii?Q?9H10xI49RQJHUnWX4RJ9FmfSOg3HFGOizrDk/gPayr0d1FHzRUJ4InmjOnRf?=
 =?us-ascii?Q?p78rUtahFSONNDTWm/m+GRR2tt8+T/x4027xIP3+ve3VcuhhYVajEKPWIVpG?=
 =?us-ascii?Q?mYGi6CYM2TZyzscJZcmXHFw4baRF8+0JQjqxGPT7W3fpfBoYrqb3gMP3ZQrv?=
 =?us-ascii?Q?lJxkiFFdk7R96V5+78mDfN2V5OjlgTiZtraC3w5W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b114cd6-ee5f-425e-5a7e-08ddac9cc56f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 06:12:28.3161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87kF6UmDNZ4lH06VxtCt0XWUr5JW6Nva4x8NgRI1IMX0D+Z7Jqs6BZVCwrKZyU1yBxNodvXpwyG6j6WN3MvUGsYE4Yk5CuLFJ1VXSbDZmn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 14 June 2025 03:18
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 2/2] drm/xe/pat: Consolidate PAT programming logic for pr=
e-
> Xe2 and post-Xe2
>=20
> Now that the PAT settings for the new special entries introduced by Xe2 a=
re
> decided during early software init and left NULL on platforms they don't =
apply
> to, there's no need to keep separate programming functions for pre-Xe2 an=
d
> post-Xe2 platforms.  Consolidate down to a single pair of programming
> functions (mcr and non-mcr) that can be used on any platform.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 44 ++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex
> 31663ead7822..2e7cb99ae87a 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -163,21 +163,35 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
> *xe, u16 pat_index)  static void program_pat(struct xe_gt *gt, const stru=
ct
> xe_pat_table_entry table[],
>  			int n_entries)
>  {
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
>  	for (int i =3D 0; i < n_entries; i++) {
>  		struct xe_reg reg =3D XE_REG(_PAT_INDEX(i));
>=20
>  		xe_mmio_write32(&gt->mmio, reg, table[i].value);
>  	}
> +
> +	if (xe->pat.pat_ats)
> +		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe-
> >pat.pat_ats->value);
> +	if (xe->pat.pat_pta)
> +		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe-
> >pat.pat_pta->value);
>  }
>=20
>  static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_=
entry
> table[],
>  			    int n_entries)
>  {
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
>  	for (int i =3D 0; i < n_entries; i++) {
>  		struct xe_reg_mcr reg_mcr =3D XE_REG_MCR(_PAT_INDEX(i));
>=20
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
>  	}
> +
> +	if (xe->pat.pat_ats)
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe-
> >pat.pat_ats->value);
> +	if (xe->pat.pat_pta)
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
> +xe->pat.pat_pta->value);
>  }
>=20
>  static void xelp_dump(struct xe_gt *gt, struct drm_printer *p) @@ -304,3=
2
> +318,6 @@ static const struct xe_pat_ops xelpg_pat_ops =3D {
>  	.dump =3D xelpg_dump,
>  };
>=20
> -static void xe2lpg_program_pat(struct xe_gt *gt, const struct
> xe_pat_table_entry table[],
> -			       int n_entries)
> -{
> -	struct xe_device *xe =3D gt_to_xe(gt);
> -
> -	program_pat_mcr(gt, table, n_entries);
> -
> -	if (xe->pat.pat_ats)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe-
> >pat.pat_ats->value);
> -	if (xe->pat.pat_pta)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe-
> >pat.pat_pta->value);
> -}
> -
> -static void xe2lpm_program_pat(struct xe_gt *gt, const struct
> xe_pat_table_entry table[],
> -			       int n_entries)
> -{
> -	struct xe_device *xe =3D gt_to_xe(gt);
> -
> -	program_pat(gt, table, n_entries);
> -
> -	if (xe->pat.pat_ats)
> -		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe-
> >pat.pat_ats->value);
> -	if (xe->pat.pat_pta)
> -		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe-
> >pat.pat_pta->value);
> -}
> -
>  static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
> @@ -382,8 +370,8 @@ static void xe2_dump(struct xe_gt *gt, struct
> drm_printer *p)  }
>=20
>  static const struct xe_pat_ops xe2_pat_ops =3D {
> -	.program_graphics =3D xe2lpg_program_pat,
> -	.program_media =3D xe2lpm_program_pat,
> +	.program_graphics =3D program_pat_mcr,
> +	.program_media =3D program_pat,
>  	.dump =3D xe2_dump,
>  };

Yes, looks much cleaner. Do we want to keep this as first patch?
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
> --
> 2.49.0

