Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBADC982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 22:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4110E86F;
	Tue, 22 Sep 2026 22:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eS4G8yBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC0110E86F
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 22:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790116806; x=1821652806;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vans3t/sbOUn+171GPn3Ay7eU4vGICTlULDnmMp+kDU=;
 b=eS4G8yBuP+SWWrCXGCtI9YFjEDezJEbYT2ULAizLxPQsnfeSB/g5sZP7
 IAE9mAGRQIN/iMDfSyyuMB+FR2aYI5GqmElsQzLj1iCJaZMM1L4xK4VGQ
 qGDAlmPqLOe1G+2Qszn87TUWt11678sLlQclJg7poXK7RTKG+BJ6fK00+
 TnkNBhFGK6fBoBahd+bbf22FKJI1es4QYnn4+dLv/ufDpjFQm1nOtk8q6
 CO3dsE0j9WOPnC02YF2GbpewTt9g5iICSSVgi4nvFA4UCwgdDioLilau4
 Bmc2zZz3rkqhyF8m3JI3XS+S5TWRZnrq/xpxojaKsLuv1WHYtMU1BoWat Q==;
X-CSE-ConnectionGUID: 6IE4a99fT0qyyb/8Uu8MJw==
X-CSE-MsgGUID: 7JyX1pmcQPyOKC45IRCmXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93264771"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="93264771"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 15:40:05 -0700
X-CSE-ConnectionGUID: t1r8+zKARdG6JHlIWqXK0A==
X-CSE-MsgGUID: 0YwmRTRXSnSG+LLKjk77oA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 15:40:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 15:40:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 15:40:04 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 15:40:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuKI8mjPO6VNopeDQPVccoccBpl8wyKbrbhUCXJfqEpKGi15hdgk7dMx+uz567OYk28dvd6stv6Ra6pubJ+fwc9L3dmCQZ49GkkO3cMUrKAOMysfq/50jpktcdCoX4VmMUWRvExHR8YQnNN2vgL+sAaS9nFTtdpyuOeQJO17Mfx04dvz0xO9fH6hcJf/qcjFDJvaMoYeXEZUUOgveyr9ewupTgA4IcDEkTXOR0+jkaWF3LQaovHqlR1exqeucqCYJ2gfn+45OAvpDgIdSR81Z/iraQhUzhNB+1SJbFIaxR5yhdxSpeK1fTch/bksleotJNsd/OYaQSJk/cAApe1Bog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uP76J0IIDdQmSWq7NMTDlgeg3Ye9MnS8nBhtVkDJNgU=;
 b=fNxVd44cJ9GZ+Pb6IOehe2UvarYyGr39oQ/lGGN5THj7bXGtoQSyQDkx0UqYdeHnRHSy7uugusccpw+uknV4LYBMnVOVQa5u5D2y8tGIp8QPYxkIsIM40UPccY5tkwwTx5YC2wBxioFgmK+gcsVuM4gCloUmR+xxx9gcVuz7xpy1aiE3iPodW0W0YKnhKmGEIoQf8igEVpGXN6tArDdY6wOdaGHI3/1jEV2pdrNE7RbA1dBApH7oirFWs0tMJLCpEgOUjxTanYXOw2GJvjBBlOr5w/KJQV9CN//+LsmTB7dZmden3ht34rfi/2Bwd/IsmqsXZuHge7A2K9wOilelKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 22:40:00 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 22:40:00 +0000
Date: Tue, 22 Sep 2026 18:39:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
Message-ID: <arMDpVx4Hf5rJ_WZ@intel.com>
References: <20260918110130.700332-1-marcin.bernatowicz@linux.intel.com>
 <aq1PtZBFIVB4ORrZ@intel.com>
 <fe338ca4-ab57-4adb-9bb5-d81c70467466@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe338ca4-ab57-4adb-9bb5-d81c70467466@linux.intel.com>
