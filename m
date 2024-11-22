Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC834E6ADCD
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 23:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A9510E1D0;
	Fri, 22 Nov 2024 23:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYn25i4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB37310E1D0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 23:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732317520; x=1763853520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z1kOSf9n3KNAcw5Fw0Nl6FtyJKLR5KQdWKRd3A02oVU=;
 b=GYn25i4zw1dKW2CVVIfehvHkAZakTVKVLCF6WNzy+IfarPbbnrFKnMKX
 hK0bEc3E9X/FTW1hwJ9BNTcOxqdSBLRhnNxeh870RjjOSaJwBxla8mEzQ
 QwoCluPjtZN1bSpAPfiaCXvtEigkqjbFtIJQEcALbrZ48//QAiasmWWUu
 jo/AIhQsudPc8cT5MDoHXoxkot0eRapKY86HH+VCIPJeCEZVXyU9jgD49
 VDv9aFNCl4G6TT/AojliyAUZn/KLNzjbPDoR9X6UatxIiBQFHh2tW3ePK
 xMSrbmsw31O4zmF3W8zt10cuEfXumv4qddX34FYz7OX+NcEARPtl1mwj1 A==;
X-CSE-ConnectionGUID: vTHfcWyzRN+4c7eeF8hAhw==
X-CSE-MsgGUID: NKNrXGZJReWo0x9YnRIqMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31847195"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="31847195"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 15:18:34 -0800
X-CSE-ConnectionGUID: wykDST+tQq20V+02wrYFmQ==
X-CSE-MsgGUID: gxCbPe93T1WQCSFBwboolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="121571879"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 15:18:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 15:18:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 15:18:33 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 15:18:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4o1+r4/kYBVX4exjCD/NwPoeBCnsNUN25VdcznvQA5Fsg35XOSypCZ/5R0Sovr3EW059JyzuKerv2PXRP4FLOoEyBlzKGoYtSdGnW53X3FwCIlCdomeJYrll11GxEN0B3PeUAYc34CQqgPSwu2bm1eYVSfZh0S/jhfCONvNqv6d+rCYsdTjKKELPQcYaaRViaKV1Jr1jOMLpBoxAdN3+D18pLN/mjgkrqsoPXdJ9DRT5VXRRPHTDeFUDLuh25FTSlggEaVOIMKJjlUghfJIwmC7LWbqxlJvZEWOCSurMozpfEv33mRlejrj5o8hBgENvfeviFUxnf2HdLQvHEo/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCSP8YrzwJCRPHCnRof2FmdBC/x9FNLfCrVN9mv4sbM=;
 b=wsiLk5RvoB3GwdoX0M/+iZYMOC7FN4cuYAoZEM/9I/lbkObTcyz+BWw7D25ZM7j8CBJYkmRdNn/ItJ/GZaW1IWogTwYSjkrxkbvs1tjcf+/jmWp2gGAe9jJBhKphDW+pGCFb8+Z2pV0BrQ+MzXn0YK5yKifK6oV6pABdMAJcBeWbX6h+eo4UHeX/XCzyapF5W4mNWUGlGhmwYT1e45/Tc3X3n09w6aSmwCFFKqaOMjpqWs+oUY24G8pY+40Nk6hHHWs5wVW1Tgdb+WYIQxXflJ/A9OkOMCwoier3DQ9Q0TltviEmJAwtZs6VwSYR5lvR0r9ZvdZAzbQqWGZ3gaO0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 23:18:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 23:18:28 +0000
