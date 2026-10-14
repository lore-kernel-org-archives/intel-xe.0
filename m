Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333A4CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 13:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F7E10E110;
	Wed, 14 Oct 2026 13:14:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6175610E110;
 Wed, 14 Oct 2026 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791983677; x=1823519677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4XPxBEl4M1nOX9IJVYNx4D8uqXa4AbPUOUBm7MTMqi8=;
 b=ejBm5rouyMkUmPXVmD9RWqjp5vNupOhVyVVoTh2u7/GSYB4uwzNYmY01
 m9lrieL020AdQxbUzy3l4kx6/9B8cwHfC3DaU0QNHOZQnsmJXT6hCc1ez
 eR/ZeigYMhj69glgZFwBp7mCRcgIX6M+8IIlraRmJNUu+aEK0wzjcmxpg
 fhoXSY4bMqjxkxtWYELozqlPr3j+fnyh4CfuvtsTuvQ5zijpekVC9hRr1
 3EQ7lg7aDeVedYvCaAGr6+cihPI7BVn2xnOIT7iUhpI5hCT7bveQnfMdX
 SouC0p+GC3j6CRFIn5BDmeJ/YIRHTGFsvjOAu5kSWRFF3uIHx7OjQHjNT g==;
X-CSE-ConnectionGUID: WE/xOLCpRse63l/a3bcYYA==
X-CSE-MsgGUID: rSI61L2dSn2+fPVChotHFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="738197"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="738197"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:14:33 -0700
X-CSE-ConnectionGUID: 3IV4Sh9QTRqOKgKKHFfPYg==
X-CSE-MsgGUID: PoI/9LywQdioEZwgs/kX/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1755749"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:14:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 06:14:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 06:14:31 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 06:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFsKLk1ea5PEvD+beR8ZH3RADSE/MI3McNHTCkSKm1Lczy5T4t/DRLogo4hZONAZLUgv5EmppImF7zxBZZV0s0+by9/skID8z0xFMt64j+30c/XgJF1X7t+XGyqNynrezPnM9xMVdUEsK6r5SVvq7hMaMFHCOU2aLwGbte+LePa7hklA+vVbcuMpidgez5GnJ50VX3pW67j7b6lGG4F8MgyE1ZQCpOz0hPVJTY6mE1qfEg2bDfHr+1W8OZeNht+DEiTC0FAfkCq6oj4LBrgLymcEuycXIEuMbMBEANO1rT2vJuEK6RTS4hju4FZUp3LfBB0N9Ia2TogI2QeXWKGdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVv4QmgJGT9m8FUjjM5WbVSIyt5XlEYoMErTjTnklww=;
 b=EpyRxkWD3PPenJ3zhsLPchC0emrS2rFDdwQZP44ZMlJFliEoR8y/muXyi0yK0BrIwXdB5BM04FfllO/53MkgSoPo50Q4XXNMQYQyj+3zutQ6n0aECcK651krXDFwhGNcL4felLjZQOCovsMI96rXlNaREwzU5GxuH9jrUiQPEb2/nqv6C1SsuD5HWmRBRr9BFKxGOU1K0CwZ4QlZ+jIOosEbEV805dmYlffM96gtgGLJtVIJTOar5JDdv7ns3nvyD9LRI4ODNspti/4AM8fOI4klX1g922pb80HcbMiDJFJ4Acw3KoCwVdI8Aojo5wLRDR0nsgfAQnAAh2Jv3OwwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA1PR11MB8221.namprd11.prod.outlook.com
 (2603:10b6:208:451::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:14:29 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 13:14:29 +0000
Message-ID: <1d9c4669-2523-4bf6-b662-b28a6a0a5716@intel.com>
Date: Wed, 14 Oct 2026 18:44:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] drm/i915/gmbus: Add bit-banging debugfs control
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: <jani.nikula@intel.com>
References: <20261014075956.2104356-1-ramanaidu.naladala@intel.com>
 <20261014075956.2104356-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261014075956.2104356-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0305.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::10) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA1PR11MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b5cc7b-508c-4825-b523-08df29f51400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 6U/0KJ9dQETxhJAjZS64L1dCDcR78o0bAzTm6U91dN4u+GTrYf40B+uB+z/aKsj082mBVV1931bXqJjEQ2gfhZCA3oep0qdaSeZkNetjG8FdqMPB0hNlUkrgpcuXSSKmXilrJfz+lO20V6usc4F09kMaECIkdAf+hRyUQo4g4AAqx7GTYHit8Zf1AewtYMc+rAV87JtEQjf+BZH8FArD0hvo+0fLgCP1aGbbqq43ESSLQCn7ml+J+VgiR42RExvhCuc0gaH9F2EfKAofvfcMpuEUeabal/FcraNtTTR3YIw6U7vDwtnWPPHLO+e4mFsEeROt275aN8dDQTbglPcVvlqqGsCFsBpKnL7taLcNX1qQXtZKsDrKARMo9yxTMfCyuZq8IISUTa5ifE/LX6Ez+jVnto8dEX5WjHf+q/tLPc/bzuhEwsV6bdnTjQe8DDCxmTT7SARxEB52drBjtJj9dHHzV75nRkR1MNJGA92+jDhnELEXN3pqYHqYorOxvAki2ejoUTrxQfoq/0/ZbzSYn/pu+ZAOvuUsdZSJ75wjB3/ZEIYeKq2aThPG+OjkLL0vwUxxH95WHtXxXjlSz6gmV2wHiTGtFtC47tfmQW0kewdBgzhQokiLOeWpe4psFdopaLvM7sAhO1lJjqhvUwtkeLPJWfeWw/ixkpfhbCz/Zm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2ZyWS9vYUZXMEN4cWxBOHpOTFdzRmQ0a284Tk16aWNHUUdPWldvcFAya2J1?=
 =?utf-8?B?QUk1RjBCT0lxdUYxSEROdUtxblUrYXlPcU0xZnBGQ3o2RWxKTnV0SThEU3lk?=
 =?utf-8?B?UDZibVAwY0lIWVpSNjJaYVFJSGs0OUVFMDNTdkF2UWgvVzIrUTE0NFhCamlO?=
 =?utf-8?B?dVFXT0ZJOVJqVmtEZUdoVmRxU2M4N1Jycy9vdzRPRlFiZ3RiVXRuUFRvOHc2?=
 =?utf-8?B?KzBVZDVYTm5GTVVUUm5iMmdPZDNrNHEyYk1IdGNqUjJVQ29Bdi9pcXVkU08w?=
 =?utf-8?B?N3VGeWJCeW42dkxQUG13ei9hT1N6SjVJNU9vdFhDbFFOL2J4MkF5RnpkVnU3?=
 =?utf-8?B?OGpYR3ZENVNNQ2NDalNIU2YxeWR5TFF6bHlaUWdGUHo4c1pySlhPbVJPV2d3?=
 =?utf-8?B?ZzlobFA2aGZXcDd3S2x2bVE3WlBXSE5UY0gzM1dPbmM0K3NrcVNyMFp5L0sr?=
 =?utf-8?B?ckxRcjI4NkJaYWVnMDBZK1ZPOHpnaGg0aWV2RVh3T3VRVW9KR2hEZEUvK2Y4?=
 =?utf-8?B?d1o3UUgyVk8vNDU5dEtFZEpGcVpPSnVPaWxNOStlS3dZbFZhT0dWZTd6RWNX?=
 =?utf-8?B?S0hlTm9tRmdUTnBlSzlzL1VtMEtmUTdmZ1owMzAybW1nOEx6U0laNW94M2Jm?=
 =?utf-8?B?Sk9zYUhyUHVMdDFpU3BnMTRJa2pFbU9UMlJteEkyZ2lPK25qbDJPNnhJWWVU?=
 =?utf-8?B?ZlNseHBLNS9YdzRkNlZGY0d2bnVkeVBKUEI1WGZlck1zOVhIMWZyVzBLMGUy?=
 =?utf-8?B?VkgvRnFZT3AvcXYzV0Z5d2RBYzZHYnNzdjZBZmtzNFhKMVQrMHV5WUtmVGhQ?=
 =?utf-8?B?ODZGcjJHY0EyL2V3bXpsb2dLZW9lRGs0a2QxZnN6VUZGdE5aZHloTFNvZy8w?=
 =?utf-8?B?cjI0d2tHekxjaE9ML3VGcjhpMnNaaVFpQVJLRDZmZzZ0MDZUeUJPdDlJWGtm?=
 =?utf-8?B?NVovZU1Va2xkMVVwNTBPREo0V2JtZ0crTjgzM0tlVDdLaFA0RkVGL3VOOGlq?=
 =?utf-8?B?M2dDZzlueFNaekFGQkdBUUtVR1BHdi9qYWtxVFZ2bURLRVMwY2xrSDQ0b3By?=
 =?utf-8?B?VThrYnZpbVlJUzZoaFNpOFV3SDI4Rk5yUEVjR1lhaExCd3l3bm9oQUJoSllJ?=
 =?utf-8?B?cEYybUlPK1FybXF2dXEvT0tCbUFuWVA4aFBPM2RLRDIrUTFYSXJVTUFodW42?=
 =?utf-8?B?SGh1RStNbXVjZnNHcjFycjdyZDRIY0dZR09ZWEhBSXdKZlFmWS9BdTRCQ1hw?=
 =?utf-8?B?U1c3R2QyRGVPOHIzN2ZOdE1DY1lhelNsUWhZdXg3RlAwT0JrSm1BTjhDRFFR?=
 =?utf-8?B?K002NmYzWUJYU3FwQkF2b1hqb2pqZzFTelM3K2dNb0dlcHdDV2YxU1VFQnhx?=
 =?utf-8?B?alhROE5wSTNwdlhvbWs1aDNIY0ljSEtzU1c0dXNDcmVyWGpnM3N6MFF2aGpQ?=
 =?utf-8?B?b3NWYlZpa1JtaGdCS050S0ZaMXVmbktCQzE2Ky9YSHdpeGc4eVp5ZHlPSzdW?=
 =?utf-8?B?dkVtbkVuQ1phUE1SNEZwVkFGUjdMR2o1bzVOTEhoY3Y3WUlFa0RScGdKUzlk?=
 =?utf-8?B?ZHFPRTg1U1lXY0NSakk3di96Uzl3b3F5S1IzSjFVdTlzcGw3bllOQmxIRWs2?=
 =?utf-8?B?RVlIdUplakpDNlJWNU5veFFNdGtkYjBCRzY4MWFXaXFIeWVRSFVLYTU2dW1h?=
 =?utf-8?B?dWRXMWhDVTE5SC9Ga3JIRW9Ob2JjUk8xYWd4MGIxZHg5dDQxR2xsc1F4Wkl6?=
 =?utf-8?B?QkIvK0RGOHN5UE5xaDluSTBVNjI1U1dWQ1B6WENuTFJ2M3lXY1BncjE4MjdM?=
 =?utf-8?B?WHZISGthZGJiSjJuMnJwTDY2dzQ5aWNYMEF5ZEttYy9DekR6QnhQcTJpNEFs?=
 =?utf-8?B?U1lOVmh5eEZPUno0V3lSZDFDUFZHbWRPWTR0Nmx4SjFrSFJwNGdDOHYrNGpr?=
 =?utf-8?B?aENmT2F4ZzBjMTB1ZmFFSjF1U2lrUTZIczRuUEJTL1FNczJHMm5ocm53VjFT?=
 =?utf-8?B?TWpIekFocnVuRjNndzdHaDFBSndoWUZPMEtuRHYyNVFYQXZXaUlkd0syRkRo?=
 =?utf-8?B?dDk2SE81aTRLR1ZQK3J5Z1Zwd3N0dVZUcXBMdllnOHFOU3lDd3dFRmJZMDdo?=
 =?utf-8?B?ZFU5VlFaOEpFejc3aUovTGJZWXkwNHRvaWxiWmo0TXNPM3ducmNNS2RMY2t5?=
 =?utf-8?B?aU53NzE2cXY3d3ZsOURvRDBIVVpGZ0hnTTFJNDliRS8zaDFCeW5TamZGMm84?=
 =?utf-8?B?VFBCcnk3aG9iNU9pdDRxWWhxVW0velZqZUpHWW4wb2Mrb09TVmpyVzNjS2lT?=
 =?utf-8?B?S0xXUTFDTnBUSlZIdmhlYk9uQ3BKWEhYcDk4bmJJMFEwWU5mL2VsZGhiQzdD?=
 =?utf-8?Q?07DYBtKmp/sFk9R4=3D?=
