Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EDFC55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 06:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286AF10E186;
	Wed,  5 Aug 2026 06:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SguOu9bU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772EF89A1F
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 06:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785912611; x=1817448611;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B9uIDixj5sLcGw4lnA3FyhODSmvOepBtS1EswrWE0hE=;
 b=SguOu9bUk3ekmSwNQBjIF0QzC4HA+xxpwcMLaKwLBAIUNsQ0tH/c7P0O
 8CzK3KVz7hdwj81KIX3ZtkCUkuXYyQaosYsyPIsP4O9tpYt+9RYLdbYpA
 wdDODExFaz+yDTZBtk+IB2oPr/zmKPuFApYohZjNZYKQboexb6JaK+X5Z
 IG3hh3oGhvAaPPmEMhDkR/wcz4UPEahN6m1QW1dF7pSI4+QXlm4AwAu1X
 9QIzdhQw3RaucvuezC/j4NhiQAB9t2KHBHG0fLGk7k9LxIP36sB8O0ljg
 gyDNlmstdnnicZeDGxRbXkCxCoSl3PIGVZTeSf9rLvZ6TW/d6hqjcJ0Wr g==;
X-CSE-ConnectionGUID: U9fFaMDcS+aad65c/608uw==
X-CSE-MsgGUID: cKutp7hOQ4utq3dYTzt7dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="104015191"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="104015191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 23:50:09 -0700
X-CSE-ConnectionGUID: UuSt5HA0TA2ksr89tij25w==
X-CSE-MsgGUID: 7Un9KilxRxu10iadof4GLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="257855690"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 23:50:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 23:50:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 23:50:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 23:50:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QepcfzoMEavi9MQ4KIQpKvmsb8LbVlnSRCLKjrLtfkSSl1r0vq3Awgk6n7w48ElXAiWLF1WSjC6s8TXtJR2azTK1EJwhnRjcXPQiDw6WLd5hVroC/5RFky699kcxyD1+XgLmnaiGVFNaoudyW3K2PSqrfQXhvHBX0fU/3BXh4PBXkDux96M9fbHEVXwSf+yIG/7uWRk1oHk+tKVHdxgKHoEgPQltV3kh88f/miEBw2kJ+2yM2u50luMG7kws1u9xzWxzj0/Zgp9YMAIHEOpU93h5U/0mbTQZc1bn7Qd10IdiRQcyX5+i6g6xWn+46COpzo6GWyXdMkh+/6gt4ZKq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c221q05eWXMZEC97nYME3RCxQ+OGtjQ3Gfhgf9rf/Tw=;
 b=YrHpbfkwY49RNO3wMwWuJ1PLhXrAvYa/AVZw8qeT6DYyioLOX1Afp+rZNN6xPt5hsREoIeLslcXMxKlDxjpdI2AsJkITicLHUh9ZT3CXvNnQJbDlCzakthc64eOQv7j9ahioa+ASlmz0TS4TpyXqd9HHF37ztAwJ2MnpYsWY7k+GI8KGTv92m0vVqNhbzHwx2LHysgNZ/k8vdGRR3D2+qWI4CuJspMaqKSH1ZKYWyzq8VN3APX20hbjOBEkk3GgmrioOPAJ652IAtDlIDWmSWIYIA9tmkapnWCz25vK6cG/OrpsoIf87QOmWX8kmtZAJTtiPtxHJxPp1xGttL4vNZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by LVUPR11MB9858.namprd11.prod.outlook.com (2603:10b6:408:38b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.20; Wed, 5 Aug
 2026 06:50:06 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 06:50:06 +0000
Date: Wed, 5 Aug 2026 08:49:59 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 11/12] drm/xe: batch CT pagefault acks with periodic
 flush
