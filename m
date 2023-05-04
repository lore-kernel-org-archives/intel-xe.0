Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED4BC7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 16:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455BA10E4A5;
	Thu,  4 May 2023 16:17:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DFE10E510
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 16:17:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 354FC60B2F;
 Thu,  4 May 2023 16:17:50 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 3151DC433EF;
 Thu,  4 May 2023 16:17:48 +0000 (UTC)
Date: Thu, 4 May 2023 12:17:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFPaqpYbfbtB/5kx@rdvivi-mobl4>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504073250.1436293-6-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 5/7] drm/xe/rtp: Let rule_matches() receive
 xe_device
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

On Thu, May 04, 2023 at 12:32:48AM -0700, Lucas De Marchi wrote:
> Since some rules use xe_gt, rule_matches() uses that for matching the
> rules, even if most of them are actually checking flags in the
> device/platform layer. In order to allow the device-centric rules to be
> checked for out-of-band WAs, let's pass the pointer to xe_device, too.

why? if we can infer that from gt...

> 
> Also group the simple rules together to make it easier to separate the
> ones checking the device info from others checking gt or hwe.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index f2a0e8eb4936..88eaea597cf7 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -23,11 +23,11 @@
>   * the values to the registers that have matching rules.
>   */
>  
> -static bool rule_matches(struct xe_gt *gt,
> +static bool rule_matches(const struct xe_device *xe,
> +			 struct xe_gt *gt,
>  			 struct xe_hw_engine *hwe,
>  			 const struct xe_rtp_entry *entry)
>  {
> -	const struct xe_device *xe = gt_to_xe(gt);
>  	const struct xe_rtp_rule *r;
>  	unsigned int i;
>  	bool match;
> @@ -62,6 +62,12 @@ static bool rule_matches(struct xe_gt *gt,
>  			match = xe->info.step.graphics >= r->step_start &&
>  				xe->info.step.graphics < r->step_end;
>  			break;
> +		case XE_RTP_MATCH_INTEGRATED:
> +			match = !xe->info.is_dgfx;
> +			break;
> +		case XE_RTP_MATCH_DISCRETE:
> +			match = xe->info.is_dgfx;
> +			break;
>  		case XE_RTP_MATCH_ENGINE_CLASS:
>  			match = hwe->class == r->engine_class;
>  			break;
> @@ -71,13 +77,6 @@ static bool rule_matches(struct xe_gt *gt,
>  		case XE_RTP_MATCH_FUNC:
>  			match = r->match_func(gt, hwe);
>  			break;
> -		case XE_RTP_MATCH_INTEGRATED:
> -			match = !xe->info.is_dgfx;
> -			break;
> -		case XE_RTP_MATCH_DISCRETE:
> -			match = xe->info.is_dgfx;
> -			break;
> -
>  		default:
>  			XE_WARN_ON(r->match_type);
>  		}
> @@ -108,11 +107,12 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
>  			    struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
>  {
> +	const struct xe_device *xe = gt_to_xe(gt);
>  	const struct xe_rtp_action *action;
>  	u32 mmio_base;
>  	unsigned int i;
>  
> -	if (!rule_matches(gt, hwe, entry))
> +	if (!rule_matches(xe, gt, hwe, entry))
>  		return;
>  
>  	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> -- 
> 2.40.1
> 
