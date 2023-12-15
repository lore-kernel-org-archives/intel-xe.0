Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5616CC4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 21:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DD710EAA7;
	Fri, 15 Dec 2023 21:27:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEF110EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702675667; x=1734211667;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dflmvU6wxxDr4zRiDrdDiInMmusiyAapsmEheopKR2M=;
 b=R66fIZlVdaerZ6qUeydCHo8sgDiTdnT5S5B3INfNapwsf7mKpZPG2jRL
 vOeTT9ZASUjEfvpgm1jBQiBlixEfzphYXMwc4Z1bJwUyk8aWSrO4t5WpG
 N5HJ9PySOBNhPpfVqMNT8bvtMoknCKnIv8KA94f9KE7Aab15kTcsHAn0E
 vHqzd74Nkf29fQWuwcvZqsM5B4HX/AHl8e67GvBhhGkG73SnYRw0C17uF
 GriAt0rJ5eLt/Wc/yxyX2z2wMFsa7ujcXLMWWUjs5gGyHkck86UsjXgfh
 FuFO3hoL2lowqX4TH8Ipnn6tmcoGUXbbCeYYi8tRjnsAL6YO3VchbmRHf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="14014920"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="14014920"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 13:27:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="751069608"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="751069608"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 13:27:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 13:27:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 13:27:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 13:27:46 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 13:27:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxlRz5ua1V8Elc/q39RKyu743Hu5z+sRSSgqWWiw7vx+p52N+2qlRX/fk2Ukk4e9xq5jWBp2InhczyfXKvBjwyGzPgmwDcPZZRWaFeQThVYbClvFym6Ec/N8h7X4ckKlQ8Ls0SDlIHRQP73n6paN1CuVmYwqjaHfY7JqnNBQxVC6tr25EuQR0Zl45FYHa5ijQhtcOXvIx1iyamCPxKjepGfx0PgHzg1MJfmvDBmRX0a3nL+2v8qgeYSf9saHXjfJ1I4xVp0GsIsYs11ANU9kLhZsVLynrvswLvxKuJieLJWXzPy+8WkGQ1p9GBy20aigIutRMROkvvMRF/z4O9eYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKxKwCekW/0A3T1lED8rALywxnDXouSg6WAw4zJIx2E=;
 b=h+bUzsD9lYwdzSYD/PjmysWs3Yc1OFJUji8rsAHnLhpstrGJgVly8w8ZsaIxjiyzrKfwmnpjthnwEb5f2giaikYm7DS4JItefmqhXlpbn527KisYNTDBWx2KJAMs/MEL4W9dyy/N4C9uZBDoFoGAxGv8ihAHToQHNAmGRkTkY++hsERhg1kQutKgCGUjVlYM69n28KWCLvrNBjjqlCFYrzYWnf6rPT70mLn/VLfEQLqKgdq6i/qItzpOPSfZQdr0AQm98BQXURzxcXr0O51vZ8NdsNlV4eZ+yWoa0nK0SaG4YJU0/BdXO9dfcnU2+usPGKQ87knoCrvt1Lng1JNUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 21:27:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 21:27:41 +0000
