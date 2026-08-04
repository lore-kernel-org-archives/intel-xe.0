Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99000C5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 17:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CAC10E094;
	Tue,  4 Aug 2026 17:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBu5wX6S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBAD10E094
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785865994; x=1817401994;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GKn3/EAt6b3SgbpuOYSlDEtCp3Bceeo63y9pv07mdqQ=;
 b=dBu5wX6SoZX0rLFIKoiouAo1TRXKGix1Ev69COMasWD4wRAbUX7I4XGv
 J0g/9IDITU5W7e5aVM2nb9wP/I2Q46cQ5qKXuLTmdcs9Ywm622Tut+sgL
 NPjZP9/Hhr8mA6oLQzG8heD0sGZtXSIvW6nLDxVEkL6QqvlmPwGU9yR9W
 1Gi6bS8NT3T00/hZBi9DJOWK8bxIhyYhkbfTvZ2b40+D9r6hqVmpPAOFi
 4tkf9X41IBGYxaEL4ttNeRhlRi43lew+stKCeABFSeInavH8m5m19/FLA
 3TYU44BFoLw2JH7HuoS4ipxGsgmGWLtgs5y1d04M1ueXded4ZVpBf7R7W g==;
X-CSE-ConnectionGUID: hYWIUf6jShSdCJZjRUBfow==
X-CSE-MsgGUID: rXK8EAhiQgi1yJmlQWu+qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90100720"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="90100720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 10:53:13 -0700
X-CSE-ConnectionGUID: 39/T3Cs2RGeC08ulFXwDgA==
X-CSE-MsgGUID: EVPlA3AzTI+aWpNBVjF/jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="291513276"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 10:53:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 10:53:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 10:53:12 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 10:53:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Og/n51/sbfBoIAytit3HoSZORuKSiyVZXBjlp351P3kY1qhHBqPr73UTTeooA2H3AT4njaRIQR8Ui/d25X7F/xwmmAOgheAFavX69NUQbMId/A9lSUQiKRB29LU8/i3qhPE+i/UcmHgqMBIPKmNwYdtKXtRiHrwrq6euvAMRpZuNvpCLTUr/86S0C9++7EYjpKW4E5dO/6g6/9U7yvxiIekpky7cyfjuOxLa5L0oMZJvjUR7MSVsS/q/4PtXF5r+iu7qVrrO3kCZimfw1WnO6I8/HXgP/KE2jArJKk89BjYq780vmpPKOjLPp9liasG+OwcfLD1UOf2+8MrotREG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKdV1CHCRyD37SO9M+F0+WfsnWxNUOgN84me+orqaHc=;
 b=uug79QdYL7u2Mb6+HPxMVrUDKIHWjS+tAOV/sj4DJMi6Rd12F0pEhFIYPs2+gPji0kRCZA3RsYOVdlWupXdbNKoNxo+/g/7cr0rWXjvG7BoqZno1N+GT4Ws44bXo9Pf+jMjZb1NQlNgaj0JzVxQfTPrE/XfpNplwf76SIl+iyPe//JP5w5ktxFPbVh3RMtFTVxdkQ9EneMqPcXzQKnaGnoz9cCIWmZl2Xowjaop9uOHvVi9USIFxHQd58U6xd03xejvgEMcttknE0D1VgCrT34d9ECHHMPj0G4vlnCdkHLXsdtgLUwL8JpxFubRiJxY8v90hVbmGb9HdsC0gZzAJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7849.namprd11.prod.outlook.com (2603:10b6:8:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 17:53:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 17:53:08 +0000
Date: Tue, 4 Aug 2026 10:53:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 11/12] drm/xe: batch CT pagefault acks with periodic
 flush
