Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E610EC04FF6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 13:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A488F112C9B;
	Tue, 16 Apr 2024 13:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKti6x8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C215112C9A
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713274241; x=1744810241;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6BJzYsVC6WIKUo870UjCVYUJP7oQHsWuIKuNxp3dXfk=;
 b=mKti6x8AtCgi0N3nHq9Co8W1BULd8Y3kQ50V+yfRgk0evi8kLSWLfI7b
 WPebUsmjsUTZMjLQ2A4vlw103f/4j9NuBOKNx/jDm0dUxAKl2gPyCAaDV
 LkHf3DyFGkiqGD/2/kpMP57mYbgSV+tPxiwjme9JDoWd7/eZLsMBDJmZn
 8YGFRGSd/gghdTKmQvxuTyR4VH0xQAIQv2Lrxc+TtQhOJK89dtNA9piuf
 vKkkgG2Wmr9jQWtoQBAUNE/Rz942A27J90Nb6SO6ATymyE4IqrS3Pc885
 nkeWxJWCQioMgFoF7HLrExulgbeTXi0+aDeOofuTpuWZjnZyVYs0VcqSl w==;
X-CSE-ConnectionGUID: 8pYLEYjEQpedXmPUNjs95w==
X-CSE-MsgGUID: WeVBNlqgQZypgGNYUXUGZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20132473"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="20132473"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:30:40 -0700
X-CSE-ConnectionGUID: C+tnxp2lScq6dsqbk6TW3w==
X-CSE-MsgGUID: 0cBv77z1Smy3UvmdXDAfRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="53242553"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 06:30:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 06:30:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 06:30:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 06:30:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la6Hp9taHXOb2PZ/ToYQ4g1VDlgONiFFrfBiVS4AUFXek0z+lXW+IerfVD0JKH33UCRU1RO75CjKsPJlVzRnG/a9Rv8D8kj6isU2gm8zs/nKVhKBzpzlrvs/kWUHljC5QAKH29DFIwww4O6IKdjzxu9cYUOLfv7iMX9mIRc7i0hGEqZ9YNeRkUctRjh/8IlbW8P3eyvR9UWG54zf0HbKhl5s3+qXOwN2vVBViFYlEZhRED40QExP7qHzDfGt/lDIe5gb1N6D8zJPK24ZoaeOznqyv9ZX1jtpN/kdC6PR3oUg1iGa+E6YFuzYSE+387kEPS4HhQyXS4NcHNkx+XDU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBqdQ84yfeKFwO3wIu1SgzlOVE1swVWV2bTS6TenohU=;
 b=F7qz8EGpfvjC3V0gSZ98IPOxxhL3XfqZKknjt47gcPNTlpkLQbAJPi0CKP1+U+mCDuTmGD8UtGtjG39iHaPp5b/iddWNQjmR8lx3x2tbq9PlAfs5yYOUrreQySV/74TAeS7PG1JjkhxhaKVYVe6UhaypadaJtmuAnS6IphrVVKSYzVFH5tWga0dH0ViYSGjq+rGCgCrPcVWJtDXjcbNYhUnEjdspmr0qPxHasW+zPHdABGcbhdTHPd8bF7RktgQind250sOC5JNft1zKfq9R6JOVB9eklbdxpJoYLH2cWgSRLxdJloOCuWC8bxMSzV7V+4dEx7CRQj+OUF0bSnjkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7883.namprd11.prod.outlook.com (2603:10b6:208:3de::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 13:30:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 13:30:36 +0000
Date: Tue, 16 Apr 2024 08:30:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Message-ID: <zj3ccdsxwfv7yms67c2fycjfhevdzp3qy7yz6u6ffmv4aymo6n@5lu4otfylkbt>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
X-ClientProxiedBy: BYAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 216a8bf3-94c7-4c06-fdee-08dc5e196654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VXYFBzEVv/uQ+hd9LdeSWYzpsbieZK949bPX97r/vx9Gqpo5rpulOTrrRIYhG3DaP6FjDrqIDJR9jD7zgziR2AWO2vWIzdFYT1OqNUOkUXyaqn+0VKg5ZRq65b2GdnBTLDl02LUPq8zTuDzoH3wSygv6UmE6AMHN2zL9fvVMp4Ifafcm5KmO16nwFGqQjYl9ycpkvLWLRPKnCXQNV1l+RLzuoS1DKxrp6iEnf4c8DqVjd/axRrjm2NZ64I2K/s37as18wqN3Hu2d5VtnX0ehQnSHiJBY1pV7OPrgMeRRm5QZZYN3rm16feg0G52ly1lYh1mgU3ORgUPb5mkGhzv/cnCxZE3IBQzkHdFptq5srfK/gvUxg9SGeFKB5yt9YZYS/jrhhe6npw0mIfj6gDOYr7Weom44UwDmax0Bz07Zo29q7G18o7IPhOSsN9lanQoe19Qv/GwjFMLfULppEQ7j1eBQ2vo2aYtWYfLYQlv7GL3NAf9wcXZe7oTunxEDaE0lFppy1ty+VZTkIDEdZMnRxeMwkT4x88w+mEUTjYCD2Kk96QeWIEPvwoFvc15S7E+E7EcYXkYp2lMCse5nZYgJ/PVzpmM3WbTsInLOMF2np9dWRk1TGYh4MmvpHTvtkIjnjvlaWLD0e5nu7L5nGfLVfv7aqC6gZEj9nIqjlc+RBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sNV8Ivb7qU8mtC7KkHaFzY4g5EKo7CLPWj2etwEdDC/j59ujmfrIUcSaub1S?=
 =?us-ascii?Q?NoeQfsmxy8qvcIU8rRXS/fVOist5RiEPNW2tDaRr9Gch6UwrbyD497YFBviv?=
 =?us-ascii?Q?qPoVUv3ftPDIc0XwPTuFxh97tIEQnQLDgOOqqQ6S5/srzob1chlLq1miUj4p?=
 =?us-ascii?Q?PNtRa+eX2P/sv2pfaX/JuN5nJvEkA7fduMXlOSKRpgWtJEZLSVoui5i3EAqZ?=
 =?us-ascii?Q?xVa7KUjxCX3oIUs2OLCqCQNeEevAmp5mPlFlA8hcSq9/0bFEnjQZHO0e0JCJ?=
 =?us-ascii?Q?LuumSh/vNWhtxvwiQDeBs0e1Br0yDBhAD0mITqbHh5BBRIBZTSVpmspy8VOF?=
 =?us-ascii?Q?MF+XkYRvozNLgd4kK53en/iMmbazktUMGWK3jdsF4c2SeVpDK1xmy+r+/dxp?=
 =?us-ascii?Q?khhet5i9xdhGdOkuddLXYht1R19wlhqtVE8OcMtviZzEoN2Z4DVkFNfx2ZIY?=
 =?us-ascii?Q?HEQhvIiziZgpmeNGTYFJapfZCfz9W2/eLeoAXELQiDhU/TC6QslA8TJD8IRX?=
 =?us-ascii?Q?BzOHQooixaNWFYI/wLNJ6oNCi6oyWRhmjabJpVFKO/68UWSid+88U78SqtQC?=
 =?us-ascii?Q?eEAldpX40/abF79HOP1hLU0MqkNM9HYJ43STMPc5i0KLFW1Dz542Sa0arbau?=
 =?us-ascii?Q?o0J8Lk4vQRvJ5uoo8gM9DRdEwSrNCXLr8PbK58r7FnRYSsKyNXP17GDfam+N?=
 =?us-ascii?Q?7aF3eBDLS7QyQHBBiF16Kr/rjigJac6MpkF1uCMas6+6cjJCbgM2Wsh+0SAM?=
 =?us-ascii?Q?Psyum0obz+zqAQOEumJucTluo7jf+fYTNoC/P7wXAlJo/PI21ppuXRJGV+/N?=
 =?us-ascii?Q?Z4xK1pCRQPXZaYXA9pCCS2obqWZt0dQdCAT0B941DyroMvAfzJ0ahhPNBH/N?=
 =?us-ascii?Q?v+nwPkwg4tuz8UJI8+H1q4LzSCb52asU8+7aNqinVVHVlGcVy0PuhO5UNbxZ?=
 =?us-ascii?Q?Ah8OwfL6/IIgWyGKwnhFBczAECAaMylXF/CYDjnT5hxpKfThAHG3iPgQ8+FL?=
 =?us-ascii?Q?8F00UepJFxzXt7oz5uP+yFroQhBdNXjYYm+m3GTSzpy6Ud8Oksq+Uesxv5TY?=
 =?us-ascii?Q?2JLCBn4Lbecim0OkIRuAwDpWziXJWq//Ua/gnXoUmYqv+7iXmKEvfBLeKV95?=
 =?us-ascii?Q?U5iG+XMVViDpMQysmwKahAfEBdVx0ipH6XAFW4w0R8Z2pyxFPItWNszJnnuH?=
 =?us-ascii?Q?CvRCTEFtcNWHQ4HvqllfrNsc6KnkLzdGB57vaFIj2Hlan+2m2L49J2OQ+mK6?=
 =?us-ascii?Q?EZMzk5sBDbrebakc1dU8On93Jvagx0QpPWGqEm6vUi6vj/4NXFMlS5HF8bfh?=
 =?us-ascii?Q?3Enl5AI8fKdeG2ejIGlFFZKwG9J9+pWhJZbDXQXDFK+FhqIsDTcaNmb82L2N?=
 =?us-ascii?Q?7fyBSLeSWyX5/shGwOiGG5JpHaHzaXwpJr9Qwmmi6AAO7LLhv4s8nRCcwKh1?=
 =?us-ascii?Q?Z9jRTrpCpsGhaxR9XmzbptGdauZVhUAmjre5FnpdBigJBW7SnU90t2cIXZH9?=
 =?us-ascii?Q?Rh3wyYrmEgGjZXl7w5VEZ12egXKmu463GffJCpQRzWRLD4qQIIVNvp81uquY?=
 =?us-ascii?Q?fykUX6830zj2qA0MZkxm/kKcyVbTsQOiT3uqwJ8U0ffHtm693a453sM6lhpW?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 216a8bf3-94c7-4c06-fdee-08dc5e196654
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 13:30:36.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8fNgtpk3mzaY6vi5VNhS+M5XoG5ldLpeKXicxVWNt3CJVLbs2PX87cifT74bcfoZysqHUS5wWVBsLWRk7Ou/TUfowjaO6l2WQBtRqtS/9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7883
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

On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>
>On 16/04/2024 04:04, Lucas De Marchi wrote:
>>Add per-client usage statistics to xe. This ports xe to use the common
>>method in drm to export the usage to userspace per client (where 1
>>client == 1 drm fd open).
>>
>>However insted of using the current format, this creates a new one with
>>the unit "ticks". The intention here is not to mix the GPU clock domain
>>with the CPU clock. It allows to cover a few more use cases without
>>extra complications.
>>
>>Last patch was a quick implemenation of a gputop-like tool in python.
>>I ended doing it to cross check the gputop implementation. I's not
>>really meant to be applied here.
>>
>>I tested this on DG2 and TGL with kmscube (console-only) and vkcube
>>(in a gnome session), but it would be good to soak this under more
>>tests. The biggest goal for this patch series right now is to get
>>consensus on the new UAPI.
>>
>>TODO: Add documentation on top with the new interface.
>
>Yeah a drm-usage-stats.rst patch would be nice to have in the RFC so 
>one does not have to look into the driver implementation to discuss 
>the proposed uapi.
>
>Nevertheless I understand the proposal is to add this:
>
> drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks

yes, the gputop patch was more explicit about this. Should had added in
the kernel patch series too.

>
>That's two values per key. I guess "one key value pair for per one 
>line of text" does not get strictly broken and that you propose a 
>heuristics in parsing to detect that the <RUNTIME> cannot be 
>mis-interpreted as the unit?

the current format is

	drm-engine-<class>: <RUNTIME> ns

the "ns" in the end should be parsed by userspace to know
what it is about.

>
>Not sure it is a good idea though. If you instead added a new key for 
>the gpu time what would be the downside in your view? Like:
>
>drm-engine-<class>: <uint> ticks
>drm-ticks-<class>: <uint>
>
>Or maybe even obsfuscate/generalise as:
>
>drm-engine-<class>: <uint> gpu-time
>drm-gpu-time-<class>: <uint>

I think both work, but I fail to see the advantage. This alternative is
slightly heavier on the parsing side since you have to correlate the
values from 2 keys, possibly dealing with them appearing in different
order. The only possible breakage remains with this alternative: if
userspace didn't parse the unit before. I checked nvtop and htop and
they were doing the right thing. I sent a fix to igt a few weeks back
for it to consider the unit:
https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/

>
>Potentially could also add a key saying how much wall time is one unit 
>of GPU time.

I wouldn't add it really as it may not make sense depending on the
vendor and or usage. Examples: the gpu time may be different for
different engines depending on where they are located (tile/gt). The
correlation with CPU time is different when running in VF mode, and may
change in runtime depending on the number of VFs. +Michal.

Also, if the userspace side really wants to know (why would it?)
it could be just calculate from 2 samples (possibly repeated a few
times as it updates the output).

>
>Or.. would even the existing drm-cycles, plus abuse of drm-maxfreq, 
>work? Ticks == cycles, maxfreq == ticks per wall second.

I think it'd be up to gpu vendor what clock backs this time. For the
current Intel cards, it's the refclock and it doesn't vary the
frequency.

>
>Secondly, wrap behaviour every 25-30 seconds patch 6/7 describes 
>definitely breaks the format spec and in my view should be worked 
>around in the driver:
>
>"""
>Values are not required to be constantly monotonic if it makes the driver
>implementation easier, but are required to catch up with the 
>previously reported
>larger value within a reasonable period. Upon observing a value lower 
>than what
>was previously read, userspace is expected to stay with that larger previous
>value until a monotonic update is seen.
>"""

but this is the behavior for dealing with "ns", not with "ticks". We can
add a worker to run every so often.  When I got the original patches
from Umesh, we had this worker implemented, but dealing with that was
complex and wasting a lot of cycles since it was always running (except
if we didn't have any exec_queue). Here is my tentative to simplify it
since I don't really see the need to account for a ~25s wrap around.

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>
>>Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/
>>
>>Lucas De Marchi (5):
>>   drm/xe: Promote xe_hw_engine_class_to_str()
>>   drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
>>   drm/xe: Add helper to capture engine timestamp
>>   drm/xe/client: Print runtime to fdinfo
>>   HACK: simple gputop-like impl in python
>>
>>Umesh Nerlige Ramappa (2):
>>   drm/xe/lrc: Add helper to capture context timestamp
>>   drm/xe: Add helper to capture context runtime
>>
>>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>>  drivers/gpu/drm/xe/xe_device_types.h          |   9 ++
>>  drivers/gpu/drm/xe/xe_drm_client.c            |  81 ++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.c            |  37 ++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.h            |   1 +
>>  drivers/gpu/drm/xe/xe_hw_engine.c             |  29 +++++
>>  drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +
>>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  18 ---
>>  drivers/gpu/drm/xe/xe_lrc.c                   |  11 ++
>>  drivers/gpu/drm/xe/xe_lrc.h                   |   2 +
>>  drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
>>  drivers/gpu/drm/xe/xe_sched_job.c             |   2 +
>>  pyfdinfo                                      | 113 ++++++++++++++++++
>>  13 files changed, 292 insertions(+), 19 deletions(-)
>>  create mode 100755 pyfdinfo
>>
