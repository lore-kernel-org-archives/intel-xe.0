Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5964BD10373
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 02:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1728510E4FB;
	Wed, 26 Nov 2025 02:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vr4K0Q/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9458D10E4F7
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 02:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764124361; x=1795660361;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rBj7guSKnELGTXFn1eRx8rtFPIanKzv6EO3Ek2l1GQ0=;
 b=Vr4K0Q/xcRl1WuXl1Ed541FQUlVbfKg55CtsVmvFjanaiJZmL/A/km37
 hAwcNzMPgk8gm7v0JWv6wPYcWpB1oV69CGGCXymHO4ehEI02m2o2jn59c
 X98pKbNp0pVWvn3dsyzOV+KOoye5Ciu62iFJU2O/yClHDREi+gcwag4XT
 4wi2K5qsn8GbdRAbT9G+ix1O3DbmqC9jml6kltPPnVH0fQ8wXktyvE7NY
 tAj32xaXrbm7xNASa3/4awTFiFOK6SxYSpbktsTIC5yI8QcLDkwtaP9dK
 7W9UoU/DBo9QzxC9/Syaee/AEoQhe0ghAAg4lAcjuMPk75nzCUe+ckEi2 Q==;
X-CSE-ConnectionGUID: EvnjUJ9KQqqenPmis6kBCA==
X-CSE-MsgGUID: xmTPSiPOQBSqEa7ZbqUiOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66041626"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="66041626"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 18:32:41 -0800
X-CSE-ConnectionGUID: oNwlN1aMTRqmYXQXd+VFsQ==
X-CSE-MsgGUID: QpW3gu1IQxmtlX0i/EVJ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="191955895"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 18:32:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 18:32:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 18:32:40 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 18:32:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcmlYg/kI/tnRnTgA+kmGLFUt4qI3yWBtaSt/Q4XY4ahV5kGdXuyzAD0rc5wZPRw98it1NLn6yl06wHQhOE+X/ICP2wZ4MgvQTJCicG6YpAPcweGWFG7T4dEgYOIVGEVdaO1bLMlBakOsiu8zzMeAJwv/IxfTY9NPF2dgvUnKITWAa08oi4woe0WNGtISS0QQQazynSyb4coz7DMLfc36AxbqjreNYzz0sLbTLGF4IM9iierUGBe5Gqfry7E0C1b8N4ASRdajX1dmUBBnlkgPd/f1jFRFkx23E00Pf/JCaJYZ8FyT58cizt0gA7tmm956y0VZWlUai7qzOM+3XYRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNzuMF2YrY5CfLka/w3h/lZKiJZ5ctkgxRZJclLL2pk=;
 b=L9eAzNUpt13QyOvnPD63QBfdzXced3zufegDQYquQ8kmygBGQcHp4/TLQbLWN94z4CUqATzA1/+QK1VJQEQ6gvnpbub8mbyWmjZQDeOfpdjbsp0n/Zgz7jK8DLvQLOXlnEAyiULX0qYb32nefW64iVHvvGuT9Py647Lh4b4Q6h5r/dwIpv/Ts45pzvytIecE9xlW+7kgWLogdmOR+5Nsy8j5ohOzSgW5PwkTdtOMCD3qRACUdz+iP0abmODrtr/QrOzDOFeQJbpYnx6VzjeaemFgT/GNTR2N8YHudnt0CVDQKKZxk6a3KOSU4O+jlcKC16aejGsQaxyYJLYmBmYXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Wed, 26 Nov
 2025 02:32:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 02:32:32 +0000
Date: Tue, 25 Nov 2025 18:32:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [bug report] drm/xe: Enforce correct user fence signaling order
 using