Date: Fri, 15 Dec 2023 15:27:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN splat in add_preempt_fences()
Message-ID: <t3be4vndhfhtc453ftbv2ru3mqrgg6tpdwksmlipe5mvxhhzhs@ogfrvotddgzq>
References: <20231215211245.718686-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215211245.718686-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 823f580c-d93d-421b-dd7e-08dbfdb4ab4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/Dot12MYBGfmEEgEhFB0wRltwY8f/OwH96xC5Eppeg19lK+gX1wKVvQFvLoYiGF/ySy3mSV0YzDLMyCc4qyRh6TmEBmv1jOpxwuOCxbI9/84PMruRtBVpg0Cpm7jm4fIsqIsvB+A4ASIxW7zRdeSAjvHSCEMsMcrV5yczrLFJPJ5zjvidWJhTcTrGDHNmLzryNKrAhcHpuTnpyn6LCi7uCyrjPmU/lWQPO8tf04jwDI5eH+ek5+mYhFYYu8VqORq5cPtMj2N/4Hpo2Uga785fgC+I9vPS95jULzpHBo+8aZdL4H8pNvxV+u0Z1k1aZEdkKKFHg0xQVMx/EZnNb4oDdnuHK/QiyTppU4bvAJSqFHwWQU6uDN4dJIf9/yI5ndQTBND/5tTnYIMao5Z/AEDeD3tXTmFWYr/NQqPY++u81zLy53ypnkfV4U9I+4eSPpbbAET9Rz/hp06QvLwWsHcMgxjNge5QxUtkDQOP6os+p0a939xV5jk8vGkVUTD1aFWax11sl7xmhLp0jyc402pi23JH1phlyhxOSMLchcQUiyXUEb+1INcbWGQ5QeHKiRoeSb/lXZYNSqCK6dsNse8/4e+PYQimf7SEvYeXZfX5nf5ElMvUbq4+asjJP+sNr6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(26005)(6506007)(9686003)(6512007)(83380400001)(5660300002)(8936002)(41300700001)(2906002)(478600001)(6862004)(8676002)(66946007)(6636002)(66476007)(316002)(4326008)(33716001)(66556008)(6486002)(86362001)(82960400001)(38100700002)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lcr5CSl5qaQuRRQF3JnEe/pPxmn64KSfiM41Z2x4I/KiplsdlrTY0aUQP3Pw?=
 =?us-ascii?Q?4Rex8AV9h7G1dDBnHjaJziccdVnfNvnAyPJHnQafD2F5kRUQyKfu9JR7Dz5u?=
 =?us-ascii?Q?VUNTfQ5lvRab0V/dfxctsLPWFBR/5UaQsdGcCsjZeX0dUbdW0QNfJte3o1i9?=
 =?us-ascii?Q?q+LZZFw1IJ/8AslWMn0lBs8FwcFb0GxbnML93z4lVpVGLiTwircNcSAsoFos?=
 =?us-ascii?Q?D0kXF3w20Kf/x0CwN0rku/gUX4UbmFD2Yqw6XhvUEN55SO51mBdNrEURW9en?=
 =?us-ascii?Q?bZt/S9THQ8RkcL0yJfGa2bQfzCzVIgjsV3C0tHDVNFnqdnACxND7CcXujdhW?=
 =?us-ascii?Q?h++f0tf0xoDW/wMY6kcFoJsrMQJvdyfsvj9GB3swNS14kpf8x1KCigM0LL6S?=
 =?us-ascii?Q?2YCcjtm6uL2ThJwCcoRdzQ0DA6p5FEC4O0L38uTotFIA7JXEnmC4NK6ae8cm?=
 =?us-ascii?Q?c78etX1bZnadF8goKIdYkzyqsLktejh0YPyQhS0dOYG9+N7fyecGjb+2I9r/?=
 =?us-ascii?Q?CJ95jM8NVFSLiqja2ASB80QpDd8OB9z4/rs9CVc2yB+j95/Eut8Ud4LB3iBX?=
 =?us-ascii?Q?qvK7zPiNDGUF9tAnT+g24/mBkEkZj39Xtg5nf9+H3mLZ+JzrqwlbMpkjVe5Z?=
 =?us-ascii?Q?JizKLoV7sN5ayQj+B7R62d+O3UziO6arCbhSlnmOVD58FXJnuVddp8KyV52v?=
 =?us-ascii?Q?nrgLQ67f6K5Psu0SAIaK0BmtGWcOhjYPZQadcx3OLkP890G6YqqCjlyEWai5?=
 =?us-ascii?Q?3nU1EFNSrf+Gr65pQ67gt9kXIt7poAAMjFzaxBt4RsjLHLt2EqVuuEkxWpYq?=
 =?us-ascii?Q?iQmM9FiMYtlq9kM7hZcOksE224HcvtqIkQ4iDA8AKioHcO/i004kwohnhydh?=
 =?us-ascii?Q?rTDtZy0XAotN03/1kxkDBYa+KZldh50Rhwqq9Cq3qEhXAY+bp0Q9UqcJJe0V?=
 =?us-ascii?Q?zx/rTwSxq/JcGcQfcjU1EilH+beFLKzg4RUyqc6dt5Y1tSwXEi7ILiMBqohQ?=
 =?us-ascii?Q?mM8CC2xDbV5tnK6obSXvg3HhmMuSFPVTJYRHBa2j9XoFPDRIbAy+0oMBEH9V?=
 =?us-ascii?Q?J1EwVWMo1+yLANkiIbAlgAsNVDuPWyXvMpTEIC234qKMoukeJeYolETpJ/XO?=
 =?us-ascii?Q?jZcJ6iX7qNVQybh2Q1GSooaYUT1XJV3DckXT8rvhtp6VBRrLY/rXiFASc/7H?=
 =?us-ascii?Q?2JUY46E9zqtw7SIjLCQRtxOzvZ1CI5ezVcPTXV9ldWJelNSdqBfWSZPJN/IN?=
 =?us-ascii?Q?9+mnTzAFkKJy+y/ygkwU8eAVafBUtBPv82UubkuAP1WRMlk+T34aOSdQSpdJ?=
 =?us-ascii?Q?vWs6D5cAdxHuDV55BStnkwNL8WtDxf9jE4qGVrdh6RZeMXZVqFUSpPP41luR?=
 =?us-ascii?Q?prPC4o5DoI+HzFsht3d9dCMComwqgs6SZn3U2roJZDIdaLfiwIYuC5OZju8G?=
 =?us-ascii?Q?960BBAsWBJDtg1kY5tlPx7utRYd6KF7tTlY3D0vlqlPbdRy3nxGwj3aRd3J0?=
 =?us-ascii?Q?FFIdG7qG7bCm2LyqbJzQ72tXOKkU84KrZOJ04HGLtKMU1BmKU7s6Fqv5AH68?=
 =?us-ascii?Q?JMgC9dFiYdVScZ+DfUyRhospMRX93VeA1Ar5w4p7WuJvAejNhHi5aDbT1eYe?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 823f580c-d93d-421b-dd7e-08dbfdb4ab4f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 21:27:41.5085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InwZmP53pW7SOObMk6ImqBfnbMaWTh55XlbMIsBGrfYTdNbFDJiZlgGOXyYQtqJnS7j37s/PIb+F9WJfLXPPo3u1x8MZBpnRbvcwya1oZuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 01:12:45PM -0800, Matthew Brost wrote:
