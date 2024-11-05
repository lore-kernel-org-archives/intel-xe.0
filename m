Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E68D1CA0F
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 00:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F95410E4F3;
	Tue,  5 Nov 2024 00:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckJn//1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C5110E4F3
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 00:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730766503; x=1762302503;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jEhLvd1nMUvXjoer6BjwpMPbT+M8Vs1pgGlIuXQgZTo=;
 b=ckJn//1uR/97zAICjylZ5aqj5cbaCkV3mT6463encxnN3RSsHIIGB/JU
 ZIpcXxuYaTQABw+6PyroOmYGWgIaHJv8gXAf8MSXcoEn6qQaed7JzctIT
 kHvk3UirpRR0RmmL6tTycHasC8CVS6ZDfQRaBh6yjXk0CXIHfAkOG3t/Z
 7XfQwwMymfI550uubJWG+7IYOOa955Vw7OgY9ju9jqzzs51E8pAhG6w32
 tGdg2g34Mn69g4MFcwovfsomgOHByIJoc9hqJbBIiQd2ovL2XAs6TxZ0L
 E2SSG4oWN8iGfhvMtNOQnLQsIVSZehOuJeeOg+BynZnumI/QhmT31TqTa Q==;
X-CSE-ConnectionGUID: b6m/lhr5RnOZIlm5bh68nA==
X-CSE-MsgGUID: EkTe+lO2TJKIpqV1kEaK5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30437273"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30437273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 16:28:23 -0800
X-CSE-ConnectionGUID: jLlZ27IKQ1SreS0VeI0JDw==
X-CSE-MsgGUID: KqemQF7tQKy2E0zRJdqcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="114605751"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 16:28:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 16:28:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 16:28:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 16:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJwLPB9FTomcM6NL8/UjQDftVqDHRpATPJ03BlHLtitlBZVCIr+pu904bUV8QDfAJuatE4tmyYbJrc2X9prsLFE70Et0ITOeDn5BCEeqoGY+/RUgKpTE/STRe/jygXvWVdu/bwPtKQhDXZ5yVNQ2lFisHkc1fiklCAJ2ffHQEeAuzdj7Bzqze85ITAE5NwB/vHM2OagZKA1pOOrymJ21A24W2pDBCmZS92e0rtQ+uvT6E8H/cn1XD2hA4SXApKOEWc7RWS3YR53Y1c85GMJLncoL88vdvRWx06HifZKYmp9I1VKA1nzRxAanBexIcp2PdDaduZq8jC8Ns5d5cx3wSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMC3CwcHtLqO9MyeKlp31CNAj4EbIYnJvI4sGGvk1zI=;
 b=rcE4Rb4fNYnxisY6KQmMUMwHX+jYj8T2009aE1cOOQjOovmerW+VzE2CfX83lJ1MEK0DsqS8ch/DvqoyWSigNL2FothqJc1d9rBEtoyj2ycXmqm5vYIRlkxBWYIHaqzl6l4ZZV8n7MqfQeCpUsQSQuYXwibN99M/brWXMQqUHgOO/xEyYxe23uuN6bWuQBJ4sTEB3BvkWroVZY0EW4sPVKmzIDUPFBMU79R+l/EXBqqxRQymJUiaDvMW5kJBbo3UsZPUPgiYaDenA4q84gkI0ycMnCH4RCI+cajJWBHWZzRGbvrgLLUuGQk4kYgM5HAeqUMUYEp4fwerLId4sXjp8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:28:16 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 00:28:16 +0000
