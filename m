Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC867CD4855
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 06:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EB210E987;
	Tue, 12 May 2026 06:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVFkQdzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888A110E97E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778569124; x=1810105124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GevYuTYh2FGppdH1yoVn5KBRau7bNRNd/T0cw+xcbB4=;
 b=dVFkQdzLIEGIZOBrk7xHCnuiJDw79Cw5FtvyGxdK+Vzx9P/DM7/YrOxf
 sZ2rMrrgtPAVJ06dwip8HdnmkiwRbGHYE3bXfjVH6vqJrrslAo2Hv62MO
 5FksYXO5dIWm36J/6Q7e1mrNxyF1Z8sYEy1TYsRsNPuxH9D5XX0lILRQY
 AAUaKCGnzQAC85AdkZVjMwUwEf9gUtcVqZJCB087jCp8KFgORRISC7DFz
 ypHOCLU1pFEJjrFNaHqNEpglbvlCfloO/aWti53qpMaF/f+q4n60LGnIF
 iCGUt22xmYrtELP5WZGb0ZXTRUFO8JU/WDwvBxhmQ3DdCnNm+fkgSre4N g==;
X-CSE-ConnectionGUID: BR6WWhMlTfSZvFNylQUJaQ==
X-CSE-MsgGUID: BUUzvzp+RnqFPd3LAcY/8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104925182"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="104925182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:58:44 -0700
X-CSE-ConnectionGUID: 9VMr0HrmSACagamTE1Lqgg==
X-CSE-MsgGUID: MSJ1ntNUT+K68+hwEyEBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="237775414"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:58:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 23:58:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 23:58:43 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 23:58:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THKHlrUukv6ChpcldUUrPYTsyOph/T4yyZAbGAp3OPjbabMaRxIxeCX5Nac/J+0tlTmOekrnuhkOKG+tWM7R/OhQR1GHKxCm8JMwHwyArP8y7q77jeEHB9RtzkWYxcu6K3M8mZVdkjgeRWuOfVF+YN0fuoz3SvEskuCkWBz7e96laFXU4ri4I0D01ZeeucKZYAMjczzlQMDIIFiHnbOCZM5rrTv5KKJvmEuZx0kwXuN/dTmdfT0l9G6ipNYpfd2t1qxmpmCy9XWMBVWRUFtqqaOP9Ihj13LSVB4rti1Xl6hjk/rW8AtN+NN5y0T/bTqJR/B0p6Vo5B5x1QUmUnz+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GevYuTYh2FGppdH1yoVn5KBRau7bNRNd/T0cw+xcbB4=;
 b=MUoFbSth/ludQ/caOJAcRXIqJlVT2iBrDtin0aFBotmGUpgKVL+0VnLiRy407DJh8OAg7dkBRRxaZTa//wVy66hxshI6V//+olcOmu1HEuYQ6veVYm1MULVhYkaS1a8BFxJnvJt2XL0UPxAodz4RRZ6i52k6qJB5hCPajqfa6jHntSyXZSoOhfWScSecZj+L1KTw4TevzU9W0S7Y5kOnvBgqnuiyQL8ffOARQ7kzhfPsx0i41oLrETD1JZ2n+/3oSx7WpWjOEhKzLjF/bfQEHRkJSnuXg08OPTkDeo+On52P7lnImusz4ioQiAMRZofYn68RBNZz7ePUFXVqB/0zlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 06:58:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:58:41 +0000
