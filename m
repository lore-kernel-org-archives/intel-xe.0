Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D86CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E51B10E12F;
	Fri,  3 Oct 2025 14:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXvXJvw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F43C10E12F
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759501165; x=1791037165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PFZiyNaloJZ806G+QHtrg8mIxZwwAHMTHZ6dvNsLxPM=;
 b=EXvXJvw1APEEsyEaO0BQRQUpeOuz3OGUhSmMctcShItPRcR7NTLJSnKt
 xzguIYrboBSy+voj4NnSn6ucu9AaLaQb1wfqF4vRgN9Y3stOMZEDTKc90
 VR/BtQ5T8NAIqCm54KbL3/J6i+Stc+AqiC5Fgf+tLTSnCp8nuniflzlxA
 Br0F177CHdo6yhznTcctGRV39YX9ZP0y5JwQhQLVlbssZ1IzQEdgCDXn+
 nPsmMhAVRAYZqbQJ7gZveb/6Lz7Q1FH5sv8k10b3TVgDl1bOS56tTamDB
 TdfI1fKh4JV9k2mPVyQ9yz6U5muphOWxmTHfLZXNuXBIhHNxijLD5zhxU w==;
X-CSE-ConnectionGUID: EOuS0HAUSD+Id8mjbPmvTg==
X-CSE-MsgGUID: 1pGYX1EvRcqobcTVrBV3KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61700129"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61700129"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:19:25 -0700
X-CSE-ConnectionGUID: ypw7nNloQ7a5uTivRjXDCQ==
X-CSE-MsgGUID: 2ShGMvy3RUGp8bCvuCilLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="178592800"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:19:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:19:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 07:19:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:19:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Juc3lXcESJ24npMdEiivG1mQeojrBzWle56UDg//LX6gqZ0P3X5lWctmj2ZPdsfiWB9aQN4aE6SqDE5Z1eau0h8ukOq/Aix67ZbzUuxmtZFh4+ozQn7aySI5VjALDUXidUx7rhzOKp1MgVE5yAGovAzq6ceTzmtD8V0Q/8Q/yvdbn2qN5QOw/VJAIPZkawLNun/RzR9WJI8GFyLuFJ9oMfNxdGAv/IFcasYAOEdl2CRjDcU3+TZ8zrUo+xElbYDMbehe4tfI+GMOoJnVlU3HFyLnbPAibjbKnyJZMILGHfpnU4edYrN+qD+DxA//3oca0sSn2xH/huDFVUrDb1tjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5aeQ/YPWs5qV8rO87gGmqfuUSyuYeycjHu3rQtGcoA=;
 b=XKDfA87DnXa3Cj6zeYaqj3luzT+KB83ztrCyKKDw+SD3uIQKmEOMFq+8/hssQFDGTiGonVMg/vUDcFUhaZnZYCkGDE4my0sQFl0EYN2BR/9EWBDrvhKqlweHpbZKjGReMXSe9gSOj14oxVe13CQYBgruy48TprlJZpDEAvceXyJvzCNrgQAEgxdsgHX873vLAcZDObbfAsxwCGjlkJtQpHNhn05eJgTBEbhcsz0T54b3xvZZJgnJSKsTpZFqKAzaMYqjeVuncPxA097V5Rab7Y63lrw7a+WUI2YliNCYb8cXJt+nS/TxQRKCpuwO0y9IeBgD3H60fpJz3w4vOR9eqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5452.namprd11.prod.outlook.com (2603:10b6:408:101::16)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 14:19:08 +0000
Received: from BN9PR11MB5452.namprd11.prod.outlook.com
 ([fe80::d38e:6977:b814:3adf]) by BN9PR11MB5452.namprd11.prod.outlook.com
 ([fe80::d38e:6977:b814:3adf%3]) with mapi id 15.20.9160.019; Fri, 3 Oct 2025
 14:19:08 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_late_bind_fw: Fix and simplify parsing user
 input
