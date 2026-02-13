Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AA8EF48F6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A593610E7BC;
	Fri, 13 Feb 2026 09:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daANIU4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BA010E7BC
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770973648; x=1802509648;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Sk9KbeVxizLl2rF5zpsG+AcVlNbADeTler5M/lFlBQ8=;
 b=daANIU4ZAJek+8vmMNGS54sy1Zez2ZuG9m5aNAktKSCi4jLlK4hrR+Cb
 tXAbmUgeBH8NlSCokSZhb/rl8v9huRDHPOihZZWPT8rxXm01RIipAMrCT
 wyPyjLmUrT6gV0I6w+iER2og3rgVFQ2ZjJZMbd+8mxLC/1rdIQLAXeR9g
 a4Ov+85izweQ2TLd9m6Kr//OOsHo9H592s5Uxn/IxNVcHKX4rxCiFXcLX
 L8vgXzL3W2DNAWxF5RIOdl5H2LlYFqn3eY8TBdn+aNCoxsK6YSYturHe4
 S+i4SFJu57nUCkb5jt1W9iZKqmnT37V0TITQyD0NFOdX2lM8Hm8XSPOBV Q==;
X-CSE-ConnectionGUID: PPRUXRisRqKTej/0fL3wqA==
X-CSE-MsgGUID: Jbx583HPRSezDSdIU5dRXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89567655"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="89567655"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:07:24 -0800
X-CSE-ConnectionGUID: jbpUS+7eRPa2LvGPg+2k4Q==
X-CSE-MsgGUID: Bozdh/lAR0eJcKLfksgwtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211965673"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:07:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 01:07:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 01:07:23 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 01:07:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHIbtcYT/iW9C9JmnkWKAiKSW9k3wbTgyeIgVVeGhff96reoKZRerLvpYp+LfEra+4shrkT0gSd5gJmlAoD6YORaxJYyXOXAipljtYzLe2GXq6qKg3/FXRWF57gXoBuJJsrJE3/bvE4EvjmDGRXbLahOk9CqOjqxNWtGz3wbpw0agqapEUcaVSK4Lej7oiEElIy1L1q6B59ChAo5S+JFWz0dmc9ogzUkzP49VhZaweFy/FL0o26eUP66065bUQbXW3rNKwNNgHx1/7DfcFkHXS6NcTPKVSWQDmxmhhSzNpVt2L3luy3fjH/3Lyj55TrPjVuBqbXJF2OL0TTEgE7ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s71HEfC6loZpAvPUuDzPAH2t/DXP6pR8U/mjdVWvIXM=;
 b=ebiHbikzEQ+/ZKygshyiEgCMlXq3keKqroNASfjStZc6PrwhqfwS2xM+8tresXWj7MAEqqMoGVjOYVnVUBnbxel98l+PDIrgqfKl5K52L0G7gkGULTqfD5mlTzSYbbN2/4f6ExYeBbg5m5419/q6OpWrXLj1LiQppP3n1NstQxsQ5GPkVWvP2pUECag2uZRb1/mzPzju8vrYvlcBNkK8OHRBlzL3xGj4yt9pCSHppxNEk1fEbrbdiFHcS/IaJqiJKXAOMOwKD6YI3NoL0+Qqpeu/wv/1c1YzfRKTv/Gr/ov1ruHbG/QOsAp10atIUfxChjBqUmYsfZz8u5IJqBpqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Fri, 13 Feb 2026 09:07:16 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::1cfb:82cd:3519:418a]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::1cfb:82cd:3519:418a%6]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 09:07:15 +0000
Date: Fri, 13 Feb 2026 10:07:10 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 drm/xe: Force EXEC_QUEUE_FLAG_KERNEL for kernel internal VMs
Message-ID: <20260213090710.e4fpjfxb2fpqge2v@intel.com>
References: <20260211171441.3246686-1-piotr.piorkowski@intel.com>
 <177083287401.246446.6708996765005495710@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177083287401.246446.6708996765005495710@a3b018990fe9>
