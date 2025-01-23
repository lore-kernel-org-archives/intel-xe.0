Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D8C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 19:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4E110E3BE;
	Thu, 23 Jan 2025 19:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lzvmrndf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3654D10E085
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 19:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737659587; x=1769195587;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xsQiPmzZKaY0Ev1GnzoOY0RIqSJ09oaC1rrX7Q6yOZ4=;
 b=LzvmrndfiRqP0fwAs/6FeEM1cpUJt1FtQbIzCgAspgYe00VTZObVQAWT
 tu1Km6+FKHu5qP7awnj1Yls63BF+wl5Rgn2+aAqyyT84nk7qM3XB7xqup
 YNlxORqWzTAXXkVtEaF4yPYllnunkJOArG3s6LC9Uj/4ypMMGvG5/K30U
 AI+tVpBeIpxPc7z1Uv4swK7YJbPCxHCprB2jTMcB7+Kua03EzvXOKown+
 8lARmI2fPCPCqm/1R2j0CD8VW3cn7bAkqfjowVyhVhWQae9k6UVK1T4c0
 CYGezuMoEzYit2iN/dNmLwZBXrtee8EDY/XXngyA8CZTS3YP1A4Fqjbl7 g==;
X-CSE-ConnectionGUID: byhrOdeeQjCj0siFX7cl5A==
X-CSE-MsgGUID: iBZxy0s1TKyQb3vqGBxhVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55724978"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="55724978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 11:13:07 -0800
X-CSE-ConnectionGUID: UdCqkjj+T1ebWvdlF21lvw==
X-CSE-MsgGUID: +T28cXJXTmmU9owfaKTEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112185826"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 11:13:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 11:13:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 11:13:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 11:13:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+rru8ItZ0EDPdWrfqtdcR9BdUzWl1PPgenFq7tHW+z696spLoF/1LTGsjF4E4SP8GjqOHdmxUk02U083UltBsWhLxL7q1JpfcmuWoNS+1k7lYNZeoYPO4//cxE7Tkn6PkrcMMX5UgOtc1tHGcZZQPFkrNFHsB1p1lsGpNOeY5GAWMZbfXfopPE3wfCc3Jm3kC6AgUihw4Fj+dMvzomBk92y6vtpMDGIrEURJQWIaErx2u+BkAecMMfqWavGwCO1jXQu+T+zF5eMGTaFz6m1Ih2JU6LiZbF7h1tpV+X1QnTg+Brt2GDH256mx3a2aUt+S6hDDNx9mr+PqagCafvvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6gVO8kXZKIDuEN23f9CwywRk8DxfXHeRT+z+ipP/1k=;
 b=LUetGADMIJ3NvvyMktXhRISzWuPcJoht3m8JrhMeHPbxzT+hDAuP9PpZNqDvcYzQUX/JxGK1xgrKFpDQWzRseNaWR1mlcGo/gQhmYuW/1hHe7dGIIaECxsPJqGKQfIL5OBwJCsyupcHLDiuMXO72Nvs6NBswzoaqnWYS4VF9j74JTA6FDf2OzPUGy6Zq+PTc8RPacxnE+3SaW3vfgIOwvG09vP9PDi9/hy67cb6hlJ6XWdflXoudmD49FRrkloQ9xqCaYcq8PqUXFytJtmrUqDGWd/uoTVBFQ9m1ANjLcn+3P6abjYfrWmVMGl26hikQ3ew2TMBnkNfi9baGJCCC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Thu, 23 Jan
 2025 19:12:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 19:12:35 +0000
Date: Thu, 23 Jan 2025 13:12:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Make GUC binaries dump consistent with other
 binaries in devcoredump
