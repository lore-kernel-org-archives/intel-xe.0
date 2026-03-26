Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A49410A3D8E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 12:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAF310E8EF;
	Thu, 26 Mar 2026 12:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDK/zdKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B627B10E8EF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774529355; x=1806065355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kw0deB91urEEN92S8o2w/3koKYInMe9EElgzO02SlpQ=;
 b=ZDK/zdKuHg9pms7yx5ImtuFdq/atzrxRSzxw96tl/4C4KXvrBYnGd7E2
 AvE7C851cgpySnv4K6WBWtOq+PtEv4jJpH0/W/yWjjf3zfh8jNsh95o5w
 B89dJ6ZmZFSp/B8d7SWys7/97C17qQwxaw/ncHZrpQ4GWqOisK3XkNFVW
 aKa3xiGFgez1L9hV/28aT068wOj8Cc7PnHwmwGh9R2crZM5cEWA720ROn
 dknte2evXWAjhEbkXThEKPhHaPWneYvHSNcjabPfTjuLGMavIqmmb7Ndt
 owd4MvxHsHviGcUoNjFVazGyIbK7iLFu3TqqSBfwwsOEs3PKb7Sqlk1tc w==;
X-CSE-ConnectionGUID: 2kAngOIpTYW2pQM+vzofuw==
X-CSE-MsgGUID: /ytSIlb+REKJpGeR9ZMzww==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75652678"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75652678"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:49:14 -0700
X-CSE-ConnectionGUID: 8fk7JtxOQJyzx9l5WSTR1A==
X-CSE-MsgGUID: otVQM7bZQU2QaQ+l0cOalg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224923500"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:49:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 05:49:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 05:49:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 05:49:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBQgWo7uMWfnp2fBmUu/wDhuKgBHwqy4u36+VCAsM0kM1NQSvjBtv8ZRcPYXR4DiH8CIEOi7D0uB2WwKyrkEhQImf6xJPEmrguhmENT8Fjp5/cd+T99lmKtOGZBDTlysE483hnY42i18mqYi1ERkFmiloM6W2udb9INiYRD3RWgDlzcWNhzatnvmVD0yuXCn8LKTXZ8GMn2z3BX35IgZc+3DyhWbeuKAext3eOPw36ta2T9el5+oPHflK6Ia29QPYe/jOIFyoaSdXWVENDnHmWUYQAYV0DG7YEPIF84kQSLFNyPqKxpXcg3Y01xdc6MeE4Mo+FEFdEGEp2jSEOuzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+pMDF7t3TB3pvH+MwYkfUgXH0LyJlwsRImZYUfHfgo=;
 b=jwNg0nzpRQI2q0FtKMkLBb2aJdUo+Yo3ODGUM4YZJHX/rse6z7c+klHDG7DU8JEZLVd2DHMt+ItmMmmjdw5+q4OFCE3j8i0lWjy8ZlU9t1HhchczdjxxhScbI4g0iESG5ekrgWYHelfCfo5aYmj/Mu+e5A2zC5XOKRwFAZh/VupzMQeBDlknaLmrkcNSC2ia52sJcYc09o5hi8bq+fQvFHHCvWtYG7YZzUo1Aa+piRVcW05qRkkxqs3wzLdPXYtRL3YWL7+6LDpFj8raH3sEDL5j369fPj1fJWHIF4XSYlVBL3aoP574deEdsOOwQDaSPWYCXDiwFpmnXLYnwtYaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 12:49:10 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 12:49:09 +0000
