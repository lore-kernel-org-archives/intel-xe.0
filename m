Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE00C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 13:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E25610EE1F;
	Fri, 21 Apr 2023 13:55:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466A210EE1D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 13:55:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC27F611AF;
 Fri, 21 Apr 2023 13:55:32 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id CBFAFC433D2;
 Fri, 21 Apr 2023 13:55:30 +0000 (UTC)
Date: Fri, 21 Apr 2023 09:55:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZEKVvAvVm8Z7uIBK@rdvivi-mobl4>
References: <20230421101511.3532534-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421101511.3532534-1-anshuman.gupta@intel.com>
Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
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
Cc: mauro.chehab@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:45:11PM +0530, Anshuman Gupta wrote:
> Discrete GFX cards gfx may have multiple PCIe endpoints,
> they connects to root port via pcie upstream switch port(USP)
> and virtual pcie switch port(VSP), sometimes VSP pcie devices
> doesn't bind to pcieport driver. Without pcieport driver pcie PM
> comes without any warranty and with unbounded VSP runtime pm and
> system wide suspend/resume IGT test cases may get pass as false
> positive.

I'm not sure if I'm following here... you mean that in cases like
this we cannot suspend/resume at all? What are the false positive?
I'm not following the whole scenario here...

> 
> Therefore assert the xe_pm igt tests on unbounded VSP.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/xe/xe_pm.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 23b8246ed..78d9374cf 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -33,6 +33,7 @@
>  typedef struct {
>  	int fd_xe;
>  	struct pci_device *pci_xe;
> +	struct pci_device *pci_parent;
>  	struct pci_device *pci_root;
>  } device_t;
>  
> @@ -344,6 +345,7 @@ NULL));
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_query_config *config;
>  	device_t device;
>  	char d3cold_allowed[2];
>  	const struct s_state {
> @@ -369,8 +371,15 @@ igt_main
>  		device.fd_xe = drm_open_driver(DRIVER_XE);
>  		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
>  		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
> +		device.pci_parent = pci_device_get_parent_bridge(device.pci_xe);
>  
> -		xe_device_get(device.fd_xe);
> +		config = xe_device_get(device.fd_xe)->config;
> +
> +		if (config->info[XE_QUERY_CONFIG_FLAGS] & XE_QUERY_CONFIG_FLAGS_HAS_VRAM) {
> +			igt_assert(device.pci_parent);
> +			igt_assert_f(!pci_device_has_kernel_driver(device.pci_parent),
> +				     "pci bridge device does not bind with pcieport driver\n");
> +		}
>  
>  		/* Always perform initial once-basic exec checking for health */
>  		xe_for_each_hw_engine(device.fd_xe, hwe)
> -- 
> 2.25.1
> 