Message-ID: <anLdF7eSGGmx9ExZ@fdugast-desk>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-12-matthew.brost@intel.com>
 <anHhTWNh1SYSBo1R@fdugast-desk>
 <anInAToBOCjkTPxS@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anInAToBOCjkTPxS@gsse-cloud1.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::20) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|LVUPR11MB9858:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aba778c-98db-488b-5009-08def2bdc8ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UPplHh/JOpK5UVh4bm0arUTGpRaRZ/46jCSUrnDZoXkMM+ozPhkkmyE7ysYJrtXZPKVbuxr8SWchH+LNDCySj7R+7osNQkuRWynAtodW9NXzJ1Y0W5Lg/ZA88mnpUhW41joDzD3UJWfzQpvJ9tJLLZydkg8AxvsIZ5MAcBZ9LvB2pMs8jcB6Aal6VgV19/6onPyOqPYx846xerFESID92PmMUUPYUTikOo0fo/jCbm3PqyzsHm9svsMVvwH73RtU82qYH2wJOFdQLzoGoOYBa2so0hEE3fE2qL0xHVMHRqjyqPovRV9EdHX4Js5rUoKoqG4Gnjv7EklFILMjuwuv06AaKvQTjnyIbXSIEut+u9PF60xjx4VOghsgfHSG2B6kaRXvdjJ/0KsZZ3s3xo6pzk/bY0uQMNs5aDu2plLjAsRPN+UulP65J1LvV43IPbFj7FOsgltQ+fOye0GOknKuxxD6XjaYsmHoRLuAV+s4DkItVA3wDSWXPp7nlA1OCmQSwsdZslZtBP8f9tnNnbEFsmvsvLznxaXKgsGmZ+hro1KZSRmcsaCKf8t/dNcxhUo25ArkLORO+xPpSe6Fu0PJO7hQ9fb0fxXbd3b4c1gQRTpd/PU6BAEJMb1KmKlc2nW0GF8Xxmx/oipxq4bH2CmGn5JO7T/wmN0NxKpIabf6GLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTlYc0NqQWdnY0dIVGtBYlFNNnhUemlYRVk1MW9QSXJGZmxqUmpHQlU5anov?=
 =?utf-8?B?MTd6V0I5eTNaWVNaalQrZTFBQ1hlUldhbGloWEhRYlpONXBGcXhIZXlvd2Nw?=
 =?utf-8?B?dklha1lobnpINnMyRXBkYzEwdnlJOFhIVDVnMTA4MGxQand6NVJPZ3h5SHFN?=
 =?utf-8?B?WExTMkNhY1pDV3RMWExBc21vQzNzNUdkSTBpRlFxek5MMjUxRHNwMEZaQ09o?=
 =?utf-8?B?SUw5Qkd6UnR6RlZ5ajNQejY5bi9pWmtocENrUE9ud3dCeXh4ODNYbk5taS90?=
 =?utf-8?B?NHF2bXNPZ1BaVGtjUmdEbGdvOXRvREgxbU4wNGVqMExobE5mWnJObjZPbm1t?=
 =?utf-8?B?ZGY1OUt0MVFQTGltd2RiRWg1bW5BMHRrRmtUeThLRjE2UWhHNUpZTnN5MG5n?=
 =?utf-8?B?a2wvRWNyQ2gxTndLaGFoYWJpVFZJTDdwdEM4NDhXY3hvU1E5UStCT280eFdu?=
 =?utf-8?B?bWJiTEhaM3kxZWZKQ3JXQnl6VmxxV1lBR1lzcGQ0NWNUbG51aHFHYjIxaTRV?=
 =?utf-8?B?eEdwTGNZWk53R0Q4dnYyb1dMeEp4UVY4S3cxYmxjZFFMd0NpYU9FVk9saU9C?=
 =?utf-8?B?b3c5U1daNFNEZ28zWUJzOCtOTjBzRFJyUVRERm5MSnp5cktYN005a29zc1R1?=
 =?utf-8?B?aUFLRk80TWo3V1ZnS1I5aDhqL29LMHRHcEEyL25FMlUvUWV0a084bEU5QVh6?=
 =?utf-8?B?TXFPaVo1S0tBcWZJTDR0SGt1ckdPcnVTMEdUdU9uZ1dTSlc0TVpoRDM0MUZo?=
 =?utf-8?B?Qm5VOGN6WTg4Q0RWNHkrL1p1VGI4V1JxWTlOUmxiWkhnalBHY1ZWcGYzZDZF?=
 =?utf-8?B?RWFHa1BGbk1zOGhoUlB2dGdicmxtQXM2a2lvUVYzNGl1Q05PMXdYSlpzWW1L?=
 =?utf-8?B?NFZTdnFrWnRjY0wvcFVYN2NMSnRaNDNsMjZyZlZSYVlvUi9ueE5JR0RiSGM4?=
 =?utf-8?B?MWc3bmFxT0ttcGtxMWpnTUxPRU0yN0FEdTNTc01SSiswUE1TT2kvUFlxd29l?=
 =?utf-8?B?L2VuY055bytiNW8vZUVsZFlmVU9YVjRacG1XQjlEYkJKb2czU3Jweko4R01k?=
 =?utf-8?B?RUNHTkY2LytTYjd1cXFkQmZDcFNjcXM1Znc2YnhaUGlpLzZCczlKcUZ3anFi?=
 =?utf-8?B?WmNGdVhuSmJsMk5zbjBtY1ZKS2Npclo5eFdNNG85d2dvYis0R3ZzYzdVTVhz?=
 =?utf-8?B?cGh4LzhaT0tWY3dNcUpKbHlPNFNnRHpXZHdwZG96ZVJrbXhpbHFtNW1pNDlq?=
 =?utf-8?B?eE5qdERuMGNkeHlnZ2tnUVkrdUoya3Bxa3dxK2JTc09UdjYrcm9wSXhaOFFu?=
 =?utf-8?B?YUFUaWtLejIwbWVUYTV2OWlJOTloQnVlQmxKRldiaTIvMUVGU3ZBS3k3THds?=
 =?utf-8?B?UUUrdFg5Q2ZJSldJeW1iQitjTytpRmMzbHY3a05hcVFHRWhoZUpDbUgzcS9m?=
 =?utf-8?B?UWlBN0xpM2lkYitvUGFTV21PNGFZNzY1dUFobWxxQlYvSFI1aGJvOHgycUhZ?=
 =?utf-8?B?TFJkMGpBMEZ4Uk9qUTZSOTN5M2NSUGxxUk9HbW9Ga2lLcnJZdDBUMW1aVG5l?=
 =?utf-8?B?ZGFyTnZVUzI0YVRwRGw1WDd5dXJxaDFWNHNWZFdJeWhBaHMyR0xRc2dXbEtU?=
 =?utf-8?B?Smo1WklrR0REY0tENVltMjkyVldpK2ZQOVEzNmJyV0xmUTlmSVBiVS9DSXdE?=
 =?utf-8?B?OUp1dWJtSVdNZDcvbGN1Y2R5Y1hEa250SWNSSHdCR2FBclBiS2dEc3UyUm93?=
 =?utf-8?B?aERMSXVYN01YSFVaRWt2cVVFbnVRWkdDZzBHYlVQWkdLVmcyMnUwQ1JZMjNP?=
 =?utf-8?B?cElZSWp5Y2FlOHVPOWRhWkZxTWZ1SEIxbHQ0dldYNHNTVUx2MnFHQ1ltbllu?=
 =?utf-8?B?YzJGb2lrd1RIdG03bjNwRngzTVJoR3lHVi9UeEVjUGJCZG1LTnNmd21rRmVk?=
 =?utf-8?B?OHhnZG0yRnBuWWRDVmpFWEo2blI0MWtDT2dHVlVPYUlzemd5S3FEb3M1Qjdp?=
 =?utf-8?B?dEpnOGVVVVU1R0w3TFRBOGRDdmdwZzNkVmZFK0VObnhFVzd5MVhMVVJFY0V6?=
 =?utf-8?B?TmNZZXJXMTNSU3lIQTRwWDBiSzUydDZObkZMUkZodkE2aWw2bWpoaVVUTjU5?=
 =?utf-8?B?aTR0TlQrM0FtMG52UlVORUxmSG1lVURXaTVxclgvRk1JcWFFRTlhUWt0aXZs?=
 =?utf-8?B?NnE2Q0psS0hDUnh1M3VXL3RORk9ieWpXVFUvdFFCMGdhNnZDYXNiS2c4Rkxp?=
 =?utf-8?B?OXlCR0duSUM4L21wNUxCU1VwdFVIa0pEVUdlU0QvVnhQcFdNclNaNkJZWlRR?=
 =?utf-8?B?WldjVjJUazI0NEVHdlZIVGtYUUZOOCtPdlpQNTlVUlRSZlpveDNaMDkvTnFM?=
 =?utf-8?Q?HrxmroRaHwXlNOaI=3D?=
