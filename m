Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EF8C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 07:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC89E10E185;
	Tue, 13 May 2025 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpG8h5sX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B5A10E185
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747120441; x=1778656441;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7wdf1JbDvYyugFx84e/XggQodaHprfMR3VU4SHvQ43g=;
 b=KpG8h5sX5vRr6A4eI/Vvp6pQPvxpu0REED0b9QT0hdyV3/TgYclJsH5M
 5K8MiMvHvEU6F7j6VvpKWOpcZ0mEM6gbwBneQeNPR+3x2979PNAtMqyEb
 azTFYBRfDUrUFUf/mUhoeqG3RyLlQW9LH3ElsghF15CO3iUwl/f4ErjSH
 xe4ehXUHpex7Hu7/GX277UabjrorIxcUwv7wmC6nueLVQMhwpkpf/q7eg
 IxxSJ8Ii7lPhO1ndutxRRhjByfNAIUCqDpC9WXT2fksDbGzoBBd947Sez
 Ip9zwkNdj5f5W9Vh2G2YeeEQNGDOq3N4nUUhlL11lHKi1THAP9FJihSQq A==;
X-CSE-ConnectionGUID: 5pp7AQ/4TV6p2SDHMBp5nw==
X-CSE-MsgGUID: PMI60DZSS7Ce7SHfDYR15Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48204285"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="48204285"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 00:14:00 -0700
X-CSE-ConnectionGUID: eGRDlB4SRCun+674LcSPbQ==
X-CSE-MsgGUID: YQx+Cm7DSOKI5Z+DiRlQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="138551237"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 00:14:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 00:14:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 00:14:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 00:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJwdbpmuzK6c+bvawfjKFLeWqoHOowRhKft+5JC/TqBQBIMcRmcYUhBnKBY1cPf5VrdJFNIaRPsp7B/8dbULC62oWWy+f1uzD/f2fYqwswwoO193WMVXCKigED2kw8Wiy5Z4pspWW8fPIAYIDOanNbT0QGRFoV7upRs8mUv/Bxfx1fXsEefRCKCmpOm+U3aQJB85a6trfmEGbfahozC54FBruLn4PJOT9sKkFYW7tUU2eZDUm3oSe+kHe0DneyVheQQU5ruUFSBEJQaehdZIBeiRrM7PABXst/RoQKDMjF8z1S3Nd8TbkJNYZyHderDlPLUyhxafG5uA8QO67gcI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNEPndzmUziW62jrPN58Mx0TFnWBRx/ESOLfN/3kexk=;
 b=tpoCUplLRYG+MhwszawdS2zFqTHSay0J1EKR7O/8Jd0U75PESbthy3sJ04evOzyJ4EsT9aNHSMfnrUPHOiOy3w4bMroaeu3vDRDEwwjtV6BjCHV0jc/tje1on1seKOk3NwFVaTeXKEg0PYUeDtoXMgQW1/nsxHbi8h0Qbc4KOyv2kcwcLiBZSVcGRovTEOTgECCnq3k6eNKh6fVDC5yMyh58IrBExZtFnkGPIfFc4JGtJ4xMFIm1NyrfKVfPGwc+zxvdabEGoCAjchcFh9nDqdM6LUIE3Xhy0GrdeMczhVBmp5gJV1jeeAwh9CbxowLkyiLNUWz/uIcLz5gU34qJow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ5PPF4DC104A0B.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::827) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 07:13:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 07:13:38 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4] drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't
 available on the device