Thread-Topic: [PATCH] drm/xe/xe_late_bind_fw: Fix and simplify parsing user
 input
Thread-Index: AQHcM9LEsQgyYarOyEuMcY6YFvAh0bSwdpFQ
Date: Fri, 3 Oct 2025 14:19:07 +0000
Message-ID: <BN9PR11MB5452D1773B5322ECF1CD3882E5E4A@BN9PR11MB5452.namprd11.prod.outlook.com>
References: <20251002192736.203186-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251002192736.203186-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5452:EE_|PH7PR11MB5818:EE_
x-ms-office365-filtering-correlation-id: 7bc87ed0-d0c1-4463-8172-08de0287d0cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PwUBnmp2Ac7O+g3NFD9wMgmV6OKMVYx5Cik0yuK91374DwxY9D+sRLfD7DoA?=
 =?us-ascii?Q?n3+SRu+Sh82sIfLoER6sTZ55qmCxlUve4Ml4U5DIXwXIoF/TUJB/3TrBeR9D?=
 =?us-ascii?Q?YllzY6m3hqUijcbKKdlCk1vPzAoeH6vOSsvPgxLX1MdBrOcFkEIJPnHVogeF?=
 =?us-ascii?Q?Ij/ZUjySpLRq2xzxOooky9eyGAIkYwxt+uzGwgw+4oWqW3JzhVocBXgoaRJA?=
 =?us-ascii?Q?pClIk2jNH6LBBIG2CiNGGzqiwKxtXdSiJLZaT0UmyEr46no2iEjUcC5VXCPb?=
 =?us-ascii?Q?tLMPP3oMxzgWDIOTd7wZe4TE8sUIPIRK1lMDbX9j/nddEb6NiosxSeVGsnuG?=
 =?us-ascii?Q?R9ssYEohkJLx2cw7uuraze9l22jSLL3pmEJrXide3sJ0gKLtT1j9+VFoW1J3?=
 =?us-ascii?Q?yBx6T3biRHcw/jaLT93tsBFZIeErvGNCUjVKwSAN9q6g7436dTupkcIWLxZT?=
 =?us-ascii?Q?J422W/GZrdoH9s4f1WOMonUaOFWBS5hUXuqxsgtnlF33SmoT/Pw96X16q+M0?=
 =?us-ascii?Q?UuoE3R/BLNc2cLLWu+5CKf4IXuYHS6CdIZc3LEElK7FDc50bsQzE3BbuQcz3?=
 =?us-ascii?Q?etZG6Nj7bCKcUvzmda2dcNsYw89KkpsYfPSBZsps76w6Ev/gLdxAZuq7S+BO?=
 =?us-ascii?Q?IBW8zAJcGPI4FdpqJdAtglgIjm2rQBBd/uFbQbDRg9uDlF/mgGAndGUzGBJB?=
 =?us-ascii?Q?injcIkc6UklbTdIqvTGWG/ZgBYlAv6SOYCow6N7rMmjVG8fw1lEFZjkKoQC3?=
 =?us-ascii?Q?Cl2hGb4EdGnYOQIjQ9eokaaYB7CUBynLoOYExLZlPOeh740I9BSzc/1vTCvK?=
 =?us-ascii?Q?Z+5RTz4pc9PKfHaVWAiIfNEjPjNWg182eDSjvGt2oewgOTMiq4ruS3igCOu/?=
 =?us-ascii?Q?Tlq0NdK35BANgcyh00IPrwcxpDbKtFfauwOt5B09T/Q2jiSKfBunnBnE5fwP?=
 =?us-ascii?Q?5J+OE2gow900MGVhwyM7mwBS75+QN9NVHyQmRpXJR3txpH1dZMheDcFaWfgm?=
 =?us-ascii?Q?wgbuaVtH3esy9OrIXoat6UV7M4hjaid8OEj7+jTHK1yVxVUi+NG+qks6L2vf?=
 =?us-ascii?Q?ncQSfa4Fz0gnzGEECekMvggyS176vEGvuH+TRks/9F//VZ02Z1wIcsigC7Wo?=
 =?us-ascii?Q?QekawCcegkobKtmkEViZai/2DJtC0i65t0u+Z3H5xYl7cVriDwzMFduYC8DL?=
 =?us-ascii?Q?a4Mki0AjSox8QtG65kFSDXk/bKC7bDgZucPAeZ1aT3utA3gMbedNPkOSDoFF?=
 =?us-ascii?Q?tYQ96UYXFrrOZ0tkpngUQi0QHU6RgY7E6fV2f3mTPKqsTTFk7XV5RkcX+Kwp?=
 =?us-ascii?Q?mSpf4VbmsAks6V5qCeIjWV2lPEdPYW94uT46drp0RX5UtKpyr4j0N0Yd0Py8?=
 =?us-ascii?Q?4p5+Sts33rs/wBaFw8Gie4Bd+uEL5Q78AWZftliRJ793y6whilwN8xn0YIod?=
 =?us-ascii?Q?JC98gqimKXVmauRvJRYeSRrn+hvsfoRSgCeTKOxjo9yiVw+5okhwwXW7OjIQ?=
 =?us-ascii?Q?0Y5ktWVu09JEhxJYoepbMtXruahb8gSUUjVt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5452.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LIAvPsKPHRHRjo4tspiZ3XGb/vFR+fbi92PHX7j+gnDqowuqK4jlpuLhG9/F?=
 =?us-ascii?Q?a6ZMrhQh6SEEUk5zHUgtbb3kG0XY2Wgs88HQu0e92CAzWKU7+CQ4A+OZJfHZ?=
 =?us-ascii?Q?6epbDa6qgmXRzMd/lcpS2viAB4XTNnIocUkmj1yy8x5kSGLtjLkN5GsbEBwE?=
 =?us-ascii?Q?voRrNfTiLhSO2k5LSk15s2q1YJyrSUgkuQK2fOYOov9+3F2sN9B+jXOUtQlj?=
 =?us-ascii?Q?98kN4vJ3XL/48kJt6o8Z1FUCdPPFVoHY2A6de0c37rQNU1iY9KRStwOihOMl?=
 =?us-ascii?Q?urV5PkBz7ShbTYcIgaEqG04pjOF88Tn75gLf9HaxYEERmU9fenA9DPa5xV+q?=
 =?us-ascii?Q?86ojMKnPMhsPKPP2BXXDQmeCVRzkz9kwBWQGSh8XFq5KAohEolnQWWQis3vC?=
 =?us-ascii?Q?/OqZPQZ7E+tUNKqlGZgsbgFjiCHT/uVTV5W0FWcoRs8mNBKqxlvR6slsKHis?=
 =?us-ascii?Q?SvIrSAdywQ+WTJU4StWLdHWBbDsonEosxYaVlYdYSdQlQdu4Eguy4GVMcayR?=
 =?us-ascii?Q?xhUgwc5sywL4UC4N5yXMFKS7mwc0Pxrq9pY35AG+BD1t3Y6dL7fmdFgch+P2?=
 =?us-ascii?Q?1dYCucE9LH2ne9ClLiEa07oeMdr2nBobO7N7SEV4oY6hbsZnTKA/w3iRlMbA?=
 =?us-ascii?Q?fUMJLpN43a0I1bOiLRWKEGTZMVoIULEM+B+Ml2PY2h0pVB1YTnfNVGoOyzo3?=
 =?us-ascii?Q?ULzsSPyVLFrvuxPf9Wm5m6iDQc6EnW7aHjIJ1LkxcbF/mQKhYiizLO84Y58G?=
 =?us-ascii?Q?bGnB4FJO1/6AuzUD665k67sXPegyxnwDwOuEBRc2w2qn00hueOYSCBOGG7ZZ?=
 =?us-ascii?Q?Ja8P44Et2OZSkWl49N+vwul6VkxtnfVqt9YVLHwxjiMUjbct0hOLk8TEG4eE?=
 =?us-ascii?Q?a31dfByjW4a/3ykyWOqRPNpYtlqh0c4PNkMMS1Cq0y8yX7u29oNvd1YD0Cqv?=
 =?us-ascii?Q?NLAuBzhPDW8EJFp2L2SpfULA5nb3x0ZuXsCPsHhpx/erv9Pv2JdijCyoRF+D?=
 =?us-ascii?Q?38HiN8/UvhgpTIx4x1+9R0HAAoJAnAfELq4G2bKC3CGSijfRRimwJLrCYnoF?=
 =?us-ascii?Q?Z09/EEIYd7+i5azddgwE6dLMbSF4lrfM3HBf3ynhotyUrcvqIausUSZSNH1u?=
 =?us-ascii?Q?JNGCAq8o5d0WolPjBNZqwo4zUfrpoq9rh5+kS2BU/kGwr70aD+sGe4hM5IFp?=
 =?us-ascii?Q?jppyyddjrh5mMdNMrkLY3xxSF1fBkC1pzzvljkFvmi5tIzfJuF0ySC1W6LA5?=
 =?us-ascii?Q?y+RzVRr+423hFXZnthxZGP+wEydsgCi4jA7HLFnUTBROjSAeGcMELBAHTDAg?=
 =?us-ascii?Q?/Jv/ElRRBW+jxCxxnnEagU+CGvvZujehHfrneV6aIXZxLOlVA60zZG7wZ0Jm?=
 =?us-ascii?Q?FZvMEsHlBUflMh1J7/tvBvhXXgxqXl/LLiCpdN07SlkmCl49Cww9A49RapT3?=
 =?us-ascii?Q?zchlqXJz93eEC/Id2XBvyD1s5NAr5V6Ilovmat7nrvgkWl1W2Grhz/RFKxYE?=
 =?us-ascii?Q?St0iJQe3p7Ca7VAvO75JMTpNO7O6TN8npMRfgR9YCXmclNL4jkewNrWulq1T?=
 =?us-ascii?Q?NIb32uCHwFaTAjddKHbYOcsuBp3+vffNXP5nTzqE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5452.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc87ed0-d0c1-4463-8172-08de0287d0cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 14:19:07.9433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vn1K1UxydXEQBBHNzWauNn6qI5b4C30UoL7hzZKXOmH4BEhsaSNEdnAZgCggP9Z92DXKiK+24dS5G5MqGmLRUgkLu15ipXoKXqXaW5PtOyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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
