Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36F6C61CE7
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 16:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D1510E0E6;
	Thu,  5 Jun 2025 16:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8DJhn0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D26410E0E6
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749139949; x=1780675949;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hd2H9+Uxvw7M7x2R3bozQuDs92HbYLgvgiRldy5Ammw=;
 b=m8DJhn0n/S7YRK60chq/NxvL4ucfpVFXAJrTSEB9v8kGAROaefZixlVN
 62A0J1iH7c26Je07cbrhAzA3005lCZF2S7eVY9I5BmIZnpdtZBLkGBK/u
 dpAmuPzohMw9qELbGKih6DSQc2MG1WP7ojcTPzHkjV305at2zFr8C9v7F
 511jTR0wGWR6k/JINCkWWPVglZ4N6L70XveI1nUqrlp1Q0uqYHBNI2E0f
 J8at8E9MRLgTs+8+6euBk65Ni1zSz/HxdUpEoqq6OmemkQTlJBaOFtfzK
 62Byb/JuxvpalIKBuIgBgZ92iMRjQQVRZQQ9xritZb1vudQ2DeiCVtLMv w==;
X-CSE-ConnectionGUID: Wrp1R/79Q2Ci1+3KvuEKxg==
X-CSE-MsgGUID: 2CErrRcRREiYEQPHXsTLOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51363156"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51363156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:12:16 -0700
X-CSE-ConnectionGUID: dFUVrLVXQze1UH5ICj+0dA==
X-CSE-MsgGUID: nOmHm2IySaiiriJVLUbSbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176513032"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:12:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:12:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 09:12:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpZpTTlUS2heMpIw3aMCaeE6DgBGhT7WINbjV35RlSZ+gFLLy2Orj8Wu2RprgHp9xAWMOMnoWj176M1YT83Haz3lw7HCyv0LpbHQs/ADqv1GIMkIl6nw5rhlIGEMcTMwVJN/diTShs6td6OPSnxt4P2gyObZBAxMozaXKmkSgzr5ClWl/umy7eLt1yMoGH1i20Exw5JPHdGzA5llrTRs3XOrM0A8saObdzveN25wzsj2mC701xsLx+CTwqqrXqFNq6/T2OH3yCVn/sk13synBkgTzZa1hby4ii8RMaj6NOy3GU96dYEO2TGT5a0pPj/QlzlTcWK7FD1YqzTcDkYxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9fcTm54StUDxuK/zwYpWKe+49l3L8sUzgQ3ATSCIlQ=;
 b=prWsMP/iC2yb5UR2o1n3uAp2oVXe7XEoMGV3Cz8zPQu8vcfhw2gwgFZIz12eb6WhgrVbVR3TWtEMStjBXHwOyQqQoUVDuh1qU7G/usNc2/21UIoKG5E340WuTTrCI9vyxdfBRiWjciVCo9kp6I8dk5wmpp8mmXYTsBUcrUzn2czm2aKUfAmywbZFDqTTHBb1an3ZI+sBgt8Za/6aKYSc2Sk1239vUKTTY/qSIV/32vbvNVdgAXY+Ts/E9xc5b4LHnPIOLY2BXZ1ozMnZQgVy21miFVy8/x/t5oG7eCSvKrRMguNd2XsNmzVfE2479xiPtVKANtTwuJiSxc7sjR0bVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 16:12:06 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 16:12:06 +0000
