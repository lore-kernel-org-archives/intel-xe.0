Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B712CA1009
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 15:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A0010E172;
	Wed,  3 Sep 2025 15:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxUE/KYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1411410E172
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756912188; x=1788448188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ijVQx/hjEclbzm2lNkgwOgGYriB8IxUn+OAcdStyXwU=;
 b=ZxUE/KYLaWlEIOqcUpbCfWusnZ7jEtJWzFxPUCRYa62aNFomqlX1S+SL
 TGJpFn53PKun4emJWmSb4QufgzLsdw++Bb0suVGXxabNqYDQoX4OG/zl6
 6U0pZImRPivf52hWVf61S5lofvgx7QcJ6BKUrPLH1AP9vDoplHg4N8Q5z
 ORL4L1TzxWRpfMvW3YYLsmLcMaHJ3RWR3vxccFqn4F0gP0P674TXoj5cq
 5G1qnJmA8v6A3S4CKjZOC352f4fw+qc8vLw7U3/8KRRh7aK82//iwFfhU
 lE//J3fe2+sX18c7BviiGpNF3v8z8T7bMG1+4UDnJv1j/i4YWp5eOVf0J w==;
X-CSE-ConnectionGUID: eissuuoZT6ykoZJbZtdA2A==
X-CSE-MsgGUID: LNJeMH//TR26E+KO+8Gw0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76832368"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76832368"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 08:09:47 -0700
X-CSE-ConnectionGUID: 4NW1//JUTWCH/GFh1P1+Bw==
X-CSE-MsgGUID: 931RP93wQwKZP2Li88Rjvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171180093"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 08:09:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 08:09:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 08:09:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.61)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 08:09:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLoe2RadAr3wk+HL7u6j/A04QkpqEnAHt9A5PkC9ad4y459V74CByZOQ4cWUYV762w7RdYEYliJV3QoFKPrDRAtYgBz+4GxMaWLnFrDuqdAMibexeq2dLL0iTEMPdSFSL8lsPuk/kvlx+6+Ae3CbnsIK5aZVmCr11FA4PcoXOcfN6wqh4nsod7Bw1/gcVeIM45b7zZR5VCVj9KZm9sJyL4P7VXH7m00DroESisCD6IBkEBLq26vlqd+S3p2jKIUgJTDxxgYTXdVLpjL2nF0kFF2CmGuhI/98UxUhEG6m5vqW5LV+VLmGMPCUB7uI9s8rbAnzVw9Y6BEFJb4695nSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGDI71IE5BA/BIj/MitKdRTxv89d0dkaawmBRGoXn0s=;
 b=tH7heqEC/W3EOEmUkz6ObmnKwuDc24LW3ngEuBRLCTBm1hmqTQf1mWzaauGpFknXk783qp9Q84FGmTxkWGkMevue2ydCn3/XbPNMLQncCKSg+JytQqBG1PisSY/LWf/mEUub0DmwWu21jjo1qsJaAo3cJdomWdjUDZLS2hB86sCS5xVVCdDJWy7vfPW4nZh6TH2hpdjn/5mdJylowqB0gH8cgmM/1mXPZGbuoq4ALqZizPvCujXXgbyiTna0+wG5tSoI9wsT2FJBtB4saqSuPVS3qEwH2y5OfTq34k5teqNjbN2AEbe/AtRUwi+OI9kBX1vhc82GapFMFL0Rm5EAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 15:09:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 15:09:43 +0000
