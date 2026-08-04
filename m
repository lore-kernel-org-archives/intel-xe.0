Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EACAC5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 07:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A4510E8A9;
	Tue,  4 Aug 2026 07:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsMqWWCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7047110E89A;
 Tue,  4 Aug 2026 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785828106; x=1817364106;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zeb6eOdhKcxrt7qwzNYUbpXvjIW3hPspg93tw5srZTA=;
 b=BsMqWWCr/5PIPIb+77GaqUCpbcR+nLyyvqGtSNwuRwWZmJxqAhP/lPgg
 6b0bm3Puk4FsGy8ZyzID8ytj6zAbFBMXyUCvRnYVlk062Xjxy2Op4Raas
 voG2RGI2RZWj/kfnl7yJ6rFFQk2tjaFoSGC4wAAlU9lZIjCEewlg9qbI1
 OzPbstGVpB6fYKaNK9OVUxE9w3UT4U9zXYCgInKI9JP7WaG8UJg+VQwE5
 oGPKSx6tdiFFTeAqaRT+xxzDFPbUOjO1OaLvWOtAZ764Y9c6Rfus0Mw2J
 RtJ2r3V1AkJpAK/KYvNG4AZLLK3Q7vIGVIjTKvEWV/GL6vlY7M75ZKBef Q==;
X-CSE-ConnectionGUID: jnQIDo0GTCyaWoKnu9q3lw==
X-CSE-MsgGUID: cprgx4vFS3OB9wgQ7UCtXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86491479"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86491479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:21:44 -0700
X-CSE-ConnectionGUID: CACHw7d8R3ODpUX+0vdkPw==
X-CSE-MsgGUID: eJJbm1SARKSnNSoy0DrfKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="299664794"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:21:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 00:21:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 00:21:43 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 00:21:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIpw2AkpYuSw99SUAOrAsyldPZJKMrrIilIUmJiwMuAAfkkaK+b4oophIWevRlZPOWi/oMBrEaKbYTvrTo3EVBA1o1m6FqMm4Jsxds2u30QUQ14JdUesTQcIPivF3iz4LSE+GHciPUGXy0IQ4/oc+SFWDYvlmr1UvDauoRIAfyRq0lO2ytz7zVEZOm8N0bPaHlPDCjOr4cA8iPEeUknKwB15OT11LdKmGCgQ2VQ7kiuR/kfCeOL95w82Kx5NlLbbR2LAejPfannX6Eu860CfBIYyj22gBzz4GMd1f4c+YAcSxqZP38NcSj7VbDxkNfvHQhHcSzawMTAIkynPYoHJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W82GZgIzaIwzayDL3WWZ8LPp4OKNoFZqti57FaNs5nk=;
 b=WUGoOtK3MaScbS8d8yW1soRd4WlbMyk+DxeLoGUn4CRx4dXQXVD1i4OG1rAtZeNoTy38ulB1d0uDEd73xYlnkcM3ktwFZswVz4Q1aPNv4I/k+adxXmX+RzzCEdqqiNTr3CpdsIh8O4y37u4MDiQfmOFMmh3Rl/l4yOAltRiZF7SNP2zP3hJP0sIBrGc+uwjOkiED59LEtn3/wq+7sBzi3VHXLQib42WaZ1mKdJWH+OnIxHFTi6iUpDThM2vt7cDs07FAKn2U+DqlUmvvTssNhQOeP2+V20RurpQMNvrKxVLAiYcvZYIWB+SZBtEHTuR2MfdyKo8wetZf59upZ9nJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by CH3PR11MB399853.namprd11.prod.outlook.com (2603:10b6:610:364::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 07:21:40 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 07:21:40 +0000
Message-ID: <01943e93-7481-4721-ba09-ee0f0d4ea723@intel.com>
Date: Tue, 4 Aug 2026 12:51:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/display: Keep AS SDP flowing when skip
 frames is enabled
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <animesh.manna@intel.com>
References: <20260803185305.562609-1-uma.shankar@intel.com>
 <20260803185305.562609-3-uma.shankar@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260803185305.562609-3-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::10) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|CH3PR11MB399853:EE_
