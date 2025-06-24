Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61957C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 13:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0994A10E02E;
	Tue, 24 Jun 2025 13:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4bervFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236FB10E02E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750772858; x=1782308858;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6T7aSyTxc7xH1+QrlwmplOH54yEMEnqrhvqtHhCpY9I=;
 b=B4bervFGdci8YJDkLJa7v+WusCahJ5kbtQP3HVGtEPs0LL8gG2vk4RHq
 ybvoscC00ZETaSGXqPW02iVJvo948F/gUn9BPPGTtFF9PGbuwjWmFtnl4
 u0bvWc0MP/qxY6ye0ATrJVel9IrWSj7KPDToSxD41OjpzBTUIkCjiIzX3
 pVCuGan/WXMXByljUQr1uTbvxd2VyRoTKuo6q8FvSANynoOPFJy9tXKz2
 OBZrYga7ApmzRlXZ60sgn9UCxvpR0lGOdBacFwvQ82WDiD1yrI5MfM9lW
 hEjNRpOvT81fLjDL7GsDzDIKPPu/kfPBUqz+wvIFh6E1Dp0XpGvwiD/ti w==;
X-CSE-ConnectionGUID: 7U4Ox/gmR+2lelyGM4XROQ==
X-CSE-MsgGUID: jv+JsGAiRPmQDJxJVpBPwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53150517"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="53150517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 06:47:37 -0700
X-CSE-ConnectionGUID: DpYA+WejSN6mnVDEZscVkw==
X-CSE-MsgGUID: MaTJyLDKTVSlJDeskVPZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="156205774"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 06:47:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 06:47:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 06:47:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 06:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLI1kGa8/YMmCHBzhMlYqREyKJWeeLw/BYISyFbzuiQPMYb2pXISvSI25ITDWaX+vyMUwUySesl+R57NaBAe6+mcVMffvRKgU2MtUuQznmo5Gpc40n6UblArPmGcL4T0d6Kuy8mz0UN6J/Hdtq6Mc/uBJB++svc2Q3DhTTMAwd1Lgejo881Q4B5puF/YQSrk5gyUHeGMcCy1KedeJbMLXzuelbBDjfq2/EvfmN2IRyMps9aDkpwsN4VS1472u0j1eg7QxFcdP0OKEMmd6pWP8TR6TrKu+IiPgK15EiZ5OOF1nSoOup+/ceFTMkuBO5CcNH8UY2n2brBbpf+TMQQ3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHDKF76yXoJpT6K1dmjCFg/yMDblQqb5RZsd8CSDZ5E=;
 b=wifmciXbBjuyuDi9WhX4MZ0XdOPVn4K1L1wKZlMkcAk32lo0Icj7vopqO/7/7T/7ZGp/whBqY/HBlZJG0mcKcWjZw22CuHsG3P5T6xMnGooZES6lEDEyudAYEC/cejmep7c0PSnB4VMlnGgqmfd1/JhOxI3fbFLqZTQmxc9455FWAtawiuzNMdQL/Z5p/NPmiZRFxFbWdbyZZJuumOtcbkkxUNQVuYq/7lQZle0snHSeHoG8Fy0wckLizOqMa9wS/Ac/mm2hjiW0CUIfWmQiKanO7Xq1BSQ4c5JSkOKOjWIQraMLKM7iHqSYXxurOGKs/k4iqp7KPdXKV3eLH0IoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM3PPFAB6A6CF3C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 24 Jun
 2025 13:47:34 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:47:34 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Lu Baolu <baolu.lu@linux.intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] [core-for-CI] iommu/vt-d: Enable ATS before cache tag
 assignment
Thread-Topic: [PATCH] [core-for-CI] iommu/vt-d: Enable ATS before cache tag
 assignment
