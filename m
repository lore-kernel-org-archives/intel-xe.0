Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C3EC25B7A
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 13:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BA410EC05;
	Fri, 24 May 2024 13:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3UEfTKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5B710EC05
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716556511; x=1748092511;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pBIILBTIGt7t0TH4ZdowtXL4p75X2rugDSt/3/z63fU=;
 b=E3UEfTKLpkbIYdxQjtANsLz220PzJj9KiqB3rTnU+cwkcAKIfCrdiPSW
 hf4vkjmu6a6F1ZaflkRf4RuhKcYz8893A0RqzoffXmQFBOFizxIgI5bIN
 BW5HwuMwpFuSheYRN7WkWG/1KurClAq3DeyAcKWo5CvadU1gvt1LNRKrU
 FgsFA8bP0oj2VZsH4+7zWB+zP+/m8XoFPbzlCHOMfaQGyJ2BacnK/NNel
 sxk5Fesb/M7JITgUTUvgvpZUa4I49nkSfsg+CPZB/tikR9XRkPBaW/gQg
 6F5+CJS2xUNbepT8VOCltTLWK0gJdkkIxNKXWioYtt0F3VO388aRp6myL g==;
X-CSE-ConnectionGUID: 2aCSuB4WRROUcZKh43WQlA==
X-CSE-MsgGUID: 9jtozC8hQZaKTrnhKolrPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23501407"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="23501407"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:15:10 -0700
X-CSE-ConnectionGUID: LE9gZumjQTS9pM/wZmI6Ug==
X-CSE-MsgGUID: 7BdnIg+zRlyuJ+1DmfTRFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="39011257"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 06:15:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 06:15:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 06:15:09 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 06:15:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+6fOxnJICfi+BHfA8H4nUPy+6WFneM660eS+4aMho6BXXUidM1QbXgtyguV1MhF2emEBrT4dCrhptIrZGrWGqLmtsTj+vt+7voCixXEG3MGCda9uqiy1uT3HAs6wlfugsBQVKgIfoFGW6CWBY7Jnsqp7GxVswDWIvt9b7QF1vFKZkdJdSmHzPE34LDMmvz7YGTLxUSIn0oTiqL4sphCWBGYH5SkLYbCfMffxrAvDLW82DFpRuIuo+U8MZjuXZJKQXEb+IP2w8xEr6aZeh7GPAuqrV6DvDCNCv0FTSHJ61M8Cs3m8VWUTloI2xIwxS3TPqFQud1bxUMyreo9FeLE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0StV1oWMAHU+vtOLBh34njNoSFROfQh7kd+znVgfN0c=;
 b=cD8vp2/hjBl2gJUw9NdYMwCV7wjkcq0Ri5EG1IDIWfiHIKbkZA/w7bkEaE7A0Ry+qjF1z4VfCu2SKUc5gsYHbHcPOa+5MCLZg6rzkktl4BfFyTUOA/yGlFWGBWjv8yXaYNEzbdPZWr2+F6QVPFl+JMMp2sRAr+lq5A+3eQRywyOmR/Ey4yEP6Jfroh7E5o/SLg8GvxmqrZFntXv50Q8s8xFFaKa+UTFEBNXrOLLHuKYn2ctD2V1d+TlfNZpOkLvYP51eQa5kd2YhLFs3W7OOrMTwEnMqK+G3SK2qPP+GQDkirUF+UynsNvqw40TG+OkIqneVMdh1nicFlXAV4lVXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 13:15:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 13:14:59 +0000
Date: Fri, 24 May 2024 09:14:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 5/5] drm/xe: Move job creation out of the struct
 xe_migrate::job_mutex
