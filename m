Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0B7FF8862
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8A110E2C8;
	Mon, 27 Apr 2026 19:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3GIElmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8310E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 19:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777318473; x=1808854473;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xMvLfGCuyJ9h7IoP5+tRtOw67aa1HuKls1ULIPNS0Dg=;
 b=k3GIElmPTfqcARY5yn/WbDLJ+BjfoVLE3SRfxPNj7MlifpvCBJ4rMw8u
 V8I2fjYczXgBeHm25rNPUgeJG4s2gziEgvkFN7PsWPrJs3dE9OSleAofd
 NxOobnnxTYbn9DHrh0H1WJHCvEcPpyCjXaao0FvY1KFbVqPy6HmDSrpDd
 JCIisiPFayeae8jghf8kxxf5HkDM49P6a+9sA8M+bVOnoJTwb4uC1tSCf
 l1Cc8cjXi2ThcNrt9zLA5lhroFbv+6LbwDtHrrQzksFMlxBcmq6pv1rni
 0P2fduFp26czjLvGXKSkNe2VHN7m3iwHOpyne3rrMsLrwLe7ij6wsUVze g==;
X-CSE-ConnectionGUID: 7eDjwGyCRMC8txjdZiiamA==
X-CSE-MsgGUID: ezKqLvxaSRSfr0IHlJGMlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88915871"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="88915871"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:34:33 -0700
X-CSE-ConnectionGUID: fN9YLlJDSZGKvd2aWe1Weg==
X-CSE-MsgGUID: Ccsis9+iSsikLNOC9jzu9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="235485767"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:34:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:34:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 12:34:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:34:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6/XuA6OBFWq+SM88zi9sry9LmDNSeKY3oIJKGqBRFp/9UoXZss9FEWzm44Us2SpHkv27I3JaHP4uNscXSoUHDfrfJL3cggLyvDfDqXvSiL5rRwu0gwl28s++3jQvhuzxoRUej6p3ibCUDcn0PWhapN5Qp2y62dT4Jq1j17iTo3ZozJZSST8EL7lJZxqoBzVK9U57wmEbkvvDosSx/UMDwBcqiUJLHVd+17MspvlHKJlDAos6dkDigESjMsAjTKmIZem9MJ5OQYroDYtgTWjUENuWjTCxido2QwZr4410IZMnncHfDaF5e9foYUojGNBbUYRuGoHgeNtqHXy28C2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z4mX8/XK8koVD7an+12VSjEXTdCtL3woDwols9QKHo=;
 b=X4N4zaKm99CRpPkJ4dFlb0lU+uSpBUYLGoGeUdOLlPqukbMUwvPhKVAMOPDcuTf0ILYT6Jf2/fMsJ6dIm2C5wjKVuhyWg7t76MpCmJjJL6geQRbx1xfHXXPuA32kr/HhBZC7eJREFuNaZnMjl98WndPACYJQoKS38gTYug07iAvTN2nOs/Jk8IIP/1fidrKj4D6/AnfM8K3C3XVcCxsZsNiG4mS9wVm5QsYWc2i1QNA1s3yzyJ4PH7guad3EkTZ4D4BMVAiQEMvOkZxCt8EEYshxbZhf1i+rNbJKf0GABoIDW4WMe3/j78pJYvmxCLGZLqbbBdcB8IrXJj8GTYYDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 19:34:30 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 19:34:30 +0000
