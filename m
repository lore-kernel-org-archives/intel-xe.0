Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737A5C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 16:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3304D89CAD;
	Mon,  6 Jul 2026 16:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wl/TXzst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F31889CAD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783355672; x=1814891672;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qJrMXeVCDAMWZhNCvIz0UVAENAWfFKMwI43rgYttbFw=;
 b=Wl/TXzstey+SD1ca6c/MWO7NktTT7cetn0pOWbRtEtNaR5AQa1ifWDsc
 ydoJ4flYGafBgMP0A/JUIPycNkPrzn0kdgQxHn4MtKCi12VhZ+1k0SZzF
 F9E9BVlrJRAzNXPwvOpZdM/QnZp81hGvXItMznODp/5MpG1MIVslXLGzy
 3/mCnd5E2wGMJCIRnG5mJ/jwVJK0jzmrbPQfX38RQRkVnkVKwGJ2x3YQY
 DbfSWs5eq64P1lI3ZeL4K68MyXvJh6e9cVOltAhL8WBFvmTnBuxaTjoby
 7OMbxCTqw6Qj0g7/2ZMsxAmaVnMphPw3gstfE2/wm4UJrPU0VhKmoMXNY Q==;
X-CSE-ConnectionGUID: SuyYcxf+R2myOISLiKCVxw==
X-CSE-MsgGUID: eNSH7X+RTz27PqBMq7SMzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94353295"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="94353295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 09:34:22 -0700
X-CSE-ConnectionGUID: zDzexI28Tz+SkPmaefX41g==
X-CSE-MsgGUID: GXVm/m1bRsenagJoFHz9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="249316443"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 09:34:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 09:34:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 09:34:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 09:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StUQqPZX29YAoFoQew7iJgl71+gyZWaiU70yC4Mfavnu3wm33ZXl2cVDr94pDA9c+T2He+76L/Rj0qVUJ6BJnh4V1nXv4aDr6D+JsJsEolATIbEjXNj30GaC/IYJ0q/qGKS4aczqcHxKZJQOmA1P8S2EjJayB345keP5cOdljdisyC9L+0H+aNQCzXIjg6B+k4l9FXsvdyXt0OrMzwzsi2T9YHXsnE3mXOQV4h1OkM0WCXxvMvEvwgkSNTvWFBT7dweH1vtxqZIfF7NPo6WTmwyo9G2TbpRXxN+GX5++cqW3leQ6wrxPKcmSCjFKbG8ud4TKUkpbsSt+PjFtS4FGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1bPuPHKu+LN5iiQoBgWs2rfuIF8lqVfe9QYuAMkcr4=;
 b=vzVZyzYeVVM775FyWbZDsryszWdgG3csLpSfkv/5JLcHqkkLdxRSXBfV5+0e3prbBaaRkQ0DHoE8ObEpdGWq9vpmnQvLLromzHhu2P6WHmOgdeNqfwqi8ie8ADuHrMbMszk270lLtJV/odpxaKnKZqSTMAzh4ywFQvMPexwcNdSfaRoa9AEwpxJfexIKTAg+p++KNPmOG2v5gdSV0KYAQjfdP1xDv0sOJWFG3T7onk+hBxhTnUKBDlmyb6VZal0QPICOPzNJTnbl20cQaaz5TJ7aE2o5JeqzMW9a2v4Sfz5byiJq+rIL8FyHHitNR2xanQS9Q9jDklEWQlpz1CgTIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CHAPR11MB9656.namprd11.prod.outlook.com (2603:10b6:610:2fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 16:34:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 16:34:17 +0000
Message-ID: <9ddc0d94-e2f5-46b4-9c95-ffe50fb42e80@intel.com>
Date: Mon, 6 Jul 2026 18:34:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] drm/xe/tests: Add object encoding helper test
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-11-michal.wajdeczko@intel.com>
 <akgfPCdZU8bXmWL9@nostramo>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <akgfPCdZU8bXmWL9@nostramo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CHAPR11MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af5ceee-0361-4473-c850-08dedb7c6c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: rU7Qrb+OABQrI1VWpNhbDRxLTVCcZU/MQ9fHkrQPIjUYl4yJR+AcBL1GCd4vbkUEiwG8YzUoNJAR0Me3kGzTdskGTperiF2QWlnwuCwijGxXmKONRGLbNTxPzAfBuvOOQ2AjDURzgDeLU/YcQqlVDluXo1jY4lOskq1tztuDbA6ihljEShBrRKPs0W+3/EZswAArVXVg6BIT9lqh+Uxv2nyo3hPzvBgy7I639zibbIC7e36Md55fogHnAtpGkLC6p3KsjrltBfKeTW2iXPSUsbsgQhoUyO9SvGBPrLAF695sn2PsGYcQHJIdeFKEsuLy6SVbGTH7ay0OW6O5tgmef4qKGpPebN8EBFqqKWnoY+29nHMuunjglZouYhCgkq9Ov0YPzdpoGPs7Sjw69teK3PXjD8s3XD3r62HNg/jtVfPe9vyBuaTuONYB9Hun2InXIU+vGHeB2X/2olL1zpe4+ZRfObmOqdAbfzuxQLazdYhaCE32KOai7H1rwq6/LTqjX1FQXjHtAadPuvc3xEMmJkZRaHE82f7DJerwpghirt94BfHqrNg5jUCR5gCxtsxV8UgMk0zmPOQQaFCdbgQKf1vOT8xmksK1j0S7OgxRR2CbNsAP+0uNvYRgi78Y/24erW1NcR27/M9fzzToX5t+SC9J/Tnxmc9V/BJpLwnU+ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0wrNmticnVIa1lFUXlWdUZubXJaSTI0VnpBVG1HbmJSUVI4N3BoaGlLdk5Y?=
 =?utf-8?B?c3RiaFAwdTZzU2UyN09qVWgyQ1k2QjBaa3BGT2ZVZG94Q0JncmQ0MUNPVVZu?=
 =?utf-8?B?dmU5dURmQmNsSmE2ZWJ3S2REd1NRdWgybFhCN2M4WjVUUm9KeEVBdXdrWW1L?=
 =?utf-8?B?TCs3ZzRhblNvUnNXUHdxc1pKWDNYYURHNnN2M2JPQ3F1OXRjMXNjeFZQS08z?=
 =?utf-8?B?ZnY4cThPOWFTYmdZUlEydzVKRU00NFhYN3dzRkdMRHEzeWZkUSszNDVNZUZu?=
 =?utf-8?B?NW1jVk5jYWNUUVhBRUpLb1drelhIQmJmVlBwK3pzTE5IRzBXQzB0K3Mxenlp?=
 =?utf-8?B?UHpXVVlNY2ZObnMyR2ZJSlJ4cFdNZzcxZ25CMDRybUcwK2JNSkpCSitPSGpv?=
 =?utf-8?B?Z25xdUJ1ZDd5M1c1OWNQOUJVb0ZTQlgyK3ZNTndLSlhmcTAxVGw1WTZWYkRy?=
 =?utf-8?B?akVXQ0VJSG9jU1VRSWZOZU9BU04rbXJOa1JCZnk3V3BBTWpxaHRaNktJNHdM?=
 =?utf-8?B?V3pjQ3czNFdXYzVIVnVkUEQxN0RvMzV0bjFmY016dG42S1pKam1OMVIyVFJj?=
 =?utf-8?B?NDRGY0pMTzlSWXBhRFdzT1BOTENuNUVOdGs4bDY0a0hzRmZJcmsrdm5yVkZ2?=
 =?utf-8?B?TUZpTXFRYU5QTjlFMWJKa2tNME0xM1VwWUdMWDFTQ25yYjJkeFI4c05jK2JX?=
 =?utf-8?B?bmYrckV1UkhQQlhQbUZPTnplcm5pOUU4U3c0ZUxkU1dzVWw3RVgyUnpiZXFs?=
 =?utf-8?B?SWJ2Y0RhRjFGT0RzRDZWdmFkREZpRUZObktmZGEvblA0Q3BzeklvMWE5S2o4?=
 =?utf-8?B?a0FXK2xPT3NMbVNOZGxXLzN2R0lqQmNPYWQrd1NuaHdmTlozREFPcXpOS0tx?=
 =?utf-8?B?UFJFMXRjT3BmTm5HVkNURFB2ZklpbHZ4Y25rcXNQZWRENk5JaWhIT0dIb09s?=
 =?utf-8?B?clpvUFc3QkFjVXpTdFRLZDVSMnJ5R1Z6TlQ3YnBPbGZaTVYyTlZuWE5MRnQw?=
 =?utf-8?B?N1VyRlpXQmVTTnpOWWs3WlNwaTFLSHdMbTRPUUNYS2Nta0xYZ2xCWURkU2t5?=
 =?utf-8?B?akVWZFZRVUNySFpERGYrbmhuTnBUN2hUTnNIS1U4WXNkc0NYTVBBaStxMjY4?=
 =?utf-8?B?d1Y3VVIvSDNQbjEvV3JSY25nWnlITS9LRGovUVF4eXZpTHZZZFlNWnFKQUh5?=
 =?utf-8?B?WHJtaEhYbHMxdG1yQ1ZJT1F1cWlEdzdBZk9rc3Jka2J1Q0VZcExtaU1aU3Ny?=
 =?utf-8?B?UmRSdTZTKzE4bHlBNUNVS2NZNytRWmdtUjc1MWVKRVNZbngvei9LNElkM3Q5?=
 =?utf-8?B?czhwTHlKZloyNmRicFgvK2YrVUErZmNTRFhFVzVXOHVkaVVpQ3plbytOU3hu?=
 =?utf-8?B?bDZxSHVkUFBMc3A1V1RlWXo3Q2NqY0I5SXVQU0c4R3drY3lkbFIzZFhzaWZr?=
 =?utf-8?B?VHI0bDZlWTgyTUE5Zys0eXE0UXR2dHVEMTArNkRlVTVhMUZHTmFUaWlIUXNZ?=
 =?utf-8?B?dW9NQzRqRmh1WGdTeVFEZFdyU2dtcTZEdE91a2VUeHcvejNDbjMzdEpZUm5T?=
 =?utf-8?B?R2Z3RmJ0Y2M2NThuSENrNlVoRzB4dGJrQW51WCtqbnA5RmZRNVBtVlA5c0tH?=
 =?utf-8?B?WE9MNGw5N01QNkp6L2tsSDV1VnpFWjlGVDlndGJndUlNeVVRejR6M2NlK0FL?=
 =?utf-8?B?anR0ZzF6RzI1L3ovdWJzdWdJY215RTJ0SE5jRmUzajBiSFRlZnY3bld2d1h2?=
 =?utf-8?B?ZTdNT0N5bGVEMjF5UjYyWFN1dEhlaUUyZUt4eEpoUm5FU3IrdERJRzB5NVF4?=
 =?utf-8?B?c0lBMVJEQnF6VExVTjhQY0FpU0E1bGZFaDBkREVvZG0rS2xIU2lhSDNUOFNx?=
 =?utf-8?B?UE8ydVpYMWY2M0VJckd5UmQyTGlwdVUzRmc4cXJNSEZUSTBENnlkeWxMWmtm?=
 =?utf-8?B?V3N0eFM1aWIzQmg4Z3UxcDRKMGVONmo1ak15WHVUR05wRDcrQmV0OE9PbG4x?=
 =?utf-8?B?L3M0clgxS0xTQWhxZXh5czk0S2xzTkx5N1FDTndWaHd1RnVVOFFvV1l2bUky?=
 =?utf-8?B?TmN5MVR3WVBMQStvTWZTQlBXM1NOamJtMDV6bTV3SFRVRStVb0dDemtXeEtp?=
 =?utf-8?B?QW05Z0phdkVNWUNMVGJtTWNueXB5R3FtR3F6MkM1WWROT1RrUUIrK1p3OFEz?=
 =?utf-8?B?Mk1KMlRjcFlXVzE0Rm80YlRIV1JzK0tNZkhLemt4cldUSk5PQm5zMzZDQ3oy?=
 =?utf-8?B?cmJyWnI0ZDY3Vm8walMzM3FhWUhDVTE4ZktlZ1VtUzBjNHNuUDllc2g5QVJX?=
 =?utf-8?B?amZFVS81S3FmcEoxTGFQOGhCZ1VaYVViRW5LNW1MVlZBcjFDUzY5SWJEY1J6?=
 =?utf-8?Q?yS2xF2K74PQgRycw=3D?=
