Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C34FCAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5895310E0FA;
	Tue, 16 Sep 2025 21:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/+bTRvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C62210E0FA
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758056854; x=1789592854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a9VTNnT0jP74HhL8IXe5v0iWSD2DMD2K7Haba1lJFg0=;
 b=U/+bTRvkkPbvWCJ6y5t7jt8MopWbzvTsBf3ti/FJeAp3zf6fNCgLAHzi
 Z9eV/4qL7tz598W7K1YT41hHH3GFjlTPeKPibWwUl1rc6zUv67EsMRHYW
 emCtbJetCptakZqc2hRUvSzh+NBscBzK5y8I8FqTCWYc0+PN0AcyvTgos
 AMwrRekK+tO2YF8NZ7KREvQoxbfqFoMCP7Nm0KDUGCDdhQNlKoeHXm6+L
 JP5FhrSrN1kRnzB1lhbKEHuqNWiNUGDF2Yin+/2c2o60vAFyLt34uOoth
 QznYuwwdkSIVggjU2aH5dDQaBj3yUQnGWv5KTcdRFvVLnGaKKZkA/fO5G A==;
X-CSE-ConnectionGUID: 9c0T3RnkSm62t0JyLvE3cg==
X-CSE-MsgGUID: alxVuRjkRXyqMnH0Af2J9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60280473"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="60280473"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:07:26 -0700
X-CSE-ConnectionGUID: KUGpr1q6RwGMXrFunMu5GA==
X-CSE-MsgGUID: ri4Hao5tR6qz71iKFsZfJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="174349045"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:07:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 14:07:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 14:07:24 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 14:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXmPxGGUI//dKcHXi+fd54bMSdGBRLYdNobh2990CfDd3vWp1QzVzaQ3tus6AnLFG0YracgFefbnpGZ+WkbRWE7plrbm7rMdFLeWUDpR1FMC7LX8f2LkUmiqkcz2THo5d5iVEVPJf0h6IumKfKNXSs7OScSIbXlyfo6Xv6/KuuiXTxNj5nSqjy4QHsLYjmE6a3to4/ofJnopa2s9jE9U5q6ugxQbRFLQ/zbmqhuSNFB6mwimzf/XcL4Reg9oP0nv47hz8NuHHyjZlF/R5BJfUa46F0A5Xx+UlNIFb3PyQ+1ytYYfNe0IJJ+LRmfwXqlzgSJrGnZy84cHZ2X7oz1RFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15sPHn6iGZdS7wERn275SdXOYcwYMDBml3m4SxMNMqY=;
 b=j68R878aVDbEH0lMg85MyNSymh1u132qHRxqDGbiFQ4d0EpKbP45xrG+gWEzZogW2PZ8JXjGcRxQmtux9aoZwSQjY4S6G+8Xbexm5Od+O9Ucglu22I+zJLacYghoeAsm5kji48jiSPHuL+9dYYL6BkN/mb1gV4ecfP2M7iRHnoKkP5toyFxWtwXJskowyfo/Eewg3cQIi5CWI6Ksrhk/fh1eaH1x7fhtmRf6f7uy8WZe5VrUWoj+aFD3ejGNE+PBs5zLIdU4/E64yvbxWtxz0wjMvNPQHapRsACwVwwzj5psRc1c4T07e+fGo7K4m3AyqNO4AbJziGf/mqt9Z3tZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPFB266726CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f46)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 21:07:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 21:07:22 +0000
Date: Tue, 16 Sep 2025 16:07:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v4 5/6] drm/xe/lrc: Allow to add user commands on context
 switch
