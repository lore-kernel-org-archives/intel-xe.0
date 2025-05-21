Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD648C54ED0
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 13:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056D010E87F;
	Wed, 21 May 2025 13:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDQa8dF0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BE414A64E
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747831829; x=1779367829;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8FHlChZ/VRFMjv/94tAxjJRmb8uvuXc/xBJG+NV4M2g=;
 b=jDQa8dF0DbpvmAgJY2LEq0qpv0hrZJG20vS8h2vRlw496ym88KyqP9h8
 RIb0VJhyU9AjAvaOaxRp+xcYYSyJ1ISX3vpIVEfYfCwRavurcKEOEECTi
 jCeDeOCrq9lrxXXyqQ42+RM67sNAeykFIr+SjS1RGAcfarBiPZzwMFu2o
 HItGMxUIogDbYzvqhWQrrYkRu5Oi5ypaND3DujsupqLipQ2RtYy0aUGQD
 +nWYQzBE0/7ku/gePW8ZbHetE65warRmvGZnqBfp3x7aEGHClrP6mbagr
 3BiQA92PES77w5srEnq7xQJ1lRZsQNi1GfkYcu3OyNNEabViTBxNUdUVw A==;
X-CSE-ConnectionGUID: qlo/hYDHQDKPWN8RPu0E7A==
X-CSE-MsgGUID: 5qh8crVfQDmTVENiT16/TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72327087"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="72327087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:50:28 -0700
X-CSE-ConnectionGUID: vyjJOlsAR1WOyxHmDspNzQ==
X-CSE-MsgGUID: Y5Lp85QbTcW+Ik3bzjYkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139956259"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:50:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:50:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:50:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ch8uK2DFrPzWyHpccLMP+E7tplsBlDIvVr6f7rKGAptw0QF2Cudrq7cd+8h91c8Rk7Uy4JIVktRP1cE9uwARf1ttqgqtDnHFsOK5GfmAePD+YEpxPZnMMf4O3QBRtH7T7w2xDH14sWcfKzLrvUNdeoy4Y7M22cTo104+nxP8uP04SmXJGOYYbHOU+0rusJ/imPfGrKoKW8ybADUjRTWHcGyShrfiPDzAsUlyN6bLwQWQY46QywWnW4EHYJmO4MLO4wb5z7x0I2BCleC65K9Tj2VUuJCZWdQwKgSv5mfRpYAJCzarAIvw+RPti5CGtLz2QUBWGOc17NSiVOu2ruHGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPUI6bDhxCBQgCWmN/Yvmspv9upNf/leQ/OS+skk6K0=;
 b=einx9YtsTEUZBYsOoArFvpLeXB7x3gV3PXMeNdoMnhRRDRp2svTphuK9CncBKLm+t/MDUEYZGg7+UYi8Z8Ae+onh/3yEpwZHvLjPfxKBoGuwaXoM/QMcQNIYxA4Byy7LCArmhliyJIm7kY5OV9j09MSK8X/w6wbwZ5FZu/8xUSYxbxO1jiT3iVIqNuleWHLcC6yHWJ0DF8bgYV48IcVYRsJtdaBq+9Rq6UaUL2/d431tfog3MyIFXIvgSRmQx4J7blp86sF+IKnBV/E1BCprj8jYzfahEqof2QHTb9D7CXvpIGrv1MnHA41YCktp3N7PJSu05YnwFD6jl0bxXFWkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Wed, 21 May 2025 12:50:19 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%4]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 12:50:19 +0000
