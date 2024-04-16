Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4608DC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 18:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED7810F2B9;
	Tue, 16 Apr 2024 18:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KijeIwz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82F710F2B9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713292204; x=1744828204;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0lFn+tmEqQUrWvCIopKrNim9LBrd88LU+zm/1Df8nB8=;
 b=KijeIwz4zge2prsmmUXXr0Tw2s9ropeeVl0Z8RCz2x0NRyH9fGf56EpM
 yaVUNA5NhZ5sAODWIXlt9fIO4W9xWsxHsaNm0GInfHsERaYzhVO+NAydw
 pcTCaHABDi1mDBv5Vy7kbBPKErsf1QibFxKX0h2T+22OsIqHBdEhX91j8
 EZ2fOwmo/YXRrwN9EOHAEzhQVfc1fokDnV+WatDGt4o0P/lwPIGz2h4XB
 kQFC7laZo3QBd8gZ2dxrOjmS3ASQkEMQj3dY4YKVQKuGSP6nHGOpmSDsh
 xvm9L4dQb3pi4djyQw9LxLc96wJYwg+5wMb3w+/2FBWBq9zlIEqEnCuFs A==;
X-CSE-ConnectionGUID: r5ZrE/ezTm+UqoFfvLeGvw==
X-CSE-MsgGUID: 8FsiMFWbTyiN8B2Z8fsP9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8974431"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8974431"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 11:30:02 -0700
X-CSE-ConnectionGUID: tb0MQHYdSombiOcr8pjjnw==
X-CSE-MsgGUID: pyv1nd7fQ3i0+2yU0sEXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="53546415"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 11:30:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 11:30:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 11:30:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 11:30:00 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 11:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYePQed8ilR8Kti3B1m222E3mjpgfav8aRII2jSFGGz/E3wfxFN3Dfe/zjHBVvHRN7+0YI7jkFtZ5CFfOEEiP65wdjYc5NTsU+QDe4d48N2Jycp++0stNV2k7u2+RKvNBTsZe7gNpNhZE1TMcC5pOhDZOLtntKrX83vVLU/bN+gcDg8tlZyKWjezfJASPQhXueKbc66n8vXJisFnb0BjlzfcZf5O0cLdUn6JVj7mzanrvQd6mx5znUxVhJrpK5kb4gUsaCeoISk/HqkJyN09DBijgi9QgSIuQLsbd4yshgWWU+MsLTZW5gq+Kuv++D71DiC25tPuQgRlBxrK0GHnYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ozkiiycdx96G1lyNIv+AJtDKlQHPe6v1mg1iR5BpgNg=;
 b=JWPCRfMmV4rMNUWYyub4Zdi4dYrTXjv/sOK+WuIRnUz5QZ2XhgQcAvfPcqnXJj3j3CfUwKDBpteWsXDRJMEhYsxwlkd2eTApnzgfBAnhkC0LDns1x8pOlaWlk0Vf4tDfg2j3DKRPl/joXbxqvyLNx+4e+n20oEzq0DJVdWwgcMMOaI219b12OO9ah5rfb3IrcpNnDS1gisAdHrKc3YLUZ/vu0uEaEvcI+p/9t7tXxeIqW+TZt+lLnvd3CUfOZWIlem0zU8yId1hLSahJKJxxZvN0KTyQrIBy0U2pNeeteBzRMoVFtUIpEANaQ9gQOuKqa9F+4j4Qz9aNk8oOcjCWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Tue, 16 Apr
 2024 18:29:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 18:29:57 +0000
