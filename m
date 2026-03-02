Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A740EB363D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 22:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98C010E030;
	Mon,  2 Mar 2026 22:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BV3iRpGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB4310E030
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 22:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772491919; x=1804027919;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t4ZoxW6C1BtOebZZGpUEoLLQM7N6a4yUEHiUL7tBQaE=;
 b=BV3iRpGPlEXVGuxpdBojguso1/AviOfQOcsKnS/ZN3s9GKdc3VlqTvzt
 nRHmy4oE1Irj/pTNuk7ftiZelJVrjaTK9XcCHdvN32z3k+hi/tktDaXG8
 ZK6Wt7ddxrM2D2SdQxZ+jF8tl7/pPxB4vFdCXJC+nWWYg5BB6g+MrYPpd
 Y1FS7exwD7MLJ4ytPgPrVsySrXfdC2TsV++MLJwvPIycFtAFc725PFHEL
 TkO5ErBo1ph1h2bc8DEX4G5Dj3MojVedWWvaVwKOHosh3cmh1l2TNOKmn
 dURfaayfcOAqQyui7Hz94iEOyrYnQBp1updkoId7S9IUNX+U4bouordd+ Q==;
X-CSE-ConnectionGUID: E6zxR6pGRfSpK3a2W+Jgkw==
X-CSE-MsgGUID: Hn9O1r7WSbaSFXNHHy+lFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84152668"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84152668"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 14:51:57 -0800
X-CSE-ConnectionGUID: yTZvHesOSkaLci/oDpWtDA==
X-CSE-MsgGUID: UXM7AI39RDy0I+m3YcqwBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="220836290"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 14:51:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 14:51:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 14:51:56 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 14:51:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6xGUPIHyBHzvRf0ddjNKoDuz7mUvJHh8JJvPfrGb8GOBe03UTQdb1QvGbJcYbGjYIRrxeQYp9ru9+fEhjbqXznULuGzIYuyJ1f2px+rvZnx/iAOVOBJ4kUFdRLibLGcWhdGga2jPQmMfd43jyVbbRaoa2eE5HoIyppSgtcFj/BV5KxSVVOSgfyid9cV9CWo1Aiank+f4rj3Zgpw33h8yKGwgT2c6hzyU5cW8Ic/InTjM8tiH2yhNLDK2f1PEP7Qx5BKCLJJkAmcLtFJAZxxcLceGpKfXF7e0gjYkd7ErLChwiihOgl+Nr2yXmTTEjSGfupxge+Egdqxrw1SQmPRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKF8n+jnUms78ZlXeWte3lHXUNPRRJfypDhqqTld/lc=;
 b=RUycuDAGv7DJwgdSEStV5SlPMeObE+q7S1ndXmjHqFTKk4h0hKFjQgWWeglAzfhwYP3wRw7BKQ4m1oOsTJhCoPbYiAy2FMoci0eQ8ZdXJj3UD2NdmuYy4wfv8yIdQgp77KJKA5qEoj/OnZs6L5ZFUlcRWIQ3vxBdTobmybd0ENdguGuoaA/9/s8C2qHs2gVBpDwAko7GHIrWo4dD35OJ05I5nxmYFpIXjVy92jJAZ60s5gTxXX6/pLoykFDHQGfhp3CALDOm9KIwr4zr6vK9kNaBPzx/ulgwDh2asZ0HqAc7JwajoqcZLR7BADSwGo6rmDxcHg5KzZFTDGWCbpYCWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 22:51:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 22:51:54 +0000
Date: Mon, 2 Mar 2026 14:51:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Take pci_rescan_remove_lock mutex when
 disabling VFs
