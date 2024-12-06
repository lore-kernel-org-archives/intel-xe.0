Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD81E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 15:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B485810E3FD;
	Fri,  6 Dec 2024 15:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0dGWZYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A6510E3FD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733500448; x=1765036448;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nGO9bLL1Fy7LONGHRNyzjeh5HE0ylkCscQwFWAYq+AI=;
 b=B0dGWZYajI6dUAAdvfVm1dsfT2fNJDpFVR2HZeIxFhgwe/gTIWyeKR0R
 QcARRb1zvVOF2dYxiEUovA88k4x7Uxq4+d3HSsz06LXne5uQPIk23FwFe
 Lu3WISHkH9zCPbQlrmPBYREKrVhCbF95JY8xDZjyEeBPKBCbX0+jGqYtl
 DltQaPP6yPkpKgswyInfJjWaVYv0HRYB6LcxHCGIhP2qAeeQGnR3u5+se
 ydth68QRXLamVGxuJjmMFOG8K10Ai1wzXOm8WlbaXzK7KfOWG6vlGkfXc
 KB/t09fZgqYPmexoiubPpMYBP+ulzC91VIm/+sWyuQ2uUhmvqesGNQv2u Q==;
X-CSE-ConnectionGUID: LnlENHbkQDeywdjyys9oTA==
X-CSE-MsgGUID: YZJ3jNlzRvS7rMmHuinMiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="21448424"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="21448424"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 07:54:08 -0800
X-CSE-ConnectionGUID: LznGxRANSwCFC/n3zNUnPw==
X-CSE-MsgGUID: 7ILPVfFoRMizZPsGg2J1Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="125344131"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 07:54:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 07:54:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 07:54:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 07:54:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVF82FTxCdK2JU5h9JmMBlfLXbTZviO7tZRulg1A8IESQUcwOGj8vuiQHu7s13PamghC1uw1mMOPUXwKvgsRc0HiJSZQykR/k/+oWYrG+d7Ut4pdeQTomJyQ5C6udAA++mVUdzRBUxs0ZW1f12wo5wNBpvQJnsHv5f1kowdJqizdrgONZwfXG8zsGy3HfRFxbNUPQTCtgwy8HYIGzoCzcpNGJmLH+sYxu+evgo6RdmR2Ihu3rtbgAeCIJfcvs3XptaL/ZoElXQndqeTwoDCtbsjbFCnpqLrrJxr9SdjeVLe9hgnWuWsr86+aH5PCrFu0NAlpuKwR7F5lmIIOOGJa2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aQn36V9VynE5rXeIItnFYy8zc9uEb77tptjKpPggsU=;
 b=T0MuRSDIQvNdMM9PyvMcaxJStRCIuxCA2wtOy2Ge+jOHAX8eU8+ZJDXEw/aPfxKnR+ismjg3GyBv5q7/XAgCSHR7vKZtf36Zm1Tt+XYX5iqZbycotGxa8JxuJ+VYVyasCmrOiZtYo8h6/vUM0ASY8x8ZaFkCYhzcajxXdO8AX2GnFdsemV9bpDoCf0OpljmxIcLpEjDTS5f+ZGu51MgNAAOaC+Yc3sBJT0bVlR4lA6za+MsSJ1qEwZdQzwpmFN8xqVjJ0/eP12madrHRZYmSBhI82beVI+sK0jaHaNaJoZqiQaJgquh99Nkef1VWfe61K/oBepAU3xJoGrE5VuWYkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Fri, 6 Dec
 2024 15:54:02 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Fri, 6 Dec 2024
 15:54:02 +0000
Date: Fri, 6 Dec 2024 10:53:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Avoid evicting object of the same vm in none
 fault mode
