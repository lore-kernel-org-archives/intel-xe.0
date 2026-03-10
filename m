Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE9BFCC9DB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 09:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EF910E226;
	Tue, 10 Mar 2026 09:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYCdDhRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD6810E226
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773136004; x=1804672004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Yaaz+D8kJSXsyYrQiqLF574ImXs/BXwxfYwjDVSRgUc=;
 b=hYCdDhRBKlVGyRzYAx1NaSNnT56/iJXyVcDBAFf5dueTXkNDUkcre4z+
 zOHKG61jp1WNbsUXgZuPEREnXT0HSBc3Hc9MWJZmK/Weph7TC/A3QOdJ5
 vo4k7PXg8o9Sh59943pRT3xFGwtpDEwaoX6sQXUMXbygGDaM5B1l9Ah4o
 gLGsSrVNz4dnzIDS2YZGa7UqvHTffmvS6NAIBfdkMo43f89oaqHtS8bEn
 SMzj9LqkGya4v++DL5/5uEwuf+b9+skDP7SwLqWiA/9Kl+u4cJYtyuX1T
 eBg/+/rYa0wTgVIvFsInD2eHCXg7WuXXLRWXbKIoHwqMd92R4ZNq+PMZS w==;
X-CSE-ConnectionGUID: W6Z/FyQOTdS6WRnm/tsyaA==
X-CSE-MsgGUID: Frm9kY8CRXeF/4tm3JsUuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84888170"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84888170"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:46:42 -0700
X-CSE-ConnectionGUID: lq2Sq07MRWaNvz+IptUcMg==
X-CSE-MsgGUID: Mto1nZVUQeOtQPoCgViwEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220232509"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:46:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:46:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 02:46:41 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:46:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWGxr/vIqjKA0i1s0k2wjXsCPX9JyBqmEqlDilooreeBixhvq7zSh+VWimNFLqB3ramQsvPsf3LjzVl0B5j1fb7ceeqq0GyqDzUnxBneB9KmC2v09eNh8rknYzkvI/Xw06OdsgWF5lrZ5ipr5b9mdG1uZ7tGUNytckNTnlFWGFvLWMxdkGHqqP+4ks9LZDFxiA1UZaLpvMuUdSa3OB/aGXS3wD19cZuQrqp35HwlsXRH3iiVu6D4nk5cB2PkFikaFrDGtFpBRDXKWWONksOPqAWKCfU6BA7JnMLWyUVuoVzLF+SNcGrI38SvQniW6Ncb26PwG0WrDaZDFKPt4bCCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGiL1umpZUSLNf6HWxdd0UwvJJKUKx2dCHXFdScAUo8=;
 b=reVfF2fAeWS+gfHgDtCECu4rtdmQMsUT/JM5ha0pQHsZI18UMEQM7TPFv8TxFGYeGq49gUkWQyfBRCVEKhLMdOAIFqEU8PPhPui3AAIrLLOTFf2DZ1yS+z4+HVohecWGZGy/ZSmhYIeOSABnVo+g14Z2ylQE+9Ftwk0qicv1aD8PnvAHY/bpkdI7wcI1oDpvtz8b1dgCaIYZGD9tdoWFNObCMIlxfWAt5pcMIAJIakCzJQSBXlUIv1KGzkFZNC5hxssospDx7pvxotK4XDEK41kF60m3y/6d7Zww/oKOx+6NGykCqXErJZYAf19haDwxlcjzPAjbvmCvQMfz59ZiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 09:46:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 09:46:33 +0000
