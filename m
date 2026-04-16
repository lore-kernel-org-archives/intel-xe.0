Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1947F8A14D
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 09:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9232010E023;
	Thu, 16 Apr 2026 09:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkR7isSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347510E023
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776333488; x=1807869488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ESr5VBNLS9uz11nuEsWZM+Ss+p3xVGmrFtCRvZAay/s=;
 b=HkR7isSML7Tw7P3cbXobP5KiiDrxYlgBPBHCb8sPy6e3GkIoSBqRPwxo
 bUyf7ifFz6ZFYhDO3VZjIPrNNKlcw5Z2Y2iWDXeVBt6mxXLi/t+7lG+al
 n3W47gl6cDoS3l9mGsmD/UPtZDX1lHGhZbmdpL3M3RRSVCrjuuMTeikpu
 nY6QoXnnrA7emvK78uWd+r7TF3ls8SVWv0fB9F5A5gI7rFnPjhMYELEJL
 mPqiJCbf9ggUUpDNnDD9tornanjxuAFwknFBjkmLTpKWj45yeuRY6izlv
 lM/o9llSvfg9LRufAXT77lKyYdf71+HGlzdsWdCGtU5mzuBjXbb0+QKR4 A==;
X-CSE-ConnectionGUID: yAUmMgfOR42mV3AWGPVt2A==
X-CSE-MsgGUID: wXyeqRdeQQCOjI0RlbMfrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="64867554"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="64867554"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:58:08 -0700
X-CSE-ConnectionGUID: 3ksuu9wcRCm3aVuATAqueg==
X-CSE-MsgGUID: qjBZHkIsSqSNQ33E5J7FHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235649147"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:58:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 02:58:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 02:58:06 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 02:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBUgBAN+Kw81fi85JQb8mZ58QvQ6ACMP/K1MrZ78ed3AGOvItZwE6PA8jYYiFo1VR9kUxa8t9Aaczr709XpFEsHSmaSKLTKT8jUm0Ia0COzeSeb9UxChFXD+eZZ5UoV+6R2xiqa/X4lqG4KgWPlbh09FGGuI3Clu159KBOAcyBaaYpsxKSx4sz1gTy9avdW0iJHD5bkiQT6OrhNbDtai93EoHwJi9TxRzqeBUkTLR1K4gmTa1OccRNFZ83uOJN2sRj1uMEtmPY4bULZW53M3xC9T10YFxKQfwRKuEA7L8qcrKtx1Ug0h5lP55arORu2NNHcVzSBSlni/Ic9xbwo9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS1siDWA+Z4xJxdj+28hOcvWvTCoTd+xM4WFCF1MoTk=;
 b=GKbP2FFHbl438oAJZRRYI8hUVYo60Pi7udO3bnZ451srj86dfZwiCQaH8cY2bO4gxxSb8AXWSyW7adf2plrGlTiSa7MtQBS3IJOI0a7+uPvVpnpkszEmrgoeBh84L+wwol6DyVBOnFdc3tAVgjkyKHYX1Mv6MiQiXanPPZeZyvxv0hzpuQQnBTe9jeAwOp4eofbDZMIemdTz5hOuospNRswuOq+E68ZVT6ufzKvCC8gPw++mTtjk0L4Yr61k9cZhutcwG7vbE5J1PljAw8bK59NU0nmfrhxheF94wtP/RQojcGisZ8eT+QN0lpVjvR6F0Og2CnoxninKihfua5uXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 09:58:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 09:58:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe3p_lpg: Add Wa_18044193044
