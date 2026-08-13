Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DA1C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 05:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A917A10E36F;
	Thu, 13 Aug 2026 05:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/KWthgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5393910E36F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 05:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786597429; x=1818133429;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lES/3W3Xak/Qkg4iI5e6HJe5jVaafVs2V65Bp7r5F2U=;
 b=k/KWthgYB4RrtMAemM7LCSWZBDDA7b6wGcjkyJTI9jtjlbgVximTE9JW
 3EQXVkWwFPw3QEwqb3DkzPe2SfqO/ICKg4i2y7UKUvJQvLqhoGa2ZaCPv
 SBAjT8rhSlMQIahWmELQzg0iNAu+zWIzYNu4yET4XVRCt0J0PzcdGdJvO
 QZd413wbqIoh3O8ufTnK6wJlFl36fhiUu9hqDlO4kK4KVRU+qw0Uyw/G5
 7pk9VAlNX4JG4tn415/ZY5eUAG5VDnJEgCtzG3CpBCqaJM8cLoI46K4k1
 mmr0P8wnWqSW0amzDqhQnwSNTidR7RWsUL90xI8RmLzJ+p2MEnEnUCvLz w==;
X-CSE-ConnectionGUID: AGRUIPp7RUi8LVf7qpmBkA==
X-CSE-MsgGUID: 92aWm77+S2Sye/aNirkLLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87044308"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="87044308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 22:03:49 -0700
X-CSE-ConnectionGUID: vj5a6wHZRLiLdX88VxNetw==
X-CSE-MsgGUID: JA7OBj/KRNyQIXvmj1j+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="260545281"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 22:03:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 22:03:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 22:03:48 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 22:03:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrG88S1PxysYbPcj29NKhgpOqfebyUm0mU37cqZfbSzK7r6El7dbBY7XD34iD5Zm4ecwdh8LqMwo9LpX+wQcMrthEgnL2gK1uSdOMeo/x8ui6EnfOADoTpkZsZiFwdGNdNIFKL5PJwzqNmb0jG1QKAzdYd005alOFeDKB69iyMgSFYeMqqK1z+4KMVevL7ft5zroOcC3QVRq0BykDyUevhAvurpUB2cqaR/qMXqzp6wvIPjRP2hDTQ2DNBu1VfhBb3szNUMBjJrT88rqMyWrFH9KFdEw8pOQ9411A0ZnzUGtABU1OUufgjnwwIDk1V7kszvLqnAx3kVz3TtzPJoVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlgwdzExamsbNhF5eXg4YyQ64CXrDRm0UyEw8FvfQKI=;
 b=cPT3SpfiTJ3Mi++qAJN3BOWOgAjKfBH3bW5J3QKVctL+OMy3OzNM0iZCv2/SMwCZsLumzGZ/vVKH57qjf7ROSvcw/BwQUHKTM4v1Q+j2YFcfvWzkCTGhS2jt68dWhyk+lhsq/UminoGcKy1QyKdAkYTzSq28ezJgCX4idf+9dCFcYDveuVZg/MAMKU9SgrDNAAblwkdbgQsawLVDmZ1y5WQh2CyBDAYe+elKfctS8VW1TJ0Gy3Fm/F+weFq3d+HWSY1GkUnzfLBaXgTWG/CSqwS1Yj7NZG2MSn8D8rGiXQCaZ5PBec95/oR0/A2nlxyhdURzRhqdq6/+fE0N+JGFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB081371.namprd11.prod.outlook.com (2603:10b6:610:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 05:03:44 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 05:03:44 +0000
Message-ID: <235c7661-8c40-4185-b0db-2c8b01fb37ec@intel.com>
Date: Thu, 13 Aug 2026 10:33:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/32] drm/xe/log: Add hardware error signatures
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-13-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-13-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB081371:EE_
X-MS-Office365-Filtering-Correlation-Id: 226aeb9d-f035-46d9-b1a5-08def8f83fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: Inzpbjm8dNAfLqE6+9G8oY7l0zw4q4f8UcjCXrK9/piEiUW3GhndnxxBGvMXQhY7hIFk9WUwzSRCrPVa8RrgTw8ZaJd+jII+Hsi8n8OSKfAQiK19T8ENa6nQ1TLVt84ZXnvrKqmx+qrA656g50f7pGWJ/DVzJ/TAmBoeM/sBerJZfv/HHwr/sCwnzrcGZBRvCFsB3Bu77GDl1DuDMo1LKhxmq6FLhkoE8iBngs8u4Q4J2lcWStUy051aXA1YbFsq5vjz/GuJxkoxPbA1tJLF8yv0+SKqOu7C90FeedTv9k2Ojv2iCLmyAOqNLevGN2+PpLGfoSmJxsEcf+hrxc/alZ9fKJhN/sRR3Rzs6uZdTY9R2oHwtH/mVjFnF3bS4x9QJi6R9mAj0oVkPXdzW4a0JsjW4Vfc2HIK1GuJZNQUiOk+r2SEnl4kRX7ZNagNkUWWZ8eUu1t/4F/S9vMw+olrBJFxFqa5DVyPWKqWKVTgXKyM2/0h2NYXgNNps8uOqhqnseg3lGp5jYPEJj9Vsc6TUNdQovA5oGBaienpUXa85v/gAczrt/E9OoHfSeW4fZY2X4tEEaDV1RL2gmu56+1NQgZYXlvj3z0w93GZZ28rod8iJ+TPJvBKruRzivMZ3RvpaXYfA3Xefc7kAXdBoMCrM7LD1NEA7AaMyQwzTkZ4Zys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWdvMk14Um1PUGErWXBFb3cxbnJUNk9GRWpYcGtURmZkeVNvZ2d2Sm8zMkYw?=
 =?utf-8?B?amUreU9DcGdJR2VGMUl2OHlLVTMvMlY0UjJydEdGNEVyaW5hWHp1UXNqWjJZ?=
 =?utf-8?B?eHR4Q0doSGpOb0MxVkZVYS9zOGRCeklUSm96R2gzanFEbndCczYxd051YVRE?=
 =?utf-8?B?WlVER0pnVVNMMnQyUGozMHBFakc3czZCUzJjNjFPdHdrbGRhNG1nQ0FudEhF?=
 =?utf-8?B?eTN0WlNJYm9VRlY3VkJxZWtOZnUySWMza2FzeUhIQ0hRVU9MUFppRjRLS1VR?=
 =?utf-8?B?UUp4YTF5MGFhYytoVW12TGN6eXdBK2dwcERKMDM1WUcvc2dMdmFpUWl3S0t4?=
 =?utf-8?B?aFZqSkQ4Y0cwTWdwcFBlclhMS3RFeDNNcHluOEY5VmNMc3BaVGJCSFZOa1Ny?=
 =?utf-8?B?Ym1jZWdHY3RmSHpsZDBoK1FtdmxaT05VSUVVVktWQUZ2WEtHemh1ZTlBZEZK?=
 =?utf-8?B?a1dFa2RCd1gzaUk0STlGd1VmVXRFQkJPRTduZkRHakI3eFJ6VWhnYzMreEp1?=
 =?utf-8?B?KzlMcmxMNDUxdWxQbjNza05GRlh3Wk5IemxtbmlIZ21Tb2R2WDduMEUrYmFC?=
 =?utf-8?B?VG1ueVJrRVNrUWl2Y3NhSDlDSUF6MWhsVDdNZ3ZockhjL1huZ05KWXZiak90?=
 =?utf-8?B?QVZvZ3FhNnNPbFN2cEYyVGJNUi80cU81ck44NDdhWXQzM2VlK0liVFI2REVy?=
 =?utf-8?B?TEt3cCtEdWR4bWhJeTBzNEFVZ0s1WGk2SUFaV2ZvZThLekZadlV6MDhhdGla?=
 =?utf-8?B?dUl0TlV5anVyeFJ6bEhnYW1WdU1XNmJWM2d3ell1UmRlL01tbkJQNUFnR2Vl?=
 =?utf-8?B?U2V5VG42ZW9idDhpMEM0NXNoalRSRE9IUnhEbC9NKzZvUFg1d2hxK2RnOUF1?=
 =?utf-8?B?V1I5VlZVZldqUWt0dU8wMFpCOFNpdDVLVE5DeG1USUhKM1phMXFWeU5LOFJz?=
 =?utf-8?B?ZXNPK3A2bjZtdVdrK3RtTnBsYlhLMGJCa3BlM0Viemg0azdBcnpiZkRld09n?=
 =?utf-8?B?c2IycGhrSUMzajNRQ3VPSzI4MmJBMDE2b25GUDRaRzgrVXU1K1EzZW9iYXlB?=
 =?utf-8?B?MXd3eDhFSER6bVlXd0xqQzkySlEwNVB0QjJyZW40S3BGdWZiand6SjhJbVEw?=
 =?utf-8?B?T0FvamgxWGVVZ3loZi9CV3lGWGJYRTh6czVHL0xobWNDWWZjV2x5VlNYS25t?=
 =?utf-8?B?eWo0azQ3Z2UwVytPd3c0SW1hZzJ4ODhsWUZEdWNrbDI0U1FWZFZpQjlLd3Rw?=
 =?utf-8?B?cERnTmowZk5NNExoMFhJVTQ0MEZyK3k5NVBlK1EvMXRVNURKeHU0ekZaSGxG?=
 =?utf-8?B?aHhXN2JBSkxEQWhlWUtrSTBkOTRwSjk1akFMUzBFQnJldDllR2tyK3I4ZWU0?=
 =?utf-8?B?L1BzN1ZYOTVGcDRsL0dMZHd5ai9GVldWUFp6d0l0QkJnTitScGQ0M3NzU04x?=
 =?utf-8?B?cFBUZHROQmRLOThlczNhUEhXcXhwdWdySklYY0FaRXRBSVhaWXZIbmltYVBJ?=
 =?utf-8?B?L0VVN3VkSVR5WjY3SG0wUjhzU0YzQzBkWTUyc0ZLT1Q5b1JsY1VNeVNlaEE3?=
 =?utf-8?B?VjlYaG1XZ1JSVGZWbW1iZVk1N05Ta01QT3RDZ2hKYWM2bzhobEVkcVRyRmVX?=
 =?utf-8?B?di9Sd0ppaEtZYUF4K29jczdsb0NHbFRlWGJCRE41bkJGeHdPYXFya3JWWEhp?=
 =?utf-8?B?TG04NkdEN2grSmxHY1JYOTM2cDJRbGd1TFRZMUF6STFZZlo2di9QRTlrWDVi?=
 =?utf-8?B?YmliVmZVRUowYnRTOFd6bTc4c2FRL1hRNitJWjdwSzB1dGdybnZ1RU9QcFUv?=
 =?utf-8?B?N1I3ZXpZekt1WlNtcUJST3JlWTVCVW1PL1I5Ri81YnREY1VNcjRCeDZpY284?=
 =?utf-8?B?QXExdlNTNVp2cFhuUTIySER1cy9vWWNFNlk1UndvQ2tVTGJjU0U1U1lrNXlI?=
 =?utf-8?B?TEdJTFM1SzNWenRjRjFIVG5QZ0VJUVdWMms5K3pJRUErWk5FWU1rSkkyL2Zu?=
 =?utf-8?B?cVNTVnZHaWthTitGRkJYZzg5Z01UQTRIa1lJZzI3VVBPa2FLTFQ5KytVaVVu?=
 =?utf-8?B?YThYYWVQNnllZzFUU0orV2FicnJ4amYzSXY4RDVPcVNOb3NXaVk2VFZRS0x0?=
 =?utf-8?B?aWtZVlYrZndpY0JKMWpTdkxmSmt3bU1jY0NvaGpnajM0ek1OUm4xSVREdDFD?=
 =?utf-8?B?RzZ3ZFdubnMvUndvWjcxRW84NVA4QmdiRzllVHNYODNzRG1zdmxkbHF3bXhm?=
 =?utf-8?B?dENzSkhaQWpXUlZCaEtzdjZhTDZmMFpDUzVuaVY3OGRkMWwyQ3h6TklIOExK?=
 =?utf-8?B?c3YrM2VVeVArUlhMaEhLKzREdFU0NWFiM3E3OEhtaVU2cG1IWVY2c08xOTJY?=
 =?utf-8?Q?HdEPBF7C6g7PVcwM=3D?=
