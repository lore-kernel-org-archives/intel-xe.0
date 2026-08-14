Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EADC5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33A810E115;
	Fri, 14 Aug 2026 10:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTDtpsMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B5F10E115
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786702001; x=1818238001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cqY6FMy2fbdFEp/Z1CgOiTLw8evY03kvbwcghdn/nh4=;
 b=jTDtpsMknKvGMQSvNjZfopls5c//rE8q8CUNhLQGt4+JZnEHk6Gyz1vh
 uVAfbY3RhRjZs+oT8Z4PE1EmWDqWw7UxTz203O9DkOQQEO2L2wCW+sSVG
 8c7BeZ0F0SJqg/kjBYSy3aO1cteo8UeiZPJYKbmlZQL2njd5SIQHV8B72
 +qsBe/HCUUcst1nAt7IfzPLWzPLB1dDu8o86Z1gCom7VLq6q3FXH9LOQ+
 JamhdRBqiV6Qi4jAEZ6Pk7NfizlHzhHWCC/wfrObm8aFBWpOZUI4QYmXB
 kZzud6Jtlc4XyxsRyoS9imjx6m5xAYPt9uophkCj2/iQwNcp/TSkjqYLQ w==;
X-CSE-ConnectionGUID: APmulPMWSQCBaS201zxeKg==
X-CSE-MsgGUID: j8H/zMmwRG+JYOlv9FT7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86243705"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="86243705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:06:40 -0700
X-CSE-ConnectionGUID: EjBVokS5QneWAXgQpDYQXg==
X-CSE-MsgGUID: W6SqTv63TpWsdlNTr6nXWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="294124335"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:06:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:06:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:06:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bvf8O0V9XbSBI6ap1ws7rbV7E29tHMf2fdIFs6Ue7v/Z7qXs5iJjCinDjrqlGa5vykIA7xbqo8vVbsYcdIKMsvNtSwwWPX53o410XoAo4k4gnGszMf65mBA1ujc0oXxDCCRg5z7I7CdT3BlLVAIB2uVqqe6lqzu1+Iu+InP8VM59jJq5c4AqFshFkNTa760fvwIgv0VPq0n4YgBg5xr6IF2JV343qYwoc1nh28VWWwoG5t0lffQrdEEsF9BcbMit0FYs4Fr0/OUasjSgbDSuTxJG35cxtfulsYAzx7GXg2F2/cV4fIZj/9dgc4OL87T/lKxs/S/5wUiFdG0/rIHI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYgAfvYfRu83/KN0AXnZUybq2qLaQncZdCVBJo1XFIg=;
 b=dF2Ay6mAp8VqTb6eKwnu3uu4Q8Xnvd+leC5XDiTy+cbSF/1z+XqJb8j/f9HKB9EiSzOVzZS7KL5/2g6f+2fuy+76Bp1FduIopV58Ht/F3Aj/hcqbqzGjZ6qlfFBYNRV6w5Td0uS9CdEd/fm1M2ppvE/iQ1a9IYXzzP2sWg5qbcppdbKdwzCS2SOqYhtRp7KRmyRYK5C30RkYKNlhjU6JAcb8GDYw3Wb3GJhepZaZtcffe7Xse6aXlr4KHH1AxF5o9mIaURwAbDM7TjgylmeaHp8QLXh23L5lXU7/c7lKUcbt5Kpqzu7aJ0iNjs92l5bnz2bY8jj082hONf/N9bRK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH8PR11MB9505.namprd11.prod.outlook.com (2603:10b6:610:2bb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 10:06:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 10:06:34 +0000
Message-ID: <a0fe9b9e-95bd-438a-b96f-e9ad1005a8f4@intel.com>
Date: Fri, 14 Aug 2026 12:06:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
 <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
 <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
 <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::41) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH8PR11MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b14a435-7a9b-4784-2815-08def9ebb8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|10067099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: qiKaozH8y5pkPamJyhUldDn0USaPAgFEhLn7ni3HI21oK+mPSR70UomgucJoqCHkcKU1YbrDGh/ma1wZYpMwbaGEijIV+rKUf3nwsEz6CXbkEp5qPTAHoxzsHbD4vCzereSen90uthGBbq5/Tc9G815GmL2Lw02kKJnQeWz3UZB9HAHxeYx6FyWZRuTR8xRF4MlQ4b8bh6H9AkGQmafIWrl6RrQ6pOp1gl0f/ubTMfdTzPUNToMv2nKGCGc6QzecogCfJjL+wvfxXy8nHdTG01Vw6B5MXyAXnmvaE11OVNmewNOs25TgXnzR6onmEEVB7+kKjvy777nC456P9T1vfH4RdTyCEQ08Q3EZA6xESjCHbp6yhhjOkdPCFbTQt3p2OCed16gQazpD8jbPT4YFrw1vLYFYhdn7+XTkv/ApSwZj+unWRLwzCHeww7f+lXLHhYvgsNbhxMDH4kk5bab8fxpNIs1pch+rYJoGHfJjZVkwwNvLu1HGc5/tqu9pGR+VnW3SuazrgVkC2U6w+DgxN72cZoQBhGiVZ4I6K3hEWfK/lVrCepb8upvTz6E9olbmTgpS+Cx/evHIKIvvEcz7orp7SRt80SZ+G5sPwbUY+ebQbT8Bt4KAJ3LQ0Euu3Ipy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5pMjAvUEtwM1hTS0ZTeDVGendOOGxQd1BmNktUSmtSMThIZmJwMjVmMTlh?=
 =?utf-8?B?a0F4RVMyYm55YTZtNG91N0pQb011d25sdGMvWWZzMUJIemhQZ2FndUdzMlRD?=
 =?utf-8?B?WlhFc00yWkFnSy9yMWdpcGZCRjVYdVZ4MXB3WVU4bU1qeVBtUU9sVFlRSW9O?=
 =?utf-8?B?Wm1ocFU1eWZhUzVRaE5IdStUTjhIYzNlS0RSa2RXRjYrRFVxeFc3QXJoVUdL?=
 =?utf-8?B?ZS85Tk9jdUU5MFhSemtuUXNaNkNrUTFqU2VQejU4aitoUVNNZk9vTmJuSGZH?=
 =?utf-8?B?eTcvWVU0dXdLUHl6SGN6VVpNYWhEVjZ3YjVMdldJbGVaYkk2emp1VUxSdjg0?=
 =?utf-8?B?ZHVpalBSbStIRm9DbmFVZjJ2NXhMZDhVdHdFcGtEdUFIdlQydzVKWEMyVEUr?=
 =?utf-8?B?eTlpRjlMUGsvTVNFUkdwUmUxZUtwdTVldEtWK0N2TjhTczE3bTBFOHlTR1FT?=
 =?utf-8?B?TTFBQXlKWXdMb09mKzZwV2UvZDRnQ3dLMmhKR042NFVjbmJzRXJpVTRsYmxP?=
 =?utf-8?B?M05uVGJZUjJNSjh1K3hsOTEwVGZNYzhya1JXa25NdDlHOCttYlk4eG9TbG9o?=
 =?utf-8?B?cUpCUEtsdzF5elhycG9hSFoxa3NYS3o3OE53TExyTGtaOXpmbTE2N0ZYSWVR?=
 =?utf-8?B?dURnVGN1VlVWUC9LTTRINWcrZWl2c2Z4aTlpbTJkRjFJZEMvajZOUzh2MTB3?=
 =?utf-8?B?Y0tOMkVQSlhYdjZRVDJiRWVpcS9hT1Q1VWlHcVBzQ1N0cWh2SnBvRnBycENp?=
 =?utf-8?B?bEZpT0xoWkw2SG9SRzk3YkR2STlSclpKQ3plMlRwbm56T3JDNWowL281QUN6?=
 =?utf-8?B?b1JwYWtGR3YxallUQVBIeWhHU1dvNUVESWUvbCtEUjFGYmo5Wk5aZEVEVVdD?=
 =?utf-8?B?OTB6UzZRKzBuOTh5NDA1TGVNWnN4UnNKWUhlNEIzVTNmZTFtV0ZxK3U2TXFF?=
 =?utf-8?B?TS9VS2Z4QjQ5RGpRejRVVmEvSkU5RC9TemhHdjhJWG1DTWJONngyT2hPNDVK?=
 =?utf-8?B?bm5vZjVzR294YWlhbU1CNHQraVdYMWtTTk4rYXNkWlVBMEZ0SVlwZFFzUG5s?=
 =?utf-8?B?d0N4Tkd2dTUwVWIxWUQzY0tMSXBWaTBnREdtVGN1bjJELzZCMDExS0VIQ0k1?=
 =?utf-8?B?TnhETWtHTmpkNmt3M0ZKUHZXQTRDTkNyM1VhTEMrWHEyQ1BNV0dDMzlwaDAw?=
 =?utf-8?B?cTVUOU5CKzBRMnU4bDk2N1hiWnZnZnhTRXhRS0FNS2VITGkwRlVPWnMrTExP?=
 =?utf-8?B?UzJOdnZJSkFUd0x2WTFGcnlBVnl1Z3VPem1jZlhYQmZTdkNnWko0Q1o3eERJ?=
 =?utf-8?B?dmZyaURKZnhiY3dGSWp3dFI3WSttQ1MwRkgrd3VKU2tDRlBHSVRQMS95cXVI?=
 =?utf-8?B?aHJTVnZwc3RmY2syWlBNYk51Rmo1QnhZbW44ZVp2d2VSdUJ5THY2ZTd1WEdL?=
 =?utf-8?B?OHp4MUttQlUvbjhHK1R3Ky9GcUdHUS9aNncybmlMbEZ3VWR2aisyY1BkQS9Y?=
 =?utf-8?B?YlVzTmVhMDluMU1yRjFFVmVudXh6NkZVWjhuMFE0OXlaN2F5YzJHOTF0UW5p?=
 =?utf-8?B?ejhyQVcwN1BDK1hITmx1aVNtTll3Y0RQMjlUMit1Zkl0NS9GRWZVdzlxOXBU?=
 =?utf-8?B?TXJQNm9KLytZN2ZPckpNeFM1c2pmdEFXSHhMOXlBcUxPbDRNWWU0N3lpNG5O?=
 =?utf-8?B?amtzaW0ybUVMZ2pqT1Y4UXJJbS92SXowVGZiMFY3SjZ1OTA2Sk9FNUVqWXp3?=
 =?utf-8?B?U2R1Q2RVdjBNWHc0eVZqYW5KQ3RyKzdlcXBEWThKdW9oaldMd3lMVEJjMmYx?=
 =?utf-8?B?TTlUNTBsaUtQSXBDL0VlVlJ5TFlxMmRVRS9Wd2d3RzV0aFBiODR1SUhXaENK?=
 =?utf-8?B?OVVnUXVTL3Zmb3JsbDhCZnFFRjM4RGI0WFJiS1JOQ3puUVUwUEFVZGoyQnZG?=
 =?utf-8?B?VllsQVFsZzVsVU1zck5EdmsvUnBBU3NIQk9DQWlrS08xQklrQ2o5elVmVnpI?=
 =?utf-8?B?bTNGTmdJUlI3eHdjRmNuZGk5UEpSbVdGZkNEZGdvaTJUOUlyR0sxSVpWTWhI?=
 =?utf-8?B?V1Ztb05heTZNczRpcDVWTEJtNndSdWh0a0Uzb01ZYnFEYitURzNXZjh5bFFQ?=
 =?utf-8?B?a3JRWnR1K28reDdQa2JrQ1BCQzUvdFU1VW1OZjU2ZWQza2JYZW9Nam1wVzJM?=
 =?utf-8?B?ZEpiVHRGaHl5STRTQmRON3hnYU1vQ2M2NzRwUElITFVicDNKSGNoM3o4bnV0?=
 =?utf-8?B?eGdrMGZHczNTWFZWUnlxSkZnT1BWa2Rwa21HaTlpWjVoZ0xNZkhRV05kaCs3?=
 =?utf-8?B?Sit0bUMvejNGd21TK3hrNU9ueVZ2bDFrMnVlUWl3ZjZ4bW9VYVB4TmIwNmVB?=
 =?utf-8?Q?4WocwpbRc6Gf4V/g=3D?=
