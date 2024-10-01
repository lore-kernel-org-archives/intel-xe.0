Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7C5CEACE7
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 16:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4043C10E04B;
	Tue,  1 Oct 2024 16:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gq8p/bc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E4210E04B
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727799978; x=1759335978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M+8X7PSJHn1kKK/IPTK2BWICWlOGLibX5VDJiwX25vg=;
 b=gq8p/bc6kmKx++o3hC0sTWR2aufBnACh2u1s83bQe3KngcH8Vi+D90Pn
 MA3fuyP8Lp5Mvyvm5a9GY2dqNciW6HRRqBIrNrIMIp1nQW/TvWL3s6mY9
 gP77wGRw2c0Mcz+oLqYEUYzGeG/H4cWC7OANiUuC0UVCGEE6dMpZZbi+T
 3LCdDO/zzdvIVi2vI5F95pAahA8cwQ+OmqyLReyP0XvcqS4iP87kHrDI4
 P+Sy+3d2xFLqwhk1qHV+mIHyimVRpJw/ApMGOL5tokj7GfaXVz9dZPByn
 bnDHpw4UyFJPE/u9ajDYQW2LawScfK5eVH/NPhO30+g8cv5cr37MlDhdZ A==;
X-CSE-ConnectionGUID: xwIv5SivR2CWByAcafuxxg==
X-CSE-MsgGUID: kP+JF424RCiQ2XqJnbcBtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14565842"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="14565842"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 09:26:17 -0700
X-CSE-ConnectionGUID: 8+a0zV6tSOW7ZQx5xcRz9g==
X-CSE-MsgGUID: aS/agevaQgSdmj5Ry/rfzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="97077893"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 09:26:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 09:26:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 09:26:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 09:26:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWPD4FveTwh8y4+HtzTDejKGlVvhsEV6jRFja6INynqxpbodQCULa04yhA/GEMx3v/uaPrmY8SpRYHbbgyYPLtESMR7/1Emjmf+0wBFBZ5/dYjuXAXCKTLGkrBTLOS8nR6njClfiKgfcNpsNtMhN+nVKVedON7rO9XIV8yH4IoliLnvlyPj8diIQUDSKfRpBrrNje3LiEgKfQfjSLnwIbfEUi0FhjGIab6HkaPdlpV+gl+PU14hJAYLcBnFh9XmWZza/ncCcnTMzLa5w4Y91yGBa4lbpyORuvetIG1+bjtYvRv94RwXnVmawLDhJRv58icU3vKlTFe800RBFQEDETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGYpH0Ot4u9M/sWO3Asfdpvpwz+0r46IUAFU6zuWcng=;
 b=Xu/qTc1/gW8WIzO5W3tpo5mFBH4LwNT5ldIuWGSLW3njSSrF8GbATVMNyt2mlOHWDrsnlSVqCSeR2+cnUsfKzwZ28sarM7o+4O3Ymlq3ncF+3hBRNx+AuNujis+FDoYUYbGqWXL3HNwpRikv1gbVjHWzz5DOj/1ZXXMvtgRUfV9ALnbHQ/9EH6N4xzyIDpXQRGMiZAafgIQ1NiWjXjGPaJbypdHoupjQsTL8Q65O3YkEXqSLJK9yf/RTAPQm9cbRECyKNVtTMY22nCBtxHkTZ8778O08MFmAWHW7bXnshlV0PTRRWNKWnnluINybTgdTCSzjq2/fKlnHgPEdltXobA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 16:26:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 16:26:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Singh, Apoorva" <apoorva.singh@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Zeng, Oak" <oak.zeng@intel.com>, Brian Welty <brian.welty@intel.com>,
 "Singh, Apoorva" <apoorva.singh@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Add support for PTE_NC bit
Thread-Topic: [PATCH 1/2] drm/xe: Add support for PTE_NC bit
Thread-Index: AQHbFAfvUXJMUF/frE+d6LkQfkpPybJyEBIg
Date: Tue, 1 Oct 2024 16:26:14 +0000
Message-ID: <CH0PR11MB54444F87B13599C541571FE2E5772@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241001135432.447074-1-apoorva.singh@intel.com>
 <20241001135432.447074-2-apoorva.singh@intel.com>
