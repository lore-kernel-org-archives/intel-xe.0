Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A660AC77B73
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 19:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7805910E01F;
	Tue,  2 May 2023 19:15:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3E710E01F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 19:15:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28BF162297;
 Tue,  2 May 2023 19:15:27 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 28F04C433D2;
 Tue,  2 May 2023 19:15:25 +0000 (UTC)
Date: Tue, 2 May 2023 15:15:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZFFhS3A7HnYd9IVm@rdvivi-mobl4>
References: <20230425192624.168640-1-jose.souza@intel.com>
 <20230425192624.168640-14-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425192624.168640-14-jose.souza@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 13/15] TEMPORARY: drm/xe/display: Enable
 modular fia in TGL
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 12:26:22PM -0700, José Roberto de Souza wrote:
> drm-tip don't have has_modular_fia anymore but to backport it to Xe
> would require us to backport several patches, so this patch is
> intended to only live until next Xe rebase.
> 
> TGL is the first platform tha has it, this is needed to properly
> initialize TC ports in some skus.
> Enabling it for DG1 don't cause any issues as DG1 don't have any real
> TC ports, so intel_tc_port_init() will not be called for DG1.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

I would prefer to go without this patch... to avoid temporary patches
and open precedence... but since I'm taking longer than I expected
to start the rebase, let's move with this so we get the proper TC
on some ports like you explained to me in the chat...

I will then remove this on the next rebase.

> ---
>  drivers/gpu/drm/xe/xe_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 408bd7c8d1c75..fbae60c179be1 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -489,7 +489,10 @@ void xe_display_info_init(struct xe_device *xe)
>  	switch (xe->info.platform) {
>  	case XE_TIGERLAKE:
>  	case XE_DG1:
> -		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
> +		xe->info.display = (struct xe_device_display_info) {
> +			GEN12_DISPLAY,
> +			.has_modular_fia = 1,
> +		};
>  		break;
>  	case XE_ROCKETLAKE:
>  		xe->info.display = (struct xe_device_display_info) {
> -- 
> 2.40.0
> 
