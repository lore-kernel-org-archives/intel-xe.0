Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D84C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 14:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F41810E245;
	Mon,  6 May 2024 14:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6nTb3s5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A1110E245
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715005390; x=1746541390;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lYpB222LaGzrfIZy0g2nM6QhrepKZIYVAS1f+AUwl9U=;
 b=A6nTb3s5PVNXNyx98YNDoLNZ32DDs6B//wrVh11wkwsNc2isBAgiHK67
 favGup/V2scq99QqlzKbWODYu1qiaxZYbw7SXfw5O5OrXpLYylxcQ731e
 fOPA0OSlrHwDEahhxqgulLjYr9AR7wj62AGPurCjqUedX+gM9gbPvuesw
 VL910MZO/QxHouHttN5hevhAEmZu0EXw+MgpCOhfIFdGu+E4Jiqm1QKaK
 wohrmZ2Hpt+aD+IGFv0psdB2NQuPaGz69CCZhAgZCws0kbF4LPnd1QT9Q
 I+fPtiqsGwR5eBEaKqH+A/cunC/CFdXgykgC2OhXTsLwzaJJVY6d+dDov w==;
X-CSE-ConnectionGUID: FzVUqWtESSiek7n8LtjmSA==
X-CSE-MsgGUID: Yw6MuYpMRiq3hU75zSyyDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10876871"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10876871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:23:09 -0700
X-CSE-ConnectionGUID: brTUWkztTlW8EewQSqfQKw==
X-CSE-MsgGUID: m1ivls8PR3uJlqN6SlDvAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28063410"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 07:23:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 07:23:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 07:23:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 07:23:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 07:23:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTmPafkyl5zadXLGB1s0AfgPzafdC6uWR7ZXCWYdP2s3HspBysWd92tQdoMWB53riSmn9hoysTB8dicOoe08G3OUO5hRYFVk+1kagxS4DHgfCbvbgLBKY4dlyNyH0Cwl49ZJRwwWhokbmwpZzNrvLyEmiGSpoxJ+9A0sLJU/7bpgqjZLsTKx7Owiiq1NoxVmgoAsd9+9rUr4V6eap0A2tDUyg+XgW6bkzqq3fECaYitQAo4VERG8TXlrAtqSgr5FmayfVv6kq7louat1cMwBbhdYn3xWqIBZYKafsTmU8QZO1Gn+YMhQ8WUOY/74EOt+in3QD7FPKCxhLogxfRuMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rb6j2Ww3ym8N7zSqcGLfOJX6Ufnr7eaNn+HEbQZ4aPU=;
 b=SYBfcVtCOggwMwyqjwDdfrB2abGpZPYT+keWGUg7E3noKm0IepJbUnUqDLv3ZW5iS7Eap9KrC3qMWcvtAxynwB/YsKABsDNwsFA6FT/DrA9Mw0zJ/BvSOj75ysXoFgM+eKXrf1KbtDahk2dUVYx81uJZN1FfMh+e6qc0f4vqHKyY2M8PwqKCqLu4RNa6VE2lMuuXcGM1S3EQ+IO9t9n5zxtYlOiUYmbgVka4TLQsctjWJBhYI4ceWXQYku3JbHZ1cJ8+rgjAn40G6zHnvPwuAmO7H1Zz4iQCCeWdFfUxNIcAVLApfg5CQPvaylp9GFxueMW8A+Pb5RJuSELs7lEAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 14:23:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 14:23:05 +0000