Sent: Thursday, October 2, 2025 12:28 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Nilawar, Badal <badal.n=
ilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/xe_late_bind_fw: Fix and simplify parsing user inpu=
t
>=20
> Code was wrongly passing sizeof(uval) as the number base to use,
> and unlike other debugfs entries that represent bool data, it
> wasn't use dedicated function to parse user input as bool.

s/use/using the
But otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> I'm not sure if this deserves:
> Fixes: 67de7982d505 ("drm/xe/xe_late_bind_fw: Introduce debug fs node to =
disable late binding")
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index dba0a9c4a4d2..34f622bef3e0 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -349,17 +349,14 @@ static ssize_t disable_late_binding_set(struct file=
 *f, const char __user *ubuf,
>  {
>  	struct xe_device *xe =3D file_inode(f)->i_private;
>  	struct xe_late_bind *late_bind =3D &xe->late_bind;
> -	u32 uval;
> -	ssize_t ret;
> +	bool val;
> +	int ret;
> =20
> -	ret =3D kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
> +	ret =3D kstrtobool_from_user(ubuf, size, &val);
>  	if (ret)
>  		return ret;
> =20
> -	if (uval > 1)
> -		return -EINVAL;
> -
> -	late_bind->disable =3D !!uval;
> +	late_bind->disable =3D val;
>  	return size;
>  }
> =20
> --=20
> 2.47.1
>=20
>=20
