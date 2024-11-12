Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5764DD32D84
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 10:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1258010E5A9;
	Tue, 12 Nov 2024 10:25:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7B910E5A9;
 Tue, 12 Nov 2024 10:25:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_cpufreq=3A_intel=5Fpstate?=
 =?utf-8?q?=3A_Rearrange_locking_in_hybrid=5Finit=5Fcpu=5Fcapacity=5Fscaling?=
 =?utf-8?q?=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Nov 2024 10:25:38 -0000
Message-ID: <173140713870.2956527.6359053910284437655@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112064938.1332287-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20241112064938.1332287-1-chaitanya.kumar.borah@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: cpufreq: intel_pstate: Rearrange locking in hybrid_init_cpu_capacity_scaling()
URL   : https://patchwork.freedesktop.org/series/141195/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 156014f3f3122d5669232833ab2943f1f7e7d3a3
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Date:   Tue Nov 12 12:19:37 2024 +0530

    cpufreq: intel_pstate: Rearrange locking in hybrid_init_cpu_capacity_scaling()
    
    Notice that hybrid_init_cpu_capacity_scaling() only needs to hold
    hybrid_capacity_lock around __hybrid_init_cpu_capacity_scaling()
    calls, so introduce a "locked" wrapper around the latter and call
    it from the former.  This allows to drop a local variable and a
    label that are not needed any more.
    
    Also, rename __hybrid_init_cpu_capacity_scaling() to
    __hybrid_refresh_cpu_capacity_scaling() for consistency.
    
    No intentional functional impact.
    
    This is Core-for-CI patch for regression seen [1]
    
    [1] https://lore.kernel.org/linux-pm/SJ1PR11MB6129EDBF22F8A90FC3A3EDC8B9582@SJ1PR11MB6129.namprd11.prod.outlook.com/
    
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12763
    Link: https://lore.kernel.org/linux-pm/12554508.O9o76ZdvQC@rjwysocki.net/
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch bb3e6edc085808aa7d7ea238c6bff1130e893224 drm-intel
156014f3f312 cpufreq: intel_pstate: Rearrange locking in hybrid_init_cpu_capacity_scaling()
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
[1] https://lore.kernel.org/linux-pm/SJ1PR11MB6129EDBF22F8A90FC3A3EDC8B9582@SJ1PR11MB6129.namprd11.prod.outlook.com/

total: 0 errors, 1 warnings, 0 checks, 68 lines checked


