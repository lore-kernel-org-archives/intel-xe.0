Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16783D232C1
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 01:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A9A10E113;
	Fri,  9 Jan 2026 01:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Euylp1pz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B0C10E113
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 01:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767920436; x=1799456436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=soXGQAFro00L6VaZfYHOAMzB6c0fbIcuWWyo/Y0WG3U=;
 b=Euylp1pzeiwusVrWUHo2wu/bMchS1OVISkjdb2vRxPICVvdSr8Uddrup
 VG2sdsF86nxKRyWRsfvWj+L7QMBK2YvOEo+x/Zz36thEd/MJrkKdPre7W
 pPCsumggp6Ar1TEFED/debJiEQ5Rk187wsTURSgfN11z7meTd6eAZCM/1
 H8mmoUn2dGJhFO/4D6REShfB8P1R1BILW8M0GCJU3zYffEi+lbpUSK5My
 aiqAnrFfqXGEdjHYbE1MAY7sYBicWGwzCpUuUeH3sSefSbC5p3Qa6ubKN
 owiATDq9RqIUcYDctbqgjmyMU+icNmzSSgTvJuv/pK5rlJJ8ZgsyATInC A==;
X-CSE-ConnectionGUID: nvR4o6GQQ8ykOUSiE5TO6A==
X-CSE-MsgGUID: zSKPplN7SryQ/YCFerwD4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="72941791"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="72941791"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 17:00:35 -0800
X-CSE-ConnectionGUID: DA5o81dzSNiVCuDS/Pfr5A==
X-CSE-MsgGUID: UROBNe1YSa64W3mPCedgQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203120014"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 17:00:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 17:00:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 17:00:34 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 17:00:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkgKZx+Wb+sBBWITYFATN6fop1Nbg6Y061pGDdE3wAwMw19wKZnEK/aurYYLt3DmeJjfWPLrSjSOt157Tzt3vbCDPY04pKj/zBYfstJaDaFaqZfIh43udwEe8QYqYwcu5qz7s4QVFSA602on6AV+kVIfdkNBbcRrNKS0HHb8JmnH7WBpgX6hYftUzmKHdPPuEbwCYJ4Y4vqpwlqKAguH2J8cH3LHJJUDK8oi61blFdlsmaheLGaoZakgz7tcOsGKL6slVJxdyP9UteBsxNswQWFCdH2ng3o/v4nLeYPgV/YFBbfJvFeXXpPiJVXpj3LzfXFT8qtB86OFHxXT78N0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cVj1YCv7fPaR5CqkZhtBaq1dfMUgkH4XqOcZ/Wn5xM=;
 b=Sm3OCc4KfUCQFb+NmtfY/nHiB1hZDwvPwgBsokbM5sDEhePcy/D5UKwWXGTErzxlkhZ3vYzMPk8cDe5Hh+BiJHZTfxD/sra1OHk3M6whflWoFoM4nAz3JF96RNo1DR6tK3H0GZbY340UEQoTxrIQjhXym3YeoBRcmAUtWrDba+OTxsGOZqkFM1PhSdJ7V0afdRy4QGPFNRh3XYYN9+0wjV8nXCASooXakPPv55CHsgBapNOm+0wqGMf853esFIbqA5mBOeDJnBtPQCijaQVPKi/KtouKDIiQfJiKVwL8b6/+p/J/IcZed19538WKwZJ7qarJ+vpwHLekns41+ptUtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 01:00:31 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 01:00:31 +0000
