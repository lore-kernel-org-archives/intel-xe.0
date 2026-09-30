Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDFFCA5FAC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 13:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5652C10F3EF;
	Wed, 30 Sep 2026 13:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGpvzD2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8611F10F3E4
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790775190; x=1822311190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RFGtJJJQBmhr4LTRRIJ3IBJBsSM1rhGXk2nSMW1F4MI=;
 b=mGpvzD2n48luGGxwXldioIuKFxiq8yYDLbkcGjhT5xFRTwVHkgLAZ+GV
 BpLYc/QALuLiuR67wxNgteJwHGBfcWQ4At0PipEv4HlC2KODLsBLt5XWd
 DNHt69gIDOPHuyZrCHJxRx1t0KayBUeiSEZOfCRPcQhmKtfUcvVWOtG9v
 92MKRsOZ+jAxZo4pLTWLVbBZZJ0PvTuRu7/z7DM59HiPU6qEXBmGcMupk
 3zmOGSgwkM5wzHsux1WPJxatDpbDLMqwZC2IL2oW+0iJ7MZTLmFVWSC5x
 oiouFu07xHs/SAwY0pRvVYGu7z7zcX9VcT5QNDegndEDN2m3gzbHqsfYy Q==;
X-CSE-ConnectionGUID: yFoMClwZRxSQXnj72aC5zA==
X-CSE-MsgGUID: JmggS93WS5Wv1Gw7TctnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91610191"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="91610191"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:33:09 -0700
X-CSE-ConnectionGUID: BU8ZwK2VTsmADOgEGkQFBg==
X-CSE-MsgGUID: PIfAfUzrRLCVkNjjJAzYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275238970"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:32:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 06:32:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 06:32:44 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 06:32:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cy0p/62UNSOzSpYSdLp2/ExMWg2n2gtEXy17dsMTnL5I8cfluvQs3nnSJu+wEBFnTK6AWj1yzu/3MIfLe9qXhtcBqltZSGocOoMIW+40evWoHFXIe+tgaS3tOaHQqrlXohU0Gv5WuTzPQbeHQS9idjXdjaXaVbRDTS6zblUzC+4aw7vTV6GQeWEebJ+K7Ld0Mzh5eiVg+fk1zTrCb23GzkdTYNIr+AAJLP7RSpX5677LLd++3ehWbHH3DvKb52St1WJyM4/QdoZj9kDgwoAYPfleabdItH0VedN88yiWoC0hoqESo5MM6QMDjW7UdAbjAAkIpF3/J7shskyTNstdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoSl++KdxUGO8thKQUwwhFnX4GHye05149YL/EIa11w=;
 b=JKt1umxx1AQWVe30W4PooU3jgGV++Xeak5uq2ctAZZCEzz/b/i2NNLseNS2vXfi8WKqjpLuEwBiSCF5HUh8kOaDewmLU5FMgbBJb2PptwG0neGDwGhQ0ALdTz00MVeaTRIX8bSsqOCrQdxENRKoL3BYYWzEK1UKJZFqybudINY/LS1WSF717M5BsEnXyvBpcyjM42qN6kQpbALcrP6KU9kzCSAIga4Vl5V2dctZb5DNRJ9ENi6/u9pnDdy9QKjq/IAvA1XLKyisYnuDR6yvpe2Sli9Oys9I8wyg0NnZrRwUJH74BM+eGQ291hqnXv+Fn9o/Ia5vkzNmlMt7Txk23rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 13:32:39 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 13:32:39 +0000