Date: Fri, 22 Nov 2024 15:18:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Add another PTL PCI ID
Message-ID: <20241122230404.GH4891@mdroper-desk1.amr.corp.intel.com>
References: <20241114234410.145863-1-matthew.s.atwood@intel.com>
 <173200808386.5661.16726110968459346849@jljusten-skl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173200808386.5661.16726110968459346849@jljusten-skl>
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc85d97-db5f-4e0f-f481-08dd0b4bf8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AUuir7tKz1Bv7zZibTMl3C+JzH4C/aJwD8IwNlxEIyNtXrrhHKrmV1NexP8b?=
 =?us-ascii?Q?GYxhOvLRllipiuD9mfNKjLKnoUZZnMMdPIrCm8C5YHuKR1xR2puAFlo4tUei?=
 =?us-ascii?Q?UmeVqhdKkcEs2xwAi26f6zldJkmZliAmXf63Z+cgnAs1U3YnRAOmu0xZCX9y?=
 =?us-ascii?Q?K4rGrPJlM1jOOySgn9BNcRyj6KoPSehW2qzRViTziMyND7wIe4BMiEYSBcoV?=
 =?us-ascii?Q?vKf9YNKSABPIGTi+zV5Oe4fn6F5lCYopE9hHiZk0bU8rJcXh0zl8ZVNJF4Mw?=
 =?us-ascii?Q?ptvbLQuMn76FrgA7mzVr2tTVX+sXcKMNWOp4ajSSLrWnPwftu4C/Of7hUAEQ?=
 =?us-ascii?Q?WP7Jkf+yR+xCzKQQhH5cSlDLgYi00vSOR/AlM0oyiFByFJ3omE5/U4MuuiFE?=
 =?us-ascii?Q?dg1wztBG1nctIsw4kmPrq2xLv8lLsRvNOxoarr8DUeAlpVoFMHryjWrMzlV9?=
 =?us-ascii?Q?vX+DLVOmBY3T+glQPGPoMaDzFx0OVGtUGFLOdOYue1B9pFAiBdivS510VSLv?=
 =?us-ascii?Q?HYxWvyOA/RAA54Mw4H7p+guW7tTDbLmOqsQZLk8Ah/2AhtQ71J8eoOEYfE6r?=
 =?us-ascii?Q?fdz0zqmxR8P6B5Oc/TfvO0bzLUQnsXdwvqG7KXacqByIoKvth+hiNSAm0Kkb?=
 =?us-ascii?Q?IvOmoQgl7XRVp840momdH0V1ldtGYVeqfRbO3SEXNL99DOmgJ/fOAPmC5XDc?=
 =?us-ascii?Q?8HlHkk0EjKTY6ovN+4kBLFNsR/b/qKtJEyqeebVVRfIugPGBxhlCyHGZj6pr?=
 =?us-ascii?Q?S3RAHyt5KdcZUam9FnBL93c8RhVsFt/BU2yCBM2n6VgDAZQIwK07+aBy7bgs?=
 =?us-ascii?Q?ALlCqk5OX+IWHnI5roCR8ApPG++51dFfAEq8XBmDVzEE5836/4aWNQK1vJZG?=
 =?us-ascii?Q?b4gJb+P15W8Td5nLTzc6Vgme10H7pRx+grRjwhwYVs5lmU2fdWMDV0xmerSw?=
 =?us-ascii?Q?RxHz92b3+uKLHfdDws3hVOr22GZOlZS6NPB9sxLu2fZpnim/gH5um2ZtOm5Z?=
 =?us-ascii?Q?Z2FN/4gUvnGw3Lsu5r4ISz/q4L/LSY7QtQFomBVyxsLoAxPwX9clT13mzLIP?=
 =?us-ascii?Q?l7QxruQ/BUwQruDyWHhnEhc8i7Ku7bkbVCJk2MSMlec/E29BI2jyIQs9N3I9?=
 =?us-ascii?Q?jL6jeKs0zUGFLcGdhJM7LBjttOQsAIE6wYa+DnOX64BhXuM0k9/HV1gNp/7d?=
 =?us-ascii?Q?z5DUho6pG6T9GsiAdQHDk7YICkQIAg8nc8IXAepsPoj7omHyAsgSG/kDYbkr?=
 =?us-ascii?Q?JkVa9P/tu1zq9aAN/t7TjGTIzTVsBJ19o9NbodDe5Vb7Czww+wZ5iokJ1CQD?=
 =?us-ascii?Q?k3w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ktWEPuNo4E2jb5mNFp89V7c2SD5Qc27e9P1Tvw0vkVhfqWTHRwmAF9YK6p6?=
 =?us-ascii?Q?69UEGpdkvlSRbYd79BljbDh250IfxLBun+hV1lguqe+SGVha0A/IzGb9I6Zz?=
 =?us-ascii?Q?8G3r26lLV9O53ayiY/tAPK1ZMp25dG3hu73dNkzRZvw9usZ4JSzBvb1fDSFI?=
 =?us-ascii?Q?4s6Ync2g62oKDt1C1sKERjqKSsDjjQrWhlsYi0bhJ3ApI4y623RsHhw6OXFe?=
 =?us-ascii?Q?ov9HpeqBtibtPozLIq8qStOnOz6vMNmTWlrmuqVMkAhfZMW+k0R/LToJmZ90?=
 =?us-ascii?Q?udWf7Bi1Eeld0Hk1rxyat6hHxsBNBrc+bEnmYoeuoGn8VHnAGH3pHxosJ+Mu?=
 =?us-ascii?Q?0ow5Dd9fRPgNp2cgd6NBVLUxT0Njq9N7ky/a3bBLRCz0j1EvPwpMvTkJVOf+?=
 =?us-ascii?Q?WimWFDu2kqWcvWDNKOa9Lb0a1AKPBrqt3G/HrCQ/oAudiZLivGxEy5vLfBrJ?=
 =?us-ascii?Q?KhbHzni2QWBKMlzm2ZpNxAyeInbce5RH3ri1PNQl5BfyBha8ES0fE/fXhgj6?=
 =?us-ascii?Q?LwzrL3hRc8deJTgZbLzcME46qY0vENtgP9OtlXGyhTn8G3pGLF9cINNhYKH+?=
 =?us-ascii?Q?ED+9iHrsrnpfCKhNU+qid9+6AJZ5xbHSwVvxMgWuq6ZMt9LYD9lv8zj7n79V?=
 =?us-ascii?Q?AZU3bAf6F6gB3WwMNPRRHZm47ZilpAiEwClQZUZYPofDw0n+Pv+GB6vV0p48?=
 =?us-ascii?Q?VnDBngb6mXfNsm7G7gsrLs+xNXi2/06LD5F5ED8bHySDU8bclt4g0w6n0eht?=
 =?us-ascii?Q?+iK107WwhSTlBgCqthlI2dqfAHbkupyosILHQvbPVtWvc7gDZpEjOU+ElCZ4?=
 =?us-ascii?Q?BSqEEB5gLJoTlJy2QRly4c1CHZSUgVXXd4ELvKNilbMx3IAMxVYFVwWtfjxr?=
 =?us-ascii?Q?7hrd4Up2WK2cmnxESP2EP/G7QR03mklcdPm7dQ8NPwe3CJkabe1tgugAJBkz?=
 =?us-ascii?Q?ycULqkTN5uFKU5/j/k+6btncRMUvTSl4c6pWJ4Wxyidb8XHKtg5ELkyy7VGU?=
 =?us-ascii?Q?G8qeCP2pXTgRygaKa2Qrjjc98qNzkH38AzE+AcpzbHXxicyExH+9K5eJ2Tyq?=
 =?us-ascii?Q?pbF0bqzx52nO/mpeaCKReFMU/Gc9ZKN003zin1O3hMYli1jmIbHiowmn4Lmz?=
 =?us-ascii?Q?JJApffrIQyonyv71Ibd7Ib9KeBKPp9qzc80x4KCpAShcvXWCGMzQ8fxE9pCX?=
 =?us-ascii?Q?GQntVY+1fAmq6Psn9unUJCT5D62/QGkQXoympuPkSyqKCE18hJ7cxaEknURP?=
 =?us-ascii?Q?HCQcpr3ad/+muIHjDDSbkwYOFHUPczHtHrr9rAdI9imklqKDUzcz/fXZYP5X?=
 =?us-ascii?Q?BWAB5V1d29OzoEJPVgjm1lITt2mj/5ElQV08+q4ui51papjM6cipt/RU7v2H?=
 =?us-ascii?Q?RLPt8mT+fo/8bCYk9Ov1lZAudxltm8Icn82HAAhU1vd3LjDgGOkld/un3o6a?=
 =?us-ascii?Q?NbBSCLAcdDX3w9xpQvZYKC71GwG1X2lgky3v4A10eY63i1imZFa/uDKGpXO2?=
 =?us-ascii?Q?ZN9Eo2roOZPLoIeYW8HMb8IUNU97W8AqZnAVO5IyV97gvkVD3IlDag87W7iU?=
 =?us-ascii?Q?5e7+1ha2tBHu6UZ8zEesjETjWxQ7r/vMM/PpsGa+u1UqWvAd6op961sC5O7B?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc85d97-db5f-4e0f-f481-08dd0b4bf8cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 23:18:28.3710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFj5j7VizjQrQtKsqfVSNspS7BsnXXFUBX1AthcPWtz8bHuDzZ63k9vE23YXLze5c+8yS7ZbXHssKgRorpYw068cgXv2Vyo0kepnpnp9EN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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

