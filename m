Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0CDEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 19:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B327D10E097;
	Tue, 27 Jun 2023 19:31:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6741610E058
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687894266; x=1719430266;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B4SBJn1LVGY4gM2OPM5NIikWgGC0C5UOTk84aaReY50=;
 b=ZI2TK1vJkP7kKXP4LXCroqXqn1xaS62szbkl8f/Ngnip2xjXzgSvcB49
 Wo1tN9vAFB9LE5+tWMiOA7v7FhSSIMyveEbkA4RkIEdms4AiFZLb0Ew34
 RzPVDxB7JFoJRt3N3vh4m9bCvE3Vx+phMHKG5hcREeuQ/yP5OaPPKsPuo
 m+dpD+VidF4X+r/1bc3KAkky9IgOOy7gdoo24wJfl7CT1Ps4TT0r0lRrh
 ZxjE2eBulS+AL+PgZOHAl92Y+qzfNP56LsgaF/NsfUg3SNo+oca7Zy0nm
 9aeI/c9c25lPzywTGZe5AeJdkzLUAcOjHiKxKZ+nSAQKcAJu0GCgoyGpq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="392293777"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="392293777"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 12:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963322897"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="963322897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2023 12:31:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 12:31:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 12:31:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 12:31:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 12:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6bhQzI60Dxw02YNjtypVOg/YLVCpc/ltD9g4EtRvkK1Pp/tZTuhw4WXB/CnBoUdVlhG9q4IDQ3DSCWOv0CXjKI2gw1aY0qq0pDwOuK1Cw9aisl+C/a4bQdkjHV7Zuj5lqdrNgjHNHwlRLV+aszKGi74jFRgfkUEOHPZR+og+sGrj2iaeHKFbWZyGL06gyMH+/I8QYaYxY1tXzyEFgDZ1L/lO6+obhZbvC313SxTRAIAcvOU6kplAvJEqTDXly4kq+/nAXhqzynJofYeHqcG1YkbyRs+i8wurfVwU2DCtghjSW+X4YnuQA97q9cpZD8JAZUI0YavyU7zt6uhopSW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2QWqsDGYzL1Ri76PWlY38wvQKAZDCMwNLz/S9jz09w=;
 b=U0bUB6aVcihaljfs117ZKZm80JDkiwYKC0HfJPW0qup8ofkLLG4AkZqXBXXbRv349chX1o9KNE3J5QYLtdF6GY6Y6MN/GILH7+C04vfat/0UfWA2Tj2kfUsg0RqE7BPtIzEbvsi7MPTz8gdEKqU9gNO56TAd0/1vIMfDsHi91hUpF3ytiMuIenqB3hQUEOLCVJzZaKUaiUEL9JBKX1FRHoj2LDaDwi/de0tPTs8+lqRZKpGE0eJjGaA8d796/OOPlW3zikGByyC8S8uNy9Ts+jZu+/16cWf3BxsQ1DPskGnGc6u3IPW9G0X4uVSn4GjbQ4BnQevXt6NDNiW9t57j0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 19:30:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 19:30:54 +0000
