Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AEEC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 05:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F0010E1C8;
	Tue, 25 Jun 2024 05:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRNYpOnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A0F10E1C8
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 05:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719293717; x=1750829717;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X3lzazyK/6SK+5OJvivQpaYWBWeU+SRMmp/8epqy0RU=;
 b=IRNYpOnTVvrXrznoMzFQamUoWmVWf9Vd3okZ3hT1TI1Zw6h212TF2DEi
 lle25kykMi+ajZEiTA0IKxmI1i0M3+SasFk9nzMKn/dUzg557QltggV/n
 I2M3VvQUMRgPEy4IcKJx4+mFLDxzwudrarY9uwsJsUQpLgQAxgSxPcjxC
 u1cwlyy8bDX/XTtJ/qg3XIUa+RGWPevsA9w7XL0EuQCx0iGsYh+Xz+Rhx
 hP+T3EXwc6vV2aFOYGnWMs20lMdz3k9q/8yNGj3ynN6h+kpwGPbJ0WdYy
 0HrYVRE0Dpcg0wODXnUzUVOcxYVvsDgOxIdxfRnooxvTMEv7QrIzzsJMe w==;
X-CSE-ConnectionGUID: aII5sv+IRD2U/XkzGvOi0w==
X-CSE-MsgGUID: QF9N8BzUQWKWAOytwWgTew==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26980019"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="26980019"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 22:35:17 -0700
X-CSE-ConnectionGUID: 7bjbGAmuTMysUBSAWtsfQw==
X-CSE-MsgGUID: 5d8uzzZeRampbUfI0CfCzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43623530"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 22:35:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 22:35:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 22:35:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 22:35:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 22:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDZhInyhtikwSULlcm7aw45gZZd1AXoC6ktPV6if6lfydwlVY82xnmRNoG63T70h3G3QNzRBIVbAgnNwBdktHblWU2zG0RGp0mer07Qgfas5Rl4vkJaRVjTfKqiiI2cQcHFqfEEC1n52OvgkA8r8wf0iyO2O1gBxrRMPXSzQ1CMHSvZpq1tVGbRqHrawhCs6Sreb5ZTMfYQ6vnAT5wueI/g/7manO7QDLEWvcCUo4a2lsZXTcQ3OvIzxZMTrpJ6AnJvO1e/q9mlFEVELhJ44ryV6l8UkMi6Iij2dHpg/RCzcBFgo7XNn4zKVoE0n9W7iKYRfSC8q87ZUB4uUQv/d4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfjNiQjFDnWrDWJHLOzvlDUTqFrpg5jj0/kHwGqfORU=;
 b=HMA1kECOhDlC/0+0ZXQD/lWeoHPhpmrhNCU5csyHBwD0tCa0hmk2WMUdR5GsC0DnDuGBqcdRiE+9yC7y6M5UmyeSa8iTNtJnvFu1lLj/xNE8uDh5SS2xS8qD43l6Zx+l7tbQCVjn1Epxdz5r6Ox3i2BLDnR5sEOog7/usK0q6QCZGL648NDjyMc1gKf4615/GxDBUXL4oODnjnpJQCSNx7rRcGglv6/QHIIzk5cbBE04qqtK4B/mI4N+tP7Y23jsBPLQR+VGQbQIPj2WbQ2IEPuPz8C3a1/N0SXEYJ0B9YBWmdWE88P+p0/6PlDppqok0tdw9b3uFfo8QQ4M6C/xyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 05:35:13 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 05:35:13 +0000
