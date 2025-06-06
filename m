Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43544C61DB8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 17:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB9B10E32A;
	Fri,  6 Jun 2025 17:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmmziTe/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E279A10EAFC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749230244; x=1780766244;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AbYH0R41XcIIvBGjAOYErliLFexkKs/X3ay5maRn8wg=;
 b=MmmziTe/kMolW6ZV4mjVzuycnzC2LAwRZHIOrSl1FjiJxsnaH+8uwZ2X
 WUV1bs0hJCoQ1GXptFs4YppX4L+EtyG0Y0h2rAFB8wmufuY0yQVO1VHTA
 w887GM7/QVwBXb8+kbrWk8oG1og1ZmNTzPpXeZ7i3n72gSNlJx4ahzCV8
 FXsl2sF1yTX4pLiQNsqSTNxTktN0m9mcfVK0FT96uB/rpKXS581/QgJW7
 J+tUqAPOsptDDB3XBUpUSjOzhV2u97y2HfqM2j3jm0bJO+gdz/jSRSc6a
 6vfomuO1AmepoLF+wUXVtkPjV1HvwOhSO4uQ2Wb202+hXLNxK432W63tf A==;
X-CSE-ConnectionGUID: nlVKvMTwTbegYDr2AbAK+Q==
X-CSE-MsgGUID: 5vgMOw0nTo6hE7Q0ZVhW1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51295220"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51295220"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:17:23 -0700
X-CSE-ConnectionGUID: 46cXg/15SXqeK3QbnUE7ng==
X-CSE-MsgGUID: Z+mW9qHSQB2v5vd9wE1wTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="146833390"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:17:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:17:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 10:17:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.72)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 10:17:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1N1h2uDQbc0Vz9Kzd6SdzrbiJaNEhONXcXat4J+GfL2O+MRZXIpU+YZ9XMwTbDra3A6hlAu8EXnp4xwee1TBhj+U5l34cq4Qc5VHfRMUNXmmdALpPAgbsRdrinwpvZpRBqxvVZZQtfI1LRyqvTSVJ3762AVv34PsxYwdn/pUXXcY9HWHWTPWNnUPj5C8s+M17SZR6vzDRE1TUx1zUko88QOkUhwX2ncE+SdQ6sxEIhn0jgiLAl4Qha9sPSs/NqQSPfHnVsDPwozUTj5xwJQTYJBd/3m95vAlbGuuSMlaMTfj2ciH4g+894cCxviBeTvVBILPkBvNwotxru8TxmMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLAFdmrNGSw3dBD1LGMm7PrcVYF/xmyPMokCqX/mKwc=;
 b=abJqBzG6byOkBQct875fVQ3RyXu8H8qqgpmpwUSQDlGg26QHZ4qJf9qZxSF39PzW1fujjnL7ZX2GlZOZplu2K0902AAhL4ItnTRi1DY798nUPZ5EFAGY62YXDWqIdUJOzGhUQlP/fmzMbrWu/xyLlinmglDF2uosvCzPsLciKqMDr5nRSDrJl23r8MJORF068HPjjmOs3QIIEOy73qgKA1d/2yOSGt8P7QAcZcACAKwhREUIEC7VKsnZQ87thFzavp84p2HAPcSt0TV9xGDpLJVtjtNEQt48kejayF7OClQfeWg6Djah8gJTv+NJ2Macsd8V+63sbyEEOCZeihK0Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 17:17:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 17:17:19 +0000
