Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2C1C624D4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 05:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC14C10E063;
	Thu,  3 Sep 2026 05:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuTJZ7it";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC1F10E063
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 05:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788415037; x=1819951037;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WxfBlOvWRbeC1una5mC0XZEmWqPSjtGZA92lk3yopus=;
 b=RuTJZ7itJrjX6fBELYeja4LJ5gGtohU/t8U/rv0DhzhDk4z2qSZgwa3e
 RFrFgQDpi5H0hJkRpe4Z3fmoU9MevnURRJvh6cvv/rrs2cuOqbZEbKUxn
 fx5CIjV7ecveHQzG73QJEqMRm3UTh/epT+/g7owj4G88H5uEsII8o54Qd
 Q29egzeIlGOsL76S1h4Yhm/6K9ypUwSIDB8mIeSAprlaOb7IOUHP9CYMJ
 teUurmLZm3EF2Van7Kg/a6u3+nOQeQBy6NHHBS3hgzrNz2XLluy0DkdZd
 4FXV6fXWKe7nakFwkN7027h8LE8Cb8TsiHaE7O3TDmXlVIvIgnN7SZkGl w==;
X-CSE-ConnectionGUID: 5TPiw5KpTx6zW4QqOXLBiQ==
X-CSE-MsgGUID: azGDrsKZQbeU4BxVFYDf3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88759718"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88759718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:57:17 -0700
X-CSE-ConnectionGUID: gyivzxLjTEK+UY6gWU536w==
X-CSE-MsgGUID: g4GbxbXJRO+EIX8TauwUaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="293116018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:57:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 22:57:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 22:57:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 22:57:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTuRq7sFbsOG1yNVmm5NXCZ8yiXuOrE1v76vFepVZlMiFqS9SwCTA2iDtYd6n3EkMs1eiUQNARIbPoKgiACylW2UnTGnhAjUPoJC8qPxHyp/9FWFYbcOLnQrhtJwGqnrih3JCmFMxpUzvdZAWR2kI7bCtJSaIpkVbw+pjblmCRO6mVl2x9somc7c2/CSNx0RuYzB1lCkNETX2MYtOwbQ3J+JlwfdBXGPVmfWjayjsI5D7/kcw8ESNddnD2RW1fxSCEhf7e8mu1sy0v2r+z+oCwY+ZdC1qZnReUt3piEePWqZfmEJxABykwdCNy0U41NQyXGwrEH0Jaizs3i7pypisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VZjXf8PhXBpHCjCTeI3CBEFc5s3TBuTWYkF7USxkV4=;
 b=jVaAu1MKJko6kHJNBBhkZ2gBRbm7CZIuNk1jOKya4iIJXYO69PhvFOJ4gBnzHPzYAOofEoIuh+PnlIXY7OfKuD+4EM8dH5x2oK+3iiAQRf5D6aiaja8/usKq5SdQrsigVwUXT3/r+tZjXC0yENDwuknuXTiL3CuyYbF3tBTGjJsb3s36yTTMTdpX2jCLEvAzhATdmw+2rcRCGobUgJNdWC3mhpLP3q9BjvIsRYewnLEK4ZGIo6+EntRc9VKQv0RVu7+OQUsK2R0KS9wLjltBb4Pnx1/gssnTXQB8kBDl2OZmLTmqD7gacTVyd+ooavvKUtBf4ugt0TohcnnzKFl+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 05:57:13 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 05:57:12 +0000
