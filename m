Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A32C9830E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A2B10E707;
	Mon, 28 Sep 2026 00:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqhDjkM+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E0A10E707
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790553796; x=1822089796;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+AlO/rvzMUttMXPm3OdTWfsVSuqRIM7NjrkINsMmQsA=;
 b=mqhDjkM+XQ25M6PoH1KP/gKSyE1tDjt+QyhkYKTm0m5ri8JlV35h9TkT
 3lS3cyEt75PgJ5I0cypxc7fQ2UfNyDenXZdrgfMwKLLvNlcBXaqSZEeja
 59llHbh9soOAAHXoTEqLoWL5yjNki5n0HK6ZXf++BSfoK9A0cPP7IjhcU
 DcgJzgcy5LurIyPwB9XtDgG+0hcwD3HteSLU1DswSHYYjhfUpSJMBRPcZ
 4fc5oq8igTzpPAdpDtrgElEN/qWniDXfbrZ0j0JZVGwQuryRojI0erBQE
 EEeCYuCeD5ndbjQNuo9bF+rPRgW4dDIlqSSoIRaw0GED0qskthfc/BHP6 A==;
X-CSE-ConnectionGUID: DXyAwP0uRqekuUFTyJmvew==
X-CSE-MsgGUID: L1gbxAsZRnuYRuZo1IVRKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102620168"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="102620168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:03:15 -0700
X-CSE-ConnectionGUID: IpL9XjJkRc+h+XtpSx7UdQ==
X-CSE-MsgGUID: 5dvgkjoKQ5+mjWOJZvQsuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="274119742"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:03:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:03:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 17:03:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:03:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9hOvMW/FEezWwE3yQV5Z19JC4/xFjfAsta7w9WPy78wFcAV371fY2VkRfc3A16S2acVqFSebsheIFxYrwXfM6EJopgjbGO+XRlx5lP+bF8UnBPaWOz0Czr81CQPjEDOG9b1LYXdXM6jpltq9d2pb1FNi5EaFDiWTFTR1YD/ojvHS1bd3oy/UQv1PJ7y4AVmDO/8yxfp9HltNnBsK4moskcZLurhwRvxcIr4dO/cuUjcShftXYKEDwdZ6/B0rK1NfZQlBDrZfqTafSF5eaeBUmon3d5is5kWnTe/mWd/ndIR7qnrHjSWhTkAcgmLUNJcGe5HUpPTB6N3WlqLjkw97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMsjXZ/CANJzSLwfcakgniNmKrR9kI1mY0PyJ/hH3Bs=;
 b=UCXK7/m5wKxQja/msqeDOXF8+YxSeHfr1BN8MBpNTNj+UxKL7cMpnsrbppVlejcuX1dfD0pSsU5Ka5ml8WK2h4b72roTvW/p347/qTsu23u4d9SezYFt6WukXpG29wOfnyE3+qEPpBa2N2wIBAg4XTl7Uqzg+/8pabJ8LgRREidARDc0JdlR3tJOyQDPqZYZPVlg5O6nB9Hur6k6KZm3/jc1h5WOc6BGuP5Pbp6JX7KISQLwMbWFWfNQ7SmcHBfOTvSQwQDOZinQcH4Hbvxjrk9zOFYnxyTSF5zwgX/mb7tjspNRVK0ip8BBAgxy3vRG9XvEa4q8bvpYbau8P05tjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 00:03:09 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 00:03:09 +0000
Date: Sun, 27 Sep 2026 20:02:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michal.wajdeczko@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 3/3] drm/xe/sysctrl: Add generic mailbox passthrough
 debugfs entry
