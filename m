Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D9CAC583
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 06:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE5B10E0BE;
	Thu, 11 Sep 2025 06:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TT0etzZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AC310E0BE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 06:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757572338; x=1789108338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mbSG73cRTmCsFXl14csNcLJdJorFkeZAXJ8AuX6ZsVs=;
 b=TT0etzZ2TBHes3OvehxG0pKAsYRJv4CrraW/Q230dUg8Au8qDel/+2MA
 evcGMbxgETruiEfYQ6y5qS3KdA4hxzKJVW+6NCiTSZ+W8Gz3ArovrByuL
 XYOtFYlJzvsxeqLAXkgnVQ6YwtKIWQC4VTN3nFrjHKppNdIzJhX1XBTPf
 vTefkgaNuz68b1npG+P80r+6WUTX6GKaU2QvuMZr+Muqgtsy+yVtBV0oS
 6FhMYCosUj31WyYdGVoRYNl5gj3hcN28M/IsRtER1NWNAN2MNW4V/6aSj
 9T8Lq9huEfDjaw9iKiYwy3X3WbPQtHgOBu+Y1g6INhPrajPKBZNwE4shR w==;
X-CSE-ConnectionGUID: VxEJInwsQWysdRZNpp9Z7Q==
X-CSE-MsgGUID: dTZQRkJ/TrCKTF7rrTt6tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58935697"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="58935697"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:32:17 -0700
X-CSE-ConnectionGUID: Lk3AdofBQD2PcJz69xcokA==
X-CSE-MsgGUID: XbmtCLOMRwKhXKofX+6O5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="174406560"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:32:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 23:32:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 23:32:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.62)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 23:32:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gT2eRwTNxGEE+Z5noicHNn1CxaF2dK1Fl5p42ejvbWnGtbUFAtDcrHVjdCKTxEIzkrmtVA9onLiEu9yaA7lgfO3Xa0vtoDA3rvcXXk2Iiwonf+HQ/urA4u6JQsRMCeyJRHS1dbikzHQBMhjJrCd4Snzyz6VSVq1Yf5Oaf9a1rLdsZSsIABNSLy+oGfHQ/QTHgS4pVYSgRVp600C/Mkuigb4QWfSbi/HS7UFV5EbxWPGuXt4pTRE5Q96n2U3IzX3sMpZh9ggGApPfTz5dg6MxouqRRjW8uVgnY4j6pLrxTkPudQpbXGnkkbibz5TT016htKfFlfgo31TS1Rw1c6miGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adh2Ts0a/XHRKsf5knQE0X8dwGI0yBvAHadZCfGfVDw=;
 b=vYQdOz56YOzIlecPbtNDIstSCNhMLEjLzCzHOSKmqXdr4feTOllapuiDlRa9TK58dRNW5eEn2I2cZ1x6ullNt4kzHIPpbN6IonaZVjyvtGWMtCCF8UzZr/4Qy8041zM15GtHYJefew1sCjLp3aLOTBfSlYvtB0QsUt5NuNibqNEAQIVa6b8j9AnJni9qYRieV0KLGsiCdtzSPZjuJPegcSd1pOGxYAL7wmvTEY6U4oxNPHF0CmuOMQt3t2Xub79HrhlZW5EaV8maKgA7DTXT7QOGRL3ktxUX2LIT1qijFgV0L/Qb0tOD/2s+c2ukHclqfObalItrAlFf3mADUKXMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA0PR11MB8333.namprd11.prod.outlook.com (2603:10b6:208:491::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:32:09 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 06:32:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2] drm/xe/tile: Release kobject for the failure path
