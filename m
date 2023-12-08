Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C15C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 19:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4610EB0B;
	Fri,  8 Dec 2023 19:37:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239C010EB0B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 19:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702064253; x=1733600253;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BfF9853LgpedXu4eJFth1BKuFI5JtBuRhIcteoYT0DM=;
 b=R3Lw1PZ/FiIVIPeDJQUrXNsM84QX9Y9JtIUEWaoAsTM1+LM4fsAIXd6J
 eu+cFzRmpbpkL4PgnW7ibH6beCV+sHfgVMVWODdrqccmu5rySpaFYiz1U
 cYpdgW3mHFn74eZo6Aq5+Cyw2AiJJVXKenWAfULcopjawHLaxPyOB5/0d
 mC8EnWt0Tncq88F8kXK3ls1ZIaokuV+kQk0dz1Xbi2oahAw0iygjNsmAt
 WCwss9Z0LVgQpUAlm0Vy8nXpQRck+tJv8/PdH42sWOYg62MNEsJt+06FK
 LSDJ9zMZhdAtukM8CtPmaP3ybVOJdb1lOJ3z67MnLLALRE1Y45Zaapytd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="394193474"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="394193474"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 11:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="806502517"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="806502517"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 11:37:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:37:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:37:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 11:37:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 11:37:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xnq8By8YYMiffjX9CYlnGSX+mwC3IT+eC4V6MFXJQvdZMiRcf3uGQtSzh8R4wCOxAHQB2EgVKqSNXc2zLBI0cfCaVq6hqE2b/yu2QskFv0Zod5R4B/fjzh0cRXOlWLpz4TnhMq/us8b0FRS40+K/GMhgA+1LwFgrRCeqRyr8zMbWvegTZL+dPQzBS6GBnuw/hSPoJv4x1Qg2Zq9BSJgc2E2eSPjqpciq32C9nGwN22EkFq8TyEKxQB6/2m48pavCLtB6bJS2I2ebrCbltpb5gG0Qx8kT6r+kO1htNLIimrPp0yjb7GlhP+UOi9HEgX8OFmBwme336ApT2EHRZBxBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBV8cyT1sq3JlrmN3ewwkmezIO2BnK5ir9qinMxgGAE=;
 b=npy1FZ0FFzhL4sKhy787Pn3GQX+5nc77b3P8gySVgmJXuKObNVTBiedZh9Fr2rF1JsAZLiPnVFf5R4v/0mTFeQA4kxJhmz1f4CGOdNonlHDB+PBPXweeu2qJ7LQcf5BDz0tF73MZuC7McTFnS/wMruBIQU6759hpajJG43qqIx1SHsZ0bSLIrZZ6dN2ulMMT6OHXe9dkuMk59GczeQK9laEceoa+yMSO6GUPHxVu0JO2q9EPpNk6BQC9uAr7BvIti5RIo7jyiFLuPGkZvsmQ548eRgYhuP8t4aNsogxvouY5JMSDKYM77Rrz6TuqqC/g8oGS81GvoFXYVmKdN0JnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Fri, 8 Dec
 2023 19:37:29 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 19:37:29 +0000
