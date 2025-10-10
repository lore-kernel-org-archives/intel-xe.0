Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BD4CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 10:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406EC10EBA8;
	Fri, 10 Oct 2025 10:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHQJyoDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50D810EBA8
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 10:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760093485; x=1791629485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fPEIUSYLh+lXSFVTq9Zjc8Dh2jDPl4nh2Vi2Coe0l0w=;
 b=nHQJyoDnvCrKKRx/3Opa5VX9FMEFf0bpT2Pq96xUIM0wMSAzT8gng9Ia
 o4OhvBh6lRTvQXyJfINpQgBbgLMDIlBRksWjJdTCubeLTZRCxm+yBqsxl
 XFWFLAr+LP+L6ttFoQp900lWgT4EPmH4+1jZPns0bopqtoClz4bnIpYK3
 Za/hWQHXcmWRjFM5ktXX8g8+4ABqZlJAkeH1v+S58BtKjdDIcsUKuHXwz
 Fy+y+UtrdGgQXcGN/e2Oj/vkSQp3xFwZDSM/LLo+fEMbQ8zFZHlHRGJrr
 ezgaunstjwblAo0BODYKONGxfb5rK8sIgmYCe42vCYoGVFrR+5Cp+fV36 Q==;
X-CSE-ConnectionGUID: dXzMCKlNRfGLIbGBx2OpXw==
X-CSE-MsgGUID: /RsQgABJRhGVfo0MzUvRJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62340349"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62340349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:51:24 -0700
X-CSE-ConnectionGUID: nc1iPeIhRYaVrQHojJsTww==
X-CSE-MsgGUID: cpOEDTFwSmu0Bcmtw4H2CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="184982914"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:51:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 03:51:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 03:51:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 03:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJmfsyGQ4duHFKe2+PoC65L8KzM/tqP+wUAsI4kRUBIUtdDdxeE0/M2hgei8ywRJ10wS5Y0zxVrIMn70EKFHXheDV9xfvsfw51ew70Lkzbv8o3l0H6JUJogCqoQRL88Zj8nzKlfqcEq9M5t3DdTEIBLZtVdBU9zbuOk/gF+bWUy7UCup7Lo9UtKSQUbetVQoCWKcfIZk+EhaYtdN9g2Yo/7fTGoOwKwaDw9WODv/qZ/j8w+A3Or4kdy96fXD3FgIZMovtfkzquoKFxRpi+RlkQ5sMAgeOqO1+vgU4GGqwEDQBm3gs/PtAk/t+zn+GX5M/IbRFUMBa0rYJEReQchpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlSLmwOG/5pWlK/r3wENqzq4HErPrT6ORsUSCkhWt3Q=;
 b=ZTJCVMxLyyI/LcDEQ1F+BVegbrIQy3EWRJNdibaDPlq60RbxL38s5d3iQSBArG5NRXpVuzM+0/HcEPGpfjEbTCtJBYxqwtlXkXsoNxPp58auhA/OsmOVGlspiDl07AqpMBhrHVD4IZZ4bFpEQXW6C4UsWt+oMc+tobDNlsEWzk81QSbDLTUle2jr/keHquD9NVLXsem293vreWZHf9KOkKdBh8CkPXFSdLmLryxTUmkuzbFvhZD0+njGhgURTwXwXIqiBNpmM5wOnX2ZkCTox/rSimcDO1XP8clS5lED0vp0GCrKIY+FncmaWVg/6CUjBXlWmbptmI+iv+ycbpTyPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH2PR11MB8814.namprd11.prod.outlook.com
 (2603:10b6:610:281::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 10:51:01 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%4]) with mapi id 15.20.9137.018; Fri, 10 Oct 2025
 10:51:01 +0000
