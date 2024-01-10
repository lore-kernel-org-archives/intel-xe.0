Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3810C47073
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 23:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9D910E674;
	Wed, 10 Jan 2024 23:07:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE78B10E6A0
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704928053; x=1736464053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P6wemcKzcnQA0xhr5hoVFWyPnJSZNq5tmA2uSN1Rc1c=;
 b=FEFzncwPlstO/2TFf0Nwj6yPY1SKfDtfLYanCbnrVJ2shAzP1wlRcNOO
 DcJu8EFhivEMpEkAqFWhtAfprd1nZ/qOuD7l5LK7oJl+KVa+l7QewwHeU
 dAAVqLJqG4pzjF7g5/6C29i80clN68vgD4SdEh2K3KYFGCMBWOcZNOiYB
 jOGVYJDe4ItQIZBlIzvo6rbwbtXmGpAy4OH+j6nXGozAK26xk5nka+n71
 k1HCtBh5LUemG6jZZ102VjGnHoFDKTMlDkTO99lkv30mXcPLicm5XbqBB
 7XZgca07Gg3lav5pLiEFvxK+b/K8hbD3eJbhYf51BrvgnTHeqq70Wo+pA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5413174"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5413174"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 15:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955528188"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955528188"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 15:07:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 15:07:30 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 15:07:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 15:07:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 15:07:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCcVNEM/NLQZqMNPLMspPRuRj6+NMtj+FqUatkNN/fYOPJEElNp9bkjBTFHjBUyfzP6W8rORcT+2pb55QaX/pyEYqpjlQrg/Cd2FfOA4z+WddE9uYRxqhYpdSAzmyTFoXYsGiLQLwFVMpX9TprX4Np5VNDw9EdGQEd0+K4alk1fSwXFEI6f21SzPjtU5Imj82tBCCoF6jDOK0dTJ1u8SBcVbGXg6RVhytO8JtpcOmzvOlxTIxGsRoOmfz8KWnoQcCkljLfKjr9FrIDFIKuhVlM9iiq0VaVsytRDatMoxWGNF87sRn5bmnJxllg9ZOpVGr6anYafiQEu3mOPGqOcieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxafEoOIsvD0j2VHSlTPIX/FevmPJV7D5+/q2G6aLxA=;
 b=fH2ybOwznh0WTk4l+LdgIWWgrUOEfhH5elqfwLiMrzWwnkWHac6bizcpihL+hb118ach65lBMP6qSb3JRHg8BRCLQpeM0NT4cRsZOIJRm+7wcWtTUKRyY3ak0ii2FICgfuwdiA0t7eq3Bk/hJJkzr63xpk7XB14DRhamDTo9dNyl/UtNMQSJWBL0m6uKK2J+IeDoQNlU8XVjJervpY/O4lG2nTYII0TD6JwmApWCpUMlHy6QB43MpMi1+J3qQTWCuQtW6/n15EgzhWJl3SJ0+a3nOkeMLj//veXrimH148uK0c7/5Z5KA0Ewd1gm+YtS2hoSaGbd+lANfojIaA0jBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 23:07:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 23:07:27 +0000
