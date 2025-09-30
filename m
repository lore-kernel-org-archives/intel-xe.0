Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35DACAC5B9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 06:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A210110E4F9;
	Tue, 30 Sep 2025 06:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LL91nP2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4DA10E26F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759213837; x=1790749837;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Chng/JzcI2fBNjdAt7zObu0YYL7gzX0H+mOPxGjKKi0=;
 b=LL91nP2AK9fMnV9nYNe1WJlyxxfLhwyVmPTRSPySc//BtxpES41vVV/4
 lqUG2tMJHViNWek50Jsm432PKhTX3wbVRjyJEXcF4DbCZB3Bg15pzEP7I
 vYF3NtQXgsS03BqiP8yWTP1ehZu66OjOmJMshNd/pGH5hUeZptgGzIGej
 cO09O+ADcLghbxCTxfsoKEoSjpnr5uRW5AZDNB72k6rxxp2saCxJMg3pL
 fivvfdYZB7AqnQKdeIWYL94yJPNKuChhsOxBCBZ5D7XE2FjgAj9ShNad3
 QVxWbpKUVHMllhQgt7ItDuyY48mL8hS9HE+LluC+Wces0VFgOPNubFkBu A==;
X-CSE-ConnectionGUID: AqhCHnZ3QzWitTWAav2Z6w==
X-CSE-MsgGUID: JG1ewP7GR7umvzGU98dlSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72080479"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="72080479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:30:29 -0700
X-CSE-ConnectionGUID: EuJJun73TtOSGGsS08S7fw==
X-CSE-MsgGUID: c8L0P9VuTC6msewTJYGWBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="178032322"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:30:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:30:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 23:30:28 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9/8GvnMgpeZRANmd1EWcR03PaF6XNLHyCB3SsXCMSvuETs4dW9DcQWJ9M3sd7XTHT3qLGdr8iYPg1slrgHvqql/f4w8QNeGYXGA594PscdMsYTFHlAVzMVQTH365QWxJ/DQIK71RnZs0g+/Mqb8/+soAIOspDp4giMGRjxlVX1IyI+U9sEeY1BnRk6NLDOFjckgQRxyIhq4Xfui0/2Rz5ZiAF/pzPfagLz7DrM8OWfdvSv0XuSbmHKIKZvgeqPONee0G2PPVmkpPAUY9ajj9K55KJc+2L0x3UMbKR320mve+7sdVYCvAa1spcwr7xd4UYyuCMPJrGa1nvNavS/n5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27uMCbpRL7JCX7DaAF3jU0qogGtXk8tvPhoutLUPXHU=;
 b=kFevuSG3SDxwL805gEcKp3GiXqiYDdrwggXMWuotMi9XU2GWHLZn9vfrZwAwp+1h5abGmo6PCp86/2R+E4qU2EJx3mV2joyv0q57x5fKUHesZDfFtXvgADb2WLOS/JhBWGxDRv2F0nkmKmIfdkm2EGy0n8XhnkNU9l4x2Q+S7Pcz8o8aXH1w7WlL9ot8M9siW1h0YIdcGXHUpQV4hPWrVCHPNdTz4ypGY9vmh7qAt/9MDjoyFO8WwcLLDtqaROrE5QD9cUKrlwFcfmLIhMhSVGH5ChmJHL1DyWnb0HQLs7FZEIpRLuNoOOj42xdXGicbH4veLocuhhvxDoaeq6Wxfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:30:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 06:30:26 +0000
Date: Mon, 29 Sep 2025 23:30:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 11/36] drm/xe/guc: Document GuC submission backend
Message-ID: <aNt4/4vsiqZvKlOq@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-12-matthew.brost@intel.com>
 <a0b50db8-77bd-481e-bf80-2e8b762a1de5@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0b50db8-77bd-481e-bf80-2e8b762a1de5@intel.com>