Message-ID: <6c7b27a8-d5bc-4854-8252-8b38e269f80b@intel.com>
Date: Thu, 26 Mar 2026 18:19:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/xe/cri: Setup hardware error routing
To: Raag Jadav <raag.jadav@intel.com>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260217114656.2546878-1-raag.jadav@intel.com>
 <20260217114656.2546878-2-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260217114656.2546878-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b645411-1f3b-444f-f110-08de8b3612eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: XbKNLrZ7+cm81dNltwbAqkac8d//HN/o1sb0SetQnWrIja3RO912/wr1bKEhL98Y1+FbetXrPEwa1pGvsZiDUAb01VpE2T8yUGwcJ7tvVkBGe1GH8SV920UzNVKrvKKQO0WWVOhw2cfPsLTrxXloYkiUFMVmlcy5H4x0zGRpB/LxBtMaHgU9Rlf61DlS0O0158HsCICD+MmBomT7hd0zr3bkUfwPwqSU37h7ST9p8Scr5d1tck1kamDzkz9pRTHZL31O6RinuW5oO4qaz8gSq/tI4B7LmDTFgbMi+lCJbEqs0Q7ks/35yomeuEx87Y2XPA9BfitIr6hXVr5EMbzES9b82SATzOe7p82YdwH0/mhHVSFDx2/ir+Pq+gv0t6LRNIJKRiAUtgTXOb1H/t49FxEjBb4qkKKz3LOzZmZbl2eLksmtUd9A/ZRw110QhHVL29fmKFtm7c+vvFWzDV6reW9Ki0zsM09WhdESEs3YNXyrHB6nL/wKzh0Z5/Z4T1b7Zu1XtB15ehqF6tFY9wMYzBP2n9LJwl3Gbs/m5q4YgBUZIPCCCUileuLm/jWeH8AzCf0B9TSE0BiY6eyXPDGzUZ29qRwM3YUXpfzyTRL9CsWz1m7e1Kr4WV/ZM2l0HWbs6AHIyEls4sUZY8yHZlWbNMtk1XwANoxd7UWxwGkTwfC7gFCKyLNtfUiRVB/FPyAuj5UKuuiwdp2vuyhCwIydQFr0k6EvSbaLPotZFSJ6BiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejAxME9qZkRseHhsVCtleVB3cEVIaE0zeVJDbVRxKzFhbHlQSG12d1FOSlM2?=
 =?utf-8?B?Qlg2K2haRDY0VjZFY0FycXU0TDdIOGZncmpXbjY2RUtyUDhqdnB3bjJvT013?=
 =?utf-8?B?L1YxWGxkbks3MUFieTl6S1h4dUJDVm5ZOHJQT3FjaWs1WUkyTHN0LzhkL3Zh?=
 =?utf-8?B?WkZHNWszSmI3aWNhQmI5K2w1MCs2LzdzbUlBbW4vTzFxczJEZ1Q4eUN3eC9p?=
 =?utf-8?B?Z09sV1pCWWxTakhMZTZoOXQ4ek5ZWXNLcC9SYkpRZTczQUpCU0Y4Q2EvM1VW?=
 =?utf-8?B?b0pLYU0yMDVyVjhlUEwrNWlHTDRYUlhBZFRseEkyTFZOck1DdnI4UTlSWFB2?=
 =?utf-8?B?aFVxRUh2TFJIZkRTek0vT096WDB1ekRHL0tSVVQ1SWFOQ0VsZ2ljTy9ETkxE?=
 =?utf-8?B?M2VDejd5WCtqUnlGSFAzQ2tGcitsRWcxMy9yalRPWkJTNUJ4VDBVcWxsZ3pW?=
 =?utf-8?B?eW8ybkdoZXp5OGcydGdBQXdIMllpb255RGhFZHNYZGN5a2xJUk4rZnd6SEFw?=
 =?utf-8?B?NGQyK1Z2ZUJVWXg2eFZzSUttWkk2WWlCYktHOFFMR1pXcDZHN2dVOThlU09Q?=
 =?utf-8?B?RXFPZHRoMVBzZXp1ZElZSEVweFVNalBZUlU4dmxlSjc2Zk1LVEpGRWllNGtR?=
 =?utf-8?B?T0VReU81ZmJYNUxkTER5UTJNYVpEMS8zTVJmd3JVMU8raFUxdjJDUVF1UWdY?=
 =?utf-8?B?NFdsOUVZMGxhdGUySjN0ZVJQU29ldkZQb2t3VG0zdHdBR1lpRFZSUnpDb05j?=
 =?utf-8?B?VThxZVhJSTFBcUhKOGdrQys1Y2oyN2F0cFY3Mk4ycWxIRUZjOVhYODUyKzlq?=
 =?utf-8?B?dXdvQ1g4bTBRRTk2Qld4UE8xVjBQTmFldldUQXBhYTdIT3hLcXBhMWpKZEli?=
 =?utf-8?B?Tm1MbFZnYWtnRm10ZjhKeDJmU2VzTHJwQytzdnVwNmFmKzZteXdPTnc0bW5l?=
 =?utf-8?B?THg5S1UxR1BTakxDb1VCVTdmTVZ3QXdaYXIvV2crNHJ1Zk1oaFdmSERUSWp1?=
 =?utf-8?B?U0haeEk0UUpXTXJsVG1EbytlZStxZUFZb01ITTVmQUtDcmw2QXREV3BqQk5T?=
 =?utf-8?B?Mi9heWR5aXRBQ3E1MFMxV2JHWDZzR1AvTWxGb0lkYWdnaGhDNmVyanc4T3Va?=
 =?utf-8?B?R3ZQWHVmaUF2VHJIeTRwSVFpNlRiVFZuYTlkYzZPdytyaG1JMElJR0lQTyta?=
 =?utf-8?B?OWJJS2kyOUxOTGdTaE5ienpXTFFWbit3bkRLd2RscElkSW1NSllYK05GcXZi?=
 =?utf-8?B?R3hxQVRtNHVXSlNIUzdXZFhlWUlMWnNUdWYyVmhoZzVZdnJvdm1CNW5tYUN1?=
 =?utf-8?B?czFZQzNWUjNWWXNrNFhBOGZPOXp1czM3Uyt4TzFzdytxdkNkV2Z6N2puWlpm?=
 =?utf-8?B?SjgxcEZBRVFhSHRrazlOZjk2Uzl0ZGd0WEVTaHRrY2ZHS3dXWWJlRGRJektB?=
 =?utf-8?B?Nk5hQTlyQVJyRlJuUEVDYTdIQnRETFNOdHdUVGUwK01iSm1CNUk3ZG1HRTQx?=
 =?utf-8?B?WTczU3R5QXFvRXVXZ0hYeHdqaUtNb2s3S28rNGU1WHZwRGd2dVozQndRS0JX?=
 =?utf-8?B?TTUySlNMREhLRG1USzB4a2hrOGRiSjhNUHRZU2Z4djkrZUV2dE9SNW4rSnU5?=
 =?utf-8?B?VjJoSHgvbittRWVYRGY3Z1oxUUl4UjJXVVEwQjJJd3ZPYmdTWnRrUGh6Q055?=
 =?utf-8?B?cVYwcktCTXVza3pnZW9paWF0aHY5dzNrTnptM0hBRE50b1h2aFBlNGlsNGlF?=
 =?utf-8?B?OUlhOVl3bUZ4L1NxR2NYMXNZa0lhalptb2d1azZhVDYzVGJxTTg0Y0JQR095?=
 =?utf-8?B?NENYYUVWeTNZYkZ4eEI0MlZCVWhSc1ZHMWFVelBFeDg2YlZlcVllZmxNNGdL?=
 =?utf-8?B?RG5KWGNIREY5SC9VQ1FiTWdpb0RhbW16VTU3WGVvN2twMlpGTjNYdTJTQ0lQ?=
 =?utf-8?B?OXZ0TE5veWtMMnczM2x0UDNqU0c1U3N4blFxWnRXbE0wT2V1R2pBb0g1UmZk?=
 =?utf-8?B?L3d0elhXRGJ3U1pEMG1TUUdCN0IrWkVBM1pEVGpqYWJOYm50ZGd3anZ6ei9V?=
 =?utf-8?B?V1BLdWhVbkhzdy80djB4TnJGZlAxdlhMNGtic0NFaEY5VHJuM0NvTXA5Q2w1?=
 =?utf-8?B?QldBK2VIZDU2Yy9QRXE3cEJDSXZlMDlXSVJRL0hmeXhDN01XenZiRG9WTk00?=
 =?utf-8?B?a3FxZndYS1EwSXAvcXFaeko3VlM5Q25LdFZTYUp2UmE3Q0VHWFRFaml6ZFBh?=
 =?utf-8?B?S0xlUm9ibHVvTWlKakdSY3hkejRENE9ic2ZqN0d3U2hYdE9KSlc5eFBIZXN2?=
 =?utf-8?B?WnR5REg2VGpnZGdHRzNhckpvTi90Q0ZNRy9DWTNxYVpDeGg3TVZIQ0NCZ3R4?=
 =?utf-8?Q?gB5rImAPXgV/F6vI=3D?=
