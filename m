Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66525CD37AC
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E7310E1F3;
	Sun, 17 May 2026 09:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZJPcz/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E4810E1F3
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779009698; x=1810545698;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QCozM/+oYczvonMuAPih6bB6IuaHZabj+4KGb+HQfjY=;
 b=OZJPcz/61q5YrDlvtvjhLIqa8t66rPW2MABshgadwkoAjMvS09I2IV4t
 H1z967KTMI66D560SFxtDuo01cMM5lwX/M7oI0MTimDKKjA332Xt1uDZi
 EEFpZH8sm1W2QUvv8B6pWLg9BzN5G2A47D4cmwtE8Jyvr/0dH6U7FSsOF
 IFL5z0COrm0/UqfpM+5RQltpXQ+KwmqZ7fuzTBqpgrANCdflc+FeaQNn4
 lj4TPlH5k5wqSk5FqOAHM+Qleo8Dme40a/vv7oZPcuzxT95sLNs2AKH58
 sRpBkc7DYIkfbGElDmgtfsZKYpcTuWivzysyMsJnFnOr9WAKj77cJdTUJ w==;
X-CSE-ConnectionGUID: up9xYRDuT2WIff+W2lbVrA==
X-CSE-MsgGUID: Qy0l+NzfS0285hmZXUEWxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79028267"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="79028267"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:21:38 -0700
X-CSE-ConnectionGUID: DoVS5N0YQFqxyTOA6UdGpw==
X-CSE-MsgGUID: LXV+hdVdRq2T7hJDsVaUQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="236501498"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:21:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:21:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:21:38 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMkB/gVzJsEigS65gI/VS5sXY8nj216pg+Kxo5ZECeVDKSGzbLex2Fllhd9p6U+qxr92Hl81bSQUOatzIIMTB+pZH6tqFT64pLGMcESXKXjzK4iKR7uWoW+FXSM5t15GmuORHR+5/jDDrzD71TNpPnESRrH5IoHFttSMF+bWcc+eV4QCCAbXwVlHPEF0EoJuAYXyaGkIhMZBTSdnhL2kKW9Zg1KBwmc5itgkyNHN6zxXLsc4Dcckxe3wpQSORBTt0wdgin6izlXlN9drDQZcrFJXA6fwKmoH1qzZbF84wk4PBYfTkmgTQzRuZnMpsEOYaHjzgDXg6I+3ZGV5iaEXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urS3GnnKzRRXTZZzMNJ1NEdSPOfAnGY5Xme+OmSlKF8=;
 b=DoT/MG+IKw4ot0CkFTWf6e3LpB9pSOCoaCd87Gs2NloaEX5OYPF4g7jp0VTYjjAJcJOM5y+GKvQmK2aLBd7RBjkj1YSVs8tMXgutLl5YgkK0+U5O9YgBiYOlib7dCNEci+Y593MDeBVcGoDz5h39z8oQyC5RKSNWIu4dk3+yO290qmhfGcvJRJ937aBWKFB3WFOBpJBwyXjXmwPPMGnO5NSMANXAmUHvy9RK7A12Z8LtdJywL94xyl6+IBkIAfqQxNdeawkS+g3hFte+4J96Xz6n09YLoq98Djkycsk6GGIXyIGagOwVYOXI1V26moSTlKbgCniQhP2EMBaGJBnVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sun, 17 May
 2026 09:21:36 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:21:36 +0000
