Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEC7C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 21:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7DF10E503;
	Mon, 24 Feb 2025 21:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mj21b2T2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02E010E521
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 21:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740433127; x=1771969127;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t9SaMTaCg49COD1wBGxDOFGoOI+luzVIe2yniEq8WcQ=;
 b=mj21b2T2/zi/qwRrl6es+omPBw2o/98mxUin0ZiggyYP+DkVwUKKtDDT
 w9xBvdnKiIoppKSWnmPJzOkyc2Oj7LmEJHvnPDGyQZPRzODpE/7QRQ8sV
 L0fKxJ2c2YkH3j7rxI+hPNIvye9A+lbzRB7922rOCcz2Cn+tqsTeUJCq6
 gmAg6cBWUXMr4EF0hNTCoO4QTAvjnPKEBIy0zFhrHFGJrxxaIFDzBu5rP
 W7N2qia9tMVsuZjrulf9Y8CREaEa+h7tAD8iGjAva4TdSJ4gykSWRapuq
 YMWD0CMglk5KIjIvKdC3tJojbdqz4pEydT7dlJaOtMD5Cfnhi5oveA0fU w==;
X-CSE-ConnectionGUID: drLHyyvTTAKR0fWOvgB96w==
X-CSE-MsgGUID: P+PavpDFQYKev552wQYndw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41332472"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41332472"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 13:38:46 -0800
X-CSE-ConnectionGUID: SOZ0QpKNR5CR9dQvJEjTPg==
X-CSE-MsgGUID: EOELe8tpRGu97KfKTtZOkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147059899"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 13:38:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 13:38:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 13:38:45 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 13:38:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+VYpRD0rEumWKoMCEL2qy9qRjvWI6DuW40HO2Il/6Qw2ltQyvnV5RnxlaW7aS8TVuxbRokJ+Y2C74z04yWJ2w9Fj8FVCiqjGlpRo8/xOwRDIOyYzI1llhscpCyrRm7x9pUlUtnyQWbdjHTb1xLExl2pLkSHTVVYCYM2uTOJf+vvY2vwlVvvLPMnjdV4Nmi0Teydsg4cRpX54y60WoiyzAJENqPADFXoo7actqPCFeUSdizPavHls/E9z6sylRJeL7L1Gha/rZqr8Yf6Oglf/GuRbyqmp0yCSvXcyaf1yLziGyI9m1rCqCYNpGi4bQvsk4+veKeICvBgoB9yvx9AQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voEB0Oj1p2+gwVNQUd0bTVHFf91c6bVKcm1Q6NZSZWI=;
 b=SvWvRYO+IuWUBe/annadq17DcIhfAxoLEiyH53NgJnsV8F1j092w3BHEmWX+4R6TcYZBwp+RP7GWCEn8HdgXPuzY878vEMQY16mIHoQwyeUx2HFbNU9SW8XWKwKhGjDlilQsLfpFgnGoR9685mSVXvAccJti2drETcgGArbTI/evpRIig9ZcEIsCz3cA3mvdEvDUvJP7/7s4RWtQYW5GsMcFrc5jaY9sOtYX6U7/1nY0Z2KEz0OIly5gNIo30bqyhXnFZzOsjMmeF2eY91tn8HEgOOmf40UWnF5OlCNZ3czzfL+i1jw/Yspad1Nrf+L/AfU1QJPpfY9hRXaD1g1rog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 21:38:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 21:38:42 +0000
Date: Mon, 24 Feb 2025 15:38:40 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
Message-ID: <veg3pgmivlvwgur3fb7k4da4aqad335b5tfrd6sdnq3g6ne3wh@mjhypez7eqn4>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-3-shuicheng.lin@intel.com>
 <60047a3a-9919-486f-8fe1-4c2f90c110d9@intel.com>
 <wtk56h75pu66dnnqx6az6dxyfhvgqbovp6sdihtenuhxuoneh5@yo2joqcv75sk>
 <ab15704b-20d9-43c1-abe8-607e070c2cdf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab15704b-20d9-43c1-abe8-607e070c2cdf@intel.com>