X-Exchange-RoutingPolicyChecked: kZkos0GVhYgyAiut2rxVwpu5k7bOhAwjmSnyKeNmjqD8+Bny5Z+edY33g14hKvSGZiAmR0G5mBw4KvrLO5KVLMatbT5A14W//7+UTwJ8NooEx/0Q1tGZjyMOlMK2doAfjW7QHwNDvrMmGeYCPeUePac095XCZZCgOX6RJNz7YpgKxvNOBrVyoxLNgiFS/k7vTbUPBg5/HFVxgNZzzxmWb1ZK6+EadCyR+v62vQ+N1iiTsOA556+Puv4g6Uh/1nyU+Hpxyo1h0GPvrPJKjNGn//9EEFw8nDtilA7cgOzlbKY1r5F90BDQrmFlpd9S3Qu8ftHs6uPfW0xM6eDOFXB6IQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b14a435-7a9b-4784-2815-08def9ebb8aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:06:34.5016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0XB5w9gKooOsjylqYvRJFOzzk0hQVtvWRwb/pEyC8Vk3MAv9uBLYIJfrZf2m8MmWPm252pnWfGpsxlckKnORydNjhdRUST6lRfYQG8JT0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9505
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



On 8/14/2026 8:31 AM, Tauro, Riana wrote:
> 
> On 13-08-2026 16:31, Michal Wajdeczko wrote:
>>
>> On 8/13/2026 12:52 PM, Mallesh, Koujalagi wrote:
>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>> Report 'Boot Mode' status or failure using various xe_log() helpers.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
>>>>    1 file changed, 13 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> index 2d8c532157fd..ebd288986c11 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>>>      static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>    {
>>>> -    struct device *dev = &pdev->dev;
>>>>        struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>        struct xe_survivability *survivability = &xe->survivability;
>>>> -    int ret = 0;
>>>> +    int ret;
>>>>          ret = create_survivability_sysfs(pdev);
>>>>        if (ret)
>>>> -        return ret;
>>>> +        goto failed;
>>>>          /* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>>>>        survivability->mode = true;
>>>> @@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>        if (survivability->fdo_mode) {
>>>>            ret = xe_nvm_init(xe);
>>>>            if (ret)
>>>> -            goto err;
>>>> +            goto failed;
>>>>        }
>>>>          ret = xe_i2c_probe(xe);
>>>>        if (ret)
>>>> -        goto err;
>>>> +        goto failed;
>>>>    -    dev_err(dev, "In Survivability Mode\n");
>>>> +    if (check_boot_failure(xe))
>>>> +        xe_log_comp_fatal(pdev, SURVIVABILITY,
>>>> +                  &survivability->boot_status,
>>>> +                  sizeof(survivability->boot_status),
>>>> +                  "Boot Mode enabled!\n");
> Do we need this check? This function is only called if it is a boot failure.

are you sure?

in xe_device_probe_early() there is:

	err = xe_pcode_probe_early(xe);
	if (err || xe_survivability_mode_is_requested(xe)) {
		err = xe_survivability_mode_boot_enable(xe);

and xe_survivability_mode_is_requested() may return true based
on the xe_configfs_get_survivability_mode() settings

> 
> We can have a error log with the type here. We don't need if else.

based on [1] all survivability mode SIGID are FATAL
and based on 21] it was an arch choice to go with info level for all

but IMO if the boot mode was selected via configfs it doesn't
make sense to call it FATAL, but if there was real problem detected
we should make it FATAL (like we do with failed PROBE)

[1] https://patchwork.freedesktop.org/patch/732271/?series=168333&rev=1
[2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731

> 
> How about something like this? and remove else
> 
> 
> <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=<N> FATAL (01000000) SURVIVABILITY: mode=Boot
                                                      ^^^^^^^^
boot_status is u8 so it will be at most (01)

and I don't think we should be so cryptic in the user facing error messages 

>>> In case of fatal, will make sense to return "0" OR we can add return as -ENXIO right? any thoughts?
> 
> Mallesh, you cannot change return codes here. This defeats the purpose of survivability mode
> 
>> you're a reviewer here ;)
>>
>> but seriously, enable_boot_survivability_mode() is called from
>> xe_survivability_mode_boot_enable() which says:
>>
>>   * Return: 0 if boot survivability mode is enabled or not requested, negative error
>>   * code otherwise.
>>
>> so returning 0 as success code in enabling boot mode is the correct one
>> returning -ENXIO will be no different than failing to enter boot mode
>>
>> @Riana, this is your code, can you please confirm that
>>
>>> After handling fatal case
>>>
>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>
>>>> +    else
>>>> +        xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>>>>          return 0;
>>>>    -err:
>>>> -    dev_err(dev, "Failed to enable Survivability Mode\n");
>>>> +failed:
>>>> +    xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
> 
> Can we retain the previous dmesg?

there will be already "SURVIVABILITY: " prefix included,
so IMO instead of generic:

  [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Survivability Mode

it's better to have more clearer message:

  [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Boot Mode!

> 
> Thanks
> Riana
> 
>>>>        survivability->mode = false;
>>>>        return ret;
>>>>    }

