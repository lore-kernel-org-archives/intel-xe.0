Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED42D30CE5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 22:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A4110E55C;
	Tue, 13 Jan 2026 22:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdnacOE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF7F10E55C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 22:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768342136; x=1799878136;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YSjPX/2uuroam3WrNvc1QtoWnQ0gS4+H6qzZ5Sd3cJA=;
 b=SdnacOE4fPdXA/gjj85wlkaakQeFrm50y6n74IuzlGzN95QbzQWTcQzn
 QEmCqmy+zkUFs2NY3ZiOjG7h9LNgrRtsgU1RqZPr+v60lMv/VqcagmILD
 6T+AAQb+Fersf6Ku79iMhlVzhZKDKi9Q1dwYpY1PCaKM6vdbY4qxmTaDL
 nhaSlRr2RrMUJL9wlyNktYD7uH2xlvRFf7x9rlLTz5GpG+nO4HxutZbaS
 KGIAmjczGbfLf5gUKxKpg4NBVwJ/1FEIyy1GopAAv1QrbhQfnXBcdIhaj
 a26rk8Yz2Bnb+UVTBe4bUUp37j0SyIQLUTxsO13AS+Q6Lik2V+VvWVJa7 Q==;
X-CSE-ConnectionGUID: wcrMYiH/T36BPv+CVKNJHA==
X-CSE-MsgGUID: o3kNjzEcTROrHD+Hp6SaMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68844634"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="68844634"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:08:56 -0800
X-CSE-ConnectionGUID: 63B8rsENRLOYE4tnsqSNmg==
X-CSE-MsgGUID: l1FBse2pS2uMNuMYchtusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204576130"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:08:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:08:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 14:08:55 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:08:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeTajmm7aZ2+hLO3uua3z5/v+7mPTblsaUqJgI724ynn1NlsJWYhZ2r+3PxEeDr0qyy1Y9dmvRbweybKb1OjzFfrjJyFrvVUNVhRs9Fe8sXEe4iCxRy7w7QHFWOFHVf4tH3fFZHdj3WyH7VKCXUXyoiv5OhmJCn8Yoi2xHy3QNF7CjbKgKOlvysap3Mf781qjHj/ca3/eg4EYOMmDm9cKTgE/zHPABuPBFBr274W8D1wNcwr/MIlIlMdXxJD09t+y8k8rwjovDZwk6I7jKFG/oP906D9mAfFU6Z+Gt6QdHCZ+uAG5vEHuQh6bbXuzSFtNutMd4/pn5Ijo/JCLvHPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jdRA8bmOM2VfKbC0/1NCWb7ZkVV043I0I59m2T+4Q8=;
 b=D9I1CRn62kb/Zz5W7Mxzso8jejYA1ULyeGhbcRVULWkthHAHDXV0I12ryqrKSRJCqJt2vzlDXLUJtVG1BZpjnvzKewYTmpPYHhcbMAlqmmsfz0ha43w/+xaY5RR0lhLfHc069EiktfSWwaU4qUIWYu6fbdOBIUrZzFHSXYFQUb13F7HVFISpUu3BbDDMxbd+Xeev6DkRDwCzsEgXI9q7r/n4WRCkJovYLWHevErpVrPLr6dZO+fDQCuJd5OPXX3u/DA4pxEMyJW6e93he479MusVWVjGC39iTDUVWx7jwIvaKxDCJVN16PjOdChYEp+33WbjHme668ov5wljYUHhCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6934.namprd11.prod.outlook.com (2603:10b6:303:229::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:08:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 22:08:52 +0000
Date: Tue, 13 Jan 2026 14:08:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 11/12] drm/xe: Add context-based invalidation to GuC
 TLB invalidation backend
Message-ID: <aWbCcsiYM4hv1W+N@lstrano-desk.jf.intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
 <20260113025232.3504648-12-matthew.brost@intel.com>
 <ba1c6cb4a6f171d4faef8f00baaedd02ae2189b4.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba1c6cb4a6f171d4faef8f00baaedd02ae2189b4.camel@intel.com>
