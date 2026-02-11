Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362D0ECD6EA
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 21:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC8B10E653;
	Wed, 11 Feb 2026 21:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/eRRyLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA09C10E653
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 21:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770844297; x=1802380297;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uL4WpuSTO4Gwx/6ad3gXxAjkTyDyr+wL1ipUuWXDNXY=;
 b=f/eRRyLxRMQVuammGGWS+3u+WydEV4TEDcU6ZB1xp7+oCXF9UdOJwGyA
 IP4l97Nmqelzeqm60LIO893wKuRGN9TuKnju5/NI4OrCu6VbfYf1jautr
 XKjNxxT5DGUqVZROXhqgrB0xNU3DE0of9RXrIKawP6IiKo2vjwsmU3CnR
 Ft8skvzJVCj9BmGaME0//50hhXQqGsBehJcsROYjR751qKtWhrlSiwil0
 +jwvf7x0J71HAbVaD/GUaX0wlRHPuGJTyuDv8RpucNRdk3Kk9f3wn1wf0
 zCo2+J6V7Za2Aa9y6qi4RaQTkB5w+yGc3KBOQqDx7Fmc9jQH/IWHFdXFc A==;
X-CSE-ConnectionGUID: zz6388VlQ0a8cTD2qxCawQ==
X-CSE-MsgGUID: +a1U273wS9aIvebgX75Iyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75849386"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="75849386"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 13:11:36 -0800
X-CSE-ConnectionGUID: JcqH2qp1SgyRKyZpBSbOuA==
X-CSE-MsgGUID: IQw4THADS26bK0zgjRdnKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="217332620"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 13:11:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 13:11:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 13:11:36 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 13:11:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOB6rkNdqg/ki82SkbZhVR4JOBkuqMjhG1yRSMx0+s1Lx7j9MgY4qM3DKvUAtsNG7h3R3YVveDufOqsE3zG6nl2PwDwym4L/bRCnH7+23CyZctN+rw7nrnz7baiGwmbu5P1g9NT/a1++5990a54C1cmoVKJuWbQPnt62wmL84ErAWNdiWrPQrDyTX3S8MgH6wMNhFObuJpvfBbryWCm9jD7naN48n9h1w/bGSFcHVwB3602fiPD4MIKzhoFdU800sAbhZgPcwox44EIMQzSEZmmoEHMRizx5i2T+1Ut1dpK39yFCTdWR32DviqG52u88nuuGV6xl7ZJoROd91Vx/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIx7H5w9Wjd61RGySFwN3L2eh6UuPFwcYfndzE66vfw=;
 b=fdpZu8x1pNvT0nQRco8X5VLI2RVWT6zZMeF+wc6HXUR3bmPh+uI0ubybFgLSVprlYm86RMfS8z07H+2DpW7kYULIOngZq5pPc+YpuM+NZsU0OI/T3wp9KYUBYW9mAVmOCUKIGp6S7dZ9hghl7TsHl0kDLKVPZn+jA2NuyRg7oTTwJrsa/8kA6Jd338zlimfUJKCcv+8Gi86mERP/nVADUdMQ1ybLX9/wvVx5RhvjVO4ezE88bP5UiLhoLW5mboAuDCOQbSV9AJ6RGhOKSyopp+e/IVjqoZQAbSLdsjbpPoZqov8Q1c7NxDmats4fZP6QLXNNMBACNTXD3bLkQX2LeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 21:11:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 21:11:28 +0000
