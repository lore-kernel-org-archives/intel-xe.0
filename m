Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69357D6CFA5
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 21:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFAC10EAC7;
	Thu, 22 Jan 2026 21:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwT0x56K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A796F10EAC7
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769117663; x=1800653663;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sK4kH36rC323dUqNImygE4ro2Ysu+fhybdW8Y8sAakI=;
 b=TwT0x56Kj/ZAfgzBTvEJYtr4SJl5HozsGvfyaEfU0rbjckB4s0dI2pAh
 CqpfgmoUJA1I6MJRswoZANNPD2s+MwvjYcbVXh4FJSQKWzi8aIi6tH6i2
 dI2cIdMeUeE+GcPiyOtmNhbyFdW5w+ZYxAigBpMswj76USXfAd4yYFpPX
 VGSPYBVuGaEybf3aLaREV0LcCOgxQNEfaOpKTDdnKVGfJAPn4j0ZPHvH7
 ChQoDv/bsRlBeNxBa8Pk8d52VTAbLm6Voq5WtXsVuxDUq7lphQ+2nVNnR
 v7JQVGHa1ay/cO2nZqesknPGL7OFSJ1FJXxDJ1fZI4Vb/pEQJkPweewJd w==;
X-CSE-ConnectionGUID: uUjIOgQWSLmz8p2HIqD1Aw==
X-CSE-MsgGUID: ZNwQ9q5pTn+2f+feRS6vKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="95841915"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="95841915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:34:19 -0800
X-CSE-ConnectionGUID: b3Pj7DXuTBCqMq9cEu2+xg==
X-CSE-MsgGUID: qyMJ1tiAR72c1nLraO6FwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206747410"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:34:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 13:34:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 13:34:17 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 13:34:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUDGvYXmQXD0WS7KB8NhDBskcQ6F2pktQoLxmpu5tixGEm4WsUp1NLxtS+AbWbhAOUmUi64gpy9xXL6oZ5GH4h+gpySVUDUlAcLatiedxi/gMyZGExIrcL91ZwcKwnXWmiUDFQzagQOCDNHWJLJzDGzTICH17U3G/cIsp2B3U7A5pN+n+bm1PZ/xUFjys2JwI4B4TGQIp6M3i6HKjWqzfJUV/D1q4RI08+Y/+28DJXsLObQTJJysCXpje27lH5lJxfTIKlTv5d3N8GNoonlig/LiWnyHl1QU+lGbRJKYkU/VFgzNATV+6r8XeujgyzeUvFTSchrNGLaLFDsfHYsqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzoV9MaCirzXyPeW6LPnzqWnmMvYqznGewyCi9MnQHU=;
 b=ZpCh4b4n2JGbSUX8w758QJI1n3eHFZOEnxVxxNdV4wxBdizTDfeSFag2R+4JGtOVX81tTK6Yr/mVpftbudFWqyzEZ7tbpN/dyjgtB4xh9n+F4F6VCnbcdtBVTzvPqT+p7+9GPo3xJsCMQUyRWBYnCZk3g1kwu2bYXc7QNCZutmnS1z/kyzFMB+LpLw50EZpCajx5LN6fvavynJ87HJ0VZWuuEyk0YQuDefe5iZDccaSm5WaJo50c4kdwTN+dgibDGseDABxf1xzOuqb1sEBnRtBPV20ffmEPw4WpHhbRBIy2TQ1fl5XdtxSzmnJoyIT/jvP4urgmiXuumC60QWH7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 21:34:16 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 21:34:16 +0000