Message-ID: <9d688c06-cba1-41c7-865f-36d6d1d8c3e1@intel.com>
Date: Wed, 21 May 2025 18:20:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
 <IA1PR11MB6266DE91973CDC2237B392E7E297A@IA1PR11MB6266.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <IA1PR11MB6266DE91973CDC2237B392E7E297A@IA1PR11MB6266.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f009087-f0fa-40fe-136f-08dd98660ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnM4aGhGR0xNZVo5clFKdW9pTWErN3IzaHFzQmJYSlZERWxXV0tzZ0UyNUF6?=
 =?utf-8?B?NnNtd05JcThZRVcvZEVzVlZrSDBwMTROZDgzYXZDT3VkaVRHR3BmcDAwS1hm?=
 =?utf-8?B?OGZsaWhCOUZ2OGhTVXZoSDYyNUVvR3JTMWMvQVZycXdFT3BsSFRtYkd4Sjg1?=
 =?utf-8?B?VDRlNS9GbWFOajA2SzZlT0FSdWV4MjAxYVBZTXlBR2tEYWh4SE15bXVWNEc5?=
 =?utf-8?B?SjFtekF3S25UQzVoWlRaSU5GOUx6VWcyQzBmajdQbjhwaUowYmRka3R1dlBM?=
 =?utf-8?B?ZmZyQUhXVndxandydU1NS0RoV3VCT0VyN0llcXhKT2VUR01qQk53Yi9MVE4x?=
 =?utf-8?B?bzZhUUE1VVpBcnZ6UTIybE14M3dPTGhpSC9DeldETVB5bVdUWFdtc1NyOGc3?=
 =?utf-8?B?Q21haEZBeVFrSGx0dDFiODlTYWxDRDhTN090ZDJIclZvMG43aDFFREcraVpm?=
 =?utf-8?B?Q1lDRjJzSURhQ1BsbXBTTnRWNGY5Wmx6Tnl1eFlHVlQ2RmJ3Ry9xcE14VjVV?=
 =?utf-8?B?b3pzTVVBUy81dTBCREhvVjdlb0xrY0RVVEp3Y2oyR3Z5aVdDV0Y2aUN3K1VN?=
 =?utf-8?B?SEd2d1ZiU1pHdmg5NmdSN3V6NW9paDlUSGNmdk01RkxTdUdqcHhLNjhJMUxE?=
 =?utf-8?B?Y1VDaVVUUmZ0enNKbFJ2Sm1jdHk2WHFQcFkxbDQ0Y0JqNVBOVjRXVlpUK2pN?=
 =?utf-8?B?MTZxa0lzeDc0ZDg3QXNFWHFXOEpZbWVXamR3c3I3d0t6Y1pHVjdEbmJRcGVX?=
 =?utf-8?B?ZUdCR0JFbElOdFl2WU05azlzdHdVa3BhSU5qQkljdHZlSzFxc1BzQ3dpbTgv?=
 =?utf-8?B?TjdwNTFBNjJDaVF0dm9UcDE1cS9KS2FSazBhblRzZnBWWjF0MWt6bXJDamdO?=
 =?utf-8?B?alQ0U0VjZmVnNldRR1JKSG9MNmpQZnBHMDdaTThHWmFvSHlGQ2c4R1VjdUc5?=
 =?utf-8?B?dmdJZmUrak9Qak40bi9rUUFUd2p5OTVFNXVacUhuM0tpbkczY2taTVNhOTk0?=
 =?utf-8?B?aHROakNEcy94YWE3WmxpdkFCWndmSE9KNDgyRGdxRFUzdjFzWmZDZEw1LzUx?=
 =?utf-8?B?a3hjYnVVU0FHeWFZaFBxQzFRMzkyTmVvVFVLM3JPZG96Nldya1pVWk02ZFB6?=
 =?utf-8?B?Tnh6TGtyc0RTL1BlSWJNaTJQOW1xRTlYd3paR3RhT2F2Wi9yTG01bko3b2dW?=
 =?utf-8?B?ZldWRkk3c2F6UEhpTG1ZcXAvRE5NVU1xdmJ3RzdIcUpIM2tNZUttTk5mVy90?=
 =?utf-8?B?amJkSjVpUW96TzlUQXJlQis0VjRYV0E1UHpvd3dFQWRFUm1XWVhVL0lEZ3U4?=
 =?utf-8?B?ekd0Z0lHRXJSNlpsSEY2VmtRb2FXSVZFNVBlbENtMGNseWhObCtBZkYydU8w?=
 =?utf-8?B?US81a2d2WTJoelpNeFd3UUNwNHE0VU9WY0hDdTFTOTEreDcwWkZXYmQ0QWFo?=
 =?utf-8?B?ejVDVDhVMks0RE9QZGY1QjFXUENtM1RHciszYloxYWdZOGw4OXVXRkpFY0hi?=
 =?utf-8?B?TVZLTVMyS3M4R1BYbytvVDlyNVZvbVJZenNDZjdmMzNrWUZ4U3BpM1pIWjRL?=
 =?utf-8?B?b2pXaU1COUo2TEZiYVkxSFkrbUFUNlN6L1p2Z0xwVysvMXNrbjlUR2Q3L3NB?=
 =?utf-8?B?dSsrNFZTeHI4aHdKdFJFV0k5Z2FBV2haYllPTGhLd0luZ2t2Vkk4cVRMd2Vv?=
 =?utf-8?B?am1oY3h5ZVlldUI5Mi9mL3ZHWmtlR0U2S1Y1TkM1V1QzR1RzR3loYm9Jc3JU?=
 =?utf-8?B?UktzckptTjlPUDc3TkRidFZZRkNobmNNbjU2VXdFcDlVem16aG9qNFA2dUZq?=
 =?utf-8?B?M1ZLZW02RmtHU0xvMlBQYlhtUG9SN3lCZ25JU1NrbVY5SHBBL1hQNlh4dVdU?=
 =?utf-8?B?NmFsRU9YdXJvc0dSS2R3L3Bac2dReVVmNStUNmd4MnJBV0tvcTFPR2s5dHB6?=
 =?utf-8?Q?BkMwX6Gsbiw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUJSYnBCcmNSMHZrK3VLOC90TGlTVGNDVE9haWRyLzI2bEJQMTkvS1Q1Qyts?=
 =?utf-8?B?L1A4NmQyd09VNWZ1L2dWODNSOFdKTlZkSVlCaUh2MktOVUNKTEZobTRMd0k5?=
 =?utf-8?B?WmwxbmRRanJCOVVZang5VStpK0ZmeXhrMkxDbVF3LzR2M3N4aW01NTNBVFEr?=
 =?utf-8?B?TDlVUHJ0NXpJTGc0RHdwd1JHblR6a1MzVm9LYjAvUDNIajN5Q3pxVkdoV282?=
 =?utf-8?B?ZXZsUXdFamNsVEliY2lUY2pyMEJzQ2hUa1p3M2NXc2NSOUNIbzBJREl3RlN3?=
 =?utf-8?B?a204R2hhUUtxYWFrR0VUekNHUTQ0WXVsQms4bG5XL3JIb2NaTDNRNW9UaE5r?=
 =?utf-8?B?T2tqQjN1NzdkZVZXNDJrZkdNMGxpeFd3eVoyTFVkSERueElrUTNlTmloV3Yy?=
 =?utf-8?B?WEl5OEV2YlpxeEx3RitPcmRlY0J6ZEw1L1A5SmhhK0VqTFA5K3VnUXNtSEVw?=
 =?utf-8?B?aVpDSmdkYVJVU3dZQU55L1B5NGE5SktVMU5jYXVXOVBGemNidmpMQkNlWFBX?=
 =?utf-8?B?cHg5ZjN1cUZtZWdNNHdSK3ovSU9wcTB3dW9FTFNVbGtqN1BVQUVEZ0Q0Y2xi?=
 =?utf-8?B?WWRzZ2Z2T3AzVStaTVlGNEVFVnN4cmlPS0RsTnBiMEtsWHhON1Q5Q2RXYWIz?=
 =?utf-8?B?eVp0YkZiZHMvTkhKQUtIU2Z0MWpDd0ZmOW9GRW5rOG5nTktNNzBTdFU4cEI5?=
 =?utf-8?B?U0xjLzBkTTRzS0sxYkFZSE4yQW5uUXNtOWJ1K1QyUlovK2p4UStuVHVkV2F6?=
 =?utf-8?B?UXBkWkxDTnBZdU8waXNqeEZWQlFmd0wyNmIycjFKeS9RNTh4WDZ2NWZwRjQw?=
 =?utf-8?B?bTgybTBkc1pwaVlvMkpPNG91dWZ3ZTFJVGovTnM0NTVMcm9sUFVOSGJwMFBm?=
 =?utf-8?B?eXRKZkVhbW9EVlpiZ3JOY0plbEVXZHJBWFdIcnVkRW9rbUZYVHE5cGp5ek95?=
 =?utf-8?B?OUwxdWRWSDYzUVBYbkR3cm5la2psMFdTODJhbUFodlhaOERnVmtuWU9ZUDZS?=
 =?utf-8?B?WWN4MkVtY0ZlVm5hU2JPaVhVL1RjeEYwdWxjSXlHUkdCeEpHZW5QU0Q0UzVP?=
 =?utf-8?B?UG84eGlYaHRPQUorbGZDZnpkUWtKb0wreGVsSERDRVBrVzRpTG4raEZvM0sv?=
 =?utf-8?B?ZEtqL05IYjdFeEFGbStlN2wzQ1ZvTmNtbGRGbjVQNEl0V0ZhU01RWGdQMm5U?=
 =?utf-8?B?djhnSmpEdGJYY3JsaWpxMGZPT2RnMnppMXpkMlB3U0EzS3hSSHYvOThmNVVM?=
 =?utf-8?B?Vzk3dWN5cDgxTW1xOUFxS1FWc2szTldkTVBJbkt5VFdIUzVCQUpWWVJBUVJp?=
 =?utf-8?B?MFZJNGdPbVZuazdKK0ZJem9pVkZjMVFLcW81eW03WkZIQTJ4OFUzaTB3UmQ4?=
 =?utf-8?B?aXU0UXl0aUQ3UXVpRkF0SjJUbDlaZFBqdEpSRG54QmR0dDBwd0V0eFFJRHo3?=
 =?utf-8?B?dENtZTYrTDkwRE93MlhGclBiWTJoOGl6VjViSkZnSURIRWFZa1R3N1A1eXdG?=
 =?utf-8?B?S20yd01yVmRWbGZwQWViYnFEcmhPZ0w0b3k2S0FoWFRwa3BHc0ljMFZMMXda?=
 =?utf-8?B?aDVzZjRZcW5taVUrZFVEbkRhcG1vYmF5bDJnQ2ZSWW83TFZHN2JNRHhOazNE?=
 =?utf-8?B?R1RUOW1idFIzMjJOT3VlVEgyaTRVTkJvOTV4T2k2djRYTG5NRzllT2lMaThn?=
 =?utf-8?B?dytRanVhV3BVN3gxSnFCMHlmckxPNll5TXViVmJKUXc2Y0lwU3NnVjF0S1VO?=
 =?utf-8?B?Z1RZeWpMdm9tN1NqV2oybXM1NCtHYlZDSmZRcUc4Vmw2ZWpnNVoyc1pJNGxL?=
 =?utf-8?B?azNCTDhwREh4QXlETzc5eDRONUJIVWpNOHEvOFo3NXM0YVVGdEtmQ2ZUaHRr?=
 =?utf-8?B?SjNDeUNWZW5qb1NuOUxjNWwzdlNOdzZmemZFbUh5TG1GaTd6MmpBV1hXb25C?=
 =?utf-8?B?bzRmOUpLQmszd1FtRkRUaGhoZ3VOdDBvUVRxejBrRVdvZEp4cGJoL25ZMi9L?=
 =?utf-8?B?eU5LRFJnZHhVYi84UXl0ZTZFdXVPemVhNjQxQmo4blU4blpDeTNVZlE4L01z?=
 =?utf-8?B?K1Rmc1FEeVdBUEFOQ1hIYkxSNVlTM0NGOWhFWGEzdmM2WkNRblNlcW16b2dN?=
 =?utf-8?B?Tlc3aWpRUWtmejFpcWl1S3ZTQmgvbUhkSFl6amxKdDRuTUg2Nm03RC92dWNn?=
 =?utf-8?Q?XL4JwW1Uot+gLT0yM1h04cc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f009087-f0fa-40fe-136f-08dd98660ad8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:50:19.6471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uterf+MJFuE8XpIdqN3zRr9ojih8nLr9Ij7J6OIZetkjMfv33FnvM72C+EXDQ3WJGsZazHPc6PY1ehdsd/vpfKiIQVFP3w1BKOg9ObumkjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
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



