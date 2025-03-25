Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB309C36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 22:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA9D10E291;
	Tue, 25 Mar 2025 22:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTe8IcAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576EA10E291
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 22:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742940127; x=1774476127;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SJVtULcimbNEh9ICnbwOE7ypQrk2/9B3pGoHgTuFtyo=;
 b=YTe8IcADwmXHmmVybkyww/LruqS3HRIpQ8VguQLG84sde3CsbXS3fNPz
 OP88F8QA7ifUP9xJvPSD20ux8M3UmIW2N8RDLUCdxvvgkzS5EYGGiLEQw
 Peg+4/6litE+keVuWkWW4VvjbFGXV4hGGwEslqP+NDC9kMjDVQfHzMvaH
 i11A9ICTNFfwTfnmier5JWFWZsZASXI+iGA2zFkrjug0aq2qo0o8uB5jT
 wIv56s1R/ee2Dl+Ff+1IvI6F0NbV+ZKo96wgF0ZDKUywS7y6wIs7S2hW/
 ktnSHWU9n4BtQvZYvBi76X2XSQPzpDbT/u46rFZnK7WmLtkq44tPXxulJ Q==;
X-CSE-ConnectionGUID: n25b+ldQSkyqY/Lgt6aNZg==
X-CSE-MsgGUID: 52cbKDvtSce622tci9TMPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54413031"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="54413031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 15:02:07 -0700
X-CSE-ConnectionGUID: OJYCnXSDTXufyCptm5K/jw==
X-CSE-MsgGUID: jXjvtUFLTQqOpSXH9khjFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="129558249"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 15:02:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 15:02:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 15:02:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 15:02:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5bmASzLfkxXLar1YtHBHmsqFRztbpDhNS3X55TFlMAmd9stXFLZEGwEB2paKuqpy2JMd6PlAwn4umxGx/x24x1Qn1fb7LeLl69SafZioKGkmTeykLcv2LXY/N2jyc1HU2dq1lEu2a6r/Ku9Im45DR4WHti5QQULJM3b+AuKpR+2AP2wlMFJrLuQDdGsF1QOewj1eGw/VGAimfSwuC7i17nuznHPbQjyGE3zLScMdvgadRc9RKgHn8vOP2K4rZhi3ZmTVNKgqk6MyySKCl1X8EaIn813LGYteiY2FipxjAwZTP5TGPefYC6G1xPAHJh1GHeP4PsKGpIe/Wy1wxoSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCYand3cREmMJcFX1GrtDGTY8tYP6L+NOXrlsexngrQ=;
 b=uZ6+rw3HAFWv1vyKc6LJdAk50PAYs9JTOoCxWs3pjlCKwc3vYOauoUmvZ+5MwiQHzTP69m65j5EC2SN5lGQ9bRG4yrRkuas+auRjCnbC5AfFM1r/oqwMYmAbT6hO6Alk7qRYiCXlsS+GlbULSgOnyjQU3Fp5+dqAEqLACZyIIPk6ArTLa3vblpzaoOYZmKdH0dOZD+1OP/ARTN39zkcC2AIfD3GIbRqh54aaTmRFB6LGT7DGbrRntnK8Y5FAB3Lb7RhwSu+2fvxFV1rGR36YnNKklJrh96YNLRt9f4Xb0rSfX31aeRzU+RJcp3DQQUib+8hG8NmjNV1X2e7U6JRQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 22:01:49 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 22:01:49 +0000