Date: Mon, 27 Apr 2026 12:34:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Message-ID: <ae+6QHAIkmTw+Mvx@soc-5CG1426VCC.clients.intel.com>
References: <20260427190223.2487665-1-ashutosh.dixit@intel.com>
 <20260427190223.2487665-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427190223.2487665-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:303:b8::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 5327c469-5331-4ec3-9d12-08dea494002c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: AougQyg3mGelqiE4oMvxAKsGW2c2oQfdXzXneL8Ou19XF7HQEGN6Jtd186AjobOYuX4cHpRrnoLdinHkUYylONtq6X4RW7clShP1OwX1ly1R9XWEC0Sf1KHoWMm85BAJpTymypz2JhM3Xr2wbLFj9cahm2ocXCCkzLxdBSmwBG9v/y1iwUS4+EI+GvFKJWVtQP2+TCeXnU6yRaG+rYOwLupWs2uLkz1bqrAAA8jEWQn4cdL9T5GiONo4Hv4O/wmaVs2RSbjy4jQ0F6CfIbew3/zBcpj+i2BBzJHt8iqDmSk69PNv1JJwy4BwFUHKeVa9uvAguKyLVJOCUenG6578D5o0bY4OqAPqNE+GKcLc8Hb7nD8MpQsjc2uXUxSHVdoCe9egCL/HZSM4w6F5A5oqrkQ2FeKs41cK7akdkLahAyWnglEYSsk5ok0iYzCOTLRQl42fIYZEfpWccXa/vqu7s9pLLUI6oVwkpaxuKs5UMPDJTRkVdvfjKrCH9xJR2VHYkWLaOJk8/O7tsHqnQYEgEAYMd0vdBRrUIFNoIEhM2bHZphVo9x7UNu4ZrLoIvuILjC0MqvClWumi/XZRFAcHNhwejqOa+0UPPo5v7WBWfriKrrP8Wnz1S0Py4NwZwEhUfoTdQMEvegFJmhiaHD6hE7fIqeA+7kGKNCt2U2h4Ku6eyY6Rmu68Z0LUHrUDx05aCx/AyxMVKsGPmjGEyU/qv81MVFpjoZeIthPdZv77HWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkNDZDhURElvWklkaWVIL1hGRHpZYnh0cklmNVdJUnRPc3NqTG9QYXBVQnNp?=
 =?utf-8?B?UXJ6QXlhYUdKa1hTU3VWMFJabFF0MzFYbkVjdkJZVEpxZXMwaFp5d2pPWUZU?=
 =?utf-8?B?d3hzVXFMU3ZEZFJVNldvS1hoRS9LWmZSTFVDdytIYU5mVkVOZllwNzhFd0Js?=
 =?utf-8?B?NE1tM2doc2V2eXNnU01VeFpvSUlOLzM4SFg1MlZra1FoaSszQXJrMXFDNnpo?=
 =?utf-8?B?UVp4SDZxQlA3cVJFb1ptY2RqK2J2ZXJaM0hiTm9wZ0UwRFRjV3NQMG9xNkNI?=
 =?utf-8?B?aEJyQ2dXeTFtVlZmSENQQmtHaVVGbFpEMkxRcTNxNCtPbVRTd3phdUtNVlVR?=
 =?utf-8?B?QmUwc0VibzVTNmZIUzBNNDZodG8zVDJPeGZURHpJYmQ5czJWMjFSRENKbVZE?=
 =?utf-8?B?MXVDVEtUOWZHeDA1WTdDdG5LT3NOZWFja2NSbTc3bGtSTHJaVlQ5SkFVbDRX?=
 =?utf-8?B?WHJuVEhhNkVOblEvVlhyd2RaMHNPbkxaY1RYclI5aEpuU0QzTS9FTmRyRGFv?=
 =?utf-8?B?OTBQRlVKRzhTMmlCV0drc1NjZ05UelUxdGg5M1ZhQ3poWFlxZ1R2UXB6UWth?=
 =?utf-8?B?NUkvUXhXL1ZJayt5Q1pPeU56YzROYU1NcUNxR3loQU1yNG4xVkNqd3JWZlE4?=
 =?utf-8?B?aGpML0doTUVpb29ZOUVkSUxscDFQTndNcmpPSWNUcjJ0eklhUWJ0Ykp4SVY4?=
 =?utf-8?B?NTVLNEIvWGZxdmxUQ3ZabVVIa3VIekE3RDlVbkdwVE8vdzVPNmh5cnl5amRm?=
 =?utf-8?B?TkIvcnJXL2g1ZEhXM2NDdVdZZ1p5K1ZSM3MyNVVaMG41QjNBSXR5SE1RTnpS?=
 =?utf-8?B?d09VSlFqVm9iUnd4Wi9NMGhxemtUTmhpSlR4UnIwME5mZ1dMUnpLcTN6ZWd4?=
 =?utf-8?B?elYxNWRmTlh3NHcvWkFLZmFJR0p4R0JRMW4wSEFsTmxKNWc2L2hZSmVmdVBz?=
 =?utf-8?B?T0FBeEhqVGZVWWRrOE9PQWFZa3c0K0xjRytscGRxZXZvVDhDSDQ4SFhRTnR3?=
 =?utf-8?B?eCtDQjJyM3VQSFNScDhVTTVZV01rQnc1VmZmaEYxSkRxeHZOQUF1ZmVoemVC?=
 =?utf-8?B?U0V4ZDh3L0w5bFhWdXlkS1lDRmxzZGIxbXg3dzgvZ2J5MFdzR0tVWHozZ05D?=
 =?utf-8?B?YVVOQmVjd1hIN1RXcWtUcUF2dDM4bjdZa1J2L2IrZjNHTnVocW01NitVVnFs?=
 =?utf-8?B?RXRiUWRuWWxwSkJZZXdmOERrNnNLOGswNDZ1SEYydVZ3YU1FZExUNEgwTHJy?=
 =?utf-8?B?MVBqWEtpSjdPY1NZY3AzalN0aGV3V25FZlptaGUyNjJtb1ZxUE9FaWF0N2Nx?=
 =?utf-8?B?TzZtRnRhL0hMeXlOQS9zUFFKcHZEcTJoS2M2TTJTcEQ5VUt6S3hzbGJnc0hu?=
 =?utf-8?B?aFUrYmRZdlYwWVBuT0pIS2tKeTNJTnBiUUdPZUJENFdBNFEwSUpmNWJsRmtC?=
 =?utf-8?B?amd0KzJ0M2t4OGtqM3U3aEJBY3c0Y0NLNE1iSll6eFVhbisycWZaNVAwM0Jj?=
 =?utf-8?B?OTd1ZkMrRGllV0NkVmQ5Skw2VFVudnhOVDN5bThndUtBbVVIZGRNeTZXVWxP?=
 =?utf-8?B?MWRmeUJEZ1pReUNWRld0UmlZRGI4VTl1QmtoOUNhT2pNeWJnMUlQZDlXZVpC?=
 =?utf-8?B?Q1o3cFRBNE1TV2NXa2ZVZmdYRmFVV1QvTWdJVWtvWW1jekVMMFpZRTVrODlM?=
 =?utf-8?B?MjllN1VIRXFuRmZaRUZqMzdTb1dDWGx4N3RKaGxRTFh1V2ZocHNOcEphbWZ2?=
 =?utf-8?B?WlhMQWs1YTFFVERIcjkrL2x1SGpIWG1tb3JMa00xZ0c3RXdnZ1V6N1pkYzI0?=
 =?utf-8?B?L2F5a3YzZjNvSXo4WnZUR1o2VFRJMGtIK2NsYU1QcWdqb2sxTG9QTlNyTUo2?=
 =?utf-8?B?Qy96eE1wQlBZVkRCWVBnU3g5QklZSUtyb1JCd0FpSnF6ZWhwb2Fsa1AyTWli?=
 =?utf-8?B?T3FKTVR5Yzd3V1R0aXNYOUY4OG9TblBZZlU5TWhuNG5MdXZMaGpBNEQxU2hj?=
 =?utf-8?B?OUt4eWZDRGJwWVIwS2U3aWtsQ3Z0RE9TRDZ2c2hvOHZvWXdXd3U4aGRadnFk?=
 =?utf-8?B?dTJadlZMZlh3LytRMDJkaEVEOXdkK0ZJSkd4aWMrNDRXbDBFVGRHYk1RSU54?=
 =?utf-8?B?TGppOXJnMUlmZ1NVeTlLTnVmM0Z2eXhOSjNoVllqeHpNTTY2NWFGZ0tiTCtO?=
 =?utf-8?B?TmtoL2V6ZXVGTTJGd1pFZnlJZjJEUktCdGZWZktidHFKaGZ5aU9NeHhpR1Vh?=
 =?utf-8?B?MW9rVlBOT0dzeFFSOUUyMGo3cVZwUDl2R1Zkd2JTaVBleENFalA2RE1YTlJH?=
 =?utf-8?B?RHZjU0xHVXl3V09Tc0dLVEM0Q0t2MmJoZDY2U1FtNjV1VERUaC9QRVk3aW90?=
 =?utf-8?Q?ldjf+CLw9Vg9U3xbJepri7ugGHETuxUA9E3St?=
