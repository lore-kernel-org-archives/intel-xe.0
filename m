Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3111BC4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 17:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEBA10E312;
	Tue, 21 Jul 2026 17:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fv/5rPRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B448D10EAE6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784655308; x=1816191308;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CGmGLeqRLXs3eZER/RX9EXGdX+xFTC+NjhzD3UP91ic=;
 b=Fv/5rPRWu1BT2kPFz1s82tE5eo/JKBWBwPO6kjKVN1DkgJSXcIzb342g
 8EZFs13NYyYmlKpqJ9zvyxK7DPgtFnQ1tpMS08rU2QRl0PlHkWTJcIqet
 ND8AtGZlKbOeRHEsN/DbLs+T5ACJIGforzYVlNm44sFfQ//xzRwqkJDDt
 1d+xOkC/Y6M8JjAlG1csKvMOVGAvbfRwlvkSIggJOdkvMCB8KgiXktmHb
 fOD4mnvzqRhuYNY7LWfuAXu66lW9E/EE8GbzkK81vE0GxNjC629nt0X0D
 4gBp+9JGth0HbULnFo8P25i4gJnUIUvut1ntbtIfv8LwJRseQepc8ID0B g==;
X-CSE-ConnectionGUID: 1xitchZJQIOpdZ4j/tM2AA==
X-CSE-MsgGUID: 1F/1qNP5S4OC9xrY4eZNLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85284840"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85284840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 10:35:07 -0700
X-CSE-ConnectionGUID: JuvigCIhQ3m69Fn/hbe9RA==
X-CSE-MsgGUID: AyAKTDziQq6FAFaJXilaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253926953"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 10:35:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 10:35:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 10:35:06 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 10:35:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPJYKXPZN8FGsbVGJDjy4TlJLOuEJmqVoTmn/Hiwiss2sP9oKhoTOM8zB56UvteaUbn7H4NzmMZLVaGI+3GoTcjZQAfhbhmZb52k316xxyJdKY3xuEDSkoRqZftLgYw/NsB/juXQDHWKS+ahMRP6ErW5LPhHEkscagrBcgQNGGR2ch+90fPiLUw73SyW4r/ErnoqOnj9dLJrQhWmUtKT45BGpHdJl5xTqNHNuK7y+4+RCt8gW/8zv8rXN8+4fOErznrIAvJy93gukg5f3LlHauqJMo24q1MbndiitSLupnMKodiO85WzC0dG3kFHw2tn2QDbOZtjI+YOMiYJsp7yrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3YtPXeAYWfOaq5yZhTsh9GJnosSI9/ZAor7Xucbqjc=;
 b=nj5kTDDmZ1K0lL7oRWdRX/cbGKh4qveUHIQ8P0/RkahvHc8kgLhTlrzFfVyNr8RnfPcd9RrIva1IX/tbuteQIormUMmb/wT/rgetDncj3Lr1lj591Wh+J4pyh8XOkvrA3oyMc+E2+ZIAjATevSBVK9xIcWXpffObvLdX+E79uqnV5xve8Qfr5ZHZvY+dVZfOys9zXB/jJjns5dF+dvNdk5iO/xW7X8U9pgJJ6xg4Scgv21SdeRRGawVpeIDw8TlCBA23I1PXCYc1eUkIng+62SCi65Wq1zG0HNbJ7BaU2KS7qEr/5faNgNbV2PvyqZLrPyFZVDlIYowc0br6a2rtcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9349.namprd11.prod.outlook.com (2603:10b6:208:571::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 17:35:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 17:35:03 +0000
Date: Tue, 21 Jul 2026 10:35:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: "Levi, Ilia" <ilia.levi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <koby.elbaz@intel.com>, <shuicheng.lin@intel.com>,
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/mmio_gem: fix fault handling for split VMA
Message-ID: <al+txKTZPIbm8XPx@gsse-cloud1.jf.intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
 <20260526125106.2806522-9-ilia.levi@intel.com>
 <7baa79b5-a2e4-4064-8a19-c0f263a883e2@intel.com>
 <al7lbcjU8JsqasVE@gsse-cloud1.jf.intel.com>
 <78425c51-b432-45af-bab8-7c74230880cc@intel.com>
 <d3802216-6404-4d4d-b166-a3407bfd4c14@intel.com>
 <ef91436b-2ba6-404a-aa47-45937175663a@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef91436b-2ba6-404a-aa47-45937175663a@intel.com>
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: ee250059-b15f-48ff-0f7d-08dee74e6553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|10067099003|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: icQv/flR8LGD6FtSLmKR3UYjHcnKo9mCcGAajDBxD3opBtMKB99YsJWX8Hd71yWScnHZRFmcWWpG82vODCATPVZfnqjlg5Fb111tX7oCNE90V9qQeejn7IvUUs8YNnK8gF3cQv+VLkV7DhKghPSqVdktXFaVyMEY5u4IV6ZERO3hjxN4QI5jZy+8olAGcneU49T5nxoTnScPiOFuzruFBhHjEK/OUOx+yEsM5BLw63ufGWZzD9eF5RfxWhH1tCmPKk9jq9UEkFkgcFo7LGBiHxMPzYQRYYqSBrmwT7cYYoR8qIgQtck+Jlk3uTeqL9FItiQa13+M7iuL5puYM5KOXIf25/+HBXJP3VKT/tp30+jAClqkQKycrPN49b95P6q9FrVEkc/hL6vWOyANVbLC2pFmQ3T0gdiCh3k1bxkawxN07IP6g3hnQFoV3gO8I8bZco/Kj4jInHsnINK243M4Zj1mNRs929W9NGUTN1UFcg0YS62kyg+6AScAvwWMZmjevdtbFk33CttY1l0HM1fRX/Jnq9WhwiTGxUIQUczJxuTk2QUQkTAhtLVivb2shFfkXCD4pqP9AOrtTdpRQEVebc20kmFscIakX19Bw1dytozt18FJmgSYKTNmonc90oaDwUSVQo0y2hhlzmjUlB0OxIZXBepJl8+KEYSdWVHspjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eER4QlRaV0tRcmdJcHNTRFhCd05QTkM1MEZYb1lPcXNpVWQ2aENoUC8wb25N?=
 =?utf-8?B?Q3MybHFJUTgrWFZSc1l4VVVIQXpCU01VMHdYam1hTTRKNlZCYmdQTjA5Wm9U?=
 =?utf-8?B?RURTZHBObDJVUnZ4aFdtbk1qZkd5ODBHVjdGR1psamw0TVVNZkxCN0o4bGgz?=
 =?utf-8?B?aW1LcnUrZ1ZoNzhEeHh1MWlwTktyREV3aHI1b1JQclRBckxNWXRLK3RwTUFB?=
 =?utf-8?B?NWdCSjZKWHFzSm9jRXhrVE44am9WWVduSnNwRDR2Ym1nREVlNllWRmdYZ3lY?=
 =?utf-8?B?cTQ4UDVqekNGbjhHOU5uZkFqVXMwdEpLMFNPNGJwMi91UDVZcEdvTzNDYlFh?=
 =?utf-8?B?YmJQU2cwOXBKYVNsZHNZTDZCSkszU04zYTRhOHpqMlFpYThvaFFsb29xRW9l?=
 =?utf-8?B?dWoxMXJNTU5JcmE2aElLY2JjaWpBeE9FSDRWTkFhMHhTcWE0ZkFaTkszVFc3?=
 =?utf-8?B?bEN2ZW93M2JJOUVrdExBVHcrOEN2ODJta0hoek5lZTRPOGJ0UlNBNk1LOXZh?=
 =?utf-8?B?SjlPY2xCa09mRnZtbzNVUCt2TWNLUkZSWU1QNE5kT0lwOExtRjJuOHdOQUh3?=
 =?utf-8?B?TU1rdWM3UnZYdzlmcU1ka1ZJUUl6akJUenlNYmVjK3lmSVZMNzVtTkhWK3pr?=
 =?utf-8?B?dE9aN3VSUzhNZEFmdjJjSEtYN2FJcmw3RDdmL3lnT3hHbEVvUHdxRHpDNnRN?=
 =?utf-8?B?bGx5MnpSOXQxd1ZEVzFLa2IwdEF2ckxxc2U2ZkM3R1FyQ1NuSk9aMzl0VTFw?=
 =?utf-8?B?REFQU0FPcDhBaysvWWh6RmFlVGRMNHZiMm9aRllxZ0JNQzl0NUNhNWxUa3pa?=
 =?utf-8?B?Zm94ZXV1bVZycXRWUS9CajNRWnZKQ1F0T0s2cG5NaGpxT1NCd05HWkFiTmJK?=
 =?utf-8?B?WmV2QTlHWXJIb1JPRGlIWmpkTkdYVFNoL0ZoaStyYzhFTzAvWE5rM0dqVjZP?=
 =?utf-8?B?dEhlQUtDOWlTOE03eDhYM1l2YkloanZsUVhOTXgySU44eHhGVGtWbTVTVjAw?=
 =?utf-8?B?V0Z5MnpZWjFIL3JtVDE4TWg1ZWEwL3pUbnNWSjdraFFwbGR1VGFHVS9IazI5?=
 =?utf-8?B?eStwYUQxR2kxZmN6VGlvVlh0Q3JPNmVXUmpXYnVFL1BXU013Y09OcEo1MlI4?=
 =?utf-8?B?cXpsUTdHSzcvNzNxOXRFK21DYVptL0xzTXZzTlpYQVZJWElHMyswUEphZGpn?=
 =?utf-8?B?eVk1V2lrMHhlN09WSTFDaDFMWk1YeG5nVVlaWnF4dHNaeFdnK3NHRVUzK1dH?=
 =?utf-8?B?b3EyOVdpR2V6OThHOXhvRTNaK2FLeWJBRUtpTjlIZWRSemtEeW9kK1NaQVZp?=
 =?utf-8?B?S3lPS3RUYTBEY3hHVitxMklWcWNDTFY3aUFNWHA5T3ExSGJ3clJuc1c3RWhL?=
 =?utf-8?B?SG9NQitldHRMdUxBR1FHMWF5VDVQQ2xUZFdlWGt2MzdxTFRtazFUOVJab3Z0?=
 =?utf-8?B?MzJmcVA2TXBZM1Z4NVc2RmlocXlNejN5cTEweFB1dnV6YjZuNnlyUUxqRmlS?=
 =?utf-8?B?cUlwMTA4cHhyTEtLOTY0ZVorRmQrTW1oOU90SElxY1ptWDNUdzR5dTd0a01j?=
 =?utf-8?B?dHN1RUEwaVlFT1NIOHNNTTBVQnRxbW9lVllQWWJNNWJFMmQ3N2ZDTnl4bHE5?=
 =?utf-8?B?Ty9ZZ2JhSzVTRmdKeFRmQnJvcVlOYkkzU0RIYmxJQVZGRWZ0Y3VONU1sYXhT?=
 =?utf-8?B?WHBReHVjOWt5Q1RrT2tCZEcrS1pnZ3E5TGgzM1FaOXpUdWZpWnkrTDBhaDI5?=
 =?utf-8?B?YVlXQVpOZkp1bmV5all6WitiWXcydEFta1NLdTdieGxGL3JWZStZc0lGUjdm?=
 =?utf-8?B?QnBINVJPVHhOSzNrbDlMV0ZJTWdQbEpZOVpmSEc4T2I5cUJUbjhWQWVuWjZU?=
 =?utf-8?B?dGhBQThGdE9NWmlwRmpOdEpQcmcvMHFLeFBrbFR6b1R5cHBPVVphVVFiREkx?=
 =?utf-8?B?TXY3WXRNR3hwdlQyWlExcVdTQ3VhbGVxVWdmTlFpaGc5YzBPVXZvekRXYkVY?=
 =?utf-8?B?ajN5L0M4S1ZQbElhd0hHdnBGK3JKWVcwdENxem9GSnYwNFlQMzRZdVQ3N2FZ?=
 =?utf-8?B?VW5VeTQzTFBXZE1sb0Y5V1ZQa2h1ZEhYSnV5cWZjMFoyQm9pWHVTcU5WSUh2?=
 =?utf-8?B?TFBQdVNrb1pxUjFiNXFPNG43WDdyd2NiRjJUbnVpZ3owVTFITWpkV3ZzQUdm?=
 =?utf-8?B?Umdqd0cwRnA3RHU1bTI2OVp3Um5yRE5neWczYk1vUS9HODJxd1NuTjRCdytS?=
 =?utf-8?B?WmRuQkVtUUZUZW9kWGNEZXJzZG83dFA5cnk3MUhjSWhFM0JnWkZYWHFNQmNz?=
 =?utf-8?B?NlZCejhxUDlraG8xazErOTZKellqdTR3NUszeitWVytJWXlNb0dRRGY3ZWh4?=
 =?utf-8?Q?k5aKbO4iiXtnRbG8=3D?=
X-Exchange-RoutingPolicyChecked: Op5wI7NC18jS3dyhUGb38uqZvyKeSmN4n0n1/vWfzRp17ylHih8frD5fYl3LgXYomNev8Pv7A1T1daWbtp9y9ne0zDntVsri+gGpmrpgC3d8DuwCIV4rP+wtFkwJbakJtYrgNXuhl8u8iSEjWcmsGHvQPzm0+bp/dE1IS+ony696Jk/652ev7MGvnLJX6DKlW8VjamfVJNMzLn6WJFKnZo3LAPvj6yvv7lA4oyqUyyQ+TwEjWbRSJS907otxJCr8pIwpcZfsDOT3O1x5D4qZeJn1bXQ5C1etvZHCyG1x1cmc5vRDzwO/aVMAoisPM4J7Cwr1Nr2KxQfdaboo2cWmzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee250059-b15f-48ff-0f7d-08dee74e6553
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 17:35:02.8756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cusWooykNOTGifU+NJTjolRM8/03tja/T4CBy09/LaPr4VqNgUcUpfsD3ig4BCBqHFpHlKkveELXNVzWoSDrmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9349
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

On Tue, Jul 21, 2026 at 02:19:37PM +0100, Matthew Auld wrote:
> On 21/07/2026 12:49, Levi, Ilia wrote:
> > 
> > On 21-Jul-26 11:44, Matthew Auld wrote:
> > > On 21/07/2026 04:20, Matthew Brost wrote:
> > > > On Wed, Jul 15, 2026 at 02:05:35PM +0100, Matthew Auld wrote:
> > > > > Hi,
> > > > > 
> > > > > On 26/05/2026 13:51, Ilia Levi wrote:
> > > > > > The fault handler currently assumes it always operates on a VMA spanning
> > > > > > the entire GEM object. This does not hold when the VMA has been split,
> > > > > > e.g. by a partial munmap or mprotect. In that case the handler may map
> > > > > > wrong physical pages or cause SIGBUS.
> > > > > > 
> > > > > > Change the fault handler to map only the GEM subrange corresponding to
> > > > > > the VMA, and do not set vm_pgoff to zero. Many DRM drivers do this
> > > > > > because helpers like dma_mmap_pages() interpret vm_pgoff as an
> > > > > > intra-buffer page offset; leaving the DRM fake offset there would break
> > > > > > these helpers. Those drivers can get away with zeroing it because they
> > > > > > map eagerly -- all PTEs are established before mmap returns, so vm_pgoff
> > > > > > is never consulted again. This driver does not use such helpers and
> > > > > > defers mapping to the fault handler, where vm_pgoff must be preserved:
> > > > > > when the kernel splits a VMA it adjusts vm_pgoff, and the fault handler
> > > > > > subtracts the GEM object's fake mmap offset to recover the page offset
> > > > > > within the object.
> > > > > > 
> > > > > > Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
> > > > > > Assisted-by: GitHub-Copilot:claude-opus-4.6
> > > > > > Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> > > > > 
> > > > > Would it work if we did something like:
> > > > > 
> > > > > +static int xe_mmio_gem_vm_may_split(struct vm_area_struct *vma, unsigned
> > > > > long addr)
> > > > > +{
> > > > > +       return -EINVAL;
> > > > > +}
> > > > > +
> > > > >    static const struct vm_operations_struct vm_ops = {
> > > > >           .open = drm_gem_vm_open,
> > > > >           .close = drm_gem_vm_close,
> > > > >           .fault = xe_mmio_gem_vm_fault,
> > > > > +       .may_split = xe_mmio_gem_vm_may_split,
> > > > >    };
> > > > > 
> > > > > ?
> > > > > 
> > > > > I don't think partial unmap or similar is really a real use case for this
> > > > > type of special mapping. IMO if we can just reject that would be simplest?
> > > > > What do you think here?
> > > > > 
> > > > 
> > > > +1 - I don't think split would really be a use case and most xe_mmio_gem
> > > > usages are likely exactly one page, right?
> > > 
> > > Yeah, at least in the case of barrier and the other upcoming case I'm interested in, it should be one 4K page. There could be usecases where it's more than one page, but even so I doubt doing partial unmap or whatever is really a needed thing from userspace, for a mapping like this. But if that turns out wrong, loosening the restriction should be fine in the future. IMO keep it dumb & simple, especially given all the bugs we have here.
> > 
> > 
> > We could definitely do that, but I'm not sure what we would gain by being more
> > restrictive.
> > > In terms of implementation, we won't need to store and use pgoff, but I
> would
> > still keep the loop change (as it reads more naturally) and remove
> > vma->vm_pgoff = 0 (since drm_vma_node_unmap() zapping relies on it).
> > So it comes out to roughly the same amount of code either way — the .may_split
> > hook is about the same size as the pgoff handling it replaces.
> > 
> > And while partial unmap indeed doesn't sound useful, I could imagine a use-case
> > for mprotect, e.g. a hw producer ring whose body is mapped read-only to
> > userspace while a control/doorbell page stays writable.
> > 

Almost certainly hw producer ring and control/doorbell page are
different xe_mmio_gem though.

> > If you think a narrower API is preferable though - I'm ok with making the change.
> 
> Since this is uapi, it's usually better to go as narrow as possible, since
> it will be harder to revoke later, if we did decide to do that. On the other
> hand loosening the restriction later is fine.
> 

+1.

Matt

> In addition it looks like adding features with no current user or a way to
> currently validate it in IGT, even if the code itself looks simple in the
> KMD.
> 
> > 
> > - Ilia
> > 
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > > ---
> > > > > >     drivers/gpu/drm/xe/xe_mmio_gem.c | 18 +++++++++++-------
> > > > > >     1 file changed, 11 insertions(+), 7 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> > > > > > index c22a38e5616b..15e884ad3f1c 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> > > > > > @@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
> > > > > >     struct xe_mmio_gem {
> > > > > >         struct drm_gem_object base;
> > > > > >         phys_addr_t phys_addr;
> > > > > > +    unsigned long pgoff;
> > > > > >     };
> > > > > >     static const struct vm_operations_struct vm_ops = {
> > > > > > @@ -92,6 +93,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
> > > > > >         if (err)
> > > > > >             goto free_gem;
> > > > > > +    obj->pgoff = drm_vma_node_start(&base->vma_node);
> > > > > > +
> > > > > >         err = drm_vma_node_allow(&base->vma_node, file);
> > > > > >         if (err)
> > > > > >             goto free_gem;
> > > > > > @@ -147,8 +150,6 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
> > > > > >         if ((vma->vm_flags & VM_SHARED) == 0)
> > > > > >             return -EINVAL;
> > > > > > -    /* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
> > > > > > -    vma->vm_pgoff = 0;
> > > > > >         vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
> > > > > >         vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> > > > > >                  VM_DONTCOPY | VM_NORESERVE);
> > > > > > @@ -190,7 +191,8 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> > > > > >         struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> > > > > >         struct drm_device *dev = base->dev;
> > > > > >         vm_fault_t ret = VM_FAULT_NOPAGE;
> > > > > > -    unsigned long i;
> > > > > > +    unsigned long addr, pfn;
> > > > > > +    unsigned long pgoff;
> > > > > >         int idx;
> > > > > >         if (!drm_dev_enter(dev, &idx)) {
> > > > > > @@ -203,13 +205,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> > > > > >             return xe_mmio_gem_vm_fault_dummy_page(vmf);
> > > > > >         }
> > > > > > -    for (i = 0; i < base->size; i += PAGE_SIZE) {
> > > > > > -        unsigned long addr = vma->vm_start + i;
> > > > > > -        unsigned long phys_addr = obj->phys_addr + i;
> > > > > > +    pgoff = vma->vm_pgoff - obj->pgoff;
> > > > > > +    pfn = PHYS_PFN(obj->phys_addr) + pgoff;
> > > > > > -        ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
> > > > > > +    for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
> > > > > > +        ret = vmf_insert_pfn(vma, addr, pfn);
> > > > > >             if (ret & VM_FAULT_ERROR)
> > > > > >                 break;
> > > > > > +
> > > > > > +        pfn++;
> > > > > >         }
> > > > > >         drm_dev_exit(idx);
> > > > > 
> > > 
> 