Message-ID: <d2bc8ed4-965b-40d2-aacd-915ed68a6e73@intel.com>
Date: Fri, 8 Dec 2023 11:37:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Use NULL PTEs as scratch PTEs
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231208112918.15411-1-thomas.hellstrom@linux.intel.com>
 <20231208112918.15411-3-thomas.hellstrom@linux.intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231208112918.15411-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e359a37-fe56-41ed-8183-08dbf8251cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wOivk1QWjGg4bDHnUS10EgNQnuaTqFT0BBNaP5zdkZpeCiqslthqxs/TEFTVEDI3ZQOBqn898EKz10T0ZMMs5UrLWc5RLebDaM78OPGM7h5MP28c3VAKFh/kXeW/0fegsRL54f2Xv9g8OvNwvZURFTEUq/UBfThuEFK18glctfUO0Wq8CgUhGj2SwKCFaTelM41twyWOOOJ4TYQBd6ik1nwRt9lxosJzr3+8yhkMZeJlhMPYI43qwXcVomPjIF8+Mg3mG1Q6b8I4SIW3JZeM3YPApHmof9HSXH5IAy2dE6Aa78tLxhotTHCjNxhVmaiceod7HC8FSL3O9ObM27+OcaU6WdkbCI24Sp4AdjwQZG7dYKQQMXx5lr4Fwpf902H68/x5JjPHMGy7c/DABZUYwVKJw8YUJAOerOTXZzN3z9zRneCw2PWPYxFhy3GNKSN8LxDD4ODJDOWKzMmrfcJPUybYwEcT0112Z6/CWGtUmJTYN75O+O/jvCvyAtuvyRYQDO60d3kh+isUOzh+7r9ATnMfwPIgiAgWNRul069L4N/SWfT66GuOdSDw5/R2GJFlilqKxBrgyrPwsPM4hBe+eACiYeVcqxtkfxB/7n6fYxvTF4IlRIkWMNqKmQqqN2GDdPNaMFgjlrBETBSxUn6KYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(31686004)(66899024)(30864003)(5660300002)(86362001)(31696002)(2906002)(83380400001)(316002)(66476007)(8676002)(54906003)(36756003)(26005)(66556008)(2616005)(82960400001)(66946007)(6512007)(6506007)(38100700002)(6486002)(53546011)(4326008)(478600001)(8936002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRKSEVuNVJIcHNsd1JnS3ZWUlY0Q0hYV2VmZ09iNjNrblRxSDNJQmNRaWlS?=
 =?utf-8?B?RjdNbk1yR2hHMWpqY1cydlc0SHJTdDJ5YU5KOWhhRmhsQlpFblFwdTZQR2dj?=
 =?utf-8?B?VnMwb1NsVFd1Sll0Q2Q5cm9PMU9INHpkRFZqUThDdUhXdWpmOUxMa3F6cDRw?=
 =?utf-8?B?OS9VQUpNWTBVc1owYmJpSS8vcXVLczFBeUx4ZDdLVUFLbk9WRjVFOExOK0JV?=
 =?utf-8?B?dWFLZTVKUERsbHA3WU1Ud3QyWldreG9sS1hINzVHWWlKNWkwMEZ4L1FYSjFu?=
 =?utf-8?B?YkJ2UVVCakdVcDNYak5FS0FOMmRqNTFBVldUTWIxdVJIejJpYjI3V29GZ25i?=
 =?utf-8?B?NDYrSVBQVlQxREhYSjBjNEVRMXlPN243MFNWeVZ2UVpNQXZvd0VOS3dRcmh6?=
 =?utf-8?B?UTdjeTQ5bGx6c1pQTGtRY1d4L0Z6Y3NyMTgwY0tMNWZWZWEyNXMzcmRFcWVG?=
 =?utf-8?B?WVVLNmJURHg2R2JJL1FKZUQ0U0xYSGhjNENaaHpsSkMxK1h6M29ZYTlKRU83?=
 =?utf-8?B?MlZOSWp0VThqNmlCL1JyU1A3M0ZzSlNKN25ZTGUwcmZzR00rYjlvUCt0VjFI?=
 =?utf-8?B?c2J1bGlGeFBYVFV1TWtDQzJlOU9iUU1LdUJVL3d3dlRSb1ZpdlJQeXBFSVNz?=
 =?utf-8?B?MldVQXQ2cXEyelphZTJNazBPWk5nL0JzRnY4Z3ZnbVYxZndHQk50WTYxeFQy?=
 =?utf-8?B?d2FrZXMxM1JCY1ZtanZmVVB6MkFzS2JiS2x4bzJhbXAxOHRQU2w1QkVmb2RU?=
 =?utf-8?B?cmVxT2FGOXhsMFIwQVVGd3JJb0YwK0NNL2xvc1ZpR0pGV1BPSmQ2UGpuUTN0?=
 =?utf-8?B?bTMwQ21taVJ6aUdSOUY1SlFmczdmb0RuQ1RkaHdzdGFoOEgzUkUwUlN5Tlhv?=
 =?utf-8?B?MCtxbXVSRk4yRHVVZWNlYm83MVhyLzV4QUlKSDlteGIwRHRxZDlHNVBBdDJx?=
 =?utf-8?B?SXV4RFJaZHNpNS9NeTVabGNuWGRqL2U3aWVlOWhGUVJTT0dQMDlnZXl5RldN?=
 =?utf-8?B?dFBZalFuaVVsOFVvcDRtc0tIRkFLMEMvTjArOU5Rd3FYM1Vjay9telNqS0Ro?=
 =?utf-8?B?U3MxSlpYelByallJREZicEJ4cDQwaHlQcS9HTUMzckhXaWdpQTJwbXgvcldJ?=
 =?utf-8?B?R29aeE1ZYXpJT0VVRUNTRTdoMEpuZzVadW4rOFl2WkI3RVlCRXh2dlp6MHg2?=
 =?utf-8?B?TGJyTFJPS09pTGc0RTZUL0RLQVZrcGVlWWFMNUxFMjRvclZZVERoUWxZSXVN?=
 =?utf-8?B?TEMzUTBkSkdSc3VtOFhSUDBLNGNPVlpGOGNUY2Z1QS9TTnAxWTRwRXVCMzZ5?=
 =?utf-8?B?SEtEZ3c1bE5jWEEzRW9xd1d3WlM4N09wVWNtemhpTlJTQ290aXVrdllldVpY?=
 =?utf-8?B?U1Z0OVJ5OTlBQ2RHeWN2ejNXYTg0UHdHNlBFay9iVDBHUmtCVlZKN1lmRHMv?=
 =?utf-8?B?aE13bU9RbWFZY3JFUzZCSHkyYXB5VGZpVVUxOEVpak5BR3B2NmtSZUFTZmZF?=
 =?utf-8?B?SlhJbzBWc2UxTGRRWTVMaHBpVnd1S1NVU092WFRLY2t1MEY1Rm9SN0pHazlW?=
 =?utf-8?B?OWVKN2hoM1NVdmU2Qk56cDJhelFveXBkNGc2Qi8wMjl5VlExTnBROUFIVG95?=
 =?utf-8?B?SU9sQ0FRMktoYWRkOEtEeW1nRTR3OUtEQklEQmV6c1owSE9JMGRDVVBGSCtq?=
 =?utf-8?B?L01wVGtCQkxkL1E1NHNtK0F3TFlZYXZEM3FhMTZsdVJNVDIzRGFVYU1KUGlZ?=
 =?utf-8?B?dktsOUZtSjdoVWpFUVIxM1h3SERNdjk2TTUrOHg5b2RKa09Ea2V3NTdIMjMr?=
 =?utf-8?B?d2hUZFJ5UDV4YW4xc2ZOVGpWb2RKY2tjK2M3Y2hJOE9zeERxdGlKOUxFeko2?=
 =?utf-8?B?ZjRZZEUwQ0dTSiszek9KRTJLNTc1Z2NYUDc2QlZaK1AxWjJXODdmaTlsbWFq?=
 =?utf-8?B?U0hFUmpQVVpQZUZLTU1yUDdzTXYxRDNWMEdTa3FGVVJWdlRXang3cmJXalY2?=
 =?utf-8?B?aUV1ZjhvaE92OVRVVzQ1NGsvRDJFRitXeGpLelpkalpuWXZuYzBtNHVtNFdH?=
 =?utf-8?B?VFE1K3pCempEU3QxL2I4M2VTRk5SWkc0azQ4Zk1hdDdrTUJxNGJpWWx6RDdH?=
 =?utf-8?Q?QHD08tASMxjLHaPqgFJO2NCRI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e359a37-fe56-41ed-8183-08dbf8251cf9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:37:28.7775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLhA/ozEWgWC8k74xlUUtvq7HkXek7uS067rppbWOudFPaPwV1RGHP/ItXtIllIMq6ep1sPGS+ju5PrAV0/SZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12/8/2023 3:29 AM, Thomas Hellström wrote:
> Currently scratch PTEs are write-enabled and points to a single scratch
> page. This has the side effect that buggy applications with out-of-bounds
> memory accesses may not notice the bad access since what's written may
> be read back.
> 
> Instead use NULL PTEs as scratch PTEs. These always return 0 when reading,
> and writing has no effect. As a slight benefit, we can also use huge NULL
> PTEs.
> 
> One drawback pointed out is that debugging may be hampered since previously
> when inspecting the content of the scratch page, it might be possible to
> detect writes to out-of-bound addresses and possibly also
> from where the out-of-bounds address originated. However since the scratch
> page-table structure is kept, it will be easy to add back the single
> RW-enabled scratch page under a debug define if needed.
> 
> Also update the kerneldoc accordingly and move the function to create the
> scratch page-tables from xe_pt.c to xe_pt.h since it is accessing
> vm structure internals and this also makes it possible to make it static.
> 
> v2:
> - Don't try to encode scratch PTEs larger than 1GiB.
> - Move xe_pt_create_scratch(), Update kerneldoc.
> 
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com> #for general direction.

Reviewed-by: Brian Welty <brian.welty@intel.com>

But one nit, and one question further below.


> ---
>   drivers/gpu/drm/xe/xe_pt.c       | 65 ++++---------------------
>   drivers/gpu/drm/xe/xe_pt.h       |  3 --
>   drivers/gpu/drm/xe/xe_vm.c       | 82 ++++++++++++++++++++++----------
>   drivers/gpu/drm/xe/xe_vm.h       | 11 +++++
>   drivers/gpu/drm/xe/xe_vm_types.h |  1 -
>   5 files changed, 75 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 699a255d75f5..bf33e56715d8 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -50,17 +50,19 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>   static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>   			     unsigned int level)
>   {
> -	u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
> +	struct xe_device *xe = tile_to_xe(tile);
> +	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>   	u8 id = tile->id;
>   
> -	if (!vm->scratch_bo[id])
> +	if (!xe_vm_has_scratch(vm))
>   		return 0;
>   
> -	if (level > 0)
> +	if (level > MAX_HUGEPTE_LEVEL)
>   		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
>   						 0, pat_index);
>   
> -	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, pat_index, 0);
> +	return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, IS_DGFX(xe), 0) |
> +		XE_PTE_NULL;

