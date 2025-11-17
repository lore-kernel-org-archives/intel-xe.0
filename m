Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6934BCE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 22:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105DA10E035;
	Mon, 17 Nov 2025 22:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTbiM3og";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146B010E035
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763417379; x=1794953379;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=5QHN/AmX/okdBUOvZTo293cXtRztsaUKpyJ9vSa0iW8=;
 b=KTbiM3ogs/OEDyTB9jfG6A4X8qJWdBcZSINcFVzj81w2isaZFEPcGUwW
 4gwrlWZxaWIGvsxqvOT8YWGGT2b0yOPD7Um+kLEsX8pXlQe2cVb4E3dGR
 3mVwaGi/FXKhKqSOGhSp0FX80lXO5Egrn1vVVa4b6R1/yEbyfFX4ndqPF
 6Ay4/7FTUSWWGYmMJGqfu8sqqvAKTGq9U5J73omgan3QexRPO8x7xOi2B
 rvDE09/Y1wrqSapU6LQb7g/fP8LQfbG8hdKvp+1Dw9G8qv2YW8aeCOMGw
 fvheXEcRxs96Mq/01MmSn/V6t7ct20ks61Qqr32dZhtOk//t1gDxyTEYP Q==;
X-CSE-ConnectionGUID: T8X1WJ0bSDO2eiJBuu6ubg==
X-CSE-MsgGUID: YsfzBKV4SieFH4Mdtrurmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65330857"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="65330857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:09:39 -0800
X-CSE-ConnectionGUID: hTt3SYhkQW6JWLmg4b/a/A==
X-CSE-MsgGUID: tiwOQZ3jQIyI8H2UygeI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="190723661"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:09:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:09:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 14:09:38 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:09:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiqIUBQ5mf/YM3EQMBXf+S2sP4b4yvyvgfjcVJiJm2q2VgIeHAqWagvh9U3rf7edUWS6GkAdHQMil4wPKdPir/hZ7qKTi1UDGmBOZGJfeQdayhb5uAA7iS4fo/T4A65LwokWSFml53sxnNnP3edYlWGfLkbpE3LPTOvjCANSalAseXMKCu6AIjEy3LxylXeolwrJeS7pvdb7pOO/qMRfP+uwN1ma5S4LiVKgBV3UqgYT/ucK51cAxYnUFQ8RaWyyrnUiYXfTlbZI1zkzJDI3Pw7cct1fIGBimP94HUZv/NHAR6cCTAo/ALOE1imx24o3zbcFPikiET36r3PJpZFJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYuPgvauH9TaMFjjZyYoYQHQj1Wd7JPtNdaDOPTrUQY=;
 b=NeTHBaju6BFqtF93r+Lx3FNqtTrE9YYdfdrLrlSD7oVZDxZMonF+mAaJVT2qwzep/2cL9xGpHxyGS70UtH0kTvDF2XuVM2KZyQ4jqrHalmsW5CUnS72P8BEmppTvUGlTFOuNquQLu4tHnwQklNjWl8Z1gJu9jziVyHaF+EEX5R1Dm7iV1s6VvZu8Wvypahkq6I+RXiVN8TTawR9bb6y7HsHZ+LhdMBwUZOm1UpHTAuoYgN6Vg9TujCqPol4QD63NCQvdWnf9DbSHwF3LSWpa0dMvNPFCM7+sxkB7Uy7gS0lJjH+vdsuIjsuYoO5j4ZStybXgGDv8RmrLWNdSTDwjWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 22:09:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 22:09:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114214335.2388972-41-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
 <20251114214335.2388972-41-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 12/27] drm/xe/devcoredump: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 17 Nov 2025 19:09:29 -0300