X-Exchange-RoutingPolicyChecked: a4yb9B8lAziTOjk6wIehatYJCNnkdNeT55Eq8K5HME9PbcayOPRIiIFULn8gDYOLTjB9I4x/DN44/qseiVuHpXZt6k8Cerak8If5PjE7JOrMTeda3hieh7FK6xXPnsCsVQwNn1wGEQNNvY147GsvNEEKzyq00TJQ+MLk32p0WhyLJaROP5Z7rl110cDixRxepb4khEU2AI7HRg0u2Wn0Tgl/ZzGoU4DiIGakh7aVY4nZX2QWYeMlxQdFQcuYLpVi9i93xpICIetmzXKJL7x9uuTDfFk5vBrxBDDW1ZEX7eiUIzvVU7BQ9KRvX5tjK2HGYzQ9H4mckxo4YZujnLiFSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b645411-1f3b-444f-f110-08de8b3612eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:49:09.8767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5+Ab5EHyqc/r8016Ttqz9jc4oMM1u6MaBtKX8uoRAnqf9I5QsH44xivSJprQVaSeq12/24SEht7Q24MTAU9Q9mt5Ksd3AFKurU6k9NmC84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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

Hi Raag,

On 17-02-2026 05:16 pm, Raag Jadav wrote:
> Setup hardware error routing based on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
> which will be used for debug cases on Crescent Island.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 +++++
>   drivers/gpu/drm/xe/xe_hw_error.c           | 22 +++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
>   3 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> index c146b9ef44eb..88593f0a48fd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> @@ -11,6 +11,11 @@
>   
>   #define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
>   
> +#define DEV_ERR_ROUTING_CTRL			XE_REG(0x100170)
> +#define   FATAL_ERR_ROUTING			BIT(2)
> +#define   NONFATAL_ERR_ROUTING			BIT(1)
> +#define   CORR_ERR_ROUTING			BIT(0)
> +
>   #define DEV_ERR_STAT_NONFATAL			0x100178
>   #define DEV_ERR_STAT_CORRECTABLE		0x10017c
>   #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 8c65291f36fc..eb557266d083 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -146,6 +146,23 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   			hw_error_source_handler(tile, hw_err);
>   }
>   
> +/**
> + * xe_hw_error_irq_route - irq routing of hw errors
> + * @xe: xe device instance
> + *
> + * Set irq routing of hw errors.
> + */
> +void xe_hw_error_irq_route(struct xe_device *xe)
> +{
> +	u32 mask = CORR_ERR_ROUTING | NONFATAL_ERR_ROUTING | FATAL_ERR_ROUTING;
> +	bool irq = xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;

What happen when wedge mode change during execution?

Thanks,

-/Mallesh

> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_mmio_rmw32(&tile->mmio, DEV_ERR_ROUTING_CTRL, mask, irq ? mask : 0);
> +}
> +
>   /*
>    * Process hardware errors during boot
>    */
> @@ -178,5 +195,8 @@ void xe_hw_error_init(struct xe_device *xe)
>   
>   	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>   
> -	process_hw_errors(xe);
> +	if (xe->info.platform == XE_CRESCENTISLAND)
> +		xe_hw_error_irq_route(xe);
> +	else
> +		process_hw_errors(xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index d86e28c5180c..8f155b66b5f1 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -11,5 +11,6 @@ struct xe_tile;
>   struct xe_device;
>   
>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
> +void xe_hw_error_irq_route(struct xe_device *xe);
>   void xe_hw_error_init(struct xe_device *xe);
>   #endif