Message-ID: <b7445ae6-134c-41dc-8204-44e83d934bca@intel.com>
Date: Thu, 8 Jan 2026 17:00:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Allow compressible surfaces to be 1-way
 coherent
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20260108014257.398697-1-x.wang@intel.com>
 <37ad5960-4b56-4af0-ba81-faf03b2f54e4@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <37ad5960-4b56-4af0-ba81-faf03b2f54e4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d1ece9-fab6-4709-4ea6-08de4f1a7ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFMrSmRIWjdGeEZVaFQxaFFKRktRdXZicEh5enNKUk1weWNlT0hHRUwwYUZi?=
 =?utf-8?B?YW5CdjlKWlFEa0I5ZThBbWYybHZCSUVyT085Q0lLSEx3QWh2OHExQ1l0R2R0?=
 =?utf-8?B?VjJGNERzQ1Jpa2k2M0s0Nys0T2pYdlpxWVZoazF4N05kNE54Y0kxa0lHcjFT?=
 =?utf-8?B?eDBHakdjdXJ4OUFvZkRuV3NUamdOUmlmVzVWVm12bFNBaGNFaTBVRENCaVA3?=
 =?utf-8?B?ZHdZbTlTTHVOZllyWUNJdVpDVXVTUDhJQjNtZ01VMFdRV3lKSDMvcE5HZ3hQ?=
 =?utf-8?B?SGtReVVWZ04yWjBBT29FdUJ4c0YzMUliT3pqR0lqT2xvdEswd25aR2p6MnFu?=
 =?utf-8?B?OGVpT29ubWlMZGFxdys0U0NBbFR0VERjWW80a2VZWjFCSkJlWWNtS1lqcG0y?=
 =?utf-8?B?WVJoOUNaZWV1TURMeG9aRlBEV21SWEhsSmhxMlc1Mlk0MXg5V0hkdExCdEd3?=
 =?utf-8?B?RUhNZmw0OStITmthZXpJd3h5cXZ1YlkvUGo4SkZSc2xuU2FHcG9Hc3IvWUVq?=
 =?utf-8?B?R1lGSGNmN2NaVTFZVU9NOW1rSkRINXVIU2JEL3FUMXU0Znc3VkMyVTdLeEd3?=
 =?utf-8?B?RGU1YWFZZzJDdjF1ZXBLbFpYdWszQk9ObGtlUUxzN3ErN3NPMm91WVFtUEp1?=
 =?utf-8?B?TndTaHAzMU9XeDJzTUIwenNpOFhUekhldk9ob1paNnN5V3I3SEJXeFAzaUhE?=
 =?utf-8?B?S3d4bFdZcU80UXFyUHlzaHZJbVR0aGF6WlIrcFRZUW5OTmpkdmdVZEdEclFE?=
 =?utf-8?B?Ti85UTNKL2kyVnBNZnBaNThpOW1XWFRRNDU1ak54L0k5Zkk5MUVoS0xpZ3Fo?=
 =?utf-8?B?VGEybyt5UFVreWpCN1R5dmxUV0pJZHgwY0VMWmNjK0lqa3F1STliTmVMWk9r?=
 =?utf-8?B?MXBMUzNvdEFKVm44SGNaRlBHNElGTFJKQk9iakJubnBNS3VmVWtnejZoYngz?=
 =?utf-8?B?UVVQcERkbVF5RW9JcUZtMldZbHpmcFQ0a0psQ2JiMWk5RmY4c3FuNWI3NEhZ?=
 =?utf-8?B?bUtDWS9TUTUrREFmaHV4OWFqWW14dG8raVlzNzhpbUF0NFZHUy9Fa3A3M252?=
 =?utf-8?B?TGlMRUNocHYwTTA1MmVGTU1TK1BDR2szRlI0M2paTk81cy8zcFZteWNSWFly?=
 =?utf-8?B?YUlYbkRwT1FZejNDSE1QcndESUJNdkVJUEVDb2VtWUZkTDcyMlV2Qmk0MnJa?=
 =?utf-8?B?UTg4aDk3alF4WnRDME1taDFkSG9BRDMrenpnb1dNZ2VLcmhLRjN6emJoNHdt?=
 =?utf-8?B?akJEaWlsaXF4aXNRN0xGQ2M0d3ZYNDVhQjEveENQM0tnMUV5b3dyaWJHd2pJ?=
 =?utf-8?B?TlV3MHZ4ZnRsS3hZV1Q5YVdKWFJRNDZDL3pNdHJoTTFUdEpnMkhsb2doZFZz?=
 =?utf-8?B?Q29Sdk41T29ua0RhbHBUakMyOTJJQW15bjRLODBjK0ZHWWg2U0VNWEZDRjc4?=
 =?utf-8?B?TFlRSTJUSW82a2dieU0zMGVTM0VkR25yYmxoNzlOVjNrSFVpb3o4ZGFVK3I0?=
 =?utf-8?B?S1E4L3hEa3ArZDJDZWZ2Tlgxc3NjRThUZ2FlRjY5N1Vzb2VYOEcxdUVUaHlG?=
 =?utf-8?B?VGlldlFXMzRmd2ZwdERDVzhzdnFZOGR4Zjk3OEpNVlFiUUhhcFZrYWxjNCtl?=
 =?utf-8?B?ODVKSDlGaHBEdHhwMzIrYUszRm51ME5Xcm12YmZlSmt2NysweHc1ZHFrdERR?=
 =?utf-8?B?c2theHZnbEp2VlVRMW9xeUM4WUEvaENJL0t2ZGkzK0hERW1BLzdXSGRsaFIy?=
 =?utf-8?B?TGkyVkNTZnd4bVhqZTArcUthc3hxR1ExbWp6aG5qOEUweU1welBINkdPV09B?=
 =?utf-8?B?elNpUC9LSmVyVzRQTkphem5CbXBYQm81cVFMbER5SWlKZXUxSjFKaGRMNkMw?=
 =?utf-8?B?Sktnblp1UmJiL3JkMmNlb3dVRkNKSUZMZ0I3bjZnSy9TbytxNmJnU2xHMk1H?=
 =?utf-8?Q?KJvwbDYtiXZL7KowS/MT//y+mwX66YnA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFp2d09yMXNvSS9OY1R6ZUVBeTdMc2ZrZUF5cjgwb3VSU1RrU04wUjBQNUt5?=
 =?utf-8?B?L281MTQrRkc5QWhFSm5DV2JLMmtSMVd3czAvc2VrQnN5VjZMRjlpdWVTKzFD?=
 =?utf-8?B?bXN4Mk1ZS3dYb0xMVEhsMWg2YWxBcC8vU0Z6RkJuQkZoSkg2Wk5HUXBpNmJs?=
 =?utf-8?B?dWxMN2JqQTBYTjlTb0Uybmh6Qk50V3RZaTdvd2lmdEZjQVVCbU05UDFhYXVW?=
 =?utf-8?B?aXkrWFFnWGdxdHd6U1JORVZ3Mmh3MWVUT2dlV2VlNkJjQ21KM2JQU0d2SVl3?=
 =?utf-8?B?UnlJOWlaaXJTVnZMdTJRTEZpcTVhM0U3ZDNGblIvbWVTQ0d2bCtLbUYxZldY?=
 =?utf-8?B?czhIYjFqMk54WllOOUUycitWRXE3d2IrMGdDVjlNNnRwZG4vdmlaYzJ3azI2?=
 =?utf-8?B?NTRWNFlEMERac0xmb0JLU3NiUy9hVEFCMUlGUERPWFFvMnlSWkhCc1cwdFdy?=
 =?utf-8?B?N2NDdk8zOHZOTHR6Z3N3N2VJNWRvMit2WWRncFF2VTFwNHZPUkxmWlRXem5R?=
 =?utf-8?B?M2lPaWk1WitqaHRTUnVyTlhmb1J1LzJYUnZjZEE0SHU4Y3dqMFhxUkw0dWto?=
 =?utf-8?B?My9rZENIMTljSmkzTlZiVjR2aElxYlZzZmNJVkNab3htVHk4elZlaVEzN3d4?=
 =?utf-8?B?aXVUbWhDcWNkUWgxcjdoOFdtdjVLcW9XWk93djhjcnJUV3o0OVZCcXdBcnQ0?=
 =?utf-8?B?ZHpSWWZyVExkOHliRnhBMVBNek5uWGRsQzBHMEl1K256eU43NXpLQVNjaTRV?=
 =?utf-8?B?U014YWpWVlpEb0FiK0I3dDlILytqc1BZbnpGM2w0MGhYQWVoS1Y5Z0x3OGNO?=
 =?utf-8?B?amphUFgwcDZ1NkN2bDZpL1QrLzErY3pRZHZSVm1zNHFCU3p3K1poTXVSaHhz?=
 =?utf-8?B?QlRZYThoQU5pbmloOGYxczExTGtZSjMwZFd2NXZOWCtqNktzNFE4WmFDV1JB?=
 =?utf-8?B?WGVKYmUvZFpxOEhGSDNRTzJ2ZHYwdTdzbndkZS9ZWlVVb3dJSERuYjdJNFBk?=
 =?utf-8?B?MTU4SXlUZFdMNHh3VG5CR21WOHhJb2xHK3ltSnI3cUpPNFVNUEhhSWVWMU5h?=
 =?utf-8?B?b25hazR0QldOaHY4cXUzL2lSdGhGaG1wbmx3SDVweFltTjR1UGc3bHd4aGZs?=
 =?utf-8?B?TFRnRjZqbWwxbEIzQnNvM2UvUHhRUk9mM1F3UktSOHI1cGJldElzTzZhUDYz?=
 =?utf-8?B?Rmk0TWdhVFl5MEVIWTNJbmRsWXQxVHZOMGtoMTNJSUZ0STdyRml2amNheDhz?=
 =?utf-8?B?cS9WeGJmUHRmQTZkWWdBYVliUWFHWjdybVIxc1lHclZhclIvUDVpdGZZT1N1?=
 =?utf-8?B?aW10bW9QZmk5Ykc1L05teWNBNUdtSmZXM2Nkdm5GVjc1UFdtZTRUR3gram9j?=
 =?utf-8?B?RGY4YjF4czdOQWw0VDhjSnhsN3psaHhXWmNGejgvWUZqaGNURmcxUUhySE5p?=
 =?utf-8?B?Y1ZOWGYveWc5SmJmSlJ5aUU2MFo5LzBPUms5OTlWV0VYYVMwK2lKSWsyTEMz?=
 =?utf-8?B?YWdET3N0cjVYRFoxSG41ang4L3BqMWJ6eUY4UXFqdFNhR0tuZDc0anFsdm1o?=
 =?utf-8?B?aWRwc0tXWmVBTkJXU0FBNHRaSXkwZzhVL2MzNUs4VlY2MTc0UFlQbFVPNFBO?=
 =?utf-8?B?Q3dNZ3BLaVcwa1RHNTJ1SEt0eDdOeG9Sa2czR2UxeHptc2gwZS80cjFMZTN0?=
 =?utf-8?B?WXhjZUxMWThhdzF0ZTMrNzMwVjFZc2ozeTh2eWlNWUh1RUhldHFmSVN6bHl1?=
 =?utf-8?B?amswb1JDVExKVTV6TE1OekREM1VHVzdTOUFZSEt1SSt0SElTanlIQ2R0cVhi?=
 =?utf-8?B?OW1MY2VxNGtJQ3VGcEduTDdZOTErMWVUU1gxM1YwYjBIa3NDUFM0ZWxXa0xC?=
 =?utf-8?B?aFlMRW5WWTRNZm9vLy96NU1mL283UzdidTc1UVpmdThSUzNjblBZQnFSNjRP?=
 =?utf-8?B?NEdFb2MvVkdMaUlFWlRNenhqMHVyVUxZTWVjWVZmK2pVcDR4UVdWMzNxRjJ2?=
 =?utf-8?B?dmpXSGxiZGJaSUZ2QmgyT2kwU3p1QjFXNitkZ1IwMFhacGN4NmJsdm81Vk03?=
 =?utf-8?B?K0hXWkFLbFR0U0hEbEs0MTVSRkdzdFU1TzZDVk0rNGFlLzA1a2lkZC9oS0pB?=
 =?utf-8?B?U09MenhINnRXcVR1bkpTWWlJcHFWamNnYkNTV01FTG15QzlqdWd2TW93RWhO?=
 =?utf-8?B?WWp0WjBUSmpQTmFKNjNleXk0cVBrdTVoMlJFRWo0ampYSFd4dnNXUVJKN3Rq?=
 =?utf-8?B?Qjl4Y0RtdUtwbWVGcitCeCtubk40RkxBcG5YU2RIcWtodEV1UUtmU05KR2hx?=
 =?utf-8?B?RG5jQjJLcjJZWkU2bW9naW1WSXFMakZoUU5JOHJoMzR2MmczT3ltUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d1ece9-fab6-4709-4ea6-08de4f1a7ccb
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 01:00:31.6192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +09e47YbAz1GuUZVp2IczxQv1ub9dTYZE75X4Z5ByweF2Ac0uR/Jx2Aploc3Kb7MinbQbJX9/SltIXCI1om1EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
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



