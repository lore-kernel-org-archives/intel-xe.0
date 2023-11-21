Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85C9C61D90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 17:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0AD10E553;
	Tue, 21 Nov 2023 17:56:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867B310E553
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 17:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700589410; x=1732125410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TckjRXDXH7WGQmTIxHWa9wGB6ExeJKDKshTvf+PCO3s=;
 b=WynhB4gLuuxhQTUJrX8hinEzCrl5g0g5poYZTC4J0iBsIY55n0gAulDN
 80xQ88cUdOgZlEIg9XpeVwVA+jtzIXLS6N+l5rac90p80oJoUNgKYuV5B
 aSg+1n89vk2WWz6L453m9Hiexu6A5fm0ZMjfnUP1fc1humRxoA6vYbMik
 U89Thld1BoByaSrRxe5B3ou3A91yS0A7qU2KPOP5KzVDOj0OTA3fyMQHm
 EE05mdq/AHRVtAD6bazKIT8fZ2TLFAL/ggAuAOc0e1DLeZ11qu5gvHfh2
 5q+G3fCGwQ5Re4igEnNPR3plUT4v3WumOfJ7lXrFQdZMm2mQ47WOf0W/t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382289997"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="382289997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 09:56:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="8165316"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 09:56:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 09:56:48 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 09:56:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 09:56:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLWzg4UdRN3Mm5JISu4LpF/q+H0IU3aW62AsOOKUH1mppS+d+ZVilu5Suzy5dPUw04I5/dnpZQ9tqCEUtnYRqqlR++DfpZFG3Ez2ZDWxOTcNjQ9QaSc7TrQxbPJSNNwpHYDeUdFRNHztGD284C/3BXfKpm6+N5TRUA1dY3fWvIK7NBl9UAyJ4WCef0JqsCmVoM9FlKzlmZ9o7sZ/u8Q6sTj+i+frJGF24zwVsdnMkoE4a+/TVYj2cl5abV+rMD5y+vHigno5rfZ7KvOmlIcSMteaHceXMlhfzQH/Qz+mGTPr71ZLq0bxFiznEZdnQSpkGb+E8Tr7yA0oGOOeUAsOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3YO6Ccca69DzHy3PYLYM2E/MVL7R+KkFRvhnCKXvXU=;
 b=UPisSdXQQ7wc0h7u3Va/4ZhhmNtd82kSgDlTSFhUowJJnyDpQ3v36I985xN9IQEWDZge/KZUFRJ8Y4A4t4X9QFXugxaPihAmZkrSWrcPRlmW7maE4s0I8KsD910M54VX1UCzUQvYCarukIRwIkmr5MSzV59yJFQO/S/sp3PMmP10zBmgyDTpzIkJYycDS/3OoZ/2LFTOqPnL5yqA8V1k07bAXfrAD/ur7eUZFQZUxHMBjz74vQar8yDbX+/9t44vJ50Bsvya8mJJEvCYJjtILm1GZj/vKa8AHPnxyAerD1N/fF8/CURyx0mYpwjUX2ZoqOfXuL7DUMclwYmhZaGmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 17:56:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 17:56:45 +0000
