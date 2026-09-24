Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336E3C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 13:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC0010F586;
	Thu, 24 Sep 2026 13:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5L1wS7L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE5A10F586
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790257326; x=1821793326;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=62/IyHt73rIQapgsXnKFywnv9PV36HinX4BSXt/ySyM=;
 b=m5L1wS7LJ39HvVbNPBHf8zVMOcCQ/YFWI+Yms6uBkwtbugV8Wakg/JhN
 lc0atzYcRGGWCxzB+u08ezzdL3aX9oPLNwSrDaDdqFzi8ixBX62bYeVPA
 4Fo6pNG4285b5SBcIDtY/6BSvCS3yrItFFxaEuB2hXSj2hYiMZsDQC5hv
 8yD/YdY7VF6mnKbgxVg6Z+HiAQII4REL3DzNo7jUApvE6eFYn3FOQykOU
 McDi0gGB14vkHcDkMj/njgzjHXhTLD/M4K1oAqLWSU+jvYHzLjXhOno5w
 ZFwuOCXU30ajtay5VES0Ml1pw+Yhi9D9cfTxCLgbtJ7b0oeJGLtYFaKi7 w==;
X-CSE-ConnectionGUID: b6Ug09U6SXSru8rwjJn5SA==
X-CSE-MsgGUID: xHfDxeRdRxKYBHd/1lOp7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89889787"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208,217";a="89889787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 06:42:05 -0700
X-CSE-ConnectionGUID: XLdnm45XSUuPOYPOpSGsWA==
X-CSE-MsgGUID: n4J7/U7kRBWiW/ajl+uUKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
 d="scan'208,217";a="277791590"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 06:42:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:42:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 06:42:05 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.60)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:42:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikbeE02LzMdopEaJg7PpqMeZXq2TigJ8OVnsGYXcu2X5ZMIh/YZLT88v619RrPR6mg5+t+oAz8/gu6jj9/bTbIm/qNsXATJbNhmEpdARhbx91g9zdCP/SCXk+RbOJ0gRqM5dJQU+r7QVQwVXKLsDfkbOifAPy0ANRrMqFIxIWVplYaCJC1lMvAJYY/9OMKOY1zp6GCKJYze6WTXd5awBFY5kqfc+XKYc2FoCDjrsCzXwJ4N1Mpa/SePQ3aUr8yYi5Rzk6H3wrDOMVfWMtHK3THA8Fm6Pttf3/mrMt6SQTPA5grl5lQILf3qbpMCoNFMh4Rap/O1D09u92tQuaqYxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TtHjZX2gCpycNzyUIF76IOOBSS2MhSssFMApiu5qco=;
 b=HdONGfrNDqcgHOmSNXv4NuE0/MIZwzOBc8Hgj8Dk5T1I0/MEeEuerxA6hVT7S/0AyvEtsFT4VZJ5CzT47J0Aaxdn1NpgyWg/zyDwmkhfXLM8Av+IiTA5zU4HFfzkM/pFK660DeHuc0JELslcO72VWFuEjW90g17A3YieynEXA+eX1doHQoYm5kcOTU7fyPg6d4RXMjrk0n29gkqar4he+FlfoZKdGz7UYSbvx0tmGyHBXYh+mlUd8y3s+k3i2DYIH6xyYCsrk4zpKKcUTJAwJQft/zoNij6eWazoV68hFBWCNCkd4sbD/pwQNR9/Z4b7GCEv7R0AeDeOuwRcr/bTPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:42:02 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 13:42:01 +0000
Content-Type: multipart/alternative;
 boundary="------------1Ecqzpuc5Bw4KgxlrhrSEjzS"
Message-ID: <5da9fbd6-ae49-47e0-af17-3463e9a906c7@intel.com>
Date: Thu, 24 Sep 2026 19:11:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] drm/xe/hwmon: use CRI-specific package and VRAM
 temperature registers
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-11-karthik.poosa@intel.com>
 <20260924112755.7399E1F00893@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260924112755.7399E1F00893@smtp.kernel.org>
