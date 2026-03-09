Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EA0FCA191
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 21:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C23C10E5BD;
	Mon,  9 Mar 2026 21:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3MgcJkM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEA310E5BD
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 21:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773091485; x=1804627485;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=/7sxL4lIcBpf5EKrAZUOw0+QuNT+vE+hnsYnaZ5ObKc=;
 b=f3MgcJkMiABhtgI+HI8GidsEDPqdux0CxxWlspqhBVIUTfKTtB8ZRIs4
 4/xD+3ri+OjCZmq0b6F3XeT8TGOZCKpQE56/ndvRioma/qHZbJp8ZgrID
 0HK99viGvRskdC67Ka3bYxPEqPp5O/+mv3nMPWKDw1PyfUNSlYxqAiPid
 AKa4iAtAuxfF6FmSer3pzszRakdHTJ0csEc90y0cQDxoNlvwxdp5VyYnZ
 yl8bx8gRGAh9gE1fjXQsoC9CuGf8C7QAfR+bwaqQ7VasMrDdCFwrCeosn
 X3svp6onNgCDoqMAsvONC97Y1MIatdClyCtLwDqXSxofT8ObC0l4iexQc g==;
X-CSE-ConnectionGUID: VsLlXyr9TjysFjB6J/yjYQ==
X-CSE-MsgGUID: xcWsiAKsQhKGA4Gl79tE8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="96747390"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="96747390"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:24:44 -0700
X-CSE-ConnectionGUID: fJJrPnfKQj6oclLfQJq1vw==
X-CSE-MsgGUID: u5n5W9e4SKmEE1Ug9/Xr0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219092256"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:24:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 14:24:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 14:24:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 14:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+9C+xM/RXKGzeE6zj6es7d+MEFnPt4tooqXTXFfgAMpEwig6f1VbZ6v7JmFDWZekUGD39yF30fwqXKY5lqGUTj1TtJD1sNFy6h4XLMUl8R9LrJyhHydhLr7PAOlvhj5GSj9fYPFm9Ooz6tucv7W3HFFK7jWG5fXrzYajkPqHemfyCmvDZIgg5EdSQL9/sxXQj/wDMEvX3y7yv6CSemt3+8q8VcaZkPvMrJShNm50NuzlLSijCimgs7QKY+7myBR0KxlQa/f/kJLNjGx6PwiInxxACjF5fuHjx5NmhapVzkRojkhpLoY++aRfegC0Xdz1M4kTnq40R2V+9p9o/jRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUYDN0KjPtkMijQyTXGF5YbH6jChlcKRh5g9pYCcESE=;
 b=qWDHcolstLkYUjgT4iwBDVKw0NYegTI/smCw6RVKOYkhYKgubXw0CIVwJhPJUifigyaUH+Oo0LK3HpOCf3QwkWdjQPMWI7N5c0J+DvMcGY51aL49V0D+d7ewLzbND4h2VSW72W5q3wFAPceFgGHSYWR+v1fLDV7gCFxapo2juKlyxe+Oy04oYeJuuxdhglKXlegr6cgJOnm86UTcz56ttKmhV6YKTXQGPKCCCAKUxIEuPn6F6rWEVcLoDI6DEJxbevfvFMI4kh4glpjWh0PSnpFwu/Blzm1R//89a2TJvipg/PIk2bKrMyCNHC9AIjy+Q4kQfIKBkBydGU8GOYCfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 21:24:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 21:24:40 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/8] drm/xe: Call xe_wa_process_device_oob() after
 xe_sriov_probe_early()
In-Reply-To: <39d0a9dc-0e17-4571-8ab8-7abac07e6196@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
 <20260309-extra-nvl-p-enabling-patches-v3-5-0416900dd498@intel.com>
 <39d0a9dc-0e17-4571-8ab8-7abac07e6196@intel.com>
