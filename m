Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3976C87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 20:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDDC10E096;
	Mon,  4 Aug 2025 20:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVKeK50z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4AB10E096
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754338530; x=1785874530;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gKqRvUdVwXCoiysggPx2zLmg6DO52OPWhUgUSFPK/mM=;
 b=SVKeK50zg5cgALVcGgJ4IltrKA3qwnSQXS/Z7V8YLzKJ/Xk+S26gGiuE
 /TRtGc4MpuavbKM7MpSFe0j8x0V7MrcMi7tUF/kTwvEMO7io7oqeg5WRe
 eDatkS58ywv8IH0jwyB7u5f9Y/wsWrpCHuvr8vm7akoibahVR7VHtjz25
 4MLMf+5RzuUqTgiwsK8+oF3yFVzkSYk+QcnVuJPUtymrQ8qMwjDFJJ8sg
 OI6Al+HExRQHCXIx4N7PHK+w5BQy127RPjQRAoKqaC600G0IpeJERuTe8
 XrY7EwMFW3fRbBZMItbDx7C5w7q4xC4RlO2qFNfwiQqzO+VauEtJBelCD A==;
X-CSE-ConnectionGUID: ZNMsW6YhTTmcn3laJi5mPA==
X-CSE-MsgGUID: wXeS+K2SSUCzFyb7s/aScA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67684849"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="67684849"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 13:15:30 -0700
X-CSE-ConnectionGUID: jr/igugGQPGf5J/qwADcSg==
X-CSE-MsgGUID: gXHP/qAGQSOwf4wrNbI07Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="163934960"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 13:15:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 13:15:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 13:15:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 13:15:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hh/AjcHyDgbiEPSt7nij6Rm/VzAvIW6QG6wsX2JhyOnYIeVbOd/lAF1/VNo9Ss0uoGWV7R06o8gGJeaCKUqJlX6g0nRCUhtKuCidrIQP2cV/dTv6Ym2EGIFYn88WEWankEs5ojYMU/Oh0IUufbxdB4yS0XsujXMfOdRepO1JNXWezoYSsi/tC0Jz6fdwFqKSi7MIW2KOxNEna3MenEPUt4UTxTMX8B6J5NFGM1fT1L0h2JVDiQv8namldA07wC5goFfmaxzO8QALoQ8D5wMbEM0YV6N9Zy8tozNB52e645lv0eRG/8pYpBXQVzWvFI/JqasN9O2bEoOidM525tV1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvWIEuYfTtWheT6O1bLQFLBY7f170VgcbXiNNDsBrHs=;
 b=ZLkHtX19Y8ZUGiYChB3HuTvxl7rahtgmIjTfQixykW5VpW1eNhTJStimA+46zQtign5y48JQraJXJUvMqIKFwkXwAjqG+SxCO9vmCF0xX1tthmtJFOt1LB47tbtNcZZsGFrAIppcJu1xilOSaRfg5R/hihlr9AybeqxJ/U21QIn+5vmqi4lzBsyyZrPuETSeq3XuWKyqKXfDCkwGesZHZ6h2TtTmIs6rENskd8D5lBfyNrm+3hY44bzFW8YI/SUaKRQIc3HxFt1tkaKjPhOwUAOTyAf/KQVZW9wWNa0jCoq+313wIOhjSNKaalJGOdbqhjNs7dsNfgsHjp60Z72DxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 20:14:44 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 20:14:44 +0000
