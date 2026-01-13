Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE776D30CEE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 22:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE5E10E562;
	Tue, 13 Jan 2026 22:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aau7hhfY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3E110E562
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 22:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768344808; x=1799880808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/BybNLV8atNYbpViSvzbBLW+Bjlxv3JhkWT4KTm9cSQ=;
 b=Aau7hhfYkuwX0QUVMj80Od8rEwvpJefT7QWuCIadpeDZR9/0O+yzzKvC
 9AWismDGjpXFLj29K2PRZ173x0u89x1bn+t76gE9fmS9bzEMOlquzNHz7
 fQup/aD6Ln2NTmajsxEsXGT/rH0znuADjvurgoxw0+p1TYQE/7ePixcc4
 pk22RXh1lSMbaCO1XvfvWeUp7zJjXu6YhDw/FgIPRAJcyntL/swJt6Z4A
 Tf7JymhTwVmNvZVGR2gqX6tljBDuBd5putJwQiUT4SsJfuAB3ZGrGTnFw
 dqe6wN+SVZo/PlBiEKVRZpvUtKZGPUGqCqpDvVv+utNnp1doHb5TEcraO w==;
X-CSE-ConnectionGUID: Nmu+YaZbRQeeyjjpQypu5Q==
X-CSE-MsgGUID: ZHf3rc1WRCOORB7AREMDjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="79937837"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="79937837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:53:27 -0800
X-CSE-ConnectionGUID: NAX95KhmSnankzYjiAhLYw==
X-CSE-MsgGUID: Fv//2pUNRW+ZGfXGQhXABQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204927348"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:53:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:53:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 14:53:26 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:53:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi0EeE2sSFqYo1gdB/m+xQpkC45Vvr2vt/YQRbfuVA3tO4ppsPaKIH5dtsYLjHgpvWenVKjtQCxyN2DkTuNzHpV2YdNjoQifK87dLwNZ2y68KOwce+02IN9GhsKUgBSL62GLYwah/A4Z5vXOr1d37jR3RkBFLQx+m4snKL/Ktn+DyQhE+c2e0XFy3eYbvZxVrvFejBklMUhrokWfM9FOz2kp7tH/Bel1rU0lGJWs0cNlbrYxO32fp7Sp06C1/DPTh12Aaq1qIISiQncgYnAxuPfCST+rgsHIhbPHfuMWemVq2qyFpYH7aNfGs//AOEkRU7JAiiWRf1h8SuE72uXQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC5JrXmVbd66e2ZJrlm0KAhkSlLzr69I10TgFboAsGk=;
 b=Qd5tYAv4VVrqdM0X38rxT6rwK1AJf18HHJLqkcq/381lMUhCCW1GfGMPfWfc8ShdG1IXYMDclVd/dU+Aln//o6JQR9IlbguGgZWvD1pNAIlGV+rhjIAwLphu/j8v/Qn96MMKG0Q76yZ4VY8FQe23V3mOGKNotsWi9+W+Cvd9JxjyO4ERZPmQclOlgg3JgIkYA1N9UyATD4bx9Pw3iWwuD8F1YpLQal7ECfxniZXIZP4GL3ojuCIKexP/+NkWK0fPs4gOzNkvKEW0By2OdALNibneUu+OKFJiet1MEcYIHfvsZqdVXgtFBIIMKqxiFiOonLn323Cd8cgF00kxDr40fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB7495.namprd11.prod.outlook.com (2603:10b6:510:289::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 22:53:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 22:53:18 +0000