Date: Thu, 5 Jun 2025 09:13:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 03/15] drm/xe: CPU binds for jobs
Message-ID: <aEHCMthZ/6bHcaPe@lstrano-desk.jf.intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
 <20250605153223.2789122-4-matthew.brost@intel.com>
 <76e0599da375cb378ff74ef4f34d45c64c4066be.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76e0599da375cb378ff74ef4f34d45c64c4066be.camel@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BN9PR11MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: eb971b56-6a6d-4762-08cc-08dda44bb784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmN5djdhMDZPcXZycHJJZkJTQ3B4dkNGWE1GaGhMR3ZGY2kvdEZud2tZY0tw?=
 =?utf-8?B?d09qdWVKRWw3Ui9vK0tlMkNhcGdlWEhlTXVJSGVTcEltNjFtRmZEc243dFox?=
 =?utf-8?B?Qk80dVB2YlI5YlNJTzFDQVdqNEE3dlp1MjF1SlpvSjBkMjNRWWRhMXBsT2Yv?=
 =?utf-8?B?MXBOb0FtSHpTMUw5eW9scy9uTUt5YU9vTWkyZHlGMW55YW8wOE1FTWlYNkZv?=
 =?utf-8?B?QUJ0VnB3NUpaNys2MFBKbWtaUGtBNVhpSmxhSUFlUXo5aGowTTN6dVRDZ0p0?=
 =?utf-8?B?MkxGM0pIMFFtNko0ei9YZWkzUkNrMVZJU09BRXJwUll3TmhWUFlYSGlMMnRN?=
 =?utf-8?B?cURsRVFyelg0WnRlWHZsc2xvZnJYcmNacU9FT3p0RFZZQzBBRDFudEl3MjIz?=
 =?utf-8?B?YVJVSzM0Wk8yZlcreTlzcEVnMG1lUlNPZlVCZm4vM2dMclhISUVjZ3dzbWVY?=
 =?utf-8?B?elVoMmY0dlQvUkNVUGpTbXlrbmRoelh1UWhTWFJHdlBNY25WZTJGSjVyaTN1?=
 =?utf-8?B?ZlE3T2d6T0t1M3RQdTZYZlFMWmhpUkFVcXk5Snl5eHRSMjF2Q2kyRUFCZmZ5?=
 =?utf-8?B?WHU1Qmc4Uk5IYWp2NWdycytGZUdnVm5PcXlUM25UNGVqZVMyWW02N3l2dTZ6?=
 =?utf-8?B?VnZMSUdEYlpRTTM1NjdNOWlWU01QVGI5M29zTTBWVEFRSzFIU0d5cEx6c1Z1?=
 =?utf-8?B?VlQ2UUVFdndpazk5L1dMQ3lnR0RnOXJNK1VwN1FwT3gzTE5MbDlSd3ZNeE03?=
 =?utf-8?B?U0tjY1V1TXVJUTNOWXQrYXQ2UEczeWNGZysxR0txUlo4bmJCQlNlVzhqZktB?=
 =?utf-8?B?VDUvVTlDSXlQRlJWZWZlbmJ2TTA0K2E0QkEraTNra0pRTnZSN2hOZFEzNHBW?=
 =?utf-8?B?bHpCYWs0OUV0alZhNExRMVhYTW5BRDBjaElGTDdIZkJEQVFFQTlicG9xTkU5?=
 =?utf-8?B?NFBoQ3F5dGxVZDNsa3J5T3cyUUNnSzBrbUwvbmx4U1pBQWxvcnJHT3dBYmpi?=
 =?utf-8?B?N0x6enk2YzY3RkZESm5YTk1FMVZTWkxBMVB0TVlGMzVoWEIvUElVWTlJMlJm?=
 =?utf-8?B?WjRHTkdtcU9HWFZ3Y2s5UFBISEJDK2pOUmFXb0dXbVVKS3g2NGY2dmJqMFJh?=
 =?utf-8?B?cjZJTThOdHdoeU1TcmovL2lmVnRIb1UxbGo3NVAyRHdOSmZ4bVpMa3RZWTFm?=
 =?utf-8?B?VEhqN1lLcDZMMTFramhkSjV5b3JXNStHM1RiWEdodER1REVQN3hUeStGRzVz?=
 =?utf-8?B?S0gzQmpaLzlMQzRaeHp2TVRRTWJOQ2l1d1FhUUtjUEtaNzlValRnMEtNeXV3?=
 =?utf-8?B?b29Sc2YvY2RuRVNUdFpsSzJHeHZBQWl0eGNzYllGTFNCN3NENjF5aWtJQnZI?=
 =?utf-8?B?VGF0cTZ4TlA3SS9RMlNSemxZcmJMSFdONGd1RG9ob2lNUlo1YzZDb2lqZHVr?=
 =?utf-8?B?VlowL1VYbUhNOG16dDdlcm5XZFAyMTE3NmNhVVVkT2xveWZsa3M3Q0lOb0tz?=
 =?utf-8?B?NEpUNThoUzNqa0tIUEgyZlplNG9kOXFMelpaY3NkRWVVLzdRdENLZGtMeVhU?=
 =?utf-8?B?OTJmRDlyYlJSWjgweUpLSTJUV0loOFkxSjQzUGE0UEVoTHdwMHJEMldLM2M5?=
 =?utf-8?B?TmxJU3B3S01sOTNZTjYybVA1ditiSzJCbENjenFNN1BhWlV5bmE4SG5URENl?=
 =?utf-8?B?UG12V3hpUm9GUGdTSmE2U0RWRjZjRGhTZ3o4WmRZM0xtOTgwMThxbFAwNlNk?=
 =?utf-8?B?ckkwN0gwY1VRa2Z2OHhSQjJTYTJ6clg4bnUvSjBtd0ppVWZVNVM5RnU4T1lD?=
 =?utf-8?B?b1haS2M4bVpiR3A2K25ZZHBYdkpBZ2lJeTAvaHl6Ty9Zd2NFZWRzSWpuVUUw?=
 =?utf-8?B?TUdVcEdhTEJpcFpONVdXa0RXMzBrMGNWcXQvY0JEY25JMlZxTHNZa0xjRjFH?=
 =?utf-8?Q?uMbG46fRejo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGE3bTUrcC9LNjZwZThHajJwODE4ZGJleS84TG5vT043NVBHZm81T3BocnVa?=
 =?utf-8?B?VE43YWY2WHh5ZUo0M1MzWVJsejFqQzlQdS9abW1LOWFFc0xyZnE3L0pVZnky?=
 =?utf-8?B?Umkza2YzYWRkTDRsM25wdmFhOXhUY0NTR1BMOGNoYzhCWHF1Zmg5YkFtaGV3?=
 =?utf-8?B?TERJenNhODVraCt4RkpCVSt0dUo4R2FzakZDb1BRZGlXemV3TnNwWkd4WkFa?=
 =?utf-8?B?dmZJY2RSWUhuaUFWYkdiN04rUTFSRlBmVlB2Qk9OVGZYand0QmliTTlJRURj?=
 =?utf-8?B?RnFhUzlPQytMbDhyUHovYkx2TjF5UjA1a2p6SElPMXJ4K1pIV1VSYlNxZmRI?=
 =?utf-8?B?NXZLVlZwdXZwei9jenV6TjZwK3haaTRBZkJXVTQxMjRlb3VTcG9SYTdIUXpV?=
 =?utf-8?B?R25GdVRUMmZXV1hJMkExU2s3d0hiZXZyV0dON3JNeUkvMysrckdvS0FnZTA5?=
 =?utf-8?B?c2szM3N2MUtGd3pjaTUrMGZGeGNZd3ViYUdlcURvbDNGSFE4UHZiSzloZ0xx?=
 =?utf-8?B?SkNGNExXN0RkRklNQ09yTkJ3aWxoQkZ6MkYvaHlVdWk3OHhyTUo4S1p2S21U?=
 =?utf-8?B?eU8wdGdtR0dySWllSWtSRDRoVlEvN0doajVRVEduQWdMbnJsT0lPcTZKVnBX?=
 =?utf-8?B?bVVFaGp4MFAvTUgzVStpUjEwdittK0tGTVUvN0JuaEk0TXBjekdFcmhqSGxr?=
 =?utf-8?B?aUIvdkFtc3hLTDdueWt0TWVhUUNqUlFFdHpTQkdoWkgxTmg0YnJ3bkpYNCto?=
 =?utf-8?B?ZE9VYWV5eFAxc2cyQjFITUJwcEs0Y1JNUHVwM0ZubVNEaU4yVDEyeFVraXA1?=
 =?utf-8?B?OTl6K0JZck5BY0xJcHoyNDBpbjQ3NHZEdUIzUjdzRWJQdVdVZW5YVHBWcGZI?=
 =?utf-8?B?VWVjRFlld0h4Lzg5TDZIVmltZjFCaXlobTVvSm81MjB6ZTZFcUM5ZXI1dE1i?=
 =?utf-8?B?TERpQlgxbE9YbU55WUNjNFFQaElHcnhrS0JtSTl1Rm1HVmp5dXVWa1daZ2NJ?=
 =?utf-8?B?cWVHa3VPV0RzUmV6QlI5MWdxWnpQVitxTzN0dm0wVHk2TlJjTC9JVVNqYmxk?=
 =?utf-8?B?MnU5ZE9JUW1IQW8zV2N6RHpvd2h1bDZ3TlJZd3pNcHovaW5NRzdKSlJhdWZt?=
 =?utf-8?B?Q3JmQVhVSnhEZDd1YVl3azF1RE1lSGVXNkZQc09zc1ZNbHk4eS9DSnI3N3ZJ?=
 =?utf-8?B?WmxodDNGaEYrdlpYSVFseFFxczB2T3ZHZUJMNXJPeWxwVTJDamo1dEJqMFJF?=
 =?utf-8?B?UHY2ZURZUU1laDU1R0I4aVRHTjU3NzZhd2JjaXRRYVM0ZkZ1SXdqRU1UWUxE?=
 =?utf-8?B?U1NTZVl4SWZDQnI2bjg5aHdQVUFPOTg2ay9Ed3pGT2VieEJkTlMvcU9kQnU4?=
 =?utf-8?B?TXV0QlRINnM5Q2xrZk15T05IZk1zb3UwNldVUEJxWUZobW1SbHMzUER1QXJz?=
 =?utf-8?B?N2NlRS9PQ3NTQkYweGJ1SGxGWUJOajU4NC9hcmg0TTM2TkRESExnUDk3QTZi?=
 =?utf-8?B?YVBYajl5OXhodWsweE5sMDZCSFljY2wvWWRzc3p3bFcwdGoyUmQzbnREaWFz?=
 =?utf-8?B?bmpKWXorbzZGTTNCdUJjS1I5Q1ZsVmhFOFlWV0VLYnE1TUhUMnVBNmJkWFhl?=
 =?utf-8?B?WDEza0QraGJtZVZIT1F2TGxzbk0ydGdLNXJrSmFCWE81QTJ1MmtPUDB2SnVI?=
 =?utf-8?B?ZkNVM3BxSDB3OHkzbHhmblpML0hrYWhOYUtyWGVTeURvbjhXTjZ0WmdBd0ZI?=
 =?utf-8?B?blBtUW8rQ1pONVl6T0xzbDhEN0VzV3pNZFdMMUd6dk5iYzJ6bTFPQkV3VUhZ?=
 =?utf-8?B?OGU2MnI5QnY3MEhwelN6TkdoeFRrVmlPUWR2Zmdmd21xc1MwS011OXFPbDFr?=
 =?utf-8?B?SW1lekZLVlRCSzFmc1M3UDFtRVE0KytuSE93bjViZjRMUWI5YzBRd1BuUFFZ?=
 =?utf-8?B?a2pqSUpMQkUxbjNtWURsV3FJcTlmMUYwSmIzZzVYWUd0NkxEd2JUWjFHMnRC?=
 =?utf-8?B?MFVwSmVOR05rd084WFpQa0oveDd4UlROUlYyRHJjTnE2Yjg0U0tvNVhwTDFt?=
 =?utf-8?B?MFpyak1qa3lrUWo5THYxekFlVVlnQ0NFOUlYM2pWN0V4WkRwY1pteTRmSXNL?=
 =?utf-8?B?SFFiWEJSUE9KeU5WcUFjaVBxdTBTUVQ3SEhyV09BQzBCMDV6QVZHa0RyVEpt?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb971b56-6a6d-4762-08cc-08dda44bb784
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:12:06.7469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29ySNwYbvAu6QYE3dD50mQaDMsVCVM8AoOx2B8aAzPnBWwAulsi7OONkneaNaQ/IvFyAj+g5jkOky2Em6UzSwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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

On Thu, Jun 05, 2025 at 05:44:07PM +0200, Thomas Hellström wrote:
> Hi, Matt,
> 
> An early comment:
> 
> Previous concerns have also included:
> 
> 1) If clearing and binding happens on the same exec_queue, GPU binding
> is actually likely to be faster, right since it can be queued without
> waiting for additional dependencies? Do we have any timings from start-
> of-clear to support or debunk this argument.
> 

The cases where the clearing / moving are on the same queue + pipelined are:
- non-SVM pagefaults
- rebinds in exec IOCTL or preempt resume work

The case where we are using different queues:
- User binds

The cases where we use the same queue but would likely still have a GuC
/ HW context switch:
- SVM pagefaults as we need to wait on copy job in the migration, thus
  the bind is not pipelined
- SVM prefetch is same as above

The common case is clearly user binds. SVM pagefaults + prefetch seem
likely more common than non-SVM pagefaults or exec IOCTL rebinds. Let me
see if I can measure difference between CPU and GPU binds for cases
where the GPU might be faster and get back to you.

> 2) Is page-tables in unmappable VRAM something we'd want to support at
> some point.

Do we? This would be an entire rewrite of our binding code as we always
use the CPU to populate PTEs that not part of the current page table
structure. Likewise, zapping PTEs is always done via the CPU too. This
would a signicantly larger change than anything purposed here and IMO
really out of scope as this change in minor compared supporting
unmappable VRAM PTEs.

Matt

