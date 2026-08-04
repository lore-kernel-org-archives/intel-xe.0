Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34ECC55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 16:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B6810EB19;
	Tue,  4 Aug 2026 16:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKypuGZr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0E910EB0E
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 16:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785859341; x=1817395341;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aHBnNMMlEYVjinkN4mrEITTKH2qbYdT03FuZjOMXmm0=;
 b=UKypuGZrkK2I+60y5/Rl3aD7D2CjNLxQg0Le81Erm0Mn43eQ4eLAF+bm
 XDRBaOWNEQBz93mm7Am4e3x9Fa0AwsWiMrOzIlQEV0kbAwiPBe1lYhOc+
 3+fXgKDuBO/uBqgk1Ls7zV5OfxPBjIVZ/0hKJzkdT+juWmAed/Orr9dUx
 6RjTQWEECq/ECOJgPEf8Sx0UFjnQ0BXVn1L2dQ+p2vN8iay31cjm+5W08
 h2nj8OOchLJmhoH/Ifwn4rQWj/7/bI0nupDZzKC8Prd74CP7N9ixRaf+p
 IJo25onCltcsD7HTF3j//PzygGN+Pbdhqiunc0co++eZStqH8pJSZtAps w==;
X-CSE-ConnectionGUID: KY5kmLwiTmCxPf0POhv5qQ==
X-CSE-MsgGUID: MUZyj/CGR8eCWTFRaHBnOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97008867"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97008867"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:02:16 -0700
X-CSE-ConnectionGUID: vXRc/jVAQa6/at3VnkJMtw==
X-CSE-MsgGUID: aV2umQ6ZQzaQ/aWmO2Cz5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="266665770"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:01:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:01:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 09:01:01 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcAH4demmLVQJnAeboQJoR7W48Lnlbbe3mWSZDTfzz7jBLG5ipwAeoUDpp0AKqcZZz2NoFOvusMICyJHL3rHvMF3gkujHGG3bp78qEtUZQBm2h2A4yTT6Tt7Gjp0STY8EAjOx0Z7QGHhLcoWyE2QApE6NJlyVDKQ+alT6BUjNY2jUT+njDFNH8vk5Psa0afnsXZnt4rIeMfYVDJ5VD6DrLHKjWqke7mQdwWP+hBf9Z9nFuq1aWQUemAxe6UjhRNQ535F5UVfYQEtJYg/MSZ2NBL6TNX1/4P7RT7t6pxxhf4VoUqj9JQbT/YzwFsebT4tEJWKkFoAtKRfTycCQcC3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOM8lSeJ3B/jRjlr7qdiZ9c9ml8Ztsq+M8ZfSDgKWSI=;
 b=oKpvfIBPNuCLtk8zJlOrs8CwZCQRoXI9LBKy3Wn9ewHJKDDeBUMj3TtHRrE4q/LY66YcI71pueDbfz9lU9jy8uud3kMs4bPeHn9TSCYXyZW0VKxxn8pZzkrGgyMKRAX8wSydxQJhmpTFNHqP1Ez7AUU9QKpcsA6LRpScHJ+AmtPifLTPsTKq49aUruCauEVGLCVxjMsHNti1DvZdqORkgsfcYrgC0GplVHq6oKVQ2YP48I6Ww4vAvRAWINGBEZZx7WHuLwwJ/kUi9K2p5/wjhRijHiGONSTzNZ3HNCAl8e37OQlmSwOnxLPBwPwfb2gw1Lqerz+62WBM26gIHj2Aqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Tue, 4 Aug
 2026 16:00:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 16:00:57 +0000
