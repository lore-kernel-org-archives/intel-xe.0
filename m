Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA28CD4851
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 08:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7075F10EAFF;
	Tue, 19 May 2026 08:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4uPMxDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC6710EAFF
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 08:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779177700; x=1810713700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=82JzQyC7qXQ0GHc8BVv0tw88iFOQChCd0F3UAZD4RIg=;
 b=V4uPMxDbfmVNsssz6FDJKbgm4GZT96l8Ts5WJm5iEk6eaT+QBk9VYDlS
 XsHtZVFoNLjfVA2szLmvwHFLzteQwENOSkj9LOXJAUeZlCOYoeMMb6Sja
 by0gL0RtIJmKSltnjqVs0QaA3FL6a71+p8aLjfKrNVdZsDh051jXKB+Dg
 z/8PZc8pjnIdZEUPFAeFFp7luMLTcbGBdSMLlvd9cUIG/FVrGY557gSx8
 g9+EeF5R/lJu8m6J8RPmn8EfKRQJlcWC5VioI9r+phPdyghEU455Yyv5i
 psMR+hk/3V1cqxi86PjUEN9wFyl/RLTKUxgNbt4+o8k1YtncrMKsz+6D0 Q==;
X-CSE-ConnectionGUID: 6qoYFkjQT/K/AUULUtf0lw==
X-CSE-MsgGUID: ciDC01jjR62TIPOFxA/6xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80027765"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80027765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 01:01:39 -0700
X-CSE-ConnectionGUID: BNRs0KQXR+W9UkLD0HfsRw==
X-CSE-MsgGUID: O9S/0Dy4Q5aOISFDEEP6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239568883"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 01:01:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 01:01:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 01:01:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 01:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDbujD5k/OnAR1eA08qS+N8ktzPW5I4p47hyEoFbbnqdZbWabA3c81wBVio4tSLqHBT+5O51escFgCyNZborMUh1omcI6kjQUg8QwEaWNVXsYvT+MAk4ryF33sho5C2OS/3vStgo4hrVYAW0Np4q1MVi3pMFQu9LpK/qZGMCsZXHCaAXAATLwdfmMWFxTVDojj+2UtFqnWPv5XM3XljVn6rRd5E/8Y6LmeXfXkxmtxvFW29n+hqllXVbEdh4GE+fkpzWasWWxdwunOLCRpHf1sB4gvpPEgBs4LtybWCYWuLeySeGqTnk1jAbGWp+uCbm7ePdkZO4aS3LgWkwB1rN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJPVTW4XSzTjeXxDTk97DaXgXzxhsPX6j3VIfNvtVYs=;
 b=WwCDhhVkROiZzlYwFdvJALxTfxRiveHY66gFeTSUBdEE1a2V9zXmMNYyg/rRJf2GcyiD9gK31MCR6DOoqebMfCMfPxd/zrpOupAeq0Y7HHFI7F6Wlhjprh1FIIRUvjW3yqBMo76LgdQc7yd/wNAg9XVBkhxXLzW7O025urKK4PrrHd9GPx/smDdyPqyIptbzDLsFzotoDcKikyoJ30dUpeVaJpQVx3gwC5nDZFW3V3MfF27Q+sjLtXOr6JhPuSpDA+Wsu882re1T4IfDdsbLPz2SLCeXYZ+l3oyS41xATvDmz9puHQOBkbzOIw8Iqlbad//2BiG2qXeb5GTwHeDXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 08:01:34 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 08:01:33 +0000
Date: Tue, 19 May 2026 10:01:25 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 11/12] drm/xe: batch CT pagefault acks with periodic
 flush
