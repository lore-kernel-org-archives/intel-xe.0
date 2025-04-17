Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526DBC369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 04:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CF610E07E;
	Thu, 17 Apr 2025 04:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9E20PoC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EC410E07E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 04:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744865436; x=1776401436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LAcFO96OWVo5Uq8LUrkFISnQ6ZRjZ8BBJijP+9q5uGA=;
 b=Z9E20PoCh4no68xPr5CuIlMp2cS2H8gSJlXJaSTjN5UQKKvJgJF+QPDX
 97xOP1oaf7rZPhP8C+s4jhhPeSAyIb+S2fte20G6tzJcebXzpTkgUcq7q
 yxvE+2t42SeHemY0vam/9iaGFt0PzVOWzxNP75QUyQKk8vOrWL6y0UANz
 OaQYHDKGl49aqZ3olBARUZ41d+C1C89oBN2ZGMPFq47UJCHaGuzs903Df
 Ozgqd6mOZj5J+8cCXgr5ORqMb6BeE6mnc+DUlqIs2Zq3REr5yUcDB+7y7
 HanfZlaMIDm78/Rm/xpD/HSaYL7K9ibmxp2wOlacQISXp3dHLG93XTxuj A==;
X-CSE-ConnectionGUID: IQ5VJZ+RQV2nAYzhOZNmuQ==
X-CSE-MsgGUID: /D0MnoXFSmCTgbN/HSyG0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46567317"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46567317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:50:35 -0700
X-CSE-ConnectionGUID: c9xELeMSQ1mmflJMD6lrgA==
X-CSE-MsgGUID: G9lX6wNVSSmHuXZAm1qe/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135544006"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:50:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 21:50:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 21:50:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 21:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnxGAOYrIKQoqnCEaKQmbyemYLfAfqw9eqVIJ8RBK+GSjfNj+cZzhOanWZ1jm2hf3CrMzH5VEiysi4PmR4vbsy0d171dicriTiEgtZdOogjbh4JSYE6doHTh8VpsboDSRTnRxKjUzju3M93BSCBhCXoXWCaq0LRPbzJEVC2unfWXuf9lAMdvJQxje4MsqrCNN4q5EOrBbjkvR44oDAC97e1K/gfhjKgk+VY9Px79uEt+srz7lSL6KVfwuL0krBO7Ya9xVCyIenHankX4t3JJv3wQTI2R4giyewAzoJnjyQU6sIIRdUD8LV5djFE+acTZFCFwVDGkvqKlwz6IZYoyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/CbIheVwP0dbvI7HFZcihSt5Xh3EIEvaFkovQ5/Ivc=;
 b=jiaVwZ6VeOk+oH28L8BQv5n111EBZQEfl51sJ0bQyX+ZHTg4kpTLQbkzbD5GLoaGO/W6s03Vg+G8KibGC98wWAMJYWWHT79t4XXj9ulC4g+og4qKzRKfaOeiv7Htiqc/wiRfxa2N+5sm9am3Es8LH6N/Dz9BZKcZOpbKJc53vdvK+G0rL4RBv0/TsmRQ1JBk3+UiOqB4ahwcRl2itSjHeVQ2cLQlBA7sS1CtQr89cOcAPtQsq7YOpTv7zPk9TlpHcO+LbNJQPty6TqPFz1X26gf3WfWH9hGGzIYSs6b4rxUSfnLhbzHNBp1tZxN0QRMPx9GdETyWFZOzFbuAh1Tsag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH7PR11MB5864.namprd11.prod.outlook.com (2603:10b6:510:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 04:50:19 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 04:50:18 +0000
Date: Wed, 16 Apr 2025 21:50:10 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <matthew.olson@intel.com>, <shubham.kumar@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v12 4/8] drm/xe/eustall: Add support to read() and poll()
 EU stall data
Message-ID: <aACIggiyMxYohAw8@intel.com>
References: <cover.1740533885.git.harish.chegondi@intel.com>
 <369dee85a3b6bd2c08aeae89ca55e66a9a0242d2.1740533885.git.harish.chegondi@intel.com>
 <5b4ca4af-71e9-43c4-aa82-8ec4a0c8edb7@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5b4ca4af-71e9-43c4-aa82-8ec4a0c8edb7@intel.com>