Message-ID: <cd32b750-3c80-4069-82ff-d677eb966c21@intel.com>
Date: Wed, 30 Sep 2026 19:02:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/xe/sysctrl: Add generic mailbox passthrough
 debugfs entry
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michal.wajdeczko@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
 <20260925135521.1804299-8-anoop.c.vijay@intel.com>
 <armunq2t6ZkNjVqt@intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <armunq2t6ZkNjVqt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0307.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::10) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|SN7PR11MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 16eabfca-945e-4a7c-ee80-08df1ef74bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|10067099003|3023799007|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2Y+UxrUl5dF1V9Tg3RmfxTLxQ7rRxey+5FjqNWzEVy+kuO0alWTtBjeCNt+JFFFXmz+9TEPWCpBNegoPxh92O+ccawgHuFilyZLobpNK09hNDQ721yCad5O1I9lZfgHx2g5Z1W+5kO/xcBfd+ITWSR4H+ifk7p+HrYVBMRck1nAGBUMjXnzV9TI10EuPgskSF6SQlhW4B1herSOMTKcoh8ieGbvFXviN4RoCGDweZqa7yj797F49sVfSQj3fmrCQ3jdJhqjQGYc7i11K/XdyZXvmOUN9gPtK507mk7M+/Xmyq3gt9PvpwKrJtS0evWcuEheBE+QN41teSeW1wl3/Ndx7UoH2hth0EF3xWy2BNMiCTwE11JBlzIsJ5hMGZr/nQSKoRQup/C7b7Z49uX3YyJyPh6FPYClr4sorr0gwtCMaYkUP4/8bYJ581R4ZsB2Hgo+tRVhrHFwKCjc6Idxj/rxqEka+2e9VLpWvugQRMk9Qa9Nsfe1cPaJVPwKp+9vq05JHfM0g7WKRx+eGU0kAgp+6lLd4Z9ZrLKmkpPOr4iTM3FuBsvCFeCiEMOJjw+RMKvJ8DL8oqZj+p6Jpzi0T/Vlt2X2cd7w26LvnsnxY1ZKjawNoJsvurINsEWp2i/JyHO+O3s692vvYTeWzt1pRpMssNGLwiF5LepkO4sOQg6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(10067099003)(3023799007)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGhRMUpHb0R3OEdRakdyUnl2dTVyUVd1RmxoQVN2OGlpYk5Nb3A3czNndk13?=
 =?utf-8?B?Q3crU0dIT0NBMHVlcXRZdmUrUFZ3VWV5QUtCZTl5SFMrZWRsSjd5T0F3QytH?=
 =?utf-8?B?VUxKSEhGdy9UQnhnWloyc1FrVnJiZlNkMWhQTk96QXN3aUNiN08xYTBIMVJn?=
 =?utf-8?B?azNnNHR2REgzYnJLeDBsOE5mcWZhZmtqcHVQQXFHM0U4WjNjc2ZXenB4QndV?=
 =?utf-8?B?K08yVGtZWTdNUUd0Z0NpaTVBK2tGbFB0Rkw3d3VicTgxMG1ROVhXdFg3YkFJ?=
 =?utf-8?B?RVFITDZwclUvZ1EyOUtMUzgxRGVwV1pKRHhvV3VBU0pudDV4VTlhMkkwN2lj?=
 =?utf-8?B?MVVKZ1hlZ2JFT2pac1hDUmxNUmtXcExGbkZ6SWVORElDc0IvVWtlbCt2alJW?=
 =?utf-8?B?THRFUEd5c2FDTHI2NEdYQ3ZsSzZmYjEvYkxKWHVscDBLSXBsa2Q4WDBYRkF3?=
 =?utf-8?B?STFUbEl5UksvY0d1RnJXZlpwZ2pGeUpWRGVxMlVHZU5rakNudEtWVGlmcU9C?=
 =?utf-8?B?Zisyb05oRTJsTTd2em9VdExDbFNjL01NRDI2ODFNNnc5emFKQ2N3dUVLcjRE?=
 =?utf-8?B?YUlPb2VoYWpHU3N0Yjd6QS9nSG5SRzR6UG5wZ0ZUWEkvbmZwWk1KU2tvaE1J?=
 =?utf-8?B?bzNTNFNvclNPYWNBZTBUdjI0ckxFU0h3MUQ4QTF5Ykk3b0dnSktZQ3RlbWJo?=
 =?utf-8?B?YzI5UTFNOGJMSm1EdjNIc2JxVG9QUy9zRXJuMTZIMzZNTEJ2b3FxN0laNTI1?=
 =?utf-8?B?MHlJd2ZhL3ExNXhpWUVNS01JS1FzbU5Sd0hLNVR4V3hHVWxJYTdMMy8yY3ZL?=
 =?utf-8?B?TThHTkFtN3FXQ2k1bDMweUUwOENMSEdSNGpMbjZ2YU1oazBBazNnQzhhWjdE?=
 =?utf-8?B?MXZoYkFpYi9kWEtSNEZJVzBqTHExWkc2MzA5bTJ2bEFIeFovRGtMUmdEWG5C?=
 =?utf-8?B?UHFQQVRObnhSY29MVThwQ1BkMktwV1pRYjZuL29iUWM2bE50OFZIYy9ySjBQ?=
 =?utf-8?B?UGY5VTBBMFplRGJLUGZ1RlZycjYxcW9QQmp2M0p2c0hFeXVCWDVxaGlWWkF2?=
 =?utf-8?B?WGtTbVRYSDZwVzMxNzZWMEFGU2d6WGowd1lpWkxmcjNKZnpPbVVPNm1VQXpT?=
 =?utf-8?B?REZlUzBCSDN1aTJscWhNSEozTTJRcjNYaVBySWN0MjdqMU83M2ZaT3hqU3lv?=
 =?utf-8?B?dWhqWGh3SHRLM1plY2gxWXNBZGhXWGdXUDVYYTh3M0Y2dmQwNVBsVGtBM2NQ?=
 =?utf-8?B?UVVmN0RLaHVCZDlLVGFla3hnamF6T29NTHlLa1lHSVdpZlMrZXZzMHVUMmVZ?=
 =?utf-8?B?QUc2RFM5dHBYSXpsQ1VBalpRTk01QitYSThHTW5ZUmlBV0k1Q1FBaGpOTHhW?=
 =?utf-8?B?Tms4T1czbjRMUUJod2s5TWpRODEvV2ZpWTlOYkdBbk9LVGRuRnB0NEVLZ2hW?=
 =?utf-8?B?ZmNiWnZwbmVBM3IxRk9nbVJmL0x3Y0M0M0MrL0ZSMTc1ck42ODBlMjMyUE0r?=
 =?utf-8?B?endPWkRnU0RqYzNhSmtYdEJ4RGVkVXgyVXlOYmw4bGh2dk1FaXJnU252TTNC?=
 =?utf-8?B?ak56R2RadSs1K2phS3JlMTVjSll6cnVPOEtJVVI0eGQzRUhSVTdIUENXaDlU?=
 =?utf-8?B?UlVzeDl1eklNalhncHRySkE2QkpPZlV1K2c3UVhheFV2OEdveGlXSXBLYVFN?=
 =?utf-8?B?czRoNFFIVEZwREFwZXViNlFIRFNCOHRPWUJLUmxsbHppU0pzb2ZlSktObnJx?=
 =?utf-8?B?UGZPU29KS25KUUNtNVphNzVtN2pKa3BGQUI2K0RZN0RLckgyNndxYjc3SVVl?=
 =?utf-8?B?REQxekVOcVRYaHZyTmRHVnpYc0x1TlVtRHNTamFPbmlaWVBJbFllQm9TdEhh?=
 =?utf-8?B?L3ZjTHR4WC9IWkY2OWtaU1dQeDhLVGJXcHR4KzlrbStpOWZnaXZ1RW1DbVRh?=
 =?utf-8?B?cWk3Sm13Ym4za05NZk9MM1o0WGx2bitBd1NnbVJRTkNhOG94TWF2MzVFdUt0?=
 =?utf-8?B?aWhtMUdRekwwZ1F3OWNNbDVZcHVMUllTbFZmZExYcU5kOWk4Q3lkUVN3MVV3?=
 =?utf-8?B?UFJobDJtTXFNVk8xc1FFZm9jRndqRGdzWDRHME1rcDBkZVhIeFNQOVNzQlBP?=
 =?utf-8?B?M21yRkhBUmZqRXRZcVlaSlQxZjZRdUQzb1dPT2prMXBHdGxaMTJxdU5ZSDlC?=
 =?utf-8?B?bGZVdWQ0MlhZbHRXNFZpUEZZYW5HVnArTDVOQnNLejlIbGNILzFjQzlHY1ZD?=
 =?utf-8?B?ZTQvZ0xVYi9xWjltSmYwYVN2dk1NZGFEa1ZNUjhUSVhxL0NCcDVtQnhUV0Fa?=
 =?utf-8?B?RzdRL2FHUk5vTnF4eTE4aEhzOGU3VlYremI5L1ZqYkNiWnBYUVRNdz09?=