Date: Mon, 24 Jun 2024 22:35:10 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add timeout to preempt fences
Message-ID: <ZnpXDhyB3fi+SnZG@nvishwa1-DESK>
References: <20240624224844.3950026-1-matthew.brost@intel.com>
 <ZnpSpcRuM0dUgu3S@nvishwa1-DESK>
 <ZnpT2M4SH5TWzqTS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnpT2M4SH5TWzqTS@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::14) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: f451be46-cdbd-4a5b-518f-08dc94d8961e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O8rYMXGKcYdF2H29/33ZMkNGgFVL4WuK2kv98xiDWwK2+l0Etyjc+YVR8ZwT?=
 =?us-ascii?Q?yieaNbvzpXTc9AsXo5denYm18JFJ8esTMtOJeb3zhTU6I0dfGDXeeSORyznj?=
 =?us-ascii?Q?eeRR1+qYB+rnZxTxUmwsP8eCK12pmkCn9zHPc+/EyV8DTlfDETG3IoAuNGvB?=
 =?us-ascii?Q?B1bhS9QgK1fM3H5cSh+RczHTb6aAA9t8m9q1RbeDgR8n0UOB7cy5yC4nY901?=
 =?us-ascii?Q?SUW/ySKfhTZwiQA8MFQNCPfWFf7HgAPoYdEU/OfAN3Hka1l7iJkFoenUtMDV?=
 =?us-ascii?Q?Kmxckbv5e/DzhKwtIjC5dZrgLYtbGiFkL+tkE5o7iL9Ef2Cs67H7S8GKdeKH?=
 =?us-ascii?Q?fp2FAC7hCrLWTG630KSd6OL/wViOmh+HucA0EwiO/2cUadxqbY8PW+8xS6I/?=
 =?us-ascii?Q?Ks4zTdqfP8bYGY5lTU4j6rnCb6965kXIbRUmPcD35uQLfx8NiDFKHn637Mk8?=
 =?us-ascii?Q?p3/ER/dTFKyUuV6cKNQhOieDfGgx8nSrmeI8WjdrUjMwQv4au9cN68MhOBwn?=
 =?us-ascii?Q?J3YnDm52Y93FruAwtyEsygd1iTYINiHT6jg6qPAH8gQ8vS6TPOFJChjoAuEg?=
 =?us-ascii?Q?nEIX0pWkv9n5qfJrW5wC5ZDaaFWVzRuVIYYfaPzxVIQyZqPJOart3O5gBUUF?=
 =?us-ascii?Q?jvC3J87B1OCiCvOtpnlrubXuIbdPdugz6oGUO+d0QhdlO280wJYuHfK4PkFk?=
 =?us-ascii?Q?aEKpei2qkF3WvuQgVcO6QazdN2Qv343qaG0+1qHyik1QfEXU4juxUdt/Zpqn?=
 =?us-ascii?Q?+jhYpaff+13ENVhmlexgkCD1T7erMVUZFMApBb9w1Wzw1jzahqHm6J6xEc21?=
 =?us-ascii?Q?D3/z/IFsSYDjeF6EDCz4iJYe6ga2SwaHlp7mQFdooUimieuEHstBCBX6/dAn?=
 =?us-ascii?Q?nG2dGuumgJoWqBffOfz+2NZhoTeHfPOiRODJA/SXmQHLUE+aCeSxDEtaiKoD?=
 =?us-ascii?Q?JZA2sEVU9JTgpbxew4T08tE/6BIdWXBrp8YkG3LHlhgwN/wDS1zugz4ObT9m?=
 =?us-ascii?Q?IIXDndzhrxtZI8bvMd1I7z+fjl2UKZRJc/8Rnx7LWGu1qPkIYbhICTdUX4dn?=
 =?us-ascii?Q?IC+YhqO+t5IdCCcZOA2RbO6QiZ4zbm804LnN9kTGHjSFw6DqWzyjw7RRa4wb?=
 =?us-ascii?Q?A5lyhM9NKZCfp9JEuf/aJo9So5tJE6kJkCvIHGL0G+ifEX4TK5C5JvOSm++Z?=
 =?us-ascii?Q?QqmiQN/3pNCCcg6HbrDB08/3dQlMbhLxQ91nLnGPd2wACu2JzcJwlVf1atoi?=
 =?us-ascii?Q?MQKsfu2/HAlTsCXQ4BaP5+VcQZxJJ46AmwKHkAA94yVCVGnvB8Nsrz2ja/md?=
 =?us-ascii?Q?+4suYDZBZ1ulG4kQG7Lw/SyK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?as0U5kaaalq9XCL2yIHK/cTt1HqgwpW+VULmSv1ST9WOZuDiky9iVZXkEUX6?=
 =?us-ascii?Q?1ZhUfB8iP3PKo+92zOm/B8SepbMLnBOfhpX/OW/bJnCed5S+duRQEqgHYUC1?=
 =?us-ascii?Q?zSEH99koFXwCCUvNTOvrOgpuoTxBK5vMF4UUUuivI/G4hiFKJ6uQOe4jxGtb?=
 =?us-ascii?Q?aIh0TXN35ItYcosApSFpObTPZUJZBKWQ7SikJXV/gjceAkAe17FBepCNVXXy?=
 =?us-ascii?Q?s2/vFI0liehOqauQcIfzbOxPM6y055+GGG7y+pWt1Ml6z8Obok+8+/V+4hkt?=
 =?us-ascii?Q?mtMhEDyJsgKCKr4MROrC3x5KHSTjkACvnzx05uuiA94L1FjUKkFj5w6wZCmQ?=
 =?us-ascii?Q?52CZfT/e3zMkInAzphsH4UHcdvfp6fYO9Pt5WjvK8DIHIoGcm4lZswVGyrun?=
 =?us-ascii?Q?QqMOGfc7kFl2C1bx0+Wvt9YYQwdmTP1MZYPBetoj8qr2Izt07282Vr52oND4?=
 =?us-ascii?Q?qoHvK277wjILI5tlYtFo1VEjq12eatb5BrmEMgK6wtH9n4Y5FGRKTX/ZzvPI?=
 =?us-ascii?Q?GhwJnzDMUNPsuRpCSOC8fytlSiAkZs5Pp/6/NUlERfHLzCDxDgDOLVKYWXST?=
 =?us-ascii?Q?xvnnj4guItc/bYzXfRWmayPkMIV9hxbS18mYhhMUW/ryDP2ZHKXimXuL9Gag?=
 =?us-ascii?Q?lNhefjUGBq9KOPt1GU7T3VNMEi+o58scTfS0PwCDZViDjLwmVRw1H0aaM0FA?=
 =?us-ascii?Q?dFOoVSOOKNq5fjmxuW5UXs9udLMiyesJZPEg9JEA0piIlf8oh+CRluLKwlAv?=
 =?us-ascii?Q?MPa++MSYRjJ09NzVY6hTgfXA0YwQRJSd7H+RlKGi1+mmjd29LubtheR6A+qz?=
 =?us-ascii?Q?PNMmGX7BeoRLl4ZQsi0gj18Owb6nZnGglBWM1DLhMGkeG5zp2fP6eOGHhXMN?=
 =?us-ascii?Q?7bOGwO926vp2tVc+MUjQn2HkXiB3JT9tCgAYAYLp46pFlbRXrU1NmUfNf86w?=
 =?us-ascii?Q?de+AcTxe6Pef3yQsXSO3lpwxv02269wukdYFUqYJ9PUapwqtK7qOgcTjfh6R?=
 =?us-ascii?Q?pe5/ouzfEZSu4yrtzWU6jxVLn6+dcqXF50933Ani2sTPcirDA1Puf2DqbQxp?=
 =?us-ascii?Q?u6uKyRLeE9qfwNz54H/eGdYyOgyCrp7nbthkGtMRz87RWw1jEDXOyx1y973U?=
 =?us-ascii?Q?GTw7j64yavyuG2d4om9tLzcbCprSJ9P96h7Nv5yuBgHqfJuTZxDsIRtvxEMP?=
 =?us-ascii?Q?NTtZ7riPE3YauBk7bgRxcGbdwiXqyU36vK3Fv+cpB84kv70vZq/9QC80XI+F?=
 =?us-ascii?Q?LXe+rAawZjtVOJ1hIPeOYh8hy1FzS+SfgzH0b+D0En400sgBA9BzP9Mo1xIE?=
 =?us-ascii?Q?7VBdH/4OPRnINyYFEwMKzQ7BCuovp7e8iGyOJ+XzSsb32YWQlemglxnHltOq?=
 =?us-ascii?Q?S/J88B0B0mzdNhQj0yj99DzJRtdZLXYKaFFUgGaQbRY4pg4felazueMMygV6?=
 =?us-ascii?Q?RSOBpw00ifw1mDxOKUaZpMuqFtiOcSgDfbrXwBEVN8gh2OjqkZMLInV2s1LP?=
 =?us-ascii?Q?x8jp1kEy5ctOGgYKpgKM3ZK5jIAZQ6LATGuBhtElcuM9C9BFu4bhV7jmuAsZ?=
 =?us-ascii?Q?fVMXphU/ieBqNWP2t31zuuo/eIdr5MhPrzhX139/qk3qMEAmQHmMjeLgSrDH?=
 =?us-ascii?Q?IGex86xwHWzgD/fdXFbK3oE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f451be46-cdbd-4a5b-518f-08dc94d8961e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 05:35:13.3360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtZc6wm5fXI0//hRWVdLUFxMtgUgjVO9LlHM7bXocgK5aGtO4eGps2wt0tUXiZveCDmP0S9PmRhL6EOn3B+fLA53X/nVQRPWsRjFWnefyCca+2Fr9cBI3ryudS8tyLd6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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

