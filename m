Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6A8C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 08:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1A310E361;
	Tue,  1 Aug 2023 08:29:21 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FFC10E361
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690878559; x=1722414559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dP4LOB0rD9akL/s0huU6Xjjuk0n5uubakxnOOLk8Zm0=;
 b=BJtKDeoiaopvhKoyBI8xeLdeiH0sOFwzl5xlWaIASTbu1fLAowcOhemY
 4L3UxLKjppuMU20Qh7sbQLROZhp2ltUp3YiKskrSbKaTE8+xuhBuV8l9+
 SI3Fa15HjojJEe1NmpHN66yepK5/342CfOaHyUKL3ESRLLMnnT72wPIKi
 awPFzKNViLaUSIjmZl8vwdvppiMcB54vxex/Denm4qRaBLqHJSyShr6mA
 S3wgAJRyVE72YzxpDISNVRcdDcvK1EB1LSAro8kMiXxW3o1Tws+YkrxsH
 9ShI2ZzxLpHuNoZCWBRCkkvdGTYBzrIg2UhrsB4HS8ME5jwlWXob1S/LX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371948826"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="371948826"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975202780"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="975202780"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 01:29:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:29:14 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:29:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 01:29:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 01:29:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH2feLPtRzCaBZ3o7GLhSSaeprK80llFwGXFvr3p8527XN93xYuENMKB7K10zmPMeU7XyKGQUTclxt/6Papf6OXlzd9VnCzSl6/sYrHepkCeGuZPKhGB2tXhIkM1FTTSRAIl3C7NImqaXdhMJcN8+XImK4jxfiVu+49uzTjI80pAZNGybWtYviMskWwe7ViipY3W7pt9qASfedH2oen0k1RNC4Rd+of8BasKuvxbkmVsWUfqnENc8O6XIwfKJTzaPjwQ4784nLXOUJgB+BFUpsuM19Sq/a1V+rQJNhOyZW5XAxlx77Mq0DRflT+mXjo3I81rJ1nJ2XjqUNlranRuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpY6nyaRROOIAgjlTqoXpMzEXMZvLd7KT1fHLx6f1/M=;
 b=IbTAcKLdQlLYOvjkZZtRfWTg8qHgIR5qtNc9WejDYhcvsZWuajOyrx1d+eLcMsQVtFBCKAhBbMqYuUOrx+OL/0HhwZzbxh6fhbE/NysU1nQzaiF8MRq3ZQMariGbl5C2b8tsPOYKXNkdNDQAXcEEZ0ANj25UgT0XPKVd1daYXl/wkAnWB88wNJLFm7VvxEDcwHDO+UJSdb0JZu4xU7kp4cLflQLdOt1Lm09qXvJR8FUwN1qvmJnul4Q2/g/mOpP8sAgzAYEmFOlYyZYNnSoB5ALHLLZOu93hbilS1uER1KP2zdAuD4DRjjSdFbBctC9v+QDSxT0zLURVJ4ljlAOVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:29:12 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:29:12 +0000
