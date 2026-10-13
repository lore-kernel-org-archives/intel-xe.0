Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6922FCA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82F610F431;
	Tue, 13 Oct 2026 02:20:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0667610E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791858016; x=1823394016;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/4YWJn1/LZ+QvmWjuy/IIXWYRazM1l23iIzDBZDv3x8=;
 b=IuIOVM0i1HAOMs7VExIbD0NEbWDa2JLnU1jkpNreAJjngZwMhjXnxGkd
 GcNT5KC8S1sXBaBDj1EsXaIEs6ympP6p6y4xZNkeQqt/hqqkZ8xnctx7B
 W6rEZ+ulCB7hOUX6jpaXj+4fQ4LQlUsoj+B8hXm8LGcjHDLwuhmWn7SOp
 2Ig9j4elXJE8QBWH4rKIchdODbR+ZAPzdAwgP/854kbpecPF2WTFNddQC
 ZWe1ak+fpz2eplZUDTw9omHjyQ/ShzH062eDyEEKtywddLKZLLm2TPBWi
 5TIMrDQqYZABs8YN9z0Xn6BR5i/twUFuREL59IdY1JX7jGkBXc2bJNQWF A==;
X-CSE-ConnectionGUID: m45Iv8YAQ5GmNxITmJE1BA==
X-CSE-MsgGUID: 9yzXdouxQAuqTKF3+Ja17A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="579865"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="579865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:20:16 -0700
X-CSE-ConnectionGUID: /4D6f4MzTPmOjNiuxqyOVA==
X-CSE-MsgGUID: Gy+sEoaIS0qsQtqWGvVi/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1363296"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:20:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 19:20:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 19:20:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 19:20:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDAM1xCuFYLyC/CWrlH/lGLl+RZxLlaPY/2YU6GJRlxVAYbkRFwCIGhpdpevWsTG+wN5T4A6Vt5trhWdM+6PfM3UEA0uSHlQu0sQGBuyp7vGuDGrjaeebI2CfdsdwF+2D1xvhvRcSRLbvONHr0abwlXPrUFp8RpbejLw0oDoWijZX+CtsBdiZVOLOKg/jqJe6PvRBS3RGCRIyFhRyUnNlpckjOqOFVAiVGnLpPbuR38uRf5unag2Lvoz24P6C45Vyks1wz5FpoRu8ctl1R+tvz9BmOfX6DUmkK6uubfHExcys/qNoos44aXuyQ7VsJNw62N1VryYCNIl6RItUTh6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bL+GiJ8jTunAnvGflTvV6wGkNfqkdVqRMk3aWom8I4I=;
 b=bdYRsvr5hkKESQuKkcIA7BGjOvfcJIOaK260ikRlLw9TzXOc+X8v7BbEpuk1QSTq3Q24vsMXhUEAv3lUZEN4CEz8Ph5E4e/pgjAbjRI3P66ifnBSxeejSfi6iuDrOKAg+VGj4BJ8n0RL1sr6X9wQCqIKAquBrif/IBttBlZzhlkdHQg48tuvPxTbFfaeCX62f78dFOjc2WLNkYbgqHB5HkuPeQUL0njSvjL3XiShGQPPM2Rx78lznK9DHdPGQNYQIQCBmnBpZR8VQINkZ/mHkEb/JWnD/MsJ6DFQE+Y42diNSkeiY4yJcrqtCz5WZh69WOztrT3USEYdzit/p+MUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by IA0PR11MB7282.namprd11.prod.outlook.com
 (2603:10b6:208:43a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.25; Tue, 13 Oct
 2026 02:20:11 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 02:20:11 +0000
Message-ID: <56eaa11b-62e8-4f8d-a0e0-d31bf54bb3cb@intel.com>
Date: Tue, 13 Oct 2026 07:50:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Propagate all hardware read errors
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20261012110648.253748-1-karthik.poosa@intel.com>
 <as2Ci8Vy9iTAN9r4@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <as2Ci8Vy9iTAN9r4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::16) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|IA0PR11MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 26dfe83c-19a8-42f9-0f27-08df28d0827e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|10067099003|261009223027099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: CiyS4GjAsv2U+6DZUQOHKoteRspEC4zUxf0CWTw7EWccuz0pgEHqmn/Q1g9bPZQVusENiFWU9nJRS+mcbwkk1flKannIgvYkuJFqMiNBelUJY0FAa4mwNCLr0JdQVSouhIQyQCkZo1s63yjXlLklGX54P0QnDtRmJAAXMLHz4sX0E7HDSuvYmoA7t+A2pbSgzhRvoHnPzj4E5QfmVeXnF1/ybqaImOCTm2Mn99MP+AkzfP8tvwMi6ODRu7KHWyVDVXKteWYi6MIO2gfEwfgqZYrWJPY8j30OLGm7KhSo3Iyvxrlo8hlc9ky0dCA8G1q//e1xHka4nreJ2TpxypcP1UBMy2Xba1B95rSh/+iA3eS8VZqMilxoA1OwyII3IiKjncUgm+LOdT8hgLv900kwOUmwxvJD0s7MnYH92aQhXHGsHComEuj2DSlPYcR/mVlFg6d1q8pHxFQMdhrJylh02v1a2JwEt7Sah8BTjAmWtl6G0Db+ebTT1BEvc3alioUH89EtsnUb1wht5UNxodgCdcMee5whcFf7l4LVgseaGTiIwrk0P2LeJ/dLwQeuUGtmSO3RYWJlhE4rbhRyhlShhl9wUR/K/+rJWNx3FXdbGo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR11MB852307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNWTkdVK0oxdU9aSmpOM2JuTGNTZXdnS1ZwTUw5TjRqeVlBbFk0ejhYSjFL?=
 =?utf-8?B?OFg5YTAwcnQrNWJJYWFRbHBCYndlVTlMTTVyUWc5UStDVDl3Q3lMd1I5U1Zl?=
 =?utf-8?B?Tlg3M3VqZEdBWUgxRGpJMHB1S3NoclJYTHBldUpGTE1JSEZYR0VwRVNsYjU3?=
 =?utf-8?B?Wk5oa0hUd3NoWlhRcVlZS1RjemR3YmtuVE5PckZCck5hUkJRaGtYYTAwOWU2?=
 =?utf-8?B?V2Zuc3AxVDc1TXdONkppV2x5azZiUmZRTkNvMkFjK01aNGpLc1ZoS3IzbThE?=
 =?utf-8?B?cVdrbFhvVyt0TE5NeG9OVW15cnJ5RmJCV0k2WGdFYjIxejF2TWtDejVpVGZE?=
 =?utf-8?B?eDRyTXZ5Nm8zajhpUVlubGVPTmhWN2dBQnRXcTlYT3FvSG5FcFVOSWpwZCsz?=
 =?utf-8?B?REFhVXV1NmhIOGl2RHVXUktMdmJ2SVppMGZHWWF2N0ZUZDRWRmtja0ZndURH?=
 =?utf-8?B?ZTF2VkhiNkhESWNaYUMxOVdGTURQWkxuNkZKaVc4by9HcmFlMzhnSVlGdC9H?=
 =?utf-8?B?blhPY0NuQ0U1QTFNKzJNeGd3b25FTVFDZ2hwQnhhWnhKckJ2dWZXWkF3LzR5?=
 =?utf-8?B?RmRRRlh1K29WMHNmY2toTmJhZEJqVkgzMVFkMUxkd1dteUw0T1hveDlIQzI4?=
 =?utf-8?B?L2pFMmF4U3FjbTVaeExxV3o3bEMvUW1CZHFud2x2RWw2K0laZzNnOGtBaFgv?=
 =?utf-8?B?NUtwdXNZT3VIMWJoR1YwN2RCc042UEFEVFRpSEdNQ09WOWVoVUJJclNNRXZn?=
 =?utf-8?B?cXFwOHp0OWVkVHpGU2xMUHp2NTFDWlpWM3hLNndFaWR4QlJMeDZyNHZzdHZl?=
 =?utf-8?B?VG9udDR3cTQzUWd3OUxlU1N5YzFIajVQUVRMZTZDcWc4VkhZVDdDSlRXYy93?=
 =?utf-8?B?cTZEcGpwOHN3clVrNzd2dUwrSHFCdzFKK29CWHIxVGNsNkFjMVUxYnJWeGJw?=
 =?utf-8?B?dHR4TFd1dndZaGp0UmpoSGIyRkpFRjh2Q2FzNmhFUEZxQVhqeWlLVldhWElJ?=
 =?utf-8?B?R1EwKytjdmhmcHpDQ1Z5TEs1K21INkJlcnV2cXhRQzAvRFBNSHhzMHBOdDJx?=
 =?utf-8?B?S3QzbDFYZW8xb0EyYkdVUGZ0NU9iMjhCYUtUR3BtNVgrN0JsTndDaVVmSlQ3?=
 =?utf-8?B?UnZDdE5XdGdJNnFRQ2hGNm81ZlNwSGpzNDNpU0JzV1dlQlB3WktVdjZxaWlp?=
 =?utf-8?B?K0hBL3FPMGVIbmNFeHIvb0szck02QmVXdWhIVXExQjV1RUhGOXorWWVUUG1Y?=
 =?utf-8?B?OW91ODl6NG8xUUVIalVselpFZ2NyWUxLWitVd1JFMnNjcUJtL3pKaWYwUGNE?=
 =?utf-8?B?OXhnNkdTaUJWZGNLTXU1RnlXZ3lOeXZTd3lHdWI3OU9wZjlzeVpObVlqUWtk?=
 =?utf-8?B?VTNBY2M1cFptZm8xK2Y0TlFjMGdBTEp2dEVDM3ZrNDBTLzdmTmVtdGZzbUFt?=
 =?utf-8?B?ay9ZalFKcFBuZlNBUC9HM3JhMWFhbWxoV1c4RkdnYUJkSXVla1BUSTU0YU83?=
 =?utf-8?B?N1ZGRmx2UUErdTNiNjdXQlNJazZiazQ1bEh2aG5CM25KejRPSXZnd1pyQzJw?=
 =?utf-8?B?eVpxazl5OXRqRFh3dnBzMVhpQUlSeDlGZFhNa1JaUnhRQ29ybWNPc3pkaWln?=
 =?utf-8?B?ZU55aDZqVFpvbS9ad2pwYjc4b25iQkJReHlPbXVZNTM0UE5tMENOTnV3S0JS?=
 =?utf-8?B?QXJmUm9pUGtVUkVjL0ZQYnlYYThOTjVlRG1lbzJVN2h3Q1FzY28zMTZNN3E5?=
 =?utf-8?B?Ym1mZ0k0S0FBQm5seGlQN2F3TSsvRTU4eWJvV1NNTWFjaWxmcGZZcmFvRjZx?=
 =?utf-8?B?NHhnMEkrVWpRVW05aDljTnhRd0dKZjV2ZjJyVUsxZUIyUU9YNCthK2tndXZ6?=
 =?utf-8?B?MEYybkhlM2NjVUsybXJaYWhTMWdUR2t3R1JzckdJUjNid2tuRW03NzRRcStD?=
 =?utf-8?B?U2JROWxHOFMrZmcwTElaazVZL2JaMmhUNTVWRmdGZGsxczVpVDBobmhGUDZD?=
 =?utf-8?B?blVrcFd0MDZ3cXc1TUVvZ1d1MUJUbThBTnYxNUUrRmEvcUFZcFdnSFUyY2kz?=
 =?utf-8?B?L0NxL2Jrc3NGbjE0ZTZIZjJ5UlpIMWRUNlZTUnlQVk1acTdFTW1aV3lBRHIz?=
 =?utf-8?B?WDRaOXUyQUdBdkdxbEVqSU5ZWThMcFRLd0NHc082bGNxcWxiZnEyWTJQWUsr?=
 =?utf-8?B?Y2pSZ0RUYUExTTdFUy9ZcEJWL3I1UUU2dFdrNW50dkx3bGYwZUVSSnJFZGY0?=
 =?utf-8?B?N2w1MVhHRy9IRFFjdjNhR3FCMWREZlVhRU95c0xDNS9Kd055b1d0VG5leVRr?=
 =?utf-8?B?bEpJYnhRZktRdDNIWE4ySzEvOVAxTnJBWVRMYUo0WUJncHJGSllHUT09?=
