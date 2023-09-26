Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6359AE7F144
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 23:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF0310E435;
	Tue, 26 Sep 2023 23:20:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6444010E435
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 23:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695770443; x=1727306443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2Q08hFocUPSaN1pLUkO3qNOU6R57pP7g+X9WyAYbDWk=;
 b=R3fkBuVVo3DeBnHZj0Gl/xnMUTyzBKY7udjtWwdmJJvEnvKf4nca8F2p
 Sbln3Exu9GSaQqFfwM6IacNOCl0xBHkMKhd3O4irp7HBHBLYKQPvnZi/b
 oDKA/Se5JN22juKotTEA/MZvPED1Gl/FXmpuqXNkpku/cCkoEs9JJlFXK
 4Tb1slvzNbqCz3CNg20svNwCS187mWo4GGOjTX+havdwlhT+rYB8Hu+7r
 TPWNfPzgOfr+st740fLI6Uy/kkw4Td/VzyIgBzSQydYqdrWTDHPLOkUbM
 1eC2yJOi+TnKk7VML/fXZSBx1tXkYn5t2Y3qtQSPBhkS8SYsWYTEDTOTd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385542163"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="385542163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 16:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="327059"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 16:20:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:20:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 16:20:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 16:20:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQySLtbaQ+i7UfNS6tV83q1Brd2r4up1/i+fpZglejYY3uarSWsx8Oo1Jl0pkesxwHLB4FMjYtWQn0KkBtFa6P2eYM9DeSEo8SHqlQVwmg3+YNk/Fzrj5gbk74KGGg+oNinQf+/wkaflF+dIBuObc6eexCEkQgTeFdQ1vJz8rCAZlceK0rKser+6hktRuqtwP1oKfHI2T/EXid0L8Yfc69CBlpMwGhU3fdZoC7a7UWTaY/3ORUWn/OSbf9kAg963HQ79b6mY5oamsPIurm0YB8CfzvNvU+K6HAa10591Ev0/0T2IOxtQ2CMGKBoTR+IrXcbwmKbYahQq2F/zbDcBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7u8V//kgjgIpreuKWBWlKnSuOs7raKjuCrybvJ0yIo=;
 b=hWvUoCjwADLbWSTT/PMZ4pku+7X4JqegxBtp7ep5nflja3gvWCEXPOSu4h/koLKwb43On+t0xNaLCBblY7+D3ghDzrBx4k0BJ69bo9Paqn3Lc/p9FmMDiiey145khCaXuVBIr/U8PpCT6HwVp/nRTyy9298FR3s4/xETzBMxSy3CLFI1t86E0MHppz2ewn3WXxze5Lt0CgvkEFNhsDd9W66z3oX65+qqg8FJmZwoFl8F+w35GroteIwnuE39CZSZux+uyVML3NKObnlyPrZZwXlz683Re6Ik3Bqbm/yahtFZwULNz7NSkd5CcViMS1hg8JrIsyrhCPsX1jS+Rqlcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 23:20:41 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 23:20:41 +0000
