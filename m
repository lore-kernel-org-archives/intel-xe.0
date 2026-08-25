Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E03DC61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 16:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C4410E1F0;
	Tue, 25 Aug 2026 16:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTyobHS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2110E1F0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787674270; x=1819210270;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=PLyGkw3PsuHDzqEPuHMrGmaINHdmFRtDMuqyWW+MP/Q=;
 b=RTyobHS3HeHjFKh7i5FgT90AOm2Qn4xrdvDQzQDdYl1+PeJe/zKcdQcO
 tCIIGHlRjE1uO297GBQwqnrgwN46SkPcXoFKVfq1Bwicbdx3xGWVnQJFh
 d/RP8UycU8s6i3lyqwA92uw0w2CMMyopfFAZL1QR7MSrD+hrDULSW8nbf
 kBOQ+DJ1eH11fSxK4zZsvS7cCeHtIPM30g1wNXdA4Fowv6ExOn+O3hs2x
 2z3OgHWSYeJk2RcxBj/zQZNJjqir6wzj3Van6EFq4E0VhqhSP7aG25cCF
 7ZCc8oEB0KL5LmHEogLNY2c3lqFis/uddYZZEQ/XT51O2MHN732n+wXRt Q==;
X-CSE-ConnectionGUID: fdLcsZb5Rx67kOiEPtBySA==
X-CSE-MsgGUID: iSs7oLIySG2WfWo7H4kDCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91962685"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208,217";a="91962685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 09:11:10 -0700
X-CSE-ConnectionGUID: mKu8g0iRQL+l7b/fsx5Q8g==
X-CSE-MsgGUID: SrfxudJvTYaViAcYZb5RfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
 d="scan'208,217";a="264065700"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 09:11:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 09:11:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 09:11:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 09:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnUOrU1BWlhRX4gqJGcWcFMjXBUuDx9oLnScaRRJQPKVvy66bQB25rJgiIKGeRYT0F6RwSa+0xVDHlv84dXkN733VY1czCF+BH1vklzifpsSgjRlSFWo0fP0DZBjti5vfJL8onJEBVw6ma2nhUCDytjxaedR+LXLk04FbOUCLVrUBrAw8WS+XsVOu+IcXwZMXyvwIgcGp0DGsqLysly6Djf0/mAQQSCjSFJSog3p6tc06y2jsd2dbJXxJN7eqzE3dhez0MPBUvRk6N54O2Ai3/jWxg6mHZrUvRdiqPbiHtoxn44xi7eYGsCuel2lrrwBhT0fgzbPGPijkZzz8Xm2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPJ7eUdlfA0pU3x6weqmlhkKo0j4l3QBcgii7xP2JS4=;
 b=w5CdQ5pANGI/QMjJcXoVduAxR35NAXRn4AQsq/1mLnv82w15SR/TbiuT4WBpn5k7vwdqbK8/sXOf14YuhdpSxOkYMYBrSgDUyOJk8a9wNdi87ayiaP7sOeENqWSBzJoksK9aTrXCoxsNd+Q+wF2CFaDIlm+PC17xr+dlAiNfQGqIgxYf8rB4fk0lqNBy1OPBSQx02E5KLGNmYrCUU+euGbnjv85VI5QXUR8h3DCKhGbOY15GXKmfBq3HJ1IrMTm4gLK7tvzV22Gz/SoDD2Shja+YLboqz4gMZeqlErhObIuSg2yCmsucwWiyVuXtHE5cC0v+Ai7us4bSoOUS4Q/FgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS4PR11MB643888.namprd11.prod.outlook.com (2603:10b6:8:53e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Tue, 25 Aug
 2026 16:11:07 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 16:11:07 +0000
Content-Type: multipart/alternative;
 boundary="------------91EcVv2Y77QDnMW8IF3NzJa0"
Message-ID: <24b6ba1b-e3d7-4a83-a6dd-7e4873ccbefa@intel.com>
Date: Tue, 25 Aug 2026 21:40:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-3-karthik.poosa@intel.com>
 <9277b78f-94a9-4b88-aa27-13b7d42fc223@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <9277b78f-94a9-4b88-aa27-13b7d42fc223@intel.com>
X-ClientProxiedBy: MA5P287CA0027.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS4PR11MB643888:EE_
X-MS-Office365-Filtering-Correlation-Id: 949622e2-afe8-4295-37b6-08df02c37882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|3023799007|6133799003|10067099003|4143699003|56012099006|11063799006|8096899003;
X-Microsoft-Antispam-Message-Info: XQenNIsCWlM92KvsM/MaJG1/6tCylSIFYACsjfeQ6gxg+p1rFrUfFOTOZXZB1I0Ds5vGXXvDv5GylqpnOgZU9KDLYNFvziNUQkp+FkYQQUt3/QHaaymI/MmhGCcTBfJ+wxV0Qm27v67zmfvaOF43uCkNwv8a/LKCfNxHdDre6u1nVuqHHSacP+pSTWvg8zPd9v6AwpFTs5UqNXa/+cdeeTfUTYWne3xeGX8NhKU/ycBLUc0cN0yXCX8AjopkR3BolebQcalCKPgQwDzySVx6kZeHFrtPs9NsQITKB8xE7nP2MHw9sFCyZhTyu36aJYp48ohugYa3NdseWRp5zLXQFCRL+SAGtn5+E581xsEiGuzVBhlu1hrzRFMU5Q/p6Ei1ZxESCTAjfmt2dpI3v/d4TOQjBOWJ0fe0ctbXAUeDwKNOizMGtuLL4xujjPBbT38Kw1SkucG49xAd4FzEloLcmzv3EPHnFfv6zYgiBdV03Ay7ZzABJnkn+6QMDvxCvzOVqROqvik/I6M4WduDUx1IENHV4G3vprcuArjeyzfi9Dvg09oVCIs8WBwP8CUX2RlHOGn5PIuQU+LC704O3nBpu7R6ooV0Zv+KQPVUJIEKSJn619ljpiCxQA8cqx5GFpv+CxOESeMRyC9hdtOMJGx+VMaO3qw1k8EjF2O7xtxILWo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnAwV2lpaFFvcDYxQnM3V20vWGJSVzVOOHROZFFjR3RQUmRoNmJ1bXBLRnRF?=
 =?utf-8?B?L3ZXUVl4TUlHZ00xb2lYZ3cwd1I2VkIxSUVMNWtubDlOUmZ6N2hkWVJ6MnBC?=
 =?utf-8?B?TloxVjF1T054NWxsUjNVNWkzVUxETVdrVG5kYkxPM0NieDFWZnhHUEJReDF6?=
 =?utf-8?B?Um1qdkg2M3dpcE9UbVZGWkdDS1c0RW8yQUNZcmI1MlFpajBYRGhCaEQ4RGFh?=
 =?utf-8?B?amdGSk9Kb091T1JCSmk1TGNJOVM5RUlBWnR4MHZIdmtnN1hTQWxTQStJVitQ?=
 =?utf-8?B?TTg4TjhiQzV6WCtLV0ZhQWpQK243NjBWZVRXaHkwUkY0OHRackdudy9Pdk1p?=
 =?utf-8?B?UERCeXV1MjBkUzJGR05wV28rTWR3azUyQjc5VTcwVEFwY1VpMVpNS0krNXJR?=
 =?utf-8?B?VzlsWWloTlNVRGV3OVZXdThwaUhwRzJ6NGN3T3F2TG5FeitMVmFLWkVRd095?=
 =?utf-8?B?RlY2RkllVjNDQXRBNXk3d3VWemhnamVwQnRRL1VNOUpqb0sxeCtxL2U4OWNh?=
 =?utf-8?B?WUl5U1hXeFBPQktJYzI0cVVBSjNxRWZmb1pHVU1udHd2ckhGNlJRSzhWMGsx?=
 =?utf-8?B?SE56MjMyc0dJek83WmN4MHJTdE1WcVVYekVodGVqVDdFcHZVUEM0dW9CVmVC?=
 =?utf-8?B?TS9Od0lGR3gxWkNDR3dwVUZSYUticTRNOGRIRUtlWXM0RFJxalE0SjdROEtX?=
 =?utf-8?B?bTdaV29GeXR6OW4xSWtlWm15NlIxekUyZGdiQ0NobnB4WFB1YkpCZ0Fwd1gw?=
 =?utf-8?B?R2ZWenFVRUFlYW5oaHpqUDRqWURlT1hZemNqY01FZXMvczJiWUZrVFZZRy9K?=
 =?utf-8?B?SzNIdS9NQVlhTVZmTjlVNjNQMkR0bHpWNFJxTVB0RUNnTWtBakhmcnNrcHll?=
 =?utf-8?B?cHIwWEUwNFlKQ204emZuOGdPR2pqTjQ0SUFMclMrSVM1WFVIT29sNVJybjBT?=
 =?utf-8?B?OGY3Y1hLYTNabmZpLzA3RGxZNHFOTDl4MmRuWEQrMnR4K2ZzTXFwQ0lmOVo1?=
 =?utf-8?B?UVA2VWZpWS9LcEE3bHZIN3o4LzJJcXdTQmV3Q1ZsL1BlSDVqdnU4V05FOWFo?=
 =?utf-8?B?UDhZUDNTQlU0dGtieUxLS3dJT3BWWW44YlJUM3BsR2Q5bmNJSGlUdXZZOFpo?=
 =?utf-8?B?UnY1T2lUUWJGL0gyaHF1S3dQOE1ZU1UxU2R5dk9GQVlrN1l5NEJlY2VVcjhS?=
 =?utf-8?B?M2tvM2ZIOEdKZXNaeTRQenZGQlc2RFJHVDJqSElTTXB5MzZMMTlZcmF1UFhX?=
 =?utf-8?B?V3FEZTkyenBQd25EYzN3RlJ2a29kWmQrSGw5aTNoNDFlVDhTWU1CVFhCYUFr?=
 =?utf-8?B?WlpMZFYvZUxjcWtXWDg5ZUNDcWp6VmNUVVIzWkc4MTdaWWpLRjVOYjVhajBK?=
 =?utf-8?B?dlU0Z0FUeVhaOEM0T2NESUtNTFNwMDBndGxxUDdJamJVY04yd3NZM0dyekU1?=
 =?utf-8?B?dkpYYktTUVpsT05rR2NwdUVEWi9wblhWZkNhdUVObVlMTDVyWEd0VzFhY3J5?=
 =?utf-8?B?bEJtek41bCtxN25sNkpQdHJCT1g0RGZEZTRwUmltNnRzckd6M2dtSzJ3djVz?=
 =?utf-8?B?OGxKai85ZUJHMGlEeHZJTEUra1prYzhBZW9BZUwrRlFvWXVhRzgvbGowUzJk?=
 =?utf-8?B?UUc4VFJ3MmhmS0MwaXJtVzlYTk43aTViVm1oVVl6V2Z4RjFVZ0h6WG5oeXN4?=
 =?utf-8?B?djEyejNQQjVjRitLZGRwdGxBUTdtN0c3OFpuZmZvNFpFQzErTlhnZWhHOC9h?=
 =?utf-8?B?YUxQWDlCMU52MHg5cHNrZ2R0dUtOS3ZTTWdOMVVlc1VxZ1VvZEN6YWV1S1Zu?=
 =?utf-8?B?SEtFSWxveEVRRG9LQWRuUGdCNkVYVXBmb25UUzdjNys3dVNsVXdieG5sbTdN?=
 =?utf-8?B?RDJYbG40c29IUVh0Zm5VUnd4OHlvSFNXRzNCR0xrMnpTUCtKbHJvck9Cd1hv?=
 =?utf-8?B?VWxNM0U2YnJxTkJtWTE2U1B6UFUreEZWRGJWYnYrSnRCU1VUeDRZdmZHSjlO?=
 =?utf-8?B?dW5ycUU1Z3VmQUJJSFBWK0ZXalR4VktWU0R2anRtM2VHSzY4R3pZV1BpYlhV?=
 =?utf-8?B?UWUxNlJSb0c3aE1tdG0rN0U1dXNia09DWFVCL29keDFoaEJuZG9ISlV2TXdQ?=
 =?utf-8?B?WFBDeFJUYzBPcFo3dXZzRGMyM0JYMjZUUHRPNjdueVdGVTZaSzVMeGNjZUdT?=
 =?utf-8?B?a3JmSDRya3ZIVHJJRUxvWkZBYmZ6WjVReitoenBlZHdLRjFEWUFabUI1Y1hl?=
 =?utf-8?B?YmNFa1c5cnNHSjQwcW56UitiZEN0clVxMlB3WFJQWkVnSHRtdkl0ZWZFeGtZ?=
 =?utf-8?B?WWFHa0h4dXppcERDUThKS3ZlNFdYbnVNOXZPa3Nhb3NpeUJlZzArQT09?=
X-Exchange-RoutingPolicyChecked: YIvGHDkDTHF10X8EzoOzHy1eZTRhwmemI/HZmFK+0amtrrw3kkWAUU6d47Hrv4qkCWUC0Q5yLrzu0EizftqgGd7VxReHDJlCdSfQ1glzWEczfE7izWZae5sFhlyZeQ643IiD2Fq+r7YZ2K4wXgSpBds8pI+9qUAAOlGkVUS268QWvnPgQ8Uy4zITT7UAMLDBf4FyX35o3e0qyNxv8gF9b2fdUgQI1f+MYQRihG0erVrrtUxTwwep6fVX6MrsqJt6UzeLWY8rNhRg7psmzjPTWR7nLWggCEC3GtWrM4lp5JgJ61gh2BOmMassDL0+2IF7tBGLvZeEXtRn3fr8yLOvnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 949622e2-afe8-4295-37b6-08df02c37882
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:11:07.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVIzYlr5NaWEG3HeZIFVhXXsndiSaTwN6QXjNpQKmhRgKiFBdkPV9smPR4Q2tI/CefpHEv0hLvBo1bMowzKkwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB643888
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

--------------91EcVv2Y77QDnMW8IF3NzJa0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-08-2026 11:33, Nilawar, Badal wrote:
>
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Initialize Xe hwmon fan-control support by detecting fan count,
>> reading stock fan control points and min PWM.
>>
>> v2:
>>   - Avoid user table initialization during probe. (Badal)
>>   - Move unused code to appropriate patches.
>>   - Use xe helpers for dmesg logs.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c     | 159 +++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>>   2 files changed, 149 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index de3f2aeffc3f..0a416e3e7b8c 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -20,6 +20,7 @@
>>   #include "xe_pcode_api.h"
>>   #include "xe_sriov.h"
>>   #include "xe_pm.h"
>> +#include "xe_printk.h"
>>   #include "xe_vsec.h"
>>   #include "regs/xe_pmt.h"
>>   
>> @@ -122,14 +123,50 @@ struct xe_hwmon_energy_info {
>>   	long accum_energy;
>>   };
>>   
>> +enum fan_table_type {
>> +	/** @STOCK_FAN_TABLE: firmware-provided fan table */
>> +	STOCK_FAN_TABLE,
>> +	/** @USER_FAN_TABLE: user fan table written through sysfs */
>> +	USER_FAN_TABLE,
>> +	/** @FAN_TABLE_MAX: number of fan table slots tracked per fan */
>> +	FAN_TABLE_MAX,
>> +};
>> +
>> +/* Maximum number of fan control points supported by each fan */
>> +#define MAX_FAN_CONTROL_POINTS	(10)
>> +
>> +/* Fan control point index: bit31 selects fan table type; bits30:0 control point index */
>> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
>> +						((POINT_NUM) & REG_GENMASK(30, 0)))
>> +
>> +/* PCODE operations timeout for fan control commands */
>> +#define XE_PCODE_FAN_CONTROL_TIMEOUT_MS	(10)
>> +
>>   /**
>> - * struct xe_hwmon_fan_info - to cache previous fan reading
>> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
>> + *
>> + * Each fan keeps the latest tachometer sampling state along with two fan
>> + * tables: the stock table discovered from firmware and the user table managed
>> + * by hwmon sysfs writes.
>>    */
>>   struct xe_hwmon_fan_info {
>>   	/** @reg_val_prev: previous fan reg val */
>>   	u32 reg_val_prev;
>>   	/** @time_prev: previous timestamp */
>>   	u64 time_prev;
>> +	/** @fan_table: fan control tables */
>> +	struct fan_table {
>> +		/** @fan_control_point_count: number of supported fan control points */
>> +		u8 fan_control_point_count;
>> +		struct fan_control_point {
>> +			/** @temp: temperature in degree celsius */
>> +			u8 temp;
>> +			/** @speed: fan speed in percentage */
>> +			u8 speed;
>> +		} fcp[MAX_FAN_CONTROL_POINTS];
>> +	} fan_table[FAN_TABLE_MAX];
>> +	/** @min_pwm: minimum fan PWM */
>> +	u32 min_pwm;
>>   };
>>   
>>   /**
>> @@ -168,6 +205,8 @@ struct xe_hwmon {
>>   	int scl_shift_time;
>>   	/** @ei: Energy info for energyN_input */
>>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>> +	/** @num_fans: number of fans available */
>> +	u8 num_fans;
>>   	/** @fi: Fan info for fanN_input */
>>   	struct xe_hwmon_fan_info fi[FAN_MAX];
>>   	/** @boot_power_limit_read: is boot power limits read */
>> @@ -856,17 +895,100 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>>   			      (uval & POWER_SETUP_I1_DATA_MASK));
>>   }
>>   
>> -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
>> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
>> +					   u32 *uval)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	return xe_pcode_read_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
>> +				     uval, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +}
>> +
>> +static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
>> +{
>> +	u32 fan_mask = 0;
>> +	int ret;
>>   
>>   	/* Platforms that don't return correct value */
>> -	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
>> -		*uval = 2;
>> +	if (hwmon->xe->info.platform == XE_DG2) {
>> +		*num_fans = 2;
>>   		return 0;
>>   	}
>>   
>> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
>> +	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0, &fan_mask);
>> +	if (ret) {
>> +		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	*num_fans = min_t(u32, hweight32(fan_mask), FAN_MAX);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	int point;
>> +	int fan;
>> +	int ret;
>> +
>> +	for (fan = 0; fan < hwmon->num_fans; fan++) {
>> +		u32 stock_fcp_count = 0;
>> +
>> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +
>> +		ret = xe_hwmon_pcode_read_fan_control(hwmon,
>> +						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
>> +						      fan, &stock_fcp_count);
>> +		if (ret) {
>> +			xe_err(hwmon->xe,
>> +			       "failed to read fan %d stock control point count, ret=%d\n",
>> +			       fan, ret);
>> +			return ret;
>> +		}
>> +		fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count =
>> +				min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
>> +
>> +		xe_dbg(hwmon->xe, "fan %d stock points %u\n", fan,
>> +		       fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count);
>> +
>> +		/* Dump the stock fan control points for debugging purposes. */
>> +		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count;
>> +		     point++) {
>> +			u32 fcp = 0;
>> +
>> +			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>> +			ret = xe_pcode_read_timeout(root_tile,
>> +						    PCODE_MBOX(FAN_SPEED_CONTROL,
>> +							       FSC_READ_FAN_TABLE, fan),
>> +						    &fcp, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +			if (ret) {
>> +				xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
>> +				       fan, point, ret);
>> +				continue;
>> +			}
>> +
>> +			/* Cache the stock fan control points in local structure for later use. */
>> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
>> +						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
>> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
>> +						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
>> +			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u %%\n",
>> +			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
>> +			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>> +		}
>> +
>> +		/* Read minimum fan PWM */
>> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
>> +						      &fi->min_pwm);
>> +		if (ret) {
>> +			xe_err(hwmon->xe, "failed to read fan %d min PWM, ret=%d\n", fan, ret);
>> +			continue;
>> +		}
>> +
>> +		xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
>> +	}
>> +	return 0;
>>   }
>>   
>>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>> @@ -1279,17 +1401,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   static umode_t
>>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> -	u32 uval = 0;
>> -
>>   	if (!hwmon->xe->info.has_fan_control)
>>   		return 0;
>>   
>>   	switch (attr) {
>>   	case hwmon_fan_input:
>> -		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
>> -			return 0;
>> -
>> -		return channel < uval ? 0444 : 0;
>> +		return channel < hwmon->num_fans ? 0444 : 0;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -1476,6 +1593,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   	u64 val_sku_unit = 0;
>>   	int channel;
>>   	struct xe_reg pkg_power_sku_unit;
>> +	u32 num_fans = 0;
>>   
>>   	if (hwmon->xe->info.has_mbx_power_limits) {
>>   		/* Check if GPU firmware support mailbox power limits commands. */
>> @@ -1531,10 +1649,21 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>>   			xe_hwmon_energy_get(hwmon, channel, &energy);
>>   
>> -	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
>> -	for (channel = 0; channel < FAN_MAX; channel++)
>> -		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>> -			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +	if (hwmon->xe->info.has_fan_control) {
>> +		xe_hwmon_get_num_fans(hwmon, &num_fans);
>> +
>> +		xe_info(hwmon->xe, "Number of fans detected: %u\n", num_fans);
>> +		hwmon->num_fans = num_fans;
>> +
>> +		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
>> +		for (channel = 0; channel < hwmon->num_fans; channel++)
>> +			if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>> +				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +
>> +		/* Fan control tables initialization */
>> +		if (xe_hwmon_read_fan_control_info(hwmon))
>> +			xe_warn(hwmon->xe, "Fan control tables are not available\n");
>
> The table appears to be captured before late binding. Do we need 
> separate pre-/post-LB tables, or should the table be updated again 
> after late binding done?
>
> Thanks,
> Badal
>
Yes, the stock table is captured before late binding.

I don't think separate pre-/post-LB tables are necessary. We can simply 
overwrite the cached stock table after late binding completes via 
|xe_hwmon_fan_update_post_lb()|.

When late binding is disabled, the default stock table should remain in 
use. So we can cache the default table initially and update it only when 
late binding is applied.


>> +	}
>>   
>>   	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
>>   		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 94575c476e3d..669010f1e2d0 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -85,6 +85,11 @@
>>   
>>   #define   FAN_SPEED_CONTROL			0x7D
>>   #define     FSC_READ_NUM_FANS			0x4
>> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
>> +#define     FSC_READ_FAN_TABLE			0x7
>> +#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
>> +#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
>> +#define     FSC_READ_FAN_MIN_PWM		0x8
>>   
>>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>>   /* PCODE_SCRATCH0 */
--------------91EcVv2Y77QDnMW8IF3NzJa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-08-2026 11:33, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9277b78f-94a9-4b88-aa27-13b7d42fc223@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 17-07-2026 09:47, Karthik Poosa
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260717041757.2759084-3-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">Initialize Xe hwmon fan-control support by detecting fan count,
reading stock fan control points and min PWM.

v2:
 - Avoid user table initialization during probe. (Badal)
 - Move unused code to appropriate patches.
 - Use xe helpers for dmesg logs.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com" moz-do-not-send="true">&lt;karthik.poosa@intel.com&gt;</a>
Assisted-by: Codex:gpt-5-4
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 159 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
 2 files changed, 149 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..0a416e3e7b8c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -20,6 +20,7 @@
 #include &quot;xe_pcode_api.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_pm.h&quot;
+#include &quot;xe_printk.h&quot;
 #include &quot;xe_vsec.h&quot;
 #include &quot;regs/xe_pmt.h&quot;
 
@@ -122,14 +123,50 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+enum fan_table_type {
+	/** @STOCK_FAN_TABLE: firmware-provided fan table */
+	STOCK_FAN_TABLE,
+	/** @USER_FAN_TABLE: user fan table written through sysfs */
+	USER_FAN_TABLE,
+	/** @FAN_TABLE_MAX: number of fan table slots tracked per fan */
+	FAN_TABLE_MAX,
+};
+
+/* Maximum number of fan control points supported by each fan */
+#define MAX_FAN_CONTROL_POINTS	(10)
+
+/* Fan control point index: bit31 selects fan table type; bits30:0 control point index */
+#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) &lt;&lt; 31) | \
+						((POINT_NUM) &amp; REG_GENMASK(30, 0)))
+
+/* PCODE operations timeout for fan control commands */
+#define XE_PCODE_FAN_CONTROL_TIMEOUT_MS	(10)
+
 /**
- * struct xe_hwmon_fan_info - to cache previous fan reading
+ * struct xe_hwmon_fan_info - cached fan telemetry and control state
+ *
+ * Each fan keeps the latest tachometer sampling state along with two fan
+ * tables: the stock table discovered from firmware and the user table managed
+ * by hwmon sysfs writes.
  */
 struct xe_hwmon_fan_info {
 	/** @reg_val_prev: previous fan reg val */
 	u32 reg_val_prev;
 	/** @time_prev: previous timestamp */
 	u64 time_prev;
+	/** @fan_table: fan control tables */
+	struct fan_table {
+		/** @fan_control_point_count: number of supported fan control points */
+		u8 fan_control_point_count;
+		struct fan_control_point {
+			/** @temp: temperature in degree celsius */
+			u8 temp;
+			/** @speed: fan speed in percentage */
+			u8 speed;
+		} fcp[MAX_FAN_CONTROL_POINTS];
+	} fan_table[FAN_TABLE_MAX];
+	/** @min_pwm: minimum fan PWM */
+	u32 min_pwm;
 };
 
 /**
@@ -168,6 +205,8 @@ struct xe_hwmon {
 	int scl_shift_time;
 	/** @ei: Energy info for energyN_input */
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
+	/** @num_fans: number of fans available */
+	u8 num_fans;
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
 	/** @boot_power_limit_read: is boot power limits read */
@@ -856,17 +895,100 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval &amp; POWER_SETUP_I1_DATA_MASK));
 }
 
