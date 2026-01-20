Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30BCD262A2
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 21:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE0610E1C1;
	Tue, 20 Jan 2026 21:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGRDPQPN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC84F10E1A7
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768944474; x=1800480474;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0DPG6GlrhsCwZPW1UJ+Mf68d7eYj/59YacZVnWIbCX0=;
 b=dGRDPQPNvXHoBdXoJDQjurOMlWhuaGeOQrBFPVmbnRos6XMtL9LlPKg5
 3tZ8C5yBpXzlVjzPwHFlTWLhWcGN+8ksO9R4CSI/Gc+Ucpp9h+5NcORLt
 L97hmBIJn2dRh89mZQa1wxuMxMidu/MZUa+IWhBH9pacanbs5ZihPxu3w
 YxaO83DiOvsYO8X7MFZjmgyAA1QhsaynLwqAcqiFHgsm0xPqbmZLwIzAT
 vlqSF2DIPPNpY6rq4Zw4mOWiEn/oADxYi/CZnQ/CS4m2AcsMG6JIt6bJT
 VD0abE5ujbv7KHaNxLTtXEvnLBo9qmj8eq/TiHvZMIy19NPMDEEUI/85R Q==;
X-CSE-ConnectionGUID: JWnyxxyPTjuw9MSGnZF+6A==
X-CSE-MsgGUID: C55XJp3dTgab478wRvBe3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92832849"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="92832849"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:27:54 -0800
X-CSE-ConnectionGUID: Hf3gXRvzTXO2UX5UOG6BhA==
X-CSE-MsgGUID: fpMhar1SQc+tsPHEl/rTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210735394"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:27:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:27:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:27:52 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:27:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxhiTsi1pfLJdTK9K2T7KseUOIxT8LgapwQSHgJsryUqgIkvTMycREwO1sOak0aDxEUevIfgZuFE27ENq4cyacmQRPPW1AEEhcrow22R//W7LF/ohNPEkReVV8JNCa9lCbB0BT9/Ev26KkQv/D+DIGj/1RdFCAosBJszgVKtID5fWUve/soGyPi1OdlOUBWdEGI7ZqbbHHFedL1QQJZ8S9tWpuUVAUs1EaAF0KgrdNIPNV+UBU2fcxyUzPDGuCj7NTI177A5KWu+8iecMb+fromSD/q8tKcP5Q2eDjEeijYQsbyLnaJG5195mNUCHp+7l3/aAAs3JUm8pyTcfj/r6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axzgX08inAEZkNyJ3J1PPFmKDSecpIHfG/+4UmW+sNo=;
 b=JTUndieCgfNJIobWt02Vm4A2DAWiqxpp0HKJeV0YvtrFzTi+s1lH23L76g980ce71IGB/ZI8+1/nRZsPZ5TpBRJQhI9yTztsmidmG/uw+1DJP7xU1fakn2IiyNKiOtFk0l5OTD8PBuaZkcnsiFO+Q8cLpBNdVHPbXqD1xCvxP2iNEXLz4Emj7FF3x0VZQAqoHTjsuyYFiwFEMAofAuOBB6B+0hGQaT02IzOCZkDmWTzk6wG/sD8/Nnwaav5gkreBQtIh4tMW5h8T9UKf7nNKHyUMeSTQwsnk1k4294m0EEWE5VK+zFHsnrA3CQgWSn2v/OznoaCjpuI0Oopu24F2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 21:27:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 21:27:50 +0000
