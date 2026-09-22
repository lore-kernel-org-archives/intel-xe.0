Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0880EC982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF04710EBF3;
	Tue, 22 Sep 2026 08:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUUO/FmS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8920A10EBF3;
 Tue, 22 Sep 2026 08:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790066766; x=1821602766;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a6snbk6XAy9TjvvpUAr9ZS4fNwEE3lLjeIw6MGP9Dk4=;
 b=BUUO/FmShWv9HrShGE9YTOQ+RWVc6HDuAieMZLwuHDnJC0DzypjYwwzz
 iBlwhdP1n2fAdKanYjegY0xu7DhXq1enOtA2lZ7x1C6M2yGyOyAi5Pe3l
 uXuqEc/+ndXJEaPwqJw9KHt1H29LZJ/80CkdsUg42RXTGfyIyxlMyEnuC
 n3BC4Iyo7auP1awD+ebufs2uZn95XN8YGZa4SiN3JGL+rj2qwiIfT/dDl
 G47lvISNrZw+cHoXu2ieEAGdAtrUqpemssAy8EIstU84zuUDyPZBlkxOa
 wQcg/+iIOYUR2p8q8KpvVfMIFPTJRsJ7nQ9qJnXzY1ba+uPs9oI/f0Rhb g==;
X-CSE-ConnectionGUID: 4NnGz/B8S6G83pksp0HsbA==
X-CSE-MsgGUID: 01+IlP2OSHWZCVQ1w/D+yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101999584"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101999584"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:46:05 -0700
X-CSE-ConnectionGUID: XMoIbs2lSV2bsDmvUFjsog==
X-CSE-MsgGUID: 5fKmS8PPTUWdsfESSeA6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="271584629"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:46:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:46:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:46:04 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:46:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obfkG5uOSn3rQUuP1uN1TiYfhAKuyDBs4gHD6/CbCJFChCczx5SrpuPJDlD9c4H3lHbftX9/tuTufzkEUy9tviPYK3xqpdZ0U8wSXLIdXPw7Lw8AJL8dF3fQnuDhrOn/Itm6Nobxtlo8OoXGuWcKcuSvZgWNlcQ9+cNEu9SvzFKV9ityzA4VpTk9s5g7iNJUDfQj6vT27Ts5/ZL1rmekQaBE3Bh9r9NWeJJdjwE3HdaybVFimPCeR2D3ZEFzXhOKNipWYbfY1StlR5sw0SU5qRxfaPN4TLsANdW1nJnb5X2tiGuF2kqtj3M+1JC3HRODH94z++3Rq2klOqeiPCEgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9xsxAjbXAluV3NbvG+Bmm58bPSrWVjcSqMNx+ZMKu4=;
 b=nzFBLyq0m5Dlym7EWKUTZ8n9nmh/UgSgmFtg9CAicvEs6wiyC6irpq7wDI3xcRlxuUWcmug1Sf6bQhSbyKRG7zhuHsnmYTpkBXvEnDfZFxS/LbydaC1J0JRd+ZrGBPJB1WWGOoAXyxLFHIKrOrRh75lH9qogkoGxNuvUiWUmn/hjVuQuwHt0ADwXzNfoK1v9zRV3Lde2vJQk0wSzHqFHJkqN/36a45e9Fke/6iJ9XsyX6/Yb1bkZcHUMSeOPRnXMN2msdcHx++Cg0RI1/INQMZr61QixKxRBNE3ASJARxf+4hJWcpmZ263PJOwqo5PtUqocRAl0ckwfhA797joivvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 08:46:02 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:46:02 +0000