Message-ID: <armunq2t6ZkNjVqt@intel.com>
References: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
 <20260925135521.1804299-8-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260925135521.1804299-8-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: f5874753-4e09-4c1e-094b-08df1cf3de3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: YvwBn6va1kTKgAYFa5j67pnyUPsMuZnvHh6R6Xbgi1lvM9VvhgZmbSp+JxGf2aeqUViVL6QjQrQZt1P4jyzz6hp8aOomki9L6lqEulsGAAOwn8DhLGZsEkziycYCkvszoS3rXxoD285WrLJww7gj1KZ4sEZhVhDjE3HdYeL7AbW52HxyXc2RDpIGm3urIBnyQvNwt91dHkzR8WLRATGzl9RxeOH79XOJQSjPNOlZRQfswHa6Smn9CcPhEC3H2H+6Pkrm8ed71/AbXzxdwrMD983SgxMmdDxQ0TvQrNeMHX3lK14rrdvmhkx87KWGP6wI40tSpDCmIyWVKsDVqOwIFVzASzGgTugnxfM4PTSsIHNCvRYjqXYRTfaH+QVat3jWWwypDlxQHTCUcqYJlwJINMPKVrh9h44U0q04gI6kN9egRDLChb/8YBLkTFNbzpR86AmJjevPNddZaf+Aw0Hnt534/GMBgd8MgiiILtkYpZ4fKdH6+e7IV3+lxTyLr4kfvRddGdIrWz+P7wKxA6JR8je8CnFWM2aQ/mYVCg4FWT/S4D9+hv9+QwioJgP1NlfJzSm6c4yH64oiyMacL26ALVvQ9uOx6E+A9oO+scnNvOef/5Sicqb60XWAj98r2oUBsrN3IdxkJhXY0KCz9/5IwF74qwsL4WRBYnB/cvNQe6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zeQjrOuRei6aqfkfrBmmjPVRgAVUsKVGOc5gP5G3jK35zHnfXpf2mOrk2aN1?=
 =?us-ascii?Q?XqKHMTxbMCjhKsE8wIXaUYpwYR6+xeQUZUMTcJ0Rzkz5vtbP2UjqxPh6AzPX?=
 =?us-ascii?Q?VNDw+pY9bNdx85LX6HpNWUUXk08BdOMDMS9vWOYG1gYClV4AYAwEcxK/0eiB?=
 =?us-ascii?Q?72AiXnwLAoVFjApj9HqOJpAOxpBbqKcsiPTnlqjj/FqtlAd+0E8O11c7LV+J?=
 =?us-ascii?Q?yARlsv+ZzFlMYhP3vNzTkiyttnR2onMpXAYOVXJZ2dhre4O15A2MnOeoQxlY?=
 =?us-ascii?Q?MlDY7j5mkic1t6w8a5Mem5YZqO+qH/ZHh0+0/bgEnGvNJ0eMdwdSCHk/PTfx?=
 =?us-ascii?Q?j8ekkX85wct01kYM+Vu9Bw9KeaGB7lyixoZ2Egbz+JuzO+SFAUPM35QEbrW3?=
 =?us-ascii?Q?t4Tz5hICwbwnVzCphxRKA1PGz1+Rusa3vGrNxr46xj5h6+dVRYCQgLw/YUV/?=
 =?us-ascii?Q?vjH52IMxAjnic9YqC6bpyx5DpjXkW3NAHw6Uh4l1L5aZmK2kMd/9t9a7EiPf?=
 =?us-ascii?Q?cFR8cCyqOIr/dbxegYqtQZ/d8ZSc2tnWvJ4eUJJTUIUQwO3IwZAGxMiNoRwe?=
 =?us-ascii?Q?F7hX2liRQMT8V629DDIciIJ5b4RGjO8AAYKrp0+CapGiZN8cM81LEzLAOzCo?=
 =?us-ascii?Q?n6oPTjE39pjk1CtN6pJ8d/r+MVtoyzwTmhukB1zHE9dwy90v/TMiTFDihBMQ?=
 =?us-ascii?Q?IpvtEcHTdbGLwBn/J5GxX4pNSl/Bj30WR9+7HXyb5DnNV93vXeUfvTpbPYy9?=
 =?us-ascii?Q?1eAY36fx6IJCfI5OcR8GKAeFOyHg3vAkDbV+5Dz7WR0SR30iMLOkF0yjQ3Ih?=
 =?us-ascii?Q?8iFq0d3O1m+icdwyAIr4Hs7W4J0VrjiK2gIBDwhY1qG0gbAOl4sIeK+tiRdL?=
 =?us-ascii?Q?lrbugiZjqrw7p8EU/0BbRunQ2bjTKFjgGoP0Wua6R0BS/OBV4fYxAle4CyAs?=
 =?us-ascii?Q?eu+u1Hf9fh36DuzeettLONn2uYugmkfeCD09mnkQkXZO7f8mPFN2UVJ5pc2U?=
 =?us-ascii?Q?qgDyzGvk5p7ybfU9QDgVHv9mwaocLcrkAEM9n/QJTtk62dlwaVVPG35P4QbX?=
 =?us-ascii?Q?3ViAc832TOnVfZdppyLIfkbADiGG7Bty7463NVZqdmDSlc77AlyO/TWUf4Bg?=
 =?us-ascii?Q?f1HqSWFl/OAY0x9/5iN+HM+7NuZwivgemp34pE1DpX6ujy8dM8k9h0wWI0pM?=
 =?us-ascii?Q?kDEhOKqMiwqhE7Tj9iI1lmbG8RfOR0w6P8dkbeg6XygpBFH2fVcFho1toaSZ?=
 =?us-ascii?Q?+HU9LM1AD0qK1Q/7YpTNI1b/bqreKsoxM9jsHEb67RKILbBdI4cJhocA/1/d?=
 =?us-ascii?Q?6E4ktWp4zs89CHfgAR+zGlcotZVAwlTyd6Rsh3YJn+URbysNyti2SPUUNQBy?=
 =?us-ascii?Q?qhqPK+mIDMXoVmZfW2fEVB+4nZMo1GM7vVODT/ZZ6DW1YmzfQnwkA1qEchA2?=
 =?us-ascii?Q?zGBqE4hDsjH8BXaS+USV2GyzY/7siTnf95Ktz5DwKW9cFT4nmljWSXooyiET?=
 =?us-ascii?Q?Yw5uIkuQKk2I0VJObELiR/pYcC4WvlOnQwnFsCjZpHaXc1oSonkiBqFiMupy?=
 =?us-ascii?Q?EaRlruM9PNC7IoipOllgxQJsaOh1VdDVus4ENfSOGa7pM6IHOzyglHtbLNI9?=
 =?us-ascii?Q?elQuyD/WwYOes0o8syl6lQnYSkk3NJBWgSKUvlyHo6d7NX5tiYsCCchkiTTj?=
 =?us-ascii?Q?Pz3al/OmHZK/xfxCX+Xtzrj+pp4KmjjV4RfgKSFUN8wUWkfTnQp7HWMONWtC?=
 =?us-ascii?Q?d+x9Nxg4iQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Tptspk6SQUHJu3sHOHHi6qMd70v1tyW77wuGE+NFZo/m7lnjGWjRrPiFPgL8Ga1yHfh65Ip0OkrSdAwLf+rtZgAJgB/GvTPfLRfW5bJDTYLhOuXMEUdguqV1DHZWHUBJi4BUGWzBEd77hmSeZX+ZnnNb/DLuWGnF1NqV55CL+9vdtW+s2IiE04VcNg/v3gFWD7FYQh7cgP2E9WUch/EdJhzw/HqMC08sKtU5moHR5SjwL9wEzWlWk+5kuGAOzDH4gAriuN3JeKfXtB4LcItTE51bOlRgCels0cF6MXIkgjm5MFSuAaYTLip9eswiVVzTkv65rtkGWuZZkwnZcb568Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5874753-4e09-4c1e-094b-08df1cf3de3e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 00:03:09.5904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vp9CkBCZqeX3/86jBYpnfbUrZjpFZXj8lSdAe7xxPQ20+s7CgulAJq2v/5g+d6xd7HZ1IrWhM/XgDlukZqeCaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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