X-ClientProxiedBy: MW4PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:303:16d::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8e3434-bf10-406d-8f34-08dd551b9bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Lp55d96gGgrZ9UEe41TomhYuGIta+9UW13tIoyWSASof/ROberCW4BGsQz?=
 =?iso-8859-1?Q?kyjl8bH8Fk3IuCIBYkg89m9eqGYbZSbF6hmeFxXO3JKn8Os2GiwtIJEGqS?=
 =?iso-8859-1?Q?mWDROiB1k0VfzTcKL3eMlxuFCw3qOB0uqCqZTXlDEEbjXZrQxUpRuueJHV?=
 =?iso-8859-1?Q?lkm3huE87BjveFumWtuFlkmxCXd+vlKQyxAmLmcKXQsc781hEhjyYSQGh6?=
 =?iso-8859-1?Q?50vqUA8oqIcWPXRUm1ZmIiWUFrbexPEnVXeW11jcD+wTxaMhMy3xvhoqyx?=
 =?iso-8859-1?Q?rHAPKnSrkylnjh4zJuS72AzN1dupbm9cSsx6MxbFLKqOXcMbE7s1LWiaSy?=
 =?iso-8859-1?Q?5p8BaAPy8ewojk7ndH7nt93B1XCSJYOhUEstnrmpczqX9ioPFy/uLkdNzl?=
 =?iso-8859-1?Q?wlFRqUWMlBIo03sOLuAC6XHZTTHtwPG758C0/NpIQrq3H4zh1e3DuWlNj9?=
 =?iso-8859-1?Q?OKMI7dSnPiDZXNs+/3AUeZP636bs4JKtaglqmRL0an4gLTz6oJq4/5zWl2?=
 =?iso-8859-1?Q?bhmX0oVEP8s41tvEiRb3syABnGpKlXwNGB2Cu8kr5stAHUPGTzFZ1MJcSe?=
 =?iso-8859-1?Q?mM7gBcxNjB8x0IMUUTxMqDV1vaB2G6p0bOZzc9ypRvj7I9MuUnwf2oBsNW?=
 =?iso-8859-1?Q?+rDlqMjoN/066IrCsOAYWWbBQzAbKUsIu36JQw+YMVdEvk7ppLpcj9MtHj?=
 =?iso-8859-1?Q?Vp+EYdo+t9a2OU13O1sen1x7JRpxXEeHwnqbcped94Kvv/O0MsyMlgn2KW?=
 =?iso-8859-1?Q?I/NfKg5384vZfvvD6dU035VsyEMxNNJwdqz/P7VKLgRoOZqYL6WQtF+Mk9?=
 =?iso-8859-1?Q?4ZwTqqGga5Ccgi6Cucxm0ZydPKiT8RMao9LZRoVo5srxxdRESxjVeo87f/?=
 =?iso-8859-1?Q?hFXIlqEgLC8qL6PtbSYO8nwyy3QQ4YhPwZzAb+k+naFSCyo3T2JoTTrF31?=
 =?iso-8859-1?Q?/9qL14EsoN04m6TH5CEnCeBmK0OQBkSzOpFdlYiPIdzkCHjbxRz0PZvTVH?=
 =?iso-8859-1?Q?QzkiKu9p1uE2IeCn3jFR2ZiPiKKox4Ituka35gTYznCtl2dMgF1YAbuv11?=
 =?iso-8859-1?Q?d9/g7qc9lWMYOibyRe2dXgfV5rySvvAwyvRmTRvFxoV1kXArVDLqTpVaFf?=
 =?iso-8859-1?Q?uLs3L2hxO/QcJr6HZAzWnpLrJC6iHyGJca/Q1UExAXIYbXJLjl3hXwgG3X?=
 =?iso-8859-1?Q?6oJvFMcQmWqEO5jdP2tnDWZVnoJ8LV7WrH6qbqsOBsaiBI2RCjOAEFWWxX?=
 =?iso-8859-1?Q?BL63kwWA6ibe6iJKuHsDC0IPv57gAT8PzOQOCrRaQ3FL+BNi+5QjiBQYmo?=
 =?iso-8859-1?Q?LCDAt/y1uXur8UKdC6qVOV4fBcdzDRU0Fs5hPfoUR/SY9azsh1zugh1mxs?=
 =?iso-8859-1?Q?uilL83Yi9XCE0H7nS90LFBb66cv9wErHyHvZPJpOPO1phknTf841kwieqz?=
 =?iso-8859-1?Q?vzGMMN94Ad37WMg+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PKqGUQR3VN7kGG79StyyKQaH2PlzGruU1E7OU5qR9n/jKhSOeEsHOHKZtq?=
 =?iso-8859-1?Q?B6vt3h+IG+nz3nTEilZtwuZSXGbFKkd8yp6VXZKRT91wwrym64pgo7MoeD?=
 =?iso-8859-1?Q?Hdk9AH3COHS+fwhSKHU7gXi4FfgCoaHH1eTzWDllVA9R5SzwRrVD62C1nD?=
 =?iso-8859-1?Q?kaS69FqqX94O648mCpbDVLccArswm88LJKNE2xK6XJ9LHJxtJREu+TVDqq?=
 =?iso-8859-1?Q?TzzYY/RGKn4sS6gTvJqpA7ALOCD9hkIy6/J57Y54sIkzugvZkYm1tmKYNA?=
 =?iso-8859-1?Q?EXVxQmRn6wJZkqyPS68eA09KD/xX9GgbHjbhaQFeQZk+QJFeTRN3bMFUFV?=
 =?iso-8859-1?Q?AA7cymUFznOnc178Les1Qrbkp8o9kONstb7bIefeKpwzDo5/4+318ztLDR?=
 =?iso-8859-1?Q?gFFB/I3BTRnxKpvPtDfvxvQfupymP+Ywbl82Ns1ffFFo0nfV9hVc27gdn0?=
 =?iso-8859-1?Q?O4dX3kZIFoPo/aZEnMA3AAkzcIN4pDbQaZneQ2xhm0O4t8t27CoiLmNDCB?=
 =?iso-8859-1?Q?a6QVvSMCVfBzfMLCfoDUIsyo8k9Xcly0wYWtOuWzzmgh6rrkXHlyqNJZdo?=
 =?iso-8859-1?Q?jH6vHD5YfVMneJ6TS8zejrJRU45hjm8gpp6PvgL4xZmxR0TR3be5mtFMlr?=
 =?iso-8859-1?Q?3MVGs1yVlv22ZI3DXFDCBqEE+C6IQwoEJtwvr/NrtojC9Tv+tAcsDCU8EH?=
 =?iso-8859-1?Q?k6cym4rlCw0Cg0bjhnvEJQS0I9GEzf8IcOZXHpBILnL27cEchPSrQAQbL+?=
 =?iso-8859-1?Q?IFqx215RAxXY69v/GXOt7sR3JOMyQm4+9yeMIOkkbL2YmyYdbpeNyl0QX2?=
 =?iso-8859-1?Q?gDNejH8Jo2SzFPUkTt5hQtBpfu6Z/Uy5UYaE+GfNRsrXCDj0DLr0KFXKTO?=
 =?iso-8859-1?Q?Q/hBQD2aGxNXknBfne/GBEdXuk0GUIbVby7Ud1vPUSz4993gepGgqjFjiQ?=
 =?iso-8859-1?Q?wix7n/q4d5eSU3L4uq9IcN/FUhwBGPsjwCQk+l8rtFJ06EFvSIXuRtJgDo?=
 =?iso-8859-1?Q?3BQFf58uasNHw5wxTMVIyDPf8MJp3tIz8X/2K7MpscaMPBiRBG/i1usBd2?=
 =?iso-8859-1?Q?HuCCXT8595o9fkUab3tEYET1Tox3aCkWKys/OjMWRkij2Ez2I/qyY+dbiS?=
 =?iso-8859-1?Q?GYJDsHEqYyiMs+apFDyhwT3YoPORpCBu1VnectdXNUbOH/R6t64iKx/YHj?=
 =?iso-8859-1?Q?mGSP3pO6LLn4Zzo/Re5KgJ5UnnJWK/joHo8E1OU8UftKOQpaoszNqpnECZ?=
 =?iso-8859-1?Q?BX66QnkQSnqYPunkLmbHS+A3KY9Is+fo9713rf2SYkwI+LO44qhoqgQeie?=
 =?iso-8859-1?Q?aZ1V1K/7muqafguU6hrf53pA3YiSjAr3vChQx9WAeCDVlC5gdlcfLXtS6K?=
 =?iso-8859-1?Q?0uHBqw7gEVoprh+O8LZm+3L65nThAQuy/3Th+i3oVGPFlvJ1aC/d9hdL/z?=
 =?iso-8859-1?Q?4ks8pfwJh0Fbkb5880qKZ6w0LePjXJkrknPWqXPK4GxfgQ2SRefaQTvTLP?=
 =?iso-8859-1?Q?tmx8J4cwGZnhb63yOQHIc80Bhg7aNTs7P2js2Co6Zte4YQ655pWvA8P8MQ?=
 =?iso-8859-1?Q?9gyr0JRMSIZCzanfFiU6dfPnfhJsCmADR/TF1hlQt21NSCokvdqgtfX9NL?=
 =?iso-8859-1?Q?aeUatUNbatbOyV0MBf3gCaf844VgEPs6CKDR16avhyd8cOsLgHZc1moA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8e3434-bf10-406d-8f34-08dd551b9bd8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 21:38:42.6460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYsnPYoZBjT56L8Dn+kKEe1B/LD84XTTtIp7eB5Q8cfUnuKhtm3aiBPmKA4HIeE8pH4Pi91gc/rhdYVVkUmkId7FUenrDJA1cy8yYO23sZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
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

