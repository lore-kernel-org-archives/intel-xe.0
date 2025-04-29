Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC38CC369D5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 00:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5737D10E041;
	Tue, 29 Apr 2025 00:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbGbZIlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7F510E041
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 00:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745886483; x=1777422483;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FNcfAnxihVlK6dGBpRY25gYYhkw4UmvZmwRR6Wi5stg=;
 b=GbGbZIlgs/WWLs6fTxYZbDOlhf+hFbhbnfoYSLn34nRXCgSIlRbGM9Up
 OnsWoFRwhPCbWHeZO15i8KpB/HknCkgDnXiVRStOZ80BlPWJOGErnyrlp
 SbjYEdsch1dWGztL9fxmAUBcL5kddd1qOmb54qM6AlDbH5wki7FWiuZC1
 8JoFhGkwzjIeVkM0plOLuacl3sPTkdTndn5vL8bGetBk0BXhaP1vUx4rF
 ilCqpxKSAU7a+EZM8EHqR/2bUeK5fwEJcMwPQR6lo4ISai4GxohUOq8TT
 wmG0IbvEuiL62QHykneiLWHAz9jstXwBQLjy+6SwUwKcPscsYnA5zMCgL w==;
X-CSE-ConnectionGUID: m7kvNGoURIaOWikX/pKUCQ==
X-CSE-MsgGUID: wFqMlW5PTxeg7/exIZglzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58866284"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="58866284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 17:28:02 -0700
X-CSE-ConnectionGUID: NlyDn7HRRNunspWex3w22Q==
X-CSE-MsgGUID: SW9fnLRZTHeSvQMXeXT5IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="138659397"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 17:28:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 17:28:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 17:28:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 17:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1hUUtiIiRaom6VBgbOJOHJGEiiarHRKTqKn93LARA/+47iHIa5hRAZFyEo/DNuhTBVv5KmJjuE9OBzyRNlnLrZmAUm5cANHpcUgm9cDkWE60WA/QKTw0dk/Umsbefou5Yj4hNO8D7AQB1/xxuT1uRDKlKf7nQkOyyouZnO7cVXPupcRTve4rDyLifn9T92EKFLSgoCjzeAdfFlMfoqym6+9HbcsKe5HNo+uv+IKsTZPK8HW1h+/h03ta3xzrBjtMZv3XhDzW0evcP60uFPiFHL94Z29sdPIYhLs0VHR4ouwi9VvEG1zF4BEbOYjPdiN02WbZiw8q4vm51OMJuMKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEIfDNkbY+Ur2qvV1S11JVKR1W3/rwRmWDrKRgrGkkA=;
 b=IP2RUggY9qrgb/7XUr9VO19F4yJ+BhTovE7UpWrLXp+YbOKpMlNp7XjHZyDZYiAU+7HxTHYDjQsQHCZhPbY5F5OiFg+vdVOfj9pvBkAAIeKaEQrhq0rvoPPIk1srbmTImFFoXnqpDYjBDudQYdH+TZmONdnajfhLYiOovmXARQnXinnBPTNe8jKQr6BEgvuEkkCRNQ2wfxmVSIU26vDHckg/k3l0wBD8UXkE8LeRuO+bGC0I3hO29v4vO7TkZDAD220hb33lKvyQNUa21lvfG5Xw2J5kZ5XyX8slkdkuJUqaT7g317ya8ru4Y+0SyzfUIjvN+iZgbnnD7Ntzm4Uemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 29 Apr
 2025 00:27:52 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 00:27:52 +0000
Message-ID: <adf794b8-c137-41cb-8d6a-0c3799f831ef@intel.com>
Date: Mon, 28 Apr 2025 17:27:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: do not flush the GSC worker from the reset
 path
