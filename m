Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF620EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 08:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FA810E35A;
	Tue,  1 Aug 2023 08:29:52 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE7410E372
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 08:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690878589; x=1722414589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QLJNNb1xDur7QNesCqRWTHgRwXh8vidAN1XuXJzLD58=;
 b=NS4A8EQwSps0AhWW+wkcSoAKxAT2Zuk6ajrNGMmoC47gaFnBG1kn43QY
 xWWxxFeuYw4dIZgLo6wdTTzNBSTpG00o1X63FKcUkgozYgJLI8k9IEpC6
 ZPnC4uAGur7fiKXo59wM2C1t3cOq7W0zmoGSzfV14bbKb4H1Qn/v8Fm28
 w0lKYaToqUMBO/ycuFT2OUfsFlJaW8V5pGEDPuM2gTh+UUmmAoqbY9Zvg
 IxFeyK2Tl3Qf5qROWTSznyA23jpfEVycdMB/EpeqD0DYvYnLAa8kjb1mO
 8x1GIR/BIQuRgSZu69JWG08szNABvFai1AcP+cgsOCyDPwIJcOF5OKRxu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371948914"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="371948914"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975202881"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="975202881"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 01:29:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:29:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:29:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 01:29:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 01:29:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTIltOaZjuWfFcQn7S3mER3OzptMofLul77LPiVpbVIfc7rj87y5WFC6xt7oCxyEQhvQDaNZRTlgpcBzGzraYdWyi7xir5bSiWwYMbAc32LrWu66OTjSvoq4H6z/SC/GOX0dRwbR8inlFukUjWulL+OHmalO9FpLxIfP+G22uWoFURr0i0NGoAnxMENFPDXqyHf01qalCDuyZMlTYlVxXJUieOcBXYr6qo4zJRc8zpwyPNgspkjKf4iDLa0ZZmGlpTPctZFQ+NJxdLwRx7kGProBoEnUvwSjxTjtpNxM2pnF4lvwcJpwe/doDzD1I/knQOhrPcJJUWYqXFzQsm6kRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbFO8yaQPloeSrS542XhOKvsaIt7kfhqIJtMrwbh1T4=;
 b=VdL0eCc0/IP2kvXP9WGgWW2Yek3AAE4pT70TxqbFQ5wK0PPC1lIR+lDx7iWpQjvk0VUNrxeYy230Rncv0xEMI6bXcfKuZeG10BzYeTgexFWQfo+rhkYTbSZbmDGUk5RTvxzY2ITHRoxhMSr3n9TqSxi+nuBhP0d9F9PrPIqKK/2MZVxjTt7rzhOJTnOCZQyY43QaQgoXn5rOYiSY+tgLPRKivsYbEs/yHZ1uJ1gDo8avU+j6kJB+nhE2KGgMdyGh53Z/lNxM+Gle3kVRWr2Lu7efMCNkiT8TjHml+BJVhCWnPVL4Szcxd3w/Myzaa7aNczoobkYLC092frE0nGpv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:29:45 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:29:45 +0000
