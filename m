Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F78CC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 11:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D954810F7B0;
	Fri,  3 Jul 2026 11:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kx3ERU0S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24E110F7B0
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783077120; x=1814613120;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n91jN7XHyvMYuEX4cJ6cuYkAygf9kZW6cCNm26AKVHw=;
 b=kx3ERU0Sp9wZUpKkyDcyNj5HBH04xCeP6H0T6DVqrCG2d+nnHSOORAwy
 toNcuqYikAOAXfXXo8cp0vO+0OHN7bszmBveEJwdd95cLxtj6lqRWO7n8
 8M8HXouj898h6CAYqG80zHE+lxMjp6ikj4fCc2bKPfM5J2QWAPzd9LEhB
 5goEoZxZcIXWgmxVj6TTB2l0q/OUuDybTM4sQ8YUrj+M9frnz5/L/nn7t
 e4GCtzqgLWowZ48jH1dTwvHgNh83Vm9fxNpy2g09yHDW0+Gw8e56/DQ9H
 tiyLdzgEMtqBld/RE6JWKa5/4CccKdycmeGd4xh6AL78TBjhMRzdMbrA6 w==;
X-CSE-ConnectionGUID: sNK+fcyGSVqW9WpNGUhi5w==
X-CSE-MsgGUID: fQF5vY2eTyWPwTBlhu1OSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83696335"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83696335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 04:11:59 -0700
X-CSE-ConnectionGUID: rBbYtgj6S6KZpq6jAFN3YQ==
X-CSE-MsgGUID: 8aE8x4lAQ1uNtIhdM8w9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252032752"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 04:12:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 04:11:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 04:11:59 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 04:11:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lq+qi/Wh9igf0CcCKv66Vn9IPhkzN6dw5xvfhpVENPT1YUIh0fmf2l7xMHFpnmsYOOmsFYa7sKGS3N1N4yCw1LoefixuQa/LoSJa7C9kVkfmqQi1j6TFMBc36qM23YJGlDdRhXUg92/pbkRnt7y5qnOHG+zRHwz83VA7JUXFdM9LXlNvhiSW0YpVDtO4ISHQAKZ+kihyFacfsDiK+xjGgoXJsGmFoFvLIgcUH0JOrABOJz6wC+IP1fJVhq59DzDOR4B8yVUI5m5CwJy5zB/ZqUyv3YEbmRo9fHh8kWIFMlyRg/izLx1YxMGoeAZ0NT1QVWjvdzDtOq+hV5HpdW5z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8wesKB5qdGZd6E1kLF+HfwQCKh+NU9Rc73GMSkHU4A=;
 b=NtEpD+/lC0r/UnTtqyTzrUlURdkFupdi3OEZCsJML7x/PLNPVgs3ERxQzUxUHD5qnflTmlHc6gohQSBJueBr9F5yDPiVYlBBQOK+gkPHW2g5FEmMK9akzzz3Ws23kshMHE9EICm7xya+tgujTwGTCRYDjSvAVv0EB1ujWfPIBhK1HEOyfIgcHW8nvOP/P3a0sINlB1eG9OLTr7Ue2aQdwinoLZlYtmjRQAUyp2MIUPa4UgwOY5oV3kHbJf6waoIfgrCPWwgXDse6FHloPn8xTYZWJioIzemx+GRWBBir7ojlBuXvq7A74HMqBl1zmAK2ioEnkF4myxnmkG1Mf9NQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DSVPR11MB9717.namprd11.prod.outlook.com (2603:10b6:8:34c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 11:11:56 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 11:11:56 +0000
Date: Fri, 3 Jul 2026 13:11:52 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/13] drm/xe/guc: Prepare to print group KLVs
Message-ID: <akeY3ZO4ZEC1HCbt@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR10CA0101.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::30) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DSVPR11MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 451b1d28-0f1f-4b64-98e9-08ded8f3e4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|3023799007|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: Ba50UWnkldW5Lks//7wJhKpswY5qPDqNHOGOqZ0ZQGyT58sJzEzXFAkyIRURX77sxYEsV352eK1AgLPETVEJrwAdi98U5r7wGbrjvvTRZaBBbqznTJw+CA+QxqCJ44/DXMi7z/WaFOVlWRBa6EtNFCE95tZMTRBQSywGS40NLevVvjeWae7vC0hK+WUTEjqDunKUlu7rWgk10XXlj8cxgRhUwRq3Q7Ift7Cw60rASiAmbDkY7T/9i1BsacxxcgdHvfTN0ESG6vylSnRbjZ9bND9VUhWv/omynYySLGBwtJ50HGqxiPPpXsXL8Lz/O/rBaRjqfAa9Gj2rAeThquLcnJihBkaE1O9WUMT0EOFpFRK0nIJ9AUVJJcmBVaxRWXalWlY0FBUj9+cXRU7QapgeRkkwxiRxHD/ZGq4qbuEMDT0QsvLkgGYDStdT9k88hDccCIfCC5GOnO6nM/a+fApW0UDUGXf2M77F3AYepzDbYfZOHkN3rfq+eZCWhLIgLP/6W0Hc0qMgmOw7t1orG2nHvMlz7BrUxN/hbhmxQdr9oucdZ3b4d5P4vhbScAlT1i5n7CYTPwqgMkbLE33qSyd5nh+9Zq6go3NfpXWlid48c7BGjmpXYBBbGaXYZ8//YanskegMUJ0KopnH6sWTmhIZf4d1YhPHxrPfmFBGzH07KgU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkpMTlJyTXJSM082dHRvSG9uUkREZTB0NUVpMDkvNWJaV1VjZ0RZU3J2WjZi?=
 =?utf-8?B?OVE0Z0p4ellFVlZFZHp2OEhvL1RjbnJxaHZLczhnTmRCekZZdGVSYTFLM0E2?=
 =?utf-8?B?UWY1MjlVanp1aC9KZDlzVGJxalhEZ1RzenpLT1JYVmZ6SDBIYk5aWEY4VXFM?=
 =?utf-8?B?alo2Rm5jL2FFNHBYK3A4OG56Mkh6eW5TVjlXYThlZmVYR2p3QURTTGI3VExp?=
 =?utf-8?B?MC9IK2Z4ZkF5Z3B1OUl4YnJsZ0NYVDNYTG84dE1sK21nUHBscGNxM3F5RXMw?=
 =?utf-8?B?UHRhd0lKdVA3ODM5V1VoY01wUkJ5WExLMGNpYjVOT09ISy9lenh2azFBbW5X?=
 =?utf-8?B?Q1ZDS0xLa2xvTEt4Zk5aeWJPSkd0MWpERTZJak1rNjhIWVJ6VmVXYzQ1cEtq?=
 =?utf-8?B?UVE2djBTNTAvQjRMQzI2YUhXMC9mWDRIZ3pUM1VQbUw0dmRJcHIxNlBCY0ht?=
 =?utf-8?B?cHk1R3E1Y05kbFhxZU1VMFYwVVlXUDJaMkJ1UDVSWkpEanlaRS9EL3Q5amRS?=
 =?utf-8?B?dU5QRWZDWS9ack9kdjJkV281ZzRnYmRZM0ErdnF4Yzl3NDQwU1NkT3VZcHd5?=
 =?utf-8?B?NFpNQkJsZVFHaTZqTVl1WmRySm42UlN4TmczUC84bm9IdGx0anlqQ2IrcU0x?=
 =?utf-8?B?bHllc1REQWZoOWgvaElCRk9GdVpPc04zbm0xeC9oRTZaSWxzMTJoa0V1OXBW?=
 =?utf-8?B?MFcvcUtuSmpiVERFNzJSV2ZEMURHaFIzR2NwYzE5Z1NJWldncC9VSFEvQ3U4?=
 =?utf-8?B?RjRDQlFtMGlyNEFDdmZ0eG5TMUx4S1d5SHlJRHAyci9JUmtsSEE4bWVVaEZz?=
 =?utf-8?B?ZmY4Qm9ZOVNxNDJ2Zyt2NThpbks5MGtocHZIeEVVb0Izdk5EdUxxa1prVUUz?=
 =?utf-8?B?VjFBQWdZVGcrZEVwNldJOXh1bm9tdmZGWnliekpUTEhoQ0l4cmNCeEM2aFNm?=
 =?utf-8?B?OXVMNjgvbWhQZVpIQU42c1RlNnlvSVFHeXF0d3QrSEZTWVZncnh1QTE5dGNn?=
 =?utf-8?B?SUJ4b3BqbGVEUlkwRXpJS1BnNDg3QTNqZTQ5KzNjTnR5cWY5ZDVXeWV1Vmts?=
 =?utf-8?B?RmhVb2NBYzQwMFlhbC9NQjNvZkcyaTBMMDZ4dHk1Q0thNVJiUW5YQTlHNnF5?=
 =?utf-8?B?cnhhb0lXMEhpQ3J5ZWlYVEtLY2F0QkVYcnBQTmppclU5RklhK1NlUkRFSEdT?=
 =?utf-8?B?enBZQy9lL1F6am81T3ZRRUYvYlYyeVJWak9qckF5NUdXa0c2NDZyNUJWbXNI?=
 =?utf-8?B?dGplWk02Vkl1dkg2OEJWR20vNkRRQVR2R25Ta2huZ0NxczBZOWhZQmRrdGFD?=
 =?utf-8?B?WUpzT2NBbXdrV3h1UVA2NS82NjEvQjQwTnhRazZDOTJjRnRJakl4V2R0d3I3?=
 =?utf-8?B?ZkhMR2x0eSsveTV3T3hVaDlMU1d2YVJweCtPcHRnY3I1YnQ2bEZMSHptMEZu?=
 =?utf-8?B?MXlmR1IxK2pjYTZVWEN6U1hFQlJobUdpQmF0QnRQVHdtZmg5ZzRRT1g4TXBG?=
 =?utf-8?B?cjQ2aUREVnd1Y0x4b25qZXlxUWxWcjlETE1hYVpmR3paUDVHN0QwYmt0TlZy?=
 =?utf-8?B?cVJ0d2Z5TC9IU1hiR2hoMEFRclZ4NHVyT1JnTm8wcko1aGRFWHY4MTYvVFcv?=
 =?utf-8?B?Q28zZ2xxeFZ0SGplSGVWRkNQcEdCRkdnRk5CV0lSMTVEallyMlZWRUxvZW56?=
 =?utf-8?B?NVBaa0phT0VuN1dzcjg2eHRwa0FBSkU1SDdoeEhKYllWd3ZVRElTTmtuY3Zl?=
 =?utf-8?B?UVgrckRLQ2ljbUFXQk9BdWZkMTlGWnQvUW5zcCt2WUlMUUs2YjdhYnB1ODkv?=
 =?utf-8?B?Z3VPZnBsSG02aVhLVXZSVHQyRjFXbm9NL0pqd25YL1lKWkcxVzc5RmhIRFJC?=
 =?utf-8?B?TDRiVHczSmcwOURFZWRmTUJkdzc4R0tnbVdSdC9DRW8zWk9CQ29TVFl2QkFG?=
 =?utf-8?B?UXUvVW9zNjd4Zmw2UVRNUHRmZlJrMzYrOGo5U1BlN0VLbEVMK0tOZW9BT1E0?=
 =?utf-8?B?d2NkTTJSNjZLRU03a3g1Q2N6aW5hR3lwbHd4bEI0bE12VVRNL2VwQnZlV1Ir?=
 =?utf-8?B?Z3BvRUQvbW9PNU9uTk9UaXVFZWVOeWdEQ05raEMyZmt1a2pLTEl2Z0NVSVRl?=
 =?utf-8?B?QWtOSnZpbjN0ZjhmVTRoN2F4ZlluY2dPSmxndHlvWCt5aU5FbXk0Kys1Ylh3?=
 =?utf-8?B?SGFDU1ZNSnFOaVh1aFFlK3U5ZjdRQWd4WXovQUhJY0xRaVlYd01JR2RMaTYv?=
 =?utf-8?B?YnhFZEFJKzR6TXFjRjJqd3U4d2p1L3NCTW1WencwUGtPaEx1ZEFKa2psdlFm?=
 =?utf-8?B?MjFmejV6ejFEWHZHdDcvQ0FVUWpNaGRZQ05wcXNkMVJqUG1RRW5UNytqSHgx?=
 =?utf-8?Q?3PcSVHlNXU6TlIIE=3D?=