On Fri, Sep 25, 2026 at 06:55:23AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add a "mailbox" debugfs entry that allows any System Controller
> mailbox command to be issued for bring-up and debug. group and
> command are supplied by the caller as the first two tokens of every
> write, followed by optional per-command response timeout and
> response-length overrides and the payload bytes:
> 
> - Usage: echo "<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]" \
>              > /sys/kernel/debug/dri/0/sc/mailbox
>          cat /sys/kernel/debug/dri/0/sc/mailbox
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v7:
> - Add per-command timeout override to mailbox debugfs
> - Add per-command response-length override to mailbox debugfs
> 
> v6 (Rodrigo):
> - Reject non-zero offset writes for mailbox entry
> - Account for mailbox header size when validating input payload length
> 
> v5:
> - Add per-entry locking for debugfs accesses
> - Skip empty mailbox group/command tokens
> 
> v4:
> - Added a generic mailbox debugfs entry
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 172 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   1 +
>  drivers/gpu/drm/xe/xe_sysctrl_types.h         |   6 +
>  3 files changed, 179 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> index 10675cd774ee..ba904cb24512 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -299,10 +299,179 @@ static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_deb
>  	entry->command = command;
>  	entry->response_len = 0;
>  	entry->status = 0;
> +	entry->timeout_ms = 0;
>  
>  	debugfs_create_file(name, 0644, root, entry, fops);
>  }
>  
> +static ssize_t xe_sysctrl_mailbox_write(struct file *file, const char __user *ubuf,
> +					size_t len, loff_t *offp)
> +{
> +	char *kbuf __free(kfree) = NULL;
> +	u8 *input __free(kfree) = NULL;
> +	struct seq_file *m = file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	char *token, *tmp;
> +	unsigned long val;
> +	unsigned int timeout_ms = 0;
> +	size_t input_len = 0;
> +	size_t max_input;
> +	size_t out_len = 0;
> +	size_t resp_len = XE_SYSCTRL_MB_MAX_DATA_SIZE;
> +	u8 group, command;
> +	int status;
> +
> +	if (*offp)
> +		return -ESPIPE;
> +
> +	if (len == 0 || len >= PAGE_SIZE)
> +		return -EINVAL;
> +
> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	max_input = min_t(size_t, len, XE_SYSCTRL_MB_MAX_DATA_SIZE);
> +	input = kmalloc(max_input, GFP_KERNEL);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +	kbuf[len] = '\0';
> +
> +	tmp = kbuf;
> +
> +	do {
> +		token = strsep(&tmp, " \t\n");
> +	} while (token && *token == '\0');
> +	if (!token || kstrtoul(token, 0, &val) || val > 0xFF) {
> +		xe_err(xe, "sysctrl: invalid mailbox group id\n");
> +		return -EINVAL;
> +	}
> +	group = (u8)val;
> +
> +	do {
> +		token = strsep(&tmp, " \t\n");
> +	} while (token && *token == '\0');
> +	if (!token || kstrtoul(token, 0, &val) || val > SYSCTRL_HDR_COMMAND_MAX) {
> +		xe_err(xe, "sysctrl: invalid mailbox command id (max 0x%x)\n",
> +		       SYSCTRL_HDR_COMMAND_MAX);
> +		return -EINVAL;
> +	}
> +	command = (u8)val;
> +
> +	do {
> +		token = strsep(&tmp, " \t\n");
> +	} while (token && *token == '\0');
> +	if (token && strstarts(token, "timeout=")) {
> +		if (kstrtouint(token + strlen("timeout="), 0, &timeout_ms) ||
> +		    timeout_ms > XE_SYSCTRL_MB_MAX_TIMEOUT_MS) {
> +			xe_err(xe, "sysctrl: invalid mailbox timeout (max %u ms)\n",
> +			       XE_SYSCTRL_MB_MAX_TIMEOUT_MS);
> +			return -EINVAL;
> +		}
> +		token = strsep(&tmp, " \t\n");

Sashiko noticed that in this and below case you might fail on double space.
I wonder if we have a cleaner way of doing these parses...

> +	}
> +
> +	if (token && strstarts(token, "resplen=")) {
> +		unsigned int resplen;
> +
> +		if (kstrtouint(token + strlen("resplen="), 0, &resplen) ||
> +		    resplen > XE_SYSCTRL_MB_MAX_DATA_SIZE) {
> +			xe_err(xe, "sysctrl: invalid mailbox resplen (max %zu bytes)\n",
> +			       (size_t)XE_SYSCTRL_MB_MAX_DATA_SIZE);
> +			return -EINVAL;
> +		}
> +		resp_len = resplen;
> +		token = strsep(&tmp, " \t\n");
> +	}
> +
> +	while (token) {
> +		if (*token == '\0') {
> +			token = strsep(&tmp, " \t\n");
> +			continue;
> +		}
> +
> +		if (input_len >= max_input) {
> +			xe_err(xe, "sysctrl: mailbox payload too large (max %zu bytes)\n",
> +			       max_input);
> +			return -EINVAL;
> +		}
> +
> +		if (kstrtoul(token, 0, &val) || val > 0xFF) {
> +			xe_err(xe, "sysctrl: invalid mailbox payload byte '%s'\n", token);
> +			return -EINVAL;
> +		}
> +
> +		input[input_len++] = (u8)val;
> +		token = strsep(&tmp, " \t\n");
> +	}
> +
> +	scoped_guard(mutex, &entry->lock) {
> +		entry->group = group;
> +		entry->command = command;
> +		entry->timeout_ms = timeout_ms;
> +
> +		xe_sysctrl_create_command(&cmd, group, command, input_len ? input : NULL, input_len,
> +					  entry->response_buf, resp_len);
> +		cmd.timeout_ms = timeout_ms;
> +
> +		guard(xe_pm_runtime)(xe);
> +		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +		entry->status = status;
> +		entry->response_len = status ? 0 : out_len;
> +	}
> +
> +	return status ? status : len;
> +}
> +
> +static int xe_sysctrl_mailbox_show(struct seq_file *m, void *data)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	size_t i;
> +
> +	guard(mutex)(&entry->lock);
> +
> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
> +	seq_printf(m, "Timeout: %u ms%s\n", entry->timeout_ms ?: XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS,
> +		   entry->timeout_ms ? "" : " (default)");
> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
> +	seq_printf(m, "Response: %zu bytes\n", entry->response_len);
> +
> +	if (entry->response_len) {
> +		seq_puts(m, "Response data:\n");
> +		for (i = 0; i < entry->response_len; i++) {
> +			if (i && (i % 16) == 0)
> +				seq_putc(m, '\n');
> +			seq_printf(m, "%02x ", entry->response_buf[i]);
> +		}
> +		seq_putc(m, '\n');
> +	}
> +
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]\" > mailbox\n");
> +	seq_puts(m, "  cat mailbox\n");
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xe_sysctrl_mailbox_show, inode->i_private);
> +}
> +
> +static const struct file_operations xe_sysctrl_mailbox_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_sysctrl_mailbox_open,
> +	.read = seq_read,
> +	.write = xe_sysctrl_mailbox_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
>  /**
>   * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
>   * @sc: xe_sysctrl instance
> @@ -325,4 +494,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
>  	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
>  				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
>  				  &xe_sysctrl_ras_error_inject_fops);
> +
> +	xe_sysctrl_register_entry(root, &sc->debugfs.mailbox, sc, "mailbox", 0, 0,
> +				  &xe_sysctrl_mailbox_fops);

Should we put this behind the CONFIG_DRM_XE_DEBUG ?

>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 2554848e7484..a0628eb47bff 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -155,5 +155,6 @@ struct xe_sysctrl_mailbox_command {
>  	(XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(u32))
>  
>  #define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
> +#define XE_SYSCTRL_MB_MAX_TIMEOUT_MS		60000
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 8ea6e1f29ddd..f12455f2886d 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -39,6 +39,9 @@ struct xe_sysctrl_debugfs_entry {
>  
>  	/** @status: Last command result */
>  	int status;
> +
> +	/** @timeout_ms: Last mailbox response timeout used (0 for default) */
> +	unsigned int timeout_ms;
>  };
>  
>  /**
> @@ -71,6 +74,9 @@ struct xe_sysctrl {
>  
>  		/** @debugfs.ras_error_inject: RAS error injection test entry */
>  		struct xe_sysctrl_debugfs_entry ras_error_inject;
> +
> +		/** @debugfs.mailbox: Generic, user-parameterized mailbox entry */
> +		struct xe_sysctrl_debugfs_entry mailbox;
>  	} debugfs;
>  };
>  
> -- 
> 2.43.0
> 