Date: Wed, 3 Sep 2025 08:09:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Message-ID: <20250903150940.GA5460@mdroper-desk1.amr.corp.intel.com>
References: <20250812182846.1608209-1-fei.yang@intel.com>
 <20250812182846.1608209-2-fei.yang@intel.com>
 <aJufANNMVyeB0HMG@lstrano-desk.jf.intel.com>
 <BL3PR11MB63624BF7AAB3546C1A1920DC9A34A@BL3PR11MB6362.namprd11.prod.outlook.com>
 <aJ+hzc0Jc//MGBf/@lstrano-desk.jf.intel.com>
 <BL3PR11MB6362FB165EA94DA388BFDFEB9A34A@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL3PR11MB6362FB165EA94DA388BFDFEB9A34A@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae9be01-73b5-458b-e7cb-08ddeafbe981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sqXiPnBknNQtLPuC9Ee1VGhpJXr2nwXeMBDqqLLUPWlwII4/ZHXXQsRss9QN?=
 =?us-ascii?Q?hPjGQoVm8fgt6z8VStep+8uz0wCe17vpHu21ywFQ79jOHCCeZMNgJFIfyi1j?=
 =?us-ascii?Q?i6m2/uukfX9WcUtN9REo4YIzronJGdlGD1fhNZ0/ggcFVXmLeF3+TeXhi+Aq?=
 =?us-ascii?Q?uqNNCWQagNzLwoT2FMGOLpNrOgKvQmdrj52d73mlKAAjkoMuaGDa0VQIuocm?=
 =?us-ascii?Q?L07SU6XjoGQ+xCNndCdfoHZZZaiu8zBoeoJ+Pp3xWCeKpwUalvhjWYko32ti?=
 =?us-ascii?Q?AUzDt6legWY5HArtAAS2pCuNr6pbQiVGKDvfVnkIJYwvomJeeoAO+Axj7yfr?=
 =?us-ascii?Q?sWUqfjbZ5iNgBS7mSpj9qieAdu0+AGnp7R5+ha2QDRPQdiTVIECf4KKrAwmp?=
 =?us-ascii?Q?TRtTFrh6TKy6TBKkfTJX02pVTQnuugxwNth9IaFi6ER2tiLav3UZnR2UL22U?=
 =?us-ascii?Q?nrCaxSDGgbqsG6usxJAonaTrldlv9zYqs6LNFTcCijIAv9xP87D4pYVqshZx?=
 =?us-ascii?Q?yddfstIlPJs2CfyQePeRKoNrIDVgCaYcGOqTa9xIfo5td6AfeyTFzOXjkbhj?=
 =?us-ascii?Q?pDbSvWZBg4KIOTs5nCUnutJLbaQv2dQsvnNkAADnF6yBwNptGDqNdy0vPJ3s?=
 =?us-ascii?Q?lI2B1C4GlnnC86WK5UfQKTvXLqy/fTttFi5Y4pWrIn3VUAfrq+iE7AEgmdzX?=
 =?us-ascii?Q?ejFTAjbOxWs/i4dv1LxDZq2vTBFvRmTDmwLKxM9wQJ6Itm6dvwjYB99qCOCj?=
 =?us-ascii?Q?DuHwt5dA65JZOti082SWYDKmk+9ZrCGFQOn4L+MnihFLMW7o0Mgrr5vD8Q5n?=
 =?us-ascii?Q?8K+63Xj4RNqNBR9OVjsFMVdShYanklUadZnKfckCYnV3mSkZBP30xyJOu2zJ?=
 =?us-ascii?Q?pStejfw/3s7ySPoLhFmsZEgA4pE//DYF2vwN6oTeVLYjjx3zyySQA5xEGQ6x?=
 =?us-ascii?Q?C1GuFtgpnXRoz5xvlyJEITMQ+mXI82SUVS8HWkqtHpLdf1cUPZqJspMy8jew?=
 =?us-ascii?Q?iTIEPyaJR9Qef5tCVyednSOwozI+ct6zNtmRGERBrOfgkKf8z5Bjw/8awkq+?=
 =?us-ascii?Q?42oItrd+s8zN6NNROFtdTHlky8lUODpd4xKmyYbE4kDmasN9dnSRqVpc8+qu?=
 =?us-ascii?Q?x109MmGut+/Xt0loQMO649ZjdY2HyMWvE5/WSQOek8NvVXcQNiGuStn80DXx?=
 =?us-ascii?Q?qa32e5iLA/NQqaHlnVra2FWwWkTzIZAfTpHxhi1HtJKf8U7LDgXBqwPIN4yU?=
 =?us-ascii?Q?9ffSJBZJGh4UZbIVcNjcPETM0v6YgIiYILaBWTsA/Hk67IufbQji4uQ82bSF?=
 =?us-ascii?Q?hVORpn+8jnlJ/pvE8Wqt0050jJUTJ5YEo6vONefGTDqzaYXW5eNrtip+9HRW?=
 =?us-ascii?Q?JQKxHDsT9P+r29yf/g3j7A0IwyVobhLnMI6AiCkfw0tJtBN6Jw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L56EEYxrHKgIWupO2gTyKTqmwPnmZsxDO9U/5yAJdnn5VpiRLB4i4gNUNvxW?=
 =?us-ascii?Q?E0ExZ1Nj5mkC1mN0AfbS1ntH87T7iR8HPsmKaHCrt8+Q4GTMcDLZEH+eWLsl?=
 =?us-ascii?Q?5F23APulygYjm8Id7F7NMtDurEZQ8DgJpSrUTnEh40ocYUgvNQsd8sB9xG/M?=
 =?us-ascii?Q?YHSNrbc4rQUYgcuiuowGCL6zegYHdjN2Hda+S64pjG2gRYdnTkRzSRUam84Z?=
 =?us-ascii?Q?fzAxhP2gYSgDC7Dvd4MNjsQDg8y5MtVApm5wmBWYwgwPX3er62nBM7SSP2Hu?=
 =?us-ascii?Q?rQD0BMbOE2pGkuTDJ7itEvTILU4RkJL0/WxQxcGFUwV2irlVBY3RfyyeXNhU?=
 =?us-ascii?Q?GQDsL65v+qXUznw2AGUQA0Rl3WBYl02kDjG12ZKQQkS++e/EeTriduUhgjDn?=
 =?us-ascii?Q?UPr4RzAPFvAAokLkLyowkWFbrg3UzNAF4DkRx8QXdzodgOf3MdfwQWAcIJ2f?=
 =?us-ascii?Q?BxVP+jHFIB3Yya7yECarjueLCfGeJmCc8fTdjEf5kRfuU26z/gR5RbD3f3LS?=
 =?us-ascii?Q?sji5Fc1Td/UqQsa9WBo35DFGQidcI07Rtcl3tB9lli2j3LjpBAQGEZlALv66?=
 =?us-ascii?Q?mVpS/cs8Qz28slDvdq9XwfqRziNeTgUae9iycGKuj17qXze8ywxpmcFFhXCd?=
 =?us-ascii?Q?BYSfX/rWfIaPxyyht61VwQE/seEjcDHvgURzdx/8qo3w9Bf+p7bNT7O1opo4?=
 =?us-ascii?Q?8ndjcJdCKGqEOoMw1znyT9StHJUR9wO/roff2l7pHb5+j7aqyK9tuny2Wg+R?=
 =?us-ascii?Q?tQlgEwQOEBXZF/WM48KXCw8lEtOFJrUYWuTGz9cyK0x3tKaPLKrIVftxOPeY?=
 =?us-ascii?Q?ATyHyQrapTnBtotKoOaS5ozuP5UaISk8zlkhJXqRuDxW5Pi9ZkYaH44a1b6K?=
 =?us-ascii?Q?1qXW2nT/Qoz0/kk7HBPganjYzFZ3X8SCQFKCjxe0KLT+JAxcdK8BoFSK2f6k?=
 =?us-ascii?Q?VxBWnhtUtyddPQ96o0XlRnGTsMBbXeefLvu9Krp6M8YiKm+766WM15eitTud?=
 =?us-ascii?Q?V5PcKUf1aMJsJ3nSlTwfVrFKk7U/jRYTDg/F9dsuK0CmdycTKP/qWz1HQqgS?=
 =?us-ascii?Q?KNtwmpwfarhZqFMnQPU7Z0ZnUPNrQVzZ3/hxCpJhgWNmil3n2whBE/c0QZZM?=
 =?us-ascii?Q?oPy5bTrpGWkHiPXND4KQJgEzdU/edndiBEC8V1BwK+hNQXYKC5x1ImQ+rl57?=
 =?us-ascii?Q?58yMJQzG5h/IpDrtvO0xR+WTSJiVrWDyT3s4kp4yFQK8h6CSvbGq1G54Bo/0?=
 =?us-ascii?Q?ndFOt3U8FL+Hz6VHN7zzLlIgqoCesF2waZfUf9zRxMyCrMB4xOIZH/FKiub9?=
 =?us-ascii?Q?ASkYQcVbr4jHY6gg9q8zjouC4rKzW9VoT5o9QWSbrbXz13eI1l4mOp9B2Ujg?=
 =?us-ascii?Q?ibCWHjfZAuyUizHk7PT5ukVc8fueK8mYjLemb2bYk27gXumX1XeCADs6j/Yv?=
 =?us-ascii?Q?ONdicxLIjhN3YoXoNyn/XZPIHct/lCyXTcTAjV4P0m746zbcvDr6eiCD8JjP?=
 =?us-ascii?Q?4fOrrdlv3s4WfYtfXr7alJcecnQ98gb0Ey28z9fyOPSVsBFFlDO4yXz4yCCp?=
 =?us-ascii?Q?0grEbviXCvXlTot2O2dxW+AJvogjV3kHRp9TZPsqJDN60QXV5jp9YVrphqjw?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae9be01-73b5-458b-e7cb-08ddeafbe981
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 15:09:43.4772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6FtIkFD3XuUS9SeefJU4Cxzcf7w2Oqy9REj9r8bgrgOnaiM0gSqV+HNs/KbZpwGxiW/fGQRLg6m2VWZ2Cko4FcRDNWj8pKyhVtihHMPjL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
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