X-Exchange-RoutingPolicyChecked: qf/h8Fy5tM2GQRB+XPcBmFY13gWUuzYHgNAvwA/IHxCjffUf31PROHc40mNx25gTZ7UZzDllejhGfj3udIPo9zJG4TLFaSb8iOEpO6nWGWVkNYGpv/tdIGIVzNtpc6tkT3D2SfqPp02qV/jfA7STSXe8tKyQ69BqdJnec8bPTRsxxoJFpRJu9mLU0WxIGLb39gQghwCy9vNM85CUjJcXNa9d3uNkaL7gnUj5puPm4sXZ+ZH6ChGMtwXbx1a1qpHI0FuHBHcJCr8B2WM6SioxbxQDtv4ZO5cR/rrNUtIe05Wp74bzCDz7v6DCdAstnilTNzwSgMp8cf9/s2tAmnb3aQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dfe83c-19a8-42f9-0f27-08df28d0827e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 02:20:11.8487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BmdVcILhRoI7x0d7uvwXf6Y7DSOpg3gtXZDYdPWMkxEsZ0rHuCYKMRZsY6/6LdTddBvXfmD8GZD1HYWU3WMRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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


On 13-10-2026 06:29, Rodrigo Vivi wrote:
> On Mon, Oct 12, 2026 at 04:36:48PM +0530, Karthik Poosa wrote:
>> Propagate all failures from pcode and mailbox accesses and fix missed
>> return-value checks found by Sashiko in
>> https://patchwork.freedesktop.org/patch/758843/?series=174898&rev=6.
>>
>> Fixes: 7596d839f622 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
>> Fixes: 0c5405d3aa4ad ("drm/xe/hwmon: Read energy status from PMT")
>> Fixes: 25e963a09e059 ("drm/xe/hwmon: Move card reactive critical power under channel card")
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Please add this as part of your re-submission of the other v10 series for the CI
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Added it - 
https://patchwork.freedesktop.org/patch/759632/?series=175993&rev=1
>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 47 +++++++++++++++++++++--------------
>>   1 file changed, 29 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 768566648bc8..fbcc04341e29 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -381,17 +381,20 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>    * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>>    * clamped values when read.
>>    */
>> -static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
>> +static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
>>   {
>>   	u32 reg_val = 0;
>>   	struct xe_device *xe = hwmon->xe;
>>   	struct xe_reg rapl_limit, pkg_power_sku;
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> +	int ret = 0;
>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>>   	if (hwmon->xe->info.has_mbx_power_limits) {
>> -		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>> +		if (ret)
>> +			goto unlock;
>>   	} else {
>>   		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>>   		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>> @@ -423,6 +426,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>>   	}
>>   unlock:
>>   	mutex_unlock(&hwmon->hwmon_lock);
>> +	return ret;
>>   }
>>   
>>   static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channel, long value)
>> @@ -445,7 +449,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>>   			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>>   			if (ret)
>>   				goto unlock;
>> -			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>> +			ret = xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>> +			if (ret)
>> +				goto unlock;
>>   		} else {
>>   			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
>>   			reg_val = xe_mmio_read32(mmio, rapl_limit);
>> @@ -502,15 +508,18 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>>   	return ret;
>>   }
>>   
>> -static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
>> -					  long *value)
>> +static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
>> +					 long *value)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   	u32 reg_val;
>> +	int ret = 0;
>>   
>>   	if (hwmon->xe->info.has_mbx_power_limits) {
>>   		/* PL1 is rated max if supported. */
>> -		xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
>> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
>> +		if (ret)
>> +			return ret;
>>   	} else {
>>   		/*
>>   		 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
>> @@ -524,6 +533,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int
>>   
>>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +	return ret;
>>   }
>>   
>>   /*
>> @@ -546,7 +556,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int
>>    * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
>>    * energyN_input overflows. This at 1000 W is an overflow duration of 278 years.
>>    */
>> -static void
>> +static int
>>   xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> @@ -557,7 +567,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>>   	/* Energy is supported only for card and pkg */
>>   	if (channel > CHANNEL_PKG) {
>>   		*energy = 0;
>> -		return;
>> +		return 0;
>>   	}
>>   
>>   	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
>> @@ -569,7 +579,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>>   		if (ret != sizeof(pmt_val)) {
>>   			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
>>   			*energy = 0;
>> -			return;
>> +			return ret < 0 ? ret : -EIO;
>>   		}
>>   
>>   		if (channel == CHANNEL_PKG)
>> @@ -586,6 +596,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>>   
>>   	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>>   				  hwmon->scl_shift_energy);
>> +	return 0;
>>   }
>>   
>>   static ssize_t
>> @@ -611,7 +622,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>>   			drm_err(&hwmon->xe->drm,
>>   				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
>>   				channel, power_attr, reg_val, ret);
>> -			reg_val = 0;
>> +			mutex_unlock(&hwmon->hwmon_lock);
>> +			return ret;
>>   		}
>>   	} else {
>>   		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> @@ -1391,7 +1403,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		}
>>   	case hwmon_power_crit:
>>   		if (channel == CHANNEL_CARD) {
>> -			xe_hwmon_pcode_read_i1(hwmon, &uval);
>> +			if (xe_hwmon_pcode_read_i1(hwmon, &uval))
>> +				return 0;
>>   			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
>>   		}
>>   		break;
>> @@ -1410,7 +1423,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			}
>>   		}
>>   		if ((!(uval & PWR_LIM_EN)) && channel == CHANNEL_CARD) {
>> -			xe_hwmon_pcode_read_i1(hwmon, &uval);
>> +			if (xe_hwmon_pcode_read_i1(hwmon, &uval))
>> +				return 0;
>>   			return (uval & POWER_SETUP_I1_WATTS) ? 0444 : 0;
>>   		}
>>   		return (uval) ? 0444 : 0;
>> @@ -1426,11 +1440,9 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   	switch (attr) {
>>   	case hwmon_power_max:
>>   	case hwmon_power_cap:
>> -		xe_hwmon_power_max_read(hwmon, attr, channel, val);
>> -		return 0;
>> +		return xe_hwmon_power_max_read(hwmon, attr, channel, val);
>>   	case hwmon_power_rated_max:
>> -		xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
>> -		return 0;
>> +		return xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
>>   	case hwmon_power_crit:
>>   		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
>>   	default:
>> @@ -1547,8 +1559,7 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   {
>>   	switch (attr) {
>>   	case hwmon_energy_input:
>> -		xe_hwmon_energy_get(hwmon, channel, val);
>> -		return 0;
>> +		return xe_hwmon_energy_get(hwmon, channel, val);
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> -- 
>> 2.25.1
>>
