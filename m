Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A77FC55175
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 08:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7EA10E0B6;
	Mon,  3 Aug 2026 08:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9w66KCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CB610E0B6
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785744078; x=1817280078;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x9EaeIGNIQDItnzFcBPvrILfGvDfg0GTWiEJA/tf3Wo=;
 b=c9w66KCLzPSmLmcrqjYarBuG34y4zyO8r+bA2eMbyPDsYWsPA9NVEQxV
 S0XxeJuRneCcEqeTWYxjFZmX22nkCBbAtRqqcK39aUnZBJQtGCfRfpxm3
 uPZAIJuBvJv5oQknCRlffAndR4iIRr4Yf7PSPmxIxYV3a5IPuqjqfOfxz
 UYFzbzIWJ0HqSRSWPAOzmePKR0m2HwUIw37eZo4yc9VlsCXneED/z5I1I
 Eghy7xlfGU7yrftIUmEj/VHRiu1o4IFchRceOxkKFDbwrfzvDCKrsS9mC
 FXCHB+HKQ8vpjBqtYrCy0wzrbjmOoVuF94HQGFqCchWEvCbw4keTePpwI g==;
X-CSE-ConnectionGUID: Lh/LtGEBQUyiElwTToP7hg==
X-CSE-MsgGUID: OE5/JZmmS4mqeiEZEPUUpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86226322"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86226322"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:01:16 -0700
X-CSE-ConnectionGUID: tNyEpx4yTS2pw9AKxrbsag==
X-CSE-MsgGUID: G8GGy4qpRb2Gj8ia6N5/4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="258486362"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:01:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 01:01:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 01:01:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 01:01:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEQA6UO+9rTqFbjbPvfABeE3E8qhigU+CNpCbBbPIII5RGnfJ2fqMtoEy86uYl7M1V7bSaUsH5UxVIyRzRc3jtaRAUK+55d6E4fKnwJATcIZdjPf1BMvzIBfPDynu8jUZs9jxI3lEK+NEOnzQ0nOQ+beBqJOwadjp4k+16uSOvJmK0JOEj7c3gGRuMuhf8rtb11Q9r6qobxUr1NM10jf5SFztCCcy/VRtVPscO0EJPMjLVL74c6q8UUNpetFRNlR6hkCFD6hMd+Zu/AYRtHTIdbF74ZjtnVvJyLp3s3yvjPhnaJoiZ+/m2q9W2ebFxVNTWK8kGgkV4lpNzfLrPi8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d31ePQK0Z113yavX7d6c18aPdU7z4wDoapiWaWSfcrQ=;
 b=cP5NUHTfP3V4nbvDXNyAC8ue79qHyI8mxZTaY2ul33bHWR65dejhN4XDDFwgOBRHSRRyR5TEbc2a6LVVMpBVkRksZoWzD0iZfI7SeQPRkXCzMLKLxn5GXkJFq+CbCsEUlab79yVd0PjzE0RHs0HSY2/cCkEz472tdoEZ5JLaSgSLThFLlecFT3CtwSxAZ+LpuOkROnQTM3lB9SoDPOHDD+wtWLoFGBC1rH4aMYkE6VUVm4XMYkrdhBnirffrR2zZefq97HwaG8X55ISOAS+4xh1U2doI7k19kcXwlvhiskTWH/vqAK/vdQlNYXFkyi1ldJs54ggCRHQvrBsIVIpp4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Mon, 3 Aug
 2026 08:01:09 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 08:01:04 +0000