Date: Tue, 21 Nov 2023 11:56:43 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <76inxmda5sbci7ivtmjy7eekc33z7lz4wf2gj5l6oqocuhn2dl@u5qu6tgdmgud>
References: <20231121040852.462742-1-ashutosh.dixit@intel.com>
 <wichc7yv6jjcm7wzlaahiyibofobqswq34j23hdz23dksmdnfq@ztxrjuqewk7k>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <wichc7yv6jjcm7wzlaahiyibofobqswq34j23hdz23dksmdnfq@ztxrjuqewk7k>
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 986f4358-f04e-449c-c16d-08dbeabb39d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2EttilAwTr7jeuEfndsWxvu6aDCNVQLB4r/BSz7k16WxCEKJLxJ2XZaxTdLv8wXzV0z6s8+igrh7ryd3Vi2EXeDVUQRfNtItGQxY3tBf7a8C5ljyLf1n65+uWU0J74+1Jw+prE1dql1hg5rDeIJFtdCnv167iMmYrLGiyqjoJHrqDZ5CPSRwQqQgHbrHEB3B6emHSX0mLlrsqiuyCduCigaWj1nMJdfqFZWLwCslG0i6hU9cXcOIiJdHykBKlMirRo0ulNhBumvV5IOAt0h+W9bpylNGxCE2mSszjBfjHgy1hGLAN/n4G/9/PFbaevOCbezemgLLmhStb8TtlZ9Epzh3PjrzPkeHeZ1R8IUctmvviGhBuxhQtiY5chAReeNFVZlYw30m3GV6lxd+h7b/dBAlOsbQ06+eqk6BQgXuZfgTYevARIDG8hIElXNmgWpSeYgup+MD34ygnb+EXAO1wQzwKaoYuPpIRjLRKFizmfrdytEjbqhhM3znCasFjz3R+URdxCaRvk0WYpqV4DPGM0O8GsTM8tq4eEgsBVk6egrf8jJUSeJLK8wQ+mY55++
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(107886003)(6512007)(26005)(9686003)(33716001)(41300700001)(6862004)(4326008)(8676002)(8936002)(38100700002)(5660300002)(2906002)(478600001)(6636002)(6486002)(66946007)(6506007)(66476007)(54906003)(66556008)(316002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQJFzOoYIinw6mAke0DRok7Ul2zAh3QRAqc+lTvj37EC6XGI0sGcsnrt9Gsr?=
 =?us-ascii?Q?t/V2asfhX1yTrd4JCWZIGTRz6Tl0iN8Tg7ljgmd5HYSWk+RCWFzQtoDuGtsc?=
 =?us-ascii?Q?Lpa/Ced/KC0udQW0oJ6a8D8sAewwyU9xD5NJdza2jeaQk8Wy2A+ibRv6tr/z?=
 =?us-ascii?Q?4o05yVsOjFKtYkSHvX8bTzBdhwo2wT4YfoFJcVmYCeAlo12P+fi7RoXasCOt?=
 =?us-ascii?Q?FtDdkixmfeDTJlBYeaH/kpo0iuaPaRRh/4iMf5gz9tng6PZWD1YL+IlsPai2?=
 =?us-ascii?Q?z8R1YUiQwff22Qh3YpJk/Aq8PayalVXbE7i1lrUsig30Aq6iSINTaTe2g2Yn?=
 =?us-ascii?Q?1MNeoOG/vfP2QeOo/i/C+EGzXiZ+z6jX+YA6dK8GRbu4+P9G9WWsSGa+cDZp?=
 =?us-ascii?Q?VTv0vzmo1aJ8XEMhDasqhw8kxjewKTmzHpHx366k6KV3CkQlEJc2ZUmRphjq?=
 =?us-ascii?Q?Snn8RkYwsYLSAUuT1V9tj/QIBX7JwkUIaGM7UYsgqOeCuRwWhhPOsJBRJiUK?=
 =?us-ascii?Q?YqPTcXbSareooaWFkzM53DXIDmuYTW7TMzCvw48XddWPL0Nffn/V1cvmfUAQ?=
 =?us-ascii?Q?aYDOVJgffrXDR3/YTR68PtYNgu/1YXdWvVDc+59Fjsa5xR6u4yKobwVmL2vC?=
 =?us-ascii?Q?BOfAiM19zZkCOQ3VG2fqxEpE0etIXqs7wvigLJufgmlC4j9HyGKd3VshtHrY?=
 =?us-ascii?Q?bp8Zoz1x4p5JURb1yp46uIIiadyJ+RFhd2chmKPzqu0sHGIuEt3D9TwjGaFj?=
 =?us-ascii?Q?hRsrJe2QdhhbwgaOSednDBdUMCrhPhWmUbg6k2t4IbW4TlLQijQvSZThOIT4?=
 =?us-ascii?Q?rHaVwX9gNrqFE3rY40hhU+BJ3FjmQAs4dUp4AMpIemZUBvH4xKjq2VcNrt2u?=
 =?us-ascii?Q?Pw7lAg86DJpFIQensYiUdOtv8gkkwKE3wLy1JHsSo4hnSqimq9Q9TSynWbwa?=
 =?us-ascii?Q?5d/j8UlI7zd7vkjnwbwjpVY+gFLHKhy8lwrxDwjyZWdvwZKaVssqqeieFBm3?=
 =?us-ascii?Q?HACvvDd3sOtlYPZ3SXuDLYHYwqBFcki2u3Ynp8ylAvcY+5Aw4+shiKbtTajW?=
 =?us-ascii?Q?UCTSmzpQkJGCz37aKgQDX3QMBT4CWbWp4r48aMzzW1qX8CedxeqbOqL+tgDY?=
 =?us-ascii?Q?0qb9y59MgFnwtxsW0n+rnNxbdEn6TR1+Q5Iup4BqbZ39TE5iETERrvCUkUaI?=
 =?us-ascii?Q?y9OHgGl0mqOq4Yl2lyGhMA+cUqGGhxRUVpz15biBnBHRQfSjMwsfYfX2T7m4?=
 =?us-ascii?Q?cTEMPEwRUg/PQZ063HE+pPGQOAU5RYnuVCLHy/ShOrjwy4O9s0rZ2M+4pybI?=
 =?us-ascii?Q?6WDgA/TpQin1uVwxrQGbYBJebwZhWsZwd97KhyXp2amRgnkE7C5UqPvdfuoW?=
 =?us-ascii?Q?KdEqVP17YLZ5yG8qxB7Ksfds9IWYzZ3mBxudeFXRO0XLixUxwKdl+28HtVee?=
 =?us-ascii?Q?G/TQNn3w0gqGh5OUJQ1RN8Ieq9phm1w7lnFCf1pdwUOQtibIFmdXyihzKsvo?=
 =?us-ascii?Q?fGzDaBkz0SXrO4NYDoKg2b4rD9dYysJQEwSLx+jXRJPiiJj8/11a/Je04WJs?=
 =?us-ascii?Q?RwAXlGudsAZtQD+VWdFp6SrhpSOj+qF6sBTN57kdve/h6csMSLADd3zTkFhJ?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 986f4358-f04e-449c-c16d-08dbeabb39d2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 17:56:45.4573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6bJJC06qo3Dgrv1QEMTy52RNDCXumiu9Uc4VgZ2k0EJ19F89MbVTpybh2c/lUGHkNh43pKGjkokYGHhTwjyDmg6RVpBC21B8wQGTvTpEhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Moving and renaming existing
 frequency sysfs attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 11:45:04AM -0600, Lucas De Marchi wrote:
>On Mon, Nov 20, 2023 at 08:08:52PM -0800, Ashutosh Dixit wrote:
>>Actually: Revert "drm/xe: Moving and renaming existing frequency sysfs attributes"
>>
>>This reverts commit c2785fa716b862203a640564a849377d4d8470f5.
>>
>>The commit is badly broken. Allow the author to fix and resubmit.
>>
>>$ cat /sys/class/drm/card0/device/tile0/gt0/freq/min_freq
>>Segmentation fault
>>
>>In dmesg:
>>
>>[  786.327812] general protection fault, probably for non-canonical address 0xcccccccccccccccc: 0000 [#3] PREEMPT SMP NOPTI
>>[  786.327840] CPU: 13 PID: 2267 Comm: cat Tainted: G      D    O       6.6.0-rc3+ #15
>>[  786.327853] Hardware name: Intel Corporation Raptor Lake Client Platform/RaptorLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4221.A00.2305271351 05/27/2023
>>[  786.327868] RIP: 0010:min_freq_show+0x15/0x120 [xe]
>>[  786.327973] RSP: 0018:ffffc9000481fdb8 EFLAGS: 00010282
>>[  786.327984] RAX: ffffffffa017aee0 RBX: cccccccccccccccc RCX: 0000000000000000
>>[  786.327994] RDX: ffff888147209000 RSI: ffffffffa02c3da0 RDI: ffff888103f2af40
>>[  786.328003] RBP: ffff888147209000 R08: 0000000000000001 R09: 0000000000000000
>>[  786.328013] R10: ffffc9000481fdf0 R11: ffffffff8147d0e2 R12: ffff888103f2af40
>>[  786.328022] R13: ffff888108df6800 R14: ffff88813d668e48 R15: 0000000000000001
>>[  786.328031] FS:  00007f8a5a4db740(0000) GS:ffff88906f880000(0000) knlGS:0000000000000000
>>[  786.328043] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>[  786.328051] CR2: 00007f8a5a462000 CR3: 000000013d85c000 CR4: 0000000000f50ee0
>>[  786.328061] PKRU: 55555554
>>[  786.328066] Call Trace:
>>[  786.328072]  <TASK>
>>[  786.328077]  ? die_addr+0x32/0x90
>>[  786.328090]  ? exc_general_protection+0x1a5/0x3f0
>>[  786.328104]  ? asm_exc_general_protection+0x26/0x30
>>[  786.328118]  ? kernfs_seq_start+0x22/0x110
>>[  786.328130]  ? __pfx_min_freq_show+0x10/0x10 [xe]
>>[  786.328189]  ? min_freq_show+0x15/0x120 [xe]
>>[  786.328241]  sysfs_kf_seq_show+0xb5/0x100
>>[  786.328252]  seq_read_iter+0x111/0x4c0
>>[  786.328264]  vfs_read+0x1c7/0x330
>>[  786.328276]  ksys_read+0x64/0xe0
>>[  786.328285]  do_syscall_64+0x3c/0x90
>>[  786.328293]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>do we also need to revert anything in igt?

answering my own question... From igt, tests/intel/xe_guc_pc.c,
functions get_freq() and set_freq(), it seems  it never got the rename.
I don't see anything pending in the igt mailing list neither.

Let's revert and try to merge both close together next time.

Applied to drm-xe-next, thanks.

Lucas De Marchi

>
>Lucas De Marchi