Date: Mon, 9 Mar 2026 18:24:35 -0300
Message-ID: <87qzpsae7g.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: f768b7b2-5366-4f53-0607-08de7e2245c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: VBExQu6DRqiKy14W0QMRLdGFUrVHuLdZAYIQODkB8A/CETEPQb1TyMy9CStvjmJRA+c7vt7/eIpXe4wWA2u5GpYDigYg4c5yhh6xGrd/StN8owQmZ4s0MFJWUyi5BqrMvkQ0btLDOj0umEUyDXNl2iv9XhWoQAWvus7BSwQozQhrBhaP/2RSg8gPcfeuQjjY/GEG9UEqZgeqyQiY/OKMX7TrlNSNAEl381V3IBRAqjKHBf7mALL8DdjVkNoRl9+fA18hf18C2GucA2GhBi4E+M6S0dOWFFSm4ON9zwJZLG8JdvlHL7Qk0ZgrcMa44GgJdH6rKSiLOJ7RE5mlEQl8w10nh6LfRJhVAoW/4/DTz/xkdbzdLfpKNjeYA0/D8vuUw9U6WXZJv9QCoLazJY/fkBE+MYXxS/zu8/rITHTk4vbZoPgKqKh1pC+ygv0ZSTIG2SCjK2Qsn6+0saccleGmo2CpN+UB3F7Y5O/RpZ9YFHPbxAxTHg9rY7nJ644cE/3aiaZGqkUUA80+wEzBwkJiLEngI9paSU8OQIHBw/m9UrE21NTSfancT8dYil0R/nrCfQ+WHX6QVfQttPoz628UmscnUVddO8A2m1/Jh4H6mFzm60a9k3Ku6YlPzCn2xea2ULli9QL0VLuub7vcZvacmo8emVF1GJ69SpZK9PlufzF3QGJ32rPCsPHFcGUNYqsPsjQSK9mN8L/sXVKigvKwBiPFl9qfqO95OTChSboRPGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ys6fjAC5C2RCTOw09BNECAX3++41EVWXMlf/biH15ceHJKdM1hxc+XkNm/5v?=
 =?us-ascii?Q?LmarCMjx+XRncWCdrBkr/MSbPHUG5JiLHNJKhkYAogPWPB9xYBfgwkis8rho?=
 =?us-ascii?Q?+J1h4ay21BJ4/VnwdfrPesWwNtdotmlyXAZx+/FQQseyIcczjoLXFN3eZFn3?=
 =?us-ascii?Q?FuWdzZwC2BmvJQ5raaZiJRRPm3kWgJluA8NoU+egeXpG8Sq7wnVPr5uilgGf?=
 =?us-ascii?Q?ODxeBvKUoR0rVFXFM8BwlAgms/At2ubwzBG+KSve54dSVh7Ib0+c+jo/6M/p?=
 =?us-ascii?Q?A63RceTD+aPPHA/3oFAmYtU6UuGTROF9ENnmuRipx7ACRJvi69V5SLOREtSF?=
 =?us-ascii?Q?yCHbX04uDugdh2sBIUSaw1R40zXjMh6PXEYkkrbkaswQ61g+nc7Nvsh2bnII?=
 =?us-ascii?Q?f3zO0g4yguUiI/hdEn3x81Q+qIgDZefuNuj+5u0wjAsAr5wU02VtdqfLm8Dn?=
 =?us-ascii?Q?NJU7bgHXj8u/OScknYp15p1ib+6hnmC/1u+MMR6TRrA632V/iOOxXowQBdgo?=
 =?us-ascii?Q?hQNhLBb1Q8mZ+MuW6UDZ9L27/gRGvCgJY3jzBnYOebd1NZysjqkH+VH1FYEI?=
 =?us-ascii?Q?WutU7mSGZaUrhaEcQaowN13joa9rPnDNn9D6inP24zm/i9QQwBipCqZEyjHI?=
 =?us-ascii?Q?5YfJ0ZwtTkIQ65R/q1B64l+C1xX5ZgT37DBM1P61FfSCJ+C5pYb6IYzHa3/A?=
 =?us-ascii?Q?bDJrqGpgUiure88zmU4Fy7+Nr5OUf5+r4njq9DJF9LPAutFzjfJNAv35fVGI?=
 =?us-ascii?Q?l+Ip7Dr0oIJMNUTHU/Kwjep7lHpzNienqUg8V5LY6gyUQMQN08k+eHOpd+9o?=
 =?us-ascii?Q?wlZgytr+wqNGhcvj7jGjtbFSBfvKzE2+z/5+n6x7HKfgaJrU/XJRDDXgooSa?=
 =?us-ascii?Q?gdZd3srcRA82u03tNNpxx4E9pDYuqPn71CdimlDmQGRUa7bTQBAmB/aN4tmu?=
 =?us-ascii?Q?E0ZEjYFtZQZicdd5+NZRz2NZjMwVZsrRnjITM52pym3A5RO6FtPXacb3qyXv?=
 =?us-ascii?Q?y5jAqNkhBFjWUqDDdpTh1jDH8QdROw9nLB/BuoU6pSYwDfDESjJY94Ahxj8f?=
 =?us-ascii?Q?W6fPv9TctCPBaJJgs2tEtTiqvgSk5VBjfl6tt3sDnnt2dPR3rPsnUw9O3xUS?=
 =?us-ascii?Q?WQbQSZQwSNBOhg2R4qVDHSmYVkjTZyZHhxz1WGwbk01vjnfWZYmCBLKvzA0U?=
 =?us-ascii?Q?pwwj62CjSN163PQCDXz5AJegs9uEXMDwOExEsrcgJ2+JPy/pOnYfUmlFLQ5U?=
 =?us-ascii?Q?rNhUqsX6gAG7ULFKFa98jJmwwABs6XEJJBUg3NMuQLn2yQ7Mq4tUDcfXYKvA?=
 =?us-ascii?Q?7EvbjFglOZcrs3//ijJGzNl8dVuO8E1/otBXjs3WeRQjGiPhJz5cWWoW7KNp?=
 =?us-ascii?Q?JVL+jNaLPyFZvGqwT/jCziFFsbxjYOJ8THQqSB5vk2dz/ZtbPk9B+XWl7Ffj?=
 =?us-ascii?Q?8bDbeOL1sGRcVSzhQcC+ER74bYytUgjWkB2qqp5bXvy1r11Eood1vpTH69//?=
 =?us-ascii?Q?goNUIbupnIPmT7ueb+tfgmsjVYlh948Zw9HEBTQ302UlTl16CVQXABKblkA8?=
 =?us-ascii?Q?RhoINPVl1r+vAxbekBPw2ZzrsT/yDX93+a1jmuJIjyi7mMpF9itDz717HgWj?=
 =?us-ascii?Q?mULnliIh7hjGrZ2TvhMadXu05GwOO5J8ELWIma09iCHx4nsbmZ7Tc6vvpctX?=
 =?us-ascii?Q?gBf4uZO/dHhxmbPoZax0bgq3TF1aW7JByCQFmM7XaDD7x1tyTvizYS1NLuZ5?=
 =?us-ascii?Q?+jUQGG27vg=3D=3D?=
