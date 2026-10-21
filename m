Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E32C606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mOip0yNe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1262C10E24F;
	Wed, 21 Oct 2026 10:09:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC12610E24F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 10:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792577346; x=1824113346;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=biBE6RkMX+U7GZjN6G1a+IHUXvScfLcnj/NrE4WyUKo=;
 b=mOip0yNe3RrR2klXKcUDEk54h0riXCDFYQRPTsiSzqgJPvEwIo3leizG
 rBlkU+eragSjzdfuMBJdAs6vo3rbvndbUhIxOQf8fKOv7ZKodwCFRb5/y
 2aRRxoq+XFbU+sWxf/YiR0xkPLpO5bNcLYiTTyohs9uLyT34mWVsiYR+a
 N4xhMqJvAp4rsr+OypyiBDn5JjTXIp4z+nJ38ik0IZz7uUZRD3qpHngDj
 Yszxdv0+TCJbiEZxq1Ugvjt6oRnjUVwLtrNbzOUqMKIZ9eGtviXeRLd7h
 6L+gq2BoI/bbW4K0VcgvOCZ9x21ggT0VvbR6FQceS7BOzAivUFlDTI2dG Q==;
X-CSE-ConnectionGUID: 8ohdtB05ROKajY2BifP8qQ==
X-CSE-MsgGUID: iCez4HoISB2nVJAG+Kzy1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1314145"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; d="scan'208,217";a="1314145"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 03:09:05 -0700
X-CSE-ConnectionGUID: xl3iAoV7SsmrOomHjD4Gpw==
X-CSE-MsgGUID: esiR7HgzTBOeq48AmYen7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; d="scan'208,217";a="4816081"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 03:09:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 03:09:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 03:09:04 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 03:09:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsQupLyVWazrlukviTc92YOvg/GFH+f2ff6OMfiZy5Pnwucuw/CYHjKvUFRexEXNdETRPffLG40mfWj9LQUU/PvYH2UWCmZiiDNgKPQcd4SIQyIEtLO7bai2wHzS5DnQlJKB6LplHy/LF3q7WyJjjVyYgq4d2ifpc3qe/IuyWqif8Zqz1G24me8h6/L0Ch1ELTQn4DaqOTvl03ve378CZ6JwHCFc8uVxThxvieiXxP6x1P+rspN1eJfQD05gUTsj8UKYQxVdxslSr5DGLZiK/U390QOeWQ5Eiw3NLX+K2nWiFxsTwDmIiOyNSrdOsPwouX/kWGKNGMwNy7yjfoItvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwQ31r3KB8DaPhUhYd8XrA8RInhuF1AcG93XVaOuTQ4=;
 b=mLRmH4EK3bE5oGWen5a/Zpy5huwriyfWt2h0vtMJhsSmFgahq4r8hUabEHxZQOgVDwua+RbetSuEelf9w+OgMaWDBegTSkxHkFTOFWC8evtUyILkxa7aagZcA32J3Ux0yf/zcrT1p5GjfHAS7bvNxgcauXK5Zl8fKnavBjSg16adVjgLxRMZuhr7cWgxkqN2gyMwaCugxUM9xR7dq2Gqy+LU0MUcu2KfrNNZfMLkfl1j/+d24+4IZyFLjhWuuP+30RY5NuCgfd/o/Yzzlh2cIkAQbK2ob99mylflQ2CWzUESyDuByy3qeamy1wJFhx8mLxbsucbcw+DVTJ8Wnt21qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY8PR11MB7729.namprd11.prod.outlook.com
 (2603:10b6:930:70::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 10:09:01 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 10:09:01 +0000
Content-Type: multipart/alternative;
 boundary="------------4sAUwESyZiapefYqj0y5to8D"
Message-ID: <20a16dad-0103-42fe-af7c-859e396809a0@intel.com>
Date: Wed, 21 Oct 2026 15:38:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/guc: Demote uncorrectable local error log on CRI
To: Matt Roper <matthew.d.roper@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
CC: Varun Gupta <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20261013033430.1885990-2-varun.gupta@intel.com>
 <cec2dc54-14e0-48b7-b0e9-54c410226f82@intel.com>
 <20261016223700.GD1329272@mdroper-desk1>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261016223700.GD1329272@mdroper-desk1>
X-ClientProxiedBy: MA5PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY8PR11MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb6d678-9c0c-4854-c922-08df2f5b5406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|22082099003|18002099003|8096899003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 31H8//Bgj9RPWgYHL8YFDFwx+j2s/KKrpkNDvtpTQ88HvT8HKQQA3h9DSxQh/Zy/B+XRDtfccgXaucc80Dv/ArxmKuWuwMSkcNsJwjExgsHwWn2TPdcdiIyla880I6z3RMeW8sMGQQZDHpYSD4h4mFt0YeCs8wGi4FcZbZWZ+CFOAVmR9+/U5lhAGqxSC0W3UOW1abOs1259n72OtYqQlASKWXhyzBWLqP1aDFBBGC5EB/qcDYRdLiafWjO43+PDWgV0yt0KBfaYNa4UzoIbd2PtNaGo9b26JnIEWqF4KtzuGV4LohxduZ67IeznxaK7ohEAoH5XMWo8G8/BADmdljwmdDCEqNvjl80KK2cFR47bIX9uMktZHsMYuIx3keUOQxLVvgwjioxEBwrwB+M0ChrmfdiOHDaCeqnY1JQMEZttSK6aMaN4VGbRdysaPQfezeIpN57AB6yPxH6LW6MjIjs5i7vJEhKeY0JCqxhJDrIhfRAH/GjZ14Zh5qv9jFYz08zsNpZVGi5f90+i51PFJN3+k53kwNQUT7wSuLLxQDqVksEBEfXDf/+X3alX7ucQXL88btih5yqjJxGnUYQZ4uvKAMgvFlypdPMu+hLjbLAsHjacS+IoUWwsrM4InoM+70bLumfh/eY90KMOGifFUM+t8d/YSVgs2en5oldmXhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(8096899003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUlDeTRaa282Y052RWRIcTNhQjh5VWV0YXlGejFKSTBpUjB6N29wSG83c3Nq?=
 =?utf-8?B?SnE1aFlBbTc5S3N6WmdDbnNMUW5aazdkVnNHN3lpQ01qb3Bicm54K2pzSWtO?=
 =?utf-8?B?bGVBcUdHUGZhUEhDRXJ0RExJWG9GcDUweGMveExWY3lKUmNhN0JEQUVzeklj?=
 =?utf-8?B?V0tlRnk3VkJkU3FtN2NHQW02OHhCeU5ySExRRWl0WnBrOHRSUXFwUWNOS2Vt?=
 =?utf-8?B?ZE1vc2p3M0VjNlNhQXpEUUdXZmc0ZTRtTHpkRjl4dmh4aGhzcmw4L3VRd2Qy?=
 =?utf-8?B?NGx5VS9LN2hGMjhwaXZmYWt6RHd3TUxLQUhtRFdBMkxYeEZmT3ZIVTVVdWRR?=
 =?utf-8?B?UE1aUnRIN3RGVnZHNHAzaFFVVEMrTVdCSGpuTVllM1hMUFMxUm5jbkFiMVFE?=
 =?utf-8?B?UkVZaTVLUmFYYW85a1ZDelJxWXNmZW9aR0xtYzhoamRnUi9mNSttbTZCWXFJ?=
 =?utf-8?B?RkFaK3RUb2NqeXdKZzlLcUNwQ0U2bFR3blFTb2pSYVRZelNmejdYYm96U29n?=
 =?utf-8?B?Y2xRckZzVXlZYUV5ZzI3QUg1NElyWmorS2tuR3owajVLZVJFTVFEWTk5UEor?=
 =?utf-8?B?dkRRSElMNlUyM3dZUFBrK3grcTF4MWp3NFdCN3krOGpVdVJpSmlkOHdXODhl?=
 =?utf-8?B?elFIN2V0S1RTVi84Q3ZuUmthMHR6bHJWU2x2b3cveFdaZDZjWjcyV2NpVHha?=
 =?utf-8?B?SGFSQlovQnZCUGNPVDZWWVkzbG1NN2hVckk4NkFoUVNicjZRNWFTK0xvcTEv?=
 =?utf-8?B?ZnJFbHB6Y3pYNTRvZklvK0FCKzFkTkw2ZXhRNUJBclRyOUhQWnozN1JlcXN4?=
 =?utf-8?B?UThuVmYzWHhmdzRmNkxmbHY4aDFiaGhMOXBlTHFFOElMckxVN0NGUHQ2QStV?=
 =?utf-8?B?bGNsVHdOQnU4SWRzRnFsQkVGU2xiWEJRTUEva0dtemo3QlFUUkFiUGVZVnhB?=
 =?utf-8?B?RlBRUzdxdjFqemtvUm16cXBqSHhSOWp3MmN4bVZiMTVxWnNPSzR5QjNXeWNs?=
 =?utf-8?B?QjZKakZYYTc2a2VxREN0akFvN2RqRTRIbnZ4cnh3S1lRdFhKZXVvVk0wNmJD?=
 =?utf-8?B?Rys2ZHQ5Qk0wMUlRWDJWRzFLaUtNdU1VMm9GbllWMTB3d2FvdHZ6cUo0VXlk?=
 =?utf-8?B?YVRRZDFqenZ3eVVybDU0U0wrSXFNWTB5Y2ZEV1RjaVZpQlJMeXB6OWlaYko1?=
 =?utf-8?B?MHMxRlVQdnJSd0JpM3drZ3dWMWR6S1h2cGZwSlROemkycHNRdGs1clErRDVH?=
 =?utf-8?B?K0dHb1NJNllRSldwVmV5YUNXTzRkTHJNdWFhOHNMTjBWR3grSlpPNmpGY04x?=
 =?utf-8?B?UEVGcCtXeDd6VU1HbGlrcnIvekJpZ24yUlRBcy9vbFBGT1BtNUxjNmRYZWJI?=
 =?utf-8?B?UkU5a0x1U1J0ZUhrTXdPcXBCeHdKMWhMdkpXdTFMSXIrbGNyQXpHNmhxQzJs?=
 =?utf-8?B?WDlmTm9KZ3VZKzV5OFRXVGhtY1ZrYU00NkxoL1J0bG9zcFlnek84UGpFRDk1?=
 =?utf-8?B?YlZOYkxmelcxbTJoRFd0UzdvVnZ5bjNkK2RlS2R5T0o3K3ZwVzlqTjRydDYx?=
 =?utf-8?B?K0F4NUJEOUxIdm1RMXlUSkdWNGZkZTZ4M1BnTlFqR3pEVXpZdjF6VDhzZlRK?=
 =?utf-8?B?R3cvemVqMDhxelpWcUxqMHdvTWtGTjhMUWJoZExQbHI1cXB0Yk1HdVFnZEN4?=
 =?utf-8?B?VmwySXJjSEJhb2Y2aTduNVpGWE1BRDFTQmNYcG5TaUovM1daNUZmc1Q3MmFl?=
 =?utf-8?B?MmhiNVE1M05nOFZsVXlka3hCclpwU3IvcXAwYWxRQ3RpRGtHWC9jUExUdkli?=
 =?utf-8?B?QnNhdUE2ZGhYNk50SENzTHc0TjB1b1hzblZ4bFdoUzhROCtrQ3IyZXl3OVdP?=
 =?utf-8?B?K0xXNEJxNWt0UWp1dndEbE5ocGo3RUtnN1hweVpHL3dDTGtLb2k2dnNiQzVZ?=
 =?utf-8?B?Z0pDa1duTDhYK2hRUUIzL2hsb2FvazZLUW5tRHJodWJTbUszaE4rL1llTjNv?=
 =?utf-8?B?d0NlanpRZWhkbmx5REtLMDIvR3hBQ2x5ZU0ydGlZZnVsaVNWRHdFczczVUFD?=
 =?utf-8?B?a0VJZTcrZGtBeEdsd1dIRTJ0U1pzdHpUTGNCZUJYWkRWQTR0L1VIS0ExYktC?=
 =?utf-8?B?RlhpNUtpbHl1NURoUnk3MmlSU3dENGlaOWl0Z3lSWWVvQzBYZXlqcGhjYXR0?=
 =?utf-8?B?YjRqTjdNalQ3RUpaUG1TS002M3pKQlNZZmpoMFp5SndCV3NvOWcvTytwOFR1?=
 =?utf-8?B?UmRqNnhUMlp0ejdwcDY3MVNQd09DdDBNN1hiN0pzcHBZSkdvenczVHg4cXdx?=
 =?utf-8?B?ZnIwYWMwY2F5emVyVTJhQjMrcFhObFBObHNjTHVVYTVFc29GS05UaUNJSWhB?=
 =?utf-8?Q?19P7BAahtaaWVrgM=3D?=
X-Exchange-RoutingPolicyChecked: nVbEt7j+8cCX76d7LqLgelObKMF2/zVIsbCYulhylxxR3gLkH8WBzg/CGZmSazCuNjIfrDGU/yYWeBwq6/6RnkGKrwOvrgWuLYrXLbJatb6Wu1J05PHlbT1ndT1ah4S5cO44FXCS6vZ4ZdZhe9Lol3qFS/IJ4MRtYdjPjoFJNUJmuwGx4AD5au09twCT+/2CqDpytUkZdxzfXnxwaNYkyMv2TGhh6f8Q0LC87bNbY9gj4EmisMXc+HAtumtr5D1TKpjbILfk+Rn5nN9BCxl9+pLeQ65SrUaPT6hChxGVOyGx7gxWGk337zWSzSJ2EmVPu6vR97GXhox0G3ZBURC5yA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb6d678-9c0c-4854-c922-08df2f5b5406
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:09:00.9377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fco0NKnrbQpV/0dONxoKOApz1H11FoDLAOdjfyZSUHPyQgavuGmfEuk7GOsayvQDonXyenshKhMWaO7a8c/mcrvRX1BZ1S8hcyKxknteDBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------4sAUwESyZiapefYqj0y5to8D
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 17-10-2026 04:07, Matt Roper wrote:
> On Tue, Oct 13, 2026 at 10:22:57AM +0530, Tauro, Riana wrote:
>> On 13-10-2026 09:04, Varun Gupta wrote:
>>> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
>>> local, queue-level context termination rather than a global device or
>>> driver failure. On CRI, due to a hardware limitation, the platform cannot
>>> distinguish GT translation faults from true RAS conditions, meaning
>>> standard workloads routinely trigger this error.
>>>
>>> Printing this at ERROR level is too noisy and causes false-positive
>>> dmesg-warn failures in CI. Demote the log level to INFO for CRI.
>>>
>>> v3:
>>>     - Limit the demotion to CRI and add comment explaining the HW limitation
>>>       (Rodrigo)
>>> v2:
>>>     - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>>>       (Himal)
>>>
>>> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
>>> Signed-off-by: Varun Gupta<varun.gupta@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
>>>    1 file changed, 14 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 7ce73489c35f..dc5b6b98ffc2 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -3585,7 +3585,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>    	guc_id = msg[0];
>>>    	if (guc_id == GUC_ID_UNKNOWN) {
>>> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>>> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>>>    		return 0;
>>>    	}
>>> @@ -3593,9 +3593,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>    	if (unlikely(!q))
>>>    		return -EPROTO;
>>> -	xe_gt_err(gt,
>>> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
>>> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>>> +	/*
>>> +	 * On CRI, the hardware cannot distinguish GT translation faults
>>> +	 * from true RAS conditions. Demote to info to avoid false-positive
>>> +	 * hardware error logs.
>>> +	 */
>>> +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND)
>>> +		xe_gt_info(gt,
>>> +			   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
>>> +			   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>> Shouldn't you be using ci ignore dmesg in test rather than demote an error
>> log?
> I don't think CI is really the main concern here.  Giving unprivileged
> userspace clients a way to trigger new dmesg messages above DEBUG level
> on demand is generally considered a security concern and must be
> avoided.  So even the 'info' demotion here probably isn't far enough; I
> think this needs to go all the way down xe_gt_dbg() to make sure this is
> safe.  Otherwise we're hiding the CI failures but not fixing the real
> problem.
>
> The fact that there isn't currently a way for our driver to distinguish
> user-triggered software errors from real hardware errors is a serious
> problem.

The *same applies to CAT errors*. They are being reported as info, but 
they can be errors triggered by users for invalid addresses accesses.
>
>
> Matt
>
>> Thanks
>> Riana
>>
>>> +	else
>>> +		xe_gt_err(gt,
>>> +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
>>> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>>>    	trace_xe_guc_uncorrectable_error(q);
--------------4sAUwESyZiapefYqj0y5to8D
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-10-2026 04:07, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261016223700.GD1329272@mdroper-desk1">
      <pre wrap="" class="moz-quote-pre">On Tue, Oct 13, 2026 at 10:22:57AM +0530, Tauro, Riana wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 13-10-2026 09:04, Varun Gupta wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
local, queue-level context termination rather than a global device or
driver failure. On CRI, due to a hardware limitation, the platform cannot
distinguish GT translation faults from true RAS conditions, meaning
standard workloads routinely trigger this error.

Printing this at ERROR level is too noisy and causes false-positive
dmesg-warn failures in CI. Demote the log level to INFO for CRI.

v3:
   - Limit the demotion to CRI and add comment explaining the HW limitation
     (Rodrigo)
v2:
   - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
     (Himal)

Fixes: 4e57574fa3a3 (&quot;drm/xe/guc: Handle GuC local uncorrectable error notifications&quot;)
Signed-off-by: Varun Gupta <a class="moz-txt-link-rfc2396E" href="mailto:varun.gupta@intel.com">&lt;varun.gupta@intel.com&gt;</a>
---
  drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
  1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35f..dc5b6b98ffc2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3585,7 +3585,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
  	guc_id = msg[0];
  	if (guc_id == GUC_ID_UNKNOWN) {
-		xe_gt_err(gt, &quot;GuC: Uncorrectable local error with unknown GuC id\n&quot;);
+		xe_gt_err_ratelimited(gt, &quot;GuC: Uncorrectable local error with unknown GuC id\n&quot;);
  		return 0;
  	}
@@ -3593,9 +3593,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
  	if (unlikely(!q))
  		return -EPROTO;
-	xe_gt_err(gt,
-		  &quot;GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x&quot;,
-		  guc_id, xe_hw_engine_class_to_str(q-&gt;class), q-&gt;logical_mask);
+	/*
+	 * On CRI, the hardware cannot distinguish GT translation faults
+	 * from true RAS conditions. Demote to info to avoid false-positive
+	 * hardware error logs.
+	 */
+	if (gt_to_xe(gt)-&gt;info.platform == XE_CRESCENTISLAND)
+		xe_gt_info(gt,
+			   &quot;GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x&quot;,
+			   guc_id, xe_hw_engine_class_to_str(q-&gt;class), q-&gt;logical_mask);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Shouldn't you be using ci ignore dmesg in test rather than demote an error
log?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't think CI is really the main concern here.  Giving unprivileged
userspace clients a way to trigger new dmesg messages above DEBUG level
on demand is generally considered a security concern and must be
avoided.  So even the 'info' demotion here probably isn't far enough; I
think this needs to go all the way down xe_gt_dbg() to make sure this is
safe.  Otherwise we're hiding the CI failures but not fixing the real
problem.

The fact that there isn't currently a way for our driver to distinguish
user-triggered software errors from real hardware errors is a serious
problem.</pre>
    </blockquote>
    <br>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-hveid="CAAIBxAB" data-complete="true" style="font-family: &quot;Google Sans&quot;, Arial, sans-serif, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">The
      <strong class="rQesXe MPyX" data-sfc-cp="" data-sfc-root="c" data-complete="true" style="font-family: &quot;Google Sans&quot;, Arial, sans-serif, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 700; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">same
        applies to CAT errors</strong>. They are being reported as
      info,&nbsp;but they can be errors triggered by users for invalid
      addresses accesses.</div>
    <blockquote type="cite" cite="mid:20261016223700.GD1329272@mdroper-desk1">
      <pre wrap="" class="moz-quote-pre">


Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Thanks
Riana

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+	else
+		xe_gt_err(gt,
+			  &quot;GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x&quot;,
+			  guc_id, xe_hw_engine_class_to_str(q-&gt;class), q-&gt;logical_mask);
  	trace_xe_guc_uncorrectable_error(q);
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------4sAUwESyZiapefYqj0y5to8D--
