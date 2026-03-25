Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2334D109C059
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 19:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02F810E851;
	Wed, 25 Mar 2026 19:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TujoluiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EC110E851
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 19:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774465982; x=1806001982;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lfdDBrB33dM3YHtWsjaL329x1BaOgXtpozrut0gCrEI=;
 b=TujoluiFSnBRdB3zx57p+wcd6EXTuVRm/RXejmjJOBQZf2m5wWy4E2+B
 7a5VXgMuUegpINTEadjz7/7duZYBzKZiwm//W2B6rERDmFJ0rgvMzRp8V
 2ui+KQ1DrScO0CdBnbTjENrFrH5JfQwL4YMuSYjgiAtrWivGCFj0ksUJt
 aXU5hjCPnZ0Dpol9Vbgj5CBdyRaArplWWLiLJEA+wewqoyY18ae6jpior
 wR9wD5CufUvIklVbCdlvAS1hcqHzoYbSAYXoGlvBo75TotlUJ7Hurq+CB
 hfQJRmFG7Ri+xqNloCzFZZwOvGfFiMC52YMh0YoBllN/LXsXEBJdzh6ja Q==;
X-CSE-ConnectionGUID: iFm59sesRnuO5EPqnaoMfQ==
X-CSE-MsgGUID: sfO9AIB3T7qphrX55OW7vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75401781"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75401781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 12:13:02 -0700
X-CSE-ConnectionGUID: A6kTOc0bREGXC7YNKaSNLQ==
X-CSE-MsgGUID: 8RUSFR+KRwarI2m1tL4How==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="228839568"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 12:13:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 12:13:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 12:13:00 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 12:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvv3ZcHT+o1WxWkJUMOvlFfxK/oxxVcc50TQtxeBZSwzOyJxsgcowJ0pUcblj3x8tW7Rp0E2nYZ+R0lprK+/qe9LGK8wX/j6GQNic5ChMXoeJpYHyCUuNz+YZD4+ZsfEXLALV+zX0nLPk1MM7YBfCKhM/cFI0L0HKmIxsu6P7bY4jpgMckhqPQ8lxhkvIz2qsPheWEsHRAbxm2qfdc2gqZS58j/axjgH5WfrgIhEFtRlihBWEWQ4VBgwCvQ9OH2C+ul17K+Pda41IpfHij55TnNNonJLsZ5Rm9TdFIoAsWxBUi+KF3vm3ywyu9HnZCAbfqdipyKVws9Dp1SWnbuDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsyXDlvOsSFyDwCcyp7E1PrXd8oPJfxPTSceIzSfUZQ=;
 b=kLlK6r0VOI9XGDjNqFvEs+LnvQZXkUlNxjv+hgt6oW683ZTaPZnhNWfEU0rmjo/iBuyioUbJ2xpFnDRIF7FFQy30M1Yr9elivBBBBLPSj9FM3uSQ2nUGP1ZSSDcDpzTR8jkWTSZkWZ9LgDTjAFs1J7N8umShmBZxnAbp7Iz7VXOqZ0Pn656TfeJcBJa+O1t8Pl1VZK5RqufjwN1YGcnqPzZ2iTBhhMgh0ddYYutuvmxiVAalY8dFlT5wdscYD/o7MtgP7+mvCG+GnwmMl9BUby+ml/YTVMeebqEKYWLIXFSzj/C5bzbwQlXzhz+zYomMF5uKak1BUbrnV3ZRC+4IUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 19:12:53 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9745.012; Wed, 25 Mar 2026
 19:12:53 +0000
Date: Wed, 25 Mar 2026 12:12:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v12 4/7] drm/xe/xe_sysctrl: Add System Controller
 initialization support
