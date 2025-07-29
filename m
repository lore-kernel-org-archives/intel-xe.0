Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449F7C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 18:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0799F10E664;
	Tue, 29 Jul 2025 18:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+bEbiQZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9075B10E664
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 18:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753812459; x=1785348459;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tK9CLTt9YBt65eDc+aAocRPQ3kmVmFOP3upLLe9H7xY=;
 b=I+bEbiQZ0qsfWQ6N0g29x+3QVqPE80I/lIkAy3kF1LzyyOCHb+S+SG67
 9H4Oc+lpUV7Zk3YcKN7pJxHeqfy3p3ZdQd4aKB0moPBPG88Z/tRHb60qt
 Lvcwt1ZE4tRBLMNGeuxvYQaUdqA6DIVhpw8fKFK+KwkZfF021zWfI/wVW
 EHm3gpWftvI8W8BQklMK86wua8BlI1AJuzKKhxvHT158WeWA1z91V3ez0
 srPLPm05azDdxG9q3BWT1YjDc3N/4nDzE11hdrkgp0LM25Z6+3deSWmHm
 e60w+/cVHg3C/U0gopVrS4AoBe8Zz4p8hwKme1Vxu+dPTcvAC9jdipqpn g==;
X-CSE-ConnectionGUID: fFrdAxu+SD+gkMNzKfi1fQ==
X-CSE-MsgGUID: ykV11de9Q2WkuiXkAkOC5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55304668"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55304668"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:07:38 -0700
X-CSE-ConnectionGUID: iG4jueYTQrKRYEUGCsa89g==
X-CSE-MsgGUID: rf8ej0waQcOVfXORRBT14w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="166939048"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:07:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 11:07:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 11:07:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.55)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 29 Jul 2025 11:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnTVG9CMt0hS8Vk1lmI/nzOyqRLZk/e7CpxdKhHfjV7w1SybQu0AmO85auMjN3EkGMGgJDnM8EolGz9mO9pgUKGgM6G2LFz0BR38D80dbwShvHUw9YKxBQAi33ryy8DYH+o63RsAzR91hr3r2Vu+VVaSlQj5ONb1qa6PuD1gD0ozS6FO3Mw0Cs6Ix+JjWGtgwV+YHEbiKisfu5t+7GwsHmEPStOAeV8CpTDWYramMnX2ZpTz1vF451US2vd6WNyNzPEyfOy1IWTFAVBsr2x1eNlGD04YFYvD1kxXMDJ330nJ9xm4/fYGtyU+XBHnfvefTj+xacSARYgqkwohAB1h9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaNEdbJ5X2ATs5RvNU11Iln0zUFhMumWGpYWsu/Xo1o=;
 b=qjouJi3b9VM/ohFFasjqdBzKyr1NwcBg+NzW5bbzY9OqY/ZSpnO5uoV4s64SWl4eLvmdNv89y6oAM4PDqfjLWUZSrTEwqKFarqd4IvSuMvt8TzQ8bmLahpce5PSIWxr7x+L35Arvl8I+Tjer87LyygIEKQ7cmXIQszCB/tRrVm2XH1Iyk80N/cMpSjgVtXUF3K4rpbQwAAiuOQMtRxBXSfahvEhRSx2NLvur52Mzlg5AEtBtIsZOAeJbS/4Mdy/a7mdNMbeZCCUhygGfJRNyuxZd7U7ZJ/rTY2SWeYYzm8PS5P9mcVGnTjRlfGDPbpdWbeMT0Q7c+IkJCQYHIqYVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 18:07:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 18:07:30 +0000
