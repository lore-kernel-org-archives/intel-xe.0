Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219A6C54764
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 10:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C116310E1F7;
	Mon, 19 Feb 2024 10:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCMTueEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD0410E1F7
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708337362; x=1739873362;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=spODWQXa6jwObFTu5416pDC/VHa0BiwI3QH1jKjAr/U=;
 b=XCMTueEmM2J7p/UJ859Z6Fwi1Xc1UPf3NRvPvm2qDwWFL9PeWTvNwxCO
 rcBwEmVjI9KMmEPLe3getBwnftpMyzb4kuOMA6zYUdpJquoQ+slZgTb2i
 a6k+gQicpMV6QVzKs0tXoth8HrsCJPxygkFnPChYvjrKOW34JfFkWnAKC
 ou1slw0+7JSkHK5INZp1HGxUqiBUHouzxcDhhumLm4QG6nOCAaqUPOetg
 Sg58w3v49aFi3fXr/S7xBnvbcql9MHW2r+gxIpnwb/y0GnlF3hUi5+tOx
 bizN9iT5z0YRL78IPl+dixqic7P/8Q2pb8Ug6qJYkiV1ljoytzkSFYCo/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="6231365"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="6231365"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9121999"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 02:09:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 02:09:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 02:09:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 02:09:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 02:09:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crF0xriNqt35WmvfepoGfZxiKhfFNEig16iEzOaYYrErDCEC8muUJXDyExgdTSwdDYeYBvHNF6y/Qh+Te9hyk6F/XcGmt7Z/pgs2+/3xli524weJdOa5R2MEnmBrG+srGodrjWTMuTBYithkUylpgZP+2lRu0Q+xrxvCSA9gDmKQubhXDJsmxQKDMfMIHm9L0S62mj/fgiwC7DnjaWz58fhtOgk3RokHozVr3YLOzNxxhE7IjukxaRbH+ozRxnpZSA+FjVmkc5do8SALLG8pG3aTnXyO92aSs3vxRDh09o4RLlMfbG5OLgkiL8BTI5xx2hcXob3mff8Jm+GsmvFkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9Ng8pt73Dml+Ks8DsTiJx8cpIq3TZz+Qtm5AYmhD+0=;
 b=iDB8USqJzhzVkfF/MvQ6xZ/T/fUF6g6b+kfNnxPSE3ULRcX7H+cZw7Adj0hiyHJINg/XlclYCiJXzSsUEXd5FoA5VFEjww48d70B7GrTt+Pwwy8UkXIeKg7hig7eUzF71xLj+TJ/xzegSW+hNGw3h8rYDrWVwzQSxdvvt0PZljhzTmN7Y3dV9NrW7YVCw6j8PSfoQ7zwnilAGE+HWwApDUcLZdDm2vcnts+d6L6kqq77DkDSIQtoZUFzDYnwDGpAe+WZdaYzPnVPUSVpcPn20A/YRkf7jGRv1zPovHCN2IeOICePZNZ61AI68qo8xPmpVeiVehdX/M3L3JQRlLOVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.37; Mon, 19 Feb 2024 10:09:18 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7292.033; Mon, 19 Feb 2024
 10:09:18 +0000
