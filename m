Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D292EB3624
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38B510E5BD;
	Mon,  2 Mar 2026 20:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJXFt9PB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D818010E5BD
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772483787; x=1804019787;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=irjtkX3ytp04SAbSEx2GYHa+B5HEUJjEqfrhq8Gs01k=;
 b=oJXFt9PBDNcwes7nx3JbBUMjJEed2HOYhN/W3C3nCecrBOZmwTuYwWBY
 kJ2YUUE+EK4U0z81UGiOtV7Y5Ef8bmvbV+wIxQR+qZ2gc1JAtCINkrJ10
 iv2Yt3G8Pes/1WjuGehKxFyjBKHYAA6FbhV93yFFjL+iJnuu/kImsAuXc
 ojW5n1lPja6GiwNu1xicfLhSDAHlG6Um5ai22ViWU4qS8wvT3ufKQEgOH
 t4XX0E70dDWOKrHSeLd9lpgROv+OA9IHFOnS+nNLVht7gl2N+sUO1KNSh
 mfSCC8KSNVSAKau8J73VfX8r4zyYCa9Ih4M+Gewm5O8wTzxiNSu8Ntl88 Q==;
X-CSE-ConnectionGUID: dQi0vJFvQfCDH4eEY66vMg==
X-CSE-MsgGUID: rSAI8889Q1W6eJ2RgEVW8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73571889"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73571889"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:36:26 -0800
X-CSE-ConnectionGUID: /BLANYOGThqa53OOTkhJdw==
X-CSE-MsgGUID: 4SmC7IQ/SSOhhpbK0FtWHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215732248"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:36:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 12:36:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 12:36:26 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 12:36:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLgxbIl9AjA0MH10lcehAmqrJCWnzmW+tMEgnaJ2Jof47dCze0MF15+Xubvd6s0b4jre8Wu0+kOGK3sjUM2qesc2JUI5oeQLcuQ57CuZzsEbiBfNyKM4xJ68t0FVxtgjWnOtlGhObuW6WX9wC1rfrqbIBu979g4BZvcAgTXdEnVIaC9XAxlbErRYu9Ug/eLOr6aYoL+ou53CyazLLQXrS0yKYL5F0NllVsKSCazifYmbKVFEOXsovOVo9ppcXrzzsTzeWUj4s0nKi9Q7B+UqwiIhfANIRuQ/ij39LVwF41YI8fMmjhRli7cGqidsVi8/h5roETOpVAo4nGc/sIdG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvnDKm9KzcNnLYKBuhOp9Xpbtmgg7K7xSVSkq2YhGBI=;
 b=G4yjmCxHpmBsKyrq0z/7THB2U5AI8Rydeq3lehrpkOlYUzcvyOL3qiokEKlK0RCejm1002xLuti4A2k8gdT9bzoc80x/MPlT/OyY380Gkk81y/FBCmpAfi5Ree9kZS8qa70iDraslwqHgkI4HU359WEvULrq7NPsWnCq//4vm2K7Bdz9FCx61qvplCucmQCOg9V/yrkTMPA+4Vr3GzmQVOiaIAL+ZoJQtMkwu4vpta0b2SNf6u2VrE3SGU/Iruga4Q8wiT1d5s6VUivx6qfNE9jlBnMHHNgFA9+9rkv+9GCCglCHb3Q1GdUxK/2aqwbv0fzfX3HIN8Z10ue7j4G3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6013.namprd11.prod.outlook.com (2603:10b6:8:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:36:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:36:17 +0000
Date: Mon, 2 Mar 2026 12:36:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Take pci_rescan_remove_lock mutex when
 disabling VFs
Message-ID: <aaX0v0pezDvqt9mT@lstrano-desk.jf.intel.com>
References: <20260227214048.12649-1-michal.wajdeczko@intel.com>
 <20260302094336.tdcyzx6kqkthfp4v@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302094336.tdcyzx6kqkthfp4v@intel.com>
