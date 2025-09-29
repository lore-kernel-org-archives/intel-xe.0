Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FF6CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 07:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC6910E31C;
	Mon, 29 Sep 2025 07:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkSlpGJ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC96310E224
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759132019; x=1790668019;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3JuiVhz9ilnucl07Wd9rn2CdJMCmCUi+4SWwAKRClM8=;
 b=XkSlpGJ2KC0QdVmpAmq9CVyk++KWN61qtfzE/SIoqB2t+bNCMj6Uv2pI
 SElV/vS3VFNyfa4ItGGdT8QgpRVPm7tAc+eE3CHS1KMTPK6+wHqaH3RlA
 Bqxdf8AonebRqtr0lMrsrA+1sqlCinH01vThSFtxdgAOOriXdhM3EoEb/
 h/Al9JNmRUycU2rmvY9E5oWsDGJrdEkcGxIAI3SdAz1x93GDjMRi9wB9h
 wJALQE4K21/OTscLAlNJaMF1LkyD39kL/fyHCMeRvzEdPlnxIQbluJvb5
 Zx3e/gscNBKaMLPcC7esk6ItgF8EBpGQb9wXSYiMkMjN20adqz7NNQqPD w==;
X-CSE-ConnectionGUID: 0Ct/SJC0RiynV7tCcXVSng==
X-CSE-MsgGUID: huWcQcU1QIm8U3/xXSPJQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72048509"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="72048509"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 00:46:59 -0700
X-CSE-ConnectionGUID: fau5vT/iSuymyYjo81o/UQ==
X-CSE-MsgGUID: VpI4UIzpQoiJvLxRlwJjgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177768720"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 00:46:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 00:46:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 00:46:57 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 00:46:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJpN+sScEY4cpRglKBQonoVRSQmnCgE5zCD50MJYqHX2jKAKJHUT6Z9HSaemOgmx7YUUdnhoHAfJY2mQgTj/bypY6u4VWM0eZHgeyKSNK+vfH63HhfDnCfkx1/XFpx9zs17rMwdirYypeYAt2Irn1Q5ir02cUSUfl9j6C+/ULnOJRih61xgBFZptxq6G3dqNTBkyZEoy0+zFcNxX37dF00Ec2w/xjsP8e+V8+OU8itqvAVNq0TLo36AGwsENh6j3/kE3RtyOZcXrJrHCmVf3D9ZE8htzWedH8zv0nY06CKTZvRagHA6F0RY6tOU12TjHsHiwbKrZF8tGC/rxJS1bcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t2QBS09U79ORDnDJ5Wd6+804nminnQXlxyn4RCfyzM=;
 b=EPoqkOnR1wTMYC3+YapGoTEa8nCvLmfhrmK70IW9ex6JvWrpX/73gBat/c7s7tOj1FQZz/+zKCP9WVwBsHo/kheXAFFTUFhIXPysaN8fO8d6UVg0564sxa7FRRr7IFfLetpnwlV4+JIzazQc4INUkVCaCylp3s4DrAhnoOS9FHertIjyxM//KN3LCMAer+92CIoQ9b6cBalh51pv0teHXZ763avWNyVhYU7g0r92Oy3EB4SFGJ3CSx+W1kcWrI8B67ljNpQvhMTSHXeg8VvpYjFtYCE2OEZ6cy7QuQ4EMZr+748T94cU9hjkswyHZAcn5U6h9ardqqPtqL9DP75C+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7721.namprd11.prod.outlook.com (2603:10b6:610:12b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 07:46:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 07:46:53 +0000