Message-ID: <aaYUhylKk+AaFFy3@lstrano-desk.jf.intel.com>
References: <20260227214048.12649-1-michal.wajdeczko@intel.com>
 <20260302094336.tdcyzx6kqkthfp4v@intel.com>
 <aaX0v0pezDvqt9mT@lstrano-desk.jf.intel.com>
 <30c186ba-8d1c-4c90-b609-58218f06c469@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30c186ba-8d1c-4c90-b609-58218f06c469@intel.com>
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ba3e92-027f-4855-b3b4-08de78ae4ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: KHhQRZBTHe5ZP2QU3EqVkkmU1KBLttSlsDDTufETp2DYgifJACvgsFM21Lf9D0b89Svx0QYSxWhTzVNg7mtYaZW+Fz5Bhi4YzYfAGWCZzdY1beyVa3ToF8W1LAlSJEEGHfY2P/6ggbinDuAWjMKDq433oCYPmPycYTtiGhUvEvgcJbjxnsRx14Yr8hHPGwgjDEVfPEvIy1dxIFsMJo7XA/v7r1JmGOwSQJg/JWqygEut0ICOAhWsrVcKKq6ujFCXj/djmBKqG22TrOiwHw3A+jXrp6CrDmmG+PRv8iD3hl3fa8ELvJPAClRjQkcmCmltCHyELRy3XEqAfKc16/y5YmvACC4YcF7yIrqpY3vAiGL3DXi3Ym8gzabWgAsPgmJZIXp8mc427ZR8o3oCDds228pKq2fCRiFGuI9JbM/C6fcssY8nlRpUDR/yD2ExjLxlS1WKR+eZCL3Tgq/B5ZlX3/POdTOQoFDvR4D1iuzMfEq7uezuBj7WHnIkoFAQwPH2ziSQlWKSj1lEfa/KCIYayQrgi2FrgnEfFM61vb/xphIH/zIZytnws+DabWVytZ6ifaT8Rt/LfznCxLqwcs5YTuWIeJcXSfZHSsm3C9s76wQ/Bg+q2ASRiNDWeGT+CqrAw4V6up6VbwZhnHNVSDNK8qfiTIyHmzdSwcBRHm1/9nh9dwM1/xz+V3IOaDVr+zPg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFLTmxoMHBBRCtUVFBVeEJTeFpjaHJ6TExKb05HUUp6MkFqZFR6cUVNYUJ2?=
 =?utf-8?B?QVVLczhQdHJtSzd0N0JDMDMwbDlpa1hWcEQzRnhQUzI4eTdxVXFWYm9TVXQr?=
 =?utf-8?B?Y1l2K0RmWndQS2cxV0pqaytrcmVJV3JTM21YM1g4MGJOZmxuTzlZYXhUaTFt?=
 =?utf-8?B?bjZxWExyNld3R3pFTDJrUWpQSTJQYkNjVUdTWkRGN1p6V2k5K3huVUh1VTU0?=
 =?utf-8?B?T2dsWUd3aXlMdTdQZmZWOTh5SFF2dHFzQ1VBbHhjdm85R0VWdzFVdHVBZWtm?=
 =?utf-8?B?QXpqTUZzSGREZ1Q0bWtQNnJqVk4vVmdLNjVhQ09WMEhCdmg1YmRmT05lUXhy?=
 =?utf-8?B?N3I2QTJUeC9nRXBaUUpPNmhqL3dMVWQ1ZFQxYmwyUFMyOGtTTnMyUkk4R3V4?=
 =?utf-8?B?eDB3RUFqYU4vVjB2ZXFnL09Lc2V3emkxOTV5S25GWVN1Mnd6bStUQnFBempP?=
 =?utf-8?B?RnF1OU55b1oyYzJIZGU4dE9nV0tXV1gwZFMrUW51b2VNcmN5bkJUQ2Ivek9Z?=
 =?utf-8?B?enJMZ0FTSHg1YjhpYnJxMzVGazh0QjhJUkJkaXVkb2RYU1pmblE3TFlPeVV0?=
 =?utf-8?B?Y1M0QjRibjN3a1RwejN2ZStMajhhVmdTSVhFb0lGNE55ZXcxaEJIb2Y0UFYr?=
 =?utf-8?B?MWRHNXJ6UUJReDBBUGRRZEtaTy9rMnZuNWRwQmFMNU1kUFZTZmdsY1VJNmJv?=
 =?utf-8?B?MlZKWXdYdHlqNkF2aVhJS1d0clRvVTEzOTdHcTVvU2twUEkzeVdSNUN1N2li?=
 =?utf-8?B?MVhpV2JqYk1tNDF2dkYrbTlyRFJ6RytMZHNjS0ExVVJRenhtL1U0c0orQzFM?=
 =?utf-8?B?WFI4UmxMNWxoaDJtZWRwQzI5TnpyeGN2dm82V3pnNm0zaVNqS1NpZ1lrSitX?=
 =?utf-8?B?QWhEVUc0QVEwNExRUElYeGRkdzU1ZmFIeG9aaStFTUFWU3JjWHFlQjZ0NzV3?=
 =?utf-8?B?TkFIMnBOdUFCdG1VUld4TGpkRnllWUEvOVAzS1JZbmFEdWsyOTQ4Q1pMVloy?=
 =?utf-8?B?b2xCRm1VSVN2RXBkeVBzSmxIS3FNRmlyeHl6RTZ1SFdrTVZHTkE4MUhKalpt?=
 =?utf-8?B?eDlUL2kzOTF2R0tvdWNVSTczdEMyUjdveldPcEN6RkpnRWx2Y2NHOXRvWFVw?=
 =?utf-8?B?T3hhbWNuNTBOeXhNV3BGL3pvYzU2OGZ5VUdXS2FsMDJyc0FUejJnUzhBKzJ5?=
 =?utf-8?B?UVJ3THk2aVRKcEtNQ3R1dFB4dVhyb092a2pLY1dFMjJLVTR4L2hpZmdCeGpG?=
 =?utf-8?B?NDVoUWZndmVLeHZ3ZE16U0dwZ0Y2S25WVWZuRGg2TDRvSndqNEpyY0kxb2pJ?=
 =?utf-8?B?TTV6MEtoWEVLNk56eEI0aTRkZWxXcmcyYTBtbEJDOTJ3ZEk0dGZhOGFRK29M?=
 =?utf-8?B?WDl5d0Y0ZjNxSDVmYkdtdVlQdXJKUHdaS21UNDIzRkJiTk0zVGgwUDZObERL?=
 =?utf-8?B?WXYvWW92UmIxTWlaaHl6Qm5ZT1JVd2pYYkpLVWZkUTNCVmpWeU1aTCs3azQz?=
 =?utf-8?B?UWo3TExiemxKY1IxRFlZcFAxMUlyT1BJaXpCNGx0MHA0dDVZS0k2N2hhV09J?=
 =?utf-8?B?VGdJUWZmcG5KRXdYTTcxTDdNU0QvRWs0S3R3MHczYjBscmcvcWdGWnJmRWxy?=
 =?utf-8?B?Mi9mR09YRU9LMmQwRnZIbFI2SWFqTGxnZWFnUEkrbTkyRk8yOENEWmJHM1ZD?=
 =?utf-8?B?d0F6MFh6QUpxdElrVHo3R2FOYi9nTlJXMTQxeFRyM21CTXlZY2RudUNIUGtW?=
 =?utf-8?B?ZzlORy9FZUcxZ3Bic1hUeE1ObjZGclV3cUdNZFJJUUVBSzlnR3RaRFJKRkpT?=
 =?utf-8?B?Y25WdkJPOUNWcTN3UUM3YjRIcnRnK1JnVW1rUm9ydVY2TjlGUHBjcnNaN3VT?=
 =?utf-8?B?NHpNUGhIRTdEeXFuTkd3SEZ1MDM4dVhnVW80b24xeHVLK3krTkRLRFVGWnFt?=
 =?utf-8?B?c1h3R09PTTVQNFV3QXA4YnhWRzRsUjB3c3BYM2FXNzM3Q0NkcGlxK3EwWXN1?=
 =?utf-8?B?WnNPVENLY3N5ZkRBZTZYMjM1SUY1SmtKM0tDeVVVUFBKbFNBN2ZmWjlGclpQ?=
 =?utf-8?B?dldXZ3JNdFB4QytBS1c5ZGEvcExoNlVuaEwrTEVFYXo4K3RyOVN0UEtKTXNF?=
 =?utf-8?B?ZjhhZmdVRmJPTStYV3lhN1puNnVXeVZiQmhvVi9rUldwdjZvRHAydmNRSGNL?=
 =?utf-8?B?OXB6QjVuOUdsVDJjRkFFOUpsb0ZtMnViY0x3M2xXK09scEJuVzBQWFdTTTNy?=
 =?utf-8?B?SFlCajhjMUoxMmFBOUVIelRtS0IwNkt6YlQyZ0VTMFpWQVNsajEwTDlYUFRH?=
 =?utf-8?B?UTRYa1E4bXFDZTM2SEx5bFpmU1hkc2YxanhLdTN1VHM5Y3djNVB3WFhXRzdv?=
 =?utf-8?Q?JcXaUsfhqKPZNSv4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ba3e92-027f-4855-b3b4-08de78ae4ca2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:51:54.0142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSsJWyFb+NDXHOP41vIPRzYmYUqcj43S0+pvf13tAuIK5065vPGhT7bQ2ooMeP9/FSqM31PP33ZPCrGvWokaVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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

