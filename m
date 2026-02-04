Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D954E83F05
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 18:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4B110E739;
	Wed,  4 Feb 2026 18:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrKBnuhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A0810E737
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770228936; x=1801764936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a57bjz3qZ6rdTWeRi+Kb8LCflAInT9K7ZwPIRP4bAdU=;
 b=VrKBnuhRwqtZG9gfm97TZ1xQjve0/snICeEm4/GS92P8F2qZTtLxKFEc
 W40/2jP3I1kHNZeHUQIaRC1SqpzuI5xRLbM6KxRQNBK1LepNb0N0lp3lo
 NIAUQM7SzVWIRHvCMNT3eHFGxLbp/7cEAHFU43beqf9tMMjx7hw2Y438i
 Jb4842Kz/1QWZDA4vhf87ofI6L1oBdsvqmYJnDz+tVlFhq4Ks9d6tUbS2
 68xgFTU7J/h3ET7Qo0PCJLYRq2QXb/UpaCUk49c7z8bgvRTcy00pyCwvM
 rgBtMoN5IB6g0FSJrJBmRlDuUQenOdFuebFcBa/w0WeDn1e7X1LU3K2WX A==;
X-CSE-ConnectionGUID: R2W03veERmuhITrZdYDfmA==
X-CSE-MsgGUID: kElnpjO+QsmZmY5Y3Zuspw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82858288"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="82858288"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:15:36 -0800
X-CSE-ConnectionGUID: nVSckCfwRL+jW0VO9e5v8A==
X-CSE-MsgGUID: PiP256tNSwO/tOlLvI5hqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="210029073"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:15:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:15:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 10:15:34 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:15:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4QuE++hj0HT/PvXD409qLxqDWA7hixvpDfcggmBsuqHuovm9jMMFTxj76RI/ki8Hk3698YfKstW9LUQH9+jWJGOOvapblBXL3EdvSUZcqcD4VU3Soop8T7eVdrmEurZ/kxHyAk3sgw/YOyeOfU8kyBH9BXS87ZX3mnuI59aCffR8Bl+nd281fhhoaSyb6JOGuCrY4OjSqWCyqYlkQkVetrBQApblgLzSd4RoLDR5X/d+R+4pcS/4aO0zqemDcFfW21647gA986lBKDlrYn7mLIWp2UIqJ6nhCW1a/RQAIO0nnXwQ5RXnP+5xNGJ1RX9GmBkNIfIDrmVJWMDr3sgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GHbzh1QTMhTLFGjwUynXD8gc2mMLxB5k4FGYM9+TgM=;
 b=AyVa7LaQ4c9cyE3fFbs4m2WcoSSmpnDl4DrSpuNPZafQogMnbmKK+Uain6sb1Q0maR0D8dXHakpDqmiTtKsh5YSW67esEsZzXzITYe6mW32hOGDSjquvpsxI2JBd6ZrdUGRmSDE0jAJgkMhYJFyQjjB3WJthKv2+utP0MWHsgesxRt1OMJWKVXWKRHlpPDNxgRNE/FjXhTfZ41AceHsCwJhcqU+nNYe3FI3W9J1hoOBBADpnDUkzTRxmPi7MJ874Htvnx0PzKzUEKltxZlTfFWmu7JEt9VYjMZ935LUDUHWE6xi35CukBc/qM5ZkUVSlBikpzvQ5ArgCbNTNDiranQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7275.namprd11.prod.outlook.com (2603:10b6:610:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 18:15:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 18:15:33 +0000
Date: Wed, 4 Feb 2026 10:15:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/reg_sr: Fix leak on xa_store failure
Message-ID: <20260204181530.GW458797@mdroper-desk1.amr.corp.intel.com>
References: <20260203173639.1399354-2-shuicheng.lin@intel.com>
 <aYNv5BDjgbOPqOJD@bvivekan-mob1>
 <20260204173546.GI2174980@mdroper-desk1.amr.corp.intel.com>
 <DM4PR11MB545681E5CEB4B02A40A58DAFEA98A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB545681E5CEB4B02A40A58DAFEA98A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: d4d72678-4efa-4467-fc46-08de641962d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZpgQRWwzvcKBSvcWyjyod2/ZELmR2rEwM1Gw2LuP4bjEreaj8RPyb5vG4R8J?=
 =?us-ascii?Q?Ipdg7fIkxN5rG+coOkqK89+Yasy25l3r5wu9BEF858W/yBomtCZSP0UR1VQA?=
 =?us-ascii?Q?g9cOpFycjtTaKNym3jqNQjnsPOeTbk/pw9wSJHaXMGwIpkGiBtiCrAX5f+2f?=
 =?us-ascii?Q?f9yQBYCEZ7NReOVcNccUz5KsKmCrpbsHNalkzdxxzc3E759lx4z0iAUoH3v5?=
 =?us-ascii?Q?GvQyJGXmgg2YyqbCuj5cikAZSAgXjUtFimbhKPNmR1tyY95ZuywyCY3nLrOk?=
 =?us-ascii?Q?uNZQWm8qO7XGLtaYSI5ZBlbQESp9I1CgiV9M8Ra2O5d8DqMlskGWaGUPJEPs?=
 =?us-ascii?Q?imh2nKHjl/s7N62RekTBxUzUC8wyd7OgIU09BJBduc7cWo14Mfo9yv+Ma185?=
 =?us-ascii?Q?NXdZr8ZpEQ1MCZuOfPCrvUYavKOVk7PkM6Ag3NswWjx4PzFh1pEVIvlCYZtb?=
 =?us-ascii?Q?J47m4NmA/gbhcEyZHoAxdNXO5jrOfI3kQZqfGRb0rDKIJ3c5+BUbrQVJtuCG?=
 =?us-ascii?Q?XtMRYsgKQdRlK+jH70kaZci2bGIvx6m7HaazQK/XxQaaEWi9934S0WnlZCfT?=
 =?us-ascii?Q?lq920n+1zxpUbXCdi3jqbD+6YOwezLzAlt/tcD9HDi7XcUni5da4+Sdwl8Tz?=
 =?us-ascii?Q?YCFeXwHwmPAEEbLNdR1svg44RAlRnxNV4b+T2S5Yi0SS050ocuqFYBT8terU?=
 =?us-ascii?Q?g/LMZyZgvyZrVyzKj+8NCBKDoX23kH04SVUgbAvLN1elOdXwac+R2p8H5BSZ?=
 =?us-ascii?Q?GT0/rbdzNpfJtfDTNNy0uwS2oYdeF73LNFrYt+Yhb8/Gb11v7bM9s2J4h9DL?=
 =?us-ascii?Q?TGYiSX9DNHydug/B6n9oBCXxSXYV0P6PGY5lko1kp8WKWi0ztt0Ud2mFDjMJ?=
 =?us-ascii?Q?A/J+Zdi8D/ROZghVoSK+W7DHVZlePUxS3DryE1Q9hgjrIbyyc2h73iZkxZCC?=
 =?us-ascii?Q?uM5VtaP8aKbgz+jUfUCIQIIdBTZA9APRSbAm4W+MouEwsnF/8ljEeC2SKtHC?=
 =?us-ascii?Q?aJ2RNW5QDnfk8R8JeNyNcBR+agVK7QdBALv2Bd2/M9RmPtl70Y5rA25W+YyL?=
 =?us-ascii?Q?rsSMBYvDZabC+7bOHl2yLIeWPBJ2iEuA7uptYALE46cITq9HeJv/AwmUPySc?=
 =?us-ascii?Q?FzjFWv+z/5oBhE15Wijzzt6fk3hpUEx31EUs0ll8CelaImw/6xrTlT9GIUkS?=
 =?us-ascii?Q?I4XtSHolJk5e/kqieYWTu+WSxkz9xbWyzNOz7tWjaAs2/vHMb55BgJ3dIzrd?=
 =?us-ascii?Q?yy3kgC2e+PmenooU2LAJoRsIq1atwHOzVMGz9ZCF4qDmrEH/wHKUHX6XODIW?=
 =?us-ascii?Q?8sD8t5uRXzAooMFbTk2NQl/EtKtYSmeXfo+I/aoXu3Yrp6lcMJjPljS1xQhk?=
 =?us-ascii?Q?v67fHdgnvd7m8V9mKhoncfPex+ePaWjxZ/C9cCMnwUowpaJgin7jkpAV+dPS?=
 =?us-ascii?Q?96btCYQGuYzxkgOO2Owq5KWXjWb2z69szoVYKZIF3Otyw4V8aIFVJ1aOLem/?=
 =?us-ascii?Q?ew1uhmUS5jCtjjUb+jTa+qRPxJIBM30/WQvREiOhtgNocE2zn/nTFDelVmBE?=
 =?us-ascii?Q?yU+g4XqBgDNx/DHTKGk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fkf3xmfEUx0Gv2VjvVtR8GeXCPJurDAFDHy2UjTlZX/3oIo95i0+tzWwBCbs?=
 =?us-ascii?Q?Puk5/IPgB5XmiAuLbQwARLv1xUmZ0sZOAryK43qT+BwgVou3qItImPRGMCDL?=
 =?us-ascii?Q?SvTQ4GsjUG4JyM5gDooWdyDjkqZugjqQ4OGfV6OyVh6iqAqQIagqyxsQFsML?=
 =?us-ascii?Q?Ta8QJ/y/ROaUyG++BixfOfm6rwk4YA3OLygdWjM73sannIN5oTqrt6NObmvp?=
 =?us-ascii?Q?yD0AJId9SwFMYfi1/YGTEua7YD9ppwP9oGOvWwNgKGvYNCiBu6m4YZ1UbqoC?=
 =?us-ascii?Q?to7NJKGTPkD66xdnBMWNjURGHFbKQPko/Wf29B6HVSE1nyqq0MN53k+GZwSI?=
 =?us-ascii?Q?Q0aauFppbwmalfP3yeJ0mxwTToMSOa57r4SHT2o8l+ZiijrFIhF0bXtG6wAN?=
 =?us-ascii?Q?ZKEwtnM3bDEvxZZ6oJYOTu7A0s1gfZUuBP01jQOmDVlKULaLqoDxE519rTcX?=
 =?us-ascii?Q?du/YhPfHZTdIz6wrYXWFNu797ZLySb24j0xkEJoQ1RIPEj33DiqObk0C0Kel?=
 =?us-ascii?Q?02ZNDaV3KWIGNtT606TRy1TxWFPGZ2HCr4C6+FaoK5yVdwGfhrQoPf9qPTvv?=
 =?us-ascii?Q?Vtl4gBBZ6Lnjhqmhpvbrp2Ksl4tiT0LboEHYLaB19psIdrBDLhh97TLmzpmy?=
 =?us-ascii?Q?fKYtl69ixryMkfDlQ4FOfFWJxAPTaqiKdBl2gKGdJ5DRhmBjfvQ6cbuKo3AK?=
 =?us-ascii?Q?zkXfKGp/4c5cRi/kb8d1xN2tHM5n/DLQViwF5cAGqLlquYeoGO4OAA7j8h8i?=
 =?us-ascii?Q?FlTQuVqldUKlZX9k9FwjCIXaympqTSoo//JICsZjePI+0P3T7zFY3A5+Gc6P?=
 =?us-ascii?Q?r1wvDomuhufFfLwkl2pm8FD0LqqcD5VOC2ZkJDqWd8yZtnoOd+AfcS06cT8F?=
 =?us-ascii?Q?iNoplpN9LwjLdht4xwKkiNXtvDgFV6WSmgUJeFO2rLfdizmg78+ZzEpaua7R?=
 =?us-ascii?Q?hdZbpY5peK9Eye3G2mcusqKyBT+CnaLss5UQPSAj7jadMBiYUEsZsif/6AVi?=
 =?us-ascii?Q?0aKSdp0MWGGE3JgR+w+mS8KhSRgsH3jSe4kOCrY/W6ViywOxnqdPPowh6ESG?=
 =?us-ascii?Q?cwcl7OIisTR6H9+WNcU7ZZWeK+VvxDbvPCXREgdsrawYUXzykEss29CiTfNQ?=
 =?us-ascii?Q?hobjnyEvosNNMZQe1rB2x/8ZnXbAE9VhnoRP3kiTNJeRgjAC7dBJOBZ5/B/t?=
 =?us-ascii?Q?aAFVuAou+2TJ4rllA6HnlL7x5TNIZe6dtKwKxJQZ6QLS7ZxQ5yF70wViiypm?=
 =?us-ascii?Q?SZlyUT65jyQLr450zI1wyZpMc6q3grTPrGjqcP3qkMKcqSQDyT1LPdKW0uhQ?=
 =?us-ascii?Q?DBQW6qKzaxnxu1f5g+Gkz3ENBPnvkCaUj4VST0DUz295l8JzN9fdOtrVhAqM?=
 =?us-ascii?Q?6q7GZpHkI/lSYXINFy9KeRR/Ek7HI8hcfMFGD6CCj1as+kM1I/iIpDOA0XUb?=
 =?us-ascii?Q?AHF6/I9RtfiwSsjumNXDNvJlsZJnC8rsULYRB4f4HBtwLDxNohPZHEqrgFZG?=
 =?us-ascii?Q?knS97fCVYCT6G9AzVESPgOroM40ZwhkwlD6dJzXRIfNSc+yjhrato95BHH7G?=
 =?us-ascii?Q?HEanSFBHEg776FR90/mkHWkmH6euDeWDZVH+RAfmckOg0bwWNLLoHADQEKlG?=
 =?us-ascii?Q?li4pFMJ0AHddbL1BJAi+zYg3BsOW2cs6Pp3sgQHRhp5PGA0pv19HROWOAUDZ?=
 =?us-ascii?Q?bAMnkmmGFrKQ9hUCBD7ZNU5Ke9XahOWMoglg+qGJXzBrr1fC8sIzAbR2ChHa?=
 =?us-ascii?Q?Zd0/J9bn1FhcwfwqdmeRzDxoNQ9IvvM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d72678-4efa-4467-fc46-08de641962d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 18:15:32.9936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLn3T0BhBmGA+h09BmubD9PJ2TuGNZNcx/zmP9DPnhqw5QH8gPRROMjpJz9zkCiFYTMDOtuhlhsDAzj6PgysvPfnLc4qaZYErPJfT7Hj8Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
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

On Wed, Feb 04, 2026 at 05:56:30PM +0000, Lin, Shuicheng wrote:
> On Wed, Feb 4, 2026 9:36 AM Matt Roper wrote:
> > On Wed, Feb 04, 2026 at 09:42:20PM +0530, Vivekanandan, Balasubramani
> > wrote:
> > > On 03.02.2026 17:36, Shuicheng Lin wrote:
> > > > Free the newly allocated entry when xa_store() fails to avoid a
> > > > memory leak on the error path.
> > > >
> > > > Fixes: e5283bd4dfec ("drm/xe/reg_sr: Remove register pool")
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_reg_sr.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c
> > > > b/drivers/gpu/drm/xe/xe_reg_sr.c index d3e13ea33123..ce3dab8a0f47
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> > > > @@ -74,6 +74,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,  {
> > > >  	unsigned long idx = e->reg.addr;
> > > >  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> > > > +	bool allocated = false;
> > > >  	int ret;
> > > >
> > > >  	if (pentry) {
> > > > @@ -94,6 +95,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> > > >  		ret = -ENOMEM;
> > > >  		goto fail;
> > > >  	}
> > > > +	allocated = true;
> > > >
> > > >  	*pentry = *e;
> > > >  	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL)); @@
> > > > -103,6 +105,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> > > >  	return 0;
> > > >
> > >
> > > I would suggest create a new label above *fail:* which does kfree and
> > > jump to it whenever pentry has to freed.
> > >
> > > fail_free:
> > > 	kfree(pentry);
> > 
> > I agree that using a separate label for the free is the more common idiom in
> > our driver so we should probably do that for consistency.
> > 
> > Another option would be DEFINE_FREE + no_free_ptr for automatic scope-
> > based cleanup, although I'm not sure it's worth it do do for just this one
> > function; we may want to explore that later as a broader cleanup of large
> > sections of the driver, similar to what we did with force_wake and runtime_pm
> > a while back.
> 
> Do you mean __free(kfree)? I did consider it also. And I really like this auto cleanup idea.
> But it may not work in this case for below 2 reasons:
> 1. pentry is an input parameter, not a local parameter, and is allocated when the input is NULL.

