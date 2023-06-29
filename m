Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D8CEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278FA10E0B4;
	Thu, 29 Jun 2023 20:14:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A29810E0B4
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688069680; x=1719605680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6PL6t7h2eJqkP5V5xhfzmDYHmvNkR97cjXRvs0cbVhY=;
 b=aXOmaUjmFQFFDniE906va41nOeTrjSQqVqYYd3K44pe05Yhgc660hU6Y
 hYiibig1AyS0e65ts4+3BorWtcPe1t5rfalUZDziDau3z9blkY7PtSfYt
 h2fnpQk/cN6ikhvyEGJI17PmA44ypUqgcjteDoZV8yAiQx1Io/TZ1oqWt
 D9UEEfI//NW/Eq4wPoVmBNEFu17JviiO/RCXd7tbfQzVZDAE9ipJjpUsH
 /AXoT2sfRaqJwxkNNbc0iqtFyYL/2g8PVcKcsWBqtvnISiIJ9b/SDECeL
 KH55jL2sn+ZtZC/59wAKVj8pyV7SKClgPFnJfFVr1e04izkQk4P9YSLk8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342555758"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="342555758"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:14:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="694791443"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="694791443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 29 Jun 2023 13:14:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 13:14:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 13:14:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 13:14:37 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 13:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2LGIPatLMhNiQJd0tNsWWFPAPpXA/d11l6LWYtGRQYGeYh3zrWbfS2sGIlW09dbKB6xVx1uEyDo8jhc04Vw2B3qez2NNNkOU+AH7VWDH4BPNiq02S7s8p/Iir+XpVKP9r2Xr88t6+Sp6y15cND4+jz7/SU2sZZGkiYxJuqe5CFj7fVeHXTsKoRItePWrWtU/NC5RPhth0LyxW1ntU0fHRebY1ehj/tK9I3BJnlS/9eRX+4LzA/KPpMrUlgUupNWYtP4WBLMoobxToGZvhoiPyjZ4VDnzQP0MfuLUwNq1X7fJCRZ3+6DdyHxCb0wwdX0koyg14U2ZHSYe0bxrV2tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IInMgeTwFcyc96hqD3MS1YL/1OtjDI0DXU66THWWyKk=;
 b=jpXtRBoPBpIsYT/q4oHhDMZAfXHBULWTdJFgy3Nsc2mmEl12aiyt2N9jIpaoRi2ilWnPoHMptf54ux1xpNgSpPnDBPEsaCvaeHHAejPgL3Aejbz/wOSttfFQlIFACNGKbOUd0LnGF3vOH86WDauI0++KLZjIfvvVN1aZZF6QEo3aRBw+DQ8XMJWjVhrsNWz3FFBUevX45zkEvXVl0s/We8jVJUuCsmsADb1LNU9/OtAaCXE62VXuItMnPb9zDvDKeYYnR1GaWQsKQ4Qy5Fg1hUyBcY3mup0nucJZu1TrM15qRel0wqT6HxfIViNJURx4bCSE4AuCwqiId5cj+ADvCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 20:14:32 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 20:14:32 +0000
