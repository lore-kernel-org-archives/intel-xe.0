Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78A0F94CA2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 02:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645A710E10F;
	Wed, 22 Apr 2026 02:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfejpSBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663C410E10F;
 Wed, 22 Apr 2026 02:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776826036; x=1808362036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5aedry7362275XmQZCBCL3OEeSud3GzSo5nw39yJn2Q=;
 b=SfejpSBMpuFAolu93Ngkvg+C9u8p+0RG8oxGXyo2mqATXCeNptWc/GbF
 FDe5sTNZT4L8trgdBvG2MW9vuKIhb7F5ePQJUaSNVv26x4lU4Ja3tWTIZ
 f8drNHoRxEQDiLEC7/uJx+S2n6DgYTfugaCA1j6FAgQAgdHjCn5alB7mI
 y7gzt9FQ4OSGBrG8sndE1S6AIGv0y4YH58nM55tGyv1r7RneNzPjaU1z7
 +YAFNmbP9tDAp99GjxS2BTnTQxzIcqI/SxlXvpeHklcxsnFCQrr6MzfDe
 v3OcMtxyZUcRTr7heBshv3StKFd5DRF3c7NQN86UbjrX4UGsuCPThRpzO Q==;
X-CSE-ConnectionGUID: Wsk7+OALTCSKLLFKk7y52A==
X-CSE-MsgGUID: wmI7xZ/KR0ml6fH1YczlbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81638407"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="81638407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 19:47:15 -0700
X-CSE-ConnectionGUID: RXJVo8tZRGOZnh6ypnOGQw==
X-CSE-MsgGUID: RUem36dJT42g7V2PMI5ZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="255481441"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 21 Apr 2026 19:47:13 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wFNcM-000000004DY-1nXy;
 Wed, 22 Apr 2026 02:47:10 +0000
Date: Wed, 22 Apr 2026 10:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/dp: Ignore HPD when in DPLL enable/disable cycle
Message-ID: <202604221040.Im5y9Mk0-lkp@intel.com>
References: <20260417080118.2352283-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417080118.2352283-1-suraj.kandpal@intel.com>
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

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0 next-20260421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-dp-Ignore-HPD-when-in-DPLL-enable-disable-cycle/20260422-031647
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260417080118.2352283-1-suraj.kandpal%40intel.com
patch subject: [PATCH] drm/i915/dp: Ignore HPD when in DPLL enable/disable cycle
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604221040.Im5y9Mk0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604221040.Im5y9Mk0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604221040.Im5y9Mk0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_dp.c: In function 'intel_dp_hpd_pulse':
>> drivers/gpu/drm/i915/display/intel_dp.c:6834:76: error: macro 'drm_dbg_kms' requires 3 arguments, but only 1 given
    6834 |                 drm_dbg_kms("Ignoring HPD since DPLL is getting disabled\n");
         |                                                                            ^
   In file included from drivers/gpu/drm/i915/display/intel_dp.c:50:
   include/drm/drm_print.h:652:9: note: macro 'drm_dbg_kms' defined here
     652 | #define drm_dbg_kms(drm, fmt, ...)                                      \
         |         ^~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_dp.c:6834:17: error: 'drm_dbg_kms' undeclared (first use in this function)
    6834 |                 drm_dbg_kms("Ignoring HPD since DPLL is getting disabled\n");
         |                 ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dp.c:6834:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/drm_dbg_kms +6834 drivers/gpu/drm/i915/display/intel_dp.c

  6825	
  6826	enum irqreturn
  6827	intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
  6828	{
  6829		struct intel_display *display = to_intel_display(dig_port);
  6830		struct intel_dp *intel_dp = &dig_port->dp;
  6831		u8 dpcd[DP_RECEIVER_CAP_SIZE];
  6832	
  6833		if (atomic_read(&dig_port->link_teardown)) {
> 6834			drm_dbg_kms("Ignoring HPD since DPLL is getting disabled\n");
  6835			return IRQ_NONE;
  6836		}
  6837	
  6838		if (dig_port->base.type == INTEL_OUTPUT_EDP &&
  6839		    (long_hpd ||
  6840		     intel_display_rpm_suspended(display) ||
  6841		     !intel_pps_have_panel_power_or_vdd(intel_dp))) {
  6842			/*
  6843			 * vdd off can generate a long/short pulse on eDP which
  6844			 * would require vdd on to handle it, and thus we
  6845			 * would end up in an endless cycle of
  6846			 * "vdd off -> long/short hpd -> vdd on -> detect -> vdd off -> ..."
  6847			 */
  6848			drm_dbg_kms(display->drm,
  6849				    "ignoring %s hpd on eDP [ENCODER:%d:%s]\n",
  6850				    long_hpd ? "long" : "short",
  6851				    dig_port->base.base.base.id,
  6852				    dig_port->base.base.name);
  6853			return IRQ_HANDLED;
  6854		}
  6855	
  6856		drm_dbg_kms(display->drm, "got hpd irq on [ENCODER:%d:%s] - %s\n",
  6857			    dig_port->base.base.base.id,
  6858			    dig_port->base.base.name,
  6859			    long_hpd ? "long" : "short");
  6860	
  6861		/*
  6862		 * TBT DP tunnels require the GFX driver to read out the DPRX caps in
  6863		 * response to long HPD pulses. The DP hotplug handler does that,
  6864		 * however the hotplug handler may be blocked by another
  6865		 * connector's/encoder's hotplug handler. Since the TBT CM may not
  6866		 * complete the DP tunnel BW request for the latter connector/encoder
  6867		 * waiting for this encoder's DPRX read, perform a dummy read here.
  6868		 */
  6869		if (long_hpd) {
  6870			intel_dp_dpcd_set_probe(intel_dp, true);
  6871	
  6872			intel_dp_read_dprx_caps(intel_dp, dpcd);
  6873	
  6874			intel_dp->reset_link_params = true;
  6875			intel_dp_invalidate_source_oui(intel_dp);
  6876	
  6877			return IRQ_NONE;
  6878		}
  6879	
  6880		if (intel_dp->is_mst) {
  6881			if (!intel_dp_check_mst_status(intel_dp))
  6882				return IRQ_NONE;
  6883		} else if (!intel_dp_short_pulse(intel_dp)) {
  6884			return IRQ_NONE;
  6885		}
  6886	
  6887		return IRQ_HANDLED;
  6888	}
  6889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