I think it would work if you allocated via a different variable rather
than allocating directly into the parameter.  E.g.,

        new_entry = kmalloc(sizeof(*new_entry), GFP_KERNEL);
        ...
        pentry = new_entry;

and put the handler on new_entry instead of pentry.  If you used a
passed-in pentry and never kmalloc'd, then new_entry would just stay
NULL forever.  The auto-cleanup would only be needed when new_entry is
non-NULL because you did a local allocation.

> 2. pentry is freed only in failure path, for pass path, it is stored and will be freed later.

On the success path,

        no_free_ptr(new_entry);
        return 0;

would inhibit deallocation in cases where everything went successfully.
But leaving the function by any other means that didn't call
no_free_ptr() would trigger the cleanup.


Matt

> 
> Shuicheng 
> 
> > 
> > 
> > Matt
> > 
> > >
> > >
> > > Regards,
> > > Bala
> > >
> > > >  fail:
> > > > +	if (allocated)
> > > > +		kfree(pentry);
> > > >  	xe_gt_err(gt,
> > > >  		  "discarding save-restore reg %04lx (clear: %08x, set: %08x,
> > masked: %s, mcr: %s): ret=%d\n",
> > > >  		  idx, e->clr_bits, e->set_bits,
> > > > --
> > > > 2.50.1
> > > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