On Tue, Nov 19, 2024 at 01:21:23AM -0800, Jordan Justen wrote:
> I don't know what mechanism there is for dependencies, but based on my
> experience this patch should not be applied without "drm/xe/ptl:
> Update PTL GuC revision".
> 
> Ref: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32149
> 
> Reviewed-by: Jordan Justen <jordan.l.justen@intel.com>

Applied to drm-xe-next (and the referenced GuC patch has also already
landed earlier today).

Since drm-xe-next hasn't had a backmerge yet to pick up the conversion
of xe_pciids.h -> pciids.h I had to 'dim cat-to-fixup' to get the change
to stick around in pciids.h when drm-tip gets re-generated.  Although
the old xe_pciids.h header also seems to be coming back now and I
couldn't get the fixup patch to delete it properly.  Presumably that
will clear itself up whenever a backmerge happens, but +Cc Lucas FYI.


Matt

> 
> On 2024-11-14 15:44:10, Matt Atwood wrote:
> > An additional pci id has been added to bspec.
> > 
> > Bspec: 72574
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  include/drm/intel/pciids.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > index 32480b5563db..7883384acd5e 100644
> > --- a/include/drm/intel/pciids.h
> > +++ b/include/drm/intel/pciids.h
> > @@ -829,6 +829,7 @@
> >         MACRO__(0xB092, ## __VA_ARGS__), \
> >         MACRO__(0xB0A0, ## __VA_ARGS__), \
> >         MACRO__(0xB0A1, ## __VA_ARGS__), \
> > -       MACRO__(0xB0A2, ## __VA_ARGS__)
> > +       MACRO__(0xB0A2, ## __VA_ARGS__), \
> > +       MACRO__(0xB0B0, ## __VA_ARGS__)
> >  
> >  #endif /* __PCIIDS_H__ */
> > -- 
> > 2.45.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