Message-ID: <269b993d-2a22-4080-8609-66650a60ad62@intel.com>
Date: Tue, 25 Mar 2025 15:01:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/pmu: Add GT frequency events
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
 <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
 <b46fbbd0-ee96-4f00-9f6f-a00115feb32d@intel.com>
 <87jz8dhw0r.wl-ashutosh.dixit@intel.com>
 <33ebfe1d-5ac5-4985-8c8d-c1996e5a6d14@intel.com>
 <87h63gixq0.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87h63gixq0.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA1PR11MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: bab609fe-4d47-47df-5be0-08dd6be8a4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cndQS2o3QUNnaWtpck03WU5SMTc3c1FQRHhCVzZreEtoMGhFaEg3Q0tjTFJz?=
 =?utf-8?B?NnJNdzllbS9vZTFsUUFjYjJ2N2V1MkNXTXNabUtKRWo4UlBLVXRJU2doOTM0?=
 =?utf-8?B?K2VWV01HN2FwcS9JSFMyUXgwVTNXM2xlTENoSlIyMTdpdWZqRk91bXNqbGRS?=
 =?utf-8?B?Y2hIeDVBblhoOGppV01JMUdPYVJNSmhZUWtQcGE5Y3lvamQzT3l0YStuWm4v?=
 =?utf-8?B?ekQveDhJeHhMZHJZaE1qNGxDeVBkWTBFZUdoR0xoVUZZOVRteHpYQXVyb2tH?=
 =?utf-8?B?L21qS0NFSjJzNHBHN2RoTzBwWDVkNE1JcE15dFlGV1FTeGhqdDVNeUwzei9p?=
 =?utf-8?B?VnlaYjU5aUNLVDZNdENQeGJCbmtSM3Q1YU5MSytjZzI2bnp1eEhXekFxWldM?=
 =?utf-8?B?RnhpSGp2STVkVTRxWGdFV0dObFJQYUswMGg1YWJjNUFVd2lhOUtkWWZZYWRK?=
 =?utf-8?B?WUNHWU1OV0lWUE1aOFNhTGtpWXFKVUcxSUFMSjE0bUVnb3FDOUJuZE50cGlB?=
 =?utf-8?B?V3diQndScGo5L2ZCY25oZngxcEoybzA0L01VTlRGbVRwbm5IR1lkaUovSHRM?=
 =?utf-8?B?dEtpeXNuN3lQdzRQM05lYWsxTE0rUlZhNDZndE5lSEtpQU9OU2pEOUk0WnhH?=
 =?utf-8?B?a2VaTDJ6VEUwcDV0a3BEcjYvTWJBZ3BXeGQxQ3p3eGNSc3BjdzBSQ0c4OWVO?=
 =?utf-8?B?Y3FlcmVLalZpek1mV1NVNXhvYW5tMVF5djdGYmJMa1BrdnNSdk9qQTdFVmhh?=
 =?utf-8?B?NjhvWTJyY2JNRkNjNmRoWmx3d0paR0ZyWHpvRjZPU2ZCRTBNb0hQUHZwbWQ2?=
 =?utf-8?B?MWVveFJXeSswNnU2VG1rOUtrMnRySkVjVkhRVVlrUE9OSW04Rk9JNlk3cndH?=
 =?utf-8?B?VVl6aW5HZFl4QktDNWNkc3lKYnU1azludEFxMlNwUGFpK3BqcmNiZkx3N2tK?=
 =?utf-8?B?b29zaXZjaEhOc21XWFpPaWVmSDFGQVBzVjR3SldrQUx2NUJnVnNGeGoycThE?=
 =?utf-8?B?dFVXNWp3a2ZpVlNycHY0UDVpV3BOMWNjbHdrSk9qWXJIOHpEaEYzK0xIdzlO?=
 =?utf-8?B?S0ZtbHMzT0RMSmVsdEJ4dng2VTdydWs3V0U4QzdmRktVZVJ3Z0Z5MCs1WGdw?=
 =?utf-8?B?UngvSmRERWVOWkd1aWZZTFpKdUptVFpKNElRUmJPc0lqQ0FoaTNrZFZ3dldT?=
 =?utf-8?B?VHhRUEJoLzFMdWlVVnNMVUNsbGZodG8yczZCZjdWRXI0WnM3TVloeUx1U25q?=
 =?utf-8?B?bFRKUy9oVmNJc1Q1SHRSdlh5L0R2UGZhQWlTSXlyR3VUVkNwTUxhV0cyblJx?=
 =?utf-8?B?QzhCRllxMjlFVjF0WFQ5cmZiLzlEekgwOStQRlhMZGxXMS9qbEFPcm9XTmY5?=
 =?utf-8?B?QU9rblVCR0o2c3QvNm5LcnFlUEI5Z0YvOG5YK01VdVRkcFFUUDNEb3V5bUFY?=
 =?utf-8?B?dzlGRC9ZemJnQVRCMHNCWWhYM0draEt3L3psbndNdjAwSlM4aXZMSUNOb3BC?=
 =?utf-8?B?QjdMSkkxZW1BNjk0cWpLMTZEdE8vSG5hcGtFSjNzbEdsNVh5a29DTjV6d1V0?=
 =?utf-8?B?RFJPT2o3aTZyeHI0ajhDdm5ONktUdW9pay9EaEF0OGpqa0t1OFVSWUpscFFj?=
 =?utf-8?B?bHZvYlgzQ0hwQWhlcG5uM3FiTmhlazFWRDhsbkxGT1ZOakpqNUJETStON0RF?=
 =?utf-8?B?MWYyS29BTjQxTGpjNFNBUCtSK0RXS2JXYTV3eDFLUDhXNmpHNko0RDR3T3ZR?=
 =?utf-8?B?S0tKYlpWZUNIaGNOcEJUREhIdkJzU21GRnNhVXBudGNPRXlYMGFHTHVXWHVV?=
 =?utf-8?B?dWpkamNJS1dGS1FtYnNaZ0tUMjRGSW96blorNWJnUHRkYlNaY2F1ajNISE52?=
 =?utf-8?Q?/BKt1F6djK13T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVprbWk0dmZSbHRWeC9KSUU1OHhod053MTJIUmpkYU9BRnNkVEF6dXYxUkEy?=
 =?utf-8?B?RFduZStPRVhBbTgzZGxoTHp3QS9MeDJDRjdzSU50UnVKSnFMZ3h2MnJqYmpq?=
 =?utf-8?B?UmFGd0xTWUxpTk5Va3ZzNTY2Uzg5OXlIZmhiR1Vad1ZMZnU5RGhqOWsySjBQ?=
 =?utf-8?B?ZTM4ZXcrVENmbStnTENqUXFMVktPeTdTOHJYUlhldGFsR2lxbDMzT1p4c21n?=
 =?utf-8?B?cXBDdFZXMnE5MWVtY3ZsMDg0Z1dNaWRXSW1YRXBMOFA3amVHS0taMDBxUGl4?=
 =?utf-8?B?THFEZyttVFF0UzFmMXpKcStIbU5wLzJJZHVsSWlWQk1lQ0RGYy9jV1dKSTlF?=
 =?utf-8?B?OE1xZDFoZ2lkWU1Ib292NkZMOGlaMitUS3MrczZKL3NaSGhmZmxqS200Z2lU?=
 =?utf-8?B?cGJLNVhBODF6cFV3d0kyUWphbzhKT1RLUHBGMGkvRjg0dUpyMENPS25DS2VC?=
 =?utf-8?B?bk9SaG42ZGFDb1kxOHZ3UXlZR3Z4TXFWZUNqRkpzUWMxU2l3TWRmOTd3S05u?=
 =?utf-8?B?bDY1V1ZIQ2NWL2JFZDBnVlBmQklTRXdjcENNN2ptRE9CV20vVnVmM0VKcDJH?=
 =?utf-8?B?emJRbW5sb0FKWVNwOVI5c2F0QloxY0FxMGRab2tVSmJVYjhHVHhGTkhFdVp4?=
 =?utf-8?B?VlUwRGpYQk41QzJpanp2d3hVU0pYUWpnMDJuSi9kY2V6U285N2xHNG9WczJ1?=
 =?utf-8?B?Q2NKcXNKSkViK0I1SDhqYndadnNDNU5TczNlQ0VkeVlZYW1ROGl6UHZqS1R0?=
 =?utf-8?B?dExCV01IR2s4TjZyQTNJd1NGV2VmZEFBaXlrQ2lVZGIwUnFMR293UnJZS09O?=
 =?utf-8?B?WGhDNkRmdVBqYVVWT0EwNGZEYjhWNkFvcHpIbHd1aHZ6NTRvRDI5SEhlYTR1?=
 =?utf-8?B?SU9SV2poYmk2THhOYWJHZzhrNXBnVk9IdXVoVWhkTU9QdU5qbExYVHR2Qldw?=
 =?utf-8?B?TWJhVDRWUU9icGtYNkdRaWR2S294c3BNUDR5VDBSb2RIdE9ucWpocmRVdVJF?=
 =?utf-8?B?WisvSjFtSXhpMlpObDVxMVJPWFhMT2I3NmZzT3FhZXA1UThTZWxScFdrSTQv?=
 =?utf-8?B?c3JDNVU4N1NXSHJTL3lrRnhVRkgrVUNhVUFTMFRtMFFkYjZHSFIraEN4V1JZ?=
 =?utf-8?B?dzNlTXl5M0ErekJSV3gvQjZ4ZDVsd0RPTmRGc3pBRDBsY0ovRFNPQi96eWJ4?=
 =?utf-8?B?aUw3V2xFTU1HTGNtN05XYnl5NEREdTQ1OFhkbkVBSEJ6UXFUak95TXJ6RGxE?=
 =?utf-8?B?WnAvdTdNNlJLY3VCbGtNaGVGcm5qYzJsL2IrdXpSTFcxakhtTUNBYVpVT05G?=
 =?utf-8?B?UHFOeE01dU9QUFFKQ0I1a29kV2M3MnFpNVdra0lyc2NzV1phQTFPQzFoNVB3?=
 =?utf-8?B?SHB0eDJqMlNMbWRxYlpyRkM2V3o2K2FocXZjaWxLRExvTW9hdXdwUWxHV1JQ?=
 =?utf-8?B?UVdBVnhTbU5QUk1xVFJvK2k2WTk2YnFmR0JnR1JlbWY2cGttRTJCeU1tWUVn?=
 =?utf-8?B?L0lrbjMyQjJ4S3R6TVpWS1NHdWZlSUVsQ2dSNGRpaDRKMUxkSHpuSXAyUXJO?=
 =?utf-8?B?L0lLbHMyVXlLNGZTZ0VybXd1bzc3VVA3VXhTQmNLK3FueDBCemVObzcxcXhF?=
 =?utf-8?B?QmFUYXB1MHE2RFNSdGFlUTE1Ui9zZjA1a3dLWngwdHlPSU5keWVIeWplRTBa?=
 =?utf-8?B?MmtXY1dGVFpaTU5OaFJVdUszYzRYUlR2cmg1enErVjRDK0o4Nm5wOGFFZ2hK?=
 =?utf-8?B?WkFVMHN0TWNqUDd2MUVuWHo4NlRoRnZCMkJ6clZUbXplRjg4NHFwUk9PTUhn?=
 =?utf-8?B?MlRVc09UWHJ1eWhnZ1lRNWtNMUdJc1BNNmpEVFJNTTNBV09SQlBWTE9IZVJR?=
 =?utf-8?B?S3pJZ0NHSktUOHU1WFZwNGdLSXhabDBqdjBZeFpyejJrbUV6ZHZ2aGNGRytj?=
 =?utf-8?B?cXBCaVVtMUlmbnF0ZXd0RGNkbDEzbDM1Y09yYU1BT0Z2Yk1kWFZ6N3Nya2hH?=
 =?utf-8?B?ZC9ZREhrbkIrUWZMMEZ2MnVpK3gySHhITk5WdCtJSGtrb3FZZ3lnUjhsRU8v?=
 =?utf-8?B?MVorNmRXbWNhaGtsaHpXZU43RzFkdUxaanZYYXc3OWNuRDRVdHFGaUNCWm50?=
 =?utf-8?B?dVgrSllvak0zWGdrQ0RzWlp3WTJtT2J0cGxFS1pPdjZqbXljM3c3RVVEakMv?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bab609fe-4d47-47df-5be0-08dd6be8a4a3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 22:01:49.7213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0403YFb0fwndeH+nsJHoJ5VpideJ8YBKcHVa3Rnd9rzg2bB0Fb5z1lNZYDOscBAchglyVpOBR5G7I0fGxydYHEdGk+c6TDzClFeNr4VQmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8594
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