Date: Tue, 1 Aug 2023 01:29:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMjCd+KruKsDMLth@nvishwa1-DESK>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
 <20230731191742.1130309-6-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230731191742.1130309-6-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV2PR11MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: b118fcd0-03cd-40c6-017a-08db92697637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxjorFga3j+Ttk288CX1kligCZ2cTUjIgjsjJs1Bp651wXJS3lfqQSmwuw3piRAu2WHuhc8FeKRslrTdVjs43lw2cNcbg6QttNh+HsokUXmNBSbkVQpGY2wSilF4FAgtiTHshs5QVPuIMxxb7TekPIOgabjd9payYMttEhoMIDtPxo1r6gSo0z0BqJFPJrb7MjQm16lVJlTMtJngGKEX7vuZQSR6uPCkNe5SAp7+SO13a7OMnK+ilLEFqrBlUhgQNKx2PvJkJRe342uHQ/q2gjbT5tOSC32kPWPyIZFiMQnMW8+6Jge6IoorK1KeNemxOodSj8b2mMaOYJOXeOeKdy1AOoqsoMXTGrtg0PiIgmm8h11XJtRakB25sV6isBIHWGcqBk5aYHlS7tNuVrjBp9xJwcWUyYo71j4t095LE2Elsko0x9YZAHv7oenQ+MQmEKrjTAziqGVssuUcro6lVmMDqFZebDa/7dbuVnB/1wsmQbfJ5N9AuUFZd4J1PjHIGmN/QS2e0/6+WrydoFmqftf5itnFLrgs1rkJjqLDv6PtXR8bbWgE9Ryc/Jnz2Ri90bKqWWbH4tUqmfsv6js3DLw/PDv3BT7vYnZlvXx+tXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(33716001)(478600001)(38100700002)(82960400001)(86362001)(6512007)(9686003)(6486002)(44832011)(186003)(107886003)(26005)(6506007)(8936002)(8676002)(6862004)(5660300002)(6636002)(4326008)(66556008)(66476007)(66946007)(2906002)(41300700001)(316002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5bCwkrqJesSOoMdk4qguJ4x7z+WrZckQ//L8m7AGpdsE/wrbNtlyN8Khxvdh?=
 =?us-ascii?Q?RugLmY8qymSyO8q9rpn9l4ug3rUCFhcyO5bcths2vvYOsks8jbGs1+uLw5K9?=
 =?us-ascii?Q?msN0MkkmxY7kfENSHqh7EhaCeKUZK/SbLSp31tXc3nwjoY4i+BNuGFbtUW2f?=
 =?us-ascii?Q?Lsz0g26b0l5cwVQ28fj531MizQdrA0k/DmiMZuW01Fo1lfnvT0RXJuAvWPtY?=
 =?us-ascii?Q?Dla7hY77y9QxAj240Kx3ULplpedh/zLjoi6qKh871NmJpJxiLsgzJYzUVDPZ?=
 =?us-ascii?Q?pNaIm6F3TfNIFqWz7PwbTHeYR4Mt4f4GRZHvM0FcYW70iJnNOP05jngrjRsj?=
 =?us-ascii?Q?aZkg6ilZ0x0xxFMgwy7ctHb8/ingbyX/TPZ5oi7rDyNzVO/QJs6aoOmRSVIr?=
 =?us-ascii?Q?MqbBGAzgqpeoY3vj7KClKwEbS1sbpPdqo8vbDzmHYgdPn/3wWy+hw+3sli5G?=
 =?us-ascii?Q?59skUUOY/qNYtifxtnFbhRYIricNzRji+N5QJDcnGxzaD09iI8ZbjqDer605?=
 =?us-ascii?Q?SjgLCVvLr4s65b9l+YI3XDjWQmQZtFjE/ulr9zwTnYIKT0KY54XE7fq6WCYF?=
 =?us-ascii?Q?wjvdzq/9h+yZhQ8eZrBaucqzIooqlAMZVJq/5+Pld2+JCl1m31kKoQSLGtaW?=
 =?us-ascii?Q?ZwmWQhEpJb4xueQQSmn+crMmsFVVxzOHNykigiz3L2GyiNB2qqM4ElnHR9zW?=
 =?us-ascii?Q?l8h9WijDT6MSeQiC8R3DM2laMnoz9TWW64gH+Qw1SwujBS+asSvSCli/Wa4M?=
 =?us-ascii?Q?ZWRqd8nTqSQHfCxzX7INsdQuTxSaQbF+Uw/lSEpMCc7bMoFiG3HKE3e7IdyB?=
 =?us-ascii?Q?pTpzjcftp09+na4zOJULrfIhjqM5RO4vXps5EpaW9rS9dZY+RHhmtHS0fPaV?=
 =?us-ascii?Q?7QqVRm72JxnohLVqtprJEtce1UrVLto7re6Q327TiKsuV0OG5ROO2CMiCu2i?=
 =?us-ascii?Q?/yDR4xOnEXTPGYTbEKuCIF/BTTNJ648C5DeO8Nook6MpU67fCflkkEjJYc2K?=
 =?us-ascii?Q?rlI+onsiRnrx0ql7/6aapsVN9Fv15B46G9J7RPRDRgX7Ml7GnL+Yz+IRk1kG?=
 =?us-ascii?Q?zIu70HnVJN/e8tQgOkfvqBDJQh3l/8P4fHrsQ/eH8V7zUHJq8M7gfsRIARip?=
 =?us-ascii?Q?L/ShHEh9MWXMbcHH5yKQpPDyVniY1nxGdxT2SGeAhlMve/wDiZuyhZDJEkwU?=
 =?us-ascii?Q?+YBKi+XL8ENHpYmo1NukZnCl7Wc/5xHxNgKp8Ph5lj+ldu+7VJVQUi8i2WMf?=
 =?us-ascii?Q?eCOf4Yq8ys7hyqh0nnBPcgIU2K1oyvgzX9MyO9UzRiJIqtrNzIVXzhpuaUbq?=
 =?us-ascii?Q?xTJVBguNCCCY8hEcOyb+PEKhPUHdivYLj9jEGxeexXnS52D3yI89+amdzG5l?=
 =?us-ascii?Q?I1+pZi8Uvfasn/wNr4LMP54CVn0hNvAPTcJUjlF/mInzgCGPcdbQVr/iHiUf?=
 =?us-ascii?Q?L2sJPaQJsJHW8iG1o2pBucR8EvQqYD06CEoAb2wNOa+gGnPnI/0x4g/vEj7A?=
 =?us-ascii?Q?NNj/oxkFJUvOBBGmHhBNP8Fck+634JwsddLasuOTlF/AT/+zgmRn4I2uJ5S/?=
 =?us-ascii?Q?6Wfa1LTLRkt2Lvf6vhvHG0uR7Nq4zc0renvD3fsUFEfYa184JUPiTFE4gjPf?=
 =?us-ascii?Q?yibKWdc5MLLVBTgh5aSAA1Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b118fcd0-03cd-40c6-017a-08db92697637
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 08:29:45.6627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJp9a3No++u6qd1059yZQOHXoTSXIFbWgTl87wYJma8TeD8h1fZdbBinQwTrwZ+D2eOfBaDYOrGzyZSR6EO3y9IGmccFxNjzlp9+3w1wwMqejQd4h4G7t/HnQFNRDOii
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 5/6] drm/xe: Add sysfs for preempt reset
 timeout
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

