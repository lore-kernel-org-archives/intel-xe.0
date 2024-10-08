Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1ABCEF16C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 13:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEB410E52A;
	Tue,  8 Oct 2024 13:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntBgKU6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4E110E529
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728393097; x=1759929097;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gRqEX04MsUuENUyvro0s5eQi+EZ6XZui5IpGeGr6RGU=;
 b=ntBgKU6h59scJQojDxKEqLtK3A2oEnLbEDs2svRVlD6HJdu/GYf87gSg
 gXE9N7p6amhIY7rPBNgK1lwyfNhpdZ5L0U9kAgZ19brWFHav6pdjtc4Q1
 2LaeJ8KNcT1Xax9AwUVrbUqYdDKeZbwtYoY6GdpCBc5mb1ilyeN4T54HI
 s1lvqGEHnuESJU+zsAg5tWEWR0UovSuGh0OEd6qJtnhMG90uGkFfG1q7D
 fGXlD3GUAJU4/srFOM3Sn8Lmf1avA003U0d4t1KedntUVCo5988DKROr0
 HGP6QFafjRap5qb00toTupNs8nsySfNy/Lk9lrRspbYK6uKjqpEm3xSJL w==;
X-CSE-ConnectionGUID: 0smSC7HaQS2AwTAM/9Ayew==
X-CSE-MsgGUID: RLXI3I2iRhSKmceTT/3PfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27706869"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27706869"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 06:11:29 -0700
X-CSE-ConnectionGUID: JOr9GUEuSWi/5ly9wXysuQ==
X-CSE-MsgGUID: 371hKIpWRZySCdQMLuCp9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76664840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 06:11:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 06:11:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 06:11:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 06:11:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 06:11:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dK214nGuwnN3+oMN3htJQLyBRaxmtegR/C/fw3FB63JI4Lv8UUUF61RPxHMfEeIfkbWtf+kJbkmvJtQXePhKcc1J05YFohlEMe71LKuv3Au/JnnU9NXECpp2ldwf5KWGjcy7bXRIKwM4hXLcuokAYymY035diLjiLtKGRB5SzLH8wWS914E1CYrg2/HNdqn3uvm8YsyPh023BtMtG2fOOxkd0PZJRKduhhdpejbGN31cZC6YaxaGbPGdrM/FNnnj38U1MvoU0kJ4zUK00QlzTLeFDTSNW2yyVPi/0cmFLxZxP4cjsRIK5y7nyXUtcrIw3/qTy/qk1BOgIL3y48pg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPn8MXRVwET7gjkFolfI8TrUQxTEw0vpY4Zq1rzaUkU=;
 b=oSBNLJLA/rbeI+mH8tvmR/Wrru7ASRsbd7tyH2E9UMdk+qbI/a2t24ZiZsGczOPmFkM8MXRABJMPZLAJYL0l5dqFc0poqVwnnUIawsguj02O4GgMHxmHfTHGqsQTyl+HwW6kS3pnYsQ0x/jqPknDF3AADqnWuB//e/AVEYs8hLA2/XxBBlOyYi07ydKqdqd/H2ix9tg4MCwfSrk5Il62IsqK6PuZzKGEvnVcXZWkOPgtAQhG+3OgqDywZINnw2//Mu5W/hFoKi0AC33/i2E+i1wWapgJ/RXO4L3X11xP4qEGX2v9c0N3K+2iUY7STECYVHKqTExeqfzNodnYXjf5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 13:11:22 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 13:11:22 +0000