X-ClientProxiedBy: BYAPR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:40::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d9176b-7d9f-4366-500c-08de52f055f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWhkWkZ0aVZybml0T2xrcml3Sy9RTTMzT2l5MjErTUZLZ3ZobnJCcnpGRkQy?=
 =?utf-8?B?WXBqajVKZDFjbHZBRUhoR29nM3dpcHRzdFE2L1VhZy81WHVodnB0RmtXZlFh?=
 =?utf-8?B?b3lDaW1BN1ZwMjVRSXVoTzBaRzlSSGRrZmxxQ3hkdks1UDhHbnU1SjZKNFM3?=
 =?utf-8?B?ZEViNXhBNERJMytYZ3JmK0tVenBzRkNmWmcxY2pwZGtPeG9VNWxJVTdPajRL?=
 =?utf-8?B?US9DYVN4YXJjZ3phYW5mWnM3RmtkN2EwVC90R2RHMWVCMUVuUmx0d1NNdkFl?=
 =?utf-8?B?bXRrVEswbmFJRnM5M2RxeitvOERNZjR6MW9wOWtaTU1nQkRncUVqSGQvRTFB?=
 =?utf-8?B?R3NIcElQbHU3T0NpbHA0T0svSTl5cXZmSkxNcWE4SU1Od0hKR21Yci96VjVH?=
 =?utf-8?B?Y3lQSGNwTUdvTDcyRUZFT3lmTi9jUWZvQzRQREVZYTJiTVhNUVd2eERlZzc0?=
 =?utf-8?B?TyttL1hJcXBZa20xdXZyTUQ2Z29FV0V0U2dWbndvdmtWQWNVaU5MTWorWHdE?=
 =?utf-8?B?dVJKcmd3WU96SHVFVmFOMGRnMm1PNUJzQmEyNXMweW8xZk0xV1cwOG93QVd4?=
 =?utf-8?B?S0lNdk9IeTk1M04zVHFBWUxtU3N4WWV3bzR4eW1YTXI0SkxQKzZhd1RnVVBE?=
 =?utf-8?B?QmhHczJZMVprd0EwRTJoUlRYVi8vQlRiQjM5ekphMUwra1FKUi9MMzB4bVFr?=
 =?utf-8?B?RUZtVHovTnBLY045STFXbjltdWFqZjlqdm9XanpyRUJvUTBRQllmOGZ0N2hj?=
 =?utf-8?B?R2FTQVBUT3lwaXNFb0FHMHVIWUtWQy9MZ1ByalNiQzB4Wlo2ZDZ3UUk4ZnlI?=
 =?utf-8?B?ckgyY1k5VExXd3JVNHhrTVJwMG12Tml2bWJQNVVPMXk2NlNwUnNORjRHRmp3?=
 =?utf-8?B?Nmx4VmZwZ1lTUVV0dVZxQWtRUm5DVmloY1Vneks2RjQ5ZjRuck1GSXd0UHFQ?=
 =?utf-8?B?TWkvWElZZklWY1ZiMGFqZnBYRlZ4UnU4ME1FcURXOXFFMjBOamwyZ2Jnd205?=
 =?utf-8?B?UnRONEs0TDlrV0RVbG5jeTNwcmxsZlQyM2g4aEpNaUlhZ1ZyY1pPS3Rkekoy?=
 =?utf-8?B?Z3NPY2dXUmZsNE9pYm9hY05aRkRWWlRKSTJTaEVpYXpXVVRQYS9PYW1kc0Nt?=
 =?utf-8?B?ZE1rcFVDWEJtdzlURXFvSlNTWW9YbzlYMk9rb0hhaGVsOEZBcHZzbzFyNHQv?=
 =?utf-8?B?ZVFxT043TTltRlErV3Q0akVVaW4rVlRMUE15VngzcHhUZXN1a2gzWlc3c1dE?=
 =?utf-8?B?NExuT3NicVV6ZWFTS2xwdTlNT2xHRVBvbTZibmgwSEpNQzVnVml2OFlRYTdN?=
 =?utf-8?B?OW5VS2hCZ2tQUUJRU2FHWVhqQUVvT21YM0VrbzZsZmVTTkthQTFHOUdkRHF5?=
 =?utf-8?B?dmVna2dENU9OODFIRHphb3A0c3JmcXNSOHdieVFmWjc0SklpVzZBR2l4T1pI?=
 =?utf-8?B?WnFqdkdmRjI3aElqdDc0OS9JTTFBTlF3bHp6OGhMVVFrV1BwdlhCcFBzWFQw?=
 =?utf-8?B?U2o1b25FeUNtUFRDaEFpbmU5bHZTRzNWd2FZRS9MSXBna1h4aHg5T2ROV0l2?=
 =?utf-8?B?cUM4UkdrN3p3V0wyeUlZTzlNSXJsczRSWks1enZpNmpTdVloRGxFK2RFWC81?=
 =?utf-8?B?blB6a2xzSWRzSnhGZ2lmSUc3ZnRWbWY4ekVkNjFuUCt0Z2RFK2toRVVsUSt1?=
 =?utf-8?B?L1hDNTZsV1JHSTJmb0VaZXg3OTQrNUlDc3BZeEpGR1ZaZStraVdXajh4VjRV?=
 =?utf-8?B?bmJHUzNNTVczb013bFZSYVV1d2c0eWd2NVBTL2JRUEV1QjFIWlBRTE9tUWh5?=
 =?utf-8?B?ZGRhd2RSTlFHNHI4am8ySXk5RlRVOHRTSDFDNHdEUTY4RTNCYU5Tdk1SUUtx?=
 =?utf-8?B?NmYyY2kzdEtmM0IrQUNwY3JVR0NCSUdKY2FxZXJIWTZPOHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEJqU1Rmazh1NlFjSTBQUFBhWDBuVlJ0YXZIdzU3ZUttZ1dUTU1od2RSMXV1?=
 =?utf-8?B?N3FFclNSdmx6eDZIWlVUWVp1S1pKNVprcmZIc1VFc2JyM2UxRThMa2h6VTND?=
 =?utf-8?B?RFV2RVZlR01zQzJ1RFVGZVIzKzFVMGQrQW1MSlVrR0FCZUNBeGlNNmJGZTgv?=
 =?utf-8?B?dDVVeElRMW5tWG53MEpXaU9RUHpsbXh1eW96c2RabUU5ZzE3a0hZeU1rQ2Nw?=
 =?utf-8?B?T2cyWS9qNXN5L0NrRmlmdVlqbTdKOTRRakhaNDd2UjdsNGI5SWp1UW02NnY4?=
 =?utf-8?B?aVliY1F0Tk1FTmdZTkdTSlRpWG8weUlBT3hBd0ozYWJwbFlwUnR2ODhwcmRv?=
 =?utf-8?B?ZGVkK3NqRW1WS0lvd3BZMG5XQkhtU2pWaXMrWFVHU25NWDFQZEVPLy93Y1c5?=
 =?utf-8?B?YlVIaHFOMEp5cUpiMGxPeDVMc0tYRncySGR2T1ByU05EUktnTW91Y25rOCtn?=
 =?utf-8?B?WlV2T2R6bkN1elBOU1NNRmhCLzFLMm9ZaDZLclgrNGtBbko3TG1GdW1HaTEv?=
 =?utf-8?B?bFZhaS9kRElOOUhRa1pJZ29YdUNDVC9aeWEvYjFCb1c0WUV3UVlJREVtcVcv?=
 =?utf-8?B?WDhpNWw5TzUzNVlybmlsbDUxbjNINzFTa0FmdXBtbjlXSU5SbVZ0ZXNpUzZs?=
 =?utf-8?B?LzhRU085a295NmZxRUE4b0xPZ3E0U3ViTWNMWlQxVHN1VGhIZE4ydUpKTDVq?=
 =?utf-8?B?S2dtaVRsMTI0VjRlTGNjYmw3QWpZci9BUzMxdWF3M0lZUFU3QXNpYWpVY3ZJ?=
 =?utf-8?B?bHVKVEZaYTNFZ3R5Nm8xZDFNdWJRSFI0UEJlSVMyNkZiTy9qSytPYzU1TDlI?=
 =?utf-8?B?WlFKaC9rdTVjVmhSS1duZ0tKM0xVcjcwTEZuU3VqY0ppOWJ2WEpRR1hNVjZM?=
 =?utf-8?B?anVDSTdyQjNoOE14STBwM255KzFOa0VSSUkrbVZ0a3o0RVF1bUQrMlJ4by9C?=
 =?utf-8?B?YVF6Ym5qZHpKeEp5QWFoclBISldVRDB0Zml2c1FkaEtseXB3TjJkNTZxTkRQ?=
 =?utf-8?B?UHYvVXdpVlk5bUY5K2FGSERabk0rUWJSY2hDaDBPOTJNTWtWSWYweTNNdnBt?=
 =?utf-8?B?WFFMWG95RVVOOHpuNUxUczFrNE5wTUVZaTE4N1Y3Z0FiaEJqbDZJN1c5U2dn?=
 =?utf-8?B?aG1pZElPcTZHdTh1bEF2OFhTTmJxSnkrRnp3SlI0MTFmc3l0SWdaM2l1bkZD?=
 =?utf-8?B?bXk3NG1EelhOeXRPU1dsTXVoN2llNnVndDlsSG1tbFVReDhmMkRCR1V4WkR4?=
 =?utf-8?B?Y3RLUkYzSGtCWFRyZWtDZG5SOEkxQ05sSVRNbFBVQUEzS1ZnTFgrVlh0cjR2?=
 =?utf-8?B?cHJPcFFhS0NXTTdZUXNOSXUrR2JuelFyM3p2U0I3VlU2MkhUQSt1RHVBT0xo?=
 =?utf-8?B?Zks0V1VwZmdDWlQ5aDRCK2ptd0dZaHprSGp3TklaN1duV0lOcGJWS3h2eUtj?=
 =?utf-8?B?dlpmV0pMUklqZE1TUWpJNjBYWkhxLzRnMEYrVFVlR0pYY2ltTlBRL3Zlc0I2?=
 =?utf-8?B?bW8zQkg5dUplMU9wdTE5M0xvZHBwazJiNWZjV2JycU5jRVhPRTFJQTZ5TzBs?=
 =?utf-8?B?RnJaVnZYbXVBZGJaQW9HSitIZHBHU0pkUWN0Y3BkRmkvbHUydlY4L0htYVll?=
 =?utf-8?B?ejFocTNLUmI2N3lnRFZyOWtjZldUNnh1eDI3b2J5d2pnZnZ2WUlOY09nQWdO?=
 =?utf-8?B?UVk5eW9pUUppSVpZNyttcFBQMG5VbGpua1d4TUp1d3dQeVpNalhvWHlxMU5p?=
 =?utf-8?B?YlBFNUlLZmQ5MVowcXBKR01sTVQ2QU05amxmT1NTTjZqdDg0cWdDMnBOd09W?=
 =?utf-8?B?VzBIZGY2cGl4eTEvbVRyWkQvZGR1TTJBM1Nnb0ZpdkJoN0dkM3EvU29PU0ZO?=
 =?utf-8?B?bDh5UWd1T2p4SWVTS3NsLytLUzBhUExMZ2orSEdDTXh3dktPTVBDaUx5TEd5?=
 =?utf-8?B?a0o0QWNyTnBId3JUNmJiRWRhdDl1SkU5cDNVSlJiZXNOTU4rZ2hUeWNQL2dC?=
 =?utf-8?B?aTFweitYZHdFd3RHYXFyWHJ1Mm80VG5IaWl5QWduNWt4UTVMandDalZ3Sitk?=
 =?utf-8?B?UmtYWnJIOVl5aGFSNzR4L0ZaK21KZlF5UE1KY2R3aHA4aWJRbm4xbU84Vjl1?=
 =?utf-8?B?cGJxZUN5RUZnamZyMnExam9GR24vK0trdGlibVc0WDFGeVFBQWplYkZlYkVE?=
 =?utf-8?B?YXVmaGdaSzk0UnFhVDhpV1FBRExxTDlBL2dtZlc5djBjVXVwZnRqdVgzeTdy?=
 =?utf-8?B?bXlicjZqOUVJeitURjduY1Evd2JtQ202VW5HU0xOeFpjZjFudEY5dU41UkZv?=
 =?utf-8?B?Q2VsdXUrcXZOTVY1RzhUZDVTMGdWRWJyeHFoaVBoakVERExaeWRCbzJkQ3hR?=
 =?utf-8?Q?RgOuTBdVM+enfZjc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d9176b-7d9f-4366-500c-08de52f055f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:08:52.1900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESGQWBkGyXNugt2MAt8auumoQ18PzfU7rOjEqMaLYEEmUGF9yATKLCP09fWhhjEdgSLnEVhfwGLm2w9WaPrDbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6934
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

