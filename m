Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C31C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 03:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265F010E264;
	Thu, 26 Jun 2025 03:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Py1au4MV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552C710E264
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 03:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750907863; x=1782443863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eizHlTn0nJ5vvG3H+Ct1rWvTOW5ubuSAjaSET9hTgOA=;
 b=Py1au4MVIai1Wa2WrwQezQNKE+ELnmdaXs2N9E+NUIRPtOZQmEM/kuU1
 1/z9LDFPin4IPPEK6flakSnrsiOXHbDR6352R9+rm0PdviB3SaaEU9KwC
 EKx4ECIkUYo1pzP+pF0EfoUeWs7raPtXB5Gyt/M64XQGTUbhHQY01R3mj
 UV0v1Yp0DpQHf3YGRUV60U1AmU0iWN6E2LCWbdH7SJuARYhAdQpdbN++1
 FabjlgxyD/wPoYvg+VxDZVdLz1zk4HwQhdCdIjMmDYRVflBHGXqIvpPWE
 9a4bMKKA0slSWfxoLwx56ekNQU6RfzRuGXU/UdSFM1QhSxj1afycMp+ew A==;
X-CSE-ConnectionGUID: VJcm1zFqRdmgF3ZalF26TA==
X-CSE-MsgGUID: 5/hIdK6WTg+5XQaNL4q9+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="75732979"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="75732979"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 20:17:42 -0700
X-CSE-ConnectionGUID: w9jrDRRhSSeQWvSwZf6Syg==
X-CSE-MsgGUID: WeUIDLmzR1e3GryS87u8YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="153112729"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 20:17:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:17:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 20:17:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:17:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2niN3FXyhvA5Uty859aht1sLAHo9Q1J1RCkNPrh1P1pOAXvmyP+8ivCXdP61wVYDVpTGmSr8Zpo4Uf1B1TqMjL4vG6/vA2ZyWmXwAfltOm0QotGke+uSZwZn6208imcHTZ1cYEDdu4RlDU5Kr/T4qnXxQDNNIzQa9lif5KQDPpY1S+rsv2BObUTIlDrP8OafyTE5s4D76fEI8WAzvAM/4jWyBnalsHD9vwhfYUpo43i70sO2euAqrIAuUqnoaEbPYSaMJHvI1G2nH21LfjT/ZGR9pyAK8FdhMSpvMl+ng0p/fAAVoVRxlmzC5en0S3ZurG8DjA7t3rz93MCTFb14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpECmm0VeHCGWUfheShvvU4LEdU/yl1Q9m0qX7KF/NU=;
 b=raG4d5SL7d11RyBp4kvSahHQBiGZi9OyX2MSN7EH48CtGFPDEPuijkC9QdA57+5V3bdETx80oDuEot3Lb12kdh7EkWVDt1C576aBoEYhZeYC7feCG9MeUysz2PdIJSj55CLKZKZ+HsQvpwwNgP9AOhkuGJNy1XbZhcKUXYnQqteohFYT7IUOq5OtEhoyL7Vrn6LRIIxIATpNW/3rDYDK+SQB8E1H1tiprv7ZE9sTUc0NbITHqt1UFKrDgRiJs2XltKEaSsRplHAOEZPyzf2BQhw0tSGIpsIEFzrobyG5Ey+xFMkw2dkH/nWv67zwtncXkKg0W1KeMjBBjqUe5vwVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 03:17:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 03:17:18 +0000
