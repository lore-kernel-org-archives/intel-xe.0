Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F0FE7B61B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:06:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B043710E385;
	Wed,  4 Oct 2023 14:06:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA3910E119
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696428416; x=1727964416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bF0/Mbhem3grGzgpumNbXHZRFkH5OFaWC6kT5wZoMG8=;
 b=BmcAEsTnI5Q8466Is6FR93xfTFivMezLXaXHNgPUWLfhjnDbAnoH+cbq
 X75TOiv3yBxqhVmUAt2YpednZANPcPS7I+jHIyzJXqKJrodJLPgNpwGiW
 EX0okF5dx5zTcvIwLErEnABn9aelf8elXz/dSG8CZGoAyrrsePo43rWQr
 ZvSGfluP6aMQJHlF5+RO9vrUe8aZAXT8PDW/8ELqlsIqeFPvwHGbME7O2
 W6oXsXBUaLReC+puPEPudkkNFbeb5bjWPGnO/9H1NVKTZ6YztfrpRy+pP
 IqSyFtEfYqfZCguDSQEvqO+AjEh2thWlLn53nuXqDmpfqTIr29g8F/vke A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363447583"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="363447583"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751295943"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="751295943"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:06:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:06:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:06:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDwF3rUKhyNq/tA8b51FL+gd4lL7gR3McpajxZA9X5cgldVNsiGUpLwEWdO2kzRBbqKXCJzap/0Hx+dwiJZYMp+2uy8U+mzpQlPz5WS5BWER4acdXCkwbypVJOsPd5hb9JmYvmfjkDvhCAYKUDpTD9aygsddrkgewKzdoHIlneazIMmb7bFxaatp7Bf5Nc4o0rvVoCoevnIg87bXCElG5uZDVKi7u2mC/h/nfKk8mkZh2v2WtJUGX4yhCUvGG311XcECBw2s7o5Y8ZLa0d6qUX/TFhV/30832nf+4+vFJwKm5rz5/29aDtQgli9t2ZfR6zrBL05WaG7/HcfvO7OwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk5mL7QtYHP3EgImW13LxQqRejwpoTvtoExosml83JU=;
 b=flCpWk/wi0Xum5z35FIC4VRfEFiEr1+dRMOLbL3ItFpsdCu9WSe7HPMYAsV8A11K912NT2R+UPGr05Rh2a7mPHCqFW0slOkg+8szaE+cuQfUCWqCeuoWUXKkBa3LilMowxOZgmZQOttDfk867b2oeyApRt3Szv33l9FhqIjFNH38HABKfKNpauOOF/oUqLNxZe9ir3hZRmRyJ1kR/IjSXIvVROiYVNTH7Vv4ReIza9F1nWZhz7efvBkFYe/BPTY+Z59Hk1DvT8UbRXmOwtflI/YA3ipmAg3rde0r8TkdKrV+68uWWMRhcDEYykaoLmpF8TMtEEa1semJwlH/ZN2xtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Wed, 4 Oct
 2023 14:06:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:06:50 +0000