Message-ID: <988183a2-318a-4a11-ab06-40173b23acba@intel.com>
Date: Tue, 13 Jan 2026 23:53:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/xe: Rewrite GGTT VF initialisation
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260113121807.1303124-1-dev@lankhorst.se>
 <20260113121807.1303124-3-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260113121807.1303124-3-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0295.eurprd07.prod.outlook.com
 (2603:10a6:800:130::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f04422-eaa3-4fc4-6134-08de52f68b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0xFK0J3aUtGTlhUelV4cW83bEtocmtSWml4UnY5QUNPblVzbWc1WjF0Y0Ra?=
 =?utf-8?B?ZlRQRzhtQktpS0NXWlBhQ3oxajRTN1NPM1V1ajJ6M2ZjU2hmTjZvWFB3S1h2?=
 =?utf-8?B?cGEyVEl1TnFPYTJEenYvQWNiaG9XZnlLQk5Nb2JOSlBLRG1heGpNMXd6eW5m?=
 =?utf-8?B?aUZWMkNLZ0ZjMVp5WlBxV013ZWwwZFJiZEtiNFBXRXc2UnY1d2VMNC9sbnFV?=
 =?utf-8?B?MGFVbCs3eWhpclhsSjdTVHk4K3lHd1JPc3pYeVFkem5HVGlzTE96TnV0MUx2?=
 =?utf-8?B?cm5FZGtPK0VWWGxvRnFtWDU1L3RMTXdLdkF4RkZ5TitxaXhadlF0amtWVVBi?=
 =?utf-8?B?WDVESkE0UWlLTEFqd0lwajUvM2JxUWlzbkxpeVZlUFpBOWZnN09pZytic0sw?=
 =?utf-8?B?OFBVKzljSnFBQVV0OVZHVDVQTlhwa3F0N1lrSGJMcXRaeUVON21JZ2psOE1j?=
 =?utf-8?B?QjNVZ08vQlBpUlhDYmxCZmhLdG14UnlsOVRNaisxUlkwWWgrcUZjaExwUXha?=
 =?utf-8?B?elFJd21Zak1WdEdYYUhjZzhtekpZT09GSHYzTitFdWJTTXNYTkxaL3VOMHFO?=
 =?utf-8?B?dWo0Wmllcy9zVWxBWVhnMCtrbG5rVFdxOTdrZ1RqMXcyUmxQeEVUSFluSkxh?=
 =?utf-8?B?QmFZZC9pckdYcFhXR2RKZ3ZrNXd5UXgzcXplU3dvdXFXMThXL0hmYThZa2NU?=
 =?utf-8?B?aklWdng0ZTUwRGo2QnIzS0FSZGNISW9DRzdrRWFzd2tVNm9YYU5UaDFabUJi?=
 =?utf-8?B?VUtlMGRqcWRTTmdtT0lFOEFGcEk4ZXRqSk5lZkcrVzhOU3R6bVNaUlUzdFZB?=
 =?utf-8?B?V1g3MllKZ2UyaFdvQWJWR2EyYUxxOTJ6cTZuVVJ5V0tKM1hkUXAzaHFudHNM?=
 =?utf-8?B?SFh5RFFxdlRxVWp3N25YVWhGSFJ0THhGQ1pEcGVxMmJIaHFCdnNsb3o4RkpP?=
 =?utf-8?B?eG8zZEo2dnFyblVvY1hUWU10L1BIUmpNOFlrb1FVOU5tNGxmbS81QVQ3dHFE?=
 =?utf-8?B?VVBHL1RBUjRjLzNGT0poM0V2ZWRqQ0R4bU1PRXdZRWUwSGNDODNHSzc3RXpZ?=
 =?utf-8?B?a2E2MUxubjF6T1R6akpXYkYyVWtYdDB4UHgxbE1QY21OendvWm9IQTROUmxU?=
 =?utf-8?B?K1VreGVSeExXODBiVThId2dVYmlrVUJNYkhXZDlhYWN2MFRqM29xWEtNUEdW?=
 =?utf-8?B?NVdJcmEzNlNmTDdVcFowRmtkVXBHMXV1U0FLZS9oM3BxZW52QXZXWlRnQWdM?=
 =?utf-8?B?S25wbTBpS2FQRlN1d2dxZGY5L0R2M0xaRWZMTjlQL3l2YVdFL2J4Q3FBUUh6?=
 =?utf-8?B?bHlma2x6emkzN09qa3k0emoxeUZjUmFucEowOURpZGhKNTRqTjQ3YlduaVBs?=
 =?utf-8?B?VnhKWnJ3MU1sS3BnVTdXVmVaQlRTaTJlekdqN2lsZGw1VnFrWTI4VVpyMmdm?=
 =?utf-8?B?MDdRRkJ3aDBpKzVtdmpPQkNEaTZOdVEvWTcvVWNzVDNhT2pFdFlHU0tJdlVO?=
 =?utf-8?B?ajRzMSs2elhpQVlMSlBNQzRidWxMZGgxZUtwVi9ySTlURjV3dGNSSEZQbk8v?=
 =?utf-8?B?QnRRVklrYW1LN3VKQTltTENMK2dvR0hWdGt1L202by9hZHAyZ0RBd0l2bkEz?=
 =?utf-8?B?UGxYWWd6YSs0OUxHR3pmRmk1ektNdklHa0hOaVNiRHVmM2pPMEUvK1QzQUQ2?=
 =?utf-8?B?NTZCVnpUZWZ6Z3NmTXlTOFlNTld4UUJ0dW9pYmJOYzJibDdwbWNrYlBpbjEz?=
 =?utf-8?B?em9KTUFwRzNSb1VQZnVjak9ZbGw2enZtNE8xSlhOUnRsWDVNc2l6dzF2cTZL?=
 =?utf-8?B?YTdqMlliRlBTZ1llQjRzb0RJYUxhdTd3Q3ZUU2ZMd1MrNDg3ZkRlTlJzNVhQ?=
 =?utf-8?B?alE1VGN1bTk4VzIxZUNZRkErdVVhb0p3Zll0ZFhiWW1RcmZWY09BZ2hGcndp?=
 =?utf-8?Q?LlMD8Y8FXUA01nKS7Z9dRRGY6ig5Z53/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWcrY1pwZ0ZlRGFkQ1h3eUJqYWtsUWhoUkJLM3QvckwxbW9mK3hOckY3YkRG?=
 =?utf-8?B?eEV4dUFxYWJ3NTFkbHNjWHNqV1VSZUFsVkQ1NmZ4QityMXhhOWNOUGkvV1BI?=
 =?utf-8?B?ZUdTalBBdXNNeWIyM3hmdTUrbXZZVlR0S0F0aG11eE9LNTZHMFBqcVh2WDFm?=
 =?utf-8?B?djAyVXE3bVRnVGdjRHB4YlU0TlpSRUhwbGNZeE1ZR1lYNGFZb0k5MlpjaFFL?=
 =?utf-8?B?bGhZMS9USDB3QlUzK3FyRGlyK1d2Ym11VGFFQm0yYWV0RW0wNW8yT2MrL2dv?=
 =?utf-8?B?OFIyTFBxYkllbDh3eWtxdkRXbWFzTW1hSEx4a2dJSnpLYUlXMzZHZUc1M3ZC?=
 =?utf-8?B?TUNDSzhJRmZ2NXd2RmVrek43UFh1cFhzaUJ4UzF0U0lnakVnN1hxbnUzby9N?=
 =?utf-8?B?ZHRFOElrd1ZXWFNHaDhGV2xnc3phVVhGY3ZvTGFCMnI2M3czRnZEYVBxM1pO?=
 =?utf-8?B?WkhicGJvYUFuTm0vNGE4bU8rWFlZbGpUR1I4emErNWtRbmJqQkdyaExKYWg1?=
 =?utf-8?B?TXRVaDZRSzAraTY3Mlg5WS9XUFpURUI3SDU4TUc1NWtadmtWMUVRWDFYUXVK?=
 =?utf-8?B?OU1DaUNIcFdrQUFQSjY5STdVeWUyNW92SlJqcm9xQks5WUhjRkkrMVhidk9a?=
 =?utf-8?B?eDNYZDlSNStMa0dJY3RkNmRia1FDdlFTSEVzQ3pWQWhPampnMzg2d2lTOUc2?=
 =?utf-8?B?ckN0OXJaL1hLYUJsZ1Fpd3FjRXdUYUVYS2NNOWJtZFJaZUNoTFg5bnlhV1Na?=
 =?utf-8?B?YjE2NWFyU3BaMmVUSzAzYVlndzA2OHgxY2xzNUh1MzVZWitwL01TSDNBQlZG?=
 =?utf-8?B?ckZaWkZ5U2J1TVNqcVNjVXN2ZnlWZVlqUWtVVHZHcmJ2VW5rUXlRcFl0QWEw?=
 =?utf-8?B?NVg1S3hmTkduOXY4clF1cUtDcVBvcVdXZDJoUDdtR2kwRjV2WStMYXg3U2sy?=
 =?utf-8?B?N2lhYnp1enBaQmhNZUcxM1MvZWQ1VU43YVNEYkg4My83Vmk4anFpcHFFQXgz?=
 =?utf-8?B?SEdMNHhGR1NWcFhkaGpwZkpVR2N5MmFWZFV3eVZEK0VGcWZKOTJYTVdTTG1K?=
 =?utf-8?B?RnZCcm5ucWpwUEhzY0hsaVFyM3I4VXg1aS82UHdHL0tVdHFuQ3Z4VmRNQy9Z?=
 =?utf-8?B?WXJZU2ZacG9NTU5oU3VJR3hKZFh3Q1pnT3ErR0p0VTBoejlOYzJCZVl5MWsw?=
 =?utf-8?B?TzN3TWdpaXBSNG1SMnQyRjZZZDVLa3E4MW56YlViQ1lzQnh4UUFUcTMrVE13?=
 =?utf-8?B?RDJoNWNsZDZ5ZFZkMjY0bWhUVDEzamlZY25QMm5vdVFjRWIwYW45S0M2MWdV?=
 =?utf-8?B?Qmxvd3VJd053MGd3QVVvQTVKYUdwOHdiWE96UUp4UEM5RWJJSGNXVVpTa2ty?=
 =?utf-8?B?ZDh5U2dHNG1zT2tqN2dCVHFIdERsQzVKcFhEOWZOdlpQbk5kQ3U1OG9JMDRa?=
 =?utf-8?B?eVU1RDJLendLeXdhSmUwUzQ2dmlsY3dMdzVBR0lZOFd1VXU0dWhLYSt5Ui9B?=
 =?utf-8?B?TVovVWdiOERLQ1Jlc29YcVhoaUdscFNyZThUUHVMZlc1VHBzYU9qZnhpcUpF?=
 =?utf-8?B?NVA5eXlaUjBMQWpRS0JBN3ROUFYvTWoxMHdsMXlaWjh2aHAvdENpK0tqN1JU?=
 =?utf-8?B?VEEyektCVzgvREJtdVpLM3E5Ynp4MnQyMG9UUG0rNUJKOEFLYjVaOGtWQ3di?=
 =?utf-8?B?N3BLaFE2blMxM2dOcGJUa0p2OGd6blVNd0hxU0tnT2R3T2FiUEZhTWlZa3pD?=
 =?utf-8?B?b3lqbW92SkRMQktTNlNEYWpRWjgzMDVaNDhPSWpoY2pGSDVSaXFBejBiY25X?=
 =?utf-8?B?VFc3THdBWDJWMU9jWWdMS2w2aE9RWVN3V3VQeC8rZlFzbm1KUS9VMUF2ZmlP?=
 =?utf-8?B?TlhiQkZtNll1cnJFMDBwSnlUdHBqME96WVVyRUMyYmpvUHJsenJ5M3lMbU9o?=
 =?utf-8?B?YnBFbmVvZGhjUTJncHNCU1l2MlBwTURUSnluaUowOVZ0VVN3NzJuTjNiT09D?=
 =?utf-8?B?Skd4c09CNU1LVVZKTmhpc0dCdGcxbFh5MHpwM09QUklCTEh0bHFZY3BPMmVH?=
 =?utf-8?B?UWRiUFVsbTU2aEJhVG5VU21oRWgzWVRNUzBWOFc0aDY5R3RCSW0zN1c5bFd1?=
 =?utf-8?B?aWlrQTB5T01pMTNmZHhicGNKUkdXanQrdjlGdXMvOEoyMWJUaGJ4RzgyaXp2?=
 =?utf-8?B?NWl1M2YxWGJBUFk2M0gyVW8wb3UyQTVsWHhSTDd3UE9tYlZRb1B1RmpwM0w3?=
 =?utf-8?B?N3NiYnlldXFCcU03TnNiN09KdlZRMzY4TG40RXl1QW91RGpaNWxuK0h0dlI5?=
 =?utf-8?B?QloxRXM3clBkR25HRWxHaU5OY3ZKV3ppQ0hsL2w5R3hiQzNFYzM5b2tHL0hY?=
 =?utf-8?Q?sn3ZajWZPLl5AWkU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f04422-eaa3-4fc4-6134-08de52f68b39
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:53:18.7723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AJM0Q4/l6/hXZu602pDOlJtD1zgKE4KSy4gk+6749Ke/YaubvebuNQpLJTnXp2Gs4MxinHxjcgjRvGGa4CX6P27D2f7cXsxwwsUN2TxmX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7495
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



On 1/13/2026 1:18 PM, Maarten Lankhorst wrote:
> The previous code was using a complicated system with 2 balloons to
> set GGTT size and adjust GGTT offset. While it works, it's overly
> complicated.
> 
> A better approach is to set the offset and size when initialising GGTT,

initializing (and in subject: initialization) ?


> this removes the need for adding balloons. The resize function only
> needs readjust ggtt->start to have GGTT at the new offset.
> 
> This removes the need to manipulate the internals of xe_ggtt outside
> of xe_ggtt, and cleans up a lot of now unneeded code.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Co-developed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h  |   2 -
>  drivers/gpu/drm/xe/xe_ggtt.c          | 159 ++++-----------------
>  drivers/gpu/drm/xe/xe_ggtt.h          |   5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |   7 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 198 +-------------------------
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h |   3 -
>  6 files changed, 34 insertions(+), 340 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4dab3057f58d2..fa28477fe6fae 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -221,8 +221,6 @@ struct xe_tile {
>  			struct xe_lmtt lmtt;
>  		} pf;
>  		struct {
> -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> -			struct xe_ggtt_node *ggtt_balloon[2];
>  			/** @sriov.vf.self_config: VF configuration data */
>  			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 4bdd2c94021cd..1c5397e3ed724 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -71,8 +71,8 @@
>   * struct xe_ggtt_node - A node in GGTT.
>   *
>   * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
> - * insertion, reservation, or 'ballooning'.
> - * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
> + * insertion or reservation.
> + * It will, then, be finalized by xe_ggtt_node_remove().
>   */
>  struct xe_ggtt_node {
>  	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> @@ -348,9 +348,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt_start = wopcm;
>  		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
>  	} else {
> -		/* GGTT is expected to be 4GiB */
> -		ggtt_start = wopcm;
> -		ggtt_size = SZ_4G - ggtt_start;
> +		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> +		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> +
> +		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
> +		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
> +			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> +				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);

no need to add "tile%u" as it will be already included by the xe_tile_err()

> +			return -ERANGE;
> +		}
>  	}
>  
>  	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
> @@ -378,17 +384,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (err)
>  		return err;
>  
> -	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
> -	if (err)
> -		return err;
> -
> -	if (IS_SRIOV_VF(xe)) {
> -		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
> -		if (err)
> -			return err;
> -	}
> -
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
>  }
>  ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  
> @@ -539,119 +535,21 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
>  
> -static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> -			      const struct drm_mm_node *node, const char *description)
> -{
> -	char buf[10];
> -
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		xe_tile_dbg(ggtt->tile, "GGTT %#llx-%#llx (%s) %s\n",
> -			    node->start, node->start + node->size, buf, description);
> -	}
> -}
> -
> -/**
> - * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
> - * @node: the &xe_ggtt_node to hold reserved GGTT node
> - * @start: the starting GGTT address of the reserved region
> - * @end: then end GGTT address of the reserved region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
> -{
> -	struct xe_ggtt *ggtt = node->ggtt;
> -	int err;
> -
> -	xe_tile_assert(ggtt->tile, start < end);
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> -	lockdep_assert_held(&ggtt->lock);
> -
> -	node->base.color = 0;
> -	node->base.start = start - ggtt->start;
> -	node->base.size = end - start;
> -
> -	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> -
> -	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
> -		return err;
> -
> -	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> -	return 0;
> -}
> -
>  /**
> - * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
> - * @node: the &xe_ggtt_node with reserved GGTT region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * See xe_ggtt_node_insert_balloon_locked() for details.
> - */
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
> -{
> -	if (!xe_ggtt_node_allocated(node))
> -		return;
> -
> -	lockdep_assert_held(&node->ggtt->lock);
> -
> -	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
> -
> -	drm_mm_remove_node(&node->base);
> -}
> -
> -static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> -{
> -	struct xe_tile *tile = ggtt->tile;
> -
> -	xe_tile_assert(tile, start >= ggtt->start);
> -	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
> -}
> -
> -/**
> - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.

nit: add () after function name

and btw, shouldn't we rename this function now? maybe:

	xe_ggtt_move(ggtt, new_start)


>   * @ggtt: the &xe_ggtt struct instance
> - * @shift: change to the location of area provisioned for current VF
> - *
> - * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
> - * to represent allocations in range formerly assigned to current VF, before the range changed.
> - * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
> + * @new_start: new location of area provisioned for current VF
>   *
> - * The function has no ability of failing - because it shifts existing nodes, without
> - * any additional processing. If the nodes were successfully existing at the old address,
> - * they will do the same at the new one. A fail inside this function would indicate that
> - * the list of nodes was either already damaged, or that the shift brings the address range
> - * outside of valid bounds. Both cases justify an assert rather than error code.
> + * Adjust the base offset of the GGTT.
>   */
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>  {
> -	struct xe_tile *tile __maybe_unused = ggtt->tile;
> -	struct drm_mm_node *node, *tmpn;
> -	LIST_HEAD(temp_list_head);
> -
> -	lockdep_assert_held(&ggtt->lock);
> +	guard(mutex)(&ggtt->lock);
>  
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
> -			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
> +	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> +	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
>  
> -	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> -		drm_mm_remove_node(node);
> -		list_add(&node->node_list, &temp_list_head);
> -	}
> -
> -	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> -		list_del(&node->node_list);
> -		node->start += shift;
> -		drm_mm_reserve_node(&ggtt->mm, node);
> -		xe_tile_assert(tile, drm_mm_node_allocated(node));
> -	}
> +	WRITE_ONCE(ggtt->start, new_start);
>  }
>  
>  static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> @@ -692,12 +590,8 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>   *
>   * This function will allocate the struct %xe_ggtt_node and return its pointer.
>   * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * or xe_ggtt_node_remove_balloon_locked().
> - *
> - * Having %xe_ggtt_node struct allocated doesn't mean that the node is already
> - * allocated in GGTT. Only xe_ggtt_node_insert(), allocation through
> - * xe_ggtt_node_insert_transform(), or xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved
> - * in GGTT.
> + * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> + * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>   **/
> @@ -718,9 +612,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>   * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
>   * @node: the &xe_ggtt_node to be freed
>   *
> - * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
> - * this function needs to be called to free the %xe_ggtt_node struct
> + * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> + * not going to be reused, then this function needs to be called to free the
> + * %xe_ggtt_node struct
>   **/
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node)
>  {
> @@ -1226,7 +1120,8 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>   */
>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>  {
> -	return node->base.start + node->ggtt->start;
> +	/* pairs with WRITE_ONCE in  xe_ggtt_shift_nodes() */
                                   ^^
double space

> +	return node->base.start + READ_ONCE(node->ggtt->start);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 70d5e07ac4b66..49ea8e7ecc105 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -19,10 +19,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node);
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
> -				       u64 start, u64 size);
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d91c65dc34960..ea180a3ea7cb0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -489,7 +489,6 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size, ggtt_size;
>  	s64 shift;
> @@ -497,8 +496,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	guard(mutex)(&ggtt->lock);
> -
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
>  		return err;
> @@ -524,10 +521,10 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	xe_tile_sriov_vf_ggtt_base_store(tile, start);
>  	xe_tile_sriov_vf_ggtt_store(tile, size);
>  
> -	if (shift && shift != start) {
> +	if (ggtt_size) {

why this change? size will always be not 0 here

>  		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
>  				 shift, start);
> -		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
> +		xe_ggtt_shift_nodes(tile->mem.ggtt, start);
>  	}
>  
>  	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index c9bac2cfdd044..24293521e0904 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -14,173 +14,12 @@
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_wopcm.h"
>  
> -static int vf_init_ggtt_balloons(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> -
> -	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> -		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> - * @tile: the &xe_tile struct instance
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> -{
> -	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> -	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
> -	struct xe_device *xe = tile_to_xe(tile);
> -	u64 wopcm = xe_wopcm_size(xe);
> -	u64 start, end;
> -	int err;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(xe));
> -	xe_tile_assert(tile, ggtt_size);
> -	lockdep_assert_held(&tile->mem.ggtt->lock);
> -
> -	/*
> -	 * VF can only use part of the GGTT as allocated by the PF:
> -	 *
> -	 *      WOPCM                                  GUC_GGTT_TOP
> -	 *      |<------------ Total GGTT size ------------------>|
> -	 *
> -	 *           VF GGTT base -->|<- size ->|
> -	 *
> -	 *      +--------------------+----------+-----------------+
> -	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> -	 *      +--------------------+----------+-----------------+
> -	 *
> -	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> -	 */
> -
> -	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
> -	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
> -		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> -			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
> -		return -ERANGE;
> -	}
> -
> -	start = wopcm;
> -	end = ggtt_base;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> -							 start, end);
> -		if (err)
> -			return err;
> -	}
> -
> -	start = ggtt_base + ggtt_size;
> -	end = GUC_GGTT_TOP;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> -							 start, end);
> -		if (err) {
> -			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -			return err;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static int vf_balloon_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -	int err;
> -
> -	mutex_lock(&ggtt->lock);
> -	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -	mutex_unlock(&ggtt->lock);
> -
> -	return err;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> - * @tile: the &xe_tile struct instance
> - */
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void vf_deballoon_ggtt(struct xe_tile *tile)
> -{
> -	mutex_lock(&tile->mem.ggtt->lock);
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	mutex_unlock(&tile->mem.ggtt->lock);
> -}
> -
> -static void vf_fini_ggtt_balloons(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void cleanup_ggtt(struct drm_device *drm, void *arg)
> -{
> -	struct xe_tile *tile = arg;
> -
> -	vf_deballoon_ggtt(tile);
> -	vf_fini_ggtt_balloons(tile);
> -}
> -
> -/**
> - * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> - * @tile: the &xe_tile
> - *
> - * This function is for VF use only.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_device *xe = tile_to_xe(tile);
> -	int err;
> -
> -	err = vf_init_ggtt_balloons(tile);
> -	if (err)
> -		return err;
> -
> -	err = vf_balloon_ggtt(tile);
> -	if (err) {
> -		vf_fini_ggtt_balloons(tile);
> -		return err;
> -	}
> -
> -	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
> -}
> -
>  /**
>   * DOC: GGTT nodes shifting during VF post-migration recovery
>   *
>   * The first fixup applied to the VF KMD structures as part of post-migration
>   * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
>   * from range previously assigned to this VF, into newly provisioned area.
> - * The changes include balloons, which are resized accordingly.
> - *
> - * The balloon nodes are there to eliminate unavailable ranges from use: one
> - * reserves the GGTT area below the range for current VF, and another one
> - * reserves area above.
>   *
>   * Below is a GGTT layout of example VF, with a certain address range assigned to
>   * said VF, and inaccessible areas above and below:
> @@ -198,10 +37,6 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   *
>   *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>   *
> - * GGTT nodes used for tracking allocations:
> - *
> - *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
> - *
>   * After the migration, GGTT area assigned to the VF might have shifted, either
>   * to lower or to higher address. But we expect the total size and extra areas to
>   * be identical, as migration can only happen between matching platforms.
> @@ -219,37 +54,12 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   * So the VF has a new slice of GGTT assigned, and during migration process, the
>   * memory content was copied to that new area. But the &xe_ggtt nodes are still
>   * tracking allocations using the old addresses. The nodes within VF owned area
> - * have to be shifted, and balloon nodes need to be resized to properly mask out
> - * areas not owned by the VF.
> - *
> - * Fixed &xe_ggtt nodes used for tracking allocations:
> - *
> - *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> + * have to be shifted, and the start offset for GGTT adjusted.
>   *
> - * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> + * Due to use of GPU profiles, we do not expect the old and new GGTT areas to
>   * overlap; but our node shifting will fix addresses properly regardless.

nit: actually, this expectation is not so solid, thus the whole sentence can be
dropped as it doesn't bring anything important

>   */
>  
> -/**
> - * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
> - * @tile: the &xe_tile struct instance
> - * @shift: the shift value
> - *
> - * Since Global GTT is not virtualized, each VF has an assigned range
> - * within the global space. This range might have changed during migration,
> - * which requires all memory addresses pointing to GGTT to be shifted.
> - */
> -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	lockdep_assert_held(&ggtt->lock);
> -
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	xe_ggtt_shift_nodes_locked(ggtt, shift);
> -	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -}
> -
>  /**
>   * xe_tile_sriov_vf_lmem - VF LMEM configuration.
>   * @tile: the &xe_tile
> @@ -330,7 +140,7 @@ u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile)
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>  
> -	return config->ggtt_base;

	/* pairs with WRITE_ONCE in xe_tile_sriov_vf_ggtt_base_store */

> +	return READ_ONCE(config->ggtt_base);
>  }
>  
>  /**
> @@ -346,5 +156,5 @@ void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>  
> -	config->ggtt_base = ggtt_base;

	/* pairs with READ_ONCE in xe_tile_sriov_vf_ggtt_base */

> +	WRITE_ONCE(config->ggtt_base, ggtt_base);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 749f41504883c..f2bbc4fc57347 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -10,9 +10,6 @@
>  
>  struct xe_tile;
>  
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
>  u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
>  void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
>  u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);

