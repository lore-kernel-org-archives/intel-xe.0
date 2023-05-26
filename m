Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEFDC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CDE10E826;
	Fri, 26 May 2023 16:58:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC07D10E826
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685120309; x=1716656309;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QW3kyKPMw+fSyuAZI6pWl8ccEbsUrZyffL/C/rFyNc8=;
 b=m9cApwh//JkZl1+SlA+bB9+0/Kd9vhh1svWIDpnt6rmC43VYB9/S8cPT
 Grw81c8dg92yO5Vq+nXjnYqfDswOfqYKlIRYZHWp1x8rI883ywm92inXi
 6ToUTdKGfVl+Snam8cQyG8CTiOB7k3qJCFTHwpCDY8UC0CxiQCAQrwaGA
 b+PUZdnj+9rCwH+VM46b+MTs2H+s/v3JjPeGtaYYFfI23qd+EBECxzQHk
 JKHyGaeGHdv9pYa7jnxPj8b44MWp6YBsP3VAxLgFSx8NHuEWjF2d+/SMe
 lMI7jAhfr7xUiUyG/YaRj1+RBNxc/WhIesHp09/LEYw6XMeasu0EM4oVB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="338843810"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="338843810"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795155745"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795155745"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 26 May 2023 09:58:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 09:58:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 09:58:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 09:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d10BGqwHwNp4Ck872Q87tsY6nJdjzuaZIOksbzQsRpSrgJ1kpRKBN7QJIN2gO9L5g2QKVDB3N/YN32I+CewQrrua5rqS5L8WAFHTNLq4V1EfpR5DT2KBsr+agttt+b3EY4sfgOA3YuHvuDDxpwx6fjqkcrupHUlPaXj2lg5pwj/9Fq1d+2RaqysboezgZTpagn41YX10N/JxW9aFHbUhClXcSOgMSJaFmnfRP+RlqQ4VBM6RiOvqStWKdKUaTj2mB/gCI3fR+yajni83UYnSRGOJqt0wOoLWkaOzCY+S1fIWzloZWjBQa8E7XFN29G/ZR//5u7JWhRlu+USlbhn47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKhYY9Cnp83AJs1fDG1pxlFyNHIs36Z3+JZ+3ymGx6I=;
 b=kNpqyi4/p+NR5ERkk5jG1USpOLrQ0cDKN5c8q0KPKvjt8Gf3f4i+LiNJTSrqQyp+MSY3Gfi/8UvdQWI0pHIaMFloKj9CSl97ZOXU3qDGNcOmokrfEGUg2swqwyv2vz+utXVVEXKI/sGUsyoM1nJb1SOcgJTaRyBZHovCfbGJN8bAKWnBk1x/xq9+obTSdkkldx17PQktDXctiSLkWrprV8HRc1eYBPpXpredEKacqZ4ofRMCNnQihMESp7nD63iaSay4KF9d9pv15pipRscrnn+78EtS+Oy3AJ3hvu1HP5zhdddoPPmIGMeOetBXx6zMMYHNBiRyaRbB4c5eaE/x7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Fri, 26 May
 2023 16:58:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 16:58:25 +0000