Message-ID: <1e91b028-af9a-4a20-b5ba-5321b5ae1e9a@intel.com>
Date: Thu, 22 Jan 2026 13:34:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Reset VF GuC state on fini
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260122151924.3726-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260122151924.3726-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c64006-12b8-4224-0ab4-08de59fdfe3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVpvclN2MnlaUElGRGNzRWpwc1h1eEdoVkZ5S3hoVHJWUWd1YWZBSDZWYVBw?=
 =?utf-8?B?cFlnMUZheDQrKzkzbFh0dnh6dFZYeGYxNDN5SUdRSWs3S1FRRHJ5VjJEWjZV?=
 =?utf-8?B?UGk5UkVEeHhiY3Mwa3NSM256K3JmTWtYSjdBRGlheHhacElXV3docUhTdTkz?=
 =?utf-8?B?ZTFoN1pSWGkra2w1cWkvTXZZbWhmem13UW4vc3hLd2xMckVQSitOeVhMaEJK?=
 =?utf-8?B?clFua0VWbTdIdENxR25mOW8yaGZicTFoUEJpVnZ3ZDZtTW5BeEwzUkZFY1hP?=
 =?utf-8?B?ckpnU0d1ZVk5c0VHL2NFUGtWdHFnYWszd2xyN1NhQnFpV2cxQ0U2MENrVkpR?=
 =?utf-8?B?MnFvTHh1ekN3cWYxTTlMaHBGNlpRb2w4SDdIc01zM0RCZVB1NFFyTDJxUWNT?=
 =?utf-8?B?MmdGOWdUeCtaYXNUMVV2Wk40VnRnazF0QmdjZ21rVWJJTDJIUXZhWFdSUzJs?=
 =?utf-8?B?WmlpNksyRnJXeTJuWUlRdkJwNG0yUE42TnJHU0JBa21SWHZpQTU5YUFBR0t0?=
 =?utf-8?B?cWJmd1hlZ3dVNThHalBmMDY2SUdtdk5FWmZoSzUrRzBlTzhWU3BxYlBManY0?=
 =?utf-8?B?eDJ1SnBwQXBSQVJQZVFGa3g1Q0FOMWtBN1FadnNxWnNEOFFab29pbmZWNjla?=
 =?utf-8?B?YUE3Q1ZHOWcwOUtLdU00QUM5VnFNcDQzeVlmMHhZTld5cktPRm9vWExLMVdR?=
 =?utf-8?B?dmlwcXpRUXJsdzRDMzFoa0h0K2tsbkdtWVI5ODlzelRUS3VQWnM5cWtacWtB?=
 =?utf-8?B?WFBOZzBqazNDanZYSWgwaXpSV1p1U0dpRTZSZVNGc2xrb2RDTDVRRVIwVXo1?=
 =?utf-8?B?SlNMYzQxLzVnVmRER2pCYXVFajlsWTRjWVBhYzhXa3NWcVVkVjR4R21tMGNW?=
 =?utf-8?B?Rmx2NnR0TmtYdmV2TDl1RFI2UDk3YXFjUWxuMHpBQyt1aVdkelRhOE9CVGF3?=
 =?utf-8?B?ZWZSb0lGTWtGUS96dW9UMGtFaUp1Q3dxQkJKYlNLaDBCMUZIZ2puSWh4SkVL?=
 =?utf-8?B?Q0xoMkNXaXB1L0VVb09oZW42d3hINXhoM1F5MkVKTVJ1VlUzWitxT3I3K2Iv?=
 =?utf-8?B?TWtEQ1ZWMHhDZW83T0R3VTBFeUVuRURHT2RVRTVGN3A3citscUluU0p2VHBi?=
 =?utf-8?B?ZE15QkVzUHRZRVNFd2JyZ1ZydkhyZW5SQmdoMk8yZ3d1dWZRQmZweU5ESGdp?=
 =?utf-8?B?SkhIMkxuMkhwN0toenc0em0rTHpwRzRvZWtMNVFWcFVhZHhsUTVpK0NMUWdp?=
 =?utf-8?B?S0ZaT3kxWXBEK08rQ084Rlk3TTJQVjJMSGwzMXFyODNxbW5FNVF6NkNra1pD?=
 =?utf-8?B?RFdoMDNUTVdPaTN4dytUd3YzQXlQbU9TdnM2bVZxWXJiSXgvMjBrWmwrRDd4?=
 =?utf-8?B?SnV0YzVGMGFyd0pUR2IxRlluZmIwMXZhcnpQUnlkTjZqZ3EyTHdvc2lNd2JY?=
 =?utf-8?B?bG9qUzZaZGxvWEc0RTltSW1ZV1ExZTREM0lDdjFLcUNiVk92VTl0SFRINmlQ?=
 =?utf-8?B?MGxYcDRGVHBKVUtOUzlJbGVUQkZobmJpbnNJRnRIakhkSGp5RDFtRUVWS0ZL?=
 =?utf-8?B?MmE4U1M1dGp6QmlOaTllckpqYWxacGpRa3dqTzM0b1QrTWpkL09ZcWpjWFl6?=
 =?utf-8?B?Vzhmd214eE5OcFdkN3Fvd2VtMG9WUVpnNUpSWFIrSFBiOFhyR296NWNKeGZQ?=
 =?utf-8?B?ZlBaa1JXSmV5Z0ZEVWl0ZnZ1QVAySTYyRmZoUDQxNGNPaEZ4bWdkWE5WeUN4?=
 =?utf-8?B?ZUtVanY5R1Y0dmJ6YXFVdUllcmk0L2pwTU9BaUZ4VmxQY0M3USt1Y3UvNDVZ?=
 =?utf-8?B?OXNNZnVtVEp3V2ZrU3l6T3lwb3dRdlpkUDkzUWhPVUo0MVNtTEp6UFJ3V3dI?=
 =?utf-8?B?ZUxnMmsraHNEbDdFWXB1WWNNcmhIRU9WbnBlekxCWUMxNzFVZ1FCUmZ6dkpT?=
 =?utf-8?B?d1NBMEw3UEFkUnpBU2xPVGVQd0ErK3BOaTB5TE1hNkFqTVRyVGlEM1Fka2Fv?=
 =?utf-8?B?SjZvazlvYnkrYjM5QUlyMHJoRVROK3ZuMHNMRlI2SWFUOThyUzVpNXRXQ1JS?=
 =?utf-8?B?L1REQm9mWTRCK3FqbHVDZWk5Z041S0ZLWVA0QWh1Q1o4VUtXME9va3U0dkRu?=
 =?utf-8?Q?dcIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTFXSHMvQ3FmdVl3NU4zNzU5NDI1TkhTUDJmaHEvaStJdVZWR1ZsZEt1ZWtV?=
 =?utf-8?B?Y3NpYlNkbUlSWFRVOWtmdmxvLytqNmVjaklWVzMvdEcycFJjM1o1VElHak9q?=
 =?utf-8?B?dk1jdnYyVXFqaGdRcG5KL09VRnIxSTlldGJlcDBvQ0tUbWN3alU3THM0aTZo?=
 =?utf-8?B?dHd2OXEveGthNUNWbUQzaUIvUnY1azAzSndrWHcxUDdwRGszcENNMUlEZ1ls?=
 =?utf-8?B?TkFtR3QvaENyS1hMZjIyNWt4WU56c3ZWYlRVR2F1WTFoQUFUYVc4SmxUUWxW?=
 =?utf-8?B?R01TcXlVZ3FOdnE0WElaRmwydEhoUk5vcWwrUkFuS3ZpVmpDclJyWXZCUU4v?=
 =?utf-8?B?SXJDV3QxUWdBRitJTGNvVCtBeGpXaDcxblNMSE9rSXRJK3J0STNOZTJyWExJ?=
 =?utf-8?B?endQNFQ4UEQ4bll6cU5IZUpaQnBRQU9qSUJ3S3o4R2p6WnpuenpIVzg1RWEv?=
 =?utf-8?B?Z3I1UWVDZFR4Ym1GTlJmQStGMDVXeTl1ZjRsTnhvdlJnOCtqcUR6ODBtd3lh?=
 =?utf-8?B?RjBCdFRabTQ0WFVpMFhhckdHTHV2em00bDVLeHdadUp5bzFCZDdCa3d2Z3dh?=
 =?utf-8?B?TXUweng3NnlRZTFwTXJsbUlKMVViU2ZueTdCb2haN1BrZFhnWVJpNUlpc2Ey?=
 =?utf-8?B?Mk5ZU2dSZ0VFTENmb3kyNGZrZ1Qxd0VCRXUyelJHTy8waUlUaUlpZnRCSXhD?=
 =?utf-8?B?bUxiSmJHb2lqS1A3dFJrNXhHeHNpS1Yxak5ENG9oWFJjNDE5c1phdld4WWFx?=
 =?utf-8?B?UFV2aTQ4QXZ3SzNrQXorUVd1bUlkWlQwNVFNS0w5MFRGWjFmc0tqQ3NwSE43?=
 =?utf-8?B?WTR1eHlSdm9veWF1VGJNeVEvaHlvejZnY1g4UXFpNzUrMld0QytQUWNYNEhR?=
 =?utf-8?B?K2RVSEtVVVlPUXJ4bXU0YzVaQUg1OStYK01yQ2lrS0kzb05jREdPenJLUXI5?=
 =?utf-8?B?dUN0TU5RdVVOZFdHNmpIcWxyMWpveWVLU1BmZFdzY2s2Rm1kOG5rNlNURzJW?=
 =?utf-8?B?cTNLazYzamMyNWl6b3N6SndvbXd1WmZidXBKMzdqcmFnNUpSK09mdWRycEFu?=
 =?utf-8?B?L080MThKbW4zd2E3bTJ4Q1QzYU9DbWVIZCtaUUp4cnZqODk0OFVuMkk1ekw3?=
 =?utf-8?B?aG1ybEt6WWptQTdiU3YveGxoanN6NjFtcDZheHhGeE9QeHh2bzdUd2RWQ0hU?=
 =?utf-8?B?WmR0V1l3MWRwS2t1eTZpVmdmRUx5bHNJSW9hTDJPU1VoWXNRSGhBVUNYZkd1?=
 =?utf-8?B?SnNRcmltUTNXOVJJL3h6U1o2R0l2ejBacGZVQ1F1czFPZ25uYTNIbnNzSUh5?=
 =?utf-8?B?eFg5L2g1RUVqemR2dEhBMTJ5bFpoZnp3QTZyTS9oaHZ5TmdYWmdtWU96UkQ0?=
 =?utf-8?B?UDZqekxGSi85amZ0eFprQlNNQWYxTTN6bWp2dktxZjd5QW16aFV3Yjl2dG43?=
 =?utf-8?B?UlUyT00zZkZ2MTAyZWdBbHJmL0dRZlF6UXBKV3krTG84OFFWVTJydDh2WUpP?=
 =?utf-8?B?dzlLSE9XOEVpTk81WDA0RWRSVjVGQkFCK2kweWF3a24rWnVWdXpRV1RsQzcw?=
 =?utf-8?B?M0lKSFBJZlNSNUp2SGpmK2RaOWQwd0ZqWjlKTUVUNXIvbHRLQWNlR2VoL242?=
 =?utf-8?B?YURyeHRVZkJsMnpWV1ZZMWR4K1VvYk5tTVQ2d1JUaFlWMGhBVDEyUmhtdzM0?=
 =?utf-8?B?eXd1WGs1QXJxZlY3OTV0MktkcjdmakRkZWNVdHlHSGNvaE5nVEQxQ1JTWmox?=
 =?utf-8?B?ZlcwT3lvdUU3NzdpVUQ5ZDNxdk1wSzZscEZnY2d2S1gxSjhEZC9mcnR2TDNG?=
 =?utf-8?B?TU1nQ0FpT01pdzZyTEhyNnZYajBhT3hvTzFXeWFUUEZGOXlBU3loZkFFZS9o?=
 =?utf-8?B?NTQydzFoMGlhQkZqeVpGcmtTdUo5aGhvdXRrZU5rSmhqZTQyYSs5TTg4Q3ZS?=
 =?utf-8?B?bTd5b1ArVUhlTTBsK1Y4Y1ZmRlhwRVRoTkwzTEswNFY3cVlIZFJra2tPR1Ex?=
 =?utf-8?B?aWozcDZWT3M5MEY0dkJIQ1l4a2J4ajYzeUUycGlsZGl0azRjWko1bGszTHlz?=
 =?utf-8?B?NVRhOS9ReWd2MnJtWEF4ODZlSDVOcCtCaHQwTFVESTFVNE13MnNxNVpQTDdU?=
 =?utf-8?B?SDJtbGlrZGhVSTROM3AwNjVXK0tqRXp0Q2wzVzRneVVCMy9yY3piZW0xbGZO?=
 =?utf-8?B?dUFGT1FsZWRWN0xMMzNNQ0pzNCt3OWVRZGNBcGtsOWlDVExIcUR5ZWYzNi9a?=
 =?utf-8?B?SUo3Q1pmK21qM3U2ZGZ0WWtKUnhVUGgrNlp2VXducUlUMFZMdE1QcWw0RitX?=
 =?utf-8?B?V0t6U1MxY041TmN2UFlqamxRSXdxMzZXcEo5SU9XRFZ2TWNLL0pZTmgzYlk3?=
 =?utf-8?Q?siY/C3mzKc6sq3XE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c64006-12b8-4224-0ab4-08de59fdfe3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 21:34:16.1008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lthUZhu51g4czKS71FeKkPADDqEH/b1cHqr01tIjSiWhA4mW8U5YPiUVfz+9SGXJAEbW+XblW7VuKjPip6XMRclh0kRFvn4mGBkQBwAIB1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
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



