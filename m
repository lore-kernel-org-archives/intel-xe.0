Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD3AC36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 14:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2910EBDC;
	Fri, 11 Apr 2025 14:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/cjl7y4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0DF10EBDC
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744382416; x=1775918416;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=N9P7qlGEXd04w2eyfebea/BQ+8gRgzSkps6U8YHUY5k=;
 b=U/cjl7y4kmwkDwqt7Wr0o9ESchczSZRh++r4RcJnNs0BasCz1nf1TIay
 K6XIIk1hAwoE79jrEa5wv80ZEcT4yjyToKzI6jlva+cFVcE/y4IqPTmrm
 8AJrrg1EKrHDUBiGKvDZavzehz+2sg6JdCkpRxDLpO9lpwmSuZCQLgjyq
 uF3teynrguOaKK+EfavEBuZngN83VxYJA58Dpic1s0HtHeZbQVNI5yGfE
 rzWsL/GBbl9exFr2Uf8kc/y/bMUTid5pMQSV6epj9xmotx5hxNmYe9Enr
 /NyAVttymKyCHTuJztnbuaACerBJmhCbNfHDj/XRh4gHQ1JxIDk6xiNU7 g==;
X-CSE-ConnectionGUID: yr6wDncuQba2I/1WHH6Q1Q==
X-CSE-MsgGUID: 9dAE/DPjQtKiE04Bv463iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="68426691"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208,217";a="68426691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:40:09 -0700
X-CSE-ConnectionGUID: IZZLs8M0STWrhWt02OlzrA==
X-CSE-MsgGUID: ccavigReSe6f4KBdJAxoCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
 d="scan'208,217";a="129778397"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:40:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 07:40:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 07:40:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 07:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqLbL+gpbkeYVOB65ajpVqXGrQLhqujs+uzH/bF4nA/AJwL0zs7VrveIid9DfeAa183a4Wd19BOPGQqXc4o4aIlgjvl8ImcgaqWxMslfN0g9l+qzzrr6ROz/QlOtfc8ffmyiM66bZ95GOXfwrcaPjXWzZGzqAY3wSgXev3dcmdeG4mn36w0PbAO2uFYWmWLrApuYEteL5BVojIBIShFnd2+ui3yvTK9xDpJDtofVTmWWG67iykwSDz+BSxA24KCQmpMDGOijNM46JHnswvoMKaAuukUHH51FOe6qV7ksWXVjvaGrkLchkwgd8YLc/jtvGzISoIODmSOZ0GXQ6jK2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09HKity/2KVGnG6KLJkE75TyWdNJmijviqrDKoZ2aho=;
 b=mpxplzDh9lSsBRDsDmNUurhOfrtExPYYRB/XfddcklkPvMWaMGZyyGa6TrgeaDa0ldkMtrqorVE0Vx+XLnZsvN69OfqAH+0m+0emZafp9gX5re7zbK2mTq+7kvT/XefxoDOTrhwCK8NBIqeGnOqfUPutkcE7elO6D/pC2S5v+yCoBtOwn/2lFMAglf0dHu0dyQ7DHqFrXBxzna4rRaVaZThBTjJ4grCq0Cy318ULVyQdvIeMm+LxyRsG02raw3tAGfv1A0S6VkCwNJaWIYE498c8HrjK584lj0Z4K/jI+jomYP/NsFwami7D/iqcTJ26G2P+vGXd6iDKMBIaxUXqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by PH7PR11MB5959.namprd11.prod.outlook.com (2603:10b6:510:1e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 14:39:49 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:39:49 +0000
Content-Type: multipart/alternative;
 boundary="------------byuUUYGJjsNojSk2gu0c3R5s"
Message-ID: <ffe2656f-a952-4fae-ad91-9ca9a4cb5678@intel.com>
Date: Fri, 11 Apr 2025 16:39:43 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v8 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250409211340.3046931-1-tomasz.lis@intel.com>
 <20250409211340.3046931-5-tomasz.lis@intel.com>
 <4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com>
Content-Language: en-US
In-Reply-To: <4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com>
X-ClientProxiedBy: VI1PR09CA0107.eurprd09.prod.outlook.com
 (2603:10a6:803:78::30) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|PH7PR11MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 498893d5-c7c1-41ad-75b3-08dd7906b64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1NCK3lXcWROSkJoRDB0djlxandiUEwyNzVDMkVCWWw5Y1QyL3l1ZTVJTzBJ?=
 =?utf-8?B?ZFVxWkhJSjZLTjJ6NG9Tb3JiVmNvT1hFaVRScWdDQ1AybjhlOUUrUi9EWUdx?=
 =?utf-8?B?YnRnZStKbVQvVmJVRE1VTmRjbGR6eS84ZHBnYW9CQzZRUXJveFlNMTZhMkxn?=
 =?utf-8?B?VTVYdThGRE5lRklRcGNsTlYzOTB0QTU2ZXpHQ00xdGNUdFJ2dTM0UGo0dWJF?=
 =?utf-8?B?OXM5b296bVhyYW81YVVRVTl0anpXVzBqc25wVmplSVhqaTgreFBXNUwvT1BH?=
 =?utf-8?B?bnZNdmpSUHYyd2I5VTRKZ0Rzb2ZjRGFPYmlZM2t6aE9ZR0F1cllGQkEzcnVS?=
 =?utf-8?B?NmJlb3U1N0pTb0hpcFBHUm1mdnhFUHl4L21pcVNwTXNidTAzZTZmclBnWE5R?=
 =?utf-8?B?SnVzdm8xMyszQ1ZtQ3EvZ2JIR0xXZE1UUC9vOHZ5SXNTQkdrSmhjT3NRd3FY?=
 =?utf-8?B?eXp1ckxYcUFabm56djQ5MmF5MEdrUi8vUFJ0aVloUkdpUVFXMWxldE82QUlw?=
 =?utf-8?B?N1lMcEdTaldWK0xNV1hWSzJXdFdGbWIrQ2xPTUIvakM3TlNhNWIwd08xOVh2?=
 =?utf-8?B?cmtOS1JBUzBOdmczTXlrKzIyRUFXWTRPeVREa2NHcXIxcVBWOEw4RzQxaitz?=
 =?utf-8?B?d3hZN25BUENmcW9meGJBMC9Lb0tVNmcxK2FPS25UK1JuMEhqNWx1K0JDeDZs?=
 =?utf-8?B?SGMxNDRxeHE2RlhBMDVoOGVQeUJ0eDZwOElkVkthaTRXc2dyRkhsdkNoQXVt?=
 =?utf-8?B?bTkvSWNDUUpEdVBVRzR3dkZtQjFuaDErWEd0bjJ4a2U3TzVtQmRubkVjNnRB?=
 =?utf-8?B?dXJuc1hFOUhXODVLcDB5L1FvSFRDTUcwVjU1a0ZYaytUMSs2bTZET0hCWTY2?=
 =?utf-8?B?cGN6YVJYREdZZG8yUi81QXpxa1FSQWdRTDRUeTM2d2VJTlVBaG1SbmFwWmVk?=
 =?utf-8?B?R2Y3ajI0a3ZsdzZWSEY4WkVZclg4V3RkcXlURGZNcWc3NFdSeUhIajhMTGNi?=
 =?utf-8?B?WmxBUUNMQlNLbi9mREhXNE00VXBZbW9lVytJRENJZTZPelAwSGk3ZU9PeFhE?=
 =?utf-8?B?M0E2QXQxZ0F4OW1wbFhzS3BobklBanQ4OEVkMUI2T2xnZGI3Rnd2aWoyaUFi?=
 =?utf-8?B?bld0QXl2cGRTeXhtOWltR0pVTGRPbis2VXA5TG9qOHRCdFBzU3JtaXpuYkFj?=
 =?utf-8?B?WWEwWnVIU29OVlpRanNpMlpzdmFDbStpRDl3TVhucjIwWmlsaTludGRqQUZa?=
 =?utf-8?B?NjNrNjhpVGl6K056bEl4TDAwdEVZMzc5bzJ1a0N4T3NZUUc0Z1d6RVFpdjVZ?=
 =?utf-8?B?dGh2aS9YWTk5a3BETm91Yks2VmZXZ1FRTGYwcHZydXlQSzZoOEhackJNVGtV?=
 =?utf-8?B?eCs3RFA3dStpbWhWZ3JkazBFK0xWZXd6S3VEcGJ3ME8xOE5JVWhWVDM5eGNm?=
 =?utf-8?B?VCtDY3Jwd3VoQ3JuYXVRRGVDbUdzNzN0QmdLSDVrd2huMnhlb3VSQ1pNNDVE?=
 =?utf-8?B?enRUaXhrcVNHU2o2RWRXa1Vqd3BQS2xLQXVtSGdzLzRpRmYwRUt5MGJSWTNm?=
 =?utf-8?B?a1lpYlhCQ0tBYlB4NTc3MDVpMEFBbi9DWittMzB4ckh3UzB6TzRHYnNOWS90?=
 =?utf-8?B?ZXh3OGVMQk0rSnRPZmVMUUhVUFNkRzk5UUFUOXFsakhPWjQ1VXFMdGduSEwx?=
 =?utf-8?B?OExMdDZHaXJhKzBJNDZGUFcwMzlBMHZQeW5QcW5JcWN1QWpURkUvNDVIYlli?=
 =?utf-8?B?bzZDMXJsVmhGSCtxQUE5Ynh4eGhiL21XU0c2djhOVElMTWtXOGZsZTBxdjA1?=
 =?utf-8?B?c1ZQZ0hZa2t4UWQwWWJsTlJqVDRCODdUdUNqK2xWelNMMzNiOWRJL0ZEdW9B?=
 =?utf-8?B?Zzg3ZHZ0aFpYeTNoeDZ5Vkxia1Jzai84VHUwZExQYXVsaUpUU3ZzOUFQRjdn?=
 =?utf-8?Q?OzF1YPEHxBQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akFROWNOZTUrMkl4SElnckwzUDZ3Wm5iQ3k0cVRaS2NZb2FtSjl2MDdrWGRW?=
 =?utf-8?B?Q01JVlFXQzR5bHhqUzRuMEE1T1JEL2hVRmF3b0NqK3RPQlNES3kzWTNrSDkw?=
 =?utf-8?B?cTlYUWMrZXp1cXhCTFJhVHBHM0ltZWFISjNNR1NsQ2d0ZFlSTTNMcjRwVmVM?=
 =?utf-8?B?Qk1xUHU1Qld2ajdOSW1RMXkwaXpwc1JjVlUxSVUzK3dJZnpGVlh1b0RtMmNm?=
 =?utf-8?B?YTdjcFpwdWdjR1AvbC9sVUIyeVVpUEdYQnFhQ2xyb0QwYmRwT1VPdHJLMkts?=
 =?utf-8?B?VWVYTFZRSGUwVUhRU3FtQjFCNk0rbEtDT0NUQ3N1NzI5T2Urekl0MEI3Rllv?=
 =?utf-8?B?MEJDU0M4bUtYRlczZFN6TnFjRjJIajFRWWxkZjNaankzekpmWXlHaXpwWnI1?=
 =?utf-8?B?QUFjMFRCVEdYcWs5V2NRYVNUblFPaEdkeGhUTmwxQ1lZTE1DM3BrVUF2RFgx?=
 =?utf-8?B?ZGRNc0Q2UkF0bVVYcElsM3dGMFFoMWJrNjJvc3NCaTBybHp3UHZ4WUdSZlRx?=
 =?utf-8?B?T2R3K0VldVcvbndJZXY5Q0czR2lBL1pDYkVkcHBGSldxM25kVno3RkhCZEZ3?=
 =?utf-8?B?Vlk2UXVQRW4wdlpSYUlaQVkrcS9BeGVCR3AvQ3c2eGJjOFBrOG16dUtyWHY1?=
 =?utf-8?B?REFiUXJ5V01aVk5lN3JFcVRaQVRlajNUeEEydU9nZEg5Sng3QVRra2pZQ3No?=
 =?utf-8?B?QjdZcE53Z0Z4UDBDK21MNUJ2aWxTUVJVY3l2TWNORDV2dmxMYjFEaXBrRXZ1?=
 =?utf-8?B?RVQ1Vjl0RllCZ3FqaytubjV6Tlo3Y0JyUHZRNHFhc3hzNlN1N3l5cTIwa3pr?=
 =?utf-8?B?Vkp3MThIcVh4OFJkSU5MY1hTOWVnZzJzV0pKKytTZVBmNUE0L0hvUTM0QUsx?=
 =?utf-8?B?dWNnU0JZNlpYQ1AyNXVWc3A2dVdFYlpxelV6dDdsNGcvbHlxQjRvOXc4TFVz?=
 =?utf-8?B?ZnNEdnlaNFBBMElPcEJxNnhqanlsSW1Qb05ITWJCam1vU3phQWhUM1BITTlQ?=
 =?utf-8?B?RTRiRDFPQ0w3Sk15aW1uSmtGS3hSMEh4b1pDU0tQLzVObExTbXlFU1llSFFH?=
 =?utf-8?B?QkE5elRaeDVPMXA0bVorVjZ3VC9PYnhuK2NWRlBTL2Ruejg3QXFVLzF3WmhR?=
 =?utf-8?B?U1dFN0p3dEFaQVcvanh6c256dGcxVFBiNlU2R0ZTUm83bTk5c040emxxb29i?=
 =?utf-8?B?alkvYy8xcU1vYVZmUnRwRklFa0d6cmdWOXhCaWFwWEdVK24rSlh3UjE5alNz?=
 =?utf-8?B?ZUhPNGlXWGl1a1cvd3NqYWpmeEl2VFFMZlozOW5DcVJENzdCbHVDcG9YaTZZ?=
 =?utf-8?B?WllreUY4cVpxUUNIdkFnejZhMlRnbXV3RDdKd1VwY2haa0txRXRZc1QwbFh6?=
 =?utf-8?B?QThTeExudVBkWVhQTFZ2M0RDSHRodmJ4ZURmTk9JMXdPZ3lraW03Nll4dlVP?=
 =?utf-8?B?N3l4dytMYW1hSWhtdWZJMHpYcU41dm9YRk01T01qcDJhaDFVaWNUVWFmdCtS?=
 =?utf-8?B?SzIwaUp6Uk5vbURiU2VmVnhWZDdzZGhaaFdYK1BLdVdOUmlxREVib3IyZGxw?=
 =?utf-8?B?SlZ0YjVGekM1dXJPRUl5NHRZbHBPSHhwdEVPUGZ4UjF4cDY5SnZ1MVlhOE1n?=
 =?utf-8?B?cnFXQUhkUnFwRzVCcjl0Z2hGRnVjR2RPSVF6UmtaTjFWR1owNVlpUTJaMjhv?=
 =?utf-8?B?Z2xtcWtwR3owb054RHpaTHM0bXhXb0FiNXJNUmpLSUk0dmwxZmgxeUlHY2N2?=
 =?utf-8?B?ZWRSR3hxOVg1RVdKK3E4WnJVK04xNlo5NmJ2NEQ4THpZeFdIYnliQVZwS1dT?=
 =?utf-8?B?NUJhQUNQalcxS2RKaHMwYzUvaGpXRXN3bnRCb25UKzQzOW5vNlo1WmNEUXVV?=
 =?utf-8?B?d2YrQTI1d29CRjk0bHI2T0t2dWduK2Nzelk4UmJldXZ2TC9YczhJa0toNW1D?=
 =?utf-8?B?dWVPOGd2ZU5nRll1OUYxSk5YSjVBRHk1RUFpL2ozbllBci9ydEJETWZmWTBE?=
 =?utf-8?B?d1lnbkh5VnZLT3NyNXBCUy9yZEMwUm5QaUtLZFE1dmVHdEFIaWxsaW84UTBS?=
 =?utf-8?B?THE0UFZQOTdteWxmYXZ4M1YzamlseFNTYklXVW4yd3YyY0JlMnRiZUYyR2VH?=
 =?utf-8?Q?a+mKedlgWnUi5WNGr/UK8Yp3m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 498893d5-c7c1-41ad-75b3-08dd7906b64c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:39:49.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nk01/aS3EsOM8rZ+ld7VI3bMLcx99D/gGrZ7Ffc8qMe2bqDzlrNj0IKmt+mVjBKplHbFAJ3YEwOjsfXRj1fGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5959
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

--------------byuUUYGJjsNojSk2gu0c3R5s
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10.04.2025 19:58, Michal Wajdeczko wrote:
> On 09.04.2025 23:13, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it is necessary to update
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barrier taken remains GGTT address lock - which is ok,
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
>>
>> The GGTT address locking will be introduced in a future series.
>>
>> v2: removed storing shift as that's now done in VMA nodes patch;
>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>> v3: removed inline keywords, enums for offsets in CTB messages,
>>    less error messages, if return unused then made functs void (Michal)
>> v4: update the cached head before starting fixups
>> v5: removed/updated comments, wrapped lines, converted assert into
>>    error, enums for offsets to separate patch, reused xe_map_rd
>> v6: define xe_map_*_array() macros, support CTB wrap which divides
>>    a message, updated comments, moved one function to an earlier patch
>> v7: renamed few functions, wider use on previously introduced helper,
>>    separate cases in parsing messges, documented a static funct
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c   | 161 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>>   drivers/gpu/drm/xe/xe_map.h      |  12 +++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c |  18 ++++
>>   4 files changed, 193 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 0a4fef7d7225..66a1a14f45a5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1623,6 +1625,165 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +static void xe_ring_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
> hmm, name is little ambiguous, as it is too similar to other xe_..._map
> helpers where suffix is used for different purpose, maybe drop "map":
>
> 	xe_fixup_u64_in_cmds()
ok
>> +				  u32 size, u32 head, u32 pos, s64 shift)
> hmm, btw, do we really need to two separate params "head" and "pos"?
> this function just do fixup at one specific location

