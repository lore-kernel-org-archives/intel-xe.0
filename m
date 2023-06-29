Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E14EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 04:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C0B10E021;
	Thu, 29 Jun 2023 04:06:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1641810E021
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 04:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688011605; x=1719547605;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B9HShYnbMW0eTzG+o5dT2XxfeYjcGTq1tiqKUplwyQI=;
 b=Vm26k8XmNwO/faK+QklDBUMzL+4lLWCnXc60qn15zSq50sW1P2eDz4QQ
 J1AnWppz4M6zwrEImFYSNLdFS2lJUMHRIh3FHB0uyFf0KCyf27OwOfEo9
 nwIygIxBWqv5bMuUZx/+ctIwKSBNYJeyBI1McHn+6jVhkkMK8f+QAmb4m
 whfBcyd8u7KB9IuqQ2kLmddCZ2tRnuD5IuMUuxpj1V5QqQooNvGrxUJx/
 jmCPxWDLERGNCC1ijTpUz+1eOEuTt7YElCS4Xx+ZGMQCevZs8HifzcRrX
 aEXwGqVABzHS13inpxu7cE90adOt2q/Zs8BK6U3VZw9Wm5Dl9PbFoC1Ym A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448400868"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="448400868"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 21:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="782536462"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="782536462"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2023 21:06:43 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 21:06:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 21:06:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 21:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kznUJd67U9XMoipteUAO7eQZhYAhs1cr+3flscRA7iFnA+H8HuvT02VNrMu/bZ1FRYzhqHWEWccAYY2+lxuLN+f7ilhrRlYqy45ncjOMr3TQxcldsSAmnK6kCb3NiEGiFa/ueylox//OenHIMRFDoXQv65xTfLGl0g9+rgRMaJp7otROkdB+5t7S4R3mKd2afzzXVtHPj6QY0lU5loc+hrAKLOPHTte2R+a4JsCAQgd/FByStly9OdmhXL7xu9eseIbIXFVJWT1yC7yV0NnsY79gvSI9z6v2U0xxFACZc28JvCpQHlUto3KXLRsHuO6xPd6psn83rk5s7LFsv04CjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5voYasDJzleHJ6d4bL6S61lnlxa2caz8T9nI2r7jU0M=;
 b=eWgodRruXfYH2jxglQ0bfiPsrp1FEKfwtHDTXhfOvDTkA8D2NQQzAxeZcWTEsFmlacVO9VFriQDW/w7GZU0wU92dSD7xA5puaUWXGjoIcPuh/p7YG+9Z+rILwF6i+KAKeqlA/b5rrFtqzH5vyy7i5K5pU6JoKHYXKlccBxgZgi0jAbCizLpZyK9/RTbF17JKgjLCcAOi4EUGM+DlrO/SzK6QRbbgjQ/UIiIIVsr3s4orqNtFs1Wz0xi1kgrGcXa3nLmYSFsyPHt5OKs4ZYbfsqjnQDnzfdE4MWpwU06zZQ9/g1urReb4kv1cbzdXbWVB0MfO/3piifvZB3hxZOQwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 04:06:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 04:06:38 +0000