Date: Tue, 20 Jan 2026 13:27:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <intel-xe@lists.freedesktop.org>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aW/zU4PxJc5fEUjL@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <e8cf019c-409b-4e17-ae80-8b95e51e366a@intel.com>
 <aW/y6TuuD07vtmgO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW/y6TuuD07vtmgO@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: c9739c74-4a7c-476c-f16d-08de586ac339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1NCUjJCRzdJNkpjSGNxTXd4MVlkY3ZzU3A5US9sb2Z2SXhwZmUwZ051ME04?=
 =?utf-8?B?RmwrVkVvNXZIZ3JxM3ZSRXQyMkltU0hQVlZsdUVHNHVSZFczWlZueHhSU2NO?=
 =?utf-8?B?TmpDWGRVS25JZFhWbk5VL0lYaUNHMU5LZDRqRWFZMzVpL1g2ZS9MMHZNQjln?=
 =?utf-8?B?TXlQdGdlakU0OUR0b2V0d3QwRFZHcmxZK211Ni9pOGdBZEQ2QlVIdHg4dHN5?=
 =?utf-8?B?a1E0czRsTmhDRTNicDVKUitXNzNtUGNlYjhpVCt4Y3RFSlVCRmRyRm1sWTcv?=
 =?utf-8?B?NUxYUjMvdUswS3VwaEREUyt1Y3ZVbmZ5ckNXR3djbzhSQ3l3TFVPR1Mxc1Bi?=
 =?utf-8?B?Qm9idCtNditOWDAvdEd0YlAwOVdwZmVtRzR4RlUyNHk1dnVjVmxGWSt6cXdE?=
 =?utf-8?B?eDNjU1d4WlZjWUp4ejFoYW1HVmdPTlAyeUthR0lDc3M3YVZORDlDc1p3dytO?=
 =?utf-8?B?ZUh1bmJuSEhJSW0zL2dUNkl6NU82cnRONGVmcHRtdEc0NS8xNDhScmdkUDNX?=
 =?utf-8?B?L0JCTTJVd0d4QnRFTzQ4N3VvQmVSZnpEM1libnR4dU9OR3lvM29xQmVPWCtB?=
 =?utf-8?B?QWQwUG5EaUNrRlBFSkpUdVNDRFJBM2VSZkI3ai9mdktGRE5WdStvNExPSzE4?=
 =?utf-8?B?bTNjN2Jna2RqWFpNZS9TVU1rMGRqZ3UvOWFoNDlPbkFtdTFEY05nbkx4bXpY?=
 =?utf-8?B?MGZDcmtvdjZpbXVjMXRsaGtaL1RrYUhiOWhYbU5HNUJFK0paVXFIVWV6c1pi?=
 =?utf-8?B?MEF4UDEydXZZZU04Z0VZZy93dmcraHBwV2g3M25BK1RkdG5ENDZwK0E4U04x?=
 =?utf-8?B?elIrQnAxMkVIUlVDT2VkZXpqa0tDSjAvdnhjNVNoTmtiNFgrUHZFQ29GMStr?=
 =?utf-8?B?NXFSY0FNUUFUN1hGV2JOTFVSL1NoQ1llb2t3MEk2YjE0YW1OaVlCMkM0bXVZ?=
 =?utf-8?B?bDhRVmR2UDhLdkhLRHVxMm9DbXJaWVhlSk1GNUx1cnk1bmJZRktVQjlXYWhK?=
 =?utf-8?B?ZnRobTVzZGFqVXltdHJlNHlxN05sYnVaUUtTWEdodmVBVnVwSDQ5RGRTTzZ6?=
 =?utf-8?B?cy9EbHpHSlY3U1VxdGdVSHZXaFhyN1J5LzllZU5oTFQvVEVTVFlTN2FjVnlP?=
 =?utf-8?B?Y3duc25xa0lRTkk5dFhwd1lkRUptSWYrWEFlclh1WjFpMXY5VkkxdjVsTVRU?=
 =?utf-8?B?WFdCSlFqRjNjQ015TGlOaXN2N1g1OFZuaEdmZVNUOEp6OFVjTE05OHhoREN0?=
 =?utf-8?B?N2VZS1B5aGlZTkUxM29ZcVBOenFtY1AxUTViTmdDVmdoa0svbEg5bXh2VEFs?=
 =?utf-8?B?R2ZBV29CL0pDeVA4ZG9QU0ZQWEo1UjNCYjQ4ZGVDN1BVaWRmZUFaVWpIY25i?=
 =?utf-8?B?OVpBTUVCWU1aZHhGZVVWSHFocEx4MFNMeTVjdis0SzVvdlZOK2E5OFVEdDJz?=
 =?utf-8?B?K1Y5Y2RZVk9PUFdFTWFlUHl1S0pFRWRJUzVqTjhaay96Smt0K2ZqaGZxM00z?=
 =?utf-8?B?SWxZSVEyK0FNbmdrM05iMkFOVHFJaTF6YUJmMWJCR1R6NEJPWWs3VGswS0FH?=
 =?utf-8?B?Wm9TTk9TM0dseHVpLy96UEorcU1JZ21BWkkwNGZMVDBDVW5lV2NlK3IySDRp?=
 =?utf-8?B?ak83ekU3UFQ4TUF5alJ2a0hvUVV2dmFGL2luMFREWnlNaXNKYW11S1VtLzNM?=
 =?utf-8?B?amZSNnhFK25JeUprRGZtd1FhZ2lzTExxUVZ6ZkNIdVdaTnU5MzMxMW85aEYy?=
 =?utf-8?B?MVZhaGE0aUZNV1A3Z0FpMTR6amhwQmZkZklBbWJiYk5XbitGRzhoa0UzVTN4?=
 =?utf-8?B?ajRlQWRKaUIyaFJYSDlUZ2Y2eHpZMmkxRGsxeW9BRGJHV1ZaNktySHNNRHpW?=
 =?utf-8?B?anNLZWdkSThyRWN2ampHWW53aEMxZFNSMThObWJlWnVtclIxOXFtU21FdlVj?=
 =?utf-8?B?TjVrWEpyOUFxTEVoa3dOWW8rU3AvWGcrbnEwb3hQeWdLaGVGY0cyS2pqdzFI?=
 =?utf-8?B?b0RISXlJbDdDS3dzVVVkbmdrajRmblZOclowZTU5Q2ZpTUs2ZGpEbkdvQS8z?=
 =?utf-8?B?U2NCR0hxVXB0dzJ1ME5NNzJqZ3RGVmRvTkI4OUw3S0gxK2w4enVaS0FjZ0wx?=
 =?utf-8?Q?Y11M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0FRa3NNOTY2dHJ3WUU1MkFmaGZYZnlhNFdJaDRXMy9rOWw2dCtPUzdpVFdx?=
 =?utf-8?B?eDBLa0xCR2R6VjhncW4yclBVKzRyZHI1aDBCL2RPV0w5ODdMaG1vczZ6bTYz?=
 =?utf-8?B?MWVQZUdRZDFrbnliMUZCOVNkNzlaMXNkYityUzAyay9XMG1PVVlXUnkxN293?=
 =?utf-8?B?bEkzN24wWHBVdVlNWFFaM2hwbDQ5VE5MSzhxNHg3Nis3NGEzRW10eFBVdGU5?=
 =?utf-8?B?TzhEMVFxWUgrQU1NSDRXWmdVYmFibWtqQTBKQm94MWdkb3BKZlVTK3ZiNi9T?=
 =?utf-8?B?TTJRT1g1M2VCZHd0STBYai9wQkFlVGUwUVFKbk9JaS9sNnQ4bFdPZ05UbWph?=
 =?utf-8?B?YzhGRHlwU2RpUENWdHkxQ1lKOXNWZ01HZ3hLMzFKTHhnT25kMDByWVprVGRs?=
 =?utf-8?B?elhvSDBLT2dqaVlqZzVEMERVVWlDa3BrekFFVU5PNGIxRXhDdkdobVYrb0w2?=
 =?utf-8?B?dVkvSDM4RGU0NUp4UWNoL2pDY3dCMlNYbTF4WUlVNTJ2UTY2RmpOa2hGS0xW?=
 =?utf-8?B?ZGttZkJNaW50K3Q1OUV1NGtOeGd4TFJFNzhwVFlVT3FNUkdRaGJqcDJSZTJx?=
 =?utf-8?B?SlBhV2IvWXFkRmQvR0MwbnlVZjZRZjNLTnUvaVFnQlFBUjc4ZFN1YmtBV2FN?=
 =?utf-8?B?S0xPVk9mQ29aZDRRcElXb2xZcEtFY3pRd1Q0L3dKd3lwbEZ5NEpWblJsNXlB?=
 =?utf-8?B?a3lLMWhLV0pwclBFVjFZQmJLc0xZLzY0N2tNKys2S290S2RXZi91byt0SEgw?=
 =?utf-8?B?dUNxRnRWS0lNTExDbjcrdkZmYk9aVktuQ3ZocitobC9aV1I4Z2dGRXZEK0hC?=
 =?utf-8?B?UHorUHZNYTc1NkJ5amcxeUs3ZmF2VlJCcEdZNk9DNzlVMFpkakVaUlVKVDBO?=
 =?utf-8?B?TG1SYUlROXBscCt6Z0dIVjVET0ljcW1zU1EvTWs3VlFhV1lYT1J5d2daUFQy?=
 =?utf-8?B?NzJQT2MvMnIxUS9UNnk2dXVNRE5OWXAzOGd1ejBzMklnNExOelpQMUJGdThy?=
 =?utf-8?B?Y01YQ3BoUGl0UmF6bE1YK2owUHZCbkZXbTFONmJlYXF3QjBIVDFQWFhPaUlr?=
 =?utf-8?B?MUZ5QUlpNXZ0QndxQ1VtcEgvZzJBV0dPd0sySW1aYW0wMXlNNXd5dmdOV25a?=
 =?utf-8?B?UDdJcHV0ZzhZR0xhWC9SV3A4WVVOSnNLbitlTkl5cE5WNTRBRytqTGN4d0I4?=
 =?utf-8?B?VTVLNGdvVS9RVy9QWk54a05BSDl6Q0NIMUhQOXQrbm9kcE1yc1RxYkF0MXVH?=
 =?utf-8?B?RlQwL1BmbE9NOFFCQnFGUmY1cHB4R2k0VmFRTDEwS1pjVmtDbEt0YVpXVWZo?=
 =?utf-8?B?YWZheWR1RTYvd3V6bWJid2NKeENRZExReXRDUlEvWlNBYjFzMnZvajhTUVd4?=
 =?utf-8?B?RzlQbCtjTnhUM0dNbzk1allrWXRrK1pQbHRkcTRmQS9EK3J6eGdhdUJoREpR?=
 =?utf-8?B?bG9BUmhVUy9wblhSOFBnVFVQcXNuUkZBdTFtelUzbGZ2V2piWmtDdmFCK1Er?=
 =?utf-8?B?NWJpVHVXQXp4cHZSMjhwYzNaSFVIS3dkWlBQQ3hSRlNiM3FXaEFBK0ZEZkV2?=
 =?utf-8?B?R0JRSUNyS2tMK0JKNHpFL25ZTDhPc2V2ek0zOWJ6ZEZwNC9Sa2tDRnVCMWRW?=
 =?utf-8?B?Y01oRU1wV3V5ZVlVZDRMcnVKZnhOaFNJcExwbnF4Q3BQVisxeDVOYW9jQjhh?=
 =?utf-8?B?MTZ4ZDRIYzc3S2Z6UGc3UFNtVGd0aHl1RndUd0R5dkQwbUk5U0M2dWp6ZXla?=
 =?utf-8?B?Lys5cUFCVCtsODA4VS9TYjVqQmFXTFA2Yk1NVlBuTFYraTZSU3ZyVkRKcERl?=
 =?utf-8?B?ZlhYUDJmNHVLVmpBU1dGcVYwbXo2ZzRLWXlQaTB3azJzZXZSN1EzK0NpS1lE?=
 =?utf-8?B?ZDNqTzVWVWZjbldlYUwwQW80cktXSFFtY1ZlOTBkTzdra3hjeTMvR2RRYWh5?=
 =?utf-8?B?ZFoydW90RG5sTEtDTysxQ2xhaGZjSzJwM1N0YVBPL3RlRzZhMk9SeFpFbXBi?=
 =?utf-8?B?Q2p5a3Voc0dPUUs2YnlCTVBlNUs2TlE3dDBYaUg5MHBzdkYzVFpWK2VwdUZ0?=
 =?utf-8?B?YVpETldTZkV1ZnZad01VSmlYNGFNdzFlZGl5YlI3WERHNGM3SGJPMzY0bjh3?=
 =?utf-8?B?YmVpT1ZkV1RKS3dDMzFOUFpneWNQV2NvMmdXTVBNOG1PUDRGY3ZyMzRSWHB6?=
 =?utf-8?B?bldIdjl1ZjB5RlZTTk9RRDF0VmMwVXFDNFA0QkQ5ZmFvUWpaOGFMY2k2OEky?=
 =?utf-8?B?ckp4VCtWajVwL2U0WWZKY3VkcHBzSHlqTVdFMWIweXhTU3NhRUtLMFhsREd0?=
 =?utf-8?B?aFFvcGI2UnZWdUs3UDJ2YU9QK3dVUkNubXpXY1JoNzlNVHcxOGtLMkNYdzF6?=
 =?utf-8?Q?1eGfUx4F82jO1Q0k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9739c74-4a7c-476c-f16d-08de586ac339
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:27:49.9378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Slon9v3T1+4Y5C9MJFem2Hnxb8ABBxa3JWPSh7O3d6OUqQFMXmUEy7hBLxIzp+4he6TMRZwDt3vs6Vp4Zm4Hag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
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

