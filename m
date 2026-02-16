Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB856E81A2F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 15:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910DD10E163;
	Mon, 16 Feb 2026 15:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgLw+ag7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F094810E163
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771254672; x=1802790672;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TrXz+vLlbvfy8cyp/PUfa/jM0Q4nU/+RKNese/ciibo=;
 b=NgLw+ag784d4bDRfy5pdX4stMBpsddTO8XSTKzpHGUO6t7hZxviu05wM
 8wFk+K3yvNDc+EFBzzo13OU01oHirGQ3zoqXthxYfeD+/Nq2jkMDfVHAG
 3Vc97dlvoZDwhvIvnhMY6zxZsnY2AtBhip0ua0ZkM4cgW0dPFWIR5Ime+
 lyo36uIHtTajfJzqQWkqGuffbU+d5P6l/TSOvbn90R2byh5eiQ3P1Jfd9
 6oGzuouZql+pkEfTRajhrjB4PfBYjKiKxqg3dHKBU3tmx7yJQDqo2DZs4
 vf7yhiUn8jAGgqcap2PbCRSiIrtbemAWs/DQLf2QTRVu51ogjq1ro0y18 g==;
X-CSE-ConnectionGUID: 3WACMTnHTW+G+gAVU7lrhg==
X-CSE-MsgGUID: 1Y6nGCpkRnGwtaRn9o2eGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83059134"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83059134"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 07:11:11 -0800
X-CSE-ConnectionGUID: LGk66d8IQdOd5kUiGDTG6w==
X-CSE-MsgGUID: qrF8t3v8SA2R0ma2htazeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212183505"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 07:11:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 07:11:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 07:11:11 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 07:11:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svz5gRcD3HYiCavvMEJcTmaWHVgndpfU5RuOSj9X6ODzOjs2KWSXvXi5dSk8/NHov+oGiEqtmy4WDYxRXZkSaJUhT9g1n6QmmF/REjfIcNqFJSsu1BFYNq9UbR48XMMmTj1xiqL0I5n2WhZOFrDjDCy1rx52Fe9PViQMh+uX7ELsy3ZjNiM7y8slgKms6FIt1VqFbgSZ7uPPSPw4TW1dEz/vxcUjTKBenLVUAjrscVxZoxsffL3Yd0tziZedXFV4/P4FChr3rIk+gB7gBgYqAbNfYP46MtTC1+lED36TzRa4MDN8bW8thQdv5N/lEuGRCND37ngoFMsYt6MTz7WqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ia/1MI5kj0sNI7pQf3DLmLlXrKRqY5JIFlpmgu5FHR4=;
 b=B+KzKjA8+chEi4tfuoFn0SlhcRnV+WqFFjJ/6uBcyB9vzJbNLXxszft8awTeDym1Imje2e4h2+3wizbEXnuUm6LZdG+CqC1D/o8cdeEPoukPd5vbx0N2JUWPJMqEat63SStKMkOgVVBPJV3g/gdMzXTs6XGXc6wYrQMQl2nM9IoO4kwaGFEMtSLiT9sxfouJh0SzbKSbtcfNmrUCLor9pkvtXI4tbwRkywfKHakmCqxurKbFb9Egk+7WKJRiQdeOtWHT+lB3SLEz5VnFSc6OHgyE1Zt7hYPRRj77PDECjQdESXvYpKDCnIaO/w+w082/qSnPKmC281iLpCGBd4740w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:11:09 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 15:11:08 +0000
Date: Mon, 16 Feb 2026 16:11:05 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/9] drm/xe/pf: Add functions for VRAM provisioning
Message-ID: <20260216151105.y7kdzvbvtu3w4szy@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-3-michal.wajdeczko@intel.com>
 <20260216150220.zhlria7kynqsjwlu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216150220.zhlria7kynqsjwlu@intel.com>