Date: Thu, 29 Jun 2023 13:14:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZJ3mIM9asFnVKoyW@nvishwa1-DESK>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-7-tejas.upadhyay@intel.com>
 <ZJy2hLdxM4DDhl8P@nvishwa1-DESK>
 <SJ1PR11MB6204DE43A6D3CC609D8DD5938125A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204DE43A6D3CC609D8DD5938125A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
 To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: a0edaad8-8ff0-4df9-6140-08db78dd734d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: we9CJwKy7OvRy6zP4Xgqi+D+5Hi/6u2M7XR+wDJFJycH9tvKggi30fykxk7zGJ5xXBx+lDxFU9kveTgzAyJLhXgmQ1HDtJI/Oe1zS87gR/mkMzDS+3yv7a8rSmV1dWvpP6tsVOvJE0Mxu987l4F4cNUjXXyqAZJyMfEm7kWwuLNxh4tgOIUFHQYn0zcG6+neHD1mOeSRBdGuyn5yNkQhHfNnK/yMJmT2yhlYCKmkhaFAKY7rGduE6dUdNNkxslMEo+ODljlM5mPhPJmgZQxCaYL4ZO9Al38oeKEV/HtdbHJHOfTbKb7n5dlHpIKEomb9kCBmGb24brAoY+tIoZAhiNNqMKAr+/Ja7uPtEVD0VXMrjljT+yQgM5LGB7PvuYjxAihmCsmR4JDaDXmLnigAjRabdknYFUZ2gjUbjsQQ1VsEBkpCVV21nr2wKluDP+EA4TNNw4BMMpt0AfcF7Z3i5fDb2nj29eWg1SsXx6v7U4S5J2HGSQe12JAQOv3/oJXHajOuq6woZqon3FRUEwmb7tQdh4lrQveJQ+k8VNDbaKqxEdgZpIz0/rZIuHnGe58/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(66556008)(53546011)(6506007)(66476007)(6862004)(86362001)(44832011)(30864003)(5660300002)(316002)(82960400001)(41300700001)(8936002)(4326008)(38100700002)(66946007)(6636002)(8676002)(33716001)(6486002)(9686003)(478600001)(2906002)(186003)(6512007)(26005)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lTqbPfpV9G6Gw4uVFUaxNDECecoJ/Yb7OaHIAZcNYjDjekAaeNOF9rxiOW5X?=
 =?us-ascii?Q?zRO56cjrVWmW7Gpu/byUky4lPIVNT397y8UQ96n7exb1VrFuBsCXaNgYBEs0?=
 =?us-ascii?Q?iyFQCTcv1Xs7PrPqZomkLjUimL4p2FkljHvm9fGbxYKkHodC5LJBVNbUcH3R?=
 =?us-ascii?Q?vUwXwfTpDHvgGu5iXAza1vy71469Wd1YMJ7F917XtOL+YD/8OrK/OuwNldtW?=
 =?us-ascii?Q?AJhljWFIQ44rg15NUJhKmd6+PAyR0EkVKaaRQWLbrZqTxUnptBpKoCq5GO+w?=
 =?us-ascii?Q?dPzA0PKvPscpG+vyg3xsR0zIHcRkko6wPqmnNXHlk44wLXE4bpw3tFksmViE?=
 =?us-ascii?Q?0+BDLfMBPQxDbRnuGSuPvR4GbigH+714WS37vyLfFfANaiDn3htDP9CxvGHY?=
 =?us-ascii?Q?3qZmqOxxx+uQ35mVc0gi7eKcqQsWwV4eHcHbwWVrw3YSYZGpQGFe41ZCwFWG?=
 =?us-ascii?Q?VfB3g89zvtx0LgsYVuceMMPKaK6PqG3vZw5y1f0neqZnXSDSqddlpeYISC1P?=
 =?us-ascii?Q?hKyKo02nNM4hyjvneLb0gFoeq96PS7Kw51/XdzVwObQg+xbYEOaPdz+Fki4t?=
 =?us-ascii?Q?TBVezhQM+9Ic4+oeGvdtdl1/N1VzAWepCLatyq1dc4/pTjdpqjL44tNp/4Dm?=
 =?us-ascii?Q?zTTpQ/Q6EtVlIhJ7EFa99fDXzOJ2TeWwuesh98ep7oc/Tf0EW/fFjGTLawck?=
 =?us-ascii?Q?kUjwTJtFRNTkWQULxnVOwnsom/MMOu/8lj0hwcdte8CE+BjP3NOsSdaAbCyE?=
 =?us-ascii?Q?cwGa5ZZZBZAOLc0UXx7aD/88KV+4LHlGJ5Fb58tUDqgaLwI13hhbWeGnlluU?=
 =?us-ascii?Q?gx6ktzTg35/2AktX6SaxleE0UWT9hr9oMFq7Qx7rPu9PWuFFHzZOBSOFBVZu?=
 =?us-ascii?Q?aYm+aqRY3Z7aKjnQopCqXHKVBdcYXONPpOJauRDgGRDs8wUSe03yWRj65KE7?=
 =?us-ascii?Q?/S4GrI5dcpp+8WAOdiXqDiEwH7/SaucW/wzxSmhHTUbfmKK32sWZZXqUR2Gx?=
 =?us-ascii?Q?r8RUMBZz7QKquNiEy+xQEvtMop95qefqmVDnFmx/e0IDKwM8Lejsr6ggKURE?=
 =?us-ascii?Q?lRE8enjw86NCIFkir6ioxDKB50IOjYbQCWxVdB1m/u4SVfJyZojm9qkzDW+s?=
 =?us-ascii?Q?3m0Js+NFuNRg7EcUOHSJRxxkJKDzLEerozoWQcQVcf6W3/YNLquYTbT1Y6KW?=
 =?us-ascii?Q?Gy2loS3YO7FxO4mGQuYy8Tj4AGMyhWfP6e2G2jnWFP9lr0xXYqha0T3pEt6G?=
 =?us-ascii?Q?PMC9qzrW1rTpQy1D5mwofqC3ZrAS5bZsao4azFGEQqV0yN9rcaanPSDO2x6V?=
 =?us-ascii?Q?8OIc5sKvQ8mNw4lZPVkyPE9sY8SlfCPu8YRSfal6kXSl8kFITjaGRhii3Rg3?=
 =?us-ascii?Q?Ct7agPP5KScMgCh2TTN6z72Yuphv41er0THGTQneyYu6MWE9xsDGJ8VZoZYQ?=
 =?us-ascii?Q?vNJTnFnaKUPqOidIHk/x/TGO6ZC/cZquLxIjGyAuMKMQdfdc+L3L3OC7KHs/?=
 =?us-ascii?Q?BASJx3knBClqIec59uiU1mwiIyjds5Z0aWz6Ect6N2tTMEOVcGhNfvwX8tbt?=
 =?us-ascii?Q?Nvj+8JRfd6aSCXItpDtxoX4NLbg0QUBsJECjEcvP63SdBUVtZAntVEjBEcdr?=
 =?us-ascii?Q?xL7tdIMawZD+S/cDkDJNx2E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0edaad8-8ff0-4df9-6140-08db78dd734d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 20:14:32.2424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nWgTosrbnfWLfpDngPmjbv5CJQpf/AfJO1AkC5DxNq3ajZTMl0TQhNtr6jexyL6L34fQg4Ft5FnQTrozjGeGLZIdRmndeFz3lML81AXnwLxwxjxqXGLKyATxdZZ2Tmk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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