Date: Thu, 29 Jun 2023 01:06:31 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Message-ID: <q56efzk3lc2dca3c5ajnehoa5jnyblelmtokzqqglkxi55vd4s@uekhp7nulq5v>
X-Patchwork-Hint: comment
References: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
 <ysrqnzx3w76mckgtqhcv7dguf6wz6z3twknaur3cfm7ttbclq2@qhzxzpjam732>
 <48bbb481616bd10069fd9106e42e1060d5b3be72.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48bbb481616bd10069fd9106e42e1060d5b3be72.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5aa337-ef75-47b5-8c3c-08db78563c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aS42HSaUqpm3pvLyV57Dk2DpRflSIcqWLqop8eXh8McWy08evHmwhkIah2lOXFg9ziUsmgYPbsCJguOxj5UYTp4eO0OQz8dUi9Wg7PL6Y8blIhMjVycSHZt/a4DUOkx/bXbvhsMjDwviMars8EVg8RzVj9iZ+yc/YLEvgNUos2rUxpN8FoaxEdginfYhh7RMXzggVB9HwvK4i+2SlmVj552Qyq14/9Xxs50DUHWvLrAgox3vEpoJSJ5uKk+DRaAz2hJut6m3WI8dkIMsCyxP7jrsjJjRJIQz936BrngACho9C6qPgn8vl/j76fiSlQGmcqZykkcpaNCQg4QvcPyY5j+PSx2UVTwtGw/cDP93kAM4wWIO52dDFFqfvwLp8x/MqHKmHh/8LJ9QfdL7UPdQkU+NNNs0eGHZvEv36Do0QhNokgOE27xsNntLzFE6elO1nsWFACAa+4zss0caBhbZN+OEAxQQT0F/bHLdNRKtSZtDT0LHub/EiUISLOn4Jd0uncIZ/6uX1IokmDQWpq8END3gJPHKsj60Dv4iF4LFmnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(6512007)(66556008)(66476007)(4326008)(6862004)(66946007)(86362001)(316002)(41300700001)(8936002)(6636002)(82960400001)(5660300002)(8676002)(38100700002)(33716001)(966005)(478600001)(6506007)(26005)(2906002)(9686003)(186003)(6666004)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O3nwrAAkxc4dw8AXQpLIopwC+IN1YqqAjIiXH7GDdM5Rz0IISeZDYwQU1L?=
 =?iso-8859-1?Q?4IauNWeusNJCpo5LJ8AKaut9A/z851ELaAMdpjRZpc+0rsi4dbCbLCDfNT?=
 =?iso-8859-1?Q?GcYYsbkIvhS3L3QQC4DQbuMeUQr77V02VomZ0/UFoRqqWDpx6NIO8JAfcr?=
 =?iso-8859-1?Q?Tr91xPkPb3cZ+5+fJGNDNg0An+0GAGMpTA53kp4Gd4u+ML+N2MAM/YW1zl?=
 =?iso-8859-1?Q?I9wWc6Nc0YgSeCR39Ys8blveDzavDuBzH7h3qoPOv5QfqLX3ksLTsKJnZL?=
 =?iso-8859-1?Q?78P7RhUM9QZBXg0lCWhtto+bDL2a3NWFHD4626MLsK7tZ6j/fn1l+rwSkh?=
 =?iso-8859-1?Q?ODB0Kf3onYY+Ig0yhestEwI37cVNrHdioI8hgBSTDQVAR2Q9Nf9ZxmK2zi?=
 =?iso-8859-1?Q?SOMnudXWlwIE99ebhuaGkIG8U1IF2Siq3LzEpueEY24xzecSLzwFZ+H797?=
 =?iso-8859-1?Q?FSwcGAECOZEGr4+2WmKnvoyDwB1rbM8+yGAvMdWOxfe3rzaE1CfNQuu9A9?=
 =?iso-8859-1?Q?PxWiHNH4TF3jmJo75E1dpcY+HOEsxabuVcHEFFHZOsp878nTUG9OtVLagO?=
 =?iso-8859-1?Q?NopKMh+B4HF757GC6p1n18YAWdKKqxJ2HgMXopjXFDAYRjotzYY4EuCkNO?=
 =?iso-8859-1?Q?FFBjzkBJpcUMe77By8cwlGSTB18XOHPKjVnSji8g+RxyENtDT4vZbT4Mem?=
 =?iso-8859-1?Q?/rE0hPJnb0JlUbSpMr7e4/xbtXb4x9u6ugg4J2kmwpAAt7fDaeGUEZa6JE?=
 =?iso-8859-1?Q?1ksUYy0aRc16qf8AbexLie3PuJ1PkiDhnEUf3MMBQu/FBXbaVhPYG2VswV?=
 =?iso-8859-1?Q?/H6q5SsTr7h4cNcH7vSqUdrEEbwkl3UqrJxEjbu5nTaQc+FkxHiaOzV5SL?=
 =?iso-8859-1?Q?bzbboYc3uISlADX61r4rJO4MsWvZiineeLgEezYpR4QpXoRvF+IWkR2FX8?=
 =?iso-8859-1?Q?dYKOvDkIViSE2HnW6OuNrwufR8pcfXPe/rm+C2HxmXQcgtXwkVdOMFZ0Rc?=
 =?iso-8859-1?Q?2BtLjwhi6tY/6+JLn07riqwYYbwe8PSlfma1mkTsXQzSo4MKNMGh410IA8?=
 =?iso-8859-1?Q?XXI/6UkDOl5V1bGGfCZWwZP16NpbE04kOsIXWkuyJn/BtLdE8qK4D6jG8q?=
 =?iso-8859-1?Q?MbMkqjSmkapmCMPnjcWd+86Vk19HmkAolrCNdZ5zZrs0me4/kfQL8RYoTk?=
 =?iso-8859-1?Q?v9ylwRsU6of0XeFjyWzgWoRBCdNv2tduT14x5rFD3Kdl+AZ4oqby1++zyi?=
 =?iso-8859-1?Q?qbkIEDWU2RjDPuqsA6u7jlwFHLvfx8lBvd65sO8xPUy6w6Ilr0NT+khRWf?=
 =?iso-8859-1?Q?k+pOm7EukIzm3O/kdg8/4DA8hx1LxL9oDJXKdpBixTYEotVpL8Uhz2Wjk0?=
 =?iso-8859-1?Q?QL3M0npFqmHF0XALF9hTiD1HEXE9JyBScXbJCyQeDGdLil176LWvNQ5Azx?=
 =?iso-8859-1?Q?4W3pNTwEyXkRhtfvOVo3tMxB7XjppRpk2I3iYdjPa+RV7Tg4iW9jlLIAbJ?=
 =?iso-8859-1?Q?5Ut0gxvhZXTRtnunASFFaE/CV6biNsHf0xYTkDMaUInWQlxpcx9fXIf9Uq?=
 =?iso-8859-1?Q?OyKRWvy6t7DJ1vHqUd5w7FQi5kidzRAqSAVzF06qvBwsPRekBpdHY3+Rc5?=
 =?iso-8859-1?Q?e2EdzhEFj1BWCI+YGTbYpi6uNk+nAS3esiJvx2m1Oc+YMsfBc4uzssPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5aa337-ef75-47b5-8c3c-08db78563c0f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 04:06:37.7565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6K2ff0MqjrYLZvQ6sjCZbX91vJ9vyu3BxQXfbkhhdAT+5u9eS8soBBygnbu4GsbJclWYAzOGoYx/a1/NEhYG1Jr43hpj6kzm0IiYvezB4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2 v2] drm/xe: fix bounds checking for 'len'
 in xe_engine_create_ioctl
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 09:24:13PM +0000, Paulo Zanoni wrote:
>On Tue, 2023-06-27 at 16:10 -0300, Lucas De Marchi wrote:
>> On Mon, Jun 26, 2023 at 02:22:20PM -0700, Paulo Zanoni wrote:
>> > There's this shared machine running xe.ko and I often log in to see my
>> > tmux corrupted by messages such as:
>> >
>> >    usercopy: Kernel memory overwrite attempt detected to wrapped address (offset 0, size 18446660151965198754)!
>> >
>> > I also sometimes see:
>> >
>> >    kernel BUG at mm/usercopy.c:102!
>> >
>> > Someone is running a program that's definitely submitting random
>> > numbers to this ioctl. If you pass width=65535 and
>> > num_placements=32769 then you get a negative 'len', which avoids the
>> > EINVAL check, leading to the bug.
>> >
>> > Switch 'len' to u32. It is the result of the multiplication of two u16
>> > numbers, so it won't be able to overflow back into smaller numbers as
>> > an u32.
>> >
>> > Very simple reproducer:
>> >    https://people.freedesktop.org/~pzanoni/engine-create-bug/
>>
>> since this will be forever in the git log, maybe instead of a link that
>> may vanish just add something like this in the commit message itself?
>
>Well, my git log references to people.freedesktop.org have lasted
>longer than my git log references to bugzilla.freedesktop.org :)
>
>To be fair the bugs are so simple that we could also just remove the
>links, so I'm fine with any of the 3 possible approaches: (a) keep it
>as-is; (b) paste code as you suggested or (c) completely remove the
>mention to the reproducer.