X-ClientProxiedBy: MW4P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 49861ec3-c75e-472c-92c8-08ddffead788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enM0OWloV1NQUDZhU3EzQU1IVWV2SnFwWVlKOWRub0dpTnA1N2N2VENyYzFY?=
 =?utf-8?B?MkdidnI5cEFOcG9haHlTa0piWEpOa0VTcTdUTy80OFBiTFVPQkxVcXA5K2g1?=
 =?utf-8?B?YS82NVJCcFRvbDRwNlZlazA2eE1UTmdGRllZd09kb08vcmttZnBEN1BWbFRr?=
 =?utf-8?B?NmtRSHA2clJqUS82NmhSOU5DQXlFeWJqS1RSSVE0ZEpBNXROSlBLY215bW94?=
 =?utf-8?B?ckgydmpjRHZFalJjYUVDM0NFTkYrKzhVYmp4dlFiV2d4YVY1WVZ0ZlU3VFFN?=
 =?utf-8?B?U21WWG5zdXNhNk9pczAyOW9pdm5pcnpzTXJNRnJ4eWJtMWJxMWxtNjlVc1ow?=
 =?utf-8?B?ZFc5WlV0Z0dwY1ZqVmxTUDAva1ptV1VVTzEwVGc2MUd5aC9uTEZOOU5DTlk3?=
 =?utf-8?B?OFlWWVZ3aG1zaG90azFvSm9TWldsRUtZelJqOWZnbFhKSFlxVFNTSDQxdmpy?=
 =?utf-8?B?b0lzS2pNbnZKaVhDYWVGbTc0N2srT3lOSUR2OUJkZFkvUnk1YXdzdzM4b2lO?=
 =?utf-8?B?aWxRNE5TUklGU0JpdVVTYVNPbFRxQk1BeW0yTi8xeFRsV1phNW5CS25FQVkw?=
 =?utf-8?B?UWlCRXJUKzVORFFxcW1rQmIzem8yc3ZqZlQ5OXYycEZQZnhJdnlVcmhzTVNx?=
 =?utf-8?B?ejViazNRMGp0YWpqNFByL1A3Umtxakx5ZFFRTVZVNWhLMG13WGRzWXRXc3pH?=
 =?utf-8?B?RHNBakVCMTRaemErVy9IUWE2SStGd3FmS0pTb1NRckJVMUplREVzd0tHRkRX?=
 =?utf-8?B?RzAxVlV0RE9QWWhBQnB3VEVXYTB0T01oUm5GUU5hTDF1c2trTWlCenRJa2lD?=
 =?utf-8?B?MHoxdWJ3cmZtd3ZvcXBua1BDUlhmeHQ5ZWRrSDlreEJQWWRCbzlPU1RHeGQ3?=
 =?utf-8?B?YzliblBNa2VVWUFIYThhNUgzWHhUSGpKYUFIU2lJbUJ5c0Rnc1MzQWM0M2xV?=
 =?utf-8?B?ZDR3aisrK2tHNXdJeXlabUxMcGJOZUxnOUMvUVZVdlBDQ0pJWVBqNG1NR2VF?=
 =?utf-8?B?Zk9rKzdhMXBaVVpEaVQzaVhrVFRCUnlncHBXN1Yzbkt0ZGRmT0taMUF4RUlI?=
 =?utf-8?B?QXZxeER6UjJjQ1NreVlreCtHeEFpa2VkMElTZmwxRFJtK1ZlYXhObmgzMk9s?=
 =?utf-8?B?Rkl6OXFVdzlDMUwwN05admxFWk5qWHpDbzNINmNzVy85bEFxcFlwMi91dWxp?=
 =?utf-8?B?Z3pyT0cyRzNlUzB4eW12OEtrS2ZaRzhrMlFXVjRibVpVaUs1VmlCRUY5TnZl?=
 =?utf-8?B?NXcxTFIvV2RvUVQ1TTFYQllQU0laVXhZRTUraldDcWM3cG1FYjdSZDkwSU55?=
 =?utf-8?B?d1FTUDhObi90KzZwemVySVFWWXBqcGZpVnNhL2c5TWhGUzA1dXBaQlNVNXk1?=
 =?utf-8?B?N1RXSnV3TGt3Yi8yQlI1cmtPNmpsZjhwMlNHZFpjcjM5aSsySW9acWZEMDcy?=
 =?utf-8?B?MHZzTzhJT1JHdmphSUxJeUZCa3VqTVQyN1ZUUk9RRDJWSTdPYS9Rb1pvT3Uz?=
 =?utf-8?B?Y2J0VDFPWXBkSWJVbndSYVhCSWpqQ3oxeFlORFY2THhtcW5PYWcrMU5iTHk3?=
 =?utf-8?B?aldIdmZ1N1V0NmFXRHAvTExHK1ZFeThWYlV6eVpYNWFEWlRjY2ZYK3FpRDd1?=
 =?utf-8?B?N201ZEhGNFNoSFNEajRFZ0c3NFFlZit4UzJhZG1XRks5dHFaWEh2dlZDNGJz?=
 =?utf-8?B?cXpHODhQT3pCZ3Vaank0dDFzN0hzYVFHbk5hODZGOXFxeExsQnFWdXR1MUZM?=
 =?utf-8?B?dlpOc292TlpQR2hXUlhNS3RjN1hYRlc2bEpCM2V4ZTcrSVNrWlZZZXZMZHM2?=
 =?utf-8?B?UVovUUxqWjhKVkhkSnZEQkFJb21ONWk1K1hVd3J4RTZSVnVIMnBOYVB4b0h4?=
 =?utf-8?B?M0hhTVQ0WTlzeHkyL1dWWFZzcE9mVWFxdkdkK29KckdiVjJHTzNaVHRhcnRJ?=
 =?utf-8?Q?RH5GlHcc/JfzOy6KIt7o7qtyOFBRg7K7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TElOdkt5MURjbkhuUDR1a3VoRXFQaEJnUzZMcTRCeVBXNW5kdGRJNHVZNDBV?=
 =?utf-8?B?cGc4NEFvbmFsL3hpeER1bEVYYU4wNkNlTEs5dFlybVdHSmxLV29wVzRLRW9H?=
 =?utf-8?B?NnhtQlllVUdsa05tb3VlYTQ5OVlSTVd0TE02K3M0a1AzMlBENExiKzh4RlpZ?=
 =?utf-8?B?WEVpVHZmUHI4VHdwbEplcDZWTHA4c1VMTFZlODI1a2xuZS93ek5DTHdGOHpK?=
 =?utf-8?B?OWMralQva2dneU9JRGx4bmZCNVlFTTU0S2ZjNHpCM0RraGxFd2FFeWc1ZkMw?=
 =?utf-8?B?NkIvbDJkMmlsb0FMWUJSUXFNc2xSR1B0eWlYMTQ4UjZuaWM0U0Fwb1kzTHEy?=
 =?utf-8?B?S0UwbWpyaWZGZmx3SWpOYnk2Q0ExWjdMNVNrODZjU3JKM0VqcmZzVk9JYStz?=
 =?utf-8?B?a0FhTEg3SGNtOVc2UUlJbFJQZ25sbktRT0Y4czNFZVZTbVBndkxCZURQQ1Jv?=
 =?utf-8?B?RGlxeEFXakExWnhuUVpkZUhVUHVKQVBWRnA2ZnpCV0xWbFlBLzQ2eWtNTm05?=
 =?utf-8?B?S3VXL3M1SU1FVUVWSWh1aS94enNuVTNCRHI1NXVXbEFQSEMzRmZPQ1plYjBl?=
 =?utf-8?B?VzcxUmFpdTRwczVCNDI1SlVPMnFleFh1VndydnptVC9idGp1VU94M3dRcmpE?=
 =?utf-8?B?RFRSeWV2Y05WM1kxWXFJYVNtd0EyelNOSDFUWFpUQ3pUOThiVUNJaGJKQ1Ez?=
 =?utf-8?B?S0g4QlJic2h4N2hFQWZPWUJQVlQrakJwYlloYjdhUEhMSVowUkFMcFdHS2Yr?=
 =?utf-8?B?SmExQWZVV2Y1alViR3JiMU5uR2RtQUxrS2FZd1V6VjlYTnQ0cEVOZTJMZFBR?=
 =?utf-8?B?cGtiakFWRzBDNWgvUDBBNjBGMys3eWF2am12blJ4blMxWUszNzY3blROS1Nx?=
 =?utf-8?B?ang1am9vNll0ZmM1NnoxL0ZpcEI4Nmd2VitoZ3pxK1NpN0FxWGE2MkVXN1Nm?=
 =?utf-8?B?VThST0RLRU9kemxtK2dWWXJzbXlrS3FHNTU0WVVKTDFHS2ZXU0JueERjQlBU?=
 =?utf-8?B?N1lzRkFCRUdFSzNmajVic2dPcWRXUHhiV3JtbEZtQUpRVmNaQ2JESm5OMXF2?=
 =?utf-8?B?V1BwblYvOW12Wk5Id0kzaVVNdDExVTBydUVaSVFFekRVQ2xJdUYxRWVaRGtX?=
 =?utf-8?B?aWM4QWZNeVRiWW1KL0YzUFQrd2ZsTHFwck02OVRxUXU0a0c5ZVBTQjRsWE82?=
 =?utf-8?B?NXJmY3RESlBqMmQ1RWdpdU5PVkFjelZJQU9DemJqVm1HVmNiREpCVnVjenJ6?=
 =?utf-8?B?Q2ZUUnArVzFBcHFTa3UyY21CVTlydWd2dzdVeG14cjM0aWwzMlFJTkJLQWFW?=
 =?utf-8?B?eU02bWZMQVRRQkZxaFhGM2tzTlpwQ3RtZ3pxNy81V2xyMkp5MjhmWjA4YzhR?=
 =?utf-8?B?UGszKzhleEdPTU1MZHJvTVpLR2FVeXB1Sm9ZdVBZNmp3aHdBdkVGOU0vc0VC?=
 =?utf-8?B?SmZsMUxDTmJ2SmhESlZ0VXpyc1pJRlhuMm5VSGVLMElxTmxSNXNTR1M1NHcr?=
 =?utf-8?B?ck9mLy96dXhDU0RSdXdML0NXSkRYU0tNR01kVGJ2RmljMHNXTWJaelpHRS95?=
 =?utf-8?B?ZEUzSEhUWmpMVXVFMnR2VHZSSFZHTU9pM3QrU2VXYkJCT2NyVHIrVjc2dUx4?=
 =?utf-8?B?QnljdTNUeVl0eXhzNUJhNzd0eGdQWGg2Y0ZOU3JlRE5nUGpuQVd6RWt4YW1M?=
 =?utf-8?B?Mk5UQnBZKzRzTnZxa0IrVFlyY095WW9lakVlaW5YcVh0VTYvSHl2NHIzNlBE?=
 =?utf-8?B?cyt6RlBwaUtZcGZZeDhBNTlRNS82Yi8yaFJyenY1NHVIbWJIbFVMZEh1bEtR?=
 =?utf-8?B?d2U1V1JIRHBBWFQrWUpVeWhjVFBoYU1QSTd6cFM4T2lndm1Jc25KbGNNcVgx?=
 =?utf-8?B?MVMwcVFldWNBOWxSYit3QW5JYThkQVZzY1ErK3BhdWxWOEE1L20yVEFXb0Q2?=
 =?utf-8?B?MGNlZTR0eGUzaHZzVDBOK2hkZThxNkNFQTJKVlIzbXcvQXVabTdrdE9LekJv?=
 =?utf-8?B?MTV2blBoOVk5MkhmS1pXOVliMlBMb1ZHVTlObmxwR2ptL3VwZWVaeER6WU5w?=
 =?utf-8?B?QTM3ZC9RWHRINmxxVnVhS1gzOHR0NlI5aktvUlBLQ1Mvcjk2WkVKdjA0Yk54?=
 =?utf-8?B?cmhDckxXMi9HdDJPbkR5TjI3NkpRcnZNeEROUUZ5L0dLK05HVE9meG1qS3ds?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49861ec3-c75e-472c-92c8-08ddffead788
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:30:26.1371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnvOkxVRNKPD6BlTW1/bO24+jZqzKp/6sT2Uzis24pQCumNVI/w3MzwL7YUrQ8iAje4HImfUs1w6kICV9blepw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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

