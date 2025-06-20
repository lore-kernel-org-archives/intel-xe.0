Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0880EC7115C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 16:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B784310EB8C;
	Fri, 20 Jun 2025 16:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPREKRMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEA210EB8C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750436955; x=1781972955;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4fBHNeadqLppAB+H4kFdkhU+kVsgFAgCmdUZhC9ggZo=;
 b=kPREKRMmtuvOz4e6zgYY1kHBOeS/Vdmr4siq4naGsTqQ9WKYJTeH8nNC
 Llog9nAjIyKW79RJ0yaLgizeDvWCfXo16+qZAyao2yB/tm/meNyqe9yKO
 mHmYhduNGvJUjLM6p3N9t5Ou7W4qtwjrk79vZyDXI4p8DamLM8ZrMDhmq
 fO9TBnFkJu1nQ5IVKppeZqgsTwo6uHhUhRgdQUPGZIFfO7XhI0QH9cmDU
 RTb8SCW7hHysdvhS6lRe1qWKEUfAgL1+1fRWhA4qH4jSQ+mbBNJx9Iesy
 B9uDaC/HPWYzLvdrlHtnEB0zCuhin9JUVdYQLEi0Q4Ew+MgKmcjRpRtGq A==;
X-CSE-ConnectionGUID: gbx1a7rtQo2YVhnQaVReAQ==
X-CSE-MsgGUID: nbmobKGJRbShx6PC72vNUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62978484"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="62978484"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 09:29:15 -0700
X-CSE-ConnectionGUID: pa9jCvjORXutGOb38SKhxg==
X-CSE-MsgGUID: mGHB3f9DT0K6gV0HpTTGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="155340121"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 09:29:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:29:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 09:29:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:29:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoDSIoyDzzpWoZJm1/xgcz5R0xyjGsaMNd6uNjxumGgngriAG50unBaq9WU0q95AJ/mFY4WuNFMHmfQfbAvG9JxDLshdz+cdy9VK3g2M0vTkYSrTD04Uoode7YcHymUzywDamAejjBzCpQjXFybV44bcuQWInShfxskaptKJQzb7UjrQNiHheF1O5E7U+E+ZuKXdCsI8Sw2pMEkeec76nf/biIcaUSJQF490zyVbCwsPoa6Cr4vANAO5x1uCtWRBrhhCiv9f/919yN3NCFo+XnBwaPo6eeza23KZZFA/qvCxUQhq3ge1ycshBMsHdAApzBsnohfbgCspx5LvBrlAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UGOvgHqH8GZ6XVt9dY+RHBn6HRd8w7F+6I55HRRWFs=;
 b=vk5fCZML5/87hOtZrlDG3b7/J3xMq8JmVYTNRsKD584Y6GD+hcc6k3IcSMOmHxXcifZtG3dpEx2dGcUcpdfxcBxZzt2UVVCuIyn8cdT34iiLRk60aJ2aoDxyKhM52TitRXGoYYlTvZWMcgt5wVq398NMrUP0u4IrgTe15/7V2eyH22ZtFYe0yQf0SRbjuZP/1k+nrjXhu7VwvDzHA+s+LK9UmRQCjh6CKUoAjzOP8SBT7vQTGVWuQYIaUD6jYcLWVun4SuGiyp1HaVZmG6R7vhdSXIF2yXRv5eesR1m8kUTJouEvMPrTWXNtJVr+eEsW3EwB0HTTkTXwkevDq9NdFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.36; Fri, 20 Jun
 2025 16:28:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 16:28:58 +0000
Date: Fri, 20 Jun 2025 09:30:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v8 3/3] drm/xe/vf: Register CCS read/write contexts with
 Guc