I don't really want another complication around these ridiculously long 
enum members.

But now that will match the calls to `xe_map_rd_ring_u32()`, so will do.

>> +{
>> +	u32 hi, lo;
>> +	u64 offset;
>> +
>> +	lo = xe_map_rd_array_u32(xe, cmds, (head + pos) % size);
>> +	hi = xe_map_rd_array_u32(xe, cmds, (head + pos + 1) % size);
>> +	offset = make_u64(hi, lo);
>> +	offset += shift;
>> +	lo = lower_32_bits(offset);
>> +	hi = upper_32_bits(offset);
>> +	xe_map_wr_array_u32(xe, cmds, (head + pos) % size, lo);
>> +	xe_map_wr_array_u32(xe, cmds, (head + pos + 1) % size, hi);
>> +}
>> +
>> +/*
>> + * Shift any GGTT addresses within a single message left within CTB from
>> + * before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
>> + * @shift: the address shift to be added to each GGTT reference
>> + */
>> +static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
>> +					   struct iosys_map *cmds, u32 head,
>> +					   u32 len, u32 size, s64 shift)
> -:84: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
> #84: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1655:
> +static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
> +					   struct iosys_map *cmds, u32 head,
>
> did you really run checkpatch.pl as promised ?
Many functions got renamed on your request.
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 action, i, n;
>> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
> again, please try to order vars in rev-xmas-tree
ok
>> +
>> +	msg[0] = xe_map_rd_array_u32(xe, cmds, head);
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
>> +		xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +				      XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				      shift);
>> +		xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +				      XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
>> +				      shift);
>> +		xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +				      XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
>> +		break;
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>> +		xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +				      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				      shift);
>> +		xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +				      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
>> +				      shift);
>> +		n = xe_map_rd_array_u32(xe, cmds, head +
>> +			       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS);
> head + DATA_10_NUM_CTXS could be > cmds.size
>
> maybe it's time for
>
> u32 xe_map_rd_ring_u32(xe, map, idx, size)
> {
> 	return xe_map_rd_array_u32(xe, map, idx % size);
> }
>
> it could be used in xe_ring_map_fixup_u64() above