Message-ID: <ZlCS0CH2ZYsCgbPW@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524071940.83042-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea1bb40-dfc9-4221-ff2b-08dc7bf38354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AJsaO2ZNSHG0ZhFQV+0KzeMe7HZvyZ6/+7GSD3cb7dxdPevEP0aocoMklB?=
 =?iso-8859-1?Q?85mAJK+5pKeqE7m7NhcqGtYTietFpPxN1cmFNkIKNvO5nK/BC1vn2OyXhL?=
 =?iso-8859-1?Q?8p9kt2vab6wUCGaJwVt5HrPWFw5H/71t5se9LLMnUtQPtxAFs0GLExp2mc?=
 =?iso-8859-1?Q?xCafLoiJ89nxJfNlDUfWoYSnxkG/tJiOLJe2zt667EZewPh85wYVugAl1V?=
 =?iso-8859-1?Q?0lBbhYb0biT7VG53jjz7plIVwOHnh1dkxwMizxSRBS53dKRL1yRBiTLloT?=
 =?iso-8859-1?Q?8TOj9/KQp55wFl2GtqGAt21xcydXoXkDNG3WpECbmmBYRWwxcyk8cnMe0V?=
 =?iso-8859-1?Q?0o6VLZAnPqqatYW0r9wvR32yY6DYN9OhLiupKCVZkUpqtH4nUuUP+/yz9R?=
 =?iso-8859-1?Q?JIuEfbdQ1HMAxSLvehF+Vsn5jgVp2GNdH4Hyn4bKUTxJyqH+LYomnrvgFS?=
 =?iso-8859-1?Q?PXEXIWvtoJxu4BPXXtdhOo5DFOaDtEVhYS3tNoDbkzpRVo2/6hEACUtEwd?=
 =?iso-8859-1?Q?s/KCwXNB7Zq+vHYx3VIdsuHiF11oQJ+XOzQSWeGbD552grOV0TuT74k/bt?=
 =?iso-8859-1?Q?t7AN3RQNQjQ6xycKivkJBCYmqjZwxWJFnPFkz1Vb/PynewAAbgyxYjPnBG?=
 =?iso-8859-1?Q?Rs93JmO9J3fgpVxopr9T/S80Ypa9K8CIcDWct9Q2Ip7x7uuYd0WlBuZlT4?=
 =?iso-8859-1?Q?I9ahasW2lUs8b5/GEq9FQxrY2TiqE/DYgrm6/yYB+OscpwWKUOA6fQSnEX?=
 =?iso-8859-1?Q?xFLnP4kRyg8+xB3tqdx4/76wB1JadO1ewquwjp6VGp3bI89DOjUPgpH7mF?=
 =?iso-8859-1?Q?T/l23TwBJifQ1Z2nGw5c0SwiHGwZNK6aVs9KJCLJCtIvcrE5jmT6ctk8AX?=
 =?iso-8859-1?Q?y7GwiKzGSOCrVSQjRZ9BP0ui5QkF3nc6rtLJnZSYhpgeh34EKgK9odQEvR?=
 =?iso-8859-1?Q?3dfzPbc+FNrEoIgcFcMPaAwOg4XWiN5GfoBZiFvADAUDcOZUfXDmNaSAHg?=
 =?iso-8859-1?Q?TslRjsSgnA/t+8kxCltOk+JGk+FhDpvw5IkttLcOSdopvpd2eWahtvAGML?=
 =?iso-8859-1?Q?euozrqaL21peomoqf2wbyLYeqKyw+kAMvwg7UxVGCIH/PBi9wM3/KJJ/+C?=
 =?iso-8859-1?Q?pYVbpokssQhar2da1d1g/0+Vt58U6wRZwpfSn9JF5vG6ymBlmRr7V3+Cq1?=
 =?iso-8859-1?Q?FRz7QD0p30rQ/+B5Is+264cyihnDqqjEEfA8IUr6LOqGeXSdF3rCxu0YTS?=
 =?iso-8859-1?Q?Tm4m9yZinAxB40MWAb5ZYKND2/HDtK13rISRBDVoSAluvaQxubI10zb7WP?=
 =?iso-8859-1?Q?L+rVNAwDAWx6tcNWLm+JYH7PzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wNcCj90i97QWrPd2cai/cjaO+ebhQvABsqAAo32QfhE/zGxXf+J0Vq+jJf?=
 =?iso-8859-1?Q?slTZgTo8Ye/IOTn2QcISAbdJe5m5DsVJ0ePjpTRZ4fQLPaVUSUjehjcWX/?=
 =?iso-8859-1?Q?77FhEAFZJJxUG7t6wsxiPLiRyobaWnQ4t/IN8o/imCgdnPOoFjx/LRC83e?=
 =?iso-8859-1?Q?IcSBXgHHIG+Fxin+lKZdDjj+m1f6vYkFgxOnhXLY8bPy5I5F2jbhW9RwYN?=
 =?iso-8859-1?Q?KbQyv4xzzgBnX8rRl2lqPuHJcvMIBlx6HLYYtPalhLb/ivf6y/NEhl4mT1?=
 =?iso-8859-1?Q?ueGlCm0w58ijXkoig2dEz2lErL4T3BnosLBwJ3c9H59aUNrFfw38+XTQ5I?=
 =?iso-8859-1?Q?rB+Mc0SWvSZgtg7aZr/LVZZZy8MCYOPsrb9pQ2GOSBFoTZ9z/s1vzRC8g/?=
 =?iso-8859-1?Q?/wGa6SHo3gTPHGSeRRZW7s4yUqVgSLxnyEhZB84NZkFtFbxkemNKPewVmT?=
 =?iso-8859-1?Q?lmQs59jVPnmT/2STgP/6V+AyriwZxRxDG05xWTAiIjDXde3NPc6JYutKKz?=
 =?iso-8859-1?Q?LxPgwKibp64hCD9iU6M6WXcTpz9ezO2cSJDN0mCW1Gfg5mNgl0UbKW2cYc?=
 =?iso-8859-1?Q?5SIBst3JT8fk025ktSKv9chrqGFp5RJMnd3FM5a/FbMBiTovsFknNkFjNK?=
 =?iso-8859-1?Q?EyL7Bib1Xe73coq6TMzvU5xXglC3UbQgj2CGNgAqHmR0jH/6vEnizu8Z+V?=
 =?iso-8859-1?Q?zVYPX5i9e0LRX1xr/dx79cRqPUAV/PKIb2MM0KA9uoJz8ffKvh+s3KN56n?=
 =?iso-8859-1?Q?k/1HCgUlbhrXgpSX1HZw9ythCQPL5ymACVz6m3DtxnATzKbK2YD1jWZjf8?=
 =?iso-8859-1?Q?qbyRCKqTpcse2lROu5MU5QQIeyvEJRmAi+XHDVCa6shl3UvvgOZ1YgALIN?=
 =?iso-8859-1?Q?AEwJXr1bKmrDA43PBLk8H673O1cadMBSLSrEIG1jwywY9UJuLC/mV7aUY3?=
 =?iso-8859-1?Q?dkEhstG1LapxYz/9DydPk5oGogOq1l1h7atnIpFBLBT+80WY42V+2DeFNt?=
 =?iso-8859-1?Q?9EKLTX7H4vGMHylLxc2fBTBovGRDVKOqWfc43HvWDzTolATwVErJL4d4bK?=
 =?iso-8859-1?Q?QtT5yBMkiCFo+R6cKD6Rw8CIzWBTOY1AsAFN0CwVCH+PoNZFqulaQSEkFR?=
 =?iso-8859-1?Q?a1QEl+zOy7UAqNT5eHUFv2dupLcrc62ji9kluiXUOkvyGlaP2IVkzwtgfW?=
 =?iso-8859-1?Q?7AzemDFYC/6BHfZTUZUshYtqkAWslB6iyfsK5stuH2yCikk0GzeDHGtQpO?=
 =?iso-8859-1?Q?2N0a5hUJfm7R8zJiQ+BcUeagc3QNQSdEiB3S2K4rDUFruvV1b2eUD0UYVi?=
 =?iso-8859-1?Q?DCQY3qQ2hv1pOcxcSSRTwEAOaBTQfVZIRXeWYFBZdFJeSzp5fk4XlqwnM6?=
 =?iso-8859-1?Q?dGJiZ+lbDOSx1WN2zTPzXZZ1i7EnnB1ZvWitdWO+POTO85txf7e0XCDLnr?=
 =?iso-8859-1?Q?Zhi2qSYymFl1xWJPkH/7DIaSMfIcs6F98MXw0jw0ni7W/uOCv2f+BKNLd4?=
 =?iso-8859-1?Q?29p+RH3Cq0FPjQ/ceeOF1bmzIqYpmz8a34v1p8dJhkFxEIUI2WyztLkPB0?=
 =?iso-8859-1?Q?bHJR69R1YgLPPA9ehg/eTwmbK26StaNTwlTSAESfve1HHCcJDrTROoSfSR?=
 =?iso-8859-1?Q?k+GuXSnK0waxMJsjFUl+sQLMfYRLrakzSn1JcER0G8hH7q1s5e4UStUQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea1bb40-dfc9-4221-ff2b-08dc7bf38354
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 13:14:59.2015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+ObnJQBcZzBi3x+SvRps40vBQHpwyL/VF1rjoOm1SV/OhQuv9/RzCQLMsCJnedb4DQrWpuuDEeNmliGA5dBsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
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

