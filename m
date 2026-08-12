Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0872EC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 08:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BACE10E3E7;
	Wed, 12 Aug 2026 08:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWuMv7R+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F1410EEBC
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786523116; x=1818059116;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WFQt5++LY4WHFaRkISgeRTKoI1mHnUfyLgvs0F6fKB4=;
 b=dWuMv7R+UoMWwscmVtjnHreWR608GVjXgf5DVPjRyJa1PI8PuyqaTT4s
 tCJD7O7Co9XsgVjt/OIWYaGZFkryUJkq8QFz0W1ApolistHBuXTV/UMgb
 1xBhReaSYOh31ArxexPVS1ZvjPNmLhOIz6C92ADIp+DYnj40kNpr/+/Wn
 jZEloHFysOQ4OZcPPa7oHFKBdtl2HmAQxTikp1if9csmtSwpj86+UDA7W
 ZJ9jKaiqm2+6bk/tLETUKQxTSlvPvXUOnSJYQ5/jWamOUEzOqasq6rx7t
 9PDudPFWQqsx4ba1OwJ9f5u5F4jSMWk987HlJc1nGefa05CCQXNayQkoa Q==;
X-CSE-ConnectionGUID: tT8nCIaoQ9+1CT1lx/19Ww==
X-CSE-MsgGUID: W+ZJvsEKSlGfFkpW2SGWQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86188573"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86188573"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 01:25:13 -0700
X-CSE-ConnectionGUID: mA78k2xnTVSkS42jtWg1ng==
X-CSE-MsgGUID: +OyzL5GJRdW6f5DOakW9/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="301825408"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 01:25:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 01:25:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 01:25:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 01:25:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/E9HOupaqZGopJpfG6e9ioSkgHb+FMdoOIheK2vpVoBX7WkNhPhxMZ6NgA0IDZlkxh8iKm78gj4dR7e2u5vFywaeltOAzhiCB2mNNbJROK5gAHTDdDKM7txQ2yD4pB3YWBQ6ghyW8AXGhKwc6CvflVx6vyxyepepF4pfAbC1Ki+O2sM8fe/7NHu9LR3vh+hs8POtuqx6+onXzHjop+HLelpST80cJRgTo/d2HTCZCVMOF2m+i/9SMvbQMDE8sXJXTUw6pvVseawKGxbSGVnz7gmIaifqRJGi2BmgyvJf3hskR7+jK5rWyfxvJfyTL1cen53/lkhaTluqKbwpEykPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1K9992SYkgMRluqV4yQvgfbcFSzFPYAy2gm5SGvhGHE=;
 b=Xhj9nMPz3fWJsr8yLC9zlt2WDhU52wbE0vY4qlOKBFLYKjixDs9ZZUO2mavVM4xuHmJeS+V1hrxAHKl7l39ss9P9dZfJyl3KOuI4a0OW+AJbqSucOv7IomVM+OVPcK61YDMw4VB/AAs/tGVRaVEKZu5fSA9868NccYOTnXdf7NTXEkfU/dBfMPDWaCp0aFMLWTy28yj1+jlV3jV7N3YJkFrgJVg/XFpfk1/M7dKJtiPy18fWS1FJKJyolMJRDvrEvxPXFy5g96SwLE7APZFJKlA7ejN09l5Q/1NGRtUq4iUEUz1JB1PPYGx+ryMWZWT/9RdaG8/r+3kI/c1YnzAKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 08:25:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 08:25:04 +0000
