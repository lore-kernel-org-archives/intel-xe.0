Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160E5D1267F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 22:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB35510E6F8;
	Tue,  2 Dec 2025 22:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzsC1Vs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15F410E6F7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 22:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764714546; x=1796250546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q41/J8IQJlQOQKRzpaMOsKZ8xbjyoZJRIdSnyRG6rqg=;
 b=dzsC1Vs8DOsBiB1D1uv9x+WFpSzAmg0NXz2WcWk8LAE5TCdCwQ50gjXA
 MohkzToy+y6DJUcqUOlVDkA2cpPXtVMVwqtag58v/Ic+UH4B4NSPvznMO
 hPtNPcWUUSqUVmc3iQmRsX+vNE/adPYNLtu0LGQntfvsV02K/+KeBgB1B
 o39fvaWQYV0E1aopt3WaPRu9iZJS/RQz/kwjdhfQyfgJ89dU8FZTjREom
 Do/O1BvMVmnWpDWsmNfl/tCkHYKH/Qo8NgBHp6twhFmGpCj86bqf98lHT
 64xMAvL3m7Mz/DC3c/l1Pt3A0j7zsApbg3WfpaJFNjqUFeVynR++Zarmq A==;
X-CSE-ConnectionGUID: Enr1Jnl5Q16Il8oQsj1Vbw==
X-CSE-MsgGUID: PpQr0rRgS1+VNaL/QOhpxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66641887"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66641887"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:29:06 -0800
X-CSE-ConnectionGUID: XQuwATghS7GnoVGHTdNnrg==
X-CSE-MsgGUID: 8qdzriZgQlCS94Yce9p+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194743928"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:29:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:29:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:29:04 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:29:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFiVf+3wG7dbhO7L1mvgq3mt5LYnvLSBf28VhV8KlRTmx1/yY2omqZxO1APYJtxluBnEWNdK7SqlIjCMVpACxU4kMW8XgvqhclzbygIAuuEoxWm0PC+YSiHTxa2vZhUfBbK7EXtALRDULO9wbOtNwPTfrDJsalHUfYdrJ7nfzREtER4IWVFdvXKVgJGEP483+Bt55bEBAfJ78qCrOHSVBLmS15J5Bg79DndFjVM0TxRDJgDTB0PtombMsWhtrvorvp73UOkXXpH26ubAjQKFXogKI3opSsWVF7lCQP+EH7tuR3ubg0gKZ+e3fp7uDqm4qf+AqsAm3ys85abtHpXWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns77ZhsLcuN/PSnUAlEJlWCglwq88LXQObXf8L8TPkA=;
 b=LjJoi1IlarMgwsL5eL+TjStzkvEWWsHE4nk2oB2xlSfG3GGyTUuNwwuxwH+UCApbaVhDB0AF/sBG1EpZ+T8leFFYrOSX/SLHbA5DCUzIwUt3qs0aLL848iZiXu8tU8wDMUr+7o/6tqXHDaAERULQMELT5hJQQZjkWdXvsV7kMfwMplt8PGCCS97SGRDKUr0fIF/w33pV5dwEGkUpkMITDGCFfXqLNE/SsySUgprf+X3HMBmjTntNEjUEVMZQSai92FkxF5YXEInHyyCmlqsrhFMk6Z1CTD9vJJNMXBa0w/Fbqh5QdkG9o9EqlReB/REQ+lcz8i9fQ6rfbNB93+OXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 22:29:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 22:29:01 +0000
