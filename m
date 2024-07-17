Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983C7C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 12:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD25310EADB;
	Wed, 17 Jul 2024 12:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6eznKGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B179310EAEB
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721220610; x=1752756610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sKl02AA/kRf95nvDTnOa7B9xkQ3of/SxObiExLNmpAg=;
 b=Y6eznKGqoLNjTS2AVym0HQzuYaTUUoF2QeXVNbJlgJ10ovvXfQyXqQY9
 F10HWvr0pRVQjWuQFLqWHJ/lIMv2805yGDkB9/kNatpur1GgovyO/R/BT
 DbwkFd+dndOH1jE1xe3KbfNt+tfixwLBjisWm7r8fdCRC7C7mSWN4UkaD
 Ltela+0zP/OQlSZz1k+vqucLsnn3BN2eU0FB+CWoG4/OM3wTBRozAPr/H
 28OCNw04i+6T8Xz6ZN1M7H8rXvwtHi1v/tNG4AIBNDZyn+gZ7rH5wNH9L
 IHXWnRV9/DA6E/Wqp1nYyqfdjCydUXe3Mbmr+qscHm2SNyKhmjunFFq7S A==;
X-CSE-ConnectionGUID: +gBKEQTzQn2su28fYIU6WQ==
X-CSE-MsgGUID: /teCz4mRTJ+/8AOXLIvREA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18849446"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18849446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:49:51 -0700
X-CSE-ConnectionGUID: jK4LVBPDSqKJ93xR9LLYnw==
X-CSE-MsgGUID: eVnMAc9AQxuaNdYdNg263g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="81429080"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 05:49:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 05:49:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 05:49:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 05:49:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 05:49:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2cj6b7vV2KfjHh23YufkZVReEXEeXSCsHLbMi0XZrtWh0YE/0TT1RzIbBSsLOALK+0he65tU1zsU4Osyt++aAyYO7BtgsQBeuTURM6NWtOpirkt5PF2Uv7YFCRZROezhawT0jf7TWGCHMOUe3KSNUntqykJzd8T47lMPL5oUspSCHDmZS+bsfUtHKb0W0Vj0uwIuicd7T546be+9e769fAS9lC30K+9iBqVq8ipNvP0AVP6treIDDxDsMJL/8ttxGIFSjMWv3T0oatq62ysbmGAnB5Epw9T3He+vBTGbvLlTPYU8GHhQNzshGyY6NRbCsVOjT0cviW+dsT4TvXj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbS5rqQ1LJBsQsnyk7iLPLINI9aXfN05mrQi4VYKbfg=;
 b=gjOj0XUwcwI034F/I/UNWDMUVwS2ndAsRZQI+nF4UK1BLL7nDM0yrDA6HtUt+nwGlw9SSwGC4n7d+ef2yS1KJxExKbQ4zir9Fd9doFflhKK8RgFqHUnWFV255jPcy+Q5b19W1qOr2tK+zzHV2bDsaO4JtPp93S5Rz6N5StjtsCPg6twezDNuSmnIZCNVmOSLhocyNAAFSAKTTT8KBehuiklnAdl1g0fzJtd7GyAJflbk3PkS/wsI2KTzNrdRwi0QpwiUwfyTAxL+yKsuLhLGdKxcMg3Ek1YHTBAluYU/ymn5zwCNA2If5lEHcE8RhhtXSNUkCywVLfQws0gng9fXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.16; Wed, 17 Jul 2024 12:49:43 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7784.015; Wed, 17 Jul 2024
 12:49:43 +0000
Message-ID: <4de49a7a-8fc1-4600-b124-f953f36372e0@intel.com>
Date: Wed, 17 Jul 2024 14:49:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] drm/xe/migrate: Parameterize ccs and bo data clear
 in xe_migrate_clear()