On 5/12/2025 12:12 PM, Bhadane, Dnyaneshwar wrote:
>
>> -----Original Message-----
>> From: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
>> Sent: Thursday, April 24, 2025 3:00 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>;
>> Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>;
>> Taylor, Clinton A <clinton.a.taylor@intel.com>; Atwood, Matthew S
>> <matthew.s.atwood@intel.com>; Bhadane, Dnyaneshwar
>> <dnyaneshwar.bhadane@intel.com>; Kalvala, Haridhar
>> <haridhar.kalvala@intel.com>; Chauhan, Shekhar
>> <shekhar.chauhan@intel.com>
>> Subject: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
>>
>> In existing code for PIPE CONTROL post sync operation instructions
>> POST_SYNC prefix is not present in the name, add it so that it will represent it
>> is a post sync operation type.
> Is there a specific reason for this renaming? Is it truly necessary?
> Regardless, the terms PIPE_CONTROL_POST_SYNC_TYPE_QW_WRITE and PIPE_CONTROL_POST_SYNC_OP_TYPE_QW_WRITE would be more descriptive.
> If renaming is indeed required, it should be applied to PIPE_CONTROL_WRITE_TIMESTAMP.
> This refers to all the post-sync operation types defined and used in the code within the Xe/i915 context.
>
> Renaming can clutter the Git history with unnecessary changes, making it harder to track the evolution of the code and understand the reasons behind certain modification.