Date: Wed, 11 Feb 2026 13:11:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
Message-ID: <20260211211125.GL4694@mdroper-desk1.amr.corp.intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
 <20260210125120.1329411-6-tejas.upadhyay@intel.com>
 <20260210210525.GC4694@mdroper-desk1.amr.corp.intel.com>
 <aYvHCeTd5pOFo2p5@lstrano-desk.jf.intel.com>
 <SJ1PR11MB6204CD2B54AD51B175F96F298163A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB6204CD2B54AD51B175F96F298163A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e6303c-3090-4fd1-1f87-08de69b21f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2FSMUxuMUJjK3haMVJ5amZLZkk2cVhlUWJiNmd5aEpZbnRoT1ZqMDdiLzc3?=
 =?utf-8?B?cW14OFEvTTFhUTFTdXVIM2RBZ2ZNOW1JTGd1NzFVWjRpUE9hVGdhbEFldUdk?=
 =?utf-8?B?cjUyTEFCVnNnMGd1K0RFb2hmQ1pMV1VyZDBiWDBNLys4Skxoc25JUmVQMEYw?=
 =?utf-8?B?NFo4dThCMEZ1K2M2WjdUcVZlc2FLTHA3VUNXKzlTN0Vqc1REcEgyWXdmNXc1?=
 =?utf-8?B?WHhkbUVUM1loTVd0eWd2cmZZa2lmSkRJY1k4bVg4Y3lhT2dkNFg1TVZrcjFG?=
 =?utf-8?B?YXhaRTBaTEh4UFJ6QW1YOUxQcFVIWFRDeWpwSGNyZnRQalB4VG40bEhRR3NZ?=
 =?utf-8?B?a0tkMitnQXkrUVBHazRkT1BKMUo5ZUFlNVJDZm1Na3JwQVc2ZFFjV1JjS2pl?=
 =?utf-8?B?NWoyQm52NmxKUmVseTJDZlF6TnEvT3RYZ3E5empSQnh5WExIUjBmb0duL3lj?=
 =?utf-8?B?M3YwODFxZ29zVFB6c0Q1U1VqajBqRG4rR25tZjc3YkFpZWVISzlPZjIrNjEw?=
 =?utf-8?B?SU1ZcHVCSnBxd1BVMkpEanZVcVczdU1wSjhON0ptcXdJLy9MUitHRW43Tmlr?=
 =?utf-8?B?dnpKVXJMS1FUb2NLQTFYOThUL3p1R2Z2aXAxSjRTQ1B5SUtpQmJBdnpNQkpq?=
 =?utf-8?B?bGV2Nm9mdEtKekZ3Rm83dklQQkFPMmJvTnhURkxuN09iUFFXN2tKWHpWV2tV?=
 =?utf-8?B?dUFxR2wxQ01YYWVuYWlad29JN1RseGU3TnBwL1N1Z0gyQngweTgxMXNMYXFp?=
 =?utf-8?B?UnFtdGhGc1hBSG9TRnR4dEYwUXZUbEUvVFZ5djRYa28ySDNna2VXTk4xcmpD?=
 =?utf-8?B?RGZCYy9pMExuZ1FaQURHLyttSURuQjVGYU9RRnphM0dQeWI4bTBDR0dZYXpV?=
 =?utf-8?B?VnBvdkc5WXp3bG5jRWhiWmFBM2d5NmtjOFRjMmN3N1h6ZVY5WWdtMUNNSzBU?=
 =?utf-8?B?K0RtNXgrTzRoU0phQkF5RUM1UFBBSGE5YU9pMDdoMlcweXRQYVU4T3ZGdzl3?=
 =?utf-8?B?S0F0bUxQbEtxU1poaXNDUERjVHpJWmNQc0dDOSt1R0Fta0hIbmNxaFFvTVdz?=
 =?utf-8?B?QyszNEpUUUNjRlZ3cng0NWx3dkRVV29KV3JEa2ZDelU3Ujh5MXRLUFljY3RN?=
 =?utf-8?B?WmNyUVA1alVwME9NZWYyOG81bU5PYnM5N3VnMXFBdmkvNkhsLzk3cFk0aWhB?=
 =?utf-8?B?bGdUWGpUWldFSUVUQkJEeXVqY3pQd1pqZUIrcS9OZ2h5MitINWJrOHFPT0Rs?=
 =?utf-8?B?VEVESEh1TGxFb3hjV0IrMHRCczNGRS80cDZQbnZyT2VIeWdZNUJlU3ZjekhV?=
 =?utf-8?B?OGU5RjVlUzN4TFJXcUFZSUpwQXIwVzBJRWxBTm5LTGZFdndQQjJpU2U0RnND?=
 =?utf-8?B?cjNhL1RvUWtPbzhjbElXU1FhS0tRY0NxeXNieFhMSXBxM1Nxa3ovdWQvaXhF?=
 =?utf-8?B?U2hqSk90VnhtbFRSVEJBbHp0U2VtdGNialVoUDB5ZVNkUkZ0SG5SY1BlbWh6?=
 =?utf-8?B?bkhoMVB3R2xoWGU4djZLWTgxVmgySjBlcGlmZ1N0RktWdFRxd3JQTC83K2dh?=
 =?utf-8?B?Wk02VGMrYVc3RkxJcTFBaGFJMW1GOStzcE0zTVdpNDkrMnJIMTREVU1jb2NN?=
 =?utf-8?B?aWVKVmlqQnlmV2M4eHFGdWJIeUhXTS81YzErKzloNGJFbjNGTEd4K1JjTVpK?=
 =?utf-8?B?WXpJM2FMK3Y3WjE0Z3BpdGVTaGRWUm1USXJDdnJLdjN2SUd6cEUzL0lYMVZP?=
 =?utf-8?B?bzVkL1FMV2UvMGNqV2V5V2JpZUJSNDhCVVNZWFFtYkFnbGFGdUNjb1M1WnN2?=
 =?utf-8?B?RzkvL1o2cjZnWEhlQ1NTaExqSURFMWZUSHduOFVnckxlWHhhaVo4U094VFpT?=
 =?utf-8?B?SmJLZmRDNklqekNSMTkzL3hXdExaVVBUV2dJUWhjV0sra3JGSWx2MDVoSjRT?=
 =?utf-8?B?L25rMFJFWWs4MmlXTzAxWkd3dDF0d0xYUUF0dFZKL0xyRjV6SVNpOTNDdnJl?=
 =?utf-8?B?YmlneDJDMW5aamhGWlpKOUV4L3VCN1BXZ0ZGV011U2FtU00xNFIydWVESnRS?=
 =?utf-8?B?SFFQN2E2QUVzdmphSkdPUUVCaHJFUG9mMGlQL0RleS9oZkJCQ1FTRzRtdSt5?=
 =?utf-8?Q?Fj40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHJ4VkFtY1RLU01rczZxUk5rUnlaNk5DRkZGV0lUblhwU1gwbUYyR1hwRTBu?=
 =?utf-8?B?RTlCMFRxaGRnVE55TFg5OGJMNC95ek9PTlNsQ1I4bzlEZzc2TmlTWDRHc1FB?=
 =?utf-8?B?WiswSnFTUTR5TmdkNHVhVVFqOEZUakFZR1hMNXJUakVTN01abC9JelI2dm04?=
 =?utf-8?B?NVVHQkhDYzU0aHpYNXowZGhxRmQ2TTdDZjRDaXZDRWRPU0Vzc3huT0pOdEhK?=
 =?utf-8?B?ZGc0T0hDZkFjWHJzOUU1Sm9GWXBCYjNxQ0htemxkQ2tqUmZuenk2d1gyNTg1?=
 =?utf-8?B?MzAwaGg4Vms0anV6VjZ6dy9LRVRHbGFUWmhOQXJCWC9XeXgyQjQzbXlRZDgz?=
 =?utf-8?B?YnpZa1hkTTUrVUl3bDFqN243TjgrOUNOYThDVlBOdlZ2dkNrcmtOMUVHdFRB?=
 =?utf-8?B?N3ZqNWJjYXBTTmphS0k1OUowWFVOUjA0aThDZUFERVFRQWF2cDlsdVBxN080?=
 =?utf-8?B?aVE1S2hBR3JOcytnS3luN09qZDhmWmF2dkNDQ3lhQ2FMZzZqZUF1NXJVVktT?=
 =?utf-8?B?OCtjOWowWmZnNVZ5V1ZmUUpRTm5UY0xpRGFocU1BdkVxaDdubmhmbllOR05l?=
 =?utf-8?B?RWJZdkc4N3NZUS9iQkE2T2dXU3NmT2Z2Y1NuaElaK0dpVGVqZGdWSWh2bE1W?=
 =?utf-8?B?UTFCbVdtRndrdm5mRTZ3SXA2dlJMdUZPY0ZCV0xSeVlWN0RGempKOStkaGZN?=
 =?utf-8?B?amtLME9SQkRIY0EzMWE2YTRYdDQwdElSSjRJUHFlZExUZ1lOdURuSnpCc0ZK?=
 =?utf-8?B?VzBuanRsSVhFLzJyMzRLN2cwWHZZT0RkNm9uL2YwQzlhZzFNVTAvRVo3UFZS?=
 =?utf-8?B?Y0ZwNFVYUUFRYzRINDVlcytoUTM2OW5BTUhFRjhCcmFaVEM2RTFnanZCQ3JM?=
 =?utf-8?B?WkdqRG5GK1VMa1JuSnhZWHliUmFGSzRjVFNYditwTURTbzBIK3Z5YkxuOFBE?=
 =?utf-8?B?RzFnbnZacnRNWmNzbzFpclc1Q0MrRDlPUy82SGpYVXhLcXpFcEE2cXlKZHc2?=
 =?utf-8?B?ME55YXh5SVZZTC9PTnpRUXpPRTJCSytlaTIvVk1nak9DRFM3bkxxRHF3eWF1?=
 =?utf-8?B?V3dpcXJhbzNacW43eGNJaWtEODl6NWtiUWQ2RWY5M2gvN2hoUW9sRXNTbFpS?=
 =?utf-8?B?YVh6WkVHQjZUYS9pSUtQU0VlQ0RBWG5jc0RSTmhRbXVyaUJDKytoMXR2R1Nw?=
 =?utf-8?B?cXB0anJuY2lqWHNFMlpIV1dGUVVFVE1PeFRuVWtjOGdTZ2Vnc0dWYVZNbzlp?=
 =?utf-8?B?ZGJ3R3o1d1dWaVZQd0JFUWVOTWpsTEI1bmZ6dmJpdndvdDZNcnFXVUx4cEJO?=
 =?utf-8?B?QkNneXZOOFp0dXNUWGdPU3NsSE0wSW1rWlZXY0xwYURUVWphcWMwOS85cGww?=
 =?utf-8?B?RURIWVR1SjBUb0hlM2lqQ21Day92NWxOaGg5NHB5Y3pVL1hYa2tWZ0hweVNV?=
 =?utf-8?B?V1RBSmhHZVJ5OXU1a09Ld0V3TTNmRVV1S29LZEh5ZnB6TVhCU1FUTjNYQWpv?=
 =?utf-8?B?WDBHY1lTemNlOUx2VStvVExOanpEU2RBR3lXRlNTTjdmN3JZaUdSaFQxWm9L?=
 =?utf-8?B?T1VFUEl3T0hZWEs3NWtVSlYrWlVDSHFIU0Z2TWhpb2IrQkJPdDg2MDdpOGVI?=
 =?utf-8?B?ZFM0QU92NmZRLzNWcW9zNllTQy8xQzlWV3lxTlhiYlM1WU1DRnV3Q0hOaWVF?=
 =?utf-8?B?b1U3MWVMMHduV1NCNFN1ejBibFJON3pCRzBEemdYcjRIZzlOUDFZTG96TjdE?=
 =?utf-8?B?QkxDOVR2UDB3K1psOVEzZTkzTEh0YkJOVlVlWnFmY3N0dEUvWkJyVDZvejNV?=
 =?utf-8?B?WDVJaUk0RllFeUNqSnNhemtpbXJJa2pjVE9DZDF0MlQvQ0Y5ZWlXdEd5Zjlh?=
 =?utf-8?B?OC85Q01Bdkt5L0c4TExGZ1k3MHZIbDJhZG05VkZETlYyeDhiZFhjcHRidklz?=
 =?utf-8?B?OExCUUlHM2JGVEluSFBzdUxkMTFzUE10Y25DQUNPQkcyOWtPU3BYdkNzRm1l?=
 =?utf-8?B?aXV5U0Ezdms5Qm50OEdWOVQzTDZwYjlsY2lHbFRWNFpINTRLcFBISHB3Wld6?=
 =?utf-8?B?OFBiOEE3dlVBdlZtWHhBWU1SWHdxMmVNTk5QT0laYUxZYUsxb2Q3dzlsOXMx?=
 =?utf-8?B?cXpzS2RoL01oTmdBUEZDUkE5NmVzUVZVVW1GcTBHKzhxRmkzcmFOTFl3bEdO?=
 =?utf-8?B?TUtKS3h4b0NXOEdRR25uRUlIektxRnlhSWhadElLNmZHK1R3cUJEMzJiMHlu?=
 =?utf-8?B?cmRiQmg5WGpPZmtJNTBzRWRNTFpPeUNQdlNkcG9rREpXdXhKWDNwbWhwWnc4?=
 =?utf-8?B?THUzQXhmMG1zWFhlOW5rVDVMSlJNTmIvTldldGpqeUl3MEJDMWNyZy9tS2pW?=
 =?utf-8?Q?91Bmy81AHawi9wLI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e6303c-3090-4fd1-1f87-08de69b21f28
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:11:28.2959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gpd1xW6NfPHtcz0v4VVPBc/ixOCb28AkhiKVwsF9ftRymFwr7PZdzNuuRF/0bI4bHNCOLOs1tV6zwIN5p5wYqEHLtL3KwOxySL9wJ/ESMh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