Message-ID: <acQzryCoU9zL3Vie@soc-5CG1426VCC.clients.intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
 <20260325120030.510480-13-anoop.c.vijay@intel.com>
 <acQXkNAorUC7EtnH@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acQXkNAorUC7EtnH@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW3PR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:303:2a::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d92b85-1416-446f-644c-08de8aa28362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: uBDL3LCapLvth9+oVqOz0GU1mAw2PQPrnDXyl/U2n+zUEVrjohWgQR6RPagqDGRev9xnXVx1c5oCaGF5LCRmSkebHR0Gl1I+Pp6uL6uWvBuLz9iJ3ZHzRk5xSmXNUZbVXiQ4/Z5oLD1Ckb7ooHADrcGpGXUhhERAf6OTgz/2IpeFYnsc1isKd6sT/TwfzkDd4m8M6s2lebLI+D6UmcQQGp7jDJK2DWlt94gD+oVUTfS8gVfCbBHjTHz5W9lhu4RfmFjfSBRZX1OT43kxnFkj2fsNo5dWnFUUr0kqyZ0BsnPa44PaaEdmqCqC6UMCcAJLt3FGTvIGS/5u80VUabbZE9K7ujjo95Pf+0a92Iu8oIckO31zDGI7XGYwjFUydYN62MmV010Vj9eRMP2CTOg0flMpF8n1SPU7XZMDtAeV/o+WatR8z+EZ5k1rP/M2Mo0h+tv+dV5E+jruYCpWfDAK35HwlqZ1HX3FRDDEn5LwO8qZQcsnhjQJmxTTiOZkyDaAdRXduCn/2mg4vlyBezl41Gd/FE6NdgbKH4VzS6hU885Dzl+odGah3i8puLfcr2lrdFWZH5/U1OwFtJyK0suO675i74rNleCQBRjlDtDUIb0XIxpPrfbw2oNcmpQLrn4OM7kUuuYRgegmUeEVpDLUZ0rsNfZ/XSEScL1AAdFZlmxlVwOtiUWsRjfVNwTJru4C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEpyN2ZqbklLditKOWRUSmhuT1N3TzBqbFpyaWJETHhEY0dEZ1U1c3ZkRDJI?=
 =?utf-8?B?YXFzUmdxZFZQbk9ENFdpdHNaNXBLd0VqeHEwSjlTMEY1TTVSSUJwYjJOMjNw?=
 =?utf-8?B?UzkvQ05FK3RmNEZiUUpMS0pnenFpaGFUUWxxcCticTk0c2JpejRicmxKU3pY?=
 =?utf-8?B?ejQ3UVdNa2Q0Rjk1QzB0NjRsT1JpbnFzRFhQZXlMS0MzbXdscVlRcFAzZlZa?=
 =?utf-8?B?TnRjaU5ldllUTVpURWNQWXNJdm9DRUxGdzJYWUxLSnYwTkpXcDJnNSs2elJ0?=
 =?utf-8?B?c0JaZHhxU2dvTzJFbEh3WW1VSEgxNmxkQ2tPdEUwbGRqS0ZRNlBwTG94Znd5?=
 =?utf-8?B?ajdpaC9wZ0RjbEhib1ZVYWF4RUs4ZlBzTVFkVDR0OVllSWx5dDNvNVpZVjlt?=
 =?utf-8?B?VU5JZEZ5d2tyZm5oZEI2OHR5L3luY1htN2w1ZTlZNUI3ZW40RUhIdFF1U2lt?=
 =?utf-8?B?UXNLUTBNdVYxTnVCMmVKOElzZlVEQ05zb3RyUG1ubkQ0S2J3aGtKUlFWYjJo?=
 =?utf-8?B?aWZVejlvbk4xNjlvTWc4OXBObFJpZWJrZG9VdmplVWRXcUF5NDh0bHZobXZm?=
 =?utf-8?B?K2dkMnJ2YU1TMzY1ZGI5ZmRhYXJGWWN1a0xpZ1MvaU1rZ3cwZG5BaXRxcHFi?=
 =?utf-8?B?UjArU2U3RHpDNDBMMWpNTXFqcU9pMWpOOVQrdllKM3ZxczQyWThRMTFtZ24y?=
 =?utf-8?B?Z3FQNlNJczkvV0NaSTlMY0FldVBaSytwRmdrN0YzMTFIeU1hZmdyWkxqQjI2?=
 =?utf-8?B?L0Z5RERLRHFxSHI2a0w1MjlJb2FNSHJtVmJhZmdmcTRFV2Q5blF2QzRFWlMr?=
 =?utf-8?B?WFhGSDN2dDdwbHI5MHkyVU0xZ3ZxVnUyZ1BaaHRNQ2V0blhjY2laamM0Nnh1?=
 =?utf-8?B?Y0RzcFFiQlRCTmZnN0pFdWhjNHBvVE5Mc1VsLzZ3ZUhMR0l6SjgwRG1wTzhJ?=
 =?utf-8?B?L3huWFAzdHpyMEpLTnMzYzVpNDFsY0IwNlZNc0NYL1hrdjJ6azNSUTVnZ2ZZ?=
 =?utf-8?B?M0M5UGhkOE1jcnNNZFdjUjJzWlBsbW1zb1oya1FJWkhmLzVyR0JtNERTdk5a?=
 =?utf-8?B?RHZrNU1Ud2x0eXZoVUduWXpvSm9ZcnMyVGFEOUpmNUNRRUQxM2RrcTU3QXZ4?=
 =?utf-8?B?ck9qMElCbWNZYWRJc0hEQmJCekNXZVRRaC9vNUdzSEVLSjFBcWF5WXdEc2po?=
 =?utf-8?B?OEVjT3orQTRhV1hnYUduS3R2YkN5NHE3alBWVWV1MGcxR0pBcHhnN2VsZGVB?=
 =?utf-8?B?Z2x6bUFHeWQ4SitUN3Y1bmVuVjNXWm1FT3IycElLMndiQ3Qza1k3QmR4WG8y?=
 =?utf-8?B?RTZoMGo0QUJzZEFhVVFJUVBMYjVqa2g2R1RFQUtVUFhhbWo0MmUxTURWZWhL?=
 =?utf-8?B?RjEzVFh0aTRicFlxSkJ0WEpKRFVqMmZuR1QxTTNma091U3RtQjZ2NUZERk1w?=
 =?utf-8?B?V09zQ3MrTHVueTlicXFwL2RIaGJobGxsc0RZSHFKQ2JoNkZaV0dRR2VlM2d1?=
 =?utf-8?B?NmgvUzZ5TXJWZzFKZ28zZ2JlZkxGWCtJTGJ3N0RwVCtjWEFNZFZGa0RiRXkz?=
 =?utf-8?B?SnBUcHhoalRIRjRzNUpDaWZjSERtNDRCT0lLdmExQjU2RTVrbXQ0cnhRT09W?=
 =?utf-8?B?eTRQSTNUTGFrTFN5dXRUeVUxNkpqaEttUVpUVDFpRWxPZC9FMDVsSFhYRGhH?=
 =?utf-8?B?WTN5QjVxRmdrSlVpZUtmeGpPcllReDBJWmNjZjNpQUJFZDNicjV1TThoZXlN?=
 =?utf-8?B?WUNxKytrY3I5T0k4alZKaXdFbFMyYmtLa3BDNHBpZjRwNmZUdzMyRWxKN2lH?=
 =?utf-8?B?NisxVEhPeVlrYzZseWx2ZGc1ZXBoc3JvT3pGTUhvL1lnaWoxN093VDB5SjdE?=
 =?utf-8?B?ZkF3WjFaa0I1UUROT3hSQTFuOTFqVk94OXB4eXV0Mk5qUlFXQlBsYjd5alhs?=
 =?utf-8?B?VENHNXBvRW1IaGlsODRtYjFXempnc1E0SGVtbEh3LzRRVzF2Q0RLWHgyVFB4?=
 =?utf-8?B?RkZoWVErWXcrS3JJZUcwM09Sc3BvZEpDWUgyK1hOeDhVaUtVZTFCTG5LWEZR?=
 =?utf-8?B?OHBiTHkwMG9qblF0SHIzSzQ3S1F5RkFzNmZGNHlNbEZTM1d5aGZ1QXpwdHQz?=
 =?utf-8?B?R1BTMDliaWNva0dLWitpSkpyLzlGQ2xkay9FK0hFc3JkK1lheTYrZE85VHk0?=
 =?utf-8?B?WWI4a29aYXNjQ1I2a2JLQ0V1U3BqQmtSTWFHaFczZDAzZW01c2lIUGwrWHJK?=
 =?utf-8?B?N0NiaXJnbUZJU0V3V3hqaSsvbnBqeklNNXd1NDlDV2dHUXloWnJqU3VNZVRv?=
 =?utf-8?B?ZFdmbUR0czd5UGtncGE2WElCR0NPeHhtNHRyb2w1cTJyRmZ1OWdPOVIxd1Ir?=
 =?utf-8?Q?XgWuKqiDq6LbF/10VV3dl20jSMZb0I1WlWJ92?=