Yes, that's a future bug. will add the helper function.

>> +		for (i = 0; i < n; i++)
>> +			xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +					      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
>> +					      + 2 * i, shift);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +/** Apply fixups to a single outgoing CT message within given CTB
> please put more attention to comment styles, here it should be:
>
> /*
>   * Apply fixups to a single outgoing CT message within given CTB
right.
>> + * @ct: the &xe_guc_ct struct instance representing the target GuC
>> + * @h2g: the &guc_ctb struct instance of the target buffer
>> + * @shift: shift to be added to all GGTT addresses within the CTB
>> + * @mhead: pointer to an integer storing message start position; the
>> + *   position is changed to next message before this function return
>> + * @avail: size of the area available for parsing, that is length
>> + *   of all remaining messages stored within the CTB
>> + * Return: size of the area available for parsing after one message
>> + *   has been parsed, that is length remaining from the updated mhead
>> + */
>> +static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
>> +					 s64 shift, u32 *mhead, s32 avail)
> -:135: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
> #135: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1706:
> +static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb
> *h2g,
> +					 s64 shift, u32 *mhead, s32 avail)

will fix. And do checkpatch again.

-Tomasz

>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
>> +	u32 size = h2g->info.size;
>> +	u32 head = *mhead;
>> +	u32 len;
>> +
>> +	xe_gt_assert(ct_to_gt(ct), avail >= (s32)GUC_CTB_MSG_MIN_LEN);
>> +
>> +	/* Read header */
>> +	msg[0] = xe_map_rd_array_u32(xe, &h2g->cmds, head);
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
>> +	}
>> +
>> +	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
>> +	ct_fixup_ggtt_in_message(ct, &h2g->cmds, head, msg_len_to_hxg_len(len), size, shift);
>> +	*mhead = (head + msg_len_to_hxg_len(len)) % size;
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
>> + * @ct: pointer to CT struct of the target GuC
>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>> + *
>> + * Messages in guc-to-host CTB are owned by GuC and any fixups in them
>> + * are made by GuC. But content of the host-to-guc CTB is owned by the
>> + * KMD, so fixups to GGTT references in any pending messages need to be
>> + * applied here.
>> + * This function updates GGTT offsets in payloads of pending H2G CTB
>> + * messages (messages which were not consumed by GuC before the VF got
>> + * paused).
>> + */
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
>> +{
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	u32 head, tail, size;
>> +	s32 avail;
>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return;
>> +
>> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>> +	head = h2g->info.head;
>> +	tail = READ_ONCE(h2g->info.tail);
>> +	size = h2g->info.size;
>> +
>> +	if (unlikely(head > size))
>> +		goto corrupted;
>> +
>> +	if (unlikely(tail >= size))
>> +		goto corrupted;
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	xe_gt_assert(gt, avail >= 0);
>> +
>> +	while (avail > 0)
>> +		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &head, avail);
>> +
>> +	return;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
>> +		 head, tail, size);
>> +	h2g->info.broken = true;
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..5649bda82823 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
>> index f62e0c8b67ab..db98c8fb121f 100644
>> --- a/drivers/gpu/drm/xe/xe_map.h
>> +++ b/drivers/gpu/drm/xe/xe_map.h
>> @@ -78,6 +78,18 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
>>   	iosys_map_wr(map__, offset__, type__, val__);			\
>>   })
>>   
>> +#define xe_map_rd_array(xe__, map__, index__, type__)			\
>> +	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
>> +
>> +#define xe_map_wr_array(xe__, map__, index__, type__, val__)		\
>> +	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
>> +
>> +#define xe_map_rd_array_u32(xe__, map__, index__)			\
>> +	xe_map_rd_array(xe__, map__, index__, u32)
>> +
>> +#define xe_map_wr_array_u32(xe__, map__, index__, val__)		\
>> +	xe_map_wr_array(xe__, map__, index__, u32, val__)
>> +
>>   #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
>>   	struct xe_device *__xe = xe__;					\
>>   	xe_device_assert_mem_access(__xe);				\
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index e70f1ceabbb3..2674fa948fda 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +
>> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>> +	}
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>> +	if (need_fixups)
>> +		vf_post_migration_fixup_ctb(xe);
>> +
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
--------------byuUUYGJjsNojSk2gu0c3R5s
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10.04.2025 19:58, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com">
      <pre wrap="" class="moz-quote-pre">On 09.04.2025 23:13, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">During post-migration recovery of a VF, it is necessary to update