Message-ID: <b3c54a66-ab62-4231-8671-a7b5a4f8acdd@intel.com>
Date: Tue, 12 May 2026 12:28:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/xe/uapi: Add additional error components to xe
 drm_ras
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-9-riana.tauro@intel.com>
 <4ac5d412-de6f-4e04-9000-f9b61e1bc5d3@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <4ac5d412-de6f-4e04-9000-f9b61e1bc5d3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 49212230-2176-4756-fd83-08deaff3e658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: PU9ibUxxz5s3d/QnhyCkN6AHyiYM8BF8aK48K8+zTguylRiBtHEWIhuEWE+UQuK2eNGguP7iW2+BkSflJ4LmFkWZs+oHum9ssfMTmZlkTtaJEaY3IseWJG1A6l1OksKXsWwQ4Bd+i3VR5CgxtFR4r9xEftwwtwbWdmc+twtOFPn8u3bozsyJ4Nrr4p9poSaiOAK2fqtcb3/lPjlyyrUMyX/nC8hd/KA2DkMnbvgEtWp7Ay1FkXzYfssU3UymSwoMCRFEDoeJAYyFXKGiLv7cAX9DB7ZpPXxgHLwUOzlZdwIDQrkH1wiKaqpkWwryv+RgK1QgzPgz7KfxhFSjdRUvWBBMc4iJGqyLNpvXJJYPcN8aUWzGpB1pB4NvmOTnH9+ax6WcN58p/ZefC3CWUu1NShEjkdMdQnT98GaiM9Bo24+y5uXJg1HDX9txRRpb1sp42DYacwD6y6cD4tvRr5iEUJOIu+r1XnzDcx7s29tiAV+8fEg8F+sjGRRV/EU00/GpeF0vckXSMenwxraGNlgyTqgVpqttaWIvNAvz+ftP3DSBdA+yPDrfjz8ZT1CtkmCmLjfHmW9tH4DxwSqibpm5myAKkfMF0ny13tRFPN1oYnLK68gzPPcPnBdUv+Hb5p46aALLCCFZ2M84NG7eKxAAL8y7JLyUkqaTj6ISq3QkUcYdiFQAqkft0hkchA9yPnBa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWg0bmppWFh1SmxtdER4ZURJemsvV2JOdC9SdkVJOFA0R0VSV2oyNXd2cXZh?=
 =?utf-8?B?ZGhIYnVBSU9qc21wZDdoczFXdTFUMEM0YkRsQnBsdXpiblVEeU4xTTYvTERr?=
 =?utf-8?B?c1kyY1psRUo2T3lhYnFDTFlKc1NDMERoMlI5b2VLWjh3MmNIVUY1MHJoaUIv?=
 =?utf-8?B?UDNrdk1FL1IxMTBUaDE3eHpsdmR4bzRXNHZBQlFkK3hxczBUb1ZtaUE2a0tZ?=
 =?utf-8?B?RjZjNmE0b01aNjVEUHVpRjQ5YVBZbnRCZVhzY3R4b2c2YzhLOFkrclNDQThw?=
 =?utf-8?B?Y2UxZUxabll6MUUvc2xmRmRzbExmZ0pRL0xMcFdwTzFLRUtpbUdRNnppVmhU?=
 =?utf-8?B?QmZMT25DN0dWOWp4eG5wQ05lM3NKdXE4aDg4enZZMlNoRExpdVRGeUh6OTdk?=
 =?utf-8?B?N1BTVXpSd1pUR2tVampPYVowQmU3UlZzbFJvSXRFOTF4S01Fc1Q0V3M0V3Vy?=
 =?utf-8?B?eEFGWXozM1VuYXFCckh5djd5TlREbkxPTVd4ZExWaU12ZGpUQ0ppRm51ZTdV?=
 =?utf-8?B?eElEK3gyMTc4VkdPNEtuTzNrSmJtZzBDeXdzcmsyLzYzTWFsRFdaQXdybFAw?=
 =?utf-8?B?UlJJOGcxaUQ2WnlxV1NyNHRVK1NlRkdKa0xEZFNrbElobHFhbDVBT3NrY2Zn?=
 =?utf-8?B?cUMrdjFVNEJ0b2ZuZ2hhVXY1NHM5bFBDV3JFZkdMVlc1ZmNFMldZMmZuTVFz?=
 =?utf-8?B?dyt5VmtveXpESWFXQS8xNkUyQnJWLzVLd1VoTDlXMnlKMEJSR09PZDRxVW1T?=
 =?utf-8?B?UnJmMmpEaTBiZklaZkFqLzFiSUJuNC9qcDlHL09YRnR0UTlwV1pvTDJDSGcy?=
 =?utf-8?B?NllXeDNyMkpNZ3JBcG9NSC9wWVlSQ3N0MStWMWp1Q0RnbFpwdEN0dW9xYVg1?=
 =?utf-8?B?ME1rNDVnY1dIbklVeDZxYWpVLzlTdVBKTlBHZTNLeWFGbmxNU2hGWTgySGM3?=
 =?utf-8?B?UEYwbTM1RFdhK0k2Q29YWnByTHR6d2x6UFl4VXBOaGR3M3JMUzloWkxkYkFo?=
 =?utf-8?B?ejVhWlgwK3ZyUHdwNFRBQU5DSXAyOHVrVDExWTdQUEtweEFTdHlDcUVsYjls?=
 =?utf-8?B?NW4xMW1wcEt5NWg4V05ia2lPUHNKT21BSHAxaDB5eVB2TzBUVjZwSmFuZzZX?=
 =?utf-8?B?d2xNMnlldWVOY1ovRXpBbVFjU09ISVJ0MTZDcFRRV3RSemNZcXRvN0dvSnhT?=
 =?utf-8?B?ZUhiMGNrQ21kM2E5WEgrS2J1emYyMEYzZ0RMUUtFV0ZLdVJ5YzJuUVpmVmhY?=
 =?utf-8?B?ZHdZWWVSL052MWFkMVF1ZDgxREdtNjVDaFh5V2RxNzQzN0FxalV5RkJEdi9E?=
 =?utf-8?B?anUvUEU2cVRqY3N3RzVxOWV5QTVseFZyLzdHQkRNS3ZOc24vamZkWDFWWkov?=
 =?utf-8?B?cnhOV2ZzdXZjdFVpOU1iTUVTaTVwOFVMT1JmTG1vd2lqcU5SZzY0NElkVWgw?=
 =?utf-8?B?MzUxVlNCSFh3c2lsbWNpYk00VHVqTlkrMWs2NWl5d0xUZTNJRk5OMWtjVWlR?=
 =?utf-8?B?a09pSDZKR2hsQVlCMUNGLzZ1ajdOSUExVFQ0bk5CalJSWUtYUGxJUkxtV3Uw?=
 =?utf-8?B?MHVkR3V5SGN4NDRlem5HWlE0T2hCM3IxQ1FYaFBPaTZNMFc2QkJhSXRtOVRl?=
 =?utf-8?B?RVhIdUR1cW9wbTRxS0dhUGZrdEFDSlpHL3pYQ0UrVjBpRnhQMzZiTFNrT0Jm?=
 =?utf-8?B?TXp5M0VNVVRCWVJLMGNYTnVxLzJnSnRWQlptTTBjZ0VESHJPd2QvL3pVRmht?=
 =?utf-8?B?cmQvT2lLUUNIUHd0TXJ4OW9wNEJlS213dThGNlNtdjRjMnhLOGhqY1RudUth?=
 =?utf-8?B?V2pyOEdOUytYN1lFb1VPWjllMlVSaUo0eXAvL0tRVlNHQ0pmNm15THdjLzMv?=
 =?utf-8?B?ZWpic0RyTkhhN0hsU1JjN2RlMEY1emNPbXN0cHlEWGtmdEo2SEtTQUVKc0FQ?=
 =?utf-8?B?bGIwTGxtZVVJRnU0K0I5TWt5N2dScTJ0N1J6dWoxTnVGRkxHSjdaWU00NFMw?=
 =?utf-8?B?Z1JodzB5WXF1N3VyTE05eGwvQkJwa1pZQVo2QWY2UGVSdUVFRWp5UkZEYVV6?=
 =?utf-8?B?M2V2a1dScUhneWNvTUNIcDRacGJkRG4ycDNDNnJ5c05vSlFodE51cHkrOUN0?=
 =?utf-8?B?TVJ6Q0lqL3QyeGx0R242Zm5kcmxpNktXYTFrM1BhNWJNaVJsbFNiaG9iYVpl?=
 =?utf-8?B?UXZvSTBSUXVUZTlVYjRoZStFN1dVejRQY2dvWGFLekh2d09OK3BzVXpKb0pr?=
 =?utf-8?B?WG1aTWszc3gvMTkyanphbkJ1NWgwTXBqbFNiOXJFaXo5TExJT3haN0dmZDNW?=
 =?utf-8?B?SFlSNWNTWWozbXFOOEJDQWtPalhLWllNQ1dCS3NvNFhRRlpyMlJsQT09?=