On Tue, Jan 20, 2026 at 01:26:01PM -0800, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 01:10:20PM -0800, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 1/19/2026 4:01 AM, Zbigniew Kempczyński wrote:
> > > On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
> > > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> > > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > > > If a batch buffer is complete, it makes little sense to preempt the
> > > > > > fence signaling instructions in the ring, as the largest portion of the
> > > > > > work (the batch buffer) is already done and fence signaling consists of
> > > > > > only a few instructions. If these instructions are preempted, the GuC
> > > > > > would need to perform a context switch just to signal the fence, which
> > > > > > is costly and delays fence signaling. Avoid this scenario by disabling
> > > > > > preemption immediately after the BB start instruction and re-enabling it
> > > > > > after executing the fence signaling instructions.
> > > > > > 
> > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >   drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > > >   1 file changed, 9 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > +	/* Don't preempt fence signaling */
> > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > +
> > > > > >   	if (job->user_fence.used) {
> > > > > >   		i = emit_flush_dw(dw, i);
> > > > > >   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > +	/* Don't preempt fence signaling */
> > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > +
> > > > > >   	if (job->user_fence.used) {
> > > > > >   		i = emit_flush_dw(dw, i);
> > > > > >   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > +	/* Don't preempt fence signaling */
> > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > +
> > > > > IGT tests which calls compute-walker, then bbe are asynchronous (don't
> > > > > wait for completion, pipe-control is necessary to wait on
> > > > > compute-walker).
> > > > > 
> > > > This asynchronous behavior may explain things. Is this a common use
> > > > case?
> > > Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> > > not doing this relying on kmd.
> > > 
> > > > Also do you know if render engines have similar asynchronous behaviors
> > > > or is this specific to compute engines?
> > > I don't know, I think Mesa folks may know the answer.
> > > 
> > > > Lastly, the i915 disables preemption on both render / compute engines
> > > > immediately after the BB before emitting the pipe control. Is this async
> > > > behavior a new few feature in Xe2 parts which only the Xe driver
> > > > supports? This might explain why the i915 works and Xe does not.
> > > Test exercises WMTP and this is supported starting at Xe2+. Probably
> > > what test is doing has a meaning in this case. First compute-walker
> > > submits kernel which loops until it will observe some memory write.
> > > Second job executes compute-walker with kernel which does some quick job.
> > > But first occupies all EU's so second job can be preempted only when
> > > preemption occurs and SIP will be executed. So if we disable preemption
> > > immediately we submit compute-walker I think we have no change to enter
> > > SIP and switch. Even if I add pipe-control to batch level according
> > > to Daniele comment job it is still preemptable and we move pipe-control
> > > location from kmd -> batch level..
> > 
> > So basically the test requires a preemption but does not put any preemption
> > points within the batch? I'd argue that the fact that the test works at all
> > is by chance, because the kernel just happens to add a preemption point
> > after the BB and the batch doesn't wait for the results before completing.
> > IMO it should be ok to go ahead with this patch and rework the test, but we
> > probably need an ack from a maintainer because something that worked before
> 
> So my reply to Zbigniew. I'd like to know if this test works with pipe
> controls in the batch.
> 
> Then I believe we need to confirm:
> 
>  - Compute runtime inserts pipe controls in the batch
>  - Get extensive CI runs of compute runtime, Mesa, and application 
> 
> As long as we haven't regressed anything, we should be good to merge
> this behavior change.
> 
> If not, then we stuck with the existing behavior but perhaps could add
> an opt-in exec queue flag to create the behavior.
> 

Typo:

s/create/change

Matt

> Matt
> 
> > (even if just by chance) is not going to work anymore.
> > 
> > Daniele
> > 
> > > 
> > > --
> > > Zbigniew
> > > 
> > > > Matt
> > > > 
> > > > > May you try to put arb disable after emit_render_cache_flush?
> > > > > 
> > > > > --
> > > > > Zbigniew
> > > > > 
> > > > > >   	i = emit_render_cache_flush(job, dw, i);
> > > > > >   	if (job->user_fence.used)
> > > > > > -- 
> > > > > > 2.34.1
> > > > > > 
> > 