GGTT references included in messages which are going to be sent
to GuC. GuC will start consuming messages after VF KMD will inform
it about fixups being done; before that, the VF KMD is expected
to update any H2G messages which are already in send buffer but
were not consumed by GuC.

Only a small subset of messages allowed for VFs have GGTT references
in them. This patch adds the functionality to parse the CTB send
ring buffer and shift addresses contained within.

While fixing the CTB content, ct-&gt;lock is not taken. This means
the only barrier taken remains GGTT address lock - which is ok,
because only requests with GGTT addresses matter, but it also means
tail changes can happen during the CTB fixups execution (which may
be ignored as any new messages will not have anything to fix).

The GGTT address locking will be introduced in a future series.

v2: removed storing shift as that's now done in VMA nodes patch;
  macros to inlines; warns to asserts; log messages fixes (Michal)
v3: removed inline keywords, enums for offsets in CTB messages,
  less error messages, if return unused then made functs void (Michal)
v4: update the cached head before starting fixups
v5: removed/updated comments, wrapped lines, converted assert into
  error, enums for offsets to separate patch, reused xe_map_rd
v6: define xe_map_*_array() macros, support CTB wrap which divides
  a message, updated comments, moved one function to an earlier patch
v7: renamed few functions, wider use on previously introduced helper,
  separate cases in parsing messges, documented a static funct

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_ct.c   | 161 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
 drivers/gpu/drm/xe/xe_map.h      |  12 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c |  18 ++++
 4 files changed, 193 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0a4fef7d7225..66a1a14f45a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -84,6 +84,8 @@ struct g2h_fence {
 	bool done;
 };
 
