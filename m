Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA5EC072A2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 08:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CFF10E5D5;
	Wed, 22 Nov 2023 08:26:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCEE10E5D5
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700641559; x=1732177559;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zTIORuscW7duW1lM8Tw1KBlTnvS8PFD4hl2fP0iK8lM=;
 b=DkgtUUrcVcrDS1hkE8IWPWF2FdzcjTYyavKeZ4ijU+g2h3W2uATdxl98
 WNM9XfNFCpRypaYMKbtSbUow7Ie8nRr5xAoiVmPZ/J8brA0633VRtwQFv
 /2vhCM3LmyYgCKAhkkHAWEMy0kSf5JuTocBpUK0xDILF0v0CKOweVCjYa
 zg6n5NcDG62+r3+jV8qXmabHAmlWB9xfJS/WNF8pPbhXpQx5PQ51ZboRb
 CAs9MjRibO3EUn1LAht8ikrkjwAdn+8IKStxalMRBJw3yztr50MhAqbQz
 3X5vG1eiMuCj0pS7Kg9k3v6+t4IeyFna3ILG7cVdVxEsHf0GwxxvbGr6W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="10673005"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="10673005"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 00:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1014169053"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="1014169053"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 00:25:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 00:25:57 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 00:25:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 00:25:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 00:25:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEXOiqaO3+fG6HruHkrBShwdOCxF7dTmSDTUfw2c42EMjcc2kPk3l5S1OXlD+XRp8mTQr4ZEqaGXJmDKoXdxongRYP3qR9QTbzXkGvwbv2mQy57vAKQQgcV0QYBpzCYS05EM0BZQ2jXEmdC6IqxRNGVhX1ZESf5YhQ3Pk6BOfguQz2v79IBUQ/ND0niLN78+pBhXq7abco2hdQcwJdy6pkHhTUgcQ+glQPcCticy6zGiaBCreOheQl+EmmS6Zd/+Wsmlkdjqm5TcE2CptrRHa0Bl43T12Hf+LMoAbsBEJAzblLMZqHrPvJ8lr7OAq9R0LxoziQ1scZpwQ8RIgsxi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2erU6vJBOKD5g83X5T37cqQR9ge3OJLi4p3MykG0Q+Y=;
 b=Y7DBaHECn4YgWtoGlWbvJW23cgA9C78JuKDHJ8xV1vbnmSQoQnBktBrR50Ef/3y6o7P9rEUaAoJNNlSKb2kV/MSKYF3F5K3rxdJlNR4sc24ie07LcjnBmF5vm0xqNz2qqaWv9Zvs5uPiizlr7gJfdU5LdyRKVBXR6BHbfcE/0Y4M7G7CuUq+3sr7+81AG7InDabmXzMSCgWWnCysaBd0vHV8OSD8Z6EW03iz7qn7QlT7NYOIlVIhn6zMnS5lYebM5jYZjPImYIH7ef29V1kQrQxr8iPf0li/mwFEew94Bl2jwZYgtkntlZKJWNwsozGJbLm6SKz8LW/u1LIkz4Om+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com (2603:10b6:a03:37f::18)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 08:25:50 +0000
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::4cbd:d777:1e37:e6bc]) by SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::4cbd:d777:1e37:e6bc%4]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 08:25:49 +0000
Message-ID: <8d8d0ab6-425a-42af-a0b5-77e8e6f51269@intel.com>
Date: Wed, 22 Nov 2023 13:55:43 +0530
User-Agent: Mozilla Thunderbird
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Riana Tauro
 <riana.tauro@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-2-sujaritha.sundaresan@intel.com>
 <27e7aba4-6048-4023-ae71-f1501bca570d@intel.com>
 <8734wz7lee.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <8734wz7lee.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5664:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe40193-73dd-414d-4b66-08dbeb34a1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2YfZUyStPnPiEqW1QF9CkXvYvDjFuiKdZc3XsVVpcrVN6FAxuMLIZLWeQ+8icRDP9Sr6uYSZVPVQbZE/j6sXDaOt+F53QpwYvOi9Af71DbyECva4ZyoQeNpa4qYpI2sLyd42M7E9JF+9X4qxQCCYD8KUGkjz/2xi3YHl5ph6xRfeWFocGIOdeAzsGbTt4PtnTPYD8VVbf/gzQNL6NSSsCFdrT7/a5dBNs01TDY8CLEOiHspAIDawKQI6WnSY+pUNoz5m7wATWFN6tFpKMvb+T98o1hPsCq48g0NUSTna7AGzKk7IGP3YTOgJECOAz1P1yOGwIxTGKIGFlP87caMwFJcGYVFNXoXBDiwIRmQKLU4NLSOwXlYn76IhiPlL6x1BqgmJUv1H1yskK6MFmyCN8splxkV09t/QC4iIGUiqyvZpiUYkhkBxcIp8qNlVUxZTnh9BLqPY+7d/DZ3Qc+xM9mSijUjOYtf2veF7nIvz0DXKKHsrBiURgRyVxzw0euaSS+XmbrIQIw68JS3ekmSe2qYKLa11CUbDnHFqq5AwFgMFj9dXoN1pqRPWf/XQ6AA2+6LT6mHl/Y7U6RIp4+EWh1/laJ84GJzVn1bu3m+kAazirI0/SQb9Xr8VRYFOgxuqrIpHrRGIaBAzF+SwU5BvYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5664.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(5660300002)(2906002)(41300700001)(4326008)(8936002)(8676002)(31686004)(316002)(6636002)(66476007)(54906003)(66556008)(110136005)(53546011)(86362001)(6486002)(107886003)(478600001)(26005)(6512007)(6506007)(6666004)(36756003)(2616005)(66946007)(38100700002)(31696002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVR0QWw2ZVZpbEdwYjBqR3daSWxXSDR5UjRMa0xGMi9yZkNHQldLWkZvaTM4?=
 =?utf-8?B?SWs0TTJjRjhxNCtSOGgwanI3aGtXeGszN1A0TGEwNkNocHRkZk9QTTU0MzNu?=
 =?utf-8?B?cVhrbjVlMWxjbDlTMTYrWFl2T0MyeFBGUnRiM2RWM2pOOFBHWEplMXZ3TlRY?=
 =?utf-8?B?UWFaaGpoYng1NVZJdDNTR0NVUW1meXNnb0pzby9FWnFLazdtMHM5NG5hY29u?=
 =?utf-8?B?YTdJMUFMM0h3bFpYNjZtRzhVMGllUjRLQi9ZWHpVcWRkSDJLcjJyUWlOZERV?=
 =?utf-8?B?WnpMeW1TcnlGajlOaXB0dFM1aHJmLzFKR25DbDEvZlhDRVdhb0lURWdOUko2?=
 =?utf-8?B?UkkvYUF3eUtIWEQ2QXBFemFSZWUrRHZYZC90TTNwUzFmMit2T1VYMTFFcGov?=
 =?utf-8?B?dkN6V09EVlFlTjhPVDNUTHQxUEcrV2RQcXR2MGRKSnRqUS9ENnl0cmM4Rzhp?=
 =?utf-8?B?SHhib1ZtYXlnL2NwUWx0QUM0TzBNYmlQSEpqYUorQjE2NTlVYlhqczFaZTB3?=
 =?utf-8?B?aWI0OWMxVkdOZDNpQUp4Q0xHZDI4c2IyT05sblhmZUh5ZEVFODk2L1ZxUFhB?=
 =?utf-8?B?OTdiNkR1R2VVOXp2K1B6U0RuOHJCUTJEUldtVER6T0g5ckFWMkNGM1h6eWIx?=
 =?utf-8?B?Rkh0YUE0OWoveHRjZEV3ekF3bkNnMjBuMEtrUDlSY20xZVZnQUNhbkplMHdm?=
 =?utf-8?B?Tko3Z1Rtb3hUTU5YR3ZLckgzZDhrUDhsN1JyblNxZSt4NkdpY2tVU1QyK2RP?=
 =?utf-8?B?bmdCY1pPcXorWCtZQ3VoMHdPd2VpKytFSVhFQlRsSlFSR3dKVkU1WjlTcjM5?=
 =?utf-8?B?cWJjbXF1aU9uTzZWRkVlRGJHRTgwa3lSRjUwV1dhWkRNVHBsYUY4Y0x6aDlj?=
 =?utf-8?B?dG9kMms3dS9uSEdLTGNmL3hxVXhaN0UwNU84bUxINEF6QkFlbUNaUkF5bFZX?=
 =?utf-8?B?aTFES0x2RnM5SjlITUNqYkNUUVFEalh3MUQ0MmF2eU82M1NUempkTEhaNkc0?=
 =?utf-8?B?SWd1a3Z2Q0NXcXJpYXZ2NElldFdKRXhSQ1pUT1QvY1VmeDVtUHRzL2M1ZE5l?=
 =?utf-8?B?d3FwMktZZ0kxbVBTNlZIUGVURjdUU2ZxT1BkS1grdDdPbjZBeVhVQXpTK1Vv?=
 =?utf-8?B?cjdmbllCMXV2NHVGVUFpRHNtZUx3OXNPUkk5MjZRaXRjZ3JmT3BJWFZ5Umxr?=
 =?utf-8?B?UEhFdUM3cWZOUkNrbks1ZU43bFNMZkFMMHRVWVIwbXJUVDlQdmhNOTN3TFp6?=
 =?utf-8?B?ZURBNWtaQXdZSExacS82QXNvYzQ5MWRaRS9QeSs0QjN2aTlIZHdWV0dCVmFZ?=
 =?utf-8?B?VDZ1WGpVUklNNUhralduQUFvZll6b1FyVEVmQ2d4S0RSTldvN3J6NlBqVngr?=
 =?utf-8?B?NnNUUk1jZy84cWR6SFE1MEljTG9za3FrOUdOWXMyeXBMT0Y4VFlMUVppWDlt?=
 =?utf-8?B?YS9ZbXlKQ2pQZks3QThidXp2NXZleC9JYzdGeXNtMitJU3BMUy9qREpKa1lT?=
 =?utf-8?B?RVplUi9rVE1kdXAwTXoyQTFJQTBDSEFxRTQ2eU9OMnZldlBCWm9YcGFLaEtT?=
 =?utf-8?B?ejlLNXNoQ1N1Tjl6Y1kyNE45UUx0NllObTdtSms4TWJEeGcwWHNEZVNUZWNB?=
 =?utf-8?B?aVFkc1VUVnVNdllYTlMxTDBtYzZjYkRTUFZ3NkIvNlJCbjM0c2ZzMHlCMUJt?=
 =?utf-8?B?SFFHZllsaVZqT1pSVjFxR0VIKzg1RGZBMEJrRVROLzh1QVVwbEQrUVg3anlh?=
 =?utf-8?B?UGVtNytFVlBVclVKak5DczNHdFgwWVdFb3NVb3JSTUdERXIwdW9rVTdxVFVG?=
 =?utf-8?B?amgwQjlacWZDNm1vbzNWSEhWK1R5REQra01zY2RYM1kxOWpyckQ5ODZQYUcx?=
 =?utf-8?B?eC9RYy9TcTEzNXc5N2FGQlp6YnllNjhTMVlBcElXeTJWY1BacTN2R0R5dXpV?=
 =?utf-8?B?cENDSzRjZ2c5M2l0eDdsQ1Njdis4OUJwQ0k5SzBWUWVmTVJYbHMvNzE1SHU2?=
 =?utf-8?B?b0puMWFWNDkyKzI2eVdMZ3pRd0s0UGdRd3dJOWYyb2FSd3ViNy9MMGVIbGNH?=
 =?utf-8?B?VmE5MjNTQ3U3MjNvS3k1QVYwM2JoNzNqbDNHbFdyOGJldyt5M3VlaGJGSEx2?=
 =?utf-8?B?eEw1ZW9aRWQ0Nm9BRkFCN29CSGl5OFI1M3ZZR0tRRGcrdUE1RjF0VDFUdlhR?=
 =?utf-8?Q?w+gzKhS80O8uLWtHeVSmczY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe40193-73dd-414d-4b66-08dbeb34a1e5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:25:49.4125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vT2AGVAMX/g7QWisxJi21Bluobf8roXLmAnEFWVcoGyc3bWXEt9WTfHi5WwJcBoCbm/gUhDA3GpDvWrxje+79Rvp7c/z7sVjzRc2yhAR7LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/4] drm/xe: Moving and renaming existing
 frequency sysfs attributes
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/21/2023 10:28 AM, Dixit, Ashutosh wrote:
> On Mon, 20 Nov 2023 20:50:00 -0800, Riana Tauro wrote:
>>>    @@ -950,6 +950,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>> 	struct xe_tile *tile = gt_to_tile(gt);
>>> 	struct xe_device *xe = gt_to_xe(gt);
>>> 	struct xe_bo *bo;
>>> +	struct kobject *kobj;
>>> 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>>> 	int err;
>>>    @@ -965,7 +966,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>> 		pc->bo = bo;
>>>    -	err = sysfs_create_files(gt->sysfs, pc_attrs);
>>> +	kobj = kobject_create_and_add("freq", gt->sysfs);
>> Handle error here
>>> +
>>> +	err = sysfs_create_files(kobj, pc_attrs); >	if (err)
>> add kobject put if creating files returns error
>>
>> also clean up on finish
> These are needed too but won't fix the kernel crash. Look at existing sysfs
> functions, at least i915 has those.
>
> Hint: the issue is creating the new freq directory.

I think overall, since we are looking to add other sub directories 
inside the new gt/freq directory, it's

better to have that be a mid layer as Rodrigo suggested in the review 
for the throttle reasons patch.

That will make it easier to point to the other directories being created 
with freq as well.

Thanks,

Suja