Message-ID: <14bfeeb6-5762-4870-9cae-be827ec26129@intel.com>
Date: Wed, 12 Aug 2026 10:24:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] drm/xe/log: Add hardware error signatures
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: Yoni Levitt <yoni.levitt@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-11-michal.wajdeczko@intel.com>
 <9e60e8e5-3942-4537-bb10-ac5a3bc72c69@intel.com>
 <d9b9afb1-7e39-4ad0-9e8a-ad6888238ab6@intel.com>
 <1bce5332-0341-4ecc-839d-bd36df33dff7@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <1bce5332-0341-4ecc-839d-bd36df33dff7@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B92.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63a) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffe16da-fda9-4d7d-860a-08def84b35e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: maoE0Y3IoVEg65dxdqWYWXFQXs8AOwyc+7VOQkVmkGyK/SqUvDGSqgIw2kgdWRxsU1gc+NvylPO2wkJFhr1rrjzAZH5O4asxnS4pFgM54A6uoFPw8gGyxij+6TjNwGW5GuCkN1B9YKV115zKCYjRczTCAX2RXxc1zptEe8khav2EjX1e/obVNimaVopQMVARYI4ohtt3tzNfZcjiSADXeHPtGlXPIDfxtIO3TNfS11zlsnTmscQO9vhJNh6cX1Y7V8B2vYzLlPDYgqYevR2YdLc0z0KS21tSv4DJKtIuIPufNi77u28plPDClpgxXKZr5iNR430CN4M59qVpOXVEJwU71+c3g92B+xUAup7eAmGSmzmfOtcUglpFBg+NozCICbH4r9u7YhLcuYOJZYjX3VHJig08UbZPlRHZXPPUDXZWYR2rZg5JgujKSsOaDliwrcKSeXiPlEnX47m9JCIQmrP8a9C/yIAmla/1R9QduQOGJQ5FdZKTJ31CGNjlYlRygxxAGol50nRdf6Au8VKPsB0MdExAF+y2RKS8OaGvBRPNrdVV1iMaXBoCvMZTsxnd08cEObzLLKYkPNUaDJ60C2p6s235kQZJGP8OsSH8qoxn1muKosxMnCtRhC5PdQas6k+kkWERo+0o1c2BHAkKiCLNpfoi+kKqFBXSxCe3aUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkxXVUVycTFQN2QwT3Z4enBicWhpbXV1dGc5dXB4cmFmRjlRM0xsQWdLTSto?=
 =?utf-8?B?MGl3ZDBCZUp4bnNJYWVLY3ZLcGNQTkd3akNQZzJYemtsR0RvKzBkMlROYjFX?=
 =?utf-8?B?UFpONmxEZjBINndBZEI5TFFpaGtaNTR2aFo5anhWY1hjekdIZXc2WE9hcDc3?=
 =?utf-8?B?Y1dNQ0UyZUczTFhYbE13aDUwQUZNZVdHeDJXeGFiMmdXQlJMTmdTeEdYbFl5?=
 =?utf-8?B?VWVMdWZDdDVia0R3eWxTUnRBRFJtTDc0Z1ovMURiTWkwWVZNc25IT3U5cDNU?=
 =?utf-8?B?Z2p0K0NmRktSbDU5eWgycm14T1NJVEl0R1NuOXdMMEgxNE51OS9QQW15Tm5z?=
 =?utf-8?B?WWU1TnZJaEVrMXljR2M4dVlZaE5oK1dMTWNvTCtESm5RODU1WDM3bnQ5Tnly?=
 =?utf-8?B?RlFtT3Qwc0dOWjRSMVh5SjV6MG11ZlFhdGw4U051ZEVJaDhkb0dEOFNzaCtT?=
 =?utf-8?B?OUZnd0xSYyt0dG4yRWxVaGtlYVFweWRKMndlT0pmb2NKWHlWUUtDWm5WeStk?=
 =?utf-8?B?RnkwQloxTDc1dnZ5bTBrUFU4aEFiWmhMQUpadVhXOE5veUdnQ1VoWWpXV2FC?=
 =?utf-8?B?OUh1c1d2OGVvdm9hMFhHeXEvQTRGNGNzUSt3OUdEWEdCNU9Eck5XMFo2MTBm?=
 =?utf-8?B?V0JHK3VKQjV0MU95TjJTam50MCt0TGRwV2lxZHY5TU9qMmFVSzdzMnAyQzNQ?=
 =?utf-8?B?Q0x6cEh2ZGpQdlVYWVN4OXZndFgvd1hjeVFZMlEyOTA4RytsdzYzcWF6QW9M?=
 =?utf-8?B?SVU3TWlDamhRTE9iU3hIL2VjT0lQNlh1Y1R0MXNlR0hyR09kV0YrT0htSUtL?=
 =?utf-8?B?cFhVZkl5N1ppdm5mR25PWGo5UktuZldpaDlOcTJXY1NBNDR4TmxIUUtydndo?=
 =?utf-8?B?S1AvWXNVUXVXZ0NjRlUwLzNxTkxvZnR0bjRPNHovdG03NWJ1UmZ5K0VodVdm?=
 =?utf-8?B?S3N3RWIxZVlaY2dGK0xxWi9IQndsMGl4akpEanArSHFNblRxWHV0ejRoUUwz?=
 =?utf-8?B?bExDUGlxOHFUOHBGekRSUHU3VFBEM3ZEMWo3TjA0RGhnYUZRTkhhZFRaSi9C?=
 =?utf-8?B?NHFTMGR1bWVqekRyc005RWFIWEgxaXdZeXRvcXF4Zm1BMjhHYjRocEV3ZVZC?=
 =?utf-8?B?L0lmMkNhd093MVBGeGRXWUwzZHo4THBWb0lwY0hjNWdIYTd1L0V6MGRWQzB5?=
 =?utf-8?B?U1RrUnB0U3R6VEVlTU9yRHp2eTBLN2hZWU9oR1NiS2JMQzd1cnZKT1ZiUi8y?=
 =?utf-8?B?VEJteDVzU3lIeXBOZUhlSGNydWNaYW04bWwvU3hjMnl5SldYWWJKTVAwcXRZ?=
 =?utf-8?B?Qzh1ZGQyL1BIZ3piRHRudk91T2QyV3YxNE1BMStwdWFCTXpkYXNqQ3RqUG5h?=
 =?utf-8?B?QWx5aTFDZVNpMWo0N0F4TFRvWURQK3J1aE5reC9ickRMMExCeHhCaFZOME1P?=
 =?utf-8?B?YmJCclpYM2tUK1lsY2FKVmVPMkFEajJpaFV3ait5SVhmWFhTWU9UaTlkSFRN?=
 =?utf-8?B?d3BxaXdnblN4T0s5L1FPb2JwNzIySkNmbjVFYS9JcG91cnp2Vk5DZ3pTU3lj?=
 =?utf-8?B?VVdEejZIb094TFFMeXB0VmVCMzl4eXYrVDJpeGJ0NjQ0WEozQldJVExrMVN0?=
 =?utf-8?B?MTdsQUlGTnZ2ak0xMHMzQjJOdDE0ODBMOGE0QUtUWHRuUThmWlJVaXNrUEF5?=
 =?utf-8?B?RXd4KzlkVmpGNmZ6OS9WU0c0aE9TYW0wR0UyZ1MwV0N0UW51bWc3MVJjTThj?=
 =?utf-8?B?aTBIY1ZBcGF1RHZFY2RVTjJSSWYvU1kzWHJjVkxYVTRRZERVRFQveU0yaVEy?=
 =?utf-8?B?eW5KT0JudDdveHNmS0g2bjRWV29OWktjVTVkMGpJRU1EVHZpTW5oUmo0UUU3?=
 =?utf-8?B?S1VGSDZqejVIWWFZU01jWVovTmYvNXpOTHdwbElKUjYvUlFsVmVNQnZ1Rnlx?=
 =?utf-8?B?aDFnUy8ydWhtclZ3NXM4SG85RG5sR1pDUS9QbkxWbG9qQkFpdHRDdjFoVEt5?=
 =?utf-8?B?YUh4amlwVEV5MGYxZGFFQWorVlQyUnliQVZvdXU2UUwrQkhUR0xFemhmc2hp?=
 =?utf-8?B?ekUxWnFIZFN0U2FoMm1LRDdGZTZXQVNKSm1HMGttZEV3WElJdThPNUZ0eldt?=
 =?utf-8?B?cEdrU1RIWm0xTDRPaGRPMUl6S21HMk1MdGptaFd6MExNbEpRcXhGNmd4V2cv?=
 =?utf-8?B?ZDBqUTB1ZlRmVTF6cUhJS2IwMUhsZnR6SE1qci9zc3I3L2FieDd4L0RFOWFu?=
 =?utf-8?B?T25WK3orK0M2OUhEMTYyZE9hRzJEQmNuaHBYajhjTXRWSWUybDUzemo4MHpR?=
 =?utf-8?B?bFdDTzRJWnoxVnRBZ0RqeEN1S1V4a0E5QklsN2VFMWJvd3BSTFZQVk9TajFD?=
 =?utf-8?Q?/ShLBu1qH4kGFHm0=3D?=
