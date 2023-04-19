Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769EBC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 22:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F98510E037;
	Wed, 19 Apr 2023 22:53:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA0010E037
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 22:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681944828; x=1713480828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q0Dx43nGM+0Gr2xBQ2mdZe7rwoDFk46XBmSN3rZzxm0=;
 b=Xunhm22zs7ZXrF8JcW/CKFy5ql7Z6Pescdxyxt1CRwE3a1NgxwqYD0DH
 ukqTEplK1R7+Bf05OE7TsCGUd+5W0twRn8hN7igo9XUpQNHrS53Rt7J2h
 5sGR2xVkbIPMo3KgDyML0QtvtkhUVvFcRgeCXCcz4EWwwHqKlWEOgbL5k
 27KXeK794b+yZGmwErcl89cfphAjcWJK+vVZRKFuen4VNjaGItYBlgjLY
 7Se3ZwgTi+cLa4jY3uwhUOksQlXS2dFgjxKPK4Zxlw0h5FyF4Wm9yFMCv
 uUX16UrlubC6bdH/71e6OM2kz7VFNbxpy+ZmH3ZxHsAg0hNxGK16fA6lY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344329762"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="344329762"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685123588"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="685123588"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2023 15:53:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 15:53:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 15:53:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 15:53:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 15:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm93mfXTVKxfsJspvmjsYsH8qX0mdAIMlM2mRupncn4eFOZlbHfXfpn8UFVEJ+R9Kc3I4fcf1OwXGB4BwAfAl6s4iqj9jRNLjZvkjgnT9yKM312KFGUcv1ZzXKLfgoEBqZx9trfvEbMKsIy2g4ErGCj4Ef+p0PD7xNnglBjmF38YtTT0B3YqUxIYA+Zft5TcAEXS7xQ/HGVKn5q1zvuxsx0MK5DYyrghpDaGPNvL0IDZca/4bzSvtP8ZIQ6TMaWcuieDNea8MCluAa0fL7qnzssHlaSaC76MWO3aZSqVj9QlunJ1Y0YKytSIZUD5W9yoGFqmHcQW5ebxb6AYmtpkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfC8k2KOq4kQbrn4bXle/x5nSWLP38lq/dxytFqOL50=;
 b=SplToQO+IkW3x7AG39NqDYIGR4Jlz1lADnVplZEzHn30+3OV4+r+Q1yR5BzHzJTQ1vNeb9y9U0FlUi54fT66XlIoP4E7SslQZDyXccyEOiwklF9MJuZhmmnVqgqKN59gyN4xmyDtwFnMgjIrHDykQtQOUGX1JYx0uew13O+x28OaleZwzcX/A+Ftw1t35Fpi75mo/Q44jo8ljxBa94qo5+1Lpei/QRC6txwAtWIl1SFXGehUNjItgvSZV4q5Mfy6RxweVuzmwa6HySh9H7zpQJH5TGaz50J+WwqKHDC+0kmOhG0l9gtNhPFB86x0SD0kNi6iecMP6eEi+JYF1T2M7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by DM4PR11MB5437.namprd11.prod.outlook.com (2603:10b6:5:398::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 22:53:25 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::4c7:f160:a73c:86d7]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::4c7:f160:a73c:86d7%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 22:53:25 +0000
