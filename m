Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C71C001E0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 18:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D6188867;
	Mon, 31 Jul 2023 18:08:26 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149AD88867
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 18:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690826905; x=1722362905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=chH5P/LQgHRmHeQioK1KS0uHBDu2ZYWDHG+zHTFCj2A=;
 b=OOivPILq6Js6v//vT+ySGuSDKDMuF/Wjv6NZIflPAtxZ7HgNyjVezmj4
 ik11IpV4YJudlMYE81JBZX6DPu6ygmoBEnBr2SN/8jxbv5Jws5dUfoYDx
 huO8RAn8kanj6VIPXFx93akwlrnayrjT76KrKfEo3zsxQEujJkIkRmg0l
 8fWtippQzhuZm+y1YpXKeAGMk+b09ALzxwC1sImRd1/4S9MB5xgpA4e+S
 47MaRgHDu8aXIjtFlVFj3STu+D96FkcH3jrPcwKGZPB+4/D25y5U+ovaQ
 mi5L3Eo+ayHJjsUZCGTQZHQ87UaLlq4/JER4Ne+2+fxuM2aIQC+JfsNV/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348691443"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="348691443"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 11:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="678418409"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="678418409"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 31 Jul 2023 11:08:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 11:08:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 11:08:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 11:08:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 11:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLptkZuFg7ljbVxs8ewPfQarv7c2L1gIGM/N3uvrjB8xmE7MD1hDhfOd8mWXOsNFTnGlf2yFhypSwUmoMLGp3xc9xp3ewv4hfptqlC3KO3vYJhmMUvC0pdsxA2yT9aozRXX+piDOj7x7+yhjgNEmIRx4tpQtj3KaciWNKHXOY3lehu2xvC6O+pCUZs1JacBg4jhQiVCfqDkq0e4hiXRssP1WnFJ5MoPoSd/NUodd0TQTK+JwUhuT7yXweFFoCebIU00x6X6hc4sPC5dKSSmEnFEcu5rno62ck2HzK4hazy1XvXO/xV6j5EtTUDrNlm3zgOLYX6eboxnTQ9l7KrjI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xC9CUf8GQG20Cdv3AYNBOxQT3Tudcke9CrcDXSCEjI4=;
 b=ZNVm59PeaXtRdczdXkvAiwmjaoAb9JTd/qieuTyVUpag9ZQpCfaGZgRk3RRvtRI1ceasVSPYCpnN0NN0hOjgPck/fwJbfHaVvyxYgeyJCYpHFIk4Kr+/y3cTjLLDH47Dx7wf8S2N95Y5rfb//j3FS6L61OV7uv3xR2Eutv6HfNvl4eJFwdXZqnIDrunQs99ScoIvvUeAZSS3kXNJkaW1BmdZlwEoZuz8FX0ndw3yWHsSucuWSKYkEUW5qREcwnlXGzML+Tula3KWfspR+64c8UOZN9GTo6iNHZwCTwCygZY+mGVqkOW2/l1CU5VHFM8dvapQZ+1pm9MhIZjoN56hjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6896.namprd11.prod.outlook.com (2603:10b6:806:2bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 18:08:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 18:08:10 +0000