Message-ID: <9fec2fab-8774-444f-af68-bec86aa9d132@intel.com>
Date: Fri, 10 Oct 2025 16:20:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Allow mixed mappings for userptr
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20251010104149.72783-1-thomas.hellstrom@linux.intel.com>
 <20251010104149.72783-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251010104149.72783-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH2PR11MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: 19dabe40-daae-4981-c226-08de07eae6ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXZLdW9GeDM2Q3NRRHI5VFdyQjlFdC8wVDJxM1M4RXh3QXlMSzgvKzFBbDdi?=
 =?utf-8?B?d0JrTDl0ZnQxZTlJTlQwVmxaVlNZN0xGYTFJbmxwdHBYMjgxemE5Wkt3SUJ5?=
 =?utf-8?B?a3NKRWxRalVDVXFSWUpSRW1ldFB0ZCtWTG4xT2duSFNteVZSMUxZdUs4WjRB?=
 =?utf-8?B?d1FWbHhQekdZenM2L2hPcmFWUUFpWnZCOWtXV056bDZLYUw2ZnpjRCs1dEpl?=
 =?utf-8?B?RDljRnA1bmtSUmV3TVFJY285SCt4cjBsNC9vNEQ4Q0lFcTllOWM5OEh0V3Ur?=
 =?utf-8?B?K0NuOG1BS1ZYTjBZNXBvbDEvejlRRHEvTWRZZG1FQkN3ZENPbUgzQ1FQNmli?=
 =?utf-8?B?b2IwazNKYjJuaVFwaDU5U2hxVG1Ea2IwcUtsRFkwcm9KbFNmKzVvakpHSFpz?=
 =?utf-8?B?dUhLNmxGeldnTWZjcmp5VExKQWFsQWltSTRxWGNiUkVleGVWbWtLcmtFOHpD?=
 =?utf-8?B?UTU5cnZHelQvV21ueFk4ejFFYWVqaWk5cDZIcVhEWWJzSHhzL2R6dm81OS94?=
 =?utf-8?B?THN2ZzF3cTZSeU4vZnhTKzFNK1hWdnJJTzh3THd5bDBYMDBDdjJGZ1VzZW80?=
 =?utf-8?B?aHQ0UWo4MUtnZ2Rpc3E3NVVNdXhQMGNCdHZ6bkRQNEdndFl0eDVYcjJUbmdm?=
 =?utf-8?B?SXlCZ0poTzZlWkJpQnpxZzhEN1dIQlZvQ1RTb0ZheTh1N1l4M1Q0bEVReGEy?=
 =?utf-8?B?OUp2WEpwWUJvcHEwN0VyQ1BIWFRScTZYbS9vb3ViVlhQcGlYYUZTcDFSTEpK?=
 =?utf-8?B?RFVBZzkyZnBFZmhuRmY3TXJzOERITG9DSjlYWjFUdHpDTDZEUnN3SDBwZ3dQ?=
 =?utf-8?B?KzBXQ2dQL1krK0VxN2xhcGRZSFJjcW1FNzI2aE9QUldLVEdOY1dLbzVuYVla?=
 =?utf-8?B?ZzMzTTFPVHFUWitJNnNlVnBNZEsvUnArVWt5aGQ0dEU0SlUzQWtNbUJxTGF0?=
 =?utf-8?B?S3FjL3BSY3hUUTlueUxkdktIQ1BGSUJBUzV2Q1FEeTZpTDZWWDBUZ2Z3eVla?=
 =?utf-8?B?NEIrWjk2T05WQzBsRllQMW91MmFmRUw0Um8wZEpmVmMyUTRrSUN6M0RsaWVC?=
 =?utf-8?B?UllwWFBZYlNpclg3eWx1MElwaTZENDJ0UmVJbDdTejZpNDRTbXlCNXJqWS8w?=
 =?utf-8?B?K3hTU3VWQndPcDJIRGhkWlB0RWNjNUh5RDFaZVRlV01PbnNoemJMYWZ2bEhW?=
 =?utf-8?B?WWlmc0VhZ0NiQytnZm1qYXU3S0VHWTlVSGkzK1RFc3MyVndnOS9DZ09VK1Ns?=
 =?utf-8?B?QXhlbFZOSTRxMHJwUStTRno3c1NoMkVpK0FGcVNQL21MWVQxMnR1aU9DblBE?=
 =?utf-8?B?OU9MUGhDSVNSSjBFOUszLzlCS3BoRi9oUUVRaThRNmkzak56NTRieFJRRjNQ?=
 =?utf-8?B?U1IzbWs1UmxXSS94ZXN0WERUZDIweVVRcys1bURZU3JJSlRsajV2SmtnSDA5?=
 =?utf-8?B?eHB5ZzgrMlhFUW4xMDhJTi9iazJPb29aYUh4YXVZcVlpRmdDdk1qTEhQY0lR?=
 =?utf-8?B?dXFPUkFXUlZnbHZDbmM5YUlNakxIMCszODBXdnlxSS9ENCtkZjVPWkRUdnht?=
 =?utf-8?B?YU1HQThsY3FuQXlSU3c3V3VPWnY5RkFZS0xHL0JMM0hQSFZKK3ljaXdsRCtR?=
 =?utf-8?B?WnZPWTlEL08rcEhoTTg0Y3l3blRKc3g4ejJyc0pKNWthMGVNSUdOZ2gwRGRm?=
 =?utf-8?B?N2FCSkxYbWxiZkU2RzlrVVZ0THZuMy9Va2V5Y29lY3l4YXV3a1hGdWMxbzgy?=
 =?utf-8?B?cXNkejJtOE5zME9zOWR0aHBBaHZGZ21Md1dDZGVYaDFxWlg2U240UWVIcWVC?=
 =?utf-8?B?TW03QjBsdWNLWG5KL2IxKzNqd1BEcGV2QmNEdlg4aXc3ajBMOW9veCtEQStJ?=
 =?utf-8?B?RVNkNTNDZ05XYXFUUVd0SFhvaDFUeUY5K2JhWG9FMTVUT3RNcTZyY1FQM2Rs?=
 =?utf-8?Q?wwXx8IIprrIfAUHWIIvOONxz2brMN1Bt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blpWYklxVXpZR2xxM0pqYitrZzhtZ1pDb3gwRWtheDZPdFkzR09SSE5qUUs0?=
 =?utf-8?B?S1VnMmhzYzlEQjNKbUkzTnM2WUdpbHNIaVBzaURlbk0zeUtlNURqWHM1U2t1?=
 =?utf-8?B?RDZLRGNHYzdLdklkLzlBajE2T3BqVHdNaHZvRGRscnRDTWc1aFJ3ZlAyRDRy?=
 =?utf-8?B?SWMwYlVLM0ZmL0lzNHBFam0rb2FKdjY1eExkSkYzRUxDTnNITnVpZ2R4RFc5?=
 =?utf-8?B?WXh4dFBjcXdEcVVZL0s5TFdQQ2lpUUZoTFVMdnlNeW1NNTF1amkrUXlJZnR2?=
 =?utf-8?B?YjJkRENoVTBSdDhhbFU3SUIwc0NZTzhPNEduZ05wUnFVZGNBWE1BOUZ1ZlJ4?=
 =?utf-8?B?QVMreWhpTm5OZGR1eFBhZ01WS0RIU29ZQWZHQzlWc3ptYWR2Y084MkFoNDBm?=
 =?utf-8?B?N1FCS2E1bkgybjBqRWNYM3pCRUkzY2hsOEtrd0loUnFHdy9ralJqdWZvZGY4?=
 =?utf-8?B?NDB6bVMzVXRDNVBaa0t3T2p0azU3WkhzaHdpcE9iTkZzR3B4ZzlNRGlsTDg4?=
 =?utf-8?B?aXIyMm5RQ08ydzg2U1BobkhzcytTa0dXNUNjSUhNTGxvWjNROTdDVDd5ZmN0?=
 =?utf-8?B?T284S1dpNEdvUEN4QWJRWGd5UWtiUjVsUVhLTkZ0aWV5cHVaZGRuRHlIc1dm?=
 =?utf-8?B?ZVR1UENaREwwajRUdWNuMkR2UDBZU05zZEYzOUZUZjllSGYrVWxGU0Y4cmtD?=
 =?utf-8?B?TVl5V0RhRy81MjZ1dWtuK1lDajFENUNjc2pxazdtUkEzbER1VENRRHhnaE43?=
 =?utf-8?B?ck42Szl5MC84d2lvV0F4ZmRtRUR6cnlkZXRRMjhXYk9EbWd3bzJMUlVwMmpM?=
 =?utf-8?B?d2paNG1OUGtxTFhUL09hN3JDRjdMOWdyb05IVzdnbk1jSE03QkhuczVYeEVX?=
 =?utf-8?B?Ny9ORXhWL0ZiR0JNazljQ0JsNmRkR2FyTUxoT0tEbGVZeDZPWjJpbkNLajYr?=
 =?utf-8?B?dnRMeUxwemxNQ1djUjFuMW8zY2ZNMmp3ZG5xVmtUbGc3dzJFcDZzMmwrMkhh?=
 =?utf-8?B?NThpR0hZd1ZJMnNUL3hXanJvYllsejVNM1FmdDhOQzlFYlpUL21kdlEyVlVN?=
 =?utf-8?B?MzJMdmg5Wm5wMUJLRkhyTm5DaXJlRTJBendMdWtOVTBKMlBRT201bGhWdmI2?=
 =?utf-8?B?VjVMNjdrbktPckVDc0NwY2I5eWxxN0VGM2hZK0ExK0h1bmsyQ1UwaUtGWG1E?=
 =?utf-8?B?emJ4aEFDSlhwc1dlbWpIMmkwYkEyNjBkRitCSjNoRHF6Wjh2K2xkdG9Ea1VB?=
 =?utf-8?B?cnJqNUVSWFgzUGV6RjNvR2RVTE53amxOU1oyT1E2ZTk1TDZBdHdKQW5GckEy?=
 =?utf-8?B?d1pRRmQxU21lQWNpeFhtMXRlOWhaZHJodjhUNS9maVdzTjhGdUVCMVFNVmhC?=
 =?utf-8?B?bVp0eVRmZnUyeTc5VjZXWThNREZqNEVuSENvd1BDQXZqWjB5VDVUeVNtSkla?=
 =?utf-8?B?ZDdCbTZVSGJyYzRscjIrOHErV1BqN2hsRlEvL0JHeWZMa1RLT09aMWRCdlkx?=
 =?utf-8?B?algxNCt3KzNHWWRHa2V1WXpCU0d6Nm9wWjJUKzc1SXRBZ0xTTW9SY1g3V0t0?=
 =?utf-8?B?ekRNeVE1b3F5UkUxU0hzWTIwYmZMcEpaTDd5a0lyMGRPQkR2L3U2MkNLampW?=
 =?utf-8?B?dVUxSFZiazQ0aGl1NEVZRHc3aDA4ekhVMGZBRnRDNHowR2xKZXNkN0h4TGZY?=
 =?utf-8?B?R0VWNzlnOHd5TTNHbzA3emdUd0ZGUlo3YTg4bGovQ0c1c0RsTWtsQkp4cWlB?=
 =?utf-8?B?d2xRR3pISmpRa21wSUxPalNvQ1czQjcrUXdyWHluSWMxMEpFNUUvSjJ1dWkv?=
 =?utf-8?B?S1FBMWl5NWhhZm1QTVprSlZZRjdmNWdnWnhsSTdDbEFZM3hUYUoxMnpBdVQ5?=
 =?utf-8?B?WDQvMW9rR2p5RTFETEVYeER1R3RZc2R5Wnp4TEVjSGtoY3NQck5OZkx4MFNL?=
 =?utf-8?B?YUQwNDZVNVlLVXZhQWlQcVQ5bnRBOVQvZXpIb2Z2SkN0OUdqeVpYc3c4UXFQ?=
 =?utf-8?B?dTA3QXVNSkZTWWxQSEs1NGVCN3dkOW5lSm4wQ2NuUzBkTDBDTjVqOGh1NWFv?=
 =?utf-8?B?ZzJGdytEbzRNSjRENFo5cklKTTNacWZ6czdka3UxNE5xaU9EbGVZUW40cGJj?=
 =?utf-8?B?TFJPU2ZTbHgrT1FvNlVRQW5OVHVzRENnRzhmVjBva01ZMUR2VUtETTRnNUpR?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19dabe40-daae-4981-c226-08de07eae6ae
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:51:01.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViCjKoH95qQNkhWg+7yaJPuVsCWowB8FghBjxjFpRc69xmFRMxcvJxJfTTzULIGNezbYDcCLgJSAA7D3MIQmQ3y8Wun9ReDXsfjxxWykHpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8814
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