On Tue, Sep 30, 2025 at 05:28:55AM +0200, Lis, Tomasz wrote:
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > Add kernel-doc to xe_guc_submit.c describing the submission path,
> > the per-queue single-threaded model with pause/resume, the driver shadow
> > state machine and lost-H2G replay, job timeout handling, recovery flows
> > (GT reset, PM resume, VF resume), and reclaim constraints.
> > 
> > v2:
> >   - Mirror tweaks for clarity
> >   - Add new doc to Xe rst files
> > v3:
> >   - Clarify global vs per-queue stop / start
> >   - Clarify VF resume flow
> >   - Add section for 'Waiters during VF resume'
> >   - Add section for 'Page-faulting queues during VF migration'
> >   - Add section for 'GuC-ID assignment'
> >   - Add section for 'Reference counting and final queue destruction'
> > v4:
> >   - s/VF resume/VF post migration recovery (Tomasz)
> > 
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   Documentation/gpu/xe/index.rst     |   1 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 282 +++++++++++++++++++++++++++++
> >   2 files changed, 283 insertions(+)
> > 
> > diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> > index 88b22fad880e..692c544b164c 100644
> > --- a/Documentation/gpu/xe/index.rst
> > +++ b/Documentation/gpu/xe/index.rst
> > @@ -28,3 +28,4 @@ DG2, etc is provided to prototype the driver.
> >      xe_device
> >      xe-drm-usage-stats.rst
> >      xe_configfs
> > +   xe_guc_submit
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 70306f902ba5..cd5e506527fe 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -46,6 +46,288 @@
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> > +/*
> > + * DOC: Overview
> > + *
> > + * The GuC submission backend is responsible for submitting GPU jobs to the GuC
> > + * firmware, assigning per-queue GuC IDs, tracking submission state via a
> > + * driver-side state machine, handling GuC-to-host (G2H) messages, tracking
> > + * outstanding jobs, managing job timeouts and queue teardown, and providing
> > + * recovery when GuC state is lost. It is built on top of the DRM scheduler
> > + * (drm_sched).
> > + *
> > + * GuC ID assignment:
> > + * ------------------
> > + * Each queue is assigned a unique GuC ID at queue init. The ID is used in all
> > + * H2G/G2H to identify the queue and remains reserved until final destruction,
> > + * when the GuC is known to hold no references to it.
> > + *
> > + * The backend maintains a reverse map GuC-ID -> queue to resolve targets for
> > + * G2H handlers and to iterate all queues when required (e.g., recovery). This
> > + * map is protected by submission_state.lock, a global (per-GT) lock. Lockless
> > + * lookups are acceptable in paths where the queue’s lifetime is otherwise
> > + * pinned and it cannot disappear underneath the operation (e.g., G2H handlers).
> > + *
> > + * Basic submission flow
> > + * ---------------------
> > + * Submission is driven by the DRM scheduler vfunc ->run_job(). The flow is:
> > + *
> > + * 1) Emit the job's ring instructions.
> > + * 2) Advance the LRC ring tail:
> > + *    - width == 1: simple memory write,
> > + *    - width  > 1: append a GuC workqueue (WQ) item.
> > + * 3) If the queue is unregistered, issue a register H2G for the context.
> > + * 4) Trigger execution via a scheduler enable or context submit command.
> > + * 5) Return the job's hardware fence to the DRM scheduler.
> > + *
> > + * Registration, scheduler enable, and submit commands are issued as host-to-GuC
> > + * (H2G) messages over the Command Transport (CT) layer, like all GuC
> > + * interactions.
> > + *
> > + * Completion path
> > + * ---------------
> > + * When the job's hardware fence signals, the DRM scheduler vfunc ->free_job()
> > + * is called; it drops the job's reference, typically freeing it.
> > + *
> > + * Control-plane messages:
> > + * -----------------------
> > + * GuC submission scheduler messages form the control plane for queue cleanup,
> > + * toggling runnability, and modifying queue properties (e.g., scheduler
> > + * priority, timeslice, preemption timeout). Messages are initiated via queue
> > + * vfuncs that append a control message to the queue. They are processed on the
> > + * same single-threaded DRM scheduler workqueue that runs ->run_job() and
> > + * ->free_job().
> > + *
> > + * Lockless model:
> > + * ---------------
> > + * ->run_job(), ->free_job(), and the message handlers execute as work items on
> > + * a single-threaded DRM scheduler workqueue. Per queue, this provides built-in
> > + * mutual exclusion: only one of these items can run at a time. As a result,
> > + * these paths are lockless with respect to per-queue state tracking. (Global
> > + * or cross-queue data structures still use their own synchronization.)
> > + *
> > + * Stopping / starting:
> > + * --------------------
> > + * The submission backend supports two scopes of quiesce control:
> > + *
> > + *  - Per-queue stop/start:
> > + *    The single-threaded DRM scheduler workqueue for a specific queue can be
> > + *    stopped and started dynamically. Stopping synchronously quiesces that
> > + *    queue's worker (lets any in-flight item finish and prevents new items from
> > + *    starting), yielding a stable snapshot while an external operation (e.g.,
> > + *    job timeout handling) inspects/updates state and performs any required
> > + *    fixups. While stopped, no submission, message, or ->free_job() work runs
> > + *    for that queue. When the operation completes, the queue is started; any
> > + *    pending items are then processed in order on the same worker. Other queues
> > + *    continue to run unaffected.
> > + *
> > + *  - Global (per-GT) stop/start:
> > + *    Implemented on top of the per-queue stop/start primitive: the driver
> > + *    stops (or starts) each queue on the GT to obtain a device-wide stable
> > + *    snapshot. This is used by coordinated recovery flows (GT reset, PM resume,
> > + *    VF post migration recovery). Queues created while the global stop is in
> > + *    effect (i.e., future queues) initialize in the stopped state and remain
> > + *    stopped until the global start. After recovery fixups are complete, a
> > + *    global start iterates queues to start all eligible ones and resumes normal
> > + *    submission.
> > + *
> > + * State machine:
> > + * --------------
> > + * The submission state machine is the driver's shadow of the GuC-visible queue
> > + * state (e.g., registered, runnable, scheduler properties). It tracks the
> > + * transitions we intend to make (issued as H2G commands), marking them pending
> > + * until acknowledged via G2H or otherwise observed as applied. It also records
> > + * the origin of each transition (->run_job(), timeout handler, explicit control
> > + * message, etc.).
> > + *
> > + * Because H2G commands and/or GuC submission state can be lost across GT reset,
> > + * PM resume, or VF post migration recovery, this bookkeeping lets recovery
> > + * decide which operations to replay, which to elide, and which need fixups,
> > + * restoring a consistent queue state without additional per-queue locks.
> > + *
> > + * Job timeouts:
> > + * -------------
> > + * To prevent jobs from running indefinitely and violating dma-fence signaling
> > + * rules, the DRM scheduler tracks how long each job has been running. If a
> > + * threshold is exceeded, it calls ->timeout_job().
> > + *
> > + * ->timeout_job() stops the queue, samples the LRC context timestamps to
> > + * confirm the job actually started and has exceeded the allowed runtime, and
> > + * then, if confirmed, signals all pending jobs' fences and initiates queue
> > + * teardown. Finally, the queue is started.
> > + *
> > + * Job timeout handling runs on a per-GT, single-threaded recovery workqueue
> > + * that is shared with other recovery paths (e.g., GT reset handling, VF
> > + * resume). This guarantees only one recovery action executes at a time.
> > + *
> > + * Queue teardown:
> > + * ---------------
> > + * Teardown can be triggered by: (1) userspace closing the queue; (2) a G2H
> > + * queue-reset notification; (3) a G2H memory_cat_error for the queue; or (4)
> > + * in-flight jobs detected on the queue during GT reset.
> > + *
> > + * In all cases teardown is driven via the timeout path by setting the queue's
> > + * DRM scheduler timeout to zero, forcing an immediate ->timeout_job() pass.
> > + *
> > + * Reference counting and final queue destruction:
> > + * -----------------------------------------------
> > + * Jobs reference-count the queue; queues hold a reference to the VM. When a
> > + * queue's reference count reaches zero (e.g., all jobs are freed and the
> > + * userspace handle is closed), the queue is not destroyed immediately because
> > + * the GuC may still reference its state.
> > + *
> > + * Instead, a control-plane cleanup message is appended to remove GuC-side
> > + * references (e.g., disable runnability, deregister). Once the final G2H
> > + * confirming that GuC no longer references the queue is eligible for
> > + * destruction.
> > + *
> > + * To avoid freeing the queue from within its own DRM scheduler workqueue (which
> > + * would risk use-after-free), the actual destruction is deferred to a separate
> > + * work item queued on a dedicated destruction workqueue.
> > + *
> > + * GT resets:
> > + * ----------
> > + * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
> > + * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
> > + * as follows:
> > + *
> > + * 1) Quiesce:
> > + *    - Stop all queues (global submission stop). Per-queue workers finish any
> > + *      in-flight item and then stop; newly created queues during the window
> > + *      initialize in the stopped state.
> > + *    - Abort any waits on CT/G2H to avoid deadlock.
> > + *
> > + * 2) Sanitize driver shadow state:
> > + *    - For each queue, clear GuC-derived bits in the submission state machine
> > + *      (e.g., registered/enabled) and mark in-flight H2G transitions as lost.
> > + *    - Convert/flush any side effects of lost H2G.
> > + *
> > + * 3) Decide teardown vs. replay:
> > + *    - If a queue's LRC seqno indicates that a job started but did not
> > + *      complete, initiate teardown for that queue via the timeout path.
> > + *    - If no job started, keep the queue for replay.
> > + *
> > + * 4) Resume:
> > + *    - Start remaining queues; resubmit pending jobs.
> > + *    - Queues marked for teardown remain stopped/destroyed.
> > + *
> > + * The entire sequence runs on the per-GT single-threaded recovery worker,
> > + * ensuring only one recovery action executes at a time; a runtime PM reference
> > + * is held for the duration.
> > + *
> > + * PM resume:
> > + * ----------
> > + * PM resume assumes all GuC state is lost (the device may have been powered
> > + * down). It reuses the GT reset recovery path, but executes in the context of
> > + * the caller that wakes the device (runtime PM or system resume).
> > + *
> > + * Suspend entry:
> > + *  - Control-plane message work is quiesced; state toggles that require an
> > + *    active device are not enqueued while suspended.
> > + *  - Per-queue scheduler workers are stopped before the device is allowed to
> > + *    suspend.
> > + *  - Barring driver bugs, no queues should have in-flight jobs at
> > + *    suspend/resume..
> > + *
> > + * On resume, run the GT reset recovery flow and then start eligible queues.
> > + *
> > + * Runtime PM and state-change ordering:
> > + * -------------------------------------
> > + * Runtime/system PM transitions must not race with per-queue submission and
> > + * state updates.
> > + *
> > + * Execution contexts and RPM sources:
> > + *  - Scheduler callbacks (->run_job(), ->free_job(), ->timeout_job()):
> > + *    executed with an active RPM ref held by the in-flight job.
> > + *  - Control-plane message work:
> > + *    enqueued from IOCTL paths that already hold an RPM ref; the message path
> > + *    itself does not get/put RPM. State toggles are only issued while active.
> > + *    During suspend entry, message work is quiesced and no new toggles are
> > + *    enqueued until after resume.
> > + *  - G2H handlers:
> > + *    dispatched with an RPM ref guaranteed by the CT layer.
> > + *  - Recovery phases (GT reset/VF post migration recovery):
> > + *    explicitly get/put an RPM ref for their duration on the per-GT recovery
> > + *    worker.
> > + *
> > + * Consequence:
> > + *  - All submission/state mutations run with an RPM reference. The PM core
> > + *    cannot enter suspend while these updates are in progress, and resume is
> > + *    complete before updates execute. This prevents PM state changes from
> > + *    racing with queue state changes.
> > + *
> > + * VF post migration recovery:
> > + * ---------------------------
> > + * VF post migration recovery resembles a GT reset, but GuC submission state is
> > + * expected to persist across migration; in-flight H2G commands may be lost
> 
> I don't think H2Gs can be lost. GuC is expected to either finish or not read
> them, and
> 
> after recovery they can be all executed. They only require GGTT fixups.
> 
> It is our decision that we scrap them, then re-assess and re-issue the
> commands by manipulating
> 
> states of entities which issued them. Maybe:
> 
> ---
> 
> expected to persist across migration; GGTT base/offsets may change,
> requiring update of all references to it, including in CTBs, LRCs, and on
> rings.
> 
> For a wider view on that, see `VF restore procedure in PF KMD and VF
> KMD`_.Recovery proceeds as follows:
> 

Sure.

Matt

> ---
> 
> -Tomasz
> 
> > , and
> > + * GGTT base/offsets may change. Recovery proceeds as follows:
> > + *
> > + * 1) Quiesce:
> > + *    - Stop all queues and abort waits (as with GT reset) to obtain a stable
> > + *      snapshot.
> > + *    - Queues created while VF post migration recovery is in-flight initialize
> > + *      in the stopped state.
> > + *
> > + * 2) Treat H2G as lost and prepare in-place resubmission (GuC/CT down):
> > + *    - Treat in-flight H2G (enable/disable, etc.) as dropped; update shadow
> > + *      bits to a safe baseline and tag the ops as "needs replay".
> > + *    - Quarantine device-visible submission state: set the GuC-visible LRC ring
> > + *      tail equal to the head (and, for WQ-based submission, set the WQ
> > + *      descriptor head == tail) so that when the GuC comes up it will not process
> > + *      any entries that were built with stale GGTT addresses.
> > + *    - Reset the software ring tail to the original value captured at the
> > + *      submission of the oldest pending job, so the write pointer sits exactly
> > + *      where that job was originally emitted.
> > + *
> > + * 3) Replay and resubmit once GuC/CT is live:
> > + *    - VF post migration recovery invokes ->run_job() for pending jobs;
> > + *      ->emit_job() overwrites ring instructions in place, fixes GGTT fields,
> > + *      then advances the LRC tail (and WQ descriptor for width > 1). Required
> > + *      submission H2G(s) are reissued and fresh WQ entries are written.
> > + *    - Queue lost control-plane operations (scheduling-state toggles, cleanup)
> > + *      in order via the message path.
> > + *    - Start the queues to process the queued control-plane operations and run
> > + *      the resubmitted jobs.
> > + *
> > + * The goal is to preserve both job and queue state; no teardown is performed
> > + * in this flow. The sequence runs on the per-GT single-threaded recovery
> > + * worker with a held runtime PM reference.
> > + *
> > + * Waiters during VF post migration recovery
> > + * -----------------------------------------
> > + * The submission backend frequently uses wait_event_timeout() to wait on
> > + * GuC-driven conditions. Across VF migration/recovery two issues arise:
> > + * 1) The timeout does not account for migration downtime and may expire
> > + *    prematurely, triggering undesired actions (e.g., GT reset, prematurely
> > + *    signaling a fence).
> > + * 2) Some waits target GuC work that cannot complete until VF recovery
> > + *    finishes; these typically sit on the queue-stopping path.
> > + *
> > + * To handle this, all waiters must atomically test the "GuC down / VF-recovery
> > + * in progress" condition (e.g., VF_RESFIX_BLOCKED) both before sleeping and
> > + * after wakeup. The flag is coherent with VF migration: vCPUs observe it
> > + * immediately on unhalt, and it is cleared only after the GuC/CT is live again.
> > + * If set, the waiter must either (a) abort the wait without side effects, or
> > + * (b) re-arm the wait with a fresh timeout once the GuC/CT is live. Timeouts
> > + * that occur while GuC/CT are down are non-fatal—the VF-recovery path will
> > + * rebuild state—and must not trigger recovery or teardown.
> > + *
> > + * Relation to reclaim:
> > + * --------------------
> > + * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
> > + * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
> > + * message handling, and all recovery paths) lies on the reclaim path and must
> > + * be reclaim-safe.
> > + *
> > + * Practical implications:
> > + * - No memory allocations in these paths (avoid any allocation that could
> > + *   recurse into reclaim or sleep).
> > + * - The global submission-state lock may be taken from reclaim-tainted contexts
> > + *   (timeout/recovery). Any path that acquires it (including queue init/destroy)
> > + *   must not allocate or take locks that can recurse into reclaim while holding
> > + *   it; keep the critical section to state/xarray updates.
> > + */
> > +
> >   static struct xe_guc *
> >   exec_queue_to_guc(struct xe_exec_queue *q)
> >   {