I chose (c) since the commit message itself already seems sufficient.

>
>I don't think I have permission to merge this, so whoever gets to merge
>this can choose the appropriate way to mend the commit messages. Or do
>I need to resend the series to the list?

Applied, thanks

Lucas De Marchi

>
>Thanks,
>Paulo
>
>>
>> 	fd_ = ...;
>> 	vm_id_ = ...;
>> 	instance = ...;
>> 	struct drm_xe_engine_create engine_create = {
>> 		.extensions = (uintptr_t) nullptr,
>> 		.width = 65535,
>> 		.num_placements = 32769,
>> 		.vm_id = vm_id_,
>> 		.flags = 0,
>> 		.engine_id = 0,
>> 		.instances = (uintptr_t) &instance,
>> 	};
>> 	rc = drmIoctl(fd_, DRM_IOCTL_XE_ENGINE_CREATE, &engine_create);
>> 	assert(rc == 0);
>>
>> >
>> > v2: Make len u32 instead of checking for <=0 (José).
>> >
>> > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Lucas De Marchi
>>
>> > ---
>> > drivers/gpu/drm/xe/xe_engine.c | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>> > index 6e6b2913f766..530f55a33b03 100644
>> > --- a/drivers/gpu/drm/xe/xe_engine.c
>> > +++ b/drivers/gpu/drm/xe/xe_engine.c
>> > @@ -522,7 +522,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>> > 	struct xe_engine *e = NULL;
>> > 	u32 logical_mask;
>> > 	u32 id;
>> > -	int len;
>> > +	u32 len;
>> > 	int err;
>> >
>> > 	if (XE_IOCTL_ERR(xe, args->flags) ||
>> > --
>> > 2.39.2
>> >
>