On 1/8/2026 04:43, Matthew Auld wrote:
> On 08/01/2026 01:42, Xin Wang wrote:
>> Previously, compressible surfaces were required to be non-coherent 
>> (allocated
>> as WC) because compression and coherency were mutually exclusive. 
>> Starting
>> with Xe3, hardware supports combining compression with 1-way coherency,
>> allowing compressible surfaces to be allocated as WB memory. This 
>> provides
>> applications with more efficient memory allocation by avoiding WC 
>> allocation
>> overhead that can cause system stuttering and memory management 
>> challenges.
>>
>> The implementation adds support for compressed+coherent PAT entry for 
>> the
>> xe3_lpg devices and updates the driver logic to handle the new 
>> compression
>> capabilities.
>>
>> v2: (Matthew Auld)
>>   - Improved error handling with XE_IOCTL_DBG()
>>   - Enhanced documentation and comments
>>   - Fixed xe_bo_needs_ccs_pages() outdated compression assumptions
>>
>> v3:
>>   - Improve WB compression support detection by checking PAT table 
>> instead
>> of version check
>>
>> v4:
>>   - Add XE_CACHE_WB_COMPRESSION, which simplifies the logic.
>>
>> Bspec: 71582, 59361, 59399
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++
>>   drivers/gpu/drm/xe/xe_bo.c           | 17 ++++-----
>>   drivers/gpu/drm/xe/xe_gt.c           | 32 +++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pat.c          | 52 ++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_pat.h          |  2 ++
>>   drivers/gpu/drm/xe/xe_pt_types.h     |  1 +
>>   drivers/gpu/drm/xe/xe_vm.c           | 13 +++++++
>>   7 files changed, 109 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 93643da57428..24fc64fc832e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -89,6 +89,7 @@
>>   #define   UNIFIED_COMPRESSION_FORMAT        REG_GENMASK(3, 0)
>>     #define XE2_GAMREQSTRM_CTRL            XE_REG_MCR(0x4194)
>> +#define   EN_CMP_1WCOH                REG_BIT(15)
>>   #define   CG_DIS_CNTLBUS            REG_BIT(6)
>>     #define CCS_AUX_INV                XE_REG(0x4208)
>> @@ -101,6 +102,11 @@
>>     #define XE2_LMEM_CFG                XE_REG(0x48b0)
>>   +#define XE2_GAMWALK_CTRL            0x47e4
>> +#define XE2_GAMWALK_CTRL_MEDIA XE_REG(XE2_GAMWALK_CTRL + 
>> MEDIA_GT_GSI_OFFSET)
>> +#define XE2_GAMWALK_CTRL_3D XE_REG_MCR(XE2_GAMWALK_CTRL)
>> +#define   EN_CMP_1WCOH_GW            REG_BIT(14)
>> +
>>   #define XEHP_FLAT_CCS_BASE_ADDR            XE_REG_MCR(0x4910)
>>   #define XEHP_FLAT_CCS_PTR            REG_GENMASK(31, 8)
>>   diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 8b6474cd3eaf..637adefd020d 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -29,6 +29,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_map.h"
>>   #include "xe_migrate.h"
>> +#include "xe_pat.h"
>>   #include "xe_pm.h"
>>   #include "xe_preempt_fence.h"
>>   #include "xe_pxp.h"
>> @@ -3517,16 +3518,16 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>>       if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
>>           return false;
>>   +    /* Check if userspace explicitly requested no compression */
>> +    if (bo->flags & XE_BO_FLAG_NO_COMPRESSION)
>> +        return false;
>> +
>>       /*
>> -     * Compression implies coh_none, therefore we know for sure that WB
>> -     * memory can't currently use compression, which is likely one 
>> of the
>> -     * common cases.
>> -     * Additionally, userspace may explicitly request no compression 
>> via the
>> -     * DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag, which should also 
>> disable
>> -     * CCS usage.
>> +     * For WB (Write-Back) CPU caching mode, check if the device
>> +     * supports WB compression with coherency.
>>        */
>> -    if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB ||
>> -        bo->flags & XE_BO_FLAG_NO_COMPRESSION)
>> +    if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB &&
>> +        xe->pat.idx[XE_CACHE_WB_COMPRESSION] == XE_PAT_INVALID_IDX)
>>           return false;
>>         return true;
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 313ce83ab0e5..04dbf995a18b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -140,6 +140,36 @@ static void xe_gt_disable_host_l2_vram(struct 
>> xe_gt *gt)
>>       xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>>   }
>>   +static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    unsigned int fw_ref;
>> +    u32 reg;
>> +
>> +    if (IS_SRIOV_VF(xe))
>> +        return;
>> +
>> +    if (GRAPHICS_VER(xe) >= 30 && xe->info.has_flat_ccs) {
>> +        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +        if (!fw_ref)
>> +            return;
>> +
>> +        reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>> +        reg |= EN_CMP_1WCOH;
>> +        xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>> +
>> +        if (xe_gt_is_media_type(gt)) {
>> +            xe_mmio_rmw32(&gt->mmio, XE2_GAMWALK_CTRL_MEDIA, 0, 
>> EN_CMP_1WCOH_GW);
>> +        } else {
>> +            reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMWALK_CTRL_3D);
>> +            reg |= EN_CMP_1WCOH_GW;
>> +            xe_gt_mcr_multicast_write(gt, XE2_GAMWALK_CTRL_3D, reg);
>> +        }
>> +
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    }
>> +}
>> +
>>   static void gt_reset_worker(struct work_struct *w);
>>     static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
>> @@ -466,6 +496,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt 
>> *gt)
>>       xe_gt_topology_init(gt);
>>       xe_gt_mcr_init(gt);
>>       xe_gt_enable_host_l2_vram(gt);
>> +    xe_gt_enable_comp_1wcoh(gt);
>>         if (xe_gt_is_main_type(gt)) {
>>           err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>> @@ -745,6 +776,7 @@ static int do_gt_restart(struct xe_gt *gt)
>>       xe_pat_init(gt);
>>         xe_gt_enable_host_l2_vram(gt);
>> +    xe_gt_enable_comp_1wcoh(gt);
>>         xe_gt_mcr_set_implicit_defaults(gt);
>>       xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 2c3375e0250b..14d0dce5190a 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -132,9 +132,10 @@ static const struct xe_pat_table_entry 
>> xelpg_pat_table[] = {
>>    * in the table.
>>    *
>>    * Note: There is an implicit assumption in the driver that 
>> compression and
>> - * coh_1way+ are mutually exclusive. If this is ever not true then 
>> userptr
>> - * and imported dma-buf from external device will have uncleared ccs 
>> state. See
>> - * also xe_bo_needs_ccs_pages().
>> + * coh_1way+ are mutually exclusive for platforms prior to Xe3. 
>> Starting
>> + * with Xe3, compression can be combined with coherency. If using 
>> compression
>> + * with coherency, userptr and imported dma-buf from external device 
>> will
>> + * have uncleared ccs state. See also xe_bo_needs_ccs_pages().
>>    */
>>   #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, 
>> __coh_mode) \
>>       { \
>> @@ -144,8 +145,7 @@ static const struct xe_pat_table_entry 
>> xelpg_pat_table[] = {
>>               REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
>>               REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
>>               REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
>> -        .coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || 
>> __coh_mode) ? \
>> -            XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
>> +        .coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
>>           .valid = 1 \
>>       }
>>   @@ -181,6 +181,38 @@ static const struct xe_pat_table_entry 
>> xe2_pat_table[] = {
>>       [31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
>>   };
>>   +static const struct xe_pat_table_entry xe3_lpg_pat_table[] = {
>> +    [ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
>> +    [ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),
>> +    [ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),
>> +    [ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),
>> +    [ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),
>> +    [ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),
>> +    [ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),
>> +    [ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),
>> +    [ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),
>> +    [ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),
>> +    [10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),
>> +    [11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),
>> +    [12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),
>> +    [13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),
>> +    [14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),
>> +    [15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),
>> +    [16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),
>> +    /* 17..19 are reserved; leave set to all 0's */
>> +    [20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),
>> +    [21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),
>> +    [22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),
>> +    [23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),
>> +    [24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),
>> +    [25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),
>> +    [26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),
>> +    [27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),
>> +    [28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),
>> +    [29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),
>> +    [30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),
>> +    [31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
>> +};
>>   /* Special PAT values programmed outside the main table */
>>   static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 
>> 0, 0, 3, 3 );
>>   static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 
>> 0, 0, 3, 0 );
>> @@ -490,6 +522,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>>     void xe_pat_init_early(struct xe_device *xe)
>>   {
>> +    xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
>
> As a follow up series we could maybe also repeat this for 
> XE_CACHE_NONE_COMPRESSION? And maybe also add some asserts in places 
> like pte_encode_pat_index() to check that we never see such an index, 
> or perhaps add a helper accessor function for turning cache mode into 
> pat_index which can check there?
>
>>       if (GRAPHICS_VERx100(xe) == 3511) {
>>           xe->pat.ops = &xe3p_xpc_pat_ops;
>>           xe->pat.table = xe3p_xpc_pat_table;
>> @@ -501,7 +534,12 @@ void xe_pat_init_early(struct xe_device *xe)
>>           xe->pat.idx[XE_CACHE_WB] = 2;
>>       } else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>>           xe->pat.ops = &xe2_pat_ops;
>> -        xe->pat.table = xe2_pat_table;
>> +        if (GRAPHICS_VER(xe) == 30) {
>> +            xe->pat.table = xe3_lpg_pat_table;
>> +            xe->pat.idx[XE_CACHE_WB_COMPRESSION] = 16;
>> +        } else {
>> +            xe->pat.table = xe2_pat_table;
>> +        }
>>           xe->pat.pat_ats = &xe2_pat_ats;
>>           if (IS_DGFX(xe))
>>               xe->pat.pat_pta = &xe2_pat_pta;
>> @@ -658,6 +696,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, 
>> struct drm_printer *p)
>>       if (GRAPHICS_VER(xe) >= 20) {
>>           drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION] = %d\n",
>>                  xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
>> +        drm_printf(p, "IDX[XE_CACHE_WB_COMPRESSION] = %d\n",
>> +               xe->pat.idx[XE_CACHE_WB_COMPRESSION]);
>>       }
>>         return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index d5dadfb7f924..1b2c7d3c7c16 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -12,6 +12,8 @@ struct drm_printer;
>>   struct xe_device;
>>   struct xe_gt;
>>   +#define XE_PAT_INVALID_IDX    U32_MAX
>
> Would U16_MAX be better match here? I believe all the lower level 
> places use u16 for the index. Perhaps that could be cleaned up also at 
> some point so we use u16 everywhere.
>
I checked the lower-level code paths and most places use u16 for
pat_index, so switching XE_PAT_INVALID_IDX from U32_MAX to
U16_MAX seems like a better match.

As a separate follow-up series (after the current patch lands), we could
also apply the same approach to XE_CACHE_NONE_COMPRESSION, and clean
up the remaining pat_index users so we consistently use u16
throughout.

We can also add asserts/WARNs (or a checked accessor) later to ensure an
invalid index is never encoded in places like pte_encode_pat_index().

Xin

> Otherwise I think lgtm.
>
>> +
>>   /**
>>    * struct xe_pat_table_entry - The pat_index encoding and other 
>> meta information.
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h 
>> b/drivers/gpu/drm/xe/xe_pt_types.h
>> index 88fabf8e2655..84b51d3762a4 100644
>> --- a/drivers/gpu/drm/xe/xe_pt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
>> @@ -20,6 +20,7 @@ enum xe_cache_level {
>>       XE_CACHE_WT,
>>       XE_CACHE_WB,
>>       XE_CACHE_NONE_COMPRESSION, /*UC + COH_NONE + COMPRESSION */
>> +    XE_CACHE_WB_COMPRESSION,
>>       __XE_CACHE_LEVEL_COUNT,
>>   };
>>   diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a07d8b53de66..481ee7763b09 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3405,6 +3405,7 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>               DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>>           u16 pat_index = (*bind_ops)[i].pat_index;
>>           u16 coh_mode;
>> +        bool comp_en;
>>             if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
>>                    (!xe_vm_in_fault_mode(vm) ||
>> @@ -3421,6 +3422,7 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>           pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
>>           (*bind_ops)[i].pat_index = pat_index;
>>           coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>> +        comp_en = xe_pat_index_get_comp_en(xe, pat_index);
>>           if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
>>               err = -EINVAL;
>>               goto free_bind_ops;
>> @@ -3451,6 +3453,8 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>                    op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>               XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>>                    op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>> +            XE_IOCTL_DBG(xe, comp_en &&
>> +                 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>               XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
>>                    !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
>>               XE_IOCTL_DBG(xe, obj &&
>> @@ -3529,6 +3533,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct 
>> xe_device *xe, struct xe_bo *bo,
>>                       u16 pat_index, u32 op, u32 bind_flags)
>>   {
>>       u16 coh_mode;
>> +    bool comp_en;
>>         if (XE_IOCTL_DBG(xe, (bo->flags & XE_BO_FLAG_NO_COMPRESSION) &&
>>                xe_pat_index_get_comp_en(xe, pat_index)))
>> @@ -3574,6 +3579,14 @@ static int xe_vm_bind_ioctl_validate_bo(struct 
>> xe_device *xe, struct xe_bo *bo,
>>           return -EINVAL;
>>       }
>>   +    /*
>> +     * Ensures that imported buffer objects (dma-bufs) are not mapped
>> +     * with a PAT index that enables compression.
>> +     */
>> +    comp_en = xe_pat_index_get_comp_en(xe, pat_index);
>> +    if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
>> +        return -EINVAL;
>> +
>>       /* If a BO is protected it can only be mapped if the key is 
>> still valid */
>>       if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && 
>> xe_bo_is_protected(bo) &&
>>           op != DRM_XE_VM_BIND_OP_UNMAP && op != 
>> DRM_XE_VM_BIND_OP_UNMAP_ALL)
>

