Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBC8C4707B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 01:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF08710E9DD;
	Fri, 12 Jan 2024 01:03:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BDC10E9DD
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 01:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705021427; x=1736557427;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SUc0SSGstMFn0WMW9IcPZRMhcULCyRhqHsRQRaC8xGg=;
 b=C1fXLIens3Yc1EI407hDH4hzjpS6mhAJJOoDLarn7xDqPovC5BGjjwQZ
 ziOGEpfFiWTMhJJp04GsNfJPvR81tmivrQkZfVd6vkpXMwBofie1Np6Zw
 Vyo182Mf8stdNUTpXTHT9hlYLF/lG8h62oqRvT6OgfpIHZH2Drql4AO3R
 4gMoPkBiPNxUFBW/joijVCPJPS+QlZEhFpWmr95hi7ffUr+25oAUS1/9U
 B3mF6Tx4MxOtrzOkkKvIsiZvSBiUrv+s0IKJU0Hr9gDkRqwgTY7Xunxki
 PRBH0tBoAMvPRhI9EEoHJYOwbcYUZcJYob1LUCW5zhFpXT7xdMC65lili g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="402819179"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="402819179"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 17:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="1114041301"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="1114041301"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 17:03:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 17:03:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 17:03:44 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 17:03:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fETVFkjdxva3TLd3843tg09UEgU70KYlo9jigtp7w3TZ1xG3TFCRJ3j/rPV3rictY9N/MsDKyB4UZFYMDux9l2Tc7bUBOKkRDFBwgsWVCxK2uBO0cAtmBl4FUHfUoQIIoW5GjtGlvZ9BF05MSjXPnRZuQ/WnB+MVAAD3e0qJPG38P9I3bs0dOW1C75jxp9QqtU94AB3goU7pzSqZGHq9pvwG7rPXD8MGFfNcWp/bX4ETwa7Af4Bx1NRlAeNaSXNru4h/3NK25K1dUCIVOVatjirZGYQrvQpO/Z9Ik+/YpVw8QhOKU1FhL9sv8GLl4VZ0RLNiR6tPdUCMryhCcEPyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM2boB8629dfVdCWPbfKJcPtkDCvx5YPw38nLbqpPjM=;
 b=cYXGI/B1T1ds4s3SnghrHuyeXHbLzYtnd567G2vsYXHM0v+Mr+E4AbM+gor9zNVzkZnxoH2szryjB0KN4avOROiV8PHzXnX8htVF0vdS439Um4vGrKJfQPX2W//bDODTqv/E0NunmT8icdkVqxUHI4+5kbW0ADaS5qSfMpfoggC+vYsyd25XmZzsK0nV88omaJ2ASvNTS7jeXuM0jHj0wUaUf+PWOfOCL0ceIh7JKhPuI+McLm6dw9N/nvZqZRn6KZd9Tam+dOVdJWPXN/u6mUZDK04U0XxaRi3gJvXJ0a4WpCPpz9prm3oBhBu7KOTKrDEdoqwem3j8DY9UJ/viZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 01:03:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 01:03:42 +0000