Message-ID: <0b04ce6b-f512-423f-83f7-fd879d51e5b5@intel.com>
Date: Tue, 22 Sep 2026 14:15:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/i915/dmc: Harden DMC firmware payload parsing
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
References: <20260907171856.1484854-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260907171856.1484854-6-dibin.moolakadan.subrahmanian@intel.com>
 <DM6PR11MB37876786D5D1E164ED8B0095B2872@DM6PR11MB3787.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <DM6PR11MB37876786D5D1E164ED8B0095B2872@DM6PR11MB3787.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0071.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::10) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a39163-13d9-4059-3a3c-08df1885ee61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: js7J3Mz4cFMZM+VoSQNtFAJftdTsihTEFQzsoU0YHQmiAfI6VNpYObOd5DVh7nYPPaW4AC0blmZG0DJsGVWvBy/DHjngm6rUvS1Ta5sEQ0NUJyJQrvOj5RMFcDNdhHDPGKqbx4vLihWSCtM02Q0LvPzhXUcMhszFgJYstyGtY/yNB4SmHnDNPx3Va2tPSma+rjuyJv29pgtwTex9Lz0e0bGg8KlSOo8LtoAQbpjLdH4fWUVFsrVg0fZ+pj9hcXXVJaBqICbXq6ByOBFmlxwVzjPDPG1iN26q8aLtKt9r7bxgVJaS9JARb6CHQRdjmoElLaRAjSQHlkK08jI25ybpqiigjdHB5GOZPH0oC2PjCk+EJ6A7wvTA1X7dzmsdguBusJW3+rooUo0M+L3c0BjOSMyrUk/3L0Zq6Ca5AkuVL15+An2au6W8MDvw56z+p+cLRiRKhOBkJH0f+MGcl11vggGbW0lCbS1T2CaXvWznRXlz/qWBfM4qjSKC6uHkHgcWmrPQZ7n5MuIoQ2X3E+F0fomV6bw1B1DlODqrSff1blcBjxBhMBlgL9D3DuuuRz8HZXnjdrC5irqnTwPAItMpHWeTgWjm9nZM0YEFmxIma6nRxMO7aGsxRsCVWvkaA4iIjXWM7BhFLRemLXPt8xq/0ub7jqvaH9/va4vSmbC/n6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhIOHFTeWpOMEZ3WlVTa3VuSko4Q3VTaDZHN0hjVkUyZ3R0Q0E4OHhhYUVz?=
 =?utf-8?B?cU9oWG1LRDB5Q3RqN2NKakI1Z1J0U29ZK2ZFb0I3azUvUEd4cEJ2UFlvU3ZB?=
 =?utf-8?B?UXZodkZ3RzRWeGxqZ3BTUk1FUDd0VTRXYW40elhFKzlYRnI4Rk9ZeVBIQ0NM?=
 =?utf-8?B?OXdaTnU0MzlMY3hESmFqWVpBdjdrNWwxWGR6Z0svNjlwc0ZOYlI0Sy9ScHZS?=
 =?utf-8?B?Z2Q3MCsxQTlzT1c1a2dpZHQ3a2Ira2twbTU2TURxRkVJNmVuTU10U0VxMGpC?=
 =?utf-8?B?SWo2UGp5bUxHajFOUUh0Q2ExaUs2bDlkWGMyNm4rejg0Yk16eHJicG5zaDJI?=
 =?utf-8?B?MkNLa0VSckkzTUM0R0k4cStyM3F6YkRvWVp2WU1kSDFwMVV1MnR0L3VpTEdT?=
 =?utf-8?B?N3ppclJoY3F4ZWcwY2NHZERYcTNnb2hTOUhQazFwS2JPTFQvbUFqN2lTOStL?=
 =?utf-8?B?QUlWR2J3UDgrcmVpbmNRZEd0a1VLREF6bjVUOVByTGpEY0t2Q1c4c25NMmx1?=
 =?utf-8?B?UDRhd3c0Z3dsRVo3MnZINGxMeEF2S0RwVU14NTVoV0hjcDdZbmc0R01lT0JO?=
 =?utf-8?B?SEF6d05vM24xNTltWWxDWVFKV2tFWXhPb2J2ZWR1UytpMUhUVWM3ZGhFblBp?=
 =?utf-8?B?am03Y3hIS1QyMmpJVG9SL3FuamkwSXRlOFhtWGVMS2kwdC9CanJHNzV2M3Vn?=
 =?utf-8?B?T29UaURveVQ0bTVscDRuMzduRk5RR0dFMWhLbGNtSlgxMGZLUXRrdWRrRDVk?=
 =?utf-8?B?SS9ndmhkaW80ano3clhjSlg0dWdlQmxmbzJtSG9XeGFDdGplenJPR2NHRFho?=
 =?utf-8?B?TmZIL2VUb3E3RWlSVlJwSHNBQUgwZVpFajlmMTNRZU5qMU9IZjlFZm54Nm14?=
 =?utf-8?B?RXBwQVROemR1QWpSM1JVbEt2enJkV0VBZ2pWYkorVjZlSS9CbFVFOWE0UTF5?=
 =?utf-8?B?S0hMbkNsMmtSZ3JMcUloV2htWGd6eDNnay9ENzg2UEsrNVhTcWFkV1dNQU9H?=
 =?utf-8?B?VjNaRHkyWUd6aXZyeW13aHhBWTg0bVdoUHNod1hMSWFSSXd0ajByQmhpUlk2?=
 =?utf-8?B?S0lBY0pQQTQ4aVR1K25ielNJcW8rdkZQQXdWbm1jaDVXNDN5S0RJNnJkNW8z?=
 =?utf-8?B?L1NkVTQ3dGdQbElGanNSOG1KbGs2R1pTRE1wTUFWSzllNytwVVJIbURVcGh3?=
 =?utf-8?B?bzNPYjJBRGx6MjRPaUdnbHJVRmVBMnRuVTZmZ0ZQeUdwV0sxM21pN25QOTgy?=
 =?utf-8?B?M1NxR2RvMHpVd3FpcjJ2RW9SQ1V0MC9GbEREbUloZElBRG04eXZTcG5TY2VW?=
 =?utf-8?B?RlYreWFPbVBkL2pqODRMWHYzOFVJbTkzclR0b3UxekljUWdzMWJVR2ZlMlFX?=
 =?utf-8?B?dnNBL2tiNWNDa1VaMlJsSWQ4YkhvL1lhcHc1cWsyT0xyQlpqY3EybGpyeDFW?=
 =?utf-8?B?UnowL25ZdzVMRGJjQ3ZFM2lqeWNzS2dRVEF2Z2liZWJ5eDBQZ1BPYWY3R1dz?=
 =?utf-8?B?b1VId1dIT1IyZklOVDYvTzlXVnhKRlhuanJERlBscnNKVDR5blR5WWJXSHFi?=
 =?utf-8?B?Nm1CN2I1bWErN3BaWWw0N0llRmtEQ0Z1WkltazhuUVYzVGZaOURCV0pCVFM2?=
 =?utf-8?B?aWFJTkJoVHlxc013cFZNK0xJd1hnd2hYK0tZWmFpU29xdk03OXBTakRUYWJO?=
 =?utf-8?B?cVBDUmJBNE9EcnBScEMyTklWTDUyeVQ2UytUR3pyc1BTOUVrbWZFOTdQNy9N?=
 =?utf-8?B?WXJUWWllY004dzRacUhua2lNSlc3dHJaQkVBNjV5TXhSZS9ZenFVcG4xK0hE?=
 =?utf-8?B?UmhHWld5KzEzWTFQb28rZGdiRUYvLzloZTZaU0pNKzFneXAwVmxLZlBxQ0t6?=
 =?utf-8?B?RjdrcmkwbWVSQUhDRkh5K3F6a29XRTNMb2t5d1lWckI3RHdNOERoQ3BIcjkw?=
 =?utf-8?B?MmsvWkdENGlXcW5KeW1keEVsWTZ3QkRmTVFnSmR0QkVPam5yb3dKZU1nNFMw?=
 =?utf-8?B?S09kQVI3UEJKRE5vTTRXRTFvaUtyT3BzdndCL2RYQVo1bFFTTGUrV3ZYWE11?=
 =?utf-8?B?UWtMTlFUWDd0WjIzb0Q3aCtLUEZhMUJiWTZhWnY2VlhSeGJpNmZpcU9Jb042?=
 =?utf-8?B?Zk1xNlVoNXZYejUrMzhFWTRGZ3Y1RWtvN1kvV1VCejg4VmdYbDJlNVo2NlUw?=
 =?utf-8?B?RHEwNk8yYXh5QjE3eGRNQVdZVXh1bXV0VThLeE9zZzA0TFhEbmVtTFdmczZj?=
 =?utf-8?B?cFNlY2JRVDJ1bVk0UDlZTXIrUG5VN1ZVUGZNZUJTL1Jsb254WU9pNjJtWlZC?=
 =?utf-8?B?TDZ2OUI1eUxvczdFWVlXMm54K0dzdWRsVkc2NE1aS2hlUW1VMkxlcDIyWkJF?=
 =?utf-8?Q?f64JjPy8N73jSzfIKKqWE4W+MqqdPQyaCDIDc?=