Date: Tue, 26 Sep 2023 16:20:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926232038.GW2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
 <20230926223631.2807873-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926223631.2807873-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: ae55ad8e-0c72-4a12-7cbd-08dbbee7335c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: so9PlEYnLPzCrophiQR08B5oVrepAkxlZGbLjFFbH2OzEq0KAaPQBfZfuW7Ff633MsUWC+V1X9Q74gDWT5DPzJS3pZ3+YhaS/vsvs7JacU13vz6s7rm6mGKx3cGHyfHD618pB3Gbc1dMaX99ESpyLmuZqlyGBRXulN/t0JdP24dIb4pOFcmF1piG+qIFHYiBXtNsVX3CsH+fGwkheLYz9RO0CnSKLkngDmuTXL/TA+yDua0r4rVvmUuekUAwXaoDo14eK2wSakMEKwxXZkH89AKPEJbT7x33B2IBwWULzDrj2XxvoLIqRlZqOtPgDz7yjJf5EtlnR79KuH7YY6/2LaaEeE+UdlnxKAIU9EzF+4U1amNxPxSRe2cwWBqDT10xCwB+OlbMkormAAXPhRa3FJF3yGYPFtx+F+oj9/h0KkHD19+vz2dLasUtbk1pzw+bAV1aL/PLRHJ4m+sqZC7Jqe54FrFpf3F3Z5UVKxwRFdHaOOlCFHOIZeSPdXv6Nfn352V5enTVk6h4ql+rIyiv/vSJXfv4VQSebQpdor+QpYaqwppng26W6ex0Ktyfpjrt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799009)(6486002)(6506007)(6512007)(1076003)(6862004)(6666004)(83380400001)(6636002)(2906002)(478600001)(316002)(66476007)(66556008)(66946007)(54906003)(26005)(8936002)(5660300002)(8676002)(41300700001)(4326008)(107886003)(38100700002)(33656002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L9fF/7SAIHQqvBGYxzwpWxw53l58Qys/DlnLcf3Ht01u9NfJm6XqQOsfdbEy?=
 =?us-ascii?Q?X+aJCG2e4pDCN1oeIBc+uer0cC2XHNxgK84AL9ERuUZDko4NVYC3om+isUFw?=
 =?us-ascii?Q?NzQO7EgE88oU7w4pZrv9dEoH6+/G3XcmRHmV6KIOTX/9N9YSo2Z5IMDF3kNz?=
 =?us-ascii?Q?C5rbO9nnYmB/5qVj2oXxLSykkWOGbWRr9eBeVf3qbjZtKNj7wkg9ZmE+IMez?=
 =?us-ascii?Q?qVGzm+AyR09hcCSaY6wGSK4J/7fliKA1u/dPbnFKJXeJxfr2kCPGilyztXHs?=
 =?us-ascii?Q?FrxXpJw9BXEfo93x83pSeLdN+ZGL3pCmqQ9IO/l8J+Np1XBguC63AfoAdV2d?=
 =?us-ascii?Q?bw6XP2W4S/hd7dZqIDm21fEW+6EPThMoHOnJqNmQPT6h1GVNKGcfLM6OCAEB?=
 =?us-ascii?Q?qdnh6fv3AMyO6aYOmw5odXDURV3fXKx+E6BlOZBLOcUOsrokZCytcISRmYZa?=
 =?us-ascii?Q?wB/ZdP+2wAkb/rYVZdKhdLneTalFhYcKXYz9hRCBoDKfd4hNxe6/EK23h1B2?=
 =?us-ascii?Q?8WCRiORpymz58Ien+03yazs4sRAkX2GEdofrnfOwGWugih2Up74nNDmubFTl?=
 =?us-ascii?Q?SKDFEt8yyYdhQb8Fv5mTLepodZoRhJasSgO3Z3/f6i0DcWqumWHzl9EcpLF3?=
 =?us-ascii?Q?XDmp0XbxRIOEb7huxXurQBRE9qbCgvOdv8cK+Vc2Q0uQtpq118WLUBTpP8im?=
 =?us-ascii?Q?YOahm4pNMoFEl44PXCAyQwoX/pCQRiI3v9jau/W02fr87FBIVtSCuHJyaP7k?=
 =?us-ascii?Q?V09kxMgUqC7YOXI5hHg6AytyVCFpw8eOToy+7iyqNBAaYui9pJNlWAwwU0xC?=
 =?us-ascii?Q?nZc3x6ay04iPq+/5BsuI1UaJoyTN4bNcDeuiHlJxItqLuGDhLbivKEymJwgB?=
 =?us-ascii?Q?lpB/eC/sTH6jpUNAVRw5jtPWe1WuM3t1rPPG45LAkYetrMX2ue680QWPGj3q?=
 =?us-ascii?Q?WeuitIQRO0r/qZLqZdoHVd1wuGYRyZOS1LWMOJDR5o+cqF5sPOn6YKuG0k/1?=
 =?us-ascii?Q?I7gprd9tP+yUiZE9gCAiep4/ad9y30VC4+QNISA3ob5t6/dJp/XKpE+89mNr?=
 =?us-ascii?Q?rPU7E9u4zrFUvXI+YBYLJ7sMSx5oUyTb0zPG0EfyuQjEXAKyXCLxB3AXRs8b?=
 =?us-ascii?Q?GLzzAKIRfAUYQgCOhws/VtU2nb8vvlY8t3LcfnVgVceHe6XrwCI6JZ05/c8R?=
 =?us-ascii?Q?d+AC8XYO1YDNeat5ZVrTHM0EXPN4BGM7jV1pt37t4k8umWCCaHQM7CQh83Cc?=
 =?us-ascii?Q?kdC9gvOEUYTy9rCAwDxAE1+8pJ/dSaZTg65kgxodqB5l05eOXrymjvKz32mR?=
 =?us-ascii?Q?s0SSXEiH0ec7KS5GbdzdF70tZ2g+N5tB/LFOLeGakoLB/OiYo5lnblKIaCNS?=
 =?us-ascii?Q?h2zc3Il9VlwciE8hGkkY2PtWAjSOxuj7SS6W16sS+AjWWh62L0pT/7hLu1w+?=
 =?us-ascii?Q?0bK2q6arEi0z8eG4TsFS9tZRMjBGpB9tkN5KJ9kVjtiHgw39G74aJDSblW7q?=
 =?us-ascii?Q?YhshoxlolGiP+gTp+3BjaGBc5iiBgp4+FTltZtI9yECFbceZnqxoe424G+U1?=
 =?us-ascii?Q?+miC4bn1tbRxrPc1pBsOJUiwrOEHCPH8Gq0hLyPMutUOKfjPKhlj51Yh/ivn?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae55ad8e-0c72-4a12-7cbd-08dbbee7335c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:20:41.3582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/EhqKn4+rcFEd3HLZUHaJkcN3K8ImVaq7iDEmB5lotdn6LoYxIoj7neY6D5JdKlBKDSQqsYDgWaOG/C1uogjpT3Mgr5M1FGNbGDX+CtygI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/11] drm/xe/dg2: Fix using wrong PAT
 table
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 03:36:26PM -0700, Lucas De Marchi wrote:
> DG2 should use the MCR variant to program the PAT registers, like PVC,
> but shouldn't use the same table as PVC.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 86386633e206..8418de44c646 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -108,10 +108,17 @@ void xe_pat_init_early(struct xe_device *xe)
>  		xe->pat.ops = &mtl_pat_ops;
>  		xe->pat.table = mtl_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
> -	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
> +	} else if (xe->info.platform == XE_PVC) {
>  		xe->pat.ops = &pvc_pat_ops;
>  		xe->pat.table = pvc_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
> +	} else if (xe->info.platform == XE_DG2) {
> +		/*
> +		 * Programming is like PVC, but same table as previous platforms
> +		 */

If we update the ops name in the previous patch (for consistency with
our "name after the first platform" tradition), then the comment here
should be adjusted too.  E.g., "Table is the same as previous platforms,
but programming method has changed."


Matt

> +		xe->pat.ops = &pvc_pat_ops;
> +		xe->pat.table = tgl_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>  		xe->pat.ops = &tgl_pat_ops;
>  		xe->pat.table = tgl_pat_table;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
