Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7333AD74961
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 08:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379B310E1E0;
	Fri, 19 Dec 2025 08:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZaI5h8E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3010E1E0
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766133469; x=1797669469;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gTwLJicPOWtHyjfMc5kiUrgEBqBKSBCzLshI3gcwIqE=;
 b=kZaI5h8E9gH0J6t5QfYUKMrA1VAo8oAslBd01C7HixUyCLAfPZ7g4FWH
 4D0snZR/Zs49F0YHyvLNhlHGSWyRxkb46Gg4rA7qQjhf5JSxfNz7mxSJo
 OWTfl8VFLnjImSYuW/EbNO+z995OFGUS9+9O/zOosWCIDgDafoO32n1Gp
 EfZANtLOedFq5WPq9flzspVUgUsQQxvzUm6cjJljbiuZKbOvE+J3dwc/H
 WBwqiXDVPYjujvA7y9eesWrWMFR/zrkFO4YRL4rGaoOSzJ7QI8HwMSiCg
 WAtvhCQaf9kK4IznpN7fDbWJldqrIYCQBP5xCoZ1QgIqIAekX+2jYashk A==;
X-CSE-ConnectionGUID: +wh+EyI2TxSv1Gk1hMDaVg==
X-CSE-MsgGUID: 7HagqXQ4QXKJAKrAtDgGnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68068105"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68068105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 00:37:48 -0800
X-CSE-ConnectionGUID: EItSKmB8R3OGIAUhRNeBMA==
X-CSE-MsgGUID: pFCVe/PxTUKvT7WYYc1AtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203199534"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 00:37:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 00:37:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 00:37:47 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 00:37:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioUasaH1B9CqsLnPViIZSdKc5xY8sWh7ZRF9yEa7M710EJfgRlKfYDtEcS1b0Q+1xqwIg91UQS/Q+2qYixc9HVfdAeLdcLc+70TFCQDF920YmfaSb0owEwMwpWAO585uxiahfqKLzlvu5HaahDNXkM1xoYYxW/3KdlrXhIv40Dr7yu3vgmZkNauq6/ll+6Cjqc5nUdM/TLKoLpYYqpyKGHGDDOTkh8O80Numc5WHYvsF/x0xVOO0QUkekLcLiFLhTM+ofmH+QLo8oozlR+d009sgcPJ0fzwro3RXOBrOYZh4vXwZUm2Y5IcaQ3abdcTXNfD4ayTDstLokB0BSBi8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywd+6fQpQiEG0l7MKz06rAJttm6FWLE5Bio280syQno=;
 b=d9F30uAr+esfjJNT8aAwryJtK3VnKtn6kXOADWm58YfiahzEuUKXAxF5AZcDwHMlQPPPRVAIv5/fd7+Mmw9/ihih21hUd2JWVgVldP5/exFsebl0IGBt4vudFRNy7rMsw54rqshMgYyqDfbXYApOAHluPKNkEKhcQJ9ZoGhW52rKsBoeD4gKZ4JRRvQia8MlbiS1fLw+ls3s6THEo5xK75w71i3BjvP15U3uLKPrhKE6F9zzRCIi3PQ7su8N5CXBYZeacE1Jezo3yWYsZvxPycS6ACU+PFYkCDND+nIITTmsUNAWZAmUaic9BntxrIkS8fkTJsOHQ+5ZCqywufAtuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM3PPFFCD58DF03.namprd11.prod.outlook.com (2603:10b6:f:fc00::f63)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:37:44 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 08:37:44 +0000
Message-ID: <4af066d2-b9c8-4352-b709-dc3ab1e58784@intel.com>
Date: Fri, 19 Dec 2025 14:07:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/hwmon: Expose temperature limits
To: Raag Jadav <raag.jadav@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, <linux@roeck-us.net>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-2-karthik.poosa@intel.com>
 <aULiyK1tWOxKZLI8@black.igk.intel.com>
 <3849de5d-2cf9-4a06-b35f-428253a4e0d3@intel.com>
 <aUPiXUAji8P9QvFH@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aUPiXUAji8P9QvFH@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0251.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM3PPFFCD58DF03:EE_
