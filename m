Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A834DC55838
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 16:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A412A10EB16;
	Tue,  4 Aug 2026 16:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShGKNPjW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E15B10EB0F;
 Tue,  4 Aug 2026 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785860115; x=1817396115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0F1V4HS5gPTvJCSN8MZ13Rs+LNuIa9qTuuzkWZDsAa0=;
 b=ShGKNPjWQunjKLqjo+uxJodaswXd6eBgcSr/egawdOCDWmANnbNZUTYI
 gzL+qJj+bWZqVTWLtyLgMnc1wP5UIm3Lgn8X6KWnBJiTu/9tecgY6TJMC
 WgEvtd/1nc1u2tjUpZB7+Rx2/7eVQXCs51nmAnH6ciDWxnaCmNBnWkQlv
 aaUbtNBYS4sqA/8DKVb73blskNjq1YPA4n6kapMq7b7XCr4PzPzLW96Rz
 pBDyj4S0Lvclv4iA+1XV0SZTmTg6s6Ic+N9Gzk+i0y28yIPMVsL3Ig9GM
 PYwjaRXMwFiIBMOk8b9MUUmg0DO/G+QfsGPQp+F9WHyRwnuSDZySFGDR3 A==;
X-CSE-ConnectionGUID: ZuVywWVkSZKchJcT6zvdoA==
X-CSE-MsgGUID: +WsImcGeTb2amdp1Ps8Mww==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97068602"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97068602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:15:14 -0700
X-CSE-ConnectionGUID: FMETMgyxRYSLJnCyVwfvQw==
X-CSE-MsgGUID: 4biXyeglQvGb1BEPpbTIqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="261612359"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:15:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:15:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 09:15:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/nR3DUmzSR0lDdf3QhJaoZ0M9AW0N20ANmVn9adG0L4PZGNtWkKOOM5cBA1zMM7Lfse12TqWeRA0+/fxTwlaC2+7mjRAkVzXjctQUaJDyWjSeW4xc7u3fOUYOR5nZP666XjkPXCO7Pjtyrv2zKk/MiwJ2K4I9x0yN+KydUf4gpuhh1LPfLP6KlONwDjSJ1vI9WcW3nQJDnrSt8dPo3WuIu5r3ll1yFa4HcDDgceOLE/Dj385o1xqRn6vwPgwC0G8AaPJEknBD7WqGo9uBgTDFr+ZWKNDXKO9QsJs2Ibfdcd26d6Cr/8JsZ6VnnH7/PX+OUEL08dJNf7+aBMpoCVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJNBzGsJ2+Y4ddkIlpw021OHGYPk6rM5jcVeJIy2S9c=;
 b=TdCj39IrKp7/D/2hYH/sa/yskylF9ufe9Kv65jBUdoFct5slj1RrbTR8yaTfxg9b96sPQuTjWFPgrqXptXqNag767Um2HP8KQnVVBSrHsaQT99MxFq+V1PdF0LwFBmfdgctTXhNxTuLAUKGTz+IDnbfptmYt2w8vrH3QUqNDu9yqwErdNdTfGtdBP1Rx6LAenJ7hDKvpj7Obn/I7kmkK0xlB6Rn0e1KV0ax/QqVHyOB5PYW/Gu8nSKIWqWRa9YrNFDrYPqWwsPl18DEkjeqTeQTW8gO/WSkmrHFhfbPwNACKlfFhaQRHBPr3/7P2tOLVyI3wODpdzWGKnsIh8tU/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by SA1PR11MB9633.namprd11.prod.outlook.com (2603:10b6:806:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:15:12 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 16:15:11 +0000
Message-ID: <bdae7c85-bb9c-4aee-a9cb-716ad45c53d9@intel.com>
Date: Tue, 4 Aug 2026 21:45:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/display: Enable AS SDP Skip Frames
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <animesh.manna@intel.com>
References: <20260803185305.562609-1-uma.shankar@intel.com>
 <20260803185305.562609-2-uma.shankar@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260803185305.562609-2-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|SA1PR11MB9633:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f3b964-b79b-4a5b-c85c-08def2438f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: v2Bp2+xEPVm+EjZxm+qxk+k8F6cTi9irIBqKQZ2lEvZZbeEpZT0ABFVGCpcQ6b1aMbS3m4AKiL64haFiUJoVe5cgdMAyBife4GCJuIm6PI1Qb3WJ8b+lEy8S5XBr9L+QTHwSF+BiNSeThRhLYYPPdyDtGHGpnqHejA0EJEBtQArhSz0I8KFA7rjDrifAJsbh4arH9v+xQOl9VurB8XBg2TztYrCoCosxna+HoG3HIh4M8S+ULqGELROjkIL+lLkW0BGE4ffAZFany1NYfOmCCx/jkgZBw1yWKLX3p3q9GSeBZjbkiUMeYK7Xy1/hf525QFLtfMtetDzw/cppu3jw4UyHPaMIli2sToC/ESw7VOZaefGaeD2JN1a+HdToz1sslt+IGpCOGFHsYVXjEjyYP8wayBrSAQ30mybmdvp9RyVjcG4edOuDzxDYZYfCh6lmdjutmxDe3ZR6PO3grst1sOn2Ktal9Bqjmvsq9mr6VIS1wlIBUGXDhdIi2GebmXm3Z2EY9KlQUaMlPxpzDaymug90QAtcwS6bn0RzRlZAdUnaeIM7jSeEeIkucuN75/zA4TkyQHtlAOvJy/7uaUSQh8p6+NtyD9m8Bi5XV/Fy4G0aUOmhkG6RsyjS1wuaVZ5de5A1NY5DoTT8KrQI4dwopugFyT6pNNCLO/kOmYtOz0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c09WUXhGUFZSSW9RamE0UTIvVkx3TjVjZG9PcmhLeWl4T0Vxdmd4U25tNEpN?=
 =?utf-8?B?TkFoZXlKZ0Y4K21sLzlieVMxYzRRdFJsdU9TcXRHUm0wTUtuZmc3ZDkrU3VN?=
 =?utf-8?B?bVhMRjFmQ05BNlQ1K09VNG50aTg0NGhOZEJnMGhDbm9JaGphUStOckgvQkg3?=
 =?utf-8?B?cFdLWlQrSmd5ODFLV0pIb1F0cEdySmRPZFg0c0hOZGJSSHgxZTBIeUF0aW02?=
 =?utf-8?B?T1NwZVJrZ3I4bXRhQmtyenV1eG9qMWRHaTlEZTQxQkRGVDdjODFUNURBVFU3?=
 =?utf-8?B?ejc0d1gvVlB1S0V1SXgreUZFWDJuVnE0OUpGR0xPNEhOWU15aXJ3WkFJV28x?=
 =?utf-8?B?UThDVUZucGhvempHd3NXVGJoYmx0TUo0TVRqRVYycWU3dTkrSzNqdDFBMEhi?=
 =?utf-8?B?Vk93a3I1UlozY09DWTZ2cUNmYU1GWTdOektJTnhMU2g5SVJXbzd6T3Y0ZjlH?=
 =?utf-8?B?UW8zZWtIYkVwajMrWVpsTERFRjE0TEs1RUxVS09PTmp4cGhna3pXZnBQdDNI?=
 =?utf-8?B?MVZLMitlYkc0cEEvaGx5MUd3Rit6RDVXNzQ5WWV5ZDNVQVFBSU8vdXBSQlZj?=
 =?utf-8?B?WTlSVld1cXM0WlpkMDhrMTVPNXAxZEtoQU5vZkxvV2pRckRobFF1T0NFT3N1?=
 =?utf-8?B?R1hyQUR2UlZpRzFWNThIWXVIUDZ2bEhUWjFHMm56U2tITHBGZ0pSdGZZbEMv?=
 =?utf-8?B?cng3R0VxcEtXdzU3aW9MYVNSemhQQnM5SU1YN1hKLzlLN0pSUnZLTkE4aFYz?=
 =?utf-8?B?dGtmbHlBSyswNklKTjRIUHk2SW9vbXBadnZiQS9iRUZFZ3FQWkVRcHUxb0V4?=
 =?utf-8?B?U05HT2Y0VGNBNzVtNU92czBkTGhERDJpbC9UTUhYZUIzTzdDdXBwMkx1ekdO?=
 =?utf-8?B?dzNEOGFOYzZsbnZPcWJEcWJJSk9QY0xuZFB3RGhTU05VRkpWNWpEcUZzSXRV?=
 =?utf-8?B?Q2tjUzFnZkZFWWtkU3Z3em9laVNYK2pQb3EyK2FiOUVyOHBUVmZISlVwM1NO?=
 =?utf-8?B?ZCtFMUF4UXlTWTErY214VytzTmduZmdhSVU3ZVNOM3Fza2haSnBXZE5pT0I0?=
 =?utf-8?B?V3RnRWlUWW54OG1kbEtHeEN6WDNPSTlLWmlpdFY3TkZFYnM5RTZYT2lEUy9B?=
 =?utf-8?B?b0JlbUxhbnVpdncyeUhKS01uTDJxY2p6OFF3UFhtSlRydW0zRlNKczZsclFK?=
 =?utf-8?B?azdkWjNkaExsU29oSDlQSC8za3JkR05Kc0NTRmNPWnZRN2gwQmhsTnVpYVI4?=
 =?utf-8?B?Z2JGa3Z0ajU4d0ZwelQ5VzFmdThCakNBM0NMS1hkZFBMMGVPc0kxTEdtRWY2?=
 =?utf-8?B?UXhDbldML1lOSTEvcjdnNjhwNEV0cE4vQUZMZUNrOUpXaFdhN2RiZmg0RHVy?=
 =?utf-8?B?b2V0Z0dhajRyb0JIMFkrNWlEMjBJMUMzV3BsaXkzR1NFR1BSMGY1U2xVdzEy?=
 =?utf-8?B?dzNUWXFKYm9BQW1uUHAvOW9aNFNXZnBLUUdCL2lMK2F6cGIyN2Vjek43S3hu?=
 =?utf-8?B?cEUxZmZQc2xhbTEzLzk0TDBzM2FSZE5XWU8vcnVEM0t4Z1h6SVVLMGdWeUZm?=
 =?utf-8?B?cFFDUmo2NTdLS25QakQ0cFE4LzNkT0YzNytRK3lvdGhmRVR5NjZQUnRhQmR3?=
 =?utf-8?B?Z3o2UHJ5S2lnb2s1d0V6Q1k5Zk44eHQyZi95Snc1bThVbFYyRmhLQTI2T3dF?=
 =?utf-8?B?NnVPMUhtam5NMjhzb3BUL1JMTy9ISjJXeEpDbGVJMjZmZ1pkTVJKdTRsWXhT?=
 =?utf-8?B?MVA4VHA5ZGlEN2Ivam9yK21iL2JaY2RzTDdYMmUxNU5OQnRLay9IQmI3Zk5U?=
 =?utf-8?B?TGFmKzZwcnl0RnBtY0s2SUgrakEveWVCQ1VTcGJpUHJBVERzRDRQMFJQTCtU?=
 =?utf-8?B?SXlPNEZ2MlRuWGNlb3Y5QWpXTWNnTEdYUG9KSGtIQzJuamJJNVFUN0UrRSs4?=
 =?utf-8?B?bkNhenp1UDlzVmhOcEVSbDYrTjhuNnR2Tmh0b2EyWFAzd2V2MEJuZGljeTds?=
 =?utf-8?B?WVRwR3lJK0xRNVh6aXhBZkxBMmpTK2s5aTQyTEZ0aW5vcTNxUXZwQXNCc2pk?=
 =?utf-8?B?azR0TjJBUjZiZDVMM01vWVU0R05YMElLVDNWU0FDZHZuWnkzMVBia0JCYm0y?=
 =?utf-8?B?TSszZE5ldU5uREdSUHBPMHBaTFkvNEFIaGR2cXJRS2owOFl5TWZJdWx2emFS?=
 =?utf-8?B?QmRJZjZheDdKWkpSMERhejJJNmdzNUZwNDQ4bXZuVGlqaXZrVndTNkJoNExR?=
 =?utf-8?B?VUlLUnZUQ2JLeW1DSlBueTduaXE4RSt5Q3pySVNsTFZrbDg3WXoyajZ2T3hH?=
 =?utf-8?B?QzhzN2FNa1dlaXByWEdPRTJHalkvZ25vVkZ2Uk9ZT2pqcnhBWW1jYTRuWnlD?=
 =?utf-8?Q?XICc4a/amu/+LM5QrHuRpeO5a0VS37bZQfkrrX5S0Y/P5?=
X-MS-Exchange-AntiSpam-MessageData-1: ra6xsQ82AJ1QlA==
X-Exchange-RoutingPolicyChecked: aJx2Z23PJsJjfHTriLD5GjvGj1U1oCiHJxMhOyhpIbJhmg4Yj2YjV+JH2fQBN48LJPyP84be+wmgSlip8p2wHQwhvJ5GbG7W3LotpzjTQARmCXYfbMk0JyvYTqbZa9KDeRTtmi/LQjbXgXBThNpKiRT4Il3WtFdaWOzEqfeqhfC8hoqC5C5SO3ANsEzMiR3mz96Knd9FsyxT7q6kGwZvmU+H8l2f6fHTdvH59Oa1wYZy0vxWwDmvUmqxXovPijKNlgcq3V96JcM7hO2+bO9DfZNkJu5Tc30BAFs5WRYC8AP6L+kfPrTpNAfZRXQhFZUU7gLFgNSPM4oZvPsV6cybyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f3b964-b79b-4a5b-c85c-08def2438f72
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:15:11.8646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMLAZ1AS+kHmawCnnbwaqd81ElIAYao8n7aaCoGEdykr5SGs5RPHaRSZwdFL75aQEP29HZ8b0FLPQTZ9e6iMqP2oJKLeLXhlN6cXcWYpqBNhLJayDRHD6/KEibEu00wz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9633
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
> When Panel Replay is active the transcoder timing generator runs at the
> panel's maximum refresh rate, but content is often presented at a lower
> rate. In that case the Adaptive-Sync SDP (AS SDP) only needs to reach the
> panel often enough to satisfy its maximum frame time, so transmitting it
> on every frame is redundant and shows up as repeated SDPs on the link.
>
> Xe3LPD adds a HW skip-frame counter in PR_ALPM_CTL that lets the source
> send a single AS SDP and then suppress it for a programmed number of
> frames. Program this counter so that one AS SDP is followed by
> (max_vrefresh / flip_rate - 1) idle frames, matching the effective
> content rate and allowing the link to be driven down to as low as 1Hz
> when the hardware supports it.
>
> The maximum refresh rate is taken from the current mode's vertical
> refresh (adjusted_mode), while the actual flip/content rate is derived
> from the CMRR target (force_cmrr numerator in milli-Hz over the 1000 or
> 1001 denominator). If no CMRR target is programmed the skip counter is
> left at zero, i.e. the feature is a no-op and AS SDP continues to be sent
> on every frame.
>
> ToDo: Currently using CMRR debugfs as an interface to get the flip rate
> from userspace, this will be extended to a property interface to receive
> actual content fps as follow up.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c     | 45 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_psr_regs.h |  2 +
>   2 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index f1383764b702..0f98f02a1848 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -375,6 +375,46 @@ static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *c
>   	}
>   }
>   
> +/*
> + * Periodic Adaptive-Sync SDP skip frames.
> + *
> + * While Panel Replay is active the transcoder timing generator runs at the
> + * panel's maximum refresh rate, but content may be presented at a lower rate.
> + * The Adaptive-Sync SDP only needs to reach the panel often enough to satisfy
> + * its maximum frame time, so transmitting it on every frame is unnecessary and
> + * shows up as repeated SDPs on the link. Program the HW skip counter so that a
> + * single AS SDP is followed by (max_vrefresh / flip_vrefresh - 1) idle frames,
> + * matching the effective content rate.
> + *
> + * ToDo: Actual flip rate is currently passed on by userspace through debugfs
> + * create for CMRRR, but will be extended later as a property interface.
> + */
> +static u32 intel_pr_as_sdp_skip_frames(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	int max_vrefresh = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
> +	int flip_vrefresh;
> +	u32 skip_frames;
> +
> +	/*
> +	 * Actual (flip) refresh rate comes from the CMRR target: numerator is
> +	 * in milli-Hz, denominator is 1000 (1:1) or 1001 (1000/1001 timing).
> +	 */
> +	if (!crtc->force_cmrr.numerator || !crtc->force_cmrr.denominator)
> +		return 0;

I assume skip frames are valid only when crtc_state->vrr.cmrr.enable is true.
As intel_vrr_cmrr_compute_config() already validates the CMRR parameters before setting this flag,
I think checking crtc_state->vrr.cmrr.enable here should cover all the validations.

> +
> +	flip_vrefresh = DIV_ROUND_CLOSEST(crtc->force_cmrr.numerator,
> +					  crtc->force_cmrr.denominator);
> +
> +	if (max_vrefresh <= 0 || flip_vrefresh <= 0 || max_vrefresh <= flip_vrefresh)
> +		return 0;
> +
> +	skip_frames = max_vrefresh / flip_vrefresh - 1;
> +
> +	return min_t(u32, skip_frames,
> +		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
> +}
> +
>   static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			       const struct intel_crtc_state *crtc_state)
>   {
> @@ -410,6 +450,11 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			else
>   				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
>   
> +			/* AS SDP skip frames field only exists on Xe3LPD+ */
> +			if (DISPLAY_VER(display) >= 35)
> +				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(
> +					intel_pr_as_sdp_skip_frames(crtc_state));
> +
>   			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
>   				       pr_alpm_ctl);
>   		}
> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> index 16a9e3af198d..bb577e7e3bbd 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> @@ -276,6 +276,8 @@
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1_OR_T2	REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 0)
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 1)
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T2		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 2)
> +#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK			REG_GENMASK(27, 16)
> +#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(frames)			REG_FIELD_PREP(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK, (frames))
>   
>   #define _ALPM_CTL_A	0x60950
>   #define ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _ALPM_CTL_A)

