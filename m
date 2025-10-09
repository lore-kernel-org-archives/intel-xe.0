Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5BDCCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 16:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF6010EAA9;
	Thu,  9 Oct 2025 16:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lc3uXogW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA13210EAAA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760026280; x=1791562280;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4U0aDuWAtx51X2lIuGoqgzjv2Vyut+l5QF6oFMs/GZg=;
 b=Lc3uXogWD4QEIec2bXzl7Z33HsTil30xA4VyMwQIW8zCc8+2t0GZxlLe
 a6NjjzJR7V2r2PHqUTlorPmRj0Fg/m0I2De9y8/dN0+HKh18KqpXyWTLW
 0x8ekvL14EDRk263CdBxCfqyycpFod4J5pzlDlyQ/wno0A3n13G0ECZVf
 h86bUWFug1nLLfvAuzyUYeJ0mvIjl84XxNUwmMKbjueloiH3BmsgFVdbK
 UcYFPYJoFX0OzEZ36L3Z3m/ukg5rBgPvzvW2i/3x3ykdNbmFnuhqI1Sz7
 PU+Nb4YOSylvPvWCimaojdSHiqsW30wAdz+x2FxNNU562bkTNtedlOt18 g==;
X-CSE-ConnectionGUID: M+JEb2wvST2gTNRlMBSaOA==
X-CSE-MsgGUID: FlVCIGU4Toepf5YAxopiEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="49803128"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="49803128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:11:19 -0700
X-CSE-ConnectionGUID: Bxro8osKSpGmjpIvIFz8CQ==
X-CSE-MsgGUID: 6ScupS0tRdKEKWFonVwsrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180769415"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:11:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 09:11:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 09:11:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 09:11:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAxUSo1fqT+ODbzIXclgf6QppVdRf5yUeBPoITyy/HgjjJDlGW2I+ZDqhIkG7gzO6Fs8X8Sc2htdH7AhZCjBU4tuSqEou13nXUbF43YdeQNhOzF5Bet69qyRyJRXpCJ+ifERk50URwVYvJg9e5zoVUvbkBEfhKMjv/rwS3STSMUtqQzrmexMV7lYMDaS8l+Bb4kUUDc6OWvgBaB7sBvDyyONh9ZcyKf1uO4BaYcsVWrx/Odbge+7/iVp39jIsOQT1FtuJTRQo2sJNx8K3P5wxkioNKfGZMbsNZ9b29oDanU18pYyPz56c95wiM+ST5aSTXg0+rD6IAqeh7Q1JCsZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwkNZGVnGXGnCCPGHIToxjAgLX39jNn+ufoInY8eAgQ=;
 b=VxW4Dnb5PHbmPRYKGYhUyi85710TGnN07MVKUntDo3vfKbmCoH5DocyQAGKpnFPA2Kk+pFM7RlAkvNbqwc8nNBsMRZmFcWsh4/x+9DDLLdZMyvZ+ET+QAwF60QwUvgf+Cm8jQonrnB3JAnvj0iQOoACg2XdA/yGHmk4QBuDZG4VKVpPpNaSW+3j9YAZqwcnMnPaMU8WBOYrNYKEu8BcgY0QKk6wyDWM6aQ6R/7/XZGSqD+YyMZiuAurB7zXcR8SIXjb3F+3yA+8TinM/lqsYIr5LqExJ/O3WtT+S//bQZ9xW60hW9Xtkp+6WK1U/SX/KGxHx10yNNrooN2xcHhyAJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV4PR11MB9468.namprd11.prod.outlook.com (2603:10b6:408:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 16:11:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 16:11:17 +0000
Date: Thu, 9 Oct 2025 09:11:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
 <aOex-1E8yBlGFbwI@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOex-1E8yBlGFbwI@intel.com>