Message-ID: <aFWMrPVvXmXDpzUY@lstrano-desk.jf.intel.com>
References: <20250619080459.27731-1-satyanarayana.k.v.p@intel.com>
 <20250619080459.27731-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619080459.27731-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:303:b5::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: e149660d-1902-4d60-4876-08ddb0178eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEYzVWNXZ2txQzAwWjFxSW9rZW1pYzBXNUNXcHBIb2c1dHYzNmM4Sk5EdS9j?=
 =?utf-8?B?V0Y2ZHR6dzY5YlY4NlU3VlFhais5ZEhGRE04M1lzajRyZy9sT1JPazJKTk5T?=
 =?utf-8?B?bVhsRndFSUU5bjNxNXZ2V2FGRnRGdkVadkJMM0NsR0RFLzh6N21XSkRnaVBs?=
 =?utf-8?B?WlBsbnYrWTBMb3FzdlZBQUpWZDZnZFlpR1lrMlNjOGlUQkNsMlBFQjA5aWV3?=
 =?utf-8?B?dktjOGZLS3pZZGNIMXo5RFZsNXdPTGRqenJHZi9VUElZVmRYN2w3bHd4V1dx?=
 =?utf-8?B?WEJnL3BsVlVPMG1pdlJwSlVzMW5KdnRaaDJVeFVieWcwcDVQcGg5UCtWODY3?=
 =?utf-8?B?ckNUcVBkN0E4Q2pYUVNhR0NMWkhtZm5tRkoxT3ZZam5rcHFZM2JRQjFQNVl3?=
 =?utf-8?B?akh4aG05MkQxdGlrbWlFdGpEUnRCV0lmQklhME5DZEkyemdvT21hQUVQaGl0?=
 =?utf-8?B?UnZPMW9mWitWMk12YU5QT01lUnhvai9GWDVBalJnOCtqb0s5TUYzK1JLUVF1?=
 =?utf-8?B?RmRnY1lDVXZmVmp2Z3hJczZVV0RHYU45TmlrcUUzWE5HRDk4WDl5SGE3ZW9v?=
 =?utf-8?B?VmFFcFQ4blJycmdXOXd5cTBycHUybTFhdCs0MlpsdVRmRkFRQlowQzdERXRD?=
 =?utf-8?B?Q2RRY0VKZmtQV09uM3FwQ05VL001ak9TZ2o5K1FyRGNHY1ZPMTZ1Q3hqVjhl?=
 =?utf-8?B?UTN2MFphdVMrTGVNWUozRnYwK0VsYnJYU0lHWWhaM0xzTUZoeStGMlkvNUdI?=
 =?utf-8?B?R3I5TCtMVmJJcmdpdkZQUEx6eGhuZjRKR01aaTgySXBFdWQ0bS82VU8vWVYv?=
 =?utf-8?B?ZTNTRlF4OXVuT2FtMzNuQTdJd1kxdmlxbEVnMkpuTlp1ZVduTVZtZ2JEL2J5?=
 =?utf-8?B?NWhQSG5lRzM4b1gvNUxmRzVRd3BJZGltdi91YjVuVXRxYmJBSnJoSFEyaGYx?=
 =?utf-8?B?UkIrQStESzNDNFNJeWcyL3JZYTdqUjdVZU4wSXR2OUx1bVNzNndtU0pOK3k1?=
 =?utf-8?B?dk9sMEZmRGt5bWgxbTJzQkc0b3FUanVZS25tSUV6aFUxOWJKaEk5QVZMSGlW?=
 =?utf-8?B?VHF6Z204U3N0UzVSMVl2ZGg4dlF0bXpSS2FTYUIvVlhoYWxydE9qY090YmM0?=
 =?utf-8?B?YmZ5ajJ6Zlc4dWxpOUV0K0RvYXV0clVia01aMjJYS1NoSlpMU3B2ZWR4SnpM?=
 =?utf-8?B?MnVvbVBwMmRUUzFrbmUxeDhieWhIQkJBbllxbTJwS1p5VXVqajdPK2k0ak4y?=
 =?utf-8?B?WitlZXh2MFVTVVJzTStmK2krSmJZR1ozQ3RPY29zWVNYU0ZMQUtNYm1QVVRs?=
 =?utf-8?B?Zm1wd2lDSXNYdmJoUXo2WDU4d0JlcVk0QmMzVmt5cXcyODk0U3ZaVzhKcXh2?=
 =?utf-8?B?V2liYUozT1g0d3NyV0hpeUJ5QUhNelM1VFFyTjAyU1ZXWWxyNmJLLzBWQXh6?=
 =?utf-8?B?VDc5TGxsdk5lM0xmN3lNSFcrSmhMME5rdWVHdXdDVWx6MFNKUlJiTkgrcnps?=
 =?utf-8?B?SDRraDZuMTB5UFpFam1ZYi9tVUwyVmp0bmxUZG94N1d3aVc3SlZ0RUQweCs2?=
 =?utf-8?B?d09mYXdpcnhrWUx6MWFKSldqRExwMUNpNFJOS1lXNm0zVkYvY2pTNWozVkx6?=
 =?utf-8?B?clV4NFhDZnRNTnh2cjJMbWUySXZ4VTZtSzkyTDJKUnczMThKRnAzR2Z6NGR4?=
 =?utf-8?B?TGtCdGtDY2lRVnc2R3RmUnVMRVBXbnpMaTRKVWwzcVNUcGovcFJQK3RtNFhI?=
 =?utf-8?B?YWsySGhuOWsxN3c1bGhNRzJpWFd5V2dtWkcwa2RhM1c4aWptd3oxM3hKRUtY?=
 =?utf-8?B?M2FsdEl3NFNiQk9BZVNLTUJYVWpOMTc1RFJvL05sMGZoTVBzeithWWpxMTlB?=
 =?utf-8?B?bjZEdG9HSFFNQVBrZEg2dGoxV1hUd2Q4ZDRlWFQzMXkwNUFWSDh0aHBCR1hR?=
 =?utf-8?Q?0ORD/CqdgIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1R0SlY0RW1WUUxENEdVbFVVMytBOHlCM1RUZzRPL21PVU1FekFxV05iY1lw?=
 =?utf-8?B?YlptRTA4b3dKeWRoeTBvdkdqUDJOOHBBci8yKzl4bHhLM202VnJ3eFBkYU5F?=
 =?utf-8?B?R2RIU2tEQzFCTWNLbFYxckVYTmlhaE04dHhnZVpFalVLdmE5dlBzQUpvZk5j?=
 =?utf-8?B?YUpZWDR1b2RMSHFmaUVMbFc3K3pZdkJBdVFFQi9IbEkwazEyZlVKS0REaFdY?=
 =?utf-8?B?alZxWEY1U3pra254cW5tWDkxcGFCZElQOFloTXowQkQzL3dEbE4vY3lKaFFs?=
 =?utf-8?B?VHZPZkJCSVhpMDJhampvS1FwKzh1cW9GTmErRGFzL1JaSEVIRmxyaTJheHJJ?=
 =?utf-8?B?YVZ6VDhMekYwd0NkT3h2Yk9ObVVpT1hnZTFIN3dJYjQ2ZzJsMSs5NFpTOXBp?=
 =?utf-8?B?dEN2ZmtuYlpCZVVhU09Rc0VKRWN6YmtWN1htQ2s1VWg0OEtycVBNMm1Mcm5w?=
 =?utf-8?B?U2pvbEwrUDZZN05nZ0U0RS9TbDFKeUdUNEdiNzVmdlRRd2c4QVJIY0lSakdz?=
 =?utf-8?B?TGh0azBXSGNLdDV0S1pieTVmcmhxdnp5eThEVFhEQytnS0FGL0pCSzVKVmdN?=
 =?utf-8?B?bWJ1OTQyTkQwMllZeVJVUTU4K1Z1SDcrRjlDWGZDa2Nmb0pzWXdQd1FWUW9Z?=
 =?utf-8?B?QzFhM0k2VnVqdWZiWm80UzIyYUx2eGQ5WmxhMUI2WStVTTFUT2VaZCtzbDNI?=
 =?utf-8?B?WmZuN25VTEF5dW8vamttUlVwVUhHWTVnTGo2cGdOYWdhUElOZEdvbFhZNE9n?=
 =?utf-8?B?dXpCaVpyQzNHWUNibjZtck1DbDFwUW42U24ybGMrVGZURldvN3I0OW53NjVn?=
 =?utf-8?B?WWFDUXlESnhkcUFrbDR4cTNMSXkyRnhmNjlpVnV2N2NRWTJGWUhKdEhqS0Vz?=
 =?utf-8?B?VVdzL2Fwd3pEK2NmWXZmZE8wdkxyVjI0TXEwK3I0S0lKSGpNUkxxSlpFWnJY?=
 =?utf-8?B?dlhJUm1rSHk3SHpJSFFDNU5sb2M4MCtoemR1aVF5V2RMQWRtcEQ3aFg5RmV1?=
 =?utf-8?B?UmtHWWFLcER1RVdsK1FxRmlXdUMvRW5qeXNGYjM0QkpMaDZjRStET01QVXR5?=
 =?utf-8?B?aUFoYnhmQnpWbk1ZL01MT3oycFJEWDRteGkrTzFvR2hCVHNYWW5lZ0NSR0RU?=
 =?utf-8?B?TFlJWFJINlptQVYybW1GbzA1UmFQVkNPS2xFSlN2UXcyNmdvZFBPL0gzZFZl?=
 =?utf-8?B?SHFJcjVUaEcxR0lFL0FQZ1I1Q0R5MUgyb3BocmlSU1JVSHA3QWI1VmV0b0Z4?=
 =?utf-8?B?SFd0NUpuR3MrZDdNKzl0N1JRT1d5b013Wm1MVkxhQkZnZ3VmaDRxUzhKZHJM?=
 =?utf-8?B?YTQyTDVONlA5Mk0vL05WaFdlVyt0KzcwWTREOHMyMXF4dm1GR0N2NzRwUXhT?=
 =?utf-8?B?TlZ3MHY5RzNTMWxFT1JwV1NLZWtRd3psMW12T0U2c2tNR3AvTEU0T1ZQU25L?=
 =?utf-8?B?MFp3WkRvbUhIV2ZEeUg3ZHIyL0FMUEUzeURCWWJnRENHRjBoakVXSCtNaWpY?=
 =?utf-8?B?U1o2dlp0M0drcU1FaVZKWU5ucTQrS3N6MDIxeEZYaExXS0xGT3VzSGZjcTRF?=
 =?utf-8?B?aEVhQ1dHU0E2Wm45aWFOVVZ1c2VXM2NMQVVhL0t6MEthMU5sUEZwVStlb0Vk?=
 =?utf-8?B?bnhkU3pmSHNETTU5b1R5YndwdDE0TDZIc2lFTkV1SkhCc0N3SGZxRC9VaFVF?=
 =?utf-8?B?eG1XeGliYmFnd01ORFJYZlVKWDNtTGt5NGc5cFZ4VGdyODhiZ2d5MWdpZE00?=
 =?utf-8?B?N015eng5REZ1UkZHWlpPdmhDeEl6S3lkUkdVMzQ1OEwwbTFvVFpsNmVQdlBH?=
 =?utf-8?B?TGljOVpvTlJ2aEJ1azZFdjJkdGp2b3g3UkZRQ2o2WkdMcUVMZDMwU2d4dE1p?=
 =?utf-8?B?cXVkeXMvckhxczFKbEkxQ3VYbEM3cG0xVWIrQUdDbEtkZVo0UHRrVTJjVGwz?=
 =?utf-8?B?anlrQWtKN0w2WnRmRjMyMFQyaW9xdElUTDBIcm04VWx4eWdabldHVWVZUXNa?=
 =?utf-8?B?SnBGd0FHL3lLTytjUWJNVkhqdXhyZkZQd2tGc25SL05NaGRuTGhocHBRQTMx?=
 =?utf-8?B?SWFlbFF4VGZTa3pIYlhhcHJ5bnpmdzU1Wk5RL2x6TU9oSU1Lb2JUWUtEY014?=
 =?utf-8?B?MFlXNTJmZVRZeDMzUmk1cC9RVk9kS1NYcTduN3FwT3d3QUp0VjVBZUg5RDdi?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e149660d-1902-4d60-4876-08ddb0178eea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:28:58.7157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6uSAD9R4v919d1WUeD1mG8lkEmB0Ititk5GeoC8OWmNbcB3W+ERkVtFMpmwKXW33Qm4r/Cg/QNY1I+yYcWcKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
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

