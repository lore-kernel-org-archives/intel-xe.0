Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F7AECE582
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 06:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CA510E662;
	Tue, 10 Sep 2024 06:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfRa5JVA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A502910E662
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 06:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725948589; x=1757484589;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wGLyFSMgMW40aD6lzC9rK5CF0U4LpwYrcnxGrQOCfCU=;
 b=WfRa5JVA6JJP/lpcWzGrs03mTPi/Dc6u1sMmXfAGT1Pl1wSMmfUCm7JZ
 LW9ksrni1Nu8oUSeCtN6CWLRJ3XAQ37trZVj0K3Kh5e3uMBIgOwJRiUaA
 /k5gtQlNCmNvcPerO9y3Aryeg9cFkLHk3yx0aB1biJWOKSkSRv0WERV6p
 Uu6uwPVeJxHcPL1MOU/WpCwxWunEe5j7Y7NIryXNkyxkXfqzQugdIXTuo
 JnFW4V3z1BzCy/CEsXrbE4rW3g3CG1wiWZYJrA7kraalXbPsjQA+IbdKp
 nazc4LByVgHHoVfXut5j7+xXHJvdR9Wp8GacT8VgE+zpyMlZlmbnwl+7U Q==;
X-CSE-ConnectionGUID: DroYNAUYTAmEgTwQHdPKNQ==
X-CSE-MsgGUID: oxcEmIhFSYm1XuPfMLbefw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24176640"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24176640"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 23:09:48 -0700
X-CSE-ConnectionGUID: p50D9HeeRGqdNED9aOLIIw==
X-CSE-MsgGUID: LO7QjVG6Sj6fPehRnNpdJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="104378482"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 23:09:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 23:09:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 23:09:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 23:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEmxgsz/9hBlJOT6IEGOTka35Hjws/O9YpmKT0WYH4fQBWr9/vjBggz6QqsJ9LLDxWAcaucWre65AhSYElf32hBivTLnZkch0sq0NpuQSmHxjhbd0vftWFb8nMqG77rueVKWNxetw7Xf6JFFkvW5VJH57yot7fNWzRfpV2JV7rCvKd0+hYIOZusHKdaiJy/E8Ckwbb668cUGheZa6hxAhD192H2c6JGteoAfeqsDLgl/UQI2RfVQhfoopVDF0bzLDgicalW9amRdluhNUwPuQetVxoEQTAPk3TBvp9JARC1TUYTA+ml3YZqiaxqKj72BNuCps87zuJ5FDVZbpyJaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aiz1r4Jrf5TlTM1DDeBvYPoNwv7Oh8NcnvMRkh6p6o=;
 b=EUGqN47Nr/Q6UCTgsdRcvJXXClVj5+IUYqdwTPICPwFioqgJ66L/U1FI1BQTrXjtamhkm856rY2CETXfnXJgbOswmV5mo+xvV00suwXCJ6bnqMVa3/uvzZlUBsT3CMDKgrmb+w0CrrbyobgumLl12F6wsZpe9cscP6y2T0699YvJ7LrfJYxZv1OS5vtUKhyRGDmOfULL5+uO/R4X41JqzwqyjC1tTwlwtnkY/TnGcVuqNCQNStL3aq8XDUbuBbGVGAX/+lwJkBNaHkeaHdd0iZbtC+Wvfvd/mYQe4/aFJM0sbET/EXF1hZawoIlq0OXUOlY/4gHSOJcLHqQF7rP+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8384.namprd11.prod.outlook.com (2603:10b6:610:176::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.28; Tue, 10 Sep 2024 06:09:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 06:09:45 +0000
Message-ID: <ec0e5117-edd7-4c9b-a154-fa8c760fc293@intel.com>
Date: Tue, 10 Sep 2024 11:39:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>, <badal.nilawar@intel.com>
References: <20240906071126.28078-1-riana.tauro@intel.com>
 <20240906071126.28078-3-riana.tauro@intel.com> <874j6pm3wk.fsf@intel.com>
 <3371ff33-b300-4aa3-bce0-516c36f3e3c9@intel.com>
 <f9c11e5f-8ee9-4cd9-9b3c-9f95c146021c@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <f9c11e5f-8ee9-4cd9-9b3c-9f95c146021c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 761def13-7963-4964-46c3-08dcd15f2a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anFTbi9OQ25KOGI0UTh1R0pXeVl4aG5Eckt4eFVGa0t4WlZ5YWt0SHFhak9q?=
 =?utf-8?B?MWpKdjE5VzA4WjMwNVlBc1dRQXZsbEpwYWoxT0psSlJ0RjkvOElBT1dzdXZL?=
 =?utf-8?B?MkZVRGszUXphWVQ5KzhiQ1FDYmtiTE9LTFVZakhJSE9pYnU3UnlmcjY3R1N5?=
 =?utf-8?B?bHVUcUtJVVhxTWk1QzJHOEltS2lrTFhEUS9qZHZEeU5OaUZjR2c2TXhqK25K?=
 =?utf-8?B?aUNpcEZKSDEwelphdnBDbks4dS9neGZxSkRhVE9YeCs4SHJ6bCtvM3NLLzhT?=
 =?utf-8?B?cjNZNXp1Q0o1S2xTMG9nTVJ1TUV4MmtqSklNaU5nWjdCOVR5NEVkRVZ6MG5q?=
 =?utf-8?B?TWQvQWw5SlA5cHFxQUtTbzkrNEdFTXUvWExwT0thVmJRLy8zS0wxWTE5VFE1?=
 =?utf-8?B?SmJaeDdUWThCNGhwbmN5ZFYwak5XcU4wMExmelZScGo1ZjdIN3BCRVJiemZm?=
 =?utf-8?B?UGVsd2Y5dG0yc2VHNHVZTWdaVk03QjgvTXU2cWZBOHYxcFNvb0M2ZmhnZEth?=
 =?utf-8?B?dUQrYVJ6ZkZJelVsQTlsSVVqTzhpclpsUEtVNFNuUmxpV3hEWDNwM2ZqRWZM?=
 =?utf-8?B?V2xDOUh2cnJQcUFQQUhndHdwdStRN21qbS9Wck1sNEpTY2d3R1IrOHJ1aVdH?=
 =?utf-8?B?SUxyR0FOTVFrOXJ3dGkwN0tVcGVpMW9sSWZNK25YMGx5Rkt2OWFINlhVdnJG?=
 =?utf-8?B?dXpqR1gzRHlqeEdqb1ZxOGF1WDE1ekRObG16dnpmVjV3b1F0eWp1Y2l6dXVn?=
 =?utf-8?B?WHVOSWZQeVJiVUp0MlhBSHlPRjJLUVBaZVhQdmJReE03ZTNlalNXbWFUSGtQ?=
 =?utf-8?B?cjNwK1laRE1uS0llVm1vTU5XMkNJT2U5N25ESkNoaEYwY3c4MWpvS3JpaGdt?=
 =?utf-8?B?amlyTHJDOG5YUW1HMkFUS1B2cmZpVUxra2svc1pyQ0kxWGthSFJER1RSTXla?=
 =?utf-8?B?MVhRcGlUdEhVQTFSRjBPamYrMlBtQ2M2MHU2TFJPNWg4Rks2dklSNk5BMzdt?=
 =?utf-8?B?c3drZzRjNGxEVVE1VE05bE5taU1lTDNoQVlNeVc4OWJHdWJQQjdpWWdRWjhz?=
 =?utf-8?B?bnpwUWlPWUhkdXhxeWNjTnREY2dBamp4MURiMTNlUFFqQnB4eXVzVVFPTzBy?=
 =?utf-8?B?cEltVFdPZWhkNytYRGxEai9NL05uSzFFV2pKY2owTk83ZGczQmxRNGtKQVdl?=
 =?utf-8?B?d0lZcHlhOGwyenIwUU01SEdWYXdTdHR3ZGxRcjRtVjFQeEc2WjV3OVhCMWkz?=
 =?utf-8?B?cHdlR1BuOFFFZ1R4M05qRkhnSGVFK09weUhBcWVmNWtZL3czbS9Xb0hZbjRY?=
 =?utf-8?B?VkNEelRDUXVraVVxcW9ZY2phM3plckVjR2ZYbXZwQjY4TURUTURYVEhUS3pY?=
 =?utf-8?B?b29RcEZ1QWdUSTFWdGRBWU1jYnM2MlhUUHNiaVc3Qkh2QlRoSDdRK1Y5OTlO?=
 =?utf-8?B?dnlZK0FsbWFGeEhKejBvNGtpK2xRdTNGeVBkakdPSjFKbUJvVVJ0bVJRcEpQ?=
 =?utf-8?B?U1E1ZmdZNWJ3Qi8vaGplOERvcmM3VXJCaFByRXJ3RXdUNnR5WTJIYkw1WHdL?=
 =?utf-8?B?MGcrQ0dJaUJOUDZoM2pwZW1yZ2x3WURxeTNRSms1Zk1XRmN3Mkp4a09jWGFG?=
 =?utf-8?B?Vm5pN1l3WFJ1b2x2aE5YeFpVdnNBU3BFeGZ3enp2YUg0d2xSaVpjOUhUNjBJ?=
 =?utf-8?B?RmVQUzlMNjNwNFZ4U2NNV0RyRC9rOUNhY0xkQjBXaVovdkp2Mk1Pd25SSFBu?=
 =?utf-8?Q?BT9Y27S8uuIwLQjTCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmIxdXYvaU5kYmVjNk1QL1dnTGNkSkdwaE1BbzExS1RXcVIxVDd6S1hiUzNt?=
 =?utf-8?B?eTI2dDM2UndySzdJSnExRmdCUG00ODRXMm9RajVFQXFXYVc0MktVd0lQbFEv?=
 =?utf-8?B?VGVBakhSbVh3eVJza0gzRUJBZVl0blRVYlZteXVEWE82aHl5NHN2MFJUUzMy?=
 =?utf-8?B?OE5CcHN6NFRJZFpQSEE5UzBKSkNIRmhIUmY0R0dUVzJBRFBOdGZDL2xnWmZF?=
 =?utf-8?B?OVBtdnpyU0x4Y2trWVBvQktSNzRDNEVQbVZlYm5ETWF0UlhORkM2SzVobE43?=
 =?utf-8?B?S256TXp1ejZWZmFDVWlka0N0Y1V5TFFxV3pZR2xnZ1FzTWd0UjEwTldwaVdW?=
 =?utf-8?B?NjhLMkFWRlRHNE5IdTUzSFBuTzNEVmkyQU5mVndTQ0dBakFaQkdRZWl1RHZo?=
 =?utf-8?B?eEpsMnBHWURNcjFnK0RHS3JHcjhYWmMzWnNVR3prOG9jUjJvTW9XTXRINnFS?=
 =?utf-8?B?VGxGYjMvcE1RMHhvVmNJditiMUJyemFGZ21pbG1taVlDdG5pd003ckhPMEpX?=
 =?utf-8?B?WS9FZ0ZHT2d3VzloY1FDUXpsTU92bjl2blB6UmZ6TFNFcFZNK0pnZGZoK2JK?=
 =?utf-8?B?L0pCbnBjbjhSZmhiSHRQYmpyWlozM3d4enR2Q3RDckZIZlU3UjZnQWpsQUNq?=
 =?utf-8?B?Q0VKT2hEcXhRQlFDVk1Kb3FDb2c2U2xmZEwrMC9NS1lKOER5K0VUZ1lLWHRi?=
 =?utf-8?B?Skc2czRwcS9GS05YbHlEb0I2aExxWloxaUpoOE9DOFpVRUUrdm96Q1I4TTZY?=
 =?utf-8?B?dFBmWS9SaHFIQmI5Z05RdDB6VzlZSHh2cm5tL3hDUkp2VUYzK0hHbzRZU21X?=
 =?utf-8?B?UmtRYUM0c0ZKUzR6b3lDQ3pjdi9TUHFSV1pLWHI0Z2NXdm5IblAyZFhiTkl0?=
 =?utf-8?B?aVlNMjE0Nlk0dG1mcTN0MktkbVkyMll2NlVWRnB2cUdsV0lIaEsvNldnVU5O?=
 =?utf-8?B?aktrMmVGTXltU2FkQkZrS1dSVXFRVFBhOWxsZm56K1NTam5SWHVSd0pOU1F1?=
 =?utf-8?B?RWtONnJmUThpcEQ0Mk9waHFldm96YzRCQ1l0c1NEZW90VlE1L1ZkNGFvU3Zo?=
 =?utf-8?B?a0htbHJ2dWJVNHRnaHNkT1JScDFvNktwRGNrMkN2V004b3E5REp1L0R6TWsz?=
 =?utf-8?B?czZweUFxaVNMbXZsYnVWdjBxaDBMOThlU0w5b0RMUUkxOTNLODBDV0NZRXlN?=
 =?utf-8?B?YmxaYjFwVS9uYndtdys2emVqdC9QckhPeEhXYStaZEZOcHhNU2tSVUFXanRL?=
 =?utf-8?B?TU1QQjRUV2VKZGllVktrYkxBMEFGelIwZFFXdnBkRzBFZW03dlhKSnZXelR2?=
 =?utf-8?B?TEw1eDNFVFVvVEVmWkJlTHFTZithTWt0RllNR3NVR1FLU2VjRmplSlJnWXlx?=
 =?utf-8?B?MnJTa2VlcTVxYXdXUEdCVklnZ1FSZ3VidDJkcE9zRC9jWEdLTTBndDFNQ1pU?=
 =?utf-8?B?cDA1Lzg4blFKeURlL0pPVCtZQ1lYcDFhVmF3MXY0QjRicWMxcUhjNlBrcGlL?=
 =?utf-8?B?N1cyZExja3JQb3FSSEg5M1EzaWVNY0ZwMkhkYndWN3RId2JHY3g2MFU1UjlX?=
 =?utf-8?B?NG5ZcGZnc3dwV0pYRzljZlFoWmdNSVJ4aUVQL25FOWxOTWt1dFY3bnE3Y3ZC?=
 =?utf-8?B?cVc2cHo1TjNkbTNMTDQ2aEw4N3ZtdW1WbDV1dGVaZU1sZ25zOEdmOGNVM2My?=
 =?utf-8?B?aTFXZzhJNTRMRWJGK0FqcGFJQ0FqU0Eya0w1d04ydHEyRWJBRnVtNlZXdVFN?=
 =?utf-8?B?aGpacldyZVlpeUtjQUg1cnIwV2dTSWhwcHJ4TFlwbzQ2OGlDSE5nclFSV2JX?=
 =?utf-8?B?eFJxMnE4dE5qTjVRc01sUGdMU0J0cE1LcFdpVDJnekxSUEJCekdXOFhUSUdI?=
 =?utf-8?B?alpKcWpFMnI1TUdMYXVPd3UwNnBEY0ZCMFJlUjU2bno5VCtmY2FiVWFWNTJK?=
 =?utf-8?B?bHRBeXhPVnFvUC9hckFxSVM1MlQ1MG5HOUcvZjdraTN6Zis5OGEzS3FjcFFp?=
 =?utf-8?B?MEhacXQ2L2dlcWw2cVJTcnk3bXpCc083Y09GUm5sREI2OGl5SHR5dHRTMm5U?=
 =?utf-8?B?K20wZkdqVlAzYXBEbzRCdFFFN1JIK0xjbnl0MFNKQTBBRkZmcWRab3pPektY?=
 =?utf-8?Q?BTj1czxzNQXnxzgaXwayHjCiY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 761def13-7963-4964-46c3-08dcd15f2a9e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 06:09:45.0493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxkIkyjp2+97VATxixgOCyf9LH7fssbarYqHQAaLyHJny0cx++L/Ov9iavPAjSz/OGF/oCyjmu6VVlEvOKAHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8384
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

Hi Michal

On 9/9/2024 6:42 PM, Michal Wajdeczko wrote:
> 
> 
> On 09.09.2024 14:38, Riana Tauro wrote:
>> Hi Jani
>>
>> On 9/9/2024 5:32 PM, Jani Nikula wrote:
>>> On Fri, 06 Sep 2024, Riana Tauro <riana.tauro@intel.com> wrote:
>>>> @@ -288,6 +300,7 @@ static const struct drm_info_list debugfs_list[] = {
>>>>        {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>>>        {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>>>        {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>>>> +    {"powergate_info", .show = xe_gt_debugfs_simple_show, .data =
>>>> powergate_info},
>>>>        {"register-save-restore", .show = xe_gt_debugfs_simple_show,
>>>> .data = register_save_restore},
>>>>        {"workarounds", .show = xe_gt_debugfs_simple_show, .data =
>>>> workarounds},
>>>>        {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> index 3924f9f3d0a5..85a35ed153a3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>>>        return gt_to_xe(gt);
>>>>    }
>>>>    +static inline const char *str_up_down(bool v)
>>>> +{
>>>> +    return v ? "up" : "down";
>>>> +}
>>>
>>> Please don't add functions with names that are obviously going to have
>>> name collisions with core kernel headers. This now conflicts in
>>> linux-next [1]. Please rename until we can merge the real str_up_down()
>>> from upstream to drm-xe-next.
>>>
>>> Also, please don't use static inline in .c files. Just let the compiler
>>> do its thing.
>> This was suggested in a review comment to have a local copy till the
>> function lands in the tree
>>
>> https://patchwork.freedesktop.org/patch/605708/?series=136477&rev=1
> 
> and there was heads-up [2] for potential conflict that was likely missed
> 
> [2]
> https://lore.kernel.org/intel-xe/7b0a9a05-3a98-4ec7-9c21-f9743602b16a@intel.com/
Sorry, i thought this was regarding cherry-picking the commit to 
drm-xe-next.

Will remove this for now
>>
>> Will remove this and use the function once its merged to drm-xe-next.
>>
>> Thanks
>> Riana
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>> [1] https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
>>>
>>>