X-ClientProxiedBy: MA5P287CA0076.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::10) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH0PR11MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: b25c344b-c776-4c85-8ce6-08df1a419cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|4143699003|10067099003|11063799006|56012099006|8096899003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: YWcBofpORmPAp2Wxr8tGP61qcjvy7JPcTRJErzj2yM2Nd3eC7rM5yaDyQp8bCcW2gqbXQBp86xIdU5QRSvXo4LbVEfJknASL6Ir8bQz8tvbCWV8H+sXikTlj1oehAkdx7YLTwlSLMgEBlDOBA64PytvlhoOVbwUDwjEKJd8BH+FLclIjQxMq1xdpjRLYC2qWvuRNxmDVn2FOuFRWX5vzb84igtXOxo11n5E3S/PSiXozzpvwerxkQ/nEpuiq5JaXP14ril/bWT4cK+igs5vN0Q0pYYlcJM55z0MmGyw7+sFyOGo44ExYJYYnuIg7hu26smAwi9TGQ+rBQFYm7rUIo+DxXfr3kVN0eXMG2k2O9L64CCDCXziVk9kH7rpd5b+nBSwB7fAzSbSLVSb8FD6q0RkFuYnCLnUA9d+tUoHvbtbNXC7/96IsYwGslFtlAsFONuywjnCN+h1RKJsm5NjgTMl/ftlLpAvaIqeLVuDNUtoEwvLsoNtzjxW89hSOWeXMK6xhEaYvHYjuaSOyYpLrZ4dmGNgVVg0X4JY2ZlCBFJxxtGrtPJO7f81QCS5bgS6f5nyOcADCH4lazsePFbQwh+N8+D7/X57K3OaFpbTFM+NEJrdFtLtSMpk6PABmiIRwgLTXXNuavrJv+IrGTtOPH9236h1kwtJWEZTcy7U268Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(8096899003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1hlK1RxMzlFenFkZVprY0pnWEpVM3JvZ3lPb0tOWkJqYTZScVVqZjlwWVdm?=
 =?utf-8?B?djVVZjh4cjRuK3djV2R2aytVeG1vTlQ1TUlnRzFtUFNVY29zRjlKMS96eWtj?=
 =?utf-8?B?dDNncUVtZ1RDaktScFNLTGdpVW44Q1dXZ3hlN2xxMExCU2NXSnMxblJVc3Vo?=
 =?utf-8?B?MnVaSzFqdk4weWgwUlZubG5nWEIzSGJFbnNSZEpGV0kremNCVFdrOC9vcnNl?=
 =?utf-8?B?V05VaWFzM0w3RGRGeU80cnZlTVU2TVhYTVpTWkNuMWFwMVZFSXhkc08vNEZC?=
 =?utf-8?B?MmhUdGVBUXhOQ1FQZ0YxZVNCY05qaW8vOCtJSjdLdEloakJOc3gyT1d6ZjlU?=
 =?utf-8?B?NFZ4TWpsekpzOSsxQjFodnRKZjlYcytickM5Y0dJd1ZtMEs4d0RwQ0FUQmox?=
 =?utf-8?B?Tng3QzF2ZVFmNEhKdVFJdzVHbnZlV25PRG1IQkUwaWZwTmEyUDN2OVQ0aElo?=
 =?utf-8?B?S3Y1c3VwcGRPTWp5YkV6d2YwZFdnYS8xYS9Pd2N4cVlwTEw3RkxvSHN0Y013?=
 =?utf-8?B?VE12MjNQUmI4b1hvT2tkdXlXci90Rno3SGRuOUcyWlJMWG5uT2Rvc3NyeGI2?=
 =?utf-8?B?OHJhaGRuZEpEd2ljV2N3ZVVwTkVlN2syaDdKZWpuNVhZVjRDaFJvY2xtcnhT?=
 =?utf-8?B?VDVzRzlBOFZIS25Bb1J1RFV6dkNaYzE1RmlXVXg3SlpHcnM4L1ZaMDZ6TXla?=
 =?utf-8?B?T1FBOVJpbzhQS3ZSRUh0MGRUOS9kb0o5QTNZMENMM1h0QjZ4cm14MjVOSmNL?=
 =?utf-8?B?aERtYlNDQWdXbHVIdHBLQlN1emtMc3c0MjZGZnJVNUpLdi9rL0g5RU0vbHBF?=
 =?utf-8?B?enNTVkNocVNKMVFuN1dJODNnQXZ4a2tRMWdQdExPZVYyenBhcFdCNmZ5SFdX?=
 =?utf-8?B?bWpTU3plOVpiQXlaOFFZbWlxNEpEbXdFb2tRYk9lWkVONTF6U0xQQ0QvS2F4?=
 =?utf-8?B?eVpkcWVRNm5pOCs3a1drb3JaamNFWU4yNUpWUWJUWnQyWVIwU0xBNTkwTFlM?=
 =?utf-8?B?NVhWUzdhdndZNmVqME5tL1lpMUFPektuK3VBZFZra083TndoTWpFSHl4VFps?=
 =?utf-8?B?V0I4QUNFS3cyb29BSXlBM0Y3WGJDWnVjNEt6Z0FBSVhDWkNzL21SVk01Y01T?=
 =?utf-8?B?V2doNWpZaUEzRUxWSUwxT1BjVTdNUUg5dys5ZFZOS2JjQm5NaVp4eWJPeFlj?=
 =?utf-8?B?OGNLcVdKU3BIZnYrNG84OW5MOHpvVUZDbFd2UEx1dnBZMi9JNVNzblZaNngw?=
 =?utf-8?B?VVVSbmZSV2xvYlAxNEZEMW1MNWNxVjJkSmJGbmlmVHhoMTFIMS9wOGRNMWNp?=
 =?utf-8?B?TE9MVXpDaWVkL2hFazBtZlZQQmpPOEZRRXViQ0RFNXRDTTB4YnF1YkV2bjlu?=
 =?utf-8?B?aDJ1SmlSQzdKb2JTSVkzTkFOV3NSZWlSU0FoeGhyRmJRSFlSNlpwS3J5RW9Q?=
 =?utf-8?B?bDd5YVppRU94eUlTSTlldmVwaEMwdW8vcnBZMEVaRlN4U1BCWFE1NTRBeWtB?=
 =?utf-8?B?TzBrRW5JNjdKN2wwNS90NEFrM3grVTd2eHQ3N2NXM2FpMVRvc3NFalAxdTNR?=
 =?utf-8?B?L2R6Znl3SVZwYXBXMFZxOWgwSmI4T211eXUzM0FvVUNkUUI2bjkvdTIySGhh?=
 =?utf-8?B?cVNtSXZrWnRZcG9NeGlYcVFtM1FRNFVtQ1lRT0lUc3VReU5rZ0xJeVVXeSt3?=
 =?utf-8?B?Tld2TmtQV0pZcWx2MENzcFJmc2Z4OTE3N2JRZm9yNHNWRFVRQUR0bmQxREFn?=
 =?utf-8?B?emhGYUU4NmMrbjNoTWlZNE9ZczZzMUZqQm92amd2VTlsYm9pMVJaYkhFaVR0?=
 =?utf-8?B?dWlrL2E0OFBsUTJGMFZZU0J4MDArOElzb09wSFRoWEJNbW5JVkkwcHJhbldN?=
 =?utf-8?B?SXk3VUEyMGRRV05PbXZpdVZEL1B1WENxRzBsUlUyZm1Jc2xlcVhzRXpKWGNl?=
 =?utf-8?B?bUxWZTdrMGd3QkY2WVZKVFhtenlNVmhDb3dwaHJXc3I0U1liejRYQWJoNUZa?=
 =?utf-8?B?c1VNY0VhcDhtZHNXTnBMSGVMWGtoM3NydDBjZ2VDa0NQaksydytjSmdjK05R?=
 =?utf-8?B?YnFQMFJVZU8vSXR6Z1VqcjhNSm1BQ2lNN1BHblBtamNmNWdyUWNuUkpkZWhu?=
 =?utf-8?B?R0RzRzZIMzliUmZrL2ZHdnpiT2ZaSWJpYjM4RmtPTHJFdUVkRCtQUmNxS091?=
 =?utf-8?B?OFBEYnVaZzhrL0ZHd2FBb2RzWG9Mdmo0S0Z3THZLZjQxeG10akR0U2k3UDRS?=
 =?utf-8?B?b3hDVzhNNzhwdXZxVlk5ME5sRG1NaEsveDNVWHNkNW0xa2VzQ1E2dEFFZ1Fo?=
 =?utf-8?B?M0VONXFFRTJNTjhBSVFzTXg1SGpvSEUzamJsMXM1bm5hMDBsdlIxQT09?=
X-Exchange-RoutingPolicyChecked: UmVfYBfsyNjZHR7ixe7oPW1um3zFakgCYZyQUg8TTLR1I8XQZJbZ5UinDHn01OaTl6C3PZdSxt3pd9BFP1T8NdqrdO839KUy0Y7TCjziohIwLPH0yz0srmHpyxGjC8iLE+zmSm9htaxKKGo2I0eJ3qdTWyiwRMwZ3ixurAp5m0lXIEvmZRfK0/7FVtLVLafjGV7oyv/vk9ajAxB0vqnGf2R5PA3uR2FqVu4ZQBRm2sVArrTZSz0+nRIDL1TqFHR8XEjMBoKG2SfF8ihw9lhM3HFAjK1Ci+4jC8J/1dQkeird1gUWmBtIzQXcm2UMfQ5JVuv4TTPIma0qhJEniGaKdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b25c344b-c776-4c85-8ce6-08df1a419cb2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:42:01.7984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9fV2ZFo6dygQHis72etXZmk0zbjgorsU3RJVhiMjeTflLzecr2t4SzQ8nZcMMdpDFuaBKyFpcMMi2L78JTBaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5112
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

--------------1Ecqzpuc5Bw4KgxlrhrSEjzS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 24-09-2026 16:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe/hwmon: incorrect BMG register used for CRI per-VRAM channel temperatures
> --
>
> commit 8d77f2708804f58e62723e17d986cd5eb1877de7
> Author: Karthik Poosa<karthik.poosa@intel.com>
>
> drm/xe/hwmon: use CRI-specific package and VRAM temperature registers
>
> This commit updates the hardware monitoring register accesses to use
> Crescent Island (CRI) specific MMIO offsets for package and VRAM
> temperatures, as they differ from Battlemage offsets.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 1b587bd9487e1..e1cff5700e7f9 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -293,7 +293,15 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   
>>   	switch (hwmon_reg) {
>>   	case REG_TEMP:
>> -		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_CRESCENTISLAND) {
>> +		if (xe->info.platform == XE_CRESCENTISLAND) {
>> +			if (channel == CHANNEL_PKG)
>> +				return CRI_PACKAGE_TEMPERATURE;
>> +			else if (channel == CHANNEL_VRAM)
>> +				return CRI_VRAM_TEMPERATURE;
>> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
>> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
>> +				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
> [Severity: Medium]
> Does Crescent Island actually use the Battlemage register offset for
> per-channel VRAM temperatures?
>
> If a monitoring daemon reads a sysfs temperature attribute corresponding
> to a specific VRAM channel (e.g., temp3_input mapping to CHANNEL_VRAM_N)
> on a Crescent Island device, xe_hwmon_get_reg() will return the
> BMG_VRAM_TEMPERATURE_N macro in the XE_CRESCENTISLAND branch.
>
> The commit message explicitly notes that Crescent Island uses different MMIO
> offsets for package and VRAM temperatures. While the aggregate CHANNEL_PKG
> and CHANNEL_VRAM cases were updated to use the new CRI_ macros, the
> CHANNEL_VRAM_N fallback still uses the BMG_VRAM_TEMPERATURE_N macro.
>
> Will this cause hardware monitoring tools to read incorrect temperature data
> for individual VRAM channels on Crescent Island since it accesses the
> Battlemage MMIO offset?
>
>
CRI VRAM individual temperature offset is different, I shall at 
CRI_VRAM_TEMPERATURE_N for it.
--------------1Ecqzpuc5Bw4KgxlrhrSEjzS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-09-2026 16:57,
      <a class="moz-txt-link-abbreviated" href="mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260924112755.7399E1F00893@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
- [Medium] drm/xe/hwmon: incorrect BMG register used for CRI per-VRAM channel temperatures
--

commit 8d77f2708804f58e62723e17d986cd5eb1877de7
Author: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>

drm/xe/hwmon: use CRI-specific package and VRAM temperature registers

This commit updates the hardware monitoring register accesses to use
Crescent Island (CRI) specific MMIO offsets for package and VRAM
temperatures, as they differ from Battlemage offsets.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 1b587bd9487e1..e1cff5700e7f9 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -293,7 +293,15 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 
 	switch (hwmon_reg) {
 	case REG_TEMP:
-		if (xe-&gt;info.platform == XE_BATTLEMAGE || xe-&gt;info.platform == XE_CRESCENTISLAND) {
+		if (xe-&gt;info.platform == XE_CRESCENTISLAND) {
+			if (channel == CHANNEL_PKG)
+				return CRI_PACKAGE_TEMPERATURE;
+			else if (channel == CHANNEL_VRAM)
+				return CRI_VRAM_TEMPERATURE;
+			else if (in_range(channel, CHANNEL_VRAM_N, hwmon-&gt;temp.vram_count) &amp;&amp;
+				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
+				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: Medium]
Does Crescent Island actually use the Battlemage register offset for
per-channel VRAM temperatures?

If a monitoring daemon reads a sysfs temperature attribute corresponding
to a specific VRAM channel (e.g., temp3_input mapping to CHANNEL_VRAM_N)
on a Crescent Island device, xe_hwmon_get_reg() will return the
BMG_VRAM_TEMPERATURE_N macro in the XE_CRESCENTISLAND branch.

The commit message explicitly notes that Crescent Island uses different MMIO
offsets for package and VRAM temperatures. While the aggregate CHANNEL_PKG
and CHANNEL_VRAM cases were updated to use the new CRI_ macros, the
CHANNEL_VRAM_N fallback still uses the BMG_VRAM_TEMPERATURE_N macro.

Will this cause hardware monitoring tools to read incorrect temperature data
for individual VRAM channels on Crescent Island since it accesses the
Battlemage MMIO offset?


</pre>
    </blockquote>
    CRI VRAM individual temperature offset is different, I shall at&nbsp;<span style="white-space: pre-wrap">CRI_VRAM_TEMPERATURE_N for it.</span>
    <blockquote type="cite" cite="mid:20260924112755.7399E1F00893@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------1Ecqzpuc5Bw4KgxlrhrSEjzS--