X-MS-Office365-Filtering-Correlation-Id: d3140526-946d-4b53-c785-08de3ed9e128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUd3K09QK0hwdjFpd1pxVGxEVFNzdkhVbGQyYnhudlJtZHN4OHlDMURRamRt?=
 =?utf-8?B?b0p6TzFFdlNkNmpyYzlITTlXZUJaRzZzZFBXVnRCSVVOc3kwNDV3Q3JpUERs?=
 =?utf-8?B?bFkraGl5cXFiSFhJUjFZT1lKNTljaDdwVjVZUVRQQWZ5ZVFtTFBCbUx5aW9y?=
 =?utf-8?B?TlBxRXc2b3A4a1JvRkJLbkY4ZU83dGc4R3RjTFlZanFOb2RYS1NXd2lvMk42?=
 =?utf-8?B?SG5SMEpTVGlyam1XaVFNWDk4V3RWTkZuK0FFcVpiczhoRlJTNUdMUndRZlF0?=
 =?utf-8?B?TXBwaVUvL1RlTGFqL1VTR29JWFpRKzFWRGFvNmZSZU40S0ZPRHNwTWhIb2hB?=
 =?utf-8?B?anh3NU8vcXQxekdsZlFzd3FyRGJNeDROanZ3b1NMSTNoTnc4bHdxTnNGVDNM?=
 =?utf-8?B?Z3Myc1QrOU5BZ3JBTVRvK1U2Tk5ORE1mbVREUVBCQll3MnZWTWgya1c5c24x?=
 =?utf-8?B?cmpIVlhWV1RGTjFJcGVHcjhFU3hwUXoybjZXWWJ0UExabm1HdGZuY0lqNzVE?=
 =?utf-8?B?WWVvWEkzaWtNSlJVZ2NTYm5JM0V2V3hDVUVNK0RrQkxvTXJiY2Q5Q3NEekJQ?=
 =?utf-8?B?T2xvay9CdEg3QkFLNU5QSmxJYVU1OEx1THFnSm9YSWg1NTJkaU1FdWVrbE1y?=
 =?utf-8?B?aHRHalJKbmh4R1ljU2d0K0pNb2pLVUc1YlpsaERwZEtCUFI2UDAvQWlwR0tj?=
 =?utf-8?B?T0xRdGJZVlJlYlNWTXIvOTdiTE9kamhFVndFZ2x5ZmZkc1FRc25QaHBvMkdI?=
 =?utf-8?B?SmhsVHhIUEVJbk5qZk1PUW5CelhWV2RUVHRCbS9pR283U2xkSTdWRjVKbzlL?=
 =?utf-8?B?dHFmSzM1ZVFSbldycmtPTExZMWRUTlBKb2phWDRzN2NGRU1aSVIvQ0h0Y05X?=
 =?utf-8?B?K1gveVNlTm9qUUJiYmtCRmt5LzFsaGZZT2hKMDloUUc5VU1NRzN1clNUNmE3?=
 =?utf-8?B?bzlKM2NSMC9sa0NIWXNrS0lpWFpyUkwrTnRwQkZvUkY5THhka0xFcU9pdStn?=
 =?utf-8?B?MVJxTVk1NHRlL2p2NmZYbUdtL2c0NDZ6MWxyb1pweTNoU0MxaDJYMytLTWlL?=
 =?utf-8?B?TGEveEJSRjJmQVJlNXpBYXRVbFpZV3Q1Zit1Zk5Kamk3dWFrWWV0REVTUVNS?=
 =?utf-8?B?REROMFUxN2FVTW9RU1ovK1ExeGMvMk1wQjVGWVJYVlhnTDIwelFNcDhZT2VB?=
 =?utf-8?B?Z3NYeTlNdzFJRUk3cEdBWCtVcUFoWjNTekV1NE42QmdZa0tPUjBaYlIrRXFJ?=
 =?utf-8?B?Y3RMSjlpSElzNHY5RWFoZmJlWDkvWHQ5Zm8zRUE3YmtMaVk1cmJ4MUZXQXNM?=
 =?utf-8?B?cWprR3d4QjVSTndaVDFySEJWUCtwYVpjSzFSa0FNcEdhYUtkQVM4bDFGZTRt?=
 =?utf-8?B?WForN0x2eVJvai9DZjRJbFBSd3dEdml3ZEVZTUIwVHBFV2ZMaEdjSHRtTDhm?=
 =?utf-8?B?ZHE5Q1FQK042Q1luVktZb3VCcXdtTjI5RUZ3STZ6c1pZT2doNEdRNUJwemQw?=
 =?utf-8?B?Q3hrakxyR1M2dUpRdU1VbGtRbDlkanlnNytCUENMbUFmQkI0NDl0QmtDc2tM?=
 =?utf-8?B?c0hKRzZsUm9FQzRpSGhqcktFT1VuSnRPZmFCTXFkVldpUkhtZWdOZTh6OWJ3?=
 =?utf-8?B?NDFreW9WMTM1b0J6ak42a1o5MzA0MTBhemtRS3l5TmpzSVcxRVlLWmN4bE8r?=
 =?utf-8?B?cjA5bEwrK25HWTZVa2RCemFQY3RWdTRDSjFpV3FFb0hreGR4NSt3S3k2UXZ2?=
 =?utf-8?B?WEI2ZXF6SHAyaFhDV1IxbC8xWU5zU2VZM1VvU1RObmZOYUJEVDlrWWQ2SW9t?=
 =?utf-8?B?b3ZxL0VMUWUyaEpHU2RQa3pLbHJQaHNwUlhKK1UzV08ycW14ckw5bjZKUUNT?=
 =?utf-8?B?bCtIR2Y0RGxzVW13aTJaOUpWcHpXZWhUd2dyWXZIUzhrNTdrdjNxdG50eVo5?=
 =?utf-8?Q?QqvGxHHRGh0aparG2kemyh+CRjxhjcyW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVNXNDVlU3B3eUN5bithUFFOOHF0UkNKZy9taU1mWGhkQ1dSMEVlYlB3SmJj?=
 =?utf-8?B?NzBQVkZPU3hDNUc1ekJRL1dZTHhCTksxVHNuQmRxSGluLytRRWNRRFc4d2Y3?=
 =?utf-8?B?K0JId3U3aGpEcHIyei9FTjlLeUdDUlU2eS9ncTcxUXlkMXJ0aHJ4QlhzWUtU?=
 =?utf-8?B?aGRZNGd3emprV1RLQTNxbUsrUVNlR0l2RVprVFFuNHljZ1ZpUXU2UmJva092?=
 =?utf-8?B?RTZUenhvTUtNbzVrNXNCdjI2ekx1Q25Gano4Y3VpOUNXVTNteDZVM0w3V0pv?=
 =?utf-8?B?bVloaHZsZHg4WGUzcWxPaWlTVGpJWFJhalNFWWc4MVZwVW1wbFRkZmo2dy9Q?=
 =?utf-8?B?bjlmY1lTVUVYMndqdkNhaTJ4NG55bm81UGZZSXplbzFaTWNjR3ZkaHdTYk5m?=
 =?utf-8?B?RXlIeCs0OFhNWkNWQVA0Q3BjV3c5d2VFZzJCZkU5bjFWVHZSeVkxSFlHdXZI?=
 =?utf-8?B?aDBWUUZsbjJYYzJMdVJ5R1VlRFhCb1RXWldhSm9KYWE0OXNkUGdMKzJGYzAz?=
 =?utf-8?B?NVFMaDRCN3N5VlV4MzE3SUs4UXd1UUJaTDFnNlNnTlJZeER0K0FyNUxYUnR3?=
 =?utf-8?B?WVY3K2ZxdFQ4UzlKeWw5RmxZUmZzN0JpRlBpR1hwb0RyTmpXczJ0Snlkcm9q?=
 =?utf-8?B?MTJzVnhlM3VURkVJdmg5VTNuVEtBZXFvMlBKZ0dqSHlIWXE1bk1Ld1RvRk9n?=
 =?utf-8?B?c1M1NjFYL0FXMm1yY2RrYkcyYXEwMEc1ekgzak4vWDluYk9sQXdzdmJvWm9j?=
 =?utf-8?B?Sk1oOGVrZHgxN0IreCt6U3o2RHp6Y1RiQ1hxdXU1Tm1lYXpJdlZ5RVBFWHdv?=
 =?utf-8?B?c1ZsUTYvaHpHWlc1NHVsODBUUXhVTWxsMGpGcE1mRFlpOHVsanlQdUducUJ4?=
 =?utf-8?B?eXh0UGk0bWJyT3NWb2gwTVU4Z3VjTDYwbm5mMUQ5L2pCTTVXUFNpMlIwUFlN?=
 =?utf-8?B?MktqanlQUGJtSzRsMWZjeGV2TmxqZ0RxMDNvVHEyYnE4Q0pPMUJLZ1JaaGxG?=
 =?utf-8?B?WkJrWU5jemhEUXBaTGR0aWoyaXMxd3ExcWVFcVZaN1Zia1JuTHJSNWpHd295?=
 =?utf-8?B?MFdNeEJBZyttSlREZ0NQK0dhRGNFTHh0R1JMM2gwTjRXT21PbzF3TWxCZmZH?=
 =?utf-8?B?eXVMTU1UM2tEdUJqT3EzZk1vYlQzeG5EQ1RBR0d5NU9scnV2UWthY1VVS0V3?=
 =?utf-8?B?NDRjWXNPajBxeTZPWkhRZEVOaVZWaWg3c09vWlZyNDc3My9sN2J1eXZiMkc5?=
 =?utf-8?B?d0FTSHhPQkRpaTluZ09XREowdDJlYkFtdGYvc3lFT1JlMWtaS3ZZaDAyRElG?=
 =?utf-8?B?K3h6Q0NSU2Fra2FpOTBQVXhBTkhXYm1JN1c2NDNUMksyNG1WeVBvSVN5WDFL?=
 =?utf-8?B?c1ZnNXVPbFBmbVBiellwZXRmY0pXWG9nZGJkSGkyQUdPMWt0QU5LdmpqYi9v?=
 =?utf-8?B?bm4zMURoQzJ0bHE2VzNJdFBVdlFpY2pKNDdLWkNRekNjcWpPQ3ZqZDh5bzE4?=
 =?utf-8?B?ZGo5bkM1dHpNOEJiSFdIZ0tKNzJXakpjRnJlNzZmTlF6VHY1Uk91M2JxbUV3?=
 =?utf-8?B?TU10RkkxRDJIYUxjSU5mclRyMDAwUThlUXNrRXZnd3N2TkdKaUtkVjgySENi?=
 =?utf-8?B?QVVOSWtFdjFYdndRYm4yejhqYncrOS9uencxUGo3VHloMGF2RVRoOXMyUVJi?=
 =?utf-8?B?SHc4NlZ1a2x0L2ZqRFNTRkQvaWpOclVLTnB2UjMzbEpzYlNFTEVXYnE4OHlp?=
 =?utf-8?B?R25RZHJXejY1a2hhY3R0V1FodEt0U2Y4aVVqNEZrTXNCOFFUaGhIMnpsT2RO?=
 =?utf-8?B?OGFQY2ZKWHhOY0xwUUs0QW1IS0JYRmZkemYzengyTVp0dkovRExjNHZIc0Fk?=
 =?utf-8?B?M08wdmUyN0orUyswbWYrQk5KUVJEWnN4NG1yRlhXRDFqM3hVR2MrblE2VWFr?=
 =?utf-8?B?ZGdxUE1YQklJV3dnVFJ3d3BxdXBOQjBBcUZnV1dXREorUWEwSFFPdm1BZHhL?=
 =?utf-8?B?Tis0NG9RTzFFN2o0bjMwU0ZXTFkrOCtScmZPdWFnMk1IVkhsWm1WcStkdy9Z?=
 =?utf-8?B?c1BCajdmb1M1clVueGt3d3RLVFByK2NVUkZ4V2R0dXU5M1JWVHpFdW1pWjkz?=
 =?utf-8?B?endhdmgyb2lmb2JBd1d0Z2pnYjVoMnIwa0hZZjF6REZmdlE1bVdQZGZNUm5W?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3140526-946d-4b53-c785-08de3ed9e128
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:37:44.3217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mm9BSGfUT2l0CifrGRV6aVBltYDdewjbsniLAM0l+gQHOjV/ztYl0Y4CN7JGfdlQtjnHxbRvJv8Kx+jh25QfdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFFCD58DF03
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