Date: Wed, 25 Jun 2025 20:18:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 1/2] drm/xe/guc: Enable extended CAT error reporting
Message-ID: <aFy8IhvCJG8ci6vR@lstrano-desk.jf.intel.com>
References: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
 <aFyMS/7ZBu+Gafm9@lstrano-desk.jf.intel.com>
 <1785c4a5-31db-4963-8f4e-4a693c740bd1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1785c4a5-31db-4963-8f4e-4a693c740bd1@intel.com>
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 038987ef-ce5d-478e-4cc8-08ddb45ff529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e1VYnDIEkrmase14fCSZTpfsHZMw7JUizls2DqTzu2c+NsCKphgfr+eW2VH1?=
 =?us-ascii?Q?0D0GKLoFHUMf2qh4DFi8438KBMKHHdaOIcwoepGD6DdXKPeKC2ueqHTdUAMK?=
 =?us-ascii?Q?EzAtw7bpoKa6MTaP3MH6Ag8u6+w2NSHXZBdMUdiDdb9ztEaWEdChGSDeL15o?=
 =?us-ascii?Q?OMD+IjU4syiCVvrgzEyu41DQ5qM7LOZvcb0OgYUHhba8GDDb5G9w5J/6nF2P?=
 =?us-ascii?Q?VqFlhnOIWFfG4Bfi4ZIK8i136/PpsPQA/is3T6PyZIdanrDgX2PGJlUao8vI?=
 =?us-ascii?Q?HqW/Q7IH1idNImCn0dDTT+pLngjBwb474Hr2aiZnBFpn8p+VpwzM6pOpBytG?=
 =?us-ascii?Q?06a6E92jSpcPsiTPSVGmhfGh8FqXrsLJpN+62y4B34HyKxnvG8c2dXIpymkA?=
 =?us-ascii?Q?mUJUKoy2AYtS53gj3HoSRIF6AVAmAiFcLsgsHR9/Fd6EtJUDxfioNGl4D+pY?=
 =?us-ascii?Q?E0LCYjV3tNcqjEuBMrRE8jLIrd01naxg5pvvd6GnqL+FoDvshBHtrjatN+8a?=
 =?us-ascii?Q?NGY54JWmJpMwNyUNlDfQIioEUJUGuCAYTDTq+uns9dOXhagL6WRQq6YrZ0y0?=
 =?us-ascii?Q?z5beSdFJQj/FCK4yXI5YjyU5abK9lUOsY4lgA3zLvTtm94Sucuxa3UXBOj1c?=
 =?us-ascii?Q?U5SvdW1xzIjlGC9rsYwy2xPTdjxuwxWMRCDAdmnNBMt/4hfdlLcd7PgjQRCd?=
 =?us-ascii?Q?6kGeiiPZ6y40OQQFoXC/2muyBBhIfbWQBJuoMT6t+Qu2A81pfkldffwAsR5F?=
 =?us-ascii?Q?310D82Q+GwDwo1G0+9wC9dHT3eonuKIMzLfQHS3kgsgrE2XxcUAI7x46QbMA?=
 =?us-ascii?Q?Ki/OEvQhEJviq4N1F6h7tHCpyjLdO03+DsJK+ZmkOavFPzYlBFx8JPzly64X?=
 =?us-ascii?Q?MoMuZ1zTwpeDCmvHzavILY1e1Wl8jATFfUR3JP7b4W+EmS9MnyjhpBXIXMUW?=
 =?us-ascii?Q?Ke8GvcE9TCgmWK4ucByq8HU5FMpJYXeYmtKN/pBAI9rk+JBZQJrY2YyHmBWt?=
 =?us-ascii?Q?Rj52kIYRx1H2ETJX1zn7jVwbBTm90AThB06Sd3gBEv9KeYoHp0bwC7qj+hTP?=
 =?us-ascii?Q?L2UqztkDLP/JDClvahDhaldKXVmV+WvGf5yc3OXagj0L5wgOAKtJaL2rjYNF?=
 =?us-ascii?Q?ETTQmMGZstWGDzvQ2Kc9NkxQT7g/IemQxHVIC0gy8Cb6qtLf7hTeKQAvdbsp?=
 =?us-ascii?Q?nSQm9x4ivZmAMYDGzjK007CPvQ3CyScZj7m4XEROTvqbhv6t1kS9DCFefgUa?=
 =?us-ascii?Q?zzXUpQRiCcDlf4IrxTzlSgBylx/OOmjPYqJ+OdscxE8mHMXItUOlt6zwVWvt?=
 =?us-ascii?Q?98OLEOkjwvHwBwAPkuaADmFONw27CN+vhLLJRAjK09tEwrNmCWv4wNOiJFaC?=
 =?us-ascii?Q?bcMdClbSgun6/CMHGPL0C/4HEVBJhfCM7BTvB1EJpxrnCMJvW/e3nWJtKQxj?=
 =?us-ascii?Q?1IDu/CmnM+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Mq7BJ7y3KqxYn3wWt9fdCwtE380hwLYyZk4PFx7OhoVwvFuoJWEcVJ8qQgG?=
 =?us-ascii?Q?QN6xCT768QUTDDvzOiq7QHuzpPUZCKZDpRT/oDlNSCvplFIUWYI9JSxPagAp?=
 =?us-ascii?Q?Gbybf1g+VcS8EZ7iixv1K3gUdB3fqybkt6EAKLOYOwY7kvpAQ+Gj1ifq0UXD?=
 =?us-ascii?Q?2mB21nbsLwnVilYfMgj/q5bwbVHrpXjMdfe/ADOQKFTQDEEHyuCXo0e0lOz3?=
 =?us-ascii?Q?d7GXlDUIWXWE3ee8+xSjrE/qJPISygmfSEpwK+DCqPdOHgO/i7qbSqpmIYWw?=
 =?us-ascii?Q?6bKbiSqOK/MsXpPFg47l8m9HEnOHlPIYxs7GT5nQOQtX/1k7kUdYRXJHyjzb?=
 =?us-ascii?Q?NfwNouJ/HnPrO1F3kGofl8gItzGufu9CHUh+48/yaHg26IdsJNHXqmcKzfrz?=
 =?us-ascii?Q?thrSVgFVNClvk0UEoCNSjusKTjSMc97A/wImhfFN6LXO9uJklR0gvOOUZIW9?=
 =?us-ascii?Q?eX18JmN7w3G3REIB1itPvP6KqlFUPi7ykECjh5dApqDVGa0S5N7/s6jAFy7L?=
 =?us-ascii?Q?s6wlQGRYnuXMN984rLMCQguWB5dzVPor8H0LG6byzD9cjZF+fvoVSV5pmvLZ?=
 =?us-ascii?Q?MZ7D1oRR1LS8aEP+mtQ4y7xKsg22ejv+KyanKNeRn7o1EKik/xdZGRtdWFu6?=
 =?us-ascii?Q?jBHcFO2oVNBlO6YBMcmBfa2a2oumi7C9oJMeEyIR0ewIbiLsuTIL2AslmdJP?=
 =?us-ascii?Q?PNpjlKvKSloLTw+TTIxZ60royxs1AQopH/+YixCAarNHemJCFGGAmsLpCSJr?=
 =?us-ascii?Q?qCbC9ZpwR4Q+rwuGpSYj5sHcIIPFB3KzXj4URMThmrj7deSBCi15S2C1b0FV?=
 =?us-ascii?Q?oVJUIEPfwv06x/DHLR7wNTz2OgFjU5e43Q2cDMSpohXuoVxNLH+4pmejU4LX?=
 =?us-ascii?Q?TJ2f07PBLiIeLVpq7nO/X9A/8kCAkiAuTxXcagL2g6sgTHkoH89bev+VIrfv?=
 =?us-ascii?Q?FQheLy/PjQD0wrDRrqZYKgxA07FaYhW/ZZEBKCO2x4w5BKWMajOR4m9kQRmQ?=
 =?us-ascii?Q?0tP7+GKQnT2OFmg+ZZS3U00UjF2fnFR75MvWu72FdZZlmY2DDfEIKeLy7Bxl?=
 =?us-ascii?Q?P+0wDXI7KTVpwkcScEUqAWJwepFWFdlUt7rZojBGha4092lBZP3vSVM2S8rX?=
 =?us-ascii?Q?oW8y4cIdVVFScr4u5MUT2y/mfaIkROrsLxyZ8tlP9Fw5lcLpNfWc5juV4orT?=
 =?us-ascii?Q?Q29AY1Xi/D844E2OAdoMJGIybQWLmCwSqIWtIGzf13Sme+YESPokvGdc92vZ?=
 =?us-ascii?Q?k0hRvOBvGS8v7Mv3JCa9Le/3C/nTqGRtbtYFi0jguR+YNWTqp76to25N3Nqp?=
 =?us-ascii?Q?nLwVJVEvStcSSC6g/Nznwzf9TzA5Bg+a12Xwr7qpJWraG866rOUNqvAzr+Rg?=
 =?us-ascii?Q?3uCXQPz4IAkNoxNdkqvbHwJrEY8QuO0ncJC+gxDxJoF8Dfj5cwn1Zzz5M1FZ?=
 =?us-ascii?Q?63nXMK6jASblDm8hrJMnzAjtQOGV6tjs6pisGq1Eylo5rqJvhKO9Y9xYBYF0?=
 =?us-ascii?Q?Wvsm0S4x315l9PjAi1f0wklSiw6oyNi7Pk6M4kZPg6JjcVgKDf+DqtXbyqm4?=
 =?us-ascii?Q?Sd5ymQjBLsxMdMh77LhtsVDBcXrn2Sxd12LtwYfrJLErJqezJz30Jaieyj98?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 038987ef-ce5d-478e-4cc8-08ddb45ff529
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 03:17:18.6687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgYRqVYfwH1QIbtE0RtSTm02qi5u7ZWxViaURlPtHD0mqVd4Quo1N8Ez3DMYeA0LBB9gRKIuA2Tyf8OehJIdBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
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

