Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151FFC5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 09:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F6410F279;
	Thu, 13 Aug 2026 09:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5Mplm6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1DC10F279
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786615124; x=1818151124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bHK+CzpRzp3t9bTqYe2N57p0R2PoecqB289isLi4epU=;
 b=j5Mplm6AbAd2U97ASEQAllTzozSodAZqjTBRJlhJSxz0P4hksYG2XY4r
 vuc0eWQ/ORlhyZcX1Q+SGrjBVNEQAksyX1BH4qtJKnNEvarOc/fq0hDJC
 kuS8Vk5RGCFnx8h+ZPyPfpXIuHNwIsqdcY52UmgsXB5RlZfu6N3ANeMAv
 Kc1iXD8Rb/xzcTXcguscdBcVk97KtdVqASV+JZPC4nDpHBugHPt9KA0ok
 3MlaKcdelGKtFvRnko1fyaHbvdMRju7vVvIsnIizF+wmY646PQU9WY7W0
 ouuQyYDyNvRa0GnE/18XRmymU95XLLgTqz2p08M1x+YhPiTa2LW6Qe86B g==;
X-CSE-ConnectionGUID: kUUcB0VnQ/2Mjz7bCMV8JA==
X-CSE-MsgGUID: tLf1IOr5SFWcHibgzlY8iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87065873"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87065873"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:58:39 -0700
X-CSE-ConnectionGUID: pHmmn4MyTv6O5++tfAIYOg==
X-CSE-MsgGUID: YcTEhYMhR/G7t27Gi6fMxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="262583368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:58:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:58:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 02:58:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:58:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8ZEoo2DqUSTVSIdaJFxGlxRZxpjiD5Ct7H4nSwCIcfI5f2za6MItbw36iTWYtDqkOHqZR0U+5QcRf7xefHDELXnnAbkXP2P73vq21gD1GMS4DLOS5AalOqkbA1V+mSGLw1OpnLM8y88VBkS3yRNYb0wPc0DCkaGmVzJUBDOFSe9TCmNv0+qfiQ5Os89QKLBQCIRYv0vkk5ti5hp/EZPMLqVPr6S1oP+mfet9ffZ7jC1JTDn9BWjqblgXA/DwLkGCfW6LkilhlOsWuWUTndVJ1hxBZ4MrdDX+pJIQVJHgkaT25gPg/fI5eewVSCn2hzw58zSjtohy9TAlI/qIYbBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAA+HFYMTZI8FZbpACG2WaGsAjYJxSkHQ3tvYGF/Wts=;
 b=NcLPn4clAjxppmezEyK/z0m4Kye5nJvQZsEqvNx0X0qVzEtfnJz/qTZIwAppGoS7XJ5IQzO3gu5UuZMDaRmALnmiBRsHIozqOFoYInIzwW8h6XvuthYe+jX/Lr3SlQWE5lQk1YcNd/i87Qup2jsOa6e6QvsfIou6wrqxIMgtHzMzBKSb6kXel4ED+x42YKCJDXabj2L7qRliGsTN7+vQkL6Qkm8d00eL6EMSqBTJ3V4T1PXBOrg0yRMiRKjvEOStrgmhupAPt2wSIW6Ny9sPqo7T13EDHebRbcsdj8NhgBCmr2NYexUEQygBCEFiFjVcDyyejHXsrIJ5K1+1MfzBpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LVTPR11MB9911.namprd11.prod.outlook.com (2603:10b6:408:3c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 09:58:31 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 09:58:24 +0000
Message-ID: <0277da91-96d7-4748-8045-82716daf315b@intel.com>
Date: Thu, 13 Aug 2026 15:28:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/32] drm/xe: Report all probe errors using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-20-michal.wajdeczko@intel.com>
 <7beccc51-6814-4680-bcbf-225580abe886@intel.com>
 <e098768f-4946-4671-bf80-e961f1d99700@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <e098768f-4946-4671-bf80-e961f1d99700@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LVTPR11MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7fdb5f-7feb-4b52-9dbd-08def9216a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MP3lil9aJffFWtJ0iH3aKuHwHlFivgbraG+ARcZJDk1gm/Dq7azotKRtxOrzmw7l6dZyZP/C4zMnUP6mZDqootiZSZUG2mG3AKQMaUshk7R35SeIIzKBddRG664ks717sKrBgYNgwgooj51ckr1BoZRp28vA68Y05eBgULiZOvpFG4bCsN+MOZZ4Z/ZdFGKqm2hMlcqNhUcIcOJkf5WBgMNlEKne3H/GxMekpY/FdiMwPy3AF5vU3ZdW0oi9YW8fuqmOy1mhZRQhgY4nxROhxMDRCZBP3IW0zf6RTk+lGQnrJhdNqr8p+yV/7mGG/b+7PeNbx3a+M/BYO8B3g5iH4+bj6QSHc9YlJUsYWRWHi3VldKrXegGQj3EP65JWgaNyYLQoVHwwi/Bgqz5qyYHj3uDWzc89xqAsnxpTsE8wgz5bhi0hmhvF4ov7WfEW6g0vZz0I3Y35PbJHxMwyhYvQqToLa0WZLotS1xmRC6hUBRiYh3NUP5Ilg1B4tc0KzQ//k7XVj5X3x0GVThp6GSyr6W5x1JOdzp1YMSccQFX6EKUBNnsf/6xvvkWYPJ7nNnwn6RZ1fhfiKflJo8qlRnKBrApK0A5frLxh9C69W+14aKpv9gOfzJv0NqbFxXCr5fPM4G1MhMqJdxpzj6Q/zvT/5TFYt7FA8n/5stL1no8OjSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjhGamdtZHdueEFnZFEwZWNHbFgzUHJtUTkvZ1FsY2p2Uk1zdzFXTG04Ymlj?=
 =?utf-8?B?RWRmOUJsc1h0NTNFVjJsa1FxaHRHQThDUGVjYzVQbFdlVE56UWNUYnpHY0pn?=
 =?utf-8?B?cS85cWthclJLVzVxUkVYbEpsWDdsTGczTHJSUWRab09LZVZjTFhhTnhWTGkw?=
 =?utf-8?B?L0JwQXhrQXpIM1lvT2MyMTJDVEV1WmtyeFcwV0g1UVFmVDZyZVkrSWZObmo2?=
 =?utf-8?B?Vlh0Y1hrU1FudTZhb3JjRy9YWVlrNTBNeXFIOUFkR0FreG0zOUlCOUhhL0Q3?=
 =?utf-8?B?b0ZZU1doYW5KRjhVeFFnSFhua1pRTVZlNGhyZFBFTFR3MGVPRC9vUHM0VENy?=
 =?utf-8?B?dS9aZDExdU03c0tUNnh5MWtjUVc1VWlqZk81a29zSzRiUnJNTElUSEZsTzdK?=
 =?utf-8?B?KzBJTFZhOEJwM3ZLc04walhLaUZVczV2UGZ4OTdadkpyejk0azM0d1VadGtr?=
 =?utf-8?B?cU0rNy9ONkZpWHRYUmtCR2JaejY2aU1BTU5WY0NEc1FyMGZMTXIzODJTWU05?=
 =?utf-8?B?TlpqUUJLemNhYTMxZzBRY05xS1o5ZENIa3M4Ym1TZDN6c1dOTHVBSGNDREE3?=
 =?utf-8?B?KzF2NkRsT3RKc3NKcmNSenFzOHR3YU85REg1b1I0MGs3YXh0bGhvcnhvNTFE?=
 =?utf-8?B?NTRBK1Jzb3hyYU9pSWNOZTUvdFBMQ1VUcHBrU2RndnN3TE1DSHJVWXpCSWk4?=
 =?utf-8?B?RlhrWHVJUU44T25CWFAydGY0WUhuamwzSWw0RHJDZXFjR1g2bU9zb1dyeXFU?=
 =?utf-8?B?Uk9tTVRMMFIrZDZ5UVg3TVZaVG9ZNVJQanU3ZGJyUmpPOGhRUkgzcmF6QTdU?=
 =?utf-8?B?MDkzUnA1WklRYUtzY29NcnRMUXE2T0JuUDRYcnJYK3AzYyttQURqTU9QMk9q?=
 =?utf-8?B?dDNvcEhVdVFma2FOcnVhcE5MenByaVVLUDRMMFdZcjl3cHZHeVY5M3Y2NXY3?=
 =?utf-8?B?dlZxNDY2NjZJejZKcjJLYjBQN0szMXhwRC8va04zT2xtZHVyNWxPbDV1M1ZB?=
 =?utf-8?B?d1VWR3BhcG85QUZmNzJHUXNHOHVSbGptOVNJdi9NL2dFZXVZUjFHcTAxZmtu?=
 =?utf-8?B?K2kvYld2RWtkcEExaWRjaW54SHF2dmFYVVVQRStBNjNxRmxnQ0VHcXRaL01O?=
 =?utf-8?B?b1I4SHAyYm9QS1o1bnJFUUxEZ0taZmRNZHk2Y2Q2aG5naHh6TVlyTWhoTnAv?=
 =?utf-8?B?YVJjU1RjR21UUHU0bFJCdGVTVFV0WmlHQUQyQnpoVHZFWmxtTjZ2aVhDU2gr?=
 =?utf-8?B?THp6UDU1a01qZUdoekFxN09CbXkyblVVNGxVWDVEQTNXOHFEbENBM29lL3o4?=
 =?utf-8?B?aHBNYlZhRFVhTWRpQVVmUFMyK3RmbCtGUWVwVERtUExxVTdjM2hocFowZENk?=
 =?utf-8?B?SEExNzhuZlN6all6RFlnMWN3SElISmxmemR3M3RxS05DTVM2VGxTR0hRdDJI?=
 =?utf-8?B?dUd2MGhhM3VpMG1pYTNqMDRLUXZSR3NQNm9NQWFBT0tEcWJKWnVuRFljZE91?=
 =?utf-8?B?WkxDQm9YMEthN2d2UDk3R2dGWFQ1R29UN0ZRdExWRzFFZjRNSkVPa1NsemJQ?=
 =?utf-8?B?NjJJTFhHMDVzcUtvZllId1hmUmZnTVNXaWtsRUlmREp2bW5mdVp3cGgzZzN2?=
 =?utf-8?B?TkZ1a1ZUR3dwVW8zaVhqTjdHVCtMRG1sMDE5TTNHYjdkajI5em9RSUNRUGNE?=
 =?utf-8?B?R1IwNCtHOHV0aVF4dU9IVVlFWThiOTNQZDBLYXBoSzE2ZW8vYWhMekdjQXRj?=
 =?utf-8?B?ZlhURjQ0OENoUTdRTHBGMlhyek9ZOWluSWlHWnN3U1JVMUlGWTU3SEc5cndT?=
 =?utf-8?B?L3N1REREb1VMV082UU5NRE5FK1hvNzEwc1UyMFJEYjBwcS9XMXZUcnNBVDV3?=
 =?utf-8?B?TVh2akVvRlk4SklEdzZCOHljOHVEZk5jVEZkV09OUUwvcW5XeDcvN1J4VytV?=
 =?utf-8?B?MXZrbFh3VlNEZUJBeGR0R0t5N0taTTdhSlpmT3RacFdXM1lmUVBkL0IvOXly?=
 =?utf-8?B?M0huQnZ2ZXM5SlY2RkMra01XRHJMNllTbWladFA2NHRaNTVaUyt0NmpnbFJF?=
 =?utf-8?B?WDcxZHBveXlwYkpKb0FhelduQ1Q4VzcwTU51R01mOWNOdFZpMXA1UkRWN2hS?=
 =?utf-8?B?SFFwNFdwc2tDcFVOQVBFWVF3elZidHVRQlF1blVKUDkwYXEwT0R3ajFqYkJ2?=
 =?utf-8?B?bnV2MUtvWHhxenZvOWZxOW5uR1dRd3BQbWt0cGpVc0ZNS2twVitGbGVuajdH?=
 =?utf-8?B?aCtqSENYSTlKVkMzeVBmdTBBd2VBN1lxKytQa2tZNXFsSSs1QVJtcFhqZ2Ro?=
 =?utf-8?B?dUhGSTRaRFJYRnRxbW9maWxwSHNkVGlIc0gyZGExSWNNcFpVK0VmeUhZRHNV?=
 =?utf-8?Q?dwbYV8RCUqi+8Zt0=3D?=
