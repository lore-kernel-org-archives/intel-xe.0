Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A052C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 06:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140FD10E25C;
	Thu, 31 Aug 2023 06:49:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262D910E170;
 Thu, 31 Aug 2023 06:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693464560; x=1725000560;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=isI2yZH+Bh3NYSG56nBaO7QPirDwAPMSyOhwEy47Ss4=;
 b=HFNXgOnjHJnrkCiq9pc5Q7L7/5Pj/EnFQcrI1XyOkS74EKVk6KWjix+f
 Hi2xBfBUlNN4GmhlPMSKqS4y1aLg83tChIej0iXMYhU2ZJLZHmHNzsc/e
 Yhkdw8vH+IxVGgE0pCUBRTDSLgkl12JY3XVaPAmWou5oXRp8DpdNsuygh
 WL9IQ45WMXsSCHBEcDB2OEYLkzhRTWRwCg1LJhvLSZAwD+9QmnD8aBIxV
 ZtTRsJotD+wgu+GP0NjFyHngp9uYBmuf19sCDw98oqQEoBUhjawOv/iUL
 c0EXE8hPycdpXDBpHxZPUvpwIemzhtSzruT9TLpCgPhIISluTHLrbyYoV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442197554"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="442197554"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 23:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774395823"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="774395823"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 23:48:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 23:48:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 23:48:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 23:48:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 23:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2ySsSIs28vncifXjNP4lYXyU9VSShHdythhtq9JZ7c4rvOfnia/A4HmVISuOdA3SLOO0KeRgLyhFk22nIf3V1fSe2x0jH3YrzFN5PVzX15Qsn7cW6FBz5s/+sXzFbZZSWrO43hL241dWo1dH1nWJF3xMtjNbYFyvo6pL5/t4u6Lh7ljNvBoIfQbOPp89+lo1jkWaO8eY/2rWtSGK4j2MeTn2KY3JPP6voQPEUCYefqDpTPeV4rlBPZVBfm5css1V8KaOtEf+geAH+kbYE7Xjfi46QV2EHPTdrv+Kf1Jay/iJetdrTGXs3aPJpMIbhUI/dnBTuLlqFuDaDd00C4kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp09ZSH///Q6a4/UBDMMh2eUynfRltmg+/y35n4S5Yw=;
 b=aN62o9Iv7d+sva3hh1tloJ5XrMYalXnVUXN+fAjSz9rNCbgYAqo8nn9+66f6MFBqzXZ1e+W3hG9+X1bNu/VXg8EZTNSGE9IZKYFp7HcExJNjm1W46Akd4aIBV+aOvCDkb8wHHHXnUQH3+TTYOpqRUb1xCldkXFo0EDIs2YQ19wFyJyj+BKZ1hWjw7pOfjgBREd18hvY/sILlhGq6ewKlArZNYzg9JKkoQUm8w5+fgBwlyLvmjqz4PI1kD6e5HDYEpWtcnGNNZaj+E1oh3LMLgbW9VXV+ecCoQeqFyrBcBowCTzd1EPA2ImZZwycL8r66LZVJoVCkbuz1W3HT77rnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 06:48:33 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.034; Thu, 31 Aug 2023
 06:48:33 +0000