On Thu, Feb 20, 2025 at 05:36:19PM -0800, John Harrison wrote:
>On 2/20/2025 15:54, Lucas De Marchi wrote:
>>On Thu, Feb 20, 2025 at 05:29:56PM +0100, Michal Wajdeczko wrote:
>>>On 20.02.2025 01:17, Shuicheng Lin wrote:
>>>>kzalloc returns a valid pointer or NULL if the allocation fails.
>>>>It never returns an error pointer. It is better to check for 
>>>>NULL directly.
>>>>
>>>>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>index 60d15e455017..81b9d9bb3f57 100644
>>>>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>@@ -426,8 +426,8 @@ void xe_print_blob_ascii85(struct 
>>>>drm_printer *p, const char *prefix, char suffi
>>>>         drm_printf(p, "Offset not word aligned: %zu", offset);
>>>>
>>>>     line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>-    if (IS_ERR_OR_NULL(line_buff)) {
>>>>-        drm_printf(p, "Failed to allocate line buffer: %pe", 
>>>>line_buff);
>>>>+    if (!line_buff) {
>>>>+        drm_printf(p, "Failed to allocate line buffer\n");
>>>
>>>btw, since this line will be included in the output, where one could
>>>expect ascii85 data, shouldn't we print that diagnostic message with
>>>some special prefix to make it clear there is nothing to parse? like
>>>
>>>    "# Failed to allocate internal data\n"
>>>
>>>also since caller may have already provided a prefix, shouldn't we also
>>>include it in this diagnostic message?
>>>
>>>    "%s%s# Failed to allocate internal data\n",
>>>    prefix ?: "",
>>>    prefix ? ": " : ""
>>
>>or stop printing and return an error. we are missing the `.error: ...`
>>already that is used in other places.
>>
>>$ git grep '\.error: ' -- drivers/gpu/drm/xe
>>drivers/gpu/drm/xe/xe_vm.c:             drm_printf(p, "[0].error: 
>>%li\n", PTR_ERR(snap));
>>drivers/gpu/drm/xe/xe_vm.c:                     drm_printf(p, 
>>"[%llx].error: %li\n", snap->snap[i].ofs,
>This is the place that should be printing an error. The whole point of 
>this helper is that it wraps up all the blob output. However, do we 

note that this is not printing an error in the log. This is adding the
error message in the place that is supposed to have the *data* for that
key. That's why there was supposed to be a .error key to accompany this
behavior.  Right now if you look only at the devcoredump you have no
clue the data is actually an error message, not real data.


>need to distinguish between a non-capture-process error (e.g. bad VM 
>object) versus an error in the capture itself (e.g. out of memory 
>converting the binary data to a text string)?
>
>Not sure what error routes there are in the VM capture? Are they 
>things that are important to include in the devcoredump because they 
>have significant meaning about what caused the hang? Or are the only 
>possible errors related to the capture process itself - failing to 
>allocate memory to store the capture or such?
>
>If the only errors are capture related then yes, just change this line 
>to print "[%prefix].error: %errno\n". But if there is use to 
>distinguish between bad VM objects and failed captures, then maybe 
>this one should be "[%prefix].capture_error: %errno\n" or something?

-ENOMEM vs something else would already be a very good indicative.

This discussion can continue. For now applying these patches that are
orthogonal.

Applied both to drm-xe-next.

thanks,
Lucas De Marchi

>
>John.
>
>
>>
>>Lucas De Marchi
>>
>>
>>
>>
>>>
>>>>         return;
>>>>     }
>>>>
>>>
>
