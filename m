Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373FFD41C21
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 11:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA0C10E718;
	Thu, 11 Dec 2025 11:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYHgrTMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAF510E260
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765452338; x=1796988338;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NuX7nVOTxLk19GxEJvhk7KY1DbiaqzfdGr8A2w/gSgI=;
 b=kYHgrTMlCmiU/gT5Oojm7JCo8dyQ8y1oqFCBTHKZlHTh4Kz2gh06xjcP
 HKDhM75rf5SLv8bPFviHwOvB7fkEef4FgzvCVX7N0kmBmlaug/lzjCqO6
 SaZsKyYaboZ0MS8gP8tJJlL3C+H4ycc1bKA6CvhyB0IxgiIoOZkOs2B9J
 n/0K1QRGwK7atLuL7QAYKpqowu6mNx7yJi+QCX2S+TCRRxSN+z3oI0VVo
 tPUP/ERaAXK/v1phM+b2nzlbt/qes2C8IGD9dLhT/Oi05yPeFAlu3/wbA
 GL0p/+jICGSiW2VQjN/bjMaqAdndVMIxqWnfnIsNud0sqK8ojvKwSCPlj A==;
X-CSE-ConnectionGUID: MJWSssA6QeC+hAwc9O2aGQ==
X-CSE-MsgGUID: 9QWlIPMtTAKtpYLfOiSLCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71277673"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71277673"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 03:25:38 -0800
X-CSE-ConnectionGUID: lE8fKH/ZRcqzMojUzyI+aw==
X-CSE-MsgGUID: xmFWjkjjT+q9LCgNRfarvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="220142247"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 03:25:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 03:25:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 03:25:37 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 03:25:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvtyohpxSPqSb/fc2qQdy/k3BXGZ/K47Zqi74b4GqmhLGCdBcoAgXdCCQeCjnSuDrYhQcvVP4lSwd3AWAYkxuD9ut1jvuEl1BxVzBmdpCgMzZa0J7XKHxEGn7igov2vyPmyHANuJUFodn6h+xTgWlkvLV6LbWUND5URvj9548FoYGGqdCRjs72OArERKtp6Zuji1vS/Ju8NllBD5HytishIRLHS2B1RXwIwn/8ixlpxqfSwxRh6gVBkcKy+Kt/0tbxAhftbRuQ3ppyQRBvVOxU8MB9/fJ8IsOghqE2NnKk2ldEJuZWnTazh5cklY5Bqp5fAc+Kf9OZprm2neZGZY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2noL+dpLVjomyCNY42YNcnY8AuC4ssJh9ZSWd1qwpII=;
 b=Bfq53kOkx670VAOSyZcEdjJdqNaOqsucS2k05DpyC0+cMA6yry526eRTB1gkDesjKmmLzmtIqXWVtd6V0wxHdoQJOVivxEyWRkLKBD4J9KqPCPPWUAeDzY0TSK3rXEhOorwa4SbO+hERMorRkqQ8GrtlCuHmmYHOg6GoNgGTK9b1FEP80PcJoQpgMADQBJ+SqH6A2Ya24bL78c9Vp3MDOtLYAL7C6+wJgkuAOSzUlxN60cPj5vF3TSkTtshhBj/4nyCFjhyYjxVsoctaY5zfaKarZeS/yLHgNFdq/kFSlygmyMCu82ygoCZL86MpR/uAj+IqUGf1eDMXUAbuPfVS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS4PPFC222DF22F.namprd11.prod.outlook.com (2603:10b6:f:fc02::4a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 11:25:30 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:25:30 +0000
Message-ID: <1adf8319-5005-4713-b145-7bf87c43ee8a@intel.com>
Date: Thu, 11 Dec 2025 16:55:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/xe/hwmon: Read temperature limits using pcode
 mailbox
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20251210062301.4080549-1-karthik.poosa@intel.com>
 <20251210062301.4080549-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251210062301.4080549-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS4PPFC222DF22F:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e63645f-57d3-4594-58f5-08de38a7fdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzZKMnZCbmQ0d20wc1Uzd1cyOUlveCtrTVVjVWRTVXFjcEhmcTcvZmsySG1z?=
 =?utf-8?B?TTdkTmhQeVUrRmxrT1Q0bllTNXFTL1ZISzVZT3ZNVTI1cEVubzVVdWUvbUdv?=
 =?utf-8?B?SWRxeEJKWEdPNlRodEw3ZGZoYmp4Q3JqTjViVG5sMWVSRGZBUUpjcTdEcVlv?=
 =?utf-8?B?QVQxTUROeTY1S2lrNjRkUksvZVh3bmFwNkpMaUxDR09KL200bGliVjZKdi9D?=
 =?utf-8?B?YWJtRXlZY0plWmlhTk1Md2RWeThuOXNVcXY3MVhkRHIyT1ZwU0dGVG9ldmFr?=
 =?utf-8?B?cVpaR0tmMWhPMmt6b3VPM1krdmFYNnBBT2Fwc3VVNktZQVlmYksrMk1meGNp?=
 =?utf-8?B?V0JHM29wZlg0V1R3V0NFSHBhVjUxdTAyeHIxZEtqMFRmMHVzN0U5NzFLSG9E?=
 =?utf-8?B?UHVWU0NKTkhzZkEzdlVHY0tFNm5jS2RoaWpzVHlVbTlLRWE2anFzSzBEQmta?=
 =?utf-8?B?bjNZOE42S2JlNHJzVWgzMDNLWklQb2luQWE4bkxIRXozZ0xBN3crQjZNSTBP?=
 =?utf-8?B?ZlhZUkV6Skh3bm14U3BRSXpuVW1xYlY5VU52L1lPMkhETEtmV3FWc1JnNTRB?=
 =?utf-8?B?dmx0T2RXcFBzN1dLMlhYdVJHS0ZENU91OGxGdGVxRzNLZ2ZVdmlsandQeFps?=
 =?utf-8?B?MVRJUm9hYk1DS3FNZXFkd3kwNXZsTEc0Vlg2MFhaeHdOWXM2dzNsUW9Ta2Fz?=
 =?utf-8?B?eEhSeWxGQ05EZUFNOFh3QWJRNExoQlVOOUZTdVFXWXhwSWFqNjVaOHRHa2Fr?=
 =?utf-8?B?WTNGL1RNZlBXbit5eGIrY0R4VXJja1NTMzF2M2JXQ3pTU1pEdE96YmR5QTBk?=
 =?utf-8?B?dEtNOFBDM3c4TUtUTm54N2JyejJ3VUlPTDRNV2lrcFgxUjZTMEdLbXVSVlNN?=
 =?utf-8?B?SnlXMHI2UGZPSUJkVEc5OHBqaUFUTjk1RXVid3l0VG5VOWNXdlB0OGRwSzJE?=
 =?utf-8?B?R3dzR0FZaGtGZnVMbmU2alpSNTVhM0I1bFp0KzNWMGtlUVNSUldpWUxVMXF0?=
 =?utf-8?B?ZG1KOEt4SmV2a0NTTGsxeGdtOHQwVG5vdmNxVUlqb2puK1N3RVBrRURuVHdT?=
 =?utf-8?B?T2U5QTFmbnVjOU1mNE5jNXVmajhOalBZYitzQTEyTFdGR0JXaFZoRXRBS3Bm?=
 =?utf-8?B?dHdDU1gvZDhCUGt5eFgzZlVYekoxR3d1M2hkM29uK0RzL2hwenArWEQwSjRU?=
 =?utf-8?B?a2psb051VHFDOWNJbkZESU0xMUhzUmVLS2hraVpRUVZiR2xhQ2R6MEpidmhT?=
 =?utf-8?B?ZnNLLzUwWjBKNzFuYTc4M3RkNUNrZmJvR1JONWNUdGVBREsxcGRvd1BhQlpt?=
 =?utf-8?B?WlVjS1RQaHVrU09qK29sN3I3SUdSaHBTc0pxbExoRXRnMktLZ0NmY0p3V0xQ?=
 =?utf-8?B?bVJJdk1BY1g5alViMUJFb0hNOFdVaW1sa21TdG1Wdk9Md1JpekVmZkcwYTd5?=
 =?utf-8?B?MDNMMW9RMGNXRnBGSWR4Y2E1VDBEYzIzV09sQmpxOTBLY2ZpdTJOTGg1em1J?=
 =?utf-8?B?N2hKMi9GcHpZbW9WQkYzeExoN3VqYnRZK29nZCszako3a3lGOE16Vkcrb3RC?=
 =?utf-8?B?cGxjK2Q3VCtZTGF4QjhQWGZkU2NlVVd5K2ZnUzhBTVJ3b2MrWkJlMWx4WWdI?=
 =?utf-8?B?MmlVSUZzcTFwVFF5NldTb2dtY1liSU5FVjBBOG5mWmtwVkIrK3ZvckQ3QlFi?=
 =?utf-8?B?VFA1UTcyK0s2ZkZ1RWNWM1pKM1QrL1dybWpkRkl3WXlvUkRNSHJRRmgzRXNV?=
 =?utf-8?B?c1ZXbXR3MlBObmRmTlpLZWhpTk5Qa0YydWZhM21RWmI4QWRnRDdHY0c0NC85?=
 =?utf-8?B?eDEzOGwyRmVwTndvUnVSQWhES1B4b1lML0ZuOEt5cDhUT1dMZk5EWGk1c0FP?=
 =?utf-8?B?UGRRdHFiZFI3bFdZWE9wWjdzVDcrb2R1aG5hb3dNZGVjcTI4NDlIcTJUSlZV?=
 =?utf-8?Q?nx6fdXOihXAq+8dzz1tHtKdCQZswqGLl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1p3UXB5MjZFWHdXdk1uV2IxSjIxaFMzc3YrM2VTMjZBdnZPRXd4TzM4OTBL?=
 =?utf-8?B?YXBuZ3dSbmxQYkw0bXA5Z3ZWS3czV2hqWkhTYnVaellkYVdrUStWcEt4eERu?=
 =?utf-8?B?MVRIVy9SQTRZSnRTUjdBMWhFMUMzN2xYU2lRdlB3MS9IaldwWmdCalZLaUgv?=
 =?utf-8?B?SkthTUdxcVhWYWRDMldmNE40UmRwT25lL0pVYjZWZmJVczRqSDMraW81WXQx?=
 =?utf-8?B?U1FhcTNMQzFsT3Y4SElHTUZoZld6bkJKQ2JXL0RxUW93QXkrWm1YQk1NbG9Z?=
 =?utf-8?B?a3hhVW5sNkpXMkRrd1hBN3Bab2EyT3h0eXBiT2hsdkUrZzQ1NWs1cVJnZWxo?=
 =?utf-8?B?cjRWbWxpaTFSS2NSWk5NS2xTS1dRT1gwcCszelNQNWxjRmdJbHVxVzhJVm1q?=
 =?utf-8?B?aTEyOGRUdWNKMW0zWTF4SUJCdzZ6cThtWjBjcTRtQXUvUnJDblluOVRRRmR0?=
 =?utf-8?B?K1ZrYXQ5b1JBdURFNTN3bUNJSks1Y0sybmFvWFZJRS9WSVZPeUtFMGIya3k5?=
 =?utf-8?B?RWdlQVExSWdBd3JwNWU5Z0ZLc3doblJ3R3lwUHBxN0JiL3h4b3Z4ZVpZY25s?=
 =?utf-8?B?b2JDRTMrOGIxTG9FblM5b3I3bTk3NDVLclZzR0dyRTA2YmJMbDJzYTRNYzgv?=
 =?utf-8?B?eTNoY3Ara0VLcy94WStnWmkzOWZxcjYzOUI3WFJlZmlEYVpSdSt6SkpHbDlU?=
 =?utf-8?B?Rk1CMVdGeXkwMTAxa2NYODJGbys0YVNHS2g2ZTFnMklKQnVORzlmMyt0dnRv?=
 =?utf-8?B?UlBlUFUvOER2NGgyT0dOYWl4ZUxaWWw5ZU9sT05mekY0L3pCTjVDVkd4Sjhj?=
 =?utf-8?B?akxWKzBRVW1LNEptRmIxSTFMYjRLN1kvNmpqV2M0SzZoems3RVZ5Q2d0V2RT?=
 =?utf-8?B?V3JoaHdNYjlLeEZLWVFDQnVBU1lPNm1UaGlMU0Z0MmdDN3VmZGdhbW5QM0pV?=
 =?utf-8?B?U1JhM1dtTjltdHZtN1JEL0sxdzdPVVo1WkMzZmw0QVh4MWNIajZsbWxLUWVz?=
 =?utf-8?B?cy9DTEJmUGJvZTJvcUtnaXJ1a3lNc1hkRXZ1UDhPd3RIa3FLdkM3MDdFYVFu?=
 =?utf-8?B?YWpRRFpUTXkrbHJHeWR0ZmJKVUlEN1RGQ3ZFcVdIcXhiUndUTFZVNlZEcDc1?=
 =?utf-8?B?U3VCYTB2RUI1MnBzSXdReVJCbHFRbTBvTE9MTXBPR01SNWZPem9jRFNrekE3?=
 =?utf-8?B?UTM4cGZ1dXpGT1dUSmYzODdTSEpWZkJ1TTduNlpQa2wySnZHcG1CU3Q2WlFo?=
 =?utf-8?B?aXdhakV5d1E2Rzdka2F4Rm1JTmtESm9aK2dxajVQclM0UllYTHZLNElRS05a?=
 =?utf-8?B?ZjhjOVFtYk5jK2o0M1NQZFh5L2swSHFrMEEzbG1yeGJGaHFpQ0JYT0NqMTlQ?=
 =?utf-8?B?aFVXQ0wwRHVZY1hMaWg4Y09RQm5uK1JiYU9taVRDZFpVKytwQVoxR3Z3cU1k?=
 =?utf-8?B?UmZzQThXb3gza3ZZRUI2MXo1QUVnN2VkcTBJeWJycUxQZnJCOGRjV3p1Vmlj?=
 =?utf-8?B?SkJBODNNb2MyOFRhNFlWR05aeW9ld3Z6YlFoTEdGR0lnRWlQUWVxSUxZNk9P?=
 =?utf-8?B?NnRMTnJ4dHZMWjZUNzRENmxKKzJJYi83Z1BML0w2TndrRzR3THdtL2x1RTdY?=
 =?utf-8?B?UmNQSmZaWWc3V3lRbk8rOThzcGg0cHRocUlZcGJaaitxb3JtVGgyeVlnYW1X?=
 =?utf-8?B?TkplRzhHK0h4RHNJQmt0Wjcwb2puUHNyZlhwY1FBdVg3N2JWZW82QUhpdmFD?=
 =?utf-8?B?dU43S3JIVFk3dWttSnhLdnRUeXpHOTZJU2gzazJ4aitBL3VFV1E4d1ZMTElu?=
 =?utf-8?B?U3dKcDlic01YdlNRNHpTSW5SVzZvRStnb0hiU2RaRFFsUGRoWjIzVEZXQVFT?=
 =?utf-8?B?a3hNR0wxSmc5NHVJY0dnaWhCTThJVlY2Z2V0WUNWSXluZG83OU01MDVXWDdn?=
 =?utf-8?B?WXJQSkdGQzNUQkUxdVdYSmNpaXErUzBvUSs2V1JPT0JVUFF5NjFSdFdneDlT?=
 =?utf-8?B?aFZaVmk5bDRKaDBmb2tSSFJLa21RQWw5WDZvNytLTjJ0REpyNDdqcmQzYnNN?=
 =?utf-8?B?RW8vR3NDcnZWWEhxZVZRYUM3Wm95MGRWdzJTMWJMK3ltNnBiTHZUbFladWxu?=
 =?utf-8?B?YnpMMDEwd0FUNmlaWS9aU2Z2R0pnNmxLUHZZV3lsQ1RORFZUa1JnZ1JWT2RT?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e63645f-57d3-4594-58f5-08de38a7fdaa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:25:30.2900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZMD7buw1AWC6nW2rcy7mXydTEnsYJ80xk4QpqD+kW1QQEfkVru3uUUY4KseZaNH+A8ip9vn558cFpPLQfyb3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC222DF22F
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


On 10-12-2025 11:52, Karthik Poosa wrote:
> Add support to read temperature limits using pcode
> thermal mailbox commands.
>
> v2:
>   - Fix documentation warnings.
>   - Remove enum to xe_temp_limit as it is not used.
>   - Add has_mbx_thermal_info.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_hwmon.c        | 36 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pci.c          |  5 ++++
>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>   drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++++
>   5 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 842b33444944..be644a032f48 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -312,6 +312,9 @@ struct xe_device {
>   		 * pcode mailbox commands.
>   		 */
>   		u8 has_mbx_power_limits:1;
> +		/** @info.has_mbx_thermal_info: Device has support for mailbox thermal info.
> +		 */
> +		u8 has_mbx_thermal_info:1;
>   		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>   		u8 has_mem_copy_instr:1;
>   		/** @info.has_mert: Device has standalone MERT */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index ff2aea52ef75..16f0cc2a0ae4 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -111,6 +111,18 @@ struct xe_hwmon_fan_info {
>   	u64 time_prev;
>   };
>   
> +/**
> + * struct xe_hwmon_thermal_info - to store temperature data
> + */
> +struct xe_hwmon_thermal_info {
> +	union {
> +		/** @limits: temperatures limits */
> +		u8 limit[8];
> +		/** @data: limits data dwords */
> +		u32 data[2];
> +	};
> +};
> +
>   /**
>    * struct xe_hwmon - xe hwmon data structure
>    */
> @@ -137,7 +149,8 @@ struct xe_hwmon {
>   	u32 pl1_on_boot[CHANNEL_MAX];
>   	/** @pl2_on_boot: power limit PL2 on boot */
>   	u32 pl2_on_boot[CHANNEL_MAX];
> -
> +	/** @temp: Temperature info */
> +	struct xe_hwmon_thermal_info temp;
>   };
>   
>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> @@ -689,6 +702,25 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	NULL
>   };
>   
> +static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret = 0;
> +
> +	if (!hwmon->xe->info.has_mbx_power_limits)
> +		return -ENXIO;
> +
> +	/* Read thermal info */
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
> +			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> +	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
> +		hwmon->temp.data[0], hwmon->temp.data[1]);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
The if() check is unnecessary; you can simply use return ret; instead.
> +}
> +
>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>   {
> @@ -1263,6 +1295,8 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   	for (channel = 0; channel < FAN_MAX; channel++)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>   			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +
> +	xe_hwmon_pcode_read_thermal_info(hwmon);
Function returns int but here return is not being processed, either make 
function void or process return.
>   }
>   
>   int xe_hwmon_register(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8dd0ea9d1d56..7b3396f8d488 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -310,6 +310,7 @@ static const struct xe_device_desc dg2_desc = {
>   	.has_display = true,
>   	.has_fan_control = true,
>   	.has_mbx_power_limits = false,
> +	.has_mbx_thermal_info = false,
>   };
>   
>   static const __maybe_unused struct xe_device_desc pvc_desc = {
> @@ -327,6 +328,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>   	.vm_max_level = 4,
>   	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>   	.has_mbx_power_limits = false,
> +	.has_mbx_thermal_info = false,
>   };
>   
>   static const struct xe_device_desc mtl_desc = {
> @@ -364,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_fan_control = true,
>   	.has_flat_ccs = 1,
>   	.has_mbx_power_limits = true,
> +	.has_mbx_thermal_info = true,
>   	.has_gsc_nvm = 1,
>   	.has_heci_cscfi = 1,
>   	.has_late_bind = true,
> @@ -412,6 +415,7 @@ static const struct xe_device_desc cri_desc = {
>   	.has_display = false,
>   	.has_flat_ccs = false,
>   	.has_mbx_power_limits = true,
> +	.has_mbx_thermal_info = true,
>   	.has_mert = true,
>   	.has_sriov = true,
>   	.max_gt_per_tile = 2,
> @@ -674,6 +678,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	/* runtime fusing may force flat_ccs to disabled later */
>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
>   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> +	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>   	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index f19f35359696..d70da993c1e3 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -47,6 +47,7 @@ struct xe_device_desc {
>   	u8 has_late_bind:1;
>   	u8 has_llc:1;
>   	u8 has_mbx_power_limits:1;
> +	u8 has_mbx_thermal_info:1;
>   	u8 has_mem_copy_instr:1;
>   	u8 has_mert:1;
>   	u8 has_pxp:1;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 70dcd6625680..16201da0cf6b 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -65,6 +65,11 @@
>   #define       FAN_TABLE				1
>   #define       VR_CONFIG				2
>   
> +#define	PCODE_THERMAL_INFO			0x25
> +#define	READ_THERMAL_LIMITS			0x0

The following defines are currently unused; please add them in the patch 
where they are actually utilized.

Thanks,
Badal

> +#define	READ_THERMAL_CONFIG			0x1
> +#define	READ_THERMAL_DATA			0x2
> +
>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>   /* Frequency Config Sub Commands (param1) */
>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
