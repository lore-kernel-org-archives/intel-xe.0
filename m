Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07F9CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9F910EC86;
	Fri, 12 Sep 2025 14:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpCYQdsi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864B110EC85
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757688976; x=1789224976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=AzfVhhuMfVV0nUykX2kiwPsC10cjzJzL/PMCV0tkzlQ=;
 b=FpCYQdsiwo/gJLduEN3irBlOoRRAc3oLdDrjcb/X0Tw1E99sW/SwBlTM
 OBeCqRcRubvp/QOGzeL/eYuw+sGHQhmOF8k5WxJ074i9L2NbywKvmLsoh
 kkhRdGKPqBWW3fGuzIOTvhP1wH8DRQ2HcmJpSD98gaqHNdurJWYAKy4Qy
 9NdJ3LMggrZrKb14uJPg/E5RExVnX9lNSzuXZebMvfreV19jQ8vC3tUP6
 hJ8zpuyFThQunRhTTjeoRH0qdDoEJefvsTWkBMQ5GzHQ9JCmOYaEST4wC
 6mz9b1vPWPAuy8hQQFEU5wdQE5HRy/yqQB80iz1ip+YXcn0wuUM7Jl+Nl A==;
X-CSE-ConnectionGUID: RlIKmjB5Rs2pJ8pvfisDXg==
X-CSE-MsgGUID: U+WuheZvSfyAq8gT/dYvoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60109739"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208,217";a="60109739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:56:16 -0700
X-CSE-ConnectionGUID: So5boAB7TumAJ8wp2agNRg==
X-CSE-MsgGUID: 5qrQELv9RzGFFu+8LiOB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
 d="scan'208,217";a="173811657"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:56:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:56:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 07:56:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJck7ccg2aFjSsfXI9MfedKJJZDSMVdlkGEOrWDTZbKsdVs3RH9c3O65bigoxkGi6aFeatEEGcPr/UpLqV8/fK9oTRqk+/VLm+IX0UIJv3qnPy240uLHRNjv+S2VPRhzPauJlb/SND2am+tSqG4MuERnFrMxvfydj0hvlC6nBaJCba03498B1Y4LslDib/SVKFRuE3vkHWH0fmKLqETFWlqsY3Ii6Pn6U6elPVPBHB2BStw6Ii98s85nnrVzbWHjytX4Ddbzuiw/k167AtdjZcLTCrT9ArYNtsy2rkEQeUXb8iLc7haPJFV/48SJkA3t3/hKgi8sr2q9gd/cwAp13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNRbnZLxrG1JCtfSz2xc4R2uG0IV9fcDb0TYvdsGJrs=;
 b=AYFgjymCLhrVYge69H0ZNuNQ7zHDpY+QgDU7/JE96zTrYIkapUoDrZOAvg16AAJZ69BLiCRT1Bx39ar16fdbkYIWK40u57seJCm6ciNMctkxgWCxxeCaJtLWqOHRLfxM14enbKQLx57ILRmuvKGy2rXoZGzMGw1QO7gFxz/vPysZNJ6qLgI5lBYSvZSmjR8WYGTGsxK9VWfN2PNr7Y1NszCDqp0Fh7ZQDJ7DorUOMCfVUmyzddFiALj+lnbIdp5bUawDvsh/J6YiNUSjUGsgkfWIa/Dk8DICqCMTcIt0shdF7TgM5SNAu9ZOlepxsg86Xde0Dazw47Q9vaP7CquB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 by DM3PPFE8B1F622C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 12 Sep
 2025 14:56:12 +0000
