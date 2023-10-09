Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFCCE95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 08:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4940010E228;
	Mon,  9 Oct 2023 08:38:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18AE10E228
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696840707; x=1728376707;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=kma9adNbILJ4//DOkmgAKmpYG/uI6olJd9MPvEn1luk=;
 b=O1C1XfJIUL+iN4K+NTyo3QUSupplLYL1enfwJEXjGqh4bgb7Hm8AG4Zc
 vtUR6vdl+BCv/jcmebFT5xeFczDMNNrCUjwf/Qum+1wE9f8zUKGJDbSd3
 vIw0tlL6Q43GL7X2c3hJLvsBC2QKXlBnGZcOFCQvzIsVeYV8t8SiHodP5
 gd0ri1viw/RHlIQlbFc/T7BL+cDubl6URQzP5Ds9NVyeecrVWtT3GZDBB
 4Rp5GauxWUNA4nQy/kNa9ZyWj8K0vo4tK8lnZsulkqZKglGqTmr8RzRyx
 oQG5/kKCDWPxlRhfq06B9cYWAneGe2DpOlfAKtmki4MJp/75of5b8gobi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="386942238"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
 d="scan'208,217";a="386942238"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 01:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="702812471"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
 d="scan'208,217";a="702812471"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 01:38:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 01:38:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 01:38:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 01:38:22 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 01:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxAf5YAbkry8DMtGGTlpkEY7cELUJ/ZD0+GHiqIIkw+gvmhCIqg99W5ytbqm0Yy/wJflb7slXO0+qyKRXmpM+q0Ox+LpFFbCag/IUObZ1Jj/H/dhW27frBNf2R+d0rFxoOnaaqz5QHP0CPdN/6vKX377M2MyhRbnQxjZ4vSeB3I7RqVff867o0MHurCK6wSQR698/k/8JzzOe4oy5Z0Mhe+FcgGMfwtxJyl386SoAI+l29ZZz2/FVXBI4lf7Oyg5JDCGgPUPhPa3TbuiaqzPV/hjICaYa3k1aMpOdoCw/hfCNvKAaUHyviUpfbrSTGDhNY6aKhM/QxNPt14udXSY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Kx9ezL+SAW/aAdcVGRX61OlN+bJG0eodQWR0mM11hg=;
 b=D07PvfQwGUUhg+KvCbHKreSbmfxXw9hUQB3wgGmhnh90aunTOKrK22/uh5KG6IDZaqvbQg1zBXvGky4HxiDt9HlSCQnI/LcL4SVJ2/RXHHL7M6Uv8hjCpFz5f1KddLDZAAsDJ9Xx6/vxuFKXmP5zjcASuUbFMuaa7822dsgLvHfTIcUdmHmp4BK7xpy4GigaaqzWxt1sxRO/zV06p9dNk/ds5Xe5VAbrjJxfeRpl21uF2nnkiAHsRh67NWSZwKLTB8HBXPYczTwSOMPlF+oQXudgxyEGrgbYNb9hVlLfXUdyji/3fiYJwXgiDJHk0t64F5BcNHJbctOBzlgHBn7AyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 08:38:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%6]) with mapi id 15.20.6838.033; Mon, 9 Oct 2023
 08:38:20 +0000
Content-Type: multipart/alternative;
 boundary="------------67Ca8tPSGwMzoGYLfd7Yp7wP"