In-Reply-To: <20241001135432.447074-2-apoorva.singh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB5304:EE_
x-ms-office365-filtering-correlation-id: 8d539e44-4d33-477f-e9f6-08dce235c4bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?aj2UpXtHsbAlKnrmKE6M+ztaq5ZDhT31FJdw0hqeXH1eClsLbDloXSjcyx2p?=
 =?us-ascii?Q?c2nTZH+UjXc7elNhwVnobowMbBQ2ApCXEg3g7dlwkcw4ZbN47UqqjKhDFX2p?=
 =?us-ascii?Q?+8k7ED+YaUDWQv3v/6mYfjdKQPdP6CxBnePMuKPOGpYuuE7qqxzOCHhAKYqc?=
 =?us-ascii?Q?DirVAjjXvrxkAM9jnUgzlEsxkPJoGq9aFKs86Oz7vz66jPOatV4DlPnQnQ2S?=
 =?us-ascii?Q?qF/KzD4+YIIQYrg7afrDkVxyWvBQUrluyFaqD+VSoIl+sXwBVczUqrpFiYf5?=
 =?us-ascii?Q?t4Fn2cIp/9KWb4r8AI6jSQJSz/jwJdXwF0owx4kM2u8zJ6JbKU0FEVTeMm2/?=
 =?us-ascii?Q?M2mQJI360fTKqrH0D+kVj1umDKd7rrHIVA1VloPO4myZkxPMVkXTVm5lZOC5?=
 =?us-ascii?Q?l9q/mrcEEXhdXZOeWACZOnYC8XZGgo5T9AR48r86+TmKAMEt2h48NoaXxob0?=
 =?us-ascii?Q?ojZfEi/76YOq0FZLNDxSR37M31AZozGU2hmuV6TR+1ndWvf/qdqm3+0QdPEF?=
 =?us-ascii?Q?oWcobBg22ccmpdNAjF4L4B/rtExo1rKfly6/Hdp0PNb6f8qjuZgqh9vg8WDp?=
 =?us-ascii?Q?sPm4aOECbDSHJdlC/pffiYl6iuSDRIgj36tr12LtkfAVhk0BG9PahGYr8/Pf?=
 =?us-ascii?Q?8VB+CKSlR4hEXZwHSKOZT1wzYY6jd8K7pLfVesUxAdxsGkfhsGDYtwMAHn7e?=
 =?us-ascii?Q?6tbuw6nvZSXbzP2npCuLGxpXgvsva3YDSUi5ABkEzNhH4UVArTgx2OLd3EdE?=
 =?us-ascii?Q?PZm0ft6cshz62UiAOMcOVYWE/32Ef+LedfBPQeXlH91Uz7C6ho3sCKgrby2N?=
 =?us-ascii?Q?aAe2TatAuAief5w0yYeFmbYMCNH4Pdt91ZDhNAKHXeb06WPiXtauCrMLz2k7?=
 =?us-ascii?Q?ThJvZNhj1wzuRHegLO5ULdIFpMB3HJsco5gS5w9V+CFNLlOCaiGVN7X+c2Ti?=
 =?us-ascii?Q?H16oqcxPsz7lhK0w49DrH+x0aTsCdRrEqYe2QmXO3B/r47pXeaPzC59wIrDm?=
 =?us-ascii?Q?+5Pq3H62W2RdmND5RxfCF+PnSqcCrvgO6arS4d5605M/wTjPbWxm8iPB+ZkD?=
 =?us-ascii?Q?OVUZrs1MbYKsrC1JpOFkoireQjx+R8gBjlmENuK4PQKfigHtIb8ZoBdHy9qy?=
 =?us-ascii?Q?9ZlE8iQXZXgb6UhmGkTAd/V4xt9SmXU42ghlmW1OCgKCh8pWc5F5L6KpcYg4?=
 =?us-ascii?Q?WvRsO1rGRsGLivD1ne9UYpoyAU4I0rBYgxP4QA5N09C0oEkwa9UBhmoU+xJd?=
 =?us-ascii?Q?DUx8XhGwBHOsaxz/iXvTFvoZ+N8dKIP3ETpBqbu1rxtC5DzF4q2elUaEkw/m?=
 =?us-ascii?Q?dkiLdbNoOQrYTyblm4RuTvzYcVqqTgmr+S8OfStXYT8tFMRMYBkfeAjxpMhJ?=
 =?us-ascii?Q?Jvy8JCOYNMyxY59tJc/o4wBjYxrhu0q2XzzQTRzyEtvREzBI1Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H1LzqRD41GNK8tlziG9dBp74g22NKF34SCAfhZjfzY9MblRGHcpACYjEL6Lj?=
 =?us-ascii?Q?kYRMxYYKT9FY66QMgKUrlscFU0RDRdQBWf+q8aS7+Sqa0ZnEmbN8K5rqrEgn?=
 =?us-ascii?Q?T04/vAgPHYBTqFCvuWPciP+b5xhDcKhHHBb+VPu/YPl5O5fjo6Efhii05jvs?=
 =?us-ascii?Q?jcWjm+cBpkZKxsAR+AyfT7N9eBdDJ3kjdBA3zOUwR61bbK1QiOlqkIP10C6k?=
 =?us-ascii?Q?Qr8aWxgLqEZYtUS2FkNGW8PfrqhJeVBNsW3Ma8HBOzNbS4EgV3TKfbpenzyG?=
 =?us-ascii?Q?haseGZF0pvUmewh9TdM0D3QurarxV54depRRgaHoIBCgYwvL8sELkNO1G9z8?=
 =?us-ascii?Q?jbHL7vAWzFt4EFkwiZAOeDfpV9jER8Mx1POfaInzgNlO6/CFC1dm1VZjFZEc?=
 =?us-ascii?Q?SAzk5HNvsu2v9GCJeMCQW35tdZKkIcvxJS9j+48PLH/MIUsRfymGPP7WWlFC?=
 =?us-ascii?Q?I6ToyFmWS1JDEyfc0oSJPmEzeCMIwkIxeQGAM5ew8qsdokXkjBQwlYCo5qSz?=
 =?us-ascii?Q?H0A35baSSK/CXe77hxCCMCdVHfSToF0lQ3A5iWxhS6/RfMsq12N7eprBEUAy?=
 =?us-ascii?Q?he9A2yzPT2O/Z90ezmagyqKzU+Z9XCB05K9RxOljv8FN5iV2O50gz1Spykz2?=
 =?us-ascii?Q?l7lNYuvbYwrqd+Wtw7VZJx9hpT09Uy26/S4tjRPJd3jcF+eBU/wXloPQUjrd?=
 =?us-ascii?Q?2QV6Rm2/THAoMV72JCBnqJfRlaRkhaQdMRT3fR8oiOjzz7xLqX1U1wSrKZml?=
 =?us-ascii?Q?Gn17IL2WU4c0F044EhDU+PZrpMyISKlWCnoaM7x+PjycJf8HvaJwQRaO7j12?=
 =?us-ascii?Q?32g2d/ZnE54onNLw2cfWSAGm/zR0Tu4pUL2BFtzxG5cH5N6+tuRaMoYCyew0?=
 =?us-ascii?Q?Y8PcJErdwHMNAKU4jlToolXI2vSvl1R3x1j30dnBnP65ZwTKd7ksb3zjA+dn?=
 =?us-ascii?Q?MixUI4D4raOn0hz6WwIgb0ulQ6rFYI+YpL80RF8y5S6ZMDgFZSC5uc5qPJ5w?=
 =?us-ascii?Q?+mb76itN7G5yACXxBoZXGvp4asqceBZZJXI0cvU+N0ASwWSGCiBVYodrn9HO?=
 =?us-ascii?Q?YZXaNcYh9qSOf15OBvd5edyHf3NLORTKUGsmIg44fekJvOF5afhG+CxR/k4w?=
 =?us-ascii?Q?dKQ1QHaP+po1fyQ0EM3UJNpPxBddZcskHhJlYWxvbgD5n2Vx4jO4SKGASlBR?=
 =?us-ascii?Q?gfFc+kHijTbfPbcCdYot6V6HQjpDL/KWKdc/2CpTw+rW85R+1b9Ht3IZ/utA?=
 =?us-ascii?Q?4cFgbP1NtfPwn/NCwCM6z+tab5Vgh+MMHeJIS24+DOpB9dTQdXr5G2SKzf0u?=
 =?us-ascii?Q?mG4pwKFcPwd4m4+SSZx8wF7exvvVS0XT3lwYt4iIbG/rQIScLs5KLTpyQlHt?=
 =?us-ascii?Q?qMh/CjPW4Xu4rWC+xWKsR638m1h2EV4KWd4aeJ1Z0b7XGrXdT2WNX2xSv/ks?=
 =?us-ascii?Q?reIHEm2TJBIjNGwYkcAGGWsTGe8eVOwEBR+7CgNOy1JqMC1rIAazkFFwIN9O?=
 =?us-ascii?Q?9sN8GA/496XS/uhcEz2K+CNiEzXu25LO3VgdnOPJgGra1sO/9/Sa8X2U4Gvz?=
 =?us-ascii?Q?HZ4x06jX591oIs11+Fc4xUggsFipR7vJI3XS0P7E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d539e44-4d33-477f-e9f6-08dce235c4bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 16:26:14.0992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ifJwT3GdHBZ/WFOi5zxVRP6Hpi2P864c0Vs4jKFBW0cHmT/EiCAKyU3JQvLT6iFpSDBHOH/HwermOT2TGOLCTNEd86pziM+pi/R3O1GXgY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of apoorv=