Message-ID: <anInAToBOCjkTPxS@gsse-cloud1.jf.intel.com>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-12-matthew.brost@intel.com>
 <anHhTWNh1SYSBo1R@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anHhTWNh1SYSBo1R@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:303:dc::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 15717941-65ed-4057-6548-08def2513e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|5023799004|11063799006|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FneNpnFtZKh5ZUc34sU3IBqw+Z796ADjky0d18/nIeDgaTEaAeq8N7vnY1y1bRhdplERYeLj2rGVhYckbrbVockJL7v09hrJzY5x4KYKOkhl5EecYG48ZVB63CSYe0sKSxIqMqKbUD+LVnHPwrcGNI66Bc9q6saCO7KYHzWZKjBown1WjeNQEGKJO0ibGzJ8NLkgWQggnotibvv8ssQ+FQud8GavuMAhTk/2xRIhIgmbnZ6swWajBRN+m4PS8buFBweZmcljW1TD6t9FKYdpkq8siTjEoyqT8SWiU3yYr+pkimZH9K7GC9yqyJK+TTKuHSX21pgplyO4K1FuoPGn6250zc32yB0YAu0vEW2b9mbgw3ViEuyI0h2qPNAaJRSshKp1RiMQnfzIViSa37Yv/X3eBmc4YNxHYyEnsThL3jmN7s5z+41JieMH2ek91b10DiKxXZ8xU6uOqgho8D+V7W8fs9Q4h4lx2EQWTYPPN3oHdfEduT0cFOBLfrcI0XGryI1AlP2edDzvdgXviJtH8gL87KFv/OzAxFXl7DNMlAY/rN0MkH3tGMWulUwdJRrO77O5aJpPELPLpGIE5xKrdRsUpEdGAIH7sk1SNHQVnomnV+2rJ5dFkeaFq/fHCmUemycNv4osZsCRQYQwDgXOCgFcSJ+TFfN/JByiJ4pCb60=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hydmJCOEFjOTVsd1FHSmtoWEtlem12UXNwc1RIQVFsWDFWd2gwS1g1dkl2?=
 =?utf-8?B?V0RTZXBIMk1lUUR5QmJqWGdjQTg3VjFRenFDeUIrNmdxVytKQXdFa3I5cERD?=
 =?utf-8?B?NDBRTzJRYWNDUEY5OFk1eFBRWEh2c0VZUU9FQ00vUnVGTDRuVUlnUDZ6VWpw?=
 =?utf-8?B?VUFNMlM1eFFQVGcrQVJiL1hDWURZanZFOVYxZ1pVRlVSQmhyaWIrN3RpVGcx?=
 =?utf-8?B?dWRKbWoxVWZUNjBQaVFZVXZNYTVyemVjN2ZickhRWWpaRHhhczZnd3pCNkV5?=
 =?utf-8?B?NzBiK29ObDdsTU9DVGVXTG1wOEw1UzJlSzk3d3Erdm1OSnZXdHgzSUFEcjB2?=
 =?utf-8?B?N1NHRnpremhkWXBqd2w2ZHp3UU9mMi8zdjh0VlYwcUtSalNqbG9GdGNNSGlq?=
 =?utf-8?B?dlZmRjJLdG0zaFZGcjFvdkViRVFhMWF5cTNPNTN4K3lPaGFRbldETkVZYlZj?=
 =?utf-8?B?d3NKQkN3d2RETjZGU0grdnZJN1YxMmhvZTdyMmJ2bnl2TmtwNUNoLzhqS0dY?=
 =?utf-8?B?SGFwTFFMMHVKR0k3TkFBQU1VYzMwMGFEaitnQ1kvZWdLejBvZmJneWR6Rjd4?=
 =?utf-8?B?aDloTlJ3Q3FGZ2ZGR1prQUJsRjdLc2h3SEg5QXZZeU1hY3BqRUNvSU95WXZ2?=
 =?utf-8?B?dHNqZXRSclBTeFg2b2VwN2lWUE1oSXV1MU1FOEVPWEtSaU9IWi9sa0FhTzlw?=
 =?utf-8?B?eG42V3V2NzR3VjB4N3ptTUEwVmswb0g0VTQybGxZb3NBRDkzNHFtNEl6eExn?=
 =?utf-8?B?dFlvdXlsblBxeG05Q2RtNVlsVWc2cFZySEFMaHl4MHBnVmJNU0IyWEpKd05a?=
 =?utf-8?B?NTBxQ0NWRUlxd2pDS0J0K0Rxamh6dWlxK0VqdjAzQjNFS2JEU29JVzlwMjZp?=
 =?utf-8?B?dUZyZXZrRFlZS0I4M3ZWbnI2ZWJFMnQ1MkwwTUVQMlR3RjVMRVljM3NWRW5a?=
 =?utf-8?B?U3VVbE5YOG1Mb0hiY3NNTW44ZjcwVzBEbmhta3Q3OUFtR2VpVUZyT3J3ZVFQ?=
 =?utf-8?B?SFE0QXRyRlB2R2hSR29ySFo2SjVoTmExa1ZuUTFqa1I4U0tLWnM0T0g0VERn?=
 =?utf-8?B?djdEUkh6UDlHbG92eVIwM2J4ejBYOUR3Y2xXUmlrRXRTSDBvSTBiWHVKaUJh?=
 =?utf-8?B?Z3lEZ212S1F0Y1p2ZEZiSlM5cnlCWVNEQU43NTdabElrOUpUdDlicms0QWo1?=
 =?utf-8?B?clRucHJ0N1IyWFdhT2NwYjZDTWpnUGs0aUtHQXorRWpZR3dIZ3NDL3AxMnJv?=
 =?utf-8?B?UVF2VHBGRTRMNHdDZkNRd296dFNLVlo3WjNqRy9DZ1RYR2h4NkFDYllwa2l2?=
 =?utf-8?B?RWxpMEVRazZQZ3dTK3d3b3p2L3RKOVhXZUtPVURCMGVhaVhnZStGUVZmOVNw?=
 =?utf-8?B?eVNaeEJ0SmZrcmNkY0FxbHhjY21lVURaUWZFV2RSSVQxcmx3eHlxNmJ1N2hE?=
 =?utf-8?B?K2s1VFJ5Y0JJbzBma0VuZW5UVVlpMm5jZGdQYytPdmdHcXJic0YwbGhtZHNt?=
 =?utf-8?B?Z0E3dE9mUTRGN05VR1hsQlFmd1JtRlFLN1d2QUZiWUVsTWU1V3RBenRIZTd3?=
 =?utf-8?B?bm0vM1JTSzRsc1NaalBMTEJJSFFYa2RiRndxVy9MM2RJdC9rMm1CdkU1M28z?=
 =?utf-8?B?R2l0OGM2RmhsN3RRakdaSUdYYW9LNFRyc2h0Vm5FcFFhOE5oNVc1S2t6RW93?=
 =?utf-8?B?MW94bDEvQkhPSjhhcnBFWDNjRzJJQjRuQ2p3bG1hVmh2MGYrRlQ0ek1RQnIy?=
 =?utf-8?B?UTZJY0VqUSs3VjJXa0FKK1NmL3ZldGtKQ0xyT0QyTHJBMG5YUEsvdklobEVx?=
 =?utf-8?B?YzB6V21aTUVuTkFIdEsxMHRnNHZOTzlzYTlKd0k0U1Y4d004ZEtCQzdEYk1a?=
 =?utf-8?B?UHdweDlrOXFaV2pTbUJ6YnFiYVp1ZzFrSjJEZXBMcEhNcit5R3daVXRzYWsy?=
 =?utf-8?B?UXpkRC9NZEIzWGVQQ3J6T2MzbXRTRWNaSWpIM2VpOFZGOFJ1L2c4Q1I4ZW9Q?=
 =?utf-8?B?eTV5cnlYd1ljVU5KeVEvSkpIWUZLckxUSHVoUzhaclJ2VWMvRzUvU2xuQURl?=
 =?utf-8?B?azZjUmNuRlJLNkQwQnhGVmR6TlBvY3dWL0pjVEJSTDZ3ZGVDZzJ2cHBwSkdR?=
 =?utf-8?B?K24xNEJkeXdDSzczRW0xVXpMdVEybUtwTXVDTG05VVNYd2IxT1VkSnhFemdR?=
 =?utf-8?B?RUNyWkJmNC9BNlRNNHpOWi9OWWZHb0hVUDlFTytVLysyUm1sdUdMNCtDbUxl?=
 =?utf-8?B?R1ptS2RpZ3NBOGJwU00xalFwRXc2RkxhT3NVVGtMV01QSWpLSVhtYk1XT3BU?=
 =?utf-8?B?eFh6V2pENi80akhjMGY1aWw1T3lZaUV0ZmtaamMrenNET2Vlc29NZz09?=