On Wed, Feb 11, 2026 at 07:06:05PM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: 11 February 2026 05:32
> > To: Roper, Matthew D <matthew.d.roper@intel.com>
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>;
> > thomas.hellstrom@linux.intel.com
> > Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
> > cachelines manually
> > 
> > On Tue, Feb 10, 2026 at 01:05:25PM -0800, Matt Roper wrote:
> > > On Tue, Feb 10, 2026 at 06:21:22PM +0530, Tejas Upadhyay wrote:
> > > > "eXtended Architecture" (XA) tagged memory—memory shared between
> > the
> > > > CPU and GPU
> > >
> > > I'm pretty sure this expansion of "XA" is wrong; where are you seeing
> > > this definition?  Everything in the bspec indicates that XA means "wb
> > > - transient app" (similar to how "XD" is 'wb - transient display").
> > > I'm not sure why exactly they picked "X" to refer to transient in both
> > > of these cases, but I've never seen any documentation that refers to
> > > it as "extended."
> > >
> > > > is treated differently from other GPU memory when the Media engine is
> > power-gated.
> > > >
> > > > XA is *always* flushed, like at the end-of-submssion (and maybe
> > > > other
> > >
> > > I assume you're referring to the fact that the driver performs flushes
> > > at the end of submission (via PIPE_CONTROL or MI_FLUSH_DW), and that
> > > depending on other state/optimizations in the system, those flushes
> > > may flush the entire device cache, or may only flush the subset of
> > > cache data that is not marked as transient.  The way you worded this
> > > was confusing since it makes it sound like cache flushes happen
> > > automatically somewhere in hardware/firmware.
> > >
> > > > places), just that internally as an optimisation hw doesn't need to
> > > > make that a full flush (which will also include XA) when Media is
> > > > off/powergated, since it doesn't need to worry about GT caches vs
> > > > Media coherency, and only CPU vs GPU coherency, so can make that
> > > > flush a targeted XA flush, since stuff tagged with XA now means it's
> > > > shared with the CPU. The main implication is that we now need to
> > > > somehow flush non-XA before freeing system memory pages, otherwise
> > > > dirty cachelines could be flushed after the free (like if Media
> > > > suddenly turns on and does a full flush)
> > >
> > > This description seems really confusing.  My understanding is that
> > > marking something as wb-transient-app indicates that it might be
> > > accessed by something other than our graphics/media IP (i.e., accessed
> > > from the CPU, exported to another device, etc.), so transient data
> > > truly does need to be flushed at the points in the driver where a
> > > flush typically happens.
> > >
> > > However when something is _not_ transient, then either:
> > >  - it's "private" to the GPU and only our graphics/media IP will be
> > >    accessing it
> > >  - it's bound with a coherent PAT index so that outside observers like
> > >    the CPU can snoop the device cache, even when the cache hasn't been
> > >    flushed
> > >
> > > If media is not active, then there's really no need to include
> > > non-transient data when an device cache flush happens since there's no
> > > real need for the data to get to RAM.  So that enables an optimization
> > > (which comes in your next patch), that allows flushes to only operate
> > > on the subset of the device cache tagged as "transient" if media is idle.
> 
> But what If we have stale non-XA marked pages for userptr, and that
> object moves out and at the same time media comes back, will end up in
> full flush and flush the stale entry to RAM.