X-ClientProxiedBy: MW4PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:303:85::8) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH7PR11MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: c99b92bf-7197-479e-1c87-08dd7d6b5a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXovU3FxUy9IekF3djgvdFAwNUdpT1kvdnIxSjMvNXl3OVFFeURGS0VCQU9X?=
 =?utf-8?B?Z0VhejgrZlR6dnBWR2RuWXhJSDliWnhZa1B2YUl3amtVc21rZDc4eTNUbUdv?=
 =?utf-8?B?T2IzekdYemhJY29XYzF2OStvaklKSUFVL3ZScFR0U01qYlRtRnRDT1h3UzVS?=
 =?utf-8?B?MFhqbWxoVmxDanVQMDB6eHhUaWVRWThDWndtRER1VHJzRzdBTzQ4Z0t4YmVM?=
 =?utf-8?B?c25PQjlLVHJuMnorZzJGb2ZpRHByc1A5WmtEa1VJMTcrQ0p6N0VJNUJTdHRt?=
 =?utf-8?B?RUcrbHh0WGMzUUpkbWxPUjgvaXZKMC9Ta1dVRXFpUy9ZR3BsV0hWNFRSM2Qy?=
 =?utf-8?B?Q0QzRHFHTXBqbFNQdGhGZldVTHJmUUpWQS80R3k5UTlidlBtTlZxVTE0QlVt?=
 =?utf-8?B?clJDWW9HemxCZUIxeXd6OGVRNEswRWtnRXR2VVlqQm1CNUJTOTZiTnc1VWIy?=
 =?utf-8?B?eVg4VTB2Qy9FOStVTjhYeE94ekxMT082NTA1Q0JQMTBpd1NIWmVmaXBvb3I0?=
 =?utf-8?B?djM0U05vMUJxVTFVZjlzeDIzd0NSKzNCc2grc2lTRjU1Y2w5cmRRd3RJYVNl?=
 =?utf-8?B?SFdtNjVidzFIWjM0NENKZUFqa2J6eVhjbVlVSkl0NHM5SWx4bjJHOE1oeTk3?=
 =?utf-8?B?bzloWW1ZZTZWVXJEMmtuTTdDaWVwRnpoUVJ4ZTBlc0lTc29HT0E2bkdGUldU?=
 =?utf-8?B?dTZ2VUpzWjFBTHNNUTcxT3d6UXlmaWJTSERiNWh5WFN2OWRxWERzcmVCeW83?=
 =?utf-8?B?NWpyY215NVJWQ1ozYWlpN2l0R2I4M20wd1RtWWUrM3NScHc1WEdsOVcxQzdq?=
 =?utf-8?B?WWpaazNqKzkrM3FXNmdnelEyRmdXa2ZZYTlWOFV6c2lTaFQxRjdSYUtVT3l0?=
 =?utf-8?B?MnlVelBnRVg5Z3lnQlpBZUNUWG1uM0JNQlVPalVMcGVRaDNCTzVTQ0ZjZHJD?=
 =?utf-8?B?MDBpejQ3aU13MG9CQkJzRjd2dFd2L0t0Y1hMMkdNcGl5eTF4ZE96YXk5RXVS?=
 =?utf-8?B?b0dGZkFIanlYTkFuajhpSktaS0hMeGs2UVAwaHJSeUlid08vU1ZWTERMRHJw?=
 =?utf-8?B?LytGR1liMVBUWEtYRnhCNUZDTWZ5OU9NSlE2ZVg5SlRnUHZjNDRTN1JaUjV0?=
 =?utf-8?B?V2VuVDJoZHljbVI5MEtINzJlSmhvWTc0eGdUeVJaTmw2NnlScXhNbWw2OG9H?=
 =?utf-8?B?Q0h6aWZ4OU0wbE9ZVWlBUy9jRVRqL285WFlKTWVVVkhWa01YdE50WllKUTJE?=
 =?utf-8?B?Zk1KS0c3aVBJdGtac0F2UzI4Z2wydm9Ca3JYRWZoYzQyTFBaTjR1KzRYMzBL?=
 =?utf-8?B?aEIvOHFSQy9GQytCdWZDb2x2QlgvMWZBelU0R21ieTNLV0NKYUpkQWlCbXY1?=
 =?utf-8?B?S2FUUlViVDlOMmVsNTlGY2J6czh3ZEo1MkRGV0padTV6RnVEV1c1WkdhR1kx?=
 =?utf-8?B?TWhiaW16dFdXRzVhLzdxZkNXczdOYWJxUEtzQVluS2RtcExPMVJPQ0F5RHhR?=
 =?utf-8?B?bkxZdkRGcEpVWnE3QnhpWTAvbGdNVGM0N0k2VVNTZFBpQVFpK29hU3Bxa3FS?=
 =?utf-8?B?Vk14bEpreCtZdENvTVo0RElNTVVtWWMvSUhqUWczV20vSjJBRGNJUUh3bjRu?=
 =?utf-8?B?Tkl2Uko2UmhqcXprUUdMZ0FpYTVYT1J2VFNjRjZNeWNOVUcxMFhNTjVmM0Yv?=
 =?utf-8?B?RFRqTm85TnJRNU5GaG9hSGdhdWdzZzRsR2J0K0R3a1pnSnBCNzQyM2g3cFpC?=
 =?utf-8?B?ZGQ2Y2NFd09vSFU0V3NSMXpqeTgyS0tlN04wOVdjODJpY2hxcFNhQVQzM2xV?=
 =?utf-8?Q?VLmnUAPUD4kBBiQ0FEaEBTEFTA0yACqXsioX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjUwTFNYdWV1dWJRRGNPakJidXkvQmtaNTgxaS9jcFBKVWJPenpPVUgwaTZz?=
 =?utf-8?B?OTROOXdlcnBEL3pWaXZpZDVudm4zWGZmS0pDaE0yRUdyVEZqbm5adTVocmlD?=
 =?utf-8?B?bXpNRDlMVTMxNVp0eTRDdFl4Q2s1KzBqNHdrVktZL0htY3drS2xjSVpWTjdv?=
 =?utf-8?B?bkU1bW0xVmhtQ0ZCSFM5S0l3dXZFek5VUW0zS1ZjK0o5d0FtdUZ4SkRZTFBH?=
 =?utf-8?B?Q1lLbDhOYmJGRHRHRHdieXR4bHBvazd5UmpoWlY1OHRNV0E4ME1zNVF1d3NM?=
 =?utf-8?B?VklpSjEvd0NwNnp3cDlMdE45N3ZadG1ibEUwZzU1MTZ4YXNyVmFaNTlzMDhP?=
 =?utf-8?B?VW44bmpVYldXekJWM2NBM1V0MTF3eFBIZWFWeUpXaE5YQzJWbWZ4VmNVczI3?=
 =?utf-8?B?QWIxRGcyVnhYZVBkTlhOQXgyRk5lZUVINXIzTDQzUzRRSzdFY3RTdUxPSzdo?=
 =?utf-8?B?UnMwOXhoT0xBTmlmaURtY2l0K2xCZldZWEpnR3A0VzYxei82VnN6U1pGL29j?=
 =?utf-8?B?cDF3S3k0ZVRIZ2NhUXZJR2taMWZvMWlPaDYra1dHRTVHMGZlVWN4b2M4c3ZW?=
 =?utf-8?B?TDhXQkJvcHVRalVTRmhhcEJtbU5kbEVoU2F2V0wxeFNHb0MxR1NaZ0NPNEdL?=
 =?utf-8?B?OWdMd1ZaTkJibkx5ZGZCWnp3K1RBL2I2OUJJeExkQ3lUWmFVaU9JbjNjUTVX?=
 =?utf-8?B?VDVLcXB2WVRnZDhRbk9WVm1yd04yWi90eVA5Q2dyVEpDN1VTVGxhVjNla3dn?=
 =?utf-8?B?Q0c2ZmJRSHdpakhJZVMvbXQ4ajdiRjArTGNlTXpZRlNlaEVIVU1leVVXYzVr?=
 =?utf-8?B?L1E4UlBBM2VVcGYvd0J0ZlYxN2IvWFVvV2d1REdER1FaM0xnTm5hbm1jWkNs?=
 =?utf-8?B?UEtJR1hkVFBPTFJCYzZ0RHJMUjhWbWZBc252alEyMW1JQWYzb1F1ZlNNUFdD?=
 =?utf-8?B?S2szN3FsOHdtTStPZzlUNlZiZDBhZ0xOYUZ3VDhvWGk0aUNzUStJZGpoMkVG?=
 =?utf-8?B?bWdYa1BTV21lUXBmc2dDVU5VQ3lOOEdKTDgremF5SzNjMUhraVNLSCtCTE9v?=
 =?utf-8?B?ZU1EN3NTNHdTNWdUblJ4aHRrdE5PdDlkTzk4MkxLV1lTWVIraExDeTM2QThH?=
 =?utf-8?B?eWdXOGsvQjAwTkdQaXFuL3VUVkZxVzBOQk1lYUQ4cVRoUmRtUnJNNUNUTFZF?=
 =?utf-8?B?bjNPd3FiSzBOUWVvZC9rYVBJRk1DaksyM3ZabC9wOWRQWWxadTdOZTQvVG5O?=
 =?utf-8?B?cTNDNDJZZTVnRXI5UXZ6TmplOTcwVDFCQXduR2ljcnY3R00xS2lZSkdzM1dQ?=
 =?utf-8?B?VXFsZFZhTXdraEdYVTVmaWlIM1JIcnFkMnpYblRsV3g4Y2pLdDdRb0dkVi9w?=
 =?utf-8?B?YkhBUkRLNXp4amtZS0ljSmhHbjY0MHhGK1BTM2NHNHNGb3Mzam9wYmhzTjg0?=
 =?utf-8?B?SU1EaTlMaktIMTh4OFlvN0JQTlNWVUI1U0pTUjlLSHNkeWZYSDJ6azZLV2FN?=
 =?utf-8?B?NHUwZTFaR3pra2gweEtZRWhMWW1oSU9ldXZyYTBrWjNkd1VKZzY2MlFkYUNq?=
 =?utf-8?B?VEg3NGlpb3h6SXNUdGlTR0xENk9yeVNWUitjeU1IdVpSYlh0cFI3VlA0YXBp?=
 =?utf-8?B?T1VPSS9uSzJLNW9BbnBURVFwM0tOS3NCUE5reDdJTXRKNnQ0dzF4Wm5tdUdq?=
 =?utf-8?B?MFhaVXoyOHU5b3VZakpzZ0JTZVpQcDd2UHFlL0pkcCszam40cGEvTTVkZHU3?=
 =?utf-8?B?SUVwZHh0R2VBTmx3d2ZMZGFDT21UQVBGTzAwZlYwZG5wY1JOakZ0LytoOFBH?=
 =?utf-8?B?c3pWa0QrQUJOZVRGYVBlQVFZbm9Uc0l5d3AxM05oaHdBQnExL1dFdFhockM1?=
 =?utf-8?B?bHNwV3AzbnZlTm8yZko1L0pRQ21CTlMxbm9aWnFCNnBwSGJEd3BKVGlrdmJy?=
 =?utf-8?B?M3ZtUWhvenM5WmFOdXh3TllCcUVHOENHRHhzZHJIeHE1WDRucWszVGQrdmJV?=
 =?utf-8?B?dXk3SHdOcFhsMHhlSndqUUR6V3ZrT29Ob0lLZzN2NnVIdnM4ZTZKd3F3c2cv?=
 =?utf-8?B?S0VNaDJZSVBpRFkrQmNkYWpZVDkrekhVN29FZzZhQnpuRHUwRFE2c2dQNVg4?=
 =?utf-8?B?bGpHMnJxeFNsTHFJTkk3czZmelRMZUtPR1hXWDd5YXQ1WVJpTXNxdExpcStH?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c99b92bf-7197-479e-1c87-08dd7d6b5a2c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 04:50:18.7242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJK/1BNQQ17fGMOFKRa7uPorf89lVw3JXfS+NGfZeBseczVJDPCnnwj/P1b891JSxO7+s550xM7/DzI09jndjXFQeMNF4HffGAqytQiXBRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5864
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