On Tue, Aug 01, 2023 at 12:47:41AM +0530, Tejas Upadhyay wrote:
>The preemption request and timeout is used for
>higher priority context or kill hung context and reset
>hardware engine.
>
>The preempt timeout can be adjusted per-engine class using,
>
>/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/preempt_timeout_us
>
>and can be disabled by setting it to 0.
>
>V6:
>  - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
>V5:
>  - Remove timeout validation, not relevant - Niranjana
>V4:
>  - Rebase to replace hw engine with eclass interface
>V3:
>  - Rebase to per class engine props interface
>V2:
>  - Rebase
>  - Update commit message to add tile
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 29 +++++++++++++++++++
> 1 file changed, 29 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>index 8545f70be013..238275675297 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -120,6 +120,34 @@ static ssize_t timeslice_default(struct kobject *kobj,
> static struct kobj_attribute timeslice_duration_def =
> __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>
>+static ssize_t preempt_timeout_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t preempt_timeout_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
>+}
>+
>+static struct kobj_attribute preempt_timeout_attr =
>+__ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
>+
> static ssize_t preempt_timeout_default(struct kobject *kobj,
> 				       struct kobj_attribute *attr,
> 				       char *buf)
>@@ -142,6 +170,7 @@ static const struct attribute *defaults[] = {
> static const struct attribute *files[] = {
> 	&job_timeout_attr.attr,
> 	&timeslice_duration_attr.attr,
>+	&preempt_timeout_attr.attr,
> 	NULL
> };
>
>-- 
>2.25.1
>