On Fri, Aug 15, 2025 at 09:28:32PM +0000, Yang, Fei wrote:
> > On Fri, Aug 15, 2025 at 03:03:33PM -0600, Yang, Fei wrote:
> >>> On Tue, Aug 12, 2025 at 11:28:46AM -0700, fei.yang@intel.com wrote:
> >>>> From: Fei Yang <fei.yang@intel.com>
> >>>>
> >>>> Quote BSpec, MI_STORE_DATA_IMM "simply initiates the write
> >>>> operation with command execution proceeding normally. Although the
> >>>> write operation is guaranteed to complete eventually, there is no
> >>>> mechanism to synchronize command execution with the completion (or
> >>>> even
> >>>> initiation) of these operations."
> >>>
> >>> Can we not just use update emit_store_imm_ppgtt_posted to use
> >>> MI_FLUSH_IMM + a PPGTT address? I think we can get rid of prior flush added in 3ad7d18c5dad7?
> >>>
> >>> According to bspec 45725 for MI_FLUSH_IMM:
> >>>
> >>> 'Usage note: After this command is completed with a Store DWord
> >>> enabled, CPU access to graphics memory willbe coherent (assuming the
> >>> Render Cache flush is not inhibited).'
> >>
> >> We already have a MI_FLUSH_DW in between the MI_STORE_DATA_IMM and
> >> MI_USER_INTERRUPT (See __emit_job_gen12_simple), but the issue was
> >> still reporduced.
> >>
> >
> > That is not what I'm suggesting. I'm suggesting convert emit_store_imm_ppgtt_posted
> > to use a MI_FLUSH_DW intruction rather than MI_STORE_DATA_IMM.
> 
> Oh, sorry I misunderstood. Yes, that looks promising. At least the BSpec
> says CPU access would be coherent, but I'm not sure what would happen
> in the case where the write is triggering a page fault. Will give it a
> shot and send a different patch if it works.