Date: Wed, 10 Jan 2024 23:06:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Use HXG definitions on HXG messages
Message-ID: <ZZ8i5fdH/cplEAQ8@DUT025-TGLU.fm.intel.com>
References: <20240110195951.453-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240110195951.453-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a69c140-e92d-4faa-4875-08dc1230ea11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qOBqIjmnY9tUkyDh8DSxU6hFvgndtZKjvqulF5FzgbLIanMQG7mKwIJ9/CIzHS9337YdfIJ8o8eUAngTw/YMo1GFA+8SlNO3IspJc3cBjV6WuM/ymrwJBBceBbV6Apc+vAajhfCmWfrs3fOhpt6mS2bg2WPzZqyeBt3ZXrJkIXTeU/af1Dqa2MjcVNG4uDnDNhpRQ9ZlO/HkD4KQAH0GqRCUmnJ35fPhQ3c2HSj4LTQ+Xoe1xrSIo+ZTk8OznnXILdMFK3XcJF7J5HW6cjo+01F1Kn9FoMAVDmowrtAaOAgLazQmGE173+z/+OPdbgt2CKwgW+aVuOT1g3hQH4H/+xSeZWEtlu2FWanBpMcfVnaOkz2Ws3QqoK/BN3CPD6ONpn/5O4uk1yBnFcopTNddUqSwOeVWNqjZAemuHMNPI7/WL+syclpm8j32O9Rwz3PN2Eqoi0u1s0Iuhl5woIJIHnxreEvI0xTuuxGUhEDQOtJa9RsF2E8uCi0T2RwXdn9XgZ32BcjL0+8DsEWFV117CP1oWRa+4wsrlCv9+pVQm9ntO/A7oEAS476mTBaHUwPu/6ZIb2B2NMzlagb3wOdhefmswe8ogATH2hUvgAhcAsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(5660300002)(15650500001)(2906002)(41300700001)(86362001)(38100700002)(82960400001)(4326008)(6862004)(6486002)(66556008)(6636002)(6666004)(478600001)(66946007)(66476007)(316002)(8676002)(8936002)(6506007)(6512007)(44832011)(83380400001)(26005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m3vlPO++LGDH6chRoeWFWMgX1wSZPfym1yHoyns2QB/TDfulw0eiEYwl++36?=
 =?us-ascii?Q?nZPCS0H7ArpzDTk/63RlvjWYR/5z7AaW45EQmPnXF9dEKTvtbFWEoy0UyQRn?=
 =?us-ascii?Q?AAMi8fFKBKOd60Xb5R/AacGXveAs/EPRsJRgZ3fW/s7u5wu2oZafIC8AXbWA?=
 =?us-ascii?Q?s6+py1VF3l36h6A06mNPPi/Um5Iiv6e7BU/3vmWcZcBlRZs6qzIHgLacvqk0?=
 =?us-ascii?Q?N+98lwmuvjGSQCWDgpwOmCi5eLH39H3DtlDRNa8v3Mf+H+n2Rrbg7T7FBpio?=
 =?us-ascii?Q?SzPaN84h9ccFXzViLhGsBcbpAULR++oqgMZI6+ywa3u+bI6gKzNZxbtaZdlP?=
 =?us-ascii?Q?PkJv4trF96mkmWqX7mvqnW8W3lrUVF/q1d8MljVMbRWINjRFt7v71QMuV9vv?=
 =?us-ascii?Q?qKiGigEuq6bwrrLTaxMecmkzSFr3lZEo/Be7kOtKgcSLKrG6Qu/i6+iF39UM?=
 =?us-ascii?Q?26BATS9OrW/iBgryEbEuifrTRh3Sg0z/N95Q7wQa/OGmK6IF0z4PtOuACESq?=
 =?us-ascii?Q?ie+/95xTQaW6FumCWE1aQRopZzHOBuNVSSmvGq/B6f4U/XKCors/C9Wl/2MZ?=
 =?us-ascii?Q?WkcUHOXJ0HDHD1bA0FhukR7AE5kcQJsUTsQJ8HiVnD7Jyl8q3WH67jiEzQQG?=
 =?us-ascii?Q?9IAfKO5lR2kKVPetL8M0LS88Vcfv0Gu3cfbiti3J3825N1tVZA3bKOdPmcIq?=
 =?us-ascii?Q?LazK8RCAKO4+ek0YDUVyTtKD8Oht8jCdXMTaNXEpqiyF34B3tKaVSUSRFxUD?=
 =?us-ascii?Q?tzzVsywiUvZYCnxIP/NonRiauscAmm4yyl5fT3aPurlnj3uVtykp98X7zS9w?=
 =?us-ascii?Q?c07NQlwG+sXidyCiL4b/g9370jzTd5042lNwcE/RbVvXaYGR1IA35wnTWemr?=
 =?us-ascii?Q?E1wc7GjnaIarqFxtZwIuG6nCfIRRHCA6BxVw4vxe66F4qEL/qHbnNBb4N9y2?=
 =?us-ascii?Q?tG93gTg6dXj/DIgXkt3/mmUgF/wgJxqc1vW/4PS5TFEiLtya4MfvE2g/GiJr?=
 =?us-ascii?Q?fXHN6/orKHcro0PnO400XbAtWyclUy0w96bh7j69uV5QZtGzAwuTm1t1gZss?=
 =?us-ascii?Q?vA8w2wxic7aPuc3Ji+qiVJY/bOwHy1l3jPulVyE5LNjewraUAZVHWG3B+vsz?=
 =?us-ascii?Q?Fxw1rFNmqkGD53ZB21Z47qLiH1lI1iFBek+k8Xgsos2SnZbGXbEEhIq4YDvp?=
 =?us-ascii?Q?j8Bn5BtfF7vTzizrEB2gsDpxw7NEkJx5mmhJ4bz3yR1/BouN+Q2fueS86Oei?=
 =?us-ascii?Q?rsu81EZ6iXGxG+XirOxoO6xBVn5oG7fnHgkbEfMJJCbOU2ouJWHslk9vdmZg?=
 =?us-ascii?Q?6kF9fU/Bybe9wbxnH/C0hq0yCztoedmhIJEYhVx3Z9W3+B2gkcUCaOJI8YkH?=
 =?us-ascii?Q?uqnuf5fdX/cP4v2NsD84DnriHeCFMLCXRUtL71RNIYjCebvh3kCwUjS7j8wJ?=
 =?us-ascii?Q?qLkPCwGawTOR/FZKIj1lrgc9BsbvndM4c21vTSPbTvnk1dpGUIqzeuxllpPh?=
 =?us-ascii?Q?rjTxjnTxykCTpEwWxqmYvgN8IedL+2xRCHeG+j/8v2kLcgFkB7Q9uZuYOJZ8?=
 =?us-ascii?Q?fVTuSclD/GAQqv7ZOX5ZKfQyRNEyXCKEvmsq6d/gy8efvmbkXHPQANm/8qkv?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a69c140-e92d-4faa-4875-08dc1230ea11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 23:07:27.6656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csYfwPjlGWrWMJJW3HuRfoeprwe2+4Wt5IkoscHNVBUJLDtf75uxdb6z83r3BGJ23oPmM9Ci1rOR5ehjxAeREg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
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

On Wed, Jan 10, 2024 at 08:59:50PM +0100, Michal Wajdeczko wrote:
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
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 72 +++++++++++++++++++++-------------
>  1 file changed, 44 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c29f095aa1b9..d6b7020a2d2f 100644
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
> +static u32 msg_len_to_hxg(u32 len)

msg_len_to_hxg_len?

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
> +	const u32 *hxg = msg_to_hxg(msg);

Some places do:
const u32 *hxg = msg_to_hxg(msg);

Others do:
u32 *hxg = msg_to_hxg(msg);

I do not see any reason why we have 2 different conventions.

Everything else LGTM.

Matt

> +	u32 hxg_len = msg_len_to_hxg(len);
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
> +	const u32 *hxg = msg_to_hxg(msg);
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
> +	u32 hxg_len = msg_len_to_hxg(len);
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
> +	u32 hxg_len = msg_len_to_hxg(len);
> +	u32 *hxg = msg_to_hxg(msg);
> +	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
> +	u32 *payload = hxg + GUC_HXG_MSG_MIN_LEN;
> +	u32 adj_len = hxg_len - GUC_HXG_MSG_MIN_LEN;
>  	int ret = 0;
>  
>  	switch (action) {
> 
> base-commit: bb9e8031d2feb59becdea41e54e62f1bc47f3ef9
> -- 
> 2.25.1
> 