Nit, but seems a little cleaner to utilize the flags argument?
	return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, 
IS_DGFX(xe), XE_PTE_NULL);

>   }
>   
>   /**
> @@ -135,7 +137,7 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>   	u64 empty;
>   	int i;
>   
> -	if (!vm->scratch_bo[tile->id]) {
> +	if (!xe_vm_has_scratch(vm)) {
>   		/*
>   		 * FIXME: Some memory is allocated already allocated to zero?
>   		 * Find out which memory that is and avoid this memset...
> @@ -194,57 +196,6 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>   	kfree(pt);
>   }
>   
> -/**
> - * xe_pt_create_scratch() - Setup a scratch memory pagetable tree for the
> - * given tile and vm.
> - * @xe: xe device.
> - * @tile: tile to set up for.
> - * @vm: vm to set up for.
> - *
> - * Sets up a pagetable tree with one page-table per level and a single
> - * leaf bo. All pagetable entries point to the single page-table or,
> - * for L0, the single bo one level below.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> -			 struct xe_vm *vm)
> -{
> -	u8 id = tile->id;
> -	unsigned int flags;
> -	int i;
> -
> -	/*
> -	 * So we don't need to worry about 64K TLB hints when dealing with
> -	 * scratch entires, rather keep the scratch page in system memory on
> -	 * platforms where 64K pages are needed for VRAM.
> -	 */
> -	flags = XE_BO_CREATE_PINNED_BIT;
> -	if (vm->flags & XE_VM_FLAG_64K)
> -		flags |= XE_BO_CREATE_SYSTEM_BIT;
> -	else
> -		flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
> -
> -	vm->scratch_bo[id] = xe_bo_create_pin_map(xe, tile, vm, SZ_4K,
> -						  ttm_bo_type_kernel,
> -						  flags);
> -	if (IS_ERR(vm->scratch_bo[id]))
> -		return PTR_ERR(vm->scratch_bo[id]);
> -
> -	xe_map_memset(vm->xe, &vm->scratch_bo[id]->vmap, 0, 0,
> -		      vm->scratch_bo[id]->size);
> -
> -	for (i = 0; i < vm->pt_root[id]->level; i++) {
> -		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
> -		if (IS_ERR(vm->scratch_pt[id][i]))
> -			return PTR_ERR(vm->scratch_pt[id][i]);
> -
> -		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
> -	}
> -
> -	return 0;
> -}
> -
>   /**
>    * DOC: Pagetable building
>    *
> @@ -1289,7 +1240,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>   	 * it needs to be done here.
>   	 */
>   	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
> -	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_preempt_fence_mode(vm))) {
> +	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
>   		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>   		if (!ifence)
>   			return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index ba2f3325c84d..71a4fbfcff43 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -29,9 +29,6 @@ unsigned int xe_pt_shift(unsigned int level);
>   struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>   			   unsigned int level);
>   
> -int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> -			 struct xe_vm *vm);
> -
>   void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>   			  struct xe_pt *pt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f585cc7df071..c58da0c390f5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1329,10 +1329,61 @@ static const struct xe_pt_ops xelp_pt_ops = {
>   
>   static void vm_destroy_work_func(struct work_struct *w);
>   
> +/**
> + * xe_vm_create_scratch() - Setup a scratch memory pagetable tree for the
> + * given tile and vm.
> + * @xe: xe device.
> + * @tile: tile to set up for.
> + * @vm: vm to set up for.
> + *
> + * Sets up a pagetable tree with one page-table per level and a single
> + * leaf PTE. All pagetable entries point to the single page-table or,
> + * for MAX_HUGEPTE_LEVEL, a NULL huge PTE returning 0 on read and
> + * writes become NOPs.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> +				struct xe_vm *vm)
> +{
> +	u8 id = tile->id;
> +	int i;
> +
> +	for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; i++) {
> +		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
> +		if (IS_ERR(vm->scratch_pt[id][i]))
> +			return PTR_ERR(vm->scratch_pt[id][i]);
> +
> +		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_vm_free_scratch(struct xe_vm *vm)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return;
> +
> +	for_each_tile(tile, vm->xe, id) {
> +		u32 i;
> +
> +		if (!vm->pt_root[id])
> +			continue;
> +
> +		for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; ++i)
> +			if (vm->scratch_pt[id][i])
> +				xe_pt_destroy(vm->scratch_pt[id][i], vm->flags, NULL);
> +	}
> +}
> +
>   struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   {
>   	struct xe_vm *vm;
> -	int err, i = 0, number_tiles = 0;
> +	int err, number_tiles = 0;
>   	struct xe_tile *tile;
>   	u8 id;
>   
> @@ -1397,12 +1448,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   		}
>   	}
>   
> -	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> +	if (xe_vm_has_scratch(vm)) {
>   		for_each_tile(tile, xe, id) {
>   			if (!vm->pt_root[id])
>   				continue;
>   
> -			err = xe_pt_create_scratch(xe, tile, vm);
> +			err = xe_vm_create_scratch(xe, tile, vm);
>   			if (err)
>   				goto err_scratch_pt;
>   		}
> @@ -1466,18 +1517,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	return vm;
>   
>   err_scratch_pt:
> -	for_each_tile(tile, xe, id) {
> -		if (!vm->pt_root[id])
> -			continue;
> -
> -		i = vm->pt_root[id]->level;
> -		while (i)
> -			if (vm->scratch_pt[id][--i])
> -				xe_pt_destroy(vm->scratch_pt[id][i],
> -					      vm->flags, NULL);
> -		xe_bo_unpin(vm->scratch_bo[id]);
> -		xe_bo_put(vm->scratch_bo[id]);
> -	}
> +	xe_vm_free_scratch(vm);
>   err_destroy_root:
>   	for_each_tile(tile, xe, id) {
>   		if (vm->pt_root[id])
> @@ -1563,17 +1603,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	 * install a fence to resv. Hence it's safe to
>   	 * destroy the pagetables immediately.
>   	 */
> -	for_each_tile(tile, xe, id) {
> -		if (vm->scratch_bo[id]) {
> -			u32 i;
> -
> -			xe_bo_unpin(vm->scratch_bo[id]);
> -			xe_bo_put(vm->scratch_bo[id]);
> -			for (i = 0; i < vm->pt_root[id]->level; i++)
> -				xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
> -					      NULL);
> -		}
> -	}

Just curious. Is user-space exec_queue able to still be performing 
memory accesses and causing page table walks?  In other words, is
the page table possibly being walked as we teardown here?
Partly, I'm asking as I noticed you switched the order it tears down
the levels.


> +	xe_vm_free_scratch(vm);
>   	xe_vm_unlock(vm);
>   
>   	/*
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9a0ae19c47b7..6563ca33caf2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -64,6 +64,17 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
>   struct xe_vma *
>   xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>   
> +/**
> + * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
> + * @vm: The vm
> + *
> + * Return: whether the vm populates unmapped areas with scratch PTEs
> + */
> +static inline bool xe_vm_has_scratch(const struct xe_vm *vm)
> +{
> +	return vm->flags & XE_VM_FLAG_SCRATCH_PAGE;
> +}
> +
>   static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
>   {
>   	return container_of(gpuva->vm, struct xe_vm, gpuvm);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 23abdfd8622f..f628a7081f27 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -158,7 +158,6 @@ struct xe_vm {
>   	u64 size;
>   
>   	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
> -	struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
>   	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>   
>   	/**