Date: Tue, 16 Apr 2024 13:29:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Message-ID: <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
 <zj3ccdsxwfv7yms67c2fycjfhevdzp3qy7yz6u6ffmv4aymo6n@5lu4otfylkbt>
 <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
 <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5d28a6-e511-4e99-1187-08dc5e4337d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJa0l6O22SFSU8UBTRCVPoX+mK5if68+6hLhRktEXVcGwvhopEjyH6qysZxXlLaOjqPcZPwEZJ8JKTh0bSXWr9bXjlFVDJ6ylt6X5XYw8Mh/0MyX+BH8uziNOIFVAVbMBVtea5q3rRiZyPTkZmTtNDfjKgolk7Eo1NK/cXSlVjscbaFU1lcBtoOs0YH2f5eznYthWweFuwS00YoAN4/18pV1VOe15kOBTcZqbET01/YiWyH1EN9uXt4F/KmNtedr0DIUugGYIbxWxxXyaSA5UBxxFp6SgMHthWiZqsO8egPKqpoYgE7ZCfqWAjAlNJBCA77WB8SHVR4RTatp37Te604I4hhzrnsB3B405VzW/D4tACFHmxMoyy74L55XHtegbAGMYLNsiEEEt/FuiB4cFh8bN0JMS15lOb2oHaRLdKg9dXfyt5NrhuKsIHdsO5CxOxqLsawEakO6+vyqJC5SvDjmVFAOl55R3qfc3GEsFID/N3pMkK4yzqK6g8DV2q0n7Uoh+gXfcIyRQxKAXnIrBxMx269MGZMdTfumEd8D/0IW+Hvgav7Fm9MgPMnM5rUqfb5QzGehezqCiyAHk31OFShp14ntk9BZxblrj+CO3lF3onLBADzCjn4VWat1XuEq46O4hI95GfCLcUN6Dokct2C2S1RTF3CUyAnSMA/eQjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jSrCu025A7J2M3wOmMC74gcA9x8n78yMZoWtl4JiYPSEvUxOSHaCKt4Oij?=
 =?iso-8859-1?Q?B4e1Q2v0H8UvHiUejCzATca3+HQTi5+2wFHjyj/5+NM2Nh5ZD0kC0TF+jY?=
 =?iso-8859-1?Q?IzWA4sKkOLAionu1tad/Rp/9Y5XGMzN6otdTJ7Fb0tkWvD6z7T/q35iP7C?=
 =?iso-8859-1?Q?33nTUWHGrCuxJrJIbqNWG2J/qnDpMaiGY9I0W315YgoqBLz+SfQXZ67TSI?=
 =?iso-8859-1?Q?SuiCABzc1wVfwEeJnhkJs82YOVj1ko8t1XWUEq1jEQEokAM7AEUhsBiSr4?=
 =?iso-8859-1?Q?0Pkz1A2Cplt1dCjH1QOLzoCpQMKZ8wB0+7OA43EHC6Wd+/IaEChzM0WLQO?=
 =?iso-8859-1?Q?3J+bHOGhDMEKb4RL+XtwEgsK5E16BBYPxdaVqOxzeuvs6YON64OGybHS9O?=
 =?iso-8859-1?Q?Ns97keMTDAvxVf4TT7Qu7swEvJ6XzSjTOWlQT56iz/R1yTf99e1outHcYO?=
 =?iso-8859-1?Q?ExtS6XbrbAxkbC11cNosLM++idtYhir747/0yL0DhA4VEnvtLv3Tql7g6A?=
 =?iso-8859-1?Q?WDPQ8WCgznB+rP8yKtAmEjxnfPKwBLmnlN38gQHv6Z/5ZcWe2HjuOCW53/?=
 =?iso-8859-1?Q?C/7vPosJ3SpL/sl5YRRco5+O4illP8LUZG0rXahHn86BjJvUUkTJWbjyHp?=
 =?iso-8859-1?Q?K+Q6yi37Ubo+y2GeIWGF4qKlzau34Fxwq/AQ0HL9FaqajObNNldZPMxKtC?=
 =?iso-8859-1?Q?Vo35XLsqQRbsEdRKDXLM9OGo/S6Udr/qCBggqpXR25uTdrZEahIDSeEdV5?=
 =?iso-8859-1?Q?m3ZF8RlOThXs0Z2bl845kSv/PbYN2A2DLr0e+ynISqUYBF62PjHiJ7doIP?=
 =?iso-8859-1?Q?LyKCGFqps2MUd+zX0VdjnxUV9m1G7oAwKg/7XvLQ8taA5CKvG3IadXSPRt?=
 =?iso-8859-1?Q?9YbFae8dM8D13R6hcdV9Nu0QUgznADabIc/OxastlfnauIDFhMGfHhoK1d?=
 =?iso-8859-1?Q?uhu6YJSorpon3n/C7vkLdX82CTaQFgEhNmJOPVuvFkB1i2N9FguvkY3GBq?=
 =?iso-8859-1?Q?fzzFJh4UGfAaQ77wUfj5xXfIA8MCfm5wRlx5MO29+FA5Spubn3pUAxj4mI?=
 =?iso-8859-1?Q?FzrjmdvJIOV07VsAZgkIp3z9K56ZV7VVaalfPVZ7Pa/z9tElhmEj5mP1zn?=
 =?iso-8859-1?Q?1L2wZqbi9nCOqQaiwe8YWlEFo6Zp6A7dW3Fjz5ZArtPvimXeaEmMVCaeFU?=
 =?iso-8859-1?Q?Om+AhDlL5sDc5x5AEtxmaP5v0SbkGZaYPSXIhJPHoyeBMcWrIjNp5gal/p?=
 =?iso-8859-1?Q?8kWmfpY5hWmMqd7XMOritVzxtw5g90QZm5bNWiQDA9a2TruxFfp4NnLI06?=
 =?iso-8859-1?Q?6iHWcHrp3gLBZCCy/3cn1EnRnagrt2mYQvfbatBqf3zNUcSt6KUC55hV+M?=
 =?iso-8859-1?Q?s092nseFQH//+qwUVqmSpm+HJDCxiL6J3jdugSr2gaUeoIWxsyXR6j9BLR?=
 =?iso-8859-1?Q?fJO2KUP75i0YDp+jzRGxXhF7SnmhD/v1CVpnVlt7DCHmqYwRA0jrIlWlP6?=
 =?iso-8859-1?Q?szRn8c5SVWJiWnrzQ2VgxcKxR53cGE82afrlkTY4OIxONAzTxLYgD4il4Z?=
 =?iso-8859-1?Q?0SiugzDf/FFQt9ieoWva9TrXzMGRfra15RUCgtbalLNQqXFDNJG7fxKI2W?=
 =?iso-8859-1?Q?WMujg/0o4ydbKJrEA1aYa2lVixvuoy68m42S5ssHWyYx9GDqfwwjrOXw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5d28a6-e511-4e99-1187-08dc5e4337d6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 18:29:57.4289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SogfzSLwDNZSzbD2bP7VChlxWwsGn86v3qCze2lbFZZHF3zUH6Jacl1WLE3zplcaJje97iT3uChpigGSD4/Ai/7uWMqJuAjHJnnw7m+GZio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
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

