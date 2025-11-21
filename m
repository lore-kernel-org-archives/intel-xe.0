Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832EECFC297
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 17:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428CF10E8EC;
	Fri, 21 Nov 2025 17:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHs5h7Hh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5433510E8EC
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763745829; x=1795281829;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5GLdxSRgoNduyfvxDm7UPeEsm+5F3Nr9x8gJVNCCsfs=;
 b=EHs5h7HhQLyaFy5EvSee7vLY4jcYCnrju/xhDZ7F2Xe1pnOl/AClQtA0
 GRGn85PapQpO9bZKbFtJQW6BtnIey8maJ5jC3Yv8+iFXh5bS+OwgRoN8I
 jaxuV9xtVA34HoOHn4QB16d/LNo1zpoMO+EDOOQYdvkgM3a3SyOCPXq/v
 D+Hvrx55G1MpskXrOnpdAUx3QvGZgDV6tzoZy9VDxjjC/SRKbTU4GvIL6
 Sfu4XWkrGHgJDYuVaHGJ0wn9d7ZtG3Aux9E76u7FxfUsxnkMpLxt4RO75
 sHFK0ZnnLxzj66acIOwilh2k3MM3VRYVoN2kCh8mJqqvbsTXYOE6SlRST g==;
X-CSE-ConnectionGUID: O60CC1tCQma8mZNPon51qA==
X-CSE-MsgGUID: PMJNJCG4RjGhH0qsAcbN6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77206155"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="77206155"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 09:23:49 -0800
X-CSE-ConnectionGUID: gJoW7OHbTwyKw7IH6L1PSg==
X-CSE-MsgGUID: +StnioQIQkOlKrlhIVszxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="222372925"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 09:23:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 09:23:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 09:23:48 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 09:23:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+sGp5Zch4snHXdygIFn1ySrxocZUlKqQLekp4NfS+bfU/VlCaMqglxKalQ5YYwDKlDM8bs1EdkciqhYJlL/83/xJVxLwuu4cIOYoINcmbFSKnzjyBM8GFoiVRmQgYT302X6Yt/m3eO5sk346Ga4fqOV9DUz3++smQK55kCCAOFn0sgr1qp7kfwn497I4qTA7vq/AI1wqSQCLKiUTksSVQqYdA9um0dcZMgSNsyCbTG2LZkL+3wd/nfKYsjoyalq+P/0mThQlvafXihKYB7edBK+CDEwuhQy4NYJxiolaz16J3PtX5UavaQIyZlAkwnkRI2iNyA2W9wGEM3qHtjm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEpEuk8hN5YNthgd1CkZtF4S3RBNT0Gsqdv65uVQ+T0=;
 b=fZ6Gkkd4A8jSy/sc1amPToE5m5unuvChGgTJ1KwzoGnRhDOpOCGYuRJ++OzYghepkJwmi8jkLTfVOhYxzIub0vitNqi8xgstn0GNIXndAM6jFm8/gaAs6V7lIzs47gbHeLN8Sd0zYky529cmxpAOgNk56DVzzj+66IcyhY2i/XO1/kMAqNjJnmgiDzH+miyDKevQ67Y7TtuO7G9fJh1xScA9D6gfPuTeV7K/S/lbXM1JqclTyg+UTQvD29uzMldHeyeQtKcpd8qeR/G5AyyTG4uu8yTznhmjZqyfvmmvAF34up2C6kmMXEcVlhDA2tfG9s2WQ1bfT/9eEFdUffxjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA3PR11MB7582.namprd11.prod.outlook.com (2603:10b6:806:31e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 17:23:45 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 17:23:44 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Thread-Topic: [PATCH 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Thread-Index: AQHcWGqSaMnCVPTHBk23+8eiv72WsrT9X+Jw
Date: Fri, 21 Nov 2025 17:23:44 +0000
Message-ID: <DM4PR11MB545681A0612A0F22E4EFF9D5EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-3-brian3.nguyen@intel.com>
In-Reply-To: <20251118090552.246243-3-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA3PR11MB7582:EE_
x-ms-office365-filtering-correlation-id: 50cf874d-7532-401c-e5a5-08de2922b96a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?L0++3CSQl0k4h3ZjmDhzcutb7FiLNGIjUfk6/LF8Awgpm7PiSf84gYHbEcDr?=
 =?us-ascii?Q?Sn8mNrmZFHjftmahXybfbfuFcbuO8tbG7oGY/9BnDgS+Dq1MsXxype8KigHf?=
 =?us-ascii?Q?b1+XGxF6DE0JAhoinltwNeUcykxqONLoSi2uysaLkNhgW3Bdn4K5OmuJeRP7?=
 =?us-ascii?Q?+XfMa+sVdnePwPQIZIK8pkBduMhqX77K8yQn4SQsmDPoiTfSAi0wq0Ch/LGB?=
 =?us-ascii?Q?BtU+tr/Ro9AoM/IoLSNTu0IsUZQa0X6ML3exXdetEVyIhoT3EdGI6JjkpbL7?=
 =?us-ascii?Q?SmArQid9F9jShEUfU8mqhaeq/O6Oc86Ea9kTD0lJzwjoE6oe3yrkMDmKOB01?=
 =?us-ascii?Q?yJh2F/mIPfsmBW0uomidI+3FgLUZ4wYP4HdhHk73OloUOhIV8PJjWfQPN8TE?=
 =?us-ascii?Q?qV2Hr1q0vOB9R1Bhqs+XfK1HckqHIiBjHlrnLXcQTTpsI+2a007Bv9z9gQ1s?=
 =?us-ascii?Q?m3ExJdBMPNrXqp+yawFmdBS7C+Lr1UO4gT1hwg7auzwE2qMyBC2IwH2/Zakc?=
 =?us-ascii?Q?eMYVqfyapV77ohRJL5zE9gmdZPQo7GpE0/DJ64IjBTlAjGpubnLpbnRltFk0?=
 =?us-ascii?Q?b9tIeKcHZH3AbzIyefKQAFpeXepAuNwme7/iLpF5JEpzMKnxJe1HL4Pig8hO?=
 =?us-ascii?Q?AXslivuW9b/rGR3VLUeGTWuAno+kASGUnEzvof0w23sz0O6r1rIg83jUhhva?=
 =?us-ascii?Q?fYAjEkCpeO2Jtev7ZRPm71AfsMRYmpHEtIU6nUX3G0v2UDM/BHIZoBnHGCw/?=
 =?us-ascii?Q?F1DZIFCwQ2qzRpoJdtnQJKNx8S8Kr1XsyFf1KSxHp0hMOXs3OU7cFdGCtfgQ?=
 =?us-ascii?Q?g39NUebmYdNrnWKOxeRAPwInLob8Jc4k9llDuWzM50D4BrpNszSdPQ0nb17X?=
 =?us-ascii?Q?pCWACrT7JVldzyqyImVaH4yqAsgeEpdqKlprmys9AgH/zXvThFXLMTjCBhAw?=
 =?us-ascii?Q?UPHoZekyQFKbFEmXSaoh3ipjOwHRzqbajI0kkzWlarVtZivjgyuTWWpO5CWn?=
 =?us-ascii?Q?qf53rBLwtuGenoZqnZvs/F6HHqXa4vQAju5aCJ4nIEj0FrSu/XMPyAhuyP27?=
 =?us-ascii?Q?c9tpLXasMFtcMUz/HV9LrbEXUe4T2wx08xcmBeVq5X/AMXS5DVozOijvQgJV?=
 =?us-ascii?Q?GnEuwxgPB79JN4a1AFY2IoYWFYTmFIrUPCLCrZKwilcIChqL0Fhs+0wWM7kN?=
 =?us-ascii?Q?L3+Ac5BDawcizYwPfShufF6YGu3OHkQF3m7SHrQ0Gu2Zor7wDjM8/k4DbvL1?=
 =?us-ascii?Q?zj2A/BcPNpj7qaMrjMVJR+uedCQJ/Aeq/o39WIZKLjHsGrIrdi5RUOqWmDEK?=
 =?us-ascii?Q?w0HJ7YB/hNc3I7fC4GnQ0d6zoxBoI+6p3Slmls9/0eMOOffapkJIlziHM4DS?=
 =?us-ascii?Q?y4nRTd7+RtEsQsdpJW5Aoulxpo5658u5IVutiTZaCcByGy0NfgDyn4u4LIwu?=
 =?us-ascii?Q?+3B9jOAbTwU3lUrmO8fBqcAr/WDkB+UfJ/w+6Tz5vDkhZhCvD5Qz+GJ+3Ihn?=
 =?us-ascii?Q?t2LL6ZwWGcNoQO15IdHhokMv7SiG4SdZFzqq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M4+AP5J2/IeRBzwaMCY52wza0GMEP+WWkaYwq1HfFolm0oQxoGb+HO8kHVHF?=
 =?us-ascii?Q?kj0/n/pYKHE3KE7BFleqstRvlo35OfuhuS+0Cj0SVpmNS/hXME/+kYhZJMUJ?=
 =?us-ascii?Q?DC6CTF8FVKjzuEanFBhPb8yqsRuMHc30mVs8eErgg06FRRcOpzEakm4iYLD2?=
 =?us-ascii?Q?/6gBfuNUdZiJ7WOVewWJG0AOmExewpSYWqJ29qhf14nOHWr1BPnSSyC4aaks?=
 =?us-ascii?Q?7/Y8cP6KxM1U9oda1cZ7wkGCEnuT85UGasS9GEgNj89FZNITdUB7R87/1abZ?=
 =?us-ascii?Q?ByPfWOnJwp2zFeIYf8GXoqYcekmeKrH0wMjm/dDRp6rI6EHvxxVc3fuQo4C/?=
 =?us-ascii?Q?ExZSZH5PoU3CngV2bZ//O+e2uftyPnwkZ7u3ZYecupQ9RwZkQo7NjAalHLsd?=
 =?us-ascii?Q?OAdjLyu2G5C5FVE7c0SdRMZ3oRtyoaP/5biGBStLaluj3JBzUkjn2++NvNNi?=
 =?us-ascii?Q?1iHZlZqsjXbUGs2anojap2efCyl5EmO1oPKROu45dXQ17L6jGUe/Xxvd+hCG?=
 =?us-ascii?Q?jVFTZ4Hrx9PpCtjFU2AZdVgL/BEO/N91r6dZr9KdYln/RIUvSjOwOL5d+DFd?=
 =?us-ascii?Q?LOwEbx+otxyKjGGekMD6NLQkZUXjKvEqrKOe4Kf7PkaXk4RBmfrQ9mlOPtOW?=
 =?us-ascii?Q?RXUCk4kxrkqIhIaY+seM7nzXh2tQ1x9i225fntMwkbgm+XNPrKP4T3ELG5RQ?=
 =?us-ascii?Q?KWJs8qJw/b8LW5j1+/ul3tsxdoS1YxhDqRjD7UhnCrnS/7Pui/bvz/lOG3xk?=
 =?us-ascii?Q?YC0UMseBM+QpuTekx8zK/7zCiSohj51rNBqZYBPxB8+aXEsXDzKX8qkTAMj7?=
 =?us-ascii?Q?sCdV9g0A904fbl8f8dUbu/vbfoRPjA8n6aNWFU5JXfng4jKI7cZGnyw4xpNR?=
 =?us-ascii?Q?zKf4SDf3s2Rr7DOML4QR7U/K4jU6aRy6dwnGyKeBg20eiQVLTLzDYNlzD8FZ?=
 =?us-ascii?Q?KF/6feiDUjxzWQnnm6+MmR7jwuUQbUL85bp15rhmHM3QY5bzNTtyJIL3R+rV?=
 =?us-ascii?Q?zXEiqtgy+1GvpIgLyNu/4RRqYQgXMICALhWCt0QkQ3sho3WJLVBChlD2k/CX?=
 =?us-ascii?Q?nxLXb5InruQMFoKcVm8xp/d2U1BsBKpBMWUxn6oluErja/qTUGorgfz4vrK+?=
 =?us-ascii?Q?iTQ2IbiOhbJtOZIthvDup3ln5jtRLgu2hbD1zH/zTgLglwsaHAhxEQ6oB6Iv?=
 =?us-ascii?Q?U3zqddSZtaO1R5Zt6j84Pl/gA4Q0rRxKFEROOSL20AjkkU0N/RV2oar6ib15?=
 =?us-ascii?Q?l0qzDgU6lpzbsQAVi7KFA/ML5CNhBdIWfTp1f2m+x823T0Q2qtORMkJe7R15?=
 =?us-ascii?Q?Z/eJaP17rf33vauS0Y5dcfcjVbCraQTP8co8oz9Nb/l0bs/BavptwCl+pPKM?=
 =?us-ascii?Q?ln2ewADeRjHrDuaO3khRuMHSrz2EQzWgltauI+5ZcVd9PH5vB/HRqFdqCKJo?=
 =?us-ascii?Q?M0u9w59eQU3m04gsRryOPYbMuPFuyp4BteXGKCNSOptg57hOqts5umbAPkxs?=
 =?us-ascii?Q?OpDXcSsi7oHrXoygIZT9TJvZKniG+XgGuJR+bPZjSo3IvYbIimXS3rdvff46?=
 =?us-ascii?Q?1NfwekVf7yy+30ouB25tjHXD+dl5Viix2kuUFFqJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cf874d-7532-401c-e5a5-08de2922b96a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 17:23:44.7513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqsY1kpHnFnsLOC0yumL9TDubX0qNDp+cSShD4yl+q9IF7t9/H3prx7KQyJ4PUMbq/S77y+2Ay3nYgwtP8olJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7582
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
> TLB_INVALIDATION_SEQNO_INVALID are now used to indicate in progress
> multi-step TLB invalidations, so reset tdr to ensure that action won't
> prematurely trigger when G2H actions are still ongoing.

I am not sure should we re-use the SEQNO_INVALID to indicate that multi-ste=
p TLB invalidations.
Before this reuse, is there possible case that the SEQNO_INVALID will be se=
nt?
If yes, we should use another value to indicate the multi-step.
If no, why previous patch add the msg[0] !=3D SEQNO_INVALID check?

>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  2 ++
>  drivers/gpu/drm/xe/xe_tlb_inval.c     | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval.h     |  1 +
>  3 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index f1fd2dd90742..cd126c53faab 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -238,6 +238,8 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc
> *guc, u32 *msg, u32 len)
>=20
>  	if (msg[0] !=3D TLB_INVALIDATION_SEQNO_INVALID)
>  		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
> +	else
> +		xe_tlb_inval_reset_timeout(&gt->tlb_inval);

So SEQNO_INVALID is re-used for page reclaim. And for previous code, this e=
lse path should never be hit.
GuC will not set this seqno to SEQNO_INVALID in any failure case. Is it rig=
ht?

Shuicheng

>=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 918a59e686ea..50f05d6b5672 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -199,6 +199,22 @@ void xe_tlb_inval_reset(struct xe_tlb_inval
> *tlb_inval)
>  	mutex_unlock(&tlb_inval->seqno_lock);
>  }
>=20
> +/**
> + * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
> + * @tlb_inval: TLB invalidation client
> + *
> + * Reset the TLB invalidation timeout timer.
> + */
> +void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval) {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
> +	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +			 tlb_inval->ops->timeout_delay(tlb_inval));
> +	spin_unlock_irqrestore(&tlb_inval->pending_lock, flags); }
> +
>  static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval, int =
seqno)  {
>  	int seqno_recv =3D READ_ONCE(tlb_inval->seqno_recv); diff --git
> a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 05614915463a..9dbddc310eb9 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -17,6 +17,7 @@ struct xe_vm;
>  int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
>=20
>  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> +void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval);
>  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
>  		     struct xe_tlb_inval_fence *fence);  int
> xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> --
> 2.51.2

