Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E791E83040
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 03:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C0E10E4E6;
	Tue,  3 Feb 2026 03:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ek45Hs48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EC010E4E6
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 03:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770090075; x=1801626075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XHA/NrqIm8BzTIUR1ghQfv1HESCy3+LpGkL82nE5Cp4=;
 b=ek45Hs48KBWdSSwIKqkUtJks7bfs6KBuLEKnxYOn16KjVOQzhXhMmjQh
 iaW05jbDNk0ZqedaOpNPuZlb84ATA5BTfLw3jsropxlZlVW+QhFb5styd
 yO5FifaPlYDkBymTCWmXF11tqeg5j6rU9E5sIeu0N91hO5dGfdjarm84Y
 XFAx0N1HsDo8WKm1oBrwr+5nkSnhoCJOMljQfkJcsJnz/pkCKCEZDfK2k
 3iaS4VqqtGKTk06D33PdyTM7883X+9oR4ki5ETVtuy469pn0nppi/KxIf
 M1v5NxNZfDxPAtsbtYvV6SFaDXTnYts0Y6i+ddSEUO/qXtUcUTpMaRb4i w==;
X-CSE-ConnectionGUID: TTOHzIyYQeWgUj6CVIQG0g==
X-CSE-MsgGUID: lI7LXQSiT02KmLpoZZZbcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58834223"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="58834223"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:41:13 -0800
X-CSE-ConnectionGUID: 5ACpS+LQTVaTDIF5PiZ95w==
X-CSE-MsgGUID: MNgDodEES7GHkjU7B7n00g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="214677595"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:41:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 19:41:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 19:41:12 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 19:41:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYERdWNQ9ZpYxsx8+i+oDVQqKsYngja0FhoqeXl2O1Kzvd7ZD+AbL/IL6rR31eNcVOJT0KiRcf+36Wj1k7ZLZgMe7ED0NdZ2EIAkde6LGPAk9PM3ObynlQhQNyc6gLNVa3rKxF9l6FltIFvs2UZV4iuD2LjOUtncFmtA8OF0Vh9P4hxDgOFUVmmlk/6nq3Zen/rpu0d55t+Y4YivKUpRNWOIy8gYzjtpiixiyy5Fbnv97W37LUJAUvIaCHd83ByifxGee6aY6DE3brns2g1NiYsCcAY05QH8E/9pgWh7g6NhKmm/yMYhJ1/d67SK1I2abIGi0gtRzMyXY8327OimAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3evY2H5ecTRnd4szXwipvhwg73iUrCMq8T+zZ7lnD0s=;
 b=h82Zlyp8xyQPMlijpl+xTiTUeGE/il6IbRyCfWMhECSspbDCbWUtbkFi8CJBn7qKLpetRJRCQKenvE3x6nEfqZEvybb04BlR0pX+RF5nw3RX7rUNSS4CSCWH/V03pYNS9rRT9MLfOSbIb2O1Qt7TjgXd6MCUEqnaHWSer2V3V3PM3aw4szmYvW0r+Ep4sHFHJcr0s2WNOrzoz/hTmgH4aDBObJYxS3IQqWHFSrt7LJ/Uy8EPTjWurHH986orLkYqk8lmO2vSa7doNSTATMI8MKNd6D2clte04IRD/GnZb3YucyNtnUykNOehH3G2Ez/3nnP5+5dq2n2S14M4GT0wbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB9449.namprd11.prod.outlook.com (2603:10b6:8:266::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.15; Tue, 3 Feb 2026 03:41:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 03:41:10 +0000
Message-ID: <e7c7c995-fab7-49a5-8f7a-8090d38898d1@intel.com>
Date: Tue, 3 Feb 2026 09:11:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
 <baf0c1db-6904-4e3a-8a30-1f56c015796c@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <baf0c1db-6904-4e3a-8a30-1f56c015796c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ad979f-3f65-4c55-e71c-08de62d611f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0FJOUtVTFhTTFA3aVpweHpNZFVDK2EyTFBlOVJuUzRSWmFqNExYK0tXR3Iz?=
 =?utf-8?B?NFBrRXpzUys5WElSaUVUZkdNKy9XT01JL2RtMFpEWGUwL3VUSDRTcm5nYzNC?=
 =?utf-8?B?eE5oVVZOTE1BL284WjVxTWltOG55blhCZTZEa21GaXRMZll2a2JMMnNKR1BO?=
 =?utf-8?B?ejNaSkMrWWZQR2JSTGlmK0dFc1NBYkZXUkxadEEzSUhIRWowbFNXZWpIZlFv?=
 =?utf-8?B?STNrSFNaQ0FyajdkTUVaS2hIdGNQTHNVcGEzOGhhaTI0TnZGZWZwMjdWcHdC?=
 =?utf-8?B?UlJtRFJLZll6b1pKZWdDZTlhUVJ2ODhMcFc2LytPL3ZXRFdIcWhWc29ydmRQ?=
 =?utf-8?B?N1dBT25DRzRMNHZqb2U3SllHYk9YWVFhcjRvdHdvd05IOVg5NnRULzNoZ2lR?=
 =?utf-8?B?TStUWGFmb1hvRmlpWmRpczJoSUp2dFNhR0hVcG44YW5hM0IwQnI0c1ZseU8z?=
 =?utf-8?B?VmF1bFZOOU1HR1g0cUhRczl3SzlTQjZXM3hIUklDSnl3N0dHQllETW5UTnk5?=
 =?utf-8?B?RUJaOWJVSVhjSksxampRdFVvK09tTTBTSWd0K3pNNVNCZ2VZTnlyYW1nN0NF?=
 =?utf-8?B?R28wdlQySk0xQlpOc1Uvc0p0RGQ2OUJTS3pDeU5nQW14YWsyeEorWUtwZCtR?=
 =?utf-8?B?RHVNMUhLWkJVN1pHNnZJVTZIK0ZPM1V3YWZHdlVkQWhubEJqamtUekFyTENw?=
 =?utf-8?B?TnIzNS82dzhjU09TVU1JVld4ckIxNCt4RFQ3Umtsejl0M2c2TlZnc2tHUmlV?=
 =?utf-8?B?SGI1K2R4cklTeDZxWHJlR1BNVG9WWmd2c212VmhTR0wwQmQ2aldPWTZBbDlr?=
 =?utf-8?B?TENicjhFNkRqL09sWDkwY2lyRnN1K0RaOUo5Tklzb2o4KzU3ZWtZRDJIL2Q2?=
 =?utf-8?B?TkV6cmhMcUlkQmNIaEpkQ3NuTHJ1SVdiYjVYWWRkK1FUQytNODc0SUpmc1Iz?=
 =?utf-8?B?U0RZMjYvSDZ3WDc1TTdiMjJJL0duc2JFTElnTERmaE9LVVkrU3EwRUw5WVQz?=
 =?utf-8?B?ZVNpTE5nQ3FQYVlabUZhVVozZnJvUXJOZUt1Zk5rK1JoK2V1eUFBY0ZTVC9Q?=
 =?utf-8?B?cmwwd1ZDRFhQeVcwMXJnbkgyRjJZeHdOa0dUVVE1T21pOC9XN2hjNE9tSUtu?=
 =?utf-8?B?UjNYWkdrSXJ4cDUzSm9uczJ1ZzlVd29sS09Ba2xhVHREdnJjZ2UxM0pIVEVp?=
 =?utf-8?B?QVpCeUhVcUpDNkdPRDFMWjVTSWRBYjFQcFdEUi9wVm5WU0J4czFOT1prYzdu?=
 =?utf-8?B?d0ZOdDhpcFRSaEdVNGU1am4rZThaNnVHTlRUVCtZaVc5WjQ3L3hjeU1ReGpw?=
 =?utf-8?B?eFArUWhNQ0FBdGRvTU9sWlNEcXpmRjRqNU94N2ZrczF1aUhhSk51MUtyaU0x?=
 =?utf-8?B?RjR5WU5iWFc1MTlycFdCdTNUOWJTYWdxLy9NNWpJYU1JcEt6ZDZ1QjhXTHpT?=
 =?utf-8?B?R1FHTm1TMXVGWnQzOXBWclBQRFc3SWMyVXFBWmI2eDJKZ3pWL1NBNUVLL2NX?=
 =?utf-8?B?Z0pvMU1lVVFaQkJlWXZlemI1SjIrVFpXelZadFlRTlNWS1Jpd0VIRis2TDdW?=
 =?utf-8?B?YmlKU1pHNlpKNEl5SzZUTmhRMjVhNHVVT0lOU3VNemEzUnM1Z3d0Q212b01s?=
 =?utf-8?B?V1dZcGhsSjVQWE1mSytBSXc4U29kY0lnOFQ2ZDRVaFV4aXZNMWM5bHJadjhr?=
 =?utf-8?B?NW8zc2dUSEZONk9yVGpiK1FYbjlETkV2QjVMMnR4ZzBaOStLK2JtdUc5c21j?=
 =?utf-8?B?eTNEMzRNNEJpVXp5QzNWbHo1QllOUkJlWFUxQldldTEyWllPY1BEeXRCaUNR?=
 =?utf-8?B?ZnRtUnF0YXNOWW55eXZ1VHhDOHQvOGJES0RHRFY3dWdLTEExWms3NXlEZVFV?=
 =?utf-8?B?ZUJzVWlUVy9BTVBSODJ1K0tsakRPMVZWTk8remYvSTkyUU5ralV1a0RucmJ3?=
 =?utf-8?B?bU90UmdaTThzZHlQTzdtYzRtcG1uY3RhaDV5MlFaejlrVmFCbTJraTZxTUxO?=
 =?utf-8?B?RnFZZmJjc29wMEFINUFKTFphbjRSZFhqR01xWlVBbkFDUGtsV1BkZUZnS1hq?=
 =?utf-8?B?WXg0OUhMS0NJVU5pdGtxcVg1QmJtR2pNRHlDc3lPa29hSDMxeEYxMFZXamd4?=
 =?utf-8?Q?rKxQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFOU2RIWWJzU1llRXZHTm9CR3JOUFZNY3d4NmYyeWtid04yWTMyb0VteUw3?=
 =?utf-8?B?aXYzaTRrRnhoSVZyOGt5YnR0QmFKRkpGSXNlTVdWMDY4Nk1uMHBrZ05qSzJk?=
 =?utf-8?B?YTRoSHc2S2RmQnJGeDlFd1YwbEc0TjB4NkN4NTdGdTI5cktUMVlJeHFlZkRX?=
 =?utf-8?B?cWR0Y2puTWN3V01QeUpnTndSU1dDMUxDTjR4U3gvbzNTQWxBVTkzd2paejlY?=
 =?utf-8?B?ajNScnNuV0xXUnloNkNrcGNleFVGdS94cWk0ZkFkbWZYeDBvekRTMjdLM3Iz?=
 =?utf-8?B?RjVQVEEySDJNbXpydVJtVkhid21DeUZ5WTFBVkNQakpZZWVYVXBhYXhPT2Va?=
 =?utf-8?B?dk5TbXhycDRPbGFhR3pmUnVMdFM3bkdBMFJKUHNUVFMvdC8yZk95YXIxL0JG?=
 =?utf-8?B?YVFrUHZaVForaGExOHlUYzFod2FsT1Uvd09PejcxSzdYczl5RjlVWk94QTkv?=
 =?utf-8?B?WE5kOGQzcVRYNURNOGlqTDNLZXd2N05zbGlLUDl2MzEreFR2UTRQZkFoMUps?=
 =?utf-8?B?UEFScE9pbkV5MFN5ZDU0QVVJRHF4bFdDaTFsbnNqcnh1a1JwNCs2aU92NU93?=
 =?utf-8?B?dXRBTFA3NWg5dEcrbmVnemhRWmxoaVE1MTd5OHFFVmlzekNoUGxLV1RFYnk4?=
 =?utf-8?B?aWxCM3VaQVF5aE1CUnJqUFRRb2llTGdramVGamtjLzY0NXNiKzhvK3ZOMnRj?=
 =?utf-8?B?T24zNVRRc3dWOHVOM3poWDdKYndJd0V3WmxnSUsxVVJMOWVoYWovc243V1lJ?=
 =?utf-8?B?NDZNUTE3L0RKalNiUEF5V1pIMlBnM0syMGVnNUFqMTlTaS8zdm1SSnVNbnY1?=
 =?utf-8?B?UmdwdnY1M2FRZ3BLQ2Nqb2puU0taajQzYXlQempDaGpOS3JaRFhiSEQzQjVv?=
 =?utf-8?B?enc4YjJ4YXh5OGRuRW5SZFZNTDRvUVFvWVlFSmhVNStRMmMybVRjWGZiRWtF?=
 =?utf-8?B?NmtTQ0RTdHduRnRHSjNkWnkxOEI1eEUrRDU5N1lsNHNXcyt4NGdRdkxlNkRx?=
 =?utf-8?B?dW5uK2hkYWhLYTJhdmRad29UaHoxby9wbytxc2ZzUlRHeFpLM3NKQVk3cWk2?=
 =?utf-8?B?RlpwK0EzL0ZLaDJ4SGNHSnY3SXF0UVhDOFNESWdrTWFYM2RsbEs3UllvbTJi?=
 =?utf-8?B?NFRJQi94Tkw1MnFjODVoc3Awa0pCTlFKRS9ZNXpOZkJ6Q2VuYTEzcmJoZWYw?=
 =?utf-8?B?a2ljaXZRWExpWnFPY0QxU2M1Wm12MUkyK1V3KzB4WU5Wbk9FaFVxMSsrbDVk?=
 =?utf-8?B?bU15ZXFCZVMxdjFPWUpZMFArTnVkT3prVEs4aUJhaHdpMEx3R3ZPT2dFR3Bp?=
 =?utf-8?B?ZUUxYi9mcVE4S3VyWGZ5ZXlKVG9RTUNMQ1I5eUtDRzRLK2NRUGlJSVJWOHlq?=
 =?utf-8?B?ZVY3YTRMNURlYUdnU2VJeFVqc2hlcmNQWjlQM1RlZEkzZ1RSQmZOVGlYVVVl?=
 =?utf-8?B?SEdXR3NhYTh2ZFN5REVLb2RxZnZtYkdWckgzR0FpWFdzUXZIcE9DMWI0cDkz?=
 =?utf-8?B?RnpMSUJoYjFqNmRnMlNKVVpBYVR2bFpZeDJJdFM4blBIMFNtRUc5OVdOZGtm?=
 =?utf-8?B?dnhabGhBSFVVcGNYRzN5R0I0RUszMEVWaWdkSWlGMmZnOWFERk1CUiszb0hx?=
 =?utf-8?B?WDRtQTkwZm5xTmIrTjBJbHVXOGhWdjB2STJOTlRwRkFzcEZOb0Q2aWxIN1RV?=
 =?utf-8?B?eFp4UUtpQVQrblBXN3hOalAwMVh0MXJmZHIrZ2I0RXpXQzRBZHdsSVJPandX?=
 =?utf-8?B?QkRUaDV2blVOMTlJUE1SRmdqRWRzZG5WbjZrNFB5N2tuaDVkN3N2MlBLWDMx?=
 =?utf-8?B?eHFLZTdtWE94ejQ2RFI5enlzLy9RdEVTTDZ3M1pVQUdmRk51VjZhaVF0ZE9D?=
 =?utf-8?B?WlNlRDg1bUZQYjVDa3VtZ25aV2ROQXhsN00zelU3eEdHei9MV3kvSFl2alBB?=
 =?utf-8?B?V3kvQjNkeUQxdUFZQWJnQ2ZRb3gwZ1V4RURYcE5OVlIvVDZvVEUySmJUeVpI?=
 =?utf-8?B?dmphVmJwMkoxOE5DTFMwcDZNMGh3Y0NnNkM1d0FSNGhSUkFlM29QbkRRTldr?=
 =?utf-8?B?eUY2MTdYR2Yzb25tbTFrUGxoRnI0THo5YnY3c2hrOHpHam0zV2NFc2h4clNx?=
 =?utf-8?B?ZnZLblljSlJPaVZqSW0rSDRkQUtaeGtzWmY3a3o3OVY3aDBoMEJJTU01U2tC?=
 =?utf-8?B?U2dacEp6RHNSMHZPWitjNTJscnJHc0JnRjlpeldEU3VLOXZ6TnBuYWxZd2V4?=
 =?utf-8?B?OGpvdHUvSmdET0pvR3QzZHVXbzJWczlTaGtXYXZZVExNeXNzRkZZVDdTVDZs?=
 =?utf-8?B?dE5RSTB0WlVHVG0vditQZUUxTHB3R0FGYi9wa1ZuaEJHVnlXbWY1UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ad979f-3f65-4c55-e71c-08de62d611f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 03:41:10.0695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mDGmi0ECGvTuzpqcfjJBZkzqQBdW7kVfmkam498kzOzvheBMmpOow7aPtqk4qL7UAtNkUgjPtDGV9vA72BBJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9449
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

Hi Badal

On 1/29/2026 2:39 PM, Nilawar, Badal wrote:
> Hi Riana,
> 
> On 22-01-2026 15:36, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume
>> recovery callbacks to handle PCIe Advanced Error Reporting
>> (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes
>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>> error_detected to request a Secondary Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback,
>> the device is queried to determine the error cause and attempt
>> recovery based on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
>>   5 files changed, 107 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index f6650ec3ab42..5581f2180b5c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>       xe_page_reclaim.o \
>>       xe_pat.o \
>>       xe_pci.o \
>> +    xe_pci_error.o \
>>       xe_pci_rebar.o \
>>       xe_pcode.o \
>>       xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/ 
>> xe_device.h
>> index 58d7d8b2fea3..81480248eeff 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -43,6 +43,21 @@ static inline struct xe_device 
>> *ttm_to_xe_device(struct ttm_device *ttm)
>>       return container_of(ttm, struct xe_device, ttm);
>>   }
>> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>> +{
>> +    return atomic_read(&xe->in_recovery);
>> +}
>> +
>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>> +{
>> +    atomic_set(&xe->in_recovery, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>> +{
>> +     atomic_set(&xe->in_recovery, 0);
>> +}
>> +
>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>                      const struct pci_device_id *ent);
>>   int xe_device_probe_early(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index 944f909a86ad..2d140463dc5e 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -669,6 +669,9 @@ struct xe_device {
>>           bool inconsistent_reset;
>>       } wedged;
>> +    /** @in_recovery: Indicates if device is in recovery */
>> +    atomic_t in_recovery;
>> +
>>       /** @bo_device: Struct to control async free of BOs */
>>       struct xe_bo_dev {
>>           /** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index c92cc176f669..e1ee393b7461 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>> +extern const struct pci_error_handlers xe_pci_error_handlers;
>> +
>>   static struct pci_driver xe_pci_driver = {
>>       .name = DRIVER_NAME,
>>       .id_table = pciidlist,
>> @@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
>>       .remove = xe_pci_remove,
>>       .shutdown = xe_pci_shutdown,
>>       .sriov_configure = xe_pci_sriov_configure,
>> +    .err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>       .driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/ 
>> xe_pci_error.c
>> new file mode 100644
>> index 000000000000..a3cc01afa179
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <drm/drm_drv.h>
>> +#include <linux/pci.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_uc.h"
>> +
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +    xe_device_set_in_recovery(xe);
>> +    xe_device_declare_wedged(xe);
>> +
>> +    pci_disable_device(pdev);
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, 
>> pci_channel_state_t state)
>> +{
>> +    dev_err(&pdev->dev, "PCI error detected, state %d\n", state);
>> +
>> +    switch (state) {
>> +    case pci_channel_io_normal:
>> +        return PCI_ERS_RESULT_CAN_RECOVER;
>> +    case pci_channel_io_frozen:
>> +        xe_pci_error_handling(pdev);
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +    case pci_channel_io_perm_failure:
>> +        return PCI_ERS_RESULT_DISCONNECT;
>> +    }
>> +
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +    dev_err(&pdev->dev, "PCI mmio enabled\n");
>> +
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +    const struct pci_device_id *ent = pci_match_id(pdev->driver- 
>> >id_table, pdev);
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +    dev_err(&pdev->dev, "PCI slot reset\n");
>> +
>> +    pci_restore_state(pdev);
> What is the significance of restore state here? In reset path any where 
> pci_save_state() is happening?


This is called after SBR and state is lost. We need to save the state of
the card to the state before the error occured

>> +
>> +    if (pci_enable_device(pdev)) {
>> +        dev_err(&pdev->dev,
>> +            "Cannot re-enable PCI device after reset\n");
>> +        return PCI_ERS_RESULT_DISCONNECT;
>> +    }
>> +
>> +    /*
>> +     * Secondary Bus Reset wipes out all device memory
>> +     * requiring XE KMD to perform a device removal and reprobe.
>> +     */
>> +    pdev->driver->remove(pdev);
>> +    xe_device_clear_in_recovery(xe);
>> +
>> +    if (!pdev->driver->probe(pdev, ent))
>> +        return PCI_ERS_RESULT_RECOVERED;
>> +
>> +    return PCI_ERS_RESULT_RECOVERED;
> 
> Is it correct to return PCI_ERS_RESULT_RECOVERED if driver probe fails?

This is a mistake. Thanks for catching this. Will fix this

Thanks
Riana

> 
> Thanks, Badal
> 
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +    dev_info(&pdev->dev, "PCI error resume\n");
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +    .error_detected    = xe_pci_error_detected,
>> +    .mmio_enabled    = xe_pci_error_mmio_enabled,
>> +    .slot_reset    = xe_pci_error_slot_reset,
>> +    .resume        = xe_pci_error_resume,
>> +};