To: Matthew Brost <matthew.brost@intel.com>, Akshata Jahagirdar
 <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
 <2d4fb2f3bbbd38180b878f00775c9df5a5017b2a.1721193361.git.akshata.jahagirdar@intel.com>
 <Zpe400axUhGEfIrE@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <Zpe400axUhGEfIrE@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de9d76a-acd1-46ca-bf44-08dca65eee62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU5MRnVoVzNkdENvWWw4a3dNM3U3MElPVnVCZllwYnpNYXhaMlkzR0M0Z01G?=
 =?utf-8?B?TW12REt4OXBzNDI4dU0waStPZEZFMDVzMWhnaXFYQmZnNzFYc3hOSTdJTnp1?=
 =?utf-8?B?U1AwY1lDOEV4dldLN2VpZmFaeWlzQkxxVFUzS0tkM3FleXdLS080ZVZuS3RO?=
 =?utf-8?B?N1dqODRhLzd4TEZGeGVvN2RQWjJWeFpveVZtbnRhTmhMcnptYVUwWHRZY09r?=
 =?utf-8?B?R0hTTy9kMzh6d0dncG5LaGVHYUhad3NBbzRBMnBKaG54Nm5OMnNRZkNDYmZu?=
 =?utf-8?B?anVUQnpHendnL0tNR2tMRys3WE56WW1VUFFjV002Z1ZZY0dBVmZJcEhjcFN5?=
 =?utf-8?B?UGx1NDI0TEV3VGVPTk1CWEtGS3lTa0NoR25HTjZaM2NzQ3lmSUdNRUdXVThr?=
 =?utf-8?B?WXNkUGdqS1h2aUFHbFBzR0ZTdTl3cEJ2TzlJUjZsdlpyVGhQUElSY2dvNE9H?=
 =?utf-8?B?TTJQSStWZDM1MFJmM0JoSGkzdURta3JsKzh1WDNZL09DMzl1UmhFMG1QUFFr?=
 =?utf-8?B?SmI4c2w5MHhOMEd3SFZNengwNm5oelZMQURUUHR4MUdVR3dheTdSTWdvWmNK?=
 =?utf-8?B?VlY4RURrd2VFN3B2TU9vNTJSQ2JsQzY3VW16aTlUQUhqMnVXYTNsVWhyYXBJ?=
 =?utf-8?B?YTVpamR5MFZ5aDlRdUMwUElwUE8xcFNlV0w2UGtCbkRCTk1VZ2huUEJKclov?=
 =?utf-8?B?aHFSa0lGS0tOSmVlbGFtTzBySW9JSlluTENyY0RqdkNidmRaTVlSeEhyVnd0?=
 =?utf-8?B?NGZseWJOcGJULzN4eTl1ZGlqc1JTNWg2VmxkZU8yU3oyU1JBcG8vRWtNVTE4?=
 =?utf-8?B?K2FFbmlnOUNQZGR6Ukh1Snl4c0g0RFFtMytLOHVTVEhpTzh1SDd1M2dWT1RE?=
 =?utf-8?B?ZTFDbG1uL1VHc0VUK3dHaVVaRTF3bGtxai94WnlzVk1UUjBxUkhXTTVZQU16?=
 =?utf-8?B?WVE1TU5tMjlLZDBGMHJsWGxNcjJhaDBxYTgyeVNHa29peDM2YmFvYldUS3JK?=
 =?utf-8?B?ZThoMWtpM2VhdDFuLzBNRUhneXN6VnovQkQvUFJOVThxSXFEMFovUkRhLzBq?=
 =?utf-8?B?ZmJscEtKa0dGMnlCQjE2dG1WU2lFdHJJbjFvWlJINmdiYTlxYTdrUW5qMUJM?=
 =?utf-8?B?bXZvK0tsVGtsNTJKay8xUlloMktvaW9LWW53TFRmT3VUSWdobGJCSENaYlRY?=
 =?utf-8?B?L3prK0xoUkxzY0lUMWpTNFdVaDFzQ1Bpbmh3OGFoTExyU0w5dVNGV0tnVmhv?=
 =?utf-8?B?Z3BLdFRZWGd4L1JjcUVrbExBWnpWNzZPVENJWWdnYUFVem9ZZEJXaFR6WVhF?=
 =?utf-8?B?a09wd3g1WXA3M01LN0FLK2JCckZiSnB0TE9xM1IwSGxKWDBsZlplb3R4R3VQ?=
 =?utf-8?B?UGMrZnlWOHFUcWVSYWZ4VFI2VVdCVmkzMGpvTlU2Y21JZlFxUGwxMm4rTzZi?=
 =?utf-8?B?UTlZait5ekowS3EzZXQwbVVZaDRZbnNMd3RqbUVjcDNVSHpFd2pPZHBnZ2Fi?=
 =?utf-8?B?cDFBZERZb2tOMUs3THRUaFJTWTVsdE5iT3pmQktubDJrZ3FDQjlJOThQcnpX?=
 =?utf-8?B?Zkg0Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWg0SjZvUm05b1JNTEJzZ3BhZlNrR21BanNnN1dEaGtQOTJ0ZVBGc2NhbHBs?=
 =?utf-8?B?UnVkQUozWDBoZFBlY0FvbEl2SDJLMXdYek0xM0dEeHd0dENtdnVaRjg3Wndq?=
 =?utf-8?B?MmRIdzR6WGVYSnZKajdxTzJDWU9vdDJuT3Z3LzZ3bW8vanRKekdleUpLOS9v?=
 =?utf-8?B?YnJWV0NWeUJWUTJaLzRLL3VVNzVrc0F4eW9JOSt2VmwveWZlMjJDTnJIdUVJ?=
 =?utf-8?B?SkhLNVFBVUJjWE9LWnV3MitKT1Q0U0FqK3VnODl6ZlF5Y3ZnWVk0TGNHNDFh?=
 =?utf-8?B?TGNHK3NGVlNQdHN3QUdINi9nc2swNnNxWHhZdVZzZ1hDK2EwU2cxVXRSbmtB?=
 =?utf-8?B?MW4xTWNxL25SWDVFYXdyekxQRC9UbVRQbm1Ea0l2Z2JMZjFQUXhvaXBFS1Bw?=
 =?utf-8?B?bjNjOXdtSVNZeHV2Y1ZqS1dGb1VPOTdMWmFOc3NxMXpmYmhIN3V3Ums4NWNu?=
 =?utf-8?B?NHFhUCtoRlhRQ2E3MXhZU0tZcUZmc1BIU1BTa245Nms1eEdsTXlacWtWRWgz?=
 =?utf-8?B?ZzA5bTF5dW1BNmpRVlk5aXRsV0NFN0c0bjRNZGQ1eUduRVY5SDJhNmV5bW10?=
 =?utf-8?B?WDE2U3ZNTytGdXZoYXhtUWVoYjRhVHptTVZyMkMrRExnemVJVW94bTEwUEFI?=
 =?utf-8?B?Y3JMTTFZOEVieTB3VzIzdCtwQmJISmdnNmdPUEtuRDhQOU1JLzhJMXVQYUYx?=
 =?utf-8?B?U1pIVjdkWkJwTlJDUHJmeEkxYTgvU290VHlaNVE1ZmUyUWN0UWpXNE1QcnJN?=
 =?utf-8?B?bnBObFlwZ3pXTUNIUm5RMlJ3YnM4Q3VKYkVMblZ2YTdOcTBzWmxTdEdYRnB3?=
 =?utf-8?B?WHNBcFUwc2g1bkxHV2VoZExGaXl0L0ZRbEpCZHNybFVKYTl6MWpFY1dZZ1Uy?=
 =?utf-8?B?akRnaFR5aXhzZWRhOEg2Um1CbGJCSE11eVdmWEZkQXlnbkRvaFFJTVhvOENs?=
 =?utf-8?B?NjlLV3JrMlpUc1U5ZG1RSmVVWWUxRjhJdXR1Y3NSaU5zWUhUU2JRajBnNjNi?=
 =?utf-8?B?U29nbFZEbnJhVWhXUm9xT2x2NVM3czZseVRnQkpTTHc3TVV0ZXowTUdZcE0v?=
 =?utf-8?B?U29pYUpHc2xUYkphcmdwQ0l0QW1EZ0lPY3pOQlNtSjFTeHp5dC9GdmNCcnhG?=
 =?utf-8?B?Q2UydHhkREI0QVVMR0JQMkJQWkF5TDNNKzVTeGtNbUNjUjVRakxCbkh0aEJV?=
 =?utf-8?B?NHZxakt3ZmduL1RVOUs5L21RZTFuTTB2NEpxU2g1UUdBc05LYWhYc0ZRYUIw?=
 =?utf-8?B?YkZrRU90OWgyRDVXZ3FXeTlBM1JXWEJ4Q24xVnZnKzlYKzZ6cjlKbkpXSjVk?=
 =?utf-8?B?UDdsT3ZDeGxtV1Y5WnJjczFPUHQzYnNEK2N5MUoyNUZmRllONXppOW9CS1FR?=
 =?utf-8?B?eTdNL1orNkIvSyt5OHVlK2I2SGc0eWxvK2hrRGRlRnlrZWdkbWFISm9yRTZ4?=
 =?utf-8?B?SkVCN0dsRzAzVzVhL0laVXJSWUxxY2RPZEl2T2ZVS0lNRUVPbnF2Yy9NODVj?=
 =?utf-8?B?RnQwOE40UnQ4SDRiOGEzeEY3K1dCWFNmbW8vTCtrY0N0SEdUTVp6VDFPcnZ0?=
 =?utf-8?B?VTdKU3ZtQ0hDMGxDaG8wSi9WeUx0Zk1XQ0dTanBEa1dzRkI4WE9hdExtZXY4?=
 =?utf-8?B?aDFrQVZ1TXI4azJaa2Juejl2WTNUaGFYcU9hTUJaYUpLTDZWOHlNM1hha3ZC?=
 =?utf-8?B?YWhEeENJSEFGRUhXb0N1YndLeDNjYWRreHNzRkE4TThQOUFmMSswZzlKVGs5?=
 =?utf-8?B?bEpVMXFMeUcvNW43Mml5dVYxamxCZ1JOSERQVEE3R2c3ZjBFdWlFWWxseUZO?=
 =?utf-8?B?VWN3cXV0WkFxZlFuZXFGcmY5eFd1aThpRjRabEkzYURhdXhybWxCOFV3ZkZP?=
 =?utf-8?B?SVcycjBWVGxra2NjaUlKdnBqNUllMGNEUmd0R1dmZE1zM3ZSamxjUmNiQ1Nq?=
 =?utf-8?B?clJRZWJlUXQwYndRblBYM1JhTEZKQUUrTkNqeHBtK1A0N2wyODdtWElBZTM3?=
 =?utf-8?B?L2h0YmZsejRkN0xvY213djhTL09VZGZWUXJnd3c2MXhjWHpHV2xkRE9FRW1S?=
 =?utf-8?B?WmIzK0h1RjhVR0JwSFNqWTZjSDJLbUJPZVQ4WnN5MTNHM1NRYXkyZnppNzk2?=
 =?utf-8?Q?hPEmYZavqrkBjvlWvD3Gsvy9c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de9d76a-acd1-46ca-bf44-08dca65eee62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 12:49:43.8494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9x/zc5MMt3s95UtUoB49FYZEMH44Xudo6r21o/pjbedk0qUqh5sousSneT1aWzyNw59lougihn+TpNsQ+eVag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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