X-Exchange-RoutingPolicyChecked: g03qqDyBERewcyXn7fzPgyGZT0hhFPyWsxozRXMVN/NIJ8zmhZYKQVPA6TM3n+uNdl4RYR8ClbI+pzXuQN9auuVVBd8cZrkJRWPLH2hmCa5AzSbiRHvupS9y+YDpS1LuLCb/b61v/9vG+QfqwGNLcO1UlTC4Xn4Cyfz9FwIz8XDBCXMBvwNujLpCcyB60u2ifRKmLq9ta79nVTi9Iow8j5/g31ogPyDZkVTBIabTtBuJyut52fLLJf+u9+Qd9uCyFMQ37pjINgSlopz70ObFygIfvjzjwpeDWvtJ7lDSgwQD7pJ7UDoM967KxR7heB4spuEpIucX4S9T2Mhcf6tSKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5327c469-5331-4ec3-9d12-08dea494002c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 19:34:29.9398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AeyVfncL0ON6Uao3GaU0ZaZJSmCp8s+iYeFGJd4W0GLUwMHZMZyBswHS/JtIW/8zb2B4PYLPVsjFatRL4JO8qlEmkbte2C+48oalrRw3sU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
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

On Mon, Apr 27, 2026 at 12:02:21PM -0700, Ashutosh Dixit wrote:
>OA code should have used xe_map layer to begin with. In CRI, the OA buffer
>can be located both in system and device memory. For these reasons, move OA
>code to use the xe_map layer when accessing the OA buffer.
>
>v2: Use xe_map layer and put_user in xe_oa_copy_to_user (Umesh)
>v3: To avoid performance impact in v2, revert to v1 but move
>    xe_map_copy_to_user() to xe_map.h
>v4: Use bounce buffer and copy_to_user in xe_oa_copy_to_user
>v5: Fix offsets in oa_timestamp() and oa_timestamp_clear() (Umesh)
>v6: Rename head/tail in helper args to report_offset (Umesh)

