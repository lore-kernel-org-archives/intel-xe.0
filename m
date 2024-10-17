Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C79D2F7FC
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 08:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF1410E7B4;
	Thu, 17 Oct 2024 08:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0rEX5rC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2CC10E7B4
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 08:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729152317; x=1760688317;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gCID7jv+RJNTKtStnDLWnrZcERZTlj5e3qSALpeUQB4=;
 b=N0rEX5rCGM4HwhLrxxU0FLm35bmZNQXeDLEFncygC1lpTQfhYrZ4wmfm
 pPqyLYRASuaSTI8uNKks5qMoapqD11hLHKzZpesZH+hIX/dRRAVwYvBIa
 CKJ72mz6FJAcJ6mYNzp2A5+7TZ9nK4fOp7iN+8Qoe73jq/jFX7D8b66sc
 f/EZtP0RYtuTVgd0TBQ0pKI6N7FgNyeJrdWslD+60bGoTkoKCiLUjqdIO
 ndCHv4E8HdZ5eMKlQ1hY/kfyjdJRwblRbWlG8VQW7Dr5YSIo0sXdOj7sQ
 gdCj5ZlCnVey0kE3wINsW4WIeJzOqA/nRyxzvNwUqqr8MCoRbNVAGNS/3 g==;
X-CSE-ConnectionGUID: v5E+ZbgeSx+YL1uI4d23Wg==
X-CSE-MsgGUID: yaSB5hGWQqqAltm26rkk6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="39212892"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="39212892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:05:11 -0700
X-CSE-ConnectionGUID: p9oQHUJ4Rjq7F7cS61Bl9A==
X-CSE-MsgGUID: ToKs4TjMSd618v9DOICd6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78372596"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 01:05:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 01:05:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 01:05:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 01:05:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpiU8cPrjN7l2m4a2fP0QdAMFqSiPu7/3cZfQFlh/vCIuS00nF8/QkEwUHHKQjj2hywSnKWKYvnq9zjOC8fdt3NrisCM/onmytCDBmUCZyROJtgjJAb510tixw3JxAUSlPv3Pi0DPHBw6iOHAcd8x2ZtCHOMKGztidInx0WC3ohW3kkJl47ZCN4V7k3gUGO+Yokv5jx+3j+hGl5FS+aBN93NwpHoP4YcWeH+fCBK6Ri1I0Oa5FrTrnpVOQPK3vbHlnV4X/oP1P8yv8nrGNmd9dAgxkKoHIDzerOFD8H4Q/FdbXZD7p+7lc4UMLo5weAggLDqk+GwE+sFE3uFGZsGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgPJH0Zuh+3vPiwn5wLcmE0Ue+fvfaV9340JyW+hk4o=;
 b=F6OXUDR50VFpUM6Q3QwID84XoNXO03kLiU1R4zBj7IVlY8C2+XxvpVbZujVWGEe+RdjqkB4MSDa9GGB0r/gyNhwaDacqF5gPXPztH7qX9VU1Zkt8+TFFGSu8o7I03q4H98pQRqbXcgrZMiO4I17U44385SdjdIPvRiM7cwa3We0V2DfQfnJ/6hkB4dJuTXu9adO0qrDkcyNQdeGENEM3DX1i8G+hkT/aB+NathcYzFEkpy7nrzkCAr9mt03iWfvtivqP/ZzNci/xZejqLUyMuWwPm7WBJgTTTR0K3Ai2rxvTrkdN2YLWOx3+cYCnevB430AnZAjC59eUG+L1RvfnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 08:05:09 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 08:05:08 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Topic: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Index: AQHbEyrmQVvZ3BpzCEqh8rn3NmeOxbKJEpIAgAGdXAA=
Date: Thu, 17 Oct 2024 08:05:08 +0000
Message-ID: <SN7PR11MB6750713F83272902F5472C03E3472@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
 <20241016072436.261438-1-nemesa.garg@intel.com>