Message-ID: <Z1MeFx6FcpA9qOz3@intel.com>
References: <20241203021929.1919730-1-oak.zeng@intel.com>
 <Z1MOINf2yX2x6jli@intel.com>
 <MN2PR11MB4728D59473D4DFD67330171092312@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR11MB4728D59473D4DFD67330171092312@MN2PR11MB4728.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:303:b6::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: e6453caf-dc5b-40e4-007a-08dd160e34ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?u7k5gfyasAWSGfRrCmOnE2mrFE2GzWp4FdNOt6eiPRU402GGSSSq8/Dmkz?=
 =?iso-8859-1?Q?XN3V9UjFjsTHHfTnJ9Aioii9lgJwoxby+vEtqiGTIJ3b1v5Nlqen08ZsKc?=
 =?iso-8859-1?Q?Y3cTje/ExFk0I8QwMBD3veLSg2eT1/IHujLHw1j6jcEICImKrNF4K7W4at?=
 =?iso-8859-1?Q?9VT2JfZc7l2lINjUHdDd6Bc3ISta3jWINXvPdRl0/DtFuu8k0Zx9JtKUrG?=
 =?iso-8859-1?Q?EmgBzR+1Z1dAzzhNLte5jwZjAetlpt8p0X4c3FnAcLrDVsrAqZyO1buqdD?=
 =?iso-8859-1?Q?MapZMwYCwXuy9YFreJm1AumxoTcn3KxC41iPkrf66puJkjvyH8yvxPgGin?=
 =?iso-8859-1?Q?NpXOLYF0pb2jJclXik/1waDi/cdvRPci35glyjaISUoaBNMrJ7QdQ8rxzr?=
 =?iso-8859-1?Q?Y7p36qrM/yXU/XZr0bWGNawweqFR90EOkAvY/cS/d1xFlBSj6DBC5b4YsG?=
 =?iso-8859-1?Q?BkW2VULYUpiMAZqhBFBTKMFLtZgh3UFjGTwQRDuEerGrWe81jtXQB1QCJX?=
 =?iso-8859-1?Q?poCCLaNuXF7nTjU76vWUBmsEaM5yyZAffFAyMffjAfntb0h9FGUSvWcAwA?=
 =?iso-8859-1?Q?qzcfYWVwtAkHiyeDpTQVmjZU+loP6hbQzGsYvdQ8jpLuGJqTePVRb8rbF8?=
 =?iso-8859-1?Q?KJomTyLKnq4aPhbzCwrg8nLfMONJchJky3oAoZni6Q2Hr5SA8ea3m8uIA4?=
 =?iso-8859-1?Q?e2fonGBTwaxq/ah2RAZQPjCIeFkdj8eCto8D2IOPdNPaMAYyDr4BiuGTvU?=
 =?iso-8859-1?Q?DimuVnXrMheNkH/0rXrAYeI4HXhn66q4xTg/jhkFQnJMOrOHwEc+KIpsMv?=
 =?iso-8859-1?Q?hSUPtQKixIgPYlRHHhU8aIoYOMdaooQjASV+x6jdrzoVJ32zLvf7dRGzF9?=
 =?iso-8859-1?Q?meNC1/8tetFt3uKwxfg3qEgGn5tbpic19vZH6LaeIr5SlvgA4tqahlS6k7?=
 =?iso-8859-1?Q?+PZZUc/TVTNSuLGEYVtd7XIls0aszixhjQk+tjZRoqeAl6KyOHYmWzsQMU?=
 =?iso-8859-1?Q?DnEGh4kvjQOBIZcAgJGrHZpf8wAR3lP2zG5g4bgn7eiWJflk7KhBjElBp7?=
 =?iso-8859-1?Q?lHOce/qqlPdwL1DytG4fF++rLHj0FqlHKfTFIcRX7kwxjtdwtsDrW1zesx?=
 =?iso-8859-1?Q?J4rklc8rxE3F0CNtrbcttd+0k5xjSOqLWzdHtKF/6EhJhANYs360xfb172?=
 =?iso-8859-1?Q?wjQM63/RHZjiitwkCm7anOvtnpWiPbShsO1GbdlPZ76eEE8TtW6PtM00xr?=
 =?iso-8859-1?Q?j/VY+1cEVpWfZ0ZOngYK4lo0/LNsbadQxG66AEqlrnt568fQd/r5QqtIs2?=
 =?iso-8859-1?Q?NZvLLme0bF4qb7hNiOJ0S/2quJDvyzklzWfQSkNDQSHoq1v0QhLbk4+ecd?=
 =?iso-8859-1?Q?ZsczFX7rWX+jEA++7/gZnV/1Mmho3S0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wgF7F1MfHbjJSTvt4vSMmVofsNJRcCI3j53RsJqLcSO8pPG7RPMpGdIc44?=
 =?iso-8859-1?Q?Rvm3A2eaqBq6Wg+fuNU6hqldy83n/6U1o0ckpHZLStEavbnMZr7lEGCHVp?=
 =?iso-8859-1?Q?xvxx00v1qaJMO1LM6AQKYbZ2NB6PbvBuoL+3Y4qh4G5200qzkhVV/jY9pp?=
 =?iso-8859-1?Q?j3GqC0krpF4+GXcpJIqML5Nqq7CePL5KwL0euYULTCd27riT6GGde8L27q?=
 =?iso-8859-1?Q?zRFkSCglSJJT+Aw3zM9NBFdpfv0nG+1MfoQJun6lsnAnJaKtTNBRahM7kG?=
 =?iso-8859-1?Q?DMaloe8WLMsW5ZTL3jRg4g1JEPJC6QMIU9Ndge3nTJ7dNskdHX6C6JgDMB?=
 =?iso-8859-1?Q?uAmcUsZzj3vahNeUhLPMG0kVRT4vtLovnvdcE57hti/xwAZzLhpIUD6KXr?=
 =?iso-8859-1?Q?6ocdUY5YHR8O45MiScukUjjq9mogPyJYXND7liqNO0bwXVn4xyYjsu6/Oh?=
 =?iso-8859-1?Q?6k+CMmvZDYqym5UEokvp8y0HStYN7diMHXVFnpFIcg7U31FiO0NNHW24nz?=
 =?iso-8859-1?Q?KUwfuCdrKX/bMZVmSDcEtASHLVCbAq13jxJsiMzyOEW4qsCVhb2VngNYJu?=
 =?iso-8859-1?Q?YCBh5PPrve70BvBCgqmMzLkZaH8ySDG825BKXUPGw/xfeOKrTVMMU596L4?=
 =?iso-8859-1?Q?D4rFiqcbDxUh1IbBjZ725NGBxMPS52jHJYOMzmInihM0r9m/+xF5RwaN0E?=
 =?iso-8859-1?Q?zbE3AymxEgHyMJzfyNNfndyqc13d2HFB0IQI8cEHqd+9Q0h8m130/tzq4v?=
 =?iso-8859-1?Q?jQmOlYN0MSsdKO026zB2mLfKJvmqzEXC9U5fwgHfgY4RHzYJYMqJRY1gHu?=
 =?iso-8859-1?Q?MmGfhhbs5wytfau5OJdB47xuz+nC8KsVxYA03/XHWFD2iZdDXvpViLUCUp?=
 =?iso-8859-1?Q?60IyIGzUxWymRRqPi0O0mVB5t6RiXoQRvsfQzYzdjZsovUftxKBqqz80AP?=
 =?iso-8859-1?Q?Nf/FjQUcr5YVK/ohFIJyjDaygZGxLGV60Yopb6CARm4VLcReNagCWuY3qZ?=
 =?iso-8859-1?Q?MSDwWkZITVWmXDuMzXUic+LeKMg6l2vmbe46UjYLBNYCFwSgQb+NuFRx4H?=
 =?iso-8859-1?Q?+zafGLDUOmoeDNQJGYDmqOz6fesYVXW07BX9tIIrXSLYjqYMA8XVbtW6xL?=
 =?iso-8859-1?Q?LvcJBRyaSjDc1IfAsqSP1JBqgY7PEgoEuVYeNcxABuplNPayyI9uKISSsB?=
 =?iso-8859-1?Q?ua1usQtGnCZtvjeFBBBk/AQNJ+Q34KNJ8YN9QI9pji19Wd5BctqXcuzHYX?=
 =?iso-8859-1?Q?WJStM3nu4K21IoxfhHn+f3QmTpG2rTB40t9eS0/RLyUjd/TrjMtxo7khih?=
 =?iso-8859-1?Q?92h/YNRlvSneSKf1uoXMhPXxsTPVweMeyYffTX4y04Lbm9SIAMxS3337sp?=
 =?iso-8859-1?Q?K4HZXrKZWZpFokt+JIxQtywXTcJanwoAkxAK+AABMqRlrJwkicQJ5d/ly5?=
 =?iso-8859-1?Q?puCJ7lHiQMPeJf8gOMR/6ueSmPbQXessfkYt8ZYHx2Lkla1OAebenyFUUT?=
 =?iso-8859-1?Q?rVI/BCS1F8BxK2xIF4rCRMxnFCKHziAKxs+20jpfXSQ7HfA1F5JTc1k71/?=
 =?iso-8859-1?Q?eHqYi4SeLrUsICPXX/KgmX2lvY03qbJGPgKOeDUBT8H91j/goAyn1npMs0?=
 =?iso-8859-1?Q?2L8gaud6/aAqzW7uTOybIotdG4o/snHi/rq+gzKkOLfuVTPF5jwxjpAg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6453caf-dc5b-40e4-007a-08dd160e34ba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 15:54:02.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLCkZQnmvX+sSsHCWtNovg9izUBUoSLh+NKrbYWotlvbvnU3Mpm9h6eLIpcJB0JHww+K2+7aGwsqXa5DEHIVvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
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

