Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F658C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473A91132C8;
	Tue, 30 Jan 2024 17:32:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AE91132C8
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706635949; x=1738171949;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qYv2LzCksx/L6Mws06EEaweeFWliXjSp28eaEGC/qao=;
 b=BCYwROytkpQbNDPwZieuVXtfQXFcPNEE3ry4bDOf4z7Gh7YtP7rqZyty
 o9GzwJXSCUp3bqmftX7yAdF1g+EmQPGDLWgQjnK1n3CMfbnC2LCkxMmUT
 /t4NnHHMhC2e7QNarR5sek6rzgjIOIGrtGryyl55uJ1O5t6HDuM+5QTTC
 kEdpOZ2pwN+PiEjgfri+6bs0cDcnTWVPWz2+fjVtQvs/29fiFeN9xaZCa
 tzWBu71HxqdTPYf7SH8ORjyZWNOGDsGuTa/wHq8Fo2nrQgMmv+GXiWhIR
 Srt/bIQ3CtuSRMV46WlNOuVY3OjFcYe2MrNfCQ7JPzSXrVpkYbCn2AL5d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="467603158"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="467603158"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961349744"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="961349744"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 09:32:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:32:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 09:32:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 09:32:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ne1ioBeuzbIraQCNP3xoxveINBAIX/uM3Q0APv+eLHiMtew1mEC2gwdOHVl5ZCT4s4jOTt4acstmx5SUDDuq8HuAo8+JR5BXJxxnGnG1TN7WG3QdgTR4SDkIVAeG59vkzNO4Si2nLGjDL0DztTW8zsvA2ELSC3AZrK6dqfgsIs9eh6RWNI1XkzX1NRoGRcVfG7XfSBXwzA4/eDCDWjtVJOUDIzTsuc70pnX+tKEKGizraD1IC6gr+m6s8it76NmB2fcMI34zAKF5OUoehbR7dpl8/ApNYPTk16fbjPek+uBKabeJoLofUPAl5+1jtjdvXbEhOsi50QdKEulSbpMMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGPRCtLshnAlDgyL0Tje4WZDkqlQdUp2JH2Znp8duK0=;
 b=Ln3Zvi4V8KCb7R7vR1ZQdKuq7xXLLV3CP2NZlVx8tL0XkigZWj2E7BiY645E4UIUESL6szfuT33obtTG2Lv00FBdQxtvGvyYq+YIERAU7DYLfByq2wZg5dNWtAqDYdqNRGQOhoSbVZnXL555jEykDNcFLEOs0HaAUpenxPc49Yh8SinwiVnWHsx6jrI3GIZjhWZWXTydSaG4+dafy+v9SDN2pdTZiyHdWyInL9CyOGG7KrI8O4nm0FBqrXzjI3X3ilmVdrXbER+4Coy0F8fGNxYmH90FM8xadCXp38CmvZpre/o1Q0sleDpssraE5CHEsYGdP5/exQEjhIo9XvdXZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 17:32:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 17:32:19 +0000
Date: Tue, 30 Jan 2024 11:32:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: Re: [PATCH 2/2] drm/xe: drop display/ subdir from include
 directories
Message-ID: <luojhbiq7zyojjxyquy7d3qloeg5fvy2wxzwanx572s7y62om6@5rddv47rspj5>
References: <20240122101428.2683468-1-jani.nikula@intel.com>
 <20240122101428.2683468-2-jani.nikula@intel.com>
 <47hzp5ya6cwdcidq7cwid5ykpkn6wavxtf3ynjf3xgirbgulsc@afsk7pgae3lx>
 <87le8hnu6r.fsf@intel.com>
 <663d25vngq6zcee6vupweq7dohhmftpaggtnfl7752sn6qhdao@ypgsfn62skob>
 <87ttn4m0r2.fsf@intel.com> <877cjrjhzi.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <877cjrjhzi.fsf@intel.com>