Date: Tue, 13 May 2025 09:13:21 +0200
Message-ID: <20250513071321.700464-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0630.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ5PPF4DC104A0B:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a42f73-53fd-4faa-1113-08dd91edaed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2JrKzBTNm9VVU1WdWVzM1NqZVJua2RmTGEvd3NQdEd3dmdqTmlLM0FTdWtU?=
 =?utf-8?B?MURrNnR6Qk5lR2YwR3haYlZUcE5mMktyNVBobkNBY0xaUWxDa0NRcVBja09W?=
 =?utf-8?B?ZWlqaitwanVhZDJ2RGpEemVKY3ZMR3ZMWEc4YWx3N3FyQTBNblZpQUdzT3ZH?=
 =?utf-8?B?M2U5b0NFekhrQ296UitEQ0FDdVFjT2lsQmE2cFRXRDdUeXYya3psa1Nsd3dy?=
 =?utf-8?B?WkJ5QzZ1M0tZM24vMFF0cTVocGs1VzcyMUUwSnUyem0zZTRPc0tlQi9ZcG45?=
 =?utf-8?B?UC82ZEFRMG14WWlhSWM5dkdrSTFuTm13RGJobUUxQ1pyRHQ0Z1NLQVl1TzNI?=
 =?utf-8?B?eEtlZndUUGhkamQ3aUh4bDZhZkJOQTg3V3dMTDdtRzBGTVA1Y00rQm13eXB2?=
 =?utf-8?B?Zyt4NVFCSk1kNWZ1L1QvckRXcVNvVXZPRmlyRWUydlVSWWhjeXJPNDhxc0dh?=
 =?utf-8?B?QUl3c2tvWlkrTkozeGZtTkdlclRKMk8xM1pMYXlIeXFEajZnblNsSWgvZnJw?=
 =?utf-8?B?dCtYWTFNZjAvMzh3eTdaRnI1MW5DaVBEN0JjQzFVcEcrOFhTRHdRYXhvc0dv?=
 =?utf-8?B?UlZjSStPVC9PeU1TYmJyN0VvdVJHTkp0c09jQkh2ZEN5Szk3ajUrRkU2WDEx?=
 =?utf-8?B?cUE2YXEwY05pV28rSEUyclR5SkdabmJmMVozSS9hTnpYZitwMDFybEZYdlFy?=
 =?utf-8?B?R3I1cmczR0NEd1M2dEZTMjIxOG9meVREdkdzMXgrUE1zL2hQZkJlbUcwSHov?=
 =?utf-8?B?QitlcHE3QVlveS9TQ3RKemNzTWx1VVRKMjF2dkNXV2hWb3ZhWHpFcHdSZlQ2?=
 =?utf-8?B?a250YTFUbXBwLzdLR1lMdmhsSUI1UElXbCtZV2o2MVhDV3N4UU9ZNHFEaDBI?=
 =?utf-8?B?Z2hPeWk0ZHNtcmxqTWpqbUhaRnhSdzRIYWJSdlgyRzlyUEZZR0ozejJnYTlR?=
 =?utf-8?B?ajR4d29uL2JXYW5iRUFpOThjWnpRZUJuME8wUUZCRWQ4ZzV6VEFNVXova2ta?=
 =?utf-8?B?WThMWEdvZ1hubWJqZGtoY3pMbGJnWE5NN2ZIYmM1M3FMMUFWYi9pWG80UlBK?=
 =?utf-8?B?bUl4aFVGcGI2SlF3UnUwMytpVDhaYnJ6Q1BqVDN1b2QxemRNYWZiMlFlQWxz?=
 =?utf-8?B?RlUxYmlRWmxsc0lweEdERzF3bkIzSHc0SHBNRkFhV2x0TEthOERnK25kMjNK?=
 =?utf-8?B?MGxRMlpHcGRqYTQzcmFMdTkraVlEREFzZFZiNC8rWHdUMGFqaW5SYW5zMlZz?=
 =?utf-8?B?WHQ5WHA5RDkreHgvbEN6TUdyU2c3dG5vanBmWXQ0S3h3WmRkWjRleDRDU2JV?=
 =?utf-8?B?U0szZnhhSVJmMTJsb1NhTmtycTBxeDJTQzRnM3VucFNxMFo3MVhLYVNBUXdE?=
 =?utf-8?B?cGZ1Mkd6Tm9QRU5td0RRNm9Ed0g1YzVYZkhCWi8xeDhlSFJUWXovbFM4UzR4?=
 =?utf-8?B?alNTa3YyaUc3eTllQlloWnF6ajkvVTErSHhqaStHeUJ3Q1ViWkI3ZzVQanlp?=
 =?utf-8?B?N1pGNUt2bVJuYWxWeWdtaFBEbWs4YWsrSVdrUjhsbUw1OGE0VjU2T0hVUDJI?=
 =?utf-8?B?NkM1VHgwK2JHQ216amYwYjMzM1AvYmZ6bysyUUtianczUzVNMXBROU5OdTZl?=
 =?utf-8?B?ZHorRTMyTHBaOGFzcVAvVHNhRVVQYVJ1RWN0Uyt3bmRMQzZ1SUhScGxiRlBu?=
 =?utf-8?B?YS90amxMb2dsL2k3Y2FYM0RSaHdjWkMyUWtHN2tVUml6UytMR05xemN6NXpi?=
 =?utf-8?B?TDI1QkRmdFdDUWR1dUVDQk9YTEU2MDFpV2ZlaThTUjcvaFRvVWxCVDdUdkJs?=
 =?utf-8?B?QzFKV2lCSjE1bnZSRjgwdXhhQ1lPcnlzR09mbi9mRjRZUThyWmJoWWttZXNv?=
 =?utf-8?B?SWhlQmJaeUtpM2p0ZGZjMVpzL29kY2N4VjJZdlkrNElaTzRabUVYVlZtRHVC?=
 =?utf-8?Q?6LE2QwMgtoc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNPaVUxR1MrbHlkM041Q0JON1d6eXh3ZUxkb1BOMjBORzZsQW0ycUdNN2g1?=
 =?utf-8?B?bThtRVpWYUtMTDhDZDBia1piZkdHS2FyWm9RZmk5dHZReFU1YURET1JmKzlD?=
 =?utf-8?B?UlRqZThGZCtLQUtaMXU2UVh0cGh6MGdHSS9Oelcvb3BRMGtPSjdmTXB4bzA5?=
 =?utf-8?B?aUd5SE9hQ2ZOd2tvR2RQdjBiK1dmdm9tVHk3VHRNSFRrQVZHbVFyRitMV2sx?=
 =?utf-8?B?V3RCK0ZYbTdMcG5FMGZVNGxpNGc2djRxc2VVOVVMTC9lOUtDdlVQQVEyUzlm?=
 =?utf-8?B?NXZOUXdDc1gxUDJLYWpYaHp3R1EwRUFaaUZIR2M1eVFuaFJISFVJQ00wN2Yy?=
 =?utf-8?B?YXF6OENUMXR1YVR0aHVTdWlISWdiN1VYQnE0MjJyTm8wK2E2ckMrTHMvSjlB?=
 =?utf-8?B?NTllTDZCU21Td0FtckRteC9FWWRvT015Y0NVNXZORUt3cDA4THk1a0RGN1N3?=
 =?utf-8?B?d016T1NpL3Jyd2Y1SldCd2RDTTkybE9UcnFsY1p1blZTOXZGLzg1K05qV2sy?=
 =?utf-8?B?Y1h4b1UxUDUzVlQ5RjlTclYxaHF1WDk2dHdMcnFZdkxhajNlN1dJZy9TZ0tI?=
 =?utf-8?B?NGRqOFBvRmZyWG5LaldPbTRVelJSNHNncWFYYzJPUnRrcENTbFZXVFdjSnBn?=
 =?utf-8?B?MTBVc1F2alZzNmJ5ZjJZbXlEeFhlRWFIRUxSY1dIcnh6ZkxFZy9iQlZodC84?=
 =?utf-8?B?bTlWUFhISlV0QUVCZWxieUE1STN0NjYyeXY3eWE3UXFMczFPK0RLSTlWVXd0?=
 =?utf-8?B?OThLVGtXanlMOXQ5RmpoSVpQSkVuS0lraVdXVm10T0k5UXltRnlvdC9paXR0?=
 =?utf-8?B?S0crRVFZbktSeDYwd2ZpWUtuSVlnS1p2T29PNDN5NGRZREt5WGZwR3pLRC9B?=
 =?utf-8?B?Zm9ZTWM3dWxWR2IvUDRQY1hKeXFSSTJXNllEaWcwbnlLaXpzTVRYdFFxeXY2?=
 =?utf-8?B?R3J6Z0llS2ZNTzYzL04ydHZvQmZxZzFqMEd4djhDRFlhWTdYRzBwMCtXQmZa?=
 =?utf-8?B?VUNPTEdQTVNsM0VFclN2bm0rWXdYQUU5TmFmeS9FS1FvVEFOc1BPQUtVQys3?=
 =?utf-8?B?NE1WdVQ2bEo1OWlMbTljS3JOQXBMYXRwaGoxalYrTjkyd1FTeE5nZytvZnM2?=
 =?utf-8?B?eGRLV2ZMSDROUXFVaUJyYXFKYWNlRUtHR3BTRXdGSHJiWGtsbmZ5R2VFUGQw?=
 =?utf-8?B?RzY0ZFdVRmZZM3Uwa0xacXlRZzFCdEpmMnNWK2dZQzZyektnVmFQcGlSRHNR?=
 =?utf-8?B?MTlNUDZWa1o5V0h4SUs5Q2N6eUpTdUtkSWVRUWw3dFFrVUVsQVR4dy9GeVlx?=
 =?utf-8?B?VGF4b1FmTS9SNTg2VVZCaW14UEZXcGpiLzU3VmNab3pEYXdZWHJVTVphOHJx?=
 =?utf-8?B?TUJ0L0E5RmJ1NU90UVB5Z29PR0FORE1tekppYjhpek9pMlZYWVlVdkRIZkI0?=
 =?utf-8?B?UlpQRnd3YTNsTG8vUkJHT2J5WjMycExsUEIxV3gwdm1aek1tb2lFcytFbEFN?=
 =?utf-8?B?NDAzcEhvcWNLN1g1TzFrK1ExcnJlK1RGSzRlSUFoLytMZXpxUmhvU2FjZU54?=
 =?utf-8?B?YVc5aVU0SVZkSkFlUGxsWjRXR051MmVjN0FoTzgzRXlISlQrdW5MWUlWV2M5?=
 =?utf-8?B?SW9xWG1PSTA3UWp2Vit2Zm1YcGE0UkJ6UmR6TmJ2aXhZcWhISHBVT0Z6ZGNJ?=
 =?utf-8?B?MW5XV29zdm56dThCYnlNZ0JlMTQ0eFh2TlVJcVlWQ2RGOG9LT3JYcWowQW01?=
 =?utf-8?B?R2oyU3J6bHRlV1I5SjdKaC8xL2pHdkRzdHRyaXp5QTROY1BHR1FGS1lOaHl6?=
 =?utf-8?B?b2FXVlFMRzNNakFUREhWa1d2K0RYTUxUTSttQUpvdlpZRU1TVzFhaUVobzgy?=
 =?utf-8?B?TENYWnhLV1ZaRTFzN05Ja1lYZTl1MWxZckhXOS8xeHVvVHNKeUpBQU1lcDRG?=
 =?utf-8?B?K0o0czlyOXhWSkF4YWRZRnVUTHhNZGQ2U0VOaUtWSC84NzBLSXZ5LzVYVTRB?=
 =?utf-8?B?ZSsybWU1NU03R1NBUmVQWURnQ2x4SDNuN0RWVGYvOEpDNDBHbVAzUDU5dzZT?=
 =?utf-8?B?NXhWb1UxWUJMSWlqbWc4Mzh2d2VQK3BPc3FBTnZ4anFKbVFqM0Y5Wlg1YURX?=
 =?utf-8?B?VCsyc2ZJQkxjK0Z4WVgyVG55OUVXTWF6ZjV1blZTUmFPNDN2WDNvZXd6UlVW?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a42f73-53fd-4faa-1113-08dd91edaed8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 07:13:38.5141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAbIOxby0XRkFSvbu52rgLqtrk/on40EuIsBiOPMX3onjdTAY4rXNxKPT7FKq6+d3smFJ/aCfAb94qiYlDDHp/RCM6Jzpv38M3b0G+aGvoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4DC104A0B
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The LMEM provisioning is applicable only on platforms with LMTT.