Message-ID: <agwYz6XPiNoOkFvg@fdugast-desk>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-12-matthew.brost@intel.com>
 <8c6eb092-b0c3-4364-b053-6749e4c0c36d@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c6eb092-b0c3-4364-b053-6749e4c0c36d@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0147.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::29) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de22a54-7563-4bb2-8ec7-08deb57cd7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: D2uGRgvgY266lachFLKViItaSWqggvtCxi+MjftVKaguZ7+3vAW9ZiaHyJMiQhc7IgKOgq0o7ZMfNCKrPAgNZLvUJ8IwB4W6JggDXC/KpyAcl2TOYKcCvlrjuyFEKhhGSgcQ2Sa15li6GjPIGKiaybMnjCs1SIWQPNOCxtdz1I1TDCO9iIma5BJW/oeLdGce11fEipjmm2h6zBDLxnK6oBKk2ZZRXRAuSdKnbTB31PWoq2QWD0b/RcJqN7qXFZaM7eTGRCX0PFyfwQIyXvEE76lKKZt7JnjnEL6+74YnNoSkWwjzpJxGXo8oRSoU6Zoyws+N90qNsbuhiBeau9v/Xa6yRIatmixHNpLjS4/NL/JRtfTVl/k8adKg4c81tLlah1+1W0VJ7qU1si88bb2jhO/X/rglKmXNFmMj4usZzH/lvB5Cl3KcsydQ39xqn8NKLPptZeD9jgmqi5dvtYG5oxbjGfwSjN9pa0UsEoM2Gz32qzqimtCfuct9JDqWDBRO3HEfhGGnWsa0KxHIn/tYUf/Lh5BgZ8pMZKyz2jPGM1C0RgP14zh4vnvbzDbnkZDgBymtZEmiadG3zAN+Rds+sIkRHL1MOX83omDnM44YBU3dzq0pC7jkjavUkJBgMfFDo2bpNefTOtMHREYUpLP0sB7UWuWEw4vZuoZ6EC+93PXJighfu1yrYMZj0VfaU9fG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(4143699003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVNyTktwYUpySit3V0xqbmhLSXRGUnlzMGVKSTdtTmFxN2hrVk91cEcrdUJI?=
 =?utf-8?B?eE9LeFNCN3Y0TlJJblpoUnJYNi9iV3RZL3U4MW9BajZZUHdnR2E2SDlEdTU5?=
 =?utf-8?B?VmFMUU5yWnRNWWJIeWtQaFBCdVBIV0NwcnpyS2RlVTJOSzVBV3F3Mlh1RVF3?=
 =?utf-8?B?dnRQQk5TL1V0SVc3MkhHNTlzVGRwZ1M4aDZBaXNUWXRyOWpUMHdnSS9wZ3hX?=
 =?utf-8?B?NG1vUHFDQmYxS0xabkpKZ0xSYU8wZUFiM1B0ajJyS0NrRmpaVlZmVTBkS2Jy?=
 =?utf-8?B?OGo2QVh4Y3p6SlFSWTI4aFRLbVA3YmQ2M2F1cjIwQUpFRVpHaENub0RQMGVn?=
 =?utf-8?B?Y3BuTEUxanYxeHA3RGZ4S3Q3SzMwWnk1T05xTzQ2NGxHMUFCTC9oeUh1UVlu?=
 =?utf-8?B?czJKd0ZRRWJBZzNMblk2a2VtSTEvQXZYVnMxc3FCSzFwcjdUMHJBSE9wVlNt?=
 =?utf-8?B?bG5RTkR2YU1MaUhENHpVTkpQN3F6Y0M2RkM2RWNxOWtuWGM1c3pzRUxOOXMw?=
 =?utf-8?B?QkZWTE5sTURsT2lycFJzU0d1TjFORFc3bGx0LzJEME1QRHk0TnJqei93ZnZz?=
 =?utf-8?B?cFpocjBlVkMwSVRGSG1wZURidXZUeHpscmFkdnplaGNoempja2N4OUlTaS8y?=
 =?utf-8?B?emt3c0psTXIxSEhCUXQ4ckpqWVZzS09uRXY1aGpFcUVNQmIwUW5PM2dFYkFr?=
 =?utf-8?B?SitKTGVQZmNDdUhWUWZyU2ZEWFhPYVlibGQ2ZlAzWmE2N3NSRzNSR3V2Yk5V?=
 =?utf-8?B?eHdEd2E0NlBKVmY0aE5UaFJaUU96WW45eWExOVk1bzBML1p1OEwvRC85T2xX?=
 =?utf-8?B?dzU5bXJSVHh0SnZHVmNxTlBOQlhPbVNLb2w4bU1pcmxkbmlHSGZpRFJCVEtJ?=
 =?utf-8?B?MHowUDl2WnRUNmc5dTV4SVMxMXRiZjRPcnJkcXI4VTB3bzdRdFMzM0x3ZGNZ?=
 =?utf-8?B?Z3FIYW8vSHFOZG9DZGhOL25CRHNzSGJJK0xOVUxBMVZ2QWxuQlkvOGFEOFRp?=
 =?utf-8?B?RnlHNjhQUndjVWFXa3BIYUpGbG81MjhTQTZGMTc4ZDFNSkRZVXJJWUw4NGhP?=
 =?utf-8?B?VFowNzVzdXhOUFZXcGlHcjBzWGhZWGRaT3ZqMkMvcGs5T3Jhbi96ZlMvNEN5?=
 =?utf-8?B?ZnZyblBSTC9mN1hnMXNLK0l1Ym9EOSsyT2lQUWY5VWFlS2JqTktvUkNXci8v?=
 =?utf-8?B?ZzJ0QUlsZDFwS2JPajNMMVJUREl2WmhUSVZNK003eVN5My8wcGJqMFZEM3N5?=
 =?utf-8?B?RDNCZzlkcXE1a1NZVVlnOGh5YTlON2M4ZFhlSW1IYU55eTAzUk9LQldETGNk?=
 =?utf-8?B?L0c0TVpnNGc2cVRJbDZsL1hxWGxDU3hTVTdxUGtSWFQ5R0FjOWZydU12TzJY?=
 =?utf-8?B?ZHJyWXRpRUhSdmozREJTL3VXWGx4cFptczhzSnl1L2xUYURXV1R0ZnM5L2hs?=
 =?utf-8?B?V3ZrVm5hdjZ5eWVRSGlsNGs1MG5iR1I4dDRxWlJkYmU5bStOT1UxcXpNL0RG?=
 =?utf-8?B?bXk2VDcxYkhmVnpDaU4xOW94ZmhTbmNxM29YUk9GMnRMSUIzY2pFRXc1L1JD?=
 =?utf-8?B?TjlrUVFuSWYyWWJHNWgwTVRKMDYzSEJCK0RkYS81ZnJKZzFUQWVORzA2N1RX?=
 =?utf-8?B?MkpYR3ZNRkg1bU5tdS9sdk9ORklyRmRESlJ4Yi8wWUJlYktOMEE2WVg0UXJT?=
 =?utf-8?B?bDF3UTU2dGhCeHhOYjh6UmhCTnI5dVI5UkJ2OGFNT250RFk1Nmc1QmczTndS?=
 =?utf-8?B?NlNocFUwRG5hdkYwU3c5SnI1ZHIxTkNReS9tdlplV2M0Q0k0Yk5lcU1vK2d3?=
 =?utf-8?B?aVdHdnRZZjNneTE3K2l1TEtqK1RaR1ZHQW45ZC9JaURMNE9TQS84NFZ0Z0Y1?=
 =?utf-8?B?eXdYaEtLbmZySUZPaTZIY2lUWVNYbTBhZURSa2U2dnNnWHVFdWVIelZjbGFs?=
 =?utf-8?B?OCtGanA0emlLZjJyRkx3aHZXVHdpQzQ2SlY2TS84KzV4THQ0ZytibDhRUnBS?=
 =?utf-8?B?N1hlTDRXb25EaHZaNEsrOG50N05sc3BrQzNGb1dxRC90aU5mNVNoY1FLSk40?=
 =?utf-8?B?dzd0Zm9ZNmdhQjlLRjZxWC9UT2hyY1RiVkdWSEFteTc4RmZ0RHkxK3VJQVE1?=
 =?utf-8?B?ZWRtZmNPbHJHaHM1WHZNNWxhYW1wWktYSU9HY0pmZFJWRzR5QUNOMVdaSkZU?=
 =?utf-8?B?Y0JRYy9QM3p5ZjBsKzZwR0J3TmJlMS9VQ2ZEb05qNFZWZmdMcC9ZaUtoOVV4?=
 =?utf-8?B?QURMTjdKUEVFWkhDeml5UFUxZWkycVVHSUVLYUh5U3ozdUhsbG5kZ2hrbVJm?=
 =?utf-8?B?VENpcytlclVLK1pFcEFKaDQ0UHYvQUpZWm9sYldBL2xwUDF4Z05jd3VzamNu?=
 =?utf-8?Q?K/INenk1/YRidG9I=3D?=
X-Exchange-RoutingPolicyChecked: lf54/jRBZ8mTb1umaJhttXsOD7jdkF08EL36VzYcyO0RIDhzP9v7u25z1q1D0AX3ja/Bf1k9wdrWb6JJftsIf60vSf6dnk/lwVMcLAfW6Lho6ngJFxuz3Oknq43gP0otX02zTx2rH7Ydjr0pBxRAacCav4+rDtUGjMCpAODGPVn4YKBr4ysXUvuWdRNcFaNrsgiqtycLNowAYtLs6RKBg0aR1xVHa56QeDiI+eRpE6LdYuBBwf1rgRKTVO4blQlGNKDsbphcMeUN/gUxHH5OXa9uJCBUskhqDM6zQreA//GNzIRyqAt1LQ4KEq9XKK6M4AiQ2HhQbFSj5Wc/eb/FZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de22a54-7563-4bb2-8ec7-08deb57cd7eb
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:01:33.9029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSpDGLnSL1aK+BELNNgA07xCX161LafB+GF1M0YtZBX4iUCHCbctfG9PxnSJhJme9PCdd2X8qHWn1sQdBLCXLkfIktUN4HHMvWntkNui4TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
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

On Fri, May 08, 2026 at 11:24:21AM +0200, Maciej Patelczyk wrote:
> On 26/02/2026 05:28, Matthew Brost wrote:
> 
> > Pagefault storms can generate long chains of acknowledgments back to the
> > GuC. Sending each ack as a full CT submission forces a barrier,
> > descriptor update and doorbell per fault.
> > 
> > Extend xe_guc_ct_send_locked() with a “write-only” mode that copies the
> > message into the H2G ring but defers publishing the descriptor and
> > ringing the doorbell. Add xe_guc_ct_send_flush() to publish pending
> > writes and notify GuC once per batch. Wire this into the pagefault
> > producer via new ack_fault_begin/ack_fault_end callbacks and CT lock
> > wrappers.
> > 
> > To avoid excessive flush latency while still amortizing MMIO costs, use
> > a simple periodic flush heuristic for GuC pagefault acks: batch most
> > acks as write-only and force a publish at a fixed interval (e.g., every
> > 16th ack), with a final flush at end-of-batch.
> > 
> > Also increase the H2G CTB size to 16K to better absorb bursts.
> > 
> > Assistent-by: Chat-GPT # Documentation

s/Assistent-by/Assisted-by/

> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Interesting addition to chaining.
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c          | 94 +++++++++++++++++++------
> >   drivers/gpu/drm/xe/xe_guc_ct.h          | 35 ++++++++-
> >   drivers/gpu/drm/xe/xe_guc_pagefault.c   | 28 +++++++-
> >   drivers/gpu/drm/xe/xe_guc_types.h       |  6 ++
> >   drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++-
> >   drivers/gpu/drm/xe/xe_pagefault_types.h | 14 ++++
> >   6 files changed, 164 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 3a262d3af8cf..5a126e19c53e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -255,7 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> >   #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> >   #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > -#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > +#define CTB_H2G_BUFFER_SIZE	(SZ_16K)
> >   #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
> >   #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> >   #define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
> > @@ -912,7 +912,7 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> >   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
> >   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > -		     u32 ct_fence_value, bool want_response)
> > +		     u32 ct_fence_value, bool want_response, bool write_only)
> >   {
> >   	struct xe_device *xe = ct_to_xe(ct);
> >   	struct xe_gt *gt = ct_to_gt(ct);
> > @@ -936,15 +936,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   	}
> >   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > -		u32 desc_tail = desc_read(xe, h2g, tail);
> >   		u32 desc_head = desc_read(xe, h2g, head);
> > -		if (tail != desc_tail) {
> > -			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> > -			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
> > -			goto corrupted;
> > -		}
> > -
> >   		if (tail > h2g->info.size) {
> >   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> >   			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> > @@ -966,7 +959,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   			      (h2g->info.size - tail) * sizeof(u32));
> >   		h2g_reserve_space(ct, (h2g->info.size - tail));
> >   		h2g->info.tail = 0;
> > -		desc_write(xe, h2g, tail, h2g->info.tail);
> > +		if (!write_only)
> > +			desc_write(xe, h2g, tail, h2g->info.tail);
> >   		return -EAGAIN;
> >   	}
> > @@ -997,14 +991,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   	/* Write H2G ensuring visible before descriptor update */
> >   	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
> >   	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> > -	xe_device_wmb(xe);
> > -
> >   	/* Update local copies */
> >   	h2g->info.tail = (tail + full_len) % h2g->info.size;
> >   	h2g_reserve_space(ct, full_len);
> >   	/* Update descriptor */
> > -	desc_write(xe, h2g, tail, h2g->info.tail);
> > +	if (!write_only) {
> > +		xe_device_wmb(xe);
> > +		desc_write(xe, h2g, tail, h2g->info.tail);
> > +	}
> >   	trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
> >   			     desc_read(xe, h2g, head), h2g->info.tail);
> > @@ -1018,7 +1013,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >   				u32 len, u32 g2h_len, u32 num_g2h,
> > -				struct g2h_fence *g2h_fence)
> > +				struct g2h_fence *g2h_fence, bool write_only)
> >   {
> >   	struct xe_gt *gt = ct_to_gt(ct);
> >   	u16 seqno;
> > @@ -1073,7 +1068,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >   	if (unlikely(ret))
> >   		goto out_unlock;
> > -	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
> > +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence, write_only);
> >   	if (unlikely(ret)) {
> >   		if (ret == -EAGAIN)
> >   			goto retry;
> > @@ -1081,7 +1076,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >   	}
> >   	__g2h_reserve_space(ct, g2h_len, num_g2h);
> > -	xe_guc_notify(ct_to_guc(ct));
> > +	if (!write_only)
> > +		xe_guc_notify(ct_to_guc(ct));
> >   out_unlock:
> >   	if (g2h_len)
> >   		spin_unlock_irq(&ct->fast_lock);
> > @@ -1157,7 +1153,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
> >   static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   			      u32 g2h_len, u32 num_g2h,
> > -			      struct g2h_fence *g2h_fence)
> > +			      struct g2h_fence *g2h_fence, bool write_only)
> >   {
> >   	struct xe_gt *gt = ct_to_gt(ct);
> >   	unsigned int sleep_period_ms = 1;
> > @@ -1170,9 +1166,11 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   try_again:
> >   	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> > -				   g2h_fence);
> > +				   g2h_fence, write_only);
> >   	if (unlikely(ret == -EBUSY)) {
> > +		if (write_only)
> > +			xe_guc_ct_send_flush(ct);
> 
> 
> Just to check if the 'if' is correct here. So flush is for 'write_only' only
> when got -EBUSY.
> 
> 
> >   		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
> >   						&sleep_period_ms, &sleep_total_ms))
> >   			goto broken;
> > @@ -1196,7 +1194,8 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
> >   	mutex_lock(&ct->lock);
> > -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> > +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence,
> > +				 false);
> >   	mutex_unlock(&ct->lock);
> >   	return ret;
> > @@ -1214,25 +1213,76 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   	return ret;
> >   }
> > +/**
> > + * xe_guc_ct_send_locked() - submit a GuC CT H2G message with CT lock held
> > + * @ct: GuC CT object
> > + * @action: payload dwords (HxG header dword is expected at @action[-1])
> > + * @len: number of payload dwords in @action
> > + * @write_only: defer publishing/doorbell for batching
> > + *
> > + * Sends a single H2G message to the GuC CT buffer while the caller already
> > + * holds @ct->lock.
> > + *
> > + * If @write_only is false, the function completes the submission immediately:
> > + * it makes the payload visible to the device, updates the H2G descriptor and
> > + * rings the GuC doorbell.
> > + *
> > + * If @write_only is true, the message payload is copied into the H2G ring and
> > + * the software tail is advanced, but the descriptor update and doorbell are
> > + * deferred so multiple messages can be batched. In this mode, the caller must
> > + * eventually call xe_guc_ct_send_flush() (still holding @ct->lock) to publish
> > + * the descriptor and notify the GuC. On internal retry paths (-EBUSY), the
> > + * implementation may force a flush to ensure forward progress.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + *
> > + * Locking:
> > + *   Must be called with @ct->lock held.
> > + */
> >   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > -			  u32 g2h_len, u32 num_g2h)
> > +			  bool write_only)
> >   {
> >   	int ret;
> > -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL);
> > +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, write_only);
> >   	if (ret == -EDEADLK)
> >   		kick_reset(ct);
> >   	return ret;
> >   }
> > +/**
> > + * xe_guc_ct_send_flush() - flush pending GuC CT H2G writes
> > + * @ct: GuC CT instance
> > + *
> > + * Some callers batch multiple H2G writes using xe_guc_ct_send_locked() in
> > + * "write-only" mode (i.e., queue the message payloads but defer ringing the
> > + * doorbell / updating the CT descriptor). This helper completes the submission
> > + * by ensuring the payload writes are visible to the device, updating the H2G
> > + * descriptor, and ringing the GuC CT doorbell.
> > + *
> > + * Locking:
> > + *   Must be called with @ct->lock held.
> > + */
> > +void xe_guc_ct_send_flush(struct xe_guc_ct *ct)
> > +{
> > +	struct xe_device *xe = ct_to_xe(ct);
> > +	struct guc_ctb *h2g = &ct->ctbs.h2g;
> > +
> > +	lockdep_assert_held(&ct->lock);
> > +
> > +	xe_device_wmb(xe);
> > +	desc_write(xe, h2g, tail, h2g->info.tail);
> > +	xe_guc_notify(ct_to_guc(ct));
> > +}
> > +
> >   int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
> >   {
> >   	int ret;
> >   	lockdep_assert_held(&ct->lock);
> > -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL);
> > +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, false);
> >   	if (ret == -EDEADLK)
> >   		kick_reset(ct);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 767365a33dee..2db4dded6b96 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -54,7 +54,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> >   int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   		   u32 g2h_len, u32 num_g2h);
> >   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > -			  u32 g2h_len, u32 num_g2h);
> > +			  bool write_only);
> >   int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   			u32 *response_buffer);
> >   static inline int
> > @@ -62,6 +62,7 @@ xe_guc_ct_send_block(struct xe_guc_ct *ct, const u32 *action, u32 len)
> >   {
> >   	return xe_guc_ct_send_recv(ct, action, len, NULL);
> >   }
> > +void xe_guc_ct_send_flush(struct xe_guc_ct *ct);
> >   /* This is only version of the send CT you can call from a G2H handler */
> >   int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action,
> > @@ -87,4 +88,36 @@ static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
> >   	wake_up_all(&ct->wq);
> >   }
> > +/**
> > + * xe_guc_ct_lock() - take the GuC CT mutex
> > + * @ct: GuC CT object
> > + *
> > + * Wrapper around mutex_lock(&ct->lock) for cases where CT operations need to be
> > + * performed from contexts that want an explicit "CT locked" pair without
> > + * exporting the lock itself.
> > + *
> > + * Return/Locking:
> > + *   Acquires @ct->lock.
> > + */
> > +static inline void xe_guc_ct_lock(struct xe_guc_ct *ct)
> > +__acquires(&ct->lock)
> > +{
> > +	mutex_lock(&ct->lock);
> > +}
> > +
> > +/**
> > + * xe_guc_ct_unlock() - release the GuC CT mutex
> > + * @ct: GuC CT object
> > + *
> > + * Counterpart to xe_guc_ct_lock().
> > + *
> > + * Locking:
> > + *   Releases @ct->lock.
> > + */
> > +static inline void xe_guc_ct_unlock(struct xe_guc_ct *ct)
> > +__releases(&ct->lock)
> > +{
> > +	mutex_unlock(&ct->lock);
> > +}
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > index 2470faf3d5d8..cee653bf463b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -10,6 +10,19 @@
> >   #include "xe_pagefault.h"
> >   #include "xe_pagefault_types.h"
> > +#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
> > +
> > +static void guc_ack_fault_begin(void *private)
> > +{
> > +	struct xe_guc *guc = private;
> > +
> > +	xe_guc_ct_lock(&guc->ct);
> > +
> > +	/* Ack the 2th, then 18th, etc... */
> > +	guc->pagefault_ack_counter =
> > +		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 2;
> > +}
> > +
> >   static void guc_ack_fault(struct xe_pagefault *pf, int err)
> >   {
> >   	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> > @@ -36,12 +49,25 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
> >   		FIELD_PREP(PFR_PDATA, pdata),
> >   	};
> >   	struct xe_guc *guc = pf->producer.private;
> > +	bool write_only = guc->pagefault_ack_counter++ &
> > +		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
> > +
> > +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
> > +			      write_only);
> > +}
> > +
> > +static void guc_ack_fault_end(void *private)
> > +{
> > +	struct xe_guc *guc = private;
> > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> Maybe
> if (!((guc->pagefault_ack_counter -1) & (XE_GUC_PAGEFAULT_FLUSH_PERIOD -
> 1)))
> > +	xe_guc_ct_send_flush(&guc->ct);
> Not to wake up GuC without new ACK where the last one was !write_only.
> > +	xe_guc_ct_unlock(&guc->ct);
> >   }
> >   static const struct xe_pagefault_ops guc_pagefault_ops = {
> > +	.ack_fault_begin = guc_ack_fault_begin,
> >   	.ack_fault = guc_ack_fault,
> > +	.ack_fault_end = guc_ack_fault_end,
> >   };
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > index c7b9642b41ba..2996e5903ccb 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > @@ -124,6 +124,12 @@ struct xe_guc {
> >   	struct xe_reg notify_reg;
> >   	/** @params: Control params for fw initialization */
> >   	u32 params[GUC_CTL_MAX_DWORDS];
> > +
> > +	/**
> > +	 * @pagefault_ack_counter: Counter to determine when periodically ack
> > +	 * pagefaults in a batch.
> > +	 */
> > +	u32 pagefault_ack_counter;
> >   };
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 2cfda29321c9..d252a8c9d88c 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -425,6 +425,10 @@ static bool xe_pagefault_cache_hit(struct xe_pagefault_queue *pf_queue,
> >   			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
> >   				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > +			if (pf->producer.private !=
> > +			    pf_work->cache.pf->producer.private)
> > +				continue;
> > +
> >   			xe_gt_stats_incr(pf->gt,
> >   					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
> >   					 1);
> > @@ -559,6 +563,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >   	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
> > +		const struct xe_pagefault_ops *ops = pf->producer.ops;
> > +		void *private = pf->producer.private;
> >   		struct xe_gt *gt = pf->gt;
> >   		u32 asid = pf->consumer.asid;
> >   		int err = 0;
> > @@ -599,6 +605,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >   			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> >   		xe_assert(xe, pf == pf_work->cache.pf);
> > +		ops->ack_fault_begin(private);
> >   		while (pf) {
> >   			struct xe_pagefault *next;
> > @@ -606,8 +613,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >   				  XE_PAGEFAULT_ALLOC_STATE_CHAINED ||
> >   				  pf->consumer.alloc_state ==
> >   				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > +			xe_assert(xe, ops == pf->producer.ops);
> > +			xe_assert(xe, gt == pf->gt);
> > -			pf->producer.ops->ack_fault(pf, err);
> > +			ops->ack_fault(pf, err);
> >   			if (pf->consumer.alloc_state ==
> >   			    XE_PAGEFAULT_ALLOC_STATE_ACTIVE)
> > @@ -635,6 +644,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >   				pf = xe_pagefault_queue_requeue(pf_queue, pf,
> >   								gt);
> >   		}
> > +		ops->ack_fault_end(private);
> 
> For every chain, the worker proceeds, every 16-th pagefault will update the
> GuC and at the end additional update.
> 
> 
> >   		if (time_after(jiffies, threshold)) {
> >   			queue_work(xe->usm.pf_wq, w);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > index 57cb292105d7..bc8f582b4e03 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -33,6 +33,13 @@ enum xe_pagefault_type {
> >   /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> >   struct xe_pagefault_ops {
> > +	/**
> > +	 * @ack_fault_begin: Ack fault begin
> > +	 * @private: producer private data
> > +	 *
> > +	 * Page fault producer begins acknowledgment from the consumer.
> > +	 */
> > +	void (*ack_fault_begin)(void *private);
> >   	/**
> >   	 * @ack_fault: Ack fault
> >   	 * @pf: Page fault
> > @@ -42,6 +49,13 @@ struct xe_pagefault_ops {
> >   	 * sends the result to the HW/FW interface.
> >   	 */
> >   	void (*ack_fault)(struct xe_pagefault *pf, int err);
> > +	/**
> > +	 * @ack_fault_end: Ack fault end
> > +	 * @private: producer private data
> > +	 *
> > +	 * Page fault producer ends acknowledgment from the consumer.
> > +	 */
> > +	void (*ack_fault_end)(void *private);
> >   };
> >   /**
> 
> In the end, each chain will result with GuC update. In case of long chains
> the updates are every 16th ACK.
> 
> 
> Maciej
> 
