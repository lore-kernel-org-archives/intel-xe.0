Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209C3C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 11:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C556710F0C2;
	Wed,  9 Sep 2026 11:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSjuUJjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B425410F0C2
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788951832; x=1820487832;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dWsfH27mGPnZFR0TZMkMpT0XUKsBqcVS2lXMyyqDKSU=;
 b=TSjuUJjXVCkhdmRDUZbI0JFQBxOJgO8M7xyalSv3jOUzSRnxJxAPvWF4
 bKy0Xq1MAiuVuQVxXr/ZGytMFlEynN1PSSge5RB6EJAlnkYG6aPjMkziT
 eKJB7TaLzVlmtgxu32nOop83eK0ogFqHaZDEwee15ORvx6YHon2pQ8Lrl
 j7q7NTrVdsv8YnJ+2psQxbE4SE2SP5tLhxkEpqzu0CUbcoqqZF8Tms9au
 q3IC2n99P9hpRAVi8GDKvxgKMbnm+7piG/nIx+0GjqVFcoVtAsNvgy67b
 49dQgDJZFY7BjhJuJ51+Mlw7e6Nv7D1ZgRcgBkCOFwnhaa3Yr3NPaZre+ w==;
X-CSE-ConnectionGUID: bPYODLGTQ9ukhrEpm8nDew==
X-CSE-MsgGUID: rKUEqV1sQ6SNAj3kFacv/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99967662"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99967662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:03:51 -0700
X-CSE-ConnectionGUID: T26sKRLpQpOkPlyAAVxyMQ==
X-CSE-MsgGUID: lwe6djFzS3GoHtD24t9llA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="271266155"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:03:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 04:03:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 04:03:50 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 04:03:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXdXXmL68dyEhJd6CD+8X44yXiD8YSu4V4WDoChTo+dlDTm5pyJqENRPuC5qfkcR2bphmNTJk5aTXZQxw1IlvmHDlzY4QPc+5e0lRhjX7kf4r+QDPKb8zCo6vigBPjcqxAqrIvAROklfkMpUs8S6zcIDPp4vDkaU8haBt0ci/O6aKiES5/7HhefxroP1MXOPzSnqyt28qwzAw2nddahP88x7ac5HldPPfRP+IbaQwR8Ea4tjkYnHRKLWvqDkYjohXn1bPI8QjFZ3856oU5JmkFRbJFGDlWTjMA3UJ1qz4E6n2P2sjx5NTkLDP9ruE+z2DZoOiUGC9DzYtINIbZxWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEZxHY2LDv8mlX543INDqEVgXEw85YR7AH6IM0z5SYU=;
 b=h+zoGwt1azB9DMn0NkpzAAZlP0rPZ0T7M5iE1uBDsy4Ntysh4dwNB3XTPjYzO5xuSEjg/Mb1Y+YWTrfDd55M2hKO03HBkyGQVTzRZLTTR7RVbNbkXm0gTDh1U3Ak1M2Wu/Jj8kBLcyaoColnQoq2hupSOCuZpkCUF1NvT+z252NJ+pz9ARY1mc7+ooBTNc3ZtIHhwkJvXA/yaTLIDSoZAwzlrX2EOUk2iZrKEiIqmLEzSnNWAO0jIiUzK4PXxzwGksSgYG5zEzaWKYojkoSBH4AqfeUCOd0ukvQUIC7zVS2NHU0J5eLXshiTlHegKj7cascGUp9E4WDVX88ySETVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 11:03:42 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%6]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 11:03:41 +0000