Date: Mon, 6 May 2024 10:23:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <matthew.brost@intel.com>, <francois.dugast@intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Message-ID: <ZjjnxOqHMXT9Ybw6@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-5-rodrigo.vivi@intel.com>
 <e0106194140f1801232744002779b6fa51af6fa4.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0106194140f1801232744002779b6fa51af6fa4.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:303:b9::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3b3813-6bad-4715-1929-08dc6dd80b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Y0PQTAi4wvvwEoaCaB4cgc+aYX9obde7I0d9+aTWbL5LW+oTGVStQF1bRV?=
 =?iso-8859-1?Q?ovSuPQ5mYea3ZeMtKCerIOD92UAPPiiBH0S9NYISMOjhhY7pPCR++sM3PL?=
 =?iso-8859-1?Q?cwXIuIR3HnKcUXNNc3YrFJ7hHRQb8ctNIuQWRbIoXD9maE9TS/MfHixeIU?=
 =?iso-8859-1?Q?WEXh/1TZaO1WRxU6Dy1hNbckRXJPRoTEzQ9J19v5xuOFLKuO+eHHLmLm8k?=
 =?iso-8859-1?Q?qeXuVnSjMCcr3dTsplrs1HOFc2rlIYU0KibTUDw7uRl1nZPbIl5QHbFvlG?=
 =?iso-8859-1?Q?l5lMT/6qDZtfGYVc6AfnYQFgLUGsveI9bb2SbayRjr8mxfG4IEa8FLuKE6?=
 =?iso-8859-1?Q?IPzEVP2odXNDyWQtEiJUDu8malGHqy6pT9fr6p0pMe9i6xmD/xD5Bb/KvG?=
 =?iso-8859-1?Q?E5E6jTKwbmpsi5ldEtjus/INNKULLVwcSn7ADGzWaveacgyVsuYA2PKG9O?=
 =?iso-8859-1?Q?HWZl7gMxs64/7zHeeHCbxz+VZ/p+8rZabgsEVjeAXRR8xeZjGDaNrW4k4b?=
 =?iso-8859-1?Q?HH+iWI/EYhoa2B2oxiY70kNKh6arGiz6brxE1W1Q0stZD9SMfZFULPlifV?=
 =?iso-8859-1?Q?dZGb2KUEgYJtW6lS2moxFhRbWLoJwfryZlgD4GNdUQ9gj3O25FjR0lR149?=
 =?iso-8859-1?Q?wRJh9ca/4F6y0oDylZnDlglqO4/I7kYhUcPNljBL0inDU6DLoVLs60hHdU?=
 =?iso-8859-1?Q?jgPAeS/FCCN7BWW5rWEWmGKiTEG7T1vyGOCFzOn0gz62zHzr57XJKU7S1r?=
 =?iso-8859-1?Q?8YcQl7pasw/dbaTXeyZ1Ik5rYsELUUVpAuyEqGjVSM6FY0Akc4KrMzlyMN?=
 =?iso-8859-1?Q?nYJrQugPT9q+Fj1rkOSJew8ZHHrMqmMgnPwZa2781rfPQQGUmJizI4Jswy?=
 =?iso-8859-1?Q?zkGImmZEOM+vp0N8XF37PwDiUThUblx3baxoVm3SVbmyAxVXF5bJvRscLM?=
 =?iso-8859-1?Q?dDqrUvRxuqHc0kKf85hjLnb7mr9F/IYr006/rb/ptTS3GzvMz3mxxOXJ9A?=
 =?iso-8859-1?Q?CxRUdjx+sZLBUjcNU39zrv9ZkkLYBCyxHhvx8CE3h9VzC4fjnYYiyyWZoS?=
 =?iso-8859-1?Q?cQNR6FkOk/IEigJ0s3vYgtHQyVdl0Y2SF8981lk9GYArPxX4Tffvu1Radd?=
 =?iso-8859-1?Q?dyfkmZQQhPv/yzT1Mn/Ts8KKwBqVaXKEcZ96UDcq+F5nrkXnqRY6vZG7Io?=
 =?iso-8859-1?Q?t47ILucWtsTd5KdhBuaTbSt8iqNXBJMfah6TETtKnT9JDthrQHdUaRryw8?=
 =?iso-8859-1?Q?YLXHHwjmuR0L85LdHaQwMBhR9q9tg8cS1/FUmc5tRWWWQqz/8KuCcD7SPh?=
 =?iso-8859-1?Q?Z0+N7KmIMa0sRZvPiV2eP2uliA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LqlyUoXeCld1S68nEzvgAUkZ2npmZEh6krMtQG0xYqnBNVqjEo1exZbCbB?=
 =?iso-8859-1?Q?XDaUsUKGrj0NYuw2v3ibPnlHxevraL6IEzUHW5cCNy6spUnGztW6Udbpsk?=
 =?iso-8859-1?Q?vOudlN/tJIX0siIKEgjWi787/fxQf96q4CNaRQupN+dLAQZlKqz/D+52DD?=
 =?iso-8859-1?Q?mQER4DPQzDBTjdYG4Xe9KjuaGAP65vrSB8BYvkNPcXgcVggAS08pMyqjLB?=
 =?iso-8859-1?Q?8ZWX/YXBarw4qhxNCcUSVlwthNXy25U9FfGoZYXu+IBrr3BF4hPqbY7noS?=
 =?iso-8859-1?Q?jiMaJyN3yyvf2VL381iARj7Krh0djMhDJ4Db+w89gXlfOfhcL9HpkFgtfP?=
 =?iso-8859-1?Q?hxn+9B5pkf/GMa9/T+MExPbJ8JgaUxISFDzlN0MvQP8seBJ11X+3ciLTxO?=
 =?iso-8859-1?Q?VS8rw0oRefjZYa8CbtbfujB2+WAIHdwocNe1qGoQV/6rEhV6vSOJB2RYao?=
 =?iso-8859-1?Q?0uV/fr2soDWuvUAkUnfwB38L2GLmgsFD3v+i3uuU1kzhl2hnjs+/gApM7o?=
 =?iso-8859-1?Q?+yofffjlfv8n5CAbqxJrAiB39e4WJeMZYp0KnXFfqnMXatnBVXHBB3twqL?=
 =?iso-8859-1?Q?In8RG2VwgvAsrUYQBvrSy0x3aZfIspZ54i67pArL6Ek3ggyDc86KsUzl0h?=
 =?iso-8859-1?Q?Ot/1W+yBUqqrHmz8Zw9kxIlthdaV8PRpuc8abmbY88pWlGcPl5Wsfmm3Sb?=
 =?iso-8859-1?Q?BZGtdLVZi5XVXB4Y2fnWq3PlQBM54r0UAALBaDimx7S7FZKD5mLABgx3DI?=
 =?iso-8859-1?Q?R8e99tzZ8NsVbyZWu7nnhV26ysyDa1/MQdlBjU0TRuOZi7gSIGwbnIwV7I?=
 =?iso-8859-1?Q?HYJo5i18sCYAEZUzTtqP07vTERdRKNl12WUu1KtzBVcFBVkkMe13BV4DcB?=
 =?iso-8859-1?Q?DC6a5pfVMoo0AuektGNc7Yje9KCzFeBQSI1jt4XLEGAVQbe5OSUxy5tzD1?=
 =?iso-8859-1?Q?7eauKVSN2N1g4mnBZXWqMSYjy5gKps/8gn125uamjrj9MdeL0hug5P7b4I?=
 =?iso-8859-1?Q?k9S8pC+p+9oyNQfH5QidbFri6oneYLrEY6HhCreDQR9Dg+hm+x+UWhpiVT?=
 =?iso-8859-1?Q?EdOgvGvSDVRNcp08BwiVME4ph6ZLspkgGkLMAglfCB0N9cYcM5ZKwwhuM1?=
 =?iso-8859-1?Q?NB/GaH+1aVHzFaTsDPCPFaEaQ55xmVQWkFIx8v63zjbv1oL7kvs6jTWNqN?=
 =?iso-8859-1?Q?NGMgNo7n1ntouSAWob6/Ik7UbV7z51/XSJmvkoMzP3h+RGYwzWBM5rTG7a?=
 =?iso-8859-1?Q?vJzgnaKkY4ZZNt1eX7noI+QGgn1XWoEiXBYILnG8gmvjkM29KK5NA7FgG8?=
 =?iso-8859-1?Q?xlYj/Xrk6CWyrDm1R1aZA3UpV/6r6w3XnB995263Rn0t61GPKexvVX8qiC?=
 =?iso-8859-1?Q?hdSFAdhLZT44e8iYOsuNCRVr8JxlmmArq9YfvKe3OfI+pFE62loWPGvcmR?=
 =?iso-8859-1?Q?FFFRYLvM6Rn6UxI3s0N3Li1Xy48f1AcT7yX1r1xpoU/qoqcrhMQToRUnsh?=
 =?iso-8859-1?Q?aSqjdo5WcERVk6kgp6Nemy4RhEQ5DXSS1+gdbH7msWUXjasmddiFrS7ThM?=
 =?iso-8859-1?Q?qzQPuxnaJL8+n6+j9NLtwYd4cz2fJKnqba9AhSvLar2hCrqmir1dKekaJx?=
 =?iso-8859-1?Q?OUSj11gjMz9bZgIHNGRzCjn2X6GOFuPDSn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3b3813-6bad-4715-1929-08dc6dd80b7b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 14:23:05.5278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTngZMeNCLQ6fwXMwS+TjTbqIn0H/qvIezaaNT6nP0HeVKCQwUtUm7GiFLqOcUZNks3+exnZ+7ehEN4dZhSF0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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

