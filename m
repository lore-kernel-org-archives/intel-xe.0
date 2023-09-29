Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53696E743EC
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E0710E0E0;
	Fri, 29 Sep 2023 06:05:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBF710E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 06:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695967540; x=1727503540;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ybjgyVMrIvkgfFxbzcTzXZBUwTNiPutWbHt62WUlUCs=;
 b=jvaSWQVUtkP4IAjPSv6M39f5YEj2LcSsx9zgQQ+67KsYkAmMDKQ5nFuT
 FOS1u6DLsW373lGSyvRBLx67svzrEtx17Vynp1BSlseTtDq5+lN1JQzhM
 D2VtpfxxlGbAVHJcHjncZQEv/k/UfYTc7F4kPaJPxJUVKh3pOCSgyYNxf
 X0cz0aUjjYHW1X6lMIdibOwyI7OxJ1HBPN7ZdwINxAaS+kJmDq+Mt1cg6
 ViFvwL6LwoRXGGiVnOEhnVef+jQ6oCm44C2z0yin04GjXxuCeiDaahGiv
 ZkvfkSQ/knUHAt6T8/FhD7aXIUTc1GVh2Xpu/78Gje4eJ90B8nUerF1Ri g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446400712"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="446400712"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 23:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753272613"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="753272613"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 23:05:39 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 23:05:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 23:05:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 23:05:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL24qt+BpEyHIbPIISm2SHCZUdRHXIf7edUJ4fkbwnje9llibzY3Ohq5F4UNQqEgF4M3FDINNUSeNdyAoTaykJz4hCLme9/V21yxL28iswe3k3Sm3QyRYFw6/kAqai8TM4OQBvP/VQ9iYqlsEyNdChIow9E6EXRhLISTKQ/MlNMUD+LmliHofI/tfeYj0vbt7jY2o39XLKSas0HmX5PZR/dDuz01xOsOtSZYLbrma0PW/NMD2KLD9AALgKSs6vj4f/FGg1U7DDo0Ccs5/I+INmw3o2vO+c0oFsqa5mf7shT/7Sr3DYE1len52k98HngL5iBFfkT0b15MsMAxYFLDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOn6cJVucJ3rm5dRdCM70dFQjkP1Fw8tS2NMP8p3ay4=;
 b=oaczDqzI02xseZNnWsZZceU1DN2SkcstrnJnFDYTeGHPhZgXZ40g1ysgrTtYWMLp5I4z6QeYaZ+gaY/8n3LOddkph3HSXghcmnIZuiGUQ7jvsO/SqhiE7wFpD/3PpfkYvDHyAbOWWMBVe9TJOCT/OckTDQIvFZMSrxon3yylQ/X9FbCac35gAEQSUR+SR2RQ1VoqMcU9IbLPPBq1IRdoqhK/mEOjvYhOMhKB1bgjOCQ1953lvbYcOAu1l+lo+lay1FvHpm+yq+N/IrIlvSu2g2A+vXHauQOo1x8UFpbDqtEItGgpfN/iTBwp2zXiiwvTl+S1Owcy3ivKREQWD/6vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4601.namprd11.prod.outlook.com (2603:10b6:303:59::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 06:05:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 06:05:33 +0000
Date: Fri, 29 Sep 2023 01:05:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <6rzczchhfiskvcqmcimdckyx5ohcymgxw2mormtzlav7waar25@7s2n4axxtgl7>
References: <20230928044335.1474903-1-fei.yang@intel.com>
 <20230928044335.1474903-2-fei.yang@intel.com>
 <20230928181134.GJ2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230928181134.GJ2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4601:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdd761f-ff81-464c-5000-08dbc0b2177e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rm5GNIkE0lREC21z2EgCYrdQn1fj5/pgVVklkARTzCo3b3HdjmKwijQPcCaLscVyoVm7Q5p5JGOYl2L6UnQUlg1ZDhfX7sVZrwc7c+NwuHt+5LRBwMo5tdRY4krs0+gKomGv5d3V684gKbxT2/IRTtmgAoZ1b3hMrHi0VYDqMgBeRtogncALSZRutdfJTV2fkWbTGVuwMs/OEdMa9OZoQCeU0ZAbVSTKgu1733HcsGihw7oJz1Fcj0AX42Tpft3NRbR3wqXSZKVrYEvrtXrQkQwFAsqIfxaf4FLgS0TESp4NgqLu+a4YykyliqcM/abqGZCl1dpm4rA1wTr1/dN74+v/8d5Yuh39hsqm8tr8iQjKv6GXPFI9esv8o9pYfSccNSbRRETdz+nx2SoApze397c7MIlPzBGFusXY6vq01nu6ZAs5Xx8KvHj7nCBRZHyZ+zN4JQQ5gg0/0UPBoboTrCSRm1iDeVILGf3zWQwgexspwFlDSb+Kd0Vcxxumem8uNYlC6Q4YxaMeoGk2cxmDSsud4uLrsDhCeDo29yhmnqeBJ4AvwhaFiSaYIhM0Pown
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8676002)(478600001)(6862004)(8936002)(26005)(4326008)(2906002)(66946007)(6636002)(5660300002)(66556008)(41300700001)(316002)(66476007)(6506007)(6486002)(6666004)(9686003)(6512007)(33716001)(83380400001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iwMjUGBiRk5SNOpsXSRdICnQg6VVG5gwRXhCYy/FUtL03P4Rz44G0423lSoq?=
 =?us-ascii?Q?C9cCWH5ovMtuHiRlSc2BjHF/Q+acpHCOaHPUppgCLhWOIMmKqRoyfMAV+075?=
 =?us-ascii?Q?094u367nDPYQ+znmptzBgG0kyTH9r1iqcKYbJR4bTSJmbOQE3EejQlWwq3Pt?=
 =?us-ascii?Q?IHwSreGwk1pt1X6edo35wEnZbVuGgRT3Am+Pn5oB3H4U291S++jS+64Ub7Ib?=
 =?us-ascii?Q?zG71ABvHNGYL+y/vS8GWJVZwxRptmSIk3wVhOlCm1mwPdwYUketrNhPNxIwo?=
 =?us-ascii?Q?bHkc4V8neRnJhp3Tq1qdLoBPMcIBbFveZypuy5mCQQ1ONaTYJQ9p4NeNIdfe?=
 =?us-ascii?Q?zJYmD4xCVhjH3oicTKWlUTNVLDJckG8rLIRX4xO5D+HpkV7qSVd3sqG4vWZI?=
 =?us-ascii?Q?Iz5UZJK99kaDipj1XUL8GKuIuOsQIk46ddrQkcaeahcNnC5tSoF9KFQeTEpC?=
 =?us-ascii?Q?mWMhReEOBZHDjNBtNLlMqyv/zKj67H58nDto0wo75wAo7fOQ/ywKd9x0rsB4?=
 =?us-ascii?Q?d3kVmbcfDHi9+jX4bhRtlzA4ajPtYI+bLjZEeS1cj9Aj2N/1hYg6tLnybEi4?=
 =?us-ascii?Q?iVrjZv0y/qMJlHnUS8SD2Bq5DxxixXr0dVT2khgUNWlQ2iUZPvKAyv4Rb6XR?=
 =?us-ascii?Q?h5TgI8CY/vjVdSCtjueLlxL2BFKnRPtfvjAc4ZPrMQncrkUxi2OEIQFK3JmQ?=
 =?us-ascii?Q?AAXE7NbV6c0pSMk2Y7/kyyyayRGCWkSCAAG4JFOUPu63NIp+/NGSMn1VIhbV?=
 =?us-ascii?Q?TbcRneODbqxiUofXfqDDq2cHZmRRBwmIsUvFaBGr7PsJrv1fNu178mAKT8oQ?=
 =?us-ascii?Q?M/u4Oj+8Gz8oE0w4ho3uyxTtRDZQqnznSBl98LqiRRklF0baahG+CtLFNO8w?=
 =?us-ascii?Q?nvrPGsdu/Uqm3zOs+CFL5faOHzfuzkPfunZWfd9YV3THRPN7wWX1USK8jTYP?=
 =?us-ascii?Q?teEP3JAHLaIGTdMo3Iu3I2TgXW2cSduvBuAUNIDfFPObrcbtXTKdAVDmPpsS?=
 =?us-ascii?Q?HvDUwSLNvph7RUIvOSeaQJ/I3H0cao9xTRevv0X8gLuhk6zWpuDbLRbCBVAK?=
 =?us-ascii?Q?Mzagb1ycD1e7qvplBQVjgHx8P+JswTn81qODVMwqgUxXXH+o6kCoa59cNhDU?=
 =?us-ascii?Q?oHw5GIOOaRNRKsmXcdUByzFrEUVC4TuROqWfD1wB7nukHTyXZ0ME3R7tdOB5?=
 =?us-ascii?Q?tO8u8P7vGdDA0zCGxL0DbrlWS35N0b4vb8drLj3T2RQmlU7lJY/VMypNNQaf?=
 =?us-ascii?Q?Xo6+HZVYo6z9+P4/THXtGjAyf3AepTNWvfl0nZ3G76j1+AFrtK5b6EnaNa23?=
 =?us-ascii?Q?a/q4JYe1dHMczlfaOkWr6tjqe0SoaKoSq/F7ITeUioV1tnfUXEEx60Lojwzq?=
 =?us-ascii?Q?7fGqEtFKVgBZ8cWOkKX4JgEChpZ3J6NPGYtXulEPHzasS/Sdo95Rrys0uvRY?=
 =?us-ascii?Q?bQznyVZFVd3aNNz6frJcA04+W2R37ejQvOBU2Z0uSU4MH7LCs5oHIoWXuM+2?=
 =?us-ascii?Q?t0g8fJEYS1j9/pkilJuaxidjsP/nuV4GKpUtDTexdMauq/eyZYyeqaRl1P5y?=
 =?us-ascii?Q?eh4lAFOQBzLmBGGHRxqYvr2cPZzZURJamwe+fU7M0nFs+ZRNXl/qoOtEWtHW?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdd761f-ff81-464c-5000-08dbc0b2177e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 06:05:33.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkyXlN4pRwbPbBmjnlZz+DPjkWJlbkFbTq70fBjLYov/k/4J5JTusOlTHy+Kq5hpmu8cs/YQIKMNv9I2clT7nhbDlHqcynTotzPAczbLkMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4601
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: set PTE_AE for all platforms
 supporting it
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 11:11:34AM -0700, Matt Roper wrote:
>On Wed, Sep 27, 2023 at 09:43:35PM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Atomic access is supported by PVC, and became a common feature for all
>> platforms starting from Xe2. To enable that XE_VMA_ATOMIC_PTE_BIT needs
>> to be set, then pte encode will eventually set PTE_AE for devmem.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>
>Matches the PTEs for Xe2 documented on bspec 67095, so
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>It seems strange to be setting this flag at this layer of the driver
>before we know whether it's even the correct setting for atomic enable
>(i.e., we don't know yet at this point whether we want to get pagefaults
>for atomics or not).  At some point in the future we may want to move
>the platform checks down to the same layer of the code where the actual
>atomic enable logic happens, but that can wait until later.

Applied. Thanks for the patch and review.

Lucas De Marchi


>
>
>Matt
>
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index beffbb1039d3..5f700c0d5ef9 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -897,7 +897,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>  			vma->tile_mask |= 0x1 << id;
>>  	}
>>
>> -	if (vm->xe->info.platform == XE_PVC)
>> +	if (vm->xe->info.platform == XE_PVC || GRAPHICS_VER(vm->xe) >= 20)
>>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>
>>  	if (bo) {
>> --
>> 2.25.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