Date: Fri, 6 Jun 2025 10:18:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe/vf: Create contexts for CCS read write
Message-ID: <aEMi/YDIaidqYOpB@lstrano-desk.jf.intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
 <20250606124558.30966-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606124558.30966-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e22b7b-5d28-489d-0fa6-08dda51dfe2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk9vYXhKMWd3VDhhTGplclk3NlJQYlNTMVpmcVZoRGVERUVNU2RsVTZXSEFG?=
 =?utf-8?B?RGI4Vmk2NEk5SGlDaVRyU0N5d2xEWjl3Z3U1T3R5dUFuQzBqRjZzWWJwUnk3?=
 =?utf-8?B?bTlxZCtxQnJyb1lLYUpBbHBybGNMeDYvZFNzbEhZV0VlVjdTRzc5SlArZlhB?=
 =?utf-8?B?SkdoUTdERTFoUm9vbTg2N0NyajVDODRURS92bGU5Z0h1djNWdlVveURmakhI?=
 =?utf-8?B?SDhRRDNHakNRbXN6RmtvWXBBOHJYc01zd3ppM2Z1b25yc1F1Ynl0Wnl2d2RL?=
 =?utf-8?B?bk4vemJEYkJNNzhjMS9NbzhCS2tFb3RtZ2s4UCtTaVR2MXRTcVRMdXNPNEdV?=
 =?utf-8?B?U0VGOWpiVWJkOUhoUmlnUWRnUTJsNEx6TG5rUTRsZUtVbHgzWENBMEsxeVgr?=
 =?utf-8?B?ZlZZUVl4ZDhFbVFpRkRlR0lZYnBFc2Iyc3VUSWVCOW9GVWNFY3FhNGl4b2sx?=
 =?utf-8?B?NER5TVlzVEkyQnRpMU9YblBVRHhVUTJ1VGo2ODVtdHhjY1UrbTNseXpUKzVZ?=
 =?utf-8?B?TlY1clFTclIwZkdzOFpMaDFYVitHQU1qMTV2VE9PS0JzenRoMkR5aXB1WENS?=
 =?utf-8?B?dTZIbzJmTnMwbnVEREtxV1ZtWEQyWTVrS25lazlzQXliclVlTzZ4bjltTVlt?=
 =?utf-8?B?VEl3OHRudlNHbGtqSFJrYUZ1VjhlNVVQSGh6Z0NkUkNuZ3BXdFgzb05FV1hy?=
 =?utf-8?B?MHF3TVZ5YU1FWEpBc2tiSmdsbjFlNkluVDhLSEQvTWlvQ1oyZFZpWEt3U0lW?=
 =?utf-8?B?NTZzK2NOZjhxOGM3VlkyQ29uUDJocFFlTHVPYkM5K1hTbVl1UG15dzZzb3Uz?=
 =?utf-8?B?MCt4dVVqZUJWTVVrVXRFSzVGMExFNDBJeTJ0MWxTTFBKcWV3MlZEUHRicGh1?=
 =?utf-8?B?aUtISmxPZ3RIU2tzdnJhRm0zSys2anF6a0NhUnFVcXJIenIxMUh1MGM0cmVy?=
 =?utf-8?B?WEgyc3RESy9oU1dOVW1jdTFuZWVEUDhqY3M1WVdkR1VLVUt1aUVLWUttem1W?=
 =?utf-8?B?czJOTnhhS2pRbDlHMVE4bVdsaEt6STdhSVdzWVZ1L0lwSFc4VC8xL05XTHdI?=
 =?utf-8?B?U1Ryb1lnRkhmNXJBR2o3V0V2ZkhaL3h6UDNnajJLT1RhakxOSDE5a01jRkg1?=
 =?utf-8?B?cEhKTnQxN2tCS2d4cEhMWmw2eVdQUWVsZUdlYXFJWE1DUDhYcnhJRC81bFFl?=
 =?utf-8?B?UENVUmt1dzk0ODMvVnlScWhSUkRtVG1ZcWpqTTlhcEpWaXZjTWk2ckgvL2Ja?=
 =?utf-8?B?bUJPQ0J3cWRrWnV2MjhtdGFIMllrNUh3Mm5XcGM1ZmxSamhZWnpUWTFXempn?=
 =?utf-8?B?L2Vzb1VxSVQrckxVOXUwRmFqZURuS1Y4VVZ1aUVWQWVpaW5GUVFIUG5oaWFU?=
 =?utf-8?B?OExnOGVXZ3ZGbDRUOGZvRjJtd3pvUjdjQUhQbDYxSUhBVUREY015YUVGV3Ry?=
 =?utf-8?B?dU5hUitTYmVuMUl6ZUlYelBGcVlZajVaMi9lNXNVVzM1N1A0OVZYRSt2MzIx?=
 =?utf-8?B?ZGJIcnJzd1hNR0VpdzRiQ3F3aHVadHl6QWFJc1krelF0ZXRHT0Q1U0F6eHFF?=
 =?utf-8?B?VklCb3lmbzA4Y2E0SzBHVXN3R3ZIc1phcE1pdnRSQXozVmlJeSt3bFZ4cG53?=
 =?utf-8?B?RVFBL0FyUzdyQ0FvVmF4S1MvT2hmYnovSEQwamZHYXVyMnhtczFvM2xzK0Zn?=
 =?utf-8?B?UjNvOXkrMWVRRHhEby9sQlAzZmpaOUZ6enRYQVJWL05Sek0wZkxmaEJRaHhs?=
 =?utf-8?B?MkZnUkRIaUpVZHhOWDJnQWp4WW5JRnl0RnpOemtRRWNpN3JTbGkyNnFmeUFw?=
 =?utf-8?B?bjRGSTFZU0tGSmRpcVdmTEFoQU44RVZXa1VQbXE2dzVHUGU0dVJtNzZiUHoz?=
 =?utf-8?B?RTJRWDJrWGpEODFaOWJVWVZubzBFTzZrM3RjaG4zUEpMbEMzWEFrMDg0a3VP?=
 =?utf-8?Q?na4ZQ48jVH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1M4c3JES3E5WGhYOVcySS9RUWdxMHVZQlNGWGNHamVJMzVTczhIZC9ibTdB?=
 =?utf-8?B?a2wxelpZL21kTC9KNElLVVpXdXN0Ni9lRlVtSUxtMGg5OXZKOGVQWUo0dXJC?=
 =?utf-8?B?SnlPSVFSR1RHM0RibjRRY0xYb1RGaW9yNUN6VzV5OExDNWdRalhCc2VQTU5T?=
 =?utf-8?B?MyttWnljaFpkQVVNMEtpTzFyUXdJN2U1aU1CdXlWQUtnajhhZ1JReHBZSUw3?=
 =?utf-8?B?S2ZYOUc0THFsci9zTUhzNitFb2FvSEJBZkxCRnNRQmdUWlY2L0p5c093MXZP?=
 =?utf-8?B?c3Q2MzR0WUg2S3dKcy9MM1huT1RmbEx2cHFxU3JNMzU0VDRSbXlwQi9Od3V2?=
 =?utf-8?B?R3NpNitvMW9ZQ0FHUml3RDIwSi8rQWdXNGRzbXdnam5Fa3V4V216NytUenhE?=
 =?utf-8?B?eUlTRmMvTUFhTElmWVJvMkpnNlZKWjNNeTV4Z200N2tFZjQ2dW53TUxscGFq?=
 =?utf-8?B?OFEydTdORlNzYmIwcnpVWGp5RlNwaENIUDZ3RHcrYU9KL0xjTC9TcDl5WURw?=
 =?utf-8?B?RHpnS2NzdldEOUhKcCs4ZmhsTVc0Skk1eUZBYnhOaUlibFZjY0dpK2lDNHRl?=
 =?utf-8?B?SVo4NzFOY25uYm9VWlRIcVlXTWZndnA0azhrU3IrYXZIYzBvcHlMVGwwQXJj?=
 =?utf-8?B?bnNVRmlDL0hmRzNOSG9pYkozU3BpcHRrNDRxZFBwMmhxYlFFQjcxRlVmc2NI?=
 =?utf-8?B?WURHYkE0OXE2ZVBYdVN5czBYYXU1UUVOby9yeUVkclU4RkNUd3FnV1I4eisz?=
 =?utf-8?B?Yktma3E1dXIzb0pEdDNEeVIrYUIyVzd4MFIvQlE0ZWZyQTJhVk9OaG01Rzhh?=
 =?utf-8?B?dTJrYmtOM2lhRldneEZEWDBmdU9PWFlHcHdXaVRWamxoNFVqcjFXeFNzZEpO?=
 =?utf-8?B?M0ZFendSczFDcUNGSDdUVlpEUnFqUnlyTVdnckFXWnNFRlZIQ0RnNnZDakI0?=
 =?utf-8?B?di9GTjZMSUR5a2x2RmZZRFRMNVBTaHZvWmF4MkxIYXNnV3UvWHBpUTdmZUxT?=
 =?utf-8?B?bjYzc1NUTEcrbDlEQ2k4eUF4VkFzazBlMXZkVENVMzBQUlhYeG1paHlUb3pF?=
 =?utf-8?B?OHlXNDVTUHZBbmVaVzZIWnlzZ3psd21ta0dZM1daNEJ2cHlCd1dRRHRoUUt5?=
 =?utf-8?B?d2RJVFNrMlhSd3puZjlqVU5XKzU0T01LZ1dKZlk1WWhHdFptSXNnNEQ1NkVr?=
 =?utf-8?B?RGlHWGRVNWhGQlVwaVA1TDVibmgyTVIrcnVaNnZ4L3BGbUZQY2N5d1BTT2Z3?=
 =?utf-8?B?c25uSzdHYXZzK3dGQVV3eHZCeWRiazNPRnMvYlRiN1E2VXc0Z1VHTG1HVzBi?=
 =?utf-8?B?N0NOSlI0S09YSVF6bXMxUzc5Tzk3SnZVQnhsSGdmbVROWHdmODdKWjNSVDJY?=
 =?utf-8?B?WW91N3lDL3ZVM1oxZjhBdmdGMENXSjkwU1VqZlBzV3cyR1d1TXAxaFBFNGFR?=
 =?utf-8?B?UkIyRGd2MHJXNkt2ejBlVHc5N2NkYy9Oa0xSZDdvZE5wTDA5aXFkYVowdXdC?=
 =?utf-8?B?SlI1MFowRUN2U0JLRURNT1M1bU9YZVFoUjIrQVNIUXBFbVM4RGphcjRRcmx0?=
 =?utf-8?B?OTRHVmQvOVhsYTRxS2xKWXdYR3RxZkhlT0RWYUJBbWRrSHkrbFVBVUdUSVE1?=
 =?utf-8?B?enNsRzBNSFN2U0tRRndDQnZNRTk4MGtLQ3RxdWppZUN4cDFVOEN1ajJUampy?=
 =?utf-8?B?MzExWC9sRUQ1QmtWQkczS01VS2VoTVR1WFVNVll2T0xNYStKZ0VuSlFNNkJC?=
 =?utf-8?B?NmJ6MmkvVWQ5RUJHOXVmYUxDL2xLdDBXYk5GeXgxU1Q4bldVYnlwck03MDhs?=
 =?utf-8?B?L21LRmRXSXh1Zi9ITmJPVXJ2djNVeURMamdYTW9PV0k2K0dmcE9iZnNxU3ZW?=
 =?utf-8?B?WmFjb0lOdjVZTnpsWFJoZmc0QWpuSkNFd2NoWEx4aFM3WURtYkNUWFJSSWs1?=
 =?utf-8?B?cDFybENZbGpkdUh4ZG1LRDVtMzk4RzRYVm1IeGpVUEZIZFJFYnNMYVFPV0d3?=
 =?utf-8?B?bkxob2lOSkpxaFhwVTNCRzA1NnlqbmhieTBBMnFhMEhHL3JhYmY4SzhzazFQ?=
 =?utf-8?B?NnBIWEJpVjNIQVF5N1lBRzZMcFZxK0FRbnE1Ukc0QlBKaVhaVnloV3M0MWdJ?=
 =?utf-8?B?SDg4dzc3bm05K3ZlbWl1c1FUcFRrUFMvWCs4SUNqalRBQ0RRdUZMeWNKOGxW?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e22b7b-5d28-489d-0fa6-08dda51dfe2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:17:19.6191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pK1iuetU3ha7iW1lXrXYjXCSBIhXBI31jCjlogoPr6abLI1OQytzgYeO3nHXRjqfecg07hBywwayoXhrR2+oKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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

