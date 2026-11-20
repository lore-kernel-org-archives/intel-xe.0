Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C8606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bfaqHBqb;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OCrTxmdm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D1F10E1D5;
	Fri, 20 Nov 2026 07:27:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B35E10E1D5
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795159644; x=1826695644;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7BB7hc1fG9DC9XjkVSDNtQM3UW8RC/+P5S42rba6MGA=;
 b=bfaqHBqbmI2cehMd/nx4f5luKhZCAwAAIsG0hgFzzDKi+tWFiUTwbmL1
 iRwZQiTqvLkPfJsAoF03VQrgjOr/vbqPes/pjFF4cCagE1GPImSnxCtAN
 4ppopY/BhsVYGg1mqMoFzMpmcCzpN64khadqzWSHI2NITMHiQbs/ZuAJY
 uUDav3ttxgnJjsJ6x0qrZE8hyFqwuWoZJwB+1SD8GSbjWw0o8EV9H7BtB
 Pr6Z1PtqZuy2eav5SGxqqooZr44wAAhQFrf1hrtCwj/i1ayUnq+fBNF9W
 xxfH47WHzQ9vcpXsedkABi5/wIqTnc84cs/CFA/axIRNXKoCzw5sc4LkJ Q==;
X-CSE-ConnectionGUID: 7qOPdGbrSkC93OxxIqU2dQ==
X-CSE-MsgGUID: q9Gi8ExAQ6arhGsKP/szfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4066341"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4066341"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:27:23 -0800
X-CSE-ConnectionGUID: S5m83DNyRB6Ydd1kD05NTw==
X-CSE-MsgGUID: R1lfnVUvT5S+Nd3JH0A6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10634207"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:27:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:27:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:27:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:27:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLdWFWcNZkdr05szmCszFpm2SB/k1lR+muL0xzMgd9n54hsgJWivNyWUQPqZadrs+Q0+D3K14Jyk06l6aqQtdIy5EK6ZE2c2RoCHqnaQzy01GTIkMfYs/ZoeVcpVJxniamdMxb84jd0/f0uzNXUxHksBnDJ1UwhD1Pt5pQu7//4lb0HybjKVfM8hKoyJSh714Nghx7AgvFJXto9vyF1XdbvY+Ek4I7LWGYcMHIs7wYFz7mx2dWqxmW0sL2GAkVHqImvl2G9UqpcZxoWfCxEajcBSpwi6B8Wf6DwNevickNY54ZMinsnWBFjPiUtDrXtmZMvEvlPaxNrPLbgsbsiGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQbIJjwuSUhz/26yDc6ABL6z2e+MpqhcmSGU4TWqZj4=;
 b=mtbYD9esODJ7tlWw1x+7TjEW9MmvzK3XgQ7DjaIq5ybRe6kZBu3aJDBki+pV2iGmCRv9GAD0qBgfEQvPQcNUHjAqGsyv15WGXgIs5A1OSeBAukaVW3XBjQGB2A7haiGlmwQOeCvDJszoG8iJm6fLOio7h3N6q5bsJkV1Y8CgKGUIrKUD19ew04I1Rh2+L1kZhayfYNj5C1XPch0Y9qSVUkWeTkTZbvqBjBTU1uNnNStBjZOw7dxfJS3M1dh8WCTd6KI93VhbDH97CQKFlvEdD8Yz49hmGxapIunkBBHhYCBq5WDx+frf2TMuXOTMz/bO/ESwOw4X1Hyhf0olYaI3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQbIJjwuSUhz/26yDc6ABL6z2e+MpqhcmSGU4TWqZj4=;
 b=OCrTxmdmLg3qS3CGXUE8J2fX8uBrVR92pygRALjwT/3koAufBh3eKLG6758owu/CRXaVORpYBvCbUcxZ44ztF4PRG7DsBiLCjm/C38mEEaBdVbHqmzscJHJ86pafG1AJheiEHAo9ZZInWFNl+U8HUbbt//kLyOGBiSgsd8EzAbk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by MN7PR11MB170846.namprd11.prod.outlook.com (2603:10b6:208:5f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:27:14 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 07:27:14 +0000
Message-ID: <bd3b5dab-0073-4134-9abf-987723e264fd@intel.com>
Date: Fri, 20 Nov 2026 12:57:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/8] drm/xe/oa: Take the runtime PM reference in
 xe_oa_destroy_locked()
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <matthew.brost@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-16-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261119002737.3899877-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0190.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::14) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|MN7PR11MB170846:EE_
X-MS-Office365-Filtering-Correlation-Id: edc9f5fd-d00e-4e5d-95b3-08df46d7b2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|261022113327099003|4143699003|11063799006|56012099006|10067099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: s92pFFyRIpzdP8E5AyNL8SQXCVVVilJ3JNX99gyyMCRN88CjQZyr0iG+Q4T6xr2GnNXKVdmNbSrtsYJYQjGQW8UiSKAolxMkNaNvZU37kOetIoVbnoLotWdeKLV5s4nr80qsqmCsmZy34CgSgPQqHnihMl8/1SQIUnd5KPB+48Z/Hg2SRoOOeH0CVXeX4PlTbUhDnqrpnMq2xggu74VrgBK0VEvjMvekgbTsChKY/VN/Ps6eM0v46N0PyqHm4ZmutX3LGTOSFc3W//NfM+fQHP3aZXyvCE2+cly9QFzaGMQPe+YA5mNmQZjp6jJ3Bc63zl3Pz+b2IRYQ/DB1EuSmSBjxbSkhKN3A2W9jx2joxDJ8HLJnIsuAVnBYsTKKJ2ALO4Pz2Su7FGwG/NVQ0t6AEQgmlGotktkfNN5l5bjldrR/dsL3ktYgww2dtvLbNg2YZdzuat0qYjr4t8oGE3/NqkaEQxjkkD6qgMeBbPZF3Y1n6LhCBOeO5icNcLWfCjDclKwAHOP6iNUSgPi7jA9QN+hbhyaKABm49ipQUctQaMX0dzFNhu3wK2JEZtYEDCZpN2bhcUGcPHrnSUdWV+CeBVvVWSHHcAIlN4bKdcbQwHNOh9zW/TeY1pZ1AU+szNiE07d5iAGmvmkl2XUmve85/14kfdR818dDYxEE+tDj7UI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(261022113327099003)(4143699003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnMwQTVIZkpzOGNLQ0YyN0FGRFZYQUtiWkYveGdMZnRxc0pVNkNSeHkvY1ZJ?=
 =?utf-8?B?bUZOS25QZko4ZE1VQis2aE5leTU5ZnBMek4zRUVoa2c4STdlR2tscGh3ZDFj?=
 =?utf-8?B?ajh4dzVBU1pDUEJ5bm5qWFc5clZ3U2xDcFd3N3g0d2dJeFh6anVBMHo2QTlP?=
 =?utf-8?B?ekZlL1U2V2w2TWp2K21QcDZGR2lQdVBITS80MUlsWUNMcHBzUTVwbG1lT1hI?=
 =?utf-8?B?UDJqV1hXK0c0QW12b3cyenY0TU15bG0zdUxhVG1NcjRMZDJmSWg1VkZ0a1Vk?=
 =?utf-8?B?RGVXc0ZIc2dpcDZMZXJQQ0kzK2hPbTFiZFdYd28zYnJhajJncnppcG1DVXBi?=
 =?utf-8?B?dmk0WXdZMFIrU3B5RWhwTDFDeU01LzNhNTdXYk9Ca1hIV1NLMkNkR2FZQmhj?=
 =?utf-8?B?Mm1VV2hBRnR4Q2xBYktXemV3YWNvSENPaHRVYVpRTU90NGlDWERQUjBkdlRw?=
 =?utf-8?B?WHZyS2JVT1pnWEsvdEZld3o1VHZxUDJOMmRVODJMT21KK01LSTJydTVEdUx1?=
 =?utf-8?B?bmxYNXAxUjltYXlZT2MyZG1tUFgvTXNySERrNGE1c2NMMDhqSkIrNVJJR21t?=
 =?utf-8?B?REM5NmUyK3NPeWZ0NnJlQzJlZHg2UVhXa2owd0lMeDQ0MzFSbS9zUmhYQ01B?=
 =?utf-8?B?Q0ltbkJ0QUhOVU5xaWljcUl3TjZQd2tQbCtTSHpRdDl3emc5SlNEV2p3MHYy?=
 =?utf-8?B?Ni9TUVJPSUpWM2hhd1N6eVZlYlplNGFJZjJ3MlFwSUt4VmFBVGIydERsbmFD?=
 =?utf-8?B?SndFVVNRK0w3YXRKbWg4RUdWTkpjbTN5aEdRbjV5RlFCZy85Mk1QdjhQWVNS?=
 =?utf-8?B?VEJDRzhIck5KMm5XbWNBcUcvckNWZjg2UWlETUZ6SklFTkQ4UXpOYkd3V1Ni?=
 =?utf-8?B?RDdoOXVPZkhjUC9UY05iajBndU1xU2NJcTNXOWlvUWp1ckNGbFBmT2hIeHND?=
 =?utf-8?B?ZnVxTlNwQnZ3NFFSL1orU2lyRS9MYU1pekJtaDZVTmxmandCcStCUkdUU0pN?=
 =?utf-8?B?VkE0clRoZVFXTjliMHk4eUxPUytTZ1BoeHFmYTY0MlQ1L2ppKzhDc1Zra2tD?=
 =?utf-8?B?RXZlSnhmbEx1bmZMN1l3MWZUZ0JDNTVxVGlXMVlRc3hZY3dob0NlNUhVdFJi?=
 =?utf-8?B?RkJZaGVzZjJnNGYwelBDTTgrdDFGN0dRL29ydXdBZmZCdk8xVXAydXNWd3dM?=
 =?utf-8?B?ckdla1JnNTZJd1ltaVdEY0NicElIYmJwQlVHc0dqc2ljQ3RROXZ4bm5ILzRw?=
 =?utf-8?B?VW9SVVgzc05wZHNtNkhxSjF4cXFmNkd3amMvWDBITjEwSTRyUno3WGdJbXNX?=
 =?utf-8?B?aFhKaHhIYUtSRTJOVjBBbk9YTDR3YVhuRnhtU2FjcldxWmk1cm5BL1l1MEll?=
 =?utf-8?B?T2U1eGRZaEZ6R0Rhc0ZBcFVqbjBtMlBickpJeVNRbnhndkxzVXp6RHcxSEMz?=
 =?utf-8?B?ZHpkMVc2cDdRRHM3V0RNWEdNTzU1cTJEYWlvQ0U5VDJSQy9TQUxzcjFEcy9T?=
 =?utf-8?B?M1FYOVowSGhaUnNBalAvNnVBTUsydWNQZTg0WGs1ay93UHFUUUNLc2x4K1Ra?=
 =?utf-8?B?M1hGdzJPZks1NndmaVpTNTRQZDhWa3lMSm1CRXVkOTc1M003RFhJcW1MK2xm?=
 =?utf-8?B?anJwL1g2dlY4bC9sSURjUEFqZHNwdEhsWHdoQjlQYjZhRTZ3UUJCNHRobnZT?=
 =?utf-8?B?WkNvVjBlUS9LM2hkSHB5bEtFQmQ0bU4vZ1N4Z1M0bFV6Z2xRenZDV3MwN2Ns?=
 =?utf-8?B?VG0ybVNJbzg0WU9pMVNzODZ5aGpoZWZzZ2RwZXlBNWk3amNuQjBDSGM5QzVE?=
 =?utf-8?B?YXh4OU5SVUN0Q0JMaHhMTWhCaDR3aldqRWZNUS9TYnB6VEFYU2QvbW1mczc5?=
 =?utf-8?B?L0xWZXlLbll2WmEzNXdqa0xSSjZGd2VyMUxTeDRSWTFLcUZEN3VheUlmRmQv?=
 =?utf-8?B?ZjdhTitETVhTYTRZU1Jwb3drUTZidEhOUFFBcUoycWorckoxVEgzTWNyZHVz?=
 =?utf-8?B?SDlabm5iOGoyZWxUZ0RCc0tlWHFUTnpUT0V3c091dnYxTGdubXl6d0kzdG1E?=
 =?utf-8?B?eFNLUzdPbWFNRnVKUHoxcElyU0sxb2txSmhhWU43d01JSkJpcjhZL3FQV3Ez?=
 =?utf-8?B?RzN4Ky9IRk5WZzQ1K2JXTnJ3TVRxMGZWYlN2ZFIwUVhuTDZ3c3orcitDVVBn?=
 =?utf-8?B?VFdIcm94S2p6c2R1T3BoVGdkZkltWFdzMDN0SkgydWNYUi9PbXlsa3ZrTW14?=
 =?utf-8?B?UjlOaXNYVGlrS0tBZVhjbnVLRm1ac09HNndnclV0OExUZjc0c1AvVWdpbENJ?=
 =?utf-8?B?aGpUa0xQaEdQb0RUanBlTk56THFwcGdvQXpMdm9rTTVZMVIzcUR5Zz09?=
X-Exchange-RoutingPolicyChecked: D6TNgURnTOqMH+cbqAadhk4GDO1/tIKSc1A/WVcmgUm0UA5cfE1VeK18cIyPKACTIc+yL8eM0z6iJPvDnYV5rd2Y7BZqBdyjOP1KdQjtmJZgpa6S2zpavU7q1O++rg28L/ElNgug7hekd+KbGOKNlnkUQq7/zAp47Nyae1LUzViKp+gODo78XL+xOOJp/UvesGe8kYUdbDbnYGedGDONh2giRKG6c5IfYMFmEScnQQUuRR9WuzmpJtTzzzR8X3eAp5r6fk7BYTwQaW9PQJxdYQFDQ3PrYiEKI4i+q4w+2QbDsXQs5mSlsFJYQLpx3B2XLK2I//w5RiLA42TdW+Fpwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: edc9f5fd-d00e-4e5d-95b3-08df46d7b2d9
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:27:14.5837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vx+Foa3rhJ/Wg9eYOJeXZzeQRGxj+D/mm5MKbE+9kDFrDZlGdPeGyfgvinw6L0cqFqHN+8n98oAgZcbpszCefLMES3x3DEngxKDx1ytKeNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB170846
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/19/2026 5:57, Umesh Nerlige Ramappa wrote:
> Move the runtime PM get/put around stream destruction from
> xe_oa_release() into xe_oa_destroy_locked(), the only caller, so the
> reference is held just around the code that needs the device awake.
>
> This lets a following patch free a stream of a removed device without
> taking a runtime PM reference on it. No functional change.