Message-ID: <7c044a59-be46-4945-961e-1fb42dc28d6a@intel.com>
Date: Mon, 9 Oct 2023 14:08:10 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20231009062209.4009360-1-riana.tauro@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231009062209.4009360-1-riana.tauro@intel.com>
X-ClientProxiedBy: PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: e85aa4fb-1abc-45f2-bf8f-08dbc8a31736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHL+d1v4T3xF08gjUTXsVh3L2yRqcyBqVqfO91lWnZxSHGM+ItMkrpW10KGWg7kYu4eqbmqEbjInBvuZOisbM9ljVHB8ZqLMS4M6AZsysb2fVR1uTCyPM+pVmCX1/MzYyYO55QXk7Rtz4kV0cTJd3IginTN3Y0pAFNeqCLjWwlzLnmd6LQnr01T2HnK3jJsFVtwHrKTYMWW57qRX7UnATAYUV0ScdnY6ES1tW6AmJtmRC05Dtha5cKu2RiYj8cQIePU+jR1rwFgRa14EyY5sHOfyQSRxaLed+PWoFfAA/8KoH8Sg9lOQrgjsa9qKlWEzY3N1Msid7GhDM3ADQSGFLfZKoYKy6XZLFg6ISarBV7gRJVoCydQPbRr6gWgHkizh6U4jX4fXQwi9GEIzksxYy5iHD8Cj0KPpAcJfBrF4uOTJFmNi9gCGLJ1tiF5XpAFMQQPB+1zDv3rna9KZv0Ect4eiAHMyl261/CpwCYvpix7u/60I8HmONBTGXIHoJGI9R12vIh4rYsIdCViPeATUOG9BuV7DcGkgJDL9out4aaBX7rGnt5m+FEaVwpc6Tmy+4M21IwpYbYeKUY4udH0Xk/qpepdz6apz/504UbL4ex25AdwNK8vK23FUTEqYvH0u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31696002)(38100700002)(82960400001)(86362001)(36756003)(31686004)(2906002)(6512007)(6486002)(478600001)(966005)(41300700001)(8936002)(5660300002)(8676002)(6666004)(53546011)(6506007)(33964004)(83380400001)(2616005)(66556008)(66476007)(316002)(66946007)(6916009)(26005)(166002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2QrOGJVdng4Qm9laTZSU2FEY09WckJaNFkwYnpQOUdKZFBXaXlRd3Y1b2gy?=
 =?utf-8?B?MzdvL2tld3VUVVBpTEFpZ1djVURJakxhb1JTQkhTQ2dmeWV5enVHVDNQanlR?=
 =?utf-8?B?WmVrdjZ6Qzl0YkNmRnFybTRGdkxLVWlkTlNCY2Fkb0ZHMmoxTzNYVTBQcWdk?=
 =?utf-8?B?ODdKU3B1Yyt1MUtBQThIb3AzM1htUmVGRDN5UE1nVjNKaVgzRFBHYy9IUDJV?=
 =?utf-8?B?RUNxSDB6NkZZUGtyYkRlZ2NHQ0pwaTJjbFlBYTcvWHNyZFBFZG1DQjJvM3FR?=
 =?utf-8?B?N3NOQU9ZSit3dG45QkNNZHlqRFpkam5XVU9mOXJhK2FnTk4wNHp4N2twVDlr?=
 =?utf-8?B?R2xjYjRuaThEOWVtQXNnQUFIdE1ud1hxRk91d0x0Tkw3ZlFTUkZ4bGZBb09z?=
 =?utf-8?B?TzJhekJGYk1vNVNlMU9yZll6eHoxUGsxWDNhWXN2Uzk3cGNvVlliM1Jib3Q2?=
 =?utf-8?B?a3dYSzZhSVRVK3l3Rm5XTFk5clNCRHlkSzRJRFg2WGI0dVR0QU5waDNkNWNq?=
 =?utf-8?B?VGhEekkrZGxLNGZkeHdESlZNMmJZUTNFV2pYUHd0RitRWVF3VUJCdEVRamdr?=
 =?utf-8?B?R2ZWbE81K2c1aVhTdGI3L2NGS3BoazQzM3FSaysyZklPdnFiRWdmL1dxd1BQ?=
 =?utf-8?B?SGxNdmIzNFF2b2ZYVTB4TlZGc3FmSlN1UzFOcGF4Zmt5MnpBZ3hSNUx2MWt2?=
 =?utf-8?B?Q3hoSnNVdXpGTXhsTms2a2IvV1VNOEpmVGVnUndmOUdsSTY0R29keVNzT25h?=
 =?utf-8?B?NXQrNDRxMDlwT3o2c2ZTSnZueVVIRlFoR1FhUlBMYWtrZTdiTDlkUnlpcWd6?=
 =?utf-8?B?QW1mQVoxeDFqdXNKLzNkUy8zdFZEQ29WUkVnSWwvZ25ISVVnUjI0TEZFWkpX?=
 =?utf-8?B?bVZSZm85a28zT1hZbnZKL2o3QitDL2YwYlJKRmVSTWdtK1JzWWk0ZFN1NlVj?=
 =?utf-8?B?aEZleE1KaisvZytQelludkV0L1NWclJ2MUFJeTBqelJ4eWNKWm1iLzZkL05G?=
 =?utf-8?B?QUVTbGsrcWRPWEpMVk5SSGRDb2k2b2JLSTRUOVBkWlVYVDU3YU9BU0pVVnJL?=
 =?utf-8?B?SHhUa25EOFBMZTY5WU1BbWRvTkFqUjJGYjdKa1F0dmVWNmMwTkFRaGJRbjdE?=
 =?utf-8?B?YUFuU3FYd25ucFB5U2FraHdVenR0cjVPMVlHSnJ2bjd1MUFNNzg4L2tscld5?=
 =?utf-8?B?VXJWQ2hRRnA4MzE5UVJQbzBpTHpOdFQyc2pZazNraXBqck15YzF6ZEdDcTdP?=
 =?utf-8?B?dXZQTTdKUlkyT09YSEYzcEVNVWltcUxrWFdFSmc0akRDVnZ3VDdJZXZySVZt?=
 =?utf-8?B?VEFicUlPejZIVkY5QktES0hpNjNJS1k5ZjZnTlF2d1poR0QzbmRleDI2bkow?=
 =?utf-8?B?eGpBSkh6R0s3VlIxSFZyWGpKTXNyaHVvRkhwYkNaejNjbVppNHdoejNZK2E1?=
 =?utf-8?B?dFpmUjZrVUVVaUp6VlFHYWs1T1Rrdjk1MmNTc21rY2FKOU93N28xcm1FYm9j?=
 =?utf-8?B?TE1pMjRDN28yTzV4ZkVobktvQThQczVGdWhuUmp5UFlDR0R4TCs5WjhoU0pi?=
 =?utf-8?B?OHBvbktyQ2hJRmlwcFdlOStrcElhOHlQN0YyK3drdmxrcnZhc2lKMUtRVWpK?=
 =?utf-8?B?TGxNVlFEam1OSFZBR3p4VUFDNEh0L0N0S3BFYndyd0JBU0EvSEhtSEVlUGV3?=
 =?utf-8?B?M1ZQVk1XTDJocGpzSUJLQlQrS09WL0tZa1JkSks4ZmcyUkNMbVM0UXlWclVm?=
 =?utf-8?B?WExTUWduTzdRb3loWDlQTXZoZ3MwZ3RyYXl1SlRPZlQyNzNZTDl5bFFTUnpO?=
 =?utf-8?B?TUVxeGxhYkU4QlhpVXl5T3hUWm9Ld0JNTXByWGN2Sm04ekY1MUlTL05qaFh4?=
 =?utf-8?B?R3Z6dDUzMVd5MFY2aHEyd3NCc2djc3pUMnd6UVducTJPNUZkdzUwTWE5dFgz?=
 =?utf-8?B?MWhoMU9lS2ZxSEFYUmxnY3Z4b3c0NEVsdXZOSVRmSHVMWTh4Y2VVK3RFbXV3?=
 =?utf-8?B?dWJML3dWbmRla2RSNHdKSE1QSXFTaXZSeXRHVVA3M0plaUo2SmNLL2ZFeHBP?=
 =?utf-8?B?RXRmc3BEbnorTjUweFZxUHNRdW1uYWl6M1dkenFIYXp2OU05MDNXRnA4b2lY?=
 =?utf-8?B?OGg0cERjQ1BmYURmYmlUZkRPYWhiOWpVU1J5Sjcwb2RlMm1kMk5rUUExb0Fy?=
 =?utf-8?Q?+S0IgrT5u1i7TtpNtI4TxO4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e85aa4fb-1abc-45f2-bf8f-08dbc8a31736
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 08:38:20.0557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ve8F1Y7y8JhS8j5lPhXYtRrrnImlz72d1/srpJuPSt2Jai5QE19QfIWPK/IQzk4ZQlguQfEbPBLM+lsbKSVJTbue1T+nBSMsEGs2yh4Se64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
 gem_create_ioctl
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

--------------67Ca8tPSGwMzoGYLfd7Yp7wP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Riana,


On 09-10-2023 11:52, Riana Tauro wrote:
> gem_create_ioctl does not have a mem_access_get till it reaches
> xe_bo_move.
>
> When the device is runtime suspended (in D3cold), new bo created
> as part of gem_create_ioctl steals the buddy block of the kernel objects
> that are yet to be restored as part of runtime resume (D3cold). The runtime
> resume triggers only in xe_bo_move. While trying to restore the kernel
> objects it finds the buddy block is not free.
> Tries to evict the new bo which is already locked causing a deadlock
>
> Prevent deadlock by taking mem_access get early in the ioctl
>
> 	INFO: task kworker/1:1:44 blocked for more than 61 seconds.
> 	"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 	task:kworker/1:1     state:D stack:25272 pid:44 ppid:2  flags:0x00004000
> 	[  +0.008395] Workqueue: pm pm_runtime_work
> 	[  +0.004068] Call Trace:
> 	[  +0.002486]  <TASK>
> 	[  +0.002161]  __schedule+0x6f5/0x1640
> 	[  +0.003702]  ? __pfx___schedule+0x10/0x10
> 	[  +0.004133]  ? __ww_mutex_lock.constprop.0+0xf4f/0x1e60
> 	[  +0.005330]  schedule+0x92/0x120
> 	....
> 	[  +0.003922]  ttm_bo_mem_space+0x46d/0x490 [ttm]
> 	[  +0.004586]  xe_bo_restore_pinned+0x200/0x320 [xe]
> 	[  +0.005007]  ? __pfx_xe_bo_restore_pinned+0x10/0x10 [xe]
> 	[  +0.005503]  ? __pfx__printk+0x10/0x10
> 	[  +0.003791]  ? __pfx_do_raw_spin_lock+0x10/0x10
> 	[  +0.004597]  xe_bo_restore_kernel+0x2e4/0x470 [xe]
> 	[  +0.005521]  xe_pm_runtime_resume+0x20a/0x750 [xe]
> 	....
> 	INFO: task xe_mmap:1836 blocked for more than 61 seconds.
> 	"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 	task:xe_mmap   state:D stack:23600 pid:1836  ppid:1831 flags:0x00004002
> 	[  +0.008395] Call Trace:
> 	[  +0.002486]  <TASK>
> 	[  +0.003271]  rpm_resume+0x341/0xad0
> 	[  +0.005269]  __pm_runtime_resume+0x53/0xc0
> 	[  +0.004152]  xe_device_mem_access_get+0x2b/0x60 [xe]
> 	[  +0.005172]  xe_bo_move+0x2ef/0x9f0 [xe]
> 	[  +0.004131]  ttm_bo_handle_move_mem+0x15a/0x230 [ttm]
>
> Link:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
>
> Cc: Matthew Auld<matthew.auld@intel.com>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61789c0e88fb..e453a5264c82 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -630,6 +630,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	bool tt_has_data;
>   	bool needs_clear;
>   	int ret = 0;
> +	bool device_awake;
>   
>   	/* Bo creation path, moving to system or TT. No clearing required. */
>   	if (!old_mem && ttm) {
> @@ -712,7 +713,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	xe_tile_assert(tile, tile->migrate);
>   
>   	trace_xe_bo_move(bo);
> -	xe_device_mem_access_get(xe);
> +
> +	device_awake = xe_device_mem_access_get_if_ongoing(xe);

IIRC xe_bo_move is called in eviction path too. Won't it be safe to use 
xe_device_mem_access_get here too ?

BR

Himal

>   
>   	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>   		/*
> @@ -735,7 +737,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   
>   				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
>   					ret = -EINVAL;
> -					xe_device_mem_access_put(xe);
> +					if (device_awake)
> +						xe_device_mem_access_put(xe);
>   					goto out;
>   				}
>   
> @@ -753,7 +756,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   						bo, bo, old_mem, new_mem);
>   		if (IS_ERR(fence)) {
>   			ret = PTR_ERR(fence);
> -			xe_device_mem_access_put(xe);
> +			if (device_awake)
> +				xe_device_mem_access_put(xe);
>   			goto out;
>   		}
>   		if (!move_lacks_source) {
> @@ -778,10 +782,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		dma_fence_put(fence);
>   	}
>   
> -	xe_device_mem_access_put(xe);
> +	if (device_awake)
> +		xe_device_mem_access_put(xe);
>   	trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
>   
>   out:
> +
>   	return ret;
>   
>   }
> @@ -1810,13 +1816,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>   	}
>   
> +	xe_device_mem_access_get(xe);
>   	if (args->vm_id) {
>   		vm = xe_vm_lookup(xef, args->vm_id);
> -		if (XE_IOCTL_DBG(xe, !vm))
> +		if (XE_IOCTL_DBG(xe, !vm)) {
> +			xe_device_mem_access_put(xe);
>   			return -ENOENT;
> +		}
>   		err = xe_vm_lock(vm, true);
>   		if (err) {
>   			xe_vm_put(vm);
> +			xe_device_mem_access_put(xe);
>   			return err;
>   		}
>   	}
> @@ -1845,6 +1855,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		xe_vm_unlock(vm);
>   		xe_vm_put(vm);
>   	}
> +
> +	xe_device_mem_access_put(xe);
>   	return err;
>   }
>   
--------------67Ca8tPSGwMzoGYLfd7Yp7wP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-10-2023 11:52, Riana Tauro wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231009062209.4009360-1-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">gem_create_ioctl does not have a mem_access_get till it reaches
xe_bo_move.

When the device is runtime suspended (in D3cold), new bo created
as part of gem_create_ioctl steals the buddy block of the kernel objects
that are yet to be restored as part of runtime resume (D3cold). The runtime
resume triggers only in xe_bo_move. While trying to restore the kernel
objects it finds the buddy block is not free.
Tries to evict the new bo which is already locked causing a deadlock

Prevent deadlock by taking mem_access get early in the ioctl

	INFO: task kworker/1:1:44 blocked for more than 61 seconds.
	&quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
	task:kworker/1:1     state:D stack:25272 pid:44 ppid:2  flags:0x00004000
	[  +0.008395] Workqueue: pm pm_runtime_work
	[  +0.004068] Call Trace:
	[  +0.002486]  &lt;TASK&gt;
	[  +0.002161]  __schedule+0x6f5/0x1640
	[  +0.003702]  ? __pfx___schedule+0x10/0x10
	[  +0.004133]  ? __ww_mutex_lock.constprop.0+0xf4f/0x1e60
	[  +0.005330]  schedule+0x92/0x120
	....
	[  +0.003922]  ttm_bo_mem_space+0x46d/0x490 [ttm]
	[  +0.004586]  xe_bo_restore_pinned+0x200/0x320 [xe]
	[  +0.005007]  ? __pfx_xe_bo_restore_pinned+0x10/0x10 [xe]
	[  +0.005503]  ? __pfx__printk+0x10/0x10
	[  +0.003791]  ? __pfx_do_raw_spin_lock+0x10/0x10
	[  +0.004597]  xe_bo_restore_kernel+0x2e4/0x470 [xe]
	[  +0.005521]  xe_pm_runtime_resume+0x20a/0x750 [xe]
	....
	INFO: task xe_mmap:1836 blocked for more than 61 seconds.
	&quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
	task:xe_mmap   state:D stack:23600 pid:1836  ppid:1831 flags:0x00004002
	[  +0.008395] Call Trace:
	[  +0.002486]  &lt;TASK&gt;
	[  +0.003271]  rpm_resume+0x341/0xad0
	[  +0.005269]  __pm_runtime_resume+0x53/0xc0
	[  +0.004152]  xe_device_mem_access_get+0x2b/0x60 [xe]
	[  +0.005172]  xe_bo_move+0x2ef/0x9f0 [xe]
	[  +0.004131]  ttm_bo_handle_move_mem+0x15a/0x230 [ttm]

Link: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256</a>

Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..e453a5264c82 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -630,6 +630,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool tt_has_data;
 	bool needs_clear;
 	int ret = 0;
+	bool device_awake;
 
 	/* Bo creation path, moving to system or TT. No clearing required. */
 	if (!old_mem &amp;&amp; ttm) {
@@ -712,7 +713,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	xe_tile_assert(tile, tile-&gt;migrate);
 
 	trace_xe_bo_move(bo);
-	xe_device_mem_access_get(xe);
+
+	device_awake = xe_device_mem_access_get_if_ongoing(xe);</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">IIRC xe_bo_move is called  in eviction path too. </span>Won't
      it be safe to use&nbsp; <span style="white-space: pre-wrap">xe_device_mem_access_get here too ? </span></p>
    <p><span style="white-space: pre-wrap">BR</span></p>
    <p><span style="white-space: pre-wrap">Himal 
</span></p>
    <p><span style="white-space: pre-wrap"></span></p>
    <blockquote type="cite" cite="mid:20231009062209.4009360-1-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	if (xe_bo_is_pinned(bo) &amp;&amp; !xe_bo_is_user(bo)) {
 		/*
@@ -735,7 +737,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem-&gt;start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
+					if (device_awake)
+						xe_device_mem_access_put(xe);
 					goto out;
 				}
 
@@ -753,7 +756,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						bo, bo, old_mem, new_mem);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
+			if (device_awake)
+				xe_device_mem_access_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -778,10 +782,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
+	if (device_awake)
+		xe_device_mem_access_put(xe);
 	trace_printk(&quot;new_mem-&gt;mem_type=%d\n&quot;, new_mem-&gt;mem_type);
 
 out:
+
 	return ret;
 
 }
@@ -1810,13 +1816,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
 	}
 
+	xe_device_mem_access_get(xe);
 	if (args-&gt;vm_id) {
 		vm = xe_vm_lookup(xef, args-&gt;vm_id);
-		if (XE_IOCTL_DBG(xe, !vm))
+		if (XE_IOCTL_DBG(xe, !vm)) {
+			xe_device_mem_access_put(xe);
 			return -ENOENT;
+		}
 		err = xe_vm_lock(vm, true);
 		if (err) {
 			xe_vm_put(vm);
+			xe_device_mem_access_put(xe);
 			return err;
 		}
 	}
@@ -1845,6 +1855,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		xe_vm_unlock(vm);
 		xe_vm_put(vm);
 	}
+
+	xe_device_mem_access_put(xe);
 	return err;
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------67Ca8tPSGwMzoGYLfd7Yp7wP--