Message-ID: <b4662514-7a7f-420d-9d80-6b52d84e2e27@intel.com>
Date: Mon, 4 Aug 2025 13:14:40 -0700
User-Agent: Mozilla Thunderbird
From: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v6 6/6] drm/xe/guc: Only add GuC crash dump if available
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-7-zhanjun.dong@intel.com>
Content-Language: en-US
In-Reply-To: <20250722013553.1266218-7-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0142.namprd04.prod.outlook.com
 (2603:10b6:303:84::27) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a952020-dbdd-4df5-1e3b-08ddd3938d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0dXNnhscEI1OWdJVEVhTDF0eGFCalExMkpvVXFUL0grRHI2M1hEQ05nbEV1?=
 =?utf-8?B?NjEwN2J3dXdmWjJKbTV3aU1oRldJSUN5N00xalZIK1VsRDI2YWJKTHNlWTVz?=
 =?utf-8?B?TzFOcnlReVFRT3NpUEFxcE96c2FRbnBueFowYWFSdVBLWHdGQnorMWoxcnpG?=
 =?utf-8?B?SnZ3cjVyaHVva0VveVUwVk9rdWRYc25ia0tZSzYxbWw2NFZSbmVkL0NSKzV4?=
 =?utf-8?B?ODk2TlVxVHAxZmpwc2F5OHo5ajlvUDN5dmlGbWFZRWVRWU9kbnVSd0ppdStV?=
 =?utf-8?B?OURYSW5oNGNvb0xhRWd6VmZKME9UV0Yyc3ZTY1NjWlBudkJyUDZOZ2xRMU5m?=
 =?utf-8?B?TytSZ09vcWc3c1VqQ2Qya2hLMi9POHQ4NzdNNEJCbnBqeTcxNVNSbGNHTWU1?=
 =?utf-8?B?REUwL2ZEOFV4TWROQWs0a3pDTzVxdVBqV0xMRUhUMFAyK3BiVVNkWE5zeWNT?=
 =?utf-8?B?NlpXaGJTc2Rtcmk4bytEdkFkVkdCMC9YNmpaY0lyb090aDlRL2JPL1RJZ1lU?=
 =?utf-8?B?ZWF2SGpKTDlkbGpKVi9HYzhDeGlwbnRrVWFtQW85WmxmOVpPMGxlK3V4QWFv?=
 =?utf-8?B?bmxlRitZaTJYUlk5RkpqYzhCV29DKzg2dkQ1UEluTVFsMHBrYTI2VzVOek1J?=
 =?utf-8?B?TGVzR001cnRiR0d6eWxNKzg3QTRmSFBmbXdFOWV1eDZuQi9mQ2Q4b21kTzJ4?=
 =?utf-8?B?ai9vaXlFNUFVRVVsT3BYVjZET3U2RFIrN3ZTL2RyMVFsbThzZXNERVdmaHNQ?=
 =?utf-8?B?Zi9lUFNOYVZnTDdxcGYyL2Vad0dpRjJGODIrVE9oSno4Nmt6VDdJd3A4WTBT?=
 =?utf-8?B?YUV2Y2ZtUjM3eXlQTVFhMytLZWFVMDA3VWF3YTBZeWIwK3VQUW9tVThmSXdK?=
 =?utf-8?B?Um80T0YvR25TWE5ybjRCWkVZSE90RzEwb1p0WWZ5czBkTnZpQk1sbk9Bdi9B?=
 =?utf-8?B?QmRvN3BvcStnOWZWUzI1K09nSzJVbGRPRVZKaG55clppMGFhNkFGdm5LNUta?=
 =?utf-8?B?VTNrR2cxeUZKdW5ITlB4cVZOVWhTSUVzMUtySXhSMlJxdlZLQ00xRG8yekxp?=
 =?utf-8?B?NS92aDl2SHEzWjJHTjhmczJ3TkY1K2F1aytyNkJJVGdFeGYvcG5LR3V4RDYz?=
 =?utf-8?B?MkR4Q2NlUXJuQ25URmNQVjRVdXA3VXB1TUdObkhmUm44cm1XVEFkc3dHRnh5?=
 =?utf-8?B?UjNTMXlzWFUrVFZkZ3BsRTBicGcydXRlYm5sNkdBWnc4WU5lZHRIWnhSMmNF?=
 =?utf-8?B?RGVUV1hLMzV0WDNzL2RTbGp0cFZkKzNEOThwRkdWbGNvOG5NVThjTTB6K1Jk?=
 =?utf-8?B?QVJXSlVjSHVwL1JFRjFESGhOd2tlR0hkeG1qWjQ5UFllcE13RE1uNmxhWG1D?=
 =?utf-8?B?R1pMZlNLN1A3UkxodjFFUnpzNTByYmxzOHpyeEZKc0oyNXNGM0lnYWUrTG5S?=
 =?utf-8?B?eE96dGt5VXJEK0lqbzlVSHBLenRMTGJHNGlhSlJ1SWZLcjJEZlFBRFFtU3Bx?=
 =?utf-8?B?eFptbSs5TktGMm9CRG9OWFViVmhSM3VTRGQ2WEpvMWhBdDh1NG9ZRlFhaXdr?=
 =?utf-8?B?TEFXazliT2tQUTlOSlNWak9WN29ydzBjU20zSDlPM1Nmb1lhWmtaeU8zcjN6?=
 =?utf-8?B?bEtDQTlIVDdORWgrWWpUSjd6Ykd3SnZQQkVEcS9Yb2FjYmd3bkhkWllTaXVk?=
 =?utf-8?B?VjZzaFlmY1ZINnNmUzNuRmVJNTF0NXQySGdRb0ZpVlV2Z1hlWTJKeldDRkM0?=
 =?utf-8?B?NnIyYW1OUEdaT1hkdnNFNDk5aVpHeE5NaXVCM1djVVJDOFdWTGNNbXJ3ZFhC?=
 =?utf-8?B?ME1xWVhnVXRYZ0dSc3VCWW1ITWl1UXdEenJyd1crMW04RHphWlkxbFMzTkVK?=
 =?utf-8?B?VHpRYlFCQmNYUll2MENvUkwzazZwWlFsbHExUUhVcEpqbUFrQy9rS3NxNE0z?=
 =?utf-8?Q?qpMj6XmtEu4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEptekVKNjk3T3d2REdKMWxtVWVHZ0tkNERtRy8xaVRlZWZTWGJNU1dxd043?=
 =?utf-8?B?ZExuZUZ6bjdydlNIRmUweG5KbHZqc0k2YWE4Nm92Rk1xSzlzYUEyeEtVTjNJ?=
 =?utf-8?B?Vkt4bU9qdXFLMzBOSDZFTEd4SU1kSGdzWURKaStoR0M4ekxKSVhjempQdDU5?=
 =?utf-8?B?V0JIaC9pdWZFaEczSzlCQ3VKUyt1V1NhNnFkajMxMnVNNU5VeVJEZExZV3U2?=
 =?utf-8?B?YXZEclZwdVE5VExwODlTSTVUZEkrYjlVMC9HdmlDWjBXZGVyQWd5d3c2RDJK?=
 =?utf-8?B?TFdSdnpGZ25DWUYrRExWUHFSTUZLa2x3aGpkcGZnVFd4MVo1US9jaG1EaStW?=
 =?utf-8?B?MDlYVUlkUWVHZkFEYlcvNXk2ZzYra3NuR24yUEhBZUpxdUUxZEtDYTZ0MG1N?=
 =?utf-8?B?VG1pQ1dFUFltWkFPYWdJbUJJVURNSDVZNXU0eklVUktSWHN6YmtubXlxWHJK?=
 =?utf-8?B?b1NnWUhEVzRzdWZ2Z3U5NmxtLzkwNG9ialh3anBLMGptTkdXZlNGZ1p4enhw?=
 =?utf-8?B?c2g0V0dCNUpZTVVoRVc2c2lyai9HNFRYRkJIN0Q3Y2FCUU80THdzaVE0UE4r?=
 =?utf-8?B?Y29OcnV6N2YrVWRpTURQdFV3WXVsT1RlYktwUllZK3I4OGh2ZG5yV2FpQldN?=
 =?utf-8?B?ZG15Tjl5VnlhdjYvSnBjb25wUUx0UW42NzBhaUtXS0d3bXhzUkNjdVd4TGFz?=
 =?utf-8?B?YzNDMC9sN0hqMXNOUG1PR2QvWElVZFRqT1hTL1lkZC9QaWJZdEFkaEIyY2FR?=
 =?utf-8?B?V3hXUlRaY2VFVElHeFRxSEtNYWVyS1RKVHVuVDZhcHIwakZTZFZ2cEdrREp6?=
 =?utf-8?B?QnNQdkNodzRGUlk0cnkvT3I2Nm9EZ25DaHhoVDJQc2hpa1AraXdhSVptWmJV?=
 =?utf-8?B?b2VPWFN6VVlTbkdxT05NKy9IU0I1UUlQb2pjUVRTTnlNYnUxQ3NrVXozNlhY?=
 =?utf-8?B?YzVMbkJLeVRQVEU4Mm5NMkYvaFA5bWVGbm96U0d5eTJVUWFOWmt3R1NsVW9P?=
 =?utf-8?B?cmV5Q2dtMjhMODdkbXdMYlhOWk1rUDVSL0dYWUVyWnh5bDZYZEtkOUFLZmtw?=
 =?utf-8?B?dzYxT0RtaW5pKzN1dnZsUlR5S0pFSlFMYkNaRXpBVzYyL3NjRXlPL2k2TGor?=
 =?utf-8?B?VHM5MFp6TldNZFhJS0pqdXZSY0dQZUFqRjBkSXZJVWcyL1BSY3Nld043TGti?=
 =?utf-8?B?dlVKcVZESGxzbE12MllpcWlmQUZmNjZLeUNicWRRWEJZT0w4TDVsaTJiMnVa?=
 =?utf-8?B?YVd1M1hTYnljQTJqdmJrOE4rSDhQTVdidlZxYXFOeHJsM0UwTXVRaFMzK2tl?=
 =?utf-8?B?WDRrMzJyVzMvbEtWdE5BekRmRjJ0N3h0aWdHRmlUM1JWa3JXbWZkSWpBZHJi?=
 =?utf-8?B?dG8zcFZFYzBIWEdFY2NnVUJJZ09CREpjVDRQeGFUenFtblprNHJERFFQanZE?=
 =?utf-8?B?eDR1WGdkVkQ4Sm4wNTloZTlKYnA3S1ZaNmtENlh2RkdGNUVlSEdFSGwrWXBk?=
 =?utf-8?B?Yk5vMUpkUksyNzFOc2RUdFBEL1lRK0NabVZhYXphWnRGQy9vaUVuRHlxeXkx?=
 =?utf-8?B?bm1SNjNEYkpva2I1MzE1VWxQUk90TXFKM1YzOU43VmJ2QW00Zy9oUlhPY1F6?=
 =?utf-8?B?UThwUzZodjJIclZqSjUrYVdBamVWZTBSYXcwUXZMVDhXVks3U0R0a2cxbnFi?=
 =?utf-8?B?ZVRjeWoweWIwbFdKNkJvNHRpTmgzYzdETzVIck1UL3FmeGZQOXhzeFYrNzB5?=
 =?utf-8?B?WnNmOE1GeFU2QlF5SHVnL3BTY3REQ3E0SGQycW0wWjdnZllsSy90RHNXUit1?=
 =?utf-8?B?cTVFY0VCak5PN29scFczLzVTSkM1Wk4zaCtTWEVnTW1PeFRRRGZaOWdZMmlS?=
 =?utf-8?B?WXBzOW16Z0g1QXFpYmVjejV5SEFHME15UGZ5WXB2dVdWMEkzRlZtVCszWFg2?=
 =?utf-8?B?TC9ER2pOQ2VrSlh3TE1JdjdEd2Zkd2RGVEZLK2V6azgybGNqdnQ4c0ZHQkEy?=
 =?utf-8?B?OWlxMkVuMnFIQUJoK2tPTEtlK2MwQ21qUzl1VVdlK3k3RWFiWjl3dGIrUGJS?=
 =?utf-8?B?RUlPSDlQSWFCVXRSNXBycHdmczZLOHcydENGTmplZjFVS1NpRGczWkVwemZH?=
 =?utf-8?B?dTZJeWYvS1NpVk9nd3VBZ0gxeWgwMFZ4clhvYVBSMW81VkZZeXhWWENSZ05z?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a952020-dbdd-4df5-1e3b-08ddd3938d8f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 20:14:44.6573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djEeg7pfAbFoFRNw9aRvRCkEgRY8V1ZQZNx1YskHDj5fbhNP3ak29lUoU06wFY0oPU/5bQhEq8hPaBYlA525u5zE9CXaSW6DcFYnMAJHFj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
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