X-ClientProxiedBy: MW4PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:303:dc::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 437c53ea-31ea-452d-6296-08de789b5ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: VH2M4nVKlr+Cl/0QfNcgoqVTyB2ZS+UuXSUcKZBt4i35DEIzc5r4qpZ2OJaUkcBP/ublWFt9Ge1gTvHJv2gRf7ua7RwTN5fV1D5kG8UW8Sz4bZzyKbMURfPCfdo42Kke6UwZLWmZ94VFs6NIBQMtEskCdVsAZE+CVOLCF0r83oOS1vYrzhCIX0zPMPbFv98q8rtBfjcf3VsgEVVMt1vHs08XkDUgqG1PFQCQx2wCBAaJRRuul80PSV3mdafq+Rmt677pRCOmJRyyEGLT2iDv6EepqMZYykYtw+osGHk1vrsprtZny4+43mkVrvHTaBh6Y4IlRBcZVifda5qjhJ5HL2kCMDyYHwcshPcxZ+ONzfdGLvYt7B1CVuEF80cUUvPlL/IdGZ4KVso+1gqPvpRS6WZqIcHFPJcAsXX1lPxtwhW4qf9xIBKboQnnFGdEepFxxP/WtSpeK+hN2JV+xBtIGqpIo+r+moDhCbc7aHt1VtYrJQvKR3UFxgH1ZR89kTbpFxnt4Pyhmmaw056Fc18iRBUWUBIa2LtqNaBnbqyy85mL8WUKnzwvFD80q2F1Dan6gvjNa4CQ1aRpb1NCOUoNXBLGa/Jp/FLiuVtB2bFkaYC1ly8HNiiIVP99+hvmTJLJNo/G3jYaNTf2bkXAAwKOYhVwkFPN1ciMlRKIfeZHx7I1tKHuPphJgFZG/MGhKfL75GntomNlAijm8ahicXDcK8nwTNzfGoyD/6sMKm/dIbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk9XTWJVSHN1YWFOT0loY01OMFE3VlNYRnB3UmRickhCdTN4QVJhV2JkcFhI?=
 =?utf-8?B?L2FCc2tPU09rWkhYdkorSXhxQURDSjRVQVFVNkQrNmh4THNpZkFLSHJwNG5K?=
 =?utf-8?B?OU5PRVVCa0ZMeTZZTmsyM3UzeXJEWnVaQlpBY00zYWNMVFpZS1JRTzAzYUUy?=
 =?utf-8?B?VFpVckdYemVEejFGdmhPVXgwUm9LMGk5RmhmTEM3ZnR3K2xWODZrTXY2L0tW?=
 =?utf-8?B?OHNHNk5qTThUdEdLYmtUeExxQmVJMk91YjlYYzBjT29wZ3E5clRjNkVVNjJT?=
 =?utf-8?B?L0EwZEp3QVlWQUZjcC9YbDNRa3QxUE5VTzIyV0dzYXRCZ24rY2JPVlFRTS9D?=
 =?utf-8?B?empsK2o0MEovK2dQdHIzZUt3elVpNTBoeEZqR01WYnF4VVQ0QnpHVGt2ZzVG?=
 =?utf-8?B?WGN6TU80YkpCZEZ6MVdyUll3VURwQXVnM0dUVHZUWDdnNmw5WENmVE5UZ1VJ?=
 =?utf-8?B?ek1lcG4yaHEvTlQvRWRPczBJWlhDazh1cGVDclBrTW5VMnd5UVR1bUwwUHFn?=
 =?utf-8?B?dEhzQkJuMk9xWjFTRnh0NDlONFlqeFFkdEdNUzRGazJHUHRlSlNQMFp4K2ZU?=
 =?utf-8?B?ZkNuM1JoOFhTdysxY2ViL0tSajEyZHlzcmIyeFZkZFFyaDZIY3lFVkQvM2U4?=
 =?utf-8?B?eWpISHRudE5UbjJYcmdmam1jb3RtV3MwZ2ZELzVjeUp1a1NBZlQ1NjEzYVJH?=
 =?utf-8?B?NzcyWmJocjlBMXpSdkpubVFRUWFwVFd5K0dVZEsyUDdUbC9qMmRTN0lXUE92?=
 =?utf-8?B?SVRnVFdsZzFIY1hic1J3L3hjUlg5TWUvcDNxd3dLa2lxQ2tHZVlqWVlVRklF?=
 =?utf-8?B?TkFCUVoxcVhZVmdiWDJmMzFNYThBK3RMbkhVUmJOVTJYMEs0WUR6N0pmVUNu?=
 =?utf-8?B?dTdiRS9qSWR5Vk51MG9LTlN0UTRhREwwcUtNTGpkTU9SRmNvcmJYS0YxUTlK?=
 =?utf-8?B?R1ovWVRtUHoxOVh3ZkY1TE9kT3dJeGpUc1kxcHdoZTJ1V1M0ajFsaTRqUUpY?=
 =?utf-8?B?RTVzakRYMzNyV0ZvNUFDSkVGYUVHQlNlemZzZTdubHhQTUU3cTZBaW5GMzdY?=
 =?utf-8?B?OHdBWlFmKzlsL2VyYTUyRWhpSEZiNjBma2NrVFoxNHpZanN6TjhSYW5ucUhh?=
 =?utf-8?B?d1NEckVxN0F0ZXdrOE9Hc0VzT2FDTHRwODlsb2VVV2M3NjZUMFhqT0ZzQVk0?=
 =?utf-8?B?S055QlRkV3Y0SmpXWWNtTDdoLzlaNTR3a1BRUGx3YVBZakI2dDZJYnVlaU0y?=
 =?utf-8?B?MlFUVzBSWFhtU1dYZndaeENuLzk1ekhuZ2t5RXJ5THdiSGlUWERCa1Y2Tm1m?=
 =?utf-8?B?c2h5Y09rMWdzT0RRNXNha2hWRHBXOWN2RWdNNkw3Z3U2Q0lzWDh3WTd2d3FP?=
 =?utf-8?B?OUZsMjRnZTRsUHJGWTBlMDRUYTd3cG5rVzNWTUovRWxXeFVVcG1TV0JoZUxR?=
 =?utf-8?B?b05rYWdCeDI4OHFEaTViZTR4TVcwNUdvYnk3b3R5T2tHVHVCcCtXTUZRUktz?=
 =?utf-8?B?TUQvajhBb1NhcGxMRWZOVE8rZDJaQTRyRUszb29oc1QzNUNyQWpwRzhab3Ax?=
 =?utf-8?B?WDRvNzlNWDR6c0N4aXBjd3RHa0ZjQW9mdUhlM1l3ZHJLaHhxZ3QxRU5LcVo1?=
 =?utf-8?B?QWtyVGppdmxHb0ZTZHl2cXFpR2dzbXBWd3RlOXg3eHhma1N1bzVPN1RDZFlJ?=
 =?utf-8?B?UTk3Mjk5aVBuR3RNN1lZMUtxSForNjJVQlF1RjlrdllaQW02LzFUdzhvVWV6?=
 =?utf-8?B?UXVJNzIzUmNORmVhaGZhMXhwY2E1Vy8vcy9QVDNwTVV4MjUvZk0vZ1l5eXAr?=
 =?utf-8?B?Y0lycHhGNWd3VnhhejdMcFZTY1M4eVA0SHhNY3IxUzdlTGdOaG9TWHFGMkcx?=
 =?utf-8?B?ZXBhakNHUDRINTBSTW9lTFVhcmNuT0ZkMkptYkdSYnFTMVp5Vi9TbUYycjk3?=
 =?utf-8?B?K1FGcCswUHgvWnpqUjB2MDZzRjIycWdubDFHMXpsUkJ1NDBEdHU3OXo0bmRV?=
 =?utf-8?B?VXFHOEZCcmRHWURxdyt4VG5ITHhrT1l5R2Yrbm53eE9tU3pHdE1zVXdJdjlD?=
 =?utf-8?B?MWtmanF4NEovUXE2YncyZmthOXkyV2Q4U0ZGc3RpUHdYN0hzUWNVTzVDWnBn?=
 =?utf-8?B?b2NoVzdnTm11cWx5cEdhNGFIeER4bzZkZlFoenhIRGttdjdITGJLdkxhYkU2?=
 =?utf-8?B?YmxjRXl5clZNOUl6cnRLNno3b0pFNzR4ZkJ6d1VXa1VQbE1HZjVWVmx2K1Iz?=
 =?utf-8?B?Mm9sU0ZZdkU4anFzRnA4K01IUHZIYkpCWUppREdoNEZXb01zRTRlNUh4bDFs?=
 =?utf-8?B?NmtEN0VtUXRGV0J3V2l0YXBKK3gxT3N1VEdMeWVPeEF6aUU3S3R0VGcvL3Bz?=
 =?utf-8?Q?Dxa7GxhrLOs3jh6A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 437c53ea-31ea-452d-6296-08de789b5ae8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:36:17.5266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAOpQVA/agynqmgIIp6Bh3iwArFz7EL5A1b5AwzF9L3QDA80Yh2I+Fzpgb8Le9QTCdevcRsNfyq4KvMumUEbMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6013
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