On Mon, May 06, 2024 at 02:30:03PM +0200, Thomas Hellström wrote:
> Hi, Rodrigo.
> 
> On Fri, 2024-05-03 at 15:13 -0400, Rodrigo Vivi wrote:
> > In the regular use case scenario, user space will create a
> > VM, and keep it alive for the entire duration of its workload.
> > 
> > For the regular desktop cases, it means that the VM
> > is alive even on idle scenarios where display goes off. This
> > is unacceptable since this would entirely block runtime PM
> > indefinitely, blocking deeper Package-C state. This would be
> > a waste drainage of power.
> > 
> > So, let's limit the protection only for the long running workloads,
> > which memory might be mapped and accessed during this entire
> > workload.
> > 
> > This indeed opens up a risk of use case without display, and
> > without long-running workload, where memory might be mapped
> > and accessed with direct read and write operations without
> > any gpu execution involved. Because of this, we are also
> > adding here, the extra protection for the special vm_op access
> > callback.
> 
> A couple of ignorant questions:
> 
> Why aren't the runtime_pm get / put in xe_sched_job_create() /
> destroy() sufficient also for LR vms? If not, could the vm deactivation
> / reactivation be used for this (see xe_vm_reactivate_rebind)

Yes, in general we should be already protected by the sched or in
the compute exported cases by the dma_buf...