Message-ID: <qyoilnhjle5cn7sd5ciuo2iwogkpntl5pwssxcgn476issw2pu@ososownuo7mr>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-5-c8f7e48f7eae@intel.com>
 <aMnIQQWdJvWEA0pK@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aMnIQQWdJvWEA0pK@intel.com>
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPFB266726CF:EE_
X-MS-Office365-Filtering-Correlation-Id: 44888212-1474-44cc-7c0b-08ddf56507c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K+lMECOpZewpo5bw5zs69mayGOrmxgCK+Ad51jVdlFWFCYC+JG2w3oCJjVyo?=
 =?us-ascii?Q?/zfa3XQgzT4HmXkAvbhW9XbpM+P1IN3NrAKtf84OqXa36F6kEW/k8CPSHKTY?=
 =?us-ascii?Q?8IYY5CpjklazpqAbzkZmBfqidgXKxQdklDq8xFpXboWzLg1FXmrEXmEc/Z7J?=
 =?us-ascii?Q?Ivlvf1sC4rbOlbwWit6Q/64BjdhKetHKA+1D0RdPLvJFOcb2egYpiuXDEC9+?=
 =?us-ascii?Q?tGafEVfTaiv9UBXLpqi7nOSV+N05QCqggaUvqg+Ni97JgjoVpjvzrUETjaim?=
 =?us-ascii?Q?Bz2IgYpD7UtmpJfZWddKZtlAP+ZnITwgogm4epE4twH0qw6zx436LIZSQ7dh?=
 =?us-ascii?Q?GieucG9dhBlUDkh2SHyVhdomRiT/kKKfllD/6UDK5GK/4ZZeijE7GGJQNDCu?=
 =?us-ascii?Q?yk4W80CJ9SyJZm8V+VDMGueXGyUeDptbHz2jT/BtaGROhIWoFnpEM+NHwhO0?=
 =?us-ascii?Q?LZXrsobXISVlLgZMQqD//OZhCesXPG006rtLmDFBw6bx8Qa3bSzr9fSrOsi4?=
 =?us-ascii?Q?ZQEtD4HtgX1SUoLDrBduYWTC+yf52mFr1tZsTYdlLtyefWknRgcmCVdh7KXx?=
 =?us-ascii?Q?ImtJ7oRlPglzgFNObDncKBQNR6qX5t50S++I6bumydZQ19udeRF2LwDF/HQW?=
 =?us-ascii?Q?cEyS6W2hOoGNZCDfpv1Ja789bF2x25fks9WMmS2gTNAKhh0899KTbdnrJEet?=
 =?us-ascii?Q?OPVMwVVdRvMZhHUtLC39gTTg3GMZdIubponWbD1VdAm0IXzoEmj5g9xxZYoY?=
 =?us-ascii?Q?Z25vCCGoaWvqBtXgTuE04hn6iiXV8pmRqO21uB6fH0wJ/eHOGAe8mfBidjoD?=
 =?us-ascii?Q?qDMXLyvpuPF8VKDTkwXAazd1aD1zwY/8NUSuN6T3/wFbK5cKMXqectxyG84E?=
 =?us-ascii?Q?+fReyIf20tkGRS0iePqqWAoWgdboGhPa8GlNx2pcClTOKv0YoChlipCApl/c?=
 =?us-ascii?Q?sznw1TNFIFKFJcAOMOnKP4BW9xu6+Ldz9TNmLL2U1gXTXYkYLYh3C5M1Xm6S?=
 =?us-ascii?Q?J2W8xVZ6W3QsBJ2ewJLqCohwUIHBqxSI8V/xpPyiDJ2/7dwD9EbONKF/VTS9?=
 =?us-ascii?Q?uSV1rarpANZZ+IYjPnF7Qx4yECAbPqMvwf9rP/5M9g+dNdxISmWqH3JgQW6M?=
 =?us-ascii?Q?Aa3DSrPg6fsFl0W7PCYyByzGik3/6HAMUlGqPrDC8BjOon+ZEVrUJLOsxVy6?=
 =?us-ascii?Q?ijrB5Ovjx/+zjcfuiRqkdehnw3J+WNdfo3zKvelngDRozJ6Q0E9ZPcmqQxYG?=
 =?us-ascii?Q?7+V/CsDjDqb9TAdROGliD6luggfa5N4+dpzixpAb/y/7Etax/c18fXYHMLiD?=
 =?us-ascii?Q?aMFNIEbXTi1nlX/kDxYOsUyypj+arKaAeCDlStBjtx8/tYjrCumoH5eGIulI?=
 =?us-ascii?Q?rK0bKls0M2/87Aed2Bi5QzS8rSCly1wzAAVsPee2WoRR/4GK0r2VDDUh/epX?=
 =?us-ascii?Q?+loPZBcr20g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oL/McUdIc9HqTC6SrqKYBkGTDm7q5v7EJJMYBOHeyJcjnL/x12aln/Q83zhw?=
 =?us-ascii?Q?72QOgtD/mDO3NBsANk3aNkVeUHoEKmcDJgpAydMTyabkPGOHAYSHqqOOXBQO?=
 =?us-ascii?Q?0EtQmpYizGCnIIvsG9mInxJsD0qrZx+Yw4PbfC0pl0hEym1WsAnNQWj05p04?=
 =?us-ascii?Q?xf6fGXLZRgrjXZ/ZbC3jiKwbbjiwIx5vnizt1dL1Ir/NoTvk0hui8xUAgyU2?=
 =?us-ascii?Q?gpH92u7Tiu8pExbGiKPsIsKhp2jJE745z+QaEOXWn9SUZAyamCTjfJW/YHkT?=
 =?us-ascii?Q?gPbOwa5xKC9Net3UlJDg4ZYedPm4I2e9jHHbj6TwOrpsy1i1wnlvhkBTynos?=
 =?us-ascii?Q?7HAvOm0E8yfmkdgDLEpCpm9gHnXEltOdvg2dvKS9XSXSQ2WvBMsOBOBl5eg0?=
 =?us-ascii?Q?iY6YYIfuc9dUGnK8KSiUn+bx1ulx/cuANs/+9KiJdmnla4boAVOtjxn7EJPt?=
 =?us-ascii?Q?0/c3WewzJEd/aB8lZj51Fhb81k4oh8VTeyNK3b/fptPVJK5mKda+tTBi413S?=
 =?us-ascii?Q?A+YGpz23XPj4YqdiG4/Pk01uEgQk+kd4WkTSgP8sdcVRT8/yBX7XAzPwtrY7?=
 =?us-ascii?Q?RbJiJgk9doubr0wGK/BC34c5WACA+BCrnL6AZSCZUdmG2rlpS/ambDroVVjj?=
 =?us-ascii?Q?XytlGDZWdbPz2zDUx2WrRnYhZoZZMDxHWwR3AitcH/V3J4QAVfi3UhL3Tg9v?=
 =?us-ascii?Q?mckp28nT18E1DvG7bW7P5Okl3UoSJCrtqzdSSKuXfxMs521RqcMX2V2dHr4T?=
 =?us-ascii?Q?afR02sPoAsRyWwiLoW3A8b2MHnGoK7GNa2IJH6sVpoDdhryj+a3KzV8Lz6n7?=
 =?us-ascii?Q?e+fdM5+nprsc3H599Cy88pQsLBKpnJRjHeKJFHx60Ef0y96epMtZsm5w/OMB?=
 =?us-ascii?Q?reN9FErO473HhIt9lBqOWb4hLkUgTOe5vyGAAH5G0mNow7YobRaEctC27o89?=
 =?us-ascii?Q?Ews6R3y4soe96S4xcJYxpXR6Br5tm521rgK4VkyDn7OzgmQeXnuDJjSw1Iht?=
 =?us-ascii?Q?7fSf3aikke0sDEkMZ1jneAlsHMagq7MWzQU1ud+HBvu5g/UD53WH4w/iWRo0?=
 =?us-ascii?Q?L28B04pLYt12Okwj7XByFqYZoM86DG7CuSGZtrI0Urlyplmr7/8rHf6JNvED?=
 =?us-ascii?Q?Ef+9ZHjx7YDT0Pnj/cpb5DrZufQmKtWxp6E6hHwBUrCcRRc0sLJmQvp8pInR?=
 =?us-ascii?Q?PJ5ureLqkxpElD+ESsiEbs/fXQjl9sxjWbvm5MY855RDN3pmUtzPOInztLrt?=
 =?us-ascii?Q?ppPucWeaXwHiD4SBunP3+sy7OTpWPArdQ+sHkw31spON+/OLUJ0/rKXcOzcx?=
 =?us-ascii?Q?ybiJ7OP0/rtXfubPWruZWQ7WOxdj81WgC76f8sEzAlfOdjTmv44Lt4x8M8Dr?=
 =?us-ascii?Q?naDi3yalrb7Zskq1vfixLChUNbOVrCK55duqh2oGb6jDO/GXkgyfV6VRtsrc?=
 =?us-ascii?Q?938svTKazyuwj2ChS/XmhxKR6vBwlX2A34+AEw6RnW2E5hsBNN/RuLCS71YV?=
 =?us-ascii?Q?zojRQpUA96jKs9n1rarI+mlNYqSSHW8Quvsjiw9NQ6lLWyTYpVwtmYLqWijR?=
 =?us-ascii?Q?965I72vQAQMgL+5UAj8slOIAhS8ZHN4EP95DIAG02jUzHesVRqwWfJIyGpFq?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44888212-1474-44cc-7c0b-08ddf56507c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 21:07:22.8681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y03S4NkyKWX3r+xqaphx97RCNnh/dJ9jtSpO7b0hBtR2Rh+VMw3CRwmBW2MESCkbChT44h9fJ3hiJZtyElzHDnpyFpnQ0ysmK27Pe0l1Xs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB266726CF
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