On Tue, Apr 16, 2024 at 03:22:21PM +0100, Tvrtko Ursulin wrote:
>
>On 16/04/2024 14:51, Lucas De Marchi wrote:
>>Forgot to Cc Michal, doing now.
>>
>>Lucas De Marchi
>>
>>On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>>>On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>>On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>>>Add per-client usage statistics to xe. This ports xe to use the common
>>>>>method in drm to export the usage to userspace per client (where 1
>>>>>client == 1 drm fd open).
>>>>>
>>>>>However insted of using the current format, this creates a new one with
>>>>>the unit "ticks". The intention here is not to mix the GPU clock domain
>>>>>with the CPU clock. It allows to cover a few more use cases without
>>>>>extra complications.
>>>>>
>>>>>Last patch was a quick implemenation of a gputop-like tool in python.
>>>>>I ended doing it to cross check the gputop implementation. I's not
>>>>>really meant to be applied here.
>>>>>
>>>>>I tested this on DG2 and TGL with kmscube (console-only) and vkcube
>>>>>(in a gnome session), but it would be good to soak this under more
>>>>>tests. The biggest goal for this patch series right now is to get
>>>>>consensus on the new UAPI.
>>>>>
>>>>>TODO: Add documentation on top with the new interface.
>>>>
>>>>Yeah a drm-usage-stats.rst patch would be nice to have in the 
>>>>RFC so one does not have to look into the driver implementation 
>>>>to discuss the proposed uapi.
>>>>
>>>>Nevertheless I understand the proposal is to add this:
>>>>
>>>>drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>
>>>yes, the gputop patch was more explicit about this. Should had added in
>>>the kernel patch series too.
>>>
>>>>
>>>>That's two values per key. I guess "one key value pair for per 
>>>>one line of text" does not get strictly broken and that you 
>>>>propose a heuristics in parsing to detect that the <RUNTIME> 
>>>>cannot be mis-interpreted as the unit?
>>>
>>>the current format is
>>>
>>>    drm-engine-<class>: <RUNTIME> ns
>>>
>>>the "ns" in the end should be parsed by userspace to know
>>>what it is about.
>
>Right.
>
>>>
>>>>
>>>>Not sure it is a good idea though. If you instead added a new 
>>>>key for the gpu time what would be the downside in your view? 
>>>>Like:
>>>>
>>>>drm-engine-<class>: <uint> ticks
>>>>drm-ticks-<class>: <uint>
>>>>
>>>>Or maybe even obsfuscate/generalise as:
>>>>
>>>>drm-engine-<class>: <uint> gpu-time
>>>>drm-gpu-time-<class>: <uint>
>>>
>>>I think both work, but I fail to see the advantage. This alternative is
>>>slightly heavier on the parsing side since you have to correlate the
>>>values from 2 keys, possibly dealing with them appearing in different
>>>order. The only possible breakage remains with this alternative: if
>>>userspace didn't parse the unit before. I checked nvtop and htop and
>>>they were doing the right thing. I sent a fix to igt a few weeks back
>>>for it to consider the unit:
>>>https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/
>
>Advantages are that "drm-engine-something: 1234 5678 ticks" isn't 
>self-explanatory (intuitively humanly readable) and that it doesn't 

