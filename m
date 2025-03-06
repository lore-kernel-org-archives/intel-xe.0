Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C18C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 13:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253BA10E252;
	Thu,  6 Mar 2025 13:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2wb0W0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB2F10E95C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741266418; x=1772802418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ppTZOFH3Ha2DJqTr0XMaCNc0vyclNut4UlEJNtp3QHU=;
 b=S2wb0W0wKt87OsXIOhIxy71bwnIRMDGs4dCYvU+S8JqmKtzbl5rVBy4Q
 QEJY+QlOj4a1XuuDlCuMIQmt0h43ZtKU5W0xq13cE98qyFusDeBb0R3d6
 qNQayELmLWR8N7fu2V+ln53bC1HiNU3oYqHqoXBTQCTMbB5uFHXCKi4bv
 CpcIIGCAC2bqFycq3idW/xYxSiWNnw+5bJK6RtBFl2KNXyxvPHK5DJeFh
 Gay0vrmMUL1xy9m+6VZ0JRtoVM0dYm2W0jyAn/jSS51ws22jpm0BJUqfB
 YI5Ad2E7EYsijh/+cAvOrJDQziQ680gR87kTgxUYqgP7t6D4vsouKRspr w==;
X-CSE-ConnectionGUID: yzdMF5XIQgeAig6U4PAkLA==
X-CSE-MsgGUID: odwjhG3SRmivRksPEuMO8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41979836"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="41979836"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:06:58 -0800
X-CSE-ConnectionGUID: +X4e91hiSPWYelDWLTUCfg==
X-CSE-MsgGUID: 0/KBBWRASaKd0jhuShydHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119025921"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:06:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 05:06:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 05:06:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 05:06:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP0ER75pw6hc5rP37gJRbaMS2t4O1+SJrvWDqFVC4Dow4VuZdsUF/a4eALQXOxewHRo3hVBa8ItjRfkndmUxSoWy8TYyEw+KDl455dFkk8DLUuyDcKiYB8Wj63dI/Sx5B1CMCbfUp0jV3j68usvOcgFOm806ssf810R8m8XnPrFKdrblyrmHTiWeMS0eD8VX66emVVeCP0IICETIpWTqELngHehlo3CXgv5hxL1TozGJ1byKjWdQB6NOiJQHBWtReVaYR4pBjivD5KoHZyToZnLpIckeY4olo64w5WTumKd55eXBu1Pgxeut7WoOeXsFKsECS5lEjZk7IsGm+yMd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPn6X78SYTrKi2SoEI5hB1LRWfKk+e3WKRBa0nS211s=;
 b=dlnm7jezznlT17M2E5ETjUA0HlgLtsgy0VsQbHkD0H1EERIxQK2DAe5rkud3bkcC6GwnaSPUpsj3N5RGIyIKpmDZW65Hydfc5gviSY2LbhfuYj5Rp8zjZ9NzUtMEZwd02HakFb4TOZwBZlj/yZVmk0rsHw1PZxDIVyFLOkq5F/OBjxVMOdKGyndr33KAiPxz1M0uPTgP1NI6iksR+cfmfAIhRWO03fjzAUBguJ33Abb9jOHp8L8Ir9gattbYoquA0qDOits0cbO4YkheCuwAeud62x1VwJqoPu54q3NBRJyJV34KscxyHnJ0WLztik9mzlb/1GzOQsXPylOkl7d6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 13:06:13 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 13:06:12 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: Release gud ids before cancelling work
