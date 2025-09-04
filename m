Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4479BCA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 21:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B6210EAEB;
	Thu,  4 Sep 2025 21:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JT2B6Rg3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A266510EAEB
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 21:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757020273; x=1788556273;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xwNvxkdS49cT6c73B9srRjugw271f7a3VN+X3m4uYjc=;
 b=JT2B6Rg315skUkMoyiALwtGLit2oucq31boYA5eRAmcTHqyKzkUyv+Dr
 NsQwZw9wGdvrUA4w4SFDXH0+2qJ9P6dYny017KNVOiM4cq5rt6G52ZAyo
 Jbl2lQOAxzEoXFlKf5u55w0kgkOAE3eykQmNxqfJo7xbHIkkYUSdlV8Oz
 mDxqG8OTqaWUiuGrKn8F4uQ5nDImp3IY27102LqWO410W9/q2HmIam5LM
 +Th1BhUcEukXRVApRqoYbjLGFCXZ2mi3MTllbgnbA6MNwvf2xB1/+fkLi
 v3XAIleE6ha2LFoh2jJSt0ZdNBlnMHULA7Lt9xybKR88MGh6sGOaEb5gb Q==;
X-CSE-ConnectionGUID: 9FLpBr6vQ2+QJAUm+hp7kg==
X-CSE-MsgGUID: XsxmDpgFTkmoVBIyMUQctg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59443493"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="59443493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:11:07 -0700
X-CSE-ConnectionGUID: E26Myj/tRWiTaymryXjy/A==
X-CSE-MsgGUID: TSYyz9QcTu+zXmCxS6G1LA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:11:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:11:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 14:11:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:11:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTv/S9mA4n6PlHCaS5yBg/dhgrdf7cd/ukNpNyoZRvUstgekZ0amakCJCmmWPsw+oEcVwJQGkQ2zCwbyQX8m06U/zxIugxqz8Dz8bNwq4Z9CrfqjeRiNFiK1EdTBYFWZXm0UZ+Aj1H9vZOYgdh5LeQTYpOAF+qYTElT/r1rXjGWxU04fQcPZPgUiE/R5zwoLSvcNp61slU8vd4kCAv47gpwRSFq7tNuVU1rl2E3g2vHD2yW82dqg/iv+fWEeJf+3YdiN3j/+KEQY0U84hJtNBiYUa8rgdmv/etXffF/lQIPepvruikHPm/3w0Ak4vZCW1vGETQNLz5AsrKzVGokuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsd64N4xNb/5w1DD2FWle7UqRBAZSSuAd8H7ogXZ/4A=;
 b=L59goyKw/ixl3c+LNor2QSxeekjCmYDt5/mlEeFdqjhEC8SHnvbDfvqyLP12MZxo53w6RQq6HwuY0CXKtL+nHxj9BDEenf8hoEwKE9X2jkJaZ1G81yt2dYTbG2fIwGy75i17cHMD6HpDUUuwZ+TeNB0IDBNYgcaAx3gP1tYBDRah1OywS4GMIsWszYmjuurif0c1cBrenaag37C+SB1Y7437mro1MVe4CeNOxUqhQwxOGo05J6DuT3ElrPFGXLuRNmrfyUvJWqailrh4LBQGEYf/cXfvtgJFY7FFrmJtqtsFwmhpLteJ/NyohppxCiVlSeN1VkMXFPI3qPMuKSgGBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 21:11:04 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 21:11:03 +0000