maybe I have a different expectation from procfs. When I do e.g.

# cat /proc/self/stat
3861283 (cat) R 3861233 3861283 3861231 34816 3861283 4194304 90 0 0 0 0 0 0 0 20 0 1 0 1321348797 8560640 384 18446744073709551615 93979016876032 93979016892449 140720658378704 0 0 0 0 0 0 0 0 0 17 51 0 0 0 0 0 93979016907440 93979016908904 93979037196288 140720658380605 140720658380625 140720658380625 140720658382827 0

it doesn't seem to me "intuitively humanly readable" was the first
concern for people adding files in procfs :)... I'd rather think "machine
readable" was more important.


>diverge from the one value per key plus unit format. Latter we would 
>then document clearly.
>
>Different keys potentially appearing in different order does not 
>matter since userspace already has to handle that.
>
>>>>Potentially could also add a key saying how much wall time is 
>>>>one unit of GPU time.
>>>
>>>I wouldn't add it really as it may not make sense depending on the
>>>vendor and or usage. Examples: the gpu time may be different for
>>>different engines depending on where they are located (tile/gt). The
>>>correlation with CPU time is different when running in VF mode, and may
>>>change in runtime depending on the number of VFs. +Michal.
>
>Yes, that's why I said "potentially", which was supposed to mean if 
>and where it makes sense and perhaps adds value.
>
>>>Also, if the userspace side really wants to know (why would it?)
>>>it could be just calculate from 2 samples (possibly repeated a few
>>>times as it updates the output).
>>>
>>>>
>>>>Or.. would even the existing drm-cycles, plus abuse of 
>>>>drm-maxfreq, work? Ticks == cycles, maxfreq == ticks per wall 
>>>>second.
>>>
>>>I think it'd be up to gpu vendor what clock backs this time. For the
>>>current Intel cards, it's the refclock and it doesn't vary the
>>>frequency.
>
>Right, but that doesn't matter. What I was saying is that if you 
>exposed ticks in drm-cycles and tick frequency in drm-maxfreq it would 
>even work, no? (Assuming support for those two was actually in 
>igt_drm_fdinfo/clients/gputop and could be used as fallback to time 
>based stats.)