Date: Mon, 31 Jul 2023 14:08:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZMf4hvT3K8GJmNbf@intel.com>
References: <20230729040211.36143-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230729040211.36143-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: d51c0211-ded7-4f45-c931-08db91f11920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QnBjJrzExfYSGzDq+DkPEsfQ7DzMaCJYlb1xIoU/aiNX8K4c1RTmb5bcQ8nT0kPl6tdEXCMWSp7yqVRlHihWWziQvfcuR9UGNURsWS93LOiMqhudv0LKYp4TgZxxzGB3VS5b0xb3/lNa+4sVZu8Zmv2jdvUZCXI64oTLQreuIFU7Wi91sPeRZEFyMy5t3TlDkPYbmvQQmzfZmsiJBUeLjsgWfPmdJE9EQyXy1UeOif64sU1hDuQ3rkUnvuGhTmEvrUxhC8GiFr845RSbWwl8rReeg2ZPeqlFejA7mN5ezdC+AFkAik58bhFfYVa6Y92DdFPv70kTDcbGofm5jbnM+KUKeznQ3GhaIzGwhvW54mDFyeR6eC8uXz/e2Mgx6QH0Y+9WT7isgO6cyn0Wgq8AZ8qimHhoM9zsYQk1ZLaDLhRk5/nb/krL4luk5uEXOBEKromX2cNHwVx9QofWkcTDDR1uKZLjvaMbnobNb/3XVZP9iTSafXEXWu0TcJ34gMX4KyK3XyQ5pG3lLlWf6OmIfZFPd0k0mhb6fm5HZDj9negC1y1BsHvp9PWYpuhitu0BHSnn2w0s0Ani7sNm24qxvX1StrejpvDe6eOHj0wJxg7vYyZc56pEIa5Hl1OhVrs5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(5660300002)(2906002)(66946007)(66556008)(66476007)(6636002)(4326008)(44832011)(41300700001)(37006003)(316002)(2616005)(6486002)(6666004)(8936002)(6506007)(8676002)(26005)(6862004)(186003)(83380400001)(82960400001)(478600001)(38100700002)(36756003)(6512007)(86362001)(70780200001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZb1m7Df8lfjN2ULn6tp5gvsE3IGViNaosWcPbGB8pH0lKZX94Cai6fBISjy?=
 =?us-ascii?Q?NwO608wEjyqCove2s/OcWXeP3Re7Skj8nDgf81gqHiwsPj9YEtDiVY/5DMKl?=
 =?us-ascii?Q?ojbwTZMpz0Sltmsop2Er+An75QJOe3UMcy86rBV7ACBqBroteIr6vW/Jcavw?=
 =?us-ascii?Q?fr70JWpp+5trH+yKDQEZo/azyYCP7eFxK1fmsP3A29db7IhshQCAoK5ZTxqT?=
 =?us-ascii?Q?Y8VBUw0vb/THC3SFzuzUonM90oGTrMsy2Zy3AovXNsmz0WBoZ8llYhaI6ogl?=
 =?us-ascii?Q?bv97GZ9P2Exv+pJ5TcW66OQWs842prB61nzx2WiWHTTcT3ndy5gDMh6c4OCr?=
 =?us-ascii?Q?eJDMCrUhIbqX5wkMONsfzBTsEyHWMve8WVqhc1U/EpZ0fq9rNe2LVreJ0o27?=
 =?us-ascii?Q?XjIY4LxVClER7DXkGwsEpNOpS5+KHdDoDAUQNZrx/E2NVEmthYTfrO1VPX51?=
 =?us-ascii?Q?VUjITOxhau35ufIupNoj5iXAfvmyAINd5B1XvpvcYVfniD2Fzj2BXZP+DrHT?=
 =?us-ascii?Q?NDZE7tZ4D+oFwGsgaZ3oGCGBmQwWhVcnTY/Rb8M2t2UsngT/3hlJGnI+I6Df?=
 =?us-ascii?Q?rTO9GmUY1LYMYDk+Ojuo3vk9umyGUopyaUJ704Vq/GDdzLEaaKH0FFCoFzML?=
 =?us-ascii?Q?Po8IZJIlAmUc5EkbCPARfhFfH2nBtUvPdFjYJfClCSGaVUT+HjZMIhoOdO2/?=
 =?us-ascii?Q?vfO3C2Y7ETVjAcObBhcpNquDV/uTBsOHbNj5B5QiQLd3U2DenqBLYAvYhWD2?=
 =?us-ascii?Q?vwxQFOfiSkXltRR81IyptWCVSc9EOm+oV1YpQxFvCu7PgFFmPQQJEzlbYrzs?=
 =?us-ascii?Q?JOdUzxjIoe3dbZqNznC8oYulMvZ3nE+XR5Epq1hm/vDwJYTrWhLmk3p7+dAK?=
 =?us-ascii?Q?PUFCz3DnVmMbZY1CCbIK5bgEbjdOwdtAmhFRKu/UHRGI3I2r8mEidlzi5A/e?=
 =?us-ascii?Q?hjcAqw81Lc7VS7gc4sjwDxkOCGX6Vkzn32+3XkDAy//qC9haddwLHUpALtpP?=
 =?us-ascii?Q?auGkYLHDSQLArSf7Mwhcm8S7sd6BPVHjF7F9BZ9ddkfvlpTSzGY86MrW5xoO?=
 =?us-ascii?Q?c8dOUFNT2CEaa7JXEHStmvx0bzVvtTTRW/VWlLPXaaUkaJqwe5iaxVCaBKZ2?=
 =?us-ascii?Q?XrBuR8GrWkW+9dtKEGqJlqWe++/5X8Cl83aB3S43k4qbDescKTcOOTql9gk9?=
 =?us-ascii?Q?bHI4x4giY5e80jcvk2Wpv+KxCnkmC7QxpVyZX9Qotxoow/byxQp/tkb2s3Ln?=
 =?us-ascii?Q?stI6RH0hDecDqF9xpKuI+MeaCL7JL3eMk3F4cWT19Kv8V+oFL2SPk1Q4wpyF?=
 =?us-ascii?Q?p8d5hG6Wgiy9XXFiU7QZe7ND/YBDASjvQoZksIPiO3cFSNnuV2QYP9G0Bnso?=
 =?us-ascii?Q?w5Aieby+MdUOKxgOxFQlvQIr/SyRXiYKeJYMece/uypiLAo68tFiHPNjN9vo?=
 =?us-ascii?Q?uyMl+DAvQ4OjCOHgUD2kd/81SbNftk+1NbRkbq8Xz9QjdLe9waclCxTuApFh?=
 =?us-ascii?Q?qWZgW0HUfJw/nsv4yRxN+cu9euhPDvRuUaNb+ECEyV14k0xO0gPGSDyFBLOa?=
 =?us-ascii?Q?i6FfB2hQ6VboA0S9K2chHOwo4Bn7+R+OLwRg9ORn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d51c0211-ded7-4f45-c931-08db91f11920
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 18:08:10.0892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqurMtblMhtqU1JxUvj8ekbKlmrX4C5wgFuwbHKZD74gnJuIqWpW4t8b/Cvvbuc0+jxz5H2LZCOxiWJ1NLdSXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6896
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: remove header variable from
 parse_g2h_msg
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

On Fri, Jul 28, 2023 at 09:02:11PM -0700, Matthew Brost wrote:
> The header variable is unused, remove it.
> 
> Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d322eadbe75a..6c757efa88b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -829,12 +829,11 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> -	u32 header, hxg, origin, type;
> +	u32 hxg, origin, type;
>  	int ret;
>  
>  	lockdep_assert_held(&ct->lock);
>  
> -	header = msg[0];

Shouldn't we be parsing the header and checking for the len?
against corrupted messages?

something like on i915's intel_guc_ct.c:

  /* message len with header */
        len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) + GUC_CTB_MSG_MIN_LEN;
 	if (unlikely(len > (u32)available)) {
                CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
	                 4, &header,
                         4 * (head + available - 1 > size ?
                              size - head : available - 1), &cmds[head],
	                 4 * (head + available - 1 > size ?
                              available - 1 - size + head : 0), &cmds[0]);
                desc->status |= GUC_CTB_STATUS_UNDERFLOW;
	        goto corrupted;
        }


>  	hxg = msg[1];
>  
>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
> -- 
> 2.34.1
> 