Message-ID: <u3cyxl27ipmu3ihyfzvsgdfzyygetj5r2yaisk7tfq6kj63irv@sfsmvcyss73e>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-3-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123180320.66198-3-jose.souza@intel.com>
X-ClientProxiedBy: MW4PR04CA0239.namprd04.prod.outlook.com
 (2603:10b6:303:87::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d14457-481e-4e4e-c39c-08dd3be1e533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?d/+VS5WW6M3ToCTxjXsgOcKaw76XF5vWbX2p8UHtC7Vxuzb4ccNP5+dVgn?=
 =?iso-8859-1?Q?LG/K8j3/pj17P2q4XqUOfFGQENAEdcfpwnH/GVjHlFdQA+QJIqqI7hoisO?=
 =?iso-8859-1?Q?TJeuIEGxGFqysDcsUe7/I95Hzg8WdFwBmFepkHGBfL996LpQnqSxyetHEb?=
 =?iso-8859-1?Q?GcPF54xoOQNefrSXkHkEynJg0HHS4CYOQxoKhPIC07VGeJJxyB3eKNkdGG?=
 =?iso-8859-1?Q?XFiBR7MUOZzaUQ5pfZUT33gfho/LDY8m7ZjPhopBA06vzyTVOHuVtEj+wl?=
 =?iso-8859-1?Q?cQcGASrgz/2+p35lslQcesBB3HNJKz0lwY10/mHm0W2kKA9GMu/GCj13Wd?=
 =?iso-8859-1?Q?FC/ozcw/MjpA6puAe/0zqZXM8hDATUet4aqH0KHTM7MfGU74+ZLihNybt3?=
 =?iso-8859-1?Q?WnO+POHuDUr6dFo3PCAE6IqRXAvyHA4m9llHe1+dPFayjQUoUBoqzRViaS?=
 =?iso-8859-1?Q?APHKwlS2QCRUwX3sMy2XvF0qHP8cwfdJA5wLi3hDcul4w9QBx1C7jLrW6R?=
 =?iso-8859-1?Q?ZCGwGExIy7fTSY8EDl+mbu9RbGvmdR64u82zhP/9z7xY26BN4UXdSyhYoY?=
 =?iso-8859-1?Q?6qbsNfpkMHwMFeB1Qr1M/V0orGoBfR1Bsls/tNtHtICj9q9OBrMVbxSsYH?=
 =?iso-8859-1?Q?OQytHgAUtoQTZCF/IERScHgQAV33cbOwx5/nvYsWXyfNJS0WtE8IpnSju1?=
 =?iso-8859-1?Q?GEa36CYJ8YHqCBDSbYfPSHyHC+2YuQhCFdMPT9Vd6Cx+Ta39z8TxYdv36I?=
 =?iso-8859-1?Q?OJwZdDJM93fIGUpgst4boQSKo1X+f6GAU0dmVhEJrW36jPMe7b/ZoL4WLn?=
 =?iso-8859-1?Q?IWgoyfZ8jaqtOB+lxPJtBsITcwO0bfkj23shbP/s+O+VBbqlC6ikLjsO96?=
 =?iso-8859-1?Q?drh7V8LzDTwEyh2/bJR1eCDNsEcZQypvAulxAS44/QX3+UHkjh7LhZyWzK?=
 =?iso-8859-1?Q?+We/Hj+Ds39lHVQZuU0I6+0iswOgYK9mCvg4qwBw5AdBNpf/W0ZYi0ylo5?=
 =?iso-8859-1?Q?Vnx0p9s7Ga7NePEUupa+7ZeS6/0q+MFwTCDN5+SqPFy8CuB+7EPO7WIEo1?=
 =?iso-8859-1?Q?xGqLFI2s/DPFQQRPN7dGKW7B6/JVw2Y5JPkFsJoxxFmfE5ev7nQT4mOP4+?=
 =?iso-8859-1?Q?T0hV53RSKPj2Yyl1YSgJNcWjjZ7aoa8jELqBApT8cn0NZnn9Zw5mP6K+bi?=
 =?iso-8859-1?Q?54oF9quGIxMX+BlKWHfsOvs04efPJvbITXyQSpUDtLJ8s0pUNheMstB0cy?=
 =?iso-8859-1?Q?ifKvflVLIqrkABlHfBKieoF7D93inA4Bqfm8LD5KjTYQYktPdj5CkchHvP?=
 =?iso-8859-1?Q?4B1luX7mQsOw4wzx89KlSYHwsezPYkBApq7GwVCiwIdb6m9GbHDYRN5GJs?=
 =?iso-8859-1?Q?+0y8W9ESOi3Bukt3FlhBSvqdwUo9zHzcq60qB1LuPSBwH9igs8dRYbdmaR?=
 =?iso-8859-1?Q?pCsk9rRyZZUqHsj3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?E9lFbUvBOZH0oNe8lmQyPY7oTf7nfNeaxhLXuwvUAa3dDd9uDThlFrsm1B?=
 =?iso-8859-1?Q?quQ0TvZXs9fX/iKhuwLzVlHxDpOvVU0J/ngJ0e6xpUzGTddma5llJyCEeJ?=
 =?iso-8859-1?Q?5RcvLe9ftI472XRPC7RYlJB91v0o/kBbtXZwoyjan3ZlQLtV1R6ub3KOeK?=
 =?iso-8859-1?Q?n0vsNsLUToCGjfLAIv/jvtCvvJ6InW8A5io7rR9WDGI0g0dZp8BTwHfxFx?=
 =?iso-8859-1?Q?INd26VBs+5yuzGe9tDNA/ESLiMy5ePslUv+l7AMEf+1Rp9bnpq2PTnyMms?=
 =?iso-8859-1?Q?AEAT2JFGnnTKyTyZfotU2twFP2hBj5hwzhV/KpoGGMKKgSnave1LD7GNtv?=
 =?iso-8859-1?Q?SGzJwgwaGRbRNqJLcg/FdrE9a6UR0PJ+lcj8signvRAwqyvEQYu2TNbkQN?=
 =?iso-8859-1?Q?vQQUeiB59aTpEc0Yj/c7MHdQZlCcWj4be5hFJ/o7kzV6zKQ5sU3FtYZyi1?=
 =?iso-8859-1?Q?W8txBILW90WFFvAKU+GEMKXNFCAlZt1ngN0/EsUiUM0VCo+4bMsNb09XIg?=
 =?iso-8859-1?Q?j31rPN83WezVnzMYEDfVeWQ4x7E35yo1UbxQnth5QnA3DRMxRDY73Og+lE?=
 =?iso-8859-1?Q?YE40MnbCnLzHjIp2HJYpaPeWIRfbjcqYjUoaA9VN8gAk698DmCwraFXDIm?=
 =?iso-8859-1?Q?VYPfvYoPyb3UteSWuz23zBYk9BohyABDLCohcMcfRSXlAhVLamhp7J3cpM?=
 =?iso-8859-1?Q?rgGhhhTkOzaV7EjqZpktk0RWNva5wy6kaQGRvf4/+BHjToJkYB7HCvz+0R?=
 =?iso-8859-1?Q?SFP+f6z6LqCEbF4sdCJAwA9p5pNRNReN51Tk2NFU/25m6nj5gTPOCiuC/a?=
 =?iso-8859-1?Q?LZ91o9eHXOMCoakEvZNRuSvb9l9ZOYfniSvJYctyJpiF/1rk+WjJwSQqIC?=
 =?iso-8859-1?Q?0+0LinFRA4WdfG6psvJdr0+gMAlHYh4d/ZXsQs4pavEZvOe0CWs3Y4MWcx?=
 =?iso-8859-1?Q?2LMpi6+oTS5SKcjXtjugaZywh8XySiCUaOwdmQiySN9cY0qCwyJRFwrfbk?=
 =?iso-8859-1?Q?jDrQa46I/8bQN52o7TaP2cJsASfDJqtGn3d5Y5q77ICE4MjUv7bdkeORX2?=
 =?iso-8859-1?Q?UE0OFXYKUSjP2smcyUxy+7vAMLkKMnZ9jxuiRE3bUOaz96lEGfP6BxEHYi?=
 =?iso-8859-1?Q?2wI7acMRHucKpkqz0ON4phwBCBF+Hn72NlbMlPEyJ3FzsxOQOMN7sE5Sp4?=
 =?iso-8859-1?Q?uQ1b8qdU/XJHwmjBPSOsUPIRidbQt25jZUPqbWNJgLA9QqZ41ygHRoMT+4?=
 =?iso-8859-1?Q?lWdSfOmq3zWLIG9M+qSPVh+A3qeNkNVOLF1an/yQh8L8RGNUvJ9kp7JN0F?=
 =?iso-8859-1?Q?Fm1Q+KXNU6SAeiYwx3qHqEK7J98cTdZfq9aVgUul5uCKfxqrg0+Vuq3+mA?=
 =?iso-8859-1?Q?rG/0SV1WBOQHPot5VfGxNWA/U/IfIbk8QI2woPp3fYSqIgvds1EE0jPbSJ?=
 =?iso-8859-1?Q?cOqS6E78Kv9P22XOq3uHgq7m1ctr3gn+uBZXrY7ac2tatVFvKXgaeAusfg?=
 =?iso-8859-1?Q?KVdlR0gL7PEJaysQNUIeHCFBpP7Rb8W6qkz+z50VckjajbqJqd2kNpR13s?=
 =?iso-8859-1?Q?TXzzMYb92Zs0iElB8XyV1mqdURQjr8nZwPoZu/BBNTWC4FMA8EwxyTo6Ur?=
 =?iso-8859-1?Q?ESfabiyaGqsujH/qtYalVqPwoc6S4sipaRIPvP2cEsn1pboHxkDR0jCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d14457-481e-4e4e-c39c-08dd3be1e533
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:12:35.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsU0rqnsdDsBwZ6ZE69UnbFJ4y1GrtgCjVljH1MeUwYSy3tfuRrzquNjQaSYXSXahhFk5YWz2trREY+XW0mycnQhV0fDMVmYou7TbiJF+Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
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

On Thu, Jan 23, 2025 at 09:59:42AM -0800, Jose Souza wrote:
>All other binaries follow this format:

To be clear, since the other ones are not using the helper function:

         drm_printf(p, "\t[HWSP].length: 0x%x\n", LRC_PPHWSP_SIZE);

         drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_PPHWSP_SIZE);

         drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);

