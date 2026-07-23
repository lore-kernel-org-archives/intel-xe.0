Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8D0C531C7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 07:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2678F10EFB5;
	Thu, 23 Jul 2026 07:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFh/NaiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB7210EFB5
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784790414; x=1816326414;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=r8D8eEpctUALk45iOYi7wi9yCeX+mdWRigMfp5uV20Y=;
 b=UFh/NaiRJ/afP/EPFdDOUb387LBF5+/DtrEE4LE6szjnelVWAgJBd/Gf
 yEkpJJGxSO717rjDo9HucqbG4mluYHxGLkWEOAq7HF9Lui1aB2zcdSqD8
 iPiEHHV/Nf/BEcCPol/oDyW1kwq3jviDEesSbMZmy90160ANFtETVbknZ
 E1kxpUOSrhzLTOcBVZ75vdLcE1yecDBwI9P0FRLRVTLGuGpSSoO8No7du
 gH/CkeHJiAgE8yWIU90jkvqGd2YCb0ORsyamJ3A65fMWNarkp039BZbAc
 us70m3zIjm9XcWcRhwa7hziFGC9XAMZqFBL8uVUvDk/FDMWVfOm8Z4F+P A==;
X-CSE-ConnectionGUID: 9MrMFXlRQZ6pKeUjCnRBqw==
X-CSE-MsgGUID: hdbDrgGzTLCqawf98sCS5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95792338"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="95792338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 00:06:54 -0700
X-CSE-ConnectionGUID: RL6APEYES0mkt83ZSpSvDw==
X-CSE-MsgGUID: he6JXKmtTrao3fYHypOgVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="262644844"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 00:06:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 00:06:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 00:06:52 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 00:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dt5uHqVv4sGxL7F0DjkGiMufe3jhrIKgkmVRryZoWBCGUBLcyf3JArqDtcDYye6iO4n1TJjMbp1h9/Vk1bAat4VAX7G1c8R2IdsPFzzONq4NlUDm9Kaomldz5n9x+YwKwlBJJH9zPMAadwc81HsR7mSb7b1ExuK+0XqRPJx2jqZAQ/Kgu9nRqMhXVh/S/Q84f0b2n7wAjM6O4p5g5pxPxrwAVcR3aUB+dtCjZzqs/vRGqvns0XsFORmjmW9h5VYTQVkktYtiIXfJNVObNjEDls6ixFiyF3nqmNGEKFqtHP0a4iYfYMKkKP77VtYC10OPSRTGzsMnqVX87tNaaksl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrvtoS15MKWRrSc47RafIM5eh3vJxrCBX3kdQciiBVk=;
 b=UK4UlmH1+GFehtjvDOTQ9xW8jfLJJ1VBVLgwxpXk7Sq3lcPwn8qgu1syjLAq3KyCuUZfWRj37/t0uj02N7yhv2sVt/aKmdXMS+ZwjgTDmgTx56P/6VUBZ9ScZNsyLBXgZrAJPZVwkxzcbhAzen61G48OV4z/xZq8Hxo/CO5Y3StISDvtrIXlNTQVy6N1MfD6pzsnglQfpBMBn5ChviX4cW9JQIuCCE5RWB7Faf0qBtBjUj2c4Q3q37K79kNjix3So2WokAwkXzE8ejVZAddmomo/cttsd5ZkPhuXizr8v0XazRUuESjc7rQe8o6MCDSPiDHeGR4NGnlWzobAtaMMcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH3PPFAB4263235.namprd11.prod.outlook.com (2603:10b6:518:1::d41)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 07:06:48 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:06:48 +0000
Message-ID: <8fea9a5b-b28c-4882-842d-ece14d60678c@intel.com>
Date: Thu, 23 Jul 2026 09:06:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe/mert: Rate limit VF LMTT fault debug log
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260721093116.4011940-1-piotr.piorkowski@intel.com>
 <20260721093116.4011940-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260721093116.4011940-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0004.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::14) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH3PPFAB4263235:EE_