On Fri, Jun 06, 2025 at 06:15:56PM +0530, Satyanarayana K V P wrote:
> Create two LRCs to handle CCS meta data read / write from CCS pool in the
> VM. Read context is used to hold GPU instructions to be executed at save
> time and write context is used to hold GPU instructions to be executed at
> the restore time.
> 
> Allocate batch buffer pool using suballocator for both read and write
> contexts.
> 
> Migration framework is reused to create LRCAs for read and write.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V5 -> V6:
> - Added id field in the xe_tile_vf_ccs structure for self identification.
> 
> V4 -> V5:
> - Modified read/write contexts to enums from #defines (Matthew Brost).
> - The CCS BB pool size is calculated based on the system memory size (Michal
>   Wajdeczko & Matthew Brost).
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Added new variable which denotes the initialization of contexts.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/Makefile                |   1 +
>  drivers/gpu/drm/xe/xe_device.c             |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
>  drivers/gpu/drm/xe/xe_sriov.c              |  19 +++
>  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 186 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  46 +++++
>  10 files changed, 315 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f5f5775acdc0..3b5241937742 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -140,6 +140,7 @@ xe-y += \
>  	xe_memirq.o \
>  	xe_sriov.o \
>  	xe_sriov_vf.o \
> +	xe_sriov_vf_ccs.o \
>  	xe_tile_sriov_vf.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 660b0c5126dc..bf96045770c7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -925,6 +925,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	err = xe_sriov_late_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..caf3bb1ef048 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -22,6 +22,7 @@
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> +#include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> @@ -234,6 +235,9 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +
> +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..2c6d757db810 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int ctx_id;
> +
> +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> +		return 0;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> +		drm_printf(p, "-------------------------\n");
> +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +		drm_puts(p, "\n");
> +	}
> +
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static int topology(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> +/*
> + * only for GT debugfs files which are valid on VF. Not valid on PF.
> + */
> +static const struct drm_info_list vf_only_debugfs_list[] = {
> +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> +};
> +
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> @@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		drm_debugfs_create_files(pf_only_debugfs_list,
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
> +	else
> +		drm_debugfs_create_files(vf_only_debugfs_list,
> +					 ARRAY_SIZE(vf_only_debugfs_list),
> +					 root, minor);
> +
>  
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a0eab44c0e76..87911fb4eea7 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -15,6 +15,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  		strscpy(buf, "PF", size);
>  	return buf;
>  }
> +
> +/**
> + * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * @xe: the &xe_device to initialize
> + *
> + * On VF this function will initialize code for CCS migration.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_late_init(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (IS_VF_CCS_INIT_NEEDED(xe))
> +		err = xe_sriov_vf_ccs_init(xe);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 688fbabf08f1..0e0c1abf2d14 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
> +int xe_sriov_late_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index ca94382a721e..8abfdb2c5ead 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -71,6 +71,11 @@ struct xe_device_vf {
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
>  	} migration;
> +
> +	struct {
> +		/** @initialized: Initilalization of vf ccs is completed or not */
> +		bool initialized;
> +	} ccs;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> new file mode 100644
> index 000000000000..41fe1f59e0e9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "instructions/xe_gpu_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_migrate.h"
> +#include "xe_sa.h"
> +#include "xe_sriov_printk.h"
> +#include "xe_sriov_vf_ccs.h"
> +#include "xe_sriov_vf_ccs_types.h"
> +
> +/**
> + * DOC: VF save/restore of compression Meta Data
> + *
> + * VF KMD registers two special contexts/LRCAs.
> + *
> + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) save in regular System memory in VM.
> + *
> + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) Restore from regular System memory in
> + * VM to corresponding CCS pool.
> + *
> + * Below diagram explain steps needed for VF save/Restore of compression Meta
> + * Data::
> + *
> + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> + *     LRCA        LRCA
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |     Create Save LRCA            |                              |         |
> + *     [ ]<----------------------------- [ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |   Register LRCA with Guc     |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Create restore LRCA |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]-----------------------      |         |
> + *      |           |                    [ ]  Allocate main memory |     |         |
> + *      |           |                    [ ]  Allocate CCS memory  |     |         |
> + *      |           |                    [ ]<----------------------      |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      | Update Main memory & CCS pages  |                              |         |
> + *      |   PPGTT + BB cmds to save       |                              |         |
> + *     [ ]<------------------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Update Main memory  |                              |         |
> + *      |           | & CCS pages PPGTT + |                              |         |
> + *      |           | BB cms to restore   |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Pause                         |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS Save |
> + *      |           |                     |                              | LRCA    |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Restore                       |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]--------------               |         |
> + *      |           |                    [ ] Fix up GGTT  |              |         |
> + *      |           |                    [ ]<-------------               |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |Restore  |
> + *      |           |                     |                              |LRCA     |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *
> + */
> +
> +static u64 get_ccs_bb_pool_size(struct xe_device *xe)
> +{
> +	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
> +	struct sysinfo si;
> +
> +	si_meminfo(&si);
> +	sys_mem_size = si.totalram * si.mem_unit;
> +	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
> +	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
> +
> +	/**
> +	 * We need below BB size to hold PTE mappings and some DWs for copy
> +	 * command. In reality, we need space for many copy commands. So, let
> +	 * us allocate double the calculated size which is enough to holds GPU
> +	 * instructions for the whole region.
> +	 */
> +	bb_pool_size = ptes * sizeof(u32);
> +
> +	return round_up(bb_pool_size * 2, SZ_1M);
> +}
> +
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
> +	u64 bb_pool_size;
> +	int offset, err;
> +
> +	bb_pool_size = get_ccs_bb_pool_size(xe);
> +	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
> +		      ctx->id ? "Restore" : "Save", bb_pool_size / SZ_1M);
> +
> +	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> +
> +	if (IS_ERR(sa_manager)) {
> +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> +			     sa_manager);
> +		err = PTR_ERR(sa_manager);
> +		return err;
> +	}
> +
> +	offset = 0;
> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +		      bb_pool_size);
> +
> +	offset = bb_pool_size - sizeof(u32);
> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +
> +	ctx->mem.ccs_bb_pool = sa_manager;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF. It initializes
> + * LRCA and suballocator needed for CCS save & restore.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> +{
> +	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	int err = 0;
> +
> +	xe_assert(xe, (IS_SRIOV_VF(xe) || !IS_DGFX(xe) ||
> +		       xe_device_has_flat_ccs(xe)));
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			ctx->id = ctx_id;
> +
> +			migrate = xe_migrate_init(tile);
> +			if (IS_ERR(migrate)) {
> +				err = PTR_ERR(migrate);
> +				goto err_ret;
> +			}
> +			ctx->migrate = migrate;
> +
> +			err = alloc_bb_pool(tile, ctx);
> +			if (err)
> +				goto err_ret;
> +		}
> +	}
> +
> +	xe->sriov.vf.ccs.initialized = 1;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> new file mode 100644
> index 000000000000..5df9ba028d14
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_H_
> +#define _XE_SRIOV_VF_CCS_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> new file mode 100644
> index 000000000000..f67f002c7a96
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2023 Intel Corporation