In-Reply-To: <20241016072436.261438-1-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH7PR11MB6748:EE_
x-ms-office365-filtering-correlation-id: ee5461b2-ce92-4e47-5b4c-08dcee826b01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xj26SVxkAuyr+9xyC+Qfr/e8ugRqbD+r9oBeQPyU3eel8Sgg0Rm3akWU0TbL?=
 =?us-ascii?Q?ouF0vuaw0rZpQRXz0CJgKCy70HCXGaISaI/Wymc78/pk5ZHWkchj4wi+y0kX?=
 =?us-ascii?Q?sQ9nqnJq60ejiKzu23MNzX+PM9ObfEkajZrESSu22mkZKUdQZqJuKsUmPYZB?=
 =?us-ascii?Q?7K4Uqa8+1FMpn+muRVJ8dU5pm/ViUS+SHwroVDM6u7ZyAFLNBpOvmaAIntaP?=
 =?us-ascii?Q?KzzZhIOMQ9Keu+OmmEijaD4UdsRuwRgYp6CZHAeoBPfRhH77ZPTAbbbkzG/N?=
 =?us-ascii?Q?qn8VE9BQwWLovMr7RGtpCc2w4X38Z4/lx8qQTXurH4FNdzkjoernHWGcselC?=
 =?us-ascii?Q?C1BGolWmkHAmgEfTIqUzLYhk/eIce3oQTlBmjEbrr381olT94sn9rZJWExy5?=
 =?us-ascii?Q?li20DM/fVg3+Hb19Bg2x5j/R3eqqByl5Lab/5b3gNq+uKfkmqF5NYJW+V0Pf?=
 =?us-ascii?Q?47jnfa2iSAHZ2kSsMa2PmviHBL1bj6TRZ8cFzkR//ZY38S90WXC9CRkJOn/h?=
 =?us-ascii?Q?uGp3b1TiKa/pGOjRnXe/I7HwJ9Bc0CaVJp25THiBLB+q8WAyfCj42Mzmr/A5?=
 =?us-ascii?Q?MN2dBQUD7wx0RXPQCKCaUqVoeg1C6Y47jzz/zwrVeV5OyKnFwlovm9Xr+pzw?=
 =?us-ascii?Q?KBHGfaTYUi3v2f6L4MYHmHw2kTYX3U1Y7aHsjZRFCIbVge1r5QL6JUrQoSa9?=
 =?us-ascii?Q?x5h7eadO1vbVRbumq7k+RXcAhHJxRsG8VGy1VXvTfBhwAC9NvlGxYx7Mu91K?=
 =?us-ascii?Q?fdLES67RX69J/7BRZhKj/QkMonvgPUYDGsU2v+1Pbl9magTY2AzjmLDfXMqt?=
 =?us-ascii?Q?dcSBLgggS9Sa96p8X2k65wR9oxZUxsB4flF9fJsOE+Z0AzBRJebq9Epyg7Xy?=
 =?us-ascii?Q?xQnewNWxjpvqlSqwxZ3SqZxAixj+OjJIjwu2HHC6OkHyKbV5eLqKLIW8xzBe?=
 =?us-ascii?Q?6+oQSgOp7+tDwvRfTcyDwXAfNcKQNSqpbRCTpBWURAgK9VD3Atv80chDP7e2?=
 =?us-ascii?Q?lVQBTPZtxfhPl335S4wu05PbSfX4mVNEeLeGXlrSNY3qgfizbUk/CAOWgeHV?=
 =?us-ascii?Q?wW6dXkOUXPEzp1jCq0m32Fgj643fPqhWdLiokdNcVsctdPX6Wp9UT5GmLbjj?=
 =?us-ascii?Q?CC0dEDaRYwPUvPp2esl3p2/76fxUOLgPXu2CdNkU944dJYmoZOvL26nDKQaS?=
 =?us-ascii?Q?9g0TP93/cY04Nrkl9kEc1ESYc+vkucVNzAanJVtxA+fgzeHxG0+UcAIndtna?=
 =?us-ascii?Q?TtChOFtD8CsiKNdBwygEouZxlO83n3bGU63kPNHQSrMZxmA/yCXOHlUWm4Co?=
 =?us-ascii?Q?2fPr/g47/n8Qbc5QKmu9hGLK6Ga8mM9r8a5YXFSiOGaoKUMIU/SbpC/zVD2c?=
 =?us-ascii?Q?/GPig3c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HGKYyGCr489gr7qinUsmjN8VXmda0+uN5te6gLV+0hDt9/FIcqVvS6tOVgZO?=
 =?us-ascii?Q?D4SRlcm7gz2Kj9KdtijATBI63coSyQDQxUAuBPc6WweGKWLnJmMoCIprfzoH?=
 =?us-ascii?Q?e8MKp/KOQXOU+/G9Hsp3401vrI+7biJoDj/m3ACPar9O1XSO8uMRSoRzbvN1?=
 =?us-ascii?Q?CqlO5wdguhNDJpekt2eE1amqre7g1csPeOfKBy7sjjaA9s0BVhHi79JLjRHS?=
 =?us-ascii?Q?Kp4/RLGlFIpBRQxBf7CdnKUuhWmdVcv1YEoe4EDSltLZtYzr9UIZzMhaJh9g?=
 =?us-ascii?Q?Jnb8ZZtppn7ZYyuvZq3bQ/3SIDJ/8C/nSwQP6l9U0bKABrvwCTMpfiD4Po6j?=
 =?us-ascii?Q?GcvLrE4KUVW5zoRTM8+Ax4CxqbaipqPVPsEMGZp0d9rBDjkmzd7mj73EqfGL?=
 =?us-ascii?Q?a9UEWGsF13P/SciGtzsITnrApvN6d0xfAJD00sjl+dGjLLCPfcoJ0xeWKhTJ?=
 =?us-ascii?Q?hSw6FaSfSbGjLc9mPuBCJR3Et5MoZcBnjN08C/MHjUY1DqpRU5X0wpIidNN1?=
 =?us-ascii?Q?5gdtEUUkk6+YMSQZfcVnTHrdzDZAaWXPhs7fsu6iMK/nC3RRD8/NYxZCerOa?=
 =?us-ascii?Q?6pE/zwFjFGyCX3r3qSXkLc/l4a/hcMYJueNrxCaiwiCo9t7/QKQBI0q5JWog?=
 =?us-ascii?Q?ygIpBk8nvJOoLtaljJuDqbr67/iv7WKuMaOgurG4VoA8Uo2pJIe9DkNTHXA3?=
 =?us-ascii?Q?fDtLZHt5pw0xlxSNDWzrACV0XPzFN47M+LtHLRsOSj0KEjarNEjgVmdP8mXm?=
 =?us-ascii?Q?KWS5u5cEPsl3H00ukeRC69Pha+RdHk75uD6HjI6FoeOKA/wSby4PYlAq49a7?=
 =?us-ascii?Q?XonmJ5/YCl/NNXwy+8xkkqfigyAwrWkbWCoFfj/RnbzscPQfOUl4t2yvP2VH?=
 =?us-ascii?Q?TcYXOmgDmzq2YLmihhfH/3fRJlEIy1rgRZ4cw7tb7SssViKJeylUL8F9w7ey?=
 =?us-ascii?Q?Jv+VntGAsO9OhNNK7X6eYJYjjnv9wgp+qjgBZfcLmsMvqK66zdEfjflKOYNa?=
 =?us-ascii?Q?cqG9ak3vbgIBjKqUmfHigbXGESH0Gi4pyjXbJcGYbedR+7nj4YnmGDPqQI8p?=
 =?us-ascii?Q?A0SiZeN3FMGKX9c8gOfzWFzXVyEA7muJOT/NL/aKzs0XqB/WRNpSOb/yq+OI?=
 =?us-ascii?Q?kF8jm0A/V2oqsXX33B5tgyAS2f3/NmCmcleIiDgq9mdJAfSajw43qOPnAx0f?=
 =?us-ascii?Q?TXCDAa3OX/3tKszL92AQK6dRGzu1nJnBIMnWOgeNBn8ZXpqSFgPsYKulHgdH?=
 =?us-ascii?Q?f0JAESdHAw5tnfngMR0qGsKG+zLkB24ziBjvVzqvtBkUpEVSLGHrcpOTJyEP?=
 =?us-ascii?Q?TdfGQ2VEMHrBySofth25mGatFd6M3ba+u15INuI63n7rRKh0pdAMyQ8Mae6z?=
 =?us-ascii?Q?McEuTTvVWXi0kzkWok4Ov832K3EV8w7BnrpC6OODGQ32BMc9tFp99k3mOpra?=
 =?us-ascii?Q?fqk2daUxIA47eDU7uA+pCgXYLOUhwJ9JnJ0Z/B9/JbhxF6n9NtqZnxQc9Prx?=
 =?us-ascii?Q?xPjLAOtDjLzExLIsffhvGYoCyAUXVKyvcifytUfBgtwlEPptE7T2xPMvx3C+?=
 =?us-ascii?Q?qAHc7HuiOyMfLndbIapYnVcS6vvV1E4Qhg6i16TM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5461b2-ce92-4e47-5b4c-08dcee826b01
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 08:05:08.7479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPA4eX27Hm39pWvP1SAuvKgqOGPkSV7/S5shiI6vDI5PeHuF5bixVDUu9rNqba0dZ0lQsdYB7n8rBZYaTx6ZLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Nemesa Garg
> Sent: Wednesday, October 16, 2024 12:55 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar
> yuv
>=20
> Disable the support for odd x pan for even xsize for NV12 format as
> underrun issue is seen.
>=20
> WA: 16024459452

This should be right above your signed-off-by
The rest LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> v2: Replace HSD with WA in commit message [Suraj]
>     Modified the condition for handling odd panning
>=20
> v3: Simplified the condition for checking hsub
>     Using older framework for wa as rev1[Jani]
>=20
> v4: Modify the condition for hsub [Sai Teja]
>     Initialize hsub in else path [Dan]
>=20
> v5: Replace IS_LUNARLAKE with display version.
>     Resolve nitpicks[Jani]
>=20
> v6: Replace -EINVAL with hsub [Suraj]
>     Remove src_w check as not required
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index e979786aa5cf..2d7ca6e62926 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1031,6 +1031,11 @@ int intel_plane_check_src_coordinates(struct
> intel_plane_state *plane_state)
>  		 */
>  		hsub =3D 1;
>  		vsub =3D 1;
> +
> +		/* Wa_16023981245 */
> +		if (DISPLAY_VER(i915) =3D=3D 20 && fb->format->format =3D=3D
> DRM_FORMAT_NV12 &&
> +		    src_x % 2 !=3D 0)
> +			hsub =3D 2;
>  	} else {
>  		hsub =3D fb->format->hsub;
>  		vsub =3D fb->format->vsub;
> --
> 2.25.1