X-MS-Office365-Filtering-Correlation-Id: f82ecdff-ac57-415b-ca69-08dee888f6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2edPWpGnXewA0ziWn1Z0D2ZIdRk1XkEccJDMz002GxhYGvRc8GefD2T0zmupL2L7msHywcWMcVLyrlDJ1s3FJDPLH4LW2f11/oB0Ww7WuHW+79OPz6LA+cFdpSZTgSPGBYUaDHc8Xt0UZEL3ypYGQmxSY9fvnmBvZQl3WB8guRNe/CSiKVN+vSyiEXpckb5yc0pHKaME1a4pWStwAPzsP8ya+UmX0JX+yLwmhmHeCuYwQVGVY08ujwPbsqHFqCL0KLewAGWMtS6Ec9Bfg31dilY5batSKmtlkbJ8OI1P+V7ewUGTNQWOsQvboAdH22aI/MBn9ruHJzuiG3vb/xNZCOlzL0CwUO+oZ+T8dRV/YlOeLD+T6TU+d0g4zxR2flTwy3rA9Uu9cZrmitagxeLC/JI/qdh4Dk6yhmfdEo1182QcZRo9mWd193f0jErTyAMrdhsInpTs7osADZ1C5xOct5xUy+S1b3hMHbn6IvtdwoNZtRLFk22MHwU4BCj0OShWFxjqOTB7f2I3buCYhEOAUKWUJ5HMhdYUQLd3+n5hOnEqq+kUBYAYUm8fmTiK4dmRTVXr4R5FezodynT7aeBQ4JD33s50WQe88rI6ze8nrz8KBFOMxzqcl0Q9waPmWr1V9QGW4z3pycqD16fiDUpSJ6wE+Rpc+OotqhmwDOJLZoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1kxS211K0pSWXV1Kzg2WFlqYllWcGNERE1aQlc1Y3YzSUJMbC9BSHVEcTZs?=
 =?utf-8?B?NlE0TnVER2dKNXNLRmZOM3dVcjRBTi9sVWw0ZnpaeVJUWHBRYnZ5NjBRTWdT?=
 =?utf-8?B?K1lZVDFXOEUrNGhhK0dOckUwNmJtMzJxallHL2ZiOFh5aHR3WW02cmFRVEtq?=
 =?utf-8?B?bjcwNlBuWFh2NVhtNzljSVBFUE1jbkVOb2ZqMHlCU2FKUlpTMXNyT0o5UGFj?=
 =?utf-8?B?KzdOeGp5ZldzZ1h1dExOTVpsbHo3Y3RsSDMzbUI3REFkSW5IMlR5aWh6OTd6?=
 =?utf-8?B?b2d2NGtBTndvM2ZUcTQwRzBxb1RjYXk2blgvYnNxVG14WjFBMzdGa3VZQ1BV?=
 =?utf-8?B?eEI2Vmo5QklIY3FyL3ZPKzliUXltM0VGZ1pYZkxkemwzWW5WMXUvSkR4eGQr?=
 =?utf-8?B?WmdFaUhMZFhPUjQzNUpxbGV1cVpuWHVBR3ZENjlhVllGTEIzT2o5cHcyZ08r?=
 =?utf-8?B?M29WYUhBWEtDMDVwZ2U4RGZpdHZOem92a0xhelJlcmFzVlloQ2hoOCs2YU1C?=
 =?utf-8?B?N1ZtR3lvTms5THF3bFA3Rjl5MUdBbjZoY2xhdWZIVFNhbDltSWJlbSsyUzNH?=
 =?utf-8?B?SGRtL1Y1dHRidDFLcHdFYThqdi9WUjBqTUhzQ3I2eENrT2h1aWFIdjhXamZz?=
 =?utf-8?B?cHV0ZHFxWU9tRXIySnFmdkZmc1hVczQzbUk2UGZxMXlPSXM4cWpoTE9uU3Mz?=
 =?utf-8?B?bjVIU1RqcUUrYysyYXM0Y1p0dTFFSUQ0QnJnZnU3eFhjVDhWTjVlMUxxYUpw?=
 =?utf-8?B?YjAzakpNVUt1VDVIQ0JZbXhnbFVSYUpEWVJkU3VuNU1sbmhCZ1ZVWlc1bXcz?=
 =?utf-8?B?YUdLMFE2SlIzemJqU1N0RG1zbHJlUkJVZUdoalZ0VXh0WGJraVNIZWtsMEta?=
 =?utf-8?B?emExN0xhZjArV0hXNUJjRGRjQ3ArL2JhTm5rNXpTVmRCbmF3MnBUL2REcUlD?=
 =?utf-8?B?TGlyQ01sZTdDOWl5YWVQcE9sTThPTm40cGY1VVgzcHlCY0Mra1RyYzMyNzgv?=
 =?utf-8?B?RTNuS3NCK2IzL3BObG9abitNNisxd2RKTEcyWlRPU0ZSVlBmT0RIdGVvWGRi?=
 =?utf-8?B?b1RHdXdDeVJwSEpISTl6Z1BVNVQ5UFByNGw4VnhobXRrbDJIR1NmQkxBN0Ns?=
 =?utf-8?B?SlNOcit6dERMek5jOTdzTkhCQWdlbjJkZmZkcE9yZ1hEOEhNL2R2bytqSkRG?=
 =?utf-8?B?Y3lFM2dwVC9rNjhzcnF1WktUWEJ4QWtmOElSYWJnVE5pMjE2RUxJdUo2ZU1M?=
 =?utf-8?B?SW4vMWY2RHUwRXI5cUNWOCswcmVLUS9BVjJYTVhYaGVqSnRubUNhSS9jSnhV?=
 =?utf-8?B?WEJyNm1rK3hBOHNtcTVKelBqaklIRURHQmVWbWxXdnhQelB5UitSSGZpQ0sz?=
 =?utf-8?B?a2ZKUm8yczE3c3g5dGMzNEJpbG8vK29XODZkQ1FzNkJ4L2tIL01Qdms3bits?=
 =?utf-8?B?WVRvQWNTclc1TFZLNFgxYUZzQVV1eEpObmRxMC8yM3VwMlRoQmRjM1JNL2RR?=
 =?utf-8?B?S2QyQkJMdmg2MHE2cDhtMDhjSkxlc2FPM3JXMDFJODBGSWJIK0lHSVhGZUt2?=
 =?utf-8?B?YVZZTTBHdXZJb0tIMU9sakFMNithdmlvRXJHNDUyejZvd0hkaE1OeGtEWWxw?=
 =?utf-8?B?ZXlSZnZDN25yTkJmY09LOGtoRDlJNHZvbTd1eGJhMGRGSlVLWXFMaWtsSmNE?=
 =?utf-8?B?RXdYaEN4bmc1L3Q2SUlhSUZUdmprRmVrTVBqWWtVMzFLeDhQb1NlTjFMeGZ0?=
 =?utf-8?B?cWY5R08zdlJyRktLbTBoOTZ6ZHJFbTVlN2UvbU84bXVVU2tKODJGNnBFTElH?=
 =?utf-8?B?S3dNSlBldldLTUY1N09sWWllOFlpcjFhVHhpYkNWVnQ4YmxWVUpnZFdXQjdS?=
 =?utf-8?B?bW9HQ0RaVXFySjdVbjY2aVpSd0RlODM1U3VmSXFkRHIwOGJsS2tjK05MWkh2?=
 =?utf-8?B?R0phRUtVOGFWMk5SM05WaUxVOHZ1bXhuaTNCcmgxT2tFWkUwY0o2TE0zK0pF?=
 =?utf-8?B?eUl4WVJFMytRaDMxWHBYQXl5a09aSzlMRW5vZytmcStIWm1BVi9Hdk9QV1pV?=
 =?utf-8?B?TVJJMDV3WVVBTFUwWFNnNDFoWEk3TS9HdEdLKzRUUTJRR1NVanNnMmRBU09z?=
 =?utf-8?B?T2oxdDBXakpsak5obEVjQmY3ak55emdrckRsb1pWUit0T1hCcm1qNitCT3pO?=
 =?utf-8?B?Tm1WWkV2VENvMWxRQ2hlRk51Q1UwQ01zRW1jb254N0xYUWFpWVRaOEp1YWdk?=
 =?utf-8?B?cXQ2OTlNSXIrdHF4VTF6dFhlb2p6YUdKNjhvRXJhSlF4bFNGZHFRSzV0aFhy?=
 =?utf-8?B?dmQ2bXFpMjNYbU4yOEs2WC9DT25NM3JickRnNFhKWmU1R1BXY1g4Zz09?=
