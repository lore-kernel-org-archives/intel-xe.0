Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CCBC83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 18:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B2510E28A;
	Tue,  5 Sep 2023 18:09:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1323F10E28A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693937354; x=1725473354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dxeTdLrcPESTgJp3ZdBFspd8Gr3OwCJ2WR//bW+vabw=;
 b=QD0aaP/kMK6zzbDEZZmBJBUbx+e6WKcjwnra2o4XengMsqXBW5pW/dB0
 /T2BTcSodt78nIHwTKIP114yYzr/A3tAX30mOHahGnfXXgRoQNSMOgLwJ
 rCsohQxIdff8iJvop9Lu5i/Dq5/PCxi1LGJA4jDNeA+oOV/rgcP5/vqz9
 Wvj9SAVADq33mZwvW5NV/VB5m0mb5zokQcHfejl0B1i3892tkXw1chGeY
 g6VqnQ5Xgdd034DTtHiaj9sXTc2sGNL97yCXdzqO7svTMqT/RTaTIEjmb
 mvXtlB2m7vWV+J8TqYInId2rxZ4JRiV2RPsqvsa5Y9UdRYXZJTptYUtsl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="376789398"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="376789398"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 11:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776282184"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="776282184"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 11:05:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 11:05:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 11:05:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 11:05:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPUsTDpNs2ZOJkjaeJN7hIVvpdwliqaeamvd3O+CVQlaI+ERFllP3+u07ovrsQA00OryQGXq6KJRm4jo3BQRgGopjlmCMdKRQdddirYYpQxPvjL37tB2i9qINY7xDtBN/TJjb3iF5NNTOHkDuK5S0nYX/mz9VZ6a+S+kC0tzz+G7nNHUlUUK3a9xNKp46P0h4wqpCOWFxH319LdRsRRPd7JP0tXN2eL0Xk7XmkH7jMMRWqzxPwdGvuQ27cmUvz/sXAy4z+wQx5iLfbDBbDqXKD0/n7JKSK5heJXyoE/FsXFFdAUAtwdg4Aydc9RRDcKHoXBvj8EQfrOAU8lOllsCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZrNEA0Ss+RjLGLMWUbvA/8GGSnW3cXd5PtC38liR2Y=;
 b=d7T3qy8z9BPmT0b2mop2AJaRanRyizOFdxL4MYEeuR6CTFKNfzFDCz9AlTFsbKACytGltzizYsGy6NnpEsgsQoUno+dpL+473eIBH8odaHWI1tEFEwbi58o1HxoVGNXNtSZ3LK2KCK5JIhSxeLCpBVlRmcmVq6/xVVaYnXBaB5h2XcCPlZEOq+RVQU1lCIhe2yy+qjPiqlzzbfzHBIMlr/quLlcq2M9+Rs4iG6oyROuuM5G2KuKtJwC3zi+/kTMjFjBWJJw2X/nDDve8PLEsH+ELnnkim3VD1TKGK/NWp/m4WGWtCbtcqn816QT3XmF7v5thNYophhLhTUGnxD/2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8199.namprd11.prod.outlook.com (2603:10b6:208:455::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 18:05:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 18:05:12 +0000
Date: Tue, 5 Sep 2023 11:05:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <4ueaue4ae2gl3mivqrwqye3oetiaw4xcom6nqiqurzerb2kfsx@jfejxom5gbr3>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-3-lucas.demarchi@intel.com>
 <753666f8-0d87-9bb6-87db-4784b8b71dc0@intel.com>
 <hvnq7gwydeywkxqudheplygoldzk426ss4uetaypucw2hpeh7z@wqphplzfgxhs>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <hvnq7gwydeywkxqudheplygoldzk426ss4uetaypucw2hpeh7z@wqphplzfgxhs>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e909f52-459f-44c3-7f7a-08dbae3aa667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F0kAS9Afp4o/zQIE6CfsfESbkOVm0546eoM8xQGCVtsxJHJXWGODyqKk+g9tlkQHhBt9xwSivIIt6pdxxr/hC2fkuOrkGmx6vNcnJcAXUamNNsXF/HEOfJ7Hs4jTmYF1pZYaPjyvNrz7arOnAFZdRiH+aEGJMCc2x8mtmkgidWvRaYuouqw35yBy8Jws1fvCSb6XjJ8gDyEXMUSBES8t5/gPL7XyiF+AGHc+6L4N7thKcT4PojYjsN1C4BSYJB94CBAIO6+NCQrFSGmU65L+XjEePEBzmGLjkvyJtmI7Sct6UUEHG6yMx8So/1CxBeLZs18Jwly1xTuQq6C8PAWwOd+C0f2OjcJgrmpFqntpzXEMhtfLzVYDEL8kyaX5hBuZ5UVmdZsBCz0p97qTjcFtsYqUy1V5rMUA20mKZLWKt/suYPI0plY7xgXeX10D44tqYa4YmU54eq9mp1yuOTpWIVNA+jQrNYzAXrtM9ODSfZjO7Q9OYGSciNrDpLijg1qqUpd7NdSrtJmMBmiBPVz3i7zHFpDGVizie8a4C4OkiNIYpeKwMyY9WJWsD9rjPHoE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(366004)(376002)(396003)(136003)(186009)(451199024)(1800799009)(15650500001)(2906002)(82960400001)(38100700002)(33716001)(86362001)(41300700001)(6512007)(9686003)(6506007)(6486002)(6636002)(66556008)(316002)(6862004)(66476007)(66946007)(4326008)(8676002)(8936002)(6666004)(478600001)(26005)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k50tGiD9ieqsaqFYXp9QOEPP+bQoytsgxG31GsXBtUnvPu28WM2UJyDhwPLX?=
 =?us-ascii?Q?6ifMFHEZY7I4qeYrCdgT2ErUosAz7rwIam5JPSgU2tX0W2Ax1bJzp9sbhIx+?=
 =?us-ascii?Q?TfMiuJkr96DYesVo2NCx5lLbKUPBMd1zF1UeUg8a5NvRCKfBMFf0kEoEyOP4?=
 =?us-ascii?Q?8AAn/SMOAyqBIqc5pOqFORKVrlqfGOAa4042OVd8fLB47iFqvkps20qfBdH0?=
 =?us-ascii?Q?yqrzkHSCeFHnKYFybNeJ0KadO1POc93Qe08bvvSxdQBzJ+q9yni9RisZ94ci?=
 =?us-ascii?Q?wNjOl+RsFvTqLvz+gwPruF1qwVZtwhMdNMIIFq6mgxQoX6GD64QQLbbNhO8f?=
 =?us-ascii?Q?ckbURkLkUF6QXlj1x1TiC725Ft9KanC52iUh+F0QlkDd3PRiuFSAzpGxGWIm?=
 =?us-ascii?Q?fT1dkFX5hmdJMGDJu3poDNh3UQxJtGWvQEzq7dJ+GaWrRrpzCU2K/Tj4wpxl?=
 =?us-ascii?Q?smK1o9u5XBARO5MGqIpv3lfqCpdgwzKZZiTn6NyHOjY50dBsCd7OeAf/XJea?=
 =?us-ascii?Q?1aHxykRc8ceVeyOPCbLa1BI/ODXcq8Hp2xMLh8GhzWu3W/Bh72mDOdyBr9KM?=
 =?us-ascii?Q?DJHuiqXWS6FzFqwuCM49NpiWHgNHbl62AWIBCDTbvOyFK999KSL5vToT05jA?=
 =?us-ascii?Q?RRuCVEJ+cRna2G8CqPMhAAV5CtOd567z82kc4OVBdmFf1v9MsTuxRFWJbs76?=
 =?us-ascii?Q?+NfmJsOoadcP4lcHLZmwj2qzeagA+B725SrD8SX+gGl8YYnTLPm8ZACLSi7C?=
 =?us-ascii?Q?frH7SdrxyiGkKWt1O4yvmuvYijKhJbRPtTIAbooqmky0osHP/a4Qg2Xg9+HX?=
 =?us-ascii?Q?iFC4ZOjaOXNhM7VBJgQxTRUp7PHChNL0oh25D+V6HzeZtt7896JUP5NomVSe?=
 =?us-ascii?Q?h0ACUdQx8cwnw19Ubam6zPf0cX6E9bmrYNONw2qG7l860TVgWWhJlb902kWu?=
 =?us-ascii?Q?gGxcE4NTVLo9CjdHRTo121v+5iV9pojOW3cFtdyg82FiAoKJuy+p0dbktvzB?=
 =?us-ascii?Q?cqMAY2v9jiW1oVDJ3VigPOjYtvj7KJAo0E/Uj0oXLG6zCW8lA1uVOUlfasQc?=
 =?us-ascii?Q?vd67R1H/FSnjXydAQMChFqMNRLEP6qkDrBzWXE3Kt8xXI1f3zX977T2mpU6X?=
 =?us-ascii?Q?rsLMvn+kmuvCaBAjiy6db+bv7v96l3Rw38GJr0NESyuZvosDh4WGb4H35C4G?=
 =?us-ascii?Q?7MmhcCxsX2BgJmB4Y5cLR9ExWtQNDmE0Aizj4N9AQTM4184qXYUMRT4MJ3y+?=
 =?us-ascii?Q?Sj5Y+RefXaKJhSjxCZZoF9EdlFLuysC+U2jhpv1VxRKcqzywCerx6rqTP5ci?=
 =?us-ascii?Q?X/p8EMvwabX6X3CUfaA9Opp4dfJ00xiqEPiKw4jf4+iKoBK6/Esx9UuPpvku?=
 =?us-ascii?Q?IEcpGk4zlWL0p9adr3v0JdjAHjtLGtwFcqix2LEPR9TEIuHTBIFfj8ibfPwk?=
 =?us-ascii?Q?0nyjpPhqIX3cUiI/k1AB1jWhgYsWt1r+j1nDTBcoFSg6t8daPwErBP0Uiw/l?=
 =?us-ascii?Q?erxyQ0wRrPRWKROAdz8p2QcYlmqCJC9Lq9gLmvG6Tn9f9o8+jz/v3mkHJ2Le?=
 =?us-ascii?Q?Sf0Y+dXKEiB4HbbqwXEuMVwUOTl7dcEXVRAWC0DfKtj8lkWZ99ObC9u1eSrv?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e909f52-459f-44c3-7f7a-08dbae3aa667
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 18:05:12.8632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xgjifJgBrz0aSIH/5eZGbzOoqHyNDKw5CfYUeD9SZRQqER4JaMoI6kBlDwQkfruw8QouaWXwBOVumm95qOxb5McVokRH9NSIxEjRF0cUrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8199
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add dbg messages for LRC WAs
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

On Tue, Sep 05, 2023 at 09:06:44AM -0700, Lucas De Marchi wrote:
>On Tue, Sep 05, 2023 at 05:04:08PM +0200, Michal Wajdeczko wrote:
>>
>>
>>On 05.09.2023 16:31, Lucas De Marchi wrote:
>>>Just like the GT and engine workarounds, add debug message with the
>>>final value being written to the register for easy debugging.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_gt.c | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>index 3d6a7c11bac1..bd307770a620 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>>@@ -116,6 +116,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>>
>>> static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>> {
>>>+	struct xe_device *xe = gt_to_xe(gt);
>>> 	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>>> 	struct xe_reg_sr_entry *entry;
>>> 	unsigned long reg;
>>>@@ -133,10 +134,14 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>> 		++count;
>>>
>>> 	if (count) {
>>>+		drm_dbg(&xe->drm, "LRC WA %s save-restore MMIOs\n", sr->name);
>>
>>shouldn't we use xe_gt_dbg() here?
>
>I'm not sure here... maybe. The LRC WAs should be saved per engine
>class. Currently they are saved per gt, which is not entirely correct...
>we end up applying more workarounds than we really should.  This is
>another fix to be done on top.
>
>for the current situation, as long as we also migrate the gt/engines
>workaround application to use xe_gt_dbg(), then we can also change them
>here.

with xe_gt_dbg and s/MMIOs/batch/ since we are not really changing them via mmio:

xe 0000:00:02.0: [drm:xe_guc_ct_enable [xe]] GuC CT communication channel enabled
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: LRC WA rcs0 save-restore MMIOs
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x2580] = 0x00060002
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x6604] = 0xe0efff6f
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7018] = 0x20002000
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7300] = 0x00400040
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7304] = 0x02000200
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: LRC WA bcs0 save-restore MMIOs
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x2580] = 0x00060002
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x6604] = 0xe0efff6f
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7018] = 0x20002000
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7300] = 0x00400040
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7304] = 0x02000200
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x22204] = 0x00000606
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: LRC WA vcs0 save-restore MMIOs
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x2580] = 0x00060002
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x6604] = 0xe0efff6f
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7018] = 0x20002000
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7300] = 0x00400040
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7304] = 0x02000200
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: LRC WA vecs0 save-restore MMIOs
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x2580] = 0x00060002
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x6604] = 0xe0efff6f
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7018] = 0x20002000
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7300] = 0x00400040
xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]] GT0: REG[0x7304] = 0x02000200

but will probably do that in the other workarounds first so they match
the format.

Lucas De Marchi

>
>thanks
>Lucas De Marchi
>
>>
>>>+
>>> 		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
>>> 		xa_for_each(&sr->xa, reg, entry) {
>>> 			bb->cs[bb->len++] = reg;
>>> 			bb->cs[bb->len++] = entry->set_bits;
>>>+			drm_dbg(&xe->drm, "REG[0x%lx] = 0x%08x", reg,
>>>+				entry->set_bits);
>>> 		}
>>> 	}
>>>