X-ClientProxiedBy: TL2P290CA0026.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 842ea62d-f1f1-4ae5-a577-08de6adf47f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emFnemRnQnNJREx1NTZQeUJkazNqeDdrdEc2Mllqa2JTOUdqNUxoMFFjVkdo?=
 =?utf-8?B?cFVXTFQ5eUZQd0ZlbEN2Y0x0c1RqaVdjR1dmZ3U3N1NpeEVnRW5oVWdJSlp5?=
 =?utf-8?B?UTMvN2FjTndyZzZ2d2E5QVQvSVZ2dllHV29yS2hwMGFKMmg4aDQ4cWlSYUFx?=
 =?utf-8?B?WXlOQW9zQi9UNGRvR0NvSUttSS9qOE1majNTUDlpYjlUUFlZR29NSEtxcmFX?=
 =?utf-8?B?TXlxL2FPRkF6c20vN0tPVGIwOHI4QzVQUnlNNllJN05aalFCL25OWG5wYVFj?=
 =?utf-8?B?L1VVc0p5Y0JQMDdiQ0dFL1luY1N5NEN3QS9Jc1hrZTkzVEFnV2QwazE1enFK?=
 =?utf-8?B?MHZVdXVQYjBJOSs1VXRoNlozdjE5blQ5dVF5M0pTZHdrRHFFODJhUnZ5WXc4?=
 =?utf-8?B?SmNlRlZHNXNMRlNYODA5K2V5NnVxeCtiYm9FUmdTcDVOdUR4L2xsMkN4MGlo?=
 =?utf-8?B?VGhhckdKWkxESElOUG1rRTZKeU9xcWI0MXdzOXNKb3NHazBIZVl5bnRkNTE4?=
 =?utf-8?B?Qmxkd2ZPZlB1cmlOTHdzeUs1VHc1ZHdMVjMvZE1mZDBKdkpuRVNSMUdzNDIw?=
 =?utf-8?B?OGNOc1A3T2RYMFFsdkJjemkvMnd5K0xEeWs2OHBscFBuY0lFS2NGd2hoclQ3?=
 =?utf-8?B?czlnQ3NCZ2VUT01NaEJ4dkE0MUZQOFRDZFdwbjVDcml4cDQyd2h2SGk0c1JC?=
 =?utf-8?B?eUJaV3JZZG9udG5hWTVyVitwTnd4WWd0bkUySEovVE5lc0FSODVIVS9lK1pT?=
 =?utf-8?B?Qmc5dnkxUk96VVlQVDQvMndkcG5jQ3F5SWVMb1p6c3Axc3N6clA2SlpzeDlP?=
 =?utf-8?B?cTZIdWRicGZNMVh0UW1heVdGS3dNUEtJazNoaEFvN2ZUOHRXREExVHFSMUdx?=
 =?utf-8?B?SHpGRDhQcDQ3NGk1TDN5eFBwWHppRkZrdDlxeHBUTUJPZmQ1aWZMdEE0Y2ND?=
 =?utf-8?B?dk5tRXdIWXJTYjR1b01tdWsvVkErNy8rMjA1NWhFalR6dTFPY0x5S2E0Ry8z?=
 =?utf-8?B?QXdmTXplaisrRm1SVUtiTXRhQzRtTTNFNjRaNFlKeUVldGdCcW1XZ2tnVHV2?=
 =?utf-8?B?Q0xzYU9hWEFITEpFMDFwUUNzT1ZPU3J1eURSUUlUL3lvVnZzUUp5MExhV2tl?=
 =?utf-8?B?S08xT0FWUG5GR0xPaitNWmRic1Nqc2tGZXU2WlIxam9FcG9Wc2ZCbHNyUDJs?=
 =?utf-8?B?OE55SFpDTGdvZ1ZZazhGZmh4ZFI1eG92UW1sZlM1RVlsOW9FWGFZQ1NWbXRi?=
 =?utf-8?B?ck9Md0tFdHF2SGgyRWh0MDBFTVd4UDBZZmFFWHVKeGJONzRsN2YvK2Uybk9a?=
 =?utf-8?B?UEdxNUEwNUhQZk52YmEweWorYlZ5K1VyejBKVFRVY1djL1NUZnVnNjl3bG92?=
 =?utf-8?B?NHIwdEpzWmhNMzFuWFNVMldHMHdCdCtDb3hWeFdYaVNVT0lIcWVESzZxUXVp?=
 =?utf-8?B?WjVnTFFpQjdRQzhJSnZPOUp5aFpvYzFoTzZKOFNtK05wb3RDQ0N6MGMwQTdl?=
 =?utf-8?B?ckgxVm0wRk9iQkZMalduSEdoL2dHYy83YjJ0aGMvUUc5UUJHRWNlOG85Zjdh?=
 =?utf-8?B?OUd1alU4Z3dQRkNzMUlUWWNGMTU1SWx5TnVlVUhrTFVhcXFMNjFJZXZTS2VY?=
 =?utf-8?B?SGtNeHNLcXB1MFZRc21QL3JIckZBUkg2TTlScnZ1SDliOVQ2anJRZU42cFl5?=
 =?utf-8?B?ZEtyWU8wN3BRZU10ajRyUmhucUtTU0RtUUNPODhtQld4aVRrQ0tucE5TT2NX?=
 =?utf-8?B?eTVFdGFwZFJ6WlJVMDJRWEdjRnFiTEJXSFJBd1NEb2xXYWM2aklES1JZMmdO?=
 =?utf-8?B?QWNWdjVPNmUvc0JkUm80R2lCMnFLTDYvQUU1RytjMVdFWkd1c2hpS0JSbUpR?=
 =?utf-8?B?UTBnRFFkMnNWSS9zTG50NURsa0VZc0JMYkJ6azBrUTRKZkNrVHl0cmNCTmZo?=
 =?utf-8?B?YkxwUGpXSGVsRDBjVnRzL0plRXRYNnZpL0puWEtXUVRlOWdOUDVHMUtZbXAw?=
 =?utf-8?B?UktvbGFFakRGYm9jMzlRVWtUNlJiek1QU2hIUnVHL0thcEY4Vm1GUjQ3KzJP?=
 =?utf-8?Q?tNDRM7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0kvYUdUVEJJKzBpcXBCdFkvN2FQY3JTdzlmb2Y5U1BJUW9JMGs1WHh5bmNN?=
 =?utf-8?B?Z3pUaVZhd05PUG05TXBuV1c4YzZBUk1sT1JHbUdxMFpnMGxLU0FLcU5Fc3Y2?=
 =?utf-8?B?VXhxSFZaU2hOYmFSb21UcTd2dFpyZ3JXeiszN0c2dnI0ZjlVdHJLL2VhMVQw?=
 =?utf-8?B?V1E4V2QyTFk2OXIvMjlDeGhMc1JXcmI3amlzT09ISU9tNGFzWjBoUWJiT2tX?=
 =?utf-8?B?OXFRTXVuMlJGUk1VZE9WQnhIN0JuVG0wa3RMa3NJYUhXL1Y1NVdnaGJ1eDFJ?=
 =?utf-8?B?bkZDVUkxU2lwZVhlWVFQWDRTY1A5N3JyMmVodkNtUjNMdStxTDUxQ0tLOGxi?=
 =?utf-8?B?ZlpSa09Jd0Rld2NpdjRSVnlpbjlXS2VXcjlRZCs4am1RMHFHK3dyVFFxSUs1?=
 =?utf-8?B?dHlQZmxvQkNYZ1FoSHZlN1BaVUg0UWZ5KzVPcWpsTk9nVTZyTHd4UmZRYzJq?=
 =?utf-8?B?OUlVOU02ZzNYZklsdGExMWVOUVV3QW44d3ZBbnVyQ2Z0WUxYblNpQmI0N2JD?=
 =?utf-8?B?SVp5c3ZZYkVpT3VDRWpXdXpJbXp4d0hZNkV2VHRnRXoxZ2hTOXRSeUZnOGF6?=
 =?utf-8?B?Zkl4WWg1OWxVcGlGblNIRTl5Y1hiVUlpQnM0YVduV2tiTE5sdXAyMEtPeXR6?=
 =?utf-8?B?aEt5UjJjamZDZU1YM210UHhBTHFJNkJCRi9oUnhpUDhwclZBZDRib3ErMHVM?=
 =?utf-8?B?NWJad1h0M1pwK3ZoeGpQRitXbUpPdzY2ZjNFZDdPWDkxdXlzbUVYRlZkRkRt?=
 =?utf-8?B?a2FCQVlQQjM4eE0yWElsaFo2N0IwcEUrVEZHeWQ1Z2ljYjdnYUJVZVZhWVdv?=
 =?utf-8?B?NXhtRysxVkxJb3lZZjJGOHNscnZBRzJVUXROUy9ZN2pRaDh4WUFVNDZUN0Rn?=
 =?utf-8?B?K1VERWVldHZHSmdWMldCSzg5TW5sU0FSUWttZ3ljU0w0ZnV2dUIxOXk3U2JK?=
 =?utf-8?B?ckxvQXlUcm4yZnFHWFNpdWdVSHI5L2ppaHc3eFFrNXRlaTVkS3czNHJVZnlP?=
 =?utf-8?B?anZ6aGI1a3pLRTgrTTE1cmg3RDI4eUFpVFN4RGxCazkrbjlMWFV2ZUorcW1F?=
 =?utf-8?B?elFLQVdZdlF6bjlhdGpqcGVTU3BKa1hadVFDNFlsUml4elJ1N2NueGV1RStw?=
 =?utf-8?B?czFpcHB6eXFEb3BZclZvaVAzV2NEM3o1RURZaDArNDlkL2xjRTlpV2h1MzVZ?=
 =?utf-8?B?WFJERFJzRXlsS0lBZm9qTGRUbGtnSXRCdk0wbDlrOXFFU3I2MHFPSWRvOVc3?=
 =?utf-8?B?L1JXSzBZRWZpTmZ4cmVQOFdwblNqVmIvNVZWTHdRNW5RdHZyakU4US8vQ25B?=
 =?utf-8?B?VmVMZWU5N1o5ZlEyeEZobVNCTDQycnowNDNpZjYwZWpVUUlDL0JndDVvd3lW?=
 =?utf-8?B?MHpydTIxK3lDRzUvMXI5bEt2T3NSbVh3d25GWWhneUduUmJlMjVzR3RUMENR?=
 =?utf-8?B?ZVF6V2lkZWtyM3V3VHFheXBQN3htajNFWEpuZHZ5RlROTm5HcFNtVE5BaTRR?=
 =?utf-8?B?VDdDbkJvSFhlK1Azd3V2c2tYRld5SDRwU1JteE0zTkVJSUhvRWMxVXczWXpX?=
 =?utf-8?B?VFVXNEhTSFJ3QTdSWkp4aVZ3ZWVNeU9mUm02SjRmWG1ROGtMcDRvU0NpT3g3?=
 =?utf-8?B?WTZqdFJ0YkdHOWFoSGY4RnArSXZiOVBIVGc2Wm90OWRmQVJTd0d4bzlxaE9T?=
 =?utf-8?B?aExOWmIrc04wOWc0a1RhMk8vcUtYenptUExPSWlnUmxuemI1QVl2MytHSE0y?=
 =?utf-8?B?dGpveW1ZOUlGRVBJYUNDMDZuWmhXT3RmZkNQM0czUmRZSlZ0cmhSNXo5YzBk?=
 =?utf-8?B?Sm9xcUtrd2x1SlBEWkxiK3ZENHZ4aGdHY01pQ2w4dnhpeERvcExHRmQrRXNX?=
 =?utf-8?B?R1JjaktEUTJ3eXFzbCtOMUs4ejNFTE9PRjlEWVEzRHBZajYxeElIQVZtVzQz?=
 =?utf-8?B?RVBBTTlWd1lRNHNTK2VJbUxGVVFDUStHV3pKRmpoUTlwMi9RQWpCUkQvVkZ2?=
 =?utf-8?B?M2IxUjB4TVRpZ0Vmd3FMY0dBQkdUUnlBeTVVOUZqRFp1eFZVMzN5NW56c1l4?=
 =?utf-8?B?aXExOW9yUm9uenhqT3Y2WEZnUmJGL3oyeTJJcFU3VTZKNnFGcTRuUzZCbWV3?=
 =?utf-8?B?c29FYU1yTGNzY2ZWZnpISDJVU25wek9nZFJ3UVlRZVluWEo2TTFlUWJlTEVp?=
 =?utf-8?B?cGw3ZDhnS0orLzNTTDd0M2hWRTFPL0x1Si9zRWZXa3U3bzhqaVlkSUI1eHBV?=
 =?utf-8?B?N0pVTUNyT0g5d2NIMXdpa1QvMFd5WFdBNlhDWDU1SFkySlo2R1pMbmxGcWd6?=
 =?utf-8?B?c0JXanJFMUU5M3lFOHBpMkdZSnEvSzR3VnU4NVlOZUtQNHNlTHFjc05nNzkr?=
 =?utf-8?Q?Dqb6mQnXwWg5c4CM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 842ea62d-f1f1-4ae5-a577-08de6adf47f8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:07:15.7309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3xEbCGIfFl+c8E9pssBHIv6yae4D8+4qj5IKhx/gbsNDeP2ln/fAUoHZ7p9uetAVQPe5FS4ToqcdWcTdefg4iMw78etzn2URmk4V7q+sr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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