X-ClientProxiedBy: BYAPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:a03:54::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: d50e256f-42bb-4eae-a5cd-08dc21b9691e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P6rayB9DSlKyLIxvfIPSFVUBVr7Yv+XF7KAgd8oK4pyMpijPJ9RBabjH6nKMnmpNYs7grLpnD57ZZQJ6Y0ey6JCmc8BtQ152dgAHh8SKgAIMUIkydiHQq6URu3R0x9IZFalbvn2C0Y4hnj6SNsarv5UzQXgzJOAbfOFboyAEZWjdrCFd17rSQLsND4+hcJtZGT7ZtTaFwkjoKfGTdQSfb0At9ykjXGKxlojS3fAekHHtmACliJQ0xlxNmtYqbnVKDc61gx6/AFV9j+gCEjwUuJSelakxV5/igjVTU0ZVV/ygDaxOVFNJQZZS/9Cv7faWW4ZvPuwRwNtdT2lQkoFAKmRCQ9CcaA6cSpW0g8pZ6JeoyCv+HY1Jgz8/jJqCqlKBCyRtpdAjp9k/UXPHbM3zxf0z5z28m/OhnW3h1fXDS85gIe24HiMxS/yeL12MNhjVT8nLRmqeEyGVw0R66p17wUsMMJun3FWmCYDCAQWEYdTJHFsrCHviYe4FeWdb/VtAZfbCfnZPQCBvslB8oeEiVIr4cS/LqQwQ5179zWyidQOaSfzzS2M6Mxgz5nM/BcMC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(376002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66946007)(316002)(66556008)(83380400001)(6506007)(6636002)(8936002)(8676002)(6486002)(66476007)(26005)(2906002)(4326008)(478600001)(6512007)(9686003)(6862004)(86362001)(5660300002)(33716001)(41300700001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dboaw8/oYloCG1vGmhIhx0JzKhhpkKNhXIqneLMNw3kUkFYYpKQ89eyc3Ns+?=
 =?us-ascii?Q?SQhZOk6OXhrpPhnTnhWjONVWFZdeKjf1WQESRfh9jY9kba1hk8nqwjjdCh6a?=
 =?us-ascii?Q?GU0nREO9qPYJHOKiOhJj5tzZuEiU4w1CR6dzShc0A8KEMVL08u+XHpkAF76i?=
 =?us-ascii?Q?JBZ3167+Bmk12zCarzbTjExm12w2pr7w6GCkheUUxDJifn0bPIuTqJTe2ZWE?=
 =?us-ascii?Q?sythaLMcVZWd0pCNTIOKHT0YYPkrqpZ6l/pCJqFQv5v5py9JMQKgTuGGeWOv?=
 =?us-ascii?Q?abqMjGy3+a5Yuq+X0+jZjV4IoRYtCevRlHb9o+nJzCpCNpY1dBhlG2TcMZ6c?=
 =?us-ascii?Q?wLDzdkHvEUjOJrlZZdYpy+tCIlmpzvDqC2Hg6HTR4PpbdqYZHL+DR7H2ChKO?=
 =?us-ascii?Q?P3gmRmz/IVj+AY2GS5NRwi7wOoq4mSBg65Wina9AugBWDEzbfAMwSIX3HhP0?=
 =?us-ascii?Q?5Sdk/mPjPVxatt6jCGR3NKZgLcCjZ55F1OF+IEVoRnsND7sW4grJlXxJ0bcp?=
 =?us-ascii?Q?zJEGqvaQxblB7q+CzfKmfC68uIIXWaku1L0wiPU4JUnP++LLm6fHyvT4hx7g?=
 =?us-ascii?Q?RI/wTtE0v9QeWQq6lRP1UCmtTDaUuzX+EaBbsBS9tXxNImINUhprBThP1Hte?=
 =?us-ascii?Q?Kg82hYw6tMD8WjYb5VroxrluQDjuWACucF+UJZjPWIfsbVlSuU6Rpl+6qURA?=
 =?us-ascii?Q?5Qwn+GreOj6sirNPW5a7znAT1ci1vTj3smqvSRrIlEmsmXyCQNpNKiaoaop5?=
 =?us-ascii?Q?kaA+wvrGGMTNSEkGryykrJ47SULdG7ED+b5AN0OsqvNEae0kZyOEcsOP1Kth?=
 =?us-ascii?Q?qiXcFavuJ8fpF18scQ6CSgkGlYG9BO9SPm5qlJF+igislN3447Jhi8nj/Pg1?=
 =?us-ascii?Q?8gYZiN3ulQ9zlB6drNdkF5hDUOIH0R3fWJPnTe5Eqj2cXWCJyVBDQZvczLTV?=
 =?us-ascii?Q?qdIPRZpsL9hxOq4kXVLJ49B6rMTupj8rfu7SL1wV638ReZxBvzHmEWPQRTMf?=
 =?us-ascii?Q?Qw8YbN4aIJ6WAL0bxldWSPFzP0je9o22R1QSpQbx3DR7bgktOTTtCSUbT7tR?=
 =?us-ascii?Q?fRp55/S6k8h+7YcKjDC7oM51SwTyXeA/Qkfk7lvEo07ChAmMn7QNGLiSAxmo?=
 =?us-ascii?Q?OAgFgiUS6zZE6XYmaefrwyuBFjzkQMX6/UyrjpTwhsjxBS2PO6PlSltu897M?=
 =?us-ascii?Q?4lS/UqSBDDJysoIdnBb6aZIM19h+xHERUWNOr2iCBAG7Ue1qpzh2CSEMwvOK?=
 =?us-ascii?Q?hdJfiiko2zkpYcMDlDKmlbemfo6H3QczUCxyG92sij3IaF3mz4ouaY5Gc66r?=
 =?us-ascii?Q?InUl3O5FcpjwiVceMB9rThe/jBqE5kDPr2Tee+RKRTfJiw+wnJ5/YSXv5avs?=
 =?us-ascii?Q?C83P774eFitlamjjO3BgfrLUf4dB40o/7CPUvPoiAf9/Q4KqjDBffxwtevf9?=
 =?us-ascii?Q?2f7d553Um/Yv6ToS7/98r/bO3laReD6wmBvHlfH09F98b+TxGGDn+yoBaMJP?=
 =?us-ascii?Q?Jso/Kj49DjENqQZnez950sbq3QFke8OzmusQ1YDh37Di7JGdrTPjLp3QFjGi?=
 =?us-ascii?Q?IzmwiS39fN1/Jh4HzPkQiJm5X9iF9qApJkt6Jdz+lhHeL2sx8PwACtbp/b+F?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d50e256f-42bb-4eae-a5cd-08dc21b9691e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 17:32:19.7487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iii5f5AjaGfnaG3NyO3pFdYS1owptqqFfG1UMh/JbFPh9S53kv5DmIljBs5Y/z0zBWMzBt7dPfvSfG7ND51dyMeT0+Kp/3p2Qby7BLdP/3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 11:19:45AM +0200, Jani Nikula wrote:
>On Tue, 23 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> On Tue, 23 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Mon, Jan 22, 2024 at 07:39:56PM +0200, Jani Nikula wrote:
>>>>On Mon, 22 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>>> the downside of patch 1 is now that core xe code can include any of the
>>>>> display/ headers, but only xe_display.h is acceptable to keep the
>>>>> interface sane.
>>>>
>>>>I'd say xe_display.h remains the only interface towards xe core, I don't
>>>>think this patch changes that, and its location doesn't really give any
>>>>guarantees. It's been a matter of sticking display/ in the include
>>>>anyway, and enforcing that is a matter of maintainer vigilance.
>>>
>>> I just thought the previous split was slightly better: No code in xe
>>> should include display/ and should rather use the xe_display.[hc]
>>> interface.
>>>
>>> Now with #include "display/xe_display.h" spread throughout the code,
>>> this could serve as example for people to start including stuff they
>>> shouldn't.
>>>
>>> I'm not entirely opposed, so if you and others agree, please go ahead.
>>
>> Well, at the moment you can include *anything* from under display/
>> *without* the prefix, because it's all in the include path. (Although
>> that will fail for DRM_XE_DISPLAY=n, but does CI even build that combo
>> regularly?)
>>
>> I'm fine with dropping this too. I just think it makes it easier to
>> check that nothing outside of display/ does any displayish things.
>>
>> Your call.
>
>I've held off on pushing this. What's the verdict?

Let's push this. If it doesn't work out due to people including other
headers, we may think of a way to block that without reverting.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel
