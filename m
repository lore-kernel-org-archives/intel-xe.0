Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07813C36014
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 20:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF39310E49B;
	Mon, 31 Mar 2025 20:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUq41KxM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56FC10E49D
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 20:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743452311; x=1774988311;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R/R0VgwnwG99WmqHCF6HzLenkl1+0Zb3kpKPRfNWnHE=;
 b=fUq41KxMguVn93fDnBQYTUmksNnLPqwO+RObFU9pZzty9W9vSrWQ6qBK
 cjmk/gQUNcn2MtkC4CwUe/YV1cyQdltqdn/sg5pit+jBHKcZ4BUR7UyzP
 HICpzwiHW1cjcNn6Q5AJ3imDRPFKi0e4e3Eq5cx6v7MjCf1Z4ihGAQvn2
 XjmznOHp/gyNeaxa85QfJoNqOlqirGEPBfJ72NnUQmdJiWrJiX3/nTVmr
 oQSHqDM/pAyLem0dG+fOPNS+/n5ksBwoK3xSkaymt+2jKqfuvxNlo+snM
 IM6wFqOYsPmAkg2bgsQF+EVFkvmYhgxTJVzBWg3yPbn97iAeh9M6piMCu A==;
X-CSE-ConnectionGUID: OmeRimBtSWy4pP3rO+HT8A==
X-CSE-MsgGUID: EVHWRmXATmSGbTLyQPILMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43903918"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="43903918"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 13:18:31 -0700
X-CSE-ConnectionGUID: lSDLkzq8TRenQTgqOQuUzA==
X-CSE-MsgGUID: jp7w0pdqTsOOtfmel6mvjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="131402509"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 13:18:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 13:18:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 13:18:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 13:18:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWzJaaUjd2WjC0AaAfNNJBMaW3GjM0qEMXLFsK1ZKtPybVFuY5NbXuUJVjmM1RVdZ4R8VHtpufyVl0Jm+j39i7HJ0tGv6aYfcQ6HbyDQ4kojOjrcvUrsgfwKXGhJURNPdRqMAPQC8BtXEMgwihd1/O0Mu3YyBQdiQmvBJQ7F4oQZ0UKM2D0vyDgqBLyFiaTNywOGp7NKwZIK2OcuVcF6XI9ooI3nrKbzs7WUEQpkotAYsgbmYDjdHPceSI0sm9mUhemXXZJJhUM7QSLvI6jxRiSq0cshUHW/yKFEYChnJizMuj/t1d6WTPV/ZZme+ebyp8B7qUn2TAig+pEHiKyfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTfdL3lJ/tWfu6hFNG9WKzNZVhoTpCQyTHPPOoSyPZQ=;
 b=RPWLE45JeT1MWUY/jX64oQRDjPTIQ/w2vjGncpkOIyrS7q/6r9zSgqH1MP+snhsRVRR9l1rlPLakErmi3dvHUzAFaupwt3/8d6UNQIACYr+07Kpc9F81lGUcc2de1HfvXEjnKLPHs51lne+Zgb40URWOuQoPVDTcy0hZ0BDuK5mA92Z6qSSt0jENLKRtiwsGTLQoHdnM7zq6tX4Ibi98snMnOvBIlS0Kor+GcZSpwDPNWyNXkYZ8NLxASJB4I79nxshCD0cjrkzIA4jdC+x6qeMyZr6J3DKiCobu578OeZt7FxltYaa+rdJWZvzlyQ8wCRGxm2Zncqw0VJKy1t3FGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5)
 by SN7PR11MB8109.namprd11.prod.outlook.com (2603:10b6:806:2e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 20:18:20 +0000
Received: from SA1PR11MB5825.namprd11.prod.outlook.com
 ([fe80::41f9:e955:b104:4c0b]) by SA1PR11MB5825.namprd11.prod.outlook.com
 ([fe80::41f9:e955:b104:4c0b%7]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 20:18:20 +0000
Message-ID: <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
Date: Mon, 31 Mar 2025 22:18:16 +0200
User-Agent: Mozilla Thunderbird
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com> <Z-WHYbhu1QdjUFPR@intel.com>
 <Z-bICZUBN_Fk0_mM@intel.com> <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
 <Z-q_n1g9wIEZc-dm@intel.com>
Content-Language: en-US
In-Reply-To: <Z-q_n1g9wIEZc-dm@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To SA1PR11MB5825.namprd11.prod.outlook.com
 (2603:10b6:806:234::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5825:EE_|SN7PR11MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 33bcdb3f-ede1-4304-b4a0-08dd70912db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmZ6cytuSlB6WGZCN1RKbHQ1WnJlY2Nxcmswc1ppYVZBWHh2WmFJTHlsS29T?=
 =?utf-8?B?OCtMTEJjSjYySEwwRjJXb3NPRExxek1iL0lRVmo5VGUzV01OMWR3SkZoMkFO?=
 =?utf-8?B?R2lJaHJmVXBWK2w3VVRuRHNlSFh6UjMvTy9QMWZSNHJPRFAxWEZMUEpJcEVh?=
 =?utf-8?B?eGhqQWcxVjliY0Y5eEZNZXdxN1dxSVd6Q21GZWhIcFdtYzlTa1V4SzFVbkt6?=
 =?utf-8?B?cURSMTdlQmhsTUN4ZnNlWk9kYkd3VHlDM3lCM2FDL0JISC8vS1VSQmtOYS90?=
 =?utf-8?B?anZzZ0ttV05CK3hFQVJmZEZaODkrR0k5TnFRbHNYMk1haERUbVR4L3BkR3hn?=
 =?utf-8?B?Y2hXdzlYV0xIK3ZTNXpzc1VlOTFtUHY2K2hXVUQvWUhPcWVJT3FZLzR5dTZN?=
 =?utf-8?B?MmtkQjNaNXRRRHY4NU5vNEN1Ukx6RkVXNjRjZkx2UTcvMU1IMW5DTU1DZXNJ?=
 =?utf-8?B?WURubHQyajVSc2N5aldLSW91bkMzbHEvTlp2cEhxK0h4Q282NE9JVnB1UVhp?=
 =?utf-8?B?ZUtFb212U0RJN2pVVUx3L1ErWjFuUUd5TlFrQUo0NXZ2TUZ5bk5HQmREV29h?=
 =?utf-8?B?SitraS85NFBzUklyU1JpSjFCcmZGaENsOXBTQThuclMrcHFjektLMko2WHhn?=
 =?utf-8?B?d3NITWc3eUtMUUNHOE5heUhmeFovMkhRMGE4eVYwZTNDWGdNaThqSW5YZ1Jz?=
 =?utf-8?B?SVFvWTcxcHdDOFNvMG5qTmZsazBidm80RnNpMXpvQjJpSWp2RG9ra0svMTN1?=
 =?utf-8?B?SUFGeTVMdlRtbXhGVkVKSnpaQjFpZU1kSGZUSHpLQ1VOdVM1VE4yWEtJemZH?=
 =?utf-8?B?VlVwNEYrcUZFTnVqT2dPYTF0RFFsNkRPa3hJM2N1RC9DdnlOd092SUtGTFJL?=
 =?utf-8?B?NmtKZ2Zuc2d0SkE1OC9IQlQ4OUhPUTZTQktsR2YxN0g3WFhIbDZMYitReU1i?=
 =?utf-8?B?ZXd3NEU0bUtrMmdzVmxvaXBvWnc1OHR2YnI0RTFrTjA3RW1OOHFnQmhLUTVa?=
 =?utf-8?B?bGF0T0l6ak45TkJmTmhJNndTTG5xc2t0Mm45ZG44MHJqNmptVi8ybERTQTRQ?=
 =?utf-8?B?Z2FySFhWTGUyUFdVdFAvQlRwR21Bd255R1BWVlZwSkFlSWpsMG4raEF6R1g3?=
 =?utf-8?B?M09zdFlqczZUZzU5SkgxcjFkTXdrb0ttdDBvQ1p4MDJwa0c2Q3ZMc3luU3ds?=
 =?utf-8?B?R0puZ3puOVFocS9OZitoRno2WVRwODJ2N004bDMxNnpWclI3UU95ZDFrOGxs?=
 =?utf-8?B?c0RuMjRpT0g4Qy84ZEhyL1lVZmdLZjZmdURwZS9ZbHVZeUZWREJ0ckoza3Rs?=
 =?utf-8?B?RUMxSmhVaHRYSlhCUFI2RjFJR0JEbHcxSE9nc3ZRak5qWTFFeG14UDFGMjV5?=
 =?utf-8?B?dTJaU3hJUTQyV3AzcDJEeVd2aXQ2eVVxMzZRcmtwV0UyZW9HL2s2WlNXaUlv?=
 =?utf-8?B?dEUxSGdibGRPVFZNaW1tYkhGVUN5eUF2STluUHlOUjlpTUVHUzRqWTFEakMw?=
 =?utf-8?B?RVdVbXRIbEVKMTQ5UktmNGdBSkFHaVNDOTQ4ZDhXTWJiTFdaWmpFd1ppdnpT?=
 =?utf-8?B?bHJpQ2dKWGRPd2pZYTVkd2UyeDZhb053c0JZQkJQb01jMXZyUWZKYkt6eFpU?=
 =?utf-8?B?L1IveitYeTBDVFpyNmFMVVdtSWc4OXo5TWZHT2JyckhRVXluR1pud1JmTnhl?=
 =?utf-8?B?MlR1SVJqdlZ5MERlNXpWSXorY3FKcWFKMlJ2MjVDVGlRbU85VVFsQ2lCS3lG?=
 =?utf-8?B?cGVXVlgwSkhiRnRUY20yNERhQy91NWRRQjNaZU5vbmtwUDk1MXIvK3oySEZJ?=
 =?utf-8?B?T1dPa09tc0IzU0tHbE5pQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5825.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUYzWWlsbDZlaDZpQWdITW5LK05IK2JpRWQzcHR0R0lEcGdkRVJHcTRKQ1ZZ?=
 =?utf-8?B?Sko5ekN2TnFuZTVMdW0zK0hyamJQblFLMFByTVVhZEtaa016S3JYNXpKQ25t?=
 =?utf-8?B?b3UxZGVsWGp5OGtqb3ZYeGlmWjA0ckVsb3ZMRERTZDJOTzlXdW56SUcrWXNo?=
 =?utf-8?B?ZGFIaUdDMmVZZTZwdTh3azMxTEF6VW9teFFZRHNMZXVic1BwNFpLZDJYSnlK?=
 =?utf-8?B?VTRxeGo5QUFTOCt2MFJMV2t6WWt0dzhLNTZsZXdiSyt3MUxzdEZPbjREb2Fk?=
 =?utf-8?B?UGZUV3FwMVhlQXRsbXdFRkpLOGlNWjZ0cXNncGNzdm03aTFQR1c4V2FYdlBE?=
 =?utf-8?B?NEh2YVorSWI1K1N5YmQzSlpBWXNTNDBpNXovRmthV1ZDbmhPdkw5QXZZTW4x?=
 =?utf-8?B?Rkc2a0J2Ri9xL1c5N21YV1BrMXMwdzZzMy9LUWZDa0V3UlpZdzdjZkF2Vzl1?=
 =?utf-8?B?K0tFaU11aWxpVW5LS2dTUFhqK283c0g3czYrMDdYSjZaUmZoc1dRSzY0dldk?=
 =?utf-8?B?ZXpLdDIrQ3R2VG5XSi9lLzFpdEJxbHMyZlZXL1NFWWNEYzR6ZDNwMFNOTDYy?=
 =?utf-8?B?V2ZFQ0RiTkFkR0F6L1A1Vks2TURMWG92YVdIa1AyWnptUHFZZ1NrTUNCSGQ1?=
 =?utf-8?B?TzRSaTl5NEpHRDRVYmwvOCtCRFdoOTNRMUJza0xhMC9MVWhPOG91R3llbVJr?=
 =?utf-8?B?aUV4cUZWZUZmRTB3bmgxR25ZTVNyRk1xS3JPTkpmNXRmVjFHakZMTnVGRkts?=
 =?utf-8?B?LzZLeDZmd1U2TkwwenF2SDNCMTM1MGVubUZHUktCdFNjaGFmbGFCVktVRGZL?=
 =?utf-8?B?SmpGNkZoZC9Md1dvcW1sZTRQMXdIYVYwVHRETG1PMmxpQzlnZUlzQ0JzUk52?=
 =?utf-8?B?TjBvc29zRlA1UG5Dam9vSUd0MmpmR0ZGOHRkL3YvNUtXZ2FrZzcreUtkTFdu?=
 =?utf-8?B?VnVWNmY1TXFLa21lSHBXdzlEOVp1c2NXbnRCaGNBSzBoSmhsYzl6OGNkUWt0?=
 =?utf-8?B?cm9CYWdibjNTaFYvUmlrZDYrcGUxRWZhNE1vNGpEcTlmZFdPd2NTYkk3bU0r?=
 =?utf-8?B?QkVjM1ZmbFBXbjdVZXNaY1p5dzFRRlp0ejJXdnBKeExiQnp5ZTNIWWpZa0Fl?=
 =?utf-8?B?bFFpcjF2ajh5NnhVWjhaRWQ1QjJ1REtyVTNSd2FRZ1FSTlJqSlBITm5GRkNh?=
 =?utf-8?B?dDB1bXlLZXVmUDFoZlBDUTZ0NmJqd2ZLNUEzWGQwa0xEcGVka1RmQ2RXVDVL?=
 =?utf-8?B?T3k4ZjltdCt5Ym5EclU1SXZjT1hlRjYzQy9UMitBaXNTakpuNWVlNUd5VkVO?=
 =?utf-8?B?SklMWkQvYVBHNUlYZFFHdXBtOWFmNE9aMldRZFVUTnpCZzdZVXR3bHV0OU92?=
 =?utf-8?B?T1kwOFIwWWd6Y1VXaFpodisxVEpHS2xhczVwYXh2aFVLcER2WEZHdzdGNVlt?=
 =?utf-8?B?UnlHd0RDUWl0TGpzOStJaFZ0V21TbTRKYmZFRDQrRjU5M3p2NjZrL0FnbGlz?=
 =?utf-8?B?THVmdU9kTzB0VzhWTzNZRkV6QllVMUJtVVBjYWMzdG9hcXBLTHlUSC9FNkE2?=
 =?utf-8?B?UUtSc1R3aVBJd1M2UFl0WERvWEpqZy9yMUI2c0dpbnVqeXFUZFZSWnV1c1Ft?=
 =?utf-8?B?eXN1dkhlcjR3b1lyaWpRanRHK0h0MDFraGVid0V1eEdCa2lRWEZJejhoUnJK?=
 =?utf-8?B?SUZtcjJIVU00NTRYVmNlZmxYazQ1YjFFb3VGMGFIS0NPNkhmVHNJa2ZmODZB?=
 =?utf-8?B?ek1vTHNuZm9VZjh6b3RDZU5FMDJSTGRTMkRXL0VSQjFrUkh3T3hJazc4YkIz?=
 =?utf-8?B?S3RtNktrbDJpbjdEN2crNGI0a3NpSXBhUGFsNlJlRUVsSVVzUTVGNkd0QkVM?=
 =?utf-8?B?SXNZdWhsK0NTQk93QVpKWWlHTEkrbWQzUEJjakY1bWJuYWlDV1FielhXa1NE?=
 =?utf-8?B?aXJVamQ2RVRDWXpCM294N1VsWUVOOWJDakd5cythdzlHRUJtekNCdnhWQ3Zu?=
 =?utf-8?B?Y1ZQdExnN1RlR2hYbUd1OFBNWDQ1VG9GbmhzWDVNTTc0TU1wS25QQXd6eGpR?=
 =?utf-8?B?bHJ1ZUoxN0U2U3duM0d5dDFVYXR3cmFVb0J0czlzOHRpcHUrYzkvY2J4dkd1?=
 =?utf-8?B?UW5qSHpDRDFVOFdFVkE2Z3lDYU84SXBJQnJwVXZETDNIdFAzTlArN21KNmE5?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bcdb3f-ede1-4304-b4a0-08dd70912db2
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5825.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 20:18:19.8270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9OagDGeXBK4NCqJXE+WJy1sIiHCkUKs92gxCTDxWhG7nlH2u6lWx11frvJveDm3kZOk9RBuc56nO4UeRpXP9VL0EtQW2SgWpo7su10hSJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8109
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

On 3/31/2025 6:15 PM, Rodrigo Vivi wrote:
> On Sat, Mar 29, 2025 at 07:20:37AM +0200, Raag Jadav wrote:
>> On Fri, Mar 28, 2025 at 12:02:17PM -0400, Rodrigo Vivi wrote:
>>> On Thu, Mar 27, 2025 at 01:14:09PM -0400, Rodrigo Vivi wrote:
>>>> On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
>>>>> On 27-03-2025 21:49, Badal Nilawar wrote:
>>>>> Hi Rodrigo,
>>>>>
>>>>>> According to pci core guidelines, pci_save_config is recommended when the
>>>>>> driver explicitly needs to set the pci power state. As of now xe kmd is
>>>>>> only doing pci_save_config while entering to s2idle/s3 state, which makes
>>>>>> pci core think that device driver has already applied required pci power
>>>>>> state. This leads to GPU remain in D0 state. To fix the issue setting
>>>>>> the pci power state to D3Cold.
>>>>>>
>>>>>> Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>>>>> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_pci.c | 1 +
>>>>>>    1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> index 7046e7e9a6c7..3317d475be79 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
>>>>>>    	pci_save_state(pdev);
>>>>>>    	pci_disable_device(pdev);
>>>>>> +	pci_set_power_state(pdev, PCI_D3cold);
>>>>> Another approach to avoid calling pci_save_state and pci_set_power_state,
>>>>> allowing the PCI core to manage this.
>>>>> Currently, the above change aligns with the Xe RPM suspend flow.
>>>> Either way is fine it seems. Or we don't save the state and let pci subsystem
>>>> handle that for us or we save and set explicitly. So, let's move quickly
>>>> with this option here that is already fixing our current issue.
>> On our way to become another i915 now, are we?
> could you please expand on this?
>
> A simple git grep on pci_set_power_state and on pci_save_state
> return many more entries than i915.
>
> what am I missing?
>
>> While this might be a good enough band-aid, we should probably explore
>> how DPM_FLAG_SMART_* work and stop mixing/matching approaches to hide
>> issues.
> perhaps this indeed...
> perhaps the ones doing power state themselves are the ones declaring 'smart'?
>
> Well, on a dumb script here it looks we have over 110 drivers using pci_save_state
> and only 6 of those using DPM_FLAG_SMART_*
>
> So, I agree that it might be a good idea to explore things here and find the
> optimal settings.

See 
https://www.kernel.org/doc/html/latest/driver-api/pm/devices.html#the-dpm-flag-smart-suspend-driver-flag

It's fairly accurate.

The rule of thumb is to avoid mixing these with calling pci_save_state() 
directly and setting device state from a driver callback.