X-Exchange-RoutingPolicyChecked: CEznPyaS7k4SJmMx4C977Zfp03fQL/0bQPvkFtEUG+nYGZDjiqONTQsk807ym66yokO6U3wfnyWLteNoAzrZ7xaOrGKKI/2jAx63zT6BwYQOTNM1SGVrYEEyqJNQSNeJxmhkOf3SXz/PIl72Ckmp8pN6toDDVkXDEQd6fIFmpnw+l2LYCx69qB8b6cqUN3wR37kRzFQfziAFleI+y1/iywNQs1ispmJQrG7dE5GEUDsm2nLFT0qAR4RR3Wj8rAANvugHlPYHwOCbYfPrYzlIrF2zadXmLqmOjJapjoYQHpgjDEQjFBGp6a1ZSL6wxP7JlgSjgCzhKC39cAErc6XOCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d92b85-1416-446f-644c-08de8aa28362
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:12:52.9714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ExZd3Vb2FGXyK97y22aQV5JsWLBzLgsGwaH/CtS7WyDnSWpr0+fE5U4njXhmD7PGsIOTJ8Dd8FkKNmZj4/5FxawG/SxEyY/PEOi3C8LWDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
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

On Wed, Mar 25, 2026 at 10:12:48AM -0700, Umesh Nerlige Ramappa wrote:
>On Wed, Mar 25, 2026 at 05:00:31AM -0700, Anoop, Vijay wrote:
>>From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>Add initialization and cleanup infrastructure for System Controller
>>subsystem and integrate it into xe device probe path.
>>
>>During initialization, platform support is checked via has_sysctrl
>>capability flag and the mailbox region is configured through SoC
>>remapper interface.
>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v8: (Matt, Michal, Shuicheng)
>>- Fixed include order
>>- Added VF check
>>- Converted runtime checks to assertions
>>- Added sc_to_xe() helper
>>- Fixed kernel-doc syntax
>>
>>v10: (Riana, Anshuman)
>>- Updated sysctrl documentation
>>- Cleaned up commit message
>>- Fixed mutex lifetime management
>>---
>>drivers/gpu/drm/xe/Makefile     |  1 +
>>drivers/gpu/drm/xe/xe_device.c  |  5 ++
>>drivers/gpu/drm/xe/xe_sysctrl.c | 82 +++++++++++++++++++++++++++++++++
>>drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
>>4 files changed, 109 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>>create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index 49de1c22a469..b2d44e7169dd 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
>>	xe_step.o \
>>	xe_survivability_mode.o \
>>	xe_sync.o \
>>+	xe_sysctrl.o \
>>	xe_tile.o \
>>	xe_tile_sysfs.o \
>>	xe_tlb_inval.o \
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index c8e91ff464a7..6df85a240f83 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -65,6 +65,7 @@
>>#include "xe_survivability_mode.h"
>>#include "xe_sriov.h"
>>#include "xe_svm.h"
>>+#include "xe_sysctrl.h"
>>#include "xe_tile.h"
>>#include "xe_ttm_stolen_mgr.h"
>>#include "xe_ttm_sys_mgr.h"
>>@@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
>>	if (err)
>>		goto err_unregister_display;
>>
>>+	err = xe_sysctrl_init(xe);
>>+	if (err)
>>+		goto err_unregister_display;
>>+
>>	err = xe_device_sysfs_init(xe);
>>	if (err)
>>		goto err_unregister_display;
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>>new file mode 100644
>>index 000000000000..fd23f345d8c7
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>>@@ -0,0 +1,82 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#include <linux/device.h>
>>+#include <linux/mutex.h>
>>+
>>+#include <drm/drm_managed.h>
>>+
>>+#include "regs/xe_sysctrl_regs.h"
>>+#include "xe_assert.h"
>>+#include "xe_device.h"
>>+#include "xe_mmio.h"
>>+#include "xe_printk.h"
>>+#include "xe_soc_remapper.h"
>>+#include "xe_sriov.h"
>>+#include "xe_sysctrl.h"
>>+#include "xe_sysctrl_mailbox.h"
>>+#include "xe_sysctrl_types.h"
>>+
>>+/**
>>+ * DOC: System Controller (sysctrl)
>>+ *
>>+ * System Controller (sysctrl) is a firmware-managed entity on Intel dGPUs
>>+ * responsible for selected low-level platform management functions.
>>+ * Communication between driver and System Controller is performed
>>+ * via a mailbox interface, enabling command and response exchange.
>>+ *
>>+ * This module provides initialization and support code for interacting
>>+ * with System Controller through the mailbox interface.
>>+ */
>>+static void sysctrl_fini(void *arg)
>>+{
>>+	struct xe_device *xe = arg;
>>+
>>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>>+}
>>+
>>+/**
>>+ * xe_sysctrl_init() - Initialize System Controller subsystem
>>+ * @xe: xe device instance
>>+ *
>>+ * Entry point for System Controller initialization, called from xe_device_probe.
>>+ * This function checks platform support and initializes the system controller.
>>+ *
>>+ * Return: 0 on success, error code on failure
>>+ */
>>+int xe_sysctrl_init(struct xe_device *xe)
>>+{
>>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>+	struct xe_sysctrl *sc = &xe->sc;
>>+	int ret;

Instead of the earlier code, let's just do this.

	if (!xe->info.has_soc_remapper_sysctrl)
		return 0;

This will make sure probe works fine on platforms where soc remapper 
sysctrl is not present.

>>+
>>+	if (!xe->info.has_sysctrl)
>>+		return 0;
>>+
>>+	if (IS_SRIOV_VF(xe))
>>+		return 0;
>>+
>>+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);