X-MS-Office365-Filtering-Correlation-Id: 819a2452-eefe-42bc-90f6-08def1f906e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|10067099003|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RXCJXfHe9aA4JmCXWf7T2daP2JAo4mG2me5amdVvFj0g2QPfigljCvb19ZP5a+kiuhI2n1xKOR3uuM/8EqooHruZEFvGZYKQZvtVH6iwkrtCdUCEh8i+1Szu+adhdxw9vC0AFB1h+Oi89nsMnFP7P3lnzrCVDxRE5UVR7oJ89rneZAWS4vN1YIouBgHHJZGxfgBXhpnkrJBXVp0Bz+r7KJd7/q4xVZrs0fZGqVh/HJkVhXidw/eMR0ToGmKahEqoyTi72uKwHij1D47M2SAGS/L9U+R3qrMO1nHZyBAQF0UvmVnJJu89gKwpB36TA74uFRuR1bhfI+jdVg6j0aou/F3On44/6irpE1PLHT4Wgoc1b8boPIpS9LI3O6PbEz6YKUwhzLxQQdZ0jeoiVXSZB2l/cFkK8g6jyX38uDEjB4ZGJwZZQRl7RnTCJY1DyaRsCnkiU74T62QIFrmFYaK1g/gByZlQ/IJ+1bhURQr2P5doreIxizAIl3dDxJyX8Be80O5YRiWPVzaieay6j71BVS79vL4ZcSCr8YWed5MczxSyFXIy5+TUfPu0JlK6Ix6HJnxDrAoN3fvCWxBkeVadWFSuSd9AbFvmR/DBbOIiDoVyA20/PV9jnXFR6tcOlh4YU94zDuRtOkZgkXw1tC3bAsvMvKU0w48Wfx8QoKQZYdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGtuWlZkMjZGSXpCL3ZSZnJZMzhDYkF0VmwvQ3hnT1hENVdjeGJEZEIxMzZH?=
 =?utf-8?B?Zm1SN3djMDhvaFhnVkhVRnZRZWluNmFna3BPUlBiZFlUdGZBdkxYSEltK0hT?=
 =?utf-8?B?Wk5rckoxTkxPall0SE9nZyswQ1lOZVBmSVNRL2g2MXE1QSt0b3NrV3NXWWh4?=
 =?utf-8?B?MFlPTzFuV0dNcE1Nc21odFNBcisvVzczNXJmUGF1VGpxREtlRzM5NEJJUWZs?=
 =?utf-8?B?NzRWbW0wN1JGaXRZbDFpeUhCSWh0cVVGQ3RGV0c5NVhaZitRS1k3WXdqcmJ6?=
 =?utf-8?B?Rk50cnExVDZGVHYwbGhodlEraTQ5c1JCMlhZakh2cE9XR29EeEpZOGh6Q1lk?=
 =?utf-8?B?UThMLzc4bUFpN0JmS1pObVNWSEhHYjVzQ0dZby81RkpYbjJpbjJqN1JIYVho?=
 =?utf-8?B?bUZXN1B2SUYrNHF5dlFCRHNhd2dHTUJKSlEvdWIwWk1rMWhqdHFzZUcrZTA3?=
 =?utf-8?B?eU4rTVlXNmxsUlVTQlJnS0FoMXBUZjJtYXErU3BUUmlEa2tKeUR6Zkx2a3Y4?=
 =?utf-8?B?VEdwdnA0dm1WV2xCbGZlSmYrcjJ2MWxaSzl2Z3MzUHNxQjg0K1pXZy84aExx?=
 =?utf-8?B?S3Nhb0lpb2JFZkFRcW8rdzB3cVVUZUdZUnpSQ1hVZ2xBaW9BZ1RpM0xwUUhw?=
 =?utf-8?B?Ykx5a0MwY0hYcmlySWpoMk90Q0ZZUHdiVU1sdnF0RDdZNVNuVjFXQ0ptTU5J?=
 =?utf-8?B?Q0wxSEV1RGRzODBhM2I2RFRacmJKa3pMWUNGMlM4SVZ4ZGE0VDdnZVZRWFMy?=
 =?utf-8?B?aUtCaWpRSGhFOXBVZEljdUIybytkYlJpSXJncmErdTM5R1FNNGFvWFJJak1H?=
 =?utf-8?B?QXdCbjBXVk14d3RLRWJPMENENTNWS2M4NkdpVnhWdkQ1b1VRVHM3T0g3eHZT?=
 =?utf-8?B?MCtnSUtFTmlqcjB5bDlYaUNseEJCc3I1eHdjdDBkSmlwZXk2ZnBkYy82RlRm?=
 =?utf-8?B?TXl1R3RQYytVTUhRMTVQM3d5aTJBTDVWL21Wd1dWakNlMENCN09oaWNiUTU1?=
 =?utf-8?B?NVEzNWVkek1yQmVaaHIwQzRIRXpBc2Fxc1dxeWJZUDNJMGtrU0VCQysrUDRC?=
 =?utf-8?B?Z1haL1ZJSnQxV1Y3YWJFRFJoQ1QyL1FJUlN6WmxYemo2L1NqZ2RyaFA0b2lw?=
 =?utf-8?B?RnZ3cWlOSS9yd2E0bllHR1BNV1p2MjhTS21yTHp1Mms3OTh2dzcxWGdCQkQz?=
 =?utf-8?B?ejNYT1psdGpmLzgxb1BzZzYybGlzdFRPa0xSY0RNbXJKUDN6QUN6ZkNnK1l6?=
 =?utf-8?B?ZEpjNmJROU1kekV0cmsvd2FPL0lBVFZmUHZnOHhIVHo1TlFJMkVWOWNmTDVN?=
 =?utf-8?B?SjluTldlcmNRLytRRGRXdEhaTkRlQUhTRFdGbk45Zi9YeUFxRkJ0UjdBeTly?=
 =?utf-8?B?bWlBSndZcmlGTTlvcWFIZFRGOGtwM3FpNEVQS1NaWkJ1UXA1SU1UNUZQWEFq?=
 =?utf-8?B?UFVZZG9pd3ZHZm9yci85MEtrMHFiU05SZU14ekc1Z2tDNGY4MjVzZUZXMThy?=
 =?utf-8?B?ZklwRXJPZk9IZU9ZcnZRL1pWTy9lSUxwMzE2WHoxRkhDV29zUGxUTWNXVXc3?=
 =?utf-8?B?dDBSWWVTYjg5MkdSMVpoNVJuS1d2cW9iazlOL05jSjNGdFArVmF4T0hHM1k2?=
 =?utf-8?B?R0ZjMHl5Z25INHJRVFRQRHNzMUNYcUV0MnJ1MTIyZTlzK3MvV1dWbzFkOW0x?=
 =?utf-8?B?d1pIZkxVejdTbUptRjdPOUtxV0Q4TkNROVlJVzhIVmUvSS9EakJwb28va1h5?=
 =?utf-8?B?VzAvaGZaYnB5cTRTczJkMUhmSm05OUluSDZBTHJRTWZnbG4ySEhkVGoyS1lU?=
 =?utf-8?B?NHVuTWJRemlxbXl2VytzbXpaeXhJaDd6NlFaQTI2N1ZOcmlvUXA5VkZOWnE5?=
 =?utf-8?B?NkU5RHVZV01Dc0luTm8wOTd6cUhVSWU0QVgvalpNQlBrajBTZEI5bE9RZGRL?=
 =?utf-8?B?b0VJZWFDd015NmczNU9uUjRMeGpBY3ZtdkRLNlBGNHJ2UFhYc2Y1U25NL1Mx?=
 =?utf-8?B?cytBYVpLK0QrZkxHOTJFQVhiaGVDeG43ekJ3cjR4ckgwT2hya053WDVSd1ly?=
 =?utf-8?B?U3o5aFBTNmo3cFQxMGxBd0ZydnlpbnhGTmN4MjN3aXAvcDJwcnJVVDNSb2FY?=
 =?utf-8?B?RDl3U0pia2Nwakt4UmsxbnMzaHFlbG5lRnhSaG5UbU1mV1lsd0x1TGowZmJK?=
 =?utf-8?B?OGt6OTIyd3NlS1B1Tk9JeW9UQjhDN3NSQzQwYVVyUkpNbm9sMzExa0ZkYVNO?=
 =?utf-8?B?di9JNGlIWjhPWVU5bFo3WWhLR2ozNzVQSUFQREtqbk9ZTUs0dXR4QldvQjFZ?=
 =?utf-8?B?Y0h0Y251a0FqOFA1aThlWEVWajFpYUQrZWp5UjI5L0xVSzNMQnY4akZpTm9U?=
 =?utf-8?Q?8H1ZfHvlEukB/MkWJRiCcX4IiQMaO5SV8nFIA?=