X-Exchange-RoutingPolicyChecked: X55IpxRNNT16HplofWj+fYAySKNMDdHTVI9y1r6/xEmfCWFB4M40UQO1KUeedMr7eQpzhnBUkAsj3XtxvHf4k3fkIawCo2So5IbOPD09czAv4yU5qw4wW/EYTy7drjz0odkdEPj5BnKFbNj7dJa2HUq+lT/ICp67UKstxNHVmmAwCFxykVyfG81LhOfOOK57G+4ENULDBhufUjFW2iD/x7l4FSW4qbAcDMI5af1rJUwMMV6vM532JXcbQ19C6npmbi/p1lG1baV/dtdPnvpa40kTCPmE9qjiKeA/TaSlg4RQcDUPpXjXYZHauoBjKLBy7jEqQPU+9nynhqa1DXAiHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aba778c-98db-488b-5009-08def2bdc8ef
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 06:50:06.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEBDqKRY3RQ9YW277HZwHS9vre5DznF+Yr3pvgxolh1clJ8vyfMTYpRmpGXvaPWWALoWJ2/f2dABNU9jD1GQBijQQiSzDNYvsoNJHWDJ7BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9858
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

On Tue, Aug 04, 2026 at 10:53:05AM -0700, Matthew Brost wrote:
> On Tue, Aug 04, 2026 at 02:55:41PM +0200, Francois Dugast wrote:
> > LGTM, just a couple of nits below.
> > 
> > On Fri, Jul 24, 2026 at 04:26:00PM -0700, Matthew Brost wrote:
> > > Pagefault storms can generate long chains of acknowledgments back to the
> > > GuC. Sending each ack as a full CT submission forces a barrier,
> > > descriptor update and doorbell per fault.
> > > 
> > > Extend xe_guc_ct_send_locked() with a “write-only” mode that copies the
> > 
> > Wondering if calling the argument "defer_flush" instead of "write_only" would
> > be a better fit, and also hint the caller to call xe_guc_ct_send_flush().
> > 
> > > message into the H2G ring but defers publishing the descriptor and
> > > ringing the doorbell. Add xe_guc_ct_send_flush() to publish pending
> > > writes and notify GuC once per batch. Wire this into the pagefault
> > > producer via new ack_fault_begin/ack_fault_end callbacks and CT lock
> > > wrappers.
> > > 
> > > To avoid excessive flush latency while still amortizing MMIO costs, use
> > > a simple periodic flush heuristic for GuC pagefault acks: batch most
> > > acks as write-only and force a publish at a fixed interval (e.g., every
> > > 16th ack), with a final flush at end-of-batch.
> > > 
> > > Also increase the H2G CTB size to 16K to better absorb bursts.
> > > 
> > > Assisted-by: ChatGPT:gpt-5 # Documentation
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_ct.c          | 95 +++++++++++++++++++------
> > >  drivers/gpu/drm/xe/xe_guc_ct.h          | 36 +++++++++-
> > >  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 32 ++++++++-
> > >  drivers/gpu/drm/xe/xe_guc_types.h       |  6 ++
> > >  drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++-
> > >  drivers/gpu/drm/xe/xe_pagefault_types.h | 14 ++++
> > >  6 files changed, 170 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index fe70c0fd85c5..686611ddabc8 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -265,7 +265,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> > >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> > >  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > >  #define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > > -#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > > +#define CTB_H2G_BUFFER_SIZE	(SZ_16K)
> > >  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
> > >  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> > >  #define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
> > > @@ -939,7 +939,7 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> > >  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
> > >  
> > >  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > > -		     u32 ct_fence_value, bool want_response)
> > > +		     u32 ct_fence_value, bool want_response, bool write_only)
> > >  {
> > >  	struct xe_device *xe = ct_to_xe(ct);
> > >  	struct xe_gt *gt = ct_to_gt(ct);
> > > @@ -956,7 +956,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
> > >  
> > >  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > > -		u32 desc_tail = desc_read(xe, h2g, tail);
> > >  		u32 desc_head = desc_read(xe, h2g, head);
> > >  		u32 desc_status;
> > >  
> > > @@ -966,12 +965,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  			goto corrupted;
> > >  		}
> > >  
> > > -		if (tail != desc_tail) {
> > > -			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> > > -			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
> > > -			goto corrupted;
> > > -		}
> > 
> > Could we keep that check when !write_only?
> > 
> 
> Not without a bigger change. Consider write_only followed by
> !write_only, the tail != desc_tail immediately mismatches.
> 
> We'd have to add 3 states:
> 
> - Normal (check)
> - Defer flush (no check)
> - Issue flush (no check)
> 
> Not sure if it is worth the complexity, but change add if this if you
> want.