Date: Tue, 27 Jun 2023 16:30:49 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Message-ID: <dzs6mijmrgohz2hvcrpftkzabo6qlsgnfvo6c7vnlkh5xqladw@4qpmwqar73xu>
References: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
 <20230626212221.136640-2-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626212221.136640-2-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 155f2b22-31af-46eb-9c57-08db774505ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05oMSVANr1h/mfUnSDDO0BdrZNBeolmDkR34d7xJz7PoRPnmn8v69rIWTaM3NbczjopjQ3/o7ERZN5SpyviPC/X4TxXAF4nLYBXtEkBm8bqarzV+web9sJSX204942uHUu3z8Wfbg5wo6hTjXKZg+Yfi/yBhgWqRllWH0ongqmFSWUjCYQW5xTFe6Sfqc10QBJOaH3A+9kqo1H0j/xBIgCNwKek5O/ot4QHxsvlUODj7f0ZJ9SLJc+8r9UrkVuvtf/yyUIzrCK+wV74F8+LDAn5j+fGyLqfNhAmGUbZt0lLPsdCngZ2kDyRJhHrQVGqU99gNNJcttrB0rC/sTiBKzwmfyK1Y53ElLB2JaKzLBoZ74CzK7EkR5WQAcnys9J/7PdPcdn6UR56CcHwL/zVasbV0fThoM/GQzoNs4uYFrueS9J6Yd7vi9lJDHI9ANZcigD/Wxs9Tqx2cgJjj0haOxD+LE3zeitE15oQqtcuL/igbmrb3KxdkNmhKBk1voRnOOE3zKnMnhsKaLkVHqktKmsjrgg4hAVgwOzBrITnni3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(8676002)(8936002)(66946007)(66556008)(316002)(66476007)(6636002)(6512007)(9686003)(4326008)(6506007)(186003)(6486002)(6666004)(966005)(41300700001)(33716001)(2906002)(5660300002)(6862004)(478600001)(82960400001)(38100700002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?38xYPpOIcMWM4MhF1oIbvMWG5FLDH0DKX4Tyi4UT3SrBVrGUaGlSQ3/wfC?=
 =?iso-8859-1?Q?UE2VKgrmB6a09wD6gAu+eFiD1sg9GKyoU7NMgTejxxYDfKbDMldhnC1ebM?=
 =?iso-8859-1?Q?3O+z0rNFXWDYs8sCE66tdPTSjCF4DvViHHdWziAzFCU2NS80ZHyECJurBk?=
 =?iso-8859-1?Q?8jDKBX7liQU9V1D0QeN6zBFp6y399MNH8GuVzzHFdBTeDde/PIDtDLm8bJ?=
 =?iso-8859-1?Q?/nf6ZyRVC0u4gLDq3UojfZ6smqpvDnxaG6qU3bXPQ7BAQG6ry+koygCMzf?=
 =?iso-8859-1?Q?4aAf6NwODtV69Us4EkWsuqa5Y/Yy6W2UNHr0vn3vqQi4KWTnZnvSf040ei?=
 =?iso-8859-1?Q?20ES9l+bbY7r6uM3uZtnAk8qLUmgbdoLRbYkzzNxF+WTtKDBywOxFZGKLo?=
 =?iso-8859-1?Q?hYziueXStJPW0gkDNRp5UGp6vbjVNYVhPaTW6hyh/d3Vzn200LT66p5gEO?=
 =?iso-8859-1?Q?Gjtti3GbS8wm4Kz/RDsXtJah9BXwmb0L9WcgcFnRU7En3s5zAgNCTHKsG6?=
 =?iso-8859-1?Q?G6FSFk8BHHYP4CNycfuiXVebtK8aslSwreUPmv7ric35MFfRBPZQHAND8P?=
 =?iso-8859-1?Q?El+4V7XwHZCzEe8qHY4pdx2mAfHSW0jP6cVRFyzEaUI+MYuBlGb1Rbn4LK?=
 =?iso-8859-1?Q?Gl6AEDXkIY0lFivrnzdfn6PiKdDhTGNPHmiF5f0DHD5YFVXO14gH/OU3Fh?=
 =?iso-8859-1?Q?Sbkq/FyoraXWFuzfx4KXrI2IEK7kvoouVxGFyBt/xPfMIY5CUxQEFaJ8kb?=
 =?iso-8859-1?Q?J3M/QwLfkRBapZ8zW2/RXaAA9Ng3f1Yya2XIC5LM7XA7W8wpts/o2WWXuP?=
 =?iso-8859-1?Q?gyC0l51/AazCupPRWF2znRXVXV7IgvtInAsbs2iH8DrkR7y5OO8zPHc5uE?=
 =?iso-8859-1?Q?koJhnFQSVDnHH3gRza/GMXRm2Wxkava+Ub8JeDNw3oYQujnfJmrRH8I35z?=
 =?iso-8859-1?Q?MaEuNtbfamW62PgrSMOE4STv8ILyOlQf+IIAGhQCh+5GVTpMxc39zcYGSo?=
 =?iso-8859-1?Q?zjOaxg0Lup7AB3IYRY9FxmM746szL7fQ93VawUy2af5JmuyO4At5RAIHaR?=
 =?iso-8859-1?Q?AoviEAZ25PNinniPPKQIa7OClql+OziiPvYfPxIwgoVfKuT6jwheLxAsMs?=
 =?iso-8859-1?Q?0fuXnxbt5EXNiHC+CA3GL+sNkv1Kx/7xUrBABImOWofu5QLIVh6S2NJ7vE?=
 =?iso-8859-1?Q?BGqGXukK8tNZ5w8VjwfAwHH975r+V3LrS0Oc0pkdAFkKCnf6bk93QECrr+?=
 =?iso-8859-1?Q?5kIcuaWAGu8gM0lea5V4oDAh5+Xfw0Fe2sraUEVYHTfOvPnS6ttaOmgQ64?=
 =?iso-8859-1?Q?L4waTDZMsQgDXKO5doqoNhFYBTJzzGn9ChI4kEadaFC/gVer6gwlGqFfA8?=
 =?iso-8859-1?Q?zek/GwZXf1BhUsghbvFbH6hjhOa+eXzitUMMCfIgHrQyffl1uF1bWsEphC?=
 =?iso-8859-1?Q?JPYfBe8MrkhX6UCcFuOSiaqE9XKvtmG194TY6l6S3qc7f4+R9P+QIO4fy2?=
 =?iso-8859-1?Q?VI60veG8YGa807PRaVDCJHCJcURACWCijpe8ASJpe9Zw01fpIkxc3p1yut?=
 =?iso-8859-1?Q?Cbfuq+YPUytR/cOd3YmjMys6A/RXKlesTDtpQ6hEk8s+zyrO51X+UXBAdh?=
 =?iso-8859-1?Q?VspDEMjBdpZLr0y1rtS2YskGylaIjkSnqXQKPE3GNaTiAJ10Udgw/cDVqc?=
 =?iso-8859-1?Q?xN2OOHSm/vZ1dcc54+K1lbJM7S5NIL3zU4yi+3ndqSHZQ2yBzRNSH8HwbU?=
 =?iso-8859-1?Q?o7MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 155f2b22-31af-46eb-9c57-08db774505ff
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 19:30:54.1814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23ohcEom3WrhOE75N1OMEjdcavMP0GIXi4y78zR31/10pf7IQzEZkLEb4ac1MJCq0BZMIATqt7AgpCT7ZthDxJhNTiRuv6Bw2opVFCtZQIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: properly check bounds for
 xe_wait_user_fence_ioctl()
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

On Mon, Jun 26, 2023 at 02:22:21PM -0700, Paulo Zanoni wrote:
>If !no_engines, then we use copy_from_user to copy to the 'eci' array,
>which has XE_HW_ENGINE_MAX_INSTANCE members. The amount of members
>copied is given by the user in args->num_engines, so add code to check
>that args->num_engines does not exceed XE_HW_ENGINE_MAX_INSTANCE. It's
>an unsigned value so there's no need to check for negative values.
>
>Fixes error messages such as:
>
>    Buffer overflow detected (54 < 18446744073709551520)!
>
>Very simple reproducer:
>
>    https://people.freedesktop.org/~pzanoni/wait-user-fence-bug/

same comment as in the previous patch. It'd be better to have a code
snippet in the commit message.

>
>Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
>Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>---
> drivers/gpu/drm/xe/xe_wait_user_fence.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>index 3122374341d6..098e2a4cff3f 100644
>--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>@@ -121,6 +121,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> 			 addr & 0x7))
> 		return -EINVAL;
>
>+	if (XE_IOCTL_ERR(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))

XE_IOCTL_ERR() is soon going away, but we don't need to wait for it.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

For these 2 commits, let me know if you are sending a new version or if
I should just add the code snippet while applying.

thanks
Lucas De Marchi

>+		return -EINVAL;
>+
> 	if (!no_engines) {
> 		err = copy_from_user(eci, user_eci,
> 				     sizeof(struct drm_xe_engine_class_instance) *
>-- 
>2.39.2
>