X-Exchange-RoutingPolicyChecked: A5F8X+F9sRFsS12ZcsHkJ6uWMg4L1rKqOURjQ1RNDsSroEzGdhwF5SQejy9GY+TWDG7VYdA+sH+Rp+jUzdJC7/HNPjiUZ0YxMg3NRTWujvIOSxPkNtlhDM4j+JFk+0FOB3FAYoh0eU1jSOaEfq5RCni6UJZaTRLCDdE4WYP+7K6F0xUcVV6qsAWFELoLiXbAQOrmIBbsMGUpk8e7zi8wJfAvL+r+PLV5+RjwbQ6M3xW/VS4UTiMX2Y0rLPWcpXLpY3ncvfUM7G/y6eSL+wtcLpoYdMUQmjrVRTYu4BnemYMoYOSUS2of6nhPVcEyHIg/zNH8G6zvW3c49M+C4c8c6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49212230-2176-4756-fd83-08deaff3e658
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:58:41.1331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gSxJA6iO9P6m6g/uU1pgVLAt8wXb4VjM//8O2HVU44IEq7nRnH1eXuplnxxIo3ZcBshLg3weeZ81zWPSQJcUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
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


On 5/8/2026 12:07 PM, Mallesh, Koujalagi wrote:
>
> On 04-05-2026 12:26 pm, Riana Tauro wrote:
>> Add additional Error components supported by XE drm_ras (Reliability,
>> Availability and Serviceability).
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 48e9f1fdb78d..50c80af4ad4e 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -2589,6 +2589,12 @@ enum drm_xe_ras_error_component {
>>       DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
>>       /** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
>>       DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
>> +    /** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
>> +    DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
>> +    /** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
>> +    DRM_XE_RAS_ERR_COMP_PCIE,
>> +    /** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
>> +    DRM_XE_RAS_ERR_COMP_FABRIC,
>>       /** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
>>       DRM_XE_RAS_ERR_COMP_MAX    /* non-ABI */
>>   };
>> @@ -2606,7 +2612,10 @@ enum drm_xe_ras_error_component {
>>    */
>>   #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {                \
>>       [DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",        \
>> -    [DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal" \
>> +    [DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal", \
>> +    [DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",        \
>> +    [DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",                \
>> +    [DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",            \
>>   }
>
> Please add static assert check to keep names in sync.

This is a macro we cannot add static assert here.

Thanks
Riana

>
> With that addressed:
>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> Thanks,
>
> -/Mallesh
>
>>     #if defined(__cplusplus)