On Wed, Apr 16, 2025 at 10:22:36AM +0100, Matthew Auld wrote:
> On 26/02/2025 01:47, Harish Chegondi wrote:
> > Implement the EU stall sampling APIs to read() and poll() EU stall data.
> > A work function periodically polls the EU stall data buffer write pointer
> > registers to look for any new data and caches the write pointer. The read
> > function compares the cached read and write pointers and copies any new
> > data to the user space.
> > 
> > v11: Used gt->eu_stall->stream_lock instead of stream->buf_lock.
> >       Removed read and write offsets from trace and added read size.
> >       Moved workqueue from struct xe_eu_stall_data_stream to
> >       struct xe_eu_stall_gt.
> > v10: Used cancel_delayed_work_sync() instead of flush_delayed_work()
> >       Replaced per xecore lock with a lock for all the xecore buffers
> >       Code movement and optimizations as per review feedback
> > v9:  New patch split from the previous patch.
> >       Used *_delayed_work functions instead of hrtimer
> >       Addressed the review feedback in read and poll functions
> > 
> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_eu_stall.c | 267 ++++++++++++++++++++++++++++++-
> >   drivers/gpu/drm/xe/xe_trace.h    |  30 ++++
> >   2 files changed, 294 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index 2e7d00f8ff40..e82a6ebfe979 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -21,10 +21,13 @@
> >   #include "xe_macros.h"
> >   #include "xe_observation.h"
> >   #include "xe_pm.h"
> > +#include "xe_trace.h"
> >   #include "regs/xe_eu_stall_regs.h"
> >   #include "regs/xe_gt_regs.h"
> > +#define POLL_PERIOD_MS	5
> > +
> >   static size_t per_xecore_buf_size = SZ_512K;
> >   struct per_xecore_buf {
> > @@ -37,15 +40,18 @@ struct per_xecore_buf {
> >   };
> >   struct xe_eu_stall_data_stream {
> > +	bool pollin;
> >   	bool enabled;
> >   	int wait_num_reports;
> >   	int sampling_rate_mult;
> > +	wait_queue_head_t poll_wq;
> >   	size_t data_record_size;
> >   	size_t per_xecore_buf_size;
> >   	struct xe_gt *gt;
> >   	struct xe_bo *bo;
> >   	struct per_xecore_buf *xecore_buf;
> > +	struct delayed_work buf_poll_work;
> >   };
> >   struct xe_eu_stall_gt {
> > @@ -53,6 +59,8 @@ struct xe_eu_stall_gt {
> >   	struct mutex stream_lock;
> >   	/* EU stall data stream */
> >   	struct xe_eu_stall_data_stream *stream;
> > +	/* Workqueue to schedule buffer pointers polling work */
> > +	struct workqueue_struct *buf_ptr_poll_wq;
> >   };
> >   /**
> > @@ -114,6 +122,7 @@ static void xe_eu_stall_fini(void *arg)
> >   {
> >   	struct xe_gt *gt = arg;
> > +	destroy_workqueue(gt->eu_stall->buf_ptr_poll_wq);
> >   	mutex_destroy(&gt->eu_stall->stream_lock);
> >   	kfree(gt->eu_stall);
> >   }
> > @@ -139,11 +148,19 @@ int xe_eu_stall_init(struct xe_gt *gt)
> >   	mutex_init(&gt->eu_stall->stream_lock);
> > +	gt->eu_stall->buf_ptr_poll_wq = alloc_ordered_workqueue("xe_eu_stall", 0);
> > +	if (!gt->eu_stall->buf_ptr_poll_wq) {
> > +		ret = -ENOMEM;
> > +		goto exit_free;
> > +	}
> > +
> >   	ret = devm_add_action_or_reset(xe->drm.dev, xe_eu_stall_fini, gt);
> >   	if (ret)
> > -		goto exit_free;
> > +		goto exit_destroy;
> >   	return 0;
> > +exit_destroy:
> > +	destroy_workqueue(gt->eu_stall->buf_ptr_poll_wq);
> >   exit_free:
> >   	mutex_destroy(&gt->eu_stall->stream_lock);
> >   	kfree(gt->eu_stall);
> > @@ -248,6 +265,172 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> >   	return 0;
> >   }
> > +/**
> > + * buf_data_size - Calculate the number of bytes in a circular buffer
> > + *		   given the read and write pointers and the size of
> > + *		   the buffer.
> > + *
> > + * @buf_size: Size of the circular buffer
> > + * @read_ptr: Read pointer with an additional overflow bit
> > + * @write_ptr: Write pointer with an additional overflow bit
> > + *
> > + * Since the read and write pointers have an additional overflow bit,
> > + * this function calculates the offsets from the pointers and use the
> > + * offsets to calculate the data size in the buffer.
> > + *
> > + * Returns: number of bytes of data in the buffer
> > + */
> > +static u32 buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
> > +{
> > +	u32 read_offset, write_offset, size = 0;
> > +
> > +	if (read_ptr == write_ptr)
> > +		goto exit;
> > +
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +
> > +	if (write_offset > read_offset)
> > +		size = write_offset - read_offset;
> > +	else
> > +		size = buf_size - read_offset + write_offset;
> > +exit:
> > +	return size;
> > +}
> > +
> > +/**
> > + * eu_stall_data_buf_poll - Poll for EU stall data in the buffer.
> > + *
> > + * @stream: xe EU stall data stream instance
> > + *
> > + * Returns: true if the EU stall buffer contains minimum stall data as
> > + *	    specified by the event report count, else false.
> > + */
> > +static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
> > +	u32 buf_size = stream->per_xecore_buf_size;
> > +	struct per_xecore_buf *xecore_buf;
> > +	struct xe_gt *gt = stream->gt;
> > +	bool min_data_present = false;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> > +
> > +	mutex_lock(&gt->eu_stall->stream_lock);
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		xecore_buf = &stream->xecore_buf[xecore];
> > +		read_ptr = xecore_buf->read;
> > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						       group, instance);
> > +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> > +		write_ptr <<= 6;
> > +		write_ptr &= ((buf_size << 1) - 1);
> > +		if (!min_data_present) {
> > +			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
> > +			if (num_data_rows(total_data) >= stream->wait_num_reports)
> > +				min_data_present = true;
> > +		}
> > +		xecore_buf->write = write_ptr;
> > +	}
> > +	mutex_unlock(&gt->eu_stall->stream_lock);
> > +
> > +	return min_data_present;
> > +}
> > +
> > +static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
> > +				     char __user *buf, size_t count,
> > +				     size_t *total_data_size, struct xe_gt *gt,
> > +				     u16 group, u16 instance, unsigned int xecore)
> > +{
> > +	size_t read_data_size, copy_size, buf_size;
> > +	u32 read_ptr_reg, read_ptr, write_ptr;
> > +	u8 *xecore_start_vaddr, *read_vaddr;
> > +	struct per_xecore_buf *xecore_buf;
> > +	u32 read_offset, write_offset;
> > +
> > +	/* Hardware increments the read and write pointers such that they can
> > +	 * overflow into one additional bit. For example, a 256KB size buffer
> > +	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
> > +	 * write pointers. This technique avoids wasting a slot in the buffer.
> > +	 * Read and write offsets are calculated from the pointers in order to
> > +	 * check if the write pointer has wrapped around the array.
> > +	 */
> > +	xecore_buf = &stream->xecore_buf[xecore];
> > +	xecore_start_vaddr = xecore_buf->vaddr;
> > +	read_ptr = xecore_buf->read;
> > +	write_ptr = xecore_buf->write;
> > +	buf_size = stream->per_xecore_buf_size;
> > +
> > +	read_data_size = buf_data_size(buf_size, read_ptr, write_ptr);
> > +	/* Read only the data that the user space buffer can accommodate */
> > +	read_data_size = min_t(size_t, count - *total_data_size, read_data_size);
> > +	if (read_data_size == 0)
> > +		return 0;
> > +
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +	read_vaddr = xecore_start_vaddr + read_offset;
> > +
> > +	if (write_offset > read_offset) {
> > +		if (copy_to_user(buf + *total_data_size, read_vaddr, read_data_size))
> > +			return -EFAULT;
> > +	} else {
> > +		if (read_data_size >= buf_size - read_offset)
> > +			copy_size = buf_size - read_offset;
> > +		else
> > +			copy_size = read_data_size;
> > +		if (copy_to_user(buf + *total_data_size, read_vaddr, copy_size))
> > +			return -EFAULT;
> > +		if (copy_to_user(buf + *total_data_size + copy_size,
> > +				 xecore_start_vaddr, read_data_size - copy_size))
> > +			return -EFAULT;
> > +	}
> > +
> > +	*total_data_size += read_data_size;
> > +	read_ptr += read_data_size;
> > +
> > +	/* Read pointer can overflow into one additional bit */
> > +	read_ptr &= (buf_size << 1) - 1;
> > +	read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, (read_ptr >> 6));
> > +	read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> > +	xecore_buf->read = read_ptr;
> > +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> > +				    read_data_size, *total_data_size);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_read_locked - copy EU stall counters data from the
> > + *				    per xecore buffers to the userspace buffer
> > + * @stream: A stream opened for EU stall count metrics
> > + * @file: An xe EU stall data stream file
> > + * @buf: destination buffer given by userspace
> > + * @count: the number of bytes userspace wants to read
> > + *
> > + * Returns: Number of bytes copied or a negative error code
> > + * If we've successfully copied any data then reporting that takes
> > + * precedence over any internal error status, so the data isn't lost.
> > + */
> > +static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> > +					      struct file *file, char __user *buf,
> > +					      size_t count)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	size_t total_size = 0;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> > +	int ret = 0;
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> > +						gt, group, instance, xecore);
> > +		if (ret || count == total_size)
> > +			break;
> > +	}
> > +	return total_size ?: (ret ?: -EAGAIN);
> > +}
> > +
> >   /*
> >    * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
> >    * before calling read().
> > @@ -255,7 +438,41 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> >   static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >   				       size_t count, loff_t *ppos)
> >   {
> > -	ssize_t ret = 0;
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	ssize_t ret, aligned_count;
> > +
> > +	aligned_count = ALIGN_DOWN(count, stream->data_record_size);
> > +	if (aligned_count == 0)
> > +		return -EINVAL;
> > +
> > +	if (!stream->enabled) {
> > +		xe_gt_dbg(gt, "EU stall data stream not enabled to read\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!(file->f_flags & O_NONBLOCK)) {
> > +		do {
> > +			ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
> > +			if (ret)
> > +				return -EINTR;
> > +
> > +			mutex_lock(&gt->eu_stall->stream_lock);
> > +			ret = xe_eu_stall_stream_read_locked(stream, file, buf, aligned_count);
> > +			mutex_unlock(&gt->eu_stall->stream_lock);
> > +		} while (ret == -EAGAIN);
> > +	} else {
> > +		mutex_lock(&gt->eu_stall->stream_lock);
> > +		ret = xe_eu_stall_stream_read_locked(stream, file, buf, aligned_count);
> > +		mutex_unlock(&gt->eu_stall->stream_lock);
> > +	}
> > +
> > +	/*
> > +	 * This may not work correctly if the user buffer is very small.
> > +	 * We don't want to block the next read() when there is data in the buffer
> > +	 * now, but couldn't be accommodated in the small user buffer.
> > +	 */
> > +	stream->pollin = false;
> >   	return ret;
> >   }
> > @@ -348,6 +565,21 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >   	return 0;
> >   }
> > +static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> > +{
> > +	struct xe_eu_stall_data_stream *stream =
> > +		container_of(work, typeof(*stream), buf_poll_work.work);
> > +	struct xe_gt *gt = stream->gt;
> > +
> > +	if (eu_stall_data_buf_poll(stream)) {
> > +		stream->pollin = true;
> > +		wake_up(&stream->poll_wq);
> > +	}
> > +	queue_delayed_work(gt->eu_stall->buf_ptr_poll_wq,
> > +			   &stream->buf_poll_work,
> > +			   msecs_to_jiffies(POLL_PERIOD_MS));
> > +}
> > +
> >   static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >   				   struct eu_stall_open_properties *props)
> >   {
> > @@ -372,6 +604,9 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >   			  max_wait_num_reports);
> >   		return -EINVAL;
> >   	}
> > +
> > +	init_waitqueue_head(&stream->poll_wq);
> > +	INIT_DELAYED_WORK(&stream->buf_poll_work, eu_stall_data_buf_poll_work_fn);
> >   	stream->per_xecore_buf_size = per_xecore_buf_size;
> >   	stream->sampling_rate_mult = props->sampling_rate_mult;
> >   	stream->wait_num_reports = props->wait_num_reports;
> > @@ -389,15 +624,35 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >   	return 0;
> >   }
> > +static __poll_t xe_eu_stall_stream_poll_locked(struct xe_eu_stall_data_stream *stream,
> > +					       struct file *file, poll_table *wait)
> > +{
> > +	__poll_t events = 0;
> > +
> > +	poll_wait(file, &stream->poll_wq, wait);
> > +
> > +	if (stream->pollin)
> > +		events |= EPOLLIN;
> > +
> > +	return events;
> > +}
> > +
> >   static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> >   {
> > -	__poll_t ret = 0;
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	__poll_t ret;
> > +
> > +	mutex_lock(&gt->eu_stall->stream_lock);
> > +	ret = xe_eu_stall_stream_poll_locked(stream, file, wait);
> > +	mutex_unlock(&gt->eu_stall->stream_lock);
> >   	return ret;
> >   }
> >   static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> >   {
> > +	struct xe_gt *gt = stream->gt;
> >   	int ret = 0;
> >   	if (stream->enabled)
> > @@ -406,6 +661,10 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> >   	stream->enabled = true;
Adding a delay here is helping me to consistently reproduce the
deadlock. This is just for testing the fix.
> >   	ret = xe_eu_stall_stream_enable(stream);
> > +
> > +	queue_delayed_work(gt->eu_stall->buf_ptr_poll_wq,
> > +			   &stream->buf_poll_work,
> > +			   msecs_to_jiffies(POLL_PERIOD_MS));
> >   	return ret;
> >   }
> > @@ -420,6 +679,8 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> >   	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, 0);
> > +	cancel_delayed_work_sync(&stream->buf_poll_work);
> > +
> 
> There looks to be a possible deadlock here:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4598
> 
> Can you please take a look?
I am working on a fix for this issue. I have seen this deadlock warning
only once in my testing so far. In order to consistently create the
deadlock, I had to add delay in xe_eu_stall_enable_locked for testing.
I will send out the patch soon.

