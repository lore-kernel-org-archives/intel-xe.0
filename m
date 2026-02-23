Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9F4E98E06
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 08:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0BD10E272;
	Mon, 23 Feb 2026 08:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdBcjG/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03F410E272
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771835267; x=1803371267;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=NjudEylURH6E4lU1m5UgLvtHgYt5nS6GBGOd0bB934E=;
 b=jdBcjG/8Jbz9HzuCU0fqL6Mi7M4YkBi0k22NeI+Snt99LtqCazcKP+J9
 XnWTQ8uSbRp/fq7T9xwB6MzgtqcIrEJ4FMn2qvuJhsrITebtNON9hhx+f
 HaFIVMluyemn1xoIgL49sykEZD5x9N4L1FblJFk4GaPGLo1u+ZR7WBM/z
 H0JZ+syKl6LKQw/gi36vT3/dHcCC/8ttYpaO6+sqCb7whhTAamPglGkxK
 27JZ3xgshAf07YAt0z7R2wlm+0V5LzNtRBj/HwO7Kl/gDNs81qNkY7fCn
 sBTsOOhh6Dl5kUxDK848EEiXsiZwzo3WtdcblMSR/+k+IRg9QwOSJC2xC w==;
X-CSE-ConnectionGUID: W1ekXntpS4CWFI8AmlzhZg==
X-CSE-MsgGUID: 2QWiF+YiRcedHooDORVxgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72029726"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72029726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 00:27:46 -0800
X-CSE-ConnectionGUID: fW5/xfZdQ3CBV7SdxVgn9A==
X-CSE-MsgGUID: PSDM5zUoRKeBw4XMPDMp7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246085393"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 00:27:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 00:27:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 00:27:45 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 00:27:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWxg8BNmHTJ2fTWnV+bZBgFuVER3XLGkrrjYRAsShLWjwCVaUSjPZeFRhXp9nCFFxnhmZFd6khk3m6szZ7hnJEAUHKisfo4kHU8G8ALC3UQSUjqc9W39gXFnwyjhQIi8GOIMnstYLQjmFT3a7hOMAY7fkcQAiT0I+XTwFGGDjndMCisswd+JevmdmIESG7x2wTnsO9qMptPttgecKcNPGqlIQ0zJTShViEV+5ufCqFEwth+EzD6SNOJiNpG4IdtvWv9Y4m1mt2OGOjTRPeNF56zJ+b7oZMeBiBYFBQSzQ4gEOqE5WNrC5zf3prkcUKGc5BNO6gDy5Dn83t4O1FAx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9GuqodoFXiAzUAni184f2PBI4q1OWVPfL3qmoJt0Hk=;
 b=my0PX7l+7/QRSugI71wqQ+9+TTgUM1k1zZKPUpuXCoqyqEExZSH1NdaGWSBQ2GdiKJOmw1nidqBQfkY78/Ta52EIEPnIsy4DjZfJ/Nsqq1j9ODrZ+beQBf6yfSrVWxfrU28XN2SBuUa9VSJGXLRC//W2Oxy2Lf8GA6KAHz5GFgnCGB2zJdiVpSl7QmifmdxxthGHKNwUbaGM2R5I2TrimC9k/mpkQfR9y/UJ98KzvYByrzvp62YPFIzZ/WFyD/r+8Uimmk8+QbkrzN4OB+OguQrmM/5hhX5T7ytEyYoXi5XOcMZDhFb3EIYsACs29vTyrPMTzxNV4s4G0L5gRzEEPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB7957.namprd11.prod.outlook.com (2603:10b6:8:f8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 08:27:43 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 08:27:43 +0000