Delete the assert altogether here.

Umesh

>
>Ashutosh pointed out that this is failing for other platforms that do 
>not support SoC remapper. Let's change this assert back to how it was 
>here - 
>https://patchwork.freedesktop.org/patch/701662/?series=159554&rev=7
>
>if the function pointer is NULL, just error out.
>
>Thanks,
>Umesh
>
>
>>+
>>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>>+
>>+	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
>>+	if (ret)
>>+		return ret;
>>+
>>+	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>>+	if (!sc->mmio)
>>+		return -ENOMEM;
>>+
>>+	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>>+	sc->mmio->adj_offset = SYSCTRL_BASE;
>>+	sc->mmio->adj_limit = U32_MAX;
>>+
>>+	ret = devm_mutex_init(xe->drm.dev, &sc->cmd_lock);
>>+	if (ret)
>>+		return ret;
>>+
>>+	return 0;
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>>new file mode 100644
>>index 000000000000..d5d8735038ae
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>>@@ -0,0 +1,21 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_SYSCTRL_H_
>>+#define _XE_SYSCTRL_H_
>>+
>>+#include <linux/container_of.h>
>>+
>>+#include "xe_device_types.h"
>>+#include "xe_sysctrl_types.h"
>>+
>>+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>>+{
>>+	return container_of(sc, struct xe_device, sc);
>>+}
>>+
>>+int xe_sysctrl_init(struct xe_device *xe);
>>+
>>+#endif
>>-- 
>>2.43.0
>>
