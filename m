Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFB3C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6350F10E16F;
	Tue,  3 Jun 2025 18:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geMMgjvM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BBE10E16F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748976121; x=1780512121;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EijVsjKRtnzEzeHlrWJtzNVsXqADB2EQI/sC2mu3SL8=;
 b=geMMgjvMaRsipVLo6CUk6JiGYT7HJW9g7bjit7MjgCChsc9v1kSYMXkP
 6n07cj4cAV5oYkmhqBiJzazdWWERFj3tbwkWI7IgAgX79DRf1K/J3SFds
 3UWjXGWa94lAmHtfoCMFTKhpUz5duqrmLz++096JPrjX0e/RVp5iSrumw
 jKcHVa4eCrwkg4KFURzx9uqt/gy8RXL0ChiGRJWNfJjShunAmsZQnwbdW
 /96ZIxuPGJ71TrfdJ1llz9Xm8aZDxv35liepayf7eJzDTAHNqkwoycjcg
 nnTCSpJqIGOE6c+AIrls6hzx2Djjnbxp1bn23QI8r7jptA4iWGyGkpf4j A==;
X-CSE-ConnectionGUID: TR0AAzSURMq7gTYkYqWt8A==
X-CSE-MsgGUID: Gi30mXnhQE249xyTjP8ZIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68586258"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68586258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:42:01 -0700
X-CSE-ConnectionGUID: 7Zbg+QhrRGKqbHzVcISE6w==
X-CSE-MsgGUID: wUqeVq9sTJKE0fvHqOb6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182122611"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:42:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:41:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 11:41:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 11:41:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICwLZwQfIua2a54ilEV0zzV597mn0lnV8kj4Mwe7r2lPzdPyDTsfe/WvmGMjGxqnz6lasmxZPM75I+hzMCetqBPCkDyQOlNfOpPjuBvuVpeJq1XrhIB1JoFwHipbFf1IUdW9DVDhTY/3RvDfsgnZlg6aW6dljs/iMc1lyXbfOzZNiu9qc0xMQZdkyowCRbYvaCJxT3uQjYrPLCMcPaQwnITipnACtozdBk7i+sVR66uNTTIXZfpwwevMljVCbwpAbYGsAs0KGb2caNo898RwOAsXUPtd1Q7k2XG9OTR77TPUONRtQcGJz89IBzouMA6+wqqRpOCOwcWZn3y+0dGuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb54+tF/RMftnwIJCJTyWGs/I4oDRy/XVHxFSu9ssSg=;
 b=F2gfONkSrp8T4qn5EmSu56tijRYFA7PyGvFltGOv1b9vYD3ImYEmFBLL6djTNYwOP3ODux2aEky0zWN4HDUpaM68VzddbnhEV8069UYhtXBDOQNwlj5x8qtuF//cVoFu/xB4ApIxzBFe26Z+JJuga7fXHdox0M2N4bsNsTmsM0J7amBnXvHBJod+xb7J9FCzvyg+J0F9mYhUyX3e+eCHkHu5hzxV5PqsMmbKPqnU96Y7e7GO8vR+ShsPx6SzaB2V2i/RL3qBI6ZWwiSDLLGyMBl9VZVvPz5Kuw+0mVQBBlpf9FVX193HJ1Y2V3rnmtDm271GoSd2Yen1YXsgm/EtaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 3 Jun
 2025 18:41:57 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8769.022; Tue, 3 Jun 2025
 18:41:57 +0000