Date: Tue, 1 Aug 2023 01:29:09 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMjCVX/g7XqLDPFZ@nvishwa1-DESK>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
 <20230731191742.1130309-5-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230731191742.1130309-5-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::36) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV2PR11MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: 6247c40d-a0a5-427e-e0df-08db9269623d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nzYRdHZe3OwwMXX3XcWUKEbBdrgLKWsd/WvfYuDoJvtZxtp54PKKTV0e49rP7qXI/LFGL0SyEb0owCEUv+xWau0AvDXB80bmbZd9i7UQCx1IkrmBoRihTg3cD/ZXRdkUfnGgzWpMRVUw6EK4xmYM846BHfcBff0exp2odEVADk7LHKShbn7RRjyN21tbCcMPwCaVP+piRfq2ClDg9thlpWihiRmGu1pEt1vj5rsc/qCfHbB76Xfc2P3zvB4+qd6+Et6jw934k2mR746ijah5kpuEglO0t73jhuDX/bWouNldHl4FKnxJ1jIg0WfiqvWICsPeVmOpxIQJLo4S9k2574cM/QAJRBXRWePibXJRynot+Bu/6/2dBODCXNnDJ+0cWKZatRQpJKO3rK2Vwg4V8V3ABi29lLa77F08+p74HY6T0InDFHZ8WsalfNUXANDndq2DxjIsY42MGFc33FmvfatIP3AMbp7XEcCTkvc/bu11XYv3iqU05lGYz417ZhLZ6GoTqutAm5GsogW5IJaq5LV3K6sz8soJUxxYyCcmmpeCYiTQGiUY4JcFRTpGkIyH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(33716001)(478600001)(38100700002)(82960400001)(86362001)(6512007)(9686003)(6486002)(6666004)(44832011)(186003)(107886003)(26005)(6506007)(8936002)(8676002)(6862004)(5660300002)(6636002)(4326008)(66556008)(66476007)(66946007)(2906002)(41300700001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JsUP1ha3CGtTWr4Ubz7n+0QPHMybTYugypL9lTaAH2K/XhbdW+jNSNNnXDSM?=
 =?us-ascii?Q?jUl6KzFJ/4BZZ3zJrY/0BSK25ltOHkrf26azwUBK2ZT0kfP9YqmE2E5d7Gbz?=
 =?us-ascii?Q?j1bFwZ4BrRvS2qmtNBorbKIxj+k+wXQTjMdelCROnXffQVgt2jWAk1xDLBPk?=
 =?us-ascii?Q?Ost+ldr7fGn9L6vik/93x4GKqAyS6IOGq2PWK4nT4ewt65pyoJYhkHvI+vbg?=
 =?us-ascii?Q?FBHXsIhb8p88hr4+Ysg4jjMEl2wQ2/TUszCJKknK62k2NEDDRXWTPyWoz9aH?=
 =?us-ascii?Q?Zy4gefJg6Q2AeJaNnHUNkWBmmp6xZHUBi15f+6LgV5ufnzpbSM5j8hUEG5EB?=
 =?us-ascii?Q?8Dq0FoJbAqVkz6adib/vaOpcp9qX66vjo1vxBwX0XWgV2GciDjykYwy5CHMO?=
 =?us-ascii?Q?Y1YgqUes6rqDNZgCKYV4S7MQm04bJfUSBFjm3wvPODePHGSSJtHDkQFGUHCu?=
 =?us-ascii?Q?p0LhXrXr5HUtJmdCLxrnFsLJjwwPX6GkgvWRjWpcyEayR9MsjEzeubrsoVhG?=
 =?us-ascii?Q?4rQBxAuLnHxFJzCB4KB2pvImveeqJkVwLAqVwnza3RL4nCFG0bIiPKe23Gjv?=
 =?us-ascii?Q?PkWB2X31D1UScmzOyL+Hyrlq4a42dw1B72SZG0aAa1TDwEAXxAmEZumtitcB?=
 =?us-ascii?Q?2vAcgfbaV0Mcka/IEs1Lv7cokf0JLP0p9ec5177bCjvW94iUgz1Q4VUB9kdw?=
 =?us-ascii?Q?9cjXF7rWIyHenvYLne0VyEyb6xBqpeG23/u/qOoazIucGUQGG7FxwXcP3t04?=
 =?us-ascii?Q?VA35SQb9TMFvxGmOXr4t5ftJ4NkZRJ12jVkWAypkZ5+qVKN8xJSpiaiVw/zz?=
 =?us-ascii?Q?EVn9fZYSV9UiSlnx/E+WszCLhppMcGIcW8w0E4Jf58ljMreF/Jowc4TflTkz?=
 =?us-ascii?Q?AHacyyj91YTG7y6L0J7f6DYqIVWu2oIva25E4jM/L65tACrOkYpUliPGnkvB?=
 =?us-ascii?Q?7SzNYDaHszonUSRS+NQFLTPu2TMFsXSrpQYefVKwUkPOOrF28SKLyJqM/oW9?=
 =?us-ascii?Q?9dkKRoUqed+l6wt9KOAi3NoaVsQntKWJ/yyz3S4Y6Bukxrzz8HMCBJO3QoNb?=
 =?us-ascii?Q?7s8vWpw0Z5GH3fRUMx/hfJ78y8PitAH7ICn9xKmlCfv353N7t7NOUMvegPOh?=
 =?us-ascii?Q?0raqn87F/l/Mu13wgBFA1jN7tVYiDh5JXTzNlVkF+CFs7nPEU5tWl+D38lVy?=
 =?us-ascii?Q?sXmwYe37naRAvH2Ugq5FRxHLPk9g4Nv+l+XNPnPmUWmz/GuJKpr+rvM8p8Jb?=
 =?us-ascii?Q?wfaEqFaxoZpMa/e0RR3iFKv01t4ToDBsF1KZ2sLuDo9Tr2+yW/Lxln6JAmih?=
 =?us-ascii?Q?gua1KZE2xSqzPzI16lStHJbvSwI1HHVE9yowAWMD5kRuaCkhwTjRiUFKxYzP?=
 =?us-ascii?Q?/z0RVCqrh5dKQNP2fwKrbqJvH+samC1QoRhteBiTXu6IzjfgmMEB2VCBRdBd?=
 =?us-ascii?Q?7SW1fUfygznB5C11ynea/FaLMyt00xlVio16d4G2vTLdnTQOFGD9d5Rf9D3k?=
 =?us-ascii?Q?mKpVJ5kuR9mZ6esatRCXd6bFyCjvjlhV5npTB3gtLcjpqiYqIOMBrE9K1Usv?=
 =?us-ascii?Q?CpfzIz2boExeJDIpXok23KNgSBFxc7ImA4luyHH85DU+wFRSed4hKrMEgufK?=
 =?us-ascii?Q?0BDmvrU4/QjDdyWx3DY7S3A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6247c40d-a0a5-427e-e0df-08db9269623d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 08:29:12.1362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMVmv202Zi9kGFBWeXZuXHPbNr7tuXdq51Y+VvgwcWD8ySnHvp6UiAgEg72dt3VlqjRm1a9B/4kctHnRDlLDvZXBfsLIuMJgKyEtFSNC5Ec5CnVD+fq6AtDxbIBiRFjY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 4/6] drm/xe: Add timeslice duration
 engine property to sysfs
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