X-Exchange-RoutingPolicyChecked: nZvZhHRistwIv4cgZfjU9hW9NVZc1SXuHp34EhG+6FQHl+AHjvQ7WQRal2rkJ/g0zQLjIMdQSOzBjK8/aHSDI+PODizmfWHQbeApfqgrLtq7H5VS9a04uTehWi7FvPlMCM9gAJmbVl2jBBw4xDdZFanLvTMVgywjwkff7QBan9qL1bWq9Uyz9kwMsqDfFfN4AGorWhL99E9/D88zBwLBfvIfeUWSfzR6kGupGSe4p65aC2/4baxtipIxDgYl7uhSF/BP1QqDCg402Ynat4APkXJxdGCp8JFMptjgMWARBGuu0sD66mnGAcRn+R3ceTvdL2I8WZY6SdFwBubkrCubDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b5cc7b-508c-4825-b523-08df29f51400
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:14:29.2437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xV/TK8Xx0ez59+wjxcRnZgj9ootjWzg+PA8pDcZB5PlIjm2i4MY08vD9y0g2AKP2BucPdn3mTMLwpiDpLUii5j9KvLG+LKW5luljTqFh7cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8221
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


On 10/14/2026 1:29 PM, Naladala Ramanaidu wrote:
> Add a connector debugfs interface to enable or disable I2C
> bit-banging for Intel GMBUS adapters.
>
> v1: Address below review comments: (Jani Nikula)
>      - Remove HDMI-specific EDID read path changes.
>      - Control bit-banging directly from debugfs via intel_gmbus_force_bit()
>
> v2: Address below review comments: (Jani Nikula)
>      - Remove superfluous newline.
>      - Move debugfs bit-banging state from struct intel_connector to struct
>        intel_gmbus as debugfs_force_bit.
>      - Make intel_gmbus_is_adapter() static.
>      - Fold NULL adapter check into intel_gmbus_is_adapter().
>      - Remove unused intel_gmbus_is_adapter() declaration from header.
>
> v3: Protect debugfs_force_bit and force_bit updates with
>      gmbus.mutex. (Ankit, sashiko)
>
> v4: Fix checkpatch issues and address review nitpicks. (Ankit)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   .../drm/i915/display/intel_display_debugfs.c  |  2 +
>   drivers/gpu/drm/i915/display/intel_gmbus.c    | 86 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_gmbus.h    |  2 +
>   3 files changed, 90 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 3e302f23f247..b8fd65414990 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -40,6 +40,7 @@
>   #include "intel_fb.h"
>   #include "intel_fbc.h"
>   #include "intel_fbdev.h"
> +#include "intel_gmbus.h"
>   #include "intel_hdcp.h"
>   #include "intel_hdmi.h"
>   #include "intel_hotplug.h"
> @@ -1327,6 +1328,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
>   	if (!root)
>   		return;
>   
> +	intel_gmbus_connector_debugfs_add(connector);
>   	intel_drrs_connector_debugfs_add(connector);
>   	intel_hdcp_connector_debugfs_add(connector);
>   	intel_pps_connector_debugfs_add(connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index b6c63a466233..d43c81d362e6 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -27,6 +27,7 @@
>    *	Chris Wilson <chris@chris-wilson.co.uk>
>    */
>   
> +#include <linux/debugfs.h>
>   #include <linux/export.h>
>   #include <linux/i2c-algo-bit.h>
>   #include <linux/i2c.h>
> @@ -47,6 +48,7 @@ struct intel_gmbus {
>   	struct i2c_adapter adapter;
>   #define GMBUS_FORCE_BIT_RETRY (1U << 31)
>   	u32 force_bit;
> +	bool debugfs_force_bit;
>   	u32 reg0;
>   	intel_reg_t gpio_reg;
>   	struct i2c_algo_bit_data bit_algo;
> @@ -889,6 +891,90 @@ static const struct i2c_algorithm gmbus_algorithm = {
>   	.functionality	= gmbus_func
>   };
>   
> +static bool intel_gmbus_is_adapter(struct intel_connector *connector)
> +{
> +	struct i2c_adapter *adapter = connector->base.ddc;
> +
> +	return adapter && adapter->algo == &gmbus_algorithm;
> +}
> +
> +static int intel_force_bit_banging_show(struct seq_file *m, void *data)
> +{
> +	struct intel_connector *connector = m->private;
> +	struct intel_gmbus *bus = container_of(connector->base.ddc,
> +					       struct intel_gmbus, adapter);
> +	struct intel_display *display = bus->display;
> +	bool force_bit_banging;
> +
> +	mutex_lock(&display->gmbus.mutex);
> +	force_bit_banging = bus->debugfs_force_bit;
> +	mutex_unlock(&display->gmbus.mutex);
> +
> +	seq_printf(m, "%u\n", force_bit_banging);
> +
> +	return 0;
> +}
> +
> +static ssize_t intel_force_bit_banging_write(struct file *file,
> +					     const char __user *ubuf,
> +					     size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct intel_connector *connector = m->private;
> +	struct intel_gmbus *bus = container_of(connector->base.ddc,
> +					       struct intel_gmbus, adapter);
> +	struct intel_display *display = bus->display;
> +	bool force_bit_banging;
> +	bool changed = false;
> +	u32 force_bit = 0;
> +	int ret;
> +
> +	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&display->gmbus.mutex);
> +	if (force_bit_banging != bus->debugfs_force_bit) {
> +		bus->force_bit += force_bit_banging ? 1 : -1;
> +		force_bit = bus->force_bit;
> +		bus->debugfs_force_bit = force_bit_banging;
> +		changed = true;
> +	}
> +	mutex_unlock(&display->gmbus.mutex);
> +
> +	if (changed)
> +		drm_dbg_kms(display->drm,
> +			    "%sabling bit-banging on %s. force bit now %d\n",
> +			    force_bit_banging ? "en" : "dis",
> +			    connector->base.ddc->name, force_bit);
> +
> +	*offp += len;
> +
> +	return len;
> +}
> +
> +static int intel_force_bit_banging_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, intel_force_bit_banging_show, inode->i_private);
> +}
> +
> +static const struct file_operations intel_force_bit_banging_fops = {
> +	.owner = THIS_MODULE,
> +	.open = intel_force_bit_banging_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = intel_force_bit_banging_write,
> +};
> +
> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
> +{
> +	if (intel_gmbus_is_adapter(connector))
> +		debugfs_create_file("intel_force_bit_banging", 0644,
> +				    connector->base.debugfs_entry, connector,
> +				    &intel_force_bit_banging_fops);
> +}
> +
>   static void gmbus_lock_bus(struct i2c_adapter *adapter,
>   			   unsigned int flags)
>   {
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
> index 5fdeab1aa794..5c03100ce46b 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.h
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
> @@ -9,6 +9,7 @@
>   #include <linux/types.h>
>   
>   struct i2c_adapter;
> +struct intel_connector;
>   struct intel_display;
>   
>   #define GMBUS_PIN_DISABLED	0
> @@ -41,6 +42,7 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
>   
>   struct i2c_adapter *
>   intel_gmbus_get_adapter(struct intel_display *display, unsigned int pin);
> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector);
>   void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
>   bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
>   void intel_gmbus_reset(struct intel_display *display);
