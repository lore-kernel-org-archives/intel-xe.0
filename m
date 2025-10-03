Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282CECAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE83E10E0D1;
	Mon,  6 Oct 2025 14:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLkaWdaR";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BD010E955
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 18:01:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593CUpY2010907
 for <intel-xe@lists.freedesktop.org>; Fri, 3 Oct 2025 18:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8yC/apv2bnE/MtXqJq3gqIyg
 gjfUNfSCjSXyJED4bo4=; b=oLkaWdaRPG38e+K1LVVdziym7vhLYIXvrZxXJTTJ
 7mo627PF7nc51KUteAAeYkCovfl+9A+wTWwNwzmWBcuC364K+GKJ9C/smhZtve8C
 LIoUQz6DK7ilMvgUt2i919pxOHoppr302CaU/Y0oqFBOrtti1R4zHmFW23YKBLIh
 iD6q+IPLVhc4Zli5nGZm+2UwkHJvAQY5rxmzejvKFROx7tX9sfKfsdMFJMTfFgVs
 aTtcS/yNBmOczZUCVIt2vFl/gygx5ti77Ok1xIH4gB/2OVyo6PVWzFUiizdT4wbF
 LzYnem9cAflobQ+Sc7F0KsPkTI2CVhj7PbVHYc3wcd177g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hu8du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Oct 2025 18:01:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-27eeb9730d9so30723995ad.0
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Oct 2025 11:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759514461; x=1760119261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8yC/apv2bnE/MtXqJq3gqIyggjfUNfSCjSXyJED4bo4=;
 b=EOENaj7xrxOdOWHeqJJsTs2sG9IJe+k90GaoWV7aDO9AwgoXN/tsKZ4xsQRIEH9L3z
 6q6Mgrt68wsukNF/MUVjJ32YXvb6aP06aagFJmb4kdadWbbNagL/baMCpgSZ3BHAttML
 uskK//IasiUpuxnnq7RXD4NFZzBs5MAu/KWdbt82bTjMb6ucZCNnujWy3BzKWXbZ5poN
 LoN7YIhK72dVi+MTFcTksezfz13ICAlPR2iUc//u+j8Cs/ka8aaiXkeA83F6DHn6pEVM
 F2GR3NK9X7KngmrE7cNjZFpcQqRFjxNutgEi8zbuwSua5PLQw+RWnfQBP2mwPkunBgdl
 ol9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYy+mcjoD811UOGFP7yIHDWmmZCFW5u6E/1k+wxS+FGwRgr9TX0xmg3vJ7LuTPH+Qkj3WvcaetTQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKgaJxUxxj70G0QBUQoeuFKcvZfgS0euedJn+W+JWL3uj6yoGe
 CpUltN43P/Y5AcMfJcfAHvAsGjOYx+ZBRijuVmW13AjZ5/18t41u7VT0ZBzc9geNuN75KI2cqkM
 IOoBN+i3E2w84O59+Zpi5eTsDgUphx5sbpTrZbg1d7xWNH6lHxpN+4JBsEYZlVoH5D4IDDA==
X-Gm-Gg: ASbGncuZQrCsy+zJQYLV2gZ6pB/UEKQPb+KlC575Fud91kehnrEaUxi7d+pabn8WMwh
 0ie/P0yGyA9nfcLplJUbtSWO0ELpjVORWz+pYfZmY7dWQSHVw2rUIAN2l8S7jw77BY/l8PCJOqn
 rsi1Kha/H5PuMDYvuZyhMp7x6D8Wmx66SYrri990UwSJIpQ0f9VNON1+Pm0lENmRlr3vFdnWbxd
 3RT9spg+f03JNNyUJZWtGFIgKje07pVgDBfY79mJ7/F9PEfUVe4SwMyxEtmHBrv9aTRbnyGZFnG
 +vOA+cXw7efWb/1QIZ8Vf7DjyQsgKgoOQCvPAnbX/Tkv54w3O4HeAQjQo1xPLTggLKqlWFeA