X-ClientProxiedBy: SI3PR03CA0003.apcprd03.prod.outlook.com
 (2603:1096:4:297::13) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SN7PR11MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: d18a7245-11ad-42bb-9879-08df18fa6802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: nNc5ccfyhj0cvQa8R9TQxtuGhgL+i0bo3qu1tRW7Zy/mN+L5ungZLQgxZsJtVWpW69GVll9AglUem7XbVAL7P3gQiZJDI1akfuA7EY8Dg9mto6lJ0rcs/73KhoG2LjaDEDdB0p8WoOOASo2t7jeIpamFpqfm2L57xnSWWo/A+O0v/x81QhIhbi0VI6N3Jlg6TF/CK1QW9MsvHQF2EtFfeY/tV4NxtZ4a+n0Q3HQ+VibP/gcXWGRw8Pf4S8Z5fu+PA0iH2ZwXYxN/Eku1JQHU/D0Maqj8QxS7H25GiwgIqzq6k4cMYaB/38BE17iiBazSS5XHrs4btwz6Uw6GArdMvBko32H7IznbLdE34trcI1gUuN1vAJEiivKUbpzxr9jIAPobK8cI9wns5+h15+y7sxiri5X6O2W0kuoiFWPSxOqSTbzIjORypSv2gBsNb4nm8J1WC0tOunXRuZqx0UXKlM+YX0p5Djrn4jWcSWZLSKIsThgadMNhgSbhgfBRlAvFYTv9E3WLou+vSSwZkYYXduKWwyY8ef9A4FtaBu0I1fZ5mUMSinI28BX8MqnQ4phTUcznHMaP1R5veAxwimgqwydZHCB1TYdE27FPCHkboryhw0G/xXS5yftNRJa11mHn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVg4Y1JNVnBTeE5rNGw0UEtBMHVEcFhtMjBsbElNTFF2ZURVRWd4cXRpbEhm?=
 =?utf-8?B?dzJRbFlObXpwbG56SHFaQzF2d29HSjltRlhGQll2Q3JkbWZGMnd1cU90SHdu?=
 =?utf-8?B?Y2FuUlhXZEdIMjFUVDNNSHNRblVPdzNoajVxS2puajZ3eXVjRi9pbG5SYWdR?=
 =?utf-8?B?eWp2LzZBa0xZU0REcWVRaU0vZFdURWJNdG5Mb3JFM3R1K3JmRDNDT1JaOFho?=
 =?utf-8?B?V21rTTJMVWdQMURGRThUMEp1WXloT05tSTZlYkdyV1RuaUVVSmJLZjVoemda?=
 =?utf-8?B?TVBUaEt6YlRYRS8xZDlFS2pQZHFlOGlHRE0zZWJkYXBnSk04bnB1eUhNbnBq?=
 =?utf-8?B?VlVCNHF0TlRUZkw2ODFMUUJXdWkxUVN2ZndEc1l6VEpDZHVkTDBaZS9jUkpC?=
 =?utf-8?B?eTVOSXExNnE0UHVKeWtGanN6MEV0OFM2NG9IMzBPTEpoYnhVbElZbDZrODdS?=
 =?utf-8?B?UmxXZjlwMDQ4QXVUSzVJSFRmR2gvMW5oYW9UZmo1WGpyTnJoRHlsY2g5ZjJZ?=
 =?utf-8?B?RjNwcitTdFdFMXorUm55Z0diSFNIbDJlUWx4THpXOEgxWU9aMXBndVloM3ZF?=
 =?utf-8?B?VHJDSlc4VERrYy9QT0YrVUZFQnV5dE5HZlFtVUpENUdJam43MkR1NnJDYzNY?=
 =?utf-8?B?T1YyV0RhUVhoK2JUODFMYzdETTkrMWxJWGo1Q1ZTcFNYWnhvR3lhbEliTnBN?=
 =?utf-8?B?YjZjVS9TV1prV1hIUFRmSnFWaFdIVlg5cWJXdjR5ZjBBTVhPYUpYVVRPc2FE?=
 =?utf-8?B?UlFRL3FUYVJWNmd1T3htWTREU09IQjMvdzBLcFBBTjdFTHgxaGgxWGQzY1NI?=
 =?utf-8?B?THJzQ0NZbGlzL1NnN28rYWJYWGVDdUo5RkM1MExvei9YZ1YrSVo3MjJVSHcr?=
 =?utf-8?B?SmRiZDJtSWcvK0pGRzNDK0xUeFBDMFZCOGE4dFpVUTdKcHdKWmJKaytSMjE2?=
 =?utf-8?B?dDRiSHhLaWVWb0I3ZEoxWk0xWDNXaXVEY3BGOG9qSmZLOEUvaWJqK3kwcGpB?=
 =?utf-8?B?cTQ0WWJ6NUEyVjhaRlRpbml3WmxYTlhzOXVScG92QkNreXRuQ2NYak4wMTZ0?=
 =?utf-8?B?aTB1M2dwTEZPcVBGZUFDVHJuQTYvTXRKSXBHcThTNWRqSzJGWXBnYUd4bSsv?=
 =?utf-8?B?MUtYSE5aVUYvbUdvRk93N2czbCtCK01OOVpsT0crZVltdjRwQmZmaWFxL1Qw?=
 =?utf-8?B?ZkpBTmV3b2pRMlJDS0k0RzM3Y2ZMR0gzMkZaSmJnREo3cmd1bGloY3I5NnQ4?=
 =?utf-8?B?U21pZzRWT2lUSDZvQlpjck44ZEZFTkx3K1pMNTNyZ3kvWVFUbXFLbUtkLzRE?=
 =?utf-8?B?UnlwRTlicGpuNGtUbTZKZmF4Qzl0SGRxUVlSRDFWSEVZTmF4TGkyM0YzbVE4?=
 =?utf-8?B?ckhlMysvaEdCZHdOUCtBVkRRMUZnZzloRFNTNHBEd0dpdDAvdlgrSUViRmx1?=
 =?utf-8?B?SWo5RGtEVWZmSHlrbnJwR0c5NXBOalRoNHMwSEpFRkUzVjVLNjJqTGFxeHV1?=
 =?utf-8?B?czJPalhsZnRJbFRHOHZYTnoxTGhBNlNmV1IzRmI3bkF6K1dNcEVvcC85eCtE?=
 =?utf-8?B?QWxudVBNQ2M4RnFwa3lLdU1qS1FVa2F6S250eXVWZTVKbWJSck95NC9DSWVn?=
 =?utf-8?B?MGhVbWk5VWsrZGR3NmtpWDJWanNzMTk0S0MydTRQZGV1b0x5R3Z0d1VtNHVD?=
 =?utf-8?B?WFVYMndqMGhPczVjVmJtSmM2RnB1TmNlWS83ckpJVzA5MmNkSFdDYXJZQnIy?=
 =?utf-8?B?ZzVuRFNiTUVXWk5xMnp4OTYwUTY3Y0ZrMnVuM3c0VEI3K0tWa1BoSnRRdkV6?=
 =?utf-8?B?NVE3Qmc5Q3o4QmdHS1ZtMk9YLy9ESGVKN3R5REVVNDJHeTRsUVM3Z3o1a3l4?=
 =?utf-8?B?MHZrMXhCYzVYbXVvU0psUlBJdEpNdit2alo5ZVROd3Q1elBTejVFTTZCN3Fk?=
 =?utf-8?B?Z295ZGdzNjYxVjVyR3FpL1k5MlhydjBXdVh3ZnU5MnF6TENNYXRVUGdtaDdI?=
 =?utf-8?B?UWcwNGF5ekgyUHY0WWQwVytGRjJ6d3REdHI5OWtpa1czWlFvMW8waVRtZGhN?=
 =?utf-8?B?SHNLYXVqWFhBV08wY3c5akNJeWlGYUh6QjgyeXJyQm1sM0pGajlIYTNOZkZK?=
 =?utf-8?B?NHNpM1JnQTBMVElmdnJSVW9NUkF4SVU3azJ0M0JHLzlJNldLV0FubzNPV3hm?=
 =?utf-8?B?SVhEeDBndlpNcFkzMm1tS2IrbllJS05aaklOSHE0eHIyb1l5M2g0M0IrdjNx?=
 =?utf-8?B?NEJWWXJrUTE5d3VZczY2T3lUSWh2WklrWlQ5VWo2bk9Vc0Y0UzZZQW1QbzB5?=
 =?utf-8?B?QmdlemM3RXpRTjBzSHQwa1VhMUh2czRaOXBvMDlKWElGcEtEdjhmaUNXMnRS?=
 =?utf-8?Q?unI53H72BKDANBc0=3D?=