Message-ID: <aSZmvT3VCmRPfCwc@lstrano-desk.jf.intel.com>
References: <aRyNbk3D91Hzb9Cy@stanley.mountain>
 <aRynS3MfRj0V0VGh@lstrano-desk.jf.intel.com>
 <aSRuz7C77FFp17NI@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSRuz7C77FFp17NI@stanley.mountain>
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b8e9f7-9346-4705-3fb4-08de2c940d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUZEdUwvVXQ0NWh5bWEweWovR1BrVGxZVmsrcGx2Y3ZPUkJiRGYzcmsxajJr?=
 =?utf-8?B?QUVDZWlPNDgwR3dtaHRJYnB0R1I3dE0xcy8rL3VVeXIzWmMxa3lsczZZOFY1?=
 =?utf-8?B?Rm03MXRheDQ1RVh1WGFTYUQ4OVcyUWpaQ1Q4UFo3R1laakZaQUdmNXY4T1BM?=
 =?utf-8?B?ZXVDMmVmQnYyeEwzUllXMHhpL3k3ZFhRa3NzZ0xPTG1xdWswZUR5STN0cnF6?=
 =?utf-8?B?YUVJcEFva0xwUkRkaXM3N0ozUGtYT2d1UGNpRWdBY3ZRNm5PL013TTZQcC9x?=
 =?utf-8?B?RURyY0poWHdUZVBPcHhpOXBDbmUycnBwWFkyOEc2MFNYSnd3QS9EYk5xSHRY?=
 =?utf-8?B?Z0hoaUkyV2dGcVhOQ2ZxTGNKclg5SlZCa3ZtWldYS0JJSXFBMUxmSldyVnV5?=
 =?utf-8?B?L0x2ZEVINnFTMENEOHlyV1VXVEtZQTRCeWMzTHpIdklSaFdIMWpSYlFzbjRh?=
 =?utf-8?B?Q0pLdXQxRXhHcUtXTHhDa3RxNkQ5RGxyTFk0Wk9iWlBaTUNpMGNDSzVza3NQ?=
 =?utf-8?B?TnNsOWhFRWQzRlJ1VTZmbmdSYVFNcWdBQUlrN05sVlBhazdzNUk3dWdxKzIx?=
 =?utf-8?B?MklXcFAvaml6ekd1WnRXbWhvaU14Tk13RDlzcW1jQ212SXdBVFVyVFRVYVlz?=
 =?utf-8?B?Ni9OQXBMV1l1RVNOZnJjOGNUaDVLSnNYTjE2Z3pLVnhQRWZCS1JwS2huaFc0?=
 =?utf-8?B?dVJ4bitaN3VZREZOSXN1VXV3N1VvTHhlWVI0NStEbU1KZkhRTmxGV1U3Tnp1?=
 =?utf-8?B?blBlR0Z1azc1R1JrejBTZkVVUGhqUWNBVkJNVFY1WEhkMnpUSmJNcHFMZjVM?=
 =?utf-8?B?SEI4TmRZbXhMTFRBYkNsTTA0ejdnV0Y1VlU5WENPZXIwMVpqWHI2UHZqYXF6?=
 =?utf-8?B?LzVGSTF0cnp1V1dTa0xzblhCZEx3dVhoWU5EYzNRV3NmUk5oaUdrZzI1M05k?=
 =?utf-8?B?TmNjRWVjUlQ4QzBVTkpHKytUdG9CUlhHcW9jaGZ2N1pFSmFJdGY5MkxDSExy?=
 =?utf-8?B?bzJTdFZDcGYxbldTVFVnbFlBRnVLalEzbE1kb2dlZFQ3VUkvT0xGMEhRNXFs?=
 =?utf-8?B?c1hmSHJScVNpUkJCL3g0amx3c1JsYVpKVTI5MzhwTnlncmFLQ3hNNExqcUR3?=
 =?utf-8?B?TkJIbVM4clJYNTJnaFFOSW0zdlVJUno1Y0lyeU5jTUhjTnV0eVl0TyszMkVp?=
 =?utf-8?B?UlpWYkdRUDl2SmZPQng3aTdLRnNIdjkvcjROQVIxTk84c3hKc3hVUlJEYk42?=
 =?utf-8?B?a0ZIVUdTWmhvaXNIOTFUbHJsaWxPY01KWmRYeXdSVlI1QUVXWHdOQUZaclht?=
 =?utf-8?B?cS9mRzZ0YTRnOEtTb1ZLL0pHT1dWSUI4SDNqak80dlFEUVAyek5YTFB2blhG?=
 =?utf-8?B?Qzhrem01TmFEREo1QkgxZHZpM0lKUzZXNk0yamc5KzZmY1MrSnNYWGN2UWRE?=
 =?utf-8?B?RDlnTy9HTlRrNmxROFRLdWNzRkpDK3JMTlZsZEMxa0xENkhSQWY4YkRNVnpH?=
 =?utf-8?B?VGxFdDB1MjN1Z2hLM2c5TVRkbEw4Y1l2NnEza2FMRGRoaHdFMWNienVZY21i?=
 =?utf-8?B?dnF4eFBFM2lTQXFzOW05UW9PRHhGZnVxVCtEZXkvK2VUc1YxQldrNFR2UzBm?=
 =?utf-8?B?cXAweGs1aTF6bUQyMGYvZXlyUDEwaEphQ2lDM1kvbjdoaEJPelZYcTR0N1R4?=
 =?utf-8?B?RlBsNXJlZURCK1g1TXR6a2Jmd1pac3E1eVdRYlpBNGlPcVV6WHVwNTZoU2xC?=
 =?utf-8?B?SFV2SmVTMWxjWjMzL2FiRng2SVRqaGZzYVprN0dtTW90WkRzUHVXcklOdEVF?=
 =?utf-8?B?aWpkR0JsbmJoR3NuQVdNOTJOY2VieXVCNE5zd2xvUTFtV09IdVlTcnJJTUta?=
 =?utf-8?B?R1FLSGNNSW5PM092bUxGZkx3UmtNdTJvUkdEdGdzWjBBTkF0Y3Z5dzN0Tlpt?=
 =?utf-8?Q?TWrUWOgFf3RPyhUd6vBRRO+95FzA3jjY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVAwN0VhMXNZY3QyajF6WkN4aFNsNUtKRll5ODJZdjRaUFhZMWVvSm9xcklJ?=
 =?utf-8?B?ZjVLSzM4ZU5KOGhXUnhzYWgvZGk3ZVJEZXNBQTRqUk5CL2lzUHFISzFxTjlX?=
 =?utf-8?B?YnF0YTU4ckJtUW8vWGZwR0ZKUUdxT2RoVm5PSWtRSUQ0eG41Nzg5WjdzQXdQ?=
 =?utf-8?B?ZVBrQkhpTnpSazVLY1hGdDU4VnpYbE5TcmlaZnFIMHFIWmlESHpGYmdibks4?=
 =?utf-8?B?azdKNi9pcHZjYkcwVXZVQkpwN25iVnY4QzlpT2pVN204ejBqQXFxekdjL0lp?=
 =?utf-8?B?K2hHUk05Q2ppam1SOEM5MFRVRHpJYVBtcURoMkRDSWp2a1hwYTZNODNZWDhV?=
 =?utf-8?B?NXBjd1FFMGR4cVo0WFZtR0JYaUZoc2V3YU9tNXVQMjM4cnZrUXl3ellEc0lw?=
 =?utf-8?B?TVh4S29heFFpSldCM2M0RjJKbHJaTEJjaFFUeVdMdjVkT3I5Mk5xQytibzBS?=
 =?utf-8?B?L1JwcWxmRXJoR05jVnc4YVhZTWl0WEc5VVVqa0s0VG5VU3FFZzkwZXEzQ3dP?=
 =?utf-8?B?UTBxMW5CclZ0Y0hLbFFPTDczL0Rsd0NPVWxMb1Jwam5SaTg0UVRvMjZmN2lR?=
 =?utf-8?B?cVlTUTBKSFBMYWdxRnVrMHNhTDkwcThjTzFhcnE4SU9pU0pTNWVSTlVYYUQ0?=
 =?utf-8?B?NERJSW1NMVdMS2pVZU1IS0w4VStDQTc1SG1xbHVRNDJCdkx2T3duQ3RkN3Zn?=
 =?utf-8?B?U2JWUHZEWnhYcW5MOHRqZ3dCemFWbEFtTW9lSzV4UjdKYmhaU0xCWGRFOXpD?=
 =?utf-8?B?UUp4K0VnY0hydjFHMnpLOFZFdTc4Y09zKzVjN3I5RHU0TGhZUFhZbzkvVGZo?=
 =?utf-8?B?ckhzVW9oNHFQdlFucGVscnpRNjQ1QlFOVEZrUFZzbS9DQ3pEWTZyVWVZUEJ6?=
 =?utf-8?B?bldFS3pldVJmdng4d1RVSFY0RzEyV2ZuSVBsdWZSMTEwQkU1OWhra083aXFi?=
 =?utf-8?B?ZHZaanlFL3E3SU9zSy84Tms4bjNwNjdwRmtoTG1LSUdCWlVXajVKSGNvTkZa?=
 =?utf-8?B?WEg5L0dwUUR2QktuWnVkVTlrYklob01DeVpUK2xxNzZaTSt6Q0kyM1RmaVBQ?=
 =?utf-8?B?YXdRK3hQM3h2ZHNJQ2FHcDRQeGJybEd1TnpyTWg3ajdueXBxeUdMdmlhOVZN?=
 =?utf-8?B?M0QxUTZVaWpHVld5RE1CWUVtR0VFK25EL1BxZGN2UUlLM0x0ZmJYTitVUUJ2?=
 =?utf-8?B?OVdITHZza2RlV2lGMjFMelFGNjBGb3NDaVNyMm1Qby91cG1hZjlienQ4QkhH?=
 =?utf-8?B?SUl4U3gyYjBFZU50Z0FkZitOZ0tjMGNtWnZ1NUI0RDFrNFVRVmc5OHAwZVZO?=
 =?utf-8?B?SU9sYW1ON2U2aVRlU2VPRmFFMnVwczliUUtRN25XOEE2dW9URXVRcTVxVm1z?=
 =?utf-8?B?SDVWMW9sMWFlTTMwdUswNmdYNmsvRGN4MEoyZVl5U3RVV2EvT280MmFTM2hv?=
 =?utf-8?B?QmdDb3g1VThEbEJwK2tNS1pSM3V5M2p0Q0xidElvNXdUdzNvTlFISUNiV1pN?=
 =?utf-8?B?Q3ZWUEozT1BwK1ZnZnc2MHNoNEtyU2dybGhUcTUvK2FuMmJzODBZL29UK1Z5?=
 =?utf-8?B?U1dGMloxNWc4VEp2elE5VkNBNGJDWkNQVW9ITFk1YUExQ1BtTjF0L09VYTVv?=
 =?utf-8?B?cFpwbUdaTDZta21URGpUUUZrQXZEUXVnYlpkQzI2VzEwODVuM1RSckh3SXUx?=
 =?utf-8?B?OXBuTkZtcGRHQzVWNG5oREJZQ0NnbUEzaUgrOE9BM25BZTN1T0N2eG1PdDRJ?=
 =?utf-8?B?VU5XbGJ1T0Nyd3NSVFJtZzl4OHlvSGxvNzZTbVk1NU50SUNOOUkrWTBHUjV1?=
 =?utf-8?B?cWE0VWs5WUY4TzdLclB0bE8rRmx6d2VJR2NtVnZucC9kYWlCNC83czZvZG1O?=
 =?utf-8?B?aGVITGJhN3RlWUtVYitCdS80WXlhRkhRcVVmN2kyZm40VG9aQ3V3MjRvMCtX?=
 =?utf-8?B?YmhUNno3aUVMclNzOWdkOW1PbVVNdGJwK0NMSXR4alVVTFROb2YyeUlwaWJD?=
 =?utf-8?B?eXhlOElOV1FueDQxcFc1TSttWmJCYkZyczkyeWx2dzgvNTdsNE94UENsUy9T?=
 =?utf-8?B?QjlnaWFMQ0w0ek9MM0tWYVRrbWxmVzFaK3d4SHlXWW11K3N5MEp1dm8rQlho?=
 =?utf-8?B?cUp0QWhxdnYyV3VkWnJyTUo5MHdyVHJvYWFUU0VqUlJ6emhMSTJsTy9GUFg3?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b8e9f7-9346-4705-3fb4-08de2c940d14
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 02:32:32.1235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uojCDNR9xHaHtBl+kykHwOjX2VXuYfEeEJwA0ckXgadhlx86wtsCk9DEwB7MPnkv15Ne7U+CVpelT0noy5V52g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
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