"Following patch" isn't the best way to describe the patch, and it can 
easily be shuffled while a rebase happens.

Since it's a minor change, I wouldn't want an entirely new series for 
this, but if possible, maybe the person merging these patches can take 
care of the wordings.

>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Patch in itself LGTM, and with that,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_oa.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 72f173fb23cd..f3eceeb34e7b 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1760,6 +1760,8 @@ static long xe_oa_ioctl(struct file *file,
>   
>   static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>   {
> +	xe_pm_runtime_get(gt_to_xe(stream->gt));
> +
>   	if (stream->enabled)
>   		xe_oa_disable_locked(stream);
>   
> @@ -1769,6 +1771,7 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>   		xe_exec_queue_put(stream->exec_q);
>   
>   	drm_syncobj_put(stream->ufence_syncobj);
> +	xe_pm_runtime_put(gt_to_xe(stream->gt));
>   	kfree(stream);
>   }
>   
> @@ -1777,11 +1780,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>   	struct xe_oa_stream *stream = file->private_data;
>   	struct xe_gt *gt = stream->gt;
>   
> -	xe_pm_runtime_get(gt_to_xe(gt));
>   	mutex_lock(&gt->oa.gt_lock);
>   	xe_oa_destroy_locked(stream);
>   	mutex_unlock(&gt->oa.gt_lock);
> -	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	/* Release the reference the OA stream kept on the driver */
>   	drm_dev_put(&gt_to_xe(gt)->drm);

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