Message-ID: <dc4f3619-ff9a-4a63-bea6-978042efdb39@intel.com>
Date: Tue, 29 Jul 2025 20:07:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] drm/xe/guc: Add LFD related abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250722013553.1266218-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0226.eurprd08.prod.outlook.com
 (2603:10a6:802:15::35) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: acd1e9a8-a19c-40f3-7cd3-08ddcecac8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N015N1RVa0lPdXQ2VytudHgyTjVCV3kxOTVDRitZREtBdGVYMzRQUlJoWG5R?=
 =?utf-8?B?eXMvbVJlekYyZzU3ZWkwcFk5bHg3eitna3dNdGZIbFNpRHdyUXZZZkdya3l3?=
 =?utf-8?B?dFFROGZTR3p0TW1yTjlBVXpvbmJjMEg0UEozTjZMSmQvTHRna09NekcyRXQr?=
 =?utf-8?B?UjJWUm1DbGlCL3BvRyszMEd0c2xxc05LQ1JSVktGSVJFV0JGRXdLOGJQbXBM?=
 =?utf-8?B?OEQ4bU80d2ExY3pvbytNaGRVRDdCVERaamMzeGZXYjMrRnpJN0N0My8yMEM4?=
 =?utf-8?B?TDlJRFY5dUdqOWJwTFhsSVFiUDhFYmVYMVVxeHg4UHJhVHQwL2NYQ284TmtM?=
 =?utf-8?B?Qyt6TTkrQVJFV28yT2dmQkRNTmwzT1dYTG5WWVZpVE5CLzJpamZzREx6YUpm?=
 =?utf-8?B?cDJTSW5uR3FUK2F2bU42SVVJOGZmZnhCaVY5NXB0cm5hNXB2MDVrNk84N2R6?=
 =?utf-8?B?enVkZmxCdmlUQmN4NHplMk5la1g5TjZuZ3VZd05GbUxLNXc5UlFHZ0haUSsx?=
 =?utf-8?B?K1NkQzhybHB5dHZrUlNpL2EzMjdENHVPTVg1NTFESE4wOG4vWW0vVmhxV0Zs?=
 =?utf-8?B?QnhKWnJFUzg3ZFU5TmtIMWpHbmJ5WHlhMTJOQ2NpcjMwOHNvUFd4R3Q4VGxF?=
 =?utf-8?B?NTIyRzhORDA3ZXUwTDIyMU1XVlo5Q3owcENsL3R5WGpLeTIzK0tCajRJUEdR?=
 =?utf-8?B?RmJTaWJBMndXSHE3aXUvdFJCTFYxTHhOQVo1VWp0WWNQSUc2WjEya2J6RDFr?=
 =?utf-8?B?OEVDNy9NaFVHT1RhU0xXdDJhNWMzVjFDYklERUxpMVo1Y095bGJxZ3NxRDRo?=
 =?utf-8?B?cnZDSDN2a1Voc0ZKR2VDc0FQUmlwbGN0UDhPTm5KR2tacXpyL25Oby9qV25h?=
 =?utf-8?B?YXFsUWxWb3lVQjJWeEtZdHhhYWpDWktud3EwSUFzcCszZHMzb0ZiQTltdmZR?=
 =?utf-8?B?VnRUaFF2Q29MMUIrY0RBYkxFRFh5YnZkRmRuRnJqZzFsc0RNMTZ6aHp2K2Ix?=
 =?utf-8?B?blBScDduSG9BUnM0Z2V2NVNlejRGR21YNy9FK1hPdVIxbmVXcHNkUk5hbzFQ?=
 =?utf-8?B?aFlXcnhlMTU2TVZrby90aDhvZ3NmVmc3dktwL0xrVXdIS2ozYk4rUFZyRVhW?=
 =?utf-8?B?aENtUFliWkU3RTl0UTZ4YkZRQzBMVmtCUHNhZVpXRFBtdVpCT3hRZE00OE9U?=
 =?utf-8?B?THg3dkxlenI4Yk5nVzEzWGpvYm5OWjJSeStuY2RSaHhJSEtUUUFBOUtHQkxP?=
 =?utf-8?B?c2duR2dxdDBrNFJzSWo4OFlHWE55MmxMVERGUTluemwyejVvMllWUXFhemZo?=
 =?utf-8?B?aVJZYW1Jc0F1M0hYSDBkMDJDYkpWWmQyRXd5R0Y3amwxaDlGT1ZvVzRHdENK?=
 =?utf-8?B?enhvZnQ0aUF1Wm4weXRoMlZ5UUdPOStQajArZHlpeGQ4QVR4MW93K2tnZ01i?=
 =?utf-8?B?RjN1aTYvejZaelJ5dmVFL2RyR0JzRlVzVklyVE5pb1Z6ZW1HYWRsYkdybHAr?=
 =?utf-8?B?RWRia0RBcnBpYU1FeFJCUmxaaURCc2tYSlJZVEtDNTM0TFE5VGY0WVo3WGFI?=
 =?utf-8?B?T0ptNUZQMG9ndW1aUG5FRXh0L042MlJtZWVyNTJmMnFBdUR6ZVJsU2dxdUlC?=
 =?utf-8?B?U2hDcnpHWUtKZkdwbWtkdmkxU1F3M0J3SkVvVVY1Rk1ZUC82SHlDMXhNWVA1?=
 =?utf-8?B?SDRuRGJBT3ZYK04zLzY5M0phdFAvZlh1K3cwWWdVZ3hLQXZseHFHY1FldkF6?=
 =?utf-8?B?bFphSTB5THAxM0JIWHo0M3hTL0NhYWNvT21GOElCbkxnakZ5RmdRRTdHVGZH?=
 =?utf-8?B?L2xnODVhc29HaGRxamhqTEhTNVo2YUJ4Y20ybkQ0WGFSd1cvZUJQdlYvSTMr?=
 =?utf-8?B?ZE5HdmhTVGg0TTgvUjJLeU5KVEREQXBHRW5nSStTMjFuVWMydG82eFpkTDNC?=
 =?utf-8?Q?HRY1ZW68yTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFptdmZBYnR1UXpDeng5NDU3QXdBZ00rRWs3TlJwVW9vTWdnNnJLcDA0N3Jw?=
 =?utf-8?B?eno3SXhUY0ZxLzF3ak03czZ3MDN2bDUycUhVSUVWOFM0SDMxTUtyYUxucmoy?=
 =?utf-8?B?ZzNKeDhYUk1HbmpPVFlHeFg4WUMyOFlwa3RRUXBJZUVMTVBWOUs4VGN2Mzkw?=
 =?utf-8?B?a1Q1K2FQaVphbEhOZzBSWEM1K1ExRzYrOFVaZnNwcXEzampYTTdhMUprd282?=
 =?utf-8?B?ZkM0Z2pORlJielpaL2dIVnhSUGt2WHdWQmNtQXpBYkxoa2lzVWpaMkxLZjcz?=
 =?utf-8?B?NFo2cjRpcTg2bnQzbTIzTzJObVJZeTdiUW9NaFBGblBzUDJtMHlQdGl3Rnd6?=
 =?utf-8?B?czFLeG5GUmRuRDJUd1NWQjZSSFlpRE9QVGswTlJiWGxEWDVhdE5xNUhTL3lK?=
 =?utf-8?B?aWVDQndFbFVVU2s5MFZucVJSTGRoRU1IS0EvMVBaVEtsM1RMVWxyVHU5OExD?=
 =?utf-8?B?MWRySWhWSjVOTWNYMlB5dnU3YlduOG5zRVJEanAybGtXenFGT2FSaDIweTV5?=
 =?utf-8?B?aWp6NmlQbGlOanp4cjlEVzA3RlNCS1FiODgyUFErOVdQWnBUTjM2WGVOSy9m?=
 =?utf-8?B?NCsxTDA4RUlEWUthdTN2c2hRSFR0cjVZUzdxdGxLSFJJS1RMNDBsaXlGM3BQ?=
 =?utf-8?B?YXQ4K2o0ZEJYVENYSThFbENjRituNzNhbnNVQmxuSGUwd2MyYlpHMDN1NmxL?=
 =?utf-8?B?Z2k5V3c1R2FlUkdjaSs2M0wwQk03MnJkK05ldU54WThnczVMNi8rL3RQSFM3?=
 =?utf-8?B?OFVVdzFta0hGUnRaK3dLVnVzMkhIZ3VmSHdYM2dGaUZ1TDV4QXF5R0tyV25I?=
 =?utf-8?B?TTRORis2K29TK3ppcm9GaVZqVE5GYUJQR2hwcXRQMDVBcXR3VDJIbFhmdG56?=
 =?utf-8?B?WHVocSsvdkkzMkNqcGZGY0VqUVNzSitkbU55TVh2SXdTTXZsb29OOEt4YUQ2?=
 =?utf-8?B?d2RmendMS0c4eGpwRWs5R1VoTzN0Z2lXcDQxVlJJY2ZYZFZBb0pRb2lMWjVk?=
 =?utf-8?B?NVV5cEk0OEJqWTFHMFYwM1dPeWtNVlNIK0hlU2RSS0tXN0gwUDBOQ0xtejVx?=
 =?utf-8?B?UW9Mc3I2OTRJdjNxQTlDRVdBb2hNaWtSMDBYTnN6YWwzTHNwM1JNNEVvaE0v?=
 =?utf-8?B?enJRUDZUVDh5ZnNQcnRsLzhnbTkzV3IvUndLa1VNdG9BR29oVVl5NFRGSGJP?=
 =?utf-8?B?SWQzL3YrSUFUcTVsZVQ0MlRmQTZ4TDF2dStYUExDbjhVRDRXRTNObXlFY1lY?=
 =?utf-8?B?S1lmUk9mbE95VHZBQlVjeTZ2ZndWQWJ5OG5pSnExdFJhZFgxNjJsZzFuSGta?=
 =?utf-8?B?UXdncGRsQTZWZjNRSWgwVWpoOFVxVUwvMW10Qk05TC9TVFB3WnRPaTFHTVRD?=
 =?utf-8?B?c2pWSWVDOW1hN0FSeHErN0pFY1NRVGhPdXlZbk9iTEJXYnFnUzlwbFNqYTNM?=
 =?utf-8?B?MWtWZzZtQlRaclBEUlNtNDczRTB4ejJxczh1Slo0NysrT29BQkxadm1vRjNp?=
 =?utf-8?B?SDRESGFVaUFmOFo2SW4zWTQ5YmJUelJBdXB6aTFaNGRLWER6eEVpbHcrdEN5?=
 =?utf-8?B?N0MzWFJOZCtuQ3NjbEx5UTFrc1pYRWFDNFJWbDlaUGQzNmxDdm1WYnQwMFhq?=
 =?utf-8?B?Q1lVYkFUd0dlRi9MbGJDbmRKbU1kZUdWdnJNTGYrTDQ5Q3RsbHRLbFNpQmlu?=
 =?utf-8?B?T2lkK3Rqc2ZHeStNbDVNYm5vRzRlVFpWUW1zcVUrM0ZYS2xVNUQ4b0J1dnZl?=
 =?utf-8?B?cGRuQ1NtVjhhZUFDSzFPZndOMnlkYTZaNS9kb1BCZnZqZHB4WjYvTzdYZ3d3?=
 =?utf-8?B?Z1VEYmxRVzBZUzVkajhLc290TmMxRHlHZDJ4TXVKZ1pWSWViYm9Lem9IdTEw?=
 =?utf-8?B?a1dFZUhsbElPQkx0NmZqaloxQWhZK1pEdG5iZmd2K3MwcmQ0OEhKN3lkQWM4?=
 =?utf-8?B?Z1ZKVzhmS2pWK2h3UVA3VVEzSHE0YmluR1NRcnhKdHJlaXQvSWdmMGNMRmJq?=
 =?utf-8?B?QU9EZTNzUjFzZFFnWmxtc290T1NCTWNKZXN3NFJEY0g4QTl3WXFob3l6Q3R5?=
 =?utf-8?B?aUF6OHVMcWUzaDZmNTJob2VJUWI3bDE0VlBsSjZBNk5kRGdmVDhrays0M1da?=
 =?utf-8?B?empnaFhnL3hOYXR4b1owRVlRcndDU3A2b3JSWkNrWU5QTDhPQSttSVZ0QU1u?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acd1e9a8-a19c-40f3-7cd3-08ddcecac8f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 18:07:30.8656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j294B+GOkEibgE1pVgz81IkV9b8SAvd2uniMEzxMDruzy5GTsH+egKCvrUi4j0MUSHE4V+m0Ae21qpJzEDZvLwethdA3pZPiIPtgXkEr35I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
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



