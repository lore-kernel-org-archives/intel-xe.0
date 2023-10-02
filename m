Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BDBE776C4
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 21:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CC010E107;
	Mon,  2 Oct 2023 21:09:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2667910E107
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696280989; x=1727816989;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KY/nv+/mFPMmctRoVZvLwzPuv0keVjSr+7FNDtjmexk=;
 b=QNK5E30GUdlRwHEUmgSJxaLHsnxQ2K5HqQz08QDSNVaiah48z6d6/3rn
 IpxYhsg6GMQqrt2yF2t0AGF3G6PZK6fVqy51IcGuP8h/xjlIvkqQOsW3X
 BQpdhUtLRsn9Rguy0pUxaxojO0oPhiQxoHlVJwpJhX6kJteYCinbHYFA0
 NjVrDNN/aYVLZFZFHMrlRn/cO+DCJDBoWZBCS3JdD3Jq0cE/imA7A/B0K
 sbOy58jliVB0L5Fbe1uZPZicpBt/RwbAmwBrjy2IUbs4Kud3Gwq8dYLSz
 d6V9JMx+SsyuGtmHKSkcGqlZzfL6QEJxcHWWcC8f83j/lCI/62dSyr4iH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446897808"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="446897808"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 14:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="820999976"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="820999976"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 14:09:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 14:09:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 14:09:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 14:09:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 14:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvpRjW8voJa95nosmmdNQtmrC+B/3TyBm4VIJJ7Iw4SdsRVYdvBfuSZ51xPt/pQRQAwbjTL9u74pe8N/S7Jby2eOsu7api2TWGpcWLxVTvjzjcLWvdVpcszei+C/0YmJuzRr3pLVsnjUZS/SMfleDRCRJX7HVmBOgERIImfMvuOyTtHHVfBFQUBKMkAMa/Zns22mAdGE4/JOsibOhtDTYsF6gGrvjvuJpPJ8MpPt1H7Mqc9ExbfZQM0vWwNGMLqsv4lU5nqTN28xaA5DcEFfF8TJiG1uxxG9AwHQq8T4+QKM7cd78NrrKfS6QSKxUkYgCO0CuVwKzVed/A+ZWSgbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaXR/7Psjo4/QiPRMMRxSew+1Q98xmVU09NHRKOfUlk=;
 b=B247lWIdBfpfrUf+bs9icVNyaNPJRFlDXNIfrOGqvUYUp74HR0znQP7oqIMw3IzZ26WFJA8kRGnqMKoKgYkOTOJLUip+QriXKB9nPawsWp9MAWqYc0Q8L+k9wUw6Rc7wc9EfNT7P3G0bnWoVR231DVgjDNY0uv/Wmu9LUuNXIsZ0+dqX0Lty7CQ/78JcvMz9cZ4r0Di0MURF6QqnXiK3e6JBySBZwLdq8jQU+Dwg5T6QMg7aNqrdm4+ygwJa9qu76G94RhfAju90JsATq7qmk3jJfaXc/SS6HNPip5jFr4rcdrnLXKBNQHDwKCh/0I6fX25s4+2fXHZvJ/3j6YrSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Mon, 2 Oct
 2023 21:09:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 21:09:45 +0000
