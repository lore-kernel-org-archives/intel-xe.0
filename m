Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4849EC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 18:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E50E10E3A9;
	Mon, 10 Feb 2025 18:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALCpTo3J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A8310E3A9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739213705; x=1770749705;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+7q0fv/XqeMm6DvHtGIbVbaWybrG1lxPgsmu3Zvw2XY=;
 b=ALCpTo3JOW4rSteu8aYKtsOEhUdsnu34e0SSQC5jyrw704UFkrSMq8iW
 wWNP9+arlHOTL15Gi3QmDyyBSOOtd4oHWO54BFSwd3yntIJdYispA/4un
 ycK6FSycrqQeju54MwZxpzPakKvHw5kzMj2Ka1agqMxHwgRcCtmvrafM2
 wqdBh9t8MPV2VBl8HfTHUeG9WTPYPkEv9enPCA+F3LzO2sxh/FaK4MSQZ
 jgyYPpgoksEk4hC4Wgfa2PIMpdvZSTQO3usTqS42MN8KBWIJPbAWSAUHF
 /e+nCEHgJL5JMs+Zumo7GNguKcCroKaRTPhUZPmeNSwydVYWdBNTDI3a6 Q==;
X-CSE-ConnectionGUID: Qo7RQBzGRfuKNjMCRu4gnw==
X-CSE-MsgGUID: o3IYyWg0RmeRfS0vGg0jig==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57347845"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="57347845"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:54:50 -0800
X-CSE-ConnectionGUID: SWmUFf9VQEuOZ90+ztFaBw==
X-CSE-MsgGUID: HkOevhInRTC6A9N7Ph3jUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="143136982"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:54:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:54:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:54:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:54:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrLFLD75Uywvcap51QONORJarvRXpsKwZfvkEel73Adex3lW147RlM9E9GaMwAcn7rTgDAx99/tZAL3ATcKillSpLLq+B6wr8a9aQXqw+SGnEMODEkw/WhRK0cmOs/4XcQ82zbQh1QKhP2p6HytLletgPAX4ihCY2zQy5wnbKlOyWWukGGHZOu4FSoVyYxMBqd/S8XhVLAsCn76LML/urXLAe+TW4ihqX9dAFLT6BwsvJVymmzsG9nHstIiZBX4Kdg8n2c2NqdH1ZILEGdZAMg1L2sqWCTE7JCyB4a0yIYFmASYtVCcPWFtsNv2lGK85ntrEwtv03MbP5Ft5PoihZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRiPJL2KozGAc5DeYulN5n2zhJ8Ryr2XjDzeLEpxCiw=;
 b=C43Gt9V3qael9jWWUFtwFZC6d6OXVor6VQ60xeGfsUPlZ8CukWqaT+gU4qegmdsAxuAVsw17y9oFGgktkgiODr9xS7tkum0Wy0d2dQMxKBzjXqa3+LuzuyaikCIpwo2QV8kPgVqRrXpkvbiHAFR7aS5MQIh+1JOYfLwidLPpxEEYgks3ThRtxGlA1cgoXgTfM4N51BdWYOjbKT02uWlnxuw8SmOOzydAORhvXFGWthMODYkH0rh1/Dste0Dg6j0Iu2Y9mz51yMtyCSae81g4AIdgHzAneSeL0T8opAeJ1wW/y944jq3iy5tX6WoXVHTjq/IH3ZxT9xmrTaSMlE9/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA0PR11MB8302.namprd11.prod.outlook.com (2603:10b6:208:482::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 18:54:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:54:46 +0000
Message-ID: <94b4bb60-5255-482c-8754-dd2e188a948e@intel.com>
Date: Tue, 11 Feb 2025 00:24:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] drm/xe: Cleanup unwind of gt initialization
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-8-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250207221945.2878241-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA0PR11MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 104a43a3-87c6-4919-484a-08dd4a0462fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1NPcGxJb29QTzJKWUlmZlAwZnF1cnpJdHhnR3BTQ2tLd0dISkJGcVc5aDAv?=
 =?utf-8?B?K0VTVU5iZk82cms5T0NxNGRKbW5GWGd2SWZIQ1EyRm0yRkhQckIzYkpsUGJX?=
 =?utf-8?B?QnNJbllab1pKVnlYVTRjQStobDRLRkVYZkZhYXpKZVcrQjJwTkt5OWsydEFW?=
 =?utf-8?B?K05kZWo5RkZra2o2a1pOMDBpOEErb3ZGOTJBOW5FZ2NRTXJWb0YwY0taTk1y?=
 =?utf-8?B?UjkwSmlMc0JBRzdBWWUweTRhN2lIbjhaakN6Vmx2eTBqRHVlNm9rOEc0TlEy?=
 =?utf-8?B?K0tVVzJLZVNqRmFjQ25KM2NTUGNRS1JTeUpVUnFEQ3NBTStWSUwzYytVcFlx?=
 =?utf-8?B?MldQWEZzZ1BySzhJMUpSMlBaQ1VBYUlvT2ZvZGN2ZCt4SkMrMlovb1BuSXN0?=
 =?utf-8?B?OWJwMnFkNmNiVjNpN3JHUHdvZDRnQy9DZ2d1L0MrS2tqd3FwWFAvR3JxdHV3?=
 =?utf-8?B?V2VlWS9ZdWtHK1pab256Q2dmNzlMTmEvK0lNQzRJeHFORHFEN2V0NmdrcHRy?=
 =?utf-8?B?aVJRWUpCM1E3dXRiUzQrQndBODhtS0pXN0V5K2VzbkFyS00wdVlnQ3VBVm9y?=
 =?utf-8?B?bzBxODlGQTYvOWVrM2lrQzM5aXJ5YlFyNXA3N3F6ZEtBWmNJK3ZMWjJ4cy9M?=
 =?utf-8?B?Qnl0V2hjakRORzRKZTEyTlB0TXNmeTErTzRhSTlRaDY2bkdoWGduaWd2eHcr?=
 =?utf-8?B?SVk1c1FJVWxxdkhIaUZOTlU1elpqYkIyMCs2U2tCZ2cvV0lrbDU5d3RocE9H?=
 =?utf-8?B?U2JXOTd5RlVKZXp0b2VqamlYRDBpRzdhSDBHdVV4bldzYUxOMkYwUWF5WHVR?=
 =?utf-8?B?V3FjamRDSk5QNEt0OWpLS0hWeE5hZ1VaSFZXK0tuQWk4YlVyWG1pbWxjYnVn?=
 =?utf-8?B?SG1Ha1MySDlxZEk2OEJXbm1BZ3pCdFpuTVlQSVoyMnN6VmN2TkZSRVdSMjNJ?=
 =?utf-8?B?L2ZGYWVqMXExWWpYNEFSTVVscy9LT0F3cVpHKytGVXBCbzVZc0g3NXFYQ1Vp?=
 =?utf-8?B?LzhwcTcyWVYxSCtRQkN3Y1Y0N25BZkVpQUhISHhPMlczc1dmWlB2OXh6aWpR?=
 =?utf-8?B?cER5V2pOMVV3MUNISDNhTW1BUzdQSjhqMXczY1pKc0I3Q3ZnMWVTTmZiaThv?=
 =?utf-8?B?eG1vVExJZWcxeWtrbWl6ME8xL095bmh4cERuclFzSVhMbFVieFFubnNwbU5r?=
 =?utf-8?B?dU9EWU5aVFhUSnhZbHlkRC9OODZGUDQ5S2tzd084cmlIR1lldUE1T2dZSEVD?=
 =?utf-8?B?T3pycWhSM3gyWHozT0RRd05uV21nUnFvVjU1WlhiR0tuM20xQ3I5YjFzRzhM?=
 =?utf-8?B?ZXRtZk4za2ttc28xVUl5K2tEdWsrck5nVVpWSWlFNWlJc3UxVUtmdlBEV2dq?=
 =?utf-8?B?aVV1OWg4dllGdjE3cnN4K3R5Y2IzYkN0VERPWjVOMFQvaklSSW85L0J3TzlG?=
 =?utf-8?B?YWJ0a2VLTncvYTlBZ1lpRE1mWFk0bWEzRzZnM1czWHFiRkd1ZVVjeHRSdDBE?=
 =?utf-8?B?U3doazlzVFZHQitCYzZkYUxwK0VLYVdEcndCSExDSXg1VVFxSkVLNVNTLytj?=
 =?utf-8?B?OFpBaVFCUnozTm9Hc05ySXBYT2g3Sk9VQjlWeGpmbktxSVNDWFBoYmtaRnhT?=
 =?utf-8?B?QnFPM01SNE9nZnlKdkNpTE5WZ0x1UVFEaExOV0xJYmQxdVYvbDFFTjlNSUJv?=
 =?utf-8?B?TVhwcEhtbGhPakw0VHRVaE00NUloSjNKY3ZPU2kwdVBaTUtOQ3hWa0dkL1V4?=
 =?utf-8?B?dVQzeUpSeWVQc2plTXNtQXIvVllZZG1yQXBGWW9GNkh3bkthVlB4clh2R1pQ?=
 =?utf-8?B?RWgwSHpSdUNiZURIKzhXakJwaTZHKzNPRFdXQy9LWjR1YWhJWlpEMlMwLzhT?=
 =?utf-8?Q?gUF0ji8MxF1w6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmZpd2V4SHdvdGdCTnZHcGxrS2IveTlGc1BOdnR5SGg5TUpCV3d6VVlJRm9w?=
 =?utf-8?B?emhJNGhLR1QzVUxLVHFiN013bmJZWVhza1VlM1hMdloxcnVLUkdTTTZUVU55?=
 =?utf-8?B?am5lMGdiMm56L0pvOVBCY1B4Q3VKSzRmNUVmT0FvM1hQdHQzeDdZMlR5VkRl?=
 =?utf-8?B?UEJJeTlHWFh1dTg4S0xqMFVXOFZNYU1pUlZQcmJCK1ZLZEx4cCttRkxOQWp4?=
 =?utf-8?B?Z3FpZVdGZDZmaVowLzFNZzlaUDk2anlQY1JoMm9INmJDbEhvd0gzVDI5QTVo?=
 =?utf-8?B?TERQVnpzdmI5Tis4WkJ0U05VNWN4SnFoMEF1TWNJVk1VRmJ5UnlndjRhTi82?=
 =?utf-8?B?elRMNERaRW1UNHZzYmdMaXJBTWhEbzU4S2ppbENBUTFHa3lWVU0xNEd4QW5r?=
 =?utf-8?B?ZnBleVUzemdzbnBlWTE4QTk3SFNKWk5hQUV2bUh6eGZra0ZQU29oenVoc0tX?=
 =?utf-8?B?UmFnVjBPQitVdjVQeVpGa2xLVzAzREZJN2pXOXFWRWUyQUVmdVlTOXBrcjJh?=
 =?utf-8?B?eU9SRlBjYUJUZFZzcUJpWG0xRExhMXY3WGpzMTY3VEUxaDZOM1JURXVNNGVC?=
 =?utf-8?B?UEJlR1VVMkRJSXArU3hrOHFUeDM3eTBRYSs0cWVDWW1QQTJNaUtINHgxV05P?=
 =?utf-8?B?enNnTE0yUjlPSi9hczI1OVkraHlQTFFIcFNKVzRXVUZ0K0hzc2ZmVXVVQnFM?=
 =?utf-8?B?R2tmVDMyMnJsU3VCLzc2QzV6ZUI3T0hQbnAzcSs3YmNOTUxGUkkyd0ZCd0Fo?=
 =?utf-8?B?RUdDQk5kRG9DMHMwSVdXTHdXUlZsYlgxZkI0dkp3Wm84b3ErYU1GZU5JZTBD?=
 =?utf-8?B?UEVRMmxRWTMxWkdqSEtQU3RoMnBtb1NIaVczU3lsL1lxUFpxYUhoYU1FbGZM?=
 =?utf-8?B?NncyUHV3Q3FDdUdmbkhqelNmUGNrMmFCd05DcDhZVVo1eURHL0RwZ0tBRW93?=
 =?utf-8?B?YVIwUnAvZGtaWHFrZFpQbFhHelFJbXZUR2VRbElhSm1YWUd6SE16LzYrM1pK?=
 =?utf-8?B?dUUzemg1RUFYNS9oQ09QcXcvMkZkTVhGWERQcnJxQW5lSDUzRE8wY2hmMEs3?=
 =?utf-8?B?bnIwWmJWcEozNjNEQ1c0QlZlZStpL2dyM0NGZEprN25zT0pzTEVKRWFRRmZT?=
 =?utf-8?B?MEtNTEwvTDVpYTlDVDVkdEl5RVlVL010b1NqSC9DNmlZVXBpZ2lPcTFJdS9s?=
 =?utf-8?B?RjdxZEkwOUtROU1TTWY2WDBMY3RPbGtmaElQWklOTVkrU1c2cG5OWTJYZDJM?=
 =?utf-8?B?WSt2clpKOUpEeUJVL1FuTjVaT0Y0eDNTRHFpSE1ydHpjVkQxblVXalBpOHRq?=
 =?utf-8?B?c093QXM2QW4zY3NGRkIrSEJlaWRUV09HcGdtVjlZcWkrdUlITW5oTHJSOEIr?=
 =?utf-8?B?c2JrRS9IMWlxaXhvT2ZRMVdxR3BpTnUzNi9PSnJoSWw0YWdseEFVY3crK3Qz?=
 =?utf-8?B?Y1lyQTlMdTg3MFI3MnRvekJpUzVudlI5RnBkZHpmRHdTYmRjaVlqRndCYmNo?=
 =?utf-8?B?MGM4K21id1Vyd3FFUU1WUnBadGhmNVVMcVcrclRHNGxaYXI2Q3AwR1I5bU54?=
 =?utf-8?B?d1N4WE9ZVjRtQ2lST2NBOGk5YmVmdkZUUlZyWWNaVStnNzVFaXVVYW1ielFy?=
 =?utf-8?B?bzJwNGlDYTg0WkdVbUJ1UEE4alljVzFjY0FyZnpmMHQ4b25GNjVNUm9ieFdz?=
 =?utf-8?B?Q3B0M3VLVUI5MlVZSDd0NXZ4Y3Z3UENGdSt5cTRLdWx5ZHc4UlhOMVpPcVNU?=
 =?utf-8?B?VUFaeEFQcWZFMWh2UE9OUHNOVXRUbGNGeXA4WWpQK2RkMGRYSU00ZEJ5RkpG?=
 =?utf-8?B?RGZGOUJDSkJ2V2hIcjRNeXlybmtxZUR6azVzcDlrb3F1cFQ5NkJRUGVIVjNY?=
 =?utf-8?B?YWQxNFA5WDU3ZWZVQ0FwSGNMaXhha3lwSkNKaDIxQXJWWGFCMGVqVCsxZmwz?=
 =?utf-8?B?OHltWGRRRlN2SWErTGlGbkZUbVNoSjJUdk1JQ2pUT0FFWGJJRzdxcStsOW9P?=
 =?utf-8?B?Y2N0RjhIeGFDbjA0MEplRzFxSHBZc25QL3V5b0ZRNXFNRG52bWZ6cERoN1RC?=
 =?utf-8?B?WElWMTdmSjZxeDlFNVZJaXlZQUdHaTJSK0VtWUdsbHQwK0lOMlIrS2NNYVdh?=
 =?utf-8?B?dzJ1aDArTkpQbjYveUVidGgwNzFESmN2WDEwZlNNNHJJVEhoRkhjSnpHNWZF?=
 =?utf-8?Q?YxieODqnSrchfv5mZwMU9eA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 104a43a3-87c6-4919-484a-08dd4a0462fa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:54:46.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjt83PfXkVl1+z+cOnCZ4VoVWWn0JETdq6+mvZS1EwPvXDcwSm8JpFPoqsi1WED7wl6LPy6h4CHtlXJeHYv9rcHgTgKD3qnoqGhwQ+J0GFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8302
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