Message-ID: <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
Date: Tue, 3 Jun 2025 11:41:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::22) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: f40fa2f4-1a57-440a-6ad6-08dda2ce51c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGxBaXI0Q2FPWnNRK3ZyTnpDdlh0VnVvMTVwdDFnamRNVGVybzY1c0xKOU5V?=
 =?utf-8?B?ZXdNU1AxaHRqaUptNGhOeGhQMlhuNis2cVFqT1NjaVJjcU85Rk1qVmdZeUty?=
 =?utf-8?B?T0RkWm56YTNnWGt6QmtTTmt1b2ZlN0VDYUMxcUt2VVI3eHhUYklmOUtDdWFR?=
 =?utf-8?B?UHV4QmpnNXZmbExIZ3RGU0ROdEVqVndvL291Smx4anREdUlncUg3OXptOG1l?=
 =?utf-8?B?NzIxcCtnUVVYNlJsUlZXcFNDTUM5amxoMit1a0wyN0pYTXI2OHkva1J5Nm5V?=
 =?utf-8?B?Sy9UV2FzSldMZTJUN1Y4Ni9VdTVXNEIxQ0VnQXZGWlI0ZGIxYzF3L3I3M2hZ?=
 =?utf-8?B?NGNDOWtKbXZpcFpXL2Z5ZjZNdGlDekJxOHpaR0dmUFBWOHRoZlFXS1Y3Si9n?=
 =?utf-8?B?UHpYZGtyaTdVMHhLN1hNUm5TNlZWY0xLSXBuZEMwOVB2STRWMG56aWJ6TWY0?=
 =?utf-8?B?bmJ5YUhNZmt5R0dqK0FqM1NSRWZtZHluQ290YWpOTjdKNll2L1ZJZW1rQTJp?=
 =?utf-8?B?YjdqdzZFZ2hsNGU5TmlvT2k1Y1FjUkhWZjNFSWozK1VPNWtydHB3djF1aUQ5?=
 =?utf-8?B?M0ZrNTFOMUZtRkZGREhEZG0xU0JDekNpSXVMRDNWWEozV1hWaVJQVzBYZEF4?=
 =?utf-8?B?czg3dEc2TVQ1NmxoeE42c2xhWFlMVk0vZ3ZFeGgxQStFYmVkc1U0bUdwdWRF?=
 =?utf-8?B?UnJadklpMzRGV0FZbi9TNEkrS1ZmTTlxUVlzVmRpRHNiNTk5U01YVzQ4NnRP?=
 =?utf-8?B?R1kzWkR2a2Z5OVZ5VzZxVStQNHVObEd1ZGlMWCtqVVRZUEhjamo1ZTducTJr?=
 =?utf-8?B?L3VRVk9ReWVUSTlYWjlDU1YvWHpqN3FLcGlRNW1Qb09EbmxBNkNIRzRWSlB6?=
 =?utf-8?B?ekVZNm9WelZtdytYYmxVMmRJUnplYVVwVDZqMkZmcjl5ZGlaOExQQktWSjlp?=
 =?utf-8?B?NUVacUVsVHk5bzVpUWZ1UHZ6S1k5NHdhbFdORGpBZkpHOTNMMjJTdEE0MWU3?=
 =?utf-8?B?blk5alJ4OGVBOVRKeWhEODJCTlRJNGJlalpJY0Yydi9xODNEcjVyNzF2UlQx?=
 =?utf-8?B?SEdjNVJzdW9MUUVPa21lNk5COUo3MEpvV29LMkVFTmdNOU56elZScHRXdCt1?=
 =?utf-8?B?Y053MmVRbzNCa0RodStFQ0NSZ2hoUkg1OEc3QlhMNENJNXFOS2t2UWp6UGxi?=
 =?utf-8?B?K1pTeTUraVpubHNiYWhVSUtFWXU2UlkwdVYyV0YxOThxM3pOK0ZjeVVkL0R0?=
 =?utf-8?B?d3VuaWt0OWYrbWVLSGFHcG5hMHg2TUpFM2NycE1ncmpIQmxic0IyMktTUlN4?=
 =?utf-8?B?UjRmZmE4YVlPTFpXQm9Rb0JjcFY3MjRyaVNyem8rdUhxWmdEdkMyN0phVTIy?=
 =?utf-8?B?d0Mwd2xSM0RUVSt5S0V3ZzBKcFMxK2l0a3BKNit5N2M5NTBDclc1TFY3VEdz?=
 =?utf-8?B?Nm1rNWtGcWtuc1F5WWdzWTM3dUZ2eFNHS2NvNER1NGpLbVBqVTEySHp4dXow?=
 =?utf-8?B?YUFhRmVCQlo2RVhDRnMrK0hOdkU3MDcwMUJ6M0RaUEVCdDVOc21MbXJQNXNM?=
 =?utf-8?B?RjVYbFpRaWhPUjByUXAxanhQWmpyVXBQcmQyY0Y2WmI5aEwyWmlldjNrYmtC?=
 =?utf-8?B?Z1dFcURDU0Z0d1hGTzdleE5jVDRTdERlVW90TjNRT0lrNStuVUJmL3JOZk1h?=
 =?utf-8?B?NzM3NGhxRHZuWWFBamJ2V1g2ckJMTlZwVkVwb0xERlgyRWNIa2VOa0ZxVTBv?=
 =?utf-8?B?UmVMV0NiS2FpU0dlL2lESDArNnNYcnpxaEJtYnRDckw2Qk5ZVVl5MlN4aVZo?=
 =?utf-8?B?cmlZVW5FRjRuMmxCQlpOTkJhNEJnTFFZWWtzS01OTDczNEo1eFlRek1TN2Nj?=
 =?utf-8?B?TWlLT2pDcCtjdi8wV2xIK0pGbHhvSTNZOHp4cVRFZDBEdXhyNnJzS01qZjBk?=
 =?utf-8?Q?Q9RK294C2cA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzJaTGZWTEo2MFhRVUpOY3FuWHB2a3ZXdlpNNnJKbkRrNGpkbXNkbEp3MHQr?=
 =?utf-8?B?RjFXT0Z6dkRjYVdhQXhCMVBqVFFmSnVWNldJYnJyd0VkKzNwdmZJd21RTHoz?=
 =?utf-8?B?ekx5RW5HcjZnOTg2Qi83Q2JHRExHUEd5Z1c2RVdkbWRVbk1YeXdDNzRWeCsx?=
 =?utf-8?B?L1Z5Y2RKQnZRZ3BldFpXMHB3N2hkYXUwY1prZlFrL1FnTy9wdmZkRUQ5ekIv?=
 =?utf-8?B?WEJhTVRhc3JCRGF6eWlzMnVUQkhzSWJmNGF6djZwRTVpUTc4cXJKaThzY3V2?=
 =?utf-8?B?UVVLcEVqZldXUXgvQSt1NVpRZGlYcG9MRVZNZTRsQ244WEVpT043M2tvY0Rm?=
 =?utf-8?B?bzhNUVUwM3Z1MGpLdGJ3bGoyazRxV2dVZnZreEZPZVViUWRJZkFRWEFvaUN4?=
 =?utf-8?B?c01FRU55T3BHZkowWkkrdFR0aklPZlFPZTRpcmlZdThhT25YUnZNcklqRDNp?=
 =?utf-8?B?cXVITmt6aDVXbWs3SmUyMWplU095TFN3Q3ZWOWpjL1czL1pwcHBqeWpSSHZX?=
 =?utf-8?B?Wk92UlZyMWQrQ0FzVXUvdGtxVmFsUm5zaXlLUHBWRzgxUllsc0tUZVJ2alFP?=
 =?utf-8?B?NzFaNEtPUWliR0RLYkd4NXVCNlJ2cjlPeEo4YkxhTUwvODczcWZCT05aVEtv?=
 =?utf-8?B?dFBKQXlibnplYVhGOFZkcWorZ1ZUZXZLY1I4SXdvU1RpS0dmbElOZy9OM3ZK?=
 =?utf-8?B?WlUvTXFMV0w4Vyttb1prZTVRUllTZW9MblVSVHh4Vk1MMmNXb1Ria2gwbkVV?=
 =?utf-8?B?LzBIbGpxVi9uWUx2WlNqQUZyM2EzUS9OQ21JaDV6bHZaZlRYTWdzcWlmaTBN?=
 =?utf-8?B?WWV1N2h1SkZPbzZvVDdCSzN0a2I3KzI0eUR3MWpFWWVZOGxxTittcGpvVUsv?=
 =?utf-8?B?M0w4Vm53d2QvaW9mT2wzcWtHRUNRVCs3cFJMRUtITHlmeVQrakpOSkFHVHNh?=
 =?utf-8?B?dm93dmFNUEVhcVJkRVZBV1ZrcFE1MUhrS094d1REdndGeGZPYnJQYUpVLzVu?=
 =?utf-8?B?UjdzWGJBaVlZOFFvaDBlOG56Z2txaTBWaGNSeG1VU0NQYUx4d0FYeDVkZWZq?=
 =?utf-8?B?M3VyOXhoZ0FMQ1NjeTdJRkt4MTBDRTNaQ3JZTTgvdFVUazV1T0dJejVjRXJV?=
 =?utf-8?B?MWQ5ZjlOd1NtTkdkeTZnT3dUYUJLUG8rVFZMN2xHUW1ZUDZtTG1YUmorbHJj?=
 =?utf-8?B?K0l3d0FHMHgrMTk5NTFTdDBkMlJ3RGl0QzlGdUQxZGwzMmc0OVFTUFhxMUNi?=
 =?utf-8?B?VDFmTHB2ai9DeW9Na0dFa0gxaGRnNnIxbTdVWFZhVXZaVFdoQlY4QUtGK3E4?=
 =?utf-8?B?c1hGcWJtT2NiZ2hET2xlRlI4TVM3ZE80dEovVUpjditZR3pGemRadC9paFJG?=
 =?utf-8?B?aTNma09JVTJjS2pPdjhIQVpkeS94SUtJSFVIK0czNWxGT3k0RFE0QnAxbEt2?=
 =?utf-8?B?NjNYbXJVSEdsdzl6SDVPMlREYVpRaG0rejM4c0UxY3A2dVlHdFNZUGZ3STJR?=
 =?utf-8?B?bkV1dldWZEg5SUdub3pnb29UOGdPS2pYT3FhSmhRNUpMT2padzBaY2dRVmVB?=
 =?utf-8?B?QTBYZWtldEtpaTN2RGJ1RnFGdzcrK0szZFhpbnZvaEttWGJNNGZRbEg4Y1VO?=
 =?utf-8?B?bWRpWmNPSHIwcVVUd3VyL2VDRFZ5TDdpblgwcXE0blR4Nm0waktLVmF2bWJM?=
 =?utf-8?B?WGR4YnhTR1l6TXpiWHpCSGNYSmhlRXFnN1dFbW9uWFJJNWt6ekJUOEtLYVlT?=
 =?utf-8?B?S1N0SGFqYkZ1Um00K0d5YXFaYUY1RWNOZmc2VTZvQnJEcmR0MHdaQW4wTDhy?=
 =?utf-8?B?NUNDTk92OUJSVk1jTHdlM0srL083V1hpVkZsY2tINUxTcWJrUmNvbUZoK0x6?=
 =?utf-8?B?ZmVmOFN4N1RFbFFCaVdhbWU4Z0lQU2pHeU5LY2llbERqVW42RTV5NjY1UGE4?=
 =?utf-8?B?eVJ5aENBOXY4NFdrZVRqa0QvaWtlekg2TTN4ZjVLNFB2T0llUnRUdGdOSlFQ?=
 =?utf-8?B?WktmbWJ4cDNJeUQxY3Y0SjRSWVF4bi9pSGtOTTh6Z2cyRlZJa016MXBGYnNJ?=
 =?utf-8?B?NkdjVUNMQmk1MFRhTXBCbkdtSnNkK01ERDl3L1dtWFgvaEkrOEJvcGJPL3ds?=
 =?utf-8?B?L2tOUUQ3ZWdCUDFJK25lY2llbVJJSHVVUWYzdDFIdnI1UkRhdWJMeThGVy81?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f40fa2f4-1a57-440a-6ad6-08dda2ce51c3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:41:57.6811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwlyTITebvb785PBE2gclRjs9twmSPyujeXM4lvKSeh2K0Bfv+E9eCYSlt+LIfwmjLpbhM13DsCU2PqlUbWjf6VFanHDxli2tnfXQ24eQk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
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