X-Exchange-RoutingPolicyChecked: IxyXcRi7Cnc7Bxd7EbCwdsdsjTl1ZcxpOTdKu4Tt1kXwMF8wooTqnvk/AOd0e2rqy/gU3ubt7sZAZ+44tBKjRl1IQpIK044iQ6Tyj1CEgL0fHS4gSv7rlpg0ZpPLW5PiiVgjuUSoJEuSWUJ8dMTsKnf7gqL1Ho0v1UEhCB/9g17spji3Z75igv574PC0sMFoy5aLWlosNJMraIpN05+rt8FmtP0bmg4rRJ886tItJB+XaHkU/dp4lF/Ka7mizjCKkMzR6D7kPlj/d17UbjqHir/VcxEB2EzmuWvsIabkd2UISzVRdqS9W4GkTs7t6h5xAuet5lq+N9+yjDgUP2YChg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 226aeb9d-f035-46d9-b1a5-08def8f83fde
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 05:03:44.3733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc2ic8BOJcPM6Io23YU5TwwUYlWJGP8ledoEPWemEdLxGggayaIgG+qqX2qywkNRlwlRhZMotDn2Pxgx7ZaeDzRViLhNpLHcIDK1wfPGdjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB081371
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> Extend our error signatures definitions xe_sigid to cover also
> hardware-originated errors and make them distinguishable from
> initially defined software-initiated errors.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Please add "firmware/hardware-originated errors" in comment message.

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: update comment (Sashiko)
> v3: rebased
> ---
>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> index 93967183ae51..8e3c7ef579b9 100644
> --- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -137,12 +137,18 @@
>    * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).
>    * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
>    * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
> + * @XE_SIGID_HW: Generic hardware failure.
> + * @XE_SIGID_PCIE: PCIe interface errors.
> + * @XE_SIGID_DEVICE_MEMORY: Device memory errors.
> + * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
> + * @XE_SIGID_FABRIC: Fabric errors.
> + * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
>    *
>    * Each SIGID represents the report sites the driver detects and reports.
>    * Values are numbered sequentially, are only ever appended, and are never
>    * renumbered or reused.
>    *
> - * Firmware- and hardware-originated signatures are not listed yet here.
> + * Firmware- and hardware-originated signatures are numbered separately.
>    */
>   enum xe_sigid {
>   	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> @@ -154,6 +160,13 @@ enum xe_sigid {
>   	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>   	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>   	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +
> +	XE_SIGID_HW			= INTEL_SIGID_GPU_XE_HARDWARE_START,
> +	XE_SIGID_PCIE			= INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
> +	XE_SIGID_DEVICE_MEMORY		= INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
> +	XE_SIGID_CORE_COMPUTE		= INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
> +	XE_SIGID_FABRIC			= INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
> +	XE_SIGID_SOC_INTERNAL		= INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
>   };
>   
>   #endif