Date: Wed, 9 Sep 2026 13:03:38 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
Message-ID: <aqE81KpJiLE0R8KE@nostramo>
References: <20260902124751.512730-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902124751.512730-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: AS9PR05CA0260.eurprd05.prod.outlook.com
 (2603:10a6:20b:493::19) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: a9919061-cab9-4119-8785-08df0e620211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: c2LR2ZmN0D7ONQwdmOf1nFgDTZ8bDu45NS1tOp+J1g90cZByP9WxrBXgC1bWwrn6CunAS4uk2HxhBfMiTdqA1kZRI8xcE1IlGx6W2r3ALCItsWw0J8M3PnOH4ojis3Bwm08xrBhNQRTCpxU2+D5A4wztJhb/e6m2ACn3Bapli5xmhOrBkmYgU/pbm7ZGrtnM0496gI5fbNt5SWW6M1bPMsMVvU+M8Yd+s08LzGzzQHAau0IE7Bl1b08JBuqqYPEqtY9y7t9ycqYHY2BKIN9/7i0a7JTjyPPAVezVciiCSz+GMvTYyEe4tcs43kbbZMcvHRG5S5UJRo6vV2W+dLwMf80BbkUpfVzKLW1hWHjfdAgH2TqWSp0fMdO87bwdzDG0p+vhWqvAnGbQLryBH+ELsFK5bZW9qhWqgIUOMSbkw2hKp1OS07c2betuCHfOZ4u9vS6YuNCf8D5FOqjPLUHu/WezrIF02VCLTvNnPNFNALA1EeeSsY1f67k+8qpJlYpovotfbpv1YjWE+2+UnsadnKaZB/my5COCQXKRTIRWYQNcEzqFIhAvMiiUIhLhp0vxmBYRkhlMEQZ5ZxM6DP7VH3jz0jVosTm5fVuYK+CxwsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWh2bEZ4MXF6bW05MWF3TWFtVitUVTZ5bjV6ZWk1TUV1ajBrYzltZ0pKVXVw?=
 =?utf-8?B?Tmx2d0tiMEFuVDVDSW5HamZlSUtwRXczdjZrZ3hmc3ViNEJyc2ZVYVk5OUdZ?=
 =?utf-8?B?SnRRdTZFWjBlK2lOWS8zU1lrQ0F6YS9pZEhLVHVIQ1hvZUJLQUZQQzBsOXo1?=
 =?utf-8?B?aHFpcUhOblFsNGVnK0FJTkJ0RTFPK1ExUWV2QndERkpSK2ZBZmZqT0k2OHBh?=
 =?utf-8?B?cjFvZHdRT2lUUlZvVGlZMWxSQnZGWVorYVc3c0ZUbm1ZYVlHSjlvalpkWVd5?=
 =?utf-8?B?QVB0YUlIcDBWN1VIMkFNR1dndEs0UllDMFZpUHhLandPcFNDNGtzdHh1a2lB?=
 =?utf-8?B?ZzVyTUt1M2Zwc0dvYzloNDY3aE5BUDB4L1psUmJsdGJienBPeTFBNndxMDNn?=
 =?utf-8?B?NDdmKzhWZlNlTnZ1NGIwNTIxamJkem5hdnNEbVhrczh0bit3anJTWUN5MmM3?=
 =?utf-8?B?OGVrY1NIL3JETjQ3SlJTNmhlYm9WK0l1dkdGYjFQUGJWd1Z2OUFqVE9MdTBz?=
 =?utf-8?B?dERmNDRRTkdNUkpGaDZ3UVFZOERzbUZ1eFVNRm9VOVR2RlJVNUdzTFg4ck4z?=
 =?utf-8?B?a0RxTXQvcVNuZTJkODlpNkR2L3l2eVJ2VEIwbTNsM21yaXVjVUJXMUxoL3Nj?=
 =?utf-8?B?Y3VFM1pJM0xwUDN1UXNTSFJQTTFFN3BkNk5YWGRqbnpOTHRQQmNFSnhQT0ow?=
 =?utf-8?B?YmtRS09DWEZ2Qk43ZVZuNlR5RjdZQ1pnUXoydWMyWUwyQzlVelRxT1hEUXZq?=
 =?utf-8?B?Ky9BdllTUUVWNjlXUzZLZTlSWjk1ajFKVVo2Yzk0UHdVenpWUFRETHpOSmcv?=
 =?utf-8?B?YW5sakpabEUvd1R2UmhEREhWSFZOY24vN1BKSUtrMlNQOUlaK1dReTR5dFVT?=
 =?utf-8?B?b1kyd2tmbVdlYUlSUUZNYVc5M2huRlkzVVFXYkM0SUVPenJFQWs5SUxWSHcy?=
 =?utf-8?B?WXNXbXlnYUpNUHVtZnoxVk4rT1VWL3VZRHBOcEZMb1o5aGtGeGwzblYzM1Zy?=
 =?utf-8?B?U0JYcDdGU0NnL2FOaGMwcm5EQmVzNFQ5dVlsdlozVS9sbjgyNVEzZkU3eis3?=
 =?utf-8?B?dXV1NndUdE9UL2U3THFJVG1vcWp6cTJveEdBMHNnbHZLVEw1Y2JBekljUzZw?=
 =?utf-8?B?QmxWclpyODZITzNoeEd2MkRqYWNycnRrN2I3ZHdGWXFldjd5d1ZuMlVYM0p4?=
 =?utf-8?B?WjZZVytZSmZPVzRyVUV4U1JaSVo2cFAvLzFiMVVGQXZzejRqY2NvdHRqNDB5?=
 =?utf-8?B?MkF5Uml1VUU5UGhKajhxZlRPZGxhYUpuQXdSQ2szYkVqaHVTeDVPMjl3cDEy?=
 =?utf-8?B?aXArQS9HL2ZnZmdHMDlhNS81WGhCaWFhQWFqTWowSVE0Z2t0OFhhaUlGSlNi?=
 =?utf-8?B?ZFErSXJYOHIvRFhuRzFpdmNZanBoY21hSFdqMlFHV2cxbVFxcW8zNXMvMTRU?=
 =?utf-8?B?enRTbVk1YzdpajV2MXpZL3U4MC9MbEtQT3g5LzRzaElENnB4djBMVDFMUk1F?=
 =?utf-8?B?aWV0MWhMRFBJbUd5OEVJU2FhQVJETmF0YXZnTThoOFYwTjZyVG12aHpVNmhz?=
 =?utf-8?B?THhkZ1B0aGtzUjlNN3YwODg1dzduTVJ1SjVtclhXNjUrcTFreWFJWXZ2RGw1?=
 =?utf-8?B?WS81Z1p3bXlqR0NhdlVUWlZNNTZUbVRMejYvaktPYzJ4M2x1aSt6ZGtIaHlq?=
 =?utf-8?B?UmF0aWsweEQvcHJqYVhzNm1pVW1NYTA2K0dIWWhMTFRWWTZZcGl1OER1elJo?=
 =?utf-8?B?RC9GenpwSEFBNzlMM21FclR3Z3RrcEQ3OTdzb1ZLSFFqK2JVOXNLMVp1Smk5?=
 =?utf-8?B?ZHpzRkI3QThNRWpxbWhxSG9ydnczM0pNN3hVRmN5bGJXYVBaU3FjcVBHbTF5?=
 =?utf-8?B?cTREaUs4ZE9aOUxrZkw1OXpJZFNQZ2F6cHo0RmFaa0hyZmFQYjFaTHUyTGdD?=
 =?utf-8?B?ZkdCRW45SnpUQVRuNlJpdGVZMnFFMjJycmtZbGdZdXdmdWV4aS92dmVvTkdy?=
 =?utf-8?B?ZVRMUGttMEFVTFIyOWdBNjc0ci9yWHpKNjNMaXZIWFhyTzVsMjU3b1RhKzRD?=
 =?utf-8?B?eUw1WVlGbGk5RjJKYWZmZitmbVRxM1dybHJDbHRzL3V1WVZvdWNLSURLYWlh?=
 =?utf-8?B?Vm9VaFMzTXlWS2ZBSGthNDV5RWNsc21xQ3JMOTd6Q1Bxdi9TZkNyYlhIT2ZK?=
 =?utf-8?B?aHc1S0pkZWo5d2NMNG8xTWhhajcvcFBLTEtZRit3YXdOWmVwVHAxb3dCaGlX?=
 =?utf-8?B?QXpsYjJoQ3o5UHZyMUU4cXVRdzZnbmRsRUM5blZjWnRCblpUUXRBMHdiR0NS?=
 =?utf-8?B?dGJTR1BkME4yY3JieHI2MkttVUNJcnBGK3h0RDFZK1VOOFBkdzR6QUNxQkFF?=
 =?utf-8?Q?nofQjXZ61atARtJc=3D?=
X-Exchange-RoutingPolicyChecked: c8kdrGEY1rmjY/pz5v0/4efRoGp328YbDfFLhL5PRLt9b3NvMoDxA1kL2WDF3ltLv4FyzxtgWFICp3Lr+YvwyAp5+1bZOqHuc0NKU1MSoHGKZRpzpSoQGlL9EWgqVcNlZJnfe6dWtWXXBqUfHKYyhK7C7KiMZVbnYt6ibaMnn0W2VotoK9i6to4YeK52B0kaFhYcBKtrh6OsqWAHBKvcNYfYe7LtTIfy1V8KMmYkctpWJE74eA/XYzYeXj8G6+R5Jp3/4fBeRIpbkFuXqbSSHfJKFxUv8ONMUAu3j3tOQ6W6GQdW1ESLD66TPXNL1zK49QVGX/PZoGlpO8Yrq4tWyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9919061-cab9-4119-8785-08df0e620211
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 11:03:41.7945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxvKAxXz+YhiCegBdJN/MPDS5nDOpkeZKE7n7FvqxrYf4VyCmy26iIs9xTYgFH4uRAxs2NQoxVbJAoOskY+i/0mpgR8pTb/b4+Hp2X8bGvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
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

On Wed, Sep 02, 2026 at 02:47:51PM +0200, Marcin Bernatowicz wrote:
> When VFs are enabled on dGFX the driver resizes the PF VF_LMEM_BAR to
> fit the requested layout. After VFs are disabled the PF VF BAR
> size is left as-is. On platforms with tight MMIO apertures a
> subsequent unplug/rescan followed by another enable may fail with:
> 
>   "VF BAR …: can't assign; no space"
> 
> because the PCI core reserves address space based on the (now large) VF
> template, often multiplied by totalvfs.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
> Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
> v3:
>  - rebased to resolve conflicts, no other functional changes were done
> v2:
>  - Rename helper to restore_vf_vram_bar_size() (Michal)
>  - Use xe->sriov.pf.device_total_vfs instead of pci_sriov_get_totalvfs(),
>    which may be capped (Michal)
>  - Switch logging to %pe (Michal)
>  - Call restore unconditionally on enable-fail path (Michal)
>    (drop vf_vram_bar_resized flag)
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