Message-ID: <05a81947-7bdd-470a-9a62-ead62fe36a72@intel.com>
Date: Thu, 4 Sep 2025 14:11:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Fix error handling if PXP fails to start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250818234639.2965656-3-daniele.ceraolospurio@intel.com>
 <fe1b455b-9917-4dec-8a16-94daa922263f@intel.com>
 <b820386a-79c0-4726-87c7-69806a110b79@intel.com>
 <ddf7168c-4fc3-44ac-9c29-a0f4e0e38125@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ddf7168c-4fc3-44ac-9c29-a0f4e0e38125@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 3318e21f-e0d3-4ce8-5288-08ddebf78e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1oyd3pVN1IyZlFpRzFmYXZlbzFnMGdxOGJQZnhvemVjd0FMbDdkVDIzYXJv?=
 =?utf-8?B?OU42cGUrQ1Z0N3pOeFBDSXhLQ2E5UkFnZnRrUFI2cVlid1RSUnJSRVJHU2c3?=
 =?utf-8?B?NDJDWmUyaWhITThZV1JOUlVtZzBFK1lwcXF0WERTV2Q4R2dlRGpyRmFwVUVS?=
 =?utf-8?B?MEpDU1pSeFV2bExHY3RYMEJoNlhWUFNtM3JnQi9vaTh4d1ZPRXJWaHNCeVFR?=
 =?utf-8?B?b3hOSWhaaEtJUnVxMFVJK2JnMWhFb3Rab0UvaU0xbGtkUmVxMlJ1Zjg2S2ND?=
 =?utf-8?B?Q3dKa0tSbUJiaVI0UFhXK21mT0xrZEI1cGtZT1Q4WHlIeE4xdlJsNUs1dFkz?=
 =?utf-8?B?Q1ROL0tIZzNJS0NWdmRpcUNDQUpIbDRLanV1T3RuSC8xUUF2clptZmMrMXZh?=
 =?utf-8?B?S3ArSkNqTEJ3akI0VlBiR0NNQk1sb0tYMHh4Q2tyNVgvRW56MG9TOFdhQTlt?=
 =?utf-8?B?ZmNkMzVsTkIzcEpHbENBMGdGK2VaV0g4WktxNjVPckRQNlRaZVFOakdDWXBj?=
 =?utf-8?B?ZDNPNGh3c3hkZzlGWUo1aHFlRjJFMTN4Qk44aU0vc1R2ang4M2Uxd3dXcGts?=
 =?utf-8?B?ellNbnVDdXZNcDFsMUlPcEZFWkdUblN0RmpmZmhub1dLQTBqVm1CdXVXa3ht?=
 =?utf-8?B?M1dEM1hEU29EOEZQRmVibkRYa3YyblhheDY1V2I5L2lIWTFBUmlKZWJjQlU0?=
 =?utf-8?B?SUo2RjN6cmYxcnR2Zk1IQ1ZXRFYvTitOK252UFZJRFFMWGxGVzBuWUkwQVNT?=
 =?utf-8?B?Mm5QTXFneVREREgvSlVjVWFsK2hxT3VxODVjclcrbXl1bGtHc1Y2bzFveFNX?=
 =?utf-8?B?c1FhWDJhdkJzRG5Da0h3dC9ybjNCdVVWNGQ1TUE0V2pka00zYjVEVmM5MFRP?=
 =?utf-8?B?aXMxTUZPT1hSbnlDR01oSnNHQ0dvOFhkaTcvS2QxMGt2L2dBQ1BvTGxtN1la?=
 =?utf-8?B?TFFUVFVqeWRxSjVQTnpORVhuaWFaOTYvRkZvWWpaQUthZjlGd2JBNzZOblVi?=
 =?utf-8?B?ZlNtWUdPeFdxaW1YMVNNSUUxZW5hTVlXcjBlVjg3UXVpSG9EYng0RHdOSkh6?=
 =?utf-8?B?VkUrVUZNQUFQNWtEeWFZVDRIeUJLM2VBV20wTmk2U3Q3Q3VEU0UzNHdPMTF6?=
 =?utf-8?B?OUU2NDNIZnoxMWpWZjFkUHpFZmQrNzlkWUlYNVd4NWdrbFdYU1M4ZVZtSUt6?=
 =?utf-8?B?V2tqN1BNNW1ONXJleVVGQkZ1K1hDNHJkaU9KcTMvK3JxMGd6NHhmRTRnTG4w?=
 =?utf-8?B?RTlQK3pKR25TWlVxeExyaEZqOENHd3hjWi9mOUNIUXY1L3kxSE5oMkV0RG16?=
 =?utf-8?B?OFZIYjl0cTZOemE5RjMrZ09hbnJCNm1MNXlVY00vcjdHSUhoVjBYMlhzZzly?=
 =?utf-8?B?cVBWdEZ5aFRBbWdMMWdFZ2EwQUsxZjFwb1dXbXFpVzkyZkhwOHcrdEFrRVc3?=
 =?utf-8?B?Wkp2MGoxYy84QzVwR2FGMnJHLzRFVXZ3MkZXNjA3KzRuODNOQWRSZ3JPc1ZU?=
 =?utf-8?B?N0NsTUgyTWVpZDVGYUU2VkM3dGE1Qy85RC84ZXlOUUEwUXl5ZWk5OGpPblp3?=
 =?utf-8?B?TEVYTFJHb2MyZmRiNlZqVEdISEJHMUFHQVFsdWo1a2w2U0xwNnBuNmZJN09T?=
 =?utf-8?B?ZXY2UEpXYUxyVk9kRytQWFVXUDZwSGt6NVhZa1ZNdUdzWjdGU3QvQUZZVzU4?=
 =?utf-8?B?T2xIOEhOSEU1RUNxc1ZZUGZ5ODM3aFlJQm11akFIbnpGbEpncVlSbGRscWw0?=
 =?utf-8?B?amZPK3ZJSHlYb2JUMmZwb24yOEM4T05DSGhYeWxvNFJVRDhRTUZJRmNhVnFr?=
 =?utf-8?B?TlpwL0ZlQ0h2MzhRbG1zeTdnS3FvdnR4OGZLdUJKZmg3Nktkcmc0MklFSk9w?=
 =?utf-8?B?V1JrV0p1OVFFczltSWZEcTJLMDFuaFBEbytoeHR5N3hVWnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WktxV1Jjc3kxNXNja0hBZUY3WjBCK0srbUxSMU1hQTdhV1ZBeW1ET2kzL083?=
 =?utf-8?B?enBoV0I2Qk1MeEdLUGxlTFU3aUl2blQ0ZWdhb0dFRko5K1FIY3R0SWZOT2Jm?=
 =?utf-8?B?d1NQTFhEczVFRW12RVdGUEFQSmtldGxtSEJUS1VOVkhRRUJwTHN4LzZhWHJu?=
 =?utf-8?B?Vkp4VjYxajVtbkVZSnBTaTdtd0NxUnRCQ21vbDhjNzBJbUNFdiswWWgyVWhF?=
 =?utf-8?B?a2UrUHlscUJVdzJXbStuanlFYnVvQ3NkUHhGSzlSSklpS2pBVzJzTzFGNktJ?=
 =?utf-8?B?Y3JOOFBzeDVDM0NucmlMVTl5cFJUZHBBSm9Ub3k4ZFZpVXJlS1Bzb2RaNHNS?=
 =?utf-8?B?S24yVGJORkE3RGo0QWhuOXppNmpoaHBKM00xZktIKzZJN1liZ1N5clc0MnRC?=
 =?utf-8?B?RHRvT29wSnk0d1VucitHMDI1WWxNcGNZWVM2N1lHckQvclhKR1d4MTBELzlW?=
 =?utf-8?B?TE1QcjU2L1ZBVGhib2s3SXNPOEh6OXArYnZLWU5ncmcvSkFaTzNaWEVjU2hM?=
 =?utf-8?B?R1ljSmhCYTFFcHhYZzVtckRndFJmRVNJSzhXSTh3Y1Z4ejFiN2hoUlZObW4w?=
 =?utf-8?B?MHFMT2JDMnZwVURpbkhidm5FWUVFTVZDNjZhYVp2ZkdGZGd5Mkl4VHFuM0ow?=
 =?utf-8?B?dDNHV3FYTGgzbWVLcjNCUjZPdklZWTQxRjJzU25oTk03UFFGYUZTYmI4UFgr?=
 =?utf-8?B?dS9hNktlb2FSaVZhK3pQYUN5b0hvZ0ZhRm56eHgxTWUyMCsvMmJ2aUpld0Y2?=
 =?utf-8?B?blZLYlF1Q2VZcDhLNXRPRnZkWGpkSWY4aG1BVFgzR1lhOGhISHhreldyNEtw?=
 =?utf-8?B?Wm5JUlhKM1V4cThPTUNpZUk5cDhONG8wSVpLQnZRTGNzZDhsVjJoMXZNVmRr?=
 =?utf-8?B?UVhkZE5UMTJ0NFlYbDBDQy9HNTY3YUZ4RzYvbzNkQVV3NWNSV1k3TkhYd1h4?=
 =?utf-8?B?cmtRdGVwVzBhUzVKRjdUUUsrSVVaS3k1WldwdUtRZTVSejdwbXJOV3BVaXdv?=
 =?utf-8?B?T2NIWWp5RnBIcGVhTG92NmRJc1BGOXY5TzM5Vjg2cFV6cUlTR2xDWEo3ei9F?=
 =?utf-8?B?YXdjdjFMMGtVS0dZOFhrTjUvdjZvVWw1SHZyWUI2VVhkTUJEWC9qdWtWQ1lB?=
 =?utf-8?B?R0V5ZThtUEFXZEtSMmtHeVV3OUhmTG1aelYydUU2Rnc2ZkNsejFWdjBML3ZC?=
 =?utf-8?B?YnRxcHp2SjlNQWdjbUtSZVMzS0JmWTJzZzk4c1p3a2xPVHUyaXFVaW1HaGdo?=
 =?utf-8?B?UTQwdXpqL0QwVzc4S3R6U2FqZ2NZUTdCc0hHQmpyZktFVFMvWDJudGVvdVc3?=
 =?utf-8?B?L2NWNmZaVFpBQzVIWjVxSU9rdUlabXgxOHR0M3JFejhZdTBHbFp3S2hCdGRN?=
 =?utf-8?B?NEgxRUNORzFELzBTZ0xUa2JxM21vQS8zR0IvRjFMQm9ydk84UHJSYnMvYVZH?=
 =?utf-8?B?SDRtaWlvS3dIdjNmWVJXdC9iZEVOQWJ2SjF5ZFNaMWRLSC9TY3RYblVYVFpX?=
 =?utf-8?B?bE9PVnZaTDB3b2RESXgwUDlmdmNuZDdaVlNzTmwvblNWRHZtVFloS1ZjL0x3?=
 =?utf-8?B?TG9wV0xzWEZmR3VEanM4SVJYZ21QMWhUOXNqc1gyKzhsb2kzSEVTcEh0WnVC?=
 =?utf-8?B?NUVlbUROVGtad285bHBCS1Z5QWoraGJWR0lXQlZWTFRtQzRCa2Rva2ZqbmJz?=
 =?utf-8?B?enVxcjlRYVRsdk5obDdTQWxKSDkxeGdTOWFJYzNMaW5MUmszZnJDTmtQbTBq?=
 =?utf-8?B?ZkNibUZTSWxxMmNPcUhSbFFtSkcwVVAxOEZjNThkcER6enVveUlIdVRxeDFM?=
 =?utf-8?B?NWxNU3NqeG5McHNCS0dJZURvZnBmbk9xWmp1TXg1dlRhTm8xUm1OYVV6WUlu?=
 =?utf-8?B?d1NVanJXUnF1c09aMk9GSmFsT0c4WnU4VjUzYmowSDcrbHBUNGV5bStDa2Mw?=
 =?utf-8?B?RW5VWi9RZkdMY0ZzVG1tNmJ5akp4RERuUFovd3VoUjdodk5RRkNhdjlISVIw?=
 =?utf-8?B?YWo4cDBiRTZYQVJMY1RscmxrME0wTUsrdDdrMHZWelR1RUxuS3V0S2ZCVUMw?=
 =?utf-8?B?Yk1qSzlLQ1lZaHRnclZBdjNnWllib1hybk1xa1p6enMxZkJtOFVvdWFVN3Js?=
 =?utf-8?B?NXhoTTBiVzMxa2dxcU9tNS9KZTJBMUU3TVBIaG1GZDZNQUtKYUFnWTgwKy8w?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3318e21f-e0d3-4ce8-5288-08ddebf78e84
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:11:03.9312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FRrHcuYcaE9yM5/v5ihyszZUcuT1zIGPOHyvlogjKr6yY0yhtA5wUDMzquSoWtVAGsZeJRXgSYCiqye/qUjA5DTty1Q9ukJZObPMmrhcho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
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