X-Received: by 2002:a17:903:f8b:b0:26b:5346:5857 with SMTP id
 d9443c01a7336-28e9a5a8788mr48043215ad.24.1759514460608; 
 Fri, 03 Oct 2025 11:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgYdnp9/9RPvOePNV5+nAr8/bGxpvmS/iRNyz0bjNu1JXhAl6ygmglGj+OJGX/6oF/Yz6Vng==
X-Received: by 2002:a17:903:f8b:b0:26b:5346:5857 with SMTP id
 d9443c01a7336-28e9a5a8788mr48042285ad.24.1759514459801; 
 Fri, 03 Oct 2025 11:00:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d5635sm55862525ad.102.2025.10.03.11.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 11:00:58 -0700 (PDT)
Date: Fri, 3 Oct 2025 23:30:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] devcoredump: Fix circular locking dependency with
 devcd->mutex.
Message-ID: <20251003180052.wpx4d5mqs6tmmber@hu-mojha-hyd.qualcomm.com>
References: <20250723142416.1020423-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723142416.1020423-1-dev@lankhorst.se>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX7ZsxdE6GkEI3
 /kYM37D8nxIhkzfGtcbDQL43ErLv4JHbSwjg8TCcyH5uPaN349olOg94bpQWD2ZHRmsVJCbysTH
 hMWL3ibk19GPg+szRuDgPZwnWtZPfIPq8Deu/udKNUFN/w1r1jbPCwNoUW4vBH4vhgu6Uw7yVrQ
 eo1QiHqgXbB7hsW/nTdiPdG7wXsdUnfIVpTFQp/DH9+fvfbop4MaM8HmXtD3jPgbUX3utLJsn5h
 KSpsIZ1GMmkKzzKVH356PxE1xVFjKybLKasABwjVh8AvjK8G+LHNbgPmN9max4ySdQf4YzaXulp
 qjvnR8TPy6baKEK40TbUBCP4fujuIANGnJa24tgISI43rDOG6BwncgrnNi0/6lGaq9H5D0+0q13
 22RHeItA/j7Xfvck5IMVMMubrcASxw==
X-Proofpoint-GUID: gAiwygOUi11_5dNjalsiJ_vDcyYVr8rK
X-Proofpoint-ORIG-GUID: gAiwygOUi11_5dNjalsiJ_vDcyYVr8rK
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68e00f5d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=ag1SF4gXAAAA:8
 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=Z11Wbj0bmuotKECDuA0A:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
X-Mailman-Approved-At: Mon, 06 Oct 2025 14:53:58 +0000
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