X-ClientProxiedBy: MW4PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:303:8f::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV4PR11MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 2379559f-253c-44c8-6d62-08de074e79ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHBxb1l3eTcyc25aMXkzR1IydjR6RkN0YWVsR21oRHhlaE1SU1o3VHZ1ZW8y?=
 =?utf-8?B?U1hUd1k1dXNEN1cvRTFaVWo4emYrSkNIZHMvU3UzM0dqQ3dTbjJUcE8xREc2?=
 =?utf-8?B?czM0OFk2ZDZsbzgreVdqeXd6Q0xLVHE3SlpRL0JQZ3ErWDRGUmVpQ0FURGxI?=
 =?utf-8?B?RW0vSXRUMVBpSVB4SkNPZmh0aVBMQ1c5Zkwwa0tpRlJtNlZKUGVvc3l0NVhC?=
 =?utf-8?B?Um5HczhPNFQ4Z0xKejN3L2lhUVprdTJuM08wMUp5L3JDcWVhekhkY0xtczFr?=
 =?utf-8?B?aDBaem9yY004b3lOVGpJYTdKSG9oeUk4L2R5b3dMU3FxNTViRlNETE1qOVZC?=
 =?utf-8?B?YkhLYmQvMjZhaDFrTTZJSGhwWHNZUVF1Tlc2LzdoL3NpV3BLTEhaa0xhcHJF?=
 =?utf-8?B?eU1EcW1sM2oyaFVqcC9qVTQwWVlqdUUzY01xQkMreitiTE5ObHAyYUZNNzFp?=
 =?utf-8?B?NVVmRUxGTzIwanhXUytocmpkNy9JRkdVK0dXWUsrZTlrSjFUczZjMHJMdTJN?=
 =?utf-8?B?blVXNS9wU2IxUlpJTGtydjlDWFgvc0podVZJNzVyN2hxM3F5bDRHMWpIV2E4?=
 =?utf-8?B?L3dkZzRKcmRXN3Y1RUxEbmx2MlRjV1oyN29tb210V0tzbmh4UHpIc0h2d2hh?=
 =?utf-8?B?MExyQjJ3amN2TWgwVXlaOGhPOWpuU3B0WEVpaURvdFdOeW05Q3Z3ZEI2TTNN?=
 =?utf-8?B?eG5aajVBd3ZLR3BremZFdGpKT1RkcEl0UWZESWZHTTlHNVJ0cFhHM0doaHFT?=
 =?utf-8?B?QlltbkJYbmVJcGRobUltbFREak51NGdyV3c1ZkFSV2JITmlPaTl0R3lVb1U2?=
 =?utf-8?B?MTZDRWNCV2hNZ0I4bU1OWFovZnpsNnExVDM0cDJWb2NwNm00UElZVzk1YkxO?=
 =?utf-8?B?VkZDRUFsK1hFZXNyRnZZcnBsT0JPZkpRMlJTRk96NUxWVktNWWlZNjFMN0E1?=
 =?utf-8?B?RXlNQjNUR3lYQjVqZE9XN0FwRjFLKytkUWRVdklGZTNYcVJ6V0xhU3pISVJN?=
 =?utf-8?B?Q1ZHYzdNaDFaYm05ZURZT3N1SElXeW9QQXp2N0krQ1hyeExKbTRUVFlyWXVN?=
 =?utf-8?B?QTRJcUltR3k2V2kxSEFvaEh2OVY2LytsWEk3T211U05oTWVITTFEemVBbnFz?=
 =?utf-8?B?Sk1ZT29MTE1sSTkxNHJQVnpPQUVESFkxQW0yeVZiZkthM0VBTENlS2s3YVd6?=
 =?utf-8?B?cS9VdnRJcUhuRERvU1krbHk2T3RsRHlHTFJiOTJzUHIzUG41dklqU0lVMy9p?=
 =?utf-8?B?UkZRcVBiem9WRUJDUHZQRFBtTDVJNVRBQVd5eUN4Z1pQcWdDRy91VnlEQ0NC?=
 =?utf-8?B?MWk0Q0JEaWtqeVJkU2toUkhsR253RTBiSzlkZlowMk5NM1pUc2NtYW9qVTVU?=
 =?utf-8?B?anMwV3ZNdzVqVGQ4dTE4UHMyOURIQTRSMjZuVGtXcjVQM0JFWnBpYVRqbmp4?=
 =?utf-8?B?TTlNWmpzQndSMHUxak9wRFZVVmRtYkFnTno3eDBZT3JVN1AwMjUvSWFoVVFN?=
 =?utf-8?B?NDZHd3pUbEpJQWVvWWpDR0FYVUNJU29kcmZ4R3YzcHArWjNxVlMxRWpNWWxv?=
 =?utf-8?B?bUlNWHhOWUdackl3SFlOQ1h2akJQSTZKclhMekV2a3kwSC9rSnFZVWF1aWU0?=
 =?utf-8?B?dmFkSHl3MkRUTjdrK2l5dXZLZ3RIa09NaEpJeEVndGllOTdBNVAyQTFCQnRB?=
 =?utf-8?B?ZS9FYUpHMHc3a3p1UEZEc01OSVpOWGRjZnRlVEVxV2Iwa1EvNFJwQll4RXZr?=
 =?utf-8?B?ckVGNVpyaEFwcVdqcnY5TU41Wmh5b3FxdDR4UEx6aUNjRjFURlA3cWx2UVFI?=
 =?utf-8?B?akZKV0xVbm5WcGZzSlRmRVJWZkkvMEE2cTZaNnBlcEc0OUtSeWN2Smx2cUF5?=
 =?utf-8?B?M1g4OXd0bVVtbHJyY0RPb2lIYndSQVI4ZUF4M0N0a0xaUmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVVpNnBjdEQ0SFBmanNNSWpXQjZHdXRzRTZISzhhTVk5N29xRDVVb2tjMFB2?=
 =?utf-8?B?TG8vQk9UVHRudVBxQ1RFNEoyakRIOW1DNUtvL0tveG55dHJrUTEzamNWMlYv?=
 =?utf-8?B?Q0NCRVB3blljUWtwZkJ5bUNXUmcyLytxYXU3VUdmZHNhQTNaTlZQaFZTTTc4?=
 =?utf-8?B?aTFFSkJzNEFzcGpLKzdObmhoRDlHaXpIekVIbmJCL2Ztd3BnUXNKd29uMjRk?=
 =?utf-8?B?cHdNcklDVXBLSGNiQ2NoOHRZcmdMOXR5TDgybFJ5L0xJR09kSzh2WlBUWFFl?=
 =?utf-8?B?S1orRVZ0OWQ5b0d1Tys2OStIelQrNDZiSndtR1Bkek9uc3BaQkpsU1MyWEww?=
 =?utf-8?B?bDNyeURxUEhuaXcyQkNFSFZjRngvcUFwK292UVc3UzFQYnIwMEp6WUY4eTZV?=
 =?utf-8?B?SWQ2U3BvOWFIWFR0eTloZjE4dElkR3drRUdsRlpXNFUzNkNXYTRsKyt2dllW?=
 =?utf-8?B?QjhvbjAxRCtEUVY1WnBHaEVPdmluZThVT3lSbXoyaFpDTk9RTVZ6dlRSRDM4?=
 =?utf-8?B?WnNXMjRKTVBTNmhDQWJoakV3SnFjNk9QbnlxM1czdDFTWDJhMmM4VHdPT2Jz?=
 =?utf-8?B?NWlodlZ3N2p5Q2htdXpiL1dpUkxNLzNGdlpUR1hVTDJjU1lnVmsreFljZk93?=
 =?utf-8?B?eTVTT3FIMGM4dDVVMmJtanF1VXh3OWFSTTRydlJqY1crZ0drNGxaS1dJWDd6?=
 =?utf-8?B?N0JTc0luajhrdW5lRU16V2hNa25nSTdKMkRoVkpRMVU5Q21ZdVlabkwwNVA5?=
 =?utf-8?B?Y3NWMnljRVp0MzBvbnlLZnlFbVpHVkI5YTAyTGlBVndPOFlxSmJwcWcrTktE?=
 =?utf-8?B?SWxQZ2dQMmJyQXk1eVZEakVXRDIvUDRGckdhZlMreVFyd1YzYnNjeW5WZEth?=
 =?utf-8?B?RjE3bnRYbXFKa3Z6STY3cXdidUNrZURyeXVIOWlJbjhuMGo0U3pOaDlHNWc2?=
 =?utf-8?B?Q2dsaXJENk96Z0tkSkQ0UEFmaWRCY2xlL3JjMnNwM3BLTzVXZUYyUU04ZEJ3?=
 =?utf-8?B?OXh4ZXhiUFNjNVdZbmI1UkRPTklmRkFiRmlya2xDSjdvUkxyaDJDR2VmVEt0?=
 =?utf-8?B?c2JYcCtRbnhDQjNtaTV1aVlsSGdjby9lV0crcHVTTDZVQmtHeHUwSEwzSnZJ?=
 =?utf-8?B?Tkp1bHNhS0RTbC85Zy9kQVJVZGFSc1V6Z0JQcVJNOEl4WmY4aGZJTDBCRWwy?=
 =?utf-8?B?VzZpeGVFaXR0cHBvVzVYbUgyazJRY3h1cW0zYWwwOUNFeVlZRFF3cnZJNDZn?=
 =?utf-8?B?RmQ3R2FCeVZFeC9RNU5MQkNjeUZHQUhmS2ROeEh2cStyM2Y3dHRJRGJFT2VZ?=
 =?utf-8?B?bmlXQjJKVUljNklYZEF4Mlk4b0toS09PUlFhNGZOeVFQWjJ6QXBvMi9ISzNr?=
 =?utf-8?B?bnd2emU0T2tvNlAzMXhVVnlBeUY1c3E5RzRndTRSK0lub0c1ZE1teldSN1Vt?=
 =?utf-8?B?MnZtTDNPRmhwZ2VoY3hLdkZweFl2UmkyMWRSZ2NmU1U0TzEvWFFsc294R3ha?=
 =?utf-8?B?RVVjTDdEdEh0Y1pnSERMZWtRdFFNQzNOeFhFQWVEZ0ZETUN6V240MkxmZ3M2?=
 =?utf-8?B?RFI0ZEYySlVqUGd1b2t5TE4zSXl2UE5DN0VUcUdRZ1hCZmhUWnpReU1kVjRR?=
 =?utf-8?B?VnlIdmtUUURqMnk0cENBUFVZQ2RCL3N4UnMzMXlDdlhtWHFVQVVOQm1id1NF?=
 =?utf-8?B?ajN3QTR2MjZpdEpzdlQ1cngwWGliM3pucFF1cldUTm9mNzhvSEgrenNHZjBq?=
 =?utf-8?B?YzNZOU91UXZmZ1kxWmQ4SUhlK21xa3plNmlVVUViMm1kVlpZcEhqeEJ4emFo?=
 =?utf-8?B?aEtjR2FsYmpWM2FnV3RBQVVDU0dKSTJKc2EwajFVWW1oMFZScEdtbVFDYW1C?=
 =?utf-8?B?NHU3V0ZxelhHQWUyTjN2eStFeGJzdmN6Vm44OGw3SnFwZTc4WHM5VU9BMG1O?=
 =?utf-8?B?b2hMdEdXTmZhdEtLeGZPKzYrbTZMY3RrNUNEc291WFNEU090TGVsZ2xLMHp1?=
 =?utf-8?B?NGozSWc2b3ExQVNOalFvNzJqeWpzWkhWa2VNYWxaZEU0UllmRGpMMTY5QlZk?=
 =?utf-8?B?TTNDUWhXbVhVbG5MWk9LOElxdytVamNZK0lrZ0lrWDMwL2VrdDFPa2R3VVE4?=
 =?utf-8?B?Mm55QTRYck0vd2dWZlpTMUxybXZwT1Y1NFBZbjdXYjBUcXpKUmV6YzlrL3Nw?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2379559f-253c-44c8-6d62-08de074e79ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 16:11:16.9473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLmsRbQVR2X1Az1WI8Fx2uRvhI1QnrC5zMHS4+6hGdPbyilZIQijJ/PjY9IJy6SuT1T2m26jUA4bbTySmiVzlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9468
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