and I double checked all of them have .length meaning the decoded
length, so ack on this.

>[name].length: 0x1000
>[name].data: xxxxxxx
>[name].error: errno
>
>The error ones is just in case by some reason was not able to capture
>binary.
>
>So this GuC binaries should follow the same patern.
>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_ct.c  | 6 ++++--
> drivers/gpu/drm/xe/xe_guc_log.c | 3 ++-
> 2 files changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 50c8076b51585..497036675a38c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -1723,9 +1723,11 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> 		drm_printf(p, "\tg2h outstanding: %d\n",
> 			   snapshot->g2h_outstanding);
>
>-		if (snapshot->ctb)
>-			xe_print_blob_ascii85(p, "CTB data", '\n',
>+		if (snapshot->ctb) {
>+			drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
>+			xe_print_blob_ascii85(p, "[CTB].data", '\n',
> 					      snapshot->ctb, 0, snapshot->ctb_size);
>+		}
> 	} else {
> 		drm_puts(p, "CT disabled\n");
> 	}
>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>index 44482ea919924..462ec4bb98bb9 100644
>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>@@ -204,10 +204,11 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
> 	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
> 	drm_printf(p, "Log level: %u\n", snapshot->level);
>
>+	drm_printf(p, "[GUC].length: 0x%lx\n", snapshot->size);
> 	remain = snapshot->size;
> 	for (i = 0; i < snapshot->num_chunks; i++) {
> 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>-		const char *prefix = i ? NULL : "Log data";
>+		const char *prefix = i ? NULL : "[GUC].data";

as mentioned in the other thread, name is not optimal. And remember to
change on the .length too.  With that changed,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

> 		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
>
> 		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
>-- 
>2.48.1
>