+#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) &lt;&lt; 32 | (u32)(lo)))
+
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
 	g2h_fence-&gt;response_buffer = response_buffer;
@@ -1623,6 +1625,165 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
+static void xe_ring_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">hmm, name is little ambiguous, as it is too similar to other xe_..._map
helpers where suffix is used for different purpose, maybe drop &quot;map&quot;:

	xe_fixup_u64_in_cmds()</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+				  u32 size, u32 head, u32 pos, s64 shift)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">hmm, btw, do we really need to two separate params &quot;head&quot; and &quot;pos&quot;?
this function just do fixup at one specific location</pre>
    </blockquote>
    <p>I don't really want another complication around these
      ridiculously long enum members.</p>
    <p>But now that will match the calls to <span style="white-space: pre-wrap">`xe_map_rd_ring_u32()`, so will do.</span></p>
    <p> </p>
    <blockquote type="cite" cite="mid:4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	u32 hi, lo;
+	u64 offset;
+
+	lo = xe_map_rd_array_u32(xe, cmds, (head + pos) % size);
+	hi = xe_map_rd_array_u32(xe, cmds, (head + pos + 1) % size);
+	offset = make_u64(hi, lo);
+	offset += shift;
+	lo = lower_32_bits(offset);
+	hi = upper_32_bits(offset);
+	xe_map_wr_array_u32(xe, cmds, (head + pos) % size, lo);
+	xe_map_wr_array_u32(xe, cmds, (head + pos + 1) % size, hi);
+}
+
+/*
+ * Shift any GGTT addresses within a single message left within CTB from
+ * before post-migration recovery.
+ * @ct: pointer to CT struct of the target GuC
+ * @cmds: iomap buffer containing CT messages
+ * @head: start of the target message within the buffer
+ * @len: length of the target message
+ * @size: size of the commands buffer
+ * @shift: the address shift to be added to each GGTT reference
+ */
+static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
+					   struct iosys_map *cmds, u32 head,
+					   u32 len, u32 size, s64 shift)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">-:84: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#84: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1655:
+static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
+					   struct iosys_map *cmds, u32 head,