X-Exchange-RoutingPolicyChecked: ExIjVq5nNuZAWBlKZY2k225Sxr4w90pVuUXY5zdlAj8llvpaLHy4YJVaBlQL+zC/VfiOdJn4aJU/8plNWBNc/LdoUrJzQmH0pawVG6KOicVTXJcDF1bUcDoo4qP1TBgzVe7HkwWv4CnmN73OIocJA6CFVggDnJ4bfUJgEPaD8kZI/2X7pQReolFMAI0zFXmVSE1mkDJsFg3fWzjuf/4Ak7ap38/ZOFCeeay1aLfY8xD6OkjEFDHRWxS9qrDERIf1qKHO42kxLrnfA6jOmeGs7UfYBxPX0i77mQdB1iOuwwKOLAoyimZZdj+lrEZT5eGQPCmfU2rkxfuCACguNIZu4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7fdb5f-7feb-4b52-9dbd-08def9216a2e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 09:58:24.8222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LcvoJM0f70RlVqDk8c7RHxzisrO55xIDiMLUFK/Rx71b7tUxU03sK1PPfrVe0GtS88xEwKn0Yl4T5myShGZxa006ufTBoi+PqWl85tXoII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9911
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


On 13-08-2026 02:42 pm, Michal Wajdeczko wrote:
>
> On 8/13/2026 8:50 AM, Mallesh, Koujalagi wrote:
>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>> For completeness, we should catch and report all probe errors, not
>>> just the ones that have explicit error message. Split xe_pci_probe()
>>> function after a display check to avoid reporting -EPROBE_DEFER and
>>> use xe_log_err_fatal() helper to report all returned errors.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pci.c | 27 +++++++++++++++++++++------
>>>    1 file changed, 21 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index b19efef1c5cd..ab4da1d9a9f1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -1147,17 +1147,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>     * caller. Therefore there is no consequence on those specific callers when
>>>     * function error injection skips the whole function.
>>>     */
>> nit: Align xe_pci_probe comment message with latest changes.
> hmm, what exactly do you want to change here?