On Tue, Sep 16, 2025 at 04:27:45PM -0400, Rodrigo Vivi wrote:
>On Thu, Sep 11, 2025 at 12:36:29PM -0700, Lucas De Marchi wrote:
>> During validation it's useful to allows additional commands to be
>> executed on context switch. Fetch the commands from configfs (to be
>> added) and add them to the WA BB.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2: Fix warning when building without configfs
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 13 +++++++++++++
>>  drivers/gpu/drm/xe/xe_configfs.h |  6 ++++++
>>  drivers/gpu/drm/xe/xe_lrc.c      | 25 +++++++++++++++++++++++++
>>  3 files changed, 44 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 45fdb6cf26b5d..d86c75af03278 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -633,6 +633,19 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>>  	return ret;
>>  }
>>
>> +/**
>> + * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
>> + * @pdev: pci device
>> + *
>> + * Return: post_ctx_restore setting in configfs
>> + */
>> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>> +					enum xe_engine_class class,
>> +					const u32 **cs)
>> +{
>> +	return 0;
>> +}
>> +
>>  int __init xe_configfs_init(void)
>>  {
>>  	int ret;
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> index 1402e863b71c0..eff2645b5f593 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -8,6 +8,8 @@
>>  #include <linux/limits.h>
>>  #include <linux/types.h>
>>
>> +#include <xe_hw_engine_types.h>
>> +
>>  struct pci_dev;
>>
>>  #if IS_ENABLED(CONFIG_CONFIGFS_FS)
>> @@ -17,6 +19,8 @@ void xe_configfs_check_device(struct pci_dev *pdev);
>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>> +					const u32 **cs);
>>  #else
>>  static inline int xe_configfs_init(void) { return 0; }
>>  static inline void xe_configfs_exit(void) { }
>> @@ -24,6 +28,8 @@ static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>> +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>> +						      const u32 **cs) { return 0; }
>>  #endif
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 6d52e0eb97f54..f337954066f55 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -16,6 +16,7 @@
>>  #include "regs/xe_lrc_layout.h"
>>  #include "xe_bb.h"
>>  #include "xe_bo.h"
>> +#include "xe_configfs.h"
>>  #include "xe_device.h"
>>  #include "xe_drm_client.h"
>>  #include "xe_exec_queue_types.h"
>> @@ -1102,6 +1103,29 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	return cmd - batch;
>>  }
>>
>> +static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
>> +						  struct xe_hw_engine *hwe,
>> +						  u32 *batch, size_t max_len)
>> +{
>> +	struct xe_device *xe = gt_to_xe(lrc->gt);
>> +	const u32 *user_batch;
>> +	u32 *cmd = batch;
>> +	u32 count;
>> +
>> +	count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
>> +						    hwe->class, &user_batch);
>> +	if (!count)
>> +		return 0;
>> +
>> +	if (count > max_len)
>> +		return -ENOSPC;
>> +
>> +	memcpy(cmd, user_batch, count * sizeof(u32));
>
>shouldn't we use copy_from_user here?

no. When the user wrote to the file, configfs did the copy and
called us in xe_configfs.c:

	configfs_write_iter()
		copy_from_iter()
			...
				raw_copy_from_user()
		flush_write_buffer()
			buffer->attr->store()
				ctx_restore_post_bb_store()

ctx_restore_post_bb_store() will parse the lines, and save it in the
correct format to this instance of xe_config_device.

What xe_configfs_get_ctx_restore_post_bb() does is basically return
that already-parsed-and-saved data.

So... here we are not copying anything from user. We are copying the
previously saved buffer that is already in the kernel.

Lucas De Marchi

>
>> +	cmd += count;
>> +
>> +	return cmd - batch;
>> +}
>> +
>>  static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>>  					       struct xe_hw_engine *hwe,
>>  					       u32 *batch, size_t max_len)
>> @@ -1203,6 +1227,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
>>  		{ .setup = setup_timestamp_wa },
>>  		{ .setup = setup_invalidate_state_cache_wa },
>>  		{ .setup = setup_utilization_wa },
>> +		{ .setup = setup_configfs_post_ctx_restore_bb },
>>  	};
>>  	struct bo_setup_state state = {
>>  		.lrc = lrc,
>>
>> --
>> 2.50.1
>>