On Fri, May 24, 2024 at 09:19:40AM +0200, Thomas Hellström wrote:
> In order to be able to run gpu jobs from reclaim context,
> move job creation (where allocation takes place) out of the
> struct xe_migrate::job_mutex, and prime that mutex as reclaim
> tainted.
> 
> Jobs that may need to run from reclaim context include
> CCS metadata extraction at shrinking time.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index bacb23de411b..cccffaf3db06 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -383,6 +383,9 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	}
>  
>  	mutex_init(&m->job_mutex);
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&m->job_mutex);
> +	fs_reclaim_release(GFP_KERNEL);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_migrate_fini, m);
>  	if (err)
> @@ -807,7 +810,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  						  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
>  						  src_L0, ccs_ofs, copy_ccs);
>  
> -		mutex_lock(&m->job_mutex);
>  		job = xe_bb_create_migration_job(m->q, bb,
>  						 xe_migrate_batch_base(m, usm),
>  						 update_idx);
> @@ -827,6 +829,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				goto err_job;
>  		}
>  
> +		mutex_lock(&m->job_mutex);
>  		xe_sched_job_arm(job);
>  		dma_fence_put(fence);
>  		fence = dma_fence_get(&job->drm.s_fence->finished);
> @@ -844,7 +847,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  err_job:
>  		xe_sched_job_put(job);
>  err:
> -		mutex_unlock(&m->job_mutex);
>  		xe_bb_free(bb, NULL);
>  
>  err_sync:
> @@ -1044,7 +1046,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  			flush_flags = MI_FLUSH_DW_CCS;
>  		}
>  
> -		mutex_lock(&m->job_mutex);
>  		job = xe_bb_create_migration_job(m->q, bb,
>  						 xe_migrate_batch_base(m, usm),
>  						 update_idx);
> @@ -1067,6 +1068,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  				goto err_job;
>  		}
>  
> +		mutex_lock(&m->job_mutex);
>  		xe_sched_job_arm(job);
>  		dma_fence_put(fence);
>  		fence = dma_fence_get(&job->drm.s_fence->finished);
> @@ -1083,7 +1085,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  err_job:
>  		xe_sched_job_put(job);
>  err:
> -		mutex_unlock(&m->job_mutex);
>  		xe_bb_free(bb, NULL);
>  err_sync:
>  		/* Sync partial copies if any. FIXME: job_mutex? */
> @@ -1377,9 +1378,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  			write_pgtable(tile, bb, 0, &updates[i], pt_update);
>  	}
>  
> -	if (!q)
> -		mutex_lock(&m->job_mutex);
> -
>  	job = xe_bb_create_migration_job(q ?: m->q, bb,
>  					 xe_migrate_batch_base(m, usm),
>  					 update_idx);
> @@ -1420,6 +1418,9 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		if (err)
>  			goto err_job;
>  	}
> +	if (!q)
> +		mutex_lock(&m->job_mutex);
> +
>  	xe_sched_job_arm(job);
>  	fence = dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
> @@ -1435,8 +1436,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  err_job:
>  	xe_sched_job_put(job);
>  err_bb:
> -	if (!q)
> -		mutex_unlock(&m->job_mutex);
>  	xe_bb_free(bb, NULL);
>  err:
>  	drm_suballoc_free(sa_bo, NULL);
> -- 
> 2.44.0
> 