Thanks for renaming. My comments are in the v5 version of the series.

With an assert/check in the xe_oa_copy_to_user(), this should be

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 95 +++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_oa_types.h |  4 +-
> 2 files changed, 58 insertions(+), 41 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 6337e671c97ae..1fff0e8e9e78e 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -213,32 +213,40 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
> #define oa_report_header_64bit(__s) \
> 	((__s)->oa_buffer.format->header == HDR_64_BIT)
>
>-static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
>+static u64 oa_report_id(struct xe_oa_stream *stream, u32 report_offset)
> {
>-	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	return oa_report_header_64bit(stream) ?
>+		xe_map_rd(stream->oa->xe, map, report_offset, u64) :
>+		xe_map_rd(stream->oa->xe, map, report_offset, u32);
> }
>
>-static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
>+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 report_offset)
> {
>-	if (oa_report_header_64bit(stream))
>-		*(u64 *)report = 0;
>-	else
>-		*report = 0;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	oa_report_header_64bit(stream) ?
>+		xe_map_wr(stream->oa->xe, map, report_offset, u64, 0) :
>+		xe_map_wr(stream->oa->xe, map, report_offset, u32, 0);
> }
>
>-static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
>+static u64 oa_timestamp(struct xe_oa_stream *stream, u32 report_offset)
> {
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
> 	return oa_report_header_64bit(stream) ?
>-		*((u64 *)report + 1) :
>-		*((u32 *)report + 1);
>+		xe_map_rd(stream->oa->xe, map, report_offset + 8, u64) :
>+		xe_map_rd(stream->oa->xe, map, report_offset + 4, u32);
> }
>
>-static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 report_offset)
> {
>-	if (oa_report_header_64bit(stream))
>-		*(u64 *)&report[2] = 0;
>-	else
>-		report[1] = 0;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	oa_report_header_64bit(stream) ?
>+		xe_map_wr(stream->oa->xe, map, report_offset + 8, u64, 0) :
>+		xe_map_wr(stream->oa->xe, map, report_offset + 4, u32, 0);
> }
>
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>@@ -275,9 +283,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> 	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
> 	 */
> 	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
>-		void *report = stream->oa_buffer.vaddr + tail;
>-
>-		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
>+		if (oa_report_id(stream, tail) || oa_timestamp(stream, tail))
> 			break;
>
> 		tail = xe_oa_circ_diff(stream, tail, report_size);
>@@ -311,30 +317,35 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
> 	return HRTIMER_RESTART;
> }
>
>+static unsigned long
>+xe_oa_copy_to_user(struct xe_oa_stream *stream, void __user *dst, u32 report_offset, u32 len)
>+{
>+	xe_map_memcpy_from(stream->oa->xe, stream->oa_buffer.bounce,
>+			   &stream->oa_buffer.bo->vmap, report_offset, len);
>+	return copy_to_user(dst, stream->oa_buffer.bounce, len);
>+}
>+
> static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
>-			       size_t count, size_t *offset, const u8 *report)
>+			       size_t count, size_t *offset, u32 report_offset)
> {
> 	int report_size = stream->oa_buffer.format->size;
> 	int report_size_partial;
>-	u8 *oa_buf_end;
>
> 	if ((count - *offset) < report_size)
> 		return -ENOSPC;
>
> 	buf += *offset;
>
>-	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>-	report_size_partial = oa_buf_end - report;
>+	report_size_partial = stream->oa_buffer.circ_size - report_offset;
>
> 	if (report_size_partial < report_size) {
>-		if (copy_to_user(buf, report, report_size_partial))
>+		if (xe_oa_copy_to_user(stream, buf, report_offset, report_size_partial))
> 			return -EFAULT;
> 		buf += report_size_partial;
>
>-		if (copy_to_user(buf, stream->oa_buffer.vaddr,
>-				 report_size - report_size_partial))
>+		if (xe_oa_copy_to_user(stream, buf, 0, report_size - report_size_partial))
> 			return -EFAULT;
>-	} else if (copy_to_user(buf, report, report_size)) {
>+	} else if (xe_oa_copy_to_user(stream, buf, report_offset, report_size)) {
> 		return -EFAULT;
> 	}
>
>@@ -347,7 +358,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 				size_t count, size_t *offset)
> {
> 	int report_size = stream->oa_buffer.format->size;
>-	u8 *oa_buf_base = stream->oa_buffer.vaddr;
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
> 	size_t start_offset = *offset;
> 	unsigned long flags;
>@@ -364,26 +374,24 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>
> 	for (; xe_oa_circ_diff(stream, tail, head);
> 	     head = xe_oa_circ_incr(stream, head, report_size)) {
>-		u8 *report = oa_buf_base + head;
>-
>-		ret = xe_oa_append_report(stream, buf, count, offset, report);
>+		ret = xe_oa_append_report(stream, buf, count, offset, head);
> 		if (ret)
> 			break;
>
> 		if (!(stream->oa_buffer.circ_size % report_size)) {
> 			/* Clear out report id and timestamp to detect unlanded reports */
>-			oa_report_id_clear(stream, (void *)report);
>-			oa_timestamp_clear(stream, (void *)report);
>+			oa_report_id_clear(stream, head);
>+			oa_timestamp_clear(stream, head);
> 		} else {
>-			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>-			u32 part = oa_buf_end - report;
>+			struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+			u32 part = stream->oa_buffer.circ_size - head;
>
> 			/* Zero out the entire report */
> 			if (report_size <= part) {
>-				memset(report, 0, report_size);
>+				xe_map_memset(stream->oa->xe, map, head, 0, report_size);
> 			} else {
>-				memset(report, 0, part);
>-				memset(oa_buf_base, 0, report_size - part);
>+				xe_map_memset(stream->oa->xe, map, head, 0, part);
>+				xe_map_memset(stream->oa->xe, map, 0, 0, report_size - part);
> 			}
> 		}
> 	}
>@@ -436,7 +444,8 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
> 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
>-	memset(stream->oa_buffer.vaddr, 0, xe_bo_size(stream->oa_buffer.bo));
>+	xe_map_memset(stream->oa->xe, &stream->oa_buffer.bo->vmap, 0, 0,
>+		      xe_bo_size(stream->oa_buffer.bo));
> }
>
> static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
>@@ -699,6 +708,7 @@ static int num_lri_dwords(int num_regs)
> static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
> {
> 	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>+	kfree(stream->oa_buffer.bounce);
> }
>
> static void xe_oa_free_configs(struct xe_oa_stream *stream)
>@@ -889,9 +899,16 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
> 		return PTR_ERR(bo);
>
> 	stream->oa_buffer.bo = bo;
>+
> 	/* mmap implementation requires OA buffer to be in system memory */
> 	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
>-	stream->oa_buffer.vaddr = bo->vmap.vaddr;
>+
>+	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
>+	if (!stream->oa_buffer.bounce) {
>+		xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>+		return -ENOMEM;
>+	}
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 8906c3084b5f8..3d9ec8490899c 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -164,8 +164,8 @@ struct xe_oa_buffer {
> 	/** @bo: xe_bo backing the OA buffer */
> 	struct xe_bo *bo;
>
>-	/** @vaddr: mapped vaddr of the OA buffer */
>-	u8 *vaddr;
>+	/** @bounce: bounce buffer used with xe_map layer */
>+	void *bounce;
>
> 	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
> 	spinlock_t ptr_lock;
>-- 
>2.54.0
>
