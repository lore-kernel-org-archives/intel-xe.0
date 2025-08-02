Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35760C87FC9
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 17:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAE710E180;
	Sat,  2 Aug 2025 17:45:49 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D2110E180
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Aug 2025 17:45:49 +0000 (UTC)
Message-ID: <92ffc2fd-cb0a-4708-9f13-987cb595b762@lankhorst.se>
Date: Sat, 2 Aug 2025 19:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



Den 2025-08-01 kl. 18:30, skrev Satyanarayana K V P:
> Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
> their native Power Management (PM) capabilities. The specification (as per
> section 5.10.1 in PCI Express® Base Specification Revision 7.0) mandates
> that Virtual Functions (VFs) without Power Management capability inherit
> their associated Physical Function's (PF) power state.
> 
> As per PCIe spec "If a VF does not implement the PCI Power Management
> Capability, then the VF behaves as if it had been programmed into the
> equivalent power state of its associated PF"
> 
> Since Intel GPU VFs lack PM capability implementations, VFs power behavior
> must mirror their PF's state. During VF creation, the PF remains active
> from the PCI subsystem perspective. To maintain consistency, explicitly
> disable RPM for VFs missing PM capability to ensure they follow their PF's
> power management status rather than entering low-power states
> independently.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> ---
> V2 -> V3:
> - Fixed review comments (Michal Wajdeczko).
> 
> V1 -> V2:
> - Disable RPM only for VF devices when PM cap is not implemented.
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 8aae66660931..019de04fa7bb 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -246,8 +246,18 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
>  
>  static void xe_pm_runtime_init(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = xe->drm.dev;
>  
> +	/*
> +	 * Disable RPM for VFs if PM cap is not supported.
> +	 * As per PCIe specification, "If a VF does not implement the PCI Power
> +	 * Management Capability, then the VF behaves as if it had been programmed
> +	 * into the equivalent power state of its associated PF"
> +	 */
> +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> +		return;
if !pdev->pm_cap || IS_SRIOV_VF()

would be more readable than the double negative here?

> +
>  	/*
>  	 * Disable the system suspend direct complete optimization.
>  	 * We need to ensure that the regular device suspend/resume functions
> @@ -366,8 +376,12 @@ int xe_pm_init(struct xe_device *xe)
>  
>  static void xe_pm_runtime_fini(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = xe->drm.dev;
>  
> +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> +		return;
> +
>  	pm_runtime_get_sync(dev);
>  	pm_runtime_forbid(dev);
>  }