On Tue, Jun 25, 2024 at 05:21:28AM +0000, Matthew Brost wrote:
>On Mon, Jun 24, 2024 at 10:16:21PM -0700, Niranjana Vishwanathapura wrote:
>> On Mon, Jun 24, 2024 at 03:48:44PM -0700, Matthew Brost wrote:
>> > To adhere to dma fencing rules that fences must signal within a
>> > reasonable amount of time, add a 5 second timeout to preempt fences. If
>> > this timeout occurs, kill the associated VM as this fatal to the VM.
>> >
>> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
>> > drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
>> > drivers/gpu/drm/xe/xe_guc_submit.c       | 35 ++++++++++++++++++++----
>> > drivers/gpu/drm/xe/xe_preempt_fence.c    | 14 +++++++++-
>> > drivers/gpu/drm/xe/xe_vm.c               | 10 ++++++-
>> > drivers/gpu/drm/xe/xe_vm.h               |  2 ++
>> > 6 files changed, 59 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > index 201588ec33c3..1e51c978db7a 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > @@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
>> > 	int (*suspend)(struct xe_exec_queue *q);
>> > 	/**
>> > 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
>> > -	 * call after suspend.
>> > +	 * call after suspend. In dma-fencing path thus must return within a
>> > +	 * reasonable amount of time. A non-zero return shall indicate an error
>> > +	 * waiting for suspend.
>> > 	 */
>> > -	void (*suspend_wait)(struct xe_exec_queue *q);
>> > +	int (*suspend_wait)(struct xe_exec_queue *q);
>> > 	/**
>> > 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
>> > 	 * state and dma fence returned from most recent suspend call must be
>> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> > index db906117db6d..7502e3486eaf 100644
>> > --- a/drivers/gpu/drm/xe/xe_execlist.c
>> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> > @@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
>> > 	return 0;
>> > }
>> >
>> > -static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
>> > +static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
>> >
>> > {
>> > 	/* NIY */
>> > +	return 0;
>> > }
>> >
>> > static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 373447758a60..56e7a340696e 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -1301,6 +1301,16 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
>> > 	kfree(msg);
>> > }
>> >
>> > +static void __suspend_fence_signal(struct xe_exec_queue *q)
>> > +{
>> > +	if (!q->guc->suspend_pending)
>> > +		return;
>> > +
>> > +	q->guc->suspend_pending = false;
>> > +	smp_wmb();
>> > +	wake_up(&q->guc->suspend_wait);
>> > +}
>> > +
>> > static void suspend_fence_signal(struct xe_exec_queue *q)
>> > {
>> > 	struct xe_guc *guc = exec_queue_to_guc(q);
>> > @@ -1310,9 +1320,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
>> > 		  guc_read_stopped(guc));
>> > 	xe_assert(xe, q->guc->suspend_pending);
>> >
>> > -	q->guc->suspend_pending = false;
>> > -	smp_wmb();
>> > -	wake_up(&q->guc->suspend_wait);
>> > +	__suspend_fence_signal(q);
>> > }
>> >
>> > static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>> > @@ -1465,6 +1473,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>> > {
>> > 	trace_xe_exec_queue_kill(q);
>> > 	set_exec_queue_killed(q);
>> > +	__suspend_fence_signal(q);
>> > 	xe_guc_exec_queue_trigger_cleanup(q);
>> > }
>> >
>> > @@ -1561,12 +1570,26 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>> > 	return 0;
>> > }
>> >
>> > -static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>> > +static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>> > {
>> > 	struct xe_guc *guc = exec_queue_to_guc(q);
>> > +	int ret;
>> > +
>> > +	ret = wait_event_timeout(q->guc->suspend_wait,
>> > +				 !q->guc->suspend_pending ||
>> > +				 exec_queue_killed(q) ||
>> > +				 guc_read_stopped(guc),
>> > +				 HZ * 5);
>>
>> Do we need exec_queue_killed(q) here as we are anyway checking
>> for '!q->guc->suspend_pending'?
>>
>
>Probably not? There might be a goofy race where suspend_pending is set
>after exec queue is killed though, I'd have to really think about this.
>For safety I'd rather keep it as is.
>

Seems fine to keep.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>Matt
>
>> Other than that, the change looks fine to me.
>>
>> Niranjana
>>
>> >
>> > -	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
>> > -		   guc_read_stopped(guc));
>> > +	if (!ret) {
>> > +		xe_gt_warn(guc_to_gt(guc),
>> > +			   "Suspend fence, guc_id=%d, failed to respond",
>> > +			   q->guc->id);
>> > +		/* XXX: Trigger GT reset? */
>> > +		return -ETIME;
>> > +	}
>> > +
>> > +	return 0;
>> > }
>> >
>> > static void guc_exec_queue_resume(struct xe_exec_queue *q)
>> > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
>> > index e8b8ae5c6485..8356d9798206 100644
>> > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
>> > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
>> > @@ -16,11 +16,23 @@ static void preempt_fence_work_func(struct work_struct *w)
>> > 	struct xe_preempt_fence *pfence =
>> > 		container_of(w, typeof(*pfence), preempt_work);
>> > 	struct xe_exec_queue *q = pfence->q;
>> > +	int err = 0;
>> >
>> > 	if (pfence->error)
>> > 		dma_fence_set_error(&pfence->base, pfence->error);
>> > +	else if (!q->ops->reset_status(q))
>> > +		err = q->ops->suspend_wait(q);
>> > 	else
>> > -		q->ops->suspend_wait(q);
>> > +		dma_fence_set_error(&pfence->base, -ENOENT);
>> > +
>> > +	if (err) {
>> > +		dma_fence_set_error(&pfence->base, err);
>> > +
>> > +		down_write(&q->vm->lock);
>> > +		xe_vm_kill(q->vm, false);
>> > +		up_write(&q->vm->lock);
>> > +	}
>> > +
>> >
>> > 	dma_fence_signal(&pfence->base);
>> > 	/*
>> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> > index 5b166fa03684..6b8ff13f0aff 100644
>> > --- a/drivers/gpu/drm/xe/xe_vm.c
>> > +++ b/drivers/gpu/drm/xe/xe_vm.c
>> > @@ -311,7 +311,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>> >
>> > #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>> >
>> > -static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>> > +/**
>> > + * xe_vm_kill() - VM Kill
>> > + * @vm: The VM.
>> > + * @unlocked: Flag indicates the VM's dma-resv is not held
>> > + *
>> > + * Kill the VM by setting banned flag indicated VM is no longer available for
>> > + * use. If in preempt fence mode, also kill all exec queue unlocked with the VM.
>> > + */
>> > +void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>> > {
>> > 	struct xe_exec_queue *q;
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> > index b481608b12f1..c864dba35e1d 100644
>> > --- a/drivers/gpu/drm/xe/xe_vm.h
>> > +++ b/drivers/gpu/drm/xe/xe_vm.h
>> > @@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
>> > 	return drm_gpuvm_resv(&vm->gpuvm);
>> > }
>> >
>> > +void xe_vm_kill(struct xe_vm *vm, bool unlocked);
>> > +
>> > /**
>> >  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
>> >  * @vm: The vm
>> > --
>> > 2.34.1
>> >