Message-ID: <eddccfa1-5812-4302-9212-b7152f3f1a25@intel.com>
Date: Thu, 3 Sep 2026 11:27:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] drm/xe/vsec: Refactor platform check
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
 <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <david.e.box@linux.intel.com>, <anoop.c.vijay@intel.com>,
 <badal.nilawar@intel.com>, <matthew.d.roper@intel.com>,
 <james.ausmus@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-38-michael.j.ruhl@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260901192736.626777-38-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::8) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: f3bf4b4b-179a-4452-0600-08df098032cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|10067099003|4143699003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: zn6UfASOAHi/ZW3hLoZhKWo361pwmseeIXy/tMq3f1SHeo+85+4wZmfSRQ0TOJ74odIGBHjIvxUG043nLCM/JsC7kgwRNjUcNykh6rBYgGUVq6wsXVckUdURSKEx7ntHv97YB1iUgTVQWxps1VURDTw0S9K8maVH94phh1ivVjkS+hLrwjQsvFapvWXMjOVYLWiM5bTJUBMFHZfzxePwE5J2LnCtuo4mWwH8XblAUY/efqXRcFXw8qub0zHLiWQUx4s88nMcLk6ou5fD2lOwhRC6LN/wqDtqQvtFD/4ik7J013jfdTYpGBcAbFVh7cgu8ojctXrjU5kfPVGIwYgPOxEgf9k4e1/solakt05T+FuyVUiZ8QeEBUg2B/ob3Y+HkxdZ6gZOsdyTkXNtTtjQpuR/hsk1whj8KgUSM3y+t3rI1h7petkFixTNXi3e+LD+7sz9RYq8Rs46iegEwVfLBfBwoliN+I3aHKVxBsHEkwcSmq4G3U1VGxliF3Aj34BAI4f/LO0mBh3MFclOyllafEkRYcCuSO5rEJPv0fGRp23BBsdP/ru/I/mkt+rIoMhu9ywkH49fkCMkYC03tMIVoivlrwdbR0rwBX/kL8pvj6cWngvI4DsZKixRow9EQZScN/0mVFxVndkUg6YG1ovyKOIy/wb5KdPfZKqIoHkOCrZ1KvAYC3wSbjUBe5lNgkCqeCJ1wNtWYTSbBFNoMPGd1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(921020)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0huWmNldktsYkllUityZFBiTzNBeFhiOElCbDVwUC9xazFMNS9JTldsYVd5?=
 =?utf-8?B?ZUgyaXhqUHZQeHQ4QkVIMnhVa0l2NVl4d2pkL00zTTZZTWNDWnM0UGxYcXNX?=
 =?utf-8?B?QllYZGljelU3bTRxVHBPQ1orMDJXSkNJYXJsZVVSR0Zuc25qYk1aVmFOSmNM?=
 =?utf-8?B?NzEwNHFhVGN3aHh0UklScTkzdkpubytEbEVGbGZka1JYamk3T0Z5dzhFTVBF?=
 =?utf-8?B?Rlp6dkdMejlmNitBcDZBVTZESi8rcW9hNXdpT0hzYUZjeWxsOG9zRmdSTHNi?=
 =?utf-8?B?WmNkaHRiM1p6SnJHRVRTa0xNSFVTUnUxWTFYLzNkUG5LRXBocjU4U25UaXpn?=
 =?utf-8?B?Zk82V3VzTU9LZjlYNTRoNlRZb1ZrTGlWbVhkMXhCTjVjUmdhaFo3Tk5PMUFp?=
 =?utf-8?B?dWRYNFMraGVTbW5iQ0FmZEJQejdFdkc2bmhMYUk2NHhvWmV5RmxLVW13NU5F?=
 =?utf-8?B?N2lQeWZubjMzZmI4Mjd4dFR5V1pxMzFYTk5WOUlyL1ZNR3dFa0JVa1RFcTZa?=
 =?utf-8?B?YkJ5a3BBR0owY2RIWnRld3hTR0JmUUsveHdUM2FhckpEaHQrOWpkZFQwTENn?=
 =?utf-8?B?eGJDREtpMVlnWHBDRWxPbHc0WEFHVG5IUzBtcVo4TkpESitvb0Nxenpxb3gx?=
 =?utf-8?B?bGdNbjFBZVd4WkQ0U2FmMkNOU05KOUx3NFFkTll2aDBFZ3dOeE1IVi9oQ0dC?=
 =?utf-8?B?ZHBJbnBwSk1tOWtCNVN0T2czcVMzUmJjaXB3K2xXSkw2b3dpZ2VBN24wK1oz?=
 =?utf-8?B?Mk1RYWlyTVpZM2hldDZSNUwxbFBxSGQwTUg3ZVM2V0JHdzhLMXRBZDl3Ry9r?=
 =?utf-8?B?SEtqcnRLUHNYdm1RMkpDMWtyeitQdEVkQ3p4SWhOcjMrZi9menp2TmlrOUFz?=
 =?utf-8?B?KzVjK0tCMnNMeUt5YkFVY2JJUGJKcnFWRFRUZTZZYnpnenVJNnNHOGNwdW9Z?=
 =?utf-8?B?dUJsQnpENE5RY3d6bHk3eXEydGRlVlA0REJaRG90MGRJSXFnQms5QWJOWEtq?=
 =?utf-8?B?WTNvTHZjWnpqSC8yTFR5U2Y1TjFBTEdMUXA0dUFFSi9BQ3g2T05KQ1Z4RldR?=
 =?utf-8?B?RWo2Q1VhL09tNFp0M3lKQkgxaElJdXNVOUIxL0FJYmhSSFRFejdkSjdoaXdz?=
 =?utf-8?B?RVBLVU9aU2liNVJmRmRiZlpsNnRVVE5pL0R5akFZam1NLzRCQzhIL0Y4WFZt?=
 =?utf-8?B?OE9lTEZzYmtlWVd0Q3FtSTlxai9vMTA0dlluQkRhKzhQUXJaSE1xdDNxQkta?=
 =?utf-8?B?Q0hXU3d6T3h1ZnpqeUJtNGNzZWZnMmVGVHpFRks1NkxTRlh4WndTQU5xTG5l?=
 =?utf-8?B?YlVmTExZQU9oSzZteEVDc1FQZTFkWHZlN3UxMExlRnQ1aVVwajFQSktBS1hH?=
 =?utf-8?B?U3RxbEpVUU16dDF4SXJiKzkvSnVxUGNhcCsxVFhIZEIvWHF1OGs5NkVUUWI5?=
 =?utf-8?B?QStQK2paZW1UajlwVFJPeWs4dGlhcU9GRDJKQnZRYW5OL2FVTlV0SmdzOE5p?=
 =?utf-8?B?WmpvT0wrVkM0M1FlQSt2SFA0b3dTN0RqVldGMmlYUHlaVFU2WGhPbk5KL1oy?=
 =?utf-8?B?UU9FQXlGZXBISGRKRUxzMXdJWUVJNzlRcUJ1K2tJdjRYTFVYNXVwM2tFalFo?=
 =?utf-8?B?K1AwemFJWElWMlhwK1gxNnZ5VEl2YW9CQmpia1R6R2RrSXQwUTdHWHBnT0Vp?=
 =?utf-8?B?NkIxVW1tSUl4ajdaQlNwSTA5THBvQkpqbDNwRXBWQndFWjBHTEhIOUNWNHB3?=
 =?utf-8?B?eVBvR3lLUFN1ZmRGNEkvelAxbW5YOXFQS25YL2ZhMWwrWllTMFVSMXQyL1hX?=
 =?utf-8?B?TE1YRWZrWUNQc3YyVlRVWEZpTk9xTFVuczg1blcrZmx3YWVwcyt3Z01wM1Bo?=
 =?utf-8?B?YWR6cnR5ekVNcUJCMmhNTndsVmtJd2VZUkxndDgzNHVjODlDZWNibkxPVGhS?=
 =?utf-8?B?TE1wUitYME9uQVZkYkxkY1ZIT2lpajRnbncrOWYzNGhnLzBBSUNYNGtxN0di?=
 =?utf-8?B?RmVsODdvSkl6MzBQUGk2YWJiS1pXeXdUS0l0WnVXSTYyZ3BLbXJQaUgwTG04?=
 =?utf-8?B?YXBBR2c5WldqSUFKbTZ2Z0I1OHVtMTNIL1dndGpkMm9MSzQ2MDVVbDJZZTRQ?=
 =?utf-8?B?WFU0UUxld0M0K3VxcG9MRkJiUlNxTVdWM1dGQlBVZGE2QmIrT05TN1R4RU9Z?=
 =?utf-8?B?V0pRbmlzRFUzY3BRZlJwZFZPNU5FWGhJR2ovN3lwZVg4UXB2MEdLVGFHMHBR?=
 =?utf-8?B?cGUxVDVBL2VpZ2ppTUFiZGlEaVFXMGVQNUVNMXNaYTVwenhCYXVPbTEyek1R?=
 =?utf-8?B?RFBEUDdqcy9SVjZRTzVuaDUrV3h2MjN3R2FJMi9JM1YxbGhVZG1GUT09?=