On 1/22/2026 7:19 AM, Michal Wajdeczko wrote:
> Unlike native/PF driver, which was explicitly triggering full GuC
> reset during driver unwind, the VF driver was not notifying GuC that
> it is about to unwind, and this could lead GuC to access stale data,
> which in turn could be interpreted as VF's malicious activity.
>
> Add managed action to send to GuC VF_RESET message during GT unwind.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..2efc4678fa73 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -668,6 +668,13 @@ static void guc_fini_hw(void *arg)
>   	guc_g2g_fini(guc);
>   }
>   
> +static void vf_guc_fini_hw(void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +
> +	xe_gt_sriov_vf_reset(guc_to_gt(guc));
> +}
> +
>   /**
>    * xe_guc_comm_init_early - early initialization of GuC communication
>    * @guc: the &xe_guc to initialize
> @@ -772,6 +779,10 @@ int xe_guc_init(struct xe_guc *guc)
>   		xe->info.has_page_reclaim_hw_assist = false;
>   
>   	if (IS_SRIOV_VF(xe)) {
> +		ret = devm_add_action_or_reset(xe->drm.dev, vf_guc_fini_hw, guc);
> +		if (ret)
> +			goto out;
> +

it kind of feels weird to have this before the ct_init, but it doesn't 
really matter, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   		ret = xe_guc_ct_init(&guc->ct);
>   		if (ret)
>   			goto out;