Date: Mon, 29 Sep 2025 09:46:50 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/vf: Rename sriov_update_device_info
Message-ID: <20250929074650.bslznnd2g5hn3p7g@intel.com>
References: <20250928174811.198933-1-michal.wajdeczko@intel.com>
 <20250928174811.198933-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250928174811.198933-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0291.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f95d58-63e8-4409-8462-08ddff2c5b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0JsOHJXUzRZdGhtbmJYL25rb2lWVW95enNSWFFMUUNNM2tMekdmZXhUUUxT?=
 =?utf-8?B?Z2l5V2trbEdUYjkyV2w3SllzL3Z4UCtFZ1YycUk4YSsvMWc2Mk1xd2dQSWls?=
 =?utf-8?B?Rk80TFBZWW5GOU1TTElUbDB2YVZDWmVGZ21WUEEycTdsampYS20rZ2FPUERN?=
 =?utf-8?B?bVhvZXFRSTY5a3NJRkFxem5MQzNQbVFiVU1XeHA1d01jRC9KLzFSM05DYVpT?=
 =?utf-8?B?RHU4eU9kMHpGY2xGQUtXb1FUYnZWOVl2MERsc01hdnZhdTR4LzNQdmcrKzU3?=
 =?utf-8?B?ZUdHWE05RDlWU1lNVUx3djcwWm96bnhDSG1YbmEvd3h3dDhTMmtWWWxRNkg1?=
 =?utf-8?B?Ym1mMHN4dkF5TTl0TTh1d28xTCt3aEhmN0pzenRMdUN2cDNpalI5QXNEamF1?=
 =?utf-8?B?bUtOdzlqVVpNR3ExajVmL2lxSkJRRzR2RjE3U3BCUEhtTk44cTZwYWxnL0hI?=
 =?utf-8?B?UUp6Z0x1SWtDcm0wdTl0bGFmSEF6ZjdoaFNEZndNdUJ3bzlhSjRYbml6djRi?=
 =?utf-8?B?Q2ExcUFLNEdvcDZWYWpjUWcybVg0U3BlaTdKdFlWdi96R2Fra0VpUjhGbVBa?=
 =?utf-8?B?TmYyM2hvdVV1SExBdytsQTVMUitQWm9uTDY1b01NK0J4aFdZdzc2blpZSmo1?=
 =?utf-8?B?VHlKcWErZ05XNFAyL2RxdFh3b3hNTjc2SmM3cFl3blVTVVpLeTY5S0h4eVJZ?=
 =?utf-8?B?TmdkVzE2MitWOW10ZnZCakNSMVdMZnphTS9KbnExUXQ0VE9VTFozN1Q3RW1q?=
 =?utf-8?B?TWxFeGJWdHNIdDJWQWxkNUxPQmw4enl3elAvOTcvemlwU0dpbndNTlBzYit6?=
 =?utf-8?B?K0tqNkN0bjMrb2Q2RzZnTjJ4K1prYnF6Z1kxTXVFZ2s1bW01bG9iVFBFUVVL?=
 =?utf-8?B?aGJXVXRHMjZJYnNLT0xYekVKcHlSNkhnVWQ0aVpKRHZmS3JrdVVXUGQzNHpz?=
 =?utf-8?B?bGF1L1ZhTFgraEtlekFZVm1VQXlkaEFocHlwaHdPTHpjV3luRExvUnVudWxr?=
 =?utf-8?B?dVlwUkY0cU9EdEFxdmU4VnY5NzZWc2djZE9aNWxDNC8xcWVXMlFKS1lsMXFO?=
 =?utf-8?B?VE1ha3ZwV0J4MnBTT0JBZGJVNVRmVkQ4VzNYWDgzOUtqSGZqckp6SWx1QTBh?=
 =?utf-8?B?ck5Ub3ZHQzhneVZkYlpIcnIxd3lnK1dsaW5MbW0wSnMzTFc2OWU0OE1USmlG?=
 =?utf-8?B?OFZQVDN4MW5scE4rcTd0R2VKblZUSFBhcm9HVlFsZ25NYmpNZi9HRVRIZEJH?=
 =?utf-8?B?Smh6NU5HaVc0WWk0aEZEK0MzWERFdFBEM1kvOG92NEV0Vy9pZmZMSHdSNXRk?=
 =?utf-8?B?dFJhVGtCMWRlTFVYbnYrOHkzbWljWVJLOExKTDFtTm1jTmxMTkJwZ0lRMkdh?=
 =?utf-8?B?cklDeWJkQnk4aHBQV3pYZFZLSDRWZG5ONnJEbVBMaTB0R0tDbHhyRUpIak1u?=
 =?utf-8?B?RnBEL2FPNGtaenJWcXpOTks3T084dEJUSTdZOWJwSnptaHdheHV1M0tVenlr?=
 =?utf-8?B?STZEUVQ2UlluaXZCc1VmQ2JocVpFd0luRFNWVzljRzBzMlJwODBTdGFFRkdE?=
 =?utf-8?B?bEorOUdVUzluVHlJN2F3ZHBrd09Ja3hLL2tjWktZRFpqdGFkampVaStBeGVS?=
 =?utf-8?B?Z25GNk5JSTFlTEdHb0N5YWNxZmxybHo1RlJrRWdCODhyZnNpdlFSSmtURjBu?=
 =?utf-8?B?Qnl2Rm14UUVndGxORGJacHpKK0xoNHdVVzZWaG42NUV4cEd1Z1B3QkFNZ0Rv?=
 =?utf-8?B?dURXSlAyMVhEVm4zZFEyODdIa0N5cDlYNE9JRG1qZ1hoRStmV1JWUE9IbDV4?=
 =?utf-8?B?N1BMWXhRTFdEY2pzM3lKdURBRm9MTUYyc3BycVQvbDluQTljZnJqYkhIZ1F2?=
 =?utf-8?B?c2FmdWduRFB6WGVBK1d3YVN5ckk2QW1nZzFXdGJRVXFNbmFaMTdTNjNIcEJB?=
 =?utf-8?Q?KS3wKzblY1VrXJpN+ImOh93h/s8WpoCQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGg0VUEyRXEzaVQ5SXlodENVOGZEdVU3QXhod1FsUUNzckRHc3N3dmlEemNS?=
 =?utf-8?B?MUFGVUNyK0prZ3QxSTB5c25PWXpZUHRpU1lJRWJqcTRKWWlEU1JXVXY4cnJl?=
 =?utf-8?B?RXg0VVczSXMxL0pMV1JrWFpCRnZKK29sOXVIcXF1MW4ranhscUhKbFV4RWgy?=
 =?utf-8?B?QUNlcnBFVHh1cXp6Q2toQUU1bitPMExQWHF2eVRMZWpDSk9jcTRNQllOcUhP?=
 =?utf-8?B?Z3ZHdS9xSUxaMUNWWG10RFF5Z05UdnFCVWlXcURvMWtrL2VQcHBpanFRSUxN?=
 =?utf-8?B?L3J5TFk1TUwxUWlZMTlwcE1pUWdoY09WT29mdFp1Ui9XSit2cVZJTHdGWEQr?=
 =?utf-8?B?V3dVV0k2L1RDN3dSWjgrYUZEcXVSZGRUZmhuUllDWDQ2WFBkTlBidXArVGhU?=
 =?utf-8?B?cnlnS2ltQzFCTWtUSHNpczZENGxOMGg5Q3Z0WU81S3hGSXU0WElRbDlLbDNU?=
 =?utf-8?B?T1VmYmtqMzNtZ2VlNzNsZFFxKzBGVkhaRXdDTDZjV3pxQmt4eFVZbjJQZk1D?=
 =?utf-8?B?MlRUeGtNQXF6blFWanV5ckkvRk9zSlVjSzkzRkxSbktiZGZTWU54aHVhMWVn?=
 =?utf-8?B?NmdrM2VoRmpqMFM3am1vanZpNHphdldsdTdmK3NMWUFIU2pDUGs4cEVHdnow?=
 =?utf-8?B?QTFiU0cxSEU2WFdrMHFySjg2V0g1S21BRTRPTUZRV0hBQlR6enpnM0J6VEpJ?=
 =?utf-8?B?cFJuSllQRTBsZVlkV1p2WnNrYUlibkVyNEk3T3dLWis1QjVWUFN6ZlhDcllT?=
 =?utf-8?B?T1E2WGYvdU1aUUNoR3U4cXBPejFQdDN0MmZhZFVqSFM1bEU2VWdIeGRnVWNl?=
 =?utf-8?B?SzhrRzZtSGNUcHVzK0tQQ0RMQjMwLzNBU1pxTU5HSGFjUldDTXZHZ3h4VE1W?=
 =?utf-8?B?Nlk3cHhZL1JiRlRJUlpOOHBrV2JXMmxDejFjOGQxWnVWM2NSYXlxbXRxbGUz?=
 =?utf-8?B?bDR5c29Cb0xWdXhqQUR4M0UrNXpPbTZNbXlNeTJiWmdkcE05OHg1S0ppbnMw?=
 =?utf-8?B?YXhSazlYYjhXNE1ZVncyck12M2N5UXBsK0lvM0FZLzlHdkJwbi9BWWs5R0FJ?=
 =?utf-8?B?WktnK2JDR3VSVThaSDlsVVlEZy9DdWF5NHlUL3pxOXVxODBGSlEvR1VOeTRq?=
 =?utf-8?B?MjlRVWRwa2I2TXFiS25SQ2tHdll2Qk9jR09PNm5HS2NxTUt3dzBVNzJhQVRs?=
 =?utf-8?B?cG4yUlBKa29XeXVrZXhRai9JMy91eS96MzlzeVdkbW5OU0tsS1JoaVhVMTJw?=
 =?utf-8?B?ZWl0OHJBZHlsNUFiTGxrM2JoT0hWNWhjVlltekZGOFJZN0VtN1B0SXMzdzBz?=
 =?utf-8?B?blo4dFZUQUtOMW0rZmRZNURhZ0tHc3ovKzBkalo2dU8veHczeERPVkVONWNL?=
 =?utf-8?B?dlBWMHJnRVRCYVpKSDk2aGlBQlBKMXdTM1FRdmdaYTBzV3ozYkRpSVkzbG15?=
 =?utf-8?B?WUlvelQzTE93dDJGSVlmM1ptaGVFdnh0SVlYL1phZTVJc3lmSjQ3dlIxdDBx?=
 =?utf-8?B?Y2kyeVk0cTRIT2d0aDdpTUFlbkRTcWozRGl6cnRMQ01PdW94bUtPUGswNitG?=
 =?utf-8?B?OEEzOHFOQWtPNjA0YkJkZVZrMVE4VjNOTzBwckk4NDhVNUpqRlluN05iL0do?=
 =?utf-8?B?eTVWaFBYM1lXSVVrUVZFK2pwNXpqYi9pZGxhZVdyR09vNmNlaDR0RlNPd3lj?=
 =?utf-8?B?Y1g1U1BEdWt6UXIvVEdETnUrRzBwZllNbFZYNDR1REVQaEV0NWhNK01PMFI2?=
 =?utf-8?B?a0lHNTE5a2hKMVYwRVpuL2s2TmVxb2ZXdFAvMklUY2JRTnU3VFJxZ0t3ZVRz?=
 =?utf-8?B?QmtjVzg2Qm1HaElBTTZTQXJLYUxlWDQyQlM4RU4vbjhCOW9OSFhuQmlpaFBU?=
 =?utf-8?B?bytzVG1aejBrYVdpbjJwUkx6YzhuZkdRVGJTOU9mTUtGR0xrblRjNDUyOTN6?=
 =?utf-8?B?b0FjS3lIV21yS0JjU2FoOUlNM2xRWlZTa2FLVGhXb2Njai9CYkdMUGZ4YUJl?=
 =?utf-8?B?ZGY5bmQ5WERTblJsbHhDTFByNWFFb09WVUl6cFgveDNOYTBjKzI0N2xsQmgv?=
 =?utf-8?B?QUE3Z3ZNTk45MUt1a1YvRlJLN3pDMklUWjNvWk42V015aDVCd3BUY3JkMXhm?=
 =?utf-8?B?MjlLNXJxVXdXT2JLbWVLViswa1E2angwamJVVjhoblpVRElVVERLblgyRS8r?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f95d58-63e8-4409-8462-08ddff2c5b36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:46:53.2017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EnNnn+3a7jS0ORdakAIW/ipVQfrwsOwXE38Ra8aMDw1R3Pb5xPIt6NTBYgUeV/VEFEjcpd1F8RpvgXAeeB3vaOW4XpPxE5/n1EX8p8gNnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7721
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2025-wrz-28 19:48:10 +0200]:
> This is a VF only function and its name should reflect that to
> avoid any confusion. Move the VF check to the caller side.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 09f8a66c9728..0421042597a2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -688,16 +688,15 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  }
>  ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
>  
> -static void sriov_update_device_info(struct xe_device *xe)
> +static void vf_update_device_info(struct xe_device *xe)
>  {
> +	xe_assert(xe, IS_SRIOV_VF(xe));
>  	/* disable features that are not available/applicable to VFs */
> -	if (IS_SRIOV_VF(xe)) {
> -		xe->info.probe_display = 0;
> -		xe->info.has_heci_cscfi = 0;
> -		xe->info.has_heci_gscfi = 0;
> -		xe->info.skip_guc_pc = 1;
> -		xe->info.skip_pcode = 1;
> -	}
> +	xe->info.probe_display = 0;
> +	xe->info.has_heci_cscfi = 0;
> +	xe->info.has_heci_gscfi = 0;
> +	xe->info.skip_guc_pc = 1;
> +	xe->info.skip_pcode = 1;
>  }
>  
>  static int xe_device_vram_alloc(struct xe_device *xe)
> @@ -738,7 +737,8 @@ int xe_device_probe_early(struct xe_device *xe)
>  
>  	xe_sriov_probe_early(xe);
>  
> -	sriov_update_device_info(xe);
> +	if (IS_SRIOV_VF(xe))
> +		vf_update_device_info(xe);
>  
>  	err = xe_pcode_probe_early(xe);
>  	if (err || xe_survivability_mode_is_requested(xe)) {

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
