Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B6606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SzfnMxqv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F7310E5FE;
	Fri, 23 Oct 2026 10:34:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CB410E5FE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792751686; x=1824287686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Q937UmIR9mWTZVPdFfXBDqIiRIB6nkX9lYn4DFeLOFU=;
 b=SzfnMxqvXypPEdJeIhco0byDYb6btKPzO0NmS65dP3XTkshgW/J5z82/
 4sMTjZ4P3sWUJsHiWvinmd2uj4mfcAy7h8Kf15kCKPgSFA3/taJRzRerA
 QBHr+RX8O4wabhHuH5VsJ13Q0S+qMwMB1uM1nAdrxX4TJPA7/YxnbJuPe
 MGfUx0Lc2RzF4DaTWYVPA3izfX+/TI/UzbOibIj+gNaDIBJItx7t2cBUN
 LINU+8kYMKH6JHCuqc/6W7b2ql+wAS3Yp6ThtF3AEj8eVc6g5IVtJ7zli
 FKlgoz0Ytg4948bWn/I+YfhECXIaiA/mbZ76p8zJBGJvlagJajgVKNpZ2 A==;
X-CSE-ConnectionGUID: XrKxXl0QTgW2r0pi+J39+g==
X-CSE-MsgGUID: o/MSPKZnQVScvHMqlrFUqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1547556"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; d="scan'208,217";a="1547556"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:34:46 -0700
X-CSE-ConnectionGUID: z2Fe+OjyRsqfeZyJCBEzbw==
X-CSE-MsgGUID: rgeiJyS+Q0GXuaWP+XdHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; d="scan'208,217";a="3941808"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:34:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 03:34:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 03:34:45 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 03:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3Aj+GcqGaIGByu40lkIPTF2Xqxc2e9SyEPkQVcaMS1uu5OPYifQW3okNABNAgoXTecxUSh50vyUIsQIyA7Ywmjy/3Ai+pk2m0rM1Kr7qQlIh3z9sLUDYtz+Jul3rKc610yhtVzBgzMUvXeCAnG3E4qiRhNAJM5KZfhRcG2M34O59cxgjdZm7hjj8vKqiUOEGculv6yuyohWg2n6dt9cfb0VgHPx/Q+RUGuI04ct8iiOqsPLeDcfxY4cag+W/pPqnO/Ks2sv3SyQylNWhbosj5xVg0gJoyI6d18TIi/a77jLA/GXwJz7IrAQb7j9XzmIXW39aJrjMP6SAIKraVOXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmuNHab38Fera4gsD6NYqFwnVYgdKATvnNieU9pl8TU=;
 b=DBqqSIBGF+rlbf8FBmdqh0WbUNVvnOkpQlDd21RIr3MMlhnpy3neWevkDdaFetqIwK2CZ79OL9knlVFk9irxknn5/jxT8PeZp90BmQUy97FH4Ff7wpuuWXzReI1iKjB5D921YOrsepgrlNekeBjWvb8LjqzW6dDKo/3bB2F2sOwA10wo4GQmvyKI9kWWlqLtnTxNobDhw9U1bWjJKg8uG4NmjkKs/A4T8mJDY/OArRvmqvICT7JUcyM9RLkClSqJPkTseGF16YWeyMIhcS9Ij9LFZEEPIAmdOVf/4NfdJJLDp22MzbIlIlqxOp0RDpJ0ReQzn+67EDvUAzRIthMAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH8PR11MB9879.namprd11.prod.outlook.com (2603:10b6:510:3c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 10:34:43 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 10:34:43 +0000
Content-Type: multipart/alternative;
 boundary="------------9lDwR0Idt2SGy5uSOQcBjJg0"
Message-ID: <13b1867f-dc7c-43db-8234-f55580975b98@intel.com>
Date: Fri, 23 Oct 2026 16:04:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Enable CSC fault injection on CRI
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>
References: <20261022122708.625136-2-sk.anirban@intel.com>
 <3832b282-b83f-4f34-9c62-6e98b46c13d8@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <3832b282-b83f-4f34-9c62-6e98b46c13d8@intel.com>
X-ClientProxiedBy: MA5P287CA0196.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::10) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH8PR11MB9879:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e31a88-1743-4664-9ae7-08df30f13fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261022115727099003|10067099003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: WeEPdyvecqqC0rw82EEnT4tTq2bu8GuETm9cXJNo6p58s7H//AsS31hzVMBrOzP5rJZGWV54ZrNUdWTDs0bsD9Tzo5jQRfT6zf9XOwev3Mvu2NKjNRborrOEMToG5QFnpS242gv5v+huzoEswh8/yNFXVxahiTzCuf3zVnucRsW+oPVvs3SDYXobl/EO7i1DZSQZhlYGtj3Dabynw7WfdOuVpz//jBLaGEqsjVJAZRNFDflJK10/RVMmMQHRL1f9mLAir0aER1hBDjH+xnVyYiZCFW92a7ecUQmwxUOd5mhGKH/aMcfu9DYmxphLxoqFbqMxtxrSbCicfRx4jNEKGlxQbJqOkIsiRble+tm++OOJcfmvK/rjBoXh4jWx7PcELLon2WeEBDRqXGNTqwQOFn9GvMV7pw9Oir4WJr11fRbq0q55/a90rxCYPLZKRsdHUqW8aOBOfm270n9whaOhMYngbbbtoKi5OzNCzSFIlJP7IhROevc9iA7u5hS1xg+QlzuxmM+w/71jEwaUbzsKt2Bo7VYT8L5X1zDXwGWUNFiYcHsChE5AXhNdNdOBkBebRfBsJ/uak7a+p+3/G7FgF/SL0n479wZIcnCKc/d9TxpBOyxs3qQcphnZQxUDRXkInB0WfQznwBrbF9eDLeEOsxUHt5xi+FTB51xkSEV98js=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261022115727099003)(10067099003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnBYTVVkYjlRdkpNeUNJMFBhYVZkMXVxQjRVNmFyM3phSWtpOWZibmRXRHdW?=
 =?utf-8?B?TjJVUGZmYncveS8xeFV5U05JVnBDTXBsQVNyNEhpRjNxZGxEb3k0OFRWVlpw?=
 =?utf-8?B?bmtQUC9kZFhETHpEaDhub0xBMlJQS0FzdkFKZE1SVGtHL1IrZ21kblFtQ3Rr?=
 =?utf-8?B?SUp1c2dISXBMcTh3S25SS2hYSXlkUUYzN0t2YVQvenlJcFcwYTBXWmpLRVlS?=
 =?utf-8?B?VDVHZlcyMnFGNDdpMW85dlE2M0RaR3BZZWpwMGNOQmx4N2JkTy9WdzdGcVFE?=
 =?utf-8?B?eGp4clZVZnhiVytOMHMxM3JHc2JSNWI1NzQralduUGpqUGtOc01oMnhrdC9p?=
 =?utf-8?B?R0V3RUQ1MjgvNVZMelhBdS9SQ1l6aW8zd3c4dnM4UWpHWlJCdSsrQkdQWUxt?=
 =?utf-8?B?Z0lieE9xL1NLZ2pjS0VFeHNDZTRlSTFLQ0dIeEhnbHQ2WEp6RTFuU0EyeVVp?=
 =?utf-8?B?UEI5R1I3ekNPMmdDNktYUE84QlJacEJ6dmdCTUN1U256Mk5LNjZNbzNGZUho?=
 =?utf-8?B?VDNiWXFFSHlJRVM1RDR3ZEhqWFlqUWJXRGNsUTV2d3lOUlcrRlB0Y0djaTdY?=
 =?utf-8?B?RXdRY1FtSjhkcnJZN2ZHeW9ZQzBIMXZLZmFHYXo5U0VxTVNuV290cXZ5Ui8x?=
 =?utf-8?B?dmsrUUJxKzRlbU9IM29qRWVnQjRpaUJtTUlwS20rakdaUnVDU1BEZFVabzZr?=
 =?utf-8?B?Yit1NjlUTVRmMFZGNTlHd3lqS2NqenZnc21NVEhwaXFwNXA5UUhNNExZWE9a?=
 =?utf-8?B?MnQzRDBLOGlWclR0QjR2QzBTK1NDMGRWZEhVNGRxN3pJM3hxZjNiWnZTaVg2?=
 =?utf-8?B?OTI4Y1hJZTZWS3NVdllOZVVZUUdsN1JWOXhrenhJVmJTL3RKRzBWTmkzTW0w?=
 =?utf-8?B?Y1VzU1ZFNkxTbXdDVStnZTdTNFd2d2FubW43QUtZY3Q4Qk84UnIzNTVpYzUy?=
 =?utf-8?B?MEsyZUJCL2xoUkRwb0xFTGxKNWF2MW1zQmFGc2c3MjJ6TWpNbU1vWEd4Wlpu?=
 =?utf-8?B?QVM3RWJYQTUybmszMHF2ZHl2WXhpalMwM0MvMXpIMHowc2RQcmg5TjlyZU9N?=
 =?utf-8?B?aFNqSlBvTXVpblRmWStLeUthQW90b0NwcHNYc1FKRnAzWE9tdTNRTnU3bjNa?=
 =?utf-8?B?R0dQVG9wbSthS0hYK0JqOWNVTFRvLzM3WVJtVldoZ0VmM1pERmhEd1F1bjFX?=
 =?utf-8?B?S2xQaDViT3BlMlhKOTNxdWN4czkwb21wS3ZuRjJnOUdBblF0MFdRT0hKeWlx?=
 =?utf-8?B?Tm9COE1qekNsVTI5bWQ3WWJFOUYzdUx4UXd3T2Y5R1BEdG4rZGc3ZlRiUGwv?=
 =?utf-8?B?Snc4Rm9PenJsMXFXaXF0d056aGNHVDJXcS8zNTliZG9oUUYrbkhERVdBZnY3?=
 =?utf-8?B?b2JkOUFGUVd1Y3dTRGtucTJyV2JBZkowTHVVbGxjY2FKTDlMRVRQa21reHN5?=
 =?utf-8?B?cWgyd0dBcUZEM3p1Si8ycENwWWcwMllyOUtJQnA3SDRobnZuRC9lN3dERW9R?=
 =?utf-8?B?TGxOenhwQkNjbERhYTVUNVNudE8yY3MrMEw1QlhIT0szQUV5cEVkTEdwejdC?=
 =?utf-8?B?RHlZc0lxdlUyQU1DU0RJa0wwaHdMY0JTOFM4VWEyTzdMQzU4UEUyS05IblI2?=
 =?utf-8?B?WUxkU2lLRFNYbE40RFlOeTFkR3RuU0hkWmpIbVhjSDF4WER5dzk0UkRnVjN1?=
 =?utf-8?B?djZtNnpJNUFtTjRzTWFQcm54cUhYYlYwVGFxUWZtMGIrbThINHJoeW0yWVkz?=
 =?utf-8?B?eVlGNXRIcVgxR3dndC9wdHZrWk9MT0tHTEFueTBNdkR3Ty9XQm93a1VnYzZC?=
 =?utf-8?B?cG90NnU1allSNVBZbThDS0tCbk1NNGpHcGtrZ2dWT0l1eVZ0dENTT0dtME9O?=
 =?utf-8?B?cjIwS0I2c1ZINHIxclp0VFdXRE04Mjd6S3NXajJ6L3pMOEZPZTJpb0VNTys2?=
 =?utf-8?B?dXNRZnQrTS8yeFRKdW5POTdEdENlZWlPL2lZeERuSlN3aldrTUNhU3pZd2VT?=
 =?utf-8?B?SVkvekg2UXJvU1JKMFlNRGVIVGkvVzdiK00zM3pBckl2UUpHc3UrSFU5SElH?=
 =?utf-8?B?bWVNUVlweVVJVCs0THdUeGttb2dWUHp0c3FpaWd3SlI1ZE8zOXMxU0xzL3ps?=
 =?utf-8?B?NmJmSDlYOXFiUThKN1FYYndQL3FtWThSSW5zOGgzQ1crQ0pWOEhDOFFzYUp1?=
 =?utf-8?B?andacUF4eW5ZcGZyWDBmN2Z5ZnB4dnJMY2NvUFJKT3orMElBZzJPcklBMmZq?=
 =?utf-8?B?TE9oeDBndkxrSFlvL0t1T2NBS3dnV3BMeWhYeEM3ZE0zVVZMQzJGSTJFbE5h?=
 =?utf-8?B?N2hjaGthZERUL1VwbElYS3QvRm8rUEVvT2xlQ2QvMy9qOVp5ODZyZz09?=
