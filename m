Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A170AC001DE
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 16:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5907810E19E;
	Tue, 15 Aug 2023 16:42:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCC110E19E
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692117757; x=1723653757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aViwkbFYmevt7ecodmxdm4UtF/i8SkNSRicQ1u0pn18=;
 b=AVvGag2ZZW6g0lfEjQ39gFOBvOPbmL/iKQ2PfOH3z0lTqRbGzlt7TKat
 YhnKyQxu9DgsnnZwiBRKYw3bEqRtnsR3H89dSXiOVu0rAIOlG7qPMoWx7
 LXhjvvoUfqomfyhLG8e1XYJR5E2tvI1O7LtgjvnViYg1IcBnQH1dychfQ
 Qm8U+TZ9MaU7hPHXM0xxgIvJFhdkf8SgWyD6LpDp83ede3xSiMVSyDwWI
 S1R1v2xNbZolBngmS43UL4FQ+lzM1/c3T5JeavvK3C8YKB4N3Af3S4aIZ
 DQpipgOeaoCd+cv3b530rP4tH86G5shSkeFYoWvp150u/Oz2NwrIVoP4f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372319829"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="372319829"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 09:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763329612"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="763329612"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 15 Aug 2023 09:42:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 09:42:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 09:42:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 09:42:36 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 09:42:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuQveHg7n9qiI5UuIvXEYt8fl5ddSCSRRN13WadXEsBkZXEXwxLBG5oFEq57T87N2zzHc9yCa4AXQj2T0J19I1ql16MvWuVPNwyt9wlUECAiK2DXGZXwVY1/KQJJz+5NjRlc/SX3rGCelwhi4uQDboXBhN3Nz5VKUKyeVZXXRCpyebNFHfKj+agV+nWmUwAOqblgKgyphxuoeh5OJEQuz9mphpB5iPTO8gAROFsoVUmGM6H/74HIsElckPmucr6ScV2tq/vStx+QkpXSgJB7tpi6HGDK0TDDnjkhhMwr3mrOk4gQT4vV4B0anS1joC+81hsQnslMkwFVoUksQkWVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/2Zdolxed8I9qMCkd034GFkCpnIDfQr3TsCBTtGRP0=;
 b=NMHsLi77eaJi9cpHuxLyd+N7Af2zRMa3i5D5Kh9YL3Xu6Qgmx3xvF4GNjh2f9JoZXccI8wkEbN/WrDcoj70KK54SwWzf6fhhjO0I9FFt2hCIRTH4nWX7i2AAQauBsCXOn5C7IGmuKf2volJGrFFfFmeTr9SlE5Rx6ThqIPwGkDQWjpsiySHTun0Jk0KjUQgsEi7+bhVFHQeZ5EoBw2zot5+7Z0leBCNrKNIrlEMHVV/PZ9APfD4nNe8QDOPDrC16KEiVnvvSHW/b9MRRioYsAJ9Rs+HPjAt+vZFF/I4SYNBRjheqtIssidti9W7D6iWOE5Yby9d2BZ/ZkPMBJopWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 16:42:34 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 16:42:34 +0000
Date: Tue, 15 Aug 2023 09:42:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZNuq95CttQ9V97kJ@nvishwa1-DESK>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
 <4793cb528b5977e3bca6fe9d2883fbd8acd68625.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4793cb528b5977e3bca6fe9d2883fbd8acd68625.camel@intel.com>