On Wed, Jun 28, 2023 at 09:19:10PM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Thursday, June 29, 2023 4:09 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
>> scheduler properties
>>
>> On Wed, Jun 28, 2023 at 05:17:32PM +0530, Tejas Upadhyay wrote:
>> >Add sysfs entries for the min, max, and defaults for each of engine
>> >scheduler controls for every hardware engine class.
>> >
>> >Non-elevated user IOCTLs to set these controls must be within the
>> >min-max ranges of the sysfs entries, elevated user can set these
>> >controls to any value. However, introduced compile time CONFIG min-max
>> >values which restricts elevated user to be in compile time min-max
>> >range if at all sysfs min/max are violated.
>> >
>> >Sysfs entries examples are,
>> >DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
>> >job_timeout_max         job_timeout_ms          preempt_timeout_min
>> timeslice_duration_max  timeslice_duration_us
>> >job_timeout_min         preempt_timeout_max     preempt_timeout_us
>> timeslice_duration_min
>> >
>> >DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
>> >.defaults/              job_timeout_min         preempt_timeout_max
>> preempt_timeout_us      timeslice_duration_min
>> >job_timeout_max         job_timeout_ms          preempt_timeout_min
>> timeslice_duration_max  timeslice_duration_us
>> >
>> >V3 :
>> >   - Resolve CI hooks warning for kernel-doc
>> >V2 :
>> >   - Restric min/max setting to #define default min/max for
>> >     elevated user - Himal
>> >   - Remove unrelated changes from patch - Niranjana
>> >
>> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >---
>> > drivers/gpu/drm/xe/Kconfig              |   7 +
>> > drivers/gpu/drm/xe/Kconfig.profile      |  38 +++
>> > drivers/gpu/drm/xe/xe_engine.c          |  58 +++-
>> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 407 +++++++++++++++++++++++-
>> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
>> > drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
>> > drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
>> > drivers/gpu/drm/xe/xe_hw_engine_types.h |  16 +-
>> > 8 files changed, 550 insertions(+), 14 deletions(-)  create mode
>> >100644 drivers/gpu/drm/xe/Kconfig.profile
>> >
>> >diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> >index d44794f99338..964c440a1135 100644
>> >--- a/drivers/gpu/drm/xe/Kconfig
>> >+++ b/drivers/gpu/drm/xe/Kconfig
>> >@@ -83,3 +83,10 @@ depends on DRM_XE
>> > depends on EXPERT
>> > source "drivers/gpu/drm/xe/Kconfig.debug"
>> > endmenu
>> >+
>> >+menu "drm/xe Profile Guided Optimisation"
>> >+        visible if EXPERT
>> >+        depends on DRM_XE
>> >+        source "drivers/gpu/drm/xe/Kconfig.profile"
>> >+endmenu
>> >+
>> >diff --git a/drivers/gpu/drm/xe/Kconfig.profile
>> >b/drivers/gpu/drm/xe/Kconfig.profile
>> >new file mode 100644
>> >index 000000000000..bc65326d52b4
>> >--- /dev/null
>> >+++ b/drivers/gpu/drm/xe/Kconfig.profile
>> >@@ -0,0 +1,38 @@
>> >+config DRM_XE_JOB_TIMEOUT_MAX
>> >+       int "Default max job timeout (ms)"
>> >+       default 10000 # milliseconds
>> >+       help
>> >+         Configures the default max job timeout after which job will
>> >+         be forcefully taken away from scheduler.
>>
>> Should we also mention 'default and configurable upper limit"?
>> Similarly for other parameters also.
>
>'default and configurable upper limit" are same. Do you mean we should mention that?

May be we can say "sets the upper limit configurable job timeout max value".
We need to document somewhere what you responded below on min/max values and CAP_SYS_NICE.