Date: Mon, 23 Feb 2026 13:57:36 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 02/23] drm/xe/pvc: Drop pre-prod workarounds
Message-ID: <aZwPeIaFGHrFVwu7@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-2-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-2-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f9a74f-2244-43ac-090b-08de72b56a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlR5NHdDdjdUdVliamdGeWNCbXRkejhWNTNOY0ZWOUkySk12YWh3QVdSeEEx?=
 =?utf-8?B?aGRORkRQYWRJcENQb3ZYRTJlNHh6eFhoNzRCcGloTXZKMnJXK3lUOGFjdWxQ?=
 =?utf-8?B?WFkxVkpQWHd1YnZNMHFNNjFhR09RbG8vckNQWXg3Q0Q1bDZBYUkySzVKdEht?=
 =?utf-8?B?cjlRYVlRRmZXajlHczg5WmR2bXdYTUJKVW5tQ3JkWjNReDdEWU5TS3lVZW5a?=
 =?utf-8?B?SzUxVXk1bnh0eE5PQW0xV1o3TzJFUDZ3eUwxUUNZdE5JU1pkelY0NS9ycmpj?=
 =?utf-8?B?WlNaYXYwQnp4dnVaMXJMMzJTT1FnRzRiZXVtTmd1cGFzVlJudkNCTmt5YTdH?=
 =?utf-8?B?NFZFOHNEVktmMkUydzhleE5WNmsxdWUwL09yWWJwNEJyWXNYdE1ra1lSaTIv?=
 =?utf-8?B?SGIwbGFZTHhPNHIrSjVsNWkvTW9HblFPajBhcVhzWU91cG5NaUpEdytLZEZX?=
 =?utf-8?B?YkJqODZQRVFiRCtvVHFQTnV3VGZYWU5zK1d6ajhjQUthLzFQS1BaQjlOejNj?=
 =?utf-8?B?ZG80RVJheFFNVzZzRHRwQkJsNVoxSjhYdG0xNXpJRk05b2g3TzJFelBEN1ZF?=
 =?utf-8?B?L2s5NWZDWk8rWmd0RW1DZ050NCs0dnZXcEliNzFhUmEzMGN5WGpGY3B5R3c3?=
 =?utf-8?B?bjNkNG9wMWRiaEFkZmNVR2dvMkFFa1dGRlJ2eUF1Mlg3UndHb3NieWV2TGVx?=
 =?utf-8?B?bjg3NTJjMHhCV2RkNUo0aGpaN3ZjcGYwUTZJUWQ1Q1c5ODZmWlM3dTgxZSti?=
 =?utf-8?B?c0RPOEpuNUxFQWRMLytYZ0YzdXZoWFVwUWduQUJFemhTdytOQjlia3VUSzVl?=
 =?utf-8?B?eEdMQWNLUVVuR3VpYWFDaWFua0tJNDk3RlAwNnhCNzZpYW5xMXgxakNDYVUr?=
 =?utf-8?B?ZGdjUC81TStodHpXQlZNb0xtMGxNQUhqK2dOZitVaWhYM2tsODkvZVArYUVE?=
 =?utf-8?B?Ni92Q3NuK01HTmFRQWZMZVRoQVQwM2t2RENiZit2dDdmVW1YNEpBZFV4SVFL?=
 =?utf-8?B?MDlqNzN6ZDNnTDdGMTNVeS9DR0pTdTExTDBkSjQvZ2lKNmE5eTBXajJxanVB?=
 =?utf-8?B?VVZLeFNlMnBzb1pxdHVlczd5aGVRZ2RTRGcyTkpucGVUUXNlSm1iejJiTWli?=
 =?utf-8?B?NGd2cm1vVTFiRFpFcjZzaklKNFpISk5tampKV0NGeUtTWmk3ZEorU1o4MnZj?=
 =?utf-8?B?Y3pvS2h2MWlyN3lzTktNZGJGTmMxSGRhaW85Mkp4K29WZExIT25CSlNHQWxs?=
 =?utf-8?B?bjNOcnBtbm1BdE5zZVF5ek5EUVg5R243b3l5WkpsUkdlbWlab3JZeUlDMk9z?=
 =?utf-8?B?TGU4WkdkMUUrVXdoS3lhOURqd3NUTkRkTnJSTFpBelZPbVVhODBDaTUrSVhE?=
 =?utf-8?B?cUQxSmZWS09XMXZCM1h3TkpYYitxL2FuR0NYeE9FdzVyczJ4MENOcE12ZWxO?=
 =?utf-8?B?RTBjR29XUzdiYWpnSUEwbGhRTDlBWERxVGY1dlRSM2JIU3djNVBTc3dTK2Vm?=
 =?utf-8?B?ak94UXZxRVdyYXhnMVMwV2ZWN0laSXloSFJ0WGQ0SGlGS3pvWVlwNGQ4Q1NX?=
 =?utf-8?B?UnlHSHVYS0E4em92cHNFeDV0c1doQU10RzBMbkZWeFlETjNkUE5TREMvSkVx?=
 =?utf-8?B?c284d1ViMGRYcGZZZUlpTlZ5Wjk4OUpoczB5RkV3OFUzMHR5cHA4TS9BSWpO?=
 =?utf-8?B?cTk3VkNRZlpKMHNWVy8wZ3RGVGYvb0tTa2E2S0V3NHVncU85ZU1DMHpjU3Bz?=
 =?utf-8?B?bTc1ckxhZGd2RktMcE9wdnRTMnAyZVRzZzVTWjQwRU1Ubjk1M1ozTkQyb1Uv?=
 =?utf-8?B?U1BoRjU4TloyclN0WlJnM2VLYVdoR3l0RmZKZVZwWTRENnhsUUJvaTZMVG5n?=
 =?utf-8?B?QjRjaHUvS2dsbmtzUmJ0c0VrSitXMW01TEQ4NnRvdzJQeXBGOXFnVmdNSWhV?=
 =?utf-8?B?c3N5Q0ZPK0lkcytSTk53cXdUSVY4Mk1XTVlQQUZGdFU0M2oxVlNIMlZIaVgz?=
 =?utf-8?B?T2RMWEdNSjZLb1AwNXFsa2cxdzJYUHg2Z3ZzeWRWSDNqZ1I4WFlFTWNuM2F0?=
 =?utf-8?B?UjJ5STh4Q2YxdXowNXAzSURKR2pEQmYrc0tCd3NYOUsySFYvUmFzUmlsdVJF?=
 =?utf-8?Q?WZDk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em4vdDdCUWVMMC81c3A2Nm1jYkhuQ3pOQlE1cjVpUlA0Y1AyTkxIdEE5bGhO?=
 =?utf-8?B?dEdESDNsd0d6ZGZEelY5eWFJMHA4dit0aElHcVpuZkJYVUF4ZnIxYVR0dEtr?=
 =?utf-8?B?S3BISVA4azRFSFNSUktWcE9wK0VyZ05YWTF6dSt6eUVGSkZLbTdRMmFXTUN2?=
 =?utf-8?B?MWlyTTIxNzRlWkMzYk5lNTBhaWFsU3RhczFmeFFGSkI3QldKeUVGQ1oxMTY5?=
 =?utf-8?B?ZWlNRFgrRGhWQnNhYit5NElMbStGVlZDVUF1bVRNamlVQThvTUVjK2J6bU95?=
 =?utf-8?B?YTJvM3pHNy9QWW54L0RadXNiMXRUQVY4RXNhbjYvZUZ5OHBnQVIxc01iM2pr?=
 =?utf-8?B?dExBbFVERk5WRW1NWFNpc09LRWNYbWVzMWJJaUlEQXRzbi85dndvWFhJNmpK?=
 =?utf-8?B?ZUtNenpXN0lTNWJVQ3RMYS82OHk3dFJtN3h6SUU2SHZ1aWI1YUhwNm1ZNkhN?=
 =?utf-8?B?dVd6bVkvTHdYd0RxZUxDT1ZFRWlaYVFXU3M3Q28zcTBZSUZYUTNGMFNmbUM4?=
 =?utf-8?B?TS96eWVqc3I4YXBmcTlJQytCMmUza1MyNXUvMm5iaWlHUjY1U1BiMVp0Tkhh?=
 =?utf-8?B?Ni8remYwdG5RbFZLaWF5blpNaWg0K2NiVWdld01LUkdxMnNVWlVXSTRUK3dB?=
 =?utf-8?B?UkVWai9QVVlJaHJHVlBCeXQ4RmpGQkZ1WUg3bE9LRDJXOFVMY3RzQ0h5ZlA0?=
 =?utf-8?B?TUNpWTNrVU0yZW1YUmFEV296U1RacUs2UWkvRHVscUtjWnRZMFpOc3lWMFFs?=
 =?utf-8?B?QWROdnBQT0QxQ2tvZ2R6SERCREplbmVFeFBPcmtCaDhUbzNXMmpvNmg3b1h1?=
 =?utf-8?B?TTlHMVE5SmpIcVVNMHJSSkEwTjhxc0lLNGdtVStJS0ZXT0l0clhFWks4QjF3?=
 =?utf-8?B?UHB2NlYzOFZCQ3dZeDRIMDNWOFNFeEZmNlpERlQ5UUlDLzRwTnFIUU5Rem1E?=
 =?utf-8?B?Y2F2ZVRRY2Y3T1dCMlY0VzNmRyt6bVFRcmlCM1lFSFVwNmQwRXhoaW5vQlh4?=
 =?utf-8?B?aWJtUDh1L2pCbjQxSTJkQktCcWd2ejlRSnd2NTZZV1lkUzNBU2trL1BZRWpZ?=
 =?utf-8?B?S3U4WjR1dUJtZUw5OHMvbi9aeTJBZmVRUHh5c1VGSzlKR0VnNmprbDVubDMy?=
 =?utf-8?B?QUd1TmRRYWZMci9sSmRxejdsSmIrWnQwRGFVOFNNRGRpOFZMZkxIWHUxY3Zx?=
 =?utf-8?B?MVdvYTZzc1dkcG5veEViZGZ6SjlrY2NJaEdvTmpJVmhDVHBOVnZiM1ZTTlZC?=
 =?utf-8?B?cEY4cEVZa2krcXc2YitRdUxLaHZhYWdzV2hXcHIya0hpWkZDT24rSVVNZ09a?=
 =?utf-8?B?OFVLZDB0eXV6QlNiQ1BIb29mSnZRTkk0VmEyTzUvWm5RaGtKdDZsMUZGaWpE?=
 =?utf-8?B?OGorYVlEajU5MFhUR0svV0ttR0NOVnBmUnd0bGF0d1FLbXZaU3hTUlJ5Uzlu?=
 =?utf-8?B?RE5VZEF4S3NuNmZNUWZ2Zmw1UWFsQWhrY0tObzNEZW9Hekk0eW55TFo1U2M4?=
 =?utf-8?B?V1N3QlFmdEZPZWl5eS9pa0wxOU1rek9HVXQ3cGxDNkFaejcxS3hVa3hhTTJJ?=
 =?utf-8?B?MUZleE5NeTlDOHRaTmRPZjIxQUE3T2pYUGJHeTNqL0ppQVNvbC9BbVJXREtZ?=
 =?utf-8?B?cE5BWVJCdkZXM2tWTjdZc3BpVkpOdUpTaVdmeCtjaDlIUFhBRExLcXJ6eUNY?=
 =?utf-8?B?MWxLZmMvODNZMWR2R0RtUWYzaWltM1NsdVI4SVVnbTJVSlNVQkJyeXNOc3RS?=
 =?utf-8?B?WUFDVk5mV1pWTHhCQWhHbEl4TGcvU25ETW4ycytTVWNQd004NWt3cnQwTUhL?=
 =?utf-8?B?QkZ6UFpYNjE4cERhTmNVbi9leXBleUg1OTlURVIwVUE4L1ZRejZJRTUxQWlt?=
 =?utf-8?B?Z3RDaWV2RXFDZ3ZpWndoV0VJNHJmcGo0YkxabGMyckV0a2dSenV1aDdGUEla?=
 =?utf-8?B?eFJOL3REbFZMVEZ6NWJKSEM4clNjRnRZLzN0N3AvaWVYeDJoY2pTVjIxUmNi?=
 =?utf-8?B?VTJWWTNWcmJhQVV1T3FFTGNxeXNCckcrYzdGZk1PSUZEYUtvRnJPYi8zRjEr?=
 =?utf-8?B?UmE1eVh4SDZreXJ3bFdpZ1pqRzJOUWpaSU1rWVJVQjRRblluUVBVb3FHWXpT?=
 =?utf-8?B?eVExcVNjcE1EakZqdVcrVUJHQjkzQkxneVd2VjlJN3BnL2g5UHNXanR5MFQ0?=
 =?utf-8?B?S3paL0F6eEsvWUh0S05BYUxIbE9GNXlkaXlSNEVzWUp5V0ZyR2FOUWVMZmx6?=
 =?utf-8?B?WDVYUzNLd2pTV2pnSTAxcXFPYS9HTGpoTFRLM284a1ZkcXE3N1d2d00zZFl1?=
 =?utf-8?B?WTR0TklBSGdUZ3Nyemt0c3R2VHU0WHNvUHNTREJ1ZXFHOGZrdmRDU25mSmQ1?=
 =?utf-8?Q?OV5LACqTBRl8LNNr1t1DSkX7Bs7N+p1/njxBW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f9a74f-2244-43ac-090b-08de72b56a17
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 08:27:43.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EK4ASBuoEELjd0QlToPhXrSMz7wHPo7JcdgjMggJ4IkLq/Ld+IRmab1lSLZ+oQ2JCotWbdKcdk4IclXzxPoy8YErbDzwCBYeNPO66AjaLDC4iKlPDrwLV/i+G9IIqgdk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7957
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