-static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
+static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
+					   u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	return xe_pcode_read_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
+				     uval, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+}
+
+static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
+{
+	u32 fan_mask = 0;
+	int ret;
 
 	/* Platforms that don't return correct value */
-	if (hwmon-&gt;xe-&gt;info.platform == XE_DG2 &amp;&amp; subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+	if (hwmon-&gt;xe-&gt;info.platform == XE_DG2) {
+		*num_fans = 2;
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0, &amp;fan_mask);
+	if (ret) {
+		xe_warn(hwmon-&gt;xe, &quot;failed to read number of fans, ret=%d\n&quot;, ret);
+		return ret;
+	}
+
+	*num_fans = min_t(u32, hweight32(fan_mask), FAN_MAX);
+
+	return 0;
+}
+
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	int point;
+	int fan;
+	int ret;
+
+	for (fan = 0; fan &lt; hwmon-&gt;num_fans; fan++) {
+		u32 stock_fcp_count = 0;
+
+		struct xe_hwmon_fan_info *fi = &amp;hwmon-&gt;fi[fan];
+
+		ret = xe_hwmon_pcode_read_fan_control(hwmon,
+						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+						      fan, &amp;stock_fcp_count);
+		if (ret) {
+			xe_err(hwmon-&gt;xe,
+			       &quot;failed to read fan %d stock control point count, ret=%d\n&quot;,
+			       fan, ret);
+			return ret;
+		}
+		fi-&gt;fan_table[STOCK_FAN_TABLE].fan_control_point_count =
+				min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
+
+		xe_dbg(hwmon-&gt;xe, &quot;fan %d stock points %u\n&quot;, fan,
+		       fi-&gt;fan_table[STOCK_FAN_TABLE].fan_control_point_count);
+
+		/* Dump the stock fan control points for debugging purposes. */
+		for (point = 0; point &lt; fi-&gt;fan_table[STOCK_FAN_TABLE].fan_control_point_count;
+		     point++) {
+			u32 fcp = 0;
+
+			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
+			ret = xe_pcode_read_timeout(root_tile,
+						    PCODE_MBOX(FAN_SPEED_CONTROL,
+							       FSC_READ_FAN_TABLE, fan),
+						    &amp;fcp, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+			if (ret) {
+				xe_err(hwmon-&gt;xe, &quot;failed to read fan %d stock point %d, ret=%d\n&quot;,
+				       fan, point, ret);
+				continue;
+			}
+
+			/* Cache the stock fan control points in local structure for later use. */
+			fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].temp =
+						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].speed =
+						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+			xe_dbg(hwmon-&gt;xe, &quot;fan %d stock point %d: temp %u C, speed %u %%\n&quot;,
+			       fan, point, fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].temp,
+			       fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].speed);
+		}
+
+		/* Read minimum fan PWM */
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
+						      &amp;fi-&gt;min_pwm);
+		if (ret) {
+			xe_err(hwmon-&gt;xe, &quot;failed to read fan %d min PWM, ret=%d\n&quot;, fan, ret);
+			continue;
+		}
+
+		xe_dbg(hwmon-&gt;xe, &quot;fan %d min PWM %u\n&quot;, fan, fi-&gt;min_pwm);
+	}
+	return 0;
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
@@ -1279,17 +1401,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval = 0;
-
 	if (!hwmon-&gt;xe-&gt;info.has_fan_control)
 		return 0;
 
 	switch (attr) {
 	case hwmon_fan_input:
-		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &amp;uval))
-			return 0;
-
-		return channel &lt; uval ? 0444 : 0;
+		return channel &lt; hwmon-&gt;num_fans ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1476,6 +1593,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	u64 val_sku_unit = 0;
 	int channel;
 	struct xe_reg pkg_power_sku_unit;