X-Exchange-RoutingPolicyChecked: wPOt5ucgCO3X3uCIxxggTWrSo+UIuJuoCBWVurPDpx2QaBWsq3YPwYdXA9DO0oTLq2G2KE9PlhnTGAnvzUTQRNDDHqZfUuz1Yv/yRD5jYE6kUEnrN9kOaikpkN9Iucmwjqg2Iit51jti4AJIdb83wQV71BnRgIQVKHn7OAQ7YIT63aKH39MnYZgmwuMDk/xEsqaL+R8TQTFNZW3H+g/9sqBmkQVDF1KqL5Fl/jUuOtj5+hZEPuBXHtyP/ara8q5J8yw5Sk2Q2vavY+pHJ32JXOO7T4ax/LvmZ4N0hWRAsadxEzMM++LisT1KLlafy7t1h0QDHO3sKIP2QxVjGuNKGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f768b7b2-5366-4f53-0607-08de7e2245c2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 21:24:39.9312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpnMYfafGdEpktJuo4ZBPv0BLyH1Yoo0fPf6TZL3lNEMq9PwUwdhGnlywgWxuEYTxVPSY6gG5U4eJi/Dtc9HoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> On 3/9/2026 9:07 PM, Gustavo Sousa wrote:
>> We will need to use FUNC(xe_rtp_match_not_sriov_vf) in an upcoming
>> device OOB workaround and we need the SRIOV mode already defined by the
>> time that workaround check is done.  Move the call to
>> xe_wa_process_device_oob() to happen after  xe_sriov_probe_early() to
>> allow usage of FUNC(xe_rtp_match_not_sriov_vf).
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 3462645ca13c..5651bcdc6752 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -699,15 +699,15 @@ int xe_device_probe_early(struct xe_device *xe)
>>  {
>>  	int err;
>>  
>> -	xe_wa_device_init(xe);
>> -	xe_wa_process_device_oob(xe);
>> -
>>  	err = xe_mmio_probe_early(xe);
>>  	if (err)
>>  		return err;
>>  
>>  	xe_sriov_probe_early(xe);
>>  
>> +	xe_wa_device_init(xe);
>> +	xe_wa_process_device_oob(xe);
>
> maybe it would be better to move wa_init after below vf_update call
> to keep SRIOV related functions together ? also the vf_update will
> clear some feature flags, maybe it's also better to do that before
> any wa processing?

I don't think there are device OOB workarounds that need that
information right now, but, yeah, keeping SRIOV-related functions
together sounds fair.

--
Gustavo Sousa

>
>> +
>>  	if (IS_SRIOV_VF(xe))
>>  		vf_update_device_info(xe);
>>  
>> 
