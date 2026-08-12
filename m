Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FCCC5B567
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 06:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9744810E334;
	Wed, 12 Aug 2026 06:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jtyazd97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C5C10E334
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786516310; x=1818052310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=veaR9xFXeMimLoq9DZ4WKDelZD+GmowqF41wxtlezqU=;
 b=Jtyazd97ueWjTlBhjX1maSBnn1SYWXhordQ5AdYlSUZ5WtpcpFKOb9fD
 IzdvkgQ+/brMxQvYQDY+n1Qc28luRBQ5NCNJ1ppJkUAbjYhiGuhl1Gf+S
 VQYmAI99YpXeZLBT0uffXxF/N7ENvl/EQg3asUGxEcQHDwpyR5s+TPuZj
 IZPsa2v1N5UCr8+qEscNz6w8FWqFGmiq1jfNDAanM7CmAr2uDi1Eqf1K6
 sbAZO3QD2FieweMLwGw6xNH1p/G4RPabbVLFTM/K52E4h1zjvL+Ym7ELu
 sNdjo0vDc94Yn9FmWKg2HesUIUzjodZJyh+E1LhNrA4mg41hGK0JdOumI Q==;
X-CSE-ConnectionGUID: 9k0EGljwTOy1FYB5A9796A==
X-CSE-MsgGUID: rYPNi5j0RlmZVzK9jaooow==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86016749"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86016749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 23:31:49 -0700
X-CSE-ConnectionGUID: SZ+LrTgqQbKSSUk1t8UDcA==
X-CSE-MsgGUID: KDKZuDYARZCiJccv4VeZ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="301794128"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 23:31:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:31:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 23:31:48 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:31:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iqh1SmDpDC+u65I+rkVXtyRVsn8QRe0Gq6IUa0XwVKoDDfg768XL2HYtBCJLyUuN9SVgEzgFtIahrjxycbL/AwW/unAQIvHEchuQ78tv3RmWOHQE9D68qu9lgy9lVychL+wKppza6/QT4nqxx6W+bo3v0S/v/N8eX0okLGMcz9/Xa8tANM7kkvqqcglXKCfjgI7bg5CCuNI6BbCHtSuaOqz8ZIizdr31qikD45Ma9rgRf7v0vKZKE9aw/45DiVnCCA9F48JzGem6r+/+h9RiGeEztRuaDHzSNBOufKTAl+MJGnkZ81VW4TX+99+YvVIjb4OdKSlzGp96tgg1Kd9ibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqMSpwvJTx22mUjfyrndrnsBXxpuzvcQUMGcdRXGBtk=;
 b=ZCD9VHnKmMfqc0U5vxv9kCzvWPV3TQh6U6uQPMXTFzaJBhQPalv4INgEo9IfeAuIOEQY5bY2a8WyKp+GfVPk+cdw/OztCxmWAT3wRpdYoyUcrum4xAIoil8WuJpkRD9Lf9lP541gT49WXxm3Isz0Q/jgXtD/6daLkrvW1W0iAu8vZ769NK7qWKaP8BgOHyqHv0ZP9KRjSaQbFP5fd5/uWkNmDXNgRRRUX0+JU6BZxww6I8uym2PnKs+UiVYIV1N1IoOn9Kmds7RPxnvNAXDQcEIq/sh1z11eCE6o6Y21XSJKdNUVWE54+T2GGngnIHaN0x+JXYXhjzzaifoaCXa5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 06:31:40 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 06:31:40 +0000