Date: Tue, 10 Mar 2026 15:16:23 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 3/6] drm/xe/sysctrl: Add mailbox communication headers
Message-ID: <aa/obywO9cxZNL00@soc-5CG1426VCC.clients.intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
 <20260302081002.3275868-11-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302081002.3275868-11-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddf26f0-80cf-498a-9279-08de7e89e9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 7FzbSFVEVVIMNBbZF+blaoIFQaIVPGFeOCJ6xlz8f8i3h7sUMGkIcLJ4uIlEeX1Hc8AzEdkosRn8mQX61oprMAM76mP6/88q4pyZTPRrIlGYYiwveGavO7ZzxWMXKX817PkGa+h2AbZ7jlJYrh+nt2s7A3tK9JS3SNXoi97GpL15xJr2l0C20CeHHRa1oJWM4dryJk8aVVKYaQrdIwP2RXXrk9JNdjxvRPthPRd4iVmaSqzGiNWGtLvinnQwil/Q5F1YeZUIYt8N5liZkxdm+Pfbl3vRpY1Yvi8lzgl8RyFkvxrkz/FltvuAmx9zI/fK2Vs3V7552h99RVjDo9qT7GVeSqqLNmM1QlfgsiykCtC12CYso6AVl2a4oUvzxh1ZSwF1SkjcIhh//o0bqDpgpSkAMQPB6hYcIuOXwFVHJt0sBTRNow3VTlu4oCqU40Vr+87uZ9AzNmvpowWNYf7kAbt6nbg8PwASpqhcszGNW7eHq0V3cQ0YTih6EhUJVTc+11YarpFO4IdhfenBDwYtXR7NdTUcXrNPa8NUNGCGOPC2yxhAEBah5sAEMAIixsbB0GqGRrgYWl3tnvTROH9xAew3cKQLv/0A2qnM9rKebPvSSzFsB7TYZq9fZMEMQ78bBfEU+SGxfaXaXKAqWT7pgWbXMO/7m0p99mnf2OZwloHYbK9QgsT2Gjyqf7CEGxSAU78eh9sSydrfKw/ZTlZ7Wq2ltUzgC916AQZjMSOU2a0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0djZG1VOVdaNkkwK3JkdXkrQ2ZjRUxrdm8wRGxpQVNYNVpybmY2VEI0dk5u?=
 =?utf-8?B?ZVBsY3BBbTloZ21tWXdOelI2b0pBemZaYVVCblpnS2M2eDVGUnhTMkdSdlhu?=
 =?utf-8?B?V3pacDNrRGNSdlJ2REpjUGYrZG5mdHBreVcwZUM4UStSSUNhNmFqU25CWml5?=
 =?utf-8?B?VU1aRjFWT0hpcVQ1NU1GNnV4dmM1L09TTm9Sek93UHd2cWRqcVhOajJWRGZr?=
 =?utf-8?B?d0pkNlZQSlU0bXk3d1dQZW94N0hOUGE5UnNIWm8xeVNhS2tBbm5LRXJRdWk0?=
 =?utf-8?B?RktRdnV2bUIyYWxRNTBYUWR5MUtyaXF1UFhwREZBTGx2NjdseUVXTFQxRXMr?=
 =?utf-8?B?Mm5TaDZQMWE2UUErMjRaOE5abXgrS0k5S1h3UlovNGhQb3hKT0laMWcwSzh1?=
 =?utf-8?B?QkEwWGJKRll3eTlkTHFoMktoNWROV2VONk9LQXlNSE51UGxSN0dKakx0Skww?=
 =?utf-8?B?N3JxNW54Q2ZYNlB6MVIzeUU5WHdYWW91S0xZbVl6N0dSWHFscE1qYk0wTXBB?=
 =?utf-8?B?Ym94bGVtVXVOaDh1ZDZvT1BQWUlicGF3UUsycm8rQ3drdUhCTWcwdWovR3dB?=
 =?utf-8?B?NGhMMzJNUVQrSFJzMmlRMlczRnlXTi9UdUdwYW1raWRpaXpacEZUSGxpT2dh?=
 =?utf-8?B?UklLRTNtbmYxSmVkOWtTOGc0aFNQcDI0eEU4eU0rL1hqYzgvd3F4bU9SVzJz?=
 =?utf-8?B?THAwekNUNFBjMjhlcjhMVGg3OWlkaENlSzVRdlN2L3lidFNGN0lqV2lYaDJ3?=
 =?utf-8?B?a3BVYnE0Q1I3aHdHR1ZuTzJNeUh3QU5vNElSL01OMGg5L3NXdGFxMTZtNWZJ?=
 =?utf-8?B?dno5Sm5DYWphVGlncVRVOTBCNktwZUV1MnVsSWh3ekFwQkZ4Yy9uZ3BOOFJh?=
 =?utf-8?B?Si9hVldyTG5naFVsRjJ6c3ZTaEc3ZHZxa3p5RVRrL3dBenRTK2txVjBtS0gx?=
 =?utf-8?B?MGRZcEJkbk9FS3BWQ3BWajlrY1lwV0I5ZkFYelZJSzJsOUNzczRVd2EwNkNt?=
 =?utf-8?B?OWJsK3Z0NU96TkFUdGpqR0F4dEJSNEpaK1U3amF2SmwwcEpVZi9DUnpjQ01M?=
 =?utf-8?B?d1VPSGRVSktOWXpraklaWmkvVnhJdHpERWNCVWhPMHRRaTBRU1BKc0hEekVs?=
 =?utf-8?B?bE95SmFnWG9mWjBsNTJnMnltNFF0a3ZkQURlRkFDMVNjK0xTcmhmYTA5cXY3?=
 =?utf-8?B?R3BvZUhCSzh4QUV6Q1Vwcyt1SkJHZmYyOFkwVFRydUFVRjNOZngrZ3RJR2Zy?=
 =?utf-8?B?RFVHTk84TGoxNEdId1RKK1ArUXNiVmc1bkFEU3dSVWFHbDFPRFVCSy9hOWpy?=
 =?utf-8?B?NUl2a3F3UnorTHl4TlpvTk1Ea3JXMmpSbFlOSG81MEVuUFFuMU02Z1FiSUdr?=
 =?utf-8?B?R0d3TGsxZDZKbENSeDFQSzJ1QS9PdEVDSks3amJtQVlINFRxVk01NG9tanhj?=
 =?utf-8?B?S3o4Rk1Ic2FzWWdrTlJvblRaYnFSWCs3VnZRZm5CM05PV1BMTFliT2Y5ZzRp?=
 =?utf-8?B?eWxQbGlqUW1jQWRhUEI5ejc2dENIR0Z3WE5rcmY0UWIrdHJyZ1c4bVdBL2tw?=
 =?utf-8?B?S0k2VW1lZWZSYTRyMzRSNmFXUWVWVXl2c0crME1aOW9wRUl2QVZqVlpCc2tV?=
 =?utf-8?B?SUNqS0J0T0RlWldQQ3lJYi9HUnFjQXVJK01kanZLMnJveGkvY20yNXpmNFhi?=
 =?utf-8?B?SEtQUnYxUFRJMEFkRzBNbUJLME9nWWpnd1lhSnBPWDhvOTRXMVQycElqQWdt?=
 =?utf-8?B?VjltRm5ZYTdWbVN2OEtyWDloMGJveUlwaU5ORmFJekZaTWp5a0x2emw3SU9S?=
 =?utf-8?B?dGVISVpVMHo4NUJXbVBIL3BhaXlOUUl1TlJqcE9mUWVWQU56TDNoV1pVRzZx?=
 =?utf-8?B?QlpZQVF6YllZNDZzSUhyK2lXeWVkTkZSSGZOMkxVWmgyMjFsT2hadjRoVE0z?=
 =?utf-8?B?dlNzWVlWYkRRM0ZPSFhLY24vMUJ4L3hROUttK2o3RGs4K3JZOFRaK0ZTbDRp?=
 =?utf-8?B?MEh1U0hlek9UbDVQQU5rSkluSzBvTVduaHJrMGVaWDZXZ1VQcUtFbktCNFpF?=
 =?utf-8?B?b2RDRlVta2tlcDNzaGFmOTEwbktUWVQ3aHgvTkhuYTJ1NHR2VG9reGxwVC9q?=
 =?utf-8?B?TmlSUEQzRGY2cFg0b2Q3V0dqbG9LL0dkNitlZFlobXBya09sNzl3bE9sdytk?=
 =?utf-8?B?cXFvVzRMN1pBbWFCdFhaazI1UzNZeGxBVEV4V051SXJFU00zdGxJTTBJaFQ3?=
 =?utf-8?B?UXpJazBYSGsyeWVXMkF3ek9HYnA1L1FHY0p3RkVxTHNLM0JheFFSbGpqQXFK?=
 =?utf-8?B?OU9mRVlGdlM4T2o2QW9DL3V4Z3NwV3ZNaFlrd0FjeDlFRjhCYVFLd3E3L1J3?=
 =?utf-8?Q?QgyptWGC2FlUHH7I=3D?=