Thread-Topic: [PATCH] drm/xe/xe3p_lpg: Add Wa_18044193044
Thread-Index: AQHcvTv3gL9lnmk38E+mNRZ4HMCK8rXhk+qg
Date: Thu, 16 Apr 2026 09:58:02 +0000
Message-ID: <SJ1PR11MB6204EADD5B9E90199041284E81232@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260326161628.3566067-1-varun.gupta@intel.com>
In-Reply-To: <20260326161628.3566067-1-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA2PR11MB4778:EE_
x-ms-office365-filtering-correlation-id: 90b6f5d9-c3b1-4d95-6d55-08de9b9ea633
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 7madEDq0k5yv2C+g0gfsA6blrGDM03vSXnO84QECh8OlVRCy7mRvlXteO6df76baFI74hRRJGXkFww9SI0q2wyKdDzh46+J9NkhtGYAI8AgqaGOGV0KzHWLchvW1zVOCDM+wCzrd+uRPCSq0PdaXsSIkSgFliKqffKmqjvKJkvxwcdw5IjQG5alN1ScXx7MUrP5jEKeDNtkx12xA65p1paJPSq25umyRlhjBsBdw4o434add1jnk7/Avdn7JOB8CxmJyKUL9LK1ilz5CUkaSX/cCt98HhhMPwUpH1JzoOuEf9U1TPMSHr1+cyJPCbb0qhrmIBxKWcmsUJoUMmIHDnDtw7gqhcO8MrIxnMBbP0bYkUSJROk0zma5XkOkSNqDxWo61lJOD3zDA+aA1qi/5qb+8fEEFnIf0uC/sBcnkf4iwXydJP14HZ3VugezTaQYjg2hX5NKHQl1MmMlvfcKLGeFPthSBzRDnAyntws8hRMJj8J6s0wo3PRdW7T5ZkfgFz2zH+uLG6F/ATiROqTS+xMH23AdXNrQGA0Ez57MPiXuk4CH3FQhWNkSpF75SIEwxqkLAbYCjFpqq+sCYmjhLOjPua0uqXbpzGPIcE00A/APVI5h5CctNal7bU33IYQVQI4AQNx24RnksPFF3c5pZCslYyLLCO3wx4xyFpkv+Pquf+Mt/GXEtfmoPmeTVR9i29jjnyDb3GzXVWRDCMCWfhuvp9DMIiTxuWu5VnlrseWcwsOTZaMgA1dvB1EUoIF+tBxgxjL2M6WbvaSaEw9/F640e9P8XDIBbYswpcdtvsQg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RFeVWBsqyOjFkrweadnTkZGeiZCyS3O2lK29RG9/592pJqPrh7x6KFSMJP4f?=
 =?us-ascii?Q?i+PSc53Lr7k9I0+IIiZfa7zGX5o/U98MyXZUQEHX2zIW8hlod9svdmo95WI1?=
 =?us-ascii?Q?2oAQPdqFnrvQZTjx21+uSMF21a0rVCCF+jj9XVFyaKGpSbE64Kc9rVRcGKse?=
 =?us-ascii?Q?+dBhDNqs9Jgf1rYRLXk1Og5sqgDONUMmz8F4rmqNoNj7O8mX8b717vR37VDg?=
 =?us-ascii?Q?L7GtXWE+200G+0b53945kxV4f74FDO7PY6BsZpzZ+CPAcxRHS01fpmAZi+Ia?=
 =?us-ascii?Q?o/hAFEfpl7T9PwRwytjijwdGQemrrOlT0C0mA/DVZNB1/PBtJRWGGIpli5jI?=
 =?us-ascii?Q?AYvIOT5kYDkQADdBfbdRPeHvy70RAXuUaABKlparG+bezbM44pku1kpbz/XC?=
 =?us-ascii?Q?z4Fz5d1oVF2xcqx96gYDeN3mT7NYpLLsHMCzxpg2Ze7JC4XO7I/vzzqwo9a8?=
 =?us-ascii?Q?dF4pnbPz4vDHm/oZRElYfqIHUWPEMkYGw5jdfbj+aSrlRW+AwAzseq7VMY7Z?=
 =?us-ascii?Q?AXftUdYh/napjdD8XTDsUueYmDnR9MVKaQzQeueOCGsl5Q7G0eHlbUxSGWVn?=
 =?us-ascii?Q?m2lX2YFBvl+iicn1rZIpMp5IqmW9N96uPSrYgnadIBIg5BYHB51R/HzPwI/J?=
 =?us-ascii?Q?9eEE24ok5zGQ9QB8WdcTTmrxxkCGzcNy4lTZ2J8gFad5cdA3tGGDSyZ1ofCL?=
 =?us-ascii?Q?3DCQypu24DLlJQviSzzc1H8tZXe5zC3ImMNRUyMdUI8R6HdECwz44TzlBXiJ?=
 =?us-ascii?Q?SEnCHhrx7+6R0gLzDeIWhJ26ZgUHFVOqCrqg3/yAjHJwCrybmQwwu5CUfwrT?=
 =?us-ascii?Q?AeXDO4YP2vJIYe2SVxZLxwVu5xSiQQkqdszbtvFcOQA1AJrBZjeAyU8Tw45d?=
 =?us-ascii?Q?CKayruewjN3YGY9DzdEXxrRuIJ30U5JuIptUQsulAGTLnTCYwi3a3ZHJ3+tZ?=
 =?us-ascii?Q?e49Ee9rlC8NTpBBcRQmxW8oVgaG/a2Dq0FD51b/GPMyYAEJNMWB8tYKx4WzF?=
 =?us-ascii?Q?ENUyEZqYIEWJMkgz1nGik7hUxd5UlpW9xUi4mSONt0bIM1W/e37fdcxmu9b0?=
 =?us-ascii?Q?tQ0eC7y6B+no2ms6UBz2UyCqShO//Z+psV4hNTHqqSi56EBNWJ75xDVQf1v7?=
 =?us-ascii?Q?ZX83+AC4Le+xzG8DJScLFT89yXcIjdeHN+EqiQjSJFXq7I88lNlWaUVLO40O?=
 =?us-ascii?Q?uq4WOOw/3ShcuHw4Cl6rDSbEa2pmVu/0PXAi3aMT/Bl2s8IuhExk5ppYwxpC?=
 =?us-ascii?Q?Cwy00kPZS7hP01fK8AToM2Mn8TkAd2dl/y/lbT0sAHRwHtjPymzD78gW7A3d?=
 =?us-ascii?Q?J5FhDbnZUnr4GB/GtUQ0vVdTQ4voG2t76ZUmnp9mJOQpF8/vPTfWn/vYaW+D?=
 =?us-ascii?Q?6//Z+WWKhSkKgbGue92xpkSht0IpaydW0W/kBgJaxaRijbhJLoPWIxl52LUt?=
 =?us-ascii?Q?ahj7VLQZqQjXrF5EyF2aDTYAJU9mttPdLOVQEeFdKY/BERcrUynLTbIsletD?=
 =?us-ascii?Q?0j/XpuO01cF6zmGRuTH6Pxqu41MsHa7BjvTZUzYjQ+DU/v5cckNgYCDBYtDT?=
 =?us-ascii?Q?wYhGFKR61bv3QxPTDiwKZUefu5tcIlbLSO4rxMKp+18OKKR9T6eue8l2L4GZ?=
 =?us-ascii?Q?bRRg7uc2gk6gJt+Icmie1tWcnu8yfIvoO2nVlHQRYuoVyDt1SA14VjzD/Q5o?=
 =?us-ascii?Q?6piz2xdBv3OS/WWPaArL2Ua6oukQMy1kWJGfLbCBK6hOj+bmdTukDFCT6DDe?=
 =?us-ascii?Q?dwXl17kvVA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TrzFdSB+IEfWRqw53ZFuzANruM2YrdPvPIMuROavCH6w/d2N5Ngod0NJ5BZ1nmexQMAkxnEnD7WgrCgv6owuJeYSBJaN8lwdsSlDQ/lXpiLRNBkNvWzOyCXdcN2VpOBlG0Rm33S5vxBty6FbiPuVIbLkIECuNDJEnYKxfl/iYqEa2IKKFoqU17O8I88UaSs54LYgHNbLqg0kWwbxM9txmlaWspEox3UvOeFLGD6jwqbPQjevKsWgP85aGxXwbBvojOPLGeKL7kpmZkqnKCL+TWl1KslyAVom2BEa2LjFMYZLWmConpavc8tYtd1m/qMbYuLYyyZab39BXoRmz8+KYQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b6f5d9-c3b1-4d95-6d55-08de9b9ea633
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 09:58:02.7573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aAgGwn0vjLFVT3h+5wc3r0YBsze5OgYHKfwyzzJQBAsQJI3Q9ii50v0awMNNzEn4wVOSD2GXBArssKTI3gC/l+47SI1QDgl1c8bWkpcSNRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 26 March 2026 21:46
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/xe3p_lpg: Add Wa_18044193044
>=20
> Add engine workaround Wa_18044193044 for graphics version
> 35.10 stepping A0..B0.
>=20
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4ebaa0888a43..f92c6ffd4d0a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -560,6 +560,7 @@
>  #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
>=20
>  #define TDL_CHICKEN				XE_REG_MCR(0xe5f4,
> XE_REG_OPTION_MASKED)
> +#define   BIT_APQ_OPT_DIS			REG_BIT(14)
>  #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
>  #define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 546296f0220b..b10cfd921b11 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -601,6 +601,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
>  	},
> +	{ XE_RTP_NAME("18044193044"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0,
> B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, BIT_APQ_OPT_DIS))
> +	},

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Please check if it has any merge conflicts, if any please respin, and you c=
an retain my r-o-b.

Tejas
>  };
>=20
>  static const struct xe_rtp_entry_sr lrc_was[] =3D {
> --
> 2.43.0