Message-ID: <ad391b27-93ea-430b-b50c-3aefad8151b6@intel.com>
Date: Wed, 12 Aug 2026 12:01:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/23] drm/xe/gt: Report 'reset failed' errors using
 SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-22-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-22-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW5PR11MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: d446c7d6-68f0-47b5-a5c4-08def83b5e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rkKtz3o8LMocIl+1Z+LvEx2fxs32lZzvvHWUNNM6QW4VZoFgv8k4xtUvHFkdumnzfR+xWRXCWINPfZuxAhTv08SZCj0AY1vcdKZgbiMjDTIqB5PjA1yZvc/94y/5eaLV8eLWu10Cq2UtoQJzK57k0NSzQZTpke/GyQA9KiU+mTfaWJUsGuXHSX7D6fjL74vBjY2jnkzT3pAlxUPGS+q/pDkdze3hIWZfghInJkEkbZ4yuLoe+wwQlUBsQP13HH6hEPRso5NYjz4ajRFL0zlN7/D8bWEDyHXDgyNk5uMNrrVRVhmZ43zMwYb2QZhv5LLK/AEH8k1a5CtiYqhqkMjaqhFU4quevwVUwKwxJk/5FpDGcsU7sJVmuZGJsFwz+lPFOV1qH/t7PEQgmV/3/ZNPJByl+IEGexkzkFz1oycPH+2XJ5BzF3lfrqZox8NMpIFCpAZbnPSGiexSm9JEdmVNdYn3N3H09IPOSfZslTwST4yYM11ftWQyVpAv3COYoduwYWwhmnyRJ0nR5VRpsAiJsUanE7wlBl6BLfswv5Hj+Qlxztbjmpod0NiWXmsTsWK/tQbkzL6X1qFnUHlB9iPkwcMdwXjPVUdfIhwO7Y18twFqDZS0zy5p+H/wTO7UjNRnm6x9Hh1idZXGssKpg0VDefg/cz87F13QwpEbY7Gv2yQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXZQWVRmUTdkbFlLNWFoL1kxNEg5YXU4MC9YdCtUaXNIMHlLUmhrbGJvZmVU?=
 =?utf-8?B?ZkpRQlhhWmxUQVhsSTBBNkFmR1E2eTZmNTFhK2toS2plKzg5dXNoeWIxeFB0?=
 =?utf-8?B?b0NsUUJLTERSbjlFb09WU2UxMFN1aUlsUmljclBpdW0ra1pZdFlaWlZ3Tis3?=
 =?utf-8?B?Q3pOdFFQc21wTm13STBIM0h1Mjcwc3ozV2FZSDhrcjFSWWJneXBnNGMwM255?=
 =?utf-8?B?U0UvZWJuVSt2SG5VeGNVRUI4T2E2bFliWHN2dkpaajJtbitjQ0lkS1RPeDVT?=
 =?utf-8?B?a2FHanorOTVHaTlHRjJINnhBcG9XeUQwcU9ZK0Eza1pLc1ZXLzQ3aXpHZjhy?=
 =?utf-8?B?ZWFDN25NL2J3eXdRT0J4WDJYSTB2SFYxQ0g0N1Nxd01MK25vOFVqU3cza0ps?=
 =?utf-8?B?UXBtQ1h0SHViTlQzN2t6eGlnaUhRbGdmU1pKcnpzbnRiejNvaWoyZTJvZHlz?=
 =?utf-8?B?Q1FsMTdaLzRDbEFnUmQzbUdUZTlWU1o5alB1WlNsbXhEd053UmdTNUtNZmtJ?=
 =?utf-8?B?SWxMOUJHanpKeE1FVnpaNFMyWElGRVg2bFlEVHZyQWw2bmxhSjhNV0VUWHZE?=
 =?utf-8?B?OGVmcjY0OHRTRitXS0JWNFFBYXVNWWZlTXVsMDdudTh5MGZSaGk2L0c3dmND?=
 =?utf-8?B?aFFGVzlvbm15THFHUmU2RloxeW5CNlliTGoraFh3Um5MOFZRZkxJZGYzWmdO?=
 =?utf-8?B?cWpCSDE5cVpRVnRGS3F0OHJqeE01d0ZCZnVqTGxUSlNZVmhmM1Z0NkhOV2sz?=
 =?utf-8?B?enF4VkFuRTJXUm1XOUpWRHc4d0ZzaTJyTmFmdWxhWWl3YW5wbjdLWSt4RHRy?=
 =?utf-8?B?OWpkVzJSQkpUMjFBTlQ5eEcxRTdFUHhEdHpjTDRNbUpVUkdTbEdtUWcveEJ3?=
 =?utf-8?B?N3JmUUdTejhLQkNLNTNWN1BEMFpuMUpLcXNpMEZZQjc0L3R1aFRLSmtMWGJy?=
 =?utf-8?B?Y1JPUWc2RzBZMkJBRlJzcS9MTENQYmYrRkdEcFRIRmVNS2hpSGJPMGMwaHhn?=
 =?utf-8?B?ZVhZUFVmOEd1RXRQV01qci8wUEFkMjZlMGtPL1pKeW1QbHRrcStuWmFFbEp0?=
 =?utf-8?B?Y1FJbVUvVHA3dnZMU0tOWG8zYnhPakdDVm9aQ2hEN0dCVHN4U0lSZVV6WWFU?=
 =?utf-8?B?V1Y1bmFJVmZRSnhUazFXWGYrWnZlWmk4NEZHSnZOTUhpRHhlVkpwb1E5UjdB?=
 =?utf-8?B?MUZlNXJGUU02cXRDSXkyZTJMZFUyWG1vUWZhaDNuZFlzbnk4QU8zNThRRGZR?=
 =?utf-8?B?ZkxvTGxkYy9RSVUwcGNSZDVvNUFCTDhDVDExWlAwVTNVeEVJWHltTWt4TmJ6?=
 =?utf-8?B?K1JJbUdPRlRpcm54bHRKWUUyNksyRkJBZXU0YXJDNjM4THJ1UTg4L1RWa3R2?=
 =?utf-8?B?K1liR2UvT3JwNXhKaGxGMHl0anVGNDZRbEFsYVl0SXFqN3JFblhvUEsvZ3NQ?=
 =?utf-8?B?ZkU5ckJoZC9vTEZOcHk3OStMYlJqRFJFRlhFVlNwaEZIbzVSSW5oaXRzankw?=
 =?utf-8?B?bC9jZnNWYkNQV0hQb24rZU1RY21HeTVyZFF1eEJnWnorc1M2b0NwRmlaQlpU?=
 =?utf-8?B?aS9jUzdmSUYvR0tEQXA4a1E0clN0OUFTSnlmdFYxby9iUmVUTFIyNWJUZE5k?=
 =?utf-8?B?VGYxaVdCTkM1VHBHbC9oVURpUGZudldDUlpVQ2E0NlBzU1o4VmllR1V0eFJO?=
 =?utf-8?B?RDM2U0lvaXN2K2EyNERhQTZaTGF5cm9SdkZGU2JJRHhnOG9sTloxajhFTkRP?=
 =?utf-8?B?V0FmQ0hUUDFZc0phaElTNWl0cGZyakxjOGVDNGs3QnN1Z3hJMWlTTmlNbmhJ?=
 =?utf-8?B?a0JGK0t4eXlNZllHYzQxa3RBbWV6ZUNTM2FPOWxYKzVNNXBBVUFFSlh4TGdF?=
 =?utf-8?B?UkNlSmc5T0k0eFF3RkdocllRZytwVFErUVdsUzhXQXpHSzhHajg3ZWMwQ0Ur?=
 =?utf-8?B?Rnl1N3RQUFpkM3R5WnJEK0s1MHBlZldSQm1nUW1SSitFWnJwZ3kwazE3UElW?=
 =?utf-8?B?dm1KUFJMTzhCOWxwNHFLWnJSQjFkNVE4SWtnckdOMy9MdlRvU0dwU1Z6dXlk?=
 =?utf-8?B?ZFRsNXpLUGkzaUxIa0ZkYmg4MVA4dkVXbEpKM0p0T2x4WHMwbDZvZEtwQlhB?=
 =?utf-8?B?Sk03QW9scTBMci9jZXJXR2dFRnB6RThjTTFsNlpGckl6R1R0SUd2QnRadmJj?=
 =?utf-8?B?TWErRTFUdUtVbVlGOXNSQkp4VzJnVlhEQTFUdTdWdmtxTkxBRXlhM2JPU2hz?=
 =?utf-8?B?RjZkVk4wRG9hRXJLcUk5b3JDaUprNGsvTE5DZldYZEV6MHA3VEJoR0pxUjJj?=
 =?utf-8?B?TWk5cDZQcFY2c3ZJLzZTemJPUXNUcC9jeTdOSXd4RjUwRDVWeFVKU3h6L1Jr?=
 =?utf-8?Q?j/3jZ0eL0LZFBB0E=3D?=