X-Exchange-RoutingPolicyChecked: y9nT4Jggtmq3mDsy2AJrOOPkTIeQq3PtXTiEhFXMNEV4ObiEzdB0WcSCQ7FVV3sJ54OtRSvgHMHIGaJJirKMCMDBHPJwgVp5VOsk6QSJcY/M/2A/kCaIUQS53edwigTbqCi8L/zqupJz9w6BfxdIjnSGu8y/e73c37J4xVfLArLnef8d7Hnoi/lr16atri1PbNgXGFK7X2Ev+anBhNaAxi9acLeOTKHIqAqasanO1d+CTm3SnLN2xE7Gr5J9EIi8kdl/jnxSAqSIMUh3EYXC2/kNb5vcuEhz0zje+3q2bL7LJoGrasz7SFT141Agr7UGys3TZSgnPjlLYHelhnkesg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a39163-13d9-4059-3a3c-08df1885ee61
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 08:46:02.3529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEbpci8DIOoUtjOVWJBPORSEj5uqPP838KKN/kQFSjl1FqJRDpjycbjQ2lxJYUxNmHUxEEFIBbPKB/XkR3zWXJLF5ZwbWS7d/S3KF+tCeRPypC4YIIlLRQJAuhwZ0cM5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
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

On 9/18/2026 11:23 AM, Golani, Mitulkumar Ajitkumar wrote:
>
>> -----Original Message-----
>> From: Dibin Moolakadan Subrahmanian
>> <dibin.moolakadan.subrahmanian@intel.com>
>> Sent: 07 September 2026 22:49
>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> Nikula, Jani <jani.nikula@intel.com>
>> Subject: [PATCH v4 2/2] drm/i915/dmc: Harden DMC firmware payload parsing
>>
>> Validate the conversion of the DMC firmware size from dwords to bytes using
>> check_mul_overflow() before calculating the firmware payload size.
>>
>> Reject zero-length payloads and zero MMIO counts in the DMC firmware
>> header so malformed firmware is caught early. Also set dmc_fw_size only after
>> the payload allocation succeeds.
>>
>> Fixes: eb805623d8b1 ("drm/i915/skl: Add support to load SKL CSR firmware.")
>> Cc: stable@vger.kernel.org
> if available, please add Closes: <url> (with Reported-by:) to link it.
>
>> Assisted-by: Claude-Code:Sonnet-5
>> Signed-off-by: Dibin Moolakadan Subrahmanian
>> <dibin.moolakadan.subrahmanian@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dmc.c | 22 ++++++++++++++++------
>>   1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c
>> b/drivers/gpu/drm/i915/display/intel_dmc.c
>> index 051b721a0895..0ef6fddce3ff 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
>> @@ -1170,7 +1170,7 @@ static u32 parse_dmc_fw_header(struct intel_dmc
>> *dmc,
>>   	}
>>
>>   	/* Cache the dmc header info. */
>> -	if (mmio_count > mmio_count_max) {
>> +	if (!mmio_count || mmio_count > mmio_count_max) {
>>   		drm_err(display->drm, "DMC firmware has wrong mmio count
>> %u\n", mmio_count);
>>   		return 0;
>>   	}
>> @@ -1178,7 +1178,17 @@ static u32 parse_dmc_fw_header(struct intel_dmc
>> *dmc,
>>   	rem_size -= header_len_bytes;
>>
>>   	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
>> -	payload_size = dmc_header->fw_size * 4;
>> +	if (check_mul_overflow(dmc_header->fw_size, 4u, &payload_size)) {
> Please swap the order of these two patches. The load-address check added here operates on
> payload_size = fw_size * 4, which can wrap in 32-bit until the "Harden payload parsing" patch
> adds check_mul_overflow. So at this commit alone a crafted fw_size >= 0x40000000 wraps
> payload_size to ~0, slips past both the max_fw_size cap and dmc_load_addr_sanity_check,
> while dmc_load_program still loops the raw dmc_fw_size

Thanks for the review.
I will swap the order in next version.

>> +		drm_err(display->drm, "DMC fw_size too large (%u
>> dwords)\n",
>> +			dmc_header->fw_size);
>> +		return 0;
>> +	}
>> +
>> +	if (!payload_size) {
>> +		drm_err(display->drm, "DMC firmware has empty payload\n");
>> +		return 0;
>> +	}
>> +
>>   	if (rem_size < payload_size)
>>   		goto error_truncated;
>>
>> @@ -1234,15 +1244,15 @@ static u32 parse_dmc_fw_header(struct intel_dmc
>> *dmc,
>>   			    disable_dmc_evt(display, dmc_id, dmc_info-
>>> mmioaddr[i],
>>   					    dmc_info->mmiodata[i]) ? "
>> (disabling)" : "");
>>   	}
>> -	dmc_info->mmio_count = mmio_count;
>> -	dmc_info->start_mmioaddr = start_mmioaddr;
>> -
>> -	dmc_info->dmc_fw_size = dmc_header->fw_size;
>>
>>   	dmc_info->payload = kmalloc(payload_size, GFP_KERNEL);
>>   	if (!dmc_info->payload)
>>   		return 0;
>>
>> +	dmc_info->mmio_count = mmio_count;
>> +	dmc_info->start_mmioaddr = start_mmioaddr;
>> +	dmc_info->dmc_fw_size = dmc_header->fw_size;
>> +
>>   	payload = (u8 *)(dmc_header) + header_len_bytes;
>>   	memcpy(dmc_info->payload, payload, payload_size);
>>
>> --
>> 2.43.0