Date: Thu, 31 Aug 2023 12:18:22 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Message-ID: <ZPA3tuQCuZkPKntS@bvivekan-mobl>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230829141107.1505705-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH7PR11MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fb09fd-6790-4c4e-efd0-08dba9ee4b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ZIYo6gJLcBSW9OZ9yIAXc+XwIwCvvwnibu6ukm6AYF2jE/PIqmiWNseLAQATdPVnXB9PqwZmOQPfAWDuJae9/kydONMnMQg3ZvjbLnXuAUfUPvywp/8C2juUNxHuXbtREU31e6UbzOWaq7NfUXS9drUOrcUjRleH/VlwyQ3nWNWSR2AysjtjkCeTmZhPOmWHLC2d8bBPcYpAAl+1ZN/l1ppuCFfibxEKhBnQDwz+Vm/vPneok/WwVhv8G+alsthYKOUmY7mbpXdu0jKHzBHXyfUV8ayuFI/Jhog0NH/azED6ebJgS6C0pOR7V2CvLCXNVFkbZfcD95dcftfF25Ja/zt9JMjGI/MJfyxxBhNSUFPSyMGamwq7/LuGQJyUimhg1+vD5rZUiP9ZERX6dfImPOt6YCEGoMzb6T4FRGc30c1SNCCiYl8aCNQddWLLIph0rDM0jfidBE8gCovGShoRHeoJaBobS0vh5coiXXrZvlN2Akb6Zze4pPteWv5pGu4r/t2sFoyojq0obE+YBQiM2J3cmJSQsX3hintNq54EX0jOd4YcEYedBoMpHFvRNnR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199024)(1800799009)(186009)(6512007)(9686003)(316002)(38100700002)(41300700001)(82960400001)(5660300002)(4326008)(107886003)(33716001)(44832011)(8676002)(86362001)(2906002)(8936002)(450100002)(6666004)(66556008)(6506007)(66476007)(6486002)(478600001)(53546011)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVPUkxYRHhJemN6UVFWNWNyWU9RUitkTU9tSFp3eHR6RndtSjMvODdxUUNw?=
 =?utf-8?B?Y0NrKytnOGpFV2hyNEw0K3J5cXFxWGJ3Y0swenQ5SEluSVkwdUZWWmdESVhj?=
 =?utf-8?B?akhranFKVEZOQUU0Uit4cEVtY1Y0UktpQXB3NVZySjR0aGhUVnAzU2ZFWDFM?=
 =?utf-8?B?R0gxdkdJc3B0VXRmQkZwUGY5YVdteFpuTnRGK1BLcjlQYVJtTnBhcmplSDR3?=
 =?utf-8?B?MHNwUzhwZ0NZalAweXJQSlZoKzYyT2V6YmNSejRXSElmMGd3NFkySDRWUXlL?=
 =?utf-8?B?OHJTcktZaE10L2FwclZGL1FuaFFsRFZxeXZ2L0xuMWhDVUdPSmpTeWhJWHdm?=
 =?utf-8?B?SEQ3cXM4c2FuY0F1ekFxSTFmbldwbkEyR0tSS1I1YjhaTmZicjBjc29JR1NO?=
 =?utf-8?B?NHlNQUc0QS9aVkkySEZFdG1pdVhLMVY1R3d4Qjh2dFM5MWhZSUVhVzV1bWx1?=
 =?utf-8?B?UWEzSHkzZnFTT2s3amgzekNXVDQwT1R6S2pxSlRiT01mWDh6bFRIRVBSV2Zr?=
 =?utf-8?B?SUdhN1J0KzNSVXBTTDl2eStNQUN5NEZLdmlzSG9sWE1PTk5SdkZmZitMYnpD?=
 =?utf-8?B?RG1CZXNkWWFaOFdMMlg2SGxhb09BZjRHd0p4dm9GSlRWdFhoZ2M0RDVhYU1C?=
 =?utf-8?B?SEtaRHFyenlGZG85VzlLQUhKQTlaRGtWRXpHM0pJdzBBZ2lsNnB6QjhERzd4?=
 =?utf-8?B?d0dKMnBxeTlxZEk3NEovRnFvUUIxWTlwczhXL1JZc0x4Zk1sMGJrL1VSdW1k?=
 =?utf-8?B?ZjNGTWhhWEhSR2ozbmtrTSszSHBWS3ozOVdZSmVlRjFtQndod2pwV1krYXZw?=
 =?utf-8?B?TXl6akY0OFBKUmdwQlE4cDUwOFdqRnlweXpWaW5SUElTUTBRaFlOayt4bmZV?=
 =?utf-8?B?ODFibVhQOXE1RWtTOTZ2ZUVLRzlBZWQ2Uk84K3VITnIrdVVid3R2YWF4bysy?=
 =?utf-8?B?dXJqdkl6aVdCNDcrTXlSN0dpd2JuZUI0T0E5R3VOeDFxVnh2OWdRSC91QjFh?=
 =?utf-8?B?UnBQNS9mTHJla2xZN3J3MFJ1VHJGZWpCa0ZlR2QxL1I2YWlUbjBMdVM1bUhT?=
 =?utf-8?B?Z1FCVEVDVDY2dHk2QmswVEtoeDRnekNRU09CWTlydjFJWTBNWVN0SVFxeUkz?=
 =?utf-8?B?YWdnMjJkeWwzeUJRMysxVU4yTW1mNnNhNUdIaHFHbTIvQ0drdnpBRitMT0NZ?=
 =?utf-8?B?Q25KL1RqZmNwK3Y1YTRWV1BGVjJPTXNhWlM5dm1LZHl4Snk2OVRGQlhWWDFx?=
 =?utf-8?B?dHNvSTA1bnVURWFPRnl6SnE5UC9HMUNIbnROeHBPQ1lUaVp5L3pnUG5haFlh?=
 =?utf-8?B?UkhZeDUrc3pjSWsvUlBGdVRUOVVhOCtGTHVKbTJsb0xER3pZYkd0RnR3MWZk?=
 =?utf-8?B?WFk4MzBxRDNMSG1ZcFVWNUY0WmpsS25yQnM0ck5LTXE0OHdWWXdJMCt5Umo3?=
 =?utf-8?B?eWxMYmNFekxNN295Z1NyWmNPUWZxQ0dDS2RFYXZnOGRYUkJnYjcyZ3FsbHhs?=
 =?utf-8?B?cnZOQnhOaDdzQ1Q3Vy9GNFVpZ2p1VkJKd3ZXSURNSlBValh5ajN5cVd5R1Ax?=
 =?utf-8?B?ZzNmamFwZUxQaFg4T1RtaUFlZWFXNTQvRkpsVjMrTWFWU01qdnhVRUNrbU5P?=
 =?utf-8?B?V1VEck53UmdrTHZZam85em1rZHNndFFVZmM2MWxnUDlxOWI1STdPVmF1WTMx?=
 =?utf-8?B?KzdaTTRCekJWdnMxYzhwSGpOdmJwTzJtVStSeUsxWnlCeDVlRGZGQWR4b3lT?=
 =?utf-8?B?Zkd3QzM0ZE5rWkZreU1TQWFTeFdlaldrQVUrR0VveUhaUkxnVGFHS2tOMnRY?=
 =?utf-8?B?MHE2dWRSVDF1VkpXdFNqVlVyN1VYc09YaS9aNUE3M093aFZGV3ZZRllSeWlP?=
 =?utf-8?B?OE1sUEZTbko4bWtsUFFiaW0zdGE4MitZOFVycVdyUEFSV0JFSllYMkZUWE15?=
 =?utf-8?B?RmJDNEt5Z0tXY2w4aEpXbllMcGRKOTNsdllPcS9wSWN1dm03TmxXZTQ3MTRD?=
 =?utf-8?B?bWh4NjBLb2pVYnJ3MjJnaTVoajl5Q3JhVS9XbXhFaDdnMkUza3JTRWR6YTVI?=
 =?utf-8?B?SXRsWlE5VEp2d0w4L3RtNjA4T2YvSGNndjdLWW5VOUExTWZSTWhSTm16WUFi?=
 =?utf-8?B?M0QyMnpRYzhPLzQ4REg3YXRuQWwxSXV6bWs4OG5acWdPYkxsV20xalBzMEUv?=
 =?utf-8?B?OHNUNlV1YUQ3NHlPU295NVo4YS9kVHE2YjZtZHM4NWhJY3I0TGNzekMrOHdF?=
 =?utf-8?B?WEdGTUdGMkt4SkVwTHlpOTF0SlRMRE5KZHdwODFzM2Fxd1crNVEweWFleGNW?=
 =?utf-8?Q?03HamCY2JaWIciFRMU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fb09fd-6790-4c4e-efd0-08dba9ee4b61
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:48:33.8295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbTVCvUN3ZTggHVeFKmblKBFAHqsPSZEhGNnuhgEz56Qf11qv9uaoD0XEYxj6BVsxAYq9PE4vnYyD4qYjDxXzsQ1eV9T4t2vR3UyGCFGZbgcY+P6o8fZZzdaDlT50oAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt 2/4] lib/intel_chipset: Add Lunar Lake
 support
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
Cc: intel-xe@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 29.08.2023 07:11, Lucas De Marchi wrote:
> Add basic definition for the Lunar Lake platform. This uses the PCI ID
> from the xe_pciids.h which has a macro in a slighlty different form.
> 
> Going forward we could also trim down a little bit the the info struct
> like was done in the kernel, relying on gmdid and IP version checks.
> This is left for later.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/intel_chipset.h     |  5 +++++
>  lib/intel_device_info.c | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 84cf1799e..52b15ccea 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -46,6 +46,7 @@ struct intel_device_info {
>  	bool has_4tile : 1;
>  	bool has_flatccs : 1;
>  	bool has_oam : 1;
> +	bool has_gmdid : 1;
>  	bool is_mobile : 1;
>  	bool is_whitney : 1;
>  	bool is_almador : 1;
> @@ -90,6 +91,7 @@ struct intel_device_info {
>  	bool is_alderlake_n : 1;
>  	bool is_meteorlake : 1;
>  	bool is_pontevecchio : 1;
> +	bool is_lunarlake : 1;
>  	const struct intel_cmds_info *cmds_info;
>  	const char *codename;
>  };
> @@ -203,6 +205,7 @@ void intel_check_pch(void);
>  #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
>  #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
>  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
> +#define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> @@ -236,4 +239,6 @@ void intel_check_pch(void);
>  
>  #define HAS_OAM(devid)		(intel_get_device_info(devid)->has_oam)
>  
> +#define HAS_GMDID(devid)	(intel_get_device_info(devid)->has_gmdid)
> +
>  #endif /* _INTEL_CHIPSET_H */
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 5d53d2906..86a8b3650 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -504,6 +504,16 @@ static const struct intel_device_info intel_pontevecchio_info = {
>  	.cmds_info = &gen12_pvc_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_lunarlake_info = {
> +	.graphics_ver = 20,
> +	.graphics_rel = 4,
> +	.display_ver = 20,
> +	.has_4tile = true,
> +	.has_gmdid = true,

has_gmdid should be set true even for Meteorlake. If not in this patch,
in a follow up.

Regards,
Bala

> +	.is_lunarlake = true,
> +	.codename = "lunarlake"
> +};
> +
>  static const struct pci_id_match intel_device_match[] = {
>  	INTEL_I810_IDS(&intel_i810_info),
>  	INTEL_I815_IDS(&intel_i815_info),
> @@ -607,6 +617,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_PVC_IDS(&intel_pontevecchio_info),
>  
> +	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
> +
>  	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
>  };
>  
> -- 
> 2.40.1
> 