Received: from BL1PR11MB5254.namprd11.prod.outlook.com
 ([fe80::bf0c:ea27:d51f:1625]) by BL1PR11MB5254.namprd11.prod.outlook.com
 ([fe80::bf0c:ea27:d51f:1625%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 14:56:12 +0000
Content-Type: multipart/alternative;
 boundary="------------i6DyGxfy0dhK9WhubApvUNdo"
Message-ID: <7926328f-4f98-484f-b632-77b068fc3915@intel.com>
Date: Fri, 12 Sep 2025 20:26:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5] drm/xe/hwmon: Remove type casting
To: <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20250912113458.2815172-1-mallesh.koujalagi@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250912113458.2815172-1-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To BL1PR11MB5254.namprd11.prod.outlook.com
 (2603:10b6:208:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5254:EE_|DM3PPFE8B1F622C:EE_
X-MS-Office365-Filtering-Correlation-Id: b88a48d0-7dcb-4c9c-b901-08ddf20c837a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1ptT29hSWVhL3hONnpSMGtjczVsYldWckpQSlUxS2tseEpLb3YzOC9JM1g5?=
 =?utf-8?B?aFRRZ2RWRFBJcGJYTDhxczhYWUhJOVlubmRkeWszd3RSNnhOaytBS2RpcGNQ?=
 =?utf-8?B?STlhbW03VnRPQkVuNlpsdUNwQ2dQdE1NdlQ5Y3ZqeGFnZ2REUUVEL2dKdE9i?=
 =?utf-8?B?VjVKaDhZdWFDdWkvOFJlTVZUeno2N1grSEZaR0xKcWJXNy9RMGc2MUtvODFE?=
 =?utf-8?B?VjZ2NGxTV3lvNS9HSU12V2Z5anJGaUthREVrOVVrdmIxQ0RVSlhMZlJUV3Q4?=
 =?utf-8?B?YWtPcFNheCtjQ1lZZTlpUlZWM1pUODJJM2ozZ1lrb2xnbVJYVmZ4Y2dlUkJa?=
 =?utf-8?B?TTRMSUhYVWlVRWdzRFlKbk5xbkxVSkJBbkFpaUJnc0VLa1p3ZWIxcWtrQmNG?=
 =?utf-8?B?bG1KV05VS1NVMEhSZnoraHo1a0F6aHNsWXJYUDkrUVVsS2x6T2g0ckxTTUVq?=
 =?utf-8?B?VmRSOFlkL3RCQ2VCL1RwZmN4N1NFQTFiV0h3SU9pN1pMUnlocHRiVEJ4dVpM?=
 =?utf-8?B?MW50RTNxRXlMbS9GU3dlZUNHMzRJdXZZTHBRQ1hpTTF3ZS95UmxuUzlhU1Nh?=
 =?utf-8?B?WnZPcUUvSDBKQU5oNHBRZlVEelBNVHdKVEZwei9xVEYrdkV4bXBKVzV5dnJS?=
 =?utf-8?B?aDNLemdCT2tjaXhZV2k5YWhKQUxKelNOSC8wZlhuYTlwMjJSNDIzTER1YTJD?=
 =?utf-8?B?M2I0ZkJzOUJwTjFqUno5RjhZdHVCbGx3QklWNnpRODBLVGxLNUxpNmJtN0VX?=
 =?utf-8?B?bDYyQ0d2WFdpcWE2SkNndVVxNEhxZWJzeGhKQW8xb2xDYSt1eHYya2RDekhC?=
 =?utf-8?B?clhuSElOODk4bUhJclhHYVpIeUtDbXR2TlRhZ2NkWTFiVk1nYStKZ2tyRnF5?=
 =?utf-8?B?SDRTZ3BBblBWcWdpUUxUZFRwL1JERTkxdzZhcktDc0JkakNIcUJKOE44dzZF?=
 =?utf-8?B?ZzBvVWZ6cnRXdVY0S1N2a1JJdy9sODRVTjJJWHVBSjNKa1l0ZmdQQzlBTWRU?=
 =?utf-8?B?QlBkY2lWWm1sVGNtWjhEcUtIb0gvTEZ1OUYxVDNWOVFIckZoaXVscXpoaHRK?=
 =?utf-8?B?b21IRzh2Nnk0TUoxdkROendJZXlFMmVENDFFZ0dDeXNlbUJYT2dVNXBFTzdI?=
 =?utf-8?B?QjdCaW5HSWlrZmcvVkptcit2ZmlSNkpnOFlKTVVwdDloUVV4TkhQakhUQm5h?=
 =?utf-8?B?TmNIbFdyL0NZeDFGcUlCc0pEdXZtenhqRy9EcHVuM3BMS3FHVFh4OGozc09R?=
 =?utf-8?B?T1l0Q1ZIc0pXbUd3OWlldXBhU3JJUjNraWdNOFBaZnJucTQ1bkkzOVRsMk9L?=
 =?utf-8?B?OHVKYU9ycXNvTld6dmRGZVpFL0srMnptZXBFOFpUOGlBVlJoRzVHMU9oOG9C?=
 =?utf-8?B?ZVJRd1FWM0tPRVNJNVVaR0FUa0RLZ1p0QXlQZ2JYb1VxN2llcHhFa3JWb0NT?=
 =?utf-8?B?bFU1eEl0RUs1alJWeVRBTm42cjJFSFQ3V1h3QWcxSEVTb1pTdUNwdFRBaWhG?=
 =?utf-8?B?bGJtbnNtVGRYQ3g2alRTOWpPMGNVYTFSdkQraVRNUkVlZWR2TTBKZmxacWVY?=
 =?utf-8?B?dHFlUzBrRnVwQ0VkbmgvNktRaDZGNmZiUitSdEpvWWp1YVRKMy96VlkxRWZH?=
 =?utf-8?B?NEdFZHY0cjIwM2FpV1lUMjNUTHE2VGcyZk1QVWJrUUR5SG9YVXJEVUEvcWQy?=
 =?utf-8?B?ZDNjSE5BMktlL1M1Y1UwMWVtSHAxOTdOemFyQUJJSHdSQithT1BIL2xkN0NM?=
 =?utf-8?B?ZXBMNkJRMURKUFdMVnBQc1FVL1NadW4xTmVkbWxTak1mcG56RThEREVGRjJq?=
 =?utf-8?B?OWhZV3Z4ZEs3R0luZ0tsK3BCOXQ4TzVES014dEpDdWRDLzgxUTZSY25nQitR?=
 =?utf-8?B?dWdOU1hUMy8zZWwvbWEwdSthaUtXK1hwSXlBa21Kb0JNYUNTOFpJaEtsM0gr?=
 =?utf-8?Q?zShSWGdsjMM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0w1RW02NjlyY0xQWDdnSUlMMnhTS0xhTG1ZbSs3ZTdNQTAxZHV5STcrVk5z?=
 =?utf-8?B?aGVLbUZCb21uZkNKUWUrQW5FYlNrOEVQc3JwUFdIcEw3K2crV0l0dy8xckUv?=
 =?utf-8?B?VlA3MDVWb0NKOVBWSU9mRkxtS2liSHBodnZQRWw1eGNOTGt1WDZnc1pNdWJQ?=
 =?utf-8?B?bWw0T21xUkYwWWFIRVBxdm5YUHVSVlJsNzFjK3V0SHpHMm9pcWNoNGR3MFJ1?=
 =?utf-8?B?L1FIUWFwWk5LVmJqOVMvUjREL2w2aVhwWi9NUytvcTJIbVpMZlQ2bmM1Wnls?=
 =?utf-8?B?dHU2WFZEVDhFMVB6SnhjYyttNnpOR2NkbFJxYUxlOTZhUHVMVTBuOTFDeXRr?=
 =?utf-8?B?VWROS2JtbU1iSDN3V2Q2RUQvWUh0ekFjSFgwR1VUTHQrM0dTN1ZxZGxxb29n?=
 =?utf-8?B?bjNCWWNMcTkzQWg5TkUxalJsS01HdEJ1aVVKdHVUbGY1clN6ZVNnbGwyTGRM?=
 =?utf-8?B?Y3NlVUtlbE9zTW9JS3M0TTFWTXN4TXZRa3E2RXRjUUt2TGxxQVdVNVhRYUI4?=
 =?utf-8?B?M0pVc1ppcmFBdmQzcTJBa3ZJZmd2cjlBRDBYUVdlY3NtdlA2Y0NrczVCbU9Z?=
 =?utf-8?B?aTg3bWhPVEJyNmJDbTBsSityZGN4dFBxUlpXV0lEWWxqdXh3S21oY2NuWGhh?=
 =?utf-8?B?VktMcTh6d2ZLcE44T2FTcy93c1piVGtOQ2IvRk9uZllJM2hOYWpEcjVDano3?=
 =?utf-8?B?VzlPdURBaEZMbGg4dU0wWkhvaEgyM0RiTFBuNzFmSEFQeDJpcS8rSVB1L1px?=
 =?utf-8?B?dWN0T0xCc0d2MmxCM0RUMG1mekozb094OFFUNEJIaGRmaytrZTMzSlVsQnhO?=
 =?utf-8?B?SERmdnVIUmJIWXNtZitIcHkwSHFCNnNNVkhFd2RlUEUrSys0aGlSdE9CS25m?=
 =?utf-8?B?YlZJclJVWDIxUTB1TFRVSytDYURVb1g2Q3o0MTZ1R0xKRXFFMUtVNDR6VWlY?=
 =?utf-8?B?ZXJEZXphQktSaXN6UTF4eTN3SEM1Wk1qK0xTWUVOWkdIeWF6TVIzdDZnRzRq?=
 =?utf-8?B?Q29FVFRHMG83VW9iNG8wYkpReDVwbnAvNlBpbW84Q2o2NkQzWVdPV1VycmJI?=
 =?utf-8?B?azM4OVJINTIvQklFcVBkYzZjZmZUVjh6MkJaWFpYY2VCNjhrZmt0bGsvaDB0?=
 =?utf-8?B?UjEzZndmekIyditZNVNVajdFay9tVE5vVlRnclVVZXB0bU1iaVNMNjRxQWlL?=
 =?utf-8?B?TUdoQzdhUUJSL1NhSVJ0TGtvazJEUlVhR2RhQlN1YVZRdWRiR1BseiszUjcr?=
 =?utf-8?B?L003K2w2QzI5a1pyV1VOdE1hWmx2dnc4NlFCZVBKVmdHUlNhaG1WZzNWL2xt?=
 =?utf-8?B?RHRzc1VIbDlpUEprSDdXOWhBekppeGNZOFk4NGg0Q1JmMGMzM2JRMCtOa3J0?=
 =?utf-8?B?TGgyMDlLWUpnTExPTkNUVUR5Q2t4ZyszTnhaL3ZNeHRXN1FuK3p0ZVRLSHVx?=
 =?utf-8?B?N09oMGRrZFNZNW9qbjB3NlR1dXdZT1EvdmtaOGVBOGJXc2dMcHkvcGJ4OTRy?=
 =?utf-8?B?ZzQ1RHhkdlRDY25TdzlMa1lFZ0hRd3BlSTJSMCtnT3RHakJHSU9HVmJPSGEy?=
 =?utf-8?B?VW44dXJubythUHpBblhuMG9vazV4YW5YVlNQMmRmcEt6Q200OWZYcE1ZOVFL?=
 =?utf-8?B?dS9tUWI0TkYvL3JyZ25MbEFpRk1mUnI2a1JWZzdNV013L2RQSjhwMXRVTlAx?=
 =?utf-8?B?RXB5Tk1NM3l2aGNaRUtDZFJ2TXhjQU9NR3VLbE1XNlgwcTBzWFdqS0wvQ3Rl?=
 =?utf-8?B?Q2ZUWVY0QjZCYk9IbmtLRVVEUzZ0WEtldlRZUTFiZjBQZzJtYytKaW9VUjVl?=
 =?utf-8?B?VGtoQUlyelNSVHRQUGpvOVBmaDVrc3ZHaURWOWZGSHlMYkdLVlR2V0VnK3Bn?=
 =?utf-8?B?Q3hXNFZVaGZUQXhrU2xaOS9vMnNrTTZWbENweEIvRWtMcnhuYnNQT3IrMjhl?=
 =?utf-8?B?eXQ5MkxqcVBCaGZOajBSbGNueStjVkk0WDNic0Z6TVBqT1BEbXpRZnI5SlRw?=
 =?utf-8?B?ZUVYNElqUTJBb3pIalJnUjNCcEZzbU9MTW16SkVvSGNwd0J2eDlMLzM1Y2I2?=
 =?utf-8?B?NUg3MzdwNGxsbnIwUEQyL2g5cERhcE0ybFMvanpsVXg2ditDb1hPdVlGUjJG?=
 =?utf-8?Q?7ttOeXtF/J/0Nqpn3tujurIgQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b88a48d0-7dcb-4c9c-b901-08ddf20c837a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:56:12.0892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzEjD69OVNf8i3yw39TX90+4sfkuqwF+VXYhAmke7QeAMz/6D9CiymrOg8h19tARPheUPwBSvek32sjIXhXpsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE8B1F622C
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

--------------i6DyGxfy0dhK9WhubApvUNdo
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12-09-2025 17:04, mallesh.koujalagi@intel.com wrote:
> From: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>
> Refactor: eliminate type casts by using proper u32
> declarations.
>
> v2:
> - Address review comments. (Karthik)
>
> v3:
> - Use the proper u32 type and drop cast. (Lucas De Marchi)
> - Modify variable when actually using u64 value.
> - Change r value to reg_value with u32 type.
>
> v4:
> - Remove newline between trailer and Signed-off-by. (Lucas De Marchi)
> - Change reg_val to val for more user-friendly logging.
> - Use mul_u32_u32 function since both values are u32.
>
> v5:
> - mul_u32_u32 function with shift. (Lucas De Marchi)
>
> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> Reviewed-by: Lucas De Marchi<lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index e65382d4426a..b6790589e623 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -286,7 +286,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>    */
>   static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
>   {
> -	u64 reg_val = 0, min, max;
> +	u32 reg_val = 0;
>   	struct xe_device *xe = hwmon->xe;
>   	struct xe_reg rapl_limit, pkg_power_sku;
>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> @@ -294,7 +294,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
> -		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
> +		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>   	} else {
>   		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>   		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> @@ -304,19 +304,21 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>   	/* Check if PL limits are disabled. */
>   	if (!(reg_val & PWR_LIM_EN)) {
>   		*value = PL_DISABLE;
> -		drm_info(&hwmon->xe->drm, "%s disabled for channel %d, val 0x%016llx\n",
> +		drm_info(&hwmon->xe->drm, "%s disabled for channel %d, val 0x%08x\n",
>   			 PWR_ATTR_TO_STR(attr), channel, reg_val);
>   		goto unlock;
>   	}
>   
>   	reg_val = REG_FIELD_GET(PWR_LIM_VAL, reg_val);
> -	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +	*value = mul_u32_u32(reg_val, SF_POWER) >> hwmon->scl_shift_power;
>   
>   	/* For platforms with mailbox power limit support clamping would be done by pcode. */
>   	if (!hwmon->xe->info.has_mbx_power_limits) {
> -		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
> -		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
> -		max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
> +		u64 pkg_pwr, min, max;
> +
> +		pkg_pwr = xe_mmio_read64_2x32(mmio, pkg_power_sku);
> +		min = REG_FIELD_GET(PKG_MIN_PWR, pkg_pwr);
> +		max = REG_FIELD_GET(PKG_MAX_PWR, pkg_pwr);
>   		min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>   		max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>   		if (min && max)
> @@ -493,8 +495,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   {
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> -	u32 x, y, x_w = 2; /* 2 bits */
> -	u64 r, tau4, out;
> +	u32 reg_val, x, y, x_w = 2; /* 2 bits */
> +	u64 tau4, out;
>   	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>   	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
>   
> @@ -505,23 +507,24 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
> -		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
>   		if (ret) {
>   			drm_err(&hwmon->xe->drm,
> -				"power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
> -				channel, power_attr, r, ret);
> -			r = 0;
> +				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
> +				channel, power_attr, reg_val, ret);
> +			reg_val = 0;
>   		}
>   	} else {
> -		r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
> +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
> +								channel));
>   	}
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
>   	xe_pm_runtime_put(hwmon->xe);
>   
> -	x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
> -	y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);
> +	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
> +	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
>   
>   	/*
>   	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)

Reviewed-by: Karthik Poosa<karthik.poosa@intel.com>

--------------i6DyGxfy0dhK9WhubApvUNdo
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-09-2025 17:04,
      <a class="moz-txt-link-abbreviated" href="mailto:mallesh.koujalagi@intel.com">mallesh.koujalagi@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250912113458.2815172-1-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>

Refactor: eliminate type casts by using proper u32
declarations.

v2:
- Address review comments. (Karthik)

v3:
- Use the proper u32 type and drop cast. (Lucas De Marchi)
- Modify variable when actually using u64 value.
- Change r value to reg_value with u32 type.

v4:
- Remove newline between trailer and Signed-off-by. (Lucas De Marchi)
- Change reg_val to val for more user-friendly logging.
- Use mul_u32_u32 function since both values are u32.

v5:
- mul_u32_u32 function with shift. (Lucas De Marchi)

Fixes: 7596d839f6228 (&quot;drm/xe/hwmon: Add support to manage power limits though mailbox&quot;)
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
Reviewed-by: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index e65382d4426a..b6790589e623 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -286,7 +286,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
  */
 static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
 {
-	u64 reg_val = 0, min, max;
+	u32 reg_val = 0;
 	struct xe_device *xe = hwmon-&gt;xe;
 	struct xe_reg rapl_limit, pkg_power_sku;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
@@ -294,7 +294,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
 
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
-		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&amp;reg_val);
+		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &amp;reg_val);
 	} else {
 		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
@@ -304,19 +304,21 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	/* Check if PL limits are disabled. */
 	if (!(reg_val &amp; PWR_LIM_EN)) {
 		*value = PL_DISABLE;
-		drm_info(&amp;hwmon-&gt;xe-&gt;drm, &quot;%s disabled for channel %d, val 0x%016llx\n&quot;,
+		drm_info(&amp;hwmon-&gt;xe-&gt;drm, &quot;%s disabled for channel %d, val 0x%08x\n&quot;,
 			 PWR_ATTR_TO_STR(attr), channel, reg_val);
 		goto unlock;
 	}
 
 	reg_val = REG_FIELD_GET(PWR_LIM_VAL, reg_val);
-	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon-&gt;scl_shift_power);
+	*value = mul_u32_u32(reg_val, SF_POWER) &gt;&gt; hwmon-&gt;scl_shift_power;
 
 	/* For platforms with mailbox power limit support clamping would be done by pcode. */
 	if (!hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
-		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
-		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
-		max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
+		u64 pkg_pwr, min, max;
+
+		pkg_pwr = xe_mmio_read64_2x32(mmio, pkg_power_sku);
+		min = REG_FIELD_GET(PKG_MIN_PWR, pkg_pwr);
+		max = REG_FIELD_GET(PKG_MAX_PWR, pkg_pwr);
 		min = mul_u64_u32_shr(min, SF_POWER, hwmon-&gt;scl_shift_power);
 		max = mul_u64_u32_shr(max, SF_POWER, hwmon-&gt;scl_shift_power);
 		if (min &amp;&amp; max)
@@ -493,8 +495,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
-	u32 x, y, x_w = 2; /* 2 bits */
-	u64 r, tau4, out;
+	u32 reg_val, x, y, x_w = 2; /* 2 bits */
+	u64 tau4, out;
 	int channel = (to_sensor_dev_attr(attr)-&gt;index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = (to_sensor_dev_attr(attr)-&gt;index &gt; 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
 
@@ -505,23 +507,24 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
 
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
-		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&amp;r);
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &amp;reg_val);
 		if (ret) {
 			drm_err(&amp;hwmon-&gt;xe-&gt;drm,
-				&quot;power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n&quot;,
-				channel, power_attr, r, ret);
-			r = 0;
+				&quot;power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n&quot;,
+				channel, power_attr, reg_val, ret);
+			reg_val = 0;
 		}
 	} else {
-		r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
+		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+								channel));
 	}
 
 	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
 
 	xe_pm_runtime_put(hwmon-&gt;xe);
 
-	x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
-	y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);
+	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
+	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
 
 	/*
 	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)</pre>
    </blockquote>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]-->
    <p><span style="font-size:11.0pt;mso-ascii-font-family:Aptos;mso-ascii-theme-font:
minor-latin;mso-hansi-font-family:Aptos;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;
mso-fareast-language:EN-US">Reviewed-by: Karthik Poosa&lt;<a href="mailto:karthik.poosa@intel.com" class="moz-txt-link-freetext">karthik.poosa@intel.com</a>&gt;</span></p>
    <blockquote type="cite" cite="mid:20250912113458.2815172-1-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------i6DyGxfy0dhK9WhubApvUNdo--