Date: Wed, 19 Apr 2023 15:53:20 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <lucas.demarchi@intel.com>
Message-ID: <ZEBw4C7nbqetDrIc@msatwood-mobl>
References: <20230419224909.4000920-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230419224909.4000920-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|DM4PR11MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: c506e481-867e-4890-cae6-08db4128e22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k6FYmKMWHdx8tb69GTS9Sd91wEexQdoJNK5COEV7JFQzvs5aVM1uKnkYUlWoEexj4rp3wHI/ItHmRH6lZ/Z3j81ME89saIrBUci2zzHoyuy4RK/0upb8gNRSut0mQj8YGqLa1HFyFE6IpxnEq7Y7PCIKmVMX36EUdYhleuSn2DOatFCqPHu2lDD+QFWEoLyKLrOA/SxUTp5PSjs4fdMmiBgbnKi9lGZ0I3MY+37tEab1mdwJHCWAIY9nk34BHcVUcx0VoJ+2hP0ywK9+P8OvCNKoXHF+XlWkUbXC+tAbujZV114gF0seplqvK9XzNxBhSbwoOqANecrXhoyJFRCJs5Sn/3+VilyebxXYtOCBifUsy/b21TATWWPK/XlEvDtiSAWtlMCy1Kx1lonLX3YCnJPm8wj5/f+Jv+2IYxl1+5gRbuSNoN3CYMN/6tN+jGvlKJgeEWIsmZA/OD064CzPoWV54EugOfn7Nx0Bx3rnWqoa41qeaM6OmfVN5puXN2PzZnn/qDxF6rH1gBxrCIkvQCTPFYatLrAoHlJvfv/0/LSRhQ489IeFTgEr7M7MG6bQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(33716001)(83380400001)(5660300002)(38100700002)(8936002)(8676002)(2906002)(6666004)(107886003)(6636002)(478600001)(6486002)(316002)(26005)(6506007)(6512007)(4326008)(82960400001)(41300700001)(66556008)(66476007)(66946007)(86362001)(9686003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NklLRDhLTXJnamU2TEdWdEpWeGswRmoya0M0OHQvYTlJWnA2Q1pPMkY1aGcv?=
 =?utf-8?B?cGF1T0dsU25rR1FXVlY2NEpqR0xiK1BMQ3c4MWJJVzRVVjMvcXorTFBCVnhq?=
 =?utf-8?B?eEY3NEVob1MwQzBWTnFEbUNSYTQxOUZrYlkvdjJBUW0rN29rWXhJVTYxdUhk?=
 =?utf-8?B?c3NJbTRQREhUeGtHMU40b0UvNDVRSElEYWkzaUozdDM0cW9BZk0rQmxwREV0?=
 =?utf-8?B?c1RUN2cxRUY3UzJGMUxLL2ZXSWRWbVZSejZEVkRVczJQbTJhT0hKZTRndXha?=
 =?utf-8?B?L1R5R1JrWDRUVlIyRzJ1THQwTWxKUnVFMmNCWVQ3VlhXb1dBWW1ybURQQ1ZW?=
 =?utf-8?B?MVo4bldSSlhuL3NYQURIYUN1T2F0SVY2YXgwekc2MlFNYzRZU2IxKzlxY0Jn?=
 =?utf-8?B?YzBING40TjJPSGRYZnVPbGZrVFVvYnRLWnVIbm4vQnVFZmZjOTJPNnhhN2pM?=
 =?utf-8?B?dlNhNEgzN2c5dEMyc3FVN2NoOWRUMVMrQ29MMHovZE9yMDRJcVI2SXBSSDhm?=
 =?utf-8?B?QVd0d0U2QUY2VHdzK3QyTlRkS21RUmp5M1padlVHVEh3Z25rUkZaeEJGdkVq?=
 =?utf-8?B?VXovUm40OWZnSUlNZ3E4TVFWbkp6a3RsSGJsVklXNU5nSE1BaEo4SC9XTmpS?=
 =?utf-8?B?b1NyR3BkQmFRMkRiSy9Yb2hzMmprR3MrOUMwZnJqZkpGdWhaSVFwK1NTZ0Js?=
 =?utf-8?B?c2hPRjF4bWFnNmZzZXhDd01wREtOVGptbWkvdFdHTG81R3ZPRkhrTyt4QWU2?=
 =?utf-8?B?QjhJdkVRWTNIVWFpN3Vra1JyWEs0cXlZakZZa2p0N2RTTVRMNlRmejVKb1pZ?=
 =?utf-8?B?RUhSTW9lUXFoanZlbnhRR2NqWHVyMFovUCtpVXlOSVFMWDhZcmt2bnBUTDla?=
 =?utf-8?B?dGpkcG9mYlR6Y2t5cXpvVjBlNWZ2UlJQWWl4MmN5Ylh1cG5uTlBBQXdlTWFG?=
 =?utf-8?B?dis5MDdkR256dDZQdHpPdnZvNTQ0ZTJZNlBhSjFGU1hOeUVOUElTRmJGZ1Bu?=
 =?utf-8?B?MzhPUlBVTlVaYVpoTll3ZTJORTBPR0VKV01FOFFUazJWSTUrMnhWN0Z1RmUz?=
 =?utf-8?B?RmtLTkNKcnc0SlIvSjlPVEFZSnhsYmJHZjV3aUNXTE43MU8xZWg1bGd1M3JQ?=
 =?utf-8?B?ZjRwY1lLZTdERno2Vlh1amYwT2d6WXFKRURGQkxyR1hsU09BTzgxWUdhTzRL?=
 =?utf-8?B?NGdzV1VzOXB4Q0NpRkhFQzhzTlg1NTMyMVhmUVF0K1lMVzdETUdGd3VTMTBa?=
 =?utf-8?B?RE5sSUtuLyt6VVVETXZpRzdxYmkzVzZ5WWVhejlEaDFhRnAvRkJvRnZYNW54?=
 =?utf-8?B?ay8yTnN6SjZaWWppUEg3V1pOd09HNXhuSTZyRDhYZTd0SGZjRTRCa2lTdFlQ?=
 =?utf-8?B?N3lSUGFWdGw2dmgzdFIxb3dhNHE3T0hvVE1jbC95Z2dtclBZYUVKRXZyajV2?=
 =?utf-8?B?Y0xUeW1YM3hTa0I4cUZNSElTSk01R3NQWlZXVWJ4RmZUZmhHcHl5ZmFwUXhl?=
 =?utf-8?B?QUF1d09qQkI4VXVTKzlEUEsxSHZZaDcwZThHMEQ5bzBIM2Z6ZGxuMWJZY29I?=
 =?utf-8?B?eDB6TXdobEd5cEhaNGloa2RObDZEVUpYK0hUeFFFOHZUV0tESkRTT2phWVJN?=
 =?utf-8?B?N1RFWmF0MXFMZENYSk1PUnl2M3JaN2tQdk1wNEwrR1hrajdiZ2k0MDdFT29M?=
 =?utf-8?B?eHBNa1REdTNQVXorekRUZnZIVU9WV3NJQXA4dC9HQng4c1JvWldrZ3RQZFJX?=
 =?utf-8?B?cXBZa2FSWlluaExZUXh3eUJGck81YW9lQ1NPU2RtcGZ3S2JrZUdsdEJoczlx?=
 =?utf-8?B?M2VtTEdTNmpDM2ljMEFQK056dElQeEU3aGJGYlo1RUg5OE9WaTJIbXVMbEc1?=
 =?utf-8?B?WDBPMk44U1JzcThDWDJxZlhDemV4dmNrTy9uRkcyNzhyN1hKdS9BNmcrb1hI?=
 =?utf-8?B?QkdsaXQ3MDM0aDdwSVVQNW1kbFBxMGthNEdhYlA2RTMwaUdXdmxoak9JRUdG?=
 =?utf-8?B?dzdYUTNpa0V6eWxiT2dtZGNpaXFpL1dLRVFHK3dOU2lRa2lWdEt2QmdyK3M5?=
 =?utf-8?B?ODJmNjhNb1BvY2ZtN0dXTmYzdjhCWGkrTVJKOHdvemd1TmcrckZzRUluZ2d4?=
 =?utf-8?B?WE5CYkVpSERCbGxsR1F6TFdQbS9BWkM5dmhFNDd0Y2NpTWRicTIxQ2VRM2RE?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c506e481-867e-4890-cae6-08db4128e22e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 22:53:25.6806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FflYI7ieij9qQc1T7w1dA6/xGrxd1K3Tz5OXA2jtMdO337OSHOQ1Oz9tkqzyqDW8fjgaaZBUpGQOnEisyZhfxl+IJCEtebITBUXC87Qa9ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/sr: Apply masked registers properly
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:49:09PM -0700, Matt Roper wrote:
> The 'clear' field for register save/restore entries was being placed in
> the value bits of the register rather than the mask bits; make sure it
> gets shifted into the mask bits.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
tested this, fixes the following behavior:
Before
[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20ec] = 0x00000002
After
[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20ec] = 0x00020002

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index feed87109e93..f77203b32026 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -150,7 +150,7 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
>  	 * supposed to set all bits.
>  	 */
>  	if (entry->masked_reg)
> -		val = (entry->clr_bits ?: entry->set_bits << 16);
> +		val = (entry->clr_bits ?: entry->set_bits) << 16;
>  	else if (entry->clr_bits + 1)
>  		val = (entry->reg_type == XE_RTP_REG_MCR ?
>  		       xe_gt_mcr_unicast_read_any(gt, MCR_REG(reg)) :
> -- 
> 2.40.0
> 