On Tue, Jan 13, 2026 at 02:23:57PM -0700, Summers, Stuart wrote:
> On Mon, 2026-01-12 at 18:52 -0800, Matthew Brost wrote:
> > Introduce context-based invalidation support to the GuC TLB
> > invalidation
> > backend. This is implemented by iterating over each exec queue per GT
> > within a VM, skipping inactive queues, and issuing a context-based
> > (GuC
> > ID) H2G TLB invalidation. All H2G messages, except the final one, are
> > sent with an invalid seqno, which the G2H handler drops to ensure the
> > TLB invalidation fence is only signaled once all H2G messages are
> > completed.
> > 
> > A watermark mechanism is also added to switch between context-based
> > TLB
> > invalidations and full device-wide invalidations, as the return on
> > investment for context-based invalidation diminishes when many exec
> > queues are mapped.
> > 
> > v2:
> >  - Fix checkpatch warnings
> > v3:
> >  - Rebase on PRL
> >  - Use ref counting to avoid racing with deregisters
> > v4:
> >  - Extra braces (Stuart)
> >  - Use per GT list (CI)
> >  - Reorder put
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 145
> > +++++++++++++++++++++++++-
> >  1 file changed, 141 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index 070d2e2cb7c9..ced58f46f846 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -6,15 +6,19 @@
> >  #include "abi/guc_actions_abi.h"
> >  
> >  #include "xe_device.h"
> > +#include "xe_exec_queue.h"
> > +#include "xe_exec_queue_types.h"
> >  #include "xe_gt_stats.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> > +#include "xe_guc_exec_queue_types.h"
> >  #include "xe_guc_tlb_inval.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_mmio.h"
> >  #include "xe_sa.h"
> >  #include "xe_tlb_inval.h"
> > +#include "xe_vm.h"
> >  
> >  #include "regs/xe_guc_regs.h"
> >  
> > @@ -156,10 +160,16 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> >  {
> >  #define MAX_TLB_INVALIDATION_LEN       7
> >         struct xe_gt *gt = guc_to_gt(guc);
> > +       struct xe_device *xe = guc_to_xe(guc);
> >         u32 action[MAX_TLB_INVALIDATION_LEN];
> >         u64 length = end - start;
> >         int len = 0, err;
> >  
> > +       xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
> > +                         !xe->info.has_ctx_tlb_inval) ||
> > +                    (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX &&
> > +                     xe->info.has_ctx_tlb_inval));
> > +
> >         action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> >         action[len++] = !prl_sa ? seqno :
> > TLB_INVALIDATION_SEQNO_INVALID;
> >         if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > @@ -168,9 +178,11 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> >         } else {
> >                 u64 normalize_len = normalize_invalidation_range(gt,
> > &start,
> >                                                                 
> > &end);
> > +               bool need_flush = !prl_sa &&
> > +                       seqno != TLB_INVALIDATION_SEQNO_INVALID;
> >  
> >                 /* Flush on NULL case, Media is not required to
> > modify flush due to no PPC so NOP */
> > -               action[len++] = MAKE_INVAL_OP_FLUSH(type, !prl_sa);
> > +               action[len++] = MAKE_INVAL_OP_FLUSH(type,
> > need_flush);
> >                 action[len++] = id;
> >                 action[len++] = lower_32_bits(start);
> >                 action[len++] = upper_32_bits(start);
> > @@ -181,8 +193,10 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> >  #undef MAX_TLB_INVALIDATION_LEN
> >  
> >         err = send_tlb_inval(guc, action, len);
> > -       if (!err && prl_sa)
> > +       if (!err && prl_sa) {
> > +               xe_gt_assert(gt, seqno !=
> > TLB_INVALIDATION_SEQNO_INVALID);
> >                 err = send_page_reclaim(guc, seqno,
> > xe_sa_bo_gpu_addr(prl_sa));
> > +       }
> >         return err;
> >  }
> >  
> > @@ -201,6 +215,114 @@ static int send_tlb_inval_asid_ppgtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno,
> >                                     XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > prl_sa);
> >  }
> >  
> > +static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval,
> > u32 seqno,
> > +                                   u64 start, u64 end, u32 asid,
> > +                                   struct drm_suballoc *prl_sa)
> > +{
> > +       struct xe_guc *guc = tlb_inval->private;
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +       struct xe_exec_queue *q, *next, *last_q = NULL;
> > +       struct xe_vm *vm;
> > +       LIST_HEAD(tlb_inval_list);
> > +       int err = 0, id = guc_to_gt(guc)->info.id;
> > +
> > +       lockdep_assert_held(&tlb_inval->seqno_lock);
> > +
> > +       if (xe->info.force_execlist)
> > +               return -ECANCELED;
> > +
> > +       vm = xe_device_asid_to_vm(xe, asid);
> > +       if (IS_ERR(vm))
> > +               return PTR_ERR(vm);
> > +
> > +       down_read(&vm->exec_queues.lock);
> > +
> > +       /*
> > +        * XXX: Randomly picking a threshold for now. This will need
> > to be
> > +        * tuned based on expected UMD queue counts and performance
> > profiling.
> > +        */
> > +#define EXEC_QUEUE_COUNT_FULL_THRESHOLD        8
> > +       if (vm->exec_queues.count[id] >=
> > EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
> > +               u32 action[] = {
> > +                       XE_GUC_ACTION_TLB_INVALIDATION,
> > +                       seqno,
> > +                       MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > +               };
> > +
> > +               err = send_tlb_inval(guc, action,
> > ARRAY_SIZE(action));
> > +               goto err_unlock;
> > +       }
> > +#undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
> > +
> > +       /*
> > +        * Move exec queues to a temporary list to issue
> > invalidations. The exec
> > +        * queue must active and a reference must be taken to prevent
> > concurrent
> > +        * deregistrations.
> > +        *
> > +        * List modification is safe because we hold 'vm-
> > >exec_queues.lock' for
> > +        * reading, which prevents external modifications. Using a
> > per-GT list
> > +        * is also safe since 'tlb_inval->seqno_lock' ensures no
> > other GT users
> > +        * can enter this code path.
> > +        */
> > +       list_for_each_entry_safe(q, next, &vm->exec_queues.list[id],
> > +                                vm_exec_queue_link) {
> > +               if (q->ops->active(q) &&
> > xe_exec_queue_get_unless_zero(q)) {
> > +                       last_q = q;
> > +                       list_move_tail(&q->vm_exec_queue_link,
> > &tlb_inval_list);
> 
> It would be nice if we could consolidate this into a single list
> instead of moving things around like this, but I realize this makes it
> easier to track the last active queue so no issue...
> 

Yes, the active check is stable exactly once, which would make it
impossible to find last_q if we do two passes.


> I don't see anything blocking us from deregistering a queue though
> after it has been moved to the tlb_inval_list here. Should we add that

The xe_exec_queue_get_unless_zero is what makes this safe.
Deregistrations are now completely tied to the reference count, which
changed here [1]. A reference count of zero means all jobs have signaled
on the queue, so there’s no need to issue an invalidation.

[1] https://patchwork.freedesktop.org/patch/697820/?series=155314&rev=10

> seqno_lock in the register/deregister routines to be safe? Or maybe
> block until tlb_inval_list is empty? Or if I'm missing it otherwise,
> how are you preventing the deregistration after this is on the list?
>

See above—I’m pretty sure this is safe. Refcounting tricks wouldn’t be
my first choice, but a cross-component lock would be considerably worse.

Matt
 
> Thanks,
> Stuart
> 
> > +               }
> > +       }
> > +
> > +       if (!last_q) {
> > +               /*
> > +                * We can't break fence ordering for TLB invalidation
> > jobs, if
> > +                * TLB invalidations are inflight issue a dummy
> > invalidation to
> > +                * maintain ordering. Nor can we move safely the
> > seqno_recv when
> > +                * returning -ECANCELED if TLB invalidations are in
> > flight. Use
> > +                * GGTT invalidation as dummy invalidation given ASID
> > +                * invalidations are unsupported here.
> > +                */
> > +               if (xe_tlb_inval_idle(tlb_inval))
> > +                       err = -ECANCELED;
> > +               else
> > +                       err = send_tlb_inval_ggtt(tlb_inval, seqno);
> > +               goto err_unlock;
> > +       }
> > +
> > +       list_for_each_entry_safe(q, next, &tlb_inval_list,
> > vm_exec_queue_link) {
> > +               struct drm_suballoc *__prl_sa = NULL;
> > +               int __seqno = TLB_INVALIDATION_SEQNO_INVALID;
> > +               u32 type = XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX;
> > +
> > +               xe_assert(xe, q->vm == vm);
> > +
> > +               if (err)
> > +                       goto unref;
> > +
> > +               if (last_q == q) {
> > +                       __prl_sa = prl_sa;
> > +                       __seqno = seqno;
> > +               }
> > +
> > +               err = send_tlb_inval_ppgtt(guc, __seqno, start, end,
> > +                                          q->guc->id, type,
> > __prl_sa);
> > +
> > +unref:
> > +               /*
> > +                * Must always return exec queue to original list /
> > drop
> > +                * reference
> > +                */
> > +               list_move_tail(&q->vm_exec_queue_link,
> > +                              &vm->exec_queues.list[id]);
> > +               xe_exec_queue_put(q);
> > +       }
> > +
> > +err_unlock:
> > +       up_read(&vm->exec_queues.lock);
> > +       xe_vm_put(vm);
> > +
> > +       return err;
> > +}
> > +
> >  static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
> >  {
> >         struct xe_guc *guc = tlb_inval->private;
> > @@ -228,7 +350,7 @@ static long tlb_inval_timeout_delay(struct
> > xe_tlb_inval *tlb_inval)
> >         return hw_tlb_timeout + 2 * delay;
> >  }
> >  
> > -static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
> > +static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> >         .all = send_tlb_inval_all,
> >         .ggtt = send_tlb_inval_ggtt,
> >         .ppgtt = send_tlb_inval_asid_ppgtt,
> > @@ -237,6 +359,15 @@ static const struct xe_tlb_inval_ops
> > guc_tlb_inval_ops = {
> >         .timeout_delay = tlb_inval_timeout_delay,
> >  };
> >  
> > +static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > +       .ggtt = send_tlb_inval_ggtt,
> > +       .all = send_tlb_inval_all,
> > +       .ppgtt = send_tlb_inval_ctx_ppgtt,
> > +       .initialized = tlb_inval_initialized,
> > +       .flush = tlb_inval_flush,
> > +       .timeout_delay = tlb_inval_timeout_delay,
> > +};
> > +
> >  /**
> >   * xe_guc_tlb_inval_init_early() - Init GuC TLB invalidation early
> >   * @guc: GuC object
> > @@ -248,8 +379,14 @@ static const struct xe_tlb_inval_ops
> > guc_tlb_inval_ops = {
> >  void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> >                                  struct xe_tlb_inval *tlb_inval)
> >  {
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +
> >         tlb_inval->private = guc;
> > -       tlb_inval->ops = &guc_tlb_inval_ops;
> > +
> > +       if (xe->info.has_ctx_tlb_inval)
> > +               tlb_inval->ops = &guc_tlb_inval_ctx_ops;
> > +       else
> > +               tlb_inval->ops = &guc_tlb_inval_asid_ops;
> >  }
> >  
> >  /**
> 
