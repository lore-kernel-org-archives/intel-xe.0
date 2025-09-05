Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C876CA1013
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 22:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409C710EC48;
	Fri,  5 Sep 2025 22:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwIqOxa6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F121210EC48
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 22:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757112820; x=1788648820;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MBAGsEfJrjgDewYnyjC0JHIYyFktKkPStERcdx71rwQ=;
 b=BwIqOxa6KwKFqYE0nqVaRXuvmMpV19Pnv9118o/QF4Igsg+U2Y4BbxJa
 eOj8CUXdD4qmSen0VFsTyLbyIMaHkqbImO+29OBhvGo30ZoxF9fr32LbI
 /kxBlfUxzgGqmFXnwC+GIBiiKRKqs9ytvaojp49YRkI207uLB6Ai9xf2l
 3Eg/TPA3s07wqMTFqX1uPjhn04ebh/aBvcjpjvem4Z5PTuN+c8aS93gj/
 r5BSHv+ZcfbTP1bLEiCbMrIcdKeWJSdwg1moFlgi2aW0q0wUb2wAmCMEX
 9wiyB1/7e9/+mGFkybh896VrSvr2xC7xDHIc0eUQSmb1+1R5qmNmhtEGt w==;
X-CSE-ConnectionGUID: ELl4JtLYRn6YGE6lACN5nA==
X-CSE-MsgGUID: N8b6ZFFNTB69h1KNYmXIdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59536962"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59536962"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 15:53:39 -0700
X-CSE-ConnectionGUID: s953VLFBSq6wCNG1JNCn5Q==
X-CSE-MsgGUID: xq5jKKUASyuwU9sYzHPXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172160048"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 15:53:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 15:53:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 15:53:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 15:53:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKZy//Xn4RDSx54+AsDI+Vf7o0czYxq7tTYbH9vVvcX7RpnKposlcOWcWjcREnARJblstpa+1yhBi5oVuPL7FgmZ3CdCvqc61DBCZxd9LaxeH59n9pFHmjSRm1ldC/fsz/sp0p7iPYMesvxBIUdWDUdYH628Ye4fXbEOvy3kG8fZy3Eh8ofIW9RTiEKWsh+IY+/qFMZnrfSHgwbjgMVf+/+2lafetVD+uZI7454wiMS4NxXkq78Zpqya75JGrcUAnrAIBSzaIaLQXaARUQGDeztiKQuzLIYLjNKY/LrvqktKw7MgsBJNYd8O7Sugo/4XRPlGn1czwwgpenR2H/Fq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BEcs1sYhS88unklVhyqhau9Twx45eMZLO6D296OAxs=;
 b=Xmq3novR59V4UQ5G9fjpf7+VVK3B9xgXUaBiW4CtbWCR7p1vrRhaMzLHs6Y1/KRGLCBAQYBUj+kKlBPTXhgkT35VRl4+dD1TOxSsFEBwz6CMmE18od2lOUIz1JPgR/3YlqtDcj3kEXl8HJudDWxADkfIkRO3BF08C44WqN1bPLy7TMyEj6c/RKVKe5qKRUyFlSHY3k7pclvmfc9NM1H4R/3EmTKfElihd6HQWqep2tNzELIVk2ikjPIvKWVOspx2Oecu7mczB9roDUeQ5+KtG/FeUDfuW3PCf/QQLbWOBKPk0RqA7UZ109AqkjLGOqvdH2v0LLJ4aZBxECEIxDF57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 22:53:36 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 22:53:36 +0000