X-Exchange-RoutingPolicyChecked: oYAzn7djPHLPrvm17r70Kmq9CR4zt4qMG/8JeC8PFhixcFyLiVjF3Njj5uLVS5XKpyRR8K7A/8MXa6EnNnbcRm1RX1MQGQaxwFF61+LPZV/W/h7EQWaYF0jO9D4yhnzRtZAvW5jSAu3WzITdQPfqT7F5vD5bL9B4eDczoLgMhHcS4ng/NOWvbq8WUblPXHCdq8amRtsjJbWrY413Mr6n5ccnRkxqYCTRJ6G16fNDZP1wnHnd9EJpBWRE+nU+WHhJW33/J8dQD/t66SbwZQD/hg77eIJ9YoqmjoBoap3MRd8qSAvKo+TMjCs/jKwEALvXNuin7czwTgRsMNkdxvMryQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d18a7245-11ad-42bb-9879-08df18fa6802
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 22:40:00.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7tvTCAfjD7tMYuo+iVCjEpKw8xZyqSkmcOjxtEsdTqnxN+YeLw8OMdFrPRC5ox3475tN9nZX5OG1lojrpF/aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
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

On Mon, Sep 21, 2026 at 10:28:01AM +0200, Bernatowicz, Marcin wrote:
> 
> On 9/18/2026 4:50 PM, Rodrigo Vivi wrote:
> > On Fri, Sep 18, 2026 at 01:01:30PM +0200, Marcin Bernatowicz wrote:
> > > When VFs are enabled on dGFX the driver resizes the PF VF_LMEM_BAR to
> > > fit the requested layout. After VFs are disabled the PF VF BAR
> > > size is left as-is. On platforms with tight MMIO apertures a
> > > subsequent unplug/rescan followed by another enable may fail with:
> > > 
> > >    "VF BAR …: can't assign; no space"
> > > 
> > > because the PCI core reserves address space based on the (now large) VF
> > > template, often multiplied by totalvfs.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
> > > Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
> > > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > > Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > > ---
> > > v4:
> > >   - use directly pf_resize_vf_vram_bar helper with device_total_vfs value.
> > > v3:
> > >   - rebased to resolve conflicts, no other functional changes were done
> > > v2:
> > >   - Rename helper to restore_vf_vram_bar_size() (Michal)
> > >   - Use xe->sriov.pf.device_total_vfs instead of pci_sriov_get_totalvfs(),
> > >     which may be capped (Michal)
> > >   - Switch logging to %pe (Michal)
> > >   - Call restore unconditionally on enable-fail path (Michal)
> > >     (drop vf_vram_bar_resized flag)
> > > ---
> > > ---
> > >   drivers/gpu/drm/xe/xe_pci_sriov.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> > > index c023a2a1fc17..31abcee55211 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> > > @@ -177,6 +177,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> > >   	return num_vfs;
> > >   failed:
> > > +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> > should we resize before unprovisioning?
> > or it doesn't even matter at this point?!
> 
> The BAR size is independent of Xe/GuC provisioning, so resizing before
> unprovisioning is safe. It only requires SR-IOV memory decoding to be
> disabled.
> 
> > 
> > >   	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> > >   	xe_pm_runtime_put(xe);
> > >   	pf_finish_vfs_enabling(xe);
> > > @@ -204,6 +205,8 @@ static int pf_disable_vfs(struct xe_device *xe)
> > >   	pci_disable_sriov(pdev);
> > > +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> > I just noticed that no users of this function handles the error.
> > Should we convert it to void? (I see it already prints some messages,
> > so not needed to duplicate anywhere)
> > 
> > this is not a blocker and if the order above is okay:
> The helper’s return type is unrelated to this fix, so I prefer to keep its
> interface unchanged here; it can be converted to void separately.

fair enough. pushed to drm-xe-next. Thanks for the confirmations.

> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Thanks for the review.
> 
> marcin
> 
> > > +
> > >   	xe_sriov_pf_reprovision_default(xe);
> > >   	pf_reset_vfs(xe, num_vfs);
> > > -- 
> > > 2.43.0
> > > 