On Mon, Mar 02, 2026 at 10:47:41PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 3/2/2026 9:36 PM, Matthew Brost wrote:
> > On Mon, Mar 02, 2026 at 10:43:36AM +0100, Piotr Piórkowski wrote:
> >> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2026-lut-27 22:40:47 +0100]:
> >>> Since recent commit a5338e365c45 ("PCI/IOV: Fix race between SR-IOV
> >>> enable/disable and hotplug") the driver pci_driver.sriov_configure
> >>> hook is called with the mutex pci_rescan_remove_lock already taken.
> >>>
> >>> As we are using this hook as-is during driver removal, we get:
> >>>
> >>>  [ ] xe 0000:4d:00.0: [drm:xe_pci_sriov_configure [xe]] PF: disabling 1 VF
> >>>  [ ] ------------[ cut here ]------------
> >>>  [ ] debug_locks && !(lock_is_held(&(&pci_rescan_remove_lock)->dep_map) != 0)
> >>>  [ ] WARNING: drivers/pci/remove.c:130 at pci_stop_and_remove_bus_device+0x4c/0x50, CPU#32: rmmod/6476
> >>>  [ ] RIP: 0010:pci_stop_and_remove_bus_device+0x4c/0x50
> >>>  [ ] Call Trace:
> >>>  [ ]  <TASK>
> >>>  [ ]  pci_iov_remove_virtfn+0xd1/0x140
> >>>  [ ]  sriov_disable+0x42/0x100
> >>>  [ ]  pci_disable_sriov+0x34/0x50
> >>>  [ ]  xe_pci_sriov_configure+0x2d0/0x1150 [xe]
> >>>  [ ]  xe_pci_remove+0x7c/0x190 [xe]
> >>>  [ ]  pci_device_remove+0x41/0xb0
> >>>  [ ]  device_remove+0x43/0x80
> >>>  [ ]  device_release_driver_internal+0x215/0x280
> >>>  [ ]  driver_detach+0x50/0xb0
> >>>  [ ]  bus_remove_driver+0x86/0x120
> >>>  [ ]  driver_unregister+0x2f/0x60
> >>>  [ ]  pci_unregister_driver+0x22/0xc0
> >>>  [ ]  xe_unregister_pci_driver+0x15/0x20 [xe]
> >>>  [ ]  xe_exit+0x1f/0x34 [xe]
> >>>
> >>> Fix that by taking a pci_rescan_remove_lock as it is now expected.
> >>>
> >>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_pci.c       |  2 +-
> >>>  drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
> >>>  2 files changed, 21 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >>> index 3ac99472d6dd..fb0abd768e67 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pci.c
> >>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >>> @@ -1010,7 +1010,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >>>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> >>>  
> >>>  	if (IS_SRIOV_PF(xe))
> >>> -		xe_pci_sriov_configure(pdev, 0);
> >>> +		xe_pci_sriov_disable_vfs(pdev);
> >>>  
> >>>  	if (xe_survivability_mode_is_boot_enabled(xe))
> >>>  		return;
> >>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> >>> index 3fd22034f03e..2a3fd3578ef2 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> >>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> >>> @@ -239,6 +239,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> >>>  		return pf_disable_vfs(xe);
> >>>  }
> >>>  
> >>> +/**
> >>> + * xe_pci_sriov_disable_vfs() - Disable all VFs.
> >>> + * @pdev: the PF's &pci_dev
> >>> + *
> >>> + * This is a simple wrapper around our function that implements the
> >>> + * pci_driver.sriov_configure hook but also takes a required mutex.
> >>> + *
> >>> + * Return: 0 on success or a negative error code on failure.
> >>> + */
> >>> +int xe_pci_sriov_disable_vfs(struct pci_dev *pdev)
> >>> +{
> >>> +	int ret;
> >>> +
> >>> +	pci_lock_rescan_remove();
> >>> +	ret = xe_pci_sriov_configure(pdev, 0);
> >>> +	pci_unlock_rescan_remove();
> >>> +
> >>> +	return ret;
> >>> +}
> >>> +
> >> LGTM:
> >> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> >>
> > 
> > The lockdep reasons and the placement of the lock make sense to me.
> > 
> > I do have a question though, as I’m a little concerned about our driver
> > having to take a lock like pci_lock_rescan_remove...
> > 
> > Why is the xe_pci_sriov_disable_vfs call needed in pci_driver.remove?
> > In other words, why doesn’t the PCI core call pci_driver.sriov_configure
> > first?
> 
> dunno, but it does complain [1] when PF leaves VFs enabled
> 
> [1] https://elixir.bootlin.com/linux/v6.19.3/source/drivers/pci/iov.c#L1027
> 
> > 
> > I don’t see many examples of device drivers having to call
> > pci_lock_rescan_remove [1], which is why I’m asking. I’m wondering whether we
> > are missing an accepted flow for SR-IOV, and whether the need to take
> > pci_lock_rescan_remove just to silence lockdep is pointing to a larger
> > issue.
> 
> at first I was assuming that there is just a new expectation for the
> driver, but indeed it looks that we have a larger problem, as our CI
> also found that in slightly different scenario [2] this mutex is already
> taken by the PCI subsystem when calling the .remove callback:
> 
>  [ ]  Possible unsafe locking scenario:
>  [ ]        CPU0
>  [ ]        ----
>  [ ]   lock(pci_rescan_remove_lock);
>  [ ]   lock(pci_rescan_remove_lock);
>  [ ] 
>  *** DEADLOCK ***
> 
>  [ ] Call Trace:
>  [ ]  dump_stack_lvl+0x91/0xf0
>  [ ]  dump_stack+0x10/0x20
>  [ ]  print_deadlock_bug+0x23f/0x320
>  [ ]  __lock_acquire+0x146e/0x2790
>  [ ]  lock_acquire+0xc4/0x2f0
>  [ ]  __mutex_lock+0xb2/0x10e0
>  [ ]  mutex_lock_nested+0x1b/0x30
>  [ ]  pci_lock_rescan_remove+0x17/0x30
>  [ ]  xe_pci_sriov_disable_vfs+0x12/0x40 [xe]
>  [ ]  xe_pci_remove+0x7a/0x180 [xe]
>  [ ]  pci_device_remove+0x41/0xb0
>  [ ]  device_remove+0x43/0x80
>  [ ]  device_release_driver_internal+0x215/0x280
>  [ ]  device_release_driver+0x12/0x20
>  [ ]  pci_stop_bus_device+0x69/0x90
>  [ ]  pci_stop_and_remove_bus_device_locked+0x24/0x60
>  [ ]  remove_store+0x85/0xa0
>  [ ]  dev_attr_store+0x17/0x40
> 
> but it looks that this issue was already noticed and discussed [3]
> in the PCI level, so lets wait and see how this will be solved.
> 
> [2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162346v2/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html
> [3] https://lore.kernel.org/linux-pci/20260228120138.51197-4-ionut.nechita@windriver.com/
> 

+1. Generally taking PCI level (or core) locks in drivers is a big red
flag. Let's see how the above gets resolved.

Matt

> 
> > 
> > Matt
> > 
> > [1] https://elixir.bootlin.com/linux/v6.19.3/A/ident/pci_lock_rescan_remove
> > 
> >>
> >>>  /**
> >>>   * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
> >>>   * @pdev: the PF's &pci_dev
> >>> -- 
> >>> 2.47.1
> >>>
> >>
> >> -- 
> 