Message-ID: <44b04964-68b5-4720-ab5e-0bb9bf15d5ab@intel.com>
Date: Sun, 17 May 2026 12:21:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/xe/memirq: Update diagnostic message
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <20260514150010.7123-7-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::7)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DM6PR11MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: a2456f81-0412-48ba-0f9f-08deb3f5b170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799003|22082099003|18002099003|4143699003|56012099003;
X-Microsoft-Antispam-Message-Info: UvLezAVa+DTCFucGMhBVhszVckiYj/oK9FTOt27oMg0C7K6j7f/vs2lzFXsn261T06eb/+9aHBbxKAzAYNJ6iGq/tPszfCkoEVkfmt8MK00vhn6Z823ezHkT37yr+at0pPl2DIUzdzfj54G2JOHWH5FKrQFr9ume1DisvOZMoZECiRX/mg/ZNItHLGLASNBpcEi2Z7/oz6rPFoeA4EW/I+DU4YT2R4VbTohBQxJWGZcEeGk+qpGxoo/fzvOvG7vZXuVep0YAw/kyMIuJR/ArZcK9ccu3YC3cIQ5x/xuKSerzAidcV+rvTL/Dg3eZOtZoDq5yEnRXazkzUNB2j0t8dislsZnH/M5QAldvo/qy/MOwDxqaYar96yymJCA7vfCj4MoemXVJLRxKspK27dkIQwfvEe2AU+rGp+oOcaze/G7l4MW33OEBi0zqXhgKCFgC36aL8IGtyGLA6LPR+xCx9AwisnMZZ9LoxMDOfg3p0hvzgXTJcRL0ejG7I9+d0X3Blhk61bLLbCKcrKSFNPYbP7RFury2FHGlJZrx/674Mo6KDr7WrZUiCbCnD73SU4LYCr2kAIgpX/nFAE9lMDxunGb13JdkOvopnJda4c75hKHVmrNE2BWA8dy+jXO58HcuzEaxVYhKFiUhLkpVGDWJvGOTlkqXu8XKNFiLufV6rBEv5US+3qMb5PECy1dFdxX6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(22082099003)(18002099003)(4143699003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1Z5Sm1zTzFRdnhSdXVScUh0c0xZWnNhcU5kMGY0TE40Y0tYM3Q2OEptamZT?=
 =?utf-8?B?RVB0cVNkaklsbVJBNW1vUW9xdEh6QlhUS3FKWFlOcU5YWTJSZlNHa29kVnla?=
 =?utf-8?B?dDZHeStNUXAzVHpIL1k5MXg1Y0xzbmU1bWVrMGhYY0VMbUxpdW9XcWVRZzB6?=
 =?utf-8?B?c3RBS01UaXNRVzlnK1pyWFBoWWJYektOOEhnbW5qenhsd2JlL0laVG5Dc1pK?=
 =?utf-8?B?Zm5KZ2JmMW96dEVoamdlaC9SYmF4cXRzZEVwb2FVSXJSaWZzdlhZWm1HQ0tU?=
 =?utf-8?B?WnhvcTFNL0VWZTBOUDBlSEhDK245dXJkK1F5bmdFZ3VzcGpZZnNIcFZ6TEN2?=
 =?utf-8?B?ajBYbys3YnBEMTRDYTlWY29WakZodXVHMnYweS9uQzNaK0dBL3N0bmFnSExj?=
 =?utf-8?B?NDNldWtmbGFVRFBZaGtQdTBQZ0tDTE1rVGlOL1MwdXRFZzM0VEFQaHM4dkJW?=
 =?utf-8?B?dHZYb08xckdLQTMrWnU2Z1FCc01qU2t3dFdBTjVqYzduREs5MkZMMXVTYzFX?=
 =?utf-8?B?VG5TOGxaUmRjSGk1UkpiY3Y3NStvbDdqQUU0THgzbmVPdFhJM2xib0lRT3ho?=
 =?utf-8?B?UDB0QWtKcndyS2NYeVJYM0NvTGh6QXIyWkxzQlliR09ZZXJ2MU1aWFpldHFE?=
 =?utf-8?B?NzhYeU5pQ2N3K20rU0pLaW1MWmZSRnM4TDBHRGZublExaUF0MlZZbnpwUnR0?=
 =?utf-8?B?dTRtcXlqMlI2djBTck1CK1pKSXRWL3BnY3VvQ2UySnUwZExzQ2JFSXQyY2c4?=
 =?utf-8?B?bm1YOGhEajFmWEJQMkZDcCsyRnBGYzJCZTBvdnpNdVNJRFpyKzUyU05LUExr?=
 =?utf-8?B?cHF2dnFlNjg4WlBpdHZzVHVRRHBTQlBKMkZtU1kvdHpBbC8xNXM3UWppMlQr?=
 =?utf-8?B?cXV3WmlTcmt1K1paQU9RYWNvdGdxOHg2UDlucFhJRkRPV3hNV21XOGxvVnZp?=
 =?utf-8?B?WWw1aiszTzRmUmZsVjZrM1lXNExZL3NxTHFuaXpQMVhPYS82dW4yNGV1d3dx?=
 =?utf-8?B?YjlsVzJkaERhYTRBWUc0ZUJGZXVjVlg3cXB3ck1qRVZla0xsQ0hjWkVGcStT?=
 =?utf-8?B?VnNUaTFyZFBXMTM3SUpmMFlhTkFpMGVUdUpxdXZoRm1mT01vOXJjMngzMkVX?=
 =?utf-8?B?TEpQTzQybE1mZTh3NFBOTm1UT25NWGZaZ2szTG9BWWhrSkRXV0FDS01UYjJh?=
 =?utf-8?B?Y0NMc0pYck5EdjJXdVNjclY2N3JKOVlKMWFSL0dreG9UaEJGT1k4YzNBRFZF?=
 =?utf-8?B?SXl6cG0vd1VoeTRCUmp2WnRBTVNXWEVlS3dMT1prNmhMQ2djWnVJc1VIbEV6?=
 =?utf-8?B?dFdCbStJNmxVdWxsVEJQTE50NDN2Skwvd1praTZpN0hUM3BGYUNLemNrQmJT?=
 =?utf-8?B?YUp5elBiV1loU0RsK1Y3ZWd3bHJKK2JacDIxak9takppbmtqYjQvZTJRWnFq?=
 =?utf-8?B?WDRaREFvZHR4T21mVFp0S1lHSUorZ0QzMHhHTWdIdWFYcUxkZWl4OFI2amNu?=
 =?utf-8?B?Z0xsU2JrZXQrMFZMZGpPVUpXSGJyKzI4anVpWDhPVTF1SURnZEU3SEJhUWQ4?=
 =?utf-8?B?RUhpU2hjU3ZHVUJLQlMrM1J4azdzRDF3WUwyc29Wc2UzckNjQktmcC9WaHJ5?=
 =?utf-8?B?aFdQengvT0lsU25VVm5YeW5NQjBsUlc3bEgvOHNjRWpEY0wvVDdyVEpSYjND?=
 =?utf-8?B?NHdySDZ4MXVyblZBbUErMlhBV0dERmtpVnZzY09MQ2dRNkhFb2dwSGREdGEw?=
 =?utf-8?B?bnZJSURqeHREdWVMM04vd0srUnVUdmFnOEFicWcxNlpkWHRJSC9KWlJieVcx?=
 =?utf-8?B?U1ZyRHkwcFpkNlFXMlZUTnA2UFpZQm1WUHpzWVVyOHFiMXFTZ2tDZExzRk9h?=
 =?utf-8?B?cnVWaktRWVNLK0ZHYVo0UERiWDM1bTViN3pVTzVWTjNyd0hIVHExdnB0THRF?=
 =?utf-8?B?NGk3RnUzemo3Yk9zTExTcll4L1hnOFBVOGxtd29vekl0b0pEQVM3bHpaSzZS?=
 =?utf-8?B?SFdHRnloS0lBNjdkcWpOR0IvVmk1bklBTlNnRVRtRmUrWXQyeXgwSlc0bjBs?=
 =?utf-8?B?NFFyYVRjeXA5aFZwQVRUZW96ZjljUHFZWFp0NXVHbVJmcDJ5SnovbW1nWEx2?=
 =?utf-8?B?Q0M1THBBbjZLeXhxQUZoZ0lUSG1iSDNvUlVQaGVRd3h2d3d4Vy9xWTdXbXNw?=
 =?utf-8?B?YmV4Wkx6Nll0ak1tY1NNQkZCOEFtV3RuSUNZZ0N3aVM0OU1OVWFqdDEwdEhw?=
 =?utf-8?B?YUtpOEdKQVFRVDhsM0pVTFpmVGRkbXE2dHNQNU01VFdSUjZkNzNIZUNEM2dB?=
 =?utf-8?B?VVRjYXUyZEtFS3ROVE5mNjE2UXNPOWQwU2p4bUQ0a0pUOXNVS1I5QT09?=
X-Exchange-RoutingPolicyChecked: b04CJV4IAJ/8QVfiF+QGjzY6iWYvATNjuTZkBNRpli8zN5B7/jldfZr9UvaEbBrhkz1IhyqQxkpryrE3AVqdRpL0k/TV3K8mCI3GbPaSrjLRqa/e30oRQ5YFO4dZDZ6Y7R+ICGTB9XMUhqU/TxcPz01WBpw513AkrQw0soKErU+/BM+n2iSdTUCsi8M0pjBo4WXMxku2DmyuDG3ZB5IyrtKB0kZhw1LMoN5swRTnLO5rWvKwPpeLs1jMpwmh+VhakPgn/brZIAw+NlOIuQtiVSK3PnO+ZpD1mEc2fkaybpiYYRJv61ut24+Y+tS9FU69Dd9QB+HTMFyslcxv9biDhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2456f81-0412-48ba-0f9f-08deb3f5b170
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:21:36.0213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coX5WilseNwhoBBRPYIkgXpjn5M67ufdFS8ylMeU8gBS/k3RuaAnztg+Ia0gtDHlhHEXwFy84Qev8pEol71KAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> Instead printing static offset values, print number of allocated
> pages and the actual GGTT addresses of the page zero source and
> status and address of the common mask vector.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Ilia Levi <ilia.levi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 6ffc92f5a0f2..bd2417207b0b 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -226,9 +226,11 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  	memirq_assert(memirq, !memirq->status.is_iomem);
>  	memirq_assert(memirq, !memirq->mask.is_iomem);
>  
> -	memirq_debug(memirq, "page offsets: bo %#x bo_size %zu source %#x status %#x\n",
> -		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
> -		     XE_MEMIRQ_STATUS_OFFSET(0));
> +	memirq_debug(memirq, "pages: count %u size %zu\n", num_pages, bo_size);
> +	memirq_debug(memirq, "page0: source %#x status %#x mask %#x\n",
> +		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_SOURCE_OFFSET(0),
> +		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_STATUS_OFFSET(0),
> +		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_ENABLE_OFFSET);
>  
>  	return 0;
>  