X-Exchange-RoutingPolicyChecked: C2mCmUSh6Bu/3roo7nCK87MnOXr5kRuIetffyCYBORbc0N/JwCnkfOUEHOpWAJpGx/Z5gazobudodA8wDa8+wN8lcD7ciXhjsgWZQiPmaYxXjIiDHjbijd4LG4aatarvxYHXGXfg+2Rqn9wEnGq4NevJF6TnDTkwwZaIkjW96jggT9JCjNx0e3tQbm7jaIrxwyVllfxymOEzdJsjlCfjjcgrhLwISD0R5rKCfPM7SUAcWXkspcN6arlff6Z/MhCqbMcVbYyThqQ+sJ1xOJfm+T7oAl/vqY+1ofOgTdnc60YFiUg+H7oFUyFht2snjWh8VSsWJ+QBYBIVvd/RgStWFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffe16da-fda9-4d7d-860a-08def84b35e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 08:25:04.6420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wpd+K0rzpCnhElVqPFy+pvp/odWmI45QBulJWnyCZARIIlL3Hr5IkOxTqOx8j1M+nm1ia7plLjxKVY7WNzvlMj0DjCNrf+E7W73JhXP4+aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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



On 8/12/2026 9:00 AM, Tauro, Riana wrote:
> 
> On 04-08-2026 21:26, Michal Wajdeczko wrote:
>>
>> On 7/31/2026 1:41 PM, Mallesh, Koujalagi wrote:
>>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>>> Extend our error signatures definitions xe_sigid to cover also
>>>> hardware-originated errors and make them distinguishable from
>>>> initially defined software-initiated errors.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>>>> ---
>>>> v2: update comment (Sashiko)
>>>> ---
>>>>    drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 16 ++++++++++++++--
>>>>    1 file changed, 14 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>> index 99717fdf74a6..69cce4b45635 100644
>>>> --- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>> @@ -159,14 +159,19 @@
>>>>     * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>>>>     * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>>>>     * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
>>>> + * @XE_SIGID_HW: Generic hardware failure.
>>>> + * @XE_SIGID_PCIE: PCIe interface errors.
>>>> + * @XE_SIGID_DEVICE_MEMORY: Device memory errors
>>> Add . @ end
>>>> + * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
>>>> + * @XE_SIGID_FABRIC: Fabric errors.
>>>> + * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
>>>>     *
>>>>     * The situations the driver detects and reports in software. Values are
>>>>     * numbered sequentially, are only ever appended, and are never renumbered or
>>>>     * reused. The tag in brackets is the default resolution bucket (see the `Xe
>>>>     * Error Signatures (SIGID)`_ section).
>>>>     *
>>>> - * Firmware- and hardware-originated signatures are not listed here; they are
>>>> - * logged as reported by those layers.
>>>> + * Firmware- and hardware-originated signatures are numbered separately.
>>>>     */
>>>>    enum xe_sigid {
>>>>        XE_SIGID_SW            = INTEL_SIGID_GPU_XE_SOFTWARE_START,
>>>> @@ -178,6 +183,13 @@ enum xe_sigid {
>>>>        XE_SIGID_GT_TDR            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>>>>        XE_SIGID_MEM_FAULT        = INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>>>>        XE_SIGID_IO_BUS            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
>>>> +
>>>> +    XE_SIGID_HW            = INTEL_SIGID_GPU_XE_HARDWARE_START,
>>>> +    XE_SIGID_PCIE            = INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
>>>> +    XE_SIGID_DEVICE_MEMORY        = INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
>>>> +    XE_SIGID_CORE_COMPUTE        = INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
>>>> +    XE_SIGID_FABRIC            = INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
>>>> +    XE_SIGID_SOC_INTERNAL        = INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
> 
> Nit: Maybe retain the same order as firmware

do you mean the same order as in XE_LOG_LOCATION and XE_RAS_COMP?
but there is a gap (no 3) and currently we say SIGIDs are numbered
sequentially and only appended ...

> 
>>> Since we've resolution bucket for SW sigid so do we need resolution bucket for HW sigid as well? If so how are we going to put HW sigid to resolution bucket?
> 
> We shouldn't be having resolution buckets here. This is just the high level class.
> For ex: Soc internal has multiple recoveries. I think the decision in 02/23 was drop resolution buckets.

that's correct, in v4 there will be no [resolution backet] for any SIGID

> 
> Thanks
> Riana
> 
>> there was discussion about this already [1]
>>
>> and I guess we can add [COLLECT] here as an overall recommendation for all HW SIGIDs,
>> as likely all such errors will sooner or later be reported as separate SW incidents with its own resolutions
>> and official documentation will have more detailed recommendations (out of our scope here)
>>
>> [1] https://patchwork.freedesktop.org/patch/742246/?series=171022&rev=1#comment_1368419
>>
>>> Thanks,
>>>
>>> -/Mallesh
>>>
>>>>    };
>>>>      #endif