did you really run checkpatch.pl as promised ?</pre>
    </blockquote>
    Many functions got renamed on your request.<br>
    <blockquote type="cite" cite="mid:4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 action, i, n;
+	u32 msg[GUC_HXG_MSG_MIN_LEN];
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">again, please try to order vars in rev-xmas-tree</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	msg[0] = xe_map_rd_array_u32(xe, cmds, head);
+	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
+	switch (action) {
+	case XE_GUC_ACTION_REGISTER_CONTEXT:
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
+				      shift);
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
+				      shift);
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
+		break;
+	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
+				      shift);
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
+				      shift);
+		n = xe_map_rd_array_u32(xe, cmds, head +
+			       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">head + DATA_10_NUM_CTXS could be &gt; cmds.size

maybe it's time for

u32 xe_map_rd_ring_u32(xe, map, idx, size)
{
	return xe_map_rd_array_u32(xe, map, idx % size);
}

it could be used in xe_ring_map_fixup_u64() above</pre>
    </blockquote>
    <p>Yes, that's a future bug. will add the helper function.</p>
    <blockquote type="cite" cite="mid:4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		for (i = 0; i &lt; n; i++)
+			xe_ring_map_fixup_u64(xe, cmds, size, head,
+					      XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
+					      + 2 * i, shift);
+		break;
+	default:
+		break;
+	}
+}
+
+/** Apply fixups to a single outgoing CT message within given CTB
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">please put more attention to comment styles, here it should be:

/*
 * Apply fixups to a single outgoing CT message within given CTB</pre>
    </blockquote>
    right.<br>
    <blockquote type="cite" cite="mid:4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @ct: the &amp;xe_guc_ct struct instance representing the target GuC
+ * @h2g: the &amp;guc_ctb struct instance of the target buffer
+ * @shift: shift to be added to all GGTT addresses within the CTB
+ * @mhead: pointer to an integer storing message start position; the
+ *   position is changed to next message before this function return
+ * @avail: size of the area available for parsing, that is length
+ *   of all remaining messages stored within the CTB
+ * Return: size of the area available for parsing after one message
+ *   has been parsed, that is length remaining from the updated mhead
+ */
+static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
+					 s64 shift, u32 *mhead, s32 avail)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">-:135: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#135: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1706:
+static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb
*h2g,
+					 s64 shift, u32 *mhead, s32 avail)</pre>
    </blockquote>
    <p>will fix. And do checkpatch again.<br>
    </p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 msg[GUC_HXG_MSG_MIN_LEN];