On Thu, Jun 19, 2025 at 01:34:59PM +0530, Satyanarayana K V P wrote:
> Register read write contexts with newly added flags with GUC and
> enable the context immediately after registration.
> Re-register the context with Guc when resuming from runtime suspend as
> soft reset is applied to Guc during xe_pm_runtime_resume().
> Make Ring head=tail while unbinding device to avoid issues with VF pause
> after device is unbinded.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V7 -> V8:
> -None.
> 
> V6 -> V7:
> - Fixed review comments (Matthew Brost).
> - Replaced xe_tile_migrate_exec_queue() with xe_migrate_exec_queue() as per
> review comments (Matthew Brost).
> 
> V5 -> V6:
> - None
> 
> V4 -> V5:
> - Fixed review comments (Matthew Brost).
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Made xe_migrate structure private as per review comments.
> - Created new xe_migrate functions to get lrc and exec_queue.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 34 +++++++++-
>  drivers/gpu/drm/xe/xe_guc_submit.h   |  1 +
>  drivers/gpu/drm/xe/xe_migrate.c      | 35 +++++++----
>  drivers/gpu/drm/xe/xe_migrate.h      |  4 +-
>  drivers/gpu/drm/xe/xe_pm.c           |  4 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 93 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  drivers/gpu/drm/xe/xe_vm.c           |  6 +-
>  9 files changed, 163 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 6f57578b07cb..ca9f999d38d1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -45,6 +45,11 @@
>  #define GUC_MAX_ENGINE_CLASSES		16
>  #define GUC_MAX_INSTANCES_PER_CLASS	32
>  
> +#define GUC_CONTEXT_NORMAL			0
> +#define GUC_CONTEXT_COMPRESSION_SAVE		1
> +#define GUC_CONTEXT_COMPRESSION_RESTORE	2
> +#define GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
> +
>  /* Helper for context registration H2G */
>  struct guc_ctxt_registration_info {
>  	u32 flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index df7a5a4eec74..f17a63ea06e9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -542,7 +542,7 @@ static void __register_exec_queue(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> -static void register_exec_queue(struct xe_exec_queue *q)
> +static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -550,6 +550,7 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	struct guc_ctxt_registration_info info;
>  
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
>  
>  	memset(&info, 0, sizeof(info));
>  	info.context_idx = q->guc->id;
> @@ -559,6 +560,9 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
>  
> +	if (ctx_type != GUC_CONTEXT_NORMAL)
> +		info.flags |= BIT(ctx_type);
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> @@ -761,7 +765,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  
>  	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>  		if (!exec_queue_registered(q))
> -			register_exec_queue(q);
> +			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>  		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
>  			q->ring_ops->emit_job(job);
>  		submit_exec_queue(q);
> @@ -2366,6 +2370,32 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
>  	xe_guc_exec_queue_snapshot_free(snapshot);
>  }
>  
> +/**
> + * xe_guc_register_exec_queue - Register exec queue for a given context type.
> + * @q - Execution queue
> + * @ctx_type - Type of the context
> + *
> + * This function registers the execution queue with the guc. Special context
> + * types like GUC_CONTEXT_COMPRESSION_SAVE and GUC_CONTEXT_COMPRESSION_RESTORE
> + * are only applicable for IGPU and in the VF.
> + * Submits the execution queue to GUC after registering it.
> + *
> + * Returns - None.
> + */
> +void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	xe_assert(xe, !IS_DGFX(xe));
> +	xe_assert(xe, (ctx_type > GUC_CONTEXT_NORMAL &&
> +		       ctx_type < GUC_CONTEXT_COUNT));
> +
> +	register_exec_queue(q, ctx_type);
> +	enable_scheduling(q);
> +}
> +
>  /**
>   * xe_guc_submit_print - GuC Submit Print.
>   * @guc: GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 9b71a986c6ca..8f64e799283b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -39,5 +39,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>  void
>  xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> +void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c730b34071ad..a90c5ecbd8c0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -84,19 +84,6 @@ struct xe_migrate {
>   */
>  #define MAX_PTE_PER_SDI 0x1FE
>  
> -/**
> - * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
> - * @tile: The tile.
> - *
> - * Returns the default migrate exec queue of this tile.
> - *
> - * Return: The default migrate exec queue
> - */
> -struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
> -{
> -	return tile->migrate->q;
> -}
> -
>  static void xe_migrate_fini(void *arg)
>  {
>  	struct xe_migrate *m = arg;
> @@ -1070,6 +1057,28 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  	return err;
>  }
>  
> +/**
> + * xe_get_migrate_lrc() - Get the LRC from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to LRC on success, error on failure
> + */
> +struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
> +{
> +	return migrate->q->lrc[0];
> +}
> +
> +/**
> + * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to execution queue on success, error on failure
> + */
> +struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
> +{
> +	return migrate->q;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 96b0449e7edb..3754d9e6150f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -118,6 +118,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>  
> +struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
> +struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> @@ -138,6 +140,4 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  			   struct xe_migrate_pt_update *pt_update);
>  
>  void xe_migrate_wait(struct xe_migrate *m);
> -
> -struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 26e95460af87..6c32412126d7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -22,6 +22,7 @@
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace.h"
>  #include "xe_wa.h"
>  
> @@ -546,6 +547,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_pxp_pm_resume(xe->pxp);
>  
> +	if (IS_SRIOV_VF(xe))
> +		xe_sriov_vf_ccs_register_context(xe);
> +
>  out:
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 242a3da1ef27..e4ca34af05fa 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -8,6 +8,9 @@
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue_types.h"
> +#include "xe_guc_submit.h"
> +#include "xe_lrc.h"
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_sriov_printk.h"
> @@ -163,6 +166,86 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>  	return 0;
>  }
>  
> +static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> +	u32 addr = ctx->mem.ccs_bb_pool->gpu_addr;
> +	u32 dw[10], i = 0;
> +
> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
> +	dw[i++] = addr;
> +	dw[i++] = 0;
> +	dw[i++] = MI_NOOP;

