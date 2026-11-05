Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F0606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fes4Cd9B
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613831128BE;
	Thu,  5 Nov 2026 23:23:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF871128BA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793920992; x=1825456992;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/yNvPrydnKWaBM/oCagujgjZhiniUp/dM4flHhoIRbk=;
 b=Fes4Cd9B6m8oROSSYyTLrci9BGZmxjjC7hN/ywIVdDfILohlxDkOdr2D
 K1AgJHezHYgYJib1c5I2dx75NX5xFid9ZfJ9lSHDGHBfBojbWMldkuU12
 hHDLYrN53MizwcCHSxWBmHpLUIbOzPMVbltEvLtsGN5lxb4i2Qwdn5dyV
 6M2iytkJqHKahibFKh7WTprmVRb8e1KYRp9swzq14s1d/sTQUZ1SCCpry
 67lfHHLc3S/AHLabGMDFzaQeAdKDpB5KljVKh16z9MFYE52y6VPmIEw3A
 JoEZBBxuZ05K7Z/RwKNcfE1Ji1eInwWNNl1UTaO57n8kmGeAAVVPoN6FD w==;
X-CSE-ConnectionGUID: OIy2BuERQT2MlL1SGGa6+Q==
X-CSE-MsgGUID: jqDsP71mT0yV9A4ZGQrG2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2603153"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2603153"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:23:11 -0800
X-CSE-ConnectionGUID: nlIJ/RkeQIKTeoeS2tFc5g==
X-CSE-MsgGUID: tosGNqdNQlqTXyYo5lWC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8890916"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:23:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:23:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 15:23:10 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:23:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+RmDLy0Sncr1tGrEexPSHMb6ZoDKh/ou3yZ6/KbYnF5nr+iyDCyr6GBClUtVkgx0xGO3EZSyCseMmojD6m/2JXm9abJNoYu+2arw74or301IS9UCaKJ0++N7zWO+ZGyKGSGb3FUTXuiTgfgMXdBCQOBw7OLbiB/8kBM4eSQi1K9tP8oSRC+gLJ55nCj7KETuL8PgNTenTDzvzY/uBpCwSwEufbLnaeULkZtP5xcqwxe9YhDyZ5eFQI9ZYeIul4got4QN7krsDJx82/xeZ88qMeMuXddqHXyBIQ19x6CfuvXs5zGh6zF2MgrKxsVWti/OcpsuuHksE9oRBdgBzYiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKkCC/ewb8/QCH75XmMtHNbQ5craQ0AW4a+LCbS8jks=;
 b=BeZk4P7uFkQSdrH2WwXLaQJbit5PY2NsjFzeKX9fVO1+tMl6u+PawNrdEmgE0y3lMdotNHCgtxafXs9ZyHzIp9+tSLegQlYoKlnl6UObaS3WSN9g5ONCMR3gHDO7MEyhndzUjxXlWSge7lTx9ELKlBmaqRVDPQ928R51TR55/DqGvTL33kP0Xj9LggGesp9A7bgNmYDK5iNjw8lsjh8t0vGV+3naOmj6yWK2pDGoj8xbBLMcESl8iBuYNM2whDig0As8/QBGh9ZYhcQwdwxVod+u/U+f3VZxyruSpmLEk7Q5Nm4ONYLznkAX8uKboxiTUq4ZWVsUNFebs1paO/2w8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 23:23:01 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 23:23:01 +0000