X-Exchange-RoutingPolicyChecked: hVm1oP2Etsi4kh3ajMlGT18q2B7UP6F+OkClb70LmCjBadcbF7gMk3X2PV/0PBvM72s0Ylh3MXfdOEiEu8o0WdUxhZQVnc9ojeBiHpcCLQgQynn58LOebZtdwkAmwlGlRPr+8cLOJpvQRGOl+ku/bIwHL2dW/eHJlgirFl9MQHxsr67AmpJg59D9ZE4miriTiatghxMa8Dx1XEMIuolmyDrdUKBdF8/vCEdyKJCstqx7E5MEhCVIbKEsDRY559By+n83KPmEhtc5KI2IyD9OJ/O+7BtLg9XwrAHFlhR7p6kaoOReS7Fzf6/MJa/h+04fCfcM8a7A9QHX7vZL/0R89g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 819a2452-eefe-42bc-90f6-08def1f906e4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 07:21:40.2250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pqvdcrm66yx6zJyEBK8ItfD4yt2rAf4Nz8zm5BJVdV98FfIHI5WOHI1yEsk5HY/GRNNh0bZuu4R1HriyD9bbMiXLmIAlB9Enzp/0f+1zEzvu4qHKhLvefbQITJnJaiFO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB399853
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

On 8/4/2026 12:23 AM, Uma Shankar wrote:
> The AS SDP skip-frame mechanism relies on the AS SDP still being
> transmitted (just less often) while Panel Replay is active, so the source
> must not stop sending it in the PR active state, nor enter the DC3CO idle
> protocol which would suppress it entirely.
>
> When a non-zero skip-frame count is programmed, leave both
> PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE and
> PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL cleared. The previous behaviour
> (honouring disable_as_sdp_when_pr_active and the DC3CO idle protocol) is
> retained for the non skip-frame case.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c | 28 +++++++++++++++--------
>   1 file changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 0f98f02a1848..7e2292f93e1e 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -439,21 +439,31 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   
>   		if (intel_dp->as_sdp_supported) {
>   			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> +			u32 skip_frames = 0;
> +
> +			/* AS SDP skip frames field only exists on Xe3LPD+ */
> +			if (DISPLAY_VER(display) >= 35)
> +				skip_frames = intel_pr_as_sdp_skip_frames(crtc_state);
>   
>   			if (crtc_state->link_off_after_as_sdp_when_pr_active)
>   				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> -			if (crtc_state->disable_as_sdp_when_pr_active)
> -				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
>   
> -			if (intel_display_power_dc3co_allowed(display))
> -				pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			else
> +			/*
> +			 * Skip frames needs the AS SDP to keep flowing during PR
> +			 * active, so it is mutually exclusive with disabling AS SDP
> +			 * transmission in active and with the DC3CO idle protocol.
> +			 */
> +			if (skip_frames) {
> +				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> +				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
>   				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +			} else {
> +				if (crtc_state->disable_as_sdp_when_pr_active)
> +					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
>   
> -			/* AS SDP skip frames field only exists on Xe3LPD+ */
> -			if (DISPLAY_VER(display) >= 35)
> -				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(
> -					intel_pr_as_sdp_skip_frames(crtc_state));
> +				if (intel_display_power_dc3co_allowed(display))
> +					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
Do we also need to clear the AS SDP skip frame bits here?
Otherwise, LGTM.

Regards,
Dibin

> +			}
>   
>   			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
>   				       pr_alpm_ctl);