You can drop this NOOP or you need to add another one. The LRC tail must
QW aligned per bspec 46043.

> +
> +	xe_lrc_write_ring(lrc, dw, i * sizeof(u32));
> +}
> +
> +static int register_save_restore_context(struct xe_migrate *m,
> +					 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +{
> +	int err = -EINVAL;
> +	int ctx_type;
> +
> +	switch (ctx_id) {
> +	case XE_SRIOV_VF_CCS_READ_CTX:
> +		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
> +		break;
> +	case XE_SRIOV_VF_CCS_WRITE_CTX:
> +		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
> +		break;
> +	default:
> +		return err;
> +	}
> +
> +	xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_register_context - Register read/write contexts with guc.
> + * @xe: the &xe_device to register contexts on.
> + *
> + * This function registers read and write contexts with Guc. Re-registration
> + * is needed whenever resuming from pm runtime suspend.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
> +{
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id;
> +	int err;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {

Again prefer xe_device_get_root_tile over loop as mentioned in patch 1,
2.

Matt

> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			err = register_save_restore_context(ctx->migrate, ctx_id);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return err;
> +}
> +
> +static void xe_sriov_vf_ccs_fini(void *arg)
> +{
> +	struct xe_tile_vf_ccs *ctx = arg;
> +	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> +
> +	/*
> +	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
> +	 * submits this context to HW on VF pause after unbinding device.
> +	 */
> +	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
> +}
> +
>  /**
>   * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
>   * @xe: the &xe_device to start recovery on
> @@ -199,6 +282,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  			err = alloc_bb_pool(tile, ctx);
>  			if (err)
>  				goto err_ret;
> +
> +			ccs_rw_update_ring(ctx);
> +
> +			err = register_save_restore_context(ctx->migrate, ctx_id);
> +			if (err)
> +				goto err_ret;
> +
> +			err = devm_add_action_or_reset(xe->drm.dev,
> +						       xe_sriov_vf_ccs_fini,
> +						       ctx);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5d5e4bd25904..1f1baf685fec 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -12,5 +12,6 @@ struct xe_bo;
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
>  int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 04d1a43b81e3..8f1a258912ea 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -953,7 +953,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
>  	for_each_tile(tile, vm->xe, id) {
>  		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>  		vops.pt_update_ops[tile->id].q =
> -			xe_tile_migrate_exec_queue(tile);
> +			xe_migrate_exec_queue(tile->migrate);
>  	}
>  
>  	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
> @@ -1043,7 +1043,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>  	for_each_tile(tile, vm->xe, id) {
>  		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>  		vops.pt_update_ops[tile->id].q =
> -			xe_tile_migrate_exec_queue(tile);
> +			xe_migrate_exec_queue(tile->migrate);
>  	}
>  
>  	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
> @@ -1126,7 +1126,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  	for_each_tile(tile, vm->xe, id) {
>  		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>  		vops.pt_update_ops[tile->id].q =
> -			xe_tile_migrate_exec_queue(tile);
> +			xe_migrate_exec_queue(tile->migrate);
>  	}
>  
>  	err = xe_vm_ops_add_range_unbind(&vops, range);
> -- 
> 2.43.0
> 