X-Exchange-RoutingPolicyChecked: GhncO4t9SybRaMMdzA7QXkIW8dLlhsbP/g9tbSLhXh1SxZHMoy66shrimgOSxAHwby7y+Z0lfwhMBYWK1UbhJmO41l6UffcVewWyeheRytA2RRk/a9EGawdnipL9lWuVeIub16YgyekW0CwJxH63+5Uu/tVHzDZj6f1qKnNA4YGpli/le2EBiDOPJRYvSY9YrV11hvrUgoI8r3SnHca6pgdLNQQk5OCE+kWb24oOJxyuVXzfzYTa1dDBg+Gr57KPZ4OivGay1Du92MJ0d/YwQB0kXZv5Y0dXWg40yHQRgCDGjrE9TO8ycfYV0s2j06ZyHVUNtW0F6HQt5nqLYvLcWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 15717941-65ed-4057-6548-08def2513e35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 17:53:08.5984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBQGrmE+68h2UqKbRShl1VdE+4TjEnGY9JunlE4Nk3kmDXxvfVrT5V++glYoPpLY+oOpyk8XqKFBp1nWEAs2pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7849
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

On Tue, Aug 04, 2026 at 02:55:41PM +0200, Francois Dugast wrote:
> LGTM, just a couple of nits below.
> 
> On Fri, Jul 24, 2026 at 04:26:00PM -0700, Matthew Brost wrote:
> > Pagefault storms can generate long chains of acknowledgments back to the
> > GuC. Sending each ack as a full CT submission forces a barrier,
> > descriptor update and doorbell per fault.
> > 
> > Extend xe_guc_ct_send_locked() with a “write-only” mode that copies the
> 
> Wondering if calling the argument "defer_flush" instead of "write_only" would
> be a better fit, and also hint the caller to call xe_guc_ct_send_flush().
> 
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
> > Assisted-by: ChatGPT:gpt-5 # Documentation
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c          | 95 +++++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_guc_ct.h          | 36 +++++++++-
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 32 ++++++++-
> >  drivers/gpu/drm/xe/xe_guc_types.h       |  6 ++
> >  drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++-
> >  drivers/gpu/drm/xe/xe_pagefault_types.h | 14 ++++
> >  6 files changed, 170 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index fe70c0fd85c5..686611ddabc8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -265,7 +265,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> >  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> >  #define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > -#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > +#define CTB_H2G_BUFFER_SIZE	(SZ_16K)
> >  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
> >  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> >  #define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
> > @@ -939,7 +939,7 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> >  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
> >  
> >  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > -		     u32 ct_fence_value, bool want_response)
> > +		     u32 ct_fence_value, bool want_response, bool write_only)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	struct xe_gt *gt = ct_to_gt(ct);
> > @@ -956,7 +956,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
> >  
> >  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > -		u32 desc_tail = desc_read(xe, h2g, tail);
> >  		u32 desc_head = desc_read(xe, h2g, head);
> >  		u32 desc_status;
> >  
> > @@ -966,12 +965,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  			goto corrupted;
> >  		}
> >  
> > -		if (tail != desc_tail) {
> > -			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> > -			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
> > -			goto corrupted;
> > -		}
> 
> Could we keep that check when !write_only?
> 