Message-ID: <176341736930.5989.18239579891731675948@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 1510af3e-aed9-46a2-6ca3-08de2625fd11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjNwbmlQWHFaOTlmVTZXYmk1WG1aVFhzdHRrVnFENDNXbDduc1JzYUljWnQw?=
 =?utf-8?B?dWo3T1NLeGtBaTZuRzZISFVBQXQ4bVgvNnVZUHBwOW1KWnVYdk5BNFoydTd6?=
 =?utf-8?B?YjQ0Y01GU3NLTlFtQjNJRFRUdEh5M01wZkthZmI3bVdhU0xySWt2Y3ZRSFpa?=
 =?utf-8?B?b1ZNc1gzN2hsMG9DMUdWeG5ETStjV1ovUW1tWlE5bnRxTk05eVVEOTg4TW1Z?=
 =?utf-8?B?UHNQNkFXbUVZRGxDUm5RR0xvS1h5OTRCVXNPb3dQNW9sY0lRaWFEdTRBVDl5?=
 =?utf-8?B?UWlrcmgwaEhLSXZMVTRTOTVOWldYVHdYU29TSFRXMTdoTldGZ0pqdGtveDVy?=
 =?utf-8?B?U2Vydm1oNGNFdVR5STZQM3V4c0VzUXNtL1RXM3ozM2J1ZndKZnczSlhMNVRK?=
 =?utf-8?B?a3pjS0tCSEJYTmF1TStpRjFMRWZqZjlndkFCVmZ1Zmp6UExGRXZUSmRoenA4?=
 =?utf-8?B?cmZPT2UzRnUyZkNEeVRCVEpRUS9PaTNnL2V3L0ViMCtLTnpPRFYvUW8yTDJS?=
 =?utf-8?B?bE51OGhXWGl5anZ4ZTVtMjBiYU1IOElyUWYzdElyd3ZSQVhEb1gvby9YbDhU?=
 =?utf-8?B?eWVxcit0d2RSNm81RDRzS2tTMTVsZWUrTXJGMURnNk44MVNwRVNxUjZkdGw5?=
 =?utf-8?B?MXBJQ3gvYUsrN3FMVm1oVFZ6Z09GcmtBQjZwRGVTVjJRQ0k0anFCQWhOYS9p?=
 =?utf-8?B?Wm1ESzFac0xrQW5PSng4WG5sbXlqWFFqWEZTMnZ3Z0daSktZYjVTcEZXTGhJ?=
 =?utf-8?B?dWJzMUZwREdPdXJzVHNpbHBGcm91enlKRktCOGoyWURWYWpSb2ZnaFlZd0pV?=
 =?utf-8?B?TDJFa29GRkhPL1Z6b3RjZllUanQ5SW52NjJGcnZhQXdkMU5PSzQwQWpqYXZE?=
 =?utf-8?B?c1ZQTVNBMjBZbWduVXpjSnBnOVcrdGo0cFZHRS80ZGdmQ2hXeFJTaEhOUTd0?=
 =?utf-8?B?ZmMzVEJNajBHb1dwdXYvc1k0R3hiYjl3d2hkR2RXSjNVUURIQ2hRendBQ29t?=
 =?utf-8?B?VVFvdTlKSklTWEdITnlEVXZSUjQzZFNGM1lHdXJRQXV3b0lNWWFUcGJMRUc5?=
 =?utf-8?B?TkxwWklwZCtxYnNLVGRxaGhjS2JCTU8xMTM2Z2NRYWZCY3JyYkVJVGhJUmtV?=
 =?utf-8?B?dUxzUmV0ZmRjb0lOV2FPR283SUdjd0tNUFl3TVEvc0JjeEcxSEZBR1lGVG5k?=
 =?utf-8?B?Wktqd2dsbHhZYS9vamp0eTJHNVlyT0ZNN3FadWxTcWJxN09KaWRGSExSSUtL?=
 =?utf-8?B?ZDBlTzFJQ0d0VTNLVHJLSUFudGl4ZE1UT0F5SVVONlRmaEZCbkd0VUtFSDd0?=
 =?utf-8?B?QUZSTXI5RmY1Vzk0UXBWQVo5VGVGSkYzZkNRdzY0cmVIWWZNb0NVZWp0MWJL?=
 =?utf-8?B?WUdzY1JtendZWWd3aGZ6cmVoWmxaSFVjdkNMNFBvT3RZMnErZlUvQXl3M280?=
 =?utf-8?B?ZThJWUVmeGhQNHdRTXY1SU9BZjdRVTNjSDFHcm1aMmp6SDlVNWkwNktFYm5S?=
 =?utf-8?B?blM0aXRCWmczWWJaRmR5WGEvT1h2VTRMTHhYejg0bWR2czZsb0UveUJpSFB4?=
 =?utf-8?B?c2F6czZhWTEyVGx2aVNsRWFqc3ZKSXZyNlI5SGt3RDFMMnJmcGEzTzdYdGR5?=
 =?utf-8?B?OHBFTU4rVXRzOERGRkNhYVZObEt3Y00zaS8rQndSNk9haFl1SDFjWVVuUEFB?=
 =?utf-8?B?cy9wYVpoeTNZNnFNNWlnTDJORG1nOG9GTmxYOXZMbThISzVxMkV1VUJTR2Rl?=
 =?utf-8?B?QjlvQ2dJdnRyYTc4d3dnTDczaTlpeWVuSEtlVVpURXFPbDFvalZKdW1yUUhs?=
 =?utf-8?B?U1hhaThMNWlvbkQxTW8vMzR1N0NFRWhiNUYrV2ZZWTNvZ3BsSCtwalU1bysv?=
 =?utf-8?B?UzViSXZ0WVdybjBCTnI5VVg3aDd4bFB1RDN0UlVVaGJ1U0tVTG1wdFNYL3V6?=
 =?utf-8?Q?h8RTNVzNZms40U26ubdK6DkZDhw8SWDi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNZcW9JQmZIcWpyd3VmejZyb3FrMDFrWWgxQVFJVmVqZWRROHg4aWFYNVgy?=
 =?utf-8?B?cnhWQzdlTGtnRm5xMklIUGtxZkxodTRzT3dCZ0dMdnhSVnhaUmltdTFBVkFL?=
 =?utf-8?B?OS91Ni9QcTRsa2tWanYzWFRVN1dKMGh3WjRqNjQrYXZXYWMybFRYL3pITkpY?=
 =?utf-8?B?b2xXUVVRQmorM2lXWHZZMzdvYVhUOEpONFEzMER3TVRwS0RhSEhqWDA4cTkx?=
 =?utf-8?B?WTF6eDZIbUc5ZUcrWXEzSGlzRmhucnRQMEpNUk1vT3ZFa1BicGZXdE5FRUVO?=
 =?utf-8?B?QzBZc1ZjM05ZZ2lFaW1IbW9BWGxXN24xZ1JNTDN5ZS9sM3Jxci9za3I1RVE5?=
 =?utf-8?B?eFVKWjRZZDhKRW4xb0NQRHpITnVZSnlzRHh4R2J0U1RTNHdrcTBScERjT3Y5?=
 =?utf-8?B?UzhpV1pia25WN0JCRzdLc0wzTjN0Vi9KOGF3bC9QOVUyemFabDAzRDNNMW5h?=
 =?utf-8?B?QzBlQnJzZmtyT3VaUDdZZVUrZGI4WWZjVUJFbXREQ1ZMRlhTY3F2MlA2cGNG?=
 =?utf-8?B?UlJZR2p1aklVNUxrOTZyWmwwSGxNSFJ3VkttSjR0UEZEOFpNUW4yRGhIMmJV?=
 =?utf-8?B?bWxnc3ZaSzRCU0JyaGVZc3d2YThqeHRvMlRDNjNQSmdPUlV6Y3lCYjgxWGVO?=
 =?utf-8?B?R3RkTzhRRklqaG9sQVFnVTJoQSthUEI4VGcvWTFOQjlZOWpLUnJRSWorNnVV?=
 =?utf-8?B?MHE4SGdCRUZGWDZ2Qk5aNlNTS1ZBcUd0T3Q1UktsOGRLUW1INnZxOVgycDFm?=
 =?utf-8?B?TDJFVDRZd1gzejd2Z2E5a0NwUHM5THhCa0x3eGdIcjRsV2RUUC9jMnZZWTdl?=
 =?utf-8?B?ZHVHRjlaRDZGVzhmWHJZVnZuZnVVS0JsL0FrbGFFckNIajRJWlM4Q1NCQUF0?=
 =?utf-8?B?U05FYjVBZEJrazdlYTU2S0QrUWtpeDBUckZwRUc0dXlpelYwYU5oSStKSUVn?=
 =?utf-8?B?SnlHQTRHM2p4RCtJUW1Nbk95YmN2S1oreVY0VDBQOHdHbENaYTRLbHlidmtM?=
 =?utf-8?B?Z2RiYUV2KzYxSWVLTkJhRTAzdTM0cmhzQzRGN1ZLY1BOaE14dEc3aUtKUCtL?=
 =?utf-8?B?NDVkVW0xWnkwOGRQNXZ4Vk5QQTl3OXl2Y3RJQTQ1STR0TS9xQjZSNGhyOVJq?=
 =?utf-8?B?OVZxY0JUSXY4cklKUTQwZURGTTVTZ20wT1MwVHNpYm9mWDdQdWY4eU82RVdN?=
 =?utf-8?B?TWRQUTlZdzRtV2cwd21FeWttTDVwVVJkYUR1SVNlVHkvYXlhK0M2TlBjMnJE?=
 =?utf-8?B?ck81NExmcXhQUzd1V2xIRWJMT1ZvUm5ZSGIxVGRJc3NGbEhsRUZJbGVnQjA3?=
 =?utf-8?B?VzJxa3JOMVJHSDRjNjZ2NUxERUxHWlp3eDd6TlZrZmpnaFhtZnNHdWlYR1cw?=
 =?utf-8?B?UG9xSjhENzRkTGM5N0tEdnRSa3B4b21Bb1o2RVFWUFhxNmYvQnFKeHJTMFNW?=
 =?utf-8?B?VWdsQ2RiV09EcW5qaUpFMFFwSC9LaTd1M3VKdzBoa3lDK0tYMldqNkozcktG?=
 =?utf-8?B?N1grdWlzbDFlNUpFcDFzdDJUTk1uWnZEOE5IdWdMdVJmcm1pWkVUTllSekNG?=
 =?utf-8?B?M1F0bFp6a2p1Qkt3UHBiYk1ZM2lyOWNmUXNyWHRiV2MyaitMTytic3FSYkdB?=
 =?utf-8?B?RHNRZG1wb0hlUzVFWjROVHZ6NmZrM2twNm5ocStjMkxhN3NoTXUzU3JtNjVX?=
 =?utf-8?B?Y0JZQTVQQWJrejFPZEFraWpjSGozNWJXQThZYS9RLzFUbis0QzlTVXY5MEdK?=
 =?utf-8?B?em5sNlpRSXdCUDgycFpmOUV3V3RDR1FxWjFEMDhMTTdidTZ4UDZhUjdZRVgv?=
 =?utf-8?B?c21xRldZa1dmbEQ2L3huaFdNNWp5QWgzVGRlcTY4Nmx6L2J5elNCSWNIcU05?=
 =?utf-8?B?SkxaQzFLOVRCMTFsTUFtRGJJUXBDNWxkRW1rNkJyWm81dDBld3JadW1LY2Z5?=
 =?utf-8?B?WFJXb3VkUzY1ODgrbjVCclR2NXhoQmo1Z045dURGR3NmSHg5d0tDbG03MGc5?=
 =?utf-8?B?V1lDelVBd0JCeHkxZ0F5TlpaN3FTV1BlM0QrVDNPUUZFWVlYWUxrVVMrSVo3?=
 =?utf-8?B?QzdBMXV0ZWRoVGIxNll1ZVJVVVJ5T29EZmlVNVRkdytjM2tJWm02NnppdlJO?=
 =?utf-8?B?dFJzZ0VZdHNRSFdpVTBTc2w4L1BWUFpMbDFZOVYzNjN3bGR0MjdSNmEyTVE2?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1510af3e-aed9-46a2-6ca3-08de2625fd11
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:09:33.6314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bm3Qp6Xqb1I2v2+2ualN4SBhbqpAbaNEcaskdGMJbP6dWkHvIfh9h/cUyaBkPbrJB0G7ZIqt9oNhpwgdRnT2/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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

