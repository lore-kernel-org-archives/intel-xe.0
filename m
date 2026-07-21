Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E0C4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 11:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7100E10E34B;
	Tue, 21 Jul 2026 11:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeogzqRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E2910E987
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784634567; x=1816170567;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IDyBxet8RRoge3kGqfSimkqLlaLmpiqXt3mBWM5FqZg=;
 b=JeogzqRyhwlnWswQqw3eWma2Ku03aQ5v0QWivlzSt1l0jcU5Bbskui7T
 jR08a3jlGxkUIcmCrArSCiM9suaOj7tVFzr9OcixKYnDHy2aT4vshW/dY
 M+ITbLtiW685XJNCrI3WfIioiYYezzcLpUn7xDTfqUFszkvmk3kcmJUJV
 x8uMqh13l8N/ukVXTO9NXH0jW/o0gdU/csqJdrOl1DMplNCDK0OarjbTf
 AZMjHvdIAJ6jEVy7LdVLVuWYbmrJicqfceD+RGHchYD3GtXrLDHkod7GU
 eoR02ZJ+dOXv5PrneLyr6p/ZAkY8AnZ5amVd2sjM+6iqCyjQ8/iWu6lP+ Q==;
X-CSE-ConnectionGUID: u1pbivJDQMqPTNC/pUgmEQ==
X-CSE-MsgGUID: PnoRw/0xSWWdEsIpcaiEmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85174737"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85174737"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 04:49:27 -0700
X-CSE-ConnectionGUID: qaDuvo4RRheI+HpZ6KvL2w==
X-CSE-MsgGUID: pKm81FbsSlqKKirxklA/BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="255099114"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 04:49:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 04:49:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 04:49:26 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 04:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WL4IqHFSq3Jn/cOta1yjVtyh2LOhXAAuqXHqCuU/aH7onmn1R2SWolOzq4d89WGwiUB5JwFLtzZLqNB10QBwKHkNbNF1p+anDeVHRhehU8b6bo/gX0yHqrWOgKKB2o1ds9YseWgaf0L1C5zDACFvIH2bjllrbnNkPSSsROwMuXv+zMDC59OV5FiotTDRzf0Si1kUiSFbh7ZW7LpzfOxWmheOfM1XQ43BhZpW7jA5nWsAq9ma+c+bDA8Y1VswPbwbE3rQo0TXzOQ8IT+qCoxQ++5MELOcqc5drnGJjcLMbrl59eYqMSJCiSi42MOwOaC8oviZmrk1KMAmlpDuFpJz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDyBxet8RRoge3kGqfSimkqLlaLmpiqXt3mBWM5FqZg=;
 b=MwvFU1rVNiYLiJ5T6IN08ch73BVB6Zomif/yh/hyhYWi6DjOHBjVZuOrR9a974DQqW4zQCqOQy39ITBDD1z1E2rFsp63GCKSr0mONXrnOl1gkuJDUAhBKg3Pb+XKFt2b2Ix5QBnb7TKt2G8FMEeGUXAEbjNvuwpRg7yRBYySj0ksTOcxsjZMAY+ojzWD5PkBAFBh0Kl33oTL4C9bQC13sD+UVY+BRrBnRx3EsSgy6/FmdOxurMnEAEX+iAgSBrQnkkD/XdBERS2KY4+6FogFebYZxjICcE4R/Kvfr23PiOm4pzHBuDDxdlXND9Z5RMl997cbXcL0LE9M76X50owEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 by IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 11:49:23 +0000
