Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845C3CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 02:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FD310E072;
	Wed, 27 Aug 2025 02:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izTUO3xY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454AF10E072
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 02:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756263444; x=1787799444;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kcOfnOXYxc/wF/NSDZLG4kGC0YWLQT/IUYuor8i7pbo=;
 b=izTUO3xYdX51zvk9rlKG58NJBOkIsdTYjPsQmh3elO42zdyUwCnwAbtI
 PHXFc2LReR0ObTVDt8BGFAlaZvHwwYrxQUq5rCyDFW4dtjCdRqrYPV+Eq
 qlOxehzktCX7B+osiTBGyGPjEAvVv8+YB8a1ERw4a285ALdxiiztHWIlg
 HC6mnUDaQGxAht+FWHkiJxOvJ1zc7ILz9FXrxjwG7hUs2Cd7XavsmUIPG
 NcK7biHjoH/Tf2NX7wHIJGPTKXr3JzgKUm5/5AiN4IUYjqk5addLxiLEA
 GF5n67NKNPJnXfhN6oMTldG6EeEGHO+AV9Fs+ptr/BwR1bnAvOeYnZPW1 A==;
X-CSE-ConnectionGUID: 6+cQs+JvSz23ywLMDBv6zA==
X-CSE-MsgGUID: +L19NA42RwqSLxuZty5A2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62349151"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62349151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 19:57:24 -0700
X-CSE-ConnectionGUID: xtKrMRsdTE27+33ym88ZTw==
X-CSE-MsgGUID: 54kqllEVR4GyeZQIyUXWDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="175032595"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 19:57:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 19:57:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 19:57:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 19:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Io0EpUNicJc5zqABty2XwB1zctIiR35fZpS6ZFuY/kb/H4C9dpPOYpvyZViygrAo9ybYqCMQ8tQ1/qjB0ZHNAkdq0/tom0p8bZ+SuhAWt9ybJ41jBUrsNIKeDX0BqTqvBcT40fllBMdxFfRD+l0/k9JvmCdNblmLQM3H/0KJ33Q7yvYH8W+lBQuaOCuAPwWLwcwvUl5NUPTPbxitoBWcJHHFeM2HpJ1iBP5UmW17uHXW3Z8eVU0RBaouODi+rve0giNzrzzTzmsv0cyEoA74JOXIQXODHCrjPXeFwBjxarhMpAeLRiWk1RnxgWRKoC6E+XJVSVCNKbTYLWGz0rWk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+167duqydeb2LBJWJf6B9ca0Ki/SFtb7TEptLbaLMYI=;
 b=I39nD+MB58sR/5CAPRoJ4bOLY3PTcsVE2phFsgppdVdAnfHMqTutyQre1lgQT2BFI4wH8HTxnuOn8FTn1Lf1todBELw9RPQwMaJ91MyorxD9dX/6KhMPOmP1Fg+/pNc+7zLplwTmQRywsX5veFqhxQ01DUhU9qQfmBTEmE2o0qix/KzKi9forzL/+qwxJtsT2NuO/yfDNzzZfk/aifyL0fFxZKcRLWp7F36oy6ZWc4FjoMJ6btKxpOoWAYeVdU+0U0OrriIFcUknRf05ilLfcMpShVbkugFOPhn6BG8XQ4AIo8iuoXNHkcVMo8I0hvtxs2IhaSBB8XtKQZl2PBkoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA1PR11MB6990.namprd11.prod.outlook.com (2603:10b6:806:2b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 02:57:20 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 02:57:14 +0000
Message-ID: <1103a410-afd6-420d-aea8-2896c960bda0@intel.com>
Date: Wed, 27 Aug 2025 04:57:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Document GuC submission backend
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20250818033646.2622613-1-matthew.brost@intel.com>
 <20250818033646.2622613-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250818033646.2622613-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::6) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA1PR11MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: c577bdb4-a28e-42af-d2c4-08dde5156d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckFkM2kvVVRIOFplRTB4b3NUOHlxNDIxRU55aTJmalVtL3QzVTZPVHdVbTJn?=
 =?utf-8?B?WGNCS09GR0doUjVqbXlCMzYvSTFweDhtQU0yY1M2Zk13Sm56K0pkOU1QRC8w?=
 =?utf-8?B?YTliL1pDRkwzNndvYWMyV0pFZGZwdFl2bXNpa3NreVlpVTFxOFpMNWpCV1Mz?=
 =?utf-8?B?RkZyYVVXanROZUpIckh4R3RKTi9jbjBoajltU2p3ZnB0aXU1RVhFWEZkMHFz?=
 =?utf-8?B?U2x4cmJUcWhaMlZYazhaK1ByZVBhUmlVNHROMEpsTThVZ0lOcmJQYmVjaDdH?=
 =?utf-8?B?NFNaeHJGa05qck9GSVNHRUpzUFpmOUVyeUhFZWZBWG1MYm9LWGtlbVpYWDBj?=
 =?utf-8?B?MUNqMlRWNmlwS0xqYW1SVlJHVVRVVExkbXdXUHBXNHRVVlhCSDRQa1k2U0xk?=
 =?utf-8?B?WDQwMUxLNitYNTI1eGlLRGtOL3BZeDFiendMa2g3anNSZ3ZQRWdWc1owL3gy?=
 =?utf-8?B?ZUtpK1VDaDRWcHNZY0NUa2xtUTBhUDBaSUJOS0hOMHp0WDVBZXpUQlYvd0tL?=
 =?utf-8?B?aDJNaG1pelI0TDlkUVNzOURjVjBnbXh2MUkySDdsZ09ZSmIrUXUrZ0tlVVlL?=
 =?utf-8?B?TDU5clhyS1Izb3JrY2F0QWx2djF3R1pNRUIrOW9lNlVVWnEzWjJnWjhVanJE?=
 =?utf-8?B?YVpLKzFjVktjUVdqVEFHSUx4aGorcEk0Y0RwVm9UN0RlTmlRVWNqejBHNlVs?=
 =?utf-8?B?NkNrUFJRUE1kRStBKzNkRkpBTVd5R2ZQbTNXUm1MM0pxVy85ekhMdzB2RW5t?=
 =?utf-8?B?ZUlIV3NmaWJScGlTdEJNZDRtL2dhUGlUcEwxU2Y1VXRqNkovaGM5RDBPSE80?=
 =?utf-8?B?NCtwa0JpU0Z0Rm9wUmVQc0tMWmo2UjNhQXdxUFF6NFJGQnRiN1dPUjBTODBQ?=
 =?utf-8?B?d3JXdWRHQU1HcnQ3R0I5OTJkVnF0SzIveGRpQUNHQkRkWHZRRllXeUJIZHU4?=
 =?utf-8?B?c3RBZWlHbnAzbk1DaSsxWVBiS2hKaFVnK0k3aFNnbXJSUTkreWlSZkp6UVVk?=
 =?utf-8?B?RHU0bjIyV0pFM2ZpZjhMZCsvVURla2lGVGZ5VE9jbkV6NWp3K3hPYm9YQnQ0?=
 =?utf-8?B?YkhOOWxTWjY3SEwwSmJzbllVYUwyNXcyM0Qzby92VTU3TDg5eWFKYjFBU1Qy?=
 =?utf-8?B?YXVuZjlES3dBODhFaENGWWtZVVRNZTZJcE5hejFDSk51UWU2bnM3MWhaYnNo?=
 =?utf-8?B?a3dOOHFpemIyOHdPOUR4bS9CYkNQZ3A2TmxtZkRvMy9QbUFEQ2hwT21MN0li?=
 =?utf-8?B?ZlU3RHFBTkdSOXE0WnhLbzgzZDVOZXZ1SFFoR2pNMjF0cnE3dWMwUTBTTzV6?=
 =?utf-8?B?RElQckVnUzNsazF6ZTlNeDhURE9zSFZEbDAvUEM0VmtzWWZDblY1cnBlLzNo?=
 =?utf-8?B?bTMrSnh6ZXgweHdBQ1o5aFM4Q2tYQ3A0WmtpWm5xY0tCT205QTdTSENRdDAx?=
 =?utf-8?B?QWlUSnhFRG9Gb2ZtWlN0ZWJhc1FPUHpaWTAvRDNMc1lQRW1RdXV1Q0RCWElV?=
 =?utf-8?B?Ly95VEg5cDZTa2FTZmQ1V1dGRTFISXF1NDdBSGxWekJKNzdUdzI0OGFEbjlK?=
 =?utf-8?B?MS9NVDRtamVTaXJIaFRCbTJEWTRFcUEzUEVhRDdQeWtIdGhhaWhwdnVzZ0hw?=
 =?utf-8?B?bUU2WTRuQmVnZU93NHVoZ0dTT2VQSktNb2dZaXRHR3B4Q1BPVUw2blVOcm40?=
 =?utf-8?B?aTg3ZFVzMFV4NVFQMDU0a2E5LzhUVXcwVVJFR3RtL0ZPL0kzSzJ2WWpPZW1E?=
 =?utf-8?B?NXBnMzVzQWpCNXhXQnRVKzVJdTRKZVFDVmxUenhxa1F4cVZ4SEl5R2NYbnFj?=
 =?utf-8?B?dEttMmF0L2ZLdEw1RndsSGd0Uk1sN0JoQmRxQys5aDl6c3VrSm0xYnFiV1Ny?=
 =?utf-8?B?a2J5SDcxRnMvY3M2UFNRNUNuK0NkQW83VitNZjU5clBKeGtzVkRJdkNoYUl0?=
 =?utf-8?Q?nAypWOGp+70=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE9SaFY5Uko4SUZZenlja3RPUStUREJud3ZmTHN3Q2t4d0I1RGxLVnBCT0xL?=
 =?utf-8?B?UlgxdEZRRFpTVHhJdlJkUGtSZFJqSjB6L2VVMXQrOUNxK3NOTXRXS2tEWVBz?=
 =?utf-8?B?bmYvdHQ1NmlGaDFOTGhXL21QWm40cC9XSWNCZHpCaXhwYmExZHcyTUFTK1hQ?=
 =?utf-8?B?SGl3Tm9VVzVWcnpzSDZJUCtRbzNYM2ZnNVFhUy9nR3h3a200cm9NODM5U0ZB?=
 =?utf-8?B?VDJlMzRnaER4WkppRURST2ZTdnlWeGRpbmFvaFRlc3N5QXdtL096dkNKMEN6?=
 =?utf-8?B?eTJkclBZUTVQTFcxSW9sc0VGbzlBMkZYK1ZjWERiRDlwTGg4eDAvcG5ncGpI?=
 =?utf-8?B?VjFmT0hhMTF3dG9OZ3Rzd3U0VGlFdStYZWwzb2tYSjErNkQ2c2JWcnVFTUlq?=
 =?utf-8?B?RVFGSlg1S3VjYXF4bDVQVHlFSU5SRkdQaEVIU0J6ZlNUV3ZBK1FvbGlkT29h?=
 =?utf-8?B?VllLQWdVZE5wbUhwRGRZNVMrbzBhQ2NVbzdPekdaWkErQjhPQjU1T0lTTFk2?=
 =?utf-8?B?dXpuRUN6VUtzQTRPV0EzOWdma3FBV0hPaDE1SkxBd1NSbFVVaFRYUk82UGV4?=
 =?utf-8?B?ZUN4L3lzQUY5RUR6UndwOXpHUmVBM0JVWnZlb1M3eUVVZEl3Ykczd3IrSGo1?=
 =?utf-8?B?TXZtSGk1ZzFuUnRKMlB4N3Uxb2ZETHg1a2k0emdxUFlqODZoQ3h3OW8zWC8r?=
 =?utf-8?B?RVdlSFdWQXZkOEJ3c1NTemtkellnTU1BRlhKZzB5WHpuZlY3SGVvd0hSblZ0?=
 =?utf-8?B?N2lYRXlKVHhGWWNQSXc1eUNadjFxVG13T0Zuck5VUGtEWW1WYU9EWHF4QmlW?=
 =?utf-8?B?b0NDMkRJWHRUZ2RSSTFrR3I5WWIxdHVEVGt4dlVWK3ltcVc1WnBDNXltdUN1?=
 =?utf-8?B?SHJqcGlVb0U5czYvVUJzRHBCS3lndzY4aXIyTExHMmVGZExQWVRocHRDeWY3?=
 =?utf-8?B?bFhiQ3pjaWdSeW1WRkhxRW5FVlpHaU4rR3ZWY3IrZDVUbzRWU0t3TG9Jb00v?=
 =?utf-8?B?Q0FRTVRBb0gwY21zY2VzaUdGVUJnU1B1OHpVOHpYVkl3TVRLV3ZRVzVwa2lS?=
 =?utf-8?B?ZXVIK1d5emN4UjNBbU0vTThDVFprU1VNR01kekoxTEt5YVJHVWlqUTBkTGNK?=
 =?utf-8?B?cGFQYlhJTDVnbCtKSWtTTUlBUll0SnR1cVV0Z3daT2ZaV2grQW1UUjFpenl1?=
 =?utf-8?B?OGRDRUdnSlIraHJZY1o1b0RzbGRhZitKeHNSZzY2UlNOTXBHTWlMRURObENk?=
 =?utf-8?B?OTIvb0xsbmw0a3lqNm5QWGRRbDhzMzVYTm1SNUhpK0RkbnlmZytIS2xSNlFU?=
 =?utf-8?B?WFhmZ2FYb2VmSVVCd25VMkU5enhuMVc3MnBiWTJ1TVQ2akIwU05pL0ZCVmZi?=
 =?utf-8?B?YzhTME9GOTUrYmluU1RsT1VpTG5mNnNKU0hmWFhNQzBDa3RiOFNkWTdtUUlm?=
 =?utf-8?B?b3R6TXdFdVZaUTVjbXBodW5wUktvbXlhdWgzQTVZSUN2ZHFRTm11SHg0L0g3?=
 =?utf-8?B?RU5sWDgzNTh3R0xWRHNURHB1S1poUjFhenhUeXFVS21PbEZUZGc3Zk42OWVm?=
 =?utf-8?B?bldYZFEvSjJPcUxZMnphTmhRbjJZWkpUcjFkM0xjQUdYY1Z0a0lyRmUwSjNE?=
 =?utf-8?B?bVQxNnowSDgvRnpzZTBmRnFNbTN3eFRTc0ZWVzhGWUN5dk5RN3F0S0ZVWkpa?=
 =?utf-8?B?QWZPN0VFOFpBdnVGVkF0Y2MwcUxpYWxjZXVsVTFIam9wTnBya0ViZ2Zwbk0r?=
 =?utf-8?B?UWhXYUM5bGM4YklKaDZQL3g5azZlbFMzN2FiNytzVUhoUExxMTFmd3VRU3VK?=
 =?utf-8?B?WFFWcGlNcU5MU1kzU2pzS0tTWnFhZ1g2QUxBZTFsaWxjN2tSVnN4Tk9iWWV6?=
 =?utf-8?B?RUhKYmxsM3liNFVPT2VKQnUvKzdJem5mK0NTWi9NbG1EZmZTV2U2NlZZelMr?=
 =?utf-8?B?cTN5L3dJdG45bTA3MURRL2xHVFhlNGd6ZmRMTzBZeFhaRU5PWE5RWGRBcngy?=
 =?utf-8?B?OHRqYTJZeWRJK09Hai8vckhkalVvUDNvbnNTYTg0RksrOFFBMUN2SlZtbjJY?=
 =?utf-8?B?QkM5bmpQdUdxaytJVklaVG56RlBYK2gzdUtDTEcwYVREN0VrdXdJWU83WjVG?=
 =?utf-8?Q?qeO4JxKODEoUZba7ssuKn1YWs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c577bdb4-a28e-42af-d2c4-08dde5156d1e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:57:14.5904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITF/6lDfsNZpwz0D9xySjxOd8en2XlUMv0jD3GwMYlZPk5Xq5uF2VzjbRWcfu+4VVZbFSuEdpIMpxFuMpbkTaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6990
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