X-Exchange-RoutingPolicyChecked: LIKIPATRSXiAZK/UjH5e4QRGDpMsMVOxXxCF64WycSDEsmfi9wc7aXT8LFgwQNJrrOX+vKL9mavRF1CaFIhYIg7fbGDcCiTf815g7Id1hUD1fZdS00dU0LHHjl8ht8flsKJc7Jl60a3Jmf2SEir0gDtOEcANtkacdXLJDi3UUZVw3iCLELka5yPzLmZ7cezUVd6+ghwm9Z0zuTvIgPDgGp/yMGs5fFkAJwWAj9aR9tDHKwSPmp3iaKCROY1CIBSkazv8vqaNzMnxTxtqg93VTzGJ95HSJ8/DcTRT1C5r7rY6tjxuPfrAnFNmnd8tgN59tu3j0194F37dJuxaisLUhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bf4b4b-179a-4452-0600-08df098032cf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 05:57:12.6455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/5FjNihllWoqybEQ58Vy+zGyzEPgix1DDqKcovcMHLwgiYKtR6eKpl2qP1mFwzFjFrO3/kLrs0y3royKiCugw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
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


On 02-09-2026 00:57, Michael J. Ruhl wrote:
> For debugfs, residencies and pcode_info are available on
> the BMG and CRI (!SRIOV_VF) platforms.
>
> Refactor to have one code path for adding the debugfs
> entries.
>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index f17b993755f3..9e32a5e230b9 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -712,23 +712,22 @@ void xe_debugfs_register(struct xe_device *xe)
>   				 ARRAY_SIZE(debugfs_list),
>   				 root, minor);
>   
> -	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> -		drm_debugfs_create_files(debugfs_residencies,
> -					 ARRAY_SIZE(debugfs_residencies),
> -					 root, minor);
> -	}
> -
>   	/*
> -	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
> -	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
> -	 * PUNIT_VERSION_OFFSET.
> +	 * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
> +	 * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
> +	 * and have a fixed offsets for the required data.
>   	 * Attempting this access on other platforms must be verified before enabling support.
>   	 */
>   	if (!IS_SRIOV_VF(xe) &&
> -	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
> +	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>   		drm_debugfs_create_files(pcode_info_debugfs,
>   					 ARRAY_SIZE(pcode_info_debugfs),
>   					 root, minor);
> +	}
>   
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);

LGTM.
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>