On 7/17/2024 2:28 PM, Matthew Brost wrote:
> On Wed, Jul 17, 2024 at 05:21:33AM +0000, Akshata Jahagirdar wrote:
>> Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
>> layers can utilize. This patch will be used later on when doing bo data
>> clear for igfx as well.
>>
>> v2: Moved 2 bool arguments to a flag argument
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
>>   drivers/gpu/drm/xe/tests/xe_migrate.c |  8 +++----
>>   drivers/gpu/drm/xe/xe_bo.c            | 10 +++++++--
>>   drivers/gpu/drm/xe/xe_migrate.c       | 32 ++++++++++++++++++---------
>>   drivers/gpu/drm/xe/xe_migrate.h       |  3 ++-
>>   5 files changed, 37 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>> index e2e0ea24757a..c6db62a07276 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>> @@ -35,7 +35,8 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>>   
>>   	/* Optionally clear bo *and* CCS data in VRAM. */
>>   	if (clear) {
>> -		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
>> +		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
>> +					 BIT(2) | BIT(3));
> Use defines everywhere. e.g. s/BIT(2)/CLEAR_BO_DATA_FLAG
>
>>   		if (IS_ERR(fence)) {
>>   			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
>>   			return PTR_ERR(fence);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 4929af88e75c..ac52bc4d2c51 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -104,7 +104,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>>   	}
>>   
>>   	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
>> -	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
>> +	fence = xe_migrate_clear(m, remote, remote->ttm.resource, BIT(2) | BIT(3));
>>   	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
>>   				 "Clearing remote small bo", test)) {
>>   		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
>> @@ -278,7 +278,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>>   	kunit_info(test, "Clearing small buffer object\n");
>>   	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
>>   	expected = 0;
>> -	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
>> +	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, BIT(2) | BIT(3));
>>   	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
>>   		goto out;
>>   
>> @@ -299,7 +299,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>>   	kunit_info(test, "Clearing big buffer object\n");
>>   	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
>>   	expected = 0;
>> -	fence = xe_migrate_clear(m, big, big->ttm.resource);
>> +	fence = xe_migrate_clear(m, big, big->ttm.resource, BIT(2) | BIT(3));
>>   	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
>>   		goto out;
>>   
>> @@ -598,7 +598,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
>>   
>>   	kunit_info(test, "Clear vram buffer object\n");
>>   	expected = 0x0000000000000000;
>> -	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource);
>> +	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource, BIT(2) | BIT(3));
>>   	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
>>   		return;
>>   	dma_fence_put(fence);
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 31192d983d9e..22b16a0006c5 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -793,8 +793,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   			}
>>   		}
>>   	} else {
>> -		if (move_lacks_source)
>> -			fence = xe_migrate_clear(migrate, bo, new_mem);
>> +		if (move_lacks_source) {
>> +			u32 clear_flags = mem_type_is_vram(new_mem->mem_type) ?
>> +						BIT(2) : 0;
>> +			clear_flags |= mem_type_is_vram(new_mem->mem_type) || handle_system_ccs ?
>> +						BIT(3) : 0;
>> +			fence = xe_migrate_clear(migrate, bo, new_mem,
>> +						 clear_flags);
>> +		}
>>   		else
>>   			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
>>   						new_mem, handle_system_ccs);
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index efd64af4f8cd..da06b434b9eb 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -518,15 +518,15 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>>   #define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
>>   
>>   static u32 pte_update_size(struct xe_migrate *m,
>> -			   u32 flags,
>> +			   u32 pte_flags,
> Looks unrelated.
>
>>   			   struct ttm_resource *res,
>>   			   struct xe_res_cursor *cur,
>>   			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
>>   			   u32 cmd_size, u32 pt_ofs, u32 avail_pts)
>>   {
>>   	u32 cmds = 0;
>> -	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
>> -	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
>> +	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & pte_flags;
>> +	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & pte_flags;
>>   
>>   	*L0_pt = pt_ofs;
>>   	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
>> @@ -1032,14 +1032,19 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>>   				     is_vram);
>>   }
>>   
>> +#define CLEAR_BO_DATA_FLAG	BIT(2)
>> +#define CLEAR_CCS_DATA_FLAG	BIT(3)
>> +
> BIT(0), BIT(1)
>
> Also since this is a public function, define these in xe_migrate.h.
>
> Since public define, probably normalize too (see xe_bo.h XE_BO_FLAG_*).
>
> So...
>
> s/CLEAR_BO_DATA_FLAG/XE_MIGRATE_CLEAR_FLAG_BO_DATA
> s/CLEAR_BO_DATA_FLAG/XE_MIGRATE_CLEAR_FLAG_CCS_DATA
>
>>   /**
>>    * xe_migrate_clear() - Copy content of TTM resources.
>>    * @m: The migration context.
>>    * @bo: The buffer object @dst is currently bound to.
>>    * @dst: The dst TTM resource to be cleared.
>> + * @flags: flags to clear_bo_data and ccs metadata
> Mismatch variable names flags & clear_flags. CI hooks is complaining about this.
>
>>    *
>> - * Clear the contents of @dst to zero. On flat CCS devices,
>> - * the CCS metadata is cleared to zero as well on VRAM destinations.
>> + * Clear the contents of @dst to zero when clear_bo_data_flag is set.
>> + * On flat CCS devices, the CCS metadata is cleared to zero with clear_ccs_flag.
>> + * Set both, clear_bo_data_flag and clear_ccs_flag to clear bo as well as CCS metadata
>>    * TODO: Eliminate the @bo argument.
>>    *
>>    * Return: Pointer to a dma_fence representing the last clear batch, or
>> @@ -1048,18 +1053,23 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>>    */
>>   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   				   struct xe_bo *bo,
>> -				   struct ttm_resource *dst)
>> +				   struct ttm_resource *dst,
>> +				   u32 clear_flags)
>>   {
>>   	bool clear_vram = mem_type_is_vram(dst->mem_type);
>> +	bool clear_bo_data = CLEAR_BO_DATA_FLAG & clear_flags;
>> +	bool clear_ccs = CLEAR_CCS_DATA_FLAG & clear_flags;
>>   	struct xe_gt *gt = m->tile->primary_gt;
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
> I'm not familar enough with this code to know if this change is correct...
>
> I'd check with Matt Auld or Thomas (but he is out for 3 more weeks),
> don't feel comfortable RBing this one as I'm unfamilar.


I suggested to pull this patch here from 
https://patchwork.freedesktop.org/series/135743/ as 1st patch of this 
series

is doing what I did in patch 2,3. Now, I think, it is not so relevant to 
this series if this has to be the last patch.

Akshata, I see all your patches are reviewed so  feel free to remove 
this patch from the series to unblock your series.

I will pick up from here and wait for Thomas to get back or when Matt 
Auld to gets free cycle.


Regards,

Nirmoy

>
>>   	struct dma_fence *fence = NULL;
>>   	u64 size = bo->size;
>>   	struct xe_res_cursor src_it;
>>   	struct ttm_resource *src = dst;
>>   	int err;
>>   
>> +	if (WARN_ON(!clear_bo_data && !clear_ccs))
>> +		return NULL;
>> +
>>   	if (!clear_vram)
>>   		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
>>   	else
>> @@ -1085,7 +1095,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		batch_size = 2 +
>>   			pte_update_size(m, pte_flags, src, &src_it,
>>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>> -					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>> +					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
>>   					avail_pts);
>>   
>>   		if (xe_migrate_needs_ccs_emit(xe))
>> @@ -1107,13 +1117,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
>>   			xe_res_next(&src_it, clear_L0);
>>   		else
>> -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
>> +			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
>>   				 &src_it, clear_L0, dst);
>>   
>>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>   		update_idx = bb->len;
>>   
>> -		if (!clear_system_ccs)
>> +		if (clear_bo_data)
>>   			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
>>   
>>   		if (xe_migrate_needs_ccs_emit(xe)) {
>> @@ -1172,7 +1182,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		return ERR_PTR(err);
>>   	}
>>   
>> -	if (clear_system_ccs)
>> +	if (clear_ccs)
>>   		bo->ccs_cleared = true;
>>   
>>   	return fence;
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>> index 453e0ecf5034..0d19bfe02a23 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>> @@ -104,7 +104,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   
>>   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   				   struct xe_bo *bo,
>> -				   struct ttm_resource *dst);
>> +				   struct ttm_resource *dst,
>> +				   u32 clear_flags);
>>   
>>   struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
>>   
>> -- 
>> 2.34.1
>>