>
>>
>> >+config DRM_XE_JOB_TIMEOUT_MIN
>> >+       int "Default max job timeout (ms)"
>> >+       default 1 # milliseconds
>> >+       help
>> >+         Configures the default min job timeout after which job will
>> >+         be forcefully taken away from scheduler.
>> >+config DRM_XE_TIMESLICE_MAX
>> >+       int "Default max timeslice duration (us)"
>> >+       default 10000000 # microseconds
>> >+       help
>> >+         Configures the default max timeslice duration between multiple
>> >+         contexts by guc scheduling.
>> >+config DRM_XE_TIMESLICE_MIN
>> >+       int "Default min timeslice duration (us)"
>> >+       default 1 # microseconds
>> >+       help
>> >+         Configures the default min timeslice duration between multiple
>> >+         contexts by guc scheduling.
>> >+config DRM_XE_PREEMPT_TIMEOUT_MAX
>> >+       int "Default max  preempt timeout (us)"
>> >+       default 10000000 # microseconds
>> >+       help
>> >+         Configures the default max preempt timeout after which context
>> >+         will be forcefully taken away and higher priority context will
>> >+         run.
>> >+config DRM_XE_PREEMPT_TIMEOUT_MIN
>> >+       int "Default min  preempt timeout (us)"
>> >+       default 1 # microseconds
>> >+       help
>> >+         Configures the default min preempt timeout after which context
>> >+         will be forcefully taken away and higher priority context will
>> >+         run.
>> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
>> >b/drivers/gpu/drm/xe/xe_engine.c index 33d1fbae560d..37c33a231f00
>> >100644
>> >--- a/drivers/gpu/drm/xe/xe_engine.c
>> >+++ b/drivers/gpu/drm/xe/xe_engine.c
>> >@@ -13,6 +13,7 @@
>> >
>> > #include "xe_device.h"
>> > #include "xe_gt.h"
>> >+#include "xe_gt_sysfs.h"
>> > #include "xe_hw_fence.h"
>> > #include "xe_lrc.h"
>> > #include "xe_macros.h"
>> >@@ -191,9 +192,26 @@ static int engine_set_priority(struct xe_device
>> >*xe, struct xe_engine *e,  static int engine_set_timeslice(struct xe_device
>> *xe, struct xe_engine *e,
>> > 				u64 value, bool create)
>> > {
>> >-	if (!capable(CAP_SYS_NICE))
>> >+	if (!capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     e->hwe->sched_props.timeslice_min,
>> >+				     e->hwe->sched_props.timeslice_max))
>> > 		return -EPERM;
>> >
>> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
>> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>> >+		return -EPERM;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
>> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
>> >+		return -EPERM;
>> >+#endif
>> >+
>> > 	return e->ops->set_timeslice(e, value); }
>> >
>> >@@ -201,9 +219,26 @@ static int engine_set_preemption_timeout(struct
>> xe_device *xe,
>> > 					 struct xe_engine *e, u64 value,
>> > 					 bool create)
>> > {
>> >-	if (!capable(CAP_SYS_NICE))
>> >+	if (!capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     e->hwe-
>> >sched_props.preempt_timeout_min,
>> >+				     e->hwe-
>> >sched_props.preempt_timeout_max))
>> > 		return -EPERM;
>> >
>> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
>> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>> >+
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>> >+		return -EPERM;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> >+
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> >+		return -EPERM;
>> >+#endif
>> >+
>> > 	return e->ops->set_preempt_timeout(e, value); }
>> >
>> >@@ -269,8 +304,25 @@ static int engine_set_job_timeout(struct xe_device
>> *xe, struct xe_engine *e,
>> > 	if (XE_IOCTL_ERR(xe, !create))
>> > 		return -EINVAL;
>> >
>> >-	if (!capable(CAP_SYS_NICE))
>> >+	if (!capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     e->hwe->sched_props.job_timeout_min,
>> >+				     e->hwe->sched_props.job_timeout_max))
>> >+		return -EPERM;
>> >+
>> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
>> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
>> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>> >+		return -EPERM;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> > 		return -EPERM;
>> >+#endif
>> >
>> > 	return e->ops->set_job_timeout(e, value);  } diff --git
>> >a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >index 4c8f589870ba..743ef9f105d0 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >@@ -34,6 +34,11 @@ static const struct kobj_type kobj_xe_engine_type = {
>> > 	.sysfs_ops = &kobj_sysfs_ops
>> > };
>> >
>> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
>> >+	return timeout >= min && timeout <= max; }
>> >+
>> > static ssize_t preempt_timeout_store(struct kobject *kobj,
>> > 				     struct kobj_attribute *attr,
>> > 				     const char *buf, size_t count) @@ -46,9
>> +51,26 @@ static
>> >ssize_t preempt_timeout_store(struct kobject *kobj,
>> > 	if (err)
>> > 		return err;
>> >
>> >-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>> >+	if (!capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+				     hwe-
>> >sched_props.preempt_timeout_min,
>> >+				     hwe-
>> >sched_props.preempt_timeout_max))
>> > 		return -EINVAL;
>> >
>> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
>> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>> >+
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> >+
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#endif
>> >+
>>
>> It is still confusing to me as to,
>> 1. Given, hwe->sched_props.preempt_timeout_min/max is already
>> subjected to boundary
>>     check, why we are checking again.
>> 2. What is the logic with CAP_SYS_NICE here?
>> More on this below.
>
>Non-elevated user : will have limit of what is configured through sysfs min/max, which might be same as default/compile configured min/max or different one under limit of default/compile configured min/max.
>
>Elevated user : Will also have limit but of default/compile configured min/max, which might be same or above range of configured through sysfs min/max. For example, sysfs_min = 2, sysfs_max = 5, default/compile_min = 1, default/compile_max = 100
>
>Non-elevated user tries :
>1.  set timeout  3 --> in limit of sysfs min/max --> allowed
>2.  set timeout  6 --> out of limit of sysfs min/max --> not allowed
>
>Elevated user tries :
>1.  set timeout  3 --> in limit of sysfs min/max --> allowed
>2.  set timeout  6 --> out of limit of sysfs min/max --> in limit of default/compile_min/max --> allowed
>3.  set timeout  101 --> out of limit of sysfs min/max --> out of limit of default/compile_min/max --> not allowed
>

