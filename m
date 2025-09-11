Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B75CAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 04:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE58A10E29F;
	Thu, 11 Sep 2025 04:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2gG7vuc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCE510E0F4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 04:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757563924; x=1789099924;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jZA1/4Yq5iQnjKnLGuEj+596mB+boGpd5lhHbQOf0AE=;
 b=U2gG7vuch9lr5fmxOmc67gxu2UTeP1aOtxiox05QQAmxAMu0zG9k+19b
 bm9atPTho4KVL0oc1NqRShxwVA5AG7OicrRPZS36gEhODwc1XVNr2U8iH
 YDcsxAccg/v3MapNSTVrffq8SPv2ft6JU7AvHRTic5BHFOWaubs6LPQZ4
 MLew8Gen7OvUhvDM7T2Sy1i1CX0gRBvJnaQQ1Y9Q2/8WztY/5iCifYVUT
 lAuJMsNfkeQgi/22w9WRHt+XinXHEkHpu/dMQ+GrESJNxIstTZjHZIVBJ
 iPZ3JCVZohfGPsHVbTE7K+eU/u7MgY7fjh5bQ9beWEX2Cr92QE/Tke/hy A==;
X-CSE-ConnectionGUID: 1PuPS3q5Q7mb/O5WLzNwSQ==
X-CSE-MsgGUID: 9lHHfuI8SHC4dHBQDQlXHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59833556"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59833556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 21:12:03 -0700
X-CSE-ConnectionGUID: VB6K8OuFQlaMP7S854J2sQ==
X-CSE-MsgGUID: +SHwmLBGQouSmu6wj8ecsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173478076"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 21:12:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 21:12:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 21:12:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 21:12:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gngu/BOXizWfAzARaB0K39W/If2NVtypiVH8kt8dYHHMjh1bgV0BeiNmT8Pww9Zp8lAG9Le8XcOVrZwPdm+pCiXeTX7YLH4viRxUELhpzSnkiodpFQyXiEZft4WyBkdZcYOKoQLssLG4rCrFLbQg8Kdnoxf89vrL5J5slNo1lV9geghx0p1/KpFakYVUNXLtI96Vgnr6SfPdUjMvmo6wEwzLkjwnjY2fTAzRrsWx8QeO+coFcpwz0l5QFP05naL41TyNpyeFvGsPYmoEri9cobBvamcGDv3YHsdGkr6RlyhQuKStHvwavnzZsK+4RyBq6TGsAiBKoyXEVAi62ZMAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oub6DcE06O02/A798Qa4GYWmeuqtU+8kS1IN3bvfFs=;
 b=TQuXZZlzCJUoIeGEP6dBtYOGOB4wGeht/Nw2do2cdpwduen0/IRUFbwrAL7ISX49QmfCmKLBtxjjvAcM8qCgUJy8njv2OPorqM2lbcKcEqf7cDWTASnkiqpUV/nujomC+BTC2TV+w1+OYMXJHfoEuRe2A9mDDByXop9to79BUGuu3BqJdlwZXYf5yFg6W3lB5x/tQGzO6tqqCoYUAxDEcNEnxZvsG+nyIKg9WzZ+0mB5YhUJ0GdL8qg8MJ09gOx7D8/5vRpBXU98pYcXi/tKWllY6xCPll/wnpwkOoE2eYeaxGciM6Bb5kxbsl8zc70e+z1URsS+w14C5ncf5CsFTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB8915.namprd11.prod.outlook.com (2603:10b6:208:560::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 04:12:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 04:12:00 +0000
Date: Wed, 10 Sep 2025 23:11:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Message-ID: <7p7wqbghc2ebupbzljjaegakun3azczuby2haiqmmneavnpl44@joqtzfismsgv>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910183233.3971054-1-zongyao.bai@intel.com>
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ca4041-1ea4-4ec3-b9c7-08ddf0e95af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWhQQUt3U0hSSkwvcGdzS1NiSlMvdTNTYW5vZ00vaXVHcUtDK2JIUTlERjQ1?=
 =?utf-8?B?ZFBObVNISXQ0OG1Fdm5ZVDYzN3FhcU5WRTFpVmJyNGpCTnNLb3ZONkVKNVZ6?=
 =?utf-8?B?dGpCSEpJdklVS1FNRFRvSjJRR2dnU3VUUkF0OXZoSXVkS2FsR09md1hPc1RJ?=
 =?utf-8?B?TjIyWkJpRGdicU5BclQvQitDZG9EeXNKYUEwY3dSUVdsUmdNQUxhZGN3cFZT?=
 =?utf-8?B?UWw3TFNsc0syOWxobFhpK1ZpcUc2bCszNlpqS0gyZk1aZFhMS1ZubU9RUWRK?=
 =?utf-8?B?SEpOZFptV0xST1hJaXhkSmFqRXRBcW8zQUFsOGZPR0x6L0VneWljeWNiemNE?=
 =?utf-8?B?cmtmdVMyMmNNSWpoZ0M2dUVxSlcyODdSUnJYOUJ1OVQ4S2MycnNWbkE0N1lC?=
 =?utf-8?B?SnVNWFJWOHJoell3NUNaQ29ldWp5aHZ3VWN4Y0YxeXAyL1RYQzJjU1g0NEhX?=
 =?utf-8?B?d2VGaWI0R0hKbnoyV1FLZVNCOXpIcFNkb1ZhRUw2Q3NuWjBoUldBemwzcGVD?=
 =?utf-8?B?QlRtL0pSY2FweTRVNUIxNlNzcXNXdzB0eUdZeUdlWXBMWnlwT3BKNEJuc0tD?=
 =?utf-8?B?Tm9NOUJJTW1VelBTUW1RakNObFUwajdEenltYm5LcWdhRkk5Q1BTNWRkLzFj?=
 =?utf-8?B?ajlGWVgwdGRXUlBDSmt1VHJlUUk4YTBha0d4UkhHY2VJVDd3M29HcUlaR0FV?=
 =?utf-8?B?RldTOFdZSXoxVGZWQWdwMEw0SVlXNUZPaGJLY1REbWNOa2xHaDdGQ0ZKY3FZ?=
 =?utf-8?B?bkdPRUcyUU1lSStDZ2dteDcxSXozTE56UkNqeWQvblppOWRKckRXWEVjdzI2?=
 =?utf-8?B?NWVIeU5rNXM2dUhacEJxT3lSWE1mUmRBNm5jVEJjV3U0cGdHTVdydHVzcW9v?=
 =?utf-8?B?TUdrUjlRejVBVmpodU5EZGtmZ3lQemVYenR0Z3U3RlUwaUw0UGc4dVJsWStP?=
 =?utf-8?B?Q0djUUdNOGQ1WkZHSHp4UUV5MzBLYUhFYUxEL1BzbE1EWjlxMFZFUDN4cW53?=
 =?utf-8?B?VmZwUkQrNjR3a1k2RVd6TUp4cnovK2MyWkFjNHE3R3JXQ1ZJUnRXWGVUSDBN?=
 =?utf-8?B?TDhuQXhWT1dxNGhLM1dweVArMHVUT0g4SVFGN0VmWVZpcUMreWtRUzVHdTIx?=
 =?utf-8?B?THRkNUw2VUV4YkhvQm52V2lQYnRIb0kxKzlJRnMzZ2l2RWpsN0VQVXE5anVJ?=
 =?utf-8?B?K3JjUXU1T0VjakgycWx1OTh6bFBVUFVzVlZNdUozRExBVW0wT282MUxTc1p6?=
 =?utf-8?B?WCtNVS8xK0dFc0l2TFdteFlKb2dyOHZ1TG0wN2laUE9NdHpxMzhLZi9obGYw?=
 =?utf-8?B?eWt5Y1hIQ2lGbUlQemZJakFmZUQzWnBTelR4QkxpakJJMUFQM0hmdjVNTkNJ?=
 =?utf-8?B?QS96bXpLaWd1S2pKc2xobHo2QkhPbUd6ZkUrOUZ5RmJKRjhKdXNySjk0b091?=
 =?utf-8?B?em1NRzVuWWZEYVNKMTZhdGxoVGN4aVVDbnhJeHNsZFE1c0JjVG1sc0hLZmR1?=
 =?utf-8?B?MjVTZGNDV1dsMUlXZGs1WTJ0bW1rVU9sLzlVTi92VVIweGIxN2YrTEU1RkpT?=
 =?utf-8?B?STRsTFdwaHRlQ3UxUHpMYUJ0aGNCc05SUTVPdHVNUUoyQ2N0NnVCb29PWU9J?=
 =?utf-8?B?NFJwMDBkN2tzcTNVdDcwanM0ODRIMEZKendlMTZyTDEzU3NTWkZJbEt5cGYz?=
 =?utf-8?B?elF2eUhxOGtZQVpsOVlaY1lscm4wbjBtZDBVZXhvWHhTY3pBaXVKOUhsTzJk?=
 =?utf-8?B?UEFjS2lMV0NlQUI0dkpHY3hGRWp4dlZxbmk1bDV6cVI1NW5yS3pXRkpyUFhk?=
 =?utf-8?B?WWVyUnpMOUNOUys4SDVsTXZkZnMvNU4wdW9Vc1pyb1EvTmNvT0RZMU04cE9Z?=
 =?utf-8?B?UWxSNG45UWhWbVdOUkRqQld4VUNKcDdINjVJaVJXWmlhbHBld3poTjNRYW1Q?=
 =?utf-8?Q?WK+xhHHWfkU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFNUcEsvZWQvN0tzbjRXcjF3ZkJSU0l6c0xzZS93Wld1Tzd2N3VoUWZ6cEtJ?=
 =?utf-8?B?RTlNOUxmMTV2N0JQYjBoZkFPU3Zhb0NoMi8zVCs5MWI0dDdqOXJIUjlKWE9t?=
 =?utf-8?B?SHdlczJmZHpHM3YyMDdNaDJWSXptQ2pBUmtqTUdBNTRqcnhrUDE4MS9JSGpH?=
 =?utf-8?B?M0xhSFNWV055RlIyRmU3a1pha1lFaE1CSmc5NkxzUW9JS2JKNTRwME12UzlX?=
 =?utf-8?B?bEcvOTA4dm10blh4dDNLOW8rZEk4LzNwMHdGVGJHSklFeWtjVm50NjdmWEg3?=
 =?utf-8?B?REhJUExya2dDMUVDeWRXVWNnZTFjNUtrOG50dUxYNE9YUlVES2NJQllqYnVN?=
 =?utf-8?B?UEROSVJMZHlWanh1Mkg3dDFHeGUwZ0RJczlkNWtRRUkvKzJKVXVjZU9sSUY1?=
 =?utf-8?B?czdMYVZTRm9FNWNSdXhHT3h4TWhiZnh6dUdkVUxHdGZaaTI1NnBsQWVvNGJh?=
 =?utf-8?B?YWFNQlpwcTBrNTZFNEpnMjFJZ1RsakVxVWY5S3ZFeVRPOU1jeVVwaDBGZW1B?=
 =?utf-8?B?SmMydldNMlNxUEkrQ21SWjFWcXdSekpPTTd5Q2hFc2lVQWwzdkdUR1RjTXIz?=
 =?utf-8?B?U3p6RWRSWDZjT2svNFFsUm90STNCRFZiOVdVaGdCVmF0aEplcDlqOVV2UlJO?=
 =?utf-8?B?b0NSVzNNUWQzdkUxdXZjVDI1V2xYU2Rud2tqOE9CcFlGaEJVbGJoVmZDOWxn?=
 =?utf-8?B?YzBuMEVOei9OdnpybXJRS3BjeGNueUxCRGtKSWdZUGVDUGllNWR4QUlYcEM2?=
 =?utf-8?B?VU8waUoxLzRIMXFybUovSmVudnNDVjhIakQrektvZUdTdkpVeDFyMGw4QVUw?=
 =?utf-8?B?RHc1aERVbUR1MVVEK3JidGFxbzV1WUEzVTFOM1RPcVI0K2h2N3NkdEpSVEUy?=
 =?utf-8?B?RlZ5dWhjTm1IMGdMdnNMRE9sdk9sb1VFVWMwbXA5ZVRBSGhFRW5BL2gwamRN?=
 =?utf-8?B?TlVhTVpGVXJmVDU5SnU5M2dMK05FV1l4c1RNTGN4ZVI2UityRk5mWjJzdExy?=
 =?utf-8?B?bmY0M01lWi9IaUxoNXlzVkJMM2srVEJuK0VOUlptQTdaQzNDTnNnVTRDdm5t?=
 =?utf-8?B?ZDJ6UkxtVHBiQktIQUZ5OGtiOXViRlJGUzR2aUpsWDFTclhjNXRFSU1tWVRl?=
 =?utf-8?B?dEhjU1h0Qk00RmdmU3ZxRUZtanJxS2s2YmxDMEora1F1WjdEQWhOcEdxeU1M?=
 =?utf-8?B?V0pwTHB0MWlBZlJiWUhiOFNMaEd2TU5yeUYyRFppUFdZREpEVU9wYS9BKy9F?=
 =?utf-8?B?c1FvLzRkeEdjMzhia1Y1SjM5emlPYzZDcytOOG9KVjBnNTQ5VmRadkxNQU40?=
 =?utf-8?B?WkpmTUxVM2I1RFpmMnpxSEdxUWxGZVNtVEl0Tm5hWWthdXVMQmVKbmV5T1Iz?=
 =?utf-8?B?eWdBN0poM0lNbVR6NTlXN2ZWT0twdXByNTJJbnd2NHFybkFBVEZpUTZjVTZt?=
 =?utf-8?B?T3FmZ25oRERjNWtoQmJwdng5aGlOb21EblFtcFRLdGtmZzlRbTUydndBeUFY?=
 =?utf-8?B?b0tHd0NMTmczb0tiVEtUZWVaRWljUThmcDVmODFrbVpWVmVScWFQYnVSSXJG?=
 =?utf-8?B?Q3dxUWIxVGlWZjEwejVOd2djWHZnVzZYZHBLbElzRnN3aEtJN2ZRa3dlVkRx?=
 =?utf-8?B?Z2xuREZ3M0pQNzJEQzlwbG9venU3Y29oaDNzbksxS3RNQlJpZm13ZHN2R1pS?=
 =?utf-8?B?Ums4Q3ZjTmFYYlMzcFNNMDZkMldDQUNLeWl0RS9GWS9uS005VGMxNlpJYnJO?=
 =?utf-8?B?dUNWZjduOVltZDFTbmJxVUxSbHViME1zUHJPOFh1YmlWRDByQlQ5ZHN6Z2lL?=
 =?utf-8?B?aFFGT2ljK3NWSWs5dVlrNkttSm4xZHJpMFlFZUlXRjJ2NWJ4ZE1FV29ST2ZV?=
 =?utf-8?B?d245NFpYQUFHcXgrcmNwSnVoRnpsRStUeFFhTDE4b0hLMWdiclBPcnRNcTNF?=
 =?utf-8?B?TmszeVlsdDFvK0lwRlpHckM2VkN6T2hBeXFCeWY1a2ZYQ0x5aGhNRGthSXhI?=
 =?utf-8?B?bk1jd2dad0M3Zng5SFZRVHJOSVByaVFnWGhWb1YvUEZENTZ3OHBjSzNmZ2V4?=
 =?utf-8?B?Z1BLT1Bmb2RUaFhORmh3bERiR3c3WXBMOWlpeGE2cVFZbE5MOWNpWlN3dEI0?=
 =?utf-8?B?SFpBRE1MVlBZZUtXd0s3dVQ0cDNLY3ZWN2UxcEU0MVY5LzNab08ydFI0RVp3?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ca4041-1ea4-4ec3-b9c7-08ddf0e95af5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 04:12:00.2588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: br4TEDRYs8Knq0pYLHYix408jXLpQ2dgcvqrW9ehQ34B/mta1V54fK5rMlMIQaUEtyrOW44vcmbT5Ec0YBz6mH4q0ptYIOHzWdnoX0J55fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8915
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

On Thu, Sep 11, 2025 at 02:32:33AM +0800, Zongyao Bai wrote:
>xe_device_sysfs_fini(): switch the order of late_bind_remove_files
>and sysfs_remove_files to follow the rule that files create latest
>deleted first.(LIFO)
>
>xe_device_sysfs_init(): on partial failure, any sysfs files created
>before the failure will be cleaned up via xe_device_sysfs_fini,
>ensuring no leaked sysfs entries
>Add function description comments for xe_device_sysfs_init().
>
>v2:
>- Refine code using "goto cleanup" to reduced code duplication and
>  improve clarity and scalability. (Stuart)
>
>- Change remove order in late_bind_remove_files(). (Stuart)
>
>- In xe_device_sysfs_fini() and late_bind_remove_files(), cancle the
>  capable, platform and pcode/runtime check. And just remove in reverse
>  order of creation(LIFO). sysfs_remove_file is safe even the attribute
>  doesn't exist, so it avoids extra overhead or error paths during cleanup.
>
>Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
>Fixes: cdc36b66cd41 (drm/xe: Expose fan control and voltage regulator version)
>Cc: Stuart Summers <stuart.summers@intel.com>
>Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_sysfs.c | 61 +++++++++++++++-------------
> 1 file changed, 33 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>index 6ee422594b56..44ee008ea3ce 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>@@ -184,25 +184,13 @@ static int late_bind_create_files(struct device *dev)
>
> static void late_bind_remove_files(struct device *dev)
> {
>-	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>-	struct xe_tile *root = xe_device_get_root_tile(xe);
>-	u32 cap = 0;
>-	int ret;
>-
>-	xe_pm_runtime_get(xe);
>-
>-	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>-			    &cap, NULL);

ugh, thanks. This pcode read shouldn't be in the remove_files path
indeed.

>-	if (ret)
>-		goto out;
>-
>-	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
>-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>-
>-	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>-out:
>-	xe_pm_runtime_put(xe);
>+	/* Remove in reverse order of creation (LIFO).
>+	* Avoid querying pcode/runtime pm here — sysfs_remove_file is safe
>+	* when the attribute doesn't exist, and this avoids extra overhead
>+	* or error paths during cleanup.

no need for comment here, and in case you need comment, please follow
the style of other comments in xe:

/*
  * ....
  */

  
>+	*/
>+	sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>+	sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
> }
>
> /**
>@@ -287,16 +275,28 @@ static const struct attribute *auto_link_downgrade_attrs[] = {
> static void xe_device_sysfs_fini(void *arg)
> {
> 	struct xe_device *xe = arg;
>+	struct device *dev = xe->drm.dev;
>
>-	if (xe->d3cold.capable)
>-		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>-
>-	if (xe->info.platform == XE_BATTLEMAGE) {
>-		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
>-		late_bind_remove_files(xe->drm.dev);
>-	}
>+	/* Remove in reverse order of creation (LIFO).
>+	 * Avoid attrs check here — sysfs_remove_file is safe
>+	 */
>+	late_bind_remove_files(dev);
>+	sysfs_remove_files(&dev->kobj, auto_link_downgrade_attrs);
>+	sysfs_remove_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> }
>
>+/**
>+ * xe_device_sysfs_init - Initialize sysfs attributes for the Xe device
>+ * @xe: Pointer to the Xe device structure
>+ *
>+ * Creates and registers sysfs attributes for device-specific controls and status,

up to here is good

>+ * including VRAM D3cold threshold and PCIe link downgrade capabilities, depending
>+ * on device capabilities and platform type.

don't mention this. We don't want to keep adding each of them to this
doc

>+ *
>+ * On partial failure, any sysfs files created before the failure will be cleaned up
>+ * via xe_device_sysfs_fini.

no need for this too.

>+ */
>+
> int xe_device_sysfs_init(struct xe_device *xe)
> {
> 	struct device *dev = xe->drm.dev;
>@@ -311,12 +311,17 @@ int xe_device_sysfs_init(struct xe_device *xe)
> 	if (xe->info.platform == XE_BATTLEMAGE) {
> 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
> 		if (ret)
>-			return ret;
>+			goto cleanup;
>
> 		ret = late_bind_create_files(dev);
> 		if (ret)
>-			return ret;
>+			goto cleanup;

please split this patch like below:

1) the one using `goto cleanup`. This fixes one bug
2) remove the hw read and call the sysfs removal unconditionally
3) Add the documentation

thanks
Lucas De Marchi

> 	}
>
> 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>+
>+cleanup:
>+	xe_device_sysfs_fini(xe);
>+	return ret;
>+
> }
>-- 
>2.34.1
>