Message-ID: <4fdfbf82-e975-4370-887b-b8c7e95098a5@intel.com>
Date: Tue, 8 Oct 2024 09:11:19 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Ad?=
 =?UTF-8?Q?d_GuC_based_register_capture_for_error_capture_=28rev28=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241004193428.3311145-1-zhanjun.dong@intel.com>
 <172836878258.1201797.11469497984606430703@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <172836878258.1201797.11469497984606430703@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::25) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: b660fca2-8527-4dca-8d14-08dce79ab490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N01xajM4ZERuSHdyRWZHMlZaVHJoMThnTVMvYnZ2NUFtb3hPKzVqUDB4WmpG?=
 =?utf-8?B?Um9SenJyTUh6eThyK3plTzUwNEJObVRVVUJiR0ZibnBsK0VDY0lpNUpzazdJ?=
 =?utf-8?B?QWt5enYzbmVqMm9KRDV0SHdMYVhPVld3Tm9JNTdpU1BTT3Iwd2IvbFlnWmhL?=
 =?utf-8?B?QjNIdGtEZmptVjRvRkgvUXVOelhpcUZCeUtjWGlydnhidTRaMGQxVHdzeUMy?=
 =?utf-8?B?UHNVd1k5TGM3YlRlZUpQTUJxdkVGb3JHalAwT1dHbERYSERkOWlSdDgycUJM?=
 =?utf-8?B?WWE0Vy9Xd0dLek01TWgrSXhNbUpaMlFNRWFFNGNUcXhsNkZNdlBDNm11emtu?=
 =?utf-8?B?NmlCcmxHTExsdVNOZFAxQkRPM1lJWVFiOE9IUHFmM25GRC9LNnJjaGF5RFV1?=
 =?utf-8?B?MkozUFFvdWRXOURKS29LbjNtdXpMNzRFL2Y5R3hlTjc4aS8xcGEwckxlRDdx?=
 =?utf-8?B?V0htdzh3d1pjYVVjQ2xRUEpVSGtsbEJmZ2VjRUFZWWtFWGN1Tk9Fbm94Zno2?=
 =?utf-8?B?TlZnN0JkQVUwWGJuQUhweHBIZUUwUUdCQlRMM01TcVl6UjRSdDBlMXl4Tm9m?=
 =?utf-8?B?UUVSR0pzdks4enRma1NSMWwxU0xvT3VrZHFKU3NoMXlkMlFEQUQ4a2lnSXNZ?=
 =?utf-8?B?czFCM3pZUkd5OHRFVDVuSWh1SG1SMS9jZFlYN25HS2U4Q09mWkZ3NVByNjBv?=
 =?utf-8?B?R2srRVJRK29EdERKcXNqcEJSREtabXlBbk5TMUNEMG1pOHU2Y1Y2VDg3SVlj?=
 =?utf-8?B?bWxESHZvOWxTNnVCY0dMeXl2WDBiNUMyTEpuTURRREcvckZzRnUvdEZjZVJt?=
 =?utf-8?B?R282SksxUUl6a3c1SE9OVTBDOWxiUUVZdzc1WmtReUliZnovTEUyS0JrS0Mz?=
 =?utf-8?B?cXk3VVNod0FWN041VmoydFlHVytYMTV0SnFRdFBqa3lZY3o4N1o4N21YeGZP?=
 =?utf-8?B?VXhGWktSUnNXdFFJUDBtL2FzQ1dCaG5sd0VyRmh1MzJnZS96Z0E4cHVFZVNl?=
 =?utf-8?B?b3U3VGVDdzFHVXg5VEFTMi80d2xkci9NWENlcmNXZzA1V3JSN1haTU1WTUtI?=
 =?utf-8?B?VUFSWHNCc0dQMGhpZmFxU3ZnZjBpM2M4dmgzY3kzUWgyWXBCUnhzS2x3aFNM?=
 =?utf-8?B?MmVUeUk4MStZTXpRVXAzVUtBMlh1UXd6bjNmREY0RVc1MTN1bHM3SmNKYnRW?=
 =?utf-8?B?SmIyYWpiOTJEQ2tiNWpSMjNudUxMbE5BSnMzS1plZEJUT3lRZjY1TFY1SDY5?=
 =?utf-8?B?aXhBMXBRNjJrMHE2VkwxR0Y0bG44LzJGMytDTEZPbGM5MXJNaVprbUZCTy9E?=
 =?utf-8?B?K1FHZG8wcFdEVjYrVmhrT3VkTmN1R0dBN1hjdmNpSCtqZGp4WTlSM0Iwa25j?=
 =?utf-8?B?K3lVa2N4djhYM0ZUSGkzZVRVRW14MWdlTHR2S252UjFYOUZJcllGL0w2aGlM?=
 =?utf-8?B?K0FIbVhFaE0xbWlpeWJLSzBTQlNpYzExa2pQa3lWSUp6ckhHKzlnV05XMTVo?=
 =?utf-8?B?a2U2bGJQc1Q2N01HWTIwNE0rNWNzaGFBS2tGUEwrNVFBY1BqSVlGSHA2MU9H?=
 =?utf-8?B?cmdscjR1NlhvU0FJVThJbmdxRXpWUm1va29EVitOTHRkR2JrWGo4aFUremEw?=
 =?utf-8?Q?yVnO/Yj8IxT/lHeB//pMQ59RZzvS6pSdaKiVuk6enIBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlY0QWVnMTdwdWNlODFTN2I0K0lONEJhQnEycnZVUWh4U2wvYmV3Ym1VMWxP?=
 =?utf-8?B?WnQ1UmFHcEZEbEVZWUsrQ1FwMlNGWnNDc1MwT3hjS2VDRjVadi8vRm9ybDBV?=
 =?utf-8?B?UXhrc1lKTHdCYnFnMWVlS2x2dHlNaDdIK0tFTjdLbjhnNWhLTVQ0bXNwb2RD?=
 =?utf-8?B?MDYyZFFrTzVWOHJINk9laFZKb3g5UzdFWVo3R2RhL3IwVnRRV2tZR0dZb2FP?=
 =?utf-8?B?clZKUXUrRGxSU3lEVUowc0duKzVYOXN5OVE0dElRL3IrOXNEQUM3RTZkVWtB?=
 =?utf-8?B?cndmZFpEcnQvaGxKd2ZtSXhwcUcrTXl1OGdwZzBWU0Z5Y1FPN2RMeDZQM3BY?=
 =?utf-8?B?M3k0d0lwTkF4d0xJTHJwUFhYVEtkVUFlQTVlMlBXZHgvZUlYN0Q3MllzbXJU?=
 =?utf-8?B?K2RUcXZoWDZubE5OVXhLam9BdGpLUUQwbmhLY3JqMEJ5WmhUVko2cE1DK1N2?=
 =?utf-8?B?ZU5zNXFlb1pEVWFDODRyejBicU1rMHlkNnBhK0FoVXpGT09RcURkWE5ML1hW?=
 =?utf-8?B?N0ZjUDBFWEUvK0xWVWRrenR2NTVaTEwwZk02TzAxS1poY0ZmS3NEc1ZqQUlB?=
 =?utf-8?B?d1VyRFBKZDc4UnY4bGdURFRDWmwwRjhNSDVVKzNSaU5CNUdYRDlTdjYrK2lv?=
 =?utf-8?B?UUZDRUYrekVtaS9OemhqMGVGNitSZU5iUDVPd1BmZ25jNEI3MFlmMmJtSE5G?=
 =?utf-8?B?UEh4L0IwaEM4RDB2bVkrNE0vSWQzRG1YM3ZYd0o4cW9GQWFiWkJKU3MzbUtC?=
 =?utf-8?B?NjdSam80ZitLTmFzQWx1QmIyZGFSNERHTmNkcGt2QkNMMWtUeUJsaW9xWDgy?=
 =?utf-8?B?Rkh2Y3JuK0UvbFFhcmVCb0E3cGRFTElzMG1WMzl4UTkreW9RRy9RWEUvODQ0?=
 =?utf-8?B?VWthV1Z0QzNvUVJPRDVzNTUzNHVmSG5CZlM3dHdQV1ZxZzJYcWpOLzF5eXQ1?=
 =?utf-8?B?YjN4Nm9TVFRsbitWb1hXWGhJN0hhNzB5QWFCMFZ5bENpSU1QdDY0YTlqeXl3?=
 =?utf-8?B?bDR6SVl6YTcyWUJpZk1Kb0R1LzcvNWpNT1VzRUIrMThHSTU0MGZOcUQvS1pQ?=
 =?utf-8?B?emU2c0t0WXZyQ3J2ZTVnRGp0R053V3h3Sk4xWUxGUkE5Rkh1UFk3c2pOSytD?=
 =?utf-8?B?YkdmWllhQjJwSTZuSVN2b1c0NlJ2Y2hVTlZ1RXFyZzJkaVNaaVhseGZpVENj?=
 =?utf-8?B?QmxhMDdPaFpIWXUvREVieFV5ZkJmbFhZQmJEbUgrR3ltekhhSElBK3RRZkV4?=
 =?utf-8?B?anJQaHluWUh4bWd4blk4QUE2aVl0NmFqWEg0NDI0L3lZKzVUR0dWcU9hK1Fm?=
 =?utf-8?B?dm5GM3RscFI1MGNQSERFUEM4d2R3cnFibVVpSGo0QjFQNWVnS2RTNlBUSWpK?=
 =?utf-8?B?eU4vWFZGQTlZKzNwK3p1M0IySEFRUm03cHQ4eVF6OENCaDFlc2wxK1Z5U3du?=
 =?utf-8?B?d2pzWVMzYWw2dzMvUkJRTWQyaFpmaS9JZmh3YTlxMk8wTkFMQ0F2MFB0SEd2?=
 =?utf-8?B?RC9MK2VoMDNVWGdMSnZZbTFheFVQNEF0cEMxNXFaRk5CcHhiTXNhbVBhWURW?=
 =?utf-8?B?QS9oQ1BOVC9FWUZUZ203bW1BZklVaWpmMHlnWElQRUxmRWJqL0lubU1mekgy?=
 =?utf-8?B?bWhaM1JPMGh1ZmZVbVFvZGZpRGJ6RXFCQ3NieExsMWtEUnp3SXhkaVc1c0JV?=
 =?utf-8?B?ZVdNeVhDSlZiTVA0cEsrSXZBVlFBZU9ScElRQTFEVUc5TjRxTUh1NUI3Z0d4?=
 =?utf-8?B?YmJxVW96UmZwNWdHaWlOVHVyMHRyaGsraUZtZlJ5cGRHOFpYMHFUNlZybmhl?=
 =?utf-8?B?UmVlL1pzaXcyb3ZUWnJqMnJwWjBYNnZPeExTV0o1UlROZ01QZStIeFVycHF5?=
 =?utf-8?B?Yi9Nd1JoMVNuVC9LVUJWd0Q5RUhXaWNkWVpia0QzQ2t3ZlphYURlSVJoN1E3?=
 =?utf-8?B?aENoaXp2TzBMb25qRzJEaGJVazRZYitsR0RvZDZrOUNvOFF2OWFBeVFQd2g5?=
 =?utf-8?B?amZxWnFhRWVQUnA3T0FLeXRJMUwvU1Q3L2JYWWNac0ErVW55eC80TTdIZmlT?=
 =?utf-8?B?cU0rSnJQR2Z2N0dzRWpKb0dkcVliRlF2WVpOdFp3SmhGYWhMbGpSRG9laWxr?=
 =?utf-8?Q?pd4bAcriauy1IlQ8gfpGLJ8lJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b660fca2-8527-4dca-8d14-08dce79ab490
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 13:11:22.2678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHEgZ3URGaEEg5PvWfV/x9ANmR23dA3HxRbjst3YAHcH8i6EGcG4/2vWlra38hYUIeg7rNOBGZEqUeasALKiSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
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