Doesn't emit_store_imm_ppgtt_posted() get called on RCS/CCS engines?
MI_FLUSH_DW isn't supported on those engines (only BCS/VCS/VECS; you'd
need to use a PIPE_CONTROL instead for RCS/CCS).


Matt

> 
> -Fei
> 
> > Matt
> >
> >> static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 flags, u32
> >> *dw, int i) {
> >>         dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
> >>                   flags;
> >>         dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
> >>         dw[i++] = 0;
> >>         dw[i++] = value;
> >>
> >>         return i;
> >> }
> >>
> >>> Matt
> >>>
> >>>> The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT
> >>>> consecutively to implement user fence. However, according to the
> >>>> BSpec, the data write operation is not guaranteed to be completed
> >>>> when triggering the interrupt, that would cause the
> >>>> xe_wait_user_fence_ioctl to wait until the full user specified
> >>>> timeout is reached before checking the fence value again. Great
> >>>> performance degradation has been observed in IGT xe_exec_fault_mode
> >>>> test cases due to this unnecessary wait. The worst case is that if
> >>>> user set the timeout to MAX_INT32, the wait could end up being a hang until some other random program triggers a user interrupt to wake it up.
> >>>> A semaphore wait is added right after the data write to avoid the
> >>>> unexpected wait.
> >>>>
> >>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 11 +++++++++++
> >>>>  drivers/gpu/drm/xe/xe_ring_ops.c                 | 14 ++++++++++++++
> >>>>  2 files changed, 25 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >>>> b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >>>> index c47b290e0e9f..1c9e7b35c665 100644
> >>>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >>>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >>>> @@ -34,6 +34,17 @@
> >>>>  #define MI_FORCE_WAKEUP                     __MI_INSTR(0x1D)
> >>>>  #define MI_MATH(n)                  (__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
> >>>>
> >>>> +#define MI_SEMAPHORE_WAIT           (__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
> >>>> +#define   MI_SEMAPHORE_REGISTER_POLL        REG_BIT(16)
> >>>> +#define   MI_SEMAPHORE_POLL         REG_BIT(15)
> >>>> +#define   MI_SEMAPHORE_COMP_OP              GENMASK(14, 12)
> >>>> +#define   MI_SEMAPHORE_SAD_GT_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 0)
> >>>> +#define   MI_SEMAPHORE_SAD_GTE_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 1)
> >>>> +#define   MI_SEMAPHORE_SAD_LT_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 2)
> >>>> +#define   MI_SEMAPHORE_SAD_LTE_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 3)
> >>>> +#define   MI_SEMAPHORE_SAD_EQ_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 4)
> >>>> +#define   MI_SEMAPHORE_SAD_NEQ_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 5)
> >>>> +
> >>>>  #define MI_STORE_DATA_IMM           __MI_INSTR(0x20)
> >>>>  #define   MI_SDI_GGTT                       REG_BIT(22)
> >>>>  #define   MI_SDI_LEN_DW                     GENMASK(9, 0)
> >>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> >>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
> >>>> index 5f15360d14bf..189e764e3914 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> >>>> @@ -169,6 +169,20 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> >>>>      dw[i++] = upper_32_bits(addr);
> >>>>      dw[i++] = lower_32_bits(value);
> >>>>      dw[i++] = upper_32_bits(value);
> >>>> +    dw[i++] = MI_SEMAPHORE_WAIT |
> >>>> +              MI_SEMAPHORE_POLL |
> >>>> +              MI_SEMAPHORE_SAD_EQ_SDD;
> >>>> +    dw[i++] = lower_32_bits(value);
> >>>> +    dw[i++] = lower_32_bits(addr);
> >>>> +    dw[i++] = upper_32_bits(addr);
> >>>> +    dw[i++] = 0;
> >>>> +    dw[i++] = MI_SEMAPHORE_WAIT |
> >>>> +              MI_SEMAPHORE_POLL |
> >>>> +              MI_SEMAPHORE_SAD_EQ_SDD;
> >>>> +    dw[i++] = upper_32_bits(value);
> >>>> +    dw[i++] = lower_32_bits(addr + 4);
> >>>> +    dw[i++] = upper_32_bits(addr);
> >>>> +    dw[i++] = 0;
> >>>>
> >>>>      return i;
> >>>>  }
> >>>> --
> >>>> 2.43.0
> >>>>

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