On 20.02.2026 09:27, Matt Roper wrote:
> Production PVC hardware had a graphics stepping of C0.  Xe1 platforms
> already aren't officially supported by the Xe driver, but pre-production
> steppings are especially out of scope (and 'has_pre_prod_wa' is not set
> in the device descriptor).  Drop the workarounds that aren't relevant to
> production hardware.
> 
> v2:
>  - Drop the stream->override_gucrc which is no longer set anywhere after
>    the removal of Wa_1509372804.  (Bala)
>  - Drop xe_guc_rc_set_mode / xe_guc_rc_unset_mode which are no longer
>    used after the removal of Wa_1509372804.
> 
> Bspec: 44484
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c        |  3 ---
>  drivers/gpu/drm/xe/xe_guc_rc.c     | 29 -----------------------------
>  drivers/gpu/drm/xe/xe_guc_rc.h     |  2 --
>  drivers/gpu/drm/xe/xe_oa.c         | 19 -------------------
>  drivers/gpu/drm/xe/xe_oa_types.h   |  3 ---
>  drivers/gpu/drm/xe/xe_wa.c         |  5 -----
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 --
>  7 files changed, 63 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> 

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index cbbb4d665b8fe66105727e83cfc59a13624d259e..54d2fc780127742e2e152da438c7d3e8332f3cbc 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -213,9 +213,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
> -	if (XE_GT_WA(gt, 1509372804))
> -		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
> -
>  	if (XE_GT_WA(gt, 14018913170))
>  		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> index 427a889b2a1e04b1d01bd7db8add20ce41f60ce5..99fa127b261ffb0fe7bdae5fcbc78258f67529a8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -129,32 +129,3 @@ int xe_guc_rc_enable(struct xe_guc *guc)
>  
>  	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>  }
> -
> -/**
> - * xe_guc_rc_set_mode() - set new GUCRC mode
> - * @guc: Xe GuC instance
> - * @mode: new value of the mode.
> - *
> - * Function to set GuC RC mode to one of the enum values.
> - *
> - * Returns: 0 on success, negative error code on error
> - */
> -int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
> -{
> -	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
> -	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> -}
> -
> -/**
> - * xe_guc_rc_unset_mode() - revert to default mode
> - * @guc: Xe GuC instance
> - *
> - * Function to revert GuC RC mode to platform defaults.
> - *
> - * Returns: 0 on success, negative error code on error
> - */
> -int xe_guc_rc_unset_mode(struct xe_guc *guc)
> -{
> -	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
> -	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
> -}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> index f1f949e7ecc0c6afab3eaeb616fe49d0437d710c..b083fc364dd430e5868a4e6da62b5777f5a6f1e1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -12,7 +12,5 @@ enum slpc_gucrc_mode;
>  int xe_guc_rc_init(struct xe_guc *guc);
>  int xe_guc_rc_enable(struct xe_guc *guc);
>  void xe_guc_rc_disable(struct xe_guc *guc);
> -int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
> -int xe_guc_rc_unset_mode(struct xe_guc *guc);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a462d6983d8d6daf74beaf6fef5bfe2ab779179d..72fc4424017bf8fb7a42e3a3ae3f6adfe91cf21d 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -873,10 +873,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(stream->oa->xe);
>  
> -	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
> -	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
> -
>  	xe_oa_free_configs(stream);
>  	xe_file_put(stream->xef);
>  }
> @@ -1760,18 +1756,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  		goto exit;
>  	}
>  
> -	/*
> -	 * GuC reset of engines causes OA to lose configuration
> -	 * state. Prevent this by overriding GUCRC mode.
> -	 */
> -	if (XE_GT_WA(stream->gt, 1509372804)) {
> -		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> -		if (ret)
> -			goto err_free_configs;
> -
> -		stream->override_gucrc = true;
> -	}
> -
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(stream->oa->xe);
>  	stream->fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> @@ -1822,9 +1806,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  err_fw_put:
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(stream->oa->xe);
> -	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
> -err_free_configs:
>  	xe_oa_free_configs(stream);
>  exit:
>  	xe_file_put(stream->xef);
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 08cc8d7c221582662abff9397e27fbb8ccca468a..b03ffd513483449adc6b2937c0707e5bfc619a5b 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -239,9 +239,6 @@ struct xe_oa_stream {
>  	/** @poll_period_ns: hrtimer period for checking OA buffer for available data */
>  	u64 poll_period_ns;
>  
> -	/** @override_gucrc: GuC RC has been overridden for the OA stream */
> -	bool override_gucrc;
> -
>  	/** @oa_status: temporary storage for oa_status register value */
>  	u32 oa_status;
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index aa5755bcdc04a3ec2569ab9676a9dd95516f1711..4b2c77f51fd830fe2439708865fb0b966545bc71 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -499,11 +499,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       ENGINE_CLASS(COMPUTE)),
>  	  XE_RTP_ACTIONS(SET(RING_HWSTAM(RENDER_RING_BASE), ~0))
>  	},
> -	{ XE_RTP_NAME("14014999345"),
> -	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
> -		       GRAPHICS_STEP(B0, C0)),
> -	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
> -	},
>  
>  	/* Xe_LPG */
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index cc988f2a18d33365dc09d32f4e85ced01b823877..c3222d9504889b5175fdfa73db0bf4e9910a277d 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -8,7 +8,6 @@
>  22012727685	SUBPLATFORM(DG2, G11)
>  22016596838	PLATFORM(PVC)
>  18020744125	PLATFORM(PVC)
> -1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
>  1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
>  22014953428	SUBPLATFORM(DG2, G10)
>  		SUBPLATFORM(DG2, G12)
> @@ -53,7 +52,6 @@
>  18013179988	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  1508761755	GRAPHICS_VERSION(1255)
> -		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>  16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>  		MEDIA_VERSION_RANGE(1301, 3000)
>  		MEDIA_VERSION(3002)
> 
> -- 
> 2.53.0
> 
