Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D69CD3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 04:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0413F10E0E8;
	Tue,  9 Dec 2025 04:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3g/OxoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD9110E0E8
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 04:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765255083; x=1796791083;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pKPYKymBZzfIDYU03ByEF7a16Jnx1kKHmNKJUJTSwh0=;
 b=M3g/OxoIuwTMmYX/3hy4/YXoM2zZQ/jB+ygyK6xOBEAnovxJRmfwuzgf
 XckD8KG8Gk0VO/X1uoOBfNH8O4N0xNJyOlp1AzKoH3wpOzxZG7fuNRffP
 To7uraK0hMHsI/Hj1EzXsjkdgt9pmc7NYBW34Z6LP8LYOvW4vkou5sadO
 PA2f6eSl/hPM2NW6xeSbHbZ1A/EfZSu8FYXaZdti8YdIruHK0qloVl//b
 852wmqFHLPDi38MsBa6TP4gJJoNDWgqCIlzcJCBoZsa71877QNxkdC4Yd
 pDESlC6ZWmOyWNEasSc6abzpRz9+Qujl7oEDqQCSYMOXxonSj25dtXHD+ w==;
X-CSE-ConnectionGUID: ljtpzAwDSMOX0pPLDhkAVQ==
X-CSE-MsgGUID: hqpAQgDmQj6Rf3cSrS+VDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67139018"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67139018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 20:38:00 -0800
X-CSE-ConnectionGUID: tk/XshX3Q164VA4hwCoysQ==
X-CSE-MsgGUID: FbypBZHDRhycvXDkawd6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196142033"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 20:37:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 20:37:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 20:37:58 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 20:37:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeDyAeQda9KO6riSAM0wmxi+21uJpEG8q/I9bqssh3ClRhMfZS83QHepZXCUqrG0oJdPRRYmlf24vx97pwMPYeCfXGFxyxpaOxLhsNfoM9U8BnBP5D3QM7QmZHjjce9tdjyciZ9ENZHNIC3hb6YHG0SKD+PQzji74TgU6RDxRdhUhsd0W8IKUeulUW0cEJ4DVivdoSEEN2GGyj0n/vnNPLvd412K4onRAx8/o3q798ymM85Dj0Vvc2/SPzt0CqIMPoDbcO31Wlt+FAHeUuJ94639y4jJ3FEYSyB/OL5aXjBtRbssgFh1skMSj6wbjmKh/pUpLtSer8P3casJ0Jl2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7Uq0m/LsTtH3qRmmKPlvjAZOPElYQKiJerzY5BGPDw=;
 b=mlgNCCJhzh/7WGA1YAcgmObNSNhFdO+4UGXtEI25BcOGWflB3FK1BlcQwQJKk4/tmLZUnwuEl4aAqFBOqDiASbVKAAZLtthSwwL0dzb8/++zx0a20H5KzBcExrDrcGaSUPkVeuI5LPfp6jcNxEX80v/bWQJqnOfXbQ42uycP2VSNmgakOkJDz5ry5MVq6lmRsANeeo0n3I8uvi+j5wD9hi+Ya4V0+BNdKFGlnpf2SQWXsT2ELNac+c9Ff0BLeByqxAEM3GblxYHJ6OS9m3rbV7CwYL44RdB0rwI3zbCetjWTM/27Eu6MUq3Pb9tLvEKi+jXXTuCyiKmg6QaI40AMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by DM4PR11MB5325.namprd11.prod.outlook.com (2603:10b6:5:390::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 04:37:57 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 04:37:55 +0000
Message-ID: <0d2d762e-79c1-4e05-8f13-0700cbf0fcb2@intel.com>
Date: Tue, 9 Dec 2025 10:07:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for
 contiguous allocations
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
References: <20251205031112.3590252-2-sanjay.kumar.yadav@intel.com>
 <aTMGEVO1mRJXSXrB@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <aTMGEVO1mRJXSXrB@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0107.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::9) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|DM4PR11MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: c18d4d28-6d01-4f1a-58c7-08de36dcb8b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clFlajdiLzFLNUlEcHZYWDZhcDBudGw3VEQ0d0doNXdHM293UmJqT3d0S2I4?=
 =?utf-8?B?c1l4YXdRUkJjcVUvc1VGQ2ZrOEpHUFlXZ1ZZVEoydklZSGdYUXIrdC94WmEx?=
 =?utf-8?B?MW1MYXZTdDc2RU9zdS8vR0xSN2R2QkpZeHlvcUNsYU93VUp4VkFCWmdBc3c4?=
 =?utf-8?B?UldVcmdXTlBNUlY1b2R5a2N4UVViRTJ3amVKQjZWalhxYndnVWp2UEtEczli?=
 =?utf-8?B?SE1Jc2lDWHVPT2FvN1hlZEJkcW9JSy9Iais2a0ZlOUl2b3F1WG10ZUROYlVh?=
 =?utf-8?B?VU00amdiV3c5UGdtYVA5LzFsTTR4Kzh3aUhaT2FkY3ZZZXRHOU9GanE4a2Jq?=
 =?utf-8?B?K1JwaE5uNGtRN0JTNEs5ZEhkWjB0a2pIank4TURuMjdTMUg1aVlqRFhVbFZC?=
 =?utf-8?B?MWdyZEhvNmhIRW16NzRMQTVBdlA1Rk5JWENDT09pL25pUDJpa1UyTGRZTFQx?=
 =?utf-8?B?dndLM09TTzQvcDROaEhnUG1OYy8yRHRLazlUb1NQUUtLQTRuNEp3cGVHYTg3?=
 =?utf-8?B?NytrY0ViTGV3NXhGa1BxQlVqaXBTS2lNM09rSjR0ZEdyUVdoY0dIZWhkTTRl?=
 =?utf-8?B?aFNHbm9rZmhnQlFITm8zY0h2R0NxQytyUkxmd2d4RTRRYVdET2FDMExGdlRn?=
 =?utf-8?B?QmZJWHFxMS9tZVBrOFd3RHFCNmswcXJUeW04UEl1SUJscE9mZng0NUFIU05m?=
 =?utf-8?B?dkNtMXV4ZmdoYVpSYnV0NjJxMUdGamNtdUIvYXRoWklialNycmQyREREbWVz?=
 =?utf-8?B?QkxxRFphUHY5RDd1Q1lzMVVFSVhyQytMUStNdU4yVG1kQWlRazRWTTNoUmQy?=
 =?utf-8?B?YUh3MHE5M2lDS2J2K2lUZzN1elVBUmQvRWF2a2QwRnVBUnVEcHQxTXpKSGpW?=
 =?utf-8?B?MU43T0pmUTBsN0VxVkJYYmorWjdZTUVTOEUrNmZhNkRFaXJUN3lsOUtLNVJ1?=
 =?utf-8?B?MFUza29Qa0IvL1FaRlI4NzZmcStaWkZZYmFCY050Z2F2SmlzZlZHSFg5YjF3?=
 =?utf-8?B?OVcrT2FmOWNQdlJDTzRxK29xdEtCM0p4d1pNdHFBQ2FyK2hKVllvTWJ6UkNZ?=
 =?utf-8?B?cHU5Qi9Md0VKemJCT2FhWFRTNldkcjRza01jbDlEWUQ5OXgyWGlwYk5aS3hB?=
 =?utf-8?B?L29TV0J2cExMTjhRN2VFdjVUakZwWVZaaXFOK2tPK1BxWmlhNTFVbUJ6bTY1?=
 =?utf-8?B?UmMxajJNVWhHWTZiNDg4VmxJMHBNYW54NGpqeitKY3pyeDVOUDBjS3htK0VB?=
 =?utf-8?B?b0txYkM0L1N5d0UxNnFINFVyRGJ3MWlMUXJBNldMRXU0MmgrVU5TRlg0K0Ew?=
 =?utf-8?B?ajc2QjVMSk1tdFBRMkd2TmhORUJWTXhxbGFvclJheUd3TzlnOHBsaFBuUEtz?=
 =?utf-8?B?d1hKU0ZkUXBzMmZsR0wzRytIalV4bVZUOXBZZkpDSjdNMEpVQmlMd2pkMnVh?=
 =?utf-8?B?OEpPQUsxWU9kNkJJZ00yV3ZRblIya09IUXE3ancwcWpWMi81eWcwMlU5RTJY?=
 =?utf-8?B?YlZ0YmFuNHgzSE9TRGZoQzlabHFQd25kR2Z6aUdwS0s0N1BFMEo1RW1lUmVC?=
 =?utf-8?B?N2NSYk02dytGa2ZQajdUWVRSL05UUXJmZUZPTUFWSGRvK2hDbCtWTGRlUnhm?=
 =?utf-8?B?ZXJ6dmI3R1R6SnVud2RLS1RIdmpWTFlSTGRlbitmcHZjUloyUy9kSG15Z3NG?=
 =?utf-8?B?TWMreHN2Y3JZSGVxVkxOZ0NsY0F0YjFyRmRvejF3d0hvZ09iVTlPY3ZITGJ5?=
 =?utf-8?B?ZGpzaURTQW1pdDVIZUh3SjZiUEN6MmRiTTRUWjFhUUhjeENLdXdoMmhWSFk3?=
 =?utf-8?B?WmI0eU1QakRMbnpyd1VDTllRcENMOVJQemFlSytYdWg1WE83dGN4UzRJYTFh?=
 =?utf-8?B?Y0hPQzRJWlAyMVdmSjJ4TkhjZWVhbkhiejRmay9hNHpxbUE4YkdhR2ZLTzZC?=
 =?utf-8?B?eVNrMWpBenFyT01nRWR4czRQRnh6NG1uNFM0UGxyWEVwRkdwVTFqRFFyK0lR?=
 =?utf-8?B?Y0p2eUpjQ21BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OURIQ2ZGWnZkb1ROa0txMVI4ZGpUYmZiY2FLK01VdU9vMnd0T3IrYllRKzJL?=
 =?utf-8?B?OGdlcVlpQjQ5NlBBZnpPQVVzS2haYS9Rb0pzcFI2NTl2NFJoUWNOMlVzWFR5?=
 =?utf-8?B?SjJtdGxBdDBPZ2Y0WS9xSHhPTmVWdzNob0N6RURnU0JZYUNIWVAxMlU0Qytz?=
 =?utf-8?B?L1MyUWgxakJNVWUrTjRkbkkxaEVITzlDb1A0SkttdjZQdEhLanlEQlcydmtl?=
 =?utf-8?B?dTRnd0JnaS9JSGJEa2liZVE1TEhUREdQWnBwUEU4VndwSTFHb1BoejR1YWxv?=
 =?utf-8?B?NGZLYkExVCtrRkRtT3R1M3ViYldNMUZjZ3R6dkRFWDBEbTdZTTlpZUlYV21M?=
 =?utf-8?B?aWQ4WGhLNHZIQ3RKakhuaTFlSk1uS0Q2c0Z2cW0vTjhiNGxmdWpHb2pmVndG?=
 =?utf-8?B?NysxUzl1WE9lYXlESG5VakVtZzRPZUFKd01uM3RNSkJhR0JKSjBXZjg4aHg4?=
 =?utf-8?B?NVlycko2VjB5aHRqWUZlcVFQNlpxMVBnbVN5MDNINFowUG80SElqdjNrWjNY?=
 =?utf-8?B?cEVDMVF6Z3AydUR3Q3c2RUc5bnBKOHFTNEhwNjVIa3VUVFl4TlAzZkpxdkZL?=
 =?utf-8?B?TnN4c3M0MGFoWnZsV0xJSEtvcUR2TkFWOU9tRUk5ZktFZ0s5S1NMa2cwdjkz?=
 =?utf-8?B?N0tZMXZJZTY1V2Y2NGZMOStLN25vejIwcVNBbUpqVC9UckdGR3MyektkSVhH?=
 =?utf-8?B?blkvbUZqOFVIdlNkWmx1OTVxN3JrQWczSXpkSDB4NU16d2daOU1ESGJLVnJW?=
 =?utf-8?B?ZFBHalRjbHViaytHc0hyc0VFSDYvZ0lDUWJRVGxIZ0tBN2NFdEFzVkMxOVBq?=
 =?utf-8?B?ZWhBWHBFL09uRXVpMzhiYVAxbTM5OXBLRDVmZ2lWTTVqSUxHQVVyR2FtZFNv?=
 =?utf-8?B?Q29sVmwwTmR0NmtPazdaSnM3UU5vdkRQSTNGWi9vdFptMzl1TkJGRlE4N08z?=
 =?utf-8?B?TWVaRk43OVVwbExYTktLTnNYbGpLQWRDZUpTSlBSaXliY2wzaVNEcTFEbmNp?=
 =?utf-8?B?R2dQbSsyN1J4dmEvQnBFc1VQRU9QdTFEUDhoeDhNaXZ5RHZROFZRcjZTZkFs?=
 =?utf-8?B?V21UU0N5VkxrdzVKay83RlAzTk4wanluZkh1OFRiRndtNXlGbXdiZy9VeWJM?=
 =?utf-8?B?am9mWWMrTTBOOExlU215S3FtYjdnRm5ocTBiOHJqZUIzMWlLdytuYVJkOFNF?=
 =?utf-8?B?V1ZVcHRqZFAvTGRjMnh5VTl5QVhZcHNtVWVMYWhzNDhqR041aTQzUjh5T0lL?=
 =?utf-8?B?ZjVFK05aMVNHTDZzclJTT3FsMlpaVWdoU01pVEErdnpXeWxWdVpqRVNaeTdw?=
 =?utf-8?B?ZzNlWFZRbm1uMTFiU2tvZmVvVHN5a0VzQnd4R1oyZExrY1NYZU9CT3U3VHF4?=
 =?utf-8?B?ZlV2YVFzNFV1RmQ5Q1RUS3NpSStRTFNmUVYxWWRRVzFYbDJNMWovOEw4UW10?=
 =?utf-8?B?eW0zdnBRTkxibzZndXlQcHhidExuUVJOOFkxTEc2WFlFU0VhY0ZFM1pGbldT?=
 =?utf-8?B?anRUKzJFcDdJOFpYSWRzckZ5Z1JHVE4vcis2SitteW9zSzlsOTJSOGowUlBo?=
 =?utf-8?B?YTdCUVN2cjZaTVB0QTdSUUoxUXA2U3FySHZHdUpHS2xaQ3NFa0s4KzhjVTBT?=
 =?utf-8?B?UHdGUUJJeG45ME1YbTlNcjVnSXl4L1JDOVN3MnZpMEl4bWpBdWVubjI3QWxS?=
 =?utf-8?B?Z3RQVk5GQldSa2t6SVE4L2JTYTF0OVVvWVpGMHd5VlpFeFhMZmQyRWNCbVlT?=
 =?utf-8?B?KytyckVubW01Vjc5WkZvZ3dVc0NGNlhRejRsL2Z6MnZycFUvaTdsNjhPUitz?=
 =?utf-8?B?UmFmSXFSV3dHb2wwY2hDOXBueGZTWm1FTStsTzhTc0l1eVI5SVdhQzV2VWZO?=
 =?utf-8?B?RkFhY292WVVEYTFJdE9lclNLVzhPNkdEWGgzNStocmVmUjRkL2cyTTBXR2d1?=
 =?utf-8?B?djh2bHFUNXJCaXkzdkxhQ3lhdUVjbWxKaGRieENrZzFPdmRWdDdDR1paa0hq?=
 =?utf-8?B?cTF0bjdvOE5zZWZvZTN4QnRaRzNMNWVsZ1hvV2R3enc1Mkw4bVQ3UE5nb0V4?=
 =?utf-8?B?SDZPS0NKMVJhZ2JMckJSWUdyUS8rSUtCRjhHR0sxc0xiUDhRdGFxMmZTYU9r?=
 =?utf-8?B?eXl3SEFWUVR0UkJMNk1HT0J0cWlzSVBINTd5T3pCc3FiZjBGKy9nSFRDYTcr?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c18d4d28-6d01-4f1a-58c7-08de36dcb8b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 04:37:55.7531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vs1P19n8Nx/MY5p/D0hnCOtNJ/Alqw5Mrmo3jfdyKGgemDBC/CpFeJGMDSDP5NrBmCDu9odcYkXNldzAkBkixCu5hNJxhxbj8t+xec1Wtro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5325
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


On 05-12-2025 21:49, Matthew Brost wrote:
> On Fri, Dec 05, 2025 at 08:41:13AM +0530, Sanjay Yadav wrote:
>> The VRAM/stolen memory managers do not currently set
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations. Enabling
>> this flag activates the buddy allocator's try_harder path, which helps
>> handle fragmented memory scenarios.
>>
>> This enables the __alloc_contig_try_harder fallback in the buddy
>> allocator, allowing contiguous allocation requests to succeed even when
>> memory is fragmented by combining allocations from both(RHS and LHS)
>> sides of a large free block.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6713
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 9f70802fce92..ef6cfb8af0ac 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -82,6 +82,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>>   		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>>   
>> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>> +		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> If we set this flag can we remove the logic which rounds the allocation
> size to a pow2 and trims if TTM_PL_FLAG_CONTIGUOUS is set? From a quick
> look it looks we can as drm_buddy has roundup / trim logic if
> DRM_BUDDY_CONTIGUOUS_ALLOCATION is set.
>
> Matt

Thanks for pointing that out! I will incorporate this suggestion in v2 
of the patch.

Sanjay

>
>> +
>>   	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>   
>> -- 
>> 2.52.0
>>