Message-ID: <f44d6246-e172-4036-9d5c-fc059a0e352f@intel.com>
Date: Mon, 19 Feb 2024 11:09:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>
References: <20240203060534.6839-1-nirmoy.das@intel.com>
 <20240203060534.6839-2-nirmoy.das@intel.com>
 <20240216195254.GL718896@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240216195254.GL718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0173.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::28) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|IA0PR11MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 984ee48a-9056-43b3-6de6-08dc3132d580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4J77T2XAy4D3Icv9EE1CNWEkMzKc+P9feOghwFg46PBwK96K9OVYsxLPpO+Y34V3AvUdYA8FJHIqR70+dTYsOUIJD9GmpxzDmSweEGAW5k3MRoebFnmycjdX+OfJvoPWO2Ie78QU9tDD5TtzKGU4LA3YKpXi7xxzaMGROetqJ14atHH83KWxqrzq96fK9zDeK2ofwTO7mBaQnp0wY/n5Q6754GmtCBer69Wlq4DKhAumtsEtyfjYdd7d9/PV5TR4D1qJ6kJHzVqOKbDQWbeK4Q1btfK+s21Ks/jtY9fjfv1E4flSk5yUw1Qu+RfBD65rJ6qAouARYRFiUfHNjx01E2edakoWiLUulanY7IQKseHSLukWZNaDf/B6cwKhOQC01RjjrYndPIfX10kdaeYbVRMgWx3CiySWejbtR4R0Qr0dGlD+3rFRCtZ1oFWAz0AmED2uX3CgjtTDAFdKpZAU1sq26RKETF1/ewH9s0Yt7GxbL8zsnM2kcqVIXxiDZeXG6ldbc8CJJJ1iDfu6bj8VkpwIFs9RMHosVvMWje0etfodcf//puFigr92eXBh7Jww
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(36756003)(82960400001)(31696002)(86362001)(53546011)(41300700001)(6486002)(6512007)(6506007)(316002)(6666004)(6636002)(37006003)(478600001)(83380400001)(26005)(2616005)(38100700002)(6862004)(66476007)(8936002)(4326008)(66556008)(8676002)(31686004)(66946007)(44832011)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlZLRG5HTzh5OU9tZ3lSN0U2T0c1Z21JNTlUNWc5aThEUDdHYml4Z1FrVmQ0?=
 =?utf-8?B?QlhVRGRjc0ZiWTVhQkwrWkMxWXRSSG1wcXZEcnhXZVNQTzNHK1M0RSt3VlFF?=
 =?utf-8?B?YzdSVFNEMDlFL2ZhZ3VscU1aVWYzNEZwU2FncmZuS05kTyt5UnVIcjIyTW8z?=
 =?utf-8?B?U1ZjcjlYUi9oTE5YWVdYcFJ6UE5xa3RWSXhpUE9WQ3FKUjVSNkFTaTJXNHFj?=
 =?utf-8?B?akRJeWs5UGVIbG1Yb0hzK3JFNFBUN1ozK01ZUlI2OGRLQ2F0V3dNd254bkc0?=
 =?utf-8?B?SHpKSlo2UFQrYWF5MXhXRUJTWXJQVTMyZjJMVVI2NW9XZGQwSEtpVnRKL0Z1?=
 =?utf-8?B?dlBCVEYvajFhcUdBTHAzaHBBdDZaTTBTSnhsWTJ0a0NVNnVvcXpYZlJ0Yk55?=
 =?utf-8?B?WlFaS0hMMlZDOTlZWGY2NXFtWmU2b1AxU0lkdTJUYnVBYWNoWkVMUHRoQjZj?=
 =?utf-8?B?Wk5vMllZMW5sVlg1Q2hLaTZ0SEp3QWpPTTVMOVdwdGl1REpOVVBVNmtXOTN0?=
 =?utf-8?B?bERZVVFLUk5HRXRta1dyVVVPb0lUZnp0bE0wK25YQXBFY3FwNFNqYjNCS1lC?=
 =?utf-8?B?d0RTYXNtZXlJTjB2NlBsNGhDMi9sRkJhaDVRRDBIaVJUUDBtZnNtd2p5dGJn?=
 =?utf-8?B?U3A0d01KOC9MR0pnaWFoWmIxbjByR1BQUW40Rmw4NHdPVk9vQ3llcDdVUjJl?=
 =?utf-8?B?ZmVsZVQyYXQzSk9VMitKQUJFN0lKTyswR2Q3TmkybWpzS1NiZEo1VmNxbkxB?=
 =?utf-8?B?TjdzZ2hscFlDcEV3V3BGT0tHYy8vNGgyUmx4bHNuZkx5S203MTNNV3pIVmR5?=
 =?utf-8?B?MGNCbnlkMzFMRmFQa2YvR1hERERBOUN6NEh0dkgyRHZiUnJKMytCbnJyTG9G?=
 =?utf-8?B?ckFRdkZoSWRxOGlaVUtxZEsxVE9ydmx3ZVhKSEF5dElyR1VWcStHZkhWaTVh?=
 =?utf-8?B?bU1UaHBnVDFXRktZUU9uUTlPcUJiV1dvZXhSNnR4Mmh0Tk1VRG1PelRLOGpP?=
 =?utf-8?B?TThaZlUvRUR6dEFGb1FXME5DQUtJWFdxZnZtVHFIS1g2VHlzU1pOTW9Kb0kv?=
 =?utf-8?B?eGJTZktXeCtQT0dMNENEUDBsZkxDekk1STJLUzNQdWFlOFUyTDIveFk3MWpR?=
 =?utf-8?B?c2lrR0sycjUySURzdDBKa3JHMnM2UHJDanozVFBLbVpNUlFXQTlEd1YrV3N2?=
 =?utf-8?B?NnBLbTdpbmFqSUV5Q2ZwYlBmZ2R1TEJZWitKWVBmVWxaY3VDampnbElEUkZG?=
 =?utf-8?B?QkRFeWhuS1ZNZURwMHFEQlNJRDZ3L0txeFUvRWpwOVRpcE9NaVBRYlk3QTdX?=
 =?utf-8?B?OFA5c3FONHhzK0pPV2VZVjVRZDVpZWc4MklEOEpnNzZMYkE0bDUxUzg1TWJS?=
 =?utf-8?B?c1BKNHBjL1FjYmNMelBSanNxemI5dnljS01yYW9CZXF2RmlySlB3M2F0ckgx?=
 =?utf-8?B?VXBoYnNLVUowb2hFeWVLeCtnbmZIalU5T0JjNW50TzJKS0kwVEY0NU1NZUhJ?=
 =?utf-8?B?Z3pVY0l2VXo1MjRkaU1TUk9QN01URUxGRlJlcU9Xd05VZjZRZCt4a1FUMmMv?=
 =?utf-8?B?ZUVnN1pDOE1FeUpqZXY4T2ZYTFhLTVZBdVl5SXY2R1JvbW5NRDlmN2drVmcz?=
 =?utf-8?B?SFdOU3FmNzdPSWs5b3NxRzNnZE9yNXh2Q1JKSjQzaWNBYk55dFV2VUl5NWdB?=
 =?utf-8?B?Qy82SmpKREtrSHdEdjJlSjZ1Um13Vmg5KzJFVkN5Q21JdnlPb1NNLy9GcWo5?=
 =?utf-8?B?c3I5VzFmMEI2clhoVUtDYVdGeEZFM0lVUnFrL2FYYU9tbHpUTGJVbWlkNjdx?=
 =?utf-8?B?d01SNTVBaXBybXBhSHc4WDJERU1BZzhUMzZxQ1d5dHF1cE5UVnAyKy9LMGR2?=
 =?utf-8?B?aE9ndU1IeGQyeFp6V1M5TTh4bnpmenNaQndXRkQ1Rm5UNHpjM3ZHQnB1d2hY?=
 =?utf-8?B?aWtlU295RG9ZTW1wU3JxTzh1ZFpWUVBFUVRySlB5Wmo2SVBnOFRkSVQyTjA4?=
 =?utf-8?B?U0VvRnRIOUN3Njhsd3ZQdUw2OVRHWkY0NTM1ekZZQlF4eWxMeVFpSmdrL0Rw?=
 =?utf-8?B?VkNHaVI2L1BQcmg2WDRZNXhEckZMWUg0aGw2SW1GMGdjR09kMnBIdGpoc3cz?=
 =?utf-8?Q?r8mvVVTsmuGPqNQrep7404cPL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 984ee48a-9056-43b3-6de6-08dc3132d580
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 10:09:18.1939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeNORY+WiXyQzG8tTGPi27Ff9wOhMXE2F6BbfHZu4Xk1hZMzdoz4oBGArk2CVXoKzu+XT/Rh+B6KSZHBFyGabA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
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


