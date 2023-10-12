Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510D5CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 03:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1987D10E3B7;
	Thu, 12 Oct 2023 03:14:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902DC10E3B7
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 03:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697080454; x=1728616454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4MrwJioGOZvR3EGoTP2azNhjzvXYwAMNnXpkghsSBo0=;
 b=eMKu+w8lnjinoX97xZlU+yAaLHv8rdxaZNGpskBtFL+F59MJ8vqeXqnD
 ULtZRqu24bE5PxXHcUqBlPgKUcKAb6MvD9Gv45YvUUALOIRq6dZIuRjXV
 0IBgAG85zQgMJV5/QEOQ5epOUeyzBYMjgglR95aT0g7X6onNlBlT2mY4Q
 vngxR4BjlWEJcwMYtwYC1FtfPyiKPG28BbBq36f75buCfO5vz9KVq9m84
 MgjPT73EvT8Cn3eY7yvX6y/XJPBHJlQl93md6E2Vf4vNjPuFjyZvy05Q/
 bwW9fIcYJkyU40NVeIg6FVts0kpaqhu97QAaeM+0V/9zgdCzIHzENdq59 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="375173146"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="375173146"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 20:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085496125"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="1085496125"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 20:14:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 20:14:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 20:14:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 20:14:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMGmhYeiDYiJZ6okw+8cRXBQ7xXaoC77eVjEOV0GWyHcg8MgCmIesI28tNLxgWWqrUVHVu29GE00fNvBoW/XDO8PcztOvUMO1lr4s2S5Oh2gvA7DjTzuwsGY87WIyeOIuyUFz6s5AZo6IZbBPISkQu++PTgMFymCSw3TIMGNVGdjmn8eyf+fs0SXVPZVkgwl2PgOIj8VLHTZGJG2aSmaqg3yYfiQSp45qF9Ij7GVik07tX4l6cD3v1hshvGSQQgyH/K86LQl0Y4uMw/uIUf61RXXDFtfZriDSQpTxx/HOQNWjqqLNNFlN7fxQGfnvThLz0BTus4ggC+1JYfbn2IroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5kwn1f3LSJ0aHmDtYUv6O0jRtAhthasKX/wDrf9/dA=;
 b=ODQrSX3O3jBd5Smqs981Hu0WFnYg2UOWaGAuN+FrA7UjGkCMbxXHwrUiSdHksDOQjI9VGhvCJE/Ng78jiUm4kUszOA3j37WOhq7kMLNE4XVvPbGFEUpcYYyTR05CaDL2ni3mAfeEoLzx5NYJAPC4hzkwCN82jvjmfhQTjAGfUHYcrzE5qCKffUCZaesZSmSD4UuAbpP+/742GJBcQtvki1mJv2qIVQUqfTf8SK8f4bMwHeDS3ulvr5ltcUa2kN6QnLbmHEcP1EE0vpxgAmNcYkCFH4qRQ4EWU1XxvAjo0LPc184ppdwphj7ymovB7lEuIy8gnAwPnXmoPpStc4PrIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Thu, 12 Oct
 2023 03:14:10 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 03:14:09 +0000
