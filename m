Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C9AC44500
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 12:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827B010E5D7;
	Fri,  3 Jul 2026 12:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="av1F1sbx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617AB10E5D7
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 12:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783081969; x=1814617969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jXJC6bqQBnDf6wj+4QkVtRbpyWMCb1nFw4QcaW2Ak9w=;
 b=av1F1sbxJol/ZV5sTzykUI8KWeTMfm+ooxeYbspoS2ZmMEZ8MwvK2qiz
 7kjaS80JjcU3T+WLzau8Qp0DgH4ILmLGzxUHPoe6iJp+3Uy7Ep5uDcgE7
 Fyv6FUAJfVe14QK5ILecvuAgAWrry9oQCYhVc5Q9IeOUl+7usANM1IJAj
 k1F4zYz7zr64qihFV7DbeJD+83a3srBqSHBUUXat5XF5eVkbTeTm5W60/
 o3JYhPqyqt9jexPsk+edWNKyk/+wZgyHic6veKDMPTZ3/xD2V23UvPkmI
 e3h7wolDww1tglrv4ww0qGnvo0I3iaXAnrsDGVjsi6nUo3NJq9K4DQFf1 Q==;
X-CSE-ConnectionGUID: dsN3/sS4SuOKqICpSHs4MQ==
X-CSE-MsgGUID: 0Xodr0iJQZijAkoNdiW4RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87748897"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87748897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:32:49 -0700
X-CSE-ConnectionGUID: 397UApn4QAix6e5PDO9HnA==
X-CSE-MsgGUID: kBknm1JZToa/fluqrTlmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="246736852"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:32:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:32:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 05:32:47 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A26sH8DcUwYQACWfp7zd9IBeP8s0TQkBntKk7PSHHSKArmZY+yRhl8MOLHit0btBBmwWtjEo9Yj08YBnC/zoXX8UlQdBqTOS7506JPpNBxK7jkvKNAbmJcsVKSrGTKIuLm4Fz8TJgv9ac+/TcTGJEaZHvuSfXnKAhu2dxWCV2ixFGl6rjn9wcJiXMfY+zopXt8YfbT2N0EYRJ1UnV46UEN0tHN195sB+RpfaZHCW6H4K9nB9jwW6ElNmhMY2PryS2byhS/5DIk+QL7t/MtwZ2NKBI5z5UNfCN2D+L8yuQ507NuLXZfOg5Fwk/ooZOG4SpNfhuKbjU30zCiBUYzNoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKXL4gLRdKO2MN/vdHGwjHAm0U4js+kwdch4Xv9ehEA=;
 b=dd/V3n77GrlSUGLQQ/iNzosHL2SBEf32imo14N0cunBIS+9F7HGiLqLGSYcSXKwTF2HkNZhh+PU2KSsXY1C30OG5qRYuFGjIA5keaqR9UGQSM92bN5f9PCh40Oo50fkkK76QcsqEiMry7DdFzYONIrSZpbDfI9b+tcAqq3jW3zUrIJBL/HgbEp4nXAzo66W3F3dacfCU3bE5o2ZTkU0dmVz0mYuJQ8xSe528zymuFyxKsutq++QOrVuB3nXzB/zZ0lvBEZxoa5jzHje/RJWHwpq3g1QtBztSnfcbFfugALFeHLAOG7T4R/BBGkshzWmhzZe1LfKm/ovivTTiWw9xxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Fri, 3 Jul 2026 12:32:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 12:32:44 +0000