v2:
 - new commit description
 - use xe_gt_assert in xe_gt_sriov_pf_config_set_lmem instead return
   error,
 - disable pf_lmem_info if LMTT is not available
v3: fix condition in xe_gt_assert
v4: rebase

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 6 ++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2420a548cacc..3556c41c041b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1520,6 +1520,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 {
 	int err;
 
+	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
+
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	if (vfid)
 		err = pf_provision_vf_lmem(gt, vfid, size);
@@ -1629,7 +1631,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
-	if (!IS_DGFX(gt_to_xe(gt)))
+	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
@@ -2163,7 +2165,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 	valid_all = valid_all && valid_ggtt;
 	valid_any = valid_any || (valid_ggtt && is_primary);
 
-	if (IS_DGFX(xe)) {
+	if (xe_device_has_lmtt(xe)) {
 		bool valid_lmem = pf_get_vf_config_lmem(primary_gt, vfid);
 
 		valid_any = valid_any || (valid_lmem && is_primary);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fe47f41b63c..13970d5a2867 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -308,7 +308,7 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 	if (!xe_gt_is_media_type(gt)) {
 		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
 					   0644, parent, parent, &ggtt_fops);
-		if (IS_DGFX(gt_to_xe(gt)))
+		if (xe_device_has_lmtt(gt_to_xe(gt)))
 			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
 						   0644, parent, parent, &lmem_fops);
 	}
@@ -558,7 +558,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 		drm_debugfs_create_files(pf_ggtt_info,
 					 ARRAY_SIZE(pf_ggtt_info),
 					 pfdentry, minor);
-		if (IS_DGFX(gt_to_xe(gt)))
+		if (xe_device_has_lmtt(gt_to_xe(gt)))
 			drm_debugfs_create_files(pf_lmem_info,
 						 ARRAY_SIZE(pf_lmem_info),
 						 pfdentry, minor);
-- 
2.34.1