Message-ID: <e58bf20d-6583-44ad-83b1-69950b766c45@intel.com>
Date: Mon, 3 Aug 2026 13:30:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/23] drm/xe/log: Introduce structured
 component/location identifiers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS0PR11MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d51569-83b4-4a58-6151-08def1355d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: /K4jAA/j4zDhVCv5HGb0fCPCpg4i7SsTlo5gcyc9CQc3G5DIDPOy6DE1OXbnFtwe3sp2g3KlmwHG0By3+kl3rJzFHnj3SUbwugpWKbO/Bo3hDiXaF82x44Mu3qTYKpB5ge25KxkYt1Yqcovr9TkOH57E2QY+tQ1loZ4jqwpnoPaC+CnCTUtOBFk1EXKmQRhJkUzkqmSkETdIdNy2dBQmqKhvl+qj4njkNnq08a45Wsv9nNZGbRJMzBVMvkEmkswS99wyNHvNYw+FC23iOScnPzFpsOQuvAGhXrESFkFtq4vQH6g9oDNAoTtDj8CdgK7eOJ7RlDD191ZpEhI2CiPApRxtNtls2EkO8Gaocz/ubVBiYWyCizR+koXkfMLOimUfwmi6uMrDtc5CUeCbo7XCBL4CdqQTYZM6CaQqd0+SqCIv70oqkYtlx2isjMbsG73POAj3YE1XvTXlLBiz6avlhxjk4d1ECe+COOFQqf5CJiJOGdNEFWaZcjym2upsNfybXK/Mipbr5qxVvoJhXewYswufutObwEqEkr/eqJkbtr2Nej5QIrzRxwk86hIZp8OsY8dpYC31Qdg2XgVwPaeGaQgRbiEx4Fh5ZCVHVDZDi+YYEX7NQDQZfC+XjjMEkDwwM+GjRqbQB+SDD4qL6fZJEE2+x4ciz0YOwlNSJx4craw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGhpT3VyRjEvY0ZxRHJ4NHFoOWZrSjR4bjc1dE5oK1FJVStOWXE0cyt0LzF5?=
 =?utf-8?B?N0t4azdjM1BwQ1dRZnpha3BZWXV1ZXphekRPcTluMDJwSUF1WUpueEZ5K2V3?=
 =?utf-8?B?dmMyY2xNWDZJOEZiMS9EaGlrcy9aMzRiOE5rV1FJMVNLMkt5bWtIc0JJNDQ0?=
 =?utf-8?B?UURPNmJGa2N5SmRxRnRST2l3dUVCR3VzbnE4cG1mUVJINnd2NW9tWG4zSjJj?=
 =?utf-8?B?OGZpUExrZDNxTjNKdVZ0aUdaSEVtamlkREpMZWZaT2wvcFdQZHRvQnlMRklW?=
 =?utf-8?B?aUZpSHBhM29CajIvMlduc1J0a0dKS1Z1bll2bllVeUVPVWcwSUcrSExXZGVQ?=
 =?utf-8?B?NEoyUjZqM2plRm5zMHhyK0JSM3FhakwydFVvVG1hOGtPK2hMSVhMU3VuRktl?=
 =?utf-8?B?dkNadDJxbEt6NkR1K2NrWDdvZ1c1V0g3SVR4d2RSbE1WSTdpV3JZSVNaditR?=
 =?utf-8?B?cjBwbWtVd09ObzV5YmF0WXpORmlxVlhCektia1ZpenVlWks4YXRsWlNDOGFL?=
 =?utf-8?B?ZFVMSE1QMzNpTXA5b1c4ZU4wZTQyeVJHMDZid0pmVGh6MUpzdTdWY1l6Z3J3?=
 =?utf-8?B?SldENG1PcnNvSllYeWpzV0pWOVhPYzNqanQwMDN1RVgvcUpDM2lxemVMYnJ5?=
 =?utf-8?B?bmJDaWR6bmp6bDAxUUViOHBtRStkS3JBYWpwbEdMRTVDK0lLSDlVc2pUUUQy?=
 =?utf-8?B?TTExcC8zMG1zaUpBZmpEcWFXRlAvQWN2TmJSeUVVNUh2ekFYMnAvc1RIRWpy?=
 =?utf-8?B?alV4QTRudEZmZzlLMEtYMTFGV011N0RTeEtpejI2YkV2blFEQlNWVkRjZHhW?=
 =?utf-8?B?dWU5QjNSam1ER3NBUUpGRWpxb3BSRGFXem5DdXFtM2dkSS9ZRFZuODVrb3py?=
 =?utf-8?B?K2FyV3Zyd0l5TjcvT24zRDRqdG1UU3FQVVZUaVhoTGpyZ2RQMmJ0Y1FvYXo4?=
 =?utf-8?B?MDFKbURJMEZYb3ZGUHlmRlcyR2dDUmx3MDM2ak1CbGx1cnkvazI1Vjc1MWk1?=
 =?utf-8?B?QkEvOGFKZHVGSUNpeW1oYk56ejNqQitKeTgrT3Z5b0w0L2hKM0cwcUxXN1Jq?=
 =?utf-8?B?cUdQM1dzeEpRVkxxTU11Y3gvQjFqL3UzSEVvNHZQRktJKy9ZRHRvMDBTSWZk?=
 =?utf-8?B?ZDVTajJ0aHJ5RklNdVB3L2R4RzU4L0ZIVW5vWjN5NlFZRkRCMjVUUTNsRm5E?=
 =?utf-8?B?RUE1VXVmU0RGMkl5dDMxSEtCVDQzTS9lT1Y3aFEwNUZJQ0FvSHhDTW5QU3Yw?=
 =?utf-8?B?cENGVjlQOG42UEQrNFMzSW10SGJmRVd1NU5Oc0hOelJ2Qk9ScVhYMXNQQkk2?=
 =?utf-8?B?U0twclZWcjhXcVAxWkhudzhWb21SRk9CZmdEWk5RZ0ptLzNNeFZ5ajJaVkM0?=
 =?utf-8?B?dUpOSEpKTDdHaEw0bnZQZ0xoZ2JDZStweVJ1dnBBOXUzVFkrL1ltcmthMXhr?=
 =?utf-8?B?OU1ZVllBakNPb1Nvb0ZBaCtJZE1zdnVoSU5BQlBKdXFWN0RDajR3SFBGZkFa?=
 =?utf-8?B?aWMvWFYwQnh5M3BESTFaYmQwRlRHMXZNbmRnUWVmNU1SMGZPemx1RXU4U3l5?=
 =?utf-8?B?bE1CTkZxMnpnQ2ZpWEFJczk2bHZIamJwY1VsS2R5QVFGTzRPNDc0SnplM29T?=
 =?utf-8?B?YmZOcmp6N3dPdjhvT1Fsd2VPTnZ5WHU4QlkxVm55eW9DcEhXenpVbHNHcThy?=
 =?utf-8?B?OWpvWmhZSWJ5bWt3d1JLUHM2UjRRcUdncmRXUGJkZnc0TUlpd09Pc1RZOUpp?=
 =?utf-8?B?bUZBZDE2SGxRaE0ydU0vbVFGMTZXNVFnZ1d6V0duQW9ObG1qWnFpMnFaMnhx?=
 =?utf-8?B?TnhJL0dEc0dueDdtY3kxd1hSN1BnUDR2S21xN3pscW9nQ0pHUmphY0RYR0c1?=
 =?utf-8?B?cnZURXozbElNNWMxWGJtMm5Pa3ZQbzZ0S0hnVldoM0xRWVQwcUlZdC9UY0lM?=
 =?utf-8?B?NUtXTy9BeUtzUThoK2lYdmtzS0tjdkR6WmpRRkErZnNuOXFWN2k4b2dGRmg5?=
 =?utf-8?B?cmk3WHA1NnZUOGx3UHJlK3Z1OFFrbzFqaWlqZEhScnlrYVc2TnFwbHNSMDNM?=
 =?utf-8?B?cGhYMmh4R1dlaUtLM25JL3lNTDNJRjZKYStMTjhRVGl0SThHNVBQd3BUNng0?=
 =?utf-8?B?NzBIY09kN2l5NVRaQktOajZZb0pOMmVDNTJVVm9tdlB2bHBXQnRoSW91YktU?=
 =?utf-8?B?Y1hBcUdjQThyTitBTWhOMXZSSGdFd1NaeTNUUE8reWpjTENwRi9mSkxjdU5i?=
 =?utf-8?B?aldlUDFjcVdsWHFjWHp2ejZaWDlpU0ZNSzNPRjZnYTBmYytPQUVjNUZxdGpF?=
 =?utf-8?B?NUh0ZlhCMGIrdWlOT2FMSGU3bTlBOHZuR3JTMVNqSjlub0ZJeEp2aHFUTkRx?=
 =?utf-8?Q?b4FIqURAQSDzESgY=3D?=
