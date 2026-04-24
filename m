Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DBAFB44C4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 07:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAEA10F32E;
	Fri, 24 Apr 2026 07:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjTegjsX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B9710E0B0
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777015640; x=1808551640;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jyfiZhZpzISTsxqmaDA+IYugAYRX7zqSllpyHibHAAQ=;
 b=FjTegjsXKq6PHch3Pa4p1eQn/Kjo2H/BRwhuHktiFK9pKsRgKwY4npTC
 RZ/tfpBYSPZqjmTQJkm6CNmdlDmHql3kt3ooBgbxzV71x38aeQPhp0C5Y
 RRAL3hadAtSKFE3TbDAw2iRUl9VuTu5dT1g5wEUKZPQ1U5bEUA5hZeUNd
 Tb+Trt+YWqDPdgxxHuBT6qBhZCz2OQS184sYHqX3o90Cvd9jd0kPeM3OR
 llZ5uzh9kBF0KGo6xCA1PbzANFQhRvNGvqZ9ar/akTOME20DW+20W8Jq9
 hRegPUiP7sTNQ9SjcwQf9boMozeRa22BYcTXV8Jn2zurdurRC5sUcaKLa A==;
X-CSE-ConnectionGUID: OIoZcElzRGqLNk5db1ED1g==
X-CSE-MsgGUID: HSvVjl2WQGu4pSiDOWReBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77158681"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77158681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 00:27:19 -0700
X-CSE-ConnectionGUID: mX7DYeATT8Wz6tFmhhzTfQ==
X-CSE-MsgGUID: tMJ1WqvvSCqwnxzeim8VXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="232792861"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 00:27:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 00:27:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 00:27:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 00:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hd6SPR2u0ZWheUkY5hh0H0JvdHurTqfOuHUZl2xp7JcxTNaYF+UJknBgzAlCFAiH2UGqH4ottMfYe7SRpjS7b4v61nOyiN1LfWZAQC3CTAzRQlSMnCVSL8yRrk3yobYutQznU4vd13r7GCRJRap5sDbOrMMhdstM/EVTYj6HzwXFBikoBOH9D/uNGLFpjTV27Q7w6TYCInYVFkYePI7XzLvFhGs4AFlUiHBGJuh2OhtgZxxsmDjq/a63Au7vYGlUxfYId2phonmXG/Wnl+9zxWf7/s9bGwBym8pV7l10Mo8Y1bYxAiivP0+A1la+peEF4VnGznx7niETcPRbZixBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjdYTXPzxI5NDmiYqSz+/yyiLshiM6gcdoQCIF2r6fI=;
 b=K9ZBm1Xpm5dR8KGNc+yldWPD4OWSOBrV4+OWL5Hd1d67duUU0Lir2BTXLr/+d6a0/FejgtKe3O0+d6Eh1gT+W/oNJM+hN5Hl33fZAS4qoldd5imetyXErn9mo5sZ3k5ejBasSf5N2JJYmsAHMukC+ez0yxtmnmGgq/rF+UokPvZNem4UcObnDB1l7vAxCTco0jBIqxmaWw4VSMguPBrd0m8K0RNJh2DX/Hw0b3bQ3YyojKDW62QX3+gZ6dvtEJKmJOih0GyMuoVtTlU7vkjHk4VR6Svq7F/onMj966XRugbIJrkj+L33pvn39hFszj4D1nTAOczvSTWca7lh4cKeBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB9208.namprd11.prod.outlook.com (2603:10b6:208:57c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 07:27:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9846.019; Fri, 24 Apr 2026
 07:27:13 +0000
Message-ID: <cd275082-37ba-4ba6-906f-1ce7fd0caf48@intel.com>
Date: Fri, 24 Apr 2026 09:27:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] drm/xe: Const-ify parameters to xe_device_has_*
 functions
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
 <20260423-engine-setup-v1-6-baa94014e3e5@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260423-engine-setup-v1-6-baa94014e3e5@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0202.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d13bebb-9921-4d9a-3523-08dea1d2e76b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: rEE715uIhl04V7TbYi4WtYGWG09B3qf6akWwgbBuCR83ra8tggtmcTOcJBGbNVJQTFhO7b1vkGjttIU9BiSOfLEIz/RwtN+q2ZxAf7VtzasgGNaYJx5XL7LAlWc4z3r3OPMAi8NPi6n7TS+yqJKgm/Hlvcnh3OmVYmiotMbdjAvj0JkhqcIAOkHyDaoDbbRhHB1th7rqKtcXrx66V3BKo+NivRFMFGKjf8Jut5JezHNVwxfXWv5OK0RzVDG7m4ayNxkyT+5HQShumVqNxDon73QKbmMJsT3/iKORVvXPGRRQpXUJTCWDKiOcQTWL3nEVbvOvaKCuw/BBgtJ12GvX/eU5U7HWjs8HaSfXXtHTnrUFKX3pNVTev1alB0fdcurDf27yzzhacvDxTbq5F+uQ9xC9XkiYT/4cOpUmaP5pRs9FYW3ADm6d6cU+VJj0yJSh1ohYu5GPJFfelYZD9+rNe4U+rtsgBWdUPDs1MwMZgHn97b+oGIc5ac70Kh44mvcTgwpcHuxi82THPxmGX8qd+a2AfcPzFk7eyU5BTH5LvUXsxY+i+oDM4/YwSQtzCRaVkiDP9l/y/zFzYtl3frrj8e2lBJN7CSFIUe2QcN8iM4uIxGDUVYPEYYHQemVQUkB0i7rhXzZkg0RwpL0c8BF3ShjK/NQHBBLP9pZbVoNQfXg0k7PE5UZ8FmmXjt+4BQkrQIDXkBI/KoY+sLtAwIUqDfL0wNcjupAOTg9WMatN+PE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0pXV1NtdEYwK3ZhV3JOUE4xdDR5Tkhod2ViaUtnK0oycUd2ejFBRVUvdlA2?=
 =?utf-8?B?cVIrY1ltY3A0SkYvcFpCV0xGclBodHUzK1lYcjYyejFWbWVQa2g2NHV2SzF5?=
 =?utf-8?B?VHE1bllMY3NVVHFyQnhEVm1mLzFJME9sYXZMZFlncFdVSWxCWE9VSkF6OCs4?=
 =?utf-8?B?cnFpdW8wZnFhNEtTTFk2UmxQdFZMWHNwTEtYSlFiWjM2c3NZbmtxQmNUa3VQ?=
 =?utf-8?B?aDVSWVhCOEV1TUJHNVdjQ3BMSzRxTTlFdU5VbHBXRHgyZDZzS1pCL3Q2YnNo?=
 =?utf-8?B?aTVXUnE1L0hyb2ZnNFNGQ2hSOVlLNkYxK1VBcHFoWGtUeTBHVGNXRktoS05n?=
 =?utf-8?B?eVdDOTJ6N1ppVmNuQzJQeFc3YWh5alpWZk9GQWtDbmRCeG93TFltTmZQbyt5?=
 =?utf-8?B?eGtVQVU5MG0wQXJRajBjMnh5Y0N3MDN2aHRBOUtuWkNtUkp6aTJybEd0cmM0?=
 =?utf-8?B?a3VBOVR2c0ZpMGtZaURQTm9ESUtNaktsdmlDb0JlVnkvLzZ4eXlUdGluWk9k?=
 =?utf-8?B?T0pFMDZwNkV1ZWxON080KzF3ZERVMWwzNEpRdVVIQW9LeUR4N1VEamx1RkFw?=
 =?utf-8?B?UmtaeVFzK3RGblIwYWx0RVVWVUlxd1Y0dndDZVdJQWhNTGJucXBpUEdYTWU5?=
 =?utf-8?B?OStmM00rKzZpNXc2N05SMW9RekJBVU9GMkppeFVGWm90aXUzclFoYjdibEdp?=
 =?utf-8?B?ZEp6NUU3WkVnVlgvTmpJeEpFbWZ1NDhMN2RLSlJCQnVsbmc0NHdxM2djNG9J?=
 =?utf-8?B?WEVhQnd4aFd2c0tBTERISnZ5eUxoYm9qbUJrdXFCZW1uci8rTldTTXFPUjgy?=
 =?utf-8?B?WVcyNGF1UUpqZ0hYUS9OQW00WldUcVdBTGxnZlQ4QStBNnVBeVEyc3BiemJl?=
 =?utf-8?B?QU45M29iUDh0M0wzblpBUUtXenU3UEhVQjdQN1VzZ0l2OTQzTGFNcitnK1ZP?=
 =?utf-8?B?YU9xNjZrbXJJMFl5WmpWdkZuNnBWd0JXbFVqWklqK0phc2NDdkNibmhyb3pk?=
 =?utf-8?B?aXptOTZrdzM1c0d3QVhHcjFnc0FKL0FjUnJpUGpHZEV5ejJxenplblpydFBG?=
 =?utf-8?B?Ym5ESmVYcUpHL2MwdE5WTDdWN2ZSc1k2KzBEVHpNOUVoWTN2WjgxUjdjRkZN?=
 =?utf-8?B?SVBtRmRGTldQRFNvRk1NaGR6dzMrTE04VU45RE5PRDhmR0w1VlhyMksvem0v?=
 =?utf-8?B?TzVWNE5Pb2lnc2VzcnhCakJDOWZYZnYrU3ZjU0JMbFNiTHZWdHV3cUxIT1pm?=
 =?utf-8?B?SXZGbUxJRTRPODlqZVdhbUpGU0lsNHlGRG4vQmd3WkxtT3V5ckY5TmFSY1lm?=
 =?utf-8?B?NS9XS2t6SExpTGM2VDdBNHNKeXB6NkloV2tQSkg0OWQvazVEdE8rMldKTXpn?=
 =?utf-8?B?RCtiaW53N2wrNldnUE0zTUlqSmljK21RclRpdTNqUG9kdFZVL0V1K25MZS9y?=
 =?utf-8?B?RWZDcFRXREZ4VmlRUjlTdHc3YW1pcWltN1FFM012bFpHSkNYWVh0di9SNFZI?=
 =?utf-8?B?MU54K3BYNUg4bTlGellXRGlnU0VkV3lFMEdoM1p5SkZJQWdTSWYyZE5mS1lH?=
 =?utf-8?B?elROUk4zZFhpdWY4dGN1emx6aC8xMjJEcGtBVEpNb1FxdEVRaHU4Qm1ueDRu?=
 =?utf-8?B?UVNRaEZRQ0l2OWZmdS9ja1I5MDBIc2RPUU1GOTVCSFBxQmNXT0hZbkRtWU54?=
 =?utf-8?B?bE5Jb2FYZUtUN0hvd05HNnlWSUN3ZVdrM1MyNU9qVmpUUXd2V1JFRktoMTVR?=
 =?utf-8?B?UGxNUXFvYlduTFBKbUJURWIybDlOR3o4TDVZUUtudzZKelhkZjJRZzljc2hV?=
 =?utf-8?B?SVNyZkxXZ3BOWkdhaUZjcjhmS3pIS2NucEpNYmlyTjlLeWZMdXlUVXdQSGZI?=
 =?utf-8?B?ajRubzIyQjZEQW10RkgzU2RBRDVZcUNLbEY0U1NLZWI1OXExeFhjcWFnMWJE?=
 =?utf-8?B?NkpkNGp0dUdVT21EOVRZSVJybGl2RTQzTk5EUERUaURSV0U1d05TZFd6SWh2?=
 =?utf-8?B?c0RIcmQ4bWNuTlozMTc1WVpZLzhIN3lqclY3TjJwNW5pcUpTNjVnZnFZc2pC?=
 =?utf-8?B?ekNIeStkVmJiTThNMkRvNkZTL2NUY2tIcTVuZTN6dFpIQWZzb0o1aHhMTlIx?=
 =?utf-8?B?WUJKaW5rYng0M3U3cEZiYmF4RE1rcUxBZmFnRi9TOTh5ank0dG50VW8wVWhQ?=
 =?utf-8?B?ZEZleE83c0diYmI3YjRrM3hnUmIyYXRFK0xVdFRYeWZwcnlwZnROMVhRU2xl?=
 =?utf-8?B?UXg1dncxd01uc1lnaXJwcVpBbjZscEJoVDYydWFxWklUL2Y0VUNmYUduUGlt?=
 =?utf-8?B?NmluczQ5U081T3pwc0d1N3o0YmREYlQ4WmN0TlZSZ0d4aEs3azJJWHhnTkht?=
 =?utf-8?Q?CUuO+dSpjxNmeNlc=3D?=