Ok. But all the '#if defined(CONFIG..." checks seems incorrect.
We should just check against the XE_HW_ENGINE*_MIN/MAX.

min = capable(CAP_SYS_NICE) ? XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN : hwe->sched_props.preempt_timeout_min;
max = capable(CAP_SYS_NICE) ? XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX : hwe->sched_props.preempt_timeout_max;
if (!engine_timeout_in_range(timeout, min, max))
      return -EINVAL;

>>
>> > 	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
>> >
>> > 	return count;
>> >@@ -65,6 +87,90 @@ static ssize_t preempt_timeout_show(struct kobject
>> >*kobj,  static struct kobj_attribute preempt_timeout_attr =
>> >__ATTR(preempt_timeout_us, 0644, preempt_timeout_show,
>> >preempt_timeout_store);
>> >
>> >+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
>> >+					 struct kobj_attribute *attr,
>> >+					 const char *buf, size_t count)
>> >+{
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+	u32 timeout;
>> >+	int err;
>> >+
>> >+	err = kstrtou32(buf, 0, &timeout);
>> >+	if (err)
>> >+		return err;
>> >+
>> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
>> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>> >+	if (!engine_timeout_in_range(timeout,
>> >+
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>> >+
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> >+
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#endif
>> >+
>> >+	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
>> >+
>> >+	return count;
>> >+}
>>
>> I still have few concerns here.
>> 1. If the configs are defined, then we don't need CAP_SYS_NICE? If there is
>> some logic here,
>>     can you add a comment with the explanation?
>
>As I explained scenario above for elevated user.
>
>> 2. XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/MAX already checks the
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/MAX
>>     if they are defined. Then, we do we need separate checks here?
>
>This is correct, I had this change to use directly XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/MAX locally, somehow missed to add it. I will address this.
>

Ok, also, here we can endup with min being greater than max.
We should check against that as well.

Niranjana

>>
>> >+
>> >+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
>> >+					struct kobj_attribute *attr, char *buf)
>> {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe-
>> >sched_props.preempt_timeout_max);
>> >+}
>> >+
>> >+static struct kobj_attribute preempt_timeout_max_attr =
>> >+	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
>> >+	       preempt_timeout_max_store);
>> >+
>> >+static ssize_t preempt_timeout_min_store(struct kobject *kobj,
>> >+					 struct kobj_attribute *attr,
>> >+					 const char *buf, size_t count)
>> >+{
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+	u32 timeout;
>> >+	int err;
>> >+
>> >+	err = kstrtou32(buf, 0, &timeout);
>> >+	if (err)
>> >+		return err;
>> >+
>> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
>> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
>> >+	if (!engine_timeout_in_range(timeout,
>> >+
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
>> >+
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> >+
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#endif
>> >+
>> >+	WRITE_ONCE(hwe->sched_props.preempt_timeout_min, timeout);
>> >+
>> >+	return count;
>> >+}
>> >+
>> >+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
>> >+					struct kobj_attribute *attr, char *buf)
>> {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe-
>> >sched_props.preempt_timeout_min);
>> >+}
>> >+
>> >+static struct kobj_attribute preempt_timeout_min_attr =
>> >+	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
>> >+	       preempt_timeout_min_store);
>> >+
>> > static ssize_t timeslice_duration_store(struct kobject *kobj,
>> > 					struct kobj_attribute *attr,
>> > 					const char *buf, size_t count)
>> >@@ -77,14 +183,116 @@ static ssize_t timeslice_duration_store(struct
>> kobject *kobj,
>> > 	if (err)
>> > 		return err;
>> >
>> >-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>> >+	if (!capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(duration,
>> >+				     hwe->sched_props.timeslice_min,
>> >+				     hwe->sched_props.timeslice_max))
>> > 		return -EINVAL;
>> >
>> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
>> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(duration,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(duration,
>> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
>> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
>> >+		return -EINVAL;
>> >+#endif
>> >+
>> > 	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
>> >
>> > 	return count;
>> > }
>> >
>> >+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
>> >+					    struct kobj_attribute *attr,
>> >+					    const char *buf, size_t count) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+	u32 duration;
>> >+	int err;
>> >+
>> >+	err = kstrtou32(buf, 0, &duration);
>> >+	if (err)
>> >+		return err;
>> >+
>> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
>> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>> >+	if (!engine_timeout_in_range(duration,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(duration,
>> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
>> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
>> >+		return -EINVAL;
>> >+#endif
>> >+
>> >+	WRITE_ONCE(hwe->sched_props.timeslice_max, duration);
>> >+
>> >+	return count;
>> >+}
>> >+
>> >+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
>> >+					   struct kobj_attribute *attr,
>> >+					   char *buf)
>> >+{
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_max); }
>> >+
>> >+static struct kobj_attribute timeslice_duration_max_attr =
>> >+	__ATTR(timeslice_duration_max, 0644,
>> timeslice_duration_max_show,
>> >+	       timeslice_duration_max_store);
>> >+
>> >+static ssize_t timeslice_duration_min_store(struct kobject *kobj,
>> >+					    struct kobj_attribute *attr,
>> >+					    const char *buf, size_t count) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+	u32 duration;
>> >+	int err;
>> >+
>> >+	err = kstrtou32(buf, 0, &duration);
>> >+	if (err)
>> >+		return err;
>> >+
>> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
>> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>> >+	if (!engine_timeout_in_range(duration,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(duration,
>> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
>> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
>> >+		return -EINVAL;
>> >+#endif
>> >+
>> >+	WRITE_ONCE(hwe->sched_props.timeslice_min, duration);
>> >+
>> >+	return count;
>> >+}
>> >+
>> >+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
>> >+					   struct kobj_attribute *attr, char
>> *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_min); }
>> >+
>> >+static struct kobj_attribute timeslice_duration_min_attr =
>> >+	__ATTR(timeslice_duration_min, 0644,
>> timeslice_duration_min_show,
>> >+	       timeslice_duration_min_store);
>> >+
>> > static ssize_t timeslice_duration_show(struct kobject *kobj,
>> > 				       struct kobj_attribute *attr, char *buf)  {
>> @@ -109,8
>> >+317,25 @@ static ssize_t job_timeout_store(struct kobject *kobj,
>> > 	if (err)
>> > 		return err;
>> >
>> >-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>> >+	if (!capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+				     hwe->sched_props.job_timeout_min,
>> >+				     hwe->sched_props.job_timeout_max))
>> >+		return -EINVAL;
>> >+
>> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
>> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
>> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> > 		return -EINVAL;
>> >+#endif
>> >
>> > 	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
>> >
>> >@@ -128,13 +353,6 @@ static ssize_t job_timeout_show(struct kobject
>> >*kobj,  static struct kobj_attribute job_timeout_attr =
>> >__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
>> >
>> >-static const struct attribute *files[] = {
>> >-	&job_timeout_attr.attr,
>> >-	&timeslice_duration_attr.attr,
>> >-	&preempt_timeout_attr.attr,
>> >-	NULL
>> >-};
>> >-
>> > static ssize_t job_timeout_default(struct kobject *kobj,
>> > 				   struct kobj_attribute *attr, char *buf)  {
>> @@ -143,6 +361,28 @@
>> >static ssize_t job_timeout_default(struct kobject *kobj,
>> > 	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);  }
>> >
>> >+static ssize_t job_timeout_min_default(struct kobject *kobj,
>> >+				       struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_min); }
>> >+
>> >+static struct kobj_attribute job_timeout_min_def =
>> >+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
>> >+
>> >+static ssize_t job_timeout_max_default(struct kobject *kobj,
>> >+				       struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_max); }
>> >+
>> >+static struct kobj_attribute job_timeout_max_def =
>> >+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
>> >+
>> > static struct kobj_attribute job_timeout_def = __ATTR(job_timeout_ms,
>> > 0444, job_timeout_default, NULL);
>> >
>> >@@ -157,6 +397,123 @@ static ssize_t timeslice_default(struct kobject
>> >*kobj,  static struct kobj_attribute timeslice_duration_def =
>> >__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>> >
>> >+static ssize_t timeslice_min_default(struct kobject *kobj,
>> >+				     struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_min); }
>> >+
>> >+static struct kobj_attribute timeslice_duration_min_def =
>> >+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
>> >+
>> >+static ssize_t timeslice_max_default(struct kobject *kobj,
>> >+				     struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_max); }
>> >+
>> >+static struct kobj_attribute timeslice_duration_max_def =
>> >+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
>> >+
>> >+static ssize_t job_timeout_max_store(struct kobject *kobj,
>> >+				     struct kobj_attribute *attr,
>> >+				     const char *buf, size_t count) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+	u32 timeout;
>> >+	int err;
>> >+
>> >+	err = kstrtou32(buf, 0, &timeout);
>> >+	if (err)
>> >+		return err;
>> >+
>> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
>> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
>> >+	if (!engine_timeout_in_range(timeout,
>> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
>> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#endif
>> >+
>> >+	WRITE_ONCE(hwe->sched_props.job_timeout_max, timeout);
>> >+
>> >+	return count;
>> >+}
>> >+
>> >+static ssize_t job_timeout_max_show(struct kobject *kobj,
>> >+				    struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_max);
>> >+}
>> >+
>> >+static struct kobj_attribute job_timeout_max_attr =
>> >+__ATTR(job_timeout_max, 0644, job_timeout_max_show,
>> >+job_timeout_max_store);
>> >+
>> >+static ssize_t job_timeout_min_store(struct kobject *kobj,
>> >+				     struct kobj_attribute *attr,
>> >+				     const char *buf, size_t count) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+	u32 timeout;
>> >+	int err;
>> >+
>> >+	err = kstrtou32(buf, 0, &timeout);
>> >+	if (err)
>> >+		return err;
>> >+
>> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
>> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
>> >+	if (!engine_timeout_in_range(timeout,
>> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
>> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#else
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(timeout,
>> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> >+		return -EINVAL;
>> >+#endif
>> >+
>> >+	WRITE_ONCE(hwe->sched_props.job_timeout_min, timeout);
>> >+
>> >+	return count;
>> >+}
>> >+
>> >+static ssize_t job_timeout_min_show(struct kobject *kobj,
>> >+				    struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_min);
>> >+}
>> >+
>> >+static struct kobj_attribute job_timeout_min_attr =
>> >+__ATTR(job_timeout_min, 0644, job_timeout_min_show,
>> >+job_timeout_min_store);
>> >+
>> >+static const struct attribute *files[] = {
>> >+	&job_timeout_attr.attr,
>> >+	&job_timeout_min_attr.attr,
>> >+	&job_timeout_max_attr.attr,
>> >+	&timeslice_duration_attr.attr,
>> >+	&timeslice_duration_min_attr.attr,
>> >+	&timeslice_duration_max_attr.attr,
>> >+	&preempt_timeout_attr.attr,
>> >+	&preempt_timeout_min_attr.attr,
>> >+	&preempt_timeout_max_attr.attr,
>> >+	NULL
>> >+};
>>
>> Why is this moved down here?
>> Looks like things are not kept in order.
>>
>> >+
>> > static ssize_t preempt_timeout_default(struct kobject *kobj,
>> > 				       struct kobj_attribute *attr,
>> > 				       char *buf)
>> >@@ -169,10 +526,40 @@ static ssize_t preempt_timeout_default(struct
>> >kobject *kobj,  static struct kobj_attribute preempt_timeout_def =
>> >__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>> >
>> >+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
>> >+					   struct kobj_attribute *attr,
>> >+					   char *buf)
>> >+{
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_min);
>> >+}
>> >+
>> >+static struct kobj_attribute preempt_timeout_min_def =
>> >+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
>> NULL);
>> >+
>> >+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
>> >+					   struct kobj_attribute *attr,
>> >+					   char *buf)
>> >+{
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_max);
>> >+}
>> >+
>> >+static struct kobj_attribute preempt_timeout_max_def =
>> >+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
>> NULL);
>> >+
>> > static const struct attribute *defaults[] = {
>> > 	&job_timeout_def.attr,
>> >+	&job_timeout_min_def.attr,
>> >+	&job_timeout_max_def.attr,
>> > 	&timeslice_duration_def.attr,
>> >+	&timeslice_duration_min_def.attr,
>> >+	&timeslice_duration_max_def.attr,
>> > 	&preempt_timeout_def.attr,
>> >+	&preempt_timeout_min_def.attr,
>> >+	&preempt_timeout_max_def.attr,
>> > 	NULL
>> > };
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >index a539cf031c7d..a7ac7b9a9768 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >@@ -12,6 +12,7 @@
>> >
>> > int xe_gt_sysfs_init(struct xe_gt *gt); int xe_gt_sysfs_engines(struct
>> > xe_gt *gt);
>> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>> >
>> > static inline struct xe_gt *
>> > kobj_to_gt(struct kobject *kobj)
>> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> >b/drivers/gpu/drm/xe/xe_hw_engine.c
>> >index bd94155a28b3..2b053ee0af80 100644
>> >--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> >@@ -363,8 +363,14 @@ static void hw_engine_init_early(struct xe_gt *gt,
>> struct xe_hw_engine *hwe,
>> > 	hwe->engine_id = id;
>> > 	/* FIXME: Wire up to configurable default value */
>> > 	hwe->sched_props.job_timeout_ms = HZ * 5;
>> >+	hwe->sched_props.job_timeout_min =
>> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>> >+	hwe->sched_props.job_timeout_max =
>> XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>> > 	hwe->sched_props.timeslice_us = 1 * 1000;
>> >+	hwe->sched_props.timeslice_min =
>> XE_HW_ENGINE_TIMESLICE_MIN;
>> >+	hwe->sched_props.timeslice_max =
>> XE_HW_ENGINE_TIMESLICE_MAX;
>> > 	hwe->sched_props.preempt_timeout_us = 640 * 1000;
>> >+	hwe->sched_props.preempt_timeout_min =
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>> >+	hwe->sched_props.preempt_timeout_max =
>> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>> > 	hwe->defaults = hwe->sched_props; /* Record default props */
>> >
>> > 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt)); diff --git
>> >a/drivers/gpu/drm/xe/xe_hw_engine.h
>> b/drivers/gpu/drm/xe/xe_hw_engine.h
>> >index 7eca9d53c7b1..3d37d6d44261 100644
>> >--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> >@@ -10,6 +10,37 @@
>> >
>> > struct drm_printer;
>> >
>> >+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>> >+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN
>> CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>> >+#else #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
>> >+CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
>> XE_HW_ENGINE_JOB_TIMEOUT_MAX
>> >+CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else #define
>> >+XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
>> >+CONFIG_DRM_XE_TIMESLICE_MIN #define
>> XE_HW_ENGINE_TIMESLICE_MIN
>> >+CONFIG_DRM_XE_TIMESLICE_MIN #else #define
>> XE_HW_ENGINE_TIMESLICE_MIN 1
>> >+#endif #ifdef CONFIG_DRM_XE_TIMESLICE_MAX #define
>> >+XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
>> #else #define
>> >+XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
>> >+CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>> >+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
>> >+CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
>> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif
>>
>> So, we can never have a preempt timeout of 0?
>> As I mentioned before, guc disables preempt timeout when it is set to 0.
>
>Yes I will add min as 0 for pre-empt timeout.
>
>Thanks,
>Tejas
>>
>> >+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #define
>> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>> >+#else #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 *
>> 1000)
>> >+#endif
>> >+
>> > int xe_hw_engines_init_early(struct xe_gt *gt);  int
>> >xe_hw_engines_init(struct xe_gt *gt);  void
>> >xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec); diff
>> >--git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >index 7a8d275df6db..d47e34e32a6c 100644
>> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >@@ -107,14 +107,28 @@ struct xe_hw_engine {
>> > 	void (*irq_handler)(struct xe_hw_engine *, u16);
>> > 	/** @engine_id: id  for this hw engine */
>> > 	enum xe_hw_engine_id engine_id;
>> >-	/** @sched_props: scheduling properties */
>> >+	/** @sched_props: scheduling properties
>> >+	 *  @defaults: Default scheduling properties
>> >+	 */
>>
>> This should be done patch #2.
>>
>> Niranjana
>>
>> > 	struct {
>> > 		/** @set_job_timeout: Set job timeout in ms for engine */
>> > 		u32 job_timeout_ms;
>> >+		/** @job_timeout_min: Min job timeout in ms for engine */
>> >+		u32 job_timeout_min;
>> >+		/** @job_timeout_max: Max job timeout in ms for engine */
>> >+		u32 job_timeout_max;
>> > 		/** @timeslice_us: timeslice period in micro-seconds */
>> > 		u32 timeslice_us;
>> >+		/** @timeslice_min: min timeslice period in micro-seconds
>> */
>> >+		u32 timeslice_min;
>> >+		/** @timeslice_max: max timeslice period in micro-seconds
>> */
>> >+		u32 timeslice_max;
>> > 		/** @preempt_timeout_us: preemption timeout in micro-
>> seconds */
>> > 		u32 preempt_timeout_us;
>> >+		/** @preempt_timeout_min: min preemption timeout in
>> micro-seconds */
>> >+		u32 preempt_timeout_min;
>> >+		/** @preempt_timeout_max: max preemption timeout in
>> micro-seconds */
>> >+		u32 preempt_timeout_max;
>> > 	} sched_props, defaults;
>> > };
>> >
>> >--
>> >2.25.1
>> >