Message-ID: <132020a8-41a8-442e-b3b1-29b92e648846@intel.com>
Date: Tue, 5 Nov 2024 01:28:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add read/write debugfs helpers for GGTT node
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20241103201633.1859-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0056.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::8) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 54151fe2-18ec-4271-3716-08dcfd30bd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm9TQndhWWtJRlNXWk43OGljS0pNWTBwNXgrOXFHTnQ1eXVQTVhVWDBmb0lB?=
 =?utf-8?B?bmlQbkN6WEVOZFZCUFo3c1BNUllNR2FFRWw0WEg2UFdlRWlqdWNPSjRxZVJ5?=
 =?utf-8?B?UjBYSGVlVU5kOFM3WEN2TEw2RnRIMndYYm1JSXQwbGpTalZtMC9KeEdrMlhW?=
 =?utf-8?B?dUpqb2Z0aElsTTFEcXpFd2d1dmRwbDJXV2VPd3lIQkpGOGhlT2lpS2ZKMDh4?=
 =?utf-8?B?eWxXZ2pqalZ4WEd5Q3hGYWx6TmVjSzJaYjcxTWYvaXpjTXpvV3lCT0pSVmJT?=
 =?utf-8?B?cGNnVDhnRS9sQTZydDd2a0diWjB6eTFEdnYwNlp6Q1dnbHB2RUtTZFVoaTNo?=
 =?utf-8?B?ZnBUSjlLUk5sWGE3L2dBcCtNdGI2djJMc1pxb0phSm1yMFpDZ1RmVS9TOFBQ?=
 =?utf-8?B?MFJBS2JRY3o0ME9wenEvQzlMTmo1NHliYW5kYWY0RkpzSHRiU3dIRWcyWnlq?=
 =?utf-8?B?dE1kaXhJaWxuQjRrZDcwWXdTa1pONlJFZ0hLeHlmMlhGRWwrdVVGcXJya29P?=
 =?utf-8?B?SklIbmpHclBRQmQveTIrY2dvUjJYdmNtOCtaS0IvZWdlOTBLZHNJN0s5YjAx?=
 =?utf-8?B?NkRPVmxTSlVpUDhnMCtCTVlHMHJXZmgzRFpTamxOOTVpYXdrbkxMaDZkTlB2?=
 =?utf-8?B?NWFBdi9Hc1JSL3FNb0MyV042OS9XUVY2SkdhY3lIdlJPa0xvckJkYkQ5RjZN?=
 =?utf-8?B?VHY0bURpbHcrNjFXb3VleG9VcndGeW1ZNnIxYmw0YzBJSEk2TkE1VjVMMlpP?=
 =?utf-8?B?UHhuVjR3MXJWVUc0dWZQRDNoWUJQWkd1UmZUS0lHTzZmd1FTWXR5aXJjQi90?=
 =?utf-8?B?RFRaWjdNWThFemEwb3BqbDJwQm1aZ0Fuck9UTktYWTEwbEVyYjRZRUJMV24v?=
 =?utf-8?B?TTFXUnN6bnI3YVhEdHRuaDQrZ1dYVlBRb1l5cjVmUll2Tmk5cUZmWmJ0cXdn?=
 =?utf-8?B?MkVqNU5KRW1yT3ZrMDlIaXAyV0ZTT3dEd1VCOGlFWkIzOVBBM0JzOXk4VlFH?=
 =?utf-8?B?SWg4VnY3ZmsrNTZ3UEVyQkhzNVdhUDNPc3ZjZzFxSzc1MEZST0JqNG1Da1F0?=
 =?utf-8?B?ZXFMM1llTnhpQ0doVlY2c2pudmdDeUQ0a2tQV3dMUXZGMU1LcS9QVWhOTWY1?=
 =?utf-8?B?TEt5N3hZVEVWcVpwalFudysyR0dleUprMUxQdnRFeGwwbzhRckFSTVpGcnpJ?=
 =?utf-8?B?RjBZK1dtS1FENnpia2lSSVh2TnRIZUc3Wi9YT0lEUUQyaS9rNkdTZlJOdGN6?=
 =?utf-8?B?UVVPZ3pLajdKM3k3TzRoeU5lWFJOSWt2L2JoMWtCcU04cUZmKzJ4SGVRTmMy?=
 =?utf-8?B?TnFmREVKZjEwSkVkcWRZdEV6SmJ6NDM5bisxT2JPYk9sUFRYSWRnYnkrSjk0?=
 =?utf-8?B?NElkaFE2TytiRWhnL3NXbjJaTVBxcXFGK0REcHQ3ZzBpbU9IUWlvVTlCa01i?=
 =?utf-8?B?cVB5RFNRVVNTaUpCYnJ4TS9neEF6M3BZUVJiUnhWUzJqSzBVSWlBS2ZmVk5U?=
 =?utf-8?B?a1hxT0w4d1NiOEJCVm5wMUlmdHR2c2NFZ3JSZytWRjdPRkpWOWpEeEZ6cUx6?=
 =?utf-8?B?Z1o5cUtZTjVjNCtaL2x3L3J6VVhvN2Zxd2gzUkp5U2pJK2ZyZlZLNTFkN1Jz?=
 =?utf-8?B?MzE3UUNGblhUYkZKTWdDczFlR1oyQTdNVGxkeCtwU3BoUytnUWJ0Qy8wMkNz?=
 =?utf-8?B?V2s2Mm93YVRkY2pxZHRDNzZlT2poRmlvTWlSZ2xIN1pGOHhVa2hDci9sNnhr?=
 =?utf-8?Q?4oIYg05gJcB4g48DXjTpHi+k9HMQP+vXxkw6ZfZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T09OK3l1aTcvM3l1T0JPSTdmQ3hLbHZna3JiK1Y3NkM0cnYyNVNSZmY4OThm?=
 =?utf-8?B?YXQyYXJyeXJ3RVZyQUF0ck1ZQmVCOHl4c2dCMUVhSlhSVmV3Nlh2VWNtU1Q4?=
 =?utf-8?B?Z1M4amE5K01XcEplVFZNMUwxQlFBb2FyM2dkbmlUWitCS2syUnZrMUd0ejNU?=
 =?utf-8?B?NTZ0Ymdsa1p6U1Q3TFoyTU8zWVlweXdRbVpqZURDRlZCdFZ0S05iMmtyQ25Z?=
 =?utf-8?B?V25FMnd5cHJBS3k3VUdUSm9CemJaaUJkaEN5KzRHb0pTOFhiQ3g5ZUtDSWdG?=
 =?utf-8?B?RGw0TGV1V1lZQXh4clA1TnJLSTRzZ2ZxczdQOTIvQ2h0OGhhTnlPWmpvQzZx?=
 =?utf-8?B?dVRpbW1IM3ZYY1JEWjdjSXF4eUVoektLdzdSY3hudmwrT2ZXUEVZRU9ZTlFr?=
 =?utf-8?B?bXArT0FMMUtzeEE3Q1hrRmdpVjBRWXo2ZTJZc2MvU2pOazN4Tit6dFBUempl?=
 =?utf-8?B?ZlNhTVVLek40QVVEdGd1STZ6dk1xTWYya2hScGdOeG5jSGFtOWhubHQ2dGJv?=
 =?utf-8?B?R09BRzFkMTJqTHNtREplODdKNFBMdzg5bTFQMHNybnY1QXBWSWlySEZKQVJL?=
 =?utf-8?B?bWFBZXdUL1RHeTE1Z28rWi9wZjZQZVBHZkVUTHRRMWlrbWNBYmRTbzZXZGRO?=
 =?utf-8?B?T2tYM2RncVBlMWdQYUtIMmV1aCtRaSt5UmxUcGFuQk9WSU9hN0VBeUVtSXNR?=
 =?utf-8?B?aU5ycGpqRmU1Z1piT29ldWIxSUlGZE1pbDQzcUxpMDBHdWxzMDdNNEFEbEJN?=
 =?utf-8?B?WVEyaXFwYjFRWGVmRkJ4RzlRZXU4TzJzSFVPQktORlhIUnVyUXAxakZ0bmZT?=
 =?utf-8?B?T0lHTytTVWp3SklOeW5yajE0VHJ5VVkvbVZjQldReVpwdS9MQWdiWlcxOGpK?=
 =?utf-8?B?cHRLOVd2WERYamFhc04yRy9rUVJKOVN4Y25aQURqSWRmeGM1ZXljeDFwOFJ0?=
 =?utf-8?B?Zk85MGpMYiszeXUrSlk1VDBzMFZUdUxnZXBYblhHUnlQT1FnODRxZ1JnRTFM?=
 =?utf-8?B?dUNjeW9xdVN6Rmd4Nis4L24vc2NwNy8wOTN1TG5GUXl0YUlRZ0JXM0tTN3BV?=
 =?utf-8?B?RThvUkF4N3FUV2I1UGsrSFRWQ2xYK3NyckVUREErV0U5U284cFN0RFdJTE83?=
 =?utf-8?B?L0N3ZVNOSS9lS2tHZER2empQTEVqeVVzSHA0VXNnQms2cFc5UlU4eXlNbU9B?=
 =?utf-8?B?b2lMTFZRUk14M2NaeHd1QmRNRUtMTlRDUDZzMVNEcXcvckFZekppdFlMcWMv?=
 =?utf-8?B?SVhWbThEZHJmZGkvaEUwbE00dDJvdCtWUi82YTZGSHlvQXBJeVdQVWk4VFoy?=
 =?utf-8?B?cDVYM1YvUFJBSDJaUGZjTUlMODlqdkVZclhDMGp4SmVxdHBKbDhBY0Nld3FQ?=
 =?utf-8?B?M3ZLWDdoZE50Y25lN1UwcnAvMTNwNUpNRFZDQUVKcW9EUTZ3c2hRcjNxbUc4?=
 =?utf-8?B?aHdLUnZmazdqWDc3N3lyK1B6bnF6ZEtMRVppVzBJODdvZkdjZDZFdE1oQW5E?=
 =?utf-8?B?N3c1NVdoano5UkViM0N4aFpFV3RjSitybks4VUlyQ0w4UkRTUCtsY2hQNS9k?=
 =?utf-8?B?VW9IN2R5b2lDeGxIZFFwK1ZNTWduQ2VCcVBaSlRsZ1hkNENRS0VVY2FFRXAv?=
 =?utf-8?B?T0lxZHRkSFo1SDNvVUpFUFFObkRYVjA2U0Zac0QvdUZjM29rMjhHM2NzN2dU?=
 =?utf-8?B?akZtcU5BTzUvdkRTcVdmMVBOQmw3a0xTWGxKS0h1MjN2VEJhQ0x5QXdZRDJC?=
 =?utf-8?B?UitoSTJwRStWQ0x3SEFFUVhhdm41WmVuQTkxNGsyQThwcmtBdDRaWUpZUU5F?=
 =?utf-8?B?N3AyWG5QUXgwWmdJdVl1TGFhMXBVWlEyRVNwNE94YW11R29PVGxuWmpsRnU1?=
 =?utf-8?B?L0VGckt2b1RxdlJMVldWcmRnL3ZOZFlZOU1xY1ZtQ2hzcGQ0UW5Cb0M1b0dM?=
 =?utf-8?B?bzZNd3hNVEVaMVNNeER6UXNYd0JHNnhhWHhYREVnY2hQK3VOUmptUTYrcDVG?=
 =?utf-8?B?c24rNGVvUWlPcDFoTysyTWpyNitRcDRuQ20yYWxoaUFYRmZyTTVMckpuRElI?=
 =?utf-8?B?VEJ4WFhRSkhpdFpCMnZhYXpYVXV6N2tnUzB2UzRZaERlei84ajhSYjRHZUpS?=
 =?utf-8?Q?GG1USaryXQkU7QjT0CYSBqXPM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54151fe2-18ec-4271-3716-08dcfd30bd7e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:28:16.1593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CquZ72raUhfD6nv1V5CB1/mvW21+YUc4KHzBS83PAAe32Xm2gbnVNIZX85LZvCJFU7nOj6kIcVcIAVSheum9JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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