Thank You
Harish.

> 
> >   	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
> >   	xe_pm_runtime_put(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index d5281de04d54..b4a3577df70c 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -427,6 +427,36 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
> >   	     TP_ARGS(xe, caller)
> >   );
> > +TRACE_EVENT(xe_eu_stall_data_read,
> > +	    TP_PROTO(u8 slice, u8 subslice,
> > +		     u32 read_ptr, u32 write_ptr,
> > +		     size_t read_size, size_t total_size),
> > +	    TP_ARGS(slice, subslice,
> > +		    read_ptr, write_ptr,
> > +		    read_size, total_size),
> > +
> > +	    TP_STRUCT__entry(__field(u8, slice)
> > +			     __field(u8, subslice)
> > +			     __field(u32, read_ptr)
> > +			     __field(u32, write_ptr)
> > +			     __field(size_t, read_size)
> > +			     __field(size_t, total_size)
> > +			     ),
> > +
> > +	    TP_fast_assign(__entry->slice = slice;
> > +			   __entry->subslice = subslice;
> > +			   __entry->read_ptr = read_ptr;
> > +			   __entry->write_ptr = write_ptr;
> > +			   __entry->read_size = read_size;
> > +			   __entry->total_size = total_size;
> > +			   ),
> > +
> > +	    TP_printk("slice: %u subslice: %u read ptr: 0x%x write ptr: 0x%x read size: %zu total read size: %zu",
> > +		      __entry->slice, __entry->subslice,
> > +		      __entry->read_ptr, __entry->write_ptr,
> > +		      __entry->read_size, __entry->total_size)
> > +);
> > +
> >   #endif
> >   /* This part must be outside protection */
> 