a.singh@intel.com
Sent: Tuesday, October 1, 2024 6:55 AM
To: intel-xe@lists.freedesktop.org
Cc: Zeng, Oak <oak.zeng@intel.com>; Brian Welty <brian.welty@intel.com>; Si=
ngh, Apoorva <apoorva.singh@intel.com>
Subject: [PATCH 1/2] drm/xe: Add support for PTE_NC bit
>=20
> From: Brian Welty <brian.welty@intel.com>
>=20
> The current implementation of access counters is incomplete in that it
> doesn't manage the PTE_NC (No Count) bit. HW has finite number of access
> counters which HW itself dynamically allocates/deallocates. As these are
> a finite resource, don't enable access counting (don't waste counters)
> for page table mappings which cannot take any action on trigger of access
> counter threshold (cannot be migrated).
> The logic for this decision is encapsulated in xe_bo_can_use_acc().
>=20
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h |  3 +++
>  drivers/gpu/drm/xe/xe_pt.c |  4 ++++
>  3 files changed, 41 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5f2f1ec46b57..449a301c5688 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2196,6 +2196,40 @@ bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_t=
ype)
>  	return false;
>  }
> =20
> +/**
> + * xe_bo_can_use_acc - Determine if BO is eligible for access counting
> + * @bo: The buffer object.
> + * @tile: Tile (set of GT engines) which page table the BO is being boun=
d
> + *        is associated with.
> + *
> + * Number of HW access counters is finite and allocation/deallocation is
> + * managed internally by hardware. As they are precious, don't waste the=
m
> + * on backing store for BO's that cannot be migrated.
> + * Currently this means, allow access counting if:
> + *   BO has more than one placement
> + *   BO is not already in VRAM local to @tile
> + * Note, access counters are not used unless enabled in LRC.
> + */
> +bool xe_bo_can_use_acc(struct xe_bo *bo, struct xe_tile *tile)