Thread-Index: AQHb5OnRbmW4qFSNCkqarF9XdReDQrQSUffQ
Date: Tue, 24 Jun 2025 13:47:34 +0000
Message-ID: <DM4PR11MB5456374DE6FE87D4D895BD63EA78A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250624092412.4016009-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250624092412.4016009-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM3PPFAB6A6CF3C:EE_
x-ms-office365-filtering-correlation-id: 401418a2-7143-4659-ea6a-08ddb325ac6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?08RfEepVeBB7DOljfKfrYMXtC6Qqk888ftVVpbMP79Os96dhD5hH3nkNGrAt?=
 =?us-ascii?Q?8sIz3TxFRY5RkUdIQrGTpL3Fzpy2nn9LMS3SIEWT5KNZ0i8gmW0LMHahk4Er?=
 =?us-ascii?Q?Yk4GaDs0fJGzLXror0npWYl0uhl35sPLO+ITgbi3Qzwt+jT1xBrdc5lggY+Q?=
 =?us-ascii?Q?gWOYBCyMK61eieN9H4317QGV847JS4Yw8dClOn6hPUyxlExY43a9bJsVR0C9?=
 =?us-ascii?Q?YwLGM2Ep560k6f+1D0P4rygjaT9MjMXvO1q6aMFW1148q88/OXlQeYN7pAmE?=
 =?us-ascii?Q?k7xHL/gUWkWDU57JHQV7yXTaB/HCaNqKSEnRK7o8+heeGXKDde7pwZ3h+w5u?=
 =?us-ascii?Q?ZoeJMi7z9LfBzRV0c2n62CXZthcM0vSq5QTcVrP4YU+xHwcIVdiuGMYTmr75?=
 =?us-ascii?Q?70H6ExnUj1QAKGnd3QVO/0BwI/6RMjjyzkwzxE0NPDneRMDeVrY6i4hDGhuJ?=
 =?us-ascii?Q?+sY187cCmygmSE0+hTP6Vw1iN8ZKQ7BCMVsm+xlowf4Kniox8NRcgNhyo/Hj?=
 =?us-ascii?Q?+LRTzW/7x62IcT1TFN34IVejQR4Mub48tV8MdNL0bem+A8TyKxr+W5a/f+P0?=
 =?us-ascii?Q?19BN+TzEzLbW17HPdh7nRGUldKGtctwrInHJ1o43lM79akY6gmbUIbw/U9/C?=
 =?us-ascii?Q?ZIXHX8mg7Kfu+aBGm8bjpoMrdzxHNxMslmTd0az/trz7OKlap9LRMOLMmlx/?=
 =?us-ascii?Q?PpmzD6pe25KAQX7GUNB4NpIq1/EocOQqyzwF3QZxXRGjys7740JiYIm+EbYw?=
 =?us-ascii?Q?07SGijUzisXpGxRQSuiHxYRWtpzkCp7MgSsXV0EtSPmaD8GIxDvRi8lgAZt+?=
 =?us-ascii?Q?YweEEepeGHhTP/sW7fTiku0h8XUpg8+t+/lxhNz54gZZYSEA5W1Fd5p9798t?=
 =?us-ascii?Q?M/iKHZe9Ia6PlGO1IKay7Qr3ODPQ81jAJ5EcCufzSdQ1n6IYPwhA8Wrh3YNw?=
 =?us-ascii?Q?Id9thAxrXuTyfBkLHZPcmMwgMpnME3sm+3LajN+3N9P3M9JC5zX14Hq6GzSY?=
 =?us-ascii?Q?/688kHyy1XGtsDLQfyXgTLf/98s664thIMBETjURtB+NlMlV5JehT3bcWU1J?=
 =?us-ascii?Q?R2t8seWUWAh/X5IYGmAEqSRyA7HgxkN+whrwvHco6NDAALFV5Sj4Mp3kw4Q0?=
 =?us-ascii?Q?4Ejef4w8H7lb0cmurKdoPtJWl6NUF6zxoWoXSVt6Py03hGBojfrtvqZ+9eH+?=
 =?us-ascii?Q?JXLcxB5vDPMkS+7CgPeMRfdhN1cX1KLnn0s5cSYTv0Gz6tk/f88iiknOc48z?=
 =?us-ascii?Q?WMeu8cNs7FA5FkLIHdJGUUpSPIpie8P7VvKmB5oPjOGQYIiVg9i+VxhuZ3Ai?=
 =?us-ascii?Q?XTH9D7Ytf6B/8sgqKzoqzTNXDqX61ESX0S076Ngj2cgvD0EvgcOPVT6bdsYf?=
 =?us-ascii?Q?walFVRp9Z5kfSQpFOsj+g025rvX2XLyXcHI8/aitzs0tzJIyHtOK+B2xadvY?=
 =?us-ascii?Q?D88AeplIqfk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?74OEkKnuD2XclAGGyyge0DtnekR+yNoY/QZSGQWaEbrgIPCunIWocops81LI?=
 =?us-ascii?Q?Fq8Ae37ADeuYV22OIrw3SgJfndBNhyOHIjkIuJi76HEV9hD/eHzuf7T8bePO?=
 =?us-ascii?Q?0Cikrn9tidhi8T7kcE+uZNRhT0bYO9B6E6/Np014qZTNLNy+6lWiyEXqr1i1?=
 =?us-ascii?Q?sJixRlbu2jrg+Ke4gw+SHOcgMBLoobUZhNQoB5txPtFqgB6K3maCYnMG1z9h?=
 =?us-ascii?Q?S2525PrhGI5UebGBI1vqroRk/5ZAYUzVpuoDWBpvzgPD1xXlFv2WJsqvySOv?=
 =?us-ascii?Q?/xEwKO/1JCoxN/YjLv5kN/UJHujVyHGe32kKQzRP6+w4lXIv2xINzf342+uT?=
 =?us-ascii?Q?E5yxqDSSzm7osusZPeHVvZ2pJDssfhT4xJbXvlkwN36AxlolQ+IDg2rMzlvO?=
 =?us-ascii?Q?AnKCoPf2jJNl3eQKZ71wKdhEuoMXkoi5ITMkFLIvPS3+IfSfKT+DjfPTDUZt?=
 =?us-ascii?Q?AMcPwjDyTFxTVKk134o+MWGWr+ZkWFsGel03O9a/uzY/59vlp1RDvJNoiKlV?=
 =?us-ascii?Q?TUS44gRH2bcUYU1QTTlD+m4L9qT6aIDmY6YCB0Cubn6Ky88oo2YkLGqabJcY?=
 =?us-ascii?Q?1x64J1zVzaGAnwqb8rKyOkknbhZfimdbi6zbJmOq7OyFidGZBlAMktRV3ZLi?=
 =?us-ascii?Q?ce2S6uacOVGdHjz45Vt4jEHsHtmyD8xf175BDYdVHPiCHcdVzHnZ+eMOJRy9?=
 =?us-ascii?Q?enrR2E+CprZvENZgH2fCrEURcHB702nniVwBiL6XoEY4f7dm0Vuw2MW5lCgd?=
 =?us-ascii?Q?IDDp7o3rFqUbTnuPyiMInk3FFxZgQYyiBxkiXWdxCOKt09Daar4RmBbz/+q0?=
 =?us-ascii?Q?R/4BBPJcTPIwjhkIA23bUTYaQuXKkxpVvhWiTZFNsSonLnKSRCfaJshbv3qZ?=
 =?us-ascii?Q?O7WIqbWZkw7SLdtOoasH5J60b/kkoj40vq/MY1V2uTDkmW3aF0H0PGA6yxU6?=
 =?us-ascii?Q?f+PEupNLNUznC/eTaIUbYC0Mc6aoRPnSwdBUgsfYWvEFtgGA1Dd+AYoB68UC?=
 =?us-ascii?Q?4gO1qbKLnaVPcP+fu1EiBayuM7yGg38azWheEC4ylg3C7auuZ8Jhk1chCIrp?=
 =?us-ascii?Q?loP5znwEiJeREQ+/WFP1VORyfSPvpSV8/l9erUD+sgR+J8xadmUGSqGVII6j?=
 =?us-ascii?Q?uLbc3GgulrV9YSK1pqpfYdKDlk/wIf9FRmmBll6mVrIs1k/HrIup6unppVPc?=
 =?us-ascii?Q?zcrWUqzohgwUkBEOyow6JLFghvHoE0hTRM3BbTVogV3t41vQg+T3C1SmhuBx?=
 =?us-ascii?Q?QmEGYuj1pqarTGqcs8dZrOXy7ossW4IqwaZqpFEf2B4C1OFJy9XwqqAQfXYE?=
 =?us-ascii?Q?h0Fa7ekHukgpCoDJ0cXUIhnvpbABSb4gDN9+0wEqcg8vaeee+ImqLF4UXy5b?=
 =?us-ascii?Q?v6wI7xooqEuh6kHGkp6dfXUAK9tfXuyR0dzrtO8hSmaO7id752M8FID9h32I?=
 =?us-ascii?Q?6/vzK1DyswPmV45nzNl8+KjOkjtTPxWtOyi9VN+DBsSTBTVCr0aKVQA/Iknp?=
 =?us-ascii?Q?pl8R6J8PJEvMurx3GHSwQedZo0tjuKRE42RCLnbLcVaiWujJep5/k2eh/5DP?=
 =?us-ascii?Q?fmvGqvxmU4AtUhRi9YFZnplLXiNkUecZjMqaN14/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401418a2-7143-4659-ea6a-08ddb325ac6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 13:47:34.4013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVFSNr6GJJnpSJk76C8mfWCqtPUaQWWVxSAvtbEzlaOGp3IDPIuCBX0WI5LkUdMR62NcDiwQMhLlqNmSDNhCCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB6A6CF3C
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