Date: Mon, 2 Oct 2023 16:09:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <l3yor5rpsfqn7yh4o4kcy5esanx4ef2w3vovbfyaypboxv6g2w@34v7h6iqnhji>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-8-lucas.demarchi@intel.com>
 <20230929204927.GP233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929204927.GP233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd6d065-ba46-41eb-06e9-08dbc38be75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Th5hrH4gEh9SJ+MVHfyZreHpkpcHfONg1DGUIRls2IOCX5vRUI/LCMY67nTOKQ28dCX/IUar2fW/WEbcl3nrDAX3aju+3rhEcaVVBhhdaS0qh4uslJpIaUZ0P/ykz0pbZBNtAhnKg65pMVdgLTq/gXp93p1SjNQgyxO6w3sjW4Dx5rx853aNVqjMI6zS3k0IyX+MHw0CtEhnQEkd6rph5xtFwdwZH8Pwi9jNGD6u430d01PuvFA3PixyLSr00EZ5AnSwq13s0P8cO8FC2gegAgNp8wN17CdShL4kesz8WiNNOFkPuwoCRaB5cPiWrEw4A8U39LY4rAiNcgG33FoL5wID+VlbySGMFvkL/RtImlBvq7QVccD7m0XAc9GgmRnbcQ4HLPZCnQj2KFWEB9m0/H7gQAsdyBcEXlrqleVZml2TaZ7BvLannUEGgcJiiZB/ilqJVmbj360sh++ZaXCPe37/+vqENSj4Pa7tkc8zPtX/IVuFpYbkBzgz50tgihmLsil3m4U5hf2eL8xnFsGrbEPdZ558eFg+CGC/kZpaYtCHH6x/pfZc9pPtp6dtFETi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(5660300002)(33716001)(6512007)(6506007)(6486002)(82960400001)(38100700002)(478600001)(86362001)(9686003)(2906002)(6666004)(26005)(6862004)(316002)(6636002)(8936002)(8676002)(66946007)(4326008)(66476007)(66556008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ipwhdT3shERBZRGojZqVm7aK6jcC4WkKICuGs1ho9po6qrnGsLuW4ffsr/6V?=
 =?us-ascii?Q?u9JeLStW/BOxSz6PAZQKILASSUBjTi5ICRvhLzM2xWCsWcFg6SaXRCS7T+V1?=
 =?us-ascii?Q?QVQQIXUKHe471BGsQvPQpDEZgr5jd8ZybMMjxxdSxQEnAbpvVg3+F+2LU344?=
 =?us-ascii?Q?wBSB5vHEbx7eF+K4UwizIpQPRsz0EGqJwEq1+ahJV9fKn2UmBmWVHh3+yJjg?=
 =?us-ascii?Q?2osBffe0PzInGblC6kxrH5DNX5trW0zJYfoBIBifKqltX/YQtMF8TO4NtP1M?=
 =?us-ascii?Q?qW224PA6ZrSFtSehfViAK7KCjjsX4HGIeIDLBH3ZpoVadpo51kZ/RdjCHdHD?=
 =?us-ascii?Q?GW1x//7BaCdXJgVW2Z179vZD70dSAGeXvmsbV8p4B80K4Rfd+uJqHTv1naBc?=
 =?us-ascii?Q?/8mavGTBQLw6/UPMYpewNFssQXlOVoZ7uZvMNiny+f8gjAa/iWtSzqL76BoV?=
 =?us-ascii?Q?5WfuLYgRo/DqTSF/VC9UbqG4HBqJiJi//yLknWzyMcm8GFoOXRnIxa81oNZV?=
 =?us-ascii?Q?KjUJ+m6uK1JuPxA/2wnzTnMSOeAeWaodEZSU5VqOhg9fwP9dPqrxree+3IWB?=
 =?us-ascii?Q?Am5cleNwBXHxzs+yhuLJoYBMYfB/OBLZUpvuz13G2vcSNT6KtJ8zDX94uQ1T?=
 =?us-ascii?Q?5gIG5gs5eXDgZOsiMRSsUmzQ8rBI5hf5n4rOBay9UFKyfmsNDKv1AoXksZoX?=
 =?us-ascii?Q?p1M9aSCmBBiU7vgr8kNRufLhH1IXF+1PKLp4TX8chv3yhhT36MS4CRPllzkC?=
 =?us-ascii?Q?liH4DAu2ziAhtYvprnhbtEXXuRinhV+T1qm8Mwnn9MpVLsa8BUo8od/12ToY?=
 =?us-ascii?Q?d+qEq6PCiRyCxhqQ8XnN3p2qTlhyFWJuxlUhZE3yaAqpPe3Ld1P8jXBkKn35?=
 =?us-ascii?Q?KYBzlu6Cpuc+oTHHssBHwKsAZDO9+G2RAdqugq2S5bvQXaRpyKpe0Pqri6Z9?=
 =?us-ascii?Q?m/bw2fSHK2QC0fJ+EE6GBchRMYlWqVWAIWUmBc7Feox35AGASW7Psy1e4f21?=
 =?us-ascii?Q?z2FBTL8B7ip4zV++xCl3h9s3gOtYd2siAz0k2HEZ2SzmISIvqppItvG5qI4R?=
 =?us-ascii?Q?FpgQ8LhPHQo9EaqsGsIRI+zw2vvfkaslyOLwmQhIRYSQCl9hdaYH0e2bq9Q/?=
 =?us-ascii?Q?eda9/YQ7+zS99489SfF3Pitqvl1NCeQ+9/6wzJ+5j2zqUWQn/FRqP9AM0WeZ?=
 =?us-ascii?Q?jxLI/aS+j2s5N+6XI3uIWVeTXeTPncLJ24YR7UrlXc1uSsINPQ7u1MdgmGnv?=
 =?us-ascii?Q?eD4Es6h6+VYjWkrA42WQr53rwioC/p0Re/I/zxh7kS9uj+ZdCLtR0n+QvtiY?=
 =?us-ascii?Q?AYGjd0QhteETvlQZf3kJwZuMQDDW91ZdTzLraQjmMB0tKcvVwzkmFXDQ4yOj?=
 =?us-ascii?Q?kv7K1vqDBU02TrDmoLM+Ws08tsPUrdKn5VIKE8iFq3FLrRkmlvuRdmZzc+8Y?=
 =?us-ascii?Q?yIz8E8LXQ0eV5mMiD8yrmUztTo+GOsPtkuRFzitVnfa62KqkV37ZZEwB3NZy?=
 =?us-ascii?Q?mwtPM6IXftKqN2gqSkZDFWSRJ3i7JkSVb/y3b8O/7EiTYuyHpTnV0zSBjlrp?=
 =?us-ascii?Q?iSODLVLXGHgNVSGNW0mZMYivMqwye1JmF0TRAryPHeX5BdJYaenFP4VvCloC?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd6d065-ba46-41eb-06e9-08dbc38be75b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 21:09:45.4470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQELAxEun8939B979Sy3fM+MeosgvBgriCVPnOrI+FK9f0zrjydzKXOEM2W/Dp3a+9puogYwiYIhm/E9m9Bzk8Hsnm6xaf+plni612I3Ed4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe/gt: Dump PAT table when failing
 to initialize
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

On Fri, Sep 29, 2023 at 01:49:27PM -0700, Matt Roper wrote:
>On Thu, Sep 28, 2023 at 10:02:53PM -0700, Lucas De Marchi wrote:
>> When failing on early initialization, one cause may be that the PAT
>> configuration is not correct. Dump it for ease of debugging.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 1aa44d4f9ac1..1a750c88cdd6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -307,6 +307,17 @@ int xe_gt_init_early(struct xe_gt *gt)
>>  	return 0;
>>  }
>>
>> +static void dump_pat_on_error(struct xe_gt *gt)
>> +{
>> +	struct drm_printer p;
>> +	char prefix[32];
>> +
>> +	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
>
>Should we put 'PAT' somewhere in the string here so it's clear what all

the number are being printed with:

drm_printf(p, "PAT table:\n");
...
drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", i,
            !!(pat & XE2_NO_PROMOTE),
            !!(pat & XE2_COMP_EN),
            REG_FIELD_GET(XE2_L3_CLOS, pat),
            REG_FIELD_GET(XE2_L3_POLICY, pat),
            REG_FIELD_GET(XE2_L4_POLICY, pat),
            REG_FIELD_GET(XE2_COH_MODE, pat),
            pat);

So, I don't think we should add another PAT string.

Lucas De Marchi


>the numbers getting dumped are supposed to be?  Or else add a
>drm_printf() to add a "title" before calling the dump command below?
>
>Up to you.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>> +	p = drm_debug_printer(prefix);
>> +
>> +	xe_pat_dump(gt, &p);
>> +}
>> +
>>  static int gt_fw_domain_init(struct xe_gt *gt)
>>  {
>>  	int err, i;
>> @@ -360,6 +371,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>  	return 0;
>>
>>  err_force_wake:
>> +	dump_pat_on_error(gt);
>>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>  err_hw_fence_irq:
>>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