On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
> On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
> > On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
> > > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > save/restore while this sequence is being programmed, partial writes may
> > > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > instruction to write the sequence atomically.
> > > 
> > > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > 8 dwords instead of 5 dwords.
> > > 
> > > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > chunks.
> > > 
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > 
> > > ---
> > > V4 -> V5:
> > > - Fixed review comments. (Matt B)
> > > 
> > > V3 -> V4:
> > > - Fixed review comments. (Wajdeczko)
> > > - Fix issues reported by patchworks.
> > > 
> > > V2 -> V3:
> > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > 
> > > V1 -> V2:
> > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > >   (Auld, Matthew)
> > > - Fix issues reported by patchworks.
> > > ---
> > >  drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
> > >  1 file changed, 72 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index c39c3b423d05..b629072956ee 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -5,7 +5,9 @@
> > >  
> > >  #include "xe_migrate.h"
> > >  
> > > +#include <asm/fpu/api.h>
> > >  #include <linux/bitfield.h>
> > > +#include <linux/cpufeature.h>
> > >  #include <linux/sizes.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > > @@ -33,6 +35,7 @@
> > >  #include "xe_res_cursor.h"
> > >  #include "xe_sa.h"
> > >  #include "xe_sched_job.h"
> > > +#include "xe_sriov_vf_ccs.h"
> > >  #include "xe_sync.h"
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_validation.h"
> > > @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
> > >  	}
> > >  }
> > >  
> > > -#define EMIT_COPY_CCS_DW 5
> > > +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> > > +{
> > > +#ifdef CONFIG_X86
> > > +	kernel_fpu_begin();
> > > +	if (size == SZ_128) {
> > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > +		    "vmovups %%xmm0,   (%1)\n"
> > > +		    :: "r" (src), "r" (dst) : "memory");
> > > +	} else if (size == SZ_256) {
> > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > +		    "vmovups %%ymm0,   (%1)\n"
> > > +		    :: "r" (src), "r" (dst) : "memory");
> > > +	}
> > > +	kernel_fpu_end();
> > > +#endif
> > 
> > Everything in this patch LGTM but I think we maintainer input to ensure
> > we are breaking some rules about inlined asm code in a driver (no idea
> > if this exists) or if a better place would be somewhere common. Can you
> > ping Lucas, Thomas, or Rodrigo and ask them about this?
> 
> Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
> 
> But the rule does exist:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
> 
> "don’t use inline assembly gratuitously when C can do the job. You can and should
> poke hardware from C when possible"
> 
> In this case here, please explain why exactly memcpy with smp_wmb barriers and
> or WRITE_ONCE code combined couldn't solve it.
> 
> Also, please explain how exactly vmovdqu guarantees the atomicity promised by
> the commit message. On a quick search here my take is that for this 128 or 256
> bits, atomicity is not guaranteed.

