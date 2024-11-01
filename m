Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBF4E6F069
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 15:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49F10E083;
	Fri,  1 Nov 2024 15:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtfR4LnH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF8110E083
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730473659; x=1762009659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v2Kp1OcgbGvnRJVHRqzCmn69+N/Qe88ztMVY/zNGmyQ=;
 b=GtfR4LnH4JVvSEdK8IL8xcv0NBA/qZ4z16ioDD1uXCxZmehmx2S1OWGU
 F0oExqF2PaCjPAb4O/VrAfxATzxkoAqaOm809SV5BI6gPrHFCLr0/9ex7
 tOzEgnOH3k6/bvBAVdf0qWFeleOx1Aa/KGw3aWuJgQhpVz4hFp2ZwaX61
 Dyy6ovq1pI8isGJjHmZfJCH1sBcJGKjeU1kfofABLBn+OR8HkPeCg0HD1
 MgDWZW6VwV86NquBbBESyXcTcTmQmQlfMkbD6e8q2YvVw3VewA7PfnWGi
 fmOctGx0UpOeHsTzeJBVWOi3CjL0HvmjMtN250jVPAZ8HafhmkLPwVAEt A==;
X-CSE-ConnectionGUID: /gH3l9kZTIqq0UjFUVLz7w==
X-CSE-MsgGUID: nJ3DlGIDTD6oSoedWiV0SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55639760"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="55639760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 08:07:39 -0700
X-CSE-ConnectionGUID: J1Z7oQ4ZSUeEZxzJUZKkIw==
X-CSE-MsgGUID: HXhUgCtFRxi+56T+Kg9CCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="83423422"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 08:07:37 -0700
Date: Fri, 1 Nov 2024 17:07:34 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Improve devcoredump documentation
Message-ID: <ZyTutrXXD73sofRo@black.fi.intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-2-lucas.demarchi@intel.com>
 <ZyRrisQfc_59rrK-@black.fi.intel.com>
 <4kw2zzb76m42zbisvsy2fu52q2litchy6dfl4hyrmvze5u5dvk@hjs2pdynjemd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4kw2zzb76m42zbisvsy2fu52q2litchy6dfl4hyrmvze5u5dvk@hjs2pdynjemd>
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

On Fri, Nov 01, 2024 at 07:44:37AM -0500, Lucas De Marchi wrote:
> On Fri, Nov 01, 2024 at 07:47:54AM +0200, Raag Jadav wrote:
> > On Thu, Oct 31, 2024 at 11:29:15AM -0700, Lucas De Marchi wrote:
> > 
> > ...
> > 
> > > - * Snapshot at hang:
> > > - * The 'data' file is printed with a drm_printer pointer at devcoredump read
> > > - * time. For this reason, we need to take snapshots from when the hang has
> > > - * happened, and not only when the user is reading the file. Otherwise the
> > > - * information is outdated since the resets might have happened in between.
> > > + * The following characteristics are observed by xe when creating a device
> > > + * coredump:
> > >   *
> > > - * 'First' failure snapshot:
> > > - * In general, the first hang is the most critical one since the following hangs
> > > - * can be a consequence of the initial hang. For this reason we only take the
> > > - * snapshot of the 'first' failure and ignore subsequent calls of this function,
> > > - * at least while the coredump device is alive. Dev_coredump has a delayed work
> > > - * queue that will eventually delete the device and free all the dump
> > > - * information.
> > > + * **Snapshot at hang**:
> > > + *   The 'data' file contains a snapshot of the HW state at the time the hang
> > > + *   happened. Due to the driver recovering from resets/crashes, it may not
> > > + *   correspond to the state of when the file is read by userspace.
> > 
> > Does that mean the devcoredump will be present even after a successful recovery?
> 
> yes.... if it's not succesful then it's moved to the wedged state. Easy
> way to test is running this:
> 
> 	xe_exec_threads --r threads-hang-basic
> 
> You should see something like this in your dmesg:
> 
> 	[IGT] xe_exec_threads: starting subtest threads-hang-basic
> 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=34
> 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, logical_mask: 0x1, guc_id=32
> 	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=18
> 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=34, flags=0x0 in xe_exec_threads [2636]
> 	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vecs, logical_mask: 0x1, guc_id=17
> 	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=18, flags=0x0 in xe_exec_threads [2636]
> 	xe 0000:00:02.0: [drm] Xe device coredump has been created
> -->	xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
> 	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=17, flags=0x0 in xe_exec_threads [2636]
> 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=32, flags=0x0 in xe_exec_threads [2636]
> 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=ccs, logical_mask: 0x1, guc_id=27
> 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=27, flags=0x0 in xe_exec_threads [2636]
> 	[IGT] xe_exec_threads: finished subtest threads-hang-basic, SUCCESS
> 
> 
> If you run it again, it won't overwrite the previous dump, until user
> cleans the previous dump or the timeout on the kernel side fires to
> release it.

Yes, which I think we're covering at later point in "First failure only".
So maybe establishing the mechanism itself before explaining reset/recovery
would be a bit neater...

> From a distro-integration pov, I think it should have a udev rule that
> fires when a devcoredump is created so the dump is copied to persistent
> storage. Just like it happens with cpu coredump (see systemd-coredump)
> 
> > Perhaps moving the 'release' part to above paragraph will add required context.
> 
> not sure I follow. Are you suggesting to swap the order of "First
> failure only" and "Snapshot at hang" ?

... in whichever way you think is best.

> > > + * **First failure only**:
> > > + *   In general, the first hang is the most critical one since the following
> > > + *   hangs can be a consequence of the initial hang. For this reason a snapshot
> > > + *   is taken only for the first failure. Until the devcoredump is released by
> > > + *   userspace or kernel, all subsequent hangs do not override the snapshot nor
> > > + *   create new ones. Devcoredump has a delayed work queue that will eventually
> > > + *   delete the file node and free all the dump information.

Raag
