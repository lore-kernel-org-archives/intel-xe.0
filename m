Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B5FCCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 19:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8562110E06E;
	Tue, 28 Oct 2025 19:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLy8dQNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EB110E06E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761681433; x=1793217433;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lgzDtcT/LKbIbNS1k1Cz8FkcKTq0xJ2KllJIsw0u+N8=;
 b=kLy8dQNbDlQvD3/FJuV8OGXLnUbIbK3Daq48SrWxVGPloPg+fra324/L
 03BOqK1RQypubuUuocXG2Dt3TsHKdVWS2SITokJUqsUPA6axcIRodcpYu
 pvGHADvseL919iGNn4Z5Olg1d2b+vISaHqOQeMI737Z5512m3D0zbbR7D
 /xy1YnX/XxNF95Q9y48we+Ud7ZLMNfTkCNglsLJXHIJDryGrHoWaFKFQp
 wDd+PXLjQzS6PJa2/kCXUOgVEIObWfVWJCTNkEe0yUOHcOlM+USh+f7HH
 GPqGz6dszEDVf1opompgw/kI4lXTGkQgMPm5g9STjZU7WYe24YMi7al66 A==;
X-CSE-ConnectionGUID: kG9iF0XNSiS4WpcGf/LVag==
X-CSE-MsgGUID: HYU7E7pHRQSg3l71Da05MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62823336"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62823336"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:57:13 -0700
X-CSE-ConnectionGUID: axIF3jnERGal46NcKvhlsw==
X-CSE-MsgGUID: +nC6+al7Q3SgbCF4hAfJMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184624612"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:57:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:57:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 12:57:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxYVOivKH3pwHhwwYxi/ngI4oC4b5NwtynHTyeTxD+0hLD7D4UKIrkChwZH02V09c+4DtOnHVnYR3CDWLYgv0H0MyCfwiLVJ27mpzlr9YAD1Ju9FlgqjVGuQ7f/wurF7pL/Z1Zy5gp3hzCGc2CwmzH9jJnGtKTxW9Bwi5epagPRg/1uRCL8KtFr3C/6ecmlHf4YP3BgSDbEd7rV6rjvSFbvtftu0jyE05TCrWk+hkrZgnwjpxAwzT9GbNPm3JFan2K1XjifhwflB+CJ2Q8SIN+BJdzKjLumnTJFecmq4Zkv4iubxKiYhqK8KsqHbR/Vxqh0LkIXQHO+TuQM4TRt9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tpt9IYDKYeEJ6WGLcCuGgLdCE5+oQcF/MTLhm+ciVc=;
 b=rKfUIMnA5HzHHUgxMG3PIQkqkGo62XTZGIYEqeGpCcYYeueDQfVYYBDGp64etbAI+lJq9gacHLaWTpAN2wBO4YuVc1HF18J/Sfl9Z/EY8kCPv6fIr+eUkylBddnCogc23ZWmptBMEuoOl0RHWr4xMPQ3yCelklRoauPVOP6ubuv+wocCkVCQGul09zYAxyfhCtdgC05vY6NDDFC7GVTz+7WUCM4lbXd0pJGFOTZT31RHG/kGroDgBIXHM7xQYZtx/skIJm0iwoqZX/NkuSlyuV4UXGFQNugIxiV8nZ8wpT3r+VbE9x5q2xmhxCSH73YoJSSTfglq6xHNnj30j8rBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 19:57:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 19:57:05 +0000