Tile is declared as a required function parameter, but it doesn't seem to b=
e used or
checked at any point in the function?  The function comment notes that we s=
hould
be checking to ensure that the BO isn't already in a VRAM local to tile, bu=
t I don't see
where that's being checked in the function.
-Jonathan Cavitt

> +{
> +	struct ttm_resource *res;
> +
> +	/* userptr or using null page */
> +	if (!bo)
> +		return false;
> +
> +	res =3D bo->ttm.resource;
> +	/* if for some reason no backing store, nothing to migrate */
> +	if (!res)
> +		return false;
> +
> +	/* cannot migrate if single placment */
> +	if (bo->placement.num_placement <=3D 1)
> +		return false;
> +
> +	return true;
> +}
> +
>  static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place=
)
>  {
>  	memset(place, 0, sizeof(*place));
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6e4be52306df..b60dce0d2f1c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -55,6 +55,8 @@
>  #define XE_64K_PTE_MASK			(XE_64K_PAGE_SIZE - 1)
>  #define XE_64K_PDE_MASK			(XE_PDE_MASK >> 4)
> =20
> +#define XE_PPGTT_PTE_NC			BIT_ULL(5)
> +
>  #define XE_PL_SYSTEM		TTM_PL_SYSTEM
>  #define XE_PL_TT		TTM_PL_TT
>  #define XE_PL_VRAM0		TTM_PL_VRAM
> @@ -209,6 +211,7 @@ bool xe_bo_has_single_placement(struct xe_bo *bo);
>  uint64_t vram_region_gpu_offset(struct ttm_resource *res);
> =20
>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
> +bool xe_bo_can_use_acc(struct xe_bo *bo, struct xe_tile *tile);
> =20
>  int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
>  int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d6353e8969f0..18cf13d548c6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -660,6 +660,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma=
 *vma,
>  			xe_walk.default_pte &=3D ~XE_USM_PPGTT_PTE_AE;
>  	}
> =20
> +	/* set NoCount bit when not in need of access counting */
> +	if (!xe_bo_can_use_acc(bo, tile))
> +		xe_walk.default_pte |=3D XE_PPGTT_PTE_NC;
> +
>  	if (is_devmem) {
>  		xe_walk.default_pte |=3D XE_PPGTT_PTE_DM;
>  		xe_walk.dma_offset =3D vram_region_gpu_offset(bo->ttm.resource);
> --=20
> 2.34.1
>=20
>=20