X-Exchange-RoutingPolicyChecked: mlVvd5F9fs6Mrm+T/+lE2RKWTvQCg199jMXRbbwIoGZB5p0MG95Jx4y3tzkmJ3rerXPh88EJ0wUIZbU2wlwrt2OOLt7TBYcN9SVy6r57orXfMeqrxVGNnFx/CYRQ1X7yrkcHmMXN3SiunHi3AedwpdZQWDEKVqQRpv4xCbYoIW2xnp7uWcC9cCYLrxOLDaaPzjQCHjK/aDZU6wlWzCy2g6+PDdb+T2v1YxuvUy5bBGdQOAHzA5+qTfxfffKYZtdKTqLnjoRJ1hTHpnrvw0lLMN5TwzrhzZrNE/CSp8cSVhb37cTR44HwtdxRDizOsivMUVMfuuTT19gy9143B5RP8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d446c7d6-68f0-47b5-a5c4-08def83b5e66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 06:31:40.6609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWdlhlfb5zOqXxBdMXE0EP+6we2EO2vgIj2eHEIwibTYqaPdad2iJIq4/UyiPE2AbyPOUq7tj5QQ0SS2HZP/GA0guYxTtMGel2qXnYMiQk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Report 'reset' related err/info messages using xe_log() helpers.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index dfdacc0f6de9..6805e0d3bf21 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -48,6 +48,7 @@
>   #include "xe_hw_engine_class_sysfs.h"
>   #include "xe_irq.h"
>   #include "xe_lmtt.h"
> +#include "xe_log.h"
>   #include "xe_lrc.h"
>   #include "xe_map.h"
>   #include "xe_migrate.h"
> @@ -925,7 +926,7 @@ static void gt_reset_worker(struct work_struct *w)
>   	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>   		goto err_pm_put;
>   
> -	xe_gt_info(gt, "reset started\n");
> +	xe_log_info(gt, GT, "reset started\n");
>   
>   	if (xe_fault_gt_reset()) {
>   		err = -ECANCELED;
> @@ -964,7 +965,7 @@ static void gt_reset_worker(struct work_struct *w)
>   	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
>   	xe_pm_runtime_put(gt_to_xe(gt));
>   
> -	xe_gt_info(gt, "reset done\n");
> +	xe_log_info(gt, GT, "reset done\n");
>   
>   	return;
>   
> @@ -973,7 +974,7 @@ static void gt_reset_worker(struct work_struct *w)
>   	XE_WARN_ON(xe_uc_start(&gt->uc));
>   
>   err_fail:
> -	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> +	xe_log_err_fatal(gt, GT, err, "reset failed\n");
>   	xe_device_declare_wedged(gt_to_xe(gt));
>   err_pm_put:
>   	xe_pm_runtime_put(gt_to_xe(gt));