On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
> Add GuC crash dump data empty check. LFD will only include crash dump
> section when data is not empty.
>
> Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_log.c | 60 +++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index a8910211c579..f5f31f15e7e3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -502,6 +502,65 @@ xe_guc_log_add_log_event(struct drm_printer *p, struct xe_guc_log_snapshot *snap
>   	return size;
>   }
>   
> +static int
> +xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
> +			  struct guc_lic_save *config)
> +{
> +	struct guc_log_buffer_entry_list *entry;
> +	int chunk_from, chunk_id, to_chunk_id;
> +	int pos, from, to;
> +	size_t size = 0;
> +	char buf[GUC_LFD_BUFFER_SIZE] = {0};
> +
> +	entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
> +
> +	/* Skip zero sized crash dump */
> +	if (!entry->buf_size)
> +		return 0;
> +
> +	/* Check if crash dump section are all zero */
> +	from = entry->offset;
> +	to = entry->offset + entry->buf_size;
> +	chunk_from = from % GUC_LOG_CHUNK_SIZE;
> +	chunk_id = from / GUC_LOG_CHUNK_SIZE;
> +	to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
> +	pos = from;
> +
> +	do {
> +		size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : to) - chunk_from;
> +		u32 *buf32 = snapshot->copy[chunk_id] + chunk_from;
> +		int i;
> +
> +		for (i = 0; i < size / sizeof(u32); i++)
> +			if (buf32[i])
> +				break;
> +		if (i < size / sizeof(u32)) {
> +			pos += i * sizeof(u32) - chunk_from;
> +			break;
> +		}
> +		pos += size;
> +		chunk_id++;
> +		chunk_from = 0;
> +	} while (pos < to);
> +
> +	/* Buffer has non-zero data? */
> +	if (pos < to) {
> +		struct guc_lfd_data *lfd = (void *)buf;
> +
> +		size = xe_guc_log_add_lfd_header(buf, GUC_LFD_BUFFER_SIZE);
> +		lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, GUC_LFD_TYPE_FW_CRASH_DUMP);
> +		/* Calculate data length */
> +		lfd->dw_size = DIV_ROUND_UP(entry->buf_size, sizeof(u32));
> +		/* Output GUC_LFD_TYPE_FW_CRASH_DUMP header */
> +		xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
> +
> +		/* rd/wr ptr is not used for crash dump */
> +		xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
> +					     entry->offset + entry->buf_size);
> +	}
> +	return size;
Can't help but think that this is all way too complicated.

The crash dump buffer is never going to be more than 1MB. And that size 
is the smallest we can allocate when using large units in order to get a 
larger log buffer (because the units are shared). My understanding is 
that the actual size used is only a few pages (currently working on 
getting a definitive answer from someone who knows). So it would be far 
simpler to just save the crash buffer to its own single, contiguous 
allocation in the snapshot with no chunking required.

Then all the above complication disappears. You get a simple "for(i = 0; 
i < size; i++) if(i) break;" to check for empty and a single print 
buffer call.

John.

> +}
> +
>   static void
>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
>   {
> @@ -522,6 +581,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
>   		return;
>   
>   	xe_guc_log_add_log_event(p, snapshot, &config);
> +	xe_guc_log_add_crash_dump(p, snapshot, &config);
>   }
>   
>   /**