>add_preempt_fences() calls dma_resv_reserve_fences() with num_fences ==
>0 resulting in the below UBSAN splat. Short circuit add_preempt_fences()
>if num_fences == 0.
>
>[   58.652241] ================================================================================
>[   58.660736] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
>[   58.667281] shift exponent 64 is too large for 64-bit type 'long unsigned int'
>[   58.674539] CPU: 2 PID: 1170 Comm: xe_gpgpu_fill Not tainted 6.6.0-rc3-guc+ #630
>[   58.674545] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
>[   58.674547] Call Trace:
>[   58.674548]  <TASK>
>[   58.674550]  dump_stack_lvl+0x92/0xb0
>[   58.674555]  __ubsan_handle_shift_out_of_bounds+0x15a/0x300
>[   58.674559]  ? rcu_is_watching+0x12/0x60
>[   58.674564]  ? software_resume+0x141/0x210
>[   58.674575]  ? new_vma+0x44b/0x600 [xe]
>[   58.674606]  dma_resv_reserve_fences.cold+0x40/0x66
>[   58.674612]  new_vma+0x4b3/0x600 [xe]
>[   58.674638]  xe_vm_bind_ioctl+0xffd/0x1e00 [xe]
>[   58.674663]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>[   58.674680]  drm_ioctl_kernel+0xc1/0x170
>[   58.674686]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>[   58.674703]  drm_ioctl+0x247/0x4c0
>[   58.674709]  ? find_held_lock+0x2b/0x80
>[   58.674716]  __x64_sys_ioctl+0x8c/0xb0
>[   58.674720]  do_syscall_64+0x3c/0x90
>[   58.674723]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>[   58.674727] RIP: 0033:0x7fce4bd1aaff
>[   58.674730] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
>[   58.674731] RSP: 002b:00007ffc57434050 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>[   58.674734] RAX: ffffffffffffffda RBX: 00007ffc574340e0 RCX: 00007fce4bd1aaff
>[   58.674736] RDX: 00007ffc574340e0 RSI: 0000000040886445 RDI: 0000000000000003
>[   58.674737] RBP: 0000000040886445 R08: 0000000000000002 R09: 00007ffc574341b0
>[   58.674739] R10: 000055de43eb3780 R11: 0000000000000246 R12: 00007ffc574340e0
>[   58.674740] R13: 0000000000000003 R14: 00007ffc574341b0 R15: 0000000000000001
>[   58.674747]  </TASK>
>[   58.674748] ================================================================================
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 322c1eccecca..6406370b2625 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -283,6 +283,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
> 	if (err)
> 		return err;
>
>+	if (!vm->preempt.num_exec_queues)
>+		goto out_unlock;

any reason to lock/unlock bo if we are going to return 0 without looking
into the bo?

Lucas De Marchi

>+
> 	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
> 	if (err)
> 		goto out_unlock;
>-- 
>2.34.1
>
