Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FB0C2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 20:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E1D10E4DF;
	Mon, 17 Jun 2024 20:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9U8YsoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7428010E4DF
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 20:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718655188; x=1750191188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sWiR7x6nGbXKAYGDyt/RtgbcB/2FZmISw3SQBOBQPCc=;
 b=c9U8YsoITdefZdh3TxB1bOgSvot84LoHHw6CxZgkU8Ra7QdbIqcvWYJS
 3QCTm/QafN+JlvXxL9su4XGBhZW93FeBLsLLO1M6fB62gC3Bvf5cYls+1
 nONw9hgO/SzsTx/1+8jQfLTW9v8oax17VSr0OmAAolwCKPJrT7oDgUFDU
 dGwQQ+17vilMC6ieYpFAE4bxneACvpIjj9urJqaLedEYjzrTeFaxgOCEN
 DaFKUW4QFI53tC5YLwEQpVMvMuy3+PRvTKRsifW9DbaGiKOSAf/cMc2Fw
 4xkRS+5htmhTD99BpAUlCpxG6AuDVGCAC5doiFBmt/WoVvNC76dA/SIeS A==;
X-CSE-ConnectionGUID: 79c/ex54RGSk0Lg5jvu5pw==
X-CSE-MsgGUID: Vg5K0YIMSqCC9fH/hcCzaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26899500"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26899500"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 13:13:08 -0700
X-CSE-ConnectionGUID: KVZe+HeVQ8CQO/Ho3vN88Q==
X-CSE-MsgGUID: 9geQ5Za/S7+yVJ31zQYLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41238215"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 13:13:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 13:13:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 13:13:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 13:13:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 13:13:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ND/wA8vGxS2O3P0V6879vuDQi9yIOUzspJXz82oxzlOgDmt0OGOawljvjP3cRT7X0Vl2EhFJo67d5C66MxPDJDSeS4/wWKbCra1ACFnxkQEmzWjoSqbBn29KEQ2vxCOU2xB+E8A8JGWg/zJGC3yWZmbkgULj+giYJte/ipMvID800w/YUrZ24AWdtS4tDqB4uv+uce2arXxZGIlvpALIsvL09uo5DB3XK3Pup/pJzn4ycWuFtbLJz9R75kFcNVu2E6vGQrakbMrVqGTpxXHgAXwhSCSecD1qfIdzLXMJRy300lIg7+KcKDt1lgnGaD9Pezq3aGJ87uOZSCC9YP/iMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BpKsAYhPTaMfBkrLXt77PMJ21TjdNyZSoQHJ8QPN20=;
 b=a9JyR4cWF0oUQSy8oYTVJolGH+XN2FXpxqMiVPOqi5rR5LabeSsCIS50u2bAUl/i2QkRbaTFyD2ZSNHifeIZAyF5C09zNqQYZCksNsAcd80VHQwtRWz87lsQ1rXXfsUlF1+u08ja7C1GZqFBATIIWgJkQi61sDFjg+5U+7ln9xJupOUEhnbDJwdIxbGIFwR91Ux0mlC95ZRWFKFGHjZsBk3Lr4BTdMiA+iW6P43GeQo5a8H2Jxzabyjjg6fpFuZqrlNZ/NAP6ugQ6LuglQt1t7hZHa8d1uSQOtWp4uc1OQApnzfRzn13ZQMQ/H8m0v5AkNKzgnub2XFdYnbGHW060Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 20:13:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 20:13:04 +0000