X-Exchange-RoutingPolicyChecked: pzZojezfehOUxt59ly2eJOYNYHMNpPtAf+PLa0Uepl7Fsh10H9D3N6tlFG9A/61+5glogv7X37nqnEd9euav4aAN+xgvcOp7G7hXv3yx6Jd1uQeU4o209eXmk6Zc56BnlnorSG1GApvpbvcQioCLWTqrc6xLUvc8sfHhDcy/yVoVoNZKRDhEaAUUwe1gdbZBe8OhZf3zPo85xW0TGb8ZvB0vZ3ddtrd8XSyOsZbstlyxFmW+seivL/L4WFeK1Om6rej7RiCvN2Cbsp2euBBV+fxhOJsbYCCYCJ5Sxmkgeaumq0MrKrGvv2nG5MU1sOQevoYfjg0x0GIvRER75tVLVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af5ceee-0361-4473-c850-08dedb7c6c90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:34:17.8833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSCE6F7gO1zOKFt91RTJFxZ02Ru2H/tYe5bjlMInon5T86PGAVcPFRDrXrC5wbDqYViAuULnjrNYSmC9bfxs6h8kcOB3tr+3YudPQb1yVgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9656
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



On 7/3/2026 10:47 PM, Michał Winiarski wrote:
> On Tue, Jun 30, 2026 at 03:26:29PM +0200, Michal Wajdeczko wrote:
>> We will soon be encoding complex objects as KLVs using our helper
>> function. Add few simple tests to make sure this helper function
>> works as expected.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 162 ++++++++++++++++++
>>  1 file changed, 162 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
>> index c2d5f0098816..9a8acc85e9f1 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
>> @@ -7,6 +7,7 @@
>>  #include <kunit/test-bug.h>
>>  
>>  #define TEST_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3de)
>> +#define TEST_GROUP_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3f0)
>>  #define TEST_PAD	0xdeadbeef
>>  
>>  static void test_count(struct kunit *test)
>> @@ -129,11 +130,172 @@ static void test_encode_string(struct kunit *test)
>>  			    xe_guc_klv_encode_string(failed, ARRAY_SIZE(klvs), key, string));
>>  }
>>  
>> +struct some_object {
>> +	u32 value1;
>> +	u64 value2;
>> +} __packed;
>> +
>> +static u32 *obj_raw_encoder(u32 *klvs, u32 avail, const void *arg)
>> +{
>> +	const struct some_object *obj = arg;
>> +	size_t sz = sizeof(*obj);
>> +	u32 dwords = to_num_dwords(sz);
>> +
>> +	if (IS_ERR(klvs))
>> +		return klvs;
>> +	if (dwords > avail)
>> +		return ERR_PTR(-ENOSPC);
>> +	memcpy(klvs, obj, sz);
>> +	return klvs + dwords;
>> +}
>> +
>> +static u32 *obj_klv_encoder(u32 *klvs, u32 avail, const void *arg)
>> +{
>> +	const struct some_object *obj = arg;
>> +	u32 *end = klvs + avail;
>> +
>> +	klvs = xe_guc_klv_encode_u32(klvs, end - klvs, TEST_KEY + 1, obj->value1);
>> +	klvs = xe_guc_klv_encode_u64(klvs, end - klvs, TEST_KEY + 2, obj->value2);
> 
> Sashiko spotted that we should check for errors between the encode
> calls, and that's probably a good idea.

the complain is about the calculation of the avail parameter, as with klvs
pointer being faulty, result of subtraction is undefined

but

the assumption is that all encode helpers shall ignore avail parameter if
passed klvs pointer is invalid, hence passing garbage as avail should be safe

and this allows us to write simpler code, as any encoding failure must result
in ERR_PTR, which when passed to the next encoder, shall be immediately returned
repeated by the subsequent encoders, without looking at other parameters

thus we may only need to check the result of the final encoder

and here, this is a pure example encoder code, for the test purposed we check
the final encoding result in the code below, for object encoding test purposes,
we don't care about internal encoding steps taken

> 
> With that:
> Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
> 
> Thanks,
> -Michał
> 
>> +	return klvs;
>> +}
>> +
>> +static u32 *obj_nested_encoder(u32 *klvs, u32 avail, const void *arg)
>> +{
>> +	u32 *end = klvs + avail;
>> +
>> +	klvs = xe_guc_klv_encode_object(klvs, end - klvs, TEST_GROUP_KEY + 1,
>> +					arg, obj_klv_encoder);
>> +	klvs = xe_guc_klv_encode_object(klvs, end - klvs, TEST_GROUP_KEY + 2,
>> +					arg, obj_klv_encoder);
>> +	return klvs;
>> +}
>> +
>> +static void test_encode_object_raw(struct kunit *test)
>> +{
>> +	const struct some_object obj = {
>> +		.value1 = 0xdead1234,
>> +		.value2 = 0xdead87654321dead,
>> +	};
>> +	u32 payload = to_num_dwords(sizeof(obj));
>> +	u32 *err = ERR_PTR(-ENOSPC);
>> +	u16 key = TEST_KEY;
>> +	u32 klvs[16];
>> +	u32 n;
>> +
>> +	/* too small, must fail */
>> +	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
>> +		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
>> +		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
>> +					xe_guc_klv_encode_object(klvs, n, key, &obj,
>> +								 obj_raw_encoder),
>> +					"buf size=%u dwords", n);
>> +	}
>> +
>> +	/* must pass */
>> +	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
>> +				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
>> +							      key, &obj, obj_raw_encoder));
>> +	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
>> +	KUNIT_EXPECT_MEMEQ(test, &klvs[1], &obj, sizeof(obj));
>> +
>> +	/* already failed, must fail */
>> +	KUNIT_ASSERT_PTR_EQ(test, err,
>> +			    xe_guc_klv_encode_object(err, ARRAY_SIZE(klvs), key,
>> +						     &obj, obj_raw_encoder));
>> +}
>> +
>> +static void test_encode_object_klv(struct kunit *test)
>> +{
>> +	const struct some_object obj = {
>> +		.value1 = 0xdead1234,
>> +		.value2 = 0xdead87654321dead,
>> +	};
>> +	u16 key = TEST_GROUP_KEY;
>> +	u32 payload = 0;
>> +	u32 klvs[16];
>> +	u32 n;
>> +
>> +	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value1));
>> +	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value2));
>> +
>> +	/* too small, must fail */
>> +	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
>> +		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
>> +		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
>> +					xe_guc_klv_encode_object(klvs, n, key, &obj,
>> +								 obj_klv_encoder),
>> +					"buf size=%u dwords", n);
>> +	}
>> +
>> +	/* must pass */
>> +	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
>> +				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
>> +							      key, &obj, obj_klv_encoder));
>> +	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
>> +	KUNIT_EXPECT_EQ(test, klvs[1], PREP_GUC_KLV(TEST_KEY + 1, 1));
>> +	KUNIT_EXPECT_EQ(test, klvs[2], obj.value1);
>> +	KUNIT_EXPECT_EQ(test, klvs[3], PREP_GUC_KLV(TEST_KEY + 2, 2));
>> +	KUNIT_EXPECT_EQ(test, klvs[4], lower_32_bits(obj.value2));
>> +	KUNIT_EXPECT_EQ(test, klvs[5], upper_32_bits(obj.value2));
>> +	KUNIT_EXPECT_EQ(test, klvs[6], TEST_PAD);
>> +}
>> +
>> +static void test_encode_object_nested(struct kunit *test)
>> +{
>> +	const struct some_object obj = {
>> +		.value1 = 0xdead1234,
>> +		.value2 = 0xdead87654321dead,
>> +	};
>> +	u16 key = TEST_GROUP_KEY;
>> +	u32 payload = 0;
>> +	u32 klvs[16];
>> +	u32 n;
>> +
>> +	payload += GUC_KLV_LEN_MIN;
>> +	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value1));
>> +	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value2));
>> +	payload *= 2;
>> +
>> +	/* too small, must fail */
>> +	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
>> +		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
>> +		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
>> +					xe_guc_klv_encode_object(klvs, n, key, &obj,
>> +								 obj_nested_encoder),
>> +					"buf size=%u dwords", n);
>> +	}
>> +
>> +	/* must pass */
>> +	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
>> +				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
>> +							      key, &obj, obj_nested_encoder));
>> +	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
>> +	KUNIT_EXPECT_EQ(test, klvs[1], PREP_GUC_KLV(TEST_GROUP_KEY + 1, 5));
>> +	KUNIT_EXPECT_EQ(test, klvs[2], PREP_GUC_KLV(TEST_KEY + 1, 1));
>> +	KUNIT_EXPECT_EQ(test, klvs[3], obj.value1);
>> +	KUNIT_EXPECT_EQ(test, klvs[4], PREP_GUC_KLV(TEST_KEY + 2, 2));
>> +	KUNIT_EXPECT_EQ(test, klvs[5], lower_32_bits(obj.value2));
>> +	KUNIT_EXPECT_EQ(test, klvs[6], upper_32_bits(obj.value2));
>> +	KUNIT_EXPECT_EQ(test, klvs[7], PREP_GUC_KLV(TEST_GROUP_KEY + 2, 5));
>> +	KUNIT_EXPECT_EQ(test, klvs[8], PREP_GUC_KLV(TEST_KEY + 1, 1));
>> +	KUNIT_EXPECT_EQ(test, klvs[9], obj.value1);
>> +	KUNIT_EXPECT_EQ(test, klvs[10], PREP_GUC_KLV(TEST_KEY + 2, 2));
>> +	KUNIT_EXPECT_EQ(test, klvs[11], lower_32_bits(obj.value2));
>> +	KUNIT_EXPECT_EQ(test, klvs[12], upper_32_bits(obj.value2));
>> +	KUNIT_EXPECT_EQ(test, klvs[13], TEST_PAD);
>> +}
>> +
>>  static struct kunit_case guc_klv_helpers_test_cases[] = {
>>  	KUNIT_CASE(test_count),
>>  	KUNIT_CASE(test_encode_u32),
>>  	KUNIT_CASE(test_encode_u64),
>>  	KUNIT_CASE(test_encode_string),
>> +	KUNIT_CASE(test_encode_object_raw),
>> +	KUNIT_CASE(test_encode_object_klv),
>> +	KUNIT_CASE(test_encode_object_nested),
>>  	{}
>>  };
>>  
>> -- 
>> 2.47.1
>>