Message-ID: <1d19f766-b3d8-4846-a7a7-cbffc8da436d@intel.com>
Date: Tue, 4 Aug 2026 18:00:55 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZTogQWRk?=
 =?UTF-8?Q?_structured_SIGID_error_logging_infrastructure_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <178542826381.5683.18273263562090224594@61270ab9df2a>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <178542826381.5683.18273263562090224594@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0150.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::43) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df846d8-616f-47ae-a9f8-08def2419262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|5023799004|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: V514o9a2U23ItfVL26yocwfdJVFnH2Vj0AcXKDIV7xrOWoG28IhmD+Kjn4OL3fUlntM6EzYPPcORK6i4msqPLKLWzGIuJtLmHBdADpuDgeR+mT3PyHodznQVyCSAalUhU6rD3Vi+F33FLf4NdSfc1/yAbOYa4wEOKi47h9dHsJF34X+gnEw9RUQHez7N7nifrW2t8NVXQGNFiVVJI96xrstQ1xOnrz7lQ8GMUU4rNqI7olFB507qlE28tEZDJ35B2m4xu5bmdTBdjO57DAK1m2potJ382NjUot5qvbabjyB09skVIQIAlr3VtOPmnl8Wo1hIWJNCcH328IcoNbGXe7dxa7L5ezNtRzyrTyX7Kdc+nGzJDFeZsQXcwvb6ovfVGs3hIoFTRy+PMo5sozJzmTh0X25EKrr8IpzX0y8eTv/GTnVIZnW14By5DwADpbORcHtkyvAVxiTUKxQsVhssieVg1h1hSyktiU4lrHncJRVz13nnoGprGtZVCsMqgF6weXHH3W6bhntVWWZZYNlCk7AhA3eAQ22Mk4CmVMEt2WoVo6nguBfDHAyMNYN1uKu+WU+W4pHSrwAWD0IhZASI6Pf1x+XoFs/2i5Mibh6iv+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUt6TGs2aGNUVURoSGlOVjMyYVMxVTd2ZGs3eDRlRm9xcEcrRGVJM2VnbDZ1?=
 =?utf-8?B?UWZHcVl6TjVmb2YrNDUwbGtwQU5jNUg3a09SQmtaenVZTHF5eEw0dlBxK1A1?=
 =?utf-8?B?N2FzbnNVVUw3VVJQZS8wN25mci90Q3dKc2xvZnBLV29GU0NiZnd1QVlLZHN6?=
 =?utf-8?B?R3A5b2QzVEFCSzJJWkxVQnNTN2MrVjVYT0xUQ2YxNmZ6TE5FY0s3enZWRnow?=
 =?utf-8?B?ZmZtT1ZxbFQ4UmFjeGRCQ1owOWNQQUp6STYwcms3aVd6V1pib1VZT3E4WFZP?=
 =?utf-8?B?NGpZOTBSUHpTWitkY2ttaFQvOWhCb1JGekxubjk0RURPaDE0Q2xiZlY4aGpD?=
 =?utf-8?B?bytDRi9WMHBneFlmNW9oWjdGa3Ara0trNFE3L2xGQTRLaUFiV1dxZ2NkcSt3?=
 =?utf-8?B?WkRZVkNxMTB2cE4xdHJaWm91bGd6SC8xRVZUeFZ0azBxSGVHSUlsMHMrMnBS?=
 =?utf-8?B?Uk1JNm1DckZQblNEcndHY05JOWdvWUg3cVdkb0lYOHV2STByUjZzaXdHWkZK?=
 =?utf-8?B?S05BNHJsTGRXZWN1a3haL0NnV0RrTHlPbk1vSHliUW9YZmFUVnY2d2dQdzYr?=
 =?utf-8?B?VVk4WmUxdXNaMCtyZThvbGJIM254YUNyVHh4R2JCMTRxYTlLWGRneUxvR2h6?=
 =?utf-8?B?bDNkVEEvN2lseS83RTJKUWlBckRUWUhncHdkYUVIeW5vclk0U2dMMGk2NFAy?=
 =?utf-8?B?RXlZMldMYUdlZmdxMGJFcjA1N0ZpK1M3VVVHc0dNN2dqMGF3SEVmSlQzQWhi?=
 =?utf-8?B?NXZLbTg2UGdxUnljNlE3OUc4eDFmc2o5UG0xV3pDZ2hvb3dydXp2MTdLbTVp?=
 =?utf-8?B?NmEwRlhIRzRrRmJOVVJpVXZoYnNJOUtnRmd0V1RrMm15NlRkeEJES2VIUjBW?=
 =?utf-8?B?TUdaZk1jQk53STFaK1VQTFVKZG8xVlhMVnJ2d0loSllvSk9tM3pTZVI3bWtV?=
 =?utf-8?B?NGtPWFdJRlFUSGJ0Yks2bTU3dVE3VkNKOVNLeHI5YmlZRDF3WThFNW04WTlP?=
 =?utf-8?B?WlJyQ1JTdTY2cHVnNzR5RmEwK200ZWtYd1ZjUFoyN3pHNjlqRTR5VEZQYUg1?=
 =?utf-8?B?R3QrZTBHTDlYZ1R4NWtQRlpONE1rb3lDS3U0QmNYMllQQjBtVzdRek9qaHFN?=
 =?utf-8?B?UmlUV1M0UFd6Mk9mVXh4YVNrTTJxelhjdXZYMjRzYmhxZ2R6U1dqbUkzVGsy?=
 =?utf-8?B?R2NVOUhHbkZBUWE5WUprd3JwYnN1alY2NzJYREk1bHl6ZGQrWXRnazMrZEJo?=
 =?utf-8?B?NTNjRlJtdGE4cEJDZEFjUW5MTEhRZzUzc0wvUkNxQThpVkNqVy9SZTdWQUh2?=
 =?utf-8?B?dVluVUJPeDVJa0tSYzk4SlVZajNtbXNPM2RzQ1JNZkFZSkFLa2Rabm1TLzlK?=
 =?utf-8?B?K0JmOUlYNm96YytsWUdJdlVkT2R4allRNkVPaC8xcWdDSWtBZ1oyQjBkOVdn?=
 =?utf-8?B?Y3FIakluWlk2RjFkUGlGNkcwTENKaFlTUlU3UlNYczd2V01aYyszZW9WMFh3?=
 =?utf-8?B?eExxdW9xZWd3d2g1WFVXUVg0V1RIOWx1MFdVeUdGd0JFc0c0V2V5TUhoZUZo?=
 =?utf-8?B?T2laeTVlclFKV1dnNzdaWmgvWUY5QnlSQ1ZzZWJHWVNWQzVGMUJxUGYzbDZt?=
 =?utf-8?B?WitERXJVRzFTNjdPcHdPQUlwN1hJQU1YVy8zYitvWTRFRENTTzFENXMxeGR2?=
 =?utf-8?B?dkNRYU9HQXh0T25ITmdwRHZWSWRUcitwcUhOYUdmZGZGbHBjRUExVmJtbjNJ?=
 =?utf-8?B?MlNEbXlBYXMzb2toYVZqN05BRlk0ZnNUMG5YaFVtU21LaEpHb3M3ZzNDL2lS?=
 =?utf-8?B?akl6Z1pvWWlvbzZ1K3pSK1pIMjBqUy9NTDZJUUw0dVZKV3JYQW8xN3dNbnd0?=
 =?utf-8?B?Rm4vNGJuYS9ISXZzRnlDbDVaYXVVK2Z1Vi96WHR2R05IaXAvRzRZUGE0Mmlp?=
 =?utf-8?B?Z0QvOEVDMm93b1dTbExPd2NMSkFEKys4dzA4dVR0NTFORmFGQ04rb1dhYjBl?=
 =?utf-8?B?MHIrTVZUVURaZ3JCM0wvc3dSKzFObEpJajFWMEp0UGpqdHhpMGdBWjM1NWVJ?=
 =?utf-8?B?eEF6QnRrczdjQ25xUWZCSllvcFg5YVprSksxQnpWMks0REEwM0hPalc3czk0?=
 =?utf-8?B?UVNEVjBEZ3k0Rk9abEtLUGZhdUVJSzUwNEJxZE9FVHp3cXIzellLL2FkODJp?=
 =?utf-8?B?bzNrekRTbWkxa2FKOGFSd0dJOWNjU1BZSzlFNTZlMjNOdVRXbExaMURMSkVD?=
 =?utf-8?B?aEtVSXFnK2lVWEJMSkhYTEpzbllEMEExc251Y2owMGF0RWdmWjF0ZjRqcHV4?=
 =?utf-8?B?V1NyRTlpZGxnZjkvcUJNbnVRTWJySHNaT3NlbDErdFpKbytnUnk0ME5wNzFJ?=
 =?utf-8?Q?EAN7UvF8/KDdgAaM=3D?=