Date: Thu, 5 Nov 2026 15:22:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/wopcm: Simplify GuC WOPCM programming
Message-ID: <20261105232259.GI6162@mdroper-desk1>
References: <20261105004254.262075-3-daniele.ceraolospurio@intel.com>
 <20261105004254.262075-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105004254.262075-4-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a123c7-81f4-4c80-70a7-08df3b93bc48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|3023799007|11063799006|56012099006|4143699003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|261009221227099003|261022075727099003|261022113327099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: GoZl9a4LxBcOTEbKChVPsKjAVW1gs3ihjQJXl2QtSLP953vL9P0xdG8vufCf50qGN9xXKb8HePXfyk5LWrgB+lcN9pUHiyPEsERtdHYvY7Yhxp9Ai86XzUkdRyt+m1+lGgC3AwNkAAVvj5aDZaAxz+AZpNOhWhtjVTMEb8QwkRzrT4xBFafiEQbspNBzITX4VRN0/aN/aWZPqWKwjSaCaDNgVQ5cC8tV0L3IkD8wixyYO/Rxj87crqUVOZ+9lP3NjT+JYe5JO1p7ozwdCsQiSarHH4lOHt+2ixTNdaW+fLA1e8dLTqo6OhqAsD8QTjWBMUecQbGVVCkZtkmdl9ydchyvVPkVtR8eHbs8OdSPw2tEu7c5Fqp1X9g4HgJIeQrsKj5fQAdmNwPfXQCJMJDmDumfJSa263nzFgg5p8UBlwzfsSekJiDPMEGLnv3eoUGg/MEXc4u1brDKnTSESr/GMQkdQXURCpuWSpmEcvBqlyIoXfel0QfQQ09N2FsuoDQTm3Ju8PvmeqwKWZoQ1gRSv+yRCRvVIfEbVVmT//BrbVmbqxoeL5mdsyhZQkvt1/huclSFLB7ZEGf7Oc7rFzpfDt8CZ6ALfiB82htdb1vyUfNAK5NX6+64wY5Da/1/KlfaHjbvEzam+zERgFovRrsO0Nd5FhrcF2PnZ7hM2vt5c38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(261009221227099003)(261022075727099003)(261022113327099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ial9Km0aFsyjhb5fFclDfYvA9f8o4y+Fiw/tCXUEr4OI1CAS8aLBEaDRj4?=
 =?iso-8859-1?Q?lNpaBvUk9J7tShhdfat4SyK4QAQ5QInoD/vtpqd1i0A6mG4nkx4tio9BKN?=
 =?iso-8859-1?Q?4KDEENa19m2rkVX/mWfN4AWJHslAziiNjQ5KUvqpBYD8bFTC1kdxu/ksYC?=
 =?iso-8859-1?Q?jlnDQntHibvr/43bez9rOYgjjyOU3tLex/imrCuSiHZD3ZY/2GCkMpMBJa?=
 =?iso-8859-1?Q?dk1O8gXL6TXxMOQxxAr/jExgkCtD1MUWT3TXjDzwtb+W7almjUOUWOIaOL?=
 =?iso-8859-1?Q?amd9arR0+3gmF+apJPb2WU9c1DRJYhFirAzDDAuJfErlzy7/v0bUTUQOcP?=
 =?iso-8859-1?Q?EninEIb/Rtz5nqOGECY6onHg/j+194HgfGqxNvmZTyNLlzSD/x5gZJNyUe?=
 =?iso-8859-1?Q?OWlyXn4qj4L2iANsjZXErljGEec0JxYEM9PElBAArjTzVDywIUhDZSdPl3?=
 =?iso-8859-1?Q?ZgwjLuEDAv+yTYxrpgmIjsccVH9jXF2+P5A920z5XrgIcnDldK5VgTK33J?=
 =?iso-8859-1?Q?mYXdRGjhz+q5i0PzAFzLzupOJV+JB+IwTDBY3y1e6pvWTeF2cK7CBBXrHz?=
 =?iso-8859-1?Q?a77+t0HKTby93kYzzs+QyDVxbN64t3F58CFlOHA8KYLj7hF975F69UtAO0?=
 =?iso-8859-1?Q?4UtjX5XyNeQZ3jYIu6mjxmd6vtqLvmzIgsZ7LZE0vvgE0OHC0f+tJ4mJsi?=
 =?iso-8859-1?Q?2c+MPRU5tY0BhsGylGqy69Y8pbsfX/9cg8HrP4hB4b6MAOTnvWh7OlwwIX?=
 =?iso-8859-1?Q?lqc0FYYqAjkaE1aT4hnD7pZvQIUW/z2xYhr2vmrZLOQG4nwsHvRnRX1DiH?=
 =?iso-8859-1?Q?sd5NObkvYUX2Q7HNLO8YqxXhO0h0XNEnRWMQFPr+hYTyVWNwFtCrzCYdaM?=
 =?iso-8859-1?Q?PiKXwAzo+RnHMDgiuJxO7XuoCHOWSvnJb8HkzRoFk3k319YjEjVs8bpLW8?=
 =?iso-8859-1?Q?NNwp2PIC7pqoKatUnRF0Wtq/Dg/caqSE3mprrCeew1SWQCiikuJO7ScqD6?=
 =?iso-8859-1?Q?X2lFGfxBY3cPapqNnKL2p5TRfVf4qpVSjOypbt/AqgJvOS7HUZjjIGKdOm?=
 =?iso-8859-1?Q?479BLtDFbVtEFq3X28L7/66soxN+e1GZ0YY4LEslvubJDu1kqErqq63m6v?=
 =?iso-8859-1?Q?8XW71DEwFwmxjGGZix7BzPf3O7tNokWyZn+zDuPhVtydYrddUzwYCey3jj?=
 =?iso-8859-1?Q?A8WWie/4KBptOh43lyS4wSrp+J1NoxRJ/dGoUMyDACrsdoftmQz5CTVo/8?=
 =?iso-8859-1?Q?EEvFbUoFt5gtltjIqSxAJ2Q56qS4YrS5g8FXjpIUtQvW5mpbbCb0FxuX5/?=
 =?iso-8859-1?Q?Zsv7PuCdmookRF6qnm4hbf8u4ubLnNDiiTlfmIr/80Vzp0iNiXuT32Zebc?=
 =?iso-8859-1?Q?eh/H/iCBt81L2BYTK3cAHvbggsAq8crNJxuo5nRaUjsynnq5OM36R3mJNr?=
 =?iso-8859-1?Q?7pzIQYG1YtvPPJOOUj0hJmaY+kwce96LfDe9bHK9fXhP1XyWwvO6XPHf3r?=
 =?iso-8859-1?Q?EknlwRixsau9HgifGugpun1rsTczsVg7zJ/1YOJAlaQfMPtNwE0xnqEfUv?=
 =?iso-8859-1?Q?Ft4PSUtZhOCu0MZMKA9vZsF4gzzuKFh2JQBVL5NB8wLPbLpJjoKKhAlvtp?=
 =?iso-8859-1?Q?Lyk/XTHCv48CVUWPG1yitmZhnKPQye9Xy9gqeKNT0d0FfO6EzLGQT/XX5O?=
 =?iso-8859-1?Q?n4s+Kx9ru5Qw5OwT8RzkWPiWGLsdHbHs+ZZtmNIXZrUawkGjKEHQnI/hcd?=
 =?iso-8859-1?Q?rMkrFiHY/OJwow9aMMv6N0WkFGkrzvtIDgbymRGpyGSg6D+2V+WwZrKN0F?=
 =?iso-8859-1?Q?iLbGtaBHpyLR3iXaBa3ThEK6SboeGF4=3D?=
