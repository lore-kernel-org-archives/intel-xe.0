Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6469C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 08:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEF610E2D9;
	Mon, 16 Jun 2025 08:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZnFH8rv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37310E2D9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750063036; x=1781599036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oPYKf/qMc83nSqdLZtQkwrZKr0kIX/MwaeCAQxJ4Wnc=;
 b=eZnFH8rveqqB2BnycOehkl0o0SJ4auMsN39NS7c5WcQRg6b0t67c81R1
 GyNyfbgVfLXfChQus3lbdXLIGtF9qB8tpX/ejVI74k1O7n7174sQvkk7g
 /ZTiPECkS6XGAvxrbZHoXi8vdev1L5UvbrhumCmWgsSvNHsWwK/d4/2Sx
 /TueEFNN4wdDlU8TWKvpd61wGm5UBefuQMEISFcNo1WiomqMDFFuL9YuB
 BAqLtTYb1+FYF1gAQdyVQIF5QtDQbvjTfX2Yb+qB8vEiiDJUiqAFcW8Zx
 4/11VjBDJtQ2vUkx4mzPyeG7+IbgYov4L+gV7QLzrVXsMkL4hq6A/9DWj A==;
X-CSE-ConnectionGUID: ktYzAUSkQ9KxmMkdvO9eDQ==
X-CSE-MsgGUID: dsvei7wMRt+5fp5T3qdRiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63612875"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="63612875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:37:13 -0700
X-CSE-ConnectionGUID: ecZf1TjNSDCt1AuZaN/xkQ==
X-CSE-MsgGUID: RWhvIiWsRfWZQjSu7v+JAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148255317"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:37:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:37:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 01:37:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:37:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5B1ayuPRye2r7yOzy5YrsqkI8LwW/AlQPpUc01Tke5r5law+AYo8iXsE0jcOz0F6IRoCgZlIHyrwcKeNgMt+MSiWE87yDePr5gFqI5wwVwfh+42gadnLc68Rd50snAmRqCql7aJCpqT5tiH6tdhlUkFvDBRlAj49lbSjqauA7fB5+gEGC9m1TNxyASULKdPk8Qf3R4BhYwfVszBiRDu59sAKlgFhrZgvLVl6HKHqornLDmaAjp0Svcz/FxvaaK7MpQZU5UPsjEjtgyPgO6gxMCqWbfWpwmkioWuPR10FvGtzG6AaOXFnfLgpmSSGTuNtsUZTVmPkyiefgyaHtjzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlBE4H15WD7R2pa8osL5dtJiF64xSyWrUNPWl9H5j8U=;
 b=O0Vml3qq44mqFYu6nUViICHzb7h3/q+pKfkGhjMXxZvoR86910Kmg6Eoei08UMFnbDM9UYILLMmkDRgUvc4sQWhroNVUYpyL7SNrLxjNGQkthvllZf/zOVYrn6I5sGxYmxPRIxpDTCWvwsIoefP54+2fmEj/CfS+uO8TNWRG8v2qhYMHxmq2wemT25MMt+O29N4Vm7FrWJhMsJ8/F2UilKmRSrFdfpwzk7W03BnERmStzRXV4nVe17Zbg0MowQO1Ez4xPvwjp4Vs17i5HUdatGLPkJIezYYfWK9P0HF0fRA+zfI9X6VbUofetW6bxdqfnK4zeYHxPEVIzvEu9znkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20)
 by MN0PR11MB5985.namprd11.prod.outlook.com (2603:10b6:208:370::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 08:36:32 +0000
Received: from SN7PR11MB6970.namprd11.prod.outlook.com
 ([fe80::b1b4:c000:90be:abea]) by SN7PR11MB6970.namprd11.prod.outlook.com
 ([fe80::b1b4:c000:90be:abea%4]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 08:36:31 +0000
Date: Mon, 16 Jun 2025 14:06:25 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 2/9] drm/xe/xe3: Add support for graphics IP version
 30.03
Message-ID: <aE_Xif_MDeo_8s1A@bvivekan-mob1>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
 <20250613193146.3549862-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250613193146.3549862-3-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To SN7PR11MB6970.namprd11.prod.outlook.com
 (2603:10b6:806:2aa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6970:EE_|MN0PR11MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 331d0f5c-95d1-41e7-2110-08ddacb0e548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHJnK2E2NFRFZG8zYjBBZXBVRStUWXpJVWZkRHBVa2VGdDlwV2c2R2tjSjZi?=
 =?utf-8?B?cjc2OXc3cXY0cWcwd0UxRFBaZ204bUZKcUJsYWp4Z2hSQU5VTHZzU284RFJP?=
 =?utf-8?B?MGpSRFYzcHhKWlJFd0NOSElWcHlEeE5jOHNnRXUrNHVLU3BGajFna0FTcHgz?=
 =?utf-8?B?dzBEeHdKTEg1N012ZHowSTVyd3JURFpraXd0RVM4cmQycHVuUmRCeHJWREY1?=
 =?utf-8?B?NjlyemlhcjZ1bFBhOVZpV0JQTndsSFZLQ0JOcHJqTE45Q0FXU0tKZlFWdE1j?=
 =?utf-8?B?Y2xjdDV0RTVDNm05UDhaOUJmaFdCVGEzVXlscDhNY0kwUnlYenFFWlZyRmRR?=
 =?utf-8?B?SXVQMGlGUDEwQ2c3WHlWR01lMDlqZ0pFWXJqNHdxU0s1LzZoZmdVbDV4cEpl?=
 =?utf-8?B?a2ZkN3EzTVVGbmM0MU9lbXh6d2IxK2J0VTFWNThabzhJVzI3ejVtSVZFRlBu?=
 =?utf-8?B?SC82TGdMbzNyTkhxZFJ5Q3FCWU1KWUtJYkx5MEdPWFU2T1o3d0kzNi9tTktz?=
 =?utf-8?B?M3A4MExrNEdKMW1hell0QW1hRm9jb1NoZEQ0YzRXOVpCRGk2VldBU2o2eFJw?=
 =?utf-8?B?dWVvWG4za2U5Nkp3eGNpOXJLUkNqUmhxTEw1WkQ5enF6WUJuaWtmZklnUURD?=
 =?utf-8?B?N0orQkxWMjhhUGc4VExycXEyU25OWlRNUVo5UnRGWk8yN0QvV2wzdEJCS2RX?=
 =?utf-8?B?TTNXK1Z2RVpyT0xJdVh3VS83QmsvUndqQ1RWSXpjRSs2YmdrYUhUZzdyc3h2?=
 =?utf-8?B?R2dMZWUxTkhMT2QyajdDcWdXY253YUxuczNZWitINGhwaEpaUzhEQUQxYVFV?=
 =?utf-8?B?ekR6Vkp3MU5jSkl6ODF0bEZySUEyK0pnN1Y0OThpcVE1a1pWeUhyc2RFMmYy?=
 =?utf-8?B?blpYTk9HTlZEemJvbjE5OUsrZHRPTkgrNGlTQUQ1WTNSNzY3d1ZzSzd0Umt6?=
 =?utf-8?B?c3BPNUtjMjhSSGRpai9Vb1kvM3hJcytmdGExcFJ3QmVvclMzM3BtOHJYdGhs?=
 =?utf-8?B?bjJoRHVBRldCN1RLMHo0ZVhYUjlZTHllQXpNTzlGMW84SERqWWZ3d0tBSmwr?=
 =?utf-8?B?WWlTd00yNkZwSjdIYUZaQyswN2daQnpRWUx6R29FZDBGUW8xNjlaL1d6Y1Fr?=
 =?utf-8?B?N1ZpaVRETUlFTnhVc2VaQTNPdmtpVE1GSUFPdWs1L28yWHBweDdmbzg0T25w?=
 =?utf-8?B?MTBZUTJZd0ttMzI2eHNzbUR0TXRxQjFHOWNIeTJaVTlhdWN1SUx3bkc0TEg3?=
 =?utf-8?B?L0pJRElFblFZU2VzSWoyWDlIemUyTm5KdmozdjJKSXhjaWpYUWh0M2ZBVUtO?=
 =?utf-8?B?OWVleDlENjNib2Q2Y1gzNlVUb2lPSUluOFIzTzBPK3hIdUhwU3cycDA1bi9n?=
 =?utf-8?B?MDdiLzVZNzZ2b3R6cHNrT3pNWE1aVlJiY21hR1F6Qkl2Ky9ycFdiUUE5SkY0?=
 =?utf-8?B?V1piUWNtZnh3L09EQmltbGpQSC9ybzZDUFErQW54SERzTmY2L1VxRFRCeWhq?=
 =?utf-8?B?NE85clA0bXpvcENVaGZpcisyeWJHTE4vN2pJdm94bGpkK3VsRGVOWlp6elV4?=
 =?utf-8?B?Nkt5N2Q3WndqUitDc2tob2h0VXJtNjhRSVMxY2NQRjcxUWRqWS9SMno5L2ps?=
 =?utf-8?B?SDVWczBKSkF5WW4wZkhDTkFRc0NZaDFoS2hBQkxRTXM2VWJpWnVEU1VXalZD?=
 =?utf-8?B?MzgrdW9pWnE2THZzYlBUY2QxVjNKOWN5QVRVcjQveUNiWnp2WE5JcXR6QXQr?=
 =?utf-8?B?V2tTbFBrMzFVWnNxVnA3dmt0QXMxeVhPNVA1Yktwdmg3K1p0dUtLc3c4OFBF?=
 =?utf-8?B?MzlZaGg5TFJXb2RUK3VQL3MvejhRK2xPSEppYmhiRGk0dDdQN0t4VkVKZWVo?=
 =?utf-8?B?L2RlREhPWm1VcXBDemFQRy9wUmMvMi8wVDJrR2pZdjZKWVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6970.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVQyS1FhVkgweW54dE9hMnBTRjduektoZ2tBaGZyd2lIKzVreitWNU9hQUJB?=
 =?utf-8?B?ZldFekJhdzlmaVJkTEFYU3YyZ25vNHVDd2JISEJxY2txZE1OZ2tqR1dITTRH?=
 =?utf-8?B?VkROOExWTjV1a0ZkTUVnMVZOdEM3ZXJCZFZDblorU1h1djkrbmpRblJIQzNy?=
 =?utf-8?B?R1h4Q21yT3p4MVpFMmowRUMxcFZ0cGxFSmFhWFFQWE1jVHEyN3dNZzB2K1Qx?=
 =?utf-8?B?VmpyTmFpQk5tVDltd2Z4cFFRbWZkYWpDU1FWNTF2RFF1ZjdTdXF3WkFFdk9M?=
 =?utf-8?B?Q0syN1U2WlZKTWlCMkRudmo3NkpZMDI2NCtLKzJ1MUsyTDFZMUxmUTR6MGZD?=
 =?utf-8?B?dzdCVFlNNFVhU1piVHVoeTRYZm1qamxLd2NqUEpPcTA5eVdXNWZWbkhVZWdL?=
 =?utf-8?B?UjZNQUxBM0lkWjVQa3FnZHY0d01aNEZGWnVia21WbnpxR0NObE5PQkpJV0hU?=
 =?utf-8?B?QlNkVkk3clRsOUNNc3hTZ2F1by94NmpralpaK3R4TzBreldVVms4S1V0UDMv?=
 =?utf-8?B?K3gyQnVUbDRnb2JzZlIwWlNWMGlrT2VyZXRrT0dUWDFGRjZ3OXhSME1rdnFl?=
 =?utf-8?B?UTZnQ0lyK1YyYU5yc1ZPL25wZGkzZjhKaHI4NHE4a3dyNnpoK2gvTnkwUjk3?=
 =?utf-8?B?MXJvcXlrVVJIMVBlTmVhd0lIYW5ycS9KVEhNbUVxNUhqRkh5cHd6YmNuUGdE?=
 =?utf-8?B?NUp3V3dSUlJhWENvYkZRL2VBZVhUVVRkdG5sR00reGczRnNQRUhuVUhQOXlO?=
 =?utf-8?B?M0NoZkVheTRoU0VhMjlBYmVicWVIeGZUMWlmT0VBZzFOcFIwU2tNRUE4N1Ew?=
 =?utf-8?B?UHRVbGxGWFd6UEFYQW9FenlmaFhOYVpGMjVYSkNKOWhlaEdDOHJ1dnU2L0Vq?=
 =?utf-8?B?MzY0L1hMVzdXeVViOGI3MmNEbm55clJXYzVURlJEZkorRW9Kd2drU1JkZHl2?=
 =?utf-8?B?VU9pblNBbHltUFFBVUtDTE5mVnRodm9SUTNJSFVNNmI0Y2FsTUwyb0dwYWF1?=
 =?utf-8?B?bzZMaXBLUjZUQXJxTUZyNnByQkozVmkyam16RmROQ2xTUmt1WnpYdG1xT3pY?=
 =?utf-8?B?WFI3L3htV0NWQVArRkdIc3o0QWNGSVZVb0E2ZEwxUUlNS01YWTJnamlaZXh3?=
 =?utf-8?B?eGJiVThPUFVRenNMZzJZcGdPV01UY1J6aGlqbWtxOVVPWkhTL0E5TTVFWTVT?=
 =?utf-8?B?YUkwL3orU3h4VUlaWXpneW5QNDdNWlUrLzZvNmYveDZDV3RrUDlpa2dFcVRw?=
 =?utf-8?B?OEVQM01wL2tMbzJRYkRiNkg0bDE3QnRTcmllbVhhdW05TEh0eExOUkxOSUtX?=
 =?utf-8?B?YnpCcEU4VzRlanNuYzM1aDdYQUlOMHRlU0VjSWlERFBtcjRiTWVmNHBDd2Uy?=
 =?utf-8?B?alV2ZGZTOENOR1ZYMEUyZ29ubHpkcnNFK0FpNE0yNDRWcmsvU0loZCt2dVJk?=
 =?utf-8?B?R3hVUFlZczkvNmxseXpuUk50L3lTTzBpTU1FNlZQTkdlaktBRVZyWGx6a3JQ?=
 =?utf-8?B?VEVhUUx4MVFRa0kzL2YrcWhvNG83VlRNeCs1aHJmOVRWbWR6SG5DMDJuaUpO?=
 =?utf-8?B?citSWTdYYWZWNUdMWXI5eFJ1Z0dyYWk0U2VuTDd6VHhObGI4TGY3MlNhMXRV?=
 =?utf-8?B?em01Y2s1enV4TVl0bmxjS2JFUUFkalQ4Y05pcVRGZmRXcEpqVEZ4K0p4TnF1?=
 =?utf-8?B?Q256L3kvRHI4WnJ5cG9HRkdvU0txVytoZnRKdzhUWjl4VnNvbm9XWWZiKzRP?=
 =?utf-8?B?YzJnc2xhZkxxSHJlUUhSQWhIUVM2c0ZvK3plZzc4MDZRVzFkcXFuMGlqNmh4?=
 =?utf-8?B?VnY0NUdCQ0tCMEJYRjkxSjU5c0p4bXRFLzRCb0xqT2F4eXM2Q1JKeWduY05V?=
 =?utf-8?B?b1UrZ0lNL0p5U2JrUTRheGgxdFJYN2VpOGxYVVlOZVVYZW1TNFoydEZjNzVJ?=
 =?utf-8?B?N1VrSEJPUk5DZXlEUEJlVkpiVDZDZDVoTkg4THpYKys0ZkNnSjBLdlBsRFVP?=
 =?utf-8?B?VXNLaEtkUjdvK0tMQ3VsQWc5TU8vcnlyMmhoRDN0dlhUNUxoUWkzdkJmWHJj?=
 =?utf-8?B?M01SUzdGeThianZ3dUt5cjRkSGtOQnUxQnhiZm9mcVU4ZmtPTVgzSUswRjFj?=
 =?utf-8?B?MTRuZFBBdUtOZ1owQXByUXQ1MGxEVlIyYzBJdEtWdy9ZWDRrU25DelVxRjBx?=
 =?utf-8?Q?9tce46c3PHCgaVSHMI8XcAg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 331d0f5c-95d1-41e7-2110-08ddacb0e548
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6970.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:36:31.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ0NjYHIJ9K6otIqj2T3e8HDcrUznyeoFmb9YYdc8GWhajjXpxrKQmqd38vH2iZX40GrMRD/0ZvP6kKq4vURWsflV58/NkFLNgvoL9oSfdW2HZDQyCCAaY0bfwZPUl57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5985
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

On 14.06.2025 01:01, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Graphics version 30.03 should be treated the same as other Xe3 IP, but
> will have a slightly different set of workarounds.
> 
> -v2: Merge and extend the WA onto existing entry (Bala)
This line is not necessary as it have been reverted.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@inte.com>

Regards,
Bala

> -v3: Revert v2's feedback changes and keep entry saparate (Matt).
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c        | 1 +
>  drivers/gpu/drm/xe/xe_wa.c         | 4 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5d24cc320d72..8bb698786334 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -184,6 +184,7 @@ static const struct xe_ip graphics_ips[] = {
>  	{ 2004, "Xe2_LPG", &graphics_xe2 },
>  	{ 3000, "Xe3_LPG", &graphics_xe2 },
>  	{ 3001, "Xe3_LPG", &graphics_xe2 },
> +	{ 3003, "Xe3_LPG", &graphics_xe2 },
>  };
>  
>  /* Pre-GMDID Media IPs */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 4a76de391abb..6baf369fb330 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -644,6 +644,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_was[] = {
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index b6ed8cfea938..9a691045831e 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -33,9 +33,11 @@
>  14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION(3003)
>  22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION(3003)
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
> @@ -57,8 +59,10 @@ no_media_l3	MEDIA_VERSION(3000)
>  		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>  16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>  		MEDIA_VERSION_RANGE(1301, 3000)
> +		GRAPHICS_VERSION(3003)
>  16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
>  		MEDIA_VERSION_RANGE(1300, 3000)
> +		GRAPHICS_VERSION(3003)
>  
>  # SoC workaround - currently applies to all platforms with the following
>  # primary GT GMDID
> -- 
> 2.34.1
> 