Agreed, probably not worth the extra complexity in that case.

Francois

> 
> > > -
> > >  		if (tail > h2g->info.size) {
> > >  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> > >  			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> > > @@ -993,7 +986,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  			      (h2g->info.size - tail) * sizeof(u32));
> > >  		h2g_reserve_space(ct, (h2g->info.size - tail));
> > >  		h2g->info.tail = 0;
> > > -		desc_write(xe, h2g, tail, h2g->info.tail);
> > > +		if (!write_only) {
> > > +			xe_device_wmb(xe);
> > > +			desc_write(xe, h2g, tail, h2g->info.tail);
> > > +		}
> > >  
> > >  		return -EAGAIN;
> > >  	}
> > > @@ -1024,14 +1020,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  	/* Write H2G ensuring visible before descriptor update */
> > >  	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
> > >  	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> > > -	xe_device_wmb(xe);
> > > -
> > >  	/* Update local copies */
> > >  	h2g->info.tail = (tail + full_len) % h2g->info.size;
> > >  	h2g_reserve_space(ct, full_len);
> > >  
> > >  	/* Update descriptor */
> > > -	desc_write(xe, h2g, tail, h2g->info.tail);
> > > +	if (!write_only) {
> > > +		xe_device_wmb(xe);
> > > +		desc_write(xe, h2g, tail, h2g->info.tail);
> > > +	}
> > >  
> > >  	/*
> > >  	 * desc_read() performs an VRAM read which serializes the CPU and drains
> > > @@ -1052,7 +1049,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  
> > >  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> > >  				u32 len, u32 g2h_len, u32 num_g2h,
> > > -				struct g2h_fence *g2h_fence)
> > > +				struct g2h_fence *g2h_fence, bool write_only)
> > >  {
> > >  	struct xe_gt *gt = ct_to_gt(ct);
> > >  	u16 seqno;
> > > @@ -1112,7 +1109,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> > >  	if (unlikely(ret))
> > >  		goto out_unlock;
> > >  
> > > -	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
> > > +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence, write_only);
> > >  	if (unlikely(ret)) {
> > >  		if (ret == -EAGAIN)
> > >  			goto retry;
> > > @@ -1120,7 +1117,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> > >  	}
> > >  
> > >  	__g2h_reserve_space(ct, g2h_len, num_g2h);
> > > -	xe_guc_notify(ct_to_guc(ct));
> > > +	if (!write_only)
> > > +		xe_guc_notify(ct_to_guc(ct));
> > >  out_unlock:
> > >  	if (g2h_len)
> > >  		spin_unlock_irq(&ct->fast_lock);
> > > @@ -1196,7 +1194,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
> > >  
> > >  static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  			      u32 g2h_len, u32 num_g2h,
> > > -			      struct g2h_fence *g2h_fence)
> > > +			      struct g2h_fence *g2h_fence, bool write_only)
> > >  {
> > >  	struct xe_gt *gt = ct_to_gt(ct);
> > >  	unsigned int sleep_period_ms = 1;
> > > @@ -1209,9 +1207,10 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  
> > >  try_again:
> > >  	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> > > -				   g2h_fence);
> > > +				   g2h_fence, write_only);
> > >  
> > >  	if (unlikely(ret == -EBUSY)) {
> > > +		xe_guc_ct_send_flush(ct);
> > >  		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
> > >  						&sleep_period_ms, &sleep_total_ms))
> > >  			goto broken;
> > > @@ -1235,7 +1234,8 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
> > >  
> > >  	mutex_lock(&ct->lock);
> > > -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> > > +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence,
> > > +				 false);
> > >  	mutex_unlock(&ct->lock);
> > >  
> > >  	return ret;
> > > @@ -1283,25 +1283,76 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  	return ret;
> > >  }
> > >  
> > > +/**
> > > + * xe_guc_ct_send_locked() - submit a GuC CT H2G message with CT lock held
> > > + * @ct: GuC CT object
> > > + * @action: payload dwords (HxG header dword is expected at @action[-1])
> > > + * @len: number of payload dwords in @action
> > > + * @write_only: defer publishing/doorbell for batching
> > > + *
> > > + * Sends a single H2G message to the GuC CT buffer while the caller already
> > > + * holds @ct->lock.
> > > + *
> > > + * If @write_only is false, the function completes the submission immediately:
> > > + * it makes the payload visible to the device, updates the H2G descriptor and
> > > + * rings the GuC doorbell.
> > > + *
> > > + * If @write_only is true, the message payload is copied into the H2G ring and
> > > + * the software tail is advanced, but the descriptor update and doorbell are
> > > + * deferred so multiple messages can be batched. In this mode, the caller must
> > > + * eventually call xe_guc_ct_send_flush() (still holding @ct->lock) to publish
> > > + * the descriptor and notify the GuC. On internal retry paths (-EBUSY), the
> > > + * implementation may force a flush to ensure forward progress.
> > > + *
> > > + * Return: 0 on success, negative errno on failure.
> > > + *
> > > + * Locking:
> > > + *   Must be called with @ct->lock held.
> > > + */
> > >  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > > -			  u32 g2h_len, u32 num_g2h)
> > > +			  bool write_only)
> > >  {
> > >  	int ret;
> > >  
> > > -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL);
> > > +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, write_only);
> > >  	if (ret == -EDEADLK)
> > >  		kick_reset(ct);
> > >  
> > >  	return ret;
> > >  }
> > >  
> > > +/**
> > > + * xe_guc_ct_send_flush() - flush pending GuC CT H2G writes
> > > + * @ct: GuC CT instance
> > > + *
> > > + * Some callers batch multiple H2G writes using xe_guc_ct_send_locked() in
> > > + * "write-only" mode (i.e., queue the message payloads but defer ringing the
> > > + * doorbell / updating the CT descriptor). This helper completes the submission
> > > + * by ensuring the payload writes are visible to the device, updating the H2G
> > > + * descriptor, and ringing the GuC CT doorbell.
> > > + *
> > > + * Locking:
> > > + *   Must be called with @ct->lock held.
> > > + */
> > > +void xe_guc_ct_send_flush(struct xe_guc_ct *ct)
> > > +{
> > > +	struct xe_device *xe = ct_to_xe(ct);
> > > +	struct guc_ctb *h2g = &ct->ctbs.h2g;
> > > +
> > > +	lockdep_assert_held(&ct->lock);
> > > +
> > > +	xe_device_wmb(xe);
> > > +	desc_write(xe, h2g, tail, h2g->info.tail);
> > > +	xe_guc_notify(ct_to_guc(ct));
> > > +}
> > > +
> > >  int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
> > >  {
> > >  	int ret;
> > >  
> > >  	lockdep_assert_held(&ct->lock);
> > >  
> > > -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL);
> > > +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, false);
> > >  	if (ret == -EDEADLK)
> > >  		kick_reset(ct);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 767365a33dee..b30c1f34be39 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -54,7 +54,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > >  int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  		   u32 g2h_len, u32 num_g2h);
> > >  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > > -			  u32 g2h_len, u32 num_g2h);
> > > +			  bool write_only);
> > >  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >  			u32 *response_buffer);
> > >  static inline int
> > > @@ -63,6 +63,8 @@ xe_guc_ct_send_block(struct xe_guc_ct *ct, const u32 *action, u32 len)
> > >  	return xe_guc_ct_send_recv(ct, action, len, NULL);
> > >  }
> > >  
> > > +void xe_guc_ct_send_flush(struct xe_guc_ct *ct);
> > > +
> > >  /* This is only version of the send CT you can call from a G2H handler */
> > >  int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action,
> > >  			       u32 len);
> > > @@ -87,4 +89,36 @@ static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
> > >  	wake_up_all(&ct->wq);
> > >  }
> > >  
> > > +/**
> > > + * xe_guc_ct_lock() - take the GuC CT mutex
> > > + * @ct: GuC CT object
> > > + *
> > > + * Wrapper around mutex_lock(&ct->lock) for cases where CT operations need to be
> > > + * performed from contexts that want an explicit "CT locked" pair without
> > > + * exporting the lock itself.
> > > + *
> > > + * Return/Locking:
> > > + *   Acquires @ct->lock.
> > > + */
> > > +static inline void xe_guc_ct_lock(struct xe_guc_ct *ct)
> > > +__acquires(&ct->lock)
> > > +{
> > > +	mutex_lock(&ct->lock);
> > 
> > Now it would be cleaner to add "#include <linux/mutex.h>" in xe_guc_ct.h.
> > 
> 
> Sure.
> 
> Matt
> 
> > Francois
> > 
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_ct_unlock() - release the GuC CT mutex
> > > + * @ct: GuC CT object
> > > + *
> > > + * Counterpart to xe_guc_ct_lock().
> > > + *
> > > + * Locking:
> > > + *   Releases @ct->lock.
> > > + */
> > > +static inline void xe_guc_ct_unlock(struct xe_guc_ct *ct)
> > > +__releases(&ct->lock)
> > > +{
> > > +	mutex_unlock(&ct->lock);
> > > +}
> > > +
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > > index 2470faf3d5d8..8f8210a732e9 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > > @@ -10,6 +10,22 @@
> > >  #include "xe_pagefault.h"
> > >  #include "xe_pagefault_types.h"
> > >  
> > > +#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
> > > +
> > > +static void guc_ack_fault_begin(void *private)
> > > +{
> > > +	struct xe_guc *guc = private;
> > > +
> > > +	xe_guc_ct_lock(&guc->ct);
> > > +
> > > +	BUILD_BUG_ON(((XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1) &
> > > +		     XE_GUC_PAGEFAULT_FLUSH_PERIOD) != 0);
> > > +
> > > +	/* Ack the 2nd, then 18th, etc... */
> > > +	guc->pagefault_ack_counter =
> > > +		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1;
> > > +}
> > > +
> > >  static void guc_ack_fault(struct xe_pagefault *pf, int err)
> > >  {
> > >  	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> > > @@ -36,12 +52,26 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
> > >  		FIELD_PREP(PFR_PDATA, pdata),
> > >  	};
> > >  	struct xe_guc *guc = pf->producer.private;
> > > +	bool write_only = guc->pagefault_ack_counter++ &
> > > +		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
> > > +
> > > +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
> > > +			      write_only);
> > > +}
> > > +
> > > +static void guc_ack_fault_end(void *private)
> > > +{
> > > +	struct xe_guc *guc = private;
> > >  
> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > +	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
> > > +		xe_guc_ct_send_flush(&guc->ct);
> > > +	xe_guc_ct_unlock(&guc->ct);
> > >  }
> > >  
> > >  static const struct xe_pagefault_ops guc_pagefault_ops = {
> > > +	.ack_fault_begin = guc_ack_fault_begin,
> > >  	.ack_fault = guc_ack_fault,
> > > +	.ack_fault_end = guc_ack_fault_end,
> > >  };
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > > index 31a2acb63ac3..3dbcb1331690 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > > @@ -122,6 +122,12 @@ struct xe_guc {
> > >  	struct xe_reg notify_reg;
> > >  	/** @params: Control params for fw initialization */
> > >  	u32 params[GUC_CTL_MAX_DWORDS];
> > > +
> > > +	/**
> > > +	 * @pagefault_ack_counter: Counter to determine when periodically ack
> > > +	 * pagefaults in a batch.
> > > +	 */
> > > +	u32 pagefault_ack_counter;
> > >  };
> > >  
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > > index caa39a024ae6..917884c49e1d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -412,6 +412,10 @@ static bool xe_pagefault_try_chain(struct xe_pagefault_queue *pf_queue,
> > >  			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
> > >  				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > >  
> > > +			if (pf->producer.private !=
> > > +			    pf_work->cache.pf->producer.private)
> > > +				continue;
> > > +
> > >  			xe_gt_stats_incr(pf->gt,
> > >  					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
> > >  					 1);
> > > @@ -585,6 +589,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> > >  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > >  
> > >  	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
> > > +		const struct xe_pagefault_ops *ops = pf->producer.ops;
> > > +		void *private = pf->producer.private;
> > >  		struct xe_gt *gt = pf->gt;
> > >  		u32 asid = pf->consumer.asid;
> > >  		int err = 0;
> > > @@ -622,11 +628,14 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> > >  			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > >  		xe_assert(xe, pf == pf_work->cache.pf);
> > >  
> > > +		ops->ack_fault_begin(private);
> > >  		while (pf) {
> > >  			xe_assert(xe, pf->consumer.alloc_state ==
> > >  				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > > +			xe_assert(xe, ops == pf->producer.ops);
> > > +			xe_assert(xe, gt == pf->gt);
> > >  
> > > -			pf->producer.ops->ack_fault(pf, err);
> > > +			ops->ack_fault(pf, err);
> > >  
> > >  			spin_lock_irq(&pf_queue->lock);
> > >  
> > > @@ -654,6 +663,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> > >  					XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
> > >  			spin_unlock_irq(&pf_queue->lock);
> > >  		}
> > > +		ops->ack_fault_end(private);
> > >  
> > >  		if (time_after(jiffies, threshold)) {
> > >  			queue_work(xe->usm.pagefault_wq, w);
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > index a1fff0e47fa5..efeba5c3a58b 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > @@ -33,6 +33,13 @@ enum xe_pagefault_type {
> > >  
> > >  /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > >  struct xe_pagefault_ops {
> > > +	/**
> > > +	 * @ack_fault_begin: Ack fault begin
> > > +	 * @private: producer private data
> > > +	 *
> > > +	 * Page fault producer begins acknowledgment from the consumer.
> > > +	 */
> > > +	void (*ack_fault_begin)(void *private);
> > >  	/**
> > >  	 * @ack_fault: Ack fault
> > >  	 * @pf: Page fault
> > > @@ -42,6 +49,13 @@ struct xe_pagefault_ops {
> > >  	 * sends the result to the HW/FW interface.
> > >  	 */
> > >  	void (*ack_fault)(struct xe_pagefault *pf, int err);
> > > +	/**
> > > +	 * @ack_fault_end: Ack fault end
> > > +	 * @private: producer private data
> > > +	 *
> > > +	 * Page fault producer ends acknowledgment from the consumer.
> > > +	 */
> > > +	void (*ack_fault_end)(void *private);
> > >  };
> > >  
> > >  /**
> > > -- 
> > > 2.34.1
> > > 