X-Exchange-RoutingPolicyChecked: QOdiGgy0f3ugzeDwLXJi4O7z1Our0NCdjpSKECC1fQCSHPfg76KMYqDm7qP/Vu0EhYmeCvm7OK43W19U8LzHUGWrdmOVsvvF7zVBk9JEmNzIGbPcLgKzU2koQ5WHpHjdMem5AtrZ4E6JSCQ1RAbhOdIPZ1M9WQ6fYxqeNPK3yVpJT033COqC21m+GX0F3NVQ0KTJ0Qb5brmIgLpAk2MJJ4n7mSCkCzXzEkPBvUXwejagmhAScHyZItE+TgXKtus+3ZM6OMzY+1iaMV1a3HI0AX01d52L+7SpQNIb94ZNRMqKO47JqjVAzuYIWsbEFTrtFWEms1MqYWhp+ZD46K5yjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a123c7-81f4-4c80-70a7-08df3b93bc48
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 23:23:01.6662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4upLvA9sa/pcbzN2byHnWjHVTGRN81V1mEe48SXvwzKmBCL9k4e1gmammQ2+YtSHA718OUeuEp8sYk2tu0x+/spLOdToRI3hN2b7clD2Yu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:42:54AM +0000, Daniele Ceraolo Spurio wrote:
> Starting from PVC, the GuC WOPCM registers are programmed by BIOS/IFWI,
> which is a trusted entity, so we don't really need to double-check the
> programmed values; therefore, if we find the WOPCM registers already
> locked we can just return early and keep going.
> For legacy platform (which are not officially supported by the Xe
> driver), we still need to do the math ourselves.
> By switching to use the WOPCM size from the HW instead of using an
> hardcoded value, we make it impossible for the programming to end up
> incorrect when using the official binaries (because those are sized so
> that they're guaranteed to fit), so in this case we can drop the layout
> check as well. If a malicious user is using modified binaries, we'll
> still catch the error and fail at either parse or load time.
> 
> Given these simplifications and the fact that the only user left for this
> is the uC code, we can move the code in the xe_uc.c file. As part of
> this, the wopcm re-programming post-reset/resume has been moved from
> do_gt_restart to xe_uc_load_hw.
> The documentation has also been dropped, both because it's wrong for
> platforms officially supported by the Xe driver (the WOPCM is now shared
> by root and media GTs and the GSC FW is also stored there) and because we
> don't use the layout anymore so we don't really care.
> 
> v2: Don't check against the WOPCM size on VFs, rework WOPCM base and
> size log to not look like base and end.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  Documentation/gpu/xe/xe_firmware.rst       |   6 -
>  drivers/gpu/drm/xe/Makefile                |   3 +-
>  drivers/gpu/drm/xe/xe_gt.c                 |   5 -
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   1 -
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c        |   1 -
>  drivers/gpu/drm/xe/xe_guc.c                |  11 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c      |   1 -
>  drivers/gpu/drm/xe/xe_uc.c                 | 132 +++++++++-
>  drivers/gpu/drm/xe/xe_uc_types.h           |   3 -
>  drivers/gpu/drm/xe/xe_wopcm.c              | 287 ---------------------
>  drivers/gpu/drm/xe/xe_wopcm.h              |  16 --
>  drivers/gpu/drm/xe/xe_wopcm_types.h        |  26 --
>  12 files changed, 138 insertions(+), 354 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/xe_wopcm.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_wopcm.h
>  delete mode 100644 drivers/gpu/drm/xe/xe_wopcm_types.h
> 
> diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
> index d3030d1c9a84..ed4dc12826f3 100644
> --- a/Documentation/gpu/xe/xe_firmware.rst
> +++ b/Documentation/gpu/xe/xe_firmware.rst
> @@ -13,12 +13,6 @@ Firmware Layout
>  .. kernel-doc:: drivers/gpu/drm/xe/abi/uc_fw_abi.h
>     :doc: GSC-based Firmware Layout
>  
> -Write Once Protected Content Memory (WOPCM) Layout
> -==================================================
> -
> -.. kernel-doc:: drivers/gpu/drm/xe/xe_wopcm.c
> -   :doc: Write Once Protected Content Memory (WOPCM) Layout
> -
>  GuC CTB Blob
>  ============
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 0392ba58dd65..52f0d5dd5468 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -154,8 +154,7 @@ xe-y += xe_bb.o \
>  	xe_vsec.o \
>  	xe_wa.o \
>  	xe_wait_user_fence.o \
> -	xe_wedge.o \
> -	xe_wopcm.o
> +	xe_wedge.o
>  
>  xe-$(CONFIG_I2C)	+= xe_i2c.o \
>  			   xe_amc.o
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index be79a0da2f2f..d7f46086c315 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -68,7 +68,6 @@
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  #include "xe_wedge.h"
> -#include "xe_wopcm.h"
>  
>  #define GRDOM_RESET_TIMEOUT_MS	5
>  
> @@ -864,10 +863,6 @@ static int do_gt_restart(struct xe_gt *gt)
>  	xe_gt_mcr_set_implicit_defaults(gt);
>  	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
>  
> -	err = xe_wopcm_init(&gt->uc.wopcm);
> -	if (err)
> -		return err;
> -
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_hw_engine_enable_ring(hwe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 0a47458e5bf2..0008ab5736eb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -33,7 +33,6 @@
>  #include "xe_sriov.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram_types.h"
> -#include "xe_wopcm.h"
>  
>  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 2a5f2064ad3e..60f1b29358f9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -38,7 +38,6 @@
>  #include "xe_tlb_inval.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wedge.h"
> -#include "xe_wopcm.h"
>  
>  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 300126e6624f..a24764aff577 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -47,15 +47,16 @@
>  #include "xe_sleep.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_tile.h"
>  #include "xe_uc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> -#include "xe_wopcm.h"
>  
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> +	struct xe_device *xe = tile_to_xe(tile);
>  	u32 addr;
>  
>  	/*
> @@ -64,10 +65,12 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  	 * might be different for each tile. So, just always ask for the address
>  	 * on the target GuC.
>  	 */
> -	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
> +	addr = __xe_bo_ggtt_addr(bo, tile->id);
> +
> +	if (!IS_SRIOV_VF(xe))
> +		xe_assert(xe, addr >= xe_tile_wopcm_size(tile));
>  
>  	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
> -	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
>  	xe_assert(xe, addr < GUC_GGTT_TOP);
>  	xe_assert(xe, xe_bo_size(bo) <= GUC_GGTT_TOP - addr);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index 24293521e090..a7c84f2d10c5 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -12,7 +12,6 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_vf.h"
> -#include "xe_wopcm.h"
>  
>  /**
>   * DOC: GGTT nodes shifting during VF post-migration recovery
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 89040d9fa05f..5696e5c870d8 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -7,6 +7,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_force_wake.h"
>  #include "xe_gsc.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> @@ -18,8 +19,11 @@
>  #include "xe_guc_engine_activity.h"
>  #include "xe_guc_submit.h"
>  #include "xe_huc.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
> -#include "xe_wopcm.h"
> +#include "xe_tile.h"
> +#include "xe_uc_fw.h"
> +#include "regs/xe_guc_regs.h"
>  
>  static struct xe_gt *
>  uc_to_gt(struct xe_uc *uc)
> @@ -50,6 +54,126 @@ int xe_uc_init_noalloc(struct xe_uc *uc)
>  	return ret;
>  }
>  
> +static bool __wopcm_regs_locked(struct xe_gt *gt,
> +				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
> +{
> +	u32 reg_base = xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
> +	u32 reg_size = xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
> +
> +	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
> +	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
> +		return false;
> +
> +	*guc_wopcm_base = reg_base & GUC_WOPCM_OFFSET_MASK;
> +	*guc_wopcm_size = reg_size & GUC_WOPCM_SIZE_MASK;
> +	return true;
> +}
> +
> +static int __wopcm_init_regs(struct xe_gt *gt, u32 base, u32 size)
> +{
> +	u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? HUC_LOADING_AGENT_GUC : 0;
> +	u32 mask;
> +	int err;
> +
> +	xe_gt_assert(gt, !(base & ~GUC_WOPCM_OFFSET_MASK));
> +	xe_gt_assert(gt, !(size & ~GUC_WOPCM_SIZE_MASK));
> +
> +	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
> +	err = xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mask,
> +					 size | GUC_WOPCM_SIZE_LOCKED);
> +	if (err)
> +		goto err_out;
> +
> +	mask = GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
> +	err = xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
> +					 base | huc_agent, mask,
> +					 base | huc_agent |
> +					 GUC_WOPCM_OFFSET_VALID);
> +	if (err)
> +		goto err_out;
> +
> +	xe_gt_dbg(gt, "Programmed GuC WOPCM [b=%uK, s=%uK]\n", base / SZ_1K, size / SZ_1K);
> +
> +	return 0;
> +
> +err_out:
> +	xe_gt_notice(gt, "Failed to init uC WOPCM registers to [b=%uK, s=%uK]!\n",
> +		     base / SZ_1K, size / SZ_1K);
> +	xe_gt_notice(gt, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
> +		     DMA_GUC_WOPCM_OFFSET.addr,
> +		     xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
> +	xe_gt_notice(gt, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
> +		     GUC_WOPCM_SIZE.addr,
> +		     xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
> +
> +	return err;
> +}
> +
> +static int uc_program_wopcm(struct xe_uc *uc)
> +{
> +	struct xe_gt *gt = uc_to_gt(uc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	u32 huc_fw_size = xe_uc_fw_get_upload_size(&gt->uc.huc.fw);
> +	u32 wopcm_size = xe_tile_wopcm_size(tile);
> +	u32 guc_wopcm_base;
> +	u32 guc_wopcm_size;
> +	bool locked;
> +
> +	if (!xe_uc_fw_is_supported(&gt->uc.guc.fw))
> +		return -ENODEV;
> +
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +
> +	locked = __wopcm_regs_locked(gt, &guc_wopcm_base, &guc_wopcm_size);
> +	if (locked) {
> +		/*
> +		 * We trust the programming to have been done correctly. If
> +		 * something is wrong we'll catch it at FW load time.
> +		 */
> +		xe_gt_dbg(gt, "GuC WOPCM is already locked [b=%uK, s=%uK]\n",
> +			  guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
> +		return 0;
> +	}
> +
> +	/*
> +	 * WOPCM partitioning on platforms with a media GT is more complex,
> +	 * because both GTs share the same WOPCM space. However, on all
> +	 * platforms with media GT we expect the registers to be preprogrammed
> +	 * by BIOS/IFWI, so we should never have to do the programming ourselves
> +	 * and can therefore skip the implementation.
> +	 */
> +	if (XE_WARN_ON(tile->media_gt)) {
> +		xe_gt_err(gt, "WOPCM not locked on platform with media GT\n");
> +		return -EIO;
> +	}
> +
> +	/*
> +	 * On legacy HW (pre-PVC) where the driver is responsible for
> +	 * programming the WOPCM registers, the WOPCM is divided into three
> +	 * regions, in order from bottom to top:
> +	 * 1 - The HuC region, which contains the HuC firmware + a 16KB reserved
> +	 *     section.
> +	 * 2 - The GuC region, which contains the GuC firmware + a reserved
> +	 *     section for GuC's usage.
> +	 * 3 - A reserved region for HW contexts, which is 36KB in size.
> +	 *
> +	 * To keep the math simple, we remove the HW context region from the
> +	 * WOPCM size, calculate the size of region 1 and then leave the
> +	 * remaining area for region 2. The official binaries are guaranteed to
> +	 * fit in the WOPCM, so the math below can only go wrong if a user is
> +	 * manipulating the blobs. In such a scenario, we'll catch the error at
> +	 * FW load time, so no need to double verify it here.
> +	 */
> +	wopcm_size -= (SZ_32K + SZ_4K);
> +
> +	guc_wopcm_base = huc_fw_size + SZ_16K;
> +	guc_wopcm_base = ALIGN(guc_wopcm_base, 1UL << GUC_WOPCM_OFFSET_SHIFT);
> +
> +	guc_wopcm_size = wopcm_size - guc_wopcm_base; /* already 4KB aligned */
> +
> +	return __wopcm_init_regs(gt, guc_wopcm_base, guc_wopcm_size);
> +}
> +
>  int xe_uc_init(struct xe_uc *uc)
>  {
>  	int ret;
> @@ -74,7 +198,7 @@ int xe_uc_init(struct xe_uc *uc)
>  		return 0;
>  
>  	if (!IS_SRIOV_VF(uc_to_xe(uc))) {
> -		ret = xe_wopcm_init(&uc->wopcm);
> +		ret = uc_program_wopcm(uc);
>  		if (ret)
>  			goto err;
>  	}
> @@ -191,6 +315,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	if (IS_SRIOV_VF(uc_to_xe(uc)))
>  		return vf_uc_load_hw(uc);
>  
> +	ret = uc_program_wopcm(uc);
> +	if (ret)
> +		return ret;
> +
>  	ret = xe_huc_upload(&uc->huc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
> index 1708379dc834..edb001718959 100644
> --- a/drivers/gpu/drm/xe/xe_uc_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
> @@ -9,7 +9,6 @@
>  #include "xe_gsc_types.h"
>  #include "xe_guc_types.h"
>  #include "xe_huc_types.h"
> -#include "xe_wopcm_types.h"
>  
>  /**
>   * struct xe_uc - Xe micro controllers
> @@ -21,8 +20,6 @@ struct xe_uc {
>  	struct xe_huc huc;
>  	/** @gsc: Graphics Security Controller */
>  	struct xe_gsc gsc;
> -	/** @wopcm: WOPCM */
> -	struct xe_wopcm wopcm;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> deleted file mode 100644
> index 7da1e3ebc839..000000000000
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ /dev/null
> @@ -1,287 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2022 Intel Corporation
> - */
> -
> -#include "xe_wopcm.h"
> -
> -#include <linux/error-injection.h>
> -
> -#include "regs/xe_guc_regs.h"
> -#include "xe_device.h"
> -#include "xe_force_wake.h"
> -#include "xe_gt_types.h"
> -#include "xe_mmio.h"
> -#include "xe_uc_fw.h"
> -
> -/**
> - * DOC: Write Once Protected Content Memory (WOPCM) Layout
> - *
> - * The layout of the WOPCM will be fixed after writing to GuC WOPCM size and
> - * offset registers whose values are calculated and determined by HuC/GuC
> - * firmware size and set of hardware requirements/restrictions as shown below:
> - *
> - * ::
> - *
> - *    +=========> +====================+ <== WOPCM Top
> - *    ^           |  HW contexts RSVD  |
> - *    |     +===> +====================+ <== GuC WOPCM Top
> - *    |     ^     |                    |
> - *    |     |     |                    |
> - *    |     |     |                    |
> - *    |    GuC    |                    |
> - *    |   WOPCM   |                    |
> - *    |    Size   +--------------------+
> - *  WOPCM   |     |    GuC FW RSVD     |
> - *    |     |     +--------------------+
> - *    |     |     |   GuC Stack RSVD   |
> - *    |     |     +------------------- +
> - *    |     v     |   GuC WOPCM RSVD   |
> - *    |     +===> +====================+ <== GuC WOPCM base
> - *    |           |     WOPCM RSVD     |
> - *    |           +------------------- + <== HuC Firmware Top
> - *    v           |      HuC FW        |
> - *    +=========> +====================+ <== WOPCM Base
> - *
> - * GuC accessible WOPCM starts at GuC WOPCM base and ends at GuC WOPCM top.
> - * The top part of the WOPCM is reserved for hardware contexts (e.g. RC6
> - * context).
> - */
> -
> -/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> -/* FIXME: Larger size require for some platforms, do a proper probe sooner or later */
> -#define DGFX_WOPCM_SIZE			SZ_4M
> -#define LNL_WOPCM_SIZE			SZ_8M
> -#define MTL_WOPCM_SIZE			SZ_4M
> -#define WOPCM_SIZE			SZ_2M
> -
> -/* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
> -#define WOPCM_RESERVED_SIZE		SZ_16K
> -
> -/* 16KB reserved at the beginning of GuC WOPCM. */
> -#define GUC_WOPCM_RESERVED		SZ_16K
> -/* 8KB from GUC_WOPCM_RESERVED is reserved for GuC stack. */
> -#define GUC_WOPCM_STACK_RESERVED	SZ_8K
> -
> -/* GuC WOPCM Offset value needs to be aligned to 16KB. */
> -#define GUC_WOPCM_OFFSET_ALIGNMENT	(1UL << GUC_WOPCM_OFFSET_SHIFT)
> -
> -/* 36KB WOPCM reserved at the end of WOPCM */
> -#define WOPCM_HW_CTX_RESERVED		(SZ_32K + SZ_4K)
> -
> -static inline struct xe_gt *wopcm_to_gt(struct xe_wopcm *wopcm)
> -{
> -	return container_of(wopcm, struct xe_gt, uc.wopcm);
> -}
> -
> -static inline struct xe_device *wopcm_to_xe(struct xe_wopcm *wopcm)
> -{
> -	return gt_to_xe(wopcm_to_gt(wopcm));
> -}
> -
> -static u32 context_reserved_size(void)
> -{
> -	return WOPCM_HW_CTX_RESERVED;
> -}
> -
> -static bool __check_layout(struct xe_device *xe, u32 wopcm_size,
> -			   u32 guc_wopcm_base, u32 guc_wopcm_size,
> -			   u32 guc_fw_size, u32 huc_fw_size)
> -{
> -	const u32 ctx_rsvd = context_reserved_size();
> -	u32 size;
> -
> -	size = wopcm_size - ctx_rsvd;
> -	if (unlikely(guc_wopcm_base >= size ||
> -		     guc_wopcm_size > size - guc_wopcm_base)) {
> -		drm_err(&xe->drm,
> -			"WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
> -			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K,
> -			size / SZ_1K);
> -		return false;
> -	}
> -
> -	size = guc_fw_size + GUC_WOPCM_RESERVED + GUC_WOPCM_STACK_RESERVED;
> -	if (unlikely(guc_wopcm_size < size)) {
> -		drm_err(&xe->drm, "WOPCM: no space for %s: %uK < %uK\n",
> -			xe_uc_fw_type_repr(XE_UC_FW_TYPE_GUC),
> -			guc_wopcm_size / SZ_1K, size / SZ_1K);
> -		return false;
> -	}
> -
> -	size = huc_fw_size + WOPCM_RESERVED_SIZE;
> -	if (unlikely(guc_wopcm_base < size)) {
> -		drm_err(&xe->drm, "WOPCM: no space for %s: %uK < %uK\n",
> -			xe_uc_fw_type_repr(XE_UC_FW_TYPE_HUC),
> -			guc_wopcm_base / SZ_1K, size / SZ_1K);
> -		return false;
> -	}
> -
> -	return true;
> -}
> -
> -static bool __wopcm_regs_locked(struct xe_gt *gt,
> -				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
> -{
> -	u32 reg_base = xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
> -	u32 reg_size = xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
> -
> -	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
> -	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
> -		return false;
> -
> -	*guc_wopcm_base = reg_base & GUC_WOPCM_OFFSET_MASK;
> -	*guc_wopcm_size = reg_size & GUC_WOPCM_SIZE_MASK;
> -	return true;
> -}
> -
> -static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
> -			     struct xe_wopcm *wopcm)
> -{
> -	u32 base = wopcm->guc.base;
> -	u32 size = wopcm->guc.size;
> -	u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? HUC_LOADING_AGENT_GUC : 0;
> -	u32 mask;
> -	int err;
> -
> -	XE_WARN_ON(!(base & GUC_WOPCM_OFFSET_MASK));
> -	XE_WARN_ON(base & ~GUC_WOPCM_OFFSET_MASK);
> -	XE_WARN_ON(!(size & GUC_WOPCM_SIZE_MASK));
> -	XE_WARN_ON(size & ~GUC_WOPCM_SIZE_MASK);
> -
> -	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
> -	err = xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mask,
> -					 size | GUC_WOPCM_SIZE_LOCKED);
> -	if (err)
> -		goto err_out;
> -
> -	mask = GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
> -	err = xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
> -					 base | huc_agent, mask,
> -					 base | huc_agent |
> -					 GUC_WOPCM_OFFSET_VALID);
> -	if (err)
> -		goto err_out;
> -
> -	return 0;
> -
> -err_out:
> -	drm_notice(&xe->drm, "Failed to init uC WOPCM registers!\n");
> -	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
> -		   DMA_GUC_WOPCM_OFFSET.addr,
> -		   xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
> -	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
> -		   GUC_WOPCM_SIZE.addr,
> -		   xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
> -
> -	return err;
> -}
> -
> -u32 xe_wopcm_size(struct xe_device *xe)
> -{
> -	if (xe->info.platform >= XE_LUNARLAKE)
> -		return LNL_WOPCM_SIZE;
> -	else if (IS_DGFX(xe))
> -		return DGFX_WOPCM_SIZE;
> -	else if (xe->info.platform == XE_METEORLAKE)
> -		return MTL_WOPCM_SIZE;
> -	else
> -		return WOPCM_SIZE;
> -}
> -
> -static u32 max_wopcm_size(struct xe_device *xe)
> -{
> -	if (xe->info.platform == XE_NOVALAKE_P)
> -		return SZ_16M;
> -	else
> -		return SZ_8M;
> -}
> -
> -/**
> - * xe_wopcm_init() - Initialize the WOPCM structure.
> - * @wopcm: pointer to xe_wopcm.
> - *
> - * This function will partition WOPCM space based on GuC and HuC firmware sizes
> - * and will allocate max remaining for use by GuC. This function will also
> - * enforce platform dependent hardware restrictions on GuC WOPCM offset and
> - * size. It will fail the WOPCM init if any of these checks fail, so that the
> - * following WOPCM registers setup and GuC firmware uploading would be aborted.
> - */
> -int xe_wopcm_init(struct xe_wopcm *wopcm)
> -{
> -	struct xe_device *xe = wopcm_to_xe(wopcm);
> -	struct xe_gt *gt = wopcm_to_gt(wopcm);
> -	u32 guc_fw_size = xe_uc_fw_get_upload_size(&gt->uc.guc.fw);
> -	u32 huc_fw_size = xe_uc_fw_get_upload_size(&gt->uc.huc.fw);
> -	u32 ctx_rsvd = context_reserved_size();
> -	u32 guc_wopcm_base;
> -	u32 guc_wopcm_size;
> -	bool locked;
> -	int ret = 0;
> -
> -	if (!guc_fw_size)
> -		return -EINVAL;
> -
> -	wopcm->size = xe_wopcm_size(xe);
> -	drm_dbg(&xe->drm, "WOPCM: %uK\n", wopcm->size / SZ_1K);
> -
> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> -	XE_WARN_ON(guc_fw_size >= wopcm->size);
> -	XE_WARN_ON(huc_fw_size >= wopcm->size);
> -	XE_WARN_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
> -
> -	locked = __wopcm_regs_locked(gt, &guc_wopcm_base, &guc_wopcm_size);
> -	if (locked) {
> -		drm_dbg(&xe->drm, "GuC WOPCM is already locked [%uK, %uK)\n",
> -			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
> -		/*
> -		 * When the GuC wopcm base and size are preprogrammed by
> -		 * BIOS/IFWI, check against the max allowed wopcm size to
> -		 * validate if the programmed values align to the wopcm layout.
> -		 *
> -		 * FIXME: This is giving the maximum overall WOPCM size and not
> -		 * the size relative to each GT.
> -		 */
> -		wopcm->size = max_wopcm_size(xe);
> -
> -		goto check;
> -	}
> -
> -	/*
> -	 * Aligned value of guc_wopcm_base will determine available WOPCM space
> -	 * for HuC firmware and mandatory reserved area.
> -	 */
> -	guc_wopcm_base = huc_fw_size + WOPCM_RESERVED_SIZE;
> -	guc_wopcm_base = ALIGN(guc_wopcm_base, GUC_WOPCM_OFFSET_ALIGNMENT);
> -
> -	/*
> -	 * Need to clamp guc_wopcm_base now to make sure the following math is
> -	 * correct. Formal check of whole WOPCM layout will be done below.
> -	 */
> -	guc_wopcm_base = min(guc_wopcm_base, wopcm->size - ctx_rsvd);
> -
> -	/* Aligned remainings of usable WOPCM space can be assigned to GuC. */
> -	guc_wopcm_size = wopcm->size - ctx_rsvd - guc_wopcm_base;
> -	guc_wopcm_size &= GUC_WOPCM_SIZE_MASK;
> -
> -	drm_dbg(&xe->drm, "Calculated GuC WOPCM [%uK, %uK)\n",
> -		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
> -
> -check:
> -	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
> -			   guc_fw_size, huc_fw_size)) {
> -		wopcm->guc.base = guc_wopcm_base;
> -		wopcm->guc.size = guc_wopcm_size;
> -		XE_WARN_ON(!wopcm->guc.base);
> -		XE_WARN_ON(!wopcm->guc.size);
> -	} else {
> -		drm_notice(&xe->drm, "Unsuccessful WOPCM partitioning\n");
> -		return -E2BIG;
> -	}
> -
> -	if (!locked)
> -		ret = __wopcm_init_regs(xe, gt, wopcm);
> -
> -	return ret;
> -}
> -ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO); /* See xe_pci_probe() */
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.h b/drivers/gpu/drm/xe/xe_wopcm.h
> deleted file mode 100644
> index 0197a282460b..000000000000
> --- a/drivers/gpu/drm/xe/xe_wopcm.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2022 Intel Corporation
> - */
> -
> -#ifndef _XE_WOPCM_H_
> -#define _XE_WOPCM_H_
> -
> -#include "xe_wopcm_types.h"
> -
> -struct xe_device;
> -
> -int xe_wopcm_init(struct xe_wopcm *wopcm);
> -u32 xe_wopcm_size(struct xe_device *xe);
> -
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_wopcm_types.h b/drivers/gpu/drm/xe/xe_wopcm_types.h
> deleted file mode 100644
> index 99d34837c408..000000000000
> --- a/drivers/gpu/drm/xe/xe_wopcm_types.h
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2022 Intel Corporation
> - */
> -
> -#ifndef _XE_WOPCM_TYPES_H_
> -#define _XE_WOPCM_TYPES_H_
> -
> -#include <linux/types.h>
> -
> -/**
> - * struct xe_wopcm - Overall WOPCM info and WOPCM regions.
> - */
> -struct xe_wopcm {
> -	/** @size: Size of overall WOPCM */
> -	u32 size;
> -	/** @guc: GuC WOPCM Region info */
> -	struct {
> -		/** @guc.base: GuC WOPCM base which is offset from WOPCM base */
> -		u32 base;
> -		/** @guc.size: Size of the GuC WOPCM region */
> -		u32 size;
> -	} guc;
> -};
> -
> -#endif
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