X-Exchange-RoutingPolicyChecked: KWNt+x5N6AyRmtU+GwHeO7J8vrQCNlaWUe4ROHuapVafxKu78nG6otXUunuk0WVTFpX8TlSozDyipGjKfREHTAO4rmCQ3OGlZuSASSDCqcWkaV4oak/ZmsHiZywV76P1KWum9hg1ScUOs57m2YyUP27o4voQ6udoKl+GnIqrhQo9W+L137WKQU5dogHoXsBEGlKr4ipDCE30vGm7lRP3ZClKCwb9Jg5GLHfO3d8+v1lrwIs9FphsoO2qZN7SeBQpGdF2h84CU3Fp6IcPN6+p75/AuZiCnjVdKJk8a/Vq8W8D4ZzbaW79uyODlvLTKSwYHvL+GstmRQ2yoCVLWEjemg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 451b1d28-0f1f-4b64-98e9-08ded8f3e4c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:11:56.1486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhotsd/5DT+iHfY9ptBhEO5HmYWcDNs5N7TrYw5G7D3j0gFfwqHaDWb5ZDP31TppiQapakNAiNnjaEHK9V0gpAEza944Zqoq5W2NyuXkwf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9717
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

On Tue, Jun 30, 2026 at 03:26:21PM +0200, Michal Wajdeczko wrote:
> Some future KLVs will be encoded as a group of nested KLVs. Prepare
> our KLV printer function to handle such KLVs. List of known group
> keys will be updated later, for now just prepare it for testing.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