On Wed, Jun 25, 2025 at 05:05:59PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/25/2025 4:54 PM, Matthew Brost wrote:
> > On Wed, Jun 25, 2025 at 01:54:06PM -0700, Daniele Ceraolo Spurio wrote:
> > > On newer HW (Xe2 onwards + PVC) it is possible to get extra information
> > > when a CAT error occurs, specifically a dword reporting the error type.
> > > To enable this extra reporting, we need to opt-in with the GuC, which is
> > > done via a specific per-VF feature opt-in H2G.
> > > 
> > > On platforms where the HW does not support the extra reporting, the GuC
> > > will set the type to 0xdeadbeef, so we can keep the code simple and
> > > opt-in to the feature on every platform and then just discard the data
> > > if it is invalid.
> > > 
> > > Note that on native/PF we're guaranteed that the opt in is available
> > > because we don't support any GuC old enough to not have it, but if we're
> > > a VF we might be running on a non-XE PF with an older GuC, so we need to
> > > handle that case. We can re-use the invalid type above to handle this
> > > scenario the same way as if the feature was not supported in HW.
> > > 
> > > Given that this patch is the first user of the guc_buf_cache on native
> > > and VF, it also extends that feature to non-PF use-cases.
> > > 
> > > v2: simpler print for the error type (John), rebase
> > > v3: use guc_buf_cache instead of new alloc, simpler doc (Michal)
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
> > > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
> > >   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++++
> > >   drivers/gpu/drm/xe/xe_guc.c              | 56 ++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_guc.h              |  1 +
> > >   drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++++--
> > >   drivers/gpu/drm/xe/xe_uc.c               |  4 ++
> > >   6 files changed, 93 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > index ff4f412c28d8..81eb046aeebf 100644
> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > @@ -142,6 +142,7 @@ enum xe_guc_action {
> > >   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > >   	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> > >   	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
> > > +	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
> > >   	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> > >   	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> > >   	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
> > > @@ -271,4 +272,7 @@ enum xe_guc_g2g_type {
> > >   #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
> > >   #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
> > > +/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
> > > +#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > index 7de8f827281f..5b2502bec2dc 100644
> > > --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > @@ -16,6 +16,7 @@
> > >    *  +===+=======+==============================================================+
> > >    *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
> > >    *  |   |       |   - `GuC Self Config KLVs`_                                  |
> > > + *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
> > >    *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
> > >    *  |   |       |   - `GuC VF Configuration KLVs`_                             |
> > >    *  |   |       |                                                              |
> > > @@ -124,6 +125,20 @@ enum  {
> > >   	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
> > >   };
> > > +/**
> > > + * DOC: GuC Opt In Feature KLVs
> > > + *
> > > + * `GuC KLV`_ keys available for use with OPT_IN_FEATURE_KLV
> > > + *
> > > + *  _`GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
> > > + *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
> > > + *      containing the type of the CAT error. On HW that does not support
> > > + *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
> > > + */
> > > +
> > > +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
> > > +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
> > > +
> > >   /**
> > >    * DOC: GuC VGT Policy KLVs
> > >    *
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index 209e5d53c290..4a7c467ad669 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -29,6 +29,7 @@
> > >   #include "xe_guc_db_mgr.h"
> > >   #include "xe_guc_engine_activity.h"
> > >   #include "xe_guc_hwconfig.h"
> > > +#include "xe_guc_klv_helpers.h"
> > >   #include "xe_guc_log.h"
> > >   #include "xe_guc_pc.h"
> > >   #include "xe_guc_relay.h"
> > > @@ -570,6 +571,57 @@ static int guc_g2g_start(struct xe_guc *guc)
> > >   	return err;
> > >   }
> > > +static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dwords)
> > > +{
> > > +	u32 action[] = {
> > > +		XE_GUC_ACTION_OPT_IN_FEATURE_KLV,
> > > +		lower_32_bits(addr),
> > > +		upper_32_bits(addr),
> > > +		num_dwords
> > > +	};
> > > +
> > > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > > +}
> > > +
> > > +#define OPT_IN_MAX_DWORDS 16
> > > +int xe_guc_opt_in_features_enable(struct xe_guc *guc)
> > > +{
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);
> > > +	u32 count = 0;
> > > +	u32 *klvs;
> > > +	int ret;
> > > +
> > > +	if (!xe_guc_buf_is_valid(buf))
> > > +		return -ENOBUFS;
> > > +
> > > +	klvs = xe_guc_buf_cpu_ptr(buf);
> > > +
> > > +	/*
> > > +	 * The extra CAT error type opt-in was added in GuC v70.17.0, which maps
> > > +	 * to compatibility version v1.7.0.
> > > +	 * Note that the GuC allows enabling this KLV even on platforms that do
> > > +	 * not support the extra type; in such case the returned type variable
> > > +	 * will be set to a known invalid value which we can check against.
> > > +	 */
> > > +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
> > > +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
> > > +
> > > +	if (count) {
> > > +		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
> > > +
> > > +		ret = __guc_opt_in_features_enable(guc, xe_guc_buf_flush(buf), count);
> > > +		if (ret < 0) {
> > > +			xe_gt_err(guc_to_gt(guc),
> > > +				  "failed to enable GuC opt-in features: %pe\n",
> > > +				  ERR_PTR(ret));
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static void guc_fini_hw(void *arg)
> > >   {
> > >   	struct xe_guc *guc = arg;
> > > @@ -767,6 +819,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
> > >   	xe_guc_ads_populate_post_load(&guc->ads);
> > > +	ret = xe_guc_opt_in_features_enable(guc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >   	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
> > >   		ret = guc_g2g_start(guc);
> > >   		if (ret)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > index 58338be44558..4a66575f017d 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
> > >   int xe_guc_upload(struct xe_guc *guc);
> > >   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> > >   int xe_guc_enable_communication(struct xe_guc *guc);
> > > +int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> > >   int xe_guc_suspend(struct xe_guc *guc);
> > >   void xe_guc_notify(struct xe_guc *guc);
> > >   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 26c6c71dc91a..32548c931615 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -2103,12 +2103,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > >   	struct xe_gt *gt = guc_to_gt(guc);
> > >   	struct xe_exec_queue *q;
> > >   	u32 guc_id;
> > > +	u32 type = XE_GUC_CAT_ERR_TYPE_INVALID;
> > > -	if (unlikely(len < 1))
> > > +	if (unlikely(!len || len > 2))
> > >   		return -EPROTO;
> > >   	guc_id = msg[0];
> > > +	if (len == 2)
> > > +		type = msg[1];
> > > +
> > >   	if (guc_id == GUC_ID_UNKNOWN) {
> > >   		/*
> > >   		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
> > > @@ -2122,8 +2126,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > >   	if (unlikely(!q))
> > >   		return -EPROTO;
> > > -	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > > -		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > +	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
> > > +		xe_gt_dbg(gt,
> > > +			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
> > > +			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > Do we define the type anywhere - I only see XE_GUC_CAT_ERR_TYPE_INVALID.
> > 
> > It would be useful if we had this defined somewhere in KMD headers or
> > even more useful if type was accompanied by a string description.
> 
> The type is HW-defined, the GuC just forwards it. AFAICT the values are not
> guaranteed to be the same across platforms (the Xe and Xe2 lists are
> different, see bspec 54047 and 72187), so I don't think we want to maintain
> a list in the driver.
> 

Maybe throw a comment a comment in here for bspec links when merging?

Matt

> Daniele
> 
> > 
> > Matt
> > > +	else
> > > +		xe_gt_dbg(gt,
> > > +			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
> > > +			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > >   	trace_xe_exec_queue_memory_cat_error(q);
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > index 3a8751a8b92d..5c45b0f072a4 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > @@ -165,6 +165,10 @@ static int vf_uc_init_hw(struct xe_uc *uc)
> > >   	uc->guc.submission_state.enabled = true;
> > > +	err = xe_guc_opt_in_features_enable(&uc->guc);
> > > +	if (err)
> > > +		return err;
> > > +
> > >   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
> > >   	if (err)
> > >   		return err;
> > > -- 
> > > 2.43.0
> > > 
> 