On Mon, Nov 24, 2025 at 05:42:23PM +0300, Dan Carpenter wrote:
> On Tue, Nov 18, 2025 at 09:05:15AM -0800, Matthew Brost wrote:
> > On Tue, Nov 18, 2025 at 06:14:54PM +0300, Dan Carpenter wrote:
> > > Hello Matthew Brost,
> > > 
> > > Commit adda4e855ab6 ("drm/xe: Enforce correct user fence signaling
> > > order using") from Oct 31, 2025 (linux-next), leads to the following
> > > Smatch static checker warning:
> > > 
> > > 	drivers/gpu/drm/xe/xe_oa.c:1867 xe_oa_stream_open_ioctl_locked()
> > > 	error: double free of 'param->syncs' (line 1863)
> > > 
> > > drivers/gpu/drm/xe/xe_oa.c
> > >     1831 static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> > >     1832                                           struct xe_oa_open_param *param)
> > >     1833 {
> > >     1834         struct xe_oa_stream *stream;
> > >     1835         struct drm_syncobj *ufence_syncobj;
> > >     1836         int stream_fd;
> > >     1837         int ret;
> > >     1838 
> > >     1839         /* We currently only allow exclusive access */
> > >     1840         if (param->oa_unit->exclusive_stream) {
> > >     1841                 drm_dbg(&oa->xe->drm, "OA unit already in use\n");
> > >     1842                 ret = -EBUSY;
> > >     1843                 goto exit;
> > >     1844         }
> > >     1845 
> > >     1846         ret = drm_syncobj_create(&ufence_syncobj, DRM_SYNCOBJ_CREATE_SIGNALED,
> > >     1847                                  NULL);
> > >     1848         if (ret)
> > >     1849                 goto exit;
> > >     1850 
> > >     1851         stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> > >     1852         if (!stream) {
> > >     1853                 ret = -ENOMEM;
> > >     1854                 goto err_syncobj;
> > >     1855         }
> > >     1856         stream->ufence_syncobj = ufence_syncobj;
> > >     1857         stream->oa = oa;
> > >     1858 
> > >     1859         ret = xe_oa_parse_syncs(oa, stream, param);
> > >     1860         if (ret)
> > >     1861                 goto err_free;
> > >     1862 
> > >     1863         ret = xe_oa_stream_init(stream, param);
> > >     1864         if (ret) {
> > >     1865                 while (param->num_syncs--)
> > >     1866                         xe_sync_entry_cleanup(&param->syncs[param->num_syncs]);
> > > --> 1867                 kfree(param->syncs);
> > >                          ^^^^^^^^^^^^^^^^^^^^
> > > 
> > > xe_oa_stream_init() already frees param->syncs when it calls
> > > xe_oa_emit_oa_config().
> > > 
> > 
> > Admittedly this coded poorly but I think this a false positive.
> > param->syncs is only freed when xe_oa_stream_init returns success.
> > 
> > That said this should probably be refactored a bit for clarity.
> > 
> 
> Sorry for this.  It's a bug in Smatch, yes.  I'm testing a fix for this.
> 

All good. I don’t think there is anyone in Linux who doesn’t appreciate Smatch.

Matt

> Thanks for looking into it.
> 
> regards,
> dan carpenter
> 
> 
> > Matt
> > 
> > >     1868                 goto err_free;
> > >     1869         }
> > >     1870 
> > >     1871         if (!param->disabled) {
> > >     1872                 ret = xe_oa_enable_locked(stream);
> > >     1873                 if (ret)
> > >     1874                         goto err_destroy;
> > >     1875         }
> > >     1876 
> > >     1877         stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
> > >     1878         if (stream_fd < 0) {
> > >     1879                 ret = stream_fd;
> > >     1880                 goto err_disable;
> > >     1881         }
> > >     1882 
> > >     1883         /* Hold a reference on the drm device till stream_fd is released */
> > >     1884         drm_dev_get(&stream->oa->xe->drm);
> > >     1885 
> > >     1886         return stream_fd;
> > >     1887 err_disable:
> > >     1888         if (!param->disabled)
> > >     1889                 xe_oa_disable_locked(stream);
> > >     1890 err_destroy:
> > >     1891         xe_oa_stream_destroy(stream);
> > >     1892 err_free:
> > >     1893         kfree(stream);
> > >     1894 err_syncobj:
> > >     1895         drm_syncobj_put(ufence_syncobj);
> > >     1896 exit:
> > >     1897         return ret;
> > >     1898 }
> > > 
> > > regards,
> > > dan carpenter