Date: Tue, 28 Oct 2025 12:57:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3] drm/xe/uc: Add stop on hardware initialization error
Message-ID: <aQEgDjfMVDYELrWJ@lstrano-desk.jf.intel.com>
References: <20251028153820.3139977-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028153820.3139977-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9459d5ba-2c5b-4fe1-c52b-08de165c2b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUh2TlhhaEdNZUZURGVXaEpSTmttQnJ0RFBjTzc3b3ZqMm9nQmJnUzNDcVkv?=
 =?utf-8?B?TFg2Wkk1OWxQcVdDYmY2a1hhL0tlK1Y1MlpBK3hpdTRLeFFrUm5RTExDWWNq?=
 =?utf-8?B?NnRvQ0poeWk3MjRVSnBHNHpHWUxpK3hDWmZvYXgzMHJYTk12M1lDWllPb0Iy?=
 =?utf-8?B?RjZ1bUUvV0RsMWJqV3pVaXFhNE01alMrUjBSQk1Md29jbGNadW5XMDJlTnRF?=
 =?utf-8?B?TytOSGpQTm9UUGNQWmgva0JMRGY5K3BFTXdrMTQ0ZUlFOTZZZ0laSzQ4Qjhm?=
 =?utf-8?B?Nkg2ejhhcjVBWUF2anhDMWI3aWEvWmc4L3ZrY3F4Y3h1OGpqejlhR2VSdkxU?=
 =?utf-8?B?dUhJTzR0aE5wNXlJNFVtREY5eFdOa3g1UGtKZjZuY1EvT3oyd1JFYTZYVlBp?=
 =?utf-8?B?Z0YwV0pRa1BNZGJkNlZXeTQ2U0xxU3JJNFp4RmlPdWFSQmJhOG9waFFtRGpr?=
 =?utf-8?B?ZUJsVUp5YzA4Z0NtbTRpV3BXOE5qU043TkxCV01nQzJIMEozOFRKL0xaT2xy?=
 =?utf-8?B?bVd6N2MvNmdoU0JYUmM5eURWYVBZN2J5OFVHanFVa3ViaEtmbkpQeEtsVkJM?=
 =?utf-8?B?WlRQUzArYTlDOWszenNvN2pQc2czMlg1dVhRNkg1bGRWaDBrNEdBeGVuaElo?=
 =?utf-8?B?M2JLc0Q0UHo3VW42cnBKREx0TEhzcWZSZ2ZPTllLM2JmU3JQbmE0c2IrbjdZ?=
 =?utf-8?B?a0lTZlNZYUxVWWtpcis4Rzg3N0VWM2NMUHk3dEpqaVNJV1NFbmhSV1ptVkgy?=
 =?utf-8?B?cEdFRkpxTEVsOGpjeEE5dmx5L3pBV2k2QS9RZ0tsaXlQR1ZidDhsWFVUdHNn?=
 =?utf-8?B?RDEyYkdnTGVrdnpQcThESk9uUElPZEdzSEpqSFU2VTNuWEtjRFkvNllhSExL?=
 =?utf-8?B?b1NDaDVGeldGREs1VG1ZNGlGa0phcytrQ1pheFRTSytDL0luVnRBa1lPYXdH?=
 =?utf-8?B?SWdBUUZVMXRuWUVaWGhyUTQ2QzF1TGJDRTRtTW5zb2V3eU9iMElRZW9UWnVI?=
 =?utf-8?B?ZmNsU2lGZHRVMWFWL05oMmcxdndDejVWRnRlR0YvSUNETGF2b241c3lERUxX?=
 =?utf-8?B?WDJSaGxHV3RUNE1UdFA4VDlnUVJWNmVJQWF5b08yU1Y4WmRHbEpsVE9XQkxl?=
 =?utf-8?B?WjBYcnJCOURhVlBLcThPeEhFa2tsN1cxL1JrU3BDSkNMV0cxKytvdWthTlo0?=
 =?utf-8?B?RkYraVRhdDdHN2tVdGlJcnkrVTl2WDROUThCSm1BTllYSUpaSm02Y0JFV0h1?=
 =?utf-8?B?eCt2MDhLK2R0WlEvYThNREU4Sk8zUGVzOVlWZ0x1TVZld3JqTmpKbCsyT1Nj?=
 =?utf-8?B?dVVBWTBXakNHS1B6Zjd3b1FZb1QyZkYwSEVRVnpqVEcwRmI2L0pYdWdzTHlG?=
 =?utf-8?B?Mzc4ZEVJc3hPN21BYVJEOGxmcUJMUER4TEdKUWo2U3VNL1MyVGZ6WERIZHhO?=
 =?utf-8?B?QTJDT3ZwK3VxWGVRNlluWVNZZTMxbjF0YXRHNWxQWFpzTlVwNmFGdXM4TW5w?=
 =?utf-8?B?eFc0WElpV0tuOVZ6VXRlUmMvdkdOTGd3RVBxN0ZlRldEeFJrNktvMlZtWGJh?=
 =?utf-8?B?eVE4UUhGb2k5WUo5SG04aC9uMlhIWUJlU2VVRnR0OVdEZlhGencxN3hlcGNL?=
 =?utf-8?B?a2g0UTlmQisvTjNLYmVrZ3lhN3RrNyt3NHBGMUMveWdLdnBjWTg2ZmZYS2dl?=
 =?utf-8?B?ZmxGTERkWmRXeW5heldQa01WWXNEbzFnUTQrZzBlazUyNDNxUklQQWpnb2hz?=
 =?utf-8?B?bGFkQ1Bia2tKWnh3ejZJQ0RHeExwZ1p6SmN1UEd1UExJR2trdWlub1BZL2wx?=
 =?utf-8?B?WUphL3I3UHdqeUMxaWxmcmN4OG5WQ0JsaVB6NENQSXZZV3RRNno0Y21mOEFy?=
 =?utf-8?B?Nk1YNk1FR2I2TjlCRTZ2S0NPM2c4V1pOTU9pcUZ0aTNYWmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjlUQ1YvaEhSNC8zWm9kM3FNcmJ2TlVVUnZKRVJIN09OR0UyZGJTUHZPeEQ3?=
 =?utf-8?B?MkEwellraEQvOUVGbW9VK0xwUTJYdGdmVlhNTUsxeE5CdmpIZHpnc0ROL3Zl?=
 =?utf-8?B?ODBiZ2UwRWtwS1VUSFNQQW01cE14YUc2RGxwTldCa1Fhd0VGa0p3SjM0MUVz?=
 =?utf-8?B?VHhmeEJCSVM4NDFabzdxOS9kc1p6K3Y4MC9RUUFaYlJGZzVBZVd2cEp4cUtQ?=
 =?utf-8?B?SkdLQ2RrTndDcW1XVUJzd05jVmp4L2xaeFh4RHVueUV0MFFFU2FhaXZVUlgw?=
 =?utf-8?B?MkViWWJORyt6SW1BKy9LVTFHeThKcHR5K0tNVk4vN2VNbnpHVlhVd2NhMFlO?=
 =?utf-8?B?Tmt1d3VPOE45bmVDSGo1NHNzSCsybWY5RXp2SzN3TGlPdGNYaDdJTGZHcjla?=
 =?utf-8?B?cGR4RmVISHZsekw1cUVXY0Z0allaS2FnWUFvc0ZEd1c5SzJHMmhoQUpuaXlJ?=
 =?utf-8?B?RGlBWGhCUXF0eTZGL3V1ZUdQbW0rdU13TXpiTmo5NGlFWHNTamc1UnJsZ3Fv?=
 =?utf-8?B?ZmRCMHRHU1ZOK2xVZDhsWVdPbFVmbmdyUmI0S1NVVDlxWmZjMlhZeWkybEt2?=
 =?utf-8?B?SW5MOVBsaVBYMW9Zc0loYmJZT29zSzBhUkFGWWgxUk9nNXViYkJqVDZhck9E?=
 =?utf-8?B?ZFZQZzFuK212MmFIMlNWVFB1aHg0UXdSRHVqR3Fla0RSM1JENitGelJ5YlUz?=
 =?utf-8?B?U0t6amNaWDZmZXowSU03eFBvd2VYQ0IwaHhqUHBvUjR3N3ZraU1hck5hK3dX?=
 =?utf-8?B?OWdDQUJ6ZGtYc2tWa0dDbWYzNDZ3M3h6UmtGaitQSW4vRisvd2oxSXRkeEFX?=
 =?utf-8?B?dlgyMnNpTCtKTlFHbnRBVGFoVkJOZkVSb3BSSHU2S3NJZjdLa3dPdm8vSGJD?=
 =?utf-8?B?SzE0ODBHT21TR1JuR3NOQkR2TnNCalM4YjBVV01LamQ1RjF3RWxPcTNoVU5P?=
 =?utf-8?B?TkFaUWJsdE1nMWZTOTJ2K1hlZThmYkZ4UDhQU1EvNmE3Rkx6TFlyN0ZaaU16?=
 =?utf-8?B?QmlRc0VyVmg0aWVIcTR0MTMrOTFaVGRQM2dUdTBHSC9lUFNsUENkR2dMQllh?=
 =?utf-8?B?SFR0ZDJoTTlBc0lLbG1mSjFsTzJ5Q045akd4SllIT2RNMHNWNlFrVFdqSUVi?=
 =?utf-8?B?cGFWYVJUc1ltT2JkNlBLdTJ0dUNIV2lhbitBdlc3SStkcysvWHRvZkNHbVc2?=
 =?utf-8?B?V2JtRzFka25ZZkl3OWQvMFhQa0dCelNWYVA1VU9ZWExTMkhGMDdSZlU2T1dI?=
 =?utf-8?B?Z2lJZER5UllLWWZpWUt0N0lXVXhpaTc5ckMxeG5iTldSY2J6MTczZnkyZkk2?=
 =?utf-8?B?SHdpakh0OFJoVEsxQk1LdVlRUEVSQjZuVDU3aXJZZUxSVmpyNmpIeTZXRjVW?=
 =?utf-8?B?dU1VamdMQVJVb2dsWWx0Y0VVaVVWSGVKMWpxY3pZOFU1RzhpV1B1cXA5Z2xu?=
 =?utf-8?B?ZnozcmhlWkJ0ejl6RDdTakw5alVTV3JETDRha1BFbUFscEpyWDVIaURiQ1J0?=
 =?utf-8?B?ZnNnTEx4M0czZlF2VGZFTllOM3hUaldHRy9yMkZGQ0lDV1VkZ2RDZVN2NmVm?=
 =?utf-8?B?OVBvWUpYSklNeUdVdDFrY0oxVHlzMXFKVTNoZFFNV1p0K1Q1MDc0OFlHdEhU?=
 =?utf-8?B?ZVVMcjZiWktEcDR0clRrcE9EYXZhWmVkYjhtTTJYdndSeFNzcUNpNUs3clQ3?=
 =?utf-8?B?RSt1bTNKZlFvQzFKSkNqUVduQkpYU29sNmVVMG1HQmYzaHFiNjVmZUhQRWYw?=
 =?utf-8?B?d0lFTXJPcFNDS1JHeGxLUkpka29hVXJnc0ZmbGQ2SmVOdkV0NEFXNFQ4Qndx?=
 =?utf-8?B?bUVsWWFLZFppWUhyaUpMdGU0ci8wTlNraVhsNzdyMmd0WElOdC9UeUI1eStk?=
 =?utf-8?B?OFdtckJZTzcyTkt6c2p1SGVTTjRFbkM3MFBWUFZWTHpPd05DNXNUVkpXQi8w?=
 =?utf-8?B?ODZkY24xLzY2cDdpaTY5NElOUkFaRTBROTNlcG1PbXBpa1dIdnU5djFETTlx?=
 =?utf-8?B?b29mdkhxa0o4cnVwYUtQWFFCR1VMa1FPSXpUNnpRSmRMamVVSURTQ0Z3Ry82?=
 =?utf-8?B?a3cxOW5XOEtsZ0tzeFp4bk5JTVVNMXJXODNMM29tSGFZTVlYaTB5eHc4VEVI?=
 =?utf-8?B?VUtLTUx4dFRjZ25TbUpkQXFRTHZaL3M3T010enIzTys5cGFmc2dIVHZBQS9P?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9459d5ba-2c5b-4fe1-c52b-08de165c2b17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:57:05.0563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pz736o9uM7cNL+S29o0S23VEpXrIKchNXOwaUfTWJG5KESj2nRtM9B0/E8aTmwrhuPfcO7YM31vrx/FlP6WPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
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

On Tue, Oct 28, 2025 at 11:38:20AM -0400, Zhanjun Dong wrote:
> On hardware init fail, the hardware might no longer response, add GuC stop
> to clean up exec_queue items.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> v3: Switch to xe_guc_stop
> v2: Switch to xe_guc_ct_stop
> ---
>  drivers/gpu/drm/xe/xe_uc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..00ca5883e006 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> +	xe_guc_stop(&uc->guc);

If exec queues are destroyed later—after the submission backend has been
stopped—the final put on the queue may be lost, leading to dangling
memory when aborting the driver load or unloading it.

I think you'll need to call xe_guc_submit_pause_abort somewhere to
ensure the final put cleanup messages are processed by the queues. Maybe
we add this call in guc_submit_fini before wait_event_timeout?

Matt

>  	xe_guc_sanitize(&uc->guc);
>  	return err;
>  }
> @@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> +	xe_guc_stop(&uc->guc);
>  	xe_guc_sanitize(&uc->guc);
>  	return ret;
>  }
> -- 
> 2.34.1
> 