X-Exchange-RoutingPolicyChecked: BeKt0Jq/5MmL4/vZC0nXMgWTHSLuU7XKIP5mgWVDQIP6WNtlqEFRjMtAnEO9zTA6yM850foLLQsE087yIJUIekq23rmh/9Cj0uf2oG9lEUGr4EUaWjsyZui87HkPm1dQL9fFcZFK7etibOdr5+v2weXj3waa34VbKquCxAX4kTZiY1KDVb1U/WwDnzjz76J0XUEmCyKK48lR/xjjj2FlinBNSa+CUSVHRORDJsflpOp08ECdVogN4ykzt7g8f3RAzXvymD0P9Siu2zWYdsPpeq/ALBG6Ry78RXYjx7Kqq7F/JCoWoPR/0TbObLzL0oIE3D2fMPsl3L0Tg3p7j6yshw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d13bebb-9921-4d9a-3523-08dea1d2e76b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 07:27:13.3479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JFUkn/Wki0qJWU7AOzsJGzy38Kw9mEOmvdQdjIuwEtT/BYI81AW2cNnyTfyLrGF3f2g7TKCVbOWEM+YKGhDa4ct0qj3/jxQdT9k1T3k4YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9208
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



On 4/24/2026 12:48 AM, Matt Roper wrote:
> None of these functions modify the Xe device parameter, and marking it
> as const will avoid warnings when the callsite wants to pass a const
> pointer.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