s/2022-2023/2025

> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS__TYPES_H_
> +#define _XE_SRIOV_VF_CCS__TYPES_H_
> +
> +#define for_each_ccs_rw_ctx(id__) \
> +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_RW_MAX_CTXS; (id__)++)
> +
> +#define IS_VF_CCS_READY(xe) ({ \
> +		struct xe_device *___xe = (xe); \
> +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> +		___xe->sriov.vf.ccs.initialized; \
> +		})
> +
> +#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> +		struct xe_device *___xe = (xe); \
> +		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> +		})
> +
> +enum xe_sriov_vf_ccs_rw_ctxs {
> +	XE_SRIOV_VF_CCS_RW_MIN_CTXS = 0,

XE_SRIOV_VF_CCS_RW_MIN_CTXS is unused, I'd drop and just set
XE_SRIOV_VF_CCS_READ_CTX to 0.

> +	XE_SRIOV_VF_CCS_READ_CTX = XE_SRIOV_VF_CCS_RW_MIN_CTXS,
> +	XE_SRIOV_VF_CCS_WRITE_CTX,
> +	XE_SRIOV_VF_CCS_RW_MAX_CTXS

s/XE_SRIOV_VF_CCS_RW_MAX_CTXS/XE_SRIOV_VF_CCS_CTX_COUNT/

With the nits fixed:
Acked-by: Matthew Brost <matthew.brost@intel.com>

I'll leave the final review to the SRIOV team as they know more about
the init flows and can review the structure of that.

Matt

> +};
> +
> +struct xe_migrate;
> +struct xe_sa_manager;
> +
> +struct xe_tile_vf_ccs {
> +	/** @id: Id to which context it belongs to */
> +	int id;
> +	/** @migrate: Migration helper for save/restore of CCS data */
> +	struct xe_migrate *migrate;
> +
> +	struct {
> +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> +		struct xe_sa_manager *ccs_bb_pool;
> +	} mem;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
