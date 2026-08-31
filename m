Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6FAC624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA2110E61A;
	Mon, 31 Aug 2026 06:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0M26CBd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBA610E61A
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159296; x=1819695296;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hCqtb0U0ZspB2OovqzMwZlyzUm4P7MyVt/fzsDCJg0Y=;
 b=n0M26CBdVcHXzWMM9HNiTBZaaaaoXLl3EHtkD83LJSeI/d9NoE65ItPM
 VweP5ncr+tM4E3k3e5kUbnj8dYnTuw/QefX+k6Wbqqx9T3v3u+U71uyqX
 qFgC0vymC7MQD/EjvT/ofDOgwIHxUOHM7kDv/nFoJDGcG4EPwAUX66xeV
 Wf0FWSXWD5Hcu9Lev5QerblddLvWe4dYyFYr8qo8fOA8s0bOB1c5nx6Bp
 Vt/5p1zcAWR/yProGXHP7xRMpC6T69iBAQTBvqBbeKs6zy4mgL+V6VPQt
 N+GKXMdsb6c3nVDT1exYorf4kXP6Ae9TrTkig6LEhFMqHJlXWvEFuMCiI g==;
X-CSE-ConnectionGUID: N5o/DGa7QAyQ1x6W1p3GpQ==
X-CSE-MsgGUID: iBRjT3NpTFe3PfUfTDaWyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99219942"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99219942"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:54:55 -0700
X-CSE-ConnectionGUID: XJsQUrlyRQOHdTn4yETs1w==
X-CSE-MsgGUID: GynlmJTET1m9iBPtFNNLFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272905493"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:54:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:54:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 23:54:54 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:54:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXyfdZ+RXZ8TccmlmH79tXGdDxhe73q9A5m0l74zlk5ejTjcPU1F8hiXfh6G+QgsnGngKfzSn+9AOxBCZfClb42w13E+m1VT906r2puxAUoF56nuXzMdYykiakTOMrXTjNR2uCrHtwrcIaQKhS3MLi/CokSwQICV57m56POhYC5OtNVaU0ci5o6gE4/nwCxMNskTrEmZIKiVCA5z+3/l4dih2K7rlbfuzDV3OGdubQxwleSTUFkXjDAyczSea8/oxpgh7BK2VxWjqKJTtOrNpJE9oY6gGK/4Y5mpWbjfU62RvDiWnHFGyGHjI3JUeQNjWb4WkivzVzWCQP+X3g/yeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqmKqtXZapAkHutN86r+dtNveY9Ka96NehPLHW96AWM=;
 b=Uz5efz5HHdbRu+abWqtyqDXdW7Nzqjdve08uzNYyNZOzpTZJbB76YsBfQXo3qIOx2AG4r2SSfzA6csRgB/pXb83CBc6OYucxo9CsCqW5meyLWZB93FjTP2Y/r8zaiWdLaD38CAfaP5gQgsCLEVieDUKdQzVrDJaD45md4Qe1vgHBfSVmdrL9WBEOFo4ikN+9wEFRRn2iDccooBRYOFFHlzOsjEdGjdJ51yNYBxk37klhBqikD1nYybLh0qNbpthd3clgaClqMCdM+85/De6QJOOT9H9FNyfEdXpBD0YOCu3jgxTlETcvOJP86kyh7zqOS+RC2S10CyAnxvDsIVy1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB6076.namprd11.prod.outlook.com
 (2603:10b6:208:3d4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:54:52 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:54:52 +0000
Message-ID: <f2bc5155-853c-4283-a2ce-1213e94b9aac@intel.com>
Date: Mon, 31 Aug 2026 12:24:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V19 15/15] drm/xe: Add fault-inject based VRAM page
 offline injection
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-32-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260831064942.315720-32-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0135.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 99686e8c-efb9-45cb-eebe-08df072cc1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: JiaBj1e3j4sN/VFMo2hZwoIkIIk0MHWIF2TR0oG0a6AYY3wO/AML3YaYpzgsQN5DVoqmE2V5nZWP7RVqTv6tvngp3iebXv9ihTdEWUUB+TziK6zpOzq14StOsSY/5GlE3WvwLzR4tecPQOy7Zcf0A+BeXynOlDhuRavXacrPMzT0MELDgs7VnWDml3wiCdD/6ZkPLl7XrI99edSQWPni957J0V5ePxjZchIJ8X+lICyhXUTadIC/ujiCjWChzKi9E7OkFWOAcGvT0hxSCIe/qeOTtPChVZ4XfRGwYNQYYs6CYWODliUREI+L/P/1Dq1FrwwgkABtrz1KzlxQ2njWbiRatc48NjuBV4CSVvUl/0DJg8iz4wn/HVvoKE4BPGiEx/rEavZYBHJYGI/Q0DQPsVJMjCkZm6TdoW56BDz5fqOfQuyMurwZcqeETKpgZB+/dAoPeq9AhpYFX4XJOvRB7wAhOCpKrEfZIiKhS+uBf9rH3jm3xA8rBb8axhUDhjFZm3CNI2MmQlKbVAbpqiOXJdwyCn2iEucQDlpZ7DDHwV/zPOtKMere+UTQoj/TRZ6ua6EzZqPL76UYqvWth07az0EMSerdnVPQrH7NYWJwUBDKGWqa9sH77XzZaeirD30M9rfgc1EFHIii1Vb/nz8aYonGCVkgYLuSgjssJDAEMPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhRNTh0V1dFZktNaStvMHNRSzVGUzNqYzdTcmtySlVxTktTWlNqeGNSUTlw?=
 =?utf-8?B?ekltNHlXU3ZwTldidkd6QnNUNmNCcW9uVHFjbW9obVdjSTRxYnVPcHlKUFBZ?=
 =?utf-8?B?dCtvaEZCeGJjN3hiVkhvZWhxdGJzQjVkUWJieGhKVzFzcjNqaFVKSElRN05W?=
 =?utf-8?B?MW1DS3dleG9uYVdCT25mbUtna0xhTFJXRTkxNEJKQTBhMmxmaWU4TXF3RW5I?=
 =?utf-8?B?UDdFTjVpZ0FXNmFqZVdlUkhGeGVnZ3RhVzVUTGpSQ2tMVG1FRE9ib1l0eENP?=
 =?utf-8?B?UXdIMDE0SmpudG02RFdSUlFGRTc0Wm5EbEcrbk1IcnJnN1RTUzIzWHIyd2Fl?=
 =?utf-8?B?Wk5FRHFtK1hyRElSSVFZT0t6M2M5T1dIQWNOa1FJcUEwenVGNHFZUmNwMHRD?=
 =?utf-8?B?VFhFTk9kQjhHeXJNQUdDcE96aEtxdkp5NHNpeDg4dWFIUFFFWTVLUzh1V3Jz?=
 =?utf-8?B?d3Y2dkFPeHg1dFQyZTBGWGx1KzR0cGFUNmlseGVXOG9DWndwdFp4QUNaVmVo?=
 =?utf-8?B?NTFzTHhQREhTMFFrak0vSmk0bUZ0ZUtOTnBoWHc1bDR3djJHTDZLSGFsdnhq?=
 =?utf-8?B?K1gxM3N0Rjk2bzFlbEtjbG1TODE2K2hTMllFbEV3QXoycDVxRzEyY3B1RFRv?=
 =?utf-8?B?ZWh0SnBaNVBoVkw2UFFqTzB5SlhGNTUxZXVMZVN6WEYxN0VYampxdmR5elNo?=
 =?utf-8?B?ZjhkM3dodll1L2l2bllya1Z2MDdmTGFDU1duSGJCSmRrV0M3Vk80K3U5MlBr?=
 =?utf-8?B?Rklqa1M5cmhjYjJScFBKSTZrMVN4VENVZ0hodDJRb25qeTA2UUxhTTNzTnNC?=
 =?utf-8?B?MTUwa0R6eEVvWWd4MUl3WGJHVmVEQThVWlFNQ0ZzdjE2ek84UmVpd1lvOVl6?=
 =?utf-8?B?ZnFVc3JrNHpQa1ljM292UGxFNkp1VzRlSnNTeHZWTjBSeEFQSWRZcnlkakJD?=
 =?utf-8?B?ekJHVUE2eW5ETWpQWWxUOXltWmJwZ201K29ySHdaZUV6elRHVWphdUM4SmpS?=
 =?utf-8?B?Q1RrRnVGdHkyTE94RDQyRitYOHlnTFZOUENwRXdKaHZlSndEcHVoRThMVnFG?=
 =?utf-8?B?Mm1KNk9KUmxXLzFRanp6bU9iVFRObEV4Uzlab1dHSlhuNUFzYXNlNS95K002?=
 =?utf-8?B?Z2p6OVdDMEM3NjF5RGJPMXJuSE9KSHM1VmQ4N0I2ajNmWWRlcUgzM09uQldP?=
 =?utf-8?B?ZmVNR2VjY1dqZzQ4Q0ZSZUNGbUNJdzJrdk5NUm8wMEM1a0JmSlZTVXA3d08r?=
 =?utf-8?B?UDA5Vlh2RmJHS0JLOVhyRlRJV3JLamVtNHJZc2tsZzZZLzlhK0gvbjk4U1Rz?=
 =?utf-8?B?bTdBaStPWitWTXowbzBIQ2lTbmdMc1QrTEhRVFQ1YUhOdkJNNmlIQ3NHS2dv?=
 =?utf-8?B?OTBlMm16T09BZnQ3aUV3WEt6ZVB5MVRMTVFjVG84bGJlbDlPTi9ZeTNlVUtt?=
 =?utf-8?B?YWhRYWdMOGhGUkUxMnJscVJtUHNzTTVYY1V1K0xWdXQ5V04yZXVDVTRMM2dH?=
 =?utf-8?B?b1dhdlQ4V3NDbUVYMS9LUmxkUU9KU3FBSFgxbHZnRUE4RW5FOEx4QXRYOHJ5?=
 =?utf-8?B?VUVRMUllSS9BZ1RsR1RnSHVIc1JMV0tLalE0bnVObnRXMUZBQ3F0bU1ldzhm?=
 =?utf-8?B?bGF3eWl6WXNEc0xTY2JpNFg3L0xvR2tkVUg2a0JLdWJ2Ym12U1VjanArZHVB?=
 =?utf-8?B?OTdlUGE3SlIrSWNzYWd4dkF3VDNjU1E0eGlIOTRiZkNZL3dIN2dHdlRadWVa?=
 =?utf-8?B?b3hzUkhDcit4cGVXQ25VdEF1VkNrY29xSDhUTVZqRnVwYit6TGRITS9KUEFO?=
 =?utf-8?B?QnVhV05ITDhBVnQwQjg4QmVaTDBGRWFoOSsyVGQ5aU14UWVmOFNvTGZ5cWdz?=
 =?utf-8?B?cnY0K1VvT1JuZjdja2laNG80RC9sYjRLcG9sc1N4bEFyYXd6ZjVDWEl5TXpv?=
 =?utf-8?B?MGU4OC8wak4xenlZSkE2TzZjbG9CQTNqZlNzV3FlOEVkemR2UkhyR01RSC9V?=
 =?utf-8?B?Q1lWU3U3bm53cFpHSzYwYThaQlkyTk4rWUtDUkZEdmJCV3FUTm04WU9Td0pU?=
 =?utf-8?B?eCt4dHFvZHorUUU5ZlBwcThaZnpnTjJDVEZQRjg5QTJkUGkvc2RvVEhkZGVt?=
 =?utf-8?B?SnUzYnBUK01SZHFTcHJkRHpSZHlxMXlveWxNbjNTdDFmT3hPNmJXYWx2ckxB?=
 =?utf-8?B?UXQ1UkVGeUpqdWh3ZDRxNTV1eFlEVUFIdmhjSXZvaVdjNlY3bHJJZGdHMEZq?=
 =?utf-8?B?czJjT2hnSkZubU4ya3lkVDlsNkRUWjVVMlJUVmt6NVBrbmF1MU1LK0tUUlVT?=
 =?utf-8?B?STVnMVNtMEF0S2VlbWxhcVVVQVdNWlkvSmlnQkJjSGhaOHFjdVhBdmNxNmxR?=
 =?utf-8?Q?Y6QqnU/+7ud6K8Sk=3D?=