Message-ID: <ed21cb87-54c2-44e9-a534-e99a29c413de@intel.com>
Date: Fri, 3 Jul 2026 18:02:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] drm/xe: Consolidate debugfs fault injection functions.
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>
CC: <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <matthew.brost@intel.com>
References: <20260616052931.72692-2-mallesh.koujalagi@intel.com>
 <22674c40-790e-4ee9-bcf6-8e118db2ea69@intel.com>
 <620aaf83-10de-4d33-b1e2-b5da5291d85b@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <620aaf83-10de-4d33-b1e2-b5da5291d85b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 760b19a6-af75-4137-7733-08ded8ff2dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|4143699003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: mYcOTxzBevWwIEnGDutY3AH4BMn2lH03YoH74yi+5RbDShOGDGE7whI1AiRaTync0siyNoTMhq1RYsoYnlROe78rr/Vm7YyKIOgqv+PR644ninR1LMD+K+GT5T662xn9GADWpZGdzSBzpPgTt5aXlZgYX/VEs1fYxF2XhrKl5Ydq5nqJp41DSCceQaw8pMDr332U0nYd6qh33/JZt6bbtrfs5i+Lus1LaGFdbo2DY7362+LAwFeyxmK2PJIb4cDefK0cnD/8uGscB93Obbt0nC8uSNJUlPmcfszYSMep0qQIub6TuwGiLNfbDF2QaEucSzU4PFQfMoIDOXKY0FEmhtmbMso2CI30ySqHBoPC8dbaBfgXm7PgdZ8Ch1KWSDS/BozNiWhFlD9NYHlpLyhR2cBpt+aObnvJ+9MnxkAj21K+gmf6TXI7fCmwmcKpd+CmWigfwDRc5SH9hE+1MEGjrmNuTJpHhdXB0sdg94H55aVnsE3t/RclM2n1xaR6tNKOz7u8UrIoAqzx6kP0M8vyc5uDP+DJwTXkaWO8fhP2DXtodccY85oAJ+R5Zqrk+TO3npudJAURcswVIWa46E2iUIrqgtknMgF5G8yZGKw8sS0f6XsZtQwin9kMRq3QrjXlKQrdumJY0/LmY3ffAzeGpH7VBNShmwK4+iaIfMSd1VY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEdITXUxMm1SWWVnMWUwU05iODRtRXpIU3NPTjNVNXNLVUlRU3dYdzEwY2hy?=
 =?utf-8?B?YkcvSGg0NTZPcklnUmhsKzdscWVFWlJHL1I4bHYrZFV2NEpiMWErNnUvblN0?=
 =?utf-8?B?K1FDdXRqY3BFU2dTUEFtcUJVZWppb2hEODRqVU9NMzM4dU1XVW9PdCtUbnNQ?=
 =?utf-8?B?UGp2ekRNcks5bUhUOGU4am92UW5WVFluWFJ6ZUo3cHRpQUVMWXJxVGhJY1k3?=
 =?utf-8?B?T3F4bXpmZEpoajZnK3FLamRuUEZUeGJhVmd1bFozWkFMZEFOREJoekhlNXp0?=
 =?utf-8?B?RHZMSHQ5QjRLbC9DeU16OXlSMTBNaFBpZG1zRzFZcWZrZlRUZ1Yxa0UzYnA2?=
 =?utf-8?B?WVZiUitZSE1UdXdQL3JNd1hhSzhjbGZkc3FvY0xmRjAvTmR5MVVRTlNickk3?=
 =?utf-8?B?Wm9KaUVrWjQ4amtiend5cTZneFlGVGErMjdna0FQdE9wMnZMWVBjN3NqK0ZX?=
 =?utf-8?B?N25BbFg0SGJxMWNpNXBoRkFtZjJVMFFVK1Rzc1krdm0zbWg4bWRrNGhkVDI5?=
 =?utf-8?B?USt4bXExUkhxSUdwd1dHaWZtOWZBS2lMKy9yTDZZTmg3blJ4bXA5UkhmWm5h?=
 =?utf-8?B?YS9DbnpBdzcwNHhHaTZ0WFB3NXllR1lad1NlZDhKekJUWVE2VlplOGllVTRS?=
 =?utf-8?B?NVNaVjAwa0ROU1hFbmdpQzZoM1ZubHFwSHh0ZUt0RVAxMy8xeWcreGJYQ0tP?=
 =?utf-8?B?VFVITW05dVZ4RlJtME9xU2lFWXpod0ZqL3JMYktDaVZBZW9TcFliczgxclp0?=
 =?utf-8?B?bzNQa2pHL0IyYzhDSHl3MFg5NjVhQUhpQjRVQkZBWlRaQmhUcWRtNVJkZW9F?=
 =?utf-8?B?djd6TGlMaExMWDl1MmY0VWxoRll5TmZWdUlYRFRGczJjaFhIQTJjNEh3S0M4?=
 =?utf-8?B?OFBmWXI4T29kakVQNGZxRFpVakorNS9YUlFrb3JXbms2T1NrM2lCYjlaRC95?=
 =?utf-8?B?N1M1dkg2VXJYbE5GcEtVWU0vUkt4ajZRWnd4UThDYkdzcmRmeGRFcHBIN2N3?=
 =?utf-8?B?MGJKSkN4YWhyMFJhU2pDWjAwV0VaaXZPNmM1NnZjdWhhVUhibXRPZ0plNys5?=
 =?utf-8?B?Um5RVmd2MEd2SmtJYS9pcEtPU1pQMUhZTjhPa0V2dHBWOHRBMnhLcTdBZzZV?=
 =?utf-8?B?ZllCbVBWWW1SRy9jOSszdk9HYWhwZ3FzTGF0a0JpTFVYUDA4dENFcGFoZFZs?=
 =?utf-8?B?VWZVUzZCNVNTNEhyaWFTZHR1U0tRVU42M2R0aVRjRm1RYlRVa2k5YXlEbXNW?=
 =?utf-8?B?dEJDVXlSVEJZcHdHd1IyWjNiNllsMVAvRXkrMDRkakRaN2orV2NSUXJuVFY4?=
 =?utf-8?B?YkNEZHkzTHp2bVJJTXd3MXdiRXgwYUpYTFZHY3h1a2R2ZWFvRXR0c1FzWFRh?=
 =?utf-8?B?K0g5NTJ3MWI4VFlRTzBsUUZoc2JCTit6UkNTNEtMbHZENXZGZllra01NcXhK?=
 =?utf-8?B?TmpYUDUxTktnRnFmbkwyUXI1K3ZRSFVnMVJkVzFxZFNuS3VEN3AyR1hkZUVp?=
 =?utf-8?B?ZU85bnRiZmFydDJmZ0hFbVp3U0hKYXhaK25WSWxydVd4WUtKRFBOWlBGMUhZ?=
 =?utf-8?B?MlRzeEx3bTlZOUVLMnlwWk5CM0NDVGE3Yk9FZmtjdzFhM2h6akMzTHFVbTdK?=
 =?utf-8?B?SFFyUmcrZURZV3ZNL0pBOTlXR0FnM1BGeEpuK3ozMFZDaHd6MjFoYXExWDBk?=
 =?utf-8?B?MkkzTnYvWktTdUhYdmZZZndzTmcvZnZhYzc1Z2NWM1F0SC9qTGRqQ1ZLMndX?=
 =?utf-8?B?UEo4YkFnMjBHeDBFUm1CSEVWZENyNTF6RHgrK3hTdXUwUkdpc1JjZDFSTG5G?=
 =?utf-8?B?OEdhZStyTmJjaVRtSW5YQkwyTFk2L1MvbHJXZnFvMlE2RjlmTXNxdnN0a1dW?=
 =?utf-8?B?c21FdyswaVBjTnJuR1Z5T3U0ei9Kc2twVVBqWEc1UzlBUWtQeG1pajFrMUNK?=
 =?utf-8?B?aDNxeXRFM1Z0THM4bmhwYVJSZEVzWVFyV1ZIYS9SL09SdkNpejhiN0J0aFNT?=
 =?utf-8?B?VTZjaS9jdTZYS1dHSjFPSzl0d2YyRk5oSldTeEhzVndUN25IYXpGQkJKakhO?=
 =?utf-8?B?WVF4YkN1VTRNUjUrNTV6SWN2VzBPWjNWNzVJTEQxZWh4cDFQcEoxaDR0ZUs1?=
 =?utf-8?B?c1VYUy9YRkJTWmJGd2JvRVRSVjM1WHByNTJXc2ZWbXFvV1FENE9kUCs3d0dt?=
 =?utf-8?B?M2tXVERPckRjSy9oM0kyNTJoWnpxdjVxcTlQRE5Zeks2NEZNeW5oa0FDSFNv?=
 =?utf-8?B?cW5CYWsyaVUzT0dOZWttSkg0NFI2QU9aeGFldnFOT1FQbDRzbURlNDQ2ekZU?=
 =?utf-8?B?eDI2RGtzWUdSRE0rWEhiMDdhaEE5TStQZ1lsMm85eW1VcGl6cVRFZz09?=