oh... I was looking at the output for i915 and missed that we had
drm-cycles as currently i915 doesn't use it. It seems to be a similar
thing. I agree the drm-maxfreq- is unfortunate and that we don't
actually have support for that in gputop.

So, instead of the 2 numbers + different unit, I can adapt this to
rather use drm-cycles. However for maxfreq, it doesn't seem to be
what we need since it doesn't scale for VF. It brings back the cpu clock
domain this series is trying to avoid. The difference is that using
drm-cycles- and drm-maxfreq- you are expecting the userspace to do
(let me know if I interpreted the docs wrong):

	s1 = sample()
	sleep(period)
	s2 = sample()
	engine_utilization = ((s2.drm_cycles * s2.drm_max_freq) - (s1.drm_cycles * s1.drm_max_freq)) / period

... considering the drm_max_freq may change from one call to the other.
if we simplify it and assume it doesn't change:

	engine_utilization = ((s2.drm_cycles - s1.drm_cycles) * drm_max_freq) / period

we'd need different drm_max_freq reported on VF driver that would need
to know the number of VFs enabled to scaled it correctly. Maybe this is
abusing the "drm-maxfreq" a little bit?

What if we had

drm-cycles-<keystr>: <uint>
drm-total-cycles-<keystr>: <uint>

Then the utilization can be done:

	s1 = sample()
	sleep(period)
	s2 = sample()
	engine_utilization = (s2.cycles - s1.cycles) / \
			     (s2.total_cycles - s1.total_cycles + 1);

Capacity still to be added above, but we'd need to clarify if
drm-total-cycles-<keystr> already accounts for it.

Here instead of the conversion to cpu clock, I'm expecting to read
"total_cycles" from HW and that being different (slower) for VF.
AFAICS this is not the case with this current polling implementation
since we are simply reading the RING_TIMESTAMP, but there are planned
changes to get it from GuC. Umesh/Michal Cc'ed may know better.

Lucas De Marchi

>
>Only problem is the name maxfreq is not really an exact fit, which is 
>why I am not convinced we should go this route. Perhaps could add 
>drm-cycle-frequency and then drm-cycles would fit.
>
>>>>Secondly, wrap behaviour every 25-30 seconds patch 6/7 describes 
>>>>definitely breaks the format spec and in my view should be 
>>>>worked around in the driver:
>>>>
>>>>"""
>>>>Values are not required to be constantly monotonic if it makes 
>>>>the driver
>>>>implementation easier, but are required to catch up with the 
>>>>previously reported
>>>>larger value within a reasonable period. Upon observing a value 
>>>>lower than what
>>>>was previously read, userspace is expected to stay with that 
>>>>larger previous
>>>>value until a monotonic update is seen.
>>>>"""
>>>
>>>but this is the behavior for dealing with "ns", not with "ticks". We can
>
>Applies to drm-cycles- too.
>
>>>add a worker to run every so often.  When I got the original patches
>>>from Umesh, we had this worker implemented, but dealing with that was
>>>complex and wasting a lot of cycles since it was always running (except
>>>if we didn't have any exec_queue). Here is my tentative to simplify it
>>>since I don't really see the need to account for a ~25s wrap around.
>
>At the moment I don't think diverging like that would be user 
>friendly. Apart from diverging it would only make the output useful to 
>tools which know to keep polling with a small enough period.
>
>The tools with support a configurable polling period such as 
>intel_gpu_top could even inadvertently fail. Or would need to start 
>embedding knowledge about maximum periods per driver/backend/whatever. 
>Or new fdinfo keys to signal that.
>
>Sticking with the same monotic scheme sounds preferrable to me.
>
>And if wrap is 25-30 seconds why it was wasting that many cycles? Some 
>worker only needs to run once every 20 seconds or so and that is it, 
>no?

every 25-30s for every card regardless of having a userspace tool
quering or not seems wasteful to me.

Lucas De Marchi

>
>Regards,
>
>Tvrtko