On 08-02-2025 03:49, Lucas De Marchi wrote:
> The only thing in xe_gt_remove() that really needs to happen on the
> device remove callback is the xe_uc_remove(). That's because of the
> following call chain:
> 
> 	xe_gt_remove()
> 	  xe_uc_remove()
> 	    xe_gsc_remove()
> 	      xe_gsc_proxy_remove()
> 
> Move xe_gsc_proxy_remove() to be handled as a xe_device_remove_action,
> so it's recorded when it should run during device removal. The rest can
> be handled normally by devm infra.
> 
> Besides removing the deep call chain above, xe_device_probe() doesn't
> have to unwind the gt loop and it's also more in line with the
> xe_device_probe() style.
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c    | 21 +----------
>   drivers/gpu/drm/xe/xe_gsc.c       |  9 -----
>   drivers/gpu/drm/xe/xe_gsc.h       |  1 -
>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 63 +++++++++++++++----------------
>   drivers/gpu/drm/xe/xe_gsc_proxy.h |  1 -
>   drivers/gpu/drm/xe/xe_gsc_types.h |  3 ++
>   drivers/gpu/drm/xe/xe_gt.c        | 35 ++++++++---------
>   drivers/gpu/drm/xe/xe_gt.h        |  1 -
>   drivers/gpu/drm/xe/xe_uc.c        | 13 -------
>   drivers/gpu/drm/xe/xe_uc.h        |  1 -
>   10 files changed, 50 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5fc4e696262f9..09288558e4e44 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -744,7 +744,6 @@ int xe_device_probe(struct xe_device *xe)
>   	struct xe_tile *tile;
>   	struct xe_gt *gt;
>   	int err;
> -	u8 last_gt;
>   	u8 id;
>   
>   	xe->probing = true;
> @@ -855,18 +854,16 @@ int xe_device_probe(struct xe_device *xe)
>   		return err;
>   
>   	for_each_gt(gt, xe, id) {
> -		last_gt = id;
> -
>   		err = xe_gt_init(gt);
>   		if (err)
> -			goto err_fini_gt;
> +			return err;
>   	}
>   
>   	xe_heci_gsc_init(xe);
>   
>   	err = xe_oa_init(xe);
>   	if (err)
> -		goto err_fini_gt;
> +		return err;
>   
>   	err = xe_display_init(xe);
>   	if (err)
> @@ -905,14 +902,6 @@ int xe_device_probe(struct xe_device *xe)
>   err_fini_oa:
>   	xe_oa_fini(xe);
>   
> -err_fini_gt:
> -	for_each_gt(gt, xe, id) {
> -		if (id < last_gt)
> -			xe_gt_remove(gt);
> -		else
> -			break;
> -	}
> -
>   	return err;
>   }
>   
> @@ -978,9 +967,6 @@ static void xe_device_remove_display(struct xe_device *xe)
>   
>   void xe_device_remove(struct xe_device *xe)
>   {
> -	struct xe_gt *gt;
> -	u8 id;
> -
>   	xe_oa_unregister(xe);
>   
>   	xe_device_remove_display(xe);
> @@ -989,9 +975,6 @@ void xe_device_remove(struct xe_device *xe)
>   
>   	xe_heci_gsc_fini(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_remove(gt);
> -
>   	xe_device_call_remove_actions(xe);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 1eb791ddc375c..fd41113f85725 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -555,15 +555,6 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
>   		flush_work(&gsc->work);
>   }
>   
> -/**
> - * xe_gsc_remove() - Clean up the GSC structures before driver removal
> - * @gsc: the GSC uC
> - */
> -void xe_gsc_remove(struct xe_gsc *gsc)
> -{
> -	xe_gsc_proxy_remove(gsc);
> -}
> -
>   /*
>    * wa_14015076503: if the GSC FW is loaded, we need to alert it before doing a
>    * GSC engine reset by writing a notification bit in the GS1 register and then
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index e282b9ef6ec4d..d99f66c38075c 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -17,7 +17,6 @@ int xe_gsc_init(struct xe_gsc *gsc);
>   int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
>   void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
>   void xe_gsc_load_start(struct xe_gsc *gsc);
> -void xe_gsc_remove(struct xe_gsc *gsc);
>   void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec);
>   
>   void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 24cc6a4f9a96a..0da33d5e9b1c0 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -423,6 +423,34 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>   	return 0;
>   }
>   
> +static void xe_gsc_proxy_remove(struct xe_device_remove_action *ra)
> +{
> +	struct xe_gsc *gsc = container_of(ra, struct xe_gsc, proxy.remove_action);
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref = 0;
> +
> +	if (!gsc->proxy.component_added)
> +		return;
> +
> +	/* disable HECI2 IRQs */
> +	xe_pm_runtime_get(xe);
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (!fw_ref)
> +		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
> +
> +	/* try do disable irq even if forcewake failed */
> +	gsc_proxy_irq_toggle(gsc, false);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_pm_runtime_put(xe);
> +
> +	xe_gsc_wait_for_worker_completion(gsc);
> +
> +	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
> +	gsc->proxy.component_added = false;
> +}
> +
>   /**
>    * xe_gsc_proxy_init() - init objects and MEI component required by GSC proxy
>    * @gsc: the GSC uC
> @@ -461,43 +489,12 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>   	}
>   
>   	gsc->proxy.component_added = true;
> -
> -	/* the component must be removed before unload, so can't use drmm for cleanup */
> +	xe_device_add_remove_action(xe, &gsc->proxy.remove_action,
> +				    xe_gsc_proxy_remove);
>   
>   	return 0;
>   }
>   
> -/**
> - * xe_gsc_proxy_remove() - remove the GSC proxy MEI component
> - * @gsc: the GSC uC
> - */
> -void xe_gsc_proxy_remove(struct xe_gsc *gsc)
> -{
> -	struct xe_gt *gt = gsc_to_gt(gsc);
> -	struct xe_device *xe = gt_to_xe(gt);
> -	unsigned int fw_ref = 0;
> -
> -	if (!gsc->proxy.component_added)
> -		return;
> -
> -	/* disable HECI2 IRQs */
> -	xe_pm_runtime_get(xe);
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> -	if (!fw_ref)
> -		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
> -
> -	/* try do disable irq even if forcewake failed */
> -	gsc_proxy_irq_toggle(gsc, false);
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	xe_pm_runtime_put(xe);
> -
> -	xe_gsc_wait_for_worker_completion(gsc);
> -
> -	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
> -	gsc->proxy.component_added = false;
> -}
> -
>   /**
>    * xe_gsc_proxy_start() - start the proxy by submitting the first request
>    * @gsc: the GSC uC
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.h b/drivers/gpu/drm/xe/xe_gsc_proxy.h
> index c511ade6b8637..fdef56995cd43 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.h
> @@ -12,7 +12,6 @@ struct xe_gsc;
>   
>   int xe_gsc_proxy_init(struct xe_gsc *gsc);
>   bool xe_gsc_proxy_init_done(struct xe_gsc *gsc);
> -void xe_gsc_proxy_remove(struct xe_gsc *gsc);
>   int xe_gsc_proxy_start(struct xe_gsc *gsc);
>   
>   int xe_gsc_proxy_request_handler(struct xe_gsc *gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> index 5926de20214c8..3649239f19622 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -13,6 +13,7 @@
>   #include <linux/workqueue.h>
>   
>   #include "xe_uc_fw_types.h"
> +#include "xe_device_types.h"
>   
>   struct xe_bo;
>   struct xe_exec_queue;
> @@ -57,6 +58,8 @@ struct xe_gsc {
>   		struct mutex mutex;
>   		/** @proxy.component_added: whether the component has been added */
>   		bool component_added;
> +		/** @proxy.remove_action */
> +		struct xe_device_remove_action remove_action;
>   		/** @proxy.bo: object to store message to and from the GSC */
>   		struct xe_bo *bo;
>   		/** @proxy.to_gsc: map of the memory used to send messages to the GSC */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9fb8f1e678dc8..c33040278e1aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -141,26 +141,6 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
> -/**
> - * xe_gt_remove() - Clean up the GT structures before driver removal
> - * @gt: the GT object
> - *
> - * This function should only act on objects/structures that must be cleaned
> - * before the driver removal callback is complete and therefore can't be
> - * deferred to a drmm action.
> - */
> -void xe_gt_remove(struct xe_gt *gt)
> -{
> -	int i;
> -
> -	xe_uc_remove(&gt->uc);
> -
> -	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> -		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> -
> -	xe_gt_disable_host_l2_vram(gt);
> -}
> -
>   static void gt_reset_worker(struct work_struct *w);
>   
>   static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
> @@ -583,6 +563,17 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>   	return err;
>   }
>   
> +static void xe_gt_fini(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +	int i;
> +
> +	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> +		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> +
> +	xe_gt_disable_host_l2_vram(gt);
> +}
> +
>   int xe_gt_init(struct xe_gt *gt)
>   {
>   	int err;
> @@ -595,6 +586,10 @@ int xe_gt_init(struct xe_gt *gt)
>   		xe_hw_fence_irq_init(&gt->fence_irq[i]);
>   	}
>   
> +	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);
> +	if (err)
> +		return err;
> +
>   	err = xe_gt_pagefault_init(gt);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index e504cc33ade4f..187fa6490eafc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -54,7 +54,6 @@ int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   int xe_gt_sanitize_freq(struct xe_gt *gt);
> -void xe_gt_remove(struct xe_gt *gt);
>   
>   /**
>    * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0d073a9987c2e..d8167e818280b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -288,19 +288,6 @@ int xe_uc_suspend(struct xe_uc *uc)
>   	return xe_guc_suspend(&uc->guc);
>   }
>   
> -/**
> - * xe_uc_remove() - Clean up the UC structures before driver removal
> - * @uc: the UC object
> - *
> - * This function should only act on objects/structures that must be cleaned
> - * before the driver removal callback is complete and therefore can't be
> - * deferred to a drmm action.
> - */
> -void xe_uc_remove(struct xe_uc *uc)
> -{
> -	xe_gsc_remove(&uc->gsc);
> -}
> -
>   /**
>    * xe_uc_declare_wedged() - Declare UC wedged
>    * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 506517c113339..3813c1ede450e 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -20,7 +20,6 @@ void xe_uc_stop(struct xe_uc *uc);
>   int xe_uc_start(struct xe_uc *uc);
>   int xe_uc_suspend(struct xe_uc *uc);
>   int xe_uc_sanitize_reset(struct xe_uc *uc);
> -void xe_uc_remove(struct xe_uc *uc);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   void xe_uc_declare_wedged(struct xe_uc *uc);
>   
>   #endif