X-Exchange-RoutingPolicyChecked: p66RbhNAmhix2fMR9uS2wUw97lyVWmVkkYNN/VL1zN1+3JZbE9+iabyWLzLynKxOxNaw64WcIgU4CdyVWRMl8X+wuJXV/Mgd/ll7+KjGA5k0/aBD4xxr3SA5zlRI3GwKbmr3K94dmB39tuoE9hWAh4UkHsgjcCdODiiwo6Qf/J0BeiohvZeXauafHvd+rWXQn0azunW0RZ8v3XpVlbzOIW5VvhcGggA06gl5SO+FwulHR/mpDqAtOgqCENqU9aF+KrpuL7RGi1PJ/OhbSkpv77HGseOyl8jc3btBIoIkazJQBrruwPIlNma3yUT828Xic5pPiHG9X/XVlm9Se8ot7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d51569-83b4-4a58-6151-08def1355d72
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:01:04.0764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPqtE+Igx/D7m1NS/7IxTfqtJ3nbVWibIoEQ2q3JBl8a2NVCvDmGXToExfJaJN9jU4UBWSfM0/thmgdwR9S2ug/cR8NFzglFzM5FbbEoqnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
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


On 30-07-2026 08:50 pm, Michal Wajdeczko wrote:
> Introduce structured identifiers for each component type that
> could emit a SIGID log entry and for their locations. We plan
> to store those IDs in the CPER records for better filtering.
> Define also structured identifiers for the supported locations.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: fix typo, define reserved ids (Michal)
> v3: fix kernel-doc to match code (Sashiko)
> ---
>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 186 ++++++++++++++++++++++++++++
>   1 file changed, 186 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> new file mode 100644
> index 000000000000..4861a5b58c10
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -0,0 +1,186 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_LOG_ABI_H_
> +#define _ABI_XE_LOG_ABI_H_
> +
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +/**
> + * enum xe_log_component_bits - bits for components structure definitions
> + *
> + * Component identifiers are structured based on::
> + *
> + *     COMPONENT = CLASS(8b).TYPE(8b)
> + *

Are 8b sufficient for CLASS and TYPE?  In future we need to increase that.

> + * and the structure looks like this::
> + *
> + *     ├── SYSTEM(0)
> + *     │   └── ...
> + *     ├── DRIVER(1)
> + *     │   └── ...
> + *     ├── FEATURE(2)
> + *     │   └── ...
> + *     ├── FIRMWARE(4)
> + *     │   └── ...
> + *     └── HARDWARE(8)
> + *         └── ...
> + *
> + * Examples::
> + *
> + *     COMPONENT(0.type) = SYSTEM.type = system component
> + *     COMPONENT(1.type) = DRIVER.type = driver core component
> + *     COMPONENT(3.type) = DRIVER_FEATURE.type = driver feature
> + *     COMPONENT(5.type) = DRIVER_FIRMWARE.type = firmware driver component
> + *     COMPONENT(9.type) = DRIVER_HARDWARE.type = hardware driver component
> + *
> + */
> +enum xe_log_component_bits {
> +	/* private: */
> +	XE_LOG_COMPONENT_CLASS_MASK = GENMASK_U16(7, 0),
> +	XE_LOG_COMPONENT_TYPE_MASK = GENMASK_U16(15, 8),
> +	/* private: component classes */
> +	XE_LOG_COMPONENT_CLASS_SYSTEM = 0u,
> +	XE_LOG_COMPONENT_CLASS_DRIVER = 1u,
> +	XE_LOG_COMPONENT_CLASS_FEATURE = 2u,
> +	XE_LOG_COMPONENT_CLASS_FIRMWARE = 4u,
> +	XE_LOG_COMPONENT_CLASS_HARDWARE = 8u,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_FEATURE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						XE_LOG_COMPONENT_CLASS_FEATURE,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_FIRMWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						 XE_LOG_COMPONENT_CLASS_FIRMWARE,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_HARDWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						 XE_LOG_COMPONENT_CLASS_HARDWARE,
> +	/* private: reserved identifiers */
> +	XE_LOG_COMPONENT_NONE = 0u,
> +};
> +
> +#define MAKE_XE_LOG_COMPONENT(_CLASS, type) \
> +	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, \
> +			  XE_LOG_COMPONENT_CLASS_##_CLASS) | \
> +	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
> +
> +/**
> + * enum xe_log_location_bits - bits for location structure definitions
> + *
> + * Location identifiers are structured based on::
> + *
> + *     LOCATION = TYPE(8b).ID(8b)
> + *

Are 8b sufficient for Type and ID?

Everything else looks good.

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> + * and the structure looks like this::
> + *
> + *     ├── DEVICE(0)
> + *     │   └── MBZ(0)
> + *     ├── TILE(1)
> + *     │   ├── Tile0(0)
> + *     │   ├── ...
> + *     │   └── TileN(n)
> + *     ├── GT(1)
> + *     │   ├── GT0(0)
> + *     │   ├── ...
> + *     │   └── GTn(n)
> + *     └── ...
> + *
> + * Examples::
> + *
> + *     LOCATION(0.0) = NONE
> + *     LOCATION(1.0) = DEVICE.0 = "Device"
> + *     LOCATION(2.1) = TILE.1 = "Tile1"
> + *     LOCATION(3.2) = GT.2 = "GT2"
> + *
> + */
> +enum xe_log_location_bits {
> +	/* private: */
> +	XE_LOG_LOCATION_TYPE_MASK = GENMASK_U16(7, 0),
> +	XE_LOG_LOCATION_ID_MASK = GENMASK_U16(15, 8),
> +	/* private: location types */
> +	XE_LOG_LOCATION_TYPE_DEVICE = 1u,
> +	XE_LOG_LOCATION_TYPE_TILE = 2u,
> +	XE_LOG_LOCATION_TYPE_GT = 3u,
> +	/* private: reserved identifiers */
> +	XE_LOG_LOCATION_NONE = 0u,
> +};
> +
> +#define PREP_XE_LOG_LOCATION(type, id) \
> +	(FIELD_PREP(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
> +	 FIELD_PREP(XE_LOG_LOCATION_ID_MASK, (id)))
> +
> +#define MAKE_XE_LOG_LOCATION(_TYPE, id) \
> +	PREP_XE_LOG_LOCATION(XE_LOG_LOCATION_TYPE_##_TYPE, (id))
> +
> +/**
> + * DEFINE_XE_LOG_COMPONENTS() - Define log components.
> + * @define: name of the inner macro to expand.
> + *
> + * Use this super macro to define custom code for the log components.
> + * The following parameters are available for each component::
> + *
> + *     define(CLASS, ID, TAG, SIGID, NAME)
> + *
> + * where:
> + *
> + *     @ID is the unique component identifier within CLASS.SUBCLASS.CATEGORY
> + *     @TAG is unique component tag (across all components)
> + *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
> + */
> +#define DEFINE_XE_LOG_COMPONENTS(define) \
> +	/* */									\
> +	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
> +	define(SYSTEM, 2, DRM, SW, "DRM")					\
> +	/* */									\
> +	define(DRIVER, 1, XE, SW, "Xe Driver")					\
> +	define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")		\
> +	define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")			\
> +	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
> +	define(DRIVER, 5, WA, SW, "Workarounds")				\
> +	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
> +	/* */									\
> +	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
> +	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
> +	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
> +	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
> +	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
> +	/* */									\
> +	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
> +	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
> +	define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
> +	define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
> +	/* */									\
> +	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
> +	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
> +	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
> +	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
> +	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
> +	/* eod */
> +
> +/**
> + * enum xe_log_component_tags - TAGs of all supported components
> + */
> +enum xe_log_component_tags {
> +	/* private: */
> +#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
> +	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
> +	/* eod */
> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_ENUM)
> +#undef MAKE_XE_LOG_COMPONENT_ENUM
> +};
> +
> +/**
> + * enum xe_log_component_sigids - SIGIDs of all supported components
> + */
> +enum xe_log_component_sigids {
> +	/* private: */
> +#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
> +	/* eod */
> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_SIGID)
> +#undef MAKE_XE_LOG_COMPONENT_SIGID
> +};
> +
> +#endif