On Tues, June 24, 2025 5:24 PM Upadhyay, Tejas wrote:
> From: Lu Baolu <baolu.lu@linux.intel.com>
>=20
> This is a core-for-CI patch for
> https://lore.kernel.org/linux-iommu/20250620060802.3036137-1-
> baolu.lu@linux.intel.com/
>=20
> Commit <4f1492efb495> ("iommu/vt-d: Revert ATS timing change to fix boot
> failure") placed the enabling of ATS in the probe_finalize callback. This=
 occurs
> after the default domain attachment, which is when the ATS cache tag is
> assigned. Consequently, the device TLB cache tag is missed when the domai=
n is
> attached, leading to the device TLB not being invalidated in the iommu_un=
map
> paths.
>=20
> Fix it by moving the ATS enabling to the default domain attachment path, =
ensuring
> ATS is enabled before the cache tag assignment.
>=20
> Fixes: 4f1492efb495 ("iommu/vt-d: Revert ATS timing change to fix boot fa=
ilure")
> Link: https://lore.kernel.org/linux-iommu/20250620060802.3036137-1-
> baolu.lu@linux.intel.com/
> References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14531
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Acked-by & Tested-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/iommu/intel/iommu.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c in=
dex
> 7aa3932251b2..863ccb47bcca 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -54,6 +54,7 @@
>  				__DOMAIN_MAX_PFN(gaw), (unsigned long)-1))
>  #define DOMAIN_MAX_ADDR(gaw)
> 	(((uint64_t)__DOMAIN_MAX_PFN(gaw)) << VTD_PAGE_SHIFT)
>=20
> +static void sm_iommu_enable_pcicaps(struct device *dev);
>  static void __init check_tylersburg_isoch(void);  static int rwbf_quirk;
>=20
> @@ -1825,10 +1826,11 @@ static int dmar_domain_attach_device(struct
> dmar_domain *domain,
>  	else
>  		ret =3D domain_setup_second_level(iommu, domain, dev,
>  						IOMMU_NO_PASID, NULL);
> -
>  	if (ret)
>  		goto out_block_translation;
>=20
> +	/* PCI ATS enablement must happen before cache tag assigning. */
> +	sm_iommu_enable_pcicaps(dev);
>  	ret =3D cache_tag_assign_domain(domain, dev, IOMMU_NO_PASID);
>  	if (ret)
>  		goto out_block_translation;
> @@ -3765,11 +3767,18 @@ static struct iommu_device
> *intel_iommu_probe_device(struct device *dev)
>  	return ERR_PTR(ret);
>  }
>=20
> -static void intel_iommu_probe_finalize(struct device *dev)
> +static void sm_iommu_enable_pcicaps(struct device *dev)
>  {
>  	struct device_domain_info *info =3D dev_iommu_priv_get(dev);
>  	struct intel_iommu *iommu =3D info->iommu;
>=20
> +	/*
> +	 * Called only in iommu_device_register() path when iommu is
> +	 * configured in the scalable mode.
> +	 */
> +	if (!sm_supported(iommu) || READ_ONCE(iommu->iommu.ready))
> +		return;
> +
>  	/*
>  	 * The PCIe spec, in its wisdom, declares that the behaviour of the
>  	 * device is undefined if you enable PASID support after ATS support.
> @@ -3780,7 +3789,7 @@ static void intel_iommu_probe_finalize(struct devic=
e
> *dev)
>  	    !pci_enable_pasid(to_pci_dev(dev), info->pasid_supported & ~1))
>  		info->pasid_enabled =3D 1;
>=20
> -	if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev))
> +	if (!dev_is_real_dma_subdevice(dev))
>  		iommu_enable_pci_ats(info);
>  	iommu_enable_pci_pri(info);
>  }
> @@ -4309,6 +4318,7 @@ static int identity_domain_attach_dev(struct
> iommu_domain *domain, struct device
>  		ret =3D intel_pasid_setup_pass_through(iommu, dev,
> IOMMU_NO_PASID);
>  	else
>  		ret =3D device_setup_pass_through(dev);
> +	sm_iommu_enable_pcicaps(dev);
>=20
>  	if (!ret)
>  		info->domain_attached =3D true;
> @@ -4359,7 +4369,6 @@ const struct iommu_ops intel_iommu_ops =3D {
>  	.domain_alloc_sva	=3D intel_svm_domain_alloc,
>  	.domain_alloc_nested	=3D intel_iommu_domain_alloc_nested,
>  	.probe_device		=3D intel_iommu_probe_device,
> -	.probe_finalize		=3D intel_iommu_probe_finalize,
>  	.release_device		=3D intel_iommu_release_device,
>  	.get_resv_regions	=3D intel_iommu_get_resv_regions,
>  	.device_group		=3D intel_iommu_device_group,
> --
> 2.34.1