Date: Mon, 17 Jun 2024 15:13:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/rtp: Add match on any GT
Message-ID: <vlvxbq7c2ekqp73yn55zpexfed2jjb5rre6ymrzttnh6a5ufm5@2k7vrklbvpc6>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
 <20240617182518.280975-5-lucas.demarchi@intel.com>
 <20240617192037.GI2905419@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240617192037.GI2905419@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:303:83::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: c66bc0bb-93c0-411a-f31f-08dc8f09e528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xz3heNOqUZAsD7/C9VIziKy6+18pcLfEA1+dpceGCrCc72aeXkA8y4yYTevE?=
 =?us-ascii?Q?UbCwPiLoas+7epXsTHqLWna+1pfpUBq6iVajZlsKHukV5+EMF/awTOWnS2Db?=
 =?us-ascii?Q?qmePD0a68F+MmWcqT7perNHaZl6jOdRYTVyOj7/+GA8/k0i/hZyo+l93lE65?=
 =?us-ascii?Q?9LNDmdslZ2HrbtgeASLIvmsPq/Nu7rLzRYXdEUAdSW140252Lg9SwUKvJroa?=
 =?us-ascii?Q?oct2rzNIYN6cRQLEuU6Br7/FwF0i21YuARiETchi5r9c+Bue71Xlw0ooQ5yr?=
 =?us-ascii?Q?hMh6/3r+m3dzDD4CAcjNMplgN0JOJ/75h9u6x9lSLetLnlrjSKD5lCJK5wV3?=
 =?us-ascii?Q?7Eol9b+d4yvLxfSIVIbP56NwJItoDDn1D6ZKC0G/zfNLo6MCToKcYW1rnURl?=
 =?us-ascii?Q?RPrUYEInThAKoy8hKTMrNdKl1eMrBJ1emH1JPpk293RV7DGYRuOEivATqhH7?=
 =?us-ascii?Q?F1qxJ2n49fypx23xMDki/wngdKCl6R+DQDAvgz1bt30DMC3SSrZBGf2md2Ah?=
 =?us-ascii?Q?eRBG/GvJz3MbvFippj2IOqaIFrl3LP2InOlmXz3TUN6Ozs5jbGhk+TLcqvyB?=
 =?us-ascii?Q?YsHVc6LCTEUvstedvc6jNUolyjXSpwTIMYsQub5yvD8G9TUehg9UAj671sVO?=
 =?us-ascii?Q?Dw5h5rEyXLCaRr+la2b3DqXEnKrZ7Ov9LhEcy3KPn1+Mrx8CDyfJSq/yyQff?=
 =?us-ascii?Q?bEX+HQ9ULSaqJpr2Sk//TnmWT5oVJbpJOo5JOB1bdEgCfXmHMTwSwAEUJvbs?=
 =?us-ascii?Q?1dcZj/kAtmiIjkyvMpX1jnkCfY0z8BrJu8scSYRx0O+IJbq+Zp4+elxiakL/?=
 =?us-ascii?Q?vlLU6KlHekH2lEo8UAlVAo1tZwEgFst21GZTax26htkcP85f2w7b1UlPcVxg?=
 =?us-ascii?Q?5k4S522Tdrcywi4d6O68Du2CYU/jqQkqmwC4EThzLqMUhsKol7DKdQpGml1n?=
 =?us-ascii?Q?eKjo9AQV+ZpEWwdD2m8vGljT7sbo96J2eZMoBuFp605yq3dJYRTzB5zCklgf?=
 =?us-ascii?Q?2Bbo60BBd//6g9viF+VkjtpeppsHHhQ1GkgT5TXT7XGbeUbQohcbYzEVGWQv?=
 =?us-ascii?Q?TYFJWjXij+PqNaihQqPbKe4j/4VHyHcqevKJ+h4dIQA8aQvyB6T+6TEt+J6t?=
 =?us-ascii?Q?m62OGExdTq5h7sYDQWJzLyft9PHUOobctkmVGI+HvGTUAABDlCs3aA9K86Pw?=
 =?us-ascii?Q?GbAThJvgS+3XDIG7htDw2T89eu+eObl9KLJX6KkWorcsNDv2kWCr8XOVz/hc?=
 =?us-ascii?Q?fUwfMoFn1fJz2GvTrrZc3lIy7kgSPNsyuTpZzn/HoMaG9mV5BnUUH/zpA6aF?=
 =?us-ascii?Q?9szIKsqyN5arBHLhoCxJ8+rZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5cI8UXgL+X144HzoPs788i+3m7Sg1cWUmSRpHCH68RPvpTkWRBRApFRynC7J?=
 =?us-ascii?Q?GFM0vF0QqCS7e2z/Nd0NNr9O8dtWcWAOSB5KeRpqUgbXaydIzhNLQg5kq+nM?=
 =?us-ascii?Q?WMZMG9oY9sJaUBpBfxfprkw/MrnswCAikdDCwdzPlmprk/HA+25WWBVV5kBf?=
 =?us-ascii?Q?Vdvt2AvFiKD+Zn1MWQ9y4OYRYK6XLAu3lLyIL/RjOJqtFt9Y958FTwMDwc8n?=
 =?us-ascii?Q?eGhGgsNm/Xr7L/1+H0V0E3WHrO9CpeADtcn441iJH03XTLz6z1S3EdBP+9wi?=
 =?us-ascii?Q?i7BEz6U4uHeKx3qgLnUn2hF3hCmV5GmyuFleaqG+LhCxUwtTOcxTX5JfgiJM?=
 =?us-ascii?Q?x/5bdQiuI/YrNA3DPWA6pP/AkE5siVb5BFpfsXtbcFrJ4ARzS2gYjGNoPdXY?=
 =?us-ascii?Q?abqaTesgPL9ypMw3MxhQzfgOqx00a5NrkEbnRLxIpGglJ/sEewxfYZVEOCdZ?=
 =?us-ascii?Q?js1RkfqJqHWz8V3tXfSb5rd88UBDkRIdEMKFI/61w0XTtJzJ/6/VkKVIVpaq?=
 =?us-ascii?Q?T0sSY3DUjYgTwIPoy/k/2xeXcjb89ccfxKfax6VNwOyFlbNXeH1PZSvhZ3ox?=
 =?us-ascii?Q?QKY9yOEg9kixQjcnnjovTp8lEXjojOgTMbZJ1zi7amN6zFWOYaPa2oErJ5gU?=
 =?us-ascii?Q?pNaUtnOIHE+JRon7+CBBdGqN6oxZaCpRyKe0/jQ0Q0w2ONAX1KHFiCVHcvLX?=
 =?us-ascii?Q?mYNbVU1ukrvL+DS1f5cNua8eWatBOP1jev4gMNxG5yeKSWvkW5ZFjWneGZ/b?=
 =?us-ascii?Q?fUOlZ/3V+IwqdP0x4Fl94Gh5eCt4FvIAxWWLoB+N2WC4fve8X43rGX5YOJnX?=
 =?us-ascii?Q?jlmYoxGVIxRDVhXhe6eTfbdzPwRRoTk79/FAYSQ5TrUi6D1Xed489j8gG4R4?=
 =?us-ascii?Q?tmf8Gy+L18DnQi25aWJboGJMaIAphQAor+pqzc7dtoy+GmT1jl8kktvAGKdq?=
 =?us-ascii?Q?A8On8Am7i74WODdgayomkAyyI39UZaxpOVTW2rf/AwXQXmufCdJ49krm52lO?=
 =?us-ascii?Q?uHjBtjkksWsB3ue90h7kvZGrN8UPeE5YEa4NtrbPtZr5ceeaF3zQc0dmAThv?=
 =?us-ascii?Q?peT02dw6hdVNiipWapeMAnPW4unADTY4bW9jj6R6SNncVy+HdFcZczzVeFA6?=
 =?us-ascii?Q?tg3idSIz45oXnma+iVxhnoc60XhgyWfMmKDIfGykT3Wi6r+lr8u2SqQKG95/?=
 =?us-ascii?Q?F1dt63jxJlckZKzDhRJmJmh72OoZKqw79yGf6BOyeaOGBMy0nFYjdofXmnuB?=
 =?us-ascii?Q?LktK6ptE7MwFIzK+22Aki3bJqfzaWhWy9pZjQhNY9MGD2AOIxsXwgU9yB7sC?=
 =?us-ascii?Q?fhuMymguM+LlePHAv7Jo0AZpzyEtLg6J2mhGethb4FJJT3JX4cNtiJ9esLLc?=
 =?us-ascii?Q?nE3y14u7eh7rksO7SyGNxAHIVtyAlHX65hE25vn7+pODzExvv82pe6zSZSdz?=
 =?us-ascii?Q?SeFR3ITcmVLWi8hJ7fRdd6cjTPeFP3U1/q/F85B8KernojC/DsVr7NZNQGw9?=
 =?us-ascii?Q?HxigKWqZwVhO8U812zJdFIbZ4cNmblsDwjexIX23jATg3fowAfxJknzLKL5N?=
 =?us-ascii?Q?d4DX9itrta9kAQmxJyZN8yMWeG0Wm23Jy4Pvc2KyV2ojpW/tecJFKkrMI8q+?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c66bc0bb-93c0-411a-f31f-08dc8f09e528
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 20:13:04.3356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eKGuGCZKukKYu/K5Qr/fJZnjIi3mrF0bgM8e/33YW+TpRgT3q7Xle8rv/bR4ppyn7R+6IpHQkVu7370AoDAV8XWMtJnn0FWDXpLT9G0d3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 17, 2024 at 12:20:37PM GMT, Matt Roper wrote:
>On Mon, Jun 17, 2024 at 11:25:17AM -0700, Lucas De Marchi wrote:
>> One surprising factor of GRAPHICS_VERSION()/MEDIA_VERSION() matching for
>> people adding new WAs is that it implicitly checks that the
>> graphics/media IP under check is of that specific type and not that the
>> device contains a media/graphics IP of that version. Add a new
>> *_ANY_GT() variant that can be used in that case.
>
>Isn't this patch missing the corresponding update to rule_matches() that
>defines the logic for these new rules?

