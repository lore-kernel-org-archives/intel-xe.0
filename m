Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F239BCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 08:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA36010E072;
	Wed,  1 Oct 2025 08:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUaDarO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F0210E072
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759307260; x=1790843260;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YXj/CLlBit7UL6D/Fc8zG8zvEUW2hzcvXhcSB6m2LnQ=;
 b=LUaDarO+O1nZemhdtnmxVslW/6dVAnU9ZhKbmXBo7+2SuywsKyQmeP9n
 a0+kIRhMyX9LO2U4ICaPYQFTf0xeeO+AgsVna13LujS7v5ahk+HdhAp9x
 nXxBLn2bhaf9pyKX9QaDFlKVHDwa7F/fZ7mqud60RVb6Y1bwxd94Z5w5C
 V8AwmxrmM7YuDJ8MAl+UYRWo4bN0jhTlsZB370okppyT+yQwj9mKVFVgb
 ltVheQYwk/Y06Fjy2b/dOeyKrPh8tivqjPe18UzoeeMcq+Cb3TE+QHCBV
 S2AgZBfv46t5xzSk4id+40NlZgFlfsJLSEiizFezIsO0QoLgS8GgFjsQ2 Q==;
X-CSE-ConnectionGUID: 79F7lmgpQ3G1Jw0OpIBmXg==
X-CSE-MsgGUID: ZkqZWYhtQj6dEw5MSWkojw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61622022"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61622022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:27:39 -0700
X-CSE-ConnectionGUID: yRvz4MxIQgG4q3WSluXCwQ==
X-CSE-MsgGUID: er3POxeATSaOzipaA2BoEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178016766"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:27:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 01:27:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 01:27:35 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 01:27:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLvbBJ8as9oF75/qljFwNsANAmvCAlT3UtX1CZSxiw91GLnoiGivfPMSfqYKk/fK/3A29qjNPpRQNcTiJoJ/Hgocw88A6RwwddEFQBs1JWZ5gaSbEK0oL9CgOI8V31FJ3JvIiLML2auUal4eUQTZ9ysmE26+4rW5QZR6eh33VTH4oq/CjeayRXFFf2rICzThzuyw7/gjdk8ASIpV/apYGNjtnPV07FP6pNTgixRdZL0ztDg/xJmHrrbjRRGTwv4Irr0vpPKqc6OYDEoyWdQwK4LE6ptHdCdLnpPWLlYyJysOPKx+WpYsKFRwIvuy6WQyOuNHjVdRyiI1HmMgRrvwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w+bNwrha+bDepXwi4JWs4a9YWGhEHc0T089CDT6j9s=;
 b=wNwcvB5jc2e/wuC50Fqn8t2o1eYr+cdz1w0OM7AjF4bDPPWb5bsog+ijl8Z58qp/xWFq6TvJchT6XANXDN0yugRKK8i/BpKf0VIcfyA06qij/Vk7Fu8TvoBWfes/XQ05L8L5bfS6WjGylC3Jki302wOMLYjmLeNrErLntux9r5oC4eZvqbyS+eXVu7DX4u37Obc0ddDTU0MytktJWFshfxrRLgUkQseILdMS//norC/wCp+E8YnG7zbV25TI5GrY0ROIeKWMeVqykpgRmHH6KYrVXjM/BuQIjUopjRGvc8uYjj8bIwUMEj7O48MydXoTO0rN0CPSeK0EXrhNCniKYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 08:27:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 08:27:32 +0000