Patchwork <patchwork@emeril.freedesktop.org> wrote on śro [2026-lut-11 18:01:14 +0000]:
> == Series Details ==
> 
> Series: drm/xe: Force EXEC_QUEUE_FLAG_KERNEL for kernel internal VMs
> URL   : https://patchwork.freedesktop.org/series/161506/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37_BAT -> xe-pw-161506v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161506v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161506v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 12)
> ------------------------------
> 
>   Additional (3): bat-wcl-1 bat-wcl-2 bat-bmg-3 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161506v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc:
>     - bat-wcl-2:          NOTRUN -> [SKIP][1] +43 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html

Normal skip:
 	

Using IGT_SRANDOM=1770831758 for randomisation
Opened device: /dev/dri/card0
No valid crtc/connector combinations found.
Subtest hang-read-crc: SKIP (0.000s)


> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - bat-wcl-1:          NOTRUN -> [SKIP][2] +20 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

Also expected SKIP:

 	
<6> [461.512757] [IGT] xe_live_ktest: starting dynamic subtest xe_validate_ccs_kunit
<6> [461.578672] KTAP version 1
<6> [461.578686] 1..1
<6> [461.579253]     KTAP version 1
<6> [461.579260]     # Subtest: xe_migrate
<6> [461.579263]     # module: xe
<6> [461.579299]     1..1
<6> [461.579310]         KTAP version 1
<6> [461.579331]         # Subtest: xe_validate_ccs_kunit
<6> [461.579716]     # xe_validate_ccs_kunit: running on PANTHERLAKE device
<6> [461.580069]         ok 1 0000:00:02.0 # SKIP non-xe2 discrete device
<6> [461.580119]     ok 1 xe_validate_ccs_kunit # SKIP 
<6> [461.580149] ok 1 xe_migrate # SKIP 


Thanks
Piotr

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161506v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-wcl-2:          NOTRUN -> [SKIP][3] ([Intel XE#1406]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - bat-bmg-3:          NOTRUN -> [SKIP][4] ([Intel XE#6566]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_waitfence@reltime:
>     - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#6520])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_waitfence@reltime:
>     - bat-ptl-1:          [FAIL][7] -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/bat-ptl-1/igt@xe_waitfence@reltime.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/bat-ptl-1/igt@xe_waitfence@reltime.html
> 
>   
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
>   [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8749 -> IGT_8751
>   * Linux: xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37 -> xe-pw-161506v1
> 
>   IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37: 2938ce73d01357a5816ed7dbd041154b58635a37
>   xe-pw-161506v1: 161506v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/index.html

-- 