X-Exchange-RoutingPolicyChecked: TGCm8Om1Bn5yGln1MVuykP+sL+mnbT2pOVGLHJeUhsW2bm8LsKvfLlaCE5djC0V1gepRCn/qZmOV6dumFxRJdJ8t4JgAry9aS+e7cKlGcXAjGk5ydGc2G7nQMetBX6TK82/Bq9AXz/XqOeo88r89grrm5PD5l0ZuIj23PrLJ7sgpijnWPvdBsYjnyWvATPxYQ+6BdSrlKz/nguuZeuGQgNd+BIRNeEEVqBtAp7z+y3IVOeq9CD5HGzvHOOiHgfk3Fm9avEvt2hiANUhu1eWnZBo11O/lEJ6Dr6lGzLKCa1hurT471SplyyJKB0Owo/IXScNfF833gEkKL4gTP9zgdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e31a88-1743-4664-9ae7-08df30f13fe0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:34:43.1746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgGwUAHGIM5NyP8uFoXhdi9dB2cPLXrxyqrtEP1OvQS6DKUYD3sw0ZK9dyi+Qrfg/xKPVrfb4yebij0UG9v/dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9879
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------9lDwR0Idt2SGy5uSOQcBjJg0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22-10-2026 18:21, Mallesh, Koujalagi wrote:
>
>
> On 22-10-2026 05:57 pm, Sk Anirban wrote:
>> Enable CSC fault-injection debugfs on CRI, in addition to Battlemage.
>> Preserve the SR-IOV VF exclusion.
>>
>> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 926020c7526e..31b71b34eade 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -50,7 +50,9 @@ DECLARE_FAULT_ATTR(inject_mempage_offline);
>>   
>>   static bool csc_hw_error_available(struct xe_device *xe)
>>   {
>> -	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
>> +	return !IS_SRIOV_VF(xe) &&
>> +		(xe->info.platform == XE_BATTLEMAGE ||
>> +		 xe->info.platform == XE_CRESCENTISLAND);
>
> Please check and confirm, fault-injection debugfs enable on CRI platform.
>
> with that
>
Yeah I have verified the changes and it's working as expected.

We can see the debugfs entry like : 
/sys/kernel/debug/dri/<bdf>/inject_csc_hw_error

Thanks
Anirban

> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
>>   }
>>   
>>   static bool is_crescent_island_pf(struct xe_device *xe)
--------------9lDwR0Idt2SGy5uSOQcBjJg0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 22-10-2026 18:21, Mallesh, Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3832b282-b83f-4f34-9c62-6e98b46c13d8@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 22-10-2026 05:57 pm, Sk Anirban
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20261022122708.625136-2-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre">Enable CSC fault-injection debugfs on CRI, in addition to Battlemage.
Preserve the SR-IOV VF exclusion.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com" moz-do-not-send="true">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 926020c7526e..31b71b34eade 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -50,7 +50,9 @@ DECLARE_FAULT_ATTR(inject_mempage_offline);
 
 static bool csc_hw_error_available(struct xe_device *xe)
 {
-	return !IS_SRIOV_VF(xe) &amp;&amp; xe-&gt;info.platform == XE_BATTLEMAGE;
+	return !IS_SRIOV_VF(xe) &amp;&amp;
+		(xe-&gt;info.platform == XE_BATTLEMAGE ||
+		 xe-&gt;info.platform == XE_CRESCENTISLAND);</pre>
      </blockquote>
      <p>Please check and confirm,&nbsp;<span style="white-space: pre-wrap">fault-injection </span>debugfs
        enable on CRI platform.</p>
      <p>with that</p>
    </blockquote>
    Yeah I have verified the changes and it's working as expected.<br>
    <p>We can see the debugfs entry like :
      /sys/kernel/debug/dri/&lt;bdf&gt;/inject_csc_hw_error</p>
    <p>Thanks<br>
      Anirban</p>
    <blockquote type="cite" cite="mid:3832b282-b83f-4f34-9c62-6e98b46c13d8@intel.com">
      <p>Reviewed-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com" moz-do-not-send="true">&lt;mallesh.koujalagi@intel.com&gt;</a></p>
      <blockquote type="cite" cite="mid:20261022122708.625136-2-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre"> }
 
 static bool is_crescent_island_pf(struct xe_device *xe)
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------9lDwR0Idt2SGy5uSOQcBjJg0--