> 
> Thanks,
> Thomas
> 
> 
> On Thu, 2025-06-05 at 08:32 -0700, Matthew Brost wrote:
> > No reason to use the GPU for binds. In run_job, use the CPU to
> > perform
> > binds once the bind job's dependencies are resolved.
> > 
> > Benefits of CPU-based binds:
> > - Lower latency once dependencies are resolved, as there is no
> >   interaction with the GuC or a hardware context switch both of which
> >   are relatively slow.
> > - Large arrays of binds do not risk running out of migration PTEs,
> >   avoiding -ENOBUFS being returned to userspace.
> > - Kernel binds are decoupled from the migration exec queue (which
> > issues
> >   copies and clears), so they cannot get stuck behind unrelated
> >   jobs—this can be a problem with parallel GPU faults.
> > - Enables ULLS on the migration exec queue, as this queue has
> > exclusive
> >   access to the paging copy engine.
> > 
> > The basic idea of the implementation is to store the VM page table
> > update operations (struct xe_vm_pgtable_update_op *pt_op) and
> > additional
> > arguments for the migrate layer’s CPU PTE update function in a job.
> > The
> > submission backend can then call into the migrate layer using the CPU
> > to
> > write the PTEs and free the stored resources for the PTE update.
> > 
> > PT job submission is implemented in the GuC backend for simplicity. A
> > follow-up could introduce a specific backend for PT jobs.
> > 
> > All code related to GPU-based binding has been removed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c              |   7 +-
> >  drivers/gpu/drm/xe/xe_bo.h              |   9 +-
> >  drivers/gpu/drm/xe/xe_bo_types.h        |   2 -
> >  drivers/gpu/drm/xe/xe_drm_client.c      |   3 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c      |  36 +++-
> >  drivers/gpu/drm/xe/xe_migrate.c         | 251 +++-------------------
> > --
> >  drivers/gpu/drm/xe/xe_migrate.h         |   6 +
> >  drivers/gpu/drm/xe/xe_pt.c              | 188 ++++++++++++++----
> >  drivers/gpu/drm/xe/xe_pt.h              |   5 +-
> >  drivers/gpu/drm/xe/xe_pt_types.h        |  29 ++-
> >  drivers/gpu/drm/xe/xe_sched_job.c       |  78 +++++---
> >  drivers/gpu/drm/xe/xe_sched_job_types.h |  31 ++-
> >  drivers/gpu/drm/xe/xe_vm.c              |  46 ++---
> >  13 files changed, 341 insertions(+), 350 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 61d208c85281..7aa598b584d2 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -3033,8 +3033,13 @@ void xe_bo_put_commit(struct llist_head
> > *deferred)
> >  	if (!freed)
> >  		return;
> >  
> > -	llist_for_each_entry_safe(bo, next, freed, freed)
> > +	llist_for_each_entry_safe(bo, next, freed, freed) {
> > +		struct xe_vm *vm = bo->vm;
> > +
> >  		drm_gem_object_free(&bo->ttm.base.refcount);
> > +		if (bo->flags & XE_BO_FLAG_PUT_VM_ASYNC)
> > +			xe_vm_put(vm);
> > +	}
> >  }
> >  
> >  static void xe_bo_dev_work_func(struct work_struct *work)
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 02ada1fb8a23..967b1fe92560 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -46,6 +46,7 @@
> >  #define XE_BO_FLAG_GGTT2		BIT(22)
> >  #define XE_BO_FLAG_GGTT3		BIT(23)
> >  #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
> > +#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(25)
> >  
> >  /* this one is trigger internally only */
> >  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> > @@ -319,6 +320,7 @@ void __xe_bo_release_dummy(struct kref *kref);
> >   * @bo: The bo to put.
> >   * @deferred: List to which to add the buffer object if we cannot
> > put, or
> >   * NULL if the function is to put unconditionally.
> > + * @added: BO was added to deferred list
> >   *
> >   * Since the final freeing of an object includes both sleeping and
> > (!)
> >   * memory allocation in the dma_resv individualization, it's not ok
> > @@ -338,7 +340,8 @@ void __xe_bo_release_dummy(struct kref *kref);
> >   * false otherwise.
> >   */
> >  static inline bool
> > -xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
> > +xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred,
> > +		   bool *added)
> >  {
> >  	if (!deferred) {
> >  		xe_bo_put(bo);
> > @@ -348,6 +351,7 @@ xe_bo_put_deferred(struct xe_bo *bo, struct
> > llist_head *deferred)
> >  	if (!kref_put(&bo->ttm.base.refcount,
> > __xe_bo_release_dummy))
> >  		return false;
> >  
> > +	*added = true;
> >  	return llist_add(&bo->freed, deferred);
> >  }
> >  
> > @@ -363,8 +367,9 @@ static inline void
> >  xe_bo_put_async(struct xe_bo *bo)
> >  {
> >  	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
> > +	bool added = false;
> >  
> > -	if (xe_bo_put_deferred(bo, &bo_device->async_list))
> > +	if (xe_bo_put_deferred(bo, &bo_device->async_list, &added))
> >  		schedule_work(&bo_device->async_free);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > index eb5e83c5f233..ecf42a04640a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -70,8 +70,6 @@ struct xe_bo {
> >  
> >  	/** @freed: List node for delayed put. */
> >  	struct llist_node freed;
> > -	/** @update_index: Update index if PT BO */
> > -	int update_index;
> >  	/** @created: Whether the bo has passed initial creation */
> >  	bool created;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c
> > b/drivers/gpu/drm/xe/xe_drm_client.c
> > index 31f688e953d7..6f5a91ef7491 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > @@ -200,6 +200,7 @@ static void show_meminfo(struct drm_printer *p,
> > struct drm_file *file)
> >  	LLIST_HEAD(deferred);
> >  	unsigned int id;
> >  	u32 mem_type;
> > +	bool added = false;
> >  
> >  	client = xef->client;
> >  
> > @@ -246,7 +247,7 @@ static void show_meminfo(struct drm_printer *p,
> > struct drm_file *file)
> >  			xe_assert(xef->xe, !list_empty(&bo-
> > >client_link));
> >  		}
> >  
> > -		xe_bo_put_deferred(bo, &deferred);
> > +		xe_bo_put_deferred(bo, &deferred, &added);
> >  	}
> >  	spin_unlock(&client->bos_lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 2b61d017eeca..551cd21a6465 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -19,6 +19,7 @@
> >  #include "abi/guc_klvs_abi.h"
> >  #include "regs/xe_lrc_layout.h"
> >  #include "xe_assert.h"
> > +#include "xe_bo.h"
> >  #include "xe_devcoredump.h"
> >  #include "xe_device.h"
> >  #include "xe_exec_queue.h"
> > @@ -38,8 +39,10 @@
> >  #include "xe_lrc.h"
> >  #include "xe_macros.h"
> >  #include "xe_map.h"
> > +#include "xe_migrate.h"
> >  #include "xe_mocs.h"
> >  #include "xe_pm.h"
> > +#include "xe_pt.h"
> >  #include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_trace.h"
> > @@ -745,6 +748,20 @@ static void submit_exec_queue(struct
> > xe_exec_queue *q)
> >  	}
> >  }
> >  
> > +static bool is_pt_job(struct xe_sched_job *job)
> > +{
> > +	return job->is_pt_job;
> > +}
> > +
> > +static void run_pt_job(struct xe_sched_job *job)
> > +{
> > +	__xe_migrate_update_pgtables_cpu(job->pt_update[0].vm,
> > +					 job->pt_update[0].tile,
> > +					 job->pt_update[0].ops,
> > +					 job-
> > >pt_update[0].pt_job_ops->ops,
> > +					 job-
> > >pt_update[0].pt_job_ops->current_op);
> > +}
> > +
> >  static struct dma_fence *
> >  guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >  {
> > @@ -760,14 +777,21 @@ guc_exec_queue_run_job(struct drm_sched_job
> > *drm_job)
> >  	trace_xe_sched_job_run(job);
> >  
> >  	if (!exec_queue_killed_or_banned_or_wedged(q) &&
> > !xe_sched_job_is_error(job)) {
> > -		if (!exec_queue_registered(q))
> > -			register_exec_queue(q);
> > -		if (!lr)	/* LR jobs are emitted in the exec
> > IOCTL */
> > -			q->ring_ops->emit_job(job);
> > -		submit_exec_queue(q);
> > +		if (is_pt_job(job)) {
> > +			run_pt_job(job);
> > +		} else {
> > +			if (!exec_queue_registered(q))
> > +				register_exec_queue(q);
> > +			if (!lr)	/* LR jobs are emitted in
> > the exec IOCTL */
> > +				q->ring_ops->emit_job(job);
> > +			submit_exec_queue(q);
> > +		}
> >  	}
> >  
> > -	if (lr) {
> > +	if (is_pt_job(job)) {
> > +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> > +		dma_fence_put(job->fence);	/* Drop ref from
> > xe_sched_job_arm */
> > +	} else if (lr) {
> >  		xe_sched_job_set_error(job, -EOPNOTSUPP);
> >  		dma_fence_put(job->fence);	/* Drop ref from
> > xe_sched_job_arm */
> >  	} else {
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 9084f5cbc02d..e444f3fae97c 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -58,18 +58,12 @@ struct xe_migrate {
> >  	 * Protected by @job_mutex.
> >  	 */
> >  	struct dma_fence *fence;
> > -	/**
> > -	 * @vm_update_sa: For integrated, used to suballocate page-
> > tables
> > -	 * out of the pt_bo.
> > -	 */
> > -	struct drm_suballoc_manager vm_update_sa;
> >  	/** @min_chunk_size: For dgfx, Minimum chunk size */
> >  	u64 min_chunk_size;
> >  };
> >  
> >  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> >  #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE *
> > (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
> > -#define NUM_KERNEL_PDE 15
> >  #define NUM_PT_SLOTS 32
> >  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
> >  #define MAX_NUM_PTE 512
> > @@ -107,7 +101,6 @@ static void xe_migrate_fini(void *arg)
> >  
> >  	dma_fence_put(m->fence);
> >  	xe_bo_put(m->pt_bo);
> > -	drm_suballoc_manager_fini(&m->vm_update_sa);
> >  	mutex_destroy(&m->job_mutex);
> >  	xe_vm_close_and_put(m->q->vm);
> >  	xe_exec_queue_put(m->q);
> > @@ -199,8 +192,6 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >  	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
> >  	/* Must be a multiple of 64K to support all platforms */
> >  	BUILD_BUG_ON(NUM_PT_SLOTS * XE_PAGE_SIZE % SZ_64K);
> > -	/* And one slot reserved for the 4KiB page table updates */
> > -	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
> >  
> >  	/* Need to be sure everything fits in the first PT, or
> > create more */
> >  	xe_tile_assert(tile, m->batch_base_ofs + batch->size <
> > SZ_2M);
> > @@ -333,8 +324,6 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >  	/*
> >  	 * Example layout created above, with root level = 3:
> >  	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> > -	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> > -	 * [PT9...PT26]: Userspace PT's for VM_BIND, 4 KiB PTE's
> >  	 * [PT27 = PDE 0] [PT28 = PDE 1] [PT29 = PDE 2] [PT30 & PT31
> > = 2M vram identity map]
> >  	 *
> >  	 * This makes the lowest part of the VM point to the
> > pagetables.
> > @@ -342,19 +331,10 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >  	 * and flushes, other parts of the VM can be used either for
> > copying and
> >  	 * clearing.
> >  	 *
> > -	 * For performance, the kernel reserves PDE's, so about 20
> > are left
> > -	 * for async VM updates.
> > -	 *
> >  	 * To make it easier to work, each scratch PT is put in slot
> > (1 + PT #)
> >  	 * everywhere, this allows lockless updates to scratch pages
> > by using
> >  	 * the different addresses in VM.
> >  	 */
> > -#define NUM_VMUSA_UNIT_PER_PAGE	32
> > -#define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE /
> > NUM_VMUSA_UNIT_PER_PAGE)
> > -#define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE /
> > sizeof(u64))
> > -	drm_suballoc_manager_init(&m->vm_update_sa,
> > -				  (size_t)(map_ofs / XE_PAGE_SIZE -
> > NUM_KERNEL_PDE) *
> > -				  NUM_VMUSA_UNIT_PER_PAGE, 0);
> >  
> >  	m->pt_bo = bo;
> >  	return 0;
> > @@ -1193,56 +1173,6 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >  	return fence;
> >  }
> >  
> > -static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb,
> > u64 ppgtt_ofs,
> > -			  const struct xe_vm_pgtable_update_op
> > *pt_op,
> > -			  const struct xe_vm_pgtable_update *update,
> > -			  struct xe_migrate_pt_update *pt_update)
> > -{
> > -	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > -	struct xe_vm *vm = pt_update->vops->vm;
> > -	u32 chunk;
> > -	u32 ofs = update->ofs, size = update->qwords;
> > -
> > -	/*
> > -	 * If we have 512 entries (max), we would populate it
> > ourselves,
> > -	 * and update the PDE above it to the new pointer.
> > -	 * The only time this can only happen if we have to update
> > the top
> > -	 * PDE. This requires a BO that is almost vm->size big.
> > -	 *
> > -	 * This shouldn't be possible in practice.. might change
> > when 16K
> > -	 * pages are used. Hence the assert.
> > -	 */
> > -	xe_tile_assert(tile, update->qwords < MAX_NUM_PTE);
> > -	if (!ppgtt_ofs)
> > -		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
> > -						xe_bo_addr(update-
> > >pt_bo, 0,
> > -							  
> > XE_PAGE_SIZE), false);
> > -
> > -	do {
> > -		u64 addr = ppgtt_ofs + ofs * 8;
> > -
> > -		chunk = min(size, MAX_PTE_PER_SDI);
> > -
> > -		/* Ensure populatefn can do memset64 by aligning bb-
> > >cs */
> > -		if (!(bb->len & 1))
> > -			bb->cs[bb->len++] = MI_NOOP;
> > -
> > -		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > MI_SDI_NUM_QW(chunk);
> > -		bb->cs[bb->len++] = lower_32_bits(addr);
> > -		bb->cs[bb->len++] = upper_32_bits(addr);
> > -		if (pt_op->bind)
> > -			ops->populate(tile, NULL, bb->cs + bb->len,
> > -				      ofs, chunk, update);
> > -		else
> > -			ops->clear(vm, tile, NULL, bb->cs + bb->len,
> > -				   ofs, chunk, update);
> > -
> > -		bb->len += chunk * 2;
> > -		ofs += chunk;
> > -		size -= chunk;
> > -	} while (size);
> > -}
> > -
> >  struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m)
> >  {
> >  	return xe_vm_get(m->q->vm);
> > @@ -1258,7 +1188,18 @@ struct migrate_test_params {
> >  	container_of(_priv, struct migrate_test_params, base)
> >  #endif
> >  
> > -static void
> > +/**
> > + * __xe_migrate_update_pgtables_cpu() - Update a VM's PTEs via the
> > CPU
> > + * @vm: The VM being updated
> > + * @tile: The tile being updated
> > + * @ops: The migrate PT update ops
> > + * @pt_ops: The VM PT update ops
> > + * @num_ops: The number of The VM PT update ops
> > + *
> > + * Execute the VM PT update ops array which results in a VM's PTEs
> > being updated
> > + * via the CPU.
> > + */
> > +void
> >  __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile
> > *tile,
> >  				 const struct
> > xe_migrate_pt_update_ops *ops,
> >  				 struct xe_vm_pgtable_update_op
> > *pt_op,
> > @@ -1314,7 +1255,7 @@ xe_migrate_update_pgtables_cpu(struct
> > xe_migrate *m,
> >  	}
> >  
> >  	__xe_migrate_update_pgtables_cpu(vm, m->tile, ops,
> > -					 pt_update_ops->ops,
> > +					 pt_update_ops->pt_job_ops-
> > >ops,
> >  					 pt_update_ops->num_ops);
> >  
> >  	return dma_fence_get_stub();
> > @@ -1327,161 +1268,19 @@ __xe_migrate_update_pgtables(struct
> > xe_migrate *m,
> >  {
> >  	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> >  	struct xe_tile *tile = m->tile;
> > -	struct xe_gt *gt = tile->primary_gt;
> > -	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_sched_job *job;
> >  	struct dma_fence *fence;
> > -	struct drm_suballoc *sa_bo = NULL;
> > -	struct xe_bb *bb;
> > -	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs =
> > 0;
> > -	u32 num_updates = 0, current_update = 0;
> > -	u64 addr;
> > -	int err = 0;
> >  	bool is_migrate = pt_update_ops->q == m->q;
> > -	bool usm = is_migrate && xe->info.has_usm;
> > -
> > -	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > -		struct xe_vm_pgtable_update_op *pt_op =
> > &pt_update_ops->ops[i];
> > -		struct xe_vm_pgtable_update *updates = pt_op-
> > >entries;
> > -
> > -		num_updates += pt_op->num_entries;
> > -		for (j = 0; j < pt_op->num_entries; ++j) {
> > -			u32 num_cmds =
> > DIV_ROUND_UP(updates[j].qwords,
> > -						   
> > MAX_PTE_PER_SDI);
> > -
> > -			/* align noop + MI_STORE_DATA_IMM cmd prefix
> > */
> > -			batch_size += 4 * num_cmds +
> > updates[j].qwords * 2;
> > -		}
> > -	}
> > -
> > -	/* fixed + PTE entries */
> > -	if (IS_DGFX(xe))
> > -		batch_size += 2;
> > -	else
> > -		batch_size += 6 * (num_updates / MAX_PTE_PER_SDI +
> > 1) +
> > -			num_updates * 2;
> > -
> > -	bb = xe_bb_new(gt, batch_size, usm);
> > -	if (IS_ERR(bb))
> > -		return ERR_CAST(bb);
> > -
> > -	/* For sysmem PTE's, need to map them in our hole.. */
> > -	if (!IS_DGFX(xe)) {
> > -		u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > -		u32 ptes, ofs;
> > -
> > -		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> > -		if (!is_migrate) {
> > -			u32 num_units = DIV_ROUND_UP(num_updates,
> > -						    
> > NUM_VMUSA_WRITES_PER_UNIT);
> > -
> > -			if (num_units > m->vm_update_sa.size) {
> > -				err = -ENOBUFS;
> > -				goto err_bb;
> > -			}
> > -			sa_bo = drm_suballoc_new(&m->vm_update_sa,
> > num_units,
> > -						 GFP_KERNEL, true,
> > 0);
> > -			if (IS_ERR(sa_bo)) {
> > -				err = PTR_ERR(sa_bo);
> > -				goto err_bb;
> > -			}
> > -
> > -			ppgtt_ofs = NUM_KERNEL_PDE +
> > -				(drm_suballoc_soffset(sa_bo) /
> > -				 NUM_VMUSA_UNIT_PER_PAGE);
> > -			page_ofs = (drm_suballoc_soffset(sa_bo) %
> > -				    NUM_VMUSA_UNIT_PER_PAGE) *
> > -				VM_SA_UPDATE_UNIT_SIZE;
> > -		}
> > -
> > -		/* Map our PT's to gtt */
> > -		i = 0;
> > -		j = 0;
> > -		ptes = num_updates;
> > -		ofs = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> > -		while (ptes) {
> > -			u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> > -			u32 idx = 0;
> > -
> > -			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > -				MI_SDI_NUM_QW(chunk);
> > -			bb->cs[bb->len++] = ofs;
> > -			bb->cs[bb->len++] = 0; /* upper_32_bits */
> > -
> > -			for (; i < pt_update_ops->num_ops; ++i) {
> > -				struct xe_vm_pgtable_update_op
> > *pt_op =
> > -					&pt_update_ops->ops[i];
> > -				struct xe_vm_pgtable_update *updates
> > = pt_op->entries;
> > -
> > -				for (; j < pt_op->num_entries; ++j,
> > ++current_update, ++idx) {
> > -					struct xe_vm *vm =
> > pt_update->vops->vm;
> > -					struct xe_bo *pt_bo =
> > updates[j].pt_bo;
> > -
> > -					if (idx == chunk)
> > -						goto next_cmd;
> > -
> > -					xe_tile_assert(tile, pt_bo-
> > >size == SZ_4K);
> > -
> > -					/* Map a PT at most once */
> > -					if (pt_bo->update_index < 0)
> > -						pt_bo->update_index
> > = current_update;
> > -
> > -					addr = vm->pt_ops-
> > >pte_encode_bo(pt_bo, 0,
> > -
> > 									 pat_index, 0);
> > -					bb->cs[bb->len++] =
> > lower_32_bits(addr);
> > -					bb->cs[bb->len++] =
> > upper_32_bits(addr);
> > -				}
> > -
> > -				j = 0;
> > -			}
> > -
> > -next_cmd:
> > -			ptes -= chunk;
> > -			ofs += chunk * sizeof(u64);
> > -		}
> > -
> > -		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > -		update_idx = bb->len;
> > -
> > -		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
> > -			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> > -		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > -			struct xe_vm_pgtable_update_op *pt_op =
> > -				&pt_update_ops->ops[i];
> > -			struct xe_vm_pgtable_update *updates =
> > pt_op->entries;
> > -
> > -			for (j = 0; j < pt_op->num_entries; ++j) {
> > -				struct xe_bo *pt_bo =
> > updates[j].pt_bo;
> > -
> > -				write_pgtable(tile, bb, addr +
> > -					      pt_bo->update_index *
> > XE_PAGE_SIZE,
> > -					      pt_op, &updates[j],
> > pt_update);
> > -			}
> > -		}
> > -	} else {
> > -		/* phys pages, no preamble required */
> > -		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > -		update_idx = bb->len;
> > -
> > -		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > -			struct xe_vm_pgtable_update_op *pt_op =
> > -				&pt_update_ops->ops[i];
> > -			struct xe_vm_pgtable_update *updates =
> > pt_op->entries;
> > -
> > -			for (j = 0; j < pt_op->num_entries; ++j)
> > -				write_pgtable(tile, bb, 0, pt_op,
> > &updates[j],
> > -					      pt_update);
> > -		}
> > -	}
> > +	int err;
> >  
> > -	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
> > -					 xe_migrate_batch_base(m,
> > usm),
> > -					 update_idx);
> > +	job = xe_sched_job_create(pt_update_ops->q, NULL);
> >  	if (IS_ERR(job)) {
> >  		err = PTR_ERR(job);
> > -		goto err_sa;
> > +		goto err_out;
> >  	}
> >  
> > +	xe_tile_assert(tile, job->is_pt_job);
> > +
> >  	if (ops->pre_commit) {
> >  		pt_update->job = job;
> >  		err = ops->pre_commit(pt_update);
> > @@ -1491,6 +1290,12 @@ __xe_migrate_update_pgtables(struct xe_migrate
> > *m,
> >  	if (is_migrate)
> >  		mutex_lock(&m->job_mutex);
> >  
> > +	job->pt_update[0].vm = pt_update->vops->vm;
> > +	job->pt_update[0].tile = tile;
> > +	job->pt_update[0].ops = ops;
> > +	job->pt_update[0].pt_job_ops =
> > +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
> > +
> >  	xe_sched_job_arm(job);
> >  	fence = dma_fence_get(&job->drm.s_fence->finished);
> >  	xe_sched_job_push(job);
> > @@ -1498,17 +1303,11 @@ __xe_migrate_update_pgtables(struct
> > xe_migrate *m,
> >  	if (is_migrate)
> >  		mutex_unlock(&m->job_mutex);
> >  
> > -	xe_bb_free(bb, fence);
> > -	drm_suballoc_free(sa_bo, fence);
> > -
> >  	return fence;
> >  
> >  err_job:
> >  	xe_sched_job_put(job);
> > -err_sa:
> > -	drm_suballoc_free(sa_bo, NULL);
> > -err_bb:
> > -	xe_bb_free(bb, NULL);
> > +err_out:
> >  	return ERR_PTR(err);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index b064455b604e..0986ffdd8d9a 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -22,6 +22,7 @@ struct xe_pt;
> >  struct xe_tile;
> >  struct xe_vm;
> >  struct xe_vm_pgtable_update;
> > +struct xe_vm_pgtable_update_op;
> >  struct xe_vma;
> >  
> >  /**
> > @@ -125,6 +126,11 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >  
> >  struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
> >  
> > +void __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct
> > xe_tile *tile,
> > +				      const struct
> > xe_migrate_pt_update_ops *ops,
> > +				      struct xe_vm_pgtable_update_op
> > *pt_op,
> > +				      int num_ops);
> > +
> >  struct dma_fence *
> >  xe_migrate_update_pgtables(struct xe_migrate *m,
> >  			   struct xe_migrate_pt_update *pt_update);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index db1c363a65d5..1ad31f444b79 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -200,7 +200,9 @@ unsigned int xe_pt_shift(unsigned int level)
> >   * and finally frees @pt. TODO: Can we remove the @flags argument?
> >   */
> >  void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head
> > *deferred)
> > +
> >  {
> > +	bool added = false;
> >  	int i;
> >  
> >  	if (!pt)
> > @@ -208,7 +210,18 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
> > struct llist_head *deferred)
> >  
> >  	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
> >  	xe_bo_unpin(pt->bo);
> > -	xe_bo_put_deferred(pt->bo, deferred);
> > +	xe_bo_put_deferred(pt->bo, deferred, &added);
> > +	if (added) {
> > +		/*
> > +		 * We need the VM present until the BO is destroyed
> > as it shares
> > +		 * a dma-resv and BO destroy is async. Reinit BO
> > refcount so
> > +		 * xe_bo_put_async can be used when the PT job ops
> > refcount goes
> > +		 * to zero.
> > +		 */
> > +		xe_vm_get(pt->bo->vm);
> > +		pt->bo->flags |= XE_BO_FLAG_PUT_VM_ASYNC;
> > +		kref_init(&pt->bo->ttm.base.refcount);
> > +	}
> >  
> >  	if (pt->level > 0 && pt->num_live) {
> >  		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> > @@ -361,7 +374,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd,
> > struct xe_pt *parent,
> >  	entry->pt = parent;
> >  	entry->flags = 0;
> >  	entry->qwords = 0;
> > -	entry->pt_bo->update_index = -1;
> > +	entry->level = parent->level;
> >  
> >  	if (alloc_entries) {
> >  		entry->pt_entries = kmalloc_array(XE_PDES,
> > @@ -1739,7 +1752,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm
> > *vm, struct xe_tile *tile,
> >  				  u32 qword_ofs, u32 num_qwords,
> >  				  const struct xe_vm_pgtable_update
> > *update)
> >  {
> > -	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
> > +	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
> >  	int i;
> >  
> >  	if (map && map->is_iomem)
> > @@ -1805,13 +1818,20 @@ xe_pt_commit_prepare_unbind(struct xe_vma
> > *vma,
> >  	}
> >  }
> >  
> > +static struct xe_vm_pgtable_update_op *
> > +to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32
> > current_op)
> > +{
> > +	return &pt_update_ops->pt_job_ops->ops[current_op];
> > +}
> > +
> >  static void
> >  xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> >  				 u64 start, u64 end)
> >  {
> >  	u64 last;
> > -	u32 current_op = pt_update_ops->current_op;
> > -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> > +	u32 current_op = pt_update_ops->pt_job_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op =
> > +		to_pt_op(pt_update_ops, current_op);
> >  	int i, level = 0;
> >  
> >  	for (i = 0; i < pt_op->num_entries; i++) {
> > @@ -1846,8 +1866,9 @@ static int bind_op_prepare(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  			   struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> >  			   struct xe_vma *vma, bool
> > invalidate_on_bind)
> >  {
> > -	u32 current_op = pt_update_ops->current_op;
> > -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> > +	u32 current_op = pt_update_ops->pt_job_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op =
> > +		to_pt_op(pt_update_ops, current_op);
> >  	int err;
> >  
> >  	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> > @@ -1876,7 +1897,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  		xe_pt_update_ops_rfence_interval(pt_update_ops,
> >  						 xe_vma_start(vma),
> >  						 xe_vma_end(vma));
> > -		++pt_update_ops->current_op;
> > +		++pt_update_ops->pt_job_ops->current_op;
> >  		pt_update_ops->needs_userptr_lock |=
> > xe_vma_is_userptr(vma);
> >  
> >  		/*
> > @@ -1913,8 +1934,9 @@ static int bind_range_prepare(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  			      struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> >  			      struct xe_vma *vma, struct
> > xe_svm_range *range)
> >  {
> > -	u32 current_op = pt_update_ops->current_op;
> > -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> > +	u32 current_op = pt_update_ops->pt_job_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op =
> > +		to_pt_op(pt_update_ops, current_op);
> >  	int err;
> >  
> >  	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
> > @@ -1938,7 +1960,7 @@ static int bind_range_prepare(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  		xe_pt_update_ops_rfence_interval(pt_update_ops,
> >  						 range-
> > >base.itree.start,
> >  						 range-
> > >base.itree.last + 1);
> > -		++pt_update_ops->current_op;
> > +		++pt_update_ops->pt_job_ops->current_op;
> >  		pt_update_ops->needs_svm_lock = true;
> >  
> >  		pt_op->vma = vma;
> > @@ -1955,8 +1977,9 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  			     struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> >  			     struct xe_vma *vma)
> >  {
> > -	u32 current_op = pt_update_ops->current_op;
> > -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> > +	u32 current_op = pt_update_ops->pt_job_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op =
> > +		to_pt_op(pt_update_ops, current_op);
> >  	int err;
> >  
> >  	if (!((vma->tile_present | vma->tile_staged) & BIT(tile-
> > >id)))
> > @@ -1984,7 +2007,7 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  				pt_op->num_entries, false);
> >  	xe_pt_update_ops_rfence_interval(pt_update_ops,
> > xe_vma_start(vma),
> >  					 xe_vma_end(vma));
> > -	++pt_update_ops->current_op;
> > +	++pt_update_ops->pt_job_ops->current_op;
> >  	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> >  	pt_update_ops->needs_invalidation = true;
> >  
> > @@ -1998,8 +2021,9 @@ static int unbind_range_prepare(struct xe_vm
> > *vm,
> >  				struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> >  				struct xe_svm_range *range)
> >  {
> > -	u32 current_op = pt_update_ops->current_op;
> > -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> > +	u32 current_op = pt_update_ops->pt_job_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op =
> > +		to_pt_op(pt_update_ops, current_op);
> >  
> >  	if (!(range->tile_present & BIT(tile->id)))
> >  		return 0;
> > @@ -2019,7 +2043,7 @@ static int unbind_range_prepare(struct xe_vm
> > *vm,
> >  				pt_op->num_entries, false);
> >  	xe_pt_update_ops_rfence_interval(pt_update_ops, range-
> > >base.itree.start,
> >  					 range->base.itree.last +
> > 1);
> > -	++pt_update_ops->current_op;
> > +	++pt_update_ops->pt_job_ops->current_op;
> >  	pt_update_ops->needs_svm_lock = true;
> >  	pt_update_ops->needs_invalidation = true;
> >  
> > @@ -2122,7 +2146,6 @@ static int op_prepare(struct xe_vm *vm,
> >  static void
> >  xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops
> > *pt_update_ops)
> >  {
> > -	init_llist_head(&pt_update_ops->deferred);
> >  	pt_update_ops->start = ~0x0ull;
> >  	pt_update_ops->last = 0x0ull;
> >  }
> > @@ -2163,7 +2186,7 @@ int xe_pt_update_ops_prepare(struct xe_tile
> > *tile, struct xe_vma_ops *vops)
> >  			return err;
> >  	}
> >  
> > -	xe_tile_assert(tile, pt_update_ops->current_op <=
> > +	xe_tile_assert(tile, pt_update_ops->pt_job_ops->current_op
> > <=
> >  		       pt_update_ops->num_ops);
> >  
> >  #ifdef TEST_VM_OPS_ERROR
> > @@ -2396,7 +2419,7 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >  	lockdep_assert_held(&vm->lock);
> >  	xe_vm_assert_held(vm);
> >  
> > -	if (!pt_update_ops->current_op) {
> > +	if (!pt_update_ops->pt_job_ops->current_op) {
> >  		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
> >  
> >  		return dma_fence_get_stub();
> > @@ -2445,12 +2468,16 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >  		goto free_rfence;
> >  	}
> >  
> > -	/* Point of no return - VM killed if failure after this */
> > -	for (i = 0; i < pt_update_ops->current_op; ++i) {
> > -		struct xe_vm_pgtable_update_op *pt_op =
> > &pt_update_ops->ops[i];
> > +	/*
> > +	 * Point of no return - VM killed if failure after this
> > +	 */
> > +	for (i = 0; i < pt_update_ops->pt_job_ops->current_op; ++i)
> > {
> > +		struct xe_vm_pgtable_update_op *pt_op =
> > +			to_pt_op(pt_update_ops, i);
> >  
> >  		xe_pt_commit(pt_op->vma, pt_op->entries,
> > -			     pt_op->num_entries, &pt_update_ops-
> > >deferred);
> > +			     pt_op->num_entries,
> > +			     &pt_update_ops->pt_job_ops->deferred);
> >  		pt_op->vma = NULL;	/* skip in
> > xe_pt_update_ops_abort */
> >  	}
> >  
> > @@ -2530,27 +2557,19 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >  ALLOW_ERROR_INJECTION(xe_pt_update_ops_run, ERRNO);
> >  
> >  /**
> > - * xe_pt_update_ops_fini() - Finish PT update operations
> > - * @tile: Tile of PT update operations
> > - * @vops: VMA operations
> > + * xe_pt_update_ops_free() - Free PT update operations
> > + * @pt_op: Array of PT update operations
> > + * @num_ops: Number of PT update operations
> >   *
> > - * Finish PT update operations by committing to destroy page table
> > memory
> > + * Free PT update operations
> >   */
> > -void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops
> > *vops)
> > +static void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op
> > *pt_op,
> > +				  u32 num_ops)
> >  {
> > -	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > -		&vops->pt_update_ops[tile->id];
> > -	int i;
> > -
> > -	lockdep_assert_held(&vops->vm->lock);
> > -	xe_vm_assert_held(vops->vm);
> > -
> > -	for (i = 0; i < pt_update_ops->current_op; ++i) {
> > -		struct xe_vm_pgtable_update_op *pt_op =
> > &pt_update_ops->ops[i];
> > +	u32 i;
> >  
> > +	for (i = 0; i < num_ops; ++i, ++pt_op)
> >  		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> > -	}
> > -	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> >  }
> >  
> >  /**
> > @@ -2571,9 +2590,9 @@ void xe_pt_update_ops_abort(struct xe_tile
> > *tile, struct xe_vma_ops *vops)
> >  
> >  	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
> >  		struct xe_vm_pgtable_update_op *pt_op =
> > -			&pt_update_ops->ops[i];
> > +			to_pt_op(pt_update_ops, i);
> >  
> > -		if (!pt_op->vma || i >= pt_update_ops->current_op)
> > +		if (!pt_op->vma || i >= pt_update_ops->pt_job_ops-
> > >current_op)
> >  			continue;
> >  
> >  		if (pt_op->bind)
> > @@ -2584,6 +2603,89 @@ void xe_pt_update_ops_abort(struct xe_tile
> > *tile, struct xe_vma_ops *vops)
> >  			xe_pt_abort_unbind(pt_op->vma, pt_op-
> > >entries,
> >  					   pt_op->num_entries);
> >  	}
> > +}
> > +
> > +/**
> > + * xe_pt_job_ops_alloc() - Allocate PT job ops
> > + * @num_ops: Number of VM PT update ops
> > + *
> > + * Allocate PT job ops and internal array of VM PT update ops.
> > + *
> > + * Return: Pointer to PT job ops or NULL
> > + */
> > +struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops)
> > +{
> > +	struct xe_pt_job_ops *pt_job_ops;
> > +
> > +	pt_job_ops = kmalloc(sizeof(*pt_job_ops), GFP_KERNEL);
> > +	if (!pt_job_ops)
> > +		return NULL;
> > +
> > +	pt_job_ops->ops = kvmalloc_array(num_ops,
> > sizeof(*pt_job_ops->ops),
> > +					 GFP_KERNEL);
> > +	if (!pt_job_ops->ops) {
> > +		kvfree(pt_job_ops);
> > +		return NULL;
> > +	}
> > +
> > +	pt_job_ops->current_op = 0;
> > +	kref_init(&pt_job_ops->refcount);
> > +	init_llist_head(&pt_job_ops->deferred);
> > +
> > +	return pt_job_ops;
> > +}
> > +
> > +/**
> > + * xe_pt_job_ops_get() - Get PT job ops
> > + * @pt_job_ops: PT job ops to get
> > + *
> > + * Take a reference to PT job ops
> > + *
> > + * Return: Pointer to PT job ops or NULL
> > + */
> > +struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops
> > *pt_job_ops)
> > +{
> > +	if (pt_job_ops)
> > +		kref_get(&pt_job_ops->refcount);
> > +
> > +	return pt_job_ops;
> > +}
> > +
> > +static void xe_pt_job_ops_destroy(struct kref *ref)
> > +{
> > +	struct xe_pt_job_ops *pt_job_ops =
> > +		container_of(ref, struct xe_pt_job_ops, refcount);
> > +	struct llist_node *freed;
> > +	struct xe_bo *bo, *next;
> > +
> > +	xe_pt_update_ops_free(pt_job_ops->ops,
> > +			      pt_job_ops->current_op);
> > +
> > +	freed = llist_del_all(&pt_job_ops->deferred);
> > +	if (freed) {
> > +		llist_for_each_entry_safe(bo, next, freed, freed)
> > +			/*
> > +			 * If called from run_job, we are in the
> > dma-fencing
> > +			 * path and cannot take dma-resv locks so
> > use an async
> > +			 * put.
> > +			 */
> > +			xe_bo_put_async(bo);
> > +	}
> > +
> > +	kvfree(pt_job_ops->ops);
> > +	kfree(pt_job_ops);
> > +}
> > +
> > +/**
> > + * xe_pt_job_ops_put() - Put PT job ops
> > + * @pt_job_ops: PT job ops to put
> > + *
> > + * Drop a reference to PT job ops
> > + */
> > +void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops)
> > +{
> > +	if (!pt_job_ops)
> > +		return;
> >  
> > -	xe_pt_update_ops_fini(tile, vops);
> > +	kref_put(&pt_job_ops->refcount, xe_pt_job_ops_destroy);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > index 5ecf003d513c..c9904573db82 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -41,11 +41,14 @@ void xe_pt_clear(struct xe_device *xe, struct
> > xe_pt *pt);
> >  int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops
> > *vops);
> >  struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
> >  				       struct xe_vma_ops *vops);
> > -void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops
> > *vops);
> >  void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops
> > *vops);
> >  
> >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> >  bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> >  			  struct xe_svm_range *range);
> >  
> > +struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops);
> > +struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops
> > *pt_job_ops);
> > +void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 69eab6f37cfe..33d0d20e0ac6 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -70,6 +70,9 @@ struct xe_vm_pgtable_update {
> >  	/** @pt_entries: Newly added pagetable entries */
> >  	struct xe_pt_entry *pt_entries;
> >  
> > +	/** @level: level of update */
> > +	unsigned int level;
> > +
> >  	/** @flags: Target flags */
> >  	u32 flags;
> >  };
> > @@ -88,12 +91,28 @@ struct xe_vm_pgtable_update_op {
> >  	bool rebind;
> >  };
> >  
> > -/** struct xe_vm_pgtable_update_ops: page table update operations */
> > -struct xe_vm_pgtable_update_ops {
> > -	/** @ops: operations */
> > -	struct xe_vm_pgtable_update_op *ops;
> > +/**
> > + * struct xe_pt_job_ops: page table update operations dynamic
> > allocation
> > + *
> > + * This is the part of struct xe_vma_ops and struct
> > xe_vm_pgtable_update_ops
> > + * which is dynamic allocated as it must be available until the bind
> > job is
> > + * complete.
> > + */
> > +struct xe_pt_job_ops {
> > +	/** @current_op: current operations */
> > +	u32 current_op;
> > +	/** @refcount: ref count ops allocation */
> > +	struct kref refcount;
> >  	/** @deferred: deferred list to destroy PT entries */
> >  	struct llist_head deferred;
> > +	/** @ops: operations */
> > +	struct xe_vm_pgtable_update_op *ops;
> > +};
> > +
> > +/** struct xe_vm_pgtable_update_ops: page table update operations */
> > +struct xe_vm_pgtable_update_ops {
> > +	/** @pt_job_ops: PT update operations dynamic allocation*/
> > +	struct xe_pt_job_ops *pt_job_ops;
> >  	/** @q: exec queue for PT operations */
> >  	struct xe_exec_queue *q;
> >  	/** @start: start address of ops */
> > @@ -102,8 +121,6 @@ struct xe_vm_pgtable_update_ops {
> >  	u64 last;
> >  	/** @num_ops: number of operations */
> >  	u32 num_ops;
> > -	/** @current_op: current operations */
> > -	u32 current_op;
> >  	/** @needs_svm_lock: Needs SVM lock */
> >  	bool needs_svm_lock;
> >  	/** @needs_userptr_lock: Needs userptr lock */
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > b/drivers/gpu/drm/xe/xe_sched_job.c
> > index d21bf8f26964..09cdd14d9ef7 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -26,19 +26,22 @@ static struct kmem_cache
> > *xe_sched_job_parallel_slab;
> >  
> >  int __init xe_sched_job_module_init(void)
> >  {
> > +	struct xe_sched_job *job;
> > +	size_t size;
> > +
> > +	size = struct_size(job, ptrs, 1);
> >  	xe_sched_job_slab =
> > -		kmem_cache_create("xe_sched_job",
> > -				  sizeof(struct xe_sched_job) +
> > -				  sizeof(struct xe_job_ptrs), 0,
> > +		kmem_cache_create("xe_sched_job", size, 0,
> >  				  SLAB_HWCACHE_ALIGN, NULL);
> >  	if (!xe_sched_job_slab)
> >  		return -ENOMEM;
> >  
> > +	size = max_t(size_t,
> > +		     struct_size(job, ptrs,
> > +				 XE_HW_ENGINE_MAX_INSTANCE),
> > +		     struct_size(job, pt_update, 1));
> >  	xe_sched_job_parallel_slab =
> > -		kmem_cache_create("xe_sched_job_parallel",
> > -				  sizeof(struct xe_sched_job) +
> > -				  sizeof(struct xe_job_ptrs) *
> > -				  XE_HW_ENGINE_MAX_INSTANCE, 0,
> > +		kmem_cache_create("xe_sched_job_parallel", size, 0,
> >  				  SLAB_HWCACHE_ALIGN, NULL);
> >  	if (!xe_sched_job_parallel_slab) {
> >  		kmem_cache_destroy(xe_sched_job_slab);
> > @@ -84,7 +87,7 @@ static void xe_sched_job_free_fences(struct
> > xe_sched_job *job)
> >  {
> >  	int i;
> >  
> > -	for (i = 0; i < job->q->width; ++i) {
> > +	for (i = 0; !job->is_pt_job && i < job->q->width; ++i) {
> >  		struct xe_job_ptrs *ptrs = &job->ptrs[i];
> >  
> >  		if (ptrs->lrc_fence)
> > @@ -118,33 +121,44 @@ struct xe_sched_job *xe_sched_job_create(struct
> > xe_exec_queue *q,
> >  	if (err)
> >  		goto err_free;
> >  
> > -	for (i = 0; i < q->width; ++i) {
> > -		struct dma_fence *fence =
> > xe_lrc_alloc_seqno_fence();
> > -		struct dma_fence_chain *chain;
> > -
> > -		if (IS_ERR(fence)) {
> > -			err = PTR_ERR(fence);
> > -			goto err_sched_job;
> > -		}
> > -		job->ptrs[i].lrc_fence = fence;
> > -
> > -		if (i + 1 == q->width)
> > -			continue;
> > -
> > -		chain = dma_fence_chain_alloc();
> > -		if (!chain) {
> > +	if (!batch_addr) {
> > +		job->fence =
> > dma_fence_allocate_private_stub(ktime_get());
> > +		if (!job->fence) {
> >  			err = -ENOMEM;
> >  			goto err_sched_job;
> >  		}
> > -		job->ptrs[i].chain_fence = chain;
> > +		job->is_pt_job = true;
> > +	} else {
> > +		for (i = 0; i < q->width; ++i) {
> > +			struct dma_fence *fence =
> > xe_lrc_alloc_seqno_fence();
> > +			struct dma_fence_chain *chain;
> > +
> > +			if (IS_ERR(fence)) {
> > +				err = PTR_ERR(fence);
> > +				goto err_sched_job;
> > +			}
> > +			job->ptrs[i].lrc_fence = fence;
> > +
> > +			if (i + 1 == q->width)
> > +				continue;
> > +
> > +			chain = dma_fence_chain_alloc();
> > +			if (!chain) {
> > +				err = -ENOMEM;
> > +				goto err_sched_job;
> > +			}
> > +			job->ptrs[i].chain_fence = chain;
> > +		}
> >  	}
> >  
> > -	width = q->width;
> > -	if (is_migration)
> > -		width = 2;
> > +	if (batch_addr) {
> > +		width = q->width;
> > +		if (is_migration)
> > +			width = 2;
> >  
> > -	for (i = 0; i < width; ++i)
> > -		job->ptrs[i].batch_addr = batch_addr[i];
> > +		for (i = 0; i < width; ++i)
> > +			job->ptrs[i].batch_addr = batch_addr[i];
> > +	}
> >  
> >  	xe_pm_runtime_get_noresume(job_to_xe(job));
> >  	trace_xe_sched_job_create(job);
> > @@ -243,7 +257,7 @@ bool xe_sched_job_completed(struct xe_sched_job
> > *job)
> >  void xe_sched_job_arm(struct xe_sched_job *job)
> >  {
> >  	struct xe_exec_queue *q = job->q;
> > -	struct dma_fence *fence, *prev;
> > +	struct dma_fence *fence = job->fence, *prev;
> >  	struct xe_vm *vm = q->vm;
> >  	u64 seqno = 0;
> >  	int i;
> > @@ -263,6 +277,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >  		job->ring_ops_flush_tlb = true;
> >  	}
> >  
> > +	if (job->is_pt_job)
> > +		goto arm;
> > +
> >  	/* Arm the pre-allocated fences */
> >  	for (i = 0; i < q->width; prev = fence, ++i) {
> >  		struct dma_fence_chain *chain;
> > @@ -283,6 +300,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >  		fence = &chain->base;
> >  	}
> >  
> > +arm:
> >  	job->fence = dma_fence_get(fence);	/* Pairs with put in
> > scheduler */
> >  	drm_sched_job_arm(&job->drm);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index dbf260dded8d..79a459f2a0a8 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -10,10 +10,29 @@
> >  
> >  #include <drm/gpu_scheduler.h>
> >  
> > -struct xe_exec_queue;
> >  struct dma_fence;
> >  struct dma_fence_chain;
> >  
> > +struct xe_exec_queue;
> > +struct xe_migrate_pt_update_ops;
> > +struct xe_pt_job_ops;
> > +struct xe_tile;
> > +struct xe_vm;
> > +
> > +/**
> > + * struct xe_pt_update_args - PT update arguments
> > + */
> > +struct xe_pt_update_args {
> > +	/** @vm: VM */
> > +	struct xe_vm *vm;
> > +	/** @tile: Tile */
> > +	struct xe_tile *tile;
> > +	/** @ops: Migrate PT update ops */
> > +	const struct xe_migrate_pt_update_ops *ops;
> > +	/** @pt_job_ops: PT update ops */
> > +	struct xe_pt_job_ops *pt_job_ops;
> > +};
> > +
> >  /**
> >   * struct xe_job_ptrs - Per hw engine instance data
> >   */
> > @@ -58,8 +77,14 @@ struct xe_sched_job {
> >  	bool ring_ops_flush_tlb;
> >  	/** @ggtt: mapped in ggtt. */
> >  	bool ggtt;
> > -	/** @ptrs: per instance pointers. */
> > -	struct xe_job_ptrs ptrs[];
> > +	/** @is_pt_job: is a PT job */
> > +	bool is_pt_job;
> > +	union {
> > +		/** @ptrs: per instance pointers. */
> > +		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
> > +		/** @pt_update: PT update arguments */
> > +		DECLARE_FLEX_ARRAY(struct xe_pt_update_args,
> > pt_update);
> > +	};
> >  };
> >  
> >  struct xe_sched_job_snapshot {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 18f967ce1f1a..6fc01fdd7286 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -780,6 +780,19 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> >  		list_empty_careful(&vm->userptr.invalidated)) ? 0 :
> > -EAGAIN;
> >  }
> >  
> > +static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm
> > *vm,
> > +			    struct xe_exec_queue *q,
> > +			    struct xe_sync_entry *syncs, u32
> > num_syncs)
> > +{
> > +	memset(vops, 0, sizeof(*vops));
> > +	INIT_LIST_HEAD(&vops->list);
> > +	vops->vm = vm;
> > +	vops->q = q;
> > +	vops->syncs = syncs;
> > +	vops->num_syncs = num_syncs;
> > +	vops->flags = 0;
> > +}
> > +
> >  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool
> > array_of_binds)
> >  {
> >  	int i;
> > @@ -788,11 +801,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops
> > *vops, bool array_of_binds)
> >  		if (!vops->pt_update_ops[i].num_ops)
> >  			continue;
> >  
> > -		vops->pt_update_ops[i].ops =
> > -			kmalloc_array(vops-
> > >pt_update_ops[i].num_ops,
> > -				      sizeof(*vops-
> > >pt_update_ops[i].ops),
> > -				      GFP_KERNEL |
> > __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > -		if (!vops->pt_update_ops[i].ops)
> > +		vops->pt_update_ops[i].pt_job_ops =
> > +			xe_pt_job_ops_alloc(vops-
> > >pt_update_ops[i].num_ops);
> > +		if (!vops->pt_update_ops[i].pt_job_ops)
> >  			return array_of_binds ? -ENOBUFS : -ENOMEM;
> >  	}
> >  
> > @@ -828,7 +839,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops
> > *vops)
> >  	xe_vma_svm_prefetch_ops_fini(vops);
> >  
> >  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> > -		kfree(vops->pt_update_ops[i].ops);
> > +		xe_pt_job_ops_put(vops-
> > >pt_update_ops[i].pt_job_ops);
> >  }
> >  
> >  static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops,
> > u8 tile_mask, int inc_val)
> > @@ -877,9 +888,6 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops
> > *vops, struct xe_vma *vma,
> >  
> >  static struct dma_fence *ops_execute(struct xe_vm *vm,
> >  				     struct xe_vma_ops *vops);
> > -static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm
> > *vm,
> > -			    struct xe_exec_queue *q,
> > -			    struct xe_sync_entry *syncs, u32
> > num_syncs);
> >  
> >  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> >  {
> > @@ -3163,13 +3171,6 @@ static struct dma_fence *ops_execute(struct
> > xe_vm *vm,
> >  		fence = &cf->base;
> >  	}
> >  
> > -	for_each_tile(tile, vm->xe, id) {
> > -		if (!vops->pt_update_ops[id].num_ops)
> > -			continue;
> > -
> > -		xe_pt_update_ops_fini(tile, vops);
> > -	}
> > -
> >  	return fence;
> >  
> >  err_out:
> > @@ -3447,19 +3448,6 @@ static int vm_bind_ioctl_signal_fences(struct
> > xe_vm *vm,
> >  	return err;
> >  }
> >  
> > -static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm
> > *vm,
> > -			    struct xe_exec_queue *q,
> > -			    struct xe_sync_entry *syncs, u32
> > num_syncs)
> > -{
> > -	memset(vops, 0, sizeof(*vops));
> > -	INIT_LIST_HEAD(&vops->list);
> > -	vops->vm = vm;
> > -	vops->q = q;
> > -	vops->syncs = syncs;
> > -	vops->num_syncs = num_syncs;
> > -	vops->flags = 0;
> > -}
> > -
> >  static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct
> > xe_bo *bo,
> >  					u64 addr, u64 range, u64
> > obj_offset,
> >  					u16 pat_index, u32 op, u32
> > bind_flags)
> 