On Wed, Jul 23, 2025 at 04:24:16PM +0200, Maarten Lankhorst wrote:
> The original code causes a circular locking dependency found by lockdep.
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.16.0-rc6-lgci-xe-xe-pw-151626v3+ #1 Tainted: G S   U
> ------------------------------------------------------
> xe_fault_inject/5091 is trying to acquire lock:
> ffff888156815688 ((work_completion)(&(&devcd->del_wk)->work)){+.+.}-{0:0}, at: __flush_work+0x25d/0x660
> 
> but task is already holding lock:
> 
> ffff888156815620 (&devcd->mutex){+.+.}-{3:3}, at: dev_coredump_put+0x3f/0xa0
> which lock already depends on the new lock.
> the existing dependency chain (in reverse order) is:
> -> #2 (&devcd->mutex){+.+.}-{3:3}:
>        mutex_lock_nested+0x4e/0xc0
>        devcd_data_write+0x27/0x90
>        sysfs_kf_bin_write+0x80/0xf0
>        kernfs_fop_write_iter+0x169/0x220
>        vfs_write+0x293/0x560
>        ksys_write+0x72/0xf0
>        __x64_sys_write+0x19/0x30
>        x64_sys_call+0x2bf/0x2660
>        do_syscall_64+0x93/0xb60
>        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> -> #1 (kn->active#236){++++}-{0:0}:
>        kernfs_drain+0x1e2/0x200
>        __kernfs_remove+0xae/0x400
>        kernfs_remove_by_name_ns+0x5d/0xc0
>        remove_files+0x54/0x70
>        sysfs_remove_group+0x3d/0xa0
>        sysfs_remove_groups+0x2e/0x60
>        device_remove_attrs+0xc7/0x100
>        device_del+0x15d/0x3b0
>        devcd_del+0x19/0x30
>        process_one_work+0x22b/0x6f0
>        worker_thread+0x1e8/0x3d0
>        kthread+0x11c/0x250
>        ret_from_fork+0x26c/0x2e0
>        ret_from_fork_asm+0x1a/0x30
> -> #0 ((work_completion)(&(&devcd->del_wk)->work)){+.+.}-{0:0}:
>        __lock_acquire+0x1661/0x2860
>        lock_acquire+0xc4/0x2f0
>        __flush_work+0x27a/0x660
>        flush_delayed_work+0x5d/0xa0
>        dev_coredump_put+0x63/0xa0
>        xe_driver_devcoredump_fini+0x12/0x20 [xe]
>        devm_action_release+0x12/0x30
>        release_nodes+0x3a/0x120
>        devres_release_all+0x8a/0xd0
>        device_unbind_cleanup+0x12/0x80
>        device_release_driver_internal+0x23a/0x280
>        device_driver_detach+0x14/0x20
>        unbind_store+0xaf/0xc0
>        drv_attr_store+0x21/0x50
>        sysfs_kf_write+0x4a/0x80
>        kernfs_fop_write_iter+0x169/0x220
>        vfs_write+0x293/0x560
>        ksys_write+0x72/0xf0
>        __x64_sys_write+0x19/0x30
>        x64_sys_call+0x2bf/0x2660
>        do_syscall_64+0x93/0xb60
>        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> other info that might help us debug this:
> Chain exists of: (work_completion)(&(&devcd->del_wk)->work) --> kn->active#236 --> &devcd->mutex
>  Possible unsafe locking scenario:
>        CPU0                    CPU1
>        ----                    ----
>   lock(&devcd->mutex);
>                                lock(kn->active#236);
>                                lock(&devcd->mutex);
>   lock((work_completion)(&(&devcd->del_wk)->work));
>  *** DEADLOCK ***
> 5 locks held by xe_fault_inject/5091:
>  #0: ffff8881129f9488 (sb_writers#5){.+.+}-{0:0}, at: ksys_write+0x72/0xf0
>  #1: ffff88810c755078 (&of->mutex#2){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x123/0x220
>  #2: ffff8881054811a0 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0x55/0x280
>  #3: ffff888156815620 (&devcd->mutex){+.+.}-{3:3}, at: dev_coredump_put+0x3f/0xa0
>  #4: ffffffff8359e020 (rcu_read_lock){....}-{1:2}, at: __flush_work+0x72/0x660
> stack backtrace:
> CPU: 14 UID: 0 PID: 5091 Comm: xe_fault_inject Tainted: G S   U              6.16.0-rc6-lgci-xe-xe-pw-151626v3+ #1 PREEMPT_{RT,(lazy)}
> Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
> Hardware name: Micro-Star International Co., Ltd. MS-7D25/PRO Z690-A DDR4(MS-7D25), BIOS 1.10 12/13/2021
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x91/0xf0
>  dump_stack+0x10/0x20
>  print_circular_bug+0x285/0x360
>  check_noncircular+0x135/0x150
>  ? register_lock_class+0x48/0x4a0
>  __lock_acquire+0x1661/0x2860
>  lock_acquire+0xc4/0x2f0
>  ? __flush_work+0x25d/0x660
>  ? mark_held_locks+0x46/0x90
>  ? __flush_work+0x25d/0x660
>  __flush_work+0x27a/0x660
>  ? __flush_work+0x25d/0x660
>  ? trace_hardirqs_on+0x1e/0xd0
>  ? __pfx_wq_barrier_func+0x10/0x10
>  flush_delayed_work+0x5d/0xa0
>  dev_coredump_put+0x63/0xa0
>  xe_driver_devcoredump_fini+0x12/0x20 [xe]
>  devm_action_release+0x12/0x30
>  release_nodes+0x3a/0x120
>  devres_release_all+0x8a/0xd0
>  device_unbind_cleanup+0x12/0x80
>  device_release_driver_internal+0x23a/0x280
>  ? bus_find_device+0xa8/0xe0
>  device_driver_detach+0x14/0x20
>  unbind_store+0xaf/0xc0
>  drv_attr_store+0x21/0x50
>  sysfs_kf_write+0x4a/0x80
>  kernfs_fop_write_iter+0x169/0x220
>  vfs_write+0x293/0x560
>  ksys_write+0x72/0xf0
>  __x64_sys_write+0x19/0x30
>  x64_sys_call+0x2bf/0x2660
>  do_syscall_64+0x93/0xb60
>  ? __f_unlock_pos+0x15/0x20
>  ? __x64_sys_getdents64+0x9b/0x130
>  ? __pfx_filldir64+0x10/0x10
>  ? do_syscall_64+0x1a2/0xb60
>  ? clear_bhb_loop+0x30/0x80
>  ? clear_bhb_loop+0x30/0x80
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x76e292edd574
> Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
> RSP: 002b:00007fffe247a828 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000076e292edd574
> RDX: 000000000000000c RSI: 00006267f6306063 RDI: 000000000000000b
> RBP: 000000000000000c R08: 000076e292fc4b20 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000202 R12: 00006267f6306063
> R13: 000000000000000b R14: 00006267e6859c00 R15: 000076e29322a000
>  </TASK>
> xe 0000:03:00.0: [drm] Xe device coredump has been deleted.
> 
> Fixes: 01daccf74832 ("devcoredump : Serialize devcd_del work")
> Cc: Mukesh Ojha <quic_mojha@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v6.1+
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Matthew Brost <matthew.brost@intel.com>

Looks to be genuine issue.,

> ---
>  drivers/base/devcoredump.c | 136 ++++++++++++++++++++++---------------
>  1 file changed, 83 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
> index 03a39c417dc41..ad4bddde12ccb 100644
> --- a/drivers/base/devcoredump.c
> +++ b/drivers/base/devcoredump.c
> @@ -23,50 +23,46 @@ struct devcd_entry {
>  	void *data;
>  	size_t datalen;
>  	/*
> -	 * Here, mutex is required to serialize the calls to del_wk work between
> -	 * user/kernel space which happens when devcd is added with device_add()
> -	 * and that sends uevent to user space. User space reads the uevents,
> -	 * and calls to devcd_data_write() which try to modify the work which is
> -	 * not even initialized/queued from devcoredump.
> +	 * There are 2 races for which mutex is required.
>  	 *
> +	 * The first race is between device creation and userspace writing to
> +	 * schedule immediately destruction.
>  	 *
> +	 * This race is handled by arming the timer before device creation, but
> +	 * when device creation fails the timer still exists.
>  	 *
> -	 *        cpu0(X)                                 cpu1(Y)
> +	 * To solve this, hold the mutex during device_add(), and set
> +	 * init_completed on success before releasing the mutex.
>  	 *
> -	 *        dev_coredump() uevent sent to user space
> -	 *        device_add()  ======================> user space process Y reads the
> -	 *                                              uevents writes to devcd fd
> -	 *                                              which results into writes to
> +	 * That way the timer will never fire until device_add() is called,
> +	 * it will do nothing if init_completed is not set. The timer is also
> +	 * cancelled in that case.
>  	 *
> -	 *                                             devcd_data_write()
> -	 *                                               mod_delayed_work()
> -	 *                                                 try_to_grab_pending()
> -	 *                                                   timer_delete()
> -	 *                                                     debug_assert_init()
> -	 *       INIT_DELAYED_WORK()
> -	 *       schedule_delayed_work()
> -	 *
> -	 *
> -	 * Also, mutex alone would not be enough to avoid scheduling of
> -	 * del_wk work after it get flush from a call to devcd_free()
> -	 * mentioned as below.
> -	 *
> -	 *	disabled_store()
> -	 *        devcd_free()
> -	 *          mutex_lock()             devcd_data_write()
> -	 *          flush_delayed_work()
> -	 *          mutex_unlock()
> -	 *                                   mutex_lock()
> -	 *                                   mod_delayed_work()
> -	 *                                   mutex_unlock()
> -	 * So, delete_work flag is required.
> +	 * The second race involves multiple parallel invocations of devcd_free(),
> +	 * add a deleted flag so only 1 can call the destructor.
>  	 */
>  	struct mutex mutex;
> -	bool delete_work;
> +	bool init_completed, deleted;
>  	struct module *owner;
>  	ssize_t (*read)(char *buffer, loff_t offset, size_t count,
>  			void *data, size_t datalen);
>  	void (*free)(void *data);
> +	/*
> +	 * If nothing interferes and device_add() was returns success,
> +	 * del_wk will destroy the device after the timer fires.
> +	 *
> +	 * Multiple userspace processes can interfere in the working of the timer:
> +	 * - Writing to the coredump will reschedule the timer to run immediately,
> +	 *   if still armed.
> +	 *
> +	 *   This is handled by using "if (cancel_delayed_work()) {
> +	 *   schedule_delayed_work() }", to prevent re-arming after having
> +	 *   been previously fired.
> +	 * - Writing to /sys/class/devcoredump/disabled will destroy the
> +	 *   coredump synchronously.
> +	 *   This is handled by using disable_delayed_work_sync(), and then
> +	 *   checking if deleted flag is set with &devcd->mutex held.
> +	 */
>  	struct delayed_work del_wk;
>  	struct device *failing_dev;
>  };
> @@ -95,14 +91,27 @@ static void devcd_dev_release(struct device *dev)
>  	kfree(devcd);
>  }
>  
> +static void __devcd_del(struct devcd_entry *devcd)
> +{
> +	devcd->deleted = true;
> +	device_del(&devcd->devcd_dev);
> +	put_device(&devcd->devcd_dev);
> +}
> +
>  static void devcd_del(struct work_struct *wk)
>  {
>  	struct devcd_entry *devcd;
> +	bool init_completed;
>  
>  	devcd = container_of(wk, struct devcd_entry, del_wk.work);
>  
> -	device_del(&devcd->devcd_dev);
> -	put_device(&devcd->devcd_dev);
> +	/* devcd->mutex serializes against dev_coredumpm_timeout */
> +	mutex_lock(&devcd->mutex);
> +	init_completed = devcd->init_completed;
> +	mutex_unlock(&devcd->mutex);
> +
> +	if (init_completed)
> +		__devcd_del(devcd);
>  }
>  
>  static ssize_t devcd_data_read(struct file *filp, struct kobject *kobj,
> @@ -122,12 +131,12 @@ static ssize_t devcd_data_write(struct file *filp, struct kobject *kobj,
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct devcd_entry *devcd = dev_to_devcd(dev);
>  
> -	mutex_lock(&devcd->mutex);
> -	if (!devcd->delete_work) {
> -		devcd->delete_work = true;
> -		mod_delayed_work(system_wq, &devcd->del_wk, 0);
> -	}
> -	mutex_unlock(&devcd->mutex);
> +	/*
> +	 * Although it's tempting to use mod_delayed work here,
> +	 * that will cause a reschedule if the timer already fired.
> +	 */
> +	if (cancel_delayed_work(&devcd->del_wk))
> +		schedule_delayed_work(&devcd->del_wk, 0);
>  
>  	return count;
>  }
> @@ -151,11 +160,21 @@ static int devcd_free(struct device *dev, void *data)
>  {
>  	struct devcd_entry *devcd = dev_to_devcd(dev);
>  
> +	/*
> +	 * To prevent a race with devcd_data_write(), disable work and
> +	 * complete manually instead.
> +	 *
> +	 * We cannot rely on the return value of
> +	 * disable_delayed_work_sync() here, because it might be in the
> +	 * middle of a cancel_delayed_work + schedule_delayed_work pair.
> +	 *
> +	 * devcd->mutex here guards against multiple parallel invocations
> +	 * of devcd_free().
> +	 */
> +	disable_delayed_work_sync(&devcd->del_wk);
>  	mutex_lock(&devcd->mutex);
> -	if (!devcd->delete_work)
> -		devcd->delete_work = true;
> -
> -	flush_delayed_work(&devcd->del_wk);
> +	if (!devcd->deleted)
> +		__devcd_del(devcd);
>  	mutex_unlock(&devcd->mutex);
>  	return 0;
>  }
> @@ -179,12 +198,10 @@ static ssize_t disabled_show(const struct class *class, const struct class_attri
>   *                                                                 put_device() <- last reference
>   *             error = fn(dev, data)                           devcd_dev_release()
>   *             devcd_free(dev, data)                           kfree(devcd)
> - *             mutex_lock(&devcd->mutex);
>   *
>   *
>   * In the above diagram, it looks like disabled_store() would be racing with parallelly
> - * running devcd_del() and result in memory abort while acquiring devcd->mutex which
> - * is called after kfree of devcd memory after dropping its last reference with
> + * running devcd_del() and result in memory abort after dropping its last reference with
>   * put_device(). However, this will not happens as fn(dev, data) runs
>   * with its own reference to device via klist_node so it is not its last reference.
>   * so, above situation would not occur.
> @@ -374,7 +391,7 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
>  	devcd->read = read;
>  	devcd->free = free;
>  	devcd->failing_dev = get_device(dev);
> -	devcd->delete_work = false;
> +	devcd->deleted = false;
>  
>  	mutex_init(&devcd->mutex);
>  	device_initialize(&devcd->devcd_dev);
> @@ -383,8 +400,14 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
>  		     atomic_inc_return(&devcd_count));
>  	devcd->devcd_dev.class = &devcd_class;
>  
> -	mutex_lock(&devcd->mutex);
>  	dev_set_uevent_suppress(&devcd->devcd_dev, true);
> +
> +	/* devcd->mutex prevents devcd_del() completing until init finishes */
> +	mutex_lock(&devcd->mutex);
> +	devcd->init_completed = false;
> +	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
> +	schedule_delayed_work(&devcd->del_wk, timeout);
> +
>  	if (device_add(&devcd->devcd_dev))
>  		goto put_device;
>  
> @@ -401,13 +424,20 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
>  
>  	dev_set_uevent_suppress(&devcd->devcd_dev, false);
>  	kobject_uevent(&devcd->devcd_dev.kobj, KOBJ_ADD);
> -	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
> -	schedule_delayed_work(&devcd->del_wk, timeout);
> +
> +	/*
> +	 * Safe to run devcd_del() now that we are done with devcd_dev.
> +	 * Alternatively we could have taken a ref on devcd_dev before
> +	 * dropping the lock.
> +	 */
> +	devcd->init_completed = true;
>  	mutex_unlock(&devcd->mutex);
>  	return;
>   put_device:
> -	put_device(&devcd->devcd_dev);
>  	mutex_unlock(&devcd->mutex);
> +	cancel_delayed_work_sync(&devcd->del_wk);
> +	put_device(&devcd->devcd_dev);
> +

Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

>   put_module:
>  	module_put(owner);
>   free:
> -- 
> 2.45.2
> 

-- 
-Mukesh Ojha