This patch is xe-upstream version of below xe-internal patch which is 
already reviewed by Matt Roper.
https://github.com/intel-innersource/drivers.gpu.linux-xe.kernel/pull/1163

Thanks,
Ravi Kumar V
>
> Regards,
> Dnyaneshwar
>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>> ---
>>   drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 2 +-
>>   drivers/gpu/drm/xe/xe_ring_ops.c                  | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> index 8cfcd3360896..75efdacc4979 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>> @@ -54,7 +54,7 @@
>>   #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
>>   #define	  PIPE_CONTROL_TLB_INVALIDATE
>> 	BIT(18)
>>   #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
>> -#define   PIPE_CONTROL_QW_WRITE				(1<<14)
>> +#define   PIPE_CONTROL_POST_SYNC_QW_WRITE		(1<<14)
>>   #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
>>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
>>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11)
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index a7582b097ae6..da50213b78c5 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -145,7 +145,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool
>> invalidate_tlb, u32 *dw,
>>   		PIPE_CONTROL_VF_CACHE_INVALIDATE |
>>   		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>>   		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>> -		PIPE_CONTROL_QW_WRITE |
>> +		PIPE_CONTROL_POST_SYNC_QW_WRITE |
>>   		PIPE_CONTROL_STORE_DATA_INDEX;
>>
>>   	if (invalidate_tlb)
>> @@ -216,7 +216,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value,
>> bool stall_only, u32 *dw,
>>   			      int i)
>>   {
>>   	u32 flags = PIPE_CONTROL_CS_STALL |
>> PIPE_CONTROL_GLOBAL_GTT_IVB |
>> -		    PIPE_CONTROL_QW_WRITE;
>> +		    PIPE_CONTROL_POST_SYNC_QW_WRITE;
>>
>>   	if (!stall_only)
>>   		flags |= PIPE_CONTROL_FLUSH_ENABLE;
>> --
>> 2.25.1