Date: Tue, 2 Dec 2025 14:28:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 11/11] drm/xe: Add debugfs support for page reclamation
Message-ID: <aS9oK/4y0NQM1w/l@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-24-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126230201.3782788-24-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:303:b4::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d2bac4-dbc4-4adb-2716-08de31f23190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j9MX9GcolF4JCNIKtm+/wE8EssiMsFw2GH4SE/K1Lu9uo50jvYpMfi28AUgW?=
 =?us-ascii?Q?IlynDM89GgdC9lsFITSLknqbBtAPZt4tXaMsUsez61UvC5PIS/prRozWJVsM?=
 =?us-ascii?Q?dJm2FJnO4LXWyohRMzq4u6d34x3Zz6NPI7yWmTjzFQU108w2ONQyQn9p1gaN?=
 =?us-ascii?Q?1pOJZImuWy9OKXHn/Ie8ec3RBMWdi4I2InJ30AugrJy4H0gyI6AQ9fTz6hwK?=
 =?us-ascii?Q?jh6k6i06Mon0BOsBN/QPqlo3ljpUksc79zmJw+hwXSB52nFXWcZWEEPbeTpy?=
 =?us-ascii?Q?MzMENWIbEPCM0+eF8TLo1mM0u+LAWB3MjTgkZlKJXXG8o4IUYpGNNDxkYpTK?=
 =?us-ascii?Q?gfraK5WMoqDSCgYPSDOLIGlKko/8fzAsT/WehfQoUAjF5XA75h01CtQ++8bs?=
 =?us-ascii?Q?KeG/ANHiInYoKysyZu+ZCE+3Qw2qfGTi4tP9yvGDM2uNuxCPMA6FT3oXBtP2?=
 =?us-ascii?Q?CI00NUNNQVkDb3DQ9bOa7lmgj493C+ned4IYR7th/lwKcQ0mTuiOh6r444tM?=
 =?us-ascii?Q?Uo1as8XKCmjq9k9T+HzcIyQ+HGdRDWguwfyk41qzdxlRx+Ay4ydxO8hM/FEz?=
 =?us-ascii?Q?6IhIJXinXBUSxe0JonB6IwfV4aM6d80ZCqMmurGh8kVkXPMa/JYCwvqyKXxM?=
 =?us-ascii?Q?dhoFOiNPqi/2pw1t4B8Eo0YS9B1lyXyQ2ACOMx/0nnyuq5HP4/ESN64EaIvW?=
 =?us-ascii?Q?anjXI1P36ildzuppKLdiigdSUvHKx9c/1ogfqASInBXY4tofRS/y4JZU0F77?=
 =?us-ascii?Q?AW/zz5D5bUrpZpvCRamyYx0/8kj1fSZ7LzEeV/ENzMRsolCbvg2izYuWJGRA?=
 =?us-ascii?Q?LP2SqBdpG0fhhvKlX5GVgq9gRT8VfLAgr7EPdH74THx901s1+ns1tz9rSmtB?=
 =?us-ascii?Q?shvAPZ4wj8nWrtCH5YhOzMpD3HPuZDbJpbCiLr0cUl+s2ZtyRKr8IVl0HPBX?=
 =?us-ascii?Q?ge7vUkVcofh3lklSPiO/yaDb6tGct1RSoWHVOPRIQ7lkGO8NtBbWQw6qwrUx?=
 =?us-ascii?Q?VgH4ge2/PWjrN8gDuy7CWrDs6reCExa3fhOmmYkLacGQ4i8r6CexZ1oHYgqk?=
 =?us-ascii?Q?9T0selDVINLyEvBo1qznk/LoNrDXfxIRCEtW0mKF//62bNEjJeAwuCpLDJua?=
 =?us-ascii?Q?np+6tg+zvckCnB2aNzTGiEK2UeiteA8Ho2Dao7mx5V2xwQFTSz4AM6Re74OD?=
 =?us-ascii?Q?WKvixFzGlEvlSP6yAB2g/SxoRWkcUQKn5bM9F+uJ6PEJX6/da+lWCpO6yyt7?=
 =?us-ascii?Q?6IpeenZkAxBz10zzPp7vbSPBPry8Ial1lKavlnAJXxOpC5qeJo2Yc0jf9NCQ?=
 =?us-ascii?Q?mOtWI+6iAA7PIU0NgGfCNMggNh//1uaSYFXWoTMEnZS+LHYyu47HSjMgx07h?=
 =?us-ascii?Q?TI2XuMCt7zR5Aerb93AVpphSbZsNY0Qo9VU2slDu1hQzF/sNgoVHmcrdTEMd?=
 =?us-ascii?Q?atyM0lUAVymlt5Qa3tvxaUUex4m3xdXt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4bqO2KM27/ggIxgTwb+a77lqp7GaC4D7zcOss+sDUk9W1Xsx5jyMnZncQhwG?=
 =?us-ascii?Q?6+fSCb8ajAaYVkwCiR4VIL/p3J6fV1FibSjfv6TjLhGFeUp3WXzIXAsmVyOt?=
 =?us-ascii?Q?GUAAqDo07niIDaMlFu3kcvwYHA6O/I0HfwdcAo22CnU0lwsb+HFEbnVMSZCT?=
 =?us-ascii?Q?gRxuZFyU5vBH8a6Lutd2sYu5Ktt+sXnKZmCQe62FOKiLT+AQLcN/KFD+Vf8q?=
 =?us-ascii?Q?sfky7mNhF4HjB5zgezo1Hy8O4juoB2ZaA+euHmU1T+iYTq2qK5DNzWfvG7cg?=
 =?us-ascii?Q?gfriBG6iGCyaKoA2qvOjj+HIEgzFiRx+vZb8a08+qG8GUwj7VPHwJMvfmeoF?=
 =?us-ascii?Q?nJ9YsixWLcCA7poseTO2UC2jIhGQorz8vHFmgTScK7e0Sh0dsMvMH/75Rn05?=
 =?us-ascii?Q?/1yHFtIpae3ZfWwOcqmNueLZvTPbR8a1K5CLqSWNFsjNzHvbQt0VAg5Le28S?=
 =?us-ascii?Q?mQneA9bn3vXZCRK21OSLeBf/4T+J6WO5sXI0KWbySf76Huz42172Y2ww484Z?=
 =?us-ascii?Q?w9y8JAR8a17tap+nz/arpWVS26YWy/EXy9x6ZuYDzdPzX3cuq3fJBIlXQMUG?=
 =?us-ascii?Q?vDM5YdUAS3H2j+EMrvyjSbw2RArlImsp0loEcnS8DZwf8QygiuFejxxcaRkl?=
 =?us-ascii?Q?Wt8RV5idhCGkKhGgj4AewjutBTnbVn6h+QUVauzCFx5ZORfudluy5mrprVyX?=
 =?us-ascii?Q?Q0Z86HpLGInLJKoYyrU7C2kZSHAMjLoU2h9k3cAzpati4+qEMHvJ2hq9InhK?=
 =?us-ascii?Q?L1jbDewENCMHygVi0poR9BIBqa/2thKJUuTxZdY395HzrT1hZdRyYraok5rx?=
 =?us-ascii?Q?eCUAxlCqD3jS3FpPifJmQC1t7iU98g3NvQ7ATd8IcK+yVJgTcxc/dEvDbIil?=
 =?us-ascii?Q?lMu8hsU/lK3dWYgpqR9uqfPTg0scV8+E5M+T7KT29lWeUFi6qOvG3tlZbR4i?=
 =?us-ascii?Q?kWJaYiGhT/BG+AvYwedhbSVGZ68Bcf4U5Ws8RAEuOVjykQL4DEinEUJqk/fU?=
 =?us-ascii?Q?PJcErLfamcucE62EjkZ8i/0txDn8/1ol3JIfS9be1ZO35D4a1NMctqzaZrsT?=
 =?us-ascii?Q?rBOOJN2HXFA1Gty6jIIcGni/LcyiD+5k2s2Hrq7sE9/GXuQGlVUWEOLbieC4?=
 =?us-ascii?Q?9aCqSmtolStzLsn+TRrd38h6O2CYx4ZGZ5bEtphpWbaU0HUeXXAO/FE/gHBp?=
 =?us-ascii?Q?EssoXWmOh1Wz9HRIWXvNeN63xPbo0UBvM7XbSAPOzOs2B0nraWc350bDa9r2?=
 =?us-ascii?Q?mr9FlluMbi3g6uormcs+nuis93VgkizIgXUrL3sMN1i/Ka6cbzbvuoH7VriQ?=
 =?us-ascii?Q?Reqvpga+hi+4puhP3NlQMco67udUQl/x4wRtc1+pMWjFUaYtdSnHO7cR2t7b?=
 =?us-ascii?Q?TXMLm6AI1SDcF3k0t5R59rJ0kVY4eXgx8mwgyd41A7+MGG+r0MUBz6vfKnOX?=
 =?us-ascii?Q?eB9KPHQQ3/KOtBLHMBC/hERB8MUNMXeYXGFoZMDe38nY5x9UDKbb6v0CLDA/?=
 =?us-ascii?Q?8MeFIiyPepMVOoG9Nn3fopUdFd+7PEMivlBsVxUMjl6ZGmpPPW4s6xSBF68F?=
 =?us-ascii?Q?mghde3+gIcIDFkv8J2MeMLjJJUd1yN7ElXcKwqQGKLdsH9cuNkWuAB/zEsOL?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d2bac4-dbc4-4adb-2716-08de31f23190
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:29:01.8114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0JWir1RtV1rENOEvHh5V4iZZAp39Xkn234V2nx0BpDqg3Q1WhlMg+tRj+rG0xvexehS5x5lUyQWnTb2SjdMjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
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

