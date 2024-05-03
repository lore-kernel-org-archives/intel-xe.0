Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37D2C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 16:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C65010F640;
	Fri,  3 May 2024 16:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRT33o2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B78710F640
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714755215; x=1746291215;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GcJbf7CLCPcZCHcm4hDRH7ZrlDJZZNk7UhIycJcRFx4=;
 b=PRT33o2NNif29qNyqVW3AGzoRC3t0CCgDQ/u7F1sU+FtNynU+sZn51rE
 52qqVmxF8f+Bwcsq0o/8xLzTkWivmvh3wHlQp06eIzM9E/ROSXVrDvi6o
 3ALu57iCF+nEv0rIzL48K7tAUIH52ZN+H2n+/VGG/F6Wj4MtswlDrdibF
 nQCmnNxmO2WhzIpMm2mLrOkSt8/ryshdeNm+ve1f39wCrmOHDqaza7MI8
 0ln0611yQ76JtaW4BkAnoUQcM1vESCneForFgWK50Bi1yT5KhadSNK99Q
 1wxY3mjS7JjV8w+UdyvOJLrafCU75GMfqH9dHogZasoZ7vf3gDbDbG1MT g==;
X-CSE-ConnectionGUID: oueTD7tyRkCj9Py7zV04Kw==
X-CSE-MsgGUID: zL9ise1IQhy29hfozTFMNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10445832"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10445832"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 09:53:24 -0700
X-CSE-ConnectionGUID: lnH6vypORF+ALuU1sISRfg==
X-CSE-MsgGUID: Jvta3R0IQFK0TS3Om4hYRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27560933"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 09:53:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 09:53:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 09:53:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 09:53:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 09:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7pQuQchamLDzDfgFEhuH+GPgXeaZ94e79WNxs/M16yuCxcTVNG/UbMDLzvNxjegEegAA8OBYN+fU/iB5KrJirdmoEpX5rkREZf8DedqSAO4T0n7urY1Fzub31Zof7BW44RGdyRklnt1SbnyOVeeMxMTL8Uqaeu51x73fsLUjgCmp4PG6bxlhx0u57yzQm9YOMHumV0/toWpy88rmcxWD6L08ONTdwRruo00Z50WZj5p54tkHg2V8jMLn3NyMB9f50JVZK6wwphibz49APx62hjBswlxPhJuLC4aQtdP00ljY6qChVs3OET/s1k2tCgKDXJsQVSc3xQih8Ff1xmLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFailOpCYJP+cF7LdJ96KrB344sKUkJSCMIWjkEyqGk=;
 b=XuXOpmk5Na7/B8KAKstkzrcBVbvs8FZ9sVgkbTmHcaxtwcU4JGOm+h+1u9lbvxDkw7kK3TGDb5SHxwJaXe3Mtklbjx5uz3+4fah3bK4o+QGSMeCkFND755JGtfva6IomU6AoygtGmO5bnhVqCWgTfzfJm/1P27r7RuRdtyRuRM2U2kuBXdHAP570iuOjrO/2vqgg/QZZH8dNN2wqTpeo6rfYA1zaft4lsiGrn0i+Am6vCuZztRdCapHGlgSqvO/BbG1z6hvYhh/DOGSJYDeBXMsA4metVHfaFlei+nfG7PzfObuiS0oPjyQ29RcLfdzwxiWjqYA61FgJ9tCu1sN+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Fri, 3 May
 2024 16:53:21 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 16:53:21 +0000
Message-ID: <863864ea-21cd-47dc-a867-6d5b1accd69c@intel.com>
Date: Fri, 3 May 2024 12:53:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] drm/xe/guc: Add GuC based register capture for
 error capture