On 03.11.2024 21:16, Michal Wajdeczko wrote:
> In upcoming patch we want to allow copying and updating PTEs of
> some GGTT nodes over debugfs. Add simple helpers for that.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

No remarks other than two nitpicks, so:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 178 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ggtt.h |   7 ++
>   2 files changed, 185 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 558fac8bb6fb..e003f5f51ac6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -838,3 +838,181 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
>   
>   	return total;
>   }
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +static size_t copy_iomem_to_user_by_chunk(void __user *to, const void __iomem *from,
> +					  size_t count, void *buf, size_t size)
> +{
> +	size_t chunk;
> +	size_t rem;
> +
> +	while (count) {
> +		chunk = umin(count, size);
> +		memcpy_fromio(buf, from, chunk);
> +		rem = copy_to_user(to, buf, chunk);
> +		count -= chunk - rem;
> +		if (rem)
> +			break;
> +		from += chunk;
> +		to += chunk;
> +	}
> +
> +	return count;
> +}
> +
> +static size_t copy_iomem_to_user(void __user *to, const void __iomem *from, size_t count)
> +{
> +	char chunk[64];
> +	size_t size;
> +	size_t rem;
> +	void *buf;

nit 1 - `chunk` and `buf` could be within an unnamed union. But that 
makes marginal difference, not sure if worth it.

nit 2 - instead of hard-coding 64, CACHELINE_BYTES define could be used.

-Tomasz

> +
> +	if (!count)
> +		return 0;
> +
> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
> +	if (buf) {
> +		rem = copy_iomem_to_user_by_chunk(to, from, count, buf, size);
> +		kfree(buf);
> +		return rem;
> +	}
> +
> +	return copy_iomem_to_user_by_chunk(to, from, count, chunk, sizeof(chunk));
> +}
> +
> +static ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
> +				      const void __iomem *from, size_t available)
> +{
> +	loff_t pos = *ppos;
> +	size_t rem;
> +
> +	if (pos < 0)
> +		return -EINVAL;
> +	if (pos >= available || !count)
> +		return 0;
> +	if (count > available - pos)
> +		count = available - pos;
> +
> +	rem = copy_iomem_to_user(to, from + pos, count);
> +	if (rem == count)
> +		return -EFAULT;
> +
> +	count -= rem;
> +	*ppos = pos + count;
> +	return count;
> +}
> +
> +/**
> + * xe_ggtt_node_read() - Copy PTEs from the GGTT node to the user space buffer
> + * @node: the GGTT node to read from
> + * @buf: the user space buffer to read to
> + * @count: the maximum number of bytes to read
> + * @ppos: the current position
> + *
> + * Return: On success, the number of bytes read is returned and the offset
> + * @ppos is advanced by this number, or negative value is returned on error.
> + */
> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
> +			  size_t count, loff_t *ppos)
> +{
> +	if (!xe_ggtt_node_allocated(node))
> +		return 0;
> +
> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
> +
> +	return simple_read_from_iomem(buf, count, ppos,
> +				      &node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
> +				      size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE));
> +}
> +
> +static size_t copy_iomem_from_user_by_chunk(void __iomem *to, const void __user *from,
> +					    size_t count, void *buf, size_t size)
> +{
> +	size_t chunk;
> +	size_t rem;
> +
> +	while (count) {
> +		chunk = umin(count, size);
> +		rem = copy_from_user(buf, from, chunk);
> +		memcpy_toio(to, buf, chunk - rem);
> +		count -= chunk - rem;
> +		if (rem)
> +			break;
> +		from += chunk;
> +		to += chunk;
> +	}
> +
> +	return count;
> +}
> +
> +static size_t copy_iomem_from_user(void __iomem *to, const void __user *from, size_t count)
> +{
> +	char chunk[64];
> +	size_t size;
> +	size_t rem;
> +	void *buf;
> +
> +	if (!count)
> +		return 0;
> +
> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
> +	if (buf) {
> +		rem = copy_iomem_from_user_by_chunk(to, from, count, buf, size);
> +		kfree(buf);
> +		return rem;
> +	}
> +
> +	return copy_iomem_from_user_by_chunk(to, from, count, chunk, sizeof(chunk));
> +}
> +
> +static ssize_t simple_write_to_iomem(void __iomem *to, size_t available, loff_t *ppos,
> +				     const void __user *from, size_t count)
> +{
> +	loff_t pos = *ppos;
> +	size_t rem;
> +
> +	if (pos < 0)
> +		return -EINVAL;
> +	if (pos >= available || !count)
> +		return 0;
> +	if (count > available - pos)
> +		count = available - pos;
> +
> +	rem = copy_iomem_from_user(to + pos, from, count);
> +	if (rem == count)
> +		return -EFAULT;
> +
> +	count -= rem;
> +	*ppos = pos + count;
> +	return count;
> +}
> +
> +/**
> + * xe_ggtt_node_write() - Update PTEs of the GGTT node using data from the user space buffer
> + * @node: the GGTT node to write to
> + * @buf: the user space buffer to read from
> + * @count: the maximum number of bytes to read
> + * @ppos: the current position
> + *
> + * Return: On success, the number of bytes written is returned and the offset
> + * @ppos is advanced by this number, or negative value is returned on error.
> + */
> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
> +			   size_t count, loff_t *ppos)
> +{
> +	if (!xe_ggtt_node_allocated(node))
> +		return -ENXIO;
> +
> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
> +
> +	return simple_write_to_iomem(&node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
> +				     size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE),
> +				     ppos, buf, count);
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 27e7d67de004..64746e23053e 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -34,6 +34,13 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>   int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>   u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
>   
> +#ifdef CONFIG_DEBUG_FS
> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
> +			  size_t count, loff_t *pos);
> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
> +			   size_t count, loff_t *pos);
> +#endif
> +
>   #ifdef CONFIG_PCI_IOV
>   void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
>   #endif