On 9/4/2025 1:57 PM, Daniele Ceraolo Spurio wrote:
> On 9/4/2025 1:55 PM, Daniele Ceraolo Spurio wrote:
>> On 9/4/2025 1:45 PM, John Harrison wrote:
>>> On 8/18/2025 4:46 PM, Daniele Ceraolo Spurio wrote:
>>>> Since the PXP start comes after __xe_exec_queue_init() has completed,
>>>> we need to cleanup what was done in that function in case of a PXP
>>>> start error.
>>>> __xe_exec_queue_init calls the submission backend init() function,
>>>> so we need to introduce an opposite for that. Unfortunately, while
>>>> we already have a fini() function pointer, it is does perform other
>>> it is does?
>>>
>>>> operations in addition to cleaning up what was done by the init().
>>>> Therefore, for clarity, the existing fini() has been renamed to
>>>> destroy(), while a new fini() has been added to only clean up what was
>>>> done by the init(), with the latter being called by the former (via
>>>> xe_exec_queue_fini).
>>> It would be much easier to follow the changes if the rename was 
>>> split into a prep patch and then the behaviour change patch was just 
>>> the behaviour change.
>>
>> This is a fixes patch, so I wanted to avoid having prerequisite 
>> patches for it because it'll make it fail to apply.
>> The other option I thought of is to do something like:
>>
>> patch 1 (fixes): add a new function pointer with a new name 
>> (fini_last ?) to undo the init() action.
>> patch 2: swap the function names (fini -> destroy, fini_last -> fini)
>>
>> However, not sure if this is better because we'd leave unbalanced 
>> naming with only patch 1.
>>
>> Thoughts?
>> Daniele
>>
>
> Thinking about it a bit more, I could also split it as you suggested 
> for review and then squash it before merging.
I guess it's not really possible to only do the squash on the backported 
patch but leave it split in mainline. But yeah, split then squash would 
definitely help for review purposes.