All failures is not related to this series.


Regards,
Zhanjun Dong

On 2024-10-08 2:26 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Add GuC based register capture for error capture 
> (rev28)
> *URL:*	https://patchwork.freedesktop.org/series/128077/ 
> <https://patchwork.freedesktop.org/series/128077/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965_full ->
>   xe-pw-128077v28_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-128077v28_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-128077v28_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-128077v28_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html> +2 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-edp1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_flip@flip-vs-suspend@c-edp1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-2/igt@kms_flip@flip-vs-suspend@c-edp1.html> +1 other test dmesg-warn
>   *
> 
>     igt@xe_mmap@bad-flags:
> 
>       o shard-adlp: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-6/igt@xe_mmap@bad-flags.html> +1 other test timeout
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> +3 other tests fail
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-128077v28_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (Intel XE#660 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/660>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html> (Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +23 other tests skip
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking.html> (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +13 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-0:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#1407 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-adlp: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +10 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1 other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +7 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +33 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +50 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +90 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html> (Intel XE#2669 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +25 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +12 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test fail
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-435/igt@kms_content_protection@lic-type-0.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> / Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html> (Intel XE#2321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_cursor_crc@cursor-random-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html> (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616>) +1 other test incomplete
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1 other test skip
>   *
> 
>     igt@kms_display_modes@mst-extended-mode-negative:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_display_modes@mst-extended-mode-negative.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2 other tests skip
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +10 other tests skip
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +7 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +3 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html> (Intel XE#2899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2899>) +1 other test abort
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +3 other tests dmesg-fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +17 other tests skip
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +2 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +45 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +34 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +36 other tests skip
>   *
> 
>     igt@kms_getfb@getfb2-accept-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-4/igt@kms_getfb@getfb2-accept-ccs.html> (Intel XE#1339 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339>)
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html> (Intel XE#1470 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470> / Intel XE#2853 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853>)
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-6/igt@kms_joiner@basic-force-ultra-joiner.html> (Intel XE#2332 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332>)
>   *
> 
>     igt@kms_plane@pixel-format:
> 
>       o shard-adlp: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_plane@pixel-format.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_plane@pixel-format@pipe-a-plane-3:
> 
>       o shard-adlp: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_plane@pixel-format@pipe-a-plane-3.html> (Intel XE#2078 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078>) +1 other test warn
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-b-plane-4:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_plane@plane-position-hole:
> 
>       o shard-lnl: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@kms_plane@plane-position-hole.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-b-plane-1:
> 
>       o shard-lnl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-4/igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html> (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html> (Intel XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +7 other tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +13 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-pr-primary-render:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-1/igt@kms_psr@fbc-pr-primary-render.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +18 other tests skip
>   *
> 
>     igt@kms_psr@psr2-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_psr@psr2-suspend.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +21 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +3 other tests fail
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) +2 other tests skip
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_sysfs_edid_timing.html> (Intel XE#1174 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-9/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1 other test fail
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1 other test fail
>   *
> 
>     igt@kms_vrr@flip-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@kms_vrr@flip-suspend.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +28 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@kms_writeback@writeback-invalid-parameters.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1 other test skip
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>   *
> 
>     igt@xe_ccs@block-multicopy-inplace:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-4/igt@xe_ccs@block-multicopy-inplace.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>) +1 other test skip
>   *
> 
>     igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-432/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html> (Intel XE#2915 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915>) +1 other test abort
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_eudebug@basic-close:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-466/igt@xe_eudebug@basic-close.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +10 other tests skip
>   *
> 
>     igt@xe_eudebug@discovery-race-vmbind:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@xe_eudebug@discovery-race-vmbind.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other tests skip
>   *
> 
>     igt@xe_eudebug_online@single-step:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-9/igt@xe_eudebug_online@single-step.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +15 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_evict@evict-large:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-2/igt@xe_evict@evict-large.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +8 other tests skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-simple:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-simple.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +7 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-userptr:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +31 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +28 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_reset@gt-reset-stress:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#2895 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895>)
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-435/igt@xe_huc_copy@huc_copy.html> (Intel XE#255 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +1 other test skip
>   *
> 
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html> (Intel XE#1999 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999>) +2 other tests fail
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-466/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@xe_module_load@load.html> (Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-464/igt@xe_module_load@reload.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@xe_oa@create-destroy-userspace-config:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-6/igt@xe_oa@create-destroy-userspace-config.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +8 other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-435/igt@xe_oa@create-destroy-userspace-config.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +8 other tests skip
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> / Intel XE#2838 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-432/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-8/igt@xe_pm@s2idle-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#2915 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915>)
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s2idle-mocs:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@xe_pm@s2idle-mocs.html> (Intel XE#2915 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915>)
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-2/igt@xe_pm@s4-basic.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-9/igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>   *
> 
>     igt@xe_pm@s4-d3cold-basic-exec:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2 other tests skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@crc:
> 
>       o {shard-bmg}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-7/igt@kms_async_flips@crc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-2/igt@kms_async_flips@crc.html> +1 other test pass
>   *
> 
>     igt@kms_async_flips@crc@pipe-c-dp-2:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-7/igt@kms_async_flips@crc@pipe-c-dp-2.html> (Intel XE#1656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html> +2 other tests pass
>   *
> 
>     igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-7/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html> (Intel XE#1288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html> +3 other tests pass
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> +1 other test pass
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#2791 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791> / Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html>
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-434/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html> +1 other test pass
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> +6 other tests pass
>   *
> 
>     igt@kms_flip@plain-flip-ts-check:
> 
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html> +1 other test pass
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@b-edp1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@b-edp1.html>
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-1/igt@kms_hdr@invalid-hdr.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-8/igt@kms_hdr@invalid-hdr.html>
>   *
> 
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html> +1 other test pass
>   *
> 
>     igt@kms_pm_rpm@i2c:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-4/igt@kms_pm_rpm@i2c.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-6/igt@kms_pm_rpm@i2c.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes:
> 
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> / Intel XE#2864 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes@plane-50:
> 
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html>
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-render@edp-1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html> +1 other test pass
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#1649 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html> +1 other test pass
>   *
> 
>     igt@kms_vblank@accuracy-idle:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@kms_vblank@accuracy-idle.html> (Intel XE#1523 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@kms_vblank@accuracy-idle.html> +1 other test pass
>   *
> 
>     igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html> (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html>
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-4/igt@kms_vrr@flipline.html> (Intel XE#2443 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-3/igt@kms_vrr@flipline.html> +1 other test pass
>   *
> 
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html> (Intel XE#2667 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html>
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html>
>   *
> 
>     igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-4/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html> (Intel XE#2754 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-5/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html>
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html>
>   *
> 
>     igt@xe_exec_reset@virtual-cat-error:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-2/igt@xe_exec_reset@virtual-cat-error.html> (Intel XE#1638 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638> / Intel XE#358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-2/igt@xe_exec_reset@virtual-cat-error.html>
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-bmg-3/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html> +1 other test pass
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html>
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-9/igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-2/igt@xe_pm@s4-basic-exec.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +51 other tests skip
>   *
> 
>     igt@kms_psr@psr-basic:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-adlp-6/igt@kms_psr@psr-basic.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-adlp-1/igt@kms_psr@psr-basic.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +30 other tests skip
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965/shard-dg2-435/igt@xe_live_ktest@xe_bo.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v28/shard-dg2-464/igt@xe_live_ktest@xe_bo.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8052 -> IGT_8054
>   * Linux: xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965 ->
>     xe-pw-128077v28
> 
> IGT_8052: 8052
> IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965: 
> 92d12099cc768f36cf676ee1b014442a5c5ba965
> xe-pw-128077v28: 128077v28
> 