On Mon, Mar 02, 2026 at 10:43:36AM +0100, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2026-lut-27 22:40:47 +0100]:
> > Since recent commit a5338e365c45 ("PCI/IOV: Fix race between SR-IOV
> > enable/disable and hotplug") the driver pci_driver.sriov_configure
> > hook is called with the mutex pci_rescan_remove_lock already taken.
> > 
> > As we are using this hook as-is during driver removal, we get:
> > 
> >  [ ] xe 0000:4d:00.0: [drm:xe_pci_sriov_configure [xe]] PF: disabling 1 VF
> >  [ ] ------------[ cut here ]------------
> >  [ ] debug_locks && !(lock_is_held(&(&pci_rescan_remove_lock)->dep_map) != 0)
> >  [ ] WARNING: drivers/pci/remove.c:130 at pci_stop_and_remove_bus_device+0x4c/0x50, CPU#32: rmmod/6476
> >  [ ] RIP: 0010:pci_stop_and_remove_bus_device+0x4c/0x50
> >  [ ] Call Trace:
> >  [ ]  <TASK>
> >  [ ]  pci_iov_remove_virtfn+0xd1/0x140
> >  [ ]  sriov_disable+0x42/0x100
> >  [ ]  pci_disable_sriov+0x34/0x50
> >  [ ]  xe_pci_sriov_configure+0x2d0/0x1150 [xe]
> >  [ ]  xe_pci_remove+0x7c/0x190 [xe]
> >  [ ]  pci_device_remove+0x41/0xb0
> >  [ ]  device_remove+0x43/0x80
> >  [ ]  device_release_driver_internal+0x215/0x280
> >  [ ]  driver_detach+0x50/0xb0
> >  [ ]  bus_remove_driver+0x86/0x120
> >  [ ]  driver_unregister+0x2f/0x60
> >  [ ]  pci_unregister_driver+0x22/0xc0
> >  [ ]  xe_unregister_pci_driver+0x15/0x20 [xe]
> >  [ ]  xe_exit+0x1f/0x34 [xe]
> > 
> > Fix that by taking a pci_rescan_remove_lock as it is now expected.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c       |  2 +-
> >  drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
> >  2 files changed, 21 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 3ac99472d6dd..fb0abd768e67 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -1010,7 +1010,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >  	struct xe_device *xe = pdev_to_xe_device(pdev);
> >  
> >  	if (IS_SRIOV_PF(xe))
> > -		xe_pci_sriov_configure(pdev, 0);
> > +		xe_pci_sriov_disable_vfs(pdev);
> >  
> >  	if (xe_survivability_mode_is_boot_enabled(xe))
> >  		return;
> > diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> > index 3fd22034f03e..2a3fd3578ef2 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> > @@ -239,6 +239,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> >  		return pf_disable_vfs(xe);
> >  }
> >  
> > +/**
> > + * xe_pci_sriov_disable_vfs() - Disable all VFs.
> > + * @pdev: the PF's &pci_dev
> > + *
> > + * This is a simple wrapper around our function that implements the
> > + * pci_driver.sriov_configure hook but also takes a required mutex.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_pci_sriov_disable_vfs(struct pci_dev *pdev)
> > +{
> > +	int ret;
> > +
> > +	pci_lock_rescan_remove();
> > +	ret = xe_pci_sriov_configure(pdev, 0);
> > +	pci_unlock_rescan_remove();
> > +
> > +	return ret;
> > +}
> > +
> LGTM:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 

The lockdep reasons and the placement of the lock make sense to me.

I do have a question though, as I’m a little concerned about our driver
having to take a lock like pci_lock_rescan_remove...

Why is the xe_pci_sriov_disable_vfs call needed in pci_driver.remove?
In other words, why doesn’t the PCI core call pci_driver.sriov_configure
first?

I don’t see many examples of device drivers having to call
pci_lock_rescan_remove [1], which is why I’m asking. I’m wondering whether we
are missing an accepted flow for SR-IOV, and whether the need to take
pci_lock_rescan_remove just to silence lockdep is pointing to a larger
issue.

Matt

[1] https://elixir.bootlin.com/linux/v6.19.3/A/ident/pci_lock_rescan_remove

> 
> >  /**
> >   * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
> >   * @pdev: the PF's &pci_dev
> > -- 
> > 2.47.1
> > 
> 
> -- 