On 10-10-2025 16:11, Thomas Hellström wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Compute kernels often issue memory copies immediately after completion.
> If the memory being copied is an SVM pointer that was faulted into the
> device and then bound via userptr, it is undesirable to move that
> memory. Worse, if userptr is mixed between system and device memory, the
> bind operation may be rejected.
> 
> Xe already has the necessary plumbing to support userptr with mixed
> mappings. This update modifies GPUSVM's get_pages to correctly locate
> pages in such mixed mapping scenarios.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> v2:
> - Rebase (Thomas Hellström)
> v3:
> - Remove Fixes tag.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/drm_gpusvm.c    | 6 ++++--
>   drivers/gpu/drm/xe/xe_userptr.c | 4 +++-
>   include/drm/drm_gpusvm.h        | 4 ++++
>   3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index cb906765897e..73e550c8ff8c 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1363,7 +1363,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>   		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>   		if (is_device_private_page(page) ||
>   		    is_device_coherent_page(page)) {
> -			if (zdd != page->zone_device_data && i > 0) {
> +			if (!ctx->allow_mixed &&
> +			    zdd != page->zone_device_data && i > 0) {
>   				err = -EOPNOTSUPP;
>   				goto err_unmap;
>   			}
> @@ -1399,7 +1400,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>   		} else {
>   			dma_addr_t addr;
>   
> -			if (is_zone_device_page(page) || pagemap) {
> +			if (is_zone_device_page(page) ||
> +			    (pagemap && !ctx->allow_mixed)) {
>   				err = -EOPNOTSUPP;
>   				goto err_unmap;
>   			}
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index f16e92cd8090..0d9130b1958a 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2025 Intel Corporation
>    */
>   
> +#include "xe_svm.h"
>   #include "xe_userptr.h"
>   
>   #include <linux/mm.h>
> @@ -54,7 +55,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>   	struct xe_device *xe = vm->xe;
>   	struct drm_gpusvm_ctx ctx = {
>   		.read_only = xe_vma_read_only(vma),
> -		.device_private_page_owner = NULL,
> +		.device_private_page_owner = xe_svm_devm_owner(xe),
> +		.allow_mixed = true,
>   	};
>   
>   	lockdep_assert_held(&vm->lock);
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index b92faa9a26b2..632e100e6efb 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -235,6 +235,9 @@ struct drm_gpusvm {
>    * @read_only: operating on read-only memory
>    * @devmem_possible: possible to use device memory
>    * @devmem_only: use only device memory
> + * @allow_mixed: Allow mixed mappings in get pages. Mixing between system and
> + *               single dpagemap is supported, mixing between multiple dpagemap
> + *               is unsupported.
>    *
>    * Context that is DRM GPUSVM is operating in (i.e. user arguments).
>    */
> @@ -246,6 +249,7 @@ struct drm_gpusvm_ctx {
>   	unsigned int read_only :1;
>   	unsigned int devmem_possible :1;
>   	unsigned int devmem_only :1;
> +	unsigned int allow_mixed :1;
>   };
>   
>   int drm_gpusvm_init(struct drm_gpusvm *gpusvm,