X-Exchange-RoutingPolicyChecked: gIEhk+07rxatYZBn8n0uODyDYA2Tal28E2LYEcuNytxb9pt1x+J8Ta1MuDLqBWORTObbdC8zlNK5hLz0zybjjBnBaH6OxtdIf2eSyjNdQ8qxwHRaEgtOAp7RmtlKTHXhn4Ljpd5sQQWPTTYO/ZrYGjK4WPuemG9s337/ttOuaLG/6MPPuiOSN9yntu7t6mxGYpYEY+V+XjveNZyz+AGqSgT1D69e+8cQBtmR1mBi/cuafQsxUAcwM8Qh7MXQ75R5IVl0BcUqvHFf3DJldAYPV1kNIlWoXfA/nzO8TtSHJBIEiiMLLWm3rLNHceNIZLEa9odBjRJBsqEcK2kYi+UpWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99686e8c-efb9-45cb-eebe-08df072cc1e4
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:54:52.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rWePIQOmKzZgNTWzFcnDmQ2s4ewoxQP8GSNZptvl1HRryuQklgyBgC+XCQ4zcqf4bQ2DTLQAjR4hKqajncAYQKMu+x5So+3rbiMQG1Xxt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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



On 31-08-2026 12:19, Tejas Upadhyay wrote:
> Add a fault-inject based debugfs interface for testing VRAM page
> offlining. This replaces the previous standalone debugfs approach
> with the standard kernel fault-inject infrastructure.
> 
> Two debugfs entries are created under the xe debugfs root for
> CRI platforms:
> - inject_mempage_offline/: Standard fault-inject knobs (probability,
>    times, interval, etc.) created by fault_create_debugfs_attr().
>    Without CONFIG_FAULT_INJECTION_DEBUG_FS, the stub returns
>    ERR_PTR(-ENODEV) and no knobs are created, making the trigger
>    effectively a no-op.
> - inject_mempage_offline_trigger: Write a PFN value to inject a
>    specific page, or write "0" to auto-pick the last unallocated
>    VRAM page
> 
> The trigger accepts:
> - "0"      : auto-pick last unallocated page
> - "0xPFN"  : inject fault at a specific PFN address
> 
> Usage:
>    echo 100 > inject_mempage_offline/probability
>    echo 1 > inject_mempage_offline/times
>    echo 0 > inject_mempage_offline_trigger
> 
>    probability: likelihood of should_fail() returning true (0-100)
>    times: number of times injection is allowed (-1 for unlimited)
> 
> v6(Himal):
> - Add warning to rebind driver post test run
> v5(Sashiko):
> - exclude SRIOV and remove dpa_base addition, already absolute dpa
> v4(Himal):
> - Use xe_fault_mempage_offline() instead of IS_ENABLED() +
>    direct should_fail(). CONFIG_FAULT_INJECTION_DEBUG_FS is now
>    an implicit requirement for the trigger to function.
> v3(Himal):
> - Use FAULT_ACTION
> v2(sashiko):
> - use cond_resched()
> - validate input first and fix addr < 0 case
> - validate vr, move block, found var as local to scope_guard
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 48 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_debugfs.h      |  2 +
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 58 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
>   4 files changed, 109 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index cb24e001b142..80f62634fae5 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -45,12 +45,18 @@
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
>   DECLARE_FAULT_ATTR(wedge_cold_reset);
> +DECLARE_FAULT_ATTR(inject_mempage_offline);
>   
>   static bool csc_hw_error_available(struct xe_device *xe)
>   {
>   	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
>   }
>   
> +static bool is_crescent_island_pf(struct xe_device *xe)
> +{
> +	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_CRESCENTISLAND;
> +}
> +
>   /*
>    * Fault injection table.  Each entry registers a debugfs attribute; add a
>    * matching FAULT_ACTION() below for every entry added here.
> @@ -67,6 +73,9 @@ static struct {
>   	  .is_visible = csc_hw_error_available },
>   	{ .name = "wedge_cold_reset",
>   	  .attr = &wedge_cold_reset },
> +	{ .name = "inject_mempage_offline",
> +	  .attr = &inject_mempage_offline,
> +	  .is_visible = is_crescent_island_pf },
>   };
>   
>   /*
> @@ -82,6 +91,40 @@ bool xe_fault_##name(void)				\
>   FAULT_ACTION(gt_reset, gt_reset_failure)
>   FAULT_ACTION(csc_hw_error, inject_csc_hw_error)
>   FAULT_ACTION(wedge_cold_reset, wedge_cold_reset)
> +FAULT_ACTION(mempage_offline, inject_mempage_offline)
> +
> +static ssize_t inject_mempage_offline_trigger(struct file *f,
> +					      const char __user *ubuf,
> +					      size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *vr = tile->mem.vram;
> +	u64 pfn;
> +	int ret;
> +
> +	if (!vr)
> +		return -ENODEV;
> +
> +	ret = kstrtou64_from_user(ubuf, size, 0, &pfn);
> +	if (ret)
> +		return ret;
> +
> +	if (!xe_fault_mempage_offline())
> +		return size;
> +
> +	xe_warn(xe, "Page offlining test interface accessed. Notice: Offlined or reserved memory pages cannot be reclaimed dynamically. A driver rebind (unbind and bind loop) is required post-test to clean up.\n");
> +	if (pfn == 0)
> +		return xe_ttm_vram_inject_fault(xe) ?: size;
> +
> +	/* User provided PFN - convert to DPA and inject */
> +	return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT) ?: size;
> +}
> +
> +static const struct file_operations inject_mempage_offline_fops = {
> +	.owner = THIS_MODULE,
> +	.write = inject_mempage_offline_trigger,
> +};
>   
>   static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>   					     struct dentry *root)
> @@ -96,6 +139,11 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>   		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>   					  xe_fault_inject_entry[i].attr);
>   	}
> +
> +	if (is_crescent_island_pf(xe)) {
> +		debugfs_create_file("inject_mempage_offline_trigger", 0200,
> +				    root, xe, &inject_mempage_offline_fops);
> +	}
>   }
>   
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 0dcd28fd7dc0..88d91c78036b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -14,11 +14,13 @@ struct xe_device;
>   bool xe_fault_gt_reset(void);
>   bool xe_fault_csc_hw_error(void);
>   bool xe_fault_wedge_cold_reset(void);
> +bool xe_fault_mempage_offline(void);
>   void xe_debugfs_register(struct xe_device *xe);
>   #else
>   static inline bool xe_fault_gt_reset(void) { return false; }
>   static inline bool xe_fault_csc_hw_error(void) { return false; }
>   static inline bool xe_fault_wedge_cold_reset(void) { return false; }
> +static inline bool xe_fault_mempage_offline(void) { return false; }
>   static inline void xe_debugfs_register(struct xe_device *xe) { }
>   #endif
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index ca97fa8291c4..5ffd125e344b 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -866,6 +866,64 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   }
>   EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
>   
> +/**
> + * xe_ttm_vram_inject_fault - Inject a VRAM page fault for testing
> + * @xe: xe device instance
> + *
> + * Picks the last unallocated VRAM page and reports it as faulted
> + * via xe_ttm_vram_handle_addr_fault(). Used by the fault-inject
> + * debugfs interface for testing page offlining.
> + *
> + * Note: Executing this test will permanently retire the allocated
> + * memory tracking pages. The driver must be rebinded (unbind and bind)
> + * post-test execution to reclaim the reserved space, as these pages
> + * cannot be freed or reclaimed dynamically while the current instance
> + * remains active.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ttm_vram_inject_fault(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *vr = tile->mem.vram;
> +	struct xe_ttm_vram_mgr *vram_mgr = &vr->ttm;
> +	struct gpu_buddy *mm = &vram_mgr->mm;
> +	u64 addr;
> +
> +	if (vr->actual_physical_size < SZ_4K)
> +		return -ENOSPC;
> +
> +	addr = vr->actual_physical_size - SZ_4K;
> +	while (addr < vr->actual_physical_size) {
> +		struct gpu_buddy_block *block;
> +		bool found = false;
> +
> +		scoped_guard(mutex, &vram_mgr->lock) {
> +			block = gpu_buddy_allocated_addr_to_block(mm, addr);
> +			if (!block)
> +				found = true;
> +		}
> +
> +		/*
> +		 * Intentional race window: xe_ttm_vram_handle_addr_fault()
> +		 * re-acquires vram_mgr->lock internally, so we cannot hold
> +		 * it here. A concurrent allocation claiming this page between
> +		 * the two calls is an acceptable false negative for this
> +		 * test-only path.
> +		 */
> +		if (found)
> +			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
> +
> +		cond_resched();
> +		if (addr == 0)
> +			break;
> +		addr -= SZ_4K;
> +	}
> +
> +	return -ENOSPC;
> +}


Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +EXPORT_SYMBOL(xe_ttm_vram_inject_fault);
> +
>   static int vram_bad_pages_show(struct seq_file *m, void *unused)
>   {
>   	struct xe_device *xe = m->private;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index f354c26c4257..8878e36292b2 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -33,6 +33,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
>   
>   int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +int xe_ttm_vram_inject_fault(struct xe_device *xe);
>   void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
>   static inline struct xe_ttm_vram_mgr_resource *
>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)