Date: Wed, 11 Oct 2023 20:14:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZSdkfmSos4e3HNi8@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-19-ashutosh.dixit@intel.com>
 <87il7k1yzj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87il7k1yzj.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6c579c-a449-4490-9696-08dbcad14c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dxSzXWFTRrwWrz/bQhl2rvr4txIsahCTTKRShlovoiF+OYMKEqUdO/frwooImLpFtCrfxRE7RLqbw/nlDG0w8EFo/1KzP1ffkQGnhA7O+YoXJrrRhzmQ85kPgQHGvf6jS3pfQF5VlVYmRQ3v6Z+N5pIPUnEKUJi77sU6AYEJBl2e0IA2Mqn0HlDlOUn0FpVJHJi+22VkxLXuqH6G+Cizc0xDoyW7vnuM4zPjS9jkNaBq80N+OgUluRjrDAHuJxFvJ7FV2RNRmTVNaV2xULjaecELnomXW+9GLl48SGaXq1EvOu5UnZFXbH/dvqohVzbMmwp3ayWZ3xwZZ0iIXm8mhqZ3SBvv0B14uMe45ylItk10cTpGUPYYU7jcd8a6U6LR/AVe22NGuHl9vVNk97GH8adR8QYb/6JmxNk3eqN9iZ/DFoGQHinqXQk8pteZfOTAQmWMhNzlQIzU4IzdPS/9bHCl0+oxKFU6O3v7PDl0xo22GNeBXwg7XB3qYePRsjdhVSdm02aFdN9gysc0IztYepiJMMUUs/brqfY7Ap73nvkEWVUBzBpQIqxBMllAttn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2906002)(316002)(66556008)(66476007)(6636002)(26005)(4326008)(5660300002)(41300700001)(6862004)(9686003)(6486002)(478600001)(6512007)(8936002)(8676002)(6666004)(6506007)(38100700002)(82960400001)(86362001)(33716001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SllSUnVRUmkreWtPOTVWVkRtaVpMNVN2M21NMlRwbUI5ZlR2RkdCT0hWbk9U?=
 =?utf-8?B?Z0l5NzhDN0RSVEMvV0JydXFqY3dZbFUvQU1xcWNKc1FkZHZuQUQxWTVxenVz?=
 =?utf-8?B?QUJ4YlpxaWJNb0xMSy9UUkYrbmhSWFZ6Y1haYmRQM1FMdk1wcWhaY044cDRB?=
 =?utf-8?B?VVY1cjUreW5uQmlZMEVrS1RxTUdtbGQ4UE1QeFNhUXFpbGx4M3N0STJDaXNn?=
 =?utf-8?B?aWlVNXdDaEpUUjk4empVTjJVY0tNNEw0TERkQU03Q2h5T203Y3pzcnl2cEFK?=
 =?utf-8?B?ZzloeFZPUVlSL2hCN2dTZHhxaXBTSnVxMzAweVMvRy80bDRJNjF0UHl2dGY2?=
 =?utf-8?B?dXRiamF0Z0laOWlZTXFTSTg3NjFnYnRDUmF6aVIxNWpIazZWb3R5UVV5cE1Y?=
 =?utf-8?B?Q1VvclJhSW8rSUJyM1Y1Z3ZRcEhyZVpySktNR1huSG1XQmVaQVhkMHRNZVFp?=
 =?utf-8?B?VEJ5OUZ2U2lHNkZKZEFvbG5tak9mblpGbVJLUlAxQ0M0c2RIWDJnVmZONmg4?=
 =?utf-8?B?Z29PdWtybkFUQU9jcEZFOXFzcXhhcVlrQXEveWErVUZvL1NIOGhQdkJGeDhX?=
 =?utf-8?B?aHF2dHdiWTJlYzQxckV0RmtYbkMvOTdVUzV6NzBUQi9NSTQ4Y0J1anRzZXdQ?=
 =?utf-8?B?dDlmZ1cxc0VnUUd2Z0wwQVNEeG45VGdrU0J3eXhlaGUvRzRxSWllcEdyWHkx?=
 =?utf-8?B?M0wyeTJrMm1ZZGgrMHJsT2xDQkRQS2l3V1dqTkQyR214YTh6d0szOHBicUpX?=
 =?utf-8?B?ZlVKTHArdXJheGFidDlRbDFLVSs3T2t0eHFtZTBhdTVEM1NmY2dxeFJGODFx?=
 =?utf-8?B?SFhweDg3bTZHZTBvbEhDcktLNkFCWWJCemQ5VnIxdFRRTmUzc0FXVzdUbmFR?=
 =?utf-8?B?aWdMUWp5MGhYeHN2VFdiV3FnQzRNN0xkR2FhaFQzSnF3aTE0NmdMWmJ1NDdD?=
 =?utf-8?B?enRCK3VmV0hrWFdhTzZoQ2Fzakd4Ykt2S0REN2JINWVzMC9WRkJ1K2pTckp0?=
 =?utf-8?B?Szh0NEVkTlRreHN6S3BCWXJJcGppeE90a1RKUnpSaFFSQXZTMFVscXJmTlJl?=
 =?utf-8?B?MmFuanFyT0pKRHdzV1RneUtSbkxGY0tFdGttRi8wa2E2WHkzT0prM0JSeEJs?=
 =?utf-8?B?R0ZVa0oxNjFxL1R6cGxFV1FiVEp1YXJkZ3I1a0NoR3pkMG9qbkZ2M3ZadmtN?=
 =?utf-8?B?b2pOQnlBUnlCU29jNE1UMGo3SWlUVTh5VTd4ZDBjZU5oME1QOVFGUnJ6OU5Q?=
 =?utf-8?B?dFFuRWNwYy9WVmdteHg3czdHeThDN0tQUEhtL21vc0s3NFFFVlRyeWRVNkpw?=
 =?utf-8?B?UGQ0Tkhtazc2dlRHRW9IRTRiUjYvZzYrcDg4Z0VLZmxMUERXNmRtZkoyNG9y?=
 =?utf-8?B?ODQxNVNPajBucUpPWDdleU9welc4Y2haRkxEVGtOd3pWT0p0UHFkZXFOeUJU?=
 =?utf-8?B?TWhQVTNTcWVWTEJWRnpoaFZjMVV2Nnp0eXJZK0RZT0pMZkVKZUsvaEVZZWs2?=
 =?utf-8?B?WE9yT2M1VXBUeVFOaUkxbG1KV3BuNVJUc1dlSGtZNjRaREVXL2NXako5eE5s?=
 =?utf-8?B?MkVNTWpleTluRXlrR04rK1Zkck5kOXhiTTJNRG8vSjJQcFhoWWFEbThUK0dE?=
 =?utf-8?B?VlJvUzZRSDNGdW0rWmJUQkt6bEtPazgzcVlCTlltMmcycHlwbnBZTUNQOElT?=
 =?utf-8?B?elUvTWVDdHM1NjNoTjZySEVRd2REQURKc3dnaVlFdE43UGhYeUxtTjhrN2Fi?=
 =?utf-8?B?cmxOVGY2ZEt1RlFmM0JPYVhWSmd1RWYxY2RNUTZYSG8xT3F0TC94aWJEM3RJ?=
 =?utf-8?B?cjhMTjAzamdpWmJuN0lqZHp5WmFsWEdFNHU5cmR5SktnbDRQK0xWWVRqRkxV?=
 =?utf-8?B?OFdWQ3hrVGxoUld4WmNEaTRkOXlZQjdOaFVSUUVtVlJ1VThoREdFZlI3THJx?=
 =?utf-8?B?QktDVkNFQnZVRzJyYjRDR1U2MEhKaFlPWWIxQzF5bjgzQTBFc0RHZGh4UUJl?=
 =?utf-8?B?ai80M0RDSytBWU1TQU5OOWRtWDV5UDBxTlYxUnJVQkJud2FIR3F6eGV2ajV1?=
 =?utf-8?B?STZWU1FhMDZ6elVTekJzWjNkTjNqY2NoSlJ0cGtQQXNnMVErMzBhc1l5RUpH?=
 =?utf-8?B?N1VhSytXY2RIckp5dXJJM1Y4UEgvRmRScXAzQ2JyTGZLVWM2akNTOXNxTmlj?=
 =?utf-8?Q?0VWRkvNdB5un1CU0PD80tLk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6c579c-a449-4490-9696-08dbcad14c97
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 03:14:09.1145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVNEnmfIBuuP8i/7KO+cVthB/tJwnY1+kdJw2Pdc3qqrrMbgEuU9n1kZdZ2kxTidPxPwJe2UK4g0nRaGfT8hlXl1AaTlWqw6ccduDqYX80A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 18/21] drm/xe/uapi: More OA uapi
 fixes/additions
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