Message-ID: <786627fd-f578-4ece-aaa1-888354db0c76@intel.com>
Date: Fri, 5 Sep 2025 15:53:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Fix error handling if PXP fails to start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
 <20250905212248.3312537-5-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250905212248.3312537-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:303:b6::33) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 123f202a-2b8f-4969-6084-08ddeccf0be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aElRV0tvVGlKZWhZMTlWVVhpMVhJWTJEMGtNYTA4YWp5Zm9WVktzdGdBc1pw?=
 =?utf-8?B?aFhzOWptU0hKcXBNRzRENjk2dENYdSt4emwrcG5tdnNZcjNmazg2Njh4TVpo?=
 =?utf-8?B?aTZvY0V2THNpRCtkOUUxbktxRXZKeHBFTFAxVXhDNURqMit6R2JaMWl1QlZn?=
 =?utf-8?B?Yjk4YUZGREFDY0kxWFp6U0dHOXp0VUtreSt4TktsWnV0cFFQYTUzcEtLd3lS?=
 =?utf-8?B?djYyL3NWWWtEbWEzZFFWbFJqSWFsM3FIWjdtbUdEVmthSmJ5eVg4NjByMllv?=
 =?utf-8?B?Y2czbDY0RUwrLzlOMWsyejNTSkVCRWJrZndUdG02bjg3M1VJUm1ZK0t6ZUo3?=
 =?utf-8?B?bldNbjNBWS9vTUtjOENwL2hwaXhmc1RQUFFmY2FDUnR4YzgvZlIwYnZpaTQ3?=
 =?utf-8?B?VGR3ZWlYaWJURk9jOEhiSjV2d3crVHI0MzhYS0M3MFg1eDlzVzN0SmwydHZT?=
 =?utf-8?B?SENpME1iNGhnRWJzcGNpSmtENkNoYmhvZm4wZFNqc2FpK1UxQ0VtQ2NMTjVU?=
 =?utf-8?B?WGYxSk9mdlk4RE5HN2dFTmJXRVRkbTNQREwzVXJHMUt2a1hsSks1NVQvUDRB?=
 =?utf-8?B?SkgrRnRNNkN5SytacS9HR0w4Tm9FRkFWY0lVTHlZRFNCUGRtZmM5QzYwcXU1?=
 =?utf-8?B?NmthcGcwcWJOU3ZEMjhuYUc0ekpNYkRtdUZXKzdaWndnQ1NXTWVGQXpmQ2xI?=
 =?utf-8?B?Nlh2cVBvVENINGtaQSt0TEpyV01seWRLY3crNHVZK2dlR01ZKzh4R1ppTVlY?=
 =?utf-8?B?a3NybXdOQ0hnWks3NEdaNFQwUUhvSGRMRFVKN0tBeVBGbUpxWUF0bmE1T2lJ?=
 =?utf-8?B?YWtGL3V3dHlEM3RWU1NJazRIUGRra1U1U296Wlh3cGVCMWZCWFRYOGRaTVhY?=
 =?utf-8?B?V3hrZTIwcUMzSE1oMjUyU1l5U09ORDdpcCs1YVkxOU5RWjU1d0NMSjlGSzlj?=
 =?utf-8?B?UDZpUHAwTXJ1MVRLUG5takc5YzlaMDBNOThzVmZvandaeEZMRExMdEszaUUr?=
 =?utf-8?B?RnpTUk5Rb0haRG9MclNHWXl4QkI0NjVKVXJ2ditIb2VWTGdYQ3ZwUUtvSis3?=
 =?utf-8?B?eVBSL0h0eVF5SVZsQTFTc0hQeWV2NDNIRUZROHZINlp4V1FQL2cwRnA1a0VV?=
 =?utf-8?B?bm9pUnErdURnb3c4T3dpRUx4ZkVXeGpBdWhQd1hqdjlHWjcxaDQ0MDdrRVpG?=
 =?utf-8?B?bDl4OWxPZ3JMQ1BUZzhBMmpob3orY0xjcENDaTRIUjIzRWlDcDl3akQ2Vkpn?=
 =?utf-8?B?U0ptYWlwSHhuVitJNXpYRFl1THduUGN6V3dTRTc1c3RjRTMzeVBrTWo0YU1J?=
 =?utf-8?B?VjIxTzVoUnJqMTg3aHlicGpGalBqZTl5bU9DQnZOZUV4UXZENVUyemhUVEVz?=
 =?utf-8?B?MTFxZEYwREoxWUJwNFlzWGFvY3hGTVBiZ0xkRGRDK1FZMXFiSHJ3Rm16QnV3?=
 =?utf-8?B?MEZEUzFnVDRQbjZjU0hyVkR1L28vamVBd2tYa1ErK2IwMkJQQnFCMjhpRkdq?=
 =?utf-8?B?Y01xYU56MGpnS3I1OGRydEJVMWlHRWxaS3ZjYWVKSHhkL2M5bGt6cGdtZ0l6?=
 =?utf-8?B?YU4zdjlkS1JETjFKdEluOFB5ZkNVTTBDYTdERml2eFpCYW9VVlQ1enUvOXlT?=
 =?utf-8?B?YlprVFgvd3RsNGVrZmgwd3RLSXdqR2U2d2tvSUJ6anlCRUtIN3dVbURZV3Z1?=
 =?utf-8?B?djJnc21peVBWcnBYOGt4eXRUWjBqWS9uRWZQWlh1L1NkUW0vZERzck15cEFO?=
 =?utf-8?B?UC8rZXVrdHk2VnQ0OGowaWVRQ1lHZjIrMmluS2pmRERIaFZQVE1WdEZ0SllZ?=
 =?utf-8?B?Qzhpamp0UHdHNzN4N1BrcHhoc3MzSWtSdm1HVzJodU5jZlRoMkxCU2l0Sklo?=
 =?utf-8?B?OEI5dWx5cnVyY1dTMzNQUjdSREVTVG1zRjJUbVJTbk1nS2hQUjVVcG8wQzBL?=
 =?utf-8?Q?t5bdAXRV/zM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTJsSFU0UjhzU2F6WkhLSzF0ZmltNDgvVi8zNDNlQWxzYkhQL25qcURTN0h1?=
 =?utf-8?B?OU1DNGZqNWVIOTFtY05DdGovbE5kNUFQemw3WlJZNGp6Q2poVGFBcUVycTZL?=
 =?utf-8?B?ZEdzdGpaZVV5ZzBiL05sYVN4NGRieVl1c2ViNzR1aEFlaGFCRjFqQUk5M2w1?=
 =?utf-8?B?S1FsR2RidXhVSTlZOUNKbFlPTEc5OXdtMmhxSlJyYkhYbndTZ2ZueGtGclhN?=
 =?utf-8?B?cEs0aTRQQXVud2Y3cXdCZW5lNmwva2xleGFsOWNnaHdIc2IxQnFuVUMybW9B?=
 =?utf-8?B?OU5ySXBsNnI3MHZSNEs4bTViQVFzLzhIWG5QTmZFSzFDUVhOY3hHZTBFUzRF?=
 =?utf-8?B?WUNoU3EyVVJCT0kzVzBGeDhmUVZ5MkNCZ3NGUlg4TE1jaDIyMFQxbUNod0o1?=
 =?utf-8?B?b3p3dksrQkprZS9MZ0h2MjAwbnJ5TjM2blhyMExaR2NLNWJUWnY2K0ZqZGJl?=
 =?utf-8?B?N3Vwa2JEZXpMVkR3NVdLZWtpN1lRbHVFcjRuaG9pR1N5Q3pnTWJwMmN3WktC?=
 =?utf-8?B?RDArSVJYaHI5UGU2UjlTaEhBaWs1SmkwOWRoWGdsQlhDeS9OVDAvaGRWQUNp?=
 =?utf-8?B?U1FIdGtvcjYwQkZoOUdvdmN1Rk5yQWN1Zmc5Y3k4Vm1WR0Q2b1UzbDFLd3Q0?=
 =?utf-8?B?N2p6dWhhTThsRDhWSVM3UDJxU05ZT0N6bzFlaVBmK2hxaW5lZUd2aUZlUTE4?=
 =?utf-8?B?RjBBMHMxcGJiWE9HaVhvVUpCZzJnZnBZQjdkcUJ0YkJiTXZOMmc3KzY1Q095?=
 =?utf-8?B?QjFkL0xNS1VHZTlvTmJLMC83REVnUW1jd2VxS1dQSUVHdkw1OVlsUmo0M0xV?=
 =?utf-8?B?cUJicHFYeUJUMW4vVVYxSysxWjVaR2padEtNMHVqYzZlTXJZRTlTMURvZGVH?=
 =?utf-8?B?ZEU0VkJwNWRDNUprVlZ3NmJYVVJGeHlQdzNNa01ES0V3OFBhT0p4UTVjemwr?=
 =?utf-8?B?L1JlL0Y2dTNaaUNVczdXQ0NaSWE1TmgralBENzFIa3NGOHZyalFQb0MzZGdp?=
 =?utf-8?B?NGZBWUh2T3UxNS9LQ244Vm0rTlZWV3htOG12RHhZU0hvdmFZeHZuZ3FrUWwz?=
 =?utf-8?B?dEhObUoxdUZZWEVBMFFKaE1XeHFvWkpYd3FXa21JMWFzRDZoNVNaR0hKdVhG?=
 =?utf-8?B?RGdnVW4xVGxTWEJsaHdBNldkMnQ3aERGTlEvUmUwMGJGczhvWS82WlJvbng0?=
 =?utf-8?B?TGV2NE5jVnErbUErUHM5b2ZudUQ0NEl6aGZnR2dQVDVXL3ZnOWJ2Y3NzZFFE?=
 =?utf-8?B?dERDVlBoemJPeEMvNWlzREQ2VGt2TXdzSXQyRWpGa3d6RUg3YWNIeHlmYjB2?=
 =?utf-8?B?cjRmUm9uQ2lCcVZWd0F5Z09xMlFOV3BhZWdaTGRpRThlenA4Q0lJQTVPTUJN?=
 =?utf-8?B?bU9aUWhlOHhnTnZVWnhOWDI4Y2ZvQWtxczhjVXFIMnJnRWhOelV5eGNoQXhC?=
 =?utf-8?B?bWdqQWFTOEZiNDdlV3ZNSGNaMWFMMHFscUxSY2dXMG85WnZ0Vm43S1NkUms5?=
 =?utf-8?B?WFJlQzNpSEFNdjlxdHg4Zk0wZDRGTjdOL2UxSUp5MC90eUhFZlRFZlJodU4z?=
 =?utf-8?B?NEEvT1V2TEpmbmV3WWw4UUsyU3hrd0RNTytLcURRS0dGS3FtSnpyVDlKMUw5?=
 =?utf-8?B?MmZMK0ZZTCtHSzFpZWl2ZHIxOTdDZDE0TitBY3p0azFBNlNzdkMvNG5JQklk?=
 =?utf-8?B?ZkdybFBrbTRUQ1RWem9ZZWg4SkQwUEU4SmIxclpiMVBWVlFQcm0xZ05VUzZL?=
 =?utf-8?B?RUhwV05tbkZQNmZ2TEN0OWdkcWxDZkZhTURBUXRPNkNrcU5JUXlWTHhQUXFo?=
 =?utf-8?B?YUpwY0VyNTlKNkRVMFpRVks4bHJ0aG9YdjBnOG0raVJzeHJsNkhsVSt2dHpD?=
 =?utf-8?B?Z3pKZVlta3pMYnFsSW9zMno2QVQ2MU15Qy8vdXRCeWM2cXgvcUpXeWMrcnBS?=
 =?utf-8?B?STUwMWRzVWpuWFR4bjFvbnQ1eSt6akU4RjRNQnJOdTJpQzcyamlBSWphRGxy?=
 =?utf-8?B?dmVNbk03YmRkUnk2SkNjOUt5NlRTbldFdm4wNndwbWppT2RTemFiY1pYZzhv?=
 =?utf-8?B?UkJKcEozeXBhalhaQzAvck5vT2N4Z1RLbGlMY1Vra3hNcmZMc2ZpSHpQVk5J?=
 =?utf-8?B?YWp4MFpDczZBcjVwOEVTNlY0UUpYRFZnYjE3REZzUjJaaEh4SG9PVkdxTjNK?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 123f202a-2b8f-4969-6084-08ddeccf0be4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 22:53:35.9958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYY/JiXtY4Lnr7W9OqhYaXuPn7i6e0yavcY1NJ9THLFmTGKg7M/xPpsjhqNgheO4cMCxQZPDU5IfuZdhjnf2ISVIsLLSBdeom8tnombOqCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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

