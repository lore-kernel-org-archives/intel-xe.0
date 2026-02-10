Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A161EB2700
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 22:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F2B10E071;
	Tue, 10 Feb 2026 22:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXB+Pwur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BD610E071
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 22:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770762901; x=1802298901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MklpYZ/DVe2C11zZiYm5UzsKcaS5VQzUDd/mca68dyw=;
 b=UXB+Pwurz30Pf7bfhMLpZeb+ljJbn1bOQPQLHlK6eJBSNeg5VadX8FPy
 /4NW6hpaThV3P1XTGpmnQFaen9AFIXwsXAxxFsppfMu4MD8Lj5KAKKYi7
 dIwA26713unS/S6zcmSu2LIb2OKrHBq/mnasToavpqUzwopw+Uq+O93qm
 OtTqa2gF/F9LIaiEov8G1LWhagN9jJIIUg5nsw2rgEgCgqETUDnnfbGLP
 DXoS6n1l8wnkzF17sVeBs/mJGjCPDTc4iUHmdAi9mG/FMecStPA5RnUpT
 7mQPuQuuailugWDZW6Hd+kcuCGzpMoGVsGBxKN66sAppi06tygWKJnB/K w==;
X-CSE-ConnectionGUID: R4HiH4X3ToC5xFUz7Mb+QQ==
X-CSE-MsgGUID: /vOPC9SWR2CpV44NyA1fUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89317765"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89317765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:35:00 -0800
X-CSE-ConnectionGUID: NoeK/1ZlRU6deIknw2uXlQ==
X-CSE-MsgGUID: jQm5cwWpTEqscVswPa9irA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211057272"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:34:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:34:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 14:34:59 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:34:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWO12+FzWz/jWmxm2cWxzQMCuzcVVIsyUkjoF9PEgZixAKtf0Afx/cs0SBTcu1LHxViRs7dkPNZmYOY+Es1kkvDLRaqW0Km3caDNuoAHcf/SZ/OnjAg26eqi6+m1MgroLMx8O1EZAH23E+caUQooFmKYmEyHTBl8V/w7+5cAs7Ng4TJn/n1kfs+rR2Fgk9w577FaaxKGr7HXV8bK4mF/lnQQJuvh+dHeBtgHhCY71TFbwQdh1BLQT3iCvh6lhy8EFfupkP7IwIZtaxcj0R5PoH1TNAXSkXt9Yt4Tqi2WHS0nC8wnh2yHbLZZ1yVVM9WhtN/NSY6jmPTIjOlwRXd+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b56/V+F9X9+5t6tMCtEzlupx1k0Gph1dxtvhAITbxeM=;
 b=N7w9SHoaK/sAacCJ5/pAGbZPntoOJzxN2GxwEz6VR9tdNluxbCUxYpb6LiIXKLxmzEThRcUC9lUbB61h2+/sIUp7IuYuf9t5bfTCH4K36D+fLv8L9I6JGX2ttocU13Nvs+4GT2mk1E9HdxOPbTbxBjkZCve2KbV9TLozdstpZeARlICqdzn9KJxvfXO3XYd8pcy8N3pyb+ggB8utpDyaFHNLRfRbCJZmorwGna4tyCoe6aZmawrStLdNpEqj2TU0hvPsLd6cMs8sEsip3Z67EfQvbr0yVuPDrRQ99LIhgZEKcj54WfyGdPfVTsUQUcrVHZ7BdMzSHIn85qrHjKwrNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SAVPR11MB9549.namprd11.prod.outlook.com (2603:10b6:806:4e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 22:34:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 22:34:56 +0000
Date: Tue, 10 Feb 2026 14:34:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/rtp: Fully parse the ruleset
Message-ID: <20260210223453.GI4694@mdroper-desk1.amr.corp.intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
 <20260114-rtp-rule-parser-v1-5-fa9029586bff@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260114-rtp-rule-parser-v1-5-fa9029586bff@intel.com>
X-ClientProxiedBy: BY5PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:180::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SAVPR11MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe7a2ae-82e2-4831-72d0-08de68f49dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W1yQyNmDpm3v4+f+8VURwy2nS/Pp6zqsDrJgkKhOwD5ZAoj68euHzposi8El?=
 =?us-ascii?Q?KlOXogOLoqs+L6cJL4ieImyVUB4td5+BWjD/8rsBQu0+l+zYdQr2UOVgDR+c?=
 =?us-ascii?Q?0ZjFKT+GmARo7YPd0DOe685rMfJGzZX8mKD8kz3wC+bxydp6B6LopEN3ourq?=
 =?us-ascii?Q?+wiBuBcdkDjWyCR3iRo0h/ZiV4tPVCpApjcUcTZQPQNuZdS8D68GEAxQyVKj?=
 =?us-ascii?Q?HkfqpU6YG5lTVb0hw7u0UN3dQZWwa/ywj40y/iZ640e+pz//VoK881S/DzPB?=
 =?us-ascii?Q?z6Cb0gU5UniG8VuaIFYvynKS09XLRUSLw8bij9rXOHUUsoUk51t/pxWcvrlf?=
 =?us-ascii?Q?KfztRCW6GvSKjzP/rl9Lra111T5dvHmx4TBSfFPQrZrTWDwefVx2Jwvesy+X?=
 =?us-ascii?Q?7OTbg+TWs9RfpsxVTWRRzJ/RgXzGDe99EvhkfrQ3X0pFwSwpAd4dMuvo4Rid?=
 =?us-ascii?Q?zHeTn4FtMB9cLUd7c5prqr1YBhp5o/mbSbtIhOPuKK8Szxy6oRGpdnduRG/F?=
 =?us-ascii?Q?rX+x3T1hO26fCQ85vJBczZZX7VyiAzzgrpxV0jwEnZ91KF79r6DKY0qwWXmz?=
 =?us-ascii?Q?E6LEph5WnwBAHeXVxO3XzLyhYaS9wwcMkcfuvhXvNevKi4gCzLzruoj3Zqgj?=
 =?us-ascii?Q?MvOjfLwqeqFE0fZYEmKn+9hJYQ08FmLAXIbENI5hJUpVX+Q7NSMhJf2M7SsV?=
 =?us-ascii?Q?q/66nLOBneBC9a8plYsgHHICtOlvTLvmO+CEceKFdUVg4ClkjP67i+mrhMDg?=
 =?us-ascii?Q?LlQR8JR1pKW6gAOfKHv0NqTZLDYaYBLSn94S7G1PoQNNuaQMCLLC49TCvPol?=
 =?us-ascii?Q?CxA+kyJ7oQ9KHg1mIfbi9QgS7Rv8aSMYq+6xuJu7opYLAduBBXOgwDpSxLKJ?=
 =?us-ascii?Q?PaxqU9QHlTLngqQAwL+ZEafd5LH/rqziUXbuyBPFORQQTU0QNA50Rg+tN2Ha?=
 =?us-ascii?Q?t6JoBXTYFTla23Do8qzAyQuazeB1KDZpa6a/r2qeSJNyUHNXAlZ5kFhRCpYo?=
 =?us-ascii?Q?jJeW+BOMgcnc8D7xK4ILQNupNCeu6RnyeUFbD9UEnUjFPVjwsexBCYC68GRg?=
 =?us-ascii?Q?X/dvg56k4xeDUXRWLA7JAWgF9aNQVOTVaI3rnnfIJ/uIJ5TXMXk5S8YxadeH?=
 =?us-ascii?Q?5HRpnVgnSYLKCGDO5xX+FZGH5LZ5p1FGeHNPUI0ULLxUw47apmVt5/hVnae+?=
 =?us-ascii?Q?X0c0D8zP7g3NcUwQ8M3s78/FFGEol2a8osl2mUfvNSxDa7KbURXUTLySh2q0?=
 =?us-ascii?Q?SFPN2zN9Yqmr67+AhSkTyAJA6flNfAgTWRhi8uYXnu4jC8dMRH3VU202P9Lx?=
 =?us-ascii?Q?blgPv8Cb6v+G+M+TKRqZMpFototnI4QbKeooKsJSuzwqgDb1p4NS39BS2QOz?=
 =?us-ascii?Q?2cbQ9dYY1yc/nh6eYX9eSHTGux/uhTG8ezWEubrDgGfXPPIfjNpMsmEmpr1K?=
 =?us-ascii?Q?+gHflm0u/TUHOgB+izUJwsYSsQw5teIAHMb8ttmADtvuI7k/3kuW3ddU74u6?=
 =?us-ascii?Q?GmyZO20w9LBPZLlTk6dH3khV0doLkM8NNwUIuyUod30fBUjvZqlai107Bwk3?=
 =?us-ascii?Q?Oh4aV0W59flS4oB/WL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YVg8ExuwSn5xbk2zq9R5S6SMnsk67rayn6lDOWgszY12h24YMMyTu9Fab3wM?=
 =?us-ascii?Q?9k7QJX6u/valmMutUMiJ7gUeCFq3PVtwX3R6TjXpE/2+DWiu9X71KU9oQFxF?=
 =?us-ascii?Q?+F4wA9hDZ1wzU7uxF2RwUplduv+vaT57C5ZvEsGxMp5XW3uA9alekJ7JSZLz?=
 =?us-ascii?Q?eGbflsYMTMeN6fbV8lazSt6+eELMO+fa55m1UizJP9Ehz3k0eB5qmNR2sawx?=
 =?us-ascii?Q?Y/WXwVnBZzhkiP8LbSlkNrihJ9vqPFgOtwHCJIJSoum89vwzn8fFq6o5xwvZ?=
 =?us-ascii?Q?NE5DBsVoRw7nLK/WcwD4dH7KpyMq+wxilOmuWfaHqt3m4NwpvR2h+qwU4S0E?=
 =?us-ascii?Q?gfT8kjtvQThDoQS6s8ui/F0LZe2tx0tzWCLsPTaKI9BTqrahyBlRr0er7/53?=
 =?us-ascii?Q?nu+WU1wPae7+e2mWqaH/vcXpFNl73wFc3+VEsYrfbVYL9dKJZPG9L4lMk7og?=
 =?us-ascii?Q?sI1SpO22IEhTtLa75LVw2eLm5owLjx7Js84SPJzJ91MDyrUgbCZE8PzkzV2v?=
 =?us-ascii?Q?46qKdbh72hmrh1Mp60gtQsJrHfOC1Z8B3LTySvc5Y6002TcWzQPgo3hxPmrx?=
 =?us-ascii?Q?Gx8S0sBJJw/pu0PsIczlknpT8vxUEDFMlFWVHztKy567U6R96aKM9EIVPktO?=
 =?us-ascii?Q?CcS43x53Ny3PiqmuqK76z752mqONFIQvUPimhAqttv+Hwr7LzUnLelCydRi1?=
 =?us-ascii?Q?HMWSvuWY9OTcv79B96f34TsaAKBfHM4DtCQe4U6RYnVvTBRvQw3+wLXYQYv9?=
 =?us-ascii?Q?CYVqZyF1ss1siKFCKQSXFYiZBRcPoh2Oz+wzAuD2xjFUUPMcIlG2XEM1x2Z1?=
 =?us-ascii?Q?quPYE+eRJpBOAk+CM5Ktu8GXKbTs0VLM2gwBttgSD+TGMncNZHaaQBRi9JWo?=
 =?us-ascii?Q?3LldCWmXws3Vv53o6+lOhNI5Z7pv7F46sip4C75+UqgvS7MOipTzQY19GzBk?=
 =?us-ascii?Q?JHnmUZBXzQdEHUplDBAYkI5gQ8aBThtj8Gde2EuLoebYiNelazL4dJ5w5gNl?=
 =?us-ascii?Q?9B8ysUBZiCaIgfgh9exY/29QoktIUTRiQcjvIAMNSPDdkGb/38oie44Q4Vb5?=
 =?us-ascii?Q?KZIer5DMBpWIGSbb9h/cw9qeHL8LuOeAwBN/pa+um0JfjoBDN13zmjQHYJnc?=
 =?us-ascii?Q?l1ZnzbFnv5Sp6IAtZ9dVnJAc3daYsBIboqdzqVttsMjD5NoLMIKR0pB0EhwK?=
 =?us-ascii?Q?E3MbOlvLpAnhnMMpdogIE2ELIhfPGR5ufeLHq6QipEqnLKBTlmlqhL3psfRx?=
 =?us-ascii?Q?sabievra7LSTRNfXPcEwFk4KWFbY14yFZyRTDNSW4i9eJsxY4IuD42cA3Ccj?=
 =?us-ascii?Q?lvg/U2XNENRAaHINxHQQWssS3meDKIye9VCVdrnyS5lnxryxbdnPMBPDcbpl?=
 =?us-ascii?Q?6bR8zcCrnekidAqbWHMhRJq01Q3K81lX3TbRuAS12E4S7qM5ybMFNvpzjU9z?=
 =?us-ascii?Q?A/w82+mpUv7PDH4/8z25GhuVdzAxsUkl2SnpPerHt+x10sxAUjNeZQDCQep/?=
 =?us-ascii?Q?pqWz2st5akEURC7hwZf4egLDlNlLk6Y+/jkQc7AMm/mqbbJoeqkw7g0H0l5/?=
 =?us-ascii?Q?eUg2/gR66Iwmc/6xXTiKrJFI/wZ35scaQjjwiD40Hrc9rdQKad1NMN5HUzQg?=
 =?us-ascii?Q?rZYuh966wEBXvSlnWSAdAHEc2UhkD7nNV3h+hWh05w7ca3tcb1jjil15lWqY?=
 =?us-ascii?Q?U3f0DUR1B03XtpAxNEol1oKagNtqRwZ0Cus2bzLFNQsmtK8PeTcr/+N3DPrq?=
 =?us-ascii?Q?gAjKXA8VGidI+/5cbpqGJ+bZej65lJI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe7a2ae-82e2-4831-72d0-08de68f49dcb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:34:56.3617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqmPpCx28xY9545XeMXe/Ts1+7pZ6EVjjsl3EmaJlsRoZ/OkMDGyWnC5JwZeHX6VgtEoEfS3/enEfLK8aaihz5ngY9J+k3dDMZG1GLrbzz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9549
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

On Wed, Jan 14, 2026 at 07:49:55PM -0300, Gustavo Sousa wrote:
> The function rule_matches() short-circuits evaluation of the implicit
> conjunctions (each substring of rules not containing OR) and the
> explicit disjunctions (implicit conjunctions joined by OR). In other
> words:
> 
>   - in a conjunction, once a rule evaluate to false, we skip to the next
>     OR (if any) to evaluate the next conjunction;
>   - in a disjunction, once a conjunction evaluates to true, we return
>     true and skip evaluating all the remaining rules.
> 
> While this behavior results in a correct logical value, it has the
> side-effect that rule set does not get fully "parsed", allowing
> incomplete constructs like (rule1, OR) to evaluate to true when rule1 is
> true.  We should treat such constructs as invalid and treat them the
> same way we do for stuff like (OR, rule1).
> 
> As such, update rule_matches() to "parse" the whole rule set, and that
> while keeping the short-circuit aspect of evaluation.

I took "keeping the short-circuit aspect of evaluation" to mean that a
"yes-or" rule would still be treated as a match functionally, but
flagged as an error for kunit checks.  But it seems we're also changing
the behavior to reject the whole record in that case, which seems like
it would just make the mistake worse in non-kunit settings.

I think it would be better to treat "or-yes" and "yes-or" type mistakes
as a match, but flag them as errors in kunit.  I'd expect the most
common case we'd have such a mistake would be if someone is deleting
something that no longer applies (e.g., a pre-production workaround set
of rules) and they just forget to also remove the adjacent OR.  The
remaining parts of the rule should still be valid with that kind of
mistake, so treating the whole rule as not a match seems wrong.


Matt

> 
> Let's also update the kunit test to include instances of those
> incomplete constructs to reflect this change.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 12 +++++++
>  drivers/gpu/drm/xe/xe_rtp.c            | 61 +++++++++++++++++++---------------
>  2 files changed, 46 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 19c7142b2fe4..f0122553644e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -177,6 +177,18 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>  		.expected_err = -EINVAL,
>  		XE_RTP_RULES(OR, FUNC(match_yes)),
>  	},
> +	{
> +		.name = "anything-or",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(FUNC(match_yes), OR),
> +	},
> +	{
> +		.name = "anything-or-or-anything",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_yes)),
> +	},
>  
>  	/* No match because hwe is NULL. */
>  	{
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index dabc2e74e2ce..55df9c16a3cc 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -123,47 +123,54 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  {
>  	const struct xe_rtp_rule *r;
>  	unsigned int i, rcount = 0;
> +	bool parse_only = false;
> +	bool match = false;
>  
>  	if (err)
>  		*err = 0;
>  
>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
> -		if (r->match_type == XE_RTP_MATCH_OR)
> -			/*
> -			 * This is only reached if a complete set of
> -			 * rules passed or none were evaluated. For both cases,
> -			 * shortcut the other rules and return the proper value.
> -			 */
> -			goto done;
> +		if (r->match_type == XE_RTP_MATCH_OR) {
> +			if (drm_WARN_ON(&xe->drm, !rcount)) {
> +				parse_only = true;
> +				match = false;
> +				if (err)
> +					*err = -EINVAL;
> +			} else if (match) {
> +				parse_only = true;
> +			}
> +
> +			rcount = 0;
> +
> +			continue;
> +		}
> +
> +		rcount++;
> +
> +		if (parse_only || !rule_match_item(xe, gt, hwe, r)) {
> +			if (!parse_only)
> +				match = false;
>  
> -		if (rule_match_item(xe, gt, hwe, r)) {
> -			rcount++;
> -		} else {
>  			/*
>  			 * Advance rules until we find XE_RTP_MATCH_OR to check
>  			 * if there's another set of conditions to check
>  			 */
> -			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
> -				;
> -
> -			if (i >= n_rules)
> -				return false;
> -
> -			rcount = 0;
> +			while (i + 1 < n_rules && rules[i + 1].match_type != XE_RTP_MATCH_OR) {
> +				i++;
> +				rcount++;
> +			}
> +		} else {
> +			match = true;
>  		}
>  	}
>  
> -done:
> -	if (drm_WARN_ON(&xe->drm, !rcount))
> -		goto error;
> -
> -	return true;
> -
> -error:
> -	if (err)
> -		*err = -EINVAL;
> +	if (drm_WARN_ON(&xe->drm, !rcount)) {
> +		match = false;
> +		if (err)
> +			*err = -EINVAL;
> +	}
>  
> -	return false;
> +	return match;
>  }
>  
>  static bool rule_matches(const struct xe_device *xe,
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