On 7/22/2025 3:35 AM, Zhanjun Dong wrote:
> Add GuC LFD (Log Format Descriptors) related ABI definitions.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 282 +++++++++++++++++++++++++++
>  1 file changed, 282 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
> new file mode 100644
> index 000000000000..b6888ab47e25
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LFD_ABI_H_
> +#define _ABI_GUC_LFD_ABI_H_
> +
> +#include <linux/types.h>
> +
> +#include "guc_lic_abi.h"
> +
> +/* Magic keys define */
> +#define GUC_LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
> +#define GUC_LFD_LOG_BUFFER_MARKER_2		0xDEADFEED
> +#define GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2	0x8086DEAD
> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
> +#define GUC_LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
> +#define GUC_LFD_DATA_HEADER_MAGIC		0x8086
> +
> +/* The current major version of GuC-Log-File format. */
> +#define GUC_LFD_FORMAT_VERSION_MAJOR		0x0001
> +/* The current minor version of GuC-Log-File format. */
> +#define GUC_LFD_FORMAT_VERSION_MINOR		0x0000
> +
> +/** enum guc_lfd_type - Log format descriptor type */
> +enum guc_lfd_type {
> +	/**
> +	 * @GUC_LFD_TYPE_FW_REQUIRED_RANGE_START: Start of range for
> +	 * required LFDs from GuC
> +	 */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
> +	/**
> +	 * @GUC_LFD_TYPE_FW_VERSION: GuC Firmware Version structure. LFDs
> +	 * payload is guc_lfd_data_fw_version

hmm, if this type identifies specific lfd payload, why it uses a lic type?

if both types has to match, say that, and add static_assert to check that somewhere

(edit: or maybe those lfd specific structures are simply redundant, and
you can directly say here that payload is that lic or other struct)

> +	 */
> +	GUC_LFD_TYPE_FW_VERSION = GUC_LIC_TYPE_GUC_SW_VERSION,
> +	/**
> +	 * @GUC_LFD_TYPE_GUC_DEVICE_ID: GuC microcontroller device ID.
> +	 * LFDs payload is guc_lfd_data_guc_devid
> +	 */
> +	GUC_LFD_TYPE_GUC_DEVICE_ID = GUC_LIC_TYPE_GUC_DEVICE_ID,
> +	/**
> +	 * @GUC_LFD_TYPE_TSC_FREQUENCY: Frequency of GuC timestamps. LFDs
> +	 * payload is guc_lfd_data_tsc_freq
> +	 */
> +	GUC_LFD_TYPE_TSC_FREQUENCY = GUC_LIC_TYPE_TSC_FREQUENCY,
> +	/**
> +	 * @GUC_LFD_TYPE_GMD_ID: HW GMD ID. LFDs payload is
> +	 * guc_lfd_data_gmdid
> +	 */
> +	GUC_LFD_TYPE_GMD_ID = GUC_LIC_TYPE_GMD_ID,
> +	/**
> +	 * @GUC_LFD_TYPE_BUILD_PLATFORM_ID: GuC build platform ID. LFDs
> +	 * payload is guc_lfd_data_build_platformid
> +	 */
> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = GUC_LIC_TYPE_BUILD_PLATFORM_ID,
> +	/** @GUC_LFD_TYPE_FW_REQUIRED_RANGE_END: End of this range */

"End of this range" is repeated few times below, make it unique per enum

> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
> +	/**
> +	 * @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START: Start of range for
> +	 * required LFDs from GuC
> +	 */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
> +	/**
> +	 * @GUC_LFD_TYPE_LOG_EVENTS_BUFFER: Log-event-entries buffer. LFDs
> +	 * payload is guc_lfd_data_log_events_buf
> +	 */
> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
> +	/**
> +	 * @GUC_LFD_TYPE_FW_CRASH_DUMP: GuC generated crash-dump blob.
> +	 * LFDs payload is guc_lfd_data_fw_crashdump
> +	 */
> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
> +	/** @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
> +	/**
> +	 * @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START: Start of range for
> +	 * required KMD LFDs
> +	 */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
> +	/**
> +	 * @GUC_LFD_TYPE_OS_ID: An identifier for the OS. LFDs payload is
> +	 * guc_lfd_data_os_id
> +	 */
> +	GUC_LFD_TYPE_OS_ID = 0x4000,
> +	/** @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
> +	/**
> +	 * @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START: Start of range for
> +	 * optional KMD LFDs
> +	 */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
> +	/**
> +	 * @GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT: Binary representation of
> +	 * GuC log-events schema. LFDs TLV payload is
> +	 * guc_lfd_data_binary_schema
> +	 */
> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
> +	/**
> +	 * @GUC_LFD_TYPE_HOST_COMMENT: ASCII string containing comments
> +	 * from the host/KMD. LFDs TLV payload is
> +	 * guc_lfd_data_host_comment
> +	 */
> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
> +	/** @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
> +	/** @GUC_LFD_TYPE_RESERVED_RANGE_START: Start of reserved range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
> +	/** @GUC_LFD_TYPE_RESERVED_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
> +};
> +
> +/** enum guc_lfd_os_type - OS Type LFD-ID */
> +enum guc_lfd_os_type {
> +	/** @GUC_LFD_OS_TYPE_OSID_WIN: Windows OS */
> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
> +	/** @GUC_LFD_OS_TYPE_OSID_LIN: Linux OS */
> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
> +	/** @GUC_LFD_OS_TYPE_OSID_VMW: VMWare OS */
> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
> +	/** @GUC_LFD_OS_TYPE_OSID_OTHER: Other */
> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
> +};
> +
> +/**
> + * struct guc_lfd_data - Log format descriptor (LFD).
> + * A type of KLV with custom field-sizes + magic numbers.
> + */
> +struct guc_lfd_data {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +	/*
> +	 * Expected value: GUC_LFD_DATA_HEADER_MAGIC.
> +	 * Helpful in detecting file errors.
> +	 */
> +#define GUC_LFD_DATA_MAGIC		GENMASK(15, 0)
> +	/*
> +	 * File descriptor type (the 'T' in TLV) is used to identify how
> +	 * to interpret `data` below. For the range of types, see
> +	 * guc_lfd_type
> +	 */
> +#define GUC_LFD_DATA_DESC_TYPE		GENMASK(31, 16)
> +	/** @dw_size: Number of dwords the `data` field contains. */
> +	u32 dw_size;
> +	/** @data: Data defined by File descriptor type. */
> +	u32 data[] __counted_by(dw_size);
> +} __packed;
> +
> +/**
> + * struct guc_lfd_version - GuC Log File Format Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_lfd_version {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +	/*
> +	 * Guc-Log-File Format minor version. Must be
> +	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
> +	 */
> +#define GUC_LFD_VERSION_MINOR	GENMASK(15, 0)
> +	/*
> +	 * Guc-Log-File Format major version. Must be
> +	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
> +	 */
> +#define GUC_LFD_VERSION_MAJOR	GENMASK(31, 16)

very easy to confuse with

  #define GUC_LFD_FORMAT_VERSION_MAJOR	
  #define GUC_LFD_FORMAT_VERSION_MINOR

maybe there should be:

GUC_LFD_VERSION_DW0_MASK_MAJOR	GENMASK()
GUC_LFD_VERSION_DW0_MASK_MINOR	GENMASK()

and

GUC_LFD_VERSION_MAJOR	1u
GUC_LFD_VERSION_MINOR	0u

> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_guc_devid - GuC Device ID.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_guc_devid {
> +	/**
> +	 * @guc_devid: GuC microcontroller device ID defined as described
> +	 * in GUC_LIC_TYPE_GUC_DEVICE_ID
> +	 */
> +	u32 guc_devid;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_tsc_freq - GuC TSC Fequency.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_tsc_freq {
> +	/**
> +	 * @tsc_freq: GuC timestamp counter frequency as described in
> +	 * GUC_LIC_TYPE_TSC_FREQUENCY
> +	 */
> +	u32 tsc_freq;
> +} __packed;
> +
> +/** struct guc_lfd_data_gmdid - GMD ID. */
> +struct guc_lfd_data_gmdid {
> +	/** @gmd_id: GMD ID as described in GUC_LIC_TYPE_GMD_ID */
> +	u32 gmd_id;
> +} __packed;
> +
> +/** struct guc_lfd_data_build_platformid - GuC build platform ID. */
> +struct guc_lfd_data_build_platformid {
> +	/**
> +	 * @platform_build_id: GuC build platform ID as described in
> +	 * GUC_LIC_TYPE_BUILD_PLATFORM_ID
> +	 */
> +	u32 platform_build_id;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_log_events_buf - GuC Log Events Buffer.
> + * This is optional fw LFD data
> + */
> +struct guc_lfd_data_log_events_buf {
> +	/**
> +	 * @log_events_format_version: version of GuC log format of buffer
> +	 */
> +	u32 log_events_format_version;

need defines for VER_1 and VER_2

> +	/**
> +	 * @log_format_buf: If `log_format_version` == 1, array of
> +	 * guc_log_format_version_1. If `log_format_version` == 2, array
> +	 * of guc_log_format_version_2. Dword size determined by
> +	 * guc_logfile_lfd.`desc_dw_size` - 1
> +	 */
> +	u32 log_format_buf[];
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_os_info - OS Version Information.
> + * This is mandatory host LFD data

btw, why is it mandatory?

> + */
> +struct guc_lfd_data_os_info {
> +	/**
> +	 * @os_id: enum values to identify the OS brand (1=Windows,
> +	 * 2=Linux, etc..). See guc_lfd_os_type for the range of types
> +	 */
> +	u32 os_id;
> +	/**
> +	 * @build_version: ASCII string containing OS build version
> +	 * information based on os_id. String is padded with null
> +	 * characters to ensure its DWORD aligned. Dword size determined
> +	 * by guc_logfile_lfd.`desc_dw_size` - 1
> +	 */
> +	char build_version[];
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_fw_version - GuC FW Version.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_fw_version {
> +	/**
> +	 * @guc_sw_version: The full version of the GuC microkernel that
> +	 * generated the logs as described in
> +	 * GUC_LIC_TYPE_GUC_SW_VERSION.
> +	 */
> +	struct guc_sw_version guc_sw_version;
> +} __packed;
> +
> +/**
> + * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File Format.
> + * This structure encapsulates the layout of the guc-log-file format
> + */
> +struct guc_lfd_file_header {
> +	/**
> +	 * @magic: A magic number set by producer of a GuC log file to
> +	 * identify that file is a valid guc-log-file containing a stream
> +	 * of LFDs: Expected value: GUC_LFD_DRIVER_KEY_STREAMING
> +	 */
> +	u64 magic;
> +	/**
> +	 * @version: Version of this file format layout as per
> +	 * guc_lfd_version
> +	 */
> +	struct guc_lfd_version version;
> +	/**
> +	 * @lfd_stream: A stream of one or more guc_lfd_data LFD data
> +	 */
> +	struct guc_lfd_data lfd_stream;

no need to repeat lfd from struct name in field name

s/lfd_stream/stream

> +} __packed;
> +
> +#endif