X-Exchange-RoutingPolicyChecked: HAC/8iS2c1Yalzi0cIPoVg4SJ6S3dSzmfeTytBYZfL/gHU0FVWwIrka8rOLe2Bpme3wtipr8FwPZMkEC5tTWltFqpsTp0FSwVwFaJbW9f1ZFkXQc+Va2DjGYYVOx+uAj943YiCbmsRtlrO4CuJzuv7sRZOylyr5wRpFrOXODGypbbBD3udkI2MRLchF0ibtX4/i1Rvd22PgEt+OTe5ZhB7x3V8J4WrSrqKNh5CxXl0AAmWv2qJVZKq4riFGuACHLcjQzza+Dz0SHSS9v13WaCslcXy5iY4JAA7IvvSsQaU5adUyMYEHbPu0cvt0EjFOvVLyCQoiRT7VAW/4sQ8p4RQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 16eabfca-945e-4a7c-ee80-08df1ef74bed
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:32:39.1654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqaZC1ADNjgngBQ/hH2k0+6nYWWM0bKCmuQm3B7Urqu0OySE5lhq7hMnMt4HOwwE9e2FSClIRsiLk2jhoYdfcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
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


On 28-09-2026 05:32, Rodrigo Vivi wrote:
> On Fri, Sep 25, 2026 at 06:55:23AM -0700, Anoop, Vijay wrote:
>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>> Add a "mailbox" debugfs entry that allows any System Controller
>> mailbox command to be issued for bring-up and debug. group and
>> command are supplied by the caller as the first two tokens of every
>> write, followed by optional per-command response timeout and
>> response-length overrides and the payload bytes:
>>
>> - Usage: echo "<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]" \
>>               > /sys/kernel/debug/dri/0/sc/mailbox
>>           cat /sys/kernel/debug/dri/0/sc/mailbox
>>
>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>> v7:
>> - Add per-command timeout override to mailbox debugfs
>> - Add per-command response-length override to mailbox debugfs
>>
>> v6 (Rodrigo):
>> - Reject non-zero offset writes for mailbox entry
>> - Account for mailbox header size when validating input payload length
>>
>> v5:
>> - Add per-entry locking for debugfs accesses
>> - Skip empty mailbox group/command tokens
>>
>> v4:
>> - Added a generic mailbox debugfs entry
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 172 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   1 +
>>   drivers/gpu/drm/xe/xe_sysctrl_types.h         |   6 +
>>   3 files changed, 179 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>> index 10675cd774ee..ba904cb24512 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>> @@ -299,10 +299,179 @@ static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_deb
>>   	entry->command = command;
>>   	entry->response_len = 0;
>>   	entry->status = 0;
>> +	entry->timeout_ms = 0;
>>   
>>   	debugfs_create_file(name, 0644, root, entry, fops);
>>   }
>>   
>> +static ssize_t xe_sysctrl_mailbox_write(struct file *file, const char __user *ubuf,
>> +					size_t len, loff_t *offp)
>> +{
>> +	char *kbuf __free(kfree) = NULL;
>> +	u8 *input __free(kfree) = NULL;
>> +	struct seq_file *m = file->private_data;
>> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
>> +	struct xe_device *xe = sc_to_xe(entry->sc);
>> +	struct xe_sysctrl_mailbox_command cmd = {};
>> +	char *token, *tmp;
>> +	unsigned long val;
>> +	unsigned int timeout_ms = 0;
>> +	size_t input_len = 0;
>> +	size_t max_input;
>> +	size_t out_len = 0;
>> +	size_t resp_len = XE_SYSCTRL_MB_MAX_DATA_SIZE;
>> +	u8 group, command;
>> +	int status;
>> +
>> +	if (*offp)
>> +		return -ESPIPE;
>> +
>> +	if (len == 0 || len >= PAGE_SIZE)
>> +		return -EINVAL;
>> +
>> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
>> +	if (!kbuf)
>> +		return -ENOMEM;
>> +
>> +	max_input = min_t(size_t, len, XE_SYSCTRL_MB_MAX_DATA_SIZE);
>> +	input = kmalloc(max_input, GFP_KERNEL);
>> +	if (!input)
>> +		return -ENOMEM;
>> +
>> +	if (copy_from_user(kbuf, ubuf, len))
>> +		return -EFAULT;
>> +	kbuf[len] = '\0';
>> +
>> +	tmp = kbuf;
>> +
>> +	do {
>> +		token = strsep(&tmp, " \t\n");
>> +	} while (token && *token == '\0');
>> +	if (!token || kstrtoul(token, 0, &val) || val > 0xFF) {
>> +		xe_err(xe, "sysctrl: invalid mailbox group id\n");
>> +		return -EINVAL;
>> +	}
>> +	group = (u8)val;
>> +
>> +	do {
>> +		token = strsep(&tmp, " \t\n");
>> +	} while (token && *token == '\0');
>> +	if (!token || kstrtoul(token, 0, &val) || val > SYSCTRL_HDR_COMMAND_MAX) {
>> +		xe_err(xe, "sysctrl: invalid mailbox command id (max 0x%x)\n",
>> +		       SYSCTRL_HDR_COMMAND_MAX);
>> +		return -EINVAL;
>> +	}
>> +	command = (u8)val;
>> +
>> +	do {
>> +		token = strsep(&tmp, " \t\n");
>> +	} while (token && *token == '\0');
>> +	if (token && strstarts(token, "timeout=")) {
>> +		if (kstrtouint(token + strlen("timeout="), 0, &timeout_ms) ||
>> +		    timeout_ms > XE_SYSCTRL_MB_MAX_TIMEOUT_MS) {
>> +			xe_err(xe, "sysctrl: invalid mailbox timeout (max %u ms)\n",
>> +			       XE_SYSCTRL_MB_MAX_TIMEOUT_MS);
>> +			return -EINVAL;
>> +		}
>> +		token = strsep(&tmp, " \t\n");
> Sashiko noticed that in this and below case you might fail on double space.
> I wonder if we have a cleaner way of doing these parses...
>
>> +	}
>> +
>> +	if (token && strstarts(token, "resplen=")) {
>> +		unsigned int resplen;
>> +
>> +		if (kstrtouint(token + strlen("resplen="), 0, &resplen) ||
>> +		    resplen > XE_SYSCTRL_MB_MAX_DATA_SIZE) {
>> +			xe_err(xe, "sysctrl: invalid mailbox resplen (max %zu bytes)\n",
>> +			       (size_t)XE_SYSCTRL_MB_MAX_DATA_SIZE);
>> +			return -EINVAL;
>> +		}
>> +		resp_len = resplen;
>> +		token = strsep(&tmp, " \t\n");
>> +	}
>> +
>> +	while (token) {
>> +		if (*token == '\0') {
>> +			token = strsep(&tmp, " \t\n");
>> +			continue;
>> +		}
>> +
>> +		if (input_len >= max_input) {
>> +			xe_err(xe, "sysctrl: mailbox payload too large (max %zu bytes)\n",
>> +			       max_input);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (kstrtoul(token, 0, &val) || val > 0xFF) {
>> +			xe_err(xe, "sysctrl: invalid mailbox payload byte '%s'\n", token);
>> +			return -EINVAL;
>> +		}
>> +
>> +		input[input_len++] = (u8)val;
>> +		token = strsep(&tmp, " \t\n");
>> +	}
>> +
>> +	scoped_guard(mutex, &entry->lock) {
>> +		entry->group = group;
>> +		entry->command = command;
>> +		entry->timeout_ms = timeout_ms;
>> +
>> +		xe_sysctrl_create_command(&cmd, group, command, input_len ? input : NULL, input_len,
>> +					  entry->response_buf, resp_len);
>> +		cmd.timeout_ms = timeout_ms;
>> +
>> +		guard(xe_pm_runtime)(xe);
>> +		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
>> +		entry->status = status;
>> +		entry->response_len = status ? 0 : out_len;
>> +	}
>> +
>> +	return status ? status : len;
>> +}
>> +
>> +static int xe_sysctrl_mailbox_show(struct seq_file *m, void *data)
>> +{
>> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
>> +	size_t i;
>> +
>> +	guard(mutex)(&entry->lock);
>> +
>> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
>> +	seq_printf(m, "Timeout: %u ms%s\n", entry->timeout_ms ?: XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS,
>> +		   entry->timeout_ms ? "" : " (default)");
>> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
>> +	seq_printf(m, "Response: %zu bytes\n", entry->response_len);
>> +
>> +	if (entry->response_len) {
>> +		seq_puts(m, "Response data:\n");
>> +		for (i = 0; i < entry->response_len; i++) {
>> +			if (i && (i % 16) == 0)
>> +				seq_putc(m, '\n');
>> +			seq_printf(m, "%02x ", entry->response_buf[i]);
>> +		}
>> +		seq_putc(m, '\n');
>> +	}
>> +
>> +	seq_puts(m, "\nUsage:\n");
>> +	seq_puts(m, "  echo \"<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]\" > mailbox\n");
>> +	seq_puts(m, "  cat mailbox\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_sysctrl_mailbox_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, xe_sysctrl_mailbox_show, inode->i_private);
>> +}
>> +
>> +static const struct file_operations xe_sysctrl_mailbox_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = xe_sysctrl_mailbox_open,
>> +	.read = seq_read,
>> +	.write = xe_sysctrl_mailbox_write,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +};
>> +
>>   /**
>>    * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
>>    * @sc: xe_sysctrl instance
>> @@ -325,4 +494,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
>>   	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
>>   				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
>>   				  &xe_sysctrl_ras_error_inject_fops);
>> +
>> +	xe_sysctrl_register_entry(root, &sc->debugfs.mailbox, sc, "mailbox", 0, 0,
>> +				  &xe_sysctrl_mailbox_fops);
> Should we put this behind the CONFIG_DRM_XE_DEBUG ?

This debugfs node is used for SysCtrl mailbox access during validation. 
Would it be OK to keep it ungated by CONFIG_DRM_XE_DEBUG?

Thanks,

Anoop

>
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 2554848e7484..a0628eb47bff 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -155,5 +155,6 @@ struct xe_sysctrl_mailbox_command {
>>   	(XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(u32))
>>   
>>   #define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
>> +#define XE_SYSCTRL_MB_MAX_TIMEOUT_MS		60000
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>> index 8ea6e1f29ddd..f12455f2886d 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>> @@ -39,6 +39,9 @@ struct xe_sysctrl_debugfs_entry {
>>   
>>   	/** @status: Last command result */
>>   	int status;
>> +
>> +	/** @timeout_ms: Last mailbox response timeout used (0 for default) */
>> +	unsigned int timeout_ms;
>>   };
>>   
>>   /**
>> @@ -71,6 +74,9 @@ struct xe_sysctrl {
>>   
>>   		/** @debugfs.ras_error_inject: RAS error injection test entry */
>>   		struct xe_sysctrl_debugfs_entry ras_error_inject;
>> +
>> +		/** @debugfs.mailbox: Generic, user-parameterized mailbox entry */
>> +		struct xe_sysctrl_debugfs_entry mailbox;
>>   	} debugfs;
>>   };
>>   
>> -- 
>> 2.43.0
>>
