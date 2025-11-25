Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0066AD0E6C4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 11:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF05E10E3C3;
	Tue, 25 Nov 2025 11:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KswCNBSB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC09810E3BF
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764069707; x=1795605707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tcMu7IOXroxkFsub6XVz9R9kZ82EbB/bR/Cn0QktwZQ=;
 b=KswCNBSB20EgFtZlsSaWUwjrEAt7HgAd8hMBkWXRFmDQ7TNumqJFF8Vj
 r1iAeU7Lwv1qzyZl0oPUdoAy14/KRt7ropw4dv7OBubW9ohHhCp0tSPwI
 LZdV5XfVH/0GSlaurM/6SvZWa9ghV8mTIlW35PKN/y9BTE+K/jxnak7cS
 N3rOy65yro0e5rdcyGgTsO2ZhIWMXR6EPoqP9mZLxT495Xqnsvt3p1sJn
 rVc2KjP549+YFPV3vWGYQqoVVJ+nyN8KZ7icifbFCcj6GuAB4c3FaY09W
 N0NOVC8CDNhp+5aFQFxHM/LS+XPXecquYTUn/JCzt1pL96yMLMM0qhcjZ A==;
X-CSE-ConnectionGUID: J/B4NfB1TRmdeXAJUBoMTw==
X-CSE-MsgGUID: AUGfRnJEQk+4ty/XPfFABw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65269065"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65269065"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:21:46 -0800
X-CSE-ConnectionGUID: 9MuukFvbT5SknkHAIIyNbw==
X-CSE-MsgGUID: C44Rek4OSsKCwe/6FMRnIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193044307"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:21:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:21:46 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 03:21:46 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:21:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGCcnaUF2EDiUKUty+c9wp9sFrIP/ohwatnN0yBbwLVotQfL062uDapMuwHghnNKdC75x0Q0fXBvFiIctyBa7RC9LE0w4njcnecVUH5Ui/+/n7jccESCHiSkAcGtze/xzmrJvMlnpYXqMn5qVGTZu3c5L/eYPiEfUOVltCG/+JRAk28mielSCtD/ycNpzNEbaEJqo5aeGjjAVsjOeWa77qXFINIDbOGaSNOWnv47smRrUre4d3EVWbB0I94V7X4J7KGO62OGG0hhwd35zETvN0FX88rpf58BJfaBEazwHwUWGDLVnfBmw61D2uG/nHFGimXBkVo4gX5NNHH5iWU63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcMu7IOXroxkFsub6XVz9R9kZ82EbB/bR/Cn0QktwZQ=;
 b=qvOr2NPkzUbmGlAxCKBLeT49spSuT2bUEMxuRkHDt+VcK55CpyKP/KyNS/3o445xJk5MbCeG2I7KGpO5m04nWmDLlJ8cE3ckwWPxmp7eE2O+uzllJLK0fAU6JtVLNIsmKjK65e9UWa1f5G9z6r9LkIrfsK6rXexGywkMr80oy9ZNVTuBlmWjqsLc5iazgmT4UGe3Dk/QAI0qB5gIm0Hn+m2VWlL0H9sr8gdwhG3y+FtsrRCIR9TXqVtPIgyjARIrWOXLH8evNupb5LCLHyzJOsZtJUe2Cd2ZE2qF4PoGMt/hu27ZuvRxIqtIuskugJbhKmS4qV82aFNPhZ6Ep7XZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by IA4PR11MB9371.namprd11.prod.outlook.com (2603:10b6:208:56a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 11:21:44 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:21:43 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Topic: [PATCH 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Index: AQHcWGqhdmF0jhHRK0+peF9Ai1dOPbT+xOeAgAPlcNA=
Date: Tue, 25 Nov 2025 11:21:43 +0000
Message-ID: <SA1PR11MB883962E9AB456A0C0AC4ABF6AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-12-brian3.nguyen@intel.com>
 <f0b90bc7-d03a-4325-9a82-ab55697ec85f@intel.com>
In-Reply-To: <f0b90bc7-d03a-4325-9a82-ab55697ec85f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|IA4PR11MB9371:EE_
x-ms-office365-filtering-correlation-id: 6d43323e-5600-4dc8-460a-08de2c14d051
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?L25DclhmS3dhZHNYenhZcjdrc3JZVE1URjR5TVF5bmJNMGRGdHVxeHZrOUlR?=
 =?utf-8?B?UVo0bDFBd2xCcy9EbktmRjI2QVYwMFZCWE11R0tvY0ZzbDB6bWwybWlLUnV0?=
 =?utf-8?B?WWc3TjJTUmU4d1k3dDlGWlZRSnVUbXJxYlY1aXFPVExleU1HRjdKaENpNnpJ?=
 =?utf-8?B?WCt1NzJPRjkydm1GME9pOEZrT1pRb2tZNnRaaU5nYmxRaDB6M3o1MUtEQmJB?=
 =?utf-8?B?ZjhieG1rYzZlbVlrL3FIMld5K2gzb2RJUSt2QzVidjhwODlsc05leUx0cmtV?=
 =?utf-8?B?R3R2cUxMVUFWZWRHMlRrM01lRXBsV0tZUXBKTjdpWGhwcTB1STd5UVNSb2Fv?=
 =?utf-8?B?TVFmejhwMlJqTXl1ZTVJdFRtRG9CNmcrUk8yK3Bzc1dYZHVCMFFVbC9RaXVB?=
 =?utf-8?B?c2JMdlNSREYxbzIxQkdaajlGUEdtdkNIYWNzandxL1pOdXRxUlZ0b0lNbjBr?=
 =?utf-8?B?am5yUE9ZM1NvNVJ3bFQ2YXBUVURaQkFiNjc1RVhnbFlYaVBJajRaNEY0K0tT?=
 =?utf-8?B?ZHZ1cTN5SnFFZm1KT3ptM3I1QmdBanBRM3IycGpiN1BORmIxeG5YdU9qQllG?=
 =?utf-8?B?dms0VHcxVWlEcGp5a3RRR0ZuZ0JhOFV6ZHlyTHU0aWhKS3c3M05rMmZjZUFI?=
 =?utf-8?B?Q0dZbCtSWHBGdkM4clYycGlUSnBIb2ZkbGl5ZjZFcmFWaGNZd21RWE90U1R0?=
 =?utf-8?B?M2R1VzRaa3dvaTRGSnVnNUxlTU5GVThaUkl6QS9oSUVyZ0c0TGJEWGhZRjZX?=
 =?utf-8?B?OFhaeFhlaC9Tb2lXTGxtbXhaRFA0WWdkWDVkYU9zc2F6bnpOanlFZ1NBM2l6?=
 =?utf-8?B?KzdvUXlVOXptWndQdkt1OFlVYnFPVHhDYWRWK2NWZkFBNTh2VnRGcjh2MmE2?=
 =?utf-8?B?S0VkQlFCUGFJbWNLZjZacGMwQzVqOHR1SmQwdlR6VWJ2cktVUkpSaTRmY2hK?=
 =?utf-8?B?ZGNCdGVTY1VsVDVNODd4QlFlSmdpVkZFSTRhSDk3MllvTXdqU0hWMHJ0L2ps?=
 =?utf-8?B?MFg1VmZQU3BmK1FzQzQ2Sk16MXA1L3l5djJiT2J4cHdrOEJGSDZESzlkeUxo?=
 =?utf-8?B?bmVqSFpqQmVkRTlDdlBLa1cxWVY0TDExQUt5dktLVGRqemdQMEJxMWRzYXRY?=
 =?utf-8?B?S0k4YTB3a2F4VFUzK0Y0OUo5eEE1MnU2OFVkMGZUb2pNRVg1UzIzWGZpN1Jx?=
 =?utf-8?B?U0xvcndaWFI1QVY3bnFOQWVOV29Id09RZGRqZDRmOUQzQkxRRlphUlVrc0xE?=
 =?utf-8?B?QjZMcHdZOVczMjY1aVdxSG9RR0NmVHN4NGMzYzBHdEsvMnRIaVZOSWYzOTBT?=
 =?utf-8?B?MjQ1emJ2TE8wdVEwL2xOMDlXbnFwMGhwS0hsWVdZUnpMRjAwcmhlSm43ZFFj?=
 =?utf-8?B?RW1pQmsvc0hWbklSYUZqaXFOSjh1VzZKT2ZYa2M2UmR3c3dtMzQ5dUpCdmEv?=
 =?utf-8?B?dHVDMGI3NHJ4c0ZEZmlySGgwNnVlZzVxREFyUWdMc0FIMkZkT01LL1hiM1dU?=
 =?utf-8?B?NlBQNXdHbDR0VDB4bzl2VlJnL3pDS3QxVnFPY1did2pCMnFzUCt1ckE0SGlu?=
 =?utf-8?B?ZWRHdVVCejRxVmorL0tkMXRBZ3RnK0wxQ3I4ZStTeHptZTRSQ0ZsY3pOelhW?=
 =?utf-8?B?YmpadlplT3grVkZtRjdGNWVBV0R0RmpCMkhPU3hXVkwzOVphMUlsbXBXVVA5?=
 =?utf-8?B?eFBsaWd6YXp2N053UHAxQU5za3FNUmxiTWlPRERTMVZ1SnVkRGxJakVHNnFY?=
 =?utf-8?B?dWRSL3RQaGM4TkpBOE1MQW1nWlpydXgvbG9BWnRmWVl0Yml6WG91MFBqVW9S?=
 =?utf-8?B?dnVKZnZpMXdoS0VrR1c4TGFWWUVMZjFQRDFKT2VRbXY4T3EvaTFEd2Z6ZUFk?=
 =?utf-8?B?eTBPYnJVTjliYmxMWkdIZTF0c1lRNEZPYUcyVEFheDkzMGVLRC91M2M0NzBx?=
 =?utf-8?B?TWtiQzBPT0M3SW5xckpHVndTRk1oVUZjZFJyU1JXWHpmMUs4R1JGbVRYTW94?=
 =?utf-8?B?RkdsTTdZV3YzL2lGZW5JZUVNbWo0dVNNNEFaVzJJY2Z6QklzdmJnRStGS0dL?=
 =?utf-8?Q?K7ml3/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnRHZDFBZ3gwZlYvRUtPWHRvN3ZBYUlCN2RwQ0hubkpjK1huL21aTjgreG44?=
 =?utf-8?B?d1dvdnp1UVVqNXZMZmRxcDRpYmVWSVVtSnJITXdZeDBzdy9GKzMvVElTLzMr?=
 =?utf-8?B?NTRkRXFDQzJTbEFOalpFQ2FHZGVsRzE0R2tOSXlHbmU3bmN0Ti91V3UzRDdX?=
 =?utf-8?B?N1J3Tm5WWUhwTTlRaDd6a1JaaGZiNmdldnhWQzZzVXNLVWpwYmM4TmZyQjN6?=
 =?utf-8?B?Y1c0YVVkcGs4Z0YrYUl3WHdEZGw3aDcyakV6eTJ0MFRabUZmMkx2OCtqR0t0?=
 =?utf-8?B?TnFlZGNFZWt3bDQ2OWxXSCtPRGdaL0ZkckFIU3kyTmd4WUVHTjNkdktxVmlT?=
 =?utf-8?B?dFdXUlIvdkM3ZmhLdVcwWlo2bUxFdUs5Ump0Yy90TGNWV2NyL3ZHZVN4RFFu?=
 =?utf-8?B?eWhtcEdFa0VYNVN1Y2pvVHgrYXRETEF1YzhCeXlkMWRPY0hpWndoNitvMlBX?=
 =?utf-8?B?NkhRSEdKOXduZlBPNXh0Yng2bWI2RkxvYzd5bUwvMmVvL29QM09TT2ZhbmZX?=
 =?utf-8?B?ZlFkYWFHakQrUHc1VGZhRHBtcWgyaXBjSEUrcFVEU096eEI3S055Q1VBU0V4?=
 =?utf-8?B?RUlyM2puRnd3NUlkeHltWWxaTWhyb3dVbndxYXpVenAvem1LQy9IS2NhczV6?=
 =?utf-8?B?dDRMczk5cWx3SmZPVWxDRnowYVFrdS9Nd1FhN3d0ekd5QTNYaGh6eHE2U2RW?=
 =?utf-8?B?SC9KTGJZNjVFM0VHd3lIZ1p5cm5wczhzbk1US3pNM082S1hEdUVCcVMwVnVz?=
 =?utf-8?B?STQrY25xYzZCaDJUUmlJazM1eXQ2OXk4UEVDbWdoOEQraFkvRFI0WUZWYUdT?=
 =?utf-8?B?UlFBWlBMcXZ1b1FlcjR1SUFZV3hvVGYxd3orekpBTkU3Rk1HdHM4bDdYb0JM?=
 =?utf-8?B?RnJyNW0rRVNFb2V1YTh0UkZuTXdWYS9xSTgyWHN3cWl3d1BPZVZHdDBJOFl2?=
 =?utf-8?B?TlB1SHRZdkExajNWQkt5cFdTZ0FUK3BLZlA2Wm1LUU9WQXFzV2Vxekxlb0xz?=
 =?utf-8?B?N3psZnBCT05wQStkS2I1dVZXMEptUUdmK3B4ajB1SDRqa0xUcTNMVzVKUFd0?=
 =?utf-8?B?M2dGQ3UxTHc0WURiMjZxVVRCWFN6dys1MDY0UE1FbDlQMnNkSXZXQ2lvYVkv?=
 =?utf-8?B?YWxiZ0dYNzJ4YXRZcTJRWGgybjdvNDR6WTBFWGltVFZITUdSbE5FZHBwYUZY?=
 =?utf-8?B?MWJQYXRUN0NTS1JkLzJSbW9FUW9zNjNrc1lLdk9RK0tOVG5hWS9BdEpNWlpv?=
 =?utf-8?B?cnNMUlJLRXJXOVh0b3dOVElvSkxPQ2N4b3NnRFJVSCtaSUFoa2VEYktialpD?=
 =?utf-8?B?RktONWlZa1Y3Sk9xamZzNHRaVFQ3V1hhSndXeURpWXZtaXBncEdoYms0N1Uy?=
 =?utf-8?B?SDNNV09uNnRjWG42OGdac1ljenZhTlRvUG5pWmZDZTQ5elY1YWlsLzNXUkh4?=
 =?utf-8?B?K2RUaEFvNFA0b1AyTzdKN2hXNXBTazZ4SlBya1dYKzQwRDNnNFhUbm11VDFa?=
 =?utf-8?B?YnR0a3haY0dqYUNJdERwVXZIRTlMbWhjY2xNQ3lhVnAveHUyWjEraFlxeUFz?=
 =?utf-8?B?dmVNelI4YWVDcGVNajVCT2lIaTVGblV4aGdVTUpKZzlmcXBjUGo4RjQ2TmRL?=
 =?utf-8?B?alo5T0F5bFJ0cTduSFFqbzY4T1RQOVpQUUVrNzRURERpVnYzbGZHNmx0SkdW?=
 =?utf-8?B?Q0RiOWQyTGtieDF3T1ZLTFJzOUhMQTlxWnY3Y0U4cm94NUhQUWkzNnh3dUxL?=
 =?utf-8?B?R2VWTllTYlhCa2NqRzhZNUhWdXEyNS9ka3p4c3Z6bXdpZUExdTQ2aXVkTVRL?=
 =?utf-8?B?QUl1YjAvS1NWSncvL09MdzVtZ0ZHR2NJaDJnQXpRaEpEaTlKWng4ZTRKdmVT?=
 =?utf-8?B?M1RRVG8xVzdraWZoczdnQ3VzNzBobUpmZFJBTFhlVzNKcG8rbTFWSjBVVjk0?=
 =?utf-8?B?b2dzanNvVU9SVHU1Q042VmhwNkdLNGhtbmtyYi9NQTFqWlVIQVI2VVBOd1Jh?=
 =?utf-8?B?Rm1SZUdvK1BNbjlWNjNSbFBpUjR1TktDd2VKMmt3YW5DWFVnU3pFTEJZWGlt?=
 =?utf-8?B?MHo1S0JhRWFQZVlWVnBuc1NEaWdJbnBKWXZOV2Rod0lYZERueWhxOGxKZFdB?=
 =?utf-8?B?bzlaT3Z5QVJaWnZBdzNnRHhrLzhJbGs4bFFDWUxnK2tXS083enVUM05GZm5E?=
 =?utf-8?Q?A7CeGYiEwegtPuMD1OdwjWY/n0Lm9TQXX0Z7eh7DYTKL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d43323e-5600-4dc8-460a-08de2c14d051
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 11:21:43.9003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98f6/UrtDSnIpllr57cNnfaw/4t0bNNxKaJ9p+875tr5Rm86G2doW88iLjaujGpe1efLtIMy/afYm3eqINhWkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9371
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

T24gU2F0dXJkYXksIE5vdmVtYmVyIDIyLCAyMDI1IDY6MTggQU0sIE1pY2hhbCBXYWpkZWN6a28g
d3JvdGU6DQo+IE9uIDExLzE4LzIwMjUgMTA6MDUgQU0sIEJyaWFuIE5ndXllbiB3cm90ZToNCj4g
PiBBbGxvdyBmb3IgcnVudGltZSBtb2RpZmljYXRpb24gdG8gcGFnZSByZWNsYW1hdGlvbiBmZWF0
dXJlIHRocm91Z2gNCj4gPiBkZWJ1Z2ZzIGNvbmZpZ3VyYXRpb24uIFRoaXMgcGFyYW1ldGVyIHdp
bGwgb25seSB0YWtlIGVmZmVjdCBpZiB0aGUNCj4gPiBwbGF0Zm9ybSBzdXBwb3J0cyB0aGUgcGFn
ZSByZWNsYW1hdGlvbiBmZWF0dXJlIGJ5IGRlZmF1bHQuDQo+ID4NCj4gPiBNb3ZlIHhlX21hdGNo
X2Rlc2MgdG8gY29tbW9uIGhlYWRlciBmb3IgZGVidWdmcyBhY2Nlc3MgdG8gcmVhZCBkZWZhdWx0
DQo+ID4gZGV2aWNlIHZhbHVlcyBvZiB4ZSBkcml2ZXIgZm9yIGN1cnJlbnQgcGxhdGZvcm0uDQo+
IA0KPiB0aGlzIHNlZW1zIHRvIGJlIHVubmVjZXNzYXJ5LCBzZWUgYmVsb3cNCj4gDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBOZ3V5ZW4gPGJyaWFuMy5uZ3V5ZW5AaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYyB8IDExICstLS0t
LS0tDQo+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYyAgfCA0NyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMgICB8IDEwICsrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oICAg
fCAgMiArKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25m
aWdmcy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+IGluZGV4
IDlmNjI1MWIxMDA4Yi4uZWZjNmQwNjkwYjI3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Nv
bmZpZ2ZzLmMNCj4gPiBAQCAtMTUsNiArMTUsNyBAQA0KPiA+DQo+ID4gICNpbmNsdWRlICJpbnN0
cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaCINCj4gPiAgI2luY2x1ZGUgInhlX2NvbmZpZ2ZzLmgi
DQo+ID4gKyNpbmNsdWRlICJ4ZV9kZXZpY2UuaCINCj4gPiAgI2luY2x1ZGUgInhlX2d0X3R5cGVz
LmgiDQo+ID4gICNpbmNsdWRlICJ4ZV9od19lbmdpbmVfdHlwZXMuaCINCj4gPiAgI2luY2x1ZGUg
InhlX21vZHVsZS5oIg0KPiA+IEBAIC05MjUsMTYgKzkyNiw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY29uZmlnX2l0ZW1fdHlwZQ0KPiB4ZV9jb25maWdfc3Jpb3ZfdHlwZSA9IHsNCj4gPiAgCS5j
dF9hdHRycwk9IHhlX2NvbmZpZ19zcmlvdl9hdHRycywNCj4gPiAgfTsNCj4gPg0KPiA+IC1zdGF0
aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjICp4ZV9tYXRjaF9kZXNjKHN0cnVjdCBwY2lf
ZGV2DQo+ID4gKnBkZXYpIC17DQo+ID4gLQlzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJpdmVyID0g
ZHJpdmVyX2ZpbmQoInhlIiwgJnBjaV9idXNfdHlwZSk7DQo+ID4gLQlzdHJ1Y3QgcGNpX2RyaXZl
ciAqZHJ2ID0gdG9fcGNpX2RyaXZlcihkcml2ZXIpOw0KPiA+IC0JY29uc3Qgc3RydWN0IHBjaV9k
ZXZpY2VfaWQgKmlkcyA9IGRydiA/IGRydi0+aWRfdGFibGUgOiBOVUxMOw0KPiA+IC0JY29uc3Qg
c3RydWN0IHBjaV9kZXZpY2VfaWQgKmZvdW5kID0gcGNpX21hdGNoX2lkKGlkcywgcGRldik7DQo+
ID4gLQ0KPiA+IC0JcmV0dXJuIGZvdW5kID8gKGNvbnN0IHZvaWQgKilmb3VuZC0+ZHJpdmVyX2Rh
dGEgOiBOVUxMOw0KPiA+IC19DQo+ID4gLQ0KPiA+ICBzdGF0aWMgc3RydWN0IHBjaV9kZXYgKmdl
dF9waHlzZm5faW5zdGVhZChzdHJ1Y3QgcGNpX2RldiAqdmlydGZuKSAgew0KPiA+ICAJc3RydWN0
IHBjaV9kZXYgKnBoeXNmbiA9IHBjaV9waHlzZm4odmlydGZuKTsgZGlmZiAtLWdpdA0KPiA+IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmMNCj4gPiBpbmRleCBlOTFkYTk1ODljNWYuLjU3MmM2MWVlMWUyOSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPiA+IEBAIC0xOSw2ICsxOSw3IEBADQo+ID4gICNp
bmNsdWRlICJ4ZV9ndF9wcmludGsuaCINCj4gPiAgI2luY2x1ZGUgInhlX2d1Y19hZHMuaCINCj4g
PiAgI2luY2x1ZGUgInhlX21taW8uaCINCj4gPiArI2luY2x1ZGUgInhlX3BjaV90eXBlcy5oIg0K
PiA+ICAjaW5jbHVkZSAieGVfcG0uaCINCj4gPiAgI2luY2x1ZGUgInhlX3BzbWkuaCINCj4gPiAg
I2luY2x1ZGUgInhlX3B4cF9kZWJ1Z2ZzLmgiDQo+ID4gQEAgLTI5Nyw2ICsyOTgsNDkgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgd2VkZ2VkX21vZGVfZm9wcw0KPiA9IHsN
Cj4gPiAgCS53cml0ZSA9IHdlZGdlZF9tb2RlX3NldCwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0
aWMgc3NpemVfdCBwYWdlX3JlY2xhaW1faHdfYXNzaXN0X3Nob3coc3RydWN0IGZpbGUgKmYsIGNo
YXIgX191c2VyICp1YnVmLA0KPiA+ICsJCQkJCSAgIHNpemVfdCBzaXplLCBsb2ZmX3QgKnBvcykN
Cj4gPiArew0KPiA+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBmaWxlX2lub2RlKGYpLT5pX3By
aXZhdGU7DQo+ID4gKwljaGFyIGJ1Zls4XTsNCj4gPiArCWludCBsZW47DQo+ID4gKw0KPiA+ICsJ
bGVuID0gc2NucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICIlZFxuIiwgeGUtDQo+ID5pbmZvLmhh
c19wYWdlX3JlY2xhaW1faHdfYXNzaXN0KTsNCj4gPiArCXJldHVybiBzaW1wbGVfcmVhZF9mcm9t
X2J1ZmZlcih1YnVmLCBzaXplLCBwb3MsIGJ1ZiwgbGVuKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGlj
IHNzaXplX3QgcGFnZV9yZWNsYWltX2h3X2Fzc2lzdF9zZXQoc3RydWN0IGZpbGUgKmYsIGNvbnN0
IGNoYXIgX191c2VyDQo+ICp1YnVmLA0KPiA+ICsJCQkJCSAgc2l6ZV90IHNpemUsIGxvZmZfdCAq
cG9zKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGZpbGVfaW5vZGUoZikt
PmlfcHJpdmF0ZTsNCj4gPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rldih4ZS0+
ZHJtLmRldik7DQo+ID4gKwljb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgKmRlc2MgPSB4ZV9t
YXRjaF9kZXNjKHBkZXYpOw0KPiA+ICsJdW5zaWduZWQgaW50IHZhbDsNCj4gPiArCXNzaXplX3Qg
cmV0Ow0KPiA+ICsNCj4gPiArCXJldCA9IGtzdHJ0b3VpbnRfZnJvbV91c2VyKHVidWYsIHNpemUs
IDAsICZ2YWwpOw0KPiANCj4ga3N0cnRvYm9vbF9mcm9tX3VzZXINCj4gDQoNCkNoYW5nZWQuDQoN
Cj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwkvKioNCj4g
PiArCSAqIERvbid0IG1vZGlmeSBpZiBwYWdlIHJlY2xhbWF0aW9uIHN1cHBvcnQgaXNuJ3Qgbm9y
bWFsbHkNCj4gPiArCSAqIHN1cHBvcnRlZCBieSB0aGUgSFcuDQo+ID4gKwkgKi8NCj4gPiArDQo+
ID4gKwlpZiAoIWRlc2MgfHwgIWRlc2MtPmhhc19wYWdlX3JlY2xhaW1faHdfYXNzaXN0KQ0KPiA+
ICsJCXJldHVybiAtRU5PREVWOw0KPiANCj4gaW5zdGVhZCBvZiBjaGVja2luZyBkZXNjLT5oYXNf
cGFnZV9yZWNsYWltX2h3X2Fzc2lzdCBjYXBhYmlsaXR5IGhlcmUNCj4gDQo+ID4gKw0KPiA+ICsJ
eGUtPmluZm8uaGFzX3BhZ2VfcmVjbGFpbV9od19hc3Npc3QgPSAhIXZhbDsNCj4gPiArDQo+ID4g
KwlyZXR1cm4gc2l6ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBm
aWxlX29wZXJhdGlvbnMgcGFnZV9yZWNsYWltX2h3X2Fzc2lzdF9mb3BzID0gew0KPiA+ICsJLm93
bmVyID0gVEhJU19NT0RVTEUsDQo+ID4gKwkucmVhZCA9IHBhZ2VfcmVjbGFpbV9od19hc3Npc3Rf
c2hvdywNCj4gPiArCS53cml0ZSA9IHBhZ2VfcmVjbGFpbV9od19hc3Npc3Rfc2V0LCB9Ow0KPiA+
ICsNCj4gPiAgc3RhdGljIHNzaXplX3QgYXRvbWljX3N2bV90aW1lc2xpY2VfbXNfc2hvdyhzdHJ1
Y3QgZmlsZSAqZiwgY2hhciBfX3VzZXIgKnVidWYsDQo+ID4gIAkJCQkJICAgIHNpemVfdCBzaXpl
LCBsb2ZmX3QgKnBvcykNCj4gPiAgew0KPiA+IEBAIC00MDMsNiArNDQ3LDkgQEAgdm9pZCB4ZV9k
ZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ICAJZGVidWdmc19jcmVh
dGVfZmlsZSgiZGlzYWJsZV9sYXRlX2JpbmRpbmciLCAwNjAwLCByb290LCB4ZSwNCj4gPiAgCQkJ
ICAgICZkaXNhYmxlX2xhdGVfYmluZGluZ19mb3BzKTsNCj4gPg0KPiANCj4gYmV0dGVyIHRvIGV4
cG9zZSAicGFnZV9yZWNsYWltX2h3X2Fzc2lzdCIgZmlsZSAqb25seSogaWYgcmVxdWlyZWQgY2Fw
YWJpbGl0eSBpcw0KPiBwcmVzZW50IGFuZCB3ZSBjYW4gZ2V0IHRoYXQgZmxhZyBkaXJlY3RseSBm
cm9tIHRoZSB4ZToNCj4gDQo+IAlpZiAoeGUtPmluZm8uaGFzX3BhZ2VfcmVjbGFpbV9od19hc3Np
c3QpDQo+IA0KDQpPaGgsIGdvdCBpdCEgVGhhdCBtYWtlcyBzZW5zZSwgbXVjaCBtb3JlIHByZWZl
cnJhYmxlLiBXaWxsIGFkZCB0aGF0IHJldmlzaW9uLg0KVGhhbmtzISENCg0KPiA+ICsJZGVidWdm
c19jcmVhdGVfZmlsZSgicGFnZV9yZWNsYWltX2h3X2Fzc2lzdCIsIDA2MDAsIHJvb3QsIHhlLA0K
PiA+ICsJCQkgICAgJnBhZ2VfcmVjbGFpbV9od19hc3Npc3RfZm9wcyk7DQo+ID4gKw0KPiA+ICAJ
Zm9yIChtZW1fdHlwZSA9IFhFX1BMX1ZSQU0wOyBtZW1fdHlwZSA8PSBYRV9QTF9WUkFNMTsNCj4g
KyttZW1fdHlwZSkgew0KPiA+ICAJCW1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgbWVtX3R5
cGUpOw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGluZGV4IGM3ZDM3M2M3MGYw
Zi4uMTZhZmRkYzVlMzVlDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+
ID4gQEAgLTEyOTUsMyArMTI5NSwxMyBAQCB2b2lkIHhlX2RldmljZV9kZWNsYXJlX3dlZGdlZChz
dHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSkNCj4gPiAgCQlkcm1fZGV2X3dlZGdlZF9ldmVudCgmeGUt
PmRybSwgeGUtPndlZGdlZC5tZXRob2QsIE5VTEwpOw0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4gKw0K
PiA+ICtjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgKnhlX21hdGNoX2Rlc2Moc3RydWN0IHBj
aV9kZXYgKnBkZXYpDQo+IA0KPiBub3RlIHRoYXQgdGhpcyBmdW5jdGlvbiB3YXMgc3BlY2lmaWMg
Zm9yIGNvbmZpZ2ZzIGNhc2Ugd2hlcmUgbWlnaHQgbm90IGhhdmUgdGhlIHhlDQo+IGRldmljZSwg
aGVuY2UgdGhlIG1hbnVhbCBsb29rdXAgd2FzIG5lZWRlZA0KPiANCj4gaWYgaW4gdGhlIGZ1dHVy
ZSBmb3Igc29tZSByZWFzb25zIHdlIHdvdWxkIGxpa2UgdG8gZ2V0IGFjY2VzcyB0byB0aGUgZGVz
YyBmcm9tIHRoZQ0KPiB4ZSwgdGhlbiB3ZSBzaG91bGQgcmF0aGVyIGNvbnNpZGVyIGFkZGluZyBh
IGNvbnN0IHBvaW50ZXIgdG8gaXQNCj4gDQoNClVuZGVyc3Rvb2QuIFdpdGggeW91ciBzdWdnZXN0
ZWQgY2hhbmdlIGFib3ZlLCB0aGlzIHhlX21hdGNoX2Rlc2MgaXMNCm5vIGxvbmdlciBuZWNlc3Nh
cnkgYW5kIHdpbGwgYmUgcmVtb3ZlZA0KDQpCcmlhbiANCg0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3Qg
ZGV2aWNlX2RyaXZlciAqZHJpdmVyID0gZHJpdmVyX2ZpbmQoInhlIiwgJnBjaV9idXNfdHlwZSk7
DQo+ID4gKwlzdHJ1Y3QgcGNpX2RyaXZlciAqZHJ2ID0gdG9fcGNpX2RyaXZlcihkcml2ZXIpOw0K
PiA+ICsJY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkcyA9IGRydiA/IGRydi0+aWRfdGFi
bGUgOiBOVUxMOw0KPiA+ICsJY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmZvdW5kID0gcGNp
X21hdGNoX2lkKGlkcywgcGRldik7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGZvdW5kID8gKGNvbnN0
IHZvaWQgKilmb3VuZC0+ZHJpdmVyX2RhdGEgOiBOVUxMOyB9DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5oIGluZGV4IDMyY2M2MzIzYjdmNi4uYTY2ZThlNGIzZTAxDQo+ID4gMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gQEAgLTE5Myw2ICsxOTMsOCBAQCB2b2lkIHhl
X2RldmljZV9kZWNsYXJlX3dlZGdlZChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gKnhlKTsgIHN0cnVj
dCB4ZV9maWxlICp4ZV9maWxlX2dldChzdHJ1Y3QgeGVfZmlsZSAqeGVmKTsgIHZvaWQNCj4gPiB4
ZV9maWxlX3B1dChzdHJ1Y3QgeGVfZmlsZSAqeGVmKTsNCj4gPg0KPiA+ICtjb25zdCBzdHJ1Y3Qg
eGVfZGV2aWNlX2Rlc2MgKnhlX21hdGNoX2Rlc2Moc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPiA+
ICsNCj4gPiAgaW50IHhlX2lzX2luamVjdGlvbl9hY3RpdmUodm9pZCk7DQo+ID4NCj4gPiAgLyoN
Cg0K