On 9/5/2025 2:22 PM, Daniele Ceraolo Spurio wrote:
> Since the PXP start comes after __xe_exec_queue_init() has completed,
> we need to cleanup what was done in that function in case of a PXP
> start error.
> __xe_exec_queue_init calls the submission backend init() function,
> so we need to introduce an opposite for that.
>
> Note that this patch is meant to be squashed with the previous one
> before merge, so that the fix can be applied as a single commit and
> backported more easily. It is being kept separate for ease of review.
>
> Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c       | 22 ++++++++++++++------
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  8 +++++++-
>   drivers/gpu/drm/xe/xe_execlist.c         | 15 ++++++++++----
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 26 ++++++++++++++++--------
>   4 files changed, 52 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b6c63845dbab..3aad3d10560d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -199,6 +199,18 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   	return err;
>   }
>   
> +static void __xe_exec_queue_fini(struct xe_exec_queue *q)
> +{
> +	int i;
> +
> +	q->ops->fini(q);
> +
> +	for (i = 0; i < q->width; ++i)
> +		xe_lrc_put(q->lrc[i]);
> +
> +	return;
> +}
> +
>   struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>   					   u32 logical_mask, u16 width,
>   					   struct xe_hw_engine *hwe, u32 flags,
> @@ -229,11 +241,13 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	if (xe_exec_queue_uses_pxp(q)) {
>   		err = xe_pxp_exec_queue_add(xe->pxp, q);
>   		if (err)
> -			goto err_post_alloc;
> +			goto err_post_init;
>   	}
>   
>   	return q;
>   
> +err_post_init:
> +	__xe_exec_queue_fini(q);
>   err_post_alloc:
>   	__xe_exec_queue_free(q);
>   	return ERR_PTR(err);
> @@ -336,8 +350,6 @@ void xe_exec_queue_destroy(struct kref *ref)
>   
>   void xe_exec_queue_fini(struct xe_exec_queue *q)
>   {
> -	int i;
> -
>   	/*
>   	 * Before releasing our ref to lrc and xef, accumulate our run ticks
>   	 * and wakeup any waiters.
> @@ -346,9 +358,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>   	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>   		wake_up_var(&q->xef->exec_queue.pending_removal);
>   
> -	for (i = 0; i < q->width; ++i)
> -		xe_lrc_put(q->lrc[i]);
> -
> +	__xe_exec_queue_fini(q);
>   	__xe_exec_queue_free(q);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index d1dfd3eb19e2..27b76cf9da89 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -181,7 +181,13 @@ struct xe_exec_queue_ops {
>   	int (*init)(struct xe_exec_queue *q);
>   	/** @kill: Kill inflight submissions for backend */
>   	void (*kill)(struct xe_exec_queue *q);
> -	/** @destroy: Destroy exec queue for submission backend */
> +	/** @fini: Undoes the init() for submission backend */
> +	void (*fini)(struct xe_exec_queue *q);
> +	/**
> +	 * @destroy: Destroy exec queue for submission backend. The backend
> +	 * function must call xe_exec_queue_fini() (which will in turn call the
> +	 * fini() backend function) to ensure the queue is properly cleaned up.
> +	 */
>   	void (*destroy)(struct xe_exec_queue *q);
>   	/** @set_priority: Set priority for exec queue */
>   	int (*set_priority)(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 9115e2b13b8d..f83d421ac9d3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -385,6 +385,16 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   	return err;
>   }
>   
> +static void execlist_exec_queue_fini(struct xe_exec_queue *q)
> +{
> +	struct xe_execlist_exec_queue *exl = q->execlist;
> +
> +	drm_sched_entity_fini(&exl->entity);
> +	drm_sched_fini(&exl->sched);
> +
> +	kfree(exl);
> +}
> +
>   static void execlist_exec_queue_destroy_async(struct work_struct *w)
>   {
>   	struct xe_execlist_exec_queue *ee =
> @@ -401,10 +411,6 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
>   		list_del(&exl->active_link);
>   	spin_unlock_irqrestore(&exl->port->lock, flags);
>   
> -	drm_sched_entity_fini(&exl->entity);
> -	drm_sched_fini(&exl->sched);
> -	kfree(exl);
> -
>   	xe_exec_queue_fini(q);
>   }
>   
> @@ -466,6 +472,7 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
>   static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>   	.init = execlist_exec_queue_init,
>   	.kill = execlist_exec_queue_kill,
> +	.fini = execlist_exec_queue_fini,
>   	.destroy = execlist_exec_queue_destroy,
>   	.set_priority = execlist_exec_queue_set_priority,
>   	.set_timeslice = execlist_exec_queue_set_timeslice,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index faed952bac81..75208ea4d408 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1418,6 +1418,22 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	return DRM_GPU_SCHED_STAT_NO_HANG;
>   }
>   
> +static void guc_exec_queue_fini(struct xe_exec_queue *q)
> +{
> +	struct xe_guc_exec_queue *ge = q->guc;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +
> +	release_guc_id(guc, q);
> +	xe_sched_entity_fini(&ge->entity);
> +	xe_sched_fini(&ge->sched);
> +
> +	/*
> +	 * RCU free due sched being exported via DRM scheduler fences
> +	 * (timeline name).
> +	 */
> +	kfree_rcu(ge, rcu);
> +}
> +
>   static void __guc_exec_queue_destroy_async(struct work_struct *w)
>   {
>   	struct xe_guc_exec_queue *ge =
> @@ -1428,20 +1444,13 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>   	xe_pm_runtime_get(guc_to_xe(guc));
>   	trace_xe_exec_queue_destroy(q);
>   
> -	release_guc_id(guc, q);
>   	if (xe_exec_queue_is_lr(q))
>   		cancel_work_sync(&ge->lr_tdr);
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> -	xe_sched_entity_fini(&ge->entity);
> -	xe_sched_fini(&ge->sched);
>   
> -	/*
> -	 * RCU free due sched being exported via DRM scheduler fences
> -	 * (timeline name).
> -	 */
> -	kfree_rcu(ge, rcu);
>   	xe_exec_queue_fini(q);
> +
>   	xe_pm_runtime_put(guc_to_xe(guc));
>   }
>   
> @@ -1851,6 +1860,7 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>   static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>   	.init = guc_exec_queue_init,
>   	.kill = guc_exec_queue_kill,
> +	.fini = guc_exec_queue_fini,
>   	.destroy = guc_exec_queue_destroy,
>   	.set_priority = guc_exec_queue_set_priority,
>   	.set_timeslice = guc_exec_queue_set_timeslice,