Date: Wed, 4 Oct 2023 10:06:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR1xddeZZWkgatl1@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <871baa0e5be71f89286f026d92cc2b933eab5f31.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871baa0e5be71f89286f026d92cc2b933eab5f31.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5bb611-debe-4021-bd91-08dbc4e3276e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URw+JcVFS8dlaFDkttVE2xdUtQV7fdovKHxHcUbUgB/vWM9MApTx81QtqOy97dKd9VEs+H0uKCvmzU+EPuVBm8IWDS82VfO2VYt78JFdI3WSuVxxMbf2UsUkyue6DnsJ+9S3+ppD16v6XudJ1Ulcb3hkqbOYmz+RMwsBJZ3SZXhQW8ZzQIAlAO0m7X7jr/E5kAgnFLw0bzUHsXj5UOK978h2aGZy5RMdHIo6ggNthJueDhqBx0+dtONLAutLAUrt0l/T3SX6NDgwYEXGVI4vrOUUgRpkWuEX7CmdRqiRjr3nRV61EbmU86m7d2l2hLrkQa/T2gjdf9O7ymD9lNPZqDLevUTZuRx1P2rAOGDhnygeJVsFMfQ9USqccu3E0RRgU6N/5a7MY5jEWukTwqa3nM0iBslHwYkqxDMDLW/m3aLAZanptjIcxFeye5nDhT8GseVv8tJeHZOeqk2u+6ZES1ZQHv/4Vdt5I18LEDF66iVdZ9T/WGDdcFiQG7pdpT0mMBkqk5v0ivSbSG0QA2r+t+KAgBSwSH7JcPrQXJWEf7hJQD9ZhFmOanavNMB08UdB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(316002)(86362001)(36756003)(41300700001)(2906002)(37006003)(66476007)(8936002)(6862004)(4326008)(44832011)(8676002)(5660300002)(66946007)(66556008)(83380400001)(6636002)(6486002)(2616005)(478600001)(26005)(6666004)(38100700002)(82960400001)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cjz9C8rD0IPTyUkO61x/uVjWtVJZUJvOzfdkzv4i4A51QlbVrO0DRz26Z3H5?=
 =?us-ascii?Q?gwxo64HihV4RlqsE6a+xZ+oTXeYzZtNeilLHpJEzHI8cn44DgWVotq6eWLUI?=
 =?us-ascii?Q?RqfE/nJL3YDIOPMQGe1P0bp9ATdU/V1cZpu1UeWsRV264cfs1tKVIigQymtE?=
 =?us-ascii?Q?fJ9t2KIBeHUDSLm5jQT7683012B8Ayf+kISyIA37XLWzcSrvlDhsok1chNjt?=
 =?us-ascii?Q?RloHglWQnl4j/9sB2DDivcpsw6JFc7mh/0f1EEs6L6/GirDkSwoG1KM6arEu?=
 =?us-ascii?Q?LwIGxsqlsOvv9DRaTIKaxh16ZB/T7DaIkI/6TrDOCfT+ZRdlV/H2CBcWgAhx?=
 =?us-ascii?Q?F8g79Wrn8XvUCwNmXqCBxJCz4cr52N4xkJ09yvgkbyLL8qbOJi+0MUI966om?=
 =?us-ascii?Q?d9bbg2Ky7h709gZfV5P29VPmJt+kBg+7EwEqIe+5+AjpV8QNwamWm4iA1DxA?=
 =?us-ascii?Q?Hq7EoJbh26g2lf6nKKWs/OhKBEPG73Uws/MK3wIuxsxMZ7Kv06CQXnCJ2FeD?=
 =?us-ascii?Q?vmkH19rtHcHCn7fUp1vBOOgtzje0frUAB9XDItrOhqbGesB1T27VG1Q4gOAB?=
 =?us-ascii?Q?5GUtk4jtsNdv6FrYeMRIhIlEuzCbpjVn+Svo7CeLlPi4V4Ybbn4FmfhDHcqe?=
 =?us-ascii?Q?6LYl95sCNvkJ/3lTMWZil5nDt+yo1EDIpsWJu1q3peqA294MUDdhGthjpFp4?=
 =?us-ascii?Q?S9xHbW+UwSQulThlqVofKP0F85NxjlaCIi/3k0mEhGJN+PQGWegOX70bP/Z9?=
 =?us-ascii?Q?49QcIKVNnUnO8sHv5uE2GaFuSguuDlax00BYOxH0PO/U5TGzWDO7kQjwqQVe?=
 =?us-ascii?Q?fgt0Lycu/i8I+qqmnc8IbKmQBOwZlhmTLcrfK77eccFM13kthBMzuHNSfj3Q?=
 =?us-ascii?Q?X4ALPe4tlR8UIN3SGt7Tuvrmm7NQWgcE9ySdc8AwPvgRXVTLx792FDKI/Y97?=
 =?us-ascii?Q?U5BrAqV6cTtdMWn1PZ0VwBaaf6pZuTqrwYXFXmIt6OzehkSuhVKxwSGcN1q5?=
 =?us-ascii?Q?YgT2L5K79T+iRJKJM36Qmwwjn5dLWi8ZPRMki7BHRa+nlCHx7cRAkfqNllMx?=
 =?us-ascii?Q?EpYUipv96KYmbJZPunfmddIuA8Ce5uPApq+5AK9GbjSbT86RF81PkZu0i+O+?=
 =?us-ascii?Q?foQ1BEfBPXcJhgcRSy6/S4YAtDHNlrCX0Ga7FuVpJpJ5Oy/sJ3eDJ8unL1C5?=
 =?us-ascii?Q?xlglZNn7pdmhHBNzaYUoZXVGT6Xzo66dTtdRcmKdACUTkoztmnvcSO7bDNL3?=
 =?us-ascii?Q?vyeNjxi79mZr8FHx5XhWiDawV7AHwZGMk+82Psake+W/Gbk43s1g3HlLFjAI?=
 =?us-ascii?Q?UCxnqnW6PGNskR271/NH4VOX4BG4ibzzLUQR0ks83+Mdq0h+ZyEcSUTy0yTA?=
 =?us-ascii?Q?mtJsUn0epvf8+exfrGuYaKek/wmHNketBn8RS2CapQei7+9oWnL0Ox3uhFpA?=
 =?us-ascii?Q?XxgFAdGjjUhPde2IykWwn3v3HEK20K9rTSmR+qcLJWcHnLC5xspRL/gqn7fO?=
 =?us-ascii?Q?dxtmC991uDIToBRwPBSFWAWAG+kFlxB0bP0E59v4WddhT0Ms4MsnOQ6Om6EC?=
 =?us-ascii?Q?1nZoVxxKnjNQ6BLiqAUqtSnzVIt/rWnnPxjpkPkAxJisff2pKtLH1OLyKEUu?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5bb611-debe-4021-bd91-08dbc4e3276e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:06:50.4059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMgAw1IgWzCAmAT4juUAgtgT34bIY4CVMioC1/f8YdVvnfbzedYrVNREbQ3am6VkPcB1oC/UYSVhGRPPpBXu+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8136
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:54PM +0300, Jani Nikula wrote:
> Let the display code debug log about itself.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 32d9ef1e6dc2..b19506fe3e18 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -698,7 +698,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	xe_display_probe(xe);
>  
> -	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d",
> +	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
>  		desc->platform_name,
>  		subplatform_desc ? subplatform_desc->name : "",
>  		xe->info.devid, xe->info.revid,
> @@ -709,7 +709,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		xe->info.media_name,
>  		xe->info.media_verx100 / 100,
>  		xe->info.media_verx100 % 100,
> -		str_yes_no(xe->info.enable_display),
>  		xe->info.dma_mask_size, xe->info.tile_count);
>  
>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
> -- 
> 2.39.2
> 