Quoting Matt Roper (2025-11-14 18:43:48-03:00)
>Use scope-based cleanup for forcewake and runtime PM in the devcoredump
>code.  This eliminates some goto-based error handling and slightly
>simplifies other functions.
>
>v2:
> - Move the forcewake acquisition slightly higher in
>   devcoredump_snapshot() so that we maintain an easy-to-understand LIFO
>   cleanup order.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_devcoredump.c | 30 ++++++++++++-----------------
> 1 file changed, 12 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_d=
evcoredump.c
>index 203e3038cc81..bf347714b5e0 100644
>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>@@ -276,7 +276,6 @@ static void xe_devcoredump_deferred_snap_work(struct w=
ork_struct *work)
>         struct xe_devcoredump_snapshot *ss =3D container_of(work, typeof(=
*ss), work);
>         struct xe_devcoredump *coredump =3D container_of(ss, typeof(*core=
dump), snapshot);
>         struct xe_device *xe =3D coredump_to_xe(coredump);
>-        unsigned int fw_ref;
>=20
>         /*
>          * NB: Despite passing a GFP_ flags parameter here, more allocati=
ons are done
>@@ -287,15 +286,15 @@ static void xe_devcoredump_deferred_snap_work(struct=
 work_struct *work)
>                               xe_devcoredump_read, xe_devcoredump_free,
>                               XE_COREDUMP_TIMEOUT_JIFFIES);
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>=20
>         /* keep going if fw fails as we still want to save the memory and=
 SW data */
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>-                xe_gt_info(ss->gt, "failed to get forcewake for coredump =
capture\n");
>-        xe_vm_snapshot_capture_delayed(ss->vm);
>-        xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>-        xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>+        xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
>+                if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORC=
EWAKE_ALL))
>+                        xe_gt_info(ss->gt, "failed to get forcewake for c=
oredump capture\n");
>+                xe_vm_snapshot_capture_delayed(ss->vm);
>+                xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>+        }
>=20
>         ss->read.chunk_position =3D 0;
>=20
>@@ -306,7 +305,7 @@ static void xe_devcoredump_deferred_snap_work(struct w=
ork_struct *work)
>                 ss->read.buffer =3D kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
>                                            GFP_USER);
>                 if (!ss->read.buffer)
>-                        goto put_pm;
>+                        return;
>=20
>                 __xe_devcoredump_read(ss->read.buffer,
>                                       XE_DEVCOREDUMP_CHUNK_MAX,
>@@ -314,15 +313,12 @@ static void xe_devcoredump_deferred_snap_work(struct=
 work_struct *work)
>         } else {
>                 ss->read.buffer =3D kvmalloc(ss->read.size, GFP_USER);
>                 if (!ss->read.buffer)
>-                        goto put_pm;
>+                        return;
>=20
>                 __xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
>                                       coredump);
>                 xe_devcoredump_snapshot_free(ss);
>         }
>-
>-put_pm:
>-        xe_pm_runtime_put(xe);
> }
>=20
> static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>@@ -332,7 +328,6 @@ static void devcoredump_snapshot(struct xe_devcoredump=
 *coredump,
>         struct xe_devcoredump_snapshot *ss =3D &coredump->snapshot;
>         struct xe_guc *guc =3D exec_queue_to_guc(q);
>         const char *process_name =3D "no process";
>-        unsigned int fw_ref;
>         bool cookie;
>=20
>         ss->snapshot_time =3D ktime_get_real();
>@@ -348,11 +343,11 @@ static void devcoredump_snapshot(struct xe_devcoredu=
mp *coredump,
>         ss->gt =3D q->gt;
>         INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
>=20
>+        /* keep going if fw fails as we still want to save the memory and=
 SW data */
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>+
>         cookie =3D dma_fence_begin_signalling();
>=20
>-        /* keep going if fw fails as we still want to save the memory and=
 SW data */
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>-
>         ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>         ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
>         ss->ge =3D xe_guc_exec_queue_snapshot_capture(q);
>@@ -364,7 +359,6 @@ static void devcoredump_snapshot(struct xe_devcoredump=
 *coredump,
>=20
>         queue_work(system_unbound_wq, &ss->work);
>=20
>-        xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>         dma_fence_end_signalling(cookie);
> }
>=20
>--=20
>2.51.1
>