What makes userptr special here?  During general, active usage, userptr
would be data that's accessible by the CPU, so it needs to either be
transient (so CPU can see the data in RAM after explicit flushes) or it
needs to be using a coherent PAT (so that the CPU can just snoop the GPU
cache).  If you marked userptr as both non-XA and non-coherent, then
that sounds likely to be a userspace bug (and probably something we can
catch and reject as an invalid case on any Xe3p or later platforms that
support this) since the CPU wouldn't have any reliable way of seeing GPU
updates.

If something happens that changes the GTT mapping of an object, then
doesn't that already trigger a TLB invalidation when necessary in the
driver today?  It was my understanding that "heavy" TLB invalidations
wait for data values to be globally observable before starting, so I
think that would ensure that any non-XA data makes it to RAM before any
binding changes, object, destruction, etc.?  Is there something special
about userptr that makes that case more of a problem?

I just found bspec page 74635 which gives an overview of the various
flush and invalidate cases, and I don't see anything there that makes it
obvious to me that userptr would be special.


> 
> > >
> > > As you said, we eventually do want to force a flush of the
> > > non-transient data as well once we're freeing the underlying pages.
> > > So how do we do that?  It's not clear to me how the changes below are
> > > accomplishing that.  Is there a way to explicitly request a full
> > > device cache flush (ignoring the transient vs non-transient tagging)?
> > > Since the GuC handles the optimization in the next patch (toggling
> > > whether flushes are full flushes vs non-transient flushes depending on
> > > whether media is active), I thought there might be some kind of GuC
> > > interface to request "please do one full flush now, even if media is idle."
> > >
> > 
> > I’m not an expert here by any means, but everything above from Matt seems
> > like valid concerns. Thomas also raised some concerns in the two previous
> > revisions; again I’m not an expert, but reading through those, it doesn’t really
> > seem like he received proper answers to his questions.
> 
> Its forcing flush via tlb invalidation PPC flag under xe_invalidate_vma( ). 