But I was afraid to end up in some corner cases of non-display
compute scenarios where mapped memory would be accessed without
any protection.

Then it was also a request from Matt in some old reviews.

Matt, thoughts?

> 
> > 
> > In the ideal case of the mmapped scenario of vm_ops, we would
> > also get references in the 'open' and 'mmap' callbacks, and
> > put it back on the 'close' callback, for a balanced case.
> > However, this would also block the regular desktop case, so
> > we are not doing this.
> 
> I'm not completely following here. We have xe_runtime_pm_get() in the
> fault handler + some form of delayed xe_runtime_pm_put(). Does this say
> we ideally should replace that with open + mmap / close? 

Exactly! Ideally yes, but we cannot do this or this entirely kill the
PC10 and D3Cold in regular desktop case. Because compositors keep all
the mmaped buffers alive even when display goes off in idle scenarios.

> 
> Thanks,
> Thomas
> 
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_vm.c |  6 +++---
> >  2 files changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 52a16cb4e736..48eca9f2651a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1157,11 +1157,26 @@ static vm_fault_t xe_gem_fault(struct
> > vm_fault *vmf)
> >  	return ret;
> >  }
> >  
> > +static int xe_vm_access(struct vm_area_struct *vma, unsigned long
> > addr,
> > +			void *buf, int len, int write)
> > +{
> > +	struct ttm_buffer_object *tbo = vma->vm_private_data;
> > +	struct drm_device *ddev = tbo->base.dev;
> > +	struct xe_device *xe = to_xe_device(ddev);
> > +	int ret;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +
> >  static const struct vm_operations_struct xe_gem_vm_ops = {
> >  	.fault = xe_gem_fault,
> >  	.open = ttm_bo_vm_open,
> >  	.close = ttm_bo_vm_close,
> > -	.access = ttm_bo_vm_access
> > +	.access = xe_vm_access
> >  };
> >  
> >  static const struct drm_gem_object_funcs xe_gem_object_funcs = {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index dfd31b346021..aa298b768620 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1347,7 +1347,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> >  
> >  	vm->pt_ops = &xelp_pt_ops;
> >  
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > +	if (flags & XE_VM_FLAG_LR_MODE)
> >  		xe_pm_runtime_get_noresume(xe);
> >  
> >  	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> > @@ -1457,7 +1457,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> >  	for_each_tile(tile, xe, id)
> >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> >  	kfree(vm);
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > +	if (flags & XE_VM_FLAG_LR_MODE)
> >  		xe_pm_runtime_put(xe);
> >  	return ERR_PTR(err);
> >  }
> > @@ -1592,7 +1592,7 @@ static void vm_destroy_work_func(struct
> > work_struct *w)
> >  
> >  	mutex_destroy(&vm->snap_mutex);
> >  
> > -	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> > +	if (vm->flags & XE_VM_FLAG_LR_MODE)
> >  		xe_pm_runtime_put(xe);
> >  
> >  	for_each_tile(tile, xe, id)
> 
