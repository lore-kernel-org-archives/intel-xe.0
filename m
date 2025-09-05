Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BB6CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 18:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ACE10EC29;
	Fri,  5 Sep 2025 18:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2NAHdFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F7B10EC29
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757097624; x=1788633624;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xpiey9Z7/c2eaoP97ofUOnZDvi+UsAvQ8Fyw5p16yHU=;
 b=M2NAHdFpetlA7rqrjIQRd3UQT9dXvImqtjHVgFJEllHtEww7HH/d24CA
 FZcPD21n3W87Vr4kAmkumpEt+kxLm9ezeOd0kzB4USwxU4Dba5YPXB8Jl
 cx5DN7D9tkoX8WfbMNLlhUa/ZSzFzw8az+WfBkKxhOB+p/ARxlHPkp6s4
 QqDuH7gPcvEAAAcuRLtdTcqX7JS4VMwMJotzoEstYVGguob+s0eEvt4mO
 JxVKn3lg75RPM6c+tCFvAPHcvjNC88bPLc63on+Orvg/SsnFFyZGhmcWe
 20tHr5zKc+vQ4eGlUKeGXQWriMkvLUTygjGhwznWRlgJZ91WSvAqGKxi2 g==;
X-CSE-ConnectionGUID: SdDyloJAQrybywRD3B0U2w==
X-CSE-MsgGUID: rxTVGx4lSeqUHCPZqr2TXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70550002"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="70550002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 11:40:23 -0700
X-CSE-ConnectionGUID: rmNQlug0SECJBInN3qu0LQ==
X-CSE-MsgGUID: eH2KN+XkQEGYt4UZbhjVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="203036790"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 11:40:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 11:40:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 11:40:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 11:40:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGZglfCk706ylig2QQRhvdtIg/hC8zgNpwOrCbeV+79xIKqJpMZRbVL/hApXFQMR6I/cNYbUG2W7wsO27527jTkhjz7dBcpmEzYw2cpkqfDvcMEFaP8SMPVcrFrfz3DgKd//kz7kdkoUGrB7vQmpKXytz/PPBhm6Ys1e490iYv5dCByWWXdsnXqwOdwF58qXhYocaC5SOEbM39kdIdE2YuYz8TGcbGbkhHnrcclCECl8xDQndK1F77jyTF1Jt63qFNnFwvWYHwHnRfH7mCzjm/fzCGOwX8wNpHpVGzApXjzyFJzqLkbWfC2Q6z1c/3GO6MgLviH1cmHdETOZ/8YgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9aGeTNQ2dvb7xV7kRbLCAj82gEBx6tFEAtvsJrP6XE=;
 b=cNymVOrdQLRTyYSp6OXOUKKdrfL5orVVPQgJ2kXMqixiSP6km8Qx9H1ojDLDA7SnBi0lnt/ENGdnKSat+zP3t62Qc5yITea3iNkUfUEFfyEQb9R/P2FrWydhec38aOAOQhqebRrKdePsE1qIOLcQ0x8snxEFvJI6q7781ZdY5fX4VDUWrr3oWkyAlWo7jI/BeZ1gXMFlOExP9ADkP/LfD0we65UXyankXlaHc4DNENcUxzGpOwRK213aceVvRwR3Ny0a3rkr+Pig7wwnyQ4z28DMDAtl5+yuXk/676O4f7CMnF7PRrqqFddsl65LaIq+NZ30hiefVeeVbenLz6LS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4562.namprd11.prod.outlook.com (2603:10b6:5:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 18:40:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 18:40:19 +0000
Message-ID: <e3be21e9-cc3c-4646-b7ac-ead4a575565d@intel.com>
Date: Fri, 5 Sep 2025 20:40:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Don't expose dgfx residencies attributes
 on VF
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Soham Purkait <soham.purkait@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20250905173625.8398-1-michal.wajdeczko@intel.com>
 <175709654211.5916.895894170330275840@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175709654211.5916.895894170330275840@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0198.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4562:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d9a59d-90f1-4a86-9255-08ddecaba9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0pHRDhGcHRVZTZjc1EwZm56cHdSWDI1VHZxaERWMzZYNmV5dzZuaVRpTlVv?=
 =?utf-8?B?V2tQODVtOThFdlVxQ0szOENTNEZyQmJKWmV1OUtvbUVORGZNYWZaTmRRM1Jq?=
 =?utf-8?B?YmtQWElzS0R2Q0dtTzEvTmNmUHY5emZnaUlQRzhjYTVmVkZrUUJOb3N6MUlO?=
 =?utf-8?B?d0NxRE13b0pLd0o0OTIrQnRLdC9wb3RURjFCY0UwUzNQS0pheEFtMDlucCtI?=
 =?utf-8?B?cUd3TzZJUUxqWXdoWENlL3RZNyswNGszcTIzUDhHeXI2bWF3ZzJJbXJNWnZ2?=
 =?utf-8?B?Wnh1QTdCZThGbExxLzFoYk9hOXkrVW5pVUYxbURWTU9Dc21QMzJhQmxReXJS?=
 =?utf-8?B?TXhCMWxzZ3FGTmsrNHZtd1Bmd0NqTnA3aUFuN1hqYjd3RzdoRHV1cnNrUWRl?=
 =?utf-8?B?aWR0bmFrQlZEODVZTE9oTjVZbkNRZFNjVWlZcE9JY2RPUlVvWmVubm4wYlhk?=
 =?utf-8?B?Wnd4UUNraTErSU5CbW5yMURDeVBjVEJtb2ZIT3lTc2tzbjR3UXZ5ell0NGQx?=
 =?utf-8?B?UndJcTFUZjZGZy9JZUhmSFVvemRVL1A4ajRBMzRsTmFmbzFJWW5GUnlPQ3Y5?=
 =?utf-8?B?Njc1WDUzU3lZYW8yejNTclloVmp4eThoSExGaGNBd3BkRnZvNU9TajlqOWdY?=
 =?utf-8?B?bEpDaVZBZjBqaE5zaDV1Wi9aZTZRTDJJbGl5NGx1SFVqb0JsY0Jnb2JVcW45?=
 =?utf-8?B?RXoxeDd0aDl4RTgvR2VDay9XZUlVZk5HZlZ1aWdka0hGdERiTllWVnAyQ1I1?=
 =?utf-8?B?MVVJamNJZGVhZ3dvLzF0TVFmaGhQdVdWaTYzejhFci9tTzMxc0RvZWxuTjlU?=
 =?utf-8?B?UncxSlJneVArZ0hjOEVqdy9DMXI0VHAzVlgwWmp4NDVXcUd1L0wva3lOL0ps?=
 =?utf-8?B?ZWpYK0dEbnB3N0VBck5EOVhrUWtCWHNLVGE1V0VoV0YwVlp1QTZOeDFMM0Rv?=
 =?utf-8?B?SnV3emZuNzErcXhSM2YycWtXbDYwZTlrSmlTQWxvalR6eitZMXFKbnU3eGlH?=
 =?utf-8?B?YVdXZnFsdTdTd01Rd3FzRlorU3lBckhvU3JQUXlPUXgzM0NvdGU2cUljN1NS?=
 =?utf-8?B?eThIQldWd2QyNkVZb0pGZnRUaWc5NlVuQjFUa0V4WFFDZ3B6UHJQOHlsRGJX?=
 =?utf-8?B?a2pBYTlMdlZYMU5wSTRpVHU0VEJuZFp4R2dCTitvYWYrMUg3blZTOXlNdmRz?=
 =?utf-8?B?dWRoSFB2ZlAvT1JSOWhjcG5DZmdGWnQydHhhOXJFSUppZFk0ZXFCbDJnQUNC?=
 =?utf-8?B?cVB3R1EzSDF2TWx2OFg2eTlYUm1jMFNLbEQ2cVVSeS9QVHZoTllPMktBN3dO?=
 =?utf-8?B?WGJnRTY0Q0Nia3BvUk9xcVdKa3FKQkwwTTZjSW1LU1puK1VhV3RCRitaOVk3?=
 =?utf-8?B?VnI4WFpzajFVYzdCa0JGV1BpbG9Bci9uRVVWY2lLbEhuak9FVzlSSTBmWkVN?=
 =?utf-8?B?cE93cXVwdmxrL1lPS25IMzN2WmY2TGxISDJkM21ObmIrSUpoeG9jZ0I2QXAz?=
 =?utf-8?B?Ui94RWg0ZUp3WEFzMWZNZXRlMVl5MURidEFWNEljZ3V2VGlCeHpYZjB6cEpr?=
 =?utf-8?B?ZmVPRnlmOWxQTlViZGdHR2JVSm9rLzNKb2o5Z3ArYVg5RUYvTGZmTzM5R0E2?=
 =?utf-8?B?VlBWODB1cEgyVE9hNjhQMVdRZTJoVmt6TmpYdGpCZ0E0T2lHbXlQd3M3WXBZ?=
 =?utf-8?B?WnlNUEgrRW84MlJqeUlFWmxvbGxJOGpOUUhxeFBwMnIrT0VFNWNKYU4zZXZE?=
 =?utf-8?B?YXY5VjB0VlI0SkMvQjRQN0hxcmtkcUVVa2luNzlmNURtV2xBSk95UmZ4QUNu?=
 =?utf-8?B?SDVYSTFUbVN6bW0xUklUeHJYa0U1WWhnbllnNHQ3SDA5eERKM3cvdG5pdU01?=
 =?utf-8?B?QzRKdlRRb2M0NTNQYzVHRE0zakRxcyswZ1FUd01JTHhLMnFSZVZQV1FsQ20x?=
 =?utf-8?Q?/5OhU2NEUjA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEpYMkJZVDZ6cXF4R052eDYrbnJ4TllZek0rMklKTFByZXNsbWc0SlBnWlVJ?=
 =?utf-8?B?NzFpenNLN2JMM1RuNVVoR2MzbnhKc0NWblZaWHVlMHlWL0FsUUZKU2ZwR3Zv?=
 =?utf-8?B?RysrUlp4K3p4bVRCNDBLd2V6YjlHNDN1YmhIaGw0cnhyWmRMSkNTWkZtd2dv?=
 =?utf-8?B?T2hXbE84NGh1blJLTWViTXh5dmNndEFKZUpUcGlGY1JxMUh5T0c3MnFSRE5L?=
 =?utf-8?B?MnV3RmVDWEhGSUJYVnV6VEkyenp5cXZrYmpoVHorazdBakZ2TzRwbWtrV3VC?=
 =?utf-8?B?dlZTOElGOHgwNndTazNhV0h4Ym4xd2ZQMFIyZzR2S1NIY3lVZE0yVmRnQ3Bk?=
 =?utf-8?B?Z0RqNDhaS0ppOHNadHRwVkZNZTIwOFUrZC9uT2ZpdDNXWVdrVFh1Y0VPZU05?=
 =?utf-8?B?enViZll6TnZ4b0k2eGlQTjU1ZjllZS9WK1FXeXlPK0pMdzIvUGpJS1piZG9Z?=
 =?utf-8?B?cjNtRXo4REZHRkl0TTRlaENaMEJyRHIvemlNVEoxc2w2S2Q1S0JWcjZYUG0y?=
 =?utf-8?B?SkFuSnJzOGw1S09EMzl4Sk40TXdYK0owbVZlV2F6RW5YbXAxTFh6YjNCaGMr?=
 =?utf-8?B?SFI2dGM5aXNObGhLcDNKUzdDMllvRGI0aW9heTltOWlhQi82Z0pIMmFkN1hD?=
 =?utf-8?B?QUdXTzcwaGFzWTh2dXlJYTZ2L1RQVVBpTHJKTUFuOEV0dFk1Nm9TOXFwc1cx?=
 =?utf-8?B?Y1BHWGVpKzQ4blkrTHdZQnhtczhRaWw4LzQvZUJCN2wvblRUUTNabnFwVDU4?=
 =?utf-8?B?ejlKekMwUUJJRjRma0Y0ODhaTnd6ZlpJS3lBaTBWMFR1NHFFV3dRMlRjS1Y0?=
 =?utf-8?B?azVYcEFBYlpraVc4dHNNUEdDQ3NyVEx1c0Rad1ZlNnYyN3lBdEFzYVBFNWJT?=
 =?utf-8?B?dDRZekQ2UnhicW1lQnBZQ1prMEJ5bVkvT1VRdm52dWR0eGN6N0VZNnFkcGpV?=
 =?utf-8?B?eENtMi9PSmlmdTBPM3U2ZkNtVzI5ZVBjNDF2U2lIdlVHblBlVm9QbkV6Q2FR?=
 =?utf-8?B?Nm52Mk1adDE2dEpKaEY3OXpZTjY5N3RoekZTT2dSWi8vcHFuZ2x0WTRlMXFi?=
 =?utf-8?B?N3NJQnROL29aTHRwa2duRENHN29LSFNFcnlRektXL3ltL1pBWnJJT2ZzbmNZ?=
 =?utf-8?B?bUllWUs3Sy9mYmlrS2laZFMvMmIrRHFlVHErR2x2aUZwekw2TjA1UWIrcEQ0?=
 =?utf-8?B?cjJDamxiWnNVcFo5VnlQaUdLcW9QWU8zSGNCUE9JMklVVlBzZU40eDVBTVN6?=
 =?utf-8?B?bVZTMnRUS2VScjlHaXY2ZFp5L2ovZzlTRnY4eFBzWVZNaXlyc1gxYU81R3Rm?=
 =?utf-8?B?L1BBTHFubTloa25xREdUaDNtQWt6MnBQODdmTzFMZGR4VzkrUGQ0MHlST0Nz?=
 =?utf-8?B?YXE3RTkyTDJtQThaM3ZQLzYvdzNxVE9HQTJTRkRwV2crOWhqOUp3ckw3Q09v?=
 =?utf-8?B?N29YMU5HWXdiK3Zvak9YakFWYnRZeDBLYTB0bmhUSGYyNVZZUzJMaHdaT1hK?=
 =?utf-8?B?VXFkdkIrdm1NNjNEbzZRSFcvTzg0ZGVNZ2NVNXZOWUNTaUZqOENDWTN1WFA5?=
 =?utf-8?B?YVh2dkpWQmx1YWJWRWs3MUtKKzFPK0p4Mkh1U2lCckwzOXJBWVRJd3dNNzRv?=
 =?utf-8?B?Y0pTbXRCem4wRDRqaEI3SS9wRXhkSDh3V1BDZVQvdzRKYzExcmxZYnJDQ0dn?=
 =?utf-8?B?SkhuUThVM2ViLzNpR3hJVWs2Y2NkMG9obDJlSDE0SjFHWDBSczJwUHV4VUdO?=
 =?utf-8?B?bmppcVgreHA2eExsejFIQ2ZHdUxWYi9keDRMNSsxbE55TWdUY0s0aGRBU3lt?=
 =?utf-8?B?dkhCbTZxT0xvcUM4SmVpY3BLUTcwb1BKZDRiQ1V4cUV2bUJ3V0pBRDlZak5R?=
 =?utf-8?B?elBCVlp5alM2eE9seXU0ejlsVnFEMHNVWUNZZnc0WWlhcWFhNkVEOXVqYmhi?=
 =?utf-8?B?MmJsYUVKcmh0Wll5a29xd204eklzdUtZNGdtZUdsbzFTNmpNbFZJbkRGNWVz?=
 =?utf-8?B?cG11cnJBdUUzSGdobVd2MDE5dlhydE9lWlJUMXk4dE8zRUFqM2htNHFuODNm?=
 =?utf-8?B?MHJUdzBxYmt0QWtzMExhYXdpSGxKbnlJOFJQS051b2dNTUJ6YzMvQ0Jzc0dx?=
 =?utf-8?B?cEJkdVFXYjNUZmp3UWZuK2I0YzBMMEh0WHdTYzFwUGltZzBqVUxhVHpRUEZa?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d9a59d-90f1-4a86-9255-08ddecaba9ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 18:40:19.1474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sRNpDCjAoyTGbpKAz8Imi9t3nnpkt8V09Ccveg23YAiJKN2rc2hRmC2CQEhFgLg8DU6AfT9ojo/tihZEj5igmJHiQKB4GPyBFk+n+vrC7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
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



On 9/5/2025 8:22 PM, Gustavo Sousa wrote:
> Quoting Michal Wajdeczko (2025-09-05 14:36:25-03:00)
>> In addition of checking if we are running on the BATTLEMAGE,
>> we should also check for not being a VF driver, as VFs can't
>> access necessary registers, and doing so leads to:
>>
>> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x0
>> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
>> | Call Trace:
>> |  xe_mmio_read32+0x110/0x280 [xe]
>> |  read_residency_counter+0x42/0xd0 [xe]
>> |  dgfx_pkg_residencies_show+0x115/0x190 [xe]
>> | .. [drm] Package G2 counter failed to read, ret -19
>>
>> or
>>
>> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x0
>> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
>> | Call Trace:
>> |  xe_mmio_read32+0x110/0x280 [xe]
>> |  read_residency_counter+0x42/0xd0 [xe]
>> |  dgfx_pcie_link_residencies_show+0xe7/0x160 [xe]
>> | .. [drm] PCIE LINK L0 RESIDENCY counter failed to read, ret -19
>>
>> Similarly, there is no point to expose inject_csc_hw_error on VFs,
>> as HW errors support is already disabled for VFs.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Soham Purkait <soham.purkait@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
> 
> I posted a very similar patch[1] ~1 month ago.

oops

> 
> There was a spec-related question from Rodrigo, for which I could not
> find the answer.

I guess the answer in indirect - there is only small set of registers
that VFs can read directly, and above one 0x35b004 is not on this list.

Bspec: 53221

> 
> [1] https://lore.kernel.org/all/20250729-skip-residency-debugfs-for-vfs-v1-1-3c5edec08c8b@intel.com/
> 
> --
> Gustavo Sousa
> 
>> ---
>> drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 4b71570529a6..8be8304cb05c 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -346,7 +346,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>                                  ARRAY_SIZE(debugfs_list),
>>                                  root, minor);
>>
>> -        if (xe->info.platform == XE_BATTLEMAGE) {
>> +        if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
>>                 drm_debugfs_create_files(debugfs_residencies,
>>                                          ARRAY_SIZE(debugfs_residencies),
>>                                          root, minor);
>> -- 
>> 2.47.1
>>