X-ClientProxiedBy: VI1PR07CA0229.eurprd07.prod.outlook.com
 (2603:10a6:802:58::32) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a10bc5-f03d-46cc-8769-08de6d6d9ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnR6Wk9odUFYK1paNy9HUGR1SDY5U0hDVHJkczBKcmtEdVpLNitmWERJSU5Y?=
 =?utf-8?B?S3M4NUZUVVZRK3oyYURYRzhZNzdvWk8wY3VLMGVLZnd0Rm11SVlDZjBKNzc4?=
 =?utf-8?B?c01uMVBNSnMrMzg5MkRSdVcyOUllZUVEZ3FHc3hLQ0hibm5yMTVwbjE3aXFt?=
 =?utf-8?B?ZzFkR1NvTFZ2T1dxcHh3eXIzVG9SSGZyVzRDd0RmSDA3VDJFWmlTbUtxZlJR?=
 =?utf-8?B?aDdnWUxXcCtjWW81VmRxbHQ1YnE3dzMyenl2bHpkMzh2eU9jQ0pCZGw5TEVT?=
 =?utf-8?B?OHNkbmtvVDBESVRiS2Vobk96d2x1czJQeVB5TXRIQisvS3piSDFSR1AwVUl1?=
 =?utf-8?B?YVZpVnNHQ0hYTzc0dHJoMVdQN3g0S3QxTm13Y211c2NLY1pnRkpkc0hER1l1?=
 =?utf-8?B?WEZoMVlROTYya3RkclR6V1k5aW5EMVU3MUxhYlN2WHNibU5KMTR1Q1FVbk00?=
 =?utf-8?B?Y1krbmI2c1JBR1lkcjNkK0UzS0ZzM1JTMlhKQy9WNThYMm8wa2ZzeHhVWHN6?=
 =?utf-8?B?cDg4d3FOZHp2Zk5ZUUtGVklCNUZJdnVwRWZaOEtneVp1cCs2TnZGRXRLek1I?=
 =?utf-8?B?Z09iaWNjOVlRb3NhTHQzdVBSN2xKcllZZS9iRGNwbFI5MUhkanRLZ1NCeGgz?=
 =?utf-8?B?L2JzeXR6cWNrUGV1QmtMRlJRWWJaWmFZWnBUVFhnYmtraEJSY3NOcjdKQXFI?=
 =?utf-8?B?L0M0SWNvWm1wd3lwSTNLMnI5cVhHbFE2TS9wZ0FKakIyMmxWMWk4V3ZIRWh4?=
 =?utf-8?B?N3N6cEFscDhHUVhnazU5Mm9GSzZsYm5VK1FWNTJ4ajBhbWh6eTR5SDR1R2Nr?=
 =?utf-8?B?ZE5SSEJOelNsVGJCWDRGVmw1UmVlQ3NxbkhBc29vTWduWmR0OXpveHFoYWQy?=
 =?utf-8?B?dEdmb1kxQlZESEJkakVISEc5VXJEWXZOZmV6UzNESkNjZnd4dE9TbGJvZFV2?=
 =?utf-8?B?QVZxUjBQQTFIZXNYc1MzTjN2Smt2clhFUWVvQkNqU3g1ZFJPaDF1L1ovUlZC?=
 =?utf-8?B?UTU3bjVWaWdzQWRab3BkaU5FUDI5YzBYMkw5WVRxbDZEdkRhWUtUaU8yYVlW?=
 =?utf-8?B?SG84TWJsQlFjUHNaUkJrQ3JzVm5teVZ2Vm1nZzlKY1drMEMzMm81RU5CTEJP?=
 =?utf-8?B?Q1N4MXNYQjdXY08yeThJWUdGQXFLQ1R6WHF2SmFkS3RJZWEzcWo2blJzUGZS?=
 =?utf-8?B?Tjg5TXlHL2tYZUo2aEVXdTY3NDlxdS96MGlZQU1DaUkwMW9KbEoyQkpnU3R2?=
 =?utf-8?B?ZmhkQVh4TFhqbk1NVkF4ZWdZOVVEZE9GQlF6TnlHM0tYRDNybmFQZ3UzQnZS?=
 =?utf-8?B?WEtIL0FNVUpBdy9oNVVzVWpQMDJteUIwTm9kUXhvWjZ0QXlJUEgvUTFxeVRv?=
 =?utf-8?B?Q2ZjMk91NENudE5ld1ZzWUVsbUlaU0pXcUJiR0cxUGgzVGttbHNySW4xcUU3?=
 =?utf-8?B?UWFXdnVSSjhBY0UySjBpZCtETDFNanJQYUJxKzZxN1Q2VC9UVTFEc0ZSR3dP?=
 =?utf-8?B?bnVFYVJOSXZlN1pta2lJLy9nVEpFTFA1OUMzMVlZdW9mUGc1VEJLaUtzU1Nt?=
 =?utf-8?B?R3BhYlYyZ1dwWmdGckJnWnJLV2dYbVdqOVpwcmxwMHdHNFB6UmhaTUI1ZmF4?=
 =?utf-8?B?YVAwQ3JNMCs3MUtUcW9RcnFJZ0lTb25iSmJpZlBjQi84cmhIUWM1VkVjYnlh?=
 =?utf-8?B?YzN1WXQ1c0dHbnYvdTZvek93elF3ZnU1K3JjMVRNWnpWbWlvak01VDVNUFIw?=
 =?utf-8?B?bGtWOGZXUjByUzBwYVZScXEwVXVnT1dUVW5MNERhQXRaMzg1MWJsdlU3ZTNL?=
 =?utf-8?B?TERtWjRYaG4rTjEzVW82bXNvVmJOaUdyNVl4Mk1xK3NlS1RWZC9rWGNmNGFF?=
 =?utf-8?B?ZEtGb0c0SFlIVUVvMkcrUVVUWkcyOFhDai9WOFoxMlFZY0g3MW5HeDVKYUpq?=
 =?utf-8?B?WXhocGVnemg4MUtyTTlUbCtIRDNpRHJwU0Z5Q0svb0h2Rlp0bTFIajA0THNy?=
 =?utf-8?B?R1c3R1pHR0J4YWltTEIySXhVTTJ0dHJ3T0lIVjdaNTRBSlFRdWRaTUd2REhw?=
 =?utf-8?B?MVA0Z1JQK29xUUN1T2hrMDJZck8xT01yOXN4SnNHSEVrNUNFWmxYc0d4TVVr?=
 =?utf-8?Q?aZUA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3BnS2t5TmtXV2JaN3FiMUJGUjVwcDBJZjc0Q20rMVVwZkVPZkhaN2p2MzhS?=
 =?utf-8?B?Nng3NkpBS0V1MU9aRys3RWtWZTlycjVaK1Z1bUNkbXROVkEvVEVlNGFCc2Vl?=
 =?utf-8?B?R3NLVXhKVlA4R09oWVNwRkV0THIrN0Z1b200Vi93bDJ5VUtwUVZqZm1BQ01P?=
 =?utf-8?B?U3pWSXJZdUVUeksxd0xxUDFuWEtnQk9CVXg1dmd3MHJJZnFRWitEb0trTUts?=
 =?utf-8?B?d0hxZnVvUjk3RWQ3aFNZUndrY2VtdTBveEFEQUdMdk15N3RjNzFiK25WZGVj?=
 =?utf-8?B?YzFQSVR3WXR6SktwbGlvNFM2SmNzZngvekdEN2ZyeGhPV3ZieHBZZFpObS9p?=
 =?utf-8?B?R3pOaEVOcUxrMUI5eFlnWllFU2RRbzN4blFsVmlQbDVBSjFBVGtqelNCRkNZ?=
 =?utf-8?B?TkpqZDhSc3Bjb2lQMkQ3cVRscTNuWHdRdHFENUd2azdjSmZRN0EzczVqZi9C?=
 =?utf-8?B?Y3hIZU0vM1UveCtXSkptR1lMUUVJWmVyL2lXSWZEMnJIcDIrUjdoVmRkeXN1?=
 =?utf-8?B?TG1NL0VQYzhXRWpqcURkU0Zqc0JoUU1iVTA1bDdQaTZSV1dDVmMvb2ZrN1lv?=
 =?utf-8?B?OHp6R3hVeHhpcngzb202akdySDVrY3lidkdESHJJSjdSczU1NEJTSEpmQTFJ?=
 =?utf-8?B?cFFBMEppbHJKbFRIdDMzNzNPV1JSdWs1TTYwRUdCMXFHbitvd1VoNkU0SzNu?=
 =?utf-8?B?WlRpdmVEdFJUTTZDdkRlUzNXOURMWGpjcU1pNERCQ0xsUEhIWXdZT212WWht?=
 =?utf-8?B?QzRkZnhNbWZFU1N2QXFadGxVUFFuWFZBY2VTU0JMUTVvVVBxKy9WbW1odWQz?=
 =?utf-8?B?RXgwOWtaRGZNR0x3WTQ0YTdEZnRqMC9zY0dtY3Q3MmhSLzg1bVI3TkQ4NjRk?=
 =?utf-8?B?UjBHS3BBSm1hc2pCd1ZkRC8zTkhMWDBCK0Q0aE12bC9FdHpWZ1J3ZmJZMndu?=
 =?utf-8?B?ZWZkeHZhMkF5OTFvYkRDQkJJYUJBL2w4WjZCKzExcVhhY2JoZUkxZ3VHdm9j?=
 =?utf-8?B?c2lETXR6a3pZVmhwcUEzSmVvQjZVQnhOZmNCVUVtaktBMVVRWC9IMjRBeXVn?=
 =?utf-8?B?aFZaWGVUN0c3akdtZnNXTWVOOHZpK1hjaEN0dGlhL3dRczVHVEx1bmhUNENt?=
 =?utf-8?B?aHFvcHRWS0IrYkpYbDVDRVZLQSsyTEJiVWxXUUF0ZzNueHZhZHljcVcxWDdL?=
 =?utf-8?B?L3dJdEdscmF4NDI0b0RpSSs5cFZEZUp0U1FQS01OR0ZOMjZLZE5mekJKbGFn?=
 =?utf-8?B?dC9GdC85a29VMk9pUVJ2VFB3RnVoUEh0cityZU55VC9jYWVoemIwWm95YjNI?=
 =?utf-8?B?T1BPMUJ5cHVNMUhwcm5xWWJjcTlNOUwyY1YvNVRheWd2VTBaUlRjdnVjcUh0?=
 =?utf-8?B?dEdMUGgxRWpoMk5MZFh3eEVSdkdsaWdDN3ZIWlhxTnFQVjdXL2dHanJXU1Rw?=
 =?utf-8?B?d1dFanYrUC9rTFpFZnduaG0xRTYxNkVzaVRHYWkxS3o2aXdSUFVuWUdXbmlU?=
 =?utf-8?B?Y3Juc1o1Wm42VFFmcldETVJLbUExaE1iVTZhOFh6bmRwOTZuNnFYYXRTNEFl?=
 =?utf-8?B?ZFBsWUp2dnY2T3BwK1hnQThNRG5HNHBXdW1uNlBWeUVINDdlUmowMFQwNG1C?=
 =?utf-8?B?UWRMV2p1NjZtdnVkYlA5SU9FYnNBUTA2ckhtWmtVNEZpVFZ2dzN4dFBCNFFq?=
 =?utf-8?B?RHRwL0wzcUExc3ExY2phc1VGSkpXbDl3eGluMDRMcUp0NGd4RWJzOUhON2pF?=
 =?utf-8?B?aVlFNGVqbFBsSnJtRFJ5SkFCVkdWUDRPbGZIdGc5TDBTbm1GNTVseXZ6TElE?=
 =?utf-8?B?dHZXLzJiaGdyV01WcVJJNC9OSFNPZlFGQXg1SEd5dnlkZ0pLd3A1RW8rUFY4?=
 =?utf-8?B?L2wvVnU2ZjBkcFYyWFJ3Z0lnNjlPd2V3d2dTVFFaV3g0bmFhZmkrek5FV3Bw?=
 =?utf-8?B?L3FIQi91dkg4Z3dEb1ZxYTVJQ3BoY1BvY3N6aHJGcFdobFpJTjNOV09Ndlh2?=
 =?utf-8?B?ZmlqYUp6NjNxVEo3QkNmY3NIK2NvVXF4YndFNWhINjhSbWRla0pLQmwxVzZD?=
 =?utf-8?B?bVBrY3I4L2NhYitWKy83cXVWcEZDaldsUStBaFNCenpBeS9OWnkyNnozWXl1?=
 =?utf-8?B?anBxald1NTNEL1JuMnkvSXVRc0lJR0RGaUxqREpnejU1akgySlFKalhwcFJu?=
 =?utf-8?B?RklWTnhEWGxhc2VPR0hYcEIyemRmRUxlZ0JDRERiUzRHREFkSi8yUXhtaDZp?=
 =?utf-8?B?cW1ZRy9PUjhiOVVuZXRMaE03VEtZQVozdW0wMnowR1JCdWJEQ0d3VHlFUjkr?=
 =?utf-8?B?K0NnODF5K3dvejRCZzFWcmpPWmhXUWc4d3pnL1BSRFNibktqeVc0TFY0VWtF?=
 =?utf-8?Q?yfG8Ns2x5RCQYYGw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a10bc5-f03d-46cc-8769-08de6d6d9ce8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:11:08.5632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dg2KmS1U8Bu5FWHwwYVaGkNZYL+XQeXgGnTDAjx0XfwMM77lmTsFmyRH9xbgXqvl1fynpddblKTCGh1GJznWssMJ9wM8iRl3RJbR7xlUrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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

Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on pon [2026-lut-16 16:02:20 +0100]:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:16 +0100]:
> > We already have functions to configure VF LMEM (aka VRAM) on the
> > tile/GT level, used by the auto-provisioning and debugfs, but we
> > also need functions that will work on the device level that will
> > configure VRAM on all tiles at once.
> > 
> > We will use these new functions in upcoming patch.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 108 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   4 +
> >  2 files changed, 112 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> > index 01470c42e8a7..e7187d03fe1b 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> > @@ -436,3 +436,111 @@ int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int v
> >  
> >  	return !count ? -ENODATA : 0;
> >  }
> > +
> > +static u64 vram_alignment(struct xe_device *xe)
> > +{
> > +	/* this might be platform dependent */
> > +	return SZ_2M;
> > +}
> > +
> 
> In xe_gt_sriov_pf_config.c we already have an almost identical function:
> static u64 pf_get_lmem_alignment(struct xe_gt *gt)
> {
> 	/* this might be platform dependent */
> 	return SZ_2M;
> }
> 
> In my opinion, it is not worth duplicating it, but rather creating one common function.
> 
> 
> > +static u64 vram_per_tile(struct xe_tile *tile, u64 total)
> > +{
> > +	struct xe_device *xe = tile->xe;
> > +	unsigned int tcount = xe->info.tile_count;
> > +	u64 alignment = vram_alignment(xe);
> > +
> > +	total = round_up(total, tcount * alignment);
> > +	return div_u64(total, tcount);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_provision_bulk_apply_vram() - Change VRAM provisioning for all VFs.
> > + * @xe: the PF &xe_device
> > + * @size: the VRAM size in [bytes] to set
> > + *
> > + * Change all VFs VRAM (LMEM) provisioning on all tiles.
> > + *
> > + * This function can only be called on PF.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_provision_bulk_apply_vram(struct xe_device *xe, u64 size)
> > +{
> > +	unsigned int num_vfs = xe_sriov_pf_get_totalvfs(xe);
> > +	struct xe_tile *tile;
> > +	unsigned int id;
> > +	int result = 0;
> > +	int err;
> > +

Reading the next patch, I realized that we still need to check if(xe_device_has_lmtt)
When defining sysfs, it cannot be done trivially, and sysfs will remain visible anyway due to DGFX.

The same for 
xe_sriov_pf_provision_apply_vf_vram

> > +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> > +
> > +	for_each_tile(tile, xe, id) {
> > +		err = xe_gt_sriov_pf_config_bulk_set_lmem_locked(tile->primary_gt,
> > +								 VFID(1), num_vfs,
> > +								 vram_per_tile(tile, size));
> > +		result = result ?: err;
> > +	}
> > +
> > +	return result;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_provision_apply_vf_vram() - Change single VF VRAM allocatio.
> typo
> 
> > + * @xe: the PF &xe_device
> > + * @vfid: the VF identifier (can't be 0 == PFID)
> > + * @size: VRAM size to set
> > + *
> > + * Change VF's VRAM provisioning on all tiles/GTs.
> > + *
> > + * This function can only be called on PF.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_provision_apply_vf_vram(struct xe_device *xe, unsigned int vfid, u64 size)
> > +{
> > +	struct xe_tile *tile;
> > +	unsigned int id;
> > +	int result = 0;
> > +	int err;
> > +
> > +	xe_assert(xe, vfid);
> > +
> > +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> > +
> > +	for_each_tile(tile, xe, id) {
> > +		err = xe_gt_sriov_pf_config_set_lmem_locked(tile->primary_gt, vfid,
> > +							    vram_per_tile(tile, size));
> > +		result = result ?: err;
> > +	}
> > +
> > +	return result;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_provision_query_vf_vram() - Query VF's VRAM allocation.
> > + * @xe: the PF &xe_device
> > + * @vfid: the VF identifier (can't be 0 == PFID)
> > + * @prio: placeholder for the returned VRAM size
> > + *
> > + * Query VF's VRAM provisioning from all tiles/GTs.
> > + *
> > + * This function can only be called on PF.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_provision_query_vf_vram(struct xe_device *xe, unsigned int vfid, u64 *size)
> > +{
> > +	struct xe_tile *tile;
> > +	unsigned int id;
> > +	u64 total = 0;
> NIT: The variable total is unnecessary
> 
> > +
> > +	xe_assert(xe, vfid);
> > +
> > +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> > +
> > +	for_each_tile(tile, xe, id)
> > +		total += xe_gt_sriov_pf_config_get_lmem_locked(tile->primary_gt, vfid);
> > +
> > +	*size = total;
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> > index bccf23d51396..f26f49539697 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> > @@ -24,6 +24,10 @@ int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio);
> >  int xe_sriov_pf_provision_apply_vf_priority(struct xe_device *xe, unsigned int vfid, u32 prio);
> >  int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int vfid, u32 *prio);
> >  
> > +int xe_sriov_pf_provision_bulk_apply_vram(struct xe_device *xe, u64 size);
> > +int xe_sriov_pf_provision_apply_vf_vram(struct xe_device *xe, unsigned int vfid, u64 size);
> > +int xe_sriov_pf_provision_query_vf_vram(struct xe_device *xe, unsigned int vfid, u64 *size);
> > +
> >  int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
> >  int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
> >  
> Code is functionally OK
> Minor comments, with clarification of vram_alignment:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > -- 
> > 2.47.1
> > 
> 
> -- 

-- 