On 8/18/2025 5:36 AM, Matthew Brost wrote:
> Add kernel-doc to xe_guc_submit.c describing the submission path,
> the per-queue single-threaded model with pause/resume, the driver shadow
> state machine and lost-H2G replay, job timeout handling, recovery flows
> (GT reset, PM resume, VF resume), and reclaim constraints.
>
> v2:
>   - Mirror tweaks for clarity
>   - Add new doc to Xe rst files
> v3:
>   - Clarify global vs per-queue stop / start
>   - Clarify VF resume flow
>   - Add section for 'Waiters during VF resume'
>   - Add section for 'Page-faulting queues during VF migration'
>   - Add section for 'GuC-ID assignment'
>   - Add section for 'Reference counting and final queue destruction'
>
> Signed-off-by: <Matthew Brost matthew.brost@intel.com>
> ---
>   Documentation/gpu/xe/index.rst         |   1 +
>   Documentation/gpu/xe/xe_guc_submit.rst |   8 +
>   drivers/gpu/drm/xe/xe_guc_submit.c     | 300 +++++++++++++++++++++++++
>   3 files changed, 309 insertions(+)
>   create mode 100644 Documentation/gpu/xe/xe_guc_submit.rst
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 42ba6c263cd0..27c9f7e87006 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -27,3 +27,4 @@ DG2, etc is provided to prototype the driver.
>      xe_devcoredump
>      xe-drm-usage-stats.rst
>      xe_configfs
> +   xe_guc_submit
> diff --git a/Documentation/gpu/xe/xe_guc_submit.rst b/Documentation/gpu/xe/xe_guc_submit.rst
> new file mode 100644
> index 000000000000..81a41a2ad255
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_guc_submit.rst
> @@ -0,0 +1,8 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=================
> +Xe GuC Submission
> +=================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_submit.c
> +   :doc: Overview
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 1185b23b1384..62f39fde5def 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -45,6 +45,306 @@
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   
> +/*
> + * DOC: Overview
> + *
> + * The GuC submission backend is responsible for submitting GPU jobs to the GuC
> + * firmware, assigning per-queue GuC IDs, tracking submission state via a
> + * driver-side state machine, handling GuC-to-host (G2H) messages, tracking
> + * outstanding jobs, managing job timeouts and queue teardown, and providing
> + * recovery when GuC state is lost. It is built on top of the DRM scheduler
> + * (drm_sched).
> + *
> + * GuC ID assignment:
> + * ------------------
> + * Each queue is assigned a unique GuC ID at queue init. The ID is used in all
> + * H2G/G2H to identify the queue and remains reserved until final destruction,
> + * when the GuC is known to hold no references to it.
> + *
> + * The backend maintains a reverse map GuC-ID -> queue to resolve targets for
> + * G2H handlers and to iterate all queues when required (e.g., recovery). This
> + * map is protected by submission_state.lock, a global (per-GT) lock. Lockless
> + * lookups are acceptable in paths where the queue’s lifetime is otherwise
> + * pinned and it cannot disappear underneath the operation (e.g., G2H handlers).
> + *
> + * Basic submission flow
> + * ---------------------
> + * Submission is driven by the DRM scheduler vfunc ->run_job(). The flow is:
> + *
> + * 1) Emit the job's ring instructions.
> + * 2) Advance the LRC ring tail:
> + *    - width == 1: simple memory write,
> + *    - width  > 1: append a GuC workqueue (WQ) item.
> + * 3) If the queue is unregistered, issue a register H2G for the context.
> + * 4) Trigger execution via a scheduler enable or context submit command.
> + * 5) Return the job's hardware fence to the DRM scheduler.
> + *
> + * Registration, scheduler enable, and submit commands are issued as host-to-GuC
> + * (H2G) messages over the Command Transport (CT) layer, like all GuC
> + * interactions.
> + *
> + * Completion path
> + * ---------------
> + * When the job's hardware fence signals, the DRM scheduler vfunc ->free_job()
> + * is called; it drops the job's reference, typically freeing it.
> + *
> + * Control-plane messages:
> + * -----------------------
> + * GuC submission scheduler messages form the control plane for queue cleanup,
> + * toggling runnability, and modifying queue properties (e.g., scheduler
> + * priority, timeslice, preemption timeout). Messages are initiated via queue
> + * vfuncs that append a control message to the queue. They are processed on the
> + * same single-threaded DRM scheduler workqueue that runs ->run_job() and
> + * ->free_job().
> + *
> + * Lockless model:
> + * ---------------
> + * ->run_job(), ->free_job(), and the message handlers execute as work items on
> + * a single-threaded DRM scheduler workqueue. Per queue, this provides built-in
> + * mutual exclusion: only one of these items can run at a time. As a result,
> + * these paths are lockless with respect to per-queue state tracking. (Global
> + * or cross-queue data structures still use their own synchronization.)
> + *
> + * Stopping / starting:
> + * --------------------
> + * The submission backend supports two scopes of quiesce control:
> + *
> + *  - Per-queue stop/start:
> + *    The single-threaded DRM scheduler workqueue for a specific queue can be
> + *    stopped and started dynamically. Stopping synchronously quiesces that
> + *    queue's worker (lets any in-flight item finish and prevents new items from
> + *    starting), yielding a stable snapshot while an external operation (e.g.,
> + *    job timeout handling) inspects/updates state and performs any required
> + *    fixups. While stopped, no submission, message, or ->free_job() work runs
> + *    for that queue. When the operation completes, the queue is started; any
> + *    pending items are then processed in order on the same worker. Other queues
> + *    continue to run unaffected.
> + *
> + *  - Global (per-GT) stop/start:
> + *    Implemented on top of the per-queue stop/start primitive: the driver
> + *    stops (or starts) each queue on the GT to obtain a device-wide stable
> + *    snapshot. This is used by coordinated recovery flows (GT reset, PM resume,
> + *    VF resume). Queues created while the global stop is in effect (i.e.,
> + *    future queues) initialize in the stopped state and remain stopped until
> + *    the global start. After recovery fixups are complete, a global start
> + *    iterates queues to start all eligible ones and resumes normal submission.
> + *
> + * State machine:
> + * --------------
> + * The submission state machine is the driver's shadow of the GuC-visible queue
> + * state (e.g., registered, runnable, scheduler properties). It tracks the
> + * transitions we intend to make (issued as H2G commands), marking them pending
> + * until acknowledged via G2H or otherwise observed as applied. It also records
> + * the origin of each transition (->run_job(), timeout handler, explicit control
> + * message, etc.).
> + *
> + * Because H2G commands and/or GuC submission state can be lost across GT reset,
> + * PM resume, or VF resume, this bookkeeping lets recovery decide which
> + * operations to replay, which to elide, and which need fixups, restoring a
> + * consistent queue state without additional per-queue locks.
> + *
> + * Job timeouts:
> + * -------------
> + * To prevent jobs from running indefinitely and violating dma-fence signaling
> + * rules, the DRM scheduler tracks how long each job has been running. If a
> + * threshold is exceeded, it calls ->timeout_job().
> + *
> + * ->timeout_job() stops the queue, samples the LRC context timestamps to
> + * confirm the job actually started and has exceeded the allowed runtime, and
> + * then, if confirmed, signals all pending jobs' fences and initiates queue
> + * teardown. Finally, the queue is started.
> + *
> + * Job timeout handling runs on a per-GT, single-threaded recovery workqueue
> + * that is shared with other recovery paths (e.g., GT reset handling, VF
> + * resume). This guarantees only one recovery action executes at a time.
> + *
> + * Queue teardown:
> + * ---------------
> + * Teardown can be triggered by: (1) userspace closing the queue; (2) a G2H
> + * queue-reset notification; (3) a G2H memory_cat_error for the queue; or (4)
> + * in-flight jobs detected on the queue during GT reset.
> + *
> + * In all cases teardown is driven via the timeout path by setting the queue's
> + * DRM scheduler timeout to zero, forcing an immediate ->timeout_job() pass.
> + *
> + * Reference counting and final queue destruction:
> + * -----------------------------------------------
> + * Jobs reference-count the queue; queues hold a reference to the VM. When a
> + * queue's reference count reaches zero (e.g., all jobs are freed and the
> + * userspace handle is closed), the queue is not destroyed immediately because
> + * the GuC may still reference its state.
> + *
> + * Instead, a control-plane cleanup message is appended to remove GuC-side
> + * references (e.g., disable runnability, deregister). Once the final G2H
> + * confirming that GuC no longer references the queue is eligible for
> + * destruction.
> + *
> + * To avoid freeing the queue from within its own DRM scheduler workqueue (which
> + * would risk use-after-free), the actual destruction is deferred to a separate
> + * work item queued on a dedicated destruction workqueue.
> + *
> + * GT resets:
> + * ----------
> + * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
> + * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
> + * as follows:
> + *
> + * 1) Quiesce:
> + *    - Stop all queues (global submission stop). Per-queue workers finish any
> + *      in-flight item and then stop; newly created queues during the window
> + *      initialize in the stopped state.
> + *    - Abort any waits on CT/G2H to avoid deadlock.
> + *
> + * 2) Sanitize driver shadow state:
> + *    - For each queue, clear GuC-derived bits in the submission state machine
> + *      (e.g., registered/enabled) and mark in-flight H2G transitions as lost.
> + *    - Convert/flush any side effects of lost H2G.
> + *
> + * 3) Decide teardown vs. replay:
> + *    - If a queue's LRC seqno indicates that a job started but did not
> + *      complete, initiate teardown for that queue via the timeout path.
> + *    - If no job started, keep the queue for replay.
> + *
> + * 4) Resume:
> + *    - Start remaining queues; resubmit pending jobs.
> + *    - Queues marked for teardown remain stopped/destroyed.
> + *
> + * The entire sequence runs on the per-GT single-threaded recovery worker,
> + * ensuring only one recovery action executes at a time; a runtime PM reference
> + * is held for the duration.
> + *
> + * PM resume:
> + * ----------
> + * PM resume assumes all GuC submission state is lost (the device may have been
> + * powered down).
If device was powered down, all GuC state is lost - not only submission 
state.
>   It reuses the GT reset recovery path, but executes in the
> + * context of the caller that wakes the device (runtime PM or system resume).
> + *
> + * Suspend entry:
> + *  - Control-plane message work is quiesced; state toggles that require an
> + *    active device are not enqueued while suspended.
> + *  - Per-queue scheduler workers are stopped before the device is allowed to
> + *    suspend.
> + *  - Barring driver bugs, no queues should have in-flight jobs at
> + *    suspend/resume..
> + *
> + * On resume, run the GT reset recovery flow and then start eligible queues.
> + *
> + * Runtime PM and state-change ordering:
> + * -------------------------------------
> + * Runtime/system PM transitions must not race with per-queue submission and
> + * state updates.
> + *
> + * Execution contexts and RPM sources:
> + *  - Scheduler callbacks (->run_job(), ->free_job(), ->timeout_job()):
> + *    executed with an active RPM ref held by the in-flight job.
> + *  - Control-plane message work:
> + *    enqueued from IOCTL paths that already hold an RPM ref; the message path
> + *    itself does not get/put RPM. State toggles are only issued while active.
> + *    During suspend entry, message work is quiesced and no new toggles are
> + *    enqueued until after resume.
> + *  - G2H handlers:
> + *    dispatched with an RPM ref guaranteed by the CT layer.
> + *  - Recovery phases (GT reset/VF resume):
> + *    explicitly get/put an RPM ref for their duration on the per-GT recovery
> + *    worker.
> + *
> + * Consequence:
> + *  - All submission/state mutations run with an RPM reference. The PM core
> + *    cannot enter suspend while these updates are in progress, and resume is
> + *    complete before updates execute. This prevents PM state changes from
> + *    racing with queue state changes.
> + *
> + * VF resume:

I am confused, is that a chapter about VF restore, or about PM resume on VF?

I started commenting below treating it as PM chapter - and yes during VF 
resume the GGTT can change, at least for hibernation. But during resume 
no contexts can be created, and there are no lost H2G as that was all 
cleared while suspending. We should name this for migration step - 
restore rather than resume. and the resume chapter should mention the 
specific quirks of VF execution (or real VF resume could be a new chapter).

> + * ----------
> + * VF resume resembles a GT reset,
I'm not sure this analogy gets us anywhere. VF restore is its own thing. 
GuC is not reset, and it not only stores CT buffers but also context 
states, including pending and preempted submissions. Also it isn't 
responding to commands.
>   but GuC submission state is expected to
> + * persist across migration; in-flight H2G commands may be lost,
No, they're not lost, just require fixups. It may be KMDs decision to 
ignore the existing commands and treat them as lost.
>   and GGTT
> + * base/offsets may change. Recovery proceeds as follows:
> + *
> + * 1) Quiesce:
> + *    - Stop all queues and abort waits (as with GT reset) to obtain a stable
> + *      snapshot.
> + *    - Queues created while VF resume is in-flight initialize in the stopped
> + *      state.
> + *
> + * 2) Account for lost H2G
Should be "Treat the H2G as lost". It's not really lost.
>   and prepare in-place resubmission (GuC/CT down):
> + *    - Treat in-flight H2G (enable/disable, etc.) as dropped; update shadow
> + *      bits to a safe baseline and tag the ops as "needs replay".
> + *    - Quarantine device-visible submission state: set the GuC-visible LRC ring
> + *      tail equal to the head (and, for WQ-based submission, set the WQ
> + *      descriptor head == tail) so that when the GuC comes up it will not process
> + *      any entries that were built with stale GGTT addresses.
> + *    - Reset the software ring tail to the original value captured at the
> + *      submission of the oldest pending job, so the write pointer sits exactly
> + *      where that job was originally emitted.
> + *
> + * 3) Replay and resubmit once GuC/CT is live:
> + *    - VF resume invokes ->run_job() for pending jobs; ->emit_job() overwrites
> + *      ring instructions in place, fixes GGTT fields, then advances the LRC
> + *      tail (and WQ descriptor for width > 1). Required submission H2G(s) are
> + *      reissued and fresh WQ entries are written.
> + *    - Queue lost control-plane operations (scheduling-state toggles, cleanup)
> + *      in order via the message path.
> + *    - Start the queues to process the queued control-plane operations and run
> + *      the resubmitted jobs.
> + *
> + * The goal is to preserve both job and queue state; no teardown is performed
> + * in this flow. The sequence runs on the per-GT single-threaded recovery
> + * worker with a held runtime PM reference.
Since this explains the VF restore (or rather VF post-migration 
recovery, the largest part of VF restore is done earlier by PF) only 
from the perspective of submission (as it should, in this context), it 
would make sense to put here a reference to the actual VF restore 
documentation (DOC: VF restore procedure in PF KMD and VF KMD).
> + *
> + * Waiters during VF resume
VF restore / VF post-migration recovery
> + * ------------------------
> + * The submission backend frequently uses wait_event_timeout() to wait on
> + * GuC-driven conditions. Across VF migration/resume two issues arise:
> + * 1) The timeout does not account for migration downtime and may expire
> + *    prematurely, triggering undesired actions (e.g., GT reset, prematurely
> + *    signaling a fence).
> + * 2) Some waits target GuC work that cannot complete until VF resume finishes;
> + *    these typically sit on the queue-stopping path.
> + *
> + * To handle this, all waiters must atomically test the "GuC down / VF-resume
> + * in progress" condition (e.g., VF_RESFIX_BLOCKED) both before sleeping and
> + * after wakeup. The flag is coherent with VF migration: vCPUs observe it
> + * immediately on unhalt, and it is cleared only after the GuC/CT is live again.
> + * If set, the waiter must either (a) abort the wait without side effects, or
> + * (b) re-arm the wait with a fresh timeout once the GuC/CT is live. Timeouts
> + * that occur while GuC/CT are down are non-fatal—the VF-resume path will
> + * rebuild state—and must not trigger recovery or teardown.
can we rephrase to reduce the amount of dashes in last sentence?
> + *
> + * Page-faulting queues during VF migration
> + * ----------------------------------------
> + * Page-faulting queues are susceptible to state corruption if they are runnable
> + * when vCPUs are halted for VF migration. Consider: vCPUs halt while a
> + * page-faulting queue has an outstanding fault; the fault cannot be serviced,
> + * the GuC attempts to preempt the queue, but page faults are not preemptible.
> + * This creates a deadlock that can lead the GuC to reset the page-faulting
> + * queue, corrupting its state.
> + *
> + * Mitigation:
> + *  - Before vCPU halt, upper layers must issue a control-plane suspend message
> + *    for all page-faulting queues and wait for completion (i.e., ensure they
> + *    are not runnable).
> + *  - After VF resume completes (e.g., global start of queues), issue a
> + *    control-plane resume message for all page-faulting queues.
> + *
> + * The Xe HW engine-group layer already provides suspend/resume for
> + * page-faulting queues; the VF migration flow should hook into these helpers.

How page faults will be handled is not settled yet.

-Tomasz

> + *
> + * Relation to reclaim:
> + * --------------------
> + * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
> + * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
> + * message handling, and all recovery paths) lies on the reclaim path and must
> + * be reclaim-safe.
> + *
> + * Practical implications:
> + * - No memory allocations in these paths (avoid any allocation that could
> + *   recurse into reclaim or sleep).
> + * - The global submission-state lock may be taken from reclaim-tainted contexts
> + *   (timeout/recovery). Any path that acquires it (including queue init/destroy)
> + *   must not allocate or take locks that can recurse into reclaim while holding
> + *   it; keep the critical section to state/xarray updates.
> + */
> +
>   static struct xe_guc *
>   exec_queue_to_guc(struct xe_exec_queue *q)
>   {
>