X-Exchange-RoutingPolicyChecked: hvufIu9JOXEpj+I1xkwvoqYWzWQfW+j0E+LH6tZbcuyM/eY7fAsv680w8nVV6gL0HEeEKIdrhkQtUDn6f59IHgiQZVBanP6Vg/HbY0gihDgDgZ2kQaW2BhEolNhVPipapHZYUfqOwiU/B1YXTBRup2ToDxA62rhADdLKpOVNUL5DT8i81hC4I1rxPbLqn5zjPbxDNU09vBypXwz6s0uRzUHEBBwp5K0EmoEhGqW1lr8UEpSDFA2ujqQDPzqKZCt5vPXeQBH0PIL66WS2Y3qeS3utkP4F+zXh88HuQDuv6uyDuy79gIiEXdtrM193MHA9EYaZES7N4CMY+cX8Hf9bIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 760b19a6-af75-4137-7733-08ded8ff2dff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:32:43.6810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CoEFABpHAXwUXlINdFtG+NFWu+FLeCoKrO2XwSupBjBslcsesp0FZKIDlDhzE5bwGyBT7uO9FFw3HcFuDBOrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
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


On 03-07-2026 17:48, Mallesh, Koujalagi wrote:
>
> On 03-07-2026 12:47 pm, Tauro, Riana wrote:
>>
>> On 16-06-2026 10:59, Mallesh Koujalagi wrote:
>>> The fault injection code was scattered: the GT reset
>>> hook lived in xe_gt.h as an inline function with its own global
>>> variable, the CSC hook had a separate global in xe_hw_error.c with
>>> an extern declaration, and each was individually registered in
>>> xe_debugfs.c. Adding a new error type meant editing many files and
>>> copy-pasting the same boilerplate.
>>>
>>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>>   - fail_gt_reset         - GT reset failure
>>>   - inject_csc_hw_error   - CSC firmware error
>>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>> v2:
>>> - Add multiple platform support. (Vinay)
>>> - Handle VF properly.
>>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>>    create xe_fault_inject_types.h file including those name.
>>>
>>> v3:
>>> - Solved patch apply issue on tip.
>>>
>>> v4:
>>> - Add proper header file.
>>>
>>> v5:
>>> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
>>> - Change xe_fault_inject_descs to xe_fault_inject_entry.
>>> - Change 2025 to 2026.
>>>
>>> v6:
>>> - Change return comments of xe_fault_inject(). (Riana)
>>> - Remove full description of xe_fault_inject_debugfs_register().
>>>
>>> v7:
>>> - Move all fault inject helper functions in xe_debugfs.c (Riana)
>>> - Update commit message.
>>>
>>> v8:
>>> - Assign .attr pointer with DECLARE_FAULT_ATTR macro. (Riana)
>>> - Remove CONFIG_FAULT_INJECTION block.
>>> ---
>>>   drivers/gpu/drm/xe/xe_debugfs.c  | 45 
>>> +++++++++++++++++++++++++++++---
>>>   drivers/gpu/drm/xe/xe_debugfs.h  | 16 ++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt.c       |  5 ++--
>>>   drivers/gpu/drm/xe/xe_gt.h       |  8 ------
>>>   drivers/gpu/drm/xe/xe_hw_error.c | 11 ++------
>>>   5 files changed, 63 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>> index 22b471303984..b3899bedf70b 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -5,6 +5,7 @@
>>>     #include "xe_debugfs.h"
>>>   +#include <linux/bits.h>
>>>   #include <linux/debugfs.h>
>>>   #include <linux/fault-inject.h>
>>>   #include <linux/string_helpers.h>
>>> @@ -41,6 +42,46 @@
>>>   DECLARE_FAULT_ATTR(gt_reset_failure);
>>>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
>>>   +static struct {
>>> +    const char *name;
>>> +    u32 platforms;
>>> +    bool skip_on_vf;
>>> +    struct fault_attr *attr;
>>> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
>>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>>> +                    .attr = &gt_reset_failure },
>>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>>> +                    .platforms = BIT(XE_BATTLEMAGE),
>>> +                    .skip_on_vf = true,
>>> +                    .attr = &inject_csc_hw_error },
>>
>>
>> Here are my concerns with this patch before merging
>>
>>
>> I'm not fully convinced by this structure.
>> As we add more types in the future — fault injection that depends on 
>> sysctrl, guc
>> or anything else. This will keep accumulating.
>>
> That's a valid concern. Right now, the struct keeps adding separate 
> filter fields (such as platforms and skip_on_vf)
>
> for each entry. If we introduce new checks like GuC readiness, SysCtl 
> state, or GT generation, we'll need to keep
>
> adding more fields.
>
> A cleaner and more scalable approach is to replace these individual 
> filter fields
>
> with a single availability callback that handles all dependency checks 
> in one place.
>
> This keeps the struct fixed and makes it easier to extend in the future.