Since after refactoring the code, xe_device_probe move to __xe_pci_probe so

we need to change "functions called directly from __xe_pci_probe() or 
indirectly" right?

>
> comment above is about "Probe the PCI device" sequence in general
> not about the specific xe_pci_probe() function

Agreed! however the are using xe_device_probe function name etc, which 
is part of  __xe_pci_probe right.

Thanks,

-/Mallesh

>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> thanks!
>
>>> +static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc);
>>>    static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>    {
>>> -    struct xe_probed_info probed_info = {};
>>>        const struct xe_device_desc *desc = (const void *)ent->driver_data;
>>> -    const struct xe_subplatform_desc *subplatform_desc;
>>> -    struct xe_device *xe;
>>> -    void *group;
>>>        int err;
>>>    -    subplatform_desc = find_subplatform(desc, pdev->device);
>>> -
>>>        xe_configfs_check_device(pdev);
>>>          if (desc->require_force_probe && !id_forced(pdev->device)) {
>>> @@ -1181,6 +1176,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>        if (xe_display_driver_probe_defer(pdev))
>>>            return -EPROBE_DEFER;
>>>    +    err = __xe_pci_probe(pdev, desc);
>>> +    if (err) {
>>> +        xe_log_err_fatal(pdev, PROBE, err, "driver loading failed for device '%04x'\n",
>>> +                 pdev->device);
>>> +        return err;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc)
>>> +{
>>> +    const struct xe_subplatform_desc *subplatform_desc;
>>> +    struct xe_probed_info probed_info = {};
>>> +    struct xe_device *xe;
>>> +    void *group;
>>> +    int err;
>>> +
>>> +    subplatform_desc = find_subplatform(desc, pdev->device);
>>> +
>>>        /* Group all devres so xe_pci_error_slot_reset() can release them as a unit. */
>>>        group = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
>>>        if (!group)