On Fri, Dec 06, 2024 at 03:19:30PM +0000, Zeng, Oak wrote:
> Hi Rodrigo,
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: December 6, 2024 9:46 AM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org;
> > Thomas.Hellstrom@linux.intel.com
> > Subject: Re: [PATCH] drm/xe: Avoid evicting object of the same vm in
> > none fault mode
> > 
> > On Mon, Dec 02, 2024 at 09:19:29PM -0500, Oak Zeng wrote:
> > > BO validation during vm_bind could trigger memory eviction when
> > > system runs under memory pressure. Right now we blindly evict
> > > BOs of all VMs. This scheme has a problem when system runs in
> > > none recoverable page fault mode: even though the vm_bind could
> > > be successful by evicting BOs, the later the rebinding of the
> > > evicted BOs would fail. So it is better to report an out-of-
> > > memory failure at vm_bind time than at time of rebinding where
> > > xekmd currently doesn't have a good mechanism to report error
> > > to user space.
> > >
> > > This patch implemented a scheme to only evict objects of other
> > > VMs during vm_bind time. Object of the same VM will skip eviction.
> > > If we failed to find enough memory for vm_bind, we report error
> > > to user space at vm_bind time.
> > >
> > > This scheme is not needed for recoverable page fault mode under
> > > what we can dynamically fault-in pages on demand.
> > >
> > > v1: Use xe_vm_in_preempt_fence_mode instead of stack variable
> > (Thomas)
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Suggested-by: Thomas Hellström
> > <thomas.hellstrom@linux.intel.com>
> > > Reviewed-by: Thomas Hellström
> > <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 2492750505d69..016fedae5d554 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2359,13 +2359,15 @@ static int vma_lock_and_validate(struct
> > drm_exec *exec, struct xe_vma *vma,
> > >  				 bool validate)
> > >  {
> > >  	struct xe_bo *bo = xe_vma_bo(vma);
> > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > 
> > for single usage like below we should avoid variable declaration,
> > specially in
> > this case where you do have line space left there... then it gets even
> > clear
> > that the only change in the patch is
> > 
> > - true
> > + !xe_vm_in_preempt_fence_mode(vm)
> 
> Are you suggesting to remove above line "+	struct xe_vm *vm = xe_vma_vm(vma);"?
> 
> Vm variable is used twice below, not single.
> 
> If I remove vm variable, then below I should write:
> 
> Xe_bo_validate(bo, xe_vma_vm(vma), !xe_vm_in_preempt_fence_mode(xe_vma_vm(vma)));

although I liked the 3 usages case like Matt Roper was consistently trying to
apply, when looking to this line like this, I do prefer your original version...

Please ignore me... I'm merging this patch as is right now...

Sorry and Thanks


> 
> Is this what you are suggesting?
> 
> Oak
> 
> > 
> > >  	int err = 0;
> > >
> > >  	if (bo) {
> > >  		if (!bo->vm)
> > >  			err = drm_exec_lock_obj(exec, &bo-
> > >ttm.base);
> > >  		if (!err && validate)
> > > -			err = xe_bo_validate(bo, xe_vma_vm(vma),
> > true);
> > > +			err = xe_bo_validate(bo, vm,
> > > +
> > 	     !xe_vm_in_preempt_fence_mode(vm));
> > >  	}
> > >
> > >  	return err;
> > > --
> > > 2.26.3
> > >