Date: Fri, 12 Jan 2024 01:02:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Use HXG definitions on HXG messages
Message-ID: <ZaCPn6fA+IOd6tSt@DUT025-TGLU.fm.intel.com>
References: <20240111210632.717-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240111210632.717-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3369a1-0637-4275-3df7-08dc130a5175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E//QH7/HwwP/ssyJ57wjKu3dXHCWUT3G29Ce4LmGHDE+Ory01HQCQpoBKWjM2vEFubvLyORb/hId9GR4ag3AwGOJhFxe5feCfyPwmLctzk+B4iNhvR3za+Wws1VyXpHZjmzVTvm9oJcazRnVhuX+oDVFlUFyJU8t8s2rJUbBbA/ZBiL/Q/xrLPwJIj8Zj5rMLn3zfS+ncUAASDYOetNA7wdfljtJOBjr5Hs9s8cMePENaFv0j8ekHL3uCK1o+cl9lAuS7ecQFs/HFEfk/nF5oc5iqin3q39BjwmNxtnj8Ecdff52wK/Vg879OoHxv0bAgqscYXn+l0LVuViww5FkLQTCbB6+i2IUYX3g4ucUWUbhmeLi575VIFQFPspx9ImRx10UpfVV9CsApgsspBo/obv4vR94Ih4gIDECdS7ixaYXw1KxzjRho5TMxKeg9j+NUA4o9mjBkZnk3Z+jaRHfHiikeNkehcxhvbaOXKCiu1edkg23QCbHQ1j0oZaqLcI/Oq1pqmXIV/uw2OXn8cKGWr9QbCgBLhXhZ8NO3HtiGpDEZHBxMK9zpMWSuooc3w5BziYH++qGM4fHslzjtHBggg95k+9Qm7tnaB0THoc0gOwXes056yda+gorA1WH8gWsbyOrvf6ftPRVqMBVacPNZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6862004)(6512007)(15650500001)(4326008)(5660300002)(478600001)(6666004)(66946007)(66556008)(66476007)(6506007)(6636002)(6486002)(83380400001)(8676002)(44832011)(8936002)(26005)(38100700002)(316002)(82960400001)(41300700001)(86362001)(2906002)(21314003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/CMsAJODi16NC8ItOK0rc1hbrkKa+c8XMK9H3ER/OPVY2jb3s3B784BURaZh?=
 =?us-ascii?Q?D3NCrnO12HPNf0becxeKsxYQ89EYxr6TW5MhHq5vfjDdvbzsozdlc1+VEqhE?=
 =?us-ascii?Q?+eb7wNc6Mhe8efetW5aN8FQvxnOhBuXVY/oBtT7CtBDPY2zEWfK3lkALKCEx?=
 =?us-ascii?Q?JqsH3AaTMy+9GOPL/Yd2Qn/RNlACfIHQ+ydCZ1FJLEKiAA4Rto40W634fU5E?=
 =?us-ascii?Q?5friryWZobo/36FIf7qEiJFgpHS+Xu3vKs86ooIEN9HOm3lDIyPYtKktHMGe?=
 =?us-ascii?Q?DfGMLWX8vtoqOpwPIcRJc8hDH2mEJiqdlV3NZuxRNP/0M/CQC9joyLNJF+xV?=
 =?us-ascii?Q?3B/AKIU/n9HK/l6NtsE+QnZuUZ/98beQ3CaoyfViwNJnVxwCRZZnINHPYBlV?=
 =?us-ascii?Q?TSnJ1C5VRX/qBNT+w7dG4GpKM21aUaZy3x3x+L7PXuwScdG6cMEe6iYffwG+?=
 =?us-ascii?Q?mS0n2I9/OoFMjO4qmlTnBILvf7YNSnDNDu9XpILfR4RIueSObdmop2CXCUwg?=
 =?us-ascii?Q?L0Cp3ShWa0Y13G+zhhYc06YxIBX12ziOSQt6y9hVGyX5Y7rjuxT7rDcFXbDv?=
 =?us-ascii?Q?OgJh1K2wLfk3zEsecMvt2CXAwPoElVl0u8cl7zDXEH1OCoha9a9v4YzqU6Od?=
 =?us-ascii?Q?iygZQvg1Kq4Sq2gWB1w6eMxTO5+EYGs3Z/fIiZ1lm0U2KVFxRy4CMUheNz/X?=
 =?us-ascii?Q?q2tyJaVwAbu/dxNBtwV4BHSGtnBN4SmGA2fL7He/2GjVjkzIkylm1npw9Zwf?=
 =?us-ascii?Q?ZpJuy/yjpMzn923u3y0zaUyfoeXDx1zIXFRBurif+gZWYWn+7hI1vHRWp9nd?=
 =?us-ascii?Q?q7cqTYzbaHlNAXCHEjeYhKC6SKGfkydyy1G3EXb+2bwJd4SsXxN9jC6/3cIr?=
 =?us-ascii?Q?vFDxNoBJJOGClxFT9Za58FcFlZhaC/TDzLnZxP5G9867RVKYSHzVoGyyNyWS?=
 =?us-ascii?Q?pnzlINHOlQuO/tpMHYnAz2phcH7UjMfDLxLgysZnZ4Qm4ybnxgoGzWwPtO22?=
 =?us-ascii?Q?HNYZQZK5x/vhhj9HtFNTiQ95ps0xajnN6k8FM0KzIYugA45H9GV4nDbhYXLU?=
 =?us-ascii?Q?eztg6xxJsLKGYe05ldekZvnel73MrdhzrVvh8yJS+zUPCCe8zy0As0favFX4?=
 =?us-ascii?Q?7kaxDT2HbZz6Am4IyoYNKfi1eK/zdd+7NVdP3FdKPNSNXwL+jp/xuaMERnjR?=
 =?us-ascii?Q?Jp3o2c938genQ6/GxgmF4qqdqTZbw5N1kzo+Kl1h0nKahTGVpkcbRt+uvwK6?=
 =?us-ascii?Q?VPLfwkkFopOWew0VwqGV7rF6liQNMaz+vvwQN/6kEIJnZvlb2PXfptD8qq/R?=
 =?us-ascii?Q?hp7psUjJ4pbLMsebSrZv6Wra8f0wgDW/jioTC3AfXS0VjpiWASJYBbYxEEZ+?=
 =?us-ascii?Q?7YpmjZESfV/8KFA3hAMSkp0ykJ0H1gt9ZA/M6A1cmt/GT3aE3E11fkICSo+l?=
 =?us-ascii?Q?A+6F00H/G2MdmMqC+VLul4zpaYHmr8kZZqfZN0zbNDn66cck8sb6PNBXy21+?=
 =?us-ascii?Q?7NJRFfG90CF6WbqJElXSQFzxuPwqsdXKn5vC5zdbTOPk3J6cW7z0R/lz2VlM?=
 =?us-ascii?Q?Hxhu2oyylhYYazNgsuwSUPa6XQjf6xib+LhKm5ifgHalpZG19zR+Bh5fsJYg?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3369a1-0637-4275-3df7-08dc130a5175
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 01:03:41.8574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ApnfohOSdWqx94GTxyxD7FcVRkg0w2p+rsase6M7r2b7ULM557JLzJPPePG53xleNUDhDe0YYweUGkiQitLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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