To: <intel-xe@lists.freedesktop.org>
References: <20250417223713.1377506-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20250417223713.1377506-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 795ac32d-03be-4f7d-904c-08dd86b4ad98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkRsb21DV2JhbnlFVzVJb0pRUmloOERGV1JlMGVsQ2wzOGtHczJRTjFFV2Rv?=
 =?utf-8?B?WkdmQllLSXQxcXY4L0N0WllUTzFySEVETThMZFR5WGdGZE1xOXgwQ3E5MnFM?=
 =?utf-8?B?cFRpeFlJQ1FWMmtxUWVDWURQaisxTWZ2clc5aVNxYTFOQzFYMVNWenBwTTRO?=
 =?utf-8?B?aWwydTFvVXV6TnNpYnN4OExPQzhWUmg2VVVzUWJnVW9CQlQ1SDJSOS95REkz?=
 =?utf-8?B?MFRjUzdqTEJiVStGTG1uT1QrbXNFVG5LeExaLzBxcGg0alh2SlNaYXdNaDZH?=
 =?utf-8?B?eTlzVUMvOFVwV2dQREhUZmtkblNrR3p3K3NpVHFsaXJrSVJwT0dNSHZYd0Fu?=
 =?utf-8?B?eHV3WE5xeE9CVWVnWUtpTUloQlhIWnJtTUxzM1RpS0QyRDRXMTFtUzRWSUhW?=
 =?utf-8?B?VjdEMmhQcHRpNHZDeTdZMU1KOFVTREhwaWlqSlJJWTVnZmJQOU12MURvV0ZV?=
 =?utf-8?B?eWhJU1pkV1hacWJhOGsxOVdpVVcvakN2WEVBQUVTOFlTVnRqdzZ0cDJxTkwx?=
 =?utf-8?B?QUsvT1hxdWd2eDNwVU5RcU9uQXNBcWxTdGVOT1h0cHF0aVRVM3JhcU5PRjk3?=
 =?utf-8?B?MzJXc25HTGZpenBwTWhFajZGQTc1Ulo1NDdvTGh1SndiWWpjR3B1T3VQZmZt?=
 =?utf-8?B?TzNwZW43NmtHTnZDZ05UaTN1dThPVUpsQjZ0MUZlZElsOGRkZVYxa21lOE1p?=
 =?utf-8?B?V1hmM3hXeHRrWW14KzhQZE16cjRuZGM0a1czS21XbE94dzA1MXJ1RFZCWjVj?=
 =?utf-8?B?RFJHVjRoSndpK25hbGlvWHlnaFViOTNPandSY1BOT0ZLUWwwOFQ5UEdOdndh?=
 =?utf-8?B?TFRNUnZSajlSSW9pbWp0anRsemhoVzVyNXI4OXZVb1I3U20xaDhWcXhyYkor?=
 =?utf-8?B?R1YwYjBNTy92YjdxenJmMHpqVWFHNWRKemszNGs3dU9YbTl0eW5lOW1nL0Q5?=
 =?utf-8?B?NlNCajZTcE1kSy9LSEJVaWU0ajNQQmh5aW4xeVMvQzE3bHBjVVdMQ243Ty9o?=
 =?utf-8?B?TFFvU2hJUXBobDFDdHVBRlhFWWxWNytTb2RteXFhNmVJSE1XOXhkaFlDWi9z?=
 =?utf-8?B?dFM4cks3cDFZVWlOZ2dZenNMVlUwaURIaGxva1VOOGxERlFvbEllcWJ6bzJV?=
 =?utf-8?B?WVFSa2VGcFhRS2E5c004L3lTSHJTSFFMSmpxdHMwdjBjbjlNKzFtR1RRUElq?=
 =?utf-8?B?dndCZXd4RGF0WC9IUGo2L0pKalFDWGNDUE9lS0JhS21iaU56OFBWT2lHT0kx?=
 =?utf-8?B?bjdJbDRUUDlBNG9ad29ONDdqKytYUUNab0NPVnl0QnhNRGQ0dDRyZCtqWUFu?=
 =?utf-8?B?WWtSZ1ZmN0hLSnIxY2I4bEtKTDJMbkRhWGFidjE5QnJWZ1p4aHJJeUVodUxK?=
 =?utf-8?B?bHV2OVBmRW5XckhraitlR0IrVVZQQWJZZlJ4dDJhT29IZkxoM1lUNzc5eTlN?=
 =?utf-8?B?VzJ6dTBOdlBPT1FaVHBXNEhoQjI0REJNOHArd1hjWkwxY2x3SjF3VVBGcWlq?=
 =?utf-8?B?cGxRTzJ1UEJaTWNkWlFSQnAyeTRtVHJnSkVpUlZBQlhZYjBzYUc3ZGtqY08z?=
 =?utf-8?B?RldlYStudytsNW5PcXlpSFUyYU9vME1USUovSm9RbThyYnNPWGVFVFROS2ZG?=
 =?utf-8?B?aHIvRTFEVGkxbkNxWFNkMjU0ckl2NGRQbUE2NERSOE5FWTRYYk4zUE5saUhr?=
 =?utf-8?B?cXRkK1ZXdVVHTEwxQkoydmJ5UVJrQU5RNlpZWnVoL0p2eXVHbnZNeXIyby9P?=
 =?utf-8?B?SkIzY3RzQlZNTmdGZjNNNmNFUzBJUCtuaWlRU1pPU0llemRoSWpzQ0Frc1dw?=
 =?utf-8?B?d3BtWnB0Wk11MDFnVTFlMWViQTkwa2Y4NWFQRktyZi9udFFIbmFTRlBXM2Vx?=
 =?utf-8?B?M0Qva2xiTHlWVml5Qmw2VEs4a3N5ZU5zSlpaTHFON2dTU1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmE0MzI0TGcwdTVKdkNma2t1bXhXV0hoaHIrdTB4cGRNZWI1Sm9sTHh2UHh0?=
 =?utf-8?B?VUtTQnJLVEVQeVFxNTBJc1RlTHY3Q2tCY2NIY2c5bFNlWktMM0QxUHRDWHBx?=
 =?utf-8?B?b1VCYzBOdTV4T3BwajNLQS9WSHBVTlBBWnRTT0dDS0VRelFRRDA0NTljNkpW?=
 =?utf-8?B?bStQVFdZTjN3RVF3aVl1TFBqdzh5VXVubnpIbmdBQkQ5V2FxVjg4Uk1PaWlw?=
 =?utf-8?B?eXd6dGZ6MHJadUdRVHJJZTlXRGJ2bUg3QjFCdEtYa01zM0RtNnFoclc2T0N0?=
 =?utf-8?B?dUtDUGcyZWxsT0FQbzhVTXRHS2NSclZsT3FOK3dwMzduWm5CZ01KSGZodDJa?=
 =?utf-8?B?ZjNqSlhGd3V3RVNuaHQwUm1wZGE5N292ckZ3RnRnREZOWlFZdUdwSE4reU5E?=
 =?utf-8?B?TmZhc0FTRmZUVkpXZk0ycFBkTGxjd0NBVFV4ZWgyNmJTMzR6d2RXK0pYREpB?=
 =?utf-8?B?QmorWUhvMFhPMG5hWU5ZUVdUaHVPdEZvRHFYejlCZDZmNVhxZHNpdFJ3V202?=
 =?utf-8?B?MEdpeEJZbkhjd0w4L3hTajFQVlJLSmpGeTErdFZyS3d0SXZjRkMvaEp0a1NK?=
 =?utf-8?B?U25nQzZQU1MvaHlFNm9YeHpDZE1BUGsvT0pKc3ZOcUhHNDJWcm12SllEaDFl?=
 =?utf-8?B?aUhPeDhUUU40VVR5V29vYmFHdHZBQk1pU3MvU3crMlNZQWRJOUxPSklybkFF?=
 =?utf-8?B?blhMczBsckRkb2FmbjBVcHpKQy9Wd1dsWWdxeTFRUTZvd3E2UEhXdjdHNks2?=
 =?utf-8?B?M3FPcWtGRGN6VHVmLzViclEwM29Ed3ByeTBwbkQ2aTArSUdWNmcveVpHSDRz?=
 =?utf-8?B?V3JGcVE1N3NLY01MMDlSTGpHeU8weW5xWm5rdXB4OFkvMEtZVU1EQWo1MDFP?=
 =?utf-8?B?M2JPVGpZZHhNZG5OSWJUdlJsV01iZWRocVFZMkNGTFlLdS9YVWJveGQ5WkFP?=
 =?utf-8?B?VG5Fb1BremJENVd4THFSQk5HMkJ3WkdBRnZCbTdBS05MWlVqS1ZIekpQU2l2?=
 =?utf-8?B?RnJ0WEZQTGNyRGNnWHdqUXBBOFhJLzJCMGJTcmpFQUNkelhjRW9mWlNCT0M3?=
 =?utf-8?B?WjZBM0FYMnh1OFh0UEZiU3NHc0RwcHNycmwvTzF2dTllcWllaExlVU1reDho?=
 =?utf-8?B?b2hMZkNTcDl4ZUsyMnlHaDlLV0c1Tk9xUUhVQ0hTc0YxMWNPQ2ZZSDdMQ0Zt?=
 =?utf-8?B?cmNUWXd0NXNGMXQ4dG1WTEw4b2EwaFVVL0EzZjlUUjE4emRZd25KWDh2blpG?=
 =?utf-8?B?NEtUN1ZsQ2JuZytvS3o2ZWx5VFBYZlFoejRqMW9welJwVjJOWGFYaXpPTUhl?=
 =?utf-8?B?akw1Wk04NE5icjBmd1YrRE53U1o2RVZTOFVCV0Y5eGJTYlQzekVYZnhCb3Bu?=
 =?utf-8?B?RmNyLy8vTlZyR1FuQTNVaU5GZ0o2NXQ2enZtZzFrZ1dxdDNXaUpVaENzSkFo?=
 =?utf-8?B?bXN4bDZtY0tjRVZWc3dpT1R6ZWd6bzJqbkxxRjFQM2VudVhJWS9PTUlHQWZ6?=
 =?utf-8?B?UnNjOXRxa3VVbFV1eW9xekZGSnJrKy9FMmpHakp5SDZVUk9KM1JGR1VDMWR2?=
 =?utf-8?B?MVpEMzJVTUZIb09NcGNnQ213OXptTzc1S3dTYUh1V0x0RTFtQnNmUFpXa3JH?=
 =?utf-8?B?MCtZRjdHOWMxRGtoengzTC9SUXNQbUxoNXEvempWRUZudzNGYVhvMXdWTzJN?=
 =?utf-8?B?S2hwNkU4dSszcjkvR0tvakRPVGhVOCtjLytqbVlJSDBXRkxteTI3Z2hVY2R6?=
 =?utf-8?B?OWo5dUdSTWVzeG80QzJ0am52OFZycHp1OFFkRW9YRDBiSStDQW5FQ3FXTW9K?=
 =?utf-8?B?TUJLdXpTSlloYURlSFh1aDF4TkJXa1VXeFBaTDRXWkZ1eHFZK0VBTlJpbG96?=
 =?utf-8?B?TGluRDcxbDNON2pwcHdLemN2NG8wRTlkOTUzc2tpc0I4MUk4dnNkc3BJSXpI?=
 =?utf-8?B?TUl2WGlUUXRxcmV3UkJsY0RuWEJheEFhQWVNVkg2L0RWa0RkRG9EUjdjZERO?=
 =?utf-8?B?ZlJuMW1INVMzOWdBOGR0ZkFTWEdpYXdZQW8wbFdONVFFalpnSlFDY29uejFa?=
 =?utf-8?B?aXNDTDZWdXViM2FValQ5bkgveWpDQWFwMkJINXBzRzVVYnQrb1Y4RzZrbDhH?=
 =?utf-8?B?WkhLSDdBMElhTWc5ZTUrc3F2OGJGZ1oxTC94RWUwNUtGcC9JV25Ba2F5ZU0w?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 795ac32d-03be-4f7d-904c-08dd86b4ad98
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 00:27:52.2831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoXay7O6RelnC4vXlaxI6bdHggZ98sA+lgWzOb9ll9HT6Mkh38od87Ke5llrMOJscXi6nV2DKxY6Y4oUileFE8kbped3/2iyp/CxT/cJQwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
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


Changes look good. As intended flush is only on suspend path and reset path
awaits register change.

Only minor suggestions below.
- Correct commit spelling
- Rename xe_gsc_wait_for_proxy_done to xe_gsc_wait_for_proxy_init_done for
clarity that we await for init completion.

On 4/17/2025 3:37 PM, Daniele Ceraolo Spurio wrote:
> The workqueue used for the reset worker is marked as WQ_MEM_RECLAIM,
> while the GSC one isn't (and can't be as we need to do memory
> allocations in the gsc worker). Therefore, we can't flush the latter
> from the former.
> 
> The reason why we had such a flush was to avoid interrupting either
> the GSC FW load or in progress GSC proxy operations. GSC proxy
> operations fall into 2 categories:
> 
> 1) GSC proxy init: this only happen once immediately after GSC FW laod
Resolve in this line to: happens, load



Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