Not without a bigger change. Consider write_only followed by
!write_only, the tail != desc_tail immediately mismatches.

We'd have to add 3 states:

- Normal (check)
- Defer flush (no check)
- Issue flush (no check)

Not sure if it is worth the complexity, but change add if this if you
want.

> > -
> >  		if (tail > h2g->info.size) {
> >  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> >  			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> > @@ -993,7 +986,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  			      (h2g->info.size - tail) * sizeof(u32));
> >  		h2g_reserve_space(ct, (h2g->info.size - tail));
> >  		h2g->info.tail = 0;
> > -		desc_write(xe, h2g, tail, h2g->info.tail);
> > +		if (!write_only) {
> > +			xe_device_wmb(xe);
> > +			desc_write(xe, h2g, tail, h2g->info.tail);
> > +		}
> >  
> >  		return -EAGAIN;
> >  	}
> > @@ -1024,14 +1020,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  	/* Write H2G ensuring visible before descriptor update */
> >  	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
> >  	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> > -	xe_device_wmb(xe);
> > -
> >  	/* Update local copies */
> >  	h2g->info.tail = (tail + full_len) % h2g->info.size;
> >  	h2g_reserve_space(ct, full_len);
> >  
> >  	/* Update descriptor */
> > -	desc_write(xe, h2g, tail, h2g->info.tail);
> > +	if (!write_only) {
> > +		xe_device_wmb(xe);
> > +		desc_write(xe, h2g, tail, h2g->info.tail);
> > +	}
> >  
> >  	/*
> >  	 * desc_read() performs an VRAM read which serializes the CPU and drains
> > @@ -1052,7 +1049,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  
> >  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  				u32 len, u32 g2h_len, u32 num_g2h,
> > -				struct g2h_fence *g2h_fence)
> > +				struct g2h_fence *g2h_fence, bool write_only)
> >  {
> >  	struct xe_gt *gt = ct_to_gt(ct);
> >  	u16 seqno;
> > @@ -1112,7 +1109,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  	if (unlikely(ret))
> >  		goto out_unlock;
> >  
> > -	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
> > +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence, write_only);
> >  	if (unlikely(ret)) {
> >  		if (ret == -EAGAIN)
> >  			goto retry;
> > @@ -1120,7 +1117,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  	}
> >  
> >  	__g2h_reserve_space(ct, g2h_len, num_g2h);
> > -	xe_guc_notify(ct_to_guc(ct));
> > +	if (!write_only)
> > +		xe_guc_notify(ct_to_guc(ct));
> >  out_unlock:
> >  	if (g2h_len)
> >  		spin_unlock_irq(&ct->fast_lock);
> > @@ -1196,7 +1194,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
> >  
> >  static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  			      u32 g2h_len, u32 num_g2h,
> > -			      struct g2h_fence *g2h_fence)
> > +			      struct g2h_fence *g2h_fence, bool write_only)
> >  {
> >  	struct xe_gt *gt = ct_to_gt(ct);
> >  	unsigned int sleep_period_ms = 1;
> > @@ -1209,9 +1207,10 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  
> >  try_again:
> >  	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> > -				   g2h_fence);
> > +				   g2h_fence, write_only);
> >  
> >  	if (unlikely(ret == -EBUSY)) {
> > +		xe_guc_ct_send_flush(ct);
> >  		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
> >  						&sleep_period_ms, &sleep_total_ms))
> >  			goto broken;
> > @@ -1235,7 +1234,8 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
> >  
> >  	mutex_lock(&ct->lock);
> > -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> > +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence,
> > +				 false);
> >  	mutex_unlock(&ct->lock);
> >  
> >  	return ret;
> > @@ -1283,25 +1283,76 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  	return ret;
> >  }
> >  
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
> >  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > -			  u32 g2h_len, u32 num_g2h)
> > +			  bool write_only)
> >  {
> >  	int ret;
> >  
> > -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL);
> > +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, write_only);
> >  	if (ret == -EDEADLK)
> >  		kick_reset(ct);
> >  
> >  	return ret;
> >  }
> >  
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
> >  int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
> >  {
> >  	int ret;
> >  
> >  	lockdep_assert_held(&ct->lock);
> >  
> > -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL);
> > +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, false);
> >  	if (ret == -EDEADLK)
> >  		kick_reset(ct);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 767365a33dee..b30c1f34be39 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -54,7 +54,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> >  int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  		   u32 g2h_len, u32 num_g2h);
> >  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > -			  u32 g2h_len, u32 num_g2h);
> > +			  bool write_only);
> >  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  			u32 *response_buffer);
> >  static inline int
> > @@ -63,6 +63,8 @@ xe_guc_ct_send_block(struct xe_guc_ct *ct, const u32 *action, u32 len)
> >  	return xe_guc_ct_send_recv(ct, action, len, NULL);
> >  }
> >  
> > +void xe_guc_ct_send_flush(struct xe_guc_ct *ct);
> > +
> >  /* This is only version of the send CT you can call from a G2H handler */
> >  int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action,
> >  			       u32 len);
> > @@ -87,4 +89,36 @@ static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
> >  	wake_up_all(&ct->wq);
> >  }
> >  
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
> 
> Now it would be cleaner to add "#include <linux/mutex.h>" in xe_guc_ct.h.
> 