On 3/25/2025 2:53 PM, Dixit, Ashutosh wrote:
> On Tue, 25 Mar 2025 13:33:43 -0700, Belgaumkar, Vinay wrote:
>> On 3/25/2025 10:15 AM, Dixit, Ashutosh wrote:
>>> On Mon, 24 Mar 2025 19:37:32 -0700, Belgaumkar, Vinay wrote:
>>> Hi Vinay,
>>>
>>>> On 3/24/2025 5:18 PM, Dixit, Ashutosh wrote:
>>>>> On Mon, 24 Mar 2025 16:24:02 -0700, Vinay Belgaumkar wrote:
>>>>>> @@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>>>>> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>>> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>>> 		return read_engine_events(gt, event);
>>>>>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>>>>>> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>>>>>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>>>>> +		if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_gt_freq))
>>>>> This is unconditionally taking the forcewake and waking the card up just to
>>>>> get the sample. Do we really want to do that?
>>>>>
>>>>> So if we don't do that, both the actual and requested freq will be 0 if gt
>>>>> is in C6.
>>>> For actual frequency, the register(0xc60) does not belong to any fw domain -
>>>>
>>>> GEN_FW_RANGE(0xc00, 0xfff, 0),
>>>>
>>>> HW will report 0 when GT is in C6.
>>> Yes, no issue about act_freq, see commit 22009b6dad66. I was referring only
>>> to requested freq.
>>>
>>>> The requested freq register is a
>>>> shadowed register (0xa008), so that will not accrue fwake either.
>>>>
>>>> static const struct i915_range mtl_shadowed_regs[] = {
>>>>           { .start =   0x2030, .end =   0x2030 },
>>>>           { .start =   0x2510, .end =   0x2550 },
>>>>           { .start =   0xA008, .end =   0xA00C },
>>> So this still doesn't make sense because:
>>>
>>>     1. The fact is that xe_guc_pc_get_cur_freq() *is* taking forcewake
>>>     2. And that is in accord with the following comment in i915/intel_uncore.c
>>>
>>>        * Shadowing only applies to writes; forcewake
>>>        * must still be acquired when reading from registers in these ranges.
>>>
>>> Also see intel_rps_read_punit_req() which is called from i915 PMU
>>> (frequency_sample()) and uses with_intel_runtime_pm_if_in_use(), so we'd
>>> need to do use the equivalent in xe.
>> Hi Ashutosh,
>>
>>    As part of a previous decision, in the Xe PMU implementation, we are
>> doing a runtime_get() during pmu_init for all PMU sessions. So, device is
>> going to be awake anyways. In this case, it does not make sense to just
>> read the register without a fwake.
> Even if that is ok... Let us take a completely idle device. What should the
> actual and requested freq's be for this case? Both should be zero, correct?
> Now, what are we going to show if we are taking fwake? At least the
> requested freq will be non-zero? Is that ok? Or the requested freq will
> show zero even if we take fwake? Thanks.

If we take fwake before reading, requested frequency will not be zero 
even if GT is idle. HW always retains the last requested frequency in 
that register, never zeroes it like it does for actual_freq. So, showing 
the non-zero value is the correct thing to do instead of artifically 
zeroing it.

Thanks,

Vinay.