I don't think cache atomicity is what we're after here—rather, it's vCPU
halting atomicity.

Consider the following case:
b++ = XY_CTRL_SURF_COPY_BLT;
b++ = addr;

If the vCPU is halted during the instruction that stores
XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
batch buffer (BB) that is being programmed as part of the VF save. This
will clearly cause the BB to hang due to a page fault on the copy
command.

If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
then either the GPU entire instruction is written or none of it is. I
believe vCPU halting guarantees that a CPU instruction is either fully
executed or not at all—regardless of how many micro-operations (uOPs) it
decodes into. If this guarantee does not hold, then the entire
architecture of CCS save/restore on PTL is fundamentally broken which is
always possible.

> 
> So, imho this patch is introducing a unmaintainable, complex, and fragile code
> that is not even doing what it is claiming to do. But I will be glad if someone
> can challenge this and prove me wrong.
> 

Let me know if the above makes any sense.

Matt

> Thanks,
> Rodrigo.
> 
> > 
> > Matt 
> > 
> > > +}
> > > +
> > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > +{
> > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > +
> > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > +
> > > +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> > > +		memcpy_vmovdqu(dst, src, instr_size);
> > > +	else
> > > +		memcpy(dst, src, size);
> > > +}
> > > +
> > > +#define EMIT_COPY_CCS_DW 8
> > >  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > >  			  u64 dst_ofs, bool dst_is_indirect,
> > >  			  u64 src_ofs, bool src_is_indirect,
> > >  			  u32 size)
> > >  {
> > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > >  	u32 *cs = bb->cs + bb->len;
> > >  	u32 num_ccs_blks;
> > >  	u32 num_pages;
> > >  	u32 ccs_copy_size;
> > >  	u32 mocs;
> > > +	u32 i = 0;
> > >  
> > >  	if (GRAPHICS_VERx100(xe) >= 2000) {
> > >  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > >  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > >  	}
> > >  
> > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > -		ccs_copy_size;
> > > -	*cs++ = lower_32_bits(src_ofs);
> > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > -	*cs++ = lower_32_bits(dst_ofs);
> > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > +		  ccs_copy_size;
> > > +	dw[i++] = lower_32_bits(src_ofs);
> > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > >  
> > > +	/*
> > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > +	 * write the sequence atomically.
> > > +	 */
> > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > +	cs += EMIT_COPY_CCS_DW;
> > >  	bb->len = cs - bb->cs;
> > >  }
> > >  
> > > @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > >  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > >  }
> > >  
> > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > +/*
> > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > + * save/restore while this sequence is being issued, partial writes may
> > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > + * emit_atomic() to write the sequence atomically.
> > > + */
> > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > >  {
> > >  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > +
> > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > +		      MI_FLUSH_IMM_DW | flags;
> > > +	dw[j++] = lower_32_bits(addr);
> > > +	dw[j++] = upper_32_bits(addr);
> > > +	dw[j++] = MI_NOOP;
> > >  
> > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > -		  MI_FLUSH_IMM_DW | flags;
> > > -	dw[i++] = lower_32_bits(addr);
> > > -	dw[i++] = upper_32_bits(addr);
> > > -	dw[i++] = MI_NOOP;
> > > -	dw[i++] = MI_NOOP;
> > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > >  
> > > -	return i;
> > > +	return i + j;
> > >  }
> > >  
> > >  /**
> > > @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > >  	/* Calculate Batch buffer size */
> > >  	batch_size = 0;
> > >  	while (size) {
> > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > >  		u64 ccs_ofs, ccs_size;
> > >  		u32 ccs_pt;
> > >  
> > > @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > >  	 * sizes here again before copy command is emitted.
> > >  	 */
> > >  	while (size) {
> > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > >  		u32 flush_flags = 0;
> > >  		u64 ccs_ofs, ccs_size;
> > >  		u32 ccs_pt;
> > > @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > >  
> > >  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > >  
> > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > >  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > >  						  src_L0_ofs, dst_is_pltt,
> > >  						  src_L0, ccs_ofs, true);
> > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > >  
> > >  		size -= src_L0;
> > >  	}
> > > -- 
> > > 2.51.0
> > > 
