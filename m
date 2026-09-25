Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEE2C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 15:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C642C10E22F;
	Fri, 25 Sep 2026 15:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Li3jZMb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB1410E22F
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790349837; x=1821885837;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j50Ml8j87rlCiroHYRuU0Ctr4k4/yYq3czbVPz2IL0s=;
 b=Li3jZMb6mcrYDvSbR5Wz0rPU1MthncnA10fda232+HqialhrQdv58mRk
 xwuCMfvHSAosstdSjhzVPoT8IRDXcTz5nHAMXn8QkLQX12C3T6jceEFPC
 dq89kpLNPm4LI2tli5EVMeXjEcbiJ4CBrKNoeTbjEk0ejDLxM+prtd0Bf
 tfV6f6VapEwCOvBAEB2oTiS1HmV63Iqz/vTP0IY0Y171E3olxXcRCcEaC
 DC75bKE69/LCIk45kY5nN+SOxUmthv3JZkZ6rYsd3z53yFkGwYrWYivyE
 0WLrMH5mYD8hCYbLG1dr7niUjGr7hrQNCh7STNH4AbERITf5bIj01ssah w==;
X-CSE-ConnectionGUID: 1d+RMVFFTdq3Da+gR//QZA==
X-CSE-MsgGUID: Vg6ubkfhT5e6h5RN1+0fWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90176103"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90176103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 08:23:56 -0700
X-CSE-ConnectionGUID: vPcyuIoVSe2L5F4rWgsnMg==
X-CSE-MsgGUID: A0t7U7cjTQKLmhRxZRGmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="274442475"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 08:23:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 08:23:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 08:23:55 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 08:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYOIkZpY1RyG72VmOOY6IRB7OAeBmdG0NJTeeq90JuxxGxc5VLwYd2GrQrbxgPMSP/kXqYiEKzHf0v7ZXzHD+ufzwImvhUfoHSHMMR/VtGd1ZoAWEKjs+qSYrXb87NgXc3ICDWMvaO6yXug8YBdsNHu9etlLu3yBWJXoWJsirYMn6Ti1v2AcElwxq/1AUKKDtdm9ugPHIhcFEplIGNIYaUEPVtZ6te7VLQrm0Uzx9pOteJ9fQG4iiOQXSrZBeZ7g3WC2X71Sq03aY6HMLeKcPqG6Eva1nLKv75QZnng8ubXKE+s59q4xjCgSESjdrPYCERT26jAJVwwkcKvi7n/xhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fLyvze3jGlOrSbJ0E3qsmLRINiZbgHHvjgnmbaHxYU=;
 b=rvLx3TdN2c41zbsISktlcHLB2AhBJl/hF3E2jvQrFT6w9XAe+JeKd/vq8o5ggfL0bsKBq+IMTsRMXpaq7r5F5EMYVCfKAvChVdunXsDrAAVIgFUuY4TIeo4Mvhmzj9g/QnY4LB6Fm2Xf9di0vPs9VdRuMWR1cynTI/zjTY1LiALSzLcxFRxyg4NtBZHDhzwJw3g04LlacvEcLtCbqdvCzKLTTkrIkuMhIAYLPDdkaOwhehlK1aAZYaf1WONuFhuIUR2h3RXBDvkcWbyHwv6t05XkwqeY/v6hAJ3Vqv4VSkyZD69RWs5hft6pFrRTqQbq7vyROwq4iTjU1WckJ33d9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA4PR11MB9180.namprd11.prod.outlook.com (2603:10b6:208:56e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:23:53 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:23:52 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Sousa,
 Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/xe/xe3p_lpg: Add support for Wa_16030224309
Thread-Topic: [PATCH] drm/xe/xe3p_lpg: Add support for Wa_16030224309
Thread-Index: AQHdSmUqGrO6pvCV3UK+gT+0XwJXH7bfbIvA
Date: Fri, 25 Sep 2026 15:23:52 +0000
Message-ID: <DM4PR11MB5456884E9DE94AB903416358EA802@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260922073518.1444952-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260922073518.1444952-1-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA4PR11MB9180:EE_
x-ms-office365-filtering-correlation-id: bf2eb7a0-5887-4d6b-1eb2-08df1b1901da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|260925022911599003|11063799006|56012099006|260925021311599003|10067099003|11062099010|22082099003|18002099003|38070700021|7136999003|260925021911599003;
x-microsoft-antispam-message-info: /zS1kxzqqlf2dwX4Pzz8aBZjE0femes/ZTBvKd21vmnEBYmqyqRByAd73eECK3dAx1O2uohzyQ6MaUBQfk83aoW+6LZq/H99PL0NN3fuRrVicqUfdzuh0p0mEjUypBVNs9aDv8K0zQOSbAmlmplX7rNpdmcDOyeagzNxrL8R+YD7CVec0VPlgKy71TkiY6aY+Nvzn4vQXfTZwPvu0lpccUfMSdSKWotgfBgKsj9yW7cX4aJlS6/r4KDFxy6D1ibk1oyX9P2Rydwl4VrxreNrhoQL3CyfL4Ycrz7JOPXqRyqJ/2jFlVtXrpsEnelsQO7Y3pmruPoqdpMroEjrBWNFbvEAFISbkma4wgIrZgRTm2MasvsAbADAIKCtRWJ2023AWsbXcyQAanJvTto+mha5ECpM2VDNpkhz9cBuBxV6eLaYWbZB+v8hoacKtaZG6CowjEDUUXQxlIh1tc8evhAT7JwrKML6vCt80CY0ror1QGEnUnCPuaCnbzDXAI2AT8SWD1xacFj8sgGuu6SuKwjK7lehsHakMWhnpk8lmMI27sMYt1AhsT2juJD6d1lUA7/jJeBJb5CA6kYPzZuugtlMER4Zf633llKP2Gi7poVDuqrRUF5zr1IFsg6/lrW4e/ztZlkRcwEl6k9ZZ1veJ+Da7bfFmSc/vQGN5y3AYiuGccRduJHYvveIS6kHdPIsT6nJQtc+ta2h4HxJy3ZDuN7Kmdl+aVQ051sOSpOq85EO+LQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(260925022911599003)(11063799006)(56012099006)(260925021311599003)(10067099003)(11062099010)(22082099003)(18002099003)(38070700021)(7136999003)(260925021911599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pK1mTC8D72TnO1CfnqF9f5MVrhVLkrGmEIwAXupOMyLzPYpXyh+BUE6P5z5Q?=
 =?us-ascii?Q?OgudI15oDCPNuf1VbxC8TIjzrOtrVoNqOV0o5Jpo1lGgj8ruZ2+h4Hv7dQcx?=
 =?us-ascii?Q?To58tLBirKmkcINoz2atywKuATEwdXNZw9Ec/LE8dNvCw+sxA36geCGoWuSp?=
 =?us-ascii?Q?Q1PmRvJFAcf3AnfcGUrprqMtF0JzaWAS6CiywZ8Qq5t9dr7J9219NUXT6SAd?=
 =?us-ascii?Q?r1Z3niv0sYa8pcUWKj3a/XJGHqnufLp4X/pgnDLughQa42shDUVVm6WV3QEJ?=
 =?us-ascii?Q?DDHOKsDNLu+xUage3kqPJY2ZeG+ueSgpXv9JEQD6pn4rLeFiM2lMDqQe6H5B?=
 =?us-ascii?Q?yUu/gxmcto9UcEjZ0FfMpp6Yc13NLi7pKam8lhmAvn1PsXCfdPjlQJXYMQVx?=
 =?us-ascii?Q?F3ExV74QpkjKdqdyJNkTkTU0x3wIyQXq3sf7iG6cZqZOVDIuJgLl8vdKXG05?=
 =?us-ascii?Q?nBPRp9HrW8IScDyh7e/Y734HWkGTXQQ0gB14HIeobnjxE0YWfctKkrfTaH1H?=
 =?us-ascii?Q?0Cfo3Hw+kQVfopuoibzjJLxKt6l1O2vi4fGWDKTkpCjnbEG1HrizciYMTi18?=
 =?us-ascii?Q?DE/vbHdDo0yM3QQJgflFgR4BmmvJSZ0fFk55Ti9DI40qzohq8i8ghOg/pnxu?=
 =?us-ascii?Q?ZkwIkT4nk/VaFRnKrxFsg177DcKiO5tlVhaV2RKf91Hzhp0VbuyOSnWlgxsD?=
 =?us-ascii?Q?miDklwwssU5jVIc/O8IS7lq1vvF5w965LFgmc9aqrCne9OW6BmC3YbJDlHss?=
 =?us-ascii?Q?OdZujEsMmW2lq1tyFxkVhhEf94hmWW6NvgGNyo3jJ/0f1E8L1BhkpGIT0nu3?=
 =?us-ascii?Q?ucajw6sgy1mzEp12+nVKAyHAjuzFR3Depy5TpSn6sX7I/Kjt77uhOzTOr+1G?=
 =?us-ascii?Q?MmVwFVpCDAdgypc3M/8hWoJ/g+SHtG6w91oIf/q7ZpTOnAa5jzExSn6TAWRv?=
 =?us-ascii?Q?OqLrBAnGbE9/gsNVMnPKa9LfZ+njLQ/EhAxgfBedI3B+xwAmwZPNHy8wrZba?=
 =?us-ascii?Q?oUxZYbx4sQEBplv98cIcULYnw+vGdFSYzuwm9PuOvFuPFLiYKjT9LK4XOzfX?=
 =?us-ascii?Q?k60rEmBQhXgudRe9LDd1SsUhsbmGtA8UaOv+VcKm65xzMrrJo279DrYGdfSz?=
 =?us-ascii?Q?x+LRW9BTQ9H8bgM4x+x3MFUoC5wiEO5uuswkJmmZA4Lntt1usIX+gkahVd8a?=
 =?us-ascii?Q?8C2BcoUS6xsgAzZgud7tZ69gPeT5/ysCidr6vWb7AAm1zvmxS1/3RRGTaiQk?=
 =?us-ascii?Q?wTJ0m4fFRq+fVmLUGcPkjZmuReUk7pZgwRq/cC3TN7K8fZ6MN5XksGdhapjB?=
 =?us-ascii?Q?mwZ32O2HJyYTmRsBixj2KUB9W+f3MnUcaqWdkG51SoUokJAvK/sETHulsHAd?=
 =?us-ascii?Q?P5Nk9zTj5q+PSw2EIPbQbd99dbwZkDZaCQLucGkdgmGnB492UW9C9HEK95MK?=
 =?us-ascii?Q?ZbWHyGubFRNUvWy9j+Ej2waQnqmsuM+nVwXxKVUh4WAmZG9q4EothwkWNsLg?=
 =?us-ascii?Q?35frjtdbHe4vlo2Sousdjd4M9wMQb5/R7mEUUp5ErEjsW7c7ha/RaFdF/+bo?=
 =?us-ascii?Q?/2PPck2xoYCHodY67Cd7PrGgl9HJ8SCfPpITGsfeZY4J/NAAQEu+bEUxOGSd?=
 =?us-ascii?Q?/wbw/UlDfztq7/l0Av17dbvkF2NxrUZpsuftyVBjPTgDzN5cnPuTsP8UocPN?=
 =?us-ascii?Q?+PD2R7i/LKhdM8hcyfF99/jvFfzJfOQYLqVP4aWZ9pwJ60eRItE/MAMAcuxR?=
 =?us-ascii?Q?e4skf1feyQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kRMrlJxdupxihSBWpAHEIa2gPJAYDivhmP7EpkQfLFKC1CMTsQ0TP0jgHeHTJei7qzA4ganQSVWLUMr9C4Pkl6D3qfJACfJwSOj4zIdtOaXoU5SnIV90uiVpZLNj0VbryPGSMDHFBoU+rtWAls7BWhOrSfkNroZN8Npe9Zx9geZ+nr1m4vTB3ckUMjkARhwbewOCy6mp+hERwcD2zP629H0IYO7wjmkc8iEEkRpVgZlSJq3hmPIw93HJg55YVQrD7r5FnEUXDzOJxUOXG7CWlZBbHlSs06KMkT/Zl6yl6KJitiuKxzJFPS4HYdikjnXvcNsD6M+g4AwTwu3rtcTr6g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2eb7a0-5887-4d6b-1eb2-08df1b1901da
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 15:23:52.8856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFhnT8P/G3eXila0RN2roMbBUzrXULuFeCI+Xvb2Cq2HjsHl6JyJF/1nycR/2RhIU0A6UcBLEy6IA2NGec9UPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9180
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

On Tue, Sep 22, 2026 12:35 AM Tangudu Tilak Tirumalesh wrote:
> Opt in to the GuC workaround, to ignore context completion status with
> preemption or preemption-to-idle in the CSB when the multi-queue feature =
is
> enabled, which is supported on Graphics Version 35.10.
> This WA is supported starting from GuC 70.73.
>=20
> Apply Wa_16030224309 to Graphics Version 35.10.
>=20
> Signed-off-by: Tangudu Tilak Tirumalesh
> <tilak.tirumalesh.tangudu@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c       | 6 ++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
>  3 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 685c4ef17b73..4bcdc1a96785 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -525,6 +525,7 @@ enum xe_guc_klv_ids {
>  	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG
> 			=3D 0x900e,
>  	GUC_WA_KLV_REMAP_RANGED_TLB_INV
> 				=3D 0x900f,
>  	GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64
> 			=3D 0x9010,
> +
> 	GUC_WA_KLV_IGNORE_MULTIQ_CTX_COMPLETE_WITH_PREEMPT_I
> N_CSB			=3D 0x9011,
>  };
>=20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> b/drivers/gpu/drm/xe/xe_guc_ads.c index ff8eee3831aa..70babe95a6aa
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -396,6 +396,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>=20
> GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
>  	}
>=20
> +	/* GuC only applies this WA for scheduled MultiQ contexts; no KMD-
> side gating needed. */
> +	if (XE_GT_WA(gt, 16030224309) &&
> +	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 73))
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +
> GUC_WA_KLV_IGNORE_MULTIQ_CTX_COMPLETE_WITH_PREEMPT_IN_CSB);
> +

This is a WA, and the upper GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE is a featur=
e KLV.
So, it is better to move this before it, to keep the WA KLVs together.

>  	size =3D guc_ads_waklv_size(ads) - remain;
>  	if (!size)
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index dd69ad07f7a9..d06ee78bf534 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,3 +72,4 @@
>  16029897822	MEDIA_VERSION(3500)
>  		GRAPHICS_VERSION(3510)
>  14027054324	GRAPHICS_VERSION(3511)
> +16030224309	GRAPHICS_VERSION(3510)

This will cause patch apply failure, please rebase the patch with latest co=
de to solve it.
Thanks.

Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> --
> 2.46.0