X-Exchange-RoutingPolicyChecked: lCIu2BABWScfcGZ1hnEBBqw69Z3SqWNcNKhqJVWDyWDKrRJ1Io5x7BJjcTybjtfr9scLCX3DEfe9h9XFwVCyb40g2QZyvwlsaG6k2HtLrkPdfFKgJo7w9qwUY4/eCIaHziF1yJMABFcUHLXXeyJMwcVsmwHq7pP1BSt/aHFjeTjW74FVz9DjZUAeTI96gQsRTlZ5ZmNq1eBibJVXqpriOTfC+0pDn2qkZzUux+RcoGFXtNC4FD3xGA/7cRdvnCH2bR0/GySUU+u6u3bdPLKPakv+85REROBLKjXs9UGwWtrLYR7SjRnm2duIw50mGBsZSlYMQGji7EwAwM1CGvhsvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f82ecdff-ac57-415b-ca69-08dee888f6b2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:06:48.7048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzj6dYqalRHZDutSToGVZGFhi5qUhTq8hf8QLe7BWMfnoYLb7TuE0aFnLgmURjS4jmnLgaMB94dL9SwXnNfd7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAB4263235
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


On 7/21/2026 11:31, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> A faulty or malicious VF may repeatedly trigger LMTT faults and
> generate many identical CATERR debug messages.
>
> Use xe_sriov_dbg_ratelimited() to reduce log spam while keeping
> useful debug information available.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mert.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index f637df95418b..32700c19a1df 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -77,7 +77,7 @@ static void mert_handle_cat_error(struct xe_device *xe)
>   		xe_device_declare_wedged(xe);
>   		break;
>   	case CATERR_LMTT_FAULT:
> -		xe_sriov_dbg(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
> +		xe_sriov_dbg_ratelimited(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
>   		/* XXX: track/report malicious VF activity */
>   		break;
>   	default:
