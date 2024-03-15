Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83337C54E60
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 03:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A02910EA48;
	Fri, 15 Mar 2024 03:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lx9yH3l1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3610EA48
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 03:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710472207; x=1742008207;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XvtrzL3X1lOa5lnLPCCEBD2YcI2WKuz93Ku3+wC7hd4=;
 b=Lx9yH3l1oLYs+RfbEUfzRC4ruunUo/YX+W5/I2cmMglDeC0dzkpP+cxC
 RfIBdi3Fio46Fo8eFN5DXtjZJ86hl9UcEI2DdYLRonLFrcXn3L/ZjjTQx
 k87gnRajoxgg18+ZOiAqdwrbTY4jQ/itSlvfWu2vnR3m05FI09Ns7BHR4
 g8nf/oPOkkU3ntIw+jjuyCrCYYXFbzk3fXdoAP07I37c9I2qh8IY+ZiAM
 3rjfR+Ipwf4GkePakA93CeiPObjvBTLh0N/1tG7PKi26KrM4OQMF+aTbe
 KM46EFsVmQxsdZ3G9DKEdGMcEvI1rs+OWQg90RpEpKoTse3RbCIslvLQc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5458149"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5458149"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 20:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12555497"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 20:10:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 20:10:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 20:10:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 20:10:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 20:10:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO0vh9anOAZlqxMKxhh4U5bEgdz9BNBY+NUll5wHRZjx9ZsF8PkoOqQRO+J1mUGaOCA9vxIIk+rcFcPdPizCtBFuj9upBwrL3r++n6C+SpnPpHKw7O8k+tQhv/70lLuhoMIICHRzLNsESUdDbFC46sVwS2uOQK7sEi+l3YXvzjsPa4+KHeNJgSN/4oxdrTKFwwTUarNnCdTDmO18sUZh1GUySGhBkpvWEAaJjrripZ3sHGxNH8+Z6MHmXmgqyltOBJBu4LraTCHZ416yZSs5RUi69+kkpmN8oql7F01LSMyE6B5tXd1b8rHSyyvRhG0NRCV+TxAMAMHdFPVxhF66jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klDe7balfBl8urrBH/k1755BoT7rTAQgVTQ5YHdVaQw=;
 b=ZnJSrepXOJi1BgJ438rX5Euf62O2lvxr0S2bE752c37zOZIBRLU5HPb+pbgSgLaZLE33mlk2V+k37WQ4Z4J5b3AmoP5M0Qz94NN4dEK6pMg02U8Nj2/KGNAs21XFe1cKFwdf8RdC9gahHMmKOYxObS67qbfOUGhmrna8S3/apFVXEWQqWrFdGndH7/E1FNZ5mhCz3+XrsWlhVZ6V4tfOSD/H8HAI5fN/FnTHIpDQu/RNCXHxBqwsWppbhfiny7IJBeO4m1LN1SeyRf39g5imshKndCZ5WaJYVV/k3jaXjDgKKHPS4hmxzgG/lWAKpee9NxFTcQtGZ2bbDfpWxulJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 03:10:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 03:10:02 +0000
Date: Thu, 14 Mar 2024 23:09:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple busted state
Message-ID: <ZfO8BzWmVJ98T0Eg@intel.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <85sf0s5lvr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85sf0s5lvr.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd2afdb-97ff-496b-ff33-08dc449d680c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qBFEEn0h+pYwWAKq9PRCiH6W7u5qWNBKXsJBWtF52WXbsYJL7m/4CSHm/09iIS5huwjASsnBAdArMuI+C7Fh0kJ6mIP9ZN+J3BB0X7we/TPRwbyUz4T34qaf2CWg2VdDePoh1/iRpGHh7jyi+93THE37U0pqBsweR30eUHxM8SAOtzqIt7GReEQkXjh7zQd/NF+hjRODPWxN9VdWKEaEtKN5mq0nxsLbgGaa1kOWQan4oeuMS2DyWxW/FpQz6DRb0jGe81KIEXgtWfIOuNGQkHCO/W1+/QYzhWgfo31TR2Qs3aPPu+3t6J4CFKaJu1mrL2b+GbkzYSoGgwCMLVz1Thabwiz4TiEbFiHRaUAlisESkjFM9E5oz9IPXwMbdyFvK1GB9tb5SYxMo188jR6bMEvNifaf4CIrxebf7pGuwrdQudUcWx0+1E3glg2zKTRZdcf/Mf7BucLDPWutS6jPfAKqw+44m/mNfZ6+kyP9eTlB5VpDRfolb1pQ4A8a5a4Neh44aTn9rodhBTGOBlrKF4pmkHncdRxLgi4+IhescBsuPic+IRAjgzHP/2fOPQw6cTZrPoBCJ64gEiInM4WlJFucLb+X/UTSyFPvB3NmDgQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUptUkRvdk1jYWJxU3BOSkE0TGdWWTE3Y0NFWGZOaFVmRVFmRngyb2czclJm?=
 =?utf-8?B?OXJydkxiV05wNjM1azVXRTljMDczNFI4bTVsaUxWODlUYlN2dVdPNyt4OFVy?=
 =?utf-8?B?ZG1veXFIUDhZb0RDL1UwLzVEK040UHJ0VGNJSC82NGdFQkJrSWM1MEttQlBq?=
 =?utf-8?B?VE9qSkVNeitpdFNMQk9icGFIcnZ0eUZlbkZ5ek0wRnk3UmltUmhpQnV5aWp0?=
 =?utf-8?B?TWZBRjRCVjk2SVVLZEppeUhJQmtya0VZNjVpTDdEdVZxK0t0bEFKck94Q1h0?=
 =?utf-8?B?OXVYZkZwRVhic1p3SmwzQU9sRVF5K0JQQ1JCR0NreXFsSjZ1YjZIM2ZQclRI?=
 =?utf-8?B?NmNFeDVjUDZITDV4ek15RENkbUNVcVZTa2o3NlFKRW5BYk93Ykp2dkhKNWRz?=
 =?utf-8?B?TnZ5Tnc4SjFLU0d2N3lMLzcvZHZxZFY1R0I0WjBzSGVlVkZwU2tvSU5VUzdl?=
 =?utf-8?B?WkI5MUVvSUdjakRMWm8vRmpDejJKNDVjVVlKZ0IvTkhtaE1qejhicENSalBX?=
 =?utf-8?B?Vk94djR6VWVsVkpJV0RBZXc5RzZBa09vU2lnSnFPZGRscWM5NnhIN2RmTmZY?=
 =?utf-8?B?SHFSdDdtQkhwUkxoejBWekZPSjFBREkrU0JzU09GaUJjL3cwT0xMbGZUZTRD?=
 =?utf-8?B?SE9MUHNWbGtmNVZjOUhEY2I2ZGd3ZmNpSGZZYWs3THg0TEtNMU5uM1lWM2wv?=
 =?utf-8?B?M3Y0aXNLTnZ5VytRWDlxclVCb3JaRjJub2gzeERHVCt0ZW5LV3dtVHhOZ1FZ?=
 =?utf-8?B?UTNwNmdGSXhxc3F0Y1B0S2M2U3ZIbitHM1U0NmIrZG1SSU80Y0pVdzYxQ21a?=
 =?utf-8?B?Sjh4aXcrL1ltQlVLNk53NThuMy9UeTNzMGxWTjJRK09EVVBNZzU4b0cvZFVC?=
 =?utf-8?B?M2x1Zyt6UmxEY2NhS2NGcEtnc2prVVZQaG1VQ2IxNlVMcnY1eWtCays5a1BL?=
 =?utf-8?B?WndUQjFJUW9mTVBqUy9yY09kb3RDQVNvYzMxalQrbzZFOUc5Wjh6RG5odE5s?=
 =?utf-8?B?ajdpOUcwR3k3NjB6MGlISTlNMkFaL3FaOE4wSzd4UUN0YTZPd3QrUHZCeUYy?=
 =?utf-8?B?QlNyMklvN2hwSFhBdmdnTUd5akJVZnQyWUJSakxuYXp5YTFjc0tkRkYxMmdI?=
 =?utf-8?B?aGNOYTFTWUxZeTEydHFtdVlyUFpBVnY2K0t3MTJ0TXhnUWcrWCtna0Z2ZmpU?=
 =?utf-8?B?R1VPeGkvRUliMEVkTWRHM3dzRE5ENDRwZ2pXSXZDaHYvUFpEbUxSbkM3MCsz?=
 =?utf-8?B?Mm9ST0hHN2paYlpOM0c2QXI2WU1tUWhCVnl6M3RTOHd3QlVxaXJ3UTBJVEg4?=
 =?utf-8?B?Rlp4UTgzekdhM1hTRThqOGo1ZXpJTVpSS095azBvejdOc2kxRDg0YVFYck9G?=
 =?utf-8?B?VER5M1hYMFh5cmh1bE9US3ZkdTBPcEhkdEp3anl3R0ttczVPN1h6SldMWlRs?=
 =?utf-8?B?ZVA2QlgrVTNzVnZhYXJ0Z0tlWWpQQXJ6R1pGTC9OOFNwMXo4cVhNMnFmNHZp?=
 =?utf-8?B?a1lsWk9HN0ptVnNydjhCaDJGY1dxc3R2T3pvSW9RSlAyVFlTcDRGbSsyb2ZV?=
 =?utf-8?B?S3ZTNWpaYkJRNTVSMklyTWhhV09jZ3FyUG5NOXN4MHJBRTZROXo1bHdLbGJN?=
 =?utf-8?B?RmNYS1Zta2JjTU11Ly90TjVGUytnWjNhZWhQejlhdjd6ODU2SWZ4MWFWRHVF?=
 =?utf-8?B?aEE0WDg3Q1Z3LzJaRzIxK1NuaHNzT0QvVU9tc21qYW1GM0NEWDlXR3J3eUFK?=
 =?utf-8?B?dzh0WW5xMDREaEtiQ0VDR2VaMzNWd0hpaU5TSDZKUWxVVnNXU2pUNHd3bGpx?=
 =?utf-8?B?bTdrWnRvNmRtNFFybExiVGsrYTR0MGh4Sk5kcEVONkQzZXNlTGg4SmlGSG9L?=
 =?utf-8?B?aUZMYXQxdWIzZGZFNUpEeUcwQjNrTUpDUENTNFpMK0ZUTG96amdXRkNXaWRO?=
 =?utf-8?B?QnhubktDYm96bDNadVRhRkNFdDZncUFnbU1QRStzUGtLVWZVN0xsbElhTXlv?=
 =?utf-8?B?RGpJYzdxRG00M3NnRUtNeWxZN2cySURPclo4T1I5Zi9wRGU3Wk5iV2RxeFFq?=
 =?utf-8?B?Q1k2cVlRQTBsSDNaK1hTS2VQeWI3RThrT3F4dEtmVjZVeXZnbXVJamsrRWZP?=
 =?utf-8?Q?Wsd+MDqe+GbsHD6j/76BPtvQS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd2afdb-97ff-496b-ff33-08dc449d680c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 03:10:02.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bm5PwM+Rf7vsRRVco7i5D87EdpQSfD8NlIDohFHHvB45r2r+JacIdV1t3nwqQyq2wq6+mVnmEuukdPpyXOveWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
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

On Thu, Mar 14, 2024 at 06:23:04PM -0700, Dixit, Ashutosh wrote:
> On Thu, 14 Mar 2024 18:03:15 -0700, Rodrigo Vivi wrote:
> >
> > Introduce a very simple 'busted' state where any attempt
> > to access the GPU is entirely blocked.
> 
> Busted?
> 
> busted. / (ˈbʌstəd) / adjective. informal caught out doing something wrong
> and therefore in trouble: you are so busted.

that's why ;)

also:
https://www.dictionary.com/browse/busted
"broken, fractured, or seriously damaged"

> 
> Why not wedged

https://www.merriam-webster.com/dictionary/wedged : "shaped like a wedge" ? :)

or perhaps this: https://dictionary.cambridge.org/us/dictionary/english/wedged

"to make something stay in a particular position by using a wedge"

"to put something into a very small or narrow space, so that it cannot move easily"

that's the i915 terminology and meaning that I'm trying to avoid here...

i.e. wedged can be a temporary state like in i915 where we 'wedge' and 'unwedge'
the gpu in so many cases. That flow doesn't fit well with xe scheduler and it is
a complication that is not desired.

So I want a stronger word that makes it really clear that something went wrong
and won't easily transition back.

>  or lost

but not that strong...

it is not entirely lost... we can still open the client, otherwise we would lose
display and also get the guc logs.

If we really want to go lost and avoid the client connection then we could
simply deregister the drm card device for instance...

> or down

looks like 'off' without power...

> or dead?

too strong... like lost.

> 
> :-)
> 
> Ashutosh