Thanks,
John.

>
> Daniele
>
>>>
>>> John.
>>>
>>>>
>>>> Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC 
>>>> support for PXP-using queues")
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_exec_queue.c           | 24 ++++++---
>>>>   drivers/gpu/drm/xe/xe_exec_queue_types.h     |  8 ++-
>>>>   drivers/gpu/drm/xe/xe_execlist.c             | 25 ++++++----
>>>>   drivers/gpu/drm/xe/xe_execlist_types.h       |  2 +-
>>>>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  4 +-
>>>>   drivers/gpu/drm/xe/xe_guc_submit.c           | 52 
>>>> ++++++++++++--------
>>>>   6 files changed, 74 insertions(+), 41 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c 
>>>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> index 2d10a53f701d..bce507c49517 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> @@ -199,6 +199,18 @@ static int __xe_exec_queue_init(struct 
>>>> xe_exec_queue *q)
>>>>       return err;
>>>>   }
>>>>   +static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    q->ops->fini(q);
>>>> +
>>>> +    for (i = 0; i < q->width; ++i)
>>>> +        xe_lrc_put(q->lrc[i]);
>>>> +
>>>> +    return;
>>>> +}
>>>> +
>>>>   struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, 
>>>> struct xe_vm *vm,
>>>>                          u32 logical_mask, u16 width,
>>>>                          struct xe_hw_engine *hwe, u32 flags,
>>>> @@ -229,11 +241,13 @@ struct xe_exec_queue 
>>>> *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>>>>       if (xe_exec_queue_uses_pxp(q)) {
>>>>           err = xe_pxp_exec_queue_add(xe->pxp, q);
>>>>           if (err)
>>>> -            goto err_post_alloc;
>>>> +            goto err_post_init;
>>>>       }
>>>>         return q;
>>>>   +err_post_init:
>>>> +    __xe_exec_queue_fini(q);
>>>>   err_post_alloc:
>>>>       __xe_exec_queue_free(q);
>>>>       return ERR_PTR(err);
>>>> @@ -331,13 +345,11 @@ void xe_exec_queue_destroy(struct kref *ref)
>>>>               xe_exec_queue_put(eq);
>>>>       }
>>>>   -    q->ops->fini(q);
>>>> +    q->ops->destroy(q);
>>>>   }
>>>>     void xe_exec_queue_fini(struct xe_exec_queue *q)
>>>>   {
>>>> -    int i;
>>>> -
>>>>       /*
>>>>        * Before releasing our ref to lrc and xef, accumulate our 
>>>> run ticks
>>>>        * and wakeup any waiters.
>>>> @@ -346,9 +358,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>>>       if (q->xef && 
>>>> atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>>>> wake_up_var(&q->xef->exec_queue.pending_removal);
>>>>   -    for (i = 0; i < q->width; ++i)
>>>> -        xe_lrc_put(q->lrc[i]);
>>>> -
>>>> +    __xe_exec_queue_fini(q);
>>>>       __xe_exec_queue_free(q);
>>>>   }
>>>>   diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h 
>>>> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>> index ba443a497b38..27b76cf9da89 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>> @@ -181,8 +181,14 @@ struct xe_exec_queue_ops {
>>>>       int (*init)(struct xe_exec_queue *q);
>>>>       /** @kill: Kill inflight submissions for backend */
>>>>       void (*kill)(struct xe_exec_queue *q);
>>>> -    /** @fini: Fini exec queue for submission backend */
>>>> +    /** @fini: Undoes the init() for submission backend */
>>>>       void (*fini)(struct xe_exec_queue *q);
>>>> +    /**
>>>> +     * @destroy: Destroy exec queue for submission backend. The 
>>>> backend
>>>> +     * function must call xe_exec_queue_fini() (which will in turn 
>>>> call the
>>>> +     * fini() backend function) to ensure the queue is properly 
>>>> cleaned up.
>>>> +     */
>>>> +    void (*destroy)(struct xe_exec_queue *q);
>>>>       /** @set_priority: Set priority for exec queue */
>>>>       int (*set_priority)(struct xe_exec_queue *q,
>>>>                   enum xe_exec_queue_priority priority);
>>>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c 
>>>> b/drivers/gpu/drm/xe/xe_execlist.c
>>>> index 788f56b066b6..f83d421ac9d3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>>>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>>>> @@ -385,10 +385,20 @@ static int execlist_exec_queue_init(struct 
>>>> xe_exec_queue *q)
>>>>       return err;
>>>>   }
>>>>   -static void execlist_exec_queue_fini_async(struct work_struct *w)
>>>> +static void execlist_exec_queue_fini(struct xe_exec_queue *q)
>>>> +{
>>>> +    struct xe_execlist_exec_queue *exl = q->execlist;
>>>> +
>>>> +    drm_sched_entity_fini(&exl->entity);
>>>> +    drm_sched_fini(&exl->sched);
>>>> +
>>>> +    kfree(exl);
>>>> +}
>>>> +
>>>> +static void execlist_exec_queue_destroy_async(struct work_struct *w)
>>>>   {
>>>>       struct xe_execlist_exec_queue *ee =
>>>> -        container_of(w, struct xe_execlist_exec_queue, fini_async);
>>>> +        container_of(w, struct xe_execlist_exec_queue, 
>>>> destroy_async);
>>>>       struct xe_exec_queue *q = ee->q;
>>>>       struct xe_execlist_exec_queue *exl = q->execlist;
>>>>       struct xe_device *xe = gt_to_xe(q->gt);
>>>> @@ -401,10 +411,6 @@ static void 
>>>> execlist_exec_queue_fini_async(struct work_struct *w)
>>>>           list_del(&exl->active_link);
>>>>       spin_unlock_irqrestore(&exl->port->lock, flags);
>>>>   -    drm_sched_entity_fini(&exl->entity);
>>>> -    drm_sched_fini(&exl->sched);
>>>> -    kfree(exl);
>>>> -
>>>>       xe_exec_queue_fini(q);
>>>>   }
>>>>   @@ -413,10 +419,10 @@ static void execlist_exec_queue_kill(struct 
>>>> xe_exec_queue *q)
>>>>       /* NIY */
>>>>   }
>>>>   -static void execlist_exec_queue_fini(struct xe_exec_queue *q)
>>>> +static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
>>>>   {
>>>> -    INIT_WORK(&q->execlist->fini_async, 
>>>> execlist_exec_queue_fini_async);
>>>> -    queue_work(system_unbound_wq, &q->execlist->fini_async);
>>>> +    INIT_WORK(&q->execlist->destroy_async, 
>>>> execlist_exec_queue_destroy_async);
>>>> +    queue_work(system_unbound_wq, &q->execlist->destroy_async);
>>>>   }
>>>>     static int execlist_exec_queue_set_priority(struct 
>>>> xe_exec_queue *q,
>>>> @@ -467,6 +473,7 @@ static const struct xe_exec_queue_ops 
>>>> execlist_exec_queue_ops = {
>>>>       .init = execlist_exec_queue_init,
>>>>       .kill = execlist_exec_queue_kill,
>>>>       .fini = execlist_exec_queue_fini,
>>>> +    .destroy = execlist_exec_queue_destroy,
>>>>       .set_priority = execlist_exec_queue_set_priority,
>>>>       .set_timeslice = execlist_exec_queue_set_timeslice,
>>>>       .set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
>>>> diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h 
>>>> b/drivers/gpu/drm/xe/xe_execlist_types.h
>>>> index 415140936f11..92c4ba52db0c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_execlist_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_execlist_types.h
>>>> @@ -42,7 +42,7 @@ struct xe_execlist_exec_queue {
>>>>         bool has_run;
>>>>   -    struct work_struct fini_async;
>>>> +    struct work_struct destroy_async;
>>>>         enum xe_exec_queue_priority active_priority;
>>>>       struct list_head active_link;
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h 
>>>> b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>>> index a3f421e2adc0..c30c0e3ccbbb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>>> @@ -35,8 +35,8 @@ struct xe_guc_exec_queue {
>>>>       struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>>>>       /** @lr_tdr: long running TDR worker */
>>>>       struct work_struct lr_tdr;
>>>> -    /** @fini_async: do final fini async from this worker */
>>>> -    struct work_struct fini_async;
>>>> +    /** @destroy_async: do final destroy async from this worker */
>>>> +    struct work_struct destroy_async;
>>>>       /** @resume_time: time of last resume */
>>>>       u64 resume_time;
>>>>       /** @state: GuC specific state for this xe_exec_queue */
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> index 860c07da598a..75208ea4d408 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -1418,48 +1418,57 @@ guc_exec_queue_timedout_job(struct 
>>>> drm_sched_job *drm_job)
>>>>       return DRM_GPU_SCHED_STAT_NO_HANG;
>>>>   }
>>>>   -static void __guc_exec_queue_fini_async(struct work_struct *w)
>>>> +static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>>> +{
>>>> +    struct xe_guc_exec_queue *ge = q->guc;
>>>> +    struct xe_guc *guc = exec_queue_to_guc(q);
>>>> +
>>>> +    release_guc_id(guc, q);
>>>> +    xe_sched_entity_fini(&ge->entity);
>>>> +    xe_sched_fini(&ge->sched);
>>>> +
>>>> +    /*
>>>> +     * RCU free due sched being exported via DRM scheduler fences
>>>> +     * (timeline name).
>>>> +     */
>>>> +    kfree_rcu(ge, rcu);
>>>> +}
>>>> +
>>>> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>>>   {
>>>>       struct xe_guc_exec_queue *ge =
>>>> -        container_of(w, struct xe_guc_exec_queue, fini_async);
>>>> +        container_of(w, struct xe_guc_exec_queue, destroy_async);
>>>>       struct xe_exec_queue *q = ge->q;
>>>>       struct xe_guc *guc = exec_queue_to_guc(q);
>>>>         xe_pm_runtime_get(guc_to_xe(guc));
>>>>       trace_xe_exec_queue_destroy(q);
>>>>   -    release_guc_id(guc, q);
>>>>       if (xe_exec_queue_is_lr(q))
>>>>           cancel_work_sync(&ge->lr_tdr);
>>>>       /* Confirm no work left behind accessing device structures */
>>>> cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>>>> -    xe_sched_entity_fini(&ge->entity);
>>>> -    xe_sched_fini(&ge->sched);
>>>>   -    /*
>>>> -     * RCU free due sched being exported via DRM scheduler fences
>>>> -     * (timeline name).
>>>> -     */
>>>> -    kfree_rcu(ge, rcu);
>>>>       xe_exec_queue_fini(q);
>>>> +
>>>>       xe_pm_runtime_put(guc_to_xe(guc));
>>>>   }
>>>>   -static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
>>>> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>>>>   {
>>>>       struct xe_guc *guc = exec_queue_to_guc(q);
>>>>       struct xe_device *xe = guc_to_xe(guc);
>>>>   -    INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
>>>> +    INIT_WORK(&q->guc->destroy_async, 
>>>> __guc_exec_queue_destroy_async);
>>>>         /* We must block on kernel engines so slabs are empty on 
>>>> driver unload */
>>>>       if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || 
>>>> exec_queue_wedged(q))
>>>> - __guc_exec_queue_fini_async(&q->guc->fini_async);
>>>> + __guc_exec_queue_destroy_async(&q->guc->destroy_async);
>>>>       else
>>>> -        queue_work(xe->destroy_wq, &q->guc->fini_async);
>>>> +        queue_work(xe->destroy_wq, &q->guc->destroy_async);
>>>>   }
>>>>   -static void __guc_exec_queue_fini(struct xe_guc *guc, struct 
>>>> xe_exec_queue *q)
>>>> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct 
>>>> xe_exec_queue *q)
>>>>   {
>>>>       /*
>>>>        * Might be done from within the GPU scheduler, need to do 
>>>> async as we
>>>> @@ -1468,7 +1477,7 @@ static void __guc_exec_queue_fini(struct 
>>>> xe_guc *guc, struct xe_exec_queue *q)
>>>>        * this we and don't really care when everything is fini'd, 
>>>> just that it
>>>>        * is.
>>>>        */
>>>> -    guc_exec_queue_fini_async(q);
>>>> +    guc_exec_queue_destroy_async(q);
>>>>   }
>>>>     static void __guc_exec_queue_process_msg_cleanup(struct 
>>>> xe_sched_msg *msg)
>>>> @@ -1482,7 +1491,7 @@ static void 
>>>> __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>>>>       if (exec_queue_registered(q))
>>>>           disable_scheduling_deregister(guc, q);
>>>>       else
>>>> -        __guc_exec_queue_fini(guc, q);
>>>> +        __guc_exec_queue_destroy(guc, q);
>>>>   }
>>>>     static bool guc_exec_queue_allowed_to_change_state(struct 
>>>> xe_exec_queue *q)
>>>> @@ -1715,14 +1724,14 @@ static bool 
>>>> guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>>>>   #define STATIC_MSG_CLEANUP    0
>>>>   #define STATIC_MSG_SUSPEND    1
>>>>   #define STATIC_MSG_RESUME    2
>>>> -static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>>> +static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>>>>   {
>>>>       struct xe_sched_msg *msg = q->guc->static_msgs + 
>>>> STATIC_MSG_CLEANUP;
>>>>         if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && 
>>>> !exec_queue_wedged(q))
>>>>           guc_exec_queue_add_msg(q, msg, CLEANUP);
>>>>       else
>>>> -        __guc_exec_queue_fini(exec_queue_to_guc(q), q);
>>>> +        __guc_exec_queue_destroy(exec_queue_to_guc(q), q);
>>>>   }
>>>>     static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>>>> @@ -1852,6 +1861,7 @@ static const struct xe_exec_queue_ops 
>>>> guc_exec_queue_ops = {
>>>>       .init = guc_exec_queue_init,
>>>>       .kill = guc_exec_queue_kill,
>>>>       .fini = guc_exec_queue_fini,
>>>> +    .destroy = guc_exec_queue_destroy,
>>>>       .set_priority = guc_exec_queue_set_priority,
>>>>       .set_timeslice = guc_exec_queue_set_timeslice,
>>>>       .set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
>>>> @@ -1873,7 +1883,7 @@ static void guc_exec_queue_stop(struct xe_guc 
>>>> *guc, struct xe_exec_queue *q)
>>>>           if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>>>>               xe_exec_queue_put(q);
>>>>           else if (exec_queue_destroyed(q))
>>>> -            __guc_exec_queue_fini(guc, q);
>>>> +            __guc_exec_queue_destroy(guc, q);
>>>>       }
>>>>       if (q->guc->suspend_pending) {
>>>>           set_exec_queue_suspended(q);
>>>> @@ -2202,7 +2212,7 @@ static void handle_deregister_done(struct 
>>>> xe_guc *guc, struct xe_exec_queue *q)
>>>>       if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>>>>           xe_exec_queue_put(q);
>>>>       else
>>>> -        __guc_exec_queue_fini(guc, q);
>>>> +        __guc_exec_queue_destroy(guc, q);
>>>>   }
>>>>     int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 
>>>> *msg, u32 len)
>>>
>>
>