+	u32 num_fans = 0;
 
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
 		/* Check if GPU firmware support mailbox power limits commands. */
@@ -1531,10 +1649,21 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
 			xe_hwmon_energy_get(hwmon, channel, &amp;energy);
 
-	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
-	for (channel = 0; channel &lt; FAN_MAX; channel++)
-		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
-			xe_hwmon_fan_input_read(hwmon, channel, &amp;fan_speed);
+	if (hwmon-&gt;xe-&gt;info.has_fan_control) {
+		xe_hwmon_get_num_fans(hwmon, &amp;num_fans);
+
+		xe_info(hwmon-&gt;xe, &quot;Number of fans detected: %u\n&quot;, num_fans);
+		hwmon-&gt;num_fans = num_fans;
+
+		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
+		for (channel = 0; channel &lt; hwmon-&gt;num_fans; channel++)
+			if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
+				xe_hwmon_fan_input_read(hwmon, channel, &amp;fan_speed);
+
+		/* Fan control tables initialization */
+		if (xe_hwmon_read_fan_control_info(hwmon))
+			xe_warn(hwmon-&gt;xe, &quot;Fan control tables are not available\n&quot;);</pre>
      </blockquote>
      <p>
        <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style></p>
      <p><font face="monospace">The table appears to be captured before
          late binding. Do we need separate pre-/post-LB tables, or
          should the table be updated again after late binding done?</font></p>
      <p><font face="monospace">Thanks,<br>
          Badal</font></p>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
      <p>Yes, the stock table is captured before late binding.</p>
      <p>I don't think separate pre-/post-LB tables are necessary. We
        can simply overwrite the cached stock table after late binding
        completes via <code>xe_hwmon_fan_update_post_lb()</code>.</p>
      <p>When late binding is disabled, the default stock table should
        remain in use. So we can cache the default table initially and
        update it only when late binding is applied.</p>
    </div>
    <br>
    <blockquote type="cite" cite="mid:9277b78f-94a9-4b88-aa27-13b7d42fc223@intel.com">
      <blockquote type="cite" cite="mid:20260717041757.2759084-3-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+	}
 
 	if (hwmon-&gt;xe-&gt;info.has_mbx_thermal_info &amp;&amp; xe_hwmon_pcode_read_thermal_info(hwmon))
 		drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;Thermal mailbox not supported by card firmware\n&quot;);
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 94575c476e3d..669010f1e2d0 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -85,6 +85,11 @@
 
 #define   FAN_SPEED_CONTROL			0x7D
 #define     FSC_READ_NUM_FANS			0x4
+#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_FAN_TABLE			0x7
+#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
+#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
+#define     FSC_READ_FAN_MIN_PWM		0x8
 
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------91EcVv2Y77QDnMW8IF3NzJa0--