X-Exchange-RoutingPolicyChecked: ZHzfhQ8HB6793R67+uw9aTkF1bbegXM0uXq0TkBNvSv5RYHbkcfADaLxy55+OUu3cv/jpZrUL4p+v7g0CTqXLCOXROaRi52ME04+yo8JTtYN1Lp7dq5qCB/diROaG/esG7qtikeReP2foIumFI645qvYSvcKC/dhV8ttpsbNKMJWVxEpGR/UJXbJAqBBMjAE3BgjEohBI3cxnWZ05gIG+ZW2OXHoZLjkGAV7W1jwWUQ0TJKYz7lb9lUZ/o6dec7nRhQjNw9Wbc6FSweNdc30vFawEBHIsuNbVu0Cy+O6HEe0ErqRtkG9HqpsDr0o6JrDUypHfpVaq8mU2AJVbWRAmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df846d8-616f-47ae-a9f8-08def2419262
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:00:57.9079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQurSAhDqx+dMlIArJ/axJ1k9ctsGznK6Qm8QuK7cj8tx9kKc4UdjoU8v83lRGQ3C0BWs0N3MubRIqwfoKXWPj41phGL0Jym9U5QHJt0WgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
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



On 7/30/2026 6:17 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Add structured SIGID error logging infrastructure (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/171022/ <https://patchwork.freedesktop.org/series/171022/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/index.html>
> 
> 
>   CI Bug Log - changes from xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd_BAT -> xe-pw-171022v3_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-171022v3_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-171022v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (12 -> 12)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-171022v3_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_exec_fault_mode@invalid-va:
> 
>       o bat-bmg-1: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html> +1 other test dmesg-warn
>       o bat-lnl-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html> +1 other test dmesg-warn
>       o bat-wcl-1: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html> +1 other test dmesg-warn
>       o bat-ptl-1: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html> +1 other test dmesg-warn
>       o bat-ptl-vm: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html> +1 other test dmesg-warn
>       o bat-lnl-1: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html> +1 other test dmesg-warn

a kind of expected new error signature with just introduced SIGID error:

<6> [153.466714] xe 0000:03:00.0: [drm] Tile0: GT0: 
	ASID: 538
	Faulted Address: 0x0000fffffffff000
	FaultType: 0
	AccessType: 1
	FaultLevel: 3
	EngineClass: 0 rcs
	EngineInstance: 0
<3> [153.466720] xe 0000:03:00.0: [drm] *ERROR* SIGID=107 (-EINVAL) Tile0: GT0: PAGEFAULT: Fault response: Unsuccessful
<6> [153.477174] xe 0000:03:00.0: [drm] Tile0: GT0: Engine memory CAT error [18]: class=rcs, logical_mask: 0x1, guc_id=2

previously all this was reported as info level:

<6> [157.848707] xe 0000:03:00.0: [drm] Tile0: GT0: 
	ASID: 538
	Faulted Address: 0x0000fffffffff000
	FaultType: 0
	AccessType: 1
	FaultLevel: 3
	EngineClass: 0 rcs
	EngineInstance: 0
<6> [157.848713] xe 0000:03:00.0: [drm] Tile0: GT0: Fault response: Unsuccessful -EINVAL
<6> [157.848773] xe 0000:03:00.0: [drm] Tile0: GT0: Engine memory CAT error [18]: class=rcs, logical_mask: 0x1, guc_id=2

>   *
> 
>     igt@xe_exec_system_allocator@fault:
> 
>       o bat-wcl-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-wcl-2/igt@xe_exec_system_allocator@fault.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-wcl-2/igt@xe_exec_system_allocator@fault.html> +1 other test dmesg-warn
>       o bat-bmg-vm: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-bmg-vm/igt@xe_exec_system_allocator@fault.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-bmg-vm/igt@xe_exec_system_allocator@fault.html> +1 other test dmesg-warn
>       o bat-ptl-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/bat-ptl-2/igt@xe_exec_system_allocator@fault.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/bat-ptl-2/igt@xe_exec_system_allocator@fault.html> +1 other test dmesg-warn

ditto


> 
> 
>     Build changes
> 
>   * Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -> xe-pw-171022v3
> 
> IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9def49b752b509dfd5fd
> xe-pw-171022v3: 171022v3
> 