On 2/16/2024 8:52 PM, Matt Roper wrote:
> On Sat, Feb 03, 2024 at 07:05:34AM +0100, Nirmoy Das wrote:
>> Add capabilities to engine struct which can be used to
>> expose various capabilities of each engines.
>>
>> Add wmtp as engine capability which is retrieve from
>> GT info.
>>
>> Take a field from the reserved for that purpose.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> We'll need a userspace consumer for the uapi and some simple IGT tests
> (e.g., making sure this flag never shows up on the wrong engine types or
> platforms), but once those are available,

Thanks Matt, I wanted to get initial feedback.  I will now sync up with 
UMD friends to create a pull request for this, and also work on  IGT tests.


>
>          Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>
> Matt
>
>> ---
>>   drivers/gpu/drm/xe/xe_query.c | 5 +++++
>>   include/uapi/drm/xe_drm.h     | 6 ++++--
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 7e924faeeea0..10981b46c56f 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -215,6 +215,11 @@ static int query_engines(struct xe_device *xe,
>>   			engines->engines[i].instance.pad = 0;
>>   			memset(engines->engines[i].reserved, 0,
>>   			       sizeof(engines->engines[i].reserved));
>> +			if (gt->info.has_wmtp &&
>> +			    (hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>> +			     hwe->class == XE_ENGINE_CLASS_RENDER))
>> +				engines->engines[i].capabilities |=
>> +					DRM_XE_ENGINE_CAPABILITY_WMTP;
>>   
>>   			i++;
>>   		}
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 50bbea0992d9..5dac079e64de 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -247,9 +247,11 @@ struct drm_xe_engine_class_instance {
>>   struct drm_xe_engine {
>>   	/** @instance: The @drm_xe_engine_class_instance */
>>   	struct drm_xe_engine_class_instance instance;
>> -
>> +#define DRM_XE_ENGINE_CAPABILITY_WMTP		BIT(0)
>> +	/** @capabilities: Capabilities of this engine. */
>> +	__u64 capabilities;
>>   	/** @reserved: Reserved */
>> -	__u64 reserved[3];
>> +	__u64 reserved[2];
>>   };
>>   
>>   /**
>> -- 
>> 2.42.0
>>