To: <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20240502205738.863369-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240502205738.863369-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::43) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH0PR11MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: 5928d3da-d1c8-424f-d7b3-08dc6b9189f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUlPSmRHRG1Td1NFakEybnZCaTkrZDJtWFZ5dDZERTl3R0ZZaU1NbXlLMG9R?=
 =?utf-8?B?aGJ3ZHNNemNKckJnR2dHRE1OZkhvc05JMUt3NE43V1B2c2c2cHZ0bnJ6WEdY?=
 =?utf-8?B?aDg3R0dFVTQ1VC9ZVFVrb0dIRUx4cWF0cTEwZi8yaHNoeDkrcU5JZXNsaGV6?=
 =?utf-8?B?Ris0Nm5Vb2JHYnJBc2tjdDBQSisrOVFkOVM5QkdwdTh3SVpJTFJyRDNqb01K?=
 =?utf-8?B?Q2JvZll4SStHZ3JrZWE5b2xEV1ZsRVB1OHJoS2p3UEFoSkM1UitFN0M3MDlD?=
 =?utf-8?B?Z0JIMVk0ZUJ0eElXUVBtLzBQMlhGWmpkckUvbXpjWTFoaTRaL1lQREM1LzUv?=
 =?utf-8?B?dVZGNW1aMjlPdlcxNVR5VkppZ1BianREdzh4V2hJRmhwVC9pVVR5ak5xK1hx?=
 =?utf-8?B?TkpJZWp0aE1oYVNkYzI5UDJjQ0YrOGxjdnZuTEltNytFbXlHSUZ4eWlzZ2lo?=
 =?utf-8?B?VFIwNlYzc0ZGQkh6M2ZFQURvSHdHM2toS1BnVU9ZZmRnUEpZVENmbmlyM0Iv?=
 =?utf-8?B?amFIUnZQaEQ1VHRjYVZYaGdRTkpCM1FocldEa3B0UGZZcmNscTNpQ2loY2Q3?=
 =?utf-8?B?SWFnVWlXVEovendkSElUR1IrelNOOWFRMXBOTmo5RC9GUU00S3NQbEUzeVpG?=
 =?utf-8?B?bG5jOGoyMEp6dmlPa1VwbE9Ccmh1a0VKNzlXZUZnRXJ4WDBuUHpvS0tubXI4?=
 =?utf-8?B?L0VCT0h1Q3MzN2FYN3hGQjF0TFQxWjFNbGlNQzIwNVhFKzJtaElscVd5eFZ2?=
 =?utf-8?B?dWh6Vm5ZeEhnWHQ4QTVuV2xvL3ZrR211M05UOXJ4bm81eGEyNmFDUFk0clIx?=
 =?utf-8?B?cmZSU09ZN3k0bVk3c1BJcWp5bVlMUVpKK3RtaXdqSlRyNzExdHZlRzVtYXJB?=
 =?utf-8?B?N201Z1lUaWRuSkFLYlRJYThCVEJvMmVjV2pNN2hzazJVaDJTUVQwcjY4eERS?=
 =?utf-8?B?VFZMZy90SGN5TGgzblZkVjFBQStGakxyc3lpSmZzcS9wZ1I5bHlqL2lhbGNX?=
 =?utf-8?B?dmpPYk9qRUxKa3BWZHNiMWxYb3I1dVNpa3AvdFQ5UXlBemRpdXc5OU1wLzBa?=
 =?utf-8?B?WUNaNVViVmNBNG9ZUm9BZWxyMElyMXU3RkFsUHc1Yk5BVy9RbDYzWU9jbXFB?=
 =?utf-8?B?SGpFSGRPTWFhdko5bllEVDlvVHltUHB5Z09ueUVRYkJwUmxEY1krRk5aWDlp?=
 =?utf-8?B?ZU9ST3BMKzNZaGp0TlVUZGUybmJEZXNaNG5HdUVkalovNDc1dkhYRDMvRlI0?=
 =?utf-8?B?RVVmSnR4ZGVJbWxTVytjdnM4RmgrK2RLQVc1NmpIKzRGQTdnclRMRnEvQldP?=
 =?utf-8?B?OWpnSS9qOENxK0EyQjRhajlJVWpIcnF3Z1hnTkZBRzNTUDZlc3E0WWw0Mndr?=
 =?utf-8?B?Z0hQTUg4dS9jNjV3V0dXQnFvTE5lYXlPaXRTckJPNWE3a1oyelZEa0pHZHZh?=
 =?utf-8?B?NnNiRXBJNTQ1TnJIL1lxdUs2WFNXeVJGN1Q5ajlqNWRXQytEbDJtQUF3endI?=
 =?utf-8?B?eisxT1pUK2VybVhhM3BYdHlpQTd5RFJXaTdrZG55dndrM1kzU2dGTUg1Q2F6?=
 =?utf-8?B?QzFRM2xkMmZNUmpKQUJkRnA2ak14QzJTc1JXM2lOdWZVY2htblN1eEVZMmpl?=
 =?utf-8?B?eUUybGdFTVdGUXNqQjlhOXYrUGs0NDNDUm1YeXI2UDVwUWpnNUZhYlA3Y2Yw?=
 =?utf-8?B?WmhENGhPZHR2OXZobHdTMDh3ak9mRUlrVG5tZTVqaTh6MlRxTWVTWVdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0NMaW9kdW45aFR1ZnRXcTN5ek1pSUcxbmF6MVZOcHUreXZDM0hXZEE5NWNQ?=
 =?utf-8?B?eWdDRW55UFc0bkZsNzErUFh0RmlTamgxWFlHWTVldytMQnRScUVUYksrTGFZ?=
 =?utf-8?B?MGNaZzM4NWdqalNPcjl2WU5HcmtlblJRYjZPMmJHMjV1ZytrZ3JaSWNLUGRI?=
 =?utf-8?B?V1lsbXNQSXRuU3BIaHg5UjJhRWllQ0hjS3A5V3IybkFKZlhnYVp5ck4vL1d4?=
 =?utf-8?B?TkJSUDB4bXF1NDVrTkRGbG5rd25uaWQ3Q1ZjQk9ucFhlRHIzTXhGSjdCdEpi?=
 =?utf-8?B?VmMxZG1VbEhCbm85UHpzc294NjZNdlRadmlNNThML0RYZE5wK1lkVVg0MFBE?=
 =?utf-8?B?cUN0cis3VFhpWDNaUjNpT1V0Z21MdDhxVmh3dG51YndqZk50Mklpa0RDRUt4?=
 =?utf-8?B?VUovMkppTGVOeGlnOWNhZlhpRlJtOTYxTmtseHlBRnlsbjViaXY0UlZIM2t4?=
 =?utf-8?B?TUtLZmZUcHN0WnYvd0RlZ3NzK2VpK3BGbTM3Nlg0NVhZYllETUFEaXFoRzl1?=
 =?utf-8?B?Vk1MSzNWKzNOdmExdVIrTUZ3L0M2Qi9IaUFiQ3ZSMUhWdWVLbERxMDJlMFpu?=
 =?utf-8?B?SHhqb3JTY1p0d1AzSldTWTJNUmF6ek0xT050QVVDM0pScThsNmNOQkFvbGwz?=
 =?utf-8?B?STFvUWhLM2lEOHdNTVhRMGg1QmhHTDVRcW5HbGVrNnAyV3c5R2F2d3ZPTUNq?=
 =?utf-8?B?dEZ1MTU2WkFLZE5TSndPT0dLNXRwZmxLYk5zbk1tbkNWMFU3cUJydWN2aEdy?=
 =?utf-8?B?WWFidmY2T2xzdHRZbk5MZUd2KzNKWFJuU3NpQVFwdWxySWp3QnBPVnNReElW?=
 =?utf-8?B?d0lxR3FDS25JdnBwZ2EvbmZnMTJiYWF3RWgyWjVobHNUZjRaVEkvd3VkTi9j?=
 =?utf-8?B?bHlsNFVpbWViY2hJT1N1Q0h2R2dKajYxZDQyZ1V4cjRHN3dDMTdDUFRJMVBM?=
 =?utf-8?B?VW9jOUsvdThLMTN5MkhYL05hYXRwWmxtVnFXZVFFcVNvOFcrYVJ1NTRDZ0la?=
 =?utf-8?B?YkdFZEtzdzh1UzFleG1SaVE1d1FaaldNdFFwOFY1ZUFpUzFWRTZ2a2FuVWFG?=
 =?utf-8?B?NnNuSDVyR1FpUzRrbDRMcUVLVUlCejM4NjRsbnpFOStsUDBQL0gvUFVLQTEx?=
 =?utf-8?B?T3NhRVF1WFIzSExFUFcxeHRYTlhWVmNyUnlzSjZCaEF1S2hYWDViUjVRRnZo?=
 =?utf-8?B?SjR2Y0ZEMllRd2hTU3RienB1T0gyRk9kWnA1elZWdm56VnJ6SUFiMC9rb2Fn?=
 =?utf-8?B?MWJHNmRLVzNUS3drNmtyNnZCTXp5QVkrTUM4cmQ0WmlVdFIrTlI3UURBVGNI?=
 =?utf-8?B?Q2FzVjlNdVRGeTJ2SGZoY2UxS2FPejBpd2tuZWRRaDc4bmN5MTRMZDZmK1RD?=
 =?utf-8?B?a1FRZW1CZE94NXpSclJNT05iWWNpbzFLdlllYSthMUkyRG1LZ0hNbzUrdVha?=
 =?utf-8?B?YWRaREwybFpBcXZKTFBhVW9mSFpwV0lvYVhZNGZ2bkpIVDRRNW5HaUdoOVhi?=
 =?utf-8?B?ZEN0NHMwMW1vM1dBTng5UXVjNFVBSjMrZWpNRkFhNldMUHpETDFVUTJ6OWJS?=
 =?utf-8?B?SWVFQ3ZTeU9FRnI5N1o3eUowS2NyUkFyejJHL0FNUHRyaDlOcUpnVk1aUnYw?=
 =?utf-8?B?RXdMY0NCbE83dWIwMTJQRUhubDRqVWhzbzR6NGVmclMrc2Q1YnJUT0ZBeDQ3?=
 =?utf-8?B?RlVIYmk0anlQTVVRb2Fkay9LUzI4eE1TYTdxRzUvQjdacmVlUlBwRDYrZm5o?=
 =?utf-8?B?Ym1WSlNXRUdHZmRwWU44WXZxNGFtbFpmaXYvekVvOHpHYXF1STVtam14aXpt?=
 =?utf-8?B?djBpS3RWTFQwUVRtemk1NjVoZEU0dEJsak82VkExWFVwMXEySHJyVlg5ZWFI?=
 =?utf-8?B?SEFWWk1HRkJSRDAxY01BOEtmOC9JTHhmS3AzRUFMblV2L2JsdFBlWEowdjFK?=
 =?utf-8?B?TVNEUTNiMVZGclhNcXFxNFpnTkJIM1BsVlMzYzY3Ym1XTlROcExBOXRmNFM1?=
 =?utf-8?B?NDJwSEtud2tTMFBSYnI0cjN3V0lpdTZ3VzBweWQ5WHpzdTBqanhNNUZ4bHVq?=
 =?utf-8?B?dlRqd3ZXc3RHcmNBd1A1dkdnZ1pMbDdvenUvQnpZL3FEZEZZM3JSNk5oNzNy?=
 =?utf-8?B?NTdqUUEwczMzYUV6ZlFKRGFEQkxPdmpyLzZMUGNMTWRlbjQ1MHJXRldKS1M4?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5928d3da-d1c8-424f-d7b3-08dc6b9189f1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 16:53:21.0256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RO4VeEiuobzhSQuQ1KHp82IBcPn6vBdVlL8GNi2FRFGNClZe7oZt+UmhyWUm9YAer4fPIue/6ddJ6OjQNOKGvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
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