Thread-Topic: [PATCH] drm/xe: Release gud ids before cancelling work
Thread-Index: AQHbjpYSLZ7yOfnB9kqP0iiA2hBPDrNmE6uA
Date: Thu, 6 Mar 2025 13:06:12 +0000
Message-ID: <SJ1PR11MB62049DAB50F1AA8ACBCC0E4781CA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250306125459.975071-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250306125459.975071-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB7247:EE_
x-ms-office365-filtering-correlation-id: af9a6e6c-fa34-4151-c54e-08dd5cafaba5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3XXsXlLjSFKchOb0gsIg2TecwEJoaTxMCyEexqH1i+usd65YlLE3uSrCUajH?=
 =?us-ascii?Q?qp0ovtOWbTKW68P/A8ZiUpRolMJvDHvL4VWwpoUVf0HBibilSOT2Ur4GHxbZ?=
 =?us-ascii?Q?JIYHQi43bYTGccjqU4gilDZ5YxMvZTi+lgZcYqNDf00277Z6Ly/XHAsW3RmG?=
 =?us-ascii?Q?e4YUfn6mCCmO911d35olGsIJNrJc19AzeVxvKr9v2fiDNaXOEr30fwheQ1UG?=
 =?us-ascii?Q?UCV0h4NztNiWDdg+3ww55s3vt8wYJAB+gTM8JR+XHiD6x7gop+LPWivWkhto?=
 =?us-ascii?Q?0sDTKhw+hwr6cPHnTqQlkARCgKP+apyIsW9EY7lJI3htv8tXoyIZgdlHr4us?=
 =?us-ascii?Q?DevG7OnlmDpV7R06Kx2sFtL8i/KTN6nHu4OXmeAn0STGawzEaNL5sWbBGgEN?=
 =?us-ascii?Q?d4abp7o3w3BmkO/3xffjxN4kabxG2XshDX76xWN1SA+nhMa3//jEaBmeVaVm?=
 =?us-ascii?Q?ypAxqWffRrcxMdqU92Gsd+yU5DW7/Fbr5ROGbznF5kOJ9kCWlr/ax0yvjsKV?=
 =?us-ascii?Q?Xpke+zAlyETaVDCTsq7hVLSBnslZKRva9ni0BQHuKnZUohIwfhM/9R10k6y2?=
 =?us-ascii?Q?UwDDh8so/NF9HZqNvKR5gtQ4Kz/Ib9456oVlS6mioRmO9dQbwrItU9y6lwrh?=
 =?us-ascii?Q?eWFZmqMEZiuqAWQeO0EllEQuHsByz3/bbzsiG+OvgPJS8WVRn22TIWrMnjgJ?=
 =?us-ascii?Q?QKLAnu3iAauAZNNPP3DQweT/UXSJwgjNTsbBWheyC5bWf5LonvekCSH/rxOI?=
 =?us-ascii?Q?Y8YiMMaXPifw/4WN2mYPmE1Hsrb0c1YZW88WytHEY65p41w0Lb1nA0N+e54v?=
 =?us-ascii?Q?kCD3nWsCzthFg16AHp/u8zlTgxCI/M10Z7IM0fq3TkAMRNwmkLs4zS0K25mv?=
 =?us-ascii?Q?T5Ewm3yTFVglK4kFBlLykHi0fMLnO1uvkan3zo0sBGMuHydRxE/bjWcCiXRj?=
 =?us-ascii?Q?ZkOkti3LV+uSmnw7dIjWhtkcEJHO3+T290lmJfMfr5YKdCE4GCLXpUjBl02J?=
 =?us-ascii?Q?JImayn9vta/s6Dqc847icrEcCG3S03v1YGVgSG0hu/BvORXPFexAvcZHa0mo?=
 =?us-ascii?Q?L/AkuGxRrgpV9BTxw9yAvwpRj08vJR6Csq60E9gldBVeAliPxq6QgcrWh5lB?=
 =?us-ascii?Q?oL78BCyCo0gvvjkhOfhrwAVI3cguyhFdxrMnQN/5hjdnOddB44JMTgmfR66z?=
 =?us-ascii?Q?lRXV90LPNY+LTHBRrBS/xzSNlvPUyH8Q+1O5JdppYaKqbMlYBlgjzQoryqN4?=
 =?us-ascii?Q?IApb9i7oaUbc8POBY99uenBmQieA3o8/KNSrb0a9tDQBlO4AwjCaGjTVWFw0?=
 =?us-ascii?Q?STFNVp956VFpEqIRnzGAPddA8hBmmlezEUEysAhE3MzjdhgQXwAL9QWmQMqF?=
 =?us-ascii?Q?rkO45+Mo0Sb+8GI6G4md3ZPL21XXCnazG5gx75bPXgkM+kOfk19cRRX8y1R2?=
 =?us-ascii?Q?WNaL2xBGBIw4Cq0zNV0kbRTv64Y5RUt2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sCSx0tK9nBNVvMkIRfNemoUrdPfU/Dynr4T7LqrMKLC8/q91cMGBuYEF1W7t?=
 =?us-ascii?Q?9u+NLCNRe360tsL2ve0XoEZjMS5H8GaQ/ACzdxn7pElKF0Jvjq+0rkhKjGXO?=
 =?us-ascii?Q?k7q+pvdPwkgMpSn+ZrcJ7DJABnv5f+cxskGGi3K7xSO007KxhJnTIWNH2MCi?=
 =?us-ascii?Q?Z6KbRs18ctfUsorBuYFXfKEWe7RH4+TGdBOysmm8voPX7caedpzlN6YJ8RZ1?=
 =?us-ascii?Q?nGW9xcU5hJMvTCXbCOhgS2r64Gz/lKbcsFgG+dSzHJpINc4TqcSAHic0AwnZ?=
 =?us-ascii?Q?tvSuFd5ppcsvcKbkWxSmSoKlyOiOA86BACqKn9M75l40MOY5+ER5aAoAtLNU?=
 =?us-ascii?Q?F/6fL2TWQdCqmYBVLXu+mG5rIY46Cnv7rngGybdV1rWTsfUAtp+/IuVMb7Zn?=
 =?us-ascii?Q?n5v+e1eab0kHy7abT8nP/4iVfTgkMctlIK17kxlDDlARBxpeS7MgMKWWEKKu?=
 =?us-ascii?Q?obdViRrGX5BtufIpBjU4i7/tHd/3S/ih93fOBBG5kbnIcjjx6dm1p9YHIZfb?=
 =?us-ascii?Q?4hlSQsQ6pZSFE8qjdpDQsbH19zo1/A2nAwWmFDRAJi+NYVSLLkeKsTHpNyrk?=
 =?us-ascii?Q?JXjHcCbsRaQ4Bw8eECiLPrpoj/xk50G6w5OP2WM2bO3BcA8xec9zMa+TY581?=
 =?us-ascii?Q?gRTCKr05o9ySMmEHG4hBONVrDX+FzHd718ZXts0IGVjoswUCeXcXl3A4N9o6?=
 =?us-ascii?Q?MuzZ7I9aGK4+H0bahAfbNIB3GquyL2A57ubRvynfSokkaB26QL9m0hfv7r+Y?=
 =?us-ascii?Q?xnjt7sQkbJ6qZXbwcPjAflAVzj+gE+AuKmzrrkM9hz1p7OCcJ/ZMWpoxUE1c?=
 =?us-ascii?Q?4AMNsrYz56MUtUGHmrvBm7P96k5xsF4JPz9LaoKGNDq0oRJhPrq6E7t/xHS7?=
 =?us-ascii?Q?cKxq7Z3c4U7ECUUqo7tGdiqrIZy+a9tX13SO2ZcmuMqgjnJOqKQB0+AuphVC?=
 =?us-ascii?Q?Vr40YcaIc4+JxGa32wz+DlmcPYBZKcD4V46qvqkswztSlvprlPcWxR5Khisl?=
 =?us-ascii?Q?cGIk878qW3sb/iJA49umL8YEdna2liw7vCTpsNer+OBnw+JamLa/IYjghrwF?=
 =?us-ascii?Q?8Nsx4bxI+ymICFO8NofdDvzQcWjtC1Yo/1AuxaLHSvtnClTPEWOGfsuFgWLp?=
 =?us-ascii?Q?Ql8X+d9xe9glE44Oq16PgYjSbQPXrQdrHdR5r0IbVHy8LqeSYpp9+TfrczjM?=
 =?us-ascii?Q?9Acp/ymEygS9J7nbRdQ1DQ7t5LNF+uWIx8En1AoUZwKDSmW6513tVt6Ox6Cj?=
 =?us-ascii?Q?KulR+s1yE9i4lsLpuzu1pB5DxD1Xt3VQUTWgCBofjv7QbfesG+UlkxkWTBBM?=
 =?us-ascii?Q?dHvKaQgQpCGtpJKcizgaJFtLtlYld6PY+/vO6MPLrCsosDLshJ1+R8+ZR1e2?=
 =?us-ascii?Q?uoh1g065Lf8WYNQ9q7UtvNt5+P+3aIPbhMTUc3wOZzGqIWDr0h7gzsCdBbZb?=
 =?us-ascii?Q?6VNglTHiHdqEFlDXgl5NMElI1YX0PjvbLFBleMEHDlifNiryYC/Jo1I+CNN+?=
 =?us-ascii?Q?UAhSR1up+VQzIV06w78grDsGO4PkPL3hz5VksHrHJMYa2MYWs/ToxA9mF/y8?=
 =?us-ascii?Q?gDotNE0C+9FABPGB3gIrXqgOORMLm2cHou75Rmt8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9a6e6c-fa34-4151-c54e-08dd5cafaba5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 13:06:12.5160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zvr1x4joqen9t4W9ElYegB8e4qW/qb/Dp0eScV3GDLJivwsJ1gS2IlYCuWFzwK6ElGfxuvYDwpUiQx2Pshf3huheBEi14IwiGD5hHVm6c6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
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

Please ignore this patch. Few spelling mistakes are corrected and send new =
one.

Tejas


> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Thursday, March 6, 2025 6:25 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Release gud ids before cancelling work
>=20
> A GT reset can be occuring in parallel while cancelling work in async cal=
l  which
> can requeue these workers.
> To avoid that lets first release guc ids and then cancle work so they don=
t
> requeued.
>=20
> Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> Fixes: 18fbd567e75f ("drm/xe: cancel pending job timer before freeing
> scheduler")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b95934055f72..31bc2022bfc2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1254,11 +1254,11 @@ static void __guc_exec_queue_fini_async(struct
> work_struct *w)
>  	xe_pm_runtime_get(guc_to_xe(guc));
>  	trace_xe_exec_queue_destroy(q);
>=20
> +	release_guc_id(guc, q);
>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&ge->lr_tdr);
>  	/* Confirm no work left behind accessing device structures */
>  	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> -	release_guc_id(guc, q);
>  	xe_sched_entity_fini(&ge->entity);
>  	xe_sched_fini(&ge->sched);
>=20
> --
> 2.34.1

