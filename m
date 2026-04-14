Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E237CF9D0DA
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 16:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA55210E61E;
	Tue, 14 Apr 2026 16:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxuTZgmx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894FB10E61E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776182707; x=1807718707;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2qWNBU1tSpgQbg+P0pP3tbJ1wcWQ5mI/0+LfPot5KVg=;
 b=JxuTZgmx8I3J144FlCAc13EK2k5jVvCkuv13yEy/Dk48aMZ7JjKK4rG+
 oIuvPIjmZ4ABQP/5TWflxSFxsl9GhjC1lJmj87svLJh/f5+l1tSr5JrJ/
 nqX39gIpHxrkMaAr+uuh7/MN/VaGXLEptUZXIvdO3v+OJtgAE5eF1iur3
 U+hSh7Let7pwlNwXW7I+3VjfnGl99lrl5HLVqJiO/fzDa+ymrOEFDOkN5
 g2ccm10YPCAaw/KYdpqrWuTFvZ293P73bLQjrIsECFOungW9tEAfTeOZe
 +KXhQfLt278GdcusE+HjIF14IG7WIM3rXSJW7XyOgkRiPSRtZ2cDRAy1h A==;
X-CSE-ConnectionGUID: USzNiZ3RSbiE6b1hTVHEOg==
X-CSE-MsgGUID: dbuoMFHKTSuSHO0fJoy0iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88592167"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88592167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:05:06 -0700
X-CSE-ConnectionGUID: 2ioOdMyOQVmNs21n3kgweA==
X-CSE-MsgGUID: aejvE4nvSiuZHTFDwndD7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235097029"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:05:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 09:05:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 09:05:05 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 09:05:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npngSZElvIFZ4GLEEjht0cB2QPNJcLLcTyMmFReC44wzHT4QqzGIkJGThQHLrMMJ6GSgfNdOn3P6lEM4o3UPPn8nZTWyt9M/4sc7DASMzo2phTLQZXhAXGQA0kVUGur3ChdlhW1zlhcoKfhaI93S9eX62OgV/mgeSxAk72KBs5IPcmmYJ9qQEuch39lX4fFLLIpY6HqwwxyUae3IXXzgy9VHtr1YcdwlFpv1euEN3roavwC8S/0w0pL8h0BeDNqqZ0Q/wcg6oqMpjBakgWU+povH21Mna5hBRVOpwIrhbb7E9fpQbsojlPZqXACB1+K3b+WT59WoqJ7GyMZQKXda/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDxAW4//0D/Fbo5dgBQfMuVGT4maxvdrTDwkrLrH33o=;
 b=iGrR+LFf1PqIpAumuziEIw7RfYLw8B5kLNGPrUx6YURa7fN4r4ll7V2r0W6ewcXgrbxI2GtKDA9LmWwCoPuuOkMYiGkHKtS9P6s3NqPS8Eb6RMQ3vBLnoH+vep543O3umLBIiUm3WvQvVENgF2ILgaUX39uj0KY4SZ9uBqbfcHnX8QcxwuzgaZ43GzWoDof9eX4cO7eo3X41JNrjHxg37GMO2wOZGNnq+gNfveWvIRFgCde4bS6JLGkSeSXvU7EFp6ucCoua7u0QdNVXlL8RYQYBI1KwNJlactS+6gtaWeeCzD5EsCoRAxRNhdCiViyJp2xew3hyf44s7O3+iEqowQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA3PR11MB9228.namprd11.prod.outlook.com (2603:10b6:208:57a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 16:05:01 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 16:05:01 +0000
Message-ID: <af817da4-4834-4eb6-9c99-3827026b2e16@intel.com>
Date: Tue, 14 Apr 2026 09:04:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe: Fix null pointer dereference in
 devcoredump cleanup
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260326181017.2060209-1-zhanjun.dong@intel.com>
 <79b30bcc-b056-454b-a5ac-8035f7ce76c3@intel.com>
Content-Language: en-US
In-Reply-To: <79b30bcc-b056-454b-a5ac-8035f7ce76c3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA3PR11MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d17f437-e93a-4ebc-ce7e-08de9a3f956a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: YwmvEFT8MYZ6U78vzJK/a0mIpwhnLPHWrZcRRESWl/MjLGWIgRrO5CJh1/FKS7PDWd2SuyNhLXRiq8/ap2q8oROAvtwTSnusAzHhiOYuDnYVy34bw0jWJN+rvPWwmD7hfn5U6T522i6AwbHMLByvE6uJ0HnoB/veLgsOsQr2qTIUvKHAqHSn/ybGVJrIKUW34bljnH7DYlkfM46hwFy7tKeNHbw0YnrRtUKfnyMHO/zSI3OED7Zzy2hFiVzgQvK62awABZ7WrWdQcmdLVNXWX9S3HKLARUnRdDoByxy+Pl2LtgVLBzQFOo3379kP1PjQBlvAjK35RZXtWOIeZfhn/ExY92iPhG+Y+kSCCs/wIis34Sb6OKBGJj2BAXi5jh3GOYsGXLg6a379hurvzqnWXNjZfFdNa7BKv8HKOMDylAX9994RlHfvt0Fktei/6TSbdrDse1VX+tIE/c1Gmmuj6Tn0r98gZCR8OdOyzycjY56fFFue2OfgEcru0UrYV5Gj23uoRB12y246g+UBDr5MdLSl7/SEmw0BddaLdTYPxhp2TPNBlsdMSREkMNV7bt0gVRxltStlA2QT//U1YMOtWtTIVhAhqyXRRnCzilnVQ2m5ZWgK4bc56FRsV2Kyq3Nflluowkj6kUh1Ln9nHNRjttI2HXSJMcBfy3YRK3Xup6sKTsKXmN9pxmQQ9Im7KY5kNVzDD7X2Xa5Rn8VXdGiuQGT9+hPLTE+VYiIG+nJRiz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkVXazZxeEJMSjE2azZYZ3d1aXRQUmZhU1FHbUFEdGtkVGo3cElGaHNONm5x?=
 =?utf-8?B?cjNSb0c0N0JFRFZpdVNjRnJWWnIzeVZsL21sVWdqY0hzNkVDV1JINlZyaVR5?=
 =?utf-8?B?RUlJZ0pKTnhxc0VPQXZtd3lkdTcwa3gxQ2VTNUpuQzE4bWpnZHF3aXJPRjlo?=
 =?utf-8?B?ZytGNTJRZzRRaDBCUHNzVUVCRXRhMHBadzA2NDFuaDZuQ0thMDlBbTFEbjg1?=
 =?utf-8?B?OHI3WVNFT3NNazA2NDNRNGJiS3RHVkhXSmNWS01LNExFY3h3OHF4VVdLcmRi?=
 =?utf-8?B?U1gvWFk5cjJhTHhHb0hnNUFXdzJzQis0UUZLNDBDTTVuL0dZekJPVlpzUUQ1?=
 =?utf-8?B?d2g5Y2VtWDRhdVpjMzRrRTQzekpSN0IrTys5SGRtOE5uMHdXV09IcDVDM0F2?=
 =?utf-8?B?QUdFbGhocm1sTkN4b1VIQldiWndjQkp2NWxEckxrdHpuUkR5WDlhNDcra3hY?=
 =?utf-8?B?R2V2Q3RPWkxVUjhnckh3Y3pwemVJckx0ZzFremtZWVFwUTdDVTZqVGxQZ0Fp?=
 =?utf-8?B?V2JYbXp4bjBIbkZtbDdzUzBGekNCc1hObE5Qb3Rlb0VUYTlnMlJYMXBLTk94?=
 =?utf-8?B?MDFDTytWaWt6V0U2L1JodkpGMFY3OGwxSHlzVEtLUXpkRVJxSjdybkY4Wm1h?=
 =?utf-8?B?TjJ5YWZEZVFwaHdMOE5FK1ZXTWxRVi9iRXpHOG5mYWhLMmRxUk1WSXMxZDZm?=
 =?utf-8?B?eGhneEFIbHhPYWRsbXQzbDdDcXNrcmIrNUxKN3BOcldDNm9abWlJYkphWTZ1?=
 =?utf-8?B?L09aL1JMS29Tc2dWSk9DVFZ6SkxOVDRDaVRVL3JBTUVFWnlPdHdrWEtaSUtj?=
 =?utf-8?B?c3cybnJPSXFFQThsVGR6bEd4U0JpRG8wQUo4b0JWWUYwOHJtMEt4bXhidGhn?=
 =?utf-8?B?SjNzZGNSZTRPVWdyOFZFUHNjd0hHWW9SU2Rta2VFVldjbVp5Z0w1aFNhcWZx?=
 =?utf-8?B?QnFWb1paRzJqc2ErenVCeEU2allYTU9YbGJvbVFKTjRWK3dtdE1HNEIxdWVJ?=
 =?utf-8?B?WmROYjNrNnlsRnVhZ0xyM3JCNHdLMEhZaCswS1hOai9LRHkvT2d5QlMxUXpD?=
 =?utf-8?B?d2poUWtkemZjN1c2dTNNWEc5MnQ0VGdCZG44b1ZtendmeW5ER3ViQ012K0p1?=
 =?utf-8?B?SG5pakFhUFBxVU83YnRjb0JmdHlxeVlEdklBMWVtNm53cThUcFpOUm54M2pr?=
 =?utf-8?B?Z1dpVGU0aTZTQUtONU51YU4zdlRZK21tRjZhUDgwYURWNVJkYUZZZURoT1k2?=
 =?utf-8?B?UnNHWHE5UnZJQWF5cUd6Q3pqSzJ5MkZMRlUwYXY1bGhjdzFadmczMk0yckZY?=
 =?utf-8?B?bk1EWjFuZ01RcldhV2ZkTmV4Z2Y2anZVUnEybEpkSzhZazdJSEhUMFU2K05E?=
 =?utf-8?B?NHpnYzMrWndxMEd6UjVMbGNvcS9SSlVBUTFQazlMSGk4NTN0SXFlcWEyQld2?=
 =?utf-8?B?NW9aRDluTXRCVGFmQjFGUTk2NVNua0huQ2NWQmYwZzRYU2pjVHo5L0J3aU5r?=
 =?utf-8?B?cnhCbTRzUlUvdHVMamNYbmw5dEJKYXBuclpFWm94YnlST01GVnRpV1lFYWhw?=
 =?utf-8?B?d29xNGdvRlJsWnVNUlNnczhTVGd5VGw1MmdjWGlra3FMUnFDTW5kQ3ZoczNB?=
 =?utf-8?B?K0RXN0drOTl1SEwxaWVWckFiMEFLNTlQbGJPWWl6SVZDUHdiUUJJR0ZrYnRW?=
 =?utf-8?B?c0pWQU92aVVpREU3UEpuWXJqRFhDUFhRL1hQb05PMC96Q0FoWU5RL0hTNkNW?=
 =?utf-8?B?NzZVcU1TZTBaVTc2Ujd6dS9VdUVHdGNRYld2dHpBazBIZUQ4amtYUExrQXF0?=
 =?utf-8?B?aTRFQk9EUmJoMWYxMCtTMWd4T2VLL2srWGJKTkUxK3ZtVHE3OGovNnZPTkdV?=
 =?utf-8?B?RzBGdTFEeDlZakhocEtVWThwZ0M4RWFCMFZvTU9zdUZRQlllQkxmSFVQc1Fl?=
 =?utf-8?B?TytiYk9hOE5BWFhJYWZxRU96TWM2WmZ5ZW9KK0Q0V0o4N3NPNUVLa1Q1b1pS?=
 =?utf-8?B?SHRsVjNoak1PSEtpaWxibFNSbnBCWXVWdFhlYWswcWpQQ3M3dE1pR2F3Z0Vj?=
 =?utf-8?B?NTJZdWFXb3FGY3JuTmlGL1h4cmowbjArSTUxVmorTEYxNEViV3JTaDhZQzU1?=
 =?utf-8?B?cGdFdU45eWxYem45M0FidHhGbFNmK2J3RnV2WUx1aFBuUTA5T2VxWSsrWDF3?=
 =?utf-8?B?aVQ4c05RZHcrTTU1MlMxekZ1ZEZwNVVFTXJSVk1QdUF1dmt4UjNxWENOT1Zt?=
 =?utf-8?B?bzFCTnR5bVBaY3Avb1VDcUsxUHdWVDZXdjhoVWdpNDZDMUtZN21UdnZlUXF6?=
 =?utf-8?B?ZWhFdEFWTHZLQ2JvWlpicjNXREJia0ZaMlR3eFp5Uk1tZnVYM0lFZEkwSEU5?=
 =?utf-8?Q?2GTLmzJjGUCIP/rk=3D?=
X-Exchange-RoutingPolicyChecked: mWOqETerB56qF152UnqR52T0Cea6TUAS1XWPvuhGRs2PC1xFQXWDsneWAGIl4Wv5/Y1Xl/Q2r/307+JqpmNzqWUGZCnkHvRQZG27mUB22/GipnI3tXymhdHIeRm7qPzFqGkqtWu+LjnWs41vS18VPK4W/CU3AvVMVrfJQS3Bw2l5MLIOgTMWQBfu7j0zcWC6PPBmz+iyfM+3d10oyws1JRUN7hnhoTH5TrM0aYFwwqkHPUUcIiYI50QFL1B+LvwyuIyEbscvF3L+Bpzaa0dlTQC/g2xgdSOT35Ze22y0LJjtYq9aKOJPFYY/6YAdxHmvdmLvyzJzDjvtu2Q1OB0/GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d17f437-e93a-4ebc-ce7e-08de9a3f956a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 16:05:01.5952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPZK2oXrHlHtE1TcURevof+lgEb1h5RWRiNfdv7sbcVFkQhJeKFKBzujAawoTjBpROvDeO5Cu9yY3thAfTBhp5e3PhJnWlv+CmGVGmrETMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9228
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


On 4/1/2026 1:57 PM, Belgaumkar, Vinay wrote:
>
> On 3/26/2026 11:10 AM, Zhanjun Dong wrote:
>> In xe_devcoredump_snapshot_free(), ss->gt may be NULL when the snapshot
>> was never fully populated (e.g., when cleanup is triggered without a
>> prior capture). Guard the xe_guc_capture_put_matched_nodes() call with
>> IS_ERR_OR_NULL() to prevent a null dereference.
>>
>> In xe_devcoredump_free(), the deferred work is only queued when a
>> coredump is captured, so guard cancel_work_sync() with a check on
>> coredump->captured.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 558a1a9841a0..ec206f512795 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -149,7 +149,8 @@ static void xe_devcoredump_snapshot_free(struct 
>> xe_devcoredump_snapshot *ss)
>>       xe_guc_ct_snapshot_free(ss->guc.ct);
>>       ss->guc.ct = NULL;
>>   - xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>> +    if (!IS_ERR_OR_NULL(ss->gt))
>> + xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>
> How about the other pointers being used here? Like ss->guc and ss->ge?
>
> Thanks,
>
> Vinay.
>
>>       ss->matched_node = NULL;
>>         xe_guc_exec_queue_snapshot_free(ss->ge);

Looks like ss->ge NULL check happens inside 
xe_guc_exec_queue_snapshot_free().

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>> @@ -254,7 +255,8 @@ static void xe_devcoredump_free(void *data)
>>       if (!data || !coredump_to_xe(coredump))
>>           return;
>>   -    cancel_work_sync(&coredump->snapshot.work);
>> +    if (coredump->captured)
>> +        cancel_work_sync(&coredump->snapshot.work);
>>         mutex_lock(&coredump->lock);