+	u32 size = h2g-&gt;info.size;
+	u32 head = *mhead;
+	u32 len;
+
+	xe_gt_assert(ct_to_gt(ct), avail &gt;= (s32)GUC_CTB_MSG_MIN_LEN);
+
+	/* Read header */
+	msg[0] = xe_map_rd_array_u32(xe, &amp;h2g-&gt;cmds, head);
+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
+
+	if (unlikely(len &gt; (u32)avail)) {
+		xe_gt_err(ct_to_gt(ct), &quot;H2G channel broken on read, avail=%d, len=%d, fixups skipped\n&quot;,
+			  avail, len);
+		return 0;
+	}
+
+	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
+	ct_fixup_ggtt_in_message(ct, &amp;h2g-&gt;cmds, head, msg_len_to_hxg_len(len), size, shift);
+	*mhead = (head + msg_len_to_hxg_len(len)) % size;
+
+	return avail - len;
+}
+
+/**
+ * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
+ *
+ * Messages in guc-to-host CTB are owned by GuC and any fixups in them
+ * are made by GuC. But content of the host-to-guc CTB is owned by the
+ * KMD, so fixups to GGTT references in any pending messages need to be
+ * applied here.
+ * This function updates GGTT offsets in payloads of pending H2G CTB
+ * messages (messages which were not consumed by GuC before the VF got
+ * paused).
+ */
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
+{
+	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct guc_ctb *h2g = &amp;ct-&gt;ctbs.h2g;
+	u32 head, tail, size;
+	s32 avail;
+
+	if (unlikely(h2g-&gt;info.broken))
+		return;
+
+	h2g-&gt;info.head = desc_read(ct_to_xe(ct), h2g, head);
+	head = h2g-&gt;info.head;
+	tail = READ_ONCE(h2g-&gt;info.tail);
+	size = h2g-&gt;info.size;
+
+	if (unlikely(head &gt; size))
+		goto corrupted;
+
+	if (unlikely(tail &gt;= size))
+		goto corrupted;
+
+	avail = tail - head;
+
+	/* beware of buffer wrap case */
+	if (unlikely(avail &lt; 0))
+		avail += size;
+	xe_gt_dbg(gt, &quot;available %d (%u:%u:%u)\n&quot;, avail, head, tail, size);
+	xe_gt_assert(gt, avail &gt;= 0);
+
+	while (avail &gt; 0)
+		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &amp;head, avail);
+
+	return;
+
+corrupted:
+	xe_gt_err(gt, &quot;Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n&quot;,
+		 head, tail, size);
+	h2g-&gt;info.broken = true;
+}
+
 static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
 							bool want_ctb)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 82c4ae458dda..5649bda82823 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct-&gt;state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index f62e0c8b67ab..db98c8fb121f 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -78,6 +78,18 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
 	iosys_map_wr(map__, offset__, type__, val__);			\
 })
 