X-Exchange-RoutingPolicyChecked: UxOZRqdOPxlnmpsy7s0NnPz0qEOhVbmtAz8WZcdRLZz3tZiD4HurxgOE7ZuOwyvkSqV5ARuSt3RbQw7bUyOi39sBfe+YTpMys40jfkzj2BIwuxch+5yk9bVLmHBCG3dCW9OWwU6bi6O2oX9+jgjv87Ze0X+DYBtXLBSJLjrsOOfrquEWodF2mQ8o2QJZJOB3Rnl17X3w72wr6+YUdXAKkmvC0nFRL5EZQ71XyFPML8C2OFSDrmIIPN1EsujCe6lUmgE507HLnAkTN7wD9POVoxtvyaKfLMUK7/2mRFBL29euZ0hfC9dGnKhAYTyTDGhvxfsXxpH1saFl5cLkyG5kFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddf26f0-80cf-498a-9279-08de7e89e9c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:46:33.4830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apx7KkTElj+xqmnJQx34A1IO8f9PGX4My9PoE4/1gD2tSEVWa4s9AradOm1/ahuKQ/hA9vADah/L8jLaFqrYkyy4/kqOcHMqBGRO58x24nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
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

On Mon, Mar 02, 2026 at 12:10:05AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add ABI definitions, mailbox API, and command structures for
>System Controller communication.
>
>No functional code yet. Only protocol layer definitions are added.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v8 (Matt, Michal):
>- Reordered patches for logical flow
>- Moved ABI definitions to dedicated header
>---
> drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       | 31 ++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 31 ++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 35 +++++++++++++++++++
> 3 files changed, 97 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>
>diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>new file mode 100644
>index 000000000000..8eefb0ddafd7
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>@@ -0,0 +1,31 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_ABI_H_
>+#define _XE_SYSCTRL_ABI_H_
>+
>+#include <linux/types.h>
>+
>+struct xe_sysctrl_mailbox_mkhi_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+struct xe_sysctrl_app_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
>+#define MKHI_HDR_COMMAND_MAX		0x7F
>+#define MKHI_HDR_IS_RESPONSE		BIT(15)
>+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
>+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
>+
>+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
>+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>new file mode 100644
>index 000000000000..91460be9e22c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>@@ -0,0 +1,31 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_MAILBOX_H_
>+#define _XE_SYSCTRL_MAILBOX_H_
>+
>+#include <linux/bitfield.h>
>+#include <linux/types.h>
>+
>+#include "abi/xe_sysctrl_abi.h"
>+
>+struct xe_sysctrl;
>+struct xe_sysctrl_mailbox_command;
>+
>+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>+	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>+	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>+
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>+			    struct xe_sysctrl_mailbox_command *cmd,
>+			    size_t *rdata_len);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>new file mode 100644
>index 000000000000..32c35a6da1cb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -0,0 +1,35 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_MAILBOX_TYPES_H_
>+#define _XE_SYSCTRL_MAILBOX_TYPES_H_
>+
>+#include <linux/types.h>
>+
>+#include "abi/xe_sysctrl_abi.h"
>+
>+/**
>+ * struct xe_sysctrl_mailbox_command - System Controller mailbox command

What Michal probably meant is to just add the above definition for the 
struct. The member documentation should stay as it was before (inside 
the struct block).

Umesh

>+ * @header: Application message header containing command information
>+ * @data_in: Pointer to input payload data (can be NULL if no input data)
>+ * @data_in_len: Size of input payload in bytes (0 if no input data)
>+ * @data_out: Pointer to output buffer for response data (can be NULL if no response)
>+ * @data_out_len: Size of output buffer in bytes (0 if no response expected)
>+ */
>+struct xe_sysctrl_mailbox_command {
>+	struct xe_sysctrl_app_msg_hdr header;
>+	void *data_in;
>+	size_t data_in_len;
>+	void *data_out;
>+	size_t data_out_len;
>+};
>+
>+#define XE_SYSCTRL_MB_FRAME_SIZE	16
>+#define XE_SYSCTRL_MB_MAX_FRAMES	64
>+#define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	(XE_SYSCTRL_MB_FRAME_SIZE * XE_SYSCTRL_MB_MAX_FRAMES)
>+
>+#define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
>+
>+#endif
>-- 
>2.43.0
>