oops, yes. It looks like I failed to add the appropriate hunk, which
also explains the BAT failures in CI.

Lucas De Marchi

>
>
>Matt
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_rtp.h       | 30 +++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
>>  2 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> index bd5b5ba0fb31..ad446731192c 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> @@ -140,9 +140,23 @@ struct xe_reg_sr;
>>  	  .ver_start = ver_start__, .ver_end = ver_end__, }
>>
>>  /**
>> - * XE_RTP_RULE_MEDIA_VERSION - Create rule matching media version
>> + * XE_RTP_RULE_GRAPHICS_VERSION_ANY_GT - Create rule matching graphics version on any GT
>>   * @ver__: Graphics IP version to match
>>   *
>> + * Like XE_RTP_RULE_GRAPHICS_VERSION, but it matches even if the current GT
>> + * being checked is not of the graphics type. It allows to add RTP entries to
>> + * another GT when the device contains a Graphics IP with that version.
>> + *
>> + * Refer to XE_RTP_RULES() for expected usage.
>> + */
>> +#define XE_RTP_RULE_GRAPHICS_VERSION_ANY_GT(ver__)				\
>> +	{ .match_type = XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,			\
>> +	  .ver_start = ver__, }
>> +
>> +/**
>> + * XE_RTP_RULE_MEDIA_VERSION - Create rule matching media version
>> + * @ver__: Media IP version to match
>> + *
>>   * Refer to XE_RTP_RULES() for expected usage.
>>   */
>>  #define XE_RTP_RULE_MEDIA_VERSION(ver__)					\
>> @@ -163,6 +177,20 @@ struct xe_reg_sr;
>>  	{ .match_type = XE_RTP_MATCH_MEDIA_VERSION_RANGE,			\
>>  	  .ver_start = ver_start__, .ver_end = ver_end__, }
>>
>> +/**
>> + * XE_RTP_RULE_MEDIA_VERSION_ANY_GT - Create rule matching media version on any GT
>> + * @ver__: Media IP version to match
>> + *
>> + * Like XE_RTP_RULE_MEDIA_VERSION, but it matches even if the current GT being
>> + * checked is not of the media type. It allows to add RTP entries to another
>> + * GT when the device contains a Media IP with that version.
>> + *
>> + * Refer to XE_RTP_RULES() for expected usage.
>> + */
>> +#define XE_RTP_RULE_MEDIA_VERSION_ANY_GT(ver__)					\
>> +	{ .match_type = XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,			\
>> +	  .ver_start = ver__, }
>> +
>>  /**
>>   * XE_RTP_RULE_IS_INTEGRATED - Create a rule matching integrated graphics devices
>>   *
>> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>> index 10150bc22ccd..1b76b947c706 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>> @@ -42,9 +42,11 @@ enum {
>>  	XE_RTP_MATCH_SUBPLATFORM,
>>  	XE_RTP_MATCH_GRAPHICS_VERSION,
>>  	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
>> +	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
>>  	XE_RTP_MATCH_GRAPHICS_STEP,
>>  	XE_RTP_MATCH_MEDIA_VERSION,
>>  	XE_RTP_MATCH_MEDIA_VERSION_RANGE,
>> +	XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,
>>  	XE_RTP_MATCH_MEDIA_STEP,
>>  	XE_RTP_MATCH_INTEGRATED,
>>  	XE_RTP_MATCH_DISCRETE,
>> --
>> 2.43.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