Sure.

Matt

> Francois
> 
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
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > index 2470faf3d5d8..8f8210a732e9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -10,6 +10,22 @@
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> >  
> > +#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
> > +
> > +static void guc_ack_fault_begin(void *private)
> > +{
> > +	struct xe_guc *guc = private;
> > +
> > +	xe_guc_ct_lock(&guc->ct);
> > +
> > +	BUILD_BUG_ON(((XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1) &
> > +		     XE_GUC_PAGEFAULT_FLUSH_PERIOD) != 0);
> > +
> > +	/* Ack the 2nd, then 18th, etc... */
> > +	guc->pagefault_ack_counter =
> > +		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1;
> > +}
> > +
> >  static void guc_ack_fault(struct xe_pagefault *pf, int err)
> >  {
> >  	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> > @@ -36,12 +52,26 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
> >  		FIELD_PREP(PFR_PDATA, pdata),
> >  	};
> >  	struct xe_guc *guc = pf->producer.private;
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
> >  
> > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > +	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
> > +		xe_guc_ct_send_flush(&guc->ct);
> > +	xe_guc_ct_unlock(&guc->ct);
> >  }
> >  
> >  static const struct xe_pagefault_ops guc_pagefault_ops = {
> > +	.ack_fault_begin = guc_ack_fault_begin,
> >  	.ack_fault = guc_ack_fault,
> > +	.ack_fault_end = guc_ack_fault_end,
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > index 31a2acb63ac3..3dbcb1331690 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > @@ -122,6 +122,12 @@ struct xe_guc {
> >  	struct xe_reg notify_reg;
> >  	/** @params: Control params for fw initialization */
> >  	u32 params[GUC_CTL_MAX_DWORDS];
> > +
> > +	/**
> > +	 * @pagefault_ack_counter: Counter to determine when periodically ack
> > +	 * pagefaults in a batch.
> > +	 */
> > +	u32 pagefault_ack_counter;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index caa39a024ae6..917884c49e1d 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -412,6 +412,10 @@ static bool xe_pagefault_try_chain(struct xe_pagefault_queue *pf_queue,
> >  			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
> >  				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> >  
> > +			if (pf->producer.private !=
> > +			    pf_work->cache.pf->producer.private)
> > +				continue;
> > +
> >  			xe_gt_stats_incr(pf->gt,
> >  					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
> >  					 1);
> > @@ -585,6 +589,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> >  
> >  	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
> > +		const struct xe_pagefault_ops *ops = pf->producer.ops;
> > +		void *private = pf->producer.private;
> >  		struct xe_gt *gt = pf->gt;
> >  		u32 asid = pf->consumer.asid;
> >  		int err = 0;
> > @@ -622,11 +628,14 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> >  		xe_assert(xe, pf == pf_work->cache.pf);
> >  
> > +		ops->ack_fault_begin(private);
> >  		while (pf) {
> >  			xe_assert(xe, pf->consumer.alloc_state ==
> >  				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > +			xe_assert(xe, ops == pf->producer.ops);
> > +			xe_assert(xe, gt == pf->gt);
> >  
> > -			pf->producer.ops->ack_fault(pf, err);
> > +			ops->ack_fault(pf, err);
> >  
> >  			spin_lock_irq(&pf_queue->lock);
> >  
> > @@ -654,6 +663,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  					XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
> >  			spin_unlock_irq(&pf_queue->lock);
> >  		}
> > +		ops->ack_fault_end(private);
> >  
> >  		if (time_after(jiffies, threshold)) {
> >  			queue_work(xe->usm.pagefault_wq, w);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > index a1fff0e47fa5..efeba5c3a58b 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -33,6 +33,13 @@ enum xe_pagefault_type {
> >  
> >  /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> >  struct xe_pagefault_ops {
> > +	/**
> > +	 * @ack_fault_begin: Ack fault begin
> > +	 * @private: producer private data
> > +	 *
> > +	 * Page fault producer begins acknowledgment from the consumer.
> > +	 */
> > +	void (*ack_fault_begin)(void *private);
> >  	/**
> >  	 * @ack_fault: Ack fault
> >  	 * @pf: Page fault
> > @@ -42,6 +49,13 @@ struct xe_pagefault_ops {
> >  	 * sends the result to the HW/FW interface.
> >  	 */
> >  	void (*ack_fault)(struct xe_pagefault *pf, int err);
> > +	/**
> > +	 * @ack_fault_end: Ack fault end
> > +	 * @private: producer private data
> > +	 *
> > +	 * Page fault producer ends acknowledgment from the consumer.
> > +	 */
> > +	void (*ack_fault_end)(void *private);
> >  };
> >  
> >  /**
> > -- 
> > 2.34.1
> > 