On Tue, Aug 01, 2023 at 12:47:40AM +0530, Tejas Upadhyay wrote:
>Timeslices between multiple context is supported via
>guc scheduling. Add sysfs entry to provide user defined
>timeslice duration to guc scheduling.
>
>The timeslice duration can be adjusted per-engine class using,
>
>/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/timeslice_duration_us
>
>V7:
>  - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
>V6:
>  - Remove duration validation, not relevant - Niranjana
>V5:
>  - Rebase to replace hw engine with eclass interface
>V4:
>  - Rebase to per class engine props interface
>V3:
>  - Rebase
>  - Update commit messge to add tile
>V2:
>  - Rebase
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 30 +++++++++++++++++++
> 1 file changed, 30 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>index 2169301cd9e6..8545f70be013 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -80,6 +80,35 @@ static ssize_t job_timeout_default(struct kobject *kobj,
> static struct kobj_attribute job_timeout_def =
> __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>
>+static ssize_t timeslice_duration_store(struct kobject *kobj,
>+					struct kobj_attribute *attr,
>+					const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_show(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
>+}
>+
>+static struct kobj_attribute timeslice_duration_attr =
>+	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
>+	       timeslice_duration_store);
>+
> static ssize_t timeslice_default(struct kobject *kobj,
> 				 struct kobj_attribute *attr, char *buf)
> {
>@@ -112,6 +141,7 @@ static const struct attribute *defaults[] = {
>
> static const struct attribute *files[] = {
> 	&job_timeout_attr.attr,
>+	&timeslice_duration_attr.attr,
> 	NULL
> };
>
>-- 
>2.25.1
>