Received: from SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57]) by SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 11:49:23 +0000
Message-ID: <d3802216-6404-4d4d-b166-a3407bfd4c14@intel.com>
Date: Tue, 21 Jul 2026 14:49:18 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/mmio_gem: fix fault handling for split VMA
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <shuicheng.lin@intel.com>, <thomas.hellstrom@intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
 <20260526125106.2806522-9-ilia.levi@intel.com>
 <7baa79b5-a2e4-4064-8a19-c0f263a883e2@intel.com>
 <al7lbcjU8JsqasVE@gsse-cloud1.jf.intel.com>
 <78425c51-b432-45af-bab8-7c74230880cc@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <78425c51-b432-45af-bab8-7c74230880cc@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::19) To SA1PR11MB8575.namprd11.prod.outlook.com
 (2603:10b6:806:3a9::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8575:EE_|IA1PR11MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a4c36e-c269-46cc-ab7c-08dee71e1bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0ztx2O4v1I20UdshedUOwkbs6OuF0CMb02v1WD+v6N9IzoL1fMralY+rqmb5FAUyOq/GhLElI72/GHnIVBovnAL7fzpx0e1MZFtkOmd3U7a9Y64RAt2Jx1cHBnhAmKWxd2RSrViKeglFwW3hEkvYN0lm/AxTRjK62bOLaJsJ+7nAT1i71EmyXf24IYuBWfTSSZEes9jl7f5EcmKMm0NS3dJq79KfNAzEbs8iu18hcFSIeQbylj3ucChJrv+6ejW1B3v9KChQV50plw46MplxKD74PBlPqeH/OthIsB6CD10ybOskaB79sdjRsW9aN4Ts4V1rj2bcPevMcDkfEYAH2o6V8IyFR5fJRKlqalopf8Nv5Rz/Y76WNIWFBsPvOpsHbbsDaSfKNDrqry19uP+yQq7M6mStspAC9yRRS+StGK/QKa8Og1JwpLaPYHo+WDHRfFoWlQ0ocUkzwAaFga6I66x4wzeL6rP0Ta/QXeT3sJZKtifG9wAkkRZ30RvMYZwvKAp2fpDSiHIi+6Y1sZgNMqA4JIwF0/ktUvpZNVRTOiSiIk2mIVxbrDWS+umQ6QltH3ugIVl6ZFY6t72F39NCj/jqQuZTeiphiVS6aOANjN7BDB0UwK7qpU8jl9I3p8T9Y0nLdPCr/SZ6eNmtgeHQS2riZyrUIaTLrYR4a2twVcw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8575.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFp4NlV5aVBLMVBpemZ3ZnFrZGwrSzhiNGFhYTdmYjlRR3IxSXVoM1hPZkc5?=
 =?utf-8?B?UFZIbW9iczYwU2FHNTViV0Q5NzhDOCtNMVp6ZGJjMXVWSGZxM2ZSVUM1bWho?=
 =?utf-8?B?WnVtd0tWaTZ2aHNpV0ludHk5YlYwd292bk50SE9XRW1UYlErV1pCRCtlS3dq?=
 =?utf-8?B?ZmhQS0NwOFdRNFBjSE9CTWNnMzFmdUtTYXJMTDJnUldEV2NFTVlvdVJVYk9S?=
 =?utf-8?B?V3hWMzJ0d3pxbXk2RFBRTExIb1Y5cWMzaVhiam1FaFpnd3BLYW0vLzZlQmtL?=
 =?utf-8?B?YzB3b28yaWN6TkdwRkFSMkpmQTUwOHZ2cCtpTTNCbHBiVUoyOXVUTnhyRnM0?=
 =?utf-8?B?clUzcGt0aWxJSS9rY3RTQXB3cFJ2SlRCUlNYa1Y4eEpOQjlEczErb0tHYW9p?=
 =?utf-8?B?Ukk3VUpxUGpjOVdSWThnb1NQYWRUekVsVmJEb1RyOWlQVXQvTnhGQ1ZKMTZk?=
 =?utf-8?B?c0tEbUlpVi9LNG00UzVWRXo3UkMwTmZqaVgxY3RVbkZMbTZCTGw0a05oT01J?=
 =?utf-8?B?ZnA1cGtYQS95TWtjSk55QTJ3ekUwcTZZZnc5akF1eDcrSGtVaERVUnpDYmtk?=
 =?utf-8?B?T29ieXNiUHBrUE1lc0dzZ2JvWFpWcVhRZXkySStQMG14bXU1Z0txNGVVWEFo?=
 =?utf-8?B?b3VWWnNRd3FHS2NadVh3UFJFblFOcWZSTTlxU0FIc3c3dHI2K292ZTFhenV2?=
 =?utf-8?B?aVlRckgwMVJlSzZ5U1pPUHkxazZobTJNUDhkOUJSUGVmaS9xeE9yM1VrUVph?=
 =?utf-8?B?QXU3TGY2di93bW5RV3U0QnVXc1BuLzQyaXFkYkFCRWhpL1pCME9QTnRLVVlB?=
 =?utf-8?B?dkE1VkRCeERPTE5zalZmWE4zZ1NoQ1MxbmtESi9COXpmdjZXQXh6c0pGazVj?=
 =?utf-8?B?ZnFIQUhEQjM2dExocDl4QWFoRktrT25HMGxHU2had0Y5QVJzVFRNUkJQSmtX?=
 =?utf-8?B?TjVKSm1icnhGMVFjeXg4dytYMWppTWlTWEZqSExZVktyMmNsUU0zVllFekxx?=
 =?utf-8?B?RWRPRk1Ob0JzQkk1YlB6ZDZKbjNTNXVtM2lSTzJDUDl2d2twZWhHM2xYb3Az?=
 =?utf-8?B?WjNsNkNiNHcxcE5FTEZ2d2hEZTZiMUNzNjl0OC9hMnMxemZBejhmSEdoNFVi?=
 =?utf-8?B?L1hKTmFXTVdzcW5sMkkzamxrTkVZRlJJajUxOGIrQTZQYkxsVThIc0JqSEZx?=
 =?utf-8?B?ajZGVHQxTE5SaTJaZjlkaWlxbDVSeEZsNWNDOXpiWXY5UGJIR1JOdWZHTXNZ?=
 =?utf-8?B?Szlwa3lBWEIydS9DV1drcldVQUhPY0ROcDdwOUFQalBZV1NDVXozZEM1UThH?=
 =?utf-8?B?WFlmZ1BFTVhRckd2YTBDT2daeVpoWnVPeWFiemM2azVVb3FwT1pTQTBiM3Iz?=
 =?utf-8?B?SVU2Q1gvVi8vUkNqY1Nsc3FXeDFpSWJ4K1FWcE42NnFDcTEyRFBsRWhaWDVw?=
 =?utf-8?B?VzNFZER3cWg3THQwaEdVdXgyU1BwcnMrTnhWVWtsKzZ5Z1YrcXRLUmhNWWtH?=
 =?utf-8?B?OFJzMmMrbE5BZStnaEdUbFd0YktVbVR1RjZjUTY5ck1HWkxDQ0hwWnhsRXQx?=
 =?utf-8?B?czdKSmw3d2JQOXZ2Tk5yYk5EL05OOUZoMjRqcldNZEJOYnBET3FpMEZVYVps?=
 =?utf-8?B?eG11cWRWYzIxL3pQVE9EMzhsTm5iQzRaNXZjdFhoTytnM0lVbzdQOWFVTW5a?=
 =?utf-8?B?NGpnUXlWbHNyVmV3NE8xbG5EU1hqVG5sVDVyL0hySmRPd01QS0tsWXpUeE1Q?=
 =?utf-8?B?YXZUWnU0bVdDdTJGZ3VnTVNCN01xSXkyelBuQ2MxNWNzMU93c2pwc1JUZm5T?=
 =?utf-8?B?TVcxN2RWTmd4WDlxb0JSb2NvZ3UwV0NXNUQ4dmZvci9ZQ3c5QXlLY1JDUnFw?=
 =?utf-8?B?WmNuYVMvb0pZMW1oWFBSRzNhZUxXZ3FlMnJ1ZjFzOWFKZmJ0RHlmUkV3ZjJR?=
 =?utf-8?B?ZFFObUNwR0pSL0F4MGxkcmMxVHFGU1lIMEd3T3FjUDNhdWVoZUppZnRWMnBj?=
 =?utf-8?B?T3JTUHZWR0RjM3oxRG9xOVA2RHV0OTRCUEtMR2pGakhwcFpDTmhPWkQwU1ZM?=
 =?utf-8?B?MHFZQW5ibzhIUEI5WDBUUDlacFZMdFVkNUNkT2FTeE85YzdGNVM3alhYNW4w?=
 =?utf-8?B?aWpzYWR2Z1A0L2FBd3FyY0dySVRKeHN4MXZZQnRWWE40eW81Y0Q0Wkd6bFdC?=
 =?utf-8?B?bytKSzU4eTZYK0l6a3pFcGdScUZaSGttSjYyNklkazZhdHRIRDNPaWxxRTFy?=
 =?utf-8?B?OERtUm9KKzFVY3RlM3orWG5qdlVCSTFHMWtTcTZYVnZESDM0aWxoWDl0VGVl?=
 =?utf-8?B?enpsZTIra3lZcnFJTG1XMkZHN013eGxSSmlFalR6WjN2YUFDYVVFQT09?=
X-Exchange-RoutingPolicyChecked: kJFIFX1uk/TnGLWHaj6EUMsY+/omXrNvb7JfCAVhITsq6ky2Sk/e9oPuNiKiKmXQmlHqrHspsgf6MAm6ufRrbyOXu8bfjWZJP7YodG20uEClfHjSFxQtJIx7M0++rADjf5u+/CKj5ADcqAcadTT1f2Qr6Yct0tpOG4vz9jQ6Akjxia3RPwAdMx0cgzEpqU28O76BTph9GWmowWd/OgGqoMVpFvnXFYLDIf1qVzQMjn0cLhhVshQSS/R8mP517zVRL6NYXEGy4e6nlVRTg7Cw37FB6CRkNUPeNHwWtlYm3DOFYOshRYQARCQ4C6kN2SRFuENqs3mqPgGSPs6ytcHqnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a4c36e-c269-46cc-ab7c-08dee71e1bb6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8575.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 11:49:23.4649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LAFBUjUeOzFMCdmCevrkF5ymJ37vAse6e/67Tsb25gW1Ik9ZahNsvVUaWn9wsGqtijTLfzyg19ll14ksw02rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
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


On 21-Jul-26 11:44, Matthew Auld wrote:
> On 21/07/2026 04:20, Matthew Brost wrote:
>> On Wed, Jul 15, 2026 at 02:05:35PM +0100, Matthew Auld wrote:
>>> Hi,
>>>
>>> On 26/05/2026 13:51, Ilia Levi wrote:
>>>> The fault handler currently assumes it always operates on a VMA spanning
>>>> the entire GEM object. This does not hold when the VMA has been split,
>>>> e.g. by a partial munmap or mprotect. In that case the handler may map
>>>> wrong physical pages or cause SIGBUS.
>>>>
>>>> Change the fault handler to map only the GEM subrange corresponding to
>>>> the VMA, and do not set vm_pgoff to zero. Many DRM drivers do this
>>>> because helpers like dma_mmap_pages() interpret vm_pgoff as an
>>>> intra-buffer page offset; leaving the DRM fake offset there would break
>>>> these helpers. Those drivers can get away with zeroing it because they
>>>> map eagerly -- all PTEs are established before mmap returns, so vm_pgoff
>>>> is never consulted again. This driver does not use such helpers and
>>>> defers mapping to the fault handler, where vm_pgoff must be preserved:
>>>> when the kernel splits a VMA it adjusts vm_pgoff, and the fault handler
>>>> subtracts the GEM object's fake mmap offset to recover the page offset
>>>> within the object.
>>>>
>>>> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
>>>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>>
>>> Would it work if we did something like:
>>>
>>> +static int xe_mmio_gem_vm_may_split(struct vm_area_struct *vma, unsigned
>>> long addr)
>>> +{
>>> +       return -EINVAL;
>>> +}
>>> +
>>>   static const struct vm_operations_struct vm_ops = {
>>>          .open = drm_gem_vm_open,
>>>          .close = drm_gem_vm_close,
>>>          .fault = xe_mmio_gem_vm_fault,
>>> +       .may_split = xe_mmio_gem_vm_may_split,
>>>   };
>>>
>>> ?
>>>
>>> I don't think partial unmap or similar is really a real use case for this
>>> type of special mapping. IMO if we can just reject that would be simplest?
>>> What do you think here?
>>>
>>
>> +1 - I don't think split would really be a use case and most xe_mmio_gem
>> usages are likely exactly one page, right?
>
> Yeah, at least in the case of barrier and the other upcoming case I'm interested in, it should be one 4K page. There could be usecases where it's more than one page, but even so I doubt doing partial unmap or whatever is really a needed thing from userspace, for a mapping like this. But if that turns out wrong, loosening the restriction should be fine in the future. IMO keep it dumb & simple, especially given all the bugs we have here.


We could definitely do that, but I'm not sure what we would gain by being more
restrictive.

In terms of implementation, we won't need to store and use pgoff, but I would
still keep the loop change (as it reads more naturally) and remove
vma->vm_pgoff = 0 (since drm_vma_node_unmap() zapping relies on it). 
So it comes out to roughly the same amount of code either way — the .may_split
hook is about the same size as the pgoff handling it replaces.

And while partial unmap indeed doesn't sound useful, I could imagine a use-case
for mprotect, e.g. a hw producer ring whose body is mapped read-only to
userspace while a control/doorbell page stays writable.

If you think a narrower API is preferable though - I'm ok with making the change.

- Ilia

>
>>
>> Matt
>>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_mmio_gem.c | 18 +++++++++++-------
>>>>    1 file changed, 11 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>> index c22a38e5616b..15e884ad3f1c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>> @@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>>>>    struct xe_mmio_gem {
>>>>        struct drm_gem_object base;
>>>>        phys_addr_t phys_addr;
>>>> +    unsigned long pgoff;
>>>>    };
>>>>    static const struct vm_operations_struct vm_ops = {
>>>> @@ -92,6 +93,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
>>>>        if (err)
>>>>            goto free_gem;
>>>> +    obj->pgoff = drm_vma_node_start(&base->vma_node);
>>>> +
>>>>        err = drm_vma_node_allow(&base->vma_node, file);
>>>>        if (err)
>>>>            goto free_gem;
>>>> @@ -147,8 +150,6 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
>>>>        if ((vma->vm_flags & VM_SHARED) == 0)
>>>>            return -EINVAL;
>>>> -    /* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>>>> -    vma->vm_pgoff = 0;
>>>>        vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>>>>        vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>>>>                 VM_DONTCOPY | VM_NORESERVE);
>>>> @@ -190,7 +191,8 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>>        struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>>        struct drm_device *dev = base->dev;
>>>>        vm_fault_t ret = VM_FAULT_NOPAGE;
>>>> -    unsigned long i;
>>>> +    unsigned long addr, pfn;
>>>> +    unsigned long pgoff;
>>>>        int idx;
>>>>        if (!drm_dev_enter(dev, &idx)) {
>>>> @@ -203,13 +205,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>>            return xe_mmio_gem_vm_fault_dummy_page(vmf);
>>>>        }
>>>> -    for (i = 0; i < base->size; i += PAGE_SIZE) {
>>>> -        unsigned long addr = vma->vm_start + i;
>>>> -        unsigned long phys_addr = obj->phys_addr + i;
>>>> +    pgoff = vma->vm_pgoff - obj->pgoff;
>>>> +    pfn = PHYS_PFN(obj->phys_addr) + pgoff;
>>>> -        ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>>>> +    for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
>>>> +        ret = vmf_insert_pfn(vma, addr, pfn);
>>>>            if (ret & VM_FAULT_ERROR)
>>>>                break;
>>>> +
>>>> +        pfn++;
>>>>        }
>>>>        drm_dev_exit(idx);
>>>
>