By the way, what is "PPC?"  It seems like it's another new synonym for
the device cache?  It's already really confusing that some of our
hardware docs use a mix of both "L2" and "L3" to refer to the same
device cache for historical reasons...


Matt

> 
> > 
> > A couple of comments below.
> > 
> > >
> > > Matt
> > >
> > > >
> > > > V2(MattA): Expand commit description
> > > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
> > > >  drivers/gpu/drm/xe/xe_device.c  | 23 +++++++++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_device.h  |  1 +
> > > > drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
> > > >  4 files changed, 28 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index e9180b01a4e4..4455886b211e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device
> > > > *xe, struct xe_bo *bo,
> > > >
> > > >  		if (!xe_vm_in_fault_mode(vm)) {
> > > >  			drm_gpuvm_bo_evict(vm_bo, true);
> > > > -			continue;
> > > > +			if (!xe_device_needs_cache_flush(xe))
> > > > +				continue;
> > 
> > This will trigger a TLB invalidation (and I assume a cache flush) every time we
> > move or free memory in the 3D stack if it has a binding. It also performs a
> > synchronous wait on the BO being idle. Both of these are very expensive
> > operations. I can’t imagine the granularity we want here is to do this on every
> > move/free with bindings.
> > 
> > Also, for LR compute with preempt fences, we would trigger the preempt
> > fences during the wait, so a TLB invalidation after this seems unnecessary,
> > though perhaps the cache flush is still required?
> > 
> > I think this needs a bit more explanation, because without knowing a lot about
> > the exact requirements, the implementation does not look correct.
> 
> The thing is that we are trying to solve problem with userptr with non-XA pat, consider if that BO got moved while media is not active. As soon as media will come back active, stale cached entries of that object will be flushed as part of full flush , which may corrupt things.
> There was thinking that with this patch we would at least solve the problem of corruption and later when page_reclamation feature comes in will help in performance as well. But now when page reclamation feature is merged earlier and it tightly coupled with bind/unbind some cases like discussed above (which are not doing unbind immediately on move/free) are missed in reclamation.
>  
> So thought was to let this solution go in with little perf hit and discuss with page reclamation owner to come with cleaner solution together.  
> 
> Tejas
> > 
> > > >  		}
> > > >
> > > >  		if (!idle) {
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > b/drivers/gpu/drm/xe/xe_device.c index 743c18e0c580..da2abed94bc0
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -1097,6 +1097,29 @@ static void tdf_request_sync(struct xe_device
> > *xe)
> > > >  	}
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_device_needs_cache_flush - Whether the cache needs to be
> > > > +flushed
> > > > + * @xe: The device to check.
> > > > + *
> > > > + * Return: true if the device needs cache flush, false otherwise.
> > > > + */
> > > > +bool xe_device_needs_cache_flush(struct xe_device *xe) {
> > > > +	/* XA is *always* flushed, like at the end-of-submssion (and maybe
> > other
> > > > +	 * places), just that internally as an optimisation hw doesn't need to
> > make
> > > > +	 * that a full flush (which will also include XA) when Media is
> > > > +	 * off/powergated, since it doesn't need to worry about GT caches vs
> > Media
> > > > +	 * coherency, and only CPU vs GPU coherency, so can make that flush
> > a
> > > > +	 * targeted XA flush, since stuff tagged with XA now means it's shared
> > with
> > > > +	 * the CPU. The main implication is that we now need to somehow
> > flush non-XA before
> > > > +	 * freeing system memory pages, otherwise dirty cachelines could be
> > flushed after the free
> > > > +	 * (like if Media suddenly turns on and does a full flush)
> > > > +	 */
> > > > +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe))
> > > > +		return true;
> > > > +	return false;
> > > > +}
> > > > +
> > > >  void xe_device_l2_flush(struct xe_device *xe)  {
> > > >  	struct xe_gt *gt;
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > > > b/drivers/gpu/drm/xe/xe_device.h index 39464650533b..baf386e0e037
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > @@ -184,6 +184,7 @@ void xe_device_snapshot_print(struct xe_device
> > > > *xe, struct drm_printer *p);
> > > >  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> > > >  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64
> > > > address);
> > > >
> > > > +bool xe_device_needs_cache_flush(struct xe_device *xe);
> > > >  void xe_device_td_flush(struct xe_device *xe);  void
> > > > xe_device_l2_flush(struct xe_device *xe);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > > > b/drivers/gpu/drm/xe/xe_userptr.c index e120323c43bc..b435ea7f9b66
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > > @@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct xe_vm
> > *vm, struct xe_userptr_vma *uv
> > > >  				    false, MAX_SCHEDULE_TIMEOUT);
> > > >  	XE_WARN_ON(err <= 0);
> > > >
> > > > -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > > > +	if ((xe_vm_in_fault_mode(vm) || xe_device_needs_cache_flush(vm-
> > >xe)) &&
> > > > +	    userptr->initial_bind) {
> > 
> > Same concern with the LR preempt fence as above — the hardware will be
> > interrupted via preempt fences, so it doesn’t seem necessary to invalidate the
> > TLBs but perhaps we need a cflush and TLB invalidation is the mechanism for
> > that too?
> > 
> > Matt
> > 
> > > >  		err = xe_vm_invalidate_vma(vma);
> > > >  		XE_WARN_ON(err);
> > > >  	}
> > > > --
> > > > 2.52.0
> > > >
> > >
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