X-ClientProxiedBy: BY5PR20CA0014.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::27) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA1PR11MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 067517a4-e6f1-4d5b-e8bf-08db9daea014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNDpaA+dyiV6CFdmtB1Zz87ni0D+IndZ1TuTjS5n6Pk5jUlqKjHb+mVWKVltavLVNH+3W6mazP+ZwpWkmpLcJdB7sN+TQ3a5QSF1ep4wZljzsDDzU0VeWs9Er3UNj21asWSfmSYeoF4/DfTkPnY1wCdKg1mOaES0COF+vOv6tRY+q7y2Z130Jvdxvpq2YxZVhboYkHmPcrhdcQR+RFKp41ACs5GkAOWKaqXN9f86j5xM3EsWBjAn2nw19j2eC4f86KSBdwwebwk7wy52Knp5CCG///08ItKka04EzqacQruKmpbPr/nkdYPAYBVfc5GvNSuWOwDIFRkiotybIwLBaCT6rPpFkX+9umsHU8BmkrqzwISeQpNuj/EC7PloPk+L9ANfjicBCc4DLWVB+LzqTC9q90jKK6+y0+Kk9HE/83oGeoYX2SylHd1v9NlGPfmgEQzemthPZ0QhUg0LRy73MHx4fFNKXNLNC5BempfaXSqXwwmJiiwCmGCPSocanrRZesuiv4RYJSPaumWQxSHDqPau5dW/rX3wWdXgC2eFeo7XL4C4O+fci90g/0ppas/r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199024)(1800799009)(186009)(478600001)(6666004)(86362001)(66476007)(316002)(6636002)(66556008)(33716001)(6862004)(66946007)(4326008)(83380400001)(41300700001)(8676002)(38100700002)(26005)(9686003)(6512007)(8936002)(6486002)(2906002)(6506007)(82960400001)(5660300002)(44832011)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9DQrUmNzNkkPcGERuqhGJeIircBXwWBntzBXedyVF8CoKe66mEGlxAnljlVp?=
 =?us-ascii?Q?UKVTrY9uwbLGkiE8hM0Suu+2a+6SoD3bIFdinz9Lx/hQJb0BWWLMAhWNMhAP?=
 =?us-ascii?Q?HU4oS+DaScbGXEL6dCH+qnyWHx10QH9i3kMjvYKyleg+IWrflzpJuUIyZZhW?=
 =?us-ascii?Q?aqgI/HMzjfHIfGnF4LJQ3gRNPbIQz3pyWt2dCwb+H9P5XpfeqF4BnjffmR74?=
 =?us-ascii?Q?/SM7hi0HTyy2KG9Ur/es7JYaGWWMgFiQzcW1TPkbg38rinhp1g2gEVoPcY5X?=
 =?us-ascii?Q?zmFjdvMykYYQoFQ3uF/tDqgOUBVO8qK7zqeSba/5yha+/uhxEmtVMaLPwmzi?=
 =?us-ascii?Q?+Pt3H1JlvOIrAMaiwaht8fMEZ0a5+sbQlMD0kXm4mSo3RqMF3ell+re6HHr2?=
 =?us-ascii?Q?oXnPBQX1/E7RK6P5jTvfRTWyI3n4l52LzvdpytpnmPTfTRiS1v7MsEzr2Kn3?=
 =?us-ascii?Q?FpTNXD178mephtFuGxci25YG2d/da2dl5pTJvaqtOXFA4qaLy/jCO90r+jkm?=
 =?us-ascii?Q?NrodsxCuXyqJcxT4tzsSKNCoO1wtbUTB4S4doIwlkBZ+IXEWx2yLXjPvA1HU?=
 =?us-ascii?Q?OorxEUe9nCZXm3PTJPPDs4HgrUcjgrgmNrhffJSuhPwSZfS+u31SlCwV9Tji?=
 =?us-ascii?Q?lV8NQ/TTd9X6W76LblHjvrhSyLdnaIzNP81WPWVoitUlRaODTZTVpdUS6XJN?=
 =?us-ascii?Q?Gs4nDBkKbuu3lZYeWXskHZ7RF/4wJmGS3Yv5/wdneFlzKzwFr2lHChvFawkJ?=
 =?us-ascii?Q?ciYohse+HK+YHrD1YD5m4eZOxWwWwZ+nS+O/w7XqqB1JLV3V60voYLmgbTcm?=
 =?us-ascii?Q?8iCdf1Ou688N4QJPozK1GDWw3mog0qe1x1+itTgz8IDxb4CfUiyVdG6H+wHH?=
 =?us-ascii?Q?v36Ab6e3gmYeXY2NuBqlG4zsZKnmU2+cPf5wfTJD/LkJ333mhwik0otTLNQS?=
 =?us-ascii?Q?/JcT8uRVldgkkPHaqKfaZRF/Pg54Q3KRo/fan64lrvWsGzs1YVNLO6PEb7Km?=
 =?us-ascii?Q?3qN1A/DrX1mXXjXOnaPIPxbAp38ro7cJ5oIza/1mM0OechnJCRxrVtnjQ1hf?=
 =?us-ascii?Q?KzV70Kpc/mhsOjuDW1Z7/u3kmOfuQ1R7fzclBE3Yy0zY48O/o/FkJ7i2997L?=
 =?us-ascii?Q?oLLzkWVYCSltw3jLq0h8dJrXNk4a2kNaAKKx5CGSXLwMIDSFjrGryT4LKoHZ?=
 =?us-ascii?Q?jLvyWXqV5UPDQPmt9aKIXXEAbQEiPYQf/UM6T+sgCqsjL2/wdHNMaWPuOOnq?=
 =?us-ascii?Q?FJznZAg5p8ZwDWjBNmjWN7Z8xzPuIsjxABA8m9Mj6mVSViQCo4o2EeVGwKN/?=
 =?us-ascii?Q?snb2IkruYeAN4jz6uxDHm4aFX1l1iq5raCcX+qI6I8SL5lMG+vksEkTNnC9e?=
 =?us-ascii?Q?wCMhYwBxz5MByw25SaswIQM/FLXruyrPXI7dw0wDgIZrEG06dzccO/wWpnE5?=
 =?us-ascii?Q?msZ8wkx93KZJtmOfdwGHhhBmfmB5Mg8FbTidTWWGffAx1f6vsyjFpZ9BM66I?=
 =?us-ascii?Q?TNoTyRYOp/1M35xO/jHkJOBhtP6e37AUqnUec+1G/DPcHVeRI8LUPe62/7qz?=
 =?us-ascii?Q?v3knvxPO9SXT2b9KioUXEUCsY4YO4lFrD76MEtZHUcdWZsT7zMoblmZtORVV?=
 =?us-ascii?Q?v2v1v4KUjiG1J05UvtfewTA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 067517a4-e6f1-4d5b-e8bf-08db9daea014
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 16:42:34.0043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X58t+reCrsEOTWNYyeMLi0lfU/j/efYcu0B2W6wFU48ef5Dkqpjc26i3mVn4EcVJ1WyDUl4slQbUmBi28W8rykMvGX1rPZRfcXWTHftGaGTGfKk/TVp6k0USzItddsaT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: "lionel.g.landwerlin@linux.intel.com"
 <lionel.g.landwerlin@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 15, 2023 at 02:03:42PM +0000, Souza, Jose wrote:
>On Mon, 2023-08-14 at 15:37 -0700, Umesh Nerlige Ramappa wrote:
>> struct drm_xe_engine_class_instance might get padded for 64-bit
>> alignment based on compiler used. Since engine information is kmalloced
>> in the query and drm_xe_engine_class_instance may be padded, it could
>> potentially leak some kernel memory to user.
>>
>> Add a rsvd field to struct drm_xe_engine_class_instance to make it
>> 64-bit aligned and zero out the field before returning to user.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_query.c | 7 +++++--
>>  include/uapi/drm/xe_drm.h     | 1 +
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 99a4800c7c53..b9d565264ceb 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -65,7 +65,7 @@ static int query_engines(struct xe_device *xe,
>>  		return -EINVAL;
>>  	}
>>
>> -	hw_engine_info = kmalloc(size, GFP_KERNEL);
>> +	hw_engine_info = kzalloc(size, GFP_KERNEL);
>>  	if (!hw_engine_info)
>>  		return -ENOMEM;
>>
>> @@ -78,7 +78,10 @@ static int query_engines(struct xe_device *xe,
>>  				xe_to_user_engine_class[hwe->class];
>>  			hw_engine_info[i].engine_instance =
>>  				hwe->logical_instance;
>> -			hw_engine_info[i++].gt_id = gt->info.id;
>> +			hw_engine_info[i].gt_id = gt->info.id;
>> +			hw_engine_info[i].rsvd = 0;
>> +
>> +			i++;
>>  		}
>>
>>  	if (copy_to_user(query_ptr, hw_engine_info, size)) {
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 86f16d50e9cc..53cd57342620 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -753,6 +753,7 @@ struct drm_xe_engine_class_instance {
>>
>>  	__u16 engine_instance;
>>  	__u16 gt_id;
>> +	__u16 rsvd;
>
>I don't think this change should be fixup, as this breaks the uAPI.
>Please ping the Rodrigo, Matt Brost... about what we should do here.
>But at least you need to sync with other UMD contacts about landing this change at the same time UMDs update their xe_drm.h.
>

May be a 'Fixes' tag to let maintainers know?

Niranjana

>>  };
>>
>>  struct drm_xe_exec_queue_create {
>