Message-ID: <0fb4c70b-036a-4df5-8e4d-883c106b4528@intel.com>
Date: Wed, 1 Oct 2025 10:27:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/xe/pf: Synchronize VF FLR between all GTs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-7-michal.wajdeczko@intel.com>
 <aNzZJofhvZEdNnjn@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aNzZJofhvZEdNnjn@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0056.eurprd04.prod.outlook.com
 (2603:10a6:802:2::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d3dac6-80b2-456c-b52b-08de00c45e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2wwSnRLNWtaVUhpWGd3OEJwd0VSSGZmRDlXbG45WS9Cc2VGWWdNd09sK2Y0?=
 =?utf-8?B?OUJXUUk0L2pmYlVKVFNLVnJ0UmgxUy9SUWloQkZZZzlGUDhNK09SWUV3Rk9x?=
 =?utf-8?B?OXBhNnEvckVqNzVQNVRjUnJDbUMxQ2ZzT2JWU2RpcnBHRXVKcGxidlZiTXNu?=
 =?utf-8?B?dDFrS2xMckRTcXNwWWgwVDRMNEoxUU40V1lyZjd2S2hOWUlnVm1hV0hIcmtI?=
 =?utf-8?B?WkpuWElhMXdSUXluYTNlMjEzZ25vTkQ3RkhYL0pLZUp5YmsxUTZWZGM2amhl?=
 =?utf-8?B?VmlISDBQQUtaTWNoWlNXVzVGR3lDTmlKMjExYzVzay9wNW1uRVo4Rm1uVVM4?=
 =?utf-8?B?NGNXZDMrQ3BpRnF3NkxoTGZ6MStpdk5RVXNoejdmU3lIYUtVK081V2JreU9u?=
 =?utf-8?B?T0Z3MG1MalBDSnEzN3BlaHkwNFFudUg0TXRVRWo0bUY2NFBIOVZlM1p0cDlU?=
 =?utf-8?B?aXlQTnRkSWdRQ3ZtelQwT3pTMEF0SURNL2J4Y1VkRnpNRjRHeEJzMFlZU2hH?=
 =?utf-8?B?QUZ4T05OVjhYRjRBRVkvNmdERFF5aXYzWDQxSnFtV0xUSlg3dEZBK1IyVy91?=
 =?utf-8?B?TFJ6MWhpNk5vWjFXZDlDczAza0o1Nit2dDNFT0VBR1hBVnJ0NU1weWVZa1Fa?=
 =?utf-8?B?UUpDTUdJQkxWWlRhMm5hbFYvemxZVEl4bVBUVHJGM3FzaDJtNS82UHBkZ3l1?=
 =?utf-8?B?eWx1SkZjTmxkZ1drVXl2Sk5aUG9HZ1czWDdHZHRUZmJtM3dRMGdtTkpnRkha?=
 =?utf-8?B?OXhVYWlwb1VhcktFSi94Q3plZlkrS0lzY1pFOUJOL0xYWlJwVmZiL25ta2E3?=
 =?utf-8?B?SkUwRTNwNmNNYUl3ZXgwUTdtMzh0cW9iMzhxUkdoTmk1dm5TUEZRSi9FbjlL?=
 =?utf-8?B?R1FwQm8xQmNkMHBNVEc5V1ZZTmNJUVpnc1hTUXYyZFVPY3JDODZiY3N1NHEw?=
 =?utf-8?B?YjlQQnk0OTZwVGxCRDdEN2xac1FLd1pnQWcwNDR6RC9scXlnbittSFJHV01G?=
 =?utf-8?B?K3EvRi9mamQzaDhVS0JYWnBHMisweHNqUXhCTURLdVdOL0RDWXB2R1QwSnFr?=
 =?utf-8?B?U0d2ejNPY2RRNENrekxCWEV4MVV1MVJ3R1BLZXNML2RoVUh2c0tUOWp6VnU0?=
 =?utf-8?B?Zzk1SVUzWW1ha3A5L0hSM29XTkphakR6dUlWVUJKTEJrb1BoYlhTMG1VVXVh?=
 =?utf-8?B?UWpTd3dGM2dualMrUC9CQ2J4cWVqQTVMUGE5WjNua1RhQWJRQXBTYW40Mm9r?=
 =?utf-8?B?NTJpenR0V1Rxdm9sc04rQ2pJSWYyVFFvS0lMTUtqQjRoaGxUbFpOMjNlTXNp?=
 =?utf-8?B?bm80d1RuOVlDQU9Obm0vRmxuYXF5QmV1QWJxZHozejBmSnc2eHlidyt5MHpD?=
 =?utf-8?B?bDZUTlRNZ2R6NG1tL2dUV2I4SWFxTk1jQ2F2by9kcWZUZ3ViRllLSFFBVUtQ?=
 =?utf-8?B?WDBlRmdVbjAxbURKdVo2UlhVSFNXY09IZU5mVk55MUlEakFMcVdGQ05pTFEr?=
 =?utf-8?B?NWxpZzNJbGttc1BsemxEeFc4SW1lOVdUaFc0bHVWSnpFc1BQcDdUTTZ0SkZH?=
 =?utf-8?B?OGxDRWpnUEMwZ3VPb3p2a3Q1UmZvUGFNZ2owRlZMelFuREVYUG1Jd1F1Y1NL?=
 =?utf-8?B?Ry9hYUcvbVNWK2pXaFhMZE5Jby9XdEFNR2hMUm04ME1EQmU5NS9SRmR5SkZi?=
 =?utf-8?B?TFBGYkM3eGNZT2xCMnhQckw4Zk1CNWI5KzliNGRRNmFaVzhQN2Y1Y2Nod00z?=
 =?utf-8?B?Q29XR2VsaWh4R2N0RGhDWDBPZytVTzdFd3JWYmRlQWJTNmk0TFY5R1F5K25w?=
 =?utf-8?B?dEg4MUhBd1JOUHJ5ZG5lRFVxTWVkMTNHcHliNjlWVmU4Mk1lei9WUDBSSXR4?=
 =?utf-8?B?eHJHTlZQY3dnVml5NUE0K1lGQ3F0a2pLaTBnNjZDWUR3OE9PTFRla1JxRkdW?=
 =?utf-8?Q?VRihxPCSBpbjitSigDTZjglbzQ05s5Bt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzdFa3RLZzRBMXVFK2o2RjZ5cmhuZVUvdlI0T0o4TnoyMG5Cb1pGR2pEUmRF?=
 =?utf-8?B?YW5CbVhLNEp0U0RwWis4QnVYK3FLd1U4NGttUitoRG1rUkxlRTBKdFVFQmh4?=
 =?utf-8?B?VmVRMTAxMVpPcnc1V293QlN5N0FNelNOY2RyVWdvWFM5aWtEcnkzeWhjeDRh?=
 =?utf-8?B?OXVLZTY0VFdBU2hvaEJidHRrUWtlQ09SbExYZTRuSDVKb3RPUXN6UnRPdFNU?=
 =?utf-8?B?S3dsNk5hTlg0Yzh6RUhrME94bC9xeDRSdWRSME9tVXVZb2FUbThXV29CbGZR?=
 =?utf-8?B?Uk56VGRGd2FMSVpEV09QNGFvS3QxSTlyUVpiTnJrZ01xekc3YjV1cXQ2amVC?=
 =?utf-8?B?SDMzRmVQTXQ1a3l0WjNtSFBFc3FFLzE0elBDSmJxbWRGYW1vQnhoY0M2RlJ1?=
 =?utf-8?B?Mi9xUTFjWXZQRWRlaUNlQlpwY2xMN0dIQlZrNEFUVTI2bXRNSmp6eUdKR3NE?=
 =?utf-8?B?cHlFSWRGU0ZvNHFjZzJRR2VlZWxIU2FGSVdGdEZUOG9STHYyWFlkcmtrMG80?=
 =?utf-8?B?MUpQREtBZEE4UTFvTGpnMTdTRGQ5NlpsR01SVHdSb0JheEJFYzZwNWtrcUcv?=
 =?utf-8?B?bWlzSDhiSTFqMzMyVUNPZGxWZHQ4U2x0akd1UEJGelcyL3V4S04yRFVZYit5?=
 =?utf-8?B?aUppVzBocWdleTQ5UzRsRTNFd2MxOVFYVXRkTWNoUzU4TVpxNVVnL2htQjNr?=
 =?utf-8?B?TDZQdkxRRHhsRWxGYVhMUDE3amp3alNDblc4MkFRQ0dtdG1mdGNDQS9NZWdu?=
 =?utf-8?B?YlN1QzZsMDJ1eVBaMFZHU0J0SGhwd2UwTDVpZFpheGp5L3VCcWh4c2VVRWND?=
 =?utf-8?B?OHk3K2RMK2gydmMwNXYxSW95ekNWemxoU1VmeFRJRGxMRFJKYU9xaVFaNTQ1?=
 =?utf-8?B?cFFXQSsyRnM0Rm1FTXh2N2ZORks2Nm1oaTRJQlpBdmlRSDA1WWZ3ckNmQnRL?=
 =?utf-8?B?NVcya2pDZnQvc1gxb2JITEhOQzdjckVaVVJIbTJJaTV4eEVoR2ZHTndzWXQ5?=
 =?utf-8?B?dkZrRHpJK0hrVUtKU29UVmoyVUJXZW9GRGZhbWttdURqTmFLZmhJOTloNGF0?=
 =?utf-8?B?Rk1IN0JIMkdvT2VSR0NJT092OEltV2xtYm40a0pDVnhLNHNOeklOR1hwaURk?=
 =?utf-8?B?MjJtaXU5K0lkblpUdHJVT1RxRWI3ZXRxZkxxMUNhMHJ3NytMbTZTT2JhVlJJ?=
 =?utf-8?B?OUlpa2x2and4MThjSkMrbG1TQjhPeHdHWDFtL1pSNTU0K0t1d05VVVh1SGta?=
 =?utf-8?B?OFRaNFpKalV0ZlZLNTh6dXV3NkJNbjFBNU85dE9KeGN1K3RzdjAxRTdWWU9k?=
 =?utf-8?B?UG1SU1Z5d0FOek1lVnQwc0lXT2RyL3RxUkV0NVZFTlRMc1JMaHBhUVQwNDgv?=
 =?utf-8?B?THd0eXA4UVB3K2oxdHU1V0pPMC9xYmN5QnQwUlJxUTlOYUt4TGZ2WXRRRzhz?=
 =?utf-8?B?K2NiZFJNNVkyeGxkV1FEYTdGVGdHN3FwVEd3S1VBZjZHNjQ1djFieG85MkhU?=
 =?utf-8?B?dVlrZUo3K1Z4VzNvQldKQjJ6OGg3a3dCYUpJd0wycHZSbGJIeXFyTytya3Rp?=
 =?utf-8?B?eStaaXRlbVhxOTJrZGRwOXI4dmwyNmpCZUxId1k4NVhKMmpwZXVNM2Y1eUFh?=
 =?utf-8?B?dlFkelRTOWVQQ29lYS9wcmpGcjlKalhUTVJyRHZZa1ZRL2puZU40bWsrcStq?=
 =?utf-8?B?aFplU0NlWi9NY0NSMVRBenpiZEE1d1ZwQkRGTlMwZGJ3U1pjMjZrZjRxdENW?=
 =?utf-8?B?VjEwN0N0T3JuT1lSSVVjM0RQNlRXRk9wUTJHNmtQSW1udGQwenFIb3R4aGxw?=
 =?utf-8?B?OEJ6cEdUUVJYR0RtcEgySWFDSVVqTlhydjdhMWQ5Q3U4ajcraVQ4LzFoOGZU?=
 =?utf-8?B?R0tYRWsydUxtcjdZU3NGNVpJMUNsai8yY0tqWDJDS2tKcHpWSFFrZ3RtdnV0?=
 =?utf-8?B?eklRcUF4K3ovczRhb3VZRXN3VjZIRkgySElXVEJHQnlqYUJrejRtREhjaUVk?=
 =?utf-8?B?UzBKS25oSEQ3WjBhd09yNnE3NE1TQ3ZWK3ZPYXVqdjlPYjY2MmhDTm82V2RR?=
 =?utf-8?B?Rnl1dzFsaEdZL3ptOFo2WlVFMG5vb3NYVnlEb0VCMWkzYW8vam9EUDczeHQ3?=
 =?utf-8?B?Uk9LUldUV1N2VXVDMXpEZHA1KzhWZFFLclNxYjdiUGRKTVZUdHVpMnptVVJE?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d3dac6-80b2-456c-b52b-08de00c45e18
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 08:27:32.7727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R/I/YvGKcN2LehqpveTTjm6iCwJnPlXGJWUC3E0UDTN8HaW9sqiFH91dLIT4E3hEIi5aVbnU72wkupujyVqRaPG2o78ogUu2OUY56K8CF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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



On 10/1/2025 9:32 AM, Matthew Brost wrote:
> On Wed, Oct 01, 2025 at 01:35:24AM +0200, Michal Wajdeczko wrote:
>> The PF part of the VF FLR processing shall be done after all GuCs
>> confirm that they finished their part VF FLR processing, otherwise
>> PF may start clearing VF's GGTT that other GuC may still accessing.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 56 ++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |  1 +
>>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 +
>>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 29 ++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf_control.h      |  1 +
>>  5 files changed, 88 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> index 491918d6b93b..2e6bd3d1fe1d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> @@ -18,6 +18,7 @@
>>  #include "xe_gt_sriov_printk.h"
>>  #include "xe_guc_ct.h"
>>  #include "xe_sriov.h"
>> +#include "xe_sriov_pf_control.h"
>>  #include "xe_sriov_pf_service.h"
>>  #include "xe_tile.h"
>>  
>> @@ -170,6 +171,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>>  	CASE2STR(FLR_SEND_START);
>>  	CASE2STR(FLR_WAIT_GUC);
>>  	CASE2STR(FLR_GUC_DONE);
>> +	CASE2STR(FLR_SYNC);
>>  	CASE2STR(FLR_RESET_CONFIG);
>>  	CASE2STR(FLR_RESET_DATA);
>>  	CASE2STR(FLR_RESET_MMIO);
>> @@ -940,6 +942,10 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
>>   *	:        v                                      :        |           |
>>   *	:       FLR_GUC_DONE                            :        |           |
>>   *	:        |                                      :        |           |
>> + *	:        | o--<--sync                           :        |           |
>> + *	:        |/        /                            :        |           |
>> + *	:       FLR_SYNC--o                             :        |           |
>> + *	:        |                                      :        |           |
>>   *	:       FLR_RESET_CONFIG---failed--->-----------o--------+-----------o
>>   *	:        |                                      :        |           |
>>   *	:       FLR_RESET_DATA                          :        |           |
>> @@ -1147,12 +1153,38 @@ static bool pf_exit_vf_flr_send_start(struct xe_gt *gt, unsigned int vfid)
>>  	return true;
>>  }
>>  
>> +static bool pf_exit_vf_flr_sync(struct xe_gt *gt, unsigned int vfid)
>> +{
>> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
>> +		return false;
>> +
>> +	pf_enter_vf_flr_reset_config(gt, vfid);
>> +	return true;
>> +}
>> +
>> +static void pf_enter_vf_flr_sync(struct xe_gt *gt, unsigned int vfid)
>> +{
>> +	int ret;
>> +
>> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
>> +		pf_enter_vf_state_machine_bug(gt, vfid);
>> +
>> +	ret = xe_sriov_pf_control_sync_flr(gt_to_xe(gt), vfid);
>> +	if (ret < 0) {
>> +		xe_gt_sriov_dbg_verbose(gt, "FLR checkpoint %pe\n", ERR_PTR(ret));
>> +		pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC);
>> +	} else {
>> +		xe_gt_sriov_dbg_verbose(gt, "FLR checkpoint pass\n");
>> +		pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC);
>> +	}
>> +}
>> +
>>  static bool pf_exit_vf_flr_guc_done(struct xe_gt *gt, unsigned int vfid)
>>  {
>>  	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE))
>>  		return false;
>>  
>> -	pf_enter_vf_flr_reset_config(gt, vfid);
>> +	pf_enter_vf_flr_sync(gt, vfid);
>>  	return true;
>>  }
>>  
>> @@ -1178,6 +1210,28 @@ int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
>>  	return 0;
>>  }
>>  
>> +/**
>> + * xe_gt_sriov_pf_control_sync_flr() - Synchronize on the VF FLR checkpoint.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @sync: if true it will allow to exit the checkpoint
>> + *
>> + * Return: non-zero if FLR checkpoint has been reached, zero if the is no FLR
>> + *         in progress, or a negative error code on the FLR busy or failed.
>> + */
>> +int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync)
>> +{
>> +	if (sync && pf_exit_vf_flr_sync(gt, vfid))
>> +		return 1;
>> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
>> +		return 1;
> 
> This looks a funny the return 1 / 0 / -errno pattern. The caller of this
> function only checks for -errno.

true, it's because what was included in this patch is a simplified version
of the caller, I had the other one that was also trying to verify that FLR
has indeed started, but finally dropped it as not critical for this series

> 
> Matt
> 
>> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP))
>> +		return -EBUSY;
>> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
>> +		return -EIO;
>> +	return 0;
>> +}
>> +
>>  /**
>>   * xe_gt_sriov_pf_control_wait_flr() - Wait for a VF FLR to complete.
>>   * @gt: the &xe_gt
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
>> index fd256866f628..8a72ef3778d4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
>> @@ -18,6 +18,7 @@ int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
>>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
>>  int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
>> +int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
>>  int xe_gt_sriov_pf_control_wait_flr(struct xe_gt *gt, unsigned int vfid);
>>  
>>  #ifdef CONFIG_PCI_IOV
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
>> index f02f941b4ad2..c80b7e77f1ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
>> @@ -18,6 +18,7 @@
>>   * @XE_GT_SRIOV_STATE_FLR_SEND_START: indicates that the PF wants to send a FLR START command.
>>   * @XE_GT_SRIOV_STATE_FLR_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
>>   * @XE_GT_SRIOV_STATE_FLR_GUC_DONE: indicates that the PF has received a response from the GuC.
>> + * @XE_GT_SRIOV_STATE_FLR_SYNC: indicates that the PF awaits to synchronize with other GuCs.
>>   * @XE_GT_SRIOV_STATE_FLR_RESET_CONFIG: indicates that the PF needs to clear VF's resources.
>>   * @XE_GT_SRIOV_STATE_FLR_RESET_DATA: indicates that the PF needs to clear VF's data.
>>   * @XE_GT_SRIOV_STATE_FLR_RESET_MMIO: indicates that the PF needs to reset VF's registers.
>> @@ -47,6 +48,7 @@ enum xe_gt_sriov_control_bits {
>>  	XE_GT_SRIOV_STATE_FLR_SEND_START,
>>  	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
>>  	XE_GT_SRIOV_STATE_FLR_GUC_DONE,
>> +	XE_GT_SRIOV_STATE_FLR_SYNC,
>>  	XE_GT_SRIOV_STATE_FLR_RESET_CONFIG,
>>  	XE_GT_SRIOV_STATE_FLR_RESET_DATA,
>>  	XE_GT_SRIOV_STATE_FLR_RESET_MMIO,
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
>> index e1c54a8feb07..416d00a03fbb 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
>> @@ -120,3 +120,32 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
>>  
>>  	return result;
>>  }
>> +
>> +/**
>> + * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
>> + * @xe: the &xe_device
>> + * @vfid: the VF identifier
>> + *
>> + * This function is for PF only.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int ret;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		ret = xe_gt_sriov_pf_control_sync_flr(gt, vfid, false);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +	for_each_gt(gt, xe, id) {
>> +		ret = xe_gt_sriov_pf_control_sync_flr(gt, vfid, true);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
>> index 9bf059f746d4..2d52d0ac1b28 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
>> @@ -12,5 +12,6 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
>>  int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
>>  int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
>>  int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
>> +int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
>>  
>>  #endif
>> -- 
>> 2.47.1
>>