Date: Fri, 26 May 2023 09:58:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <wjqnree2qplqlfkwuzxcfujob53ooe7ccdenzvypymjjecam2u@p23d6xn3mwi3>
References: <20230525232406.688875-1-gustavo.sousa@intel.com>
 <20230526001038.GJ10045@mdroper-desk1.amr.corp.intel.com>
 <168506366187.3319.4933213415417310598@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <168506366187.3319.4933213415417310598@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:a03:80::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dff198-63a1-4c39-1140-08db5e0a6b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sM8Ohu9TeYHu0c0xihd+w+J7Nlf2s1y6YKIZJJTZ0ErYhevWHhQpnJlLVpykjqzetjXDnnVATsdfULi1uE6BCVmNZTv/9zVTBSsyQP7tHO0YTkfib9wxEXTptAgL3EX1vHdlx1tttSK7MVFGQDAhp9DHpLdDBu6orlWQhWbTfDjGCSp9AHC0Axs7XalYVoXUPk8/E2D+bBHWm0/BSZ1exaW6SzcW9iG2ZSn9keFWwZxgLVdPR44FzyVSDh2MkSon9SGVQpEehOpku/iVCm0YFupRhHzSrKXXTKAUxfsww8Tk+s4G5zo7qwSNvKBq0m9v9PxXCs61fYWSoL3QKwwM9EMQtAKxgRXEajELCA48HmEdbWdA0LZ3PjOHTdsm6nk1e0LMKz4CJ2/9LFgIL9bG5hGzIG+7cmNT4zL+rjMPr04tRUeoU/I50pcfrLhjysaJfQGnM2nmjWkO4v/1B1XjfgUQ9fShRLdsKTknhSkJklLwQX++dYiV8E3Km/nwbXYXgDAlUQ5SMeAk0cSv5/LiAz8dgtX/IxeTt274GLc4reEBkW5LZ56uopj5qyDFqZaH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(316002)(38100700002)(66556008)(6636002)(66946007)(4326008)(66476007)(33716001)(82960400001)(41300700001)(6666004)(478600001)(6486002)(6862004)(8676002)(86362001)(5660300002)(8936002)(6506007)(186003)(26005)(9686003)(6512007)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZeH0R2h23gHg+ieJc+mKVYFBpvj3sJWf/1sIGT4CbdCdN5mxPS46itR1NyLO?=
 =?us-ascii?Q?gdXyfK42VzpxdJrl9E6WmcnkcCAdTwNwKaZy9O5+Pk2KAEnw/+4lNDrpIVMi?=
 =?us-ascii?Q?KRb5XvDVhRiry3VoLtMRP2/RJUzm0Nr6lPMM3hCxJCnBmbNoMPT6TT4rp8fe?=
 =?us-ascii?Q?NkOFpEUa3JshrnnAQfaD60cCugVJ08lIqZDES6ydAqi5M9fCJy584FEg8w0S?=
 =?us-ascii?Q?by338s7LfqgsJDRrEhmHQyvW4JaiXEis/w9GtF0d7xJg4an17wlXI6eI8afi?=
 =?us-ascii?Q?2dxe0yT0NnfTh5AiHOgwPaY+vmbf4jPe1Wq91NQ7JgivBMQd2gYCqAKa3xS+?=
 =?us-ascii?Q?IA+NkPoE+sgMMUMN5zE7TTiuUHblheJW+Pvcl4NTVBqX6HcE4VQtObFyJhv4?=
 =?us-ascii?Q?nTV3bdB7KlfzAdvJPeYFls44vl+frwOZSZffmpRHs8sEWLr2vlXlh0aMFxDT?=
 =?us-ascii?Q?RdZB8LqXVHcDaG/XgX1roYjgUMDStfTykxyZ90RgGYxBkelUdR8qVoIj8kMb?=
 =?us-ascii?Q?h6pg0HyuuG488hjUmUtx4ycJycSTpGp5XMPu3W5OpXieSuoiaXoYSRFzk98L?=
 =?us-ascii?Q?H1c1lwBou3owCEngJIZlo05epiLp2rOl6n1sSbixX3zLDC9gHKDrfn+zZd8O?=
 =?us-ascii?Q?eXm0JSlHi3ykvfz34kDzGFAHz81zF1Do771xXALKwar0tbtTGwWFyRU3n7NF?=
 =?us-ascii?Q?YvAvp3T/pPqaAWFuLn2NaKsDTMrtMjbO3tE6QZYqJGvQKau/TccyFmtketWy?=
 =?us-ascii?Q?T/Us3O4qo7tapApAr6dqa/OVFF/1Z1n99Bhtf3GO6x24tlBip+j/DhDpcHNE?=
 =?us-ascii?Q?ZZxcQNcZvAtMaSh9Q+DQX4qUL1syzLT9WxauMqWnI1tbrS4aNbwNhiCsDIyY?=
 =?us-ascii?Q?K262Hx/X1mP/6aE3c+tnyDJo5ZMi+Wb9K1YzGO4Hwbv3EKNhnu3xCIanOGC0?=
 =?us-ascii?Q?rBHQ1NMp3PreAb1t9MSv5CXEmyw1llBimKhSdmv7ED5kpghx3n5VpA51cGjJ?=
 =?us-ascii?Q?2l+a7Uy1QDGptxbOA2rt/MpIiFmUNDJbFRU8E7c+3GHeRCdWc06Bsu72To6o?=
 =?us-ascii?Q?bC6Vj3YYuaKreDvlH86UjUDoX2bWFAg5naA/AXMJ+LjsXXVFQfIw7Zu/wwCq?=
 =?us-ascii?Q?N0KbyTv2PlhJRVFY1Uivp+Br1d4774ekqu0wPwrJ30tBDkDdbSr0inhWRD6q?=
 =?us-ascii?Q?qgzci3FfIHoVXNP//iWPZatZGMwt2z6v2gHMmzsHNedwZrnWrA8Q/v91Cmv+?=
 =?us-ascii?Q?3DJC/TTt1cddQI6IWatBi4U60quyi/L/cpsCwCbl9PXLTqQ+Jv5WQXBJgnL3?=
 =?us-ascii?Q?25c97Ba4NKvQddJqss+MaW9ZHhvF7aIDdZlzmzxd+c3imIoOrKNSgvElQ7wo?=
 =?us-ascii?Q?unALx/q88ECk5wbY9AE72Gt1ZrfgAzvIuPIWhiKjTUgD5kSqA0qeH2jzWHji?=
 =?us-ascii?Q?4sNDflweGWNUFjaIWrEsK8TF0o4ctq6fiNkJrWaN2FlgM7lqpvEem4LSlGRx?=
 =?us-ascii?Q?Pvzj5wAO4I7QCt5sfuV/7KmilqoQLXEGC5aSuz67LriEJdefp4HLcnkOeFoO?=
 =?us-ascii?Q?0iqvEtQHdrT99w6OObReFct2L+8TUUyBgfN3rm9Mg315Eqo+O6+xiD3IbenT?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dff198-63a1-4c39-1140-08db5e0a6b63
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 16:58:25.3068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7WC31gRSTNnBAqtCEzLcRuuzqVtnOXjJ4Kst8bCgnd0tVdX+X5ZLzi5mRmhKdhpQBpgQ4HEDaru6jb+pTLhqH9YAgJCJyMf8VkyhvBI3H8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/reg_sr: Apply limit to register
 whitelisting
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 10:14:21PM -0300, Gustavo Sousa wrote:
>Quoting Matt Roper (2023-05-25 21:10:38-03:00)
>>On Thu, May 25, 2023 at 08:24:06PM -0300, Gustavo Sousa wrote:
>>> If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
>>> slots, then it makes sense to refuse going above it.
>>>
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>>> index 0312823101ad..b82f704179a0 100644
>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>> @@ -231,6 +231,13 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>>>
>>>          p = drm_debug_printer(KBUILD_MODNAME);
>>>          xa_for_each(&sr->xa, reg, entry) {
>>> +                if (slot == RING_MAX_NONPRIV_SLOTS) {
>>> +                        drm_err(&xe->drm,
>>
>>We probably want xe_gt_err() here so that we'll know which GT we hit
>>this error on.  Also, it wouldn't hurt to pass hwe as a parameter to
>>this function (instead of mmio_base) and include hwe->name in the error
>>message here so that we also know which engine ran out of slots.
>
>Yeah, makes sense. Arguably, we could simply pass hwe as a single
>parameter and figure out the rest. Is there any reason not to do that?
>
>If the above is something reasonable, I wonder if xe_reg_sr.c is really
>the correct place to have this function. Maybe it should be something
>like xe_hw_engine_apply_whilelist()?

As long as xe_reg_sr_apply_mmio() is there, I think we could leave this
one in xe_reg_sr.c. If we are going to migrate it somewhere, then
probably xe_reg_whitelist.c would be a better home so the RING_FORCE_*
are all contained in that unit.... We could then add a func() action and 
remove XE_RTP_ACTION_WHITELIST() too. Not sure sure it's worth though.

Lucas De Marchi

>
>--
>Gustavo Sousa