Can you please provide a snippet on what this means?

Thanks
Riana

>
> Please let me know your thoughts or if you have any comments on this 
> approach.
>
>>> +};
>>> +
>>> +bool xe_fault_inject(enum xe_fault_type type)
>>> +{
>>> +    if (type >= XE_FAULT_MAX)
>>> +        return false;
>>> +
>>> +    return should_fail(xe_fault_inject_entry[type].attr, 1);
>>> +}
>>> +
>>> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>>> +                         struct dentry *root)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
>>> +            continue;
>>> +
>>> +        if (xe_fault_inject_entry[i].platforms &&
>>> +            !(xe_fault_inject_entry[i].platforms & 
>>> BIT(xe->info.platform)))
>>> +            continue;
>>> +
>>> + fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>>> +                      xe_fault_inject_entry[i].attr);
>>> +    }
>>> +}
>>> +
>>>   static void read_residency_counter(struct xe_device *xe, struct 
>>> xe_mmio *mmio,
>>>                      u32 offset, const char *name, struct 
>>> drm_printer *p)
>>>   {
>>> @@ -563,8 +604,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>>           drm_debugfs_create_files(debugfs_residencies,
>>>                        ARRAY_SIZE(debugfs_residencies),
>>>                        root, minor);
>>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>>> -                      &inject_csc_hw_error);
>>>       }
>>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>>> @@ -610,7 +649,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>>         xe_psmi_debugfs_register(xe);
>>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>>> &gt_reset_failure);
>>> +    xe_fault_inject_debugfs_register(xe, root);
>>>         if (IS_SRIOV_PF(xe))
>>>           xe_sriov_pf_debugfs_register(xe, root);
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h 
>>> b/drivers/gpu/drm/xe/xe_debugfs.h
>>> index 17f4c2f1b5e4..beedc7ebdaaa 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.h
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
>>> @@ -6,8 +6,24 @@
>>>   #ifndef _XE_DEBUGFS_H_
>>>   #define _XE_DEBUGFS_H_
>>>   +#include <linux/types.h>
>>> +
>>>   struct xe_device;
>>>   +/**
>>> + * enum xe_fault_type - Fault injection types
>>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>>> + * @XE_FAULT_MAX: Number of fault injection types
>>> + */
>>> +enum xe_fault_type {
>>> +    XE_FAULT_GT_RESET,
>>> +    XE_FAULT_CSC_HW_ERROR,
>>> +    XE_FAULT_MAX
>>> +};
>>
>> I would still prefer an abstracted function.
>>
> Sure! We can define a named macro for each fault type, such as 
> xe_fault_gt_reset() and xe_fault_csc_hw_error(),
>
> as thin wrappers around a common dispatcher like
>
> #define xe_fault_gt_reset() xe_fault_inject(XE_FAULT_GT_RESET)
>
>
> Thanks,
>
> -/Mallesh
>
>>
>> Thanks
>> Riana
>>
>>> +
>>> +bool xe_fault_inject(enum xe_fault_type type);
>>> +
>>>   #ifdef CONFIG_DEBUG_FS
>>>   void xe_debugfs_register(struct xe_device *xe);
>>>   #else
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 783eb6d631b5..eda8df8adf11 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -21,6 +21,7 @@
>>>   #include "regs/xe_gt_regs.h"
>>>   #include "xe_assert.h"
>>>   #include "xe_bb.h"
>>> +#include "xe_debugfs.h"
>>>   #include "xe_device.h"
>>>   #include "xe_eu_stall.h"
>>>   #include "xe_exec_queue.h"
>>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>>         xe_gt_info(gt, "reset started\n");
>>>   -    if (xe_fault_inject_gt_reset()) {
>>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>>>           err = -ECANCELED;
>>>           goto err_fail;
>>>       }
>>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>>       xe_gt_info(gt, "trying reset from %ps\n", 
>>> __builtin_return_address(0));
>>>         /* Don't do a reset while one is already in flight */
>>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>>> xe_uc_reset_prepare(&gt->uc))
>>>           return;
>>>         xe_gt_info(gt, "reset queued\n");
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index 4150aa594f05..f8e3ca63aabb 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -6,8 +6,6 @@
>>>   #ifndef _XE_GT_H_
>>>   #define _XE_GT_H_
>>>   -#include <linux/fault-inject.h>
>>> -
>>>   #include <drm/drm_util.h>
>>>     #include "xe_device.h"
>>> @@ -38,12 +36,6 @@
>>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>>   })
>>>   -extern struct fault_attr gt_reset_failure;
>>> -static inline bool xe_fault_inject_gt_reset(void)
>>> -{
>>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>>> should_fail(&gt_reset_failure, 1);
>>> -}
>>> -
>>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>>   int xe_gt_init_early(struct xe_gt *gt);
>>>   int xe_gt_init(struct xe_gt *gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index 4b72959b2276..bdbf87eb743d 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -4,7 +4,6 @@
>>>    */
>>>     #include <linux/bitmap.h>
>>> -#include <linux/fault-inject.h>
>>>     #include "regs/xe_gsc_regs.h"
>>>   #include "regs/xe_hw_error_regs.h"
>>> @@ -12,6 +11,7 @@
>>>     #include "xe_device.h"
>>>   #include "xe_drm_ras.h"
>>> +#include "xe_debugfs.h"
>>>   #include "xe_hw_error.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_survivability_mode.h"
>>> @@ -25,8 +25,6 @@
>>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>>   -extern struct fault_attr inject_csc_hw_error;
>>> -
>>>   static const char * const error_severity[] = 
>>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>>     static const char * const hec_uncorrected_fw_errors[] = {
>>> @@ -167,11 +165,6 @@ 
>>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>>> XE_RAS_REG_SIZE);
>>>                            pvc_master_local_fatal_err_reg : \
>>>                            pvc_master_local_nonfatal_err_reg)
>>>   -static bool fault_inject_csc_hw_error(void)
>>> -{
>>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>>> should_fail(&inject_csc_hw_error, 1);
>>> -}
>>> -
>>>   static void csc_hw_error_work(struct work_struct *work)
>>>   {
>>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>>> csc_hw_error_work);
>>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>>> *tile, const u32 master_ctl)
>>>   {
>>>       enum hardware_error hw_err;
>>>   -    if (fault_inject_csc_hw_error())
>>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>>           schedule_work(&tile->csc_hw_error_work);
>>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