On Thu, Jan 11, 2024 at 10:06:32PM +0100, Michal Wajdeczko wrote:
> While parsing and processing CTB G2H messages we should extract
> underlying HXG message and use HXG definitions on such message.
> Using outer CTB layer message in HXG definitions require use of
> shifted dword index, which might be confusing:
> 
> 	FIELD_GET(GUC_HXG_MSG_0_xxx, msg[1])
> 
> instead of:
> 
> 	FIELD_GET(GUC_HXG_MSG_0_xxx, hxg[0])
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: s/msg_len_to_hxg/msg_len_to_hxg_len (Matt)
>     be consistent on hxg constness (Matt)
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 72 +++++++++++++++++++++-------------
>  1 file changed, 44 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d490a4d42c01..b2cc3f993eb6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -796,9 +796,20 @@ int xe_guc_ct_send_recv_no_fail(struct xe_guc_ct *ct, const u32 *action,
>  	return guc_ct_send_recv(ct, action, len, response_buffer, true);
>  }
>  
> +static u32 *msg_to_hxg(u32 *msg)
> +{
> +	return msg + GUC_CTB_MSG_MIN_LEN;
> +}
> +
> +static u32 msg_len_to_hxg_len(u32 len)
> +{
> +	return len - GUC_CTB_MSG_MIN_LEN;
> +}
> +
>  static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
> -	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
> +	u32 *hxg = msg_to_hxg(msg);
> +	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>  
>  	lockdep_assert_held(&ct->lock);
>  
> @@ -817,9 +828,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt =  ct_to_gt(ct);
>  	struct xe_device *xe = gt_to_xe(gt);
> -	u32 response_len = len - GUC_CTB_MSG_MIN_LEN;
> +	u32 *hxg = msg_to_hxg(msg);
> +	u32 hxg_len = msg_len_to_hxg_len(len);
>  	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
> -	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
> +	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
>  	struct g2h_fence *g2h_fence;
>  
>  	lockdep_assert_held(&ct->lock);
> @@ -836,8 +848,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>  			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>  				  fence,
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>  		else
>  			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>  				  type, fence);
> @@ -857,18 +869,14 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>  		g2h_fence->fail = true;
> -		g2h_fence->error =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
> -		g2h_fence->hint =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
> +		g2h_fence->error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]);
> +		g2h_fence->hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]);
>  	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>  		g2h_fence->retry = true;
> -		g2h_fence->reason =
> -			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
> +		g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
>  	} else if (g2h_fence->response_buffer) {
> -		g2h_fence->response_len = response_len;
> -		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
> -		       response_len * sizeof(u32));
> +		g2h_fence->response_len = hxg_len;
> +		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
>  	}
>  
>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> @@ -884,14 +892,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> -	u32 hxg, origin, type;
> +	u32 *hxg = msg_to_hxg(msg);
> +	u32 origin, type;
>  	int ret;
>  
>  	lockdep_assert_held(&ct->lock);
>  
> -	hxg = msg[1];
> -
> -	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
> +	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>  		drm_err(&xe->drm,
>  			"G2H channel broken on read, origin=%d, reset required\n",
> @@ -901,7 +908,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		return -EPROTO;
>  	}
>  
> -	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg);
> +	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
>  	switch (type) {
>  	case GUC_HXG_TYPE_EVENT:
>  		ret = parse_g2h_event(ct, msg, len);
> @@ -927,14 +934,19 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_guc *guc = ct_to_guc(ct);
> -	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
> -	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
> -	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
> +	u32 hxg_len = msg_len_to_hxg_len(len);
> +	u32 *hxg = msg_to_hxg(msg);
> +	u32 action, adj_len;
> +	u32 *payload;
>  	int ret = 0;
>  
> -	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
> +	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
>  		return 0;
>  
> +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
> +	payload = hxg + GUC_HXG_EVENT_MSG_MIN_LEN;
> +	adj_len = hxg_len - GUC_HXG_EVENT_MSG_MIN_LEN;
> +
>  	switch (action) {
>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>  		ret = xe_guc_sched_done_handler(guc, payload, adj_len);
> @@ -995,6 +1007,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	u32 tail, head, len;
>  	s32 avail;
>  	u32 action;
> +	u32 *hxg;
>  
>  	lockdep_assert_held(&ct->fast_lock);
>  
> @@ -1045,10 +1058,11 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  				   avail * sizeof(u32));
>  	}
>  
> -	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
> +	hxg = msg_to_hxg(msg);
> +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>  
>  	if (fast_path) {
> -		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
> +		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
>  			return 0;
>  
>  		switch (action) {
> @@ -1074,9 +1088,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_guc *guc = ct_to_guc(ct);
> -	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
> -	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
> -	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
> +	u32 hxg_len = msg_len_to_hxg_len(len);
> +	u32 *hxg = msg_to_hxg(msg);
> +	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
> +	u32 *payload = hxg + GUC_HXG_MSG_MIN_LEN;
> +	u32 adj_len = hxg_len - GUC_HXG_MSG_MIN_LEN;
>  	int ret = 0;
>  
>  	switch (action) {
> 
> base-commit: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052
> -- 
> 2.25.1
> 