On 6/3/2025 10:36 AM, Summers, Stuart wrote:
> On Mon, 2025-06-02 at 16:44 -0700, Vinay Belgaumkar wrote:
>> Set GT min frequency to 1200Mhz once driver load is
>> complete.
>>
>> v2: Review comments (Rodrigo)
>> v3: Apply Wa earlier so user_req_min is not clobbered.
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c     | 5 +++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 18c623992035..cb0563494fcc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -51,6 +51,7 @@
>>   
>>   #define LNL_MERT_FREQ_CAP      800
>>   #define BMG_MERT_FREQ_CAP      2133
>> +#define BMG_MIN_FREQ           1200
>>   
>>   #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for
>> precision */
>>   #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at
>> pc_start */
>> @@ -843,6 +844,9 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc
>> *pc)
>>          if (pc_get_min_freq(pc) > pc->rp0_freq)
>>                  ret = pc_set_min_freq(pc, pc->rp0_freq);
>>   
>> +       if (XE_WA(pc_to_gt(pc), 14022085890))
>> +               ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>> pc_get_min_freq(pc)));
> Do we want this above the get_min_freq() call above? Seems like that
> would further limit which is what we'd want in that case right?

No, this is during SLPC init, we don't need to read the min freq at this 
point. We will adjust it later in the flow if there was a user request.

Thanks,

Vinay.

>
> Thanks,
> Stuart
>
>> +
>>   out:
>>          return ret;
>>   }
>> @@ -879,6 +883,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc
>> *pc)
>>                  ret = xe_guc_pc_get_min_freq(pc, &pc-
>>> stashed_min_freq);
>>                  if (!ret)
>>                          ret = xe_guc_pc_get_max_freq(pc, &pc-
>>> stashed_max_freq);
>> +
>>                  if (ret)
>>                          return ret;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 9efc5accd43d..75fbdab68d44 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -59,3 +59,4 @@ no_media_l3   MEDIA_VERSION(3000)
>>                  MEDIA_VERSION_RANGE(1301, 3000)
>>   16026508708    GRAPHICS_VERSION_RANGE(1200, 3001)
>>                  MEDIA_VERSION_RANGE(1300, 3000)
>> +14022085890    GRAPHICS_VERSION(2001)