On Thu, Nov 27, 2025 at 07:02:12AM +0800, Brian Nguyen wrote:
> Allow for runtime modification to page reclamation feature through
> debugfs configuration. This parameter will only take effect if the
> platform supports the page reclamation feature by default.
> 
> v2:
>  - Minor comment tweaks. (Shuicheng)
>  - Convert to kstrtobool_from_user. (Michal)
>  - Only expose page reclaim file if page reclaim flag
>    initially supported and with that, remove
>    xe_match_desc usage. (Michal)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 41 +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 1d5a2a43a9d7..296b8136511b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -291,6 +291,39 @@ static const struct file_operations wedged_mode_fops = {
>  	.write = wedged_mode_set,
>  };
>  
> +static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user *ubuf,
> +					   size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[8];
> +	int len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->info.has_page_reclaim_hw_assist);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t page_reclaim_hw_assist_set(struct file *f, const char __user *ubuf,
> +					  size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	bool val;
> +	ssize_t ret;
> +
> +	ret = kstrtobool_from_user(ubuf, size, &val);
> +	if (ret)
> +		return ret;
> +
> +	xe->info.has_page_reclaim_hw_assist = val;

This does seem a little dangerous as someone could set this on
unsupported platform or GuC firmware. Should we maybe store
page_reclaim_hw_assist_supported + page_reclaim_hw_assist_enabled in the
Xe device and only let page_reclaim_hw_assist_enabled move to 1 if
page_reclaim_hw_assist_supported is set?

Matt

> +
> +	return size;
> +}
> +
> +static const struct file_operations page_reclaim_hw_assist_fops = {
> +	.owner = THIS_MODULE,
> +	.read = page_reclaim_hw_assist_show,
> +	.write = page_reclaim_hw_assist_set,
> +};
> +
>  static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
>  					    size_t size, loff_t *pos)
>  {
> @@ -397,6 +430,14 @@ void xe_debugfs_register(struct xe_device *xe)
>  	debugfs_create_file("disable_late_binding", 0600, root, xe,
>  			    &disable_late_binding_fops);
>  
> +	/*
> +	 * Don't expose page reclaim configuration file if not supported by the
> +	 * hardware initially.
> +	 */
> +	if (xe->info.has_page_reclaim_hw_assist)
> +		debugfs_create_file("page_reclaim_hw_assist", 0600, root, xe,
> +				    &page_reclaim_hw_assist_fops);
> +
>  	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>  		man = ttm_manager_type(bdev, mem_type);
>  
> -- 
> 2.52.0
> 