Please ignore this series, patch #1 and #2 was accidently squashed 
together. I will respin another rev 8 to keep the steering register list 
handling as #2.

Regards,
Zhanjun


On 2024-05-02 4:57 p.m., Zhanjun Dong wrote:
> Port GuC based register capture for error capture from i915 to Xe.
> 
> There are 3 parts inside:
> . Prepare for capture registers
>      There is a bo create at guc ads init time, that is very early
>      and engi  ne map is not ready, make it hard to calculate the
>      capture buffer size, new function created for worst case size
>      caluation. Other than that, this part basically follows the i915
>      design.
> . Process capture notification message
>      Basically follows i915 design
> . Sysfs command process.
>      Xe switched to devcoredump, adopted command line process with
>      captured node list.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> 
> Changes from prior revs:
>    v8:-  Reorgnize the order of patches
>          Change the capture size check from worst min size to worst size
>          Replace the kernel alloc with drm managed alloc
>          Replace the memcpy with xe_map_memcpy_from
>          Free GuC capture outlist as part of xe_devcoredump_free
>    v7:-  Kconfig CONFIG_DRM_XE_CAPTURE_ERROR removed
>    v6:-  Change hardcoded register snapshot fill to follow mapping tables
>          When capture is empty, take snapshot from engine
>    v5:-  Split dss helper code out as an standalone patch
>          Remove old platform registers definition.
>          Split register map table to 32 and 64bit each
>    v4:-  Move register map table to xe_hw_engine.c
>    v3:-  Remove condition compilation in code
>    v2:-  Split into multiple chunks
> 
> Zhanjun Dong (5):
>    drm/xe/guc: Prepare GuC register list and update ADS size for error
>      capture
>    drm/xe/guc: Add capture size check in GuC log buffer
>    drm/xe/guc: Pre-allocate output nodes for extraction
>    drm/xe/guc: Extract GuC error capture lists
>    drm/xe/guc: Plumb GuC-capture into dev coredump
> 
>   drivers/gpu/drm/xe/Makefile              |    1 +
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
>   drivers/gpu/drm/xe/xe_devcoredump.c      |    2 +
>   drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
>   drivers/gpu/drm/xe/xe_guc.c              |    5 +
>   drivers/gpu/drm/xe/xe_guc.h              |    5 +
>   drivers/gpu/drm/xe/xe_guc_ads.c          |  208 +++-
>   drivers/gpu/drm/xe/xe_guc_ads.h          |    3 +
>   drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
>   drivers/gpu/drm/xe/xe_guc_capture.c      | 1223 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_capture.h      |   20 +
>   drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  221 ++++
>   drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
>   drivers/gpu/drm/xe/xe_guc_fwif.h         |   70 ++
>   drivers/gpu/drm/xe/xe_guc_log.c          |  179 ++++
>   drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
>   drivers/gpu/drm/xe/xe_guc_log_types.h    |   24 +
>   drivers/gpu/drm/xe/xe_guc_submit.c       |   54 +-
>   drivers/gpu/drm/xe/xe_guc_submit.h       |    2 +
>   drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
>   drivers/gpu/drm/xe/xe_hw_engine.c        |  249 +++--
>   drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |  150 ++-
>   drivers/gpu/drm/xe/xe_sched_job.c        |    7 +-
>   24 files changed, 2308 insertions(+), 150 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h
> 