Hi Guenter,

On 18-12-2025 16:45, Raag Jadav wrote:
> On Thu, Dec 18, 2025 at 01:07:57PM +0530, Poosa, Karthik wrote:
>> On 17-12-2025 22:35, Raag Jadav wrote:
>>> On Tue, Dec 16, 2025 at 05:10:27PM +0530, Karthik Poosa wrote:
>>>> Read temperature limits using pcode mailbox and
>>>> expose shutdown temperature limit as tempX_emergency,
>>>> critical temperature limit of as tempX_crit and
>>>> GPU average temperature limit as tempX_max.
>>>>
>>>> Update Xe hwmon documentation for these entries.
>>>>
>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> ---
>>>>    .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  40 ++++++
>>>>    drivers/gpu/drm/xe/xe_device_types.h          |   3 +
>>>>    drivers/gpu/drm/xe/xe_hwmon.c                 | 116 +++++++++++++++++-
>>>>    drivers/gpu/drm/xe/xe_pci.c                   |   5 +
>>>>    drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
>>>>    drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>>>>    6 files changed, 164 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>> index d9e2b17c6872..c8f211c336be 100644
>>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>> @@ -196,3 +196,43 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>>>>    		milliseconds over which sustained power is averaged.
>>>>    		Only supported for particular Intel Xe graphics platforms.
>>>> +
>>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
>>>> +Date:		December 2025
>>>> +KernelVersion:	6.19
>>>> +Contact:	intel-xe@lists.freedesktop.org
>>>> +Description:	RO. Package shutdown temperature in millidegree Celsius.
>>>> +
>>>> +		Only supported for particular Intel Xe graphics platforms.
>>>> +
>>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit
>>>> +Date:		December 2025
>>>> +KernelVersion:	6.19
>>>> +Contact:	intel-xe@lists.freedesktop.org
>>>> +Description:	RO. Package critical temperature in millidegree Celsius.
>>>> +
>>>> +		Only supported for particular Intel Xe graphics platforms.
>>>> +
>>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_max
>>>> +Date:		December 2025
>>>> +KernelVersion:	6.19
>>>> +Contact:	intel-xe@lists.freedesktop.org
>>>> +Description:	RO. Package average temperature limit in millidegree Celsius.
>>>> +
>>>> +		Only supported for particular Intel Xe graphics platforms.
>>>> +
>>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
>>>> +Date:		December 2025
>>>> +KernelVersion:	6.19
>>>> +Contact:	intel-xe@lists.freedesktop.org
>>>> +Description:	RO. VRAM shutdown temperature in millidegree Celsius.
>>>> +
>>>> +		Only supported for particular Intel Xe graphics platforms.
>>>> +
>>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit
>>>> +Date:		December 2025
>>>> +KernelVersion:	6.19
>>>> +Contact:	intel-xe@lists.freedesktop.org
>>>> +Description:	RO. VRAM critical temperature in millidegree Celsius.
>>>> +
>>>> +		Only supported for particular Intel Xe graphics platforms.
>>> As per hwmon documentation all these attributes are RW so they don't
>>> match with ABI expectations.
>> 1. These are read only values for our hardware, write is not supported.
>>
>> 2. Couple of other drivers are also supporting readonly for temp_crit.
>>
>> Ex:
>>
>> a) drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c - bnxt_hwmon_is_visible
>>
>> 75 static umode_t bnxt_hwmon_is_visible(const void *_data, enum
>> hwmon_sensor_types type,
>>   76                                      u32 attr, int channel)
>>   77 { 82
>>   83         switch (attr) {
>>   86         case hwmon_temp_max:
>>   87         case hwmon_temp_crit:
>>   88         case hwmon_temp_emergency:
>>   89         case hwmon_temp_max_alarm:
>>   90         case hwmon_temp_crit_alarm:
>>   91         case hwmon_temp_emergency_alarm:
>>   92                 if (!(bp->fw_cap &
>> BNXT_FW_CAP_THRESHOLD_TEMP_SUPPORTED))
>>   93                         return 0;
>>   94                 return 0444;
>>
>> b) . drivers/hwmon/intel-m10-bmc-hwmon.c -
>>
>> static const struct hwmon_ops m10bmc_hwmon_ops = {
>>          .visible = 0444,
>>          .read = m10bmc_hwmon_read,
>>
>> 3. hwmon also doesn't report any violation for 0444 return from
>> xe_hwmon_temp_is_visible.
> Sure, but since this is a pre-defined ABI which we don't control I'll let
> the maintainers have the final call on this.

Could you please share your thoughts on this? Temperature limits are 
kept RO as hardware doesn't allow to write.

Thanks,
Badal

>
> Raag
>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 413ba4c8b62e..8e6dd2665596 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -321,6 +321,9 @@ struct xe_device {
>>>>    		 * pcode mailbox commands.
>>>>    		 */
>>>>    		u8 has_mbx_power_limits:1;
>>>> +		/** @info.has_mbx_thermal_info: Device has support for thermal mailbox commands.
>>>> +		 */
>>> Can be one line.
>>>
>>>> +		u8 has_mbx_thermal_info:1;
>>>>    		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>>>>    		u8 has_mem_copy_instr:1;
>>>>    		/** @info.has_mert: Device has standalone MERT */
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> index ff2aea52ef75..66a8c3e40027 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -53,6 +53,14 @@ enum xe_fan_channel {
>>>>    	FAN_MAX,
>>>>    };
>>>> +enum xe_temp_limit {
>>>> +	TEMP_LIMIT_PKG_SHUTDOWN,
>>>> +	TEMP_LIMIT_PKG_TJMAX,
>>>> +	TEMP_LIMIT_MEM_SHUTDOWN,
>>>> +	TEMP_LIMIT_PKG_CRIT,
>>>> +	TEMP_LIMIT_MEM_TJMAX,
>>>> +};
>>>> +
>>>>    /* Attribute index for powerX_xxx_interval sysfs entries */
>>>>    enum sensor_attr_power {
>>>>    	SENSOR_INDEX_PSYS_PL1,
>>>> @@ -111,6 +119,18 @@ struct xe_hwmon_fan_info {
>>>>    	u64 time_prev;
>>>>    };
>>>> +/**
>>>> + * struct xe_hwmon_thermal_info - to store temperature data
>>>> + */
>>>> +struct xe_hwmon_thermal_info {
>>>> +	union {
>>>> +		/** @limits: temperatures limits */
>>>> +		u8 limit[8];
>>> What are the magic numbers? Can we have proper defines?
>> We can use xe_temp_limit max value and keep remaining bytes as reserved.
>>
>>>> +		/** @data: temperature limits in dwords */
>>>> +		u32 data[2];
>>>> +	};
>>>> +};
>>>> +
>>>>    /**
>>>>     * struct xe_hwmon - xe hwmon data structure
>>>>     */
>>>> @@ -137,7 +157,8 @@ struct xe_hwmon {
>>>>    	u32 pl1_on_boot[CHANNEL_MAX];
>>>>    	/** @pl2_on_boot: power limit PL2 on boot */
>>>>    	u32 pl2_on_boot[CHANNEL_MAX];
>>>> -
>>>> +	/** @temp: Temperature info */
>>>> +	struct xe_hwmon_thermal_info temp;
>>>>    };
>>>>    static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
>>>> @@ -677,8 +698,11 @@ static const struct attribute_group *hwmon_groups[] = {
>>>>    };
>>>>    static const struct hwmon_channel_info * const hwmon_info[] = {
>>>> -	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>>>> -			   HWMON_T_INPUT | HWMON_T_LABEL),
>>>> +	HWMON_CHANNEL_INFO(temp,
>>>> +			   HWMON_T_LABEL,
>>>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
>>>> +			   HWMON_T_MAX,
>>>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>>>>    	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>>>    			   HWMON_P_CAP,
>>>>    			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
>>>> @@ -689,6 +713,23 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>>>    	NULL
>>>>    };
>>>> +static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>>> +{
>>>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>>> +	int ret = 0;
>>>> +
>>>> +	if (!hwmon->xe->info.has_mbx_power_limits)
>>>> +		return -EOPNOTSUPP;
>>>> +
>>>> +	/* Read thermal info */
>>>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>>>> +			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>>>> +	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
>>>> +		hwmon->temp.data[0], hwmon->temp.data[1]);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>    /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>>>>    static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>>>>    {
>>>> @@ -787,6 +828,34 @@ static umode_t
>>>>    xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>>    {
>>>>    	switch (attr) {
>>>> +	case hwmon_temp_emergency:
>>>> +		switch (channel) {
>>>> +		case CHANNEL_PKG:
>>>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>>>> +		case CHANNEL_VRAM:
>>>> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>>>> +		default:
>>>> +			return 0;
>>>> +		}
>>>> +		break;
>>>> +	case hwmon_temp_crit:
>>>> +		switch (channel) {
>>>> +		case CHANNEL_PKG:
>>>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
>>>> +		case CHANNEL_VRAM:
>>>> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
>>>> +		default:
>>>> +			return 0;
>>>> +		}
>>>> +		break;
>>>> +	case hwmon_temp_max:
>>>> +		switch (channel) {
>>>> +		case CHANNEL_PKG:
>>>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
>>>> +		default:
>>>> +			return 0;
>>>> +		}
>>>> +		break;
>>>>    	case hwmon_temp_input:
>>>>    	case hwmon_temp_label:
>>>>    		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
>>>> @@ -807,10 +876,46 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>>>    		/* HW register value is in degrees Celsius, convert to millidegrees. */
>>>>    		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>>>> -		return 0;
>>>> +		break;
>>>> +	case hwmon_temp_emergency:
>>>> +		switch (channel) {
>>>> +		case CHANNEL_PKG:
>>>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>>> +			break;
>>>> +		case CHANNEL_VRAM:
>>>> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>>> +			break;
>>>> +		default:
>>>> +			*val = 0;
>>> Do you need this?
>>>
>>>> +			return -EOPNOTSUPP;
>>>> +		}
>>>> +		break;
>>>> +	case hwmon_temp_crit:
>>>> +		switch (channel) {
>>>> +		case CHANNEL_PKG:
>>>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>>>> +			break;
>>>> +		case CHANNEL_VRAM:
>>>> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>>>> +			break;
>>>> +		default:
>>>> +			*val = 0;
>>> Ditto.
>>>
>>>> +			return -EOPNOTSUPP;
>>>> +		}
>>>> +		break;
>>>> +	case hwmon_temp_max:
>>>> +		switch (channel) {
>>>> +		case CHANNEL_PKG:
>>>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
>>>> +			break;
>>>> +		default:
>>>> +			return 0;
>>>> +		}
>>>> +		break;
>>>>    	default:
>>>>    		return -EOPNOTSUPP;
>>>>    	}
>>>> +	return 0;
>>>>    }
>>>>    static umode_t
>>>> @@ -1263,6 +1368,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>>>    	for (channel = 0; channel < FAN_MAX; channel++)
>>>>    		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>>>>    			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>>> +
>>>> +	if (xe_hwmon_pcode_read_thermal_info(hwmon))
>>>> +		drm_dbg(&hwmon->xe->drm, "Thermal mailbox support not present in firmware\n");
>>>>    }
>>>>    int xe_hwmon_register(struct xe_device *xe)
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index 673761c8623e..a47637900e84 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -311,6 +311,7 @@ static const struct xe_device_desc dg2_desc = {
>>>>    	.has_display = true,
>>>>    	.has_fan_control = true,
>>>>    	.has_mbx_power_limits = false,
>>>> +	.has_mbx_thermal_info = false,
>>> Why?
>>>
>>>>    };
>>>>    static const __maybe_unused struct xe_device_desc pvc_desc = {
>>>> @@ -328,6 +329,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>>>>    	.vm_max_level = 4,
>>>>    	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>>>>    	.has_mbx_power_limits = false,
>>>> +	.has_mbx_thermal_info = false,
>>> Ditto.
>>>
>>>>    };
>>>>    static const struct xe_device_desc mtl_desc = {
>>>> @@ -365,6 +367,7 @@ static const struct xe_device_desc bmg_desc = {
>>>>    	.has_fan_control = true,
>>>>    	.has_flat_ccs = 1,
>>>>    	.has_mbx_power_limits = true,
>>>> +	.has_mbx_thermal_info = true,
>>>>    	.has_gsc_nvm = 1,
>>>>    	.has_heci_cscfi = 1,
>>>>    	.has_i2c = true,
>>>> @@ -418,6 +421,7 @@ static const struct xe_device_desc cri_desc = {
>>>>    	.has_flat_ccs = false,
>>>>    	.has_i2c = true,
>>>>    	.has_mbx_power_limits = true,
>>>> +	.has_mbx_thermal_info = true,
>>>>    	.has_mert = true,
>>>>    	.has_pre_prod_wa = 1,
>>>>    	.has_sriov = true,
>>>> @@ -681,6 +685,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>>>    	/* runtime fusing may force flat_ccs to disabled later */
>>>>    	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>>>    	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>>>> +	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>>>>    	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>>>>    	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>>>>    	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>>>> index 3bb51d155951..34d2b66188e4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>>>> @@ -48,6 +48,7 @@ struct xe_device_desc {
>>>>    	u8 has_late_bind:1;
>>>>    	u8 has_llc:1;
>>>>    	u8 has_mbx_power_limits:1;
>>>> +	u8 has_mbx_thermal_info:1;
>>>>    	u8 has_mem_copy_instr:1;
>>>>    	u8 has_mert:1;
>>>>    	u8 has_pre_prod_wa:1;
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> index 975892d6b230..a3bff76a074d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> @@ -65,6 +65,9 @@
>>>>    #define       FAN_TABLE				1
>>>>    #define       VR_CONFIG				2
>>>> +#define	PCODE_THERMAL_INFO			0x25
>>>> +#define	READ_THERMAL_LIMITS			0x0
>>> Does this match with spacing convention and ordering?
>>>
>>> Raag
>>>
>>>>    #define   PCODE_FREQUENCY_CONFIG		0x6e
>>>>    /* Frequency Config Sub Commands (param1) */
>>>>    #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>>>> -- 
>>>> 2.25.1
>>>>