+#define xe_map_rd_array(xe__, map__, index__, type__)			\
+	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
+
+#define xe_map_wr_array(xe__, map__, index__, type__, val__)		\
+	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
+
+#define xe_map_rd_array_u32(xe__, map__, index__)			\
+	xe_map_rd_array(xe__, map__, index__, u32)
+
+#define xe_map_wr_array_u32(xe__, map__, index__, val__)		\
+	xe_map_wr_array(xe__, map__, index__, u32, val__)
+
 #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
 	struct xe_device *__xe = xe__;					\
 	xe_device_assert_mem_access(__xe);				\
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index e70f1ceabbb3..2674fa948fda 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_sriov_printk.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
+#include &quot;xe_guc_ct.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_sriov_printk.h&quot;
@@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	for_each_gt(gt, xe, id) {
+		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
+
+		xe_guc_ct_fixup_messages_with_ggtt(&amp;gt-&gt;uc.guc.ct, shift);
+	}
+}
+
 /*
  * vf_post_migration_imminent - Check if post-restore recovery is coming.
  * @xe: the &amp;xe_device struct instance
@@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
+	if (need_fixups)
+		vf_post_migration_fixup_ctb(xe);
+
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&amp;xe-&gt;drm, &quot;migration recovery ended\n&quot;);
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------byuUUYGJjsNojSk2gu0c3R5s--
