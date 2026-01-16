Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C254C98306
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 23:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2D910E009;
	Fri, 16 Jan 2026 23:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xccvx7Wc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83E210E009
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 23:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768606181; x=1800142181;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OdjOYnnHeCqsWR/drXm+VMN8QiRaUcDdyQ36oTXWIo4=;
 b=Xccvx7WcSY5KFLovgztTaySUJQstPMgpfkcSXcEHQ492hayuG7x3x2xO
 hlP14GaTrxhqOvfq/ZrCNoNdd382R7FEYZeDTNDqr1dZ+A7OJ7l5DyT/D
 YOXzRGJCg4rWZj37DronK+Q7A4KI8ofyC1iBtaAW9Cl6PLyOkXMyPqCcm
 yMkQCXADnEBC8+j/FGLYU2G6ibuXabHk5yCaSogyDZgq0HTyi6Jm0auBF
 nWGrcUGN2Umf7LOdjvjIjbWj8zFqoKUA+BAOE4jyMtlQCtTeo1ulpo++U
 p9kuz0dTsDbHeiWDgXrq+nEiu3DXwSY2V1nqb5C6rV5XaVrYwxBUOhUgs A==;
X-CSE-ConnectionGUID: XuCbg9MhQSuAT8Pn7lYt4w==
X-CSE-MsgGUID: lhk4pYZlSB6r8AZ8HtCLQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69975750"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69975750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 15:29:41 -0800
X-CSE-ConnectionGUID: OtEcyzhTRQCHrZilJONg3w==
X-CSE-MsgGUID: SkwBpQaqTj23rqIGqn6CDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="228363621"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 15:29:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 15:29:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 15:29:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 15:29:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuoZeH0SwsNL/C6pa2IXRz6WFMPtgjesp0axLVFc28nA0MnHb6BNrovm2d3NSBXdFDL4k5aho/4aoKtDq11HcyWzuGUGus36WUgbtNQjP3N7FOLh6K00plNzqKb7KrqxzPvniXEMuHYFGlhuFuQqDl3vjv3YRLuRz6vQeZsn4DgtIZqMhojht5DVgHw1PTEH9ENguP5etVPJQjWmM9ui2d1D0ZtqFdBO6/E0SCTYCkacmQMxVDD+uOXl/1unqIDQG4FbH6WK4RDP2yFPxbGJgl0KG04N6i/fLBO9haFX2EpRQUHcrIyiw0vRQUdbpRbR1ldG573+t3DhtoQd2xnScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5VtwcvaKvDUr7MA8kwMVPZKBG0Yk2v72fI0OTHvwY8=;
 b=vf/QWQckule7PMh+AxYY8J5k7MbO0fGepdbCf97aBIle6JTBRyPXJm/QzDUOkHULNZ69gMh+tDIdXFAfqdjeJvJvl704KL5J01vP1W3WNDmsbbak0sLy9aTLJBl4shOFE19FKE8bGmIWGw/A14ZSDoP0MtYOWMAO73kwM2Dchj7Wu9xwHe6jLqprXby1FArbmPLhhZYQkQ9V1kidJhkKUBEI1iKcp9YWqzyR047Rv+GhWKuYP9z7lKvms5Fd0xhuqqH0v7f33zoq1B2mWvnUH3aRlAOMirWbrvGJtIdToZcKSVrRq/WpIF38VkR08Uy9nypyZxcJH/Izl9s1MxS6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7428.namprd11.prod.outlook.com (2603:10b6:a03:4cf::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 23:29:38 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 23:29:36 +0000
Message-ID: <a16545bb-9f33-4379-92cf-8f79d4838082@intel.com>
Date: Sat, 17 Jan 2026 00:29:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-9-d420b9c1a327@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-9-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0051.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2cff1c-5c3d-4946-5185-08de55571cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUhKdWkzRW12ZlBnVnEyakMwaVVQQjZSb1JKeDNnd1pZM25JOG4zRnc5dkRY?=
 =?utf-8?B?ZElHYmEySVlLRHFRNXZpeU9DRkhBQ2lXTjlRYTRMMFdKd3p2MkVrcHdOdk1L?=
 =?utf-8?B?SUFHUHdVTEJ0U1dFblJSSjJ3VFNxdFN1Ly8wejFhZzBMdzYyUG9ZakhpOE1Q?=
 =?utf-8?B?dUhoTnlSK1o2ZVRVL21QYkFkMXNQVHBpMmdtd2QzN2J2NWlndFZZMnZ1VUc4?=
 =?utf-8?B?bmhTSHNJd3UzNDJsbjgwZ3VDWDROQlRiY3VtWXU1dmVFcE82dW9qcEZDZ1hv?=
 =?utf-8?B?T2l3bjZZR2RGWEpONko1d0pFcXJzR256Y29icTVjOEYvUVhnT3B5Vno4b0cz?=
 =?utf-8?B?RzBUeTJpNnJ2QXRjaXl5ekNkVE9MajFuOGt1djhyMnVGK3ZHUzlYWWlxQThn?=
 =?utf-8?B?cEV4Z2lhNEs4a01ZME1FZHhpelkwekxFWVh6RFgzMFJBdUYxejV3SWhIMzJq?=
 =?utf-8?B?Zm1rTVNya1QxQTB3V1F6bTlCQUpWZmd4N0RGUU5MSUNERGg3Z2d6dU01a3Q4?=
 =?utf-8?B?YnZlV21KVzBCK2E5Y0EwTnc5dVdQVU1KL3VETlVlcUppcm91emo5TG9idkRn?=
 =?utf-8?B?QmxacVRCU1pUSytLWjVQQjJxRjFCcDEveHNpZHc4VXhpNEFPa2IrTSs1anl1?=
 =?utf-8?B?TkczdEpLQ2NqSkFMalo0akMzK0t3L1MyblJLa3hqUTIxYVBDbGZUeEljVWl2?=
 =?utf-8?B?RHpKa3dXS2tzbXFtZTluVVlab2dNWGtoZTVLRFJmZXhram9SaDZ6THR1Mnc1?=
 =?utf-8?B?eUMyMVJwcVQ3QTNobnFINzFjeFJSY2hQZ2lGeEh4VnpKaGZ5Q1JRZ00zT0Rq?=
 =?utf-8?B?NDkxTmltaGlvclRxL3RWUkpMVk5yeVN5cE1QQWs0OE1XVlltRmVhditJRVFI?=
 =?utf-8?B?blI4WDRJTU9lU201YlN6cWY5RzdDZ0Z6bWV0ak9zdnhJUk9pOHFoYVMzVFdI?=
 =?utf-8?B?UjgvSkh5L0hzRmJ6TWJRejZILzhrdm1SaWNtYkUvOFdkOHZpc1NWQXZmMDZX?=
 =?utf-8?B?ZEhJa20xczBDR1RERWM4d1diRnF4b1p0bzhQdEFZZmN3cEw2OEpoaXp4Wkdl?=
 =?utf-8?B?QkhBanpwQU1DSE8zL1BlaHlBTmJ4OHRGckpKU3V0ZnZpOWtpQkhSeDR1MVVD?=
 =?utf-8?B?ODB4VVkyaFVsWjRCM3pzWE1BWHdOb3lxOWlweXBRUzFnUEVaS2cwVU5XRWxi?=
 =?utf-8?B?d01jdHRmVWJGWkpzakt6UGtveHNCZHVmT2QrY0U2NTRpYWJXaG5NR2kzWita?=
 =?utf-8?B?OGhsM0VCR1VMdXFsdlFKeWxjZjZnZC9OR1RwbldWNWtwWTI4Z2V6TmhHTjJ0?=
 =?utf-8?B?S1pleHl1b0RFekVkazdrQlJyb01WQlAzS2ZNT1ZDR0NlTkh3L3VkVVJOQktu?=
 =?utf-8?B?L0dtRUg4TU04YmR4TXlwQ1hoeFhyVFBpYzJWbkNWTEd5M3BPa3ZWNUwyU3l0?=
 =?utf-8?B?QVFhelBkakY2OFBBVjJjQUZvakJieHdOSnEzRy9aU2cxek52dG9VRndEekU4?=
 =?utf-8?B?eFVmZm5tUFQ0YXFUeU1HcWxsYU9acldFV1lSTlZvMTVMd0V1MXNqU2VRWTBT?=
 =?utf-8?B?SmViMzI3UUZjMlFqYnRsQjNCSHdpNnV1VlBNY05neXI2SG9ocGVDUWVERmpz?=
 =?utf-8?B?V1dIWUpUQWtFR2VwV3p3ZzJialFtblhiTmJzTERxU2x1cnF5QTRHczJsL05t?=
 =?utf-8?B?UUhtRzJ4dTlwVG9VbFhvTVA0cUtFZWw1T05waGJFRlovMmdKY0tkZExuNVp6?=
 =?utf-8?B?R1U0OEViR0xvTHJrckZKTzFPVVltMk5HemJpN0JnTnJiOUNNRVJ5anQxVm5F?=
 =?utf-8?B?Q0xHdzFnWk14U0JQOGd2Snhvdm54OTczTmFWay9xcWRYb2JwTVNDTFIvcGhM?=
 =?utf-8?B?Z051c3VEeXZvMDJRbStFTmlhL3hrRkhWSUFJZTR5aWNUMHdiNWdJcTdmN2JM?=
 =?utf-8?B?c3RTckVFS05rVGhoeWROcE51Z1E0MzhaS2RTdmFQVk00RUloQlJCQW4yeEhi?=
 =?utf-8?B?dTlMckVadFd0RFFTbDExNndubWFDK1UxWHJ3NC9lUWFaOHNRR2JjaXpNU1Mr?=
 =?utf-8?B?eUViTjZzTGJDc1pOd1p1UG40OXdsTjVic2VxWndPbFNzK2JLbXppSFVrdzdG?=
 =?utf-8?Q?b5jA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU1zZjVzMjNveWNHL3ZIQmRmYTltZE0yeGZ4bGtQNEVnSWFOWXBNcUhYbXp6?=
 =?utf-8?B?YzZseUYrRWcrR0hSR0lFWFdaLzUxNUxPRnl6V2VxKzFGQStZUWlvdGYya1NN?=
 =?utf-8?B?WWQyUnl0UlNyeHJ5M2VFNFZ0SGgwVTd5UHRuaC8xSWg0ak5rNG16UlBZazR6?=
 =?utf-8?B?WFB6L1NGbUVLemJ4YmladDBnMEQxZnJ5Y3dnaS9kMC9udktFNG9tNC9oeTVS?=
 =?utf-8?B?YmZMUUxBa2lBanhTbTFXTWRQWHVwRkt1cURKc1QzNjJONzMzd05xeFZLMzBK?=
 =?utf-8?B?MDdlNnNyLzNmZ01VeVRDK1pKLzFhYzlpNG1KdXZjek04UkUrRzlJZUtmTFFw?=
 =?utf-8?B?VjY0UzRhOXJGRHp2ZEwzaDhIekZVRTlia1ZlZXgwdmJYRXcwUy9rQWJ5Zm1r?=
 =?utf-8?B?Q0hHQWNnYTlZQ0JwNnNxZlFnZmhTQkNDMHRmSmkwTlBmQWtsUEtwVzZ2V2RB?=
 =?utf-8?B?dStJTGlkU3Awc0tNYnh4SW5zUlVRd1R2YVU5eDBmUDVYQVNCVnFZYWt6NjY4?=
 =?utf-8?B?bklMUHBTbEpXbmRJdk5ad2kxbElwUTFSbCthd3dzRDc4QmwyRk9XTHlhUUlL?=
 =?utf-8?B?NHpTUXdhazRQcVRsei92d1FWSEVQZHRnalZWaVBFUVlMbUE4Qm5MZ3N4dFJX?=
 =?utf-8?B?STBIMHhMUUdYcXJyYU1PaDRzYmdsSmgxWG90VE42ZkxiRnFQdjU4NFN6Vkpr?=
 =?utf-8?B?Y1dZWmNBZEtqUlgxRzN2b3kwZXY0Q1FqVHRpTGpNci82N0NlQXEwUHNVaGFm?=
 =?utf-8?B?aXFkRHd1YUpZcnBHVTFhSHpuSDdQR2dWMS9yOGVXSHVqajQ0ak4yMk1QamEx?=
 =?utf-8?B?Nmg2K0ZhRWl5R0hzVElCeFovbU5VY3h6ZUlJdnNFa21UVGZXeW5sRUdoMysy?=
 =?utf-8?B?VUpjOXNiZjlUK3o0TGVFNXVRV2FwZ09uWVE4SFZIbUhNejdxdTNxY0dKUVh0?=
 =?utf-8?B?N21ya3daemdibmMyUnJUWllzVTluaS9qRVZON0dsREJXNHpHMHhqUGZUN2x3?=
 =?utf-8?B?STVobnBPaE1yNER3cGljd1UwaEhTWDFxdk01SjdnWW15TlY0S3Ayd3ZGaVBR?=
 =?utf-8?B?QlE0VHdyMUM2WmlOYUsxRXpneWUrR2dyN2FwMXEreXpvd21sM2VSTTVxR0hj?=
 =?utf-8?B?cHFRV2QxN0Ivc3pVUmVpcUhGMGU3ZlNUNVQ1SDNHMGt6b2F6SFMzZytpOURr?=
 =?utf-8?B?alZHOUdzOUMxNGw5TVhlK0xld2o2YzR6MEJvV3lFZVJUMWpVOWNWejdYZzB0?=
 =?utf-8?B?c0YzY1NTY0pwRldEcmQ0MlJlSERtOXIxNWpsV0xyYTdwNE1IN1FseTNBc3FE?=
 =?utf-8?B?OGlxc2tXRDZYR2s3Q2ZPMDJtOVJXUDhSTUxsUEc4YitDejBKYzdCS0Y0Sjd0?=
 =?utf-8?B?cUpGN0JrSHl4V2tObFFNWjN4aXZxTlpYOE50QWdzRWdSK2ErdUF1MG5tdHRS?=
 =?utf-8?B?MGFZeFNUamJ2c3lqcXRYMkhRRDhMa0IvbDY3RVdSanFzOXZscWZOMXM1TmFV?=
 =?utf-8?B?bWIwVXp6K3FMVGw0T1pDR2YwOE5xTWx0b1dxYVBRNnBrNTNKaW8xbGROdGg4?=
 =?utf-8?B?UWpsYk0vcDk3bmRuK2FRRjZRUFVpeHJZcks5ck5jZDh3aU1rdFRheEhHaG43?=
 =?utf-8?B?QlZnV2tSY0ZNM0tid3lFZ3JubDAvNTRRN0lURFAzVHRZQ0wrYk5HVFQyVllN?=
 =?utf-8?B?SUI3Q3I1c0tlVDF2dDVqUXM2Z3VhQzM2RlBtT0d0NFduNXR3akNqQkhJSjY0?=
 =?utf-8?B?N2lJS0Y4akY0SnNVUWZwQnNvNHIvL3oyYUtYYzJCbjZjbTZCMVA0cWhSRjU0?=
 =?utf-8?B?SVdxK0JxeWN6S1JJQmNZcmxmTjJjSmZ6TUo4N3lMZytqL2dSdENzNGVCR0wz?=
 =?utf-8?B?OXBCeWt4VkdaWGVZWVllSzcyT0V1VEZ1dHl6YkJvNFgrT1RYS0tEWGN5QWNn?=
 =?utf-8?B?NnZwWituQlJjVnE1aDIzdlp2S3BhRzdkVnRkUTJhVGtzNFdmbVNtQUpOeWZY?=
 =?utf-8?B?Y2ptaWd0WXpvR3hnNDhXTCtrVzd3bmNNTENQUG1wS1p4SllJMEFmcHB1S0xY?=
 =?utf-8?B?aW9neExqeHhQcEVhOWc5bHVEK1NPVVV6WkxXY2g5MmdNY2V0R1dHYXd3eEZj?=
 =?utf-8?B?Y01wOG8zYkd1ZkRiaUlMNkhkdzhnTmhyZEY0S0pyVnlBai9vRzZVendpM0pW?=
 =?utf-8?B?RnJKeW9jQWxZSUxoNlFya3FnU0dONkM3QnNML0NnSjZwU3NFMXZmM3dvU2dS?=
 =?utf-8?B?N3ZEMTFvNUZUbjdDdXRFanVzdUFDSzZaNmx2Wk9vMzJIMndtU2RPMlpOWmRk?=
 =?utf-8?B?cnpDNlY0ZmltTnpJT2wrbE1IZVRIcW95T1JGU0QrMXRYSUNJYnQvUnpMdE4w?=
 =?utf-8?Q?bGOQEtVICdQ9nrek=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2cff1c-5c3d-4946-5185-08de55571cca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 23:29:36.7786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umUQ3zVglrgaQa/9iKKZFdAfSAng1wJVu0ym0C6UhgSUN/ukvOoF/qtKLc1mXgOpFeJW11AbXfo/T6ggGU9V3zd3ZlMUO0OUstrJRokEvyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7428
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



On 1/16/2026 11:12 PM, Gustavo Sousa wrote:
> Use KUNIT_EXPECT_EQ() in xe_wa_gt() as reg_sr errors in one GT do not
> impact the next GT in the test.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 49d191043dfa..2bf6fab015cd 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -55,7 +55,7 @@ static void xe_wa_gt(struct kunit *test)
>  		xe_wa_process_gt(gt);
>  		xe_tuning_process_gt(gt);
>  
> -		KUNIT_ASSERT_EQ(test, gt->reg_sr.errors, 0);
> +		KUNIT_EXPECT_EQ(test, gt->reg_sr.errors, 0);
>  	}
>  }
>  
> 