On Thu, Oct 05, 2023 at 03:33:04PM -0700, Dixit, Ashutosh wrote:
>On Tue, 19 Sep 2023 09:10:46 -0700, Ashutosh Dixit wrote:
>>
>> +/**
>> + * struct drm_xe_query_oa_info - describe OA units
>> + *
>> + * If a query is made with a struct drm_xe_device_query where .query
>> + * is equal to DRM_XE_DEVICE_QUERY_OA_INFO, then the reply uses struct
>> + * drm_xe_query_oa_info in .data.
>> + */
>> +struct drm_xe_query_oa_info {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @oa_unit_count: number of OA units returned in oau[] */
>> +	__u32 oa_unit_count;
>> +
>> +	/** @pad: MBZ */
>> +	__u32 pad;
>
>After discussions with Umesh, we will add a 'capabilities' bitmask here.
>
>Umesh, could you please see if anything else should be added to this
>struct?

Nothing that I can think of now.

Thanks,
Umesh
>
>Thanks.
>--
>Ashutosh
>
>> +
>> +	/** @reserved: MBZ */
>> +	__u64 reserved[4];
>> +
>> +	/** @oau: OA units returned for this device */
>> +	struct drm_xe_query_oa_unit {
>> +		/** @oa_unit_id: OA unit ID */
>> +		__u16 oa_unit_id;
>> +
>> +		/** @gt_id: GT ID for this OA unit */
>> +		__u16 gt_id;
>> +
>> +		/** @pad: MBZ */
>> +		__u32 pad;
>> +
>> +		/** @oa_timestamp_freq: OA timestamp freq */
>> +		__u64 oa_timestamp_freq;
>> +
>> +		/** @reserved: MBZ */
>> +		__u64 reserved[4];
>> +
>> +		/** @eci: engines attached to this OA unit */
>> +		struct drm_xe_engine_class_instance eci[];
>> +	} oau[];
>> +};