Thread-Topic: [PATCH v2] drm/xe/tile: Release kobject for the failure path
Thread-Index: AQHcER/PFu/xCAG17EeRj9jIQmGLpbSNdIiAgAA0oGA=
Date: Thu, 11 Sep 2025 06:32:08 +0000
Message-ID: <SJ1PR11MB6204FB57587730E13E4196B68109A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250819003957.2868064-2-shuicheng.lin@intel.com>
 <20250819153950.2973344-2-shuicheng.lin@intel.com>
 <DM4PR11MB54567C12C35D39FDD4F15D12EA09A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB54567C12C35D39FDD4F15D12EA09A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA0PR11MB8333:EE_
x-ms-office365-filtering-correlation-id: 2b27fb03-2bff-400b-d379-08ddf0fcef12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1EVLf3R3W5a3/H4Sjaq5f/J9jKy68O4cCdcU0XD6q+JDiSwhb6kgwqKTxmWe?=
 =?us-ascii?Q?UjJ1uInkhthFXgN6oUSQLGWxhd0WcntKjJqli9lWL73drJ1FTrqYN3dTqd/L?=
 =?us-ascii?Q?Jo1wJuT7Cc+D7DK71sA2GX8e1m6kIn4DbEQIbjwCngYnWZxY3h6bVS59D0fI?=
 =?us-ascii?Q?mJnzOBHdI7eUpCi9CUVGs1QHwP9i0+65VyxRpQJ44MxN5FA7JWt2h4kEhfDo?=
 =?us-ascii?Q?PZVv4jldYmyqmjj21ZChxBKDnmU7QGU9EzA11l2/NhCKPHUCpuN2d0hri3Fr?=
 =?us-ascii?Q?cp+rEjDkN94FuiwfXkAqXk1OKLGrRkzPFUO2egkm5sAgGeIDDG4jGQ+rR6pL?=
 =?us-ascii?Q?s945QEPtKTnMC9GKrdBGNtM6DljGZ7/MpZI7QD/DLB4hR/Vg1Njq11Q7UNvd?=
 =?us-ascii?Q?luwEeBebvm4rYsn4Xqr9KKyGCVRJ5jk6BPW448TNglpJNTuxzy3hW9D9pzrd?=
 =?us-ascii?Q?IgeN9fcETEdMBnyxwdehQHcainL/jhgRRww4oU8kQWy2/0+7fIPAEeoXUjJk?=
 =?us-ascii?Q?tqNhIsUJHWqr8p3m30LJ6wyqrplbhY+CJj/owqUfTY+muYLPIxrKrWwmviNE?=
 =?us-ascii?Q?snQwtO6qOH7XyLV6/JcbRwNo30vBFobGAiNCqowp6YuvZASTIChmzf0lcB7t?=
 =?us-ascii?Q?qr0s4DUTpgP/Im4YGxkHF+APguPqEQ8FfYmZWeKrHRPsx4lA3BcsEqWGB8Kj?=
 =?us-ascii?Q?MPbdSI0HJrAqaA4/hsUcwhaEId7eb2dga9N+5FKAGnEtSX570EKyaJPyDJw5?=
 =?us-ascii?Q?EssbrgLjC6ns0A4UxZZSNU3l8losOyqRfsXyzIJc3hwd77+eIXbtDDJUJEYo?=
 =?us-ascii?Q?M5RGemVxLK4jOVZOavyXZavjssFkEgbalqd00VkhLpETDDoTPjEOZtcU0mUv?=
 =?us-ascii?Q?cZBrD47mIPRhWTi6iNOzhmhvMOMpJQHOuHnaAgl0u6U9xYhBUaKv/nBDdhu9?=
 =?us-ascii?Q?sWHR5YxCrvHdugv5oBhxfUsjIoOcsAHhCb4f3k0wrQ52mll5J62eQW3x/nqn?=
 =?us-ascii?Q?KOHJ4UEZKIJ9fqlzqN7dIppUhc8YhVd98FlfjRMbphJd26iztSZctq0AzpS4?=
 =?us-ascii?Q?vyIMDLtjayx1+61BAb5quDV8U096OUdVb1VKRtJwjLcDdHQdHk0FHiGfVgPs?=
 =?us-ascii?Q?mjXsDlzqbe1oHU8kmliI5NqV4QVxvpgpePp4cSnqpOFJeUrLJZh0sWAy/VkM?=
 =?us-ascii?Q?tZXiIrkr1sJG3WYajkIfQVG2LW7m/SEP8pJOe9zboqWmcfm15iwxc8KGlqLu?=
 =?us-ascii?Q?foy+NjC5r+Jy7pL+kafkQUT6y7Xbl6Qo2baFPjen6zflTEg6t0+HxYOuezPs?=
 =?us-ascii?Q?Eiaa4pVo6kZDDqeupOwNEtJEhKgbQVBdHRyPTNF+otAWZyFXKcfKYTzCLwTa?=
 =?us-ascii?Q?Kok86NEAP3Hr4YT+8hD92PRD1RgohexiJtx4BJJC9Et0sZxpCpb3rMXmLlQD?=
 =?us-ascii?Q?58zeu/2MQusCEmlUeFgCWQyr7mjwzrhlu+puO8mch/VdYEKLQ0VXqJ/hPG9p?=
 =?us-ascii?Q?znojlrTrunQPQRs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mTphPpmSSAoS41oMe6h7epAr1/nZBXFtRs0EuFIF3TYHKcXd1pM2E2zxystg?=
 =?us-ascii?Q?tbJjrtA3kYJmOzGRJ+GMsTr/q8LHuJZbRCA+AiWc2YTobCnbOkv18VI89LkM?=
 =?us-ascii?Q?Q8pPdE/P4ySHNyqMF3MCPo0QqHCMn9IiRZq8AftHpj3ZNqQc0tKbtQxA0ij1?=
 =?us-ascii?Q?dwOP8M62btGs9W9wpWjkLByqc390mflh6GZyOiO3qf+7X2DqGYXgdJe1M1S1?=
 =?us-ascii?Q?rtwzr/0mkioJwNs0G303W2RupQ8XOkCB+5o2HPl5dkucrrArvZlG7oJQz7yz?=
 =?us-ascii?Q?mpIa+VnRP/3p2p8p8qagYtBz6tUJNQhmPWYObhKfKXJ5QPlmkSQdJPmGFNKF?=
 =?us-ascii?Q?D4tzHAgLKnkQAtrJT4YXnQWA9Vij4fvqmPF/50sFCdSBESYO6hv0f1rZ4gsg?=
 =?us-ascii?Q?NpemFT/oIqzO+motFOS+gHnhn9iF7LYvuzfVjq8XgfJUnGQRSLTilqLEYJH8?=
 =?us-ascii?Q?8fCCEh8azvcx6Dm7aSXuGTvK8bPwd+mtAIu0/piAumv8NxU83nEfSioypawc?=
 =?us-ascii?Q?wtY4yVwmc/+F36ZhIxC90aCY4KbBDO98tvmPJ4uMApN8Uvqme7Ry0Aei3Zvp?=
 =?us-ascii?Q?x9A1fJeXFPU66rcPzwCX8yt4KHQBId4gpEymsuuDOVBDkt60OT6kqLQlQeIk?=
 =?us-ascii?Q?kqvdrVwZfL1HE9jfJkxBCXWznxDCdbcJSVOogOIL1OM6+u/AcXftxCQIe8+C?=
 =?us-ascii?Q?brR1xuo5UDWBNvb1j0OmC17PRLF3j7XbkEZ5Bc8+OWmFWz4CYnfzmHpXG4R2?=
 =?us-ascii?Q?wsB+Fv8nzoIDSS8cIYB99qsgL1fnMV4nTZwbgISfhgez9IrMeBkS91YGPiyF?=
 =?us-ascii?Q?dPaII9PB4mno+3ZhSt/BX2BzRdMda0+pEDxjhCevCA6JKg6NvTe4JYf8inRu?=
 =?us-ascii?Q?+a4suatcJEgEvcUyvDxEafD2VJDM/DzUhar6QqS49KVqh4Lg+jGwcdIT6KWw?=
 =?us-ascii?Q?ttLWz1ET6UySoO3AqROBY/pOcu8SF/g5UE1Bw7Bds927/BUavVmJDuqV96Ct?=
 =?us-ascii?Q?98miXPq5XfeilRDqLrf/mpzL3DjzcfyaW7irOAiZcR9ErkE8n+gBBXCgkGhh?=
 =?us-ascii?Q?5Or0KmFZlk+fVTKvYFuB6zdIanNUtSQEtaE2D5ckVmaVo0GaoWXU8GiJ9u39?=
 =?us-ascii?Q?MKSOCTAi3ujbx7uIQXF0dvCvoixGBx77UugcCpjUqltPQsRaaD9Sqti+d2PN?=
 =?us-ascii?Q?GznPcBCF+Gki/o8tv8m5Qqg4CBZPGHsKLJtb1GiWy532XWIMUoZypOh0scCT?=
 =?us-ascii?Q?z0DVGpe1X2jLgT4E96xcpdJPmkfDOnvX0ueKExosNx3gklT0iRrxjaCMG0P3?=
 =?us-ascii?Q?5tVcM7aKPRrTZTq4FlWEp/aF9CFKTZmLIjNVOORhxzAiL/Urfnd5ofSTRQO7?=
 =?us-ascii?Q?5PeaO3t+8fQQyqw0RU89ve+Xr/H0PPUA0VzhvrK9A+o17FFSs9I4h85v3RQM?=
 =?us-ascii?Q?84In5+HAVDRc4TaC5kRHawmqwcYqkt4txaZRmm9IYUaKvkzY15qn2zSaJaWm?=
 =?us-ascii?Q?DulQfvsoLQnLqb4JdHENNoR0FTpPwf182op+FNM04ZKxwf7fEflyEmDDHAij?=
 =?us-ascii?Q?8JJtDpMtPPpTUGsUOIc98B01m+4I5hJyoJgzX1eZn8AvhrjCEJ/SyVBYDkCi?=
 =?us-ascii?Q?FAa3tvs7lgklonc/m8FiN8ZmXfDR7BBXiov92tyrZivC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b27fb03-2bff-400b-d379-08ddf0fcef12
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 06:32:08.9539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9EKAhwTxPadDrYUWay1ZErY8I+khmKWibLlOuzwyqoipAh/ev5a8SeLAI7zk46Gz+L5qiIhRN93GVhkbSWI9y47jRP5gWYuLxrjNxYMufvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8333
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lin,
> Shuicheng
> Sent: 11 September 2025 08:53
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>
> Subject: RE: [PATCH v2] drm/xe/tile: Release kobject for the failure path
>=20
> Hi maintainers:
> Could you please help me review and merge the patch?
> Thanks.
>=20
> Best Regards
> Shuicheng
>=20
> On Tues, August 19, 2025 8:40 AM Shuicheng Lin wrote:
> > Call kobject_put() for the failure path to release the kobject
> >
> > v2: remove extra newline. (Matt)
> >
> > Fixes: e3d0839aa501 ("drm/xe/tile: Abort driver load for sysfs creation
> failure")
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_tile_sysfs.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > index b804234a6551..9e1236a9ec67 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > @@ -44,16 +44,18 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
> >  	kt->tile =3D tile;
> >
> >  	err =3D kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
> > -	if (err) {
> > -		kobject_put(&kt->base);
> > -		return err;
> > -	}
> > +	if (err)
> > +		goto err_object;
> >
> >  	tile->sysfs =3D &kt->base;
> >
> >  	err =3D xe_vram_freq_sysfs_init(tile);
> >  	if (err)
> > -		return err;
> > +		goto err_object;
> >
> >  	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
> > +
> > +err_object:
> > +	kobject_put(&kt->base);
> > +	return err;

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> >  }
> > --
> > 2.49.0

